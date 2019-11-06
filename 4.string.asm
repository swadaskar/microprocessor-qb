Data Segment
    msg1    db 10,13,"1.Accept String"
            db 10,13,"2.Display String"
        db 10,13,"3.Display Length"
        db 10,13,"4.Display Reverse"
        db 10,13,"5.Check Palindrome"
        db 10,13,"6.Exit"
        db 10,13,"Enter Your Choice!: $"
    msg2 db 10,13,"Enter String: $"
    msg3 db 10,13,"Entered String is : $"
    msg4 db 10,13,"String Length is : $"
    msg5 db 10,13,"Reversed String is : $"
    msg9 db 10,13,"Result is : $"
    msg10 db 10,13,"PALINDROME $"
    msg11 db 10,13,"NOT PALINDROME $"
        msg13 db 10,13,"LENGTH IS $"
        msg12 db 10,13,"Siddhant Wadaskar C22-127 $"
    len db ?
    num2 db ?
    choice db ?
    result db ?
    result1 dw ?
Data ends
Code Segment
    assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax
        mov dx,offset msg12
    mov ah,09h
    INT 21h
    ;Menu
    labe:
    mov dx,offset msg1
    mov ah,09h
    INT 21h
    ;choice
    mov ah,01h
    int 21h
    call input
    mov choice,al
    ;exit
    cmp choice,06
    jnz laba
    mov ah,4ch
    int 21h
    ;accept
    laba:
    cmp choice,01
    jnz labb
    call accept
    ;display
    labb:
    cmp choice,02
    jnz labc
    call disp1
    labc:
    cmp choice,03
    jnz labd
 mov dx,offset msg13
    mov ah,09h
    INT 21h
    mov bl,len
        call output
    labd:
    cmp choice,04
    jnz labf
    call disp2
    labf:
    cmp choice,05
    jnz labg
    call pali
    labg:   
    jmp labe
input proc
    cmp al,41h
    jc lab1
    sub al,07h
    lab1:
    sub al,30h
    ret
endp
output proc
    cmp bl,0ah
    jc y
    add bl,07h
    y:add bl,30h
    mov dl,bl
    mov ah,02h
    int 21h
    ret
    endp
accept proc
    mov si,1000h
    mov cx,0000
    mov dx,offset msg2
    mov ah,09h
    int 21h
    back:
    mov ah,01h
    int 21h
    cmp al,0dh
    je comp
    add cl,1
    mov [si],al
    inc si
    jmp back
    comp:
    mov len,cl
    ret
endp
disp1 proc
    mov dx,offset msg3
    mov ah,09h
    int 21h
    mov cl,len
    mov ch,00h
    mov si,1000h
    disp:
    mov dl,[si]
    mov ah,02h
    int 21h
    inc si
    loop disp
    ret
endp
disp2 proc
    mov dx,offset msg3
    mov ah,09h
    int 21h
        mov si,1000h
        mov di,2000h
    mov cl,len
    mov ch,00h
    add si,cx
    dec si
    dispo:
    mov dl,[si]
    mov ah,02h
    int 21h
        xchg [di],dl
    dec si
        inc di
    loop dispo
    ret
endp
pali proc
    mov si,1000h
    mov di,2000h
    mov cl,len
    mov ch,00h
      l:  mov dl,[si]
        mov dh,[di]
        cmp cl,0
        je label1
    cmp dl,dh
        jne label2
        inc di
        inc si
        dec cl
        jmp l
label1: mov dx,offset msg10
    mov ah,09h
    int 21h
        ret
label2:mov dx,offset msg11
    mov ah,09h
    int 21h
endp
ret
endp
code ends
end start
