# Assignment No. - 3
# Problem No. - 3 (Find and print transpose of an m x n matrix)
# Semester - 5 (Autumn 2021-22)
# Group No. - 30
# Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)

# Data Segment
    .data
input_prompt:                                                       # Prompt for reading input
    .asciiz "Enter four positive integers m, n, a and r: (each integer on a new line) \n"
A_msg:                                                              # Message for displaying matrix A
    .asciiz "\nMatrix A: \n"
B_msg:                                                              # Message for displaying matrix B
    .asciiz "\nMatrix B (Transpose of matrix A): \n"
m_lezero_msg:                                                       # Error message if m <= 0 
    .asciiz "Error, m must be positive.\n"
n_lezero_msg:                                                       # Error message if n <= 0 
    .asciiz "Error, n must be positive.\n"
whitespace:                                                         # Whitespace character
    .asciiz " "
newline:                                                            # Newline character
    .asciiz "\n"

# Code Segment

    .text
    .globl main

# Main function
# 0($s0) is m
# -4($s0) is n
# -8($s0) is a
# -12($s0) is r
main:   
    jal     initStack                           # call initStack to set up stack and frame pointer
    move    $s0, $sp                            # save stack pointer in $s0

    li      $v0, 4  
    la      $a0, input_prompt   
    syscall                                     # print input_prompt on the console

    li      $v0, 5  
    syscall                                     # read m
    move    $a0, $v0                            # $a0 = argument for pushToStack function
    jal     pushToStack                         # push m on the stack

    blez    $v0, m_lezero                       # if m <= 0, it is invalid

    li      $v0, 5  
    syscall                                     # read n
    move    $a0, $v0                            # $a0 = argument for pushToStack function
    jal     pushToStack                         # push n on the stack

    blez    $v0, n_lezero                       # if n <= 0, it is invalid

    li      $v0, 5  
    syscall                                     # read a
    move    $a0, $v0                            # $a0 = argument for pushToStack function
    jal     pushToStack                         # push a on the stack

    li      $v0, 5  
    syscall                                     # read r
    move    $a0, $v0                            # $a0 = argument for pushToStack function
    jal     pushToStack                         # push r on the stack

    # Allocate memory for matrix A  
    lw      $t0, 0($s0)                         # $t0 = m
    lw      $t1, -4($s0)                        # $t1 = n
    mul     $a0, $t0, $t1                       # $a0 = m * n
    jal     mallocInStack                       # call mallocInStack with $a0 as argument
    move    $s1, $v0                            # $s1 = address of first element of matrix A

    # Allocate memory for matrix B  
    lw      $t0, 0($s0)                         # $t0 = m
    lw      $t1, -4($s0)                        # $t1 = n
    mul     $a0, $t0, $t1                       # $a0 = m * n
    jal     mallocInStack                       # call mallocInStack with $a0 as argument
    move    $s2, $v0                            # $s2 = address of first element of matrix B

populate_A: 
    lw      $t0, 0($s0)                         # $t0 = m
    lw      $t1, -4($s0)                        # $t1 = n
    mul     $t2, $t0, $t1                       # $t2 = m * n
    li      $t3, 0                              # $t3 = i = 0
    lw      $t4, -8($s0)                        # $t4 = a
    lw      $t5, -12($s0)                       # $t5 = r
    move    $t6, $s1                            # $t6 = address of first element of A

# Loop to populate the elements of A in a row-major fashion
# Note that the elements of A are such that successive elements are placed lower in the stack (w.r.t address)
populate_loop:
    bge     $t3, $t2, display_A                 # if i >= m * n, exit loop and jump to display_A
    sw      $t4, 0($t6)                         # store the value in $t4 to the current matrix element being pointed to by $t6
    mul     $t4, $t4, $t5                       # $ t4 = $t4 * r (get next term of GP)
    addi    $t6, -4                             # decrement $t6 by 4 to point to next matrix element
    addi    $t3, 1                              # i = i + 1
    j populate_loop                             # continue the loop

display_A:  
    li      $v0, 4  
    la      $a0, A_msg  
    syscall                                     # print A_msg on the console

    lw      $a0, 0($s0)                         # $a0 = m
    lw      $a1, -4($s0)                        # $a1 = n
    move    $a2, $s1                            # $a2 = address of first element of A
    jal     printMatrix                         # call the printMatrix function with $a0, $a1, $a2 as arguments

call_transpose: 
    lw      $a0, 0($s0)                         # $a0 = m
    lw      $a1, -4($s0)                        # $a1 = n
    move    $a2, $s1                            # $a2 = address of first element of A
    move    $a3, $s2                            # $a3 = address of first element of B
    jal     transposeMatrix                     # call the transposeMatrix function with $a0, $a1, $a2 and $a3 as arguments

