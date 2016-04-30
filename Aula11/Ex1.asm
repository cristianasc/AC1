	.data
f:	.float 2.59375
z:	.float 0.0
	.text
	.globl main

main:
	l.s $f0, f #f0 = f
	l.s $f1, z #f1 = z
	
do:
	li $v0,5
	syscall
	
	mtc1 $v0, $f2 #transfere do registo inteiro para o de vírgula flutuante
	cvt.s.w $f2, $f2 #float(val)
	
	mul.s $f12, $f2, $f0 #res = float(val) * f
	
	li $v0, 2 #print_float(res)
	syscall

end:
	c.eq.s $f12, $f1
	bc1t do
	jr $ra
