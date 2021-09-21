# Data Segment
    .data
input_prompt:                                                       # Prompt for reading input
    .asciiz "Enter four integers n, a, r and m (n > 0 and m != 0): (each integer on a new line) \n"
A_msg:                                                              # Message for displaying matrix A
    .asciiz "\nMatrix A: \n"
m_ezero_msg:                                                        # Error message if m == 0 
    .asciiz "Error, m must not be zero.\n"
n_lezero_msg:                                                       # Error message if n <= 0 
    .asciiz "Error, n must be positive.\n"
output_msg:                                                         # Prompt for output
    .asciiz "\nFinal determinant of matrix A is: "                    
whitespace:                                                         # Whitespace character
    .asciiz " "
newline:                                                            # Newline character
    .asciiz "\n"

debug:
    .asciiz "val: "

# Code Segment

    .text
    .globl main

# Main function
# 0($s0) is $fp
# -4($s0) is n
# -8($s0) is a
# -12($s0) is r
# -16($s0) is m
main:   
    jal     initStack                           # call initStack to set up stack and frame pointer
    move    $s0, $sp                            # save stack pointer in $s0, $s0 stores address of $fp

    li      $v0, 4  
    la      $a0, input_prompt   
    syscall                                     # print input_prompt on the console

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

    li      $v0, 5  
    syscall                                     # read m
    move    $a0, $v0                            # $a0 = argument for pushToStack function
    jal     pushToStack                         # push m on the stack

    beq    $v0, $zero, m_ezero                  # if m == 0, it is invalid

    # Allocate memory for matrix A  
    lw      $t0, -4($s0)                        # $t0 = n
    mul     $a0, $t0, $t0                       # $a0 = n * n
    jal     mallocInStack                       # call mallocInStack with $a0 as argument
    move    $s1, $v0                            # $s1 = address of first element of matrix A

populate_A: 
    lw      $t0, -4($s0)                        # $t0 = n
    mul     $t1, $t0, $t0                       # $t1 = n * n
    li      $t2, 0                              # $t2 = i = 0
    lw      $t3, -8($s0)                        # $t3 = a
    lw      $t6, -16($s0)                       # t6 = m
    div     $t3, $t6                            # HI stores a%m and LO stores a/m
    mfhi    $t3
    lw      $t4, -12($s0)                       # $t4 = r
    move    $t5, $s1                            # $t5 = address of first element of A

# Loop to populate the elements of A in a row-major fashion
# Note that the elements of A are such that successive elements are placed lower in the stack (w.r.t address)
populate_loop:
    bge     $t2, $t1, display_A                 # if i >= n * n, exit loop and jump to display_A
    sw      $t3, 0($t5)                         # store the value in $t3 to the current matrix element being pointed to by $t6
    mul     $t3, $t3, $t4                       # $ t3 = $t3 * r (get next term of GP)
    lw      $t6, -16($s0)
    div     $t3, $t6                            # HI stores $t3 % m and LO stores $t3 / m
    mfhi    $t3                                 # $t3 stores (ar^i)%m
    addi    $t5, -4                             # decrement $t5 by 4 to point to next matrix element
    addi    $t2, 1                              # i = i + 1
    j populate_loop                             # continue the loop

display_A:  
    li      $v0, 4  
    la      $a0, A_msg  
    syscall                                     # print A_msg on the console

    lw      $a0, -4($s0)                        # $a0 = n
    move    $a1, $s1                            # $a1 = address of first element of A
    jal     printMatrix                         # call the printMatrix function with $a0, $a1, $a2 as arguments

call_recursive_Det:
    lw    $a0, -4($s0)                          # $a0 = n
    move  $a1, $s1                              # $a1 = address of first element of matrix A
    jal   recursive_Det

    move    $t0, $v0
    li      $v0, 4
    la      $a0, output_msg
    syscall

    move    $a0, $t0
    la      $v0, 1
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    # j       exit

free_stack: 
    move    $sp, $fp                            # before ending the program, restore the stack pointer
    j       exit                                # unconditional jump to exit


# Function to initialise the stack and frame pointers
initStack:
    addi    $sp, $sp, -4                        # Decrement stack pointer by 4
    sw      $fp, 0($sp)                         # Store $fp in stack
    move    $fp, $sp                            # Make $fp point to current stack top before program execution
    jr      $ra                                 # jump to return address


# Function to push an element (in $a0) to the stack
pushToStack:
    addi    $sp, $sp, -4                        # Decrement stack pointer by 4
    sw      $a0, 0($sp)                         # Store $a0 in stack
    jr      $ra                                 # jump to return address

# Function to pop an element from stack
popFromStack:
    addi    $sp, $sp, 4
    jr      $ra


# Function to allocate memory for n * n integers on stack
mallocInStack:
    sll     $t0, $a0, 2                         # $t0 = $a0 * 4 = 4*m*n
    addi    $v0, $sp, -4                        # store beginning address in $v0, so that we can return this value
    sub     $sp, $sp, $t0                       # Decrement stack pointer to allocate memory for 4*m*n bytes
    jr      $ra                                 # jump to return address


# Function to print a n x n matrix
# For this function,
# $t0 is address of current matrix element
# $t1 is i
# $t2 is j
# $t3 is n
printMatrix:
    move    $t0, $a1                            # address of first element A
    move    $t3, $a0                            # $t3 = n
    li      $t1, 0                              # $t1 is current row number (0 to n - 1), let's call it i
    
print_outer_loop:
    beq     $t1, $t3, return_from_print         # if i == n, exit from the outer loop
    li      $t2, 0                              # $t2 is current column number (0 to n - 1), let's call it j

print_inner_loop:
    beq     $t2, $t3, exit_print_inner_loop     # if j == n, exit from inner loop
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


# recursive determinant function
recursive_Det:
    # move    $t5, $ra
    # move    $t6, $a0
    # move    $t7, $a1
    # jal     printMatrix

    # move    $ra, $t5
    # move    $a0, $t6
    # move    $a1, $t7   

    # move    $t1, $a0

    move    $t0, $ra
    jal     pushToStack
    move    $a0, $a1
    jal     pushToStack
    move    $a0, $t0
    jal     pushToStack

    # move    $ra, $t0

    # addi    $sp, $sp, -12                       # adjust stack for 3 items
    # sw      $ra, 0($sp)                         # save return address on stack
    # sw      $a1, 4($sp)                         # save address of first element of matrix A on stack
    # sw      $a0, 8($sp)                         # save n on stack

    li      $t0, 1
    lw      $t1, 8($sp)
    # bne     $t0, $a0, not_equal1
    bne     $t0, $t1, not_equal1
    # base case
    lw      $v0, 0($a1)
    lw      $ra, 0($sp)
    addi    $sp, $sp, 12
    jr      $ra

not_equal1:
   
    li      $v0, 0                              # stores return value
    move    $a0, $v0
    jal     pushToStack                 
    # sw      $v0, 4($sp)                         # stores current value on stack
    # addi    $sp, $sp, -8
    li      $t0, 1                              # stores sign, initialized to 1
    move    $a0, $t0
    jal     pushToStack
    # sw      $t0, 0($sp)                         # sign stored on stack
    
    lw      $t2, 16($sp)                        # $t2 stores n
    li      $t0, 0                              # $t0 stores loop_counter, initialized to 0

loopDet: 
    beq     $t0, $t2, end_loop                  # check if j == n
    move    $t6, $t0                            # $t6 stores j
    # addi    $sp, $sp, -4                        # create space for 1 variable on stack
    # sw      $t0, 0($sp)                         # store current value of loop counter on stack

    move    $a0, $t0
    jal     pushToStack

    lw      $t7, 16($sp)                        # $t7 stores address of 1st element of A
    move    $t1, $t2                            # store n' in $t1
    addi    $t1, $t1,-1                         # $t1 = n'-1
    mul     $t1, $t1, $t1                       # $t1 = $t1 * $t1 (i.e., $t1 = (n'-1)*(n'-1))
    # allocate memory on stack
    move    $a0, $t1
    jal     mallocInStack
    # populate matrix A'(cofactor matrix)
    move    $t0, $t2                            # $t0 store n
    move    $t1, $v0                            # $t1 stores address of 1st element of A'
    li      $t2, 1                              # stores row
    li      $t3, 0                              # stores col
    # li      $t4, 0                              # stores i
    # li      $t5, 0                              # stores j
    li      $t8, -4
    mul     $t8, $t8, $t0
    add     $t7, $t7, $t8                       # $t7 points to 1st element of 2nd row in matrix A
    # $t6 stores col to be skipped

