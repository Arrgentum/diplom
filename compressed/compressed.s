	.file	"compressed1.c"
	.text
	.globl	delete_tree
	.type	delete_tree, @function
delete_tree:
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
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L3
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	delete_tree
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	delete_tree
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L3:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	delete_tree, .-delete_tree
	.section	.rodata
	.align 8
.LC0:
	.string	"node_number = %d , length = %d\n"
	.align 8
.LC1:
	.string	"ip = %u, mask = %d, key =  %d\n"
.LC2:
	.string	"left"
.LC3:
	.string	"right"
	.text
	.globl	recourse_print_compressed_tree
	.type	recourse_print_compressed_tree, @function
recourse_print_compressed_tree:
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
	movl	%esi, -12(%rbp)
	movl	%edx, %eax
	movb	%al, -16(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L8
	movq	-8(%rbp), %rax
	movzbl	5(%rax), %eax
	movsbl	%al, %edx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movzbl	5(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %ecx
	sall	%cl, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -12(%rbp)
	movq	-8(%rbp), %rax
	movzbl	5(%rax), %eax
	movl	%eax, %edx
	movzbl	-16(%rbp), %eax
	addl	%edx, %eax
	movb	%al, -16(%rbp)
	movq	-8(%rbp), %rax
	movzbl	4(%rax), %eax
	testb	%al, %al
	js	.L6
	movq	-8(%rbp), %rax
	movzbl	4(%rax), %eax
	movsbl	%al, %edx
	movsbl	-16(%rbp), %eax
	movsbl	-16(%rbp), %ecx
	movl	$32, %esi
	subl	%ecx, %esi
	movl	%esi, %ecx
	movl	-12(%rbp), %esi
	sall	%cl, %esi
	movl	%edx, %ecx
	movl	%eax, %edx
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L6:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L7
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movsbl	-16(%rbp), %edx
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	-12(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	recourse_print_compressed_tree
.L7:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L8
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	movsbl	-16(%rbp), %edx
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movl	-12(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	recourse_print_compressed_tree
.L8:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	recourse_print_compressed_tree, .-recourse_print_compressed_tree
	.section	.rodata
	.align 8
.LC4:
	.string	"//////  start__print__tree_  ///////\n"
	.align 8
.LC5:
	.string	"//////  end__print__tree_  ///////\n\n"
	.text
	.globl	print_tree
	.type	print_tree, @function
print_tree:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	movq	-8(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	recourse_print_compressed_tree
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	print_tree, .-print_tree
	.globl	create_top
	.type	create_top, @function
create_top:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, %ecx
	movl	%edx, %eax
	movl	%ecx, %edx
	movb	%dl, -24(%rbp)
	movb	%al, -28(%rbp)
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movzbl	-28(%rbp), %edx
	movb	%dl, 5(%rax)
	movq	-8(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movzbl	-24(%rbp), %edx
	movb	%dl, 4(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	create_top, .-create_top
	.globl	build_top
	.type	build_top, @function
build_top:
.LFB10:
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
	movzbl	-19(%rbp), %eax
	movsbl	%al, %edx
	movzbl	-18(%rbp), %eax
	movsbl	%al, %eax
	addl	%edx, %eax
	cmpl	$32, %eax
	jne	.L13
	movl	$0, %eax
	jmp	.L14
.L13:
	movzbl	-19(%rbp), %eax
	cmpb	$32, %al
	jne	.L15
	movl	-24(%rbp), %eax
	jmp	.L16
.L15:
	movl	-24(%rbp), %edx
	movzbl	-19(%rbp), %eax
	movsbl	%al, %eax
	movl	$1, %esi
	movl	%eax, %ecx
	sall	%cl, %esi
	movl	%esi, %eax
	subl	$1, %eax
	andl	%edx, %eax
.L16:
	movl	%eax, -12(%rbp)
	movzbl	-18(%rbp), %eax
	movsbl	%al, %eax
	movl	$32, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	%cl, -12(%rbp)
	movzbl	-19(%rbp), %eax
	movl	%eax, %edx
	movzbl	-18(%rbp), %eax
	addl	%edx, %eax
	subl	$32, %eax
	movsbl	%al, %edx
	movzbl	-20(%rbp), %eax
	movsbl	%al, %ecx
	movl	-12(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	create_top
	movq	%rax, -8(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L17
	movq	-32(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-32(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
.L17:
	movq	-8(%rbp), %rax
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	build_top, .-build_top
	.globl	remake
	.type	remake, @function
remake:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	$0, -20(%rbp)
	movb	$-1, -22(%rbp)
	movb	$0, -21(%rbp)
	jmp	.L19
.L25:
	movq	-40(%rbp), %rax
	movzbl	5(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %ecx
	sall	%cl, -20(%rbp)
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	addl	%eax, -20(%rbp)
	movq	-40(%rbp), %rax
	movzbl	5(%rax), %eax
	movl	%eax, %edx
	movzbl	-21(%rbp), %eax
	addl	%edx, %eax
	movb	%al, -21(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L20
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L28
.L20:
	movq	-40(%rbp), %rax
	movzbl	4(%rax), %eax
	cmpb	$-1, %al
	je	.L22
	movq	-40(%rbp), %rax
	movzbl	4(%rax), %eax
	movb	%al, -22(%rbp)
	jmp	.L21
.L22:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L23
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -40(%rbp)
	jmp	.L24
.L23:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -40(%rbp)
.L24:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L19:
	cmpq	$0, -40(%rbp)
	jne	.L25
	jmp	.L21
.L28:
	nop
.L21:
	movl	-20(%rbp), %eax
	movl	%eax, -8(%rbp)
	movzbl	-22(%rbp), %eax
	movb	%al, -4(%rbp)
	movzbl	-21(%rbp), %eax
	movb	%al, -3(%rbp)
	movb	$32, -2(%rbp)
	movq	-40(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	build_top
	movq	%rax, -16(%rbp)
	cmpq	$0, -40(%rbp)
	je	.L26
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L26:
	movq	-16(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	remake, .-remake
	.globl	length_prefix
	.type	length_prefix, @function
length_prefix:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-24(%rbp), %rax
	movzbl	5(%rax), %eax
	movb	%al, -10(%rbp)
	movl	-32(%rbp), %eax
	movl	%eax, -8(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movzbl	-27(%rbp), %edx
	movq	-24(%rbp), %rax
	movzbl	5(%rax), %eax
	cmpb	%al, %dl
	jle	.L30
	movzbl	-27(%rbp), %eax
	movsbl	%al, %edx
	movq	-24(%rbp), %rax
	movzbl	5(%rax), %eax
	movsbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	subl	$1, %eax
	movl	%eax, %ecx
	shrl	%cl, -8(%rbp)
	movl	-8(%rbp), %eax
	andl	$1, %eax
	movb	%al, -11(%rbp)
	shrl	-8(%rbp)
.L30:
	movq	-24(%rbp), %rax
	movzbl	5(%rax), %eax
	movl	%eax, %edx
	movzbl	-27(%rbp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movzbl	-26(%rbp), %edx
	subl	%edx, %eax
	addl	$32, %eax
	movb	%al, -9(%rbp)
	movzbl	-27(%rbp), %eax
	cmpb	$32, %al
	je	.L31
	movq	-24(%rbp), %rax
	movzbl	5(%rax), %eax
	movsbl	%al, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	subl	$1, %eax
	andl	-8(%rbp), %eax
	jmp	.L32
.L31:
	movl	-8(%rbp), %eax
.L32:
	movl	%eax, -8(%rbp)
	movzbl	-26(%rbp), %eax
	cmpb	$32, %al
	je	.L34
	cmpb	$0, -9(%rbp)
	jle	.L34
	movsbl	-9(%rbp), %eax
	movl	%eax, %ecx
	shrl	%cl, -8(%rbp)
	movsbl	-9(%rbp), %eax
	movl	%eax, %ecx
	shrl	%cl, -4(%rbp)
	movzbl	-10(%rbp), %edx
	movzbl	-9(%rbp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movb	%al, -10(%rbp)
	jmp	.L34
.L35:
	movl	-8(%rbp), %eax
	andl	$1, %eax
	movb	%al, -11(%rbp)
	shrl	-8(%rbp)
	shrl	-4(%rbp)
	movzbl	-10(%rbp), %eax
	subl	$1, %eax
	movb	%al, -10(%rbp)
.L34:
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jne	.L35
	movq	-40(%rbp), %rax
	movzbl	-11(%rbp), %edx
	movb	%dl, (%rax)
	movzbl	-10(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	length_prefix, .-length_prefix
	.globl	break_top
	.type	break_top, @function
break_top:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%ecx, %eax
	movb	%dl, -52(%rbp)
	movb	%al, -56(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movzbl	5(%rax), %eax
	movsbl	%al, %ecx
	movsbl	-52(%rbp), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	shrl	%cl, %edx
	movl	%edx, %eax
	movl	%eax, -28(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movzbl	5(%rax), %eax
	movsbl	%al, %edx
	movsbl	-52(%rbp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	-28(%rbp), %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %ecx
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	xorl	%ecx, %edx
	movl	%edx, (%rax)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movzbl	5(%rax), %eax
	movl	%eax, %edx
	movzbl	-52(%rbp), %eax
	subl	%eax, %edx
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movb	%dl, 5(%rax)
	movzbl	-43(%rbp), %eax
	movsbl	%al, %edx
	movzbl	-42(%rbp), %eax
	movsbl	%al, %eax
	addl	%edx, %eax
	cmpl	$32, %eax
	je	.L38
	movsbl	-52(%rbp), %edx
	movl	-28(%rbp), %eax
	movl	$-1, %esi
	movl	%eax, %edi
	call	create_top
	movq	%rax, -16(%rbp)
	movq	-48(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	build_top
	movq	%rax, -24(%rbp)
	jmp	.L39
.L38:
	movsbl	-52(%rbp), %edx
	movzbl	-44(%rbp), %eax
	movsbl	%al, %ecx
	movl	-28(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	create_top
	movq	%rax, -16(%rbp)
.L39:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	remake
	movq	%rax, -8(%rbp)
	cmpb	$0, -56(%rbp)
	je	.L40
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 16(%rax)
	jmp	.L41
.L40:
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
.L41:
	movq	-40(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	break_top, .-break_top
	.globl	add_in_compressed_tree
	.type	add_in_compressed_tree, @function
add_in_compressed_tree:
.LFB14:
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
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L43
	movq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	build_top
	movq	-24(%rbp), %rdx
	movq	%rax, (%rdx)
	jmp	.L42
.L43:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	leaq	-10(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	length_prefix
	movb	%al, -9(%rbp)
	movzbl	-27(%rbp), %eax
	subb	-9(%rbp), %al
	movb	%al, -27(%rbp)
	movzbl	-9(%rbp), %edx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movzbl	5(%rax), %eax
	movsbl	%al, %eax
	cmpl	%eax, %edx
	jne	.L45
	movzbl	-27(%rbp), %eax
	movsbl	%al, %eax
	movl	$32, %edx
	subl	%eax, %edx
	movzbl	-26(%rbp), %eax
	movsbl	%al, %eax
	cmpl	%eax, %edx
	jne	.L46
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movzbl	-28(%rbp), %edx
	movb	%dl, 4(%rax)
	jmp	.L42
.L46:
	movzbl	-10(%rbp), %eax
	testb	%al, %al
	je	.L48
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	leaq	16(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	add_in_compressed_tree
	jmp	.L42
.L48:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	leaq	8(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	add_in_compressed_tree
	jmp	.L42
.L45:
	movzbl	-10(%rbp), %eax
	movsbl	%al, %ecx
	movzbl	-9(%rbp), %eax
	movsbl	%al, %edx
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	break_top
.L42:
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L49
	call	__stack_chk_fail@PLT
.L49:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	add_in_compressed_tree, .-add_in_compressed_tree
	.globl	insert_in_compressed_tree
	.type	insert_in_compressed_tree, @function
insert_in_compressed_tree:
.LFB15:
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
	movzbl	-10(%rbp), %eax
	testb	%al, %al
	jns	.L51
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	leaq	16(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	add_in_compressed_tree
	jmp	.L53
.L51:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	leaq	8(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	add_in_compressed_tree
.L53:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	insert_in_compressed_tree, .-insert_in_compressed_tree
	.globl	search_in_compressed_tree
	.type	search_in_compressed_tree, @function
search_in_compressed_tree:
.LFB16:
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
	movb	$-1, -18(%rbp)
	movl	-48(%rbp), %eax
	testl	%eax, %eax
	jns	.L55
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L57
.L55:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L57
.L62:
	leaq	-19(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	-16(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	length_prefix
	movb	%al, -17(%rbp)
	movzbl	-17(%rbp), %edx
	movq	-16(%rbp), %rax
	movzbl	5(%rax), %eax
	movsbl	%al, %eax
	cmpl	%eax, %edx
	jne	.L65
	movzbl	-43(%rbp), %eax
	subb	-17(%rbp), %al
	movb	%al, -43(%rbp)
	movq	-16(%rbp), %rax
	movzbl	4(%rax), %eax
	cmpb	$-1, %al
	je	.L59
	movq	-16(%rbp), %rax
	movzbl	4(%rax), %eax
	movb	%al, -18(%rbp)
.L59:
	movzbl	-19(%rbp), %eax
	testb	%al, %al
	je	.L60
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L57
.L60:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
.L57:
	cmpq	$0, -16(%rbp)
	jne	.L62
	jmp	.L61
.L65:
	nop
.L61:
	movzbl	-18(%rbp), %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L64
	call	__stack_chk_fail@PLT
.L64:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	search_in_compressed_tree, .-search_in_compressed_tree
	.globl	del_from_compressed_tree
	.type	del_from_compressed_tree, @function
del_from_compressed_tree:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L67
.L75:
	leaq	-36(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movq	-32(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	length_prefix
	movb	%al, -33(%rbp)
	movzbl	-33(%rbp), %edx
	movq	-32(%rbp), %rax
	movzbl	5(%rax), %eax
	movsbl	%al, %eax
	cmpl	%eax, %edx
	jne	.L86
	movzbl	-59(%rbp), %eax
	subb	-33(%rbp), %al
	movb	%al, -59(%rbp)
	movzbl	-58(%rbp), %eax
	movsbl	%al, %eax
	movzbl	-59(%rbp), %edx
	movsbl	%dl, %edx
	movl	$32, %ecx
	subl	%edx, %ecx
	movl	%ecx, %edx
	cmpl	%edx, %eax
	je	.L87
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L72
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L72
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movzbl	-35(%rbp), %eax
	movb	%al, -34(%rbp)
	movzbl	-36(%rbp), %eax
	movb	%al, -35(%rbp)
.L72:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -32(%rbp)
	jne	.L73
	movzbl	-36(%rbp), %eax
	movb	%al, -35(%rbp)
.L73:
	movzbl	-36(%rbp), %eax
	testb	%al, %al
	je	.L74
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -32(%rbp)
	jmp	.L67
.L74:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
.L67:
	cmpq	$0, -32(%rbp)
	jne	.L75
	jmp	.L71
.L87:
	nop
.L71:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L76
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L77
.L76:
	movq	-32(%rbp), %rax
	movb	$-1, 4(%rax)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	remake
	movq	-56(%rbp), %rdx
	movq	%rax, (%rdx)
	jmp	.L66
.L77:
	cmpb	$0, -35(%rbp)
	je	.L78
	movq	-24(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	delete_tree
	movq	-24(%rbp), %rax
	movq	$0, 16(%rax)
	jmp	.L79
.L78:
	movq	-24(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	delete_tree
	movq	-24(%rbp), %rax
	movq	$0, 8(%rax)
.L79:
	movq	-32(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jne	.L80
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	delete_tree
	jmp	.L66
.L80:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -24(%rbp)
	jne	.L82
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	remake
	movq	-56(%rbp), %rdx
	movq	%rax, (%rdx)
	jmp	.L66
.L82:
	cmpb	$0, -34(%rbp)
	je	.L83
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	remake
	movq	-16(%rbp), %rdx
	movq	%rax, 16(%rdx)
	jmp	.L66
.L83:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	remake
	movq	-16(%rbp), %rdx
	movq	%rax, 8(%rdx)
	jmp	.L66
.L86:
	nop
.L66:
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L85
	call	__stack_chk_fail@PLT
.L85:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	del_from_compressed_tree, .-del_from_compressed_tree
	.globl	delete_from_compressed_tree
	.type	delete_from_compressed_tree, @function
delete_from_compressed_tree:
.LFB18:
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
	movl	-16(%rbp), %eax
	testl	%eax, %eax
	jns	.L89
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	leaq	16(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	del_from_compressed_tree
	jmp	.L91
.L89:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	leaq	8(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	del_from_compressed_tree
.L91:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	delete_from_compressed_tree, .-delete_from_compressed_tree
	.section	.rodata
.LC6:
	.string	"Input line number"
.LC7:
	.string	"%d"
.LC8:
	.string	"Input max key"
.LC9:
	.string	"Input mask length"
.LC10:
	.string	"wrong mask"
	.align 8
.LC11:
	.string	"number  = %d, mask = %d, key = %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB19:
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
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	leaq	-44(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	leaq	-52(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-48(%rbp), %eax
	cmpl	$32, %eax
	jbe	.L93
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L94
.L93:
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
	movl	$0, %edx
	movl	$-1, %esi
	movl	$0, %edi
	call	create_top
	movq	%rax, -24(%rbp)
	movl	$0, -16(%rbp)
	movb	$0, -12(%rbp)
	movb	$32, -11(%rbp)
	movb	$32, -10(%rbp)
	movl	-28(%rbp), %eax
	subl	-32(%rbp), %eax
	movl	%eax, %edx
	movl	-44(%rbp), %eax
	cmpl	%eax, %edx
	jbe	.L95
	movl	-28(%rbp), %eax
	subl	-32(%rbp), %eax
	movl	-44(%rbp), %esi
	movl	$0, %edx
	divl	%esi
	movl	%eax, -40(%rbp)
	jmp	.L96
.L95:
	movl	-28(%rbp), %eax
	subl	-32(%rbp), %eax
	movl	%eax, -44(%rbp)
.L96:
	movl	$0, -36(%rbp)
	jmp	.L97
.L98:
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
	movzbl	-12(%rbp), %eax
	movsbl	%al, %ecx
	movzbl	-10(%rbp), %eax
	movsbl	%al, %edx
	movl	-16(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-16(%rbp), %rdx
	leaq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	insert_in_compressed_tree
	movl	-16(%rbp), %edx
	movl	-40(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -16(%rbp)
	addl	$1, -36(%rbp)
.L97:
	movl	-36(%rbp), %edx
	movl	-44(%rbp), %eax
	cmpl	%eax, %edx
	jb	.L98
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	print_tree
	movl	$0, %eax
.L94:
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L99
	call	__stack_chk_fail@PLT
.L99:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
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
