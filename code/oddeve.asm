DATA SEGMENT
    ARR DB 1, 2, 3, 4, 5
    LEN DB 05H
    ODD DB 00H
    EVE DB 00H
DATA ENDS

CODE SEGMENT
ASSUME DS:DATA, CS:CODE
START:
        MOV AX, DATA
        MOV DS, AX

        MOV SI, 0          ; Initialize SI to 0 (index for ARR)
        MOV CL, LEN        ; Load the length of the array into CL
        
LP:
        MOV AL, [ARR + SI] ; Load the current element from ARR into AL
        TEST AL, 1         ; Check if the least significant bit is set (odd)
        JZ JEVE            ; Jump to JEVE if AL is even
        
        ; Increment the odd counter
        INC ODD            ; Increment ODD count
        JMP LPEN           ; Jump to LPEN

JEVE:
        ; Increment the even counter
        INC EVE            ; Increment EVE count
        
LPEN:
        INC SI             ; Move to the next index
        LOOP LP            ; Decrement CL and repeat LP if not zero

        ; Termination
        MOV AX, 4CH     ; DOS interrupt for program termination
        INT 21H
CODE ENDS
END START
