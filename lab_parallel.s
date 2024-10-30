	.file	"lab_parallel.c"
	.text
	.p2align 4,,10
	.p2align 3
	.globl	transpose_thread
	.type	transpose_thread, @function
transpose_thread:
.LFB24:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movslq	16(%rdi), %r10
	movl	20(%rdi), %eax
	movl	24(%rdi), %ebx
	movl	%eax, -60(%rsp)
	cmpl	%eax, %r10d
	jge	.L2
	testl	%ebx, %ebx
	jle	.L2
	movslq	%ebx, %rbp
	movq	8(%rdi), %rcx
	movq	(%rdi), %rdx
	leaq	0(,%rbp,8), %rsi
	movq	%rbp, %r14
	movq	%rbp, %r15
	leaq	(%rsi,%rbp), %r9
	leal	0(,%rbx,8), %r11d
	salq	$4, %r14
	leaq	0(%rbp,%r9,2), %rdi
	salq	$4, %r9
	leaq	0(%rbp,%rbp,2), %rbp
	leaq	0(,%rdi,8), %r12
	movq	%rdx, -56(%rsp)
	movslq	%r11d, %r11
	movq	%rcx, -8(%rsp)
	movq	%r12, -48(%rsp)
	salq	$4, %rbp
	movq	%r9, -40(%rsp)
	leal	-9(%rbx), %r13d
	salq	$3, %r11
	andl	$-8, %r13d
	movq	%r14, -32(%rsp)
	leaq	(%rcx,%r10,8), %r8
	salq	$5, %r15
	leal	8(%r13), %r13d
	movq	%rbp, %r14
	.p2align 4,,10
	.p2align 3
.L3:
	movq	-56(%rsp), %rax
	xorl	%ebp, %ebp
	movq	(%rax,%r10,8), %rdx
	cmpl	$8, %ebx
	jle	.L7
	movq	-48(%rsp), %rax
	movq	-40(%rsp), %r9
	movl	%r13d, %ebp
	leaq	152(%rdx), %rcx
	xorl	%r12d, %r12d
	addq	%r8, %rax
	movq	%rax, %rdi
	subq	%r9, %rdi
	movq	%r8, %r9
	testb	$8, %r13b
	je	.L54
	movsd	-152(%rcx), %xmm0
	prefetcht0	(%rcx)
	prefetchw	(%rax)
	prefetchw	(%rax)
	prefetchw	(%rax)
	prefetchw	(%rax)
	prefetchw	(%rax)
	prefetchw	(%rax)
	prefetchw	(%rax)
	prefetchw	(%rax)
	movq	-32(%rsp), %r12
	addq	%r11, %rax
	leaq	(%r8,%r11), %r9
	movsd	%xmm0, (%r8)
	movsd	-144(%rcx), %xmm1
	movsd	%xmm1, (%rdi)
	movsd	-136(%rcx), %xmm2
	movsd	%xmm2, (%r8,%r12)
	movsd	-128(%rcx), %xmm3
	movsd	%xmm3, (%rdi,%r12)
	movl	$8, %r12d
	movsd	-120(%rcx), %xmm4
	movsd	%xmm4, (%r8,%r15)
	movsd	-112(%rcx), %xmm5
	movsd	%xmm5, (%rdi,%r15)
	movsd	-104(%rcx), %xmm6
	movsd	%xmm6, (%r8,%r14)
	movsd	-96(%rcx), %xmm7
	leaq	216(%rdx), %rcx
	movsd	%xmm7, (%rdi,%r14)
	addq	%r11, %rdi
	cmpl	%r13d, %r12d
	je	.L7
.L54:
	movq	%rdx, -24(%rsp)
	movq	%rsi, -16(%rsp)
