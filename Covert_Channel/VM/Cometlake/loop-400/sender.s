	.file	"sender.c"
	.text
	.globl	rdtsc_nofence
	.type	rdtsc_nofence, @function
rdtsc_nofence:
.LFB0:
	.cfi_startproc
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
	.local	sem_id
	.comm	sem_id,4,4
	.local	sem_id2
	.comm	sem_id2,4,4
	.local	sem_id3
	.comm	sem_id3,4,4
	.local	connect_fd
	.comm	connect_fd,4,4
	.local	shm
	.comm	shm,8,8
	.local	shm2
	.comm	shm2,8,8
	.local	shm3
	.comm	shm3,8,8
	.globl	temp2
	.data
	.align 4
	.type	temp2, @object
	.size	temp2, 4
temp2:
	.long	34
	.globl	m
	.align 4
	.type	m, @object
	.size	m, 4
m:
	.long	5
	.globl	i
	.bss
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.globl	n
	.data
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.long	5
	.text
	.globl	calla
	.type	calla, @function
calla:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	calla, .-calla
	.type	semaphore_v, @function
semaphore_v:
.LFB14:
	.cfi_startproc
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
	jne	.L15
	movl	$-1, %eax
	jmp	.L17
.L15:
	movl	$0, %eax
.L17:
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L18
	call	__stack_chk_fail@PLT
.L18:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	semaphore_v, .-semaphore_v
	.type	semaphore_p, @function
semaphore_p:
.LFB15:
	.cfi_startproc
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
	jne	.L20
	movl	$-1, %eax
	jmp	.L22
.L20:
	movl	$0, %eax
.L22:
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L23
	call	__stack_chk_fail@PLT
.L23:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	semaphore_p, .-semaphore_p
	.type	semaphore_init, @function
semaphore_init:
.LFB16:
	.cfi_startproc
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
	jne	.L25
	movl	$-1, %eax
	jmp	.L26
.L25:
	movl	$0, %eax
.L26:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	semaphore_init, .-semaphore_init
	.type	sharemmy_init, @function
sharemmy_init:
.LFB17:
	.cfi_startproc
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
	jne	.L28
	movl	-4(%rbp), %eax
	jmp	.L29
.L28:
	movl	-4(%rbp), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	shmat@PLT
	movq	%rax, shm(%rip)
	movq	shm(%rip), %rax
	cmpq	$-1, %rax
	jne	.L30
	movl	$-1, %eax
	jmp	.L29
.L30:
	movl	-4(%rbp), %eax
.L29:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	sharemmy_init, .-sharemmy_init
	.type	sharemmy_destroy, @function
sharemmy_destroy:
.LFB18:
	.cfi_startproc
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
	jne	.L32
	movl	-4(%rbp), %eax
	jmp	.L33
.L32:
	movl	$0, %eax
.L33:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	sharemmy_destroy, .-sharemmy_destroy
	.section	.rodata
.LC0:
	.string	"cpu affinity set"
	.align 8
.LC1:
	.string	"get CPU affinity failue, ERROR:%s\n"
	.align 8
