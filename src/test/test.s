.text
	.globl main
origin:
	addi	sp, sp, -112
	sw	ra, 108(sp)
	mv	s1, a0
	sw	s1, 0(sp)
	la	s0, head
	li	s1, 0
	sw	s1, 0(s0)
	la	s0, tail
	li	s1, 0
	sw	s1, 0(s0)
	lw	s1, 0(sp)
	sw	s1, 4(sp)
	sw	a0, 96(sp)
	li	a0, 4
	lw	a1, 4(sp)
	call	builtin.calloc_array
	sw	a0, 8(sp)
	lw	a0, 96(sp)
	la	s0, step
	lw	s1, 8(sp)
	sw	s1, 0(s0)
	la	s0, i
	li	s1, 0
	sw	s1, 0(s0)
	la	t0, for.cond.0
	jr t0
for.cond.0:
	la	s0, i
	lw	s1, 0(s0)
	sw	s1, 12(sp)
	lw	s1, 0(sp)
	sw	s1, 16(sp)
	lw	s0, 12(sp)
	lw	s1, 16(sp)
	slt	s3, s0, s1
	sw	s3, 20(sp)
	lw	s0, 20(sp)
	bgtz	s0, asm.branchBlock.0
	la	t0, for.end.0
	jr t0
asm.branchBlock.0:
	la	t0, for.body.0
	jr t0
for.body.0:
	lw	s1, 0(sp)
	sw	s1, 24(sp)
	sw	a0, 96(sp)
	li	a0, 4
	lw	a1, 24(sp)
	call	builtin.calloc_array
	sw	a0, 28(sp)
	lw	a0, 96(sp)
	la	s0, step
	lw	s1, 0(s0)
	sw	s1, 32(sp)
	la	s0, i
	lw	s1, 0(s0)
	sw	s1, 36(sp)
	lw	s2, 32(sp)
	lw	s1, 36(sp)
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 40(sp)
	lw	s0, 40(sp)
	lw	s1, 28(sp)
	sw	s1, 0(s0)
	la	s0, j
	li	s1, 0
	sw	s1, 0(s0)
	la	t0, for.cond.1
	jr t0
for.cond.1:
	la	s0, j
	lw	s1, 0(s0)
	sw	s1, 44(sp)
	lw	s1, 0(sp)
	sw	s1, 48(sp)
	lw	s0, 44(sp)
	lw	s1, 48(sp)
	slt	s3, s0, s1
	sw	s3, 52(sp)
	lw	s0, 52(sp)
	bgtz	s0, asm.branchBlock.1
	la	t0, for.end.1
	jr t0
asm.branchBlock.1:
	la	t0, for.body.1
	jr t0
for.body.1:
	la	s0, step
	lw	s1, 0(s0)
	sw	s1, 56(sp)
	la	s0, i
	lw	s1, 0(s0)
	sw	s1, 60(sp)
	lw	s2, 56(sp)
	lw	s1, 60(sp)
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 64(sp)
	lw	s0, 64(sp)
	lw	s1, 0(s0)
	sw	s1, 68(sp)
	la	s0, j
	lw	s1, 0(s0)
	sw	s1, 72(sp)
	lw	s2, 68(sp)
	lw	s1, 72(sp)
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 76(sp)
	lw	s0, 76(sp)
	li	s1, 0
	sw	s1, 0(s0)
	la	t0, for.update.1
	jr t0
for.update.1:
	la	s0, j
	lw	s1, 0(s0)
	sw	s1, 80(sp)
	lw	s0, 80(sp)
	li	s1, 1
	add	s2, s0, s1
	sw	s2, 84(sp)
	la	s0, j
	lw	s1, 84(sp)
	sw	s1, 0(s0)
	la	t0, for.cond.1
	jr t0
for.end.1:
	la	t0, for.update.0
	jr t0
for.update.0:
	la	s0, i
	lw	s1, 0(s0)
	sw	s1, 88(sp)
	lw	s0, 88(sp)
	li	s1, 1
	add	s2, s0, s1
	sw	s2, 92(sp)
	la	s0, i
	lw	s1, 92(sp)
	sw	s1, 0(s0)
	la	t0, for.cond.0
	jr t0
for.end.0:
	lw	ra, 108(sp)
	addi	sp, sp, 112
	ret
