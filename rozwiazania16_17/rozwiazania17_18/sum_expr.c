long int sum_expr(int *tabA, int *tabB, int n, int operation );
int main(){
int tabA[] = {0,1,2,3,4,5,6,7,8,0};
int tabB[] = {9,8,7,6,5,4,3,2,1,0};
int n = 10;
int operation = 3;
int i;
printf("Tab size = %d\n", n );
for( i = 0; i < n; i++)
printf("TabA[%2d] = %d TabB[%2d] = %d\n", i, tabA[i], i, tabB[i] );
printf("Operation = %d\n", operation );
printf("Sum of expressions = %ld\n", sum_expr( tabA, tabB, n, operation ) );
return 0;
}

void a(int *tab){
	int b = tab[1];
}
	
