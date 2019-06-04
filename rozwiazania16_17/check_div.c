#include<stdio.h>

unsigned long check_div(long a, long b,long c);


/*unsigned f(long a,long b,long c){
	if(c==0){
		if(a%b == 0)	return 1;
		else	return 0;
	}
	else{
		unsigned long ret =0;
		unsigned long mask = 0;
		int i = 1;
		while (i<65){
			mask = 1;
			if (a%i == 0){
				printf("i %d\n",i);
				mask = mask << (i-1);
				ret = ret | mask;
				printf("%ld\n",mask);
			}
			i++;
		}
		return ret;
	}
}
			
	*/
int main(int argc, char** argv){
	printf("%ld\n",check_div(atoi(argv[1]),atoi(argv[2]),atoi(argv[3])));
}			
