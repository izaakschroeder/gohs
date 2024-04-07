#!/bin/bash

set -euo pipefail

ROOT=$(realpath "$(dirname "$0")")

cd $ROOT

GOOS="${GOOS:-$(go env GOOS)}"
GOARCH="${GOARCH:-$(go env GOARCH)}"
TAG="${GOOS}-${GOARCH}"
BUILD="${ROOT}/build/${TAG}"
export CROSS_SYS="${ROOT}/dist/${TAG}"
export PKG_CONFIG_LIBDIR="${CROSS_SYS}/usr/lib/pkgconfig:${CROSS_SYS}/usr/share/pkgconfig"
export PKG_CONFIG_DIR=""
export PKG_CONFIG_SYSROOT_DIR="${CROSS_SYS}"

case "${TAG}" in
  darwin-arm64)
    export ZTARGET="aarch64-macos"
    export ZCPU="apple_m2"
    ;;
  darwin-amd64)
    export ZTARGET="x86_64-macos"
    export ZCPU="x86_64_v4"
    ;;
  linux-arm64)
    export ZTARGET="aarch64-linux"
    export ZCPU="neoverse_v1"
    ;;
  linux-amd64)
    export ZTARGET="x86_64-linux"
    export ZCPU="x86_64_v4"
    ;;
  windows-arm64)
    export ZTARGET="aarch64-windows-gnu"
    export ZCPU="neoverse_n1"
    ;;
  windows-amd64)
    export ZTARGET="x86_64-windows-gnu"
    export ZCPU="x86_64_v4"
    ;;
  *)
    exit 1
    ;;
esac

export CC="${ROOT}/bin/zig-cc"
export CXX="${ROOT}/bin/zig-c++"
export AR="${ROOT}/bin/zig-ar"
export RANLIB="${ROOT}/bin/zig-ranlib"

mkdir -p "${BUILD}/boost"
cd "${BUILD}/boost"
cmake \
  "${ROOT}/deps/boost" \
  -DCMAKE_TOOLCHAIN_FILE="${ROOT}/cmake/${TAG}.cmake" \
  -DCMAKE_SIZEOF_VOID_P=8 \
  -DBUILD_SHARED_LIBS=off \
  -DBUILD_STATIC_LIBS=on \
  -DCMAKE_INSTALL_PREFIX=/ \
  -DCMAKE_BUILD_TYPE=Release
make -j3 install DESTDIR="${CROSS_SYS}"

# reset all our patches before applying them
cd ${ROOT}/deps/vectorscan
git checkout -- .

# cross-compiling selects `-mcpu=generic` incorrectly and we can
# generally just do a better job
echo > "${ROOT}/deps/vectorscan/cmake/archdetect.cmake"
# pthreads are not available on windows and we don't need these tools
# and there is no other way to turn them off
echo > "${ROOT}/deps/vectorscan/tools/CMakeLists.txt"
# they forget to set `CMAKE_REQUIRED_FLAGS` back to what it was
# which otherwise clobbers things like PCRE test; I believe this is
# only needed cause we removed `archdetect.cmake`
echo 'set(CMAKE_REQUIRED_FLAGS "${ARCH_C_FLAGS}")' >> "${ROOT}/deps/vectorscan/cmake/cflags-x86.cmake"

# NOTE: -DDCMAKE_C_FLAGS
# the PCRE check is missing `int main` and instead just has `main`
# which causes clang errors; adding `-Wno-implicit-int` fixes

# NOTE: -DSQLITE3_LDFLAGS
# even though SQLite is disabled, `SQLITE3_LDFLAGS` is needed
# because cmake complains a 3 argument function is missing an
# argument because `SQLITE3_LDFLAGS` is the last one and blank
# the actual value of this flag is meaningless

mkdir -p "${BUILD}/vectorscan"
cd "${BUILD}/vectorscan"
cmake  \
  "${ROOT}/deps/vectorscan" \
  -DCMAKE_TOOLCHAIN_FILE="${ROOT}/cmake/${TAG}.cmake" \
  -DSQLITE3_LDFLAGS="-L${CROSS_SYS}/usr/lib" \
  -DTUNE_FLAG="${ZCPU}" \
  -DGNUCC_ARCH="${ZCPU}" \
  -DCMAKE_SIZEOF_VOID_P=8 \
  -DFAT_RUNTIME=off \
  -DBUILD_STATIC_LIBS=on \
  -DCMAKE_CXX_FLAGS='-Wno-unqualified-std-cast-call' \
  -DCMAKE_C_FLAGS='-Wno-implicit-int' \
  -DCMAKE_INSTALL_PREFIX=/ \
  -DBUILD_EXAMPLES=off \
  -DBUILD_BENCHMARKS=off \
  -DPCRE_SOURCE="$ROOT/deps/pcre" \
  -DCMAKE_BUILD_TYPE=Release

make -j3 install DESTDIR="${CROSS_SYS}"

# even though PCRE is built statically it's not an install target for
# some reason so we copy it manually
cp lib/libpcre.a "${CROSS_SYS}/usr/lib/"