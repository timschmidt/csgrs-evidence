
/tmp/interval-refactor/horner-current/stack-artifacts/baseline:     file format elf64-x86-64


Disassembly of section .text:

00000000000dfe80 <run>:
   dfe80:	55                   	push   %rbp
   dfe81:	48 89 e5             	mov    %rsp,%rbp
   dfe84:	41 54                	push   %r12
   dfe86:	49 89 fc             	mov    %rdi,%r12
   dfe89:	53                   	push   %rbx
   dfe8a:	48 83 ec 10          	sub    $0x10,%rsp
   dfe8e:	8b 47 24             	mov    0x24(%rdi),%eax
   dfe91:	85 c0                	test   %eax,%eax
   dfe93:	74 08                	je     dfe9d <run+0x1d>
   dfe95:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
   dfe99:	41 ff 14 24          	call   *(%r12)
   dfe9d:	49 8b 44 24 10       	mov    0x10(%r12),%rax
   dfea2:	48 8d 9d ef fd ff ff 	lea    -0x211(%rbp),%rbx
   dfea9:	48 39 d8             	cmp    %rbx,%rax
   dfeac:	73 24                	jae    dfed2 <run+0x52>
   dfeae:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   dfeb5:	00 00 00 00 
   dfeb9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   dfec0:	41 0f b6 54 24 20    	movzbl 0x20(%r12),%edx
   dfec6:	48 83 c0 01          	add    $0x1,%rax
   dfeca:	88 50 ff             	mov    %dl,-0x1(%rax)
   dfecd:	48 39 c3             	cmp    %rax,%rbx
   dfed0:	75 ee                	jne    dfec0 <run+0x40>
   dfed2:	49 8b 7c 24 08       	mov    0x8(%r12),%rdi
   dfed7:	41 ff 14 24          	call   *(%r12)
   dfedb:	49 8b 44 24 10       	mov    0x10(%r12),%rax
   dfee0:	48 39 d8             	cmp    %rbx,%rax
   dfee3:	73 1b                	jae    dff00 <run+0x80>
   dfee5:	41 0f b6 4c 24 20    	movzbl 0x20(%r12),%ecx
   dfeeb:	eb 0c                	jmp    dfef9 <run+0x79>
   dfeed:	0f 1f 00             	nopl   (%rax)
   dfef0:	48 83 c0 01          	add    $0x1,%rax
   dfef4:	48 39 d8             	cmp    %rbx,%rax
   dfef7:	73 07                	jae    dff00 <run+0x80>
   dfef9:	0f b6 10             	movzbl (%rax),%edx
   dfefc:	38 ca                	cmp    %cl,%dl
   dfefe:	74 f0                	je     dfef0 <run+0x70>
   dff00:	31 d2                	xor    %edx,%edx
   dff02:	48 39 c3             	cmp    %rax,%rbx
   dff05:	74 08                	je     dff0f <run+0x8f>
   dff07:	49 8b 54 24 18       	mov    0x18(%r12),%rdx
   dff0c:	48 29 c2             	sub    %rax,%rdx
   dff0f:	49 89 54 24 28       	mov    %rdx,0x28(%r12)
   dff14:	48 83 c4 10          	add    $0x10,%rsp
   dff18:	31 c0                	xor    %eax,%eax
   dff1a:	5b                   	pop    %rbx
   dff1b:	41 5c                	pop    %r12
   dff1d:	5d                   	pop    %rbp
   dff1e:	c3                   	ret

Disassembly of section .init:

Disassembly of section .fini:

Disassembly of section .plt:
