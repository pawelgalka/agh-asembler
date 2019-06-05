#----------------------------------------------------------------
# Program lab_1a.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_1a.o lab_1a.s
#  To link:    ld -o lab_1a lab_1a.o
#  To run:     ./lab_1a
#
#----------------------------------------------------------------

	.equ	kernel,0x80	#Linux system functions entry
	.equ	write,0x04	#write data to file function
	.equ	exit,0x01	#exit program function
	.equ	stdout, 0x01	#handle to stdout
	.data
	
txt_A:			#first message
	.ascii	"A\n"
txt_B:				#second message
	.ascii	"B\n"
txt_C:
	.ascii	"C\n"	#third message

	.text
	.global _start
	
	.macro disp_str file_id, address, length
	mov $write, %eax
	mov \file_id, %ebx
	mov \address, %ecx
	mov \length, %edx
	int $kernel
	.endm


_start:
	jmp l_c

	l_a: disp_str $stdout, $txt_A, $2

	jmp theend

	l_b: disp_str $stdout, $txt_B, $2

	jmp l_a

	l_c: disp_str $stdout, $txt_C, $2

	jmp l_b

theend:
	MOVL	$exit,%eax	#exit program
	INT	$kernel
