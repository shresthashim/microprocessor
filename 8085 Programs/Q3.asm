; QSN: Count the number of bytes greater than 40H and less than 50H in the table 
; starting at memory location XX50H (100 bytes), and display the result at PORT 01H.

LXI H, XX50H        ; Load HL pair with the starting address of the data table (XX50H)
MVI C, 64H          ; Initialize C register to 64H (100 bytes to process)
MVI B, 00H          ; Initialize B register to 0 (counter for the number of valid entries)

NEXT: 
    MOV A, M        ; Load the current byte of data into accumulator A
    CPI 40H         ; Compare A with 40H
    JC SKIP         ; If A < 40H (Carry flag is set), skip to the next byte
    JZ SKIP         ; If A == 40H, skip to the next byte
    CPI 50H         ; Compare A with 50H
    JNC SKIP        ; If A >= 50H (No Carry flag is set), skip to the next byte
    
    INR B           ; Increment B register to count valid entries

SKIP: 
    INX H           ; Move to the next byte in the table (increment HL pair)
    DCR C           ; Decrement C register (bytes left to check)
    JNZ NEXT        ; If C != 0, repeat the process for the next byte

MOV A, B            ; Move the count of valid entries from B register to A register
OUT 01H             ; Output the count to PORT 01H

HLT                 ; Halt the program
