org 100h

  mov AX, 00h
  mov DS, AX 
  lea SI, arrayLength
   
  call getLength
  call getMatrixElements
  call printArray 
  call multiply
 


hlt 
arrayLength db ?    
       
                                 

getLength proc near   
      mov AH, 0Eh
        
      mov AL, 4Dh  
      int 10h 
      mov AL, 3Ah  
      int 10h
      mov AL, 20h  
      int 10h     
      
      
      mov AX, 00h
      int 16h    
      mov AH, 0Eh
      int 10h 
      sub AL, 30h
      mov arrayLength, AL 
      
      mov AL, 0Ah
      int 10h   
      mov AL, 0Dh 
      int 10h  
    
    ret 
getLength endp    
        

getMatrixElements proc near
    xor CX, CX
    mov CX, [SI]
    mov AX, CX
    mul AX
    mov CX, AX   
    input1:  
      mov AX, 00h
      int 16h 
      mov [2000h+BX], AL
      ;mov AH, 0Eh      
      ;int 10h 
      inc BL  
      inc BL   
      ;mov AL, 20h 
      ;int 10h  
    loop input1 
    xor BX, BX
    xor CX, CX
    mov CX, [SI]
    mov AX, CX
    mul AX
    mov CX, AX   
    input2:  
      mov AX, 00h
      int 16h 
      mov [3000h+BX], AL
      ;mov AH, 0Eh      
      ;int 10h 
      inc BL  
      inc BL   
      ;mov AL, 20h 
      ;int 10h  
    loop input2   
    ret
getMatrixElements endp    
     
 
printArray proc near
    xor CX, CX
    mov AL, arrayLength
    mul AL
    mov CL, AL
    mov BX, 00h 
    
    mov AH, 0Eh
    
    write1:
    mov AL, [2000h+BX]
    int 10h    
    inc BX 
    inc BX
    mov AL, 20h 
    int 10h 
    
    loop write1  
    
    
    xor CX, CX
    mov AL, arrayLength
    mul AL
    mov CL, AL
    mov BX, 00h 
    
    mov AH, 0Eh
    mov AL, 0Ah
    int 10h   
    mov AL, 0Dh
    int 10h 
    
    write2:
    mov AL, [3000h+BX]
    int 10h    
    inc BX 
    inc BX
    mov AL, 20h 
    int 10h 
    
    loop write2    
        
    ret
printArray endp         



multiply proc near   
    xor dx, dx
    mov dl,arrayLength
    xor bx ,bx
    xor si, si 
    mov col, 0h 
    mov rrow, 0h 
    mov row, 0h  
    mov cl, arrayLength 
    xor ax, ax
    
    Main:
    mov al, row
    mul arrayLength
    mov bl, 02h
    mul bl
    mov bx, ax 
    xor ax, ax
    mov sum, 0h
    xor ax, ax
    push cx ;PUSHED
    mov cl, arrayLength  
    
    Matrix:
     push cx ;PUSHED
     mov cl, arrayLength  
     mov sum, 0h

     inside:         
      mov al, row
      mov al, rrow
      mov al, col
      push dx
      mov al, [2000h+bx]  ;satir
      sub ax, 30h   
      mov dl, [3000h+si]  ;sutun
      sub dx, 30h  
      
      mul dx 
      pop dx  

      add sum, al       
      add  si, dx
      add  si, dx
      inc bx
      inc bx
     loop inside 
     
     xor bx, bx 
     mov ax, 0h
     mov al, row
     mul dl
     mov bx, ax
     mov ax, 02h
     mul bx
     mov bx, ax
     xor ax, ax
     inc col
     inc col 
     mov al, col
     mov si, ax 
  
     xor ax, ax
     mov al, sum  
   
     ;add al, 30h
     mov [1000h+di], ax 
     inc di
     inc di
     pop cx 
     mov dl,arrayLength
    loop Matrix
    
       
    add rrow, dl   
    mov al, rrow
    mov col, 0h 
    mov al, row
    inc al
    mov row, al 
    xor si, si
    pop cx
    loop Main
    ret
multiply endp  

sum db 00h
col db 00h  
row db 00h
rrow db 00h

                            