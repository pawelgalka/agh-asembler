long int sum_ascii(char *str, int a, int b, int charset, int *count );

#include<stdio.h>
int main(){
	char str[] = "abcdefG09";
	int a = 5;
	int b = 100;
	int c = 0;
	printf("%d\n",sum_ascii(str,a,b,0,&c));
	printf("%d\n",c);
}

char* sum(char *str, int a, int b, int charset, int *count){
	int ab = str[0];
	return str;
	}
