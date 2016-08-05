org 100h
                
mov BL,00h                
               
mov AH, 11111111b
mov AL, 10010101b
xor AH,AL

mov cx,8

sum:
shr AH,1
adc BL,0
loop sum
hlt