.L4:
	movsd	-152(%rcx), %xmm8
	prefetcht0	(%rcx)
	prefetchw	(%rax)
	prefetchw	(%rax)
	prefetchw	(%rax)
	prefetchw	(%rax)
	prefetchw	(%rax)
	prefetchw	(%rax)
	prefetchw	(%rax)
	prefetchw	(%rax)
	movq	-32(%rsp), %rsi
	addq	%r11, %rax
	leaq	64(%rcx), %rdx
	prefetchw	(%rax)
	prefetchw	(%rax)
	prefetchw	(%rax)
	movsd	%xmm8, (%r9)
	prefetchw	(%rax)
	prefetchw	(%rax)
	prefetchw	(%rax)
	prefetchw	(%rax)
	prefetchw	(%rax)
	prefetcht0	(%rdx)
	addl	$16, %r12d
	subq	$-128, %rcx
	addq	%r11, %rax
	movsd	-272(%rcx), %xmm9
	movsd	%xmm9, (%rdi)
	movsd	-264(%rcx), %xmm10
	movsd	%xmm10, (%r9,%rsi)
	movsd	-256(%rcx), %xmm11
	movsd	%xmm11, (%rdi,%rsi)
	movsd	-248(%rcx), %xmm12
	movsd	%xmm12, (%r9,%r15)
	movsd	-240(%rcx), %xmm13
	movsd	%xmm13, (%rdi,%r15)
	movsd	-232(%rcx), %xmm14
	movsd	%xmm14, (%r9,%r14)
	addq	%r11, %r9
	movsd	-224(%rcx), %xmm15
	movsd	%xmm15, (%rdi,%r14)
	addq	%r11, %rdi
	movsd	-216(%rcx), %xmm0
	movsd	%xmm0, (%r9)
	movsd	-208(%rcx), %xmm1
	movsd	%xmm1, (%rdi)
	movsd	-200(%rcx), %xmm2
	movsd	%xmm2, (%r9,%rsi)
	movsd	-192(%rcx), %xmm3
	movsd	%xmm3, (%rdi,%rsi)
	movsd	-184(%rcx), %xmm4
	movsd	%xmm4, (%r9,%r15)
	movsd	-176(%rcx), %xmm5
	movsd	%xmm5, (%rdi,%r15)
	movsd	-168(%rcx), %xmm6
	movsd	%xmm6, (%r9,%r14)
	addq	%r11, %r9
	movsd	-160(%rcx), %xmm7
	movsd	%xmm7, (%rdi,%r14)
	addq	%r11, %rdi
	cmpl	%r13d, %r12d
	jne	.L4
	movq	-24(%rsp), %rdx
	movq	-16(%rsp), %rsi
.L7:
	movl	%ebp, %eax
	movslq	%ebp, %rdi
	movq	-8(%rsp), %rbp
	imull	%ebx, %eax
	movsd	(%rdx,%rdi,8), %xmm8
	movq	%rdi, %r9
	notq	%r9
	leaq	1(%rdi), %rcx
	addl	%ebx, %r9d
	andl	$7, %r9d
	cltq
	addq	%r10, %rax
	leaq	0(%rbp,%rax,8), %r12
	movsd	%xmm8, (%r12)
	addq	%rsi, %r12
	cmpl	%ecx, %ebx
	jle	.L51
	testl	%r9d, %r9d
	je	.L5
	cmpl	$1, %r9d
	je	.L36
	cmpl	$2, %r9d
	je	.L37
	cmpl	$3, %r9d
	je	.L38
	cmpl	$4, %r9d
	je	.L39
	cmpl	$5, %r9d
	je	.L40
	cmpl	$6, %r9d
	je	.L41
	movsd	(%rdx,%rcx,8), %xmm9
	leaq	2(%rdi), %rcx
	movsd	%xmm9, (%r12)
	addq	%rsi, %r12
.L41:
	movsd	(%rdx,%rcx,8), %xmm10
	incq	%rcx
	movsd	%xmm10, (%r12)
	addq	%rsi, %r12
.L40:
	movsd	(%rdx,%rcx,8), %xmm11
	incq	%rcx
	movsd	%xmm11, (%r12)
	addq	%rsi, %r12
.L39:
	movsd	(%rdx,%rcx,8), %xmm12
	incq	%rcx
	movsd	%xmm12, (%r12)
	addq	%rsi, %r12
.L38:
	movsd	(%rdx,%rcx,8), %xmm13
	incq	%rcx
	movsd	%xmm13, (%r12)
	addq	%rsi, %r12
.L37:
	movsd	(%rdx,%rcx,8), %xmm14
	incq	%rcx
	movsd	%xmm14, (%r12)
	addq	%rsi, %r12
.L36:
	movsd	(%rdx,%rcx,8), %xmm15
	incq	%rcx
	movsd	%xmm15, (%r12)
	addq	%rsi, %r12
	cmpl	%ecx, %ebx
	jle	.L51
	.p2align 4,,10
	.p2align 3
.L5:
	movsd	(%rdx,%rcx,8), %xmm0
	movsd	%xmm0, (%r12)
	addq	%rsi, %r12
	movsd	8(%rdx,%rcx,8), %xmm1
	movsd	%xmm1, (%r12)
	addq	%rsi, %r12
	movsd	16(%rdx,%rcx,8), %xmm2
	movsd	%xmm2, (%r12)
	addq	%rsi, %r12
	movsd	24(%rdx,%rcx,8), %xmm3
	movsd	%xmm3, (%r12)
	addq	%rsi, %r12
	movsd	32(%rdx,%rcx,8), %xmm4
	movsd	%xmm4, (%r12)
	addq	%rsi, %r12
	movsd	40(%rdx,%rcx,8), %xmm5
	movsd	%xmm5, (%r12)
	addq	%rsi, %r12
	movsd	48(%rdx,%rcx,8), %xmm6
	movsd	%xmm6, (%r12)
	addq	%rsi, %r12
	movsd	56(%rdx,%rcx,8), %xmm7
	addq	$8, %rcx
	movsd	%xmm7, (%r12)
	addq	%rsi, %r12
	cmpl	%ecx, %ebx
	jg	.L5
.L51:
	incq	%r10
	addq	$8, %r8
	cmpl	%r10d, -60(%rsp)
	jg	.L3
.L2:
	popq	%rbx
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	transpose_thread, .-transpose_thread
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Parallel variant:"
	.text
	.p2align 4,,10
	.p2align 3
	.globl	transposition_parallel
	.type	transposition_parallel, @function
transposition_parallel:
.LFB25:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	$84, %edi
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movl	%edx, %ebx
	movq	%rsi, %r12
	movl	%ecx, %ebp
	movl	%edx, 40(%rsp)
	call	sysconf@PLT
	movq	%rax, %r9
	movl	%eax, 44(%rsp)
	movl	%ebx, %eax
	movslq	%r9d, %r15
	cltd
	leaq	0(,%r15,8), %rdi
	movq	%r9, 8(%rsp)
	idivl	%r9d
	movl	%eax, %r14d
	call	malloc@PLT
	movq	%r15, %rdi
	movq	%rax, %rbx
	salq	$5, %rdi
	call	malloc@PLT
	leaq	.LC0(%rip), %rdi
	movq	%rax, 32(%rsp)
	call	puts@PLT
	movq	8(%rsp), %r9
	testl	%r9d, %r9d
	jle	.L64
	leal	-1(%r9), %ecx
	movl	%r9d, 28(%rsp)
	movq	%rbx, %r11
	movl	%ecx, 8(%rsp)
	xorl	%r10d, %r10d
	movq	32(%rsp), %rcx
	xorl	%edi, %edi
	testb	$1, 44(%rsp)
	jne	.L117
.L127:
	movq	%rbx, 56(%rsp)
	movl	%r14d, %r15d
	movl	%edi, %ebx
	movl	%ebp, %r14d
	movq	%r9, 48(%rsp)
	movq	%r11, %rdi
	movq	%rcx, %rbp
	jmp	.L60
	.p2align 4,,7
	.p2align 3
.L131:
	leal	(%r10,%r15), %eax
	movl	%eax, %r8d
.L59:
	movl	%r8d, 20(%rbp)
	movl	%r10d, 16(%rbp)
	movq	%rbp, %rcx
	prefetchw	232(%rbp)
	movq	%r13, 0(%rbp)
	movq	%r12, 8(%rbp)
	xorl	%esi, %esi
	movl	%r14d, 24(%rbp)
	leaq	transpose_thread(%rip), %rdx
	incl	%ebx
	movq	%rdi, 16(%rsp)
	movl	%eax, 24(%rsp)
	addq	$32, %rbp
	call	pthread_create@PLT
	movq	16(%rsp), %rdi
	movl	24(%rsp), %edx
	addq	$8, %rdi
	cmpl	%ebx, 8(%rsp)
	je	.L129
	leal	(%rdx,%r15), %ecx
	movl	%ecx, %esi
.L123:
	movl	%esi, 20(%rbp)
	movl	%edx, 16(%rbp)
	xorl	%esi, %esi
	prefetchw	232(%rbp)
	movq	%r13, 0(%rbp)
	movq	%r12, 8(%rbp)
	incl	%ebx
	movl	%r14d, 24(%rbp)
	movl	%ecx, 24(%rsp)
	movq	%rbp, %rcx
	leaq	transpose_thread(%rip), %rdx
	movq	%rdi, 16(%rsp)
	addq	$32, %rbp
	call	pthread_create@PLT
	movq	16(%rsp), %rdi
	movl	28(%rsp), %r11d
	movl	24(%rsp), %r10d
	addq	$8, %rdi
	cmpl	%r11d, %ebx
	je	.L130
