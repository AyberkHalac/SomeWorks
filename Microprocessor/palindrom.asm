org 100h

mov AX, 00h
mov DS, AX 

return:
mov BX, 00h

input: 
mov AX, 00h
int 16h
mov [1000h+BX], AL
mov AH, 0Eh
int 10h 
inc BL
cmp AL, 0Dh


jne input 



dec BL  ;right to left  
mov CX, BX

dec BL  ;right to left
mov DI, 00h ;left to right
check:
mov AH, [1000h+DI]
mov AL, [1000h+BX]
cmp AH, AL
jne writeNot:
dec BL
inc DI
cmp BX, DI
je write
loop check





      
write:
mov AH, 0Eh
;
mov AL, 0Ah; New Line
int 10h   
mov AL, 0Dh; Move Line to Left 
int 10h 
mov AL, 50h ;P
int 10h 
mov AL, 41h ;A
int 10h 
mov AL, 4Ch ;L
int 10h 
mov AL, 49h ;I
int 10h 
mov AL, 4Eh ;N
int 10h 
mov AL, 44h ;D
int 10h 
mov AL, 52h ;R
int 10h 
mov AL, 4Fh ;O
int 10h 
mov AL, 4Dh ;M
int 10h 
mov AL, 49h ;I
int 10h 
mov AL, 4Bh ;K
int 10h                   
jmp halt:

;;;;;;;;;;;;;;;;;;;;;;;;;
writeNot:

mov AH, 0Eh
;
mov AL, 0Ah; New Line
int 10h   
mov AL, 0Dh; Move Line to Left 
int 10h  
mov AL, 4Eh ;N
int 10h 
mov AL, 4Fh ;O
int 10h 
mov AL, 54h ;T
int 10h 

mov AL, 20h ;SPACE
int 10h

mov AL, 50h ;P
int 10h 
mov AL, 41h ;A
int 10h 
mov AL, 4Ch ;L
int 10h 
mov AL, 49h ;I
int 10h 
mov AL, 4Eh ;N
int 10h 
mov AL, 44h ;D
int 10h 
mov AL, 52h ;R
int 10h 
mov AL, 4Fh ;O
int 10h 
mov AL, 4Dh ;M
int 10h 
mov AL, 49h ;I
int 10h 
mov AL, 4Bh ;K
int 10h 


halt: 

mov AL, 0Ah; New Line
int 10h   
mov AL, 0Dh; Move Line to Left 
int 10h


jmp return
hlt
