	.data
str:	.asciiz "String de teste"
	.text 
	.globl main

main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, str
	jal strlen
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	jr $ra

strlen:
	addiu $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	
	lb $t0, 0($a0)
	beq $t0, '\0', else
	addiu $a0, $a0, 1
	jal strlen
	addi $v0, $v0, 1
	
	j endif
else:
	li $v0, 0
endif:
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	addiu $sp, $sp, 8
	jr $ra