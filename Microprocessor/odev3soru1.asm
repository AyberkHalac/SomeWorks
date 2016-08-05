org 100h

  time:
  call systemTime
  call print
  call wait_  
  jmp time

hlt   
    
    

print proc near
 
    mov AH, 0Eh 
    mov AL, 0Dh 
    int 10h
    
    xor ax, ax
    mov AL, BH
    mov BH, 10d
    div BH
    mov bh, ah
    mov ah, 0Eh 
    add al, 30h
    int 10h
    mov al, bh 
    add al, 30h
    int 10h
    
    mov AL, 3Ah 
    int 10h
    ;;;;;;;;;;;
    xor ax, ax
    mov AL, BL
    mov BL, 10d
    div BL
    mov bl, ah
    mov ah, 0Eh 
    add al, 30h
    int 10h
    mov al, bl 
    add al, 30h
    int 10h  
    
    
    mov AL, 3Ah 
    int 10h
  
    ;;;;;;;;;;;
    xor ax, ax
    mov AL, dh
    mov dh, 10d
    div dh
    mov dh, ah
    mov ah, 0Eh 
    add al, 30h
    int 10h
    mov al, dh 
    add al, 30h
    int 10h
          
    ret
print endp

systemTime proc near
        
    mov	AH ,2Ch
    int 21h
    mov BL, CL;minute
    mov BH, CH;hour    
     
    ret
systemTime endp  


wait_ proc near
    
    mov AH,86h
    mov CX, 0003h
    mov DX, 1000h ;4240h
    int 15h    
 
    ret
wait_ endp 