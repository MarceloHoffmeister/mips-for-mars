#	switch(2) {
#		case 0:
#			// código
#			break;
#		case 1:
#			// código
#			break;
#		case 2:
#			// código
#			break;
#		default:
#			// código
#	}
.text
	li $t0, 2		# $t0 <- 2
	beq $t0, 0, case0	# desvia para case0 se $t0 for 0
	beq $t0, 1, case1	# desvia para case1 se $t0 for 1
	beq $t0, 2, case2	# desvia para case3 se $t0 for 2
# caso default
	j finalizaPrograma
case0:
# código
	j finalizaPrograma
case1:
# código
	j finalizaPrograma
case2:
# código
	j finalizaPrograma
	
finalizaPrograma: