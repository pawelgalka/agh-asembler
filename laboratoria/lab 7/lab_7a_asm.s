#----------------------------------------------------------------
# Funkcja do programu lab_7a - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------

	.text
	.type facta, @function
	.globl facta	

facta:	mov $1, %rax

# w rdi argumenty dla funkcji
# w rax wartość zwracana
# na poczatku w stosie adresy powrotów
# stos:
# adres powrotu do prog. głównego
# 4
# adres powrotu do funkcji
# 3
# adres powrotu do funkcji
# 2
# adres powrotu do funkcji
# 1
# instrukcja ret konczy zagłębienie stosu

	cmp %rax, %rdi  #if (k <= 1) => if(rdi <= rax = 1)
	jbe f_e		#return => rax = 1 => return value = 1
	
	push %rdi

	dec %rdi	#k--
	call facta 	#factorial(k-1)

	pop %rdi

	mul %rdi	#rax * rdi => rax

f_e:	ret

