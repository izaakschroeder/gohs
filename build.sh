#!/bin/sh

ROOT=$(realpath $(dirname "$0"))
cd $ROOT

echo "$ROOT/deps/pcre"

mkdir build
cd build
cmake  \
  ../deps/vectorscan \
  -DBUILD_STATIC_LIBS=on \
  -DCMAKE_CXX_FLAGS='-Wno-unqualified-std-cast-call' \
  -DCMAKE_INSTALL_PREFIX=/ \
  -DBUILD_EXAMPLES=off \
  -DBUILD_BENCHMARKS=off \
  -DPCRE_SOURCE="$ROOT/deps/pcre" \
  -DCMAKE_BUILD_TYPE=Release

make install DESTDIR=../dist
cp lib/libpcre.a ../dist/usr/lib/