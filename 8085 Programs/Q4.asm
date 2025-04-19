; QSN: Copy data from 7C00H to 7C20H. 
; If D0 = 1 and D1 = 0, copy directly. 
; Otherwise, flip bits D6 and D2 and then copy.

LXI H, 7C00H    ; HL = Source address (7C00H)
LXI D, 7C20H    ; DE = Destination address (7C20H)
MVI C, 0AH      ; C = 10 (loop counter)

NEXT:    
MOV A, M        ; Load byte from memory pointed by HL into A
MOV B, A        ; Store original byte in B for condition check

ANI 03H         ; Mask all bits except D0 and D1 (A = A AND 00000011B)
CPI 01H         ; Check if result is 01 (i.e., D0=1 and D1=0)
JZ COPY_DIRECT  ; If yes, go to direct copy

; Else flip D6 and D2
MOV A, B        ; Restore original byte

XRI 44H         ; XOR with 01000100B to flip D6 and D2

COPY_DIRECT:
STAX D          ; Store A to address pointed by DE

; Increment pointers
INX H           ; Next source byte
INX D           ; Next destination byte
DCR C           ; Decrement counter
JNZ NEXT        ; Loop till C = 0

HLT             ; End of program