addList:
	addi	sp, sp, -192
	sw	ra, 188(sp)
	mv	s1, a0
	sw	s1, 0(sp)
	mv	s1, a1
	sw	s1, 4(sp)
	lw	s1, 0(sp)
	sw	s1, 8(sp)
	sw	a0, 180(sp)
	sw	a1, 184(sp)
	lw	a0, 8(sp)
	call	check
	sw	a0, 12(sp)
	lw	a0, 180(sp)
	lw	a1, 184(sp)
	li	s1, 0
	sw	s1, 16(sp)
	lw	s0, 12(sp)
	bgtz	s0, asm.branchBlock.2
	la	t0, LogicBinary.end.3
	jr t0
asm.branchBlock.2:
	la	t0, LogicBinary.second.3
	jr t0
LogicBinary.second.3:
	lw	s1, 4(sp)
	sw	s1, 20(sp)
	sw	a0, 180(sp)
	sw	a1, 184(sp)
	lw	a0, 20(sp)
	call	check
	sw	a0, 24(sp)
	lw	a0, 180(sp)
	lw	a1, 184(sp)
	lw	s1, 24(sp)
	sw	s1, 16(sp)
	la	t0, LogicBinary.end.3
	jr t0
LogicBinary.end.3:
	lw	s1, 16(sp)
	sw	s1, 28(sp)
	li	s1, 0
	sw	s1, 32(sp)
	lw	s0, 28(sp)
	bgtz	s0, asm.branchBlock.3
	la	t0, LogicBinary.end.2
	jr t0
asm.branchBlock.3:
	la	t0, LogicBinary.second.2
	jr t0
LogicBinary.second.2:
	la	s0, step
	lw	s1, 0(s0)
	sw	s1, 36(sp)
	lw	s1, 0(sp)
	sw	s1, 40(sp)
	lw	s2, 36(sp)
	lw	s1, 40(sp)
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 44(sp)
	lw	s0, 44(sp)
	lw	s1, 0(s0)
	sw	s1, 48(sp)
	lw	s1, 4(sp)
	sw	s1, 52(sp)
	lw	s2, 48(sp)
	lw	s1, 52(sp)
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 56(sp)
	lw	s0, 56(sp)
	lw	s1, 0(s0)
	sw	s1, 60(sp)
	li	s0, 0
	li	s1, 1
	sub	s2, s0, s1
	sw	s2, 64(sp)
	lw	s0, 60(sp)
	lw	s1, 64(sp)
	xor	s2, s0, s1
	sltiu	s3, s2, 1
	sw	s3, 68(sp)
	lw	s1, 68(sp)
	sw	s1, 32(sp)
	la	t0, LogicBinary.end.2
	jr t0
LogicBinary.end.2:
	lw	s1, 32(sp)
	sw	s1, 72(sp)
	lw	s0, 72(sp)
	bgtz	s0, asm.branchBlock.4
	la	t0, if.else.1
	jr t0
asm.branchBlock.4:
	la	t0, if.then.1
	jr t0
if.then.1:
	la	s0, tail
	lw	s1, 0(s0)
	sw	s1, 76(sp)
	lw	s0, 76(sp)
	li	s1, 1
	add	s2, s0, s1
	sw	s2, 80(sp)
	la	s0, tail
	lw	s1, 80(sp)
	sw	s1, 0(s0)
	lw	s1, 0(sp)
	sw	s1, 84(sp)
	la	s0, xlist
	lw	s1, 0(s0)
	sw	s1, 88(sp)
	la	s0, tail
	lw	s1, 0(s0)
	sw	s1, 92(sp)
	lw	s2, 88(sp)
	lw	s1, 92(sp)
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 96(sp)
	lw	s0, 96(sp)
	lw	s1, 84(sp)
	sw	s1, 0(s0)
	lw	s1, 4(sp)
	sw	s1, 100(sp)
	la	s0, ylist
	lw	s1, 0(s0)
	sw	s1, 104(sp)
	la	s0, tail
	lw	s1, 0(s0)
	sw	s1, 108(sp)
	lw	s2, 104(sp)
	lw	s1, 108(sp)
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 112(sp)
	lw	s0, 112(sp)
	lw	s1, 100(sp)
	sw	s1, 0(s0)
	la	s0, now
	lw	s1, 0(s0)
	sw	s1, 116(sp)
	lw	s0, 116(sp)
	li	s1, 1
	add	s2, s0, s1
	sw	s2, 120(sp)
	la	s0, step
	lw	s1, 0(s0)
	sw	s1, 124(sp)
	lw	s1, 0(sp)
	sw	s1, 128(sp)
	lw	s2, 124(sp)
	lw	s1, 128(sp)
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 132(sp)
	lw	s0, 132(sp)
	lw	s1, 0(s0)
	sw	s1, 136(sp)
	lw	s1, 4(sp)
	sw	s1, 140(sp)
	lw	s2, 136(sp)
	lw	s1, 140(sp)
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 144(sp)
	lw	s0, 144(sp)
	lw	s1, 120(sp)
	sw	s1, 0(s0)
	lw	s1, 0(sp)
	sw	s1, 148(sp)
	la	s0, targetx
	lw	s1, 0(s0)
	sw	s1, 152(sp)
	lw	s0, 148(sp)
	lw	s1, 152(sp)
	xor	s2, s0, s1
	sltiu	s3, s2, 1
	sw	s3, 156(sp)
	li	s1, 0
	sw	s1, 160(sp)
	lw	s0, 156(sp)
	bgtz	s0, asm.branchBlock.5
	la	t0, LogicBinary.end.6
	jr t0
