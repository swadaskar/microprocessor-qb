DATA SEGMENT
    msg0 db 10,13,"ENTER FIRST NUMBER$"
    msg1 db 10,13,"ENTER SECOND NUMBER$"
    msg2 db 10,13,"RESULT IS : $"
    num11 dw ?
    num12 dw ?
    num21 dw ?
    num22 dw ?
DATA ENDS
CODE SEGMENT
    assume cs:code,ds:data
    start:
    mov ax,data
    mov ds,ax
    
    mov ah,09h
    mov dx,offset msg0
    int 21h
    
    call accept
    mov num11,bx
    call accept
    mov num12,bx
    
    mov ah,09h
    mov dx,offset msg1
    int 21h
    
    call accept
    mov num21,bx
    call accept
    mov num22,bx
    
    mov ax,num11
    mov bx,num12
    mov cx,num21
    mov dx,num22
    
    sub bx,dx
    sbb ax,cx
    
    mov num11,ax
    mov num12,bx
    
    mov ah,09h
    mov dx,offset msg2
    int 21h
    
    mov bx,num11
    call disp
    mov bx,num12
    call disp
    
    mov ah,4ch
    int 21h
    
    accept proc
    mov ah,01h
    int 21h
    sub al,'0'
    rol al,04h
    mov bl,al
    
    mov ah,01h
    int 21h
    sub al,'0'
    add bl,al
    mov bh,bl
    
    mov ah,01h
    int 21h
    sub al,'0'
    rol al,04h
    mov bl,al
    
    mov ah,01h
    int 21h
    sub al,'0'
    add bl,al
    
    ret
    endp
    
    disp proc
    mov ch,bh
    mov cl,bl
    and bh,0f0h
    ror bh,04h
    add bh,'0'
    mov dl,bh
    mov ah,02h
    int 21h
    
    mov bh,ch
    and bh,0fh
    add bh,'0'
    mov dl,bh
    mov ah,02h
    int 21h
    
    and bl,0f0h
    ror bl,04h
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    mov bl,cl
    and bl,0fh
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    ret
    endp
    
CODE ENDS
end start