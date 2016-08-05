org 100h   
    lea si, sayi
    mov di, 1000h
    mov ax, 0
    mov bx, 0
    mov cx, [si]    ; cx yazmacina sayi degiskeninde yer alan deger atildi
    mov dx, islem   ; dx register'ina islem degeri atildi
    
    cmp dx, 0       ; dx registerindaki deger ile 0 karsilastirildi             
    je toplama      ; eger dx 0 ise toplama islemine atlanacak
    
    cmp dx, 1       ; dx registerindaki deger ile 1 karsilastirildi 
    je cikarma      ; eger dx 1 ise cikarma islemine atlanacak
    
    cmp dx, 2       ; dx registerindaki deger ile 2 karsilastirildi 
    je carpma       ; eger dx 2 ise carpma islemine atlanacak
    
    toplama:        ; toplama isleminin yapilacagi kisim
        mov al, [di]    ; di registerinin bellekte gosterdigi deger al yazmacina atildi
        and al, 00001111b   ; degerin 00001111b ile and'lendi ve ilk 4 bit sfiirlandi    
        inc di          ; di = 1001h'i gosterecek sekilde artirildi
        dec cx          ; bellekteki sayi degerinin gosterdigi sayilardan bir tanesi al'ye atildi
        toplaDongu:
            mov bl, [di]        ; di yazmacindaki deger bl yazmacina yasindi
            and bl, 00001111b   ; degerin 00001111b ile and'lendi ve ilk 4 bit sifirlandi
            add al, bl
            inc di
        loop toplaDongu
    jmp bitir       ; islem bitince alttaki islemlerin yapilmaamsi
                    ; icin programin en sonunda yer alan bitir
                    ; label;ina atlanacak
    
    cikarma:        ; cikarma isleminin yapilacagi kisim 
        mov al, [di]    ; di registerinin bellekte gosterdigi deger al yazmacina atildi
        and al, 00001111b   ; degerin 00001111b ile and'lendi ve ilk 4 bit sifirlandi    
        inc di          ; di = 1001h'i gosterecek sekilde artirildi
        dec cx          ; bellekteki sayi degerinin gosterdigi sayilardan bir tanesi al'ye atildi
        cikarDongu:
            mov bl, [di]        ; di yazmacindaki deger bl yazmacina tasindi
            and bl, 00001111b   ; degerin 00001111b ile and'lendi ve ilk 4 bit sifirlandi
            sub al, bl
            inc di
        loop cikarDongu  
    jmp bitir       ; cikarma isleminin sonu
    
    carpma:         ; carpma isleminin yapilacagi kisim
        mov al, [di]    ; di registerinin bellekte gosterdigi deger al yazmacina atildi
        and al, 00001111b   ; degerin 00001111b ile and'lendi ve ilk 4 bit sifirlandi    
        inc di          ; di = 1001h'i gosterecek sekilde artirildi
        dec cx          ; bellekteki sayi degerinin gosterdigi sayilardan bir tanesi al'ye atildi
        carpDongu:
            mov bl, [di]        ; di yazmacindaki deger bl yazmacina tasindi
            and bl, 00001111b   ; degerin 00001111b ile and'lendi ve ilk 4 bit sifirlandi
            mul bl
            inc di
        loop carpDongu 
    bitir:

hlt

sayi dw 3                                       
islem dw 2                                                    