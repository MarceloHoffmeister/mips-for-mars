.data
messagem: .asciiz "Insere um numero inteiro "
pos: .asciiz "O numero � positivo "
neg1: .asciiz "O numero � negativo "
zero: .asciiz "O numero � zero "

.text
	## Leitura do numero
	li $v0, 4
	la $a0, messagem
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	## verifica se � positivo negativo ou zero
	bgt $t0, 0, p1
	blt $t0, 0, n1
	
	## Imprime resultado o numero � zero
	li $v0, 4
	la $a0, zero
	syscall
	b fim
	
p1:	li $v0, 4
	la $a0, pos
	syscall
	b fim	
	
n1:	li $v0, 4
	la $a0, neg1
	syscall
	b fim		
fim: