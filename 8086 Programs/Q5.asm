; Find smallest from list of 5 elements

.model small
.stack 100h

.data
    arr  db 5, 4, 7, 6, 9  ; Array of 5 elements
    msg  db "Smallest element: $"

.code
main proc

    mov ax, @data          ; Initialize data segment
    mov ds, ax

    lea si, arr            ; Load address of array into SI
    mov cx, 5              ; Loop counter for 5 elements
    mov bl, [si]           ; Assume first element is smallest

arr_loop:
    inc si                 ; Move to next element in the array
    cmp [si], bl           ; Compare current smallest (bl) with the current element
    jge continue_loop      ; If current smallest (bl) >= element, skip
    mov bl, [si]           ; Otherwise, update smallest (bl) with current element

continue_loop:
    loop arr_loop          ; Decrement CX and repeat if CX != 0

    ; Display message
    mov ah, 09h
    lea dx, msg
    int 21h

    ; Convert smallest number to ASCII (bl + 30h)
    add bl, 30h            ; Convert number in bl to its ASCII equivalent

    ; Display smallest number
    mov dl, bl             ; Move smallest element to DL (in ASCII)
    mov ah, 02h            ; DOS function to print a character
    int 21h                ; Print the character

    mov ah, 4Ch            ; Exit program
    int 21h

main endp
end main
