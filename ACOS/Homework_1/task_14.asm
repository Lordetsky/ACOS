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
	
	# 14) x > y ? 0 : 1
	mv t2, t0
	mv t3, t1
	
	# x > y
	bgt t2, t3, true
	
	# if false
	li t2, 1
	j end
	
true: 	# if true
	li t2, 0
	
end:
	
	# print(x)
	li a7, 1
	mv a0, t2
	ecall
