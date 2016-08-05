;Ayberk Halac
;111101044
org 100h
   
   
   call getrow 
   
   call random
   xor ax, ax
   xor bx, bx
   xor cx, cx 
   xor dx, dx
   mov cx, 50
   main: 

   mov dh, 0
   mov dl, 0
   mov bh, 0
   mov ah, 2
   int 10h 
   
   
   mov ax, 00h
   int 16h
   cmp al, 'w'
   je up
   cmp al, 's'
   je down
   cmp al, 'a'
   je left
   cmp al, 'd'
   je right
   jmp main   
   up:
    cmp row, 0
    jng halt
    dec row
    jmp go
   down:
    cmp row, 10
    jnl halt
    inc row 
    jmp go
   left:
    cmp column, 0
    jng halt
    dec column  
    jmp go
   right:
    cmp column, 10
    jnl halt
    inc column
   go: 
   mov dl, row
   mov dh, column  
   
   cmp dl, foodrow
   jne print
   cmp dh, foodcolumn
   jne print
   push cx
   call random
   pop cx
   inc score  
   
   print:
   push cx                   
   call getrow
   pop cx           
   halt:
   loop main
   mov dh, 0
   mov dl, 0
   mov bh, 0
   mov ah, 2
   int 10h 
   mov ah, 0Eh
   mov al, 's'
   int 10h
   mov al, 'c'
   int 10h
   mov al, 'o'
   int 10h
   mov al, 'r'
   int 10h
   mov al, 'e'
   int 10h 
   mov al, ':'
   int 10h 
   mov al, score
   int 10h
     

hlt
row db 0
column db 0 
foodrow db 0
foodcolumn db 0
score db 0

getrow proc near  
    push cx
    xor cx, cx
    mov cl, 10  
    mov ah, 0Eh 
    mov dl, 0
    roww:  
    cmp dl, row
    je continue
    cmp dl, foodrow
    je continue
    
    jmp continuego
    
    continue:  
    push cx
    call getcolumn
    pop cx

    jmp back
    continuego:
    mov al, 0Ah
    int 10h   
    mov al, 0Dh
    int 10h 
    back: 
    inc dl
    loop roww 
    pop cx
    ret
getrow endp 


getcolumn proc near
    push cx
    xor cx, cx
    mov cx, 10
    mov ah, 0Eh
    mov dl, 0
    columnn:
     cmp dl, column
     je user
     cmp dl, foodcolumn
     je food
     
     jmp continuee
     
     food:
     mov al, '-'
     int 10h
     jmp backk
     
     user:    
     mov al, '*'
     int 10h
     jmp backk
     
     
     continuee:
     mov al, ' '
     int 10h
    backk: 
    inc dl
    loop columnn
    
    pop cx
    ret
getcolumn endp      



random proc near 
    mov ah, 2Ch
    int 21h 
    mov ah, 0
    mov al, dh
    mov dh, 10
    div dh
    mov foodrow, ah
    mov ah, 2Ch
    int 21h 
    mov ah, 0
    mov al, dh
    mov dh, 10
    div dh
    mov foodcolumn, ah    
    ret
random endp   

