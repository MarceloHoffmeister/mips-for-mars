.text
la $a0, printHelloWorld
li $v0, 4
syscall

.data
printHelloWorld: .asciiz "Hello World!"