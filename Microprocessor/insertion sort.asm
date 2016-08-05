org 100h

  mov AX, 00h
  mov DS, AX 
  lea SI, arrayLength
   
  call getArrayLength
  call getArrayElements
  call insertionSort
  call printArray


hlt 
arrayLength db ?    
       
                                 

getArrayLength proc near   
      mov AH, 0Eh
        
      mov AL, 4Ch  
      int 10h
      mov AL, 45h  
      int 10h  
      mov AL, 4Eh  
      int 10h  
      mov AL, 47h  
      int 10h  
      mov AL, 54h  
      int 10h 
      mov AL, 48h  
      int 10h 
      mov AL, 3Ah  
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
getArrayLength endp    
        

getArrayElements proc near
    xor CX, CX
    mov CX, [SI]   
    input:  
      mov AX, 00h
      int 16h 
      mov [1000h+BX], AL
      mov AH, 0Eh      
      int 10h 
      inc BL  
      inc BL   
      cmp AL, 0Dh
      mov AL, 20h 
      int 10h  
    loop input   
    ret
getArrayElements endp    
     
 
printArray proc near
    xor CX, CX
    lea SI, arrayLength
    mov CL, [SI]
    mov BX, 00h 
    
    mov AH, 0Eh
    mov AL, 0Ah
    int 10h   
    mov AL, 0Dh
    int 10h 
    
    write:
    mov AL, [1000h+BX]
    int 10h    
    inc BX 
    inc BX
    mov AL, 20h 
    int 10h 
    
    loop write    
        
    ret
printArray endp         



insertionSort proc near
    xor cx, cx 
    mov cl, arrayLength 
    dec cl   
    mov si, 2
    mov di, 2
    mov bp, 0
    
    for:
    mov bp, [1000h+si] 
    mov di, si
    
        loop1:
          cmp di, 0
          jng exit
          cmp [1000h+di-2], bp
          jng exit 
          mov bx, [1000h+di-2]    
          mov [1000h+di], bx
          dec di 
          dec di      
        jmp loop1
        
    exit:
    inc si
    inc si   
    mov [1000h+di], bp
    loop for 
    
    
          
    ret
insertionSort endp  



