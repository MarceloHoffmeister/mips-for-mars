.text
# Inicializando as variaveis 
li $t0, 0
li $t1, 10
# bucle FOR
loop:
	# imprimir no console
	li $v0, 1
	move $a0, $t0
	syscall

	beq $t0, $t1, fimLoop
	# acrescentar o valor da variavel
	addi $t0, $t0, 1
	b loop
fimLoop:
