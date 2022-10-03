# armazena 500 espaços em cada "array"
.data
	a: .space 2000
	b: .space 2000
	
.text
	li $t0, 0 # inicializa o contador
	
	loop:
		bgt $t0, 500, endLoop # quando o contador for menor que 500, sai do loop
		
		la $s0, a # captura o endereço de as
		la $s1, b # captura o endereço de b
		
		add $t1, $s0, $t0 # adiciona a $t1 o valor o endereço de $s0 na posição, $t0 - a[$t0]
		lb $t2, 0($t1) # carrega em $t2 o valor de $t1 na posição zero, $t2 = $t0
		add $t3, $s0, $t2 # adiciona em $t3 o endereço de $s0 na posição $t2, $t3 = a[$t2]
		
		lb $t4, 0($t3) # carrega em $t4 o valor de $t0, $t4 = $t3
		
		addi $t0, $t0, 4 # aumenta a posição em 1 byte, 4 inteiros
		
		j loop
	endLoop: