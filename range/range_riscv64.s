	.file	"range1.c"
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
	ld	a5,16(a5)
	beq	a5,zero,.L3
	ld	a5,-40(s0)
	ld	a5,16(a5)
	mv	a0,a5
	call	find_numer_node
	mv	a5,a0
	sw	a5,-20(s0)
.L3:
	ld	a5,-40(s0)
	ld	a5,24(a5)
	beq	a5,zero,.L4
	ld	a5,-40(s0)
	ld	a5,24(a5)
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
	.section	.rodata
	.align	3
.LC0:
	.string	"low = %u, large = %u, max = %u, height = %u, key = %u\n"
	.align	3
.LC1:
	.string	"left"
	.align	3
.LC2:
	.string	"right"
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
	ld	a5,-24(s0)
	beq	a5,zero,.L9
	ld	a5,-24(s0)
	lw	a1,0(a5)
	ld	a5,-24(s0)
	lw	a2,4(a5)
	ld	a5,-24(s0)
	lw	a3,8(a5)
	ld	a5,-24(s0)
	lbu	a5,32(a5)
	sext.w	a4,a5
	ld	a5,-24(s0)
	lbu	a5,33(a5)
	sext.w	a5,a5
	lui	a0,%hi(.LC0)
	addi	a0,a0,%lo(.LC0)
	call	printf
	ld	a5,-24(s0)
	ld	a5,16(a5)
	beq	a5,zero,.L8
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	ld	a5,-24(s0)
	ld	a5,16(a5)
	mv	a0,a5
	call	print_tree
.L8:
	ld	a5,-24(s0)
	ld	a5,24(a5)
	beq	a5,zero,.L9
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
	ld	a5,-24(s0)
	ld	a5,24(a5)
	mv	a0,a5
	call	print_tree
.L9:
	nop
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	print_tree, .-print_tree
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
	beq	a5,zero,.L12
	ld	a5,-24(s0)
	ld	a5,0(a5)
	addi	a5,a5,16
	mv	a0,a5
	call	delete_tree
	ld	a5,-24(s0)
	ld	a5,0(a5)
	addi	a5,a5,24
	mv	a0,a5
	call	delete_tree
	ld	a5,-24(s0)
	ld	a5,0(a5)
	mv	a0,a5
	call	free
.L12:
	nop
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	delete_tree, .-delete_tree
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
	sw	a5,-36(s0)
	mv	a5,a3
	sw	a5,-40(s0)
	mv	a5,a4
	sb	a5,-41(s0)
	li	a0,40
	call	malloc
	mv	a5,a0
	sd	a5,-24(s0)
	lw	a4,-36(s0)
	ld	a5,-24(s0)
	sw	a4,0(a5)
	lw	a4,-40(s0)
	ld	a5,-24(s0)
	sw	a4,4(a5)
	ld	a5,-24(s0)
	lbu	a4,-41(s0)
	sb	a4,33(a5)
	lw	a4,-40(s0)
	ld	a5,-24(s0)
	sw	a4,8(a5)
	ld	a5,-24(s0)
	li	a4,1
	sb	a4,32(a5)
	ld	a5,-24(s0)
	sd	zero,16(a5)
	ld	a5,-24(s0)
	sd	zero,24(a5)
	ld	a5,-24(s0)
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	create_top, .-create_top
	.align	1
	.globl	fixmax
	.type	fixmax, @function
fixmax:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	ld	a5,-40(s0)
	ld	a5,0(a5)
	beq	a5,zero,.L26
	ld	a5,-40(s0)
	ld	a5,0(a5)
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	ld	a5,24(a5)
	beq	a5,zero,.L18
	ld	a5,-24(s0)
	ld	a5,16(a5)
	beq	a5,zero,.L18
	ld	a5,-24(s0)
	ld	a5,24(a5)
	lw	a4,8(a5)
	ld	a5,-24(s0)
	ld	a5,16(a5)
	lw	a5,8(a5)
	bleu	a4,a5,.L19
	ld	a5,-24(s0)
	ld	a5,24(a5)
	lw	a4,8(a5)
	ld	a5,-24(s0)
	lw	a5,4(a5)
	bleu	a4,a5,.L19
	ld	a5,-24(s0)
	ld	a4,24(a5)
	ld	a5,-40(s0)
	ld	a5,0(a5)
	lw	a4,8(a4)
	sw	a4,8(a5)
	j	.L20
