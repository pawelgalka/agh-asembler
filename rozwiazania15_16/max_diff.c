#include<stdio.h>
int main(){
	printf("%d\n",diff(0,-1,3,4));
}

int abc(int a,int b,int c,int d){
	int min,max;
	min = a;
	max = b;
	if (b<min) min = b;
	if (c<min) min = c;
	if (d<min) min = d;
	if (a>max) max = a;
	if (c>max) max = c;
	if (d>max) max = d;
	return max-min;
}
