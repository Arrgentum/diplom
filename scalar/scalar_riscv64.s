	.file	"scalar1.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	find_numer_node
	.type	find_numer_node, @function
find_numer_node:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	ld	a5,-40(s0)
	beq	a5,zero,.L2
	sw	zero,-20(s0)
	sw	zero,-24(s0)
	ld	a5,-40(s0)
	ld	a5,8(a5)
	beq	a5,zero,.L3
	ld	a5,-40(s0)
	ld	a5,8(a5)
	mv	a0,a5
	call	find_numer_node
	mv	a5,a0
	sw	a5,-20(s0)
.L3:
	ld	a5,-40(s0)
	ld	a5,16(a5)
	beq	a5,zero,.L4
	ld	a5,-40(s0)
	ld	a5,16(a5)
	mv	a0,a5
	call	find_numer_node
	mv	a5,a0
	sw	a5,-24(s0)
.L4:
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	addw	a5,a4,a5
	sext.w	a5,a5
	addiw	a5,a5,1
	sext.w	a5,a5
	j	.L5
.L2:
	li	a5,0
.L5:
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	find_numer_node, .-find_numer_node
	.align	1
	.globl	delete_tree
	.type	delete_tree, @function
delete_tree:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	ld	a5,-24(s0)
	ld	a5,0(a5)
	beq	a5,zero,.L8
	ld	a5,-24(s0)
	ld	a5,0(a5)
	addi	a5,a5,8
	mv	a0,a5
	call	delete_tree
	ld	a5,-24(s0)
	ld	a5,0(a5)
	addi	a5,a5,16
	mv	a0,a5
	call	delete_tree
	ld	a5,-24(s0)
	ld	a5,0(a5)
	mv	a0,a5
	call	free
.L8:
	nop
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	delete_tree, .-delete_tree
	.section	.rodata
	.align	3
.LC0:
	.string	"node_number = %d , length = %d\n"
	.align	3
.LC1:
	.string	"ip = %u, mask = %d, key =  %d\n"
	.align	3
.LC2:
	.string	"left"
	.align	3
.LC3:
	.string	"right"
	.text
	.align	1
	.globl	recourse_print_tree
	.type	recourse_print_tree, @function
recourse_print_tree:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	mv	a5,a1
	mv	a4,a2
	sw	a5,-28(s0)
	mv	a5,a4
	sb	a5,-29(s0)
	ld	a5,-24(s0)
	beq	a5,zero,.L12
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	sext.w	a4,a5
	ld	a5,-24(s0)
	lbu	a5,2(a5)
	sext.w	a5,a5
	mv	a2,a5
	mv	a1,a4
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
	ld	a5,-24(s0)
	lbu	a5,2(a5)
	sext.w	a5,a5
	lw	a4,-28(s0)
	sllw	a5,a4,a5
	sw	a5,-28(s0)
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	sext.w	a5,a5
	lw	a4,-28(s0)
	addw	a5,a4,a5
	sw	a5,-28(s0)
	ld	a5,-24(s0)
	lbu	a5,2(a5)
	lbu	a4,-29(s0)
	addw	a5,a4,a5
	sb	a5,-29(s0)
	lbu	a5,-29(s0)
	sext.w	a5,a5
	li	a4,32
	subw	a5,a4,a5
	sext.w	a5,a5
	lw	a4,-28(s0)
	sllw	a5,a4,a5
	sext.w	a4,a5
	lbu	a5,-29(s0)
	sext.w	a2,a5
	ld	a5,-24(s0)
	lbu	a5,1(a5)
	sext.w	a5,a5
	mv	a3,a5
	mv	a1,a4
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	printf
	ld	a5,-24(s0)
	ld	a5,8(a5)
	beq	a5,zero,.L11
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
	ld	a5,-24(s0)
	ld	a5,8(a5)
	lbu	a3,-29(s0)
	lw	a4,-28(s0)
	mv	a2,a3
	mv	a1,a4
	mv	a0,a5
	call	recourse_print_tree
.L11:
	ld	a5,-24(s0)
	ld	a5,16(a5)
	beq	a5,zero,.L12
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	puts
	ld	a5,-24(s0)
	ld	a5,16(a5)
	lbu	a3,-29(s0)
	lw	a4,-28(s0)
	mv	a2,a3
	mv	a1,a4
	mv	a0,a5
	call	recourse_print_tree
.L12:
	nop
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	recourse_print_tree, .-recourse_print_tree
	.section	.rodata
	.align	3
.LC4:
	.string	"//////  start__print__tree_  ///////\n"
	.align	3
.LC5:
	.string	"//////  end__print__tree_  ///////\n\n"
	.text
	.align	1
	.globl	print_tree
	.type	print_tree, @function
