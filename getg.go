package main

// g structure copied from runtime.g, with simplified fields
type g struct {
	// padding, this is bad and will probably break in the future if this
	// struct changes in the runtime. This will break on 32-bit systems, I'm assuming uintptr is 8 bytes.
	_padding [152]byte
	goid     int64
}

//go:nosplit
func getg() *g
