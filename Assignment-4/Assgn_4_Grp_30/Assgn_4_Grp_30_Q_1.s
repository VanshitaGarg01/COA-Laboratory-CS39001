# Assignment No. - 4
# Problem No. - 1 (Finding determinant of a matrix recursively)
# Semester - 5 (Autumn 2021-22)
# Group No. - 30
# Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)

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

    li      $v0, 4                              # Loads value 4 in $v0, 4 is the system call code for printing a string to console
    la      $a0, input_prompt                   # Loads address of input_prompt in a0
    syscall                                     # print input_prompt on the console

    li      $v0, 5                              # Loads value 5 in $v0, 5 is the system call code to read an integer from console
    syscall                                     # read n
    move    $a0, $v0                            # $a0 = argument for pushToStack function, $v0 stores n
    jal     pushToStack                         # push n on the stack

    blez    $v0, n_lezero                       # if n <= 0, it is invalid

    li      $v0, 5                              # Loads value 5 in $v0, 5 is the system call code to read an integer from console
    syscall                                     # read a
    move    $a0, $v0                            # $a0 = argument for pushToStack function, $v0 stores a
    jal     pushToStack                         # push a on the stack

    li      $v0, 5                              # Loads value 5 in $v0, 5 is the system call code to read an integer from console
    syscall                                     # read r
    move    $a0, $v0                            # $a0 = argument for pushToStack function, $v0 = r
    jal     pushToStack                         # push r on the stack

    li      $v0, 5                              # Loads value 5 in $v0, 5 is the system call code to read an integer from console
    syscall                                     # read m
    move    $a0, $v0                            # $a0 = argument for pushToStack function, $v0 = m
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
    mfhi    $t3                                 # $t3 stores a%m
    lw      $t4, -12($s0)                       # $t4 = r
    move    $t5, $s1                            # $t5 = address of first element of A

# Loop to populate the elements of A in a row-major fashion
# Note that the elements of A are such that successive elements are placed lower in the stack (w.r.t address)
populate_loop:
    bge     $t2, $t1, display_A                 # if i >= n * n, exit loop and jump to display_A
    sw      $t3, 0($t5)                         # store the value in $t3 to the current matrix element being pointed to by $t6
    mul     $t3, $t3, $t4                       # $ t3 = $t3 * r (get next term of GP)
    lw      $t6, -16($s0)                       # $t6 stores m
    div     $t3, $t6                            # HI stores $t3 % m and LO stores $t3 / m
    mfhi    $t3                                 # $t3 stores (ar^i)%m
    addi    $t5, -4                             # decrement $t5 by 4 to point to next matrix element
    addi    $t2, 1                              # i = i + 1
    j populate_loop                             # continue the loop

display_A:  
    li      $v0, 4                              # Loads value 4 in $v0, 4 is the system call code for printing a string to console
    la      $a0, A_msg                          # Loads address of A_msg in a0
    syscall                                     # print A_msg on the console

    lw      $a0, -4($s0)                        # $a0 = n
    move    $a1, $s1                            # $a1 = address of first element of A
    jal     printMatrix                         # call the printMatrix function with $a0, $a1, $a2 as arguments

call_recursive_Det:
    lw    $a0, -4($s0)                          # $a0 = n
    move  $a1, $s1                              # $a1 = address of first element of matrix A
    jal   recursive_Det                         # call the recursive_Det function with $a0, $a1 as arguments

    move    $t0, $v0                            # $t0 = $v0, $v0 stores determinant of A.
    li      $v0, 4                              # Loads value 4 in $v0, 4 is the system call code for printing a string to console
    la      $a0, output_msg                     # Loads address of output_msg in a0
    syscall                                     # print output_msg on the console

    move    $a0, $t0                            # a0 = det(A)
    la      $v0, 1                              # Loads value 1 in $v0, 1 is the system call code for printing an integer to console
    syscall                                     # print det(A) on the console

    li      $v0, 4                              # Loads value 4 in $v0, 4 is the system call code for printing a string to console
    la      $a0, newline                        # Loads address of newline in a0
    syscall                                     # print newline on the console

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
    addi    $sp, $sp, 4                         # increment stack pointer by 4
    jr      $ra                                 # jump to return address


