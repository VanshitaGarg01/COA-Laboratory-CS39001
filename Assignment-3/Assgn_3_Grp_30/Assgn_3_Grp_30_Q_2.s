# Assignment No. - 3
# Problem No. - 2 (k-th largest number after sorting using insertion sort)
# Semester - 5 (Autumn 2021-22)
# Group No. - 30
# Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)

    .data
array_prompt:
    .asciiz "Enter 10 integers:\n"
k_prompt:
    .asciiz "Enter the value of k: "
sorted_msg:
    .asciiz "Sorted array: "
error_msg:
    .asciiz "Error, k cannot be greater than n\n"
output_msg:
    .asciiz "k-th largest number is: "
whitespace:
    .asciiz " "
newline:
    .asciiz "\n"
array:
    .align 2
    .space 40

    .text
    .globl main

main:
    # Read 10 nos in array
    li      $v0, 4                          # $v0 = 4, 4 is the system call code for printing a string to the console
    la      $a0, array_prompt                     # load address of prompt in $a0
    syscall                                 # print prompt on the console

    la      $t0, array
    li      $t1, 0
    li      $s0, 10

read_loop:
    bge     $t1, $s0, read_k
    li      $v0, 5
    syscall
    sw      $v0, 0($t0)
    addi    $t0, 4
    addi    $t1, 1
    j       read_loop

read_k:
    li      $v0, 4
    la      $a0, k_prompt
    syscall
    li      $v0, 5
    syscall

call_function:
    move    $s1, $v0        # useless
    la      $a0, array
    li      $a1, 10
    move    $a2, $v0

    jal     find_k_largest
    move    $t1, $v0

print_result:
    li      $v0, 4
    la      $a0, output_msg
    syscall

    li      $v0, 1
    move    $a0, $t1
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    j       exit


find_k_largest:
    bgt     $a2, $a1, sanity_fail
    addi    $sp, $sp, -16
    sw      $a0, 12($sp)
    sw      $a1, 8($sp)
    sw      $a2, 4($sp)
    sw      $ra, 0($sp)

    jal     sort_array

    # add logic to find kth element
    lw      $t0, 12($sp)
    sub     $t1, $a1, $a2
    sll     $t2, $t1, 2
    add     $t2, $t2, $t0
    lw      $v0, 0($t2)

    lw      $ra, 0($sp)
    addi    $sp, $sp, 16
    jr      $ra


sort_array:
    move    $t0, $a0    # t0 = array
    move    $t1, $a1    # t1 = n
    li      $t2, 1      # t2 = j = 1

outer_j_loop:
    bge     $t2, $t1, exit_outer    # exit loop when j >= n
    sll     $t4, $t2, 2
    add     $t4, $t4, $t0       # t4 = address of a[j]
    lw      $t5, 0($t4)         # t5 = temp = a[j]
    addi    $t3, $t2, -1        #t3 = i = j - 1

inner_i_loop:
    bltz    $t3, exit_inner
    sll     $t4, $t3, 2
    add     $t4, $t4, $t0       # t4 = address of a[i]
    lw      $t6, 0($t4)         # t6 = a[i]
    ble     $t6, $t5, exit_inner
    addi    $t4, 4
    sw      $t6, 0($t4)         # a[i + 1] = a[i]
    addi    $t3, $t3, -1        # i--
    j       inner_i_loop

exit_inner:
    addi    $t3, $t3, 1         
    sll     $t4, $t3, 2
    add     $t4, $t4, $t0
    sw      $t5, 0($t4)         # a[i + 1] = temp

    addi    $t2, $t2, 1
    j       outer_j_loop

exit_outer:
    li      $t3, 0          # i = 0

print_array:
    li      $v0, 4
    la      $a0, sorted_msg
    syscall

    # remove this
    # la      $t0, array

print_loop:
    bge     $t3, $t1, return
    li      $v0, 1
    lw      $a0, 0($t0)
    syscall
    li      $v0, 4
    la      $a0, whitespace
    syscall
    addi    $t0, 4
    addi    $t3, 1
    j       print_loop

return:
    li      $v0, 4
    la      $a0, newline
    syscall

    jr      $ra

sanity_fail:
    li      $v0, 4                          # $v0 = 4
    la      $a0, error_msg                  # load address of limit_msg in $a0
    syscall                                 # print limit_msg on the console

exit:
    li      $v0, 10                         # syscall for exit
    syscall
