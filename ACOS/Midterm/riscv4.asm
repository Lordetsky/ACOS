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
   mv s0, a0
   
   li a0, 3
   
   bge s0, a0, next_1
   li a1, 2
   li a2, 1
   
   mv a0, s0
   loop_1:
   beqz a0, end_1
   addi a0, a0, -1
   
   mul a2, a2, a1
   j loop_1
   
   end_1:
   neg a2, a2
   addi s1, a2, -7
   
   next_1:
   li a0, 3
   blt s0, a0, next_2
   
   li a0, 5
   mul s1, s0, a0
   
   mv a1, s0
   li a2, 1
   
   li a0, 4
   loop_2:
   beqz a0, end_2
   addi a0, a0, -1
   
   mul a2, a2, a1
   j loop_2
   
   end_2:
   li a0, 8
   mul a3, a2, a0
   sub s1, s1, a3
   
   mul a2, a2, a1
   li a0, 7
   mul a2, a2, a0
   add s1, s1, a2
   
   next_2:
   li a0, 5
   bne s0, a0, next_3
   li s1, -9
   
   next_3:
   li a0, 7
   ble s0, a0, next_4
   
   li a1, -2
   mul s1, s0, a1
   addi s1, s1, 8
   
   next_4:
   mv a0, s1
   ret

main:
   read_int a0
   
   call func
   
   print_int a0