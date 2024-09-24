DATA SEGMENT
      N1 DB 31H
      N2 DB 16H
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:

      MOV AX, DATA
      MOV DS, AX

      MOV AL, N1
      MOV BL, N2
      ADD AL, BL

      ADD AL, 30H         ; Convert to ASCII
      MOV DL, AL

      MOV AH, 02H        ; Function to display character
      INT 21H

      MOV AH, 4CH        ; Terminate program
      INT 21H

CODE ENDS
END START
