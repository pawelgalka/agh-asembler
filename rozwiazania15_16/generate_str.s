	.text
	.type generate, @function	
	.global	generate
generate:
	pushq	%rdi
	pushq	%rbp
	movq	%rsp,%rbp
char:
	mov	%rsi,(%rdi)
	inc	%rdi	#-> next char
	dec	%rdx	#-> n--
	cmp	$0,%rcx
	je	next
	inc	%rsi
next:
	cmp	$1,%rdx	# if(n>1)
	jge	char

	movb	$0,(%rdi)
	popq	%rbp
	popq	%rax
	
ret
