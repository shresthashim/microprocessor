; QSN: Find the largest and smallest byte from 20 bytes stored at C050H.
; Store the largest byte at C070H and the smallest byte at C071H.

LXI H, C050H      ; HL points to start of 20 bytes
MVI C, 14H        ; Load counter = 20
MOV A, M          ; Load first byte
MOV D, A          ; Initialize D with first byte (max)
MOV E, A          ; Initialize E with first byte (min)
DCR C             ; Already processed one byte
INX H             ; Move to next byte

NEXT: MOV A, M    ; Load byte from memory
CMP D             ; Compare with current max
JC LOOP1          ; If A < D, skip max update
MOV D, A          ; Update max

LOOP1: CMP E      ; Compare with current min
JNC LOOP2         ; If A >= E, skip min update
MOV E, A          ; Update min

LOOP2: INX H      ; Move to next byte
DCR C             ; Decrement count
JNZ NEXT          ; Loop until 20 bytes are done

MOV A, D
STA C070H         ; Store max at C070H
MOV A, E
STA C071H         ; Store min at C071H
HLT               ; Halt
