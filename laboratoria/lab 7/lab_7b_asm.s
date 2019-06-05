#----------------------------------------------------------------
# Funkcja do programu lab_7b - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------

	.type fiba, @function
	.globl fiba

fiba:	push %rbp
	mov %rsp,%rbp #push na stos

#rsp wskazuje na wierzchołek stosu

	sub $8,%rsp #zyskujemy miejsce

	cmp $0, %rdi
	jz f_0

	cmp $1, %rdi
	jz f_1

	push %rdi

	sub $2,%rdi
	call fiba
	mov %rax,-8(%rbp)

	pop %rdi

	dec %rdi
	call fiba
	add -8(%rbp),%rax

f_e:	mov %rbp,%rsp
	pop %rbp
	ret

f_0:
	mov $0, %rax
	jmp f_e

f_1:
	mov $1, %rax
	jmp f_e
