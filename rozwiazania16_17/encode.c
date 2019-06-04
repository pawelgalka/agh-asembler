char* encode(char* str, unsigned int mask, int operation, int character);

int main(){
	char str[10]="01asdf22";
	printf("%s\n",encode(str,3,1,48));
}
