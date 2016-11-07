	.file	"mystery.c"
	.text
	.globl	add
	.type	add, @function
add:
.LFB37:
	.cfi_startproc
	leal	(%rdi,%rsi), %eax
	ret
	.cfi_endproc
.LFE37:
	.size	add, .-add
	.globl	dothething
	.type	dothething, @function
dothething:
.LFB38:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	%edi, %ebx
	testl	%edi, %edi
	jle	.L4
	cmpl	$1, %edi
	je	.L5
	movl	$0, %eax
	cmpl	$1, %edi
	jle	.L3
	leal	-2(%rdi), %edi
	call	dothething
	movl	%eax, %ebp
	leal	-1(%rbx), %edi
	call	dothething
	addl	%ebp, %eax
	jmp	.L3
.L4:
	movl	$0, %eax
	jmp	.L3
.L5:
	movl	$1, %eax
.L3:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE38:
	.size	dothething, .-dothething
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Incorrect number of arguments"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Integer size is too small. Range is 1 -> 46"
	.align 8
.LC2:
	.string	"Integer size is too large. Range is 1 -> 46"
	.section	.rodata.str1.1
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
.LFB39:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	%edi, %ebp
	movq	8(%rsi), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	cmpl	$2, %ebp
	jle	.L9
	movl	$.LC0, %edi
	call	puts
	movl	$-1, %eax
	jmp	.L10
.L9:
	movq	%rax, %rbx
	testl	%ebp, %ebp
	jg	.L11
	movl	$.LC0, %edi
	call	puts
	movl	$-1, %eax
	jmp	.L10
.L11:
	testl	%eax, %eax
	jns	.L12
	movl	$.LC1, %edi
	call	puts
	movl	$-1, %eax
	jmp	.L10
.L12:
	cmpl	$46, %eax
	jle	.L13
	movl	$.LC2, %edi
	call	puts
	movl	$-1, %eax
	jmp	.L10
.L13:
	movl	$num, %edx
	movl	$num+796, %ecx
.L15:
	movl	$-1, (%rdx)
	addq	$4, %rdx
	cmpq	%rcx, %rdx
	jne	.L15
	movl	$.LC3, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movl	%ebx, %edi
	call	dothething
	movl	%eax, %esi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
.L10:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.comm	num,796,32
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-4)"
	.section	.note.GNU-stack,"",@progbits
