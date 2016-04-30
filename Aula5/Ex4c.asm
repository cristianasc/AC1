	.data
arr:    .word 7692,23,5,234

	.text
	.globl main
	
main:
	# $t0 -> array
	# $t1 -> ultimo
	# $t2 -> i
	# $t4 -> Conteudo de i
	# $t3 -> soma
	# $t5 -> Posiçao i + array
	
	ori $t3, $0, 0
	la $t0,arr
	addi $t1,$t0,12
	
While:	
	
	bgt $t2,$t1,Endwhile
	add $t5,$t0,$t2
	lw $t4,0($t5)
	add $t3,$t3,$t4
	addi $t2,$t2,4
	j While

Endwhile:
	or $a0,$0,$t3
	ori $v0,$0,1
	syscall
	
	jr $ra