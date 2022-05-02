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
	
	beq $t0, $t1, fimLoop
	# increment variable value
	addi $t0, $t0, 1
	b loop
fimLoop:
