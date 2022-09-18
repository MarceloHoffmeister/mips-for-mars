.data 
codigo: .asciiz "ABCDEFGH"
chave: .word 2

.text
    ## Metodo de encriptação Caesar 
    ## No codigo esta armazenado a mensagem a ser encriptada
    ## Em chave temos o parametro de troca
    ## Neste caso, está se trocando os caracteres à direita
    ## $t0 armazena o indice da string
    la $s0, codigo
    lw $t1, chave     
    li $t0, 0       

lacoWhile:
    ## $s1 = codigo[i] com i em $t0
    add $s1, $s0, $t0   
    ## armazena em $s2 o caracter que se encontra no endereço $s1
    lb $s2, 0($s1)      
    ## verifica se o laço atinguiu o final da string codigo
    ## para maiores detalhes consulte
    ## http://stackoverflow.com/questions/12739463/how-to-iterate-a-string-in-mips-assembly
    beq $s2, $zero, saida  
    ## mudando o valor do caractere pela chave de troca a direita
    add $s2, $s2, $t1   
    ## atualizando o valor criptografado na string codigo
    sb $s2, ($s1)      
    #i++ 
    addi $t0, $t0, 1    
    b lacoWhile    

saida:
    ## Imprime a messagem encriptada
    li $v0, 4
    la $a0, codigo
    syscall    