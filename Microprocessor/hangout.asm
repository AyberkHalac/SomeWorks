;Ayberk Halac
;111101044

org 100h

  mov length, 6 
  mov can, 5
  call print        


  
  main: 
    mov dx, 0
    mov bh,0
    mov ah,2
    int 10h
  
  
    call getElements
    call pprint
    mov ah, 0Eh
    mov al, 0Ah
    int 10h   
    mov al, 0Dh 
    int 10h  
    call kalancan 

    
    mov cl, found
    cmp cl, length
    je win
    cmp can, 0
    jne main  
    
    
    
    
    
    mov ah, 0Eh 
    mov al, 0Ah
    int 10h   
    mov al, 0Dh 
    int 10h 
    mov al, 'k'
    int 10h 
    mov al, 'a'
    int 10h  
    mov al, 'y'
    int 10h     
    mov al, 'b'
    int 10h     
    mov al, 'e'
    int 10h    
    mov al, 't'
    int 10h     
    mov al, 't'
    int 10h     
    mov al, 'i'
    int 10h    
    mov al, 'n' 
    int 10h  
    mov al, 'i'
    int 10h      
    mov al, 'z'
    int 10h 
    jmp exit
    
    win:
    mov ah, 0Eh 
    mov al, 0Ah
    int 10h   
    mov al, 0Dh 
    int 10h 
    mov al, 'k'
    int 10h 
    mov al, 'a'
    int 10h  
    mov al, 'z'
    int 10h     
    mov al, 'a'
    int 10h     
    mov al, 'n'
    int 10h    
    mov al, 'd'
    int 10h     
    mov al, 'i'
    int 10h      
    mov al, 'n' 
    int 10h  
    mov al, 'i'
    int 10h      
    mov al, 'z'
    int 10h    

    exit:

hlt
word db 'a','y','b','e','r','k'
wordcheck db 0,0,0,0,0,0
length db ?  
can db ?
true db 0 
found db 0


getElements proc near
          
  
      mov ah, 0Eh
      mov al, 08h
      int 10h
      mov al, 08h
      int 10h  
      mov al, 0Dh
      int 10h    
      push cx
      xor cx, cx
      mov cl, length  
      lea si, word    
      xor di, di 
      lea di, wordcheck  
      mov AX, 00h
      int 16h 
      mov bl, al  
      
      
      check:
       mov dl, [si]
       cmp dl, bl 
       je correct
       back:
       inc si
       inc di
      loop check  
      
      
      jmp halt
      
      correct:
       mov true, 1 
       inc found 
       inc [di]
       jmp back
        halt:
       pop cx
    ret
getElements endp      



kalancan proc near  
    cmp true, 1
    je go
    dec can
    
    go:
    xor ax, ax
    mov ah, 0Eh
    mov al, 'k'
    int 10h 
    mov al, 'a'
    int 10h  
    mov al, 'l'
    int 10h     
    mov al, 'a'
    int 10h     
    mov al, 'n'
    int 10h    
    mov al, ' '
    int 10h     
    mov al, 'c'
    int 10h     
    mov al, 'a'
    int 10h    
    mov al, 'n'
    int 10h  
    mov al, ':'
    int 10h 
    mov al, ' '
    int 10h 
    mov al, can 
    add al, 30h
    int 10h 
    mov true, 0 
    ret
kalancan endp    

print proc near   
    xor ax, ax  
    push cx
    xor cx, cx
    mov ah, 0Eh  
    mov cl, length
    printloop:
    mov al, '_'
    int 10h 
    mov al, ' '
    int 10h  
    
    loop printloop
   
    pop cx
    ret 
print endp  
             
             
             

pprint proc near
    
     lea di, wordcheck
     lea si, word  
     push cx
     xor cx, cx
     mov cl, length
     checkk:
        mov bl, [di]
        cmp bl, 0
        jne truee
        mov ah, 0Eh
        mov al, '_'
        int 10h  
        mov al, ' '
        int 10h  
        inc di
        inc si
        jmp rett
        truee:
        mov ah, 0Eh 
        mov al, [si] 
        int 10h     
        mov al, ' ' 
        int 10h        
        inc si
        inc di
        
        rett: 
     loop checkk
    pop cx
    ret
pprint endp    
