package hs

/*
#include <hs.h>
*/
import "C"

const (
	// ErrUnknown is an unexpected internal error.
	ErrUnknown Error = C.HS_UNKNOWN_ERROR
)

func init() {
	errorMessages[C.HS_UNKNOWN_ERROR] = "Unexpected internal error."
}
