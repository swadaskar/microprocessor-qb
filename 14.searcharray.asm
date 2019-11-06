Data segment
    msg db,0dh,0ah,"Enter the number of elements:$"
    msg1 db,0dh,0ah,"Enter a number:$"
    space db,0dh,0ah,"$"
    msg2 db,0dh,0ah,"Enter the number to be searched:$"
    res db,0dh,0ah,"The number is at position:$"
    len db ?
    min db ?
    x db ?
Data ends
Code segment
    assume CS:Code,DS:Data
    start:
        mov ax,Data
        mov DS,ax

        mov dx,offset msg
        mov ah,09h
        int 21h

        call accept

        mov len,bl
        mov cl,bl
        mov ch,00h
        mov di,1000h

        back:
            mov dx,offset msg1
            mov ah,09h
            int 21h
            call accept
            mov [di],bl
            inc di
            loop back

        mov dx,offset space
        mov ah,09h
        int 21h

        mov dx,offset msg2
        mov ah,09h
        int 21h

        call accept

        mov x,bl

        mov cl,len
        mov dl,00h
        mov ch,00h
        mov di,1000h

        chk:
            inc dl
            mov al,[di]
            cmp al,x
            je a
            inc di
            loop chk
            a:mov min,dl

        mov dx,offset res
        mov ah,09h
        int 21h
        call display1
        mov ah,4ch
        int 21h

    accept proc
        mov ah,01h
        int 21h
        call asciitohex
        mov bl,al
        rol bl,4
        mov ah,01h
        int 21h
        call asciitohex
        add bl,al
        ret
        endp

    display1 proc
        mov bl,min
        and bl,0f0h
        ror bl,4
        call hextoascii
        mov dl,bl
        mov ah,02h
        int 21h
        mov bl,min
        and bl,0fh
        call hextoascii
        mov dl,bl
        mov ah,02h
        int 21h
        ret
        endp


    asciitohex proc
        cmp al,41h
        jc sk
        sub al,07h
        sk:
            sub al,30h
            ret
        endp

    hextoascii proc
        cmp bl,0ah
        jc s1
        add bl,07h
        s1:
            add bl,30h
            ret
        endp        
Code ends
end start