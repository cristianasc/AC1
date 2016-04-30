	.eqv SIZE, 3
	.data
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"
	
array:	.word str1, str2, str3
	.text
	.globl main

main:
	la $t0, array
	li $t1, 0
	 
for:
	bge $t1, SIZE, endfor
	
	sll $t2, $t1, 2
	
	add $t3 , $t2, $t0
	
	lw $a0, 0($t3)
	li $v0, 4
	syscall
	

	li $v0, 11
	or $a0, $0, '\n'
	syscall

	addi $t1, $t1, 1
	b for
endfor:
	jr $ra
