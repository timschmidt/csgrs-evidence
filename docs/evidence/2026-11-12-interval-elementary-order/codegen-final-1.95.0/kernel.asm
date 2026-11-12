hyperinterval::float::F64Enclosure::abs:
   16ad0:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   16ad4:	75 33                	jne    16b09 <hyperinterval::float::F64Enclosure::abs+0x39>
   16ad6:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   16ada:	48 ba ff ff ff ff ff 	movabs $0x7fffffffffffffff,%rdx
   16ae1:	ff ff 7f 
   16ae4:	48 85 c9             	test   %rcx,%rcx
   16ae7:	41 0f 99 c0          	setns  %r8b
   16aeb:	48 89 c8             	mov    %rcx,%rax
   16aee:	48 21 d0             	and    %rdx,%rax
   16af1:	41 0f 94 c1          	sete   %r9b
   16af5:	45 08 c1             	or     %r8b,%r9b
   16af8:	74 17                	je     16b11 <hyperinterval::float::F64Enclosure::abs+0x41>
   16afa:	48 8b 46 10          	mov    0x10(%rsi),%rax
   16afe:	48 89 47 10          	mov    %rax,0x10(%rdi)
   16b02:	0f 10 06             	movups (%rsi),%xmm0
   16b05:	0f 11 07             	movups %xmm0,(%rdi)
   16b08:	c3                   	ret
   16b09:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
   16b10:	c3                   	ret
   16b11:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   16b15:	48 85 f6             	test   %rsi,%rsi
   16b18:	41 0f 98 c1          	sets   %r9b
   16b1c:	49 89 f0             	mov    %rsi,%r8
   16b1f:	49 21 d0             	and    %rdx,%r8
   16b22:	41 0f 95 c2          	setne  %r10b
   16b26:	45 84 d1             	test   %r10b,%r9b
   16b29:	74 10                	je     16b3b <hyperinterval::float::F64Enclosure::abs+0x6b>
   16b2b:	48 c7 07 01 00 00 00 	movq   $0x1,(%rdi)
   16b32:	4c 89 47 08          	mov    %r8,0x8(%rdi)
   16b36:	48 89 47 10          	mov    %rax,0x10(%rdi)
   16b3a:	c3                   	ret
   16b3b:	49 f7 d8             	neg    %r8
   16b3e:	48 85 f6             	test   %rsi,%rsi
   16b41:	4c 8d 4c 16 01       	lea    0x1(%rsi,%rdx,1),%r9
   16b46:	4a 8d 54 02 01       	lea    0x1(%rdx,%r8,1),%rdx
   16b4b:	49 0f 49 d1          	cmovns %r9,%rdx
   16b4f:	48 39 d1             	cmp    %rdx,%rcx
   16b52:	48 0f 46 c6          	cmovbe %rsi,%rax
   16b56:	48 c7 07 01 00 00 00 	movq   $0x1,(%rdi)
   16b5d:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
   16b64:	00 
   16b65:	48 89 47 10          	mov    %rax,0x10(%rdi)
   16b69:	c3                   	ret
   16b6a:	cc                   	int3
   16b6b:	cc                   	int3
   16b6c:	cc                   	int3
   16b6d:	cc                   	int3
   16b6e:	cc                   	int3
   16b6f:	cc                   	int3

hyperinterval_strict_chain32:
   16bd0:	53                   	push   %rbx
   16bd1:	48 83 ec 60          	sub    $0x60,%rsp
   16bd5:	48 89 fb             	mov    %rdi,%rbx
   16bd8:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   16bdd:	ff 15 7d 78 04 00    	call   *0x4787d(%rip)        # 5e460 <_DYNAMIC+0x2b0>
   16be3:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   16be7:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   16bec:	83 f9 02             	cmp    $0x2,%ecx
   16bef:	0f 84 f4 00 00 00    	je     16ce9 <hyperinterval_strict_chain32+0x119>
   16bf5:	8b 54 24 11          	mov    0x11(%rsp),%edx
   16bf9:	8b 74 24 14          	mov    0x14(%rsp),%esi
   16bfd:	89 74 24 5c          	mov    %esi,0x5c(%rsp)
   16c01:	89 54 24 59          	mov    %edx,0x59(%rsp)
   16c05:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
   16c09:	88 44 24 58          	mov    %al,0x58(%rsp)
   16c0d:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   16c12:	48 8d 74 24 54       	lea    0x54(%rsp),%rsi
   16c17:	f3 0f 10 05 49 ec fe 	movss  -0x113b7(%rip),%xmm0        # 5868 <__abi_tag+0x556c>
   16c1e:	ff 
   16c1f:	f3 0f 10 0d 39 ec fe 	movss  -0x113c7(%rip),%xmm1        # 5860 <__abi_tag+0x5564>
   16c26:	ff 
   16c27:	ff 15 3b 78 04 00    	call   *0x4783b(%rip)        # 5e468 <_DYNAMIC+0x2b8>
   16c2d:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
   16c31:	0f b6 44 24 1c       	movzbl 0x1c(%rsp),%eax
   16c36:	83 f9 02             	cmp    $0x2,%ecx
   16c39:	0f 84 aa 00 00 00    	je     16ce9 <hyperinterval_strict_chain32+0x119>
   16c3f:	8b 54 24 1d          	mov    0x1d(%rsp),%edx
   16c43:	8b 74 24 20          	mov    0x20(%rsp),%esi
   16c47:	89 74 24 50          	mov    %esi,0x50(%rsp)
   16c4b:	89 54 24 4d          	mov    %edx,0x4d(%rsp)
   16c4f:	89 4c 24 48          	mov    %ecx,0x48(%rsp)
   16c53:	88 44 24 4c          	mov    %al,0x4c(%rsp)
   16c57:	48 8d 7c 24 3c       	lea    0x3c(%rsp),%rdi
   16c5c:	48 8d 74 24 48       	lea    0x48(%rsp),%rsi
   16c61:	ff 15 09 78 04 00    	call   *0x47809(%rip)        # 5e470 <_DYNAMIC+0x2c0>
   16c67:	8b 4c 24 3c          	mov    0x3c(%rsp),%ecx
   16c6b:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   16c70:	83 f9 02             	cmp    $0x2,%ecx
   16c73:	74 74                	je     16ce9 <hyperinterval_strict_chain32+0x119>
   16c75:	8b 54 24 41          	mov    0x41(%rsp),%edx
   16c79:	8b 74 24 44          	mov    0x44(%rsp),%esi
   16c7d:	89 74 24 38          	mov    %esi,0x38(%rsp)
   16c81:	89 54 24 35          	mov    %edx,0x35(%rsp)
   16c85:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   16c89:	88 44 24 34          	mov    %al,0x34(%rsp)
   16c8d:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   16c92:	f3 0f 10 05 9a eb fe 	movss  -0x11466(%rip),%xmm0        # 5834 <__abi_tag+0x5538>
   16c99:	ff 
   16c9a:	ff 15 d8 77 04 00    	call   *0x477d8(%rip)        # 5e478 <_DYNAMIC+0x2c8>
   16ca0:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   16ca4:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   16ca9:	83 f9 02             	cmp    $0x2,%ecx
   16cac:	74 3b                	je     16ce9 <hyperinterval_strict_chain32+0x119>
   16cae:	8b 54 24 11          	mov    0x11(%rsp),%edx
   16cb2:	8b 74 24 14          	mov    0x14(%rsp),%esi
   16cb6:	89 74 24 20          	mov    %esi,0x20(%rsp)
   16cba:	89 54 24 1d          	mov    %edx,0x1d(%rsp)
   16cbe:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
   16cc2:	88 44 24 1c          	mov    %al,0x1c(%rsp)
   16cc6:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
   16ccb:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   16cd0:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
   16cd5:	ff 15 a5 77 04 00    	call   *0x477a5(%rip)        # 5e480 <_DYNAMIC+0x2d0>
   16cdb:	8b 4c 24 24          	mov    0x24(%rsp),%ecx
   16cdf:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   16ce4:	83 f9 02             	cmp    $0x2,%ecx
   16ce7:	75 12                	jne    16cfb <hyperinterval_strict_chain32+0x12b>
   16ce9:	88 43 04             	mov    %al,0x4(%rbx)
   16cec:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   16cf2:	48 89 d8             	mov    %rbx,%rax
   16cf5:	48 83 c4 60          	add    $0x60,%rsp
   16cf9:	5b                   	pop    %rbx
   16cfa:	c3                   	ret
   16cfb:	8b 54 24 29          	mov    0x29(%rsp),%edx
   16cff:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
   16d03:	89 74 24 14          	mov    %esi,0x14(%rsp)
   16d07:	89 54 24 11          	mov    %edx,0x11(%rsp)
   16d0b:	89 4c 24 0c          	mov    %ecx,0xc(%rsp)
   16d0f:	88 44 24 10          	mov    %al,0x10(%rsp)
   16d13:	48 8d 74 24 0c       	lea    0xc(%rsp),%rsi
   16d18:	48 89 df             	mov    %rbx,%rdi
   16d1b:	ff 15 67 77 04 00    	call   *0x47767(%rip)        # 5e488 <_DYNAMIC+0x2d8>
   16d21:	48 89 d8             	mov    %rbx,%rax
   16d24:	48 83 c4 60          	add    $0x60,%rsp
   16d28:	5b                   	pop    %rbx
   16d29:	c3                   	ret
   16d2a:	cc                   	int3
   16d2b:	cc                   	int3
   16d2c:	cc                   	int3
   16d2d:	cc                   	int3
   16d2e:	cc                   	int3
   16d2f:	cc                   	int3

hyperinterval_strict_chain64:
   16d30:	53                   	push   %rbx
   16d31:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
   16d38:	48 89 fb             	mov    %rdi,%rbx
   16d3b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   16d40:	ff 15 4a 77 04 00    	call   *0x4774a(%rip)        # 5e490 <_DYNAMIC+0x2e0>
   16d46:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   16d4b:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   16d50:	48 83 f9 02          	cmp    $0x2,%rcx
   16d54:	0f 84 32 01 00 00    	je     16e8c <hyperinterval_strict_chain64+0x15c>
   16d5a:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   16d5f:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   16d64:	48 89 b4 24 a8 00 00 	mov    %rsi,0xa8(%rsp)
   16d6b:	00 
   16d6c:	48 89 94 24 a1 00 00 	mov    %rdx,0xa1(%rsp)
   16d73:	00 
   16d74:	48 89 8c 24 98 00 00 	mov    %rcx,0x98(%rsp)
   16d7b:	00 
   16d7c:	88 84 24 a0 00 00 00 	mov    %al,0xa0(%rsp)
   16d83:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   16d88:	48 8d b4 24 98 00 00 	lea    0x98(%rsp),%rsi
   16d8f:	00 
   16d90:	f2 0f 10 05 58 ea fe 	movsd  -0x115a8(%rip),%xmm0        # 57f0 <__abi_tag+0x54f4>
   16d97:	ff 
   16d98:	f2 0f 10 0d 60 ea fe 	movsd  -0x115a0(%rip),%xmm1        # 5800 <__abi_tag+0x5504>
   16d9f:	ff 
   16da0:	ff 15 f2 76 04 00    	call   *0x476f2(%rip)        # 5e498 <_DYNAMIC+0x2e8>
   16da6:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   16dab:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   16db0:	48 83 f9 02          	cmp    $0x2,%rcx
   16db4:	0f 84 d2 00 00 00    	je     16e8c <hyperinterval_strict_chain64+0x15c>
   16dba:	48 8b 54 24 29       	mov    0x29(%rsp),%rdx
   16dbf:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   16dc4:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
   16dcb:	00 
   16dcc:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
   16dd3:	00 
   16dd4:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
   16ddb:	00 
   16ddc:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
   16de3:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
   16de8:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   16def:	00 
   16df0:	ff 15 aa 76 04 00    	call   *0x476aa(%rip)        # 5e4a0 <_DYNAMIC+0x2f0>
   16df6:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
   16dfb:	0f b6 44 24 70       	movzbl 0x70(%rsp),%eax
   16e00:	48 83 f9 02          	cmp    $0x2,%rcx
   16e04:	0f 84 82 00 00 00    	je     16e8c <hyperinterval_strict_chain64+0x15c>
   16e0a:	48 8b 54 24 71       	mov    0x71(%rsp),%rdx
   16e0f:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
   16e14:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   16e19:	48 89 54 24 59       	mov    %rdx,0x59(%rsp)
   16e1e:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
   16e23:	88 44 24 58          	mov    %al,0x58(%rsp)
   16e27:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   16e2c:	f2 0f 10 05 ac e9 fe 	movsd  -0x11654(%rip),%xmm0        # 57e0 <__abi_tag+0x54e4>
   16e33:	ff 
   16e34:	ff 15 6e 76 04 00    	call   *0x4766e(%rip)        # 5e4a8 <_DYNAMIC+0x2f8>
   16e3a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   16e3f:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   16e44:	48 83 f9 02          	cmp    $0x2,%rcx
   16e48:	74 42                	je     16e8c <hyperinterval_strict_chain64+0x15c>
   16e4a:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   16e4f:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   16e54:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   16e59:	48 89 54 24 29       	mov    %rdx,0x29(%rsp)
   16e5e:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   16e63:	88 44 24 28          	mov    %al,0x28(%rsp)
   16e67:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   16e6c:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   16e71:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
   16e76:	ff 15 34 76 04 00    	call   *0x47634(%rip)        # 5e4b0 <_DYNAMIC+0x300>
   16e7c:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   16e81:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   16e86:	48 83 f9 02          	cmp    $0x2,%rcx
   16e8a:	75 16                	jne    16ea2 <hyperinterval_strict_chain64+0x172>
   16e8c:	88 43 08             	mov    %al,0x8(%rbx)
   16e8f:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   16e96:	48 89 d8             	mov    %rbx,%rax
   16e99:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   16ea0:	5b                   	pop    %rbx
   16ea1:	c3                   	ret
   16ea2:	48 8b 54 24 41       	mov    0x41(%rsp),%rdx
   16ea7:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
   16eac:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
   16eb1:	48 89 54 24 11       	mov    %rdx,0x11(%rsp)
   16eb6:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   16ebb:	88 44 24 10          	mov    %al,0x10(%rsp)
   16ebf:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
   16ec4:	48 89 df             	mov    %rbx,%rdi
   16ec7:	ff 15 eb 75 04 00    	call   *0x475eb(%rip)        # 5e4b8 <_DYNAMIC+0x308>
   16ecd:	48 89 d8             	mov    %rbx,%rax
   16ed0:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   16ed7:	5b                   	pop    %rbx
   16ed8:	c3                   	ret
   16ed9:	cc                   	int3
   16eda:	cc                   	int3
   16edb:	cc                   	int3
   16edc:	cc                   	int3
   16edd:	cc                   	int3
   16ede:	cc                   	int3
   16edf:	cc                   	int3

hyperinterval_strict_surface32:
   16ee0:	55                   	push   %rbp
   16ee1:	41 57                	push   %r15
   16ee3:	41 56                	push   %r14
   16ee5:	41 55                	push   %r13
   16ee7:	41 54                	push   %r12
   16ee9:	53                   	push   %rbx
   16eea:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
   16ef1:	89 f5                	mov    %esi,%ebp
   16ef3:	48 89 fb             	mov    %rdi,%rbx
   16ef6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   16efb:	66 0f 7e 44 24 3c    	movd   %xmm0,0x3c(%rsp)
   16f01:	66 0f 7e 4c 24 2c    	movd   %xmm1,0x2c(%rsp)
   16f07:	ff 15 53 75 04 00    	call   *0x47553(%rip)        # 5e460 <_DYNAMIC+0x2b0>
   16f0d:	44 8b 6c 24 08       	mov    0x8(%rsp),%r13d
   16f12:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   16f17:	41 83 fd 02          	cmp    $0x2,%r13d
   16f1b:	75 0e                	jne    16f2b <hyperinterval_strict_surface32+0x4b>
   16f1d:	88 43 04             	mov    %al,0x4(%rbx)
   16f20:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   16f26:	e9 8a 00 00 00       	jmp    16fb5 <hyperinterval_strict_surface32+0xd5>
   16f2b:	49 89 df             	mov    %rbx,%r15
   16f2e:	8b 4c 24 0d          	mov    0xd(%rsp),%ecx
   16f32:	8b 54 24 10          	mov    0x10(%rsp),%edx
   16f36:	89 54 24 48          	mov    %edx,0x48(%rsp)
   16f3a:	89 4c 24 45          	mov    %ecx,0x45(%rsp)
   16f3e:	44 89 6c 24 40       	mov    %r13d,0x40(%rsp)
   16f43:	88 44 24 44          	mov    %al,0x44(%rsp)
   16f47:	66 0f 6e 44 24 3c    	movd   0x3c(%rsp),%xmm0
   16f4d:	ff 15 6d 75 04 00    	call   *0x4756d(%rip)        # 5e4c0 <_DYNAMIC+0x310>
   16f53:	48 89 c3             	mov    %rax,%rbx
   16f56:	f6 c3 01             	test   $0x1,%bl
   16f59:	74 0b                	je     16f66 <hyperinterval_strict_surface32+0x86>
   16f5b:	4c 89 f8             	mov    %r15,%rax
   16f5e:	88 78 04             	mov    %bh,0x4(%rax)
   16f61:	4c 89 fb             	mov    %r15,%rbx
   16f64:	eb 48                	jmp    16fae <hyperinterval_strict_surface32+0xce>
   16f66:	66 0f 6e 44 24 2c    	movd   0x2c(%rsp),%xmm0
   16f6c:	ff 15 56 75 04 00    	call   *0x47556(%rip)        # 5e4c8 <_DYNAMIC+0x318>
   16f72:	a8 01                	test   $0x1,%al
   16f74:	74 08                	je     16f7e <hyperinterval_strict_surface32+0x9e>
   16f76:	4c 89 fb             	mov    %r15,%rbx
   16f79:	88 63 04             	mov    %ah,0x4(%rbx)
   16f7c:	eb 30                	jmp    16fae <hyperinterval_strict_surface32+0xce>
   16f7e:	48 c1 eb 20          	shr    $0x20,%rbx
   16f82:	66 0f 6e c3          	movd   %ebx,%xmm0
   16f86:	48 c1 e8 20          	shr    $0x20,%rax
   16f8a:	66 0f 6e c8          	movd   %eax,%xmm1
   16f8e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   16f93:	ff 15 c7 74 04 00    	call   *0x474c7(%rip)        # 5e460 <_DYNAMIC+0x2b0>
   16f99:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   16f9d:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   16fa2:	83 f9 02             	cmp    $0x2,%ecx
   16fa5:	75 23                	jne    16fca <hyperinterval_strict_surface32+0xea>
   16fa7:	4c 89 fb             	mov    %r15,%rbx
   16faa:	41 88 47 04          	mov    %al,0x4(%r15)
   16fae:	41 c7 07 02 00 00 00 	movl   $0x2,(%r15)
   16fb5:	48 89 d8             	mov    %rbx,%rax
   16fb8:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
   16fbf:	5b                   	pop    %rbx
   16fc0:	41 5c                	pop    %r12
   16fc2:	41 5d                	pop    %r13
   16fc4:	41 5e                	pop    %r14
   16fc6:	41 5f                	pop    %r15
   16fc8:	5d                   	pop    %rbp
   16fc9:	c3                   	ret
   16fca:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   16fce:	8b 74 24 10          	mov    0x10(%rsp),%esi
   16fd2:	89 74 24 60          	mov    %esi,0x60(%rsp)
   16fd6:	89 54 24 5d          	mov    %edx,0x5d(%rsp)
   16fda:	89 4c 24 58          	mov    %ecx,0x58(%rsp)
   16fde:	88 44 24 5c          	mov    %al,0x5c(%rsp)
   16fe2:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   16fe7:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
   16fec:	89 ea                	mov    %ebp,%edx
   16fee:	ff 15 dc 74 04 00    	call   *0x474dc(%rip)        # 5e4d0 <_DYNAMIC+0x320>
   16ff4:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   16ff8:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   16ffd:	83 f9 02             	cmp    $0x2,%ecx
   17000:	4c 89 fb             	mov    %r15,%rbx
   17003:	0f 84 14 ff ff ff    	je     16f1d <hyperinterval_strict_surface32+0x3d>
   17009:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   1700d:	8b 74 24 10          	mov    0x10(%rsp),%esi
   17011:	89 74 24 78          	mov    %esi,0x78(%rsp)
   17015:	89 54 24 75          	mov    %edx,0x75(%rsp)
   17019:	89 4c 24 70          	mov    %ecx,0x70(%rsp)
   1701d:	88 44 24 74          	mov    %al,0x74(%rsp)
   17021:	48 8d 7c 24 4c       	lea    0x4c(%rsp),%rdi
   17026:	48 8d 74 24 70       	lea    0x70(%rsp),%rsi
   1702b:	ff 15 a7 74 04 00    	call   *0x474a7(%rip)        # 5e4d8 <_DYNAMIC+0x328>
   17031:	8b 4c 24 4c          	mov    0x4c(%rsp),%ecx
   17035:	0f b6 44 24 50       	movzbl 0x50(%rsp),%eax
   1703a:	83 f9 02             	cmp    $0x2,%ecx
   1703d:	0f 84 da fe ff ff    	je     16f1d <hyperinterval_strict_surface32+0x3d>
   17043:	8b 54 24 51          	mov    0x51(%rsp),%edx
   17047:	8b 74 24 54          	mov    0x54(%rsp),%esi
   1704b:	89 74 24 38          	mov    %esi,0x38(%rsp)
   1704f:	89 54 24 35          	mov    %edx,0x35(%rsp)
   17053:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   17057:	88 44 24 34          	mov    %al,0x34(%rsp)
   1705b:	48 8d 9c 24 9c 00 00 	lea    0x9c(%rsp),%rbx
   17062:	00 
   17063:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   17068:	4c 8d 64 24 58       	lea    0x58(%rsp),%r12
   1706d:	48 89 df             	mov    %rbx,%rdi
   17070:	4c 89 e2             	mov    %r12,%rdx
   17073:	ff 15 67 74 04 00    	call   *0x47467(%rip)        # 5e4e0 <_DYNAMIC+0x330>
   17079:	4c 8d 74 24 64       	lea    0x64(%rsp),%r14
   1707e:	48 8d 54 24 40       	lea    0x40(%rsp),%rdx
   17083:	4c 89 f7             	mov    %r14,%rdi
   17086:	48 89 de             	mov    %rbx,%rsi
   17089:	ff 15 59 74 04 00    	call   *0x47459(%rip)        # 5e4e8 <_DYNAMIC+0x338>
   1708f:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17094:	4c 89 f6             	mov    %r14,%rsi
   17097:	ff 15 53 74 04 00    	call   *0x47453(%rip)        # 5e4f0 <_DYNAMIC+0x340>
   1709d:	48 8d 7c 24 14       	lea    0x14(%rsp),%rdi
   170a2:	4c 89 f6             	mov    %r14,%rsi
   170a5:	4c 89 e2             	mov    %r12,%rdx
   170a8:	ff 15 4a 74 04 00    	call   *0x4744a(%rip)        # 5e4f8 <_DYNAMIC+0x348>
   170ae:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   170b3:	4c 89 f6             	mov    %r14,%rsi
   170b6:	4c 89 e2             	mov    %r12,%rdx
   170b9:	ff 15 41 74 04 00    	call   *0x47441(%rip)        # 5e500 <_DYNAMIC+0x350>
   170bf:	8b 44 24 28          	mov    0x28(%rsp),%eax
   170c3:	89 84 24 90 00 00 00 	mov    %eax,0x90(%rsp)
   170ca:	0f 10 44 24 08       	movups 0x8(%rsp),%xmm0
   170cf:	0f 10 4c 24 18       	movups 0x18(%rsp),%xmm1
   170d4:	0f 29 8c 24 80 00 00 	movaps %xmm1,0x80(%rsp)
   170db:	00 
   170dc:	0f 29 44 24 70       	movaps %xmm0,0x70(%rsp)
   170e1:	48 8d 44 24 70       	lea    0x70(%rsp),%rax
   170e6:	4c 89 f7             	mov    %r14,%rdi
   170e9:	ff 15 19 74 04 00    	call   *0x47419(%rip)        # 5e508 <_DYNAMIC+0x358>
   170ef:	8b 4c 24 64          	mov    0x64(%rsp),%ecx
   170f3:	83 f9 01             	cmp    $0x1,%ecx
   170f6:	75 1c                	jne    17114 <hyperinterval_strict_surface32+0x234>
   170f8:	8b 74 24 68          	mov    0x68(%rsp),%esi
   170fc:	8b 7c 24 6c          	mov    0x6c(%rsp),%edi
   17100:	39 fe                	cmp    %edi,%esi
   17102:	0f 94 c2             	sete   %dl
   17105:	66 0f 6e ce          	movd   %esi,%xmm1
   17109:	66 0f 6e c7          	movd   %edi,%xmm0
   1710d:	be 01 00 00 00       	mov    $0x1,%esi
   17112:	eb 04                	jmp    17118 <hyperinterval_strict_surface32+0x238>
   17114:	31 d2                	xor    %edx,%edx
   17116:	31 f6                	xor    %esi,%esi
   17118:	80 f1 01             	xor    $0x1,%cl
   1711b:	89 74 24 08          	mov    %esi,0x8(%rsp)
   1711f:	66 0f 7e 4c 24 0c    	movd   %xmm1,0xc(%rsp)
   17125:	88 4c 24 10          	mov    %cl,0x10(%rsp)
   17129:	88 54 24 11          	mov    %dl,0x11(%rsp)
   1712d:	88 44 24 12          	mov    %al,0x12(%rsp)
   17131:	89 74 24 14          	mov    %esi,0x14(%rsp)
   17135:	66 0f 7e 44 24 18    	movd   %xmm0,0x18(%rsp)
   1713b:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   17140:	4c 8d 64 24 64       	lea    0x64(%rsp),%r12
   17145:	48 8d 5c 24 58       	lea    0x58(%rsp),%rbx
   1714a:	4c 89 e7             	mov    %r12,%rdi
   1714d:	48 89 de             	mov    %rbx,%rsi
   17150:	ff 15 ba 73 04 00    	call   *0x473ba(%rip)        # 5e510 <_DYNAMIC+0x360>
   17156:	88 44 24 2c          	mov    %al,0x2c(%rsp)
   1715a:	4c 89 e7             	mov    %r12,%rdi
   1715d:	48 89 de             	mov    %rbx,%rsi
   17160:	ff 15 b2 73 04 00    	call   *0x473b2(%rip)        # 5e518 <_DYNAMIC+0x368>
   17166:	41 89 c6             	mov    %eax,%r14d
   17169:	48 8d 5c 24 40       	lea    0x40(%rsp),%rbx
   1716e:	4c 89 e7             	mov    %r12,%rdi
   17171:	48 89 de             	mov    %rbx,%rsi
   17174:	ff 15 a6 73 04 00    	call   *0x473a6(%rip)        # 5e520 <_DYNAMIC+0x370>
   1717a:	89 c5                	mov    %eax,%ebp
   1717c:	4c 89 e7             	mov    %r12,%rdi
   1717f:	48 89 de             	mov    %rbx,%rsi
   17182:	ff 15 a0 73 04 00    	call   *0x473a0(%rip)        # 5e528 <_DYNAMIC+0x378>
   17188:	89 c3                	mov    %eax,%ebx
   1718a:	4c 89 e7             	mov    %r12,%rdi
   1718d:	66 0f 6e 44 24 3c    	movd   0x3c(%rsp),%xmm0
   17193:	ff 15 5f 72 04 00    	call   *0x4725f(%rip)        # 5e3f8 <_DYNAMIC+0x248>
   17199:	a8 01                	test   $0x1,%al
   1719b:	74 0c                	je     171a9 <hyperinterval_strict_surface32+0x2c9>
   1719d:	4c 89 fb             	mov    %r15,%rbx
   171a0:	41 88 57 04          	mov    %dl,0x4(%r15)
   171a4:	e9 05 fe ff ff       	jmp    16fae <hyperinterval_strict_surface32+0xce>
   171a9:	80 e2 01             	and    $0x1,%dl
   171ac:	0f b6 44 24 2c       	movzbl 0x2c(%rsp),%eax
   171b1:	88 44 24 08          	mov    %al,0x8(%rsp)
   171b5:	44 88 74 24 09       	mov    %r14b,0x9(%rsp)
   171ba:	40 88 6c 24 0a       	mov    %bpl,0xa(%rsp)
   171bf:	88 5c 24 0b          	mov    %bl,0xb(%rsp)
   171c3:	88 54 24 0c          	mov    %dl,0xc(%rsp)
   171c7:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   171cc:	41 83 fd 01          	cmp    $0x1,%r13d
   171d0:	75 2a                	jne    171fc <hyperinterval_strict_surface32+0x31c>
   171d2:	f3 0f 7e 44 24 44    	movq   0x44(%rsp),%xmm0
   171d8:	66 0f ef c9          	pxor   %xmm1,%xmm1
   171dc:	66 0f 6f 15 2c e7 fe 	movdqa -0x118d4(%rip),%xmm2        # 5910 <__abi_tag+0x5614>
   171e3:	ff 
   171e4:	66 0f ef d0          	pxor   %xmm0,%xmm2
   171e8:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   171ec:	66 0f df ca          	pandn  %xmm2,%xmm1
   171f0:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   171f5:	b8 01 00 00 00       	mov    $0x1,%eax
   171fa:	eb 02                	jmp    171fe <hyperinterval_strict_surface32+0x31e>
   171fc:	31 c0                	xor    %eax,%eax
   171fe:	89 44 24 4c          	mov    %eax,0x4c(%rsp)
   17202:	66 0f d6 44 24 50    	movq   %xmm0,0x50(%rsp)
   17208:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1720d:	48 8d 74 24 64       	lea    0x64(%rsp),%rsi
   17212:	48 8d 54 24 4c       	lea    0x4c(%rsp),%rdx
   17217:	ff 15 13 73 04 00    	call   *0x47313(%rip)        # 5e530 <_DYNAMIC+0x380>
   1721d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17221:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   17226:	83 f9 02             	cmp    $0x2,%ecx
   17229:	4c 89 fb             	mov    %r15,%rbx
   1722c:	0f 84 eb fc ff ff    	je     16f1d <hyperinterval_strict_surface32+0x3d>
   17232:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   17236:	8b 74 24 10          	mov    0x10(%rsp),%esi
   1723a:	89 74 24 38          	mov    %esi,0x38(%rsp)
   1723e:	89 54 24 35          	mov    %edx,0x35(%rsp)
   17242:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   17246:	88 44 24 34          	mov    %al,0x34(%rsp)
   1724a:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1724f:	66 0f 6e 05 0d e6 fe 	movd   -0x119f3(%rip),%xmm0        # 5864 <__abi_tag+0x5568>
   17256:	ff 
   17257:	ff 15 1b 72 04 00    	call   *0x4721b(%rip)        # 5e478 <_DYNAMIC+0x2c8>
   1725d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17261:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   17266:	83 f9 02             	cmp    $0x2,%ecx
   17269:	0f 84 ae fc ff ff    	je     16f1d <hyperinterval_strict_surface32+0x3d>
   1726f:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   17273:	8b 74 24 10          	mov    0x10(%rsp),%esi
   17277:	89 74 24 78          	mov    %esi,0x78(%rsp)
   1727b:	89 54 24 75          	mov    %edx,0x75(%rsp)
   1727f:	89 4c 24 70          	mov    %ecx,0x70(%rsp)
   17283:	88 44 24 74          	mov    %al,0x74(%rsp)
   17287:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   1728c:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   17291:	48 89 df             	mov    %rbx,%rdi
   17294:	ff 15 9e 72 04 00    	call   *0x4729e(%rip)        # 5e538 <_DYNAMIC+0x388>
   1729a:	e9 16 fd ff ff       	jmp    16fb5 <hyperinterval_strict_surface32+0xd5>
   1729f:	cc                   	int3

hyperinterval_strict_surface64:
   172a0:	55                   	push   %rbp
   172a1:	41 57                	push   %r15
   172a3:	41 56                	push   %r14
   172a5:	41 55                	push   %r13
   172a7:	41 54                	push   %r12
   172a9:	53                   	push   %rbx
   172aa:	48 81 ec 58 01 00 00 	sub    $0x158,%rsp
   172b1:	89 f5                	mov    %esi,%ebp
   172b3:	48 89 fb             	mov    %rdi,%rbx
   172b6:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   172bb:	f2 0f 11 84 24 98 00 	movsd  %xmm0,0x98(%rsp)
   172c2:	00 00 
   172c4:	66 0f d6 4c 24 60    	movq   %xmm1,0x60(%rsp)
   172ca:	ff 15 c0 71 04 00    	call   *0x471c0(%rip)        # 5e490 <_DYNAMIC+0x2e0>
   172d0:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   172d5:	44 0f b6 64 24 18    	movzbl 0x18(%rsp),%r12d
   172db:	49 83 ff 02          	cmp    $0x2,%r15
   172df:	75 09                	jne    172ea <hyperinterval_strict_surface64+0x4a>
   172e1:	44 88 63 08          	mov    %r12b,0x8(%rbx)
   172e5:	e9 9c 00 00 00       	jmp    17386 <hyperinterval_strict_surface64+0xe6>
   172ea:	44 0f b6 74 24 1f    	movzbl 0x1f(%rsp),%r14d
   172f0:	44 0f b7 6c 24 1d    	movzwl 0x1d(%rsp),%r13d
   172f6:	8b 44 24 19          	mov    0x19(%rsp),%eax
   172fa:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   172ff:	4c 89 7c 24 68       	mov    %r15,0x68(%rsp)
   17304:	44 88 64 24 70       	mov    %r12b,0x70(%rsp)
   17309:	44 88 74 24 77       	mov    %r14b,0x77(%rsp)
   1730e:	66 44 89 6c 24 75    	mov    %r13w,0x75(%rsp)
   17314:	48 89 84 24 20 01 00 	mov    %rax,0x120(%rsp)
   1731b:	00 
   1731c:	89 44 24 71          	mov    %eax,0x71(%rsp)
   17320:	48 89 8c 24 18 01 00 	mov    %rcx,0x118(%rsp)
   17327:	00 
   17328:	48 89 4c 24 78       	mov    %rcx,0x78(%rsp)
   1732d:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
   17334:	00 
   17335:	f2 0f 10 84 24 98 00 	movsd  0x98(%rsp),%xmm0
   1733c:	00 00 
   1733e:	ff 15 fc 71 04 00    	call   *0x471fc(%rip)        # 5e540 <_DYNAMIC+0x390>
   17344:	80 bc 24 d0 00 00 00 	cmpb   $0x1,0xd0(%rsp)
   1734b:	01 
   1734c:	74 2d                	je     1737b <hyperinterval_strict_surface64+0xdb>
   1734e:	f2 0f 10 84 24 d8 00 	movsd  0xd8(%rsp),%xmm0
   17355:	00 00 
   17357:	f2 0f 11 44 24 58    	movsd  %xmm0,0x58(%rsp)
   1735d:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
   17364:	00 
   17365:	f2 0f 10 44 24 60    	movsd  0x60(%rsp),%xmm0
   1736b:	ff 15 d7 71 04 00    	call   *0x471d7(%rip)        # 5e548 <_DYNAMIC+0x398>
   17371:	80 bc 24 d0 00 00 00 	cmpb   $0x1,0xd0(%rsp)
   17378:	01 
   17379:	75 27                	jne    173a2 <hyperinterval_strict_surface64+0x102>
   1737b:	0f b6 84 24 d1 00 00 	movzbl 0xd1(%rsp),%eax
   17382:	00 
   17383:	88 43 08             	mov    %al,0x8(%rbx)
   17386:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1738d:	48 89 d8             	mov    %rbx,%rax
   17390:	48 81 c4 58 01 00 00 	add    $0x158,%rsp
   17397:	5b                   	pop    %rbx
   17398:	41 5c                	pop    %r12
   1739a:	41 5d                	pop    %r13
   1739c:	41 5e                	pop    %r14
   1739e:	41 5f                	pop    %r15
   173a0:	5d                   	pop    %rbp
   173a1:	c3                   	ret
   173a2:	f3 0f 7e 8c 24 d8 00 	movq   0xd8(%rsp),%xmm1
   173a9:	00 00 
   173ab:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   173b0:	f2 0f 10 44 24 58    	movsd  0x58(%rsp),%xmm0
   173b6:	ff 15 d4 70 04 00    	call   *0x470d4(%rip)        # 5e490 <_DYNAMIC+0x2e0>
   173bc:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   173c1:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   173c6:	48 83 f9 02          	cmp    $0x2,%rcx
   173ca:	74 b7                	je     17383 <hyperinterval_strict_surface64+0xe3>
   173cc:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   173d1:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   173d6:	48 89 b4 24 b0 00 00 	mov    %rsi,0xb0(%rsp)
   173dd:	00 
   173de:	48 89 94 24 a9 00 00 	mov    %rdx,0xa9(%rsp)
   173e5:	00 
   173e6:	48 89 8c 24 a0 00 00 	mov    %rcx,0xa0(%rsp)
   173ed:	00 
   173ee:	88 84 24 a8 00 00 00 	mov    %al,0xa8(%rsp)
   173f5:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   173fa:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
   173ff:	89 ea                	mov    %ebp,%edx
   17401:	ff 15 49 71 04 00    	call   *0x47149(%rip)        # 5e550 <_DYNAMIC+0x3a0>
   17407:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1740c:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17411:	48 83 f9 02          	cmp    $0x2,%rcx
   17415:	0f 84 68 ff ff ff    	je     17383 <hyperinterval_strict_surface64+0xe3>
   1741b:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   17420:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   17425:	48 89 b4 24 e0 00 00 	mov    %rsi,0xe0(%rsp)
   1742c:	00 
   1742d:	48 89 94 24 d9 00 00 	mov    %rdx,0xd9(%rsp)
   17434:	00 
   17435:	48 89 8c 24 d0 00 00 	mov    %rcx,0xd0(%rsp)
   1743c:	00 
   1743d:	88 84 24 d8 00 00 00 	mov    %al,0xd8(%rsp)
   17444:	48 8d bc 24 b8 00 00 	lea    0xb8(%rsp),%rdi
   1744b:	00 
   1744c:	48 8d b4 24 d0 00 00 	lea    0xd0(%rsp),%rsi
   17453:	00 
   17454:	ff 15 fe 70 04 00    	call   *0x470fe(%rip)        # 5e558 <_DYNAMIC+0x3a8>
   1745a:	48 8b 8c 24 b8 00 00 	mov    0xb8(%rsp),%rcx
   17461:	00 
   17462:	0f b6 84 24 c0 00 00 	movzbl 0xc0(%rsp),%eax
   17469:	00 
   1746a:	48 83 f9 02          	cmp    $0x2,%rcx
   1746e:	0f 84 0f ff ff ff    	je     17383 <hyperinterval_strict_surface64+0xe3>
   17474:	48 8b 94 24 c1 00 00 	mov    0xc1(%rsp),%rdx
   1747b:	00 
   1747c:	48 8b b4 24 c8 00 00 	mov    0xc8(%rsp),%rsi
   17483:	00 
   17484:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
   1748b:	00 
   1748c:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
   17493:	00 
   17494:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
   1749b:	00 
   1749c:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
   174a3:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
   174aa:	00 
   174ab:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   174b2:	00 
   174b3:	48 8d 94 24 a0 00 00 	lea    0xa0(%rsp),%rdx
   174ba:	00 
   174bb:	ff 15 9f 70 04 00    	call   *0x4709f(%rip)        # 5e560 <_DYNAMIC+0x3b0>
   174c1:	48 8d ac 24 28 01 00 	lea    0x128(%rsp),%rbp
   174c8:	00 
   174c9:	48 8d 54 24 68       	lea    0x68(%rsp),%rdx
   174ce:	48 89 ef             	mov    %rbp,%rdi
   174d1:	48 8d b4 24 40 01 00 	lea    0x140(%rsp),%rsi
   174d8:	00 
   174d9:	ff 15 89 70 04 00    	call   *0x47089(%rip)        # 5e568 <_DYNAMIC+0x3b8>
   174df:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   174e4:	48 89 ee             	mov    %rbp,%rsi
   174e7:	e8 e4 f5 ff ff       	call   16ad0 <hyperinterval::float::F64Enclosure::abs>
   174ec:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   174f1:	48 89 ee             	mov    %rbp,%rsi
   174f4:	48 8d 94 24 a0 00 00 	lea    0xa0(%rsp),%rdx
   174fb:	00 
   174fc:	ff 15 6e 70 04 00    	call   *0x4706e(%rip)        # 5e570 <_DYNAMIC+0x3c0>
   17502:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   17507:	48 89 ee             	mov    %rbp,%rsi
   1750a:	48 8d 94 24 a0 00 00 	lea    0xa0(%rsp),%rdx
   17511:	00 
   17512:	ff 15 60 70 04 00    	call   *0x47060(%rip)        # 5e578 <_DYNAMIC+0x3c8>
   17518:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   1751d:	48 89 84 24 10 01 00 	mov    %rax,0x110(%rsp)
   17524:	00 
   17525:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
   1752a:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
   1752f:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
   17534:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
   17539:	0f 29 9c 24 00 01 00 	movaps %xmm3,0x100(%rsp)
   17540:	00 
   17541:	0f 29 94 24 f0 00 00 	movaps %xmm2,0xf0(%rsp)
   17548:	00 
   17549:	0f 29 8c 24 e0 00 00 	movaps %xmm1,0xe0(%rsp)
   17550:	00 
   17551:	0f 29 84 24 d0 00 00 	movaps %xmm0,0xd0(%rsp)
   17558:	00 
   17559:	48 8d 84 24 d0 00 00 	lea    0xd0(%rsp),%rax
   17560:	00 
   17561:	48 89 ef             	mov    %rbp,%rdi
   17564:	ff 15 16 70 04 00    	call   *0x47016(%rip)        # 5e580 <_DYNAMIC+0x3d0>
   1756a:	48 8b 8c 24 28 01 00 	mov    0x128(%rsp),%rcx
   17571:	00 
   17572:	48 83 f9 01          	cmp    $0x1,%rcx
   17576:	75 27                	jne    1759f <hyperinterval_strict_surface64+0x2ff>
   17578:	48 8b b4 24 30 01 00 	mov    0x130(%rsp),%rsi
   1757f:	00 
   17580:	48 8b bc 24 38 01 00 	mov    0x138(%rsp),%rdi
   17587:	00 
   17588:	48 39 fe             	cmp    %rdi,%rsi
   1758b:	0f 94 c2             	sete   %dl
   1758e:	66 48 0f 6e ce       	movq   %rsi,%xmm1
   17593:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   17598:	be 01 00 00 00       	mov    $0x1,%esi
   1759d:	eb 04                	jmp    175a3 <hyperinterval_strict_surface64+0x303>
   1759f:	31 d2                	xor    %edx,%edx
   175a1:	31 f6                	xor    %esi,%esi
   175a3:	80 f1 01             	xor    $0x1,%cl
   175a6:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
   175ab:	66 0f d6 4c 24 18    	movq   %xmm1,0x18(%rsp)
   175b1:	88 4c 24 20          	mov    %cl,0x20(%rsp)
   175b5:	88 54 24 21          	mov    %dl,0x21(%rsp)
   175b9:	88 44 24 22          	mov    %al,0x22(%rsp)
   175bd:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
   175c2:	66 0f d6 44 24 30    	movq   %xmm0,0x30(%rsp)
   175c8:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
   175cd:	48 8d ac 24 28 01 00 	lea    0x128(%rsp),%rbp
   175d4:	00 
   175d5:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
   175dc:	00 
   175dd:	48 89 ef             	mov    %rbp,%rdi
   175e0:	ff 15 a2 6f 04 00    	call   *0x46fa2(%rip)        # 5e588 <_DYNAMIC+0x3d8>
   175e6:	88 44 24 60          	mov    %al,0x60(%rsp)
   175ea:	48 89 ef             	mov    %rbp,%rdi
   175ed:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
   175f4:	00 
   175f5:	ff 15 95 6f 04 00    	call   *0x46f95(%rip)        # 5e590 <_DYNAMIC+0x3e0>
   175fb:	88 44 24 58          	mov    %al,0x58(%rsp)
   175ff:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
   17604:	48 89 ef             	mov    %rbp,%rdi
   17607:	ff 15 8b 6f 04 00    	call   *0x46f8b(%rip)        # 5e598 <_DYNAMIC+0x3e8>
   1760d:	88 44 24 0f          	mov    %al,0xf(%rsp)
   17611:	48 89 ef             	mov    %rbp,%rdi
   17614:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
   17619:	ff 15 81 6f 04 00    	call   *0x46f81(%rip)        # 5e5a0 <_DYNAMIC+0x3f0>
   1761f:	88 44 24 0e          	mov    %al,0xe(%rsp)
   17623:	48 89 ef             	mov    %rbp,%rdi
   17626:	f2 0f 10 84 24 98 00 	movsd  0x98(%rsp),%xmm0
   1762d:	00 00 
   1762f:	ff 15 bb 6d 04 00    	call   *0x46dbb(%rip)        # 5e3f0 <_DYNAMIC+0x240>
   17635:	a8 01                	test   $0x1,%al
   17637:	74 08                	je     17641 <hyperinterval_strict_surface64+0x3a1>
   17639:	88 53 08             	mov    %dl,0x8(%rbx)
   1763c:	e9 45 fd ff ff       	jmp    17386 <hyperinterval_strict_surface64+0xe6>
   17641:	80 e2 01             	and    $0x1,%dl
   17644:	0f b6 44 24 60       	movzbl 0x60(%rsp),%eax
   17649:	88 44 24 10          	mov    %al,0x10(%rsp)
   1764d:	0f b6 44 24 58       	movzbl 0x58(%rsp),%eax
   17652:	88 44 24 11          	mov    %al,0x11(%rsp)
   17656:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
   1765b:	88 44 24 12          	mov    %al,0x12(%rsp)
   1765f:	0f b6 44 24 0e       	movzbl 0xe(%rsp),%eax
   17664:	88 44 24 13          	mov    %al,0x13(%rsp)
   17668:	88 54 24 14          	mov    %dl,0x14(%rsp)
   1766c:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
   17671:	41 83 ff 01          	cmp    $0x1,%r15d
   17675:	75 51                	jne    176c8 <hyperinterval_strict_surface64+0x428>
   17677:	41 c1 e6 10          	shl    $0x10,%r14d
   1767b:	45 09 f5             	or     %r14d,%r13d
   1767e:	41 0f b6 c4          	movzbl %r12b,%eax
   17682:	49 c1 e5 20          	shl    $0x20,%r13
   17686:	48 8b 94 24 20 01 00 	mov    0x120(%rsp),%rdx
   1768d:	00 
   1768e:	4c 09 ea             	or     %r13,%rdx
   17691:	48 c1 e2 08          	shl    $0x8,%rdx
   17695:	48 09 c2             	or     %rax,%rdx
   17698:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1769f:	00 00 80 
   176a2:	48 8b b4 24 18 01 00 	mov    0x118(%rsp),%rsi
   176a9:	00 
   176aa:	48 89 f1             	mov    %rsi,%rcx
   176ad:	48 31 c1             	xor    %rax,%rcx
   176b0:	48 85 f6             	test   %rsi,%rsi
   176b3:	48 0f 44 ce          	cmove  %rsi,%rcx
   176b7:	48 31 d0             	xor    %rdx,%rax
   176ba:	48 85 d2             	test   %rdx,%rdx
   176bd:	48 0f 44 c2          	cmove  %rdx,%rax
   176c1:	ba 01 00 00 00       	mov    $0x1,%edx
   176c6:	eb 02                	jmp    176ca <hyperinterval_strict_surface64+0x42a>
   176c8:	31 d2                	xor    %edx,%edx
   176ca:	48 89 94 24 b8 00 00 	mov    %rdx,0xb8(%rsp)
   176d1:	00 
   176d2:	48 89 8c 24 c0 00 00 	mov    %rcx,0xc0(%rsp)
   176d9:	00 
   176da:	48 89 84 24 c8 00 00 	mov    %rax,0xc8(%rsp)
   176e1:	00 
   176e2:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   176e7:	48 8d b4 24 28 01 00 	lea    0x128(%rsp),%rsi
   176ee:	00 
   176ef:	48 8d 94 24 b8 00 00 	lea    0xb8(%rsp),%rdx
   176f6:	00 
   176f7:	ff 15 ab 6e 04 00    	call   *0x46eab(%rip)        # 5e5a8 <_DYNAMIC+0x3f8>
   176fd:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17702:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17707:	48 83 f9 02          	cmp    $0x2,%rcx
   1770b:	0f 84 72 fc ff ff    	je     17383 <hyperinterval_strict_surface64+0xe3>
   17711:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   17716:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1771b:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
   17722:	00 
   17723:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
   1772a:	00 
   1772b:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
   17732:	00 
   17733:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
   1773a:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1773f:	f2 0f 10 05 89 e0 fe 	movsd  -0x11f77(%rip),%xmm0        # 57d0 <__abi_tag+0x54d4>
   17746:	ff 
   17747:	ff 15 5b 6d 04 00    	call   *0x46d5b(%rip)        # 5e4a8 <_DYNAMIC+0x2f8>
   1774d:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17752:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17757:	48 83 f9 02          	cmp    $0x2,%rcx
   1775b:	0f 84 22 fc ff ff    	je     17383 <hyperinterval_strict_surface64+0xe3>
   17761:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   17766:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1776b:	48 89 b4 24 e0 00 00 	mov    %rsi,0xe0(%rsp)
   17772:	00 
   17773:	48 89 94 24 d9 00 00 	mov    %rdx,0xd9(%rsp)
   1777a:	00 
   1777b:	48 89 8c 24 d0 00 00 	mov    %rcx,0xd0(%rsp)
   17782:	00 
   17783:	88 84 24 d8 00 00 00 	mov    %al,0xd8(%rsp)
   1778a:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   17791:	00 
   17792:	48 8d 94 24 d0 00 00 	lea    0xd0(%rsp),%rdx
   17799:	00 
   1779a:	48 89 df             	mov    %rbx,%rdi
   1779d:	ff 15 0d 6e 04 00    	call   *0x46e0d(%rip)        # 5e5b0 <_DYNAMIC+0x400>
   177a3:	e9 e5 fb ff ff       	jmp    1738d <hyperinterval_strict_surface64+0xed>
   177a8:	cc                   	int3
   177a9:	cc                   	int3
   177aa:	cc                   	int3
   177ab:	cc                   	int3
   177ac:	cc                   	int3
   177ad:	cc                   	int3
   177ae:	cc                   	int3
   177af:	cc                   	int3

hyperinterval::float::F32Enclosure::reciprocal:
   17830:	41 57                	push   %r15
   17832:	41 56                	push   %r14
   17834:	41 54                	push   %r12
   17836:	53                   	push   %rbx
   17837:	48 83 ec 28          	sub    $0x28,%rsp
   1783b:	48 89 fb             	mov    %rdi,%rbx
   1783e:	83 3e 00             	cmpl   $0x0,(%rsi)
   17841:	74 5e                	je     178a1 <hyperinterval::float::F32Enclosure::reciprocal+0x71>
   17843:	49 89 f6             	mov    %rsi,%r14
   17846:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   1784c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17851:	be 00 00 00 80       	mov    $0x80000000,%esi
   17856:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1785b:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   17860:	e8 2b 4a 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   17865:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1786a:	74 25                	je     17891 <hyperinterval::float::F32Enclosure::reciprocal+0x61>
   1786c:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   17871:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17876:	be 00 00 00 80       	mov    $0x80000000,%esi
   1787b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17880:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   17885:	e8 06 4a 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1788a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1788f:	75 25                	jne    178b6 <hyperinterval::float::F32Enclosure::reciprocal+0x86>
   17891:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   17896:	88 4b 04             	mov    %cl,0x4(%rbx)
   17899:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1789f:	eb 06                	jmp    178a7 <hyperinterval::float::F32Enclosure::reciprocal+0x77>
   178a1:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   178a7:	48 89 d8             	mov    %rbx,%rax
   178aa:	48 83 c4 28          	add    $0x28,%rsp
   178ae:	5b                   	pop    %rbx
   178af:	41 5c                	pop    %r12
   178b1:	41 5e                	pop    %r14
   178b3:	41 5f                	pop    %r15
   178b5:	c3                   	ret
   178b6:	8b 44 24 10          	mov    0x10(%rsp),%eax
   178ba:	44 89 e1             	mov    %r12d,%ecx
   178bd:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   178c3:	89 c2                	mov    %eax,%edx
   178c5:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   178cb:	be 00 00 00 80       	mov    $0x80000000,%esi
   178d0:	29 ce                	sub    %ecx,%esi
   178d2:	44 09 f9             	or     %r15d,%ecx
   178d5:	45 85 e4             	test   %r12d,%r12d
   178d8:	48 0f 49 f1          	cmovns %rcx,%rsi
   178dc:	89 d1                	mov    %edx,%ecx
   178de:	44 09 f9             	or     %r15d,%ecx
   178e1:	41 29 d7             	sub    %edx,%r15d
   178e4:	85 c0                	test   %eax,%eax
   178e6:	4c 0f 49 f9          	cmovns %rcx,%r15
   178ea:	b1 01                	mov    $0x1,%cl
   178ec:	44 39 fe             	cmp    %r15d,%esi
   178ef:	77 a5                	ja     17896 <hyperinterval::float::F32Enclosure::reciprocal+0x66>
   178f1:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%rsp)
   178f8:	00 
   178f9:	44 89 64 24 20       	mov    %r12d,0x20(%rsp)
   178fe:	89 44 24 24          	mov    %eax,0x24(%rsp)
   17902:	41 83 7e 04 00       	cmpl   $0x0,0x4(%r14)
   17907:	7f 15                	jg     1791e <hyperinterval::float::F32Enclosure::reciprocal+0xee>
   17909:	41 8b 46 08          	mov    0x8(%r14),%eax
   1790d:	85 c0                	test   %eax,%eax
   1790f:	0f 99 c1             	setns  %cl
   17912:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   17917:	0f 94 c0             	sete   %al
   1791a:	08 c8                	or     %cl,%al
   1791c:	75 1a                	jne    17938 <hyperinterval::float::F32Enclosure::reciprocal+0x108>
   1791e:	48 8d 74 24 1c       	lea    0x1c(%rsp),%rsi
   17923:	48 89 df             	mov    %rbx,%rdi
   17926:	4c 89 f2             	mov    %r14,%rdx
   17929:	b9 01 00 00 00       	mov    $0x1,%ecx
   1792e:	e8 8d 02 00 00       	call   17bc0 <hyperinterval::float::F32Enclosure::corner_image>
   17933:	e9 6f ff ff ff       	jmp    178a7 <hyperinterval::float::F32Enclosure::reciprocal+0x77>
   17938:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
   1793c:	e9 58 ff ff ff       	jmp    17899 <hyperinterval::float::F32Enclosure::reciprocal+0x69>
   17941:	cc                   	int3
   17942:	cc                   	int3
   17943:	cc                   	int3
   17944:	cc                   	int3
   17945:	cc                   	int3
   17946:	cc                   	int3
   17947:	cc                   	int3
   17948:	cc                   	int3
   17949:	cc                   	int3
   1794a:	cc                   	int3
   1794b:	cc                   	int3
   1794c:	cc                   	int3
   1794d:	cc                   	int3
   1794e:	cc                   	int3
   1794f:	cc                   	int3

hyperinterval::float::F32Enclosure::checked_pow:
   17950:	55                   	push   %rbp
   17951:	41 57                	push   %r15
   17953:	41 56                	push   %r14
   17955:	41 55                	push   %r13
   17957:	41 54                	push   %r12
   17959:	53                   	push   %rbx
   1795a:	48 83 ec 38          	sub    $0x38,%rsp
   1795e:	48 89 fb             	mov    %rdi,%rbx
   17961:	83 fa 02             	cmp    $0x2,%edx
   17964:	75 0e                	jne    17974 <hyperinterval::float::F32Enclosure::checked_pow+0x24>
   17966:	48 89 df             	mov    %rbx,%rdi
   17969:	ff 15 01 6b 04 00    	call   *0x46b01(%rip)        # 5e470 <_DYNAMIC+0x2c0>
   1796f:	e9 c8 00 00 00       	jmp    17a3c <hyperinterval::float::F32Enclosure::checked_pow+0xec>
   17974:	f6 06 01             	testb  $0x1,(%rsi)
   17977:	0f 84 b9 00 00 00    	je     17a36 <hyperinterval::float::F32Enclosure::checked_pow+0xe6>
   1797d:	89 d5                	mov    %edx,%ebp
   1797f:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
   17983:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   17987:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1798c:	be 00 00 00 80       	mov    $0x80000000,%esi
   17991:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17996:	4c 89 f9             	mov    %r15,%rcx
   17999:	41 89 e8             	mov    %ebp,%r8d
   1799c:	e8 ff 40 00 00       	call   1baa0 <hyperinterval::ieee::Format::power>
   179a1:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   179a6:	75 7e                	jne    17a26 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   179a8:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   179ad:	44 8b 6c 24 18       	mov    0x18(%rsp),%r13d
   179b2:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   179b7:	be 00 00 00 80       	mov    $0x80000000,%esi
   179bc:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   179c1:	4c 89 f1             	mov    %r14,%rcx
   179c4:	41 89 e8             	mov    %ebp,%r8d
   179c7:	e8 d4 40 00 00       	call   1baa0 <hyperinterval::ieee::Format::power>
   179cc:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   179d1:	74 53                	je     17a26 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   179d3:	8b 44 24 10          	mov    0x10(%rsp),%eax
   179d7:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   179dc:	8b 44 24 18          	mov    0x18(%rsp),%eax
   179e0:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   179e5:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   179ea:	be 00 00 00 80       	mov    $0x80000000,%esi
   179ef:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   179f4:	4c 89 e1             	mov    %r12,%rcx
   179f7:	e8 94 48 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   179fc:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   17a01:	74 23                	je     17a26 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   17a03:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   17a08:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17a0d:	be 00 00 00 80       	mov    $0x80000000,%esi
   17a12:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17a17:	4c 89 e9             	mov    %r13,%rcx
   17a1a:	e8 71 48 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   17a1f:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   17a24:	75 28                	jne    17a4e <hyperinterval::float::F32Enclosure::checked_pow+0xfe>
   17a26:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   17a2b:	88 43 04             	mov    %al,0x4(%rbx)
   17a2e:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17a34:	eb 06                	jmp    17a3c <hyperinterval::float::F32Enclosure::checked_pow+0xec>
   17a36:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   17a3c:	48 89 d8             	mov    %rbx,%rax
   17a3f:	48 83 c4 38          	add    $0x38,%rsp
   17a43:	5b                   	pop    %rbx
   17a44:	41 5c                	pop    %r12
   17a46:	41 5d                	pop    %r13
   17a48:	41 5e                	pop    %r14
   17a4a:	41 5f                	pop    %r15
   17a4c:	5d                   	pop    %rbp
   17a4d:	c3                   	ret
   17a4e:	8b 7c 24 10          	mov    0x10(%rsp),%edi
   17a52:	44 89 e0             	mov    %r12d,%eax
   17a55:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   17a5a:	89 f9                	mov    %edi,%ecx
   17a5c:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   17a62:	ba 00 00 00 80       	mov    $0x80000000,%edx
   17a67:	29 c2                	sub    %eax,%edx
   17a69:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   17a6f:	44 09 e8             	or     %r13d,%eax
   17a72:	45 85 e4             	test   %r12d,%r12d
   17a75:	48 0f 49 d0          	cmovns %rax,%rdx
   17a79:	be 00 00 00 80       	mov    $0x80000000,%esi
   17a7e:	29 ce                	sub    %ecx,%esi
   17a80:	89 c8                	mov    %ecx,%eax
   17a82:	44 09 e8             	or     %r13d,%eax
   17a85:	85 ff                	test   %edi,%edi
   17a87:	48 0f 49 f0          	cmovns %rax,%rsi
   17a8b:	b0 01                	mov    $0x1,%al
   17a8d:	39 f2                	cmp    %esi,%edx
   17a8f:	77 9a                	ja     17a2b <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
   17a91:	89 7c 24 2c          	mov    %edi,0x2c(%rsp)
   17a95:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17a9a:	be 00 00 00 80       	mov    $0x80000000,%esi
   17a9f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17aa4:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   17aa9:	e8 e2 47 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   17aae:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   17ab3:	0f 84 6d ff ff ff    	je     17a26 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   17ab9:	4c 89 64 24 20       	mov    %r12,0x20(%rsp)
   17abe:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   17ac3:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17ac8:	be 00 00 00 80       	mov    $0x80000000,%esi
   17acd:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17ad2:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
   17ad7:	e8 b4 47 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   17adc:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   17ae1:	0f 84 3f ff ff ff    	je     17a26 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   17ae7:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   17aeb:	44 89 e0             	mov    %r12d,%eax
   17aee:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   17af3:	89 ca                	mov    %ecx,%edx
   17af5:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   17afb:	be 00 00 00 80       	mov    $0x80000000,%esi
   17b00:	29 c6                	sub    %eax,%esi
   17b02:	44 09 e8             	or     %r13d,%eax
   17b05:	45 85 e4             	test   %r12d,%r12d
   17b08:	48 0f 49 f0          	cmovns %rax,%rsi
   17b0c:	89 d0                	mov    %edx,%eax
   17b0e:	44 09 e8             	or     %r13d,%eax
   17b11:	41 29 d5             	sub    %edx,%r13d
   17b14:	85 c9                	test   %ecx,%ecx
   17b16:	4c 0f 49 e8          	cmovns %rax,%r13
   17b1a:	b0 01                	mov    $0x1,%al
   17b1c:	44 39 ee             	cmp    %r13d,%esi
   17b1f:	0f 87 06 ff ff ff    	ja     17a2b <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
   17b25:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
   17b2a:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
   17b2e:	44 89 e2             	mov    %r12d,%edx
   17b31:	e8 aa 4a 00 00       	call   1c5e0 <hyperinterval::bounds::Bounds<T>::hull>
   17b36:	41 89 c5             	mov    %eax,%r13d
   17b39:	41 89 d4             	mov    %edx,%r12d
   17b3c:	85 ed                	test   %ebp,%ebp
   17b3e:	0f 95 c0             	setne  %al
   17b41:	40 f6 c5 01          	test   $0x1,%bpl
   17b45:	0f 94 c1             	sete   %cl
   17b48:	84 c8                	test   %cl,%al
   17b4a:	74 11                	je     17b5d <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
   17b4c:	44 89 ff             	mov    %r15d,%edi
   17b4f:	44 89 f6             	mov    %r14d,%esi
   17b52:	31 d2                	xor    %edx,%edx
   17b54:	e8 37 4c 00 00       	call   1c790 <hyperinterval::bounds::Bounds<T>::signs>
   17b59:	a8 02                	test   $0x2,%al
   17b5b:	75 13                	jne    17b70 <hyperinterval::float::F32Enclosure::checked_pow+0x220>
   17b5d:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   17b63:	44 89 6b 04          	mov    %r13d,0x4(%rbx)
   17b67:	44 89 63 08          	mov    %r12d,0x8(%rbx)
   17b6b:	e9 cc fe ff ff       	jmp    17a3c <hyperinterval::float::F32Enclosure::checked_pow+0xec>
   17b70:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17b75:	31 f6                	xor    %esi,%esi
   17b77:	31 d2                	xor    %edx,%edx
   17b79:	e8 e2 15 00 00       	call   19160 <hyperinterval::float::F32Enclosure::from_bits>
   17b7e:	8b 44 24 08          	mov    0x8(%rsp),%eax
   17b82:	83 f8 02             	cmp    $0x2,%eax
   17b85:	75 0a                	jne    17b91 <hyperinterval::float::F32Enclosure::checked_pow+0x241>
   17b87:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   17b8c:	e9 9a fe ff ff       	jmp    17a2b <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
   17b91:	83 f8 01             	cmp    $0x1,%eax
   17b94:	75 c7                	jne    17b5d <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
   17b96:	8b 54 24 0c          	mov    0xc(%rsp),%edx
   17b9a:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   17b9e:	44 89 ef             	mov    %r13d,%edi
   17ba1:	44 89 e6             	mov    %r12d,%esi
   17ba4:	e8 37 4a 00 00       	call   1c5e0 <hyperinterval::bounds::Bounds<T>::hull>
   17ba9:	41 89 c5             	mov    %eax,%r13d
   17bac:	41 89 d4             	mov    %edx,%r12d
   17baf:	eb ac                	jmp    17b5d <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
   17bb1:	cc                   	int3
   17bb2:	cc                   	int3
   17bb3:	cc                   	int3
   17bb4:	cc                   	int3
   17bb5:	cc                   	int3
   17bb6:	cc                   	int3
   17bb7:	cc                   	int3
   17bb8:	cc                   	int3
   17bb9:	cc                   	int3
   17bba:	cc                   	int3
   17bbb:	cc                   	int3
   17bbc:	cc                   	int3
   17bbd:	cc                   	int3
   17bbe:	cc                   	int3
   17bbf:	cc                   	int3

hyperinterval::float::F32Enclosure::corner_image:
   17bc0:	55                   	push   %rbp
   17bc1:	41 57                	push   %r15
   17bc3:	41 56                	push   %r14
   17bc5:	41 55                	push   %r13
   17bc7:	41 54                	push   %r12
   17bc9:	53                   	push   %rbx
   17bca:	48 83 ec 58          	sub    $0x58,%rsp
   17bce:	48 89 fb             	mov    %rdi,%rbx
   17bd1:	f6 06 01             	testb  $0x1,(%rsi)
   17bd4:	74 49                	je     17c1f <hyperinterval::float::F32Enclosure::corner_image+0x5f>
   17bd6:	f6 02 01             	testb  $0x1,(%rdx)
   17bd9:	74 44                	je     17c1f <hyperinterval::float::F32Enclosure::corner_image+0x5f>
   17bdb:	44 8b 62 04          	mov    0x4(%rdx),%r12d
   17bdf:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   17be3:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
   17be7:	8b 46 08             	mov    0x8(%rsi),%eax
   17bea:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   17bef:	84 c9                	test   %cl,%cl
   17bf1:	74 37                	je     17c2a <hyperinterval::float::F32Enclosure::corner_image+0x6a>
   17bf3:	48 89 e7             	mov    %rsp,%rdi
   17bf6:	be 00 00 00 80       	mov    $0x80000000,%esi
   17bfb:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17c00:	4c 89 e9             	mov    %r13,%rcx
   17c03:	4d 89 e0             	mov    %r12,%r8
   17c06:	e8 85 39 00 00       	call   1b590 <hyperinterval::ieee::Format::div>
   17c0b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17c0f:	0f 84 bf 00 00 00    	je     17cd4 <hyperinterval::float::F32Enclosure::corner_image+0x114>
   17c15:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   17c1a:	e9 ad 00 00 00       	jmp    17ccc <hyperinterval::float::F32Enclosure::corner_image+0x10c>
   17c1f:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   17c25:	e9 42 03 00 00       	jmp    17f6c <hyperinterval::float::F32Enclosure::corner_image+0x3ac>
   17c2a:	44 89 e8             	mov    %r13d,%eax
   17c2d:	c1 e8 17             	shr    $0x17,%eax
   17c30:	0f b6 d0             	movzbl %al,%edx
   17c33:	44 89 ee             	mov    %r13d,%esi
   17c36:	81 e6 ff ff 7f 00    	and    $0x7fffff,%esi
   17c3c:	31 c9                	xor    %ecx,%ecx
   17c3e:	85 d2                	test   %edx,%edx
   17c40:	0f 95 c1             	setne  %cl
   17c43:	b8 01 00 00 00       	mov    $0x1,%eax
   17c48:	0f 45 c2             	cmovne %edx,%eax
   17c4b:	c1 e1 17             	shl    $0x17,%ecx
   17c4e:	48 09 f1             	or     %rsi,%rcx
   17c51:	44 89 e2             	mov    %r12d,%edx
   17c54:	c1 ea 17             	shr    $0x17,%edx
   17c57:	0f b6 d2             	movzbl %dl,%edx
   17c5a:	44 89 e6             	mov    %r12d,%esi
   17c5d:	81 e6 ff ff 7f 00    	and    $0x7fffff,%esi
   17c63:	8d ba d4 fe ff ff    	lea    -0x12c(%rdx),%edi
   17c69:	45 31 c0             	xor    %r8d,%r8d
   17c6c:	85 d2                	test   %edx,%edx
   17c6e:	ba d5 fe ff ff       	mov    $0xfffffed5,%edx
   17c73:	0f 45 d7             	cmovne %edi,%edx
   17c76:	41 0f 95 c0          	setne  %r8b
   17c7a:	41 c1 e0 17          	shl    $0x17,%r8d
   17c7e:	49 09 f0             	or     %rsi,%r8
   17c81:	4c 0f af c1          	imul   %rcx,%r8
   17c85:	44 89 e9             	mov    %r13d,%ecx
   17c88:	44 31 e1             	xor    %r12d,%ecx
   17c8b:	01 c2                	add    %eax,%edx
   17c8d:	c1 e9 1f             	shr    $0x1f,%ecx
   17c90:	88 4c 24 14          	mov    %cl,0x14(%rsp)
   17c94:	4c 89 04 24          	mov    %r8,(%rsp)
   17c98:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   17c9f:	00 00 
   17ca1:	89 54 24 10          	mov    %edx,0x10(%rsp)
   17ca5:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   17caa:	48 89 e1             	mov    %rsp,%rcx
   17cad:	be 00 00 00 80       	mov    $0x80000000,%esi
   17cb2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17cb7:	e8 14 46 00 00       	call   1c2d0 <hyperinterval::ieee::Format::rounded>
   17cbc:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   17cc1:	0f 84 54 02 00 00    	je     17f1b <hyperinterval::float::F32Enclosure::corner_image+0x35b>
   17cc7:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   17ccc:	88 43 04             	mov    %al,0x4(%rbx)
   17ccf:	e9 92 02 00 00       	jmp    17f66 <hyperinterval::float::F32Enclosure::corner_image+0x3a6>
   17cd4:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17cd8:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   17cdd:	48 89 e7             	mov    %rsp,%rdi
   17ce0:	be 00 00 00 80       	mov    $0x80000000,%esi
   17ce5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17cea:	e8 a1 45 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   17cef:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17cf3:	0f 85 63 02 00 00    	jne    17f5c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17cf9:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   17cfe:	48 89 e7             	mov    %rsp,%rdi
   17d01:	be 00 00 00 80       	mov    $0x80000000,%esi
   17d06:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17d0b:	4c 89 f9             	mov    %r15,%rcx
   17d0e:	e8 7d 45 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   17d13:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17d17:	0f 85 3f 02 00 00    	jne    17f5c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17d1d:	8b 7c 24 08          	mov    0x8(%rsp),%edi
   17d21:	89 e8                	mov    %ebp,%eax
   17d23:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   17d28:	89 f9                	mov    %edi,%ecx
   17d2a:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   17d30:	ba 00 00 00 80       	mov    $0x80000000,%edx
   17d35:	29 c2                	sub    %eax,%edx
   17d37:	be 00 00 00 80       	mov    $0x80000000,%esi
   17d3c:	09 f0                	or     %esi,%eax
   17d3e:	85 ed                	test   %ebp,%ebp
   17d40:	48 0f 49 d0          	cmovns %rax,%rdx
   17d44:	b8 00 00 00 80       	mov    $0x80000000,%eax
   17d49:	29 c8                	sub    %ecx,%eax
   17d4b:	09 f1                	or     %esi,%ecx
   17d4d:	85 ff                	test   %edi,%edi
   17d4f:	48 0f 49 c1          	cmovns %rcx,%rax
   17d53:	41 b7 01             	mov    $0x1,%r15b
   17d56:	39 c2                	cmp    %eax,%edx
   17d58:	0f 87 04 02 00 00    	ja     17f62 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   17d5e:	89 7c 24 50          	mov    %edi,0x50(%rsp)
   17d62:	48 89 6c 24 28       	mov    %rbp,0x28(%rsp)
   17d67:	48 89 e7             	mov    %rsp,%rdi
   17d6a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17d6f:	4c 89 e9             	mov    %r13,%rcx
   17d72:	4d 89 f0             	mov    %r14,%r8
   17d75:	e8 16 38 00 00       	call   1b590 <hyperinterval::ieee::Format::div>
   17d7a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17d7e:	0f 85 91 fe ff ff    	jne    17c15 <hyperinterval::float::F32Enclosure::corner_image+0x55>
   17d84:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17d88:	44 8b 6c 24 10       	mov    0x10(%rsp),%r13d
   17d8d:	48 89 e7             	mov    %rsp,%rdi
   17d90:	be 00 00 00 80       	mov    $0x80000000,%esi
   17d95:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17d9a:	e8 f1 44 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   17d9f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17da3:	0f 85 b3 01 00 00    	jne    17f5c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17da9:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   17dae:	48 89 e7             	mov    %rsp,%rdi
   17db1:	be 00 00 00 80       	mov    $0x80000000,%esi
   17db6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17dbb:	4c 89 e9             	mov    %r13,%rcx
   17dbe:	e8 cd 44 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   17dc3:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17dc7:	0f 85 8f 01 00 00    	jne    17f5c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17dcd:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17dd1:	89 e8                	mov    %ebp,%eax
   17dd3:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   17dd8:	89 ca                	mov    %ecx,%edx
   17dda:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   17de0:	be 00 00 00 80       	mov    $0x80000000,%esi
   17de5:	29 c6                	sub    %eax,%esi
   17de7:	bf 00 00 00 80       	mov    $0x80000000,%edi
   17dec:	09 f8                	or     %edi,%eax
   17dee:	85 ed                	test   %ebp,%ebp
   17df0:	48 0f 49 f0          	cmovns %rax,%rsi
   17df4:	b8 00 00 00 80       	mov    $0x80000000,%eax
   17df9:	29 d0                	sub    %edx,%eax
   17dfb:	09 fa                	or     %edi,%edx
   17dfd:	85 c9                	test   %ecx,%ecx
   17dff:	48 0f 49 c2          	cmovns %rdx,%rax
   17e03:	39 c6                	cmp    %eax,%esi
   17e05:	0f 87 57 01 00 00    	ja     17f62 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   17e0b:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   17e10:	8b 74 24 50          	mov    0x50(%rsp),%esi
   17e14:	89 ea                	mov    %ebp,%edx
   17e16:	e8 c5 47 00 00       	call   1c5e0 <hyperinterval::bounds::Bounds<T>::hull>
   17e1b:	89 c5                	mov    %eax,%ebp
   17e1d:	41 89 d5             	mov    %edx,%r13d
   17e20:	48 89 e7             	mov    %rsp,%rdi
   17e23:	be 00 00 00 80       	mov    $0x80000000,%esi
   17e28:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17e2d:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   17e32:	4d 89 e0             	mov    %r12,%r8
   17e35:	e8 56 37 00 00       	call   1b590 <hyperinterval::ieee::Format::div>
   17e3a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17e3e:	0f 85 d1 fd ff ff    	jne    17c15 <hyperinterval::float::F32Enclosure::corner_image+0x55>
   17e44:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17e48:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   17e4d:	48 89 e7             	mov    %rsp,%rdi
   17e50:	be 00 00 00 80       	mov    $0x80000000,%esi
   17e55:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17e5a:	e8 31 44 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   17e5f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17e63:	0f 85 f3 00 00 00    	jne    17f5c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17e69:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   17e6e:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   17e73:	48 89 e7             	mov    %rsp,%rdi
   17e76:	be 00 00 00 80       	mov    $0x80000000,%esi
   17e7b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17e80:	4c 89 e1             	mov    %r12,%rcx
   17e83:	e8 08 44 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   17e88:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17e8c:	0f 85 ca 00 00 00    	jne    17f5c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17e92:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17e96:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   17e9b:	89 d0                	mov    %edx,%eax
   17e9d:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   17ea2:	41 89 c8             	mov    %ecx,%r8d
   17ea5:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   17eac:	be 00 00 00 80       	mov    $0x80000000,%esi
   17eb1:	29 c6                	sub    %eax,%esi
   17eb3:	bf 00 00 00 80       	mov    $0x80000000,%edi
   17eb8:	09 f8                	or     %edi,%eax
   17eba:	85 d2                	test   %edx,%edx
   17ebc:	48 0f 49 f0          	cmovns %rax,%rsi
   17ec0:	b8 00 00 00 80       	mov    $0x80000000,%eax
   17ec5:	44 29 c0             	sub    %r8d,%eax
   17ec8:	41 09 f8             	or     %edi,%r8d
   17ecb:	85 c9                	test   %ecx,%ecx
   17ecd:	49 0f 49 c0          	cmovns %r8,%rax
   17ed1:	39 c6                	cmp    %eax,%esi
   17ed3:	0f 87 89 00 00 00    	ja     17f62 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   17ed9:	89 ef                	mov    %ebp,%edi
   17edb:	44 89 ee             	mov    %r13d,%esi
   17ede:	e8 fd 46 00 00       	call   1c5e0 <hyperinterval::bounds::Bounds<T>::hull>
   17ee3:	41 89 c5             	mov    %eax,%r13d
   17ee6:	41 89 d4             	mov    %edx,%r12d
   17ee9:	48 89 e7             	mov    %rsp,%rdi
   17eec:	be 00 00 00 80       	mov    $0x80000000,%esi
   17ef1:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17ef6:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   17efb:	4d 89 f0             	mov    %r14,%r8
   17efe:	e8 8d 36 00 00       	call   1b590 <hyperinterval::ieee::Format::div>
   17f03:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17f07:	0f 85 08 fd ff ff    	jne    17c15 <hyperinterval::float::F32Enclosure::corner_image+0x55>
   17f0d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17f11:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   17f16:	e9 62 02 00 00       	jmp    1817d <hyperinterval::float::F32Enclosure::corner_image+0x5bd>
   17f1b:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   17f1f:	44 8b 7c 24 40       	mov    0x40(%rsp),%r15d
   17f24:	48 89 e7             	mov    %rsp,%rdi
   17f27:	be 00 00 00 80       	mov    $0x80000000,%esi
   17f2c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17f31:	e8 5a 43 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   17f36:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   17f3a:	74 20                	je     17f5c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17f3c:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   17f41:	48 89 e7             	mov    %rsp,%rdi
   17f44:	be 00 00 00 80       	mov    $0x80000000,%esi
   17f49:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17f4e:	4c 89 f9             	mov    %r15,%rcx
   17f51:	e8 3a 43 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   17f56:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   17f5a:	75 1f                	jne    17f7b <hyperinterval::float::F32Enclosure::corner_image+0x3bb>
   17f5c:	44 0f b6 7c 24 01    	movzbl 0x1(%rsp),%r15d
   17f62:	44 88 7b 04          	mov    %r15b,0x4(%rbx)
   17f66:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17f6c:	48 83 c4 58          	add    $0x58,%rsp
   17f70:	5b                   	pop    %rbx
   17f71:	41 5c                	pop    %r12
   17f73:	41 5d                	pop    %r13
   17f75:	41 5e                	pop    %r14
   17f77:	41 5f                	pop    %r15
   17f79:	5d                   	pop    %rbp
   17f7a:	c3                   	ret
   17f7b:	8b 7c 24 08          	mov    0x8(%rsp),%edi
   17f7f:	89 e8                	mov    %ebp,%eax
   17f81:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   17f86:	89 f9                	mov    %edi,%ecx
   17f88:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   17f8e:	ba 00 00 00 80       	mov    $0x80000000,%edx
   17f93:	29 c2                	sub    %eax,%edx
   17f95:	be 00 00 00 80       	mov    $0x80000000,%esi
   17f9a:	09 f0                	or     %esi,%eax
   17f9c:	85 ed                	test   %ebp,%ebp
   17f9e:	48 0f 49 d0          	cmovns %rax,%rdx
   17fa2:	b8 00 00 00 80       	mov    $0x80000000,%eax
   17fa7:	29 c8                	sub    %ecx,%eax
   17fa9:	09 f1                	or     %esi,%ecx
   17fab:	85 ff                	test   %edi,%edi
   17fad:	48 0f 49 c1          	cmovns %rcx,%rax
   17fb1:	41 b7 01             	mov    $0x1,%r15b
   17fb4:	39 c2                	cmp    %eax,%edx
   17fb6:	77 aa                	ja     17f62 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   17fb8:	89 7c 24 28          	mov    %edi,0x28(%rsp)
   17fbc:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   17fc1:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17fc6:	4c 89 e9             	mov    %r13,%rcx
   17fc9:	4d 89 f0             	mov    %r14,%r8
   17fcc:	e8 ff 39 00 00       	call   1b9d0 <hyperinterval::ieee::Format::mul>
   17fd1:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   17fd6:	0f 85 eb fc ff ff    	jne    17cc7 <hyperinterval::float::F32Enclosure::corner_image+0x107>
   17fdc:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   17fe0:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
   17fe5:	48 89 e7             	mov    %rsp,%rdi
   17fe8:	be 00 00 00 80       	mov    $0x80000000,%esi
   17fed:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17ff2:	e8 99 42 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   17ff7:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17ffb:	0f 85 5b ff ff ff    	jne    17f5c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   18001:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   18006:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1800b:	48 89 e7             	mov    %rsp,%rdi
   1800e:	be 00 00 00 80       	mov    $0x80000000,%esi
   18013:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18018:	4c 89 e9             	mov    %r13,%rcx
   1801b:	e8 70 42 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   18020:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18024:	0f 85 32 ff ff ff    	jne    17f5c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   1802a:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1802e:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
   18033:	89 d0                	mov    %edx,%eax
   18035:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   1803a:	41 89 c8             	mov    %ecx,%r8d
   1803d:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18044:	be 00 00 00 80       	mov    $0x80000000,%esi
   18049:	29 c6                	sub    %eax,%esi
   1804b:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18050:	09 f8                	or     %edi,%eax
   18052:	85 d2                	test   %edx,%edx
   18054:	48 0f 49 f0          	cmovns %rax,%rsi
   18058:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1805d:	44 29 c0             	sub    %r8d,%eax
   18060:	41 09 f8             	or     %edi,%r8d
   18063:	85 c9                	test   %ecx,%ecx
   18065:	49 0f 49 c0          	cmovns %r8,%rax
   18069:	39 c6                	cmp    %eax,%esi
   1806b:	0f 87 f1 fe ff ff    	ja     17f62 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   18071:	89 ef                	mov    %ebp,%edi
   18073:	8b 74 24 28          	mov    0x28(%rsp),%esi
   18077:	e8 64 45 00 00       	call   1c5e0 <hyperinterval::bounds::Bounds<T>::hull>
   1807c:	89 c5                	mov    %eax,%ebp
   1807e:	41 89 d5             	mov    %edx,%r13d
   18081:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   18086:	be 00 00 00 80       	mov    $0x80000000,%esi
   1808b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18090:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   18095:	4d 89 e0             	mov    %r12,%r8
   18098:	e8 33 39 00 00       	call   1b9d0 <hyperinterval::ieee::Format::mul>
   1809d:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   180a2:	0f 85 1f fc ff ff    	jne    17cc7 <hyperinterval::float::F32Enclosure::corner_image+0x107>
   180a8:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   180ac:	44 8b 64 24 40       	mov    0x40(%rsp),%r12d
   180b1:	48 89 e7             	mov    %rsp,%rdi
   180b4:	be 00 00 00 80       	mov    $0x80000000,%esi
   180b9:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   180be:	e8 cd 41 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   180c3:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   180c7:	0f 85 8f fe ff ff    	jne    17f5c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   180cd:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   180d2:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   180d7:	48 89 e7             	mov    %rsp,%rdi
   180da:	be 00 00 00 80       	mov    $0x80000000,%esi
   180df:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   180e4:	4c 89 e1             	mov    %r12,%rcx
   180e7:	e8 a4 41 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   180ec:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   180f0:	0f 85 66 fe ff ff    	jne    17f5c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   180f6:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   180fa:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   180ff:	89 d0                	mov    %edx,%eax
   18101:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18106:	41 89 c8             	mov    %ecx,%r8d
   18109:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18110:	be 00 00 00 80       	mov    $0x80000000,%esi
   18115:	29 c6                	sub    %eax,%esi
   18117:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1811c:	09 f8                	or     %edi,%eax
   1811e:	85 d2                	test   %edx,%edx
   18120:	48 0f 49 f0          	cmovns %rax,%rsi
   18124:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18129:	44 29 c0             	sub    %r8d,%eax
   1812c:	41 09 f8             	or     %edi,%r8d
   1812f:	85 c9                	test   %ecx,%ecx
   18131:	49 0f 49 c0          	cmovns %r8,%rax
   18135:	39 c6                	cmp    %eax,%esi
   18137:	0f 87 25 fe ff ff    	ja     17f62 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   1813d:	89 ef                	mov    %ebp,%edi
   1813f:	44 89 ee             	mov    %r13d,%esi
   18142:	e8 99 44 00 00       	call   1c5e0 <hyperinterval::bounds::Bounds<T>::hull>
   18147:	41 89 c5             	mov    %eax,%r13d
   1814a:	41 89 d4             	mov    %edx,%r12d
   1814d:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   18152:	be 00 00 00 80       	mov    $0x80000000,%esi
   18157:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1815c:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   18161:	4d 89 f0             	mov    %r14,%r8
   18164:	e8 67 38 00 00       	call   1b9d0 <hyperinterval::ieee::Format::mul>
   18169:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   1816e:	0f 85 53 fb ff ff    	jne    17cc7 <hyperinterval::float::F32Enclosure::corner_image+0x107>
   18174:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   18178:	44 8b 74 24 40       	mov    0x40(%rsp),%r14d
   1817d:	48 89 e7             	mov    %rsp,%rdi
   18180:	be 00 00 00 80       	mov    $0x80000000,%esi
   18185:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1818a:	e8 01 41 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1818f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18193:	0f 85 c3 fd ff ff    	jne    17f5c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   18199:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1819e:	48 89 e7             	mov    %rsp,%rdi
   181a1:	be 00 00 00 80       	mov    $0x80000000,%esi
   181a6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   181ab:	4c 89 f1             	mov    %r14,%rcx
   181ae:	e8 dd 40 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   181b3:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   181b7:	0f 85 9f fd ff ff    	jne    17f5c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   181bd:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   181c1:	89 e8                	mov    %ebp,%eax
   181c3:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   181c8:	89 ca                	mov    %ecx,%edx
   181ca:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   181d0:	be 00 00 00 80       	mov    $0x80000000,%esi
   181d5:	29 c6                	sub    %eax,%esi
   181d7:	bf 00 00 00 80       	mov    $0x80000000,%edi
   181dc:	09 f8                	or     %edi,%eax
   181de:	85 ed                	test   %ebp,%ebp
   181e0:	48 0f 49 f0          	cmovns %rax,%rsi
   181e4:	89 d0                	mov    %edx,%eax
   181e6:	09 f8                	or     %edi,%eax
   181e8:	29 d7                	sub    %edx,%edi
   181ea:	85 c9                	test   %ecx,%ecx
   181ec:	48 0f 49 f8          	cmovns %rax,%rdi
   181f0:	39 fe                	cmp    %edi,%esi
   181f2:	0f 87 6a fd ff ff    	ja     17f62 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   181f8:	44 89 ef             	mov    %r13d,%edi
   181fb:	44 89 e6             	mov    %r12d,%esi
   181fe:	89 ea                	mov    %ebp,%edx
   18200:	e8 db 43 00 00       	call   1c5e0 <hyperinterval::bounds::Bounds<T>::hull>
   18205:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   1820b:	89 43 04             	mov    %eax,0x4(%rbx)
   1820e:	89 53 08             	mov    %edx,0x8(%rbx)
   18211:	e9 56 fd ff ff       	jmp    17f6c <hyperinterval::float::F32Enclosure::corner_image+0x3ac>
   18216:	cc                   	int3
   18217:	cc                   	int3
   18218:	cc                   	int3
   18219:	cc                   	int3
   1821a:	cc                   	int3
   1821b:	cc                   	int3
   1821c:	cc                   	int3
   1821d:	cc                   	int3
   1821e:	cc                   	int3
   1821f:	cc                   	int3

hyperinterval::float::F32Enclosure::intersection:
   18220:	48 89 f8             	mov    %rdi,%rax
   18223:	45 31 c9             	xor    %r9d,%r9d
   18226:	f6 06 01             	testb  $0x1,(%rsi)
   18229:	0f 84 ed 00 00 00    	je     1831c <hyperinterval::float::F32Enclosure::intersection+0xfc>
   1822f:	f6 02 01             	testb  $0x1,(%rdx)
   18232:	0f 84 d9 00 00 00    	je     18311 <hyperinterval::float::F32Enclosure::intersection+0xf1>
   18238:	53                   	push   %rbx
   18239:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   1823d:	8b 4e 04             	mov    0x4(%rsi),%ecx
   18240:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18245:	41 89 c9             	mov    %ecx,%r9d
   18248:	41 09 f9             	or     %edi,%r9d
   1824b:	41 89 ca             	mov    %ecx,%r10d
   1824e:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18255:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1825b:	45 29 d3             	sub    %r10d,%r11d
   1825e:	85 c9                	test   %ecx,%ecx
   18260:	4d 0f 49 d9          	cmovns %r9,%r11
   18264:	45 89 c1             	mov    %r8d,%r9d
   18267:	41 09 f9             	or     %edi,%r9d
   1826a:	45 89 c2             	mov    %r8d,%r10d
   1826d:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18274:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   18279:	44 29 d3             	sub    %r10d,%ebx
   1827c:	45 85 c0             	test   %r8d,%r8d
   1827f:	49 0f 49 d9          	cmovns %r9,%rbx
   18283:	8b 52 08             	mov    0x8(%rdx),%edx
   18286:	41 39 db             	cmp    %ebx,%r11d
   18289:	41 0f 42 c8          	cmovb  %r8d,%ecx
   1828d:	44 8b 46 08          	mov    0x8(%rsi),%r8d
   18291:	44 89 c6             	mov    %r8d,%esi
   18294:	09 fe                	or     %edi,%esi
   18296:	45 89 c1             	mov    %r8d,%r9d
   18299:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   182a0:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   182a6:	45 29 ca             	sub    %r9d,%r10d
   182a9:	45 85 c0             	test   %r8d,%r8d
   182ac:	4c 0f 49 d6          	cmovns %rsi,%r10
   182b0:	89 d6                	mov    %edx,%esi
   182b2:	09 fe                	or     %edi,%esi
   182b4:	41 89 d1             	mov    %edx,%r9d
   182b7:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   182be:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   182c4:	45 29 cb             	sub    %r9d,%r11d
   182c7:	85 d2                	test   %edx,%edx
   182c9:	4c 0f 49 de          	cmovns %rsi,%r11
   182cd:	45 39 da             	cmp    %r11d,%r10d
   182d0:	44 0f 47 c2          	cmova  %edx,%r8d
   182d4:	89 ca                	mov    %ecx,%edx
   182d6:	09 fa                	or     %edi,%edx
   182d8:	89 ce                	mov    %ecx,%esi
   182da:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   182e0:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   182e6:	41 29 f2             	sub    %esi,%r10d
   182e9:	85 c9                	test   %ecx,%ecx
   182eb:	4c 0f 49 d2          	cmovns %rdx,%r10
   182ef:	44 89 c2             	mov    %r8d,%edx
   182f2:	09 fa                	or     %edi,%edx
   182f4:	44 89 c6             	mov    %r8d,%esi
   182f7:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   182fd:	29 f7                	sub    %esi,%edi
   182ff:	45 85 c0             	test   %r8d,%r8d
   18302:	48 0f 49 fa          	cmovns %rdx,%rdi
   18306:	45 31 c9             	xor    %r9d,%r9d
   18309:	41 39 fa             	cmp    %edi,%r10d
   1830c:	41 0f 96 c1          	setbe  %r9b
   18310:	5b                   	pop    %rbx
   18311:	44 89 08             	mov    %r9d,(%rax)
   18314:	89 48 04             	mov    %ecx,0x4(%rax)
   18317:	44 89 40 08          	mov    %r8d,0x8(%rax)
   1831b:	c3                   	ret
   1831c:	44 89 08             	mov    %r9d,(%rax)
   1831f:	89 48 04             	mov    %ecx,0x4(%rax)
   18322:	44 89 40 08          	mov    %r8d,0x8(%rax)
   18326:	c3                   	ret
   18327:	cc                   	int3
   18328:	cc                   	int3
   18329:	cc                   	int3
   1832a:	cc                   	int3
   1832b:	cc                   	int3
   1832c:	cc                   	int3
   1832d:	cc                   	int3
   1832e:	cc                   	int3
   1832f:	cc                   	int3

hyperinterval::float::F32Enclosure::contains_point:
   18330:	41 56                	push   %r14
   18332:	53                   	push   %rbx
   18333:	48 83 ec 18          	sub    $0x18,%rsp
   18337:	48 89 fb             	mov    %rdi,%rbx
   1833a:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   18340:	66 0f 7e c1          	movd   %xmm0,%ecx
   18344:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18349:	be 00 00 00 80       	mov    $0x80000000,%esi
   1834e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18353:	e8 38 3f 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   18358:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1835d:	3c 01                	cmp    $0x1,%al
   1835f:	75 0d                	jne    1836e <hyperinterval::float::F32Enclosure::contains_point+0x3e>
   18361:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   18366:	48 83 c4 18          	add    $0x18,%rsp
   1836a:	5b                   	pop    %rbx
   1836b:	41 5e                	pop    %r14
   1836d:	c3                   	ret
   1836e:	f6 03 01             	testb  $0x1,(%rbx)
   18371:	74 44                	je     183b7 <hyperinterval::float::F32Enclosure::contains_point+0x87>
   18373:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   18378:	8b 73 04             	mov    0x4(%rbx),%esi
   1837b:	89 d1                	mov    %edx,%ecx
   1837d:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18383:	89 f7                	mov    %esi,%edi
   18385:	44 09 f7             	or     %r14d,%edi
   18388:	41 89 f0             	mov    %esi,%r8d
   1838b:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18392:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   18398:	45 29 c1             	sub    %r8d,%r9d
   1839b:	85 f6                	test   %esi,%esi
   1839d:	4c 0f 49 cf          	cmovns %rdi,%r9
   183a1:	be 00 00 00 80       	mov    $0x80000000,%esi
   183a6:	48 29 ce             	sub    %rcx,%rsi
   183a9:	4c 09 f1             	or     %r14,%rcx
   183ac:	85 d2                	test   %edx,%edx
   183ae:	48 0f 48 ce          	cmovs  %rsi,%rcx
   183b2:	41 39 c9             	cmp    %ecx,%r9d
   183b5:	76 0a                	jbe    183c1 <hyperinterval::float::F32Enclosure::contains_point+0x91>
   183b7:	31 d2                	xor    %edx,%edx
   183b9:	48 83 c4 18          	add    $0x18,%rsp
   183bd:	5b                   	pop    %rbx
   183be:	41 5e                	pop    %r14
   183c0:	c3                   	ret
   183c1:	8b 53 08             	mov    0x8(%rbx),%edx
   183c4:	89 d6                	mov    %edx,%esi
   183c6:	44 09 f6             	or     %r14d,%esi
   183c9:	89 d7                	mov    %edx,%edi
   183cb:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   183d1:	41 29 fe             	sub    %edi,%r14d
   183d4:	85 d2                	test   %edx,%edx
   183d6:	4c 0f 49 f6          	cmovns %rsi,%r14
   183da:	44 39 f1             	cmp    %r14d,%ecx
   183dd:	0f 96 c2             	setbe  %dl
   183e0:	48 83 c4 18          	add    $0x18,%rsp
   183e4:	5b                   	pop    %rbx
   183e5:	41 5e                	pop    %r14
   183e7:	c3                   	ret
   183e8:	cc                   	int3
   183e9:	cc                   	int3
   183ea:	cc                   	int3
   183eb:	cc                   	int3
   183ec:	cc                   	int3
   183ed:	cc                   	int3
   183ee:	cc                   	int3
   183ef:	cc                   	int3

hyperinterval::float::F32Enclosure::interior_subset_of:
   183f0:	b0 01                	mov    $0x1,%al
   183f2:	f6 07 01             	testb  $0x1,(%rdi)
   183f5:	0f 84 93 00 00 00    	je     1848e <hyperinterval::float::F32Enclosure::interior_subset_of+0x9e>
   183fb:	f6 06 01             	testb  $0x1,(%rsi)
   183fe:	0f 84 88 00 00 00    	je     1848c <hyperinterval::float::F32Enclosure::interior_subset_of+0x9c>
   18404:	8b 4f 04             	mov    0x4(%rdi),%ecx
   18407:	8b 56 04             	mov    0x4(%rsi),%edx
   1840a:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1840f:	41 89 d0             	mov    %edx,%r8d
   18412:	41 09 c0             	or     %eax,%r8d
   18415:	41 89 d1             	mov    %edx,%r9d
   18418:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1841f:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18425:	45 29 ca             	sub    %r9d,%r10d
   18428:	85 d2                	test   %edx,%edx
   1842a:	4d 0f 49 d0          	cmovns %r8,%r10
   1842e:	89 ca                	mov    %ecx,%edx
   18430:	09 c2                	or     %eax,%edx
   18432:	41 89 c8             	mov    %ecx,%r8d
   18435:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1843c:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   18442:	45 29 c1             	sub    %r8d,%r9d
   18445:	85 c9                	test   %ecx,%ecx
   18447:	4c 0f 49 ca          	cmovns %rdx,%r9
   1844b:	45 39 ca             	cmp    %r9d,%r10d
   1844e:	73 3c                	jae    1848c <hyperinterval::float::F32Enclosure::interior_subset_of+0x9c>
   18450:	8b 4f 08             	mov    0x8(%rdi),%ecx
   18453:	8b 56 08             	mov    0x8(%rsi),%edx
   18456:	89 ce                	mov    %ecx,%esi
   18458:	09 c6                	or     %eax,%esi
   1845a:	89 cf                	mov    %ecx,%edi
   1845c:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18462:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18468:	41 29 f8             	sub    %edi,%r8d
   1846b:	85 c9                	test   %ecx,%ecx
   1846d:	4c 0f 49 c6          	cmovns %rsi,%r8
   18471:	89 d1                	mov    %edx,%ecx
   18473:	09 c1                	or     %eax,%ecx
   18475:	89 d6                	mov    %edx,%esi
   18477:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1847d:	29 f0                	sub    %esi,%eax
   1847f:	85 d2                	test   %edx,%edx
   18481:	48 0f 49 c1          	cmovns %rcx,%rax
   18485:	41 39 c0             	cmp    %eax,%r8d
   18488:	0f 92 c0             	setb   %al
   1848b:	c3                   	ret
   1848c:	31 c0                	xor    %eax,%eax
   1848e:	c3                   	ret
   1848f:	cc                   	int3

hyperinterval::float::F32Enclosure::abs:
   18490:	48 89 f8             	mov    %rdi,%rax
   18493:	f6 06 01             	testb  $0x1,(%rsi)
   18496:	74 24                	je     184bc <hyperinterval::float::F32Enclosure::abs+0x2c>
   18498:	8b 4e 04             	mov    0x4(%rsi),%ecx
   1849b:	85 c9                	test   %ecx,%ecx
   1849d:	0f 99 c2             	setns  %dl
   184a0:	f7 c1 ff ff ff 7f    	test   $0x7fffffff,%ecx
   184a6:	40 0f 94 c7          	sete   %dil
   184aa:	40 08 d7             	or     %dl,%dil
   184ad:	74 14                	je     184c3 <hyperinterval::float::F32Enclosure::abs+0x33>
   184af:	8b 4e 08             	mov    0x8(%rsi),%ecx
   184b2:	89 48 08             	mov    %ecx,0x8(%rax)
   184b5:	48 8b 0e             	mov    (%rsi),%rcx
   184b8:	48 89 08             	mov    %rcx,(%rax)
   184bb:	c3                   	ret
   184bc:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   184c2:	c3                   	ret
   184c3:	8b 56 08             	mov    0x8(%rsi),%edx
   184c6:	85 d2                	test   %edx,%edx
   184c8:	40 0f 98 c7          	sets   %dil
   184cc:	48 89 d6             	mov    %rdx,%rsi
   184cf:	48 81 e6 ff ff ff 7f 	and    $0x7fffffff,%rsi
   184d6:	41 0f 95 c0          	setne  %r8b
   184da:	44 84 c7             	test   %r8b,%dil
   184dd:	74 19                	je     184f8 <hyperinterval::float::F32Enclosure::abs+0x68>
   184df:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   184e5:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   184eb:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   184f1:	89 50 04             	mov    %edx,0x4(%rax)
   184f4:	89 48 08             	mov    %ecx,0x8(%rax)
   184f7:	c3                   	ret
   184f8:	89 cf                	mov    %ecx,%edi
   184fa:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18500:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18506:	41 89 d1             	mov    %edx,%r9d
   18509:	45 09 c1             	or     %r8d,%r9d
   1850c:	41 29 f0             	sub    %esi,%r8d
   1850f:	85 d2                	test   %edx,%edx
   18511:	4d 0f 49 c1          	cmovns %r9,%r8
   18515:	41 39 c8             	cmp    %ecx,%r8d
   18518:	0f 43 fa             	cmovae %edx,%edi
   1851b:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   18522:	89 78 08             	mov    %edi,0x8(%rax)
   18525:	c3                   	ret
   18526:	cc                   	int3
   18527:	cc                   	int3
   18528:	cc                   	int3
   18529:	cc                   	int3
   1852a:	cc                   	int3
   1852b:	cc                   	int3
   1852c:	cc                   	int3
   1852d:	cc                   	int3
   1852e:	cc                   	int3
   1852f:	cc                   	int3

hyperinterval::float::F32Enclosure::add:
   18530:	48 89 f8             	mov    %rdi,%rax
   18533:	f6 06 01             	testb  $0x1,(%rsi)
   18536:	0f 84 d6 00 00 00    	je     18612 <hyperinterval::float::F32Enclosure::add+0xe2>
   1853c:	f6 02 01             	testb  $0x1,(%rdx)
   1853f:	0f 84 cd 00 00 00    	je     18612 <hyperinterval::float::F32Enclosure::add+0xe2>
   18545:	41 57                	push   %r15
   18547:	41 56                	push   %r14
   18549:	41 55                	push   %r13
   1854b:	41 54                	push   %r12
   1854d:	53                   	push   %rbx
   1854e:	48 83 ec 20          	sub    $0x20,%rsp
   18552:	49 89 c4             	mov    %rax,%r12
   18555:	8b 5e 08             	mov    0x8(%rsi),%ebx
   18558:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   1855e:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   18562:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   18566:	8b 4e 04             	mov    0x4(%rsi),%ecx
   18569:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1856e:	be 00 00 00 80       	mov    $0x80000000,%esi
   18573:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18578:	e8 63 2d 00 00       	call   1b2e0 <hyperinterval::ieee::Format::add>
   1857d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18582:	74 6b                	je     185ef <hyperinterval::float::F32Enclosure::add+0xbf>
   18584:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   18589:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1858e:	be 00 00 00 80       	mov    $0x80000000,%esi
   18593:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18598:	48 89 d9             	mov    %rbx,%rcx
   1859b:	4d 89 f0             	mov    %r14,%r8
   1859e:	e8 3d 2d 00 00       	call   1b2e0 <hyperinterval::ieee::Format::add>
   185a3:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   185a8:	74 45                	je     185ef <hyperinterval::float::F32Enclosure::add+0xbf>
   185aa:	8b 5c 24 18          	mov    0x18(%rsp),%ebx
   185ae:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   185b3:	be 00 00 00 80       	mov    $0x80000000,%esi
   185b8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   185bd:	4c 89 f9             	mov    %r15,%rcx
   185c0:	e8 cb 3c 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   185c5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   185ca:	74 23                	je     185ef <hyperinterval::float::F32Enclosure::add+0xbf>
   185cc:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   185d1:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   185d6:	be 00 00 00 80       	mov    $0x80000000,%esi
   185db:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   185e0:	48 89 d9             	mov    %rbx,%rcx
   185e3:	e8 a8 3c 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   185e8:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   185ed:	75 2a                	jne    18619 <hyperinterval::float::F32Enclosure::add+0xe9>
   185ef:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   185f4:	4c 89 e0             	mov    %r12,%rax
   185f7:	41 88 4c 24 04       	mov    %cl,0x4(%r12)
   185fc:	41 c7 04 24 02 00 00 	movl   $0x2,(%r12)
   18603:	00 
   18604:	48 83 c4 20          	add    $0x20,%rsp
   18608:	5b                   	pop    %rbx
   18609:	41 5c                	pop    %r12
   1860b:	41 5d                	pop    %r13
   1860d:	41 5e                	pop    %r14
   1860f:	41 5f                	pop    %r15
   18611:	c3                   	ret
   18612:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   18618:	c3                   	ret
   18619:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   1861d:	44 89 f0             	mov    %r14d,%eax
   18620:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18625:	89 ca                	mov    %ecx,%edx
   18627:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1862d:	be 00 00 00 80       	mov    $0x80000000,%esi
   18632:	29 c6                	sub    %eax,%esi
   18634:	44 09 e8             	or     %r13d,%eax
   18637:	45 85 f6             	test   %r14d,%r14d
   1863a:	48 0f 49 f0          	cmovns %rax,%rsi
   1863e:	89 d0                	mov    %edx,%eax
   18640:	44 09 e8             	or     %r13d,%eax
   18643:	41 29 d5             	sub    %edx,%r13d
   18646:	85 c9                	test   %ecx,%ecx
   18648:	4c 0f 49 e8          	cmovns %rax,%r13
   1864c:	44 39 ee             	cmp    %r13d,%esi
   1864f:	4c 89 e0             	mov    %r12,%rax
   18652:	76 0c                	jbe    18660 <hyperinterval::float::F32Enclosure::add+0x130>
   18654:	c6 40 04 01          	movb   $0x1,0x4(%rax)
   18658:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   1865e:	eb a4                	jmp    18604 <hyperinterval::float::F32Enclosure::add+0xd4>
   18660:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   18666:	44 89 70 04          	mov    %r14d,0x4(%rax)
   1866a:	89 48 08             	mov    %ecx,0x8(%rax)
   1866d:	eb 95                	jmp    18604 <hyperinterval::float::F32Enclosure::add+0xd4>
   1866f:	cc                   	int3

hyperinterval::float::F32Enclosure::div:
   18670:	53                   	push   %rbx
   18671:	48 89 fb             	mov    %rdi,%rbx
   18674:	83 3a 01             	cmpl   $0x1,(%rdx)
   18677:	75 1a                	jne    18693 <hyperinterval::float::F32Enclosure::div+0x23>
   18679:	83 7a 04 00          	cmpl   $0x0,0x4(%rdx)
   1867d:	7f 14                	jg     18693 <hyperinterval::float::F32Enclosure::div+0x23>
   1867f:	8b 42 08             	mov    0x8(%rdx),%eax
   18682:	85 c0                	test   %eax,%eax
   18684:	0f 99 c1             	setns  %cl
   18687:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   1868c:	0f 94 c0             	sete   %al
   1868f:	08 c8                	or     %cl,%al
   18691:	75 12                	jne    186a5 <hyperinterval::float::F32Enclosure::div+0x35>
   18693:	48 89 df             	mov    %rbx,%rdi
   18696:	b9 01 00 00 00       	mov    $0x1,%ecx
   1869b:	e8 20 f5 ff ff       	call   17bc0 <hyperinterval::float::F32Enclosure::corner_image>
   186a0:	48 89 d8             	mov    %rbx,%rax
   186a3:	5b                   	pop    %rbx
   186a4:	c3                   	ret
   186a5:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
   186a9:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   186af:	48 89 d8             	mov    %rbx,%rax
   186b2:	5b                   	pop    %rbx
   186b3:	c3                   	ret
   186b4:	cc                   	int3
   186b5:	cc                   	int3
   186b6:	cc                   	int3
   186b7:	cc                   	int3
   186b8:	cc                   	int3
   186b9:	cc                   	int3
   186ba:	cc                   	int3
   186bb:	cc                   	int3
   186bc:	cc                   	int3
   186bd:	cc                   	int3
   186be:	cc                   	int3
   186bf:	cc                   	int3

hyperinterval::float::F32Enclosure::new:
   186c0:	41 57                	push   %r15
   186c2:	41 56                	push   %r14
   186c4:	53                   	push   %rbx
   186c5:	48 83 ec 20          	sub    $0x20,%rsp
   186c9:	f3 0f 11 4c 24 1c    	movss  %xmm1,0x1c(%rsp)
   186cf:	48 89 fb             	mov    %rdi,%rbx
   186d2:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   186d8:	66 0f 7e c1          	movd   %xmm0,%ecx
   186dc:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   186e1:	be 00 00 00 80       	mov    $0x80000000,%esi
   186e6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   186eb:	e8 a0 3b 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   186f0:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   186f5:	74 2a                	je     18721 <hyperinterval::float::F32Enclosure::new+0x61>
   186f7:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   186fc:	66 0f 6e 44 24 1c    	movd   0x1c(%rsp),%xmm0
   18702:	66 0f 7e c1          	movd   %xmm0,%ecx
   18706:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1870b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18710:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18715:	e8 76 3b 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1871a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1871f:	75 1b                	jne    1873c <hyperinterval::float::F32Enclosure::new+0x7c>
   18721:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   18726:	88 43 04             	mov    %al,0x4(%rbx)
   18729:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1872f:	48 89 d8             	mov    %rbx,%rax
   18732:	48 83 c4 20          	add    $0x20,%rsp
   18736:	5b                   	pop    %rbx
   18737:	41 5e                	pop    %r14
   18739:	41 5f                	pop    %r15
   1873b:	c3                   	ret
   1873c:	8b 44 24 10          	mov    0x10(%rsp),%eax
   18740:	44 89 f9             	mov    %r15d,%ecx
   18743:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18749:	89 c2                	mov    %eax,%edx
   1874b:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18751:	be 00 00 00 80       	mov    $0x80000000,%esi
   18756:	29 ce                	sub    %ecx,%esi
   18758:	44 09 f1             	or     %r14d,%ecx
   1875b:	45 85 ff             	test   %r15d,%r15d
   1875e:	48 0f 49 f1          	cmovns %rcx,%rsi
   18762:	89 d1                	mov    %edx,%ecx
   18764:	44 09 f1             	or     %r14d,%ecx
   18767:	41 29 d6             	sub    %edx,%r14d
   1876a:	85 c0                	test   %eax,%eax
   1876c:	4c 0f 49 f1          	cmovns %rcx,%r14
   18770:	44 39 f6             	cmp    %r14d,%esi
   18773:	76 06                	jbe    1877b <hyperinterval::float::F32Enclosure::new+0xbb>
   18775:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   18779:	eb ae                	jmp    18729 <hyperinterval::float::F32Enclosure::new+0x69>
   1877b:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   18781:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
   18785:	89 43 08             	mov    %eax,0x8(%rbx)
   18788:	eb a5                	jmp    1872f <hyperinterval::float::F32Enclosure::new+0x6f>
   1878a:	cc                   	int3
   1878b:	cc                   	int3
   1878c:	cc                   	int3
   1878d:	cc                   	int3
   1878e:	cc                   	int3
   1878f:	cc                   	int3

hyperinterval::float::F32Enclosure::sub:
   18790:	53                   	push   %rbx
   18791:	48 83 ec 10          	sub    $0x10,%rsp
   18795:	48 89 fb             	mov    %rdi,%rbx
   18798:	f6 02 01             	testb  $0x1,(%rdx)
   1879b:	74 29                	je     187c6 <hyperinterval::float::F32Enclosure::sub+0x36>
   1879d:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   187a2:	66 0f ef c9          	pxor   %xmm1,%xmm1
   187a6:	66 0f 6f 15 62 d1 fe 	movdqa -0x12e9e(%rip),%xmm2        # 5910 <__abi_tag+0x5614>
   187ad:	ff 
   187ae:	66 0f ef d0          	pxor   %xmm0,%xmm2
   187b2:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   187b6:	66 0f df ca          	pandn  %xmm2,%xmm1
   187ba:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   187bf:	b8 01 00 00 00       	mov    $0x1,%eax
   187c4:	eb 02                	jmp    187c8 <hyperinterval::float::F32Enclosure::sub+0x38>
   187c6:	31 c0                	xor    %eax,%eax
   187c8:	89 44 24 04          	mov    %eax,0x4(%rsp)
   187cc:	66 0f d6 44 24 08    	movq   %xmm0,0x8(%rsp)
   187d2:	48 8d 54 24 04       	lea    0x4(%rsp),%rdx
   187d7:	48 89 df             	mov    %rbx,%rdi
   187da:	ff 15 a0 5c 04 00    	call   *0x45ca0(%rip)        # 5e480 <_DYNAMIC+0x2d0>
   187e0:	48 89 d8             	mov    %rbx,%rax
   187e3:	48 83 c4 10          	add    $0x10,%rsp
   187e7:	5b                   	pop    %rbx
   187e8:	c3                   	ret
   187e9:	cc                   	int3
   187ea:	cc                   	int3
   187eb:	cc                   	int3
   187ec:	cc                   	int3
   187ed:	cc                   	int3
   187ee:	cc                   	int3
   187ef:	cc                   	int3

hyperinterval::float::F32Enclosure::hull:
   187f0:	48 89 f8             	mov    %rdi,%rax
   187f3:	44 8b 0e             	mov    (%rsi),%r9d
   187f6:	44 8b 02             	mov    (%rdx),%r8d
   187f9:	8b 7a 04             	mov    0x4(%rdx),%edi
   187fc:	8b 4a 08             	mov    0x8(%rdx),%ecx
   187ff:	41 f6 c1 01          	test   $0x1,%r9b
   18803:	0f 84 a1 00 00 00    	je     188aa <hyperinterval::float::F32Enclosure::hull+0xba>
   18809:	8b 56 04             	mov    0x4(%rsi),%edx
   1880c:	8b 76 08             	mov    0x8(%rsi),%esi
   1880f:	41 f6 c0 01          	test   $0x1,%r8b
   18813:	0f 84 9b 00 00 00    	je     188b4 <hyperinterval::float::F32Enclosure::hull+0xc4>
   18819:	53                   	push   %rbx
   1881a:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18820:	41 89 d1             	mov    %edx,%r9d
   18823:	45 09 c1             	or     %r8d,%r9d
   18826:	41 89 d2             	mov    %edx,%r10d
   18829:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18830:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   18836:	45 29 d3             	sub    %r10d,%r11d
   18839:	85 d2                	test   %edx,%edx
   1883b:	4d 0f 49 d9          	cmovns %r9,%r11
   1883f:	41 89 f9             	mov    %edi,%r9d
   18842:	45 09 c1             	or     %r8d,%r9d
   18845:	41 89 fa             	mov    %edi,%r10d
   18848:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1884f:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   18854:	44 29 d3             	sub    %r10d,%ebx
   18857:	85 ff                	test   %edi,%edi
   18859:	49 0f 49 d9          	cmovns %r9,%rbx
   1885d:	41 39 db             	cmp    %ebx,%r11d
   18860:	0f 47 d7             	cmova  %edi,%edx
   18863:	89 f7                	mov    %esi,%edi
   18865:	44 09 c7             	or     %r8d,%edi
   18868:	41 89 f1             	mov    %esi,%r9d
   1886b:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18872:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18878:	45 29 ca             	sub    %r9d,%r10d
   1887b:	85 f6                	test   %esi,%esi
   1887d:	4c 0f 49 d7          	cmovns %rdi,%r10
   18881:	89 cf                	mov    %ecx,%edi
   18883:	44 09 c7             	or     %r8d,%edi
   18886:	41 89 c9             	mov    %ecx,%r9d
   18889:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18890:	45 29 c8             	sub    %r9d,%r8d
   18893:	85 c9                	test   %ecx,%ecx
   18895:	4c 0f 49 c7          	cmovns %rdi,%r8
   18899:	45 39 c2             	cmp    %r8d,%r10d
   1889c:	0f 42 f1             	cmovb  %ecx,%esi
   1889f:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   188a5:	89 f1                	mov    %esi,%ecx
   188a7:	89 d7                	mov    %edx,%edi
   188a9:	5b                   	pop    %rbx
   188aa:	44 89 00             	mov    %r8d,(%rax)
   188ad:	89 78 04             	mov    %edi,0x4(%rax)
   188b0:	89 48 08             	mov    %ecx,0x8(%rax)
   188b3:	c3                   	ret
   188b4:	89 f1                	mov    %esi,%ecx
   188b6:	89 d7                	mov    %edx,%edi
   188b8:	45 89 c8             	mov    %r9d,%r8d
   188bb:	44 89 00             	mov    %r8d,(%rax)
   188be:	89 78 04             	mov    %edi,0x4(%rax)
   188c1:	89 48 08             	mov    %ecx,0x8(%rax)
   188c4:	c3                   	ret
   188c5:	cc                   	int3
   188c6:	cc                   	int3
   188c7:	cc                   	int3
   188c8:	cc                   	int3
   188c9:	cc                   	int3
   188ca:	cc                   	int3
   188cb:	cc                   	int3
   188cc:	cc                   	int3
   188cd:	cc                   	int3
   188ce:	cc                   	int3
   188cf:	cc                   	int3

hyperinterval::float::F32Enclosure::point:
   188d0:	53                   	push   %rbx
   188d1:	48 83 ec 10          	sub    $0x10,%rsp
   188d5:	48 89 fb             	mov    %rdi,%rbx
   188d8:	66 0f 7e c1          	movd   %xmm0,%ecx
   188dc:	48 89 e7             	mov    %rsp,%rdi
   188df:	be 00 00 00 80       	mov    $0x80000000,%esi
   188e4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   188e9:	e8 a2 39 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   188ee:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   188f2:	75 0f                	jne    18903 <hyperinterval::float::F32Enclosure::point+0x33>
   188f4:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   188f9:	88 43 04             	mov    %al,0x4(%rbx)
   188fc:	b8 02 00 00 00       	mov    $0x2,%eax
   18901:	eb 0f                	jmp    18912 <hyperinterval::float::F32Enclosure::point+0x42>
   18903:	8b 44 24 08          	mov    0x8(%rsp),%eax
   18907:	89 43 04             	mov    %eax,0x4(%rbx)
   1890a:	89 43 08             	mov    %eax,0x8(%rbx)
   1890d:	b8 01 00 00 00       	mov    $0x1,%eax
   18912:	89 03                	mov    %eax,(%rbx)
   18914:	48 89 d8             	mov    %rbx,%rax
   18917:	48 83 c4 10          	add    $0x10,%rsp
   1891b:	5b                   	pop    %rbx
   1891c:	c3                   	ret
   1891d:	cc                   	int3
   1891e:	cc                   	int3
   1891f:	cc                   	int3

hyperinterval::float::F32Enclosure::signs:
   18920:	83 3f 01             	cmpl   $0x1,(%rdi)
   18923:	75 65                	jne    1898a <hyperinterval::float::F32Enclosure::signs+0x6a>
   18925:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   1892a:	8b 57 04             	mov    0x4(%rdi),%edx
   1892d:	8b 47 08             	mov    0x8(%rdi),%eax
   18930:	48 89 d6             	mov    %rdx,%rsi
   18933:	48 09 ce             	or     %rcx,%rsi
   18936:	41 89 d0             	mov    %edx,%r8d
   18939:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18940:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18945:	4c 29 c7             	sub    %r8,%rdi
   18948:	85 d2                	test   %edx,%edx
   1894a:	48 0f 49 fe          	cmovns %rsi,%rdi
   1894e:	31 f6                	xor    %esi,%esi
   18950:	f7 c7 00 00 00 80    	test   $0x80000000,%edi
   18956:	0f 94 c2             	sete   %dl
   18959:	48 39 cf             	cmp    %rcx,%rdi
   1895c:	77 1d                	ja     1897b <hyperinterval::float::F32Enclosure::signs+0x5b>
   1895e:	39 cf                	cmp    %ecx,%edi
   18960:	0f 92 c1             	setb   %cl
   18963:	80 c9 02             	or     $0x2,%cl
   18966:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   1896b:	0f b6 c9             	movzbl %cl,%ecx
   1896e:	40 88 d6             	mov    %dl,%sil
   18971:	0f 44 f1             	cmove  %ecx,%esi
   18974:	85 c0                	test   %eax,%eax
   18976:	0f 49 f1             	cmovns %ecx,%esi
   18979:	89 f2                	mov    %esi,%edx
   1897b:	8d 4a 04             	lea    0x4(%rdx),%ecx
   1897e:	85 c0                	test   %eax,%eax
   18980:	0f b6 d2             	movzbl %dl,%edx
   18983:	0f b6 c1             	movzbl %cl,%eax
   18986:	0f 4e c2             	cmovle %edx,%eax
   18989:	c3                   	ret
   1898a:	31 c0                	xor    %eax,%eax
   1898c:	c3                   	ret
   1898d:	cc                   	int3
   1898e:	cc                   	int3
   1898f:	cc                   	int3

hyperinterval::float::F32Enclosure::affine:
   18990:	55                   	push   %rbp
   18991:	41 57                	push   %r15
   18993:	41 56                	push   %r14
   18995:	41 55                	push   %r13
   18997:	41 54                	push   %r12
   18999:	53                   	push   %rbx
   1899a:	48 83 ec 28          	sub    $0x28,%rsp
   1899e:	f3 0f 11 4c 24 20    	movss  %xmm1,0x20(%rsp)
   189a4:	49 89 f7             	mov    %rsi,%r15
   189a7:	48 89 fb             	mov    %rdi,%rbx
   189aa:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   189b0:	66 0f 7e c1          	movd   %xmm0,%ecx
   189b4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   189b9:	be 00 00 00 80       	mov    $0x80000000,%esi
   189be:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   189c3:	e8 c8 38 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   189c8:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   189cd:	74 2a                	je     189f9 <hyperinterval::float::F32Enclosure::affine+0x69>
   189cf:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   189d4:	66 0f 6e 44 24 20    	movd   0x20(%rsp),%xmm0
   189da:	66 0f 7e c1          	movd   %xmm0,%ecx
   189de:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   189e3:	be 00 00 00 80       	mov    $0x80000000,%esi
   189e8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   189ed:	e8 9e 38 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   189f2:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   189f7:	75 20                	jne    18a19 <hyperinterval::float::F32Enclosure::affine+0x89>
   189f9:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   189fe:	88 43 04             	mov    %al,0x4(%rbx)
   18a01:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18a07:	48 89 d8             	mov    %rbx,%rax
   18a0a:	48 83 c4 28          	add    $0x28,%rsp
   18a0e:	5b                   	pop    %rbx
   18a0f:	41 5c                	pop    %r12
   18a11:	41 5d                	pop    %r13
   18a13:	41 5e                	pop    %r14
   18a15:	41 5f                	pop    %r15
   18a17:	5d                   	pop    %rbp
   18a18:	c3                   	ret
   18a19:	41 f6 07 01          	testb  $0x1,(%r15)
   18a1d:	0f 84 19 01 00 00    	je     18b3c <hyperinterval::float::F32Enclosure::affine+0x1ac>
   18a23:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   18a28:	41 8b 4f 04          	mov    0x4(%r15),%ecx
   18a2c:	45 8b 7f 08          	mov    0x8(%r15),%r15d
   18a30:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18a35:	be 00 00 00 80       	mov    $0x80000000,%esi
   18a3a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18a3f:	4d 89 f0             	mov    %r14,%r8
   18a42:	4d 89 e1             	mov    %r12,%r9
   18a45:	e8 56 34 00 00       	call   1bea0 <hyperinterval::ieee::Format::affine>
   18a4a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18a4f:	74 a8                	je     189f9 <hyperinterval::float::F32Enclosure::affine+0x69>
   18a51:	8b 6c 24 10          	mov    0x10(%rsp),%ebp
   18a55:	8b 44 24 18          	mov    0x18(%rsp),%eax
   18a59:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   18a5e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18a63:	be 00 00 00 80       	mov    $0x80000000,%esi
   18a68:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18a6d:	4c 89 f9             	mov    %r15,%rcx
   18a70:	4d 89 f0             	mov    %r14,%r8
   18a73:	4d 89 e1             	mov    %r12,%r9
   18a76:	e8 25 34 00 00       	call   1bea0 <hyperinterval::ieee::Format::affine>
   18a7b:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18a80:	0f 84 73 ff ff ff    	je     189f9 <hyperinterval::float::F32Enclosure::affine+0x69>
   18a86:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   18a8b:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
   18a90:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18a95:	be 00 00 00 80       	mov    $0x80000000,%esi
   18a9a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18a9f:	48 89 e9             	mov    %rbp,%rcx
   18aa2:	e8 e9 37 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   18aa7:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18aac:	0f 84 47 ff ff ff    	je     189f9 <hyperinterval::float::F32Enclosure::affine+0x69>
   18ab2:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   18ab7:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18abc:	be 00 00 00 80       	mov    $0x80000000,%esi
   18ac1:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18ac6:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   18acb:	e8 c0 37 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   18ad0:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18ad5:	0f 84 1e ff ff ff    	je     189f9 <hyperinterval::float::F32Enclosure::affine+0x69>
   18adb:	8b 6c 24 10          	mov    0x10(%rsp),%ebp
   18adf:	44 89 f0             	mov    %r14d,%eax
   18ae2:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18ae7:	89 e9                	mov    %ebp,%ecx
   18ae9:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18aef:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18af4:	29 c2                	sub    %eax,%edx
   18af6:	44 09 e8             	or     %r13d,%eax
   18af9:	45 85 f6             	test   %r14d,%r14d
   18afc:	48 0f 49 d0          	cmovns %rax,%rdx
   18b00:	89 c8                	mov    %ecx,%eax
   18b02:	44 09 e8             	or     %r13d,%eax
   18b05:	41 29 cd             	sub    %ecx,%r13d
   18b08:	85 ed                	test   %ebp,%ebp
   18b0a:	4c 0f 49 e8          	cmovns %rax,%r13
   18b0e:	b0 01                	mov    $0x1,%al
   18b10:	44 39 ea             	cmp    %r13d,%edx
   18b13:	0f 87 e5 fe ff ff    	ja     189fe <hyperinterval::float::F32Enclosure::affine+0x6e>
   18b19:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18b1e:	4c 89 fe             	mov    %r15,%rsi
   18b21:	4c 89 e2             	mov    %r12,%rdx
   18b24:	e8 37 06 00 00       	call   19160 <hyperinterval::float::F32Enclosure::from_bits>
   18b29:	8b 44 24 08          	mov    0x8(%rsp),%eax
   18b2d:	83 f8 02             	cmp    $0x2,%eax
   18b30:	75 15                	jne    18b47 <hyperinterval::float::F32Enclosure::affine+0x1b7>
   18b32:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   18b37:	e9 c2 fe ff ff       	jmp    189fe <hyperinterval::float::F32Enclosure::affine+0x6e>
   18b3c:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   18b42:	e9 c0 fe ff ff       	jmp    18a07 <hyperinterval::float::F32Enclosure::affine+0x77>
   18b47:	83 f8 01             	cmp    $0x1,%eax
   18b4a:	75 17                	jne    18b63 <hyperinterval::float::F32Enclosure::affine+0x1d3>
   18b4c:	8b 54 24 0c          	mov    0xc(%rsp),%edx
   18b50:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   18b54:	44 89 f7             	mov    %r14d,%edi
   18b57:	89 ee                	mov    %ebp,%esi
   18b59:	e8 82 3a 00 00       	call   1c5e0 <hyperinterval::bounds::Bounds<T>::hull>
   18b5e:	41 89 c6             	mov    %eax,%r14d
   18b61:	89 d5                	mov    %edx,%ebp
   18b63:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   18b69:	44 89 73 04          	mov    %r14d,0x4(%rbx)
   18b6d:	89 6b 08             	mov    %ebp,0x8(%rbx)
   18b70:	e9 92 fe ff ff       	jmp    18a07 <hyperinterval::float::F32Enclosure::affine+0x77>
   18b75:	cc                   	int3
   18b76:	cc                   	int3
   18b77:	cc                   	int3
   18b78:	cc                   	int3
   18b79:	cc                   	int3
   18b7a:	cc                   	int3
   18b7b:	cc                   	int3
   18b7c:	cc                   	int3
   18b7d:	cc                   	int3
   18b7e:	cc                   	int3
   18b7f:	cc                   	int3

hyperinterval::float::F32Enclosure::square:
   18b80:	55                   	push   %rbp
   18b81:	41 57                	push   %r15
   18b83:	41 56                	push   %r14
   18b85:	41 55                	push   %r13
   18b87:	41 54                	push   %r12
   18b89:	53                   	push   %rbx
   18b8a:	48 83 ec 48          	sub    $0x48,%rsp
   18b8e:	48 89 fb             	mov    %rdi,%rbx
   18b91:	f6 06 01             	testb  $0x1,(%rsi)
   18b94:	0f 84 d8 00 00 00    	je     18c72 <hyperinterval::float::F32Enclosure::square+0xf2>
   18b9a:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
   18b9e:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   18ba2:	44 89 f8             	mov    %r15d,%eax
   18ba5:	c1 e8 17             	shr    $0x17,%eax
   18ba8:	0f b6 c8             	movzbl %al,%ecx
   18bab:	44 89 fa             	mov    %r15d,%edx
   18bae:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
   18bb4:	31 c0                	xor    %eax,%eax
   18bb6:	85 c9                	test   %ecx,%ecx
   18bb8:	8d 8c 09 d4 fe ff ff 	lea    -0x12c(%rcx,%rcx,1),%ecx
   18bbf:	41 bc d6 fe ff ff    	mov    $0xfffffed6,%r12d
   18bc5:	41 0f 44 cc          	cmove  %r12d,%ecx
   18bc9:	0f 95 c0             	setne  %al
   18bcc:	c1 e0 17             	shl    $0x17,%eax
   18bcf:	48 09 d0             	or     %rdx,%rax
   18bd2:	48 f7 e0             	mul    %rax
   18bd5:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   18bda:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   18bdf:	48 89 04 24          	mov    %rax,(%rsp)
   18be3:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   18be7:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   18bec:	48 89 e1             	mov    %rsp,%rcx
   18bef:	be 00 00 00 80       	mov    $0x80000000,%esi
   18bf4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18bf9:	e8 d2 36 00 00       	call   1c2d0 <hyperinterval::ieee::Format::rounded>
   18bfe:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   18c03:	75 66                	jne    18c6b <hyperinterval::float::F32Enclosure::square+0xeb>
   18c05:	44 8b 6c 24 38       	mov    0x38(%rsp),%r13d
   18c0a:	8b 6c 24 40          	mov    0x40(%rsp),%ebp
   18c0e:	44 89 f0             	mov    %r14d,%eax
   18c11:	c1 e8 17             	shr    $0x17,%eax
   18c14:	0f b6 c8             	movzbl %al,%ecx
   18c17:	44 89 f2             	mov    %r14d,%edx
   18c1a:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
   18c20:	31 c0                	xor    %eax,%eax
   18c22:	85 c9                	test   %ecx,%ecx
   18c24:	8d 8c 09 d4 fe ff ff 	lea    -0x12c(%rcx,%rcx,1),%ecx
   18c2b:	41 0f 44 cc          	cmove  %r12d,%ecx
   18c2f:	0f 95 c0             	setne  %al
   18c32:	c1 e0 17             	shl    $0x17,%eax
   18c35:	48 09 d0             	or     %rdx,%rax
   18c38:	48 f7 e0             	mul    %rax
   18c3b:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   18c40:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   18c45:	48 89 04 24          	mov    %rax,(%rsp)
   18c49:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   18c4d:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   18c52:	48 89 e1             	mov    %rsp,%rcx
   18c55:	be 00 00 00 80       	mov    $0x80000000,%esi
   18c5a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18c5f:	e8 6c 36 00 00       	call   1c2d0 <hyperinterval::ieee::Format::rounded>
   18c64:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   18c69:	75 0f                	jne    18c7a <hyperinterval::float::F32Enclosure::square+0xfa>
   18c6b:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   18c70:	eb 59                	jmp    18ccb <hyperinterval::float::F32Enclosure::square+0x14b>
   18c72:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   18c78:	eb 5a                	jmp    18cd4 <hyperinterval::float::F32Enclosure::square+0x154>
   18c7a:	8b 44 24 38          	mov    0x38(%rsp),%eax
   18c7e:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   18c83:	44 8b 64 24 40       	mov    0x40(%rsp),%r12d
   18c88:	48 89 e7             	mov    %rsp,%rdi
   18c8b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18c90:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18c95:	4c 89 e9             	mov    %r13,%rcx
   18c98:	e8 f3 35 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   18c9d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18ca1:	74 23                	je     18cc6 <hyperinterval::float::F32Enclosure::square+0x146>
   18ca3:	4d 89 e5             	mov    %r12,%r13
   18ca6:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   18cab:	48 89 e7             	mov    %rsp,%rdi
   18cae:	be 00 00 00 80       	mov    $0x80000000,%esi
   18cb3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18cb8:	48 89 e9             	mov    %rbp,%rcx
   18cbb:	e8 d0 35 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   18cc0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18cc4:	75 20                	jne    18ce6 <hyperinterval::float::F32Enclosure::square+0x166>
   18cc6:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   18ccb:	88 43 04             	mov    %al,0x4(%rbx)
   18cce:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18cd4:	48 89 d8             	mov    %rbx,%rax
   18cd7:	48 83 c4 48          	add    $0x48,%rsp
   18cdb:	5b                   	pop    %rbx
   18cdc:	41 5c                	pop    %r12
   18cde:	41 5d                	pop    %r13
   18ce0:	41 5e                	pop    %r14
   18ce2:	41 5f                	pop    %r15
   18ce4:	5d                   	pop    %rbp
   18ce5:	c3                   	ret
   18ce6:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   18cea:	44 89 e0             	mov    %r12d,%eax
   18ced:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18cf2:	89 e9                	mov    %ebp,%ecx
   18cf4:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18cfa:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18cff:	29 c2                	sub    %eax,%edx
   18d01:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18d06:	09 f8                	or     %edi,%eax
   18d08:	45 85 e4             	test   %r12d,%r12d
   18d0b:	48 0f 49 d0          	cmovns %rax,%rdx
   18d0f:	be 00 00 00 80       	mov    $0x80000000,%esi
   18d14:	29 ce                	sub    %ecx,%esi
   18d16:	89 c8                	mov    %ecx,%eax
   18d18:	09 f8                	or     %edi,%eax
   18d1a:	85 ed                	test   %ebp,%ebp
   18d1c:	48 0f 49 f0          	cmovns %rax,%rsi
   18d20:	b0 01                	mov    $0x1,%al
   18d22:	39 f2                	cmp    %esi,%edx
   18d24:	77 a5                	ja     18ccb <hyperinterval::float::F32Enclosure::square+0x14b>
   18d26:	48 89 e7             	mov    %rsp,%rdi
   18d29:	be 00 00 00 80       	mov    $0x80000000,%esi
   18d2e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18d33:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   18d38:	e8 53 35 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   18d3d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18d41:	74 83                	je     18cc6 <hyperinterval::float::F32Enclosure::square+0x146>
   18d43:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   18d48:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   18d4d:	48 89 e7             	mov    %rsp,%rdi
   18d50:	be 00 00 00 80       	mov    $0x80000000,%esi
   18d55:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18d5a:	4c 89 e9             	mov    %r13,%rcx
   18d5d:	e8 2e 35 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   18d62:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18d66:	0f 84 5a ff ff ff    	je     18cc6 <hyperinterval::float::F32Enclosure::square+0x146>
   18d6c:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18d70:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   18d75:	89 d0                	mov    %edx,%eax
   18d77:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18d7c:	41 89 c8             	mov    %ecx,%r8d
   18d7f:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18d86:	be 00 00 00 80       	mov    $0x80000000,%esi
   18d8b:	29 c6                	sub    %eax,%esi
   18d8d:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18d92:	09 f8                	or     %edi,%eax
   18d94:	85 d2                	test   %edx,%edx
   18d96:	48 0f 49 f0          	cmovns %rax,%rsi
   18d9a:	44 89 c0             	mov    %r8d,%eax
   18d9d:	09 f8                	or     %edi,%eax
   18d9f:	44 29 c7             	sub    %r8d,%edi
   18da2:	85 c9                	test   %ecx,%ecx
   18da4:	48 0f 49 f8          	cmovns %rax,%rdi
   18da8:	b0 01                	mov    $0x1,%al
   18daa:	39 fe                	cmp    %edi,%esi
   18dac:	0f 87 19 ff ff ff    	ja     18ccb <hyperinterval::float::F32Enclosure::square+0x14b>
   18db2:	44 89 e7             	mov    %r12d,%edi
   18db5:	89 ee                	mov    %ebp,%esi
   18db7:	e8 24 38 00 00       	call   1c5e0 <hyperinterval::bounds::Bounds<T>::hull>
   18dbc:	41 89 c4             	mov    %eax,%r12d
   18dbf:	89 d5                	mov    %edx,%ebp
   18dc1:	44 89 ff             	mov    %r15d,%edi
   18dc4:	44 89 f6             	mov    %r14d,%esi
   18dc7:	31 d2                	xor    %edx,%edx
   18dc9:	e8 c2 39 00 00       	call   1c790 <hyperinterval::bounds::Bounds<T>::signs>
   18dce:	a8 02                	test   $0x2,%al
   18dd0:	75 12                	jne    18de4 <hyperinterval::float::F32Enclosure::square+0x264>
   18dd2:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   18dd8:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   18ddc:	89 6b 08             	mov    %ebp,0x8(%rbx)
   18ddf:	e9 f0 fe ff ff       	jmp    18cd4 <hyperinterval::float::F32Enclosure::square+0x154>
   18de4:	48 89 e7             	mov    %rsp,%rdi
   18de7:	31 f6                	xor    %esi,%esi
   18de9:	31 d2                	xor    %edx,%edx
   18deb:	e8 70 03 00 00       	call   19160 <hyperinterval::float::F32Enclosure::from_bits>
   18df0:	8b 04 24             	mov    (%rsp),%eax
   18df3:	83 f8 02             	cmp    $0x2,%eax
   18df6:	75 0a                	jne    18e02 <hyperinterval::float::F32Enclosure::square+0x282>
   18df8:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   18dfd:	e9 c9 fe ff ff       	jmp    18ccb <hyperinterval::float::F32Enclosure::square+0x14b>
   18e02:	83 f8 01             	cmp    $0x1,%eax
   18e05:	75 cb                	jne    18dd2 <hyperinterval::float::F32Enclosure::square+0x252>
   18e07:	8b 54 24 04          	mov    0x4(%rsp),%edx
   18e0b:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18e0f:	44 89 e7             	mov    %r12d,%edi
   18e12:	89 ee                	mov    %ebp,%esi
   18e14:	e8 c7 37 00 00       	call   1c5e0 <hyperinterval::bounds::Bounds<T>::hull>
   18e19:	41 89 c4             	mov    %eax,%r12d
   18e1c:	89 d5                	mov    %edx,%ebp
   18e1e:	eb b2                	jmp    18dd2 <hyperinterval::float::F32Enclosure::square+0x252>

hyperinterval::float::F32Enclosure::next_up:
   18e20:	48 83 ec 18          	sub    $0x18,%rsp
   18e24:	66 0f 7e c1          	movd   %xmm0,%ecx
   18e28:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18e2d:	be 00 00 00 80       	mov    $0x80000000,%esi
   18e32:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18e37:	e8 54 34 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   18e3c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18e41:	75 10                	jne    18e53 <hyperinterval::float::F32Enclosure::next_up+0x33>
   18e43:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   18e48:	c1 e0 08             	shl    $0x8,%eax
   18e4b:	48 ff c0             	inc    %rax
   18e4e:	48 83 c4 18          	add    $0x18,%rsp
   18e52:	c3                   	ret
   18e53:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   18e58:	31 c9                	xor    %ecx,%ecx
   18e5a:	85 c0                	test   %eax,%eax
   18e5c:	0f 99 c1             	setns  %cl
   18e5f:	48 8d 0c 48          	lea    (%rax,%rcx,2),%rcx
   18e63:	48 ff c9             	dec    %rcx
   18e66:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18e6b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18e70:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18e75:	e8 16 34 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   18e7a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18e7f:	75 0a                	jne    18e8b <hyperinterval::float::F32Enclosure::next_up+0x6b>
   18e81:	b8 01 03 00 00       	mov    $0x301,%eax
   18e86:	48 83 c4 18          	add    $0x18,%rsp
   18e8a:	c3                   	ret
   18e8b:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   18e90:	48 c1 e0 20          	shl    $0x20,%rax
   18e94:	48 83 c4 18          	add    $0x18,%rsp
   18e98:	c3                   	ret
   18e99:	cc                   	int3
   18e9a:	cc                   	int3
   18e9b:	cc                   	int3
   18e9c:	cc                   	int3
   18e9d:	cc                   	int3
   18e9e:	cc                   	int3
   18e9f:	cc                   	int3

hyperinterval::float::F32Enclosure::disjoint:
   18ea0:	83 3f 00             	cmpl   $0x0,(%rdi)
   18ea3:	b0 01                	mov    $0x1,%al
   18ea5:	0f 84 a3 00 00 00    	je     18f4e <hyperinterval::float::F32Enclosure::disjoint+0xae>
   18eab:	8b 0e                	mov    (%rsi),%ecx
   18ead:	85 c9                	test   %ecx,%ecx
   18eaf:	0f 84 99 00 00 00    	je     18f4e <hyperinterval::float::F32Enclosure::disjoint+0xae>
   18eb5:	f6 c1 01             	test   $0x1,%cl
   18eb8:	74 4c                	je     18f06 <hyperinterval::float::F32Enclosure::disjoint+0x66>
   18eba:	53                   	push   %rbx
   18ebb:	8b 56 04             	mov    0x4(%rsi),%edx
   18ebe:	44 8b 47 08          	mov    0x8(%rdi),%r8d
   18ec2:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   18ec8:	45 89 c2             	mov    %r8d,%r10d
   18ecb:	45 09 ca             	or     %r9d,%r10d
   18ece:	45 89 c3             	mov    %r8d,%r11d
   18ed1:	41 81 e3 ff ff ff 7f 	and    $0x7fffffff,%r11d
   18ed8:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   18edd:	44 29 db             	sub    %r11d,%ebx
   18ee0:	45 85 c0             	test   %r8d,%r8d
   18ee3:	49 0f 49 da          	cmovns %r10,%rbx
   18ee7:	41 89 d0             	mov    %edx,%r8d
   18eea:	45 09 c8             	or     %r9d,%r8d
   18eed:	41 89 d2             	mov    %edx,%r10d
   18ef0:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18ef7:	45 29 d1             	sub    %r10d,%r9d
   18efa:	85 d2                	test   %edx,%edx
   18efc:	4d 0f 49 c8          	cmovns %r8,%r9
   18f00:	44 39 cb             	cmp    %r9d,%ebx
   18f03:	5b                   	pop    %rbx
   18f04:	72 48                	jb     18f4e <hyperinterval::float::F32Enclosure::disjoint+0xae>
   18f06:	f6 c1 01             	test   $0x1,%cl
   18f09:	75 03                	jne    18f0e <hyperinterval::float::F32Enclosure::disjoint+0x6e>
   18f0b:	31 c0                	xor    %eax,%eax
   18f0d:	c3                   	ret
   18f0e:	8b 47 04             	mov    0x4(%rdi),%eax
   18f11:	8b 4e 08             	mov    0x8(%rsi),%ecx
   18f14:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18f19:	89 ce                	mov    %ecx,%esi
   18f1b:	09 d6                	or     %edx,%esi
   18f1d:	89 cf                	mov    %ecx,%edi
   18f1f:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18f25:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18f2b:	41 29 f8             	sub    %edi,%r8d
   18f2e:	85 c9                	test   %ecx,%ecx
   18f30:	4c 0f 49 c6          	cmovns %rsi,%r8
   18f34:	89 c1                	mov    %eax,%ecx
   18f36:	09 d1                	or     %edx,%ecx
   18f38:	89 c6                	mov    %eax,%esi
   18f3a:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18f40:	29 f2                	sub    %esi,%edx
   18f42:	85 c0                	test   %eax,%eax
   18f44:	48 0f 49 d1          	cmovns %rcx,%rdx
   18f48:	41 39 d0             	cmp    %edx,%r8d
   18f4b:	0f 92 c0             	setb   %al
   18f4e:	c3                   	ret
   18f4f:	cc                   	int3

hyperinterval::float::F32Enclosure::expanded:
   18f50:	41 57                	push   %r15
   18f52:	41 56                	push   %r14
   18f54:	41 54                	push   %r12
   18f56:	53                   	push   %rbx
   18f57:	48 83 ec 18          	sub    $0x18,%rsp
   18f5b:	48 89 fb             	mov    %rdi,%rbx
   18f5e:	f6 06 01             	testb  $0x1,(%rsi)
   18f61:	74 7c                	je     18fdf <hyperinterval::float::F32Enclosure::expanded+0x8f>
   18f63:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   18f69:	8b 46 04             	mov    0x4(%rsi),%eax
   18f6c:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   18f70:	8d 88 00 00 00 80    	lea    -0x80000000(%rax),%ecx
   18f76:	85 c0                	test   %eax,%eax
   18f78:	0f 44 c8             	cmove  %eax,%ecx
   18f7b:	31 c0                	xor    %eax,%eax
   18f7d:	85 c9                	test   %ecx,%ecx
   18f7f:	0f 99 c0             	setns  %al
   18f82:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
   18f86:	48 ff c9             	dec    %rcx
   18f89:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18f8e:	be 00 00 00 80       	mov    $0x80000000,%esi
   18f93:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18f98:	e8 f3 32 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   18f9d:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   18fa2:	75 2f                	jne    18fd3 <hyperinterval::float::F32Enclosure::expanded+0x83>
   18fa4:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   18fa9:	31 c0                	xor    %eax,%eax
   18fab:	45 85 f6             	test   %r14d,%r14d
   18fae:	0f 99 c0             	setns  %al
   18fb1:	49 8d 0c 46          	lea    (%r14,%rax,2),%rcx
   18fb5:	48 ff c9             	dec    %rcx
   18fb8:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18fbd:	be 00 00 00 80       	mov    $0x80000000,%esi
   18fc2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18fc7:	e8 c4 32 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   18fcc:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18fd1:	75 21                	jne    18ff4 <hyperinterval::float::F32Enclosure::expanded+0xa4>
   18fd3:	c6 43 04 03          	movb   $0x3,0x4(%rbx)
   18fd7:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18fdd:	eb 06                	jmp    18fe5 <hyperinterval::float::F32Enclosure::expanded+0x95>
   18fdf:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   18fe5:	48 89 d8             	mov    %rbx,%rax
   18fe8:	48 83 c4 18          	add    $0x18,%rsp
   18fec:	5b                   	pop    %rbx
   18fed:	41 5c                	pop    %r12
   18fef:	41 5e                	pop    %r14
   18ff1:	41 5f                	pop    %r15
   18ff3:	c3                   	ret
   18ff4:	44 89 e1             	mov    %r12d,%ecx
   18ff7:	4c 31 f9             	xor    %r15,%rcx
   18ffa:	4d 85 e4             	test   %r12,%r12
   18ffd:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   19002:	49 0f 44 cc          	cmove  %r12,%rcx
   19006:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1900b:	be 00 00 00 80       	mov    $0x80000000,%esi
   19010:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19015:	e8 76 32 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1901a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1901f:	74 23                	je     19044 <hyperinterval::float::F32Enclosure::expanded+0xf4>
   19021:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   19026:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1902b:	be 00 00 00 80       	mov    $0x80000000,%esi
   19030:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19035:	4c 89 f1             	mov    %r14,%rcx
   19038:	e8 53 32 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1903d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19042:	75 10                	jne    19054 <hyperinterval::float::F32Enclosure::expanded+0x104>
   19044:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   19049:	88 43 04             	mov    %al,0x4(%rbx)
   1904c:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19052:	eb 91                	jmp    18fe5 <hyperinterval::float::F32Enclosure::expanded+0x95>
   19054:	8b 44 24 10          	mov    0x10(%rsp),%eax
   19058:	44 89 e1             	mov    %r12d,%ecx
   1905b:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19061:	89 c2                	mov    %eax,%edx
   19063:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19069:	be 00 00 00 80       	mov    $0x80000000,%esi
   1906e:	29 ce                	sub    %ecx,%esi
   19070:	44 09 f9             	or     %r15d,%ecx
   19073:	45 85 e4             	test   %r12d,%r12d
   19076:	48 0f 49 f1          	cmovns %rcx,%rsi
   1907a:	89 d1                	mov    %edx,%ecx
   1907c:	44 09 f9             	or     %r15d,%ecx
   1907f:	41 29 d7             	sub    %edx,%r15d
   19082:	85 c0                	test   %eax,%eax
   19084:	4c 0f 49 f9          	cmovns %rcx,%r15
   19088:	44 39 fe             	cmp    %r15d,%esi
   1908b:	76 0f                	jbe    1909c <hyperinterval::float::F32Enclosure::expanded+0x14c>
   1908d:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   19091:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19097:	e9 49 ff ff ff       	jmp    18fe5 <hyperinterval::float::F32Enclosure::expanded+0x95>
   1909c:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   190a2:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   190a6:	89 43 08             	mov    %eax,0x8(%rbx)
   190a9:	e9 37 ff ff ff       	jmp    18fe5 <hyperinterval::float::F32Enclosure::expanded+0x95>
   190ae:	cc                   	int3
   190af:	cc                   	int3

hyperinterval::float::F32Enclosure::overlaps:
   190b0:	31 c0                	xor    %eax,%eax
   190b2:	83 3f 00             	cmpl   $0x0,(%rdi)
   190b5:	0f 84 a1 00 00 00    	je     1915c <hyperinterval::float::F32Enclosure::overlaps+0xac>
   190bb:	8b 0e                	mov    (%rsi),%ecx
   190bd:	85 c9                	test   %ecx,%ecx
   190bf:	0f 84 97 00 00 00    	je     1915c <hyperinterval::float::F32Enclosure::overlaps+0xac>
   190c5:	f6 c1 01             	test   $0x1,%cl
   190c8:	74 4b                	je     19115 <hyperinterval::float::F32Enclosure::overlaps+0x65>
   190ca:	8b 46 04             	mov    0x4(%rsi),%eax
   190cd:	8b 57 08             	mov    0x8(%rdi),%edx
   190d0:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   190d6:	41 89 d1             	mov    %edx,%r9d
   190d9:	45 09 c1             	or     %r8d,%r9d
   190dc:	41 89 d2             	mov    %edx,%r10d
   190df:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   190e6:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   190ec:	45 29 d3             	sub    %r10d,%r11d
   190ef:	85 d2                	test   %edx,%edx
   190f1:	4d 0f 49 d9          	cmovns %r9,%r11
   190f5:	89 c2                	mov    %eax,%edx
   190f7:	44 09 c2             	or     %r8d,%edx
   190fa:	41 89 c1             	mov    %eax,%r9d
   190fd:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   19104:	45 29 c8             	sub    %r9d,%r8d
   19107:	85 c0                	test   %eax,%eax
   19109:	4c 0f 49 c2          	cmovns %rdx,%r8
   1910d:	45 39 c3             	cmp    %r8d,%r11d
   19110:	73 03                	jae    19115 <hyperinterval::float::F32Enclosure::overlaps+0x65>
   19112:	31 c0                	xor    %eax,%eax
   19114:	c3                   	ret
   19115:	b0 01                	mov    $0x1,%al
   19117:	f6 c1 01             	test   $0x1,%cl
   1911a:	74 40                	je     1915c <hyperinterval::float::F32Enclosure::overlaps+0xac>
   1911c:	8b 47 04             	mov    0x4(%rdi),%eax
   1911f:	8b 4e 08             	mov    0x8(%rsi),%ecx
   19122:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19127:	89 ce                	mov    %ecx,%esi
   19129:	09 d6                	or     %edx,%esi
   1912b:	89 cf                	mov    %ecx,%edi
   1912d:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   19133:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   19139:	41 29 f8             	sub    %edi,%r8d
   1913c:	85 c9                	test   %ecx,%ecx
   1913e:	4c 0f 49 c6          	cmovns %rsi,%r8
   19142:	89 c1                	mov    %eax,%ecx
   19144:	09 d1                	or     %edx,%ecx
   19146:	89 c6                	mov    %eax,%esi
   19148:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1914e:	29 f2                	sub    %esi,%edx
   19150:	85 c0                	test   %eax,%eax
   19152:	48 0f 49 d1          	cmovns %rcx,%rdx
   19156:	41 39 d0             	cmp    %edx,%r8d
   19159:	0f 93 c0             	setae  %al
   1915c:	c3                   	ret
   1915d:	cc                   	int3
   1915e:	cc                   	int3
   1915f:	cc                   	int3

hyperinterval::float::F32Enclosure::from_bits:
   19160:	41 57                	push   %r15
   19162:	41 56                	push   %r14
   19164:	41 54                	push   %r12
   19166:	53                   	push   %rbx
   19167:	48 83 ec 18          	sub    $0x18,%rsp
   1916b:	49 89 d6             	mov    %rdx,%r14
   1916e:	48 89 fb             	mov    %rdi,%rbx
   19171:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   19177:	89 f1                	mov    %esi,%ecx
   19179:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1917e:	be 00 00 00 80       	mov    $0x80000000,%esi
   19183:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19188:	e8 03 31 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1918d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19192:	74 23                	je     191b7 <hyperinterval::float::F32Enclosure::from_bits+0x57>
   19194:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   19199:	44 89 f1             	mov    %r14d,%ecx
   1919c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   191a1:	be 00 00 00 80       	mov    $0x80000000,%esi
   191a6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   191ab:	e8 e0 30 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   191b0:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   191b5:	75 1a                	jne    191d1 <hyperinterval::float::F32Enclosure::from_bits+0x71>
   191b7:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   191bc:	88 43 04             	mov    %al,0x4(%rbx)
   191bf:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   191c5:	48 83 c4 18          	add    $0x18,%rsp
   191c9:	5b                   	pop    %rbx
   191ca:	41 5c                	pop    %r12
   191cc:	41 5e                	pop    %r14
   191ce:	41 5f                	pop    %r15
   191d0:	c3                   	ret
   191d1:	8b 44 24 10          	mov    0x10(%rsp),%eax
   191d5:	44 89 e1             	mov    %r12d,%ecx
   191d8:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   191de:	89 c2                	mov    %eax,%edx
   191e0:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   191e6:	be 00 00 00 80       	mov    $0x80000000,%esi
   191eb:	29 ce                	sub    %ecx,%esi
   191ed:	44 09 f9             	or     %r15d,%ecx
   191f0:	45 85 e4             	test   %r12d,%r12d
   191f3:	48 0f 49 f1          	cmovns %rcx,%rsi
   191f7:	89 d1                	mov    %edx,%ecx
   191f9:	44 09 f9             	or     %r15d,%ecx
   191fc:	41 29 d7             	sub    %edx,%r15d
   191ff:	85 c0                	test   %eax,%eax
   19201:	4c 0f 49 f9          	cmovns %rcx,%r15
   19205:	44 39 fe             	cmp    %r15d,%esi
   19208:	76 06                	jbe    19210 <hyperinterval::float::F32Enclosure::from_bits+0xb0>
   1920a:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   1920e:	eb af                	jmp    191bf <hyperinterval::float::F32Enclosure::from_bits+0x5f>
   19210:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   19216:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   1921a:	89 43 08             	mov    %eax,0x8(%rbx)
   1921d:	eb a6                	jmp    191c5 <hyperinterval::float::F32Enclosure::from_bits+0x65>
   1921f:	cc                   	int3

hyperinterval::float::F32Enclosure::max_image:
   19220:	48 89 f8             	mov    %rdi,%rax
   19223:	31 c9                	xor    %ecx,%ecx
   19225:	f6 06 01             	testb  $0x1,(%rsi)
   19228:	0f 84 db 00 00 00    	je     19309 <hyperinterval::float::F32Enclosure::max_image+0xe9>
   1922e:	f6 02 01             	testb  $0x1,(%rdx)
   19231:	0f 84 ca 00 00 00    	je     19301 <hyperinterval::float::F32Enclosure::max_image+0xe1>
   19237:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   1923c:	f3 0f 7e 4e 04       	movq   0x4(%rsi),%xmm1
   19241:	66 0f ef d2          	pxor   %xmm2,%xmm2
   19245:	66 0f 6f e1          	movdqa %xmm1,%xmm4
   19249:	66 0f 62 e2          	punpckldq %xmm2,%xmm4
   1924d:	66 0f 6f e8          	movdqa %xmm0,%xmm5
   19251:	66 0f 62 ea          	punpckldq %xmm2,%xmm5
   19255:	66 0f 6f 1d 43 c8 fe 	movdqa -0x137bd(%rip),%xmm3        # 5aa0 <__abi_tag+0x57a4>
   1925c:	ff 
   1925d:	66 0f 6f f4          	movdqa %xmm4,%xmm6
   19261:	66 0f eb f3          	por    %xmm3,%xmm6
   19265:	66 0f 6f 3d 33 c6 fe 	movdqa -0x139cd(%rip),%xmm7        # 58a0 <__abi_tag+0x55a4>
   1926c:	ff 
   1926d:	66 0f db e7          	pand   %xmm7,%xmm4
   19271:	66 44 0f 6f c3       	movdqa %xmm3,%xmm8
   19276:	66 44 0f fb c4       	psubq  %xmm4,%xmm8
   1927b:	66 0f 70 e1 50       	pshufd $0x50,%xmm1,%xmm4
   19280:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
   19285:	66 44 0f 66 cc       	pcmpgtd %xmm4,%xmm9
   1928a:	66 45 0f db c1       	pand   %xmm9,%xmm8
   1928f:	66 44 0f df ce       	pandn  %xmm6,%xmm9
   19294:	66 45 0f eb c8       	por    %xmm8,%xmm9
   19299:	66 0f 6f e5          	movdqa %xmm5,%xmm4
   1929d:	66 0f eb e3          	por    %xmm3,%xmm4
   192a1:	66 0f db ef          	pand   %xmm7,%xmm5
   192a5:	66 0f 6f f3          	movdqa %xmm3,%xmm6
   192a9:	66 0f fb f5          	psubq  %xmm5,%xmm6
   192ad:	66 0f 70 e8 50       	pshufd $0x50,%xmm0,%xmm5
   192b2:	66 0f 66 d5          	pcmpgtd %xmm5,%xmm2
   192b6:	66 0f db f2          	pand   %xmm2,%xmm6
   192ba:	66 0f df d4          	pandn  %xmm4,%xmm2
   192be:	66 0f eb d6          	por    %xmm6,%xmm2
   192c2:	66 44 0f ef cb       	pxor   %xmm3,%xmm9
   192c7:	66 0f ef d3          	pxor   %xmm3,%xmm2
   192cb:	66 0f 6f da          	movdqa %xmm2,%xmm3
   192cf:	66 41 0f 66 d9       	pcmpgtd %xmm9,%xmm3
   192d4:	66 0f 70 e3 e8       	pshufd $0xe8,%xmm3,%xmm4
   192d9:	66 41 0f 76 d1       	pcmpeqd %xmm9,%xmm2
   192de:	66 0f 70 ea fd       	pshufd $0xfd,%xmm2,%xmm5
   192e3:	66 0f db ec          	pand   %xmm4,%xmm5
   192e7:	66 0f 70 d3 fd       	pshufd $0xfd,%xmm3,%xmm2
   192ec:	66 0f eb d5          	por    %xmm5,%xmm2
   192f0:	66 0f db c2          	pand   %xmm2,%xmm0
   192f4:	66 0f df d1          	pandn  %xmm1,%xmm2
   192f8:	66 0f eb d0          	por    %xmm0,%xmm2
   192fc:	b9 01 00 00 00       	mov    $0x1,%ecx
   19301:	89 08                	mov    %ecx,(%rax)
   19303:	66 0f d6 50 04       	movq   %xmm2,0x4(%rax)
   19308:	c3                   	ret
   19309:	89 08                	mov    %ecx,(%rax)
   1930b:	0f 13 50 04          	movlps %xmm2,0x4(%rax)
   1930f:	c3                   	ret

hyperinterval::float::F32Enclosure::min_image:
   19310:	48 89 f8             	mov    %rdi,%rax
   19313:	31 c9                	xor    %ecx,%ecx
   19315:	f6 06 01             	testb  $0x1,(%rsi)
   19318:	0f 84 dc 00 00 00    	je     193fa <hyperinterval::float::F32Enclosure::min_image+0xea>
   1931e:	f6 02 01             	testb  $0x1,(%rdx)
   19321:	0f 84 cb 00 00 00    	je     193f2 <hyperinterval::float::F32Enclosure::min_image+0xe2>
   19327:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   1932c:	f3 0f 7e 4e 04       	movq   0x4(%rsi),%xmm1
   19331:	66 0f ef d2          	pxor   %xmm2,%xmm2
   19335:	66 0f 6f e1          	movdqa %xmm1,%xmm4
   19339:	66 0f 62 e2          	punpckldq %xmm2,%xmm4
   1933d:	66 0f 6f e8          	movdqa %xmm0,%xmm5
   19341:	66 0f 62 ea          	punpckldq %xmm2,%xmm5
   19345:	66 0f 6f 1d 53 c7 fe 	movdqa -0x138ad(%rip),%xmm3        # 5aa0 <__abi_tag+0x57a4>
   1934c:	ff 
   1934d:	66 0f 6f f4          	movdqa %xmm4,%xmm6
   19351:	66 0f eb f3          	por    %xmm3,%xmm6
   19355:	66 0f 6f 3d 43 c5 fe 	movdqa -0x13abd(%rip),%xmm7        # 58a0 <__abi_tag+0x55a4>
   1935c:	ff 
   1935d:	66 0f db e7          	pand   %xmm7,%xmm4
   19361:	66 44 0f 6f c3       	movdqa %xmm3,%xmm8
   19366:	66 44 0f fb c4       	psubq  %xmm4,%xmm8
   1936b:	66 0f 70 e1 50       	pshufd $0x50,%xmm1,%xmm4
   19370:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
   19375:	66 44 0f 66 cc       	pcmpgtd %xmm4,%xmm9
   1937a:	66 45 0f db c1       	pand   %xmm9,%xmm8
   1937f:	66 44 0f df ce       	pandn  %xmm6,%xmm9
   19384:	66 45 0f eb c8       	por    %xmm8,%xmm9
   19389:	66 0f 6f e5          	movdqa %xmm5,%xmm4
   1938d:	66 0f eb e3          	por    %xmm3,%xmm4
   19391:	66 0f db ef          	pand   %xmm7,%xmm5
   19395:	66 0f 6f f3          	movdqa %xmm3,%xmm6
   19399:	66 0f fb f5          	psubq  %xmm5,%xmm6
   1939d:	66 0f 70 e8 50       	pshufd $0x50,%xmm0,%xmm5
   193a2:	66 0f 66 d5          	pcmpgtd %xmm5,%xmm2
   193a6:	66 0f db f2          	pand   %xmm2,%xmm6
   193aa:	66 0f df d4          	pandn  %xmm4,%xmm2
   193ae:	66 0f eb d6          	por    %xmm6,%xmm2
   193b2:	66 0f ef d3          	pxor   %xmm3,%xmm2
   193b6:	66 44 0f ef cb       	pxor   %xmm3,%xmm9
   193bb:	66 41 0f 6f d9       	movdqa %xmm9,%xmm3
   193c0:	66 0f 66 da          	pcmpgtd %xmm2,%xmm3
   193c4:	66 0f 70 e3 e8       	pshufd $0xe8,%xmm3,%xmm4
   193c9:	66 44 0f 76 ca       	pcmpeqd %xmm2,%xmm9
   193ce:	66 41 0f 70 e9 fd    	pshufd $0xfd,%xmm9,%xmm5
   193d4:	66 0f db ec          	pand   %xmm4,%xmm5
   193d8:	66 0f 70 d3 fd       	pshufd $0xfd,%xmm3,%xmm2
   193dd:	66 0f eb d5          	por    %xmm5,%xmm2
   193e1:	66 0f db c2          	pand   %xmm2,%xmm0
   193e5:	66 0f df d1          	pandn  %xmm1,%xmm2
   193e9:	66 0f eb d0          	por    %xmm0,%xmm2
   193ed:	b9 01 00 00 00       	mov    $0x1,%ecx
   193f2:	89 08                	mov    %ecx,(%rax)
   193f4:	66 0f d6 50 04       	movq   %xmm2,0x4(%rax)
   193f9:	c3                   	ret
   193fa:	89 08                	mov    %ecx,(%rax)
   193fc:	0f 13 50 04          	movlps %xmm2,0x4(%rax)
   19400:	c3                   	ret
   19401:	cc                   	int3
   19402:	cc                   	int3
   19403:	cc                   	int3
   19404:	cc                   	int3
   19405:	cc                   	int3
   19406:	cc                   	int3
   19407:	cc                   	int3
   19408:	cc                   	int3
   19409:	cc                   	int3
   1940a:	cc                   	int3
   1940b:	cc                   	int3
   1940c:	cc                   	int3
   1940d:	cc                   	int3
   1940e:	cc                   	int3
   1940f:	cc                   	int3

hyperinterval::float::F32Enclosure::next_down:
   19410:	53                   	push   %rbx
   19411:	48 83 ec 10          	sub    $0x10,%rsp
   19415:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   1941a:	66 0f 7e c1          	movd   %xmm0,%ecx
   1941e:	48 89 e7             	mov    %rsp,%rdi
   19421:	be 00 00 00 80       	mov    $0x80000000,%esi
   19426:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1942b:	e8 60 2e 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   19430:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19434:	75 11                	jne    19447 <hyperinterval::float::F32Enclosure::next_down+0x37>
   19436:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1943b:	c1 e0 08             	shl    $0x8,%eax
   1943e:	48 ff c0             	inc    %rax
   19441:	48 83 c4 10          	add    $0x10,%rsp
   19445:	5b                   	pop    %rbx
   19446:	c3                   	ret
   19447:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1944c:	48 89 c1             	mov    %rax,%rcx
   1944f:	48 31 d9             	xor    %rbx,%rcx
   19452:	48 85 c0             	test   %rax,%rax
   19455:	48 0f 44 c8          	cmove  %rax,%rcx
   19459:	31 c0                	xor    %eax,%eax
   1945b:	85 c9                	test   %ecx,%ecx
   1945d:	0f 99 c0             	setns  %al
   19460:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
   19464:	48 ff c9             	dec    %rcx
   19467:	48 89 e7             	mov    %rsp,%rdi
   1946a:	be 00 00 00 80       	mov    $0x80000000,%esi
   1946f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19474:	e8 17 2e 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   19479:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1947d:	75 0b                	jne    1948a <hyperinterval::float::F32Enclosure::next_down+0x7a>
   1947f:	b8 01 03 00 00       	mov    $0x301,%eax
   19484:	48 83 c4 10          	add    $0x10,%rsp
   19488:	5b                   	pop    %rbx
   19489:	c3                   	ret
   1948a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1948f:	48 89 c8             	mov    %rcx,%rax
   19492:	48 35 00 00 00 80    	xor    $0xffffffff80000000,%rax
   19498:	48 c1 e0 20          	shl    $0x20,%rax
   1949c:	48 85 c9             	test   %rcx,%rcx
   1949f:	48 0f 44 c1          	cmove  %rcx,%rax
   194a3:	48 83 c4 10          	add    $0x10,%rsp
   194a7:	5b                   	pop    %rbx
   194a8:	c3                   	ret
   194a9:	cc                   	int3
   194aa:	cc                   	int3
   194ab:	cc                   	int3
   194ac:	cc                   	int3
   194ad:	cc                   	int3
   194ae:	cc                   	int3
   194af:	cc                   	int3

hyperinterval::float::F32Enclosure::subset_of:
   194b0:	b0 01                	mov    $0x1,%al
   194b2:	f6 07 01             	testb  $0x1,(%rdi)
   194b5:	74 53                	je     1950a <hyperinterval::float::F32Enclosure::subset_of+0x5a>
   194b7:	f6 06 01             	testb  $0x1,(%rsi)
   194ba:	74 4c                	je     19508 <hyperinterval::float::F32Enclosure::subset_of+0x58>
   194bc:	8b 4f 04             	mov    0x4(%rdi),%ecx
   194bf:	8b 56 04             	mov    0x4(%rsi),%edx
   194c2:	b8 00 00 00 80       	mov    $0x80000000,%eax
   194c7:	41 89 d0             	mov    %edx,%r8d
   194ca:	41 09 c0             	or     %eax,%r8d
   194cd:	41 89 d1             	mov    %edx,%r9d
   194d0:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   194d7:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   194dd:	45 29 ca             	sub    %r9d,%r10d
   194e0:	85 d2                	test   %edx,%edx
   194e2:	4d 0f 49 d0          	cmovns %r8,%r10
   194e6:	89 ca                	mov    %ecx,%edx
   194e8:	09 c2                	or     %eax,%edx
   194ea:	41 89 c8             	mov    %ecx,%r8d
   194ed:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   194f4:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   194fa:	45 29 c1             	sub    %r8d,%r9d
   194fd:	85 c9                	test   %ecx,%ecx
   194ff:	4c 0f 49 ca          	cmovns %rdx,%r9
   19503:	45 39 ca             	cmp    %r9d,%r10d
   19506:	76 03                	jbe    1950b <hyperinterval::float::F32Enclosure::subset_of+0x5b>
   19508:	31 c0                	xor    %eax,%eax
   1950a:	c3                   	ret
   1950b:	8b 4f 08             	mov    0x8(%rdi),%ecx
   1950e:	8b 56 08             	mov    0x8(%rsi),%edx
   19511:	89 ce                	mov    %ecx,%esi
   19513:	09 c6                	or     %eax,%esi
   19515:	89 cf                	mov    %ecx,%edi
   19517:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1951d:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   19523:	41 29 f8             	sub    %edi,%r8d
   19526:	85 c9                	test   %ecx,%ecx
   19528:	4c 0f 49 c6          	cmovns %rsi,%r8
   1952c:	89 d1                	mov    %edx,%ecx
   1952e:	09 c1                	or     %eax,%ecx
   19530:	89 d6                	mov    %edx,%esi
   19532:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   19538:	29 f0                	sub    %esi,%eax
   1953a:	85 d2                	test   %edx,%edx
   1953c:	48 0f 49 c1          	cmovns %rcx,%rax
   19540:	41 39 c0             	cmp    %eax,%r8d
   19543:	0f 96 c0             	setbe  %al
   19546:	c3                   	ret
   19547:	cc                   	int3
   19548:	cc                   	int3
   19549:	cc                   	int3
   1954a:	cc                   	int3
   1954b:	cc                   	int3
   1954c:	cc                   	int3
   1954d:	cc                   	int3
   1954e:	cc                   	int3
   1954f:	cc                   	int3

hyperinterval::float::F64Enclosure::reciprocal:
   19550:	55                   	push   %rbp
   19551:	41 57                	push   %r15
   19553:	41 56                	push   %r14
   19555:	41 55                	push   %r13
   19557:	41 54                	push   %r12
   19559:	53                   	push   %rbx
   1955a:	48 83 ec 28          	sub    $0x28,%rsp
   1955e:	48 89 fb             	mov    %rdi,%rbx
   19561:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   19565:	74 65                	je     195cc <hyperinterval::float::F64Enclosure::reciprocal+0x7c>
   19567:	49 89 f6             	mov    %rsi,%r14
   1956a:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
   19571:	00 00 80 
   19574:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1957b:	00 f0 7f 
   1957e:	49 bd 00 00 00 00 00 	movabs $0x3ff0000000000000,%r13
   19585:	00 f0 3f 
   19588:	48 89 e7             	mov    %rsp,%rdi
   1958b:	4c 89 fe             	mov    %r15,%rsi
   1958e:	4c 89 e2             	mov    %r12,%rdx
   19591:	4c 89 e9             	mov    %r13,%rcx
   19594:	e8 f7 2c 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   19599:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1959d:	74 1c                	je     195bb <hyperinterval::float::F64Enclosure::reciprocal+0x6b>
   1959f:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   195a4:	48 89 e7             	mov    %rsp,%rdi
   195a7:	4c 89 fe             	mov    %r15,%rsi
   195aa:	4c 89 e2             	mov    %r12,%rdx
   195ad:	4c 89 e9             	mov    %r13,%rcx
   195b0:	e8 db 2c 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   195b5:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   195b9:	75 2a                	jne    195e5 <hyperinterval::float::F64Enclosure::reciprocal+0x95>
   195bb:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   195c0:	88 53 08             	mov    %dl,0x8(%rbx)
   195c3:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   195ca:	eb 07                	jmp    195d3 <hyperinterval::float::F64Enclosure::reciprocal+0x83>
   195cc:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   195d3:	48 89 d8             	mov    %rbx,%rax
   195d6:	48 83 c4 28          	add    $0x28,%rsp
   195da:	5b                   	pop    %rbx
   195db:	41 5c                	pop    %r12
   195dd:	41 5d                	pop    %r13
   195df:	41 5e                	pop    %r14
   195e1:	41 5f                	pop    %r15
   195e3:	5d                   	pop    %rbp
   195e4:	c3                   	ret
   195e5:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   195ea:	48 89 ea             	mov    %rbp,%rdx
   195ed:	4c 09 fa             	or     %r15,%rdx
   195f0:	49 8d 47 ff          	lea    -0x1(%r15),%rax
   195f4:	48 89 ee             	mov    %rbp,%rsi
   195f7:	48 21 c6             	and    %rax,%rsi
   195fa:	4c 89 ff             	mov    %r15,%rdi
   195fd:	48 29 f7             	sub    %rsi,%rdi
   19600:	48 85 ed             	test   %rbp,%rbp
   19603:	48 0f 49 fa          	cmovns %rdx,%rdi
   19607:	48 89 ca             	mov    %rcx,%rdx
   1960a:	4c 09 fa             	or     %r15,%rdx
   1960d:	48 89 ce             	mov    %rcx,%rsi
   19610:	48 21 c6             	and    %rax,%rsi
   19613:	49 29 f7             	sub    %rsi,%r15
   19616:	48 85 c9             	test   %rcx,%rcx
   19619:	4c 0f 49 fa          	cmovns %rdx,%r15
   1961d:	b2 01                	mov    $0x1,%dl
   1961f:	4c 39 ff             	cmp    %r15,%rdi
   19622:	77 9c                	ja     195c0 <hyperinterval::float::F64Enclosure::reciprocal+0x70>
   19624:	48 c7 44 24 10 01 00 	movq   $0x1,0x10(%rsp)
   1962b:	00 00 
   1962d:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
   19632:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   19637:	49 83 7e 08 00       	cmpq   $0x0,0x8(%r14)
   1963c:	7f 0e                	jg     1964c <hyperinterval::float::F64Enclosure::reciprocal+0xfc>
   1963e:	49 8b 4e 10          	mov    0x10(%r14),%rcx
   19642:	48 85 c9             	test   %rcx,%rcx
   19645:	79 1f                	jns    19666 <hyperinterval::float::F64Enclosure::reciprocal+0x116>
   19647:	48 21 c1             	and    %rax,%rcx
   1964a:	74 1a                	je     19666 <hyperinterval::float::F64Enclosure::reciprocal+0x116>
   1964c:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
   19651:	48 89 df             	mov    %rbx,%rdi
   19654:	4c 89 f2             	mov    %r14,%rdx
   19657:	b9 01 00 00 00       	mov    $0x1,%ecx
   1965c:	e8 9f 02 00 00       	call   19900 <hyperinterval::float::F64Enclosure::corner_image>
   19661:	e9 6d ff ff ff       	jmp    195d3 <hyperinterval::float::F64Enclosure::reciprocal+0x83>
   19666:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
   1966a:	e9 54 ff ff ff       	jmp    195c3 <hyperinterval::float::F64Enclosure::reciprocal+0x73>
   1966f:	cc                   	int3

hyperinterval::float::F64Enclosure::checked_pow:
   19670:	55                   	push   %rbp
   19671:	41 57                	push   %r15
   19673:	41 56                	push   %r14
   19675:	41 55                	push   %r13
   19677:	41 54                	push   %r12
   19679:	53                   	push   %rbx
   1967a:	48 83 ec 48          	sub    $0x48,%rsp
   1967e:	48 89 fb             	mov    %rdi,%rbx
   19681:	83 fa 02             	cmp    $0x2,%edx
   19684:	75 0e                	jne    19694 <hyperinterval::float::F64Enclosure::checked_pow+0x24>
   19686:	48 89 df             	mov    %rbx,%rdi
   19689:	ff 15 11 4e 04 00    	call   *0x44e11(%rip)        # 5e4a0 <_DYNAMIC+0x2f0>
   1968f:	e9 e0 00 00 00       	jmp    19774 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
   19694:	f6 06 01             	testb  $0x1,(%rsi)
   19697:	0f 84 d0 00 00 00    	je     1976d <hyperinterval::float::F64Enclosure::checked_pow+0xfd>
   1969d:	89 d5                	mov    %edx,%ebp
   1969f:	4c 8b 76 10          	mov    0x10(%rsi),%r14
   196a3:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
   196aa:	00 00 80 
   196ad:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   196b4:	00 f0 7f 
   196b7:	4c 8b 7e 08          	mov    0x8(%rsi),%r15
   196bb:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   196c0:	4c 89 e6             	mov    %r12,%rsi
   196c3:	4c 89 ea             	mov    %r13,%rdx
   196c6:	4c 89 f9             	mov    %r15,%rcx
   196c9:	41 89 e8             	mov    %ebp,%r8d
   196cc:	e8 cf 23 00 00       	call   1baa0 <hyperinterval::ieee::Format::power>
   196d1:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   196d6:	0f 85 80 00 00 00    	jne    1975c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   196dc:	4c 89 f1             	mov    %r14,%rcx
   196df:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   196e4:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   196e9:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   196ee:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   196f3:	4c 89 e6             	mov    %r12,%rsi
   196f6:	4c 89 ea             	mov    %r13,%rdx
   196f9:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
   196fe:	41 89 e8             	mov    %ebp,%r8d
   19701:	e8 9a 23 00 00       	call   1baa0 <hyperinterval::ieee::Format::power>
   19706:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1970b:	74 4f                	je     1975c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   1970d:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   19712:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   19717:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1971c:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   19721:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19726:	4c 89 e6             	mov    %r12,%rsi
   19729:	4c 89 ea             	mov    %r13,%rdx
   1972c:	4c 89 f1             	mov    %r14,%rcx
   1972f:	e8 5c 2b 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   19734:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19739:	74 21                	je     1975c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   1973b:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   19740:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19745:	4c 89 e6             	mov    %r12,%rsi
   19748:	4c 89 ea             	mov    %r13,%rdx
   1974b:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   19750:	e8 3b 2b 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   19755:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1975a:	75 2a                	jne    19786 <hyperinterval::float::F64Enclosure::checked_pow+0x116>
   1975c:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   19761:	88 43 08             	mov    %al,0x8(%rbx)
   19764:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1976b:	eb 07                	jmp    19774 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
   1976d:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   19774:	48 89 d8             	mov    %rbx,%rax
   19777:	48 83 c4 48          	add    $0x48,%rsp
   1977b:	5b                   	pop    %rbx
   1977c:	41 5c                	pop    %r12
   1977e:	41 5d                	pop    %r13
   19780:	41 5e                	pop    %r14
   19782:	41 5f                	pop    %r15
   19784:	5d                   	pop    %rbp
   19785:	c3                   	ret
   19786:	4c 89 f0             	mov    %r14,%rax
   19789:	4c 09 e0             	or     %r12,%rax
   1978c:	4c 89 f6             	mov    %r14,%rsi
   1978f:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
   19794:	48 89 f1             	mov    %rsi,%rcx
   19797:	4c 21 f1             	and    %r14,%rcx
   1979a:	4c 89 e2             	mov    %r12,%rdx
   1979d:	48 29 ca             	sub    %rcx,%rdx
   197a0:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
   197a5:	48 85 f6             	test   %rsi,%rsi
   197a8:	48 0f 49 d0          	cmovns %rax,%rdx
   197ac:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
   197b1:	48 89 f8             	mov    %rdi,%rax
   197b4:	4c 09 e0             	or     %r12,%rax
   197b7:	48 89 f9             	mov    %rdi,%rcx
   197ba:	4c 21 f1             	and    %r14,%rcx
   197bd:	4c 89 e6             	mov    %r12,%rsi
   197c0:	48 29 ce             	sub    %rcx,%rsi
   197c3:	48 85 ff             	test   %rdi,%rdi
   197c6:	48 0f 49 f0          	cmovns %rax,%rsi
   197ca:	b0 01                	mov    $0x1,%al
   197cc:	48 39 f2             	cmp    %rsi,%rdx
   197cf:	77 90                	ja     19761 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
   197d1:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
   197d6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   197db:	4c 89 e6             	mov    %r12,%rsi
   197de:	4c 89 ea             	mov    %r13,%rdx
   197e1:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   197e6:	e8 a5 2a 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   197eb:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   197f0:	0f 84 66 ff ff ff    	je     1975c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   197f6:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   197fb:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   19800:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19805:	4c 89 e6             	mov    %r12,%rsi
   19808:	4c 89 ea             	mov    %r13,%rdx
   1980b:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   19810:	e8 7b 2a 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   19815:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1981a:	0f 84 3c ff ff ff    	je     1975c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   19820:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   19825:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
   1982a:	48 89 d0             	mov    %rdx,%rax
   1982d:	4c 09 e0             	or     %r12,%rax
   19830:	48 89 d7             	mov    %rdx,%rdi
   19833:	4c 21 f7             	and    %r14,%rdi
   19836:	4c 89 e6             	mov    %r12,%rsi
   19839:	48 29 fe             	sub    %rdi,%rsi
   1983c:	48 85 d2             	test   %rdx,%rdx
   1983f:	48 0f 49 f0          	cmovns %rax,%rsi
   19843:	48 89 c8             	mov    %rcx,%rax
   19846:	4c 09 e0             	or     %r12,%rax
   19849:	49 21 ce             	and    %rcx,%r14
   1984c:	4d 29 f4             	sub    %r14,%r12
   1984f:	48 85 c9             	test   %rcx,%rcx
   19852:	4c 0f 49 e0          	cmovns %rax,%r12
   19856:	b0 01                	mov    $0x1,%al
   19858:	4c 39 e6             	cmp    %r12,%rsi
   1985b:	0f 87 00 ff ff ff    	ja     19761 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
   19861:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   19866:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   1986b:	e8 00 2e 00 00       	call   1c670 <hyperinterval::bounds::Bounds<T>::hull>
   19870:	49 89 c5             	mov    %rax,%r13
   19873:	49 89 d4             	mov    %rdx,%r12
   19876:	85 ed                	test   %ebp,%ebp
   19878:	0f 95 c0             	setne  %al
   1987b:	40 f6 c5 01          	test   $0x1,%bpl
   1987f:	0f 94 c1             	sete   %cl
   19882:	84 c8                	test   %cl,%al
   19884:	74 13                	je     19899 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
   19886:	4c 89 ff             	mov    %r15,%rdi
   19889:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
   1988e:	31 d2                	xor    %edx,%edx
   19890:	e8 6b 2e 00 00       	call   1c700 <hyperinterval::bounds::Bounds<T>::signs>
   19895:	a8 02                	test   $0x2,%al
   19897:	75 14                	jne    198ad <hyperinterval::float::F64Enclosure::checked_pow+0x23d>
   19899:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   198a0:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   198a4:	4c 89 63 10          	mov    %r12,0x10(%rbx)
   198a8:	e9 c7 fe ff ff       	jmp    19774 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
   198ad:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   198b2:	31 f6                	xor    %esi,%esi
   198b4:	31 d2                	xor    %edx,%edx
   198b6:	e8 65 16 00 00       	call   1af20 <hyperinterval::float::F64Enclosure::from_bits>
   198bb:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   198c0:	48 83 f8 02          	cmp    $0x2,%rax
   198c4:	75 0a                	jne    198d0 <hyperinterval::float::F64Enclosure::checked_pow+0x260>
   198c6:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   198cb:	e9 91 fe ff ff       	jmp    19761 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
   198d0:	83 f8 01             	cmp    $0x1,%eax
   198d3:	75 c4                	jne    19899 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
   198d5:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   198da:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   198df:	4c 89 ef             	mov    %r13,%rdi
   198e2:	4c 89 e6             	mov    %r12,%rsi
   198e5:	e8 86 2d 00 00       	call   1c670 <hyperinterval::bounds::Bounds<T>::hull>
   198ea:	49 89 c5             	mov    %rax,%r13
   198ed:	49 89 d4             	mov    %rdx,%r12
   198f0:	eb a7                	jmp    19899 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
   198f2:	cc                   	int3
   198f3:	cc                   	int3
   198f4:	cc                   	int3
   198f5:	cc                   	int3
   198f6:	cc                   	int3
   198f7:	cc                   	int3
   198f8:	cc                   	int3
   198f9:	cc                   	int3
   198fa:	cc                   	int3
   198fb:	cc                   	int3
   198fc:	cc                   	int3
   198fd:	cc                   	int3
   198fe:	cc                   	int3
   198ff:	cc                   	int3

hyperinterval::float::F64Enclosure::corner_image:
   19900:	55                   	push   %rbp
   19901:	41 57                	push   %r15
   19903:	41 56                	push   %r14
   19905:	41 55                	push   %r13
   19907:	41 54                	push   %r12
   19909:	53                   	push   %rbx
   1990a:	48 83 ec 68          	sub    $0x68,%rsp
   1990e:	48 89 fb             	mov    %rdi,%rbx
   19911:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   19915:	75 5f                	jne    19976 <hyperinterval::float::F64Enclosure::corner_image+0x76>
   19917:	f6 02 01             	testb  $0x1,(%rdx)
   1991a:	74 5a                	je     19976 <hyperinterval::float::F64Enclosure::corner_image+0x76>
   1991c:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   19923:	00 00 80 
   19926:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1992d:	00 f0 7f 
   19930:	4c 8b 66 08          	mov    0x8(%rsi),%r12
   19934:	48 8b 46 10          	mov    0x10(%rsi),%rax
   19938:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1993d:	48 8b 6a 08          	mov    0x8(%rdx),%rbp
   19941:	48 8b 42 10          	mov    0x10(%rdx),%rax
   19945:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1994a:	84 c9                	test   %cl,%cl
   1994c:	74 34                	je     19982 <hyperinterval::float::F64Enclosure::corner_image+0x82>
   1994e:	48 89 e7             	mov    %rsp,%rdi
   19951:	4c 89 f6             	mov    %r14,%rsi
   19954:	4c 89 fa             	mov    %r15,%rdx
   19957:	4c 89 e1             	mov    %r12,%rcx
   1995a:	49 89 e8             	mov    %rbp,%r8
   1995d:	e8 2e 1c 00 00       	call   1b590 <hyperinterval::ieee::Format::div>
   19962:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19966:	0f 84 c3 00 00 00    	je     19a2f <hyperinterval::float::F64Enclosure::corner_image+0x12f>
   1996c:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   19971:	e9 b1 00 00 00       	jmp    19a27 <hyperinterval::float::F64Enclosure::corner_image+0x127>
   19976:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1997d:	e9 84 03 00 00       	jmp    19d06 <hyperinterval::float::F64Enclosure::corner_image+0x406>
   19982:	4c 89 e1             	mov    %r12,%rcx
   19985:	48 c1 e9 34          	shr    $0x34,%rcx
   19989:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1998f:	48 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%rdx
   19996:	ff 0f 00 
   19999:	4c 89 e7             	mov    %r12,%rdi
   1999c:	48 21 d7             	and    %rdx,%rdi
   1999f:	48 8d 42 01          	lea    0x1(%rdx),%rax
   199a3:	44 8d 81 9a f7 ff ff 	lea    -0x866(%rcx),%r8d
   199aa:	48 85 c9             	test   %rcx,%rcx
   199ad:	48 0f 45 c8          	cmovne %rax,%rcx
   199b1:	be 9b f7 ff ff       	mov    $0xfffff79b,%esi
   199b6:	41 0f 45 f0          	cmovne %r8d,%esi
   199ba:	48 09 f9             	or     %rdi,%rcx
   199bd:	48 89 ef             	mov    %rbp,%rdi
   199c0:	48 c1 ef 34          	shr    $0x34,%rdi
   199c4:	81 e7 ff 07 00 00    	and    $0x7ff,%edi
   199ca:	48 21 ea             	and    %rbp,%rdx
   199cd:	48 85 ff             	test   %rdi,%rdi
   199d0:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   199d6:	44 0f 45 c7          	cmovne %edi,%r8d
   199da:	48 0f 44 c7          	cmove  %rdi,%rax
   199de:	48 09 d0             	or     %rdx,%rax
   199e1:	48 89 ef             	mov    %rbp,%rdi
   199e4:	4c 31 e7             	xor    %r12,%rdi
   199e7:	48 f7 e1             	mul    %rcx
   199ea:	41 01 f0             	add    %esi,%r8d
   199ed:	48 c1 ef 3f          	shr    $0x3f,%rdi
   199f1:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
   199f6:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   199fb:	48 89 04 24          	mov    %rax,(%rsp)
   199ff:	44 89 44 24 10       	mov    %r8d,0x10(%rsp)
   19a04:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   19a09:	48 89 e1             	mov    %rsp,%rcx
   19a0c:	4c 89 f6             	mov    %r14,%rsi
   19a0f:	4c 89 fa             	mov    %r15,%rdx
   19a12:	e8 b9 28 00 00       	call   1c2d0 <hyperinterval::ieee::Format::rounded>
   19a17:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   19a1c:	0f 84 99 02 00 00    	je     19cbb <hyperinterval::float::F64Enclosure::corner_image+0x3bb>
   19a22:	0f b6 44 24 41       	movzbl 0x41(%rsp),%eax
   19a27:	88 43 08             	mov    %al,0x8(%rbx)
   19a2a:	e9 d0 02 00 00       	jmp    19cff <hyperinterval::float::F64Enclosure::corner_image+0x3ff>
   19a2f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19a34:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   19a39:	48 89 e7             	mov    %rsp,%rdi
   19a3c:	4c 89 f6             	mov    %r14,%rsi
   19a3f:	4c 89 fa             	mov    %r15,%rdx
   19a42:	e8 49 28 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   19a47:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19a4b:	0f 85 a4 02 00 00    	jne    19cf5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19a51:	4c 89 fa             	mov    %r15,%rdx
   19a54:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   19a59:	48 89 e7             	mov    %rsp,%rdi
   19a5c:	4c 89 f6             	mov    %r14,%rsi
   19a5f:	4c 89 e9             	mov    %r13,%rcx
   19a62:	e8 29 28 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   19a67:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19a6b:	0f 85 84 02 00 00    	jne    19cf5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19a71:	4c 89 f8             	mov    %r15,%rax
   19a74:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   19a7b:	00 00 80 
   19a7e:	4c 09 f0             	or     %r14,%rax
   19a81:	49 8d 76 ff          	lea    -0x1(%r14),%rsi
   19a85:	4c 89 f9             	mov    %r15,%rcx
   19a88:	48 21 f1             	and    %rsi,%rcx
   19a8b:	4c 89 f2             	mov    %r14,%rdx
   19a8e:	48 29 ca             	sub    %rcx,%rdx
   19a91:	4d 85 ff             	test   %r15,%r15
   19a94:	48 0f 49 d0          	cmovns %rax,%rdx
   19a98:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   19a9d:	48 89 f8             	mov    %rdi,%rax
   19aa0:	4c 09 f0             	or     %r14,%rax
   19aa3:	48 89 f9             	mov    %rdi,%rcx
   19aa6:	48 21 f1             	and    %rsi,%rcx
   19aa9:	4c 89 f6             	mov    %r14,%rsi
   19aac:	48 29 ce             	sub    %rcx,%rsi
   19aaf:	48 85 ff             	test   %rdi,%rdi
   19ab2:	48 0f 49 f0          	cmovns %rax,%rsi
   19ab6:	41 b5 01             	mov    $0x1,%r13b
   19ab9:	48 39 f2             	cmp    %rsi,%rdx
   19abc:	0f 87 39 02 00 00    	ja     19cfb <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   19ac2:	48 89 7c 24 38       	mov    %rdi,0x38(%rsp)
   19ac7:	4c 89 7c 24 28       	mov    %r15,0x28(%rsp)
   19acc:	48 89 e7             	mov    %rsp,%rdi
   19acf:	4c 89 f6             	mov    %r14,%rsi
   19ad2:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   19ad9:	00 f0 7f 
   19adc:	4c 89 fa             	mov    %r15,%rdx
   19adf:	4c 89 e1             	mov    %r12,%rcx
   19ae2:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   19ae7:	e8 a4 1a 00 00       	call   1b590 <hyperinterval::ieee::Format::div>
   19aec:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19af0:	0f 85 76 fe ff ff    	jne    1996c <hyperinterval::float::F64Enclosure::corner_image+0x6c>
   19af6:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19afb:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   19b00:	48 89 e7             	mov    %rsp,%rdi
   19b03:	4c 89 f6             	mov    %r14,%rsi
   19b06:	4c 89 fa             	mov    %r15,%rdx
   19b09:	e8 82 27 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   19b0e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19b12:	0f 85 dd 01 00 00    	jne    19cf5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19b18:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19b1d:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   19b22:	48 89 e7             	mov    %rsp,%rdi
   19b25:	4c 89 f6             	mov    %r14,%rsi
   19b28:	4c 89 fa             	mov    %r15,%rdx
   19b2b:	4c 89 e1             	mov    %r12,%rcx
   19b2e:	e8 5d 27 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   19b33:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19b37:	0f 85 b8 01 00 00    	jne    19cf5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19b3d:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19b42:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
   19b47:	48 89 d0             	mov    %rdx,%rax
   19b4a:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   19b51:	00 00 80 
   19b54:	4c 09 f0             	or     %r14,%rax
   19b57:	49 89 d0             	mov    %rdx,%r8
   19b5a:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   19b5e:	49 21 f8             	and    %rdi,%r8
   19b61:	4c 89 f6             	mov    %r14,%rsi
   19b64:	4c 29 c6             	sub    %r8,%rsi
   19b67:	48 85 d2             	test   %rdx,%rdx
   19b6a:	48 0f 49 f0          	cmovns %rax,%rsi
   19b6e:	48 89 c8             	mov    %rcx,%rax
   19b71:	4c 09 f0             	or     %r14,%rax
   19b74:	49 89 c8             	mov    %rcx,%r8
   19b77:	49 21 f8             	and    %rdi,%r8
   19b7a:	4c 89 f7             	mov    %r14,%rdi
   19b7d:	4c 29 c7             	sub    %r8,%rdi
   19b80:	48 85 c9             	test   %rcx,%rcx
   19b83:	48 0f 49 f8          	cmovns %rax,%rdi
   19b87:	48 39 fe             	cmp    %rdi,%rsi
   19b8a:	0f 87 6b 01 00 00    	ja     19cfb <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   19b90:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   19b95:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
   19b9a:	e8 d1 2a 00 00       	call   1c670 <hyperinterval::bounds::Bounds<T>::hull>
   19b9f:	49 89 c4             	mov    %rax,%r12
   19ba2:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   19ba7:	48 89 e7             	mov    %rsp,%rdi
   19baa:	4c 89 f6             	mov    %r14,%rsi
   19bad:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   19bb4:	00 f0 7f 
   19bb7:	4c 89 fa             	mov    %r15,%rdx
   19bba:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   19bbf:	49 89 e8             	mov    %rbp,%r8
   19bc2:	e8 c9 19 00 00       	call   1b590 <hyperinterval::ieee::Format::div>
   19bc7:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19bcb:	0f 85 9b fd ff ff    	jne    1996c <hyperinterval::float::F64Enclosure::corner_image+0x6c>
   19bd1:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19bd6:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   19bdb:	48 89 e7             	mov    %rsp,%rdi
   19bde:	4c 89 f6             	mov    %r14,%rsi
   19be1:	4c 89 fa             	mov    %r15,%rdx
   19be4:	e8 a7 26 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   19be9:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19bed:	0f 85 02 01 00 00    	jne    19cf5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19bf3:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19bf8:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   19bfd:	48 89 e7             	mov    %rsp,%rdi
   19c00:	4c 89 f6             	mov    %r14,%rsi
   19c03:	4c 89 fa             	mov    %r15,%rdx
   19c06:	48 89 e9             	mov    %rbp,%rcx
   19c09:	e8 82 26 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   19c0e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19c12:	0f 85 dd 00 00 00    	jne    19cf5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19c18:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19c1d:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
   19c22:	48 89 d0             	mov    %rdx,%rax
   19c25:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   19c2c:	00 00 80 
   19c2f:	4c 09 f0             	or     %r14,%rax
   19c32:	49 89 d0             	mov    %rdx,%r8
   19c35:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   19c39:	49 21 f8             	and    %rdi,%r8
   19c3c:	4c 89 f6             	mov    %r14,%rsi
   19c3f:	4c 29 c6             	sub    %r8,%rsi
   19c42:	48 85 d2             	test   %rdx,%rdx
   19c45:	48 0f 49 f0          	cmovns %rax,%rsi
   19c49:	48 89 c8             	mov    %rcx,%rax
   19c4c:	4c 09 f0             	or     %r14,%rax
   19c4f:	49 89 c8             	mov    %rcx,%r8
   19c52:	49 21 f8             	and    %rdi,%r8
   19c55:	4c 89 f7             	mov    %r14,%rdi
   19c58:	4c 29 c7             	sub    %r8,%rdi
   19c5b:	48 85 c9             	test   %rcx,%rcx
   19c5e:	48 0f 49 f8          	cmovns %rax,%rdi
   19c62:	48 39 fe             	cmp    %rdi,%rsi
   19c65:	0f 87 90 00 00 00    	ja     19cfb <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   19c6b:	4c 89 e7             	mov    %r12,%rdi
   19c6e:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   19c73:	e8 f8 29 00 00       	call   1c670 <hyperinterval::bounds::Bounds<T>::hull>
   19c78:	49 89 c4             	mov    %rax,%r12
   19c7b:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   19c80:	48 89 e7             	mov    %rsp,%rdi
   19c83:	4c 89 f6             	mov    %r14,%rsi
   19c86:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   19c8d:	00 f0 7f 
   19c90:	4c 89 fa             	mov    %r15,%rdx
   19c93:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   19c98:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   19c9d:	e8 ee 18 00 00       	call   1b590 <hyperinterval::ieee::Format::div>
   19ca2:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19ca6:	0f 85 c0 fc ff ff    	jne    1996c <hyperinterval::float::F64Enclosure::corner_image+0x6c>
   19cac:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19cb1:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   19cb6:	e9 ae 02 00 00       	jmp    19f69 <hyperinterval::float::F64Enclosure::corner_image+0x669>
   19cbb:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   19cc0:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
   19cc5:	48 89 e7             	mov    %rsp,%rdi
   19cc8:	4c 89 f6             	mov    %r14,%rsi
   19ccb:	4c 89 fa             	mov    %r15,%rdx
   19cce:	e8 bd 25 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   19cd3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19cd7:	74 1c                	je     19cf5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19cd9:	4c 89 f6             	mov    %r14,%rsi
   19cdc:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   19ce1:	48 89 e7             	mov    %rsp,%rdi
   19ce4:	4c 89 fa             	mov    %r15,%rdx
   19ce7:	4c 89 e9             	mov    %r13,%rcx
   19cea:	e8 a1 25 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   19cef:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19cf3:	75 20                	jne    19d15 <hyperinterval::float::F64Enclosure::corner_image+0x415>
   19cf5:	44 0f b6 6c 24 01    	movzbl 0x1(%rsp),%r13d
   19cfb:	44 88 6b 08          	mov    %r13b,0x8(%rbx)
   19cff:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   19d06:	48 83 c4 68          	add    $0x68,%rsp
   19d0a:	5b                   	pop    %rbx
   19d0b:	41 5c                	pop    %r12
   19d0d:	41 5d                	pop    %r13
   19d0f:	41 5e                	pop    %r14
   19d11:	41 5f                	pop    %r15
   19d13:	5d                   	pop    %rbp
   19d14:	c3                   	ret
   19d15:	4c 89 f0             	mov    %r14,%rax
   19d18:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   19d1f:	00 00 80 
   19d22:	48 09 f8             	or     %rdi,%rax
   19d25:	48 8d 77 ff          	lea    -0x1(%rdi),%rsi
   19d29:	4c 89 f1             	mov    %r14,%rcx
   19d2c:	48 21 f1             	and    %rsi,%rcx
   19d2f:	48 89 fa             	mov    %rdi,%rdx
   19d32:	48 29 ca             	sub    %rcx,%rdx
   19d35:	4d 85 f6             	test   %r14,%r14
   19d38:	48 0f 49 d0          	cmovns %rax,%rdx
   19d3c:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
   19d41:	4c 89 c0             	mov    %r8,%rax
   19d44:	48 09 f8             	or     %rdi,%rax
   19d47:	4c 89 c1             	mov    %r8,%rcx
   19d4a:	48 21 f1             	and    %rsi,%rcx
   19d4d:	48 89 fe             	mov    %rdi,%rsi
   19d50:	48 29 ce             	sub    %rcx,%rsi
   19d53:	4d 85 c0             	test   %r8,%r8
   19d56:	48 0f 49 f0          	cmovns %rax,%rsi
   19d5a:	41 b5 01             	mov    $0x1,%r13b
   19d5d:	48 39 f2             	cmp    %rsi,%rdx
   19d60:	77 99                	ja     19cfb <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   19d62:	4c 89 44 24 38       	mov    %r8,0x38(%rsp)
   19d67:	4c 89 74 24 28       	mov    %r14,0x28(%rsp)
   19d6c:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   19d71:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   19d78:	00 00 80 
   19d7b:	4c 89 f6             	mov    %r14,%rsi
   19d7e:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   19d85:	00 f0 7f 
   19d88:	4c 89 fa             	mov    %r15,%rdx
   19d8b:	4c 89 e1             	mov    %r12,%rcx
   19d8e:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   19d93:	e8 38 1c 00 00       	call   1b9d0 <hyperinterval::ieee::Format::mul>
   19d98:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   19d9d:	0f 85 7f fc ff ff    	jne    19a22 <hyperinterval::float::F64Enclosure::corner_image+0x122>
   19da3:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   19da8:	4c 8b 64 24 50       	mov    0x50(%rsp),%r12
   19dad:	48 89 e7             	mov    %rsp,%rdi
   19db0:	4c 89 f6             	mov    %r14,%rsi
   19db3:	4c 89 fa             	mov    %r15,%rdx
   19db6:	e8 d5 24 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   19dbb:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19dbf:	0f 85 30 ff ff ff    	jne    19cf5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19dc5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19dca:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   19dcf:	48 89 e7             	mov    %rsp,%rdi
   19dd2:	4c 89 f6             	mov    %r14,%rsi
   19dd5:	4c 89 fa             	mov    %r15,%rdx
   19dd8:	4c 89 e1             	mov    %r12,%rcx
   19ddb:	e8 b0 24 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   19de0:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19de4:	0f 85 0b ff ff ff    	jne    19cf5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19dea:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19def:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
   19df4:	48 89 d0             	mov    %rdx,%rax
   19df7:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   19dfe:	00 00 80 
   19e01:	4c 09 f0             	or     %r14,%rax
   19e04:	49 89 d0             	mov    %rdx,%r8
   19e07:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   19e0b:	49 21 f8             	and    %rdi,%r8
   19e0e:	4c 89 f6             	mov    %r14,%rsi
   19e11:	4c 29 c6             	sub    %r8,%rsi
   19e14:	48 85 d2             	test   %rdx,%rdx
   19e17:	48 0f 49 f0          	cmovns %rax,%rsi
   19e1b:	48 89 c8             	mov    %rcx,%rax
   19e1e:	4c 09 f0             	or     %r14,%rax
   19e21:	49 89 c8             	mov    %rcx,%r8
   19e24:	49 21 f8             	and    %rdi,%r8
   19e27:	4c 89 f7             	mov    %r14,%rdi
   19e2a:	4c 29 c7             	sub    %r8,%rdi
   19e2d:	48 85 c9             	test   %rcx,%rcx
   19e30:	48 0f 49 f8          	cmovns %rax,%rdi
   19e34:	48 39 fe             	cmp    %rdi,%rsi
   19e37:	0f 87 be fe ff ff    	ja     19cfb <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   19e3d:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   19e42:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
   19e47:	e8 24 28 00 00       	call   1c670 <hyperinterval::bounds::Bounds<T>::hull>
   19e4c:	49 89 c4             	mov    %rax,%r12
   19e4f:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   19e54:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   19e59:	4c 89 f6             	mov    %r14,%rsi
   19e5c:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   19e63:	00 f0 7f 
   19e66:	4c 89 fa             	mov    %r15,%rdx
   19e69:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   19e6e:	49 89 e8             	mov    %rbp,%r8
   19e71:	e8 5a 1b 00 00       	call   1b9d0 <hyperinterval::ieee::Format::mul>
   19e76:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   19e7b:	0f 85 a1 fb ff ff    	jne    19a22 <hyperinterval::float::F64Enclosure::corner_image+0x122>
   19e81:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   19e86:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
   19e8b:	48 89 e7             	mov    %rsp,%rdi
   19e8e:	4c 89 f6             	mov    %r14,%rsi
   19e91:	4c 89 fa             	mov    %r15,%rdx
   19e94:	e8 f7 23 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   19e99:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19e9d:	0f 85 52 fe ff ff    	jne    19cf5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19ea3:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19ea8:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   19ead:	48 89 e7             	mov    %rsp,%rdi
   19eb0:	4c 89 f6             	mov    %r14,%rsi
   19eb3:	4c 89 fa             	mov    %r15,%rdx
   19eb6:	48 89 e9             	mov    %rbp,%rcx
   19eb9:	e8 d2 23 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   19ebe:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19ec2:	0f 85 2d fe ff ff    	jne    19cf5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19ec8:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19ecd:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
   19ed2:	48 89 d0             	mov    %rdx,%rax
   19ed5:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   19edc:	00 00 80 
   19edf:	4c 09 f0             	or     %r14,%rax
   19ee2:	49 89 d0             	mov    %rdx,%r8
   19ee5:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   19ee9:	49 21 f8             	and    %rdi,%r8
   19eec:	4c 89 f6             	mov    %r14,%rsi
   19eef:	4c 29 c6             	sub    %r8,%rsi
   19ef2:	48 85 d2             	test   %rdx,%rdx
   19ef5:	48 0f 49 f0          	cmovns %rax,%rsi
   19ef9:	48 89 c8             	mov    %rcx,%rax
   19efc:	4c 09 f0             	or     %r14,%rax
   19eff:	49 89 c8             	mov    %rcx,%r8
   19f02:	49 21 f8             	and    %rdi,%r8
   19f05:	4c 89 f7             	mov    %r14,%rdi
   19f08:	4c 29 c7             	sub    %r8,%rdi
   19f0b:	48 85 c9             	test   %rcx,%rcx
   19f0e:	48 0f 49 f8          	cmovns %rax,%rdi
   19f12:	48 39 fe             	cmp    %rdi,%rsi
   19f15:	0f 87 e0 fd ff ff    	ja     19cfb <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   19f1b:	4c 89 e7             	mov    %r12,%rdi
   19f1e:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   19f23:	e8 48 27 00 00       	call   1c670 <hyperinterval::bounds::Bounds<T>::hull>
   19f28:	49 89 c4             	mov    %rax,%r12
   19f2b:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   19f30:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   19f35:	4c 89 f6             	mov    %r14,%rsi
   19f38:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   19f3f:	00 f0 7f 
   19f42:	4c 89 fa             	mov    %r15,%rdx
   19f45:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   19f4a:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   19f4f:	e8 7c 1a 00 00       	call   1b9d0 <hyperinterval::ieee::Format::mul>
   19f54:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   19f59:	0f 85 c3 fa ff ff    	jne    19a22 <hyperinterval::float::F64Enclosure::corner_image+0x122>
   19f5f:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   19f64:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
   19f69:	48 89 e7             	mov    %rsp,%rdi
   19f6c:	4c 89 f6             	mov    %r14,%rsi
   19f6f:	4c 89 fa             	mov    %r15,%rdx
   19f72:	e8 19 23 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   19f77:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19f7b:	0f 85 74 fd ff ff    	jne    19cf5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19f81:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19f86:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   19f8b:	48 89 e7             	mov    %rsp,%rdi
   19f8e:	4c 89 f6             	mov    %r14,%rsi
   19f91:	4c 89 fa             	mov    %r15,%rdx
   19f94:	48 89 e9             	mov    %rbp,%rcx
   19f97:	e8 f4 22 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   19f9c:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19fa0:	0f 85 4f fd ff ff    	jne    19cf5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19fa6:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19fab:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
   19fb0:	4c 89 c8             	mov    %r9,%rax
   19fb3:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   19fba:	00 00 80 
   19fbd:	4c 09 c0             	or     %r8,%rax
   19fc0:	4c 89 ca             	mov    %r9,%rdx
   19fc3:	49 8d 78 ff          	lea    -0x1(%r8),%rdi
   19fc7:	48 21 fa             	and    %rdi,%rdx
   19fca:	4c 89 c6             	mov    %r8,%rsi
   19fcd:	48 29 d6             	sub    %rdx,%rsi
   19fd0:	4d 85 c9             	test   %r9,%r9
   19fd3:	48 0f 49 f0          	cmovns %rax,%rsi
   19fd7:	48 89 c8             	mov    %rcx,%rax
   19fda:	4c 09 c0             	or     %r8,%rax
   19fdd:	48 21 cf             	and    %rcx,%rdi
   19fe0:	49 29 f8             	sub    %rdi,%r8
   19fe3:	48 85 c9             	test   %rcx,%rcx
   19fe6:	4c 0f 49 c0          	cmovns %rax,%r8
   19fea:	4c 39 c6             	cmp    %r8,%rsi
   19fed:	0f 87 08 fd ff ff    	ja     19cfb <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   19ff3:	4c 89 e7             	mov    %r12,%rdi
   19ff6:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   19ffb:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
   1a000:	e8 6b 26 00 00       	call   1c670 <hyperinterval::bounds::Bounds<T>::hull>
   1a005:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1a00c:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1a010:	48 89 53 10          	mov    %rdx,0x10(%rbx)
   1a014:	e9 ed fc ff ff       	jmp    19d06 <hyperinterval::float::F64Enclosure::corner_image+0x406>
   1a019:	cc                   	int3
   1a01a:	cc                   	int3
   1a01b:	cc                   	int3
   1a01c:	cc                   	int3
   1a01d:	cc                   	int3
   1a01e:	cc                   	int3
   1a01f:	cc                   	int3

hyperinterval::float::F64Enclosure::intersection:
   1a020:	48 89 f8             	mov    %rdi,%rax
   1a023:	45 31 c9             	xor    %r9d,%r9d
   1a026:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1a02a:	0f 85 e1 00 00 00    	jne    1a111 <hyperinterval::float::F64Enclosure::intersection+0xf1>
   1a030:	f6 02 01             	testb  $0x1,(%rdx)
   1a033:	0f 84 cc 00 00 00    	je     1a105 <hyperinterval::float::F64Enclosure::intersection+0xe5>
   1a039:	41 56                	push   %r14
   1a03b:	53                   	push   %rbx
   1a03c:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   1a040:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1a044:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   1a04b:	00 00 80 
   1a04e:	49 89 ca             	mov    %rcx,%r10
   1a051:	49 09 fa             	or     %rdi,%r10
   1a054:	4c 8d 4f ff          	lea    -0x1(%rdi),%r9
   1a058:	49 89 cb             	mov    %rcx,%r11
   1a05b:	4d 21 cb             	and    %r9,%r11
   1a05e:	48 89 fb             	mov    %rdi,%rbx
   1a061:	4c 29 db             	sub    %r11,%rbx
   1a064:	48 85 c9             	test   %rcx,%rcx
   1a067:	49 0f 49 da          	cmovns %r10,%rbx
   1a06b:	4d 89 c2             	mov    %r8,%r10
   1a06e:	49 09 fa             	or     %rdi,%r10
   1a071:	4d 89 c3             	mov    %r8,%r11
   1a074:	4d 21 cb             	and    %r9,%r11
   1a077:	49 89 fe             	mov    %rdi,%r14
   1a07a:	4d 29 de             	sub    %r11,%r14
   1a07d:	4d 85 c0             	test   %r8,%r8
   1a080:	4d 0f 49 f2          	cmovns %r10,%r14
   1a084:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1a088:	4c 39 f3             	cmp    %r14,%rbx
   1a08b:	49 0f 42 c8          	cmovb  %r8,%rcx
   1a08f:	4c 8b 46 10          	mov    0x10(%rsi),%r8
   1a093:	4c 89 c6             	mov    %r8,%rsi
   1a096:	48 09 fe             	or     %rdi,%rsi
   1a099:	4d 89 c2             	mov    %r8,%r10
   1a09c:	4d 21 ca             	and    %r9,%r10
   1a09f:	49 89 fb             	mov    %rdi,%r11
   1a0a2:	4d 29 d3             	sub    %r10,%r11
   1a0a5:	4d 85 c0             	test   %r8,%r8
   1a0a8:	4c 0f 49 de          	cmovns %rsi,%r11
   1a0ac:	48 89 d6             	mov    %rdx,%rsi
   1a0af:	48 09 fe             	or     %rdi,%rsi
   1a0b2:	49 89 d2             	mov    %rdx,%r10
   1a0b5:	4d 21 ca             	and    %r9,%r10
   1a0b8:	48 89 fb             	mov    %rdi,%rbx
   1a0bb:	4c 29 d3             	sub    %r10,%rbx
   1a0be:	48 85 d2             	test   %rdx,%rdx
   1a0c1:	48 0f 49 de          	cmovns %rsi,%rbx
   1a0c5:	49 39 db             	cmp    %rbx,%r11
   1a0c8:	4c 0f 47 c2          	cmova  %rdx,%r8
   1a0cc:	48 89 ca             	mov    %rcx,%rdx
   1a0cf:	48 09 fa             	or     %rdi,%rdx
   1a0d2:	48 89 ce             	mov    %rcx,%rsi
   1a0d5:	4c 21 ce             	and    %r9,%rsi
   1a0d8:	49 89 fa             	mov    %rdi,%r10
   1a0db:	49 29 f2             	sub    %rsi,%r10
   1a0de:	48 85 c9             	test   %rcx,%rcx
   1a0e1:	4c 0f 49 d2          	cmovns %rdx,%r10
   1a0e5:	4c 89 c2             	mov    %r8,%rdx
   1a0e8:	48 09 fa             	or     %rdi,%rdx
   1a0eb:	4d 21 c1             	and    %r8,%r9
   1a0ee:	4c 29 cf             	sub    %r9,%rdi
   1a0f1:	4d 85 c0             	test   %r8,%r8
   1a0f4:	48 0f 49 fa          	cmovns %rdx,%rdi
   1a0f8:	45 31 c9             	xor    %r9d,%r9d
   1a0fb:	49 39 fa             	cmp    %rdi,%r10
   1a0fe:	41 0f 96 c1          	setbe  %r9b
   1a102:	5b                   	pop    %rbx
   1a103:	41 5e                	pop    %r14
   1a105:	4c 89 08             	mov    %r9,(%rax)
   1a108:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1a10c:	4c 89 40 10          	mov    %r8,0x10(%rax)
   1a110:	c3                   	ret
   1a111:	4c 89 08             	mov    %r9,(%rax)
   1a114:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1a118:	4c 89 40 10          	mov    %r8,0x10(%rax)
   1a11c:	c3                   	ret
   1a11d:	cc                   	int3
   1a11e:	cc                   	int3
   1a11f:	cc                   	int3

hyperinterval::float::F64Enclosure::contains_point:
   1a120:	41 56                	push   %r14
   1a122:	53                   	push   %rbx
   1a123:	48 83 ec 18          	sub    $0x18,%rsp
   1a127:	49 89 fe             	mov    %rdi,%r14
   1a12a:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1a131:	00 00 80 
   1a134:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1a139:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a13e:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1a145:	00 f0 7f 
   1a148:	48 89 de             	mov    %rbx,%rsi
   1a14b:	e8 40 21 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1a150:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1a155:	3c 01                	cmp    $0x1,%al
   1a157:	75 0d                	jne    1a166 <hyperinterval::float::F64Enclosure::contains_point+0x46>
   1a159:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   1a15e:	48 83 c4 18          	add    $0x18,%rsp
   1a162:	5b                   	pop    %rbx
   1a163:	41 5e                	pop    %r14
   1a165:	c3                   	ret
   1a166:	49 83 3e 01          	cmpq   $0x1,(%r14)
   1a16a:	75 44                	jne    1a1b0 <hyperinterval::float::F64Enclosure::contains_point+0x90>
   1a16c:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1a171:	49 8b 56 08          	mov    0x8(%r14),%rdx
   1a175:	48 89 d7             	mov    %rdx,%rdi
   1a178:	48 09 df             	or     %rbx,%rdi
   1a17b:	48 8d 4b ff          	lea    -0x1(%rbx),%rcx
   1a17f:	49 89 d0             	mov    %rdx,%r8
   1a182:	49 21 c8             	and    %rcx,%r8
   1a185:	49 89 d9             	mov    %rbx,%r9
   1a188:	4d 29 c1             	sub    %r8,%r9
   1a18b:	48 85 d2             	test   %rdx,%rdx
   1a18e:	4c 0f 49 cf          	cmovns %rdi,%r9
   1a192:	48 89 f7             	mov    %rsi,%rdi
   1a195:	48 09 df             	or     %rbx,%rdi
   1a198:	49 89 f0             	mov    %rsi,%r8
   1a19b:	49 21 c8             	and    %rcx,%r8
   1a19e:	48 89 da             	mov    %rbx,%rdx
   1a1a1:	4c 29 c2             	sub    %r8,%rdx
   1a1a4:	48 85 f6             	test   %rsi,%rsi
   1a1a7:	48 0f 49 d7          	cmovns %rdi,%rdx
   1a1ab:	49 39 d1             	cmp    %rdx,%r9
   1a1ae:	76 0a                	jbe    1a1ba <hyperinterval::float::F64Enclosure::contains_point+0x9a>
   1a1b0:	31 d2                	xor    %edx,%edx
   1a1b2:	48 83 c4 18          	add    $0x18,%rsp
   1a1b6:	5b                   	pop    %rbx
   1a1b7:	41 5e                	pop    %r14
   1a1b9:	c3                   	ret
   1a1ba:	49 8b 76 10          	mov    0x10(%r14),%rsi
   1a1be:	48 89 f7             	mov    %rsi,%rdi
   1a1c1:	48 09 df             	or     %rbx,%rdi
   1a1c4:	48 21 f1             	and    %rsi,%rcx
   1a1c7:	48 29 cb             	sub    %rcx,%rbx
   1a1ca:	48 85 f6             	test   %rsi,%rsi
   1a1cd:	48 0f 49 df          	cmovns %rdi,%rbx
   1a1d1:	48 39 da             	cmp    %rbx,%rdx
   1a1d4:	0f 96 c2             	setbe  %dl
   1a1d7:	48 83 c4 18          	add    $0x18,%rsp
   1a1db:	5b                   	pop    %rbx
   1a1dc:	41 5e                	pop    %r14
   1a1de:	c3                   	ret
   1a1df:	cc                   	int3

hyperinterval::float::F64Enclosure::interior_subset_of:
   1a1e0:	b0 01                	mov    $0x1,%al
   1a1e2:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1a1e6:	0f 85 93 00 00 00    	jne    1a27f <hyperinterval::float::F64Enclosure::interior_subset_of+0x9f>
   1a1ec:	f6 06 01             	testb  $0x1,(%rsi)
   1a1ef:	0f 84 88 00 00 00    	je     1a27d <hyperinterval::float::F64Enclosure::interior_subset_of+0x9d>
   1a1f5:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1a1f9:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1a1fd:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1a204:	00 00 80 
   1a207:	4d 89 c1             	mov    %r8,%r9
   1a20a:	49 09 c1             	or     %rax,%r9
   1a20d:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1a211:	4d 89 c2             	mov    %r8,%r10
   1a214:	49 21 ca             	and    %rcx,%r10
   1a217:	49 89 c3             	mov    %rax,%r11
   1a21a:	4d 29 d3             	sub    %r10,%r11
   1a21d:	4d 85 c0             	test   %r8,%r8
   1a220:	4d 0f 49 d9          	cmovns %r9,%r11
   1a224:	49 89 d0             	mov    %rdx,%r8
   1a227:	49 09 c0             	or     %rax,%r8
   1a22a:	49 89 d1             	mov    %rdx,%r9
   1a22d:	49 21 c9             	and    %rcx,%r9
   1a230:	49 89 c2             	mov    %rax,%r10
   1a233:	4d 29 ca             	sub    %r9,%r10
   1a236:	48 85 d2             	test   %rdx,%rdx
   1a239:	4d 0f 49 d0          	cmovns %r8,%r10
   1a23d:	4d 39 d3             	cmp    %r10,%r11
   1a240:	73 3b                	jae    1a27d <hyperinterval::float::F64Enclosure::interior_subset_of+0x9d>
   1a242:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1a246:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1a24a:	48 89 d7             	mov    %rdx,%rdi
   1a24d:	48 09 c7             	or     %rax,%rdi
   1a250:	49 89 d0             	mov    %rdx,%r8
   1a253:	49 21 c8             	and    %rcx,%r8
   1a256:	49 89 c1             	mov    %rax,%r9
   1a259:	4d 29 c1             	sub    %r8,%r9
   1a25c:	48 85 d2             	test   %rdx,%rdx
   1a25f:	4c 0f 49 cf          	cmovns %rdi,%r9
   1a263:	48 89 f2             	mov    %rsi,%rdx
   1a266:	48 09 c2             	or     %rax,%rdx
   1a269:	48 21 f1             	and    %rsi,%rcx
   1a26c:	48 29 c8             	sub    %rcx,%rax
   1a26f:	48 85 f6             	test   %rsi,%rsi
   1a272:	48 0f 49 c2          	cmovns %rdx,%rax
   1a276:	49 39 c1             	cmp    %rax,%r9
   1a279:	0f 92 c0             	setb   %al
   1a27c:	c3                   	ret
   1a27d:	31 c0                	xor    %eax,%eax
   1a27f:	c3                   	ret

hyperinterval::float::F64Enclosure::add:
   1a280:	48 89 f8             	mov    %rdi,%rax
   1a283:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1a287:	0f 85 cb 00 00 00    	jne    1a358 <hyperinterval::float::F64Enclosure::add+0xd8>
   1a28d:	f6 02 01             	testb  $0x1,(%rdx)
   1a290:	0f 84 c2 00 00 00    	je     1a358 <hyperinterval::float::F64Enclosure::add+0xd8>
   1a296:	55                   	push   %rbp
   1a297:	41 57                	push   %r15
   1a299:	41 56                	push   %r14
   1a29b:	41 55                	push   %r13
   1a29d:	41 54                	push   %r12
   1a29f:	53                   	push   %rbx
   1a2a0:	48 83 ec 18          	sub    $0x18,%rsp
   1a2a4:	48 89 c5             	mov    %rax,%rbp
   1a2a7:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1a2ab:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1a2af:	4c 8b 62 10          	mov    0x10(%rdx),%r12
   1a2b3:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1a2ba:	00 00 80 
   1a2bd:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1a2c4:	00 f0 7f 
   1a2c7:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   1a2cb:	48 89 e7             	mov    %rsp,%rdi
   1a2ce:	48 89 de             	mov    %rbx,%rsi
   1a2d1:	4c 89 f2             	mov    %r14,%rdx
   1a2d4:	e8 07 10 00 00       	call   1b2e0 <hyperinterval::ieee::Format::add>
   1a2d9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a2dd:	74 57                	je     1a336 <hyperinterval::float::F64Enclosure::add+0xb6>
   1a2df:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1a2e4:	48 89 e7             	mov    %rsp,%rdi
   1a2e7:	48 89 de             	mov    %rbx,%rsi
   1a2ea:	4c 89 f2             	mov    %r14,%rdx
   1a2ed:	4c 89 f9             	mov    %r15,%rcx
   1a2f0:	4d 89 e0             	mov    %r12,%r8
   1a2f3:	e8 e8 0f 00 00       	call   1b2e0 <hyperinterval::ieee::Format::add>
   1a2f8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a2fc:	74 38                	je     1a336 <hyperinterval::float::F64Enclosure::add+0xb6>
   1a2fe:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1a303:	48 89 e7             	mov    %rsp,%rdi
   1a306:	48 89 de             	mov    %rbx,%rsi
   1a309:	4c 89 f2             	mov    %r14,%rdx
   1a30c:	4c 89 e9             	mov    %r13,%rcx
   1a30f:	e8 7c 1f 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1a314:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a318:	74 1c                	je     1a336 <hyperinterval::float::F64Enclosure::add+0xb6>
   1a31a:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1a31f:	48 89 e7             	mov    %rsp,%rdi
   1a322:	48 89 de             	mov    %rbx,%rsi
   1a325:	4c 89 f2             	mov    %r14,%rdx
   1a328:	4c 89 f9             	mov    %r15,%rcx
   1a32b:	e8 60 1f 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1a330:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a334:	75 2a                	jne    1a360 <hyperinterval::float::F64Enclosure::add+0xe0>
   1a336:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   1a33b:	48 89 e8             	mov    %rbp,%rax
   1a33e:	88 4d 08             	mov    %cl,0x8(%rbp)
   1a341:	48 c7 45 00 02 00 00 	movq   $0x2,0x0(%rbp)
   1a348:	00 
   1a349:	48 83 c4 18          	add    $0x18,%rsp
   1a34d:	5b                   	pop    %rbx
   1a34e:	41 5c                	pop    %r12
   1a350:	41 5d                	pop    %r13
   1a352:	41 5e                	pop    %r14
   1a354:	41 5f                	pop    %r15
   1a356:	5d                   	pop    %rbp
   1a357:	c3                   	ret
   1a358:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   1a35f:	c3                   	ret
   1a360:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a365:	4c 89 e0             	mov    %r12,%rax
   1a368:	48 09 d8             	or     %rbx,%rax
   1a36b:	48 8d 53 ff          	lea    -0x1(%rbx),%rdx
   1a36f:	4c 89 e6             	mov    %r12,%rsi
   1a372:	48 21 d6             	and    %rdx,%rsi
   1a375:	48 89 df             	mov    %rbx,%rdi
   1a378:	48 29 f7             	sub    %rsi,%rdi
   1a37b:	4d 85 e4             	test   %r12,%r12
   1a37e:	48 0f 49 f8          	cmovns %rax,%rdi
   1a382:	48 89 c8             	mov    %rcx,%rax
   1a385:	48 09 d8             	or     %rbx,%rax
   1a388:	48 21 ca             	and    %rcx,%rdx
   1a38b:	48 29 d3             	sub    %rdx,%rbx
   1a38e:	48 85 c9             	test   %rcx,%rcx
   1a391:	48 0f 49 d8          	cmovns %rax,%rbx
   1a395:	48 39 df             	cmp    %rbx,%rdi
   1a398:	48 89 e8             	mov    %rbp,%rax
   1a39b:	76 0d                	jbe    1a3aa <hyperinterval::float::F64Enclosure::add+0x12a>
   1a39d:	c6 40 08 01          	movb   $0x1,0x8(%rax)
   1a3a1:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1a3a8:	eb 9f                	jmp    1a349 <hyperinterval::float::F64Enclosure::add+0xc9>
   1a3aa:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   1a3b1:	4c 89 60 08          	mov    %r12,0x8(%rax)
   1a3b5:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1a3b9:	eb 8e                	jmp    1a349 <hyperinterval::float::F64Enclosure::add+0xc9>
   1a3bb:	cc                   	int3
   1a3bc:	cc                   	int3
   1a3bd:	cc                   	int3
   1a3be:	cc                   	int3
   1a3bf:	cc                   	int3

hyperinterval::float::F64Enclosure::div:
   1a3c0:	53                   	push   %rbx
   1a3c1:	48 89 fb             	mov    %rdi,%rbx
   1a3c4:	83 3a 01             	cmpl   $0x1,(%rdx)
   1a3c7:	75 1e                	jne    1a3e7 <hyperinterval::float::F64Enclosure::div+0x27>
   1a3c9:	48 83 7a 08 00       	cmpq   $0x0,0x8(%rdx)
   1a3ce:	7f 17                	jg     1a3e7 <hyperinterval::float::F64Enclosure::div+0x27>
   1a3d0:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1a3d4:	48 85 c0             	test   %rax,%rax
   1a3d7:	0f 99 c1             	setns  %cl
   1a3da:	48 d1 e0             	shl    $1,%rax
   1a3dd:	48 85 c0             	test   %rax,%rax
   1a3e0:	0f 94 c0             	sete   %al
   1a3e3:	08 c8                	or     %cl,%al
   1a3e5:	75 12                	jne    1a3f9 <hyperinterval::float::F64Enclosure::div+0x39>
   1a3e7:	48 89 df             	mov    %rbx,%rdi
   1a3ea:	b9 01 00 00 00       	mov    $0x1,%ecx
   1a3ef:	e8 0c f5 ff ff       	call   19900 <hyperinterval::float::F64Enclosure::corner_image>
   1a3f4:	48 89 d8             	mov    %rbx,%rax
   1a3f7:	5b                   	pop    %rbx
   1a3f8:	c3                   	ret
   1a3f9:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
   1a3fd:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a404:	48 89 d8             	mov    %rbx,%rax
   1a407:	5b                   	pop    %rbx
   1a408:	c3                   	ret
   1a409:	cc                   	int3
   1a40a:	cc                   	int3
   1a40b:	cc                   	int3
   1a40c:	cc                   	int3
   1a40d:	cc                   	int3
   1a40e:	cc                   	int3
   1a40f:	cc                   	int3

hyperinterval::float::F64Enclosure::new:
   1a410:	41 57                	push   %r15
   1a412:	41 56                	push   %r14
   1a414:	41 54                	push   %r12
   1a416:	53                   	push   %rbx
   1a417:	48 83 ec 18          	sub    $0x18,%rsp
   1a41b:	f2 0f 11 4c 24 10    	movsd  %xmm1,0x10(%rsp)
   1a421:	48 89 fb             	mov    %rdi,%rbx
   1a424:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a42b:	00 00 80 
   1a42e:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a435:	00 f0 7f 
   1a438:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1a43d:	48 89 e7             	mov    %rsp,%rdi
   1a440:	4c 89 f6             	mov    %r14,%rsi
   1a443:	4c 89 fa             	mov    %r15,%rdx
   1a446:	e8 45 1e 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1a44b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a44f:	74 24                	je     1a475 <hyperinterval::float::F64Enclosure::new+0x65>
   1a451:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1a456:	f3 0f 7e 44 24 10    	movq   0x10(%rsp),%xmm0
   1a45c:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1a461:	48 89 e7             	mov    %rsp,%rdi
   1a464:	4c 89 f6             	mov    %r14,%rsi
   1a467:	4c 89 fa             	mov    %r15,%rdx
   1a46a:	e8 21 1e 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1a46f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a473:	75 1e                	jne    1a493 <hyperinterval::float::F64Enclosure::new+0x83>
   1a475:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a47a:	88 43 08             	mov    %al,0x8(%rbx)
   1a47d:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a484:	48 89 d8             	mov    %rbx,%rax
   1a487:	48 83 c4 18          	add    $0x18,%rsp
   1a48b:	5b                   	pop    %rbx
   1a48c:	41 5c                	pop    %r12
   1a48e:	41 5e                	pop    %r14
   1a490:	41 5f                	pop    %r15
   1a492:	c3                   	ret
   1a493:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a498:	4c 89 e1             	mov    %r12,%rcx
   1a49b:	4c 09 f1             	or     %r14,%rcx
   1a49e:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   1a4a2:	4c 89 e6             	mov    %r12,%rsi
   1a4a5:	48 21 d6             	and    %rdx,%rsi
   1a4a8:	4c 89 f7             	mov    %r14,%rdi
   1a4ab:	48 29 f7             	sub    %rsi,%rdi
   1a4ae:	4d 85 e4             	test   %r12,%r12
   1a4b1:	48 0f 49 f9          	cmovns %rcx,%rdi
   1a4b5:	48 89 c1             	mov    %rax,%rcx
   1a4b8:	4c 09 f1             	or     %r14,%rcx
   1a4bb:	48 21 c2             	and    %rax,%rdx
   1a4be:	49 29 d6             	sub    %rdx,%r14
   1a4c1:	48 85 c0             	test   %rax,%rax
   1a4c4:	4c 0f 49 f1          	cmovns %rcx,%r14
   1a4c8:	4c 39 f7             	cmp    %r14,%rdi
   1a4cb:	76 06                	jbe    1a4d3 <hyperinterval::float::F64Enclosure::new+0xc3>
   1a4cd:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1a4d1:	eb aa                	jmp    1a47d <hyperinterval::float::F64Enclosure::new+0x6d>
   1a4d3:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1a4da:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   1a4de:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1a4e2:	eb a0                	jmp    1a484 <hyperinterval::float::F64Enclosure::new+0x74>
   1a4e4:	cc                   	int3
   1a4e5:	cc                   	int3
   1a4e6:	cc                   	int3
   1a4e7:	cc                   	int3
   1a4e8:	cc                   	int3
   1a4e9:	cc                   	int3
   1a4ea:	cc                   	int3
   1a4eb:	cc                   	int3
   1a4ec:	cc                   	int3
   1a4ed:	cc                   	int3
   1a4ee:	cc                   	int3
   1a4ef:	cc                   	int3

hyperinterval::float::F64Enclosure::sub:
   1a4f0:	53                   	push   %rbx
   1a4f1:	48 83 ec 20          	sub    $0x20,%rsp
   1a4f5:	48 89 fb             	mov    %rdi,%rbx
   1a4f8:	48 83 3a 01          	cmpq   $0x1,(%rdx)
   1a4fc:	75 30                	jne    1a52e <hyperinterval::float::F64Enclosure::sub+0x3e>
   1a4fe:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   1a502:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1a506:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1a50d:	00 00 80 
   1a510:	48 89 d1             	mov    %rdx,%rcx
   1a513:	48 31 c1             	xor    %rax,%rcx
   1a516:	48 85 d2             	test   %rdx,%rdx
   1a519:	48 0f 44 ca          	cmove  %rdx,%rcx
   1a51d:	48 31 f8             	xor    %rdi,%rax
   1a520:	48 85 ff             	test   %rdi,%rdi
   1a523:	48 0f 44 c7          	cmove  %rdi,%rax
   1a527:	ba 01 00 00 00       	mov    $0x1,%edx
   1a52c:	eb 02                	jmp    1a530 <hyperinterval::float::F64Enclosure::sub+0x40>
   1a52e:	31 d2                	xor    %edx,%edx
   1a530:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1a535:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
   1a53a:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1a53f:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
   1a544:	48 89 df             	mov    %rbx,%rdi
   1a547:	ff 15 63 3f 04 00    	call   *0x43f63(%rip)        # 5e4b0 <_DYNAMIC+0x300>
   1a54d:	48 89 d8             	mov    %rbx,%rax
   1a550:	48 83 c4 20          	add    $0x20,%rsp
   1a554:	5b                   	pop    %rbx
   1a555:	c3                   	ret
   1a556:	cc                   	int3
   1a557:	cc                   	int3
   1a558:	cc                   	int3
   1a559:	cc                   	int3
   1a55a:	cc                   	int3
   1a55b:	cc                   	int3
   1a55c:	cc                   	int3
   1a55d:	cc                   	int3
   1a55e:	cc                   	int3
   1a55f:	cc                   	int3

hyperinterval::float::F64Enclosure::hull:
   1a560:	48 89 f8             	mov    %rdi,%rax
   1a563:	4c 8b 02             	mov    (%rdx),%r8
   1a566:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   1a56a:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
   1a56e:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1a572:	0f 85 a7 00 00 00    	jne    1a61f <hyperinterval::float::F64Enclosure::hull+0xbf>
   1a578:	4c 8b 56 08          	mov    0x8(%rsi),%r10
   1a57c:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1a580:	ba 01 00 00 00       	mov    $0x1,%edx
   1a585:	49 83 f8 01          	cmp    $0x1,%r8
   1a589:	0f 85 9f 00 00 00    	jne    1a62e <hyperinterval::float::F64Enclosure::hull+0xce>
   1a58f:	41 57                	push   %r15
   1a591:	41 56                	push   %r14
   1a593:	53                   	push   %rbx
   1a594:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1a59b:	00 00 80 
   1a59e:	4d 89 d3             	mov    %r10,%r11
   1a5a1:	4d 09 c3             	or     %r8,%r11
   1a5a4:	4d 8d 48 ff          	lea    -0x1(%r8),%r9
   1a5a8:	4c 89 d3             	mov    %r10,%rbx
   1a5ab:	4c 21 cb             	and    %r9,%rbx
   1a5ae:	4d 89 c6             	mov    %r8,%r14
   1a5b1:	49 29 de             	sub    %rbx,%r14
   1a5b4:	4d 85 d2             	test   %r10,%r10
   1a5b7:	4d 0f 49 f3          	cmovns %r11,%r14
   1a5bb:	49 89 fb             	mov    %rdi,%r11
   1a5be:	4d 09 c3             	or     %r8,%r11
   1a5c1:	48 89 fb             	mov    %rdi,%rbx
   1a5c4:	4c 21 cb             	and    %r9,%rbx
   1a5c7:	4d 89 c7             	mov    %r8,%r15
   1a5ca:	49 29 df             	sub    %rbx,%r15
   1a5cd:	48 85 ff             	test   %rdi,%rdi
   1a5d0:	4d 0f 49 fb          	cmovns %r11,%r15
   1a5d4:	4d 39 fe             	cmp    %r15,%r14
   1a5d7:	49 0f 46 fa          	cmovbe %r10,%rdi
   1a5db:	49 89 f2             	mov    %rsi,%r10
   1a5de:	4d 09 c2             	or     %r8,%r10
   1a5e1:	49 89 f3             	mov    %rsi,%r11
   1a5e4:	4d 21 cb             	and    %r9,%r11
   1a5e7:	4c 89 c3             	mov    %r8,%rbx
   1a5ea:	4c 29 db             	sub    %r11,%rbx
   1a5ed:	48 85 f6             	test   %rsi,%rsi
   1a5f0:	49 0f 49 da          	cmovns %r10,%rbx
   1a5f4:	49 89 ca             	mov    %rcx,%r10
   1a5f7:	4d 09 c2             	or     %r8,%r10
   1a5fa:	49 21 c9             	and    %rcx,%r9
   1a5fd:	4d 29 c8             	sub    %r9,%r8
   1a600:	48 85 c9             	test   %rcx,%rcx
   1a603:	4d 0f 49 c2          	cmovns %r10,%r8
   1a607:	4c 39 c3             	cmp    %r8,%rbx
   1a60a:	48 0f 43 ce          	cmovae %rsi,%rcx
   1a60e:	5b                   	pop    %rbx
   1a60f:	41 5e                	pop    %r14
   1a611:	41 5f                	pop    %r15
   1a613:	48 89 10             	mov    %rdx,(%rax)
   1a616:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1a61a:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1a61e:	c3                   	ret
   1a61f:	4c 89 c2             	mov    %r8,%rdx
   1a622:	48 89 10             	mov    %rdx,(%rax)
   1a625:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1a629:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1a62d:	c3                   	ret
   1a62e:	48 89 f1             	mov    %rsi,%rcx
   1a631:	4c 89 d7             	mov    %r10,%rdi
   1a634:	48 89 10             	mov    %rdx,(%rax)
   1a637:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1a63b:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1a63f:	c3                   	ret

hyperinterval::float::F64Enclosure::point:
   1a640:	53                   	push   %rbx
   1a641:	48 83 ec 10          	sub    $0x10,%rsp
   1a645:	48 89 fb             	mov    %rdi,%rbx
   1a648:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1a64d:	48 89 e7             	mov    %rsp,%rdi
   1a650:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1a657:	00 00 80 
   1a65a:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1a661:	00 f0 7f 
   1a664:	e8 27 1c 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1a669:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a66d:	75 0f                	jne    1a67e <hyperinterval::float::F64Enclosure::point+0x3e>
   1a66f:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a674:	88 43 08             	mov    %al,0x8(%rbx)
   1a677:	b8 02 00 00 00       	mov    $0x2,%eax
   1a67c:	eb 12                	jmp    1a690 <hyperinterval::float::F64Enclosure::point+0x50>
   1a67e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a683:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1a687:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1a68b:	b8 01 00 00 00       	mov    $0x1,%eax
   1a690:	48 89 03             	mov    %rax,(%rbx)
   1a693:	48 89 d8             	mov    %rbx,%rax
   1a696:	48 83 c4 10          	add    $0x10,%rsp
   1a69a:	5b                   	pop    %rbx
   1a69b:	c3                   	ret
   1a69c:	cc                   	int3
   1a69d:	cc                   	int3
   1a69e:	cc                   	int3
   1a69f:	cc                   	int3

hyperinterval::float::F64Enclosure::signs:
   1a6a0:	83 3f 01             	cmpl   $0x1,(%rdi)
   1a6a3:	75 6b                	jne    1a710 <hyperinterval::float::F64Enclosure::signs+0x70>
   1a6a5:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1a6ac:	00 00 80 
   1a6af:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   1a6b3:	48 8b 47 10          	mov    0x10(%rdi),%rax
   1a6b7:	48 89 ca             	mov    %rcx,%rdx
   1a6ba:	4c 09 c2             	or     %r8,%rdx
   1a6bd:	49 8d 70 ff          	lea    -0x1(%r8),%rsi
   1a6c1:	49 89 c9             	mov    %rcx,%r9
   1a6c4:	49 21 f1             	and    %rsi,%r9
   1a6c7:	4c 89 c7             	mov    %r8,%rdi
   1a6ca:	4c 29 cf             	sub    %r9,%rdi
   1a6cd:	48 85 c9             	test   %rcx,%rcx
   1a6d0:	48 0f 49 fa          	cmovns %rdx,%rdi
   1a6d4:	31 d2                	xor    %edx,%edx
   1a6d6:	48 85 ff             	test   %rdi,%rdi
   1a6d9:	0f 99 c1             	setns  %cl
   1a6dc:	4c 39 c7             	cmp    %r8,%rdi
   1a6df:	77 1f                	ja     1a700 <hyperinterval::float::F64Enclosure::signs+0x60>
   1a6e1:	48 85 ff             	test   %rdi,%rdi
   1a6e4:	40 0f 99 c7          	setns  %dil
   1a6e8:	40 80 cf 02          	or     $0x2,%dil
   1a6ec:	48 85 f0             	test   %rsi,%rax
   1a6ef:	88 ca                	mov    %cl,%dl
   1a6f1:	40 0f b6 cf          	movzbl %dil,%ecx
   1a6f5:	0f 44 d1             	cmove  %ecx,%edx
   1a6f8:	48 85 c0             	test   %rax,%rax
   1a6fb:	0f 49 d1             	cmovns %ecx,%edx
   1a6fe:	89 d1                	mov    %edx,%ecx
   1a700:	8d 51 04             	lea    0x4(%rcx),%edx
   1a703:	48 85 c0             	test   %rax,%rax
   1a706:	0f b6 c9             	movzbl %cl,%ecx
   1a709:	0f b6 c2             	movzbl %dl,%eax
   1a70c:	0f 4e c1             	cmovle %ecx,%eax
   1a70f:	c3                   	ret
   1a710:	31 c0                	xor    %eax,%eax
   1a712:	c3                   	ret
   1a713:	cc                   	int3
   1a714:	cc                   	int3
   1a715:	cc                   	int3
   1a716:	cc                   	int3
   1a717:	cc                   	int3
   1a718:	cc                   	int3
   1a719:	cc                   	int3
   1a71a:	cc                   	int3
   1a71b:	cc                   	int3
   1a71c:	cc                   	int3
   1a71d:	cc                   	int3
   1a71e:	cc                   	int3
   1a71f:	cc                   	int3

hyperinterval::float::F64Enclosure::affine:
   1a720:	55                   	push   %rbp
   1a721:	41 57                	push   %r15
   1a723:	41 56                	push   %r14
   1a725:	41 55                	push   %r13
   1a727:	41 54                	push   %r12
   1a729:	53                   	push   %rbx
   1a72a:	48 83 ec 28          	sub    $0x28,%rsp
   1a72e:	f2 0f 11 4c 24 18    	movsd  %xmm1,0x18(%rsp)
   1a734:	49 89 f5             	mov    %rsi,%r13
   1a737:	48 89 fb             	mov    %rdi,%rbx
   1a73a:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a741:	00 00 80 
   1a744:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a74b:	00 f0 7f 
   1a74e:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1a753:	48 89 e7             	mov    %rsp,%rdi
   1a756:	4c 89 f6             	mov    %r14,%rsi
   1a759:	4c 89 fa             	mov    %r15,%rdx
   1a75c:	e8 2f 1b 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1a761:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a765:	74 24                	je     1a78b <hyperinterval::float::F64Enclosure::affine+0x6b>
   1a767:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1a76c:	f3 0f 7e 44 24 18    	movq   0x18(%rsp),%xmm0
   1a772:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1a777:	48 89 e7             	mov    %rsp,%rdi
   1a77a:	4c 89 f6             	mov    %r14,%rsi
   1a77d:	4c 89 fa             	mov    %r15,%rdx
   1a780:	e8 0b 1b 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1a785:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a789:	75 21                	jne    1a7ac <hyperinterval::float::F64Enclosure::affine+0x8c>
   1a78b:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a790:	88 43 08             	mov    %al,0x8(%rbx)
   1a793:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a79a:	48 89 d8             	mov    %rbx,%rax
   1a79d:	48 83 c4 28          	add    $0x28,%rsp
   1a7a1:	5b                   	pop    %rbx
   1a7a2:	41 5c                	pop    %r12
   1a7a4:	41 5d                	pop    %r13
   1a7a6:	41 5e                	pop    %r14
   1a7a8:	41 5f                	pop    %r15
   1a7aa:	5d                   	pop    %rbp
   1a7ab:	c3                   	ret
   1a7ac:	41 f6 45 00 01       	testb  $0x1,0x0(%r13)
   1a7b1:	0f 84 0a 01 00 00    	je     1a8c1 <hyperinterval::float::F64Enclosure::affine+0x1a1>
   1a7b7:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1a7bc:	49 8b 45 10          	mov    0x10(%r13),%rax
   1a7c0:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1a7c5:	49 8b 4d 08          	mov    0x8(%r13),%rcx
   1a7c9:	48 89 e7             	mov    %rsp,%rdi
   1a7cc:	4c 89 f6             	mov    %r14,%rsi
   1a7cf:	4c 89 fa             	mov    %r15,%rdx
   1a7d2:	4d 89 e0             	mov    %r12,%r8
   1a7d5:	49 89 e9             	mov    %rbp,%r9
   1a7d8:	e8 c3 16 00 00       	call   1bea0 <hyperinterval::ieee::Format::affine>
   1a7dd:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a7e1:	74 a8                	je     1a78b <hyperinterval::float::F64Enclosure::affine+0x6b>
   1a7e3:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1a7e8:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1a7ed:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1a7f2:	48 89 e7             	mov    %rsp,%rdi
   1a7f5:	4c 89 f6             	mov    %r14,%rsi
   1a7f8:	4c 89 fa             	mov    %r15,%rdx
   1a7fb:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1a800:	4d 89 e0             	mov    %r12,%r8
   1a803:	49 89 e9             	mov    %rbp,%r9
   1a806:	e8 95 16 00 00       	call   1bea0 <hyperinterval::ieee::Format::affine>
   1a80b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a80f:	0f 84 76 ff ff ff    	je     1a78b <hyperinterval::float::F64Enclosure::affine+0x6b>
   1a815:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1a81a:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1a81f:	48 89 e7             	mov    %rsp,%rdi
   1a822:	4c 89 f6             	mov    %r14,%rsi
   1a825:	4c 89 fa             	mov    %r15,%rdx
   1a828:	4c 89 e9             	mov    %r13,%rcx
   1a82b:	e8 60 1a 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1a830:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a834:	0f 84 51 ff ff ff    	je     1a78b <hyperinterval::float::F64Enclosure::affine+0x6b>
   1a83a:	4d 89 e5             	mov    %r12,%r13
   1a83d:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1a842:	48 89 e7             	mov    %rsp,%rdi
   1a845:	4c 89 f6             	mov    %r14,%rsi
   1a848:	4c 89 fa             	mov    %r15,%rdx
   1a84b:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1a850:	e8 3b 1a 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1a855:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a859:	0f 84 2c ff ff ff    	je     1a78b <hyperinterval::float::F64Enclosure::affine+0x6b>
   1a85f:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1a864:	4c 89 e0             	mov    %r12,%rax
   1a867:	4c 09 f0             	or     %r14,%rax
   1a86a:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1a86e:	4c 89 e2             	mov    %r12,%rdx
   1a871:	48 21 ca             	and    %rcx,%rdx
   1a874:	4c 89 f6             	mov    %r14,%rsi
   1a877:	48 29 d6             	sub    %rdx,%rsi
   1a87a:	4d 85 e4             	test   %r12,%r12
   1a87d:	48 0f 49 f0          	cmovns %rax,%rsi
   1a881:	4c 89 f8             	mov    %r15,%rax
   1a884:	4c 09 f0             	or     %r14,%rax
   1a887:	4c 21 f9             	and    %r15,%rcx
   1a88a:	49 29 ce             	sub    %rcx,%r14
   1a88d:	4d 85 ff             	test   %r15,%r15
   1a890:	4c 0f 49 f0          	cmovns %rax,%r14
   1a894:	b0 01                	mov    $0x1,%al
   1a896:	4c 39 f6             	cmp    %r14,%rsi
   1a899:	0f 87 f1 fe ff ff    	ja     1a790 <hyperinterval::float::F64Enclosure::affine+0x70>
   1a89f:	48 89 e7             	mov    %rsp,%rdi
   1a8a2:	4c 89 ee             	mov    %r13,%rsi
   1a8a5:	48 89 ea             	mov    %rbp,%rdx
   1a8a8:	e8 73 06 00 00       	call   1af20 <hyperinterval::float::F64Enclosure::from_bits>
   1a8ad:	48 8b 04 24          	mov    (%rsp),%rax
   1a8b1:	48 83 f8 02          	cmp    $0x2,%rax
   1a8b5:	75 16                	jne    1a8cd <hyperinterval::float::F64Enclosure::affine+0x1ad>
   1a8b7:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1a8bc:	e9 cf fe ff ff       	jmp    1a790 <hyperinterval::float::F64Enclosure::affine+0x70>
   1a8c1:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1a8c8:	e9 cd fe ff ff       	jmp    1a79a <hyperinterval::float::F64Enclosure::affine+0x7a>
   1a8cd:	83 f8 01             	cmp    $0x1,%eax
   1a8d0:	75 1b                	jne    1a8ed <hyperinterval::float::F64Enclosure::affine+0x1cd>
   1a8d2:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1a8d7:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1a8dc:	4c 89 e7             	mov    %r12,%rdi
   1a8df:	4c 89 fe             	mov    %r15,%rsi
   1a8e2:	e8 89 1d 00 00       	call   1c670 <hyperinterval::bounds::Bounds<T>::hull>
   1a8e7:	49 89 c4             	mov    %rax,%r12
   1a8ea:	49 89 d7             	mov    %rdx,%r15
   1a8ed:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1a8f4:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   1a8f8:	4c 89 7b 10          	mov    %r15,0x10(%rbx)
   1a8fc:	e9 99 fe ff ff       	jmp    1a79a <hyperinterval::float::F64Enclosure::affine+0x7a>
   1a901:	cc                   	int3
   1a902:	cc                   	int3
   1a903:	cc                   	int3
   1a904:	cc                   	int3
   1a905:	cc                   	int3
   1a906:	cc                   	int3
   1a907:	cc                   	int3
   1a908:	cc                   	int3
   1a909:	cc                   	int3
   1a90a:	cc                   	int3
   1a90b:	cc                   	int3
   1a90c:	cc                   	int3
   1a90d:	cc                   	int3
   1a90e:	cc                   	int3
   1a90f:	cc                   	int3

hyperinterval::float::F64Enclosure::square:
   1a910:	55                   	push   %rbp
   1a911:	41 57                	push   %r15
   1a913:	41 56                	push   %r14
   1a915:	41 55                	push   %r13
   1a917:	41 54                	push   %r12
   1a919:	53                   	push   %rbx
   1a91a:	48 83 ec 58          	sub    $0x58,%rsp
   1a91e:	48 89 fb             	mov    %rdi,%rbx
   1a921:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1a925:	0f 85 0c 01 00 00    	jne    1aa37 <hyperinterval::float::F64Enclosure::square+0x127>
   1a92b:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1a92f:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
   1a936:	00 00 80 
   1a939:	49 b8 00 00 00 00 00 	movabs $0x7ff0000000000000,%r8
   1a940:	00 f0 7f 
   1a943:	49 be ff ff ff ff ff 	movabs $0xfffffffffffff,%r14
   1a94a:	ff 0f 00 
   1a94d:	48 8b 56 08          	mov    0x8(%rsi),%rdx
   1a951:	48 89 d1             	mov    %rdx,%rcx
   1a954:	48 c1 e9 34          	shr    $0x34,%rcx
   1a958:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1a95e:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
   1a963:	4c 21 f2             	and    %r14,%rdx
   1a966:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   1a96a:	48 85 c9             	test   %rcx,%rcx
   1a96d:	48 89 e8             	mov    %rbp,%rax
   1a970:	48 0f 44 c1          	cmove  %rcx,%rax
   1a974:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1a97b:	41 bd 9c f7 ff ff    	mov    $0xfffff79c,%r13d
   1a981:	41 0f 44 cd          	cmove  %r13d,%ecx
   1a985:	48 09 d0             	or     %rdx,%rax
   1a988:	48 f7 e0             	mul    %rax
   1a98b:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1a990:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1a995:	48 89 04 24          	mov    %rax,(%rsp)
   1a999:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1a99d:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1a9a2:	48 89 e1             	mov    %rsp,%rcx
   1a9a5:	4c 89 e6             	mov    %r12,%rsi
   1a9a8:	4c 89 c2             	mov    %r8,%rdx
   1a9ab:	e8 20 19 00 00       	call   1c2d0 <hyperinterval::ieee::Format::rounded>
   1a9b0:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
   1a9b5:	75 79                	jne    1aa30 <hyperinterval::float::F64Enclosure::square+0x120>
   1a9b7:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   1a9bc:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1a9c1:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   1a9c6:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1a9cb:	4c 89 f8             	mov    %r15,%rax
   1a9ce:	48 c1 e8 34          	shr    $0x34,%rax
   1a9d2:	25 ff 07 00 00       	and    $0x7ff,%eax
   1a9d7:	4c 89 7c 24 40       	mov    %r15,0x40(%rsp)
   1a9dc:	4d 21 fe             	and    %r15,%r14
   1a9df:	48 85 c0             	test   %rax,%rax
   1a9e2:	48 0f 44 e8          	cmove  %rax,%rbp
   1a9e6:	8d 8c 00 9a f7 ff ff 	lea    -0x866(%rax,%rax,1),%ecx
   1a9ed:	41 0f 44 cd          	cmove  %r13d,%ecx
   1a9f1:	4c 09 f5             	or     %r14,%rbp
   1a9f4:	48 89 e8             	mov    %rbp,%rax
   1a9f7:	48 f7 e5             	mul    %rbp
   1a9fa:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1a9ff:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1aa04:	48 89 04 24          	mov    %rax,(%rsp)
   1aa08:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1aa0c:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1aa11:	48 89 e1             	mov    %rsp,%rcx
   1aa14:	4c 89 e6             	mov    %r12,%rsi
   1aa17:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1aa1e:	00 f0 7f 
   1aa21:	4c 89 fa             	mov    %r15,%rdx
   1aa24:	e8 a7 18 00 00       	call   1c2d0 <hyperinterval::ieee::Format::rounded>
   1aa29:	80 7c 24 28 01       	cmpb   $0x1,0x28(%rsp)
   1aa2e:	75 10                	jne    1aa40 <hyperinterval::float::F64Enclosure::square+0x130>
   1aa30:	0f b6 44 24 29       	movzbl 0x29(%rsp),%eax
   1aa35:	eb 4f                	jmp    1aa86 <hyperinterval::float::F64Enclosure::square+0x176>
   1aa37:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1aa3e:	eb 50                	jmp    1aa90 <hyperinterval::float::F64Enclosure::square+0x180>
   1aa40:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   1aa45:	4c 8b 6c 24 38       	mov    0x38(%rsp),%r13
   1aa4a:	48 89 e7             	mov    %rsp,%rdi
   1aa4d:	4c 89 e6             	mov    %r12,%rsi
   1aa50:	4c 89 fa             	mov    %r15,%rdx
   1aa53:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1aa58:	e8 33 18 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1aa5d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1aa61:	74 1e                	je     1aa81 <hyperinterval::float::F64Enclosure::square+0x171>
   1aa63:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1aa68:	48 89 e7             	mov    %rsp,%rdi
   1aa6b:	4c 89 e6             	mov    %r12,%rsi
   1aa6e:	4c 89 fa             	mov    %r15,%rdx
   1aa71:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1aa76:	e8 15 18 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1aa7b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1aa7f:	75 21                	jne    1aaa2 <hyperinterval::float::F64Enclosure::square+0x192>
   1aa81:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1aa86:	88 43 08             	mov    %al,0x8(%rbx)
   1aa89:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1aa90:	48 89 d8             	mov    %rbx,%rax
   1aa93:	48 83 c4 58          	add    $0x58,%rsp
   1aa97:	5b                   	pop    %rbx
   1aa98:	41 5c                	pop    %r12
   1aa9a:	41 5d                	pop    %r13
   1aa9c:	41 5e                	pop    %r14
   1aa9e:	41 5f                	pop    %r15
   1aaa0:	5d                   	pop    %rbp
   1aaa1:	c3                   	ret
   1aaa2:	4c 89 f1             	mov    %r14,%rcx
   1aaa5:	48 89 e8             	mov    %rbp,%rax
   1aaa8:	4c 09 e0             	or     %r12,%rax
   1aaab:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
   1aab0:	48 89 ee             	mov    %rbp,%rsi
   1aab3:	4c 21 f6             	and    %r14,%rsi
   1aab6:	4c 89 e2             	mov    %r12,%rdx
   1aab9:	48 29 f2             	sub    %rsi,%rdx
   1aabc:	48 85 ed             	test   %rbp,%rbp
   1aabf:	48 0f 49 d0          	cmovns %rax,%rdx
   1aac3:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   1aac8:	48 89 f8             	mov    %rdi,%rax
   1aacb:	4c 09 e0             	or     %r12,%rax
   1aace:	49 89 f8             	mov    %rdi,%r8
   1aad1:	4d 21 f0             	and    %r14,%r8
   1aad4:	4c 89 e6             	mov    %r12,%rsi
   1aad7:	4c 29 c6             	sub    %r8,%rsi
   1aada:	48 85 ff             	test   %rdi,%rdi
   1aadd:	48 0f 49 f0          	cmovns %rax,%rsi
   1aae1:	b0 01                	mov    $0x1,%al
   1aae3:	48 39 f2             	cmp    %rsi,%rdx
   1aae6:	77 9e                	ja     1aa86 <hyperinterval::float::F64Enclosure::square+0x176>
   1aae8:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1aaed:	48 89 e7             	mov    %rsp,%rdi
   1aaf0:	4c 89 e6             	mov    %r12,%rsi
   1aaf3:	4c 89 fa             	mov    %r15,%rdx
   1aaf6:	e8 95 17 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1aafb:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1aaff:	74 80                	je     1aa81 <hyperinterval::float::F64Enclosure::square+0x171>
   1ab01:	4c 89 e9             	mov    %r13,%rcx
   1ab04:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1ab09:	48 89 e7             	mov    %rsp,%rdi
   1ab0c:	4c 89 e6             	mov    %r12,%rsi
   1ab0f:	4c 89 fa             	mov    %r15,%rdx
   1ab12:	e8 79 17 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1ab17:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1ab1b:	0f 84 60 ff ff ff    	je     1aa81 <hyperinterval::float::F64Enclosure::square+0x171>
   1ab21:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1ab26:	4c 89 e8             	mov    %r13,%rax
   1ab29:	4c 09 e0             	or     %r12,%rax
   1ab2c:	4c 89 ea             	mov    %r13,%rdx
   1ab2f:	4c 21 f2             	and    %r14,%rdx
   1ab32:	4c 89 e6             	mov    %r12,%rsi
   1ab35:	48 29 d6             	sub    %rdx,%rsi
   1ab38:	4d 85 ed             	test   %r13,%r13
   1ab3b:	48 0f 49 f0          	cmovns %rax,%rsi
   1ab3f:	48 89 c8             	mov    %rcx,%rax
   1ab42:	4c 09 e0             	or     %r12,%rax
   1ab45:	49 21 ce             	and    %rcx,%r14
   1ab48:	4d 29 f4             	sub    %r14,%r12
   1ab4b:	48 85 c9             	test   %rcx,%rcx
   1ab4e:	4c 0f 49 e0          	cmovns %rax,%r12
   1ab52:	b0 01                	mov    $0x1,%al
   1ab54:	4c 39 e6             	cmp    %r12,%rsi
   1ab57:	0f 87 29 ff ff ff    	ja     1aa86 <hyperinterval::float::F64Enclosure::square+0x176>
   1ab5d:	48 89 ef             	mov    %rbp,%rdi
   1ab60:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1ab65:	4c 89 ea             	mov    %r13,%rdx
   1ab68:	e8 03 1b 00 00       	call   1c670 <hyperinterval::bounds::Bounds<T>::hull>
   1ab6d:	49 89 c5             	mov    %rax,%r13
   1ab70:	49 89 d4             	mov    %rdx,%r12
   1ab73:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1ab78:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
   1ab7d:	31 d2                	xor    %edx,%edx
   1ab7f:	e8 7c 1b 00 00       	call   1c700 <hyperinterval::bounds::Bounds<T>::signs>
   1ab84:	a8 02                	test   $0x2,%al
   1ab86:	75 14                	jne    1ab9c <hyperinterval::float::F64Enclosure::square+0x28c>
   1ab88:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1ab8f:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1ab93:	4c 89 63 10          	mov    %r12,0x10(%rbx)
   1ab97:	e9 f4 fe ff ff       	jmp    1aa90 <hyperinterval::float::F64Enclosure::square+0x180>
   1ab9c:	48 89 e7             	mov    %rsp,%rdi
   1ab9f:	31 f6                	xor    %esi,%esi
   1aba1:	31 d2                	xor    %edx,%edx
   1aba3:	e8 78 03 00 00       	call   1af20 <hyperinterval::float::F64Enclosure::from_bits>
   1aba8:	48 8b 04 24          	mov    (%rsp),%rax
   1abac:	48 83 f8 02          	cmp    $0x2,%rax
   1abb0:	75 0a                	jne    1abbc <hyperinterval::float::F64Enclosure::square+0x2ac>
   1abb2:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1abb7:	e9 ca fe ff ff       	jmp    1aa86 <hyperinterval::float::F64Enclosure::square+0x176>
   1abbc:	83 f8 01             	cmp    $0x1,%eax
   1abbf:	75 c7                	jne    1ab88 <hyperinterval::float::F64Enclosure::square+0x278>
   1abc1:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1abc6:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1abcb:	4c 89 ef             	mov    %r13,%rdi
   1abce:	4c 89 e6             	mov    %r12,%rsi
   1abd1:	e8 9a 1a 00 00       	call   1c670 <hyperinterval::bounds::Bounds<T>::hull>
   1abd6:	49 89 c5             	mov    %rax,%r13
   1abd9:	49 89 d4             	mov    %rdx,%r12
   1abdc:	eb aa                	jmp    1ab88 <hyperinterval::float::F64Enclosure::square+0x278>
   1abde:	cc                   	int3
   1abdf:	cc                   	int3

hyperinterval::float::F64Enclosure::next_up:
   1abe0:	41 57                	push   %r15
   1abe2:	41 56                	push   %r14
   1abe4:	53                   	push   %rbx
   1abe5:	48 83 ec 10          	sub    $0x10,%rsp
   1abe9:	48 89 fb             	mov    %rdi,%rbx
   1abec:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1abf3:	00 00 80 
   1abf6:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1abfd:	00 f0 7f 
   1ac00:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1ac05:	48 89 e7             	mov    %rsp,%rdi
   1ac08:	4c 89 f6             	mov    %r14,%rsi
   1ac0b:	4c 89 fa             	mov    %r15,%rdx
   1ac0e:	e8 7d 16 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1ac13:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1ac17:	75 0c                	jne    1ac25 <hyperinterval::float::F64Enclosure::next_up+0x45>
   1ac19:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1ac1e:	88 43 01             	mov    %al,0x1(%rbx)
   1ac21:	b0 01                	mov    $0x1,%al
   1ac23:	eb 3c                	jmp    1ac61 <hyperinterval::float::F64Enclosure::next_up+0x81>
   1ac25:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1ac2a:	48 89 c1             	mov    %rax,%rcx
   1ac2d:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1ac31:	48 83 c9 01          	or     $0x1,%rcx
   1ac35:	48 01 c1             	add    %rax,%rcx
   1ac38:	48 89 e7             	mov    %rsp,%rdi
   1ac3b:	4c 89 f6             	mov    %r14,%rsi
   1ac3e:	4c 89 fa             	mov    %r15,%rdx
   1ac41:	e8 4a 16 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1ac46:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1ac4a:	75 08                	jne    1ac54 <hyperinterval::float::F64Enclosure::next_up+0x74>
   1ac4c:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
   1ac50:	b0 01                	mov    $0x1,%al
   1ac52:	eb 0d                	jmp    1ac61 <hyperinterval::float::F64Enclosure::next_up+0x81>
   1ac54:	f3 0f 7e 44 24 08    	movq   0x8(%rsp),%xmm0
   1ac5a:	66 0f d6 43 08       	movq   %xmm0,0x8(%rbx)
   1ac5f:	31 c0                	xor    %eax,%eax
   1ac61:	88 03                	mov    %al,(%rbx)
   1ac63:	48 89 d8             	mov    %rbx,%rax
   1ac66:	48 83 c4 10          	add    $0x10,%rsp
   1ac6a:	5b                   	pop    %rbx
   1ac6b:	41 5e                	pop    %r14
   1ac6d:	41 5f                	pop    %r15
   1ac6f:	c3                   	ret

hyperinterval::float::F64Enclosure::disjoint:
   1ac70:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1ac74:	b0 01                	mov    $0x1,%al
   1ac76:	0f 84 93 00 00 00    	je     1ad0f <hyperinterval::float::F64Enclosure::disjoint+0x9f>
   1ac7c:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1ac80:	0f 84 89 00 00 00    	je     1ad0f <hyperinterval::float::F64Enclosure::disjoint+0x9f>
   1ac86:	53                   	push   %rbx
   1ac87:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
   1ac8e:	00 00 80 
   1ac91:	4c 8b 47 10          	mov    0x10(%rdi),%r8
   1ac95:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
   1ac99:	4d 89 c2             	mov    %r8,%r10
   1ac9c:	49 09 ca             	or     %rcx,%r10
   1ac9f:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
   1aca3:	4d 89 c3             	mov    %r8,%r11
   1aca6:	49 21 d3             	and    %rdx,%r11
   1aca9:	48 89 cb             	mov    %rcx,%rbx
   1acac:	4c 29 db             	sub    %r11,%rbx
   1acaf:	4d 85 c0             	test   %r8,%r8
   1acb2:	49 0f 49 da          	cmovns %r10,%rbx
   1acb6:	4d 89 c8             	mov    %r9,%r8
   1acb9:	49 09 c8             	or     %rcx,%r8
   1acbc:	4d 89 ca             	mov    %r9,%r10
   1acbf:	49 21 d2             	and    %rdx,%r10
   1acc2:	49 89 cb             	mov    %rcx,%r11
   1acc5:	4d 29 d3             	sub    %r10,%r11
   1acc8:	4d 85 c9             	test   %r9,%r9
   1accb:	4d 0f 49 d8          	cmovns %r8,%r11
   1accf:	4c 39 db             	cmp    %r11,%rbx
   1acd2:	5b                   	pop    %rbx
   1acd3:	72 3a                	jb     1ad0f <hyperinterval::float::F64Enclosure::disjoint+0x9f>
   1acd5:	48 8b 47 08          	mov    0x8(%rdi),%rax
   1acd9:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1acdd:	48 89 f7             	mov    %rsi,%rdi
   1ace0:	48 09 cf             	or     %rcx,%rdi
   1ace3:	49 89 f0             	mov    %rsi,%r8
   1ace6:	49 21 d0             	and    %rdx,%r8
   1ace9:	49 89 c9             	mov    %rcx,%r9
   1acec:	4d 29 c1             	sub    %r8,%r9
   1acef:	48 85 f6             	test   %rsi,%rsi
   1acf2:	4c 0f 49 cf          	cmovns %rdi,%r9
   1acf6:	48 89 c6             	mov    %rax,%rsi
   1acf9:	48 09 ce             	or     %rcx,%rsi
   1acfc:	48 21 c2             	and    %rax,%rdx
   1acff:	48 29 d1             	sub    %rdx,%rcx
   1ad02:	48 85 c0             	test   %rax,%rax
   1ad05:	48 0f 49 ce          	cmovns %rsi,%rcx
   1ad09:	49 39 c9             	cmp    %rcx,%r9
   1ad0c:	0f 92 c0             	setb   %al
   1ad0f:	c3                   	ret

hyperinterval::float::F64Enclosure::expanded:
   1ad10:	41 57                	push   %r15
   1ad12:	41 56                	push   %r14
   1ad14:	41 55                	push   %r13
   1ad16:	41 54                	push   %r12
   1ad18:	53                   	push   %rbx
   1ad19:	48 83 ec 10          	sub    $0x10,%rsp
   1ad1d:	48 89 fb             	mov    %rdi,%rbx
   1ad20:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1ad24:	75 7f                	jne    1ada5 <hyperinterval::float::F64Enclosure::expanded+0x95>
   1ad26:	4c 8b 66 10          	mov    0x10(%rsi),%r12
   1ad2a:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1ad31:	00 00 80 
   1ad34:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1ad3b:	00 f0 7f 
   1ad3e:	48 8b 46 08          	mov    0x8(%rsi),%rax
   1ad42:	48 89 c2             	mov    %rax,%rdx
   1ad45:	4c 31 f2             	xor    %r14,%rdx
   1ad48:	48 85 c0             	test   %rax,%rax
   1ad4b:	48 0f 44 d0          	cmove  %rax,%rdx
   1ad4f:	48 89 d1             	mov    %rdx,%rcx
   1ad52:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1ad56:	48 83 c9 01          	or     $0x1,%rcx
   1ad5a:	48 01 d1             	add    %rdx,%rcx
   1ad5d:	48 89 e7             	mov    %rsp,%rdi
   1ad60:	4c 89 f6             	mov    %r14,%rsi
   1ad63:	4c 89 fa             	mov    %r15,%rdx
   1ad66:	e8 25 15 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1ad6b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ad6f:	75 27                	jne    1ad98 <hyperinterval::float::F64Enclosure::expanded+0x88>
   1ad71:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1ad76:	4c 89 e1             	mov    %r12,%rcx
   1ad79:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1ad7d:	48 83 c9 01          	or     $0x1,%rcx
   1ad81:	4c 01 e1             	add    %r12,%rcx
   1ad84:	48 89 e7             	mov    %rsp,%rdi
   1ad87:	4c 89 f6             	mov    %r14,%rsi
   1ad8a:	4c 89 fa             	mov    %r15,%rdx
   1ad8d:	e8 fe 14 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1ad92:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1ad96:	75 25                	jne    1adbd <hyperinterval::float::F64Enclosure::expanded+0xad>
   1ad98:	c6 43 08 03          	movb   $0x3,0x8(%rbx)
   1ad9c:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1ada3:	eb 07                	jmp    1adac <hyperinterval::float::F64Enclosure::expanded+0x9c>
   1ada5:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1adac:	48 89 d8             	mov    %rbx,%rax
   1adaf:	48 83 c4 10          	add    $0x10,%rsp
   1adb3:	5b                   	pop    %rbx
   1adb4:	41 5c                	pop    %r12
   1adb6:	41 5d                	pop    %r13
   1adb8:	41 5e                	pop    %r14
   1adba:	41 5f                	pop    %r15
   1adbc:	c3                   	ret
   1adbd:	4c 89 e9             	mov    %r13,%rcx
   1adc0:	4c 31 f1             	xor    %r14,%rcx
   1adc3:	4d 85 ed             	test   %r13,%r13
   1adc6:	49 0f 44 cd          	cmove  %r13,%rcx
   1adca:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1adcf:	48 89 e7             	mov    %rsp,%rdi
   1add2:	4c 89 f6             	mov    %r14,%rsi
   1add5:	4c 89 fa             	mov    %r15,%rdx
   1add8:	e8 b3 14 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1addd:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1ade1:	74 1c                	je     1adff <hyperinterval::float::F64Enclosure::expanded+0xef>
   1ade3:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1ade8:	48 89 e7             	mov    %rsp,%rdi
   1adeb:	4c 89 f6             	mov    %r14,%rsi
   1adee:	4c 89 fa             	mov    %r15,%rdx
   1adf1:	4c 89 e1             	mov    %r12,%rcx
   1adf4:	e8 97 14 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1adf9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1adfd:	75 11                	jne    1ae10 <hyperinterval::float::F64Enclosure::expanded+0x100>
   1adff:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1ae04:	88 43 08             	mov    %al,0x8(%rbx)
   1ae07:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1ae0e:	eb 9c                	jmp    1adac <hyperinterval::float::F64Enclosure::expanded+0x9c>
   1ae10:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1ae15:	4c 89 e9             	mov    %r13,%rcx
   1ae18:	4c 09 f1             	or     %r14,%rcx
   1ae1b:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   1ae1f:	4c 89 ee             	mov    %r13,%rsi
   1ae22:	48 21 d6             	and    %rdx,%rsi
   1ae25:	4c 89 f7             	mov    %r14,%rdi
   1ae28:	48 29 f7             	sub    %rsi,%rdi
   1ae2b:	4d 85 ed             	test   %r13,%r13
   1ae2e:	48 0f 49 f9          	cmovns %rcx,%rdi
   1ae32:	48 89 c1             	mov    %rax,%rcx
   1ae35:	4c 09 f1             	or     %r14,%rcx
   1ae38:	48 21 c2             	and    %rax,%rdx
   1ae3b:	49 29 d6             	sub    %rdx,%r14
   1ae3e:	48 85 c0             	test   %rax,%rax
   1ae41:	4c 0f 49 f1          	cmovns %rcx,%r14
   1ae45:	4c 39 f7             	cmp    %r14,%rdi
   1ae48:	76 10                	jbe    1ae5a <hyperinterval::float::F64Enclosure::expanded+0x14a>
   1ae4a:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1ae4e:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1ae55:	e9 52 ff ff ff       	jmp    1adac <hyperinterval::float::F64Enclosure::expanded+0x9c>
   1ae5a:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1ae61:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1ae65:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1ae69:	e9 3e ff ff ff       	jmp    1adac <hyperinterval::float::F64Enclosure::expanded+0x9c>
   1ae6e:	cc                   	int3
   1ae6f:	cc                   	int3

hyperinterval::float::F64Enclosure::overlaps:
   1ae70:	31 c0                	xor    %eax,%eax
   1ae72:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1ae76:	0f 84 94 00 00 00    	je     1af10 <hyperinterval::float::F64Enclosure::overlaps+0xa0>
   1ae7c:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1ae80:	0f 84 8a 00 00 00    	je     1af10 <hyperinterval::float::F64Enclosure::overlaps+0xa0>
   1ae86:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1ae8d:	00 00 80 
   1ae90:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1ae94:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1ae98:	49 89 d1             	mov    %rdx,%r9
   1ae9b:	49 09 c1             	or     %rax,%r9
   1ae9e:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1aea2:	49 89 d2             	mov    %rdx,%r10
   1aea5:	49 21 ca             	and    %rcx,%r10
   1aea8:	49 89 c3             	mov    %rax,%r11
   1aeab:	4d 29 d3             	sub    %r10,%r11
   1aeae:	48 85 d2             	test   %rdx,%rdx
   1aeb1:	4d 0f 49 d9          	cmovns %r9,%r11
   1aeb5:	4c 89 c2             	mov    %r8,%rdx
   1aeb8:	48 09 c2             	or     %rax,%rdx
   1aebb:	4d 89 c1             	mov    %r8,%r9
   1aebe:	49 21 c9             	and    %rcx,%r9
   1aec1:	49 89 c2             	mov    %rax,%r10
   1aec4:	4d 29 ca             	sub    %r9,%r10
   1aec7:	4d 85 c0             	test   %r8,%r8
   1aeca:	4c 0f 49 d2          	cmovns %rdx,%r10
   1aece:	4d 39 d3             	cmp    %r10,%r11
   1aed1:	73 03                	jae    1aed6 <hyperinterval::float::F64Enclosure::overlaps+0x66>
   1aed3:	31 c0                	xor    %eax,%eax
   1aed5:	c3                   	ret
   1aed6:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1aeda:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1aede:	48 89 f7             	mov    %rsi,%rdi
   1aee1:	48 09 c7             	or     %rax,%rdi
   1aee4:	49 89 f0             	mov    %rsi,%r8
   1aee7:	49 21 c8             	and    %rcx,%r8
   1aeea:	49 89 c1             	mov    %rax,%r9
   1aeed:	4d 29 c1             	sub    %r8,%r9
   1aef0:	48 85 f6             	test   %rsi,%rsi
   1aef3:	4c 0f 49 cf          	cmovns %rdi,%r9
   1aef7:	48 89 d6             	mov    %rdx,%rsi
   1aefa:	48 09 c6             	or     %rax,%rsi
   1aefd:	48 21 d1             	and    %rdx,%rcx
   1af00:	48 29 c8             	sub    %rcx,%rax
   1af03:	48 85 d2             	test   %rdx,%rdx
   1af06:	48 0f 49 c6          	cmovns %rsi,%rax
   1af0a:	49 39 c1             	cmp    %rax,%r9
   1af0d:	0f 93 c0             	setae  %al
   1af10:	c3                   	ret
   1af11:	cc                   	int3
   1af12:	cc                   	int3
   1af13:	cc                   	int3
   1af14:	cc                   	int3
   1af15:	cc                   	int3
   1af16:	cc                   	int3
   1af17:	cc                   	int3
   1af18:	cc                   	int3
   1af19:	cc                   	int3
   1af1a:	cc                   	int3
   1af1b:	cc                   	int3
   1af1c:	cc                   	int3
   1af1d:	cc                   	int3
   1af1e:	cc                   	int3
   1af1f:	cc                   	int3

hyperinterval::float::F64Enclosure::from_bits:
   1af20:	41 57                	push   %r15
   1af22:	41 56                	push   %r14
   1af24:	41 55                	push   %r13
   1af26:	41 54                	push   %r12
   1af28:	53                   	push   %rbx
   1af29:	48 83 ec 10          	sub    $0x10,%rsp
   1af2d:	49 89 d7             	mov    %rdx,%r15
   1af30:	48 89 f1             	mov    %rsi,%rcx
   1af33:	48 89 fb             	mov    %rdi,%rbx
   1af36:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1af3d:	00 00 80 
   1af40:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1af47:	00 f0 7f 
   1af4a:	48 89 e7             	mov    %rsp,%rdi
   1af4d:	4c 89 f6             	mov    %r14,%rsi
   1af50:	4c 89 e2             	mov    %r12,%rdx
   1af53:	e8 38 13 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1af58:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1af5c:	74 1c                	je     1af7a <hyperinterval::float::F64Enclosure::from_bits+0x5a>
   1af5e:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1af63:	48 89 e7             	mov    %rsp,%rdi
   1af66:	4c 89 f6             	mov    %r14,%rsi
   1af69:	4c 89 e2             	mov    %r12,%rdx
   1af6c:	4c 89 f9             	mov    %r15,%rcx
   1af6f:	e8 1c 13 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1af74:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1af78:	75 1d                	jne    1af97 <hyperinterval::float::F64Enclosure::from_bits+0x77>
   1af7a:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1af7f:	88 43 08             	mov    %al,0x8(%rbx)
   1af82:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1af89:	48 83 c4 10          	add    $0x10,%rsp
   1af8d:	5b                   	pop    %rbx
   1af8e:	41 5c                	pop    %r12
   1af90:	41 5d                	pop    %r13
   1af92:	41 5e                	pop    %r14
   1af94:	41 5f                	pop    %r15
   1af96:	c3                   	ret
   1af97:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1af9c:	4c 89 e9             	mov    %r13,%rcx
   1af9f:	4c 09 f1             	or     %r14,%rcx
   1afa2:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   1afa6:	4c 89 ee             	mov    %r13,%rsi
   1afa9:	48 21 d6             	and    %rdx,%rsi
   1afac:	4c 89 f7             	mov    %r14,%rdi
   1afaf:	48 29 f7             	sub    %rsi,%rdi
   1afb2:	4d 85 ed             	test   %r13,%r13
   1afb5:	48 0f 49 f9          	cmovns %rcx,%rdi
   1afb9:	48 89 c1             	mov    %rax,%rcx
   1afbc:	4c 09 f1             	or     %r14,%rcx
   1afbf:	48 21 c2             	and    %rax,%rdx
   1afc2:	49 29 d6             	sub    %rdx,%r14
   1afc5:	48 85 c0             	test   %rax,%rax
   1afc8:	4c 0f 49 f1          	cmovns %rcx,%r14
   1afcc:	4c 39 f7             	cmp    %r14,%rdi
   1afcf:	76 06                	jbe    1afd7 <hyperinterval::float::F64Enclosure::from_bits+0xb7>
   1afd1:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1afd5:	eb ab                	jmp    1af82 <hyperinterval::float::F64Enclosure::from_bits+0x62>
   1afd7:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1afde:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1afe2:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1afe6:	eb a1                	jmp    1af89 <hyperinterval::float::F64Enclosure::from_bits+0x69>
   1afe8:	cc                   	int3
   1afe9:	cc                   	int3
   1afea:	cc                   	int3
   1afeb:	cc                   	int3
   1afec:	cc                   	int3
   1afed:	cc                   	int3
   1afee:	cc                   	int3
   1afef:	cc                   	int3

hyperinterval::float::F64Enclosure::max_image:
   1aff0:	48 89 f8             	mov    %rdi,%rax
   1aff3:	45 31 c0             	xor    %r8d,%r8d
   1aff6:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1affa:	0f 85 ab 00 00 00    	jne    1b0ab <hyperinterval::float::F64Enclosure::max_image+0xbb>
   1b000:	f6 02 01             	testb  $0x1,(%rdx)
   1b003:	0f 84 96 00 00 00    	je     1b09f <hyperinterval::float::F64Enclosure::max_image+0xaf>
   1b009:	41 56                	push   %r14
   1b00b:	53                   	push   %rbx
   1b00c:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
   1b010:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
   1b014:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
   1b018:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b01f:	00 00 80 
   1b022:	49 89 fa             	mov    %rdi,%r10
   1b025:	49 09 f2             	or     %rsi,%r10
   1b028:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   1b02c:	49 89 fb             	mov    %rdi,%r11
   1b02f:	4d 21 c3             	and    %r8,%r11
   1b032:	48 89 f3             	mov    %rsi,%rbx
   1b035:	4c 29 db             	sub    %r11,%rbx
   1b038:	48 85 ff             	test   %rdi,%rdi
   1b03b:	49 0f 49 da          	cmovns %r10,%rbx
   1b03f:	4d 89 ca             	mov    %r9,%r10
   1b042:	49 09 f2             	or     %rsi,%r10
   1b045:	4d 89 cb             	mov    %r9,%r11
   1b048:	4d 21 c3             	and    %r8,%r11
   1b04b:	49 89 f6             	mov    %rsi,%r14
   1b04e:	4d 29 de             	sub    %r11,%r14
   1b051:	4d 85 c9             	test   %r9,%r9
   1b054:	4d 0f 49 f2          	cmovns %r10,%r14
   1b058:	4c 39 f3             	cmp    %r14,%rbx
   1b05b:	49 0f 42 f9          	cmovb  %r9,%rdi
   1b05f:	49 89 c9             	mov    %rcx,%r9
   1b062:	49 09 f1             	or     %rsi,%r9
   1b065:	49 89 ca             	mov    %rcx,%r10
   1b068:	4d 21 c2             	and    %r8,%r10
   1b06b:	49 89 f3             	mov    %rsi,%r11
   1b06e:	4d 29 d3             	sub    %r10,%r11
   1b071:	48 85 c9             	test   %rcx,%rcx
   1b074:	4d 0f 49 d9          	cmovns %r9,%r11
   1b078:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1b07c:	49 89 d1             	mov    %rdx,%r9
   1b07f:	49 09 f1             	or     %rsi,%r9
   1b082:	49 21 d0             	and    %rdx,%r8
   1b085:	4c 29 c6             	sub    %r8,%rsi
   1b088:	48 85 d2             	test   %rdx,%rdx
   1b08b:	49 0f 49 f1          	cmovns %r9,%rsi
   1b08f:	49 39 f3             	cmp    %rsi,%r11
   1b092:	48 0f 42 ca          	cmovb  %rdx,%rcx
   1b096:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1b09c:	5b                   	pop    %rbx
   1b09d:	41 5e                	pop    %r14
   1b09f:	4c 89 00             	mov    %r8,(%rax)
   1b0a2:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1b0a6:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1b0aa:	c3                   	ret
   1b0ab:	4c 89 00             	mov    %r8,(%rax)
   1b0ae:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1b0b2:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1b0b6:	c3                   	ret
   1b0b7:	cc                   	int3
   1b0b8:	cc                   	int3
   1b0b9:	cc                   	int3
   1b0ba:	cc                   	int3
   1b0bb:	cc                   	int3
   1b0bc:	cc                   	int3
   1b0bd:	cc                   	int3
   1b0be:	cc                   	int3
   1b0bf:	cc                   	int3

hyperinterval::float::F64Enclosure::min_image:
   1b0c0:	48 89 f8             	mov    %rdi,%rax
   1b0c3:	45 31 c0             	xor    %r8d,%r8d
   1b0c6:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b0ca:	0f 85 ab 00 00 00    	jne    1b17b <hyperinterval::float::F64Enclosure::min_image+0xbb>
   1b0d0:	f6 02 01             	testb  $0x1,(%rdx)
   1b0d3:	0f 84 96 00 00 00    	je     1b16f <hyperinterval::float::F64Enclosure::min_image+0xaf>
   1b0d9:	41 56                	push   %r14
   1b0db:	53                   	push   %rbx
   1b0dc:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
   1b0e0:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1b0e4:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
   1b0e8:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
   1b0ec:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b0f3:	00 00 80 
   1b0f6:	49 89 fa             	mov    %rdi,%r10
   1b0f9:	49 09 f2             	or     %rsi,%r10
   1b0fc:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   1b100:	49 89 fb             	mov    %rdi,%r11
   1b103:	4d 21 c3             	and    %r8,%r11
   1b106:	48 89 f3             	mov    %rsi,%rbx
   1b109:	4c 29 db             	sub    %r11,%rbx
   1b10c:	48 85 ff             	test   %rdi,%rdi
   1b10f:	49 0f 49 da          	cmovns %r10,%rbx
   1b113:	4d 89 ca             	mov    %r9,%r10
   1b116:	49 09 f2             	or     %rsi,%r10
   1b119:	4d 89 cb             	mov    %r9,%r11
   1b11c:	4d 21 c3             	and    %r8,%r11
   1b11f:	49 89 f6             	mov    %rsi,%r14
   1b122:	4d 29 de             	sub    %r11,%r14
   1b125:	4d 85 c9             	test   %r9,%r9
   1b128:	4d 0f 49 f2          	cmovns %r10,%r14
   1b12c:	4c 39 f3             	cmp    %r14,%rbx
   1b12f:	49 0f 47 f9          	cmova  %r9,%rdi
   1b133:	49 89 c9             	mov    %rcx,%r9
   1b136:	49 09 f1             	or     %rsi,%r9
   1b139:	49 89 ca             	mov    %rcx,%r10
   1b13c:	4d 21 c2             	and    %r8,%r10
   1b13f:	49 89 f3             	mov    %rsi,%r11
   1b142:	4d 29 d3             	sub    %r10,%r11
   1b145:	48 85 c9             	test   %rcx,%rcx
   1b148:	4d 0f 49 d9          	cmovns %r9,%r11
   1b14c:	49 89 d1             	mov    %rdx,%r9
   1b14f:	49 09 f1             	or     %rsi,%r9
   1b152:	49 21 d0             	and    %rdx,%r8
   1b155:	4c 29 c6             	sub    %r8,%rsi
   1b158:	48 85 d2             	test   %rdx,%rdx
   1b15b:	49 0f 49 f1          	cmovns %r9,%rsi
   1b15f:	49 39 f3             	cmp    %rsi,%r11
   1b162:	48 0f 47 ca          	cmova  %rdx,%rcx
   1b166:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1b16c:	5b                   	pop    %rbx
   1b16d:	41 5e                	pop    %r14
   1b16f:	4c 89 00             	mov    %r8,(%rax)
   1b172:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1b176:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1b17a:	c3                   	ret
   1b17b:	4c 89 00             	mov    %r8,(%rax)
   1b17e:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1b182:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1b186:	c3                   	ret
   1b187:	cc                   	int3
   1b188:	cc                   	int3
   1b189:	cc                   	int3
   1b18a:	cc                   	int3
   1b18b:	cc                   	int3
   1b18c:	cc                   	int3
   1b18d:	cc                   	int3
   1b18e:	cc                   	int3
   1b18f:	cc                   	int3

hyperinterval::float::F64Enclosure::next_down:
   1b190:	41 57                	push   %r15
   1b192:	41 56                	push   %r14
   1b194:	53                   	push   %rbx
   1b195:	48 83 ec 10          	sub    $0x10,%rsp
   1b199:	48 89 fb             	mov    %rdi,%rbx
   1b19c:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b1a3:	00 00 80 
   1b1a6:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1b1ad:	00 f0 7f 
   1b1b0:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1b1b5:	48 89 e7             	mov    %rsp,%rdi
   1b1b8:	4c 89 f6             	mov    %r14,%rsi
   1b1bb:	4c 89 fa             	mov    %r15,%rdx
   1b1be:	e8 cd 10 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1b1c3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b1c7:	75 0c                	jne    1b1d5 <hyperinterval::float::F64Enclosure::next_down+0x45>
   1b1c9:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1b1ce:	88 43 01             	mov    %al,0x1(%rbx)
   1b1d1:	b0 01                	mov    $0x1,%al
   1b1d3:	eb 51                	jmp    1b226 <hyperinterval::float::F64Enclosure::next_down+0x96>
   1b1d5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b1da:	48 89 c2             	mov    %rax,%rdx
   1b1dd:	4c 31 f2             	xor    %r14,%rdx
   1b1e0:	48 85 c0             	test   %rax,%rax
   1b1e3:	48 0f 44 d0          	cmove  %rax,%rdx
   1b1e7:	48 89 d1             	mov    %rdx,%rcx
   1b1ea:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1b1ee:	48 83 c9 01          	or     $0x1,%rcx
   1b1f2:	48 01 d1             	add    %rdx,%rcx
   1b1f5:	48 89 e7             	mov    %rsp,%rdi
   1b1f8:	4c 89 f6             	mov    %r14,%rsi
   1b1fb:	4c 89 fa             	mov    %r15,%rdx
   1b1fe:	e8 8d 10 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1b203:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b207:	75 08                	jne    1b211 <hyperinterval::float::F64Enclosure::next_down+0x81>
   1b209:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
   1b20d:	b0 01                	mov    $0x1,%al
   1b20f:	eb 15                	jmp    1b226 <hyperinterval::float::F64Enclosure::next_down+0x96>
   1b211:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b216:	49 31 c6             	xor    %rax,%r14
   1b219:	48 85 c0             	test   %rax,%rax
   1b21c:	4c 0f 44 f0          	cmove  %rax,%r14
   1b220:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1b224:	31 c0                	xor    %eax,%eax
   1b226:	88 03                	mov    %al,(%rbx)
   1b228:	48 89 d8             	mov    %rbx,%rax
   1b22b:	48 83 c4 10          	add    $0x10,%rsp
   1b22f:	5b                   	pop    %rbx
   1b230:	41 5e                	pop    %r14
   1b232:	41 5f                	pop    %r15
   1b234:	c3                   	ret
   1b235:	cc                   	int3
   1b236:	cc                   	int3
   1b237:	cc                   	int3
   1b238:	cc                   	int3
   1b239:	cc                   	int3
   1b23a:	cc                   	int3
   1b23b:	cc                   	int3
   1b23c:	cc                   	int3
   1b23d:	cc                   	int3
   1b23e:	cc                   	int3
   1b23f:	cc                   	int3

hyperinterval::float::F64Enclosure::subset_of:
   1b240:	b0 01                	mov    $0x1,%al
   1b242:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1b246:	75 54                	jne    1b29c <hyperinterval::float::F64Enclosure::subset_of+0x5c>
   1b248:	f6 06 01             	testb  $0x1,(%rsi)
   1b24b:	74 4d                	je     1b29a <hyperinterval::float::F64Enclosure::subset_of+0x5a>
   1b24d:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1b251:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1b255:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1b25c:	00 00 80 
   1b25f:	4d 89 c1             	mov    %r8,%r9
   1b262:	49 09 c1             	or     %rax,%r9
   1b265:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1b269:	4d 89 c2             	mov    %r8,%r10
   1b26c:	49 21 ca             	and    %rcx,%r10
   1b26f:	49 89 c3             	mov    %rax,%r11
   1b272:	4d 29 d3             	sub    %r10,%r11
   1b275:	4d 85 c0             	test   %r8,%r8
   1b278:	4d 0f 49 d9          	cmovns %r9,%r11
   1b27c:	49 89 d0             	mov    %rdx,%r8
   1b27f:	49 09 c0             	or     %rax,%r8
   1b282:	49 89 d1             	mov    %rdx,%r9
   1b285:	49 21 c9             	and    %rcx,%r9
   1b288:	49 89 c2             	mov    %rax,%r10
   1b28b:	4d 29 ca             	sub    %r9,%r10
   1b28e:	48 85 d2             	test   %rdx,%rdx
   1b291:	4d 0f 49 d0          	cmovns %r8,%r10
   1b295:	4d 39 d3             	cmp    %r10,%r11
   1b298:	76 03                	jbe    1b29d <hyperinterval::float::F64Enclosure::subset_of+0x5d>
   1b29a:	31 c0                	xor    %eax,%eax
   1b29c:	c3                   	ret
   1b29d:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1b2a1:	48 89 d7             	mov    %rdx,%rdi
   1b2a4:	48 09 c7             	or     %rax,%rdi
   1b2a7:	49 89 d0             	mov    %rdx,%r8
   1b2aa:	49 21 c8             	and    %rcx,%r8
   1b2ad:	49 89 c1             	mov    %rax,%r9
   1b2b0:	4d 29 c1             	sub    %r8,%r9
   1b2b3:	48 85 d2             	test   %rdx,%rdx
   1b2b6:	4c 0f 49 cf          	cmovns %rdi,%r9
   1b2ba:	48 8b 56 10          	mov    0x10(%rsi),%rdx
   1b2be:	48 89 d6             	mov    %rdx,%rsi
   1b2c1:	48 09 c6             	or     %rax,%rsi
   1b2c4:	48 21 d1             	and    %rdx,%rcx
   1b2c7:	48 29 c8             	sub    %rcx,%rax
   1b2ca:	48 85 d2             	test   %rdx,%rdx
   1b2cd:	48 0f 49 c6          	cmovns %rsi,%rax
   1b2d1:	49 39 c1             	cmp    %rax,%r9
   1b2d4:	0f 96 c0             	setbe  %al
   1b2d7:	c3                   	ret
   1b2d8:	cc                   	int3
   1b2d9:	cc                   	int3
   1b2da:	cc                   	int3
   1b2db:	cc                   	int3
   1b2dc:	cc                   	int3
   1b2dd:	cc                   	int3
   1b2de:	cc                   	int3
   1b2df:	cc                   	int3

hyperinterval::ieee::Format::add:
   1b2e0:	55                   	push   %rbp
   1b2e1:	41 57                	push   %r15
   1b2e3:	41 56                	push   %r14
   1b2e5:	41 55                	push   %r13
   1b2e7:	41 54                	push   %r12
   1b2e9:	53                   	push   %rbx
   1b2ea:	48 83 ec 38          	sub    $0x38,%rsp
   1b2ee:	48 89 fb             	mov    %rdi,%rbx
   1b2f1:	48 85 c9             	test   %rcx,%rcx
   1b2f4:	0f 84 63 01 00 00    	je     1b45d <hyperinterval::ieee::Format::add+0x17d>
   1b2fa:	48 89 c8             	mov    %rcx,%rax
   1b2fd:	4d 85 c0             	test   %r8,%r8
   1b300:	0f 84 61 01 00 00    	je     1b467 <hyperinterval::ieee::Format::add+0x187>
   1b306:	41 b9 40 00 00 00    	mov    $0x40,%r9d
   1b30c:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
   1b311:	49 89 c2             	mov    %rax,%r10
   1b314:	49 21 d2             	and    %rdx,%r10
   1b317:	44 89 c9             	mov    %r9d,%ecx
   1b31a:	49 d3 ea             	shr    %cl,%r10
   1b31d:	41 bb 01 00 00 00    	mov    $0x1,%r11d
   1b323:	49 d3 e3             	shl    %cl,%r11
   1b326:	4d 8d 63 ff          	lea    -0x1(%r11),%r12
   1b32a:	4d 89 e7             	mov    %r12,%r15
   1b32d:	49 21 c7             	and    %rax,%r15
   1b330:	4d 85 d2             	test   %r10,%r10
   1b333:	bf 01 00 00 00       	mov    $0x1,%edi
   1b338:	44 89 d5             	mov    %r10d,%ebp
   1b33b:	0f 44 ef             	cmove  %edi,%ebp
   1b33e:	4d 0f 45 d3          	cmovne %r11,%r10
   1b342:	49 89 d6             	mov    %rdx,%r14
   1b345:	49 d3 ee             	shr    %cl,%r14
   1b348:	4d 09 fa             	or     %r15,%r10
   1b34b:	49 d1 ee             	shr    $1,%r14
   1b34e:	45 01 ce             	add    %r9d,%r14d
   1b351:	48 85 f0             	test   %rsi,%rax
   1b354:	0f 95 44 24 0f       	setne  0xf(%rsp)
   1b359:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1b35e:	49 0f bd ca          	bsr    %r10,%rcx
   1b362:	83 f1 3f             	xor    $0x3f,%ecx
   1b365:	44 01 c9             	add    %r9d,%ecx
   1b368:	83 c1 c1             	add    $0xffffffc1,%ecx
   1b36b:	45 31 ed             	xor    %r13d,%r13d
   1b36e:	4d 0f a5 d5          	shld   %cl,%r10,%r13
   1b372:	45 31 ff             	xor    %r15d,%r15d
   1b375:	49 d3 e2             	shl    %cl,%r10
   1b378:	f6 c1 40             	test   $0x40,%cl
   1b37b:	4d 0f 45 ea          	cmovne %r10,%r13
   1b37f:	4d 0f 45 d7          	cmovne %r15,%r10
   1b383:	44 01 f1             	add    %r14d,%ecx
   1b386:	29 cd                	sub    %ecx,%ebp
   1b388:	4d 89 c7             	mov    %r8,%r15
   1b38b:	49 21 d7             	and    %rdx,%r15
   1b38e:	44 89 c9             	mov    %r9d,%ecx
   1b391:	49 d3 ef             	shr    %cl,%r15
   1b394:	4d 21 c4             	and    %r8,%r12
   1b397:	4d 85 ff             	test   %r15,%r15
   1b39a:	41 0f 45 ff          	cmovne %r15d,%edi
   1b39e:	4d 0f 45 fb          	cmovne %r11,%r15
   1b3a2:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1b3a7:	4d 09 e7             	or     %r12,%r15
   1b3aa:	49 85 f0             	test   %rsi,%r8
   1b3ad:	41 0f 95 c3          	setne  %r11b
   1b3b1:	49 0f bd cf          	bsr    %r15,%rcx
   1b3b5:	83 f1 3f             	xor    $0x3f,%ecx
   1b3b8:	44 01 c9             	add    %r9d,%ecx
   1b3bb:	83 c1 c1             	add    $0xffffffc1,%ecx
   1b3be:	45 31 c9             	xor    %r9d,%r9d
   1b3c1:	4d 0f a5 f9          	shld   %cl,%r15,%r9
   1b3c5:	49 d3 e7             	shl    %cl,%r15
   1b3c8:	f6 c1 40             	test   $0x40,%cl
   1b3cb:	4d 0f 45 cf          	cmovne %r15,%r9
   1b3cf:	41 bc 00 00 00 00    	mov    $0x0,%r12d
   1b3d5:	4d 0f 45 fc          	cmovne %r12,%r15
   1b3d9:	41 01 ce             	add    %ecx,%r14d
   1b3dc:	44 29 f7             	sub    %r14d,%edi
   1b3df:	39 fd                	cmp    %edi,%ebp
   1b3e1:	0f 8d 90 00 00 00    	jge    1b477 <hyperinterval::ieee::Format::add+0x197>
   1b3e7:	44 88 5c 24 0e       	mov    %r11b,0xe(%rsp)
   1b3ec:	41 89 ee             	mov    %ebp,%r14d
   1b3ef:	44 0f b6 5c 24 0f    	movzbl 0xf(%rsp),%r11d
   1b3f5:	4d 89 d4             	mov    %r10,%r12
   1b3f8:	4c 89 ed             	mov    %r13,%rbp
   1b3fb:	4d 89 c5             	mov    %r8,%r13
   1b3fe:	44 29 f7             	sub    %r14d,%edi
   1b401:	83 ff 4a             	cmp    $0x4a,%edi
   1b404:	0f 8f ab 00 00 00    	jg     1b4b5 <hyperinterval::ieee::Format::add+0x1d5>
   1b40a:	49 85 f0             	test   %rsi,%r8
   1b40d:	41 0f 95 c0          	setne  %r8b
   1b411:	48 85 f0             	test   %rsi,%rax
   1b414:	41 0f 95 c2          	setne  %r10b
   1b418:	89 f9                	mov    %edi,%ecx
   1b41a:	4d 0f a5 f9          	shld   %cl,%r15,%r9
   1b41e:	49 d3 e7             	shl    %cl,%r15
   1b421:	31 c0                	xor    %eax,%eax
   1b423:	40 f6 c7 40          	test   $0x40,%dil
   1b427:	4d 0f 45 cf          	cmovne %r15,%r9
   1b42b:	49 0f 44 c7          	cmove  %r15,%rax
   1b42f:	45 30 c2             	xor    %r8b,%r10b
   1b432:	0f 84 ce 00 00 00    	je     1b506 <hyperinterval::ieee::Format::add+0x226>
   1b438:	4c 39 e0             	cmp    %r12,%rax
   1b43b:	4c 89 c9             	mov    %r9,%rcx
   1b43e:	48 19 e9             	sbb    %rbp,%rcx
   1b441:	0f 83 f5 00 00 00    	jae    1b53c <hyperinterval::ieee::Format::add+0x25c>
   1b447:	49 29 c4             	sub    %rax,%r12
   1b44a:	4c 19 cd             	sbb    %r9,%rbp
   1b44d:	44 88 5c 24 0e       	mov    %r11b,0xe(%rsp)
   1b452:	4c 89 e0             	mov    %r12,%rax
   1b455:	49 89 e9             	mov    %rbp,%r9
   1b458:	e9 e5 00 00 00       	jmp    1b542 <hyperinterval::ieee::Format::add+0x262>
   1b45d:	4c 89 43 08          	mov    %r8,0x8(%rbx)
   1b461:	4c 89 43 10          	mov    %r8,0x10(%rbx)
   1b465:	eb 08                	jmp    1b46f <hyperinterval::ieee::Format::add+0x18f>
   1b467:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1b46b:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1b46f:	c6 03 00             	movb   $0x0,(%rbx)
   1b472:	e9 f0 00 00 00       	jmp    1b567 <hyperinterval::ieee::Format::add+0x287>
   1b477:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1b47c:	48 89 d6             	mov    %rdx,%rsi
   1b47f:	89 fa                	mov    %edi,%edx
   1b481:	4d 89 fc             	mov    %r15,%r12
   1b484:	4d 89 ce             	mov    %r9,%r14
   1b487:	4d 89 e9             	mov    %r13,%r9
   1b48a:	4d 89 d7             	mov    %r10,%r15
   1b48d:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
   1b492:	88 4c 24 0e          	mov    %cl,0xe(%rsp)
   1b496:	89 ef                	mov    %ebp,%edi
   1b498:	4c 89 f5             	mov    %r14,%rbp
   1b49b:	41 89 d6             	mov    %edx,%r14d
   1b49e:	48 89 f2             	mov    %rsi,%rdx
   1b4a1:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   1b4a6:	49 89 c5             	mov    %rax,%r13
   1b4a9:	44 29 f7             	sub    %r14d,%edi
   1b4ac:	83 ff 4a             	cmp    $0x4a,%edi
   1b4af:	0f 8e 55 ff ff ff    	jle    1b40a <hyperinterval::ieee::Format::add+0x12a>
   1b4b5:	4c 89 e8             	mov    %r13,%rax
   1b4b8:	45 84 db             	test   %r11b,%r11b
   1b4bb:	74 51                	je     1b50e <hyperinterval::ieee::Format::add+0x22e>
   1b4bd:	48 31 f0             	xor    %rsi,%rax
   1b4c0:	48 89 c1             	mov    %rax,%rcx
   1b4c3:	48 21 f1             	and    %rsi,%rcx
   1b4c6:	31 ff                	xor    %edi,%edi
   1b4c8:	48 f7 d9             	neg    %rcx
   1b4cb:	40 0f 93 c7          	setae  %dil
   1b4cf:	48 8d 0c 78          	lea    (%rax,%rdi,2),%rcx
   1b4d3:	48 ff c9             	dec    %rcx
   1b4d6:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1b4db:	49 89 f6             	mov    %rsi,%r14
   1b4de:	e8 ad 0d 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1b4e3:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1b4e8:	75 4b                	jne    1b535 <hyperinterval::ieee::Format::add+0x255>
   1b4ea:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1b4ef:	49 31 c6             	xor    %rax,%r14
   1b4f2:	48 85 c0             	test   %rax,%rax
   1b4f5:	4c 0f 44 f0          	cmove  %rax,%r14
   1b4f9:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1b4fd:	4c 89 6b 10          	mov    %r13,0x10(%rbx)
   1b501:	e9 69 ff ff ff       	jmp    1b46f <hyperinterval::ieee::Format::add+0x18f>
   1b506:	4c 01 e0             	add    %r12,%rax
   1b509:	49 11 e9             	adc    %rbp,%r9
   1b50c:	eb 34                	jmp    1b542 <hyperinterval::ieee::Format::add+0x262>
   1b50e:	48 21 f0             	and    %rsi,%rax
   1b511:	31 c9                	xor    %ecx,%ecx
   1b513:	48 f7 d8             	neg    %rax
   1b516:	0f 93 c1             	setae  %cl
   1b519:	48 8d 0c 4d ff ff ff 	lea    -0x1(,%rcx,2),%rcx
   1b520:	ff 
   1b521:	4c 01 e9             	add    %r13,%rcx
   1b524:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1b529:	e8 62 0d 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1b52e:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1b533:	74 44                	je     1b579 <hyperinterval::ieee::Format::add+0x299>
   1b535:	66 c7 03 01 03       	movw   $0x301,(%rbx)
   1b53a:	eb 2b                	jmp    1b567 <hyperinterval::ieee::Format::add+0x287>
   1b53c:	4c 29 e0             	sub    %r12,%rax
   1b53f:	49 19 e9             	sbb    %rbp,%r9
   1b542:	0f b6 4c 24 0e       	movzbl 0xe(%rsp),%ecx
   1b547:	88 4c 24 24          	mov    %cl,0x24(%rsp)
   1b54b:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1b550:	4c 89 4c 24 18       	mov    %r9,0x18(%rsp)
   1b555:	44 89 74 24 20       	mov    %r14d,0x20(%rsp)
   1b55a:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1b55f:	48 89 df             	mov    %rbx,%rdi
   1b562:	e8 69 0d 00 00       	call   1c2d0 <hyperinterval::ieee::Format::rounded>
   1b567:	48 89 d8             	mov    %rbx,%rax
   1b56a:	48 83 c4 38          	add    $0x38,%rsp
   1b56e:	5b                   	pop    %rbx
   1b56f:	41 5c                	pop    %r12
   1b571:	41 5d                	pop    %r13
   1b573:	41 5e                	pop    %r14
   1b575:	41 5f                	pop    %r15
   1b577:	5d                   	pop    %rbp
   1b578:	c3                   	ret
   1b579:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1b57e:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1b582:	e9 e4 fe ff ff       	jmp    1b46b <hyperinterval::ieee::Format::add+0x18b>
   1b587:	cc                   	int3
   1b588:	cc                   	int3
   1b589:	cc                   	int3
   1b58a:	cc                   	int3
   1b58b:	cc                   	int3
   1b58c:	cc                   	int3
   1b58d:	cc                   	int3
   1b58e:	cc                   	int3
   1b58f:	cc                   	int3

hyperinterval::ieee::Format::div:
   1b590:	55                   	push   %rbp
   1b591:	41 57                	push   %r15
   1b593:	41 56                	push   %r14
   1b595:	41 55                	push   %r13
   1b597:	41 54                	push   %r12
   1b599:	53                   	push   %rbx
   1b59a:	48 83 ec 48          	sub    $0x48,%rsp
   1b59e:	4d 85 c0             	test   %r8,%r8
   1b5a1:	0f 84 cb 00 00 00    	je     1b672 <hyperinterval::ieee::Format::div+0xe2>
   1b5a7:	48 85 c9             	test   %rcx,%rcx
   1b5aa:	0f 84 cc 00 00 00    	je     1b67c <hyperinterval::ieee::Format::div+0xec>
   1b5b0:	41 be 40 00 00 00    	mov    $0x40,%r14d
   1b5b6:	f3 4c 0f bc f2       	tzcnt  %rdx,%r14
   1b5bb:	49 89 cd             	mov    %rcx,%r13
   1b5be:	49 21 d5             	and    %rdx,%r13
   1b5c1:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
   1b5c6:	41 83 e6 3f          	and    $0x3f,%r14d
   1b5ca:	48 89 c8             	mov    %rcx,%rax
   1b5cd:	44 89 f1             	mov    %r14d,%ecx
   1b5d0:	49 d3 ed             	shr    %cl,%r13
   1b5d3:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1b5d9:	49 d3 e2             	shl    %cl,%r10
   1b5dc:	4d 8d 5a ff          	lea    -0x1(%r10),%r11
   1b5e0:	4c 89 db             	mov    %r11,%rbx
   1b5e3:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1b5e8:	48 21 c3             	and    %rax,%rbx
   1b5eb:	4d 85 ed             	test   %r13,%r13
   1b5ee:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1b5f4:	44 89 e8             	mov    %r13d,%eax
   1b5f7:	41 0f 44 c1          	cmove  %r9d,%eax
   1b5fb:	4d 0f 45 ea          	cmovne %r10,%r13
   1b5ff:	4c 89 c5             	mov    %r8,%rbp
   1b602:	48 21 d5             	and    %rdx,%rbp
   1b605:	48 d3 ea             	shr    %cl,%rdx
   1b608:	48 d3 ed             	shr    %cl,%rbp
   1b60b:	49 09 dd             	or     %rbx,%r13
   1b60e:	48 d1 ea             	shr    $1,%rdx
   1b611:	4d 21 c3             	and    %r8,%r11
   1b614:	48 85 ed             	test   %rbp,%rbp
   1b617:	44 0f 45 cd          	cmovne %ebp,%r9d
   1b61b:	49 0f 45 ea          	cmovne %r10,%rbp
   1b61f:	4c 09 dd             	or     %r11,%rbp
   1b622:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1b627:	41 ba 7f 00 00 00    	mov    $0x7f,%r10d
   1b62d:	4c 0f bd d5          	bsr    %rbp,%r10
   1b631:	41 83 f2 3f          	xor    $0x3f,%r10d
   1b635:	41 83 c2 40          	add    $0x40,%r10d
   1b639:	49 0f bd cd          	bsr    %r13,%rcx
   1b63d:	83 f1 3f             	xor    $0x3f,%ecx
   1b640:	45 89 d7             	mov    %r10d,%r15d
   1b643:	41 29 cf             	sub    %ecx,%r15d
   1b646:	41 83 c7 c0          	add    $0xffffffc0,%r15d
   1b64a:	78 3f                	js     1b68b <hyperinterval::ieee::Format::div+0xfb>
   1b64c:	45 31 db             	xor    %r11d,%r11d
   1b64f:	44 89 f9             	mov    %r15d,%ecx
   1b652:	49 0f a5 eb          	shld   %cl,%rbp,%r11
   1b656:	31 db                	xor    %ebx,%ebx
   1b658:	49 89 ec             	mov    %rbp,%r12
   1b65b:	49 d3 e4             	shl    %cl,%r12
   1b65e:	41 f6 c7 40          	test   $0x40,%r15b
   1b662:	4d 0f 45 dc          	cmovne %r12,%r11
   1b666:	4c 0f 45 e3          	cmovne %rbx,%r12
   1b66a:	4d 39 e5             	cmp    %r12,%r13
   1b66d:	4c 19 db             	sbb    %r11,%rbx
   1b670:	eb 3f                	jmp    1b6b1 <hyperinterval::ieee::Format::div+0x121>
   1b672:	66 c7 07 01 04       	movw   $0x401,(%rdi)
   1b677:	e9 24 03 00 00       	jmp    1b9a0 <hyperinterval::ieee::Format::div+0x410>
   1b67c:	c6 07 00             	movb   $0x0,(%rdi)
   1b67f:	0f 57 c0             	xorps  %xmm0,%xmm0
   1b682:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1b686:	e9 15 03 00 00       	jmp    1b9a0 <hyperinterval::ieee::Format::div+0x410>
   1b68b:	44 89 f9             	mov    %r15d,%ecx
   1b68e:	f6 d9                	neg    %cl
   1b690:	45 31 db             	xor    %r11d,%r11d
   1b693:	4d 0f a5 eb          	shld   %cl,%r13,%r11
   1b697:	31 db                	xor    %ebx,%ebx
   1b699:	4d 89 ec             	mov    %r13,%r12
   1b69c:	49 d3 e4             	shl    %cl,%r12
   1b69f:	f6 c1 40             	test   $0x40,%cl
   1b6a2:	4d 0f 45 dc          	cmovne %r12,%r11
   1b6a6:	4c 0f 45 e3          	cmovne %rbx,%r12
   1b6aa:	49 39 ec             	cmp    %rbp,%r12
   1b6ad:	49 83 db 00          	sbb    $0x0,%r11
   1b6b1:	0f 92 c1             	setb   %cl
   1b6b4:	44 29 c8             	sub    %r9d,%eax
   1b6b7:	41 01 c7             	add    %eax,%r15d
   1b6ba:	0f b6 c9             	movzbl %cl,%ecx
   1b6bd:	41 29 cf             	sub    %ecx,%r15d
   1b6c0:	41 39 d7             	cmp    %edx,%r15d
   1b6c3:	0f 8f 19 02 00 00    	jg     1b8e2 <hyperinterval::ieee::Format::div+0x352>
   1b6c9:	4c 8b 4c 24 10       	mov    0x10(%rsp),%r9
   1b6ce:	46 8d 1c 0a          	lea    (%rdx,%r9,1),%r11d
   1b6d2:	b9 01 00 00 00       	mov    $0x1,%ecx
   1b6d7:	4c 89 5c 24 18       	mov    %r11,0x18(%rsp)
   1b6dc:	44 29 d9             	sub    %r11d,%ecx
   1b6df:	45 29 cf             	sub    %r9d,%r15d
   1b6e2:	41 39 cf             	cmp    %ecx,%r15d
   1b6e5:	44 0f 4e f9          	cmovle %ecx,%r15d
   1b6e9:	44 29 f8             	sub    %r15d,%eax
   1b6ec:	78 61                	js     1b74f <hyperinterval::ieee::Format::div+0x1bf>
   1b6ee:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1b6f3:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
   1b6f8:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1b6fd:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1b702:	48 85 ed             	test   %rbp,%rbp
   1b705:	0f 84 a7 02 00 00    	je     1b9b2 <hyperinterval::ieee::Format::div+0x422>
   1b70b:	45 31 e4             	xor    %r12d,%r12d
   1b70e:	89 c1                	mov    %eax,%ecx
   1b710:	4d 0f a5 ec          	shld   %cl,%r13,%r12
   1b714:	31 d2                	xor    %edx,%edx
   1b716:	49 d3 e5             	shl    %cl,%r13
   1b719:	a8 40                	test   $0x40,%al
   1b71b:	4d 0f 45 e5          	cmovne %r13,%r12
   1b71f:	4c 0f 45 ea          	cmovne %rdx,%r13
   1b723:	4c 89 ef             	mov    %r13,%rdi
   1b726:	4c 89 e6             	mov    %r12,%rsi
   1b729:	48 89 ea             	mov    %rbp,%rdx
   1b72c:	31 c9                	xor    %ecx,%ecx
   1b72e:	ff 15 b4 2e 04 00    	call   *0x42eb4(%rip)        # 5e5e8 <_DYNAMIC+0x438>
   1b734:	49 89 c2             	mov    %rax,%r10
   1b737:	49 89 d1             	mov    %rdx,%r9
   1b73a:	48 89 d1             	mov    %rdx,%rcx
   1b73d:	48 0f af cd          	imul   %rbp,%rcx
   1b741:	48 f7 e5             	mul    %rbp
   1b744:	48 01 ca             	add    %rcx,%rdx
   1b747:	49 29 c5             	sub    %rax,%r13
   1b74a:	49 19 d4             	sbb    %rdx,%r12
   1b74d:	eb 79                	jmp    1b7c8 <hyperinterval::ieee::Format::div+0x238>
   1b74f:	f7 d8                	neg    %eax
   1b751:	44 39 d0             	cmp    %r10d,%eax
   1b754:	7e 07                	jle    1b75d <hyperinterval::ieee::Format::div+0x1cd>
   1b756:	b3 01                	mov    $0x1,%bl
   1b758:	e9 df 00 00 00       	jmp    1b83c <hyperinterval::ieee::Format::div+0x2ac>
   1b75d:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1b762:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
   1b767:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1b76c:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1b771:	31 db                	xor    %ebx,%ebx
   1b773:	89 c1                	mov    %eax,%ecx
   1b775:	48 0f a5 eb          	shld   %cl,%rbp,%rbx
   1b779:	48 d3 e5             	shl    %cl,%rbp
   1b77c:	31 c9                	xor    %ecx,%ecx
   1b77e:	a8 40                	test   $0x40,%al
   1b780:	48 0f 45 dd          	cmovne %rbp,%rbx
   1b784:	48 0f 45 e9          	cmovne %rcx,%rbp
   1b788:	48 89 e8             	mov    %rbp,%rax
   1b78b:	48 09 d8             	or     %rbx,%rax
   1b78e:	0f 84 2b 02 00 00    	je     1b9bf <hyperinterval::ieee::Format::div+0x42f>
   1b794:	45 31 e4             	xor    %r12d,%r12d
   1b797:	4c 89 ef             	mov    %r13,%rdi
   1b79a:	31 f6                	xor    %esi,%esi
   1b79c:	48 89 ea             	mov    %rbp,%rdx
   1b79f:	48 89 d9             	mov    %rbx,%rcx
   1b7a2:	ff 15 40 2e 04 00    	call   *0x42e40(%rip)        # 5e5e8 <_DYNAMIC+0x438>
   1b7a8:	49 89 c2             	mov    %rax,%r10
   1b7ab:	49 89 d1             	mov    %rdx,%r9
   1b7ae:	48 0f af d8          	imul   %rax,%rbx
   1b7b2:	48 f7 e5             	mul    %rbp
   1b7b5:	48 01 da             	add    %rbx,%rdx
   1b7b8:	4c 89 c9             	mov    %r9,%rcx
   1b7bb:	48 0f af cd          	imul   %rbp,%rcx
   1b7bf:	48 01 d1             	add    %rdx,%rcx
   1b7c2:	49 29 c5             	sub    %rax,%r13
   1b7c5:	49 19 cc             	sbb    %rcx,%r12
   1b7c8:	4d 09 e5             	or     %r12,%r13
   1b7cb:	0f 95 c3             	setne  %bl
   1b7ce:	4c 89 d0             	mov    %r10,%rax
   1b7d1:	4c 09 c8             	or     %r9,%rax
   1b7d4:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
   1b7d9:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   1b7de:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
   1b7e3:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
   1b7e8:	74 52                	je     1b83c <hyperinterval::ieee::Format::div+0x2ac>
   1b7ea:	49 0f bd c1          	bsr    %r9,%rax
   1b7ee:	83 f0 3f             	xor    $0x3f,%eax
   1b7f1:	4d 0f bd da          	bsr    %r10,%r11
   1b7f5:	41 83 f3 3f          	xor    $0x3f,%r11d
   1b7f9:	41 83 cb 40          	or     $0x40,%r11d
   1b7fd:	4d 85 c9             	test   %r9,%r9
   1b800:	44 0f 45 d8          	cmovne %eax,%r11d
   1b804:	41 83 f3 7f          	xor    $0x7f,%r11d
   1b808:	43 8d 2c 3b          	lea    (%r11,%r15,1),%ebp
   1b80c:	39 d5                	cmp    %edx,%ebp
   1b80e:	0f 8f ce 00 00 00    	jg     1b8e2 <hyperinterval::ieee::Format::div+0x352>
   1b814:	b8 01 00 00 00       	mov    $0x1,%eax
   1b819:	29 d0                	sub    %edx,%eax
   1b81b:	39 c5                	cmp    %eax,%ebp
   1b81d:	7d 28                	jge    1b847 <hyperinterval::ieee::Format::div+0x2b7>
   1b81f:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1b824:	42 8d 0c 38          	lea    (%rax,%r15,1),%ecx
   1b828:	fe c9                	dec    %cl
   1b82a:	4c 89 d0             	mov    %r10,%rax
   1b82d:	48 d3 e0             	shl    %cl,%rax
   1b830:	45 31 db             	xor    %r11d,%r11d
   1b833:	f6 c1 40             	test   $0x40,%cl
   1b836:	4c 0f 44 d8          	cmove  %rax,%r11
   1b83a:	eb 6e                	jmp    1b8aa <hyperinterval::ieee::Format::div+0x31a>
   1b83c:	45 31 d2             	xor    %r10d,%r10d
   1b83f:	45 31 c9             	xor    %r9d,%r9d
   1b842:	45 31 db             	xor    %r11d,%r11d
   1b845:	eb 63                	jmp    1b8aa <hyperinterval::ieee::Format::div+0x31a>
   1b847:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1b84c:	89 c1                	mov    %eax,%ecx
   1b84e:	44 29 d9             	sub    %r11d,%ecx
   1b851:	4d 89 d4             	mov    %r10,%r12
   1b854:	49 d3 e4             	shl    %cl,%r12
   1b857:	89 c8                	mov    %ecx,%eax
   1b859:	f7 d8                	neg    %eax
   1b85b:	45 31 ed             	xor    %r13d,%r13d
   1b85e:	f6 c1 40             	test   $0x40,%cl
   1b861:	4d 0f 44 ec          	cmove  %r12,%r13
   1b865:	4d 89 d4             	mov    %r10,%r12
   1b868:	89 c1                	mov    %eax,%ecx
   1b86a:	4d 0f ad cc          	shrd   %cl,%r9,%r12
   1b86e:	88 5c 24 0f          	mov    %bl,0xf(%rsp)
   1b872:	4c 89 cb             	mov    %r9,%rbx
   1b875:	48 d3 eb             	shr    %cl,%rbx
   1b878:	a8 40                	test   $0x40,%al
   1b87a:	49 0f 44 dc          	cmove  %r12,%rbx
   1b87e:	44 39 5c 24 10       	cmp    %r11d,0x10(%rsp)
   1b883:	49 0f 43 dd          	cmovae %r13,%rbx
   1b887:	01 d5                	add    %edx,%ebp
   1b889:	48 63 c5             	movslq %ebp,%rax
   1b88c:	44 89 f1             	mov    %r14d,%ecx
   1b88f:	48 d3 e0             	shl    %cl,%rax
   1b892:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   1b899:	49 d3 e3             	shl    %cl,%r11
   1b89c:	49 f7 d3             	not    %r11
   1b89f:	49 21 db             	and    %rbx,%r11
   1b8a2:	0f b6 5c 24 0f       	movzbl 0xf(%rsp),%ebx
   1b8a7:	49 09 c3             	or     %rax,%r11
   1b8aa:	0f b6 db             	movzbl %bl,%ebx
   1b8ad:	4c 01 d3             	add    %r10,%rbx
   1b8b0:	49 83 d1 00          	adc    $0x0,%r9
   1b8b4:	48 89 d8             	mov    %rbx,%rax
   1b8b7:	4c 09 c8             	or     %r9,%rax
   1b8ba:	74 30                	je     1b8ec <hyperinterval::ieee::Format::div+0x35c>
   1b8bc:	49 0f bd c1          	bsr    %r9,%rax
   1b8c0:	83 f0 3f             	xor    $0x3f,%eax
   1b8c3:	4c 0f bd d3          	bsr    %rbx,%r10
   1b8c7:	41 83 f2 3f          	xor    $0x3f,%r10d
   1b8cb:	41 83 ca 40          	or     $0x40,%r10d
   1b8cf:	4d 85 c9             	test   %r9,%r9
   1b8d2:	44 0f 45 d0          	cmovne %eax,%r10d
   1b8d6:	41 83 f2 7f          	xor    $0x7f,%r10d
   1b8da:	43 8d 2c 3a          	lea    (%r10,%r15,1),%ebp
   1b8de:	39 d5                	cmp    %edx,%ebp
   1b8e0:	7e 0e                	jle    1b8f0 <hyperinterval::ieee::Format::div+0x360>
   1b8e2:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   1b8e7:	e9 b4 00 00 00       	jmp    1b9a0 <hyperinterval::ieee::Format::div+0x410>
   1b8ec:	31 c0                	xor    %eax,%eax
   1b8ee:	eb 76                	jmp    1b966 <hyperinterval::ieee::Format::div+0x3d6>
   1b8f0:	b8 01 00 00 00       	mov    $0x1,%eax
   1b8f5:	29 d0                	sub    %edx,%eax
   1b8f7:	39 c5                	cmp    %eax,%ebp
   1b8f9:	7d 18                	jge    1b913 <hyperinterval::ieee::Format::div+0x383>
   1b8fb:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1b900:	44 01 f9             	add    %r15d,%ecx
   1b903:	fe c9                	dec    %cl
   1b905:	48 d3 e3             	shl    %cl,%rbx
   1b908:	31 c0                	xor    %eax,%eax
   1b90a:	f6 c1 40             	test   $0x40,%cl
   1b90d:	48 0f 44 c3          	cmove  %rbx,%rax
   1b911:	eb 53                	jmp    1b966 <hyperinterval::ieee::Format::div+0x3d6>
   1b913:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   1b918:	44 89 e9             	mov    %r13d,%ecx
   1b91b:	44 29 d1             	sub    %r10d,%ecx
   1b91e:	89 c8                	mov    %ecx,%eax
   1b920:	f7 d8                	neg    %eax
   1b922:	49 89 df             	mov    %rbx,%r15
   1b925:	49 d3 e7             	shl    %cl,%r15
   1b928:	45 31 e4             	xor    %r12d,%r12d
   1b92b:	f6 c1 40             	test   $0x40,%cl
   1b92e:	4d 0f 44 e7          	cmove  %r15,%r12
   1b932:	89 c1                	mov    %eax,%ecx
   1b934:	4c 0f ad cb          	shrd   %cl,%r9,%rbx
   1b938:	49 d3 e9             	shr    %cl,%r9
   1b93b:	a8 40                	test   $0x40,%al
   1b93d:	4c 0f 44 cb          	cmove  %rbx,%r9
   1b941:	45 39 d5             	cmp    %r10d,%r13d
   1b944:	4d 0f 43 cc          	cmovae %r12,%r9
   1b948:	01 d5                	add    %edx,%ebp
   1b94a:	48 63 d5             	movslq %ebp,%rdx
   1b94d:	44 89 f1             	mov    %r14d,%ecx
   1b950:	48 d3 e2             	shl    %cl,%rdx
   1b953:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   1b95a:	48 d3 e0             	shl    %cl,%rax
   1b95d:	48 f7 d0             	not    %rax
   1b960:	4c 21 c8             	and    %r9,%rax
   1b963:	48 09 d0             	or     %rdx,%rax
   1b966:	48 85 74 24 40       	test   %rsi,0x40(%rsp)
   1b96b:	0f 95 c1             	setne  %cl
   1b96e:	49 85 f0             	test   %rsi,%r8
   1b971:	0f 94 c2             	sete   %dl
   1b974:	30 ca                	xor    %cl,%dl
   1b976:	75 1d                	jne    1b995 <hyperinterval::ieee::Format::div+0x405>
   1b978:	48 89 c1             	mov    %rax,%rcx
   1b97b:	48 31 f1             	xor    %rsi,%rcx
   1b97e:	48 85 c0             	test   %rax,%rax
   1b981:	48 0f 44 c8          	cmove  %rax,%rcx
   1b985:	4c 31 de             	xor    %r11,%rsi
   1b988:	4d 85 db             	test   %r11,%r11
   1b98b:	49 0f 44 f3          	cmove  %r11,%rsi
   1b98f:	48 89 f0             	mov    %rsi,%rax
   1b992:	49 89 cb             	mov    %rcx,%r11
   1b995:	4c 89 5f 08          	mov    %r11,0x8(%rdi)
   1b999:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1b99d:	c6 07 00             	movb   $0x0,(%rdi)
   1b9a0:	48 89 f8             	mov    %rdi,%rax
   1b9a3:	48 83 c4 48          	add    $0x48,%rsp
   1b9a7:	5b                   	pop    %rbx
   1b9a8:	41 5c                	pop    %r12
   1b9aa:	41 5d                	pop    %r13
   1b9ac:	41 5e                	pop    %r14
   1b9ae:	41 5f                	pop    %r15
   1b9b0:	5d                   	pop    %rbp
   1b9b1:	c3                   	ret
   1b9b2:	48 8d 3d 77 09 04 00 	lea    0x40977(%rip),%rdi        # 5c330 <__frame_dummy_init_array_entry+0x1c0>
   1b9b9:	ff 15 31 2c 04 00    	call   *0x42c31(%rip)        # 5e5f0 <_DYNAMIC+0x440>
   1b9bf:	48 8d 3d 52 09 04 00 	lea    0x40952(%rip),%rdi        # 5c318 <__frame_dummy_init_array_entry+0x1a8>
   1b9c6:	ff 15 24 2c 04 00    	call   *0x42c24(%rip)        # 5e5f0 <_DYNAMIC+0x440>
   1b9cc:	cc                   	int3
   1b9cd:	cc                   	int3
   1b9ce:	cc                   	int3
   1b9cf:	cc                   	int3

hyperinterval::ieee::Format::mul:
   1b9d0:	55                   	push   %rbp
   1b9d1:	41 57                	push   %r15
   1b9d3:	41 56                	push   %r14
   1b9d5:	41 54                	push   %r12
   1b9d7:	53                   	push   %rbx
   1b9d8:	48 83 ec 20          	sub    $0x20,%rsp
   1b9dc:	48 89 c8             	mov    %rcx,%rax
   1b9df:	49 89 d1             	mov    %rdx,%r9
   1b9e2:	b9 40 00 00 00       	mov    $0x40,%ecx
   1b9e7:	f3 48 0f bc ca       	tzcnt  %rdx,%rcx
   1b9ec:	48 89 c2             	mov    %rax,%rdx
   1b9ef:	4c 21 ca             	and    %r9,%rdx
   1b9f2:	48 d3 ea             	shr    %cl,%rdx
   1b9f5:	41 be 01 00 00 00    	mov    $0x1,%r14d
   1b9fb:	49 d3 e6             	shl    %cl,%r14
   1b9fe:	4d 8d 66 ff          	lea    -0x1(%r14),%r12
   1ba02:	4c 89 e3             	mov    %r12,%rbx
   1ba05:	48 21 c3             	and    %rax,%rbx
   1ba08:	48 85 d2             	test   %rdx,%rdx
   1ba0b:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1ba11:	41 89 d3             	mov    %edx,%r11d
   1ba14:	45 0f 44 da          	cmove  %r10d,%r11d
   1ba18:	49 0f 45 d6          	cmovne %r14,%rdx
   1ba1c:	48 09 da             	or     %rbx,%rdx
   1ba1f:	4d 89 cf             	mov    %r9,%r15
   1ba22:	49 d3 ef             	shr    %cl,%r15
   1ba25:	48 85 f0             	test   %rsi,%rax
   1ba28:	40 0f 95 c5          	setne  %bpl
   1ba2c:	4c 89 c0             	mov    %r8,%rax
   1ba2f:	4c 21 c8             	and    %r9,%rax
   1ba32:	48 d3 e8             	shr    %cl,%rax
   1ba35:	4d 21 c4             	and    %r8,%r12
   1ba38:	48 85 c0             	test   %rax,%rax
   1ba3b:	44 0f 45 d0          	cmovne %eax,%r10d
   1ba3f:	48 89 fb             	mov    %rdi,%rbx
   1ba42:	49 0f 45 c6          	cmovne %r14,%rax
   1ba46:	4c 09 e0             	or     %r12,%rax
   1ba49:	49 85 f0             	test   %rsi,%r8
   1ba4c:	40 0f 95 c7          	setne  %dil
   1ba50:	40 30 ef             	xor    %bpl,%dil
   1ba53:	48 f7 e2             	mul    %rdx
   1ba56:	45 01 da             	add    %r11d,%r10d
   1ba59:	41 8d 0c 4f          	lea    (%r15,%rcx,2),%ecx
   1ba5d:	83 e1 fe             	and    $0xfffffffe,%ecx
   1ba60:	41 29 ca             	sub    %ecx,%r10d
   1ba63:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
   1ba68:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1ba6d:	48 89 04 24          	mov    %rax,(%rsp)
   1ba71:	44 89 54 24 10       	mov    %r10d,0x10(%rsp)
   1ba76:	48 89 e1             	mov    %rsp,%rcx
   1ba79:	48 89 df             	mov    %rbx,%rdi
   1ba7c:	4c 89 ca             	mov    %r9,%rdx
   1ba7f:	e8 4c 08 00 00       	call   1c2d0 <hyperinterval::ieee::Format::rounded>
   1ba84:	48 89 d8             	mov    %rbx,%rax
   1ba87:	48 83 c4 20          	add    $0x20,%rsp
   1ba8b:	5b                   	pop    %rbx
   1ba8c:	41 5c                	pop    %r12
   1ba8e:	41 5e                	pop    %r14
   1ba90:	41 5f                	pop    %r15
   1ba92:	5d                   	pop    %rbp
   1ba93:	c3                   	ret
   1ba94:	cc                   	int3
   1ba95:	cc                   	int3
   1ba96:	cc                   	int3
   1ba97:	cc                   	int3
   1ba98:	cc                   	int3
   1ba99:	cc                   	int3
   1ba9a:	cc                   	int3
   1ba9b:	cc                   	int3
   1ba9c:	cc                   	int3
   1ba9d:	cc                   	int3
   1ba9e:	cc                   	int3
   1ba9f:	cc                   	int3

hyperinterval::ieee::Format::power:
   1baa0:	55                   	push   %rbp
   1baa1:	41 57                	push   %r15
   1baa3:	41 56                	push   %r14
   1baa5:	41 55                	push   %r13
   1baa7:	41 54                	push   %r12
   1baa9:	53                   	push   %rbx
   1baaa:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
   1bab1:	49 89 cb             	mov    %rcx,%r11
   1bab4:	49 89 d6             	mov    %rdx,%r14
   1bab7:	48 85 f1             	test   %rsi,%rcx
   1baba:	41 0f 95 c1          	setne  %r9b
   1babe:	b8 40 00 00 00       	mov    $0x40,%eax
   1bac3:	f3 48 0f bc c2       	tzcnt  %rdx,%rax
   1bac8:	41 89 c2             	mov    %eax,%r10d
   1bacb:	41 83 e2 3f          	and    $0x3f,%r10d
   1bacf:	44 89 d1             	mov    %r10d,%ecx
   1bad2:	48 d3 ea             	shr    %cl,%rdx
   1bad5:	48 89 d1             	mov    %rdx,%rcx
   1bad8:	48 d1 e9             	shr    $1,%rcx
   1badb:	48 63 d9             	movslq %ecx,%rbx
   1bade:	44 89 d1             	mov    %r10d,%ecx
   1bae1:	48 d3 e3             	shl    %cl,%rbx
   1bae4:	45 85 c0             	test   %r8d,%r8d
   1bae7:	0f 84 46 03 00 00    	je     1be33 <hyperinterval::ieee::Format::power+0x393>
   1baed:	44 88 4c 24 03       	mov    %r9b,0x3(%rsp)
   1baf2:	48 89 7c 24 48       	mov    %rdi,0x48(%rsp)
   1baf7:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1bafd:	44 89 d1             	mov    %r10d,%ecx
   1bb00:	49 d3 e1             	shl    %cl,%r9
   1bb03:	48 8d 4e ff          	lea    -0x1(%rsi),%rcx
   1bb07:	49 21 cb             	and    %rcx,%r11
   1bb0a:	48 89 d9             	mov    %rbx,%rcx
   1bb0d:	4d 8d 79 ff          	lea    -0x1(%r9),%r15
   1bb11:	8d 2c 42             	lea    (%rdx,%rax,2),%ebp
   1bb14:	83 e5 fe             	and    $0xfffffffe,%ebp
   1bb17:	ba 02 00 00 00       	mov    $0x2,%edx
   1bb1c:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1bb21:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1bb26:	44 89 44 24 68       	mov    %r8d,0x68(%rsp)
   1bb2b:	44 89 c3             	mov    %r8d,%ebx
   1bb2e:	4c 89 5c 24 58       	mov    %r11,0x58(%rsp)
   1bb33:	4c 89 5c 24 60       	mov    %r11,0x60(%rsp)
   1bb38:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
   1bb3d:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   1bb42:	4c 89 8c 24 80 00 00 	mov    %r9,0x80(%rsp)
   1bb49:	00 
   1bb4a:	4c 89 54 24 78       	mov    %r10,0x78(%rsp)
   1bb4f:	4c 89 7c 24 70       	mov    %r15,0x70(%rsp)
   1bb54:	89 6c 24 6c          	mov    %ebp,0x6c(%rsp)
   1bb58:	f6 c3 01             	test   $0x1,%bl
   1bb5b:	0f 84 a4 01 00 00    	je     1bd05 <hyperinterval::ieee::Format::power+0x265>
   1bb61:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   1bb68:	0f 1f 84 00 00 00 00 
   1bb6f:	00 
   1bb70:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
   1bb74:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1bb79:	48 89 d0             	mov    %rdx,%rax
   1bb7c:	4c 21 f0             	and    %r14,%rax
   1bb7f:	44 89 d1             	mov    %r10d,%ecx
   1bb82:	48 d3 e8             	shr    %cl,%rax
   1bb85:	48 89 d1             	mov    %rdx,%rcx
   1bb88:	4c 21 f9             	and    %r15,%rcx
   1bb8b:	48 85 c0             	test   %rax,%rax
   1bb8e:	41 89 c3             	mov    %eax,%r11d
   1bb91:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1bb97:	45 0f 44 d8          	cmove  %r8d,%r11d
   1bb9b:	49 0f 45 c1          	cmovne %r9,%rax
   1bb9f:	48 09 c8             	or     %rcx,%rax
   1bba2:	48 85 f2             	test   %rsi,%rdx
   1bba5:	0f 95 44 24 08       	setne  0x8(%rsp)
   1bbaa:	4c 8b 6c 24 60       	mov    0x60(%rsp),%r13
   1bbaf:	4c 89 eb             	mov    %r13,%rbx
   1bbb2:	4c 21 f3             	and    %r14,%rbx
   1bbb5:	44 89 d1             	mov    %r10d,%ecx
   1bbb8:	48 d3 eb             	shr    %cl,%rbx
   1bbbb:	4c 89 e9             	mov    %r13,%rcx
   1bbbe:	4c 21 f9             	and    %r15,%rcx
   1bbc1:	48 85 db             	test   %rbx,%rbx
   1bbc4:	41 89 d8             	mov    %ebx,%r8d
   1bbc7:	ba 01 00 00 00       	mov    $0x1,%edx
   1bbcc:	44 0f 44 c2          	cmove  %edx,%r8d
   1bbd0:	49 0f 45 d9          	cmovne %r9,%rbx
   1bbd4:	48 09 cb             	or     %rcx,%rbx
   1bbd7:	49 85 f5             	test   %rsi,%r13
   1bbda:	0f 95 c1             	setne  %cl
   1bbdd:	32 4c 24 08          	xor    0x8(%rsp),%cl
   1bbe1:	48 f7 e3             	mul    %rbx
   1bbe4:	41 29 e8             	sub    %ebp,%r8d
   1bbe7:	45 01 d8             	add    %r11d,%r8d
   1bbea:	88 4c 24 24          	mov    %cl,0x24(%rsp)
   1bbee:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1bbf3:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1bbf8:	44 89 44 24 20       	mov    %r8d,0x20(%rsp)
   1bbfd:	4c 89 f2             	mov    %r14,%rdx
   1bc00:	4c 89 e1             	mov    %r12,%rcx
   1bc03:	49 89 fd             	mov    %rdi,%r13
   1bc06:	4d 89 cc             	mov    %r9,%r12
   1bc09:	48 89 f3             	mov    %rsi,%rbx
   1bc0c:	4c 89 f5             	mov    %r14,%rbp
   1bc0f:	4d 89 d6             	mov    %r10,%r14
   1bc12:	e8 b9 06 00 00       	call   1c2d0 <hyperinterval::ieee::Format::rounded>
   1bc17:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   1bc1c:	0f 85 00 02 00 00    	jne    1be22 <hyperinterval::ieee::Format::power+0x382>
   1bc22:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
   1bc27:	48 89 d0             	mov    %rdx,%rax
   1bc2a:	48 21 e8             	and    %rbp,%rax
   1bc2d:	44 89 f1             	mov    %r14d,%ecx
   1bc30:	48 d3 e8             	shr    %cl,%rax
   1bc33:	48 89 d1             	mov    %rdx,%rcx
   1bc36:	4c 21 f9             	and    %r15,%rcx
   1bc39:	48 85 c0             	test   %rax,%rax
   1bc3c:	89 c6                	mov    %eax,%esi
   1bc3e:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1bc44:	41 0f 44 f2          	cmove  %r10d,%esi
   1bc48:	49 0f 45 c4          	cmovne %r12,%rax
   1bc4c:	48 09 c8             	or     %rcx,%rax
   1bc4f:	48 85 da             	test   %rbx,%rdx
   1bc52:	0f 95 c2             	setne  %dl
   1bc55:	4c 8b 4c 24 58       	mov    0x58(%rsp),%r9
   1bc5a:	4c 89 cf             	mov    %r9,%rdi
   1bc5d:	48 21 ef             	and    %rbp,%rdi
   1bc60:	44 89 f1             	mov    %r14d,%ecx
   1bc63:	48 d3 ef             	shr    %cl,%rdi
   1bc66:	4c 89 c9             	mov    %r9,%rcx
   1bc69:	4c 21 f9             	and    %r15,%rcx
   1bc6c:	48 85 ff             	test   %rdi,%rdi
   1bc6f:	41 89 f8             	mov    %edi,%r8d
   1bc72:	45 0f 44 c2          	cmove  %r10d,%r8d
   1bc76:	49 0f 45 fc          	cmovne %r12,%rdi
   1bc7a:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
   1bc7f:	4c 89 54 24 08       	mov    %r10,0x8(%rsp)
   1bc84:	48 09 cf             	or     %rcx,%rdi
   1bc87:	49 85 d9             	test   %rbx,%r9
   1bc8a:	0f 95 c1             	setne  %cl
   1bc8d:	30 d1                	xor    %dl,%cl
   1bc8f:	48 f7 e7             	mul    %rdi
   1bc92:	4d 89 ef             	mov    %r13,%r15
   1bc95:	44 8b 6c 24 6c       	mov    0x6c(%rsp),%r13d
   1bc9a:	45 29 e8             	sub    %r13d,%r8d
   1bc9d:	41 01 f0             	add    %esi,%r8d
   1bca0:	88 4c 24 24          	mov    %cl,0x24(%rsp)
   1bca4:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1bca9:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1bcae:	44 89 44 24 20       	mov    %r8d,0x20(%rsp)
   1bcb3:	4c 89 ff             	mov    %r15,%rdi
   1bcb6:	48 89 de             	mov    %rbx,%rsi
   1bcb9:	48 89 ea             	mov    %rbp,%rdx
   1bcbc:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1bcc1:	4c 89 e1             	mov    %r12,%rcx
   1bcc4:	e8 07 06 00 00       	call   1c2d0 <hyperinterval::ieee::Format::rounded>
   1bcc9:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   1bcce:	0f 84 4e 01 00 00    	je     1be22 <hyperinterval::ieee::Format::power+0x382>
   1bcd4:	48 89 de             	mov    %rbx,%rsi
   1bcd7:	49 89 ee             	mov    %rbp,%r14
   1bcda:	44 89 ed             	mov    %r13d,%ebp
   1bcdd:	4c 89 ff             	mov    %r15,%rdi
   1bce0:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1bce5:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1bcea:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1bcf1:	00 
   1bcf2:	4c 8b 54 24 78       	mov    0x78(%rsp),%r10
   1bcf7:	4c 8b 7c 24 70       	mov    0x70(%rsp),%r15
   1bcfc:	ba 02 00 00 00       	mov    $0x2,%edx
   1bd01:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
   1bd05:	d1 eb                	shr    $1,%ebx
   1bd07:	0f 84 6c 01 00 00    	je     1be79 <hyperinterval::ieee::Format::power+0x3d9>
   1bd0d:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
   1bd11:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   1bd16:	4c 89 c0             	mov    %r8,%rax
   1bd19:	4c 21 f0             	and    %r14,%rax
   1bd1c:	44 89 d1             	mov    %r10d,%ecx
   1bd1f:	48 d3 e8             	shr    %cl,%rax
   1bd22:	4d 21 f8             	and    %r15,%r8
   1bd25:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
   1bd28:	48 85 c0             	test   %rax,%rax
   1bd2b:	49 0f 45 c1          	cmovne %r9,%rax
   1bd2f:	0f 44 ca             	cmove  %edx,%ecx
   1bd32:	4c 09 c0             	or     %r8,%rax
   1bd35:	48 f7 e0             	mul    %rax
   1bd38:	29 e9                	sub    %ebp,%ecx
   1bd3a:	c6 44 24 24 00       	movb   $0x0,0x24(%rsp)
   1bd3f:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1bd44:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1bd49:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   1bd4d:	4c 89 f2             	mov    %r14,%rdx
   1bd50:	4c 89 e1             	mov    %r12,%rcx
   1bd53:	41 89 ed             	mov    %ebp,%r13d
   1bd56:	4d 89 cc             	mov    %r9,%r12
   1bd59:	4c 89 fb             	mov    %r15,%rbx
   1bd5c:	49 89 f7             	mov    %rsi,%r15
   1bd5f:	4c 89 f5             	mov    %r14,%rbp
   1bd62:	4d 89 d6             	mov    %r10,%r14
   1bd65:	e8 66 05 00 00       	call   1c2d0 <hyperinterval::ieee::Format::rounded>
   1bd6a:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   1bd6f:	0f 85 ad 00 00 00    	jne    1be22 <hyperinterval::ieee::Format::power+0x382>
   1bd75:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
   1bd7a:	48 89 d0             	mov    %rdx,%rax
   1bd7d:	48 21 e8             	and    %rbp,%rax
   1bd80:	44 89 f1             	mov    %r14d,%ecx
   1bd83:	48 d3 e8             	shr    %cl,%rax
   1bd86:	48 21 da             	and    %rbx,%rdx
   1bd89:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
   1bd8c:	48 85 c0             	test   %rax,%rax
   1bd8f:	49 0f 45 c4          	cmovne %r12,%rax
   1bd93:	be 02 00 00 00       	mov    $0x2,%esi
   1bd98:	0f 44 ce             	cmove  %esi,%ecx
   1bd9b:	48 09 d0             	or     %rdx,%rax
   1bd9e:	48 f7 e0             	mul    %rax
   1bda1:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
   1bda6:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   1bdab:	44 29 e9             	sub    %r13d,%ecx
   1bdae:	c6 44 24 24 00       	movb   $0x0,0x24(%rsp)
   1bdb3:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1bdb8:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1bdbd:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   1bdc1:	48 8d 5c 24 30       	lea    0x30(%rsp),%rbx
   1bdc6:	48 89 df             	mov    %rbx,%rdi
   1bdc9:	4c 89 fe             	mov    %r15,%rsi
   1bdcc:	48 89 ea             	mov    %rbp,%rdx
   1bdcf:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1bdd4:	4c 89 e1             	mov    %r12,%rcx
   1bdd7:	e8 f4 04 00 00       	call   1c2d0 <hyperinterval::ieee::Format::rounded>
   1bddc:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   1bde1:	ba 02 00 00 00       	mov    $0x2,%edx
   1bde6:	74 3a                	je     1be22 <hyperinterval::ieee::Format::power+0x382>
   1bde8:	4c 89 fe             	mov    %r15,%rsi
   1bdeb:	49 89 ee             	mov    %rbp,%r14
   1bdee:	44 89 ed             	mov    %r13d,%ebp
   1bdf1:	48 89 df             	mov    %rbx,%rdi
   1bdf4:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1bdf9:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1bdfe:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1be05:	00 
   1be06:	4c 8b 54 24 78       	mov    0x78(%rsp),%r10
   1be0b:	4c 8b 7c 24 70       	mov    0x70(%rsp),%r15
   1be10:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
   1be14:	f6 c3 01             	test   $0x1,%bl
   1be17:	0f 85 53 fd ff ff    	jne    1bb70 <hyperinterval::ieee::Format::power+0xd0>
   1be1d:	e9 e3 fe ff ff       	jmp    1bd05 <hyperinterval::ieee::Format::power+0x265>
   1be22:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   1be27:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
   1be2c:	88 47 01             	mov    %al,0x1(%rdi)
   1be2f:	b0 01                	mov    $0x1,%al
   1be31:	eb 2f                	jmp    1be62 <hyperinterval::ieee::Format::power+0x3c2>
   1be33:	48 89 d9             	mov    %rbx,%rcx
   1be36:	45 20 c1             	and    %r8b,%r9b
   1be39:	74 1d                	je     1be58 <hyperinterval::ieee::Format::power+0x3b8>
   1be3b:	48 89 d8             	mov    %rbx,%rax
   1be3e:	48 31 f0             	xor    %rsi,%rax
   1be41:	48 85 db             	test   %rbx,%rbx
   1be44:	48 0f 44 c3          	cmove  %rbx,%rax
   1be48:	48 31 ce             	xor    %rcx,%rsi
   1be4b:	48 85 c9             	test   %rcx,%rcx
   1be4e:	48 0f 44 f1          	cmove  %rcx,%rsi
   1be52:	48 89 c1             	mov    %rax,%rcx
   1be55:	48 89 f3             	mov    %rsi,%rbx
   1be58:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1be5c:	48 89 5f 10          	mov    %rbx,0x10(%rdi)
   1be60:	31 c0                	xor    %eax,%eax
   1be62:	88 07                	mov    %al,(%rdi)
   1be64:	48 89 f8             	mov    %rdi,%rax
   1be67:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
   1be6e:	5b                   	pop    %rbx
   1be6f:	41 5c                	pop    %r12
   1be71:	41 5d                	pop    %r13
   1be73:	41 5e                	pop    %r14
   1be75:	41 5f                	pop    %r15
   1be77:	5d                   	pop    %rbp
   1be78:	c3                   	ret
   1be79:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
   1be7e:	44 8b 44 24 68       	mov    0x68(%rsp),%r8d
   1be83:	44 0f b6 4c 24 03    	movzbl 0x3(%rsp),%r9d
   1be89:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
   1be8e:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1be93:	45 20 c1             	and    %r8b,%r9b
   1be96:	75 a3                	jne    1be3b <hyperinterval::ieee::Format::power+0x39b>
   1be98:	eb be                	jmp    1be58 <hyperinterval::ieee::Format::power+0x3b8>
   1be9a:	cc                   	int3
   1be9b:	cc                   	int3
   1be9c:	cc                   	int3
   1be9d:	cc                   	int3
   1be9e:	cc                   	int3
   1be9f:	cc                   	int3

hyperinterval::ieee::Format::affine:
   1bea0:	55                   	push   %rbp
   1bea1:	41 57                	push   %r15
   1bea3:	41 56                	push   %r14
   1bea5:	41 55                	push   %r13
   1bea7:	41 54                	push   %r12
   1bea9:	53                   	push   %rbx
   1beaa:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   1beb1:	48 89 c8             	mov    %rcx,%rax
   1beb4:	49 89 d6             	mov    %rdx,%r14
   1beb7:	b9 40 00 00 00       	mov    $0x40,%ecx
   1bebc:	f3 48 0f bc ca       	tzcnt  %rdx,%rcx
   1bec1:	48 89 c2             	mov    %rax,%rdx
   1bec4:	4c 21 f2             	and    %r14,%rdx
   1bec7:	48 d3 ea             	shr    %cl,%rdx
   1beca:	41 bb 01 00 00 00    	mov    $0x1,%r11d
   1bed0:	49 d3 e3             	shl    %cl,%r11
   1bed3:	4d 8d 7b ff          	lea    -0x1(%r11),%r15
   1bed7:	4c 89 fb             	mov    %r15,%rbx
   1beda:	48 21 c3             	and    %rax,%rbx
   1bedd:	48 85 d2             	test   %rdx,%rdx
   1bee0:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1bee6:	89 d5                	mov    %edx,%ebp
   1bee8:	41 0f 44 ea          	cmove  %r10d,%ebp
   1beec:	48 89 3c 24          	mov    %rdi,(%rsp)
   1bef0:	49 0f 45 d3          	cmovne %r11,%rdx
   1bef4:	4d 89 f5             	mov    %r14,%r13
   1bef7:	49 d3 ed             	shr    %cl,%r13
   1befa:	48 09 da             	or     %rbx,%rdx
   1befd:	49 d1 ed             	shr    $1,%r13
   1bf00:	41 01 cd             	add    %ecx,%r13d
   1bf03:	44 29 ed             	sub    %r13d,%ebp
   1bf06:	48 85 f0             	test   %rsi,%rax
   1bf09:	0f 95 c3             	setne  %bl
   1bf0c:	4c 89 c0             	mov    %r8,%rax
   1bf0f:	4c 21 f0             	and    %r14,%rax
   1bf12:	48 d3 e8             	shr    %cl,%rax
   1bf15:	4d 89 fc             	mov    %r15,%r12
   1bf18:	4d 21 c4             	and    %r8,%r12
   1bf1b:	48 85 c0             	test   %rax,%rax
   1bf1e:	89 c7                	mov    %eax,%edi
   1bf20:	41 0f 44 fa          	cmove  %r10d,%edi
   1bf24:	49 0f 45 c3          	cmovne %r11,%rax
   1bf28:	4c 09 e0             	or     %r12,%rax
   1bf2b:	44 29 ef             	sub    %r13d,%edi
   1bf2e:	49 85 f0             	test   %rsi,%r8
   1bf31:	41 0f 95 c0          	setne  %r8b
   1bf35:	01 ef                	add    %ebp,%edi
   1bf37:	4c 89 f5             	mov    %r14,%rbp
   1bf3a:	4d 89 cc             	mov    %r9,%r12
   1bf3d:	4d 21 f4             	and    %r14,%r12
   1bf40:	49 d3 ec             	shr    %cl,%r12
   1bf43:	41 30 d8             	xor    %bl,%r8b
   1bf46:	48 f7 e2             	mul    %rdx
   1bf49:	4d 21 cf             	and    %r9,%r15
   1bf4c:	4d 85 e4             	test   %r12,%r12
   1bf4f:	45 0f 45 d4          	cmovne %r12d,%r10d
   1bf53:	4d 0f 45 e3          	cmovne %r11,%r12
   1bf57:	4d 09 fc             	or     %r15,%r12
   1bf5a:	45 29 ea             	sub    %r13d,%r10d
   1bf5d:	49 85 f1             	test   %rsi,%r9
   1bf60:	0f 95 84 24 84 00 00 	setne  0x84(%rsp)
   1bf67:	00 
   1bf68:	0f 95 c3             	setne  %bl
   1bf6b:	48 89 c1             	mov    %rax,%rcx
   1bf6e:	48 09 d1             	or     %rdx,%rcx
   1bf71:	44 88 44 24 64       	mov    %r8b,0x64(%rsp)
   1bf76:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   1bf7b:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1bf80:	89 7c 24 60          	mov    %edi,0x60(%rsp)
   1bf84:	4c 89 64 24 70       	mov    %r12,0x70(%rsp)
   1bf89:	48 c7 44 24 78 00 00 	movq   $0x0,0x78(%rsp)
   1bf90:	00 00 
   1bf92:	44 89 94 24 80 00 00 	mov    %r10d,0x80(%rsp)
   1bf99:	00 
   1bf9a:	74 79                	je     1c015 <hyperinterval::ieee::Format::affine+0x175>
   1bf9c:	4d 85 e4             	test   %r12,%r12
   1bf9f:	74 7b                	je     1c01c <hyperinterval::ieee::Format::affine+0x17c>
   1bfa1:	48 89 6c 24 30       	mov    %rbp,0x30(%rsp)
   1bfa6:	48 0f bd ca          	bsr    %rdx,%rcx
   1bfaa:	83 f1 3f             	xor    $0x3f,%ecx
   1bfad:	4c 0f bd d8          	bsr    %rax,%r11
   1bfb1:	41 83 f3 3f          	xor    $0x3f,%r11d
   1bfb5:	41 83 cb 40          	or     $0x40,%r11d
   1bfb9:	48 85 d2             	test   %rdx,%rdx
   1bfbc:	44 0f 45 d9          	cmovne %ecx,%r11d
   1bfc0:	41 83 f3 7f          	xor    $0x7f,%r11d
   1bfc4:	41 01 fb             	add    %edi,%r11d
   1bfc7:	4d 0f bd fc          	bsr    %r12,%r15
   1bfcb:	41 83 f7 3f          	xor    $0x3f,%r15d
   1bfcf:	41 83 cf 40          	or     $0x40,%r15d
   1bfd3:	41 83 f7 7f          	xor    $0x7f,%r15d
   1bfd7:	45 01 d7             	add    %r10d,%r15d
   1bfda:	45 39 df             	cmp    %r11d,%r15d
   1bfdd:	45 0f 4e fb          	cmovle %r11d,%r15d
   1bfe1:	41 83 c7 82          	add    $0xffffff82,%r15d
   1bfe5:	44 29 ff             	sub    %r15d,%edi
   1bfe8:	78 4b                	js     1c035 <hyperinterval::ieee::Format::affine+0x195>
   1bfea:	89 f9                	mov    %edi,%ecx
   1bfec:	48 0f a5 c2          	shld   %cl,%rax,%rdx
   1bff0:	48 d3 e0             	shl    %cl,%rax
   1bff3:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   1bffa:	00 00 
   1bffc:	40 f6 c7 40          	test   $0x40,%dil
   1c000:	48 0f 45 d0          	cmovne %rax,%rdx
   1c004:	bd 00 00 00 00       	mov    $0x0,%ebp
   1c009:	48 0f 44 e8          	cmove  %rax,%rbp
   1c00d:	49 89 d3             	mov    %rdx,%r11
   1c010:	e9 9b 00 00 00       	jmp    1c0b0 <hyperinterval::ieee::Format::affine+0x210>
   1c015:	48 8d 4c 24 70       	lea    0x70(%rsp),%rcx
   1c01a:	eb 05                	jmp    1c021 <hyperinterval::ieee::Format::affine+0x181>
   1c01c:	48 8d 4c 24 50       	lea    0x50(%rsp),%rcx
   1c021:	4c 8b 34 24          	mov    (%rsp),%r14
   1c025:	4c 89 f7             	mov    %r14,%rdi
   1c028:	48 89 ea             	mov    %rbp,%rdx
   1c02b:	e8 a0 02 00 00       	call   1c2d0 <hyperinterval::ieee::Format::rounded>
   1c030:	e9 43 02 00 00       	jmp    1c278 <hyperinterval::ieee::Format::affine+0x3d8>
   1c035:	f7 df                	neg    %edi
   1c037:	bd 00 00 00 00       	mov    $0x0,%ebp
   1c03c:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   1c042:	83 ff 7f             	cmp    $0x7f,%edi
   1c045:	7f 5b                	jg     1c0a2 <hyperinterval::ieee::Format::affine+0x202>
   1c047:	48 89 c5             	mov    %rax,%rbp
   1c04a:	89 f9                	mov    %edi,%ecx
   1c04c:	48 0f ad d5          	shrd   %cl,%rdx,%rbp
   1c050:	49 89 d3             	mov    %rdx,%r11
   1c053:	49 d3 eb             	shr    %cl,%r11
   1c056:	41 89 dd             	mov    %ebx,%r13d
   1c059:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
   1c060:	48 d3 e3             	shl    %cl,%rbx
   1c063:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
   1c06a:	40 f6 c7 40          	test   $0x40,%dil
   1c06e:	49 0f 45 eb          	cmovne %r11,%rbp
   1c072:	41 be 00 00 00 00    	mov    $0x0,%r14d
   1c078:	4d 0f 45 de          	cmovne %r14,%r11
   1c07c:	48 0f 45 cb          	cmovne %rbx,%rcx
   1c080:	bf 00 00 00 00       	mov    $0x0,%edi
   1c085:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
   1c08a:	49 0f 45 de          	cmovne %r14,%rbx
   1c08e:	48 f7 d3             	not    %rbx
   1c091:	48 f7 d1             	not    %rcx
   1c094:	48 21 d1             	and    %rdx,%rcx
   1c097:	48 21 c3             	and    %rax,%rbx
   1c09a:	48 09 cb             	or     %rcx,%rbx
   1c09d:	44 89 eb             	mov    %r13d,%ebx
   1c0a0:	74 0e                	je     1c0b0 <hyperinterval::ieee::Format::affine+0x210>
   1c0a2:	41 0f b6 c0          	movzbl %r8b,%eax
   1c0a6:	f7 d8                	neg    %eax
   1c0a8:	83 c8 01             	or     $0x1,%eax
   1c0ab:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
   1c0b0:	45 29 fa             	sub    %r15d,%r10d
   1c0b3:	78 20                	js     1c0d5 <hyperinterval::ieee::Format::affine+0x235>
   1c0b5:	31 d2                	xor    %edx,%edx
   1c0b7:	44 89 d1             	mov    %r10d,%ecx
   1c0ba:	4c 0f a5 e2          	shld   %cl,%r12,%rdx
   1c0be:	49 d3 e4             	shl    %cl,%r12
   1c0c1:	45 31 ed             	xor    %r13d,%r13d
   1c0c4:	41 f6 c2 40          	test   $0x40,%r10b
   1c0c8:	49 0f 45 d4          	cmovne %r12,%rdx
   1c0cc:	4d 0f 45 e5          	cmovne %r13,%r12
   1c0d0:	4c 89 e0             	mov    %r12,%rax
   1c0d3:	eb 58                	jmp    1c12d <hyperinterval::ieee::Format::affine+0x28d>
   1c0d5:	41 f7 da             	neg    %r10d
   1c0d8:	45 31 ed             	xor    %r13d,%r13d
   1c0db:	b8 00 00 00 00       	mov    $0x0,%eax
   1c0e0:	41 83 fa 7f          	cmp    $0x7f,%r10d
   1c0e4:	7f 2d                	jg     1c113 <hyperinterval::ieee::Format::affine+0x273>
   1c0e6:	4c 89 e0             	mov    %r12,%rax
   1c0e9:	44 89 d1             	mov    %r10d,%ecx
   1c0ec:	4c 0f ad e8          	shrd   %cl,%r13,%rax
   1c0f0:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
   1c0f7:	48 d3 e7             	shl    %cl,%rdi
   1c0fa:	41 f6 c2 40          	test   $0x40,%r10b
   1c0fe:	49 0f 45 c5          	cmovne %r13,%rax
   1c102:	49 0f 45 fd          	cmovne %r13,%rdi
   1c106:	48 f7 d7             	not    %rdi
   1c109:	ba 00 00 00 00       	mov    $0x0,%edx
   1c10e:	4c 85 e7             	test   %r12,%rdi
   1c111:	74 1a                	je     1c12d <hyperinterval::ieee::Format::affine+0x28d>
   1c113:	4c 89 ea             	mov    %r13,%rdx
   1c116:	4c 89 c9             	mov    %r9,%rcx
   1c119:	48 21 f1             	and    %rsi,%rcx
   1c11c:	31 ff                	xor    %edi,%edi
   1c11e:	48 f7 d9             	neg    %rcx
   1c121:	40 0f 93 c7          	setae  %dil
   1c125:	44 8d 2c 7d ff ff ff 	lea    -0x1(,%rdi,2),%r13d
   1c12c:	ff 
   1c12d:	49 85 f1             	test   %rsi,%r9
   1c130:	0f 95 c1             	setne  %cl
   1c133:	41 38 c8             	cmp    %cl,%r8b
   1c136:	74 16                	je     1c14e <hyperinterval::ieee::Format::affine+0x2ae>
   1c138:	48 39 c5             	cmp    %rax,%rbp
   1c13b:	4c 89 d9             	mov    %r11,%rcx
   1c13e:	48 19 d1             	sbb    %rdx,%rcx
   1c141:	73 13                	jae    1c156 <hyperinterval::ieee::Format::affine+0x2b6>
   1c143:	48 29 e8             	sub    %rbp,%rax
   1c146:	4c 19 da             	sbb    %r11,%rdx
   1c149:	41 89 d8             	mov    %ebx,%r8d
   1c14c:	eb 14                	jmp    1c162 <hyperinterval::ieee::Format::affine+0x2c2>
   1c14e:	48 01 e8             	add    %rbp,%rax
   1c151:	4c 11 da             	adc    %r11,%rdx
   1c154:	eb 0c                	jmp    1c162 <hyperinterval::ieee::Format::affine+0x2c2>
   1c156:	48 29 c5             	sub    %rax,%rbp
   1c159:	49 19 d3             	sbb    %rdx,%r11
   1c15c:	48 89 e8             	mov    %rbp,%rax
   1c15f:	4c 89 da             	mov    %r11,%rdx
   1c162:	44 88 44 24 24       	mov    %r8b,0x24(%rsp)
   1c167:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1c16c:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1c171:	44 89 7c 24 20       	mov    %r15d,0x20(%rsp)
   1c176:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1c17b:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1c180:	49 89 f4             	mov    %rsi,%r12
   1c183:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
   1c188:	48 89 da             	mov    %rbx,%rdx
   1c18b:	e8 40 01 00 00       	call   1c2d0 <hyperinterval::ieee::Format::rounded>
   1c190:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   1c195:	75 16                	jne    1c1ad <hyperinterval::ieee::Format::affine+0x30d>
   1c197:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
   1c19c:	4c 8b 34 24          	mov    (%rsp),%r14
   1c1a0:	41 88 46 01          	mov    %al,0x1(%r14)
   1c1a4:	41 c6 06 01          	movb   $0x1,(%r14)
   1c1a8:	e9 cb 00 00 00       	jmp    1c278 <hyperinterval::ieee::Format::affine+0x3d8>
   1c1ad:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
   1c1b2:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
   1c1b7:	49 39 c7             	cmp    %rax,%r15
   1c1ba:	0f 85 a8 00 00 00    	jne    1c268 <hyperinterval::ieee::Format::affine+0x3c8>
   1c1c0:	44 03 6c 24 08       	add    0x8(%rsp),%r13d
   1c1c5:	41 83 fd 01          	cmp    $0x1,%r13d
   1c1c9:	74 60                	je     1c22b <hyperinterval::ieee::Format::affine+0x38b>
   1c1cb:	41 83 fd ff          	cmp    $0xffffffff,%r13d
   1c1cf:	0f 85 93 00 00 00    	jne    1c268 <hyperinterval::ieee::Format::affine+0x3c8>
   1c1d5:	4c 89 f8             	mov    %r15,%rax
   1c1d8:	4c 89 e6             	mov    %r12,%rsi
   1c1db:	4c 31 e0             	xor    %r12,%rax
   1c1de:	4d 85 ff             	test   %r15,%r15
   1c1e1:	49 0f 44 c7          	cmove  %r15,%rax
   1c1e5:	48 89 c1             	mov    %rax,%rcx
   1c1e8:	4c 21 e1             	and    %r12,%rcx
   1c1eb:	31 d2                	xor    %edx,%edx
   1c1ed:	48 f7 d9             	neg    %rcx
   1c1f0:	0f 93 c2             	setae  %dl
   1c1f3:	48 8d 0c 50          	lea    (%rax,%rdx,2),%rcx
   1c1f7:	48 ff c9             	dec    %rcx
   1c1fa:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1c1ff:	48 89 da             	mov    %rbx,%rdx
   1c202:	e8 89 00 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1c207:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1c20c:	75 49                	jne    1c257 <hyperinterval::ieee::Format::affine+0x3b7>
   1c20e:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1c213:	49 31 c4             	xor    %rax,%r12
   1c216:	48 85 c0             	test   %rax,%rax
   1c219:	4c 0f 44 e0          	cmove  %rax,%r12
   1c21d:	4c 8b 34 24          	mov    (%rsp),%r14
   1c221:	4d 89 66 08          	mov    %r12,0x8(%r14)
   1c225:	4d 89 7e 10          	mov    %r15,0x10(%r14)
   1c229:	eb 49                	jmp    1c274 <hyperinterval::ieee::Format::affine+0x3d4>
   1c22b:	4c 89 e6             	mov    %r12,%rsi
   1c22e:	4c 89 f8             	mov    %r15,%rax
   1c231:	4c 21 e0             	and    %r12,%rax
   1c234:	31 c9                	xor    %ecx,%ecx
   1c236:	48 f7 d8             	neg    %rax
   1c239:	0f 93 c1             	setae  %cl
   1c23c:	49 8d 0c 4f          	lea    (%r15,%rcx,2),%rcx
   1c240:	48 ff c9             	dec    %rcx
   1c243:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1c248:	48 89 da             	mov    %rbx,%rdx
   1c24b:	e8 40 00 00 00       	call   1c290 <hyperinterval::ieee::Format::finite>
   1c250:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1c255:	74 0c                	je     1c263 <hyperinterval::ieee::Format::affine+0x3c3>
   1c257:	4c 8b 34 24          	mov    (%rsp),%r14
   1c25b:	66 41 c7 06 01 03    	movw   $0x301,(%r14)
   1c261:	eb 15                	jmp    1c278 <hyperinterval::ieee::Format::affine+0x3d8>
   1c263:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1c268:	4c 8b 34 24          	mov    (%rsp),%r14
   1c26c:	4d 89 7e 08          	mov    %r15,0x8(%r14)
   1c270:	49 89 46 10          	mov    %rax,0x10(%r14)
   1c274:	41 c6 06 00          	movb   $0x0,(%r14)
   1c278:	4c 89 f0             	mov    %r14,%rax
   1c27b:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1c282:	5b                   	pop    %rbx
   1c283:	41 5c                	pop    %r12
   1c285:	41 5d                	pop    %r13
   1c287:	41 5e                	pop    %r14
   1c289:	41 5f                	pop    %r15
   1c28b:	5d                   	pop    %rbp
   1c28c:	c3                   	ret
   1c28d:	cc                   	int3
   1c28e:	cc                   	int3
   1c28f:	cc                   	int3

hyperinterval::ieee::Format::finite:
   1c290:	48 89 f8             	mov    %rdi,%rax
   1c293:	48 89 cf             	mov    %rcx,%rdi
   1c296:	48 f7 d7             	not    %rdi
   1c299:	48 85 fa             	test   %rdi,%rdx
   1c29c:	75 09                	jne    1c2a7 <hyperinterval::ieee::Format::finite+0x17>
   1c29e:	c6 40 01 00          	movb   $0x0,0x1(%rax)
   1c2a2:	b1 01                	mov    $0x1,%cl
   1c2a4:	88 08                	mov    %cl,(%rax)
   1c2a6:	c3                   	ret
   1c2a7:	48 ff ce             	dec    %rsi
   1c2aa:	48 85 f1             	test   %rsi,%rcx
   1c2ad:	74 09                	je     1c2b8 <hyperinterval::ieee::Format::finite+0x28>
   1c2af:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1c2b3:	31 c9                	xor    %ecx,%ecx
   1c2b5:	88 08                	mov    %cl,(%rax)
   1c2b7:	c3                   	ret
   1c2b8:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
   1c2bf:	00 
   1c2c0:	31 c9                	xor    %ecx,%ecx
   1c2c2:	88 08                	mov    %cl,(%rax)
   1c2c4:	c3                   	ret
   1c2c5:	cc                   	int3
   1c2c6:	cc                   	int3
   1c2c7:	cc                   	int3
   1c2c8:	cc                   	int3
   1c2c9:	cc                   	int3
   1c2ca:	cc                   	int3
   1c2cb:	cc                   	int3
   1c2cc:	cc                   	int3
   1c2cd:	cc                   	int3
   1c2ce:	cc                   	int3
   1c2cf:	cc                   	int3

hyperinterval::ieee::Format::rounded:
   1c2d0:	48 89 c8             	mov    %rcx,%rax
   1c2d3:	4c 8b 11             	mov    (%rcx),%r10
   1c2d6:	4c 8b 59 08          	mov    0x8(%rcx),%r11
   1c2da:	4c 89 d1             	mov    %r10,%rcx
   1c2dd:	4c 09 d9             	or     %r11,%rcx
   1c2e0:	74 79                	je     1c35b <hyperinterval::ieee::Format::rounded+0x8b>
   1c2e2:	55                   	push   %rbp
   1c2e3:	41 57                	push   %r15
   1c2e5:	41 56                	push   %r14
   1c2e7:	41 55                	push   %r13
   1c2e9:	41 54                	push   %r12
   1c2eb:	53                   	push   %rbx
   1c2ec:	8b 68 10             	mov    0x10(%rax),%ebp
   1c2ef:	49 0f bd cb          	bsr    %r11,%rcx
   1c2f3:	83 f1 3f             	xor    $0x3f,%ecx
   1c2f6:	4d 0f bd f2          	bsr    %r10,%r14
   1c2fa:	41 83 f6 3f          	xor    $0x3f,%r14d
   1c2fe:	41 83 ce 40          	or     $0x40,%r14d
   1c302:	4d 85 db             	test   %r11,%r11
   1c305:	44 0f 45 f1          	cmovne %ecx,%r14d
   1c309:	bb 40 00 00 00       	mov    $0x40,%ebx
   1c30e:	f3 48 0f bc da       	tzcnt  %rdx,%rbx
   1c313:	41 89 d8             	mov    %ebx,%r8d
   1c316:	41 83 e0 3f          	and    $0x3f,%r8d
   1c31a:	44 89 c1             	mov    %r8d,%ecx
   1c31d:	48 d3 ea             	shr    %cl,%rdx
   1c320:	41 83 f6 7f          	xor    $0x7f,%r14d
   1c324:	41 01 ee             	add    %ebp,%r14d
   1c327:	48 d1 ea             	shr    $1,%rdx
   1c32a:	41 39 d6             	cmp    %edx,%r14d
   1c32d:	0f 8f 54 01 00 00    	jg     1c487 <hyperinterval::ieee::Format::rounded+0x1b7>
   1c333:	44 8d 2c 13          	lea    (%rbx,%rdx,1),%r13d
   1c337:	b9 01 00 00 00       	mov    $0x1,%ecx
   1c33c:	44 29 e9             	sub    %r13d,%ecx
   1c33f:	41 29 de             	sub    %ebx,%r14d
   1c342:	41 39 ce             	cmp    %ecx,%r14d
   1c345:	44 0f 4e f1          	cmovle %ecx,%r14d
   1c349:	44 89 f1             	mov    %r14d,%ecx
   1c34c:	29 e9                	sub    %ebp,%ecx
   1c34e:	83 f9 7f             	cmp    $0x7f,%ecx
   1c351:	7e 13                	jle    1c366 <hyperinterval::ieee::Format::rounded+0x96>
   1c353:	41 b4 01             	mov    $0x1,%r12b
   1c356:	e9 ea 00 00 00       	jmp    1c445 <hyperinterval::ieee::Format::rounded+0x175>
   1c35b:	c6 07 00             	movb   $0x0,(%rdi)
   1c35e:	0f 57 c0             	xorps  %xmm0,%xmm0
   1c361:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1c365:	c3                   	ret
   1c366:	85 c9                	test   %ecx,%ecx
   1c368:	4c 89 6c 24 f0       	mov    %r13,-0x10(%rsp)
   1c36d:	0f 8e ad 00 00 00    	jle    1c420 <hyperinterval::ieee::Format::rounded+0x150>
   1c373:	4d 89 d7             	mov    %r10,%r15
   1c376:	4d 0f ad df          	shrd   %cl,%r11,%r15
   1c37a:	4d 89 dd             	mov    %r11,%r13
   1c37d:	49 d3 ed             	shr    %cl,%r13
   1c380:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
   1c387:	49 d3 e4             	shl    %cl,%r12
   1c38a:	48 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%rbp
   1c391:	45 31 c9             	xor    %r9d,%r9d
   1c394:	f6 c1 40             	test   $0x40,%cl
   1c397:	4d 0f 45 fd          	cmovne %r13,%r15
   1c39b:	4d 0f 45 e9          	cmovne %r9,%r13
   1c39f:	49 0f 45 ec          	cmovne %r12,%rbp
   1c3a3:	4d 0f 45 e1          	cmovne %r9,%r12
   1c3a7:	49 f7 d4             	not    %r12
   1c3aa:	48 f7 d5             	not    %rbp
   1c3ad:	4c 21 dd             	and    %r11,%rbp
   1c3b0:	4d 21 d4             	and    %r10,%r12
   1c3b3:	49 09 ec             	or     %rbp,%r12
   1c3b6:	41 0f 95 c4          	setne  %r12b
   1c3ba:	4d 89 eb             	mov    %r13,%r11
   1c3bd:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1c3c2:	4c 89 f9             	mov    %r15,%rcx
   1c3c5:	4c 09 d9             	or     %r11,%rcx
   1c3c8:	74 7b                	je     1c445 <hyperinterval::ieee::Format::rounded+0x175>
   1c3ca:	49 0f bd cb          	bsr    %r11,%rcx
   1c3ce:	83 f1 3f             	xor    $0x3f,%ecx
   1c3d1:	4d 0f bd ef          	bsr    %r15,%r13
   1c3d5:	41 83 f5 3f          	xor    $0x3f,%r13d
   1c3d9:	41 83 cd 40          	or     $0x40,%r13d
   1c3dd:	4d 85 db             	test   %r11,%r11
   1c3e0:	44 0f 45 e9          	cmovne %ecx,%r13d
   1c3e4:	41 83 f5 7f          	xor    $0x7f,%r13d
   1c3e8:	43 8d 2c 2e          	lea    (%r14,%r13,1),%ebp
   1c3ec:	39 d5                	cmp    %edx,%ebp
   1c3ee:	0f 8f 93 00 00 00    	jg     1c487 <hyperinterval::ieee::Format::rounded+0x1b7>
   1c3f4:	b9 01 00 00 00       	mov    $0x1,%ecx
   1c3f9:	29 d1                	sub    %edx,%ecx
   1c3fb:	39 cd                	cmp    %ecx,%ebp
   1c3fd:	0f 8d 53 01 00 00    	jge    1c556 <hyperinterval::ieee::Format::rounded+0x286>
   1c403:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1c408:	43 8d 0c 2e          	lea    (%r14,%r13,1),%ecx
   1c40c:	fe c9                	dec    %cl
   1c40e:	4d 89 f9             	mov    %r15,%r9
   1c411:	49 d3 e1             	shl    %cl,%r9
   1c414:	45 31 d2             	xor    %r10d,%r10d
   1c417:	f6 c1 40             	test   $0x40,%cl
   1c41a:	4d 0f 44 d1          	cmove  %r9,%r10
   1c41e:	eb 2e                	jmp    1c44e <hyperinterval::ieee::Format::rounded+0x17e>
   1c420:	f6 d9                	neg    %cl
   1c422:	4d 0f a5 d3          	shld   %cl,%r10,%r11
   1c426:	49 d3 e2             	shl    %cl,%r10
   1c429:	45 31 e4             	xor    %r12d,%r12d
   1c42c:	f6 c1 40             	test   $0x40,%cl
   1c42f:	4d 0f 45 da          	cmovne %r10,%r11
   1c433:	41 bf 00 00 00 00    	mov    $0x0,%r15d
   1c439:	4d 0f 44 fa          	cmove  %r10,%r15
   1c43d:	4c 89 f9             	mov    %r15,%rcx
   1c440:	4c 09 d9             	or     %r11,%rcx
   1c443:	75 85                	jne    1c3ca <hyperinterval::ieee::Format::rounded+0xfa>
   1c445:	45 31 ff             	xor    %r15d,%r15d
   1c448:	45 31 db             	xor    %r11d,%r11d
   1c44b:	45 31 d2             	xor    %r10d,%r10d
   1c44e:	45 0f b6 e4          	movzbl %r12b,%r12d
   1c452:	4d 01 fc             	add    %r15,%r12
   1c455:	49 83 d3 00          	adc    $0x0,%r11
   1c459:	4c 89 e1             	mov    %r12,%rcx
   1c45c:	4c 09 d9             	or     %r11,%rcx
   1c45f:	74 30                	je     1c491 <hyperinterval::ieee::Format::rounded+0x1c1>
   1c461:	49 0f bd cb          	bsr    %r11,%rcx
   1c465:	83 f1 3f             	xor    $0x3f,%ecx
   1c468:	4d 0f bd fc          	bsr    %r12,%r15
   1c46c:	41 83 f7 3f          	xor    $0x3f,%r15d
   1c470:	41 83 cf 40          	or     $0x40,%r15d
   1c474:	4d 85 db             	test   %r11,%r11
   1c477:	44 0f 45 f9          	cmovne %ecx,%r15d
   1c47b:	41 83 f7 7f          	xor    $0x7f,%r15d
   1c47f:	43 8d 2c 37          	lea    (%r15,%r14,1),%ebp
   1c483:	39 d5                	cmp    %edx,%ebp
   1c485:	7e 1b                	jle    1c4a2 <hyperinterval::ieee::Format::rounded+0x1d2>
   1c487:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   1c48c:	e9 ba 00 00 00       	jmp    1c54b <hyperinterval::ieee::Format::rounded+0x27b>
   1c491:	31 d2                	xor    %edx,%edx
   1c493:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1c497:	0f 84 86 00 00 00    	je     1c523 <hyperinterval::ieee::Format::rounded+0x253>
   1c49d:	e9 9e 00 00 00       	jmp    1c540 <hyperinterval::ieee::Format::rounded+0x270>
   1c4a2:	b9 01 00 00 00       	mov    $0x1,%ecx
   1c4a7:	29 d1                	sub    %edx,%ecx
   1c4a9:	39 cd                	cmp    %ecx,%ebp
   1c4ab:	7d 1e                	jge    1c4cb <hyperinterval::ieee::Format::rounded+0x1fb>
   1c4ad:	45 01 f5             	add    %r14d,%r13d
   1c4b0:	41 fe cd             	dec    %r13b
   1c4b3:	44 89 e9             	mov    %r13d,%ecx
   1c4b6:	49 d3 e4             	shl    %cl,%r12
   1c4b9:	31 d2                	xor    %edx,%edx
   1c4bb:	41 f6 c5 40          	test   $0x40,%r13b
   1c4bf:	49 0f 44 d4          	cmove  %r12,%rdx
   1c4c3:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1c4c7:	74 5a                	je     1c523 <hyperinterval::ieee::Format::rounded+0x253>
   1c4c9:	eb 75                	jmp    1c540 <hyperinterval::ieee::Format::rounded+0x270>
   1c4cb:	89 d9                	mov    %ebx,%ecx
   1c4cd:	44 29 f9             	sub    %r15d,%ecx
   1c4d0:	41 89 c9             	mov    %ecx,%r9d
   1c4d3:	41 f7 d9             	neg    %r9d
   1c4d6:	4d 89 e6             	mov    %r12,%r14
   1c4d9:	49 d3 e6             	shl    %cl,%r14
   1c4dc:	45 31 ed             	xor    %r13d,%r13d
   1c4df:	f6 c1 40             	test   $0x40,%cl
   1c4e2:	4d 0f 44 ee          	cmove  %r14,%r13
   1c4e6:	44 89 c9             	mov    %r9d,%ecx
   1c4e9:	4d 0f ad dc          	shrd   %cl,%r11,%r12
   1c4ed:	49 d3 eb             	shr    %cl,%r11
   1c4f0:	41 f6 c1 40          	test   $0x40,%r9b
   1c4f4:	4d 0f 44 dc          	cmove  %r12,%r11
   1c4f8:	44 39 fb             	cmp    %r15d,%ebx
   1c4fb:	4d 0f 43 dd          	cmovae %r13,%r11
   1c4ff:	01 d5                	add    %edx,%ebp
   1c501:	4c 63 cd             	movslq %ebp,%r9
   1c504:	44 89 c1             	mov    %r8d,%ecx
   1c507:	49 d3 e1             	shl    %cl,%r9
   1c50a:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
   1c511:	48 d3 e2             	shl    %cl,%rdx
   1c514:	48 f7 d2             	not    %rdx
   1c517:	4c 21 da             	and    %r11,%rdx
   1c51a:	4c 09 ca             	or     %r9,%rdx
   1c51d:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1c521:	75 1d                	jne    1c540 <hyperinterval::ieee::Format::rounded+0x270>
   1c523:	48 89 d0             	mov    %rdx,%rax
   1c526:	48 31 f0             	xor    %rsi,%rax
   1c529:	48 85 d2             	test   %rdx,%rdx
   1c52c:	48 0f 44 c2          	cmove  %rdx,%rax
   1c530:	4c 31 d6             	xor    %r10,%rsi
   1c533:	4d 85 d2             	test   %r10,%r10
   1c536:	49 0f 44 f2          	cmove  %r10,%rsi
   1c53a:	49 89 c2             	mov    %rax,%r10
   1c53d:	48 89 f2             	mov    %rsi,%rdx
   1c540:	4c 89 57 08          	mov    %r10,0x8(%rdi)
   1c544:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   1c548:	c6 07 00             	movb   $0x0,(%rdi)
   1c54b:	5b                   	pop    %rbx
   1c54c:	41 5c                	pop    %r12
   1c54e:	41 5d                	pop    %r13
   1c550:	41 5e                	pop    %r14
   1c552:	41 5f                	pop    %r15
   1c554:	5d                   	pop    %rbp
   1c555:	c3                   	ret
   1c556:	89 d9                	mov    %ebx,%ecx
   1c558:	44 29 e9             	sub    %r13d,%ecx
   1c55b:	4d 89 f9             	mov    %r15,%r9
   1c55e:	49 d3 e1             	shl    %cl,%r9
   1c561:	41 89 ca             	mov    %ecx,%r10d
   1c564:	41 f7 da             	neg    %r10d
   1c567:	48 c7 44 24 e8 00 00 	movq   $0x0,-0x18(%rsp)
   1c56e:	00 00 
   1c570:	f6 c1 40             	test   $0x40,%cl
   1c573:	48 8b 4c 24 e8       	mov    -0x18(%rsp),%rcx
   1c578:	49 0f 44 c9          	cmove  %r9,%rcx
   1c57c:	48 89 4c 24 e8       	mov    %rcx,-0x18(%rsp)
   1c581:	4d 89 f9             	mov    %r15,%r9
   1c584:	44 89 d1             	mov    %r10d,%ecx
   1c587:	4d 0f ad d9          	shrd   %cl,%r11,%r9
   1c58b:	4c 89 4c 24 f8       	mov    %r9,-0x8(%rsp)
   1c590:	4d 89 d9             	mov    %r11,%r9
   1c593:	49 d3 e9             	shr    %cl,%r9
   1c596:	41 f6 c2 40          	test   $0x40,%r10b
   1c59a:	4c 0f 44 4c 24 f8    	cmove  -0x8(%rsp),%r9
   1c5a0:	44 39 eb             	cmp    %r13d,%ebx
   1c5a3:	4c 0f 43 4c 24 e8    	cmovae -0x18(%rsp),%r9
   1c5a9:	01 d5                	add    %edx,%ebp
   1c5ab:	4c 63 ed             	movslq %ebp,%r13
   1c5ae:	44 89 c1             	mov    %r8d,%ecx
   1c5b1:	49 d3 e5             	shl    %cl,%r13
   1c5b4:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
   1c5bb:	49 d3 e2             	shl    %cl,%r10
   1c5be:	49 f7 d2             	not    %r10
   1c5c1:	4d 21 ca             	and    %r9,%r10
   1c5c4:	4d 09 ea             	or     %r13,%r10
   1c5c7:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1c5cc:	e9 7d fe ff ff       	jmp    1c44e <hyperinterval::ieee::Format::rounded+0x17e>
   1c5d1:	cc                   	int3
   1c5d2:	cc                   	int3
   1c5d3:	cc                   	int3
   1c5d4:	cc                   	int3
   1c5d5:	cc                   	int3
   1c5d6:	cc                   	int3
   1c5d7:	cc                   	int3
   1c5d8:	cc                   	int3
   1c5d9:	cc                   	int3
   1c5da:	cc                   	int3
   1c5db:	cc                   	int3
   1c5dc:	cc                   	int3
   1c5dd:	cc                   	int3
   1c5de:	cc                   	int3
   1c5df:	cc                   	int3

hyperinterval::bounds::Bounds<T>::hull:
   1c670:	53                   	push   %rbx
   1c671:	49 89 d0             	mov    %rdx,%r8
   1c674:	48 89 f2             	mov    %rsi,%rdx
   1c677:	48 89 f8             	mov    %rdi,%rax
   1c67a:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1c681:	00 00 80 
   1c684:	49 89 f9             	mov    %rdi,%r9
   1c687:	49 09 f1             	or     %rsi,%r9
   1c68a:	48 8d 7e ff          	lea    -0x1(%rsi),%rdi
   1c68e:	49 89 c2             	mov    %rax,%r10
   1c691:	49 21 fa             	and    %rdi,%r10
   1c694:	49 89 f3             	mov    %rsi,%r11
   1c697:	4d 29 d3             	sub    %r10,%r11
   1c69a:	48 85 c0             	test   %rax,%rax
   1c69d:	4d 0f 49 d9          	cmovns %r9,%r11
   1c6a1:	4d 89 c1             	mov    %r8,%r9
   1c6a4:	49 09 f1             	or     %rsi,%r9
   1c6a7:	4d 89 c2             	mov    %r8,%r10
   1c6aa:	49 21 fa             	and    %rdi,%r10
   1c6ad:	48 89 f3             	mov    %rsi,%rbx
   1c6b0:	4c 29 d3             	sub    %r10,%rbx
   1c6b3:	4d 85 c0             	test   %r8,%r8
   1c6b6:	49 0f 49 d9          	cmovns %r9,%rbx
   1c6ba:	49 39 db             	cmp    %rbx,%r11
   1c6bd:	49 0f 47 c0          	cmova  %r8,%rax
   1c6c1:	49 89 d0             	mov    %rdx,%r8
   1c6c4:	49 09 f0             	or     %rsi,%r8
   1c6c7:	49 89 d1             	mov    %rdx,%r9
   1c6ca:	49 21 f9             	and    %rdi,%r9
   1c6cd:	49 89 f2             	mov    %rsi,%r10
   1c6d0:	4d 29 ca             	sub    %r9,%r10
   1c6d3:	48 85 d2             	test   %rdx,%rdx
   1c6d6:	4d 0f 49 d0          	cmovns %r8,%r10
   1c6da:	49 89 c8             	mov    %rcx,%r8
   1c6dd:	49 09 f0             	or     %rsi,%r8
   1c6e0:	48 21 cf             	and    %rcx,%rdi
   1c6e3:	48 29 fe             	sub    %rdi,%rsi
   1c6e6:	48 85 c9             	test   %rcx,%rcx
   1c6e9:	49 0f 49 f0          	cmovns %r8,%rsi
   1c6ed:	49 39 f2             	cmp    %rsi,%r10
   1c6f0:	48 0f 42 d1          	cmovb  %rcx,%rdx
   1c6f4:	5b                   	pop    %rbx
   1c6f5:	c3                   	ret
   1c6f6:	cc                   	int3
   1c6f7:	cc                   	int3
   1c6f8:	cc                   	int3
   1c6f9:	cc                   	int3
   1c6fa:	cc                   	int3
   1c6fb:	cc                   	int3
   1c6fc:	cc                   	int3
   1c6fd:	cc                   	int3
   1c6fe:	cc                   	int3
   1c6ff:	cc                   	int3

hyperinterval::bounds::Bounds<T>::signs:
   1c790:	89 f9                	mov    %edi,%ecx
   1c792:	41 89 d0             	mov    %edx,%r8d
   1c795:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1c79a:	49 89 c9             	mov    %rcx,%r9
   1c79d:	49 09 c1             	or     %rax,%r9
   1c7a0:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1c7a6:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1c7ac:	49 29 ca             	sub    %rcx,%r10
   1c7af:	85 ff                	test   %edi,%edi
   1c7b1:	4d 0f 49 d1          	cmovns %r9,%r10
   1c7b5:	4c 89 c7             	mov    %r8,%rdi
   1c7b8:	48 09 c7             	or     %rax,%rdi
   1c7bb:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1c7c2:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   1c7c7:	4c 29 c1             	sub    %r8,%rcx
   1c7ca:	85 d2                	test   %edx,%edx
   1c7cc:	48 0f 49 cf          	cmovns %rdi,%rcx
   1c7d0:	89 f7                	mov    %esi,%edi
   1c7d2:	48 89 fa             	mov    %rdi,%rdx
   1c7d5:	48 09 c2             	or     %rax,%rdx
   1c7d8:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1c7de:	48 29 f8             	sub    %rdi,%rax
   1c7e1:	45 31 c0             	xor    %r8d,%r8d
   1c7e4:	49 39 ca             	cmp    %rcx,%r10
   1c7e7:	40 0f 92 c7          	setb   %dil
   1c7eb:	77 1e                	ja     1c80b <hyperinterval::bounds::Bounds<T>::signs+0x7b>
   1c7ed:	85 f6                	test   %esi,%esi
   1c7ef:	49 89 d1             	mov    %rdx,%r9
   1c7f2:	4c 0f 48 c8          	cmovs  %rax,%r9
   1c7f6:	44 8d 57 02          	lea    0x2(%rdi),%r10d
   1c7fa:	4c 39 c9             	cmp    %r9,%rcx
   1c7fd:	45 0f b6 ca          	movzbl %r10b,%r9d
   1c801:	41 88 f8             	mov    %dil,%r8b
   1c804:	45 0f 46 c1          	cmovbe %r9d,%r8d
   1c808:	44 89 c7             	mov    %r8d,%edi
   1c80b:	85 f6                	test   %esi,%esi
   1c80d:	48 0f 48 d0          	cmovs  %rax,%rdx
   1c811:	8d 47 04             	lea    0x4(%rdi),%eax
   1c814:	39 ca                	cmp    %ecx,%edx
   1c816:	40 0f b6 cf          	movzbl %dil,%ecx
   1c81a:	0f b6 c0             	movzbl %al,%eax
   1c81d:	0f 46 c1             	cmovbe %ecx,%eax
   1c820:	c3                   	ret
   1c821:	cc                   	int3
   1c822:	cc                   	int3
   1c823:	cc                   	int3
   1c824:	cc                   	int3
   1c825:	cc                   	int3
   1c826:	cc                   	int3
   1c827:	cc                   	int3
   1c828:	cc                   	int3
   1c829:	cc                   	int3
   1c82a:	cc                   	int3
   1c82b:	cc                   	int3
   1c82c:	cc                   	int3
   1c82d:	cc                   	int3
   1c82e:	cc                   	int3
   1c82f:	cc                   	int3

__udivti3:
   5b020:	49 89 d0             	mov    %rdx,%r8
   5b023:	48 85 c9             	test   %rcx,%rcx
   5b026:	74 71                	je     5b099 <__udivti3+0x79>
   5b028:	4c 0f bd c9          	bsr    %rcx,%r9
   5b02c:	44 89 ca             	mov    %r9d,%edx
   5b02f:	83 f2 3f             	xor    $0x3f,%edx
   5b032:	b0 40                	mov    $0x40,%al
   5b034:	28 d0                	sub    %dl,%al
   5b036:	4c 89 c2             	mov    %r8,%rdx
   5b039:	49 89 cb             	mov    %rcx,%r11
   5b03c:	89 c1                	mov    %eax,%ecx
   5b03e:	4c 0f ad da          	shrd   %cl,%r11,%rdx
   5b042:	4d 89 da             	mov    %r11,%r10
   5b045:	49 d3 ea             	shr    %cl,%r10
   5b048:	a8 40                	test   $0x40,%al
   5b04a:	4c 0f 44 d2          	cmove  %rdx,%r10
   5b04e:	48 89 f0             	mov    %rsi,%rax
   5b051:	48 0f a4 f8 3f       	shld   $0x3f,%rdi,%rax
   5b056:	48 89 f2             	mov    %rsi,%rdx
   5b059:	48 d1 ea             	shr    $1,%rdx
   5b05c:	49 f7 f2             	div    %r10
   5b05f:	49 89 c2             	mov    %rax,%r10
   5b062:	44 89 c9             	mov    %r9d,%ecx
   5b065:	49 d3 ea             	shr    %cl,%r10
   5b068:	49 83 fa 01          	cmp    $0x1,%r10
   5b06c:	49 83 d2 ff          	adc    $0xffffffffffffffff,%r10
   5b070:	4d 89 d9             	mov    %r11,%r9
   5b073:	4d 0f af ca          	imul   %r10,%r9
   5b077:	4c 89 c0             	mov    %r8,%rax
   5b07a:	49 f7 e2             	mul    %r10
   5b07d:	48 89 c1             	mov    %rax,%rcx
   5b080:	4c 89 d0             	mov    %r10,%rax
   5b083:	4c 01 ca             	add    %r9,%rdx
   5b086:	48 29 cf             	sub    %rcx,%rdi
   5b089:	48 19 d6             	sbb    %rdx,%rsi
   5b08c:	4c 39 c7             	cmp    %r8,%rdi
   5b08f:	4c 19 de             	sbb    %r11,%rsi
   5b092:	48 83 d8 ff          	sbb    $0xffffffffffffffff,%rax
   5b096:	31 d2                	xor    %edx,%edx
   5b098:	c3                   	ret
   5b099:	4c 39 c6             	cmp    %r8,%rsi
   5b09c:	73 0c                	jae    5b0aa <__udivti3+0x8a>
   5b09e:	48 89 f8             	mov    %rdi,%rax
   5b0a1:	48 89 f2             	mov    %rsi,%rdx
   5b0a4:	49 f7 f0             	div    %r8
   5b0a7:	31 d2                	xor    %edx,%edx
   5b0a9:	c3                   	ret
   5b0aa:	48 89 f0             	mov    %rsi,%rax
   5b0ad:	4c 09 c0             	or     %r8,%rax
   5b0b0:	48 c1 e8 20          	shr    $0x20,%rax
   5b0b4:	74 15                	je     5b0cb <__udivti3+0xab>
   5b0b6:	48 89 f0             	mov    %rsi,%rax
   5b0b9:	31 d2                	xor    %edx,%edx
   5b0bb:	49 f7 f0             	div    %r8
   5b0be:	48 89 c1             	mov    %rax,%rcx
   5b0c1:	48 89 f8             	mov    %rdi,%rax
   5b0c4:	49 f7 f0             	div    %r8
   5b0c7:	48 89 ca             	mov    %rcx,%rdx
   5b0ca:	c3                   	ret
   5b0cb:	89 f0                	mov    %esi,%eax
   5b0cd:	31 d2                	xor    %edx,%edx
   5b0cf:	41 f7 f0             	div    %r8d
   5b0d2:	89 c1                	mov    %eax,%ecx
   5b0d4:	48 89 f8             	mov    %rdi,%rax
   5b0d7:	49 f7 f0             	div    %r8
   5b0da:	48 89 ca             	mov    %rcx,%rdx
   5b0dd:	c3                   	ret

Disassembly of section .init:
