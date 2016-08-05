#start=Emu8086LEDKart.jar#

org 100h




MOV CX,128  
MOV DX,0   ;COUNTER
 
MOV SI,15
        
        
        
main: 
PUSH CX
MOV CX,4
JMP loop1
loop1continue: 


POP CX
SUB CX,4
PUSH CX 
MOV CX,12
JMP loop2
loop2continue: 


POP CX
SUB CX,12
PUSH CX
MOV CX,4
JMP loop11  
loop11continue:

POP CX
SUB CX,4
PUSH CX
MOV CX,12
JMP loop3
loop3continue:


POP CX 

SUB CX,12
JS halt 



LOOP main


  

loop1:

MOV AX,11111111b     
OUT DX,AX
INC DX
LOOP loop1   
JMP loop1continue 

loop11:

MOV AX,11111111b     
OUT DX,AX
INC DX
LOOP loop11   
JMP loop11continue 


loop2:

MOV AX,11111000b     
OUT DX,AX
INC DX

LOOP loop2  
JMP loop2continue 



loop3:

MOV AX,10001111b     
OUT DX,AX
INC DX

LOOP loop3  
JMP loop3continue

halt:
 

hlt