.data
	messagem1: .asciiz "Insere um caracter "
	maiuscula: .asciiz "\nO caracter � maiuscula "
	minuscula: .asciiz "\nO caracter � minuscula "
	outro: .asciiz  "\nOutro caso"
	
.text
	## Leitura do caracter
	li $v0, 4
	la $a0, messagem1
	syscall
	
	li $v0, 12
	syscall
	
	## if(ch>=`A` && ch<=`Z`) printf("O caracter � maiuscula")	
	bltu $v0, 'A', proximo1
	bgtu $v0, 'Z', proximo1
	
	## Imprimir o resultado o caracter � maiuscula
	li $v0, 4
	la $a0, maiuscula
	syscall
	b fim
	
proximo1:
	bltu $v0, 'a', proximo2
	bgtu $v0, 'z', proximo2
	
	## Imprimir o resultado o caracter � minuscula
	li $v0, 4
	la $a0, minuscula
	syscall
	b fim
	
proximo2:
	li $v0, 4
	la $a0, outro
	syscall
	
fim: