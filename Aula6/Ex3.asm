	.data 
lista: 	.space 40
str:	.asciiz "Introduza 1 numero:"
	.text
	.globl main
	
main:
	#houveTroca = $t0
	#i = $t1
	#aux = $t2
	#p= $t3
	#*p = $t4
	#lista = $t5
	#j = $t6
	#lista[j] = $t7
	#j+1 = $t8
	#lista[j+1] = $t9
	
	la $t5, lista
	li $t1, 0
	li $t3, 0
	li $t4, 0
	li $t6, 0
	li $t2, 0
	
	or $t3, $t5, $0
	
	
	
for: 
	bge $t1, 10, end 
	
	la $a0, str #introduzir 10 numeros
	la $v0, 4
	syscall
	
	la  $v0, 5
	syscall 
	
	sw $v0, 0($t3)
	
	addi $t3, $t3, 4
	addi $t1, $t1, 1
	j for
	
do:
	li $t0, 0

for1:
	bge $t6, 39, endfor1

if:	
	add $t7, $t7, $t5 
	lw $t8, 0($t7) #lista[i]
	lw $t9, 4($t7) #lista[i+1]
	
	
	add $t7, $t7, 4
	addi $t6, $t6, 1
	
	bge $t8, $t9, endfor1
	
	move $t2, $t8
	move $t8, $t9
	move $t9, $t2
	
	sw $t8, 0($t7)
	sw $t9, 4($t7)
	
	or $t0,$0, 1
	
	
	j for1
	
endfor1:
	beq $t0, 1, do
	
	
end : 
	jr $ra
