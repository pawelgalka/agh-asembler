	.text
	.type	sum_expr,@function
	.global	sum_expr

sum_expr:
	mov	$0,%rbx
	xor	%r8,%r8
	xor	%r10,%r10
	xor	%rax,%rax

	cmp	$0,%rcx
	je	zero_loop
	cmp	$1,%rcx
	je	one_loop
	cmp	$2,%rcx
	je	two_loop
	cmp	$3,%rcx
	je	three_loop
	

zero_loop:
	mov	%rdx,%r14
	dec	%r14
zero:
	cmp	%rbx,%rdx
	jle	end
	movl	(%rsi,%r14,4),%eax
	imul	(%rdi,%rbx,4),%eax
	movsx	%eax,%r10
	add	%r10,%r8
	inc	%rbx
	dec	%r14
	jmp	zero

one_loop:
	cmp	%rbx,%rdx
	jle	end
	movl	(%rsi,%rbx,4),%eax
	imul	(%rdi,%rbx,4),%eax
	movsx	%eax,%r10
	add	%r10,%r8
	inc	%rbx
	jmp	one_loop

two_loop:
	mov	%rdx,%r14
	dec	%r14
two:
	cmp	%rbx,%rdx
	jle	end
	movl	(%rsi,%r14,4),%eax
	sub	(%rdi,%rbx,4),%eax
	movsx	%eax,%r10
	add	%r10,%r8
	inc	%rbx
	dec	%r14
	jmp	two

three_loop:
	cmp	%rbx,%rdx
	jle	end
	movl	(%rsi,%rbx,4),%eax
	sub	(%rdi,%rbx,4),%eax
	movsx	%eax,%r10
	add	%r10,%r8
	inc	%rbx
	jmp	three_loop
end:
	mov	%r8,%rax
	ret
	
