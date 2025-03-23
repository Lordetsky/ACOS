	.text
main:
	# input x
	li a7, 5
	ecall
	mv t0, a0 # t0 always has basic x in it
	
	# input y
	li a7, 5
	ecall
	mv t1, a0 # t0 always has basic y in it
	
	# 7) 2 * x * x - 3 * y + 4
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
	
	# print(x)
	li a7, 1
	mv a0, t2
	ecall