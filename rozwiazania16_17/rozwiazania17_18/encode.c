char *encode(char *str, int charset, int cas );
#include<stdio.h>
int main(){
char str[] = "co jest tekst do zaszyfrowania. A to cyferki 0123456789";
int charset = 0;
int cas = 2;
printf("Original string: %s\n", str );
printf("Charset: %d\n", charset );
printf("Case : %d\n", cas );
printf("Encoded string : %s\n", encode( str, charset, cas ) );
return 0;
}
