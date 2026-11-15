
/mnt/development/.interval-refactor-build/profile-codegen-attribution/baseline-machine-profile-probe:     file format elf64-x86-64


Disassembly of section .text:

00000000000434d5 <.text+0x1fa95>:
   434d5:	push   %rbp
   434d6:	push   %r15
   434d8:	push   %r14
   434da:	push   %r12
   434dc:	push   %rbx
   434dd:	sub    $0x90,%rsp
   434e4:	mov    %r8d,%r14d
   434e7:	mov    %ecx,%ebp
   434e9:	mov    %rdi,%rbx
   434ec:	lea    0x28(%rsp),%r15
   434f1:	mov    %r15,%rdi
   434f4:	call   435cb <__cxa_finalize@plt-0x4cf15>
   434f9:	mov    (%r15),%al
   434fc:	cmp    $0x3f,%al
   434fe:	jne    43562 <__cxa_finalize@plt-0x4cf7e>
   43500:	lea    0x28(%rsp),%r15
   43505:	mov    0x18(%r15),%rax
   43509:	mov    %rax,0x17(%rsp)
   4350e:	movups 0x8(%r15),%xmm0
   43513:	movups %xmm0,0x7(%rsp)
   43518:	lea    0x78(%rsp),%r12
   4351d:	movaps %xmm0,-0x8(%r12)
   43523:	mov    %rax,0x8(%r12)
   43528:	call   4d895 <__cxa_finalize@plt-0x42c4b>
   4352d:	mov    %rax,(%r15)
   43530:	mov    %r12,%rdi
   43533:	mov    %r15,%rsi
   43536:	call   41f6f <__cxa_finalize@plt-0x4e571>
   4353b:	mov    %eax,%r12d
   4353e:	mov    %r15,%rdi
   43541:	call   41cd1 <__cxa_finalize@plt-0x4e80f>
   43546:	test   %r12b,%r12b
   43549:	je     435a3 <__cxa_finalize@plt-0x4cf3d>
   4354b:	mov    %r14w,0x2(%rbx)
   43550:	mov    %bp,0x4(%rbx)
   43554:	lea    0x70(%rsp),%rdi
   43559:	call   433eb <__cxa_finalize@plt-0x4d0f5>
   4355e:	mov    $0x37,%al
   43560:	jmp    435b9 <__cxa_finalize@plt-0x4cf27>
   43562:	movups 0x29(%rsp),%xmm0
   43567:	movups 0x38(%rsp),%xmm1
   4356c:	movups 0x48(%rsp),%xmm2
   43571:	movups 0x58(%rsp),%xmm3
   43576:	movups %xmm1,0xf(%rsp)
   4357b:	movaps %xmm0,(%rsp)
   4357f:	mov    0x68(%rsp),%rcx
   43584:	mov    %rcx,0x40(%rbx)
   43588:	movups %xmm3,0x30(%rbx)
   4358c:	movups %xmm2,0x20(%rbx)
   43590:	movups 0xf(%rsp),%xmm0
   43595:	movups %xmm0,0x10(%rbx)
   43599:	movaps (%rsp),%xmm0
   4359d:	movups %xmm0,0x1(%rbx)
   435a1:	jmp    435b9 <__cxa_finalize@plt-0x4cf27>
   435a3:	lea    0x7(%rsp),%rax
   435a8:	mov    0x10(%rax),%rcx
   435ac:	mov    %rcx,0x18(%rbx)
   435b0:	movups (%rax),%xmm0
   435b3:	movups %xmm0,0x8(%rbx)
   435b7:	mov    $0x3f,%al
   435b9:	mov    %al,(%rbx)
   435bb:	add    $0x90,%rsp
   435c2:	pop    %rbx
   435c3:	pop    %r12
   435c5:	pop    %r14
   435c7:	pop    %r15
   435c9:	pop    %rbp
   435ca:	ret
