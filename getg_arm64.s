#include "funcdata.h"
#include "textflag.h"
#include "go_asm.h"

// getg returns the current goroutine pointer
TEXT ·getg(SB), NOSPLIT, $0-8
    MOVD    g, R6 // Move g pointer to R6 register
    MOVD    R6, ret+0(FP) // return the g pointer from the function
    RET