print_tree:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	puts
	li	a2,0
	li	a1,0
	ld	a0,-24(s0)
	call	recourse_print_tree
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	puts
	nop
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	print_tree, .-print_tree
	.align	1
	.globl	create_top
	.type	create_top, @function
create_top:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	mv	a5,a0
	mv	a3,a1
	mv	a4,a2
	sb	a5,-33(s0)
	mv	a5,a3
	sb	a5,-34(s0)
	mv	a5,a4
	sb	a5,-35(s0)
	li	a0,24
	call	malloc
	mv	a5,a0
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	lbu	a4,-35(s0)
	sb	a4,2(a5)
	ld	a5,-24(s0)
	lbu	a4,-33(s0)
	sb	a4,0(a5)
	ld	a5,-24(s0)
	lbu	a4,-34(s0)
	sb	a4,1(a5)
	ld	a5,-24(s0)
	sd	zero,8(a5)
	ld	a5,-24(s0)
	sd	zero,16(a5)
	ld	a5,-24(s0)
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	create_top, .-create_top
	.align	1
	.globl	build_top
	.type	build_top, @function
build_top:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	addi	s0,sp,64
	sd	a0,-56(s0)
	sd	a1,-64(s0)
	lbu	a5,-51(s0)
	sext.w	a4,a5
	lbu	a5,-50(s0)
	sext.w	a5,a5
	addw	a5,a4,a5
	sext.w	a5,a5
	mv	a4,a5
	li	a5,32
	bne	a4,a5,.L17
	li	a5,0
	j	.L18
.L17:
	lw	a5,-56(s0)
	sw	a5,-32(s0)
	sb	zero,-25(s0)
	lbu	a5,-51(s0)
	sext.w	a4,a5
	lbu	a5,-50(s0)
	sext.w	a5,a5
	addw	a5,a4,a5
	sext.w	a5,a5
	mv	a4,a5
	li	a5,40
	ble	a4,a5,.L19
	lbu	a5,-51(s0)
	sext.w	a5,a5
	addiw	a5,a5,-9
	sext.w	a5,a5
	mv	a4,a5
	lw	a5,-32(s0)
	srlw	a5,a5,a4
	sw	a5,-32(s0)
	lw	a5,-32(s0)
	andi	a5,a5,1
	sext.w	a5,a5
	beq	a5,zero,.L20
	li	a5,1
	sb	a5,-25(s0)
.L20:
	lw	a5,-32(s0)
	srliw	a5,a5,1
	sw	a5,-32(s0)
	lw	a5,-32(s0)
	sb	a5,-33(s0)
	lbu	a5,-33(s0)
	li	a2,8
	li	a1,255
	mv	a0,a5
	call	create_top
	sd	a0,-24(s0)
	lbu	a4,-51(s0)
	ld	a5,-24(s0)
	lbu	a5,2(a5)
	subw	a5,a4,a5
	andi	a5,a5,0xff
	sb	a5,-51(s0)
	lbu	a5,-25(s0)
	andi	a5,a5,0xff
	beq	a5,zero,.L21
	ld	a1,-64(s0)
	ld	a0,-56(s0)
	call	build_top
	mv	a4,a0
	ld	a5,-24(s0)
	sd	a4,16(a5)
	j	.L22
.L21:
	ld	a1,-64(s0)
	ld	a0,-56(s0)
	call	build_top
	mv	a4,a0
	ld	a5,-24(s0)
	sd	a4,8(a5)
	j	.L22
.L19:
	lw	a5,-56(s0)
	andi	a4,a5,0xff
	lbu	a5,-51(s0)
	sext.w	a5,a5
	li	a3,1
	sllw	a5,a3,a5
	sext.w	a5,a5
	andi	a5,a5,0xff
	addiw	a5,a5,-1
	andi	a5,a5,0xff
	and	a5,a4,a5
	sb	a5,-33(s0)
	lbu	a5,-33(s0)
	sext.w	a4,a5
	lbu	a5,-50(s0)
	sext.w	a5,a5
	li	a3,32
	subw	a5,a3,a5
	sext.w	a5,a5
	sraw	a5,a4,a5
	sext.w	a5,a5
	sb	a5,-33(s0)
	lbu	a3,-52(s0)
	lbu	a4,-51(s0)
	lbu	a5,-50(s0)
	addw	a5,a4,a5
	andi	a5,a5,0xff
	addiw	a5,a5,-32
	andi	a4,a5,0xff
	lbu	a5,-33(s0)
	mv	a2,a4
	mv	a1,a3
	mv	a0,a5
	call	create_top
	sd	a0,-24(s0)
	ld	a5,-64(s0)
	beq	a5,zero,.L22
	ld	a5,-64(s0)
	ld	a4,8(a5)
	ld	a5,-24(s0)
	sd	a4,8(a5)
	ld	a5,-64(s0)
	ld	a4,16(a5)
	ld	a5,-24(s0)
	sd	a4,16(a5)
