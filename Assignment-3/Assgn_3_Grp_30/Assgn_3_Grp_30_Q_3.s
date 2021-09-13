# Assignment No. - 3
# Problem No. - 3 (Find and print transpose of an m x n matrix)
# Semester - 5 (Autumn 2021-22)
# Group No. - 30
# Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)

    .data
input_prompt:
    .asciiz "Enter four positive integers m, n, a and r: \n"
A_msg:
    .asciiz "\nMatrix A: \n"
B_msg:
    .asciiz "\nMatrix B (Transpose of matrix A): \n"
whitespace:                                             # Whitespace character
    .asciiz " "
newline:                                                # Newline character
    .asciiz "\n"

    .text
    .globl main

main:
    jal     initStack
    move    $s0, $sp

    li      $v0, 4
    la      $a0, input_prompt
    syscall                                 # print input_prompt on the console

    li      $v0, 5
    syscall                                 # read m
    move    $a0, $v0
    jal     pushToStack

    li      $v0, 5
    syscall                                 # read n
    move    $a0, $v0
    jal     pushToStack

    li      $v0, 5
    syscall                                 # read a
    move    $a0, $v0
    jal     pushToStack

    li      $v0, 5
    syscall                                 # read r
    move    $a0, $v0
    jal     pushToStack

    # Allocate memory for matrix A
    lw      $t0, 0($s0)                     # $t0 = m
    lw      $t1, -4($s0)                    # $t1 = n
    mul     $a0, $t0, $t1
    jal     mallocInStack
    move    $s1, $v0                        # $s1 = address of first element of matrix A

    # Allocate memory for matrix B
    lw      $t0, 0($s0)                     # $t0 = m
    lw      $t1, -4($s0)                    # $t1 = n
    mul     $a0, $t0, $t1
    jal     mallocInStack
    move    $s2, $v0                        # $s2 = address of first element of matrix B

populate_A:
    lw      $t0, 0($s0)                     # $t0 = m
    lw      $t1, -4($s0)                    # $t1 = n
    mul     $t2, $t0, $t1                   # $t2 = m * n
    li      $t3, 0                          # i = 0
    lw      $t4, -8($s0)                    # $t4 = a
    lw      $t5, -12($s0)                   # $t5 = r
    move    $t6, $s1                        # $t6 = address of A

populate_loop:
    bge     $t3, $t2, display_A
    sw      $t4, 0($t6)
    mul     $t4, $t4, $t5
    addi    $t6, -4
    addi    $t3, 1
    j populate_loop

display_A:
    li      $v0, 4
    la      $a0, A_msg
    syscall                                 # print A_msg on the console

    lw      $a0, 0($s0)                     # $a0 = m
    lw      $a1, -4($s0)                    # $a1 = n
    move    $a2, $s1                        # $a2 = address of A
    jal     printMatrix

call_transpose:
    lw      $a0, 0($s0)                     # $a0 = m
    lw      $a1, -4($s0)                    # $a1 = n
    move    $a2, $s1                        # $a2 = address of A
    move    $a3, $s2                        # $a3 = address of B
    jal     transposeMatrix

display_B:
    li      $v0, 4
    la      $a0, B_msg
    syscall                                 # print B_msg on the console

    lw      $a0, -4($s0)                    # $a0 = n
    lw      $a1, 0($s0)                     # $a1 = m
    move    $a2, $s2                        # $a2 = address of B
    jal     printMatrix

free_stack:
    move    $sp, $fp    
    j       exit

initStack:
    addi    $sp, $sp, -4
    sw      $fp, 0($sp)
    move    $fp, $sp
    jr      $ra

pushToStack:
    addi    $sp, $sp, -4
    sw      $a0, 4($sp)
    jr      $ra

mallocInStack:
    sll     $t0, $a0, 2
    move    $v0, $sp
    sub     $sp, $sp, $t0
    jr      $ra

printMatrix:
    move    $t0, $a2                        # address of A
    move    $t3, $a0                        # m
    move    $t4, $a1                        # n

    li      $t1, 0                          # (i = 0) current row number (0 to m - 1)
    
print_outer_loop:
    beq     $t1, $t3, return_from_print
    li      $t2, 0                          # (j = 0) current column number (0 to n - 1)

print_inner_loop:
    beq     $t2, $t4, exit_print_inner_loop
    li      $v0, 1
    lw      $a0, 0($t0)                     
    syscall                                 # print the array element
    li      $v0, 4
    la      $a0, whitespace
    syscall                                 # print whitespace
    addi    $t0, -4;
    addi    $t2, 1                          # j = j + 1
    j       print_inner_loop

exit_print_inner_loop:    
    li      $v0, 4
    la      $a0, newline
    syscall                                 # print newline
    addi    $t1, 1                          # i = i + 1
    j       print_outer_loop

return_from_print:
    jr      $ra


transposeMatrix:
    move    $t0, $a2                        # address of A
    move    $t1, $a3                        # address of B
    move    $t2, $a0                        # m
    move    $t3, $a1                        # n

    li      $t4, 0                          # i = 0

transpose_outer_loop:
    beq     $t4, $t2, return_from_transpose
    li      $t5, 0                          # (j = 0) current column number (0 to n - 1)

transpose_inner_loop:
    beq     $t5, $t3, exit_transpose_inner_loop
    lw      $t6, 0($t0)                     # A[i][j]
    mul     $t7, $t2, $t5                   # $t7 = m * j
    add     $t7, $t7, $t4                   # $t7 = m * j + i
    sll     $t7, $t7, 2
    sub     $t7, $t1, $t7
    sw      $t6, 0($t7)
    addi    $t0, -4;
    addi    $t5, 1                          # j = j + 1
    j       transpose_inner_loop

exit_transpose_inner_loop:    
    addi    $t4, 1                          # i = i + 1
    j       transpose_outer_loop

return_from_transpose:
    jr      $ra


exit:
    li      $v0, 10                         
    syscall                                 # syscall for exit
    