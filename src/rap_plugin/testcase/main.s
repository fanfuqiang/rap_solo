	.file	"main.c"
	.globl	global
	.data
	.align 4
	.type	global, @object
	.size	global, 4
global:
	.long	40
	.comm	gpf,8,8
	.text
	.globl	zet
	.type	zet, @function
zet:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movsd	%xmm0, -16(%rbp)
	cvtsi2sd	-4(%rbp), %xmm0
	addsd	-16(%rbp), %xmm0
	cvttsd2si	%xmm0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	zet, .-zet
	.section	.rodata
.LC0:
	.string	"value: "
.LC1:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$2, -12(%rbp)
	movq	$zet, -8(%rbp)
	movq	$puts, gpf(%rip)
	movl	global(%rip), %eax
	cvtsi2sd	%eax, %xmm0
	movl	-12(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%edx, %edi
	call	*%rax
	movl	%eax, -12(%rbp)
	movq	gpf(%rip), %rax
	movl	$.LC0, %edi
	call	*%rax
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	-12(%rbp), %eax
	addl	$2, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.5-4ubuntu2) 4.8.5"
	.section	.note.GNU-stack,"",@progbits
