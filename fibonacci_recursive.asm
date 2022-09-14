.data
	askForNumber: .asciiz "Entre com um numero entre 0 e 20: "
	init: .word 1 # utilizado como constante do loop. Define de qual número o fibonacci iniciará
	space: .asciiz " "
	
.text	
	li $v0, 4 # define serviço de impressão de textos
	la $a0, askForNumber # armazena endereço que contém o texto
	syscall # executa
	
	li $v0, 5 # define serviço de leitura de inteiros
	syscall # executa
	
	move $t1, $v0 # armazena valor em $t1 para liberar registrador $v0
	lw $t2, init # armazena no registrador $t2 o valor da palavra init. Funcinará como contador do loop

loop:
	bgt $t2, $t1, fim_loop # se contador $t2 for maior que o valor em $t1 (valor recebido pelo usuário) salta para fim_loop
	
	move $a0, $t2 # armazena valor de $t2 (contador) em $a0 para ser utilizado no fibonacci
	
	jal fibonacci # salta para fibonacci e retorna nesse ponto
	
	move $a0, $v0 # valor retornado do fibonacci está em $v0, guarda-o em $a0 para impressão
	li $v0, 1 # define serviço de impressão de inteiros
	syscall # executa
	
	li $v0, 4 # define serviço de impressão de textos
	la $a0, space # armazena endereço que contém o texto
	syscall # executa
	
	addi $t2, $t2, 1 # incrementa o contador $t2 em +1
	j loop # salta para loop novamente
	
fim_loop:
	li $v0, 10 # define serviço de saída do sistema
	syscall # executa

fibonacci:
	ble $a0, 1, return # se valor em $a0 for menor ou igual a 1, salta para return
	move $s0, $a0 # move valor  em $a0 para $s0 afim de evitar sobescrita
	subi $sp, $sp, 4 # caminha no endereço do $sp para evitar sobescrita na recursão
	sw $ra, 0($sp) # armazena endereço atual na posição 0 do $sp
	subi $a0, $a0, 1 # subtrai 1 de $a0 - fib(n-1)
	subi $sp, $sp, 4 # subtrai no endereço do $sp para evitar sobescrita
	sw $a0, 0($sp) # armazena valor atual de $a0
	jal fibonacci # chama fibonacci novamente para checar se atingiu o caso base
	lw $a0, 0($sp) # nesse ponto, atingiu-se todos os fib(n-1) recursivos, então restaura valor original de $a0
	subi  $a0, $a0, 1 # por causa das chamadas recursivas, $a0 já perdeu -1 em seu valor, retira apenas mais 1 - fib(n-2)
	
	sw $v0, 0($sp) # salva valor do retorno de fib(n-1) para uso posterior
	jal fibonacci # chama fibonacci novamente para checar se atingiu o caso base. Nesse caso para o fib(n-2)
	lw $t0, 0($sp) # nesse ponto, atingiu-se todos os fib(n-2) recursivos, então restaura o valor de fib(n-1)
	add $v0, $v0, $t0 # adiciona a $v0, que contém fib(n-2), o valor de fib(n-1)
	
	addi $sp, $sp, 4 # caminha no $sp para atingir posição ideal para retorno
	lw $ra, 0($sp) # restaura o endereço original para retorno)
	addi $sp, $sp, 4 # zera $sp
	jr $ra # retorna para ponto da chamada inicial do fibonacci
	
return:
	move $v0, $a0 # armazena valor em $a0 (sempre valores menores que 1) em $v0 para impressão na saída do fibonacci
	jr $ra # salta para endereço em $ra (volta 
