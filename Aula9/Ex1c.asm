	.data 
str: 	.asciiz "10105"
	.text
	.globl main
	
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a0, str
	jal atoi
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	move $a0, $v0
	li $v0,1
	syscall
	
	jr $ra


atoi:	
	li $v0, 0 #res=0;
while:	
	lb $t1, 0($a0)
	blt $t1, '0', endwhile
	bgt $t1, '1', endwhile
	addi $a0, $a0, 1 #*s++
	subi $t2, $t1, '0' 
	mulu $t3, $v0, 10 #10 *res
	add $v0, $t3, $t2 
	j while
	
endwhile:
	jr $ra