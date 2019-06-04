	.text
	.type max2,@function
	.global	max2

max2:
	movl	%edi,%eax
	addl	%esi,%eax
	movl	%edi,%ebx
	imul	%esi,%ebx	
	movl	%edi,%ecx
	subl	%esi,%ecx
	movl	%eax,%edx # max to a+b
	cmpl	%edx,%ebx
	jg	ab
	cmpl	%edx,%ecx
	jg	a_b
	jmp	end

ab:
	movl	%ebx,%edx
	cmpl	%edx,%ecx
	jg	a_b
	jmp	end

a_b:
	movl	%ecx,%edx

end:
	movl	%edx,%eax
	ret



