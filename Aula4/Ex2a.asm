	.data
str: .asciiz "Introduza um numero: "
bin: .ascii "O valor em hexadecimal: "

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
	ori $t1, $0, 8
	
while: 
	andi $t2, $t0, 0xF0000000
	beq $t2, 0, And
	j endWhile
And: 
	bge $t1, 50, dowhile	
	j endWhile
dowhile: 
	sll $t0, $t0, 4
	sub $t1, $t1, 1
	j while
endWhile:	
	
	
		
do: 
	andi $s0, $t0, 0xF0000000
	srl $s0, $s0, 28 
	
	ble $s0, 9, Doif
	j else
Doif:
	addi $a0, $s0,0x30
	li $v0, 11
	syscall
	j endif
else: 
	addi $a0, $s0, 0x30
	addi $a0, $a0, 7
	li $v0, 11
	syscall
endif: 
	sll $t0, $t0, 4
	sub $t1, $t1, 1
	bgt $t1, 0, do
