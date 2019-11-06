Data segment
    msg db,0dh,0ah,"Enter dividend:$"
    msg1 db,0dh,0ah,"Enter divisor:$"
    quo db,0dh,0ah,"Quotient:$"
    remain db,0dh,0ah,"Remainder:$"
    a db ?
    b db ?
    min db ?
    rem db ?
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
        mov dl,00h

        divb:
            cmp al,bl
            jc suba
            sub al,bl
            inc dl
            jmp divb
            suba:
                mov rem,al


        mov min,dl
        mov dx,offset quo
        mov ah,09h
        int 21h
        call display1
        mov al,rem
        mov min,al
        mov dx,offset remain
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