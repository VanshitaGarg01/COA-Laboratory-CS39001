# Assignment No. - 4
# Problem No. - 2 (Recursive sort)
# Semester - 5 (Autumn 2021-22)
# Group No. - 30
# Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)

# Data Segment
    .data
array_prompt:                                           # Prompt for array input
    .asciiz "Enter 10 integers (each integer on a new line):\n"
sorted_msg:                                             # Display message for printing the sorted array
    .asciiz "\nSorted array: "
whitespace:                                             # Whitespace character
    .asciiz " "
newline:                                                # Newline character
    .asciiz "\n"

array:                                      # allocate space for 10 integers (10 * 4 = 40 bytes)
    .align 2
    .space 40

# Code Segment
    .text
    .globl main

main:
    jal     initStack                       # call initStack to set up stack and frame pointer

    li      $v0, 4
    la      $a0, array_prompt
    syscall                                 # print array_prompt on the console

    la      $t0, array                      # load address of array in $t0
    li      $t1, 0                          # i = 0, loop variable for taking array input
    li      $t2, 10                         # n = 10, number of elements in the array

# Read the numbers of the array as input
read_loop:
    bge     $t1, $t2, call_sort             # if i >= n, exit the loop and jump to call_sort
    li      $v0, 5
    syscall                                 # read an integer
    sw      $v0, 0($t0)                     # store the integer in the appropriate location in the array
    addi    $t0, 4                          # increment $t0 by 4 to point to the next location in the array
    addi    $t1, 1                          # i = i + 1
    j       read_loop                       # jump to read_loop (continue the loop)

call_sort:
    la      $a0, array                      # load address of first element of array into $a0
    li      $a1, 0                          # $a1 = 0 (initial value of left)
    li      $a2, 9                          # $a2 = 9 (initial value of right)
    jal     recursive_sort                  # call the function recursive_sort with $a0, $a1 and $a2 as arguments

display:
    li      $v0, 4
    la      $a0, sorted_msg
    syscall                                 # print sorted_msg on the console

    la      $a0, array                      # $a0 = address of first element of array
    li      $a1, 10                         # $a1 = size of array = 10
    jal     printArray                      # call function printArray with $a0 and $a1 as arguments

free_stack: 
    move    $sp, $fp                        # before ending the program, restore the stack pointer
    j       exit                            # unconditional jump to exit


# Recursive procedure to sort an array
# Input Arguments:
# $a0 = start address of array, $a1 = start index, $a2 = end index
# $s0 stores the value of l, and $s1 stores the value of r for the current function execution
# Variables in stack:
# $s1 is saved in 0($sp)
# $s0 is saved in 4($sp)
# $ra is saved in 8($sp)
# right is saved in 12($sp)
# left is saved in 16($sp)
# A is saved in 20($sp)
# Note that p = left always, so we do not use any extra register for p
recursive_sort:
    move    $t0, $ra                        # $t0 = $ra
    jal     pushToStack                     # $a0 (address of A) is already in $a0, so push to stack
    move    $a0, $a1
    jal     pushToStack                     # push $a1 (left) to stack
    move    $a0, $a2
    jal     pushToStack                     # push $a2 (right) to stack
    move    $a0, $t0
    jal     pushToStack                     # push $t0 = original $ra to stack
    move    $a0, $s0
    jal     pushToStack                     # save $s0 in stack
    move    $a0, $s1
    jal     pushToStack                     # save $s1 in stack

    lw      $s0, 16($sp)                    # l = left ($s0 stores l)
    lw      $s1, 12($sp)                    # r = right ($s1 stores r)

outer_while:
    blt     $s0, $s1, inner_while_1         # if l < r, jump to inner_while_1
    j       return                          # jump to return

inner_while_1:
    lw      $t0, 12($sp)                    # $t0 = right
    bge     $s0, $t0, inner_while_2         # if l >= right,then jump to inner_while_2

    lw      $t0, 20($sp)                    # $t0 = address of A

    sll     $t1, $s0, 2                     # $t1 = 4 * l
    add     $t1, $t0, $t1                   # $t1 = A + 4*l
    lw      $t2, 0($t1)                     # $t2 = A[l]

    lw      $t1, 16($sp)                    # $t1 = p = left
    sll     $t1, $t1, 2                     # $t1 = 4 * p
    add     $t1, $t0, $t1                   # $t1 = A + 4*p
    lw      $t3, 0($t1)                     # $t3 = A[p]

    bgt     $t2, $t3, inner_while_2         # if A[l] > A[p], then jump to inner_while_2

    addi    $s0, $s0, 1                     # l++
    j       inner_while_1                   # continue inner_while_1 loop

