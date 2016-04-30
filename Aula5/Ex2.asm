	.data
str: 	.space 20 #static char str[20];
	
	.text
	.globl main 

main: 
	# $t0 = num
	# $t1 = p
	# $t2 = *p
	
	ori $t0, $0, 0 # num = 0;
	
	la $a0, str
	li $a1, 20
	la $v0, 8  #read_str(str, 20);
	syscall 
	
	ori $t1, $a0, 0
	
while:
	lb $t2, 0($t1)
	bne $t2, 0x00, if # str[i] != '\0' 
	j endwhile

if:	
	bge $t2, 0x30, And #if (str[i] >= '0')
	j endif
	
And:
	ble $t2, 0x039, doif # if (str[i] <= '9')
	j endif
	
doif: 
	addi $t0, $t0, 1 # num++;
	j endif

endif: 
	addi $t1, $t1, 1 #p++;
	j while
	
endwhile: 
	or $a0, $0, $t0
	la $v0, 1 #print_int10(num);
	syscall 
	
	jr $ra
	