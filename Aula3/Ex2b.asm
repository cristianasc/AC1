	.text
	.globl main
	
main:
	sll $t2,$t0,4
	srl $t3,$t0,4
	sra $t4,$t0,4
	jr $ra
