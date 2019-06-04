	.data
ones:
	.long	0
index:
	.long 	0
counter_inner:
	.long	0
	
	.text
	.type max_ind, @function
	.global max_1_ind

max_1_ind:
	#rsi - &tab
	#rdi - n
	#rdx - even
	#rcx - odd
	movq	$0,%r8	#outer
	movq	$0,%rbx
	movq	$0,%r14
	movq	%rdx,%r15
	movl	$2,%r9d
	movq	$1,%r10	#maska
	

outer_loop:
	cmpq	%rsi,%r8
	je	end
	movq	(%rdi,%r8,8),%rax
	movq	$0,%rdx
	idiv	%r9d
	cmp	$0,%rdx
	je	even
	#odd
	inc	%r14
	jmp	after_check
even:
	inc	%rbx
	jmp	after_check
after_check:
	inc	%r8
	jmp	outer_loop
end:	
	movq	%rbx,(%r15)
	movq	%r14,(%rcx)
	movq	$0,%rax
	ret	
