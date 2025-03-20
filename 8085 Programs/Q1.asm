; QSN: Count the number of 1's in an 8-bit number stored at memory location 2000H

MVI B, 00H   ; Initialize B register to 0 (Counter for 1's)
MVI C, 08H   ; Initialize C register to 8 (Loop counter for 8 bits)

LDA 2000H    ; Load 8-bit number from memory location 2000H into accumulator

BACK: RLC    ; Rotate accumulator left through carry (MSB to Carry)
      JNC SKIP  ; If Carry = 0 (bit was 0), skip incrementing B
      INR B    ; If Carry = 1 (bit was 1), increment B (count of 1s)

SKIP: DCR C   ; Decrement bit count (C)
      JNZ BACK ; If C ≠ 0, repeat for next bit

MOV A, B    ; Move count of 1s from B to A
STA 2001H   ; Store result at memory location 2001H

HLT         ; Halt execution
