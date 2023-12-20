.ORIG x3100
LEA R2, Num
LDR R4, R2, #0
Loop    ADD R4, R4, #4
        BRn Loop
     TRAP x25
Num .FILL xFFF5
.END