	.text
	.type encode,@function
	.global encode

encode:
	pushq	%rdi
	mov	%rsi,%r14
	mov	%rdi,%rsi #odczyt z rsi, zapis do rdi
	mov	%rcx,%r15
	
	#esi - mask
	#edx - operation
	#ecx - character


main_loop:
	cmpb	$0,(%rsi)
	je	end_main
	cmpb	$57,(%rsi)
	jg	nothing1
	cmpb	$48,(%rsi)
	jl	nothing1
	mov	(%rsi),%cl
	subb	$48,%cl
mm:
	mov	$1,%eax
	shl	%cl,%eax
	and	%r14d,%eax
	cmpl	$0,%eax
	je	nothing2
	cmpl	$0,%edx
	jne	check_one
	addb	$48,%cl
	movb	%cl,(%rdi)
	inc	%rdi
	jmp	nothing

check_one:
	cmpl	$1,%edx
	jne	check_two
	jmp	nothing
	
check_two:
	cmpl	$2,%edx
	jne	check_three
	neg	%cl
	addb	$57,%cl
	movb	%cl,(%rdi)
	inc	%rdi
	jmp	nothing

check_three:	
	movb	%r15b,(%rdi)
	inc	%rdi
	jmp	nothing

nothing1:
	movb	(%rsi),%r15b
	movb	%r15b,(%rdi)
	inc	%rdi
	jmp	nothing

nothing2:
	addb	$48,%cl
	movb	%cl,(%rdi)
	inc	%rdi
	jmp	nothing
nothing:
	inc	%rsi
	jmp	main_loop



end_main:
	movb	$0,(%rdi)
	popq	%rax
	ret
