	.macro newline
	li a7, 11
	li a0, '\n'
	ecall
	.end_macro
	
	.macro read_int(%x)
	li a7, 5
	ecall
	mv %x, a0
	.end_macro
	
	.macro print_int (%x)
	li a7, 1
	mv a0, %x
	ecall
	.end_macro

main:
	read_int s1
	read_int s2
	read_int s3
	read_int s4
	
	add a0, s1, s3
	print_int a0
	
	newline
	
	add a0, s2, s4
	print_int a0
	