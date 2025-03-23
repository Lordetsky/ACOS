.include "macrolib.s"

	.text
j main

gcd:
	beqz a1, exit
	
	mv t1, a1
	rem a1, a0, a1
	mv a0, t1
	
	push ra
	jal ra, gcd
	pop ra
exit:
	jalr ra

main:
	read_int t0
	read_int t1
	
	mv a0, t0
	mv a1, t1
	
	push ra
	jal ra, gcd
	pop ra
	
	print_int a0