org 100h   
    mov di, 1000h
    mov si, 1000h
    
    mov cx, 3
    outerLoop:
        push cx
        mov cx, 3
        innerLoop:
            mov ah, 0
            mov al, [di]
            mul al 
            push ax
            inc di          
        loop innerLoop
        
        pop ax
        mov [si], ax
        inc si
        
        pop ax
        mov [si], ax
        inc si
        pop cx
    loop outerLoop  
    
    mov ah, 0
    mov al, [di]
    mul al 
    push ax  
     
    mov cx, 4
    popremained: 
        pop ax
        mov [si], ax
        inc si
    loop popremained
hlt             
