#include<stdio.h>
#include<conio.h>
void main()
{int ch,a;
do
{printf("ENTER CHOICE 1.INCREMENT 2.DECREMENT 3.DISABLE 4.EXIT \n");
scanf("%d",&ch);
printf("ENTER SIZE \n");
scanf("%d",&a);
switch(ch)
{case 1:asm{mov cx,a;
mov ah,01;
inc cl;
int 10h;
}
break;
case 2:asm{mov cx,a;
mov ah,01;
dec cl;
int 10h;}
break;
case 3: asm{ mov ah,01
int 10h;}
}

}while(ch!=4);
}
