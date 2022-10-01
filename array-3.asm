.data
	myArray: .word 5:10
	novaLinha: .ascii "\n"
.text
principal:
	
	# Limpar $t0 com 0
	addi $t0, $zero, 0
enquanto:
	beq $t0, 40 saida
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