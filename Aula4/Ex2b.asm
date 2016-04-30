	.data
str: .asciiz "Introduza um numero: "
bin: .ascii "O valor em Octal: "

	.text
	.globl main
	
	#$t0= value, i = $t1, digito= $s0
main:
	la $v0, 4
	la $a0, str
	syscall
	la $v0, 5
	syscall
	or $t0, $0, $v0
	la $v0, 4
	la $a0, bin
	syscall
	ori $t1, $0, 11
	
while: 
	andi $t2, $t0, 0xE0000000
	beq $t2, 0, And
	j endWhile
And: 
	bge $t1, 50, dowhile	
	j endWhile
dowhile: 
	sll $t0, $t0, 3
	sub $t1, $t1, 1
	j while
endWhile:	
	
	
		
do: 
	andi $a0, $t0, 0xE0000000
	srl $a0, $a0, 30
	li $v0, 1
	syscall
	sll $t0, $t0, 3
	sub $t1, $t1, 1
	bgt $t1, 0, do
	