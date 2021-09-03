    .data
prompt:
    .asciiz "Enter a positive integer: "
perfect_msg:
    .asciiz "Entered number is a perfect number.\n"
not_perfect_msg:
    .asciiz "Entered number is not a perfect number.\n"
limit_msg:
    .asciiz "Exiting, number entered is not positive.\n"

    .text
    .globl main

main:
    li      $v0, 4
    la      $a0, prompt
    syscall

    li      $v0, 5
    syscall
    move    $s0, $v0
    blez    $s0, sanity_fail   # if $s0 < $t1 then target

    li      $t0, 1          # i = 2
    li      $s1, 0          # sum = 0

loop:
    bge     $t0, $s0, check

    rem     $t1, $s0, $t0
    bnez    $t1, continue_loop

    add     $s1, $s1, $t0

continue_loop:
    addi    $t0, $t0, 1         #
    j       loop                # jump to loop

check:
    beq     $s1, $s0, perfect
    j       not_perfect
    
perfect:
    li      $v0, 4
    la      $a0, perfect_msg
    syscall
    j       exit                # jump to exit

not_perfect:
    li      $v0, 4
    la      $a0, not_perfect_msg
    syscall
    j       exit                # jump to exit

sanity_fail:
    li      $v0, 4
    la      $a0, limit_msg
    syscall

exit:
    li      $v0, 10	
    syscall
    