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
	
	# 2) (x >> 2) + ((y - 1) << 3) -- logical shift
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
	
	# print(x)
	li a7, 1
	mv a0, t2
	ecall