; QSN: Change bit D5 of ten numbers stored at address 7600H  
; if the numbers are larger than or equal to 80H.

LXI H, 7600H  ; Load HL with the starting address 7600H
MVI C, 0AH    ; Load C with 0AH (loop counter for 10 numbers)

LOOP: MOV A, M  ; Move the number from memory (pointed by HL) into the accumulator
      CPI 80H   ; Compare A with 80H (Check if A >= 80H)
      JC SKIP   ; If A < 80H, skip modifying the number

      XRI 20H   ; Toggle bit D5 (XOR with 0010 0000B)
      MOV M, A  ; Store the modified value back to memory

SKIP: INX H     ; Increment HL to point to the next memory location
      DCR C     ; Decrement the loop counter
      JNZ LOOP  ; If C ≠ 0, repeat for the next number

HLT             ; Halt execution
