DATA segment
msg1 db 0AH,0DH, "Enter the number to obtain its factorial: $"
msg2 db 0AH,0DH, "The Factorial of given no. is : $"
DATA ends

CODE segment
ASSUME CS:CODE,DS:DATA

start:
mov AX,DATA;
mov DS,AX;

mov DX,offset msg1;
mov AH,09H;
int 21H;

mov AH,01H;
int 21H;
sub AL,30H;
mov CL,AL;
rol AL,04H;
mov AH,01H;
int 21H;
sub AL,30H;
add CL,AL;
mov AX,01H;

fact:
cmp CL,00H;
jz exit;
call fact_p;
loop fact;

exit:
mov CX,AX;
mov BX,AX;
mov DX,offset msg2;
mov AH,09H;
int 21H;

AND BH,0F0H;
ror BH,04H;
call ascii1;
mov DL,BH;
mov AH,02H;
int 21H;

mov BH,CH;
AND BH,0FH;
call ascii1;
mov DL,BH;
mov AH,02H;
int 21H;

AND BL,0F0H;
ror BL,04H;
call ascii2;
mov DL,BL;
mov AH,02H;
int 21H;

mov BL,CL;
AND BL,0FH;
call ascii2;
mov DL,BL;
mov AH,02H;
int 21H;

mov AH,4CH;
int 21H;

ascii1 proc
cmp BH,0AH;
jc skip;
add BH,07H;
skip:
add BH,30H;
ret
endp

ascii2 proc
cmp BL,0AH;
jc skip2;
add BL,07H;
skip2:
add BL,30H;
ret
endp

fact_p proc
mul CL;
ret
endp

CODE ends
end START
