	.text
	.type usun_spacje,@function
	.global usun_spacje

usun_spacje:
	#zamiana na duze - odjecie od kodu 32
	#0 - bez zamiany
	#1 - zamiana

	push	%rdi
	mov	%rsi,%r8	#tryb do r8

	mov	%rdi,%rsi #odczyt z rsi
			  #zapis do rdi

next_char:
	mov	(%rsi),%al	#weź wartość ze stringa
	cmp	$0,%al	#czy koniec
	je	koniec
	cmp	$(' '),%al	#czy spacja
	jne	przepisz	#jak nie to przepisz znak

	inc	%r9	#jak spacja to zwieksz
	cmp	$1,%r9	#czy pierwsza spacja
	je	przepisz_spacje	
	jmp 	next_loop

przepisz:
	mov	$0,%r9	# zero spacji jest
	cmp	$0,%r8	# porównaj tryb
	jne	na_duze
	jmp	przepisz1

na_duze:
	subb	$32,%al
przepisz1:
	mov	%al,(%rdi)
	inc	%rdi
	jmp	next_loop

przepisz_spacje:
	mov	%al,(%rdi)	
	inc	%rdi

next_loop:
	inc	%rsi	#nastepny znak stringa
	jmp 	next_char

koniec:
	movb	$0,%al	#akoncz stringa
	movb	%al,(%rdi)

end:
	popq	%rax	
	ret
