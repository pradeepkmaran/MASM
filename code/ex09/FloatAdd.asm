ASSUME CS:CODE, DS:data

data SEGMENT
    num1    real4  5.5         ; First floating point number
    num2    real4  3.2         ; Second floating point number
    result  real4  ?            ; To store the result
    msg     db 'The result is: $'
data ENDS 

CODE SEGMENT
START: 
    MOV AX, data      ; Load the data segment address into AX
    MOV DS, AX        ; Initialize the data segment register

    ; Perform floating-point addition
    FLD num1          ; Load first number onto FPU stack
    FLD num2          ; Load second number onto FPU stack
    FADD              ; Add the two numbers
    FSTP result       ; Store the result

    ; Display the result message
    LEA DX, msg
    MOV AH, 09h       ; DOS function to display a string
    INT 21h

    ; Convert and display the result (conversion logic needed)
    ; You will need to implement a routine here to convert 'result' to a string

    MOV AH, 4Ch       ; DOS function to terminate the program
    INT 21h           ; Exit program

CODE ENDS
END START
