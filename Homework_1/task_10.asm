	.text
main:
	# input x
	li a7, 5
	ecall
	mv t0, a0 # t0 always has basic x in it
	
	# 10) x & (-1 << 2)
	mv t1, t0
	
	# -1 << 2
	li t2, -1
	slli t2, t2, 2
	
	# x & (-1 << 2)
	and t1, t1, t2
	
	# print(x)
	li a7, 1
	mv a0, t1
	ecall