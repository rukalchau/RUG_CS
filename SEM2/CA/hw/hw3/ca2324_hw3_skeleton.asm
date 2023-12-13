.ORIG x3000			; Program begins here
;-------------
;Instructions: CODE GOES HERE
;-------------
                AND R3, R3, #0
                LD  R1, DEC_6
                LD  R2, DEC_12

DO_WHILE        ADD R3, R3, R2
                ADD R1, R1, #-1
                BRp DO_WHILE

HALT
;---------------	
;Data (.FILL, .STRINGZ, .BLKW)
;---------------
DEC_6   .FILL   #6
DEC_12  .FILL   #12



;---------------	
;END of PROGRAM
;---------------	
.END
