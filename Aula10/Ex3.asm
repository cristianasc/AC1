	.data
array:	.word 1, 1, 2
	.text 
	.globl main

main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, array
	li $a1, 3
	jal soma
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	jr $ra
	
soma:
	addiu $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	
	beqz $a1, else
	
	lw $s0, 0($a0)
	addiu $a0, $a0, 4
	addiu $a1, $a1, -1
	
	jal soma
	add $v0, $s0, $v0
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	addiu $sp, $sp, 8
	jr $ra
	
else:
	li $v0, 0

