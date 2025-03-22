; Count the total number of vowels in a string

.model small
.stack 100h

.data
    inputStr db "the quick brown fox $"       ; input string (lowercase only)
    len      dw $ - inputStr -1               ; length of the string
    msg      db 0dh, 0ah, "vowel count: $"    ; output message
    count    db 0                             ; store vowel count

.code
main proc
              mov  ax, @data
              mov  ds, ax

              lea  si, inputStr    ; pointer to string
              mov  cx, len         ; string length
              mov  bl, 0           ; vowel count = 0

    check:    
              mov  al, [si]        ; load character
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
              inc  bl              ; increase vowel count

    next:     
              inc  si
              loop check           ; repeat for all characters

    ; display message
              mov  ah, 09h
              lea  dx, msg
              int  21h

    ; convert count to ascii
              add  bl, 30h         ; convert number to ascii
              mov  dl, bl          ; move count to dl for display
              mov  ah, 02h         ; print character function
              int  21h             ; print vowel count

    ; exit program
              mov  ah, 4ch
              int  21h

main endp
end main