asm.branchBlock.5:
	la	t0, LogicBinary.second.6
	jr t0
LogicBinary.second.6:
	lw	s1, 4(sp)
	sw	s1, 164(sp)
	la	s0, targety
	lw	s1, 0(s0)
	sw	s1, 168(sp)
	lw	s0, 164(sp)
	lw	s1, 168(sp)
	xor	s2, s0, s1
	sltiu	s3, s2, 1
	sw	s3, 172(sp)
	lw	s1, 172(sp)
	sw	s1, 160(sp)
	la	t0, LogicBinary.end.6
	jr t0
LogicBinary.end.6:
	lw	s1, 160(sp)
	sw	s1, 176(sp)
	lw	s0, 176(sp)
	bgtz	s0, asm.branchBlock.6
	la	t0, if.else.0
	jr t0
asm.branchBlock.6:
	la	t0, if.then.0
	jr t0
if.then.0:
	la	s0, ok
	li	s1, 1
	sw	s1, 0(s0)
	la	t0, if.endif.0
	jr t0
if.else.0:
	la	t0, if.endif.0
	jr t0
if.endif.0:
	la	t0, if.endif.1
	jr t0
if.else.1:
	la	t0, if.endif.1
	jr t0
if.endif.1:
	lw	ra, 188(sp)
	addi	sp, sp, 192
	ret
main:
	addi	sp, sp, -448
	sw	ra, 444(sp)
	call	global.init
	li	a0, 106
	call	origin
	call	getInt
	sw	a0, 0(sp)
	la	s0, N
	lw	s1, 0(sp)
	sw	s1, 0(s0)
	la	s0, N
	lw	s1, 0(s0)
	sw	s1, 4(sp)
	lw	s0, 4(sp)
	li	s1, 1
	sub	s2, s0, s1
	sw	s2, 8(sp)
	la	s0, targety
	lw	s1, 8(sp)
	sw	s1, 0(s0)
	la	s0, targety
	lw	s1, 0(s0)
	sw	s1, 12(sp)
	la	s0, targetx
	lw	s1, 12(sp)
	sw	s1, 0(s0)
	la	s0, i
	li	s1, 0
	sw	s1, 0(s0)
	la	t0, for.cond.2
	jr t0
for.cond.2:
	la	s0, i
	lw	s1, 0(s0)
	sw	s1, 16(sp)
	la	s0, N
	lw	s1, 0(s0)
	sw	s1, 20(sp)
	lw	s0, 16(sp)
	lw	s1, 20(sp)
	slt	s3, s0, s1
	sw	s3, 24(sp)
	lw	s0, 24(sp)
	bgtz	s0, asm.branchBlock.7
	la	t0, for.end.2
	jr t0
asm.branchBlock.7:
	la	t0, for.body.2
	jr t0
for.body.2:
	la	s0, j
	li	s1, 0
	sw	s1, 0(s0)
	la	t0, for.cond.3
	jr t0
