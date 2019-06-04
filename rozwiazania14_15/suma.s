	.text
	.type suma,@function
	.global suma

suma:
	#rdi - &tab
	#rsi - bok
	movl	$0,%ecx # licznik petli zewnetrznej
	movl	$0,%ebx
loop:
	cmpl	%ecx,%esi
	je	end
	mov	$0,%r14
	movq	(%rdi,%rcx,8),%r14
	addl	(%r14,%rcx,4),%ebx
	inc	%ecx
	jmp	loop
	
end:
	movl	%ebx,%eax
	ret
		
