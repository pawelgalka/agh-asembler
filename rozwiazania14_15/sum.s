	.text
	.type sum,@function
	.global sum

sum:
	movl	%edi,%r8d

next:
	cmp	%edi,%esi
	jz	end
	inc	%edi
	addl	%edi,%r8d
	jmp 	next
end:
	movl	%r8d,%eax
	ret
