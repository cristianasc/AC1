      .data 
str1: .asciiz "Introduza 2 numeros"
str2: .asciiz "A soma dos dois numeros e:"

	.text
	.globl main
	
main: la $a0,str1
      ori $v0,$0,4
      syscall 

      ori $v0,$0,5  
      syscall
      or $t1, $0, $v0 
      
      ori $v0,$0,5  
      syscall
      or $t2, $0, $v0 
      
      la $a0,str2
      ori $v0,$0,4 
      syscall  
      add $t3, $t1, $t2
    	
      or $a0,$0,$t3
      ori $v0,$0,1
      syscall
      
      
      
      


jr $ra