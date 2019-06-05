//----------------------------------------------------------------
// Program lab_9b.c - Asemblery Laboratorium IS II rok
//----------------------------------------------------------------
//
//   to compile & link:  gcc -no-pie -lm -o lab_9b lab_9b.c lab_9b.s
//   to run: 		./lab_9b
//
//----------------------------------------------------------------

#include <stdio.h>

double sqrtA( double x );
double sqrtB( double x );
double sqrtC( double x );

int main( void )
{
 int i;
 double x, yA, yB, yC;

  for( i = 1; i <= 10; i++ )
  {
    x = i;
    yA = sqrtA( x );
    yB = sqrtB( x );
    yC = sqrtC( x );
    printf("A: Square root of %lf = %.20lf\n", x, yA );
    printf("B: Square root of %lf = %.20lf\n", x, yB );
    printf("C: Square root of %lf = %.20lf\n", x, yC );
  }
  return 0;
}

