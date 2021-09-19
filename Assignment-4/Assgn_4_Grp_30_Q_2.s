# Assignment No. - 4
# Problem No. - 2 (Recursive sort)
# Semester - 5 (Autumn 2021-22)
# Group No. - 30
# Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)

    .data
array_prompt:                                           # Prompt for array input
    .asciiz "Enter 10 integers: (each integer on a new line)\n"
sorted_msg:                                             # Display message for printing the sorted array
    .asciiz "Sorted array: "
whitespace:                                             # Whitespace character
    .asciiz " "
newline:                                                # Newline character
    .asciiz "\n"

array:                                      # allocate space for 10 integers (10 * 4 = 40 bytes)
    .align 2
    .space 40


    .text
    .globl main

main:
    jal     initStack                           # call initStack to set up stack and frame pointer

    # Read 10 nos in array
    li      $v0, 4
    la      $a0, array_prompt
    syscall                                 # print array_prompt on the console

    la      $t0, array                      # load address of array in $t0
    li      $t1, 0                          # i = 0, loop variable for taking array input
    li      $t2, 10                         # n = 10, number of elements in the array

# Read the numbers of the array as input
read_loop:
    bge     $t1, $t2, call_sort                # if i >= n, exit the loop and jump to call_sort
    li      $v0, 5
    syscall                                 # read an integer
    sw      $v0, 0($t0)                     # store the integer in the appropriate location in the array
    addi    $t0, 4                          # increment $t0 by 4 to point to the next location in the array
    addi    $t1, 1                          # i = i + 1
    j       read_loop                       # jump to read_loop (continue the loop)


call_sort:
    la      $a0, array
    li      $a1, 0
    li      $a2, 9
    jal     recursive_sort

    # la      $t0, array
    # add     $a0, $t0, 4
    # add     $a1, $t0, 8
    # jal     swap

display:
    li      $v0, 4
    la      $a0, sorted_msg
    syscall                                 # print sorted_msg on the console

    la      $a0, array
    li      $a1, 10
    jal     printArray

    j       exit


recursive_sort:
    move    $t0, $ra

    jal     pushToStack                         # $a0 is already in $a0, so push to stack
    move    $a0, $a1
    jal     pushToStack
    move    $a0, $a2
    jal     pushToStack
    move    $a0, $t0
    jal     pushToStack
    move    $a0, $s0
    jal     pushToStack
    move    $a0, $s1
    jal     pushToStack


    li		$v0, 1		# system call #1 - print int
    move		$a0, $a1
    syscall				# execute

    li		$v0, 4		# system call #4 - print string
    la		$a0, whitespace
    syscall				# execute

    li		$v0, 1		# system call #1 - print int
    move		$a0, $a2
    syscall				# execute

    li		$v0, 4		# system call #4 - print string
    la		$a0, newline
    syscall				# execute



    # lw      $t0, 16($sp)                        # $t0 = address of first element of A
    # move    $t1, $a1                            # l = left
    # move    $t2, $a2                            # r = right
    # move    $t3, $a1                            # p = left
    # sll     $t3, $t3, 2
    # add     $t3, $t0, $t3                       # $t3 = address of A[p]
    # lw      $t4, 0($t3)                         # $t4 = A[p]

    lw      $s0, 16($sp)                        # l = left
    lw      $s1, 12($sp)                        # r = right

outer_while:
    blt     $s0, $s1, inner_while_1               # if l < r, jump to inner_while_1
    lw      $ra, 8($sp)
    lw      $s0, 4($sp)
    lw      $s1, 0($sp)
    addi    $sp, $sp, 24
    jr      $ra

inner_while_1:
    lw      $t0, 12($sp)                         # right
    bge     $s0, $t0, inner_while_2              # if l >= right

    lw      $t0, 20($sp)

    sll     $t1, $s0, 2
    add     $t1, $t0, $t1
    lw      $t2, 0($t1)                         # A[l]

    lw      $t1, 16($sp)                        # p = left
    sll     $t1, $t1, 2
    add     $t1, $t0, $t1
    lw      $t3, 0($t1)                         # A[p]

    bgt     $t2, $t3, inner_while_2

    addi    $s0, $s0, 1
    j       inner_while_1


inner_while_2:
    lw      $t0, 16($sp)                         # left
    ble     $s1, $t0, recurse              # if r >= left

    lw      $t0, 20($sp)

    sll     $t1, $s1, 2
    add     $t1, $t0, $t1
    lw      $t2, 0($t1)                         # A[r]

    lw      $t1, 16($sp)                        # p = left
    sll     $t1, $t1, 2
    add     $t1, $t0, $t1
    lw      $t3, 0($t1)                         # A[p]

    blt     $t2, $t3, recurse

    addi    $s1, $s1, -1
    j       inner_while_2


recurse:
    blt     $s0, $s1, swap_lr
    
    lw      $t0, 20($sp)

    lw      $t1, 16($sp)                        # p = left
    sll     $t1, $t1, 2
    add     $a0, $t0, $t1

    sll     $t1, $s1, 2
    add     $a1, $t0, $t1

    jal     swap

    lw      $a0, 20($sp)
    lw      $a1, 16($sp)
    addi    $a2, $s1, -1
    jal     recursive_sort

    lw      $a0, 20($sp)
    addi    $a1, $s1, 1
    lw      $a2, 12($sp)
    jal     recursive_sort

    lw      $ra, 8($sp)
    lw      $s0, 4($sp)
    lw      $s1, 0($sp)
    addi    $sp, $sp, 24
    jr      $ra


swap_lr:
    lw      $t0, 20($sp)

    sll     $t1, $s0, 2
    add     $a0, $t0, $t1

    sll     $t1, $s1, 2
    add     $a1, $t0, $t1

    jal     swap

    j       outer_while



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


swap:
    lw      $t0, 0($a0)
    lw      $t1, 0($a1)
    sw      $t1, 0($a0)
    sw      $t0, 0($a1)
    jr      $ra


printArray:
    move    $t0, $a0
    move    $t1, $a1
    li      $t2, 0

print_loop:
    bge     $t2, $t1, exit_print_loop                # if i >= n, jump to exit_print_loop
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
