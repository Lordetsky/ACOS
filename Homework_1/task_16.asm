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
	
	# 12) x > -5 & y < 5
	mv t2, t0
	mv t3, t1
	
	# x > -5
	li t4, -5
	bgt t2, t4, true_x
	
	# if false
	li t2, 0
	j check_y
	
true_x: # if true
	li t2, 1

check_y:	
	# x < 5
	li t4, 5
	blt t3, t4, true_y
	
	# if false
	li t3, 0
	j end
	
true_y: # if true
	li t3, 1
	
end:
	# x & y
	and t2, t2, t3
	
	# print(x)
	li a7, 1
	mv a0, t2
	ecall