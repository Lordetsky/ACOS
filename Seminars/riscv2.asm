.include "macrolib.s"

	.text
	j main

func_1:
	push s1
	push s2
	push s3
	
	li a2, 2
	mul a0, a0, a2
	add a0, a0, a1
	
	pop s3
	pop s2
	pop s1
	ret

func_2:
	push s1
	push s2
	push s3
	
	sub a0, a1, a0
	li a2, 3
	mul a0, a0, a2
	
	pop s3
	pop s2
	pop s1
	ret

main:
	read_int s1
	read_int s2
	
	mv a0, s1
	mv a1, s2
	
	call func_1
	
	mv s3, a0
	add s3, s3, s1
	
	mv a0, s1
	mv a1, s2
	
	call func_2
	
	add s3, s3, a0
	sub s3, s3, s2
	
	print_int s3