.LC2:
	.string	"this process %d of running processor: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB19:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$176, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	set_cpu
	leaq	-160(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %eax
	movl	$16, %edx
	movq	%rsi, %rdi
	movq	%rdx, %rcx
	rep stosq
	leaq	-160(%rbp), %rax
	movq	%rax, %rdx
	movl	$128, %esi
	movl	$0, %edi
	call	sched_getaffinity@PLT
	cmpl	$-1, %eax
	jne	.L35
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %eax
	jmp	.L65
.L35:
	movl	$0, i(%rip)
	jmp	.L37
.L41:
	movl	i(%rip), %eax
	cltq
	movq	%rax, -168(%rbp)
	cmpq	$1023, -168(%rbp)
	ja	.L38
	movq	-168(%rbp), %rax
	shrq	$6, %rax
	leaq	0(,%rax,8), %rdx
	leaq	-160(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-168(%rbp), %rax
	andl	$63, %eax
	movl	%eax, %ecx
	shrq	%cl, %rdx
	movq	%rdx, %rax
	andl	$1, %eax
	testq	%rax, %rax
	je	.L38
	movl	$1, %eax
	jmp	.L39
.L38:
	movl	$0, %eax
.L39:
	testl	%eax, %eax
	je	.L40
	movl	i(%rip), %ebx
	call	getpid@PLT
	movl	%ebx, %edx
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L40:
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
.L37:
	movl	i(%rip), %eax
	cmpl	$3, %eax
	jle	.L41
	movl	$0, -188(%rbp)
	movl	$0, m(%rip)
.L48:
	movl	$0, %eax
	call	rdtsc
	movq	%rax, %r12
	movl	$0, %eax
	jmp	.L42
	.align 32
.L43:
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
.L42:
	cmpl	$299, %eax
	jle	.L43
	movl	$0, %eax
	call	rdtsc
	subq	%r12, %rax
	movq	%rax, %r12
	cmpq	$3299, %r12
	ja	.L44
	cmpq	$3100, %r12
	jbe	.L44
	addl	$1, -188(%rbp)
.L44:
	movl	m(%rip), %eax
	addl	$1, %eax
	movl	%eax, m(%rip)
	movl	m(%rip), %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$100, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	testl	%eax, %eax
	jne	.L48
	cmpl	$70, -188(%rbp)
	jg	.L68
	movl	$0, -188(%rbp)
	jmp	.L48
.L68:
	nop
	movl	$0, %eax
	call	rdtsc
	movq	%rax, %rbx
	movq	%rbx, %rax
	shrq	$6, %rax
	movabsq	$157412216095654841, %rdx
	mulq	%rdx
	movq	%rdx, %rax
	shrq	$4, %rax
	movq	%rax, -176(%rbp)
	movq	-176(%rbp), %rax
	imulq	$120000, %rax, %rax
	movq	%rbx, %rsi
	subq	%rax, %rsi
	movq	%rsi, %rax
	movq	%rax, -176(%rbp)
	movq	%rbx, %rax
	subq	-176(%rbp), %rax
	leaq	240000(%rax), %rbx
	movl	$1, -180(%rbp)
	movl	$0, -184(%rbp)
	jmp	.L49
.L64:
	movl	$0, %eax
	call	rdtsc
	movq	%rax, %r12
	movl	-184(%rbp), %eax
	andl	$3, %eax
	movl	%eax, -180(%rbp)
	jmp	.L50
.L51:
	movl	$0, %eax
	call	rdtsc
	movq	%rax, %r12
.L50:
	cmpq	%rbx, %r12
	jb	.L51
	cmpl	$0, -180(%rbp)
	jne	.L52
	movl	$0, %eax
	jmp	.L53

	.align 32
.L54:
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
.L53:
	cmpl	$2700, %eax
	jle	.L54
	jmp	.L55
.L52:
	cmpl	$1, -180(%rbp)
	jne	.L56
	movl	$0, %eax
	jmp	.L57

	.align 32
.L58:
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
.L57:
	cmpl	$1400, %eax
	jle	.L58
	jmp	.L55
.L56:
	cmpl	$2, -180(%rbp)
	jne	.L59
	movl	$0, %eax
	jmp	.L60

	.align 32
.L61:
	movl	m(%rip), %ecx
	movl	%ecx, m(%rip)
	movl	m(%rip), %ecx
	movl	%ecx, m(%rip)
	movl	m(%rip), %ecx
	movl	%ecx, m(%rip)

	movl	m(%rip), %ecx
	movl	%ecx, m(%rip)
	movl	m(%rip), %ecx
	movl	%ecx, m(%rip)
	movl	m(%rip), %ecx
	movl	%ecx, m(%rip)

	movl	m(%rip), %ecx
	movl	%ecx, m(%rip)
	movl	m(%rip), %ecx
	movl	%ecx, m(%rip)
	movl	m(%rip), %ecx
	movl	%ecx, m(%rip)

	addl	$1, %eax
.L60:
	cmpl	$700, %eax
	jle	.L61
	jmp	.L55
.L59:
	cmpl	$3, -180(%rbp)
	jne	.L55
	movl	$0, %eax
	jmp	.L62

	.align 32
.L63:
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

	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)
	nopw   %cs:0x123123(%rax,%rax,1)

	addl	$1, %eax
.L62:
	cmpl	$2000, %eax
	jle	.L63
.L55:
	addq	$120000, %rbx
	addl	$1, -184(%rbp)
.L49:
	cmpl	$9999, -184(%rbp)
	jle	.L64
	movl	$1, %eax
.L65:
	movq	-24(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L66
	call	__stack_chk_fail@PLT
.L66:
	addq	$176, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC3:
	.string	"warning: could not set CPU affinity/n"
	.text
	.globl	set_cpu
	.type	set_cpu, @function
set_cpu:
.LFB20:
	.cfi_startproc
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
	ja	.L71
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
.L71:
	leaq	-144(%rbp), %rax
	movq	%rax, %rdx
	movl	$128, %esi
	movl	$0, %edi
	call	sched_setaffinity@PLT
	cmpl	$-1, %eax
	jne	.L74
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$37, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	fwrite@PLT
.L74:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L73
	call	__stack_chk_fail@PLT
.L73:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	set_cpu, .-set_cpu
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
