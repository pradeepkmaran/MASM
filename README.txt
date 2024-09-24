$mount d d:/masm
$d:

$masm file.asm              ; to assemble the code
$masm ./folder1/file.asm    ; to assemble code in different folder
$link file.obj              ; link the file
$debug file.exe             ; to execute the exe

-u                          ; to see the code
-d base:offset              ; to see the data at given address
-e base:offset              ; to edit the data at given address
-g                          ; to run
-q                          ; to quit

***********************************************************************

MOV AH, 01H         ; READ INPUT CHARACTER
INT 21H             ; AL = INPUT

MOV AH, 02H         ; DISPLAY OUTPUT CHARACTER
INT 21H             ; OUTPUT = DL