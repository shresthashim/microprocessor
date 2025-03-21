; Program to sort 10 bytes of data in memory starting from C000H in descending order

LXI H, C000H    ; Load HL with the starting address of the data
MVI D, 0AH      ; Outer loop counter (10 passes)

OUTER_LOOP: 
    MVI C, 0AH  ; Reset inner loop counter to 10 (9 comparisons)

    LXI H, C000H   ; Reset HL to starting address for the inner loop

INNER_LOOP:   
    MOV A, M       ; Load current data byte into accumulator
    INX H          ; Move to next memory location
    CMP M          ; Compare with next data byte
    JNC SKIP_SWAP  ; If already in correct order (A >= M), skip swapping

    MOV B, M       ; Store next data byte in B
    MOV M, A       ; Swap: Store larger value in next position
    DCX H          ; Move back one position
    MOV M, B       ; Store smaller value in previous position
    INX H          ; Move forward again

SKIP_SWAP:    
    DCR C           ; Decrement inner loop counter
    JNZ INNER_LOOP  ; If inner loop counter not zero, continue sorting

    DCR D           ; Decrement outer loop counter
    JNZ OUTER_LOOP  ; If outer loop counter not zero, repeat sorting pass

HLT              ; Halt execution
