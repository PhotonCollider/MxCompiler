.text
	.globl main
point.printPoint:
	addi	sp, sp, -80
	sw	ra, 76(sp)
	mv	t2, a0
	addi	t2, t2, 0
	sw	t2, 0(sp)
	lw	t0, 0(sp)
	lw	t1, 0(t0)
	sw	t1, 4(sp)
	sw	a0, 60(sp)
	lw	a0, 4(sp)
	call	toString
	sw	a0, 8(sp)
	lw	a0, 60(sp)
	sw	a0, 60(sp)
	la	a0, stringLiteral.0
	lw	a1, 8(sp)
	call	builtin.string_add
	sw	a0, 12(sp)
	lw	a0, 60(sp)
	sw	a0, 60(sp)
	lw	a0, 12(sp)
	la	a1, stringLiteral.1
	call	builtin.string_add
	sw	a0, 16(sp)
	lw	a0, 60(sp)
	mv	t2, a0
	addi	t2, t2, 4
	sw	t2, 20(sp)
	lw	t0, 20(sp)
	lw	t1, 0(t0)
	sw	t1, 24(sp)
	sw	a0, 60(sp)
	lw	a0, 24(sp)
	call	toString
	sw	a0, 28(sp)
	lw	a0, 60(sp)
	sw	a0, 60(sp)
	lw	a0, 16(sp)
	lw	a1, 28(sp)
	call	builtin.string_add
	sw	a0, 32(sp)
	lw	a0, 60(sp)
	sw	a0, 60(sp)
	lw	a0, 32(sp)
	la	a1, stringLiteral.2
	call	builtin.string_add
	sw	a0, 36(sp)
	lw	a0, 60(sp)
	mv	t2, a0
	addi	t2, t2, 8
	sw	t2, 40(sp)
	lw	t0, 40(sp)
	lw	t1, 0(t0)
	sw	t1, 44(sp)
	sw	a0, 60(sp)
	lw	a0, 44(sp)
	call	toString
	sw	a0, 48(sp)
	lw	a0, 60(sp)
	sw	a0, 60(sp)
	lw	a0, 36(sp)
	lw	a1, 48(sp)
	call	builtin.string_add
	sw	a0, 52(sp)
	lw	a0, 60(sp)
	sw	a0, 60(sp)
	lw	a0, 52(sp)
	la	a1, stringLiteral.3
	call	builtin.string_add
	sw	a0, 56(sp)
	lw	a0, 60(sp)
	sw	a0, 60(sp)
	lw	a0, 56(sp)
	call	println
	lw	a0, 60(sp)
	lw	ra, 76(sp)
	addi	sp, sp, 80
	ret
point.cross:
	addi	sp, sp, -32
	sw	ra, 28(sp)

	mv	t1, a1
	sw	t1, 0(sp)

	sw	a0, 20(sp)
	sw	a1, 24(sp)
	li	a0, 12
	call	builtin.calloc
	sw	a0, 8(sp)
	lw	a0, 20(sp)
	lw	a1, 24(sp)

	call	point.printPoint

	sw	a0, 20(sp)
	sw	a1, 24(sp)
	call	point.point
	lw	a0, 20(sp)
	lw	a1, 24(sp)

	call	point.printPoint

	lw	t1, 8(sp)
	sw	t1, 4(sp)
	lw	t1, 4(sp)
	sw	t1, 12(sp)

	sw	a0, 20(sp)
	sw	a1, 24(sp)
	lw	a0, 12(sp)
	li	a1, 7
	li	a2, 7
	li	a3, 7
	call	point.set
	lw	a0, 20(sp)
	lw	a1, 24(sp)

	lw	t1, 4(sp)
	sw	t1, 16(sp)
	lw	a0, 16(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
main:
	addi	sp, sp, -64
	sw	ra, 60(sp)
	call	global.init
	li	a0, 12
	call	builtin.calloc
	sw	a0, 4(sp)
	call	point.point
	lw	t1, 4(sp)
	sw	t1, 0(sp)
	li	a0, 12
	call	builtin.calloc
	sw	a0, 12(sp)
	call	point.point
	lw	t1, 12(sp)
	sw	t1, 8(sp)
	lw	t1, 0(sp)
	sw	t1, 16(sp)
	lw	a0, 16(sp)
	li	a1, 1
	li	a2, 2
	li	a3, 3
	call	point.set
	lw	t1, 8(sp)
	sw	t1, 20(sp)
	lw	a0, 20(sp)
	li	a1, 4
	li	a2, 5
	li	a3, 6
	call	point.set
	lw	t1, 0(sp)
	sw	t1, 24(sp)
	lw	a0, 24(sp)
	call	point.printPoint
	lw	t1, 8(sp)
	sw	t1, 28(sp)
	lw	a0, 28(sp)
	call	point.printPoint

    lw  a0, 0(sp)
    call    point.printPoint

	lw	t1, 0(sp)
	sw	t1, 32(sp)
	lw	t1, 8(sp)
	sw	t1, 36(sp)

	lw	a0, 32(sp)
	lw	a1, 36(sp)
	call	point.cross
	sw	a0, 40(sp)

	lw  a0, 0(sp)
    call	point.printPoint

	li	a0, 0
	lw	ra, 60(sp)
	addi	sp, sp, 64
	ret
point.set:
	addi	sp, sp, -64
	sw	ra, 60(sp)
	mv	t1, a1
	sw	t1, 0(sp)
	mv	t1, a2
	sw	t1, 4(sp)
	mv	t1, a3
	sw	t1, 8(sp)
	lw	t1, 0(sp)
	sw	t1, 12(sp)
	mv	t2, a0
	addi	t2, t2, 0
	sw	t2, 16(sp)
	lw	t0, 16(sp)
	lw	t1, 12(sp)
	sw	t1, 0(t0)
	lw	t1, 4(sp)
	sw	t1, 20(sp)
	mv	t2, a0
	addi	t2, t2, 4
	sw	t2, 24(sp)
	lw	t0, 24(sp)
	lw	t1, 20(sp)
	sw	t1, 0(t0)
	lw	t1, 8(sp)
	sw	t1, 28(sp)
	mv	t2, a0
	addi	t2, t2, 8
	sw	t2, 32(sp)
	lw	t0, 32(sp)
	lw	t1, 28(sp)
	sw	t1, 0(t0)
	lw	ra, 60(sp)
	addi	sp, sp, 64
	ret
point.point:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	mv	t2, a0
	addi	t2, t2, 0
	sw	t2, 0(sp)
	lw	t0, 0(sp)
	li	t1, 0
	sw	t1, 0(t0)
	mv	t2, a0
	addi	t2, t2, 4
	sw	t2, 4(sp)
	lw	t0, 4(sp)
	li	t1, 0
	sw	t1, 0(t0)
	mv	t2, a0
	addi	t2, t2, 8
	sw	t2, 8(sp)
	lw	t0, 8(sp)
	li	t1, 0
	sw	t1, 0(t0)
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
stringLiteral.0:
	.asciz "("
stringLiteral.1:
	.asciz ", "
stringLiteral.2:
	.asciz ", "
stringLiteral.3:
	.asciz ")"

