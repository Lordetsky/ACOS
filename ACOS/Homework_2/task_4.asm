	.macro push(%x)
	addi sp, sp, -4
	sw %x, (sp)
	.end_macro
   
	.macro pop(%x)
	lw %x, (sp)
	addi sp, sp, 4
	.end_macro
	
	.macro newline
	li a7, 11
	li a0, '\n'
	ecall
	.end_macro

main:
	li a7, 5
	ecall
	mv s1, a0
	
	li s2, 0
	li s3, 0
loop_1:
	beq s2, s1, end_1
	
	li a7, 5
	ecall
	
	andi a1, a0, 1
	bnez a1, skip
	push a0
	addi s3, s3, 1
	
skip:
	addi s2, s2, 1
	j loop_1

end_1:

	bnez s3, loop_2
	newline
	j end_2

loop_2:
	beqz s3, end_2
	
	li a7, 1
	pop a0
	ecall
	newline
	
	addi s3, s3, -1
	j loop_2
	
end_2: