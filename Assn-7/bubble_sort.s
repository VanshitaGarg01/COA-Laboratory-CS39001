main:
    xor $20, $20            # base address of array = 0 ($20)
    xor $21, $21
    addi $21, 10            # $21 = n = 10
    xor $8, $8              # $8 = i = 0
    xor $9, $9              # $9 = j = 0

fori:
    xor $10, $10            # label 20
    add $10, $8
    comp $11, $21
    add $10, $11
    addi $10, 1     # $10 = i - (n - 1) = i - n + 1
    bz $10, exitfori
    xor $9, $9

forj:
    xor $11, $11    # label 44
    add $11, $9
    add $11, $10
    bz $11, exitforj    # $11 = j + i - n + 1

    xor $12, $12
    add $12, $9
    shll $12, 2     # 4 * j
    add $12, $20    # arr + 4 * j
    lw $13, 0($12)   # $13 = arr[j] 
    xor $4, $4
    add $4, $12
    addi $12, 4
    lw $14, 0($12)   # $14 = arr[j + 1]
    xor $5, $5
    add $5, $12

    comp $15, $14
    add $13, $15        # arr[j] - arr[j + 1]
    bltz $13, incj      # swap if arr[j] > arr[j + 1]
    bz $13, incj
    bl swap

incj:
    addi $9, 1      # label 30*4
    b forj

swap:
    lw $18, 0($4)   # label 32*4
    lw $19, 0($5)
    sw $18, 0($5)
    sw $19, 0($4)
    br $31

exitforj:
    addi $8, 1      # label 37*4
    b fori

exitfori:
    xor $16, $16        # label 39*4
    addi $16, 1
