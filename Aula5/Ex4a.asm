	.data
arr: 	.word 7692, 23, 5, 234

	.text
	.globl main

main: 
	# p = $t0
	# pultimo = $t1
	# *p = $t2
	# soma = $t3
	
	ori $t3, $0, 0
	la $t0, arr
	addi $t1, $t0, 12

while:
	bgt $t0, $t1, endwhile
	lw $t2, 0($t0)
	add $t3, $t3, $t2
	addi $t0, $t0, 4
	j while

endwhile:
	or $a0, $0, $t3
	la $v0, 1
	syscall
	
	jr $ra	