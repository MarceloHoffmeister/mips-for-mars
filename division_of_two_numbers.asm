.data

input1: .asciiz "insert first number: "
input2: .asciiz "insert seconde number: "
quociente: .asciiz "quotient: "
resto: .asciiz "rest: "

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

# division operation
div $s0, $s1   # quotient and rest
mflo $s2  # quotient
mfhi $s3  # rest

# print result
li $v0, 4
la $a0, quociente
syscall

li $v0, 1
move $a0, $s2
syscall

li $v0, 4
la $a0, resto
syscall

li $v0, 1
move $a0, $s3
syscall
