	.file	"recieve.c"
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
	.comm	sem_union,8,8
	.local	sem_id
	.comm	sem_id,4,4
	.local	shm
	.comm	shm,8,8
	.globl	i
	.bss
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.globl	temp
	.data
	.align 4
	.type	temp, @object
	.size	temp, 4
temp:
	.long	3
	.globl	temp2
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
	.globl	n
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.long	5
	.text
	.type	semaphore_v, @function
semaphore_v:
.LFB13:
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
.LFE13:
	.size	semaphore_v, .-semaphore_v
	.type	semaphore_p, @function
semaphore_p:
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
.LFE14:
	.size	semaphore_p, .-semaphore_p
	.type	semaphore_init, @function
semaphore_init:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$950, %edx
	movl	$1, %esi
	movl	$100, %edi
	call	semget@PLT
	movl	%eax, sem_id(%rip)
	movl	sem_id(%rip), %eax
	cmpl	$-1, %eax
	jne	.L24
	movl	$-1, %eax
	jmp	.L27
.L24:
	movl	$0, -8(%rbp)
	movl	sem_id(%rip), %eax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$16, %edx
	movl	$0, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	semctl@PLT
	cmpl	$-1, %eax
	jne	.L26
	movl	$-1, %eax
	jmp	.L27
.L26:
	movl	$0, %eax
.L27:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	semaphore_init, .-semaphore_init
	.type	sharemmy_init, @function
sharemmy_init:
.LFB16:
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
	jne	.L29
	movl	-4(%rbp), %eax
	jmp	.L30
.L29:
	movl	-4(%rbp), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	shmat@PLT
	movq	%rax, shm(%rip)
	movq	shm(%rip), %rax
	cmpq	$-1, %rax
	jne	.L31
	movl	$-1, %eax
	jmp	.L30
.L31:
	movl	-4(%rbp), %eax
.L30:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	sharemmy_init, .-sharemmy_init
	.type	sharemmy_destroy, @function
sharemmy_destroy:
.LFB17:
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
	jne	.L33
	movl	-4(%rbp), %eax
	jmp	.L34
.L33:
	movl	-20(%rbp), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	shmctl@PLT
	movl	%eax, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	jne	.L35
	movl	-4(%rbp), %eax
	jmp	.L34
.L35:
	movl	$0, %eax
.L34:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	sharemmy_destroy, .-sharemmy_destroy
	.globl	calla
	.type	calla, @function
calla:
.LFB18:
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
.LFE18:
	.size	calla, .-calla
	.section	.rodata
.LC0:
	.string	"cpu affinity set"
	.align 8
.LC1:
	.string	"get CPU affinity failue, ERROR:%s\n"
	.align 8
.LC2:
	.string	"this process %d of running processor: %d\n"
