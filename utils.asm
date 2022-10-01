.text
   PrintNewLine:
   li $v0, 4
   la $a0, __PNL_newline
   syscall
   jr $ra
.data
   __PNL_newline: .asciiz "\n"
   
   # input: $a0 - The address of the string to print.
   # $a1 - The value of the int to print
   # returns: None
   # side effects: The String is printed followed by the integer value.
.text
   PrintInt:
   # Print string. The string address is already in $a0
   li $v0, 4
   syscall
   # Print integer. The integer value is in $a1, and must
   # be first moved to $a0.
   move $a0, $a1
   li $v0, 1
   syscall
   #return
   jr $ra
   
   # input: $a0 - The address of the string to print.
   # returns: $v0 - The value the user entered
   # side effects: The String is printed followed by the integer value.
.text
   PromptInt:
   # Print the prompt, which is already in $a0
   li $v0, 4
   syscall
   # Read the integer value. Note that at the end of the
   # syscall the value is already in $v0, so there is no
   # need to move it anywhere.
   move $a0, $a1
   li $v0, 5
   syscall
   #return
   jr $ra
 
.text
PrintString:
    addi $v0, $zero, 4
    syscall
    jr $ra
    
.text
Exit:
   li $v0, 10
   syscall
