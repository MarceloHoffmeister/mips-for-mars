.data
	pergunta: .asciiz "Qual é o seu nome? "
	saudacao: .asciiz "Olá, "
	nome: .space 25
.text
	## impressao de pergunta
	li $v0, 4
	la $a0, pergunta
	syscall
	
	## leitura do nome
	li $v0, 8
	la $a0, nome
	la $a1, 25
	syscall
	
	## impressao da saudacao
	li $v0, 4
	la $a0, saudacao
	syscall
	
	li $v0, 4
	la $a0, nome
	syscall
	