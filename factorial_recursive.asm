.data
	startMessage: .asciiz "Digite um número para encontrar seu fatorial: " # texto para indagar o usuário sobre o número
	resultMessage: .ascii "\nO fatorial do número é " # texto para exivir a mensagem final
	exceptionMessage: .ascii "\nEscolha com um número maior do que 1"
	number: .word 0 # inicializa um espaço para o número com zero
	answer: .word 0 # inicializa um espaço para para a resposta final com zero
.text
	main:
		li $v0, 4 # carrega o código do serviço para imprimir texto
		la $a0, startMessage # armazena texto a ser mostrado
		syscall # executa comando armazenado em $v0
		
		li $v0, 5 # carrega o código do serviço para armazenar inteiros
		syscall # executa comando armazenado em $v0
		
		ble $v0, 1, exception
		
		sw $v0, number # guarda o valor lido em $v0 na espaço previamente reservado
		
		lw $a0, number # carrega valor do inteiro no registrador
		jal factorial # chama função factorial
		sw $v0, answer # armazena a resposta em $v0
		
		li $v0, 4 # carrega o código do serviço para imprimir texto
		la $a0, resultMessage # armazena texto a ser mostrado
		syscall # executa comando armazenado em $v0
		
		li $v0, 1 # carrega o código do serviço para imprimir inteiros
		lw $a0, answer # armazena inteiro a ser mostrado
		syscall # executa comando armazenado em $v0
		
		j exit # sai do programa
		
	factorial:
		subu $sp, $sp, 8 # carrega dois espaço na pilha
		sw $ra, ($sp) # armazena o endereço no registrador de retorno
		sw $s0, 4($sp) # armazena o endereço do registrador $s0
		
		li $v0, 1  # carrega o código do serviço para imprimir inteiros
		beq $a0, $zero, done # condicional que vai para função done caso o valor de $a0 seja igual a 0
		
		move $s0, $a0 # move o valor de $a0 para $s0 (se caiu aqui, $a0 não era igual a $zero na última instrução)
		sub $a0, $a0, 1 # diminui 1 do valor de $a0 
		jal factorial # retorna para o início da função factorial
		
		mul $v0, $s0, $v0 # multiplica o valor de $v0 pelo valor de $s0
		
		done:
			lw $ra, ($sp) # carrega o valor de $sp em $ra
			lw $s0, 4($sp) # carrega o valor de 4($sp) em $s0
			addu $sp, $sp, 8 # volta pilha para o início
			jr $ra # retorna para o endereço armazenado
			
	exception:
		li $v0, 4 # carrega o código do serviço para imprimir texto
		la $a0, exceptionMessage # armazena texto a ser mostrado
		syscall # executa comando armazenado em $v0
		
		j exit # sai do programa
		
	exit:
		li $v0, 10 # carrega o código do serviço que finaliza o programa
		syscall # executa comando armazenado em $v0
