DATA SEGMENT
MESSAGE DB "THIS IS THE STRING$", 0
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA

START: 
    MOV AX, DATA      ; Load the data segment address into AX
    MOV DS, AX        ; Initialize the data segment register

    MOV AH, 09h       ; DOS function to display a string
    MOV DX, OFFSET MESSAGE ; Load the offset address of the message
    INT 21h           ; Call DOS interrupt to display the string

    MOV AH, 4Ch       ; DOS function to terminate the program
    INT 21h           ; Call DOS interrupt to exit

CODE ENDS
END START
