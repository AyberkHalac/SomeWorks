ORG 100h 

mov ah, 0eh

mov bh, 0
mov ch, 0
mov dl, 0

devam:

mov al, '*'
int 10h
mov cl, dl
inc cl
mov al, ' '
jmp b1_basla
b1:
int 10h
b1_basla:
loop b1

mov dh, board_size
sub dh, dl

lea si, string
metin:
mov al, [si]
cmp al, 0
je metin_son
int 10h
inc si
dec dh
jmp metin
metin_son:

mov cl, dh
inc cl
mov al, ' '
jmp b2_basla
b2:
int 10h
b2_basla:
loop b2

mov al, '*'
int 10h

cmp dh, 0
jne saga_devam
mov bh, 1
saga_devam:

cmp bh,0
je saga
dec dl
cmp dl, 0
jne sola
mov bh, 0
jmp sola
saga:
inc dl
sola:

mov al, 0dh
int 10h

jmp devam

hlt

string db 'Merhaba',0
board_size db 10