.L60:
	cmpl	%ebx, 8(%rsp)
	jne	.L131
	movl	40(%rsp), %r8d
	leal	(%r10,%r15), %eax
	jmp	.L59
.L66:
	xorl	%r13d, %r13d
.L61:
	movslq	%r13d, %r14
	movl	44(%rsp), %r15d
	xorl	%esi, %esi
	movq	(%rbx,%r14,8), %rdi
	movq	%r14, %r12
	leaq	1(%r14), %rbp
	notq	%r12
	addl	%r15d, %r12d
	andl	$7, %r12d
	call	pthread_join@PLT
	cmpl	%ebp, %r15d
	jle	.L64
	testl	%r12d, %r12d
	je	.L125
	cmpl	$1, %r12d
	je	.L101
	cmpl	$2, %r12d
	je	.L102
	cmpl	$3, %r12d
	je	.L103
	cmpl	$4, %r12d
	je	.L104
	cmpl	$5, %r12d
	je	.L105
	cmpl	$6, %r12d
	je	.L106
	movq	(%rbx,%rbp,8), %rdi
	xorl	%esi, %esi
	leaq	2(%r14), %rbp
	call	pthread_join@PLT
.L106:
	movq	(%rbx,%rbp,8), %rdi
	xorl	%esi, %esi
	incq	%rbp
	call	pthread_join@PLT
.L105:
	movq	(%rbx,%rbp,8), %rdi
	xorl	%esi, %esi
	incq	%rbp
	call	pthread_join@PLT
.L104:
	movq	(%rbx,%rbp,8), %rdi
	xorl	%esi, %esi
	incq	%rbp
	call	pthread_join@PLT
.L103:
	movq	(%rbx,%rbp,8), %rdi
	xorl	%esi, %esi
	incq	%rbp
	call	pthread_join@PLT
.L102:
	movq	(%rbx,%rbp,8), %rdi
	xorl	%esi, %esi
	incq	%rbp
	call	pthread_join@PLT
.L101:
	movq	(%rbx,%rbp,8), %rdi
	xorl	%esi, %esi
	incq	%rbp
	call	pthread_join@PLT
	cmpl	%ebp, 44(%rsp)
	jle	.L64
.L125:
	movl	44(%rsp), %r13d
.L63:
	movq	(%rbx,%rbp,8), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	8(%rbx,%rbp,8), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	16(%rbx,%rbp,8), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	24(%rbx,%rbp,8), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	32(%rbx,%rbp,8), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	40(%rbx,%rbp,8), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	48(%rbx,%rbp,8), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	56(%rbx,%rbp,8), %rdi
	xorl	%esi, %esi
	addq	$8, %rbp
	call	pthread_join@PLT
	cmpl	%ebp, %r13d
	jg	.L63
.L64:
	movq	%rbx, %rdi
	call	free@PLT
	movq	32(%rsp), %rdi
	call	free@PLT
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,7
	.p2align 3
.L129:
	.cfi_restore_state
	movl	40(%rsp), %esi
	leal	(%rdx,%r15), %ecx
	jmp	.L123
	.p2align 4,,7
	.p2align 3
.L117:
	movl	8(%rsp), %esi
	testl	%esi, %esi
	je	.L132
	movl	%r14d, %r15d
	movl	%r14d, %edi
.L121:
	movl	%edi, 20(%rcx)
	movl	%r10d, 16(%rcx)
	xorl	%esi, %esi
	prefetchw	232(%rcx)
	movq	%r13, (%rcx)
	movq	%r12, 8(%rcx)
	movq	%rbx, %rdi
	movl	%ebp, 24(%rcx)
	leaq	transpose_thread(%rip), %rdx
	movq	%r9, 16(%rsp)
	call	pthread_create@PLT
	movl	28(%rsp), %r9d
	movq	32(%rsp), %rcx
	movl	$1, %edi
	movl	%r15d, %r10d
	leaq	8(%rbx), %r11
	addq	$32, %rcx
	cmpl	%r9d, %edi
	movq	16(%rsp), %r9
	jne	.L127
	.p2align 4,,10
	.p2align 3
