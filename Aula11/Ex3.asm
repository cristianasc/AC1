	.data
	.align 3
arr:	.space 88
	.text
	.globl main
main:
	add $sp, $sp, -4
	sw $ra, 0($sp)
	
	li $t0, 0  # i = 0
	li $t1, 11 # unsigned int n
	la $t2, arr # array
for:
	bge $t0, $t1, endfor
	
	li $v0, 7
	syscall 
	mov.d $f4, $f0
	s.d $f4, 0($t2)
	
	addiu $t0, $t0, 1
	addiu $t2, $t2, 8 # 8 bytes
	b for
endfor:

	la $a0, arr
	li $a1, 11
	jal avarege
	#
	la $a0, media
	print_str
	#
	mov.d $f12, $f0
	print_double
	
	lw $ra, 0($sp)
	addiu $ra, $ra, 4


avarege:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	l.d $f0,zero	#soma=0.0;
	li $t0, 0	#i
avarege_for:
	bge $t0, $a1, avarege_endfor
	
	sll $t1,$t0,3		#$t1=&A[i]
	addu $t1,$t1,$a0	#$f4=A[i]
	l.d $f4,0($t1)		#soma+=A[i]
	add.d $f0,$f0,$f4	#i++;
	addi $t0,$t0,1		
	b avarege_for

avarege_endfor:
	beqz $a1,avarege_eif	#if(n==0) avg_eif
	mtc1 $a1,$f4			
	cvt.d.w $f4,$f4		#$f4=(double)n
	div.d $f0,$f0,$f4	#ret: soma/(double)n
avarege_eif:
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra