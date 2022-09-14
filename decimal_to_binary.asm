.data
	askForNumber: .asciiz "Entre com um numero maior inteiro: "
	bits: .word 31 # limitador do loop (32 bits)
	
.text
	li $v0, 4 # define serviço de impressão de textos
	la $a0, askForNumber # armazena endereço que contém o texto
	syscall # executa
	
	li $v0, 5 # define serviço de leitura de inteiros
	syscall # executa
	
	move $t0, $v0 # armazena valor de $v0 em $t0 para ser utilizado no loop
	
	lw $t1, bits  # armazena limitador do loop (32 bits)
	
loop:
	blt $t1, $zero, fim_loop # se valor em $t1 for menor que zero, salta para fim_loop
	srlv $t2, $t0, $t1 # divide valor em $t0 (entrada do usuário) pelo valor atual em $t1 (contador)
	and $t2, 1 # bitwise valor
	
	li $v0, 1 # define serviço de impressão de inteiros
	move $a0, $t2 # move o valor resultante do loop em $t2 para $a0 para impressão
	syscall # executa
	
	sub $t1, $t1, 1 # subtrai valor do contador em -1
	b loop # salta para loop novamente

fim_loop:
	li $v0, 10 # define serviço de saída do sistema
	syscall # executa
