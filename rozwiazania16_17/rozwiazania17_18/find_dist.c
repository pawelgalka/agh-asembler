long int find_dist(int *tab, int n, int *min_pos, int *max_pos, double *variance );
int main(){
int tab[] = {0,-3,2,-4,6,-8,1,5,-7,9};
int n = 10;
int min_pos, max_pos;
int i;
double variance;
printf("Tab size = %d\n", n );
for( i = 0; i < n; i++)
printf("Tab[%2d] = %d\n", i, tab[i] );
printf("Min-max distance = %ld\n", find_dist( tab, n, &min_pos, &max_pos, &variance ) );
printf("Minimum found at = %d\n", min_pos );
printf("Maximum found at = %d\n", max_pos );
printf("Variance of data = %lf\n", variance );
return 0;
}
