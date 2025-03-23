.macro push(%x)
   addi sp, sp, -4
   sw %x, (sp)
   .end_macro
   
   .macro pop(%x)
   lw %x, (sp)
   addi sp, sp, 4
   .end_macro
   
      .macro print_int (%x)
   li a7, 1
   mv a0, %x
   ecall
   .end_macro
   
   .macro read_int(%x)
   li a7, 5
   ecall
   mv %x, a0
   .end_macro

j main

func:
   push s0
   push s1
   push s2
   push s3
   push s4
   push s5
   push s6
   push s7
   push s8
   push s9
   push s10
   push s11
   mv s0, a0
   
   li a0, 3
   
   bge s0, a0, next_1
   li s1, 2
   li s2, 1
   
   mv a0, s0
   loop_1:
   beqz a0, end_1
   addi a0, a0, -1
   
   mul s2, s2, s1
   j loop_1
   
   end_1:
   neg s2, s2
   addi s5, s2, -7
   
   next_1:
   li a0, 3
   blt s0, a0, next_2
   
   li a0, 5
   mul s5, s0, a0
   
   mv s1, s0
   li s2, 1
   
   li a0, 4
   loop_2:
   beqz a0, end_2
   addi a0, a0, -1
   
   mul s2, s2, s1
   j loop_2
   
   end_2:
   li a0, 8
   mul s3, s2, a0
   sub s5, s5, s3
   
   mul s2, s2, s1
   li a0, 7
   mul s2, s2, a0
   add s5, s5, s2
   
   next_2:
   li a0, 5
   bne s0, a0, next_3
   li s5, -9
   
   next_3:
   li a0, 7
   ble s0, a0, next_4
   
   li s1, -2
   mul s5, s0, s1
   addi s5, s5, 8
   
   next_4:
   mv a0, s5
   
   pop s11
   pop s10
   pop s9
   pop s8
   pop s7
   pop s6
   pop s5
   pop s4
   pop s3
   pop s2
   pop s1
   pop s0
   ret

main:
   read_int a0
   
   call func
   
   print_int a0
   
   
