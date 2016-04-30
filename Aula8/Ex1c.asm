	.data
str1: 	.asciiz " - "
	.text
	.globl main
	
main:	
	move $t3, $a0
	li $t0, 0
for:
	bge $t0, $t3, endfor
	
	la $a0, '\n' 
	li $v0, 11
	syscall
	
	sll $t2, $t0, 2
	add $t2, $t2, $a1
	
	lw $a0, 0($t2) 
	li $v0, 4
	syscall
	
	la $a0, str1  
	li $v0, 4
	syscall
	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	lw $a0, 0($t2)
	jal strlen
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	move $a0, $v0
	li $v0,1
	syscall
	
	addi $t0, $t0, 1
	
	j for
	
endfor: 
	jr $ra
	
strlen:
	li $v0, 0 #len=0
while:
	lb $t1, 0($a0)
	beq $t1, '\0', endwhile
	addi $a0, $a0, 1
	addi $v0, $v0, 1
	j while
	
endwhile:
	jr $ra
	