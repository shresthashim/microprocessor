; Program to test whether a number is odd or even and store even numbers starting from memory location C090H.

LXI H, C070H    ; Load HL pair with the starting address of the numbers (C070H)
LXI D, C090H    ; Load DE pair with the starting address of the destination (C090H)

MVI C, 0AH      ; Initialize loop counter (C) with 10 (for 10 numbers)

NEXT:  
    MOV A, M    ; Move the number from memory (pointed by HL) into the accumulator
    ANI 01H     ; AND the accumulator with 01H to check the LSB (Least Significant Bit)
    JZ STORE    ; If LSB is 0 (even number), jump to STORE

    JMP SKIP    ; If LSB is 1 (odd number), skip storing

STORE:  
    MOV A, M    ; Move the number from memory (pointed by HL) into the accumulator
    STAX D      ; Store the value in memory location pointed by DE (C090H onwards)

    INX D       ; Increment the destination address (DE) to point to the next location

SKIP:  
    INX H       ; Increment the source address (HL) to point to the next number
    DCR C       ; Decrement the counter (C)
    JNZ NEXT    ; If counter is not zero, repeat the loop

HLT             ; Halt the program
