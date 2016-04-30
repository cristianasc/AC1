	.data
str: 	.asciiz "String de teste"
	.text
	.globl main
	
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a0, str
	jal strrev
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	move $a0, $v0
	li $v0, 4
	syscall
	
	jr $ra
	
strrev:
	move $v0, $a0
	move $t0, $a0 #char *p1 = str;
	move $t1, $a0 #char *p2 = str;
	
while1:	
	lb $t2, 0($t1) 
	beq $t2, '\0', endwhile1
	addiu $t1, $t1, 1
	j while1
	
endwhile1:
	addiu $t1, $t1, -1
	
while2:
	bge $t0, $t1, endwhile2
	addi $sp, $sp, -12
	sw $t0, 8($sp)
	sw $t1, 4($sp)
	sw $ra, 0($sp)
	move $a0, $t0
	move $a1, $t1
	jal exchange
	lw $ra, 0($sp)
	lw $t1, 4($sp)
	lw $t0, 8($sp)
	addi $sp, $sp, 12
	addi $t0, $t0, 1
	addi $t1, $t1, -1	
	
	j while2

endwhile2:
	
	jr $ra

exchange:
	lb $t0,0($a0)
	lb $t1,0($a1)
	sb $t0,0($a1)
	sb $t1,0($a0)
	jr $ra
	
	
