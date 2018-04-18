	.file	"main.c"
	.macro rap_indirect_call target hash
		jmp 2001f
		.quad __rap_hash_ret_\hash
		.skip 8-(2002f-2001f),0xcc
	2001:	call \target
	2002:
	.endm
	.macro rap_direct_call target hash=
		.ifb \hash
		rap_indirect_call \target \target
		.else
		rap_indirect_call \target \hash
		.endif
	.endm
	.globl	global
	.data
	.align 4
	.type	global, @object
	.size	global, 4
global:
	.long	40
	.comm	gpf,8,8
	.text
	.quad 0x68d2b621	# __rap_hash_call_zet
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
	.quad 0x655dcd48	# __rap_hash_call_main
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
	movq	-8(%rax), %rax
	cmpq	$1758639649, %rax
	jne	.L4
	movq	-8(%rbp), %rax
	movl	%edx, %edi
	call	*%rax
	movl	%eax, -12(%rbp)
	movq	gpf(%rip), %rax
	movq	-8(%rax), %rdx
	cmpq	$1128302284, %rdx
	jne	.L5
	movl	$.LC0, %edi
	call	*%rax
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	-12(%rbp), %eax
	addl	$2, %eax
	jmp	.L7
.L4:
	ud2
.L5:
	ud2
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.5-4ubuntu2) 4.8.5"
	.section	.note.GNU-stack,"",@progbits
