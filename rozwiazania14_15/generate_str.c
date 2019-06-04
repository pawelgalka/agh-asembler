#include<stdlib.h>
#include<stdio.h>
extern void generate(char *s, int c, int n, int inc);
int main(){
	int n = 7;
	int c = 97;
	int inc = 1; 
	char *s = malloc(n* sizeof(char));
	generate(s,c,n,inc);
	printf("%s\n",s);
}