outer_fillA:
    beq     $t2, $t0, end_ofillA                # check row == n, if yes, end outer loop of fill A
    move    $t3, $zero                          # col = 0

inner_fillA:
    beq     $t3, $t0, end_ifillA                # check if col == n, if yes, end inner loop of fill A
    beq     $t6, $t3, increment_col             # if col == j, jump to increment col
    lw      $t4, 0($t7)
    sw      $t4, 0($t1)
    addi    $t1, $t1, -4
    addi    $t7, $t7, -4
    addi    $t3, $t3, 1
    j       inner_fillA

increment_col:
    addi    $t3, $t3, 1
    addi    $t7, $t7, -4
    j       inner_fillA

end_ifillA:
    addi    $t2, $t2, 1
    j       outer_fillA

end_ofillA:
    addi    $t0, $t0, -1                        # $t0 = n-1
    move    $a0, $t0
    jal     pushToStack
    move    $a0, $t0                            # $a0 = n as $t0 stores n
    # addi    $a0, $a0, -1                        # $a0 = n-1
    move    $a1, $v0                            # $a1 stores address of 1st element of cofactor matrix A'
    # addi    $sp, $sp, -4                        # create space for 1 variable on stack
    
    # sw      $t0, 0($sp)                         # store n-1 on stack
    
    jal     recursive_Det

    # move    $t9, $v0 

    # li      $v0, 4  
    # la      $a0, debug    
    # syscall   

    # li      $v0, 1
    # move    $a0, $t9
    # syscall

    # li      $v0, 4  
    # la      $a0, newline    
    # syscall   

    # move    $v0, $t9

    lw      $t2, 0($sp)                         # $t2 stores n-1
    move    $t0, $t2
    mul     $t0, $t0, $t0                       # $t0 stores (n-1)*(n-1)
    addi    $sp, $sp, 4                         # pop top element (i.e., n-1) from stack
    sll     $t0, $t0, 2
    add     $sp, $sp, $t0                       # pop matrix A' from stack
    lw      $t0, 0($sp)                         # load loop counter back in $t0
    addi    $sp, $sp, 4                         # pop loop counter from stack
    lw      $t1, 0($sp)                         # load sign from stack
    addi    $sp, $sp, 4                         # pop sign from stack
    lw      $t3, 0($sp)                         # load current value of det from loop
    addi    $sp, $sp, 4                         # pop current value of det from stack
    # move    $t4, $zero                        # $t4 = 0, $t4 will store so far computed value of determinant
    # lw      $t9, 0($sp)
    mul     $t4, $v0, $t1                       # $t4 = recursiveDet(A', n-1)*sign
    lw      $t5, 4($sp)                         # load address of 1st element of A in $t5
    move    $t6, $t0                            # $t6 = j(loop counter)
    li      $t8, -4
    mul     $t6, $t6, $t8                       # $t6 = -4*j
    add     $t5, $t5, $t6                       # $t5 now stores address of jth element of 1st row
    lw      $t5, 0($t5)                         # $t5 stores jth element of 1st row
    mul     $t4, $t4, $t5                       # $t4 = recursiveDet(A', n-1) * sign * A[0][j]
    add     $t4, $t4, $t3
    # addi    $sp, $sp, -8                        # create space for 2 variables on stack
    # sw      $t4, 4($sp)                         # store sofar value of Det on stack

    move    $a0, $t4
    jal     pushToStack
    
    li      $t8, -1
    mul     $t1, $t1, $t8                       # sign = -sign
    # sw      $t1, 0($sp)                         # store updated sign on stack
    move    $a0, $t1
    jal     pushToStack
    
    addi    $t2, $t2, 1                         # $t2 = n
    addi    $t0, $t0, 1                         # $t0 = j+1
    j       loopDet

end_loop:
    addi    $sp, $sp, 4                         # pop sign from stack
    lw      $v0, 0($sp)
    addi    $sp, $sp, 4                         # pop determinant value from stack
    lw      $ra, 0($sp)                         # restore return address
    addi    $sp, $sp, 12
    jr      $ra

m_ezero:
    li      $v0, 4
    la      $a0, m_lezero_msg
    syscall                                     # print m_ezero_msg on the console
    j       exit

n_lezero:
    li      $v0, 4
    la      $a0, n_lezero_msg
    syscall                                     # print n_lezero_msg on the console
    j       exit

exit:
    li      $v0, 10                         
    syscall                                     # syscall for exit
    