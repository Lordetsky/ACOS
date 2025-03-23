	.macro print_char(%x)
	li a7, 11
	li a0, %x
	ecall
	.end_macro
	
	.macro printline(%m, %ch1, %ch2)
	mv a2, %m
	macro_loop:
	beqz a2, macro_loop_end
	addi a2, a2, -1
	
	print_char %ch1
	print_char %ch2
	
	j macro_loop
	
	macro_loop_end:
	print_char %ch1
	
	.end_macro
	
	.macro read_int(%x)
	li a7, 5
	ecall
	mv %x, a0
	.end_macro

main:
	read_int s1
	read_int s2

loop:
	beqz s2, end
	addi s2, s2, -1
	
	mv s3, s1
	printline s3, '+', '-'
	print_char '\n'
	mv s3, s1
	printline s3, '|', ' '
	print_char '\n'
	
	j loop

end:
	mv a0, s1
	printline a0, '+', '-'