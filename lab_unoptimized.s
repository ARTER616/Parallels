	.file	"lab_unoptimized.c"
	.text
	.section	.rodata
.LC0:
	.string	"Took time: %ld \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$136, %rsp
	.cfi_offset 3, -24
	movl	$80000, %edi
	call	malloc@PLT
	movq	%rax, -40(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L2
.L3:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	$40000, %edi
	call	malloc@PLT
	movq	%rax, (%rbx)
	addl	$1, -20(%rbp)
.L2:
	cmpl	$9999, -20(%rbp)
	jle	.L3
	movl	$400000000, %edi
	call	malloc@PLT
	movq	%rax, -48(%rbp)
	movl	$400000000, %edi
	call	malloc@PLT
	movq	%rax, -56(%rbp)
	movl	$0, -24(%rbp)
	jmp	.L4
.L7:
	movl	$0, -28(%rbp)
	jmp	.L5
.L6:
	movl	-24(%rbp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%ecx, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -28(%rbp)
.L5:
	cmpl	$4999, -28(%rbp)
	jle	.L6
	addl	$1, -24(%rbp)
.L4:
	cmpl	$9999, -24(%rbp)
	jle	.L7
	leaq	-96(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movq	-48(%rbp), %rsi
	movq	-40(%rbp), %rax
	movl	$5000, %ecx
	movl	$10000, %edx
	movq	%rax, %rdi
	call	transposition_consistant
	movl	%eax, -60(%rbp)
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movq	-112(%rbp), %rdx
	movq	-96(%rbp), %rax
	subq	%rax, %rdx
	imulq	$1000000000, %rdx, %rdx
	movq	-104(%rbp), %rcx
	movq	-88(%rbp), %rax
	subq	%rax, %rcx
	leaq	(%rdx,%rcx), %rax
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
.LC1:
	.string	"Unoptimized variant:"
	.text
	.globl	transposition_consistant
	.type	transposition_consistant, @function
transposition_consistant:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	%ecx, -40(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L10
	cmpq	$0, -32(%rbp)
	jne	.L11
.L10:
	movl	$1, %eax
	jmp	.L12
.L11:
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, -4(%rbp)
	jmp	.L13
.L16:
	movl	$0, -8(%rbp)
	jmp	.L14
.L15:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	imull	$10000, %eax, %ecx
	movl	-4(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -8(%rbp)
.L14:
	cmpl	$4999, -8(%rbp)
	jle	.L15
	addl	$1, -4(%rbp)
.L13:
	cmpl	$9999, -4(%rbp)
	jle	.L16
	movl	$0, %eax
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	transposition_consistant, .-transposition_consistant
	.ident	"GCC: (Debian 12.2.0-14) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
