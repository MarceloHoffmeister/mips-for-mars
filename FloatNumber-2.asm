.data
	numero1: .double 3.14
	numero2: .double 2.42
.text
	ldc1 $f2, numero1
	ldc1 $f4, numero2
	
	add.d $f12, $f2, $f4
	
	li $v0, 3
	syscall