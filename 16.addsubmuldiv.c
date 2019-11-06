#include<stdio.h>
#include<conio.h>
void main()
{
int a,b,c,ch;
clrscr();
do
{
printf("\nMenu\n1.Addition\n2.Subtraction\n3.Multiplication\n4.Division\n5.Exit\nEnter your choice:");
scanf("%d",&ch);
if(ch!=5){
printf("Enter First Number:");
scanf("%d",&a);
printf("Enter Second Number:");
scanf("%d",&b);
}
switch(ch)
{
    case 1:
        asm{mov ax,0000h;
    mov bx,0000h;
    mov ax,a;
    mov bx,b;
            mov a,ax;
            add ax,bx;
            mov c,ax;
            mov b,bx;}
        printf("%d + %d = %d\n",a,b,c);
    break;
    case 2:
        asm{mov ax,0000h;
    mov bx,0000h;
    mov ax,a;
    mov bx,b;
            mov a,ax;
            sub ax,bx;
            mov c,ax;
            mov b,bx;}
        printf("%d - %d = %d\n",a,b,c);
        break;
    case 3:
        asm{mov ax,0000h;
    mov bx,0000h;
    mov ax,a;
    mov bx,b;
            mov a,ax;
            mul bx;
            mov c,ax;
            mov b,bx;}
        printf("%d * %d = %d\n",a,b,c);
        break;
    case 4:
        asm{mov ax,0000h;
    mov bx,0000h;
    mov ax,a;
    mov bx,b;
            mov a,ax;
            div bx;
            mov c,ax;
            mov b,bx;}
        printf("%d / %d = %d\n",a,b,c);
        break;
}
}while(ch!=5);
getch();
}
