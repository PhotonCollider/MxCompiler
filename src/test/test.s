.text
	.globl main
main:
	addi	sp, sp, -48
	sw	ra, 44(sp)
	call	global.init
	li	a0, 4
	li	a1, 4
	call	builtin.calloc_array
	sw	a0, 4(sp)
	lw	t1, 4(sp)
	sw	t1, 0(sp)
	lw	t1, 0(sp)
	sw	t1, 8(sp)

	lw	t2, 8(sp)
	li	t1, 2
	li	t3, 4
	mul	t4, t3, t1
	add	t2, t2, t4
	sw	t2, 12(sp)

	lw	t0, 12(sp)
	li	t1, 2
	sw	t1, 0(t0)

	lw	t1, 0(sp)
	sw	t1, 16(sp)

	la	t0, a
	lw	t1, 16(sp)
	sw	t1, 0(t0)

	la	t0, a
	lw	t1, 0(t0)
	sw	t1, 20(sp)

	lw	t2, 20(sp)
	li	t1, 2
	li	t3, 4
	mul	t4, t3, t1
	add	t2, t2, t4
	sw	t2, 24(sp)

	lw	t0, 24(sp)
	lw	t1, 0(t0)
	sw	t1, 28(sp)

	lw	a0, 28(sp)
	call	toString
	sw	a0, 32(sp)

	lw	a0, 32(sp)
	call	println

	li	a0, 0
	lw	ra, 44(sp)
	addi	sp, sp, 48
	ret
global.init:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	li	a0, 4
	li	a1, 4
	call	builtin.calloc_array
	sw	a0, 0(sp)
	la	t0, a
	lw	t1, 0(sp)
	sw	t1, 0(t0)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret

.data
a:
	.word 1

.rodata

