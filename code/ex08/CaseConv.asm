ASSUME CS:CODE, DS:data

data SEGMENT
    COUNT EQU 10h     ; Number of characters to read
data ENDS 

CODE SEGMENT
START: 
    MOV AX, data      ; Load the data segment address into AX
    MOV DS, AX        ; Initialize the data segment register

    MOV CX, COUNT     ; Set loop counter

L1: 
    MOV AH, 01h       ; DOS function to read a character with echo
    INT 21h           ; AL = input character (ASCII)

    CMP AL, 'a'       ; Compare with 'a' (ASCII 97)
    JL NOT_LOWERCASE  ; If less than 'a', jump
    CMP AL, 'z'       ; Compare with 'z' (ASCII 122)
    JG NOT_LOWERCASE  ; If greater than 'z', jump

    SUB AL, 20h       ; Convert to uppercase (subtract 32)

NOT_LOWERCASE:
    CMP AL, 'A'       ; Compare with 'A' (ASCII 65)
    JL SKIP           ; If less than 'A', skip
    CMP AL, 'Z'       ; Compare with 'Z' (ASCII 90)
    JG SKIP           ; If greater than 'Z', skip

    ; Convert uppercase to lowercase
    ADD AL, 20h       ; Convert to lowercase (add 32)

SKIP:
    MOV AH, 02h       ; DOS function to display a character
    MOV DL, AL        ; Move the character to DL
    INT 21h           ; Display the character
    
    LOOP L1           ; Repeat loop until CX reaches 0

    MOV AH, 4Ch       ; DOS function to terminate the program
    INT 21h           ; Exit program

CODE ENDS
END START
