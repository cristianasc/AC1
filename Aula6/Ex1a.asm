	.data 
lista: 	.space 20
str: 	.asciiz "Introduza um numero: "
	.text
	.globl main
main:	
	la $t1, lista
	li $t2, 0
	li $t0, 0 #i
	
for: 
	bge  $t0, 5, end
	la  $a0, str
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	sll $t2, $t0, 2
	add $t2, $t2 $t1
	sw $v0, 0($t2)
	addi $t0, $t0, 1
	
	j for
	
end:
	jr $ra
