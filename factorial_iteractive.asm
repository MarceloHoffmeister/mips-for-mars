.data
	askForNumber: .asciiz "Entre com um numero maior que 1: "
	init: .word 1 # utilizado como constante do loop. Define de qual número o fibonacci iniciará
	
.text
	li $v0, 4 # define serviço de impressão de textos
	la $a0, askForNumber # armazena endereço que contém o texto
	syscall # executa
	
	li $v0, 5 # define serviço de leitura de inteiros
	syscall # executa
	
	move $a0, $v0 # armazena valor de $v0 em $a0 para ser utilizado no factorial
	
	jal factorial # salta para factorial e retorna nesse ponto
	
	li $v0, 1 # define serviço de impressão de inteiros
	syscall # executa
	
	li $v0, 10 # define serviço de saída do sistema
	syscall # executa
	
factorial:
	ble $a0, 1, return # se valor em $a0 for menor ou igual a 1, salta para return
	
	lw $t0, init # armazena no registrador $t0 o valor da palavra init. Funcinará como contador do loop
	li $s0, 1 # inicializa $s0 para o caso base
	
loop:
	bgt $t0, $a0, fim_loop # se contador $t0 for maior que o valor em $a0 salta para fim_loop
	
	mul $s0, $s0, $t0 # multiplica valor existente no factorial (inicial 1) com o valor atual do contador - fat = fat * i
	
	addi $t0, $t0, 1 # incrementa o contador em +1
	j loop # salta para loop novamente
	
fim_loop:
	move $a0, $s0 # move o valor resultante do factorial em $s0 para $a0 para impressão
	jr $ra # retorna no último endereço armazena (chamada inicial do factorial)
	
return:
	jr $ra # retorna no último endereço armazena (chamada inicial do factorial)
