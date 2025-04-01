; Sort the elements in ascending order

.model small
.stack 100h

.data
    arr  db  5 dup(?)                     ; Array for storing user input
    msg1 db  "Enter 5 elements: $"
    msg2 db  10, 13, "Sorted order: $"    ; Newline before output
    len  equ 5                            ; Number of elements

.code
main proc

                mov  ax, @data
                mov  ds, ax

    ; Display message for input
                mov  ah, 09h
                lea  dx, msg1
                int  21h

    ; Input 5 elements from the user
                mov  cx, len
                lea  bx, arr

    input_loop: 
                mov  ah, 01h          ; Read character
                int  21h
                sub  al, 30h          ; Convert ASCII to number
                mov  [bx], al         ; Store in array
                inc  bx
                loop input_loop

    ; Bubble Sort Implementation
                mov  cx, len          ; Outer loop counter

    outer_loop: 
                dec  cx
                mov  si, 0
                mov  bx, cx

    inner_loop: 
                mov  al, arr[si]      ; Load first element
                mov  ah, arr[si+1]    ; Load next element
                cmp  al, ah
                jbe  no_swap          ; If al <= ah, no need to swap

    ; Swap logic
                mov  arr[si], ah      ; Swap arr[si] with arr[si+1]
                mov  arr[si+1], al

    no_swap:    
                inc  si
                dec  bx
                jnz  inner_loop       ; Continue inner loop

                cmp  cx, 0
                jg   outer_loop       ; Continue outer loop

    ; Display message for sorted array
                mov  ah, 09h
                lea  dx, msg2
                int  21h

    ; Output sorted elements
                mov  cx, len
                lea  bx, arr

    output_loop:
                mov  dl, [bx]
                add  dl, 30h          ; Convert number to ASCII
                mov  ah, 02h
                int  21h

                mov  dl, ' '          ; Print space
                int  21h

                inc  bx
                loop output_loop

    ; Exit program
                mov  ah, 4Ch
                int  21h

main endp
end main
