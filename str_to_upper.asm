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

# macro utilizado para quebrar conteúdo
# em uma nova linha
.macro breakLine()
	print("\n")
.end_macro

# macro utilizada para ler textos e armazenar
# em um registrador passado como argumento
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

# macro utilizada para imprimir caracteres
# a partir do registrador passado como argumento
.macro printChar(%reg)
	li $v0, 11
	la $a0, (%reg)
	syscall
.end_macro

# converte caracteres minúsculas
# para maiúsculas, com exceção de símbolos
.macro str_to_upper(%reg)
	.text
		li $t0, 0 # registrador contador para iteração do texto
		
		loop:			
			add $t1, %reg, $t0 # registrador $t1 recebe endereço do texto na posição do contador. Ex: $t1 = %str[$t0]
		
			storeCharIn($t2, $t1) # armazena valor do registrador $t1 em $t2
	
			beq $t2, $zero, end_loop # caso $t2 seja igual a zero, chegou no fim do texto, sai do loop
		
			lowerLettersToUpper($t2) # convert letra minúsculas em maiúsculas
			
			printChar($t2) # imprime caracteres, convertidos ou não
		
			j loop_again # salta para inicio do loop, verificando se é o fim do texto
	
		loop_again:
			addi $t0, $t0, 1 # adiciona +1 no contador do loop
			j loop # salta para inicio do loop, verificando se é o fim do texto
		
		end_loop: # fim do loop. Fim da macro
.end_macro

# macro utilizada para guardar valor de um endereço
# em um outro registrador, de forma a tratar esse valor
.macro storeCharIn(%reg, %char)
	lb %reg, 0(%char) # $t2 recebe valor do endereço (letra/caractere)
.end_macro

# macro utilizada para converter letra minúsculas em maiúsculas
.macro lowerLettersToUpper(%char)
	bleu %char, 'a', return # caso a letra seja menor que 'a', retorna (compara tabela ASCII)
	bgeu %char, 'z', return # caso a letra seja maio que 'z', retorna (compara tabela ASCII)
	
	sub %char, %char, 32 # se estiver dentro desse intervalo (entre 'a' e 'z'), converte a letra subtraindo 32 posições na tabela ASCII
	
	return: # retorno
.end_macro

main:
	print("Digite o texto (limite de 100 caracteres): ")
	
	readTextIn($s1) # lê e armazena texto digitado no registrador $s1
	
	breakLine()

	print("Texto convertido: ")
		
	str_to_upper($s1) # converte texto, caractere por caractere
	
	breakLine()