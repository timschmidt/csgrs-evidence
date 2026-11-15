
/mnt/development/.interval-refactor-build/profile-codegen-attribution/dynamic-machine-profile-probe:     file format elf64-x86-64


Disassembly of section .text:

0000000000043602 <.text+0x1fa22>:
   43602:	push   %rbp
   43603:	push   %r15
   43605:	push   %r14
   43607:	push   %r13
   43609:	push   %r12
   4360b:	push   %rbx
   4360c:	sub    $0x108,%rsp
   43613:	mov    %r8d,%r14d
   43616:	mov    %ecx,%ebp
   43618:	mov    %rdi,%rbx
   4361b:	lea    0x98(%rsp),%r15
   43623:	mov    %r15,%rdi
   43626:	call   42100 <__cxa_finalize@plt-0x4e720>
   4362b:	mov    (%r15),%al
   4362e:	cmp    $0x3f,%al
   43630:	jne    43709 <__cxa_finalize@plt-0x4d117>
   43636:	mov    0xc0(%rsp),%rax
   4363e:	mov    %rax,0x47(%rsp)
   43643:	movups 0xa0(%rsp),%xmm0
   4364b:	movups 0xb0(%rsp),%xmm1
   43653:	movups %xmm1,0x37(%rsp)
   43658:	movups %xmm0,0x27(%rsp)
   4365d:	lea    0xe0(%rsp),%rsi
   43665:	movaps %xmm0,(%rsi)
   43668:	movaps %xmm1,0x10(%rsi)
   4366c:	mov    %rax,0x20(%rsi)
   43670:	lea    0x50(%rsp),%r15
   43675:	mov    %r15,%rdi
   43678:	call   439f9 <__cxa_finalize@plt-0x4ce27>
   4367d:	mov    (%r15),%al
   43680:	cmp    $0x3f,%al
   43682:	jne    43767 <__cxa_finalize@plt-0x4d0b9>
   43688:	mov    0x58(%rsp),%rax
   4368d:	mov    0x60(%rsp),%r13
   43692:	mov    0x68(%rsp),%rcx
   43697:	mov    %rax,0x10(%rsp)
   4369c:	mov    %rax,0x18(%rsp)
   436a1:	test   %r13,%r13
   436a4:	je     437f1 <__cxa_finalize@plt-0x4d02f>
   436aa:	lea    0x98(%rsp),%r15
   436b2:	mov    %r13,(%r15)
   436b5:	mov    %rcx,0x8(%rsp)
   436ba:	mov    %rcx,0x8(%r15)
   436be:	call   4db54 <__cxa_finalize@plt-0x42ccc>
   436c3:	lea    0x50(%rsp),%r12
   436c8:	mov    %rax,(%r12)
   436cc:	mov    %r15,%rdi
   436cf:	mov    %r12,%rsi
   436d2:	call   577bc <__cxa_finalize@plt-0x39064>
   436d7:	mov    %eax,%r15d
   436da:	mov    %r12,%rdi
   436dd:	call   4d9a2 <__cxa_finalize@plt-0x42e7e>
   436e2:	test   %r15b,%r15b
   436e5:	jle    437ac <__cxa_finalize@plt-0x4d074>
   436eb:	mov    0x10(%rsp),%rax
   436f0:	mov    %rax,0x8(%rbx)
   436f4:	mov    %r13,0x10(%rbx)
   436f8:	mov    0x8(%rsp),%rax
   436fd:	mov    %rax,0x18(%rbx)
   43701:	movb   $0x3f,(%rbx)
   43704:	jmp    437df <__cxa_finalize@plt-0x4d041>
   43709:	movups 0x99(%rsp),%xmm0
   43711:	movups 0xa9(%rsp),%xmm1
   43719:	movups 0xb8(%rsp),%xmm2
   43721:	movups 0xc8(%rsp),%xmm3
   43729:	movups %xmm2,0x3f(%rsp)
   4372e:	movaps %xmm1,0x30(%rsp)
   43733:	movaps %xmm0,0x20(%rsp)
   43738:	mov    0xd8(%rsp),%rcx
   43740:	mov    %rcx,0x40(%rbx)
   43744:	movups %xmm3,0x30(%rbx)
   43748:	movups 0x3f(%rsp),%xmm0
   4374d:	movups %xmm0,0x20(%rbx)
   43751:	movaps 0x20(%rsp),%xmm0
   43756:	movaps 0x30(%rsp),%xmm1
   4375b:	movups %xmm1,0x11(%rbx)
   4375f:	movups %xmm0,0x1(%rbx)
   43763:	mov    %al,(%rbx)
   43765:	jmp    437df <__cxa_finalize@plt-0x4d041>
   43767:	mov    0x51(%rsp),%ecx
   4376b:	mov    0x54(%rsp),%edx
   4376f:	mov    %edx,0x4(%rbx)
   43772:	mov    %ecx,0x1(%rbx)
   43775:	movups 0x58(%rsp),%xmm0
   4377a:	mov    0x68(%rsp),%rcx
   4377f:	movups 0x70(%rsp),%xmm1
   43784:	movups %xmm1,0x20(%rbx)
   43788:	movups 0x80(%rsp),%xmm1
   43790:	movups %xmm1,0x30(%rbx)
   43794:	mov    0x90(%rsp),%rdx
   4379c:	mov    %rdx,0x40(%rbx)
   437a0:	mov    %al,(%rbx)
   437a2:	movups %xmm0,0x8(%rbx)
   437a6:	mov    %rcx,0x18(%rbx)
   437aa:	jmp    437df <__cxa_finalize@plt-0x4d041>
   437ac:	lea    0xa0(%rsp),%r15
   437b4:	lea    0x98(%rsp),%rdi
   437bc:	call   4d9a2 <__cxa_finalize@plt-0x42e7e>
   437c1:	mov    %r15,%rdi
   437c4:	call   4d9a2 <__cxa_finalize@plt-0x42e7e>
   437c9:	movb   $0x37,(%rbx)
   437cc:	mov    %r14w,0x2(%rbx)
   437d1:	mov    %bp,0x4(%rbx)
   437d5:	lea    0x18(%rsp),%rdi
   437da:	call   4d9a2 <__cxa_finalize@plt-0x42e7e>
   437df:	add    $0x108,%rsp
   437e6:	pop    %rbx
   437e7:	pop    %r12
   437e9:	pop    %r13
   437eb:	pop    %r14
   437ed:	pop    %r15
   437ef:	pop    %rbp
   437f0:	ret
   437f1:	lea    -0x35125(%rip),%rdi        # e6d3 <__cxa_finalize@plt-0x8214d>
   437f8:	lea    0x505f9(%rip),%rdx        # 93df8 <_Unwind_Resume@plt+0x35c8>
   437ff:	mov    $0xc7,%esi
   43804:	call   45040 <__cxa_finalize@plt-0x4b7e0>
