#start=Emu8086LEDKart.jar#
org 100h  
    main:
    
    xor ax, ax
    xor bx, bx
    xor di, di
    xor dx, dx
    xor cx, cx
    xor si, si 
    

    call input  

    mov di, dx;byte
    mov AH, 0Eh
    mov AL, 0Ah
    int 10h   
    mov AL, 0Dh
    int 10h 
    call input
    mov si, dx;port
    call led   
    
    mov AH, 0Eh
    mov AL, 0Ah
    int 10h   
    mov AL, 0Dh
    int 10h 
    mov AL, 0Ah
    int 10h   
    mov AL, 0Dh
    int 10h 
    jmp main

hlt       


led proc near
    xor ax, ax
    mov dx, di
    mov ax, si     
    out dx, ax
    ret
led endp    

input proc near
    xor dl, dl
    xor ax, ax    
    mov cx, 3    

    getInput:     
        xor ax, ax
        mov ax, dx
        mov bl, 10d
        mul bl
        mov dx, ax   
        
        mov ax, 00h
        int 16h  

        mov ah, 0Eh 
        int 10h   
        cmp al, 0Dh 
        je exit     
        
        sub al, 30h       
        add dl, al  
        
    loop getInput
    jmp exit_ 
    exit:  
    xor ax, ax
    mov ax, dx
    div bl
    mov dx, ax 
    exit_:
    ret
input endp 