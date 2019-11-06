Data Segment
    msg0 db 10, 13, "Enter the binary number: $"
    msg1 db 10, 13, "The 2's complement of the number is: $"
    count1 db ?
    count2 db ?
Data ends
Code segment
assume CS:code, DS:data
start :
    mov ax, data
    mov ds, ax

    mov dx,offset msg0
    mov ah,09h
    int 21h

    call accept

    mov dx,offset msg1
    mov ah,09h
    int 21h

    call comp
    call disp

    mov ah,4ch
    int 21h

accept proc
    mov si,1000h
    mov cx,0000
    back:
        mov ah,01h
        int 21h
        cmp al,0dh
        je l
        inc cl
        mov [si],al
        inc si
        jmp back
        l:
        mov count1,cl
        ret
    endp

comp proc
    mov si,1000h
    mov cx,0000h
    mov cl,count1
    add si,cx
    dec si
    mov bl,00h
    mov al,01h
    mov ah,00h

    back1:
        mov bl,[si]
        cmp bl,31h
        je co
        dec si
        loop back1
        co:
            cmp si,1000h
            je ending
            dec si
            mov bl,[si]
            cmp bl,31h
            je a
            add bl,01h
            mov [si],bl
            jmp d
            a:sub bl,01h
            mov [si],bl
            d:loop co
    ending:
    ret
    endp
    
disp proc
    mov cl,count1
    mov ch,00h
    mov si,1000h
    disp1:
    mov dl,[si]
    mov ah,02h
    int 21h
    inc si
    loop disp1
    ret
    endp

code ends
end start
