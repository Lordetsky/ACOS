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
   
   li a0, 3
   blt s0, a0, good
   li a0, -1
   print_int a0
   li a7, 10
   ecall
   
   good:
   li a1, 2
   li a2, 1
   
   mv a0, s0
   loop:
   beqz a0, end
   addi a0, a0, -1
   
   mul a2, a2, a1
   j loop
   
   end:
   neg a2, a2
   addi a2, a2, -7
   
   print_int a2