.LC3:
	.string	"%ld\n"
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
	subq	$8000176, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	$0, %edi
	call	set_cpu
	leaq	-8000160(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %eax
	movl	$16, %edx
	movq	%rsi, %rdi
	movq	%rdx, %rcx
	rep stosq
	leaq	-8000160(%rbp), %rax
	movq	%rax, %rdx
	movl	$128, %esi
	movl	$0, %edi
	call	sched_getaffinity@PLT
	cmpl	$-1, %eax
	jne	.L38
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %eax
	jmp	.L62
.L38:
	movl	$0, i(%rip)
	jmp	.L40
.L44:
	movl	i(%rip), %eax
	cltq
	movq	%rax, -8000168(%rbp)
	cmpq	$1023, -8000168(%rbp)
	ja	.L41
	movq	-8000168(%rbp), %rax
	shrq	$6, %rax
	leaq	0(,%rax,8), %rdx
	leaq	-8000160(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-8000168(%rbp), %rax
	andl	$63, %eax
	movl	%eax, %ecx
	shrq	%cl, %rdx
	movq	%rdx, %rax
	andl	$1, %eax
	testq	%rax, %rax
	je	.L41
	movl	$1, %eax
	jmp	.L42
.L41:
	movl	$0, %eax
.L42:
	testl	%eax, %eax
	je	.L43
	movl	i(%rip), %ebx
	call	getpid@PLT
	movl	%ebx, %edx
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L43:
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
.L40:
	movl	i(%rip), %eax
	cmpl	$3, %eax
	jle	.L44
	movl	$0, -8000192(%rbp)
	movl	$0, m(%rip)
.L51:
	movl	$0, %eax
	call	rdtsc
	movq	%rax, %rbx
	movl	$0, %eax
	jmp	.L45
	.align 32
.L46:
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
.L45:
	cmpl	$299, %eax
	jle	.L46
	movl	$0, %eax
	call	rdtsc
	subq	%rbx, %rax
	movq	%rax, %rbx
	cmpq	$3299, %rbx
	ja	.L47
	cmpq	$3100, %rbx
	jbe	.L47
	addl	$1, -8000192(%rbp)
.L47:
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
	jne	.L51
	cmpl	$70, -8000192(%rbp)
	jg	.L65
	movl	$0, -8000192(%rbp)
	jmp	.L51
.L65:
	nop
	movl	$0, %eax
	call	rdtsc
	movq	%rax, %r12
	movq	%r12, %rax
	shrq	$6, %rax
	movabsq	$157412216095654841, %rdx
	mulq	%rdx
	movq	%rdx, %rax
	shrq	$4, %rax
	movq	%rax, -8000176(%rbp)
	movq	-8000176(%rbp), %rax
	imulq	$120000, %rax, %rax
	movq	%r12, %rsi
	subq	%rax, %rsi
	movq	%rsi, %rax
	movq	%rax, -8000176(%rbp)
	movq	%r12, %rax
	subq	-8000176(%rbp), %rax
	leaq	240000(%rax), %r12
	movl	$0, -8000188(%rbp)
	jmp	.L52
.L59:
	movl	$0, %eax
	call	rdtsc
	movq	%rax, %rbx
	jmp	.L53
.L54:
	movl	$0, %eax
	call	rdtsc
	movq	%rax, %rbx
.L53:
	cmpq	%r12, %rbx
	jb	.L54
	movl	$0, -8000184(%rbp)
	jmp	.L55
.L58:
	movl	$0, %eax
	call	rdtsc
	movq	%rax, %rbx
	movl	$0, %eax
	jmp	.L56
	.align 32
.L57:
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
.L56:
	cmpl	$299, %eax
	jle	.L57
	movl	$0, %eax
	call	rdtsc
	movq	%rax, %rcx
	movl	-8000188(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-8000184(%rbp), %eax
	addl	%edx, %eax
	subq	%rbx, %rcx
	movq	%rcx, %rdx
	cltq
	movq	%rdx, -8000032(%rbp,%rax,8)
	addl	$1, -8000184(%rbp)
.L55:
	cmpl	$5, -8000184(%rbp)
	jle	.L58
	addq	$120000, %r12
	addl	$1, -8000188(%rbp)
.L52:
	cmpl	$9999, -8000188(%rbp)
	jle	.L59
	movl	$0, -8000180(%rbp)
	jmp	.L60
.L61:
	movl	-8000180(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	cltq
	movq	-8000032(%rbp,%rax,8), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-8000180(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	addl	$1, %eax
	cltq
	movq	-8000032(%rbp,%rax,8), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-8000180(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	addl	$2, %eax
	cltq
	movq	-8000032(%rbp,%rax,8), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-8000180(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	addl	$3, %eax
	cltq
	movq	-8000032(%rbp,%rax,8), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-8000180(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	addl	$4, %eax
	cltq
	movq	-8000032(%rbp,%rax,8), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-8000180(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	addl	$5, %eax
	cltq
	movq	-8000032(%rbp,%rax,8), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -8000180(%rbp)
.L60:
	cmpl	$9999, -8000180(%rbp)
	jle	.L61
	movl	$1, %eax
.L62:
	movq	-24(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L63
	call	__stack_chk_fail@PLT
.L63:
	addq	$8000176, %rsp
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
.LC4:
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
	leaq	.LC4(%rip), %rdi
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
.LFE20:
	.size	set_cpu, .-set_cpu
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
