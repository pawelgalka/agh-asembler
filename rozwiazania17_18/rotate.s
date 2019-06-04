	.text
	.type rotate_str,@function
	.global	rotate_str

rotate_str:
	xor	%rbx,%rbx
	xor	%rax,%rax
	movl	$26,%r9d
	push 	%rdi
	mov	%rdx,%r14

elo:
	mov	$0,%rbx
	mov	$0,%rax
	mov	$0,%rdx
	cmpb	$0,(%rdi)
	je	end
	movb	(%rdi),%bl
	cmpb	$'z',(%rdi)
	jg	incr
	cmpb	$'a',(%rdi)
	jl	is_big
	jmp	small

is_big:
	cmpb	$'A',(%rdi)
	jl	incr
	cmpb	$'Z',(%rdi)
	jg	incr
	
big:
	subb	$'A',%bl
	movsx	%bl,%eax
	addl	%esi,%eax
	cmpl	$0,%eax
	jg	d1
	addl	$26,%eax
d1:
	idiv	%r9d
	mov	%dl,%bl
	cmpl	$2,%r14d
	jne	dod1
	jmp	male
dod1:
	cmpl	$3,%r14d
	jne	dod
male:
	addb	$'a',%bl
	jmp	next_char
	
dod:
	addb	$'A',%bl
next_char:
	movb	%bl,(%rdi)
	jmp	incr
small:
	subb	$'a',%bl
	movsx	%bl,%eax
	addl	%esi,%eax
	cmpl	$0,%eax
	jg	d
	addl	$26,%eax
d:
	idiv	%r9d
	mov	%dl,%bl
	cmpl	$1,%r14d
	jne	dod11
	jmp	duze
dod11:
	cmpl	$3,%r14d
	jne	dod111
duze:
	addb	$'A',%bl
	jmp	next_char1
dod111:
	addb	$'a',%bl
next_char1:
	movb	%bl,(%rdi)
incr:
	inc	%rdi
	jmp	elo
	
end:
	movb	$0,(%rdi)
	pop	%rax
	ret
