.text
	.globl main
main:
	li	t0, -2224
	add	sp, t0, sp
	li	t0, 2220
	add	t0, t0, sp
	sw	ra, 0(t0)
	call	global.init
	li	t1, 0
	sw	t1, 0(sp)
	la	t0, while.cond.0
	jr t0
while.cond.0:
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 4(sp)
	li	t0, 1
	li	t1, 29
	sll	t2, t0, t1
	sw	t2, 8(sp)
	lw	t0, 4(sp)
	lw	t1, 8(sp)
	slt	t3, t0, t1
	sw	t3, 12(sp)
	li	t1, 0
	sw	t1, 16(sp)
	lw	t0, 12(sp)
	bgtz	t0, asm.branchBlock.0
	la	t0, LogicBinary.end.0
	jr t0
asm.branchBlock.0:
	la	t0, LogicBinary.second.0
	jr t0
LogicBinary.second.0:
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 20(sp)
	li	t0, 1
	li	t1, 29
	sll	t2, t0, t1
	sw	t2, 24(sp)
	li	t0, 0
	lw	t1, 24(sp)
	sub	t2, t0, t1
	sw	t2, 28(sp)
	lw	t0, 20(sp)
	lw	t1, 28(sp)
	slt	t3, t1, t0
	sw	t3, 32(sp)
	lw	t1, 32(sp)
	sw	t1, 16(sp)
	la	t0, LogicBinary.end.0
	jr t0
LogicBinary.end.0:
	lw	t1, 16(sp)
	sw	t1, 36(sp)
	lw	t0, 36(sp)
	bgtz	t0, asm.branchBlock.1
	la	t0, while.end.0
	jr t0
asm.branchBlock.1:
	la	t0, while.body.0
	jr t0
while.body.0:
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 44(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 48(sp)
	lw	t0, 44(sp)
	lw	t1, 48(sp)
	sub	t2, t0, t1
	sw	t2, 52(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 56(sp)
	lw	t0, 52(sp)
	lw	t1, 56(sp)
	add	t2, t0, t1
	sw	t2, 60(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 64(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 68(sp)
	lw	t0, 64(sp)
	lw	t1, 68(sp)
	add	t2, t0, t1
	sw	t2, 72(sp)
	lw	t0, 60(sp)
	lw	t1, 72(sp)
	sub	t2, t0, t1
	sw	t2, 76(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 80(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 84(sp)
	lw	t0, 80(sp)
	lw	t1, 84(sp)
	sub	t2, t0, t1
	sw	t2, 88(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 92(sp)
	lw	t0, 88(sp)
	lw	t1, 92(sp)
	add	t2, t0, t1
	sw	t2, 96(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 100(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 104(sp)
	lw	t0, 100(sp)
	lw	t1, 104(sp)
	add	t2, t0, t1
	sw	t2, 108(sp)
	lw	t0, 96(sp)
	lw	t1, 108(sp)
	sub	t2, t0, t1
	sw	t2, 112(sp)
	lw	t0, 76(sp)
	lw	t1, 112(sp)
	add	t2, t0, t1
	sw	t2, 116(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 120(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 124(sp)
	lw	t0, 120(sp)
	lw	t1, 124(sp)
	sub	t2, t0, t1
	sw	t2, 128(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 132(sp)
	lw	t0, 128(sp)
	lw	t1, 132(sp)
	add	t2, t0, t1
	sw	t2, 136(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 140(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 144(sp)
	lw	t0, 140(sp)
	lw	t1, 144(sp)
	add	t2, t0, t1
	sw	t2, 148(sp)
	lw	t0, 136(sp)
	lw	t1, 148(sp)
	sub	t2, t0, t1
	sw	t2, 152(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 156(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 160(sp)
	lw	t0, 156(sp)
	lw	t1, 160(sp)
	sub	t2, t0, t1
	sw	t2, 164(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 168(sp)
	lw	t0, 164(sp)
	lw	t1, 168(sp)
	add	t2, t0, t1
	sw	t2, 172(sp)
	lw	t0, 152(sp)
	lw	t1, 172(sp)
	add	t2, t0, t1
	sw	t2, 176(sp)
	lw	t0, 116(sp)
	lw	t1, 176(sp)
	add	t2, t0, t1
	sw	t2, 180(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 184(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 188(sp)
	lw	t0, 184(sp)
	lw	t1, 188(sp)
	add	t2, t0, t1
	sw	t2, 192(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 196(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 200(sp)
	lw	t0, 196(sp)
	lw	t1, 200(sp)
	sub	t2, t0, t1
	sw	t2, 204(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 208(sp)
	lw	t0, 204(sp)
	lw	t1, 208(sp)
	add	t2, t0, t1
	sw	t2, 212(sp)
	lw	t0, 192(sp)
	lw	t1, 212(sp)
	add	t2, t0, t1
	sw	t2, 216(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 220(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 224(sp)
	lw	t0, 220(sp)
	lw	t1, 224(sp)
	add	t2, t0, t1
	sw	t2, 228(sp)
	lw	t0, 216(sp)
	lw	t1, 228(sp)
	sub	t2, t0, t1
	sw	t2, 232(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 236(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 240(sp)
	lw	t0, 236(sp)
	lw	t1, 240(sp)
	sub	t2, t0, t1
	sw	t2, 244(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 248(sp)
	lw	t0, 244(sp)
	lw	t1, 248(sp)
	add	t2, t0, t1
	sw	t2, 252(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 256(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 260(sp)
	lw	t0, 256(sp)
	lw	t1, 260(sp)
	add	t2, t0, t1
	sw	t2, 264(sp)
	lw	t0, 252(sp)
	lw	t1, 264(sp)
	sub	t2, t0, t1
	sw	t2, 268(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 272(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 276(sp)
	lw	t0, 272(sp)
	lw	t1, 276(sp)
	sub	t2, t0, t1
	sw	t2, 280(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 284(sp)
	lw	t0, 280(sp)
	lw	t1, 284(sp)
	add	t2, t0, t1
	sw	t2, 288(sp)
	lw	t0, 268(sp)
	lw	t1, 288(sp)
	add	t2, t0, t1
	sw	t2, 292(sp)
	lw	t0, 232(sp)
	lw	t1, 292(sp)
	add	t2, t0, t1
	sw	t2, 296(sp)
	lw	t0, 180(sp)
	lw	t1, 296(sp)
	sub	t2, t0, t1
	sw	t2, 300(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 304(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 308(sp)
	lw	t0, 304(sp)
	lw	t1, 308(sp)
	add	t2, t0, t1
	sw	t2, 312(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 316(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 320(sp)
	lw	t0, 316(sp)
	lw	t1, 320(sp)
	sub	t2, t0, t1
	sw	t2, 324(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 328(sp)
	lw	t0, 324(sp)
	lw	t1, 328(sp)
	add	t2, t0, t1
	sw	t2, 332(sp)
	lw	t0, 312(sp)
	lw	t1, 332(sp)
	add	t2, t0, t1
	sw	t2, 336(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 340(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 344(sp)
	lw	t0, 340(sp)
	lw	t1, 344(sp)
	add	t2, t0, t1
	sw	t2, 348(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 352(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 356(sp)
	lw	t0, 352(sp)
	lw	t1, 356(sp)
	sub	t2, t0, t1
	sw	t2, 360(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 364(sp)
	lw	t0, 360(sp)
	lw	t1, 364(sp)
	add	t2, t0, t1
	sw	t2, 368(sp)
	lw	t0, 348(sp)
	lw	t1, 368(sp)
	add	t2, t0, t1
	sw	t2, 372(sp)
	lw	t0, 336(sp)
	lw	t1, 372(sp)
	sub	t2, t0, t1
	sw	t2, 376(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 380(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 384(sp)
	lw	t0, 380(sp)
	lw	t1, 384(sp)
	add	t2, t0, t1
	sw	t2, 388(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 392(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 396(sp)
	lw	t0, 392(sp)
	lw	t1, 396(sp)
	sub	t2, t0, t1
	sw	t2, 400(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 404(sp)
	lw	t0, 400(sp)
	lw	t1, 404(sp)
	add	t2, t0, t1
	sw	t2, 408(sp)
	lw	t0, 388(sp)
	lw	t1, 408(sp)
	add	t2, t0, t1
	sw	t2, 412(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 416(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 420(sp)
	lw	t0, 416(sp)
	lw	t1, 420(sp)
	add	t2, t0, t1
	sw	t2, 424(sp)
	lw	t0, 412(sp)
	lw	t1, 424(sp)
	sub	t2, t0, t1
	sw	t2, 428(sp)
	lw	t0, 376(sp)
	lw	t1, 428(sp)
	sub	t2, t0, t1
	sw	t2, 432(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 436(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 440(sp)
	lw	t0, 436(sp)
	lw	t1, 440(sp)
	sub	t2, t0, t1
	sw	t2, 444(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 448(sp)
	lw	t0, 444(sp)
	lw	t1, 448(sp)
	add	t2, t0, t1
	sw	t2, 452(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 456(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 460(sp)
	lw	t0, 456(sp)
	lw	t1, 460(sp)
	add	t2, t0, t1
	sw	t2, 464(sp)
	lw	t0, 452(sp)
	lw	t1, 464(sp)
	sub	t2, t0, t1
	sw	t2, 468(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 472(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 476(sp)
	lw	t0, 472(sp)
	lw	t1, 476(sp)
	sub	t2, t0, t1
	sw	t2, 480(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 484(sp)
	lw	t0, 480(sp)
	lw	t1, 484(sp)
	add	t2, t0, t1
	sw	t2, 488(sp)
	lw	t0, 468(sp)
	lw	t1, 488(sp)
	add	t2, t0, t1
	sw	t2, 492(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 496(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 500(sp)
	lw	t0, 496(sp)
	lw	t1, 500(sp)
	add	t2, t0, t1
	sw	t2, 504(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 508(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 512(sp)
	lw	t0, 508(sp)
	lw	t1, 512(sp)
	sub	t2, t0, t1
	sw	t2, 516(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 520(sp)
	lw	t0, 516(sp)
	lw	t1, 520(sp)
	add	t2, t0, t1
	sw	t2, 524(sp)
	lw	t0, 504(sp)
	lw	t1, 524(sp)
	add	t2, t0, t1
	sw	t2, 528(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 532(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 536(sp)
	lw	t0, 532(sp)
	lw	t1, 536(sp)
	add	t2, t0, t1
	sw	t2, 540(sp)
	lw	t0, 528(sp)
	lw	t1, 540(sp)
	sub	t2, t0, t1
	sw	t2, 544(sp)
	lw	t0, 492(sp)
	lw	t1, 544(sp)
	sub	t2, t0, t1
	sw	t2, 548(sp)
	lw	t0, 432(sp)
	lw	t1, 548(sp)
	add	t2, t0, t1
	sw	t2, 552(sp)
	lw	t0, 300(sp)
	lw	t1, 552(sp)
	sub	t2, t0, t1
	sw	t2, 556(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 560(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 564(sp)
	lw	t0, 560(sp)
	lw	t1, 564(sp)
	sub	t2, t0, t1
	sw	t2, 568(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 572(sp)
	lw	t0, 568(sp)
	lw	t1, 572(sp)
	add	t2, t0, t1
	sw	t2, 576(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 580(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 584(sp)
	lw	t0, 580(sp)
	lw	t1, 584(sp)
	add	t2, t0, t1
	sw	t2, 588(sp)
	lw	t0, 576(sp)
	lw	t1, 588(sp)
	sub	t2, t0, t1
	sw	t2, 592(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 596(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 600(sp)
	lw	t0, 596(sp)
	lw	t1, 600(sp)
	sub	t2, t0, t1
	sw	t2, 604(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 608(sp)
	lw	t0, 604(sp)
	lw	t1, 608(sp)
	add	t2, t0, t1
	sw	t2, 612(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 616(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 620(sp)
	lw	t0, 616(sp)
	lw	t1, 620(sp)
	add	t2, t0, t1
	sw	t2, 624(sp)
	lw	t0, 612(sp)
	lw	t1, 624(sp)
	sub	t2, t0, t1
	sw	t2, 628(sp)
	lw	t0, 592(sp)
	lw	t1, 628(sp)
	add	t2, t0, t1
	sw	t2, 632(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 636(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 640(sp)
	lw	t0, 636(sp)
	lw	t1, 640(sp)
	sub	t2, t0, t1
	sw	t2, 644(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 648(sp)
	lw	t0, 644(sp)
	lw	t1, 648(sp)
	add	t2, t0, t1
	sw	t2, 652(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 656(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 660(sp)
	lw	t0, 656(sp)
	lw	t1, 660(sp)
	add	t2, t0, t1
	sw	t2, 664(sp)
	lw	t0, 652(sp)
	lw	t1, 664(sp)
	sub	t2, t0, t1
	sw	t2, 668(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 672(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 676(sp)
	lw	t0, 672(sp)
	lw	t1, 676(sp)
	sub	t2, t0, t1
	sw	t2, 680(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 684(sp)
	lw	t0, 680(sp)
	lw	t1, 684(sp)
	add	t2, t0, t1
	sw	t2, 688(sp)
	lw	t0, 668(sp)
	lw	t1, 688(sp)
	add	t2, t0, t1
	sw	t2, 692(sp)
	lw	t0, 632(sp)
	lw	t1, 692(sp)
	add	t2, t0, t1
	sw	t2, 696(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 700(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 704(sp)
	lw	t0, 700(sp)
	lw	t1, 704(sp)
	add	t2, t0, t1
	sw	t2, 708(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 712(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 716(sp)
	lw	t0, 712(sp)
	lw	t1, 716(sp)
	sub	t2, t0, t1
	sw	t2, 720(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 724(sp)
	lw	t0, 720(sp)
	lw	t1, 724(sp)
	add	t2, t0, t1
	sw	t2, 728(sp)
	lw	t0, 708(sp)
	lw	t1, 728(sp)
	add	t2, t0, t1
	sw	t2, 732(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 736(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 740(sp)
	lw	t0, 736(sp)
	lw	t1, 740(sp)
	add	t2, t0, t1
	sw	t2, 744(sp)
	lw	t0, 732(sp)
	lw	t1, 744(sp)
	sub	t2, t0, t1
	sw	t2, 748(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 752(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 756(sp)
	lw	t0, 752(sp)
	lw	t1, 756(sp)
	sub	t2, t0, t1
	sw	t2, 760(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 764(sp)
	lw	t0, 760(sp)
	lw	t1, 764(sp)
	add	t2, t0, t1
	sw	t2, 768(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 772(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 776(sp)
	lw	t0, 772(sp)
	lw	t1, 776(sp)
	add	t2, t0, t1
	sw	t2, 780(sp)
	lw	t0, 768(sp)
	lw	t1, 780(sp)
	sub	t2, t0, t1
	sw	t2, 784(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 788(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 792(sp)
	lw	t0, 788(sp)
	lw	t1, 792(sp)
	sub	t2, t0, t1
	sw	t2, 796(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 800(sp)
	lw	t0, 796(sp)
	lw	t1, 800(sp)
	add	t2, t0, t1
	sw	t2, 804(sp)
	lw	t0, 784(sp)
	lw	t1, 804(sp)
	add	t2, t0, t1
	sw	t2, 808(sp)
	lw	t0, 748(sp)
	lw	t1, 808(sp)
	add	t2, t0, t1
	sw	t2, 812(sp)
	lw	t0, 696(sp)
	lw	t1, 812(sp)
	sub	t2, t0, t1
	sw	t2, 816(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 820(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 824(sp)
	lw	t0, 820(sp)
	lw	t1, 824(sp)
	add	t2, t0, t1
	sw	t2, 828(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 832(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 836(sp)
	lw	t0, 832(sp)
	lw	t1, 836(sp)
	sub	t2, t0, t1
	sw	t2, 840(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 844(sp)
	lw	t0, 840(sp)
	lw	t1, 844(sp)
	add	t2, t0, t1
	sw	t2, 848(sp)
	lw	t0, 828(sp)
	lw	t1, 848(sp)
	add	t2, t0, t1
	sw	t2, 852(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 856(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 860(sp)
	lw	t0, 856(sp)
	lw	t1, 860(sp)
	add	t2, t0, t1
	sw	t2, 864(sp)
	lw	t0, 852(sp)
	lw	t1, 864(sp)
	sub	t2, t0, t1
	sw	t2, 868(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 872(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 876(sp)
	lw	t0, 872(sp)
	lw	t1, 876(sp)
	sub	t2, t0, t1
	sw	t2, 880(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 884(sp)
	lw	t0, 880(sp)
	lw	t1, 884(sp)
	add	t2, t0, t1
	sw	t2, 888(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 892(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 896(sp)
	lw	t0, 892(sp)
	lw	t1, 896(sp)
	add	t2, t0, t1
	sw	t2, 900(sp)
	lw	t0, 888(sp)
	lw	t1, 900(sp)
	sub	t2, t0, t1
	sw	t2, 904(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 908(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 912(sp)
	lw	t0, 908(sp)
	lw	t1, 912(sp)
	sub	t2, t0, t1
	sw	t2, 916(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 920(sp)
	lw	t0, 916(sp)
	lw	t1, 920(sp)
	add	t2, t0, t1
	sw	t2, 924(sp)
	lw	t0, 904(sp)
	lw	t1, 924(sp)
	add	t2, t0, t1
	sw	t2, 928(sp)
	lw	t0, 868(sp)
	lw	t1, 928(sp)
	add	t2, t0, t1
	sw	t2, 932(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 936(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 940(sp)
	lw	t0, 936(sp)
	lw	t1, 940(sp)
	add	t2, t0, t1
	sw	t2, 944(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 948(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 952(sp)
	lw	t0, 948(sp)
	lw	t1, 952(sp)
	sub	t2, t0, t1
	sw	t2, 956(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 960(sp)
	lw	t0, 956(sp)
	lw	t1, 960(sp)
	add	t2, t0, t1
	sw	t2, 964(sp)
	lw	t0, 944(sp)
	lw	t1, 964(sp)
	add	t2, t0, t1
	sw	t2, 968(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 972(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 976(sp)
	lw	t0, 972(sp)
	lw	t1, 976(sp)
	add	t2, t0, t1
	sw	t2, 980(sp)
	lw	t0, 968(sp)
	lw	t1, 980(sp)
	sub	t2, t0, t1
	sw	t2, 984(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 988(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 992(sp)
	lw	t0, 988(sp)
	lw	t1, 992(sp)
	sub	t2, t0, t1
	sw	t2, 996(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1000(sp)
	lw	t0, 996(sp)
	lw	t1, 1000(sp)
	add	t2, t0, t1
	sw	t2, 1004(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1008(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1012(sp)
	lw	t0, 1008(sp)
	lw	t1, 1012(sp)
	add	t2, t0, t1
	sw	t2, 1016(sp)
	lw	t0, 1004(sp)
	lw	t1, 1016(sp)
	sub	t2, t0, t1
	sw	t2, 1020(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1024(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1028(sp)
	lw	t0, 1024(sp)
	lw	t1, 1028(sp)
	sub	t2, t0, t1
	sw	t2, 1032(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1036(sp)
	lw	t0, 1032(sp)
	lw	t1, 1036(sp)
	add	t2, t0, t1
	sw	t2, 1040(sp)
	lw	t0, 1020(sp)
	lw	t1, 1040(sp)
	add	t2, t0, t1
	sw	t2, 1044(sp)
	lw	t0, 984(sp)
	lw	t1, 1044(sp)
	add	t2, t0, t1
	sw	t2, 1048(sp)
	lw	t0, 932(sp)
	lw	t1, 1048(sp)
	sub	t2, t0, t1
	sw	t2, 1052(sp)
	lw	t0, 816(sp)
	lw	t1, 1052(sp)
	sub	t2, t0, t1
	sw	t2, 1056(sp)
	lw	t0, 556(sp)
	lw	t1, 1056(sp)
	add	t2, t0, t1
	sw	t2, 1060(sp)
	lw	t1, 1060(sp)
	sw	t1, 40(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1068(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1072(sp)
	lw	t0, 1068(sp)
	lw	t1, 1072(sp)
	add	t2, t0, t1
	sw	t2, 1076(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1080(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1084(sp)
	lw	t0, 1080(sp)
	lw	t1, 1084(sp)
	sub	t2, t0, t1
	sw	t2, 1088(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1092(sp)
	lw	t0, 1088(sp)
	lw	t1, 1092(sp)
	add	t2, t0, t1
	sw	t2, 1096(sp)
	lw	t0, 1076(sp)
	lw	t1, 1096(sp)
	add	t2, t0, t1
	sw	t2, 1100(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1104(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1108(sp)
	lw	t0, 1104(sp)
	lw	t1, 1108(sp)
	add	t2, t0, t1
	sw	t2, 1112(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1116(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1120(sp)
	lw	t0, 1116(sp)
	lw	t1, 1120(sp)
	sub	t2, t0, t1
	sw	t2, 1124(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1128(sp)
	lw	t0, 1124(sp)
	lw	t1, 1128(sp)
	add	t2, t0, t1
	sw	t2, 1132(sp)
	lw	t0, 1112(sp)
	lw	t1, 1132(sp)
	add	t2, t0, t1
	sw	t2, 1136(sp)
	lw	t0, 1100(sp)
	lw	t1, 1136(sp)
	sub	t2, t0, t1
	sw	t2, 1140(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1144(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1148(sp)
	lw	t0, 1144(sp)
	lw	t1, 1148(sp)
	add	t2, t0, t1
	sw	t2, 1152(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1156(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1160(sp)
	lw	t0, 1156(sp)
	lw	t1, 1160(sp)
	sub	t2, t0, t1
	sw	t2, 1164(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1168(sp)
	lw	t0, 1164(sp)
	lw	t1, 1168(sp)
	add	t2, t0, t1
	sw	t2, 1172(sp)
	lw	t0, 1152(sp)
	lw	t1, 1172(sp)
	add	t2, t0, t1
	sw	t2, 1176(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1180(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1184(sp)
	lw	t0, 1180(sp)
	lw	t1, 1184(sp)
	add	t2, t0, t1
	sw	t2, 1188(sp)
	lw	t0, 1176(sp)
	lw	t1, 1188(sp)
	sub	t2, t0, t1
	sw	t2, 1192(sp)
	lw	t0, 1140(sp)
	lw	t1, 1192(sp)
	sub	t2, t0, t1
	sw	t2, 1196(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1200(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1204(sp)
	lw	t0, 1200(sp)
	lw	t1, 1204(sp)
	sub	t2, t0, t1
	sw	t2, 1208(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1212(sp)
	lw	t0, 1208(sp)
	lw	t1, 1212(sp)
	add	t2, t0, t1
	sw	t2, 1216(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1220(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1224(sp)
	lw	t0, 1220(sp)
	lw	t1, 1224(sp)
	add	t2, t0, t1
	sw	t2, 1228(sp)
	lw	t0, 1216(sp)
	lw	t1, 1228(sp)
	sub	t2, t0, t1
	sw	t2, 1232(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1236(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1240(sp)
	lw	t0, 1236(sp)
	lw	t1, 1240(sp)
	sub	t2, t0, t1
	sw	t2, 1244(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1248(sp)
	lw	t0, 1244(sp)
	lw	t1, 1248(sp)
	add	t2, t0, t1
	sw	t2, 1252(sp)
	lw	t0, 1232(sp)
	lw	t1, 1252(sp)
	add	t2, t0, t1
	sw	t2, 1256(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1260(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1264(sp)
	lw	t0, 1260(sp)
	lw	t1, 1264(sp)
	add	t2, t0, t1
	sw	t2, 1268(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1272(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1276(sp)
	lw	t0, 1272(sp)
	lw	t1, 1276(sp)
	sub	t2, t0, t1
	sw	t2, 1280(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1284(sp)
	lw	t0, 1280(sp)
	lw	t1, 1284(sp)
	add	t2, t0, t1
	sw	t2, 1288(sp)
	lw	t0, 1268(sp)
	lw	t1, 1288(sp)
	add	t2, t0, t1
	sw	t2, 1292(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1296(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1300(sp)
	lw	t0, 1296(sp)
	lw	t1, 1300(sp)
	add	t2, t0, t1
	sw	t2, 1304(sp)
	lw	t0, 1292(sp)
	lw	t1, 1304(sp)
	sub	t2, t0, t1
	sw	t2, 1308(sp)
	lw	t0, 1256(sp)
	lw	t1, 1308(sp)
	sub	t2, t0, t1
	sw	t2, 1312(sp)
	lw	t0, 1196(sp)
	lw	t1, 1312(sp)
	add	t2, t0, t1
	sw	t2, 1316(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1320(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1324(sp)
	lw	t0, 1320(sp)
	lw	t1, 1324(sp)
	sub	t2, t0, t1
	sw	t2, 1328(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1332(sp)
	lw	t0, 1328(sp)
	lw	t1, 1332(sp)
	add	t2, t0, t1
	sw	t2, 1336(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1340(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1344(sp)
	lw	t0, 1340(sp)
	lw	t1, 1344(sp)
	add	t2, t0, t1
	sw	t2, 1348(sp)
	lw	t0, 1336(sp)
	lw	t1, 1348(sp)
	sub	t2, t0, t1
	sw	t2, 1352(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1356(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1360(sp)
	lw	t0, 1356(sp)
	lw	t1, 1360(sp)
	sub	t2, t0, t1
	sw	t2, 1364(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1368(sp)
	lw	t0, 1364(sp)
	lw	t1, 1368(sp)
	add	t2, t0, t1
	sw	t2, 1372(sp)
	lw	t0, 1352(sp)
	lw	t1, 1372(sp)
	add	t2, t0, t1
	sw	t2, 1376(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1380(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1384(sp)
	lw	t0, 1380(sp)
	lw	t1, 1384(sp)
	add	t2, t0, t1
	sw	t2, 1388(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1392(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1396(sp)
	lw	t0, 1392(sp)
	lw	t1, 1396(sp)
	sub	t2, t0, t1
	sw	t2, 1400(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1404(sp)
	lw	t0, 1400(sp)
	lw	t1, 1404(sp)
	add	t2, t0, t1
	sw	t2, 1408(sp)
	lw	t0, 1388(sp)
	lw	t1, 1408(sp)
	add	t2, t0, t1
	sw	t2, 1412(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1416(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1420(sp)
	lw	t0, 1416(sp)
	lw	t1, 1420(sp)
	add	t2, t0, t1
	sw	t2, 1424(sp)
	lw	t0, 1412(sp)
	lw	t1, 1424(sp)
	sub	t2, t0, t1
	sw	t2, 1428(sp)
	lw	t0, 1376(sp)
	lw	t1, 1428(sp)
	sub	t2, t0, t1
	sw	t2, 1432(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1436(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1440(sp)
	lw	t0, 1436(sp)
	lw	t1, 1440(sp)
	sub	t2, t0, t1
	sw	t2, 1444(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1448(sp)
	lw	t0, 1444(sp)
	lw	t1, 1448(sp)
	add	t2, t0, t1
	sw	t2, 1452(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1456(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1460(sp)
	lw	t0, 1456(sp)
	lw	t1, 1460(sp)
	add	t2, t0, t1
	sw	t2, 1464(sp)
	lw	t0, 1452(sp)
	lw	t1, 1464(sp)
	sub	t2, t0, t1
	sw	t2, 1468(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1472(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1476(sp)
	lw	t0, 1472(sp)
	lw	t1, 1476(sp)
	sub	t2, t0, t1
	sw	t2, 1480(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1484(sp)
	lw	t0, 1480(sp)
	lw	t1, 1484(sp)
	add	t2, t0, t1
	sw	t2, 1488(sp)
	lw	t0, 1468(sp)
	lw	t1, 1488(sp)
	add	t2, t0, t1
	sw	t2, 1492(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1496(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1500(sp)
	lw	t0, 1496(sp)
	lw	t1, 1500(sp)
	add	t2, t0, t1
	sw	t2, 1504(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1508(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1512(sp)
	lw	t0, 1508(sp)
	lw	t1, 1512(sp)
	sub	t2, t0, t1
	sw	t2, 1516(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1520(sp)
	lw	t0, 1516(sp)
	lw	t1, 1520(sp)
	add	t2, t0, t1
	sw	t2, 1524(sp)
	lw	t0, 1504(sp)
	lw	t1, 1524(sp)
	add	t2, t0, t1
	sw	t2, 1528(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1532(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1536(sp)
	lw	t0, 1532(sp)
	lw	t1, 1536(sp)
	add	t2, t0, t1
	sw	t2, 1540(sp)
	lw	t0, 1528(sp)
	lw	t1, 1540(sp)
	sub	t2, t0, t1
	sw	t2, 1544(sp)
	lw	t0, 1492(sp)
	lw	t1, 1544(sp)
	sub	t2, t0, t1
	sw	t2, 1548(sp)
	lw	t0, 1432(sp)
	lw	t1, 1548(sp)
	add	t2, t0, t1
	sw	t2, 1552(sp)
	lw	t0, 1316(sp)
	lw	t1, 1552(sp)
	add	t2, t0, t1
	sw	t2, 1556(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1560(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1564(sp)
	lw	t0, 1560(sp)
	lw	t1, 1564(sp)
	sub	t2, t0, t1
	sw	t2, 1568(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1572(sp)
	lw	t0, 1568(sp)
	lw	t1, 1572(sp)
	add	t2, t0, t1
	sw	t2, 1576(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1580(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1584(sp)
	lw	t0, 1580(sp)
	lw	t1, 1584(sp)
	add	t2, t0, t1
	sw	t2, 1588(sp)
	lw	t0, 1576(sp)
	lw	t1, 1588(sp)
	sub	t2, t0, t1
	sw	t2, 1592(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1596(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1600(sp)
	lw	t0, 1596(sp)
	lw	t1, 1600(sp)
	sub	t2, t0, t1
	sw	t2, 1604(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1608(sp)
	lw	t0, 1604(sp)
	lw	t1, 1608(sp)
	add	t2, t0, t1
	sw	t2, 1612(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1616(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1620(sp)
	lw	t0, 1616(sp)
	lw	t1, 1620(sp)
	add	t2, t0, t1
	sw	t2, 1624(sp)
	lw	t0, 1612(sp)
	lw	t1, 1624(sp)
	sub	t2, t0, t1
	sw	t2, 1628(sp)
	lw	t0, 1592(sp)
	lw	t1, 1628(sp)
	add	t2, t0, t1
	sw	t2, 1632(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1636(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1640(sp)
	lw	t0, 1636(sp)
	lw	t1, 1640(sp)
	sub	t2, t0, t1
	sw	t2, 1644(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1648(sp)
	lw	t0, 1644(sp)
	lw	t1, 1648(sp)
	add	t2, t0, t1
	sw	t2, 1652(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1656(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1660(sp)
	lw	t0, 1656(sp)
	lw	t1, 1660(sp)
	add	t2, t0, t1
	sw	t2, 1664(sp)
	lw	t0, 1652(sp)
	lw	t1, 1664(sp)
	sub	t2, t0, t1
	sw	t2, 1668(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1672(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1676(sp)
	lw	t0, 1672(sp)
	lw	t1, 1676(sp)
	sub	t2, t0, t1
	sw	t2, 1680(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1684(sp)
	lw	t0, 1680(sp)
	lw	t1, 1684(sp)
	add	t2, t0, t1
	sw	t2, 1688(sp)
	lw	t0, 1668(sp)
	lw	t1, 1688(sp)
	add	t2, t0, t1
	sw	t2, 1692(sp)
	lw	t0, 1632(sp)
	lw	t1, 1692(sp)
	add	t2, t0, t1
	sw	t2, 1696(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1700(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1704(sp)
	lw	t0, 1700(sp)
	lw	t1, 1704(sp)
	add	t2, t0, t1
	sw	t2, 1708(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1712(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1716(sp)
	lw	t0, 1712(sp)
	lw	t1, 1716(sp)
	sub	t2, t0, t1
	sw	t2, 1720(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1724(sp)
	lw	t0, 1720(sp)
	lw	t1, 1724(sp)
	add	t2, t0, t1
	sw	t2, 1728(sp)
	lw	t0, 1708(sp)
	lw	t1, 1728(sp)
	add	t2, t0, t1
	sw	t2, 1732(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1736(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1740(sp)
	lw	t0, 1736(sp)
	lw	t1, 1740(sp)
	add	t2, t0, t1
	sw	t2, 1744(sp)
	lw	t0, 1732(sp)
	lw	t1, 1744(sp)
	sub	t2, t0, t1
	sw	t2, 1748(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1752(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1756(sp)
	lw	t0, 1752(sp)
	lw	t1, 1756(sp)
	sub	t2, t0, t1
	sw	t2, 1760(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1764(sp)
	lw	t0, 1760(sp)
	lw	t1, 1764(sp)
	add	t2, t0, t1
	sw	t2, 1768(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1772(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1776(sp)
	lw	t0, 1772(sp)
	lw	t1, 1776(sp)
	add	t2, t0, t1
	sw	t2, 1780(sp)
	lw	t0, 1768(sp)
	lw	t1, 1780(sp)
	sub	t2, t0, t1
	sw	t2, 1784(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1788(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1792(sp)
	lw	t0, 1788(sp)
	lw	t1, 1792(sp)
	sub	t2, t0, t1
	sw	t2, 1796(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1800(sp)
	lw	t0, 1796(sp)
	lw	t1, 1800(sp)
	add	t2, t0, t1
	sw	t2, 1804(sp)
	lw	t0, 1784(sp)
	lw	t1, 1804(sp)
	add	t2, t0, t1
	sw	t2, 1808(sp)
	lw	t0, 1748(sp)
	lw	t1, 1808(sp)
	add	t2, t0, t1
	sw	t2, 1812(sp)
	lw	t0, 1696(sp)
	lw	t1, 1812(sp)
	sub	t2, t0, t1
	sw	t2, 1816(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1820(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1824(sp)
	lw	t0, 1820(sp)
	lw	t1, 1824(sp)
	add	t2, t0, t1
	sw	t2, 1828(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1832(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1836(sp)
	lw	t0, 1832(sp)
	lw	t1, 1836(sp)
	sub	t2, t0, t1
	sw	t2, 1840(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1844(sp)
	lw	t0, 1840(sp)
	lw	t1, 1844(sp)
	add	t2, t0, t1
	sw	t2, 1848(sp)
	lw	t0, 1828(sp)
	lw	t1, 1848(sp)
	add	t2, t0, t1
	sw	t2, 1852(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1856(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1860(sp)
	lw	t0, 1856(sp)
	lw	t1, 1860(sp)
	add	t2, t0, t1
	sw	t2, 1864(sp)
	lw	t0, 1852(sp)
	lw	t1, 1864(sp)
	sub	t2, t0, t1
	sw	t2, 1868(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1872(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1876(sp)
	lw	t0, 1872(sp)
	lw	t1, 1876(sp)
	sub	t2, t0, t1
	sw	t2, 1880(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1884(sp)
	lw	t0, 1880(sp)
	lw	t1, 1884(sp)
	add	t2, t0, t1
	sw	t2, 1888(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1892(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1896(sp)
	lw	t0, 1892(sp)
	lw	t1, 1896(sp)
	add	t2, t0, t1
	sw	t2, 1900(sp)
	lw	t0, 1888(sp)
	lw	t1, 1900(sp)
	sub	t2, t0, t1
	sw	t2, 1904(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1908(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1912(sp)
	lw	t0, 1908(sp)
	lw	t1, 1912(sp)
	sub	t2, t0, t1
	sw	t2, 1916(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1920(sp)
	lw	t0, 1916(sp)
	lw	t1, 1920(sp)
	add	t2, t0, t1
	sw	t2, 1924(sp)
	lw	t0, 1904(sp)
	lw	t1, 1924(sp)
	add	t2, t0, t1
	sw	t2, 1928(sp)
	lw	t0, 1868(sp)
	lw	t1, 1928(sp)
	add	t2, t0, t1
	sw	t2, 1932(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1936(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1940(sp)
	lw	t0, 1936(sp)
	lw	t1, 1940(sp)
	add	t2, t0, t1
	sw	t2, 1944(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1948(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1952(sp)
	lw	t0, 1948(sp)
	lw	t1, 1952(sp)
	sub	t2, t0, t1
	sw	t2, 1956(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1960(sp)
	lw	t0, 1956(sp)
	lw	t1, 1960(sp)
	add	t2, t0, t1
	sw	t2, 1964(sp)
	lw	t0, 1944(sp)
	lw	t1, 1964(sp)
	add	t2, t0, t1
	sw	t2, 1968(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1972(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 1976(sp)
	lw	t0, 1972(sp)
	lw	t1, 1976(sp)
	add	t2, t0, t1
	sw	t2, 1980(sp)
	lw	t0, 1968(sp)
	lw	t1, 1980(sp)
	sub	t2, t0, t1
	sw	t2, 1984(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 1988(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 1992(sp)
	lw	t0, 1988(sp)
	lw	t1, 1992(sp)
	sub	t2, t0, t1
	sw	t2, 1996(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 2000(sp)
	lw	t0, 1996(sp)
	lw	t1, 2000(sp)
	add	t2, t0, t1
	sw	t2, 2004(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 2008(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 2012(sp)
	lw	t0, 2008(sp)
	lw	t1, 2012(sp)
	add	t2, t0, t1
	sw	t2, 2016(sp)
	lw	t0, 2004(sp)
	lw	t1, 2016(sp)
	sub	t2, t0, t1
	sw	t2, 2020(sp)
	la	t0, C
	lw	t1, 0(t0)
	sw	t1, 2024(sp)
	la	t0, A
	lw	t1, 0(t0)
	sw	t1, 2028(sp)
	lw	t0, 2024(sp)
	lw	t1, 2028(sp)
	sub	t2, t0, t1
	sw	t2, 2032(sp)
	la	t0, B
	lw	t1, 0(t0)
	sw	t1, 2036(sp)
	lw	t0, 2032(sp)
	lw	t1, 2036(sp)
	add	t2, t0, t1
	sw	t2, 2040(sp)
	lw	t0, 2020(sp)
	lw	t1, 2040(sp)
	add	t2, t0, t1
	sw	t2, 2044(sp)
	lw	t0, 1984(sp)
	lw	t1, 2044(sp)
	add	t2, t0, t1
	li	t0, 2048
	add	t0, t0, sp
	sw	t2, 0(t0)
	lw	t0, 1932(sp)
	li	t0, 2048
	add	t0, t0, sp
	lw	t1, 0(t0)
	sub	t2, t0, t1
	li	t0, 2052
	add	t0, t0, sp
	sw	t2, 0(t0)
	lw	t0, 1816(sp)
	li	t0, 2052
	add	t0, t0, sp
	lw	t1, 0(t0)
	sub	t2, t0, t1
	li	t0, 2056
	add	t0, t0, sp
	sw	t2, 0(t0)
	lw	t0, 1556(sp)
	li	t0, 2056
	add	t0, t0, sp
	lw	t1, 0(t0)
	add	t2, t0, t1
	li	t0, 2060
	add	t0, t0, sp
	sw	t2, 0(t0)
	li	t0, 2060
	add	t0, t0, sp
	lw	t1, 0(t0)
	sw	t1, 1064(sp)
	lw	t1, 40(sp)
	li	t0, 2064
	add	t0, t0, sp
	sw	t1, 0(t0)
	lw	t1, 1064(sp)
	li	t0, 2068
	add	t0, t0, sp
	sw	t1, 0(t0)
	li	t0, 2064
	add	t0, t0, sp
	lw	t0, 0(t0)
	li	t0, 2068
	add	t0, t0, sp
	lw	t1, 0(t0)
	sub	t2, t0, t1
	li	t0, 2072
	add	t0, t0, sp
	sw	t2, 0(t0)

	la	t0, A

	li	t0, 2072
	add	t0, t0, sp
	lw	t1, 0(t0)

	sw	t1, 0(t0)
	lw	t1, 40(sp)
	li	t0, 2076
	add	t0, t0, sp
	sw	t1, 0(t0)
	li	t0, 2076
	add	t0, t0, sp
	lw	a0, 0(t0)
	call	toString
	li	t0, 2080
	add	t0, t0, sp
	sw	a0, 0(t0)
	lw	t1, 1064(sp)
	li	t0, 2084
	add	t0, t0, sp
	sw	t1, 0(t0)
	li	t0, 2084
	add	t0, t0, sp
	lw	a0, 0(t0)
	call	toString
	li	t0, 2088
	add	t0, t0, sp
	sw	a0, 0(t0)
	lw	t1, 40(sp)
	li	t0, 2092
	add	t0, t0, sp
	sw	t1, 0(t0)
	lw	t1, 1064(sp)
	li	t0, 2096
	add	t0, t0, sp
	sw	t1, 0(t0)
	li	t0, 2092
	add	t0, t0, sp
	lw	t0, 0(t0)
	li	t0, 2096
	add	t0, t0, sp
	lw	t1, 0(t0)
	sub	t2, t0, t1
	li	t0, 2100
	add	t0, t0, sp
	sw	t2, 0(t0)
	li	t0, 2100
	add	t0, t0, sp
	lw	a0, 0(t0)
	call	toString
	li	t0, 2104
	add	t0, t0, sp
	sw	a0, 0(t0)
	la	t0, A
	lw	t1, 0(t0)
	li	t0, 2108
	add	t0, t0, sp
	sw	t1, 0(t0)
	li	t0, 2108
	add	t0, t0, sp
	lw	a0, 0(t0)
	call	toString
	li	t0, 2112
	add	t0, t0, sp
	sw	a0, 0(t0)
	la	a0, FString.0.Literal.0
	li	t0, 2080
	add	t0, t0, sp
	lw	a1, 0(t0)
	call	builtin.string_add
	li	t0, 2116
	add	t0, t0, sp
	sw	a0, 0(t0)
	li	t0, 2116
	add	t0, t0, sp
	lw	a0, 0(t0)
	la	a1, FString.0.Literal.1
	call	builtin.string_add
	li	t0, 2120
	add	t0, t0, sp
	sw	a0, 0(t0)
	li	t0, 2120
	add	t0, t0, sp
	lw	a0, 0(t0)
	li	t0, 2088
	add	t0, t0, sp
	lw	a1, 0(t0)
	call	builtin.string_add
	li	t0, 2124
	add	t0, t0, sp
	sw	a0, 0(t0)
	li	t0, 2124
	add	t0, t0, sp
	lw	a0, 0(t0)
	la	a1, FString.0.Literal.2
	call	builtin.string_add
	li	t0, 2128
	add	t0, t0, sp
	sw	a0, 0(t0)
	li	t0, 2128
	add	t0, t0, sp
	lw	a0, 0(t0)
	li	t0, 2104
	add	t0, t0, sp
	lw	a1, 0(t0)
	call	builtin.string_add
	li	t0, 2132
	add	t0, t0, sp
	sw	a0, 0(t0)
	li	t0, 2132
	add	t0, t0, sp
	lw	a0, 0(t0)
	la	a1, FString.0.Literal.3
	call	builtin.string_add
	li	t0, 2136
	add	t0, t0, sp
	sw	a0, 0(t0)
	li	t0, 2136
	add	t0, t0, sp
	lw	a0, 0(t0)
	li	t0, 2112
	add	t0, t0, sp
	lw	a1, 0(t0)
	call	builtin.string_add
	li	t0, 2140
	add	t0, t0, sp
	sw	a0, 0(t0)
	li	t0, 2140
	add	t0, t0, sp
	lw	a0, 0(t0)
	la	a1, FString.0.Literal.4
	call	builtin.string_add
	li	t0, 2144
	add	t0, t0, sp
	sw	a0, 0(t0)
	li	t0, 2144
	add	t0, t0, sp
	lw	a0, 0(t0)
	call	println
	lw	t1, 0(sp)
	li	t0, 2148
	add	t0, t0, sp
	sw	t1, 0(t0)
	li	t0, 2148
	add	t0, t0, sp
	lw	t0, 0(t0)
	li	t1, 1
	add	t2, t0, t1
	li	t0, 2152
	add	t0, t0, sp
	sw	t2, 0(t0)
	li	t0, 2152
	add	t0, t0, sp
	lw	t1, 0(t0)
	sw	t1, 0(sp)
	lw	t1, 0(sp)
	li	t0, 2156
	add	t0, t0, sp
	sw	t1, 0(t0)
	li	t0, 2156
	add	t0, t0, sp
	lw	t0, 0(t0)
	li	t1, 10
	slt	t3, t1, t0
	li	t0, 2160
	add	t0, t0, sp
	sw	t3, 0(t0)
	li	t0, 2160
	add	t0, t0, sp
	lw	t0, 0(t0)
	bgtz	t0, asm.branchBlock.2
	la	t0, if.else.0
	jr t0
asm.branchBlock.2:
	la	t0, if.then.0
	jr t0
if.then.0:
	la	t0, while.end.0
	jr t0
if.else.0:
	la	t0, if.endif.0
	jr t0
if.endif.0:
	la	t0, while.cond.0
	jr t0
while.end.0:
	la	t0, A
	lw	t1, 0(t0)
	li	t0, 2164
	add	t0, t0, sp
	sw	t1, 0(t0)
	li	t0, 2164
	add	t0, t0, sp
	lw	a0, 0(t0)
	call	toString
	li	t0, 2168
	add	t0, t0, sp
	sw	a0, 0(t0)
	la	t0, B
	lw	t1, 0(t0)
	li	t0, 2172
	add	t0, t0, sp
	sw	t1, 0(t0)
	li	t0, 2172
	add	t0, t0, sp
	lw	a0, 0(t0)
	call	toString
	li	t0, 2176
	add	t0, t0, sp
	sw	a0, 0(t0)
	la	t0, C
	lw	t1, 0(t0)
	li	t0, 2180
	add	t0, t0, sp
	sw	t1, 0(t0)
	li	t0, 2180
	add	t0, t0, sp
	lw	a0, 0(t0)
	call	toString
	li	t0, 2184
	add	t0, t0, sp
	sw	a0, 0(t0)
	la	a0, FString.1.Literal.0
	li	t0, 2168
	add	t0, t0, sp
	lw	a1, 0(t0)
	call	builtin.string_add
	li	t0, 2188
	add	t0, t0, sp
	sw	a0, 0(t0)
	li	t0, 2188
	add	t0, t0, sp
	lw	a0, 0(t0)
	la	a1, FString.1.Literal.1
	call	builtin.string_add
	li	t0, 2192
	add	t0, t0, sp
	sw	a0, 0(t0)
	li	t0, 2192
	add	t0, t0, sp
	lw	a0, 0(t0)
	li	t0, 2176
	add	t0, t0, sp
	lw	a1, 0(t0)
	call	builtin.string_add
	li	t0, 2196
	add	t0, t0, sp
	sw	a0, 0(t0)
	li	t0, 2196
	add	t0, t0, sp
	lw	a0, 0(t0)
	la	a1, FString.1.Literal.2
	call	builtin.string_add
	li	t0, 2200
	add	t0, t0, sp
	sw	a0, 0(t0)
	li	t0, 2200
	add	t0, t0, sp
	lw	a0, 0(t0)
	li	t0, 2184
	add	t0, t0, sp
	lw	a1, 0(t0)
	call	builtin.string_add
	li	t0, 2204
	add	t0, t0, sp
	sw	a0, 0(t0)
	li	t0, 2204
	add	t0, t0, sp
	lw	a0, 0(t0)
	la	a1, FString.1.Literal.3
	call	builtin.string_add
	li	t0, 2208
	add	t0, t0, sp
	sw	a0, 0(t0)
	li	t0, 2208
	add	t0, t0, sp
	lw	a0, 0(t0)
	call	println
	li	a0, 0
	li	t0, 2220
	add	t0, t0, sp
	lw	ra, 0(t0)
	li	t0, 2224
	add	sp, t0, sp
	ret
global.init:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	la	t0, A
	li	t1, 1
	sw	t1, 0(t0)
	la	t0, B
	li	t1, 1
	sw	t1, 0(t0)
	la	t0, C
	li	t1, 1
	sw	t1, 0(t0)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret

.data
A:
	.word 1
B:
	.word 1
C:
	.word 1

.rodata
FString.0.Literal.0:
	.asciz "lhs="
FString.0.Literal.1:
	.asciz ", rhs="
FString.0.Literal.2:
	.asciz ", lhs-rhs="
FString.0.Literal.3:
	.asciz ", A="
FString.0.Literal.4:
	.asciz ""
FString.1.Literal.0:
	.asciz "A="
FString.1.Literal.1:
	.asciz ", B="
FString.1.Literal.2:
	.asciz ", C="
FString.1.Literal.3:
	.asciz "\n"

