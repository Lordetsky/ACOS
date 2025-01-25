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
	
	# 3) (x << y) - 10 -- logical shift
	mv t2, t0
	mv t3, t1
	
	# x << y
	sll t2, t2, t3
	
	# x -= 10
	li a0, 10
	sub t2, t2, a0
	
	# print(x)
	li a7, 1
	mv a0, t2
	ecall