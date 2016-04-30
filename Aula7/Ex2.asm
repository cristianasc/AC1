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
	addi $t1, $t0, 12
for:
	bge $t0, $t1, endfor
	
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	addi $t0, $t0, 4

	li $v0, 11
	or $a0, $0, '\n'
	syscall
	
	j for
endfor:
	jr $ra