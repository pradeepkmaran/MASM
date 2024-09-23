assume cs:code, ds:data
data segment 
    hour db ?          ; single byte for hour
    minute db ?        ; single byte for minute
    second db ?        ; single byte for second
data ends

code segment
org 0100h
start: 
    mov ax, data
    mov ds, ax
    
    ; Get system time
    mov ah, 2Ch
    int 21h

    ; Store the results
    mov hour, ch      ; Hour
    mov minute, cl    ; Minute
    mov second, dh    ; Second

    ; Exit program
    mov ah, 4Ch
    int 21h
code ends
end start
