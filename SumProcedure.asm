.text
   .global main
main:
   jal SumSubprogram
   jal Exit
   
SumSubprogram: 
   addi $sp, $sp, -4 # save space on the stack (push) for the $ra 
   sw $ra, 0($sp) # save $ra
   
   ## reading the first number
   la $a0, prontNumber1
   jal PromptInt
   sw $v0, theNumber1
   
   ## reading the second number
   la $a0, prontNumber2
   jal PromptInt
   sw $v0, theNumber2
   
   lw $t1, theNumber1
   lw $t2, theNumber2
   
   la $a0, PrintResult
   add $a1, $t1, $t2
   jal PrintInt
   
   lw $ra, 0($sp) # restore $ra 
   addi $sp, $sp, 4 # return the space on the stack (pop)
   jr $ra
   
.data
   prontNumber1: .asciiz "\nInsert the first number\n"
   prontNumber2: .asciiz "Insert the second number\n"
   theNumber1: .word 0
   theNumber2: .word 0
   PrintResult: .asciiz "The sum of the two numbers is\n"
   .include "utils.asm"