.L122:
	cmpl	$8, %r9d
	jle	.L66
	subl	$9, %edi
	xorl	%r15d, %r15d
	leaq	96(%rbx), %r14
	andl	$-8, %edi
	leal	8(%rdi), %r13d
	andl	$8, %edi
	je	.L119
.L62:
	movq	-96(%r14), %rdi
	xorl	%esi, %esi
	prefetcht0	(%r14)
	leaq	64(%r14), %r12
	prefetcht0	(%r12)
	call	pthread_join@PLT
	movq	-88(%r14), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	-80(%r14), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	-72(%r14), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	-64(%r14), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	-56(%r14), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	-48(%r14), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	-40(%r14), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	-32(%r14), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	-24(%r14), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	-16(%r14), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	-8(%r14), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	(%r14), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	8(%r14), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	16(%r14), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	24(%r14), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	addl	$16, %r15d
	subq	$-128, %r14
	cmpl	%r13d, %r15d
	jne	.L62
	jmp	.L61
	.p2align 4,,7
	.p2align 3
.L119:
	movq	-96(%r14), %rdi
	xorl	%esi, %esi
	prefetcht0	(%r14)
	movl	$8, %r15d
	call	pthread_join@PLT
	movq	-88(%r14), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	-80(%r14), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	-72(%r14), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	-64(%r14), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	-56(%r14), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	-48(%r14), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	-40(%r14), %rdi
	xorl	%esi, %esi
	leaq	160(%rbx), %r14
	call	pthread_join@PLT
	cmpl	%r13d, %r15d
	jne	.L62
	jmp	.L61
	.p2align 4,,7
	.p2align 3
.L130:
	movl	%ebx, %edi
	movq	48(%rsp), %r9
	movq	56(%rsp), %rbx
	jmp	.L122
	.p2align 4,,7
	.p2align 3
.L132:
	movl	40(%rsp), %edi
	movl	%r14d, %r15d
	jmp	.L121
	.cfi_endproc
.LFE25:
	.size	transposition_parallel, .-transposition_parallel
	.section	.rodata.str1.1
.LC4:
	.string	"Took time: %ld \n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,10
	.p2align 3
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$80000, %edi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	$8, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	call	malloc@PLT
	movl	$40000, %edi
	movq	%rax, %rbp
	leaq	88(%rax), %rbx
	call	malloc@PLT
	prefetchw	(%rbx)
	movq	%rax, 0(%rbp)
	movl	$40000, %edi
	leaq	152(%rbp), %r14
	call	malloc@PLT
	movq	%rax, 8(%rbp)
	movl	$40000, %edi
	call	malloc@PLT
	movq	%rax, 16(%rbp)
	movl	$40000, %edi
	call	malloc@PLT
	movq	%rax, 24(%rbp)
	movl	$40000, %edi
	call	malloc@PLT
	movq	%rax, 32(%rbp)
	movl	$40000, %edi
	call	malloc@PLT
	movq	%rax, 40(%rbp)
	movl	$40000, %edi
	call	malloc@PLT
	movq	%rax, 48(%rbp)
	movl	$40000, %edi
	call	malloc@PLT
	movq	%rax, 56(%rbp)
.L134:
	movl	$40000, %edi
	prefetchw	(%r14)
	leaq	64(%r14), %r12
	addl	$16, %r13d
	call	malloc@PLT
	movq	%rax, -88(%r14)
	prefetchw	(%r12)
	movl	$40000, %edi
	subq	$-128, %r14
	call	malloc@PLT
	movq	%rax, -208(%r14)
	movl	$40000, %edi
	call	malloc@PLT
	movq	%rax, -200(%r14)
	movl	$40000, %edi
	call	malloc@PLT
	movq	%rax, -192(%r14)
	movl	$40000, %edi
	call	malloc@PLT
	movq	%rax, -184(%r14)
	movl	$40000, %edi
	call	malloc@PLT
	movq	%rax, -176(%r14)
	movl	$40000, %edi
	call	malloc@PLT
	movq	%rax, -168(%r14)
	movl	$40000, %edi
	call	malloc@PLT
	movq	%rax, -160(%r14)
	movl	$40000, %edi
	call	malloc@PLT
	movq	%rax, -152(%r14)
	movl	$40000, %edi
	call	malloc@PLT
	movq	%rax, -144(%r14)
	movl	$40000, %edi
	call	malloc@PLT
	movq	%rax, -136(%r14)
	movl	$40000, %edi
	call	malloc@PLT
	movq	%rax, -128(%r14)
	movl	$40000, %edi
	call	malloc@PLT
	movq	%rax, -120(%r14)
	movl	$40000, %edi
	call	malloc@PLT
	movq	%rax, -112(%r14)
	movl	$40000, %edi
	call	malloc@PLT
	movq	%rax, -104(%r14)
	movl	$40000, %edi
	call	malloc@PLT
	movq	%rax, -96(%r14)
	cmpl	$9992, %r13d
	jne	.L134
	leaq	79936(%rbp), %r13
	movq	%rbp, %r14
	leaq	80000(%rbp), %rbx
	movq	%r13, %r15
.L135:
	movl	$40000, %edi
	addq	$8, %r15
	call	malloc@PLT
	movq	%rax, -8(%r15)
	cmpq	%rbx, %r15
	jne	.L135
	movl	$400000000, %edi
	call	malloc@PLT
	movdqa	.LC2(%rip), %xmm4
	movq	%rax, %r12
	movdqa	.LC3(%rip), %xmm3
	movdqa	.LC1(%rip), %xmm5
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L136:
	movl	%esi, 12(%rsp)
	movq	(%r14), %rcx
	movdqa	%xmm5, %xmm0
	movd	12(%rsp), %xmm7
	leaq	624(%rcx), %rax
	addq	$40624, %rcx
	pshufd	$0, %xmm7, %xmm1
.L137:
	movdqa	%xmm0, %xmm2
	movdqa	%xmm1, %xmm6
	leaq	64(%rax), %rdx
	prefetchw	(%rax)
	movdqa	%xmm1, %xmm15
	prefetchw	(%rdx)
	leaq	128(%rax), %rdi
	leaq	192(%rax), %r8
	paddd	%xmm4, %xmm2
	paddd	%xmm0, %xmm6
	prefetchw	(%rdi)
	prefetchw	(%r8)
	paddd	%xmm3, %xmm0
	leaq	256(%rax), %r9
	addq	$320, %rax
	paddd	%xmm1, %xmm2
	cvtdq2pd	%xmm6, %xmm8
	prefetchw	(%r9)
	paddd	%xmm0, %xmm15
	movdqa	%xmm0, %xmm14
	pshufd	$238, %xmm6, %xmm9
	cvtdq2pd	%xmm2, %xmm11
	paddd	%xmm3, %xmm0
	paddd	%xmm4, %xmm14
	cvtdq2pd	%xmm9, %xmm10
	pshufd	$238, %xmm2, %xmm12
	movups	%xmm8, -944(%rax)
	cvtdq2pd	%xmm15, %xmm7
	pshufd	$238, %xmm15, %xmm2
	paddd	%xmm1, %xmm14
	movups	%xmm11, -912(%rax)
	movdqa	%xmm0, %xmm11
	cvtdq2pd	%xmm12, %xmm13
	cvtdq2pd	%xmm2, %xmm6
	paddd	%xmm4, %xmm11
	cvtdq2pd	%xmm14, %xmm8
	pshufd	$238, %xmm14, %xmm9
	movdqa	%xmm1, %xmm12
	movups	%xmm10, -928(%rax)
	paddd	%xmm1, %xmm11
	cvtdq2pd	%xmm9, %xmm10
	paddd	%xmm0, %xmm12
	movdqa	%xmm1, %xmm9
	paddd	%xmm3, %xmm0
	pshufd	$238, %xmm11, %xmm2
	movups	%xmm6, -864(%rax)
	pshufd	$238, %xmm12, %xmm14
	cvtdq2pd	%xmm2, %xmm6
	paddd	%xmm0, %xmm9
	movups	%xmm8, -848(%rax)
	movdqa	%xmm0, %xmm8
	cvtdq2pd	%xmm14, %xmm15
	paddd	%xmm3, %xmm0
	movups	%xmm13, -896(%rax)
	paddd	%xmm4, %xmm8
	cvtdq2pd	%xmm12, %xmm13
	movdqa	%xmm0, %xmm2
	movups	%xmm7, -880(%rax)
	cvtdq2pd	%xmm11, %xmm7
	pshufd	$238, %xmm9, %xmm11
	paddd	%xmm1, %xmm8
	movups	%xmm6, -768(%rax)
	paddd	%xmm4, %xmm2
	cvtdq2pd	%xmm11, %xmm12
	movdqa	%xmm1, %xmm6
	pshufd	$238, %xmm8, %xmm14
	paddd	%xmm1, %xmm2
	movups	%xmm10, -832(%rax)
	paddd	%xmm0, %xmm6
	cvtdq2pd	%xmm9, %xmm10
	movups	%xmm13, -816(%rax)
	pshufd	$238, %xmm2, %xmm11
	paddd	%xmm3, %xmm0
	cvtdq2pd	%xmm8, %xmm13
	pshufd	$238, %xmm6, %xmm8
	movups	%xmm15, -800(%rax)
	cvtdq2pd	%xmm14, %xmm15
	cvtdq2pd	%xmm8, %xmm9
	movups	%xmm7, -784(%rax)
	cvtdq2pd	%xmm6, %xmm7
	movups	%xmm10, -752(%rax)
	cvtdq2pd	%xmm2, %xmm10
	movups	%xmm12, -736(%rax)
	cvtdq2pd	%xmm11, %xmm12
	movups	%xmm13, -720(%rax)
	movups	%xmm15, -704(%rax)
	movups	%xmm7, -688(%rax)
	movups	%xmm9, -672(%rax)
	movups	%xmm10, -656(%rax)
	movups	%xmm12, -640(%rax)
	cmpq	%rax, %rcx
	jne	.L137
	addl	$10, %esi
	addq	$8, %r14
	cmpl	$100000, %esi
	jne	.L136
	leaq	16(%rsp), %rsi
	movl	$1, %edi
	leaq	160(%rbp), %r14
	call	clock_gettime@PLT
	movl	$5000, %ecx
	movl	$10000, %edx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	transposition_parallel
	leaq	32(%rsp), %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movq	32(%rsp), %r10
	subq	16(%rsp), %r10
	leaq	.LC4(%rip), %rdi
	xorl	%eax, %eax
	imulq	$1000000000, %r10, %rsi
	addq	40(%rsp), %rsi
	subq	24(%rsp), %rsi
	call	printf@PLT
	movq	0(%rbp), %rdi
	leaq	96(%rbp), %r11
	prefetcht0	(%r11)
	call	free@PLT
	movq	8(%rbp), %rdi
	call	free@PLT
	movq	16(%rbp), %rdi
	call	free@PLT
	movq	24(%rbp), %rdi
	call	free@PLT
	movq	32(%rbp), %rdi
	call	free@PLT
	movq	40(%rbp), %rdi
	call	free@PLT
	movq	48(%rbp), %rdi
	call	free@PLT
	movq	56(%rbp), %rdi
	call	free@PLT
	movl	$8, %ecx
