
/mnt/development/.interval-refactor-build/taylor-scheduling-reconsideration/artifacts/baseline-probe:     file format elf64-x86-64


Disassembly of section .text:

0000000000123df0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E>:
  123df0:	55                   	push   %rbp
  123df1:	41 57                	push   %r15
  123df3:	41 56                	push   %r14
  123df5:	41 55                	push   %r13
  123df7:	41 54                	push   %r12
  123df9:	53                   	push   %rbx
  123dfa:	48 81 ec 48 01 00 00 	sub    $0x148,%rsp
  123e01:	4c 89 8c 24 d0 00 00 	mov    %r9,0xd0(%rsp)
  123e08:	00 
  123e09:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
  123e0e:	89 cd                	mov    %ecx,%ebp
  123e10:	48 89 94 24 e0 00 00 	mov    %rdx,0xe0(%rsp)
  123e17:	00 
  123e18:	49 89 fd             	mov    %rdi,%r13
  123e1b:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  123e22:	00 
  123e23:	48 8b 48 10          	mov    0x10(%rax),%rcx
  123e27:	48 03 8c 24 88 01 00 	add    0x188(%rsp),%rcx
  123e2e:	00 
  123e2f:	72 7c                	jb     123ead <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xbd>
  123e31:	48 8b 46 48          	mov    0x48(%rsi),%rax
  123e35:	48 3b 08             	cmp    (%rax),%rcx
  123e38:	73 73                	jae    123ead <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xbd>
  123e3a:	48 8b 48 10          	mov    0x10(%rax),%rcx
  123e3e:	48 85 c9             	test   %rcx,%rcx
  123e41:	74 0e                	je     123e51 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x61>
  123e43:	0f b6 51 10          	movzbl 0x10(%rcx),%edx
  123e47:	b1 07                	mov    $0x7,%cl
  123e49:	84 d2                	test   %dl,%dl
  123e4b:	0f 85 b8 09 00 00    	jne    124809 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xa19>
  123e51:	48 8b 48 08          	mov    0x8(%rax),%rcx
  123e55:	48 85 c9             	test   %rcx,%rcx
  123e58:	0f 84 a9 09 00 00    	je     124807 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xa17>
  123e5e:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
  123e63:	48 ff c9             	dec    %rcx
  123e66:	48 89 48 08          	mov    %rcx,0x8(%rax)
  123e6a:	ff 15 f8 d3 1b 00    	call   *0x1bd3f8(%rip)        # 2e1268 <_DYNAMIC+0x240>
  123e70:	bf 10 00 00 00       	mov    $0x10,%edi
  123e75:	be 08 00 00 00       	mov    $0x8,%esi
  123e7a:	ff 15 f0 d3 1b 00    	call   *0x1bd3f0(%rip)        # 2e1270 <_DYNAMIC+0x248>
  123e80:	48 85 c0             	test   %rax,%rax
  123e83:	0f 84 f7 0a 00 00    	je     124980 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xb90>
  123e89:	48 8b 8c 24 e0 00 00 	mov    0xe0(%rsp),%rcx
  123e90:	00 
  123e91:	48 89 08             	mov    %rcx,(%rax)
  123e94:	c6 40 08 00          	movb   $0x0,0x8(%rax)
  123e98:	48 c7 44 24 08 01 00 	movq   $0x1,0x8(%rsp)
  123e9f:	00 00 
  123ea1:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  123ea6:	b8 01 00 00 00       	mov    $0x1,%eax
  123eab:	eb 31                	jmp    123ede <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xee>
  123ead:	41 c6 45 00 05       	movb   $0x5,0x0(%r13)
  123eb2:	48 81 c4 48 01 00 00 	add    $0x148,%rsp
  123eb9:	5b                   	pop    %rbx
  123eba:	41 5c                	pop    %r12
  123ebc:	41 5d                	pop    %r13
  123ebe:	41 5e                	pop    %r14
  123ec0:	41 5f                	pop    %r15
  123ec2:	5d                   	pop    %rbp
  123ec3:	c3                   	ret
  123ec4:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
  123ecb:	00 00 00 00 00 
  123ed0:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  123ed5:	48 85 c0             	test   %rax,%rax
  123ed8:	0f 84 6d 09 00 00    	je     12484b <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xa5b>
  123ede:	48 ff c8             	dec    %rax
  123ee1:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  123ee6:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
  123eeb:	48 c1 e0 04          	shl    $0x4,%rax
  123eef:	48 8b 1c 01          	mov    (%rcx,%rax,1),%rbx
  123ef3:	44 0f b6 74 01 08    	movzbl 0x8(%rcx,%rax,1),%r14d
  123ef9:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  123efe:	48 8b 40 48          	mov    0x48(%rax),%rax
  123f02:	48 8b 48 10          	mov    0x10(%rax),%rcx
  123f06:	48 85 c9             	test   %rcx,%rcx
  123f09:	74 0c                	je     123f17 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x127>
  123f0b:	0f b6 49 10          	movzbl 0x10(%rcx),%ecx
  123f0f:	84 c9                	test   %cl,%cl
  123f11:	0f 85 6e 09 00 00    	jne    124885 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xa95>
  123f17:	48 8b 48 08          	mov    0x8(%rax),%rcx
  123f1b:	48 85 c9             	test   %rcx,%rcx
  123f1e:	0f 84 23 09 00 00    	je     124847 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xa57>
  123f24:	48 ff c9             	dec    %rcx
  123f27:	48 89 48 08          	mov    %rcx,0x8(%rax)
  123f2b:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  123f32:	00 
  123f33:	48 8b 00             	mov    (%rax),%rax
  123f36:	48 85 c0             	test   %rax,%rax
  123f39:	0f 84 91 00 00 00    	je     123fd0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x1e0>
  123f3f:	48 8b 8c 24 80 01 00 	mov    0x180(%rsp),%rcx
  123f46:	00 
  123f47:	48 8b 49 08          	mov    0x8(%rcx),%rcx
  123f4b:	0f b7 b0 12 01 00 00 	movzwl 0x112(%rax),%esi
  123f52:	89 f7                	mov    %esi,%edi
  123f54:	c1 e7 04             	shl    $0x4,%edi
  123f57:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  123f5e:	49 89 c0             	mov    %rax,%r8
  123f61:	eb 26                	jmp    123f89 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x199>
  123f63:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  123f6a:	84 00 00 00 00 00 
  123f70:	41 0f 97 c1          	seta   %r9b
  123f74:	41 80 d9 00          	sbb    $0x0,%r9b
  123f78:	49 83 c0 10          	add    $0x10,%r8
  123f7c:	48 ff c2             	inc    %rdx
  123f7f:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
  123f83:	41 80 f9 01          	cmp    $0x1,%r9b
  123f87:	75 17                	jne    123fa0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x1b0>
  123f89:	48 85 ff             	test   %rdi,%rdi
  123f8c:	74 22                	je     123fb0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x1c0>
  123f8e:	49 3b 18             	cmp    (%r8),%rbx
  123f91:	75 dd                	jne    123f70 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x180>
  123f93:	41 3b 68 08          	cmp    0x8(%r8),%ebp
  123f97:	eb d7                	jmp    123f70 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x180>
  123f99:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  123fa0:	41 0f b6 f1          	movzbl %r9b,%esi
  123fa4:	85 f6                	test   %esi,%esi
  123fa6:	75 0b                	jne    123fb3 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x1c3>
  123fa8:	e9 23 ff ff ff       	jmp    123ed0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xe0>
  123fad:	0f 1f 00             	nopl   (%rax)
  123fb0:	48 89 f2             	mov    %rsi,%rdx
  123fb3:	48 83 e9 01          	sub    $0x1,%rcx
  123fb7:	72 17                	jb     123fd0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x1e0>
  123fb9:	48 8b 84 d0 18 01 00 	mov    0x118(%rax,%rdx,8),%rax
  123fc0:	00 
  123fc1:	eb 88                	jmp    123f4b <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x15b>
  123fc3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  123fca:	84 00 00 00 00 00 
  123fd0:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  123fd5:	48 8b 70 28          	mov    0x28(%rax),%rsi
  123fd9:	48 39 f3             	cmp    %rsi,%rbx
  123fdc:	0f 83 e4 09 00 00    	jae    1249c6 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xbd6>
  123fe2:	48 8b 40 20          	mov    0x20(%rax),%rax
  123fe6:	48 8d 0c 5b          	lea    (%rbx,%rbx,2),%rcx
  123fea:	48 c1 e1 04          	shl    $0x4,%rcx
  123fee:	48 8d 34 08          	lea    (%rax,%rcx,1),%rsi
  123ff2:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
  123ff6:	48 8d 48 eb          	lea    -0x15(%rax),%rcx
  123ffa:	48 83 f8 16          	cmp    $0x16,%rax
  123ffe:	b8 00 00 00 00       	mov    $0x0,%eax
  124003:	48 0f 42 c8          	cmovb  %rax,%rcx
  124007:	48 8d 15 96 a4 f7 ff 	lea    -0x85b6a(%rip),%rdx        # 9e4a4 <_ZN4zmij11STATIC_DATA17h6667eed1abdb5cafE+0x46a4>
  12400e:	48 63 04 8a          	movslq (%rdx,%rcx,4),%rax
  124012:	48 01 d0             	add    %rdx,%rax
  124015:	ff e0                	jmp    *%rax
  124017:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  12401c:	e8 9f 60 00 00       	call   12a0c0 <_ZN72_$LT$hyperreal..real..arithmetic..Real$u20$as$u20$core..clone..Clone$GT$5clone17hf71a33f673886a59E.llvm.1417747527575319877>
  124021:	0f b6 44 24 70       	movzbl 0x70(%rsp),%eax
  124026:	e9 98 00 00 00       	jmp    1240c3 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x2d3>
  12402b:	48 8b 46 18          	mov    0x18(%rsi),%rax
  12402f:	f3 0f 6f 46 08       	movdqu 0x8(%rsi),%xmm0
  124034:	f3 0f 7f 44 24 78    	movdqu %xmm0,0x78(%rsp)
  12403a:	48 89 84 24 88 00 00 	mov    %rax,0x88(%rsp)
  124041:	00 
  124042:	b0 17                	mov    $0x17,%al
  124044:	eb 79                	jmp    1240bf <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x2cf>
  124046:	0f b6 46 18          	movzbl 0x18(%rsi),%eax
  12404a:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
  124051:	f3 0f 6f 46 08       	movdqu 0x8(%rsi),%xmm0
  124056:	f3 0f 7f 44 24 78    	movdqu %xmm0,0x78(%rsp)
  12405c:	b0 18                	mov    $0x18,%al
  12405e:	eb 5f                	jmp    1240bf <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x2cf>
  124060:	44 8b 7e 20          	mov    0x20(%rsi),%r15d
  124064:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
  12406b:	00 00 80 
  12406e:	48 89 c8             	mov    %rcx,%rax
  124071:	48 39 4e 08          	cmp    %rcx,0x8(%rsi)
  124075:	74 24                	je     12409b <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x2ab>
  124077:	48 83 c6 08          	add    $0x8,%rsi
  12407b:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  124080:	ff 15 32 d2 1b 00    	call   *0x1bd232(%rip)        # 2e12b8 <_DYNAMIC+0x290>
  124086:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  12408b:	48 8d 4c 24 38       	lea    0x38(%rsp),%rcx
  124090:	0f 10 01             	movups (%rcx),%xmm0
  124093:	0f 29 84 24 a0 00 00 	movaps %xmm0,0xa0(%rsp)
  12409a:	00 
  12409b:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
  1240a0:	66 0f 6f 84 24 a0 00 	movdqa 0xa0(%rsp),%xmm0
  1240a7:	00 00 
  1240a9:	48 8d 84 24 80 00 00 	lea    0x80(%rsp),%rax
  1240b0:	00 
  1240b1:	f3 0f 7f 00          	movdqu %xmm0,(%rax)
  1240b5:	44 89 bc 24 90 00 00 	mov    %r15d,0x90(%rsp)
  1240bc:	00 
  1240bd:	b0 16                	mov    $0x16,%al
  1240bf:	88 44 24 70          	mov    %al,0x70(%rsp)
  1240c3:	0f b6 c8             	movzbl %al,%ecx
  1240c6:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  1240ca:	80 f9 16             	cmp    $0x16,%cl
  1240cd:	b9 00 00 00 00       	mov    $0x0,%ecx
  1240d2:	48 0f 42 c1          	cmovb  %rcx,%rax
  1240d6:	45 84 f6             	test   %r14b,%r14b
  1240d9:	74 2f                	je     12410a <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x31a>
  1240db:	48 8d 0d d2 a3 f7 ff 	lea    -0x85c2e(%rip),%rcx        # 9e4b4 <_ZN4zmij11STATIC_DATA17h6667eed1abdb5cafE+0x46b4>
  1240e2:	48 63 04 81          	movslq (%rcx,%rax,4),%rax
  1240e6:	48 01 c8             	add    %rcx,%rax
  1240e9:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  1240ee:	ff e0                	jmp    *%rax
  1240f0:	39 ac 24 90 00 00 00 	cmp    %ebp,0x90(%rsp)
  1240f7:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  1240fc:	48 0f 44 94 24 d0 00 	cmove  0xd0(%rsp),%rdx
  124103:	00 00 
  124105:	e9 7f 05 00 00       	jmp    124689 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x899>
  12410a:	83 f8 02             	cmp    $0x2,%eax
  12410d:	73 0b                	jae    12411a <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x32a>
  12410f:	45 31 f6             	xor    %r14d,%r14d
  124112:	45 31 ff             	xor    %r15d,%r15d
  124115:	e9 c0 03 00 00       	jmp    1244da <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x6ea>
  12411a:	83 f8 02             	cmp    $0x2,%eax
  12411d:	0f 85 8e 03 00 00    	jne    1244b1 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x6c1>
  124123:	41 be 01 00 00 00    	mov    $0x1,%r14d
  124129:	48 8b 84 24 88 00 00 	mov    0x88(%rsp),%rax
  124130:	00 
  124131:	48 89 84 24 d8 00 00 	mov    %rax,0xd8(%rsp)
  124138:	00 
  124139:	45 31 ff             	xor    %r15d,%r15d
  12413c:	e9 99 03 00 00       	jmp    1244da <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x6ea>
  124141:	4c 89 6c 24 68       	mov    %r13,0x68(%rsp)
  124146:	f3 0f 6f 84 24 88 00 	movdqu 0x88(%rsp),%xmm0
  12414d:	00 00 
  12414f:	66 0f 70 c0 44       	pshufd $0x44,%xmm0,%xmm0
  124154:	41 be 01 00 00 00    	mov    $0x1,%r14d
  12415a:	eb 11                	jmp    12416d <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x37d>
  12415c:	4c 89 6c 24 68       	mov    %r13,0x68(%rsp)
  124161:	41 be 02 00 00 00    	mov    $0x2,%r14d
  124167:	f3 0f 6f 44 24 78    	movdqu 0x78(%rsp),%xmm0
  12416d:	66 0f 7f 84 24 00 01 	movdqa %xmm0,0x100(%rsp)
  124174:	00 00 
  124176:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  12417b:	48 89 84 24 e8 00 00 	mov    %rax,0xe8(%rsp)
  124182:	00 
  124183:	48 89 84 24 f0 00 00 	mov    %rax,0xf0(%rsp)
  12418a:	00 
  12418b:	45 31 ff             	xor    %r15d,%r15d
  12418e:	eb 17                	jmp    1241a7 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x3b7>
  124190:	4c 89 e0             	mov    %r12,%rax
  124193:	4a 89 84 fc e8 00 00 	mov    %rax,0xe8(%rsp,%r15,8)
  12419a:	00 
  12419b:	4d 89 ef             	mov    %r13,%r15
  12419e:	4d 39 f5             	cmp    %r14,%r13
  1241a1:	0f 84 e2 02 00 00    	je     124489 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x699>
  1241a7:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  1241ae:	00 
  1241af:	48 8b 00             	mov    (%rax),%rax
  1241b2:	48 85 c0             	test   %rax,%rax
  1241b5:	0f 84 f0 07 00 00    	je     1249ab <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xbbb>
  1241bb:	4d 8d 6f 01          	lea    0x1(%r15),%r13
  1241bf:	4a 8b 8c fc 00 01 00 	mov    0x100(%rsp,%r15,8),%rcx
  1241c6:	00 
  1241c7:	48 8b 94 24 80 01 00 	mov    0x180(%rsp),%rdx
  1241ce:	00 
  1241cf:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  1241d3:	0f b7 b8 12 01 00 00 	movzwl 0x112(%rax),%edi
  1241da:	41 89 f8             	mov    %edi,%r8d
  1241dd:	41 c1 e0 04          	shl    $0x4,%r8d
  1241e1:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  1241e8:	49 89 c1             	mov    %rax,%r9
  1241eb:	eb 1c                	jmp    124209 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x419>
  1241ed:	0f 1f 00             	nopl   (%rax)
  1241f0:	41 0f 97 c2          	seta   %r10b
  1241f4:	41 80 da 00          	sbb    $0x0,%r10b
  1241f8:	49 83 c1 10          	add    $0x10,%r9
  1241fc:	48 ff c6             	inc    %rsi
  1241ff:	49 83 c0 f0          	add    $0xfffffffffffffff0,%r8
  124203:	41 80 fa 01          	cmp    $0x1,%r10b
  124207:	75 17                	jne    124220 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x430>
  124209:	4d 85 c0             	test   %r8,%r8
  12420c:	74 22                	je     124230 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x440>
  12420e:	49 3b 09             	cmp    (%r9),%rcx
  124211:	75 dd                	jne    1241f0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x400>
  124213:	41 3b 69 08          	cmp    0x8(%r9),%ebp
  124217:	eb d7                	jmp    1241f0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x400>
  124219:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  124220:	41 0f b6 fa          	movzbl %r10b,%edi
  124224:	85 ff                	test   %edi,%edi
  124226:	75 0b                	jne    124233 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x443>
  124228:	eb 26                	jmp    124250 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x460>
  12422a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  124230:	48 89 fe             	mov    %rdi,%rsi
  124233:	48 83 ea 01          	sub    $0x1,%rdx
  124237:	0f 82 6e 07 00 00    	jb     1249ab <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xbbb>
  12423d:	48 8b 84 f0 18 01 00 	mov    0x118(%rax,%rsi,8),%rax
  124244:	00 
  124245:	eb 8c                	jmp    1241d3 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x3e3>
  124247:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  12424e:	00 00 
  124250:	4c 8b a4 f0 b8 00 00 	mov    0xb8(%rax,%rsi,8),%r12
  124257:	00 
  124258:	4c 3b 64 24 28       	cmp    0x28(%rsp),%r12
  12425d:	0f 84 38 ff ff ff    	je     12419b <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x3ab>
  124263:	0f b6 4c 24 70       	movzbl 0x70(%rsp),%ecx
  124268:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  12426c:	48 83 f9 16          	cmp    $0x16,%rcx
  124270:	b9 00 00 00 00       	mov    $0x0,%ecx
  124275:	48 0f 42 c1          	cmovb  %rcx,%rax
  124279:	48 83 f8 02          	cmp    $0x2,%rax
  12427d:	0f 84 7d 00 00 00    	je     124300 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x510>
  124283:	83 f8 03             	cmp    $0x3,%eax
  124286:	0f 85 d9 06 00 00    	jne    124965 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xb75>
  12428c:	0f b6 84 24 88 00 00 	movzbl 0x88(%rsp),%eax
  124293:	00 
  124294:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
  12429b:	00 00 80 
  12429e:	48 89 8c 24 a8 00 00 	mov    %rcx,0xa8(%rsp)
  1242a5:	00 
  1242a6:	c7 84 24 c0 00 00 00 	movl   $0x0,0xc0(%rsp)
  1242ad:	00 00 00 00 
  1242b1:	c6 84 24 a0 00 00 00 	movb   $0x16,0xa0(%rsp)
  1242b8:	16 
  1242b9:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
  1242be:	c7 44 24 50 01 00 00 	movl   $0x1,0x50(%rsp)
  1242c5:	00 
  1242c6:	c6 44 24 30 16       	movb   $0x16,0x30(%rsp)
  1242cb:	48 8d 0d f2 a1 f7 ff 	lea    -0x85e0e(%rip),%rcx        # 9e4c4 <_ZN4zmij11STATIC_DATA17h6667eed1abdb5cafE+0x46c4>
  1242d2:	48 63 04 81          	movslq (%rcx,%rax,4),%rax
  1242d6:	48 01 c8             	add    %rcx,%rax
  1242d9:	ff e0                	jmp    *%rax
  1242db:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  1242e2:	00 
  1242e3:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
  1242ea:	00 
  1242eb:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  1242f0:	ff 15 f2 d4 1b 00    	call   *0x1bd4f2(%rip)        # 2e17e8 <_DYNAMIC+0x7c0>
  1242f6:	eb 43                	jmp    12433b <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x54b>
  1242f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  1242ff:	00 
  124300:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
  124305:	48 8b 94 24 80 00 00 	mov    0x80(%rsp),%rdx
  12430c:	00 
  12430d:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
  124314:	00 00 80 
  124317:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  12431c:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%rsp)
  124323:	00 
  124324:	c6 44 24 30 16       	movb   $0x16,0x30(%rsp)
  124329:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  124330:	00 
  124331:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
  124336:	e8 e5 06 00 00       	call   124a20 <_ZN10hypersolve18expression_program8jacobian5unary17h3c4f7f36b09b4295E>
  12433b:	f3 0f 6f 84 24 18 01 	movdqu 0x118(%rsp),%xmm0
  124342:	00 00 
  124344:	0f 10 8c 24 28 01 00 	movups 0x128(%rsp),%xmm1
  12434b:	00 
  12434c:	0f 10 94 24 38 01 00 	movups 0x138(%rsp),%xmm2
  124353:	00 
  124354:	0f 29 54 24 50       	movaps %xmm2,0x50(%rsp)
  124359:	0f 29 4c 24 40       	movaps %xmm1,0x40(%rsp)
  12435e:	66 0f 7f 44 24 30    	movdqa %xmm0,0x30(%rsp)
  124364:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  12436b:	00 
  12436c:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
  124371:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  124376:	44 89 f9             	mov    %r15d,%ecx
  124379:	4c 8d 84 24 00 01 00 	lea    0x100(%rsp),%r8
  124380:	00 
  124381:	4d 89 f1             	mov    %r14,%r9
  124384:	ff b4 24 d0 00 00 00 	push   0xd0(%rsp)
  12438b:	ff 74 24 30          	push   0x30(%rsp)
  12438f:	e8 1c 20 00 00       	call   1263b0 <_ZN10hypersolve18expression_program8jacobian7Builder7partial17h36b060fd2b4c92c8E>
  124394:	48 83 c4 10          	add    $0x10,%rsp
  124398:	0f b6 8c 24 a0 00 00 	movzbl 0xa0(%rsp),%ecx
  12439f:	00 
  1243a0:	80 f9 0d             	cmp    $0xd,%cl
  1243a3:	0f 85 69 04 00 00    	jne    124812 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xa22>
  1243a9:	48 8b 8c 24 a8 00 00 	mov    0xa8(%rsp),%rcx
  1243b0:	00 
  1243b1:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  1243b6:	48 89 d0             	mov    %rdx,%rax
  1243b9:	48 39 d1             	cmp    %rdx,%rcx
  1243bc:	0f 84 d1 fd ff ff    	je     124193 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x3a3>
  1243c2:	48 8b 84 24 d0 00 00 	mov    0xd0(%rsp),%rax
  1243c9:	00 
  1243ca:	48 39 c1             	cmp    %rax,%rcx
  1243cd:	0f 84 bd fd ff ff    	je     124190 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x3a0>
  1243d3:	49 39 c4             	cmp    %rax,%r12
  1243d6:	75 68                	jne    124440 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x650>
  1243d8:	48 89 c8             	mov    %rcx,%rax
  1243db:	e9 b3 fd ff ff       	jmp    124193 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x3a3>
  1243e0:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  1243e7:	00 
  1243e8:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
  1243ef:	00 
  1243f0:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  1243f5:	ff 15 95 d0 1b 00    	call   *0x1bd095(%rip)        # 2e1490 <_DYNAMIC+0x468>
  1243fb:	e9 3b ff ff ff       	jmp    12433b <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x54b>
  124400:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  124407:	00 
  124408:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
  12440f:	00 
  124410:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  124415:	ff 15 d5 d3 1b 00    	call   *0x1bd3d5(%rip)        # 2e17f0 <_DYNAMIC+0x7c8>
  12441b:	e9 1b ff ff ff       	jmp    12433b <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x54b>
  124420:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  124427:	00 
  124428:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
  12442f:	00 
  124430:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  124435:	ff 15 bd d3 1b 00    	call   *0x1bd3bd(%rip)        # 2e17f8 <_DYNAMIC+0x7d0>
  12443b:	e9 fb fe ff ff       	jmp    12433b <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x54b>
  124440:	c6 44 24 48 02       	movb   $0x2,0x48(%rsp)
  124445:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
  12444a:	4c 89 64 24 40       	mov    %r12,0x40(%rsp)
  12444f:	c6 44 24 30 18       	movb   $0x18,0x30(%rsp)
  124454:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  12445b:	00 
  12445c:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
  124461:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  124466:	e8 95 1d 00 00       	call   126200 <_ZN10hypersolve18expression_program8jacobian7Builder4push17hca6f100d034aece7E>
  12446b:	0f b6 8c 24 a0 00 00 	movzbl 0xa0(%rsp),%ecx
  124472:	00 
  124473:	48 8b 84 24 a8 00 00 	mov    0xa8(%rsp),%rax
  12447a:	00 
  12447b:	80 f9 0d             	cmp    $0xd,%cl
  12447e:	0f 84 0f fd ff ff    	je     124193 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x3a3>
  124484:	e9 92 04 00 00       	jmp    12491b <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xb2b>
  124489:	48 8b 84 24 e8 00 00 	mov    0xe8(%rsp),%rax
  124490:	00 
  124491:	48 8b 94 24 f0 00 00 	mov    0xf0(%rsp),%rdx
  124498:	00 
  124499:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
  12449e:	48 39 c8             	cmp    %rcx,%rax
  1244a1:	0f 85 90 01 00 00    	jne    124637 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x847>
  1244a7:	4c 8b 6c 24 68       	mov    0x68(%rsp),%r13
  1244ac:	e9 d8 01 00 00       	jmp    124689 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x899>
  1244b1:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
  1244b6:	48 89 84 24 d8 00 00 	mov    %rax,0xd8(%rsp)
  1244bd:	00 
  1244be:	48 8b 84 24 80 00 00 	mov    0x80(%rsp),%rax
  1244c5:	00 
  1244c6:	48 89 84 24 f8 00 00 	mov    %rax,0xf8(%rsp)
  1244cd:	00 
  1244ce:	41 be 01 00 00 00    	mov    $0x1,%r14d
  1244d4:	41 bf 01 00 00 00    	mov    $0x1,%r15d
  1244da:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  1244e1:	00 
  1244e2:	48 8b 70 10          	mov    0x10(%rax),%rsi
  1244e6:	b0 05                	mov    $0x5,%al
  1244e8:	48 03 b4 24 88 01 00 	add    0x188(%rsp),%rsi
  1244ef:	00 
  1244f0:	0f 82 a4 03 00 00    	jb     12489a <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaaa>
  1244f6:	48 03 74 24 18       	add    0x18(%rsp),%rsi
  1244fb:	0f 82 99 03 00 00    	jb     12489a <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaaa>
  124501:	4b 8d 0c 37          	lea    (%r15,%r14,1),%rcx
  124505:	48 ff c1             	inc    %rcx
  124508:	48 01 ce             	add    %rcx,%rsi
  12450b:	0f 82 89 03 00 00    	jb     12489a <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaaa>
  124511:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  124516:	48 8b 52 48          	mov    0x48(%rdx),%rdx
  12451a:	48 3b 32             	cmp    (%rdx),%rsi
  12451d:	0f 87 77 03 00 00    	ja     12489a <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaaa>
  124523:	48 8b 42 10          	mov    0x10(%rdx),%rax
  124527:	48 85 c0             	test   %rax,%rax
  12452a:	74 0c                	je     124538 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x748>
  12452c:	0f b6 40 10          	movzbl 0x10(%rax),%eax
  124530:	84 c0                	test   %al,%al
  124532:	0f 85 60 03 00 00    	jne    124898 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaa8>
  124538:	4b 8d 34 37          	lea    (%r15,%r14,1),%rsi
  12453c:	48 8b 42 08          	mov    0x8(%rdx),%rax
  124540:	48 39 c6             	cmp    %rax,%rsi
  124543:	0f 83 44 03 00 00    	jae    12488d <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xa9d>
  124549:	48 29 c8             	sub    %rcx,%rax
  12454c:	48 89 42 08          	mov    %rax,0x8(%rdx)
  124550:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  124555:	4c 3b 64 24 08       	cmp    0x8(%rsp),%r12
  12455a:	75 0b                	jne    124567 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x777>
  12455c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  124561:	ff 15 f1 d1 1b 00    	call   *0x1bd1f1(%rip)        # 2e1758 <_DYNAMIC+0x730>
  124567:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  12456c:	4c 89 e1             	mov    %r12,%rcx
  12456f:	48 c1 e1 04          	shl    $0x4,%rcx
  124573:	48 89 1c 08          	mov    %rbx,(%rax,%rcx,1)
  124577:	c6 44 08 08 01       	movb   $0x1,0x8(%rax,%rcx,1)
  12457c:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  124581:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
  124586:	4d 85 ff             	test   %r15,%r15
  124589:	74 38                	je     1245c3 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x7d3>
  12458b:	48 3b 5c 24 08       	cmp    0x8(%rsp),%rbx
  124590:	75 0b                	jne    12459d <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x7ad>
  124592:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  124597:	ff 15 bb d1 1b 00    	call   *0x1bd1bb(%rip)        # 2e1758 <_DYNAMIC+0x730>
  12459d:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  1245a2:	48 c1 e3 04          	shl    $0x4,%rbx
  1245a6:	48 8b 8c 24 f8 00 00 	mov    0xf8(%rsp),%rcx
  1245ad:	00 
  1245ae:	48 89 0c 18          	mov    %rcx,(%rax,%rbx,1)
  1245b2:	c6 44 18 08 00       	movb   $0x0,0x8(%rax,%rbx,1)
  1245b7:	49 83 c4 02          	add    $0x2,%r12
  1245bb:	4c 89 64 24 18       	mov    %r12,0x18(%rsp)
  1245c0:	4c 89 e3             	mov    %r12,%rbx
  1245c3:	4d 85 f6             	test   %r14,%r14
  1245c6:	74 37                	je     1245ff <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x80f>
  1245c8:	48 3b 5c 24 08       	cmp    0x8(%rsp),%rbx
  1245cd:	75 0b                	jne    1245da <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x7ea>
  1245cf:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  1245d4:	ff 15 7e d1 1b 00    	call   *0x1bd17e(%rip)        # 2e1758 <_DYNAMIC+0x730>
  1245da:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  1245df:	48 89 d9             	mov    %rbx,%rcx
  1245e2:	48 c1 e1 04          	shl    $0x4,%rcx
  1245e6:	48 8b 94 24 d8 00 00 	mov    0xd8(%rsp),%rdx
  1245ed:	00 
  1245ee:	48 89 14 08          	mov    %rdx,(%rax,%rcx,1)
  1245f2:	c6 44 08 08 00       	movb   $0x0,0x8(%rax,%rcx,1)
  1245f7:	48 ff c3             	inc    %rbx
  1245fa:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
  1245ff:	0f b6 4c 24 70       	movzbl 0x70(%rsp),%ecx
  124604:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  124608:	48 83 f9 16          	cmp    $0x16,%rcx
  12460c:	b9 00 00 00 00       	mov    $0x0,%ecx
  124611:	48 0f 42 c1          	cmovb  %rcx,%rax
  124615:	48 83 f8 01          	cmp    $0x1,%rax
  124619:	0f 84 c2 01 00 00    	je     1247e1 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x9f1>
  12461f:	48 85 c0             	test   %rax,%rax
  124622:	0f 85 a8 f8 ff ff    	jne    123ed0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xe0>
  124628:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  12462d:	e8 8e 3a 00 00       	call   1280c0 <_ZN4core3ptr54drop_in_place$LT$hyperreal..real..arithmetic..Real$GT$17h99ff7b0d018f9f04E.llvm.1417747527575319877>
  124632:	e9 99 f8 ff ff       	jmp    123ed0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xe0>
  124637:	48 39 ca             	cmp    %rcx,%rdx
  12463a:	4c 8b 6c 24 68       	mov    0x68(%rsp),%r13
  12463f:	75 05                	jne    124646 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x856>
  124641:	48 89 c2             	mov    %rax,%rdx
  124644:	eb 43                	jmp    124689 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x899>
  124646:	c6 44 24 48 00       	movb   $0x0,0x48(%rsp)
  12464b:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  124650:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
  124655:	c6 44 24 30 18       	movb   $0x18,0x30(%rsp)
  12465a:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  124661:	00 
  124662:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
  124667:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  12466c:	e8 8f 1b 00 00       	call   126200 <_ZN10hypersolve18expression_program8jacobian7Builder4push17hca6f100d034aece7E>
  124671:	0f b6 84 24 a0 00 00 	movzbl 0xa0(%rsp),%eax
  124678:	00 
  124679:	3c 0d                	cmp    $0xd,%al
  12467b:	0f 85 b8 02 00 00    	jne    124939 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xb49>
  124681:	48 8b 94 24 a8 00 00 	mov    0xa8(%rsp),%rdx
  124688:	00 
  124689:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  124690:	00 
  124691:	48 8b 40 10          	mov    0x10(%rax),%rax
  124695:	48 03 84 24 88 01 00 	add    0x188(%rsp),%rax
  12469c:	00 
  12469d:	0f 82 ee 01 00 00    	jb     124891 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaa1>
  1246a3:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  1246a8:	48 01 c1             	add    %rax,%rcx
  1246ab:	48 39 c1             	cmp    %rax,%rcx
  1246ae:	0f 82 dd 01 00 00    	jb     124891 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaa1>
  1246b4:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  1246b9:	48 8b 40 48          	mov    0x48(%rax),%rax
  1246bd:	48 3b 08             	cmp    (%rax),%rcx
  1246c0:	0f 83 cb 01 00 00    	jae    124891 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaa1>
  1246c6:	48 8b 48 10          	mov    0x10(%rax),%rcx
  1246ca:	48 85 c9             	test   %rcx,%rcx
  1246cd:	74 0c                	je     1246db <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x8eb>
  1246cf:	0f b6 49 10          	movzbl 0x10(%rcx),%ecx
  1246d3:	84 c9                	test   %cl,%cl
  1246d5:	0f 85 bd 01 00 00    	jne    124898 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaa8>
  1246db:	48 8b 48 08          	mov    0x8(%rax),%rcx
  1246df:	48 85 c9             	test   %rcx,%rcx
  1246e2:	0f 84 a5 01 00 00    	je     12488d <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xa9d>
  1246e8:	48 ff c9             	dec    %rcx
  1246eb:	48 89 48 08          	mov    %rcx,0x8(%rax)
  1246ef:	48 8b 8c 24 80 01 00 	mov    0x180(%rsp),%rcx
  1246f6:	00 
  1246f7:	48 8b 01             	mov    (%rcx),%rax
  1246fa:	48 85 c0             	test   %rax,%rax
  1246fd:	74 71                	je     124770 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x980>
  1246ff:	48 8b 71 08          	mov    0x8(%rcx),%rsi
  124703:	0f b7 b8 12 01 00 00 	movzwl 0x112(%rax),%edi
  12470a:	41 89 f8             	mov    %edi,%r8d
  12470d:	41 c1 e0 04          	shl    $0x4,%r8d
  124711:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  124718:	49 89 c1             	mov    %rax,%r9
  12471b:	eb 1c                	jmp    124739 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x949>
  12471d:	0f 1f 00             	nopl   (%rax)
  124720:	41 0f 97 c2          	seta   %r10b
  124724:	41 80 da 00          	sbb    $0x0,%r10b
  124728:	49 83 c1 10          	add    $0x10,%r9
  12472c:	48 ff c1             	inc    %rcx
  12472f:	49 83 c0 f0          	add    $0xfffffffffffffff0,%r8
  124733:	41 80 fa 01          	cmp    $0x1,%r10b
  124737:	75 10                	jne    124749 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x959>
  124739:	4d 85 c0             	test   %r8,%r8
  12473c:	74 15                	je     124753 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x963>
  12473e:	49 3b 19             	cmp    (%r9),%rbx
  124741:	75 dd                	jne    124720 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x930>
  124743:	41 3b 69 08          	cmp    0x8(%r9),%ebp
  124747:	eb d7                	jmp    124720 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x930>
  124749:	41 0f b6 fa          	movzbl %r10b,%edi
  12474d:	85 ff                	test   %edi,%edi
  12474f:	75 05                	jne    124756 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x966>
  124751:	eb 13                	jmp    124766 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x976>
  124753:	48 89 f9             	mov    %rdi,%rcx
  124756:	48 83 ee 01          	sub    $0x1,%rsi
  12475a:	72 16                	jb     124772 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x982>
  12475c:	48 8b 84 c8 18 01 00 	mov    0x118(%rax,%rcx,8),%rax
  124763:	00 
  124764:	eb 9d                	jmp    124703 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x913>
  124766:	48 89 94 c8 b8 00 00 	mov    %rdx,0xb8(%rax,%rcx,8)
  12476d:	00 
  12476e:	eb 3d                	jmp    1247ad <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x9bd>
  124770:	31 c0                	xor    %eax,%eax
  124772:	48 8b b4 24 80 01 00 	mov    0x180(%rsp),%rsi
  124779:	00 
  12477a:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
  12477f:	48 89 5c 24 38       	mov    %rbx,0x38(%rsp)
  124784:	89 6c 24 40          	mov    %ebp,0x40(%rsp)
  124788:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
  12478d:	48 c7 44 24 50 00 00 	movq   $0x0,0x50(%rsp)
  124794:	00 00 
  124796:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
  12479b:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  1247a2:	00 
  1247a3:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  1247a8:	e8 d3 92 00 00       	call   12da80 <_ZN5alloc11collections5btree3map5entry28VacantEntry$LT$K$C$V$C$A$GT$12insert_entry17h9eb989a970915e3dE>
  1247ad:	0f b6 4c 24 70       	movzbl 0x70(%rsp),%ecx
  1247b2:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  1247b6:	48 83 f9 16          	cmp    $0x16,%rcx
  1247ba:	b9 00 00 00 00       	mov    $0x0,%ecx
  1247bf:	48 0f 42 c1          	cmovb  %rcx,%rax
  1247c3:	48 83 f8 01          	cmp    $0x1,%rax
  1247c7:	74 18                	je     1247e1 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x9f1>
  1247c9:	48 85 c0             	test   %rax,%rax
  1247cc:	0f 85 fe f6 ff ff    	jne    123ed0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xe0>
  1247d2:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  1247d7:	e8 e4 38 00 00       	call   1280c0 <_ZN4core3ptr54drop_in_place$LT$hyperreal..real..arithmetic..Real$GT$17h99ff7b0d018f9f04E.llvm.1417747527575319877>
  1247dc:	e9 ef f6 ff ff       	jmp    123ed0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xe0>
  1247e1:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
  1247e6:	48 85 f6             	test   %rsi,%rsi
  1247e9:	0f 8e e1 f6 ff ff    	jle    123ed0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xe0>
  1247ef:	48 8b bc 24 80 00 00 	mov    0x80(%rsp),%rdi
  1247f6:	00 
  1247f7:	ba 01 00 00 00       	mov    $0x1,%edx
  1247fc:	ff 15 86 ca 1b 00    	call   *0x1bca86(%rip)        # 2e1288 <_DYNAMIC+0x260>
  124802:	e9 c9 f6 ff ff       	jmp    123ed0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xe0>
  124807:	b1 06                	mov    $0x6,%cl
  124809:	41 88 4d 00          	mov    %cl,0x0(%r13)
  12480d:	e9 a0 f6 ff ff       	jmp    123eb2 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xc2>
  124812:	8b 84 24 a1 00 00 00 	mov    0xa1(%rsp),%eax
  124819:	8b 94 24 a4 00 00 00 	mov    0xa4(%rsp),%edx
  124820:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
  124825:	89 57 04             	mov    %edx,0x4(%rdi)
  124828:	89 47 01             	mov    %eax,0x1(%rdi)
  12482b:	48 8b 84 24 a8 00 00 	mov    0xa8(%rsp),%rax
  124832:	00 
  124833:	48 8b 94 24 b0 00 00 	mov    0xb0(%rsp),%rdx
  12483a:	00 
  12483b:	88 0f                	mov    %cl,(%rdi)
  12483d:	48 89 47 08          	mov    %rax,0x8(%rdi)
  124841:	48 89 57 10          	mov    %rdx,0x10(%rdi)
  124845:	eb 57                	jmp    12489e <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaae>
  124847:	b0 06                	mov    $0x6,%al
  124849:	eb 3c                	jmp    124887 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xa97>
  12484b:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
  124852:	00 
  124853:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  124858:	89 6c 24 38          	mov    %ebp,0x38(%rsp)
  12485c:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  124861:	48 8b bc 24 80 01 00 	mov    0x180(%rsp),%rdi
  124868:	00 
  124869:	e8 52 a0 01 00       	call   13e8c0 <_ZN5alloc11collections5btree3map25BTreeMap$LT$K$C$V$C$A$GT$3get17h24a366a37cf3e78fE>
  12486e:	48 85 c0             	test   %rax,%rax
  124871:	0f 84 19 01 00 00    	je     124990 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xba0>
  124877:	48 8b 00             	mov    (%rax),%rax
  12487a:	49 89 45 08          	mov    %rax,0x8(%r13)
  12487e:	41 c6 45 00 0d       	movb   $0xd,0x0(%r13)
  124883:	eb 6f                	jmp    1248f4 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xb04>
  124885:	b0 07                	mov    $0x7,%al
  124887:	41 88 45 00          	mov    %al,0x0(%r13)
  12488b:	eb 67                	jmp    1248f4 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xb04>
  12488d:	b0 06                	mov    $0x6,%al
  12488f:	eb 09                	jmp    12489a <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaaa>
  124891:	41 c6 45 00 05       	movb   $0x5,0x0(%r13)
  124896:	eb 06                	jmp    12489e <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaae>
  124898:	b0 07                	mov    $0x7,%al
  12489a:	41 88 45 00          	mov    %al,0x0(%r13)
  12489e:	0f b6 4c 24 70       	movzbl 0x70(%rsp),%ecx
  1248a3:	48 8d 51 eb          	lea    -0x15(%rcx),%rdx
  1248a7:	31 c0                	xor    %eax,%eax
  1248a9:	48 83 f9 16          	cmp    $0x16,%rcx
  1248ad:	48 0f 43 c2          	cmovae %rdx,%rax
  1248b1:	48 83 f8 01          	cmp    $0x1,%rax
  1248b5:	74 11                	je     1248c8 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xad8>
  1248b7:	48 85 c0             	test   %rax,%rax
  1248ba:	75 38                	jne    1248f4 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xb04>
  1248bc:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  1248c1:	e8 fa 37 00 00       	call   1280c0 <_ZN4core3ptr54drop_in_place$LT$hyperreal..real..arithmetic..Real$GT$17h99ff7b0d018f9f04E.llvm.1417747527575319877>
  1248c6:	eb 2c                	jmp    1248f4 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xb04>
  1248c8:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
  1248cd:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
  1248d4:	00 00 80 
  1248d7:	48 39 c6             	cmp    %rax,%rsi
  1248da:	74 18                	je     1248f4 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xb04>
  1248dc:	48 85 f6             	test   %rsi,%rsi
  1248df:	74 13                	je     1248f4 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xb04>
  1248e1:	48 8b bc 24 80 00 00 	mov    0x80(%rsp),%rdi
  1248e8:	00 
  1248e9:	ba 01 00 00 00       	mov    $0x1,%edx
  1248ee:	ff 15 94 c9 1b 00    	call   *0x1bc994(%rip)        # 2e1288 <_DYNAMIC+0x260>
  1248f4:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  1248f9:	48 85 f6             	test   %rsi,%rsi
  1248fc:	0f 84 b0 f5 ff ff    	je     123eb2 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xc2>
  124902:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  124907:	48 c1 e6 04          	shl    $0x4,%rsi
  12490b:	ba 08 00 00 00       	mov    $0x8,%edx
  124910:	ff 15 72 c9 1b 00    	call   *0x1bc972(%rip)        # 2e1288 <_DYNAMIC+0x260>
  124916:	e9 97 f5 ff ff       	jmp    123eb2 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xc2>
  12491b:	8b 94 24 a1 00 00 00 	mov    0xa1(%rsp),%edx
  124922:	8b b4 24 a4 00 00 00 	mov    0xa4(%rsp),%esi
  124929:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
  12492e:	89 77 04             	mov    %esi,0x4(%rdi)
  124931:	89 57 01             	mov    %edx,0x1(%rdi)
  124934:	e9 fa fe ff ff       	jmp    124833 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xa43>
  124939:	8b 8c 24 a1 00 00 00 	mov    0xa1(%rsp),%ecx
  124940:	8b 94 24 a4 00 00 00 	mov    0xa4(%rsp),%edx
  124947:	41 89 55 04          	mov    %edx,0x4(%r13)
  12494b:	41 89 4d 01          	mov    %ecx,0x1(%r13)
  12494f:	0f 10 84 24 a8 00 00 	movups 0xa8(%rsp),%xmm0
  124956:	00 
  124957:	41 88 45 00          	mov    %al,0x0(%r13)
  12495b:	41 0f 11 45 08       	movups %xmm0,0x8(%r13)
  124960:	e9 39 ff ff ff       	jmp    12489e <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaae>
  124965:	48 8d 3d e5 9d f7 ff 	lea    -0x8621b(%rip),%rdi        # 9e751 <_ZN4zmij11STATIC_DATA17h6667eed1abdb5cafE+0x4951>
  12496c:	48 8d 15 15 72 1b 00 	lea    0x1b7215(%rip),%rdx        # 2dbb88 <anon.ce4b9bae09123690ae0f3ac13af2d34a.4.llvm.14176270182660413066+0x4f0>
  124973:	be 85 00 00 00       	mov    $0x85,%esi
  124978:	ff 15 5a c9 1b 00    	call   *0x1bc95a(%rip)        # 2e12d8 <_DYNAMIC+0x2b0>
  12497e:	eb 56                	jmp    1249d6 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xbe6>
  124980:	bf 08 00 00 00       	mov    $0x8,%edi
  124985:	be 10 00 00 00       	mov    $0x10,%esi
  12498a:	ff 15 e8 c8 1b 00    	call   *0x1bc8e8(%rip)        # 2e1278 <_DYNAMIC+0x250>
  124990:	48 8d 3d a4 9d f7 ff 	lea    -0x8625c(%rip),%rdi        # 9e73b <_ZN4zmij11STATIC_DATA17h6667eed1abdb5cafE+0x493b>
  124997:	48 8d 15 a2 71 1b 00 	lea    0x1b71a2(%rip),%rdx        # 2dbb40 <anon.ce4b9bae09123690ae0f3ac13af2d34a.4.llvm.14176270182660413066+0x4a8>
  12499e:	be 16 00 00 00       	mov    $0x16,%esi
  1249a3:	ff 15 97 c9 1b 00    	call   *0x1bc997(%rip)        # 2e1340 <_DYNAMIC+0x318>
  1249a9:	eb 2b                	jmp    1249d6 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xbe6>
  1249ab:	48 8d 3d 89 9d f7 ff 	lea    -0x86277(%rip),%rdi        # 9e73b <_ZN4zmij11STATIC_DATA17h6667eed1abdb5cafE+0x493b>
  1249b2:	48 8d 15 b7 71 1b 00 	lea    0x1b71b7(%rip),%rdx        # 2dbb70 <anon.ce4b9bae09123690ae0f3ac13af2d34a.4.llvm.14176270182660413066+0x4d8>
  1249b9:	be 16 00 00 00       	mov    $0x16,%esi
  1249be:	ff 15 7c c9 1b 00    	call   *0x1bc97c(%rip)        # 2e1340 <_DYNAMIC+0x318>
  1249c4:	eb 10                	jmp    1249d6 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xbe6>
  1249c6:	48 8d 15 8b 71 1b 00 	lea    0x1b718b(%rip),%rdx        # 2dbb58 <anon.ce4b9bae09123690ae0f3ac13af2d34a.4.llvm.14176270182660413066+0x4c0>
  1249cd:	48 89 df             	mov    %rbx,%rdi
  1249d0:	ff 15 0a c9 1b 00    	call   *0x1bc90a(%rip)        # 2e12e0 <_DYNAMIC+0x2b8>
  1249d6:	0f 0b                	ud2
  1249d8:	eb 0b                	jmp    1249e5 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xbf5>
  1249da:	eb 04                	jmp    1249e0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xbf0>
  1249dc:	eb 07                	jmp    1249e5 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xbf5>
  1249de:	eb 05                	jmp    1249e5 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xbf5>
  1249e0:	48 89 c3             	mov    %rax,%rbx
  1249e3:	eb 0d                	jmp    1249f2 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xc02>
  1249e5:	48 89 c3             	mov    %rax,%rbx
  1249e8:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  1249ed:	e8 3e 3a 00 00       	call   128430 <_ZN4core3ptr67drop_in_place$LT$hypersolve..expression_program..ExpressionNode$GT$17h1c0d044e35a2047dE>
  1249f2:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  1249f7:	48 85 f6             	test   %rsi,%rsi
  1249fa:	74 14                	je     124a10 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xc20>
  1249fc:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  124a01:	48 c1 e6 04          	shl    $0x4,%rsi
  124a05:	ba 08 00 00 00       	mov    $0x8,%edx
  124a0a:	ff 15 78 c8 1b 00    	call   *0x1bc878(%rip)        # 2e1288 <_DYNAMIC+0x260>
  124a10:	48 89 df             	mov    %rbx,%rdi
  124a13:	e8 28 45 1b 00       	call   2d8f40 <_Unwind_Resume@plt>
  124a18:	ff 15 82 c8 1b 00    	call   *0x1bc882(%rip)        # 2e12a0 <_DYNAMIC+0x278>

Disassembly of section .init:

Disassembly of section .fini:

Disassembly of section .plt:
