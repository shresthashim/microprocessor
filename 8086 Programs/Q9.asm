; read password from user and check validation in clear screen

.model small
.stack 100h

.data
    prompt     db "Enter password: $"
    validmsg   db 10, 13, "Valid password$"
    invalidmsg db 10, 13, "Invalid password$"
    inputStr   db 20, ?, 20 dup(?)               ; Reserve space for user input
    actualPass db "ashim$"                       ; Actual password

.code
main proc

    ; Initialize data segment
                 mov  ax, @data
                 mov  ds, ax

    ; clear screen
                 mov  ax, 0600h           ; AH = 06 (scroll up), AL = 00 (attribute: normal text)
                 mov  bh, 02h             ; color
                 mov  cx, 0000h           ; Start of screen (top-left corner)
                 mov  dx, 184fh           ; End of screen (bottom-right corner)
                 int  10h                 ; Call BIOS interrupt 10h to clear screen


    ; Display the prompt
                 mov  ah, 09h
                 lea  dx, prompt
                 int  21h

    ; Read input from the user
                 lea  dx, inputStr
                 mov  ah, 0Ah
                 int  21h

    ; Start comparing the user input with actual password
                 lea  si, inputStr + 2    ; Point to the actual input characters (skip the first byte and second byte)
                 lea  di, actualPass      ; Point to the actual password
                 mov  cx, 5               ; Length of the password

    compare_loop:
                 mov  al, [si]            ; Load the user input character
                 mov  dl, [di]            ; Load the actual password character
                 cmp  al, dl              ; Compare the characters
                 jne  invalid             ; If not equal, jump to invalid

                 inc  si                  ; Move to the next character in input string
                 inc  di                  ; Move to the next character in actual password

                 loop compare_loop        ; Repeat the comparison for the entire password length

    ; If we reach here, the passwords matched
                 jmp  valid

    invalid:     
    ; Display invalid password message
                 mov  ah, 09h
                 lea  dx, invalidmsg
                 int  21h
                 jmp  exit

    valid:       
    ; Display valid password message
                 mov  ah, 09h
                 lea  dx, validmsg
                 int  21h

    exit:        
    ; Exit the program
                 mov  ah, 4Ch
                 int  21h

main endp
end main