.L139:
	movq	-96(%r14), %rdi
	movl	%ecx, 12(%rsp)
	prefetcht0	(%r14)
	leaq	64(%r14), %r15
	subq	$-128, %r14
	prefetcht0	(%r15)
	call	free@PLT
	movq	-216(%r14), %rdi
	call	free@PLT
	movq	-208(%r14), %rdi
	call	free@PLT
	movq	-200(%r14), %rdi
	call	free@PLT
	movq	-192(%r14), %rdi
	call	free@PLT
	movq	-184(%r14), %rdi
	call	free@PLT
	movq	-176(%r14), %rdi
	call	free@PLT
	movq	-168(%r14), %rdi
	call	free@PLT
	movq	-160(%r14), %rdi
	call	free@PLT
	movq	-152(%r14), %rdi
	call	free@PLT
	movq	-144(%r14), %rdi
	call	free@PLT
	movq	-136(%r14), %rdi
	call	free@PLT
	movq	-128(%r14), %rdi
	call	free@PLT
	movq	-120(%r14), %rdi
	call	free@PLT
	movq	-112(%r14), %rdi
	call	free@PLT
	movq	-104(%r14), %rdi
	call	free@PLT
	movl	12(%rsp), %ecx
	addl	$16, %ecx
	cmpl	$9992, %ecx
	jne	.L139
.L140:
	movq	0(%r13), %rdi
	addq	$8, %r13
	call	free@PLT
	cmpq	%rbx, %r13
	jne	.L140
	movq	%rbp, %rdi
	call	free@PLT
	movq	%r12, %rdi
	call	free@PLT
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC2:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC3:
	.long	8
	.long	8
	.long	8
	.long	8
	.ident	"GCC: (Debian 12.2.0-14) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
