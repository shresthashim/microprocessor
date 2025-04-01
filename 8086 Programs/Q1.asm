; Introduction (Format) of 8086 Program

.model small           ; Use the small memory model (for programs < 64KB)
.stack 100h           ; Allocate 256 bytes for the stack
.data
    msg1 db "HELLO$"  ; Define first string, '$' marks the end for DOS interrupt 09h
    msg2 db "WORLD$"  ; Define second string

.code
main proc far
    ; Set up the Data Segment
    mov ax, @data    ; Load the data segment address into AX
    mov ds, ax       ; Copy AX into DS to set the data segment

    ; Print "HELLO" using DOS interrupt 09h
    lea dx, msg1     ; Load the address of msg1 into DX
    mov ah, 09h      ; DOS function 09h - Print string
    int 21h          ; Call DOS interrupt

    ; Print a New Line (CR + LF) for proper formatting
    mov dl, 13       ; Carriage Return (CR) - Moves cursor to the start of the line
    mov ah, 02h        ; DOS function 02h - Print character
    int 21h          ; Call DOS interrupt

    mov dl, 10       ; Line Feed (LF) - Moves cursor down to the next line
    mov ah, 02h        ; DOS function 02h - Print character
    int 21h          ; Call DOS interrupt

    ; Print "WORLD" using DOS interrupt 09h
    lea dx, msg2     ; Load the address of msg2 into DX
    mov ah, 09h      ; DOS function 09h - Print string
    int 21h          ; Call DOS interrupt

    ; Terminate the program properly
    mov ah, 4Ch      ; DOS function 4Ch - Exit program
    int 21h          ; Call DOS interrupt

main endp
end main             ; End of program, execution starts from "main"
