.data
array1: .word 1,4,1,2,3,12,1,23,23,4,3,12,34,56,43,12,1,12,1,32,25,43,2,1,1
.text
start: la $a0, array1
main: add $a1, $a1, 50
add $a1, $a1, $a1
add $v0, $zero, $zero
add $t0, $zero, $zero
outer:    add $t4, $a0, $t0
lw $t4, 0($t4)
add $t5, $zero, $zero
add $t1, $zero, $zero
inner:    add $t3, $a0, $t1
lw $t3, 0($t3)
bne $t3, $t4, skip
addi $t5, $t5, 1
skip:     addi $t1, $t1, 4
bne $t1, $a1, inner
slt $t2, $t5, $v0
bne $t2, $zero, next
add $v0, $t5, $zero
add $v1, $t4, $zero
next:     addi $t0, $t0, 4
bne $t0, $a1, outer
sw $v0, 0($a0)
sw $v1, 4($a0)