for.cond.3:
	la	s0, j
	lw	s1, 0(s0)
	sw	s1, 28(sp)
	la	s0, N
	lw	s1, 0(s0)
	sw	s1, 32(sp)
	lw	s0, 28(sp)
	lw	s1, 32(sp)
	slt	s3, s0, s1
	sw	s3, 36(sp)
	lw	s0, 36(sp)
	bgtz	s0, asm.branchBlock.8
	la	t0, for.end.3
	jr t0
asm.branchBlock.8:
	la	t0, for.body.3
	jr t0
for.body.3:
	li	s0, 0
	li	s1, 1
	sub	s2, s0, s1
	sw	s2, 40(sp)
	la	s0, step
	lw	s1, 0(s0)
	sw	s1, 44(sp)
	la	s0, i
	lw	s1, 0(s0)
	sw	s1, 48(sp)
	lw	s2, 44(sp)
	lw	s1, 48(sp)
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 52(sp)
	lw	s0, 52(sp)
	lw	s1, 0(s0)
	sw	s1, 56(sp)
	la	s0, j
	lw	s1, 0(s0)
	sw	s1, 60(sp)
	lw	s2, 56(sp)
	lw	s1, 60(sp)
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 64(sp)
	lw	s0, 64(sp)
	lw	s1, 40(sp)
	sw	s1, 0(s0)
	la	t0, for.update.3
	jr t0
for.update.3:
	la	s0, j
	lw	s1, 0(s0)
	sw	s1, 68(sp)
	lw	s0, 68(sp)
	li	s1, 1
	add	s2, s0, s1
	sw	s2, 72(sp)
	la	s0, j
	lw	s1, 72(sp)
	sw	s1, 0(s0)
	la	t0, for.cond.3
	jr t0
for.end.3:
	la	t0, for.update.2
	jr t0
for.update.2:
	la	s0, i
	lw	s1, 0(s0)
	sw	s1, 76(sp)
	lw	s0, 76(sp)
	li	s1, 1
	add	s2, s0, s1
	sw	s2, 80(sp)
	la	s0, i
	lw	s1, 80(sp)
	sw	s1, 0(s0)
	la	t0, for.cond.2
	jr t0
for.end.2:
	li	s0, 0
	li	s1, 2
	sub	s2, s0, s1
	sw	s2, 84(sp)
	la	s0, dx
	lw	s1, 0(s0)
	sw	s1, 88(sp)
	lw	s2, 88(sp)
	li	s1, 0
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 92(sp)
	lw	s0, 92(sp)
	lw	s1, 84(sp)
	sw	s1, 0(s0)
	li	s0, 0
	li	s1, 1
	sub	s2, s0, s1
	sw	s2, 96(sp)
	la	s0, dy
	lw	s1, 0(s0)
	sw	s1, 100(sp)
	lw	s2, 100(sp)
	li	s1, 0
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 104(sp)
	lw	s0, 104(sp)
	lw	s1, 96(sp)
	sw	s1, 0(s0)
	li	s0, 0
	li	s1, 2
	sub	s2, s0, s1
	sw	s2, 108(sp)
	la	s0, dx
	lw	s1, 0(s0)
	sw	s1, 112(sp)
	lw	s2, 112(sp)
	li	s1, 1
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 116(sp)
	lw	s0, 116(sp)
	lw	s1, 108(sp)
	sw	s1, 0(s0)
	la	s0, dy
	lw	s1, 0(s0)
	sw	s1, 120(sp)
	lw	s2, 120(sp)
	li	s1, 1
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 124(sp)
	lw	s0, 124(sp)
	li	s1, 1
	sw	s1, 0(s0)
	la	s0, dx
	lw	s1, 0(s0)
	sw	s1, 128(sp)
	lw	s2, 128(sp)
	li	s1, 2
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 132(sp)
	lw	s0, 132(sp)
	li	s1, 2
	sw	s1, 0(s0)
	li	s0, 0
	li	s1, 1
	sub	s2, s0, s1
	sw	s2, 136(sp)
	la	s0, dy
	lw	s1, 0(s0)
	sw	s1, 140(sp)
	lw	s2, 140(sp)
	li	s1, 2
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 144(sp)
	lw	s0, 144(sp)
	lw	s1, 136(sp)
	sw	s1, 0(s0)
	la	s0, dx
	lw	s1, 0(s0)
	sw	s1, 148(sp)
	lw	s2, 148(sp)
	li	s1, 3
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 152(sp)
	lw	s0, 152(sp)
	li	s1, 2
	sw	s1, 0(s0)
	la	s0, dy
	lw	s1, 0(s0)
	sw	s1, 156(sp)
	lw	s2, 156(sp)
	li	s1, 3
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 160(sp)
	lw	s0, 160(sp)
	li	s1, 1
	sw	s1, 0(s0)
	li	s0, 0
	li	s1, 1
	sub	s2, s0, s1
	sw	s2, 164(sp)
	la	s0, dx
	lw	s1, 0(s0)
	sw	s1, 168(sp)
	lw	s2, 168(sp)
	li	s1, 4
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 172(sp)
	lw	s0, 172(sp)
	lw	s1, 164(sp)
	sw	s1, 0(s0)
	li	s0, 0
	li	s1, 2
	sub	s2, s0, s1
	sw	s2, 176(sp)
	la	s0, dy
	lw	s1, 0(s0)
	sw	s1, 180(sp)
	lw	s2, 180(sp)
	li	s1, 4
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 184(sp)
	lw	s0, 184(sp)
	lw	s1, 176(sp)
	sw	s1, 0(s0)
	li	s0, 0
	li	s1, 1
	sub	s2, s0, s1
	sw	s2, 188(sp)
	la	s0, dx
	lw	s1, 0(s0)
	sw	s1, 192(sp)
	lw	s2, 192(sp)
	li	s1, 5
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 196(sp)
	lw	s0, 196(sp)
	lw	s1, 188(sp)
	sw	s1, 0(s0)
	la	s0, dy
	lw	s1, 0(s0)
	sw	s1, 200(sp)
	lw	s2, 200(sp)
	li	s1, 5
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 204(sp)
	lw	s0, 204(sp)
	li	s1, 2
	sw	s1, 0(s0)
	la	s0, dx
	lw	s1, 0(s0)
	sw	s1, 208(sp)
	lw	s2, 208(sp)
	li	s1, 6
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 212(sp)
	lw	s0, 212(sp)
	li	s1, 1
	sw	s1, 0(s0)
	li	s0, 0
	li	s1, 2
	sub	s2, s0, s1
	sw	s2, 216(sp)
	la	s0, dy
	lw	s1, 0(s0)
	sw	s1, 220(sp)
	lw	s2, 220(sp)
	li	s1, 6
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 224(sp)
	lw	s0, 224(sp)
	lw	s1, 216(sp)
	sw	s1, 0(s0)
	la	s0, dx
	lw	s1, 0(s0)
	sw	s1, 228(sp)
	lw	s2, 228(sp)
	li	s1, 7
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 232(sp)
	lw	s0, 232(sp)
	li	s1, 1
	sw	s1, 0(s0)
	la	s0, dy
	lw	s1, 0(s0)
	sw	s1, 236(sp)
	lw	s2, 236(sp)
	li	s1, 7
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 240(sp)
	lw	s0, 240(sp)
	li	s1, 2
	sw	s1, 0(s0)
	la	t0, while.cond.0
	jr t0
while.cond.0:
	la	s0, head
	lw	s1, 0(s0)
	sw	s1, 244(sp)
	la	s0, tail
	lw	s1, 0(s0)
	sw	s1, 248(sp)
	lw	s0, 244(sp)
	lw	s1, 248(sp)
	slt	s2, s1, s0
	sltiu	s3, s2, 1
	sw	s3, 252(sp)
	lw	s0, 252(sp)
	bgtz	s0, asm.branchBlock.9
	la	t0, while.end.0
	jr t0
asm.branchBlock.9:
	la	t0, while.body.0
	jr t0
while.body.0:
	la	s0, xlist
	lw	s1, 0(s0)
	sw	s1, 256(sp)
	la	s0, head
	lw	s1, 0(s0)
	sw	s1, 260(sp)
	lw	s2, 256(sp)
	lw	s1, 260(sp)
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 264(sp)
	lw	s0, 264(sp)
	lw	s1, 0(s0)
	sw	s1, 268(sp)
	la	s0, x
	lw	s1, 268(sp)
	sw	s1, 0(s0)
	la	s0, ylist
	lw	s1, 0(s0)
	sw	s1, 272(sp)
	la	s0, head
	lw	s1, 0(s0)
	sw	s1, 276(sp)
	lw	s2, 272(sp)
	lw	s1, 276(sp)
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 280(sp)
	lw	s0, 280(sp)
	lw	s1, 0(s0)
	sw	s1, 284(sp)
	la	s0, y
	lw	s1, 284(sp)
	sw	s1, 0(s0)
	la	s0, step
	lw	s1, 0(s0)
	sw	s1, 288(sp)
	la	s0, x
	lw	s1, 0(s0)
	sw	s1, 292(sp)
	lw	s2, 288(sp)
	lw	s1, 292(sp)
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 296(sp)
	lw	s0, 296(sp)
	lw	s1, 0(s0)
	sw	s1, 300(sp)
	la	s0, y
	lw	s1, 0(s0)
	sw	s1, 304(sp)
	lw	s2, 300(sp)
	lw	s1, 304(sp)
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 308(sp)
	lw	s0, 308(sp)
	lw	s1, 0(s0)
	sw	s1, 312(sp)
	la	s0, now
	lw	s1, 312(sp)
	sw	s1, 0(s0)
	la	s0, j
	li	s1, 0
	sw	s1, 0(s0)
	la	t0, for.cond.4
	jr t0
for.cond.4:
	la	s0, j
	lw	s1, 0(s0)
	sw	s1, 316(sp)
	lw	s0, 316(sp)
	li	s1, 8
	slt	s3, s0, s1
	sw	s3, 320(sp)
	lw	s0, 320(sp)
	bgtz	s0, asm.branchBlock.10
	la	t0, for.end.4
	jr t0
asm.branchBlock.10:
	la	t0, for.body.4
	jr t0
for.body.4:
	la	s0, x
	lw	s1, 0(s0)
	sw	s1, 324(sp)
	la	s0, dx
	lw	s1, 0(s0)
	sw	s1, 328(sp)
	la	s0, j
	lw	s1, 0(s0)
	sw	s1, 332(sp)
	lw	s2, 328(sp)
	lw	s1, 332(sp)
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 336(sp)
	lw	s0, 336(sp)
	lw	s1, 0(s0)
	sw	s1, 340(sp)
	lw	s0, 324(sp)
	lw	s1, 340(sp)
	add	s2, s0, s1
	sw	s2, 344(sp)
	la	s0, y
	lw	s1, 0(s0)
	sw	s1, 348(sp)
	la	s0, dy
	lw	s1, 0(s0)
	sw	s1, 352(sp)
	la	s0, j
	lw	s1, 0(s0)
	sw	s1, 356(sp)
	lw	s2, 352(sp)
	lw	s1, 356(sp)
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 360(sp)
	lw	s0, 360(sp)
	lw	s1, 0(s0)
	sw	s1, 364(sp)
	lw	s0, 348(sp)
	lw	s1, 364(sp)
	add	s2, s0, s1
	sw	s2, 368(sp)
	lw	a0, 344(sp)
	lw	a1, 368(sp)
	call	addList
	la	t0, for.update.4
	jr t0
for.update.4:
	la	s0, j
	lw	s1, 0(s0)
	sw	s1, 372(sp)
	lw	s0, 372(sp)
	li	s1, 1
	add	s2, s0, s1
	sw	s2, 376(sp)
	la	s0, j
	lw	s1, 376(sp)
	sw	s1, 0(s0)
	la	t0, for.cond.4
	jr t0
for.end.4:
	la	s0, ok
	lw	s1, 0(s0)
	sw	s1, 380(sp)
	lw	s0, 380(sp)
	li	s1, 1
	xor	s2, s0, s1
	sltiu	s3, s2, 1
	sw	s3, 384(sp)
	lw	s0, 384(sp)
	bgtz	s0, asm.branchBlock.11
	la	t0, if.else.2
	jr t0
asm.branchBlock.11:
	la	t0, if.then.2
	jr t0
if.then.2:
	la	t0, while.end.0
	jr t0
if.else.2:
	la	t0, if.endif.2
	jr t0
if.endif.2:
	la	s0, head
	lw	s1, 0(s0)
	sw	s1, 388(sp)
	lw	s0, 388(sp)
	li	s1, 1
	add	s2, s0, s1
	sw	s2, 392(sp)
	la	s0, head
	lw	s1, 392(sp)
	sw	s1, 0(s0)
	la	t0, while.cond.0
	jr t0
