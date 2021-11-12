main:
    xor $20, $20        # base address of array = 4 ($20)
    addi $20, 4
    xor $21, $21
    addi $21, 10        # $21 = n = 10
    xor $8, $8          # $8 = i = 0
    lw $9, -4($20)      # $9 = elem

fori:
    xor $10, $10        # label 6*4
    add $10, $8
    comp $11, $21
    add $10, $11        # $10 = i - n
    bz $10, notFound

    xor $12, $12
    add $12, $8
    shll $12, 2         # 4 * i
    add $12, $20        # arr + 4 * i
    lw $13, 0($12)      # $13 = arr[i]

    xor $14, $14
    comp $15, $13
    add $14, $9
    add $14, $15        # key - arr[i]
    bz $14, found

    addi $8, 1
    b fori

found: 
    xor $19, $19
    add $19, $8
    b exit

notFound:
    xor $19, $19
    addi $19, -1

exit:
    xor $16, $16
    addi $16, 1         # to indicate completion
