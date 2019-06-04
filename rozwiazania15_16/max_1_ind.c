long long max_1_ind(long long *tab, long long n, long long *e, long long *o);

int main(){
	long long tab [ 7 ] = { -1 ,2 , -3 ,4 ,5 , -6 ,-7};
	long long *a = malloc(sizeof(long long));
	long long *b = malloc(sizeof(long long));
	long long max = max_1_ind(tab,7,a,b);
	printf("%lld, %lld, %lld\n",*a,*b,max);
}
	
