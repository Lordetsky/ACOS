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
	
	li s2, 0
	li s3, 1
	li s4, -1
loop:
	beqz s1, end
	read_int s0
	mul s0, s0, s3
	add s2, s2, s0
	mul s3, s3, s4
	addi s1, s1, -1
	j loop
end:
	print_int s2
	