Data segment
    msg db,0dh,0ah,"Enter first number:$"
    msg1 db,0dh,0ah,"Enter second number:$"
    res db,0dh,0ah,"The LCM is:$"
    a db ?
    b db ?
    min db ?
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
        mov a,bl

        mov dx,offset msg
        mov ah,09h
        int 21h

        call accept
        mov b,bl

        mov ax,0000
        mov bx,0000
        mov al,a
        mov bl,b

        back:
            cmp ax,bx
            jc sec
            first:
                sub ax,bx
                jmp chk
            sec:
                sub bx,ax
                jmp chk
            chk:
                cmp ax,bx
                jnz back
                mov min,al

        mov al,a
        mov bl,b
        mul bl
        mov cl,min
        div cl
        mov min,al

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