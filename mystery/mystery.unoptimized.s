	.file	"mystery.c"
	.comm	num,796,32
	.text
	.globl	add
	.type	add, @function
add:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	-4(%rbp), %edx
	addl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	add, .-add
	.globl	dothething
	.type	dothething, @function
dothething:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movl	%edi, -20(%rbp)
	cmpl	$0, -20(%rbp)
	jg	.L4
	movl	$0, %eax
	jmp	.L5
.L4:
	cmpl	$1, -20(%rbp)
	jne	.L6
	movl	$1, %eax
	jmp	.L5
.L6:
	cmpl	$1, -20(%rbp)
	jle	.L7
	movl	-20(%rbp), %eax
	subl	$2, %eax
	movl	%eax, %edi
	call	dothething
	movl	%eax, %ebx
	movl	-20(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	dothething
	movl	%ebx, %esi
	movl	%eax, %edi
	call	add
	jmp	.L5
.L7:
	movl	$0, %eax
.L5:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	dothething, .-dothething
	.section	.rodata
.LC0:
	.string	"Incorrect number of arguments"
	.align 8
.LC1:
	.string	"Integer size is too small. Range is 1 -> 46"
	.align 8
.LC2:
	.string	"Integer size is too large. Range is 1 -> 46"
.LC3:
	.string	"Value: "
.LC4:
	.string	"%s"
.LC5:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -4(%rbp)
	movq	-32(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -8(%rbp)
	cmpl	$2, -20(%rbp)
	jle	.L9
	movl	$.LC0, %edi
	call	puts
	movl	$-1, %eax
	jmp	.L10
.L9:
	cmpl	$0, -20(%rbp)
	jg	.L11
	movl	$.LC0, %edi
	call	puts
	movl	$-1, %eax
	jmp	.L10
.L11:
	cmpl	$0, -8(%rbp)
	jns	.L12
	movl	$.LC1, %edi
	call	puts
	movl	$-1, %eax
	jmp	.L10
.L12:
	cmpl	$46, -8(%rbp)
	jle	.L13
	movl	$.LC2, %edi
	call	puts
	movl	$-1, %eax
	jmp	.L10
.L13:
	jmp	.L14
.L15:
	movl	-4(%rbp), %eax
	cltq
	movl	$-1, num(,%rax,4)
	addl	$1, -4(%rbp)
.L14:
	cmpl	$198, -4(%rbp)
	jle	.L15
	movl	$.LC3, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	dothething
	movl	%eax, %esi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-4)"
	.section	.note.GNU-stack,"",@progbits
