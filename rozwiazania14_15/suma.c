/* Wielkosc tablicy ustawia sie za pomoca stalej BOK */

#include <stdio.h>
#include <stdlib.h>

#define BOK 4


int main()
{
  int i, k, licznik = 0;
  int** wsk = malloc(BOK * sizeof(int*));

  for(i = 0; i < BOK; ++i)
  {
    wsk[i] = malloc(BOK * sizeof(int));
  }

  for(i = 0; i < BOK; ++i)
  {
    for(k = 0; k < BOK; ++k)
    {
      wsk[i][k] = licznik;
      ++licznik;

      printf("%d\t", wsk[i][k]);
    }

    printf("\n");
  }

  printf("Suma przekatnej to: %d\n", suma(wsk, BOK));

  for(i = 0; i < BOK; ++i)
  {
    free(wsk[i]);
  }
  free(wsk);

  return 0;
}

int f(int **tab,int n){
    int wynik = 0;
    for (int i=0; i<n; i++)
        wynik += tab[i][i];
    return wynik;
}
