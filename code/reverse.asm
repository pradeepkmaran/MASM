DATA SEGMENT
    ARR DB 1, 2, 3, 4, 5, 6  
    LEN DW 06H                
DATA ENDS

CODE SEGMENT
ASSUME DS:DATA, CS:CODE
START:
        
        MOV AX, DATA
        MOV DS, AX

        MOV SI, 00H
        MOV DI, LEN
        DEC DI

STLP:   
        CMP SI, DI
        JGE EN
        MOV DL, [ARR + SI]   
        MOV DH, [ARR + DI]   
        XCHG DH, DL          
        MOV [ARR + SI], DL   
        MOV [ARR + DI], DH
        INC SI
        DEC DI
        JMP STLP   

EN:
        MOV AH, 4CH          
        INT 21H

CODE ENDS
END START
