
/mnt/development/.interval-refactor-build/profile-codegen-attribution/dynamic-machine-profile-probe:     file format elf64-x86-64


Disassembly of section .text:

0000000000043809 <.text+0x1fc29>:
   43809:	push   %r14
   4380b:	push   %rbx
   4380c:	sub    $0xa8,%rsp
   43813:	mov    %rdi,%rbx
   43816:	lea    0x8(%rsp),%r14
   4381b:	mov    %r14,%rdi
   4381e:	call   42100 <__cxa_finalize@plt-0x4e720>
   43823:	mov    (%r14),%al
   43826:	cmp    $0x3f,%al
   43828:	jne    4389a <__cxa_finalize@plt-0x4cf86>
   4382a:	lea    0x8(%rsp),%r14
   4382f:	mov    0x28(%r14),%rax
   43833:	mov    %rax,0x77(%rsp)
   43838:	movups 0x8(%r14),%xmm0
   4383d:	movups 0x18(%r14),%xmm1
   43842:	movups %xmm1,0x67(%rsp)
   43847:	movups %xmm0,0x57(%rsp)
   4384c:	lea    0x80(%rsp),%rsi
   43854:	movaps %xmm0,(%rsi)
   43857:	movaps %xmm1,0x10(%rsi)
   4385b:	mov    %rax,0x20(%rsi)
   4385f:	mov    %r14,%rdi
   43862:	call   439f9 <__cxa_finalize@plt-0x4ce27>
   43867:	mov    (%r14),%al
   4386a:	cmp    $0x3f,%al
   4386c:	jne    438e9 <__cxa_finalize@plt-0x4cf37>
   4386e:	mov    0x18(%rsp),%rax
   43873:	test   %rax,%rax
   43876:	je     43931 <__cxa_finalize@plt-0x4ceef>
   4387c:	mov    0x10(%rsp),%rcx
   43881:	mov    0x20(%rsp),%rdx
   43886:	mov    %rcx,0x8(%rbx)
   4388a:	mov    %rax,0x10(%rbx)
   4388e:	mov    %rdx,0x18(%rbx)
   43892:	movb   $0x3f,(%rbx)
   43895:	jmp    43926 <__cxa_finalize@plt-0x4cefa>
   4389a:	movups 0x9(%rsp),%xmm0
   4389f:	movups 0x19(%rsp),%xmm1
   438a4:	movups 0x28(%rsp),%xmm2
   438a9:	movups 0x38(%rsp),%xmm3
   438ae:	movups %xmm2,0x6f(%rsp)
   438b3:	movaps %xmm1,0x60(%rsp)
   438b8:	movaps %xmm0,0x50(%rsp)
   438bd:	mov    0x48(%rsp),%rcx
   438c2:	mov    %rcx,0x40(%rbx)
   438c6:	movups %xmm3,0x30(%rbx)
   438ca:	movups 0x6f(%rsp),%xmm0
   438cf:	movups %xmm0,0x20(%rbx)
   438d3:	movaps 0x50(%rsp),%xmm0
   438d8:	movaps 0x60(%rsp),%xmm1
   438dd:	movups %xmm1,0x11(%rbx)
   438e1:	movups %xmm0,0x1(%rbx)
   438e5:	mov    %al,(%rbx)
   438e7:	jmp    43926 <__cxa_finalize@plt-0x4cefa>
   438e9:	mov    0x9(%rsp),%ecx
   438ed:	mov    0xc(%rsp),%edx
   438f1:	mov    %edx,0x4(%rbx)
   438f4:	mov    %ecx,0x1(%rbx)
   438f7:	movups 0x10(%rsp),%xmm0
   438fc:	mov    0x20(%rsp),%rcx
   43901:	movups 0x28(%rsp),%xmm1
   43906:	movups %xmm1,0x20(%rbx)
   4390a:	movups 0x38(%rsp),%xmm1
   4390f:	movups %xmm1,0x30(%rbx)
   43913:	mov    0x48(%rsp),%rdx
   43918:	mov    %rdx,0x40(%rbx)
   4391c:	mov    %al,(%rbx)
   4391e:	movups %xmm0,0x8(%rbx)
   43922:	mov    %rcx,0x18(%rbx)
   43926:	add    $0xa8,%rsp
   4392d:	pop    %rbx
   4392e:	pop    %r14
   43930:	ret
   43931:	lea    -0x35284(%rip),%rdi        # e6b4 <__cxa_finalize@plt-0x8216c>
   43938:	lea    0x504a1(%rip),%rdx        # 93de0 <_Unwind_Resume@plt+0x35b0>
   4393f:	push   $0x1f
   43941:	pop    %rsi
   43942:	call   48390 <__cxa_finalize@plt-0x48490>
