.data
	fibs: .word   0 : 21	# "array" de tamanho 21 para armazenar os valores
	size: .word  21		# tamanho do array
	space:.asciiz  " "      # espaço para inserir entre os números
	head: .asciiz  "A sequência é: "
.text
	la   $t0, fibs        # carrega endereço do array
	la   $t5, size        # carrega endeço da variável size
	lw   $t5, 0($t5)      # carrega valor do tamanho do array
      	li   $t2, 1           # 1 é o primeiro e segundo valor da sequência
      	add.d $f0, $f2, $f4
      	sw   $zero, 0($t0)    # F[0] = 0
      	sw   $t2, 4($t0)      # F[1] = 1
      	sw   $t2, 8($t0)      # F[2] = F[0] = 1
      	addi $t1, $t5, -2     # contador do loop, executará (size-2) vezes
      	
loop:
	lw   $t3, 0($t0)      # captura o valor do array F[n] 
      	lw   $t4, 4($t0)      # captura o valor do array F[n+1]
      	add  $t2, $t3, $t4    # $t2 = F[n] + F[n+1]
      	sw   $t2, 8($t0)      # armazena F[n+2] = F[n] + F[n+1] no array
      	addi $t0, $t0, 4      # incrementa endereço do Fibonacci
      	addi $t1, $t1, -1     # decrementa contador
      	bgtz $t1, loop        # rrecebe se ainda não terminou
      	la   $a0, fibs        # primeiro argumento para mostrar (array)
      	add  $a1, $zero, $t5  # segundo argumento para mostrar (size)
      	jal  print            # chama função print 
      	li   $v0, 10          # saída do programa
      	syscall               # executa

print:
	add  $t0, $zero, $a0  # início do endereço do array
      	add  $t1, $zero, $a1  # inicializa contador do array
      	la   $a0, head        # carrega endereço para mostrar a partir do início
      	li   $v0, 4           # carrega serviço de impressão
      	syscall               # executa
out:
	lw   $a0, 0($t0)      # carrega o número
      	li   $v0, 1           # carrega serviço de impressão de inteiros
      	syscall               # executa
      	
      	la   $a0, space       # carrega endereço do espaço para impressão
      	li   $v0, 4           # carrega serviço de impressão
      	syscall               # executa
      	
      	addi $t0, $t0, 4      # incrementa endereço
      	addi $t1, $t1, -1     # decrementa contador do loop
      	bgtz $t1, out         # repita se não terminou
      	jr   $ra              # retorna
