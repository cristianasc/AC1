	.data
str1: 	.asciiz "Nr. de parametros: "
str2: 	.asciiz "\nP"
str3: 	.asciiz ": "
	.text
	.globl main

main: 
	move $t2, $a1
	move $t0, $a0
	
	la $a0, str1
	li $v0, 4
	syscall
	
	or $a0, $0, $t0
	li $v0, 1
	syscall
	
	li $t1, 0
	add $t3, $t2, $t1 #argv[i]

for: 
	bge $t1, $t0, endfor
	la $a0, str2
	li $v0, 4
	syscall
	
	or $a0, $0, $t1
	li $v0, 1
	syscall
	
	la $a0, str3
	li $v0, 4
	syscall
	
	lw $t4, 0($t3)
	move $a0, $t4
	li $v0, 4
	syscall
	
	sll $t3, $t1, 2
	add $t3, $t3, $t2
	
	addi $t1, $t1, 1
	j for
	
endfor: 
	li $v0, 0
	jr $ra
	

	
	
	