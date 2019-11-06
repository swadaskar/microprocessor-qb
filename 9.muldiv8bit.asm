Data segment
msgname db 10, 13, "Siddhant Wadaskar C-22 127 $"
msg1 db 10, 13, "1.Addition $"
msg2 db 10, 13, "2.Subtraction $"
msg3 db 10, 13, "3.Multiplication $"
msg4 db 10, 13, "4.Division $"
msg5 db 10, 13, "5.Exit $"
msg6 db 10, 13, "Enter choice: $"
msg7 db 10, 13, "Enter first: $"
msg8 db 10, 13, "Enter second: $"
msg9 db 10, 13, "Result: $"
msg10 db 10, 13, "Quotient: $"
msg11 db 10, 13, "Remainder: $"
res db ?
res4 dw ?
choice db ?
Data ends
Code Segment
    assume cs: code, ds: data
    start:
    mov AX, data
    mov DS, AX
mov DX, offset msgname
    mov AH, 09H
    INT 21H
menu:
    mov DX, offset msg1
    mov AH, 09H
    INT 21H
    mov DX, offset msg2
    mov AH, 09H
    INT 21H    
    mov DX, offset msg3
    mov AH, 09H
    INT 21H  
    mov DX, offset msg4
    mov AH, 09H
    INT 21H    
    mov DX, offset msg5
    mov AH, 09H
    INT 21H    
    mov DX, offset msg6
    mov AH, 09H
    INT 21H    
    mov AH, 01H
    INT 21H
    sub AL, 30H
    mov choice, al    
    cmp AL, 05H
    	jnz laba
    	mov AH, 4CH
     	INT 21H
laba:
    	mov DX, offset msg7
    	mov AH, 09H
    	INT 21H    
    	mov AH, 01H
    	INT 21H
    		call Input
    		rol AL, 04H
    		mov BL, AL
    	mov AH, 01H
    	INT 21H
    		call Input
    		add BL, AL    
    	mov DX, offset msg8
    	mov AH, 09H
    	INT 21H    
    	mov AH, 01H
    	INT 21H
    		call Input
    		rol AL, 04H
    		mov CL, AL
    	mov AH, 01H
    	INT 21H
    		call Input
    		add CL, AL   
    	cmp choice, 01h
    		jnz lab2	
    		add BL, CL
    		mov res, BL    
    		mov DX, offset msg9
    		mov AH, 09H
    		INT 21H            
        		and BL, 0F0H
        		ror BL, 04H        
        		call Output        
        		mov BL, res
        		and BL, 0FH        
        		call Output        
            	jmp menu        
lab2:
	cmp choice, 02h
   	jnz lab3	
   	sub BL, CL
   	mov res, BL   
   	mov DX, offset msg9
   	mov AH, 09H
   	INT 21H            
    and BL, 0F0H
    ror BL, 04H        
    call Output        
    mov BL, res
    and BL, 0FH
    call Output        
    jmp menu
lab3:
	cmp choice, 03h
	jnz lab4
	mov AL, BL
    mul CL
    mov res4, AX
    mov BX, AX    
    mov DX, offset msg9
    mov AH, 09H
    INT 21H            
        and BX, 0F000H
        ror BX, 0CH
        call Output        
        mov BX, res4
        and BX, 0F00H
        ror BX, 08H        
        call Output        
        mov BX, res4
        and BX, 0F0H
        ror BX, 04H        
        call Output        
        mov BX, res4
        and BX, 0FH        
        call Output        
        jmp menu        
lab4:   
	cmp choice, 04h
    mov AX, 0000H
    mov AL, BL
    div CL
    mov res4, AX
    mov BX, AX
    mov CL, AH    
    mov DX, offset msg10
    mov AH, 09H
    INT 21H            
        mov BX, res4
        and BX, 0F0H
        ror BX, 04H        
        call Output        
        mov BX, res4
        and BX, 0FH        
        call Output        
        mov BL, CL
    mov DX, offset msg11
    mov AH, 09H
    INT 21H        
    call Output    
    jmp menu    
Input proc
	cmp AL, 41H
		jc labi
	sub AL, 07H
	labi:
		sub AL, 30H
		ret
		endp   		
Output proc
	cmp BL, 0AH
		jc labo
	add BL, 07H
	labo:
		add BL, 30H
		mov DL, BL
		mov AH, 02H
        INT 21H
		ret
		endp        
code ends
end start
