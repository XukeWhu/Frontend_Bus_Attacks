	.file	"recieve.c"
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
	.globl	j
	.align 4
	.type	j, @object
	.size	j, 4
j:
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
.LFB14:
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
.LFE14:
	.size	semaphore_v, .-semaphore_v
	.type	semaphore_p, @function
semaphore_p:
.LFB15:
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
.LFE15:
	.size	semaphore_p, .-semaphore_p
	.type	semaphore_init, @function
semaphore_init:
.LFB16:
	.cfi_startproc
	endbr64
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
.LFE16:
	.size	semaphore_init, .-semaphore_init
	.type	sharemmy_init, @function
sharemmy_init:
.LFB17:
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
.LFE17:
	.size	sharemmy_init, .-sharemmy_init
	.type	sharemmy_destroy, @function
sharemmy_destroy:
.LFB18:
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
.LFE18:
	.size	sharemmy_destroy, .-sharemmy_destroy
	.globl	calla
	.type	calla, @function
calla:
.LFB19:
	.cfi_startproc
	endbr64
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
.LFE19:
	.size	calla, .-calla
	.section	.rodata
	.align 8
.LC0:
	.string	"get CPU affinity failue, ERROR:%s\n"
.LC1:
	.string	"Init a semaphore fail."
.LC2:
	.string	"Init a share memory fail."
.LC3:
	.string	"%ld\n"
.LC4:
	.string	"Destroy share memory fail."
	.text
	.globl	main
	.type	main, @function
main:
.LFB20:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	leaq	-4800512(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$872, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$8, %edi
	call	set_cpu
	leaq	-4801360(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %eax
	movl	$16, %edx
	movq	%rsi, %rdi
	movq	%rdx, %rcx
	rep stosq
	leaq	-4801360(%rbp), %rax
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
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %eax
	jmp	.L57
.L38:
	movl	$0, i(%rip)
	jmp	.L40
.L43:
	movl	i(%rip), %eax
	cltq
	movq	%rax, -4801368(%rbp)
	cmpq	$1023, -4801368(%rbp)
	ja	.L59
	movq	-4801368(%rbp), %rax
	shrq	$6, %rax
	leaq	0(,%rax,8), %rdx
	leaq	-4801360(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-4801368(%rbp), %rax
	andl	$63, %eax
	movl	%eax, %ecx
	shrq	%cl, %rdx
	movq	%rdx, %rax
	andl	$1, %eax
	testq	%rax, %rax
.L59:
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
.L40:
	movl	i(%rip), %eax
	cmpl	$15, %eax
	jle	.L43
	call	semaphore_init
	movl	%eax, -4801384(%rbp)
	cmpl	$0, -4801384(%rbp)
	jns	.L44
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L57
.L44:
	call	sharemmy_init
	movl	%eax, -4801380(%rbp)
	cmpl	$-1, -4801380(%rbp)
	jne	.L45
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L57
.L45:
	call	semaphore_p
	movq	shm(%rip), %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	shm(%rip), %rax
	leaq	4(%rax), %rcx
	leaq	-4801232(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	movl	$10, i(%rip)
	jmp	.L46
.L53:
	movq	-4801232(%rbp), %rax
	addq	$25000, %rax
	movq	%rax, -4801232(%rbp)
	movl	$0, %eax
	call	rdtsc
	movq	%rax, %rbx
	jmp	.L47
.L48:
	movl	$0, %eax
	call	rdtsc
	movq	%rax, %rbx
.L47:
	movq	-4801232(%rbp), %rax
	cmpq	%rax, %rbx
	jb	.L48
	movl	$0, -4801388(%rbp)
	jmp	.L49
.L52:
	movl	$0, %eax
	call	rdtsc
	movq	%rax, %rbx
	movl	$0, %eax
	jmp	.L50
	.align 32
.L51:
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
.L50:
	cmpl	$99, %eax
	jle	.L51
	movl	$0, %eax
	call	rdtsc
	movq	%rax, %rcx
	movl	i(%rip), %edx
	movl	%edx, %eax
	sall	$4, %eax
	subl	%edx, %eax
	movl	%eax, %edx
	movl	-4801388(%rbp), %eax
	addl	%edx, %eax
	subq	%rbx, %rcx
	movq	%rcx, %rdx
	cltq
	movq	%rdx, -4801232(%rbp,%rax,8)
	addl	$1, -4801388(%rbp)
.L49:
	cmpl	$14, -4801388(%rbp)
	jle	.L52
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
.L46:
	movl	i(%rip), %eax
	cmpl	$40009, %eax
	jle	.L53
	movq	$0, -4801376(%rbp)
	movl	$150, i(%rip)
	jmp	.L54
.L55:
	movl	i(%rip), %eax
	cltq
	movq	-4801232(%rbp,%rax,8), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
.L54:
	movl	i(%rip), %eax
	cmpl	$600149, %eax
	jle	.L55
	movq	shm(%rip), %rdx
	movl	-4801380(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	sharemmy_destroy
	movl	%eax, -4801384(%rbp)
	cmpl	$0, -4801384(%rbp)
	jns	.L56
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L57
.L56:
	movl	$1, %eax
.L57:
	movq	-24(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L58
	call	__stack_chk_fail@PLT
.L58:
	addq	$4801384, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC5:
	.string	"warning: could not set CPU affinity/n"
	.text
	.globl	set_cpu
	.type	set_cpu, @function
set_cpu:
.LFB21:
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
	ja	.L62
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
.L62:
	leaq	-144(%rbp), %rax
	movq	%rax, %rdx
	movl	$128, %esi
	movl	$0, %edi
	call	sched_setaffinity@PLT
	cmpl	$-1, %eax
	jne	.L65
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$37, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	fwrite@PLT
.L65:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L64
	call	__stack_chk_fail@PLT
.L64:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	set_cpu, .-set_cpu
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
