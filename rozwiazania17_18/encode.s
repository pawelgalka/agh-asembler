	.text
	.type encode,@function
	.global	encode

encode:
	push	%rdi
	mov	$32,%bh
	
petla:
	cmpb	$0,(%rdi)
	je	end
	cmp	$1,%rsi
	je	cyfra
	cmpb	$'a',(%rdi)
	jge	mala
	cmpb	$'Z',(%rdi)
	jle	duza
	jmp	krok

mala:
	cmpb	$'z',(%rdi)
	jg	krok
	mov	$'z',%al
	subb	(%rdi),%al
	movb	(%rdi),%bl
	subb	$'a',%bl
	sub	%bl,%al
	addb	%al,(%rdi)
	cmp	$1,%rdx
	je	zmiana_malej
	jmp	krok

duza:
	cmpb	$'A',(%rdi)
	jl	cyfra

	mov	$'Z',%al
	subb	(%rdi),%al
	movb	(%rdi),%bl
	subb	$'A',%bl
	sub	%bl,%al
	addb	%al,(%rdi)
	cmp	$2,%rdx
	je	zmiana_duzej
	jmp	krok


zmiana_malej:
	subb	%bh,(%rdi)
	jmp	krok

zmiana_duzej:
	addb	%bh,(%rdi)
	jmp	krok

cyfra:
	cmpb	$'0',(%rdi)
	jge	next
	jmp	krok

next:
	cmp	$0,%rsi
	je	krok
	cmpb	$'9',(%rdi)
	jg	krok
	mov	$'9',%al
	subb	(%rdi),%al
	movb	(%rdi),%bl
	subb	$'0',%bl
	sub	%bl,%al
	addb	%al,(%rdi)
	jmp	krok


krok:
	inc	%rdi
	jmp 	petla

end:
	pop	%rax
	ret
