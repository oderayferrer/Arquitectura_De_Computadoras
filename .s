.data
exponente: .word 2
baseuno: .word 2
basedos: .word 3
resultado: .word 0

.code
ld $a0, exponente($zero)
ld $a1, baseuno($zero)
jal potencia 
dadd $s0, $0, $v0
ld $a0, exponente($zero)
ld $a1, basedos($zero)
jal potencia
dadd $s0, $s0, $v0
sd $s0, resultado($0)
halt

potencia: daddi $v0, $zero, 1
loop: beqz $a0, fin
      daddi $a0, $a0, -1
      dmul $v0, $v0, $a1
      j loop
fin: jr $ra