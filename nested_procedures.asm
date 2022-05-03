.data
	newLine: .asciiz "\n"
.text
	main:
		addi $s0, $zero, 10
		
		jal increaseMyRegister
		
		# Prints a new line
		li $v0, 4
		la $a0, newLine
		syscall
		
		jal printTheValue
		
	# This line is going to signal end of program
	li $v0, 10
	syscall
	
	increaseMyRegister:
		addi $sp, $sp, -8
		sw $s0, 0($sp)
		sw $ra, 4($sp)
		
		addi $s0, $s0, 30
		
		# Nested procedure
		jal printTheValue
		
		lw $s0, 0($sp)
		lw $ra, 4($sp)
		addi $sp, $sp, 8
		
		jr $ra
		
	printTheValue:
		# Print value
		li $v0, 1
		move $a0, $s0
		syscall
		
		jr $ra