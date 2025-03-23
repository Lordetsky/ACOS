#
# Example that demonstrates MMIO in Digital Lab Sim.
#
# It works with Seven segment display.
#
# See Help on Digital Lab Sim for details.
#
    .data
    const:
    .float 10
    .text
main:
    li a7, 6
    ecall
    
    la t0, const
    flw fa1, (t0)
    fmul.s fa0, fa0, fa1
    fcvt.w.s t4, fa0, dyn
    li t5, 100
    li t0, 10
    rem t4, t4, t5
    lui   t3, 0xffff0    # MMIO address high half
    div t1, t4, t0
    sb    t1, 0x10(t3)   # (0xffff0000+0x10)
    rem    t2, t4, t0
    sb    t2, 0x11(t3)   # (0xffff0001+0x10)