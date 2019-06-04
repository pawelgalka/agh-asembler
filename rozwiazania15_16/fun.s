	.text
	.type fun, @function
	.global fun

fun:
	push	%rdi
next:
	cmpb	$0,(%rsi)
	je	koniec_a
	movb	(%rsi),%r8b
	movb	%r8b,(%rdi)
	inc 	%rdi
	inc	%rsi	
koniec_a:
	cmpb	$0,(%rdx)
	je	koniec_b	#jeśli napisy sie skonczyly
	movb	(%rdx),%r8b
	movb	%r8b,(%rdi)
	inc	%rdi
	inc	%rdx
	jmp 	next
koniec_b:
	jmp 	end

end:
	movb	$0,(%rdi)
	pop	%rax
	ret
