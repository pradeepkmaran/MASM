$mount d d:/masm
$d:

$masm file.asm          ; to assemble the code
$link file.obj          ; link the file
$debug file.exe         ; to execute the exe

-u                      ; to see the code
-d base:offset          ; to see the data at given address
-e base:offset          ; to edit the data at given address
-g                      ; to run
-q                      ; to quit

