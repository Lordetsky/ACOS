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
   beq s0, a0, print_9
   li a1, -1
   print_int a1
   li a7, 10
   ecall
   
   print_9:
   li a1, -9
   print_int a1
   