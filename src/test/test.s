.text
	.globl main
main:
	addi	sp, sp, -64
	sw	ra, 60(sp)
	call	global.init
	la	t0, arrayLiteral.0
	lw	t1, 0(t0)
	sw	t1, 8(sp)
	lw	a0, 8(sp)
	li	a1, 1
	call	array.copy
	sw	a0, 12(sp)
	lw	t0, 0(sp)
	lw	t1, 12(sp)
	sw	t1, 0(t0)
	lw	t0, 0(sp)
	lw	t1, 0(t0)
	sw	t1, 24(sp)
	lw	a0, 24(sp)
	call	array.size
	sw	a0, 28(sp)
	lw	t0, 16(sp)
	lw	t1, 28(sp)
	sw	t1, 0(t0)
	lw	t0, 32(sp)
	li	t1, 0
	sw	t1, 0(t0)
	j	for.cond.0
	lw	t0, 32(sp)
	lw	t1, 0(t0)
	sw	t1, 40(sp)
	lw	t0, 16(sp)
	lw	t1, 0(t0)
	sw	t1, 44(sp)
	lw	t0, 40(sp)
	lw	t1, 44(sp)
	slt	t3, t0, t1
	sw	t3, 48(sp)
	lw	t0, 48(sp)
	bgtz	t0, for.body.0
	j	for.end.0
for.body.0:
	j	for.update.0
	lw	t0, 32(sp)
	lw	t1, 0(t0)
	sw	t1, 52(sp)
	lw	t0, 52(sp)
	li	t1, 1
	add	t2, t0, t1
	sw	t2, 56(sp)
	lw	t0, 32(sp)
	lw	t1, 56(sp)
	sw	t1, 0(t0)
	j	for.cond.0
	li	a0, 0
	lw	ra, 60(sp)
	addi	sp, sp, 64
	ret
global.init:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	li	a0, 4
	li	a1, 4
	call	builtin.malloc_array
	sw	a0, 0(sp)
	lw	t0, 0(sp)
	li	t1, 0
	lw	t2, 4(sp)
	li	t3, 4
	mul	t4, t3, t1
	add	t0, t0, t4
	sw	t0, 0(t2)
	lw	t0, 4(sp)
	li	t1, 2
	sw	t1, 0(t0)
	lw	t0, 0(sp)
	li	t1, 1
	lw	t2, 8(sp)
	li	t3, 4
	mul	t4, t3, t1
	add	t0, t0, t4
	sw	t0, 0(t2)
	lw	t0, 8(sp)
	li	t1, 0
	sw	t1, 0(t0)
	lw	t0, 0(sp)
	li	t1, 2
	lw	t2, 12(sp)
	li	t3, 4
	mul	t4, t3, t1
	add	t0, t0, t4
	sw	t0, 0(t2)
	lw	t0, 12(sp)
	li	t1, 2
	sw	t1, 0(t0)
	lw	t0, 0(sp)
	li	t1, 3
	lw	t2, 16(sp)
	li	t3, 4
	mul	t4, t3, t1
	add	t0, t0, t4
	sw	t0, 0(t2)
	lw	t0, 16(sp)
	li	t1, 4
	sw	t1, 0(t0)
	la	t0, arrayLiteral.0
	lw	t1, 0(sp)
	sw	t1, 0(t0)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret

.data
arrayLiteral.0:
	.word 1

.rodata

