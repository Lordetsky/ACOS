.include "macrolib.s"

	.text
j main

gcd:
	li t1, 2
	blt  a0, t1, exit
	
	mv a1, a0
	addi a0, a1, -1
	
	push ra
	push a1
	push a2
	jal ra, gcd
	pop a2
	pop a1
	pop ra
	
	mv a2, a0
	addi a0, a1, -2
	
	push ra
	push a1
	push a2
	jal ra, gcd
	pop a2
	pop a1
	pop ra
	
	add a0, a0, a2
exit:
	jalr ra

main:
	read_int t0
	
	mv a0, t0
	
	push ra
	jal ra, gcd
	pop ra
	
	print_int a0