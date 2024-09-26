	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_c2p0"
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
	lui	a0, %hi(.LstringLiteral.0.1)
	addi	a0, a0, %lo(.LstringLiteral.0.1)
	call	println
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
	ret
.Lfunc_end1:
	.size	global.init, .Lfunc_end1-global.init
	.cfi_endproc
                                        # -- End function
	.type	.LstringLiteral.0.1,@object     # @stringLiteral.0.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.LstringLiteral.0.1:
	.asciz	"Hello, world!"
	.size	.LstringLiteral.0.1, 14

	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym println
	.addrsig_sym global.init
