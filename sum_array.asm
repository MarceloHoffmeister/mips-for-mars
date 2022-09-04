.data
r: .word 0 2 5 8 11 -45 23 15 38 12 8 4 96 63 14
numero: .asciiz "Insere um numero "
index: .asciiz "Insere o indice"
resultado: .asciiz "Resultado é "

.text
# leitura do numero
li $v0, 4
la $a0, numero
syscall

li $v0, 5
syscall

move $s0, $v0

# leitura do indice
li $v0, 4
la $a0, index
syscall

li $v0, 5
syscall

move $s1, $v0

## shift to the left significa multiplicar por 2
sll $s1, $s1, 2

## armazena em $t0 o endereço do array r
la $t0, r
## soma o descolamento $s1 mais o endereço base do array r
add $t1, $t0, $s1

## atualmente no $t1 temos o endereço do array r
## 0($t1) significa acessar ao conteudo armazenado no endereço $t1
## em $t2 temos o valor do r[index]
lw $t2, 0($t1)

add $s2, $s0, $t2

## Imorime o resultado na consola
li $v0, 4
la $a0, resultado
syscall

li $v0, 1
move $a0, $s2
syscall
