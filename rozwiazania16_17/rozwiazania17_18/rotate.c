char *rotate_str(char *str, int shift, int cas );
int main(){
char str[] = "To jest napis testowy";
int shift = -8;
int cas = 3;
printf("Original string: %s\n", str );
printf("Shift = %d\n", shift );
printf("Case = %d\n", cas );
printf("Rotated string : %s\n", rotate_str( str, shift, cas ) );
return 0;
}
