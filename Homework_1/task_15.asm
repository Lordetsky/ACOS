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
	
	# 15) (x == (y + 3)) ? 0 : 1
	mv t2, t0
	mv t3, t1
	
	# y += 3
	addi t3, t3, 3
	
	# x == y
	beq t2, t3, true
	
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
