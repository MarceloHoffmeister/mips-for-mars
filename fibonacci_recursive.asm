.data
	askForNumber: .asciiz "Entre com um numero entre 0 e 20: "
	init: .word 1
	space: .asciiz " "
	
.text	
	li $v0, 4
	la $a0, askForNumber
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	lw $t2, init

loop:
	bgt $t2, $t1, fim_loop
	
	move $a0, $t2
	
	jal fibonacci
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	addi $t2, $t2, 1
	j loop
	
fim_loop:
	li $v0, 10
	syscall

fibonacci:
	ble $a0, 1, return
	move $s0, $a0
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	subi $a0, $a0, 1
	subi $sp, $sp, 4
	sw $a0, 0($sp)
	jal fibonacci
	lw $a0, 0($sp)
	subi  $a0, $a0, 1
	
	sw $v0, 0($sp)
	jal fibonacci
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $v0, $v0, $t0
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
return:
	move $v0, $a0
	jr $ra
