.include "macrolib.s"
	.text
main:
	read_int s1
	
	call func

	print_int s1
	return

func:
	mul s1, s1, s1
	ret
