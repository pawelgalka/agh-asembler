#----------------------------------------------------------------
# Program lab_1b.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_1b.o lab_1b.s
#  To link:    ld -o lab_1b lab_1b.o
#  To run:     ./lab_1b
#
#----------------------------------------------------------------

	.equ	write_64, 1	# write data to file function (64bit)
	.equ	exit_64, 60	# exit program function (64bit)
	.equ	stdout, 0x01	# handle to stdout

	.data
	
starttxt:			# first message
	.ascii	"Start\n"
endtxt:				# second message
	.ascii	"Finish\n"
arg1:				# first argument
	.byte		1
arg2:				# second argument
	.word		2
arg3:				# third argument
	.long		3
result:				# result
	.long		0	

	.equ	startlen, endtxt - starttxt
	.equ	endlen, arg1 - endtxt
 
	.text
	.global _start
	
_start:
	MOV	$write_64,%rax
	MOVQ	$stdout,%rdi
	MOV	$starttxt,%rsi
	MOVQ	$startlen,%rdx
	SYSCALL

	NOP

	MOVB	arg1,%al
	MOVW	arg2,%bx
	MOVL	arg3,%ecx
	ADD	%ebx,%eax
	SUB	%ecx,%eax
	MOVL	%eax,result

	NOP

	MOV	$write_64,%rax
	MOVQ	$stdout,%rdi
	MOV	$endtxt,%rsi
	MOVQ	$endlen,%rdx
	SYSCALL

	NOP

theend:
	MOV	$exit_64,%rax
	SYSCALL

