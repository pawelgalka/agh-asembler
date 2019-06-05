#----------------------------------------------------------------
# Program lab_4a.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_4a.o lab_4a.s
#  To link:    ld -o lab_4a lab_4a.o
#  To run:     ./lab_4a
#
#----------------------------------------------------------------

	.equ	write_64, 1	#write data to file function
	.equ	exit_64, 60	#exit program function
	.equ	stdout, 1 	#handle to stdout

	.data
	
arg1txt:
	.ascii	"Arg1 = "
arg2txt:
	.ascii	"Arg2 = "
sumtxt:
	.ascii	"Sum  = "
difftxt:
	.ascii	"Diff = "
ortxt:
	.ascii	"OR   = "
andtxt:
	.ascii	"AND  = "
xortxt:
	.ascii	"XOR  = "
arg1:				#first argument
	.byte	0xA0
arg2:				#second argument
	.byte	0x05
result:				#result
	.byte	0
tmp:
	.byte	0
restxt:
	.ascii	"  \n"
txtlen:
	.quad	7
reslen:
	.quad	3
hex_tab:
	.byte '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'

	.text
	.global _start
	
_start:
	NOP

	MOVB	arg1,%al
	MOV	$arg1txt,%rsi
	CALL	disp_line

	NOP

	MOVB	arg2,%al
	MOV	$arg2txt,%rsi
	CALL	disp_line

	NOP

	MOVB	arg1,%al
	ADDB	arg2,%al
	MOVB	%al,result
	MOV	$sumtxt,%rsi
	CALL	disp_line

	NOP

	MOVB	arg1,%al
	SUBB	arg2,%al
	MOVB	%al,result
	MOV	$difftxt,%rsi
	CALL	disp_line

	NOP

	MOVB	arg1,%al
	ORB	arg2,%al
	MOVB	%al,result
	MOV	$ortxt,%rsi
	CALL	disp_line

	NOP

	MOVB	arg1,%al
	ANDB	arg2,%al
	MOVB	%al,result
	MOV	$andtxt,%rsi
	CALL	disp_line

	NOP

	MOVB	arg1,%al
	XORB	arg2,%al
	MOVB	%al,result
	MOV	$xortxt,%rsi
	CALL	disp_line

	NOP

	MOV	$exit_64,%rax
	XOR	%rdi,%rdi 
	SYSCALL

#----------------------------------------------------------------
# disp_line - displays line of text (prompt + hexadecimal number)
#----------------------------------------------------------------

	.type disp_line,@function

disp_line:
	MOVB	%al,tmp

	MOV	$write_64,%rax
	MOV	$stdout,%rdi
	MOV	txtlen,%rdx
	SYSCALL

	MOVB	tmp,%al
	ANDB	$0x0F,%al
	MOVZX	%al,%rbx
	MOVB	hex_tab(%rbx),%ah

	MOVB	tmp,%al
	SHR	$4,%al
	MOVZX	%al,%rbx
	MOVB	hex_tab(%rbx),%al

	MOVW	%ax,restxt

	MOV	$write_64,%rax
	MOV	$stdout,%rdi
	MOV	$restxt,%rsi
	MOV	reslen,%rdx
	SYSCALL

	RET
	
