	.text
main:
	# input x
	li a7, 5
	ecall
	mv t0, a0 # t0 always has basic x in it
	
	# 11) x | (-1 >> 30)
	mv t1, t0
	
	# -1 >> 30
	li t2, -1
	srli t2, t2, 30
	
	# x | (-1 >> 30)
	or t1, t1, t2
	
	# print(x)
	li a7, 1
	mv a0, t1
	ecall
