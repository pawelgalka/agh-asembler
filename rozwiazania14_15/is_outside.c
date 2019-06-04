#include <stdio.h>
#include <unistd.h>

extern int is_outside(int x, int a, int b);

int main(int argc, char** argv){
int ret;
ret = is_outside(atoi(argv[1]),atoi(argv[2]),atoi(argv[3]));
printf("Wynik: %d \n", ret);
return 0;
}
