#----------------------------------------------------------------
# Program lab_7c.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile&link: gcc -no-pie -o lab_7c lab_7c.s
#  To run: 	    ./lab_7c
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
	mov value, %rsi
	mov $fmt, %rdi
	mov $0, %rax
	call printf

	mov $0,%rdi
	call exit