.L22:
	ld	a5,-24(s0)
.L18:
	mv	a0,a5
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,64
	jr	ra
	.size	build_top, .-build_top
	.align	1
	.globl	remake
	.type	remake, @function
remake:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	addi	s0,sp,64
	sd	a0,-56(s0)
	sw	zero,-20(s0)
	li	a5,-1
	sb	a5,-21(s0)
	sb	zero,-22(s0)
	ld	a5,-56(s0)
	beq	a5,zero,.L24
	ld	a5,-56(s0)
	lbu	a5,2(a5)
	sext.w	a5,a5
	mv	a4,a5
	lw	a5,-20(s0)
	sllw	a5,a5,a4
	sw	a5,-20(s0)
	ld	a5,-56(s0)
	lbu	a5,0(a5)
	sext.w	a5,a5
	lw	a4,-20(s0)
	addw	a5,a4,a5
	sw	a5,-20(s0)
	ld	a5,-56(s0)
	lbu	a5,2(a5)
	lbu	a4,-22(s0)
	addw	a5,a4,a5
	sb	a5,-22(s0)
	ld	a5,-56(s0)
	sd	a5,-32(s0)
	ld	a5,-56(s0)
	ld	a5,8(a5)
	beq	a5,zero,.L25
	ld	a5,-56(s0)
	ld	a5,16(a5)
	bne	a5,zero,.L28
.L25:
	ld	a5,-56(s0)
	lbu	a5,1(a5)
	sb	a5,-21(s0)
	j	.L24
.L28:
	nop
.L24:
	lw	a5,-20(s0)
	sw	a5,-40(s0)
	lbu	a5,-21(s0)
	sb	a5,-36(s0)
	lbu	a5,-22(s0)
	sb	a5,-35(s0)
	li	a5,32
	sb	a5,-34(s0)
	ld	a1,-56(s0)
	ld	a0,-40(s0)
	call	build_top
	sd	a0,-32(s0)
	ld	a5,-56(s0)
	beq	a5,zero,.L26
	ld	a0,-56(s0)
	call	free
.L26:
	ld	a5,-32(s0)
	mv	a0,a5
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,64
	jr	ra
	.size	remake, .-remake
	.align	1
	.globl	length_prefix
	.type	length_prefix, @function
length_prefix:
	addi	sp,sp,-64
	sd	s0,56(sp)
	addi	s0,sp,64
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	sd	a2,-56(s0)
	ld	a5,-40(s0)
	lbu	a5,0(a5)
	sb	a5,-17(s0)
	lw	a5,-48(s0)
	sw	a5,-24(s0)
	ld	a5,-40(s0)
	lbu	a5,2(a5)
	sw	a5,-28(s0)
	lbu	a4,-43(s0)
	ld	a5,-40(s0)
	lbu	a5,2(a5)
	bleu	a4,a5,.L30
	lbu	a5,-43(s0)
	sext.w	a4,a5
	ld	a5,-40(s0)
	lbu	a5,2(a5)
	sext.w	a5,a5
	subw	a5,a4,a5
	sext.w	a5,a5
	addiw	a5,a5,-1
	sext.w	a5,a5
	mv	a4,a5
	lw	a5,-24(s0)
	srlw	a5,a5,a4
	sw	a5,-24(s0)
	lw	a5,-24(s0)
	andi	a5,a5,0xff
	andi	a5,a5,1
	sb	a5,-18(s0)
	lw	a5,-24(s0)
	srliw	a5,a5,1
	sw	a5,-24(s0)
