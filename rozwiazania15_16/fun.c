#include<stdlib.h>
#include<stdio.h>
char* fun(char* s,char* a,char* b);
int main(){
	char* buf = (char*)malloc(100*sizeof(char));
	printf("%s \n",fun(buf,"a","nre uaaaaa"));
	free(buf);
}
