# Assignment No. - 3
# Problem No. - 2 (k-th largest number after sorting using insertion sort)
# Semester - 5 (Autumn 2021-22)
# Group No. - 30
# Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)

# Data Segment
    .data
array_prompt:                                           # Prompt for array input
    .asciiz "Enter 10 integers: (each integer on a new line)\n"
k_prompt:                                               # Prompt for accepting k
    .asciiz "Enter the value of k: "
sorted_msg:                                             # Display message for printing the sorted array
    .asciiz "Sorted array: "
error_msg:                                              # Error message when sanity check fails
    .asciiz "Error, k cannot be greater than n\n"
output_msg:                                             # Display message for output
    .asciiz "k-th largest number is: "
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
    # Read 10 nos in array
    li      $v0, 4
    la      $a0, array_prompt
    syscall                                 # print array_prompt on the console

    la      $t0, array                      # load address of array in $t0
    li      $t1, 0                          # i = 0, loop variable for taking array input
    li      $s0, 10                         # n = 10, number of elements in the array

# Read the numbers of the array as input
read_loop:
    bge     $t1, $s0, read_k                # if i >= n, exit the loop and jump to read_k
    li      $v0, 5
    syscall                                 # read an integer
    sw      $v0, 0($t0)                     # store the integer in the appropriate location in the array
    addi    $t0, 4                          # increment $t0 by 4 to point to the next location in the array
    addi    $t1, 1                          # i = i + 1
    j       read_loop                       # jump to read_loop (continue the loop)

# Read the value of k as input
read_k:
    li      $v0, 4
    la      $a0, k_prompt
    syscall                                 # print k_prompt on the console
    li      $v0, 5
    syscall                                 # read the value of k, gets stored in $v0

call_function:
    move    $s1, $v0                        # store k in $s1
    la      $a0, array                      # load address of array in $a0            
    li      $a1, 10                         # $a1 = 10 (size of array)
    move    $a2, $v0                        # $a2 = $v0 (= k)
    jal     find_k_largest                  # call the function find_k_largest with $a0, $a1 and $a2 as arguments
    move    $t1, $v0                        # store the return value in $t1 (the k-th largest element)

print_result:
    li      $v0, 4
    la      $a0, output_msg                 
    syscall                                 # print output_msg on the console

    li      $v0, 1
    move    $a0, $t1
    syscall                                 # print the k-th largest element

    li      $v0, 4
    la      $a0, newline
    syscall                                 # print newline

    j       exit                            # jump to exit


# Function to find the k-th largest number in the array
# For this function,
# $a0 is address of first element of array
# $a1 is n
# $a2 is k
find_k_largest:
    bgt     $a2, $a1, sanity_fail           # if k > n, sanity check fails
    addi    $sp, $sp, -16                   # we need to save the arguments and return address on the stack, so allocate memory for them
    sw      $a0, 12($sp)                    # save $a0 (address of array) on stack
    sw      $a1, 8($sp)                     # save $a1 (n) on stack
    sw      $a2, 4($sp)                     # save $a2 (k) on stack
    sw      $ra, 0($sp)                     # save $ra on stack

    jal     sort_array                      # call the function sort_array with $a0, $a1 as arguments

    lw      $t0, 12($sp)                    # load address of first element of array in $t0
    sub     $t1, $a1, $a2                   # $t1 = n - k, we want to find array[n - k]
    sll     $t2, $t1, 2                     # $t2 = $t1 * 4
    add     $t2, $t2, $t0                   # $t2 is the address of array[n - k]
    lw      $v0, 0($t2)                     # $v0 = array[n - k]

    lw      $ra, 0($sp)                     # load the return address into $ra
    addi    $sp, $sp, 16                    # restore the stack pointer
    jr      $ra                             # jump to return address


# Function to sort the array
# $t0 stores address of first element of array
# $t1 stores n
# $t2 stores j (outer loop variable)
# $t3 stores i (inner loop variable)
sort_array:
    move    $t0, $a0                        # $t0 = array
    move    $t1, $a1                        # $t1 = n
    li      $t2, 1                          # $t2 = 1

outer_j_loop:
    bge     $t2, $t1, exit_outer            # if j >= n, exit the outer loop
    sll     $t4, $t2, 2                     # $t4 = $t2 * 4
    add     $t4, $t4, $t0                   # $t4 = address of array[j]
    lw      $t5, 0($t4)                     # $t5 =  array[j] (temp)
    addi    $t3, $t2, -1                    # $t3 = $t2 - 1 (equivalent to i = j - 1)

inner_i_loop:
    bltz    $t3, exit_inner                 # if i < 0, exit the inner loop
    sll     $t4, $t3, 2                     # $t4 = $t3 * 4
    add     $t4, $t4, $t0                   # $t4 = address of array[i]
    lw      $t6, 0($t4)                     # $t6 = array[i]
    ble     $t6, $t5, exit_inner            # if array[i] <= temp, exit the inner loop
    addi    $t4, 4                          # $t4 = $t4 + 4, now  $t4 = address of array[i + 1]
    sw      $t6, 0($t4)                     # array[i + 1] = array[i]
    addi    $t3, $t3, -1                    # $t3 = $t3 - 1 (equivalent to i = i - 1)
    j       inner_i_loop                    # continue the inner loop

exit_inner:
    addi    $t3, $t3, 1                     # $t3 now stores i + 1    
    sll     $t4, $t3, 2                     # $t4 = $t3 * 4
    add     $t4, $t4, $t0                   # $t4 = address of array[i + 1]
    sw      $t5, 0($t4)                     # array[i + 1] = temp

    addi    $t2, $t2, 1                     # $t2 = $t2 + 1 (equivalent to j = j + 1)
    j       outer_j_loop                    # continue the outer loop

exit_outer:
    li      $t3, 0                          # set loop variable i = 0

# Now we print the sorted array
print_array:
    li      $v0, 4
    la      $a0, sorted_msg
    syscall                                 # print sorted_msg on the console

print_loop:
    bge     $t3, $t1, return                # if i >= n, jump to return
    li      $v0, 1
    lw      $a0, 0($t0)                     # load the element from array
    syscall                                 # print the element
    li      $v0, 4
    la      $a0, whitespace                 
    syscall                                 # print a space
    addi    $t0, 4                          # make $t0 point to the next array element
    addi    $t3, 1                          # i = i + 1
    j       print_loop                      # continue the loop

return:
    li      $v0, 4
    la      $a0, newline
    syscall                                 # print a newline
    jr      $ra                             # jump to the return address

sanity_fail:
    li      $v0, 4
    la      $a0, error_msg
    syscall                                 # print error_msg on the console


exit:
    li      $v0, 10                         
    syscall                                 # syscall for exit
