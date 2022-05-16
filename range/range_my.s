	.file	"range1.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"low = %u, large = %u, max = %u, height = %u, key = %u\n"
.LC1:
	.string	"left"
.LC2:
	.string	"right"
	.text
	.globl	print_tree
	.type	print_tree, @function
print_tree:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L4
	movq	-8(%rbp), %rax
	movzbl	33(%rax), %eax
	movsbl	%al, %edi
	movq	-8(%rbp), %rax
	movzbl	32(%rax), %eax
	movzbl	%al, %esi
	movq	-8(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-8(%rbp), %rax
	movl	4(%rax), %edx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%edi, %r9d
	movl	%esi, %r8d
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L3
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	print_tree
.L3:
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L4
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	print_tree
.L4:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	print_tree, .-print_tree
	.globl	delete_tree
	.type	delete_tree, @function
delete_tree:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L7
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	delete_tree
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$24, %rax
	movq	%rax, %rdi
	call	delete_tree
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L7:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	delete_tree, .-delete_tree
	.globl	create_top
	.type	create_top, @function
create_top:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	%edx, %eax
	movb	%al, -28(%rbp)
	movl	$40, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movl	-20(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	movl	-24(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-8(%rbp), %rax
	movzbl	-28(%rbp), %edx
	movb	%dl, 33(%rax)
	movl	-24(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%edx, 8(%rax)
	movq	-8(%rbp), %rax
	movb	$1, 32(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 24(%rax)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	create_top, .-create_top
	.globl	fixmax
	.type	fixmax, @function
fixmax:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L21
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L13
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L13
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movl	8(%rax), %edx
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movl	8(%rax), %eax
	cmpl	%eax, %edx
	jbe	.L14
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movl	8(%rax), %edx
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	%eax, %edx
	jbe	.L14
	movq	-8(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	8(%rdx), %edx
	movl	%edx, 8(%rax)
	jmp	.L15
.L14:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movl	8(%rax), %edx
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movl	8(%rax), %eax
	cmpl	%eax, %edx
	jb	.L16
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movl	8(%rax), %edx
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	%eax, %edx
	jbe	.L16
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	8(%rdx), %edx
	movl	%edx, 8(%rax)
	jmp	.L15
.L16:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movl	4(%rdx), %edx
	movl	%edx, 8(%rax)
	jmp	.L10
.L15:
	jmp	.L10
.L13:
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L17
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movl	8(%rax), %edx
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	%eax, %edx
	jbe	.L18
	movq	-8(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	8(%rdx), %edx
	movl	%edx, 8(%rax)
	jmp	.L10
.L18:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movl	4(%rdx), %edx
	movl	%edx, 8(%rax)
	jmp	.L10
.L17:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L19
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movl	8(%rax), %edx
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	%eax, %edx
	jbe	.L20
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	8(%rdx), %edx
	movl	%edx, 8(%rax)
	jmp	.L10
.L20:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movl	4(%rdx), %edx
	movl	%edx, 8(%rax)
	jmp	.L10
.L19:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movl	4(%rdx), %edx
	movl	%edx, 8(%rax)
	jmp	.L10
.L21:
	nop
.L10:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	fixmax, .-fixmax
	.globl	fixheight
	.type	fixheight, @function
fixheight:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L29
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L25
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L26
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movzbl	32(%rax), %edx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rax
	movzbl	32(%rax), %eax
	cmpb	%al, %dl
	jbe	.L27
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movzbl	32(%rax), %edx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, %edx
	movb	%dl, 32(%rax)
	jmp	.L22
.L27:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rax
	movzbl	32(%rax), %edx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, %edx
	movb	%dl, 32(%rax)
	jmp	.L22
.L26:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movzbl	32(%rax), %edx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, %edx
	movb	%dl, 32(%rax)
	jmp	.L22
.L25:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L28
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rax
	movzbl	32(%rax), %edx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, %edx
	movb	%dl, 32(%rax)
	jmp	.L22
.L28:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movb	$1, 32(%rax)
	jmp	.L22
.L29:
	nop
.L22:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	fixheight, .-fixheight
	.globl	small_left_rotation
	.type	small_left_rotation, @function
small_left_rotation:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-16(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	fixheight
	movq	-16(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	fixmax
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fixheight
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fixmax
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L32
	call	__stack_chk_fail@PLT
.L32:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	small_left_rotation, .-small_left_rotation
	.globl	small_right_rotation
	.type	small_right_rotation, @function
small_right_rotation:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-16(%rbp), %rax
	addq	$24, %rax
	movq	%rax, %rdi
	call	fixheight
	movq	-16(%rbp), %rax
	addq	$24, %rax
	movq	%rax, %rdi
	call	fixmax
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fixheight
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fixmax
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L35
	call	__stack_chk_fail@PLT
.L35:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	small_right_rotation, .-small_right_rotation
	.globl	big_left_rotation
	.type	big_left_rotation, @function
big_left_rotation:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	small_right_rotation
	movq	-8(%rbp), %rdx
	movq	%rax, 24(%rdx)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	small_left_rotation
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	big_left_rotation, .-big_left_rotation
	.globl	big_right_rotation
	.type	big_right_rotation, @function
big_right_rotation:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	small_left_rotation
	movq	-8(%rbp), %rdx
	movq	%rax, 16(%rdx)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	small_right_rotation
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	big_right_rotation, .-big_right_rotation
	.globl	balanced_range_tree
	.type	balanced_range_tree, @function
balanced_range_tree:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L41
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L41
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movzbl	32(%rax), %eax
	movzbl	%al, %edx
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movzbl	32(%rax), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	cmpl	$2, %eax
	je	.L42
.L41:
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	jne	.L43
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L43
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movzbl	32(%rax), %eax
	cmpb	$1, %al
	jbe	.L43
.L42:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L44
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L44
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	16(%rax), %rax
	movzbl	32(%rax), %edx
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	24(%rax), %rax
	movzbl	32(%rax), %eax
	cmpb	%al, %dl
	ja	.L45
.L44:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L46
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	jne	.L46
.L45:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	small_right_rotation
	movq	-24(%rbp), %rdx
	movq	%rax, (%rdx)
	jmp	.L43
.L46:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	big_right_rotation
	movq	-24(%rbp), %rdx
	movq	%rax, (%rdx)
.L43:
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L47
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L47
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movzbl	32(%rax), %eax
	movzbl	%al, %edx
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movzbl	32(%rax), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	cmpl	$2, %eax
	je	.L48
.L47:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L53
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L53
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movzbl	32(%rax), %eax
	cmpb	$1, %al
	jbe	.L53
.L48:
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L50
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L50
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	24(%rax), %rax
	movzbl	32(%rax), %edx
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	movzbl	32(%rax), %eax
	cmpb	%al, %dl
	ja	.L51
.L50:
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L52
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L52
.L51:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	small_left_rotation
	movq	-24(%rbp), %rdx
	movq	%rax, (%rdx)
	jmp	.L53
.L52:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	big_left_rotation
	movq	-24(%rbp), %rdx
	movq	%rax, (%rdx)
.L53:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	balanced_range_tree, .-balanced_range_tree
	.globl	add_in_range_tree
	.type	add_in_range_tree, @function
add_in_range_tree:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L55
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L54
.L55:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jne	.L57
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	4(%rax), %edx
	movq	-16(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	%eax, %edx
	je	.L60
.L57:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jbe	.L58
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	leaq	16(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	add_in_range_tree
	jmp	.L59
.L58:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	leaq	24(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	add_in_range_tree
.L59:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fixheight
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fixmax
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	balanced_range_tree
	jmp	.L54
.L60:
	nop
.L54:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	add_in_range_tree, .-add_in_range_tree
	.globl	insert_in_range_tree
	.type	insert_in_range_tree, @function
insert_in_range_tree:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	-48(%rbp), %eax
	movl	%eax, -16(%rbp)
	movzbl	-42(%rbp), %eax
	movl	$32, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movb	%al, -17(%rbp)
	movl	-48(%rbp), %edx
	movsbl	-17(%rbp), %eax
	movl	%eax, %ecx
	shrl	%cl, %edx
	movl	%edx, %eax
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	movsbl	-17(%rbp), %eax
	movl	%eax, %ecx
	sall	%cl, -16(%rbp)
	movsbl	-17(%rbp), %eax
	movl	-12(%rbp), %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	subl	$1, %eax
	movl	%eax, -12(%rbp)
	movzbl	-44(%rbp), %eax
	movsbl	%al, %edx
	movl	-12(%rbp), %ecx
	movl	-16(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	create_top
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	add_in_range_tree
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	insert_in_range_tree, .-insert_in_range_tree
	.globl	find_in_range_tree
	.type	find_in_range_tree, @function
find_in_range_tree:
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$-1, -20(%rbp)
	movl	$-1, -16(%rbp)
	movl	$-1, -12(%rbp)
	movb	$-1, -22(%rbp)
	movb	$-1, -21(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L63
	movl	$-1, %eax
	jmp	.L90
.L63:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L65
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movl	8(%rax), %edx
	movl	-44(%rbp), %eax
	cmpl	%eax, %edx
	jb	.L65
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	-21(%rbp), %rdx
	movl	-44(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	find_in_range_tree
	movl	%eax, -16(%rbp)
.L65:
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L66
	movq	-40(%rbp), %rax
	movl	(%rax), %edx
	movl	-44(%rbp), %eax
	cmpl	%eax, %edx
	jbe	.L67
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L66
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movl	8(%rax), %edx
	movl	-44(%rbp), %eax
	cmpl	%eax, %edx
	ja	.L66
.L67:
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	leaq	-22(%rbp), %rdx
	movl	-44(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	find_in_range_tree
	movl	%eax, -20(%rbp)
.L66:
	movq	-40(%rbp), %rax
	movl	(%rax), %edx
	movl	-44(%rbp), %eax
	cmpl	%eax, %edx
	ja	.L68
	movq	-40(%rbp), %rax
	movl	4(%rax), %edx
	movl	-44(%rbp), %eax
	cmpl	%eax, %edx
	jb	.L68
	movq	-40(%rbp), %rax
	movl	4(%rax), %edx
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	jmp	.L69
.L68:
	movl	$-1, %eax
.L69:
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	js	.L70
	cmpl	$0, -16(%rbp)
	js	.L71
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.L71
	cmpl	$0, -20(%rbp)
	jle	.L72
	movl	-20(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.L72
	movzbl	-22(%rbp), %eax
	jmp	.L74
.L72:
	movzbl	-21(%rbp), %eax
	jmp	.L74
.L71:
	cmpl	$0, -20(%rbp)
	js	.L75
	movl	-20(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jl	.L76
.L75:
	movq	-40(%rbp), %rax
	movzbl	33(%rax), %eax
	jmp	.L74
.L76:
	movzbl	-22(%rbp), %eax
.L74:
	movq	-56(%rbp), %rdx
	movb	%al, (%rdx)
	cmpl	$0, -16(%rbp)
	js	.L78
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.L78
	cmpl	$0, -20(%rbp)
	jle	.L79
	movl	-20(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.L79
	movl	-20(%rbp), %eax
	jmp	.L90
.L79:
	movl	-16(%rbp), %eax
	jmp	.L90
.L78:
	cmpl	$0, -20(%rbp)
	js	.L82
	movl	-20(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.L82
	movl	-20(%rbp), %eax
	jmp	.L90
.L82:
	movl	-12(%rbp), %eax
	jmp	.L90
.L70:
	cmpl	$0, -20(%rbp)
	js	.L84
	cmpl	$0, -16(%rbp)
	js	.L85
	movl	-16(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.L85
	movzbl	-21(%rbp), %eax
	jmp	.L86
.L85:
	movzbl	-22(%rbp), %eax
.L86:
	movq	-56(%rbp), %rdx
	movb	%al, (%rdx)
	cmpl	$0, -16(%rbp)
	js	.L87
	movl	-16(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.L87
	movl	-16(%rbp), %eax
	jmp	.L90
.L87:
	movl	-20(%rbp), %eax
	jmp	.L90
.L84:
	cmpl	$0, -16(%rbp)
	js	.L89
	movzbl	-21(%rbp), %edx
	movq	-56(%rbp), %rax
	movb	%dl, (%rax)
	movl	-16(%rbp), %eax
	jmp	.L90
.L89:
	movl	$-1, %eax
.L90:
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L91
	call	__stack_chk_fail@PLT
.L91:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	find_in_range_tree, .-find_in_range_tree
	.globl	search_in_range_tree
	.type	search_in_range_tree, @function
search_in_range_tree:
.LFB19:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movb	$-1, -9(%rbp)
	movl	-32(%rbp), %eax
	movl	%eax, %ecx
	leaq	-9(%rbp), %rdx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	find_in_range_tree
	movzbl	-9(%rbp), %eax
	testb	%al, %al
	js	.L93
	movzbl	-9(%rbp), %eax
	movsbl	%al, %eax
	jmp	.L95
.L93:
	movl	$-1, %eax
.L95:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L96
	call	__stack_chk_fail@PLT
.L96:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	search_in_range_tree, .-search_in_range_tree
	.globl	delete_elem
	.type	delete_elem, @function
delete_elem:
.LFB20:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L98
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	jmp	.L97
.L98:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	leaq	16(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	delete_elem
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fixheight
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fixmax
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	balanced_range_tree
.L97:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	delete_elem, .-delete_elem
	.globl	delete_from_range_tree
	.type	delete_from_range_tree, @function
delete_from_range_tree:
.LFB21:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movzbl	-42(%rbp), %eax
	movl	$32, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movb	%al, -25(%rbp)
	movl	-48(%rbp), %edx
	movsbl	-25(%rbp), %eax
	movl	%eax, %ecx
	shrl	%cl, %edx
	movl	%edx, %eax
	movl	%eax, -24(%rbp)
	movl	-24(%rbp), %eax
	leal	1(%rax), %edx
	movsbl	-25(%rbp), %eax
	movl	%eax, %ecx
	shrl	%cl, %edx
	movl	%edx, %eax
	subl	$1, %eax
	movl	%eax, -20(%rbp)
	movsbl	-25(%rbp), %eax
	movl	%eax, %ecx
	sall	%cl, -24(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L109
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jne	.L103
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movl	4(%rax), %eax
	cmpl	%eax, -20(%rbp)
	jne	.L103
	movq	$0, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L104
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	leaq	24(%rax), %rdx
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	delete_elem
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	16(%rdx), %rdx
	movq	%rdx, 16(%rax)
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rax)
	jmp	.L105
.L104:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L105
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, -16(%rbp)
.L105:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-16(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fixheight
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fixmax
	jmp	.L100
.L103:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jbe	.L106
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	leaq	24(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	delete_from_range_tree
	jmp	.L107
.L106:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	leaq	16(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	delete_from_range_tree
.L107:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fixheight
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fixmax
	jmp	.L100
.L109:
	nop
.L100:
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L108
	call	__stack_chk_fail@PLT
.L108:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	delete_from_range_tree, .-delete_from_range_tree
	.section	.rodata
	.align 8
.LC3:
	.string	"Total non-mmapped bytes (arena):       %u\n"
	.align 8
.LC4:
	.string	"# of free chunks (ordblks):            %u\n"
	.align 8
.LC5:
	.string	"# of free fastbin blocks (smblks):     %u\n"
	.align 8
.LC6:
	.string	"# of mapped regions (hblks):           %u\n"
	.align 8
.LC7:
	.string	"Bytes in mapped regions (hblkhd):      %u\n"
	.align 8
.LC8:
	.string	"Max. total allocated space (usmblks):  %u\n"
	.align 8
.LC9:
	.string	"Free bytes held in fastbins (fsmblks): %u\n"
	.align 8
.LC10:
	.string	"Total allocated space (uordblks):      %u\n"
	.align 8
.LC11:
	.string	"Total free space (fordblks):           %u\n"
	.align 8
.LC12:
	.string	"Topmost releasable block (keepcost):   %u\n"
	.text
	.type	display_mallinfo2, @function
display_mallinfo2:
.LFB22:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	mallinfo@PLT
	movl	-48(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-44(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-40(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-32(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-28(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-20(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-16(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC12(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L111
	call	__stack_chk_fail@PLT
.L111:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	display_mallinfo2, .-display_mallinfo2
	.section	.rodata
.LC13:
	.string	"Input line number"
.LC14:
	.string	"%d"
.LC15:
	.string	"Input max key"
.LC16:
	.string	"Input mask length"
.LC17:
	.string	"wrong mask"
	.text
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -52(%rbp)
	movl	$32, -48(%rbp)
	movl	$1, -40(%rbp)
	movl	$0, -44(%rbp)
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	leaq	-44(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC14(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	leaq	-52(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC14(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC16(%rip), %rdi
	call	puts@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC14(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-48(%rbp), %eax
	cmpl	$32, %eax
	jbe	.L113
	leaq	.LC17(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L119
.L113:
	movl	$0, -32(%rbp)
	movl	-48(%rbp), %eax
	movl	$32, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	subl	$1, %eax
	movl	%eax, -28(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -16(%rbp)
	movb	$0, -12(%rbp)
	movb	$32, -11(%rbp)
	movb	$32, -10(%rbp)
	movl	-28(%rbp), %eax
	subl	-32(%rbp), %eax
	movl	%eax, %edx
	movl	-44(%rbp), %eax
	cmpl	%eax, %edx
	jbe	.L115
	movl	-28(%rbp), %eax
	subl	-32(%rbp), %eax
	movl	-44(%rbp), %esi
	movl	$0, %edx
	divl	%esi
	movl	%eax, -40(%rbp)
	jmp	.L116
.L115:
	movl	-28(%rbp), %eax
	subl	-32(%rbp), %eax
	movl	%eax, -44(%rbp)
.L116:
	movl	$0, -36(%rbp)
	jmp	.L117
.L118:
	movl	-36(%rbp), %eax
	movl	-52(%rbp), %ecx
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	movb	%al, -12(%rbp)
	call	rand@PLT
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	movl	$32, %ecx
	subl	%eax, %ecx
	movl	%edx, %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	movl	$32, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movb	%al, -10(%rbp)
	movq	-16(%rbp), %rdx
	leaq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	insert_in_range_tree
	movl	-16(%rbp), %edx
	movl	-40(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -16(%rbp)
	addl	$1, -36(%rbp)
.L117:
	movl	-36(%rbp), %edx
	movl	-44(%rbp), %eax
	cmpl	%eax, %edx
	jb	.L118
	movl	$0, %eax
.L119:
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L120
	call	__stack_chk_fail@PLT
.L120:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
