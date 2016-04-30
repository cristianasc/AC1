	.data
str: .asciiz "Introduza um numero: "
bin: .ascii "O valor em binario: "
spaces: .ascii " "
	
	.text
	.globl main
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
	
Loop:	
	beq $t5,32,Exit
	div $t2, $t5, 4
	mfhi $t2
	beq $t2, 0, Space

halfloop:
	andi $t1,$t0, 0x80000000
	srl $t1, $t1, 31
	add $t1, $t1, 0x30
	or $a0, $0, $t1
	la $v0, 11
	syscall
	
preloop:
	sll $t0, $t0, 1
	add $t5,$t5,1
	j Loop
	
Space:
	la $v0, 4
	la $a0, spaces
	syscall
	j halfloop

Exit:
	jr $ra
