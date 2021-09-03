    .data
prompt:
    .asciiz "Enter a positive integer greater than equal to 10: "
prime_msg:
    .asciiz "Entered number is a PRIME number.\n"
composite_msg:
    .asciiz "Entered number is a COMPOSITE number.\n"
limit_msg:
    .asciiz "Exiting, number entered is less than 10.\n"

    .text
    .globl main

main:
    li      $v0, 4
    la      $a0, prompt
    syscall

    li      $v0, 5
    syscall
    move    $s0, $v0
    li      $t1, 10
    blt     $s0, $t1, sanity_fail   # if $s0 < $t1 then target

    li      $t0, 2          # i = 2

loop:
    multu   $t0, $t0            # $t0 * $t0 = Hi and Lo registers
    mflo    $t1                 # copy Lo to $t2
    bgt     $t1, $s0, prime     # if $t1 > $t1 then target

    mfhi    $t1
    bgtz    $t1, prime          # if $t1 > $t1 then target

    rem     $t1, $s0, $t0
    beqz    $t1, composite

    addi    $t0, $t0, 1         #
    j       loop                # jump to loop
    
prime:
    li      $v0, 4
    la      $a0, prime_msg
    syscall
    j       exit                # jump to exit

composite:
    li      $v0, 4
    la      $a0, composite_msg
    syscall
    j       exit                # jump to exit

sanity_fail:
    li      $v0, 4
    la      $a0, limit_msg
    syscall

exit:
    li      $v0, 10	
    syscall
    