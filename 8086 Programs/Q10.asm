; count total number of vowels and digits in a string (similar as Q7.asm)

.model small
.stack 100h

.data
    inputStr     db "th1e232 quick brown fox $"    ; input string (lowercase and with one digit)
    len          dw $-inputStr-1
    msg          db 0dh, 0ah, "Vowel count: $"     ; output message for vowel count
    msg1         db 0dh, 0ah, "Digit count: $"     ; output message for digit count
    count        db 0                              ; store vowel count
    count_digits db 0                              ; store digit count

.code
main proc
    ; Initialize the data segment
              mov ax, @data
              mov ds, ax

    ; Load the address of inputStr into SI and initialize counters
              lea si, inputStr    ; pointer to the string
              mov cx, len
              mov bl, 0           ; vowel count = 0
              mov bh, 0           ; digit count = 0

    check:    
              mov al, [si]        ; load the current character

    ; Check for end of string ($)
              cmp al, '$'
              je  done            ; if we encounter $, go to done

    ; Check for vowels (lowercase)
              cmp al, 'a'
              je  inc_vowel
              cmp al, 'e'
              je  inc_vowel
              cmp al, 'i'
              je  inc_vowel
              cmp al, 'o'
              je  inc_vowel
              cmp al, 'u'
              je  inc_vowel

    ; Check for vowels (uppercase)
              cmp al, 'A'
              je  inc_vowel
              cmp al, 'E'
              je  inc_vowel
              cmp al, 'I'
              je  inc_vowel
              cmp al, 'O'
              je  inc_vowel
              cmp al, 'U'
              je  inc_vowel

    ; Check for digits
              cmp al, '0'
              jb  next_char
              cmp al, '9'
              ja  next_char

    ; If digit, increment digit counter
              inc bh
              jmp next_char

    inc_vowel:
              inc bl              ; increment vowel count

    next_char:
              inc si              ; move to next character
              jmp check           ; repeat loop

    done:     
    ; Display vowel count message
              mov ah, 09h
              lea dx, msg
              int 21h

    ; Convert vowel count to ASCII
              add bl, 30h         ; convert number to ASCII
              mov dl, bl          ; move count to dl for display
              mov ah, 02h         ; function to print character
              int 21h             ; display vowel count

    ; Display digit count message
              mov ah, 09h
              lea dx, msg1
              int 21h

    ; Convert digit count to ASCII
              add bh, 30h         ; convert digit count to ASCII
              mov dl, bh          ; move digit count to dl for display
              mov ah, 02h         ; function to print character
              int 21h             ; display digit count

    ; Exit the program
              mov ah, 4Ch
              int 21h

main endp
end main
