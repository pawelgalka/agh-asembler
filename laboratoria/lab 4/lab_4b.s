#----------------------------------------------------------------
# Program lab_4b.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_4b.o lab_4b.s
#  To link:    ld -o lab_4b lab_4b.o
#  To run:     ./lab_4b
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
	.ascii "00","01","02","03","04","05","06","07"
	.ascii "08","09","0A","0B","0C","0D","0E","0F"
	.ascii "10","11","12","13","14","15","16","17"
	.ascii "18","19","1A","1B","1C","1D","1E","1F"
	.ascii "20","21","22","23","24","25","26","27"
	.ascii "28","29","2A","2B","2C","2D","2E","2F"
	.ascii "30","31","32","33","34","35","36","37"
	.ascii "38","39","3A","3B","3C","3D","3E","3F"
	.ascii "40","41","42","43","44","45","46","47"
	.ascii "48","49","4A","4B","4C","4D","4E","4F"
	.ascii "50","51","52","53","54","55","56","57"
	.ascii "58","59","5A","5B","5C","5D","5E","5F"
	.ascii "60","61","62","63","64","65","66","67"
	.ascii "68","69","6A","6B","6C","6D","6E","6F"
	.ascii "70","71","72","73","74","75","76","77"
	.ascii "78","79","7A","7B","7C","7D","7E","7F"
	.ascii "80","81","82","83","84","85","86","87"
	.ascii "88","89","8A","8B","8C","8D","8E","8F"
	.ascii "90","91","92","93","94","95","96","97"
	.ascii "98","99","9A","9B","9C","9D","9E","9F"
	.ascii "A0","A1","A2","A3","A4","A5","A6","A7"
	.ascii "A8","A9","AA","AB","AC","AD","AE","AF"
	.ascii "B0","B1","B2","B3","B4","B5","B6","B7"
	.ascii "B8","B9","BA","BB","BC","BD","BE","BF"
	.ascii "C0","C1","C2","C3","C4","C5","C6","C7"
	.ascii "C8","C9","CA","CB","CC","CD","CE","CF"
	.ascii "D0","D1","D2","D3","D4","D5","D6","D7"
	.ascii "D8","D9","DA","DB","DC","DD","DE","DF"
	.ascii "E0","E1","E2","E3","E4","E5","E6","E7"
	.ascii "E8","E9","EA","EB","EC","ED","EE","EF"
	.ascii "F0","F1","F2","F3","F4","F5","F6","F7"
	.ascii "F8","F9","FA","FB","FC","FD","FE","FF"

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
	MOVZX	%al,%rbx
	MOVW	hex_tab(,%rbx,2),%ax

	MOVW	%ax,restxt

	MOV	$write_64,%rax
	MOV	$stdout,%rdi
	MOV	$restxt,%rsi
	MOV	reslen,%rdx
	SYSCALL

	RET
	
