	.data
	.text
	.globl main
	
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a0, 3
	jal fact
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4 
	
	move $a0, $v0
	li $v0, 1
	syscall
	jr $ra

fact:
	addiu $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	
	move $s0, $a0
	ble $s0, 12, return
	j endif
	
return:
	ble $s0, 1, else
	addiu $a0, $s0, -1
	jal fact
	mul $v0, $s0, $v0
	j endif

else:	
	li $v0, 1
	
endif:
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	addiu $sp, $sp, 8
	jr $ra