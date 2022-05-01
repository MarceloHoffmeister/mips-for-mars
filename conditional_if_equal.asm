#	...
#	if (a == b)
#		a = a + 1;
#	else
#		a = a - 1;
#	return 0;

.text
	li $t0, 1		# $t0 <- guarda valor 1
	li $t1, 1		# $t1 <- guarda valor 1
	beq $t0, $t1, rSalto	# faz if ($t0 == $t1)
	subi $t0, $t0, 1	# $t0 <- $t0 - 1
	j finalizaPrograma	# salta para a finalização do programa
rSalto:
	addi $t0, $t0, 1	# $t0 <- $t0 + 1
	j finalizaPrograma	# salta para a finalização do programa
	
finalizaPrograma:		# rótulo que executa a finalização do programa