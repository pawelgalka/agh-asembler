	.text
	.type sum_ascii,@function
	.global sum_ascii

#r9 - indeks w stringu
#r10 - suma

sum_ascii:
	mov	$1,%r14
	xor	%r9,%r9
	xor	%r15,%r15
	cmp	$0,%rcx
	je	all
	cmp	$1,%rcx
	je	cmpr
	cmp	$2,%rcx
	je	cmpr1
	cmp	$3,%rcx
	je	cmpr2
	cmp	$4,%rcx
	je	cmpr3
	jmp	end
all:
	movb	(%rdi,%rsi),%al
	movsx	%al,%r15
	add	%r15,%r9
	add 	%r14,(%r8)
	inc	%rsi
	cmp	%rsi,%rdx
	jl	end
	cmpb	$0,(%rdi,%rsi)
	je	end
	jmp	all

cmpr:
	cmpb	$'0',(%rdi,%rsi)
	jge	next_digit
	jmp	a
next_digit:
	cmpb	$'9',(%rdi,%rsi)
	jg	a
	movb	(%rdi,%rsi),%al
	movsx	%al,%r15
	add	%r15,%r9
	add 	%r14,(%r8)
a:
	inc	%rsi
	cmp	%rsi,%rdx
	jl	end
	cmpb	$0,(%rdi,%rsi)
	je	end
	jmp	cmpr


cmpr1:
	cmpb	$65,(%rdi,%rsi)
	jge	next_big
	jmp	b
next_big:
	cmpb	$90,(%rdi,%rsi)
	jg	b
	movb	(%rdi,%rsi),%al
	movsx	%al,%r15
	add	%r15,%r9
	add	%r14,(%r8)
b:
	inc	%rsi
	cmp	%rsi,%rdx
	jl	end
	cmpb	$0,(%rdi,%rsi)
	je	end
	jmp	cmpr1

cmpr2:
	cmpb	$'a',(%rdi,%rsi)
	jge	next_small
	jmp	c

next_small:
	cmpb	$'z',(%rdi,%rsi)
	jg	c
	movb	(%rdi,%rsi),%al
	movsx	%al,%r15
	add	%r15,%r9
	add	%r14,(%r8)
c:
	inc	%rsi
	cmp	%rsi,%rdx
	jl	end
	cmpb	$0,(%rdi,%rsi)
	je	end
	jmp	cmpr2

cmpr3:
	cmpb	$'z',(%rdi,%rsi)
	jle	next_letter
	jmp	d

next_letter:
	cmpb	$'A',(%rdi,%rsi)
	jge	next_letter1
	jmp	d

next_letter1:
	cmpb	$'Z',(%rdi,%rsi)
	jle	next_letter2
	cmpb	$'a',(%rdi,%rsi)
	jge	next_letter2
	jmp	d

next_letter2:
	movb	(%rdi,%rsi),%al
	movsx	%al,%r15
	add	%r15,%r9
	add	%r14,(%r8)

d:
	inc	%rsi
	cmp	%rsi,%rdx
	jl	end
	cmpb	$0,(%rdi,%rsi)
	je	end
	jmp	cmpr3
	
end:
	mov	%r9,%rax

	ret




