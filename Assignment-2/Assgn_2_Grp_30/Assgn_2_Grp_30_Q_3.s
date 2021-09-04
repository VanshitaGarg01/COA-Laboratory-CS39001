# Assignment No. - 2
# Problem No. - 3 (Check if a number is prime or not)
# Semester - 5 (Autumn 2021-22)
# Group No. - 30
# Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)

# Data Segment
    .data
prompt:                                                                 # Prompt for input for n
    .asciiz "Enter a positive integer greater than equal to 10: "
prime_msg:                                                              # Message when the number is prime
    .asciiz "Entered number is a PRIME number.\n"
composite_msg:                                                          # Message when the number is composite
    .asciiz "Entered number is a COMPOSITE number.\n"
limit_msg:                                                              # Error message when sanity check fails
    .asciiz "Exiting, number entered is less than 10.\n"

# Code Segment

# Program variables:
# $s0 stores n
# t0 stores i

    .text
    .globl main

main:
    li      $v0, 4                          # $v0 = 4, 4 is the system call code for printing a string to the console
    la      $a0, prompt                     # load address of prompt in $a0
    syscall                                 # print prompt on the console

    li      $v0, 5                          # $v0 = 5, 5 is the system call code to read an integer from the console
    syscall                                 # syscall to read n
    move    $s0, $v0                        # move n to $s0
    li      $t1, 10                         # $t1 = 10
    blt     $s0, $t1, sanity_fail           # if n < 10 then jump to sanity_fail

    li      $t0, 2                          # initialize i = 2

loop:
    multu   $t0, $t0                        # i * i, result gets stored in hi and lo registers
    mflo    $t1                             # copy lo to $t1
    bgt     $t1, $s0, prime                 # if $t1 > n, then jump to prime by exiting the loop

    mfhi    $t1                             # copy hi to $t1
    bgtz    $t1, prime                      # $ti > 0, then jump to prime by exiting the loop, because this means that i * i is bigger than any 32-bit number, hence i * i > n

    rem     $t1, $s0, $t0                   # $t1 = n % i
    beqz    $t1, composite                  # if $t1 = 0, jump to composite

    addi    $t0, $t0, 1                     # i = i + 1
    j       loop                            # jump to loop and continue the loop
    
prime:
    li      $v0, 4                          # $v0 = 4
    la      $a0, prime_msg                  # load address of prime_msg in $a0
    syscall                                 # print prime_msg on the console
    j       exit                            # jump to exit

composite:
    li      $v0, 4                          # $v0 = 4
    la      $a0, composite_msg              # load address of composite_msg in $a0
    syscall                                 # print composite_msg on the console
    j       exit                            # jump to exit

sanity_fail:
    li      $v0, 4                          # $v0 = 4
    la      $a0, limit_msg                  # load address of limit_msg in $a0
    syscall                                 # print limit_msg on the console

exit:
    li      $v0, 10                         # syscall for exit
    syscall
    