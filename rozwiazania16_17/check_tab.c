unsigned int check_tab(int* tab, int n, int* max);
#include<stdio.h>
int main(){
	int tab[] = {0,0,1,2,4,4,4};
	int max = 0;
	int n = sizeof(tab)/sizeof(tab[0]);
	unsigned int a = check_tab(tab,n,&max);
	printf("%ld, %ld\n",a,max);
}
	

/*unsigned int f(int *tab, int n, int* max){
	int count,max,mask;

	for (int j=0; j<64; j++){
		for(int i=0; i<n; i++){
			if(tab[i]==j) tab[j]++;
		}
	}
	return 0;
}*/
