	.data
str: 	.space 20
str1:   .asciiz "Introduza uma string: "

	.text
	.globl main

main:
 	# p = $t0;
 	# *p = $t1;
 	
 	la $a0, str1
 	la $v0, 4
 	syscall
 	la $a0, str
 	la $a1, 20
 	la $v0, 8
 	syscall 
 	
 	or $t0, $0, $a0
 	
while: 
 	lb $t1, 0($t0)
 	beq $t1, 0x00, endwhile
 	blt $t1, 0x61, endif
	bgt $t1, 0x7A, endif
 	sub $t1, $t1, 0x61
 	add $t1, $t1, 0x41
 	sb $t1, 0($t0)

endif:
	addi $t0, $t0, 1
 	j while
	
endwhile:	
 	la $a0, str
	la $v0, 4
	syscall
	
 	jr $ra