while.end.0:
	la	s0, ok
	lw	s1, 0(s0)
	sw	s1, 396(sp)
	lw	s0, 396(sp)
	li	s1, 1
	xor	s2, s0, s1
	sltiu	s3, s2, 1
	sw	s3, 400(sp)
	lw	s0, 400(sp)
	bgtz	s0, asm.branchBlock.12
	la	t0, if.else.3
	jr t0
asm.branchBlock.12:
	la	t0, if.then.3
	jr t0
if.then.3:
	la	s0, step
	lw	s1, 0(s0)
	sw	s1, 404(sp)
	la	s0, targetx
	lw	s1, 0(s0)
	sw	s1, 408(sp)
	lw	s2, 404(sp)
	lw	s1, 408(sp)
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 412(sp)
	lw	s0, 412(sp)
	lw	s1, 0(s0)
	sw	s1, 416(sp)
	la	s0, targety
	lw	s1, 0(s0)
	sw	s1, 420(sp)
	lw	s2, 416(sp)
	lw	s1, 420(sp)
	li	s3, 4
	mul	s4, s3, s1
	add	s2, s2, s4
	sw	s2, 424(sp)
	lw	s0, 424(sp)
	lw	s1, 0(s0)
	sw	s1, 428(sp)
	lw	a0, 428(sp)
	call	toString
	sw	a0, 432(sp)
	lw	a0, 432(sp)
	call	println
	la	t0, if.endif.3
	jr t0
if.else.3:
	la	a0, stringLiteral.0
	call	print
	la	t0, if.endif.3
	jr t0
if.endif.3:
	li	a0, 0
	lw	ra, 444(sp)
	addi	sp, sp, 448
	ret
check:
	addi	sp, sp, -48
	sw	ra, 44(sp)
	mv	s1, a0
	sw	s1, 0(sp)
	lw	s1, 0(sp)
	sw	s1, 4(sp)
	la	s0, N
	lw	s1, 0(s0)
	sw	s1, 8(sp)
	lw	s0, 4(sp)
	lw	s1, 8(sp)
	slt	s3, s0, s1
	sw	s3, 12(sp)
	li	s1, 0
	sw	s1, 16(sp)
	lw	s0, 12(sp)
	bgtz	s0, asm.branchBlock.13
	la	t0, LogicBinary.end.0
	jr t0
asm.branchBlock.13:
	la	t0, LogicBinary.second.0
	jr t0
LogicBinary.second.0:
	lw	s1, 0(sp)
	sw	s1, 20(sp)
	lw	s0, 20(sp)
	li	s1, 0
	slt	s2, s0, s1
	sltiu	s3, s2, 1
	sw	s3, 24(sp)
	lw	s1, 24(sp)
	sw	s1, 16(sp)
	la	t0, LogicBinary.end.0
	jr t0
LogicBinary.end.0:
	lw	s1, 16(sp)
	sw	s1, 28(sp)
	lw	a0, 28(sp)
	lw	ra, 44(sp)
	addi	sp, sp, 48
	ret
global.init:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	li	a0, 4
	li	a1, 12000
	call	builtin.calloc_array
	sw	a0, 0(sp)
	la	s0, xlist
	lw	s1, 0(sp)
	sw	s1, 0(s0)
	li	a0, 4
	li	a1, 12000
	call	builtin.calloc_array
	sw	a0, 4(sp)
	la	s0, ylist
	lw	s1, 4(sp)
	sw	s1, 0(s0)
	li	a0, 4
	li	a1, 8
	call	builtin.calloc_array
	sw	a0, 8(sp)
	la	s0, dx
	lw	s1, 8(sp)
	sw	s1, 0(s0)
	li	a0, 4
	li	a1, 9
	call	builtin.calloc_array
	sw	a0, 12(sp)
	la	s0, dy
	lw	s1, 12(sp)
	sw	s1, 0(s0)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret

.data
N:
	.word 0
head:
	.word 0
startx:
	.word 0
starty:
	.word 0
targetx:
	.word 0
targety:
	.word 0
x:
	.word 0
y:
	.word 0
xlist:
	.word 0
ylist:
	.word 0
tail:
	.word 0
ok:
	.word 0
now:
	.word 0
dx:
	.word 0
dy:
	.word 0
step:
	.word 0
i:
	.word 0
j:
	.word 0

.rodata
stringLiteral.0:
	.asciz "no solution!\n"

