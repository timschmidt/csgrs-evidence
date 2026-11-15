
/mnt/development/.interval-refactor-build/profile-codegen-attribution/dynamic-machine-profile-probe:     file format elf64-x86-64


Disassembly of section .text:

0000000000043947 <.text+0x1fd67>:
   43947:	push   %r14
   43949:	push   %rbx
   4394a:	sub    $0x48,%rsp
   4394e:	mov    %rdi,%rbx
   43951:	mov    %rsp,%r14
   43954:	mov    %r14,%rdi
   43957:	call   43602 <__cxa_finalize@plt-0x4d21e>
   4395c:	cmpb   $0x3f,(%r14)
   43960:	jne    43979 <__cxa_finalize@plt-0x4cea7>
   43962:	movups 0x8(%rsp),%xmm0
   43967:	mov    0x18(%rsp),%rax
   4396c:	movups %xmm0,0x8(%rbx)
   43970:	mov    %rax,0x18(%rbx)
   43974:	movb   $0x3f,(%rbx)
   43977:	jmp    43984 <__cxa_finalize@plt-0x4ce9c>
   43979:	push   $0x48
   4397b:	pop    %rcx
   4397c:	mov    %rsp,%rsi
   4397f:	mov    %rbx,%rdi
   43982:	rep movsb %ds:(%rsi),%es:(%rdi)
   43984:	add    $0x48,%rsp
   43988:	pop    %rbx
   43989:	pop    %r14
   4398b:	ret
