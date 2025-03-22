; input a string and display words in separate line

.model small
.stack 100h

.data
    inputStr db 100, ?, 100 dup(?)    ; Buffer to store user input (max 100 characters)
    newline  db 0Dh, 0Ah, '$'         ; Newline character for printing

.code
main proc
    ; Initialize data segment
                  mov ax, @data
                  mov ds, ax

    ; Prompt user for input
                  mov ah, 0Ah
                  lea dx, inputStr
                  int 21h

    ; Start processing input
                  lea si, inputStr + 2    ; Move pointer to start of actual input
                  mov ah, 02h             ; Function for printing a character

    print_loop:   
                  mov dl, [si]            ; Load character

                  cmp dl, ' '             ; Check if space
                  je  print_newline       ; If space, go to new line


                  mov ah, 02h
                  int 21h                 ; Print character
                  jmp next_char

    print_newline:
                  lea dx, newline         ; Load newline
                  mov ah, 09h             ; Print string function
                  int 21h

    next_char:    
                  inc si                  ; Move to next character
                  jmp print_loop          ; Repeat loop

    exit_program: 
                  mov ah, 4Ch             ; Exit program
                  int 21h

main endp
end main
