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

	# incrementar o valor da variavel
	addi $t0, $t0, 1
	beq $t0, $t1, fimLoop
	b loop
fimLoop: