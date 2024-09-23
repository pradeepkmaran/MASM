; Floating Point Addition in MASM
.model small
.stack 100h

.data
    num1    real4  5.5         ; First floating point number
    num2    real4  3.2         ; Second floating point number
    result  real4  ?            ; To store the result

.code
main proc
    ; Initialize the data segment
    mov ax, @data
    mov ds, ax

    ; Load the first number onto the FPU stack
    fld num1

    ; Load the second number onto the FPU stack
    fld num2

    ; Add the two numbers
    fadd st(0), st(1)  ; st(0) = st(0) + st(1)

    ; Store the result from the FPU stack to the result variable
    fstp result        ; Store and pop the top of the stack

    ; Print the result (using DOS interrupt)
    ; Convert the result to string (simple approach)
    ; Note: You'll need to implement your own conversion routine here or use a library

    ; Exit program
    mov ax, 4C00h
    int 21h
main endp
end main