.L30:
	ld	a5,-40(s0)
	lbu	a4,2(a5)
	lbu	a5,-43(s0)
	subw	a5,a4,a5
	andi	a4,a5,0xff
	lbu	a5,-42(s0)
	subw	a5,a4,a5
	andi	a5,a5,0xff
	addiw	a5,a5,32
	sb	a5,-29(s0)
	ld	a5,-40(s0)
	lbu	a5,2(a5)
	sext.w	a5,a5
	li	a4,1
	sllw	a5,a4,a5
	sext.w	a5,a5
	andi	a5,a5,0xff
	addiw	a5,a5,-1
	andi	a4,a5,0xff
	lw	a5,-24(s0)
	andi	a5,a5,0xff
	and	a5,a4,a5
	sb	a5,-19(s0)
	lbu	a5,-42(s0)
	mv	a4,a5
	li	a5,32
	beq	a4,a5,.L32
	lbu	a5,-29(s0)
	andi	a5,a5,0xff
	beq	a5,zero,.L32
	lbu	a5,-19(s0)
	sext.w	a4,a5
	lbu	a5,-29(s0)
	sext.w	a5,a5
	sraw	a5,a4,a5
	sext.w	a5,a5
	sb	a5,-19(s0)
	lbu	a5,-17(s0)
	sext.w	a4,a5
	lbu	a5,-29(s0)
	sext.w	a5,a5
	sraw	a5,a4,a5
	sext.w	a5,a5
	sb	a5,-17(s0)
	lbu	a5,-29(s0)
	sext.w	a5,a5
	lw	a4,-28(s0)
	subw	a5,a4,a5
	sw	a5,-28(s0)
	j	.L32
.L33:
	lbu	a5,-19(s0)
	andi	a5,a5,1
	sb	a5,-18(s0)
	lbu	a5,-19(s0)
	srliw	a5,a5,1
	sb	a5,-19(s0)
	lbu	a5,-17(s0)
	srliw	a5,a5,1
	sb	a5,-17(s0)
	lw	a5,-28(s0)
	addiw	a5,a5,-1
	sw	a5,-28(s0)
.L32:
	lbu	a4,-17(s0)
	lbu	a5,-19(s0)
	andi	a4,a4,0xff
	andi	a5,a5,0xff
	bne	a4,a5,.L33
	ld	a5,-56(s0)
	lbu	a4,-18(s0)
	sb	a4,0(a5)
	lw	a5,-28(s0)
	andi	a5,a5,0xff
	mv	a0,a5
	ld	s0,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	length_prefix, .-length_prefix
	.align	1
	.globl	break_top
	.type	break_top, @function
break_top:
	addi	sp,sp,-80
	sd	ra,72(sp)
	sd	s0,64(sp)
	addi	s0,sp,80
	sd	a0,-56(s0)
	sd	a1,-64(s0)
	mv	a5,a2
	mv	a4,a3
	sb	a5,-65(s0)
	mv	a5,a4
	sb	a5,-66(s0)
	sd	zero,-24(s0)
	sd	zero,-40(s0)
	sd	zero,-32(s0)
	ld	a5,-56(s0)
	ld	a5,0(a5)
	lbu	a5,0(a5)
	sext.w	a4,a5
	ld	a5,-56(s0)
	ld	a5,0(a5)
	lbu	a5,2(a5)
	sext.w	a3,a5
	lbu	a5,-65(s0)
	sext.w	a5,a5
	subw	a5,a3,a5
	sext.w	a5,a5
	sraw	a5,a4,a5
	sext.w	a5,a5
	sb	a5,-41(s0)
	lbu	a5,-41(s0)
	sext.w	a4,a5
	ld	a5,-56(s0)
	ld	a5,0(a5)
	lbu	a5,2(a5)
	sext.w	a3,a5
	lbu	a5,-65(s0)
	sext.w	a5,a5
	subw	a5,a3,a5
	sext.w	a5,a5
	sllw	a5,a4,a5
	sext.w	a5,a5
	slliw	a4,a5,24
	sraiw	a4,a4,24
	ld	a5,-56(s0)
	ld	a5,0(a5)
	lbu	a5,0(a5)
	slliw	a5,a5,24
	sraiw	a5,a5,24
	xor	a5,a4,a5
	slliw	a4,a5,24
	sraiw	a4,a4,24
	ld	a5,-56(s0)
	ld	a5,0(a5)
	andi	a4,a4,0xff
	sb	a4,0(a5)
	ld	a5,-56(s0)
	ld	a5,0(a5)
	lbu	a3,2(a5)
	ld	a5,-56(s0)
	ld	a5,0(a5)
	lbu	a4,-65(s0)
	subw	a4,a3,a4
	andi	a4,a4,0xff
	sb	a4,2(a5)
	lbu	a5,-59(s0)
	sext.w	a4,a5
	lbu	a5,-58(s0)
	sext.w	a5,a5
	addw	a5,a4,a5
	sext.w	a5,a5
	mv	a4,a5
	li	a5,32
	beq	a4,a5,.L36
	lbu	a4,-65(s0)
	lbu	a5,-41(s0)
	mv	a2,a4
	li	a1,255
	mv	a0,a5
	call	create_top
	sd	a0,-32(s0)
	li	a1,0
	ld	a0,-64(s0)
	call	build_top
	sd	a0,-24(s0)
	j	.L37
