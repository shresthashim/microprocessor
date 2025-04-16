;Count the even and odd parity numbers of 150 data stored in memory starting from C050H. Store the counts in D000H and D001H respectively.

LXI H, C050H    ; HL points to start of data
MVI C, 96H      ; 150 bytes = 96H (in hex)
MVI D, 00H      ; D = odd parity count
MVI E, 00H      ; E = even parity count

LOOP: MOV A, M      ; Get data from memory
      ADI 00H       ; Refresh flags
      JPE EVEN      ; If even parity, jump to EVEN
      INR D         ; Else, increment odd parity count
      JMP NEXT

EVEN: INR E         ; Increment even parity count

NEXT: INX H         ; Move to next byte
      DCR C         ; Decrease counter
      JNZ LOOP      ; Repeat if C ≠ 0

MOV A, D
STA D000H           ; Store odd parity count

MOV A, E
STA D001H           ; Store even parity count

HLT
