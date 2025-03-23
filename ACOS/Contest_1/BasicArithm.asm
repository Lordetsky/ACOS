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
	
	# 1) (x + 5) - (y - 7)
	mv t2, t0
	mv t3, t1
	
	# x += 5
	addi t2, t2, 5
	
	# y -= 7
	li a0, 7
	sub t3, t3, a0
	
	# x -= y
	sub t2, t2, t3
	
	print_int (t2)
	newline
	
	# 2) 2 * x * x - 3 * y + 4
	mv t2, t0
	mv t3, t1
	
	# x *= 2
	li a0, 2
	mul t2, t2, a0
	
	# x *= x0
	mul t2, t2, t0
	
	# y *= 3
	li a0, 3
	mul t3, t3, a0
	
	# x -= y
	sub t2, t2, t3
	
	# x += 4
	addi t2, t2, 4
	
	print_int (t2)
	newline
	
	# 3) (x + 5) / y + 10 / (y - 1)
	mv t2, t0
	mv t3, t1
	
	# x += 5
	addi t2, t2, 5
	
	# x /= y
	div t2, t2, t3
	
	# y -= 1
	li a0, 1
	sub t3, t3, a0
	
	# y = 10 / y
	li a0, 10
	div t3, a0, t3
	
	# x += y
	add t2, t2, t3
	
	print_int (t2)
	newline
	
	# 4) (x / y) * y + x % y
	mv t2, t0
	mv t3, t1
	
	# x /= y if we work with int, we can have diff answers (5 / 2) * 2 = 4
	div t2, t2, t3
	
	# x *= y
	mul t2, t2, t3
	
	# y = x % y
	rem t3, t0, t3
	
	# x += y
	add t2, t2, t3
	
	print_int (t2)
	newline
	
	# 5) x > y ? 1 : 0
	mv t2, t0
	mv t3, t1
	
	# x > y
	bgt t2, t3, true
	
	# if false
	li t2, 0
	j end
	
true: 	# if true
	li t2, 1
	
end:
	print_int (t2)
	newline