.L36:
	lbu	a4,-60(s0)
	lbu	a3,-65(s0)
	lbu	a5,-41(s0)
	mv	a2,a3
	mv	a1,a4
	mv	a0,a5
	call	create_top
	sd	a0,-32(s0)
.L37:
	ld	a5,-56(s0)
	ld	a5,0(a5)
	mv	a0,a5
	call	remake
	sd	a0,-40(s0)
	lbu	a5,-66(s0)
	andi	a5,a5,0xff
	beq	a5,zero,.L38
	ld	a5,-32(s0)
	ld	a4,-40(s0)
	sd	a4,8(a5)
	ld	a5,-32(s0)
	ld	a4,-24(s0)
	sd	a4,16(a5)
	j	.L39
.L38:
	ld	a5,-32(s0)
	ld	a4,-40(s0)
	sd	a4,16(a5)
	ld	a5,-32(s0)
	ld	a4,-24(s0)
	sd	a4,8(a5)
.L39:
	ld	a5,-56(s0)
	ld	a4,-32(s0)
	sd	a4,0(a5)
	nop
	ld	ra,72(sp)
	ld	s0,64(sp)
	addi	sp,sp,80
	jr	ra
	.size	break_top, .-break_top
	.align	1
	.globl	add_in_scalar_tree
	.type	add_in_scalar_tree, @function
add_in_scalar_tree:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	ld	a5,-40(s0)
	ld	a5,0(a5)
	bne	a5,zero,.L41
	li	a1,0
	ld	a0,-48(s0)
	call	build_top
	mv	a4,a0
	ld	a5,-40(s0)
	sd	a4,0(a5)
	j	.L40
.L41:
	ld	a5,-40(s0)
	ld	a5,0(a5)
	addi	a4,s0,-18
	mv	a2,a4
	ld	a1,-48(s0)
	mv	a0,a5
	call	length_prefix
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a4,-43(s0)
	lbu	a5,-17(s0)
	subw	a5,a4,a5
	andi	a5,a5,0xff
	sb	a5,-43(s0)
	ld	a5,-40(s0)
	ld	a5,0(a5)
	lbu	a4,2(a5)
	lbu	a5,-17(s0)
	andi	a5,a5,0xff
	bne	a5,a4,.L43
	lbu	a5,-43(s0)
	sext.w	a5,a5
	li	a4,32
	subw	a5,a4,a5
	sext.w	a4,a5
	lbu	a5,-42(s0)
	sext.w	a5,a5
	bne	a4,a5,.L44
	ld	a5,-40(s0)
	ld	a5,0(a5)
	lbu	a4,-44(s0)
	sb	a4,1(a5)
	j	.L40
.L44:
	lbu	a5,-18(s0)
	beq	a5,zero,.L46
	ld	a5,-40(s0)
	ld	a5,0(a5)
	addi	a5,a5,16
	ld	a1,-48(s0)
	mv	a0,a5
	call	add_in_scalar_tree
	j	.L40
.L46:
	ld	a5,-40(s0)
	ld	a5,0(a5)
	addi	a5,a5,8
	ld	a1,-48(s0)
	mv	a0,a5
	call	add_in_scalar_tree
	j	.L40
.L43:
	lbu	a4,-18(s0)
	lbu	a5,-17(s0)
	mv	a3,a4
	mv	a2,a5
	ld	a1,-48(s0)
	ld	a0,-40(s0)
	call	break_top
.L40:
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	add_in_scalar_tree, .-add_in_scalar_tree
	.align	1
	.globl	insert_in_scalar_tree
	.type	insert_in_scalar_tree, @function
insert_in_scalar_tree:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	ld	a5,-24(s0)
	ld	a5,0(a5)
	addi	a5,a5,8
	ld	a1,-32(s0)
	mv	a0,a5
	call	add_in_scalar_tree
	nop
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	insert_in_scalar_tree, .-insert_in_scalar_tree
	.align	1
	.globl	search_in_scalar_tree
	.type	search_in_scalar_tree, @function
search_in_scalar_tree:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	li	a5,-1
	sb	a5,-25(s0)
	lw	a5,-48(s0)
	sext.w	a5,a5
	bge	a5,zero,.L49
	ld	a5,-40(s0)
	ld	a5,16(a5)
	sd	a5,-24(s0)
	j	.L51
.L49:
	ld	a5,-40(s0)
	ld	a5,8(a5)
	sd	a5,-24(s0)
	j	.L51
.L55:
	addi	a5,s0,-27
	mv	a2,a5
	ld	a1,-48(s0)
	ld	a0,-24(s0)
	call	length_prefix
	mv	a5,a0
	sb	a5,-26(s0)
	ld	a5,-24(s0)
	lbu	a4,2(a5)
	lbu	a5,-26(s0)
	andi	a5,a5,0xff
	bne	a5,a4,.L57
	lbu	a4,-43(s0)
	lbu	a5,-26(s0)
	subw	a5,a4,a5
	andi	a5,a5,0xff
	sb	a5,-43(s0)
	ld	a5,-24(s0)
	lbu	a5,1(a5)
	sb	a5,-25(s0)
	lbu	a5,-27(s0)
	beq	a5,zero,.L53
	ld	a5,-24(s0)
	ld	a5,16(a5)
	sd	a5,-24(s0)
	j	.L51
.L53:
	ld	a5,-24(s0)
	ld	a5,8(a5)
	sd	a5,-24(s0)
.L51:
	ld	a5,-24(s0)
	bne	a5,zero,.L55
	j	.L54
.L57:
	nop
.L54:
	lbu	a5,-25(s0)
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	search_in_scalar_tree, .-search_in_scalar_tree
	.align	1
	.globl	del_from_scalar_tree
	.type	del_from_scalar_tree, @function
del_from_scalar_tree:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	addi	s0,sp,64
	sd	a0,-56(s0)
	sd	a1,-64(s0)
	ld	a5,-56(s0)
	ld	a5,0(a5)
	sd	a5,-24(s0)
	ld	a5,-56(s0)
	ld	a5,0(a5)
	sd	a5,-32(s0)
	ld	a5,-56(s0)
	ld	a5,0(a5)
	sd	a5,-40(s0)
	j	.L59
.L67:
	addi	a5,s0,-44
	mv	a2,a5
	ld	a1,-64(s0)
	ld	a0,-24(s0)
	call	length_prefix
	mv	a5,a0
	sb	a5,-43(s0)
	ld	a5,-24(s0)
	lbu	a4,2(a5)
	lbu	a5,-43(s0)
	andi	a5,a5,0xff
	bne	a5,a4,.L76
	lbu	a4,-59(s0)
	lbu	a5,-43(s0)
	subw	a5,a4,a5
	andi	a5,a5,0xff
	sb	a5,-59(s0)
	lbu	a5,-58(s0)
	sext.w	a3,a5
	lbu	a5,-59(s0)
	sext.w	a5,a5
	li	a4,32
	subw	a5,a4,a5
	sext.w	a5,a5
	mv	a4,a3
	beq	a4,a5,.L77
	ld	a5,-24(s0)
	ld	a5,8(a5)
	beq	a5,zero,.L64
	ld	a5,-24(s0)
	ld	a5,16(a5)
	beq	a5,zero,.L64
	ld	a5,-32(s0)
	sd	a5,-40(s0)
	ld	a5,-24(s0)
	sd	a5,-32(s0)
	lbu	a5,-41(s0)
	sb	a5,-42(s0)
	lbu	a5,-44(s0)
	sb	a5,-41(s0)
.L64:
	ld	a5,-56(s0)
	ld	a5,0(a5)
	ld	a4,-24(s0)
	bne	a4,a5,.L65
	lbu	a5,-44(s0)
	sb	a5,-41(s0)
.L65:
	lbu	a5,-44(s0)
	beq	a5,zero,.L66
	ld	a5,-24(s0)
	ld	a5,16(a5)
	sd	a5,-24(s0)
	j	.L59
.L66:
	ld	a5,-24(s0)
	ld	a5,8(a5)
	sd	a5,-24(s0)
.L59:
	ld	a5,-24(s0)
	bne	a5,zero,.L67
	j	.L63
.L77:
	nop
.L63:
	ld	a5,-24(s0)
	ld	a5,8(a5)
	bne	a5,zero,.L68
	ld	a5,-24(s0)
	ld	a5,16(a5)
	beq	a5,zero,.L69
.L68:
	ld	a5,-24(s0)
	li	a4,-1
	sb	a4,1(a5)
	ld	a0,-32(s0)
	call	remake
	mv	a4,a0
	ld	a5,-56(s0)
	sd	a4,0(a5)
	j	.L58
.L69:
	lbu	a5,-41(s0)
	andi	a5,a5,0xff
	beq	a5,zero,.L70
	ld	a5,-32(s0)
	addi	a5,a5,16
	mv	a0,a5
	call	delete_tree
	ld	a5,-32(s0)
	sd	zero,16(a5)
	j	.L71
.L70:
	ld	a5,-32(s0)
	addi	a5,a5,8
	mv	a0,a5
	call	delete_tree
	ld	a5,-32(s0)
	sd	zero,8(a5)
