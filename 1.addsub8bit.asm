Data segment
    msg db 0dh,0ah,"Main Menu $"
    msg1 db 0dh,0ah,"1.Addition $"
    msg2 db 0dh,0ah,"2.Subtraction $"
    msgex db 0dh,0ah,"3.Exit: $"
    msg3 db 0dh,0ah,"Enter choice: $"
    msg4 db 0dh,0ah,"Enter first number: $"
    msg5 db 0dh,0ah,"Enter second number: $"
    msg6 db 0dh,0ah,"The result of addition is: $"
    msg7 db 0dh,0ah,"The result of subtraction is: $"
    choice db ?
Data ends
Code segment
    assume CS:code,DS:Data
    start:
    mov ax,Data
    mov DS,ax
    menu:
        mov dx,offset msg
        mov ah,09h
        int 21h
        mov dx,offset msg1
        mov ah,09h
        int 21h
        mov dx,offset msg2
        mov ah,09h
        int 21h
        mov dx,offset msgex
        mov ah,09h
        int 21h
        mov dx,offset msg3
        mov ah,09h
        int 21h
        mov ah,01h
        int 21h
        sub al,30h
        mov choice,al
        cmp al,03h
        jnz addition
        mov ah,4ch
        int 21h
    addition:
        mov dx,offset msg4
        mov ah,09h
        int 21h
        mov ah,01h
        int 21h
        call input
        mov bl,al
        rol bl,4
        mov ah,01h
        int 21h
        call input
        add bl,al

        mov dx,offset msg5
        mov ah,09h
        int 21h
        mov ah,01h
        int 21h
        call input
        mov cl,al
        rol cl,4
        mov ah,01h
        int 21h
        call input
        add cl,al

        cmp choice,01h
        jnz subtraction

        add bl,cl
        mov cl,bl

        mov dx,offset msg6
        mov ah,09h
        int 21h
        and bl,0f0h
        ror bl,4
        call output
        mov bl,cl
        and bl,0fh
        call output
        jmp menu

    subtraction:
        sub bl,cl
        mov cl,bl

        mov dx,offset msg7
        mov ah,09h
        int 21h
        and bl,0f0h
        ror bl,4
        call output
        mov bl,cl
        and bl,0fh
        call output
        jmp menu

    input:
        cmp al,41h
        jc skip
        sub al,07h
        skip:
            sub al,30h
        ret
        endp
    output:
        cmp bl,0ah
        jc skip1
        add bl,07h
        skip1:
            add bl,30h
        mov dl,bl
        mov ah,02h
        int 21h
        ret
        endp
code ends
end start
