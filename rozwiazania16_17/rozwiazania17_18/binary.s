	.text
	.type	binary_op,@function
	.global	binary_op

binary_op:
	push	%rdi
	#mov	%rdi,%rax
	xor	%rax,%rax
	xor	%r8,%r8
	xor	%r9,%r9
	
first_to_num:
	cmpb	$0,(%rsi)
	je	second_to_num
	shl	$1,%r8
	cmpb	$'0',(%rsi)
	je	next1
	inc	%r8	#bit jest jedynka

next1:
	inc	%rsi
	jmp	first_to_num

second_to_num:
	cmpb	$0,(%rdx)
	je	select
	shl	$1,%r9
	cmpb	$'0',(%rdx)
	je	next2
	inc	%r9

next2:
	inc	%rdx
	jmp	second_to_num

select:
	cmp	$0,%rcx
	je	add
	cmp	$1,%rcx
	je	and
	cmp	$2,%rcx
	je	or
	cmp	$3,%rcx
	je	xor
	jmp 	error

add:
	add	%r9,%r8
	jmp	write

and:
	and	%r9,%r8
	jmp	write

or:
	or	%r9,%r8
	jmp	write
	
xor:
	xor	%r9,%r8

write:
	xor	%r10,%r10
	mov	$1,%r10 	#maska
	shl	$63,%r10	#idziemy od najstarszego
	mov	$0,%r14
	mov	$0,%r15
write1:
	test	%r10,%r8
	jz	zero
	jmp	one	

zero:
	cmp	$0,%r14
	je	char1
	movb	$'0',(%rdi)
	jmp	char


one:
	mov	$1,%r14
	movb	$'1',(%rdi)
	jmp 	char

char:
	inc	%rdi
char1:
	shr	$1,%r10
	cmp	$0,%r10
	jne	write1
	movb	$0,(%rdi)
	jmp	end


	
error:
	movb	$0,(%rdi)
	jmp	end

end:	
	pop	%rax
	ret
