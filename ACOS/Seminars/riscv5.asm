.include "macrolib.s"


.text

j main

main:
	li a7, 7
	ecall
	fmv.d ft1, fa0
	
	li a7, 7
	ecall
	fmv.d ft2, fa0
	
	li a7, 7
	ecall
	fmv.d ft3, fa0
	
	fadd.d ft1, ft1, ft2
	
	fsub.d ft1, ft1, ft3
	
	li a7, 3
	fmv.d fa0, ft1
	ecall