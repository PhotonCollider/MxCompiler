.text
main:
	addi sp, sp, -16
	sw ra, 12(sp)
	call global.init
	la a0, stringLiteral.0
	call println
	li a0, 0
	lw ra, 12(sp)
	addi sp, sp, 16
global.init:
	addi sp, sp, -16
	sw ra, 12(sp)
	lw ra, 12(sp)
	addi sp, sp, 16

.data

.rodata
stringLiteral.0:
	.asciz "hello, world"

