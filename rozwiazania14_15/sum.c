#include <stdio.h>
#include <unistd.h>
int sum(int a, int b);


int main(int argc, char** argv){
int ret;
ret = sum(atoi(argv[1]),atoi(argv[2]));
printf("Wynik: %d \n", ret);
return 0;
}
