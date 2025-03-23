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

j main

aboba:
   li t0, 10
   fcvt.d.w  ft0, t0
   
   mv a1, a0
   loop_1:
   beqz a1, end_1
   addi a1, a1, -1
   fmul.d fa0, fa0, ft0
   j loop_1
   
   end_1:
   fcvt.w.d a2, fa0, rdn
   fcvt.d.w fa0, a2
   
   mv a1, a0
   loop_2:
   beqz a1, end_2
   addi a1, a1, -1
   fdiv.d fa0, fa0, ft0
   j loop_2
   
   end_2:
   ret

main:
   read_int a1
   read_int a2
   read_int a0
   
   fcvt.d.w fa1, a1
   fcvt.d.w fa2, a2
   fdiv.d fa0, fa1, fa2
   
   call aboba
   
   print_double fa0