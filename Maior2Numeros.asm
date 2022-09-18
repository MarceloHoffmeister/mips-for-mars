.data
	messagem1: .asciiz "Insere o primero numero "
	messagem2: .asciiz "Insere o segundo numero "
	resultado1: .asciiz "Numero 1 é maior que Numero2 "
	resultado2: .asciiz "Numero 2 é maior que Numero1 "
	
.text
	## leitura do primeiro numero
	li $v0, 4
	la $a0, messagem1
	syscall
	
	li $v0, 5
	syscall
	move $v0, $t1

	## leitura do segundo numero
	li $v0, 4
	la $a0, messagem2
	syscall
	
	li $v0, 5
	syscall
	move $v0, $t2
	
	bgt $t1, $t2, sim
	
	## Imprimir o resultado
	li $v0, 4
	la $a0, resultado2
	syscall
	b fim
sim:
	## Imprimir o resultado
	li $v0, 4
	la $a0, resultado1
	syscall
fim:
	