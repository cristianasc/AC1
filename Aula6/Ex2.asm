	.data
lista: 	.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15 
str: 	.asciiz "Conteudo do array:"
str2: 	.asciiz "-"
	.text
	.globl main
main:
	#p* = $t0;
	#i = $t1;
	#p = $t2;
	#lista = $t3
	la $t3, lista
	li $t0, 0
	li $t1, 0
	li $t2, 0
	
	or $t2, $t3, $0 #inicializa o ponteiro
	la $a0, str #print de str
	li $v0, 4

for:
	bge $t1, 10, end 
	lw $t0,0($t2)
	
	or $a0, $t0, $0
	li $v0, 1
	syscall 
	
	la $a0, str2
	li $v0, 4
	syscall
	
	addi $t2, $t2, 4
	addi $t1, $t1, 1

	j for
	
end: 
	jr $ra
	
	