	.data
cinco:	.double 5.0
nove: 	.double 9.0
trintadois: .double 32.0
	.text
	.globl main

main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)

	li $v0, 7
	syscall #return em $f0
	mov.d $f12, $f0 
	
	jal f2c #return in $f0
		
	mov.d $f12, $f0
	li $v0, 3
	syscall 
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra


f2c:
	l.d $f0, cinco
	l.d $f2, nove
	l.d $f4, trintadois
	
	div.d $f8, $f0, $f2
	sub.d $f10, $f12, $f4
	mul.d $f0, $f8, $f10
	
	jr $ra
	