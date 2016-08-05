org 100h
   
   
   
   ;mov ah, 86h
   ;mov cx, 00h
   ;mov dx, FF00h
   ;int 15h
   
   ;;;;;;;;;;;;;;;
   ;1 saniye wait
   
   ;mov ah,86h
   ;mov cx, 000Fh
   ;mov dx, 4240h
   ;int 15h
   
   
   
   ;xor BX, BX
   ;input:
   ;mov AX, 00h
   ;int 16h
   ;mov AH, 0Eh
   ;int 10h
   ;cmp AL, 0Dh
   
   ;je exit  
   ;sub AL, 30h
   
   ;cmp DI, 0d ;first rank
   ;je first
   
   ;mov DL, AL
   ;mov AL, BL
   ;mov CL, 10d
   ;mul CL
   ;add AL, DL
   ;mov BL, AL
   ;inc DI                                                                           
   ;jmp input
   
   ;first:
   ;add BL, AL
   ;inc DI
   ;jmp input:   
   
   
   mov AX, 00h
   int 16h
   mov AH, 0Eh
   int 10h
   mov [1000h], AL 
   
   
   mov AX, 00h
   int 16h
   mov AH, 0Eh
   int 10h
   mov [1001h], AL
   
   
   mov AL, 0Dh 
   int 10h 
      
     
   mov DH, [1001h]
   mov DL, [1000h]

   
   firstRank:

        secondRank:
            mov AH, 0Eh    
            mov AL, [1000h]
            int 10h 
            mov AH, 0Eh       
            mov AL, [1001h]
            int 10h  
            mov AL, 0Dh ;
            int 10h 
            call wait_   
      
            cmp [1001h], 30h
            je exit1
            dec [1001h]
            
        jg secondRank:
        go:        
        dec [1000h]
        mov [1001h], 39h
   jg firstRank:
      
   
   exit1:
      cmp [1000h], 30h
      jne go  
      
     
      mov BL, 30h
      mov BH, 30h
     
      writefirstRank:

        writesecondRank:
            mov AH, 0Eh    
            mov AL, BH
            int 10h 
            mov AH, 0Eh       
            mov AL, BL
            int 10h  
            mov AL, 0Dh ;
            int 10h 
            call wait_   
            ;;;;;;;;;;;;;;
            jmp exit2
        jg writesecondRank:
        goe:       
        inc BH
        mov BL, 30h
   jg writefirstRank:
      
        exit2:
        cmp BH, DH
        jne goe
      
      
      
      
      
      
      


hlt 


wait_ proc near
    
   mov AH,86h
   mov CX, 000Fh
   mov DX, 4240h
   int 15h    
 
    ret
wait_ endp    

