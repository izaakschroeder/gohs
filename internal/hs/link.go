package hs

/*
#cgo darwin,arm64 LDFLAGS: -L${SRCDIR}/../../dist/darwin-arm64/lib -lhs -lc++ -lc++abi
#cgo darwin,arm64 CFLAGS: -I${SRCDIR}/../../dist/darwin-arm64/include/hs

#cgo darwin,amd64 LDFLAGS: -L${SRCDIR}/../../dist/darwin-amd64/lib -lhs -lc++ -lc++abi
#cgo darwin,amd64 CFLAGS: -I${SRCDIR}/../../dist/darwin-amd64/include/hs

#cgo linux,arm64 LDFLAGS: -L${SRCDIR}/../../dist/linux-arm64/lib -lhs -lc++ -lc++abi
#cgo linux,arm64 CFLAGS: -I${SRCDIR}/../../dist/linux-arm64/include/hs

#cgo linux,amd64 LDFLAGS: -L${SRCDIR}/../../dist/linux-amd64/lib -lhs -lc++ -lc++abi
#cgo linux,amd64 CFLAGS: -I${SRCDIR}/../../dist/linux-amd64/include/hs

#cgo windows,arm64 LDFLAGS: -L${SRCDIR}/../../dist/windows-arm64/lib -lhs -lc++
#cgo windows,arm64 CFLAGS: -I${SRCDIR}/../../dist/windows-arm64/include/hs

#cgo windows,amd64 LDFLAGS: -L${SRCDIR}/../../dist/windows-amd64/lib -lhs -lc++
#cgo windows,amd64 CFLAGS: -I${SRCDIR}/../../dist/windows-amd64/include/hs

*/
import "C"
