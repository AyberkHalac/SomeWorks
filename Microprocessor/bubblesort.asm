org 100h

  mov AX, 00h
  mov DS, AX 
  lea SI, arrayLength
   
  call getArrayLength
  call getArray
  call bubbleSort
  call print


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
        

getArray proc near
    xor CX, CX
    mov CX, [SI]   
    input:  
      mov AX, 00h
      int 16h 
      mov [1000h+BX], AL
      mov AH, 0Eh      
      int 10h 
      inc BL    
      cmp AL, 0Dh 
    loop input   
    ret
getArray endp    
    
   

bubbleSort proc near
    xor CX, CX
    mov CL, [SI]
    dec CL
    
    sort_1: 
       mov BX, 00h
       push CX
       mov CL, [SI]
       dec CL         
       sort_2:   
       
          mov DL, [1000h+BX]
          inc BL
          mov DH, [1000h+BX]
          cmp DL, DH 
          jg halt  
          
          mov [1000h+BX], DL
          mov [1000h+BX-1], DH                     
          
          halt:

       loop sort_2
       pop CX
    loop sort_1    
    
    ret
bubbleSort endp
 
 
 
 
print proc near
    xor CX, CX
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
    
    loop write    

    
    ret
print endp     