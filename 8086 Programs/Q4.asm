; String in Reverse Order

.model small
.stack 100h

.data
      msg    db  "Hello AsHim$"      ; The string to reverse
      strlen equ $ - msg             ; Length of the string

.code
main proc
            mov  ax, @data
            mov  ds, ax          ; Initialize the data segment

            mov  si, 0           ; Set SI to point to the start of the string
            mov  cx, strlen      ; Set CX to the string length
            dec  cx              ; Decrease CX by 1 to get the last character index

      ; Loop to push the characters onto the stack in reverse order
      again:
            push [si]            ; Push the character at msg[si] onto the stack
            inc  si              ; Move to the next character
            loop again           ; Repeat until CX reaches 0

      ; Now, pop the characters from the stack and display them
            mov  cx, strlen      ; Set CX to the string length again
            dec  cx              ; Decrease by 1 to start from the last index

      disp: 
            pop  dx              ; Pop the character into DX
            mov  ah, 02h         ; DOS function to display a single character
            int  21h             ; Display the character in DX
            loop disp            ; Repeat until all characters are displayed

      ; Exit the program
            mov  ah, 4Ch
            int  21h
main endp
end main
