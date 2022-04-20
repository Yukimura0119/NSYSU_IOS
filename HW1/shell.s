	.file	"shell.c"
	.text
	.section	.rodata
.LC0:
	.string	"\n%s\n> "
	.text
	.globl	_Z6promptv
	.type	_Z6promptv, @function
_Z6promptv:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-80(%rbp), %rax
	movl	$64, %esi
	movq	%rax, %rdi
	call	getcwd@PLT
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L2
	call	__stack_chk_fail@PLT
.L2:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z6promptv, .-_Z6promptv
	.globl	_Z9get_inputPc
	.type	_Z9get_inputPc, @function
_Z9get_inputPc:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	stdin(%rip), %rdx
	movq	-8(%rbp), %rax
	movl	$64, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_Z9get_inputPc, .-_Z9get_inputPc
	.section	.rodata
.LC1:
	.string	" \n"
.LC2:
	.string	"|"
.LC3:
	.string	">"
.LC4:
	.string	"<"
.LC5:
	.string	"&"
	.text
	.globl	_Z6parserPcPS_S0_
	.type	_Z6parserPcPS_S0_, @function
_Z6parserPcPS_S0_:
.LFB2:
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
	movq	%rdx, -56(%rbp)
	movq	-40(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -8(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -12(%rbp)
.L13:
	cmpq	$0, -8(%rbp)
	je	.L5
	movq	-8(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L6
	movl	$1, -12(%rbp)
	jmp	.L7
.L6:
	movq	-8(%rbp), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L8
	movl	$2, -12(%rbp)
	jmp	.L7
.L8:
	movq	-8(%rbp), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L9
	movl	$3, -12(%rbp)
	jmp	.L7
.L9:
	movq	-8(%rbp), %rax
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L10
	movl	$4, -12(%rbp)
	jmp	.L7
.L10:
	cmpl	$0, -12(%rbp)
	je	.L11
	movl	-16(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -16(%rbp)
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, (%rdx)
	jmp	.L7
.L11:
	movl	-20(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -20(%rbp)
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, (%rdx)
.L7:
	cmpl	$63, -20(%rbp)
	jg	.L15
	leaq	.LC1(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -8(%rbp)
	jmp	.L13
.L15:
	nop
.L5:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	$0, (%rax)
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	$0, (%rax)
	movl	-12(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_Z6parserPcPS_S0_, .-_Z6parserPcPS_S0_
	.section	.rodata
.LC6:
	.string	"Command error"
	.text
	.globl	_Z11proc_singlePPc
	.type	_Z11proc_singlePPc, @function
_Z11proc_singlePPc:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	call	fork@PLT
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jne	.L17
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	execvp@PLT
	leaq	.LC6(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	_exit@PLT
.L17:
	movl	-4(%rbp), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	waitpid@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	_Z11proc_singlePPc, .-_Z11proc_singlePPc
	.globl	_Z9proc_pipePPcS0_
	.type	_Z9proc_pipePPcS0_, @function
_Z9proc_pipePPcS0_:
.LFB4:
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
	call	fork@PLT
	movl	%eax, -24(%rbp)
	cmpl	$0, -24(%rbp)
	jne	.L19
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	pipe@PLT
	call	fork@PLT
	movl	%eax, -20(%rbp)
	cmpl	$0, -20(%rbp)
	jne	.L20
	movl	-16(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-12(%rbp), %eax
	movl	$1, %esi
	movl	%eax, %edi
	call	dup2@PLT
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	execvp@PLT
	leaq	.LC6(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	_exit@PLT
.L20:
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-16(%rbp), %eax
	movl	$0, %esi
	movl	%eax, %edi
	call	dup2@PLT
	movl	-16(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	execvp@PLT
	leaq	.LC6(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	_exit@PLT
.L19:
	movl	-24(%rbp), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	waitpid@PLT
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L21
	call	__stack_chk_fail@PLT
.L21:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	_Z9proc_pipePPcS0_, .-_Z9proc_pipePPcS0_
	.globl	_Z7proc_bgPPc
	.type	_Z7proc_bgPPc, @function
_Z7proc_bgPPc:
.LFB5:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	call	fork@PLT
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jne	.L24
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	execvp@PLT
	leaq	.LC6(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	_exit@PLT
.L24:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	_Z7proc_bgPPc, .-_Z7proc_bgPPc
	.section	.rodata
.LC7:
	.string	"File error"
	.text
	.globl	_Z10proc_rightPPcS0_
	.type	_Z10proc_rightPPcS0_, @function
_Z10proc_rightPPcS0_:
.LFB6:
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
	call	fork@PLT
	movl	%eax, -8(%rbp)
	cmpl	$0, -8(%rbp)
	jne	.L26
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movl	$777, %edx
	movl	$65, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	jne	.L27
	leaq	.LC7(%rip), %rdi
	call	perror@PLT
	jmp	.L25
.L27:
	movl	-4(%rbp), %eax
	movl	$1, %esi
	movl	%eax, %edi
	call	dup2@PLT
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	execvp@PLT
	leaq	.LC6(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	_exit@PLT
.L26:
	movl	-8(%rbp), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	waitpid@PLT
.L25:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	_Z10proc_rightPPcS0_, .-_Z10proc_rightPPcS0_
	.globl	_Z9proc_leftPPcS0_
	.type	_Z9proc_leftPPcS0_, @function
_Z9proc_leftPPcS0_:
.LFB7:
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
	call	fork@PLT
	movl	%eax, -8(%rbp)
	cmpl	$0, -8(%rbp)
	jne	.L30
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movl	$777, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	jne	.L31
	leaq	.LC7(%rip), %rdi
	call	perror@PLT
	jmp	.L29
.L31:
	movl	-4(%rbp), %eax
	movl	$0, %esi
	movl	%eax, %edi
	call	dup2@PLT
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	execvp@PLT
	leaq	.LC6(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	_exit@PLT
.L30:
	movl	-8(%rbp), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	waitpid@PLT
.L29:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	_Z9proc_leftPPcS0_, .-_Z9proc_leftPPcS0_
	.section	.rodata
.LC8:
	.string	"exit"
.LC9:
	.string	"cd"
.LC10:
	.string	"Address error"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1120, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L49:
	movl	$0, -1108(%rbp)
	call	_Z6promptv
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	_Z9get_inputPc
	leaq	-592(%rbp), %rdx
	leaq	-1104(%rbp), %rcx
	leaq	-80(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_Z6parserPcPS_S0_
	movl	%eax, -1108(%rbp)
	movq	-1104(%rbp), %rax
	testq	%rax, %rax
	je	.L52
	movq	-1104(%rbp), %rax
	leaq	.LC8(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L36
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L50
	jmp	.L51
.L36:
	movq	-1104(%rbp), %rax
	leaq	.LC9(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L38
	movq	-1096(%rbp), %rax
	movq	%rax, %rdi
	call	chdir@PLT
	cmpl	$-1, %eax
	sete	%al
	testb	%al, %al
	je	.L53
	leaq	.LC10(%rip), %rdi
	call	perror@PLT
	jmp	.L53
.L38:
	cmpl	$4, -1108(%rbp)
	ja	.L54
	movl	-1108(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L42(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L42(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L42:
	.long	.L46-.L42
	.long	.L45-.L42
	.long	.L44-.L42
	.long	.L43-.L42
	.long	.L41-.L42
	.text
.L46:
	leaq	-1104(%rbp), %rax
	movq	%rax, %rdi
	call	_Z11proc_singlePPc
	jmp	.L48
.L45:
	leaq	-592(%rbp), %rdx
	leaq	-1104(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_Z9proc_pipePPcS0_
	jmp	.L48
.L44:
	leaq	-592(%rbp), %rdx
	leaq	-1104(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_Z10proc_rightPPcS0_
	jmp	.L48
.L43:
	leaq	-592(%rbp), %rdx
	leaq	-1104(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_Z9proc_leftPPcS0_
	jmp	.L48
.L41:
	leaq	-1104(%rbp), %rax
	movq	%rax, %rdi
	call	_Z7proc_bgPPc
	jmp	.L48
.L52:
	nop
	jmp	.L49
.L53:
	nop
	jmp	.L49
.L54:
	nop
.L48:
	jmp	.L49
.L51:
	call	__stack_chk_fail@PLT
.L50:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
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
