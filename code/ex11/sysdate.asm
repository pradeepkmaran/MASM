assume cs:code, ds:data
data segment 
    day db ?         ; single byte for day
    month db ?       ; single byte for month
    year dw ?        ; word for year (two bytes)
    rand db ?        ; random 
data ends
code segment
org 0100h
start: 
    mov ax, data
    mov ds, ax
    
    ; Get system date
    mov ah, 2Ah
    int 21h

    ; Store the results
    mov day, dl      ; Day of month
    mov month, dh    ; Month
    mov year, cx     ; Year (1980-2099)
    mov rand, 6bh    ; random number

    ; Exit program
    mov ah, 4Ch
    int 21h
code ends
end start
