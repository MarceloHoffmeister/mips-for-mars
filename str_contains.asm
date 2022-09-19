# macro para imprimir textos
# diretamente de textos passados como argumentos
.macro print(%message)
	.data
		message: .asciiz %message # é necessário armazenar o texto antes de passá-lo ao registrador
	.text
		li $v0, 4
		la $a0, message
		syscall
.end_macro

# marcro para imprimir inteiros a partir
# de um registrador passado como argumento
.macro printNumberIn(%reg)
	li $v0, 1
	la $a0, (%reg) # é necessário capturar o valor do registro passado
	syscall
.end_macro

# macro utilizado para quebrar conteúdo
# em uma nova linha
.macro breakLine()
	print("\n")
.end_macro

# macro utilizada para ler caracteres
# em um registrador passado como argumento
.macro readCharIn(%reg)
	li $v0, 12
	syscall
	
	move %reg, $v0 # armazena o valor contido em $v0 no registrador recebido
.end_macro

# macro utilizada para ler textos e armazenar
# em um registrador passado como argumenot
.macro readTextIn(%reg)
	.data
		texto: .space 100 # declara o tamanho máximo do texto
		
	.text
		li $v0, 8
		la $a0, texto # declara em $a0 o endereço onde o texto será amazenado
		la $a1, 100 # declara o tamanho do texto máximo no registrador $a1
		syscall
		
		la %reg, texto # carrega endereço do texto no registrado recebido como argumento
.end_macro

# macro criada para calcular as ocorrências
# de um caractere recebido como argumento
# sob um texto também recebido como argumento
# e retornar a contagem em um registrado também recebido como argumento
.macro str_contains(%str, %char, %regForReturn)
	li $t0, 0 # registrador contador para iteração do texto
	
	loop:
		add $t1, %str, $t0 # registrador $t1 recebe endereço do texto na posição do contador. Ex: $t1 = %str[$t0]
		
		lb $t2, 0($t1) # $t2 recebe valor do endereço (letra/caractere)
	
		beq $t2, $zero, end_loop # caso $t2 seja igual a zero, chegou no fim do texto, sai do loop
		
		bne $t2, %char, loop_again # caso $t2 NÃO seja igual ao caractere a ser verificado, chama nova itereação do loop
		
		addi %regForReturn, %regForReturn, 1 # caso #t2 seja sim igual ao caractere, adiciona +1 no registrador escolhido como retorno
		j loop_again # salta para inicio do loop, verificando se é o fim do texto
	
	loop_again:
		addi $t0, $t0, 1 # adiciona +1 no contador do loop
		j loop # salta para inicio do loop, verificando se é o fim do texto
		
	end_loop: # fim do loop. Fim da macro
.end_macro

main:		
	.text
		print("Digite o texto (limite de 100 caracteres): ")
	
		readTextIn($s1) # lê e armazena texto digitado no registrador $s1
	
		breakLine()
	
		print("Digite o caractere a ser procurado no texto: ")
		
		readCharIn($s0) # lê e armazena caractere digitado no registrador $s0
		
		str_contains($s1, $s0, $t3) # calcula ocorrências do caracteres no texto, armazenando a quantidade no registrado $s3
		
		breakLine()
		breakLine()
		
		print("O numero de ocorrencias do caractere na palavra eh: ")
		
		printNumberIn($t3) # imprime quantidade, que foi armazenado no registrado $s3 pelo str_contains()
		
		breakLine()
	
	
