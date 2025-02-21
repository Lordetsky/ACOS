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
	
	bgez s1, positive
	li s0, -1
	mul s1, s1, s0
	
positive:
	
	li s2, 0
	li s3, 10
loop:
	beqz s1, end
	rem s0, s1, s3
	add s2, s2, s0
	div s1, s1, s3
	j loop

end:
	print_int s2
	