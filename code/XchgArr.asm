DATASEG SEGMENT
    arr db 1, 2, 3, 4, 5, 6     ; array of 6 bytes
    len db 06h                  ; length of the array
DATASEG ENDS

CODESEG SEGMENT
    ASSUME CS:CODESEG, DS:DATASEG

start:  
    MOV AX, DATASEG             ; Load the data segment address
    MOV DS, AX                  ; Set DS to point to the data segment

    ; Load the middle elements (4 elements to be swapped)
    MOV AL, [arr + 1]      ; Load arr[SI - 1] into AL
    MOV BL, [arr + 2]      ; Load arr[SI] into BL
    MOV CL, [arr + 3]      ; Load arr[SI + 1] into CL
    MOV DL, [arr + 4]      ; Load arr[SI + 2] into DL

    ; Perform the swap using XCHG
    XCHG CL, [arr + 1]     ; arr[SI - 1] <-> CL
    XCHG DL, [arr + 2]     ; arr[SI] <-> DL
    XCHG AL, [arr + 3]     ; arr[SI + 1] <-> AL
    XCHG BL, [arr + 4]     ; arr[SI + 2] <-> BL


    ; Exit program
    MOV AH, 4CH                 ; DOS interrupt to exit
    INT 21H                     ; Return control to DOS

CODESEG ENDS
END start