.L19:
	ld	a5,-24(s0)
	ld	a5,16(a5)
	lw	a4,8(a5)
	ld	a5,-24(s0)
	ld	a5,24(a5)
	lw	a5,8(a5)
	bltu	a4,a5,.L21
	ld	a5,-24(s0)
	ld	a5,16(a5)
	lw	a4,8(a5)
	ld	a5,-24(s0)
	lw	a5,4(a5)
	bleu	a4,a5,.L21
	ld	a5,-24(s0)
	ld	a4,16(a5)
	ld	a5,-40(s0)
	ld	a5,0(a5)
	lw	a4,8(a4)
	sw	a4,8(a5)
	j	.L20
.L21:
	ld	a5,-40(s0)
	ld	a5,0(a5)
	ld	a4,-24(s0)
	lw	a4,4(a4)
	sw	a4,8(a5)
	j	.L15
.L20:
	j	.L15
.L18:
	ld	a5,-24(s0)
	ld	a5,24(a5)
	beq	a5,zero,.L22
	ld	a5,-24(s0)
	ld	a5,24(a5)
	lw	a4,8(a5)
	ld	a5,-24(s0)
	lw	a5,4(a5)
	bleu	a4,a5,.L23
	ld	a5,-24(s0)
	ld	a4,24(a5)
	ld	a5,-40(s0)
	ld	a5,0(a5)
	lw	a4,8(a4)
	sw	a4,8(a5)
	j	.L15
.L23:
	ld	a5,-40(s0)
	ld	a5,0(a5)
	ld	a4,-24(s0)
	lw	a4,4(a4)
	sw	a4,8(a5)
	j	.L15
.L22:
	ld	a5,-24(s0)
	ld	a5,16(a5)
	beq	a5,zero,.L24
	ld	a5,-24(s0)
	ld	a5,16(a5)
	lw	a4,8(a5)
	ld	a5,-24(s0)
	lw	a5,4(a5)
	bleu	a4,a5,.L25
	ld	a5,-24(s0)
	ld	a4,16(a5)
	ld	a5,-40(s0)
	ld	a5,0(a5)
	lw	a4,8(a4)
	sw	a4,8(a5)
	j	.L15
.L25:
	ld	a5,-40(s0)
	ld	a5,0(a5)
	ld	a4,-24(s0)
	lw	a4,4(a4)
	sw	a4,8(a5)
	j	.L15
.L24:
	ld	a5,-40(s0)
	ld	a5,0(a5)
	ld	a4,-24(s0)
	lw	a4,4(a4)
	sw	a4,8(a5)
	j	.L15
.L26:
	nop
.L15:
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	fixmax, .-fixmax
	.align	1
	.globl	fixheight
	.type	fixheight, @function
fixheight:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	ld	a5,-24(s0)
	ld	a5,0(a5)
	beq	a5,zero,.L34
	ld	a5,-24(s0)
	ld	a5,0(a5)
	ld	a5,16(a5)
	beq	a5,zero,.L30
	ld	a5,-24(s0)
	ld	a5,0(a5)
	ld	a5,24(a5)
	beq	a5,zero,.L31
	ld	a5,-24(s0)
	ld	a5,0(a5)
	ld	a5,16(a5)
	lbu	a4,32(a5)
	ld	a5,-24(s0)
	ld	a5,0(a5)
	ld	a5,24(a5)
	lbu	a5,32(a5)
	bleu	a4,a5,.L32
	ld	a5,-24(s0)
	ld	a5,0(a5)
	ld	a5,16(a5)
	lbu	a4,32(a5)
	ld	a5,-24(s0)
	ld	a5,0(a5)
	addiw	a4,a4,1
	andi	a4,a4,0xff
	sb	a4,32(a5)
	j	.L27
.L32:
	ld	a5,-24(s0)
	ld	a5,0(a5)
	ld	a5,24(a5)
	lbu	a4,32(a5)
	ld	a5,-24(s0)
	ld	a5,0(a5)
	addiw	a4,a4,1
	andi	a4,a4,0xff
	sb	a4,32(a5)
	j	.L27
.L31:
	ld	a5,-24(s0)
	ld	a5,0(a5)
	ld	a5,16(a5)
	lbu	a4,32(a5)
	ld	a5,-24(s0)
	ld	a5,0(a5)
	addiw	a4,a4,1
	andi	a4,a4,0xff
	sb	a4,32(a5)
	j	.L27
.L30:
	ld	a5,-24(s0)
	ld	a5,0(a5)
	ld	a5,24(a5)
	beq	a5,zero,.L33
	ld	a5,-24(s0)
	ld	a5,0(a5)
	ld	a5,24(a5)
	lbu	a4,32(a5)
	ld	a5,-24(s0)
	ld	a5,0(a5)
	addiw	a4,a4,1
	andi	a4,a4,0xff
	sb	a4,32(a5)
	j	.L27
