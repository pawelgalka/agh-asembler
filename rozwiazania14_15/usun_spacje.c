#include <stdio.h>
#include <stdlib.h>

char* usun_spacje(char* s,int mode);
int main()
{
  char* wsk = malloc(100);
  sprintf(wsk, "%s", "a  def   gh ijk");
  
  printf("%s\n", wsk);
  
  //0 - bez zamiany na duze litery; 1 - zamiana na duze litery
  printf("%s\n", usun_spacje(wsk, 1));
  
  free(wsk);
  return 0;
}
