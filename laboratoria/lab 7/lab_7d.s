#----------------------------------------------------------------
# Program lab_7d.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile&link: gcc -o lab_7d lab_7d.s
#  To run: 	    ./lab_7d
#
#----------------------------------------------------------------

	.data
fmt:
	.asciz	 "Value = %ld\n"
value:
	.quad	15
	
	.text
	.global main
	
main:
	mov value(%rip), %rsi
	lea fmt(%rip), %rdi
	mov $0, %rax
	call *printf@GOTPCREL(%rip)

	mov $0,%rdi
	call *exit@GOTPCREL(%rip)
