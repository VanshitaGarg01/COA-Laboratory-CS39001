# Assignment No. - 2
# Problem No. - 4 (Check if a number is a perfect number or not)
# Semester - 5 (Autumn 2021-22)
# Group No. - 30
# Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)

# Data Segment
    .data
prompt:                                                         # Prompt for input for n
    .asciiz "Enter a positive integer: "
perfect_msg:                                                    # Message when the number is perfect
    .asciiz "Entered number is a perfect number.\n"
not_perfect_msg:                                                # Message when the number is not perfect
    .asciiz "Entered number is not a perfect number.\n"
limit_msg:                                                      # Error message when sanity check fails
    .asciiz "Exiting, number entered is not positive.\n"

# Code Segment

# Program variables:
# $s0 stores n
# $t0 stores i
# $s1 stores sum (the sum of divisors)

    .text
    .globl main

main:
    li      $v0, 4                          # $v0 = 4, 4 is the system call code for printing a string to the console
    la      $a0, prompt                     # load address of prompt in $a0
    syscall                                 # print prompt on the console

    li      $v0, 5                          # $v0 = 5, 5 is the system call code to read an integer from the console
    syscall                                 # syscall to read n
    move    $s0, $v0                        # move n to $s0
    blez    $s0, sanity_fail                # if n < 0 then jump to sanity_fail

    li      $t0, 1                          # initialize i = 1
    li      $s1, 0                          # initialize sum = 0

loop:
    bge     $t0, $s0, check                 # if i >= n, exit the loop and jump to check

    rem     $t1, $s0, $t0                   # $t1 = n % i
    bnez    $t1, continue_loop              # if $t1 != 0, jump to continue_loop

    add     $s1, $s1, $t0                   # sum = sum + i (we are here if i divides n)

continue_loop:
    addi    $t0, $t0, 1                     # i = i + 1
    j       loop                            # jump to loop

check:
    beq     $s1, $s0, perfect               # if sum == n, jump to perfect
    j       not_perfect                     # jump to not_perfect 
    
perfect:
    li      $v0, 4                          # $v0 = 4
    la      $a0, perfect_msg                # load address of perfect_msg in $a0
    syscall                                 # print perfect_msg on the console
    j       exit                            # jump to exit

not_perfect:
    li      $v0, 4                          # $v0 = 4
    la      $a0, not_perfect_msg            # load address of not_perfect_msg in $a0
    syscall                                 # print not_perfect_msg on the console
    j       exit                            # jump to exit

sanity_fail:
    li      $v0, 4                          # $v0 = 4
    la      $a0, limit_msg                  # load address of limit_msg in $a0
    syscall                                 # print limit_msg on the console

exit:
    li      $v0, 10                         # syscall for exit
    syscall
    