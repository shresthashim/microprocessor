.model small
.stack 100h
.data
    A db "HELLO WORLD$"   ; String must end with '$' for DOS interrupt 09h
.code
main proc far
    mov ax, @data
    mov ds, ax
    
    mov dx, offset A
    mov ah, 09h
    int 21h

    mov ah, 4Ch
    int 21h
main endp
end main
