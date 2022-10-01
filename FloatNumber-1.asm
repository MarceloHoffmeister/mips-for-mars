.data
	numero1: .float 3.14
	numero2: .float 2.42
.text
	lwc1 $f1, numero1
	lwc1 $f2, numero2
	
	add.s $f3, $f1, $f2