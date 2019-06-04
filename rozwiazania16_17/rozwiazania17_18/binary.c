
#include<stdio.h>
char* binary_op(char* s, char* a, char* b, int op);
int main(){
char arg1[] = "101001";
char arg2[] = "101010";
char res[ 65 ];
int oper = 3;
printf("Argument 1: %s\n", arg1 );
printf("Argument 2: %s\n", arg2 );
printf("Operation : %d\n", oper);
printf("Result : %s\n", binary_op( res, arg1, arg2, oper ) );
return 0;
}


