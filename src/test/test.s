.text
	.globl main
main:
	addi	sp, sp, -64
	sw	ra, 60(sp)
	call	global.init
	addi	t0, sp, 0
	li	t1, 0
	sw	t1, 0(t0)
	j	for.cond.0
	addi	t0, sp, 0
	lw	t1, 0(t0)
	sw	t1, 4(sp)
	lw	t0, 4(sp)
	li	t1, 5
	slt	t3, t0, t1
	sw	t3, 8(sp)
	lw	t0, 8(sp)
	bgtz	t0, for.body.0
	j	for.end.0
for.body.0:
	j	for.update.0
	addi	t0, sp, 0
	lw	t1, 0(t0)
	sw	t1, 12(sp)
	lw	t0, 12(sp)
	li	t1, 1
	add	t2, t0, t1
	sw	t2, 16(sp)
	addi	t0, sp, 0
	lw	t1, 16(sp)
	sw	t1, 0(t0)
	j	for.cond.0
	li	a0, 0
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret

.data
arrayLiteral.0:
	.word 1

.rodata

