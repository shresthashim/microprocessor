; QSN: Find the largest and smallest byte from 20 bytes stored at C000H.
; Store the largest byte at C020H and the smallest byte at C021H.

LXI H, C000H   ; Load HL with the starting address of the data
MVI C, 14H     ; Load counter with 20 (decimal = 14H)
MOV A, M       ; Load first byte into accumulator
MOV D, A       ; Assume this is the largest number initially
MOV E, A       ; Assume this is the smallest number initially
INX H          ; Move to the next memory location
DCR C          ; Decrement counter as we already read first byte

LOOP: MOV A, M   ; Load the current byte into accumulator

      CMP D      ; Compare with the current largest number
      JNC SKIP1  ; If A ≤ D, skip updating largest
      MOV D, A   ; Update largest number

SKIP1: CMP E     ; Compare with the current smallest number
      JC SKIP2   ; If A < E, update smallest
      MOV E, A   ; Update smallest number

SKIP2: INX H     ; Move to the next memory location
      DCR C      ; Decrement counter
      JNZ LOOP   ; Repeat for all 20 bytes

; Store the results
MOV A, D        ; Load largest number
STA C020H       ; Store it at C020H

MOV A, E        ; Load smallest number
STA C021H       ; Store it at C021H

HLT             ; Halt execution
