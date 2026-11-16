
/mnt/development/.interval-refactor-build/taylor-scheduling-reconsideration/artifacts/candidate-probe:     file format elf64-x86-64


Disassembly of section .text:

0000000000123de0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E>:
  123de0:	55                   	push   %rbp
  123de1:	41 57                	push   %r15
  123de3:	41 56                	push   %r14
  123de5:	41 55                	push   %r13
  123de7:	41 54                	push   %r12
  123de9:	53                   	push   %rbx
  123dea:	48 81 ec 48 01 00 00 	sub    $0x148,%rsp
  123df1:	4c 89 8c 24 c8 00 00 	mov    %r9,0xc8(%rsp)
  123df8:	00 
  123df9:	89 cd                	mov    %ecx,%ebp
  123dfb:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  123e02:	00 
  123e03:	48 8b 48 10          	mov    0x10(%rax),%rcx
  123e07:	48 03 8c 24 88 01 00 	add    0x188(%rsp),%rcx
  123e0e:	00 
  123e0f:	0f 82 a5 00 00 00    	jb     123eba <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xda>
  123e15:	48 8b 46 48          	mov    0x48(%rsi),%rax
  123e19:	48 3b 08             	cmp    (%rax),%rcx
  123e1c:	0f 83 98 00 00 00    	jae    123eba <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xda>
  123e22:	48 8b 48 10          	mov    0x10(%rax),%rcx
  123e26:	48 85 c9             	test   %rcx,%rcx
  123e29:	74 14                	je     123e3f <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x5f>
  123e2b:	49 89 d1             	mov    %rdx,%r9
  123e2e:	0f b6 51 10          	movzbl 0x10(%rcx),%edx
  123e32:	b1 07                	mov    $0x7,%cl
  123e34:	84 d2                	test   %dl,%dl
  123e36:	4c 89 ca             	mov    %r9,%rdx
  123e39:	0f 85 f0 09 00 00    	jne    12482f <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xa4f>
  123e3f:	48 8b 48 08          	mov    0x8(%rax),%rcx
  123e43:	48 85 c9             	test   %rcx,%rcx
  123e46:	0f 84 e1 09 00 00    	je     12482d <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xa4d>
  123e4c:	48 89 74 24 08       	mov    %rsi,0x8(%rsp)
  123e51:	49 89 d6             	mov    %rdx,%r14
  123e54:	4c 89 c3             	mov    %r8,%rbx
  123e57:	48 89 3c 24          	mov    %rdi,(%rsp)
  123e5b:	48 ff c9             	dec    %rcx
  123e5e:	48 89 48 08          	mov    %rcx,0x8(%rax)
  123e62:	ff 15 48 d4 1b 00    	call   *0x1bd448(%rip)        # 2e12b0 <_DYNAMIC+0x240>
  123e68:	bf 10 00 00 00       	mov    $0x10,%edi
  123e6d:	be 08 00 00 00       	mov    $0x8,%esi
  123e72:	ff 15 40 d4 1b 00    	call   *0x1bd440(%rip)        # 2e12b8 <_DYNAMIC+0x248>
  123e78:	48 85 c0             	test   %rax,%rax
  123e7b:	0f 84 16 0b 00 00    	je     124997 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xbb7>
  123e81:	4c 89 b4 24 f8 00 00 	mov    %r14,0xf8(%rsp)
  123e88:	00 
  123e89:	4c 89 30             	mov    %r14,(%rax)
  123e8c:	c6 40 08 00          	movb   $0x0,0x8(%rax)
  123e90:	48 c7 44 24 10 01 00 	movq   $0x1,0x10(%rsp)
  123e97:	00 00 
  123e99:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  123e9e:	41 bf 01 00 00 00    	mov    $0x1,%r15d
  123ea4:	48 8d 05 dd 7c 1b 00 	lea    0x1b7cdd(%rip),%rax        # 2dbb88 <anon.ce4b9bae09123690ae0f3ac13af2d34a.4.llvm.14176270182660413066+0x4c0>
  123eab:	48 89 84 24 d0 00 00 	mov    %rax,0xd0(%rsp)
  123eb2:	00 
  123eb3:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
  123eb8:	eb 24                	jmp    123ede <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xfe>
  123eba:	c6 07 05             	movb   $0x5,(%rdi)
  123ebd:	48 81 c4 48 01 00 00 	add    $0x148,%rsp
  123ec4:	5b                   	pop    %rbx
  123ec5:	41 5c                	pop    %r12
  123ec7:	41 5d                	pop    %r13
  123ec9:	41 5e                	pop    %r14
  123ecb:	41 5f                	pop    %r15
  123ecd:	5d                   	pop    %rbp
  123ece:	c3                   	ret
  123ecf:	90                   	nop
  123ed0:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
  123ed5:	4d 85 ff             	test   %r15,%r15
  123ed8:	0f 84 b6 09 00 00    	je     124894 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xab4>
  123ede:	49 ff cf             	dec    %r15
  123ee1:	4c 89 7c 24 20       	mov    %r15,0x20(%rsp)
  123ee6:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  123eeb:	49 c1 e7 04          	shl    $0x4,%r15
  123eef:	4a 8b 1c 38          	mov    (%rax,%r15,1),%rbx
  123ef3:	42 0f b6 44 38 08    	movzbl 0x8(%rax,%r15,1),%eax
  123ef9:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  123efe:	48 8b 49 48          	mov    0x48(%rcx),%rcx
  123f02:	48 8b 51 10          	mov    0x10(%rcx),%rdx
  123f06:	48 85 d2             	test   %rdx,%rdx
  123f09:	74 0c                	je     123f17 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x137>
  123f0b:	0f b6 52 10          	movzbl 0x10(%rdx),%edx
  123f0f:	84 d2                	test   %dl,%dl
  123f11:	0f 85 b9 09 00 00    	jne    1248d0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaf0>
  123f17:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  123f1b:	48 85 d2             	test   %rdx,%rdx
  123f1e:	0f 84 6c 09 00 00    	je     124890 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xab0>
  123f24:	48 ff ca             	dec    %rdx
  123f27:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  123f2b:	48 8b 8c 24 80 01 00 	mov    0x180(%rsp),%rcx
  123f32:	00 
  123f33:	48 8b 09             	mov    (%rcx),%rcx
  123f36:	48 85 c9             	test   %rcx,%rcx
  123f39:	0f 84 91 00 00 00    	je     123fd0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x1f0>
  123f3f:	48 8b 94 24 80 01 00 	mov    0x180(%rsp),%rdx
  123f46:	00 
  123f47:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  123f4b:	0f b7 b9 12 01 00 00 	movzwl 0x112(%rcx),%edi
  123f52:	41 89 f8             	mov    %edi,%r8d
  123f55:	41 c1 e0 04          	shl    $0x4,%r8d
  123f59:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  123f60:	49 89 c9             	mov    %rcx,%r9
  123f63:	eb 24                	jmp    123f89 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x1a9>
  123f65:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  123f6c:	00 00 00 00 
  123f70:	41 0f 97 c2          	seta   %r10b
  123f74:	41 80 da 00          	sbb    $0x0,%r10b
  123f78:	49 83 c1 10          	add    $0x10,%r9
  123f7c:	48 ff c6             	inc    %rsi
  123f7f:	49 83 c0 f0          	add    $0xfffffffffffffff0,%r8
  123f83:	41 80 fa 01          	cmp    $0x1,%r10b
  123f87:	75 17                	jne    123fa0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x1c0>
  123f89:	4d 85 c0             	test   %r8,%r8
  123f8c:	74 22                	je     123fb0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x1d0>
  123f8e:	49 3b 19             	cmp    (%r9),%rbx
  123f91:	75 dd                	jne    123f70 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x190>
  123f93:	41 3b 69 08          	cmp    0x8(%r9),%ebp
  123f97:	eb d7                	jmp    123f70 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x190>
  123f99:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  123fa0:	41 0f b6 fa          	movzbl %r10b,%edi
  123fa4:	85 ff                	test   %edi,%edi
  123fa6:	0f 84 24 ff ff ff    	je     123ed0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xf0>
  123fac:	eb 05                	jmp    123fb3 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x1d3>
  123fae:	66 90                	xchg   %ax,%ax
  123fb0:	48 89 fe             	mov    %rdi,%rsi
  123fb3:	48 83 ea 01          	sub    $0x1,%rdx
  123fb7:	72 17                	jb     123fd0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x1f0>
  123fb9:	48 8b 8c f1 18 01 00 	mov    0x118(%rcx,%rsi,8),%rcx
  123fc0:	00 
  123fc1:	eb 88                	jmp    123f4b <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x16b>
  123fc3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  123fca:	84 00 00 00 00 00 
  123fd0:	84 c0                	test   %al,%al
  123fd2:	74 6e                	je     124042 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x262>
  123fd4:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  123fd9:	48 8b 70 28          	mov    0x28(%rax),%rsi
  123fdd:	48 39 f3             	cmp    %rsi,%rbx
  123fe0:	0f 83 f7 09 00 00    	jae    1249dd <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xbfd>
  123fe6:	48 8b 40 20          	mov    0x20(%rax),%rax
  123fea:	48 8d 0c 5b          	lea    (%rbx,%rbx,2),%rcx
  123fee:	48 c1 e1 04          	shl    $0x4,%rcx
  123ff2:	48 8d 34 08          	lea    (%rax,%rcx,1),%rsi
  123ff6:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
  123ffa:	48 8d 48 eb          	lea    -0x15(%rax),%rcx
  123ffe:	48 83 f8 16          	cmp    $0x16,%rax
  124002:	b8 00 00 00 00       	mov    $0x0,%eax
  124007:	48 0f 42 c8          	cmovb  %rax,%rcx
  12400b:	48 8d 15 92 a4 f7 ff 	lea    -0x85b6e(%rip),%rdx        # 9e4a4 <_ZN4zmij11STATIC_DATA17h6667eed1abdb5cafE+0x46a4>
  124012:	48 63 04 8a          	movslq (%rdx,%rcx,4),%rax
  124016:	48 01 d0             	add    %rdx,%rax
  124019:	ff e0                	jmp    *%rax
  12401b:	48 8d bc 24 98 00 00 	lea    0x98(%rsp),%rdi
  124022:	00 
  124023:	e8 c8 60 00 00       	call   12a0f0 <_ZN72_$LT$hyperreal..real..arithmetic..Real$u20$as$u20$core..clone..Clone$GT$5clone17hf71a33f673886a59E.llvm.14451347000310516113>
  124028:	0f b6 84 24 98 00 00 	movzbl 0x98(%rsp),%eax
  12402f:	00 
  124030:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  124035:	3c 16                	cmp    $0x16,%al
  124037:	0f 83 67 02 00 00    	jae    1242a4 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x4c4>
  12403d:	e9 f5 05 00 00       	jmp    124637 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x857>
  124042:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  124047:	48 8b 70 28          	mov    0x28(%rax),%rsi
  12404b:	48 39 f3             	cmp    %rsi,%rbx
  12404e:	0f 83 98 09 00 00    	jae    1249ec <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xc0c>
  124054:	48 8b 40 20          	mov    0x20(%rax),%rax
  124058:	48 8d 0c 5b          	lea    (%rbx,%rbx,2),%rcx
  12405c:	48 c1 e1 04          	shl    $0x4,%rcx
  124060:	0f b6 34 08          	movzbl (%rax,%rcx,1),%esi
  124064:	48 8d 56 eb          	lea    -0x15(%rsi),%rdx
  124068:	48 83 fe 16          	cmp    $0x16,%rsi
  12406c:	be 00 00 00 00       	mov    $0x0,%esi
  124071:	48 0f 42 d6          	cmovb  %rsi,%rdx
  124075:	48 83 fa 02          	cmp    $0x2,%rdx
  124079:	73 0b                	jae    124086 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x2a6>
  12407b:	45 31 f6             	xor    %r14d,%r14d
  12407e:	45 31 e4             	xor    %r12d,%r12d
  124081:	e9 84 00 00 00       	jmp    12410a <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x32a>
  124086:	48 01 c8             	add    %rcx,%rax
  124089:	83 fa 02             	cmp    $0x2,%edx
  12408c:	75 58                	jne    1240e6 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x306>
  12408e:	48 8b 40 18          	mov    0x18(%rax),%rax
  124092:	48 89 84 24 d8 00 00 	mov    %rax,0xd8(%rsp)
  124099:	00 
  12409a:	41 be 01 00 00 00    	mov    $0x1,%r14d
  1240a0:	45 31 e4             	xor    %r12d,%r12d
  1240a3:	eb 65                	jmp    12410a <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x32a>
  1240a5:	48 8b 46 18          	mov    0x18(%rsi),%rax
  1240a9:	f3 0f 6f 46 08       	movdqu 0x8(%rsi),%xmm0
  1240ae:	f3 0f 7f 84 24 a0 00 	movdqu %xmm0,0xa0(%rsp)
  1240b5:	00 00 
  1240b7:	48 89 84 24 b0 00 00 	mov    %rax,0xb0(%rsp)
  1240be:	00 
  1240bf:	b0 17                	mov    $0x17,%al
  1240c1:	e9 d7 01 00 00       	jmp    12429d <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x4bd>
  1240c6:	0f b6 46 18          	movzbl 0x18(%rsi),%eax
  1240ca:	88 84 24 b0 00 00 00 	mov    %al,0xb0(%rsp)
  1240d1:	f3 0f 6f 46 08       	movdqu 0x8(%rsi),%xmm0
  1240d6:	f3 0f 7f 84 24 a0 00 	movdqu %xmm0,0xa0(%rsp)
  1240dd:	00 00 
  1240df:	b0 18                	mov    $0x18,%al
  1240e1:	e9 b7 01 00 00       	jmp    12429d <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x4bd>
  1240e6:	48 8b 48 08          	mov    0x8(%rax),%rcx
  1240ea:	48 89 8c 24 d8 00 00 	mov    %rcx,0xd8(%rsp)
  1240f1:	00 
  1240f2:	48 8b 40 10          	mov    0x10(%rax),%rax
  1240f6:	48 89 84 24 f0 00 00 	mov    %rax,0xf0(%rsp)
  1240fd:	00 
  1240fe:	41 be 01 00 00 00    	mov    $0x1,%r14d
  124104:	41 bc 01 00 00 00    	mov    $0x1,%r12d
  12410a:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  124111:	00 
  124112:	48 8b 70 10          	mov    0x10(%rax),%rsi
  124116:	b0 05                	mov    $0x5,%al
  124118:	48 03 b4 24 88 01 00 	add    0x188(%rsp),%rsi
  12411f:	00 
  124120:	0f 82 ac 07 00 00    	jb     1248d2 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaf2>
  124126:	48 03 74 24 20       	add    0x20(%rsp),%rsi
  12412b:	0f 82 a1 07 00 00    	jb     1248d2 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaf2>
  124131:	4b 8d 0c 34          	lea    (%r12,%r14,1),%rcx
  124135:	48 ff c1             	inc    %rcx
  124138:	48 01 ce             	add    %rcx,%rsi
  12413b:	0f 82 91 07 00 00    	jb     1248d2 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaf2>
  124141:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
  124146:	48 8b 52 48          	mov    0x48(%rdx),%rdx
  12414a:	48 3b 32             	cmp    (%rdx),%rsi
  12414d:	0f 87 7f 07 00 00    	ja     1248d2 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaf2>
  124153:	48 8b 42 10          	mov    0x10(%rdx),%rax
  124157:	48 85 c0             	test   %rax,%rax
  12415a:	74 0c                	je     124168 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x388>
  12415c:	0f b6 40 10          	movzbl 0x10(%rax),%eax
  124160:	84 c0                	test   %al,%al
  124162:	0f 85 68 07 00 00    	jne    1248d0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaf0>
  124168:	4b 8d 34 34          	lea    (%r12,%r14,1),%rsi
  12416c:	48 8b 42 08          	mov    0x8(%rdx),%rax
  124170:	48 39 c6             	cmp    %rax,%rsi
  124173:	0f 83 17 07 00 00    	jae    124890 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xab0>
  124179:	48 29 c8             	sub    %rcx,%rax
  12417c:	48 89 42 08          	mov    %rax,0x8(%rdx)
  124180:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  124185:	4c 3b 6c 24 10       	cmp    0x10(%rsp),%r13
  12418a:	75 0b                	jne    124197 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x3b7>
  12418c:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  124191:	ff 15 09 d6 1b 00    	call   *0x1bd609(%rip)        # 2e17a0 <_DYNAMIC+0x730>
  124197:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  12419c:	4c 89 e9             	mov    %r13,%rcx
  12419f:	48 c1 e1 04          	shl    $0x4,%rcx
  1241a3:	48 89 1c 08          	mov    %rbx,(%rax,%rcx,1)
  1241a7:	c6 44 08 08 01       	movb   $0x1,0x8(%rax,%rcx,1)
  1241ac:	4d 8d 7d 01          	lea    0x1(%r13),%r15
  1241b0:	4c 89 7c 24 20       	mov    %r15,0x20(%rsp)
  1241b5:	4d 85 e4             	test   %r12,%r12
  1241b8:	74 39                	je     1241f3 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x413>
  1241ba:	4c 3b 7c 24 10       	cmp    0x10(%rsp),%r15
  1241bf:	75 0b                	jne    1241cc <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x3ec>
  1241c1:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  1241c6:	ff 15 d4 d5 1b 00    	call   *0x1bd5d4(%rip)        # 2e17a0 <_DYNAMIC+0x730>
  1241cc:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  1241d1:	49 c1 e7 04          	shl    $0x4,%r15
  1241d5:	48 8b 8c 24 f0 00 00 	mov    0xf0(%rsp),%rcx
  1241dc:	00 
  1241dd:	4a 89 0c 38          	mov    %rcx,(%rax,%r15,1)
  1241e1:	42 c6 44 38 08 00    	movb   $0x0,0x8(%rax,%r15,1)
  1241e7:	49 83 c5 02          	add    $0x2,%r13
  1241eb:	4c 89 6c 24 20       	mov    %r13,0x20(%rsp)
  1241f0:	4d 89 ef             	mov    %r13,%r15
  1241f3:	4d 85 f6             	test   %r14,%r14
  1241f6:	0f 84 d4 fc ff ff    	je     123ed0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xf0>
  1241fc:	4c 3b 7c 24 10       	cmp    0x10(%rsp),%r15
  124201:	75 0b                	jne    12420e <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x42e>
  124203:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  124208:	ff 15 92 d5 1b 00    	call   *0x1bd592(%rip)        # 2e17a0 <_DYNAMIC+0x730>
  12420e:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  124213:	4c 89 f9             	mov    %r15,%rcx
  124216:	48 c1 e1 04          	shl    $0x4,%rcx
  12421a:	48 8b 94 24 d8 00 00 	mov    0xd8(%rsp),%rdx
  124221:	00 
  124222:	48 89 14 08          	mov    %rdx,(%rax,%rcx,1)
  124226:	c6 44 08 08 00       	movb   $0x0,0x8(%rax,%rcx,1)
  12422b:	49 ff c7             	inc    %r15
  12422e:	4c 89 7c 24 20       	mov    %r15,0x20(%rsp)
  124233:	4d 85 ff             	test   %r15,%r15
  124236:	0f 85 a2 fc ff ff    	jne    123ede <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xfe>
  12423c:	e9 53 06 00 00       	jmp    124894 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xab4>
  124241:	44 8b 76 20          	mov    0x20(%rsi),%r14d
  124245:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
  12424c:	00 00 80 
  12424f:	48 89 c8             	mov    %rcx,%rax
  124252:	48 39 4e 08          	cmp    %rcx,0x8(%rsi)
  124256:	74 21                	je     124279 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x499>
  124258:	48 83 c6 08          	add    $0x8,%rsi
  12425c:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  124261:	ff 15 99 d0 1b 00    	call   *0x1bd099(%rip)        # 2e1300 <_DYNAMIC+0x290>
  124267:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  12426c:	48 8d 4c 24 38       	lea    0x38(%rsp),%rcx
  124271:	0f 10 01             	movups (%rcx),%xmm0
  124274:	0f 29 44 24 60       	movaps %xmm0,0x60(%rsp)
  124279:	48 89 84 24 a0 00 00 	mov    %rax,0xa0(%rsp)
  124280:	00 
  124281:	66 0f 6f 44 24 60    	movdqa 0x60(%rsp),%xmm0
  124287:	48 8d 84 24 a8 00 00 	lea    0xa8(%rsp),%rax
  12428e:	00 
  12428f:	f3 0f 7f 00          	movdqu %xmm0,(%rax)
  124293:	44 89 b4 24 b8 00 00 	mov    %r14d,0xb8(%rsp)
  12429a:	00 
  12429b:	b0 16                	mov    $0x16,%al
  12429d:	88 84 24 98 00 00 00 	mov    %al,0x98(%rsp)
  1242a4:	3c 18                	cmp    $0x18,%al
  1242a6:	74 22                	je     1242ca <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x4ea>
  1242a8:	0f b6 c0             	movzbl %al,%eax
  1242ab:	83 f8 17             	cmp    $0x17,%eax
  1242ae:	0f 85 6e 03 00 00    	jne    124622 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x842>
  1242b4:	f3 0f 6f 84 24 b0 00 	movdqu 0xb0(%rsp),%xmm0
  1242bb:	00 00 
  1242bd:	66 0f 70 c0 44       	pshufd $0x44,%xmm0,%xmm0
  1242c2:	41 be 01 00 00 00    	mov    $0x1,%r14d
  1242c8:	eb 0f                	jmp    1242d9 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x4f9>
  1242ca:	41 be 02 00 00 00    	mov    $0x2,%r14d
  1242d0:	f3 0f 6f 84 24 a0 00 	movdqu 0xa0(%rsp),%xmm0
  1242d7:	00 00 
  1242d9:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  1242e0:	00 
  1242e1:	66 0f 7f 84 24 00 01 	movdqa %xmm0,0x100(%rsp)
  1242e8:	00 00 
  1242ea:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
  1242ef:	48 89 8c 24 e0 00 00 	mov    %rcx,0xe0(%rsp)
  1242f6:	00 
  1242f7:	48 89 8c 24 e8 00 00 	mov    %rcx,0xe8(%rsp)
  1242fe:	00 
  1242ff:	45 31 ff             	xor    %r15d,%r15d
  124302:	eb 1f                	jmp    124323 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x543>
  124304:	4c 89 e0             	mov    %r12,%rax
  124307:	4a 89 84 fc e0 00 00 	mov    %rax,0xe0(%rsp,%r15,8)
  12430e:	00 
  12430f:	4d 89 ef             	mov    %r13,%r15
  124312:	4d 39 f5             	cmp    %r14,%r13
  124315:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  12431c:	00 
  12431d:	0f 84 be 02 00 00    	je     1245e1 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x801>
  124323:	48 8b 00             	mov    (%rax),%rax
  124326:	48 85 c0             	test   %rax,%rax
  124329:	0f 84 93 06 00 00    	je     1249c2 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xbe2>
  12432f:	4d 8d 6f 01          	lea    0x1(%r15),%r13
  124333:	4a 8b 8c fc 00 01 00 	mov    0x100(%rsp,%r15,8),%rcx
  12433a:	00 
  12433b:	48 8b 94 24 80 01 00 	mov    0x180(%rsp),%rdx
  124342:	00 
  124343:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  124347:	0f b7 b8 12 01 00 00 	movzwl 0x112(%rax),%edi
  12434e:	41 89 f8             	mov    %edi,%r8d
  124351:	41 c1 e0 04          	shl    $0x4,%r8d
  124355:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  12435c:	49 89 c1             	mov    %rax,%r9
  12435f:	eb 28                	jmp    124389 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x5a9>
  124361:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  124368:	0f 1f 84 00 00 00 00 
  12436f:	00 
  124370:	41 0f 97 c2          	seta   %r10b
  124374:	41 80 da 00          	sbb    $0x0,%r10b
  124378:	49 83 c1 10          	add    $0x10,%r9
  12437c:	48 ff c6             	inc    %rsi
  12437f:	49 83 c0 f0          	add    $0xfffffffffffffff0,%r8
  124383:	41 80 fa 01          	cmp    $0x1,%r10b
  124387:	75 17                	jne    1243a0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x5c0>
  124389:	4d 85 c0             	test   %r8,%r8
  12438c:	74 22                	je     1243b0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x5d0>
  12438e:	49 3b 09             	cmp    (%r9),%rcx
  124391:	75 dd                	jne    124370 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x590>
  124393:	41 3b 69 08          	cmp    0x8(%r9),%ebp
  124397:	eb d7                	jmp    124370 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x590>
  124399:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  1243a0:	41 0f b6 fa          	movzbl %r10b,%edi
  1243a4:	85 ff                	test   %edi,%edi
  1243a6:	75 0b                	jne    1243b3 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x5d3>
  1243a8:	eb 26                	jmp    1243d0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x5f0>
  1243aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  1243b0:	48 89 fe             	mov    %rdi,%rsi
  1243b3:	48 83 ea 01          	sub    $0x1,%rdx
  1243b7:	0f 82 05 06 00 00    	jb     1249c2 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xbe2>
  1243bd:	48 8b 84 f0 18 01 00 	mov    0x118(%rax,%rsi,8),%rax
  1243c4:	00 
  1243c5:	eb 80                	jmp    124347 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x567>
  1243c7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  1243ce:	00 00 
  1243d0:	4c 8b a4 f0 b8 00 00 	mov    0xb8(%rax,%rsi,8),%r12
  1243d7:	00 
  1243d8:	4c 3b 64 24 28       	cmp    0x28(%rsp),%r12
  1243dd:	0f 84 2c ff ff ff    	je     12430f <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x52f>
  1243e3:	0f b6 8c 24 98 00 00 	movzbl 0x98(%rsp),%ecx
  1243ea:	00 
  1243eb:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  1243ef:	48 83 f9 16          	cmp    $0x16,%rcx
  1243f3:	b9 00 00 00 00       	mov    $0x0,%ecx
  1243f8:	48 0f 42 c1          	cmovb  %rcx,%rax
  1243fc:	48 83 f8 02          	cmp    $0x2,%rax
  124400:	74 6e                	je     124470 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x690>
  124402:	83 f8 03             	cmp    $0x3,%eax
  124405:	0f 85 71 05 00 00    	jne    12497c <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xb9c>
  12440b:	0f b6 84 24 b0 00 00 	movzbl 0xb0(%rsp),%eax
  124412:	00 
  124413:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
  12441a:	00 00 80 
  12441d:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
  124422:	c7 84 24 80 00 00 00 	movl   $0x0,0x80(%rsp)
  124429:	00 00 00 00 
  12442d:	c6 44 24 60 16       	movb   $0x16,0x60(%rsp)
  124432:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
  124437:	c7 44 24 50 01 00 00 	movl   $0x1,0x50(%rsp)
  12443e:	00 
  12443f:	c6 44 24 30 16       	movb   $0x16,0x30(%rsp)
  124444:	48 8d 0d 69 a0 f7 ff 	lea    -0x85f97(%rip),%rcx        # 9e4b4 <_ZN4zmij11STATIC_DATA17h6667eed1abdb5cafE+0x46b4>
  12444b:	48 63 04 81          	movslq (%rcx,%rax,4),%rax
  12444f:	48 01 c8             	add    %rcx,%rax
  124452:	ff e0                	jmp    *%rax
  124454:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  12445b:	00 
  12445c:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
  124461:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  124466:	ff 15 c4 d3 1b 00    	call   *0x1bd3c4(%rip)        # 2e1830 <_DYNAMIC+0x7c0>
  12446c:	eb 40                	jmp    1244ae <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x6ce>
  12446e:	66 90                	xchg   %ax,%ax
  124470:	48 8b b4 24 a0 00 00 	mov    0xa0(%rsp),%rsi
  124477:	00 
  124478:	48 8b 94 24 a8 00 00 	mov    0xa8(%rsp),%rdx
  12447f:	00 
  124480:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
  124487:	00 00 80 
  12448a:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  12448f:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%rsp)
  124496:	00 
  124497:	c6 44 24 30 16       	movb   $0x16,0x30(%rsp)
  12449c:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  1244a3:	00 
  1244a4:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
  1244a9:	e8 a2 05 00 00       	call   124a50 <_ZN10hypersolve18expression_program8jacobian5unary17h3c4f7f36b09b4295E>
  1244ae:	f3 0f 6f 84 24 18 01 	movdqu 0x118(%rsp),%xmm0
  1244b5:	00 00 
  1244b7:	0f 10 8c 24 28 01 00 	movups 0x128(%rsp),%xmm1
  1244be:	00 
  1244bf:	0f 10 94 24 38 01 00 	movups 0x138(%rsp),%xmm2
  1244c6:	00 
  1244c7:	0f 29 54 24 50       	movaps %xmm2,0x50(%rsp)
  1244cc:	0f 29 4c 24 40       	movaps %xmm1,0x40(%rsp)
  1244d1:	66 0f 7f 44 24 30    	movdqa %xmm0,0x30(%rsp)
  1244d7:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  1244dc:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  1244e1:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  1244e6:	44 89 f9             	mov    %r15d,%ecx
  1244e9:	4c 8d 84 24 00 01 00 	lea    0x100(%rsp),%r8
  1244f0:	00 
  1244f1:	4d 89 f1             	mov    %r14,%r9
  1244f4:	ff b4 24 c8 00 00 00 	push   0xc8(%rsp)
  1244fb:	ff 74 24 30          	push   0x30(%rsp)
  1244ff:	e8 dc 1e 00 00       	call   1263e0 <_ZN10hypersolve18expression_program8jacobian7Builder7partial17h36b060fd2b4c92c8E>
  124504:	48 83 c4 10          	add    $0x10,%rsp
  124508:	0f b6 4c 24 60       	movzbl 0x60(%rsp),%ecx
  12450d:	80 f9 0d             	cmp    $0xd,%cl
  124510:	0f 85 20 03 00 00    	jne    124836 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xa56>
  124516:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
  12451b:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  124520:	48 89 d0             	mov    %rdx,%rax
  124523:	48 39 d1             	cmp    %rdx,%rcx
  124526:	0f 84 db fd ff ff    	je     124307 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x527>
  12452c:	48 8b 84 24 c8 00 00 	mov    0xc8(%rsp),%rax
  124533:	00 
  124534:	48 39 c1             	cmp    %rax,%rcx
  124537:	0f 84 c7 fd ff ff    	je     124304 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x524>
  12453d:	49 39 c4             	cmp    %rax,%r12
  124540:	75 5f                	jne    1245a1 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x7c1>
  124542:	48 89 c8             	mov    %rcx,%rax
  124545:	e9 bd fd ff ff       	jmp    124307 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x527>
  12454a:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  124551:	00 
  124552:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
  124557:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  12455c:	ff 15 76 cf 1b 00    	call   *0x1bcf76(%rip)        # 2e14d8 <_DYNAMIC+0x468>
  124562:	e9 47 ff ff ff       	jmp    1244ae <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x6ce>
  124567:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  12456e:	00 
  12456f:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
  124574:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  124579:	ff 15 b9 d2 1b 00    	call   *0x1bd2b9(%rip)        # 2e1838 <_DYNAMIC+0x7c8>
  12457f:	e9 2a ff ff ff       	jmp    1244ae <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x6ce>
  124584:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  12458b:	00 
  12458c:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
  124591:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  124596:	ff 15 a4 d2 1b 00    	call   *0x1bd2a4(%rip)        # 2e1840 <_DYNAMIC+0x7d0>
  12459c:	e9 0d ff ff ff       	jmp    1244ae <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x6ce>
  1245a1:	c6 44 24 48 02       	movb   $0x2,0x48(%rsp)
  1245a6:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
  1245ab:	4c 89 64 24 40       	mov    %r12,0x40(%rsp)
  1245b0:	c6 44 24 30 18       	movb   $0x18,0x30(%rsp)
  1245b5:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  1245ba:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  1245bf:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  1245c4:	e8 67 1c 00 00       	call   126230 <_ZN10hypersolve18expression_program8jacobian7Builder4push17hca6f100d034aece7E>
  1245c9:	0f b6 4c 24 60       	movzbl 0x60(%rsp),%ecx
  1245ce:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  1245d3:	80 f9 0d             	cmp    $0xd,%cl
  1245d6:	0f 84 2b fd ff ff    	je     124307 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x527>
  1245dc:	e9 4f 03 00 00       	jmp    124930 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xb50>
  1245e1:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
  1245e8:	00 
  1245e9:	48 8b 94 24 e8 00 00 	mov    0xe8(%rsp),%rdx
  1245f0:	00 
  1245f1:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
  1245f6:	48 39 c8             	cmp    %rcx,%rax
  1245f9:	74 3c                	je     124637 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x857>
  1245fb:	48 39 ca             	cmp    %rcx,%rdx
  1245fe:	0f 85 cc 01 00 00    	jne    1247d0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x9f0>
  124604:	48 89 c2             	mov    %rax,%rdx
  124607:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  12460e:	00 
  12460f:	48 8b 40 10          	mov    0x10(%rax),%rax
  124613:	48 03 84 24 88 01 00 	add    0x188(%rsp),%rax
  12461a:	00 
  12461b:	73 34                	jae    124651 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x871>
  12461d:	e9 02 02 00 00       	jmp    124824 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xa44>
  124622:	39 ac 24 b8 00 00 00 	cmp    %ebp,0xb8(%rsp)
  124629:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  12462e:	48 0f 44 94 24 c8 00 	cmove  0xc8(%rsp),%rdx
  124635:	00 00 
  124637:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  12463e:	00 
  12463f:	48 8b 40 10          	mov    0x10(%rax),%rax
  124643:	48 03 84 24 88 01 00 	add    0x188(%rsp),%rax
  12464a:	00 
  12464b:	0f 82 d3 01 00 00    	jb     124824 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xa44>
  124651:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
  124656:	48 01 c1             	add    %rax,%rcx
  124659:	48 39 c1             	cmp    %rax,%rcx
  12465c:	0f 82 c2 01 00 00    	jb     124824 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xa44>
  124662:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  124667:	48 8b 40 48          	mov    0x48(%rax),%rax
  12466b:	48 3b 08             	cmp    (%rax),%rcx
  12466e:	0f 83 b0 01 00 00    	jae    124824 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xa44>
  124674:	48 8b 48 10          	mov    0x10(%rax),%rcx
  124678:	48 85 c9             	test   %rcx,%rcx
  12467b:	74 0c                	je     124689 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x8a9>
  12467d:	0f b6 49 10          	movzbl 0x10(%rcx),%ecx
  124681:	84 c9                	test   %cl,%cl
  124683:	0f 85 c2 02 00 00    	jne    12494b <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xb6b>
  124689:	48 8b 48 08          	mov    0x8(%rax),%rcx
  12468d:	48 85 c9             	test   %rcx,%rcx
  124690:	0f 84 b1 02 00 00    	je     124947 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xb67>
  124696:	48 ff c9             	dec    %rcx
  124699:	48 89 48 08          	mov    %rcx,0x8(%rax)
  12469d:	48 8b 8c 24 80 01 00 	mov    0x180(%rsp),%rcx
  1246a4:	00 
  1246a5:	48 8b 01             	mov    (%rcx),%rax
  1246a8:	48 85 c0             	test   %rax,%rax
  1246ab:	74 73                	je     124720 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x940>
  1246ad:	48 8b 71 08          	mov    0x8(%rcx),%rsi
  1246b1:	0f b7 b8 12 01 00 00 	movzwl 0x112(%rax),%edi
  1246b8:	41 89 f8             	mov    %edi,%r8d
  1246bb:	41 c1 e0 04          	shl    $0x4,%r8d
  1246bf:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  1246c6:	49 89 c1             	mov    %rax,%r9
  1246c9:	eb 1e                	jmp    1246e9 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x909>
  1246cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  1246d0:	41 0f 97 c2          	seta   %r10b
  1246d4:	41 80 da 00          	sbb    $0x0,%r10b
  1246d8:	49 83 c1 10          	add    $0x10,%r9
  1246dc:	48 ff c1             	inc    %rcx
  1246df:	49 83 c0 f0          	add    $0xfffffffffffffff0,%r8
  1246e3:	41 80 fa 01          	cmp    $0x1,%r10b
  1246e7:	75 10                	jne    1246f9 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x919>
  1246e9:	4d 85 c0             	test   %r8,%r8
  1246ec:	74 15                	je     124703 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x923>
  1246ee:	49 3b 19             	cmp    (%r9),%rbx
  1246f1:	75 dd                	jne    1246d0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x8f0>
  1246f3:	41 3b 69 08          	cmp    0x8(%r9),%ebp
  1246f7:	eb d7                	jmp    1246d0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x8f0>
  1246f9:	41 0f b6 fa          	movzbl %r10b,%edi
  1246fd:	85 ff                	test   %edi,%edi
  1246ff:	75 05                	jne    124706 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x926>
  124701:	eb 13                	jmp    124716 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x936>
  124703:	48 89 f9             	mov    %rdi,%rcx
  124706:	48 83 ee 01          	sub    $0x1,%rsi
  12470a:	72 16                	jb     124722 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x942>
  12470c:	48 8b 84 c8 18 01 00 	mov    0x118(%rax,%rcx,8),%rax
  124713:	00 
  124714:	eb 9b                	jmp    1246b1 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x8d1>
  124716:	48 89 94 c8 b8 00 00 	mov    %rdx,0xb8(%rax,%rcx,8)
  12471d:	00 
  12471e:	eb 3a                	jmp    12475a <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x97a>
  124720:	31 c0                	xor    %eax,%eax
  124722:	48 8b b4 24 80 01 00 	mov    0x180(%rsp),%rsi
  124729:	00 
  12472a:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
  12472f:	48 89 5c 24 38       	mov    %rbx,0x38(%rsp)
  124734:	89 6c 24 40          	mov    %ebp,0x40(%rsp)
  124738:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
  12473d:	48 c7 44 24 50 00 00 	movq   $0x0,0x50(%rsp)
  124744:	00 00 
  124746:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
  12474b:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  124750:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  124755:	e8 56 93 00 00       	call   12dab0 <_ZN5alloc11collections5btree3map5entry28VacantEntry$LT$K$C$V$C$A$GT$12insert_entry17h9eb989a970915e3dE>
  12475a:	0f b6 8c 24 98 00 00 	movzbl 0x98(%rsp),%ecx
  124761:	00 
  124762:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  124766:	48 83 f9 16          	cmp    $0x16,%rcx
  12476a:	b9 00 00 00 00       	mov    $0x0,%ecx
  12476f:	48 0f 42 c1          	cmovb  %rcx,%rax
  124773:	48 83 f8 01          	cmp    $0x1,%rax
  124777:	74 1b                	je     124794 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x9b4>
  124779:	48 85 c0             	test   %rax,%rax
  12477c:	0f 85 4e f7 ff ff    	jne    123ed0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xf0>
  124782:	48 8d bc 24 98 00 00 	lea    0x98(%rsp),%rdi
  124789:	00 
  12478a:	e8 61 39 00 00       	call   1280f0 <_ZN4core3ptr54drop_in_place$LT$hyperreal..real..arithmetic..Real$GT$17h99ff7b0d018f9f04E.llvm.14451347000310516113>
  12478f:	e9 3c f7 ff ff       	jmp    123ed0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xf0>
  124794:	48 8b b4 24 a0 00 00 	mov    0xa0(%rsp),%rsi
  12479b:	00 
  12479c:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
  1247a3:	00 00 80 
  1247a6:	48 39 c6             	cmp    %rax,%rsi
  1247a9:	0f 84 21 f7 ff ff    	je     123ed0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xf0>
  1247af:	48 85 f6             	test   %rsi,%rsi
  1247b2:	0f 84 18 f7 ff ff    	je     123ed0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xf0>
  1247b8:	48 8b bc 24 a8 00 00 	mov    0xa8(%rsp),%rdi
  1247bf:	00 
  1247c0:	ba 01 00 00 00       	mov    $0x1,%edx
  1247c5:	ff 15 05 cb 1b 00    	call   *0x1bcb05(%rip)        # 2e12d0 <_DYNAMIC+0x260>
  1247cb:	e9 00 f7 ff ff       	jmp    123ed0 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xf0>
  1247d0:	c6 44 24 48 00       	movb   $0x0,0x48(%rsp)
  1247d5:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  1247da:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
  1247df:	c6 44 24 30 18       	movb   $0x18,0x30(%rsp)
  1247e4:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  1247e9:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  1247ee:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  1247f3:	e8 38 1a 00 00       	call   126230 <_ZN10hypersolve18expression_program8jacobian7Builder4push17hca6f100d034aece7E>
  1247f8:	0f b6 44 24 60       	movzbl 0x60(%rsp),%eax
  1247fd:	3c 0d                	cmp    $0xd,%al
  1247ff:	0f 85 53 01 00 00    	jne    124958 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xb78>
  124805:	48 8b 54 24 68       	mov    0x68(%rsp),%rdx
  12480a:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  124811:	00 
  124812:	48 8b 40 10          	mov    0x10(%rax),%rax
  124816:	48 03 84 24 88 01 00 	add    0x188(%rsp),%rax
  12481d:	00 
  12481e:	0f 83 2d fe ff ff    	jae    124651 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0x871>
  124824:	48 8b 04 24          	mov    (%rsp),%rax
  124828:	c6 00 05             	movb   $0x5,(%rax)
  12482b:	eb 2f                	jmp    12485c <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xa7c>
  12482d:	b1 06                	mov    $0x6,%cl
  12482f:	88 0f                	mov    %cl,(%rdi)
  124831:	e9 87 f6 ff ff       	jmp    123ebd <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xdd>
  124836:	8b 44 24 61          	mov    0x61(%rsp),%eax
  12483a:	8b 54 24 64          	mov    0x64(%rsp),%edx
  12483e:	48 8b 3c 24          	mov    (%rsp),%rdi
  124842:	89 57 04             	mov    %edx,0x4(%rdi)
  124845:	89 47 01             	mov    %eax,0x1(%rdi)
  124848:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  12484d:	48 8b 54 24 70       	mov    0x70(%rsp),%rdx
  124852:	88 0f                	mov    %cl,(%rdi)
  124854:	48 89 47 08          	mov    %rax,0x8(%rdi)
  124858:	48 89 57 10          	mov    %rdx,0x10(%rdi)
  12485c:	0f b6 8c 24 98 00 00 	movzbl 0x98(%rsp),%ecx
  124863:	00 
  124864:	48 8d 51 eb          	lea    -0x15(%rcx),%rdx
  124868:	31 c0                	xor    %eax,%eax
  12486a:	48 83 f9 16          	cmp    $0x16,%rcx
  12486e:	48 0f 43 c2          	cmovae %rdx,%rax
  124872:	48 83 f8 01          	cmp    $0x1,%rax
  124876:	0f 84 83 00 00 00    	je     1248ff <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xb1f>
  12487c:	48 85 c0             	test   %rax,%rax
  12487f:	75 57                	jne    1248d8 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaf8>
  124881:	48 8d bc 24 98 00 00 	lea    0x98(%rsp),%rdi
  124888:	00 
  124889:	e8 62 38 00 00       	call   1280f0 <_ZN4core3ptr54drop_in_place$LT$hyperreal..real..arithmetic..Real$GT$17h99ff7b0d018f9f04E.llvm.14451347000310516113>
  12488e:	eb 48                	jmp    1248d8 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaf8>
  124890:	b0 06                	mov    $0x6,%al
  124892:	eb 3e                	jmp    1248d2 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaf2>
  124894:	48 8b 84 24 f8 00 00 	mov    0xf8(%rsp),%rax
  12489b:	00 
  12489c:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  1248a1:	89 6c 24 38          	mov    %ebp,0x38(%rsp)
  1248a5:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  1248aa:	48 8b bc 24 80 01 00 	mov    0x180(%rsp),%rdi
  1248b1:	00 
  1248b2:	e8 39 a0 01 00       	call   13e8f0 <_ZN5alloc11collections5btree3map25BTreeMap$LT$K$C$V$C$A$GT$3get17h24a366a37cf3e78fE>
  1248b7:	48 8b 0c 24          	mov    (%rsp),%rcx
  1248bb:	48 85 c0             	test   %rax,%rax
  1248be:	0f 84 e3 00 00 00    	je     1249a7 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xbc7>
  1248c4:	48 8b 00             	mov    (%rax),%rax
  1248c7:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1248cb:	c6 01 0d             	movb   $0xd,(%rcx)
  1248ce:	eb 08                	jmp    1248d8 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaf8>
  1248d0:	b0 07                	mov    $0x7,%al
  1248d2:	48 8b 0c 24          	mov    (%rsp),%rcx
  1248d6:	88 01                	mov    %al,(%rcx)
  1248d8:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  1248dd:	48 85 f6             	test   %rsi,%rsi
  1248e0:	0f 84 d7 f5 ff ff    	je     123ebd <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xdd>
  1248e6:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  1248eb:	48 c1 e6 04          	shl    $0x4,%rsi
  1248ef:	ba 08 00 00 00       	mov    $0x8,%edx
  1248f4:	ff 15 d6 c9 1b 00    	call   *0x1bc9d6(%rip)        # 2e12d0 <_DYNAMIC+0x260>
  1248fa:	e9 be f5 ff ff       	jmp    123ebd <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xdd>
  1248ff:	48 8b b4 24 a0 00 00 	mov    0xa0(%rsp),%rsi
  124906:	00 
  124907:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
  12490e:	00 00 80 
  124911:	48 39 c6             	cmp    %rax,%rsi
  124914:	74 c2                	je     1248d8 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaf8>
  124916:	48 85 f6             	test   %rsi,%rsi
  124919:	74 bd                	je     1248d8 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaf8>
  12491b:	48 8b bc 24 a8 00 00 	mov    0xa8(%rsp),%rdi
  124922:	00 
  124923:	ba 01 00 00 00       	mov    $0x1,%edx
  124928:	ff 15 a2 c9 1b 00    	call   *0x1bc9a2(%rip)        # 2e12d0 <_DYNAMIC+0x260>
  12492e:	eb a8                	jmp    1248d8 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xaf8>
  124930:	8b 54 24 61          	mov    0x61(%rsp),%edx
  124934:	8b 74 24 64          	mov    0x64(%rsp),%esi
  124938:	48 8b 3c 24          	mov    (%rsp),%rdi
  12493c:	89 77 04             	mov    %esi,0x4(%rdi)
  12493f:	89 57 01             	mov    %edx,0x1(%rdi)
  124942:	e9 06 ff ff ff       	jmp    12484d <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xa6d>
  124947:	b0 06                	mov    $0x6,%al
  124949:	eb 02                	jmp    12494d <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xb6d>
  12494b:	b0 07                	mov    $0x7,%al
  12494d:	48 8b 0c 24          	mov    (%rsp),%rcx
  124951:	88 01                	mov    %al,(%rcx)
  124953:	e9 04 ff ff ff       	jmp    12485c <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xa7c>
  124958:	8b 4c 24 61          	mov    0x61(%rsp),%ecx
  12495c:	8b 54 24 64          	mov    0x64(%rsp),%edx
  124960:	48 8b 34 24          	mov    (%rsp),%rsi
  124964:	89 56 04             	mov    %edx,0x4(%rsi)
  124967:	89 4e 01             	mov    %ecx,0x1(%rsi)
  12496a:	f3 0f 6f 44 24 68    	movdqu 0x68(%rsp),%xmm0
  124970:	88 06                	mov    %al,(%rsi)
  124972:	f3 0f 7f 46 08       	movdqu %xmm0,0x8(%rsi)
  124977:	e9 e0 fe ff ff       	jmp    12485c <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xa7c>
  12497c:	48 8d 3d be 9d f7 ff 	lea    -0x86242(%rip),%rdi        # 9e741 <_ZN4zmij11STATIC_DATA17h6667eed1abdb5cafE+0x4941>
  124983:	48 8d 15 46 72 1b 00 	lea    0x1b7246(%rip),%rdx        # 2dbbd0 <anon.ce4b9bae09123690ae0f3ac13af2d34a.4.llvm.14176270182660413066+0x508>
  12498a:	be 85 00 00 00       	mov    $0x85,%esi
  12498f:	ff 15 8b c9 1b 00    	call   *0x1bc98b(%rip)        # 2e1320 <_DYNAMIC+0x2b0>
  124995:	eb 66                	jmp    1249fd <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xc1d>
  124997:	bf 08 00 00 00       	mov    $0x8,%edi
  12499c:	be 10 00 00 00       	mov    $0x10,%esi
  1249a1:	ff 15 19 c9 1b 00    	call   *0x1bc919(%rip)        # 2e12c0 <_DYNAMIC+0x250>
  1249a7:	48 8d 3d 7d 9d f7 ff 	lea    -0x86283(%rip),%rdi        # 9e72b <_ZN4zmij11STATIC_DATA17h6667eed1abdb5cafE+0x492b>
  1249ae:	48 8d 15 bb 71 1b 00 	lea    0x1b71bb(%rip),%rdx        # 2dbb70 <anon.ce4b9bae09123690ae0f3ac13af2d34a.4.llvm.14176270182660413066+0x4a8>
  1249b5:	be 16 00 00 00       	mov    $0x16,%esi
  1249ba:	ff 15 c8 c9 1b 00    	call   *0x1bc9c8(%rip)        # 2e1388 <_DYNAMIC+0x318>
  1249c0:	eb 3b                	jmp    1249fd <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xc1d>
  1249c2:	48 8d 3d 62 9d f7 ff 	lea    -0x8629e(%rip),%rdi        # 9e72b <_ZN4zmij11STATIC_DATA17h6667eed1abdb5cafE+0x492b>
  1249c9:	48 8d 15 e8 71 1b 00 	lea    0x1b71e8(%rip),%rdx        # 2dbbb8 <anon.ce4b9bae09123690ae0f3ac13af2d34a.4.llvm.14176270182660413066+0x4f0>
  1249d0:	be 16 00 00 00       	mov    $0x16,%esi
  1249d5:	ff 15 ad c9 1b 00    	call   *0x1bc9ad(%rip)        # 2e1388 <_DYNAMIC+0x318>
  1249db:	eb 20                	jmp    1249fd <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xc1d>
  1249dd:	48 8d 05 bc 71 1b 00 	lea    0x1b71bc(%rip),%rax        # 2dbba0 <anon.ce4b9bae09123690ae0f3ac13af2d34a.4.llvm.14176270182660413066+0x4d8>
  1249e4:	48 89 84 24 d0 00 00 	mov    %rax,0xd0(%rsp)
  1249eb:	00 
  1249ec:	48 89 df             	mov    %rbx,%rdi
  1249ef:	48 8b 94 24 d0 00 00 	mov    0xd0(%rsp),%rdx
  1249f6:	00 
  1249f7:	ff 15 2b c9 1b 00    	call   *0x1bc92b(%rip)        # 2e1328 <_DYNAMIC+0x2b8>
  1249fd:	0f 0b                	ud2
  1249ff:	eb 0b                	jmp    124a0c <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xc2c>
  124a01:	eb 04                	jmp    124a07 <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xc27>
  124a03:	eb 07                	jmp    124a0c <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xc2c>
  124a05:	eb 05                	jmp    124a0c <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xc2c>
  124a07:	48 89 c3             	mov    %rax,%rbx
  124a0a:	eb 10                	jmp    124a1c <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xc3c>
  124a0c:	48 89 c3             	mov    %rax,%rbx
  124a0f:	48 8d bc 24 98 00 00 	lea    0x98(%rsp),%rdi
  124a16:	00 
  124a17:	e8 44 3a 00 00       	call   128460 <_ZN4core3ptr67drop_in_place$LT$hypersolve..expression_program..ExpressionNode$GT$17h1c0d044e35a2047dE>
  124a1c:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  124a21:	48 85 f6             	test   %rsi,%rsi
  124a24:	74 14                	je     124a3a <_ZN10hypersolve18expression_program6taylor6derive17h439c0e46576c3a00E+0xc5a>
  124a26:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  124a2b:	48 c1 e6 04          	shl    $0x4,%rsi
  124a2f:	ba 08 00 00 00       	mov    $0x8,%edx
  124a34:	ff 15 96 c8 1b 00    	call   *0x1bc896(%rip)        # 2e12d0 <_DYNAMIC+0x260>
  124a3a:	48 89 df             	mov    %rbx,%rdi
  124a3d:	e8 2e 45 1b 00       	call   2d8f70 <_Unwind_Resume@plt>
  124a42:	ff 15 a0 c8 1b 00    	call   *0x1bc8a0(%rip)        # 2e12e8 <_DYNAMIC+0x278>

Disassembly of section .init:

Disassembly of section .fini:

Disassembly of section .plt:
