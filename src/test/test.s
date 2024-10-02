.text
main:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	call	global.init
	lw	t0, 0(sp)
	li	t1, 1
	sw	t1, 0(t0)
	lw	t0, 0(sp)
	lw	t1, 0(t0)
	sw	t1, 8(sp)
	lw	t0, 8(sp)
	li	t1, 1
	sub	t2, t0, t1
	sw	t2, 12(sp)
	lw	a0, 12(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
global.init:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret

.data

.rodata

