	.text
	.type	find_dist,@function
	.global	find_dist

find_dist:
	#rdi - &tab
	#rsi - n
	#rdx - &min
	#rcx - &max
	#xmm0 - &variance
	pushq	%rbp
	mov	%rsp,%rbp
	mov	$0,%r9d
	movl	$0,-4(%rbp) #index min
	movl	$0,-8(%rbp) #index max
	movl	(%rdi),%r14d #min
	movl	(%rdi),%r15d #max
	finit
loop:
	cmpl	%r9d,%esi
	je	end_loop
	movq	$0,%r10
	movl	(%rdi,%r9,4),%r10d
	cmpl	(%rdi,%r9,4),%r14d
	jle	wiekszy
	movl	(%rdi,%r9,4),%r14d
	movl	%r9d,(%rdx)

wiekszy:

	cmpl	(%rdi,%r9,4),%r15d
	jge	next

	movl	(%rdi,%r9,4),%r15d
	movl	%r9d,(%rcx)

next:
	inc	%r9d
	jmp 	loop


end_loop:
	movl	(%rcx),%eax
	subl	(%rdx),%eax
	pop	%rbp

	ret
