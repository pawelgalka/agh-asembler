	.text
	.type is_outside, @function
	.global is_outside

is_outside:
	cmpl	%esi,%edx 	#porównaj a,b
	jg	b_wieksze
	movl	%esi,%r8d	# a wieksze

b_wieksze:
	movl	%edx,%r8d
	cmpl	%edi,%r8d	#porównaj z max(a,b)
	jg	x_mniejsze_lub_rowne_od_maxab
	movl	$1,%eax
	jmp	end

x_mniejsze_lub_rowne_od_maxab:
	cmpl	%esi,%edx	#znowu porównanie a,b
	jg	a_mniejsze
	movl	%edx,%r8d	# b mniejsze

a_mniejsze:
	movl	%esi,%r8d	# min(a,b) = a
	cmpl	%edi,%r8d
	jg	zwroc_minus_jeden
	movl	$0,%eax
	jmp	end

zwroc_minus_jeden:
	movl	$(-1),%eax

end:
	ret
