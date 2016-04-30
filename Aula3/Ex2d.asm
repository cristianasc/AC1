	.text
	.globl main
	
main:
	la $t1, 15
	la $v0, 34
	and $a0, $t1, 0xF0000000 
	syscall
	srl $t0,$t0,28 
	
	and $a0, $t1, 0x0F000000 
	syscall
	srl $t0,$t0,24 
	
	and $a0, $t1, 0x00F00000
	syscall
	srl $t0,$t0,20 
	
	and $a0, $t1, 0x000F0000
	syscall
	srl $t0,$t0,16 
	
	and $a0, $t1, 0x0000F000 
	syscall
	srl $t0,$t0,12 
	
	and $a0, $t1, 0x00000F00
	syscall
	srl $t0,$t0,8 
	
	and $a0, $t1, 0x000000F0
	syscall
	srl $t0,$t0,4 
	
	and $a0, $t1, 0x0000000F
	syscall
	srl $t0,$t0,0

	jr $ra