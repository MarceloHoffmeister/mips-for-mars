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

# macro utilizada para ler textos e armazenar
# em um registrador passado como argumenot
.macro readTextIn(%reg)
	.data
		texto: .space 32 # declara o tamanho máximo do texto
		
	.text
		li $v0, 8
		la $a0, texto # declara em $a0 o endereço onde o texto será amazenado
		la $a1, 32 # declara o tamanho do texto máximo no registrador $a1
		syscall
		
		la %reg, texto # carrega endereço do texto no registrado recebido como argumento
.end_macro

main:
	print("Entre com o numero binario: ")
	
	readTextIn($s0) # lê o binário
	
	li $t0, 0 # armazena posição inicial do contador do loop
	
	loop:
		add $t1, $s0, $t0 # manda para $t1 o endereço de $s0. $t1 = $s0[$t0]
		
		lb $s1, 0($t1) # carrega o valor do endereço
	
		beq $s1, $zero, end_loop # caso seja o final da palavra, encerra loop
		
		beq $s1, '1', count # verifica se o valor armazenado no passo anterior é igual a 1, se sim, salta para count
		
		addi $t0, $t0, 1 # contado ou não, itera o valor do contador para a próxima iteração
		
		j loop # salta para o início do loop
		
	count:
		addi $s2, $s2, 1 # adiciona +1 ao contador de 1's
		
		addi $t0, $t0, 1 # itera o valor do contador para a próxima iteração
		
		j loop # salta para o início do loop
	
	end_loop:
		li $v0, 1 # carrega o serviço de impressão de inteiros
		move $a0, $s2 # carrega o valor do contador de 1's em $a0
		syscall
	
	
	
