; input 2 decimal numbers and multiply them

.model small
.stack 100h

.data
    msg1      db "Enter first number: $"
    msg2      db 0dh, 0ah, "Enter second number: $"
    resultMsg db 0dh, 0ah, "Multiplication: $"
    result    db ?                                     ; Store multiplication result

.code
main proc
         mov ax, @data
         mov ds, ax

    ; Prompt for first number
         mov ah, 09h
         lea dx, msg1
         int 21h

    ; Read first number
         mov ah, 01h
         int 21h
         sub al, 30h          ; Convert ASCII to decimal
         mov bl, al           ; Store in BL

    ; Prompt for second number
         mov ah, 09h
         lea dx, msg2
         int 21h

    ; Read second number
         mov ah, 01h
         int 21h
         sub al, 30h          ; Convert ASCII to decimal
         mov bh, al           ; Store in BH

    ; Multiply BL * BH
         mov al, bl
         mul bh               ; AL = BL * BH

    ; Convert result to ASCII
         add al, 30h          ; Convert back to ASCII
         mov result, al

    ; Display result message
         mov ah, 09h
         lea dx, resultMsg
         int 21h

    ; Display result
         mov dl, result
         mov ah, 02h
         int 21h

    ; Exit program
         mov ah, 4Ch
         int 21h

main endp
end main
