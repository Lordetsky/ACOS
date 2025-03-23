    .macro push(%x)
        addi sp, sp, -4
        sw %x, (sp)
    .end_macro

    .macro pop(%x)
        lw %x, (sp)
        addi sp, sp, 4
    .end_macro

binary_search:
    bgt a2, a3, return_neg1

    sub a4, a3, a2
    li a5, 2
    div a4, a4, a5
    add a4, a2, a4

    slli a5, a4, 2
    add a5, a0, a5
    lw a6, 0(a5)

    beq a6, a1, return_index
    blt a1, a6, search_left

    addi a2, a4, 1
    push ra
    jal binary_search
    pop ra
    jalr ra

search_left:
    addi a3, a4, -1
    push ra
    jal binary_search
    pop ra
    jalr ra

return_index:
    mv a0, a4
    jalr ra

return_neg1:
    li a0, -1
    jalr ra