.L33:
	ld	a5,-24(s0)
	ld	a5,0(a5)
	li	a4,1
	sb	a4,32(a5)
	j	.L27
.L34:
	nop
.L27:
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	fixheight, .-fixheight
	.align	1
	.globl	small_left_rotation
	.type	small_left_rotation, @function
small_left_rotation:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	ld	a5,-40(s0)
	ld	a5,24(a5)
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	ld	a4,16(a5)
	ld	a5,-40(s0)
	sd	a4,24(a5)
	ld	a5,-24(s0)
	ld	a4,-40(s0)
	sd	a4,16(a5)
	ld	a5,-24(s0)
	addi	a5,a5,16
	mv	a0,a5
	call	fixheight
	ld	a5,-24(s0)
	addi	a5,a5,16
	mv	a0,a5
	call	fixmax
	addi	a5,s0,-24
	mv	a0,a5
	call	fixheight
	addi	a5,s0,-24
	mv	a0,a5
	call	fixmax
	ld	a5,-24(s0)
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	small_left_rotation, .-small_left_rotation
	.align	1
	.globl	small_right_rotation
	.type	small_right_rotation, @function
small_right_rotation:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	ld	a5,-40(s0)
	ld	a5,16(a5)
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	ld	a4,24(a5)
	ld	a5,-40(s0)
	sd	a4,16(a5)
	ld	a5,-24(s0)
	ld	a4,-40(s0)
	sd	a4,24(a5)
	ld	a5,-24(s0)
	addi	a5,a5,24
	mv	a0,a5
	call	fixheight
	ld	a5,-24(s0)
	addi	a5,a5,24
	mv	a0,a5
	call	fixmax
	addi	a5,s0,-24
	mv	a0,a5
	call	fixheight
	addi	a5,s0,-24
	mv	a0,a5
	call	fixmax
	ld	a5,-24(s0)
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	small_right_rotation, .-small_right_rotation
	.align	1
	.globl	big_left_rotation
	.type	big_left_rotation, @function
big_left_rotation:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	ld	a5,-24(s0)
	ld	a5,24(a5)
	mv	a0,a5
	call	small_right_rotation
	mv	a4,a0
	ld	a5,-24(s0)
	sd	a4,24(a5)
	ld	a0,-24(s0)
	call	small_left_rotation
	sd	a0,-24(s0)
	ld	a5,-24(s0)
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	big_left_rotation, .-big_left_rotation
	.align	1
	.globl	big_right_rotation
	.type	big_right_rotation, @function
big_right_rotation:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	ld	a5,-24(s0)
	ld	a5,16(a5)
	mv	a0,a5
	call	small_left_rotation
	mv	a4,a0
	ld	a5,-24(s0)
	sd	a4,16(a5)
	ld	a0,-24(s0)
	call	small_right_rotation
	sd	a0,-24(s0)
	ld	a5,-24(s0)
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	big_right_rotation, .-big_right_rotation
	.align	1
	.globl	balanced_range_tree
	.type	balanced_range_tree, @function
balanced_range_tree:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	ld	a5,-40(s0)
	ld	a5,0(a5)
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	ld	a5,24(a5)
	beq	a5,zero,.L44
	ld	a5,-24(s0)
	ld	a5,16(a5)
	beq	a5,zero,.L44
	ld	a5,-24(s0)
	ld	a5,16(a5)
	lbu	a5,32(a5)
	sext.w	a4,a5
	ld	a5,-24(s0)
	ld	a5,24(a5)
	lbu	a5,32(a5)
	sext.w	a5,a5
	subw	a5,a4,a5
	sext.w	a5,a5
	mv	a4,a5
	li	a5,2
	beq	a4,a5,.L45
.L44:
	ld	a5,-24(s0)
	ld	a5,24(a5)
	bne	a5,zero,.L46
	ld	a5,-24(s0)
	ld	a5,16(a5)
	beq	a5,zero,.L46
	ld	a5,-24(s0)
	ld	a5,16(a5)
	lbu	a5,32(a5)
	mv	a4,a5
	li	a5,1
	bleu	a4,a5,.L46
.L45:
	ld	a5,-24(s0)
	ld	a5,16(a5)
	ld	a5,24(a5)
	beq	a5,zero,.L47
	ld	a5,-24(s0)
	ld	a5,16(a5)
	ld	a5,16(a5)
	beq	a5,zero,.L47
	ld	a5,-24(s0)
	ld	a5,16(a5)
	ld	a5,16(a5)
	lbu	a4,32(a5)
	ld	a5,-24(s0)
	ld	a5,16(a5)
	ld	a5,24(a5)
	lbu	a5,32(a5)
	bgtu	a4,a5,.L48
.L47:
	ld	a5,-24(s0)
	ld	a5,16(a5)
	ld	a5,16(a5)
	beq	a5,zero,.L49
	ld	a5,-24(s0)
	ld	a5,16(a5)
	ld	a5,24(a5)
	bne	a5,zero,.L49
.L48:
	ld	a5,-40(s0)
	ld	a5,0(a5)
	mv	a0,a5
	call	small_right_rotation
	mv	a4,a0
	ld	a5,-40(s0)
	sd	a4,0(a5)
	j	.L46
.L49:
	ld	a5,-40(s0)
	ld	a5,0(a5)
	mv	a0,a5
	call	big_right_rotation
	mv	a4,a0
	ld	a5,-40(s0)
	sd	a4,0(a5)
.L46:
	ld	a5,-24(s0)
	ld	a5,24(a5)
	beq	a5,zero,.L50
	ld	a5,-24(s0)
	ld	a5,16(a5)
	beq	a5,zero,.L50
	ld	a5,-24(s0)
	ld	a5,24(a5)
	lbu	a5,32(a5)
	sext.w	a4,a5
	ld	a5,-24(s0)
	ld	a5,16(a5)
	lbu	a5,32(a5)
	sext.w	a5,a5
	subw	a5,a4,a5
	sext.w	a5,a5
	mv	a4,a5
	li	a5,2
	beq	a4,a5,.L51
.L50:
	ld	a5,-24(s0)
	ld	a5,16(a5)
	bne	a5,zero,.L56
	ld	a5,-24(s0)
	ld	a5,24(a5)
	beq	a5,zero,.L56
	ld	a5,-24(s0)
	ld	a5,24(a5)
	lbu	a5,32(a5)
	mv	a4,a5
	li	a5,1
	bleu	a4,a5,.L56
.L51:
	ld	a5,-24(s0)
	ld	a5,24(a5)
	ld	a5,16(a5)
	beq	a5,zero,.L53
	ld	a5,-24(s0)
	ld	a5,24(a5)
	ld	a5,24(a5)
	beq	a5,zero,.L53
	ld	a5,-24(s0)
	ld	a5,24(a5)
	ld	a5,24(a5)
	lbu	a4,32(a5)
	ld	a5,-24(s0)
	ld	a5,24(a5)
	ld	a5,16(a5)
	lbu	a5,32(a5)
	bgtu	a4,a5,.L54
.L53:
	ld	a5,-24(s0)
	ld	a5,24(a5)
	ld	a5,24(a5)
	beq	a5,zero,.L55
	ld	a5,-24(s0)
	ld	a5,24(a5)
	ld	a5,16(a5)
	bne	a5,zero,.L55
.L54:
	ld	a5,-40(s0)
	ld	a5,0(a5)
	mv	a0,a5
	call	small_left_rotation
	mv	a4,a0
	ld	a5,-40(s0)
	sd	a4,0(a5)
	j	.L56
.L55:
	ld	a5,-40(s0)
	ld	a5,0(a5)
	mv	a0,a5
	call	big_left_rotation
	mv	a4,a0
	ld	a5,-40(s0)
	sd	a4,0(a5)
.L56:
	nop
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	balanced_range_tree, .-balanced_range_tree
	.align	1
	.globl	add_in_range_tree
	.type	add_in_range_tree, @function
add_in_range_tree:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	ld	a5,-24(s0)
	ld	a5,0(a5)
	bne	a5,zero,.L58
	ld	a5,-24(s0)
	ld	a4,-32(s0)
	sd	a4,0(a5)
	j	.L57
.L58:
	ld	a5,-24(s0)
	ld	a5,0(a5)
	lw	a4,0(a5)
	ld	a5,-32(s0)
	lw	a5,0(a5)
	bne	a4,a5,.L60
	ld	a5,-24(s0)
	ld	a5,0(a5)
	lw	a4,4(a5)
	ld	a5,-32(s0)
	lw	a5,4(a5)
	beq	a4,a5,.L63
.L60:
	ld	a5,-24(s0)
	ld	a5,0(a5)
	lw	a4,0(a5)
	ld	a5,-32(s0)
	lw	a5,0(a5)
	bleu	a4,a5,.L61
	ld	a5,-24(s0)
	ld	a5,0(a5)
	addi	a5,a5,16
	ld	a1,-32(s0)
	mv	a0,a5
	call	add_in_range_tree
	j	.L62
