#include<stdio.h>
#include<conio.h>
void main()
{
int a,b,c,d;
clrscr();
printf("Enter First Number:");
scanf("%d",&a);
printf("Enter Second Number:");
scanf("%d",&b);
asm{
    mov ax,a;
    mov bx,b;}
    back:
   asm{ cmp ax,bx;
    jc sec;}
   first:
  asm{  sub ax,bx;
    jmp check;}
   sec:
  asm{  sub bx,ax; }
   check:
 asm{   cmp ax,bx;
    jnz back;
    mov c,ax;
     }

printf("GCD is: %d\n",c);
d=(a*b)/c;
printf("LCM is:%d",d);
getch();
}
