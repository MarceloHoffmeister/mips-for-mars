#
# Código com erro de implementação ...
#
# Este código deve calcular A*X + B
# para N valores de X

# A e B estão em $a1 e $a2, respectivamente
# os valores X e N estão no segmento de dados
#
	
	.text
principal:	
	li $a1, 3
	li $a2, 4
	la $t0, N
	la $t1, X
	lw $t2, 0($t0)

	xor $t3, $t3, $t3
	xor $t4, $t4, $t4

loop:	addi $t2, $t2, -1
	blez $t2, exit
	lw $t3, 0($t1)
	mul $t3, $a1, $t3
	add $t3, $a2, $t3
 
        li $v0, 4
        la $a0, MessagemSaida
        syscall
        li $v0, 1
        add $a0, $0, $t3
        syscall
        li $v0, 4
        la $a0, novaLinha
        syscall

	add $t1, $t1, 1
	j loop

saida:	
	jr $ra

	.data

N:	.word 4
X:	.word 12, 14, 16, 18
	 
MessagemSaida:
	.asciiz	"\n Resultado = "
novaLinha:
	.asciiz "\n\n"
