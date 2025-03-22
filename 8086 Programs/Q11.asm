; read a string from user and count the total number of vowels (similar as Q7.asm)

.model small
.stack 100h

.data
    prompt   db "Enter a text : $"            ; Input prompt
    inputStr db 20, ?, 20 dup(?)              ; Buffer for input
    msg      db 0dh, 0ah, "vowel count: $"    ; Output message
    count    db 0                             ; Store vowel count

.code
main proc
              mov  ax, @data
              mov  ds, ax

    ; Display prompt
              mov  ah, 09h
              lea  dx, prompt
              int  21h

    ; Read user input
              mov  ah, 0Ah
              lea  dx, inputStr
              int  21h

    ; Get actual length of input
              mov  cl, [inputStr + 1]    ; Load actual input length
              mov  ch, 0                 ; Clear CH to use CX as a counter (now it becomes like mov cx, actualLength)
              lea  si, inputStr + 2      ; Pointer to input string
              mov  bl, 0                 ; Initialize vowel count to 0

    check:    
              mov  al, [si]              ; Load character
              cmp  al, 'a'
              je   inc_count
              cmp  al, 'e'
              je   inc_count
              cmp  al, 'i'
              je   inc_count
              cmp  al, 'o'
              je   inc_count
              cmp  al, 'u'
              je   inc_count

              cmp  al, 'A'
              je   inc_count
              cmp  al, 'E'
              je   inc_count
              cmp  al, 'I'
              je   inc_count
              cmp  al, 'O'
              je   inc_count
              cmp  al, 'U'
              je   inc_count

              jmp  next

    inc_count:
              inc  bl                    ; Increase vowel count

    next:     
              inc  si
              loop check                 ; Repeat for all characters

    ; Display message
              mov  ah, 09h
              lea  dx, msg
              int  21h

    ; Convert count to ASCII
              add  bl, 30h               ; Convert to ASCII
              mov  dl, bl                ; Move count to DL for display
              mov  ah, 02h               ; Print character function
              int  21h                   ; Display vowel count

    ; Exit program
              mov  ah, 4Ch
              int  21h

main endp
end main
