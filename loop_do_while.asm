.text
# initializing variables
li $t0, 0
li $t1, 10
# bucle for
loop:
	# print
	li $v0, 1
	move $a0, $t0
	syscall
	
	# incremente variable value
	addi $t0, $t0, 1
	beq $t0, $t1, fimLoop
	b loop
fimLoop: