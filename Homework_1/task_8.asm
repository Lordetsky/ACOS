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
	
	# 8) (x + 5) / y + 10 / (y - 1)
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
	
	# print(x)
	li a7, 1
	mv a0, t2
	ecall