# Function to allocate memory for n * n integers on stack
mallocInStack:
    sll     $t0, $a0, 2                         # $t0 = $a0 * 4 = 4*n*n
    addi    $v0, $sp, -4                        # store beginning address in $v0, so that we can return this value
    sub     $sp, $sp, $t0                       # Decrement stack pointer to allocate memory for 4*n*n bytes
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
    move    $t0, $ra                            # $t0 = $ra
    jal     pushToStack                         # push $a0(n) to stack
    move    $a0, $a1                            # $a0 = $a1, $a1 stores address of first element of matrix A
    jal     pushToStack                         # push $a0 to stack
    move    $a0, $t0                            # $a0 = $t0, $t0 stores return address($ra)
    jal     pushToStack                         # push $a0 to stack
    li      $t0, 1                              # $t0 = 1
    lw      $t1, 8($sp)                         # $t1 = n as ($sp - 8) stores address of n
    bne     $t0, $t1, not_equal1                # check if n != 1, if n != 1 jump to not_equal1

    # base case
    lw      $v0, 0($a1)                         # $v0 = A[0][0], $a1 stores address of first element of matrix A 
    lw      $ra, 0($sp)                         # restore return address from stack
    addi    $sp, $sp, 12                        # pop 3 elements from stack
    jr      $ra                                 # jump to ra

not_equal1:
   
    li      $v0, 0                              # stores determinant value, initialized to det(A) = 0
    move    $a0, $v0                            # $a0 = $v0
    jal     pushToStack                         # push $a0 to stack
    li      $t0, 1                              # stores sign, initialized to 1
    move    $a0, $t0                            # $a0 = $t0
    jal     pushToStack                         # push $a0(currently stores sign) to stack
    lw      $t2, 16($sp)                        # $t2 stores n
    li      $t0, 0                              # $t0 stores loop_counter, initialized to 0

loopDet: 
    beq     $t0, $t2, end_loop                  # check if j == n, if yes exit from loop and jump to end_loop
    move    $t6, $t0                            # $t6 stores j
    move    $a0, $t0                            # $a0 = $t0, $t0 stores loop counter j
    jal     pushToStack                         # pust $a0 (currently stores loop counter) to stack

    lw      $t7, 16($sp)                        # $t7 stores address of 1st element of A
    move    $t1, $t2                            # store n' in $t1
    addi    $t1, $t1,-1                         # $t1 = n' = n-1
    mul     $t1, $t1, $t1                       # $t1 = $t1 * $t1 (i.e., $t1 = (n')*(n') where n' = n-1)
    # allocate memory on stack
    move    $a0, $t1                            # $a0 = (n')*(n')
    jal     mallocInStack                       # call mallocInStack with $a0 as argument
    # populate matrix A'(cofactor matrix)
    move    $t0, $t2                            # $t0 store n
    move    $t1, $v0                            # $t1 stores address of 1st element of A'
    li      $t2, 1                              # stores row
    li      $t3, 0                              # stores col
    li      $t8, -4                             # $t8 = -4 
    mul     $t8, $t8, $t0                       # $t8 = -4*n
    add     $t7, $t7, $t8                       # $t7 points to 1st element of 2nd row in matrix A
    # $t6 stores col to be skipped

outer_fillA:
    beq     $t2, $t0, end_ofillA                # check row == n, if yes, end outer loop of fill A
    move    $t3, $zero                          # col = 0

inner_fillA:
    beq     $t3, $t0, end_ifillA                # check if col == n, if yes, end inner loop of fill A(i.e., end_ifillA)
    beq     $t6, $t3, increment_col             # if col == j, jump to increment col(i.e., increment_col)
    lw      $t4, 0($t7)                         # $t4 = A[row][col]
    sw      $t4, 0($t1)                         # A'[i][j] = A[row][col]
    addi    $t1, $t1, -4                        # $t1 = $t1 - 4
    addi    $t7, $t7, -4                        # $t7 = $t7 - 4
    addi    $t3, $t3, 1                         # $t3 = $t3 + 3, increment col
    j       inner_fillA                         # unconditional jump to inner_fillA