.L71:
	ld	a5,-56(s0)
	ld	a5,0(a5)
	ld	a4,-32(s0)
	bne	a4,a5,.L72
	ld	a5,-56(s0)
	ld	a5,0(a5)
	mv	a0,a5
	call	remake
	mv	a4,a0
	ld	a5,-56(s0)
	sd	a4,0(a5)
	j	.L58
.L72:
	lbu	a5,-42(s0)
	andi	a5,a5,0xff
	beq	a5,zero,.L74
	ld	a5,-40(s0)
	ld	a5,16(a5)
	mv	a0,a5
	call	remake
	mv	a4,a0
	ld	a5,-40(s0)
	sd	a4,16(a5)
	j	.L58
.L74:
	ld	a5,-40(s0)
	ld	a5,8(a5)
	mv	a0,a5
	call	remake
	mv	a4,a0
	ld	a5,-40(s0)
	sd	a4,8(a5)
	j	.L58
.L76:
	nop
.L58:
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,64
	jr	ra
	.size	del_from_scalar_tree, .-del_from_scalar_tree
	.align	1
	.globl	delete_from_scalar_tree
	.type	delete_from_scalar_tree, @function
delete_from_scalar_tree:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	lw	a5,-32(s0)
	sext.w	a5,a5
	bge	a5,zero,.L79
	ld	a5,-24(s0)
	ld	a5,0(a5)
	addi	a5,a5,16
	ld	a1,-32(s0)
	mv	a0,a5
	call	del_from_scalar_tree
	j	.L81
.L79:
	ld	a5,-24(s0)
	ld	a5,0(a5)
	addi	a5,a5,8
	ld	a1,-32(s0)
	mv	a0,a5
	call	del_from_scalar_tree
.L81:
	nop
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	delete_from_scalar_tree, .-delete_from_scalar_tree
	.section	.rodata
	.align	3
.LC6:
	.string	"Total non-mmapped bytes (arena):       %lu\n"
	.align	3
.LC7:
	.string	"# of free chunks (ordblks):            %lu\n"
	.align	3
.LC8:
	.string	"# of free fastbin blocks (smblks):     %lu\n"
	.align	3
.LC9:
	.string	"# of mapped regions (hblks):           %lu\n"
	.align	3
.LC10:
	.string	"Bytes in mapped regions (hblkhd):      %lu\n"
	.align	3
.LC11:
	.string	"Max. total allocated space (usmblks):  %lu\n"
	.align	3
.LC12:
	.string	"Free bytes held in fastbins (fsmblks): %lu\n"
	.align	3
.LC13:
	.string	"Total allocated space (uordblks):      %lu\n"
	.align	3
.LC14:
	.string	"Total free space (fordblks):           %lu\n"
	.align	3
.LC15:
	.string	"Topmost releasable block (keepcost):   %lu\n"
	.text
	.align	1
	.type	display_mallinfo2, @function
display_mallinfo2:
	addi	sp,sp,-96
	sd	ra,88(sp)
	sd	s0,80(sp)
	addi	s0,sp,96
	addi	a5,s0,-96
	mv	a0,a5
	call	mallinfo
	ld	a5,-96(s0)
	mv	a1,a5
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	printf
	ld	a5,-88(s0)
	mv	a1,a5
	lui	a5,%hi(.LC7)
	addi	a0,a5,%lo(.LC7)
	call	printf
	ld	a5,-80(s0)
	mv	a1,a5
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	printf
	ld	a5,-72(s0)
	mv	a1,a5
	lui	a5,%hi(.LC9)
	addi	a0,a5,%lo(.LC9)
	call	printf
	ld	a5,-64(s0)
	mv	a1,a5
	lui	a5,%hi(.LC10)
	addi	a0,a5,%lo(.LC10)
	call	printf
	ld	a5,-56(s0)
	mv	a1,a5
	lui	a5,%hi(.LC11)
	addi	a0,a5,%lo(.LC11)
	call	printf
	ld	a5,-48(s0)
	mv	a1,a5
	lui	a5,%hi(.LC12)
	addi	a0,a5,%lo(.LC12)
	call	printf
	ld	a5,-40(s0)
	mv	a1,a5
	lui	a5,%hi(.LC13)
	addi	a0,a5,%lo(.LC13)
	call	printf
	ld	a5,-32(s0)
	mv	a1,a5
	lui	a5,%hi(.LC14)
	addi	a0,a5,%lo(.LC14)
	call	printf
	ld	a5,-24(s0)
	mv	a1,a5
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	printf
	nop
	ld	ra,88(sp)
	ld	s0,80(sp)
	addi	sp,sp,96
	jr	ra
	.size	display_mallinfo2, .-display_mallinfo2
	.section	.rodata
	.align	3
.LC16:
	.string	"Input line number"
	.align	3
