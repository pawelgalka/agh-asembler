//---------------------------------------------------------------
// Program lab_8a - Asemblery Laboratorium IS II rok
//
// To compile&link: gcc -o lab_8a lab_8a.c lab_8a_asm.s
// To run:          ./lab_8a
//
//---------------------------------------------------------------

#include <stdio.h>

long long int factc( unsigned int k )
{
	long long result = 1;
	while( k > 1 )
	   result *= k--;
	return result;			
}

long long int facta( unsigned int k );

void main( void )
{
 int i;

 for( i = 1; i <= 6; i++ )
   printf( "Fact(%d) = %ld FactA = %ld\n", i, factc(i), facta(i) );
}
