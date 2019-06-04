	.text
	.type range,@function
	.global range

range:
	xor	%rax,%rax
	cmpl	%edi,%esi	#x,a
	jg	jmp_zero	# x<a
	cmpl	%edi,%edx	#x,b
	jg	jmp_one
	cmp	%edi,%ecx
	jg	jmp_two
	movl	$3,%eax
	jmp	end

jmp_zero:
	movl	$0,%eax
	jmp	end

jmp_one:
	movl	$1,%eax
	jmp	end

jmp_two:
	movl	$2,%eax
	jmp	end

end:
	ret
