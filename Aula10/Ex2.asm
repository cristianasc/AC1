	.data
str:	.asciiz "String de teste"
dst:	.space 20
	.text
	.globl main
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a0, dst
	la $a1, str
	jal strcpy
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4 
	
	move $a0, $v0
	li $v0, 4
	syscall
	jr $ra
	
strcpy:
	addiu $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	

	lb $t0, 0($a1) # *src
	sb $t0, 0($a0) # *dst = *src
	beq $t0, '\0', endif
	
	addiu $a0, $a0, 1
	addiu $a1, $a1, 1
	jal strcpy
	
endif:
	lw $ra, 0($sp)
	lw $v0, 4($sp)
	addiu $sp, $sp, 8
	jr $ra
	
