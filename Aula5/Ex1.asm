#num=$t0,i=$t1

	.data
str: 	.space 20 #static char str[20];
	.text
	.globl main
	
main: 
	la $a0, str
	li $a1, 20
	la $v0, 8  #read_str(str, 20);
	syscall 
	ori $t2, $a0, 0 # $t2 -> endereço da String
	ori $t0, $0, 0 #num = 0;
	ori $t1, $0, 0  #i = 0;
	
while: 
	add $t3, $t1, $t2  #$t3 endereço da posição i da String
	lb $t4, 0($t3)
	bne $t4, 0x00, if # str[i] != '\0' 
	j endwhile

if:	
	bge $t4, 0x30, And #if (str[i] >= '0')
	j endif
	
And:
	ble $t4, 0x039, doif # if (str[i] <= '9')
	j endif
	
doif: 
	addi $t0, $t0, 1 # num++;
	j endif

endif: 
	addi $t1, $t1, 1 #i++;
	j while
	
endwhile: 
	or $a0, $0, $t0
	la $v0, 1 #print_int10(num);
	syscall 
	
	jr $ra
	
	
	
	