.L61:
	ld	a5,-24(s0)
	ld	a5,0(a5)
	addi	a5,a5,24
	ld	a1,-32(s0)
	mv	a0,a5
	call	add_in_range_tree
.L62:
	ld	a0,-24(s0)
	call	fixheight
	ld	a0,-24(s0)
	call	fixmax
	ld	a0,-24(s0)
	call	balanced_range_tree
	j	.L57
.L63:
	nop
.L57:
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	add_in_range_tree, .-add_in_range_tree
	.align	1
	.globl	insert_in_range_tree
	.type	insert_in_range_tree, @function
insert_in_range_tree:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	addi	s0,sp,64
	sd	a0,-56(s0)
	sd	a1,-64(s0)
	lw	a5,-64(s0)
	sw	a5,-20(s0)
	lbu	a5,-58(s0)
	li	a4,32
	subw	a5,a4,a5
	sb	a5,-21(s0)
	lw	a5,-64(s0)
	lbu	a4,-21(s0)
	sext.w	a4,a4
	srlw	a5,a5,a4
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-28(s0)
	lbu	a5,-21(s0)
	sext.w	a5,a5
	mv	a4,a5
	lw	a5,-20(s0)
	sllw	a5,a5,a4
	sw	a5,-20(s0)
	lbu	a5,-21(s0)
	sext.w	a5,a5
	mv	a4,a5
	lw	a5,-28(s0)
	sllw	a5,a5,a4
	sext.w	a5,a5
	addiw	a5,a5,-1
	sw	a5,-28(s0)
	lw	a5,-20(s0)
	lw	a4,-28(s0)
	lbu	a3,-60(s0)
	mv	a2,a3
	mv	a1,a4
	mv	a0,a5
	call	create_top
	sd	a0,-40(s0)
	ld	a1,-40(s0)
	ld	a0,-56(s0)
	call	add_in_range_tree
	nop
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,64
	jr	ra
	.size	insert_in_range_tree, .-insert_in_range_tree
	.align	1
	.globl	find_in_range_tree
	.type	find_in_range_tree, @function
find_in_range_tree:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	addi	s0,sp,64
	sd	a0,-40(s0)
	mv	a5,a1
	sd	a2,-56(s0)
	sw	a5,-44(s0)
	li	a5,-1
	sw	a5,-20(s0)
	li	a5,-1
	sw	a5,-24(s0)
	li	a5,-1
	sw	a5,-28(s0)
	li	a5,-1
	sb	a5,-29(s0)
	li	a5,-1
	sb	a5,-30(s0)
	ld	a5,-40(s0)
	bne	a5,zero,.L66
	li	a5,-1
	j	.L93
.L66:
	ld	a5,-40(s0)
	ld	a5,16(a5)
	beq	a5,zero,.L68
	ld	a5,-40(s0)
	ld	a5,16(a5)
	lw	a4,8(a5)
	lw	a5,-44(s0)
	bltu	a4,a5,.L68
	ld	a5,-40(s0)
	ld	a5,16(a5)
	addi	a3,s0,-30
	lw	a4,-44(s0)
	mv	a2,a3
	mv	a1,a4
	mv	a0,a5
	call	find_in_range_tree
	mv	a5,a0
	sw	a5,-24(s0)
.L68:
	ld	a5,-40(s0)
	ld	a5,24(a5)
	beq	a5,zero,.L69
	ld	a5,-40(s0)
	lw	a4,0(a5)
	lw	a5,-44(s0)
	bleu	a4,a5,.L70
	ld	a5,-40(s0)
	ld	a5,16(a5)
	beq	a5,zero,.L69
	ld	a5,-40(s0)
	ld	a5,16(a5)
	lw	a4,8(a5)
	lw	a5,-44(s0)
	bgtu	a4,a5,.L69
.L70:
	ld	a5,-40(s0)
	ld	a5,24(a5)
	addi	a3,s0,-29
	lw	a4,-44(s0)
	mv	a2,a3
	mv	a1,a4
	mv	a0,a5
	call	find_in_range_tree
	mv	a5,a0
	sw	a5,-20(s0)
.L69:
	ld	a5,-40(s0)
	lw	a4,0(a5)
	lw	a5,-44(s0)
	bgtu	a4,a5,.L71
	ld	a5,-40(s0)
	lw	a4,4(a5)
	lw	a5,-44(s0)
	bltu	a4,a5,.L71
	ld	a5,-40(s0)
	lw	a4,4(a5)
	ld	a5,-40(s0)
	lw	a5,0(a5)
	subw	a5,a4,a5
	sext.w	a5,a5
	sext.w	a5,a5
	j	.L72
