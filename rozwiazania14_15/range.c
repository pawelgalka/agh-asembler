#include <stdio.h>
#include <unistd.h>

extern int range(int x, int a, int b,int c);

int main(int argc, char** argv){
int ret=range(atoi(argv[1]),atoi(argv[2]),atoi(argv[3]),atoi(argv[4]));
printf("Wynik: %d \n", ret);
return 0;
}
