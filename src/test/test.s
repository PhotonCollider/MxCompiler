	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_c2p0_zmmul1p0"
	.file	"test.ll"
	.globl	main                            # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %main
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	call	global.init
	li	a0, 0
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	global.init                     # -- Begin function global.init
	.p2align	1
	.type	global.init,@function
global.init:                            # @global.init
	.cfi_startproc
# %bb.0:                                # %global.init
	lui	a0, %hi(a.1)
	li	a1, 3
	sw	a1, %lo(a.1)(a0)
	lw	a0, %lo(a.1)(a0)
	lui	a1, %hi(b.1)
	sw	a0, %lo(b.1)(a1)
	ret
.Lfunc_end1:
	.size	global.init, .Lfunc_end1-global.init
	.cfi_endproc
                                        # -- End function
	.type	a.1,@object                     # @a.1
	.bss
	.globl	a.1
	.p2align	2, 0x0
a.1:
	.word	0                               # 0x0
	.size	a.1, 4

	.type	b.1,@object                     # @b.1
	.globl	b.1
	.p2align	2, 0x0
b.1:
	.word	0                               # 0x0
	.size	b.1, 4

	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym global.init
	.addrsig_sym a.1
	.addrsig_sym b.1
