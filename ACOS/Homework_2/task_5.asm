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
	
	.macro read_int(%x)
	li a7, 5
	ecall
	mv %x, a0
	.end_macro
	
	.macro print_int (%x)
	li a7, 1
	mv a0, %x
	ecall
	.end_macro
	
main:		
	read_int t0
        li t3, 0
        mv s4, sp

loop_1:
        beqz t0, exit_1
        read_int t1
        addi t0, t0, -1

        mv s1, sp
        mv s2, t3
loop_3:
        beqz s2, exit_3

        addi s2, s2, -1
        lw t2, (s1)
        addi s1, s1, 4

        beq t1, t2, skip
        j loop_3

exit_3:
        push  t1
        addi t3, t3, 1

skip:
        j loop_1

exit_1:

loop_2:
        beqz t3, exit_2
        addi t3, t3, -1
        
        addi s4, s4, -4
        lw t0, (s4)
        
        print_int t0
        newline
        
        j loop_2

exit_2:
        