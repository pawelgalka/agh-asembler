	.text
	.type max_ind, @function
	.global max_ind

max_ind:
	movl	$1,%r9d # max indec jest pierwszy na razie
	movl	%edi,%r8d # max
	movl	$0,%r14d
	cmpl	%esi,%r8d	#b<max
	jg	pierwszy_max
	movl	%esi,%r8d	#jesli b>max to max = b
	movl	$2,%r9d
pierwszy_max:
	cmpl	%edx,%r8d
	jg	drugi_max
	movl	%edx,%r8d
	movl	$3,%r9d
drugi_max:
	cmpl	%ecx,%r8d
	jg	trzeci_max
	movl	%ecx,%r8d
	movl	$4,%r9d
trzeci_max:
	cmpl	%r8d,%edi
	je	possible_zero
	jmp	a
possible_zero:
	addl	$1,%r14d
a:
	cmpl	%r8d,%esi
	je	possible_zero1
	jmp	b

possible_zero1:
	addl	$1,%r14d
b:
	cmpl	%r8d,%edx
	je	possible_zero2
	jmp 	c
possible_zero2:
	addl	$1,%r14d
c:
	cmpl	%r8d,%ecx
	je	possible_zero3
	jmp	d
possible_zero3:
	addl	$1,%r14d
d:
	cmpl	$1,%r14d
	jg	zero
	jmp	end
zero:
	movl	$0,%eax
	jmp	end1
end:
	movl	%r9d,%eax

end1:

	ret
