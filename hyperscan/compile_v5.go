package hyperscan

import (
	"github.com/izaakschroeder/gohs/internal/hs"
)

const (
	// Combination represents logical combination.
	Combination CompileFlag = hs.Combination
	// Quiet represents don't do any match reporting.
	Quiet CompileFlag = hs.Quiet
)
