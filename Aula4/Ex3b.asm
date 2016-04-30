#res=$t0; i=$t1; mdor=$t2; md0=$t3

	.data
str: .asciiz "Introduza dois numeros: "
str1: .asciiz "Resultado:"

	.text
	.globl main
	
main: 
	la $v0, 4
	la $a0, str 
	syscall
	la $v0, 5
	syscall 
	or $t2, $0, $v0
	la $v0, 5
	syscall 
	or $t3, $0, $v0
	ori $t0, $0, 0
	ori $t1, $0, 0
	
	
while: 
	bnez $t2, And
	j endwhile
	
And: 
	blt  $t1, 16, if
	addi $t1, $t1, 1
	j endwhile
if:
	andi $t4, $t2, 0x00000001
	bnez $t4, doif
	j endif
doif:
	add $t0, $t0, $t3
	j endif
endif:
	sll $t3, $t3, 1
	srl $t2, $t2, 1
	j while
endwhile:
	la $v0, 4
	la $a0, str1 
	syscall
	or $a0, $0, $t0
	la $v0, 36
	syscall