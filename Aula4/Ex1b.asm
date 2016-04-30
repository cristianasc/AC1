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
	#mfhi $t2
	beq $t2, 0, Space
	
halfloop:
	andi $t1,$t0, 0x80000000
	sll $t0, $t0, 1
	add $t5,$t5,1
	beq $t1, 0x80000000, One
	beq $t1, 0, Zero
	j Loop


One:
	la $a0, 1
	la $v0, 1
	syscall
	j Loop

Zero:
	la $a0, 0
	la $v0, 1
	syscall
	j Loop
	
Space:
	la $v0, 4
	la $a0, spaces
	syscall
	j halfloop

Exit:
	jr $ra