.L71:
	li	a5,-1
.L72:
	sw	a5,-28(s0)
	lw	a5,-28(s0)
	sext.w	a5,a5
	blt	a5,zero,.L73
	lw	a5,-24(s0)
	sext.w	a5,a5
	blt	a5,zero,.L74
	lw	a4,-24(s0)
	lw	a5,-28(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bge	a4,a5,.L74
	lw	a5,-20(s0)
	sext.w	a5,a5
	ble	a5,zero,.L75
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bge	a4,a5,.L75
	lbu	a5,-29(s0)
	j	.L77
.L75:
	lbu	a5,-30(s0)
	j	.L77
.L74:
	lw	a5,-20(s0)
	sext.w	a5,a5
	blt	a5,zero,.L78
	lw	a4,-20(s0)
	lw	a5,-28(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L79
.L78:
	ld	a5,-40(s0)
	lbu	a5,33(a5)
	j	.L77
.L79:
	lbu	a5,-29(s0)
.L77:
	ld	a4,-56(s0)
	sb	a5,0(a4)
	lw	a5,-24(s0)
	sext.w	a5,a5
	blt	a5,zero,.L81
	lw	a4,-24(s0)
	lw	a5,-28(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bge	a4,a5,.L81
	lw	a5,-20(s0)
	sext.w	a5,a5
	ble	a5,zero,.L82
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bge	a4,a5,.L82
	lw	a5,-20(s0)
	j	.L93
.L82:
	lw	a5,-24(s0)
	j	.L93
.L81:
	lw	a5,-20(s0)
	sext.w	a5,a5
	blt	a5,zero,.L85
	lw	a4,-20(s0)
	lw	a5,-28(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bge	a4,a5,.L85
	lw	a5,-20(s0)
	j	.L93
.L85:
	lw	a5,-28(s0)
	j	.L93
.L73:
	lw	a5,-20(s0)
	sext.w	a5,a5
	blt	a5,zero,.L87
	lw	a5,-24(s0)
	sext.w	a5,a5
	blt	a5,zero,.L88
	lw	a4,-24(s0)
	lw	a5,-20(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bge	a4,a5,.L88
	lbu	a5,-30(s0)
	j	.L89
.L88:
	lbu	a5,-29(s0)
.L89:
	ld	a4,-56(s0)
	sb	a5,0(a4)
	lw	a5,-24(s0)
	sext.w	a5,a5
	blt	a5,zero,.L90
	lw	a4,-24(s0)
	lw	a5,-20(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bge	a4,a5,.L90
	lw	a5,-24(s0)
	j	.L93
.L90:
	lw	a5,-20(s0)
	j	.L93
.L87:
	lw	a5,-24(s0)
	sext.w	a5,a5
	blt	a5,zero,.L92
	lbu	a4,-30(s0)
	ld	a5,-56(s0)
	sb	a4,0(a5)
	lw	a5,-24(s0)
	j	.L93
.L92:
	li	a5,-1
.L93:
	mv	a0,a5
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,64
	jr	ra
	.size	find_in_range_tree, .-find_in_range_tree
	.align	1
	.globl	search_in_range_tree
	.type	search_in_range_tree, @function
search_in_range_tree:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	li	a5,-1
	sb	a5,-17(s0)
	lw	a5,-48(s0)
	sext.w	a5,a5
	addi	a4,s0,-17
	mv	a2,a4
	mv	a1,a5
	ld	a0,-40(s0)
	call	find_in_range_tree
	lbu	a5,-17(s0)
	sext.w	a5,a5
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	search_in_range_tree, .-search_in_range_tree
	.align	1
	.globl	delete_elem
	.type	delete_elem, @function
delete_elem:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	ld	a5,-24(s0)
	ld	a5,0(a5)
	ld	a5,16(a5)
	bne	a5,zero,.L97
	ld	a5,-24(s0)
	ld	a4,0(a5)
	ld	a5,-32(s0)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	ld	a5,0(a5)
	ld	a4,24(a5)
	ld	a5,-24(s0)
	sd	a4,0(a5)
	j	.L96
.L97:
	ld	a5,-24(s0)
	ld	a5,0(a5)
	addi	a5,a5,16
	ld	a1,-32(s0)
	mv	a0,a5
	call	delete_elem
	ld	a0,-24(s0)
	call	fixheight
	ld	a0,-24(s0)
	call	fixmax
	ld	a0,-24(s0)
	call	balanced_range_tree
.L96:
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	delete_elem, .-delete_elem
	.align	1
	.globl	delete_from_range_tree
	.type	delete_from_range_tree, @function
delete_from_range_tree:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	addi	s0,sp,64
	sd	a0,-56(s0)
	sd	a1,-64(s0)
	lbu	a5,-58(s0)
	li	a4,32
	subw	a5,a4,a5
	sb	a5,-17(s0)
	lw	a5,-64(s0)
	lbu	a4,-17(s0)
	sext.w	a4,a4
	srlw	a5,a5,a4
	sw	a5,-24(s0)
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sext.w	a5,a5
	lbu	a4,-17(s0)
	sext.w	a4,a4
	srlw	a5,a5,a4
	sext.w	a5,a5
	addiw	a5,a5,-1
	sw	a5,-28(s0)
	lbu	a5,-17(s0)
	sext.w	a5,a5
	mv	a4,a5
	lw	a5,-24(s0)
	sllw	a5,a5,a4
	sw	a5,-24(s0)
	ld	a5,-56(s0)
	ld	a5,0(a5)
	beq	a5,zero,.L107
	ld	a5,-56(s0)
	ld	a5,0(a5)
	lw	a4,0(a5)
	lw	a5,-24(s0)
	sext.w	a5,a5
	bne	a5,a4,.L102
	ld	a5,-56(s0)
	ld	a5,0(a5)
	lw	a4,4(a5)
	lw	a5,-28(s0)
	sext.w	a5,a5
	bne	a5,a4,.L102
	sd	zero,-40(s0)
	ld	a5,-56(s0)
	ld	a5,0(a5)
	ld	a5,24(a5)
	beq	a5,zero,.L103
	ld	a5,-56(s0)
	ld	a5,0(a5)
	addi	a5,a5,24
	addi	a4,s0,-40
	mv	a1,a4
	mv	a0,a5
	call	delete_elem
	ld	a5,-56(s0)
	ld	a4,0(a5)
	ld	a5,-40(s0)
	ld	a4,16(a4)
	sd	a4,16(a5)
	ld	a5,-56(s0)
	ld	a4,0(a5)
	ld	a5,-40(s0)
	ld	a4,24(a4)
	sd	a4,24(a5)
	j	.L104
.L103:
	ld	a5,-56(s0)
	ld	a5,0(a5)
	ld	a5,16(a5)
	beq	a5,zero,.L104
	ld	a5,-56(s0)
	ld	a5,0(a5)
	ld	a5,16(a5)
	sd	a5,-40(s0)
.L104:
	ld	a5,-56(s0)
	ld	a5,0(a5)
	mv	a0,a5
	call	free
	ld	a4,-40(s0)
	ld	a5,-56(s0)
	sd	a4,0(a5)
	ld	a0,-56(s0)
	call	fixheight
	ld	a0,-56(s0)
	call	fixmax
	j	.L99
.L102:
	ld	a5,-56(s0)
	ld	a5,0(a5)
	lw	a4,0(a5)
	lw	a5,-24(s0)
	sext.w	a5,a5
	bleu	a5,a4,.L105
	ld	a5,-56(s0)
	ld	a5,0(a5)
	addi	a5,a5,24
	ld	a1,-64(s0)
	mv	a0,a5
	call	delete_from_range_tree
	j	.L106
.L105:
	ld	a5,-56(s0)
	ld	a5,0(a5)
	addi	a5,a5,16
	ld	a1,-64(s0)
	mv	a0,a5
	call	delete_from_range_tree
.L106:
	ld	a0,-56(s0)
	call	fixheight
	ld	a0,-56(s0)
	call	fixmax
	j	.L99
.L107:
	nop
.L99:
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,64
	jr	ra
	.size	delete_from_range_tree, .-delete_from_range_tree
	.section	.rodata
	.align	3
.LC3:
	.string	"Total non-mmapped bytes (arena):       %u\n"
	.align	3
.LC4:
	.string	"# of free chunks (ordblks):            %u\n"
	.align	3
.LC5:
	.string	"# of free fastbin blocks (smblks):     %u\n"
	.align	3
.LC6:
	.string	"# of mapped regions (hblks):           %u\n"
	.align	3
.LC7:
	.string	"Bytes in mapped regions (hblkhd):      %u\n"
	.align	3
.LC8:
	.string	"Max. total allocated space (usmblks):  %u\n"
	.align	3
.LC9:
	.string	"Free bytes held in fastbins (fsmblks): %u\n"
	.align	3
.LC10:
	.string	"Total allocated space (uordblks):      %u\n"
	.align	3
.LC11:
	.string	"Total free space (fordblks):           %u\n"
	.align	3
.LC12:
	.string	"Topmost releasable block (keepcost):   %u\n"
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
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	ld	a5,-88(s0)
	mv	a1,a5
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	printf
	ld	a5,-80(s0)
	mv	a1,a5
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	printf
	ld	a5,-72(s0)
	mv	a1,a5
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	printf
	ld	a5,-64(s0)
	mv	a1,a5
	lui	a5,%hi(.LC7)
	addi	a0,a5,%lo(.LC7)
	call	printf
	ld	a5,-56(s0)
	mv	a1,a5
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	printf
	ld	a5,-48(s0)
	mv	a1,a5
	lui	a5,%hi(.LC9)
	addi	a0,a5,%lo(.LC9)
	call	printf
	ld	a5,-40(s0)
	mv	a1,a5
	lui	a5,%hi(.LC10)
	addi	a0,a5,%lo(.LC10)
	call	printf
	ld	a5,-32(s0)
	mv	a1,a5
	lui	a5,%hi(.LC11)
	addi	a0,a5,%lo(.LC11)
	call	printf
	ld	a5,-24(s0)
	mv	a1,a5
	lui	a5,%hi(.LC12)
	addi	a0,a5,%lo(.LC12)
	call	printf
	nop
	ld	ra,88(sp)
	ld	s0,80(sp)
	addi	sp,sp,96
	jr	ra
	.size	display_mallinfo2, .-display_mallinfo2
	.section	.rodata
	.align	3
.LC13:
	.string	"Input line number"
	.align	3
.LC14:
	.string	"%d"
	.align	3
.LC15:
	.string	"Input max key"
	.align	3
.LC16:
	.string	"Input mask length"
	.align	3
.LC17:
	.string	"wrong mask"
	.align	3
.LC18:
	.string	"node_number = %d\n"
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
	lui	a5,%hi(.LC13)
	addi	a0,a5,%lo(.LC13)
	call	puts
	addi	a5,s0,-48
	mv	a1,a5
	lui	a5,%hi(.LC14)
	addi	a0,a5,%lo(.LC14)
	call	scanf
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	puts
	addi	a5,s0,-40
	mv	a1,a5
	lui	a5,%hi(.LC14)
	addi	a0,a5,%lo(.LC14)
	call	scanf
	lui	a5,%hi(.LC16)
	addi	a0,a5,%lo(.LC16)
	call	puts
	addi	a5,s0,-44
	mv	a1,a5
	lui	a5,%hi(.LC14)
	addi	a0,a5,%lo(.LC14)
	call	scanf
	lw	a5,-44(s0)
	mv	a4,a5
	li	a5,32
	bleu	a4,a5,.L110
	lui	a5,%hi(.LC17)
	addi	a0,a5,%lo(.LC17)
	call	puts
	li	a5,0
	j	.L116
.L110:
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
	sd	zero,-56(s0)
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
	bleu	a4,a5,.L112
	lw	a4,-32(s0)
	lw	a5,-28(s0)
	subw	a5,a4,a5
	sext.w	a4,a5
	lw	a5,-48(s0)
	divuw	a5,a4,a5
	sw	a5,-20(s0)
	j	.L113
.L112:
	lw	a4,-32(s0)
	lw	a5,-28(s0)
	subw	a5,a4,a5
	sext.w	a5,a5
	sw	a5,-48(s0)
.L113:
	call	display_mallinfo2
	sw	zero,-24(s0)
	j	.L114
.L115:
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
	call	insert_in_range_tree
	lw	a5,-64(s0)
	lw	a4,-20(s0)
	addw	a5,a4,a5
	sext.w	a5,a5
	sw	a5,-64(s0)
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L114:
	lw	a4,-24(s0)
	lw	a5,-48(s0)
	bltu	a4,a5,.L115
	ld	a5,-56(s0)
	mv	a0,a5
	call	find_numer_node
	mv	a5,a0
	sw	a5,-36(s0)
	lw	a5,-36(s0)
	mv	a1,a5
	lui	a5,%hi(.LC18)
	addi	a0,a5,%lo(.LC18)
	call	printf
	call	display_mallinfo2
	li	a5,0
.L116:
	mv	a0,a5
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,64
	jr	ra
	.size	main, .-main
	.ident	"GCC: (SiFive GCC-Metal 10.2.0-2020.12.8) 10.2.0"
