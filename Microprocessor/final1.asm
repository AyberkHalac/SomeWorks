#start=emu8086LEDKart.jar#
org 100h

mov dx, 0
mov al, 11110000b
mov cx, 9
doldur:
out dx, al
add dx, 4
loop doldur

mov bl, 0

devam:
mov ah, 0h
int 16h
cmp al, '+'
je artir
cmp al, '-'
je azalt
sub al, 31h
mov bl, al
jmp devam

artir:
mov al, 4
mul bl
mov dx, ax
in al, dx
shr al, 1
or al, 10000000b
out dx, al
jmp devam

azalt:
mov al, 4
mul bl
mov dx, ax
in al, dx
shl al, 1
out dx, al
jmp devam

hlt