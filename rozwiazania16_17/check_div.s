	.text
	.type check_div,@function
	.global check_div

check_div:
	mov	$1,%rbx
	mov	$0,%r15
	mov	$1,%r14
	mov	%esp,%ebp
	mov	%edx,%r8d
	xor 	%rdx,%rdx
	xor	%rax,%rax
	
	cmp	$0,%r8d
	je	c_zero
	mov	$1,%r9d	#w r9 dzielnik

c_notzero:
	mov	%edi,%eax
	mov	$0,%edx
	div	%r9d
	cmp	$0,%edx
	jne	next_loop
	or	%r14,%r15

next_loop:
	shl	$1,%r14
	inc	%r9d
	cmp	$64,%r9d
	jg	end1
	jmp 	c_notzero
	

c_zero:
	mov	%rdi,%rax
	idiv	%rsi
	cmp	$0,%rdx
	je	return_one

return_zero:
	mov	$0,%rax
	jmp	end

return_one:
	mov	$1,%rax
	jmp	end
	
end1:
	mov	%r15,%rax
end:
	ret
