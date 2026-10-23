.data
A: .word 0
B: .word 3
C: .word 0
.code
daddi $sp,  $0, 0x400
ld $a0, A($0)
ld $a1, B($0)
jal operacion
sd $v0, C($0)
halt

factorial: 
	daddi $v0, $0,1
	beqz $a0, finfact
factloop: dmul $v0, $v0, $a0
	      daddi $a0, $a0, -1
	      bnez $a0, factloop
finfact: jr $ra

operacion: 
	daddi $sp, $sp, -32
	sd $ra, 0($sp)
	sd $s0, 8($sp)
	sd $s1, 16($sp)
	sd $s2, 24($sp)
	
	jal factorial
	daddi $s0, $v0, 0 # $s0 = A!
	
	daddi $a0,$a1,0
	jal factorial
	daddi $s1,$v0,0 # $s1 = B!
	
	dadd $s2, $s0, $s1
	daddi $a0, $s2, 0
	jal factorial
	
	ld $ra, 0($sp)
	ld $s0, 8($sp)
	ld $s1, 16($sp)
	ld $s2, 24($sp)
	daddi $sp, $sp, 32
	jr $ra
