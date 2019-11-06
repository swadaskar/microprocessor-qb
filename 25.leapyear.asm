DATA SEGMENT
    msg0 db 10,13,"ENTER YEAR TO BE CHECKED$"
    msg1 db 10,13,"LEAP YEAR$"
    msg2 db 10,13,"NOT A LEAP YEAR$"
    msg3 db 10,13,"CHECK 1 SUCCESS$"
    msg4 db 10,13,"CHECK 2 SUCCESS$"
    msg5 db 10,13,"CHECK 3 SUCCESS$"
    year dw ?
DATA ENDS
CODE SEGMENT
    assume cs:code,ds:data
    start:
    mov ax,data
    mov ds,ax
    
    mov ah,09h
    mov dx,offset msg0
    int 21h
    
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
    
    mov year,bx
    mov ax,year
    mov bx,0004h
    cmp dx,0000h
    je check2
    mov ah,09h
    mov dx,offset msg2
    int 21h
    mov ah,4ch
    int 21h
    
    check2:mov ax,year
    mov bx,0064h
    
    div bx
    mov bh,dh
    mov bl,dl
    mov ch,dh
    mov cl,dl
    
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
    cmp dx,0000h
    je check3
    mov ah,09h
    mov dx,offset msg1
    int 21h
    mov ah,4ch
    int 21h
    
    
    check3:mov ax,year
    mov bx,0190h
    
    div bx
    cmp dx,0000h
    je final
    mov ah,09h
    mov dx,offset msg2
    int 21h
    mov ah,4ch
    int 21h
    
    final:mov ah,09h
    mov dx,offset msg1
    int 21h
    mov ah,4ch
    int 21h
    
CODE ENDS
end start