.data
	message: .asciiz "Hi everybody. \nMy name is Marcelo.\n"
.text
	main:
		jal addNumbers
		
		li $v0, 10
		syscall
	
	addNumbers:
		li $v0, 4
		la $a0, message
		syscall
		
		jr $ra