
/mnt/development/.interval-refactor-build/profile-codegen-attribution/baseline-machine-profile-probe:     file format elf64-x86-64


Disassembly of section .text:

00000000000435cb <.text+0x1fb8b>:
   435cb:	push   %r15
   435cd:	push   %r14
   435cf:	push   %r13
   435d1:	push   %r12
   435d3:	push   %rbx
   435d4:	sub    $0x60,%rsp
   435d8:	mov    %rdi,%rbx
   435db:	lea    0x10(%rsp),%r14
   435e0:	mov    %r14,%rdi
   435e3:	call   41f7c <__cxa_finalize@plt-0x4e564>
   435e8:	mov    (%r14),%al
   435eb:	cmp    $0x3f,%al
   435ed:	jne    4368b <__cxa_finalize@plt-0x4ce55>
   435f3:	lea    0x10(%rsp),%r12
   435f8:	mov    0x8(%r12),%rsi
   435fd:	mov    0x10(%r12),%rdx
   43602:	mov    0x18(%r12),%r14
   43607:	mov    0x20(%r12),%r15
   4360c:	mov    %r12,%rdi
   4360f:	call   437af <__cxa_finalize@plt-0x4cd31>
   43614:	mov    (%r12),%al
   43618:	cmp    $0x3f,%al
   4361a:	jne    436cd <__cxa_finalize@plt-0x4ce13>
   43620:	lea    0x10(%rsp),%r12
   43625:	mov    0x8(%r12),%r13
   4362a:	mov    %r13,0x8(%rsp)
   4362f:	mov    %r12,%rdi
   43632:	mov    %r14,%rsi
   43635:	mov    %r15,%rdx
   43638:	call   437af <__cxa_finalize@plt-0x4cd31>
   4363d:	mov    (%r12),%al
   43641:	cmp    $0x3f,%al
   43643:	jne    4370c <__cxa_finalize@plt-0x4cdd4>
   43649:	mov    0x18(%rsp),%rax
   4364e:	lea    0x58(%rsp),%r14
   43653:	mov    %rax,(%r14)
   43656:	lea    0x8(%rsp),%r15
   4365b:	mov    %r15,%rdi
   4365e:	mov    %r14,%rsi
   43661:	call   57b76 <__cxa_finalize@plt-0x3896a>
   43666:	mov    %rax,%r12
   43669:	mov    %r15,%rdi
   4366c:	mov    %r14,%rsi
   4366f:	call   5605c <__cxa_finalize@plt-0x3a484>
   43674:	mov    %r13,0x8(%rbx)
   43678:	mov    %r12,0x10(%rbx)
   4367c:	mov    %rax,0x18(%rbx)
   43680:	movb   $0x3f,(%rbx)
   43683:	mov    %r14,%rdi
   43686:	jmp    4374e <__cxa_finalize@plt-0x4cd92>
   4368b:	mov    0x11(%rsp),%ecx
   4368f:	mov    0x14(%rsp),%edx
   43693:	mov    %edx,0x4(%rbx)
   43696:	mov    %ecx,0x1(%rbx)
   43699:	movups 0x18(%rsp),%xmm0
   4369e:	movups 0x28(%rsp),%xmm1
   436a3:	mov    0x38(%rsp),%rcx
   436a8:	movups 0x40(%rsp),%xmm2
   436ad:	movups %xmm2,0x30(%rbx)
   436b1:	mov    0x50(%rsp),%rdx
   436b6:	mov    %rdx,0x40(%rbx)
   436ba:	mov    %al,(%rbx)
   436bc:	movups %xmm0,0x8(%rbx)
   436c0:	movups %xmm1,0x18(%rbx)
   436c4:	mov    %rcx,0x28(%rbx)
   436c8:	jmp    43753 <__cxa_finalize@plt-0x4cd8d>
   436cd:	mov    0x11(%rsp),%ecx
   436d1:	mov    0x14(%rsp),%edx
   436d5:	mov    %edx,0x4(%rbx)
   436d8:	mov    %ecx,0x1(%rbx)
   436db:	mov    0x18(%rsp),%rcx
   436e0:	movups 0x30(%rsp),%xmm0
   436e5:	movups %xmm0,0x20(%rbx)
   436e9:	movups 0x40(%rsp),%xmm0
   436ee:	movups %xmm0,0x30(%rbx)
   436f2:	mov    0x50(%rsp),%rdx
   436f7:	mov    %rdx,0x40(%rbx)
   436fb:	movups 0x20(%rsp),%xmm0
   43700:	movups %xmm0,0x10(%rbx)
   43704:	mov    %al,(%rbx)
   43706:	mov    %rcx,0x8(%rbx)
   4370a:	jmp    43753 <__cxa_finalize@plt-0x4cd8d>
   4370c:	mov    0x11(%rsp),%ecx
   43710:	mov    0x14(%rsp),%edx
   43714:	mov    %edx,0x4(%rbx)
   43717:	mov    %ecx,0x1(%rbx)
   4371a:	mov    0x18(%rsp),%rcx
   4371f:	movups 0x30(%rsp),%xmm0
   43724:	movups %xmm0,0x20(%rbx)
   43728:	movups 0x40(%rsp),%xmm0
   4372d:	movups %xmm0,0x30(%rbx)
   43731:	mov    0x50(%rsp),%rdx
   43736:	mov    %rdx,0x40(%rbx)
   4373a:	movups 0x20(%rsp),%xmm0
   4373f:	movups %xmm0,0x10(%rbx)
   43743:	mov    %al,(%rbx)
   43745:	mov    %rcx,0x8(%rbx)
   43749:	lea    0x8(%rsp),%rdi
   4374e:	call   41cd1 <__cxa_finalize@plt-0x4e80f>
   43753:	add    $0x60,%rsp
   43757:	pop    %rbx
   43758:	pop    %r12
   4375a:	pop    %r13
   4375c:	pop    %r14
   4375e:	pop    %r15
   43760:	ret
