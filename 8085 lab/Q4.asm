; Q4: Write an Assembly Program to multiply 05H and 06H. Store the result in F0F1H.

; Clear register A to store sum
MVI A, 00H  ; A ← 00H

; Load 06H into register C (counter)
MVI C, 06H  ; C ← 06H

; Load 05H into register B (multiplicand)
MVI B, 05H  ; B ← 05H

; Loop: Add B to A until counter becomes zero
ADD_LOOP:
    ADD B    ; A ← A + B
    DCR C    ; Decrement counter C
    JNZ ADD_LOOP  ; Repeat until C = 0

; Store the result at memory location F0F1H
STA F0F1H   ; (F0F1H) ← A

; Halt execution
HLT         ; Stop execution
