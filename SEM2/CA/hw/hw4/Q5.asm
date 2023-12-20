.ORIG x3000

; Check the value in R4
ADD R4, R4, #0        ; Copy R4 to R0
BRn SUBTRACT          ; If R4 is negative, go to subtraction
BRz ADDITION          ; If R4 is zero, go to addition
BRp FAST_MUL    ; If R4 is positive, go to multiplication

ADDITION
ADD R3, R1, R2        ; R3 = R1 + R2
BR DONE

SUBTRACT
NOT R1, R1            ; Negate R1
ADD R1, R1, #1        ; Add 1 to get two's complement
ADD R3, R2, R1        ; R3 = R2 - R1 (since R1 was negated)
BR DONE

FAST_MUL
AND R0, R0, #15
AND R3 ,R3 ,#0
ADD R0, R0, #8
AND R5, R5, #0
ADD R5, R5, #1
ADD R1, R1, #0
BRn SET_NEG1
PRE_MUL
ADD R2,R2,#0
BRn SET_NEG2
MUL
AND R6, R5, R1
BRnp not_ZERO
ADD R3,R2,R2
ADD R3,R3,R3
not_ZERO
ADD R3,R3,R3
ADD R5,R5,R5
ADD R0,R0,#-1
BRn DONE_MUL
BR MUL


SET_NEG1
NOT R1,R1
AND R7,R7,#0
ADD R7,R7,#-1
BR PRE_MUL

SET_NEG2
NOT R2,R2
NOT R7,R7
BR MUL

DONE_MUL
ADD R7,R7,#0
BRp DONE
NOT R3, R3
BR DONE


DONE
TRAP x25             ; End of Program

.END