.LC17:
	.string	"%d"
	.align	3
.LC18:
	.string	"Input max key"
	.align	3
.LC19:
	.string	"Input mask length"
	.align	3
.LC20:
	.string	"wrong mask"
	.align	3
.LC21:
	.string	"node number = %d\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	addi	s0,sp,64
	sw	zero,-40(s0)
	li	a5,32
	sw	a5,-44(s0)
	li	a5,1
	sw	a5,-20(s0)
	sw	zero,-48(s0)
	lui	a5,%hi(.LC16)
	addi	a0,a5,%lo(.LC16)
	call	puts
	addi	a5,s0,-48
	mv	a1,a5
	lui	a5,%hi(.LC17)
	addi	a0,a5,%lo(.LC17)
	call	scanf
	lui	a5,%hi(.LC18)
	addi	a0,a5,%lo(.LC18)
	call	puts
	addi	a5,s0,-40
	mv	a1,a5
	lui	a5,%hi(.LC17)
	addi	a0,a5,%lo(.LC17)
	call	scanf
	lui	a5,%hi(.LC19)
	addi	a0,a5,%lo(.LC19)
	call	puts
	addi	a5,s0,-44
	mv	a1,a5
	lui	a5,%hi(.LC17)
	addi	a0,a5,%lo(.LC17)
	call	scanf
	lw	a5,-44(s0)
	mv	a4,a5
	li	a5,32
	bleu	a4,a5,.L84
	lui	a5,%hi(.LC20)
	addi	a0,a5,%lo(.LC20)
	call	puts
	li	a5,0
	j	.L90
.L84:
	sw	zero,-28(s0)
	lw	a5,-44(s0)
	li	a4,32
	subw	a5,a4,a5
	sext.w	a5,a5
	li	a4,1
	sllw	a5,a4,a5
	sext.w	a5,a5
	addiw	a5,a5,-1
	sext.w	a5,a5
	sw	a5,-32(s0)
	li	a2,0
	li	a1,255
	li	a0,0
	call	create_top
	mv	a5,a0
	sd	a5,-56(s0)
	sw	zero,-64(s0)
	sb	zero,-60(s0)
	li	a5,32
	sb	a5,-59(s0)
	li	a5,32
	sb	a5,-58(s0)
	lw	a4,-32(s0)
	lw	a5,-28(s0)
	subw	a5,a4,a5
	sext.w	a4,a5
	lw	a5,-48(s0)
	bleu	a4,a5,.L86
	lw	a4,-32(s0)
	lw	a5,-28(s0)
	subw	a5,a4,a5
	sext.w	a4,a5
	lw	a5,-48(s0)
	divuw	a5,a4,a5
	sw	a5,-20(s0)
	j	.L87
.L86:
	lw	a4,-32(s0)
	lw	a5,-28(s0)
	subw	a5,a4,a5
	sext.w	a5,a5
	sw	a5,-48(s0)
.L87:
	call	display_mallinfo2
	sw	zero,-24(s0)
	j	.L88
.L89:
	lw	a4,-24(s0)
	lw	a5,-40(s0)
	remuw	a5,a4,a5
	sext.w	a5,a5
	andi	a5,a5,0xff
	sb	a5,-60(s0)
	call	rand
	mv	a5,a0
	sext.w	a3,a5
	lw	a5,-44(s0)
	li	a4,32
	subw	a5,a4,a5
	sext.w	a5,a5
	mv	a4,a3
	remuw	a5,a4,a5
	sext.w	a5,a5
	andi	a5,a5,0xff
	li	a4,32
	subw	a5,a4,a5
	andi	a5,a5,0xff
	sb	a5,-58(s0)
	addi	a5,s0,-56
	ld	a1,-64(s0)
	mv	a0,a5
	call	insert_in_scalar_tree
	lw	a5,-64(s0)
	lw	a4,-20(s0)
	addw	a5,a4,a5
	sext.w	a5,a5
	sw	a5,-64(s0)
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L88:
	lw	a4,-24(s0)
	lw	a5,-48(s0)
	bltu	a4,a5,.L89
	ld	a5,-56(s0)
	mv	a0,a5
	call	find_numer_node
	mv	a5,a0
	sw	a5,-36(s0)
	lw	a5,-36(s0)
	mv	a1,a5
	lui	a5,%hi(.LC21)
	addi	a0,a5,%lo(.LC21)
	call	printf
	call	display_mallinfo2
	li	a5,0
.L90:
	mv	a0,a5
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,64
	jr	ra
	.size	main, .-main
	.ident	"GCC: (SiFive GCC-Metal 10.2.0-2020.12.8) 10.2.0"
