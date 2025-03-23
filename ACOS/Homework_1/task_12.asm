	.data
mask:
	.word 1

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
	
	# 12) set the y-th bit of x to 1 (bit numbers start from 0)
	mv t2, t0
	mv t3, t1
	
	# mask << y
	lw t4, mask
	sll t4, t4, t3
	
	# x | mask (set y-th bit to 1)
	or t2, t2, t4
	
	# print(x)
	li a7, 1
	mv a0, t2
	ecall
