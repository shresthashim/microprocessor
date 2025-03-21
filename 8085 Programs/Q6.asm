; QSN: Ten 8-bit numbers stored in memory starting from A000H  
; are copied to A030H if the data is less than 70H and greater than 24H.

LXI H, A000H   ; Load HL with the starting address A000H (source)
LXI D, A030H   ; Load DE with the starting address A030H (destination)
MVI C, 0AH     ; Load C with 10 (0AH) to process 10 numbers

LOOP: MOV A, M  ; Load the number from memory (pointed by HL) into the accumulator
      CPI 24H   ; Compare A with 24H
      JC SKIP   ; If A < 24H, skip copying
      JZ SKIP   ; If A = 24H, skip copying
      CPI 70H   ; Compare A with 70H
      JNC SKIP  ; If A ≥ 70H, skip copying

      STAX D    ; Store A at the memory location pointed by DE
      INX D     ; Increment DE to point to the next destination memory location

SKIP: INX H     ; Increment HL to move to the next source memory location
      DCR C     ; Decrement loop counter
      JNZ LOOP  ; If C ≠ 0, repeat for the next number

HLT             ; Halt execution
