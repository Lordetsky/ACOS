.eqv CUR 0xFFFF0018 # current time
.eqv NEW 0xFFFF0020 # time for new interrupt
.include "../macrolib.s"

.data
thread_1_data:
.space 16
thread_2_data:
.space 16

thread_1_str:
.string "Thread 1: "
thread_2_str:
.string "Thread 2: "

.macro timer(%timeout)
    lw     t0, CUR
    addi   t0, t0, %timeout
    sw     t0, NEW, t1
.end_macro

.text
    j main
    
thread1:

li a7, 4
la a0, thread_1_str
ecall

li a7, 1
mv a0, s0
ecall

newline

addi s0, s0, 1

j thread1

thread2:

li a7, 4
la a0, thread_2_str
ecall

li a7, 1
mv a0, s0
ecall

addi s0, s0, 1

j thread2


handler:
    csrrw  t0, uepc, zero  # load exception PC into t0
    bnez s1, label
    la t1, thread_1_data
    sw t0, 0(t1)
    sw a0, 4(t1)
    sw a7, 8(t1)
    sw s0, 12(t1)
    
    la t1, thread_2_data
    lw t0, 0(t1)
    lw a0, 4(t1)
    lw a7, 8(t1)
    lw s0, 12(t1)
    
    li s1, 1
    j exit
    
    label:
    la t1, thread_2_data
    sw t0, 0(t1)
    sw a0, 4(t1)
    sw a7, 8(t1)
    sw s0, 12(t1)
    
    la t1, thread_1_data
    lw t0, 0(t1)
    lw a0, 4(t1)
    lw a7, 8(t1)
    lw s0, 12(t1)
    
    li s1, 0
    
    exit:
    timer  2000 # generate new timer interrupt after 2000 ms.
    addi t0, t0, 4
    csrrw  zero, uepc, t0  # update exception PC
    uret # return to uepc
main:
    la     t0, handler
    csrrw  zero, utvec, t0  # set utvec to the handlers address
    csrrsi zero, ustatus, 0x1 # set interrupt enable bit in ustatus
    csrrsi zero, uie, 0x10 # timer interrupts are enabled (UTIE bit)

    
    li s0, 0
    li s1, 0
    li a0, 0
    li a7, 0
    
    la t1, thread_1_data
    la t3, thread1
    sw t3, 0(t1)
    sw a0, 4(t1)
    sw a7, 8(t1)
    sw s0, 12(t1)
    
    la t1, thread_2_data
    la t3, thread2
    sw t3, 0(t1)
    sw a0, 4(t1)
    sw a7, 8(t1)
    sw s0, 12(t1)
    
    timer  2000 # generate new timer interupt after 2000 ms.
    wfi
    