; WAP to transfer data if D4=1 and D2=0 otherwise store FFH

LXI H, 8050H        ; HL = source start address
LXI D, 8060H        ; DE = destination start address
MVI B, 0AH          ; Loop counter = 10 bytes

NEXT: MOV A, M      ; Load byte from source
      ANI 14H       ; Mask D4 and D2 bits
      CPI 10H       ; Check if D4 = 1 and D2 = 0
      JNZ CHANGE    ; If condition fails, go to store FFH

      MOV A, M      ; Reload original data
      JMP STORE

CHANGE: MVI A, FFH  ; Set A = FFH if condition fails

STORE: STAX D        ; Store A into destination
      INX H         ; Move to next source address
      INX D         ; Move to next destination address
      DCR B         ; Decrease counter
      JNZ NEXT      ; Repeat loop

HLT
