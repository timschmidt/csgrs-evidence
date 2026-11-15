
/mnt/development/.interval-refactor-build/profile-codegen-attribution/nonempty-machine-profile-probe:     file format elf64-x86-64


Disassembly of section .text:

00000000000434d2 <.text+0x1fa22>:
   434d2:	push   %rbp
   434d3:	push   %r15
   434d5:	push   %r14
   434d7:	push   %r13
   434d9:	push   %r12
   434db:	push   %rbx
   434dc:	sub    $0x108,%rsp
   434e3:	mov    %r8d,%r14d
   434e6:	mov    %ecx,%ebp
   434e8:	mov    %rdi,%rbx
   434eb:	lea    0x50(%rsp),%r15
   434f0:	mov    %r15,%rdi
   434f3:	call   41fd0 <__cxa_finalize@plt-0x4e6d0>
   434f8:	mov    (%r15),%al
   434fb:	cmp    $0x3f,%al
   434fd:	jne    435c5 <__cxa_finalize@plt-0x4d0db>
   43503:	mov    0x78(%rsp),%rax
   43508:	mov    %rax,0x47(%rsp)
   4350d:	movups 0x58(%rsp),%xmm0
   43512:	movups 0x68(%rsp),%xmm1
   43517:	movups %xmm1,0x37(%rsp)
   4351c:	movups %xmm0,0x27(%rsp)
   43521:	lea    0xe0(%rsp),%rsi
   43529:	movaps %xmm0,(%rsi)
   4352c:	movaps %xmm1,0x10(%rsi)
   43530:	mov    %rax,0x20(%rsi)
   43534:	lea    0x98(%rsp),%r15
   4353c:	mov    %r15,%rdi
   4353f:	call   4387e <__cxa_finalize@plt-0x4ce22>
   43544:	mov    (%r15),%al
   43547:	cmp    $0x3f,%al
   43549:	jne    4361d <__cxa_finalize@plt-0x4d083>
   4354f:	lea    0x98(%rsp),%r15
   43557:	mov    0x8(%r15),%r13
   4355b:	mov    0x10(%r15),%rax
   4355f:	mov    0x18(%r15),%rcx
   43563:	mov    %r13,0x18(%rsp)
   43568:	lea    0x50(%rsp),%r12
   4356d:	mov    %rax,0x10(%rsp)
   43572:	mov    %rax,(%r12)
   43576:	mov    %rcx,0x8(%rsp)
   4357b:	mov    %rcx,0x8(%r12)
   43580:	call   4d9d4 <__cxa_finalize@plt-0x42ccc>
   43585:	mov    %rax,(%r15)
   43588:	mov    %r12,%rdi
   4358b:	mov    %r15,%rsi
   4358e:	call   5763c <__cxa_finalize@plt-0x39064>
   43593:	mov    %eax,%r12d
   43596:	mov    %r15,%rdi
   43599:	call   4d822 <__cxa_finalize@plt-0x42e7e>
   4359e:	test   %r12b,%r12b
   435a1:	jle    43671 <__cxa_finalize@plt-0x4d02f>
   435a7:	mov    %r13,0x8(%rbx)
   435ab:	mov    0x10(%rsp),%rax
   435b0:	mov    %rax,0x10(%rbx)
   435b4:	mov    0x8(%rsp),%rax
   435b9:	mov    %rax,0x18(%rbx)
   435bd:	movb   $0x3f,(%rbx)
   435c0:	jmp    436a3 <__cxa_finalize@plt-0x4cffd>
   435c5:	movups 0x51(%rsp),%xmm0
   435ca:	movups 0x61(%rsp),%xmm1
   435cf:	movups 0x70(%rsp),%xmm2
   435d4:	movups 0x80(%rsp),%xmm3
   435dc:	movups %xmm2,0x3f(%rsp)
   435e1:	movaps %xmm1,0x30(%rsp)
   435e6:	movaps %xmm0,0x20(%rsp)
   435eb:	mov    0x90(%rsp),%rcx
   435f3:	mov    %rcx,0x40(%rbx)
   435f7:	movups %xmm3,0x30(%rbx)
   435fb:	movups 0x3f(%rsp),%xmm0
   43600:	movups %xmm0,0x20(%rbx)
   43604:	movaps 0x20(%rsp),%xmm0
   43609:	movaps 0x30(%rsp),%xmm1
   4360e:	movups %xmm1,0x11(%rbx)
   43612:	movups %xmm0,0x1(%rbx)
   43616:	mov    %al,(%rbx)
   43618:	jmp    436a3 <__cxa_finalize@plt-0x4cffd>
   4361d:	mov    0x99(%rsp),%ecx
   43624:	mov    0x9c(%rsp),%edx
   4362b:	mov    %edx,0x4(%rbx)
   4362e:	mov    %ecx,0x1(%rbx)
   43631:	movups 0xa0(%rsp),%xmm0
   43639:	mov    0xb0(%rsp),%rcx
   43641:	movups 0xb8(%rsp),%xmm1
   43649:	movups %xmm1,0x20(%rbx)
   4364d:	movups 0xc8(%rsp),%xmm1
   43655:	movups %xmm1,0x30(%rbx)
   43659:	mov    0xd8(%rsp),%rdx
   43661:	mov    %rdx,0x40(%rbx)
   43665:	mov    %al,(%rbx)
   43667:	movups %xmm0,0x8(%rbx)
   4366b:	mov    %rcx,0x18(%rbx)
   4366f:	jmp    436a3 <__cxa_finalize@plt-0x4cffd>
   43671:	lea    0x58(%rsp),%r15
   43676:	lea    0x50(%rsp),%rdi
   4367b:	call   4d822 <__cxa_finalize@plt-0x42e7e>
   43680:	mov    %r15,%rdi
   43683:	call   4d822 <__cxa_finalize@plt-0x42e7e>
   43688:	movb   $0x37,(%rbx)
   4368b:	mov    %r14w,0x2(%rbx)
   43690:	mov    %bp,0x4(%rbx)
   43694:	andq   $0x0,0x8(%rbx)
   43699:	lea    0x18(%rsp),%rdi
   4369e:	call   4d822 <__cxa_finalize@plt-0x42e7e>
   436a3:	add    $0x108,%rsp
   436aa:	pop    %rbx
   436ab:	pop    %r12
   436ad:	pop    %r13
   436af:	pop    %r14
   436b1:	pop    %r15
   436b3:	pop    %rbp
   436b4:	ret
