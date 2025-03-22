; Check whether inputted character is a vowel or a consonant.

.model small
.stack 100h
.data
    msg1 db "enter a character: $"
    msg2 db 0dh, 0ah, "the character is a vowel.$"
    msg3 db 0dh, 0ah, "the character is a consonant.$"

.code
main proc
    ; initialize data segment
          mov ax, @data
          mov ds, ax

    ; display prompt message
          mov ah, 09h
          lea dx, msg1
          int 21h

    ; read a character from the user
          mov ah, 01h
          int 21h          ; character is stored in al

    ; check for lowercase vowels
          cmp al, 'a'
          je  vowel
          cmp al, 'e'
          je  vowel
          cmp al, 'i'
          je  vowel
          cmp al, 'o'
          je  vowel
          cmp al, 'u'
          je  vowel

    ; check for uppercase vowels
          cmp al, 'A'
          je  vowel
          cmp al, 'E'
          je  vowel
          cmp al, 'I'
          je  vowel
          cmp al, 'O'
          je  vowel
          cmp al, 'U'
          je  vowel

    ; if not a vowel, it is a consonant
          mov ah, 09h
          lea dx, msg3
          int 21h
          jmp exit

    vowel:
          mov ah, 09h
          lea dx, msg2
          int 21h

    exit: 
          mov ah, 4ch      ; exit program
          int 21h
main endp
end main
