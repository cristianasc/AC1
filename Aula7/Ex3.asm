	.eqv SIZE, 3
	.data
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"
str4:	.asciiz	"\nString #"
str5:	.asciiz ": "

arr:	.word str1, str2, str3
	.text
	.globl main
main:
	la $t0, arr
	li $t1, 0	
for:	
	bge $t1, SIZE, endfor
	la $a0, str4
	li $v0, 4
	syscall
	
	or $a0, $0, $t1
	li $v0, 1
	syscall
	
	la $a0, str5
	li $v0, 4
	syscall
	
	sll $t2, $t1, 2
	add $t5 , $t2, $t0
	lw $t2, 0($t5) 
	
	li $t3, 0 
	
while:
	add $t4, $t2, $t3
	lb $t4, 0($t4) 
	beq $t4, '\0', endwhile
	
	or $a0, $0, $t4
	li $v0, 11
	syscall
	
	or $a0, $0, '-'
	li $v0, 11
	syscall
	
	addi $t3, $t3, 1
	b while
endwhile:
	addi $t1, $t1, 1
	b for
endfor:
	jr $ra
