.data
	myArray: .space 12
	novaLinha: .ascii "\n"
.text
	addi $s0, $zero, 4
	addi $s1, $zero, 10
	addi $s2, $zero, 12
	
	## index = $t0
	addi $t0, $zero, 0
	
	sw $s0, myArray($t0)
	addi $t0, $t0, 4
	sw $s1, myArray($t0)
	addi $t0, $t0, 4
	sw $s2, myArray($t0)
	
	# Limpar $t0 com 0
	addi $t0, $zero, 0
enquanto:
	beq $t0, 12 saida
	lw $t1, myArray($t0)
	
	addi $t0, $t0, 4
	# imprime o valor corrente 
	li $v0, 1
	move $a0, $t1
	syscall
	
	# imprime uma nova linha
	li $v0, 4
	la $a0, novaLinha
	syscall
	
	j enquanto
saida:
	# indique que é o fim do programa
	li $v0, 10
	syscall