
; Program to transfer 200 bytes of data from 8090H to another table
; by exchanging bits D6 and D2 of each byte

LXI H, 8090H      ; Load HL register pair with the starting address of the source table (8090H)
LXI D, 8100H      ; Load DE register pair with the starting address of the destination table (8100H)
MVI C, 0C8H       ; Load counter with 200 (C8H)

TRANSFER_LOOP:
    MOV A, M        ; Load the byte from the source table into accumulator
    RLC             ; Rotate left through carry (shift bits to the left)
    RLC             ; Repeat the RLC operation, now D6 is in carry, and D5 is now in D6
    RLC             ; Now D4 goes to D5, and so on
    RLC             ; Now D3 goes to D4, D2 goes to D3, etc.

    RLC             ; This makes D2 go to D3, and bit D6 from carry should go to D2 (bit 2)

    MOV M, A        ; Store the modified byte at the destination table

    INX H           ; Move to the next source byte
    INX D           ; Move to the next destination byte

    DCR C           ; Decrement the byte counter
    JNZ TRANSFER_LOOP ; If counter is not zero, repeat the transfer

HLT                 ; Halt the program
