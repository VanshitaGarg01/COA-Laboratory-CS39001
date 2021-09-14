# Assignment No. - 3
# Problem No. - 1 (Booth's multiplication algorithm)
# Semester - 5 (Autumn 2021-22)
# Group No. - 30
# Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)

# Data Segment
    .data
prompt1:                                                                # Prompt for 1st Integer Input 
    .asciiz "Enter first number: "            
prompt2:                                                                # Prompt for 2nd Integer Input
    .asciiz "Enter second number: "
error1:                                                                 # Error message
    .asciiz "Error, number should fit in a 16-bit signed integer.\n"
output:                                                                 # Display Message for output
    .asciiz "Product of the two numbers is: "
newline:                                                                # Newline Character
    .asciiz "\n"

# Code Segment starts 

    .text
    .globl main

# For the main function,
# $s0 stores a
# $s1 stores b
# $t0 stores lower bound of 16-bit signed number
# $t1 stores upper bound of 16-bit signed number

main:
    li      $t0, -32768                             # lower bound of 16-bit signed number
    li      $t1, 32767                              # upper bound of 16-bit signed number

# Ask user to input 1st integer a.
    la      $a0, prompt1                            # Loads address of prompt1 in a0
    li      $v0, 4                                  # Loads value 4 in $v0, 4 is the system call code for printing a string to console
    syscall                                         # prints message prompt1 on the console

input_a:
    li      $v0, 5                                  # Loads value 5 in $v0, 5 is the system call code to read an integer from console
    syscall                                         # reads an integer from the console, stores in $v0
    move    $s0, $v0                                # $v0 stores the input integer a, here a is moved to $s0
    blt     $s0, $t0, error_a                       # checks if a < -32768, if yes, jumps to error_a
    blt     $t1, $s0, error_a                       # checks if a > 32767, if yes, jumps to error_a
    j       enter_b                                 # unconditional jump to enter_b

error_a:
    la      $a0, error1                             # Loads address of error1 in a0
    li      $v0, 4                                  # Loads value 4 in $v0, 4 is the system call code for printing a string to console
    syscall     
    j       exit

# Ask user to input 2nd integer b.
enter_b:
    la      $a0, prompt2                            # Loads address of prompt2 in a0
    li      $v0, 4                                  # Loads value 4 in $v0, 4 is the system call code for printing a string to console
    syscall                                         # prints message prompt2 on the console

input_b:
    li      $v0, 5                                  # Loads value 5 in $v0, 5 is the system call code to read an integer from console
    syscall                                         # reads an integer from the console, stores in $v0
    move    $s1, $v0                                # $v0 stores the input integer b, here b is moved to $s1
    blt     $s1, $t0, error_b                       # checks if b < -32768, if yes, jumps to error_b
    blt     $t1, $s1, error_b                       # checks if b > 32767, if yes, jumps to error_b
    j       call_multiply_booth                     # unconditional jump to call_multiply_booth

error_b:
    la      $a0, error1                             # Loads address of error1 in a0
    li      $v0, 4                                  # Loads value 4 in $v0, 4 is the system call code for printing a string to console
    syscall     
    j       exit

call_multiply_booth:
    move    $a0, $s0                                # $a0 stores a and is the 1st arguement to procedue multiply_booth 
    move    $a1, $s1                                # $a1 stores b and is the 2nd arguement to procedue multiply_booth
    jal     multiply_booth

print_product:
    move    $s0, $v0                                # $s0 now stores multiplication result as $s0 = $v0 and $v0 stores the return value of multiply_booth
    
    la      $a0, output                             # Loads address of output in a0
    li      $v0, 4                                  # Loads value 4 in $v0, 4 is the system call code for printing a string to console
    syscall    

    move    $a0, $s0                                # copies $t2 to $a0, $t2 stores the multiplication result of a and b
    li      $v0, 1                                  # Loads value 1 in $v0, 1 is the system call code for printing an integer to console
    syscall

    la      $a0, newline                            # Loads address of newline in a0
    li      $v0, 4                                  # Loads value 4 in $v0, 4 is the system call code for printing a string to console
    syscall

    j       exit

