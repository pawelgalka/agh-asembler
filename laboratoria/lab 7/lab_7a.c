//---------------------------------------------------------------
// Program lab_7a - Asemblery Laboratorium IS II rok
//
// To compile&link: gcc -o lab_7a lab_7a.c lab_7a_asm.s
// To run:          ./lab_7a
//
//---------------------------------------------------------------

#include <stdio.h>

long long factc( unsigned int k )
{
	if( k <= 1 )
		return 1;
	else
		return k * factc( k - 1 );
}

long long facta( unsigned int k );

void main( void )
{
 int i;

 for( i = 1; i <= 25; i++ )
   printf( "FactC(%d) = %ld FactA = %ld\n", i, factc(i), facta(i) );
}
