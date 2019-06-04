	.text
	.type diff, @function
	.global diff

diff:
	xor 	%rax,%rax
	movl	%edi,%r8d #tu jest max (poczatkowo a)
	movl 	%esi,%r9d # tu jest min (poczatkowo b)

#szukanie maxa
	cmpl	%esi,%r8d	#b<max
	jg	pierwszy_max
	movl	%esi,%r8d	#jesli b>max to max = b
pierwszy_max:
	cmpl	%edx,%r8d
	jg	drugi_max
	movl	%edx,%r8d
drugi_max:
	cmpl	%ecx,%r8d
	jg	trzeci_max
	movl	%ecx,%r8d
trzeci_max:
	cmpl	%edi,%r9d
	jl	pierwszy_min
	movl	%edi,%r9d	#jesli b>max to max = b
pierwszy_min:
	cmpl	%edx,%r9d
	jl	drugi_min
	movl	%edx,%r9d
drugi_min:
	cmpl	%ecx,%r9d
	jl	trzeci_min
	movl	%ecx,%r9d
trzeci_min:

	movl	%r8d,%eax
	subl	%r9d,%eax
	ret
