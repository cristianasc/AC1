	.data
buf:	.space 33
	.text
	.globl main

main:		
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	li $a0, 10
	li $a1, 2
	jal print_int_ac1
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
		
	jr $ra

print_int_ac1:
	la $a2, buf
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal itoa
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	move $a0, $v0
	li $v0,4
	syscall
	
	jr $ra


itoa: 
	move $t0, $a2 #*p = s
do:
	rem $t1, $a0, $a1 #digit = n % b
	div $a0, $a0, $a1 #n = n/b
	
	addi $sp,$sp,-8
	sw $a0,4($sp)
	sw $ra,0($sp)
	
	move $a0, $t1
	jal toascii
	
	lw $a0, 4($sp)
	lw $ra, 0($sp)
	addi $sp, $sp,8
	
	sb $v0, 0($t0)
	addi $t0, $t0, 1
	ble $a0, 0, endwhile
	j do
	
endwhile:
	li $t3, '\0'
	sb $t3, 0($t0)
	addi $sp,$sp,-8
	sw $ra,4($sp)
	sw $a0,0($sp)
	move $a0, $a2
	jal toascii
	lw $v0, 0($sp)
	lw $ra, 0($sp)
	addi $sp, $sp,8
	
	jr $ra
	
toascii:
	addi $a0, $a0, '0'
if:	
	ble $a0, '9', endif
	addi $a0, $a0, '7'
endif:
	move $a0, $v0
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
	addi $sp, $sp, -4
	sw $t0, 8($sp)
	sw $t1, 4($sp)
	sw $ra, 0($sp)
	move $a0, $t0
	move $a1, $t1
	jal exchange
	lw $ra, 0($sp)
	lw $t1, 4($sp)
	lw $t0, 8($sp)
	addi $sp, $sp, 4
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
