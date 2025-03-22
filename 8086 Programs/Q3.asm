; Convert the inputted-character from lowercase to uppercase.

.model small
.stack 100h

.data
    msg db "Enter a character in lowercase: $"
    msg1 db 0dh, 0ah, "Character in uppercase is: $"
    temp db ?

.code
main proc 
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Display message to enter a character
    mov ah, 09h
    lea dx, msg
    int 21h

    ; Read a character from user input
    mov ah, 01h
    int 21h ; Character is stored in AL register

    mov temp, al  ; Store the character in temp

    ; Display the output message
    mov ah, 09h
    lea dx, msg1
    int 21h

    ; Convert the character from lowercase to uppercase
    sub temp, 32  ; ASCII difference between lowercase and uppercase is 32

    ; Display the uppercase character
    mov dl, temp  ; Load the converted character into DL
    mov ah, 02h   ; Function to display a single character
    int 21h

    ; Exit the program
    mov ah, 4Ch
    int 21h
main endp
end main
