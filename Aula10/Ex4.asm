	.data
	.text 
	.globl main

main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	li $a0, 10
	li $a1, 2
	jal print_int_ac1
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	
	jr $ra


print_int_ac1:
	addiu $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	
	move $s0, $a0
	
	divu $a0, $s0, $a1
	beqz $a0, printendif
	jal print_int_ac1
	
printendif:
	remu $a0, $s0, $a1
	jal toascii
	move $a0, $v0
	li $v0, 11
	syscall
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	addiu $sp, $sp, 8

toascii:
	addiu $v0, $a0, '0'
if:
	ble $v0, '9', endif
	addiu $v0, $v0, 7
endif:
	jr $ra