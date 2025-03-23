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
   
main:
   read_int s0
   li a0, 5
   mul s1, s0, a0
   
   li a0, 3
   bge s0, a0, good
   li a0, -1
   print_int a0
   li a7, 10
   ecall
   
   good:
   mv a1, s0
   li a2, 1
   
   li a0, 4
   loop:
   beqz a0, end
   addi a0, a0, -1
   
   mul a2, a2, a1
   j loop
   
   end:
   li a0, 8
   mul a3, a2, a0
   sub s1, s1, a3
   
   mul a2, a2, a1
   li a0, 7
   mul a2, a2, a0
   add s1, s1, a2
   
   print_int s1
   