Data Segment
    msg0 db 10, 13, "Enter the first string: $"
    msg1 db 10, 13, "Enter the second string: $"
    msg3 db 10, 13, "Concatenated string: $"
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

    call accept1

    mov dx,offset msg3
    mov ah,09h
    int 21h

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

accept1 proc
    mov cx,1000h
    mov cl,count1
    mov si,cx

    back1:
        mov ah,01h
        int 21h
        cmp al,0dh
        je l1
        inc cl
        mov [si],al
        inc si
        jmp back1
        l1:
        mov count2,cl
        ret
    endp
    
disp proc
    mov cl,count2
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
