org 100h


lea SI,numbers
mov AX,[si]
mov BX,[si+2]
mov CX,[si+4]  
mov DX,[si+6]

add AX,BX
add AX,CX
add AX,DX    

mov result,AX
          
;lea di, result
;mov [di],ax          
           
hlt

numbers dw 2,4,6,8 
result dw ?