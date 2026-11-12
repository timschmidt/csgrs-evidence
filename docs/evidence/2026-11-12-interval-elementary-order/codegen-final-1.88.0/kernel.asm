hyperinterval::float::F64Enclosure::abs:
    8a50:	f6 06 01             	testb  $0x1,(%rsi)
    8a53:	74 2c                	je     8a81 <hyperinterval::float::F64Enclosure::abs+0x31>
    8a55:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
    8a59:	48 ba ff ff ff ff ff 	movabs $0x7fffffffffffffff,%rdx
    8a60:	ff ff 7f 
    8a63:	48 89 c8             	mov    %rcx,%rax
    8a66:	48 21 d0             	and    %rdx,%rax
    8a69:	4c 8d 04 10          	lea    (%rax,%rdx,1),%r8
    8a6d:	4c 85 c1             	test   %r8,%rcx
    8a70:	78 17                	js     8a89 <hyperinterval::float::F64Enclosure::abs+0x39>
    8a72:	48 8b 46 10          	mov    0x10(%rsi),%rax
    8a76:	48 89 47 10          	mov    %rax,0x10(%rdi)
    8a7a:	0f 10 06             	movups (%rsi),%xmm0
    8a7d:	0f 11 07             	movups %xmm0,(%rdi)
    8a80:	c3                   	ret
    8a81:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
    8a88:	c3                   	ret
    8a89:	48 8b 76 10          	mov    0x10(%rsi),%rsi
    8a8d:	49 89 f0             	mov    %rsi,%r8
    8a90:	49 21 d0             	and    %rdx,%r8
    8a93:	4d 8d 0c 10          	lea    (%r8,%rdx,1),%r9
    8a97:	4c 85 ce             	test   %r9,%rsi
    8a9a:	79 10                	jns    8aac <hyperinterval::float::F64Enclosure::abs+0x5c>
    8a9c:	48 c7 07 01 00 00 00 	movq   $0x1,(%rdi)
    8aa3:	4c 89 47 08          	mov    %r8,0x8(%rdi)
    8aa7:	48 89 47 10          	mov    %rax,0x10(%rdi)
    8aab:	c3                   	ret
    8aac:	49 f7 d8             	neg    %r8
    8aaf:	48 85 f6             	test   %rsi,%rsi
    8ab2:	4c 8d 4c 16 01       	lea    0x1(%rsi,%rdx,1),%r9
    8ab7:	4a 8d 54 02 01       	lea    0x1(%rdx,%r8,1),%rdx
    8abc:	49 0f 49 d1          	cmovns %r9,%rdx
    8ac0:	48 39 d1             	cmp    %rdx,%rcx
    8ac3:	48 0f 46 c6          	cmovbe %rsi,%rax
    8ac7:	48 c7 07 01 00 00 00 	movq   $0x1,(%rdi)
    8ace:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
    8ad5:	00 
    8ad6:	48 89 47 10          	mov    %rax,0x10(%rdi)
    8ada:	c3                   	ret
    8adb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

hyperinterval_strict_chain64:
    8b70:	53                   	push   %rbx
    8b71:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
    8b78:	48 89 fb             	mov    %rdi,%rbx
    8b7b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    8b80:	ff 15 8a 6a 05 00    	call   *0x56a8a(%rip)        # 5f610 <_GLOBAL_OFFSET_TABLE_+0x48>
    8b86:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    8b8b:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
    8b90:	48 83 f9 02          	cmp    $0x2,%rcx
    8b94:	0f 84 32 01 00 00    	je     8ccc <hyperinterval_strict_chain64+0x15c>
    8b9a:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
    8b9f:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
    8ba4:	48 89 b4 24 a8 00 00 	mov    %rsi,0xa8(%rsp)
    8bab:	00 
    8bac:	48 89 94 24 a1 00 00 	mov    %rdx,0xa1(%rsp)
    8bb3:	00 
    8bb4:	48 89 8c 24 98 00 00 	mov    %rcx,0x98(%rsp)
    8bbb:	00 
    8bbc:	88 84 24 a0 00 00 00 	mov    %al,0xa0(%rsp)
    8bc3:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
    8bc8:	48 8d b4 24 98 00 00 	lea    0x98(%rsp),%rsi
    8bcf:	00 
    8bd0:	f2 0f 10 05 28 44 04 	movsd  0x44428(%rip),%xmm0        # 4d000 <_fini+0x4e4>
    8bd7:	00 
    8bd8:	f2 0f 10 0d 28 44 04 	movsd  0x44428(%rip),%xmm1        # 4d008 <_fini+0x4ec>
    8bdf:	00 
    8be0:	ff 15 b2 72 05 00    	call   *0x572b2(%rip)        # 5fe98 <_GLOBAL_OFFSET_TABLE_+0x8d0>
    8be6:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    8beb:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
    8bf0:	48 83 f9 02          	cmp    $0x2,%rcx
    8bf4:	0f 84 d2 00 00 00    	je     8ccc <hyperinterval_strict_chain64+0x15c>
    8bfa:	48 8b 54 24 29       	mov    0x29(%rsp),%rdx
    8bff:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
    8c04:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
    8c0b:	00 
    8c0c:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
    8c13:	00 
    8c14:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
    8c1b:	00 
    8c1c:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
    8c23:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
    8c28:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
    8c2f:	00 
    8c30:	ff 15 c2 6e 05 00    	call   *0x56ec2(%rip)        # 5faf8 <_GLOBAL_OFFSET_TABLE_+0x530>
    8c36:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
    8c3b:	0f b6 44 24 70       	movzbl 0x70(%rsp),%eax
    8c40:	48 83 f9 02          	cmp    $0x2,%rcx
    8c44:	0f 84 82 00 00 00    	je     8ccc <hyperinterval_strict_chain64+0x15c>
    8c4a:	48 8b 54 24 71       	mov    0x71(%rsp),%rdx
    8c4f:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
    8c54:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
    8c59:	48 89 54 24 59       	mov    %rdx,0x59(%rsp)
    8c5e:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
    8c63:	88 44 24 58          	mov    %al,0x58(%rsp)
    8c67:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    8c6c:	f2 0f 10 05 9c 43 04 	movsd  0x4439c(%rip),%xmm0        # 4d010 <_fini+0x4f4>
    8c73:	00 
    8c74:	ff 15 96 72 05 00    	call   *0x57296(%rip)        # 5ff10 <_GLOBAL_OFFSET_TABLE_+0x948>
    8c7a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    8c7f:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
    8c84:	48 83 f9 02          	cmp    $0x2,%rcx
    8c88:	74 42                	je     8ccc <hyperinterval_strict_chain64+0x15c>
    8c8a:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
    8c8f:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
    8c94:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
    8c99:	48 89 54 24 29       	mov    %rdx,0x29(%rsp)
    8c9e:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
    8ca3:	88 44 24 28          	mov    %al,0x28(%rsp)
    8ca7:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
    8cac:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
    8cb1:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
    8cb6:	ff 15 cc 6f 05 00    	call   *0x56fcc(%rip)        # 5fc88 <_GLOBAL_OFFSET_TABLE_+0x6c0>
    8cbc:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
    8cc1:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
    8cc6:	48 83 f9 02          	cmp    $0x2,%rcx
    8cca:	75 16                	jne    8ce2 <hyperinterval_strict_chain64+0x172>
    8ccc:	88 43 08             	mov    %al,0x8(%rbx)
    8ccf:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    8cd6:	48 89 d8             	mov    %rbx,%rax
    8cd9:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
    8ce0:	5b                   	pop    %rbx
    8ce1:	c3                   	ret
    8ce2:	48 8b 54 24 41       	mov    0x41(%rsp),%rdx
    8ce7:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
    8cec:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
    8cf1:	48 89 54 24 11       	mov    %rdx,0x11(%rsp)
    8cf6:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    8cfb:	88 44 24 10          	mov    %al,0x10(%rsp)
    8cff:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
    8d04:	48 89 df             	mov    %rbx,%rdi
    8d07:	ff 15 93 6a 05 00    	call   *0x56a93(%rip)        # 5f7a0 <_GLOBAL_OFFSET_TABLE_+0x1d8>
    8d0d:	48 89 d8             	mov    %rbx,%rax
    8d10:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
    8d17:	5b                   	pop    %rbx
    8d18:	c3                   	ret
    8d19:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

hyperinterval_strict_chain32:
    8d20:	53                   	push   %rbx
    8d21:	48 83 ec 60          	sub    $0x60,%rsp
    8d25:	48 89 fb             	mov    %rdi,%rbx
    8d28:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
    8d2d:	ff 15 5d 72 05 00    	call   *0x5725d(%rip)        # 5ff90 <_GLOBAL_OFFSET_TABLE_+0x9c8>
    8d33:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
    8d37:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
    8d3c:	83 f9 02             	cmp    $0x2,%ecx
    8d3f:	0f 84 f4 00 00 00    	je     8e39 <hyperinterval_strict_chain32+0x119>
    8d45:	8b 54 24 11          	mov    0x11(%rsp),%edx
    8d49:	8b 74 24 14          	mov    0x14(%rsp),%esi
    8d4d:	89 74 24 5c          	mov    %esi,0x5c(%rsp)
    8d51:	89 54 24 59          	mov    %edx,0x59(%rsp)
    8d55:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
    8d59:	88 44 24 58          	mov    %al,0x58(%rsp)
    8d5d:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
    8d62:	48 8d 74 24 54       	lea    0x54(%rsp),%rsi
    8d67:	f3 0f 10 05 c1 44 04 	movss  0x444c1(%rip),%xmm0        # 4d230 <_fini+0x714>
    8d6e:	00 
    8d6f:	f3 0f 10 0d bd 44 04 	movss  0x444bd(%rip),%xmm1        # 4d234 <_fini+0x718>
    8d76:	00 
    8d77:	ff 15 f3 70 05 00    	call   *0x570f3(%rip)        # 5fe70 <_GLOBAL_OFFSET_TABLE_+0x8a8>
    8d7d:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
    8d81:	0f b6 44 24 1c       	movzbl 0x1c(%rsp),%eax
    8d86:	83 f9 02             	cmp    $0x2,%ecx
    8d89:	0f 84 aa 00 00 00    	je     8e39 <hyperinterval_strict_chain32+0x119>
    8d8f:	8b 54 24 1d          	mov    0x1d(%rsp),%edx
    8d93:	8b 74 24 20          	mov    0x20(%rsp),%esi
    8d97:	89 74 24 50          	mov    %esi,0x50(%rsp)
    8d9b:	89 54 24 4d          	mov    %edx,0x4d(%rsp)
    8d9f:	89 4c 24 48          	mov    %ecx,0x48(%rsp)
    8da3:	88 44 24 4c          	mov    %al,0x4c(%rsp)
    8da7:	48 8d 7c 24 3c       	lea    0x3c(%rsp),%rdi
    8dac:	48 8d 74 24 48       	lea    0x48(%rsp),%rsi
    8db1:	ff 15 01 71 05 00    	call   *0x57101(%rip)        # 5feb8 <_GLOBAL_OFFSET_TABLE_+0x8f0>
    8db7:	8b 4c 24 3c          	mov    0x3c(%rsp),%ecx
    8dbb:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
    8dc0:	83 f9 02             	cmp    $0x2,%ecx
    8dc3:	74 74                	je     8e39 <hyperinterval_strict_chain32+0x119>
    8dc5:	8b 54 24 41          	mov    0x41(%rsp),%edx
    8dc9:	8b 74 24 44          	mov    0x44(%rsp),%esi
    8dcd:	89 74 24 38          	mov    %esi,0x38(%rsp)
    8dd1:	89 54 24 35          	mov    %edx,0x35(%rsp)
    8dd5:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
    8dd9:	88 44 24 34          	mov    %al,0x34(%rsp)
    8ddd:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
    8de2:	f3 0f 10 05 4e 44 04 	movss  0x4444e(%rip),%xmm0        # 4d238 <_fini+0x71c>
    8de9:	00 
    8dea:	ff 15 a0 6b 05 00    	call   *0x56ba0(%rip)        # 5f990 <_GLOBAL_OFFSET_TABLE_+0x3c8>
    8df0:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
    8df4:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
    8df9:	83 f9 02             	cmp    $0x2,%ecx
    8dfc:	74 3b                	je     8e39 <hyperinterval_strict_chain32+0x119>
    8dfe:	8b 54 24 11          	mov    0x11(%rsp),%edx
    8e02:	8b 74 24 14          	mov    0x14(%rsp),%esi
    8e06:	89 74 24 20          	mov    %esi,0x20(%rsp)
    8e0a:	89 54 24 1d          	mov    %edx,0x1d(%rsp)
    8e0e:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
    8e12:	88 44 24 1c          	mov    %al,0x1c(%rsp)
    8e16:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
    8e1b:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
    8e20:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
    8e25:	ff 15 b5 68 05 00    	call   *0x568b5(%rip)        # 5f6e0 <_GLOBAL_OFFSET_TABLE_+0x118>
    8e2b:	8b 4c 24 24          	mov    0x24(%rsp),%ecx
    8e2f:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
    8e34:	83 f9 02             	cmp    $0x2,%ecx
    8e37:	75 12                	jne    8e4b <hyperinterval_strict_chain32+0x12b>
    8e39:	88 43 04             	mov    %al,0x4(%rbx)
    8e3c:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    8e42:	48 89 d8             	mov    %rbx,%rax
    8e45:	48 83 c4 60          	add    $0x60,%rsp
    8e49:	5b                   	pop    %rbx
    8e4a:	c3                   	ret
    8e4b:	8b 54 24 29          	mov    0x29(%rsp),%edx
    8e4f:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
    8e53:	89 74 24 14          	mov    %esi,0x14(%rsp)
    8e57:	89 54 24 11          	mov    %edx,0x11(%rsp)
    8e5b:	89 4c 24 0c          	mov    %ecx,0xc(%rsp)
    8e5f:	88 44 24 10          	mov    %al,0x10(%rsp)
    8e63:	48 8d 74 24 0c       	lea    0xc(%rsp),%rsi
    8e68:	48 89 df             	mov    %rbx,%rdi
    8e6b:	ff 15 0f 6e 05 00    	call   *0x56e0f(%rip)        # 5fc80 <_GLOBAL_OFFSET_TABLE_+0x6b8>
    8e71:	48 89 d8             	mov    %rbx,%rax
    8e74:	48 83 c4 60          	add    $0x60,%rsp
    8e78:	5b                   	pop    %rbx
    8e79:	c3                   	ret
    8e7a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

hyperinterval_strict_surface32:
    95f0:	55                   	push   %rbp
    95f1:	41 57                	push   %r15
    95f3:	41 56                	push   %r14
    95f5:	41 55                	push   %r13
    95f7:	41 54                	push   %r12
    95f9:	53                   	push   %rbx
    95fa:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
    9601:	89 f5                	mov    %esi,%ebp
    9603:	48 89 fb             	mov    %rdi,%rbx
    9606:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    960b:	66 0f 7e 44 24 38    	movd   %xmm0,0x38(%rsp)
    9611:	66 0f 7e 4c 24 54    	movd   %xmm1,0x54(%rsp)
    9617:	ff 15 73 69 05 00    	call   *0x56973(%rip)        # 5ff90 <_GLOBAL_OFFSET_TABLE_+0x9c8>
    961d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    9621:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
    9626:	83 f9 02             	cmp    $0x2,%ecx
    9629:	75 0e                	jne    9639 <hyperinterval_strict_surface32+0x49>
    962b:	88 43 04             	mov    %al,0x4(%rbx)
    962e:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    9634:	e9 8a 00 00 00       	jmp    96c3 <hyperinterval_strict_surface32+0xd3>
    9639:	49 89 dd             	mov    %rbx,%r13
    963c:	8b 54 24 0d          	mov    0xd(%rsp),%edx
    9640:	8b 74 24 10          	mov    0x10(%rsp),%esi
    9644:	89 74 24 44          	mov    %esi,0x44(%rsp)
    9648:	89 54 24 41          	mov    %edx,0x41(%rsp)
    964c:	89 4c 24 3c          	mov    %ecx,0x3c(%rsp)
    9650:	88 44 24 40          	mov    %al,0x40(%rsp)
    9654:	66 0f 6e 44 24 38    	movd   0x38(%rsp),%xmm0
    965a:	ff 15 00 68 05 00    	call   *0x56800(%rip)        # 5fe60 <_GLOBAL_OFFSET_TABLE_+0x898>
    9660:	48 89 c3             	mov    %rax,%rbx
    9663:	f6 c3 01             	test   $0x1,%bl
    9666:	74 0b                	je     9673 <hyperinterval_strict_surface32+0x83>
    9668:	4c 89 e8             	mov    %r13,%rax
    966b:	88 78 04             	mov    %bh,0x4(%rax)
    966e:	4c 89 eb             	mov    %r13,%rbx
    9671:	eb 48                	jmp    96bb <hyperinterval_strict_surface32+0xcb>
    9673:	66 0f 6e 44 24 54    	movd   0x54(%rsp),%xmm0
    9679:	ff 15 71 62 05 00    	call   *0x56271(%rip)        # 5f8f0 <_GLOBAL_OFFSET_TABLE_+0x328>
    967f:	a8 01                	test   $0x1,%al
    9681:	74 08                	je     968b <hyperinterval_strict_surface32+0x9b>
    9683:	4c 89 eb             	mov    %r13,%rbx
    9686:	88 63 04             	mov    %ah,0x4(%rbx)
    9689:	eb 30                	jmp    96bb <hyperinterval_strict_surface32+0xcb>
    968b:	48 c1 eb 20          	shr    $0x20,%rbx
    968f:	66 0f 6e c3          	movd   %ebx,%xmm0
    9693:	48 c1 e8 20          	shr    $0x20,%rax
    9697:	66 0f 6e c8          	movd   %eax,%xmm1
    969b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    96a0:	ff 15 ea 68 05 00    	call   *0x568ea(%rip)        # 5ff90 <_GLOBAL_OFFSET_TABLE_+0x9c8>
    96a6:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    96aa:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
    96af:	83 f9 02             	cmp    $0x2,%ecx
    96b2:	75 24                	jne    96d8 <hyperinterval_strict_surface32+0xe8>
    96b4:	4c 89 eb             	mov    %r13,%rbx
    96b7:	41 88 45 04          	mov    %al,0x4(%r13)
    96bb:	41 c7 45 00 02 00 00 	movl   $0x2,0x0(%r13)
    96c2:	00 
    96c3:	48 89 d8             	mov    %rbx,%rax
    96c6:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
    96cd:	5b                   	pop    %rbx
    96ce:	41 5c                	pop    %r12
    96d0:	41 5d                	pop    %r13
    96d2:	41 5e                	pop    %r14
    96d4:	41 5f                	pop    %r15
    96d6:	5d                   	pop    %rbp
    96d7:	c3                   	ret
    96d8:	8b 54 24 0d          	mov    0xd(%rsp),%edx
    96dc:	8b 74 24 10          	mov    0x10(%rsp),%esi
    96e0:	89 74 24 60          	mov    %esi,0x60(%rsp)
    96e4:	89 54 24 5d          	mov    %edx,0x5d(%rsp)
    96e8:	89 4c 24 58          	mov    %ecx,0x58(%rsp)
    96ec:	88 44 24 5c          	mov    %al,0x5c(%rsp)
    96f0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    96f5:	48 8d 74 24 3c       	lea    0x3c(%rsp),%rsi
    96fa:	89 ea                	mov    %ebp,%edx
    96fc:	ff 15 9e 68 05 00    	call   *0x5689e(%rip)        # 5ffa0 <_GLOBAL_OFFSET_TABLE_+0x9d8>
    9702:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    9706:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
    970b:	83 f9 02             	cmp    $0x2,%ecx
    970e:	4c 89 eb             	mov    %r13,%rbx
    9711:	0f 84 14 ff ff ff    	je     962b <hyperinterval_strict_surface32+0x3b>
    9717:	8b 54 24 0d          	mov    0xd(%rsp),%edx
    971b:	8b 74 24 10          	mov    0x10(%rsp),%esi
    971f:	89 74 24 78          	mov    %esi,0x78(%rsp)
    9723:	89 54 24 75          	mov    %edx,0x75(%rsp)
    9727:	89 4c 24 70          	mov    %ecx,0x70(%rsp)
    972b:	88 44 24 74          	mov    %al,0x74(%rsp)
    972f:	48 8d 7c 24 48       	lea    0x48(%rsp),%rdi
    9734:	48 8d 74 24 70       	lea    0x70(%rsp),%rsi
    9739:	ff 15 61 61 05 00    	call   *0x56161(%rip)        # 5f8a0 <_GLOBAL_OFFSET_TABLE_+0x2d8>
    973f:	8b 4c 24 48          	mov    0x48(%rsp),%ecx
    9743:	0f b6 44 24 4c       	movzbl 0x4c(%rsp),%eax
    9748:	83 f9 02             	cmp    $0x2,%ecx
    974b:	0f 84 da fe ff ff    	je     962b <hyperinterval_strict_surface32+0x3b>
    9751:	8b 54 24 4d          	mov    0x4d(%rsp),%edx
    9755:	8b 74 24 50          	mov    0x50(%rsp),%esi
    9759:	89 74 24 34          	mov    %esi,0x34(%rsp)
    975d:	89 54 24 31          	mov    %edx,0x31(%rsp)
    9761:	89 4c 24 2c          	mov    %ecx,0x2c(%rsp)
    9765:	88 44 24 30          	mov    %al,0x30(%rsp)
    9769:	48 8d 9c 24 9c 00 00 	lea    0x9c(%rsp),%rbx
    9770:	00 
    9771:	48 8d 74 24 2c       	lea    0x2c(%rsp),%rsi
    9776:	4c 8d 7c 24 58       	lea    0x58(%rsp),%r15
    977b:	48 89 df             	mov    %rbx,%rdi
    977e:	4c 89 fa             	mov    %r15,%rdx
    9781:	ff 15 d9 65 05 00    	call   *0x565d9(%rip)        # 5fd60 <_GLOBAL_OFFSET_TABLE_+0x798>
    9787:	4c 8d 74 24 64       	lea    0x64(%rsp),%r14
    978c:	48 8d 54 24 3c       	lea    0x3c(%rsp),%rdx
    9791:	4c 89 f7             	mov    %r14,%rdi
    9794:	48 89 de             	mov    %rbx,%rsi
    9797:	ff 15 63 60 05 00    	call   *0x56063(%rip)        # 5f800 <_GLOBAL_OFFSET_TABLE_+0x238>
    979d:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    97a2:	4c 89 f6             	mov    %r14,%rsi
    97a5:	ff 15 15 63 05 00    	call   *0x56315(%rip)        # 5fac0 <_GLOBAL_OFFSET_TABLE_+0x4f8>
    97ab:	48 8d 7c 24 14       	lea    0x14(%rsp),%rdi
    97b0:	4c 89 f6             	mov    %r14,%rsi
    97b3:	4c 89 fa             	mov    %r15,%rdx
    97b6:	ff 15 ac 62 05 00    	call   *0x562ac(%rip)        # 5fa68 <_GLOBAL_OFFSET_TABLE_+0x4a0>
    97bc:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
    97c1:	4c 89 f6             	mov    %r14,%rsi
    97c4:	4c 89 fa             	mov    %r15,%rdx
    97c7:	ff 15 eb 60 05 00    	call   *0x560eb(%rip)        # 5f8b8 <_GLOBAL_OFFSET_TABLE_+0x2f0>
    97cd:	8b 44 24 28          	mov    0x28(%rsp),%eax
    97d1:	89 84 24 90 00 00 00 	mov    %eax,0x90(%rsp)
    97d8:	0f 10 44 24 08       	movups 0x8(%rsp),%xmm0
    97dd:	0f 10 4c 24 18       	movups 0x18(%rsp),%xmm1
    97e2:	0f 29 8c 24 80 00 00 	movaps %xmm1,0x80(%rsp)
    97e9:	00 
    97ea:	0f 29 44 24 70       	movaps %xmm0,0x70(%rsp)
    97ef:	48 8d 44 24 70       	lea    0x70(%rsp),%rax
    97f4:	4c 89 f7             	mov    %r14,%rdi
    97f7:	ff 15 33 5e 05 00    	call   *0x55e33(%rip)        # 5f630 <_GLOBAL_OFFSET_TABLE_+0x68>
    97fd:	8b 4c 24 64          	mov    0x64(%rsp),%ecx
    9801:	83 f9 01             	cmp    $0x1,%ecx
    9804:	75 1c                	jne    9822 <hyperinterval_strict_surface32+0x232>
    9806:	8b 74 24 68          	mov    0x68(%rsp),%esi
    980a:	8b 7c 24 6c          	mov    0x6c(%rsp),%edi
    980e:	39 fe                	cmp    %edi,%esi
    9810:	0f 94 c2             	sete   %dl
    9813:	66 0f 6e ce          	movd   %esi,%xmm1
    9817:	66 0f 6e c7          	movd   %edi,%xmm0
    981b:	be 01 00 00 00       	mov    $0x1,%esi
    9820:	eb 04                	jmp    9826 <hyperinterval_strict_surface32+0x236>
    9822:	31 d2                	xor    %edx,%edx
    9824:	31 f6                	xor    %esi,%esi
    9826:	80 f1 01             	xor    $0x1,%cl
    9829:	89 74 24 08          	mov    %esi,0x8(%rsp)
    982d:	66 0f 7e 4c 24 0c    	movd   %xmm1,0xc(%rsp)
    9833:	88 4c 24 10          	mov    %cl,0x10(%rsp)
    9837:	88 54 24 11          	mov    %dl,0x11(%rsp)
    983b:	88 44 24 12          	mov    %al,0x12(%rsp)
    983f:	89 74 24 14          	mov    %esi,0x14(%rsp)
    9843:	66 0f 7e 44 24 18    	movd   %xmm0,0x18(%rsp)
    9849:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
    984e:	4c 8d 64 24 64       	lea    0x64(%rsp),%r12
    9853:	48 8d 5c 24 58       	lea    0x58(%rsp),%rbx
    9858:	4c 89 e7             	mov    %r12,%rdi
    985b:	48 89 de             	mov    %rbx,%rsi
    985e:	ff 15 14 66 05 00    	call   *0x56614(%rip)        # 5fe78 <_GLOBAL_OFFSET_TABLE_+0x8b0>
    9864:	89 c5                	mov    %eax,%ebp
    9866:	4c 89 e7             	mov    %r12,%rdi
    9869:	48 89 de             	mov    %rbx,%rsi
    986c:	ff 15 7e 63 05 00    	call   *0x5637e(%rip)        # 5fbf0 <_GLOBAL_OFFSET_TABLE_+0x628>
    9872:	41 89 c6             	mov    %eax,%r14d
    9875:	48 8d 5c 24 3c       	lea    0x3c(%rsp),%rbx
    987a:	4c 89 e7             	mov    %r12,%rdi
    987d:	48 89 de             	mov    %rbx,%rsi
    9880:	ff 15 42 63 05 00    	call   *0x56342(%rip)        # 5fbc8 <_GLOBAL_OFFSET_TABLE_+0x600>
    9886:	41 89 c7             	mov    %eax,%r15d
    9889:	4c 89 e7             	mov    %r12,%rdi
    988c:	48 89 de             	mov    %rbx,%rsi
    988f:	ff 15 7b 62 05 00    	call   *0x5627b(%rip)        # 5fb10 <_GLOBAL_OFFSET_TABLE_+0x548>
    9895:	89 c3                	mov    %eax,%ebx
    9897:	4c 89 e7             	mov    %r12,%rdi
    989a:	66 0f 6e 44 24 38    	movd   0x38(%rsp),%xmm0
    98a0:	ff 15 da 66 05 00    	call   *0x566da(%rip)        # 5ff80 <_GLOBAL_OFFSET_TABLE_+0x9b8>
    98a6:	a8 01                	test   $0x1,%al
    98a8:	74 0c                	je     98b6 <hyperinterval_strict_surface32+0x2c6>
    98aa:	4c 89 eb             	mov    %r13,%rbx
    98ad:	41 88 55 04          	mov    %dl,0x4(%r13)
    98b1:	e9 05 fe ff ff       	jmp    96bb <hyperinterval_strict_surface32+0xcb>
    98b6:	80 e2 01             	and    $0x1,%dl
    98b9:	40 88 6c 24 08       	mov    %bpl,0x8(%rsp)
    98be:	44 88 74 24 09       	mov    %r14b,0x9(%rsp)
    98c3:	44 88 7c 24 0a       	mov    %r15b,0xa(%rsp)
    98c8:	88 5c 24 0b          	mov    %bl,0xb(%rsp)
    98cc:	88 54 24 0c          	mov    %dl,0xc(%rsp)
    98d0:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
    98d5:	f6 44 24 3c 01       	testb  $0x1,0x3c(%rsp)
    98da:	74 2a                	je     9906 <hyperinterval_strict_surface32+0x316>
    98dc:	f3 0f 7e 44 24 40    	movq   0x40(%rsp),%xmm0
    98e2:	66 0f 70 c8 e1       	pshufd $0xe1,%xmm0,%xmm1
    98e7:	66 0f ef c0          	pxor   %xmm0,%xmm0
    98eb:	66 0f 6f 15 0d 3a 04 	movdqa 0x43a0d(%rip),%xmm2        # 4d300 <_fini+0x7e4>
    98f2:	00 
    98f3:	66 0f ef d1          	pxor   %xmm1,%xmm2
    98f7:	66 0f 76 c1          	pcmpeqd %xmm1,%xmm0
    98fb:	66 0f df c2          	pandn  %xmm2,%xmm0
    98ff:	b8 01 00 00 00       	mov    $0x1,%eax
    9904:	eb 02                	jmp    9908 <hyperinterval_strict_surface32+0x318>
    9906:	31 c0                	xor    %eax,%eax
    9908:	89 44 24 48          	mov    %eax,0x48(%rsp)
    990c:	66 0f d6 44 24 4c    	movq   %xmm0,0x4c(%rsp)
    9912:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    9917:	48 8d 74 24 64       	lea    0x64(%rsp),%rsi
    991c:	48 8d 54 24 48       	lea    0x48(%rsp),%rdx
    9921:	ff 15 79 62 05 00    	call   *0x56279(%rip)        # 5fba0 <_GLOBAL_OFFSET_TABLE_+0x5d8>
    9927:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    992b:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
    9930:	83 f9 02             	cmp    $0x2,%ecx
    9933:	4c 89 eb             	mov    %r13,%rbx
    9936:	0f 84 ef fc ff ff    	je     962b <hyperinterval_strict_surface32+0x3b>
    993c:	8b 54 24 0d          	mov    0xd(%rsp),%edx
    9940:	8b 74 24 10          	mov    0x10(%rsp),%esi
    9944:	89 74 24 34          	mov    %esi,0x34(%rsp)
    9948:	89 54 24 31          	mov    %edx,0x31(%rsp)
    994c:	89 4c 24 2c          	mov    %ecx,0x2c(%rsp)
    9950:	88 44 24 30          	mov    %al,0x30(%rsp)
    9954:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    9959:	66 0f 6e 05 df 38 04 	movd   0x438df(%rip),%xmm0        # 4d240 <_fini+0x724>
    9960:	00 
    9961:	ff 15 29 60 05 00    	call   *0x56029(%rip)        # 5f990 <_GLOBAL_OFFSET_TABLE_+0x3c8>
    9967:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    996b:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
    9970:	83 f9 02             	cmp    $0x2,%ecx
    9973:	0f 84 b2 fc ff ff    	je     962b <hyperinterval_strict_surface32+0x3b>
    9979:	8b 54 24 0d          	mov    0xd(%rsp),%edx
    997d:	8b 74 24 10          	mov    0x10(%rsp),%esi
    9981:	89 74 24 78          	mov    %esi,0x78(%rsp)
    9985:	89 54 24 75          	mov    %edx,0x75(%rsp)
    9989:	89 4c 24 70          	mov    %ecx,0x70(%rsp)
    998d:	88 44 24 74          	mov    %al,0x74(%rsp)
    9991:	48 8d 74 24 2c       	lea    0x2c(%rsp),%rsi
    9996:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
    999b:	48 89 df             	mov    %rbx,%rdi
    999e:	ff 15 44 64 05 00    	call   *0x56444(%rip)        # 5fde8 <_GLOBAL_OFFSET_TABLE_+0x820>
    99a4:	e9 1a fd ff ff       	jmp    96c3 <hyperinterval_strict_surface32+0xd3>
    99a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

hyperinterval_strict_surface64:
    99b0:	55                   	push   %rbp
    99b1:	41 57                	push   %r15
    99b3:	41 56                	push   %r14
    99b5:	41 55                	push   %r13
    99b7:	41 54                	push   %r12
    99b9:	53                   	push   %rbx
    99ba:	48 81 ec 58 01 00 00 	sub    $0x158,%rsp
    99c1:	89 f5                	mov    %esi,%ebp
    99c3:	48 89 fb             	mov    %rdi,%rbx
    99c6:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    99cb:	f2 0f 11 84 24 98 00 	movsd  %xmm0,0x98(%rsp)
    99d2:	00 00 
    99d4:	66 0f d6 4c 24 60    	movq   %xmm1,0x60(%rsp)
    99da:	ff 15 30 5c 05 00    	call   *0x55c30(%rip)        # 5f610 <_GLOBAL_OFFSET_TABLE_+0x48>
    99e0:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
    99e5:	44 0f b6 64 24 18    	movzbl 0x18(%rsp),%r12d
    99eb:	49 83 ff 02          	cmp    $0x2,%r15
    99ef:	75 09                	jne    99fa <hyperinterval_strict_surface64+0x4a>
    99f1:	44 88 63 08          	mov    %r12b,0x8(%rbx)
    99f5:	e9 9c 00 00 00       	jmp    9a96 <hyperinterval_strict_surface64+0xe6>
    99fa:	44 0f b6 74 24 1f    	movzbl 0x1f(%rsp),%r14d
    9a00:	44 0f b7 6c 24 1d    	movzwl 0x1d(%rsp),%r13d
    9a06:	8b 44 24 19          	mov    0x19(%rsp),%eax
    9a0a:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    9a0f:	4c 89 7c 24 68       	mov    %r15,0x68(%rsp)
    9a14:	44 88 64 24 70       	mov    %r12b,0x70(%rsp)
    9a19:	44 88 74 24 77       	mov    %r14b,0x77(%rsp)
    9a1e:	66 44 89 6c 24 75    	mov    %r13w,0x75(%rsp)
    9a24:	48 89 84 24 20 01 00 	mov    %rax,0x120(%rsp)
    9a2b:	00 
    9a2c:	89 44 24 71          	mov    %eax,0x71(%rsp)
    9a30:	48 89 8c 24 18 01 00 	mov    %rcx,0x118(%rsp)
    9a37:	00 
    9a38:	48 89 4c 24 78       	mov    %rcx,0x78(%rsp)
    9a3d:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
    9a44:	00 
    9a45:	f2 0f 10 84 24 98 00 	movsd  0x98(%rsp),%xmm0
    9a4c:	00 00 
    9a4e:	ff 15 dc 64 05 00    	call   *0x564dc(%rip)        # 5ff30 <_GLOBAL_OFFSET_TABLE_+0x968>
    9a54:	80 bc 24 d0 00 00 00 	cmpb   $0x1,0xd0(%rsp)
    9a5b:	01 
    9a5c:	74 2d                	je     9a8b <hyperinterval_strict_surface64+0xdb>
    9a5e:	f2 0f 10 84 24 d8 00 	movsd  0xd8(%rsp),%xmm0
    9a65:	00 00 
    9a67:	f2 0f 11 44 24 58    	movsd  %xmm0,0x58(%rsp)
    9a6d:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
    9a74:	00 
    9a75:	f2 0f 10 44 24 60    	movsd  0x60(%rsp),%xmm0
    9a7b:	ff 15 2f 62 05 00    	call   *0x5622f(%rip)        # 5fcb0 <_GLOBAL_OFFSET_TABLE_+0x6e8>
    9a81:	80 bc 24 d0 00 00 00 	cmpb   $0x1,0xd0(%rsp)
    9a88:	01 
    9a89:	75 27                	jne    9ab2 <hyperinterval_strict_surface64+0x102>
    9a8b:	0f b6 84 24 d1 00 00 	movzbl 0xd1(%rsp),%eax
    9a92:	00 
    9a93:	88 43 08             	mov    %al,0x8(%rbx)
    9a96:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    9a9d:	48 89 d8             	mov    %rbx,%rax
    9aa0:	48 81 c4 58 01 00 00 	add    $0x158,%rsp
    9aa7:	5b                   	pop    %rbx
    9aa8:	41 5c                	pop    %r12
    9aaa:	41 5d                	pop    %r13
    9aac:	41 5e                	pop    %r14
    9aae:	41 5f                	pop    %r15
    9ab0:	5d                   	pop    %rbp
    9ab1:	c3                   	ret
    9ab2:	f3 0f 7e 8c 24 d8 00 	movq   0xd8(%rsp),%xmm1
    9ab9:	00 00 
    9abb:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    9ac0:	f2 0f 10 44 24 58    	movsd  0x58(%rsp),%xmm0
    9ac6:	ff 15 44 5b 05 00    	call   *0x55b44(%rip)        # 5f610 <_GLOBAL_OFFSET_TABLE_+0x48>
    9acc:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    9ad1:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
    9ad6:	48 83 f9 02          	cmp    $0x2,%rcx
    9ada:	74 b7                	je     9a93 <hyperinterval_strict_surface64+0xe3>
    9adc:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
    9ae1:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    9ae6:	48 89 b4 24 b0 00 00 	mov    %rsi,0xb0(%rsp)
    9aed:	00 
    9aee:	48 89 94 24 a9 00 00 	mov    %rdx,0xa9(%rsp)
    9af5:	00 
    9af6:	48 89 8c 24 a0 00 00 	mov    %rcx,0xa0(%rsp)
    9afd:	00 
    9afe:	88 84 24 a8 00 00 00 	mov    %al,0xa8(%rsp)
    9b05:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    9b0a:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
    9b0f:	89 ea                	mov    %ebp,%edx
    9b11:	ff 15 21 60 05 00    	call   *0x56021(%rip)        # 5fb38 <_GLOBAL_OFFSET_TABLE_+0x570>
    9b17:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    9b1c:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
    9b21:	48 83 f9 02          	cmp    $0x2,%rcx
    9b25:	0f 84 68 ff ff ff    	je     9a93 <hyperinterval_strict_surface64+0xe3>
    9b2b:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
    9b30:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    9b35:	48 89 b4 24 e0 00 00 	mov    %rsi,0xe0(%rsp)
    9b3c:	00 
    9b3d:	48 89 94 24 d9 00 00 	mov    %rdx,0xd9(%rsp)
    9b44:	00 
    9b45:	48 89 8c 24 d0 00 00 	mov    %rcx,0xd0(%rsp)
    9b4c:	00 
    9b4d:	88 84 24 d8 00 00 00 	mov    %al,0xd8(%rsp)
    9b54:	48 8d bc 24 b8 00 00 	lea    0xb8(%rsp),%rdi
    9b5b:	00 
    9b5c:	48 8d b4 24 d0 00 00 	lea    0xd0(%rsp),%rsi
    9b63:	00 
    9b64:	ff 15 66 5b 05 00    	call   *0x55b66(%rip)        # 5f6d0 <_GLOBAL_OFFSET_TABLE_+0x108>
    9b6a:	48 8b 8c 24 b8 00 00 	mov    0xb8(%rsp),%rcx
    9b71:	00 
    9b72:	0f b6 84 24 c0 00 00 	movzbl 0xc0(%rsp),%eax
    9b79:	00 
    9b7a:	48 83 f9 02          	cmp    $0x2,%rcx
    9b7e:	0f 84 0f ff ff ff    	je     9a93 <hyperinterval_strict_surface64+0xe3>
    9b84:	48 8b 94 24 c1 00 00 	mov    0xc1(%rsp),%rdx
    9b8b:	00 
    9b8c:	48 8b b4 24 c8 00 00 	mov    0xc8(%rsp),%rsi
    9b93:	00 
    9b94:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
    9b9b:	00 
    9b9c:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
    9ba3:	00 
    9ba4:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
    9bab:	00 
    9bac:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
    9bb3:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
    9bba:	00 
    9bbb:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
    9bc2:	00 
    9bc3:	48 8d 94 24 a0 00 00 	lea    0xa0(%rsp),%rdx
    9bca:	00 
    9bcb:	ff 15 2f 5b 05 00    	call   *0x55b2f(%rip)        # 5f700 <_GLOBAL_OFFSET_TABLE_+0x138>
    9bd1:	48 8d ac 24 28 01 00 	lea    0x128(%rsp),%rbp
    9bd8:	00 
    9bd9:	48 8d 54 24 68       	lea    0x68(%rsp),%rdx
    9bde:	48 89 ef             	mov    %rbp,%rdi
    9be1:	48 8d b4 24 40 01 00 	lea    0x140(%rsp),%rsi
    9be8:	00 
    9be9:	ff 15 09 5b 05 00    	call   *0x55b09(%rip)        # 5f6f8 <_GLOBAL_OFFSET_TABLE_+0x130>
    9bef:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    9bf4:	48 89 ee             	mov    %rbp,%rsi
    9bf7:	e8 54 ee ff ff       	call   8a50 <hyperinterval::float::F64Enclosure::abs>
    9bfc:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    9c01:	48 89 ee             	mov    %rbp,%rsi
    9c04:	48 8d 94 24 a0 00 00 	lea    0xa0(%rsp),%rdx
    9c0b:	00 
    9c0c:	ff 15 c6 5f 05 00    	call   *0x55fc6(%rip)        # 5fbd8 <_GLOBAL_OFFSET_TABLE_+0x610>
    9c12:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    9c17:	48 89 ee             	mov    %rbp,%rsi
    9c1a:	48 8d 94 24 a0 00 00 	lea    0xa0(%rsp),%rdx
    9c21:	00 
    9c22:	ff 15 e0 59 05 00    	call   *0x559e0(%rip)        # 5f608 <_GLOBAL_OFFSET_TABLE_+0x40>
    9c28:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
    9c2d:	48 89 84 24 10 01 00 	mov    %rax,0x110(%rsp)
    9c34:	00 
    9c35:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
    9c3a:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
    9c3f:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
    9c44:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
    9c49:	0f 29 9c 24 00 01 00 	movaps %xmm3,0x100(%rsp)
    9c50:	00 
    9c51:	0f 29 94 24 f0 00 00 	movaps %xmm2,0xf0(%rsp)
    9c58:	00 
    9c59:	0f 29 8c 24 e0 00 00 	movaps %xmm1,0xe0(%rsp)
    9c60:	00 
    9c61:	0f 29 84 24 d0 00 00 	movaps %xmm0,0xd0(%rsp)
    9c68:	00 
    9c69:	48 8d 84 24 d0 00 00 	lea    0xd0(%rsp),%rax
    9c70:	00 
    9c71:	48 89 ef             	mov    %rbp,%rdi
    9c74:	ff 15 36 5f 05 00    	call   *0x55f36(%rip)        # 5fbb0 <_GLOBAL_OFFSET_TABLE_+0x5e8>
    9c7a:	48 8b 8c 24 28 01 00 	mov    0x128(%rsp),%rcx
    9c81:	00 
    9c82:	48 83 f9 01          	cmp    $0x1,%rcx
    9c86:	75 27                	jne    9caf <hyperinterval_strict_surface64+0x2ff>
    9c88:	48 8b b4 24 30 01 00 	mov    0x130(%rsp),%rsi
    9c8f:	00 
    9c90:	48 8b bc 24 38 01 00 	mov    0x138(%rsp),%rdi
    9c97:	00 
    9c98:	48 39 fe             	cmp    %rdi,%rsi
    9c9b:	0f 94 c2             	sete   %dl
    9c9e:	66 48 0f 6e ce       	movq   %rsi,%xmm1
    9ca3:	66 48 0f 6e c7       	movq   %rdi,%xmm0
    9ca8:	be 01 00 00 00       	mov    $0x1,%esi
    9cad:	eb 04                	jmp    9cb3 <hyperinterval_strict_surface64+0x303>
    9caf:	31 d2                	xor    %edx,%edx
    9cb1:	31 f6                	xor    %esi,%esi
    9cb3:	80 f1 01             	xor    $0x1,%cl
    9cb6:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
    9cbb:	66 0f d6 4c 24 18    	movq   %xmm1,0x18(%rsp)
    9cc1:	88 4c 24 20          	mov    %cl,0x20(%rsp)
    9cc5:	88 54 24 21          	mov    %dl,0x21(%rsp)
    9cc9:	88 44 24 22          	mov    %al,0x22(%rsp)
    9ccd:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
    9cd2:	66 0f d6 44 24 30    	movq   %xmm0,0x30(%rsp)
    9cd8:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
    9cdd:	48 8d ac 24 28 01 00 	lea    0x128(%rsp),%rbp
    9ce4:	00 
    9ce5:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
    9cec:	00 
    9ced:	48 89 ef             	mov    %rbp,%rdi
    9cf0:	ff 15 5a 5f 05 00    	call   *0x55f5a(%rip)        # 5fc50 <_GLOBAL_OFFSET_TABLE_+0x688>
    9cf6:	88 44 24 60          	mov    %al,0x60(%rsp)
    9cfa:	48 89 ef             	mov    %rbp,%rdi
    9cfd:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
    9d04:	00 
    9d05:	ff 15 f5 5c 05 00    	call   *0x55cf5(%rip)        # 5fa00 <_GLOBAL_OFFSET_TABLE_+0x438>
    9d0b:	88 44 24 58          	mov    %al,0x58(%rsp)
    9d0f:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
    9d14:	48 89 ef             	mov    %rbp,%rdi
    9d17:	ff 15 0b 5f 05 00    	call   *0x55f0b(%rip)        # 5fc28 <_GLOBAL_OFFSET_TABLE_+0x660>
    9d1d:	88 44 24 0f          	mov    %al,0xf(%rsp)
    9d21:	48 89 ef             	mov    %rbp,%rdi
    9d24:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
    9d29:	ff 15 71 61 05 00    	call   *0x56171(%rip)        # 5fea0 <_GLOBAL_OFFSET_TABLE_+0x8d8>
    9d2f:	88 44 24 0e          	mov    %al,0xe(%rsp)
    9d33:	48 89 ef             	mov    %rbp,%rdi
    9d36:	f2 0f 10 84 24 98 00 	movsd  0x98(%rsp),%xmm0
    9d3d:	00 00 
    9d3f:	ff 15 0b 59 05 00    	call   *0x5590b(%rip)        # 5f650 <_GLOBAL_OFFSET_TABLE_+0x88>
    9d45:	a8 01                	test   $0x1,%al
    9d47:	74 08                	je     9d51 <hyperinterval_strict_surface64+0x3a1>
    9d49:	88 53 08             	mov    %dl,0x8(%rbx)
    9d4c:	e9 45 fd ff ff       	jmp    9a96 <hyperinterval_strict_surface64+0xe6>
    9d51:	80 e2 01             	and    $0x1,%dl
    9d54:	0f b6 44 24 60       	movzbl 0x60(%rsp),%eax
    9d59:	88 44 24 10          	mov    %al,0x10(%rsp)
    9d5d:	0f b6 44 24 58       	movzbl 0x58(%rsp),%eax
    9d62:	88 44 24 11          	mov    %al,0x11(%rsp)
    9d66:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
    9d6b:	88 44 24 12          	mov    %al,0x12(%rsp)
    9d6f:	0f b6 44 24 0e       	movzbl 0xe(%rsp),%eax
    9d74:	88 44 24 13          	mov    %al,0x13(%rsp)
    9d78:	88 54 24 14          	mov    %dl,0x14(%rsp)
    9d7c:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
    9d81:	41 f6 c7 01          	test   $0x1,%r15b
    9d85:	74 51                	je     9dd8 <hyperinterval_strict_surface64+0x428>
    9d87:	41 c1 e6 10          	shl    $0x10,%r14d
    9d8b:	45 09 f5             	or     %r14d,%r13d
    9d8e:	41 0f b6 c4          	movzbl %r12b,%eax
    9d92:	49 c1 e5 20          	shl    $0x20,%r13
    9d96:	48 8b 94 24 20 01 00 	mov    0x120(%rsp),%rdx
    9d9d:	00 
    9d9e:	4c 09 ea             	or     %r13,%rdx
    9da1:	48 c1 e2 08          	shl    $0x8,%rdx
    9da5:	48 09 c2             	or     %rax,%rdx
    9da8:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    9daf:	00 00 80 
    9db2:	48 8b b4 24 18 01 00 	mov    0x118(%rsp),%rsi
    9db9:	00 
    9dba:	48 89 f1             	mov    %rsi,%rcx
    9dbd:	48 31 c1             	xor    %rax,%rcx
    9dc0:	48 85 f6             	test   %rsi,%rsi
    9dc3:	48 0f 44 ce          	cmove  %rsi,%rcx
    9dc7:	48 31 d0             	xor    %rdx,%rax
    9dca:	48 85 d2             	test   %rdx,%rdx
    9dcd:	48 0f 44 c2          	cmove  %rdx,%rax
    9dd1:	ba 01 00 00 00       	mov    $0x1,%edx
    9dd6:	eb 02                	jmp    9dda <hyperinterval_strict_surface64+0x42a>
    9dd8:	31 d2                	xor    %edx,%edx
    9dda:	48 89 94 24 b8 00 00 	mov    %rdx,0xb8(%rsp)
    9de1:	00 
    9de2:	48 89 8c 24 c0 00 00 	mov    %rcx,0xc0(%rsp)
    9de9:	00 
    9dea:	48 89 84 24 c8 00 00 	mov    %rax,0xc8(%rsp)
    9df1:	00 
    9df2:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    9df7:	48 8d b4 24 28 01 00 	lea    0x128(%rsp),%rsi
    9dfe:	00 
    9dff:	48 8d 94 24 b8 00 00 	lea    0xb8(%rsp),%rdx
    9e06:	00 
    9e07:	ff 15 3b 5f 05 00    	call   *0x55f3b(%rip)        # 5fd48 <_GLOBAL_OFFSET_TABLE_+0x780>
    9e0d:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    9e12:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
    9e17:	48 83 f9 02          	cmp    $0x2,%rcx
    9e1b:	0f 84 72 fc ff ff    	je     9a93 <hyperinterval_strict_surface64+0xe3>
    9e21:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
    9e26:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    9e2b:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
    9e32:	00 
    9e33:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
    9e3a:	00 
    9e3b:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
    9e42:	00 
    9e43:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
    9e4a:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    9e4f:	f2 0f 10 05 c9 31 04 	movsd  0x431c9(%rip),%xmm0        # 4d020 <_fini+0x504>
    9e56:	00 
    9e57:	ff 15 b3 60 05 00    	call   *0x560b3(%rip)        # 5ff10 <_GLOBAL_OFFSET_TABLE_+0x948>
    9e5d:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    9e62:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
    9e67:	48 83 f9 02          	cmp    $0x2,%rcx
    9e6b:	0f 84 22 fc ff ff    	je     9a93 <hyperinterval_strict_surface64+0xe3>
    9e71:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
    9e76:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    9e7b:	48 89 b4 24 e0 00 00 	mov    %rsi,0xe0(%rsp)
    9e82:	00 
    9e83:	48 89 94 24 d9 00 00 	mov    %rdx,0xd9(%rsp)
    9e8a:	00 
    9e8b:	48 89 8c 24 d0 00 00 	mov    %rcx,0xd0(%rsp)
    9e92:	00 
    9e93:	88 84 24 d8 00 00 00 	mov    %al,0xd8(%rsp)
    9e9a:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
    9ea1:	00 
    9ea2:	48 8d 94 24 d0 00 00 	lea    0xd0(%rsp),%rdx
    9ea9:	00 
    9eaa:	48 89 df             	mov    %rbx,%rdi
    9ead:	ff 15 d5 5f 05 00    	call   *0x55fd5(%rip)        # 5fe88 <_GLOBAL_OFFSET_TABLE_+0x8c0>
    9eb3:	e9 e5 fb ff ff       	jmp    9a9d <hyperinterval_strict_surface64+0xed>
    9eb8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    9ebf:	00 

hyperinterval::float::F32Enclosure::new:
    9f40:	41 57                	push   %r15
    9f42:	41 56                	push   %r14
    9f44:	53                   	push   %rbx
    9f45:	48 83 ec 20          	sub    $0x20,%rsp
    9f49:	f3 0f 11 4c 24 1c    	movss  %xmm1,0x1c(%rsp)
    9f4f:	48 89 fb             	mov    %rdi,%rbx
    9f52:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
    9f58:	66 0f 7e c1          	movd   %xmm0,%ecx
    9f5c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    9f61:	be 00 00 00 80       	mov    $0x80000000,%esi
    9f66:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    9f6b:	e8 60 44 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    9f70:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    9f75:	74 2a                	je     9fa1 <hyperinterval::float::F32Enclosure::new+0x61>
    9f77:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
    9f7c:	66 0f 6e 44 24 1c    	movd   0x1c(%rsp),%xmm0
    9f82:	66 0f 7e c1          	movd   %xmm0,%ecx
    9f86:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    9f8b:	be 00 00 00 80       	mov    $0x80000000,%esi
    9f90:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    9f95:	e8 36 44 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    9f9a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    9f9f:	75 1b                	jne    9fbc <hyperinterval::float::F32Enclosure::new+0x7c>
    9fa1:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
    9fa6:	88 43 04             	mov    %al,0x4(%rbx)
    9fa9:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    9faf:	48 89 d8             	mov    %rbx,%rax
    9fb2:	48 83 c4 20          	add    $0x20,%rsp
    9fb6:	5b                   	pop    %rbx
    9fb7:	41 5e                	pop    %r14
    9fb9:	41 5f                	pop    %r15
    9fbb:	c3                   	ret
    9fbc:	8b 44 24 10          	mov    0x10(%rsp),%eax
    9fc0:	44 89 f9             	mov    %r15d,%ecx
    9fc3:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    9fc9:	89 c2                	mov    %eax,%edx
    9fcb:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    9fd1:	be 00 00 00 80       	mov    $0x80000000,%esi
    9fd6:	29 ce                	sub    %ecx,%esi
    9fd8:	44 09 f1             	or     %r14d,%ecx
    9fdb:	45 85 ff             	test   %r15d,%r15d
    9fde:	48 0f 49 f1          	cmovns %rcx,%rsi
    9fe2:	89 d1                	mov    %edx,%ecx
    9fe4:	44 09 f1             	or     %r14d,%ecx
    9fe7:	41 29 d6             	sub    %edx,%r14d
    9fea:	85 c0                	test   %eax,%eax
    9fec:	4c 0f 49 f1          	cmovns %rcx,%r14
    9ff0:	44 39 f6             	cmp    %r14d,%esi
    9ff3:	76 06                	jbe    9ffb <hyperinterval::float::F32Enclosure::new+0xbb>
    9ff5:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
    9ff9:	eb ae                	jmp    9fa9 <hyperinterval::float::F32Enclosure::new+0x69>
    9ffb:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
    a001:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
    a005:	89 43 08             	mov    %eax,0x8(%rbx)
    a008:	eb a5                	jmp    9faf <hyperinterval::float::F32Enclosure::new+0x6f>
    a00a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

hyperinterval::float::F32Enclosure::point:
    a010:	53                   	push   %rbx
    a011:	48 83 ec 10          	sub    $0x10,%rsp
    a015:	48 89 fb             	mov    %rdi,%rbx
    a018:	66 0f 7e c1          	movd   %xmm0,%ecx
    a01c:	48 89 e7             	mov    %rsp,%rdi
    a01f:	be 00 00 00 80       	mov    $0x80000000,%esi
    a024:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a029:	e8 a2 43 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    a02e:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    a032:	75 0f                	jne    a043 <hyperinterval::float::F32Enclosure::point+0x33>
    a034:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    a039:	88 43 04             	mov    %al,0x4(%rbx)
    a03c:	b8 02 00 00 00       	mov    $0x2,%eax
    a041:	eb 0f                	jmp    a052 <hyperinterval::float::F32Enclosure::point+0x42>
    a043:	8b 44 24 08          	mov    0x8(%rsp),%eax
    a047:	89 43 04             	mov    %eax,0x4(%rbx)
    a04a:	89 43 08             	mov    %eax,0x8(%rbx)
    a04d:	b8 01 00 00 00       	mov    $0x1,%eax
    a052:	89 03                	mov    %eax,(%rbx)
    a054:	48 89 d8             	mov    %rbx,%rax
    a057:	48 83 c4 10          	add    $0x10,%rsp
    a05b:	5b                   	pop    %rbx
    a05c:	c3                   	ret
    a05d:	0f 1f 00             	nopl   (%rax)

hyperinterval::float::F32Enclosure::from_bits:
    a060:	41 57                	push   %r15
    a062:	41 56                	push   %r14
    a064:	41 54                	push   %r12
    a066:	53                   	push   %rbx
    a067:	48 83 ec 18          	sub    $0x18,%rsp
    a06b:	49 89 d6             	mov    %rdx,%r14
    a06e:	48 89 fb             	mov    %rdi,%rbx
    a071:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
    a077:	89 f1                	mov    %esi,%ecx
    a079:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    a07e:	be 00 00 00 80       	mov    $0x80000000,%esi
    a083:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a088:	e8 43 43 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    a08d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    a092:	74 23                	je     a0b7 <hyperinterval::float::F32Enclosure::from_bits+0x57>
    a094:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    a099:	44 89 f1             	mov    %r14d,%ecx
    a09c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    a0a1:	be 00 00 00 80       	mov    $0x80000000,%esi
    a0a6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a0ab:	e8 20 43 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    a0b0:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    a0b5:	75 1a                	jne    a0d1 <hyperinterval::float::F32Enclosure::from_bits+0x71>
    a0b7:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
    a0bc:	88 43 04             	mov    %al,0x4(%rbx)
    a0bf:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    a0c5:	48 83 c4 18          	add    $0x18,%rsp
    a0c9:	5b                   	pop    %rbx
    a0ca:	41 5c                	pop    %r12
    a0cc:	41 5e                	pop    %r14
    a0ce:	41 5f                	pop    %r15
    a0d0:	c3                   	ret
    a0d1:	8b 44 24 10          	mov    0x10(%rsp),%eax
    a0d5:	44 89 e1             	mov    %r12d,%ecx
    a0d8:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    a0de:	89 c2                	mov    %eax,%edx
    a0e0:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    a0e6:	be 00 00 00 80       	mov    $0x80000000,%esi
    a0eb:	29 ce                	sub    %ecx,%esi
    a0ed:	44 09 f9             	or     %r15d,%ecx
    a0f0:	45 85 e4             	test   %r12d,%r12d
    a0f3:	48 0f 49 f1          	cmovns %rcx,%rsi
    a0f7:	89 d1                	mov    %edx,%ecx
    a0f9:	44 09 f9             	or     %r15d,%ecx
    a0fc:	41 29 d7             	sub    %edx,%r15d
    a0ff:	85 c0                	test   %eax,%eax
    a101:	4c 0f 49 f9          	cmovns %rcx,%r15
    a105:	44 39 fe             	cmp    %r15d,%esi
    a108:	76 06                	jbe    a110 <hyperinterval::float::F32Enclosure::from_bits+0xb0>
    a10a:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
    a10e:	eb af                	jmp    a0bf <hyperinterval::float::F32Enclosure::from_bits+0x5f>
    a110:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
    a116:	44 89 63 04          	mov    %r12d,0x4(%rbx)
    a11a:	89 43 08             	mov    %eax,0x8(%rbx)
    a11d:	eb a6                	jmp    a0c5 <hyperinterval::float::F32Enclosure::from_bits+0x65>
    a11f:	90                   	nop

hyperinterval::float::F32Enclosure::contains_point:
    a120:	41 56                	push   %r14
    a122:	53                   	push   %rbx
    a123:	48 83 ec 18          	sub    $0x18,%rsp
    a127:	48 89 fb             	mov    %rdi,%rbx
    a12a:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
    a130:	66 0f 7e c1          	movd   %xmm0,%ecx
    a134:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    a139:	be 00 00 00 80       	mov    $0x80000000,%esi
    a13e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a143:	e8 88 42 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    a148:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
    a14d:	3c 01                	cmp    $0x1,%al
    a14f:	75 0d                	jne    a15e <hyperinterval::float::F32Enclosure::contains_point+0x3e>
    a151:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
    a156:	48 83 c4 18          	add    $0x18,%rsp
    a15a:	5b                   	pop    %rbx
    a15b:	41 5e                	pop    %r14
    a15d:	c3                   	ret
    a15e:	f6 03 01             	testb  $0x1,(%rbx)
    a161:	74 44                	je     a1a7 <hyperinterval::float::F32Enclosure::contains_point+0x87>
    a163:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    a168:	8b 73 04             	mov    0x4(%rbx),%esi
    a16b:	89 d1                	mov    %edx,%ecx
    a16d:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    a173:	89 f7                	mov    %esi,%edi
    a175:	44 09 f7             	or     %r14d,%edi
    a178:	41 89 f0             	mov    %esi,%r8d
    a17b:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
    a182:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
    a188:	45 29 c1             	sub    %r8d,%r9d
    a18b:	85 f6                	test   %esi,%esi
    a18d:	4c 0f 49 cf          	cmovns %rdi,%r9
    a191:	be 00 00 00 80       	mov    $0x80000000,%esi
    a196:	48 29 ce             	sub    %rcx,%rsi
    a199:	4c 09 f1             	or     %r14,%rcx
    a19c:	85 d2                	test   %edx,%edx
    a19e:	48 0f 48 ce          	cmovs  %rsi,%rcx
    a1a2:	41 39 c9             	cmp    %ecx,%r9d
    a1a5:	76 0a                	jbe    a1b1 <hyperinterval::float::F32Enclosure::contains_point+0x91>
    a1a7:	31 d2                	xor    %edx,%edx
    a1a9:	48 83 c4 18          	add    $0x18,%rsp
    a1ad:	5b                   	pop    %rbx
    a1ae:	41 5e                	pop    %r14
    a1b0:	c3                   	ret
    a1b1:	8b 53 08             	mov    0x8(%rbx),%edx
    a1b4:	89 d6                	mov    %edx,%esi
    a1b6:	44 09 f6             	or     %r14d,%esi
    a1b9:	89 d7                	mov    %edx,%edi
    a1bb:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    a1c1:	41 29 fe             	sub    %edi,%r14d
    a1c4:	85 d2                	test   %edx,%edx
    a1c6:	4c 0f 49 f6          	cmovns %rsi,%r14
    a1ca:	44 39 f1             	cmp    %r14d,%ecx
    a1cd:	0f 96 c2             	setbe  %dl
    a1d0:	48 83 c4 18          	add    $0x18,%rsp
    a1d4:	5b                   	pop    %rbx
    a1d5:	41 5e                	pop    %r14
    a1d7:	c3                   	ret
    a1d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    a1df:	00 

hyperinterval::float::F32Enclosure::subset_of:
    a1e0:	b0 01                	mov    $0x1,%al
    a1e2:	f6 07 01             	testb  $0x1,(%rdi)
    a1e5:	74 53                	je     a23a <hyperinterval::float::F32Enclosure::subset_of+0x5a>
    a1e7:	f6 06 01             	testb  $0x1,(%rsi)
    a1ea:	74 4c                	je     a238 <hyperinterval::float::F32Enclosure::subset_of+0x58>
    a1ec:	8b 4f 04             	mov    0x4(%rdi),%ecx
    a1ef:	8b 56 04             	mov    0x4(%rsi),%edx
    a1f2:	b8 00 00 00 80       	mov    $0x80000000,%eax
    a1f7:	41 89 d0             	mov    %edx,%r8d
    a1fa:	41 09 c0             	or     %eax,%r8d
    a1fd:	41 89 d1             	mov    %edx,%r9d
    a200:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a207:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a20d:	45 29 ca             	sub    %r9d,%r10d
    a210:	85 d2                	test   %edx,%edx
    a212:	4d 0f 49 d0          	cmovns %r8,%r10
    a216:	89 ca                	mov    %ecx,%edx
    a218:	09 c2                	or     %eax,%edx
    a21a:	41 89 c8             	mov    %ecx,%r8d
    a21d:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
    a224:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
    a22a:	45 29 c1             	sub    %r8d,%r9d
    a22d:	85 c9                	test   %ecx,%ecx
    a22f:	4c 0f 49 ca          	cmovns %rdx,%r9
    a233:	45 39 ca             	cmp    %r9d,%r10d
    a236:	76 03                	jbe    a23b <hyperinterval::float::F32Enclosure::subset_of+0x5b>
    a238:	31 c0                	xor    %eax,%eax
    a23a:	c3                   	ret
    a23b:	8b 4f 08             	mov    0x8(%rdi),%ecx
    a23e:	8b 56 08             	mov    0x8(%rsi),%edx
    a241:	89 ce                	mov    %ecx,%esi
    a243:	09 c6                	or     %eax,%esi
    a245:	89 cf                	mov    %ecx,%edi
    a247:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    a24d:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    a253:	41 29 f8             	sub    %edi,%r8d
    a256:	85 c9                	test   %ecx,%ecx
    a258:	4c 0f 49 c6          	cmovns %rsi,%r8
    a25c:	89 d1                	mov    %edx,%ecx
    a25e:	09 c1                	or     %eax,%ecx
    a260:	89 d6                	mov    %edx,%esi
    a262:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    a268:	29 f0                	sub    %esi,%eax
    a26a:	85 d2                	test   %edx,%edx
    a26c:	48 0f 49 c1          	cmovns %rcx,%rax
    a270:	41 39 c0             	cmp    %eax,%r8d
    a273:	0f 96 c0             	setbe  %al
    a276:	c3                   	ret
    a277:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    a27e:	00 00 

hyperinterval::float::F32Enclosure::interior_subset_of:
    a280:	b0 01                	mov    $0x1,%al
    a282:	f6 07 01             	testb  $0x1,(%rdi)
    a285:	0f 84 93 00 00 00    	je     a31e <hyperinterval::float::F32Enclosure::interior_subset_of+0x9e>
    a28b:	f6 06 01             	testb  $0x1,(%rsi)
    a28e:	0f 84 88 00 00 00    	je     a31c <hyperinterval::float::F32Enclosure::interior_subset_of+0x9c>
    a294:	8b 4f 04             	mov    0x4(%rdi),%ecx
    a297:	8b 56 04             	mov    0x4(%rsi),%edx
    a29a:	b8 00 00 00 80       	mov    $0x80000000,%eax
    a29f:	41 89 d0             	mov    %edx,%r8d
    a2a2:	41 09 c0             	or     %eax,%r8d
    a2a5:	41 89 d1             	mov    %edx,%r9d
    a2a8:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a2af:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a2b5:	45 29 ca             	sub    %r9d,%r10d
    a2b8:	85 d2                	test   %edx,%edx
    a2ba:	4d 0f 49 d0          	cmovns %r8,%r10
    a2be:	89 ca                	mov    %ecx,%edx
    a2c0:	09 c2                	or     %eax,%edx
    a2c2:	41 89 c8             	mov    %ecx,%r8d
    a2c5:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
    a2cc:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
    a2d2:	45 29 c1             	sub    %r8d,%r9d
    a2d5:	85 c9                	test   %ecx,%ecx
    a2d7:	4c 0f 49 ca          	cmovns %rdx,%r9
    a2db:	45 39 ca             	cmp    %r9d,%r10d
    a2de:	73 3c                	jae    a31c <hyperinterval::float::F32Enclosure::interior_subset_of+0x9c>
    a2e0:	8b 4f 08             	mov    0x8(%rdi),%ecx
    a2e3:	8b 56 08             	mov    0x8(%rsi),%edx
    a2e6:	89 ce                	mov    %ecx,%esi
    a2e8:	09 c6                	or     %eax,%esi
    a2ea:	89 cf                	mov    %ecx,%edi
    a2ec:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    a2f2:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    a2f8:	41 29 f8             	sub    %edi,%r8d
    a2fb:	85 c9                	test   %ecx,%ecx
    a2fd:	4c 0f 49 c6          	cmovns %rsi,%r8
    a301:	89 d1                	mov    %edx,%ecx
    a303:	09 c1                	or     %eax,%ecx
    a305:	89 d6                	mov    %edx,%esi
    a307:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    a30d:	29 f0                	sub    %esi,%eax
    a30f:	85 d2                	test   %edx,%edx
    a311:	48 0f 49 c1          	cmovns %rcx,%rax
    a315:	41 39 c0             	cmp    %eax,%r8d
    a318:	0f 92 c0             	setb   %al
    a31b:	c3                   	ret
    a31c:	31 c0                	xor    %eax,%eax
    a31e:	c3                   	ret
    a31f:	90                   	nop

hyperinterval::float::F32Enclosure::disjoint:
    a320:	83 3f 00             	cmpl   $0x0,(%rdi)
    a323:	0f 94 c0             	sete   %al
    a326:	8b 0e                	mov    (%rsi),%ecx
    a328:	85 c9                	test   %ecx,%ecx
    a32a:	0f 94 c2             	sete   %dl
    a32d:	08 c2                	or     %al,%dl
    a32f:	b0 01                	mov    $0x1,%al
    a331:	74 01                	je     a334 <hyperinterval::float::F32Enclosure::disjoint+0x14>
    a333:	c3                   	ret
    a334:	f6 c1 01             	test   $0x1,%cl
    a337:	0f 84 8c 00 00 00    	je     a3c9 <hyperinterval::float::F32Enclosure::disjoint+0xa9>
    a33d:	b9 00 00 00 80       	mov    $0x80000000,%ecx
    a342:	8b 56 04             	mov    0x4(%rsi),%edx
    a345:	44 8b 47 08          	mov    0x8(%rdi),%r8d
    a349:	45 89 c1             	mov    %r8d,%r9d
    a34c:	41 09 c9             	or     %ecx,%r9d
    a34f:	45 89 c2             	mov    %r8d,%r10d
    a352:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
    a359:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
    a35f:	45 29 d3             	sub    %r10d,%r11d
    a362:	45 85 c0             	test   %r8d,%r8d
    a365:	4d 0f 49 d9          	cmovns %r9,%r11
    a369:	41 89 d0             	mov    %edx,%r8d
    a36c:	41 09 c8             	or     %ecx,%r8d
    a36f:	41 89 d1             	mov    %edx,%r9d
    a372:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a379:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a37f:	45 29 ca             	sub    %r9d,%r10d
    a382:	85 d2                	test   %edx,%edx
    a384:	4d 0f 49 d0          	cmovns %r8,%r10
    a388:	45 39 d3             	cmp    %r10d,%r11d
    a38b:	72 a6                	jb     a333 <hyperinterval::float::F32Enclosure::disjoint+0x13>
    a38d:	8b 47 04             	mov    0x4(%rdi),%eax
    a390:	8b 56 08             	mov    0x8(%rsi),%edx
    a393:	89 d6                	mov    %edx,%esi
    a395:	09 ce                	or     %ecx,%esi
    a397:	89 d7                	mov    %edx,%edi
    a399:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    a39f:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    a3a5:	41 29 f8             	sub    %edi,%r8d
    a3a8:	85 d2                	test   %edx,%edx
    a3aa:	4c 0f 49 c6          	cmovns %rsi,%r8
    a3ae:	89 c2                	mov    %eax,%edx
    a3b0:	09 ca                	or     %ecx,%edx
    a3b2:	89 c6                	mov    %eax,%esi
    a3b4:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    a3ba:	29 f1                	sub    %esi,%ecx
    a3bc:	85 c0                	test   %eax,%eax
    a3be:	48 0f 49 ca          	cmovns %rdx,%rcx
    a3c2:	41 39 c8             	cmp    %ecx,%r8d
    a3c5:	0f 92 c0             	setb   %al
    a3c8:	c3                   	ret
    a3c9:	31 c0                	xor    %eax,%eax
    a3cb:	c3                   	ret
    a3cc:	0f 1f 40 00          	nopl   0x0(%rax)

hyperinterval::float::F32Enclosure::overlaps:
    a3d0:	83 3f 00             	cmpl   $0x0,(%rdi)
    a3d3:	0f 94 c0             	sete   %al
    a3d6:	8b 0e                	mov    (%rsi),%ecx
    a3d8:	85 c9                	test   %ecx,%ecx
    a3da:	0f 94 c2             	sete   %dl
    a3dd:	08 c2                	or     %al,%dl
    a3df:	74 03                	je     a3e4 <hyperinterval::float::F32Enclosure::overlaps+0x14>
    a3e1:	31 c0                	xor    %eax,%eax
    a3e3:	c3                   	ret
    a3e4:	b0 01                	mov    $0x1,%al
    a3e6:	f6 c1 01             	test   $0x1,%cl
    a3e9:	0f 84 8a 00 00 00    	je     a479 <hyperinterval::float::F32Enclosure::overlaps+0xa9>
    a3ef:	b8 00 00 00 80       	mov    $0x80000000,%eax
    a3f4:	8b 4e 04             	mov    0x4(%rsi),%ecx
    a3f7:	8b 57 08             	mov    0x8(%rdi),%edx
    a3fa:	41 89 d0             	mov    %edx,%r8d
    a3fd:	41 09 c0             	or     %eax,%r8d
    a400:	41 89 d1             	mov    %edx,%r9d
    a403:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a40a:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a410:	45 29 ca             	sub    %r9d,%r10d
    a413:	85 d2                	test   %edx,%edx
    a415:	4d 0f 49 d0          	cmovns %r8,%r10
    a419:	89 ca                	mov    %ecx,%edx
    a41b:	09 c2                	or     %eax,%edx
    a41d:	41 89 c8             	mov    %ecx,%r8d
    a420:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
    a427:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
    a42d:	45 29 c1             	sub    %r8d,%r9d
    a430:	85 c9                	test   %ecx,%ecx
    a432:	4c 0f 49 ca          	cmovns %rdx,%r9
    a436:	45 39 ca             	cmp    %r9d,%r10d
    a439:	73 03                	jae    a43e <hyperinterval::float::F32Enclosure::overlaps+0x6e>
    a43b:	31 c0                	xor    %eax,%eax
    a43d:	c3                   	ret
    a43e:	8b 4f 04             	mov    0x4(%rdi),%ecx
    a441:	8b 56 08             	mov    0x8(%rsi),%edx
    a444:	89 d6                	mov    %edx,%esi
    a446:	09 c6                	or     %eax,%esi
    a448:	89 d7                	mov    %edx,%edi
    a44a:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    a450:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    a456:	41 29 f8             	sub    %edi,%r8d
    a459:	85 d2                	test   %edx,%edx
    a45b:	4c 0f 49 c6          	cmovns %rsi,%r8
    a45f:	89 ca                	mov    %ecx,%edx
    a461:	09 c2                	or     %eax,%edx
    a463:	89 ce                	mov    %ecx,%esi
    a465:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    a46b:	29 f0                	sub    %esi,%eax
    a46d:	85 c9                	test   %ecx,%ecx
    a46f:	48 0f 49 c2          	cmovns %rdx,%rax
    a473:	41 39 c0             	cmp    %eax,%r8d
    a476:	0f 93 c0             	setae  %al
    a479:	c3                   	ret
    a47a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

hyperinterval::float::F32Enclosure::hull:
    a480:	48 89 f8             	mov    %rdi,%rax
    a483:	44 8b 0e             	mov    (%rsi),%r9d
    a486:	44 8b 02             	mov    (%rdx),%r8d
    a489:	8b 7a 04             	mov    0x4(%rdx),%edi
    a48c:	8b 4a 08             	mov    0x8(%rdx),%ecx
    a48f:	41 f6 c1 01          	test   $0x1,%r9b
    a493:	0f 84 a1 00 00 00    	je     a53a <hyperinterval::float::F32Enclosure::hull+0xba>
    a499:	8b 56 04             	mov    0x4(%rsi),%edx
    a49c:	8b 76 08             	mov    0x8(%rsi),%esi
    a49f:	41 f6 c0 01          	test   $0x1,%r8b
    a4a3:	0f 84 9b 00 00 00    	je     a544 <hyperinterval::float::F32Enclosure::hull+0xc4>
    a4a9:	53                   	push   %rbx
    a4aa:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    a4b0:	41 89 d1             	mov    %edx,%r9d
    a4b3:	45 09 c1             	or     %r8d,%r9d
    a4b6:	41 89 d2             	mov    %edx,%r10d
    a4b9:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
    a4c0:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
    a4c6:	45 29 d3             	sub    %r10d,%r11d
    a4c9:	85 d2                	test   %edx,%edx
    a4cb:	4d 0f 49 d9          	cmovns %r9,%r11
    a4cf:	41 89 f9             	mov    %edi,%r9d
    a4d2:	45 09 c1             	or     %r8d,%r9d
    a4d5:	41 89 fa             	mov    %edi,%r10d
    a4d8:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
    a4df:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    a4e4:	44 29 d3             	sub    %r10d,%ebx
    a4e7:	85 ff                	test   %edi,%edi
    a4e9:	49 0f 49 d9          	cmovns %r9,%rbx
    a4ed:	41 39 db             	cmp    %ebx,%r11d
    a4f0:	0f 47 d7             	cmova  %edi,%edx
    a4f3:	89 f7                	mov    %esi,%edi
    a4f5:	44 09 c7             	or     %r8d,%edi
    a4f8:	41 89 f1             	mov    %esi,%r9d
    a4fb:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a502:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a508:	45 29 ca             	sub    %r9d,%r10d
    a50b:	85 f6                	test   %esi,%esi
    a50d:	4c 0f 49 d7          	cmovns %rdi,%r10
    a511:	89 cf                	mov    %ecx,%edi
    a513:	44 09 c7             	or     %r8d,%edi
    a516:	41 89 c9             	mov    %ecx,%r9d
    a519:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a520:	45 29 c8             	sub    %r9d,%r8d
    a523:	85 c9                	test   %ecx,%ecx
    a525:	4c 0f 49 c7          	cmovns %rdi,%r8
    a529:	45 39 c2             	cmp    %r8d,%r10d
    a52c:	0f 42 f1             	cmovb  %ecx,%esi
    a52f:	41 b8 01 00 00 00    	mov    $0x1,%r8d
    a535:	89 f1                	mov    %esi,%ecx
    a537:	89 d7                	mov    %edx,%edi
    a539:	5b                   	pop    %rbx
    a53a:	44 89 00             	mov    %r8d,(%rax)
    a53d:	89 78 04             	mov    %edi,0x4(%rax)
    a540:	89 48 08             	mov    %ecx,0x8(%rax)
    a543:	c3                   	ret
    a544:	89 f1                	mov    %esi,%ecx
    a546:	89 d7                	mov    %edx,%edi
    a548:	45 89 c8             	mov    %r9d,%r8d
    a54b:	44 89 00             	mov    %r8d,(%rax)
    a54e:	89 78 04             	mov    %edi,0x4(%rax)
    a551:	89 48 08             	mov    %ecx,0x8(%rax)
    a554:	c3                   	ret
    a555:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    a55c:	00 00 00 
    a55f:	90                   	nop

hyperinterval::float::F32Enclosure::intersection:
    a560:	48 89 f8             	mov    %rdi,%rax
    a563:	45 31 c9             	xor    %r9d,%r9d
    a566:	f6 06 01             	testb  $0x1,(%rsi)
    a569:	0f 84 ed 00 00 00    	je     a65c <hyperinterval::float::F32Enclosure::intersection+0xfc>
    a56f:	f6 02 01             	testb  $0x1,(%rdx)
    a572:	0f 84 d9 00 00 00    	je     a651 <hyperinterval::float::F32Enclosure::intersection+0xf1>
    a578:	53                   	push   %rbx
    a579:	8b 4e 04             	mov    0x4(%rsi),%ecx
    a57c:	44 8b 4a 04          	mov    0x4(%rdx),%r9d
    a580:	bf 00 00 00 80       	mov    $0x80000000,%edi
    a585:	41 89 c8             	mov    %ecx,%r8d
    a588:	41 09 f8             	or     %edi,%r8d
    a58b:	41 89 ca             	mov    %ecx,%r10d
    a58e:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
    a595:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
    a59b:	45 29 d3             	sub    %r10d,%r11d
    a59e:	85 c9                	test   %ecx,%ecx
    a5a0:	4d 0f 49 d8          	cmovns %r8,%r11
    a5a4:	45 89 c8             	mov    %r9d,%r8d
    a5a7:	41 09 f8             	or     %edi,%r8d
    a5aa:	45 89 ca             	mov    %r9d,%r10d
    a5ad:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
    a5b4:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    a5b9:	44 29 d3             	sub    %r10d,%ebx
    a5bc:	45 85 c9             	test   %r9d,%r9d
    a5bf:	49 0f 49 d8          	cmovns %r8,%rbx
    a5c3:	44 8b 46 08          	mov    0x8(%rsi),%r8d
    a5c7:	41 39 db             	cmp    %ebx,%r11d
    a5ca:	41 0f 42 c9          	cmovb  %r9d,%ecx
    a5ce:	8b 52 08             	mov    0x8(%rdx),%edx
    a5d1:	44 89 c6             	mov    %r8d,%esi
    a5d4:	09 fe                	or     %edi,%esi
    a5d6:	45 89 c1             	mov    %r8d,%r9d
    a5d9:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a5e0:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a5e6:	45 29 ca             	sub    %r9d,%r10d
    a5e9:	45 85 c0             	test   %r8d,%r8d
    a5ec:	4c 0f 49 d6          	cmovns %rsi,%r10
    a5f0:	89 d6                	mov    %edx,%esi
    a5f2:	09 fe                	or     %edi,%esi
    a5f4:	41 89 d1             	mov    %edx,%r9d
    a5f7:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a5fe:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
    a604:	45 29 cb             	sub    %r9d,%r11d
    a607:	85 d2                	test   %edx,%edx
    a609:	4c 0f 49 de          	cmovns %rsi,%r11
    a60d:	45 39 da             	cmp    %r11d,%r10d
    a610:	44 0f 47 c2          	cmova  %edx,%r8d
    a614:	89 ca                	mov    %ecx,%edx
    a616:	09 fa                	or     %edi,%edx
    a618:	89 ce                	mov    %ecx,%esi
    a61a:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    a620:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a626:	41 29 f2             	sub    %esi,%r10d
    a629:	85 c9                	test   %ecx,%ecx
    a62b:	4c 0f 49 d2          	cmovns %rdx,%r10
    a62f:	44 89 c2             	mov    %r8d,%edx
    a632:	09 fa                	or     %edi,%edx
    a634:	44 89 c6             	mov    %r8d,%esi
    a637:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    a63d:	29 f7                	sub    %esi,%edi
    a63f:	45 85 c0             	test   %r8d,%r8d
    a642:	48 0f 49 fa          	cmovns %rdx,%rdi
    a646:	45 31 c9             	xor    %r9d,%r9d
    a649:	41 39 fa             	cmp    %edi,%r10d
    a64c:	41 0f 96 c1          	setbe  %r9b
    a650:	5b                   	pop    %rbx
    a651:	44 89 08             	mov    %r9d,(%rax)
    a654:	89 48 04             	mov    %ecx,0x4(%rax)
    a657:	44 89 40 08          	mov    %r8d,0x8(%rax)
    a65b:	c3                   	ret
    a65c:	44 89 08             	mov    %r9d,(%rax)
    a65f:	89 48 04             	mov    %ecx,0x4(%rax)
    a662:	44 89 40 08          	mov    %r8d,0x8(%rax)
    a666:	c3                   	ret
    a667:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    a66e:	00 00 

hyperinterval::float::F32Enclosure::signs:
    a670:	f6 07 01             	testb  $0x1,(%rdi)
    a673:	0f 84 84 00 00 00    	je     a6fd <hyperinterval::float::F32Enclosure::signs+0x8d>
    a679:	b8 00 00 00 80       	mov    $0x80000000,%eax
    a67e:	8b 57 04             	mov    0x4(%rdi),%edx
    a681:	8b 4f 08             	mov    0x8(%rdi),%ecx
    a684:	48 89 d6             	mov    %rdx,%rsi
    a687:	48 09 c6             	or     %rax,%rsi
    a68a:	89 d7                	mov    %edx,%edi
    a68c:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    a692:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a698:	49 29 fa             	sub    %rdi,%r10
    a69b:	85 d2                	test   %edx,%edx
    a69d:	4c 0f 49 d6          	cmovns %rsi,%r10
    a6a1:	45 31 c0             	xor    %r8d,%r8d
    a6a4:	41 f7 c2 00 00 00 80 	test   $0x80000000,%r10d
    a6ab:	40 0f 94 c6          	sete   %sil
    a6af:	48 89 ca             	mov    %rcx,%rdx
    a6b2:	48 09 c2             	or     %rax,%rdx
    a6b5:	41 89 c9             	mov    %ecx,%r9d
    a6b8:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a6bf:	bf 00 00 00 80       	mov    $0x80000000,%edi
    a6c4:	4c 29 cf             	sub    %r9,%rdi
    a6c7:	49 39 c2             	cmp    %rax,%r10
    a6ca:	77 1b                	ja     a6e7 <hyperinterval::float::F32Enclosure::signs+0x77>
    a6cc:	44 8d 56 02          	lea    0x2(%rsi),%r10d
    a6d0:	4d 85 c9             	test   %r9,%r9
    a6d3:	41 88 f0             	mov    %sil,%r8b
    a6d6:	41 0f b6 f2          	movzbl %r10b,%esi
    a6da:	44 0f 44 c6          	cmove  %esi,%r8d
    a6de:	85 c9                	test   %ecx,%ecx
    a6e0:	44 0f 49 c6          	cmovns %esi,%r8d
    a6e4:	44 89 c6             	mov    %r8d,%esi
    a6e7:	85 c9                	test   %ecx,%ecx
    a6e9:	48 0f 48 d7          	cmovs  %rdi,%rdx
    a6ed:	8d 4e 04             	lea    0x4(%rsi),%ecx
    a6f0:	39 c2                	cmp    %eax,%edx
    a6f2:	40 0f b6 d6          	movzbl %sil,%edx
    a6f6:	0f b6 c1             	movzbl %cl,%eax
    a6f9:	0f 46 c2             	cmovbe %edx,%eax
    a6fc:	c3                   	ret
    a6fd:	31 c0                	xor    %eax,%eax
    a6ff:	c3                   	ret

hyperinterval::float::F32Enclosure::abs:
    a700:	48 89 f8             	mov    %rdi,%rax
    a703:	f6 06 01             	testb  $0x1,(%rsi)
    a706:	74 24                	je     a72c <hyperinterval::float::F32Enclosure::abs+0x2c>
    a708:	8b 4e 04             	mov    0x4(%rsi),%ecx
    a70b:	85 c9                	test   %ecx,%ecx
    a70d:	0f 99 c2             	setns  %dl
    a710:	f7 c1 ff ff ff 7f    	test   $0x7fffffff,%ecx
    a716:	40 0f 94 c7          	sete   %dil
    a71a:	40 08 d7             	or     %dl,%dil
    a71d:	74 14                	je     a733 <hyperinterval::float::F32Enclosure::abs+0x33>
    a71f:	8b 4e 08             	mov    0x8(%rsi),%ecx
    a722:	89 48 08             	mov    %ecx,0x8(%rax)
    a725:	48 8b 0e             	mov    (%rsi),%rcx
    a728:	48 89 08             	mov    %rcx,(%rax)
    a72b:	c3                   	ret
    a72c:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
    a732:	c3                   	ret
    a733:	8b 56 08             	mov    0x8(%rsi),%edx
    a736:	85 d2                	test   %edx,%edx
    a738:	40 0f 98 c7          	sets   %dil
    a73c:	48 89 d6             	mov    %rdx,%rsi
    a73f:	48 81 e6 ff ff ff 7f 	and    $0x7fffffff,%rsi
    a746:	41 0f 95 c0          	setne  %r8b
    a74a:	44 84 c7             	test   %r8b,%dil
    a74d:	74 19                	je     a768 <hyperinterval::float::F32Enclosure::abs+0x68>
    a74f:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    a755:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    a75b:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
    a761:	89 50 04             	mov    %edx,0x4(%rax)
    a764:	89 48 08             	mov    %ecx,0x8(%rax)
    a767:	c3                   	ret
    a768:	89 cf                	mov    %ecx,%edi
    a76a:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    a770:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    a776:	41 89 d1             	mov    %edx,%r9d
    a779:	45 09 c1             	or     %r8d,%r9d
    a77c:	41 29 f0             	sub    %esi,%r8d
    a77f:	85 d2                	test   %edx,%edx
    a781:	4d 0f 49 c1          	cmovns %r9,%r8
    a785:	41 39 c8             	cmp    %ecx,%r8d
    a788:	0f 43 fa             	cmovae %edx,%edi
    a78b:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
    a792:	89 78 08             	mov    %edi,0x8(%rax)
    a795:	c3                   	ret
    a796:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    a79d:	00 00 00 

hyperinterval::float::F32Enclosure::min_image:
    a7a0:	48 89 f8             	mov    %rdi,%rax
    a7a3:	31 c9                	xor    %ecx,%ecx
    a7a5:	f6 06 01             	testb  $0x1,(%rsi)
    a7a8:	0f 84 d8 00 00 00    	je     a886 <hyperinterval::float::F32Enclosure::min_image+0xe6>
    a7ae:	f6 02 01             	testb  $0x1,(%rdx)
    a7b1:	0f 84 c7 00 00 00    	je     a87e <hyperinterval::float::F32Enclosure::min_image+0xde>
    a7b7:	f3 0f 7e 4e 04       	movq   0x4(%rsi),%xmm1
    a7bc:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
    a7c1:	66 0f ef d2          	pxor   %xmm2,%xmm2
    a7c5:	66 0f 6f e1          	movdqa %xmm1,%xmm4
    a7c9:	66 0f 62 e2          	punpckldq %xmm2,%xmm4
    a7cd:	66 0f 6f e8          	movdqa %xmm0,%xmm5
    a7d1:	66 0f 62 ea          	punpckldq %xmm2,%xmm5
    a7d5:	66 0f 70 f1 50       	pshufd $0x50,%xmm1,%xmm6
    a7da:	66 0f ef db          	pxor   %xmm3,%xmm3
    a7de:	66 0f 66 de          	pcmpgtd %xmm6,%xmm3
    a7e2:	66 0f 70 f0 50       	pshufd $0x50,%xmm0,%xmm6
    a7e7:	66 0f 66 d6          	pcmpgtd %xmm6,%xmm2
    a7eb:	66 0f 6f 35 1d 2b 04 	movdqa 0x42b1d(%rip),%xmm6        # 4d310 <_fini+0x7f4>
    a7f2:	00 
    a7f3:	66 0f 6f fc          	movdqa %xmm4,%xmm7
    a7f7:	66 0f eb fe          	por    %xmm6,%xmm7
    a7fb:	66 44 0f 6f 05 1c 2b 	movdqa 0x42b1c(%rip),%xmm8        # 4d320 <_fini+0x804>
    a802:	04 00 
    a804:	66 41 0f db e0       	pand   %xmm8,%xmm4
    a809:	66 44 0f 6f ce       	movdqa %xmm6,%xmm9
    a80e:	66 44 0f fb cc       	psubq  %xmm4,%xmm9
    a813:	66 44 0f db cb       	pand   %xmm3,%xmm9
    a818:	66 0f df df          	pandn  %xmm7,%xmm3
    a81c:	66 41 0f eb d9       	por    %xmm9,%xmm3
    a821:	66 0f 6f e5          	movdqa %xmm5,%xmm4
    a825:	66 0f eb e6          	por    %xmm6,%xmm4
    a829:	66 41 0f db e8       	pand   %xmm8,%xmm5
    a82e:	66 0f 6f fe          	movdqa %xmm6,%xmm7
    a832:	66 0f fb fd          	psubq  %xmm5,%xmm7
    a836:	66 0f db fa          	pand   %xmm2,%xmm7
    a83a:	66 0f df d4          	pandn  %xmm4,%xmm2
    a83e:	66 0f eb d7          	por    %xmm7,%xmm2
    a842:	66 0f ef d6          	pxor   %xmm6,%xmm2
    a846:	66 0f ef de          	pxor   %xmm6,%xmm3
    a84a:	66 0f 6f e3          	movdqa %xmm3,%xmm4
    a84e:	66 0f 66 e2          	pcmpgtd %xmm2,%xmm4
    a852:	66 0f 70 ec e8       	pshufd $0xe8,%xmm4,%xmm5
    a857:	66 0f 76 da          	pcmpeqd %xmm2,%xmm3
    a85b:	66 0f 70 db fd       	pshufd $0xfd,%xmm3,%xmm3
    a860:	66 0f db dd          	pand   %xmm5,%xmm3
    a864:	66 0f 70 d4 fd       	pshufd $0xfd,%xmm4,%xmm2
    a869:	66 0f eb d3          	por    %xmm3,%xmm2
    a86d:	66 0f db c2          	pand   %xmm2,%xmm0
    a871:	66 0f df d1          	pandn  %xmm1,%xmm2
    a875:	66 0f eb d0          	por    %xmm0,%xmm2
    a879:	b9 01 00 00 00       	mov    $0x1,%ecx
    a87e:	89 08                	mov    %ecx,(%rax)
    a880:	66 0f d6 50 04       	movq   %xmm2,0x4(%rax)
    a885:	c3                   	ret
    a886:	89 08                	mov    %ecx,(%rax)
    a888:	0f 13 50 04          	movlps %xmm2,0x4(%rax)
    a88c:	c3                   	ret
    a88d:	0f 1f 00             	nopl   (%rax)

hyperinterval::float::F32Enclosure::max_image:
    a890:	48 89 f8             	mov    %rdi,%rax
    a893:	31 c9                	xor    %ecx,%ecx
    a895:	f6 06 01             	testb  $0x1,(%rsi)
    a898:	0f 84 d8 00 00 00    	je     a976 <hyperinterval::float::F32Enclosure::max_image+0xe6>
    a89e:	f6 02 01             	testb  $0x1,(%rdx)
    a8a1:	0f 84 c7 00 00 00    	je     a96e <hyperinterval::float::F32Enclosure::max_image+0xde>
    a8a7:	f3 0f 7e 4e 04       	movq   0x4(%rsi),%xmm1
    a8ac:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
    a8b1:	66 0f ef d2          	pxor   %xmm2,%xmm2
    a8b5:	66 0f 6f e1          	movdqa %xmm1,%xmm4
    a8b9:	66 0f 62 e2          	punpckldq %xmm2,%xmm4
    a8bd:	66 0f 6f e8          	movdqa %xmm0,%xmm5
    a8c1:	66 0f 62 ea          	punpckldq %xmm2,%xmm5
    a8c5:	66 0f 70 f1 50       	pshufd $0x50,%xmm1,%xmm6
    a8ca:	66 0f ef db          	pxor   %xmm3,%xmm3
    a8ce:	66 0f 66 de          	pcmpgtd %xmm6,%xmm3
    a8d2:	66 0f 70 f0 50       	pshufd $0x50,%xmm0,%xmm6
    a8d7:	66 0f 66 d6          	pcmpgtd %xmm6,%xmm2
    a8db:	66 0f 6f 35 2d 2a 04 	movdqa 0x42a2d(%rip),%xmm6        # 4d310 <_fini+0x7f4>
    a8e2:	00 
    a8e3:	66 0f 6f fc          	movdqa %xmm4,%xmm7
    a8e7:	66 0f eb fe          	por    %xmm6,%xmm7
    a8eb:	66 44 0f 6f 05 2c 2a 	movdqa 0x42a2c(%rip),%xmm8        # 4d320 <_fini+0x804>
    a8f2:	04 00 
    a8f4:	66 41 0f db e0       	pand   %xmm8,%xmm4
    a8f9:	66 44 0f 6f ce       	movdqa %xmm6,%xmm9
    a8fe:	66 44 0f fb cc       	psubq  %xmm4,%xmm9
    a903:	66 44 0f db cb       	pand   %xmm3,%xmm9
    a908:	66 0f df df          	pandn  %xmm7,%xmm3
    a90c:	66 41 0f eb d9       	por    %xmm9,%xmm3
    a911:	66 0f 6f e5          	movdqa %xmm5,%xmm4
    a915:	66 0f eb e6          	por    %xmm6,%xmm4
    a919:	66 41 0f db e8       	pand   %xmm8,%xmm5
    a91e:	66 0f 6f fe          	movdqa %xmm6,%xmm7
    a922:	66 0f fb fd          	psubq  %xmm5,%xmm7
    a926:	66 0f db fa          	pand   %xmm2,%xmm7
    a92a:	66 0f df d4          	pandn  %xmm4,%xmm2
    a92e:	66 0f eb d7          	por    %xmm7,%xmm2
    a932:	66 0f ef de          	pxor   %xmm6,%xmm3
    a936:	66 0f ef d6          	pxor   %xmm6,%xmm2
    a93a:	66 0f 6f e2          	movdqa %xmm2,%xmm4
    a93e:	66 0f 66 e3          	pcmpgtd %xmm3,%xmm4
    a942:	66 0f 70 ec e8       	pshufd $0xe8,%xmm4,%xmm5
    a947:	66 0f 76 d3          	pcmpeqd %xmm3,%xmm2
    a94b:	66 0f 70 da fd       	pshufd $0xfd,%xmm2,%xmm3
    a950:	66 0f db dd          	pand   %xmm5,%xmm3
    a954:	66 0f 70 d4 fd       	pshufd $0xfd,%xmm4,%xmm2
    a959:	66 0f eb d3          	por    %xmm3,%xmm2
    a95d:	66 0f db c2          	pand   %xmm2,%xmm0
    a961:	66 0f df d1          	pandn  %xmm1,%xmm2
    a965:	66 0f eb d0          	por    %xmm0,%xmm2
    a969:	b9 01 00 00 00       	mov    $0x1,%ecx
    a96e:	89 08                	mov    %ecx,(%rax)
    a970:	66 0f d6 50 04       	movq   %xmm2,0x4(%rax)
    a975:	c3                   	ret
    a976:	89 08                	mov    %ecx,(%rax)
    a978:	0f 13 50 04          	movlps %xmm2,0x4(%rax)
    a97c:	c3                   	ret
    a97d:	0f 1f 00             	nopl   (%rax)

hyperinterval::float::F32Enclosure::add:
    a980:	48 89 f8             	mov    %rdi,%rax
    a983:	f6 06 01             	testb  $0x1,(%rsi)
    a986:	0f 84 d6 00 00 00    	je     aa62 <hyperinterval::float::F32Enclosure::add+0xe2>
    a98c:	f6 02 01             	testb  $0x1,(%rdx)
    a98f:	0f 84 cd 00 00 00    	je     aa62 <hyperinterval::float::F32Enclosure::add+0xe2>
    a995:	41 57                	push   %r15
    a997:	41 56                	push   %r14
    a999:	41 55                	push   %r13
    a99b:	41 54                	push   %r12
    a99d:	53                   	push   %rbx
    a99e:	48 83 ec 20          	sub    $0x20,%rsp
    a9a2:	49 89 c4             	mov    %rax,%r12
    a9a5:	8b 5e 08             	mov    0x8(%rsi),%ebx
    a9a8:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
    a9ae:	44 8b 42 04          	mov    0x4(%rdx),%r8d
    a9b2:	44 8b 72 08          	mov    0x8(%rdx),%r14d
    a9b6:	8b 4e 04             	mov    0x4(%rsi),%ecx
    a9b9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    a9be:	be 00 00 00 80       	mov    $0x80000000,%esi
    a9c3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a9c8:	e8 53 3d 00 00       	call   e720 <hyperinterval::ieee::Format::add>
    a9cd:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    a9d2:	74 6b                	je     aa3f <hyperinterval::float::F32Enclosure::add+0xbf>
    a9d4:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
    a9d9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    a9de:	be 00 00 00 80       	mov    $0x80000000,%esi
    a9e3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a9e8:	48 89 d9             	mov    %rbx,%rcx
    a9eb:	4d 89 f0             	mov    %r14,%r8
    a9ee:	e8 2d 3d 00 00       	call   e720 <hyperinterval::ieee::Format::add>
    a9f3:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    a9f8:	74 45                	je     aa3f <hyperinterval::float::F32Enclosure::add+0xbf>
    a9fa:	8b 5c 24 18          	mov    0x18(%rsp),%ebx
    a9fe:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    aa03:	be 00 00 00 80       	mov    $0x80000000,%esi
    aa08:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    aa0d:	4c 89 f9             	mov    %r15,%rcx
    aa10:	e8 bb 39 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    aa15:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    aa1a:	74 23                	je     aa3f <hyperinterval::float::F32Enclosure::add+0xbf>
    aa1c:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
    aa21:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    aa26:	be 00 00 00 80       	mov    $0x80000000,%esi
    aa2b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    aa30:	48 89 d9             	mov    %rbx,%rcx
    aa33:	e8 98 39 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    aa38:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    aa3d:	75 2a                	jne    aa69 <hyperinterval::float::F32Enclosure::add+0xe9>
    aa3f:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
    aa44:	4c 89 e0             	mov    %r12,%rax
    aa47:	41 88 4c 24 04       	mov    %cl,0x4(%r12)
    aa4c:	41 c7 04 24 02 00 00 	movl   $0x2,(%r12)
    aa53:	00 
    aa54:	48 83 c4 20          	add    $0x20,%rsp
    aa58:	5b                   	pop    %rbx
    aa59:	41 5c                	pop    %r12
    aa5b:	41 5d                	pop    %r13
    aa5d:	41 5e                	pop    %r14
    aa5f:	41 5f                	pop    %r15
    aa61:	c3                   	ret
    aa62:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
    aa68:	c3                   	ret
    aa69:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
    aa6d:	44 89 f0             	mov    %r14d,%eax
    aa70:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    aa75:	89 ca                	mov    %ecx,%edx
    aa77:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    aa7d:	be 00 00 00 80       	mov    $0x80000000,%esi
    aa82:	29 c6                	sub    %eax,%esi
    aa84:	44 09 e8             	or     %r13d,%eax
    aa87:	45 85 f6             	test   %r14d,%r14d
    aa8a:	48 0f 49 f0          	cmovns %rax,%rsi
    aa8e:	89 d0                	mov    %edx,%eax
    aa90:	44 09 e8             	or     %r13d,%eax
    aa93:	41 29 d5             	sub    %edx,%r13d
    aa96:	85 c9                	test   %ecx,%ecx
    aa98:	4c 0f 49 e8          	cmovns %rax,%r13
    aa9c:	44 39 ee             	cmp    %r13d,%esi
    aa9f:	4c 89 e0             	mov    %r12,%rax
    aaa2:	76 0c                	jbe    aab0 <hyperinterval::float::F32Enclosure::add+0x130>
    aaa4:	c6 40 04 01          	movb   $0x1,0x4(%rax)
    aaa8:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
    aaae:	eb a4                	jmp    aa54 <hyperinterval::float::F32Enclosure::add+0xd4>
    aab0:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
    aab6:	44 89 70 04          	mov    %r14d,0x4(%rax)
    aaba:	89 48 08             	mov    %ecx,0x8(%rax)
    aabd:	eb 95                	jmp    aa54 <hyperinterval::float::F32Enclosure::add+0xd4>
    aabf:	90                   	nop

hyperinterval::float::F32Enclosure::sub:
    aac0:	53                   	push   %rbx
    aac1:	48 83 ec 10          	sub    $0x10,%rsp
    aac5:	48 89 fb             	mov    %rdi,%rbx
    aac8:	f6 02 01             	testb  $0x1,(%rdx)
    aacb:	74 29                	je     aaf6 <hyperinterval::float::F32Enclosure::sub+0x36>
    aacd:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
    aad2:	66 0f 70 c8 e1       	pshufd $0xe1,%xmm0,%xmm1
    aad7:	66 0f ef c0          	pxor   %xmm0,%xmm0
    aadb:	66 0f 6f 15 1d 28 04 	movdqa 0x4281d(%rip),%xmm2        # 4d300 <_fini+0x7e4>
    aae2:	00 
    aae3:	66 0f ef d1          	pxor   %xmm1,%xmm2
    aae7:	66 0f 76 c1          	pcmpeqd %xmm1,%xmm0
    aaeb:	66 0f df c2          	pandn  %xmm2,%xmm0
    aaef:	b8 01 00 00 00       	mov    $0x1,%eax
    aaf4:	eb 02                	jmp    aaf8 <hyperinterval::float::F32Enclosure::sub+0x38>
    aaf6:	31 c0                	xor    %eax,%eax
    aaf8:	89 44 24 04          	mov    %eax,0x4(%rsp)
    aafc:	66 0f d6 44 24 08    	movq   %xmm0,0x8(%rsp)
    ab02:	48 8d 54 24 04       	lea    0x4(%rsp),%rdx
    ab07:	48 89 df             	mov    %rbx,%rdi
    ab0a:	ff 15 d0 4b 05 00    	call   *0x54bd0(%rip)        # 5f6e0 <_GLOBAL_OFFSET_TABLE_+0x118>
    ab10:	48 89 d8             	mov    %rbx,%rax
    ab13:	48 83 c4 10          	add    $0x10,%rsp
    ab17:	5b                   	pop    %rbx
    ab18:	c3                   	ret
    ab19:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

hyperinterval::float::F32Enclosure::corner_image:
    ab20:	f6 06 01             	testb  $0x1,(%rsi)
    ab23:	0f 84 b4 03 00 00    	je     aedd <hyperinterval::float::F32Enclosure::corner_image+0x3bd>
    ab29:	f6 02 01             	testb  $0x1,(%rdx)
    ab2c:	0f 84 ab 03 00 00    	je     aedd <hyperinterval::float::F32Enclosure::corner_image+0x3bd>
    ab32:	55                   	push   %rbp
    ab33:	41 57                	push   %r15
    ab35:	41 56                	push   %r14
    ab37:	41 55                	push   %r13
    ab39:	41 54                	push   %r12
    ab3b:	53                   	push   %rbx
    ab3c:	48 83 ec 78          	sub    $0x78,%rsp
    ab40:	48 89 7c 24 60       	mov    %rdi,0x60(%rsp)
    ab45:	44 8b 62 04          	mov    0x4(%rdx),%r12d
    ab49:	8b 42 08             	mov    0x8(%rdx),%eax
    ab4c:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
    ab51:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
    ab55:	8b 46 08             	mov    0x8(%rsi),%eax
    ab58:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
    ab5d:	84 c9                	test   %cl,%cl
    ab5f:	0f 84 7f 03 00 00    	je     aee4 <hyperinterval::float::F32Enclosure::corner_image+0x3c4>
    ab65:	48 89 e7             	mov    %rsp,%rdi
    ab68:	be 00 00 00 80       	mov    $0x80000000,%esi
    ab6d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ab72:	4c 89 e9             	mov    %r13,%rcx
    ab75:	4d 89 e0             	mov    %r12,%r8
    ab78:	e8 33 42 00 00       	call   edb0 <hyperinterval::ieee::Format::div>
    ab7d:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ab81:	0f 85 4d 04 00 00    	jne    afd4 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    ab87:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    ab8b:	8b 6c 24 10          	mov    0x10(%rsp),%ebp
    ab8f:	48 89 e7             	mov    %rsp,%rdi
    ab92:	be 00 00 00 80       	mov    $0x80000000,%esi
    ab97:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ab9c:	e8 2f 38 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    aba1:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    aba5:	0f 85 29 04 00 00    	jne    afd4 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    abab:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
    abb0:	48 89 e7             	mov    %rsp,%rdi
    abb3:	be 00 00 00 80       	mov    $0x80000000,%esi
    abb8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    abbd:	48 89 e9             	mov    %rbp,%rcx
    abc0:	e8 0b 38 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    abc5:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    abc9:	0f 85 05 04 00 00    	jne    afd4 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    abcf:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    abd4:	44 89 f0             	mov    %r14d,%eax
    abd7:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    abdc:	89 d9                	mov    %ebx,%ecx
    abde:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    abe4:	ba 00 00 00 80       	mov    $0x80000000,%edx
    abe9:	29 c2                	sub    %eax,%edx
    abeb:	be 00 00 00 80       	mov    $0x80000000,%esi
    abf0:	09 f0                	or     %esi,%eax
    abf2:	45 85 f6             	test   %r14d,%r14d
    abf5:	48 0f 49 d0          	cmovns %rax,%rdx
    abf9:	b8 00 00 00 80       	mov    $0x80000000,%eax
    abfe:	29 c8                	sub    %ecx,%eax
    ac00:	09 f1                	or     %esi,%ecx
    ac02:	85 db                	test   %ebx,%ebx
    ac04:	48 0f 49 c1          	cmovns %rcx,%rax
    ac08:	40 b5 01             	mov    $0x1,%bpl
    ac0b:	39 c2                	cmp    %eax,%edx
    ac0d:	0f 87 c6 03 00 00    	ja     afd9 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    ac13:	48 89 e7             	mov    %rsp,%rdi
    ac16:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ac1b:	4c 89 e9             	mov    %r13,%rcx
    ac1e:	4c 8b 44 24 50       	mov    0x50(%rsp),%r8
    ac23:	e8 88 41 00 00       	call   edb0 <hyperinterval::ieee::Format::div>
    ac28:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ac2c:	0f 85 a2 03 00 00    	jne    afd4 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    ac32:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    ac36:	44 8b 6c 24 10       	mov    0x10(%rsp),%r13d
    ac3b:	48 89 e7             	mov    %rsp,%rdi
    ac3e:	be 00 00 00 80       	mov    $0x80000000,%esi
    ac43:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ac48:	e8 83 37 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    ac4d:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ac51:	0f 85 7d 03 00 00    	jne    afd4 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    ac57:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
    ac5c:	48 89 e7             	mov    %rsp,%rdi
    ac5f:	be 00 00 00 80       	mov    $0x80000000,%esi
    ac64:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ac69:	4c 89 e9             	mov    %r13,%rcx
    ac6c:	e8 5f 37 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    ac71:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ac75:	0f 85 59 03 00 00    	jne    afd4 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    ac7b:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    ac80:	44 89 f9             	mov    %r15d,%ecx
    ac83:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    ac89:	44 89 e8             	mov    %r13d,%eax
    ac8c:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    ac91:	ba 00 00 00 80       	mov    $0x80000000,%edx
    ac96:	48 29 ca             	sub    %rcx,%rdx
    ac99:	bf 00 00 00 80       	mov    $0x80000000,%edi
    ac9e:	48 09 f9             	or     %rdi,%rcx
    aca1:	45 85 ff             	test   %r15d,%r15d
    aca4:	48 0f 48 ca          	cmovs  %rdx,%rcx
    aca8:	ba 00 00 00 80       	mov    $0x80000000,%edx
    acad:	48 29 c2             	sub    %rax,%rdx
    acb0:	48 09 f8             	or     %rdi,%rax
    acb3:	45 85 ed             	test   %r13d,%r13d
    acb6:	48 0f 48 c2          	cmovs  %rdx,%rax
    acba:	48 39 c1             	cmp    %rax,%rcx
    acbd:	0f 87 16 03 00 00    	ja     afd9 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    acc3:	44 89 f2             	mov    %r14d,%edx
    acc6:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    accc:	be 00 00 00 80       	mov    $0x80000000,%esi
    acd1:	29 d6                	sub    %edx,%esi
    acd3:	09 fa                	or     %edi,%edx
    acd5:	45 85 f6             	test   %r14d,%r14d
    acd8:	48 0f 49 f2          	cmovns %rdx,%rsi
    acdc:	39 ce                	cmp    %ecx,%esi
    acde:	45 0f 46 fe          	cmovbe %r14d,%r15d
    ace2:	89 d9                	mov    %ebx,%ecx
    ace4:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    acea:	ba 00 00 00 80       	mov    $0x80000000,%edx
    acef:	29 ca                	sub    %ecx,%edx
    acf1:	09 f9                	or     %edi,%ecx
    acf3:	85 db                	test   %ebx,%ebx
    acf5:	48 0f 49 d1          	cmovns %rcx,%rdx
    acf9:	39 c2                	cmp    %eax,%edx
    acfb:	44 0f 43 eb          	cmovae %ebx,%r13d
    acff:	48 89 e7             	mov    %rsp,%rdi
    ad02:	be 00 00 00 80       	mov    $0x80000000,%esi
    ad07:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ad0c:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    ad11:	4d 89 e0             	mov    %r12,%r8
    ad14:	e8 97 40 00 00       	call   edb0 <hyperinterval::ieee::Format::div>
    ad19:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ad1d:	0f 85 b1 02 00 00    	jne    afd4 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    ad23:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    ad27:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
    ad2c:	48 89 e7             	mov    %rsp,%rdi
    ad2f:	be 00 00 00 80       	mov    $0x80000000,%esi
    ad34:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ad39:	e8 92 36 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    ad3e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ad42:	0f 85 8c 02 00 00    	jne    afd4 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    ad48:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    ad4d:	48 89 e7             	mov    %rsp,%rdi
    ad50:	be 00 00 00 80       	mov    $0x80000000,%esi
    ad55:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ad5a:	4c 89 e1             	mov    %r12,%rcx
    ad5d:	e8 6e 36 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    ad62:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ad66:	0f 85 68 02 00 00    	jne    afd4 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    ad6c:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    ad71:	89 d9                	mov    %ebx,%ecx
    ad73:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    ad79:	44 89 e0             	mov    %r12d,%eax
    ad7c:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    ad81:	ba 00 00 00 80       	mov    $0x80000000,%edx
    ad86:	48 29 ca             	sub    %rcx,%rdx
    ad89:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    ad8f:	4c 09 c1             	or     %r8,%rcx
    ad92:	85 db                	test   %ebx,%ebx
    ad94:	48 0f 48 ca          	cmovs  %rdx,%rcx
    ad98:	ba 00 00 00 80       	mov    $0x80000000,%edx
    ad9d:	48 29 c2             	sub    %rax,%rdx
    ada0:	4c 09 c0             	or     %r8,%rax
    ada3:	45 85 e4             	test   %r12d,%r12d
    ada6:	48 0f 48 c2          	cmovs  %rdx,%rax
    adaa:	48 39 c1             	cmp    %rax,%rcx
    adad:	0f 87 26 02 00 00    	ja     afd9 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    adb3:	44 89 fa             	mov    %r15d,%edx
    adb6:	44 09 c2             	or     %r8d,%edx
    adb9:	44 89 fe             	mov    %r15d,%esi
    adbc:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    adc2:	bf 00 00 00 80       	mov    $0x80000000,%edi
    adc7:	29 f7                	sub    %esi,%edi
    adc9:	45 85 ff             	test   %r15d,%r15d
    adcc:	48 0f 49 fa          	cmovns %rdx,%rdi
    add0:	39 cf                	cmp    %ecx,%edi
    add2:	41 0f 46 df          	cmovbe %r15d,%ebx
    add6:	44 89 e9             	mov    %r13d,%ecx
    add9:	44 09 c1             	or     %r8d,%ecx
    addc:	44 89 ea             	mov    %r13d,%edx
    addf:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    ade5:	be 00 00 00 80       	mov    $0x80000000,%esi
    adea:	29 d6                	sub    %edx,%esi
    adec:	45 85 ed             	test   %r13d,%r13d
    adef:	48 0f 49 f1          	cmovns %rcx,%rsi
    adf3:	39 c6                	cmp    %eax,%esi
    adf5:	45 0f 43 e5          	cmovae %r13d,%r12d
    adf9:	48 89 e7             	mov    %rsp,%rdi
    adfc:	be 00 00 00 80       	mov    $0x80000000,%esi
    ae01:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ae06:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    ae0b:	4c 8b 44 24 50       	mov    0x50(%rsp),%r8
    ae10:	e8 9b 3f 00 00       	call   edb0 <hyperinterval::ieee::Format::div>
    ae15:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ae19:	0f 85 b5 01 00 00    	jne    afd4 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    ae1f:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    ae23:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
    ae28:	48 89 e7             	mov    %rsp,%rdi
    ae2b:	be 00 00 00 80       	mov    $0x80000000,%esi
    ae30:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ae35:	e8 96 35 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    ae3a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ae3e:	0f 85 90 01 00 00    	jne    afd4 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    ae44:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    ae49:	48 89 e7             	mov    %rsp,%rdi
    ae4c:	be 00 00 00 80       	mov    $0x80000000,%esi
    ae51:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ae56:	4c 89 f1             	mov    %r14,%rcx
    ae59:	e8 72 35 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    ae5e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ae62:	0f 85 6c 01 00 00    	jne    afd4 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    ae68:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    ae6d:	44 89 ea             	mov    %r13d,%edx
    ae70:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    ae76:	89 c1                	mov    %eax,%ecx
    ae78:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    ae7e:	be 00 00 00 80       	mov    $0x80000000,%esi
    ae83:	48 29 d6             	sub    %rdx,%rsi
    ae86:	bf 00 00 00 80       	mov    $0x80000000,%edi
    ae8b:	48 09 fa             	or     %rdi,%rdx
    ae8e:	45 85 ed             	test   %r13d,%r13d
    ae91:	48 0f 48 d6          	cmovs  %rsi,%rdx
    ae95:	be 00 00 00 80       	mov    $0x80000000,%esi
    ae9a:	48 29 ce             	sub    %rcx,%rsi
    ae9d:	48 09 f9             	or     %rdi,%rcx
    aea0:	85 c0                	test   %eax,%eax
    aea2:	48 0f 48 ce          	cmovs  %rsi,%rcx
    aea6:	48 39 ca             	cmp    %rcx,%rdx
    aea9:	0f 87 2a 01 00 00    	ja     afd9 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    aeaf:	89 de                	mov    %ebx,%esi
    aeb1:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
    aeb7:	44 09 ce             	or     %r9d,%esi
    aeba:	89 df                	mov    %ebx,%edi
    aebc:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    aec2:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    aec8:	41 29 f8             	sub    %edi,%r8d
    aecb:	85 db                	test   %ebx,%ebx
    aecd:	4c 0f 49 c6          	cmovns %rsi,%r8
    aed1:	41 39 d0             	cmp    %edx,%r8d
    aed4:	44 0f 46 eb          	cmovbe %ebx,%r13d
    aed8:	e9 3a 05 00 00       	jmp    b417 <hyperinterval::float::F32Enclosure::corner_image+0x8f7>
    aedd:	c7 07 00 00 00 00    	movl   $0x0,(%rdi)
    aee3:	c3                   	ret
    aee4:	44 89 e8             	mov    %r13d,%eax
    aee7:	c1 e8 17             	shr    $0x17,%eax
    aeea:	0f b6 d8             	movzbl %al,%ebx
    aeed:	44 89 e9             	mov    %r13d,%ecx
    aef0:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
    aef6:	45 31 f6             	xor    %r14d,%r14d
    aef9:	85 db                	test   %ebx,%ebx
    aefb:	41 0f 95 c6          	setne  %r14b
    aeff:	b8 01 00 00 00       	mov    $0x1,%eax
    af04:	0f 45 c3             	cmovne %ebx,%eax
    af07:	41 c1 e6 17          	shl    $0x17,%r14d
    af0b:	49 09 ce             	or     %rcx,%r14
    af0e:	44 89 e1             	mov    %r12d,%ecx
    af11:	c1 e9 17             	shr    $0x17,%ecx
    af14:	0f b6 f1             	movzbl %cl,%esi
    af17:	44 89 e1             	mov    %r12d,%ecx
    af1a:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
    af20:	8d 96 d4 fe ff ff    	lea    -0x12c(%rsi),%edx
    af26:	45 31 ff             	xor    %r15d,%r15d
    af29:	48 89 74 24 58       	mov    %rsi,0x58(%rsp)
    af2e:	85 f6                	test   %esi,%esi
    af30:	41 0f 95 c7          	setne  %r15b
    af34:	be d5 fe ff ff       	mov    $0xfffffed5,%esi
    af39:	0f 45 f2             	cmovne %edx,%esi
    af3c:	41 c1 e7 17          	shl    $0x17,%r15d
    af40:	49 09 cf             	or     %rcx,%r15
    af43:	44 89 e9             	mov    %r13d,%ecx
    af46:	44 31 e1             	xor    %r12d,%ecx
    af49:	4c 89 f2             	mov    %r14,%rdx
    af4c:	49 0f af d7          	imul   %r15,%rdx
    af50:	01 c6                	add    %eax,%esi
    af52:	c1 e9 1f             	shr    $0x1f,%ecx
    af55:	88 4c 24 14          	mov    %cl,0x14(%rsp)
    af59:	48 89 14 24          	mov    %rdx,(%rsp)
    af5d:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    af64:	00 00 
    af66:	89 74 24 10          	mov    %esi,0x10(%rsp)
    af6a:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    af6f:	48 89 e1             	mov    %rsp,%rcx
    af72:	be 00 00 00 80       	mov    $0x80000000,%esi
    af77:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    af7c:	e8 8f 34 00 00       	call   e410 <hyperinterval::ieee::Format::rounded>
    af81:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
    af86:	74 07                	je     af8f <hyperinterval::float::F32Enclosure::corner_image+0x46f>
    af88:	0f b6 6c 24 29       	movzbl 0x29(%rsp),%ebp
    af8d:	eb 4a                	jmp    afd9 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    af8f:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
    af93:	8b 6c 24 38          	mov    0x38(%rsp),%ebp
    af97:	48 89 e7             	mov    %rsp,%rdi
    af9a:	be 00 00 00 80       	mov    $0x80000000,%esi
    af9f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    afa4:	e8 27 34 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    afa9:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    afad:	75 25                	jne    afd4 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    afaf:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    afb4:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    afb9:	48 89 e7             	mov    %rsp,%rdi
    afbc:	be 00 00 00 80       	mov    $0x80000000,%esi
    afc1:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    afc6:	48 89 e9             	mov    %rbp,%rcx
    afc9:	e8 02 34 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    afce:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    afd2:	74 23                	je     aff7 <hyperinterval::float::F32Enclosure::corner_image+0x4d7>
    afd4:	0f b6 6c 24 01       	movzbl 0x1(%rsp),%ebp
    afd9:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
    afde:	40 88 68 04          	mov    %bpl,0x4(%rax)
    afe2:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
    afe8:	48 83 c4 78          	add    $0x78,%rsp
    afec:	5b                   	pop    %rbx
    afed:	41 5c                	pop    %r12
    afef:	41 5d                	pop    %r13
    aff1:	41 5e                	pop    %r14
    aff3:	41 5f                	pop    %r15
    aff5:	5d                   	pop    %rbp
    aff6:	c3                   	ret
    aff7:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    affc:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
    b001:	44 89 c0             	mov    %r8d,%eax
    b004:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    b009:	89 f9                	mov    %edi,%ecx
    b00b:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    b011:	ba 00 00 00 80       	mov    $0x80000000,%edx
    b016:	29 c2                	sub    %eax,%edx
    b018:	be 00 00 00 80       	mov    $0x80000000,%esi
    b01d:	09 f0                	or     %esi,%eax
    b01f:	45 85 c0             	test   %r8d,%r8d
    b022:	48 0f 49 d0          	cmovns %rax,%rdx
    b026:	b8 00 00 00 80       	mov    $0x80000000,%eax
    b02b:	29 c8                	sub    %ecx,%eax
    b02d:	09 f1                	or     %esi,%ecx
    b02f:	85 ff                	test   %edi,%edi
    b031:	48 0f 49 c1          	cmovns %rcx,%rax
    b035:	40 b5 01             	mov    $0x1,%bpl
    b038:	39 c2                	cmp    %eax,%edx
    b03a:	77 9d                	ja     afd9 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    b03c:	48 89 7c 24 70       	mov    %rdi,0x70(%rsp)
    b041:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
    b046:	89 c8                	mov    %ecx,%eax
    b048:	c1 e8 17             	shr    $0x17,%eax
    b04b:	0f b6 c0             	movzbl %al,%eax
    b04e:	41 31 cd             	xor    %ecx,%r13d
    b051:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
    b057:	31 d2                	xor    %edx,%edx
    b059:	85 c0                	test   %eax,%eax
    b05b:	be 01 00 00 00       	mov    $0x1,%esi
    b060:	0f 45 f0             	cmovne %eax,%esi
    b063:	0f 95 c2             	setne  %dl
    b066:	c1 e2 17             	shl    $0x17,%edx
    b069:	48 09 ca             	or     %rcx,%rdx
    b06c:	48 89 54 24 68       	mov    %rdx,0x68(%rsp)
    b071:	4c 0f af f2          	imul   %rdx,%r14
    b075:	89 d8                	mov    %ebx,%eax
    b077:	05 d4 fe ff ff       	add    $0xfffffed4,%eax
    b07c:	48 85 db             	test   %rbx,%rbx
    b07f:	b9 d5 fe ff ff       	mov    $0xfffffed5,%ecx
    b084:	0f 45 c8             	cmovne %eax,%ecx
    b087:	89 f3                	mov    %esi,%ebx
    b089:	01 f1                	add    %esi,%ecx
    b08b:	41 c1 ed 1f          	shr    $0x1f,%r13d
    b08f:	44 88 6c 24 14       	mov    %r13b,0x14(%rsp)
    b094:	4c 89 34 24          	mov    %r14,(%rsp)
    b098:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    b09f:	00 00 
    b0a1:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
    b0a5:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    b0aa:	48 89 e1             	mov    %rsp,%rcx
    b0ad:	be 00 00 00 80       	mov    $0x80000000,%esi
    b0b2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b0b7:	e8 54 33 00 00       	call   e410 <hyperinterval::ieee::Format::rounded>
    b0bc:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
    b0c1:	0f 85 c1 fe ff ff    	jne    af88 <hyperinterval::float::F32Enclosure::corner_image+0x468>
    b0c7:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
    b0cb:	44 8b 6c 24 38       	mov    0x38(%rsp),%r13d
    b0d0:	48 89 e7             	mov    %rsp,%rdi
    b0d3:	be 00 00 00 80       	mov    $0x80000000,%esi
    b0d8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b0dd:	e8 ee 32 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    b0e2:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    b0e6:	0f 84 e8 fe ff ff    	je     afd4 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    b0ec:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
    b0f1:	48 89 e7             	mov    %rsp,%rdi
    b0f4:	be 00 00 00 80       	mov    $0x80000000,%esi
    b0f9:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b0fe:	4c 89 e9             	mov    %r13,%rcx
    b101:	e8 ca 32 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    b106:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    b10a:	0f 84 c4 fe ff ff    	je     afd4 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    b110:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    b115:	44 89 f1             	mov    %r14d,%ecx
    b118:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    b11e:	44 89 e8             	mov    %r13d,%eax
    b121:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    b126:	ba 00 00 00 80       	mov    $0x80000000,%edx
    b12b:	48 29 ca             	sub    %rcx,%rdx
    b12e:	bf 00 00 00 80       	mov    $0x80000000,%edi
    b133:	48 09 f9             	or     %rdi,%rcx
    b136:	45 85 f6             	test   %r14d,%r14d
    b139:	48 0f 48 ca          	cmovs  %rdx,%rcx
    b13d:	ba 00 00 00 80       	mov    $0x80000000,%edx
    b142:	48 29 c2             	sub    %rax,%rdx
    b145:	48 09 f8             	or     %rdi,%rax
    b148:	45 85 ed             	test   %r13d,%r13d
    b14b:	48 0f 48 c2          	cmovs  %rdx,%rax
    b14f:	48 39 c1             	cmp    %rax,%rcx
    b152:	0f 87 81 fe ff ff    	ja     afd9 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    b158:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
    b15d:	44 89 c2             	mov    %r8d,%edx
    b160:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    b166:	be 00 00 00 80       	mov    $0x80000000,%esi
    b16b:	29 d6                	sub    %edx,%esi
    b16d:	09 fa                	or     %edi,%edx
    b16f:	45 85 c0             	test   %r8d,%r8d
    b172:	48 0f 49 f2          	cmovns %rdx,%rsi
    b176:	39 ce                	cmp    %ecx,%esi
    b178:	45 0f 46 f0          	cmovbe %r8d,%r14d
    b17c:	4c 89 74 24 40       	mov    %r14,0x40(%rsp)
    b181:	48 8b 74 24 70       	mov    0x70(%rsp),%rsi
    b186:	89 f1                	mov    %esi,%ecx
    b188:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    b18e:	ba 00 00 00 80       	mov    $0x80000000,%edx
    b193:	29 ca                	sub    %ecx,%edx
    b195:	09 f9                	or     %edi,%ecx
    b197:	85 f6                	test   %esi,%esi
    b199:	48 0f 49 d1          	cmovns %rcx,%rdx
    b19d:	39 c2                	cmp    %eax,%edx
    b19f:	44 0f 43 ee          	cmovae %esi,%r13d
    b1a3:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
    b1a8:	89 f0                	mov    %esi,%eax
    b1aa:	c1 e8 17             	shr    $0x17,%eax
    b1ad:	0f b6 c0             	movzbl %al,%eax
    b1b0:	89 f1                	mov    %esi,%ecx
    b1b2:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
    b1b8:	8d 90 d4 fe ff ff    	lea    -0x12c(%rax),%edx
    b1be:	45 31 f6             	xor    %r14d,%r14d
    b1c1:	85 c0                	test   %eax,%eax
    b1c3:	41 0f 95 c6          	setne  %r14b
    b1c7:	bf d5 fe ff ff       	mov    $0xfffffed5,%edi
    b1cc:	0f 45 fa             	cmovne %edx,%edi
    b1cf:	41 c1 e6 17          	shl    $0x17,%r14d
    b1d3:	49 09 ce             	or     %rcx,%r14
    b1d6:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
    b1db:	48 85 c9             	test   %rcx,%rcx
    b1de:	b8 01 00 00 00       	mov    $0x1,%eax
    b1e3:	0f 45 c1             	cmovne %ecx,%eax
    b1e6:	41 31 f4             	xor    %esi,%r12d
    b1e9:	4d 0f af fe          	imul   %r14,%r15
    b1ed:	89 7c 24 58          	mov    %edi,0x58(%rsp)
    b1f1:	01 f8                	add    %edi,%eax
    b1f3:	41 c1 ec 1f          	shr    $0x1f,%r12d
    b1f7:	44 88 64 24 14       	mov    %r12b,0x14(%rsp)
    b1fc:	4c 89 3c 24          	mov    %r15,(%rsp)
    b200:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    b207:	00 00 
    b209:	89 44 24 10          	mov    %eax,0x10(%rsp)
    b20d:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    b212:	48 89 e1             	mov    %rsp,%rcx
    b215:	be 00 00 00 80       	mov    $0x80000000,%esi
    b21a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b21f:	e8 ec 31 00 00       	call   e410 <hyperinterval::ieee::Format::rounded>
    b224:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
    b229:	0f 85 59 fd ff ff    	jne    af88 <hyperinterval::float::F32Enclosure::corner_image+0x468>
    b22f:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
    b233:	44 8b 64 24 38       	mov    0x38(%rsp),%r12d
    b238:	48 89 e7             	mov    %rsp,%rdi
    b23b:	be 00 00 00 80       	mov    $0x80000000,%esi
    b240:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b245:	e8 86 31 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    b24a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    b24e:	0f 85 80 fd ff ff    	jne    afd4 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    b254:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
    b259:	48 89 e7             	mov    %rsp,%rdi
    b25c:	be 00 00 00 80       	mov    $0x80000000,%esi
    b261:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b266:	4c 89 e1             	mov    %r12,%rcx
    b269:	e8 62 31 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    b26e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    b272:	0f 85 5c fd ff ff    	jne    afd4 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    b278:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    b27d:	44 89 f9             	mov    %r15d,%ecx
    b280:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    b286:	44 89 e0             	mov    %r12d,%eax
    b289:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    b28e:	ba 00 00 00 80       	mov    $0x80000000,%edx
    b293:	48 29 ca             	sub    %rcx,%rdx
    b296:	bf 00 00 00 80       	mov    $0x80000000,%edi
    b29b:	48 09 f9             	or     %rdi,%rcx
    b29e:	45 85 ff             	test   %r15d,%r15d
    b2a1:	48 0f 48 ca          	cmovs  %rdx,%rcx
    b2a5:	ba 00 00 00 80       	mov    $0x80000000,%edx
    b2aa:	48 29 c2             	sub    %rax,%rdx
    b2ad:	48 09 f8             	or     %rdi,%rax
    b2b0:	45 85 e4             	test   %r12d,%r12d
    b2b3:	48 0f 48 c2          	cmovs  %rdx,%rax
    b2b7:	48 39 c1             	cmp    %rax,%rcx
    b2ba:	0f 87 19 fd ff ff    	ja     afd9 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    b2c0:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
    b2c5:	44 89 c2             	mov    %r8d,%edx
    b2c8:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    b2ce:	be 00 00 00 80       	mov    $0x80000000,%esi
    b2d3:	29 d6                	sub    %edx,%esi
    b2d5:	44 89 c2             	mov    %r8d,%edx
    b2d8:	09 fa                	or     %edi,%edx
    b2da:	45 85 c0             	test   %r8d,%r8d
    b2dd:	48 0f 49 f2          	cmovns %rdx,%rsi
    b2e1:	39 ce                	cmp    %ecx,%esi
    b2e3:	45 0f 46 f8          	cmovbe %r8d,%r15d
    b2e7:	44 89 e9             	mov    %r13d,%ecx
    b2ea:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    b2f0:	ba 00 00 00 80       	mov    $0x80000000,%edx
    b2f5:	29 ca                	sub    %ecx,%edx
    b2f7:	44 89 e9             	mov    %r13d,%ecx
    b2fa:	09 f9                	or     %edi,%ecx
    b2fc:	45 85 ed             	test   %r13d,%r13d
    b2ff:	48 0f 49 d1          	cmovns %rcx,%rdx
    b303:	39 c2                	cmp    %eax,%edx
    b305:	45 0f 43 e5          	cmovae %r13d,%r12d
    b309:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
    b30e:	33 44 24 48          	xor    0x48(%rsp),%eax
    b312:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
    b317:	49 0f af ce          	imul   %r14,%rcx
    b31b:	8b 54 24 58          	mov    0x58(%rsp),%edx
    b31f:	01 da                	add    %ebx,%edx
    b321:	c1 e8 1f             	shr    $0x1f,%eax
    b324:	88 44 24 14          	mov    %al,0x14(%rsp)
    b328:	48 89 0c 24          	mov    %rcx,(%rsp)
    b32c:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    b333:	00 00 
    b335:	89 54 24 10          	mov    %edx,0x10(%rsp)
    b339:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    b33e:	48 89 e1             	mov    %rsp,%rcx
    b341:	be 00 00 00 80       	mov    $0x80000000,%esi
    b346:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b34b:	e8 c0 30 00 00       	call   e410 <hyperinterval::ieee::Format::rounded>
    b350:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
    b355:	0f 85 2d fc ff ff    	jne    af88 <hyperinterval::float::F32Enclosure::corner_image+0x468>
    b35b:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
    b35f:	44 8b 74 24 38       	mov    0x38(%rsp),%r14d
    b364:	48 89 e7             	mov    %rsp,%rdi
    b367:	be 00 00 00 80       	mov    $0x80000000,%esi
    b36c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b371:	e8 5a 30 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    b376:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    b37a:	0f 85 54 fc ff ff    	jne    afd4 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    b380:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    b385:	48 89 e7             	mov    %rsp,%rdi
    b388:	be 00 00 00 80       	mov    $0x80000000,%esi
    b38d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b392:	4c 89 f1             	mov    %r14,%rcx
    b395:	e8 36 30 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    b39a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    b39e:	0f 85 30 fc ff ff    	jne    afd4 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    b3a4:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    b3a9:	44 89 ea             	mov    %r13d,%edx
    b3ac:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    b3b2:	89 c1                	mov    %eax,%ecx
    b3b4:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    b3ba:	be 00 00 00 80       	mov    $0x80000000,%esi
    b3bf:	48 29 d6             	sub    %rdx,%rsi
    b3c2:	bf 00 00 00 80       	mov    $0x80000000,%edi
    b3c7:	48 09 fa             	or     %rdi,%rdx
    b3ca:	45 85 ed             	test   %r13d,%r13d
    b3cd:	48 0f 48 d6          	cmovs  %rsi,%rdx
    b3d1:	be 00 00 00 80       	mov    $0x80000000,%esi
    b3d6:	48 29 ce             	sub    %rcx,%rsi
    b3d9:	48 09 f9             	or     %rdi,%rcx
    b3dc:	85 c0                	test   %eax,%eax
    b3de:	48 0f 48 ce          	cmovs  %rsi,%rcx
    b3e2:	48 39 ca             	cmp    %rcx,%rdx
    b3e5:	0f 87 ee fb ff ff    	ja     afd9 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    b3eb:	44 89 fe             	mov    %r15d,%esi
    b3ee:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
    b3f4:	44 09 ce             	or     %r9d,%esi
    b3f7:	44 89 ff             	mov    %r15d,%edi
    b3fa:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    b400:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    b406:	41 29 f8             	sub    %edi,%r8d
    b409:	45 85 ff             	test   %r15d,%r15d
    b40c:	4c 0f 49 c6          	cmovns %rsi,%r8
    b410:	41 39 d0             	cmp    %edx,%r8d
    b413:	45 0f 46 ef          	cmovbe %r15d,%r13d
    b417:	44 89 e2             	mov    %r12d,%edx
    b41a:	44 09 ca             	or     %r9d,%edx
    b41d:	44 89 e6             	mov    %r12d,%esi
    b420:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    b426:	41 29 f1             	sub    %esi,%r9d
    b429:	45 85 e4             	test   %r12d,%r12d
    b42c:	4c 0f 49 ca          	cmovns %rdx,%r9
    b430:	41 39 c9             	cmp    %ecx,%r9d
    b433:	41 0f 43 c4          	cmovae %r12d,%eax
    b437:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
    b43c:	c7 01 01 00 00 00    	movl   $0x1,(%rcx)
    b442:	44 89 69 04          	mov    %r13d,0x4(%rcx)
    b446:	89 41 08             	mov    %eax,0x8(%rcx)
    b449:	e9 9a fb ff ff       	jmp    afe8 <hyperinterval::float::F32Enclosure::corner_image+0x4c8>
    b44e:	66 90                	xchg   %ax,%ax

hyperinterval::float::F32Enclosure::div:
    b450:	53                   	push   %rbx
    b451:	48 89 fb             	mov    %rdi,%rbx
    b454:	f6 02 01             	testb  $0x1,(%rdx)
    b457:	74 4d                	je     b4a6 <hyperinterval::float::F32Enclosure::div+0x56>
    b459:	8b 42 04             	mov    0x4(%rdx),%eax
    b45c:	b9 00 00 00 80       	mov    $0x80000000,%ecx
    b461:	89 c7                	mov    %eax,%edi
    b463:	09 cf                	or     %ecx,%edi
    b465:	41 89 c0             	mov    %eax,%r8d
    b468:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
    b46f:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
    b475:	45 29 c1             	sub    %r8d,%r9d
    b478:	85 c0                	test   %eax,%eax
    b47a:	4c 0f 49 cf          	cmovns %rdi,%r9
    b47e:	41 39 c9             	cmp    %ecx,%r9d
    b481:	77 23                	ja     b4a6 <hyperinterval::float::F32Enclosure::div+0x56>
    b483:	8b 42 08             	mov    0x8(%rdx),%eax
    b486:	85 c0                	test   %eax,%eax
    b488:	0f 99 c1             	setns  %cl
    b48b:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
    b490:	0f 94 c0             	sete   %al
    b493:	08 c8                	or     %cl,%al
    b495:	74 0f                	je     b4a6 <hyperinterval::float::F32Enclosure::div+0x56>
    b497:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
    b49b:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    b4a1:	48 89 d8             	mov    %rbx,%rax
    b4a4:	5b                   	pop    %rbx
    b4a5:	c3                   	ret
    b4a6:	48 89 df             	mov    %rbx,%rdi
    b4a9:	b9 01 00 00 00       	mov    $0x1,%ecx
    b4ae:	e8 6d f6 ff ff       	call   ab20 <hyperinterval::float::F32Enclosure::corner_image>
    b4b3:	48 89 d8             	mov    %rbx,%rax
    b4b6:	5b                   	pop    %rbx
    b4b7:	c3                   	ret
    b4b8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    b4bf:	00 

hyperinterval::float::F32Enclosure::reciprocal:
    b4c0:	41 57                	push   %r15
    b4c2:	41 56                	push   %r14
    b4c4:	41 54                	push   %r12
    b4c6:	53                   	push   %rbx
    b4c7:	48 83 ec 28          	sub    $0x28,%rsp
    b4cb:	48 89 fb             	mov    %rdi,%rbx
    b4ce:	83 3e 00             	cmpl   $0x0,(%rsi)
    b4d1:	74 5e                	je     b531 <hyperinterval::float::F32Enclosure::reciprocal+0x71>
    b4d3:	49 89 f6             	mov    %rsi,%r14
    b4d6:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
    b4dc:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b4e1:	be 00 00 00 80       	mov    $0x80000000,%esi
    b4e6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b4eb:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
    b4f0:	e8 db 2e 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    b4f5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b4fa:	74 25                	je     b521 <hyperinterval::float::F32Enclosure::reciprocal+0x61>
    b4fc:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    b501:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b506:	be 00 00 00 80       	mov    $0x80000000,%esi
    b50b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b510:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
    b515:	e8 b6 2e 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    b51a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b51f:	75 25                	jne    b546 <hyperinterval::float::F32Enclosure::reciprocal+0x86>
    b521:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
    b526:	88 4b 04             	mov    %cl,0x4(%rbx)
    b529:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    b52f:	eb 06                	jmp    b537 <hyperinterval::float::F32Enclosure::reciprocal+0x77>
    b531:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
    b537:	48 89 d8             	mov    %rbx,%rax
    b53a:	48 83 c4 28          	add    $0x28,%rsp
    b53e:	5b                   	pop    %rbx
    b53f:	41 5c                	pop    %r12
    b541:	41 5e                	pop    %r14
    b543:	41 5f                	pop    %r15
    b545:	c3                   	ret
    b546:	8b 44 24 10          	mov    0x10(%rsp),%eax
    b54a:	44 89 e1             	mov    %r12d,%ecx
    b54d:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    b553:	89 c2                	mov    %eax,%edx
    b555:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    b55b:	be 00 00 00 80       	mov    $0x80000000,%esi
    b560:	29 ce                	sub    %ecx,%esi
    b562:	44 09 f9             	or     %r15d,%ecx
    b565:	45 85 e4             	test   %r12d,%r12d
    b568:	48 0f 49 f1          	cmovns %rcx,%rsi
    b56c:	bf 00 00 00 80       	mov    $0x80000000,%edi
    b571:	29 d7                	sub    %edx,%edi
    b573:	89 d1                	mov    %edx,%ecx
    b575:	44 09 f9             	or     %r15d,%ecx
    b578:	85 c0                	test   %eax,%eax
    b57a:	48 0f 49 f9          	cmovns %rcx,%rdi
    b57e:	b1 01                	mov    $0x1,%cl
    b580:	39 fe                	cmp    %edi,%esi
    b582:	77 a2                	ja     b526 <hyperinterval::float::F32Enclosure::reciprocal+0x66>
    b584:	44 89 e1             	mov    %r12d,%ecx
    b587:	c1 e9 08             	shr    $0x8,%ecx
    b58a:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%rsp)
    b591:	00 
    b592:	44 88 64 24 20       	mov    %r12b,0x20(%rsp)
    b597:	41 c1 ec 18          	shr    $0x18,%r12d
    b59b:	44 88 64 24 23       	mov    %r12b,0x23(%rsp)
    b5a0:	66 89 4c 24 21       	mov    %cx,0x21(%rsp)
    b5a5:	89 44 24 24          	mov    %eax,0x24(%rsp)
    b5a9:	41 8b 46 04          	mov    0x4(%r14),%eax
    b5ad:	89 c1                	mov    %eax,%ecx
    b5af:	44 09 f9             	or     %r15d,%ecx
    b5b2:	89 c2                	mov    %eax,%edx
    b5b4:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    b5ba:	be 00 00 00 80       	mov    $0x80000000,%esi
    b5bf:	29 d6                	sub    %edx,%esi
    b5c1:	85 c0                	test   %eax,%eax
    b5c3:	48 0f 49 f1          	cmovns %rcx,%rsi
    b5c7:	44 39 fe             	cmp    %r15d,%esi
    b5ca:	77 1e                	ja     b5ea <hyperinterval::float::F32Enclosure::reciprocal+0x12a>
    b5cc:	41 8b 46 08          	mov    0x8(%r14),%eax
    b5d0:	85 c0                	test   %eax,%eax
    b5d2:	0f 99 c1             	setns  %cl
    b5d5:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
    b5da:	0f 94 c0             	sete   %al
    b5dd:	08 c8                	or     %cl,%al
    b5df:	74 09                	je     b5ea <hyperinterval::float::F32Enclosure::reciprocal+0x12a>
    b5e1:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
    b5e5:	e9 3f ff ff ff       	jmp    b529 <hyperinterval::float::F32Enclosure::reciprocal+0x69>
    b5ea:	48 8d 74 24 1c       	lea    0x1c(%rsp),%rsi
    b5ef:	48 89 df             	mov    %rbx,%rdi
    b5f2:	4c 89 f2             	mov    %r14,%rdx
    b5f5:	b9 01 00 00 00       	mov    $0x1,%ecx
    b5fa:	e8 21 f5 ff ff       	call   ab20 <hyperinterval::float::F32Enclosure::corner_image>
    b5ff:	e9 33 ff ff ff       	jmp    b537 <hyperinterval::float::F32Enclosure::reciprocal+0x77>
    b604:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    b60b:	00 00 00 
    b60e:	66 90                	xchg   %ax,%ax

hyperinterval::float::F32Enclosure::square:
    b610:	55                   	push   %rbp
    b611:	41 57                	push   %r15
    b613:	41 56                	push   %r14
    b615:	41 55                	push   %r13
    b617:	41 54                	push   %r12
    b619:	53                   	push   %rbx
    b61a:	48 83 ec 48          	sub    $0x48,%rsp
    b61e:	48 89 fb             	mov    %rdi,%rbx
    b621:	f6 06 01             	testb  $0x1,(%rsi)
    b624:	0f 84 d8 00 00 00    	je     b702 <hyperinterval::float::F32Enclosure::square+0xf2>
    b62a:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
    b62e:	44 8b 76 08          	mov    0x8(%rsi),%r14d
    b632:	44 89 f8             	mov    %r15d,%eax
    b635:	c1 e8 17             	shr    $0x17,%eax
    b638:	0f b6 c8             	movzbl %al,%ecx
    b63b:	44 89 fa             	mov    %r15d,%edx
    b63e:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
    b644:	31 c0                	xor    %eax,%eax
    b646:	85 c9                	test   %ecx,%ecx
    b648:	8d 8c 09 d4 fe ff ff 	lea    -0x12c(%rcx,%rcx,1),%ecx
    b64f:	41 bc d6 fe ff ff    	mov    $0xfffffed6,%r12d
    b655:	41 0f 44 cc          	cmove  %r12d,%ecx
    b659:	0f 95 c0             	setne  %al
    b65c:	c1 e0 17             	shl    $0x17,%eax
    b65f:	48 09 d0             	or     %rdx,%rax
    b662:	48 f7 e0             	mul    %rax
    b665:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
    b66a:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    b66f:	48 89 04 24          	mov    %rax,(%rsp)
    b673:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
    b677:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
    b67c:	48 89 e1             	mov    %rsp,%rcx
    b67f:	be 00 00 00 80       	mov    $0x80000000,%esi
    b684:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b689:	e8 82 2d 00 00       	call   e410 <hyperinterval::ieee::Format::rounded>
    b68e:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
    b693:	75 66                	jne    b6fb <hyperinterval::float::F32Enclosure::square+0xeb>
    b695:	44 8b 6c 24 38       	mov    0x38(%rsp),%r13d
    b69a:	8b 6c 24 40          	mov    0x40(%rsp),%ebp
    b69e:	44 89 f0             	mov    %r14d,%eax
    b6a1:	c1 e8 17             	shr    $0x17,%eax
    b6a4:	0f b6 c8             	movzbl %al,%ecx
    b6a7:	44 89 f2             	mov    %r14d,%edx
    b6aa:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
    b6b0:	31 c0                	xor    %eax,%eax
    b6b2:	85 c9                	test   %ecx,%ecx
    b6b4:	8d 8c 09 d4 fe ff ff 	lea    -0x12c(%rcx,%rcx,1),%ecx
    b6bb:	41 0f 44 cc          	cmove  %r12d,%ecx
    b6bf:	0f 95 c0             	setne  %al
    b6c2:	c1 e0 17             	shl    $0x17,%eax
    b6c5:	48 09 d0             	or     %rdx,%rax
    b6c8:	48 f7 e0             	mul    %rax
    b6cb:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
    b6d0:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    b6d5:	48 89 04 24          	mov    %rax,(%rsp)
    b6d9:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
    b6dd:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
    b6e2:	48 89 e1             	mov    %rsp,%rcx
    b6e5:	be 00 00 00 80       	mov    $0x80000000,%esi
    b6ea:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b6ef:	e8 1c 2d 00 00       	call   e410 <hyperinterval::ieee::Format::rounded>
    b6f4:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
    b6f9:	75 0f                	jne    b70a <hyperinterval::float::F32Enclosure::square+0xfa>
    b6fb:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
    b700:	eb 59                	jmp    b75b <hyperinterval::float::F32Enclosure::square+0x14b>
    b702:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
    b708:	eb 5a                	jmp    b764 <hyperinterval::float::F32Enclosure::square+0x154>
    b70a:	8b 44 24 38          	mov    0x38(%rsp),%eax
    b70e:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    b713:	44 8b 64 24 40       	mov    0x40(%rsp),%r12d
    b718:	48 89 e7             	mov    %rsp,%rdi
    b71b:	be 00 00 00 80       	mov    $0x80000000,%esi
    b720:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b725:	4c 89 e9             	mov    %r13,%rcx
    b728:	e8 a3 2c 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    b72d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    b731:	74 23                	je     b756 <hyperinterval::float::F32Enclosure::square+0x146>
    b733:	4d 89 e5             	mov    %r12,%r13
    b736:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    b73b:	48 89 e7             	mov    %rsp,%rdi
    b73e:	be 00 00 00 80       	mov    $0x80000000,%esi
    b743:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b748:	48 89 e9             	mov    %rbp,%rcx
    b74b:	e8 80 2c 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    b750:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    b754:	75 20                	jne    b776 <hyperinterval::float::F32Enclosure::square+0x166>
    b756:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    b75b:	88 43 04             	mov    %al,0x4(%rbx)
    b75e:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    b764:	48 89 d8             	mov    %rbx,%rax
    b767:	48 83 c4 48          	add    $0x48,%rsp
    b76b:	5b                   	pop    %rbx
    b76c:	41 5c                	pop    %r12
    b76e:	41 5d                	pop    %r13
    b770:	41 5e                	pop    %r14
    b772:	41 5f                	pop    %r15
    b774:	5d                   	pop    %rbp
    b775:	c3                   	ret
    b776:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
    b77a:	44 89 e0             	mov    %r12d,%eax
    b77d:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    b782:	89 e9                	mov    %ebp,%ecx
    b784:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    b78a:	ba 00 00 00 80       	mov    $0x80000000,%edx
    b78f:	29 c2                	sub    %eax,%edx
    b791:	bf 00 00 00 80       	mov    $0x80000000,%edi
    b796:	09 f8                	or     %edi,%eax
    b798:	45 85 e4             	test   %r12d,%r12d
    b79b:	48 0f 49 d0          	cmovns %rax,%rdx
    b79f:	be 00 00 00 80       	mov    $0x80000000,%esi
    b7a4:	29 ce                	sub    %ecx,%esi
    b7a6:	89 c8                	mov    %ecx,%eax
    b7a8:	09 f8                	or     %edi,%eax
    b7aa:	85 ed                	test   %ebp,%ebp
    b7ac:	48 0f 49 f0          	cmovns %rax,%rsi
    b7b0:	b0 01                	mov    $0x1,%al
    b7b2:	39 f2                	cmp    %esi,%edx
    b7b4:	77 a5                	ja     b75b <hyperinterval::float::F32Enclosure::square+0x14b>
    b7b6:	48 89 e7             	mov    %rsp,%rdi
    b7b9:	be 00 00 00 80       	mov    $0x80000000,%esi
    b7be:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b7c3:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    b7c8:	e8 03 2c 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    b7cd:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    b7d1:	74 83                	je     b756 <hyperinterval::float::F32Enclosure::square+0x146>
    b7d3:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    b7d8:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    b7dd:	48 89 e7             	mov    %rsp,%rdi
    b7e0:	be 00 00 00 80       	mov    $0x80000000,%esi
    b7e5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b7ea:	4c 89 e9             	mov    %r13,%rcx
    b7ed:	e8 de 2b 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    b7f2:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    b7f6:	0f 84 5a ff ff ff    	je     b756 <hyperinterval::float::F32Enclosure::square+0x146>
    b7fc:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    b800:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
    b805:	89 d0                	mov    %edx,%eax
    b807:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    b80c:	41 89 c8             	mov    %ecx,%r8d
    b80f:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
    b816:	be 00 00 00 80       	mov    $0x80000000,%esi
    b81b:	29 c6                	sub    %eax,%esi
    b81d:	bf 00 00 00 80       	mov    $0x80000000,%edi
    b822:	09 f8                	or     %edi,%eax
    b824:	85 d2                	test   %edx,%edx
    b826:	48 0f 49 f0          	cmovns %rax,%rsi
    b82a:	44 89 c0             	mov    %r8d,%eax
    b82d:	09 f8                	or     %edi,%eax
    b82f:	44 29 c7             	sub    %r8d,%edi
    b832:	85 c9                	test   %ecx,%ecx
    b834:	48 0f 49 f8          	cmovns %rax,%rdi
    b838:	b0 01                	mov    $0x1,%al
    b83a:	39 fe                	cmp    %edi,%esi
    b83c:	0f 87 19 ff ff ff    	ja     b75b <hyperinterval::float::F32Enclosure::square+0x14b>
    b842:	44 89 e7             	mov    %r12d,%edi
    b845:	89 ee                	mov    %ebp,%esi
    b847:	e8 d4 29 00 00       	call   e220 <hyperinterval::bounds::Bounds<T>::hull>
    b84c:	41 89 c4             	mov    %eax,%r12d
    b84f:	89 d5                	mov    %edx,%ebp
    b851:	44 89 ff             	mov    %r15d,%edi
    b854:	44 89 f6             	mov    %r14d,%esi
    b857:	31 d2                	xor    %edx,%edx
    b859:	e8 52 2a 00 00       	call   e2b0 <hyperinterval::bounds::Bounds<T>::signs>
    b85e:	a8 02                	test   $0x2,%al
    b860:	75 12                	jne    b874 <hyperinterval::float::F32Enclosure::square+0x264>
    b862:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
    b868:	44 89 63 04          	mov    %r12d,0x4(%rbx)
    b86c:	89 6b 08             	mov    %ebp,0x8(%rbx)
    b86f:	e9 f0 fe ff ff       	jmp    b764 <hyperinterval::float::F32Enclosure::square+0x154>
    b874:	48 89 e7             	mov    %rsp,%rdi
    b877:	31 f6                	xor    %esi,%esi
    b879:	31 d2                	xor    %edx,%edx
    b87b:	e8 e0 e7 ff ff       	call   a060 <hyperinterval::float::F32Enclosure::from_bits>
    b880:	8b 0c 24             	mov    (%rsp),%ecx
    b883:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
    b888:	83 f9 02             	cmp    $0x2,%ecx
    b88b:	0f 84 ca fe ff ff    	je     b75b <hyperinterval::float::F32Enclosure::square+0x14b>
    b891:	f6 c1 01             	test   $0x1,%cl
    b894:	74 cc                	je     b862 <hyperinterval::float::F32Enclosure::square+0x252>
    b896:	0f b6 c0             	movzbl %al,%eax
    b899:	0f b6 4c 24 07       	movzbl 0x7(%rsp),%ecx
    b89e:	c1 e1 10             	shl    $0x10,%ecx
    b8a1:	0f b7 54 24 05       	movzwl 0x5(%rsp),%edx
    b8a6:	09 ca                	or     %ecx,%edx
    b8a8:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    b8ac:	c1 e2 08             	shl    $0x8,%edx
    b8af:	09 c2                	or     %eax,%edx
    b8b1:	44 89 e7             	mov    %r12d,%edi
    b8b4:	89 ee                	mov    %ebp,%esi
    b8b6:	e8 65 29 00 00       	call   e220 <hyperinterval::bounds::Bounds<T>::hull>
    b8bb:	41 89 c4             	mov    %eax,%r12d
    b8be:	89 d5                	mov    %edx,%ebp
    b8c0:	eb a0                	jmp    b862 <hyperinterval::float::F32Enclosure::square+0x252>
    b8c2:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    b8c9:	00 00 00 
    b8cc:	0f 1f 40 00          	nopl   0x0(%rax)

hyperinterval::float::F32Enclosure::checked_pow:
    b8d0:	55                   	push   %rbp
    b8d1:	41 57                	push   %r15
    b8d3:	41 56                	push   %r14
    b8d5:	41 55                	push   %r13
    b8d7:	41 54                	push   %r12
    b8d9:	53                   	push   %rbx
    b8da:	48 83 ec 38          	sub    $0x38,%rsp
    b8de:	48 89 fb             	mov    %rdi,%rbx
    b8e1:	83 fa 02             	cmp    $0x2,%edx
    b8e4:	75 0e                	jne    b8f4 <hyperinterval::float::F32Enclosure::checked_pow+0x24>
    b8e6:	48 89 df             	mov    %rbx,%rdi
    b8e9:	ff 15 c9 45 05 00    	call   *0x545c9(%rip)        # 5feb8 <_GLOBAL_OFFSET_TABLE_+0x8f0>
    b8ef:	e9 c8 00 00 00       	jmp    b9bc <hyperinterval::float::F32Enclosure::checked_pow+0xec>
    b8f4:	f6 06 01             	testb  $0x1,(%rsi)
    b8f7:	0f 84 b9 00 00 00    	je     b9b6 <hyperinterval::float::F32Enclosure::checked_pow+0xe6>
    b8fd:	89 d5                	mov    %edx,%ebp
    b8ff:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
    b903:	44 8b 76 08          	mov    0x8(%rsi),%r14d
    b907:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b90c:	be 00 00 00 80       	mov    $0x80000000,%esi
    b911:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b916:	4c 89 f9             	mov    %r15,%rcx
    b919:	41 89 e8             	mov    %ebp,%r8d
    b91c:	e8 cf 38 00 00       	call   f1f0 <hyperinterval::ieee::Format::power>
    b921:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
    b926:	75 7e                	jne    b9a6 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
    b928:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
    b92d:	44 8b 6c 24 18       	mov    0x18(%rsp),%r13d
    b932:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b937:	be 00 00 00 80       	mov    $0x80000000,%esi
    b93c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b941:	4c 89 f1             	mov    %r14,%rcx
    b944:	41 89 e8             	mov    %ebp,%r8d
    b947:	e8 a4 38 00 00       	call   f1f0 <hyperinterval::ieee::Format::power>
    b94c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b951:	74 53                	je     b9a6 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
    b953:	8b 44 24 10          	mov    0x10(%rsp),%eax
    b957:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    b95c:	8b 44 24 18          	mov    0x18(%rsp),%eax
    b960:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
    b965:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b96a:	be 00 00 00 80       	mov    $0x80000000,%esi
    b96f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b974:	4c 89 e1             	mov    %r12,%rcx
    b977:	e8 54 2a 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    b97c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b981:	74 23                	je     b9a6 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
    b983:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    b988:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b98d:	be 00 00 00 80       	mov    $0x80000000,%esi
    b992:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b997:	4c 89 e9             	mov    %r13,%rcx
    b99a:	e8 31 2a 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    b99f:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b9a4:	75 28                	jne    b9ce <hyperinterval::float::F32Enclosure::checked_pow+0xfe>
    b9a6:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
    b9ab:	88 43 04             	mov    %al,0x4(%rbx)
    b9ae:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    b9b4:	eb 06                	jmp    b9bc <hyperinterval::float::F32Enclosure::checked_pow+0xec>
    b9b6:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
    b9bc:	48 89 d8             	mov    %rbx,%rax
    b9bf:	48 83 c4 38          	add    $0x38,%rsp
    b9c3:	5b                   	pop    %rbx
    b9c4:	41 5c                	pop    %r12
    b9c6:	41 5d                	pop    %r13
    b9c8:	41 5e                	pop    %r14
    b9ca:	41 5f                	pop    %r15
    b9cc:	5d                   	pop    %rbp
    b9cd:	c3                   	ret
    b9ce:	8b 7c 24 10          	mov    0x10(%rsp),%edi
    b9d2:	44 89 e0             	mov    %r12d,%eax
    b9d5:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    b9da:	89 f9                	mov    %edi,%ecx
    b9dc:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    b9e2:	ba 00 00 00 80       	mov    $0x80000000,%edx
    b9e7:	29 c2                	sub    %eax,%edx
    b9e9:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
    b9ef:	44 09 e8             	or     %r13d,%eax
    b9f2:	45 85 e4             	test   %r12d,%r12d
    b9f5:	48 0f 49 d0          	cmovns %rax,%rdx
    b9f9:	be 00 00 00 80       	mov    $0x80000000,%esi
    b9fe:	29 ce                	sub    %ecx,%esi
    ba00:	89 c8                	mov    %ecx,%eax
    ba02:	44 09 e8             	or     %r13d,%eax
    ba05:	85 ff                	test   %edi,%edi
    ba07:	48 0f 49 f0          	cmovns %rax,%rsi
    ba0b:	b0 01                	mov    $0x1,%al
    ba0d:	39 f2                	cmp    %esi,%edx
    ba0f:	77 9a                	ja     b9ab <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
    ba11:	89 7c 24 2c          	mov    %edi,0x2c(%rsp)
    ba15:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    ba1a:	be 00 00 00 80       	mov    $0x80000000,%esi
    ba1f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ba24:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    ba29:	e8 a2 29 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    ba2e:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    ba33:	0f 84 6d ff ff ff    	je     b9a6 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
    ba39:	4c 89 64 24 20       	mov    %r12,0x20(%rsp)
    ba3e:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    ba43:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    ba48:	be 00 00 00 80       	mov    $0x80000000,%esi
    ba4d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ba52:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
    ba57:	e8 74 29 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    ba5c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    ba61:	0f 84 3f ff ff ff    	je     b9a6 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
    ba67:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
    ba6b:	44 89 e0             	mov    %r12d,%eax
    ba6e:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    ba73:	89 ca                	mov    %ecx,%edx
    ba75:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    ba7b:	be 00 00 00 80       	mov    $0x80000000,%esi
    ba80:	29 c6                	sub    %eax,%esi
    ba82:	44 09 e8             	or     %r13d,%eax
    ba85:	45 85 e4             	test   %r12d,%r12d
    ba88:	48 0f 49 f0          	cmovns %rax,%rsi
    ba8c:	89 d0                	mov    %edx,%eax
    ba8e:	44 09 e8             	or     %r13d,%eax
    ba91:	41 29 d5             	sub    %edx,%r13d
    ba94:	85 c9                	test   %ecx,%ecx
    ba96:	4c 0f 49 e8          	cmovns %rax,%r13
    ba9a:	b0 01                	mov    $0x1,%al
    ba9c:	44 39 ee             	cmp    %r13d,%esi
    ba9f:	0f 87 06 ff ff ff    	ja     b9ab <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
    baa5:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
    baaa:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
    baae:	44 89 e2             	mov    %r12d,%edx
    bab1:	e8 6a 27 00 00       	call   e220 <hyperinterval::bounds::Bounds<T>::hull>
    bab6:	41 89 c5             	mov    %eax,%r13d
    bab9:	41 89 d4             	mov    %edx,%r12d
    babc:	85 ed                	test   %ebp,%ebp
    babe:	0f 95 c0             	setne  %al
    bac1:	40 f6 c5 01          	test   $0x1,%bpl
    bac5:	0f 94 c1             	sete   %cl
    bac8:	84 c8                	test   %cl,%al
    baca:	74 11                	je     badd <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
    bacc:	44 89 ff             	mov    %r15d,%edi
    bacf:	44 89 f6             	mov    %r14d,%esi
    bad2:	31 d2                	xor    %edx,%edx
    bad4:	e8 d7 27 00 00       	call   e2b0 <hyperinterval::bounds::Bounds<T>::signs>
    bad9:	a8 02                	test   $0x2,%al
    badb:	75 13                	jne    baf0 <hyperinterval::float::F32Enclosure::checked_pow+0x220>
    badd:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
    bae3:	44 89 6b 04          	mov    %r13d,0x4(%rbx)
    bae7:	44 89 63 08          	mov    %r12d,0x8(%rbx)
    baeb:	e9 cc fe ff ff       	jmp    b9bc <hyperinterval::float::F32Enclosure::checked_pow+0xec>
    baf0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    baf5:	31 f6                	xor    %esi,%esi
    baf7:	31 d2                	xor    %edx,%edx
    baf9:	e8 62 e5 ff ff       	call   a060 <hyperinterval::float::F32Enclosure::from_bits>
    bafe:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    bb02:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
    bb07:	83 f9 02             	cmp    $0x2,%ecx
    bb0a:	0f 84 9b fe ff ff    	je     b9ab <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
    bb10:	f6 c1 01             	test   $0x1,%cl
    bb13:	74 c8                	je     badd <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
    bb15:	0f b6 c0             	movzbl %al,%eax
    bb18:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
    bb1d:	c1 e1 10             	shl    $0x10,%ecx
    bb20:	0f b7 54 24 0d       	movzwl 0xd(%rsp),%edx
    bb25:	09 ca                	or     %ecx,%edx
    bb27:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
    bb2b:	c1 e2 08             	shl    $0x8,%edx
    bb2e:	09 c2                	or     %eax,%edx
    bb30:	44 89 ef             	mov    %r13d,%edi
    bb33:	44 89 e6             	mov    %r12d,%esi
    bb36:	e8 e5 26 00 00       	call   e220 <hyperinterval::bounds::Bounds<T>::hull>
    bb3b:	41 89 c5             	mov    %eax,%r13d
    bb3e:	41 89 d4             	mov    %edx,%r12d
    bb41:	eb 9a                	jmp    badd <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
    bb43:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    bb4a:	00 00 00 
    bb4d:	0f 1f 00             	nopl   (%rax)

hyperinterval::float::F32Enclosure::affine:
    bb50:	55                   	push   %rbp
    bb51:	41 57                	push   %r15
    bb53:	41 56                	push   %r14
    bb55:	41 55                	push   %r13
    bb57:	41 54                	push   %r12
    bb59:	53                   	push   %rbx
    bb5a:	48 83 ec 28          	sub    $0x28,%rsp
    bb5e:	f3 0f 11 4c 24 20    	movss  %xmm1,0x20(%rsp)
    bb64:	49 89 f7             	mov    %rsi,%r15
    bb67:	48 89 fb             	mov    %rdi,%rbx
    bb6a:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
    bb70:	66 0f 7e c1          	movd   %xmm0,%ecx
    bb74:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bb79:	be 00 00 00 80       	mov    $0x80000000,%esi
    bb7e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bb83:	e8 48 28 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    bb88:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bb8d:	74 2a                	je     bbb9 <hyperinterval::float::F32Enclosure::affine+0x69>
    bb8f:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
    bb94:	66 0f 6e 44 24 20    	movd   0x20(%rsp),%xmm0
    bb9a:	66 0f 7e c1          	movd   %xmm0,%ecx
    bb9e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bba3:	be 00 00 00 80       	mov    $0x80000000,%esi
    bba8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bbad:	e8 1e 28 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    bbb2:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bbb7:	75 20                	jne    bbd9 <hyperinterval::float::F32Enclosure::affine+0x89>
    bbb9:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
    bbbe:	88 43 04             	mov    %al,0x4(%rbx)
    bbc1:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    bbc7:	48 89 d8             	mov    %rbx,%rax
    bbca:	48 83 c4 28          	add    $0x28,%rsp
    bbce:	5b                   	pop    %rbx
    bbcf:	41 5c                	pop    %r12
    bbd1:	41 5d                	pop    %r13
    bbd3:	41 5e                	pop    %r14
    bbd5:	41 5f                	pop    %r15
    bbd7:	5d                   	pop    %rbp
    bbd8:	c3                   	ret
    bbd9:	41 f6 07 01          	testb  $0x1,(%r15)
    bbdd:	0f 84 60 01 00 00    	je     bd43 <hyperinterval::float::F32Enclosure::affine+0x1f3>
    bbe3:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
    bbe8:	41 8b 6f 08          	mov    0x8(%r15),%ebp
    bbec:	41 8b 4f 04          	mov    0x4(%r15),%ecx
    bbf0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bbf5:	be 00 00 00 80       	mov    $0x80000000,%esi
    bbfa:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bbff:	4d 89 f0             	mov    %r14,%r8
    bc02:	4d 89 e1             	mov    %r12,%r9
    bc05:	e8 b6 2d 00 00       	call   e9c0 <hyperinterval::ieee::Format::affine>
    bc0a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bc0f:	74 a8                	je     bbb9 <hyperinterval::float::F32Enclosure::affine+0x69>
    bc11:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
    bc16:	8b 44 24 18          	mov    0x18(%rsp),%eax
    bc1a:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    bc1f:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bc24:	be 00 00 00 80       	mov    $0x80000000,%esi
    bc29:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bc2e:	48 89 e9             	mov    %rbp,%rcx
    bc31:	4d 89 f0             	mov    %r14,%r8
    bc34:	4d 89 e1             	mov    %r12,%r9
    bc37:	e8 84 2d 00 00       	call   e9c0 <hyperinterval::ieee::Format::affine>
    bc3c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bc41:	0f 84 72 ff ff ff    	je     bbb9 <hyperinterval::float::F32Enclosure::affine+0x69>
    bc47:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
    bc4c:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
    bc51:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bc56:	be 00 00 00 80       	mov    $0x80000000,%esi
    bc5b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bc60:	4c 89 f9             	mov    %r15,%rcx
    bc63:	e8 68 27 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    bc68:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bc6d:	0f 84 46 ff ff ff    	je     bbb9 <hyperinterval::float::F32Enclosure::affine+0x69>
    bc73:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
    bc78:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bc7d:	be 00 00 00 80       	mov    $0x80000000,%esi
    bc82:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bc87:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    bc8c:	e8 3f 27 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    bc91:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bc96:	0f 84 1d ff ff ff    	je     bbb9 <hyperinterval::float::F32Enclosure::affine+0x69>
    bc9c:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
    bca1:	44 89 f0             	mov    %r14d,%eax
    bca4:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    bca9:	44 89 f9             	mov    %r15d,%ecx
    bcac:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    bcb2:	ba 00 00 00 80       	mov    $0x80000000,%edx
    bcb7:	29 c2                	sub    %eax,%edx
    bcb9:	44 09 e8             	or     %r13d,%eax
    bcbc:	45 85 f6             	test   %r14d,%r14d
    bcbf:	48 0f 49 d0          	cmovns %rax,%rdx
    bcc3:	89 c8                	mov    %ecx,%eax
    bcc5:	44 09 e8             	or     %r13d,%eax
    bcc8:	41 29 cd             	sub    %ecx,%r13d
    bccb:	45 85 ff             	test   %r15d,%r15d
    bcce:	4c 0f 49 e8          	cmovns %rax,%r13
    bcd2:	b0 01                	mov    $0x1,%al
    bcd4:	44 39 ea             	cmp    %r13d,%edx
    bcd7:	0f 87 e1 fe ff ff    	ja     bbbe <hyperinterval::float::F32Enclosure::affine+0x6e>
    bcdd:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bce2:	48 89 ee             	mov    %rbp,%rsi
    bce5:	4c 89 e2             	mov    %r12,%rdx
    bce8:	e8 73 e3 ff ff       	call   a060 <hyperinterval::float::F32Enclosure::from_bits>
    bced:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    bcf1:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
    bcf6:	83 f9 02             	cmp    $0x2,%ecx
    bcf9:	0f 84 bf fe ff ff    	je     bbbe <hyperinterval::float::F32Enclosure::affine+0x6e>
    bcff:	f6 c1 01             	test   $0x1,%cl
    bd02:	74 2c                	je     bd30 <hyperinterval::float::F32Enclosure::affine+0x1e0>
    bd04:	0f b6 c0             	movzbl %al,%eax
    bd07:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
    bd0c:	c1 e1 10             	shl    $0x10,%ecx
    bd0f:	0f b7 54 24 0d       	movzwl 0xd(%rsp),%edx
    bd14:	09 ca                	or     %ecx,%edx
    bd16:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
    bd1a:	c1 e2 08             	shl    $0x8,%edx
    bd1d:	09 c2                	or     %eax,%edx
    bd1f:	44 89 f7             	mov    %r14d,%edi
    bd22:	44 89 fe             	mov    %r15d,%esi
    bd25:	e8 f6 24 00 00       	call   e220 <hyperinterval::bounds::Bounds<T>::hull>
    bd2a:	41 89 c6             	mov    %eax,%r14d
    bd2d:	41 89 d7             	mov    %edx,%r15d
    bd30:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
    bd36:	44 89 73 04          	mov    %r14d,0x4(%rbx)
    bd3a:	44 89 7b 08          	mov    %r15d,0x8(%rbx)
    bd3e:	e9 84 fe ff ff       	jmp    bbc7 <hyperinterval::float::F32Enclosure::affine+0x77>
    bd43:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
    bd49:	e9 79 fe ff ff       	jmp    bbc7 <hyperinterval::float::F32Enclosure::affine+0x77>
    bd4e:	66 90                	xchg   %ax,%ax

hyperinterval::float::F32Enclosure::next_down:
    bd50:	53                   	push   %rbx
    bd51:	48 83 ec 10          	sub    $0x10,%rsp
    bd55:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    bd5a:	66 0f 7e c1          	movd   %xmm0,%ecx
    bd5e:	48 89 e7             	mov    %rsp,%rdi
    bd61:	be 00 00 00 80       	mov    $0x80000000,%esi
    bd66:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bd6b:	e8 60 26 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    bd70:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    bd74:	75 0a                	jne    bd80 <hyperinterval::float::F32Enclosure::next_down+0x30>
    bd76:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
    bd7b:	c1 e1 08             	shl    $0x8,%ecx
    bd7e:	eb 3d                	jmp    bdbd <hyperinterval::float::F32Enclosure::next_down+0x6d>
    bd80:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    bd85:	48 89 c1             	mov    %rax,%rcx
    bd88:	48 31 d9             	xor    %rbx,%rcx
    bd8b:	48 85 c0             	test   %rax,%rax
    bd8e:	48 0f 44 c8          	cmove  %rax,%rcx
    bd92:	31 c0                	xor    %eax,%eax
    bd94:	85 c9                	test   %ecx,%ecx
    bd96:	0f 99 c0             	setns  %al
    bd99:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
    bd9d:	48 ff c9             	dec    %rcx
    bda0:	48 89 e7             	mov    %rsp,%rdi
    bda3:	be 00 00 00 80       	mov    $0x80000000,%esi
    bda8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bdad:	e8 1e 26 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    bdb2:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    bdb6:	75 13                	jne    bdcb <hyperinterval::float::F32Enclosure::next_down+0x7b>
    bdb8:	b9 00 03 00 00       	mov    $0x300,%ecx
    bdbd:	b8 01 00 00 00       	mov    $0x1,%eax
    bdc2:	48 09 c8             	or     %rcx,%rax
    bdc5:	48 83 c4 10          	add    $0x10,%rsp
    bdc9:	5b                   	pop    %rbx
    bdca:	c3                   	ret
    bdcb:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    bdd0:	48 89 c1             	mov    %rax,%rcx
    bdd3:	48 81 f1 00 00 00 80 	xor    $0xffffffff80000000,%rcx
    bdda:	48 c1 e1 20          	shl    $0x20,%rcx
    bdde:	48 85 c0             	test   %rax,%rax
    bde1:	48 0f 44 c8          	cmove  %rax,%rcx
    bde5:	31 c0                	xor    %eax,%eax
    bde7:	48 09 c8             	or     %rcx,%rax
    bdea:	48 83 c4 10          	add    $0x10,%rsp
    bdee:	5b                   	pop    %rbx
    bdef:	c3                   	ret

hyperinterval::float::F32Enclosure::next_up:
    bdf0:	48 83 ec 18          	sub    $0x18,%rsp
    bdf4:	66 0f 7e c1          	movd   %xmm0,%ecx
    bdf8:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bdfd:	be 00 00 00 80       	mov    $0x80000000,%esi
    be02:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    be07:	e8 c4 25 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    be0c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    be11:	75 15                	jne    be28 <hyperinterval::float::F32Enclosure::next_up+0x38>
    be13:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
    be18:	c1 e1 08             	shl    $0x8,%ecx
    be1b:	b8 01 00 00 00       	mov    $0x1,%eax
    be20:	48 09 c8             	or     %rcx,%rax
    be23:	48 83 c4 18          	add    $0x18,%rsp
    be27:	c3                   	ret
    be28:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    be2d:	31 c9                	xor    %ecx,%ecx
    be2f:	85 c0                	test   %eax,%eax
    be31:	0f 99 c1             	setns  %cl
    be34:	48 8d 0c 48          	lea    (%rax,%rcx,2),%rcx
    be38:	48 ff c9             	dec    %rcx
    be3b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    be40:	be 00 00 00 80       	mov    $0x80000000,%esi
    be45:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    be4a:	e8 81 25 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    be4f:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    be54:	75 12                	jne    be68 <hyperinterval::float::F32Enclosure::next_up+0x78>
    be56:	b9 00 03 00 00       	mov    $0x300,%ecx
    be5b:	b8 01 00 00 00       	mov    $0x1,%eax
    be60:	48 09 c8             	or     %rcx,%rax
    be63:	48 83 c4 18          	add    $0x18,%rsp
    be67:	c3                   	ret
    be68:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    be6d:	48 c1 e1 20          	shl    $0x20,%rcx
    be71:	31 c0                	xor    %eax,%eax
    be73:	48 09 c8             	or     %rcx,%rax
    be76:	48 83 c4 18          	add    $0x18,%rsp
    be7a:	c3                   	ret
    be7b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

hyperinterval::float::F32Enclosure::expanded:
    be80:	41 57                	push   %r15
    be82:	41 56                	push   %r14
    be84:	41 54                	push   %r12
    be86:	53                   	push   %rbx
    be87:	48 83 ec 18          	sub    $0x18,%rsp
    be8b:	48 89 fb             	mov    %rdi,%rbx
    be8e:	f6 06 01             	testb  $0x1,(%rsi)
    be91:	74 7c                	je     bf0f <hyperinterval::float::F32Enclosure::expanded+0x8f>
    be93:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
    be99:	8b 46 04             	mov    0x4(%rsi),%eax
    be9c:	44 8b 76 08          	mov    0x8(%rsi),%r14d
    bea0:	8d 88 00 00 00 80    	lea    -0x80000000(%rax),%ecx
    bea6:	85 c0                	test   %eax,%eax
    bea8:	0f 44 c8             	cmove  %eax,%ecx
    beab:	31 c0                	xor    %eax,%eax
    bead:	85 c9                	test   %ecx,%ecx
    beaf:	0f 99 c0             	setns  %al
    beb2:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
    beb6:	48 ff c9             	dec    %rcx
    beb9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bebe:	be 00 00 00 80       	mov    $0x80000000,%esi
    bec3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bec8:	e8 03 25 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    becd:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
    bed2:	75 2f                	jne    bf03 <hyperinterval::float::F32Enclosure::expanded+0x83>
    bed4:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    bed9:	31 c0                	xor    %eax,%eax
    bedb:	45 85 f6             	test   %r14d,%r14d
    bede:	0f 99 c0             	setns  %al
    bee1:	49 8d 0c 46          	lea    (%r14,%rax,2),%rcx
    bee5:	48 ff c9             	dec    %rcx
    bee8:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    beed:	be 00 00 00 80       	mov    $0x80000000,%esi
    bef2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bef7:	e8 d4 24 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    befc:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bf01:	75 21                	jne    bf24 <hyperinterval::float::F32Enclosure::expanded+0xa4>
    bf03:	c6 43 04 03          	movb   $0x3,0x4(%rbx)
    bf07:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    bf0d:	eb 06                	jmp    bf15 <hyperinterval::float::F32Enclosure::expanded+0x95>
    bf0f:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
    bf15:	48 89 d8             	mov    %rbx,%rax
    bf18:	48 83 c4 18          	add    $0x18,%rsp
    bf1c:	5b                   	pop    %rbx
    bf1d:	41 5c                	pop    %r12
    bf1f:	41 5e                	pop    %r14
    bf21:	41 5f                	pop    %r15
    bf23:	c3                   	ret
    bf24:	44 89 e1             	mov    %r12d,%ecx
    bf27:	4c 31 f9             	xor    %r15,%rcx
    bf2a:	4d 85 e4             	test   %r12,%r12
    bf2d:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
    bf32:	49 0f 44 cc          	cmove  %r12,%rcx
    bf36:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bf3b:	be 00 00 00 80       	mov    $0x80000000,%esi
    bf40:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bf45:	e8 86 24 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    bf4a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bf4f:	74 23                	je     bf74 <hyperinterval::float::F32Enclosure::expanded+0xf4>
    bf51:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    bf56:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bf5b:	be 00 00 00 80       	mov    $0x80000000,%esi
    bf60:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bf65:	4c 89 f1             	mov    %r14,%rcx
    bf68:	e8 63 24 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    bf6d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bf72:	75 10                	jne    bf84 <hyperinterval::float::F32Enclosure::expanded+0x104>
    bf74:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
    bf79:	88 43 04             	mov    %al,0x4(%rbx)
    bf7c:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    bf82:	eb 91                	jmp    bf15 <hyperinterval::float::F32Enclosure::expanded+0x95>
    bf84:	8b 44 24 10          	mov    0x10(%rsp),%eax
    bf88:	44 89 e1             	mov    %r12d,%ecx
    bf8b:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    bf91:	89 c2                	mov    %eax,%edx
    bf93:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    bf99:	be 00 00 00 80       	mov    $0x80000000,%esi
    bf9e:	29 ce                	sub    %ecx,%esi
    bfa0:	44 09 f9             	or     %r15d,%ecx
    bfa3:	45 85 e4             	test   %r12d,%r12d
    bfa6:	48 0f 49 f1          	cmovns %rcx,%rsi
    bfaa:	89 d1                	mov    %edx,%ecx
    bfac:	44 09 f9             	or     %r15d,%ecx
    bfaf:	41 29 d7             	sub    %edx,%r15d
    bfb2:	85 c0                	test   %eax,%eax
    bfb4:	4c 0f 49 f9          	cmovns %rcx,%r15
    bfb8:	44 39 fe             	cmp    %r15d,%esi
    bfbb:	76 0f                	jbe    bfcc <hyperinterval::float::F32Enclosure::expanded+0x14c>
    bfbd:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
    bfc1:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    bfc7:	e9 49 ff ff ff       	jmp    bf15 <hyperinterval::float::F32Enclosure::expanded+0x95>
    bfcc:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
    bfd2:	44 89 63 04          	mov    %r12d,0x4(%rbx)
    bfd6:	89 43 08             	mov    %eax,0x8(%rbx)
    bfd9:	e9 37 ff ff ff       	jmp    bf15 <hyperinterval::float::F32Enclosure::expanded+0x95>
    bfde:	66 90                	xchg   %ax,%ax

hyperinterval::float::F64Enclosure::new:
    bfe0:	41 57                	push   %r15
    bfe2:	41 56                	push   %r14
    bfe4:	41 54                	push   %r12
    bfe6:	53                   	push   %rbx
    bfe7:	48 83 ec 18          	sub    $0x18,%rsp
    bfeb:	f2 0f 11 4c 24 10    	movsd  %xmm1,0x10(%rsp)
    bff1:	48 89 fb             	mov    %rdi,%rbx
    bff4:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
    bffb:	00 00 80 
    bffe:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
    c005:	00 f0 7f 
    c008:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    c00d:	48 89 e7             	mov    %rsp,%rdi
    c010:	4c 89 f6             	mov    %r14,%rsi
    c013:	4c 89 fa             	mov    %r15,%rdx
    c016:	e8 b5 23 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    c01b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    c01f:	74 24                	je     c045 <hyperinterval::float::F64Enclosure::new+0x65>
    c021:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    c026:	f3 0f 7e 44 24 10    	movq   0x10(%rsp),%xmm0
    c02c:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    c031:	48 89 e7             	mov    %rsp,%rdi
    c034:	4c 89 f6             	mov    %r14,%rsi
    c037:	4c 89 fa             	mov    %r15,%rdx
    c03a:	e8 91 23 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    c03f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    c043:	75 1e                	jne    c063 <hyperinterval::float::F64Enclosure::new+0x83>
    c045:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    c04a:	88 43 08             	mov    %al,0x8(%rbx)
    c04d:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    c054:	48 89 d8             	mov    %rbx,%rax
    c057:	48 83 c4 18          	add    $0x18,%rsp
    c05b:	5b                   	pop    %rbx
    c05c:	41 5c                	pop    %r12
    c05e:	41 5e                	pop    %r14
    c060:	41 5f                	pop    %r15
    c062:	c3                   	ret
    c063:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    c068:	4c 89 e1             	mov    %r12,%rcx
    c06b:	4c 09 f1             	or     %r14,%rcx
    c06e:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
    c072:	4c 89 e6             	mov    %r12,%rsi
    c075:	48 21 d6             	and    %rdx,%rsi
    c078:	4c 89 f7             	mov    %r14,%rdi
    c07b:	48 29 f7             	sub    %rsi,%rdi
    c07e:	4d 85 e4             	test   %r12,%r12
    c081:	48 0f 49 f9          	cmovns %rcx,%rdi
    c085:	48 89 c1             	mov    %rax,%rcx
    c088:	4c 09 f1             	or     %r14,%rcx
    c08b:	48 21 c2             	and    %rax,%rdx
    c08e:	49 29 d6             	sub    %rdx,%r14
    c091:	48 85 c0             	test   %rax,%rax
    c094:	4c 0f 49 f1          	cmovns %rcx,%r14
    c098:	4c 39 f7             	cmp    %r14,%rdi
    c09b:	76 06                	jbe    c0a3 <hyperinterval::float::F64Enclosure::new+0xc3>
    c09d:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
    c0a1:	eb aa                	jmp    c04d <hyperinterval::float::F64Enclosure::new+0x6d>
    c0a3:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
    c0aa:	4c 89 63 08          	mov    %r12,0x8(%rbx)
    c0ae:	48 89 43 10          	mov    %rax,0x10(%rbx)
    c0b2:	eb a0                	jmp    c054 <hyperinterval::float::F64Enclosure::new+0x74>
    c0b4:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    c0bb:	00 00 00 
    c0be:	66 90                	xchg   %ax,%ax

hyperinterval::float::F64Enclosure::point:
    c0c0:	53                   	push   %rbx
    c0c1:	48 83 ec 10          	sub    $0x10,%rsp
    c0c5:	48 89 fb             	mov    %rdi,%rbx
    c0c8:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    c0cd:	48 89 e7             	mov    %rsp,%rdi
    c0d0:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c0d7:	00 00 80 
    c0da:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
    c0e1:	00 f0 7f 
    c0e4:	e8 e7 22 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    c0e9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    c0ed:	75 0f                	jne    c0fe <hyperinterval::float::F64Enclosure::point+0x3e>
    c0ef:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    c0f4:	88 43 08             	mov    %al,0x8(%rbx)
    c0f7:	b8 02 00 00 00       	mov    $0x2,%eax
    c0fc:	eb 12                	jmp    c110 <hyperinterval::float::F64Enclosure::point+0x50>
    c0fe:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    c103:	48 89 43 08          	mov    %rax,0x8(%rbx)
    c107:	48 89 43 10          	mov    %rax,0x10(%rbx)
    c10b:	b8 01 00 00 00       	mov    $0x1,%eax
    c110:	48 89 03             	mov    %rax,(%rbx)
    c113:	48 89 d8             	mov    %rbx,%rax
    c116:	48 83 c4 10          	add    $0x10,%rsp
    c11a:	5b                   	pop    %rbx
    c11b:	c3                   	ret
    c11c:	0f 1f 40 00          	nopl   0x0(%rax)

hyperinterval::float::F64Enclosure::from_bits:
    c120:	41 57                	push   %r15
    c122:	41 56                	push   %r14
    c124:	41 55                	push   %r13
    c126:	41 54                	push   %r12
    c128:	53                   	push   %rbx
    c129:	48 83 ec 10          	sub    $0x10,%rsp
    c12d:	49 89 d7             	mov    %rdx,%r15
    c130:	48 89 f1             	mov    %rsi,%rcx
    c133:	48 89 fb             	mov    %rdi,%rbx
    c136:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
    c13d:	00 00 80 
    c140:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
    c147:	00 f0 7f 
    c14a:	48 89 e7             	mov    %rsp,%rdi
    c14d:	4c 89 f6             	mov    %r14,%rsi
    c150:	4c 89 e2             	mov    %r12,%rdx
    c153:	e8 78 22 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    c158:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    c15c:	74 1c                	je     c17a <hyperinterval::float::F64Enclosure::from_bits+0x5a>
    c15e:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    c163:	48 89 e7             	mov    %rsp,%rdi
    c166:	4c 89 f6             	mov    %r14,%rsi
    c169:	4c 89 e2             	mov    %r12,%rdx
    c16c:	4c 89 f9             	mov    %r15,%rcx
    c16f:	e8 5c 22 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    c174:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    c178:	75 1d                	jne    c197 <hyperinterval::float::F64Enclosure::from_bits+0x77>
    c17a:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    c17f:	88 43 08             	mov    %al,0x8(%rbx)
    c182:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    c189:	48 83 c4 10          	add    $0x10,%rsp
    c18d:	5b                   	pop    %rbx
    c18e:	41 5c                	pop    %r12
    c190:	41 5d                	pop    %r13
    c192:	41 5e                	pop    %r14
    c194:	41 5f                	pop    %r15
    c196:	c3                   	ret
    c197:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    c19c:	4c 89 e9             	mov    %r13,%rcx
    c19f:	4c 09 f1             	or     %r14,%rcx
    c1a2:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
    c1a6:	4c 89 ee             	mov    %r13,%rsi
    c1a9:	48 21 d6             	and    %rdx,%rsi
    c1ac:	4c 89 f7             	mov    %r14,%rdi
    c1af:	48 29 f7             	sub    %rsi,%rdi
    c1b2:	4d 85 ed             	test   %r13,%r13
    c1b5:	48 0f 49 f9          	cmovns %rcx,%rdi
    c1b9:	48 89 c1             	mov    %rax,%rcx
    c1bc:	4c 09 f1             	or     %r14,%rcx
    c1bf:	48 21 c2             	and    %rax,%rdx
    c1c2:	49 29 d6             	sub    %rdx,%r14
    c1c5:	48 85 c0             	test   %rax,%rax
    c1c8:	4c 0f 49 f1          	cmovns %rcx,%r14
    c1cc:	4c 39 f7             	cmp    %r14,%rdi
    c1cf:	76 06                	jbe    c1d7 <hyperinterval::float::F64Enclosure::from_bits+0xb7>
    c1d1:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
    c1d5:	eb ab                	jmp    c182 <hyperinterval::float::F64Enclosure::from_bits+0x62>
    c1d7:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
    c1de:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
    c1e2:	48 89 43 10          	mov    %rax,0x10(%rbx)
    c1e6:	eb a1                	jmp    c189 <hyperinterval::float::F64Enclosure::from_bits+0x69>
    c1e8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    c1ef:	00 

hyperinterval::float::F64Enclosure::contains_point:
    c1f0:	41 56                	push   %r14
    c1f2:	53                   	push   %rbx
    c1f3:	48 83 ec 18          	sub    $0x18,%rsp
    c1f7:	49 89 fe             	mov    %rdi,%r14
    c1fa:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
    c201:	00 00 80 
    c204:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    c209:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    c20e:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
    c215:	00 f0 7f 
    c218:	48 89 de             	mov    %rbx,%rsi
    c21b:	e8 b0 21 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    c220:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
    c225:	3c 01                	cmp    $0x1,%al
    c227:	75 0d                	jne    c236 <hyperinterval::float::F64Enclosure::contains_point+0x46>
    c229:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
    c22e:	48 83 c4 18          	add    $0x18,%rsp
    c232:	5b                   	pop    %rbx
    c233:	41 5e                	pop    %r14
    c235:	c3                   	ret
    c236:	41 f6 06 01          	testb  $0x1,(%r14)
    c23a:	74 44                	je     c280 <hyperinterval::float::F64Enclosure::contains_point+0x90>
    c23c:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
    c241:	49 8b 56 08          	mov    0x8(%r14),%rdx
    c245:	48 89 d7             	mov    %rdx,%rdi
    c248:	48 09 df             	or     %rbx,%rdi
    c24b:	48 8d 4b ff          	lea    -0x1(%rbx),%rcx
    c24f:	49 89 d0             	mov    %rdx,%r8
    c252:	49 21 c8             	and    %rcx,%r8
    c255:	49 89 d9             	mov    %rbx,%r9
    c258:	4d 29 c1             	sub    %r8,%r9
    c25b:	48 85 d2             	test   %rdx,%rdx
    c25e:	4c 0f 49 cf          	cmovns %rdi,%r9
    c262:	48 89 f7             	mov    %rsi,%rdi
    c265:	48 09 df             	or     %rbx,%rdi
    c268:	49 89 f0             	mov    %rsi,%r8
    c26b:	49 21 c8             	and    %rcx,%r8
    c26e:	48 89 da             	mov    %rbx,%rdx
    c271:	4c 29 c2             	sub    %r8,%rdx
    c274:	48 85 f6             	test   %rsi,%rsi
    c277:	48 0f 49 d7          	cmovns %rdi,%rdx
    c27b:	49 39 d1             	cmp    %rdx,%r9
    c27e:	76 0a                	jbe    c28a <hyperinterval::float::F64Enclosure::contains_point+0x9a>
    c280:	31 d2                	xor    %edx,%edx
    c282:	48 83 c4 18          	add    $0x18,%rsp
    c286:	5b                   	pop    %rbx
    c287:	41 5e                	pop    %r14
    c289:	c3                   	ret
    c28a:	49 8b 76 10          	mov    0x10(%r14),%rsi
    c28e:	48 89 f7             	mov    %rsi,%rdi
    c291:	48 09 df             	or     %rbx,%rdi
    c294:	48 21 f1             	and    %rsi,%rcx
    c297:	48 29 cb             	sub    %rcx,%rbx
    c29a:	48 85 f6             	test   %rsi,%rsi
    c29d:	48 0f 49 df          	cmovns %rdi,%rbx
    c2a1:	48 39 da             	cmp    %rbx,%rdx
    c2a4:	0f 96 c2             	setbe  %dl
    c2a7:	48 83 c4 18          	add    $0x18,%rsp
    c2ab:	5b                   	pop    %rbx
    c2ac:	41 5e                	pop    %r14
    c2ae:	c3                   	ret
    c2af:	90                   	nop

hyperinterval::float::F64Enclosure::subset_of:
    c2b0:	b0 01                	mov    $0x1,%al
    c2b2:	f6 07 01             	testb  $0x1,(%rdi)
    c2b5:	74 54                	je     c30b <hyperinterval::float::F64Enclosure::subset_of+0x5b>
    c2b7:	f6 06 01             	testb  $0x1,(%rsi)
    c2ba:	74 4d                	je     c309 <hyperinterval::float::F64Enclosure::subset_of+0x59>
    c2bc:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    c2c0:	4c 8b 46 08          	mov    0x8(%rsi),%r8
    c2c4:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    c2cb:	00 00 80 
    c2ce:	4d 89 c1             	mov    %r8,%r9
    c2d1:	49 09 c1             	or     %rax,%r9
    c2d4:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
    c2d8:	4d 89 c2             	mov    %r8,%r10
    c2db:	49 21 ca             	and    %rcx,%r10
    c2de:	49 89 c3             	mov    %rax,%r11
    c2e1:	4d 29 d3             	sub    %r10,%r11
    c2e4:	4d 85 c0             	test   %r8,%r8
    c2e7:	4d 0f 49 d9          	cmovns %r9,%r11
    c2eb:	49 89 d0             	mov    %rdx,%r8
    c2ee:	49 09 c0             	or     %rax,%r8
    c2f1:	49 89 d1             	mov    %rdx,%r9
    c2f4:	49 21 c9             	and    %rcx,%r9
    c2f7:	49 89 c2             	mov    %rax,%r10
    c2fa:	4d 29 ca             	sub    %r9,%r10
    c2fd:	48 85 d2             	test   %rdx,%rdx
    c300:	4d 0f 49 d0          	cmovns %r8,%r10
    c304:	4d 39 d3             	cmp    %r10,%r11
    c307:	76 03                	jbe    c30c <hyperinterval::float::F64Enclosure::subset_of+0x5c>
    c309:	31 c0                	xor    %eax,%eax
    c30b:	c3                   	ret
    c30c:	48 8b 57 10          	mov    0x10(%rdi),%rdx
    c310:	48 89 d7             	mov    %rdx,%rdi
    c313:	48 09 c7             	or     %rax,%rdi
    c316:	49 89 d0             	mov    %rdx,%r8
    c319:	49 21 c8             	and    %rcx,%r8
    c31c:	49 89 c1             	mov    %rax,%r9
    c31f:	4d 29 c1             	sub    %r8,%r9
    c322:	48 85 d2             	test   %rdx,%rdx
    c325:	4c 0f 49 cf          	cmovns %rdi,%r9
    c329:	48 8b 56 10          	mov    0x10(%rsi),%rdx
    c32d:	48 89 d6             	mov    %rdx,%rsi
    c330:	48 09 c6             	or     %rax,%rsi
    c333:	48 21 d1             	and    %rdx,%rcx
    c336:	48 29 c8             	sub    %rcx,%rax
    c339:	48 85 d2             	test   %rdx,%rdx
    c33c:	48 0f 49 c6          	cmovns %rsi,%rax
    c340:	49 39 c1             	cmp    %rax,%r9
    c343:	0f 96 c0             	setbe  %al
    c346:	c3                   	ret
    c347:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    c34e:	00 00 

hyperinterval::float::F64Enclosure::interior_subset_of:
    c350:	b0 01                	mov    $0x1,%al
    c352:	f6 07 01             	testb  $0x1,(%rdi)
    c355:	0f 84 93 00 00 00    	je     c3ee <hyperinterval::float::F64Enclosure::interior_subset_of+0x9e>
    c35b:	f6 06 01             	testb  $0x1,(%rsi)
    c35e:	0f 84 88 00 00 00    	je     c3ec <hyperinterval::float::F64Enclosure::interior_subset_of+0x9c>
    c364:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    c368:	4c 8b 46 08          	mov    0x8(%rsi),%r8
    c36c:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    c373:	00 00 80 
    c376:	4d 89 c1             	mov    %r8,%r9
    c379:	49 09 c1             	or     %rax,%r9
    c37c:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
    c380:	4d 89 c2             	mov    %r8,%r10
    c383:	49 21 ca             	and    %rcx,%r10
    c386:	49 89 c3             	mov    %rax,%r11
    c389:	4d 29 d3             	sub    %r10,%r11
    c38c:	4d 85 c0             	test   %r8,%r8
    c38f:	4d 0f 49 d9          	cmovns %r9,%r11
    c393:	49 89 d0             	mov    %rdx,%r8
    c396:	49 09 c0             	or     %rax,%r8
    c399:	49 89 d1             	mov    %rdx,%r9
    c39c:	49 21 c9             	and    %rcx,%r9
    c39f:	49 89 c2             	mov    %rax,%r10
    c3a2:	4d 29 ca             	sub    %r9,%r10
    c3a5:	48 85 d2             	test   %rdx,%rdx
    c3a8:	4d 0f 49 d0          	cmovns %r8,%r10
    c3ac:	4d 39 d3             	cmp    %r10,%r11
    c3af:	73 3b                	jae    c3ec <hyperinterval::float::F64Enclosure::interior_subset_of+0x9c>
    c3b1:	48 8b 57 10          	mov    0x10(%rdi),%rdx
    c3b5:	48 8b 76 10          	mov    0x10(%rsi),%rsi
    c3b9:	48 89 d7             	mov    %rdx,%rdi
    c3bc:	48 09 c7             	or     %rax,%rdi
    c3bf:	49 89 d0             	mov    %rdx,%r8
    c3c2:	49 21 c8             	and    %rcx,%r8
    c3c5:	49 89 c1             	mov    %rax,%r9
    c3c8:	4d 29 c1             	sub    %r8,%r9
    c3cb:	48 85 d2             	test   %rdx,%rdx
    c3ce:	4c 0f 49 cf          	cmovns %rdi,%r9
    c3d2:	48 89 f2             	mov    %rsi,%rdx
    c3d5:	48 09 c2             	or     %rax,%rdx
    c3d8:	48 21 f1             	and    %rsi,%rcx
    c3db:	48 29 c8             	sub    %rcx,%rax
    c3de:	48 85 f6             	test   %rsi,%rsi
    c3e1:	48 0f 49 c2          	cmovns %rdx,%rax
    c3e5:	49 39 c1             	cmp    %rax,%r9
    c3e8:	0f 92 c0             	setb   %al
    c3eb:	c3                   	ret
    c3ec:	31 c0                	xor    %eax,%eax
    c3ee:	c3                   	ret
    c3ef:	90                   	nop

hyperinterval::float::F64Enclosure::disjoint:
    c3f0:	48 83 3f 00          	cmpq   $0x0,(%rdi)
    c3f4:	0f 94 c0             	sete   %al
    c3f7:	48 8b 0e             	mov    (%rsi),%rcx
    c3fa:	48 85 c9             	test   %rcx,%rcx
    c3fd:	0f 94 c2             	sete   %dl
    c400:	08 c2                	or     %al,%dl
    c402:	b0 01                	mov    $0x1,%al
    c404:	74 01                	je     c407 <hyperinterval::float::F64Enclosure::disjoint+0x17>
    c406:	c3                   	ret
    c407:	f6 c1 01             	test   $0x1,%cl
    c40a:	0f 84 8a 00 00 00    	je     c49a <hyperinterval::float::F64Enclosure::disjoint+0xaa>
    c410:	53                   	push   %rbx
    c411:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
    c418:	00 00 80 
    c41b:	4c 8b 46 08          	mov    0x8(%rsi),%r8
    c41f:	4c 8b 4f 10          	mov    0x10(%rdi),%r9
    c423:	4d 89 ca             	mov    %r9,%r10
    c426:	49 09 ca             	or     %rcx,%r10
    c429:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
    c42d:	4d 89 cb             	mov    %r9,%r11
    c430:	49 21 d3             	and    %rdx,%r11
    c433:	48 89 cb             	mov    %rcx,%rbx
    c436:	4c 29 db             	sub    %r11,%rbx
    c439:	4d 85 c9             	test   %r9,%r9
    c43c:	49 0f 49 da          	cmovns %r10,%rbx
    c440:	4d 89 c1             	mov    %r8,%r9
    c443:	49 09 c9             	or     %rcx,%r9
    c446:	4d 89 c2             	mov    %r8,%r10
    c449:	49 21 d2             	and    %rdx,%r10
    c44c:	49 89 cb             	mov    %rcx,%r11
    c44f:	4d 29 d3             	sub    %r10,%r11
    c452:	4d 85 c0             	test   %r8,%r8
    c455:	4d 0f 49 d9          	cmovns %r9,%r11
    c459:	4c 39 db             	cmp    %r11,%rbx
    c45c:	5b                   	pop    %rbx
    c45d:	72 a7                	jb     c406 <hyperinterval::float::F64Enclosure::disjoint+0x16>
    c45f:	48 8b 47 08          	mov    0x8(%rdi),%rax
    c463:	48 8b 76 10          	mov    0x10(%rsi),%rsi
    c467:	48 89 f7             	mov    %rsi,%rdi
    c46a:	48 09 cf             	or     %rcx,%rdi
    c46d:	49 89 f0             	mov    %rsi,%r8
    c470:	49 21 d0             	and    %rdx,%r8
    c473:	49 89 c9             	mov    %rcx,%r9
    c476:	4d 29 c1             	sub    %r8,%r9
    c479:	48 85 f6             	test   %rsi,%rsi
    c47c:	4c 0f 49 cf          	cmovns %rdi,%r9
    c480:	48 89 c6             	mov    %rax,%rsi
    c483:	48 09 ce             	or     %rcx,%rsi
    c486:	48 21 c2             	and    %rax,%rdx
    c489:	48 29 d1             	sub    %rdx,%rcx
    c48c:	48 85 c0             	test   %rax,%rax
    c48f:	48 0f 49 ce          	cmovns %rsi,%rcx
    c493:	49 39 c9             	cmp    %rcx,%r9
    c496:	0f 92 c0             	setb   %al
    c499:	c3                   	ret
    c49a:	31 c0                	xor    %eax,%eax
    c49c:	c3                   	ret
    c49d:	0f 1f 00             	nopl   (%rax)

hyperinterval::float::F64Enclosure::overlaps:
    c4a0:	48 83 3f 00          	cmpq   $0x0,(%rdi)
    c4a4:	0f 94 c0             	sete   %al
    c4a7:	48 8b 0e             	mov    (%rsi),%rcx
    c4aa:	48 85 c9             	test   %rcx,%rcx
    c4ad:	0f 94 c2             	sete   %dl
    c4b0:	08 c2                	or     %al,%dl
    c4b2:	74 03                	je     c4b7 <hyperinterval::float::F64Enclosure::overlaps+0x17>
    c4b4:	31 c0                	xor    %eax,%eax
    c4b6:	c3                   	ret
    c4b7:	b0 01                	mov    $0x1,%al
    c4b9:	f6 c1 01             	test   $0x1,%cl
    c4bc:	0f 84 8a 00 00 00    	je     c54c <hyperinterval::float::F64Enclosure::overlaps+0xac>
    c4c2:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    c4c9:	00 00 80 
    c4cc:	48 8b 56 08          	mov    0x8(%rsi),%rdx
    c4d0:	4c 8b 47 10          	mov    0x10(%rdi),%r8
    c4d4:	4d 89 c1             	mov    %r8,%r9
    c4d7:	49 09 c1             	or     %rax,%r9
    c4da:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
    c4de:	4d 89 c2             	mov    %r8,%r10
    c4e1:	49 21 ca             	and    %rcx,%r10
    c4e4:	49 89 c3             	mov    %rax,%r11
    c4e7:	4d 29 d3             	sub    %r10,%r11
    c4ea:	4d 85 c0             	test   %r8,%r8
    c4ed:	4d 0f 49 d9          	cmovns %r9,%r11
    c4f1:	49 89 d0             	mov    %rdx,%r8
    c4f4:	49 09 c0             	or     %rax,%r8
    c4f7:	49 89 d1             	mov    %rdx,%r9
    c4fa:	49 21 c9             	and    %rcx,%r9
    c4fd:	49 89 c2             	mov    %rax,%r10
    c500:	4d 29 ca             	sub    %r9,%r10
    c503:	48 85 d2             	test   %rdx,%rdx
    c506:	4d 0f 49 d0          	cmovns %r8,%r10
    c50a:	4d 39 d3             	cmp    %r10,%r11
    c50d:	73 03                	jae    c512 <hyperinterval::float::F64Enclosure::overlaps+0x72>
    c50f:	31 c0                	xor    %eax,%eax
    c511:	c3                   	ret
    c512:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    c516:	48 8b 76 10          	mov    0x10(%rsi),%rsi
    c51a:	48 89 f7             	mov    %rsi,%rdi
    c51d:	48 09 c7             	or     %rax,%rdi
    c520:	49 89 f0             	mov    %rsi,%r8
    c523:	49 21 c8             	and    %rcx,%r8
    c526:	49 89 c1             	mov    %rax,%r9
    c529:	4d 29 c1             	sub    %r8,%r9
    c52c:	48 85 f6             	test   %rsi,%rsi
    c52f:	4c 0f 49 cf          	cmovns %rdi,%r9
    c533:	48 89 d6             	mov    %rdx,%rsi
    c536:	48 09 c6             	or     %rax,%rsi
    c539:	48 21 d1             	and    %rdx,%rcx
    c53c:	48 29 c8             	sub    %rcx,%rax
    c53f:	48 85 d2             	test   %rdx,%rdx
    c542:	48 0f 49 c6          	cmovns %rsi,%rax
    c546:	49 39 c1             	cmp    %rax,%r9
    c549:	0f 93 c0             	setae  %al
    c54c:	c3                   	ret
    c54d:	0f 1f 00             	nopl   (%rax)

hyperinterval::float::F64Enclosure::hull:
    c550:	48 89 f8             	mov    %rdi,%rax
    c553:	4c 8b 16             	mov    (%rsi),%r10
    c556:	4c 8b 02             	mov    (%rdx),%r8
    c559:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
    c55d:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
    c561:	41 f6 c2 01          	test   $0x1,%r10b
    c565:	0f 84 98 00 00 00    	je     c603 <hyperinterval::float::F64Enclosure::hull+0xb3>
    c56b:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
    c56f:	48 8b 56 10          	mov    0x10(%rsi),%rdx
    c573:	41 f6 c0 01          	test   $0x1,%r8b
    c577:	0f 84 92 00 00 00    	je     c60f <hyperinterval::float::F64Enclosure::hull+0xbf>
    c57d:	41 56                	push   %r14
    c57f:	53                   	push   %rbx
    c580:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c587:	00 00 80 
    c58a:	4d 89 ca             	mov    %r9,%r10
    c58d:	49 09 f2             	or     %rsi,%r10
    c590:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
    c594:	4d 89 cb             	mov    %r9,%r11
    c597:	4d 21 c3             	and    %r8,%r11
    c59a:	48 89 f3             	mov    %rsi,%rbx
    c59d:	4c 29 db             	sub    %r11,%rbx
    c5a0:	4d 85 c9             	test   %r9,%r9
    c5a3:	49 0f 49 da          	cmovns %r10,%rbx
    c5a7:	49 89 fa             	mov    %rdi,%r10
    c5aa:	49 09 f2             	or     %rsi,%r10
    c5ad:	49 89 fb             	mov    %rdi,%r11
    c5b0:	4d 21 c3             	and    %r8,%r11
    c5b3:	49 89 f6             	mov    %rsi,%r14
    c5b6:	4d 29 de             	sub    %r11,%r14
    c5b9:	48 85 ff             	test   %rdi,%rdi
    c5bc:	4d 0f 49 f2          	cmovns %r10,%r14
    c5c0:	4c 39 f3             	cmp    %r14,%rbx
    c5c3:	49 0f 46 f9          	cmovbe %r9,%rdi
    c5c7:	49 89 d1             	mov    %rdx,%r9
    c5ca:	49 09 f1             	or     %rsi,%r9
    c5cd:	49 89 d2             	mov    %rdx,%r10
    c5d0:	4d 21 c2             	and    %r8,%r10
    c5d3:	49 89 f3             	mov    %rsi,%r11
    c5d6:	4d 29 d3             	sub    %r10,%r11
    c5d9:	48 85 d2             	test   %rdx,%rdx
    c5dc:	4d 0f 49 d9          	cmovns %r9,%r11
    c5e0:	49 89 c9             	mov    %rcx,%r9
    c5e3:	49 09 f1             	or     %rsi,%r9
    c5e6:	49 21 c8             	and    %rcx,%r8
    c5e9:	4c 29 c6             	sub    %r8,%rsi
    c5ec:	48 85 c9             	test   %rcx,%rcx
    c5ef:	49 0f 49 f1          	cmovns %r9,%rsi
    c5f3:	49 39 f3             	cmp    %rsi,%r11
    c5f6:	48 0f 43 ca          	cmovae %rdx,%rcx
    c5fa:	41 b8 01 00 00 00    	mov    $0x1,%r8d
    c600:	5b                   	pop    %rbx
    c601:	41 5e                	pop    %r14
    c603:	4c 89 00             	mov    %r8,(%rax)
    c606:	48 89 78 08          	mov    %rdi,0x8(%rax)
    c60a:	48 89 48 10          	mov    %rcx,0x10(%rax)
    c60e:	c3                   	ret
    c60f:	48 89 d1             	mov    %rdx,%rcx
    c612:	4c 89 cf             	mov    %r9,%rdi
    c615:	4d 89 d0             	mov    %r10,%r8
    c618:	4c 89 00             	mov    %r8,(%rax)
    c61b:	48 89 78 08          	mov    %rdi,0x8(%rax)
    c61f:	48 89 48 10          	mov    %rcx,0x10(%rax)
    c623:	c3                   	ret
    c624:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    c62b:	00 00 00 
    c62e:	66 90                	xchg   %ax,%ax

hyperinterval::float::F64Enclosure::intersection:
    c630:	48 89 f8             	mov    %rdi,%rax
    c633:	f6 06 01             	testb  $0x1,(%rsi)
    c636:	0f 84 df 00 00 00    	je     c71b <hyperinterval::float::F64Enclosure::intersection+0xeb>
    c63c:	f6 02 01             	testb  $0x1,(%rdx)
    c63f:	0f 84 d6 00 00 00    	je     c71b <hyperinterval::float::F64Enclosure::intersection+0xeb>
    c645:	41 56                	push   %r14
    c647:	53                   	push   %rbx
    c648:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
    c64c:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
    c650:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
    c657:	00 00 80 
    c65a:	49 89 ca             	mov    %rcx,%r10
    c65d:	49 09 fa             	or     %rdi,%r10
    c660:	4c 8d 47 ff          	lea    -0x1(%rdi),%r8
    c664:	49 89 cb             	mov    %rcx,%r11
    c667:	4d 21 c3             	and    %r8,%r11
    c66a:	48 89 fb             	mov    %rdi,%rbx
    c66d:	4c 29 db             	sub    %r11,%rbx
    c670:	48 85 c9             	test   %rcx,%rcx
    c673:	49 0f 49 da          	cmovns %r10,%rbx
    c677:	4d 89 ca             	mov    %r9,%r10
    c67a:	49 09 fa             	or     %rdi,%r10
    c67d:	4d 89 cb             	mov    %r9,%r11
    c680:	4d 21 c3             	and    %r8,%r11
    c683:	49 89 fe             	mov    %rdi,%r14
    c686:	4d 29 de             	sub    %r11,%r14
    c689:	4d 85 c9             	test   %r9,%r9
    c68c:	4d 0f 49 f2          	cmovns %r10,%r14
    c690:	48 8b 76 10          	mov    0x10(%rsi),%rsi
    c694:	4c 39 f3             	cmp    %r14,%rbx
    c697:	49 0f 42 c9          	cmovb  %r9,%rcx
    c69b:	48 8b 52 10          	mov    0x10(%rdx),%rdx
    c69f:	49 89 f1             	mov    %rsi,%r9
    c6a2:	49 09 f9             	or     %rdi,%r9
    c6a5:	49 89 f2             	mov    %rsi,%r10
    c6a8:	4d 21 c2             	and    %r8,%r10
    c6ab:	49 89 fb             	mov    %rdi,%r11
    c6ae:	4d 29 d3             	sub    %r10,%r11
    c6b1:	48 85 f6             	test   %rsi,%rsi
    c6b4:	4d 0f 49 d9          	cmovns %r9,%r11
    c6b8:	49 89 d1             	mov    %rdx,%r9
    c6bb:	49 09 f9             	or     %rdi,%r9
    c6be:	49 89 d2             	mov    %rdx,%r10
    c6c1:	4d 21 c2             	and    %r8,%r10
    c6c4:	48 89 fb             	mov    %rdi,%rbx
    c6c7:	4c 29 d3             	sub    %r10,%rbx
    c6ca:	48 85 d2             	test   %rdx,%rdx
    c6cd:	49 0f 49 d9          	cmovns %r9,%rbx
    c6d1:	49 39 db             	cmp    %rbx,%r11
    c6d4:	48 0f 47 f2          	cmova  %rdx,%rsi
    c6d8:	48 89 ca             	mov    %rcx,%rdx
    c6db:	48 09 fa             	or     %rdi,%rdx
    c6de:	49 89 c9             	mov    %rcx,%r9
    c6e1:	4d 21 c1             	and    %r8,%r9
    c6e4:	49 89 fa             	mov    %rdi,%r10
    c6e7:	4d 29 ca             	sub    %r9,%r10
    c6ea:	48 85 c9             	test   %rcx,%rcx
    c6ed:	4c 0f 49 d2          	cmovns %rdx,%r10
    c6f1:	48 89 f2             	mov    %rsi,%rdx
    c6f4:	48 09 fa             	or     %rdi,%rdx
    c6f7:	49 21 f0             	and    %rsi,%r8
    c6fa:	4c 29 c7             	sub    %r8,%rdi
    c6fd:	48 85 f6             	test   %rsi,%rsi
    c700:	48 0f 49 fa          	cmovns %rdx,%rdi
    c704:	31 d2                	xor    %edx,%edx
    c706:	49 39 fa             	cmp    %rdi,%r10
    c709:	0f 96 c2             	setbe  %dl
    c70c:	5b                   	pop    %rbx
    c70d:	41 5e                	pop    %r14
    c70f:	48 89 10             	mov    %rdx,(%rax)
    c712:	48 89 48 08          	mov    %rcx,0x8(%rax)
    c716:	48 89 70 10          	mov    %rsi,0x10(%rax)
    c71a:	c3                   	ret
    c71b:	31 d2                	xor    %edx,%edx
    c71d:	48 89 10             	mov    %rdx,(%rax)
    c720:	48 89 48 08          	mov    %rcx,0x8(%rax)
    c724:	48 89 70 10          	mov    %rsi,0x10(%rax)
    c728:	c3                   	ret
    c729:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

hyperinterval::float::F64Enclosure::signs:
    c730:	f6 07 01             	testb  $0x1,(%rdi)
    c733:	0f 84 81 00 00 00    	je     c7ba <hyperinterval::float::F64Enclosure::signs+0x8a>
    c739:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    c740:	00 00 80 
    c743:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    c747:	48 8b 4f 10          	mov    0x10(%rdi),%rcx
    c74b:	48 89 d6             	mov    %rdx,%rsi
    c74e:	48 09 c6             	or     %rax,%rsi
    c751:	4c 8d 48 ff          	lea    -0x1(%rax),%r9
    c755:	48 89 d7             	mov    %rdx,%rdi
    c758:	4c 21 cf             	and    %r9,%rdi
    c75b:	49 89 c2             	mov    %rax,%r10
    c75e:	49 29 fa             	sub    %rdi,%r10
    c761:	48 85 d2             	test   %rdx,%rdx
    c764:	4c 0f 49 d6          	cmovns %rsi,%r10
    c768:	45 31 c0             	xor    %r8d,%r8d
    c76b:	4d 85 d2             	test   %r10,%r10
    c76e:	40 0f 99 c6          	setns  %sil
    c772:	48 89 ca             	mov    %rcx,%rdx
    c775:	48 09 c2             	or     %rax,%rdx
    c778:	49 21 c9             	and    %rcx,%r9
    c77b:	48 89 c7             	mov    %rax,%rdi
    c77e:	4c 29 cf             	sub    %r9,%rdi
    c781:	49 39 c2             	cmp    %rax,%r10
    c784:	77 1c                	ja     c7a2 <hyperinterval::float::F64Enclosure::signs+0x72>
    c786:	44 8d 4e 02          	lea    0x2(%rsi),%r9d
    c78a:	48 85 ff             	test   %rdi,%rdi
    c78d:	41 88 f0             	mov    %sil,%r8b
    c790:	41 0f b6 f1          	movzbl %r9b,%esi
    c794:	44 0f 48 c6          	cmovs  %esi,%r8d
    c798:	48 85 c9             	test   %rcx,%rcx
    c79b:	44 0f 49 c6          	cmovns %esi,%r8d
    c79f:	44 89 c6             	mov    %r8d,%esi
    c7a2:	48 85 c9             	test   %rcx,%rcx
    c7a5:	48 0f 48 d7          	cmovs  %rdi,%rdx
    c7a9:	8d 4e 04             	lea    0x4(%rsi),%ecx
    c7ac:	48 39 c2             	cmp    %rax,%rdx
    c7af:	40 0f b6 d6          	movzbl %sil,%edx
    c7b3:	0f b6 c1             	movzbl %cl,%eax
    c7b6:	0f 46 c2             	cmovbe %edx,%eax
    c7b9:	c3                   	ret
    c7ba:	31 c0                	xor    %eax,%eax
    c7bc:	c3                   	ret
    c7bd:	0f 1f 00             	nopl   (%rax)

hyperinterval::float::F64Enclosure::min_image:
    c7c0:	48 89 f8             	mov    %rdi,%rax
    c7c3:	f6 06 01             	testb  $0x1,(%rsi)
    c7c6:	0f 84 aa 00 00 00    	je     c876 <hyperinterval::float::F64Enclosure::min_image+0xb6>
    c7cc:	f6 02 01             	testb  $0x1,(%rdx)
    c7cf:	0f 84 a1 00 00 00    	je     c876 <hyperinterval::float::F64Enclosure::min_image+0xb6>
    c7d5:	41 56                	push   %r14
    c7d7:	53                   	push   %rbx
    c7d8:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
    c7dc:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
    c7e0:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
    c7e4:	48 8b 52 10          	mov    0x10(%rdx),%rdx
    c7e8:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c7ef:	00 00 80 
    c7f2:	49 89 fa             	mov    %rdi,%r10
    c7f5:	49 09 f2             	or     %rsi,%r10
    c7f8:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
    c7fc:	49 89 fb             	mov    %rdi,%r11
    c7ff:	4d 21 c3             	and    %r8,%r11
    c802:	48 89 f3             	mov    %rsi,%rbx
    c805:	4c 29 db             	sub    %r11,%rbx
    c808:	48 85 ff             	test   %rdi,%rdi
    c80b:	49 0f 49 da          	cmovns %r10,%rbx
    c80f:	4d 89 ca             	mov    %r9,%r10
    c812:	49 09 f2             	or     %rsi,%r10
    c815:	4d 89 cb             	mov    %r9,%r11
    c818:	4d 21 c3             	and    %r8,%r11
    c81b:	49 89 f6             	mov    %rsi,%r14
    c81e:	4d 29 de             	sub    %r11,%r14
    c821:	4d 85 c9             	test   %r9,%r9
    c824:	4d 0f 49 f2          	cmovns %r10,%r14
    c828:	4c 39 f3             	cmp    %r14,%rbx
    c82b:	49 0f 47 f9          	cmova  %r9,%rdi
    c82f:	49 89 c9             	mov    %rcx,%r9
    c832:	49 09 f1             	or     %rsi,%r9
    c835:	49 89 ca             	mov    %rcx,%r10
    c838:	4d 21 c2             	and    %r8,%r10
    c83b:	49 89 f3             	mov    %rsi,%r11
    c83e:	4d 29 d3             	sub    %r10,%r11
    c841:	48 85 c9             	test   %rcx,%rcx
    c844:	4d 0f 49 d9          	cmovns %r9,%r11
    c848:	49 89 d1             	mov    %rdx,%r9
    c84b:	49 09 f1             	or     %rsi,%r9
    c84e:	49 21 d0             	and    %rdx,%r8
    c851:	4c 29 c6             	sub    %r8,%rsi
    c854:	48 85 d2             	test   %rdx,%rdx
    c857:	49 0f 49 f1          	cmovns %r9,%rsi
    c85b:	49 39 f3             	cmp    %rsi,%r11
    c85e:	48 0f 47 ca          	cmova  %rdx,%rcx
    c862:	ba 01 00 00 00       	mov    $0x1,%edx
    c867:	5b                   	pop    %rbx
    c868:	41 5e                	pop    %r14
    c86a:	48 89 10             	mov    %rdx,(%rax)
    c86d:	48 89 78 08          	mov    %rdi,0x8(%rax)
    c871:	48 89 48 10          	mov    %rcx,0x10(%rax)
    c875:	c3                   	ret
    c876:	31 d2                	xor    %edx,%edx
    c878:	48 89 10             	mov    %rdx,(%rax)
    c87b:	48 89 78 08          	mov    %rdi,0x8(%rax)
    c87f:	48 89 48 10          	mov    %rcx,0x10(%rax)
    c883:	c3                   	ret
    c884:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    c88b:	00 00 00 
    c88e:	66 90                	xchg   %ax,%ax

hyperinterval::float::F64Enclosure::max_image:
    c890:	48 89 f8             	mov    %rdi,%rax
    c893:	f6 06 01             	testb  $0x1,(%rsi)
    c896:	0f 84 aa 00 00 00    	je     c946 <hyperinterval::float::F64Enclosure::max_image+0xb6>
    c89c:	f6 02 01             	testb  $0x1,(%rdx)
    c89f:	0f 84 a1 00 00 00    	je     c946 <hyperinterval::float::F64Enclosure::max_image+0xb6>
    c8a5:	41 56                	push   %r14
    c8a7:	53                   	push   %rbx
    c8a8:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
    c8ac:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
    c8b0:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
    c8b4:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c8bb:	00 00 80 
    c8be:	49 89 fa             	mov    %rdi,%r10
    c8c1:	49 09 f2             	or     %rsi,%r10
    c8c4:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
    c8c8:	49 89 fb             	mov    %rdi,%r11
    c8cb:	4d 21 c3             	and    %r8,%r11
    c8ce:	48 89 f3             	mov    %rsi,%rbx
    c8d1:	4c 29 db             	sub    %r11,%rbx
    c8d4:	48 85 ff             	test   %rdi,%rdi
    c8d7:	49 0f 49 da          	cmovns %r10,%rbx
    c8db:	4d 89 ca             	mov    %r9,%r10
    c8de:	49 09 f2             	or     %rsi,%r10
    c8e1:	4d 89 cb             	mov    %r9,%r11
    c8e4:	4d 21 c3             	and    %r8,%r11
    c8e7:	49 89 f6             	mov    %rsi,%r14
    c8ea:	4d 29 de             	sub    %r11,%r14
    c8ed:	4d 85 c9             	test   %r9,%r9
    c8f0:	4d 0f 49 f2          	cmovns %r10,%r14
    c8f4:	4c 39 f3             	cmp    %r14,%rbx
    c8f7:	49 0f 42 f9          	cmovb  %r9,%rdi
    c8fb:	49 89 c9             	mov    %rcx,%r9
    c8fe:	49 09 f1             	or     %rsi,%r9
    c901:	49 89 ca             	mov    %rcx,%r10
    c904:	4d 21 c2             	and    %r8,%r10
    c907:	49 89 f3             	mov    %rsi,%r11
    c90a:	4d 29 d3             	sub    %r10,%r11
    c90d:	48 85 c9             	test   %rcx,%rcx
    c910:	4d 0f 49 d9          	cmovns %r9,%r11
    c914:	48 8b 52 10          	mov    0x10(%rdx),%rdx
    c918:	49 89 d1             	mov    %rdx,%r9
    c91b:	49 09 f1             	or     %rsi,%r9
    c91e:	49 21 d0             	and    %rdx,%r8
    c921:	4c 29 c6             	sub    %r8,%rsi
    c924:	48 85 d2             	test   %rdx,%rdx
    c927:	49 0f 49 f1          	cmovns %r9,%rsi
    c92b:	49 39 f3             	cmp    %rsi,%r11
    c92e:	48 0f 42 ca          	cmovb  %rdx,%rcx
    c932:	ba 01 00 00 00       	mov    $0x1,%edx
    c937:	5b                   	pop    %rbx
    c938:	41 5e                	pop    %r14
    c93a:	48 89 10             	mov    %rdx,(%rax)
    c93d:	48 89 78 08          	mov    %rdi,0x8(%rax)
    c941:	48 89 48 10          	mov    %rcx,0x10(%rax)
    c945:	c3                   	ret
    c946:	31 d2                	xor    %edx,%edx
    c948:	48 89 10             	mov    %rdx,(%rax)
    c94b:	48 89 78 08          	mov    %rdi,0x8(%rax)
    c94f:	48 89 48 10          	mov    %rcx,0x10(%rax)
    c953:	c3                   	ret
    c954:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    c95b:	00 00 00 
    c95e:	66 90                	xchg   %ax,%ax

hyperinterval::float::F64Enclosure::add:
    c960:	48 89 f8             	mov    %rdi,%rax
    c963:	f6 06 01             	testb  $0x1,(%rsi)
    c966:	0f 84 cb 00 00 00    	je     ca37 <hyperinterval::float::F64Enclosure::add+0xd7>
    c96c:	f6 02 01             	testb  $0x1,(%rdx)
    c96f:	0f 84 c2 00 00 00    	je     ca37 <hyperinterval::float::F64Enclosure::add+0xd7>
    c975:	55                   	push   %rbp
    c976:	41 57                	push   %r15
    c978:	41 56                	push   %r14
    c97a:	41 55                	push   %r13
    c97c:	41 54                	push   %r12
    c97e:	53                   	push   %rbx
    c97f:	48 83 ec 18          	sub    $0x18,%rsp
    c983:	48 89 c5             	mov    %rax,%rbp
    c986:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
    c98a:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
    c98e:	4c 8b 62 10          	mov    0x10(%rdx),%r12
    c992:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
    c999:	00 00 80 
    c99c:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
    c9a3:	00 f0 7f 
    c9a6:	4c 8b 42 08          	mov    0x8(%rdx),%r8
    c9aa:	48 89 e7             	mov    %rsp,%rdi
    c9ad:	48 89 de             	mov    %rbx,%rsi
    c9b0:	4c 89 f2             	mov    %r14,%rdx
    c9b3:	e8 68 1d 00 00       	call   e720 <hyperinterval::ieee::Format::add>
    c9b8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    c9bc:	74 57                	je     ca15 <hyperinterval::float::F64Enclosure::add+0xb5>
    c9be:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    c9c3:	48 89 e7             	mov    %rsp,%rdi
    c9c6:	48 89 de             	mov    %rbx,%rsi
    c9c9:	4c 89 f2             	mov    %r14,%rdx
    c9cc:	4c 89 f9             	mov    %r15,%rcx
    c9cf:	4d 89 e0             	mov    %r12,%r8
    c9d2:	e8 49 1d 00 00       	call   e720 <hyperinterval::ieee::Format::add>
    c9d7:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    c9db:	74 38                	je     ca15 <hyperinterval::float::F64Enclosure::add+0xb5>
    c9dd:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
    c9e2:	48 89 e7             	mov    %rsp,%rdi
    c9e5:	48 89 de             	mov    %rbx,%rsi
    c9e8:	4c 89 f2             	mov    %r14,%rdx
    c9eb:	4c 89 e9             	mov    %r13,%rcx
    c9ee:	e8 dd 19 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    c9f3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    c9f7:	74 1c                	je     ca15 <hyperinterval::float::F64Enclosure::add+0xb5>
    c9f9:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    c9fe:	48 89 e7             	mov    %rsp,%rdi
    ca01:	48 89 de             	mov    %rbx,%rsi
    ca04:	4c 89 f2             	mov    %r14,%rdx
    ca07:	4c 89 f9             	mov    %r15,%rcx
    ca0a:	e8 c1 19 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    ca0f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    ca13:	75 2a                	jne    ca3f <hyperinterval::float::F64Enclosure::add+0xdf>
    ca15:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
    ca1a:	48 89 e8             	mov    %rbp,%rax
    ca1d:	88 4d 08             	mov    %cl,0x8(%rbp)
    ca20:	48 c7 45 00 02 00 00 	movq   $0x2,0x0(%rbp)
    ca27:	00 
    ca28:	48 83 c4 18          	add    $0x18,%rsp
    ca2c:	5b                   	pop    %rbx
    ca2d:	41 5c                	pop    %r12
    ca2f:	41 5d                	pop    %r13
    ca31:	41 5e                	pop    %r14
    ca33:	41 5f                	pop    %r15
    ca35:	5d                   	pop    %rbp
    ca36:	c3                   	ret
    ca37:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
    ca3e:	c3                   	ret
    ca3f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    ca44:	4c 89 e0             	mov    %r12,%rax
    ca47:	48 09 d8             	or     %rbx,%rax
    ca4a:	48 8d 53 ff          	lea    -0x1(%rbx),%rdx
    ca4e:	4c 89 e6             	mov    %r12,%rsi
    ca51:	48 21 d6             	and    %rdx,%rsi
    ca54:	48 89 df             	mov    %rbx,%rdi
    ca57:	48 29 f7             	sub    %rsi,%rdi
    ca5a:	4d 85 e4             	test   %r12,%r12
    ca5d:	48 0f 49 f8          	cmovns %rax,%rdi
    ca61:	48 89 c8             	mov    %rcx,%rax
    ca64:	48 09 d8             	or     %rbx,%rax
    ca67:	48 21 ca             	and    %rcx,%rdx
    ca6a:	48 29 d3             	sub    %rdx,%rbx
    ca6d:	48 85 c9             	test   %rcx,%rcx
    ca70:	48 0f 49 d8          	cmovns %rax,%rbx
    ca74:	48 39 df             	cmp    %rbx,%rdi
    ca77:	48 89 e8             	mov    %rbp,%rax
    ca7a:	76 0d                	jbe    ca89 <hyperinterval::float::F64Enclosure::add+0x129>
    ca7c:	c6 40 08 01          	movb   $0x1,0x8(%rax)
    ca80:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
    ca87:	eb 9f                	jmp    ca28 <hyperinterval::float::F64Enclosure::add+0xc8>
    ca89:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
    ca90:	4c 89 60 08          	mov    %r12,0x8(%rax)
    ca94:	48 89 48 10          	mov    %rcx,0x10(%rax)
    ca98:	eb 8e                	jmp    ca28 <hyperinterval::float::F64Enclosure::add+0xc8>
    ca9a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

hyperinterval::float::F64Enclosure::sub:
    caa0:	53                   	push   %rbx
    caa1:	48 83 ec 20          	sub    $0x20,%rsp
    caa5:	48 89 fb             	mov    %rdi,%rbx
    caa8:	f6 02 01             	testb  $0x1,(%rdx)
    caab:	74 30                	je     cadd <hyperinterval::float::F64Enclosure::sub+0x3d>
    caad:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
    cab1:	48 8b 52 10          	mov    0x10(%rdx),%rdx
    cab5:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    cabc:	00 00 80 
    cabf:	48 89 d1             	mov    %rdx,%rcx
    cac2:	48 31 c1             	xor    %rax,%rcx
    cac5:	48 85 d2             	test   %rdx,%rdx
    cac8:	48 0f 44 ca          	cmove  %rdx,%rcx
    cacc:	48 31 f8             	xor    %rdi,%rax
    cacf:	48 85 ff             	test   %rdi,%rdi
    cad2:	48 0f 44 c7          	cmove  %rdi,%rax
    cad6:	ba 01 00 00 00       	mov    $0x1,%edx
    cadb:	eb 02                	jmp    cadf <hyperinterval::float::F64Enclosure::sub+0x3f>
    cadd:	31 d2                	xor    %edx,%edx
    cadf:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    cae4:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
    cae9:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    caee:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
    caf3:	48 89 df             	mov    %rbx,%rdi
    caf6:	ff 15 8c 31 05 00    	call   *0x5318c(%rip)        # 5fc88 <_GLOBAL_OFFSET_TABLE_+0x6c0>
    cafc:	48 89 d8             	mov    %rbx,%rax
    caff:	48 83 c4 20          	add    $0x20,%rsp
    cb03:	5b                   	pop    %rbx
    cb04:	c3                   	ret
    cb05:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    cb0c:	00 00 00 
    cb0f:	90                   	nop

hyperinterval::float::F64Enclosure::corner_image:
    cb10:	f6 06 01             	testb  $0x1,(%rsi)
    cb13:	0f 84 48 04 00 00    	je     cf61 <hyperinterval::float::F64Enclosure::corner_image+0x451>
    cb19:	f6 02 01             	testb  $0x1,(%rdx)
    cb1c:	0f 84 3f 04 00 00    	je     cf61 <hyperinterval::float::F64Enclosure::corner_image+0x451>
    cb22:	55                   	push   %rbp
    cb23:	41 57                	push   %r15
    cb25:	41 56                	push   %r14
    cb27:	41 55                	push   %r13
    cb29:	41 54                	push   %r12
    cb2b:	53                   	push   %rbx
    cb2c:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
    cb33:	48 89 7c 24 78       	mov    %rdi,0x78(%rsp)
    cb38:	49 ba 00 00 00 00 00 	movabs $0x8000000000000000,%r10
    cb3f:	00 00 80 
    cb42:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
    cb49:	00 f0 7f 
    cb4c:	4c 8b 42 08          	mov    0x8(%rdx),%r8
    cb50:	48 8b 42 10          	mov    0x10(%rdx),%rax
    cb54:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    cb59:	48 8b 5e 08          	mov    0x8(%rsi),%rbx
    cb5d:	48 8b 46 10          	mov    0x10(%rsi),%rax
    cb61:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
    cb66:	84 c9                	test   %cl,%cl
    cb68:	0f 84 fb 03 00 00    	je     cf69 <hyperinterval::float::F64Enclosure::corner_image+0x459>
    cb6e:	48 89 e7             	mov    %rsp,%rdi
    cb71:	4c 89 d6             	mov    %r10,%rsi
    cb74:	4c 89 f2             	mov    %r14,%rdx
    cb77:	48 89 d9             	mov    %rbx,%rcx
    cb7a:	4d 89 c5             	mov    %r8,%r13
    cb7d:	4d 89 f7             	mov    %r14,%r15
    cb80:	e8 2b 22 00 00       	call   edb0 <hyperinterval::ieee::Format::div>
    cb85:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    cb89:	0f 85 e1 04 00 00    	jne    d070 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    cb8f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    cb94:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
    cb99:	48 89 e7             	mov    %rsp,%rdi
    cb9c:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cba3:	00 00 80 
    cba6:	4c 89 fa             	mov    %r15,%rdx
    cba9:	e8 22 18 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    cbae:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    cbb2:	0f 85 b8 04 00 00    	jne    d070 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    cbb8:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    cbbd:	48 89 e7             	mov    %rsp,%rdi
    cbc0:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cbc7:	00 00 80 
    cbca:	4c 89 fa             	mov    %r15,%rdx
    cbcd:	4c 89 f1             	mov    %r14,%rcx
    cbd0:	e8 fb 17 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    cbd5:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    cbd9:	0f 85 91 04 00 00    	jne    d070 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    cbdf:	48 89 e8             	mov    %rbp,%rax
    cbe2:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cbe9:	00 00 80 
    cbec:	48 09 f0             	or     %rsi,%rax
    cbef:	48 8d 56 ff          	lea    -0x1(%rsi),%rdx
    cbf3:	48 89 e9             	mov    %rbp,%rcx
    cbf6:	48 21 d1             	and    %rdx,%rcx
    cbf9:	49 89 f7             	mov    %rsi,%r15
    cbfc:	49 29 cf             	sub    %rcx,%r15
    cbff:	48 85 ed             	test   %rbp,%rbp
    cc02:	4c 0f 49 f8          	cmovns %rax,%r15
    cc06:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    cc0b:	48 89 f8             	mov    %rdi,%rax
    cc0e:	48 09 f0             	or     %rsi,%rax
    cc11:	48 89 f9             	mov    %rdi,%rcx
    cc14:	48 21 d1             	and    %rdx,%rcx
    cc17:	49 89 f4             	mov    %rsi,%r12
    cc1a:	49 29 cc             	sub    %rcx,%r12
    cc1d:	48 85 ff             	test   %rdi,%rdi
    cc20:	4c 0f 49 e0          	cmovns %rax,%r12
    cc24:	41 b6 01             	mov    $0x1,%r14b
    cc27:	4d 39 e7             	cmp    %r12,%r15
    cc2a:	0f 87 46 04 00 00    	ja     d076 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    cc30:	48 89 7c 24 38       	mov    %rdi,0x38(%rsp)
    cc35:	48 89 6c 24 28       	mov    %rbp,0x28(%rsp)
    cc3a:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
    cc3f:	48 89 e7             	mov    %rsp,%rdi
    cc42:	48 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%rbp
    cc49:	00 f0 7f 
    cc4c:	48 89 ea             	mov    %rbp,%rdx
    cc4f:	48 89 d9             	mov    %rbx,%rcx
    cc52:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
    cc57:	e8 54 21 00 00       	call   edb0 <hyperinterval::ieee::Format::div>
    cc5c:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    cc60:	0f 85 0a 04 00 00    	jne    d070 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    cc66:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    cc6b:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    cc70:	48 89 e7             	mov    %rsp,%rdi
    cc73:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cc7a:	00 00 80 
    cc7d:	48 89 ea             	mov    %rbp,%rdx
    cc80:	e8 4b 17 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    cc85:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    cc89:	0f 85 e1 03 00 00    	jne    d070 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    cc8f:	48 89 ea             	mov    %rbp,%rdx
    cc92:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    cc97:	48 89 e7             	mov    %rsp,%rdi
    cc9a:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cca1:	00 00 80 
    cca4:	48 89 d9             	mov    %rbx,%rcx
    cca7:	e8 24 17 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    ccac:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ccb0:	0f 85 ba 03 00 00    	jne    d070 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    ccb6:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    ccbb:	48 89 ea             	mov    %rbp,%rdx
    ccbe:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    ccc5:	00 00 80 
    ccc8:	48 09 f2             	or     %rsi,%rdx
    cccb:	48 89 ef             	mov    %rbp,%rdi
    ccce:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
    ccd3:	4c 21 cf             	and    %r9,%rdi
    ccd6:	48 89 f1             	mov    %rsi,%rcx
    ccd9:	48 29 f9             	sub    %rdi,%rcx
    ccdc:	48 85 ed             	test   %rbp,%rbp
    ccdf:	48 0f 49 ca          	cmovns %rdx,%rcx
    cce3:	49 89 c0             	mov    %rax,%r8
    cce6:	49 09 f0             	or     %rsi,%r8
    cce9:	48 89 c7             	mov    %rax,%rdi
    ccec:	4c 21 cf             	and    %r9,%rdi
    ccef:	48 89 f2             	mov    %rsi,%rdx
    ccf2:	48 29 fa             	sub    %rdi,%rdx
    ccf5:	48 85 c0             	test   %rax,%rax
    ccf8:	49 0f 49 d0          	cmovns %r8,%rdx
    ccfc:	48 39 d1             	cmp    %rdx,%rcx
    ccff:	0f 87 71 03 00 00    	ja     d076 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    cd05:	49 39 cf             	cmp    %rcx,%r15
    cd08:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    cd0d:	48 0f 47 cd          	cmova  %rbp,%rcx
    cd11:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
    cd16:	49 39 d4             	cmp    %rdx,%r12
    cd19:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
    cd1e:	48 0f 42 c8          	cmovb  %rax,%rcx
    cd22:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
    cd27:	48 89 e7             	mov    %rsp,%rdi
    cd2a:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
    cd31:	00 f0 7f 
    cd34:	4c 89 e2             	mov    %r12,%rdx
    cd37:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
    cd3c:	4d 89 e8             	mov    %r13,%r8
    cd3f:	e8 6c 20 00 00       	call   edb0 <hyperinterval::ieee::Format::div>
    cd44:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    cd48:	0f 85 22 03 00 00    	jne    d070 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    cd4e:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    cd53:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
    cd58:	48 89 e7             	mov    %rsp,%rdi
    cd5b:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cd62:	00 00 80 
    cd65:	4c 89 e2             	mov    %r12,%rdx
    cd68:	e8 63 16 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    cd6d:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    cd71:	0f 85 f9 02 00 00    	jne    d070 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    cd77:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    cd7c:	48 89 e7             	mov    %rsp,%rdi
    cd7f:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cd86:	00 00 80 
    cd89:	4c 89 e2             	mov    %r12,%rdx
    cd8c:	4c 89 f9             	mov    %r15,%rcx
    cd8f:	e8 3c 16 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    cd94:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    cd98:	0f 85 d2 02 00 00    	jne    d070 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    cd9e:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
    cda3:	48 89 d8             	mov    %rbx,%rax
    cda6:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cdad:	00 00 80 
    cdb0:	48 09 f0             	or     %rsi,%rax
    cdb3:	48 89 da             	mov    %rbx,%rdx
    cdb6:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
    cdbb:	4c 21 ca             	and    %r9,%rdx
    cdbe:	48 89 f1             	mov    %rsi,%rcx
    cdc1:	48 29 d1             	sub    %rdx,%rcx
    cdc4:	48 85 db             	test   %rbx,%rbx
    cdc7:	48 0f 49 c8          	cmovns %rax,%rcx
    cdcb:	4c 89 fa             	mov    %r15,%rdx
    cdce:	48 09 f2             	or     %rsi,%rdx
    cdd1:	4c 89 ff             	mov    %r15,%rdi
    cdd4:	4c 21 cf             	and    %r9,%rdi
    cdd7:	48 89 f0             	mov    %rsi,%rax
    cdda:	48 29 f8             	sub    %rdi,%rax
    cddd:	4d 85 ff             	test   %r15,%r15
    cde0:	48 0f 49 c2          	cmovns %rdx,%rax
    cde4:	48 39 c1             	cmp    %rax,%rcx
    cde7:	0f 87 89 02 00 00    	ja     d076 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    cded:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
    cdf2:	4c 89 d2             	mov    %r10,%rdx
    cdf5:	48 09 f2             	or     %rsi,%rdx
    cdf8:	4d 89 d0             	mov    %r10,%r8
    cdfb:	4d 21 c8             	and    %r9,%r8
    cdfe:	48 89 f7             	mov    %rsi,%rdi
    ce01:	4c 29 c7             	sub    %r8,%rdi
    ce04:	4d 85 d2             	test   %r10,%r10
    ce07:	48 0f 49 fa          	cmovns %rdx,%rdi
    ce0b:	48 39 cf             	cmp    %rcx,%rdi
    ce0e:	49 0f 46 da          	cmovbe %r10,%rbx
    ce12:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
    ce17:	4c 89 c1             	mov    %r8,%rcx
    ce1a:	48 09 f1             	or     %rsi,%rcx
    ce1d:	4c 89 c2             	mov    %r8,%rdx
    ce20:	4c 21 ca             	and    %r9,%rdx
    ce23:	48 89 f7             	mov    %rsi,%rdi
    ce26:	48 29 d7             	sub    %rdx,%rdi
    ce29:	4d 85 c0             	test   %r8,%r8
    ce2c:	48 0f 49 f9          	cmovns %rcx,%rdi
    ce30:	48 39 c7             	cmp    %rax,%rdi
    ce33:	4d 0f 43 f8          	cmovae %r8,%r15
    ce37:	48 89 e7             	mov    %rsp,%rdi
    ce3a:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
    ce41:	00 f0 7f 
    ce44:	4c 89 e2             	mov    %r12,%rdx
    ce47:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
    ce4c:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
    ce51:	e8 5a 1f 00 00       	call   edb0 <hyperinterval::ieee::Format::div>
    ce56:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ce5a:	0f 85 10 02 00 00    	jne    d070 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    ce60:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    ce65:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
    ce6a:	48 89 e7             	mov    %rsp,%rdi
    ce6d:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    ce74:	00 00 80 
    ce77:	4c 89 e2             	mov    %r12,%rdx
    ce7a:	e8 51 15 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    ce7f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ce83:	0f 85 e7 01 00 00    	jne    d070 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    ce89:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    ce8e:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    ce93:	48 89 e7             	mov    %rsp,%rdi
    ce96:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    ce9d:	00 00 80 
    cea0:	4c 89 e2             	mov    %r12,%rdx
    cea3:	4c 89 e9             	mov    %r13,%rcx
    cea6:	e8 25 15 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    ceab:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ceaf:	0f 85 bb 01 00 00    	jne    d070 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    ceb5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    ceba:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
    cebf:	48 89 f9             	mov    %rdi,%rcx
    cec2:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
    cec9:	00 00 80 
    cecc:	4c 09 c1             	or     %r8,%rcx
    cecf:	48 89 fe             	mov    %rdi,%rsi
    ced2:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
    ced7:	4c 21 ce             	and    %r9,%rsi
    ceda:	4c 89 c2             	mov    %r8,%rdx
    cedd:	48 29 f2             	sub    %rsi,%rdx
    cee0:	48 85 ff             	test   %rdi,%rdi
    cee3:	48 0f 49 d1          	cmovns %rcx,%rdx
    cee7:	48 89 c6             	mov    %rax,%rsi
    ceea:	4c 09 c6             	or     %r8,%rsi
    ceed:	48 89 c7             	mov    %rax,%rdi
    cef0:	4c 21 cf             	and    %r9,%rdi
    cef3:	4c 89 c1             	mov    %r8,%rcx
    cef6:	48 29 f9             	sub    %rdi,%rcx
    cef9:	48 85 c0             	test   %rax,%rax
    cefc:	48 0f 49 ce          	cmovns %rsi,%rcx
    cf00:	48 39 ca             	cmp    %rcx,%rdx
    cf03:	0f 87 6d 01 00 00    	ja     d076 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    cf09:	48 89 de             	mov    %rbx,%rsi
    cf0c:	48 bd 00 00 00 00 00 	movabs $0x8000000000000000,%rbp
    cf13:	00 00 80 
    cf16:	48 09 ee             	or     %rbp,%rsi
    cf19:	48 89 df             	mov    %rbx,%rdi
    cf1c:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
    cf21:	4c 21 cf             	and    %r9,%rdi
    cf24:	49 89 e8             	mov    %rbp,%r8
    cf27:	49 29 f8             	sub    %rdi,%r8
    cf2a:	48 85 db             	test   %rbx,%rbx
    cf2d:	4c 0f 49 c6          	cmovns %rsi,%r8
    cf31:	49 39 d0             	cmp    %rdx,%r8
    cf34:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    cf39:	48 0f 46 d3          	cmovbe %rbx,%rdx
    cf3d:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
    cf42:	4c 89 fa             	mov    %r15,%rdx
    cf45:	48 09 ea             	or     %rbp,%rdx
    cf48:	4d 21 f9             	and    %r15,%r9
    cf4b:	4c 29 cd             	sub    %r9,%rbp
    cf4e:	4d 85 ff             	test   %r15,%r15
    cf51:	48 0f 49 ea          	cmovns %rdx,%rbp
    cf55:	48 39 cd             	cmp    %rcx,%rbp
    cf58:	49 0f 43 c7          	cmovae %r15,%rax
    cf5c:	e9 d8 05 00 00       	jmp    d539 <hyperinterval::float::F64Enclosure::corner_image+0xa29>
    cf61:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
    cf68:	c3                   	ret
    cf69:	48 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%rdx
    cf70:	ff 0f 00 
    cf73:	49 89 dd             	mov    %rbx,%r13
    cf76:	49 c1 ed 34          	shr    $0x34,%r13
    cf7a:	41 81 e5 ff 07 00 00 	and    $0x7ff,%r13d
    cf81:	48 89 d8             	mov    %rbx,%rax
    cf84:	48 21 d0             	and    %rdx,%rax
    cf87:	4d 85 ed             	test   %r13,%r13
    cf8a:	b9 01 00 00 00       	mov    $0x1,%ecx
    cf8f:	41 0f 45 cd          	cmovne %r13d,%ecx
    cf93:	4c 8d 62 01          	lea    0x1(%rdx),%r12
    cf97:	4d 89 e7             	mov    %r12,%r15
    cf9a:	4d 0f 44 fd          	cmove  %r13,%r15
    cf9e:	49 09 c7             	or     %rax,%r15
    cfa1:	4c 89 c5             	mov    %r8,%rbp
    cfa4:	48 c1 ed 34          	shr    $0x34,%rbp
    cfa8:	81 e5 ff 07 00 00    	and    $0x7ff,%ebp
    cfae:	4c 89 c0             	mov    %r8,%rax
    cfb1:	48 21 d0             	and    %rdx,%rax
    cfb4:	8d 95 9a f7 ff ff    	lea    -0x866(%rbp),%edx
    cfba:	48 85 ed             	test   %rbp,%rbp
    cfbd:	4c 89 64 24 30       	mov    %r12,0x30(%rsp)
    cfc2:	4c 0f 44 e5          	cmove  %rbp,%r12
    cfc6:	be 9b f7 ff ff       	mov    $0xfffff79b,%esi
    cfcb:	0f 45 f2             	cmovne %edx,%esi
    cfce:	49 09 c4             	or     %rax,%r12
    cfd1:	48 89 df             	mov    %rbx,%rdi
    cfd4:	4c 89 44 24 38       	mov    %r8,0x38(%rsp)
    cfd9:	4c 31 c7             	xor    %r8,%rdi
    cfdc:	4c 89 f8             	mov    %r15,%rax
    cfdf:	49 f7 e4             	mul    %r12
    cfe2:	01 ce                	add    %ecx,%esi
    cfe4:	48 c1 ef 3f          	shr    $0x3f,%rdi
    cfe8:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
    cfed:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    cff2:	48 89 04 24          	mov    %rax,(%rsp)
    cff6:	89 74 24 10          	mov    %esi,0x10(%rsp)
    cffa:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    cfff:	48 89 e1             	mov    %rsp,%rcx
    d002:	4c 89 d6             	mov    %r10,%rsi
    d005:	4c 89 f2             	mov    %r14,%rdx
    d008:	e8 03 14 00 00       	call   e410 <hyperinterval::ieee::Format::rounded>
    d00d:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
    d012:	74 08                	je     d01c <hyperinterval::float::F64Enclosure::corner_image+0x50c>
    d014:	44 0f b6 74 24 41    	movzbl 0x41(%rsp),%r14d
    d01a:	eb 5a                	jmp    d076 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    d01c:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    d021:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
    d026:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    d02b:	48 89 e7             	mov    %rsp,%rdi
    d02e:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d035:	00 00 80 
    d038:	4c 89 f2             	mov    %r14,%rdx
    d03b:	e8 90 13 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    d040:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    d044:	75 2a                	jne    d070 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    d046:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    d04b:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
    d050:	48 89 e7             	mov    %rsp,%rdi
    d053:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d05a:	00 00 80 
    d05d:	4c 89 f2             	mov    %r14,%rdx
    d060:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    d065:	e8 66 13 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    d06a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    d06e:	74 28                	je     d098 <hyperinterval::float::F64Enclosure::corner_image+0x588>
    d070:	44 0f b6 74 24 01    	movzbl 0x1(%rsp),%r14d
    d076:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
    d07b:	44 88 70 08          	mov    %r14b,0x8(%rax)
    d07f:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
    d086:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
    d08d:	5b                   	pop    %rbx
    d08e:	41 5c                	pop    %r12
    d090:	41 5d                	pop    %r13
    d092:	41 5e                	pop    %r14
    d094:	41 5f                	pop    %r15
    d096:	5d                   	pop    %rbp
    d097:	c3                   	ret
    d098:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
    d09d:	48 89 f8             	mov    %rdi,%rax
    d0a0:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d0a7:	00 00 80 
    d0aa:	48 09 f0             	or     %rsi,%rax
    d0ad:	48 8d 56 ff          	lea    -0x1(%rsi),%rdx
    d0b1:	48 89 f9             	mov    %rdi,%rcx
    d0b4:	48 21 d1             	and    %rdx,%rcx
    d0b7:	49 89 f0             	mov    %rsi,%r8
    d0ba:	49 29 c8             	sub    %rcx,%r8
    d0bd:	48 85 ff             	test   %rdi,%rdi
    d0c0:	4c 0f 49 c0          	cmovns %rax,%r8
    d0c4:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    d0c9:	48 89 f8             	mov    %rdi,%rax
    d0cc:	48 09 f0             	or     %rsi,%rax
    d0cf:	48 89 f9             	mov    %rdi,%rcx
    d0d2:	48 21 d1             	and    %rdx,%rcx
    d0d5:	49 89 f1             	mov    %rsi,%r9
    d0d8:	49 29 c9             	sub    %rcx,%r9
    d0db:	48 85 ff             	test   %rdi,%rdi
    d0de:	4c 0f 49 c8          	cmovns %rax,%r9
    d0e2:	41 b6 01             	mov    $0x1,%r14b
    d0e5:	4d 39 c8             	cmp    %r9,%r8
    d0e8:	77 8c                	ja     d076 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    d0ea:	4c 89 8c 24 88 00 00 	mov    %r9,0x88(%rsp)
    d0f1:	00 
    d0f2:	4c 89 84 24 90 00 00 	mov    %r8,0x90(%rsp)
    d0f9:	00 
    d0fa:	48 89 7c 24 68       	mov    %rdi,0x68(%rsp)
    d0ff:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
    d104:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    d109:	48 89 c8             	mov    %rcx,%rax
    d10c:	48 c1 e8 34          	shr    $0x34,%rax
    d110:	25 ff 07 00 00       	and    $0x7ff,%eax
    d115:	48 89 ca             	mov    %rcx,%rdx
    d118:	48 bf ff ff ff ff ff 	movabs $0xfffffffffffff,%rdi
    d11f:	ff 0f 00 
    d122:	48 21 fa             	and    %rdi,%rdx
    d125:	48 85 c0             	test   %rax,%rax
    d128:	41 b8 01 00 00 00    	mov    $0x1,%r8d
    d12e:	44 0f 45 c0          	cmovne %eax,%r8d
    d132:	48 0f 45 44 24 30    	cmovne 0x30(%rsp),%rax
    d138:	48 09 d0             	or     %rdx,%rax
    d13b:	48 31 cb             	xor    %rcx,%rbx
    d13e:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
    d145:	00 
    d146:	49 f7 e7             	mul    %r15
    d149:	41 8d 8d 9a f7 ff ff 	lea    -0x866(%r13),%ecx
    d150:	4d 85 ed             	test   %r13,%r13
    d153:	bf 9b f7 ff ff       	mov    $0xfffff79b,%edi
    d158:	0f 45 f9             	cmovne %ecx,%edi
    d15b:	44 89 44 24 74       	mov    %r8d,0x74(%rsp)
    d160:	44 01 c7             	add    %r8d,%edi
    d163:	48 c1 eb 3f          	shr    $0x3f,%rbx
    d167:	88 5c 24 14          	mov    %bl,0x14(%rsp)
    d16b:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    d170:	48 89 04 24          	mov    %rax,(%rsp)
    d174:	89 7c 24 10          	mov    %edi,0x10(%rsp)
    d178:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    d17d:	48 89 e1             	mov    %rsp,%rcx
    d180:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
    d187:	00 f0 7f 
    d18a:	4c 89 ea             	mov    %r13,%rdx
    d18d:	e8 7e 12 00 00       	call   e410 <hyperinterval::ieee::Format::rounded>
    d192:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
    d197:	0f 85 77 fe ff ff    	jne    d014 <hyperinterval::float::F64Enclosure::corner_image+0x504>
    d19d:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    d1a2:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
    d1a7:	48 89 e7             	mov    %rsp,%rdi
    d1aa:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d1b1:	00 00 80 
    d1b4:	4c 89 ea             	mov    %r13,%rdx
    d1b7:	e8 14 12 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    d1bc:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d1c0:	0f 84 aa fe ff ff    	je     d070 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    d1c6:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    d1cb:	48 89 e7             	mov    %rsp,%rdi
    d1ce:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d1d5:	00 00 80 
    d1d8:	4c 89 ea             	mov    %r13,%rdx
    d1db:	4c 89 f9             	mov    %r15,%rcx
    d1de:	e8 ed 11 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    d1e3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d1e7:	0f 84 83 fe ff ff    	je     d070 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    d1ed:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    d1f2:	48 89 da             	mov    %rbx,%rdx
    d1f5:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d1fc:	00 00 80 
    d1ff:	48 09 f2             	or     %rsi,%rdx
    d202:	48 89 df             	mov    %rbx,%rdi
    d205:	4c 8b 4c 24 28       	mov    0x28(%rsp),%r9
    d20a:	4c 21 cf             	and    %r9,%rdi
    d20d:	48 89 f1             	mov    %rsi,%rcx
    d210:	48 29 f9             	sub    %rdi,%rcx
    d213:	48 85 db             	test   %rbx,%rbx
    d216:	48 0f 49 ca          	cmovns %rdx,%rcx
    d21a:	49 89 c0             	mov    %rax,%r8
    d21d:	49 09 f0             	or     %rsi,%r8
    d220:	48 89 c7             	mov    %rax,%rdi
    d223:	4c 21 cf             	and    %r9,%rdi
    d226:	48 89 f2             	mov    %rsi,%rdx
    d229:	48 29 fa             	sub    %rdi,%rdx
    d22c:	48 85 c0             	test   %rax,%rax
    d22f:	49 0f 49 d0          	cmovns %r8,%rdx
    d233:	48 39 d1             	cmp    %rdx,%rcx
    d236:	0f 87 3a fe ff ff    	ja     d076 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    d23c:	48 39 8c 24 90 00 00 	cmp    %rcx,0x90(%rsp)
    d243:	00 
    d244:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
    d249:	48 0f 47 cb          	cmova  %rbx,%rcx
    d24d:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
    d252:	48 39 94 24 88 00 00 	cmp    %rdx,0x88(%rsp)
    d259:	00 
    d25a:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
    d25f:	48 0f 42 c8          	cmovb  %rax,%rcx
    d263:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
    d268:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
    d26d:	48 89 d0             	mov    %rdx,%rax
    d270:	48 c1 e8 34          	shr    $0x34,%rax
    d274:	25 ff 07 00 00       	and    $0x7ff,%eax
    d279:	48 bf ff ff ff ff ff 	movabs $0xfffffffffffff,%rdi
    d280:	ff 0f 00 
    d283:	48 21 d7             	and    %rdx,%rdi
    d286:	8d 88 9a f7 ff ff    	lea    -0x866(%rax),%ecx
    d28c:	48 85 c0             	test   %rax,%rax
    d28f:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
    d294:	4c 0f 44 c0          	cmove  %rax,%r8
    d298:	41 bd 9b f7 ff ff    	mov    $0xfffff79b,%r13d
    d29e:	44 0f 45 e9          	cmovne %ecx,%r13d
    d2a2:	49 09 f8             	or     %rdi,%r8
    d2a5:	48 85 ed             	test   %rbp,%rbp
    d2a8:	b9 01 00 00 00       	mov    $0x1,%ecx
    d2ad:	0f 45 cd             	cmovne %ebp,%ecx
    d2b0:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
    d2b5:	48 31 d7             	xor    %rdx,%rdi
    d2b8:	4c 89 e0             	mov    %r12,%rax
    d2bb:	4c 89 c5             	mov    %r8,%rbp
    d2be:	49 f7 e0             	mul    %r8
    d2c1:	44 01 e9             	add    %r13d,%ecx
    d2c4:	48 c1 ef 3f          	shr    $0x3f,%rdi
    d2c8:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
    d2cd:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    d2d2:	48 89 04 24          	mov    %rax,(%rsp)
    d2d6:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
    d2da:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    d2df:	48 89 e1             	mov    %rsp,%rcx
    d2e2:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
    d2e9:	00 f0 7f 
    d2ec:	4c 89 e2             	mov    %r12,%rdx
    d2ef:	e8 1c 11 00 00       	call   e410 <hyperinterval::ieee::Format::rounded>
    d2f4:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
    d2f9:	0f 85 15 fd ff ff    	jne    d014 <hyperinterval::float::F64Enclosure::corner_image+0x504>
    d2ff:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    d304:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
    d309:	48 89 e7             	mov    %rsp,%rdi
    d30c:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d313:	00 00 80 
    d316:	4c 89 e2             	mov    %r12,%rdx
    d319:	e8 b2 10 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    d31e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    d322:	0f 85 48 fd ff ff    	jne    d070 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    d328:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    d32d:	48 89 e7             	mov    %rsp,%rdi
    d330:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d337:	00 00 80 
    d33a:	4c 89 e2             	mov    %r12,%rdx
    d33d:	4c 89 f9             	mov    %r15,%rcx
    d340:	e8 8b 10 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    d345:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    d349:	0f 85 21 fd ff ff    	jne    d070 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    d34f:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    d354:	48 89 d8             	mov    %rbx,%rax
    d357:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d35e:	00 00 80 
    d361:	48 09 f0             	or     %rsi,%rax
    d364:	48 89 da             	mov    %rbx,%rdx
    d367:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
    d36c:	4c 21 c2             	and    %r8,%rdx
    d36f:	48 89 f1             	mov    %rsi,%rcx
    d372:	48 29 d1             	sub    %rdx,%rcx
    d375:	48 85 db             	test   %rbx,%rbx
    d378:	48 0f 49 c8          	cmovns %rax,%rcx
    d37c:	4c 89 e2             	mov    %r12,%rdx
    d37f:	48 09 f2             	or     %rsi,%rdx
    d382:	4c 89 e7             	mov    %r12,%rdi
    d385:	4c 21 c7             	and    %r8,%rdi
    d388:	48 89 f0             	mov    %rsi,%rax
    d38b:	48 29 f8             	sub    %rdi,%rax
    d38e:	4d 85 e4             	test   %r12,%r12
    d391:	48 0f 49 c2          	cmovns %rdx,%rax
    d395:	48 39 c1             	cmp    %rax,%rcx
    d398:	0f 87 d8 fc ff ff    	ja     d076 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    d39e:	4c 8b 4c 24 58       	mov    0x58(%rsp),%r9
    d3a3:	4c 89 ca             	mov    %r9,%rdx
    d3a6:	4c 21 c2             	and    %r8,%rdx
    d3a9:	48 89 f7             	mov    %rsi,%rdi
    d3ac:	48 29 d7             	sub    %rdx,%rdi
    d3af:	4c 89 ca             	mov    %r9,%rdx
    d3b2:	48 09 f2             	or     %rsi,%rdx
    d3b5:	4d 85 c9             	test   %r9,%r9
    d3b8:	48 0f 49 fa          	cmovns %rdx,%rdi
    d3bc:	48 39 cf             	cmp    %rcx,%rdi
    d3bf:	49 0f 46 d9          	cmovbe %r9,%rbx
    d3c3:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
    d3c8:	48 89 f9             	mov    %rdi,%rcx
    d3cb:	4c 21 c1             	and    %r8,%rcx
    d3ce:	48 89 f2             	mov    %rsi,%rdx
    d3d1:	48 29 ca             	sub    %rcx,%rdx
    d3d4:	48 89 f9             	mov    %rdi,%rcx
    d3d7:	48 09 f1             	or     %rsi,%rcx
    d3da:	48 85 ff             	test   %rdi,%rdi
    d3dd:	48 0f 49 d1          	cmovns %rcx,%rdx
    d3e1:	48 39 c2             	cmp    %rax,%rdx
    d3e4:	4c 0f 43 e7          	cmovae %rdi,%r12
    d3e8:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
    d3ed:	48 33 44 24 60       	xor    0x60(%rsp),%rax
    d3f2:	44 03 6c 24 74       	add    0x74(%rsp),%r13d
    d3f7:	48 c1 e8 3f          	shr    $0x3f,%rax
    d3fb:	88 44 24 14          	mov    %al,0x14(%rsp)
    d3ff:	48 8b 84 24 80 00 00 	mov    0x80(%rsp),%rax
    d406:	00 
    d407:	48 f7 e5             	mul    %rbp
    d40a:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    d40f:	48 89 04 24          	mov    %rax,(%rsp)
    d413:	44 89 6c 24 10       	mov    %r13d,0x10(%rsp)
    d418:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    d41d:	48 89 e1             	mov    %rsp,%rcx
    d420:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
    d427:	00 f0 7f 
    d42a:	4c 89 ea             	mov    %r13,%rdx
    d42d:	e8 de 0f 00 00       	call   e410 <hyperinterval::ieee::Format::rounded>
    d432:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
    d437:	0f 85 d7 fb ff ff    	jne    d014 <hyperinterval::float::F64Enclosure::corner_image+0x504>
    d43d:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    d442:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
    d447:	48 89 e7             	mov    %rsp,%rdi
    d44a:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d451:	00 00 80 
    d454:	4c 89 ea             	mov    %r13,%rdx
    d457:	e8 74 0f 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    d45c:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    d460:	0f 85 0a fc ff ff    	jne    d070 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    d466:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    d46b:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    d470:	48 89 e7             	mov    %rsp,%rdi
    d473:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d47a:	00 00 80 
    d47d:	4c 89 ea             	mov    %r13,%rdx
    d480:	4c 89 f9             	mov    %r15,%rcx
    d483:	e8 48 0f 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    d488:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    d48c:	0f 85 de fb ff ff    	jne    d070 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    d492:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    d497:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
    d49c:	48 89 f9             	mov    %rdi,%rcx
    d49f:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
    d4a6:	00 00 80 
    d4a9:	4c 09 c1             	or     %r8,%rcx
    d4ac:	48 89 fe             	mov    %rdi,%rsi
    d4af:	4c 8b 4c 24 28       	mov    0x28(%rsp),%r9
    d4b4:	4c 21 ce             	and    %r9,%rsi
    d4b7:	4c 89 c2             	mov    %r8,%rdx
    d4ba:	48 29 f2             	sub    %rsi,%rdx
    d4bd:	48 85 ff             	test   %rdi,%rdi
    d4c0:	48 0f 49 d1          	cmovns %rcx,%rdx
    d4c4:	48 89 c6             	mov    %rax,%rsi
    d4c7:	4c 09 c6             	or     %r8,%rsi
    d4ca:	48 89 c7             	mov    %rax,%rdi
    d4cd:	4c 21 cf             	and    %r9,%rdi
    d4d0:	4c 89 c1             	mov    %r8,%rcx
    d4d3:	48 29 f9             	sub    %rdi,%rcx
    d4d6:	48 85 c0             	test   %rax,%rax
    d4d9:	48 0f 49 ce          	cmovns %rsi,%rcx
    d4dd:	48 39 ca             	cmp    %rcx,%rdx
    d4e0:	0f 87 90 fb ff ff    	ja     d076 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    d4e6:	48 89 de             	mov    %rbx,%rsi
    d4e9:	49 b9 00 00 00 00 00 	movabs $0x8000000000000000,%r9
    d4f0:	00 00 80 
    d4f3:	4c 09 ce             	or     %r9,%rsi
    d4f6:	48 89 df             	mov    %rbx,%rdi
    d4f9:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
    d4fe:	4c 21 d7             	and    %r10,%rdi
    d501:	4d 89 c8             	mov    %r9,%r8
    d504:	49 29 f8             	sub    %rdi,%r8
    d507:	48 85 db             	test   %rbx,%rbx
    d50a:	4c 0f 49 c6          	cmovns %rsi,%r8
    d50e:	49 39 d0             	cmp    %rdx,%r8
    d511:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    d516:	48 0f 46 d3          	cmovbe %rbx,%rdx
    d51a:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
    d51f:	4c 89 e2             	mov    %r12,%rdx
    d522:	4c 09 ca             	or     %r9,%rdx
    d525:	4d 21 e2             	and    %r12,%r10
    d528:	4d 29 d1             	sub    %r10,%r9
    d52b:	4d 85 e4             	test   %r12,%r12
    d52e:	4c 0f 49 ca          	cmovns %rdx,%r9
    d532:	49 39 c9             	cmp    %rcx,%r9
    d535:	49 0f 43 c4          	cmovae %r12,%rax
    d539:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
    d53e:	48 c7 01 01 00 00 00 	movq   $0x1,(%rcx)
    d545:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    d54a:	48 89 51 08          	mov    %rdx,0x8(%rcx)
    d54e:	48 89 41 10          	mov    %rax,0x10(%rcx)
    d552:	e9 2f fb ff ff       	jmp    d086 <hyperinterval::float::F64Enclosure::corner_image+0x576>
    d557:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    d55e:	00 00 

hyperinterval::float::F64Enclosure::div:
    d560:	53                   	push   %rbx
    d561:	48 89 fb             	mov    %rdi,%rbx
    d564:	f6 02 01             	testb  $0x1,(%rdx)
    d567:	74 56                	je     d5bf <hyperinterval::float::F64Enclosure::div+0x5f>
    d569:	48 b8 ff ff ff ff ff 	movabs $0x7fffffffffffffff,%rax
    d570:	ff ff 7f 
    d573:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
    d577:	48 8d 78 01          	lea    0x1(%rax),%rdi
    d57b:	4c 8d 04 01          	lea    (%rcx,%rax,1),%r8
    d57f:	49 ff c0             	inc    %r8
    d582:	49 89 c9             	mov    %rcx,%r9
    d585:	49 21 c1             	and    %rax,%r9
    d588:	49 f7 d9             	neg    %r9
    d58b:	49 01 c1             	add    %rax,%r9
    d58e:	49 ff c1             	inc    %r9
    d591:	48 85 c9             	test   %rcx,%rcx
    d594:	4d 0f 49 c8          	cmovns %r8,%r9
    d598:	49 39 f9             	cmp    %rdi,%r9
    d59b:	77 22                	ja     d5bf <hyperinterval::float::F64Enclosure::div+0x5f>
    d59d:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
    d5a1:	48 89 cf             	mov    %rcx,%rdi
    d5a4:	48 21 c7             	and    %rax,%rdi
    d5a7:	48 01 c7             	add    %rax,%rdi
    d5aa:	48 85 f9             	test   %rdi,%rcx
    d5ad:	78 10                	js     d5bf <hyperinterval::float::F64Enclosure::div+0x5f>
    d5af:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
    d5b3:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    d5ba:	48 89 d8             	mov    %rbx,%rax
    d5bd:	5b                   	pop    %rbx
    d5be:	c3                   	ret
    d5bf:	48 89 df             	mov    %rbx,%rdi
    d5c2:	b9 01 00 00 00       	mov    $0x1,%ecx
    d5c7:	e8 44 f5 ff ff       	call   cb10 <hyperinterval::float::F64Enclosure::corner_image>
    d5cc:	48 89 d8             	mov    %rbx,%rax
    d5cf:	5b                   	pop    %rbx
    d5d0:	c3                   	ret
    d5d1:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    d5d8:	00 00 00 
    d5db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

hyperinterval::float::F64Enclosure::reciprocal:
    d5e0:	55                   	push   %rbp
    d5e1:	41 57                	push   %r15
    d5e3:	41 56                	push   %r14
    d5e5:	41 55                	push   %r13
    d5e7:	41 54                	push   %r12
    d5e9:	53                   	push   %rbx
    d5ea:	48 83 ec 28          	sub    $0x28,%rsp
    d5ee:	48 89 fb             	mov    %rdi,%rbx
    d5f1:	48 83 3e 00          	cmpq   $0x0,(%rsi)
    d5f5:	74 65                	je     d65c <hyperinterval::float::F64Enclosure::reciprocal+0x7c>
    d5f7:	49 89 f6             	mov    %rsi,%r14
    d5fa:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
    d601:	00 00 80 
    d604:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
    d60b:	00 f0 7f 
    d60e:	49 bd 00 00 00 00 00 	movabs $0x3ff0000000000000,%r13
    d615:	00 f0 3f 
    d618:	48 89 e7             	mov    %rsp,%rdi
    d61b:	4c 89 fe             	mov    %r15,%rsi
    d61e:	4c 89 e2             	mov    %r12,%rdx
    d621:	4c 89 e9             	mov    %r13,%rcx
    d624:	e8 a7 0d 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    d629:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d62d:	74 1c                	je     d64b <hyperinterval::float::F64Enclosure::reciprocal+0x6b>
    d62f:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    d634:	48 89 e7             	mov    %rsp,%rdi
    d637:	4c 89 fe             	mov    %r15,%rsi
    d63a:	4c 89 e2             	mov    %r12,%rdx
    d63d:	4c 89 e9             	mov    %r13,%rcx
    d640:	e8 8b 0d 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    d645:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d649:	75 2a                	jne    d675 <hyperinterval::float::F64Enclosure::reciprocal+0x95>
    d64b:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
    d650:	88 53 08             	mov    %dl,0x8(%rbx)
    d653:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    d65a:	eb 07                	jmp    d663 <hyperinterval::float::F64Enclosure::reciprocal+0x83>
    d65c:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    d663:	48 89 d8             	mov    %rbx,%rax
    d666:	48 83 c4 28          	add    $0x28,%rsp
    d66a:	5b                   	pop    %rbx
    d66b:	41 5c                	pop    %r12
    d66d:	41 5d                	pop    %r13
    d66f:	41 5e                	pop    %r14
    d671:	41 5f                	pop    %r15
    d673:	5d                   	pop    %rbp
    d674:	c3                   	ret
    d675:	48 89 e9             	mov    %rbp,%rcx
    d678:	4c 09 f9             	or     %r15,%rcx
    d67b:	49 8d 47 ff          	lea    -0x1(%r15),%rax
    d67f:	48 89 ea             	mov    %rbp,%rdx
    d682:	48 21 c2             	and    %rax,%rdx
    d685:	4c 89 fe             	mov    %r15,%rsi
    d688:	48 29 d6             	sub    %rdx,%rsi
    d68b:	48 85 ed             	test   %rbp,%rbp
    d68e:	48 0f 49 f1          	cmovns %rcx,%rsi
    d692:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    d697:	48 89 ca             	mov    %rcx,%rdx
    d69a:	4c 09 fa             	or     %r15,%rdx
    d69d:	48 89 cf             	mov    %rcx,%rdi
    d6a0:	48 21 c7             	and    %rax,%rdi
    d6a3:	4d 89 f8             	mov    %r15,%r8
    d6a6:	49 29 f8             	sub    %rdi,%r8
    d6a9:	48 85 c9             	test   %rcx,%rcx
    d6ac:	4c 0f 49 c2          	cmovns %rdx,%r8
    d6b0:	b2 01                	mov    $0x1,%dl
    d6b2:	4c 39 c6             	cmp    %r8,%rsi
    d6b5:	77 99                	ja     d650 <hyperinterval::float::F64Enclosure::reciprocal+0x70>
    d6b7:	48 89 ea             	mov    %rbp,%rdx
    d6ba:	48 c1 ea 08          	shr    $0x8,%rdx
    d6be:	48 c7 44 24 10 01 00 	movq   $0x1,0x10(%rsp)
    d6c5:	00 00 
    d6c7:	40 88 6c 24 18       	mov    %bpl,0x18(%rsp)
    d6cc:	48 89 ee             	mov    %rbp,%rsi
    d6cf:	48 c1 ee 38          	shr    $0x38,%rsi
    d6d3:	40 88 74 24 1f       	mov    %sil,0x1f(%rsp)
    d6d8:	48 c1 ed 28          	shr    $0x28,%rbp
    d6dc:	66 89 6c 24 1d       	mov    %bp,0x1d(%rsp)
    d6e1:	89 54 24 19          	mov    %edx,0x19(%rsp)
    d6e5:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
    d6ea:	49 8b 4e 08          	mov    0x8(%r14),%rcx
    d6ee:	48 89 ca             	mov    %rcx,%rdx
    d6f1:	4c 09 fa             	or     %r15,%rdx
    d6f4:	48 89 ce             	mov    %rcx,%rsi
    d6f7:	48 21 c6             	and    %rax,%rsi
    d6fa:	4c 89 ff             	mov    %r15,%rdi
    d6fd:	48 29 f7             	sub    %rsi,%rdi
    d700:	48 85 c9             	test   %rcx,%rcx
    d703:	48 0f 49 fa          	cmovns %rdx,%rdi
    d707:	4c 39 ff             	cmp    %r15,%rdi
    d70a:	77 1b                	ja     d727 <hyperinterval::float::F64Enclosure::reciprocal+0x147>
    d70c:	49 8b 4e 10          	mov    0x10(%r14),%rcx
    d710:	48 21 c8             	and    %rcx,%rax
    d713:	4c 01 f8             	add    %r15,%rax
    d716:	48 ff c8             	dec    %rax
    d719:	48 85 c1             	test   %rax,%rcx
    d71c:	78 09                	js     d727 <hyperinterval::float::F64Enclosure::reciprocal+0x147>
    d71e:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
    d722:	e9 2c ff ff ff       	jmp    d653 <hyperinterval::float::F64Enclosure::reciprocal+0x73>
    d727:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
    d72c:	48 89 df             	mov    %rbx,%rdi
    d72f:	4c 89 f2             	mov    %r14,%rdx
    d732:	b9 01 00 00 00       	mov    $0x1,%ecx
    d737:	e8 d4 f3 ff ff       	call   cb10 <hyperinterval::float::F64Enclosure::corner_image>
    d73c:	e9 22 ff ff ff       	jmp    d663 <hyperinterval::float::F64Enclosure::reciprocal+0x83>
    d741:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    d748:	00 00 00 
    d74b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

hyperinterval::float::F64Enclosure::square:
    d750:	55                   	push   %rbp
    d751:	41 57                	push   %r15
    d753:	41 56                	push   %r14
    d755:	41 55                	push   %r13
    d757:	41 54                	push   %r12
    d759:	53                   	push   %rbx
    d75a:	48 83 ec 58          	sub    $0x58,%rsp
    d75e:	48 89 fb             	mov    %rdi,%rbx
    d761:	f6 06 01             	testb  $0x1,(%rsi)
    d764:	0f 84 08 01 00 00    	je     d872 <hyperinterval::float::F64Enclosure::square+0x122>
    d76a:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
    d76e:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
    d775:	00 00 80 
    d778:	49 b8 00 00 00 00 00 	movabs $0x7ff0000000000000,%r8
    d77f:	00 f0 7f 
    d782:	49 be ff ff ff ff ff 	movabs $0xfffffffffffff,%r14
    d789:	ff 0f 00 
    d78c:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
    d790:	48 89 c8             	mov    %rcx,%rax
    d793:	48 c1 e8 34          	shr    $0x34,%rax
    d797:	25 ff 07 00 00       	and    $0x7ff,%eax
    d79c:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
    d7a1:	4c 21 f1             	and    %r14,%rcx
    d7a4:	49 8d 6e 01          	lea    0x1(%r14),%rbp
    d7a8:	48 85 c0             	test   %rax,%rax
    d7ab:	8d b4 00 9a f7 ff ff 	lea    -0x866(%rax,%rax,1),%esi
    d7b2:	48 0f 45 c5          	cmovne %rbp,%rax
    d7b6:	41 bd 9c f7 ff ff    	mov    $0xfffff79c,%r13d
    d7bc:	41 0f 44 f5          	cmove  %r13d,%esi
    d7c0:	48 09 c8             	or     %rcx,%rax
    d7c3:	48 f7 e0             	mul    %rax
    d7c6:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
    d7cb:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    d7d0:	48 89 04 24          	mov    %rax,(%rsp)
    d7d4:	89 74 24 10          	mov    %esi,0x10(%rsp)
    d7d8:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
    d7dd:	48 89 e1             	mov    %rsp,%rcx
    d7e0:	4c 89 e6             	mov    %r12,%rsi
    d7e3:	4c 89 c2             	mov    %r8,%rdx
    d7e6:	e8 25 0c 00 00       	call   e410 <hyperinterval::ieee::Format::rounded>
    d7eb:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
    d7f0:	75 79                	jne    d86b <hyperinterval::float::F64Enclosure::square+0x11b>
    d7f2:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
    d7f7:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    d7fc:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
    d801:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    d806:	4c 89 f8             	mov    %r15,%rax
    d809:	48 c1 e8 34          	shr    $0x34,%rax
    d80d:	25 ff 07 00 00       	and    $0x7ff,%eax
    d812:	4c 89 7c 24 48       	mov    %r15,0x48(%rsp)
    d817:	4d 21 fe             	and    %r15,%r14
    d81a:	48 85 c0             	test   %rax,%rax
    d81d:	48 0f 44 e8          	cmove  %rax,%rbp
    d821:	8d 8c 00 9a f7 ff ff 	lea    -0x866(%rax,%rax,1),%ecx
    d828:	41 0f 44 cd          	cmove  %r13d,%ecx
    d82c:	4c 09 f5             	or     %r14,%rbp
    d82f:	48 89 e8             	mov    %rbp,%rax
    d832:	48 f7 e5             	mul    %rbp
    d835:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
    d83a:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    d83f:	48 89 04 24          	mov    %rax,(%rsp)
    d843:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
    d847:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
    d84c:	48 89 e1             	mov    %rsp,%rcx
    d84f:	4c 89 e6             	mov    %r12,%rsi
    d852:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
    d859:	00 f0 7f 
    d85c:	4c 89 fa             	mov    %r15,%rdx
    d85f:	e8 ac 0b 00 00       	call   e410 <hyperinterval::ieee::Format::rounded>
    d864:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
    d869:	75 10                	jne    d87b <hyperinterval::float::F64Enclosure::square+0x12b>
    d86b:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
    d870:	eb 4f                	jmp    d8c1 <hyperinterval::float::F64Enclosure::square+0x171>
    d872:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    d879:	eb 50                	jmp    d8cb <hyperinterval::float::F64Enclosure::square+0x17b>
    d87b:	48 8b 6c 24 38       	mov    0x38(%rsp),%rbp
    d880:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
    d885:	48 89 e7             	mov    %rsp,%rdi
    d888:	4c 89 e6             	mov    %r12,%rsi
    d88b:	4c 89 fa             	mov    %r15,%rdx
    d88e:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    d893:	e8 38 0b 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    d898:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d89c:	74 1e                	je     d8bc <hyperinterval::float::F64Enclosure::square+0x16c>
    d89e:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    d8a3:	48 89 e7             	mov    %rsp,%rdi
    d8a6:	4c 89 e6             	mov    %r12,%rsi
    d8a9:	4c 89 fa             	mov    %r15,%rdx
    d8ac:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    d8b1:	e8 1a 0b 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    d8b6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d8ba:	75 21                	jne    d8dd <hyperinterval::float::F64Enclosure::square+0x18d>
    d8bc:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    d8c1:	88 43 08             	mov    %al,0x8(%rbx)
    d8c4:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    d8cb:	48 89 d8             	mov    %rbx,%rax
    d8ce:	48 83 c4 58          	add    $0x58,%rsp
    d8d2:	5b                   	pop    %rbx
    d8d3:	41 5c                	pop    %r12
    d8d5:	41 5d                	pop    %r13
    d8d7:	41 5e                	pop    %r14
    d8d9:	41 5f                	pop    %r15
    d8db:	5d                   	pop    %rbp
    d8dc:	c3                   	ret
    d8dd:	4c 89 74 24 28       	mov    %r14,0x28(%rsp)
    d8e2:	4c 89 e8             	mov    %r13,%rax
    d8e5:	4c 09 e0             	or     %r12,%rax
    d8e8:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
    d8ed:	4c 89 e9             	mov    %r13,%rcx
    d8f0:	4c 21 f1             	and    %r14,%rcx
    d8f3:	4c 89 e2             	mov    %r12,%rdx
    d8f6:	48 29 ca             	sub    %rcx,%rdx
    d8f9:	4d 85 ed             	test   %r13,%r13
    d8fc:	48 0f 49 d0          	cmovns %rax,%rdx
    d900:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    d905:	48 89 f8             	mov    %rdi,%rax
    d908:	4c 09 e0             	or     %r12,%rax
    d90b:	48 89 f9             	mov    %rdi,%rcx
    d90e:	4c 21 f1             	and    %r14,%rcx
    d911:	4c 89 e6             	mov    %r12,%rsi
    d914:	48 29 ce             	sub    %rcx,%rsi
    d917:	48 85 ff             	test   %rdi,%rdi
    d91a:	48 0f 49 f0          	cmovns %rax,%rsi
    d91e:	b0 01                	mov    $0x1,%al
    d920:	48 39 f2             	cmp    %rsi,%rdx
    d923:	77 9c                	ja     d8c1 <hyperinterval::float::F64Enclosure::square+0x171>
    d925:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
    d92a:	48 89 e7             	mov    %rsp,%rdi
    d92d:	4c 89 e6             	mov    %r12,%rsi
    d930:	4c 89 fa             	mov    %r15,%rdx
    d933:	48 89 e9             	mov    %rbp,%rcx
    d936:	e8 95 0a 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    d93b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d93f:	0f 84 77 ff ff ff    	je     d8bc <hyperinterval::float::F64Enclosure::square+0x16c>
    d945:	4c 89 ed             	mov    %r13,%rbp
    d948:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    d94d:	48 89 e7             	mov    %rsp,%rdi
    d950:	4c 89 e6             	mov    %r12,%rsi
    d953:	4c 89 fa             	mov    %r15,%rdx
    d956:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    d95b:	e8 70 0a 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    d960:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d964:	0f 84 52 ff ff ff    	je     d8bc <hyperinterval::float::F64Enclosure::square+0x16c>
    d96a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    d96f:	4c 89 e8             	mov    %r13,%rax
    d972:	4c 09 e0             	or     %r12,%rax
    d975:	4c 89 ea             	mov    %r13,%rdx
    d978:	4c 21 f2             	and    %r14,%rdx
    d97b:	4c 89 e6             	mov    %r12,%rsi
    d97e:	48 29 d6             	sub    %rdx,%rsi
    d981:	4d 85 ed             	test   %r13,%r13
    d984:	48 0f 49 f0          	cmovns %rax,%rsi
    d988:	48 89 c8             	mov    %rcx,%rax
    d98b:	4c 09 e0             	or     %r12,%rax
    d98e:	49 21 ce             	and    %rcx,%r14
    d991:	4d 29 f4             	sub    %r14,%r12
    d994:	48 85 c9             	test   %rcx,%rcx
    d997:	4c 0f 49 e0          	cmovns %rax,%r12
    d99b:	b0 01                	mov    $0x1,%al
    d99d:	4c 39 e6             	cmp    %r12,%rsi
    d9a0:	0f 87 1b ff ff ff    	ja     d8c1 <hyperinterval::float::F64Enclosure::square+0x171>
    d9a6:	48 89 ef             	mov    %rbp,%rdi
    d9a9:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    d9ae:	4c 89 ea             	mov    %r13,%rdx
    d9b1:	e8 da 07 00 00       	call   e190 <hyperinterval::bounds::Bounds<T>::hull>
    d9b6:	49 89 c5             	mov    %rax,%r13
    d9b9:	49 89 d4             	mov    %rdx,%r12
    d9bc:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
    d9c1:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
    d9c6:	31 d2                	xor    %edx,%edx
    d9c8:	e8 73 09 00 00       	call   e340 <hyperinterval::bounds::Bounds<T>::signs>
    d9cd:	a8 02                	test   $0x2,%al
    d9cf:	75 14                	jne    d9e5 <hyperinterval::float::F64Enclosure::square+0x295>
    d9d1:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
    d9d8:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
    d9dc:	4c 89 63 10          	mov    %r12,0x10(%rbx)
    d9e0:	e9 e6 fe ff ff       	jmp    d8cb <hyperinterval::float::F64Enclosure::square+0x17b>
    d9e5:	48 89 e7             	mov    %rsp,%rdi
    d9e8:	31 f6                	xor    %esi,%esi
    d9ea:	31 d2                	xor    %edx,%edx
    d9ec:	e8 2f e7 ff ff       	call   c120 <hyperinterval::float::F64Enclosure::from_bits>
    d9f1:	48 8b 0c 24          	mov    (%rsp),%rcx
    d9f5:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
    d9fa:	48 83 f9 02          	cmp    $0x2,%rcx
    d9fe:	0f 84 bd fe ff ff    	je     d8c1 <hyperinterval::float::F64Enclosure::square+0x171>
    da04:	f6 c1 01             	test   $0x1,%cl
    da07:	74 c8                	je     d9d1 <hyperinterval::float::F64Enclosure::square+0x281>
    da09:	0f b6 c0             	movzbl %al,%eax
    da0c:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
    da11:	c1 e1 10             	shl    $0x10,%ecx
    da14:	0f b7 74 24 0d       	movzwl 0xd(%rsp),%esi
    da19:	09 ce                	or     %ecx,%esi
    da1b:	48 c1 e6 20          	shl    $0x20,%rsi
    da1f:	8b 54 24 09          	mov    0x9(%rsp),%edx
    da23:	48 09 f2             	or     %rsi,%rdx
    da26:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    da2b:	48 c1 e2 08          	shl    $0x8,%rdx
    da2f:	48 09 c2             	or     %rax,%rdx
    da32:	4c 89 ef             	mov    %r13,%rdi
    da35:	4c 89 e6             	mov    %r12,%rsi
    da38:	e8 53 07 00 00       	call   e190 <hyperinterval::bounds::Bounds<T>::hull>
    da3d:	49 89 c5             	mov    %rax,%r13
    da40:	49 89 d4             	mov    %rdx,%r12
    da43:	eb 8c                	jmp    d9d1 <hyperinterval::float::F64Enclosure::square+0x281>
    da45:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    da4c:	00 00 00 
    da4f:	90                   	nop

hyperinterval::float::F64Enclosure::checked_pow:
    da50:	55                   	push   %rbp
    da51:	41 57                	push   %r15
    da53:	41 56                	push   %r14
    da55:	41 55                	push   %r13
    da57:	41 54                	push   %r12
    da59:	53                   	push   %rbx
    da5a:	48 83 ec 48          	sub    $0x48,%rsp
    da5e:	48 89 fb             	mov    %rdi,%rbx
    da61:	83 fa 02             	cmp    $0x2,%edx
    da64:	75 0e                	jne    da74 <hyperinterval::float::F64Enclosure::checked_pow+0x24>
    da66:	48 89 df             	mov    %rbx,%rdi
    da69:	ff 15 89 20 05 00    	call   *0x52089(%rip)        # 5faf8 <_GLOBAL_OFFSET_TABLE_+0x530>
    da6f:	e9 e0 00 00 00       	jmp    db54 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
    da74:	f6 06 01             	testb  $0x1,(%rsi)
    da77:	0f 84 d0 00 00 00    	je     db4d <hyperinterval::float::F64Enclosure::checked_pow+0xfd>
    da7d:	89 d5                	mov    %edx,%ebp
    da7f:	4c 8b 76 10          	mov    0x10(%rsi),%r14
    da83:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
    da8a:	00 00 80 
    da8d:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
    da94:	00 f0 7f 
    da97:	4c 8b 7e 08          	mov    0x8(%rsi),%r15
    da9b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    daa0:	4c 89 e6             	mov    %r12,%rsi
    daa3:	4c 89 ea             	mov    %r13,%rdx
    daa6:	4c 89 f9             	mov    %r15,%rcx
    daa9:	41 89 e8             	mov    %ebp,%r8d
    daac:	e8 3f 17 00 00       	call   f1f0 <hyperinterval::ieee::Format::power>
    dab1:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
    dab6:	0f 85 80 00 00 00    	jne    db3c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
    dabc:	4c 89 f1             	mov    %r14,%rcx
    dabf:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
    dac4:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    dac9:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    dace:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    dad3:	4c 89 e6             	mov    %r12,%rsi
    dad6:	4c 89 ea             	mov    %r13,%rdx
    dad9:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
    dade:	41 89 e8             	mov    %ebp,%r8d
    dae1:	e8 0a 17 00 00       	call   f1f0 <hyperinterval::ieee::Format::power>
    dae6:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    daeb:	74 4f                	je     db3c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
    daed:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    daf2:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    daf7:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    dafc:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
    db01:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    db06:	4c 89 e6             	mov    %r12,%rsi
    db09:	4c 89 ea             	mov    %r13,%rdx
    db0c:	4c 89 f1             	mov    %r14,%rcx
    db0f:	e8 bc 08 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    db14:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    db19:	74 21                	je     db3c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
    db1b:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
    db20:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    db25:	4c 89 e6             	mov    %r12,%rsi
    db28:	4c 89 ea             	mov    %r13,%rdx
    db2b:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    db30:	e8 9b 08 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    db35:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    db3a:	75 2a                	jne    db66 <hyperinterval::float::F64Enclosure::checked_pow+0x116>
    db3c:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
    db41:	88 43 08             	mov    %al,0x8(%rbx)
    db44:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    db4b:	eb 07                	jmp    db54 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
    db4d:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    db54:	48 89 d8             	mov    %rbx,%rax
    db57:	48 83 c4 48          	add    $0x48,%rsp
    db5b:	5b                   	pop    %rbx
    db5c:	41 5c                	pop    %r12
    db5e:	41 5d                	pop    %r13
    db60:	41 5e                	pop    %r14
    db62:	41 5f                	pop    %r15
    db64:	5d                   	pop    %rbp
    db65:	c3                   	ret
    db66:	4c 89 f0             	mov    %r14,%rax
    db69:	4c 09 e0             	or     %r12,%rax
    db6c:	4c 89 f6             	mov    %r14,%rsi
    db6f:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
    db74:	48 89 f1             	mov    %rsi,%rcx
    db77:	4c 21 f1             	and    %r14,%rcx
    db7a:	4c 89 e2             	mov    %r12,%rdx
    db7d:	48 29 ca             	sub    %rcx,%rdx
    db80:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
    db85:	48 85 f6             	test   %rsi,%rsi
    db88:	48 0f 49 d0          	cmovns %rax,%rdx
    db8c:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    db91:	48 89 f8             	mov    %rdi,%rax
    db94:	4c 09 e0             	or     %r12,%rax
    db97:	48 89 f9             	mov    %rdi,%rcx
    db9a:	4c 21 f1             	and    %r14,%rcx
    db9d:	4c 89 e6             	mov    %r12,%rsi
    dba0:	48 29 ce             	sub    %rcx,%rsi
    dba3:	48 85 ff             	test   %rdi,%rdi
    dba6:	48 0f 49 f0          	cmovns %rax,%rsi
    dbaa:	b0 01                	mov    $0x1,%al
    dbac:	48 39 f2             	cmp    %rsi,%rdx
    dbaf:	77 90                	ja     db41 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
    dbb1:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
    dbb6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    dbbb:	4c 89 e6             	mov    %r12,%rsi
    dbbe:	4c 89 ea             	mov    %r13,%rdx
    dbc1:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    dbc6:	e8 05 08 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    dbcb:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    dbd0:	0f 84 66 ff ff ff    	je     db3c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
    dbd6:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    dbdb:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    dbe0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    dbe5:	4c 89 e6             	mov    %r12,%rsi
    dbe8:	4c 89 ea             	mov    %r13,%rdx
    dbeb:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
    dbf0:	e8 db 07 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    dbf5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    dbfa:	0f 84 3c ff ff ff    	je     db3c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
    dc00:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    dc05:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    dc0a:	48 89 d0             	mov    %rdx,%rax
    dc0d:	4c 09 e0             	or     %r12,%rax
    dc10:	48 89 d7             	mov    %rdx,%rdi
    dc13:	4c 21 f7             	and    %r14,%rdi
    dc16:	4c 89 e6             	mov    %r12,%rsi
    dc19:	48 29 fe             	sub    %rdi,%rsi
    dc1c:	48 85 d2             	test   %rdx,%rdx
    dc1f:	48 0f 49 f0          	cmovns %rax,%rsi
    dc23:	48 89 c8             	mov    %rcx,%rax
    dc26:	4c 09 e0             	or     %r12,%rax
    dc29:	49 21 ce             	and    %rcx,%r14
    dc2c:	4d 29 f4             	sub    %r14,%r12
    dc2f:	48 85 c9             	test   %rcx,%rcx
    dc32:	4c 0f 49 e0          	cmovns %rax,%r12
    dc36:	b0 01                	mov    $0x1,%al
    dc38:	4c 39 e6             	cmp    %r12,%rsi
    dc3b:	0f 87 00 ff ff ff    	ja     db41 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
    dc41:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
    dc46:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
    dc4b:	e8 40 05 00 00       	call   e190 <hyperinterval::bounds::Bounds<T>::hull>
    dc50:	49 89 c5             	mov    %rax,%r13
    dc53:	49 89 d4             	mov    %rdx,%r12
    dc56:	85 ed                	test   %ebp,%ebp
    dc58:	0f 95 c0             	setne  %al
    dc5b:	40 f6 c5 01          	test   $0x1,%bpl
    dc5f:	0f 94 c1             	sete   %cl
    dc62:	84 c8                	test   %cl,%al
    dc64:	74 13                	je     dc79 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
    dc66:	4c 89 ff             	mov    %r15,%rdi
    dc69:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
    dc6e:	31 d2                	xor    %edx,%edx
    dc70:	e8 cb 06 00 00       	call   e340 <hyperinterval::bounds::Bounds<T>::signs>
    dc75:	a8 02                	test   $0x2,%al
    dc77:	75 14                	jne    dc8d <hyperinterval::float::F64Enclosure::checked_pow+0x23d>
    dc79:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
    dc80:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
    dc84:	4c 89 63 10          	mov    %r12,0x10(%rbx)
    dc88:	e9 c7 fe ff ff       	jmp    db54 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
    dc8d:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    dc92:	31 f6                	xor    %esi,%esi
    dc94:	31 d2                	xor    %edx,%edx
    dc96:	e8 85 e4 ff ff       	call   c120 <hyperinterval::float::F64Enclosure::from_bits>
    dc9b:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    dca0:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
    dca5:	48 83 f9 02          	cmp    $0x2,%rcx
    dca9:	0f 84 92 fe ff ff    	je     db41 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
    dcaf:	f6 c1 01             	test   $0x1,%cl
    dcb2:	74 c5                	je     dc79 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
    dcb4:	0f b6 c0             	movzbl %al,%eax
    dcb7:	0f b6 4c 24 17       	movzbl 0x17(%rsp),%ecx
    dcbc:	c1 e1 10             	shl    $0x10,%ecx
    dcbf:	0f b7 74 24 15       	movzwl 0x15(%rsp),%esi
    dcc4:	09 ce                	or     %ecx,%esi
    dcc6:	48 c1 e6 20          	shl    $0x20,%rsi
    dcca:	8b 54 24 11          	mov    0x11(%rsp),%edx
    dcce:	48 09 f2             	or     %rsi,%rdx
    dcd1:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    dcd6:	48 c1 e2 08          	shl    $0x8,%rdx
    dcda:	48 09 c2             	or     %rax,%rdx
    dcdd:	4c 89 ef             	mov    %r13,%rdi
    dce0:	4c 89 e6             	mov    %r12,%rsi
    dce3:	e8 a8 04 00 00       	call   e190 <hyperinterval::bounds::Bounds<T>::hull>
    dce8:	49 89 c5             	mov    %rax,%r13
    dceb:	49 89 d4             	mov    %rdx,%r12
    dcee:	eb 89                	jmp    dc79 <hyperinterval::float::F64Enclosure::checked_pow+0x229>

hyperinterval::float::F64Enclosure::affine:
    dcf0:	55                   	push   %rbp
    dcf1:	41 57                	push   %r15
    dcf3:	41 56                	push   %r14
    dcf5:	41 55                	push   %r13
    dcf7:	41 54                	push   %r12
    dcf9:	53                   	push   %rbx
    dcfa:	48 83 ec 28          	sub    $0x28,%rsp
    dcfe:	f2 0f 11 4c 24 18    	movsd  %xmm1,0x18(%rsp)
    dd04:	49 89 f5             	mov    %rsi,%r13
    dd07:	48 89 fb             	mov    %rdi,%rbx
    dd0a:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
    dd11:	00 00 80 
    dd14:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
    dd1b:	00 f0 7f 
    dd1e:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    dd23:	48 89 e7             	mov    %rsp,%rdi
    dd26:	4c 89 f6             	mov    %r14,%rsi
    dd29:	4c 89 e2             	mov    %r12,%rdx
    dd2c:	e8 9f 06 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    dd31:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    dd35:	74 24                	je     dd5b <hyperinterval::float::F64Enclosure::affine+0x6b>
    dd37:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
    dd3c:	f3 0f 7e 44 24 18    	movq   0x18(%rsp),%xmm0
    dd42:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    dd47:	48 89 e7             	mov    %rsp,%rdi
    dd4a:	4c 89 f6             	mov    %r14,%rsi
    dd4d:	4c 89 e2             	mov    %r12,%rdx
    dd50:	e8 7b 06 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    dd55:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    dd59:	75 21                	jne    dd7c <hyperinterval::float::F64Enclosure::affine+0x8c>
    dd5b:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    dd60:	88 43 08             	mov    %al,0x8(%rbx)
    dd63:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    dd6a:	48 89 d8             	mov    %rbx,%rax
    dd6d:	48 83 c4 28          	add    $0x28,%rsp
    dd71:	5b                   	pop    %rbx
    dd72:	41 5c                	pop    %r12
    dd74:	41 5d                	pop    %r13
    dd76:	41 5e                	pop    %r14
    dd78:	41 5f                	pop    %r15
    dd7a:	5d                   	pop    %rbp
    dd7b:	c3                   	ret
    dd7c:	41 f6 45 00 01       	testb  $0x1,0x0(%r13)
    dd81:	0f 84 59 01 00 00    	je     dee0 <hyperinterval::float::F64Enclosure::affine+0x1f0>
    dd87:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    dd8c:	49 8b 45 10          	mov    0x10(%r13),%rax
    dd90:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    dd95:	49 8b 4d 08          	mov    0x8(%r13),%rcx
    dd99:	48 89 e7             	mov    %rsp,%rdi
    dd9c:	4c 89 f6             	mov    %r14,%rsi
    dd9f:	4c 89 e2             	mov    %r12,%rdx
    dda2:	4d 89 f8             	mov    %r15,%r8
    dda5:	49 89 e9             	mov    %rbp,%r9
    dda8:	e8 13 0c 00 00       	call   e9c0 <hyperinterval::ieee::Format::affine>
    ddad:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    ddb1:	74 a8                	je     dd5b <hyperinterval::float::F64Enclosure::affine+0x6b>
    ddb3:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    ddb8:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    ddbd:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    ddc2:	48 89 e7             	mov    %rsp,%rdi
    ddc5:	4c 89 f6             	mov    %r14,%rsi
    ddc8:	4c 89 e2             	mov    %r12,%rdx
    ddcb:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    ddd0:	4d 89 f8             	mov    %r15,%r8
    ddd3:	49 89 e9             	mov    %rbp,%r9
    ddd6:	e8 e5 0b 00 00       	call   e9c0 <hyperinterval::ieee::Format::affine>
    dddb:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    dddf:	0f 84 76 ff ff ff    	je     dd5b <hyperinterval::float::F64Enclosure::affine+0x6b>
    dde5:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
    ddea:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
    ddef:	48 89 e7             	mov    %rsp,%rdi
    ddf2:	4c 89 f6             	mov    %r14,%rsi
    ddf5:	4c 89 e2             	mov    %r12,%rdx
    ddf8:	4c 89 e9             	mov    %r13,%rcx
    ddfb:	e8 d0 05 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    de00:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    de04:	0f 84 51 ff ff ff    	je     dd5b <hyperinterval::float::F64Enclosure::affine+0x6b>
    de0a:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    de0f:	48 89 e7             	mov    %rsp,%rdi
    de12:	4c 89 f6             	mov    %r14,%rsi
    de15:	4c 89 e2             	mov    %r12,%rdx
    de18:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    de1d:	e8 ae 05 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    de22:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    de26:	0f 84 2f ff ff ff    	je     dd5b <hyperinterval::float::F64Enclosure::affine+0x6b>
    de2c:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    de31:	4c 89 e8             	mov    %r13,%rax
    de34:	4c 09 f0             	or     %r14,%rax
    de37:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
    de3b:	4c 89 ea             	mov    %r13,%rdx
    de3e:	48 21 ca             	and    %rcx,%rdx
    de41:	4c 89 f6             	mov    %r14,%rsi
    de44:	48 29 d6             	sub    %rdx,%rsi
    de47:	4d 85 ed             	test   %r13,%r13
    de4a:	48 0f 49 f0          	cmovns %rax,%rsi
    de4e:	4c 89 e0             	mov    %r12,%rax
    de51:	4c 09 f0             	or     %r14,%rax
    de54:	4c 21 e1             	and    %r12,%rcx
    de57:	49 29 ce             	sub    %rcx,%r14
    de5a:	4d 85 e4             	test   %r12,%r12
    de5d:	4c 0f 49 f0          	cmovns %rax,%r14
    de61:	b0 01                	mov    $0x1,%al
    de63:	4c 39 f6             	cmp    %r14,%rsi
    de66:	0f 87 f4 fe ff ff    	ja     dd60 <hyperinterval::float::F64Enclosure::affine+0x70>
    de6c:	48 89 e7             	mov    %rsp,%rdi
    de6f:	4c 89 fe             	mov    %r15,%rsi
    de72:	48 89 ea             	mov    %rbp,%rdx
    de75:	e8 a6 e2 ff ff       	call   c120 <hyperinterval::float::F64Enclosure::from_bits>
    de7a:	48 8b 0c 24          	mov    (%rsp),%rcx
    de7e:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
    de83:	48 83 f9 02          	cmp    $0x2,%rcx
    de87:	0f 84 d3 fe ff ff    	je     dd60 <hyperinterval::float::F64Enclosure::affine+0x70>
    de8d:	f6 c1 01             	test   $0x1,%cl
    de90:	74 3a                	je     decc <hyperinterval::float::F64Enclosure::affine+0x1dc>
    de92:	0f b6 c0             	movzbl %al,%eax
    de95:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
    de9a:	c1 e1 10             	shl    $0x10,%ecx
    de9d:	0f b7 74 24 0d       	movzwl 0xd(%rsp),%esi
    dea2:	09 ce                	or     %ecx,%esi
    dea4:	48 c1 e6 20          	shl    $0x20,%rsi
    dea8:	8b 54 24 09          	mov    0x9(%rsp),%edx
    deac:	48 09 f2             	or     %rsi,%rdx
    deaf:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    deb4:	48 c1 e2 08          	shl    $0x8,%rdx
    deb8:	48 09 c2             	or     %rax,%rdx
    debb:	4c 89 ef             	mov    %r13,%rdi
    debe:	4c 89 e6             	mov    %r12,%rsi
    dec1:	e8 ca 02 00 00       	call   e190 <hyperinterval::bounds::Bounds<T>::hull>
    dec6:	49 89 c5             	mov    %rax,%r13
    dec9:	49 89 d4             	mov    %rdx,%r12
    decc:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
    ded3:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
    ded7:	4c 89 63 10          	mov    %r12,0x10(%rbx)
    dedb:	e9 8a fe ff ff       	jmp    dd6a <hyperinterval::float::F64Enclosure::affine+0x7a>
    dee0:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    dee7:	e9 7e fe ff ff       	jmp    dd6a <hyperinterval::float::F64Enclosure::affine+0x7a>
    deec:	0f 1f 40 00          	nopl   0x0(%rax)

hyperinterval::float::F64Enclosure::next_down:
    def0:	41 57                	push   %r15
    def2:	41 56                	push   %r14
    def4:	53                   	push   %rbx
    def5:	48 83 ec 10          	sub    $0x10,%rsp
    def9:	48 89 fb             	mov    %rdi,%rbx
    defc:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
    df03:	00 00 80 
    df06:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
    df0d:	00 f0 7f 
    df10:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    df15:	48 89 e7             	mov    %rsp,%rdi
    df18:	4c 89 f6             	mov    %r14,%rsi
    df1b:	4c 89 fa             	mov    %r15,%rdx
    df1e:	e8 ad 04 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    df23:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    df27:	75 0c                	jne    df35 <hyperinterval::float::F64Enclosure::next_down+0x45>
    df29:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    df2e:	88 43 01             	mov    %al,0x1(%rbx)
    df31:	b0 01                	mov    $0x1,%al
    df33:	eb 51                	jmp    df86 <hyperinterval::float::F64Enclosure::next_down+0x96>
    df35:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    df3a:	48 89 c2             	mov    %rax,%rdx
    df3d:	4c 31 f2             	xor    %r14,%rdx
    df40:	48 85 c0             	test   %rax,%rax
    df43:	48 0f 44 d0          	cmove  %rax,%rdx
    df47:	48 89 d1             	mov    %rdx,%rcx
    df4a:	48 c1 f9 3f          	sar    $0x3f,%rcx
    df4e:	48 83 c9 01          	or     $0x1,%rcx
    df52:	48 01 d1             	add    %rdx,%rcx
    df55:	48 89 e7             	mov    %rsp,%rdi
    df58:	4c 89 f6             	mov    %r14,%rsi
    df5b:	4c 89 fa             	mov    %r15,%rdx
    df5e:	e8 6d 04 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    df63:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    df67:	75 08                	jne    df71 <hyperinterval::float::F64Enclosure::next_down+0x81>
    df69:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
    df6d:	b0 01                	mov    $0x1,%al
    df6f:	eb 15                	jmp    df86 <hyperinterval::float::F64Enclosure::next_down+0x96>
    df71:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    df76:	49 31 c6             	xor    %rax,%r14
    df79:	48 85 c0             	test   %rax,%rax
    df7c:	4c 0f 44 f0          	cmove  %rax,%r14
    df80:	4c 89 73 08          	mov    %r14,0x8(%rbx)
    df84:	31 c0                	xor    %eax,%eax
    df86:	88 03                	mov    %al,(%rbx)
    df88:	48 89 d8             	mov    %rbx,%rax
    df8b:	48 83 c4 10          	add    $0x10,%rsp
    df8f:	5b                   	pop    %rbx
    df90:	41 5e                	pop    %r14
    df92:	41 5f                	pop    %r15
    df94:	c3                   	ret
    df95:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    df9c:	00 00 00 
    df9f:	90                   	nop

hyperinterval::float::F64Enclosure::next_up:
    dfa0:	41 57                	push   %r15
    dfa2:	41 56                	push   %r14
    dfa4:	53                   	push   %rbx
    dfa5:	48 83 ec 10          	sub    $0x10,%rsp
    dfa9:	48 89 fb             	mov    %rdi,%rbx
    dfac:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
    dfb3:	00 00 80 
    dfb6:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
    dfbd:	00 f0 7f 
    dfc0:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    dfc5:	48 89 e7             	mov    %rsp,%rdi
    dfc8:	4c 89 f6             	mov    %r14,%rsi
    dfcb:	4c 89 fa             	mov    %r15,%rdx
    dfce:	e8 fd 03 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    dfd3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    dfd7:	75 0c                	jne    dfe5 <hyperinterval::float::F64Enclosure::next_up+0x45>
    dfd9:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    dfde:	88 43 01             	mov    %al,0x1(%rbx)
    dfe1:	b0 01                	mov    $0x1,%al
    dfe3:	eb 3c                	jmp    e021 <hyperinterval::float::F64Enclosure::next_up+0x81>
    dfe5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    dfea:	48 89 c1             	mov    %rax,%rcx
    dfed:	48 c1 f9 3f          	sar    $0x3f,%rcx
    dff1:	48 83 c9 01          	or     $0x1,%rcx
    dff5:	48 01 c1             	add    %rax,%rcx
    dff8:	48 89 e7             	mov    %rsp,%rdi
    dffb:	4c 89 f6             	mov    %r14,%rsi
    dffe:	4c 89 fa             	mov    %r15,%rdx
    e001:	e8 ca 03 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    e006:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    e00a:	75 08                	jne    e014 <hyperinterval::float::F64Enclosure::next_up+0x74>
    e00c:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
    e010:	b0 01                	mov    $0x1,%al
    e012:	eb 0d                	jmp    e021 <hyperinterval::float::F64Enclosure::next_up+0x81>
    e014:	f3 0f 7e 44 24 08    	movq   0x8(%rsp),%xmm0
    e01a:	66 0f d6 43 08       	movq   %xmm0,0x8(%rbx)
    e01f:	31 c0                	xor    %eax,%eax
    e021:	88 03                	mov    %al,(%rbx)
    e023:	48 89 d8             	mov    %rbx,%rax
    e026:	48 83 c4 10          	add    $0x10,%rsp
    e02a:	5b                   	pop    %rbx
    e02b:	41 5e                	pop    %r14
    e02d:	41 5f                	pop    %r15
    e02f:	c3                   	ret

hyperinterval::float::F64Enclosure::expanded:
    e030:	41 57                	push   %r15
    e032:	41 56                	push   %r14
    e034:	41 55                	push   %r13
    e036:	41 54                	push   %r12
    e038:	53                   	push   %rbx
    e039:	48 83 ec 10          	sub    $0x10,%rsp
    e03d:	48 89 fb             	mov    %rdi,%rbx
    e040:	f6 06 01             	testb  $0x1,(%rsi)
    e043:	74 7f                	je     e0c4 <hyperinterval::float::F64Enclosure::expanded+0x94>
    e045:	4c 8b 66 10          	mov    0x10(%rsi),%r12
    e049:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
    e050:	00 00 80 
    e053:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
    e05a:	00 f0 7f 
    e05d:	48 8b 46 08          	mov    0x8(%rsi),%rax
    e061:	48 89 c2             	mov    %rax,%rdx
    e064:	4c 31 f2             	xor    %r14,%rdx
    e067:	48 85 c0             	test   %rax,%rax
    e06a:	48 0f 44 d0          	cmove  %rax,%rdx
    e06e:	48 89 d1             	mov    %rdx,%rcx
    e071:	48 c1 f9 3f          	sar    $0x3f,%rcx
    e075:	48 83 c9 01          	or     $0x1,%rcx
    e079:	48 01 d1             	add    %rdx,%rcx
    e07c:	48 89 e7             	mov    %rsp,%rdi
    e07f:	4c 89 f6             	mov    %r14,%rsi
    e082:	4c 89 fa             	mov    %r15,%rdx
    e085:	e8 46 03 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    e08a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    e08e:	75 27                	jne    e0b7 <hyperinterval::float::F64Enclosure::expanded+0x87>
    e090:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    e095:	4c 89 e1             	mov    %r12,%rcx
    e098:	48 c1 f9 3f          	sar    $0x3f,%rcx
    e09c:	48 83 c9 01          	or     $0x1,%rcx
    e0a0:	4c 01 e1             	add    %r12,%rcx
    e0a3:	48 89 e7             	mov    %rsp,%rdi
    e0a6:	4c 89 f6             	mov    %r14,%rsi
    e0a9:	4c 89 fa             	mov    %r15,%rdx
    e0ac:	e8 1f 03 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    e0b1:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    e0b5:	75 25                	jne    e0dc <hyperinterval::float::F64Enclosure::expanded+0xac>
    e0b7:	c6 43 08 03          	movb   $0x3,0x8(%rbx)
    e0bb:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    e0c2:	eb 07                	jmp    e0cb <hyperinterval::float::F64Enclosure::expanded+0x9b>
    e0c4:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    e0cb:	48 89 d8             	mov    %rbx,%rax
    e0ce:	48 83 c4 10          	add    $0x10,%rsp
    e0d2:	5b                   	pop    %rbx
    e0d3:	41 5c                	pop    %r12
    e0d5:	41 5d                	pop    %r13
    e0d7:	41 5e                	pop    %r14
    e0d9:	41 5f                	pop    %r15
    e0db:	c3                   	ret
    e0dc:	4c 89 e9             	mov    %r13,%rcx
    e0df:	4c 31 f1             	xor    %r14,%rcx
    e0e2:	4d 85 ed             	test   %r13,%r13
    e0e5:	49 0f 44 cd          	cmove  %r13,%rcx
    e0e9:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    e0ee:	48 89 e7             	mov    %rsp,%rdi
    e0f1:	4c 89 f6             	mov    %r14,%rsi
    e0f4:	4c 89 fa             	mov    %r15,%rdx
    e0f7:	e8 d4 02 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    e0fc:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    e100:	74 1c                	je     e11e <hyperinterval::float::F64Enclosure::expanded+0xee>
    e102:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    e107:	48 89 e7             	mov    %rsp,%rdi
    e10a:	4c 89 f6             	mov    %r14,%rsi
    e10d:	4c 89 fa             	mov    %r15,%rdx
    e110:	4c 89 e1             	mov    %r12,%rcx
    e113:	e8 b8 02 00 00       	call   e3d0 <hyperinterval::ieee::Format::finite>
    e118:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    e11c:	75 11                	jne    e12f <hyperinterval::float::F64Enclosure::expanded+0xff>
    e11e:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    e123:	88 43 08             	mov    %al,0x8(%rbx)
    e126:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    e12d:	eb 9c                	jmp    e0cb <hyperinterval::float::F64Enclosure::expanded+0x9b>
    e12f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    e134:	4c 89 e9             	mov    %r13,%rcx
    e137:	4c 09 f1             	or     %r14,%rcx
    e13a:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
    e13e:	4c 89 ee             	mov    %r13,%rsi
    e141:	48 21 d6             	and    %rdx,%rsi
    e144:	4c 89 f7             	mov    %r14,%rdi
    e147:	48 29 f7             	sub    %rsi,%rdi
    e14a:	4d 85 ed             	test   %r13,%r13
    e14d:	48 0f 49 f9          	cmovns %rcx,%rdi
    e151:	48 89 c1             	mov    %rax,%rcx
    e154:	4c 09 f1             	or     %r14,%rcx
    e157:	48 21 c2             	and    %rax,%rdx
    e15a:	49 29 d6             	sub    %rdx,%r14
    e15d:	48 85 c0             	test   %rax,%rax
    e160:	4c 0f 49 f1          	cmovns %rcx,%r14
    e164:	4c 39 f7             	cmp    %r14,%rdi
    e167:	76 10                	jbe    e179 <hyperinterval::float::F64Enclosure::expanded+0x149>
    e169:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
    e16d:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    e174:	e9 52 ff ff ff       	jmp    e0cb <hyperinterval::float::F64Enclosure::expanded+0x9b>
    e179:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
    e180:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
    e184:	48 89 43 10          	mov    %rax,0x10(%rbx)
    e188:	e9 3e ff ff ff       	jmp    e0cb <hyperinterval::float::F64Enclosure::expanded+0x9b>
    e18d:	0f 1f 00             	nopl   (%rax)

hyperinterval::bounds::Bounds<T>::hull:
    e220:	89 f8                	mov    %edi,%eax
    e222:	bf 00 00 00 80       	mov    $0x80000000,%edi
    e227:	41 89 c0             	mov    %eax,%r8d
    e22a:	41 09 f8             	or     %edi,%r8d
    e22d:	41 89 c1             	mov    %eax,%r9d
    e230:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    e237:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    e23d:	45 29 ca             	sub    %r9d,%r10d
    e240:	85 c0                	test   %eax,%eax
    e242:	4d 0f 49 d0          	cmovns %r8,%r10
    e246:	41 89 d0             	mov    %edx,%r8d
    e249:	41 09 f8             	or     %edi,%r8d
    e24c:	41 89 d1             	mov    %edx,%r9d
    e24f:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    e256:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
    e25c:	45 29 cb             	sub    %r9d,%r11d
    e25f:	85 d2                	test   %edx,%edx
    e261:	4d 0f 49 d8          	cmovns %r8,%r11
    e265:	45 39 da             	cmp    %r11d,%r10d
    e268:	0f 47 c2             	cmova  %edx,%eax
    e26b:	89 f2                	mov    %esi,%edx
    e26d:	09 fe                	or     %edi,%esi
    e26f:	41 89 d0             	mov    %edx,%r8d
    e272:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
    e279:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
    e27f:	45 29 c1             	sub    %r8d,%r9d
    e282:	85 d2                	test   %edx,%edx
    e284:	4c 0f 49 ce          	cmovns %rsi,%r9
    e288:	89 ce                	mov    %ecx,%esi
    e28a:	09 fe                	or     %edi,%esi
    e28c:	41 89 c8             	mov    %ecx,%r8d
    e28f:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
    e296:	44 29 c7             	sub    %r8d,%edi
    e299:	85 c9                	test   %ecx,%ecx
    e29b:	48 0f 49 fe          	cmovns %rsi,%rdi
    e29f:	41 39 f9             	cmp    %edi,%r9d
    e2a2:	0f 42 d1             	cmovb  %ecx,%edx
    e2a5:	c3                   	ret
    e2a6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    e2ad:	00 00 00 

hyperinterval::bounds::Bounds<T>::signs:
    e340:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    e347:	00 00 80 
    e34a:	48 89 f9             	mov    %rdi,%rcx
    e34d:	48 09 c1             	or     %rax,%rcx
    e350:	4c 8d 40 ff          	lea    -0x1(%rax),%r8
    e354:	49 89 f9             	mov    %rdi,%r9
    e357:	4d 21 c1             	and    %r8,%r9
    e35a:	49 89 c2             	mov    %rax,%r10
    e35d:	4d 29 ca             	sub    %r9,%r10
    e360:	48 85 ff             	test   %rdi,%rdi
    e363:	4c 0f 49 d1          	cmovns %rcx,%r10
    e367:	48 89 d7             	mov    %rdx,%rdi
    e36a:	48 09 c7             	or     %rax,%rdi
    e36d:	49 89 d1             	mov    %rdx,%r9
    e370:	4d 21 c1             	and    %r8,%r9
    e373:	48 89 c1             	mov    %rax,%rcx
    e376:	4c 29 c9             	sub    %r9,%rcx
    e379:	48 85 d2             	test   %rdx,%rdx
    e37c:	48 0f 49 cf          	cmovns %rdi,%rcx
    e380:	48 89 f2             	mov    %rsi,%rdx
    e383:	48 09 c2             	or     %rax,%rdx
    e386:	49 21 f0             	and    %rsi,%r8
    e389:	4c 29 c0             	sub    %r8,%rax
    e38c:	45 31 c0             	xor    %r8d,%r8d
    e38f:	49 39 ca             	cmp    %rcx,%r10
    e392:	40 0f 92 c7          	setb   %dil
    e396:	77 1c                	ja     e3b4 <hyperinterval::bounds::Bounds<T>::signs+0x74>
    e398:	48 85 f6             	test   %rsi,%rsi
    e39b:	49 89 d1             	mov    %rdx,%r9
    e39e:	4c 0f 48 c8          	cmovs  %rax,%r9
    e3a2:	44 8d 57 02          	lea    0x2(%rdi),%r10d
    e3a6:	4c 39 c9             	cmp    %r9,%rcx
    e3a9:	41 88 f8             	mov    %dil,%r8b
    e3ac:	41 0f b6 fa          	movzbl %r10b,%edi
    e3b0:	41 0f 47 f8          	cmova  %r8d,%edi
    e3b4:	48 85 f6             	test   %rsi,%rsi
    e3b7:	48 0f 48 d0          	cmovs  %rax,%rdx
    e3bb:	8d 47 04             	lea    0x4(%rdi),%eax
    e3be:	48 39 ca             	cmp    %rcx,%rdx
    e3c1:	40 0f b6 cf          	movzbl %dil,%ecx
    e3c5:	0f b6 c0             	movzbl %al,%eax
    e3c8:	0f 46 c1             	cmovbe %ecx,%eax
    e3cb:	c3                   	ret
    e3cc:	0f 1f 40 00          	nopl   0x0(%rax)

hyperinterval::ieee::Format::finite:
    e3d0:	48 89 f8             	mov    %rdi,%rax
    e3d3:	48 89 cf             	mov    %rcx,%rdi
    e3d6:	48 f7 d7             	not    %rdi
    e3d9:	48 85 fa             	test   %rdi,%rdx
    e3dc:	75 09                	jne    e3e7 <hyperinterval::ieee::Format::finite+0x17>
    e3de:	c6 40 01 00          	movb   $0x0,0x1(%rax)
    e3e2:	b1 01                	mov    $0x1,%cl
    e3e4:	88 08                	mov    %cl,(%rax)
    e3e6:	c3                   	ret
    e3e7:	48 ff ce             	dec    %rsi
    e3ea:	48 85 f1             	test   %rsi,%rcx
    e3ed:	74 09                	je     e3f8 <hyperinterval::ieee::Format::finite+0x28>
    e3ef:	48 89 48 08          	mov    %rcx,0x8(%rax)
    e3f3:	31 c9                	xor    %ecx,%ecx
    e3f5:	88 08                	mov    %cl,(%rax)
    e3f7:	c3                   	ret
    e3f8:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
    e3ff:	00 
    e400:	31 c9                	xor    %ecx,%ecx
    e402:	88 08                	mov    %cl,(%rax)
    e404:	c3                   	ret
    e405:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    e40c:	00 00 00 
    e40f:	90                   	nop

hyperinterval::ieee::Format::rounded:
    e410:	48 89 c8             	mov    %rcx,%rax
    e413:	4c 8b 11             	mov    (%rcx),%r10
    e416:	4c 8b 59 08          	mov    0x8(%rcx),%r11
    e41a:	4c 89 d1             	mov    %r10,%rcx
    e41d:	4c 09 d9             	or     %r11,%rcx
    e420:	74 79                	je     e49b <hyperinterval::ieee::Format::rounded+0x8b>
    e422:	55                   	push   %rbp
    e423:	41 57                	push   %r15
    e425:	41 56                	push   %r14
    e427:	41 55                	push   %r13
    e429:	41 54                	push   %r12
    e42b:	53                   	push   %rbx
    e42c:	8b 68 10             	mov    0x10(%rax),%ebp
    e42f:	49 0f bd cb          	bsr    %r11,%rcx
    e433:	83 f1 3f             	xor    $0x3f,%ecx
    e436:	4d 0f bd f2          	bsr    %r10,%r14
    e43a:	41 83 f6 3f          	xor    $0x3f,%r14d
    e43e:	41 83 ce 40          	or     $0x40,%r14d
    e442:	4d 85 db             	test   %r11,%r11
    e445:	44 0f 45 f1          	cmovne %ecx,%r14d
    e449:	bb 40 00 00 00       	mov    $0x40,%ebx
    e44e:	f3 48 0f bc da       	tzcnt  %rdx,%rbx
    e453:	41 89 d8             	mov    %ebx,%r8d
    e456:	41 83 e0 3f          	and    $0x3f,%r8d
    e45a:	44 89 c1             	mov    %r8d,%ecx
    e45d:	48 d3 ea             	shr    %cl,%rdx
    e460:	41 83 f6 7f          	xor    $0x7f,%r14d
    e464:	41 01 ee             	add    %ebp,%r14d
    e467:	48 d1 ea             	shr    $1,%rdx
    e46a:	41 39 d6             	cmp    %edx,%r14d
    e46d:	0f 8f 54 01 00 00    	jg     e5c7 <hyperinterval::ieee::Format::rounded+0x1b7>
    e473:	44 8d 2c 13          	lea    (%rbx,%rdx,1),%r13d
    e477:	b9 01 00 00 00       	mov    $0x1,%ecx
    e47c:	44 29 e9             	sub    %r13d,%ecx
    e47f:	41 29 de             	sub    %ebx,%r14d
    e482:	41 39 ce             	cmp    %ecx,%r14d
    e485:	44 0f 4e f1          	cmovle %ecx,%r14d
    e489:	44 89 f1             	mov    %r14d,%ecx
    e48c:	29 e9                	sub    %ebp,%ecx
    e48e:	83 f9 7f             	cmp    $0x7f,%ecx
    e491:	7e 13                	jle    e4a6 <hyperinterval::ieee::Format::rounded+0x96>
    e493:	41 b4 01             	mov    $0x1,%r12b
    e496:	e9 ea 00 00 00       	jmp    e585 <hyperinterval::ieee::Format::rounded+0x175>
    e49b:	c6 07 00             	movb   $0x0,(%rdi)
    e49e:	0f 57 c0             	xorps  %xmm0,%xmm0
    e4a1:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
    e4a5:	c3                   	ret
    e4a6:	85 c9                	test   %ecx,%ecx
    e4a8:	4c 89 6c 24 f0       	mov    %r13,-0x10(%rsp)
    e4ad:	0f 8e ad 00 00 00    	jle    e560 <hyperinterval::ieee::Format::rounded+0x150>
    e4b3:	4d 89 d7             	mov    %r10,%r15
    e4b6:	4d 0f ad df          	shrd   %cl,%r11,%r15
    e4ba:	4d 89 dd             	mov    %r11,%r13
    e4bd:	49 d3 ed             	shr    %cl,%r13
    e4c0:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
    e4c7:	49 d3 e4             	shl    %cl,%r12
    e4ca:	48 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%rbp
    e4d1:	45 31 c9             	xor    %r9d,%r9d
    e4d4:	f6 c1 40             	test   $0x40,%cl
    e4d7:	4d 0f 45 fd          	cmovne %r13,%r15
    e4db:	4d 0f 45 e9          	cmovne %r9,%r13
    e4df:	49 0f 45 ec          	cmovne %r12,%rbp
    e4e3:	4d 0f 45 e1          	cmovne %r9,%r12
    e4e7:	49 f7 d4             	not    %r12
    e4ea:	48 f7 d5             	not    %rbp
    e4ed:	4c 21 dd             	and    %r11,%rbp
    e4f0:	4d 21 d4             	and    %r10,%r12
    e4f3:	49 09 ec             	or     %rbp,%r12
    e4f6:	41 0f 95 c4          	setne  %r12b
    e4fa:	4d 89 eb             	mov    %r13,%r11
    e4fd:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
    e502:	4c 89 f9             	mov    %r15,%rcx
    e505:	4c 09 d9             	or     %r11,%rcx
    e508:	74 7b                	je     e585 <hyperinterval::ieee::Format::rounded+0x175>
    e50a:	49 0f bd cb          	bsr    %r11,%rcx
    e50e:	83 f1 3f             	xor    $0x3f,%ecx
    e511:	4d 0f bd ef          	bsr    %r15,%r13
    e515:	41 83 f5 3f          	xor    $0x3f,%r13d
    e519:	41 83 cd 40          	or     $0x40,%r13d
    e51d:	4d 85 db             	test   %r11,%r11
    e520:	44 0f 45 e9          	cmovne %ecx,%r13d
    e524:	41 83 f5 7f          	xor    $0x7f,%r13d
    e528:	43 8d 2c 2e          	lea    (%r14,%r13,1),%ebp
    e52c:	39 d5                	cmp    %edx,%ebp
    e52e:	0f 8f 93 00 00 00    	jg     e5c7 <hyperinterval::ieee::Format::rounded+0x1b7>
    e534:	b9 01 00 00 00       	mov    $0x1,%ecx
    e539:	29 d1                	sub    %edx,%ecx
    e53b:	39 cd                	cmp    %ecx,%ebp
    e53d:	0f 8d 53 01 00 00    	jge    e696 <hyperinterval::ieee::Format::rounded+0x286>
    e543:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
    e548:	43 8d 0c 2e          	lea    (%r14,%r13,1),%ecx
    e54c:	fe c9                	dec    %cl
    e54e:	4d 89 f9             	mov    %r15,%r9
    e551:	49 d3 e1             	shl    %cl,%r9
    e554:	45 31 d2             	xor    %r10d,%r10d
    e557:	f6 c1 40             	test   $0x40,%cl
    e55a:	4d 0f 44 d1          	cmove  %r9,%r10
    e55e:	eb 2e                	jmp    e58e <hyperinterval::ieee::Format::rounded+0x17e>
    e560:	f6 d9                	neg    %cl
    e562:	4d 0f a5 d3          	shld   %cl,%r10,%r11
    e566:	49 d3 e2             	shl    %cl,%r10
    e569:	45 31 e4             	xor    %r12d,%r12d
    e56c:	f6 c1 40             	test   $0x40,%cl
    e56f:	4d 0f 45 da          	cmovne %r10,%r11
    e573:	41 bf 00 00 00 00    	mov    $0x0,%r15d
    e579:	4d 0f 44 fa          	cmove  %r10,%r15
    e57d:	4c 89 f9             	mov    %r15,%rcx
    e580:	4c 09 d9             	or     %r11,%rcx
    e583:	75 85                	jne    e50a <hyperinterval::ieee::Format::rounded+0xfa>
    e585:	45 31 ff             	xor    %r15d,%r15d
    e588:	45 31 db             	xor    %r11d,%r11d
    e58b:	45 31 d2             	xor    %r10d,%r10d
    e58e:	45 0f b6 e4          	movzbl %r12b,%r12d
    e592:	4d 01 fc             	add    %r15,%r12
    e595:	49 83 d3 00          	adc    $0x0,%r11
    e599:	4c 89 e1             	mov    %r12,%rcx
    e59c:	4c 09 d9             	or     %r11,%rcx
    e59f:	74 30                	je     e5d1 <hyperinterval::ieee::Format::rounded+0x1c1>
    e5a1:	49 0f bd cb          	bsr    %r11,%rcx
    e5a5:	83 f1 3f             	xor    $0x3f,%ecx
    e5a8:	4d 0f bd fc          	bsr    %r12,%r15
    e5ac:	41 83 f7 3f          	xor    $0x3f,%r15d
    e5b0:	41 83 cf 40          	or     $0x40,%r15d
    e5b4:	4d 85 db             	test   %r11,%r11
    e5b7:	44 0f 45 f9          	cmovne %ecx,%r15d
    e5bb:	41 83 f7 7f          	xor    $0x7f,%r15d
    e5bf:	43 8d 2c 37          	lea    (%r15,%r14,1),%ebp
    e5c3:	39 d5                	cmp    %edx,%ebp
    e5c5:	7e 1b                	jle    e5e2 <hyperinterval::ieee::Format::rounded+0x1d2>
    e5c7:	66 c7 07 01 03       	movw   $0x301,(%rdi)
    e5cc:	e9 ba 00 00 00       	jmp    e68b <hyperinterval::ieee::Format::rounded+0x27b>
    e5d1:	31 d2                	xor    %edx,%edx
    e5d3:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
    e5d7:	0f 84 86 00 00 00    	je     e663 <hyperinterval::ieee::Format::rounded+0x253>
    e5dd:	e9 9e 00 00 00       	jmp    e680 <hyperinterval::ieee::Format::rounded+0x270>
    e5e2:	b9 01 00 00 00       	mov    $0x1,%ecx
    e5e7:	29 d1                	sub    %edx,%ecx
    e5e9:	39 cd                	cmp    %ecx,%ebp
    e5eb:	7d 1e                	jge    e60b <hyperinterval::ieee::Format::rounded+0x1fb>
    e5ed:	45 01 f5             	add    %r14d,%r13d
    e5f0:	41 fe cd             	dec    %r13b
    e5f3:	44 89 e9             	mov    %r13d,%ecx
    e5f6:	49 d3 e4             	shl    %cl,%r12
    e5f9:	31 d2                	xor    %edx,%edx
    e5fb:	41 f6 c5 40          	test   $0x40,%r13b
    e5ff:	49 0f 44 d4          	cmove  %r12,%rdx
    e603:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
    e607:	74 5a                	je     e663 <hyperinterval::ieee::Format::rounded+0x253>
    e609:	eb 75                	jmp    e680 <hyperinterval::ieee::Format::rounded+0x270>
    e60b:	89 d9                	mov    %ebx,%ecx
    e60d:	44 29 f9             	sub    %r15d,%ecx
    e610:	41 89 c9             	mov    %ecx,%r9d
    e613:	41 f7 d9             	neg    %r9d
    e616:	4d 89 e6             	mov    %r12,%r14
    e619:	49 d3 e6             	shl    %cl,%r14
    e61c:	45 31 ed             	xor    %r13d,%r13d
    e61f:	f6 c1 40             	test   $0x40,%cl
    e622:	4d 0f 44 ee          	cmove  %r14,%r13
    e626:	44 89 c9             	mov    %r9d,%ecx
    e629:	4d 0f ad dc          	shrd   %cl,%r11,%r12
    e62d:	49 d3 eb             	shr    %cl,%r11
    e630:	41 f6 c1 40          	test   $0x40,%r9b
    e634:	4d 0f 44 dc          	cmove  %r12,%r11
    e638:	44 39 fb             	cmp    %r15d,%ebx
    e63b:	4d 0f 43 dd          	cmovae %r13,%r11
    e63f:	01 d5                	add    %edx,%ebp
    e641:	4c 63 cd             	movslq %ebp,%r9
    e644:	44 89 c1             	mov    %r8d,%ecx
    e647:	49 d3 e1             	shl    %cl,%r9
    e64a:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    e651:	48 d3 e2             	shl    %cl,%rdx
    e654:	48 f7 d2             	not    %rdx
    e657:	4c 21 da             	and    %r11,%rdx
    e65a:	4c 09 ca             	or     %r9,%rdx
    e65d:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
    e661:	75 1d                	jne    e680 <hyperinterval::ieee::Format::rounded+0x270>
    e663:	48 89 d0             	mov    %rdx,%rax
    e666:	48 31 f0             	xor    %rsi,%rax
    e669:	48 85 d2             	test   %rdx,%rdx
    e66c:	48 0f 44 c2          	cmove  %rdx,%rax
    e670:	4c 31 d6             	xor    %r10,%rsi
    e673:	4d 85 d2             	test   %r10,%r10
    e676:	49 0f 44 f2          	cmove  %r10,%rsi
    e67a:	49 89 c2             	mov    %rax,%r10
    e67d:	48 89 f2             	mov    %rsi,%rdx
    e680:	4c 89 57 08          	mov    %r10,0x8(%rdi)
    e684:	48 89 57 10          	mov    %rdx,0x10(%rdi)
    e688:	c6 07 00             	movb   $0x0,(%rdi)
    e68b:	5b                   	pop    %rbx
    e68c:	41 5c                	pop    %r12
    e68e:	41 5d                	pop    %r13
    e690:	41 5e                	pop    %r14
    e692:	41 5f                	pop    %r15
    e694:	5d                   	pop    %rbp
    e695:	c3                   	ret
    e696:	89 d9                	mov    %ebx,%ecx
    e698:	44 29 e9             	sub    %r13d,%ecx
    e69b:	4d 89 f9             	mov    %r15,%r9
    e69e:	49 d3 e1             	shl    %cl,%r9
    e6a1:	41 89 ca             	mov    %ecx,%r10d
    e6a4:	41 f7 da             	neg    %r10d
    e6a7:	48 c7 44 24 e8 00 00 	movq   $0x0,-0x18(%rsp)
    e6ae:	00 00 
    e6b0:	f6 c1 40             	test   $0x40,%cl
    e6b3:	48 8b 4c 24 e8       	mov    -0x18(%rsp),%rcx
    e6b8:	49 0f 44 c9          	cmove  %r9,%rcx
    e6bc:	48 89 4c 24 e8       	mov    %rcx,-0x18(%rsp)
    e6c1:	4d 89 f9             	mov    %r15,%r9
    e6c4:	44 89 d1             	mov    %r10d,%ecx
    e6c7:	4d 0f ad d9          	shrd   %cl,%r11,%r9
    e6cb:	4c 89 4c 24 f8       	mov    %r9,-0x8(%rsp)
    e6d0:	4d 89 d9             	mov    %r11,%r9
    e6d3:	49 d3 e9             	shr    %cl,%r9
    e6d6:	41 f6 c2 40          	test   $0x40,%r10b
    e6da:	4c 0f 44 4c 24 f8    	cmove  -0x8(%rsp),%r9
    e6e0:	44 39 eb             	cmp    %r13d,%ebx
    e6e3:	4c 0f 43 4c 24 e8    	cmovae -0x18(%rsp),%r9
    e6e9:	01 d5                	add    %edx,%ebp
    e6eb:	4c 63 ed             	movslq %ebp,%r13
    e6ee:	44 89 c1             	mov    %r8d,%ecx
    e6f1:	49 d3 e5             	shl    %cl,%r13
    e6f4:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
    e6fb:	49 d3 e2             	shl    %cl,%r10
    e6fe:	49 f7 d2             	not    %r10
    e701:	4d 21 ca             	and    %r9,%r10
    e704:	4d 09 ea             	or     %r13,%r10
    e707:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
    e70c:	e9 7d fe ff ff       	jmp    e58e <hyperinterval::ieee::Format::rounded+0x17e>
    e711:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    e718:	00 00 00 
    e71b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

hyperinterval::ieee::Format::add:
    e720:	55                   	push   %rbp
    e721:	41 57                	push   %r15
    e723:	41 56                	push   %r14
    e725:	41 55                	push   %r13
    e727:	41 54                	push   %r12
    e729:	53                   	push   %rbx
    e72a:	48 83 ec 38          	sub    $0x38,%rsp
    e72e:	48 89 fb             	mov    %rdi,%rbx
    e731:	48 85 c9             	test   %rcx,%rcx
    e734:	0f 84 6a 01 00 00    	je     e8a4 <hyperinterval::ieee::Format::add+0x184>
    e73a:	48 89 c8             	mov    %rcx,%rax
    e73d:	4d 85 c0             	test   %r8,%r8
    e740:	0f 84 68 01 00 00    	je     e8ae <hyperinterval::ieee::Format::add+0x18e>
    e746:	41 b9 40 00 00 00    	mov    $0x40,%r9d
    e74c:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
    e751:	49 89 c2             	mov    %rax,%r10
    e754:	49 21 d2             	and    %rdx,%r10
    e757:	44 89 c9             	mov    %r9d,%ecx
    e75a:	49 d3 ea             	shr    %cl,%r10
    e75d:	41 bb 01 00 00 00    	mov    $0x1,%r11d
    e763:	49 d3 e3             	shl    %cl,%r11
    e766:	4d 8d 63 ff          	lea    -0x1(%r11),%r12
    e76a:	4d 89 e6             	mov    %r12,%r14
    e76d:	49 21 c6             	and    %rax,%r14
    e770:	4d 85 d2             	test   %r10,%r10
    e773:	bf 01 00 00 00       	mov    $0x1,%edi
    e778:	44 89 d5             	mov    %r10d,%ebp
    e77b:	0f 44 ef             	cmove  %edi,%ebp
    e77e:	4d 0f 45 d3          	cmovne %r11,%r10
    e782:	49 89 d7             	mov    %rdx,%r15
    e785:	49 d3 ef             	shr    %cl,%r15
    e788:	4d 09 f2             	or     %r14,%r10
    e78b:	49 d1 ef             	shr    $1,%r15
    e78e:	45 01 cf             	add    %r9d,%r15d
    e791:	48 85 f0             	test   %rsi,%rax
    e794:	0f 95 44 24 0f       	setne  0xf(%rsp)
    e799:	b9 7f 00 00 00       	mov    $0x7f,%ecx
    e79e:	49 0f bd ca          	bsr    %r10,%rcx
    e7a2:	83 f1 3f             	xor    $0x3f,%ecx
    e7a5:	44 01 c9             	add    %r9d,%ecx
    e7a8:	83 c1 c1             	add    $0xffffffc1,%ecx
    e7ab:	45 31 ed             	xor    %r13d,%r13d
    e7ae:	4d 0f a5 d5          	shld   %cl,%r10,%r13
    e7b2:	45 31 f6             	xor    %r14d,%r14d
    e7b5:	49 d3 e2             	shl    %cl,%r10
    e7b8:	f6 c1 40             	test   $0x40,%cl
    e7bb:	4d 0f 45 ea          	cmovne %r10,%r13
    e7bf:	4d 0f 45 d6          	cmovne %r14,%r10
    e7c3:	44 01 f9             	add    %r15d,%ecx
    e7c6:	29 cd                	sub    %ecx,%ebp
    e7c8:	4d 89 c6             	mov    %r8,%r14
    e7cb:	49 21 d6             	and    %rdx,%r14
    e7ce:	44 89 c9             	mov    %r9d,%ecx
    e7d1:	49 d3 ee             	shr    %cl,%r14
    e7d4:	4d 21 c4             	and    %r8,%r12
    e7d7:	4d 85 f6             	test   %r14,%r14
    e7da:	41 0f 45 fe          	cmovne %r14d,%edi
    e7de:	4d 0f 45 f3          	cmovne %r11,%r14
    e7e2:	b9 7f 00 00 00       	mov    $0x7f,%ecx
    e7e7:	4d 09 e6             	or     %r12,%r14
    e7ea:	49 85 f0             	test   %rsi,%r8
    e7ed:	41 0f 95 c3          	setne  %r11b
    e7f1:	49 0f bd ce          	bsr    %r14,%rcx
    e7f5:	83 f1 3f             	xor    $0x3f,%ecx
    e7f8:	44 01 c9             	add    %r9d,%ecx
    e7fb:	83 c1 c1             	add    $0xffffffc1,%ecx
    e7fe:	45 31 c9             	xor    %r9d,%r9d
    e801:	4d 0f a5 f1          	shld   %cl,%r14,%r9
    e805:	49 d3 e6             	shl    %cl,%r14
    e808:	f6 c1 40             	test   $0x40,%cl
    e80b:	4d 0f 45 ce          	cmovne %r14,%r9
    e80f:	41 bc 00 00 00 00    	mov    $0x0,%r12d
    e815:	4d 0f 45 f4          	cmovne %r12,%r14
    e819:	41 01 cf             	add    %ecx,%r15d
    e81c:	44 29 ff             	sub    %r15d,%edi
    e81f:	39 fd                	cmp    %edi,%ebp
    e821:	0f 8d 97 00 00 00    	jge    e8be <hyperinterval::ieee::Format::add+0x19e>
    e827:	44 88 5c 24 0e       	mov    %r11b,0xe(%rsp)
    e82c:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
    e831:	88 4c 24 0d          	mov    %cl,0xd(%rsp)
    e835:	41 89 ef             	mov    %ebp,%r15d
    e838:	4d 89 d3             	mov    %r10,%r11
    e83b:	4d 89 ec             	mov    %r13,%r12
    e83e:	4d 89 c5             	mov    %r8,%r13
    e841:	44 29 ff             	sub    %r15d,%edi
    e844:	83 ff 4a             	cmp    $0x4a,%edi
    e847:	0f 8f 9f 00 00 00    	jg     e8ec <hyperinterval::ieee::Format::add+0x1cc>
    e84d:	49 85 f0             	test   %rsi,%r8
    e850:	41 0f 95 c0          	setne  %r8b
    e854:	48 85 f0             	test   %rsi,%rax
    e857:	41 0f 95 c2          	setne  %r10b
    e85b:	89 f9                	mov    %edi,%ecx
    e85d:	4d 0f a5 f1          	shld   %cl,%r14,%r9
    e861:	49 d3 e6             	shl    %cl,%r14
    e864:	31 c0                	xor    %eax,%eax
    e866:	40 f6 c7 40          	test   $0x40,%dil
    e86a:	4d 0f 45 ce          	cmovne %r14,%r9
    e86e:	49 0f 44 c6          	cmove  %r14,%rax
    e872:	45 30 c2             	xor    %r8b,%r10b
    e875:	0f 84 c3 00 00 00    	je     e93e <hyperinterval::ieee::Format::add+0x21e>
    e87b:	4c 39 d8             	cmp    %r11,%rax
    e87e:	4c 89 c9             	mov    %r9,%rcx
    e881:	4c 19 e1             	sbb    %r12,%rcx
    e884:	0f 83 e9 00 00 00    	jae    e973 <hyperinterval::ieee::Format::add+0x253>
    e88a:	49 29 c3             	sub    %rax,%r11
    e88d:	4d 19 cc             	sbb    %r9,%r12
    e890:	0f b6 44 24 0d       	movzbl 0xd(%rsp),%eax
    e895:	88 44 24 0e          	mov    %al,0xe(%rsp)
    e899:	4c 89 d8             	mov    %r11,%rax
    e89c:	4d 89 e1             	mov    %r12,%r9
    e89f:	e9 d5 00 00 00       	jmp    e979 <hyperinterval::ieee::Format::add+0x259>
    e8a4:	4c 89 43 08          	mov    %r8,0x8(%rbx)
    e8a8:	4c 89 43 10          	mov    %r8,0x10(%rbx)
    e8ac:	eb 08                	jmp    e8b6 <hyperinterval::ieee::Format::add+0x196>
    e8ae:	48 89 43 08          	mov    %rax,0x8(%rbx)
    e8b2:	48 89 43 10          	mov    %rax,0x10(%rbx)
    e8b6:	c6 03 00             	movb   $0x0,(%rbx)
    e8b9:	e9 e0 00 00 00       	jmp    e99e <hyperinterval::ieee::Format::add+0x27e>
    e8be:	44 88 5c 24 0d       	mov    %r11b,0xd(%rsp)
    e8c3:	41 89 ff             	mov    %edi,%r15d
    e8c6:	4d 89 f3             	mov    %r14,%r11
    e8c9:	4d 89 cc             	mov    %r9,%r12
    e8cc:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
    e8d1:	88 4c 24 0e          	mov    %cl,0xe(%rsp)
    e8d5:	89 ef                	mov    %ebp,%edi
    e8d7:	4d 89 d6             	mov    %r10,%r14
    e8da:	4d 89 e9             	mov    %r13,%r9
    e8dd:	49 89 c5             	mov    %rax,%r13
    e8e0:	44 29 ff             	sub    %r15d,%edi
    e8e3:	83 ff 4a             	cmp    $0x4a,%edi
    e8e6:	0f 8e 61 ff ff ff    	jle    e84d <hyperinterval::ieee::Format::add+0x12d>
    e8ec:	80 7c 24 0d 00       	cmpb   $0x0,0xd(%rsp)
    e8f1:	74 53                	je     e946 <hyperinterval::ieee::Format::add+0x226>
    e8f3:	4c 89 e8             	mov    %r13,%rax
    e8f6:	48 31 f0             	xor    %rsi,%rax
    e8f9:	48 89 c7             	mov    %rax,%rdi
    e8fc:	48 21 f7             	and    %rsi,%rdi
    e8ff:	31 c9                	xor    %ecx,%ecx
    e901:	48 f7 df             	neg    %rdi
    e904:	48 19 c9             	sbb    %rcx,%rcx
    e907:	48 83 c9 01          	or     $0x1,%rcx
    e90b:	48 01 c1             	add    %rax,%rcx
    e90e:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    e913:	49 89 f6             	mov    %rsi,%r14
    e916:	e8 b5 fa ff ff       	call   e3d0 <hyperinterval::ieee::Format::finite>
    e91b:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
    e920:	75 4a                	jne    e96c <hyperinterval::ieee::Format::add+0x24c>
    e922:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    e927:	49 31 c6             	xor    %rax,%r14
    e92a:	48 85 c0             	test   %rax,%rax
    e92d:	4c 0f 44 f0          	cmove  %rax,%r14
    e931:	4c 89 73 08          	mov    %r14,0x8(%rbx)
    e935:	4c 89 6b 10          	mov    %r13,0x10(%rbx)
    e939:	e9 78 ff ff ff       	jmp    e8b6 <hyperinterval::ieee::Format::add+0x196>
    e93e:	4c 01 d8             	add    %r11,%rax
    e941:	4d 11 e1             	adc    %r12,%r9
    e944:	eb 33                	jmp    e979 <hyperinterval::ieee::Format::add+0x259>
    e946:	4c 89 e8             	mov    %r13,%rax
    e949:	48 21 f0             	and    %rsi,%rax
    e94c:	31 c9                	xor    %ecx,%ecx
    e94e:	48 f7 d8             	neg    %rax
    e951:	48 19 c9             	sbb    %rcx,%rcx
    e954:	48 83 c9 01          	or     $0x1,%rcx
    e958:	4c 01 e9             	add    %r13,%rcx
    e95b:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    e960:	e8 6b fa ff ff       	call   e3d0 <hyperinterval::ieee::Format::finite>
    e965:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
    e96a:	74 44                	je     e9b0 <hyperinterval::ieee::Format::add+0x290>
    e96c:	66 c7 03 01 03       	movw   $0x301,(%rbx)
    e971:	eb 2b                	jmp    e99e <hyperinterval::ieee::Format::add+0x27e>
    e973:	4c 29 d8             	sub    %r11,%rax
    e976:	4d 19 e1             	sbb    %r12,%r9
    e979:	0f b6 4c 24 0e       	movzbl 0xe(%rsp),%ecx
    e97e:	88 4c 24 24          	mov    %cl,0x24(%rsp)
    e982:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
    e987:	4c 89 4c 24 18       	mov    %r9,0x18(%rsp)
    e98c:	44 89 7c 24 20       	mov    %r15d,0x20(%rsp)
    e991:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
    e996:	48 89 df             	mov    %rbx,%rdi
    e999:	e8 72 fa ff ff       	call   e410 <hyperinterval::ieee::Format::rounded>
    e99e:	48 89 d8             	mov    %rbx,%rax
    e9a1:	48 83 c4 38          	add    $0x38,%rsp
    e9a5:	5b                   	pop    %rbx
    e9a6:	41 5c                	pop    %r12
    e9a8:	41 5d                	pop    %r13
    e9aa:	41 5e                	pop    %r14
    e9ac:	41 5f                	pop    %r15
    e9ae:	5d                   	pop    %rbp
    e9af:	c3                   	ret
    e9b0:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    e9b5:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
    e9b9:	e9 f4 fe ff ff       	jmp    e8b2 <hyperinterval::ieee::Format::add+0x192>
    e9be:	66 90                	xchg   %ax,%ax

hyperinterval::ieee::Format::affine:
    e9c0:	55                   	push   %rbp
    e9c1:	41 57                	push   %r15
    e9c3:	41 56                	push   %r14
    e9c5:	41 55                	push   %r13
    e9c7:	41 54                	push   %r12
    e9c9:	53                   	push   %rbx
    e9ca:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
    e9d1:	48 89 c8             	mov    %rcx,%rax
    e9d4:	49 89 d6             	mov    %rdx,%r14
    e9d7:	b9 40 00 00 00       	mov    $0x40,%ecx
    e9dc:	f3 48 0f bc ca       	tzcnt  %rdx,%rcx
    e9e1:	48 89 c2             	mov    %rax,%rdx
    e9e4:	4c 21 f2             	and    %r14,%rdx
    e9e7:	48 d3 ea             	shr    %cl,%rdx
    e9ea:	41 bb 01 00 00 00    	mov    $0x1,%r11d
    e9f0:	49 d3 e3             	shl    %cl,%r11
    e9f3:	4d 8d 7b ff          	lea    -0x1(%r11),%r15
    e9f7:	4c 89 fb             	mov    %r15,%rbx
    e9fa:	48 21 c3             	and    %rax,%rbx
    e9fd:	48 85 d2             	test   %rdx,%rdx
    ea00:	41 ba 01 00 00 00    	mov    $0x1,%r10d
    ea06:	89 d5                	mov    %edx,%ebp
    ea08:	41 0f 44 ea          	cmove  %r10d,%ebp
    ea0c:	48 89 3c 24          	mov    %rdi,(%rsp)
    ea10:	49 0f 45 d3          	cmovne %r11,%rdx
    ea14:	4d 89 f5             	mov    %r14,%r13
    ea17:	49 d3 ed             	shr    %cl,%r13
    ea1a:	48 09 da             	or     %rbx,%rdx
    ea1d:	49 d1 ed             	shr    $1,%r13
    ea20:	41 01 cd             	add    %ecx,%r13d
    ea23:	44 29 ed             	sub    %r13d,%ebp
    ea26:	48 85 f0             	test   %rsi,%rax
    ea29:	0f 95 c3             	setne  %bl
    ea2c:	4c 89 c0             	mov    %r8,%rax
    ea2f:	4c 21 f0             	and    %r14,%rax
    ea32:	48 d3 e8             	shr    %cl,%rax
    ea35:	4d 89 fc             	mov    %r15,%r12
    ea38:	4d 21 c4             	and    %r8,%r12
    ea3b:	48 85 c0             	test   %rax,%rax
    ea3e:	89 c7                	mov    %eax,%edi
    ea40:	41 0f 44 fa          	cmove  %r10d,%edi
    ea44:	49 0f 45 c3          	cmovne %r11,%rax
    ea48:	4c 09 e0             	or     %r12,%rax
    ea4b:	44 29 ef             	sub    %r13d,%edi
    ea4e:	49 85 f0             	test   %rsi,%r8
    ea51:	41 0f 95 c0          	setne  %r8b
    ea55:	01 ef                	add    %ebp,%edi
    ea57:	4c 89 f5             	mov    %r14,%rbp
    ea5a:	4d 89 cc             	mov    %r9,%r12
    ea5d:	4d 21 f4             	and    %r14,%r12
    ea60:	49 d3 ec             	shr    %cl,%r12
    ea63:	41 30 d8             	xor    %bl,%r8b
    ea66:	48 f7 e2             	mul    %rdx
    ea69:	4d 21 cf             	and    %r9,%r15
    ea6c:	4d 85 e4             	test   %r12,%r12
    ea6f:	45 0f 45 d4          	cmovne %r12d,%r10d
    ea73:	4d 0f 45 e3          	cmovne %r11,%r12
    ea77:	4d 09 fc             	or     %r15,%r12
    ea7a:	45 29 ea             	sub    %r13d,%r10d
    ea7d:	49 85 f1             	test   %rsi,%r9
    ea80:	0f 95 84 24 84 00 00 	setne  0x84(%rsp)
    ea87:	00 
    ea88:	0f 95 c3             	setne  %bl
    ea8b:	48 89 c1             	mov    %rax,%rcx
    ea8e:	48 09 d1             	or     %rdx,%rcx
    ea91:	44 88 44 24 64       	mov    %r8b,0x64(%rsp)
    ea96:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
    ea9b:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
    eaa0:	89 7c 24 60          	mov    %edi,0x60(%rsp)
    eaa4:	4c 89 64 24 70       	mov    %r12,0x70(%rsp)
    eaa9:	48 c7 44 24 78 00 00 	movq   $0x0,0x78(%rsp)
    eab0:	00 00 
    eab2:	44 89 94 24 80 00 00 	mov    %r10d,0x80(%rsp)
    eab9:	00 
    eaba:	74 79                	je     eb35 <hyperinterval::ieee::Format::affine+0x175>
    eabc:	4d 85 e4             	test   %r12,%r12
    eabf:	74 7b                	je     eb3c <hyperinterval::ieee::Format::affine+0x17c>
    eac1:	48 89 6c 24 30       	mov    %rbp,0x30(%rsp)
    eac6:	48 0f bd ca          	bsr    %rdx,%rcx
    eaca:	83 f1 3f             	xor    $0x3f,%ecx
    eacd:	4c 0f bd d8          	bsr    %rax,%r11
    ead1:	41 83 f3 3f          	xor    $0x3f,%r11d
    ead5:	41 83 cb 40          	or     $0x40,%r11d
    ead9:	48 85 d2             	test   %rdx,%rdx
    eadc:	44 0f 45 d9          	cmovne %ecx,%r11d
    eae0:	41 83 f3 7f          	xor    $0x7f,%r11d
    eae4:	41 01 fb             	add    %edi,%r11d
    eae7:	4d 0f bd fc          	bsr    %r12,%r15
    eaeb:	41 83 f7 3f          	xor    $0x3f,%r15d
    eaef:	41 83 cf 40          	or     $0x40,%r15d
    eaf3:	41 83 f7 7f          	xor    $0x7f,%r15d
    eaf7:	45 01 d7             	add    %r10d,%r15d
    eafa:	45 39 df             	cmp    %r11d,%r15d
    eafd:	45 0f 4e fb          	cmovle %r11d,%r15d
    eb01:	41 83 c7 82          	add    $0xffffff82,%r15d
    eb05:	44 29 ff             	sub    %r15d,%edi
    eb08:	78 4b                	js     eb55 <hyperinterval::ieee::Format::affine+0x195>
    eb0a:	89 f9                	mov    %edi,%ecx
    eb0c:	48 0f a5 c2          	shld   %cl,%rax,%rdx
    eb10:	48 d3 e0             	shl    %cl,%rax
    eb13:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    eb1a:	00 00 
    eb1c:	40 f6 c7 40          	test   $0x40,%dil
    eb20:	48 0f 45 d0          	cmovne %rax,%rdx
    eb24:	bd 00 00 00 00       	mov    $0x0,%ebp
    eb29:	48 0f 44 e8          	cmove  %rax,%rbp
    eb2d:	49 89 d3             	mov    %rdx,%r11
    eb30:	e9 9b 00 00 00       	jmp    ebd0 <hyperinterval::ieee::Format::affine+0x210>
    eb35:	48 8d 4c 24 70       	lea    0x70(%rsp),%rcx
    eb3a:	eb 05                	jmp    eb41 <hyperinterval::ieee::Format::affine+0x181>
    eb3c:	48 8d 4c 24 50       	lea    0x50(%rsp),%rcx
    eb41:	4c 8b 34 24          	mov    (%rsp),%r14
    eb45:	4c 89 f7             	mov    %r14,%rdi
    eb48:	48 89 ea             	mov    %rbp,%rdx
    eb4b:	e8 c0 f8 ff ff       	call   e410 <hyperinterval::ieee::Format::rounded>
    eb50:	e9 3f 02 00 00       	jmp    ed94 <hyperinterval::ieee::Format::affine+0x3d4>
    eb55:	f7 df                	neg    %edi
    eb57:	bd 00 00 00 00       	mov    $0x0,%ebp
    eb5c:	41 bb 00 00 00 00    	mov    $0x0,%r11d
    eb62:	83 ff 7f             	cmp    $0x7f,%edi
    eb65:	7f 5b                	jg     ebc2 <hyperinterval::ieee::Format::affine+0x202>
    eb67:	48 89 c5             	mov    %rax,%rbp
    eb6a:	89 f9                	mov    %edi,%ecx
    eb6c:	48 0f ad d5          	shrd   %cl,%rdx,%rbp
    eb70:	49 89 d3             	mov    %rdx,%r11
    eb73:	49 d3 eb             	shr    %cl,%r11
    eb76:	41 89 dd             	mov    %ebx,%r13d
    eb79:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
    eb80:	48 d3 e3             	shl    %cl,%rbx
    eb83:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    eb8a:	40 f6 c7 40          	test   $0x40,%dil
    eb8e:	49 0f 45 eb          	cmovne %r11,%rbp
    eb92:	41 be 00 00 00 00    	mov    $0x0,%r14d
    eb98:	4d 0f 45 de          	cmovne %r14,%r11
    eb9c:	48 0f 45 cb          	cmovne %rbx,%rcx
    eba0:	bf 00 00 00 00       	mov    $0x0,%edi
    eba5:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
    ebaa:	49 0f 45 de          	cmovne %r14,%rbx
    ebae:	48 f7 d3             	not    %rbx
    ebb1:	48 f7 d1             	not    %rcx
    ebb4:	48 21 d1             	and    %rdx,%rcx
    ebb7:	48 21 c3             	and    %rax,%rbx
    ebba:	48 09 cb             	or     %rcx,%rbx
    ebbd:	44 89 eb             	mov    %r13d,%ebx
    ebc0:	74 0e                	je     ebd0 <hyperinterval::ieee::Format::affine+0x210>
    ebc2:	41 0f b6 c0          	movzbl %r8b,%eax
    ebc6:	f7 d8                	neg    %eax
    ebc8:	83 c8 01             	or     $0x1,%eax
    ebcb:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    ebd0:	45 29 fa             	sub    %r15d,%r10d
    ebd3:	78 20                	js     ebf5 <hyperinterval::ieee::Format::affine+0x235>
    ebd5:	31 d2                	xor    %edx,%edx
    ebd7:	44 89 d1             	mov    %r10d,%ecx
    ebda:	4c 0f a5 e2          	shld   %cl,%r12,%rdx
    ebde:	49 d3 e4             	shl    %cl,%r12
    ebe1:	45 31 ed             	xor    %r13d,%r13d
    ebe4:	41 f6 c2 40          	test   $0x40,%r10b
    ebe8:	49 0f 45 d4          	cmovne %r12,%rdx
    ebec:	4d 0f 45 e5          	cmovne %r13,%r12
    ebf0:	4c 89 e0             	mov    %r12,%rax
    ebf3:	eb 54                	jmp    ec49 <hyperinterval::ieee::Format::affine+0x289>
    ebf5:	41 f7 da             	neg    %r10d
    ebf8:	45 31 ed             	xor    %r13d,%r13d
    ebfb:	b8 00 00 00 00       	mov    $0x0,%eax
    ec00:	41 83 fa 7f          	cmp    $0x7f,%r10d
    ec04:	7f 2d                	jg     ec33 <hyperinterval::ieee::Format::affine+0x273>
    ec06:	4c 89 e0             	mov    %r12,%rax
    ec09:	44 89 d1             	mov    %r10d,%ecx
    ec0c:	4c 0f ad e8          	shrd   %cl,%r13,%rax
    ec10:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
    ec17:	48 d3 e7             	shl    %cl,%rdi
    ec1a:	41 f6 c2 40          	test   $0x40,%r10b
    ec1e:	49 0f 45 c5          	cmovne %r13,%rax
    ec22:	49 0f 45 fd          	cmovne %r13,%rdi
    ec26:	48 f7 d7             	not    %rdi
    ec29:	ba 00 00 00 00       	mov    $0x0,%edx
    ec2e:	4c 85 e7             	test   %r12,%rdi
    ec31:	74 16                	je     ec49 <hyperinterval::ieee::Format::affine+0x289>
    ec33:	4c 89 ea             	mov    %r13,%rdx
    ec36:	4c 89 c9             	mov    %r9,%rcx
    ec39:	48 21 f1             	and    %rsi,%rcx
    ec3c:	45 31 ed             	xor    %r13d,%r13d
    ec3f:	48 f7 d9             	neg    %rcx
    ec42:	45 19 ed             	sbb    %r13d,%r13d
    ec45:	41 83 cd 01          	or     $0x1,%r13d
    ec49:	49 85 f1             	test   %rsi,%r9
    ec4c:	0f 95 c1             	setne  %cl
    ec4f:	41 38 c8             	cmp    %cl,%r8b
    ec52:	74 16                	je     ec6a <hyperinterval::ieee::Format::affine+0x2aa>
    ec54:	48 39 c5             	cmp    %rax,%rbp
    ec57:	4c 89 d9             	mov    %r11,%rcx
    ec5a:	48 19 d1             	sbb    %rdx,%rcx
    ec5d:	73 13                	jae    ec72 <hyperinterval::ieee::Format::affine+0x2b2>
    ec5f:	48 29 e8             	sub    %rbp,%rax
    ec62:	4c 19 da             	sbb    %r11,%rdx
    ec65:	41 89 d8             	mov    %ebx,%r8d
    ec68:	eb 14                	jmp    ec7e <hyperinterval::ieee::Format::affine+0x2be>
    ec6a:	48 01 e8             	add    %rbp,%rax
    ec6d:	4c 11 da             	adc    %r11,%rdx
    ec70:	eb 0c                	jmp    ec7e <hyperinterval::ieee::Format::affine+0x2be>
    ec72:	48 29 c5             	sub    %rax,%rbp
    ec75:	49 19 d3             	sbb    %rdx,%r11
    ec78:	48 89 e8             	mov    %rbp,%rax
    ec7b:	4c 89 da             	mov    %r11,%rdx
    ec7e:	44 88 44 24 24       	mov    %r8b,0x24(%rsp)
    ec83:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
    ec88:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
    ec8d:	44 89 7c 24 20       	mov    %r15d,0x20(%rsp)
    ec92:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
    ec97:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
    ec9c:	49 89 f4             	mov    %rsi,%r12
    ec9f:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
    eca4:	48 89 da             	mov    %rbx,%rdx
    eca7:	e8 64 f7 ff ff       	call   e410 <hyperinterval::ieee::Format::rounded>
    ecac:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
    ecb1:	75 16                	jne    ecc9 <hyperinterval::ieee::Format::affine+0x309>
    ecb3:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
    ecb8:	4c 8b 34 24          	mov    (%rsp),%r14
    ecbc:	41 88 46 01          	mov    %al,0x1(%r14)
    ecc0:	41 c6 06 01          	movb   $0x1,(%r14)
    ecc4:	e9 cb 00 00 00       	jmp    ed94 <hyperinterval::ieee::Format::affine+0x3d4>
    ecc9:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
    ecce:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
    ecd3:	49 39 c7             	cmp    %rax,%r15
    ecd6:	0f 85 a8 00 00 00    	jne    ed84 <hyperinterval::ieee::Format::affine+0x3c4>
    ecdc:	44 03 6c 24 08       	add    0x8(%rsp),%r13d
    ece1:	41 83 fd 01          	cmp    $0x1,%r13d
    ece5:	74 60                	je     ed47 <hyperinterval::ieee::Format::affine+0x387>
    ece7:	41 83 fd ff          	cmp    $0xffffffff,%r13d
    eceb:	0f 85 93 00 00 00    	jne    ed84 <hyperinterval::ieee::Format::affine+0x3c4>
    ecf1:	4c 89 f8             	mov    %r15,%rax
    ecf4:	4c 89 e6             	mov    %r12,%rsi
    ecf7:	4c 31 e0             	xor    %r12,%rax
    ecfa:	4d 85 ff             	test   %r15,%r15
    ecfd:	49 0f 44 c7          	cmove  %r15,%rax
    ed01:	48 89 c2             	mov    %rax,%rdx
    ed04:	4c 21 e2             	and    %r12,%rdx
    ed07:	31 c9                	xor    %ecx,%ecx
    ed09:	48 f7 da             	neg    %rdx
    ed0c:	48 19 c9             	sbb    %rcx,%rcx
    ed0f:	48 83 c9 01          	or     $0x1,%rcx
    ed13:	48 01 c1             	add    %rax,%rcx
    ed16:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    ed1b:	48 89 da             	mov    %rbx,%rdx
    ed1e:	e8 ad f6 ff ff       	call   e3d0 <hyperinterval::ieee::Format::finite>
    ed23:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
    ed28:	75 49                	jne    ed73 <hyperinterval::ieee::Format::affine+0x3b3>
    ed2a:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    ed2f:	49 31 c4             	xor    %rax,%r12
    ed32:	48 85 c0             	test   %rax,%rax
    ed35:	4c 0f 44 e0          	cmove  %rax,%r12
    ed39:	4c 8b 34 24          	mov    (%rsp),%r14
    ed3d:	4d 89 66 08          	mov    %r12,0x8(%r14)
    ed41:	4d 89 7e 10          	mov    %r15,0x10(%r14)
    ed45:	eb 49                	jmp    ed90 <hyperinterval::ieee::Format::affine+0x3d0>
    ed47:	4c 89 e6             	mov    %r12,%rsi
    ed4a:	4c 89 f8             	mov    %r15,%rax
    ed4d:	4c 21 e0             	and    %r12,%rax
    ed50:	31 c9                	xor    %ecx,%ecx
    ed52:	48 f7 d8             	neg    %rax
    ed55:	48 19 c9             	sbb    %rcx,%rcx
    ed58:	48 83 c9 01          	or     $0x1,%rcx
    ed5c:	4c 01 f9             	add    %r15,%rcx
    ed5f:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    ed64:	48 89 da             	mov    %rbx,%rdx
    ed67:	e8 64 f6 ff ff       	call   e3d0 <hyperinterval::ieee::Format::finite>
    ed6c:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
    ed71:	74 0c                	je     ed7f <hyperinterval::ieee::Format::affine+0x3bf>
    ed73:	4c 8b 34 24          	mov    (%rsp),%r14
    ed77:	66 41 c7 06 01 03    	movw   $0x301,(%r14)
    ed7d:	eb 15                	jmp    ed94 <hyperinterval::ieee::Format::affine+0x3d4>
    ed7f:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    ed84:	4c 8b 34 24          	mov    (%rsp),%r14
    ed88:	4d 89 7e 08          	mov    %r15,0x8(%r14)
    ed8c:	49 89 46 10          	mov    %rax,0x10(%r14)
    ed90:	41 c6 06 00          	movb   $0x0,(%r14)
    ed94:	4c 89 f0             	mov    %r14,%rax
    ed97:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
    ed9e:	5b                   	pop    %rbx
    ed9f:	41 5c                	pop    %r12
    eda1:	41 5d                	pop    %r13
    eda3:	41 5e                	pop    %r14
    eda5:	41 5f                	pop    %r15
    eda7:	5d                   	pop    %rbp
    eda8:	c3                   	ret
    eda9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

hyperinterval::ieee::Format::div:
    edb0:	55                   	push   %rbp
    edb1:	41 57                	push   %r15
    edb3:	41 56                	push   %r14
    edb5:	41 55                	push   %r13
    edb7:	41 54                	push   %r12
    edb9:	53                   	push   %rbx
    edba:	48 83 ec 48          	sub    $0x48,%rsp
    edbe:	4d 85 c0             	test   %r8,%r8
    edc1:	0f 84 cb 00 00 00    	je     ee92 <hyperinterval::ieee::Format::div+0xe2>
    edc7:	48 85 c9             	test   %rcx,%rcx
    edca:	0f 84 cc 00 00 00    	je     ee9c <hyperinterval::ieee::Format::div+0xec>
    edd0:	41 be 40 00 00 00    	mov    $0x40,%r14d
    edd6:	f3 4c 0f bc f2       	tzcnt  %rdx,%r14
    eddb:	49 89 cd             	mov    %rcx,%r13
    edde:	49 21 d5             	and    %rdx,%r13
    ede1:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
    ede6:	41 83 e6 3f          	and    $0x3f,%r14d
    edea:	48 89 c8             	mov    %rcx,%rax
    eded:	44 89 f1             	mov    %r14d,%ecx
    edf0:	49 d3 ed             	shr    %cl,%r13
    edf3:	41 ba 01 00 00 00    	mov    $0x1,%r10d
    edf9:	49 d3 e2             	shl    %cl,%r10
    edfc:	4d 8d 5a ff          	lea    -0x1(%r10),%r11
    ee00:	4c 89 db             	mov    %r11,%rbx
    ee03:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    ee08:	48 21 c3             	and    %rax,%rbx
    ee0b:	4d 85 ed             	test   %r13,%r13
    ee0e:	41 b9 01 00 00 00    	mov    $0x1,%r9d
    ee14:	44 89 e8             	mov    %r13d,%eax
    ee17:	41 0f 44 c1          	cmove  %r9d,%eax
    ee1b:	4d 0f 45 ea          	cmovne %r10,%r13
    ee1f:	4c 89 c5             	mov    %r8,%rbp
    ee22:	48 21 d5             	and    %rdx,%rbp
    ee25:	48 d3 ea             	shr    %cl,%rdx
    ee28:	48 d3 ed             	shr    %cl,%rbp
    ee2b:	49 09 dd             	or     %rbx,%r13
    ee2e:	48 d1 ea             	shr    $1,%rdx
    ee31:	4d 21 c3             	and    %r8,%r11
    ee34:	48 85 ed             	test   %rbp,%rbp
    ee37:	44 0f 45 cd          	cmovne %ebp,%r9d
    ee3b:	49 0f 45 ea          	cmovne %r10,%rbp
    ee3f:	4c 09 dd             	or     %r11,%rbp
    ee42:	b9 7f 00 00 00       	mov    $0x7f,%ecx
    ee47:	41 ba 7f 00 00 00    	mov    $0x7f,%r10d
    ee4d:	4c 0f bd d5          	bsr    %rbp,%r10
    ee51:	41 83 f2 3f          	xor    $0x3f,%r10d
    ee55:	41 83 c2 40          	add    $0x40,%r10d
    ee59:	49 0f bd cd          	bsr    %r13,%rcx
    ee5d:	83 f1 3f             	xor    $0x3f,%ecx
    ee60:	45 89 d7             	mov    %r10d,%r15d
    ee63:	41 29 cf             	sub    %ecx,%r15d
    ee66:	41 83 c7 c0          	add    $0xffffffc0,%r15d
    ee6a:	78 3f                	js     eeab <hyperinterval::ieee::Format::div+0xfb>
    ee6c:	45 31 db             	xor    %r11d,%r11d
    ee6f:	44 89 f9             	mov    %r15d,%ecx
    ee72:	49 0f a5 eb          	shld   %cl,%rbp,%r11
    ee76:	31 db                	xor    %ebx,%ebx
    ee78:	49 89 ec             	mov    %rbp,%r12
    ee7b:	49 d3 e4             	shl    %cl,%r12
    ee7e:	41 f6 c7 40          	test   $0x40,%r15b
    ee82:	4d 0f 45 dc          	cmovne %r12,%r11
    ee86:	4c 0f 45 e3          	cmovne %rbx,%r12
    ee8a:	4d 39 e5             	cmp    %r12,%r13
    ee8d:	4c 19 db             	sbb    %r11,%rbx
    ee90:	eb 3f                	jmp    eed1 <hyperinterval::ieee::Format::div+0x121>
    ee92:	66 c7 07 01 04       	movw   $0x401,(%rdi)
    ee97:	e9 24 03 00 00       	jmp    f1c0 <hyperinterval::ieee::Format::div+0x410>
    ee9c:	c6 07 00             	movb   $0x0,(%rdi)
    ee9f:	0f 57 c0             	xorps  %xmm0,%xmm0
    eea2:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
    eea6:	e9 15 03 00 00       	jmp    f1c0 <hyperinterval::ieee::Format::div+0x410>
    eeab:	44 89 f9             	mov    %r15d,%ecx
    eeae:	f6 d9                	neg    %cl
    eeb0:	45 31 db             	xor    %r11d,%r11d
    eeb3:	4d 0f a5 eb          	shld   %cl,%r13,%r11
    eeb7:	31 db                	xor    %ebx,%ebx
    eeb9:	4d 89 ec             	mov    %r13,%r12
    eebc:	49 d3 e4             	shl    %cl,%r12
    eebf:	f6 c1 40             	test   $0x40,%cl
    eec2:	4d 0f 45 dc          	cmovne %r12,%r11
    eec6:	4c 0f 45 e3          	cmovne %rbx,%r12
    eeca:	49 39 ec             	cmp    %rbp,%r12
    eecd:	49 83 db 00          	sbb    $0x0,%r11
    eed1:	0f 92 c1             	setb   %cl
    eed4:	44 29 c8             	sub    %r9d,%eax
    eed7:	41 01 c7             	add    %eax,%r15d
    eeda:	0f b6 c9             	movzbl %cl,%ecx
    eedd:	41 29 cf             	sub    %ecx,%r15d
    eee0:	41 39 d7             	cmp    %edx,%r15d
    eee3:	0f 8f 19 02 00 00    	jg     f102 <hyperinterval::ieee::Format::div+0x352>
    eee9:	4c 8b 4c 24 10       	mov    0x10(%rsp),%r9
    eeee:	46 8d 1c 0a          	lea    (%rdx,%r9,1),%r11d
    eef2:	b9 01 00 00 00       	mov    $0x1,%ecx
    eef7:	4c 89 5c 24 18       	mov    %r11,0x18(%rsp)
    eefc:	44 29 d9             	sub    %r11d,%ecx
    eeff:	45 29 cf             	sub    %r9d,%r15d
    ef02:	41 39 cf             	cmp    %ecx,%r15d
    ef05:	44 0f 4e f9          	cmovle %ecx,%r15d
    ef09:	44 29 f8             	sub    %r15d,%eax
    ef0c:	78 61                	js     ef6f <hyperinterval::ieee::Format::div+0x1bf>
    ef0e:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
    ef13:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
    ef18:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
    ef1d:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
    ef22:	48 85 ed             	test   %rbp,%rbp
    ef25:	0f 84 a7 02 00 00    	je     f1d2 <hyperinterval::ieee::Format::div+0x422>
    ef2b:	45 31 e4             	xor    %r12d,%r12d
    ef2e:	89 c1                	mov    %eax,%ecx
    ef30:	4d 0f a5 ec          	shld   %cl,%r13,%r12
    ef34:	31 d2                	xor    %edx,%edx
    ef36:	49 d3 e5             	shl    %cl,%r13
    ef39:	a8 40                	test   $0x40,%al
    ef3b:	4d 0f 45 e5          	cmovne %r13,%r12
    ef3f:	4c 0f 45 ea          	cmovne %rdx,%r13
    ef43:	4c 89 ef             	mov    %r13,%rdi
    ef46:	4c 89 e6             	mov    %r12,%rsi
    ef49:	48 89 ea             	mov    %rbp,%rdx
    ef4c:	31 c9                	xor    %ecx,%ecx
    ef4e:	ff 15 1c 10 05 00    	call   *0x5101c(%rip)        # 5ff70 <_GLOBAL_OFFSET_TABLE_+0x9a8>
    ef54:	49 89 c2             	mov    %rax,%r10
    ef57:	49 89 d1             	mov    %rdx,%r9
    ef5a:	48 89 d1             	mov    %rdx,%rcx
    ef5d:	48 0f af cd          	imul   %rbp,%rcx
    ef61:	48 f7 e5             	mul    %rbp
    ef64:	48 01 ca             	add    %rcx,%rdx
    ef67:	49 29 c5             	sub    %rax,%r13
    ef6a:	49 19 d4             	sbb    %rdx,%r12
    ef6d:	eb 79                	jmp    efe8 <hyperinterval::ieee::Format::div+0x238>
    ef6f:	f7 d8                	neg    %eax
    ef71:	44 39 d0             	cmp    %r10d,%eax
    ef74:	7e 07                	jle    ef7d <hyperinterval::ieee::Format::div+0x1cd>
    ef76:	b3 01                	mov    $0x1,%bl
    ef78:	e9 df 00 00 00       	jmp    f05c <hyperinterval::ieee::Format::div+0x2ac>
    ef7d:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
    ef82:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
    ef87:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
    ef8c:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
    ef91:	31 db                	xor    %ebx,%ebx
    ef93:	89 c1                	mov    %eax,%ecx
    ef95:	48 0f a5 eb          	shld   %cl,%rbp,%rbx
    ef99:	48 d3 e5             	shl    %cl,%rbp
    ef9c:	31 c9                	xor    %ecx,%ecx
    ef9e:	a8 40                	test   $0x40,%al
    efa0:	48 0f 45 dd          	cmovne %rbp,%rbx
    efa4:	48 0f 45 e9          	cmovne %rcx,%rbp
    efa8:	48 89 e8             	mov    %rbp,%rax
    efab:	48 09 d8             	or     %rbx,%rax
    efae:	0f 84 2b 02 00 00    	je     f1df <hyperinterval::ieee::Format::div+0x42f>
    efb4:	45 31 e4             	xor    %r12d,%r12d
    efb7:	4c 89 ef             	mov    %r13,%rdi
    efba:	31 f6                	xor    %esi,%esi
    efbc:	48 89 ea             	mov    %rbp,%rdx
    efbf:	48 89 d9             	mov    %rbx,%rcx
    efc2:	ff 15 a8 0f 05 00    	call   *0x50fa8(%rip)        # 5ff70 <_GLOBAL_OFFSET_TABLE_+0x9a8>
    efc8:	49 89 c2             	mov    %rax,%r10
    efcb:	49 89 d1             	mov    %rdx,%r9
    efce:	48 0f af d8          	imul   %rax,%rbx
    efd2:	48 f7 e5             	mul    %rbp
    efd5:	48 01 da             	add    %rbx,%rdx
    efd8:	4c 89 c9             	mov    %r9,%rcx
    efdb:	48 0f af cd          	imul   %rbp,%rcx
    efdf:	48 01 d1             	add    %rdx,%rcx
    efe2:	49 29 c5             	sub    %rax,%r13
    efe5:	49 19 cc             	sbb    %rcx,%r12
    efe8:	4d 09 e5             	or     %r12,%r13
    efeb:	0f 95 c3             	setne  %bl
    efee:	4c 89 d0             	mov    %r10,%rax
    eff1:	4c 09 c8             	or     %r9,%rax
    eff4:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
    eff9:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
    effe:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
    f003:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    f008:	74 52                	je     f05c <hyperinterval::ieee::Format::div+0x2ac>
    f00a:	49 0f bd c1          	bsr    %r9,%rax
    f00e:	83 f0 3f             	xor    $0x3f,%eax
    f011:	4d 0f bd da          	bsr    %r10,%r11
    f015:	41 83 f3 3f          	xor    $0x3f,%r11d
    f019:	41 83 cb 40          	or     $0x40,%r11d
    f01d:	4d 85 c9             	test   %r9,%r9
    f020:	44 0f 45 d8          	cmovne %eax,%r11d
    f024:	41 83 f3 7f          	xor    $0x7f,%r11d
    f028:	43 8d 2c 3b          	lea    (%r11,%r15,1),%ebp
    f02c:	39 d5                	cmp    %edx,%ebp
    f02e:	0f 8f ce 00 00 00    	jg     f102 <hyperinterval::ieee::Format::div+0x352>
    f034:	b8 01 00 00 00       	mov    $0x1,%eax
    f039:	29 d0                	sub    %edx,%eax
    f03b:	39 c5                	cmp    %eax,%ebp
    f03d:	7d 28                	jge    f067 <hyperinterval::ieee::Format::div+0x2b7>
    f03f:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    f044:	42 8d 0c 38          	lea    (%rax,%r15,1),%ecx
    f048:	fe c9                	dec    %cl
    f04a:	4c 89 d0             	mov    %r10,%rax
    f04d:	48 d3 e0             	shl    %cl,%rax
    f050:	45 31 db             	xor    %r11d,%r11d
    f053:	f6 c1 40             	test   $0x40,%cl
    f056:	4c 0f 44 d8          	cmove  %rax,%r11
    f05a:	eb 6e                	jmp    f0ca <hyperinterval::ieee::Format::div+0x31a>
    f05c:	45 31 d2             	xor    %r10d,%r10d
    f05f:	45 31 c9             	xor    %r9d,%r9d
    f062:	45 31 db             	xor    %r11d,%r11d
    f065:	eb 63                	jmp    f0ca <hyperinterval::ieee::Format::div+0x31a>
    f067:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    f06c:	89 c1                	mov    %eax,%ecx
    f06e:	44 29 d9             	sub    %r11d,%ecx
    f071:	4d 89 d4             	mov    %r10,%r12
    f074:	49 d3 e4             	shl    %cl,%r12
    f077:	89 c8                	mov    %ecx,%eax
    f079:	f7 d8                	neg    %eax
    f07b:	45 31 ed             	xor    %r13d,%r13d
    f07e:	f6 c1 40             	test   $0x40,%cl
    f081:	4d 0f 44 ec          	cmove  %r12,%r13
    f085:	4d 89 d4             	mov    %r10,%r12
    f088:	89 c1                	mov    %eax,%ecx
    f08a:	4d 0f ad cc          	shrd   %cl,%r9,%r12
    f08e:	88 5c 24 0f          	mov    %bl,0xf(%rsp)
    f092:	4c 89 cb             	mov    %r9,%rbx
    f095:	48 d3 eb             	shr    %cl,%rbx
    f098:	a8 40                	test   $0x40,%al
    f09a:	49 0f 44 dc          	cmove  %r12,%rbx
    f09e:	44 39 5c 24 10       	cmp    %r11d,0x10(%rsp)
    f0a3:	49 0f 43 dd          	cmovae %r13,%rbx
    f0a7:	01 d5                	add    %edx,%ebp
    f0a9:	48 63 c5             	movslq %ebp,%rax
    f0ac:	44 89 f1             	mov    %r14d,%ecx
    f0af:	48 d3 e0             	shl    %cl,%rax
    f0b2:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
    f0b9:	49 d3 e3             	shl    %cl,%r11
    f0bc:	49 f7 d3             	not    %r11
    f0bf:	49 21 db             	and    %rbx,%r11
    f0c2:	0f b6 5c 24 0f       	movzbl 0xf(%rsp),%ebx
    f0c7:	49 09 c3             	or     %rax,%r11
    f0ca:	0f b6 db             	movzbl %bl,%ebx
    f0cd:	4c 01 d3             	add    %r10,%rbx
    f0d0:	49 83 d1 00          	adc    $0x0,%r9
    f0d4:	48 89 d8             	mov    %rbx,%rax
    f0d7:	4c 09 c8             	or     %r9,%rax
    f0da:	74 30                	je     f10c <hyperinterval::ieee::Format::div+0x35c>
    f0dc:	49 0f bd c1          	bsr    %r9,%rax
    f0e0:	83 f0 3f             	xor    $0x3f,%eax
    f0e3:	4c 0f bd d3          	bsr    %rbx,%r10
    f0e7:	41 83 f2 3f          	xor    $0x3f,%r10d
    f0eb:	41 83 ca 40          	or     $0x40,%r10d
    f0ef:	4d 85 c9             	test   %r9,%r9
    f0f2:	44 0f 45 d0          	cmovne %eax,%r10d
    f0f6:	41 83 f2 7f          	xor    $0x7f,%r10d
    f0fa:	43 8d 2c 3a          	lea    (%r10,%r15,1),%ebp
    f0fe:	39 d5                	cmp    %edx,%ebp
    f100:	7e 0e                	jle    f110 <hyperinterval::ieee::Format::div+0x360>
    f102:	66 c7 07 01 03       	movw   $0x301,(%rdi)
    f107:	e9 b4 00 00 00       	jmp    f1c0 <hyperinterval::ieee::Format::div+0x410>
    f10c:	31 c0                	xor    %eax,%eax
    f10e:	eb 76                	jmp    f186 <hyperinterval::ieee::Format::div+0x3d6>
    f110:	b8 01 00 00 00       	mov    $0x1,%eax
    f115:	29 d0                	sub    %edx,%eax
    f117:	39 c5                	cmp    %eax,%ebp
    f119:	7d 18                	jge    f133 <hyperinterval::ieee::Format::div+0x383>
    f11b:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    f120:	44 01 f9             	add    %r15d,%ecx
    f123:	fe c9                	dec    %cl
    f125:	48 d3 e3             	shl    %cl,%rbx
    f128:	31 c0                	xor    %eax,%eax
    f12a:	f6 c1 40             	test   $0x40,%cl
    f12d:	48 0f 44 c3          	cmove  %rbx,%rax
    f131:	eb 53                	jmp    f186 <hyperinterval::ieee::Format::div+0x3d6>
    f133:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
    f138:	44 89 e9             	mov    %r13d,%ecx
    f13b:	44 29 d1             	sub    %r10d,%ecx
    f13e:	89 c8                	mov    %ecx,%eax
    f140:	f7 d8                	neg    %eax
    f142:	49 89 df             	mov    %rbx,%r15
    f145:	49 d3 e7             	shl    %cl,%r15
    f148:	45 31 e4             	xor    %r12d,%r12d
    f14b:	f6 c1 40             	test   $0x40,%cl
    f14e:	4d 0f 44 e7          	cmove  %r15,%r12
    f152:	89 c1                	mov    %eax,%ecx
    f154:	4c 0f ad cb          	shrd   %cl,%r9,%rbx
    f158:	49 d3 e9             	shr    %cl,%r9
    f15b:	a8 40                	test   $0x40,%al
    f15d:	4c 0f 44 cb          	cmove  %rbx,%r9
    f161:	45 39 d5             	cmp    %r10d,%r13d
    f164:	4d 0f 43 cc          	cmovae %r12,%r9
    f168:	01 d5                	add    %edx,%ebp
    f16a:	48 63 d5             	movslq %ebp,%rdx
    f16d:	44 89 f1             	mov    %r14d,%ecx
    f170:	48 d3 e2             	shl    %cl,%rdx
    f173:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    f17a:	48 d3 e0             	shl    %cl,%rax
    f17d:	48 f7 d0             	not    %rax
    f180:	4c 21 c8             	and    %r9,%rax
    f183:	48 09 d0             	or     %rdx,%rax
    f186:	48 85 74 24 40       	test   %rsi,0x40(%rsp)
    f18b:	0f 95 c1             	setne  %cl
    f18e:	49 85 f0             	test   %rsi,%r8
    f191:	0f 94 c2             	sete   %dl
    f194:	30 ca                	xor    %cl,%dl
    f196:	75 1d                	jne    f1b5 <hyperinterval::ieee::Format::div+0x405>
    f198:	48 89 c1             	mov    %rax,%rcx
    f19b:	48 31 f1             	xor    %rsi,%rcx
    f19e:	48 85 c0             	test   %rax,%rax
    f1a1:	48 0f 44 c8          	cmove  %rax,%rcx
    f1a5:	4c 31 de             	xor    %r11,%rsi
    f1a8:	4d 85 db             	test   %r11,%r11
    f1ab:	49 0f 44 f3          	cmove  %r11,%rsi
    f1af:	48 89 f0             	mov    %rsi,%rax
    f1b2:	49 89 cb             	mov    %rcx,%r11
    f1b5:	4c 89 5f 08          	mov    %r11,0x8(%rdi)
    f1b9:	48 89 47 10          	mov    %rax,0x10(%rdi)
    f1bd:	c6 07 00             	movb   $0x0,(%rdi)
    f1c0:	48 89 f8             	mov    %rdi,%rax
    f1c3:	48 83 c4 48          	add    $0x48,%rsp
    f1c7:	5b                   	pop    %rbx
    f1c8:	41 5c                	pop    %r12
    f1ca:	41 5d                	pop    %r13
    f1cc:	41 5e                	pop    %r14
    f1ce:	41 5f                	pop    %r15
    f1d0:	5d                   	pop    %rbp
    f1d1:	c3                   	ret
    f1d2:	48 8d 3d af d9 04 00 	lea    0x4d9af(%rip),%rdi        # 5cb88 <__do_global_dtors_aux_fini_array_entry+0x2a0>
    f1d9:	ff 15 59 0c 05 00    	call   *0x50c59(%rip)        # 5fe38 <_GLOBAL_OFFSET_TABLE_+0x870>
    f1df:	48 8d 3d 8a d9 04 00 	lea    0x4d98a(%rip),%rdi        # 5cb70 <__do_global_dtors_aux_fini_array_entry+0x288>
    f1e6:	ff 15 4c 0c 05 00    	call   *0x50c4c(%rip)        # 5fe38 <_GLOBAL_OFFSET_TABLE_+0x870>
    f1ec:	0f 1f 40 00          	nopl   0x0(%rax)

hyperinterval::ieee::Format::power:
    f1f0:	55                   	push   %rbp
    f1f1:	41 57                	push   %r15
    f1f3:	41 56                	push   %r14
    f1f5:	41 55                	push   %r13
    f1f7:	41 54                	push   %r12
    f1f9:	53                   	push   %rbx
    f1fa:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
    f201:	48 89 cb             	mov    %rcx,%rbx
    f204:	49 89 d6             	mov    %rdx,%r14
    f207:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
    f20c:	48 85 f1             	test   %rsi,%rcx
    f20f:	0f 95 44 24 0f       	setne  0xf(%rsp)
    f214:	b8 40 00 00 00       	mov    $0x40,%eax
    f219:	f3 48 0f bc c2       	tzcnt  %rdx,%rax
    f21e:	41 89 c2             	mov    %eax,%r10d
    f221:	41 83 e2 3f          	and    $0x3f,%r10d
    f225:	44 89 d1             	mov    %r10d,%ecx
    f228:	48 d3 ea             	shr    %cl,%rdx
    f22b:	48 89 d1             	mov    %rdx,%rcx
    f22e:	48 d1 e9             	shr    $1,%rcx
    f231:	4c 63 d9             	movslq %ecx,%r11
    f234:	44 89 d1             	mov    %r10d,%ecx
    f237:	49 d3 e3             	shl    %cl,%r11
    f23a:	45 85 c0             	test   %r8d,%r8d
    f23d:	44 89 44 24 70       	mov    %r8d,0x70(%rsp)
    f242:	4c 89 5c 24 68       	mov    %r11,0x68(%rsp)
    f247:	0f 84 55 03 00 00    	je     f5a2 <hyperinterval::ieee::Format::power+0x3b2>
    f24d:	41 b9 01 00 00 00    	mov    $0x1,%r9d
    f253:	44 89 d1             	mov    %r10d,%ecx
    f256:	49 d3 e1             	shl    %cl,%r9
    f259:	48 8d 4e ff          	lea    -0x1(%rsi),%rcx
    f25d:	48 21 cb             	and    %rcx,%rbx
    f260:	4d 8d 79 ff          	lea    -0x1(%r9),%r15
    f264:	44 8d 24 42          	lea    (%rdx,%rax,2),%r12d
    f268:	41 83 e4 fe          	and    $0xfffffffe,%r12d
    f26c:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    f271:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
    f276:	48 89 d9             	mov    %rbx,%rcx
    f279:	44 89 c0             	mov    %r8d,%eax
    f27c:	49 89 d8             	mov    %rbx,%r8
    f27f:	4c 89 5c 24 10       	mov    %r11,0x10(%rsp)
    f284:	49 89 cd             	mov    %rcx,%r13
    f287:	4c 89 8c 24 88 00 00 	mov    %r9,0x88(%rsp)
    f28e:	00 
    f28f:	4c 89 94 24 80 00 00 	mov    %r10,0x80(%rsp)
    f296:	00 
    f297:	4c 89 7c 24 78       	mov    %r15,0x78(%rsp)
    f29c:	44 89 64 24 74       	mov    %r12d,0x74(%rsp)
    f2a1:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    f2a8:	0f 1f 84 00 00 00 00 
    f2af:	00 
    f2b0:	a8 01                	test   $0x1,%al
    f2b2:	4c 89 84 24 90 00 00 	mov    %r8,0x90(%rsp)
    f2b9:	00 
    f2ba:	89 44 24 24          	mov    %eax,0x24(%rsp)
    f2be:	0f 84 87 01 00 00    	je     f44b <hyperinterval::ieee::Format::power+0x25b>
    f2c4:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
    f2c9:	4c 89 c2             	mov    %r8,%rdx
    f2cc:	4c 21 f2             	and    %r14,%rdx
    f2cf:	44 89 d1             	mov    %r10d,%ecx
    f2d2:	48 d3 ea             	shr    %cl,%rdx
    f2d5:	4c 89 c0             	mov    %r8,%rax
    f2d8:	4c 21 f8             	and    %r15,%rax
    f2db:	48 85 d2             	test   %rdx,%rdx
    f2de:	41 89 d3             	mov    %edx,%r11d
    f2e1:	b9 01 00 00 00       	mov    $0x1,%ecx
    f2e6:	44 0f 44 d9          	cmove  %ecx,%r11d
    f2ea:	49 0f 45 d1          	cmovne %r9,%rdx
    f2ee:	48 09 c2             	or     %rax,%rdx
    f2f1:	49 85 f0             	test   %rsi,%r8
    f2f4:	0f 95 44 24 10       	setne  0x10(%rsp)
    f2f9:	4c 89 e8             	mov    %r13,%rax
    f2fc:	4c 21 f0             	and    %r14,%rax
    f2ff:	44 89 d1             	mov    %r10d,%ecx
    f302:	48 d3 e8             	shr    %cl,%rax
    f305:	4c 89 e9             	mov    %r13,%rcx
    f308:	4c 21 f9             	and    %r15,%rcx
    f30b:	48 85 c0             	test   %rax,%rax
    f30e:	41 89 c0             	mov    %eax,%r8d
    f311:	bb 01 00 00 00       	mov    $0x1,%ebx
    f316:	44 0f 44 c3          	cmove  %ebx,%r8d
    f31a:	49 0f 45 c1          	cmovne %r9,%rax
    f31e:	48 09 c8             	or     %rcx,%rax
    f321:	49 85 f5             	test   %rsi,%r13
    f324:	0f 95 c1             	setne  %cl
    f327:	32 4c 24 10          	xor    0x10(%rsp),%cl
    f32b:	48 f7 e2             	mul    %rdx
    f32e:	45 29 e3             	sub    %r12d,%r11d
    f331:	45 01 c3             	add    %r8d,%r11d
    f334:	88 4c 24 54          	mov    %cl,0x54(%rsp)
    f338:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
    f33d:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    f342:	44 89 5c 24 50       	mov    %r11d,0x50(%rsp)
    f347:	4c 89 f2             	mov    %r14,%rdx
    f34a:	48 89 e9             	mov    %rbp,%rcx
    f34d:	4d 89 cc             	mov    %r9,%r12
    f350:	48 89 f5             	mov    %rsi,%rbp
    f353:	4c 89 f3             	mov    %r14,%rbx
    f356:	4d 89 d6             	mov    %r10,%r14
    f359:	e8 b2 f0 ff ff       	call   e410 <hyperinterval::ieee::Format::rounded>
    f35e:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
    f363:	0f 85 28 02 00 00    	jne    f591 <hyperinterval::ieee::Format::power+0x3a1>
    f369:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
    f36e:	48 89 fa             	mov    %rdi,%rdx
    f371:	48 21 da             	and    %rbx,%rdx
    f374:	44 89 f1             	mov    %r14d,%ecx
    f377:	48 d3 ea             	shr    %cl,%rdx
    f37a:	48 89 f8             	mov    %rdi,%rax
    f37d:	4c 21 f8             	and    %r15,%rax
    f380:	48 85 d2             	test   %rdx,%rdx
    f383:	89 d6                	mov    %edx,%esi
    f385:	41 ba 01 00 00 00    	mov    $0x1,%r10d
    f38b:	41 0f 44 f2          	cmove  %r10d,%esi
    f38f:	49 0f 45 d4          	cmovne %r12,%rdx
    f393:	48 09 c2             	or     %rax,%rdx
    f396:	48 85 ef             	test   %rbp,%rdi
    f399:	40 0f 95 c7          	setne  %dil
    f39d:	4c 8b 8c 24 90 00 00 	mov    0x90(%rsp),%r9
    f3a4:	00 
    f3a5:	4c 89 c8             	mov    %r9,%rax
    f3a8:	48 21 d8             	and    %rbx,%rax
    f3ab:	48 d3 e8             	shr    %cl,%rax
    f3ae:	4c 89 c9             	mov    %r9,%rcx
    f3b1:	4c 21 f9             	and    %r15,%rcx
    f3b4:	48 85 c0             	test   %rax,%rax
    f3b7:	41 89 c0             	mov    %eax,%r8d
    f3ba:	45 0f 44 c2          	cmove  %r10d,%r8d
    f3be:	49 0f 45 c4          	cmovne %r12,%rax
    f3c2:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
    f3c7:	48 09 c8             	or     %rcx,%rax
    f3ca:	49 85 e9             	test   %rbp,%r9
    f3cd:	0f 95 c1             	setne  %cl
    f3d0:	40 30 f9             	xor    %dil,%cl
    f3d3:	48 f7 e2             	mul    %rdx
    f3d6:	44 8b 64 24 74       	mov    0x74(%rsp),%r12d
    f3db:	44 29 e6             	sub    %r12d,%esi
    f3de:	44 01 c6             	add    %r8d,%esi
    f3e1:	88 4c 24 54          	mov    %cl,0x54(%rsp)
    f3e5:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
    f3ea:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    f3ef:	89 74 24 50          	mov    %esi,0x50(%rsp)
    f3f3:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    f3f8:	48 89 ee             	mov    %rbp,%rsi
    f3fb:	48 89 da             	mov    %rbx,%rdx
    f3fe:	48 8d 4c 24 40       	lea    0x40(%rsp),%rcx
    f403:	e8 08 f0 ff ff       	call   e410 <hyperinterval::ieee::Format::rounded>
    f408:	80 7c 24 28 01       	cmpb   $0x1,0x28(%rsp)
    f40d:	0f 84 7e 01 00 00    	je     f591 <hyperinterval::ieee::Format::power+0x3a1>
    f413:	48 89 ee             	mov    %rbp,%rsi
    f416:	49 89 de             	mov    %rbx,%r14
    f419:	4c 89 7c 24 10       	mov    %r15,0x10(%rsp)
    f41e:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
    f423:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
    f428:	4c 8b 8c 24 88 00 00 	mov    0x88(%rsp),%r9
    f42f:	00 
    f430:	4c 8b 94 24 80 00 00 	mov    0x80(%rsp),%r10
    f437:	00 
    f438:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
    f43d:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    f442:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
    f447:	8b 44 24 24          	mov    0x24(%rsp),%eax
    f44b:	83 f8 01             	cmp    $0x1,%eax
    f44e:	ba 02 00 00 00       	mov    $0x2,%edx
    f453:	0f 84 02 01 00 00    	je     f55b <hyperinterval::ieee::Format::power+0x36b>
    f459:	4c 89 e8             	mov    %r13,%rax
    f45c:	4c 21 f0             	and    %r14,%rax
    f45f:	44 89 d1             	mov    %r10d,%ecx
    f462:	48 d3 e8             	shr    %cl,%rax
    f465:	4d 21 fd             	and    %r15,%r13
    f468:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
    f46b:	48 85 c0             	test   %rax,%rax
    f46e:	49 0f 45 c1          	cmovne %r9,%rax
    f472:	0f 44 ca             	cmove  %edx,%ecx
    f475:	4c 09 e8             	or     %r13,%rax
    f478:	48 f7 e0             	mul    %rax
    f47b:	44 29 e1             	sub    %r12d,%ecx
    f47e:	c6 44 24 54 00       	movb   $0x0,0x54(%rsp)
    f483:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
    f488:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    f48d:	89 4c 24 50          	mov    %ecx,0x50(%rsp)
    f491:	4c 89 f2             	mov    %r14,%rdx
    f494:	48 89 e9             	mov    %rbp,%rcx
    f497:	44 89 e5             	mov    %r12d,%ebp
    f49a:	4d 89 cc             	mov    %r9,%r12
    f49d:	4d 89 fd             	mov    %r15,%r13
    f4a0:	49 89 f7             	mov    %rsi,%r15
    f4a3:	4c 89 f3             	mov    %r14,%rbx
    f4a6:	4d 89 d6             	mov    %r10,%r14
    f4a9:	e8 62 ef ff ff       	call   e410 <hyperinterval::ieee::Format::rounded>
    f4ae:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
    f4b3:	0f 85 d8 00 00 00    	jne    f591 <hyperinterval::ieee::Format::power+0x3a1>
    f4b9:	48 8b 94 24 90 00 00 	mov    0x90(%rsp),%rdx
    f4c0:	00 
    f4c1:	48 89 d0             	mov    %rdx,%rax
    f4c4:	48 21 d8             	and    %rbx,%rax
    f4c7:	44 89 f1             	mov    %r14d,%ecx
    f4ca:	48 d3 e8             	shr    %cl,%rax
    f4cd:	4c 21 ea             	and    %r13,%rdx
    f4d0:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
    f4d3:	48 85 c0             	test   %rax,%rax
    f4d6:	49 0f 45 c4          	cmovne %r12,%rax
    f4da:	be 02 00 00 00       	mov    $0x2,%esi
    f4df:	0f 44 ce             	cmove  %esi,%ecx
    f4e2:	48 09 d0             	or     %rdx,%rax
    f4e5:	48 f7 e0             	mul    %rax
    f4e8:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
    f4ed:	29 e9                	sub    %ebp,%ecx
    f4ef:	c6 44 24 54 00       	movb   $0x0,0x54(%rsp)
    f4f4:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
    f4f9:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    f4fe:	89 4c 24 50          	mov    %ecx,0x50(%rsp)
    f502:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    f507:	4c 89 fe             	mov    %r15,%rsi
    f50a:	48 89 da             	mov    %rbx,%rdx
    f50d:	48 8d 4c 24 40       	lea    0x40(%rsp),%rcx
    f512:	e8 f9 ee ff ff       	call   e410 <hyperinterval::ieee::Format::rounded>
    f517:	80 7c 24 28 01       	cmpb   $0x1,0x28(%rsp)
    f51c:	74 73                	je     f591 <hyperinterval::ieee::Format::power+0x3a1>
    f51e:	4c 89 fe             	mov    %r15,%rsi
    f521:	49 89 de             	mov    %rbx,%r14
    f524:	41 89 ec             	mov    %ebp,%r12d
    f527:	8b 4c 24 24          	mov    0x24(%rsp),%ecx
    f52b:	89 c8                	mov    %ecx,%eax
    f52d:	d1 e8                	shr    $1,%eax
    f52f:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
    f534:	85 c9                	test   %ecx,%ecx
    f536:	4c 8b 8c 24 88 00 00 	mov    0x88(%rsp),%r9
    f53d:	00 
    f53e:	4c 8b 94 24 80 00 00 	mov    0x80(%rsp),%r10
    f545:	00 
    f546:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
    f54b:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    f550:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
    f555:	0f 85 55 fd ff ff    	jne    f2b0 <hyperinterval::ieee::Format::power+0xc0>
    f55b:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
    f560:	22 44 24 70          	and    0x70(%rsp),%al
    f564:	74 4c                	je     f5b2 <hyperinterval::ieee::Format::power+0x3c2>
    f566:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
    f56b:	48 89 c8             	mov    %rcx,%rax
    f56e:	48 31 f0             	xor    %rsi,%rax
    f571:	48 85 c9             	test   %rcx,%rcx
    f574:	48 0f 44 c1          	cmove  %rcx,%rax
    f578:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    f57d:	48 31 ce             	xor    %rcx,%rsi
    f580:	48 85 c9             	test   %rcx,%rcx
    f583:	48 0f 44 f1          	cmove  %rcx,%rsi
    f587:	48 89 c1             	mov    %rax,%rcx
    f58a:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    f58f:	eb 30                	jmp    f5c1 <hyperinterval::ieee::Format::power+0x3d1>
    f591:	0f b6 4c 24 29       	movzbl 0x29(%rsp),%ecx
    f596:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    f59b:	88 48 01             	mov    %cl,0x1(%rax)
    f59e:	b1 01                	mov    $0x1,%cl
    f5a0:	eb 29                	jmp    f5cb <hyperinterval::ieee::Format::power+0x3db>
    f5a2:	4c 89 5c 24 10       	mov    %r11,0x10(%rsp)
    f5a7:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
    f5ac:	22 44 24 70          	and    0x70(%rsp),%al
    f5b0:	75 b4                	jne    f566 <hyperinterval::ieee::Format::power+0x376>
    f5b2:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    f5b7:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
    f5bc:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    f5c1:	48 89 48 08          	mov    %rcx,0x8(%rax)
    f5c5:	48 89 70 10          	mov    %rsi,0x10(%rax)
    f5c9:	31 c9                	xor    %ecx,%ecx
    f5cb:	88 08                	mov    %cl,(%rax)
    f5cd:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
    f5d4:	5b                   	pop    %rbx
    f5d5:	41 5c                	pop    %r12
    f5d7:	41 5d                	pop    %r13
    f5d9:	41 5e                	pop    %r14
    f5db:	41 5f                	pop    %r15
    f5dd:	5d                   	pop    %rbp
    f5de:	c3                   	ret
    f5df:	90                   	nop

__udivti3:
   4ca50:	49 89 d0             	mov    %rdx,%r8
   4ca53:	48 85 c9             	test   %rcx,%rcx
   4ca56:	74 7b                	je     4cad3 <__udivti3+0x83>
   4ca58:	55                   	push   %rbp
   4ca59:	48 89 e5             	mov    %rsp,%rbp
   4ca5c:	53                   	push   %rbx
   4ca5d:	4c 0f bd c9          	bsr    %rcx,%r9
   4ca61:	44 89 ca             	mov    %r9d,%edx
   4ca64:	83 f2 3f             	xor    $0x3f,%edx
   4ca67:	b0 40                	mov    $0x40,%al
   4ca69:	28 d0                	sub    %dl,%al
   4ca6b:	4c 89 c2             	mov    %r8,%rdx
   4ca6e:	49 89 cb             	mov    %rcx,%r11
   4ca71:	89 c1                	mov    %eax,%ecx
   4ca73:	4c 0f ad da          	shrd   %cl,%r11,%rdx
   4ca77:	4d 89 da             	mov    %r11,%r10
   4ca7a:	49 d3 ea             	shr    %cl,%r10
   4ca7d:	a8 40                	test   $0x40,%al
   4ca7f:	4c 0f 44 d2          	cmove  %rdx,%r10
   4ca83:	48 89 f0             	mov    %rsi,%rax
   4ca86:	48 0f a4 f8 3f       	shld   $0x3f,%rdi,%rax
   4ca8b:	48 89 f2             	mov    %rsi,%rdx
   4ca8e:	48 d1 ea             	shr    $1,%rdx
   4ca91:	49 f7 f2             	div    %r10
   4ca94:	49 89 c2             	mov    %rax,%r10
   4ca97:	44 89 c9             	mov    %r9d,%ecx
   4ca9a:	49 d3 ea             	shr    %cl,%r10
   4ca9d:	31 c9                	xor    %ecx,%ecx
   4ca9f:	49 83 ea 01          	sub    $0x1,%r10
   4caa3:	4c 0f 42 d1          	cmovb  %rcx,%r10
   4caa7:	4c 89 db             	mov    %r11,%rbx
   4caaa:	4c 89 c0             	mov    %r8,%rax
   4caad:	49 f7 e2             	mul    %r10
   4cab0:	49 89 c1             	mov    %rax,%r9
   4cab3:	4c 89 d0             	mov    %r10,%rax
   4cab6:	49 0f af da          	imul   %r10,%rbx
   4caba:	48 01 da             	add    %rbx,%rdx
   4cabd:	4c 29 cf             	sub    %r9,%rdi
   4cac0:	48 19 d6             	sbb    %rdx,%rsi
   4cac3:	4c 39 c7             	cmp    %r8,%rdi
   4cac6:	4c 19 de             	sbb    %r11,%rsi
   4cac9:	48 83 d8 ff          	sbb    $0xffffffffffffffff,%rax
   4cacd:	5b                   	pop    %rbx
   4cace:	5d                   	pop    %rbp
   4cacf:	48 89 ca             	mov    %rcx,%rdx
   4cad2:	c3                   	ret
   4cad3:	4c 39 c6             	cmp    %r8,%rsi
   4cad6:	73 0f                	jae    4cae7 <__udivti3+0x97>
   4cad8:	48 89 f8             	mov    %rdi,%rax
   4cadb:	48 89 f2             	mov    %rsi,%rdx
   4cade:	49 f7 f0             	div    %r8
   4cae1:	31 c9                	xor    %ecx,%ecx
   4cae3:	48 89 ca             	mov    %rcx,%rdx
   4cae6:	c3                   	ret
   4cae7:	48 89 f0             	mov    %rsi,%rax
   4caea:	4c 09 c0             	or     %r8,%rax
   4caed:	48 c1 e8 20          	shr    $0x20,%rax
   4caf1:	74 15                	je     4cb08 <__udivti3+0xb8>
   4caf3:	48 89 f0             	mov    %rsi,%rax
   4caf6:	31 d2                	xor    %edx,%edx
   4caf8:	49 f7 f0             	div    %r8
   4cafb:	48 89 c1             	mov    %rax,%rcx
   4cafe:	48 89 f8             	mov    %rdi,%rax
   4cb01:	49 f7 f0             	div    %r8
   4cb04:	48 89 ca             	mov    %rcx,%rdx
   4cb07:	c3                   	ret
   4cb08:	89 f0                	mov    %esi,%eax
   4cb0a:	31 d2                	xor    %edx,%edx
   4cb0c:	41 f7 f0             	div    %r8d
   4cb0f:	89 c1                	mov    %eax,%ecx
   4cb11:	48 89 f8             	mov    %rdi,%rax
   4cb14:	49 f7 f0             	div    %r8
   4cb17:	48 89 ca             	mov    %rcx,%rdx
   4cb1a:	c3                   	ret

Disassembly of section .fini:
