# We've these variables 'a', 'b', 'c', 'd', 'e' declared in program.
#	a = 10;
#	b = 20;
#	c = a + b;
#	d = 2;
#	e = c + d;
# 	...

.text
	li $t0, 10		# $t0 <- recebe o valor 10
	li $t1, 20		# $t1 <- recebe o valor 20
	add $t2, $t0, $t1	# $t2 <- recebe o resultado de $t0 + $t1
	
	li $t3, 2
	mul $t4, $t2, $t3	# $t4 <- recebe o resultado de $t2 * $t3