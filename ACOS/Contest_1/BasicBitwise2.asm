	.macro print_int (%x)
	li a7, 1
	mv a0, %x
	ecall
	.end_macro

	.macro newline
	li a7, 11
	li a0, '\n'
	ecall
	.end_macro

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
	
	# 1) x & (-1 << 2)
	mv t2, t0
	
	# -1 << 2
	li t3, -1
	slli t3, t3, 2
	
	# x & (-1 << 2)
	and t2, t2, t3
	
	print_int (t2)
	newline
	
	# 2) x | (-1 >> 30)
	mv t2, t0
	
	# -1 >> 30
	li t3, -1
	srli t3, t3, 30
	
	# x | (-1 >> 30)
	or t2, t2, t3
	
	print_int (t2)
	newline
	
	# 3) set the y-th bit of x to 1 (bit numbers start from 0)
	mv t2, t0
	mv t3, t1
	
	# mask << y
	lw t4, mask
	sll t4, t4, t3
	
	# x | mask (set y-th bit to 1)
	or t2, t2, t4
	
	print_int (t2)
	newline
	
	# 4) set the y-th bit of x to 0 (bit numbers start from 0)
	mv t2, t0
	mv t3, t1
	
	# mask << y
	lw t4, mask
	sll t4, t4, t3
	
	not t4, t4
	
	# x | mask (set y-th bit to 0)
	and t2, t2, t4
	
	print_int (t2)
	newline
	
	# 5) (x == (y + 3)) ? 0 : 1
	mv t2, t0
	mv t3, t1
	
	# y += 3
	addi t3, t3, 3
	
	# x == y
	beq t2, t3, true
	
	# if false
	li t2, 1
	j end_5
	
true: 	# if true
	li t2, 0
	
end_5:
	print_int (t2)
	newline
	
	# 6) x > -5 & y < 5
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
	j end_6
	
true_y: # if true
	li t3, 1
	
end_6:
	# x & y
	and t2, t2, t3
	
	print_int (t2)
	newline