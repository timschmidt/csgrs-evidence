
/mnt/development/.interval-refactor-build/profile-codegen-attribution/dynamic-machine-profile-probe:     file format elf64-x86-64


Disassembly of section .text:

00000000000439f9 <.text+0x1fe19>:
   439f9:	push   %r15
   439fb:	push   %r14
   439fd:	push   %r13
   439ff:	push   %r12
   43a01:	push   %rbx
   43a02:	sub    $0x20,%rsp
   43a06:	mov    %rsi,%r14
   43a09:	mov    %rdi,%rbx
   43a0c:	mov    (%rsi),%rsi
   43a0f:	mov    0x8(%r14),%rdx
   43a13:	lea    0x8(%rsp),%r15
   43a18:	mov    %r15,%rdi
   43a1b:	call   4e041 <__cxa_finalize@plt-0x427df>
   43a20:	cmpb   $0x1,(%r15)
   43a24:	jne    43a32 <__cxa_finalize@plt-0x4cdee>
   43a26:	mov    0x9(%rsp),%al
   43a2a:	movb   $0x32,(%rbx)
   43a2d:	mov    %al,0x1(%rbx)
   43a30:	jmp    43a87 <__cxa_finalize@plt-0x4cd99>
   43a32:	mov    0x10(%rsp),%r13
   43a37:	mov    %r13,(%rsp)
   43a3b:	mov    0x18(%r14),%rdx
   43a3f:	test   %rdx,%rdx
   43a42:	je     43a6c <__cxa_finalize@plt-0x4cdb4>
   43a44:	mov    0x10(%r14),%rsi
   43a48:	test   %rsi,%rsi
   43a4b:	js     43a78 <__cxa_finalize@plt-0x4cda8>
   43a4d:	lea    0x8(%rsp),%r14
   43a52:	mov    %r14,%rdi
   43a55:	call   4e041 <__cxa_finalize@plt-0x427df>
   43a5a:	cmpb   $0x0,(%r14)
   43a5e:	je     43a95 <__cxa_finalize@plt-0x4cd8b>
   43a60:	mov    0x9(%rsp),%al
   43a64:	movb   $0x32,(%rbx)
   43a67:	mov    %al,0x1(%rbx)
   43a6a:	jmp    43a7f <__cxa_finalize@plt-0x4cda1>
   43a6c:	movw   $0x232,(%rbx)
   43a71:	andq   $0x0,0x8(%rbx)
   43a76:	jmp    43a7f <__cxa_finalize@plt-0x4cda1>
   43a78:	movb   $0x20,(%rbx)
   43a7b:	mov    %rsi,0x8(%rbx)
   43a7f:	mov    %rsp,%rdi
   43a82:	call   4d9a2 <__cxa_finalize@plt-0x42e7e>
   43a87:	add    $0x20,%rsp
   43a8b:	pop    %rbx
   43a8c:	pop    %r12
   43a8e:	pop    %r13
   43a90:	pop    %r14
   43a92:	pop    %r15
   43a94:	ret
   43a95:	mov    0x10(%rsp),%rax
   43a9a:	lea    0x18(%rsp),%r14
   43a9f:	mov    %rax,(%r14)
   43aa2:	mov    %rsp,%r15
   43aa5:	mov    %r15,%rdi
   43aa8:	mov    %r14,%rsi
   43aab:	call   57ec2 <__cxa_finalize@plt-0x3895e>
   43ab0:	mov    %rax,%r12
   43ab3:	mov    %r15,%rdi
   43ab6:	mov    %r14,%rsi
   43ab9:	call   5639a <__cxa_finalize@plt-0x3a486>
   43abe:	mov    %rax,%r15
   43ac1:	mov    %r14,%rdi
   43ac4:	call   4d9a2 <__cxa_finalize@plt-0x42e7e>
   43ac9:	mov    %r13,0x8(%rbx)
   43acd:	mov    %r12,0x10(%rbx)
   43ad1:	mov    %r15,0x18(%rbx)
   43ad5:	movb   $0x3f,(%rbx)
   43ad8:	jmp    43a87 <__cxa_finalize@plt-0x4cd99>
