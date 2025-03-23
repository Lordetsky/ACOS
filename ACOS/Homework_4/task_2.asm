	.macro read_int(%x)
	li a7, 5
	ecall
	mv %x, a0
	.end_macro
	
	.macro push(%x)
	addi sp, sp, -1
	sb %x, (sp)
	.end_macro
	
	.macro newline
	li a7, 11
	li a0, '\n'
	ecall
	.end_macro
	
j main

checker:
	beqz a1, return_0
	
	add a5, a1, a2
	blt a5, a3, return_2
	
	add a5, a1, a3
	blt a5, a2, return_2
	
	add a5, a2, a3
	blt a5, a1, return_2
	
	j return_1
	
	return_0:
	li a0, 0
	j func_end
	
	return_1:
	li a0, 1
	j func_end
	
	return_2:
	li a0, 2
	j func_end
	
	func_end:
	ret

main:
	mv s1, sp
	li s2, 0
	
	read_int a1
	read_int a2
	read_int a3
	
	call checker
	
	li a4, 1
while:
	beqz a0, end
	
	beq a0, a4, YES
	li a0, 'N'
	push a0
	j read
	
	YES:
	li a0, 'Y'
	push a0
	
	read:
	addi s2, s2, 1
	read_int a1
	read_int a2
	read_int a3
	call checker
	j while

end:
	li a7, 11
loop:
	beqz s2, loop_end
	addi s2, s2, -1
	
	addi s1, s1, -1
        lb a0, (s1)
        ecall
        newline
        j loop

loop_end:
	