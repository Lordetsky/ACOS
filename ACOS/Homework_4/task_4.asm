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
	
	.macro print_char(%x)
	li a7, 11
	li a0, %x
	ecall
	.end_macro
	
	.macro push(%x)
   addi sp, sp, -4
   sw %x, (sp)
   .end_macro
   
   .macro pop(%x)
   lw %x, (sp)
   addi sp, sp, 4
   .end_macro
	
j main

bubble_sort:
	li t0, 1
	f_while:
	  beqz t0, f_while_end
	  li t0, 0
	
	  mv t1, a1
	  mv t2, a0
	  f_loop:
	    beqz t1, f_loop_end
	    addi t1, t1, -1
	    
	    lw t3, 0(t2)
	    lw t4, 4(t2)
	    
	    push ra
	    jalr s4
	    pop ra
	    
	    beqz t5, f_skip
	    
	    sw t4, 0(t2)
	    sw t3, 4(t2)
	    li t0, 1
	    
	    f_skip:
	    addi t2, t2, 4
	    j f_loop
	  f_loop_end:
	  
	  j f_while
	f_while_end:
	ret

cmp_1:
	blt t4, t3, cmp_1_ret_1
	li t5, 0
	ret
	cmp_1_ret_1:
	li t5, 1
	ret

cmp_2:
	li a5, 10
	rem a3, t3, a5
	rem a4, t4, a5
	
	blt a3, a4, cmp_2_ret_1
	li t5, 0
	ret
	cmp_2_ret_1:
	li t5, 1
	ret

main:
	read_int a1
	mv s2, a1
	
	read_int s3
	bnez s3, c_2
	la s4, cmp_1
	j c_1
	
	c_2:
	la s4, cmp_2
	c_1:
	
	li a7, 9
	li a0, 4
	mul a0, s1, a0
	ecall
	
	
	
	mv s1, a0
	mv a1, s2
	mv t2, s1
loop_1:
	beqz a1, end_1
	addi a1, a1, -1
	
	read_int t1
	sw t1, 0(t2)
	addi t2, t2, 4
	
	j loop_1
end_1:
	li a3, 2
	blt s2, a3, loop_2
	mv a0, s1
	mv a1, s2
	addi a1, a1, -1
	call bubble_sort
	
loop_2:
	beqz s2, end_2
	addi s2, s2, -1
	
	lw a0, 0(s1)
	print_int a0
	print_char ' '
	addi s1, s1, 4
	
	j loop_2
end_2:
	
	