# Function to multiply two numbers using Booth's algorithm
multiply_booth:
    # if one or both of a or b is zero
    move    $v0, $zero                              # initialize $v0 to 0
    beq     $zero, $a0, exit_multiply_booth         # jump to exit_multiply_booth if a == 0
    beq     $zero, $a1, exit_multiply_booth         # jump to exit_multiply_booth if b == 0

    # ELSE
    # let $a0 be Q (let a be Q)
    # let $a1 be M (let b be M)
    # $t0 stores -M
    # $t1 stores n (Q is an n-bit number)
    # $t2 stores Q0Q-1
    nor     $t0, $a1, $a1                           # $t0 stores ~M
    addi    $t0, $t0, 1                             # $t0 stores -M

    move    $t2, $a0                                # $t2 stores Q
    blt     $zero, $t2, n                           # if Q > 0, jump to n
    nor     $t2, $t2, $t2
    addi    $t2, $t2, 1                             # $t2 stores |Q|

n:
    addi    $t1, $zero, 1                           # $t1 stores n, n initialized to 1

loop1:
    beq     $t2, $zero, break1                      # checks if $t2 == 0, if yes, jumps to break1
    sra     $t2, $t2, 1                             # right shift Q by 1-bit, Q = Q/2
    addi    $t1, $t1, 1                             # $t1 <-- $t1+1, (i.e., n = n+1)
    j       loop1                                   # unconditional jump to loop1

break1: 
    sll     $a1, $a1, $t1                           # left shift M by n bits
    sll     $t0, $t0, $t1                           # left shift -M by n bits
    move    $t2, $zero                              # $t2 is used for storing Q0Q-1
    move    $v0, $a0                                # $v0 stores output, initialized to Q
    move    $t3, $zero
    move    $t4, $t1                                # $t4 stores n($t4 is the loop2 counter)

loop2:
    beq     $t4, $zero, break2
    addi    $t4, $t4, -1                            # $t4 <-- $t4 - 1
    sll     $t3, $t3, 1                             # $t3 <-- ($t3 << 1)            
    addi    $t3, $t3, 1                             # $t3 <-- $t3 + 1
    j       loop2                                   # t3 stores 00000...111(stores 1 in the lower n bits and 0 in the rest)

break2:
    and     $v0, $v0, $t3                           # v0 stores result, now stores 0000...Q(Q in the lower n bits and 0 in the remaining bits)

loop3:
    beq     $t1, $zero, exit_multiply_booth         # check n == 0, if yes, jump to exit_multiply_booth
    addi    $t1, $t1, -1                            # n <-- n-1
    li      $t3, 1                                  # $t3 = 1
    and     $t3, $t3, $v0                           # if LSB of $v0 is 0, $t3 = 0, else $t3 = 1
    sll     $t3, $t3, 1                             # $t3 <-- ($t3 << 1)
    srl     $t2, $t2, 1
    or      $t2, $t2, $t3                           # $t2 stores Q0Q-1

equal0:
    move    $t3, $zero                              # $t3 = 0 
    beq     $t2, $t3, shift_right                   # check if $t2 == 0, if yes, jump to shift_right(00 Case)
    addi    $t3, $t3, 1                             # $t3 <-- $t3 + 1

equal1:
    beq     $t2, $t3, add_m                         # check if $t2 == 1, if yes, jump to add_m(01 Case)
    addi    $t3, $t3, 1                             # $t3 <-- $t3 + 1

equal2:
    beq     $t2, $t3, subtract_m                    # check if $t2 == 2, if yes, jump to subtract_m(10 Case)
    addi    $t3, $t3, 1                             # $t3 <-- $t3 + 1

equal3:
    j       shift_right                             # unconditional jump to shift_right(11 Case)

add_m:
    add     $v0, $v0, $a1                           # $v0 <-- $v0 + $a1     ($a1 stores M)
    j       shift_right                             # unconditional jump to shift_right

subtract_m:
    add     $v0, $v0, $t0                           # $v0 <-- $v0 + $t0     ($t0 stores -M)
    j       shift_right                             # unconditional jump to shift_right

shift_right:
    sra     $v0, $v0, 1                             # $v0 <-- ($v0 >> 1)
    j       loop3                                   # unconditional jump to loop3

exit_multiply_booth:
    jr      $ra                                     # jump to return_multiply_booth
    

exit:
    li      $v0, 10
    syscall                                         # exit