display_B:  
    li      $v0, 4  
    la      $a0, B_msg  
    syscall                                     # print B_msg on the console

    lw      $a0, -4($s0)                        # $a0 = n
    lw      $a1, 0($s0)                         # $a1 = m
    move    $a2, $s2                            # $a2 = address of first element of B
    jal     printMatrix                         # call the printMatrix function with $a0, $a1, $a2 as arguments

free_stack: 
    move    $sp, $fp                            # before ending the program, restore the stack pointer
    j       exit                                # unconditional jump to exit


# Function to initialise the stack and frame pointers
initStack:
    addi    $sp, $sp, -4                        # Decrement stack pointer by 4
    sw      $fp, 4($sp)                         # Store $fp in stack
    move    $fp, $sp                            # Make $fp point to current stack top before program execution
    jr      $ra                                 # jump to return address


# Function to push an element (in $a0) to the stack
pushToStack:
    addi    $sp, $sp, -4                        # Decrement stack pointer by 4
    sw      $a0, 4($sp)                         # Store $a0 in stack
    jr      $ra                                 # jump to return address


# Function to allocate memory for m * n integers on stack
mallocInStack:
    sll     $t0, $a0, 2                         # $t0 = $a0 * 4 = 4*m*n
    move    $v0, $sp                            # store beginning address in $v0, so that we can return this value
    sub     $sp, $sp, $t0                       # Decrement stack pointer to allocate memory for 4*m*n bytes
    jr      $ra                                 # jump to return address


# Function to print a m x n matrix
# For this function,
# $t0 is address of current matrix element
# $t1 is i
# $t2 is j
# $t3 is m
# $t4 is n
printMatrix:
    move    $t0, $a2                            # address of first element A
    move    $t3, $a0                            # $t3 = m
    move    $t4, $a1                            # $t4 = n

    li      $t1, 0                              # $t1 is current row number (0 to m - 1), let's call it i
    
print_outer_loop:
    beq     $t1, $t3, return_from_print         # if i == m, exit from the outer loop
    li      $t2, 0                              # $t2 is current column number (0 to n - 1), let's call it j

print_inner_loop:
    beq     $t2, $t4, exit_print_inner_loop     # if j == n, exit from inner loop
    li      $v0, 1
    lw      $a0, 0($t0)                         # load the current array element into $a0
    syscall                                     # print the array element
    li      $v0, 4  
    la      $a0, whitespace 
    syscall                                     # print whitespace
    addi    $t0, -4;                            # update pointer to array elements to point to next array element
    addi    $t2, 1                              # j = j + 1
    j       print_inner_loop                    # continue inner loop
    
exit_print_inner_loop:      
    li      $v0, 4  
    la      $a0, newline    
    syscall                                     # print newline
    addi    $t1, 1                              # i = i + 1
    j       print_outer_loop                    # continue outer loop
    
return_from_print:  
    jr      $ra                                 # jump to return address


# Function to compute and store transpose of a matrix
# For this function,
# $t0 is address of current element of A
# $t1 is address of first element of B
# $t2 is m
# $t3 is n
# $t4 is i
# $t5 is j
transposeMatrix:    
    move    $t0, $a2                            # address of first element of A
    move    $t1, $a3                            # address of first element of B
    move    $t2, $a0                            # $t2 = m
    move    $t3, $a1                            # $t3 = n
    
    li      $t4, 0                              # $t4 = i = 0
    
transpose_outer_loop:   
    beq     $t4, $t2, return_from_transpose     # if i == m, exit from the outer loop
    li      $t5, 0                              # $t5 = j = 0

transpose_inner_loop:
    beq     $t5, $t3, exit_transpose_inner_loop # if j == n, exit from inner loop
    lw      $t6, 0($t0)                         # A[i][j]
    mul     $t7, $t2, $t5                       # $t7 = m * j
    add     $t7, $t7, $t4                       # $t7 = m * j + i
    sll     $t7, $t7, 2                         # $t7 = 4 * (m * j + i)
    sub     $t7, $t1, $t7                       # $t7 now contains the address of B[j][i]
    sw      $t6, 0($t7)                         # equivalent to B[j][i] = A[i][j]
    addi    $t0, -4;                            # make $t0 point to next element of matrix A
    addi    $t5, 1                              # j = j + 1
    j       transpose_inner_loop                # continue inner loop

exit_transpose_inner_loop:    
    addi    $t4, 1                              # i = i + 1
    j       transpose_outer_loop                # continue outer loop

return_from_transpose:
    jr      $ra                                 # jump to return address

m_lezero:
    li      $v0, 4
    la      $a0, m_lezero_msg
    syscall                                     # print m_lezero_msg on the console
    j       exit

n_lezero:
    li      $v0, 4
    la      $a0, n_lezero_msg
    syscall                                     # print n_lezero_msg on the console
    j       exit

exit:
    li      $v0, 10                         
    syscall                                     # syscall for exit
    