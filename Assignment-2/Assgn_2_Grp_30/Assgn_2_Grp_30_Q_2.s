# Assignment No. - 2
# Problem No. - 2 (Find GCD of two numbers)
# Semester - 5 (Autumn 2021-22)
# Group No. - 30
# Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)

# Data Segment
    .data
prompt1:                                                            # Prompt for 1st integer input 
    .asciiz "Enter the first positive integer: "            
prompt2:                                                            # Prompt for 2nd integer input
    .asciiz "Enter the second positive integer: "
error_msg:                                                          # Error message when sanity check fails, both numbers should be >= 0
    .asciiz "Exiting, Both entered numbers should be positive.\n"
output_msg:                                                         # Display message for output
    .asciiz "GCD of the two integers is:  "
newline:                                                            # newline character
    .asciiz "\n"

# Code Segment

# Program variables:
# $s0 stores a
# $s1 stores b
# $s0 stores GCD

    .text
    .globl main

main:
    la      $a0, prompt1                    # load address of prompt1 in $a0
    li      $v0, 4                          # $v0 = 4, 4 is the system call code for printing a string to the console
    syscall                                 # print prompt1 on the console

    li      $v0, 5                          # $v0 = 5, 5 is the system call code to read an integer from the console
    syscall                                 # read the first integer a
    move    $s0, $v0                        # move a to $s0

    la      $a0, prompt2                    # load address of prompt2 in $a0
    li      $v0, 4                          # $v0 = 4
    syscall                                 # print prompt2 on the console

    li      $v0, 5                          # $v0 = 5
    syscall                                 # read the second integer b
    move    $s1, $v0                        # move b to $s1

    bltz    $s0, sanity_fail                # if a < 0, jump to sanity_fail
    bltz    $s1, sanity_fail                # if b < 0, jump to sanity_fail
    
# Start computing GCD of a and b
gcd:
    bnez    $s0, loop                       # if a != 0, branch to loop
    move    $t0, $s1                        # if a == 0, then b is the gcd, store b in $t0
    j       display_gcd                     # jump to display_gcd

loop:
    beqz    $s1, end_loop                   # if a == 0, break the loop and jump to end_loop, else the loop continues
    bgt     $s0, $s1, greater_a             # if a > b, jump to greater_a

    sub     $s1, $s1, $s0                   # since here a <= b, perform b = b - a
    j       loop                            # jump to loop (continue the loop)

greater_a:
    sub     $s0, $s0, $s1                   # since here a > b, perform a = a - b
    j       loop                            # jump to loop (continue the loop)

end_loop:
    move    $t0, $s0                        # at the end of the loop, a($s0) is the gcd, store that in $t0

display_gcd:
    la      $a0, output_msg                 # load address of output_msg in $a0
    li      $v0, 4                          # $v0 = 4
    syscall                                 # prints output_msg on the console

    move    $a0, $t0                        # $a0 = $t0 (value of the gcd)
    li      $v0, 1                          # $v0 = 1, 1 is the system call code for printing an integer to the console
    syscall                                 # print the GCD on the console

    la      $a0, newline                    # load address of newline in $a0
    li      $v0, 4                          # $v0 = 4
    syscall                                 # print newline on the console

    j       exit                            # jump to exit

sanity_fail:
    la      $a0, error_msg                  # load address of error_msg in $a0
    li      $v0, 4                          # $v0 = 4
    syscall

exit:
    li      $v0, 10                         # system call for exit
    syscall