inner_while_2:
    lw      $t0, 16($sp)                    # $t0 = right
    ble     $s1, $t0, recurse               # if r <= left, then jump to recurse

    lw      $t0, 20($sp)                    # $t0 = address of A

    sll     $t1, $s1, 2                     # $t1 = 4 * r
    add     $t1, $t0, $t1                   # $t1 = A + 4*r
    lw      $t2, 0($t1)                     # $t2 = A[r]

    lw      $t1, 16($sp)                    # $t1 = p = left
    sll     $t1, $t1, 2                     # $t1 = 4 * p
    add     $t1, $t0, $t1                   # $t1 = A + 4*p
    lw      $t3, 0($t1)                     # $t3 = A[p]

    blt     $t2, $t3, recurse               # if A[r] < A[p], then jump to recurse

    addi    $s1, $s1, -1                    # r--
    j       inner_while_2                   # continue inner_while_2 loop

recurse:
    blt     $s0, $s1, swap_lr               # if l < r, jump to swap_lr
    lw      $t0, 20($sp)                    # $t0 = address of A

    lw      $t1, 16($sp)                    # p = left
    sll     $t1, $t1, 2                     # $t1 = 4 * p
    add     $a0, $t0, $t1                   # $a0 = address of A[p]

    sll     $t1, $s1, 2                     # $t1 = 4 * r
    add     $a1, $t0, $t1                   # $a1 = address of A[r]

    jal     swap                            # call the swap function with $a0 and $a1 as arguments, swap(A[p], A[r])

    lw      $a0, 20($sp)                    # $a0 = address of A
    lw      $a1, 16($sp)                    # $a1 = left
    addi    $a2, $s1, -1                    # $a2 = r - 1
    jal     recursive_sort                  # call recursive_sort(A, left, r - 1)

    lw      $a0, 20($sp)                    # $a0 = address of A
    addi    $a1, $s1, 1                     # $a1 = r + 1
    lw      $a2, 12($sp)                    # $a2 = right
    jal     recursive_sort                  # call recursive_sort(A, r + 1, right)

    j       return                          # jump to return

swap_lr:
    lw      $t0, 20($sp)                    # $t0 = address of A

    sll     $t1, $s0, 2                     # $t1 = 4 * l
    add     $a0, $t0, $t1                   # $a0 = address of A[l]

    sll     $t1, $s1, 2                     # $t1 = 4 * r
    add     $a1, $t0, $t1                   # $a1 = address of A[r]

    jal     swap                            # call the swap function with $a0 and $a1 as arguments, swap(A[l], A[r])
    j       outer_while                     # jump to the outer_while loop

return:
    lw      $ra, 8($sp)                     # retrieve value of $ra from stack
    lw      $s0, 4($sp)                     # restore value of $s0
    lw      $s1, 0($sp)                     # restore value of $1
    addi    $sp, $sp, 24                    # restore stack pointer
    jr      $ra                             # jump to return address


# Function to initialise the stack and frame pointers
initStack:
    addi    $sp, $sp, -4                    # Decrement stack pointer by 4
    sw      $fp, 0($sp)                     # Store $fp in stack
    move    $fp, $sp                        # Make $fp point to current stack top before program execution
    jr      $ra                             # jump to return address


# Function to push an element (in $a0) to the stack
pushToStack:
    addi    $sp, $sp, -4                    # Decrement stack pointer by 4
    sw      $a0, 0($sp)                     # Store $a0 in stack
    jr      $ra                             # jump to return address


# Function to swap 2 array elements whose addresses are in $a0 and $a1
swap:
    lw      $t0, 0($a0)                     # $t0 = array element with address $a0
    lw      $t1, 0($a1)                     # $t1 = array element with address $a1
    sw      $t1, 0($a0)                     # updates value of array element at address $a0
    sw      $t0, 0($a1)                     # updates value of array element at address $a1
    jr      $ra                             # jump to return address


# Function to print an array, $a0 = array address, $a1 = size of array 
printArray:
    move    $t0, $a0                        # $t0 = address of array
    move    $t1, $a1                        # $t1 = n = size of array
    li      $t2, 0                          # i = 0

print_loop:
    bge     $t2, $t1, exit_print_loop       # if i >= n, jump to exit_print_loop
    li      $v0, 1
    lw      $a0, 0($t0)                     # load the element from array
    syscall                                 # print the element
    li      $v0, 4
    la      $a0, whitespace                 
    syscall                                 # print a space
    addi    $t0, 4                          # make $t0 point to the next array element
    addi    $t2, 1                          # i = i + 1
    j       print_loop                      # continue the loop

exit_print_loop:
    li      $v0, 4
    la      $a0, newline
    syscall                                 # print a newline
    jr      $ra                             # jump to the return address


exit:
    li      $v0, 10                         
    syscall                                 # syscall for exit
