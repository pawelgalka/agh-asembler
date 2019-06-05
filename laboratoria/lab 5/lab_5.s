#----------------------------------------------------------------
# Program LAB_5.S - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_5.o lab_5.s
#  To link:    ld -o lab_5 lab_5.o
#  To run:     ./lab_5
#
#---------------------------------------------------------------- 

	.equ	write_64,	1
	.equ	exit_64,	60
	.equ	stdout,		1

	.equ	dig0,		'0'

#----------------------------------------------------------------

	.data

table:					# table of items
	.long	10,70,50,90,60,80,40,20,0,30,5,6
count:					# count of items
	.quad	( . - table ) >> 2
events:	
	.quad	0
item:	
	.string	"Item "
line_no:	
	.string	"   "
itemval:	
	.string	" = "
number:	
	.string	"     \n"
before:	
	.string	"\nBefore:\n"
after:	
	.string	"\nAfter:\n"
dataend:

	.equ	item_len, before - item
	.equ	bef_len, after - before
	.equ	aft_len, dataend - after

#----------------------------------------------------------------

	.text
	.global _start

_start:
	MOV	$write_64,%rax	# display message
	MOV	$stdout,%rdi
	MOV	$before,%rsi
	MOV	$bef_len,%rdx
	SYSCALL

	CALL	disp_table	# display content of table

	CALL	do_something	# do something with table

	MOV	$write_64,%rax	# display message
	MOV	$stdout,%rdi
	MOV	$after,%rsi
	MOV	$aft_len,%rdx
	SYSCALL

	CALL	disp_table	# display content of table

	MOV	events,%rdi	# exit program
	MOV	$exit_64,%rax
	SYSCALL

#----------------------------------------------------------------
#
#	Function:	do_something
#	Parameters:	none
#

	.type do_something,@function

do_something:
	MOV	count,%rdx		# outer loop counter
	MOVQ	$0,events
outer:		
	DEC	%rdx
	XOR	%rsi,%rsi		# data index
	MOV	%rdx,%rcx		# inner loop counter
inner:		
	MOV	table(,%rsi,4),%eax
	CMP	table+4(,%rsi,4),%eax
	JBE	noswap
	XCHG	table+4(,%rsi,4),%eax
	MOV	%eax,table(,%rsi,4)
	INCQ	events
noswap:		
	INC	%rsi			# next element
	LOOP	inner			# { rcx--; if( rcx ) goto inner }
	CMP	$1,%rdx
	JNZ	outer

	RET

#----------------------------------------------------------------
#
#	Function:	disp_table
#	Parameters:	none
#

	.type disp_table,@function

disp_table:
	XOR	%rsi,%rsi		# data index
	MOV	count,%rcx		# data count

disp_item:
	PUSH	%rcx
	PUSH	%rsi
	
	MOV	table(,%rsi,4),%ebx	# get data	
	CALL	make_string		# convert to string

	MOV	$write_64,%rax		# call write function
	MOV	$stdout,%rdi

	MOV	$item,%rsi
	MOV	$item_len,%rdx
	SYSCALL

	POP	%rsi

	INC	%rsi			# next element

	POP	%rcx
	LOOP	disp_item		# { rcx--; if( rcx ) goto disp_item }

	RET				# return to main program

#----------------------------------------------------------------
#
#	Function:	make_string
#	Parameters:	%esi - index of element
#			%ebx - value of element
#

	.type make_string,@function

make_string:
	MOVL	$0x20202020,number
	MOVL	$0x2020,number
	MOV	%esi,%eax		# convert index of table element to string
	MOV	$line_no + 2,%rdi
	CALL	n2str

	MOV	%ebx,%eax		# convert value of table element to string
	MOV	$number + 4,%rdi
	CALL	n2str

	RET				# return to disp_table function

#----------------------------------------------------------------
#
#	Function:	n2str
#	Parameters:	%eax - value
#			%rdi - address of last character
#

	.type n2str,@function
n2str:
	PUSH	%rbx		# save register on stack
	PUSH	%rdx		# save register on stack
	MOV	$10,%ebx	# divisor in EBX, dividend in EAX
nextdig:			
	XOR	%edx,%edx	# EDX = 0
	DIV	%ebx		# EDX:EAX div EBX
	ADD	$dig0,%dl	# convert remainder (in EDX) to character
	MOV	%dl,(%rdi)	# *(RDI) = character (decimal digit)
	CMP	$0,%eax		# quotient in EAX 
	JZ	empty
	DEC	%rdi		# RDI--
	JMP	nextdig		
empty:		
	POP	%rdx		# restore register from stack
	POP	%rbx		# restore register from stack

	RET			# return to make_string function

#----------------------------------------------------------------
