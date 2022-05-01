.data
r: .word 0 2 5 8 11 -45 23 15 38 12 8 4 96 63 14
numero: .asciiz "insert some number: "
index: .asciiz "insert the index number: "
resultado: .asciiz "result: "
.text
# read number
li $v0, 4
la $a0, numero
syscall

li $v0, 5
syscall

move $s0, $v0

# read index number
li $v0, 4
la $a0, index
syscall

li $v0, 5
syscall

move $s1, $v0

sll $s1, $s1, 2

la $t0, r
add $t1, $t0, $s1

lw $t2, 0($t1)

add $s2, $s0, $t2

li $v0, 4
la $a0, resultado
syscall

li $v0, 1
move $a0, $s2
syscall
