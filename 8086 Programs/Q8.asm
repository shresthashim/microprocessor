;input the username from the keyboard, compare it with the string "Pokhara", and output whether the username is valid or invalid. 

.model small
.stack 100h

.data
    prompt     db "Enter username: $"
    validMsg   db 0Dh, 0Ah, "The username is valid$"
    invalidMsg db 0Dh, 0Ah, "Invalid username$"
    userInput  db 20, ?, 20 dup(?)                      ; reserve space for 20 characters
    username   db "Pokhara$"                            ; valid username for comparison

.code
main proc
    ; Initialize the data segment
                  mov  ax, @data
                  mov  ds, ax

    ; Display prompt for input
                  mov  ah, 09h
                  lea  dx, prompt
                  int  21h

    ; Read the input username from the user
                  lea  dx, userInput
                  mov  ah, 0Ah
                  int  21h

    ; Initialize registers
                  lea  si, userInput + 2    ; Skip length byte and newline byte
                  lea  di, username         ; Point to the "Pokhara" string
                  mov  cx, 7                ; Length of "Pokhara" string
            

    ; Compare each character
    compare_chars:
                  mov  al, [si]             ; Load current character from user input
                  mov  dl, [di]             ; Load current character from "Pokhara"

    ; Compare characters
                  cmp  al, dl
                  jne  invalid              ; If characters do not match, jump to invalid

    ; Move to the next character
                  inc  si
                  inc  di
                  loop compare_chars        ; Loop until all 7 characters are compared

    ; If all characters match, it is valid
                  jmp  valid                ; If valid, display valid message

    invalid:      
    ; Display invalid username message
                  mov  ah, 09h
                  lea  dx, invalidMsg
                  int  21h
                  jmp  exit_program

    valid:        
    ; Display valid username message
                  mov  ah, 09h
                  lea  dx, validMsg
                  int  21h

    exit_program: 
    ; Exit program
                  mov  ah, 4Ch
                  int  21h

main endp
end main
