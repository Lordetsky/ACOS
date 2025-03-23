.include "../macrolib.s"

.text

read_int t0
li t3, 0

loop:
beqz t0, exit
read_double ft1
addi t0, t0, -1

mv s1, sp
mv s2, t3
loop3:
beqz s2, exit3
addi s2, s2, -1

fld ft0, (s1)
addi s1, s1, -8
feq.d t4, ft0, ft1
bnez t4, skip


j loop3
exit3:

push_double ft1
addi t3, t3, 1

skip:
j loop
exit:

loop2:
beqz t3, exit2

addi t3, t3, -1
pop_double ft0
print_double ft0
newline
j loop2

exit2: