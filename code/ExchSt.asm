ASSUME DS:DATASEG, CS:CODESEG

DATASEG SEGMENT
    ARR DB 1, 2, 3, 4, 5, 6  ; The array of bytes
    LEN DB 06H                ; Length of the array
DATASEG ENDS

CODESEG SEGMENT
START:
        ; Set up the data segment
        MOV AX, DATASEG
        MOV DS, AX

        ; Initialize variables
        MOV AL, LEN          ; AL = length of the array
        XOR SI, SI           ; SI = 0, front index

STLP:   
        ; Swap elements from front and back
        MOV DL, [ARR + SI]   ; Load the value from the front of the array
        MOV DH, [ARR + AL - SI - 1]   ; Load the value from the end of the array
        XCHG DH, DL          ; Swap values in registers
        MOV [ARR + SI], DL   ; Store front value back
        MOV [ARR - SI + AL - 1], DH   ; Store back value back

        ; Exit the program
        MOV AH, 4CH          ; DOS interrupt to exit program
        INT 21H

CODESEG ENDS
END START
