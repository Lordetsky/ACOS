	.macro print_int (%x)
	li a7, 1
	mv a0, %x
	ecall
	.end_macro

	.macro newline
	li a7, 11
	li a0, '\n'
	ecall
	.end_macro

main:
	# input x
	li a7, 5
	ecall
	mv t0, a0 # t0 always has basic x in it
	
	# input y
	li a7, 5
	ecall
	mv t1, a0 # t0 always has basic y in it
	
	# 1) (x >> 2) + ((y - 1) << 3) -- logical shift
	mv t2, t0
	mv t3, t1
	
	# x >> 2
	srli t2, t2, 2
	
	# y -= 1
	li a0, 1
	sub t3, t3, a0
	
	# y << 3
	slli t3, t3, 3
	
	# x += y
	add t2, t2, t3
	
	print_int (t2)
	newline
	
	# 2) (x << y) - 10 -- logical shift
	mv t2, t0
	mv t3, t1
	
	# x << y
	sll t2, t2, t3
	
	# x -= 10
	li a0, 10
	sub t2, t2, a0
	
	print_int (t2)
	newline
	
	# 3) (x >> y) + 10 -- arithmetical shift
	mv t2, t0
	mv t3, t1
	
	# x >> y
	sra t2, t2, t3
	
	# x += 10
	addi t2, t2, 10
	
	print_int (t2)
	newline
	
	# 4) ((x << 2) - y + 5) >> 1 -- arithmetical shift
	mv t2, t0
	mv t3, t1
	
	# x << 2
	slli t2, t2, 2
	
	# x -= y
	sub t2, t2, t3
	
	# x += 5
	addi t2, t2, 5
	
	# x >> 1
	srai t2, t2, 1
	
	print_int (t2)
	newline
	
	# 5) x * 6 - y * 3
	mv t2, t0
	mv t3, t1
	
	# x *= 6
	li a0, 6
	mul t2, t2, a0
	
	# y *= 3
	li a0, 3
	mul t3, t3, a0
	
	# x -= y
	sub t2, t2, t3
	
	print_int (t2)
	newline