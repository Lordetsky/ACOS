   .macro read_int(%x)
   li a7, 5
   ecall
   mv %x, a0
   .end_macro
   
   .macro print_double (%x)
   li a7, 3
   fmv.d fa0, %x
   ecall
   .end_macro
   
   .macro print_int (%x)
   li a7, 1
   mv a0, %x
   ecall
   .end_macro
j main

aboba:
   li t0, 10
   fcvt.d.w  ft0, t0
   
   li a1, 5
   f_loop_1:
   beqz a1, f_end_1
   addi a1, a1, -1
   fmul.d fa0, fa0, ft0
   j f_loop_1
   
   f_end_1:
   fcvt.w.d a2, fa0, rup
   
   li a1, 5
   sub a1, a1, a0
   f_loop_3:
   beqz a1, f_end_3
   addi a1, a1, -1
   div a2, a2, t0
   j f_loop_3
   
   f_end_3:
   fcvt.d.w fa0, a2
   
   mv a1, a0
   li t1, 1
   f_loop_2:
   beqz a1, f_end_2
   addi a1, a1, -1
   mul t1, t1, t0
   j f_loop_2
   
   f_end_2:
   fcvt.d.w fa1, t1
   fdiv.d fa0, fa0, fa1
   
   ret


main:
   read_int s0
   li t0, 1
   fcvt.d.w ft0, t0
   li t0, 10
   fcvt.d.w ft1, t0
   fdiv.d ft0, ft0, ft1 
   
   mv t0, s0
   loop_1: # calc e = 10 ^ -n
   beqz t0, end_1
   addi t0, t0, -1
   fdiv.d ft0, ft0, ft1
   j loop_1
   
   end_1:
   
   li t0, 4
   fcvt.d.w ft1, t0
   fcvt.d.w fs1, t0
   li t0, -1
   fcvt.d.w ft2, t0
   fcvt.d.w ft3, t0
   
   li t4, 3
   
   li t5, 40000
   
   loop_2:
   fcvt.d.w ft4, t4
   fdiv.d ft5, ft1, ft4 # 4/n
   addi t4, t4, 2 # n += 2
   fmul.d ft5, ft5, ft2 # 4/n * sign
   fneg.d ft2, ft2 # change sign
   fadd.d fs1, fs1, ft5 # pi += 4/n * sign
   
   fcvt.d.w ft4, t4
   fdiv.d ft5, ft1, ft4 # 4/n
   addi t4, t4, 2 # n += 2
   fmul.d ft5, ft5, ft2 # 4/n * sign
   fneg.d ft2, ft2 # change sign
   fadd.d ft5, fs1, ft5 # pi += 4/n * sign
   
   #fsub.d ft6, fs1, ft5 # old_pi - new_pi
   #fabs.d ft6, ft6 # abs
   #flt.d t0, ft6, ft0 # abs < e
   addi t5, t5, -1
   beqz t5, end_2
   fmv.d fs1, ft5
   j loop_2
   
   end_2:
   #print_double fs1
   mv a0, s0
   fmv.d fa0, fs1
   
   call aboba
   
   print_double fa0
