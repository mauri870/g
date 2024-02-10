#include "funcdata.h"
#include "textflag.h"
#include "go_asm.h"

// Macros copied from the runtime
#define	get_tls(r)	MOVQ TLS, r // TLS register, on some architectures it holds the current goroutine pointer
#define	g(r)	0(r)(TLS*1) // get the g structure


// getg returns the current goroutine pointer
TEXT ·getg(SB), NOSPLIT, $0-8
    get_tls(CX)
    MOVQ    g(CX), AX // Move the g pointer to AX
    MOVQ    AX, ret+0(FP) // return the g pointer from the function
    RET
