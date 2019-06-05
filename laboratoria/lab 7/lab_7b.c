//---------------------------------------------------------------
// Program lab_7b - Asemblery Laboratorium IS II rok
//
// To compile&link: gcc -o lab_7b lab_7b.c lab_7b_asm.s
// To run:          ./lab_7b
//
//---------------------------------------------------------------

#include <stdio.h>

long long fibc( unsigned int k )
{
	if( k == 0 )
		return 0;
	else if( k == 1 )
		return 1;
	else
		return fibc( k - 2 ) + fibc( k - 1 );
}

long long fiba( unsigned int k );

void main( void )
{
 int i;

 for( i = 0; i <= 10; i++ )
   printf( "FibC( %2d ) = %ld FibA = %ld\n", i, fibc( i ), fiba( i ) );
}
