	.text
	.type check_tab,@function
	.global check_tab

check_tab:
	movq	$1,%r8	#maska
	movl	$0,%r9d	#outer counter
	movl	$0,%r15d #max wystapień
	movq	$0,%r12	#wynik bitowy
outer_loop:	# od 0 do 63
	cmpl	$64,%r9d
	je	end_outer
	movl	$0,%r14d	#indeks inner loop
	movl	$0,%r11d	#ilosc wystapien elementu
inner_loop:	# po elementach
	cmpl	%r14d,%esi
	je	end_inner
	cmpl	(%rdi,%r14,4),%r9d
	je	dodaj_wystapienie
	jmp	next_inner
dodaj_wystapienie:
	incl	%r11d
next_inner:
	incl	%r14d
	jmp	inner_loop

end_inner:
	cmpl	(%rdx),%r11d
	jg	zmiana_maxa
	jmp	ustaw_bit
zmiana_maxa:
	movl	%r11d,(%rdx)
ustaw_bit:
	cmpl	$0,%r11d
	jne	ustaw
	jmp	po_ustaw
ustaw:
	or	%r8,%r12
po_ustaw:
	shl	$1,%r8
	incl	%r9d
	jmp	outer_loop
	
	


end_outer:

	movq	%r12,%rax
	ret
	
