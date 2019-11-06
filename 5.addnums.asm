Data segment
    msg db,0dh,0ah,"Enter the number of elements:$"
    msg1 db,0dh,0ah,"Enter a number:$"
    space db,0dh,0ah,"$"
    res db,0dh,0ah,"The average number is:$"
    len db ?
    sum db ?
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

        mov cl,len
        mov ch,00h
        mov di,1000h
        mov al,[di]
        mov sum,00h

        chk:
            mov al,[di]
            add sum,al
            inc di
            loop chk

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
        mov bl,sum
        and bl,0f0h
        ror bl,4
        call hextoascii
        mov dl,bl
        mov ah,02h
        int 21h
        mov bl,sum
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
