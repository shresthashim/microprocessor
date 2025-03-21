; QSN: Copy data from 7C00H to 7C20H. 
; If D0 = 1 and D1 = 0, copy directly. 
; Otherwise, flip bits D6 and D2 and then copy.

LXI H, 7C00H    ; Load HL pair with the source address (7C00H)
LXI D, 7C20H    ; Load DE pair with the destination address (7C20H)
MVI C, 0AH      ; Initialize loop counter (C) with 10 (for 10 bytes)
