.data

input1: .asciiz "insert first number: "
input2: .asciiz "insert seconde number: "
resultado: .asciiz "the result is: "

.text
# read first number
li $v0, 4
la $a0, input1
syscall

li $v0, 5
syscall

move $s0, $v0

# read second number
li $v0, 4
la $a0, input2
syscall

li $v0, 5
syscall

move $s1, $v0

# multiplication operation
mult $s0, $s1
mflo $s2

# print result
li $v0, 4
la $a0, resultado
syscall

li $v0, 1
move $a0, $s2
syscall