increment_col:
    addi    $t3, $t3, 1                         # $t3 = $t3  + 1, increment col
    addi    $t7, $t7, -4                        # $t7 = A[row][col+1]
    j       inner_fillA                         # unconditional jump to inner_fillA

end_ifillA:
    addi    $t2, $t2, 1                         # $t2 = $t2 + 1, increment row
    j       outer_fillA                         # unconditional jump to outer_fillA

end_ofillA:
    addi    $t0, $t0, -1                        # $t0 = n-1
    move    $a0, $t0                            # $a0 = $t0, $a0 stores n-1
    jal     pushToStack                         # push $a0 to stack
    move    $a0, $t0                            # $a0 = n-1 as $t0 stores n-1
    move    $a1, $v0                            # $a1 stores address of 1st element of cofactor matrix A'
    jal     recursive_Det                       # call the recursive_Det function with $a0, $a1 as arguments

    lw      $t2, 0($sp)                         # $t2 stores n-1
    move    $t0, $t2                            # $t0 = n-1
    mul     $t0, $t0, $t0                       # $t0 stores (n-1)*(n-1)
    jal     popFromStack                        # pop top element (i.e., n-1) from stack
    sll     $t0, $t0, 2                         # $t0 = 4*(n-1)*(n-1)
    add     $sp, $sp, $t0                       # pop matrix A' from stack
    lw      $t0, 0($sp)                         # load loop counter back in $t0
    jal     popFromStack                        # pop loop counter from stack
    lw      $t1, 0($sp)                         # load sign from stack
    jal     popFromStack                        # pop sign from stack

    lw      $t3, 0($sp)                         # load current value of det from loop
    jal     popFromStack                        # pop current value of det from stack
    mul     $t4, $v0, $t1                       # $t4 = recursiveDet(A', n-1)*sign
    lw      $t5, 4($sp)                         # load address of 1st element of A in $t5
    move    $t6, $t0                            # $t6 = j(loop counter)
    li      $t8, -4                             # $t8 = -4
    mul     $t6, $t6, $t8                       # $t6 = -4*j
    add     $t5, $t5, $t6                       # $t5 now stores address of jth element of 1st row
    lw      $t5, 0($t5)                         # $t5 stores jth element of 1st row
    mul     $t4, $t4, $t5                       # $t4 = recursiveDet(A', n-1) * sign * A[0][j]
    add     $t4, $t4, $t3                       # $t4 = $t4 + $t3, equivalent to so_far_Det(A) += $t4
    move    $a0, $t4                            # $a0 = so_far_Det(A)
    jal     pushToStack                         # push $a0(so_far_Det(A)) to stack
    
    li      $t8, -1                             # $t8 = -1
    mul     $t1, $t1, $t8                       # sign = -sign
    move    $a0, $t1                            # $a0 = -sign
    jal     pushToStack                         # push $a0(sign) to stack
    
    addi    $t2, $t2, 1                         # $t2 = n
    addi    $t0, $t0, 1                         # $t0 = j+1
    j       loopDet                             # unconditional jump to loopDet

end_loop:
    jal     popFromStack                        # pop sign from stack
    lw      $v0, 0($sp)                         # $v0 = Det(A)
    jal     popFromStack                        # pop determinant value from stack
    lw      $ra, 0($sp)                         # restore return address
    addi    $sp, $sp, 12                        # pop 3 elements from stack
    jr      $ra                                 # jump to return address

m_ezero:
    li      $v0, 4                              # Loads value 4 in $v0, 4 is the system call code for printing a string to console
    la      $a0, m_lezero_msg                   # Loads address of m_lezero_msg in a0
    syscall                                     # print m_ezero_msg on the console
    j       exit                                # unconditional jump to exit

n_lezero:
    li      $v0, 4                              # Loads value 4 in $v0, 4 is the system call code for printing a string to console
    la      $a0, n_lezero_msg                   # Loads address of n_lezero_msg in a0
    syscall                                     # print n_lezero_msg on the console
    j       exit                                # unconditional jump to exit

exit:
    li      $v0, 10                         
    syscall                                     # syscall for exit
    