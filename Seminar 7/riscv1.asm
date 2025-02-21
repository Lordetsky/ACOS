.include "../macrolib.s"

.data


.text
j main

main:
	read_int t0
	mv t1, t0

loop_1:
	beqz t1, loop_end_1
	
	addi t1, t1, -1
	li a7, 6
	ecall
	fpush fa0
	
	j loop_1
	
loop_end_1:
	mv t1, t0
	newline

loop_2:
	beqz t1, loop_end_2
	
	addi t1, t1, -1
	
	fpop ft1
	fcvt.w.s t2, ft1
	
	andi t2, t2, 1
	
	bnez t2, j_loop_2
	li a7, 2
	fmv.s fa0, ft1
	ecall
	
	newline
j_loop_2:
	j loop_2

loop_end_2:
	
	
	