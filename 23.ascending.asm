Data Segment
    msg0 db 10, 13, "Enter the total number of terms to Sort: $"
    msg1 db 10, 13, "Enter the element: $"
    msg2 db 10, 13, "$"
    msg3 db 10, 13, "Terms in ascending order are: $"
    msg4 db 10, 13, "Terms in descending order are: $"
    count db ?
    temp db ?
Data ends
Code segment
assume CS:code, DS:data
start :
    mov ax, data
    mov ds, ax

    ;no. of terms
    mov dx, offset msg0
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    call convert
    rol al, 04
    mov bl, al

    mov ah, 01h
    int 21h
    call convert
    add bl, al
    mov count, bl

    ;taking input
    mov si, 1000h
    mov cx, 0000h
    mov cl, count
    repeat :
        mov dx, offset msg1
        mov ah, 09h
        int 21h

        mov ah, 01h
        int 21h
        call convert
        rol al, 04
        mov bl, al

        mov ah, 01h 
        int 21h 
        call convert
        add bl, al

        mov [si], bl
        inc si
    loop repeat

    ;ascending order

    mov bl, count
    dec bl
    mov dh, 00h

    loop1 :
        mov si, 1000h
        mov cx, 0000h
        mov cl, count
        dec cl
        
        loop2 :
            mov ah, [si]
            inc si
            mov al, [si]

            cmp ah, al
            jc l

            xchg ah, al
            dec si
            mov [si], ah
            inc si
            mov [si], al

            l :
                loop loop2
    
        inc dh
        cmp dh, bl
        jc loop1
    
    ;print elements of array
    MOV dx, offset msg2
    mov ah, 09h
    int 21h

    MOV dx, offset msg3
    mov ah, 09h
    int 21h
    mov cx, 0000h
    mov cl, count
    mov si, 1000h

    Mov dx, offset msg2
    mov ah, 09h
    int 21h
    print :
        mov bl, [si]
        and bl, 0f0h
        ror bl, 04
        call output_convert

        mov bl, [si]
        and bl, 0fh
        call output_convert

        Mov dx, offset msg2
        mov ah, 09h
        int 21h
        
        inc si
    loop print

    ;descending order

    mov bl, count
    dec bl
    mov dh, 00h

    loop3 :
        mov si, 1000h
        mov cx, 0000h
        mov cl, count
        dec cl
        
        loop4 :
            mov ah, [si]
            inc si
            mov al, [si]

            cmp ah, al
            jnc l1

            xchg ah, al
            dec si
            mov [si], ah
            inc si
            mov [si], al

            l1 :
                loop loop4
    
        inc dh
        cmp dh, bl
        jc loop3
    
    ;print elements of array
    MOV dx, offset msg2
    mov ah, 09h
    int 21h

    MOV dx, offset msg4
    mov ah, 09h
    int 21h
    mov cx, 0000h
    mov cl, count
    mov si, 1000h

    Mov dx, offset msg2
    mov ah, 09h
    int 21h
    print1 :
        mov bl, [si]
        and bl, 0f0h
        ror bl, 04
        call output_convert

        mov bl, [si]
        and bl, 0fh
        call output_convert

        Mov dx, offset msg2
        mov ah, 09h
        int 21h
        
        inc si
    loop print1

    mov ah, 4ch
    int 21h

    convert proc
        cmp al, 41h
        jc label1
        sub al, 07h
        label1 :
            sub al, 30h
        ret
    endp

    output_convert proc
        cmp bl, 0ah
        jc label2
        add bl, 07h

        label2 :
            add bl, 30h
        mov dx, 0000h
        mov dl, bl
        mov ah, 02h
        int 21h
        ret
    endp
code ends
end start
