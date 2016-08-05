#start=thermometer.exe#
org 100h

   incc:
     mov al, 1
     out 127, al
     incclopp:
       in al, 125
       mov bl, 18
       mul bl
       mov bl, 10
       div bl 
       add al, 32
       cmp al, 60
       jng incclopp   
   
   
   decc:
     mov al, 0
     out 127, al
     deccloop:
       in al, 125
       mov bl, 18
       mul bl
       mov bl, 18
       div bl 
       add al, 32
       cmp al, 40
       jg deccloop   
    

   jmp incc:


hlt