.text
   .global main
main:
   jal GoodSubprogram
   la $a0, string3
   jal PrintString
   
   jal Exit
   
GoodSubprogram: 
   addi $sp, $sp, -4 # save space on the stack (push) for the $ra 
   sw $ra, 0($sp) # save $ra
   la $a0, string1
   jal PrintString
   
   li $v0, 4
   la $a0, string2
   syscall
   
   lw $ra, 0($sp) # restore $ra 
   addi $sp, $sp, 4 # return the space on the stack (pop)
   jr $ra
   
.data
   string1: .asciiz "\nIn subprogram GoodExample\n"
   string2: .asciiz "After call to PrintString\n"
   string3: .asciiz "After call to GoodExample\n"
   .include "utils.asm"