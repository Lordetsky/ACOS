   .macro read_double(%x)
   li a7, 7
   ecall
   fmv.d %x, fa0
   .end_macro
   
   .macro print_double (%x)
   li a7, 3
   fmv.d fa0, %x
   ecall
   .end_macro
   
j main

main:
   read_double fs1
   read_double fs2
   
   fmv.d ft0, fs1
   li t0, 3
   fcvt.d.w ft1, t0
   
   loop:
   fmul.d ft2, ft0, ft0
   fmul.d ft3, ft2, ft0
   fsub.d ft3, ft3, fs1
   fmul.d ft2, ft2, ft1
   fdiv.d ft2, ft3, ft2
   fsub.d ft2, ft0, ft2
   
   fsub.d ft0, ft2, ft0
   fabs.d ft0, ft0
   
   flt.d t1, ft0, fs2
   bnez t1, end
   fmv.d ft0, ft2
   j loop
   
   end:
   print_double ft2
   