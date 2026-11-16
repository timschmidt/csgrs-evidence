
/tmp/interval-refactor/horner-current/stack-artifacts/candidate:     file format elf64-x86-64


Disassembly of section .text:

00000000000e00e0 <run>:
   e00e0:	55                   	push   %rbp
   e00e1:	48 89 e5             	mov    %rsp,%rbp
   e00e4:	41 54                	push   %r12
   e00e6:	49 89 fc             	mov    %rdi,%r12
   e00e9:	53                   	push   %rbx
   e00ea:	48 83 ec 10          	sub    $0x10,%rsp
   e00ee:	8b 47 24             	mov    0x24(%rdi),%eax
   e00f1:	85 c0                	test   %eax,%eax
   e00f3:	74 08                	je     e00fd <run+0x1d>
   e00f5:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
   e00f9:	41 ff 14 24          	call   *(%r12)
   e00fd:	49 8b 44 24 10       	mov    0x10(%r12),%rax
   e0102:	48 8d 9d ef fd ff ff 	lea    -0x211(%rbp),%rbx
   e0109:	48 39 d8             	cmp    %rbx,%rax
   e010c:	73 24                	jae    e0132 <run+0x52>
   e010e:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   e0115:	00 00 00 00 
   e0119:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   e0120:	41 0f b6 54 24 20    	movzbl 0x20(%r12),%edx
   e0126:	48 83 c0 01          	add    $0x1,%rax
   e012a:	88 50 ff             	mov    %dl,-0x1(%rax)
   e012d:	48 39 c3             	cmp    %rax,%rbx
   e0130:	75 ee                	jne    e0120 <run+0x40>
   e0132:	49 8b 7c 24 08       	mov    0x8(%r12),%rdi
   e0137:	41 ff 14 24          	call   *(%r12)
   e013b:	49 8b 44 24 10       	mov    0x10(%r12),%rax
   e0140:	48 39 d8             	cmp    %rbx,%rax
   e0143:	73 1b                	jae    e0160 <run+0x80>
   e0145:	41 0f b6 4c 24 20    	movzbl 0x20(%r12),%ecx
   e014b:	eb 0c                	jmp    e0159 <run+0x79>
   e014d:	0f 1f 00             	nopl   (%rax)
   e0150:	48 83 c0 01          	add    $0x1,%rax
   e0154:	48 39 d8             	cmp    %rbx,%rax
   e0157:	73 07                	jae    e0160 <run+0x80>
   e0159:	0f b6 10             	movzbl (%rax),%edx
   e015c:	38 ca                	cmp    %cl,%dl
   e015e:	74 f0                	je     e0150 <run+0x70>
   e0160:	31 d2                	xor    %edx,%edx
   e0162:	48 39 c3             	cmp    %rax,%rbx
   e0165:	74 08                	je     e016f <run+0x8f>
   e0167:	49 8b 54 24 18       	mov    0x18(%r12),%rdx
   e016c:	48 29 c2             	sub    %rax,%rdx
   e016f:	49 89 54 24 28       	mov    %rdx,0x28(%r12)
   e0174:	48 83 c4 10          	add    $0x10,%rsp
   e0178:	31 c0                	xor    %eax,%eax
   e017a:	5b                   	pop    %rbx
   e017b:	41 5c                	pop    %r12
   e017d:	5d                   	pop    %rbp
   e017e:	c3                   	ret

Disassembly of section .init:

Disassembly of section .fini:

Disassembly of section .plt:
