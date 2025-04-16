;An array of bytes is stored starting from memory location C301H. Length of this array is stored in memory location C300H. Write an ALP in 8085 to add upper and lower nibble of each byte and store the sum starting from memory location C401H.

LXI H, C300H     ; Load length address
MOV C, M         ; Move length into C (counter)

LXI H, C301H     ; Point to the first byte of array
LXI D, C401H     ; Destination address to store sum of nibbles

NEXT: MOV A, M       ; Get the data byte
     
      ANI 0Fh        ; Mask lower nibble
      MOV B, A       ; Save lower nibble in E

      MOV A, M       ; Restore original byte
      ANI F0h        ; Mask upper nibble
      RLC            ; Shift right 4 times to bring upper nibble to lower
      RLC
      RLC
      RLC
      ADD B          ; Add lower nibble
      STAX D         ; Store result at destination

      INX H          ; Next source byte
      INX D          ; Next destination byte
      DCR C          ; Decrease counter
      JNZ NEXT       ; Repeat for all bytes

HLT
