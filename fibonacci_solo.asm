	li $a0, 6 # armazena 2 em $a0
	
	jal fibonacci # salta para o fibonnaci
	
	move $a0, $v0
	li $v0, 1 # chama serviço de impressão de inteiros
	syscall # executa
	
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
