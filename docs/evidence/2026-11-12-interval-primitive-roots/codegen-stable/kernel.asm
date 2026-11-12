<hyperinterval::float::F64Enclosure>::abs:
   17b20:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   17b24:	75 33                	jne    17b59 <<hyperinterval::float::F64Enclosure>::abs+0x39>
   17b26:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   17b2a:	48 ba ff ff ff ff ff 	movabs $0x7fffffffffffffff,%rdx
   17b31:	ff ff 7f 
   17b34:	48 85 c9             	test   %rcx,%rcx
   17b37:	41 0f 99 c0          	setns  %r8b
   17b3b:	48 89 c8             	mov    %rcx,%rax
   17b3e:	48 21 d0             	and    %rdx,%rax
   17b41:	41 0f 94 c1          	sete   %r9b
   17b45:	45 08 c1             	or     %r8b,%r9b
   17b48:	74 17                	je     17b61 <<hyperinterval::float::F64Enclosure>::abs+0x41>
   17b4a:	48 8b 46 10          	mov    0x10(%rsi),%rax
   17b4e:	48 89 47 10          	mov    %rax,0x10(%rdi)
   17b52:	0f 10 06             	movups (%rsi),%xmm0
   17b55:	0f 11 07             	movups %xmm0,(%rdi)
   17b58:	c3                   	ret
   17b59:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
   17b60:	c3                   	ret
   17b61:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   17b65:	48 85 f6             	test   %rsi,%rsi
   17b68:	41 0f 98 c1          	sets   %r9b
   17b6c:	49 89 f0             	mov    %rsi,%r8
   17b6f:	49 21 d0             	and    %rdx,%r8
   17b72:	41 0f 95 c2          	setne  %r10b
   17b76:	45 84 d1             	test   %r10b,%r9b
   17b79:	74 10                	je     17b8b <<hyperinterval::float::F64Enclosure>::abs+0x6b>
   17b7b:	48 c7 07 01 00 00 00 	movq   $0x1,(%rdi)
   17b82:	4c 89 47 08          	mov    %r8,0x8(%rdi)
   17b86:	48 89 47 10          	mov    %rax,0x10(%rdi)
   17b8a:	c3                   	ret
   17b8b:	49 f7 d8             	neg    %r8
   17b8e:	48 85 f6             	test   %rsi,%rsi
   17b91:	4c 8d 4c 16 01       	lea    0x1(%rsi,%rdx,1),%r9
   17b96:	4a 8d 54 02 01       	lea    0x1(%rdx,%r8,1),%rdx
   17b9b:	49 0f 49 d1          	cmovns %r9,%rdx
   17b9f:	48 39 d1             	cmp    %rdx,%rcx
   17ba2:	48 0f 46 c6          	cmovbe %rsi,%rax
   17ba6:	48 c7 07 01 00 00 00 	movq   $0x1,(%rdi)
   17bad:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
   17bb4:	00 
   17bb5:	48 89 47 10          	mov    %rax,0x10(%rdi)
   17bb9:	c3                   	ret
   17bba:	cc                   	int3
   17bbb:	cc                   	int3
   17bbc:	cc                   	int3
   17bbd:	cc                   	int3
   17bbe:	cc                   	int3
   17bbf:	cc                   	int3

hyperinterval_strict_chain32:
   17bf0:	53                   	push   %rbx
   17bf1:	48 83 ec 60          	sub    $0x60,%rsp
   17bf5:	48 89 fb             	mov    %rdi,%rbx
   17bf8:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   17bfd:	ff 15 05 5a 04 00    	call   *0x45a05(%rip)        # 5d608 <_DYNAMIC+0x2b0>
   17c03:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   17c07:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   17c0c:	83 f9 02             	cmp    $0x2,%ecx
   17c0f:	0f 84 f4 00 00 00    	je     17d09 <hyperinterval_strict_chain32+0x119>
   17c15:	8b 54 24 11          	mov    0x11(%rsp),%edx
   17c19:	8b 74 24 14          	mov    0x14(%rsp),%esi
   17c1d:	89 74 24 5c          	mov    %esi,0x5c(%rsp)
   17c21:	89 54 24 59          	mov    %edx,0x59(%rsp)
   17c25:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
   17c29:	88 44 24 58          	mov    %al,0x58(%rsp)
   17c2d:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   17c32:	48 8d 74 24 54       	lea    0x54(%rsp),%rsi
   17c37:	f3 0f 10 05 e9 df fe 	movss  -0x12017(%rip),%xmm0        # 5c28 <__abi_tag+0x592c>
   17c3e:	ff 
   17c3f:	f3 0f 10 0d d9 df fe 	movss  -0x12027(%rip),%xmm1        # 5c20 <__abi_tag+0x5924>
   17c46:	ff 
   17c47:	ff 15 c3 59 04 00    	call   *0x459c3(%rip)        # 5d610 <_DYNAMIC+0x2b8>
   17c4d:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
   17c51:	0f b6 44 24 1c       	movzbl 0x1c(%rsp),%eax
   17c56:	83 f9 02             	cmp    $0x2,%ecx
   17c59:	0f 84 aa 00 00 00    	je     17d09 <hyperinterval_strict_chain32+0x119>
   17c5f:	8b 54 24 1d          	mov    0x1d(%rsp),%edx
   17c63:	8b 74 24 20          	mov    0x20(%rsp),%esi
   17c67:	89 74 24 50          	mov    %esi,0x50(%rsp)
   17c6b:	89 54 24 4d          	mov    %edx,0x4d(%rsp)
   17c6f:	89 4c 24 48          	mov    %ecx,0x48(%rsp)
   17c73:	88 44 24 4c          	mov    %al,0x4c(%rsp)
   17c77:	48 8d 7c 24 3c       	lea    0x3c(%rsp),%rdi
   17c7c:	48 8d 74 24 48       	lea    0x48(%rsp),%rsi
   17c81:	ff 15 91 59 04 00    	call   *0x45991(%rip)        # 5d618 <_DYNAMIC+0x2c0>
   17c87:	8b 4c 24 3c          	mov    0x3c(%rsp),%ecx
   17c8b:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   17c90:	83 f9 02             	cmp    $0x2,%ecx
   17c93:	74 74                	je     17d09 <hyperinterval_strict_chain32+0x119>
   17c95:	8b 54 24 41          	mov    0x41(%rsp),%edx
   17c99:	8b 74 24 44          	mov    0x44(%rsp),%esi
   17c9d:	89 74 24 38          	mov    %esi,0x38(%rsp)
   17ca1:	89 54 24 35          	mov    %edx,0x35(%rsp)
   17ca5:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   17ca9:	88 44 24 34          	mov    %al,0x34(%rsp)
   17cad:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   17cb2:	f3 0f 10 05 3a df fe 	movss  -0x120c6(%rip),%xmm0        # 5bf4 <__abi_tag+0x58f8>
   17cb9:	ff 
   17cba:	ff 15 60 59 04 00    	call   *0x45960(%rip)        # 5d620 <_DYNAMIC+0x2c8>
   17cc0:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   17cc4:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   17cc9:	83 f9 02             	cmp    $0x2,%ecx
   17ccc:	74 3b                	je     17d09 <hyperinterval_strict_chain32+0x119>
   17cce:	8b 54 24 11          	mov    0x11(%rsp),%edx
   17cd2:	8b 74 24 14          	mov    0x14(%rsp),%esi
   17cd6:	89 74 24 20          	mov    %esi,0x20(%rsp)
   17cda:	89 54 24 1d          	mov    %edx,0x1d(%rsp)
   17cde:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
   17ce2:	88 44 24 1c          	mov    %al,0x1c(%rsp)
   17ce6:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
   17ceb:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   17cf0:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
   17cf5:	ff 15 2d 59 04 00    	call   *0x4592d(%rip)        # 5d628 <_DYNAMIC+0x2d0>
   17cfb:	8b 4c 24 24          	mov    0x24(%rsp),%ecx
   17cff:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   17d04:	83 f9 02             	cmp    $0x2,%ecx
   17d07:	75 12                	jne    17d1b <hyperinterval_strict_chain32+0x12b>
   17d09:	88 43 04             	mov    %al,0x4(%rbx)
   17d0c:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17d12:	48 89 d8             	mov    %rbx,%rax
   17d15:	48 83 c4 60          	add    $0x60,%rsp
   17d19:	5b                   	pop    %rbx
   17d1a:	c3                   	ret
   17d1b:	8b 54 24 29          	mov    0x29(%rsp),%edx
   17d1f:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
   17d23:	89 74 24 14          	mov    %esi,0x14(%rsp)
   17d27:	89 54 24 11          	mov    %edx,0x11(%rsp)
   17d2b:	89 4c 24 0c          	mov    %ecx,0xc(%rsp)
   17d2f:	88 44 24 10          	mov    %al,0x10(%rsp)
   17d33:	48 8d 74 24 0c       	lea    0xc(%rsp),%rsi
   17d38:	48 89 df             	mov    %rbx,%rdi
   17d3b:	ff 15 ef 58 04 00    	call   *0x458ef(%rip)        # 5d630 <_DYNAMIC+0x2d8>
   17d41:	48 89 d8             	mov    %rbx,%rax
   17d44:	48 83 c4 60          	add    $0x60,%rsp
   17d48:	5b                   	pop    %rbx
   17d49:	c3                   	ret
   17d4a:	cc                   	int3
   17d4b:	cc                   	int3
   17d4c:	cc                   	int3
   17d4d:	cc                   	int3
   17d4e:	cc                   	int3
   17d4f:	cc                   	int3

hyperinterval_strict_chain64:
   17d50:	53                   	push   %rbx
   17d51:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
   17d58:	48 89 fb             	mov    %rdi,%rbx
   17d5b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17d60:	ff 15 d2 58 04 00    	call   *0x458d2(%rip)        # 5d638 <_DYNAMIC+0x2e0>
   17d66:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   17d6b:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   17d70:	48 83 f9 02          	cmp    $0x2,%rcx
   17d74:	0f 84 32 01 00 00    	je     17eac <hyperinterval_strict_chain64+0x15c>
   17d7a:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   17d7f:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   17d84:	48 89 b4 24 a8 00 00 	mov    %rsi,0xa8(%rsp)
   17d8b:	00 
   17d8c:	48 89 94 24 a1 00 00 	mov    %rdx,0xa1(%rsp)
   17d93:	00 
   17d94:	48 89 8c 24 98 00 00 	mov    %rcx,0x98(%rsp)
   17d9b:	00 
   17d9c:	88 84 24 a0 00 00 00 	mov    %al,0xa0(%rsp)
   17da3:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   17da8:	48 8d b4 24 98 00 00 	lea    0x98(%rsp),%rsi
   17daf:	00 
   17db0:	f2 0f 10 05 f8 dd fe 	movsd  -0x12208(%rip),%xmm0        # 5bb0 <__abi_tag+0x58b4>
   17db7:	ff 
   17db8:	f2 0f 10 0d 00 de fe 	movsd  -0x12200(%rip),%xmm1        # 5bc0 <__abi_tag+0x58c4>
   17dbf:	ff 
   17dc0:	ff 15 7a 58 04 00    	call   *0x4587a(%rip)        # 5d640 <_DYNAMIC+0x2e8>
   17dc6:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   17dcb:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   17dd0:	48 83 f9 02          	cmp    $0x2,%rcx
   17dd4:	0f 84 d2 00 00 00    	je     17eac <hyperinterval_strict_chain64+0x15c>
   17dda:	48 8b 54 24 29       	mov    0x29(%rsp),%rdx
   17ddf:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   17de4:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
   17deb:	00 
   17dec:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
   17df3:	00 
   17df4:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
   17dfb:	00 
   17dfc:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
   17e03:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
   17e08:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   17e0f:	00 
   17e10:	ff 15 32 58 04 00    	call   *0x45832(%rip)        # 5d648 <_DYNAMIC+0x2f0>
   17e16:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
   17e1b:	0f b6 44 24 70       	movzbl 0x70(%rsp),%eax
   17e20:	48 83 f9 02          	cmp    $0x2,%rcx
   17e24:	0f 84 82 00 00 00    	je     17eac <hyperinterval_strict_chain64+0x15c>
   17e2a:	48 8b 54 24 71       	mov    0x71(%rsp),%rdx
   17e2f:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
   17e34:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   17e39:	48 89 54 24 59       	mov    %rdx,0x59(%rsp)
   17e3e:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
   17e43:	88 44 24 58          	mov    %al,0x58(%rsp)
   17e47:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17e4c:	f2 0f 10 05 4c dd fe 	movsd  -0x122b4(%rip),%xmm0        # 5ba0 <__abi_tag+0x58a4>
   17e53:	ff 
   17e54:	ff 15 f6 57 04 00    	call   *0x457f6(%rip)        # 5d650 <_DYNAMIC+0x2f8>
   17e5a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   17e5f:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   17e64:	48 83 f9 02          	cmp    $0x2,%rcx
   17e68:	74 42                	je     17eac <hyperinterval_strict_chain64+0x15c>
   17e6a:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   17e6f:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   17e74:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   17e79:	48 89 54 24 29       	mov    %rdx,0x29(%rsp)
   17e7e:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   17e83:	88 44 24 28          	mov    %al,0x28(%rsp)
   17e87:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   17e8c:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   17e91:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
   17e96:	ff 15 bc 57 04 00    	call   *0x457bc(%rip)        # 5d658 <_DYNAMIC+0x300>
   17e9c:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   17ea1:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   17ea6:	48 83 f9 02          	cmp    $0x2,%rcx
   17eaa:	75 16                	jne    17ec2 <hyperinterval_strict_chain64+0x172>
   17eac:	88 43 08             	mov    %al,0x8(%rbx)
   17eaf:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   17eb6:	48 89 d8             	mov    %rbx,%rax
   17eb9:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   17ec0:	5b                   	pop    %rbx
   17ec1:	c3                   	ret
   17ec2:	48 8b 54 24 41       	mov    0x41(%rsp),%rdx
   17ec7:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
   17ecc:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
   17ed1:	48 89 54 24 11       	mov    %rdx,0x11(%rsp)
   17ed6:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   17edb:	88 44 24 10          	mov    %al,0x10(%rsp)
   17edf:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
   17ee4:	48 89 df             	mov    %rbx,%rdi
   17ee7:	ff 15 73 57 04 00    	call   *0x45773(%rip)        # 5d660 <_DYNAMIC+0x308>
   17eed:	48 89 d8             	mov    %rbx,%rax
   17ef0:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   17ef7:	5b                   	pop    %rbx
   17ef8:	c3                   	ret
   17ef9:	cc                   	int3
   17efa:	cc                   	int3
   17efb:	cc                   	int3
   17efc:	cc                   	int3
   17efd:	cc                   	int3
   17efe:	cc                   	int3
   17eff:	cc                   	int3

hyperinterval_strict_sqrt32:
   17f00:	53                   	push   %rbx
   17f01:	48 83 ec 20          	sub    $0x20,%rsp
   17f05:	48 89 fb             	mov    %rdi,%rbx
   17f08:	48 8d 7c 24 14       	lea    0x14(%rsp),%rdi
   17f0d:	ff 15 f5 56 04 00    	call   *0x456f5(%rip)        # 5d608 <_DYNAMIC+0x2b0>
   17f13:	8b 4c 24 14          	mov    0x14(%rsp),%ecx
   17f17:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17f1c:	83 f9 02             	cmp    $0x2,%ecx
   17f1f:	75 12                	jne    17f33 <hyperinterval_strict_sqrt32+0x33>
   17f21:	88 43 04             	mov    %al,0x4(%rbx)
   17f24:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17f2a:	48 89 d8             	mov    %rbx,%rax
   17f2d:	48 83 c4 20          	add    $0x20,%rsp
   17f31:	5b                   	pop    %rbx
   17f32:	c3                   	ret
   17f33:	8b 54 24 19          	mov    0x19(%rsp),%edx
   17f37:	8b 74 24 1c          	mov    0x1c(%rsp),%esi
   17f3b:	89 74 24 10          	mov    %esi,0x10(%rsp)
   17f3f:	89 54 24 0d          	mov    %edx,0xd(%rsp)
   17f43:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
   17f47:	88 44 24 0c          	mov    %al,0xc(%rsp)
   17f4b:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
   17f50:	48 89 df             	mov    %rbx,%rdi
   17f53:	ff 15 0f 57 04 00    	call   *0x4570f(%rip)        # 5d668 <_DYNAMIC+0x310>
   17f59:	48 89 d8             	mov    %rbx,%rax
   17f5c:	48 83 c4 20          	add    $0x20,%rsp
   17f60:	5b                   	pop    %rbx
   17f61:	c3                   	ret
   17f62:	cc                   	int3
   17f63:	cc                   	int3
   17f64:	cc                   	int3
   17f65:	cc                   	int3
   17f66:	cc                   	int3
   17f67:	cc                   	int3
   17f68:	cc                   	int3
   17f69:	cc                   	int3
   17f6a:	cc                   	int3
   17f6b:	cc                   	int3
   17f6c:	cc                   	int3
   17f6d:	cc                   	int3
   17f6e:	cc                   	int3
   17f6f:	cc                   	int3

hyperinterval_strict_sqrt64:
   17f70:	53                   	push   %rbx
   17f71:	48 83 ec 30          	sub    $0x30,%rsp
   17f75:	48 89 fb             	mov    %rdi,%rbx
   17f78:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   17f7d:	ff 15 b5 56 04 00    	call   *0x456b5(%rip)        # 5d638 <_DYNAMIC+0x2e0>
   17f83:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   17f88:	0f b6 44 24 20       	movzbl 0x20(%rsp),%eax
   17f8d:	48 83 f9 02          	cmp    $0x2,%rcx
   17f91:	75 13                	jne    17fa6 <hyperinterval_strict_sqrt64+0x36>
   17f93:	88 43 08             	mov    %al,0x8(%rbx)
   17f96:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   17f9d:	48 89 d8             	mov    %rbx,%rax
   17fa0:	48 83 c4 30          	add    $0x30,%rsp
   17fa4:	5b                   	pop    %rbx
   17fa5:	c3                   	ret
   17fa6:	48 8b 54 24 21       	mov    0x21(%rsp),%rdx
   17fab:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   17fb0:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
   17fb5:	48 89 54 24 09       	mov    %rdx,0x9(%rsp)
   17fba:	48 89 0c 24          	mov    %rcx,(%rsp)
   17fbe:	88 44 24 08          	mov    %al,0x8(%rsp)
   17fc2:	48 89 e6             	mov    %rsp,%rsi
   17fc5:	48 89 df             	mov    %rbx,%rdi
   17fc8:	ff 15 a2 56 04 00    	call   *0x456a2(%rip)        # 5d670 <_DYNAMIC+0x318>
   17fce:	48 89 d8             	mov    %rbx,%rax
   17fd1:	48 83 c4 30          	add    $0x30,%rsp
   17fd5:	5b                   	pop    %rbx
   17fd6:	c3                   	ret
   17fd7:	cc                   	int3
   17fd8:	cc                   	int3
   17fd9:	cc                   	int3
   17fda:	cc                   	int3
   17fdb:	cc                   	int3
   17fdc:	cc                   	int3
   17fdd:	cc                   	int3
   17fde:	cc                   	int3
   17fdf:	cc                   	int3

hyperinterval_strict_surface32:
   17fe0:	55                   	push   %rbp
   17fe1:	41 57                	push   %r15
   17fe3:	41 56                	push   %r14
   17fe5:	41 55                	push   %r13
   17fe7:	41 54                	push   %r12
   17fe9:	53                   	push   %rbx
   17fea:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
   17ff1:	89 f5                	mov    %esi,%ebp
   17ff3:	48 89 fb             	mov    %rdi,%rbx
   17ff6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17ffb:	66 0f 7e 44 24 3c    	movd   %xmm0,0x3c(%rsp)
   18001:	66 0f 7e 4c 24 2c    	movd   %xmm1,0x2c(%rsp)
   18007:	ff 15 fb 55 04 00    	call   *0x455fb(%rip)        # 5d608 <_DYNAMIC+0x2b0>
   1800d:	44 8b 6c 24 08       	mov    0x8(%rsp),%r13d
   18012:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   18017:	41 83 fd 02          	cmp    $0x2,%r13d
   1801b:	75 0e                	jne    1802b <hyperinterval_strict_surface32+0x4b>
   1801d:	88 43 04             	mov    %al,0x4(%rbx)
   18020:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18026:	e9 8a 00 00 00       	jmp    180b5 <hyperinterval_strict_surface32+0xd5>
   1802b:	49 89 df             	mov    %rbx,%r15
   1802e:	8b 4c 24 0d          	mov    0xd(%rsp),%ecx
   18032:	8b 54 24 10          	mov    0x10(%rsp),%edx
   18036:	89 54 24 48          	mov    %edx,0x48(%rsp)
   1803a:	89 4c 24 45          	mov    %ecx,0x45(%rsp)
   1803e:	44 89 6c 24 40       	mov    %r13d,0x40(%rsp)
   18043:	88 44 24 44          	mov    %al,0x44(%rsp)
   18047:	66 0f 6e 44 24 3c    	movd   0x3c(%rsp),%xmm0
   1804d:	ff 15 25 56 04 00    	call   *0x45625(%rip)        # 5d678 <_DYNAMIC+0x320>
   18053:	48 89 c3             	mov    %rax,%rbx
   18056:	f6 c3 01             	test   $0x1,%bl
   18059:	74 0b                	je     18066 <hyperinterval_strict_surface32+0x86>
   1805b:	4c 89 f8             	mov    %r15,%rax
   1805e:	88 78 04             	mov    %bh,0x4(%rax)
   18061:	4c 89 fb             	mov    %r15,%rbx
   18064:	eb 48                	jmp    180ae <hyperinterval_strict_surface32+0xce>
   18066:	66 0f 6e 44 24 2c    	movd   0x2c(%rsp),%xmm0
   1806c:	ff 15 0e 56 04 00    	call   *0x4560e(%rip)        # 5d680 <_DYNAMIC+0x328>
   18072:	a8 01                	test   $0x1,%al
   18074:	74 08                	je     1807e <hyperinterval_strict_surface32+0x9e>
   18076:	4c 89 fb             	mov    %r15,%rbx
   18079:	88 63 04             	mov    %ah,0x4(%rbx)
   1807c:	eb 30                	jmp    180ae <hyperinterval_strict_surface32+0xce>
   1807e:	48 c1 eb 20          	shr    $0x20,%rbx
   18082:	66 0f 6e c3          	movd   %ebx,%xmm0
   18086:	48 c1 e8 20          	shr    $0x20,%rax
   1808a:	66 0f 6e c8          	movd   %eax,%xmm1
   1808e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18093:	ff 15 6f 55 04 00    	call   *0x4556f(%rip)        # 5d608 <_DYNAMIC+0x2b0>
   18099:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1809d:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   180a2:	83 f9 02             	cmp    $0x2,%ecx
   180a5:	75 23                	jne    180ca <hyperinterval_strict_surface32+0xea>
   180a7:	4c 89 fb             	mov    %r15,%rbx
   180aa:	41 88 47 04          	mov    %al,0x4(%r15)
   180ae:	41 c7 07 02 00 00 00 	movl   $0x2,(%r15)
   180b5:	48 89 d8             	mov    %rbx,%rax
   180b8:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
   180bf:	5b                   	pop    %rbx
   180c0:	41 5c                	pop    %r12
   180c2:	41 5d                	pop    %r13
   180c4:	41 5e                	pop    %r14
   180c6:	41 5f                	pop    %r15
   180c8:	5d                   	pop    %rbp
   180c9:	c3                   	ret
   180ca:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   180ce:	8b 74 24 10          	mov    0x10(%rsp),%esi
   180d2:	89 74 24 60          	mov    %esi,0x60(%rsp)
   180d6:	89 54 24 5d          	mov    %edx,0x5d(%rsp)
   180da:	89 4c 24 58          	mov    %ecx,0x58(%rsp)
   180de:	88 44 24 5c          	mov    %al,0x5c(%rsp)
   180e2:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   180e7:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
   180ec:	89 ea                	mov    %ebp,%edx
   180ee:	ff 15 94 55 04 00    	call   *0x45594(%rip)        # 5d688 <_DYNAMIC+0x330>
   180f4:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   180f8:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   180fd:	83 f9 02             	cmp    $0x2,%ecx
   18100:	4c 89 fb             	mov    %r15,%rbx
   18103:	0f 84 14 ff ff ff    	je     1801d <hyperinterval_strict_surface32+0x3d>
   18109:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   1810d:	8b 74 24 10          	mov    0x10(%rsp),%esi
   18111:	89 74 24 78          	mov    %esi,0x78(%rsp)
   18115:	89 54 24 75          	mov    %edx,0x75(%rsp)
   18119:	89 4c 24 70          	mov    %ecx,0x70(%rsp)
   1811d:	88 44 24 74          	mov    %al,0x74(%rsp)
   18121:	48 8d 7c 24 4c       	lea    0x4c(%rsp),%rdi
   18126:	48 8d 74 24 70       	lea    0x70(%rsp),%rsi
   1812b:	ff 15 5f 55 04 00    	call   *0x4555f(%rip)        # 5d690 <_DYNAMIC+0x338>
   18131:	8b 4c 24 4c          	mov    0x4c(%rsp),%ecx
   18135:	0f b6 44 24 50       	movzbl 0x50(%rsp),%eax
   1813a:	83 f9 02             	cmp    $0x2,%ecx
   1813d:	0f 84 da fe ff ff    	je     1801d <hyperinterval_strict_surface32+0x3d>
   18143:	8b 54 24 51          	mov    0x51(%rsp),%edx
   18147:	8b 74 24 54          	mov    0x54(%rsp),%esi
   1814b:	89 74 24 38          	mov    %esi,0x38(%rsp)
   1814f:	89 54 24 35          	mov    %edx,0x35(%rsp)
   18153:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   18157:	88 44 24 34          	mov    %al,0x34(%rsp)
   1815b:	48 8d 9c 24 9c 00 00 	lea    0x9c(%rsp),%rbx
   18162:	00 
   18163:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   18168:	4c 8d 64 24 58       	lea    0x58(%rsp),%r12
   1816d:	48 89 df             	mov    %rbx,%rdi
   18170:	4c 89 e2             	mov    %r12,%rdx
   18173:	ff 15 1f 55 04 00    	call   *0x4551f(%rip)        # 5d698 <_DYNAMIC+0x340>
   18179:	4c 8d 74 24 64       	lea    0x64(%rsp),%r14
   1817e:	48 8d 54 24 40       	lea    0x40(%rsp),%rdx
   18183:	4c 89 f7             	mov    %r14,%rdi
   18186:	48 89 de             	mov    %rbx,%rsi
   18189:	ff 15 11 55 04 00    	call   *0x45511(%rip)        # 5d6a0 <_DYNAMIC+0x348>
   1818f:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18194:	4c 89 f6             	mov    %r14,%rsi
   18197:	ff 15 0b 55 04 00    	call   *0x4550b(%rip)        # 5d6a8 <_DYNAMIC+0x350>
   1819d:	48 8d 7c 24 14       	lea    0x14(%rsp),%rdi
   181a2:	4c 89 f6             	mov    %r14,%rsi
   181a5:	4c 89 e2             	mov    %r12,%rdx
   181a8:	ff 15 02 55 04 00    	call   *0x45502(%rip)        # 5d6b0 <_DYNAMIC+0x358>
   181ae:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   181b3:	4c 89 f6             	mov    %r14,%rsi
   181b6:	4c 89 e2             	mov    %r12,%rdx
   181b9:	ff 15 f9 54 04 00    	call   *0x454f9(%rip)        # 5d6b8 <_DYNAMIC+0x360>
   181bf:	8b 44 24 28          	mov    0x28(%rsp),%eax
   181c3:	89 84 24 90 00 00 00 	mov    %eax,0x90(%rsp)
   181ca:	0f 10 44 24 08       	movups 0x8(%rsp),%xmm0
   181cf:	0f 10 4c 24 18       	movups 0x18(%rsp),%xmm1
   181d4:	0f 29 8c 24 80 00 00 	movaps %xmm1,0x80(%rsp)
   181db:	00 
   181dc:	0f 29 44 24 70       	movaps %xmm0,0x70(%rsp)
   181e1:	48 8d 44 24 70       	lea    0x70(%rsp),%rax
   181e6:	4c 89 f7             	mov    %r14,%rdi
   181e9:	ff 15 d1 54 04 00    	call   *0x454d1(%rip)        # 5d6c0 <_DYNAMIC+0x368>
   181ef:	8b 4c 24 64          	mov    0x64(%rsp),%ecx
   181f3:	83 f9 01             	cmp    $0x1,%ecx
   181f6:	75 1c                	jne    18214 <hyperinterval_strict_surface32+0x234>
   181f8:	8b 74 24 68          	mov    0x68(%rsp),%esi
   181fc:	8b 7c 24 6c          	mov    0x6c(%rsp),%edi
   18200:	39 fe                	cmp    %edi,%esi
   18202:	0f 94 c2             	sete   %dl
   18205:	66 0f 6e ce          	movd   %esi,%xmm1
   18209:	66 0f 6e c7          	movd   %edi,%xmm0
   1820d:	be 01 00 00 00       	mov    $0x1,%esi
   18212:	eb 04                	jmp    18218 <hyperinterval_strict_surface32+0x238>
   18214:	31 d2                	xor    %edx,%edx
   18216:	31 f6                	xor    %esi,%esi
   18218:	80 f1 01             	xor    $0x1,%cl
   1821b:	89 74 24 08          	mov    %esi,0x8(%rsp)
   1821f:	66 0f 7e 4c 24 0c    	movd   %xmm1,0xc(%rsp)
   18225:	88 4c 24 10          	mov    %cl,0x10(%rsp)
   18229:	88 54 24 11          	mov    %dl,0x11(%rsp)
   1822d:	88 44 24 12          	mov    %al,0x12(%rsp)
   18231:	89 74 24 14          	mov    %esi,0x14(%rsp)
   18235:	66 0f 7e 44 24 18    	movd   %xmm0,0x18(%rsp)
   1823b:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   18240:	4c 8d 64 24 64       	lea    0x64(%rsp),%r12
   18245:	48 8d 5c 24 58       	lea    0x58(%rsp),%rbx
   1824a:	4c 89 e7             	mov    %r12,%rdi
   1824d:	48 89 de             	mov    %rbx,%rsi
   18250:	ff 15 72 54 04 00    	call   *0x45472(%rip)        # 5d6c8 <_DYNAMIC+0x370>
   18256:	88 44 24 2c          	mov    %al,0x2c(%rsp)
   1825a:	4c 89 e7             	mov    %r12,%rdi
   1825d:	48 89 de             	mov    %rbx,%rsi
   18260:	ff 15 6a 54 04 00    	call   *0x4546a(%rip)        # 5d6d0 <_DYNAMIC+0x378>
   18266:	41 89 c6             	mov    %eax,%r14d
   18269:	48 8d 5c 24 40       	lea    0x40(%rsp),%rbx
   1826e:	4c 89 e7             	mov    %r12,%rdi
   18271:	48 89 de             	mov    %rbx,%rsi
   18274:	ff 15 5e 54 04 00    	call   *0x4545e(%rip)        # 5d6d8 <_DYNAMIC+0x380>
   1827a:	89 c5                	mov    %eax,%ebp
   1827c:	4c 89 e7             	mov    %r12,%rdi
   1827f:	48 89 de             	mov    %rbx,%rsi
   18282:	ff 15 58 54 04 00    	call   *0x45458(%rip)        # 5d6e0 <_DYNAMIC+0x388>
   18288:	89 c3                	mov    %eax,%ebx
   1828a:	4c 89 e7             	mov    %r12,%rdi
   1828d:	66 0f 6e 44 24 3c    	movd   0x3c(%rsp),%xmm0
   18293:	ff 15 07 53 04 00    	call   *0x45307(%rip)        # 5d5a0 <_DYNAMIC+0x248>
   18299:	a8 01                	test   $0x1,%al
   1829b:	74 0c                	je     182a9 <hyperinterval_strict_surface32+0x2c9>
   1829d:	4c 89 fb             	mov    %r15,%rbx
   182a0:	41 88 57 04          	mov    %dl,0x4(%r15)
   182a4:	e9 05 fe ff ff       	jmp    180ae <hyperinterval_strict_surface32+0xce>
   182a9:	0f b6 44 24 2c       	movzbl 0x2c(%rsp),%eax
   182ae:	88 44 24 08          	mov    %al,0x8(%rsp)
   182b2:	44 88 74 24 09       	mov    %r14b,0x9(%rsp)
   182b7:	40 88 6c 24 0a       	mov    %bpl,0xa(%rsp)
   182bc:	88 5c 24 0b          	mov    %bl,0xb(%rsp)
   182c0:	88 54 24 0c          	mov    %dl,0xc(%rsp)
   182c4:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   182c9:	41 83 fd 01          	cmp    $0x1,%r13d
   182cd:	75 2a                	jne    182f9 <hyperinterval_strict_surface32+0x319>
   182cf:	f3 0f 7e 44 24 44    	movq   0x44(%rsp),%xmm0
   182d5:	66 0f ef c9          	pxor   %xmm1,%xmm1
   182d9:	66 0f 6f 15 df d9 fe 	movdqa -0x12621(%rip),%xmm2        # 5cc0 <__abi_tag+0x59c4>
   182e0:	ff 
   182e1:	66 0f ef d0          	pxor   %xmm0,%xmm2
   182e5:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   182e9:	66 0f df ca          	pandn  %xmm2,%xmm1
   182ed:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   182f2:	b8 01 00 00 00       	mov    $0x1,%eax
   182f7:	eb 02                	jmp    182fb <hyperinterval_strict_surface32+0x31b>
   182f9:	31 c0                	xor    %eax,%eax
   182fb:	89 44 24 4c          	mov    %eax,0x4c(%rsp)
   182ff:	66 0f d6 44 24 50    	movq   %xmm0,0x50(%rsp)
   18305:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1830a:	48 8d 74 24 64       	lea    0x64(%rsp),%rsi
   1830f:	48 8d 54 24 4c       	lea    0x4c(%rsp),%rdx
   18314:	ff 15 ce 53 04 00    	call   *0x453ce(%rip)        # 5d6e8 <_DYNAMIC+0x390>
   1831a:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1831e:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   18323:	83 f9 02             	cmp    $0x2,%ecx
   18326:	4c 89 fb             	mov    %r15,%rbx
   18329:	0f 84 ee fc ff ff    	je     1801d <hyperinterval_strict_surface32+0x3d>
   1832f:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   18333:	8b 74 24 10          	mov    0x10(%rsp),%esi
   18337:	89 74 24 38          	mov    %esi,0x38(%rsp)
   1833b:	89 54 24 35          	mov    %edx,0x35(%rsp)
   1833f:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   18343:	88 44 24 34          	mov    %al,0x34(%rsp)
   18347:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1834c:	66 0f 6e 05 d0 d8 fe 	movd   -0x12730(%rip),%xmm0        # 5c24 <__abi_tag+0x5928>
   18353:	ff 
   18354:	ff 15 c6 52 04 00    	call   *0x452c6(%rip)        # 5d620 <_DYNAMIC+0x2c8>
   1835a:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1835e:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   18363:	83 f9 02             	cmp    $0x2,%ecx
   18366:	0f 84 b1 fc ff ff    	je     1801d <hyperinterval_strict_surface32+0x3d>
   1836c:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   18370:	8b 74 24 10          	mov    0x10(%rsp),%esi
   18374:	89 74 24 78          	mov    %esi,0x78(%rsp)
   18378:	89 54 24 75          	mov    %edx,0x75(%rsp)
   1837c:	89 4c 24 70          	mov    %ecx,0x70(%rsp)
   18380:	88 44 24 74          	mov    %al,0x74(%rsp)
   18384:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   18389:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   1838e:	48 89 df             	mov    %rbx,%rdi
   18391:	ff 15 59 53 04 00    	call   *0x45359(%rip)        # 5d6f0 <_DYNAMIC+0x398>
   18397:	e9 19 fd ff ff       	jmp    180b5 <hyperinterval_strict_surface32+0xd5>
   1839c:	cc                   	int3
   1839d:	cc                   	int3
   1839e:	cc                   	int3
   1839f:	cc                   	int3

hyperinterval_strict_surface64:
   183a0:	55                   	push   %rbp
   183a1:	41 57                	push   %r15
   183a3:	41 56                	push   %r14
   183a5:	41 55                	push   %r13
   183a7:	41 54                	push   %r12
   183a9:	53                   	push   %rbx
   183aa:	48 81 ec 48 01 00 00 	sub    $0x148,%rsp
   183b1:	89 f5                	mov    %esi,%ebp
   183b3:	48 89 fb             	mov    %rdi,%rbx
   183b6:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   183bb:	f2 0f 11 84 24 80 00 	movsd  %xmm0,0x80(%rsp)
   183c2:	00 00 
   183c4:	66 0f d6 4c 24 60    	movq   %xmm1,0x60(%rsp)
   183ca:	ff 15 68 52 04 00    	call   *0x45268(%rip)        # 5d638 <_DYNAMIC+0x2e0>
   183d0:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   183d5:	49 83 fc 02          	cmp    $0x2,%r12
   183d9:	75 07                	jne    183e2 <hyperinterval_strict_surface64+0x42>
   183db:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   183e0:	eb 78                	jmp    1845a <hyperinterval_strict_surface64+0xba>
   183e2:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
   183e7:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
   183ec:	4c 89 a4 24 00 01 00 	mov    %r12,0x100(%rsp)
   183f3:	00 
   183f4:	4c 89 bc 24 08 01 00 	mov    %r15,0x108(%rsp)
   183fb:	00 
   183fc:	4c 89 b4 24 10 01 00 	mov    %r14,0x110(%rsp)
   18403:	00 
   18404:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
   1840b:	00 
   1840c:	f2 0f 10 84 24 80 00 	movsd  0x80(%rsp),%xmm0
   18413:	00 00 
   18415:	ff 15 dd 52 04 00    	call   *0x452dd(%rip)        # 5d6f8 <_DYNAMIC+0x3a0>
   1841b:	80 bc 24 a0 00 00 00 	cmpb   $0x1,0xa0(%rsp)
   18422:	01 
   18423:	74 2d                	je     18452 <hyperinterval_strict_surface64+0xb2>
   18425:	f2 0f 10 84 24 a8 00 	movsd  0xa8(%rsp),%xmm0
   1842c:	00 00 
   1842e:	f2 0f 11 44 24 58    	movsd  %xmm0,0x58(%rsp)
   18434:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
   1843b:	00 
   1843c:	f2 0f 10 44 24 60    	movsd  0x60(%rsp),%xmm0
   18442:	ff 15 b8 52 04 00    	call   *0x452b8(%rip)        # 5d700 <_DYNAMIC+0x3a8>
   18448:	80 bc 24 a0 00 00 00 	cmpb   $0x1,0xa0(%rsp)
   1844f:	01 
   18450:	75 27                	jne    18479 <hyperinterval_strict_surface64+0xd9>
   18452:	0f b6 84 24 a1 00 00 	movzbl 0xa1(%rsp),%eax
   18459:	00 
   1845a:	88 43 08             	mov    %al,0x8(%rbx)
   1845d:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   18464:	48 89 d8             	mov    %rbx,%rax
   18467:	48 81 c4 48 01 00 00 	add    $0x148,%rsp
   1846e:	5b                   	pop    %rbx
   1846f:	41 5c                	pop    %r12
   18471:	41 5d                	pop    %r13
   18473:	41 5e                	pop    %r14
   18475:	41 5f                	pop    %r15
   18477:	5d                   	pop    %rbp
   18478:	c3                   	ret
   18479:	f3 0f 7e 8c 24 a8 00 	movq   0xa8(%rsp),%xmm1
   18480:	00 00 
   18482:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   18487:	f2 0f 10 44 24 58    	movsd  0x58(%rsp),%xmm0
   1848d:	ff 15 a5 51 04 00    	call   *0x451a5(%rip)        # 5d638 <_DYNAMIC+0x2e0>
   18493:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   18498:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   1849d:	48 83 f9 02          	cmp    $0x2,%rcx
   184a1:	74 b7                	je     1845a <hyperinterval_strict_surface64+0xba>
   184a3:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   184a8:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   184ad:	48 89 b4 24 f8 00 00 	mov    %rsi,0xf8(%rsp)
   184b4:	00 
   184b5:	48 89 94 24 f1 00 00 	mov    %rdx,0xf1(%rsp)
   184bc:	00 
   184bd:	48 89 8c 24 e8 00 00 	mov    %rcx,0xe8(%rsp)
   184c4:	00 
   184c5:	88 84 24 f0 00 00 00 	mov    %al,0xf0(%rsp)
   184cc:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   184d1:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
   184d8:	00 
   184d9:	89 ea                	mov    %ebp,%edx
   184db:	ff 15 27 52 04 00    	call   *0x45227(%rip)        # 5d708 <_DYNAMIC+0x3b0>
   184e1:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   184e6:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   184eb:	48 83 f9 02          	cmp    $0x2,%rcx
   184ef:	0f 84 65 ff ff ff    	je     1845a <hyperinterval_strict_surface64+0xba>
   184f5:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   184fa:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   184ff:	48 89 b4 24 b0 00 00 	mov    %rsi,0xb0(%rsp)
   18506:	00 
   18507:	48 89 94 24 a9 00 00 	mov    %rdx,0xa9(%rsp)
   1850e:	00 
   1850f:	48 89 8c 24 a0 00 00 	mov    %rcx,0xa0(%rsp)
   18516:	00 
   18517:	88 84 24 a8 00 00 00 	mov    %al,0xa8(%rsp)
   1851e:	48 8d bc 24 88 00 00 	lea    0x88(%rsp),%rdi
   18525:	00 
   18526:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
   1852d:	00 
   1852e:	ff 15 dc 51 04 00    	call   *0x451dc(%rip)        # 5d710 <_DYNAMIC+0x3b8>
   18534:	48 8b 8c 24 88 00 00 	mov    0x88(%rsp),%rcx
   1853b:	00 
   1853c:	0f b6 84 24 90 00 00 	movzbl 0x90(%rsp),%eax
   18543:	00 
   18544:	48 83 f9 02          	cmp    $0x2,%rcx
   18548:	0f 84 0c ff ff ff    	je     1845a <hyperinterval_strict_surface64+0xba>
   1854e:	48 8b 94 24 91 00 00 	mov    0x91(%rsp),%rdx
   18555:	00 
   18556:	48 8b b4 24 98 00 00 	mov    0x98(%rsp),%rsi
   1855d:	00 
   1855e:	48 89 74 24 78       	mov    %rsi,0x78(%rsp)
   18563:	48 89 54 24 71       	mov    %rdx,0x71(%rsp)
   18568:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
   1856d:	88 44 24 70          	mov    %al,0x70(%rsp)
   18571:	4c 8d ac 24 30 01 00 	lea    0x130(%rsp),%r13
   18578:	00 
   18579:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
   1857e:	48 8d 94 24 e8 00 00 	lea    0xe8(%rsp),%rdx
   18585:	00 
   18586:	4c 89 ef             	mov    %r13,%rdi
   18589:	ff 15 89 51 04 00    	call   *0x45189(%rip)        # 5d718 <_DYNAMIC+0x3c0>
   1858f:	48 8d ac 24 18 01 00 	lea    0x118(%rsp),%rbp
   18596:	00 
   18597:	48 8d 94 24 00 01 00 	lea    0x100(%rsp),%rdx
   1859e:	00 
   1859f:	48 89 ef             	mov    %rbp,%rdi
   185a2:	4c 89 ee             	mov    %r13,%rsi
   185a5:	ff 15 75 51 04 00    	call   *0x45175(%rip)        # 5d720 <_DYNAMIC+0x3c8>
   185ab:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   185b0:	48 89 ee             	mov    %rbp,%rsi
   185b3:	e8 68 f5 ff ff       	call   17b20 <<hyperinterval::float::F64Enclosure>::abs>
   185b8:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   185bd:	48 89 ee             	mov    %rbp,%rsi
   185c0:	48 8d 94 24 e8 00 00 	lea    0xe8(%rsp),%rdx
   185c7:	00 
   185c8:	ff 15 5a 51 04 00    	call   *0x4515a(%rip)        # 5d728 <_DYNAMIC+0x3d0>
   185ce:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   185d3:	48 89 ee             	mov    %rbp,%rsi
   185d6:	48 8d 94 24 e8 00 00 	lea    0xe8(%rsp),%rdx
   185dd:	00 
   185de:	ff 15 4c 51 04 00    	call   *0x4514c(%rip)        # 5d730 <_DYNAMIC+0x3d8>
   185e4:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   185e9:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
   185f0:	00 
   185f1:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
   185f6:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
   185fb:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
   18600:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
   18605:	0f 29 9c 24 d0 00 00 	movaps %xmm3,0xd0(%rsp)
   1860c:	00 
   1860d:	0f 29 94 24 c0 00 00 	movaps %xmm2,0xc0(%rsp)
   18614:	00 
   18615:	0f 29 8c 24 b0 00 00 	movaps %xmm1,0xb0(%rsp)
   1861c:	00 
   1861d:	0f 29 84 24 a0 00 00 	movaps %xmm0,0xa0(%rsp)
   18624:	00 
   18625:	48 8d 84 24 a0 00 00 	lea    0xa0(%rsp),%rax
   1862c:	00 
   1862d:	48 89 ef             	mov    %rbp,%rdi
   18630:	ff 15 02 51 04 00    	call   *0x45102(%rip)        # 5d738 <_DYNAMIC+0x3e0>
   18636:	48 8b 8c 24 18 01 00 	mov    0x118(%rsp),%rcx
   1863d:	00 
   1863e:	48 83 f9 01          	cmp    $0x1,%rcx
   18642:	75 27                	jne    1866b <hyperinterval_strict_surface64+0x2cb>
   18644:	48 8b b4 24 20 01 00 	mov    0x120(%rsp),%rsi
   1864b:	00 
   1864c:	48 8b bc 24 28 01 00 	mov    0x128(%rsp),%rdi
   18653:	00 
   18654:	48 39 fe             	cmp    %rdi,%rsi
   18657:	0f 94 c2             	sete   %dl
   1865a:	66 48 0f 6e ce       	movq   %rsi,%xmm1
   1865f:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   18664:	be 01 00 00 00       	mov    $0x1,%esi
   18669:	eb 04                	jmp    1866f <hyperinterval_strict_surface64+0x2cf>
   1866b:	31 d2                	xor    %edx,%edx
   1866d:	31 f6                	xor    %esi,%esi
   1866f:	80 f1 01             	xor    $0x1,%cl
   18672:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
   18677:	66 0f d6 4c 24 18    	movq   %xmm1,0x18(%rsp)
   1867d:	88 4c 24 20          	mov    %cl,0x20(%rsp)
   18681:	88 54 24 21          	mov    %dl,0x21(%rsp)
   18685:	88 44 24 22          	mov    %al,0x22(%rsp)
   18689:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
   1868e:	66 0f d6 44 24 30    	movq   %xmm0,0x30(%rsp)
   18694:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
   18699:	4c 8d ac 24 18 01 00 	lea    0x118(%rsp),%r13
   186a0:	00 
   186a1:	48 8d ac 24 e8 00 00 	lea    0xe8(%rsp),%rbp
   186a8:	00 
   186a9:	4c 89 ef             	mov    %r13,%rdi
   186ac:	48 89 ee             	mov    %rbp,%rsi
   186af:	ff 15 8b 50 04 00    	call   *0x4508b(%rip)        # 5d740 <_DYNAMIC+0x3e8>
   186b5:	88 44 24 60          	mov    %al,0x60(%rsp)
   186b9:	4c 89 ef             	mov    %r13,%rdi
   186bc:	48 89 ee             	mov    %rbp,%rsi
   186bf:	ff 15 83 50 04 00    	call   *0x45083(%rip)        # 5d748 <_DYNAMIC+0x3f0>
   186c5:	88 44 24 58          	mov    %al,0x58(%rsp)
   186c9:	48 8d ac 24 00 01 00 	lea    0x100(%rsp),%rbp
   186d0:	00 
   186d1:	4c 89 ef             	mov    %r13,%rdi
   186d4:	48 89 ee             	mov    %rbp,%rsi
   186d7:	ff 15 73 50 04 00    	call   *0x45073(%rip)        # 5d750 <_DYNAMIC+0x3f8>
   186dd:	88 44 24 0f          	mov    %al,0xf(%rsp)
   186e1:	4c 89 ef             	mov    %r13,%rdi
   186e4:	48 89 ee             	mov    %rbp,%rsi
   186e7:	ff 15 6b 50 04 00    	call   *0x4506b(%rip)        # 5d758 <_DYNAMIC+0x400>
   186ed:	89 c5                	mov    %eax,%ebp
   186ef:	4c 89 ef             	mov    %r13,%rdi
   186f2:	f2 0f 10 84 24 80 00 	movsd  0x80(%rsp),%xmm0
   186f9:	00 00 
   186fb:	ff 15 97 4e 04 00    	call   *0x44e97(%rip)        # 5d598 <_DYNAMIC+0x240>
   18701:	a8 01                	test   $0x1,%al
   18703:	74 08                	je     1870d <hyperinterval_strict_surface64+0x36d>
   18705:	88 53 08             	mov    %dl,0x8(%rbx)
   18708:	e9 50 fd ff ff       	jmp    1845d <hyperinterval_strict_surface64+0xbd>
   1870d:	0f b6 44 24 60       	movzbl 0x60(%rsp),%eax
   18712:	88 44 24 10          	mov    %al,0x10(%rsp)
   18716:	0f b6 44 24 58       	movzbl 0x58(%rsp),%eax
   1871b:	88 44 24 11          	mov    %al,0x11(%rsp)
   1871f:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
   18724:	88 44 24 12          	mov    %al,0x12(%rsp)
   18728:	40 88 6c 24 13       	mov    %bpl,0x13(%rsp)
   1872d:	88 54 24 14          	mov    %dl,0x14(%rsp)
   18731:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
   18736:	41 83 fc 01          	cmp    $0x1,%r12d
   1873a:	75 28                	jne    18764 <hyperinterval_strict_surface64+0x3c4>
   1873c:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   18743:	00 00 80 
   18746:	4c 89 f1             	mov    %r14,%rcx
   18749:	48 31 c1             	xor    %rax,%rcx
   1874c:	4d 85 f6             	test   %r14,%r14
   1874f:	49 0f 44 ce          	cmove  %r14,%rcx
   18753:	4c 31 f8             	xor    %r15,%rax
   18756:	4d 85 ff             	test   %r15,%r15
   18759:	49 0f 44 c7          	cmove  %r15,%rax
   1875d:	ba 01 00 00 00       	mov    $0x1,%edx
   18762:	eb 02                	jmp    18766 <hyperinterval_strict_surface64+0x3c6>
   18764:	31 d2                	xor    %edx,%edx
   18766:	48 89 94 24 88 00 00 	mov    %rdx,0x88(%rsp)
   1876d:	00 
   1876e:	48 89 8c 24 90 00 00 	mov    %rcx,0x90(%rsp)
   18775:	00 
   18776:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
   1877d:	00 
   1877e:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   18783:	48 8d b4 24 18 01 00 	lea    0x118(%rsp),%rsi
   1878a:	00 
   1878b:	48 8d 94 24 88 00 00 	lea    0x88(%rsp),%rdx
   18792:	00 
   18793:	ff 15 c7 4f 04 00    	call   *0x44fc7(%rip)        # 5d760 <_DYNAMIC+0x408>
   18799:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1879e:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   187a3:	48 83 f9 02          	cmp    $0x2,%rcx
   187a7:	0f 84 ad fc ff ff    	je     1845a <hyperinterval_strict_surface64+0xba>
   187ad:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   187b2:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   187b7:	48 89 74 24 78       	mov    %rsi,0x78(%rsp)
   187bc:	48 89 54 24 71       	mov    %rdx,0x71(%rsp)
   187c1:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
   187c6:	88 44 24 70          	mov    %al,0x70(%rsp)
   187ca:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   187cf:	f2 0f 10 05 b9 d3 fe 	movsd  -0x12c47(%rip),%xmm0        # 5b90 <__abi_tag+0x5894>
   187d6:	ff 
   187d7:	ff 15 73 4e 04 00    	call   *0x44e73(%rip)        # 5d650 <_DYNAMIC+0x2f8>
   187dd:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   187e2:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   187e7:	48 83 f9 02          	cmp    $0x2,%rcx
   187eb:	0f 84 69 fc ff ff    	je     1845a <hyperinterval_strict_surface64+0xba>
   187f1:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   187f6:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   187fb:	48 89 b4 24 b0 00 00 	mov    %rsi,0xb0(%rsp)
   18802:	00 
   18803:	48 89 94 24 a9 00 00 	mov    %rdx,0xa9(%rsp)
   1880a:	00 
   1880b:	48 89 8c 24 a0 00 00 	mov    %rcx,0xa0(%rsp)
   18812:	00 
   18813:	88 84 24 a8 00 00 00 	mov    %al,0xa8(%rsp)
   1881a:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
   1881f:	48 8d 94 24 a0 00 00 	lea    0xa0(%rsp),%rdx
   18826:	00 
   18827:	48 89 df             	mov    %rbx,%rdi
   1882a:	ff 15 38 4f 04 00    	call   *0x44f38(%rip)        # 5d768 <_DYNAMIC+0x410>
   18830:	e9 2f fc ff ff       	jmp    18464 <hyperinterval_strict_surface64+0xc4>
   18835:	cc                   	int3
   18836:	cc                   	int3
   18837:	cc                   	int3
   18838:	cc                   	int3
   18839:	cc                   	int3
   1883a:	cc                   	int3
   1883b:	cc                   	int3
   1883c:	cc                   	int3
   1883d:	cc                   	int3
   1883e:	cc                   	int3
   1883f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::reciprocal:
   18890:	41 57                	push   %r15
   18892:	41 56                	push   %r14
   18894:	41 54                	push   %r12
   18896:	53                   	push   %rbx
   18897:	48 83 ec 28          	sub    $0x28,%rsp
   1889b:	48 89 fb             	mov    %rdi,%rbx
   1889e:	83 3e 00             	cmpl   $0x0,(%rsi)
   188a1:	74 5e                	je     18901 <<hyperinterval::float::F32Enclosure>::reciprocal+0x71>
   188a3:	49 89 f6             	mov    %rsi,%r14
   188a6:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   188ac:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   188b1:	be 00 00 00 80       	mov    $0x80000000,%esi
   188b6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   188bb:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   188c0:	e8 6b 3d 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   188c5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   188ca:	74 25                	je     188f1 <<hyperinterval::float::F32Enclosure>::reciprocal+0x61>
   188cc:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   188d1:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   188d6:	be 00 00 00 80       	mov    $0x80000000,%esi
   188db:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   188e0:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   188e5:	e8 46 3d 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   188ea:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   188ef:	75 25                	jne    18916 <<hyperinterval::float::F32Enclosure>::reciprocal+0x86>
   188f1:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   188f6:	88 4b 04             	mov    %cl,0x4(%rbx)
   188f9:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   188ff:	eb 06                	jmp    18907 <<hyperinterval::float::F32Enclosure>::reciprocal+0x77>
   18901:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   18907:	48 89 d8             	mov    %rbx,%rax
   1890a:	48 83 c4 28          	add    $0x28,%rsp
   1890e:	5b                   	pop    %rbx
   1890f:	41 5c                	pop    %r12
   18911:	41 5e                	pop    %r14
   18913:	41 5f                	pop    %r15
   18915:	c3                   	ret
   18916:	8b 44 24 10          	mov    0x10(%rsp),%eax
   1891a:	44 89 e1             	mov    %r12d,%ecx
   1891d:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18923:	89 c2                	mov    %eax,%edx
   18925:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1892b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18930:	29 ce                	sub    %ecx,%esi
   18932:	44 09 f9             	or     %r15d,%ecx
   18935:	45 85 e4             	test   %r12d,%r12d
   18938:	48 0f 49 f1          	cmovns %rcx,%rsi
   1893c:	89 d1                	mov    %edx,%ecx
   1893e:	44 09 f9             	or     %r15d,%ecx
   18941:	41 29 d7             	sub    %edx,%r15d
   18944:	85 c0                	test   %eax,%eax
   18946:	4c 0f 49 f9          	cmovns %rcx,%r15
   1894a:	b1 01                	mov    $0x1,%cl
   1894c:	44 39 fe             	cmp    %r15d,%esi
   1894f:	77 a5                	ja     188f6 <<hyperinterval::float::F32Enclosure>::reciprocal+0x66>
   18951:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%rsp)
   18958:	00 
   18959:	44 89 64 24 20       	mov    %r12d,0x20(%rsp)
   1895e:	89 44 24 24          	mov    %eax,0x24(%rsp)
   18962:	41 83 7e 04 00       	cmpl   $0x0,0x4(%r14)
   18967:	7f 15                	jg     1897e <<hyperinterval::float::F32Enclosure>::reciprocal+0xee>
   18969:	41 8b 46 08          	mov    0x8(%r14),%eax
   1896d:	85 c0                	test   %eax,%eax
   1896f:	0f 99 c1             	setns  %cl
   18972:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   18977:	0f 94 c0             	sete   %al
   1897a:	08 c8                	or     %cl,%al
   1897c:	75 1a                	jne    18998 <<hyperinterval::float::F32Enclosure>::reciprocal+0x108>
   1897e:	48 8d 74 24 1c       	lea    0x1c(%rsp),%rsi
   18983:	48 89 df             	mov    %rbx,%rdi
   18986:	4c 89 f2             	mov    %r14,%rdx
   18989:	b9 01 00 00 00       	mov    $0x1,%ecx
   1898e:	e8 8d 02 00 00       	call   18c20 <<hyperinterval::float::F32Enclosure>::corner_image>
   18993:	e9 6f ff ff ff       	jmp    18907 <<hyperinterval::float::F32Enclosure>::reciprocal+0x77>
   18998:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
   1899c:	e9 58 ff ff ff       	jmp    188f9 <<hyperinterval::float::F32Enclosure>::reciprocal+0x69>
   189a1:	cc                   	int3
   189a2:	cc                   	int3
   189a3:	cc                   	int3
   189a4:	cc                   	int3
   189a5:	cc                   	int3
   189a6:	cc                   	int3
   189a7:	cc                   	int3
   189a8:	cc                   	int3
   189a9:	cc                   	int3
   189aa:	cc                   	int3
   189ab:	cc                   	int3
   189ac:	cc                   	int3
   189ad:	cc                   	int3
   189ae:	cc                   	int3
   189af:	cc                   	int3

<hyperinterval::float::F32Enclosure>::checked_pow:
   189b0:	55                   	push   %rbp
   189b1:	41 57                	push   %r15
   189b3:	41 56                	push   %r14
   189b5:	41 55                	push   %r13
   189b7:	41 54                	push   %r12
   189b9:	53                   	push   %rbx
   189ba:	48 83 ec 38          	sub    $0x38,%rsp
   189be:	48 89 fb             	mov    %rdi,%rbx
   189c1:	83 fa 02             	cmp    $0x2,%edx
   189c4:	75 0e                	jne    189d4 <<hyperinterval::float::F32Enclosure>::checked_pow+0x24>
   189c6:	48 89 df             	mov    %rbx,%rdi
   189c9:	ff 15 49 4c 04 00    	call   *0x44c49(%rip)        # 5d618 <_DYNAMIC+0x2c0>
   189cf:	e9 c8 00 00 00       	jmp    18a9c <<hyperinterval::float::F32Enclosure>::checked_pow+0xec>
   189d4:	f6 06 01             	testb  $0x1,(%rsi)
   189d7:	0f 84 b9 00 00 00    	je     18a96 <<hyperinterval::float::F32Enclosure>::checked_pow+0xe6>
   189dd:	89 d5                	mov    %edx,%ebp
   189df:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
   189e3:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   189e7:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   189ec:	be 00 00 00 80       	mov    $0x80000000,%esi
   189f1:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   189f6:	4c 89 f9             	mov    %r15,%rcx
   189f9:	41 89 e8             	mov    %ebp,%r8d
   189fc:	e8 3f 4b 00 00       	call   1d540 <<hyperinterval::ieee::Format>::power>
   18a01:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   18a06:	75 7e                	jne    18a86 <<hyperinterval::float::F32Enclosure>::checked_pow+0xd6>
   18a08:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   18a0d:	44 8b 6c 24 18       	mov    0x18(%rsp),%r13d
   18a12:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18a17:	be 00 00 00 80       	mov    $0x80000000,%esi
   18a1c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18a21:	4c 89 f1             	mov    %r14,%rcx
   18a24:	41 89 e8             	mov    %ebp,%r8d
   18a27:	e8 14 4b 00 00       	call   1d540 <<hyperinterval::ieee::Format>::power>
   18a2c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18a31:	74 53                	je     18a86 <<hyperinterval::float::F32Enclosure>::checked_pow+0xd6>
   18a33:	8b 44 24 10          	mov    0x10(%rsp),%eax
   18a37:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   18a3c:	8b 44 24 18          	mov    0x18(%rsp),%eax
   18a40:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   18a45:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18a4a:	be 00 00 00 80       	mov    $0x80000000,%esi
   18a4f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18a54:	4c 89 e1             	mov    %r12,%rcx
   18a57:	e8 d4 3b 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   18a5c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18a61:	74 23                	je     18a86 <<hyperinterval::float::F32Enclosure>::checked_pow+0xd6>
   18a63:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   18a68:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18a6d:	be 00 00 00 80       	mov    $0x80000000,%esi
   18a72:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18a77:	4c 89 e9             	mov    %r13,%rcx
   18a7a:	e8 b1 3b 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   18a7f:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18a84:	75 28                	jne    18aae <<hyperinterval::float::F32Enclosure>::checked_pow+0xfe>
   18a86:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   18a8b:	88 43 04             	mov    %al,0x4(%rbx)
   18a8e:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18a94:	eb 06                	jmp    18a9c <<hyperinterval::float::F32Enclosure>::checked_pow+0xec>
   18a96:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   18a9c:	48 89 d8             	mov    %rbx,%rax
   18a9f:	48 83 c4 38          	add    $0x38,%rsp
   18aa3:	5b                   	pop    %rbx
   18aa4:	41 5c                	pop    %r12
   18aa6:	41 5d                	pop    %r13
   18aa8:	41 5e                	pop    %r14
   18aaa:	41 5f                	pop    %r15
   18aac:	5d                   	pop    %rbp
   18aad:	c3                   	ret
   18aae:	8b 7c 24 10          	mov    0x10(%rsp),%edi
   18ab2:	44 89 e0             	mov    %r12d,%eax
   18ab5:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18aba:	89 f9                	mov    %edi,%ecx
   18abc:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18ac2:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18ac7:	29 c2                	sub    %eax,%edx
   18ac9:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   18acf:	44 09 e8             	or     %r13d,%eax
   18ad2:	45 85 e4             	test   %r12d,%r12d
   18ad5:	48 0f 49 d0          	cmovns %rax,%rdx
   18ad9:	be 00 00 00 80       	mov    $0x80000000,%esi
   18ade:	29 ce                	sub    %ecx,%esi
   18ae0:	89 c8                	mov    %ecx,%eax
   18ae2:	44 09 e8             	or     %r13d,%eax
   18ae5:	85 ff                	test   %edi,%edi
   18ae7:	48 0f 49 f0          	cmovns %rax,%rsi
   18aeb:	b0 01                	mov    $0x1,%al
   18aed:	39 f2                	cmp    %esi,%edx
   18aef:	77 9a                	ja     18a8b <<hyperinterval::float::F32Enclosure>::checked_pow+0xdb>
   18af1:	89 7c 24 2c          	mov    %edi,0x2c(%rsp)
   18af5:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18afa:	be 00 00 00 80       	mov    $0x80000000,%esi
   18aff:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18b04:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   18b09:	e8 22 3b 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   18b0e:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18b13:	0f 84 6d ff ff ff    	je     18a86 <<hyperinterval::float::F32Enclosure>::checked_pow+0xd6>
   18b19:	4c 89 64 24 20       	mov    %r12,0x20(%rsp)
   18b1e:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   18b23:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18b28:	be 00 00 00 80       	mov    $0x80000000,%esi
   18b2d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18b32:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
   18b37:	e8 f4 3a 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   18b3c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18b41:	0f 84 3f ff ff ff    	je     18a86 <<hyperinterval::float::F32Enclosure>::checked_pow+0xd6>
   18b47:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   18b4b:	44 89 e0             	mov    %r12d,%eax
   18b4e:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18b53:	89 ca                	mov    %ecx,%edx
   18b55:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18b5b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18b60:	29 c6                	sub    %eax,%esi
   18b62:	44 09 e8             	or     %r13d,%eax
   18b65:	45 85 e4             	test   %r12d,%r12d
   18b68:	48 0f 49 f0          	cmovns %rax,%rsi
   18b6c:	89 d0                	mov    %edx,%eax
   18b6e:	44 09 e8             	or     %r13d,%eax
   18b71:	41 29 d5             	sub    %edx,%r13d
   18b74:	85 c9                	test   %ecx,%ecx
   18b76:	4c 0f 49 e8          	cmovns %rax,%r13
   18b7a:	b0 01                	mov    $0x1,%al
   18b7c:	44 39 ee             	cmp    %r13d,%esi
   18b7f:	0f 87 06 ff ff ff    	ja     18a8b <<hyperinterval::float::F32Enclosure>::checked_pow+0xdb>
   18b85:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
   18b8a:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
   18b8e:	44 89 e2             	mov    %r12d,%edx
   18b91:	e8 ba 54 00 00       	call   1e050 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   18b96:	41 89 c5             	mov    %eax,%r13d
   18b99:	41 89 d4             	mov    %edx,%r12d
   18b9c:	85 ed                	test   %ebp,%ebp
   18b9e:	0f 95 c0             	setne  %al
   18ba1:	40 f6 c5 01          	test   $0x1,%bpl
   18ba5:	0f 94 c1             	sete   %cl
   18ba8:	84 c8                	test   %cl,%al
   18baa:	74 11                	je     18bbd <<hyperinterval::float::F32Enclosure>::checked_pow+0x20d>
   18bac:	44 89 ff             	mov    %r15d,%edi
   18baf:	44 89 f6             	mov    %r14d,%esi
   18bb2:	31 d2                	xor    %edx,%edx
   18bb4:	e8 27 55 00 00       	call   1e0e0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::signs>
   18bb9:	a8 02                	test   $0x2,%al
   18bbb:	75 13                	jne    18bd0 <<hyperinterval::float::F32Enclosure>::checked_pow+0x220>
   18bbd:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   18bc3:	44 89 6b 04          	mov    %r13d,0x4(%rbx)
   18bc7:	44 89 63 08          	mov    %r12d,0x8(%rbx)
   18bcb:	e9 cc fe ff ff       	jmp    18a9c <<hyperinterval::float::F32Enclosure>::checked_pow+0xec>
   18bd0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18bd5:	31 f6                	xor    %esi,%esi
   18bd7:	31 d2                	xor    %edx,%edx
   18bd9:	e8 42 17 00 00       	call   1a320 <<hyperinterval::float::F32Enclosure>::from_bits>
   18bde:	8b 44 24 08          	mov    0x8(%rsp),%eax
   18be2:	83 f8 02             	cmp    $0x2,%eax
   18be5:	75 0a                	jne    18bf1 <<hyperinterval::float::F32Enclosure>::checked_pow+0x241>
   18be7:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   18bec:	e9 9a fe ff ff       	jmp    18a8b <<hyperinterval::float::F32Enclosure>::checked_pow+0xdb>
   18bf1:	83 f8 01             	cmp    $0x1,%eax
   18bf4:	75 c7                	jne    18bbd <<hyperinterval::float::F32Enclosure>::checked_pow+0x20d>
   18bf6:	8b 54 24 0c          	mov    0xc(%rsp),%edx
   18bfa:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   18bfe:	44 89 ef             	mov    %r13d,%edi
   18c01:	44 89 e6             	mov    %r12d,%esi
   18c04:	e8 47 54 00 00       	call   1e050 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   18c09:	41 89 c5             	mov    %eax,%r13d
   18c0c:	41 89 d4             	mov    %edx,%r12d
   18c0f:	eb ac                	jmp    18bbd <<hyperinterval::float::F32Enclosure>::checked_pow+0x20d>
   18c11:	cc                   	int3
   18c12:	cc                   	int3
   18c13:	cc                   	int3
   18c14:	cc                   	int3
   18c15:	cc                   	int3
   18c16:	cc                   	int3
   18c17:	cc                   	int3
   18c18:	cc                   	int3
   18c19:	cc                   	int3
   18c1a:	cc                   	int3
   18c1b:	cc                   	int3
   18c1c:	cc                   	int3
   18c1d:	cc                   	int3
   18c1e:	cc                   	int3
   18c1f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::corner_image:
   18c20:	55                   	push   %rbp
   18c21:	41 57                	push   %r15
   18c23:	41 56                	push   %r14
   18c25:	41 55                	push   %r13
   18c27:	41 54                	push   %r12
   18c29:	53                   	push   %rbx
   18c2a:	48 83 ec 58          	sub    $0x58,%rsp
   18c2e:	48 89 fb             	mov    %rdi,%rbx
   18c31:	f6 06 01             	testb  $0x1,(%rsi)
   18c34:	74 49                	je     18c7f <<hyperinterval::float::F32Enclosure>::corner_image+0x5f>
   18c36:	f6 02 01             	testb  $0x1,(%rdx)
   18c39:	74 44                	je     18c7f <<hyperinterval::float::F32Enclosure>::corner_image+0x5f>
   18c3b:	44 8b 62 04          	mov    0x4(%rdx),%r12d
   18c3f:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   18c43:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
   18c47:	8b 46 08             	mov    0x8(%rsi),%eax
   18c4a:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   18c4f:	84 c9                	test   %cl,%cl
   18c51:	74 37                	je     18c8a <<hyperinterval::float::F32Enclosure>::corner_image+0x6a>
   18c53:	48 89 e7             	mov    %rsp,%rdi
   18c56:	be 00 00 00 80       	mov    $0x80000000,%esi
   18c5b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18c60:	4c 89 e9             	mov    %r13,%rcx
   18c63:	4d 89 e0             	mov    %r12,%r8
   18c66:	e8 b5 3c 00 00       	call   1c920 <<hyperinterval::ieee::Format>::div>
   18c6b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18c6f:	0f 84 bf 00 00 00    	je     18d34 <<hyperinterval::float::F32Enclosure>::corner_image+0x114>
   18c75:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   18c7a:	e9 ad 00 00 00       	jmp    18d2c <<hyperinterval::float::F32Enclosure>::corner_image+0x10c>
   18c7f:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   18c85:	e9 42 03 00 00       	jmp    18fcc <<hyperinterval::float::F32Enclosure>::corner_image+0x3ac>
   18c8a:	44 89 e8             	mov    %r13d,%eax
   18c8d:	c1 e8 17             	shr    $0x17,%eax
   18c90:	0f b6 d0             	movzbl %al,%edx
   18c93:	44 89 ee             	mov    %r13d,%esi
   18c96:	81 e6 ff ff 7f 00    	and    $0x7fffff,%esi
   18c9c:	31 c9                	xor    %ecx,%ecx
   18c9e:	85 d2                	test   %edx,%edx
   18ca0:	0f 95 c1             	setne  %cl
   18ca3:	b8 01 00 00 00       	mov    $0x1,%eax
   18ca8:	0f 45 c2             	cmovne %edx,%eax
   18cab:	c1 e1 17             	shl    $0x17,%ecx
   18cae:	48 09 f1             	or     %rsi,%rcx
   18cb1:	44 89 e2             	mov    %r12d,%edx
   18cb4:	c1 ea 17             	shr    $0x17,%edx
   18cb7:	0f b6 d2             	movzbl %dl,%edx
   18cba:	44 89 e6             	mov    %r12d,%esi
   18cbd:	81 e6 ff ff 7f 00    	and    $0x7fffff,%esi
   18cc3:	8d ba d4 fe ff ff    	lea    -0x12c(%rdx),%edi
   18cc9:	45 31 c0             	xor    %r8d,%r8d
   18ccc:	85 d2                	test   %edx,%edx
   18cce:	ba d5 fe ff ff       	mov    $0xfffffed5,%edx
   18cd3:	0f 45 d7             	cmovne %edi,%edx
   18cd6:	41 0f 95 c0          	setne  %r8b
   18cda:	41 c1 e0 17          	shl    $0x17,%r8d
   18cde:	49 09 f0             	or     %rsi,%r8
   18ce1:	4c 0f af c1          	imul   %rcx,%r8
   18ce5:	44 89 e9             	mov    %r13d,%ecx
   18ce8:	44 31 e1             	xor    %r12d,%ecx
   18ceb:	01 c2                	add    %eax,%edx
   18ced:	c1 e9 1f             	shr    $0x1f,%ecx
   18cf0:	88 4c 24 14          	mov    %cl,0x14(%rsp)
   18cf4:	4c 89 04 24          	mov    %r8,(%rsp)
   18cf8:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   18cff:	00 00 
   18d01:	89 54 24 10          	mov    %edx,0x10(%rsp)
   18d05:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   18d0a:	48 89 e1             	mov    %rsp,%rcx
   18d0d:	be 00 00 00 80       	mov    $0x80000000,%esi
   18d12:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18d17:	e8 14 50 00 00       	call   1dd30 <<hyperinterval::ieee::Format>::rounded>
   18d1c:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   18d21:	0f 84 54 02 00 00    	je     18f7b <<hyperinterval::float::F32Enclosure>::corner_image+0x35b>
   18d27:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   18d2c:	88 43 04             	mov    %al,0x4(%rbx)
   18d2f:	e9 92 02 00 00       	jmp    18fc6 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a6>
   18d34:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18d38:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   18d3d:	48 89 e7             	mov    %rsp,%rdi
   18d40:	be 00 00 00 80       	mov    $0x80000000,%esi
   18d45:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18d4a:	e8 e1 38 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   18d4f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18d53:	0f 85 63 02 00 00    	jne    18fbc <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   18d59:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   18d5e:	48 89 e7             	mov    %rsp,%rdi
   18d61:	be 00 00 00 80       	mov    $0x80000000,%esi
   18d66:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18d6b:	4c 89 f9             	mov    %r15,%rcx
   18d6e:	e8 bd 38 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   18d73:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18d77:	0f 85 3f 02 00 00    	jne    18fbc <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   18d7d:	8b 7c 24 08          	mov    0x8(%rsp),%edi
   18d81:	89 e8                	mov    %ebp,%eax
   18d83:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18d88:	89 f9                	mov    %edi,%ecx
   18d8a:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18d90:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18d95:	29 c2                	sub    %eax,%edx
   18d97:	be 00 00 00 80       	mov    $0x80000000,%esi
   18d9c:	09 f0                	or     %esi,%eax
   18d9e:	85 ed                	test   %ebp,%ebp
   18da0:	48 0f 49 d0          	cmovns %rax,%rdx
   18da4:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18da9:	29 c8                	sub    %ecx,%eax
   18dab:	09 f1                	or     %esi,%ecx
   18dad:	85 ff                	test   %edi,%edi
   18daf:	48 0f 49 c1          	cmovns %rcx,%rax
   18db3:	41 b7 01             	mov    $0x1,%r15b
   18db6:	39 c2                	cmp    %eax,%edx
   18db8:	0f 87 04 02 00 00    	ja     18fc2 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a2>
   18dbe:	89 7c 24 50          	mov    %edi,0x50(%rsp)
   18dc2:	48 89 6c 24 28       	mov    %rbp,0x28(%rsp)
   18dc7:	48 89 e7             	mov    %rsp,%rdi
   18dca:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18dcf:	4c 89 e9             	mov    %r13,%rcx
   18dd2:	4d 89 f0             	mov    %r14,%r8
   18dd5:	e8 46 3b 00 00       	call   1c920 <<hyperinterval::ieee::Format>::div>
   18dda:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18dde:	0f 85 91 fe ff ff    	jne    18c75 <<hyperinterval::float::F32Enclosure>::corner_image+0x55>
   18de4:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18de8:	44 8b 6c 24 10       	mov    0x10(%rsp),%r13d
   18ded:	48 89 e7             	mov    %rsp,%rdi
   18df0:	be 00 00 00 80       	mov    $0x80000000,%esi
   18df5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18dfa:	e8 31 38 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   18dff:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18e03:	0f 85 b3 01 00 00    	jne    18fbc <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   18e09:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   18e0e:	48 89 e7             	mov    %rsp,%rdi
   18e11:	be 00 00 00 80       	mov    $0x80000000,%esi
   18e16:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18e1b:	4c 89 e9             	mov    %r13,%rcx
   18e1e:	e8 0d 38 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   18e23:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18e27:	0f 85 8f 01 00 00    	jne    18fbc <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   18e2d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18e31:	89 e8                	mov    %ebp,%eax
   18e33:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18e38:	89 ca                	mov    %ecx,%edx
   18e3a:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18e40:	be 00 00 00 80       	mov    $0x80000000,%esi
   18e45:	29 c6                	sub    %eax,%esi
   18e47:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18e4c:	09 f8                	or     %edi,%eax
   18e4e:	85 ed                	test   %ebp,%ebp
   18e50:	48 0f 49 f0          	cmovns %rax,%rsi
   18e54:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18e59:	29 d0                	sub    %edx,%eax
   18e5b:	09 fa                	or     %edi,%edx
   18e5d:	85 c9                	test   %ecx,%ecx
   18e5f:	48 0f 49 c2          	cmovns %rdx,%rax
   18e63:	39 c6                	cmp    %eax,%esi
   18e65:	0f 87 57 01 00 00    	ja     18fc2 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a2>
   18e6b:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   18e70:	8b 74 24 50          	mov    0x50(%rsp),%esi
   18e74:	89 ea                	mov    %ebp,%edx
   18e76:	e8 d5 51 00 00       	call   1e050 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   18e7b:	89 c5                	mov    %eax,%ebp
   18e7d:	41 89 d5             	mov    %edx,%r13d
   18e80:	48 89 e7             	mov    %rsp,%rdi
   18e83:	be 00 00 00 80       	mov    $0x80000000,%esi
   18e88:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18e8d:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   18e92:	4d 89 e0             	mov    %r12,%r8
   18e95:	e8 86 3a 00 00       	call   1c920 <<hyperinterval::ieee::Format>::div>
   18e9a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18e9e:	0f 85 d1 fd ff ff    	jne    18c75 <<hyperinterval::float::F32Enclosure>::corner_image+0x55>
   18ea4:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18ea8:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   18ead:	48 89 e7             	mov    %rsp,%rdi
   18eb0:	be 00 00 00 80       	mov    $0x80000000,%esi
   18eb5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18eba:	e8 71 37 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   18ebf:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18ec3:	0f 85 f3 00 00 00    	jne    18fbc <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   18ec9:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   18ece:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   18ed3:	48 89 e7             	mov    %rsp,%rdi
   18ed6:	be 00 00 00 80       	mov    $0x80000000,%esi
   18edb:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18ee0:	4c 89 e1             	mov    %r12,%rcx
   18ee3:	e8 48 37 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   18ee8:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18eec:	0f 85 ca 00 00 00    	jne    18fbc <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   18ef2:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18ef6:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   18efb:	89 d0                	mov    %edx,%eax
   18efd:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18f02:	41 89 c8             	mov    %ecx,%r8d
   18f05:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18f0c:	be 00 00 00 80       	mov    $0x80000000,%esi
   18f11:	29 c6                	sub    %eax,%esi
   18f13:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18f18:	09 f8                	or     %edi,%eax
   18f1a:	85 d2                	test   %edx,%edx
   18f1c:	48 0f 49 f0          	cmovns %rax,%rsi
   18f20:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18f25:	44 29 c0             	sub    %r8d,%eax
   18f28:	41 09 f8             	or     %edi,%r8d
   18f2b:	85 c9                	test   %ecx,%ecx
   18f2d:	49 0f 49 c0          	cmovns %r8,%rax
   18f31:	39 c6                	cmp    %eax,%esi
   18f33:	0f 87 89 00 00 00    	ja     18fc2 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a2>
   18f39:	89 ef                	mov    %ebp,%edi
   18f3b:	44 89 ee             	mov    %r13d,%esi
   18f3e:	e8 0d 51 00 00       	call   1e050 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   18f43:	41 89 c5             	mov    %eax,%r13d
   18f46:	41 89 d4             	mov    %edx,%r12d
   18f49:	48 89 e7             	mov    %rsp,%rdi
   18f4c:	be 00 00 00 80       	mov    $0x80000000,%esi
   18f51:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18f56:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   18f5b:	4d 89 f0             	mov    %r14,%r8
   18f5e:	e8 bd 39 00 00       	call   1c920 <<hyperinterval::ieee::Format>::div>
   18f63:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18f67:	0f 85 08 fd ff ff    	jne    18c75 <<hyperinterval::float::F32Enclosure>::corner_image+0x55>
   18f6d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18f71:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   18f76:	e9 62 02 00 00       	jmp    191dd <<hyperinterval::float::F32Enclosure>::corner_image+0x5bd>
   18f7b:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   18f7f:	44 8b 7c 24 40       	mov    0x40(%rsp),%r15d
   18f84:	48 89 e7             	mov    %rsp,%rdi
   18f87:	be 00 00 00 80       	mov    $0x80000000,%esi
   18f8c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18f91:	e8 9a 36 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   18f96:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18f9a:	74 20                	je     18fbc <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   18f9c:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   18fa1:	48 89 e7             	mov    %rsp,%rdi
   18fa4:	be 00 00 00 80       	mov    $0x80000000,%esi
   18fa9:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18fae:	4c 89 f9             	mov    %r15,%rcx
   18fb1:	e8 7a 36 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   18fb6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18fba:	75 1f                	jne    18fdb <<hyperinterval::float::F32Enclosure>::corner_image+0x3bb>
   18fbc:	44 0f b6 7c 24 01    	movzbl 0x1(%rsp),%r15d
   18fc2:	44 88 7b 04          	mov    %r15b,0x4(%rbx)
   18fc6:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18fcc:	48 83 c4 58          	add    $0x58,%rsp
   18fd0:	5b                   	pop    %rbx
   18fd1:	41 5c                	pop    %r12
   18fd3:	41 5d                	pop    %r13
   18fd5:	41 5e                	pop    %r14
   18fd7:	41 5f                	pop    %r15
   18fd9:	5d                   	pop    %rbp
   18fda:	c3                   	ret
   18fdb:	8b 7c 24 08          	mov    0x8(%rsp),%edi
   18fdf:	89 e8                	mov    %ebp,%eax
   18fe1:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18fe6:	89 f9                	mov    %edi,%ecx
   18fe8:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18fee:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18ff3:	29 c2                	sub    %eax,%edx
   18ff5:	be 00 00 00 80       	mov    $0x80000000,%esi
   18ffa:	09 f0                	or     %esi,%eax
   18ffc:	85 ed                	test   %ebp,%ebp
   18ffe:	48 0f 49 d0          	cmovns %rax,%rdx
   19002:	b8 00 00 00 80       	mov    $0x80000000,%eax
   19007:	29 c8                	sub    %ecx,%eax
   19009:	09 f1                	or     %esi,%ecx
   1900b:	85 ff                	test   %edi,%edi
   1900d:	48 0f 49 c1          	cmovns %rcx,%rax
   19011:	41 b7 01             	mov    $0x1,%r15b
   19014:	39 c2                	cmp    %eax,%edx
   19016:	77 aa                	ja     18fc2 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a2>
   19018:	89 7c 24 28          	mov    %edi,0x28(%rsp)
   1901c:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   19021:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19026:	4c 89 e9             	mov    %r13,%rcx
   19029:	4d 89 f0             	mov    %r14,%r8
   1902c:	e8 2f 3d 00 00       	call   1cd60 <<hyperinterval::ieee::Format>::mul>
   19031:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   19036:	0f 85 eb fc ff ff    	jne    18d27 <<hyperinterval::float::F32Enclosure>::corner_image+0x107>
   1903c:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   19040:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
   19045:	48 89 e7             	mov    %rsp,%rdi
   19048:	be 00 00 00 80       	mov    $0x80000000,%esi
   1904d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19052:	e8 d9 35 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   19057:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1905b:	0f 85 5b ff ff ff    	jne    18fbc <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   19061:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19066:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1906b:	48 89 e7             	mov    %rsp,%rdi
   1906e:	be 00 00 00 80       	mov    $0x80000000,%esi
   19073:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19078:	4c 89 e9             	mov    %r13,%rcx
   1907b:	e8 b0 35 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   19080:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19084:	0f 85 32 ff ff ff    	jne    18fbc <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   1908a:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1908e:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
   19093:	89 d0                	mov    %edx,%eax
   19095:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   1909a:	41 89 c8             	mov    %ecx,%r8d
   1909d:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   190a4:	be 00 00 00 80       	mov    $0x80000000,%esi
   190a9:	29 c6                	sub    %eax,%esi
   190ab:	bf 00 00 00 80       	mov    $0x80000000,%edi
   190b0:	09 f8                	or     %edi,%eax
   190b2:	85 d2                	test   %edx,%edx
   190b4:	48 0f 49 f0          	cmovns %rax,%rsi
   190b8:	b8 00 00 00 80       	mov    $0x80000000,%eax
   190bd:	44 29 c0             	sub    %r8d,%eax
   190c0:	41 09 f8             	or     %edi,%r8d
   190c3:	85 c9                	test   %ecx,%ecx
   190c5:	49 0f 49 c0          	cmovns %r8,%rax
   190c9:	39 c6                	cmp    %eax,%esi
   190cb:	0f 87 f1 fe ff ff    	ja     18fc2 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a2>
   190d1:	89 ef                	mov    %ebp,%edi
   190d3:	8b 74 24 28          	mov    0x28(%rsp),%esi
   190d7:	e8 74 4f 00 00       	call   1e050 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   190dc:	89 c5                	mov    %eax,%ebp
   190de:	41 89 d5             	mov    %edx,%r13d
   190e1:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   190e6:	be 00 00 00 80       	mov    $0x80000000,%esi
   190eb:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   190f0:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   190f5:	4d 89 e0             	mov    %r12,%r8
   190f8:	e8 63 3c 00 00       	call   1cd60 <<hyperinterval::ieee::Format>::mul>
   190fd:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   19102:	0f 85 1f fc ff ff    	jne    18d27 <<hyperinterval::float::F32Enclosure>::corner_image+0x107>
   19108:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   1910c:	44 8b 64 24 40       	mov    0x40(%rsp),%r12d
   19111:	48 89 e7             	mov    %rsp,%rdi
   19114:	be 00 00 00 80       	mov    $0x80000000,%esi
   19119:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1911e:	e8 0d 35 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   19123:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19127:	0f 85 8f fe ff ff    	jne    18fbc <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   1912d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19132:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   19137:	48 89 e7             	mov    %rsp,%rdi
   1913a:	be 00 00 00 80       	mov    $0x80000000,%esi
   1913f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19144:	4c 89 e1             	mov    %r12,%rcx
   19147:	e8 e4 34 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1914c:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19150:	0f 85 66 fe ff ff    	jne    18fbc <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   19156:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1915a:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   1915f:	89 d0                	mov    %edx,%eax
   19161:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19166:	41 89 c8             	mov    %ecx,%r8d
   19169:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   19170:	be 00 00 00 80       	mov    $0x80000000,%esi
   19175:	29 c6                	sub    %eax,%esi
   19177:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1917c:	09 f8                	or     %edi,%eax
   1917e:	85 d2                	test   %edx,%edx
   19180:	48 0f 49 f0          	cmovns %rax,%rsi
   19184:	b8 00 00 00 80       	mov    $0x80000000,%eax
   19189:	44 29 c0             	sub    %r8d,%eax
   1918c:	41 09 f8             	or     %edi,%r8d
   1918f:	85 c9                	test   %ecx,%ecx
   19191:	49 0f 49 c0          	cmovns %r8,%rax
   19195:	39 c6                	cmp    %eax,%esi
   19197:	0f 87 25 fe ff ff    	ja     18fc2 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a2>
   1919d:	89 ef                	mov    %ebp,%edi
   1919f:	44 89 ee             	mov    %r13d,%esi
   191a2:	e8 a9 4e 00 00       	call   1e050 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   191a7:	41 89 c5             	mov    %eax,%r13d
   191aa:	41 89 d4             	mov    %edx,%r12d
   191ad:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   191b2:	be 00 00 00 80       	mov    $0x80000000,%esi
   191b7:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   191bc:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   191c1:	4d 89 f0             	mov    %r14,%r8
   191c4:	e8 97 3b 00 00       	call   1cd60 <<hyperinterval::ieee::Format>::mul>
   191c9:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   191ce:	0f 85 53 fb ff ff    	jne    18d27 <<hyperinterval::float::F32Enclosure>::corner_image+0x107>
   191d4:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   191d8:	44 8b 74 24 40       	mov    0x40(%rsp),%r14d
   191dd:	48 89 e7             	mov    %rsp,%rdi
   191e0:	be 00 00 00 80       	mov    $0x80000000,%esi
   191e5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   191ea:	e8 41 34 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   191ef:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   191f3:	0f 85 c3 fd ff ff    	jne    18fbc <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   191f9:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   191fe:	48 89 e7             	mov    %rsp,%rdi
   19201:	be 00 00 00 80       	mov    $0x80000000,%esi
   19206:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1920b:	4c 89 f1             	mov    %r14,%rcx
   1920e:	e8 1d 34 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   19213:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19217:	0f 85 9f fd ff ff    	jne    18fbc <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   1921d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   19221:	89 e8                	mov    %ebp,%eax
   19223:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19228:	89 ca                	mov    %ecx,%edx
   1922a:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19230:	be 00 00 00 80       	mov    $0x80000000,%esi
   19235:	29 c6                	sub    %eax,%esi
   19237:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1923c:	09 f8                	or     %edi,%eax
   1923e:	85 ed                	test   %ebp,%ebp
   19240:	48 0f 49 f0          	cmovns %rax,%rsi
   19244:	89 d0                	mov    %edx,%eax
   19246:	09 f8                	or     %edi,%eax
   19248:	29 d7                	sub    %edx,%edi
   1924a:	85 c9                	test   %ecx,%ecx
   1924c:	48 0f 49 f8          	cmovns %rax,%rdi
   19250:	39 fe                	cmp    %edi,%esi
   19252:	0f 87 6a fd ff ff    	ja     18fc2 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a2>
   19258:	44 89 ef             	mov    %r13d,%edi
   1925b:	44 89 e6             	mov    %r12d,%esi
   1925e:	89 ea                	mov    %ebp,%edx
   19260:	e8 eb 4d 00 00       	call   1e050 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   19265:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   1926b:	89 43 04             	mov    %eax,0x4(%rbx)
   1926e:	89 53 08             	mov    %edx,0x8(%rbx)
   19271:	e9 56 fd ff ff       	jmp    18fcc <<hyperinterval::float::F32Enclosure>::corner_image+0x3ac>
   19276:	cc                   	int3
   19277:	cc                   	int3
   19278:	cc                   	int3
   19279:	cc                   	int3
   1927a:	cc                   	int3
   1927b:	cc                   	int3
   1927c:	cc                   	int3
   1927d:	cc                   	int3
   1927e:	cc                   	int3
   1927f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::intersection:
   19280:	48 89 f8             	mov    %rdi,%rax
   19283:	45 31 c9             	xor    %r9d,%r9d
   19286:	f6 06 01             	testb  $0x1,(%rsi)
   19289:	0f 84 ed 00 00 00    	je     1937c <<hyperinterval::float::F32Enclosure>::intersection+0xfc>
   1928f:	f6 02 01             	testb  $0x1,(%rdx)
   19292:	0f 84 d9 00 00 00    	je     19371 <<hyperinterval::float::F32Enclosure>::intersection+0xf1>
   19298:	53                   	push   %rbx
   19299:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   1929d:	8b 4e 04             	mov    0x4(%rsi),%ecx
   192a0:	bf 00 00 00 80       	mov    $0x80000000,%edi
   192a5:	41 89 c9             	mov    %ecx,%r9d
   192a8:	41 09 f9             	or     %edi,%r9d
   192ab:	41 89 ca             	mov    %ecx,%r10d
   192ae:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   192b5:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   192bb:	45 29 d3             	sub    %r10d,%r11d
   192be:	85 c9                	test   %ecx,%ecx
   192c0:	4d 0f 49 d9          	cmovns %r9,%r11
   192c4:	45 89 c1             	mov    %r8d,%r9d
   192c7:	41 09 f9             	or     %edi,%r9d
   192ca:	45 89 c2             	mov    %r8d,%r10d
   192cd:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   192d4:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   192d9:	44 29 d3             	sub    %r10d,%ebx
   192dc:	45 85 c0             	test   %r8d,%r8d
   192df:	49 0f 49 d9          	cmovns %r9,%rbx
   192e3:	8b 52 08             	mov    0x8(%rdx),%edx
   192e6:	41 39 db             	cmp    %ebx,%r11d
   192e9:	41 0f 42 c8          	cmovb  %r8d,%ecx
   192ed:	44 8b 46 08          	mov    0x8(%rsi),%r8d
   192f1:	44 89 c6             	mov    %r8d,%esi
   192f4:	09 fe                	or     %edi,%esi
   192f6:	45 89 c1             	mov    %r8d,%r9d
   192f9:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   19300:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   19306:	45 29 ca             	sub    %r9d,%r10d
   19309:	45 85 c0             	test   %r8d,%r8d
   1930c:	4c 0f 49 d6          	cmovns %rsi,%r10
   19310:	89 d6                	mov    %edx,%esi
   19312:	09 fe                	or     %edi,%esi
   19314:	41 89 d1             	mov    %edx,%r9d
   19317:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1931e:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   19324:	45 29 cb             	sub    %r9d,%r11d
   19327:	85 d2                	test   %edx,%edx
   19329:	4c 0f 49 de          	cmovns %rsi,%r11
   1932d:	45 39 da             	cmp    %r11d,%r10d
   19330:	44 0f 47 c2          	cmova  %edx,%r8d
   19334:	89 ca                	mov    %ecx,%edx
   19336:	09 fa                	or     %edi,%edx
   19338:	89 ce                	mov    %ecx,%esi
   1933a:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   19340:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   19346:	41 29 f2             	sub    %esi,%r10d
   19349:	85 c9                	test   %ecx,%ecx
   1934b:	4c 0f 49 d2          	cmovns %rdx,%r10
   1934f:	44 89 c2             	mov    %r8d,%edx
   19352:	09 fa                	or     %edi,%edx
   19354:	44 89 c6             	mov    %r8d,%esi
   19357:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1935d:	29 f7                	sub    %esi,%edi
   1935f:	45 85 c0             	test   %r8d,%r8d
   19362:	48 0f 49 fa          	cmovns %rdx,%rdi
   19366:	45 31 c9             	xor    %r9d,%r9d
   19369:	41 39 fa             	cmp    %edi,%r10d
   1936c:	41 0f 96 c1          	setbe  %r9b
   19370:	5b                   	pop    %rbx
   19371:	44 89 08             	mov    %r9d,(%rax)
   19374:	89 48 04             	mov    %ecx,0x4(%rax)
   19377:	44 89 40 08          	mov    %r8d,0x8(%rax)
   1937b:	c3                   	ret
   1937c:	44 89 08             	mov    %r9d,(%rax)
   1937f:	89 48 04             	mov    %ecx,0x4(%rax)
   19382:	44 89 40 08          	mov    %r8d,0x8(%rax)
   19386:	c3                   	ret
   19387:	cc                   	int3
   19388:	cc                   	int3
   19389:	cc                   	int3
   1938a:	cc                   	int3
   1938b:	cc                   	int3
   1938c:	cc                   	int3
   1938d:	cc                   	int3
   1938e:	cc                   	int3
   1938f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::contains_point:
   19390:	41 56                	push   %r14
   19392:	53                   	push   %rbx
   19393:	48 83 ec 18          	sub    $0x18,%rsp
   19397:	48 89 fb             	mov    %rdi,%rbx
   1939a:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   193a0:	66 0f 7e c1          	movd   %xmm0,%ecx
   193a4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   193a9:	be 00 00 00 80       	mov    $0x80000000,%esi
   193ae:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   193b3:	e8 78 32 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   193b8:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   193bd:	3c 01                	cmp    $0x1,%al
   193bf:	75 0d                	jne    193ce <<hyperinterval::float::F32Enclosure>::contains_point+0x3e>
   193c1:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   193c6:	48 83 c4 18          	add    $0x18,%rsp
   193ca:	5b                   	pop    %rbx
   193cb:	41 5e                	pop    %r14
   193cd:	c3                   	ret
   193ce:	f6 03 01             	testb  $0x1,(%rbx)
   193d1:	74 44                	je     19417 <<hyperinterval::float::F32Enclosure>::contains_point+0x87>
   193d3:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   193d8:	8b 73 04             	mov    0x4(%rbx),%esi
   193db:	89 d1                	mov    %edx,%ecx
   193dd:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   193e3:	89 f7                	mov    %esi,%edi
   193e5:	44 09 f7             	or     %r14d,%edi
   193e8:	41 89 f0             	mov    %esi,%r8d
   193eb:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   193f2:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   193f8:	45 29 c1             	sub    %r8d,%r9d
   193fb:	85 f6                	test   %esi,%esi
   193fd:	4c 0f 49 cf          	cmovns %rdi,%r9
   19401:	be 00 00 00 80       	mov    $0x80000000,%esi
   19406:	48 29 ce             	sub    %rcx,%rsi
   19409:	4c 09 f1             	or     %r14,%rcx
   1940c:	85 d2                	test   %edx,%edx
   1940e:	48 0f 48 ce          	cmovs  %rsi,%rcx
   19412:	41 39 c9             	cmp    %ecx,%r9d
   19415:	76 0a                	jbe    19421 <<hyperinterval::float::F32Enclosure>::contains_point+0x91>
   19417:	31 d2                	xor    %edx,%edx
   19419:	48 83 c4 18          	add    $0x18,%rsp
   1941d:	5b                   	pop    %rbx
   1941e:	41 5e                	pop    %r14
   19420:	c3                   	ret
   19421:	8b 53 08             	mov    0x8(%rbx),%edx
   19424:	89 d6                	mov    %edx,%esi
   19426:	44 09 f6             	or     %r14d,%esi
   19429:	89 d7                	mov    %edx,%edi
   1942b:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   19431:	41 29 fe             	sub    %edi,%r14d
   19434:	85 d2                	test   %edx,%edx
   19436:	4c 0f 49 f6          	cmovns %rsi,%r14
   1943a:	44 39 f1             	cmp    %r14d,%ecx
   1943d:	0f 96 c2             	setbe  %dl
   19440:	48 83 c4 18          	add    $0x18,%rsp
   19444:	5b                   	pop    %rbx
   19445:	41 5e                	pop    %r14
   19447:	c3                   	ret
   19448:	cc                   	int3
   19449:	cc                   	int3
   1944a:	cc                   	int3
   1944b:	cc                   	int3
   1944c:	cc                   	int3
   1944d:	cc                   	int3
   1944e:	cc                   	int3
   1944f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::interior_subset_of:
   19450:	b0 01                	mov    $0x1,%al
   19452:	f6 07 01             	testb  $0x1,(%rdi)
   19455:	0f 84 8e 00 00 00    	je     194e9 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x99>
   1945b:	f6 06 01             	testb  $0x1,(%rsi)
   1945e:	0f 84 83 00 00 00    	je     194e7 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x97>
   19464:	8b 4f 04             	mov    0x4(%rdi),%ecx
   19467:	8b 56 04             	mov    0x4(%rsi),%edx
   1946a:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1946f:	44 8d 04 02          	lea    (%rdx,%rax,1),%r8d
   19473:	41 89 d1             	mov    %edx,%r9d
   19476:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1947d:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   19483:	45 29 ca             	sub    %r9d,%r10d
   19486:	85 d2                	test   %edx,%edx
   19488:	4d 0f 49 d0          	cmovns %r8,%r10
   1948c:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1948f:	41 89 c8             	mov    %ecx,%r8d
   19492:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   19499:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1949f:	45 29 c1             	sub    %r8d,%r9d
   194a2:	85 c9                	test   %ecx,%ecx
   194a4:	4c 0f 49 ca          	cmovns %rdx,%r9
   194a8:	45 39 ca             	cmp    %r9d,%r10d
   194ab:	73 3a                	jae    194e7 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x97>
   194ad:	8b 4f 08             	mov    0x8(%rdi),%ecx
   194b0:	8b 56 08             	mov    0x8(%rsi),%edx
   194b3:	8d 34 01             	lea    (%rcx,%rax,1),%esi
   194b6:	89 cf                	mov    %ecx,%edi
   194b8:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   194be:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   194c4:	41 29 f8             	sub    %edi,%r8d
   194c7:	85 c9                	test   %ecx,%ecx
   194c9:	4c 0f 49 c6          	cmovns %rsi,%r8
   194cd:	8d 0c 02             	lea    (%rdx,%rax,1),%ecx
   194d0:	89 d6                	mov    %edx,%esi
   194d2:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   194d8:	29 f0                	sub    %esi,%eax
   194da:	85 d2                	test   %edx,%edx
   194dc:	48 0f 49 c1          	cmovns %rcx,%rax
   194e0:	41 39 c0             	cmp    %eax,%r8d
   194e3:	0f 92 c0             	setb   %al
   194e6:	c3                   	ret
   194e7:	31 c0                	xor    %eax,%eax
   194e9:	c3                   	ret
   194ea:	cc                   	int3
   194eb:	cc                   	int3
   194ec:	cc                   	int3
   194ed:	cc                   	int3
   194ee:	cc                   	int3
   194ef:	cc                   	int3

<hyperinterval::float::F32Enclosure>::abs:
   194f0:	48 89 f8             	mov    %rdi,%rax
   194f3:	f6 06 01             	testb  $0x1,(%rsi)
   194f6:	74 24                	je     1951c <<hyperinterval::float::F32Enclosure>::abs+0x2c>
   194f8:	8b 4e 04             	mov    0x4(%rsi),%ecx
   194fb:	85 c9                	test   %ecx,%ecx
   194fd:	0f 99 c2             	setns  %dl
   19500:	f7 c1 ff ff ff 7f    	test   $0x7fffffff,%ecx
   19506:	40 0f 94 c7          	sete   %dil
   1950a:	40 08 d7             	or     %dl,%dil
   1950d:	74 14                	je     19523 <<hyperinterval::float::F32Enclosure>::abs+0x33>
   1950f:	8b 4e 08             	mov    0x8(%rsi),%ecx
   19512:	89 48 08             	mov    %ecx,0x8(%rax)
   19515:	48 8b 0e             	mov    (%rsi),%rcx
   19518:	48 89 08             	mov    %rcx,(%rax)
   1951b:	c3                   	ret
   1951c:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   19522:	c3                   	ret
   19523:	8b 56 08             	mov    0x8(%rsi),%edx
   19526:	85 d2                	test   %edx,%edx
   19528:	40 0f 98 c7          	sets   %dil
   1952c:	48 89 d6             	mov    %rdx,%rsi
   1952f:	48 81 e6 ff ff ff 7f 	and    $0x7fffffff,%rsi
   19536:	41 0f 95 c0          	setne  %r8b
   1953a:	44 84 c7             	test   %r8b,%dil
   1953d:	74 19                	je     19558 <<hyperinterval::float::F32Enclosure>::abs+0x68>
   1953f:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19545:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1954b:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   19551:	89 50 04             	mov    %edx,0x4(%rax)
   19554:	89 48 08             	mov    %ecx,0x8(%rax)
   19557:	c3                   	ret
   19558:	89 cf                	mov    %ecx,%edi
   1955a:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   19560:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   19566:	46 8d 0c 02          	lea    (%rdx,%r8,1),%r9d
   1956a:	41 29 f0             	sub    %esi,%r8d
   1956d:	85 d2                	test   %edx,%edx
   1956f:	4d 0f 49 c1          	cmovns %r9,%r8
   19573:	41 39 c8             	cmp    %ecx,%r8d
   19576:	0f 43 fa             	cmovae %edx,%edi
   19579:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   19580:	89 78 08             	mov    %edi,0x8(%rax)
   19583:	c3                   	ret
   19584:	cc                   	int3
   19585:	cc                   	int3
   19586:	cc                   	int3
   19587:	cc                   	int3
   19588:	cc                   	int3
   19589:	cc                   	int3
   1958a:	cc                   	int3
   1958b:	cc                   	int3
   1958c:	cc                   	int3
   1958d:	cc                   	int3
   1958e:	cc                   	int3
   1958f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::add:
   19590:	48 89 f8             	mov    %rdi,%rax
   19593:	f6 06 01             	testb  $0x1,(%rsi)
   19596:	0f 84 d6 00 00 00    	je     19672 <<hyperinterval::float::F32Enclosure>::add+0xe2>
   1959c:	f6 02 01             	testb  $0x1,(%rdx)
   1959f:	0f 84 cd 00 00 00    	je     19672 <<hyperinterval::float::F32Enclosure>::add+0xe2>
   195a5:	41 57                	push   %r15
   195a7:	41 56                	push   %r14
   195a9:	41 55                	push   %r13
   195ab:	41 54                	push   %r12
   195ad:	53                   	push   %rbx
   195ae:	48 83 ec 20          	sub    $0x20,%rsp
   195b2:	49 89 c4             	mov    %rax,%r12
   195b5:	8b 5e 08             	mov    0x8(%rsi),%ebx
   195b8:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   195be:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   195c2:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   195c6:	8b 4e 04             	mov    0x4(%rsi),%ecx
   195c9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   195ce:	be 00 00 00 80       	mov    $0x80000000,%esi
   195d3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   195d8:	e8 93 30 00 00       	call   1c670 <<hyperinterval::ieee::Format>::add>
   195dd:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   195e2:	74 6b                	je     1964f <<hyperinterval::float::F32Enclosure>::add+0xbf>
   195e4:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   195e9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   195ee:	be 00 00 00 80       	mov    $0x80000000,%esi
   195f3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   195f8:	48 89 d9             	mov    %rbx,%rcx
   195fb:	4d 89 f0             	mov    %r14,%r8
   195fe:	e8 6d 30 00 00       	call   1c670 <<hyperinterval::ieee::Format>::add>
   19603:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19608:	74 45                	je     1964f <<hyperinterval::float::F32Enclosure>::add+0xbf>
   1960a:	8b 5c 24 18          	mov    0x18(%rsp),%ebx
   1960e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19613:	be 00 00 00 80       	mov    $0x80000000,%esi
   19618:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1961d:	4c 89 f9             	mov    %r15,%rcx
   19620:	e8 0b 30 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   19625:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1962a:	74 23                	je     1964f <<hyperinterval::float::F32Enclosure>::add+0xbf>
   1962c:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   19631:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19636:	be 00 00 00 80       	mov    $0x80000000,%esi
   1963b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19640:	48 89 d9             	mov    %rbx,%rcx
   19643:	e8 e8 2f 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   19648:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1964d:	75 2a                	jne    19679 <<hyperinterval::float::F32Enclosure>::add+0xe9>
   1964f:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   19654:	4c 89 e0             	mov    %r12,%rax
   19657:	41 88 4c 24 04       	mov    %cl,0x4(%r12)
   1965c:	41 c7 04 24 02 00 00 	movl   $0x2,(%r12)
   19663:	00 
   19664:	48 83 c4 20          	add    $0x20,%rsp
   19668:	5b                   	pop    %rbx
   19669:	41 5c                	pop    %r12
   1966b:	41 5d                	pop    %r13
   1966d:	41 5e                	pop    %r14
   1966f:	41 5f                	pop    %r15
   19671:	c3                   	ret
   19672:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   19678:	c3                   	ret
   19679:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   1967d:	44 89 f0             	mov    %r14d,%eax
   19680:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19685:	89 ca                	mov    %ecx,%edx
   19687:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1968d:	be 00 00 00 80       	mov    $0x80000000,%esi
   19692:	29 c6                	sub    %eax,%esi
   19694:	44 09 e8             	or     %r13d,%eax
   19697:	45 85 f6             	test   %r14d,%r14d
   1969a:	48 0f 49 f0          	cmovns %rax,%rsi
   1969e:	89 d0                	mov    %edx,%eax
   196a0:	44 09 e8             	or     %r13d,%eax
   196a3:	41 29 d5             	sub    %edx,%r13d
   196a6:	85 c9                	test   %ecx,%ecx
   196a8:	4c 0f 49 e8          	cmovns %rax,%r13
   196ac:	44 39 ee             	cmp    %r13d,%esi
   196af:	4c 89 e0             	mov    %r12,%rax
   196b2:	76 0c                	jbe    196c0 <<hyperinterval::float::F32Enclosure>::add+0x130>
   196b4:	c6 40 04 01          	movb   $0x1,0x4(%rax)
   196b8:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   196be:	eb a4                	jmp    19664 <<hyperinterval::float::F32Enclosure>::add+0xd4>
   196c0:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   196c6:	44 89 70 04          	mov    %r14d,0x4(%rax)
   196ca:	89 48 08             	mov    %ecx,0x8(%rax)
   196cd:	eb 95                	jmp    19664 <<hyperinterval::float::F32Enclosure>::add+0xd4>
   196cf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::div:
   196d0:	53                   	push   %rbx
   196d1:	48 89 fb             	mov    %rdi,%rbx
   196d4:	83 3a 01             	cmpl   $0x1,(%rdx)
   196d7:	75 1a                	jne    196f3 <<hyperinterval::float::F32Enclosure>::div+0x23>
   196d9:	83 7a 04 00          	cmpl   $0x0,0x4(%rdx)
   196dd:	7f 14                	jg     196f3 <<hyperinterval::float::F32Enclosure>::div+0x23>
   196df:	8b 42 08             	mov    0x8(%rdx),%eax
   196e2:	85 c0                	test   %eax,%eax
   196e4:	0f 99 c1             	setns  %cl
   196e7:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   196ec:	0f 94 c0             	sete   %al
   196ef:	08 c8                	or     %cl,%al
   196f1:	75 12                	jne    19705 <<hyperinterval::float::F32Enclosure>::div+0x35>
   196f3:	48 89 df             	mov    %rbx,%rdi
   196f6:	b9 01 00 00 00       	mov    $0x1,%ecx
   196fb:	e8 20 f5 ff ff       	call   18c20 <<hyperinterval::float::F32Enclosure>::corner_image>
   19700:	48 89 d8             	mov    %rbx,%rax
   19703:	5b                   	pop    %rbx
   19704:	c3                   	ret
   19705:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
   19709:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1970f:	48 89 d8             	mov    %rbx,%rax
   19712:	5b                   	pop    %rbx
   19713:	c3                   	ret
   19714:	cc                   	int3
   19715:	cc                   	int3
   19716:	cc                   	int3
   19717:	cc                   	int3
   19718:	cc                   	int3
   19719:	cc                   	int3
   1971a:	cc                   	int3
   1971b:	cc                   	int3
   1971c:	cc                   	int3
   1971d:	cc                   	int3
   1971e:	cc                   	int3
   1971f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::new:
   19720:	41 57                	push   %r15
   19722:	41 56                	push   %r14
   19724:	53                   	push   %rbx
   19725:	48 83 ec 20          	sub    $0x20,%rsp
   19729:	f3 0f 11 4c 24 1c    	movss  %xmm1,0x1c(%rsp)
   1972f:	48 89 fb             	mov    %rdi,%rbx
   19732:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   19738:	66 0f 7e c1          	movd   %xmm0,%ecx
   1973c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19741:	be 00 00 00 80       	mov    $0x80000000,%esi
   19746:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1974b:	e8 e0 2e 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   19750:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19755:	74 2a                	je     19781 <<hyperinterval::float::F32Enclosure>::new+0x61>
   19757:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1975c:	66 0f 6e 44 24 1c    	movd   0x1c(%rsp),%xmm0
   19762:	66 0f 7e c1          	movd   %xmm0,%ecx
   19766:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1976b:	be 00 00 00 80       	mov    $0x80000000,%esi
   19770:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19775:	e8 b6 2e 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1977a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1977f:	75 1b                	jne    1979c <<hyperinterval::float::F32Enclosure>::new+0x7c>
   19781:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   19786:	88 43 04             	mov    %al,0x4(%rbx)
   19789:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1978f:	48 89 d8             	mov    %rbx,%rax
   19792:	48 83 c4 20          	add    $0x20,%rsp
   19796:	5b                   	pop    %rbx
   19797:	41 5e                	pop    %r14
   19799:	41 5f                	pop    %r15
   1979b:	c3                   	ret
   1979c:	8b 44 24 10          	mov    0x10(%rsp),%eax
   197a0:	44 89 f9             	mov    %r15d,%ecx
   197a3:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   197a9:	89 c2                	mov    %eax,%edx
   197ab:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   197b1:	be 00 00 00 80       	mov    $0x80000000,%esi
   197b6:	29 ce                	sub    %ecx,%esi
   197b8:	44 09 f1             	or     %r14d,%ecx
   197bb:	45 85 ff             	test   %r15d,%r15d
   197be:	48 0f 49 f1          	cmovns %rcx,%rsi
   197c2:	89 d1                	mov    %edx,%ecx
   197c4:	44 09 f1             	or     %r14d,%ecx
   197c7:	41 29 d6             	sub    %edx,%r14d
   197ca:	85 c0                	test   %eax,%eax
   197cc:	4c 0f 49 f1          	cmovns %rcx,%r14
   197d0:	44 39 f6             	cmp    %r14d,%esi
   197d3:	76 06                	jbe    197db <<hyperinterval::float::F32Enclosure>::new+0xbb>
   197d5:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   197d9:	eb ae                	jmp    19789 <<hyperinterval::float::F32Enclosure>::new+0x69>
   197db:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   197e1:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
   197e5:	89 43 08             	mov    %eax,0x8(%rbx)
   197e8:	eb a5                	jmp    1978f <<hyperinterval::float::F32Enclosure>::new+0x6f>
   197ea:	cc                   	int3
   197eb:	cc                   	int3
   197ec:	cc                   	int3
   197ed:	cc                   	int3
   197ee:	cc                   	int3
   197ef:	cc                   	int3

<hyperinterval::float::F32Enclosure>::sub:
   197f0:	53                   	push   %rbx
   197f1:	48 83 ec 10          	sub    $0x10,%rsp
   197f5:	48 89 fb             	mov    %rdi,%rbx
   197f8:	f6 02 01             	testb  $0x1,(%rdx)
   197fb:	74 29                	je     19826 <<hyperinterval::float::F32Enclosure>::sub+0x36>
   197fd:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   19802:	66 0f ef c9          	pxor   %xmm1,%xmm1
   19806:	66 0f 6f 15 b2 c4 fe 	movdqa -0x13b4e(%rip),%xmm2        # 5cc0 <__abi_tag+0x59c4>
   1980d:	ff 
   1980e:	66 0f ef d0          	pxor   %xmm0,%xmm2
   19812:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   19816:	66 0f df ca          	pandn  %xmm2,%xmm1
   1981a:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   1981f:	b8 01 00 00 00       	mov    $0x1,%eax
   19824:	eb 02                	jmp    19828 <<hyperinterval::float::F32Enclosure>::sub+0x38>
   19826:	31 c0                	xor    %eax,%eax
   19828:	89 44 24 04          	mov    %eax,0x4(%rsp)
   1982c:	66 0f d6 44 24 08    	movq   %xmm0,0x8(%rsp)
   19832:	48 8d 54 24 04       	lea    0x4(%rsp),%rdx
   19837:	48 89 df             	mov    %rbx,%rdi
   1983a:	ff 15 e8 3d 04 00    	call   *0x43de8(%rip)        # 5d628 <_DYNAMIC+0x2d0>
   19840:	48 89 d8             	mov    %rbx,%rax
   19843:	48 83 c4 10          	add    $0x10,%rsp
   19847:	5b                   	pop    %rbx
   19848:	c3                   	ret
   19849:	cc                   	int3
   1984a:	cc                   	int3
   1984b:	cc                   	int3
   1984c:	cc                   	int3
   1984d:	cc                   	int3
   1984e:	cc                   	int3
   1984f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::hull:
   19850:	48 89 f8             	mov    %rdi,%rax
   19853:	44 8b 0e             	mov    (%rsi),%r9d
   19856:	44 8b 02             	mov    (%rdx),%r8d
   19859:	8b 7a 04             	mov    0x4(%rdx),%edi
   1985c:	8b 4a 08             	mov    0x8(%rdx),%ecx
   1985f:	41 f6 c1 01          	test   $0x1,%r9b
   19863:	0f 84 9b 00 00 00    	je     19904 <<hyperinterval::float::F32Enclosure>::hull+0xb4>
   19869:	8b 56 04             	mov    0x4(%rsi),%edx
   1986c:	8b 76 08             	mov    0x8(%rsi),%esi
   1986f:	41 f6 c0 01          	test   $0x1,%r8b
   19873:	0f 84 95 00 00 00    	je     1990e <<hyperinterval::float::F32Enclosure>::hull+0xbe>
   19879:	53                   	push   %rbx
   1987a:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   19880:	46 8d 0c 02          	lea    (%rdx,%r8,1),%r9d
   19884:	41 89 d2             	mov    %edx,%r10d
   19887:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1988e:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   19894:	45 29 d3             	sub    %r10d,%r11d
   19897:	85 d2                	test   %edx,%edx
   19899:	4d 0f 49 d9          	cmovns %r9,%r11
   1989d:	46 8d 0c 07          	lea    (%rdi,%r8,1),%r9d
   198a1:	41 89 fa             	mov    %edi,%r10d
   198a4:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   198ab:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   198b0:	44 29 d3             	sub    %r10d,%ebx
   198b3:	85 ff                	test   %edi,%edi
   198b5:	49 0f 49 d9          	cmovns %r9,%rbx
   198b9:	41 39 db             	cmp    %ebx,%r11d
   198bc:	0f 47 d7             	cmova  %edi,%edx
   198bf:	42 8d 3c 06          	lea    (%rsi,%r8,1),%edi
   198c3:	41 89 f1             	mov    %esi,%r9d
   198c6:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   198cd:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   198d3:	45 29 ca             	sub    %r9d,%r10d
   198d6:	85 f6                	test   %esi,%esi
   198d8:	4c 0f 49 d7          	cmovns %rdi,%r10
   198dc:	42 8d 3c 01          	lea    (%rcx,%r8,1),%edi
   198e0:	41 89 c9             	mov    %ecx,%r9d
   198e3:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   198ea:	45 29 c8             	sub    %r9d,%r8d
   198ed:	85 c9                	test   %ecx,%ecx
   198ef:	4c 0f 49 c7          	cmovns %rdi,%r8
   198f3:	45 39 c2             	cmp    %r8d,%r10d
   198f6:	0f 42 f1             	cmovb  %ecx,%esi
   198f9:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   198ff:	89 f1                	mov    %esi,%ecx
   19901:	89 d7                	mov    %edx,%edi
   19903:	5b                   	pop    %rbx
   19904:	44 89 00             	mov    %r8d,(%rax)
   19907:	89 78 04             	mov    %edi,0x4(%rax)
   1990a:	89 48 08             	mov    %ecx,0x8(%rax)
   1990d:	c3                   	ret
   1990e:	89 f1                	mov    %esi,%ecx
   19910:	89 d7                	mov    %edx,%edi
   19912:	45 89 c8             	mov    %r9d,%r8d
   19915:	44 89 00             	mov    %r8d,(%rax)
   19918:	89 78 04             	mov    %edi,0x4(%rax)
   1991b:	89 48 08             	mov    %ecx,0x8(%rax)
   1991e:	c3                   	ret
   1991f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::sqrt:
   19920:	48 89 f8             	mov    %rdi,%rax
   19923:	f6 06 01             	testb  $0x1,(%rsi)
   19926:	74 2c                	je     19954 <<hyperinterval::float::F32Enclosure>::sqrt+0x34>
   19928:	55                   	push   %rbp
   19929:	41 57                	push   %r15
   1992b:	41 56                	push   %r14
   1992d:	41 55                	push   %r13
   1992f:	41 54                	push   %r12
   19931:	53                   	push   %rbx
   19932:	48 83 ec 18          	sub    $0x18,%rsp
   19936:	8b 5e 08             	mov    0x8(%rsi),%ebx
   19939:	85 db                	test   %ebx,%ebx
   1993b:	0f 98 c1             	sets   %cl
   1993e:	f7 c3 ff ff ff 7f    	test   $0x7fffffff,%ebx
   19944:	0f 95 c2             	setne  %dl
   19947:	84 d1                	test   %dl,%cl
   19949:	74 14                	je     1995f <<hyperinterval::float::F32Enclosure>::sqrt+0x3f>
   1994b:	c6 40 04 05          	movb   $0x5,0x4(%rax)
   1994f:	e9 ce 00 00 00       	jmp    19a22 <<hyperinterval::float::F32Enclosure>::sqrt+0x102>
   19954:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   1995a:	c6 40 0c 00          	movb   $0x0,0xc(%rax)
   1995e:	c3                   	ret
   1995f:	49 89 c7             	mov    %rax,%r15
   19962:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
   19966:	41 bc 00 00 00 80    	mov    $0x80000000,%r12d
   1996c:	45 85 ed             	test   %r13d,%r13d
   1996f:	0f 98 c0             	sets   %al
   19972:	41 f7 c5 ff ff ff 7f 	test   $0x7fffffff,%r13d
   19979:	40 0f 95 c5          	setne  %bpl
   1997d:	31 c9                	xor    %ecx,%ecx
   1997f:	40 20 c5             	and    %al,%bpl
   19982:	49 0f 44 cd          	cmove  %r13,%rcx
   19986:	48 89 e7             	mov    %rsp,%rdi
   19989:	be 00 00 00 80       	mov    $0x80000000,%esi
   1998e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19993:	e8 98 34 00 00       	call   1ce30 <<hyperinterval::ieee::Format>::sqrt>
   19998:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1999c:	74 15                	je     199b3 <<hyperinterval::float::F32Enclosure>::sqrt+0x93>
   1999e:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   199a3:	4c 89 f8             	mov    %r15,%rax
   199a6:	41 88 4f 04          	mov    %cl,0x4(%r15)
   199aa:	41 c7 07 02 00 00 00 	movl   $0x2,(%r15)
   199b1:	eb 75                	jmp    19a28 <<hyperinterval::float::F32Enclosure>::sqrt+0x108>
   199b3:	44 8b 74 24 08       	mov    0x8(%rsp),%r14d
   199b8:	41 39 dd             	cmp    %ebx,%r13d
   199bb:	74 1b                	je     199d8 <<hyperinterval::float::F32Enclosure>::sqrt+0xb8>
   199bd:	48 89 e7             	mov    %rsp,%rdi
   199c0:	be 00 00 00 80       	mov    $0x80000000,%esi
   199c5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   199ca:	48 89 d9             	mov    %rbx,%rcx
   199cd:	e8 5e 34 00 00       	call   1ce30 <<hyperinterval::ieee::Format>::sqrt>
   199d2:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   199d6:	74 c6                	je     1999e <<hyperinterval::float::F32Enclosure>::sqrt+0x7e>
   199d8:	8b 5c 24 10          	mov    0x10(%rsp),%ebx
   199dc:	48 89 e7             	mov    %rsp,%rdi
   199df:	be 00 00 00 80       	mov    $0x80000000,%esi
   199e4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   199e9:	4c 89 f1             	mov    %r14,%rcx
   199ec:	e8 3f 2c 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   199f1:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   199f5:	74 20                	je     19a17 <<hyperinterval::float::F32Enclosure>::sqrt+0xf7>
   199f7:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   199fc:	48 89 e7             	mov    %rsp,%rdi
   199ff:	be 00 00 00 80       	mov    $0x80000000,%esi
   19a04:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19a09:	48 89 d9             	mov    %rbx,%rcx
   19a0c:	e8 1f 2c 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   19a11:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19a15:	75 20                	jne    19a37 <<hyperinterval::float::F32Enclosure>::sqrt+0x117>
   19a17:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   19a1c:	4c 89 f8             	mov    %r15,%rax
   19a1f:	88 50 04             	mov    %dl,0x4(%rax)
   19a22:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   19a28:	48 83 c4 18          	add    $0x18,%rsp
   19a2c:	5b                   	pop    %rbx
   19a2d:	41 5c                	pop    %r12
   19a2f:	41 5d                	pop    %r13
   19a31:	41 5e                	pop    %r14
   19a33:	41 5f                	pop    %r15
   19a35:	5d                   	pop    %rbp
   19a36:	c3                   	ret
   19a37:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   19a3b:	44 89 f0             	mov    %r14d,%eax
   19a3e:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19a43:	89 ca                	mov    %ecx,%edx
   19a45:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19a4b:	be 00 00 00 80       	mov    $0x80000000,%esi
   19a50:	29 c6                	sub    %eax,%esi
   19a52:	44 09 e0             	or     %r12d,%eax
   19a55:	45 85 f6             	test   %r14d,%r14d
   19a58:	48 0f 49 f0          	cmovns %rax,%rsi
   19a5c:	89 d0                	mov    %edx,%eax
   19a5e:	44 09 e0             	or     %r12d,%eax
   19a61:	41 29 d4             	sub    %edx,%r12d
   19a64:	85 c9                	test   %ecx,%ecx
   19a66:	4c 0f 49 e0          	cmovns %rax,%r12
   19a6a:	b2 01                	mov    $0x1,%dl
   19a6c:	44 39 e6             	cmp    %r12d,%esi
   19a6f:	4c 89 f8             	mov    %r15,%rax
   19a72:	77 ab                	ja     19a1f <<hyperinterval::float::F32Enclosure>::sqrt+0xff>
   19a74:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   19a7a:	44 89 70 04          	mov    %r14d,0x4(%rax)
   19a7e:	89 48 08             	mov    %ecx,0x8(%rax)
   19a81:	40 88 68 0c          	mov    %bpl,0xc(%rax)
   19a85:	eb a1                	jmp    19a28 <<hyperinterval::float::F32Enclosure>::sqrt+0x108>
   19a87:	cc                   	int3
   19a88:	cc                   	int3
   19a89:	cc                   	int3
   19a8a:	cc                   	int3
   19a8b:	cc                   	int3
   19a8c:	cc                   	int3
   19a8d:	cc                   	int3
   19a8e:	cc                   	int3
   19a8f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::point:
   19a90:	53                   	push   %rbx
   19a91:	48 83 ec 10          	sub    $0x10,%rsp
   19a95:	48 89 fb             	mov    %rdi,%rbx
   19a98:	66 0f 7e c1          	movd   %xmm0,%ecx
   19a9c:	48 89 e7             	mov    %rsp,%rdi
   19a9f:	be 00 00 00 80       	mov    $0x80000000,%esi
   19aa4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19aa9:	e8 82 2b 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   19aae:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19ab2:	75 0f                	jne    19ac3 <<hyperinterval::float::F32Enclosure>::point+0x33>
   19ab4:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   19ab9:	88 43 04             	mov    %al,0x4(%rbx)
   19abc:	b8 02 00 00 00       	mov    $0x2,%eax
   19ac1:	eb 0f                	jmp    19ad2 <<hyperinterval::float::F32Enclosure>::point+0x42>
   19ac3:	8b 44 24 08          	mov    0x8(%rsp),%eax
   19ac7:	89 43 04             	mov    %eax,0x4(%rbx)
   19aca:	89 43 08             	mov    %eax,0x8(%rbx)
   19acd:	b8 01 00 00 00       	mov    $0x1,%eax
   19ad2:	89 03                	mov    %eax,(%rbx)
   19ad4:	48 89 d8             	mov    %rbx,%rax
   19ad7:	48 83 c4 10          	add    $0x10,%rsp
   19adb:	5b                   	pop    %rbx
   19adc:	c3                   	ret
   19add:	cc                   	int3
   19ade:	cc                   	int3
   19adf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::signs:
   19ae0:	83 3f 01             	cmpl   $0x1,(%rdi)
   19ae3:	75 65                	jne    19b4a <<hyperinterval::float::F32Enclosure>::signs+0x6a>
   19ae5:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   19aea:	8b 57 04             	mov    0x4(%rdi),%edx
   19aed:	8b 47 08             	mov    0x8(%rdi),%eax
   19af0:	48 89 d6             	mov    %rdx,%rsi
   19af3:	48 09 ce             	or     %rcx,%rsi
   19af6:	41 89 d0             	mov    %edx,%r8d
   19af9:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   19b00:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19b05:	4c 29 c7             	sub    %r8,%rdi
   19b08:	85 d2                	test   %edx,%edx
   19b0a:	48 0f 49 fe          	cmovns %rsi,%rdi
   19b0e:	31 f6                	xor    %esi,%esi
   19b10:	f7 c7 00 00 00 80    	test   $0x80000000,%edi
   19b16:	0f 94 c2             	sete   %dl
   19b19:	48 39 cf             	cmp    %rcx,%rdi
   19b1c:	77 1d                	ja     19b3b <<hyperinterval::float::F32Enclosure>::signs+0x5b>
   19b1e:	39 cf                	cmp    %ecx,%edi
   19b20:	0f 92 c1             	setb   %cl
   19b23:	80 c9 02             	or     $0x2,%cl
   19b26:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   19b2b:	0f b6 c9             	movzbl %cl,%ecx
   19b2e:	40 88 d6             	mov    %dl,%sil
   19b31:	0f 44 f1             	cmove  %ecx,%esi
   19b34:	85 c0                	test   %eax,%eax
   19b36:	0f 49 f1             	cmovns %ecx,%esi
   19b39:	89 f2                	mov    %esi,%edx
   19b3b:	8d 4a 04             	lea    0x4(%rdx),%ecx
   19b3e:	85 c0                	test   %eax,%eax
   19b40:	0f b6 d2             	movzbl %dl,%edx
   19b43:	0f b6 c1             	movzbl %cl,%eax
   19b46:	0f 4e c2             	cmovle %edx,%eax
   19b49:	c3                   	ret
   19b4a:	31 c0                	xor    %eax,%eax
   19b4c:	c3                   	ret
   19b4d:	cc                   	int3
   19b4e:	cc                   	int3
   19b4f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::affine:
   19b50:	55                   	push   %rbp
   19b51:	41 57                	push   %r15
   19b53:	41 56                	push   %r14
   19b55:	41 55                	push   %r13
   19b57:	41 54                	push   %r12
   19b59:	53                   	push   %rbx
   19b5a:	48 83 ec 28          	sub    $0x28,%rsp
   19b5e:	f3 0f 11 4c 24 20    	movss  %xmm1,0x20(%rsp)
   19b64:	49 89 f7             	mov    %rsi,%r15
   19b67:	48 89 fb             	mov    %rdi,%rbx
   19b6a:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   19b70:	66 0f 7e c1          	movd   %xmm0,%ecx
   19b74:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19b79:	be 00 00 00 80       	mov    $0x80000000,%esi
   19b7e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19b83:	e8 a8 2a 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   19b88:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19b8d:	74 2a                	je     19bb9 <<hyperinterval::float::F32Enclosure>::affine+0x69>
   19b8f:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   19b94:	66 0f 6e 44 24 20    	movd   0x20(%rsp),%xmm0
   19b9a:	66 0f 7e c1          	movd   %xmm0,%ecx
   19b9e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19ba3:	be 00 00 00 80       	mov    $0x80000000,%esi
   19ba8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19bad:	e8 7e 2a 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   19bb2:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19bb7:	75 20                	jne    19bd9 <<hyperinterval::float::F32Enclosure>::affine+0x89>
   19bb9:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   19bbe:	88 43 04             	mov    %al,0x4(%rbx)
   19bc1:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19bc7:	48 89 d8             	mov    %rbx,%rax
   19bca:	48 83 c4 28          	add    $0x28,%rsp
   19bce:	5b                   	pop    %rbx
   19bcf:	41 5c                	pop    %r12
   19bd1:	41 5d                	pop    %r13
   19bd3:	41 5e                	pop    %r14
   19bd5:	41 5f                	pop    %r15
   19bd7:	5d                   	pop    %rbp
   19bd8:	c3                   	ret
   19bd9:	41 f6 07 01          	testb  $0x1,(%r15)
   19bdd:	0f 84 19 01 00 00    	je     19cfc <<hyperinterval::float::F32Enclosure>::affine+0x1ac>
   19be3:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   19be8:	41 8b 4f 04          	mov    0x4(%r15),%ecx
   19bec:	45 8b 7f 08          	mov    0x8(%r15),%r15d
   19bf0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19bf5:	be 00 00 00 80       	mov    $0x80000000,%esi
   19bfa:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19bff:	4d 89 f0             	mov    %r14,%r8
   19c02:	4d 89 e1             	mov    %r12,%r9
   19c05:	e8 36 3d 00 00       	call   1d940 <<hyperinterval::ieee::Format>::affine>
   19c0a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19c0f:	74 a8                	je     19bb9 <<hyperinterval::float::F32Enclosure>::affine+0x69>
   19c11:	8b 6c 24 10          	mov    0x10(%rsp),%ebp
   19c15:	8b 44 24 18          	mov    0x18(%rsp),%eax
   19c19:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   19c1e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19c23:	be 00 00 00 80       	mov    $0x80000000,%esi
   19c28:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19c2d:	4c 89 f9             	mov    %r15,%rcx
   19c30:	4d 89 f0             	mov    %r14,%r8
   19c33:	4d 89 e1             	mov    %r12,%r9
   19c36:	e8 05 3d 00 00       	call   1d940 <<hyperinterval::ieee::Format>::affine>
   19c3b:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19c40:	0f 84 73 ff ff ff    	je     19bb9 <<hyperinterval::float::F32Enclosure>::affine+0x69>
   19c46:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   19c4b:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
   19c50:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19c55:	be 00 00 00 80       	mov    $0x80000000,%esi
   19c5a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19c5f:	48 89 e9             	mov    %rbp,%rcx
   19c62:	e8 c9 29 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   19c67:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19c6c:	0f 84 47 ff ff ff    	je     19bb9 <<hyperinterval::float::F32Enclosure>::affine+0x69>
   19c72:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   19c77:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19c7c:	be 00 00 00 80       	mov    $0x80000000,%esi
   19c81:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19c86:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   19c8b:	e8 a0 29 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   19c90:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19c95:	0f 84 1e ff ff ff    	je     19bb9 <<hyperinterval::float::F32Enclosure>::affine+0x69>
   19c9b:	8b 6c 24 10          	mov    0x10(%rsp),%ebp
   19c9f:	44 89 f0             	mov    %r14d,%eax
   19ca2:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19ca7:	89 e9                	mov    %ebp,%ecx
   19ca9:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19caf:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19cb4:	29 c2                	sub    %eax,%edx
   19cb6:	44 09 e8             	or     %r13d,%eax
   19cb9:	45 85 f6             	test   %r14d,%r14d
   19cbc:	48 0f 49 d0          	cmovns %rax,%rdx
   19cc0:	89 c8                	mov    %ecx,%eax
   19cc2:	44 09 e8             	or     %r13d,%eax
   19cc5:	41 29 cd             	sub    %ecx,%r13d
   19cc8:	85 ed                	test   %ebp,%ebp
   19cca:	4c 0f 49 e8          	cmovns %rax,%r13
   19cce:	b0 01                	mov    $0x1,%al
   19cd0:	44 39 ea             	cmp    %r13d,%edx
   19cd3:	0f 87 e5 fe ff ff    	ja     19bbe <<hyperinterval::float::F32Enclosure>::affine+0x6e>
   19cd9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19cde:	4c 89 fe             	mov    %r15,%rsi
   19ce1:	4c 89 e2             	mov    %r12,%rdx
   19ce4:	e8 37 06 00 00       	call   1a320 <<hyperinterval::float::F32Enclosure>::from_bits>
   19ce9:	8b 44 24 08          	mov    0x8(%rsp),%eax
   19ced:	83 f8 02             	cmp    $0x2,%eax
   19cf0:	75 15                	jne    19d07 <<hyperinterval::float::F32Enclosure>::affine+0x1b7>
   19cf2:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   19cf7:	e9 c2 fe ff ff       	jmp    19bbe <<hyperinterval::float::F32Enclosure>::affine+0x6e>
   19cfc:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   19d02:	e9 c0 fe ff ff       	jmp    19bc7 <<hyperinterval::float::F32Enclosure>::affine+0x77>
   19d07:	83 f8 01             	cmp    $0x1,%eax
   19d0a:	75 17                	jne    19d23 <<hyperinterval::float::F32Enclosure>::affine+0x1d3>
   19d0c:	8b 54 24 0c          	mov    0xc(%rsp),%edx
   19d10:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   19d14:	44 89 f7             	mov    %r14d,%edi
   19d17:	89 ee                	mov    %ebp,%esi
   19d19:	e8 32 43 00 00       	call   1e050 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   19d1e:	41 89 c6             	mov    %eax,%r14d
   19d21:	89 d5                	mov    %edx,%ebp
   19d23:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   19d29:	44 89 73 04          	mov    %r14d,0x4(%rbx)
   19d2d:	89 6b 08             	mov    %ebp,0x8(%rbx)
   19d30:	e9 92 fe ff ff       	jmp    19bc7 <<hyperinterval::float::F32Enclosure>::affine+0x77>
   19d35:	cc                   	int3
   19d36:	cc                   	int3
   19d37:	cc                   	int3
   19d38:	cc                   	int3
   19d39:	cc                   	int3
   19d3a:	cc                   	int3
   19d3b:	cc                   	int3
   19d3c:	cc                   	int3
   19d3d:	cc                   	int3
   19d3e:	cc                   	int3
   19d3f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::square:
   19d40:	55                   	push   %rbp
   19d41:	41 57                	push   %r15
   19d43:	41 56                	push   %r14
   19d45:	41 55                	push   %r13
   19d47:	41 54                	push   %r12
   19d49:	53                   	push   %rbx
   19d4a:	48 83 ec 48          	sub    $0x48,%rsp
   19d4e:	48 89 fb             	mov    %rdi,%rbx
   19d51:	f6 06 01             	testb  $0x1,(%rsi)
   19d54:	0f 84 d8 00 00 00    	je     19e32 <<hyperinterval::float::F32Enclosure>::square+0xf2>
   19d5a:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
   19d5e:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   19d62:	44 89 f8             	mov    %r15d,%eax
   19d65:	c1 e8 17             	shr    $0x17,%eax
   19d68:	0f b6 c8             	movzbl %al,%ecx
   19d6b:	44 89 fa             	mov    %r15d,%edx
   19d6e:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
   19d74:	31 c0                	xor    %eax,%eax
   19d76:	85 c9                	test   %ecx,%ecx
   19d78:	8d 8c 09 d4 fe ff ff 	lea    -0x12c(%rcx,%rcx,1),%ecx
   19d7f:	41 bc d6 fe ff ff    	mov    $0xfffffed6,%r12d
   19d85:	41 0f 44 cc          	cmove  %r12d,%ecx
   19d89:	0f 95 c0             	setne  %al
   19d8c:	c1 e0 17             	shl    $0x17,%eax
   19d8f:	48 09 d0             	or     %rdx,%rax
   19d92:	48 f7 e0             	mul    %rax
   19d95:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   19d9a:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   19d9f:	48 89 04 24          	mov    %rax,(%rsp)
   19da3:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   19da7:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   19dac:	48 89 e1             	mov    %rsp,%rcx
   19daf:	be 00 00 00 80       	mov    $0x80000000,%esi
   19db4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19db9:	e8 72 3f 00 00       	call   1dd30 <<hyperinterval::ieee::Format>::rounded>
   19dbe:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   19dc3:	75 66                	jne    19e2b <<hyperinterval::float::F32Enclosure>::square+0xeb>
   19dc5:	44 8b 6c 24 38       	mov    0x38(%rsp),%r13d
   19dca:	8b 6c 24 40          	mov    0x40(%rsp),%ebp
   19dce:	44 89 f0             	mov    %r14d,%eax
   19dd1:	c1 e8 17             	shr    $0x17,%eax
   19dd4:	0f b6 c8             	movzbl %al,%ecx
   19dd7:	44 89 f2             	mov    %r14d,%edx
   19dda:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
   19de0:	31 c0                	xor    %eax,%eax
   19de2:	85 c9                	test   %ecx,%ecx
   19de4:	8d 8c 09 d4 fe ff ff 	lea    -0x12c(%rcx,%rcx,1),%ecx
   19deb:	41 0f 44 cc          	cmove  %r12d,%ecx
   19def:	0f 95 c0             	setne  %al
   19df2:	c1 e0 17             	shl    $0x17,%eax
   19df5:	48 09 d0             	or     %rdx,%rax
   19df8:	48 f7 e0             	mul    %rax
   19dfb:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   19e00:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   19e05:	48 89 04 24          	mov    %rax,(%rsp)
   19e09:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   19e0d:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   19e12:	48 89 e1             	mov    %rsp,%rcx
   19e15:	be 00 00 00 80       	mov    $0x80000000,%esi
   19e1a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19e1f:	e8 0c 3f 00 00       	call   1dd30 <<hyperinterval::ieee::Format>::rounded>
   19e24:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   19e29:	75 0f                	jne    19e3a <<hyperinterval::float::F32Enclosure>::square+0xfa>
   19e2b:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   19e30:	eb 59                	jmp    19e8b <<hyperinterval::float::F32Enclosure>::square+0x14b>
   19e32:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   19e38:	eb 5a                	jmp    19e94 <<hyperinterval::float::F32Enclosure>::square+0x154>
   19e3a:	8b 44 24 38          	mov    0x38(%rsp),%eax
   19e3e:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   19e43:	44 8b 64 24 40       	mov    0x40(%rsp),%r12d
   19e48:	48 89 e7             	mov    %rsp,%rdi
   19e4b:	be 00 00 00 80       	mov    $0x80000000,%esi
   19e50:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19e55:	4c 89 e9             	mov    %r13,%rcx
   19e58:	e8 d3 27 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   19e5d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19e61:	74 23                	je     19e86 <<hyperinterval::float::F32Enclosure>::square+0x146>
   19e63:	4d 89 e5             	mov    %r12,%r13
   19e66:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   19e6b:	48 89 e7             	mov    %rsp,%rdi
   19e6e:	be 00 00 00 80       	mov    $0x80000000,%esi
   19e73:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19e78:	48 89 e9             	mov    %rbp,%rcx
   19e7b:	e8 b0 27 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   19e80:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19e84:	75 20                	jne    19ea6 <<hyperinterval::float::F32Enclosure>::square+0x166>
   19e86:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   19e8b:	88 43 04             	mov    %al,0x4(%rbx)
   19e8e:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19e94:	48 89 d8             	mov    %rbx,%rax
   19e97:	48 83 c4 48          	add    $0x48,%rsp
   19e9b:	5b                   	pop    %rbx
   19e9c:	41 5c                	pop    %r12
   19e9e:	41 5d                	pop    %r13
   19ea0:	41 5e                	pop    %r14
   19ea2:	41 5f                	pop    %r15
   19ea4:	5d                   	pop    %rbp
   19ea5:	c3                   	ret
   19ea6:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   19eaa:	44 89 e0             	mov    %r12d,%eax
   19ead:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19eb2:	89 e9                	mov    %ebp,%ecx
   19eb4:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19eba:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19ebf:	29 c2                	sub    %eax,%edx
   19ec1:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19ec6:	09 f8                	or     %edi,%eax
   19ec8:	45 85 e4             	test   %r12d,%r12d
   19ecb:	48 0f 49 d0          	cmovns %rax,%rdx
   19ecf:	be 00 00 00 80       	mov    $0x80000000,%esi
   19ed4:	29 ce                	sub    %ecx,%esi
   19ed6:	89 c8                	mov    %ecx,%eax
   19ed8:	09 f8                	or     %edi,%eax
   19eda:	85 ed                	test   %ebp,%ebp
   19edc:	48 0f 49 f0          	cmovns %rax,%rsi
   19ee0:	b0 01                	mov    $0x1,%al
   19ee2:	39 f2                	cmp    %esi,%edx
   19ee4:	77 a5                	ja     19e8b <<hyperinterval::float::F32Enclosure>::square+0x14b>
   19ee6:	48 89 e7             	mov    %rsp,%rdi
   19ee9:	be 00 00 00 80       	mov    $0x80000000,%esi
   19eee:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19ef3:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   19ef8:	e8 33 27 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   19efd:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19f01:	74 83                	je     19e86 <<hyperinterval::float::F32Enclosure>::square+0x146>
   19f03:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19f08:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   19f0d:	48 89 e7             	mov    %rsp,%rdi
   19f10:	be 00 00 00 80       	mov    $0x80000000,%esi
   19f15:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19f1a:	4c 89 e9             	mov    %r13,%rcx
   19f1d:	e8 0e 27 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   19f22:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19f26:	0f 84 5a ff ff ff    	je     19e86 <<hyperinterval::float::F32Enclosure>::square+0x146>
   19f2c:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   19f30:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   19f35:	89 d0                	mov    %edx,%eax
   19f37:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19f3c:	41 89 c8             	mov    %ecx,%r8d
   19f3f:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   19f46:	be 00 00 00 80       	mov    $0x80000000,%esi
   19f4b:	29 c6                	sub    %eax,%esi
   19f4d:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19f52:	09 f8                	or     %edi,%eax
   19f54:	85 d2                	test   %edx,%edx
   19f56:	48 0f 49 f0          	cmovns %rax,%rsi
   19f5a:	44 89 c0             	mov    %r8d,%eax
   19f5d:	09 f8                	or     %edi,%eax
   19f5f:	44 29 c7             	sub    %r8d,%edi
   19f62:	85 c9                	test   %ecx,%ecx
   19f64:	48 0f 49 f8          	cmovns %rax,%rdi
   19f68:	b0 01                	mov    $0x1,%al
   19f6a:	39 fe                	cmp    %edi,%esi
   19f6c:	0f 87 19 ff ff ff    	ja     19e8b <<hyperinterval::float::F32Enclosure>::square+0x14b>
   19f72:	44 89 e7             	mov    %r12d,%edi
   19f75:	89 ee                	mov    %ebp,%esi
   19f77:	e8 d4 40 00 00       	call   1e050 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   19f7c:	41 89 c4             	mov    %eax,%r12d
   19f7f:	89 d5                	mov    %edx,%ebp
   19f81:	44 89 ff             	mov    %r15d,%edi
   19f84:	44 89 f6             	mov    %r14d,%esi
   19f87:	31 d2                	xor    %edx,%edx
   19f89:	e8 52 41 00 00       	call   1e0e0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::signs>
   19f8e:	a8 02                	test   $0x2,%al
   19f90:	75 12                	jne    19fa4 <<hyperinterval::float::F32Enclosure>::square+0x264>
   19f92:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   19f98:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   19f9c:	89 6b 08             	mov    %ebp,0x8(%rbx)
   19f9f:	e9 f0 fe ff ff       	jmp    19e94 <<hyperinterval::float::F32Enclosure>::square+0x154>
   19fa4:	48 89 e7             	mov    %rsp,%rdi
   19fa7:	31 f6                	xor    %esi,%esi
   19fa9:	31 d2                	xor    %edx,%edx
   19fab:	e8 70 03 00 00       	call   1a320 <<hyperinterval::float::F32Enclosure>::from_bits>
   19fb0:	8b 04 24             	mov    (%rsp),%eax
   19fb3:	83 f8 02             	cmp    $0x2,%eax
   19fb6:	75 0a                	jne    19fc2 <<hyperinterval::float::F32Enclosure>::square+0x282>
   19fb8:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   19fbd:	e9 c9 fe ff ff       	jmp    19e8b <<hyperinterval::float::F32Enclosure>::square+0x14b>
   19fc2:	83 f8 01             	cmp    $0x1,%eax
   19fc5:	75 cb                	jne    19f92 <<hyperinterval::float::F32Enclosure>::square+0x252>
   19fc7:	8b 54 24 04          	mov    0x4(%rsp),%edx
   19fcb:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   19fcf:	44 89 e7             	mov    %r12d,%edi
   19fd2:	89 ee                	mov    %ebp,%esi
   19fd4:	e8 77 40 00 00       	call   1e050 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   19fd9:	41 89 c4             	mov    %eax,%r12d
   19fdc:	89 d5                	mov    %edx,%ebp
   19fde:	eb b2                	jmp    19f92 <<hyperinterval::float::F32Enclosure>::square+0x252>

<hyperinterval::float::F32Enclosure>::next_up:
   19fe0:	48 83 ec 18          	sub    $0x18,%rsp
   19fe4:	66 0f 7e c1          	movd   %xmm0,%ecx
   19fe8:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19fed:	be 00 00 00 80       	mov    $0x80000000,%esi
   19ff2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19ff7:	e8 34 26 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   19ffc:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a001:	75 10                	jne    1a013 <<hyperinterval::float::F32Enclosure>::next_up+0x33>
   1a003:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1a008:	c1 e0 08             	shl    $0x8,%eax
   1a00b:	48 ff c0             	inc    %rax
   1a00e:	48 83 c4 18          	add    $0x18,%rsp
   1a012:	c3                   	ret
   1a013:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1a018:	31 c9                	xor    %ecx,%ecx
   1a01a:	85 c0                	test   %eax,%eax
   1a01c:	0f 99 c1             	setns  %cl
   1a01f:	48 8d 0c 48          	lea    (%rax,%rcx,2),%rcx
   1a023:	48 ff c9             	dec    %rcx
   1a026:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a02b:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a030:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a035:	e8 f6 25 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1a03a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a03f:	75 0a                	jne    1a04b <<hyperinterval::float::F32Enclosure>::next_up+0x6b>
   1a041:	b8 01 03 00 00       	mov    $0x301,%eax
   1a046:	48 83 c4 18          	add    $0x18,%rsp
   1a04a:	c3                   	ret
   1a04b:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1a050:	48 c1 e0 20          	shl    $0x20,%rax
   1a054:	48 83 c4 18          	add    $0x18,%rsp
   1a058:	c3                   	ret
   1a059:	cc                   	int3
   1a05a:	cc                   	int3
   1a05b:	cc                   	int3
   1a05c:	cc                   	int3
   1a05d:	cc                   	int3
   1a05e:	cc                   	int3
   1a05f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::disjoint:
   1a060:	83 3f 00             	cmpl   $0x0,(%rdi)
   1a063:	b0 01                	mov    $0x1,%al
   1a065:	0f 84 a3 00 00 00    	je     1a10e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   1a06b:	8b 0e                	mov    (%rsi),%ecx
   1a06d:	85 c9                	test   %ecx,%ecx
   1a06f:	0f 84 99 00 00 00    	je     1a10e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   1a075:	f6 c1 01             	test   $0x1,%cl
   1a078:	74 4c                	je     1a0c6 <<hyperinterval::float::F32Enclosure>::disjoint+0x66>
   1a07a:	53                   	push   %rbx
   1a07b:	8b 56 04             	mov    0x4(%rsi),%edx
   1a07e:	44 8b 47 08          	mov    0x8(%rdi),%r8d
   1a082:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1a088:	45 89 c2             	mov    %r8d,%r10d
   1a08b:	45 09 ca             	or     %r9d,%r10d
   1a08e:	45 89 c3             	mov    %r8d,%r11d
   1a091:	41 81 e3 ff ff ff 7f 	and    $0x7fffffff,%r11d
   1a098:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   1a09d:	44 29 db             	sub    %r11d,%ebx
   1a0a0:	45 85 c0             	test   %r8d,%r8d
   1a0a3:	49 0f 49 da          	cmovns %r10,%rbx
   1a0a7:	41 89 d0             	mov    %edx,%r8d
   1a0aa:	45 09 c8             	or     %r9d,%r8d
   1a0ad:	41 89 d2             	mov    %edx,%r10d
   1a0b0:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1a0b7:	45 29 d1             	sub    %r10d,%r9d
   1a0ba:	85 d2                	test   %edx,%edx
   1a0bc:	4d 0f 49 c8          	cmovns %r8,%r9
   1a0c0:	44 39 cb             	cmp    %r9d,%ebx
   1a0c3:	5b                   	pop    %rbx
   1a0c4:	72 48                	jb     1a10e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   1a0c6:	f6 c1 01             	test   $0x1,%cl
   1a0c9:	75 03                	jne    1a0ce <<hyperinterval::float::F32Enclosure>::disjoint+0x6e>
   1a0cb:	31 c0                	xor    %eax,%eax
   1a0cd:	c3                   	ret
   1a0ce:	8b 47 04             	mov    0x4(%rdi),%eax
   1a0d1:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1a0d4:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1a0d9:	89 ce                	mov    %ecx,%esi
   1a0db:	09 d6                	or     %edx,%esi
   1a0dd:	89 cf                	mov    %ecx,%edi
   1a0df:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1a0e5:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1a0eb:	41 29 f8             	sub    %edi,%r8d
   1a0ee:	85 c9                	test   %ecx,%ecx
   1a0f0:	4c 0f 49 c6          	cmovns %rsi,%r8
   1a0f4:	89 c1                	mov    %eax,%ecx
   1a0f6:	09 d1                	or     %edx,%ecx
   1a0f8:	89 c6                	mov    %eax,%esi
   1a0fa:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1a100:	29 f2                	sub    %esi,%edx
   1a102:	85 c0                	test   %eax,%eax
   1a104:	48 0f 49 d1          	cmovns %rcx,%rdx
   1a108:	41 39 d0             	cmp    %edx,%r8d
   1a10b:	0f 92 c0             	setb   %al
   1a10e:	c3                   	ret
   1a10f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::expanded:
   1a110:	41 57                	push   %r15
   1a112:	41 56                	push   %r14
   1a114:	41 54                	push   %r12
   1a116:	53                   	push   %rbx
   1a117:	48 83 ec 18          	sub    $0x18,%rsp
   1a11b:	48 89 fb             	mov    %rdi,%rbx
   1a11e:	f6 06 01             	testb  $0x1,(%rsi)
   1a121:	74 7c                	je     1a19f <<hyperinterval::float::F32Enclosure>::expanded+0x8f>
   1a123:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   1a129:	8b 46 04             	mov    0x4(%rsi),%eax
   1a12c:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   1a130:	8d 88 00 00 00 80    	lea    -0x80000000(%rax),%ecx
   1a136:	85 c0                	test   %eax,%eax
   1a138:	0f 44 c8             	cmove  %eax,%ecx
   1a13b:	31 c0                	xor    %eax,%eax
   1a13d:	85 c9                	test   %ecx,%ecx
   1a13f:	0f 99 c0             	setns  %al
   1a142:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
   1a146:	48 ff c9             	dec    %rcx
   1a149:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a14e:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a153:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a158:	e8 d3 24 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1a15d:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   1a162:	75 2f                	jne    1a193 <<hyperinterval::float::F32Enclosure>::expanded+0x83>
   1a164:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1a169:	31 c0                	xor    %eax,%eax
   1a16b:	45 85 f6             	test   %r14d,%r14d
   1a16e:	0f 99 c0             	setns  %al
   1a171:	49 8d 0c 46          	lea    (%r14,%rax,2),%rcx
   1a175:	48 ff c9             	dec    %rcx
   1a178:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a17d:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a182:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a187:	e8 a4 24 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1a18c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a191:	75 21                	jne    1a1b4 <<hyperinterval::float::F32Enclosure>::expanded+0xa4>
   1a193:	c6 43 04 03          	movb   $0x3,0x4(%rbx)
   1a197:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1a19d:	eb 06                	jmp    1a1a5 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   1a19f:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   1a1a5:	48 89 d8             	mov    %rbx,%rax
   1a1a8:	48 83 c4 18          	add    $0x18,%rsp
   1a1ac:	5b                   	pop    %rbx
   1a1ad:	41 5c                	pop    %r12
   1a1af:	41 5e                	pop    %r14
   1a1b1:	41 5f                	pop    %r15
   1a1b3:	c3                   	ret
   1a1b4:	44 89 e1             	mov    %r12d,%ecx
   1a1b7:	4c 31 f9             	xor    %r15,%rcx
   1a1ba:	4d 85 e4             	test   %r12,%r12
   1a1bd:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   1a1c2:	49 0f 44 cc          	cmove  %r12,%rcx
   1a1c6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a1cb:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a1d0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a1d5:	e8 56 24 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1a1da:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a1df:	74 23                	je     1a204 <<hyperinterval::float::F32Enclosure>::expanded+0xf4>
   1a1e1:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1a1e6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a1eb:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a1f0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a1f5:	4c 89 f1             	mov    %r14,%rcx
   1a1f8:	e8 33 24 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1a1fd:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a202:	75 10                	jne    1a214 <<hyperinterval::float::F32Enclosure>::expanded+0x104>
   1a204:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1a209:	88 43 04             	mov    %al,0x4(%rbx)
   1a20c:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1a212:	eb 91                	jmp    1a1a5 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   1a214:	8b 44 24 10          	mov    0x10(%rsp),%eax
   1a218:	44 89 e1             	mov    %r12d,%ecx
   1a21b:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1a221:	89 c2                	mov    %eax,%edx
   1a223:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1a229:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a22e:	29 ce                	sub    %ecx,%esi
   1a230:	44 09 f9             	or     %r15d,%ecx
   1a233:	45 85 e4             	test   %r12d,%r12d
   1a236:	48 0f 49 f1          	cmovns %rcx,%rsi
   1a23a:	89 d1                	mov    %edx,%ecx
   1a23c:	44 09 f9             	or     %r15d,%ecx
   1a23f:	41 29 d7             	sub    %edx,%r15d
   1a242:	85 c0                	test   %eax,%eax
   1a244:	4c 0f 49 f9          	cmovns %rcx,%r15
   1a248:	44 39 fe             	cmp    %r15d,%esi
   1a24b:	76 0f                	jbe    1a25c <<hyperinterval::float::F32Enclosure>::expanded+0x14c>
   1a24d:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   1a251:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1a257:	e9 49 ff ff ff       	jmp    1a1a5 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   1a25c:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   1a262:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   1a266:	89 43 08             	mov    %eax,0x8(%rbx)
   1a269:	e9 37 ff ff ff       	jmp    1a1a5 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   1a26e:	cc                   	int3
   1a26f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::overlaps:
   1a270:	31 c0                	xor    %eax,%eax
   1a272:	83 3f 00             	cmpl   $0x0,(%rdi)
   1a275:	0f 84 a1 00 00 00    	je     1a31c <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1a27b:	8b 0e                	mov    (%rsi),%ecx
   1a27d:	85 c9                	test   %ecx,%ecx
   1a27f:	0f 84 97 00 00 00    	je     1a31c <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1a285:	f6 c1 01             	test   $0x1,%cl
   1a288:	74 4b                	je     1a2d5 <<hyperinterval::float::F32Enclosure>::overlaps+0x65>
   1a28a:	8b 46 04             	mov    0x4(%rsi),%eax
   1a28d:	8b 57 08             	mov    0x8(%rdi),%edx
   1a290:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1a296:	41 89 d1             	mov    %edx,%r9d
   1a299:	45 09 c1             	or     %r8d,%r9d
   1a29c:	41 89 d2             	mov    %edx,%r10d
   1a29f:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1a2a6:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1a2ac:	45 29 d3             	sub    %r10d,%r11d
   1a2af:	85 d2                	test   %edx,%edx
   1a2b1:	4d 0f 49 d9          	cmovns %r9,%r11
   1a2b5:	89 c2                	mov    %eax,%edx
   1a2b7:	44 09 c2             	or     %r8d,%edx
   1a2ba:	41 89 c1             	mov    %eax,%r9d
   1a2bd:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1a2c4:	45 29 c8             	sub    %r9d,%r8d
   1a2c7:	85 c0                	test   %eax,%eax
   1a2c9:	4c 0f 49 c2          	cmovns %rdx,%r8
   1a2cd:	45 39 c3             	cmp    %r8d,%r11d
   1a2d0:	73 03                	jae    1a2d5 <<hyperinterval::float::F32Enclosure>::overlaps+0x65>
   1a2d2:	31 c0                	xor    %eax,%eax
   1a2d4:	c3                   	ret
   1a2d5:	b0 01                	mov    $0x1,%al
   1a2d7:	f6 c1 01             	test   $0x1,%cl
   1a2da:	74 40                	je     1a31c <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1a2dc:	8b 47 04             	mov    0x4(%rdi),%eax
   1a2df:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1a2e2:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1a2e7:	89 ce                	mov    %ecx,%esi
   1a2e9:	09 d6                	or     %edx,%esi
   1a2eb:	89 cf                	mov    %ecx,%edi
   1a2ed:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1a2f3:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1a2f9:	41 29 f8             	sub    %edi,%r8d
   1a2fc:	85 c9                	test   %ecx,%ecx
   1a2fe:	4c 0f 49 c6          	cmovns %rsi,%r8
   1a302:	89 c1                	mov    %eax,%ecx
   1a304:	09 d1                	or     %edx,%ecx
   1a306:	89 c6                	mov    %eax,%esi
   1a308:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1a30e:	29 f2                	sub    %esi,%edx
   1a310:	85 c0                	test   %eax,%eax
   1a312:	48 0f 49 d1          	cmovns %rcx,%rdx
   1a316:	41 39 d0             	cmp    %edx,%r8d
   1a319:	0f 93 c0             	setae  %al
   1a31c:	c3                   	ret
   1a31d:	cc                   	int3
   1a31e:	cc                   	int3
   1a31f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::from_bits:
   1a320:	41 57                	push   %r15
   1a322:	41 56                	push   %r14
   1a324:	41 54                	push   %r12
   1a326:	53                   	push   %rbx
   1a327:	48 83 ec 18          	sub    $0x18,%rsp
   1a32b:	49 89 d6             	mov    %rdx,%r14
   1a32e:	48 89 fb             	mov    %rdi,%rbx
   1a331:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   1a337:	89 f1                	mov    %esi,%ecx
   1a339:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a33e:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a343:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a348:	e8 e3 22 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1a34d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a352:	74 23                	je     1a377 <<hyperinterval::float::F32Enclosure>::from_bits+0x57>
   1a354:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1a359:	44 89 f1             	mov    %r14d,%ecx
   1a35c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a361:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a366:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a36b:	e8 c0 22 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1a370:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a375:	75 1a                	jne    1a391 <<hyperinterval::float::F32Enclosure>::from_bits+0x71>
   1a377:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1a37c:	88 43 04             	mov    %al,0x4(%rbx)
   1a37f:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1a385:	48 83 c4 18          	add    $0x18,%rsp
   1a389:	5b                   	pop    %rbx
   1a38a:	41 5c                	pop    %r12
   1a38c:	41 5e                	pop    %r14
   1a38e:	41 5f                	pop    %r15
   1a390:	c3                   	ret
   1a391:	8b 44 24 10          	mov    0x10(%rsp),%eax
   1a395:	44 89 e1             	mov    %r12d,%ecx
   1a398:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1a39e:	89 c2                	mov    %eax,%edx
   1a3a0:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1a3a6:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a3ab:	29 ce                	sub    %ecx,%esi
   1a3ad:	44 09 f9             	or     %r15d,%ecx
   1a3b0:	45 85 e4             	test   %r12d,%r12d
   1a3b3:	48 0f 49 f1          	cmovns %rcx,%rsi
   1a3b7:	89 d1                	mov    %edx,%ecx
   1a3b9:	44 09 f9             	or     %r15d,%ecx
   1a3bc:	41 29 d7             	sub    %edx,%r15d
   1a3bf:	85 c0                	test   %eax,%eax
   1a3c1:	4c 0f 49 f9          	cmovns %rcx,%r15
   1a3c5:	44 39 fe             	cmp    %r15d,%esi
   1a3c8:	76 06                	jbe    1a3d0 <<hyperinterval::float::F32Enclosure>::from_bits+0xb0>
   1a3ca:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   1a3ce:	eb af                	jmp    1a37f <<hyperinterval::float::F32Enclosure>::from_bits+0x5f>
   1a3d0:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   1a3d6:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   1a3da:	89 43 08             	mov    %eax,0x8(%rbx)
   1a3dd:	eb a6                	jmp    1a385 <<hyperinterval::float::F32Enclosure>::from_bits+0x65>
   1a3df:	cc                   	int3

<hyperinterval::float::F32Enclosure>::max_image:
   1a3e0:	48 89 f8             	mov    %rdi,%rax
   1a3e3:	31 c9                	xor    %ecx,%ecx
   1a3e5:	f6 06 01             	testb  $0x1,(%rsi)
   1a3e8:	0f 84 db 00 00 00    	je     1a4c9 <<hyperinterval::float::F32Enclosure>::max_image+0xe9>
   1a3ee:	f6 02 01             	testb  $0x1,(%rdx)
   1a3f1:	0f 84 ca 00 00 00    	je     1a4c1 <<hyperinterval::float::F32Enclosure>::max_image+0xe1>
   1a3f7:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   1a3fc:	f3 0f 7e 4e 04       	movq   0x4(%rsi),%xmm1
   1a401:	66 0f ef d2          	pxor   %xmm2,%xmm2
   1a405:	66 0f 6f e1          	movdqa %xmm1,%xmm4
   1a409:	66 0f 62 e2          	punpckldq %xmm2,%xmm4
   1a40d:	66 0f 6f e8          	movdqa %xmm0,%xmm5
   1a411:	66 0f 62 ea          	punpckldq %xmm2,%xmm5
   1a415:	66 0f 6f 1d 83 ba fe 	movdqa -0x1457d(%rip),%xmm3        # 5ea0 <__abi_tag+0x5ba4>
   1a41c:	ff 
   1a41d:	66 0f 6f f4          	movdqa %xmm4,%xmm6
   1a421:	66 0f eb f3          	por    %xmm3,%xmm6
   1a425:	66 0f 6f 3d 33 b8 fe 	movdqa -0x147cd(%rip),%xmm7        # 5c60 <__abi_tag+0x5964>
   1a42c:	ff 
   1a42d:	66 0f db e7          	pand   %xmm7,%xmm4
   1a431:	66 44 0f 6f c3       	movdqa %xmm3,%xmm8
   1a436:	66 44 0f fb c4       	psubq  %xmm4,%xmm8
   1a43b:	66 0f 70 e1 50       	pshufd $0x50,%xmm1,%xmm4
   1a440:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
   1a445:	66 44 0f 66 cc       	pcmpgtd %xmm4,%xmm9
   1a44a:	66 45 0f db c1       	pand   %xmm9,%xmm8
   1a44f:	66 44 0f df ce       	pandn  %xmm6,%xmm9
   1a454:	66 45 0f eb c8       	por    %xmm8,%xmm9
   1a459:	66 0f 6f e5          	movdqa %xmm5,%xmm4
   1a45d:	66 0f eb e3          	por    %xmm3,%xmm4
   1a461:	66 0f db ef          	pand   %xmm7,%xmm5
   1a465:	66 0f 6f f3          	movdqa %xmm3,%xmm6
   1a469:	66 0f fb f5          	psubq  %xmm5,%xmm6
   1a46d:	66 0f 70 e8 50       	pshufd $0x50,%xmm0,%xmm5
   1a472:	66 0f 66 d5          	pcmpgtd %xmm5,%xmm2
   1a476:	66 0f db f2          	pand   %xmm2,%xmm6
   1a47a:	66 0f df d4          	pandn  %xmm4,%xmm2
   1a47e:	66 0f eb d6          	por    %xmm6,%xmm2
   1a482:	66 44 0f ef cb       	pxor   %xmm3,%xmm9
   1a487:	66 0f ef d3          	pxor   %xmm3,%xmm2
   1a48b:	66 0f 6f da          	movdqa %xmm2,%xmm3
   1a48f:	66 41 0f 66 d9       	pcmpgtd %xmm9,%xmm3
   1a494:	66 0f 70 e3 e8       	pshufd $0xe8,%xmm3,%xmm4
   1a499:	66 41 0f 76 d1       	pcmpeqd %xmm9,%xmm2
   1a49e:	66 0f 70 ea fd       	pshufd $0xfd,%xmm2,%xmm5
   1a4a3:	66 0f db ec          	pand   %xmm4,%xmm5
   1a4a7:	66 0f 70 d3 fd       	pshufd $0xfd,%xmm3,%xmm2
   1a4ac:	66 0f eb d5          	por    %xmm5,%xmm2
   1a4b0:	66 0f db c2          	pand   %xmm2,%xmm0
   1a4b4:	66 0f df d1          	pandn  %xmm1,%xmm2
   1a4b8:	66 0f eb d0          	por    %xmm0,%xmm2
   1a4bc:	b9 01 00 00 00       	mov    $0x1,%ecx
   1a4c1:	89 08                	mov    %ecx,(%rax)
   1a4c3:	66 0f d6 50 04       	movq   %xmm2,0x4(%rax)
   1a4c8:	c3                   	ret
   1a4c9:	89 08                	mov    %ecx,(%rax)
   1a4cb:	0f 13 50 04          	movlps %xmm2,0x4(%rax)
   1a4cf:	c3                   	ret

<hyperinterval::float::F32Enclosure>::min_image:
   1a4d0:	48 89 f8             	mov    %rdi,%rax
   1a4d3:	31 c9                	xor    %ecx,%ecx
   1a4d5:	f6 06 01             	testb  $0x1,(%rsi)
   1a4d8:	0f 84 dc 00 00 00    	je     1a5ba <<hyperinterval::float::F32Enclosure>::min_image+0xea>
   1a4de:	f6 02 01             	testb  $0x1,(%rdx)
   1a4e1:	0f 84 cb 00 00 00    	je     1a5b2 <<hyperinterval::float::F32Enclosure>::min_image+0xe2>
   1a4e7:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   1a4ec:	f3 0f 7e 4e 04       	movq   0x4(%rsi),%xmm1
   1a4f1:	66 0f ef d2          	pxor   %xmm2,%xmm2
   1a4f5:	66 0f 6f e1          	movdqa %xmm1,%xmm4
   1a4f9:	66 0f 62 e2          	punpckldq %xmm2,%xmm4
   1a4fd:	66 0f 6f e8          	movdqa %xmm0,%xmm5
   1a501:	66 0f 62 ea          	punpckldq %xmm2,%xmm5
   1a505:	66 0f 6f 1d 93 b9 fe 	movdqa -0x1466d(%rip),%xmm3        # 5ea0 <__abi_tag+0x5ba4>
   1a50c:	ff 
   1a50d:	66 0f 6f f4          	movdqa %xmm4,%xmm6
   1a511:	66 0f eb f3          	por    %xmm3,%xmm6
   1a515:	66 0f 6f 3d 43 b7 fe 	movdqa -0x148bd(%rip),%xmm7        # 5c60 <__abi_tag+0x5964>
   1a51c:	ff 
   1a51d:	66 0f db e7          	pand   %xmm7,%xmm4
   1a521:	66 44 0f 6f c3       	movdqa %xmm3,%xmm8
   1a526:	66 44 0f fb c4       	psubq  %xmm4,%xmm8
   1a52b:	66 0f 70 e1 50       	pshufd $0x50,%xmm1,%xmm4
   1a530:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
   1a535:	66 44 0f 66 cc       	pcmpgtd %xmm4,%xmm9
   1a53a:	66 45 0f db c1       	pand   %xmm9,%xmm8
   1a53f:	66 44 0f df ce       	pandn  %xmm6,%xmm9
   1a544:	66 45 0f eb c8       	por    %xmm8,%xmm9
   1a549:	66 0f 6f e5          	movdqa %xmm5,%xmm4
   1a54d:	66 0f eb e3          	por    %xmm3,%xmm4
   1a551:	66 0f db ef          	pand   %xmm7,%xmm5
   1a555:	66 0f 6f f3          	movdqa %xmm3,%xmm6
   1a559:	66 0f fb f5          	psubq  %xmm5,%xmm6
   1a55d:	66 0f 70 e8 50       	pshufd $0x50,%xmm0,%xmm5
   1a562:	66 0f 66 d5          	pcmpgtd %xmm5,%xmm2
   1a566:	66 0f db f2          	pand   %xmm2,%xmm6
   1a56a:	66 0f df d4          	pandn  %xmm4,%xmm2
   1a56e:	66 0f eb d6          	por    %xmm6,%xmm2
   1a572:	66 0f ef d3          	pxor   %xmm3,%xmm2
   1a576:	66 44 0f ef cb       	pxor   %xmm3,%xmm9
   1a57b:	66 41 0f 6f d9       	movdqa %xmm9,%xmm3
   1a580:	66 0f 66 da          	pcmpgtd %xmm2,%xmm3
   1a584:	66 0f 70 e3 e8       	pshufd $0xe8,%xmm3,%xmm4
   1a589:	66 44 0f 76 ca       	pcmpeqd %xmm2,%xmm9
   1a58e:	66 41 0f 70 e9 fd    	pshufd $0xfd,%xmm9,%xmm5
   1a594:	66 0f db ec          	pand   %xmm4,%xmm5
   1a598:	66 0f 70 d3 fd       	pshufd $0xfd,%xmm3,%xmm2
   1a59d:	66 0f eb d5          	por    %xmm5,%xmm2
   1a5a1:	66 0f db c2          	pand   %xmm2,%xmm0
   1a5a5:	66 0f df d1          	pandn  %xmm1,%xmm2
   1a5a9:	66 0f eb d0          	por    %xmm0,%xmm2
   1a5ad:	b9 01 00 00 00       	mov    $0x1,%ecx
   1a5b2:	89 08                	mov    %ecx,(%rax)
   1a5b4:	66 0f d6 50 04       	movq   %xmm2,0x4(%rax)
   1a5b9:	c3                   	ret
   1a5ba:	89 08                	mov    %ecx,(%rax)
   1a5bc:	0f 13 50 04          	movlps %xmm2,0x4(%rax)
   1a5c0:	c3                   	ret
   1a5c1:	cc                   	int3
   1a5c2:	cc                   	int3
   1a5c3:	cc                   	int3
   1a5c4:	cc                   	int3
   1a5c5:	cc                   	int3
   1a5c6:	cc                   	int3
   1a5c7:	cc                   	int3
   1a5c8:	cc                   	int3
   1a5c9:	cc                   	int3
   1a5ca:	cc                   	int3
   1a5cb:	cc                   	int3
   1a5cc:	cc                   	int3
   1a5cd:	cc                   	int3
   1a5ce:	cc                   	int3
   1a5cf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::next_down:
   1a5d0:	53                   	push   %rbx
   1a5d1:	48 83 ec 10          	sub    $0x10,%rsp
   1a5d5:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   1a5da:	66 0f 7e c1          	movd   %xmm0,%ecx
   1a5de:	48 89 e7             	mov    %rsp,%rdi
   1a5e1:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a5e6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a5eb:	e8 40 20 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1a5f0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a5f4:	75 11                	jne    1a607 <<hyperinterval::float::F32Enclosure>::next_down+0x37>
   1a5f6:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a5fb:	c1 e0 08             	shl    $0x8,%eax
   1a5fe:	48 ff c0             	inc    %rax
   1a601:	48 83 c4 10          	add    $0x10,%rsp
   1a605:	5b                   	pop    %rbx
   1a606:	c3                   	ret
   1a607:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a60c:	48 89 c1             	mov    %rax,%rcx
   1a60f:	48 31 d9             	xor    %rbx,%rcx
   1a612:	48 85 c0             	test   %rax,%rax
   1a615:	48 0f 44 c8          	cmove  %rax,%rcx
   1a619:	31 c0                	xor    %eax,%eax
   1a61b:	85 c9                	test   %ecx,%ecx
   1a61d:	0f 99 c0             	setns  %al
   1a620:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
   1a624:	48 ff c9             	dec    %rcx
   1a627:	48 89 e7             	mov    %rsp,%rdi
   1a62a:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a62f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a634:	e8 f7 1f 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1a639:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a63d:	75 0b                	jne    1a64a <<hyperinterval::float::F32Enclosure>::next_down+0x7a>
   1a63f:	b8 01 03 00 00       	mov    $0x301,%eax
   1a644:	48 83 c4 10          	add    $0x10,%rsp
   1a648:	5b                   	pop    %rbx
   1a649:	c3                   	ret
   1a64a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a64f:	48 89 c8             	mov    %rcx,%rax
   1a652:	48 35 00 00 00 80    	xor    $0xffffffff80000000,%rax
   1a658:	48 c1 e0 20          	shl    $0x20,%rax
   1a65c:	48 85 c9             	test   %rcx,%rcx
   1a65f:	48 0f 44 c1          	cmove  %rcx,%rax
   1a663:	48 83 c4 10          	add    $0x10,%rsp
   1a667:	5b                   	pop    %rbx
   1a668:	c3                   	ret
   1a669:	cc                   	int3
   1a66a:	cc                   	int3
   1a66b:	cc                   	int3
   1a66c:	cc                   	int3
   1a66d:	cc                   	int3
   1a66e:	cc                   	int3
   1a66f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::subset_of:
   1a670:	b0 01                	mov    $0x1,%al
   1a672:	f6 07 01             	testb  $0x1,(%rdi)
   1a675:	74 50                	je     1a6c7 <<hyperinterval::float::F32Enclosure>::subset_of+0x57>
   1a677:	f6 06 01             	testb  $0x1,(%rsi)
   1a67a:	74 49                	je     1a6c5 <<hyperinterval::float::F32Enclosure>::subset_of+0x55>
   1a67c:	8b 4f 04             	mov    0x4(%rdi),%ecx
   1a67f:	8b 56 04             	mov    0x4(%rsi),%edx
   1a682:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1a687:	44 8d 04 02          	lea    (%rdx,%rax,1),%r8d
   1a68b:	41 89 d1             	mov    %edx,%r9d
   1a68e:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1a695:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1a69b:	45 29 ca             	sub    %r9d,%r10d
   1a69e:	85 d2                	test   %edx,%edx
   1a6a0:	4d 0f 49 d0          	cmovns %r8,%r10
   1a6a4:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1a6a7:	41 89 c8             	mov    %ecx,%r8d
   1a6aa:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1a6b1:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1a6b7:	45 29 c1             	sub    %r8d,%r9d
   1a6ba:	85 c9                	test   %ecx,%ecx
   1a6bc:	4c 0f 49 ca          	cmovns %rdx,%r9
   1a6c0:	45 39 ca             	cmp    %r9d,%r10d
   1a6c3:	76 03                	jbe    1a6c8 <<hyperinterval::float::F32Enclosure>::subset_of+0x58>
   1a6c5:	31 c0                	xor    %eax,%eax
   1a6c7:	c3                   	ret
   1a6c8:	8b 4f 08             	mov    0x8(%rdi),%ecx
   1a6cb:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1a6ce:	89 cf                	mov    %ecx,%edi
   1a6d0:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1a6d6:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1a6dc:	41 29 f8             	sub    %edi,%r8d
   1a6df:	85 c9                	test   %ecx,%ecx
   1a6e1:	4c 0f 49 c2          	cmovns %rdx,%r8
   1a6e5:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1a6e8:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1a6eb:	89 ce                	mov    %ecx,%esi
   1a6ed:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1a6f3:	29 f0                	sub    %esi,%eax
   1a6f5:	85 c9                	test   %ecx,%ecx
   1a6f7:	48 0f 49 c2          	cmovns %rdx,%rax
   1a6fb:	41 39 c0             	cmp    %eax,%r8d
   1a6fe:	0f 96 c0             	setbe  %al
   1a701:	c3                   	ret
   1a702:	cc                   	int3
   1a703:	cc                   	int3
   1a704:	cc                   	int3
   1a705:	cc                   	int3
   1a706:	cc                   	int3
   1a707:	cc                   	int3
   1a708:	cc                   	int3
   1a709:	cc                   	int3
   1a70a:	cc                   	int3
   1a70b:	cc                   	int3
   1a70c:	cc                   	int3
   1a70d:	cc                   	int3
   1a70e:	cc                   	int3
   1a70f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::reciprocal:
   1a710:	55                   	push   %rbp
   1a711:	41 57                	push   %r15
   1a713:	41 56                	push   %r14
   1a715:	41 55                	push   %r13
   1a717:	41 54                	push   %r12
   1a719:	53                   	push   %rbx
   1a71a:	48 83 ec 28          	sub    $0x28,%rsp
   1a71e:	48 89 fb             	mov    %rdi,%rbx
   1a721:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1a725:	74 65                	je     1a78c <<hyperinterval::float::F64Enclosure>::reciprocal+0x7c>
   1a727:	49 89 f6             	mov    %rsi,%r14
   1a72a:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
   1a731:	00 00 80 
   1a734:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1a73b:	00 f0 7f 
   1a73e:	49 bd 00 00 00 00 00 	movabs $0x3ff0000000000000,%r13
   1a745:	00 f0 3f 
   1a748:	48 89 e7             	mov    %rsp,%rdi
   1a74b:	4c 89 fe             	mov    %r15,%rsi
   1a74e:	4c 89 e2             	mov    %r12,%rdx
   1a751:	4c 89 e9             	mov    %r13,%rcx
   1a754:	e8 d7 1e 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1a759:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a75d:	74 1c                	je     1a77b <<hyperinterval::float::F64Enclosure>::reciprocal+0x6b>
   1a75f:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1a764:	48 89 e7             	mov    %rsp,%rdi
   1a767:	4c 89 fe             	mov    %r15,%rsi
   1a76a:	4c 89 e2             	mov    %r12,%rdx
   1a76d:	4c 89 e9             	mov    %r13,%rcx
   1a770:	e8 bb 1e 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1a775:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a779:	75 2a                	jne    1a7a5 <<hyperinterval::float::F64Enclosure>::reciprocal+0x95>
   1a77b:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   1a780:	88 53 08             	mov    %dl,0x8(%rbx)
   1a783:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a78a:	eb 07                	jmp    1a793 <<hyperinterval::float::F64Enclosure>::reciprocal+0x83>
   1a78c:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1a793:	48 89 d8             	mov    %rbx,%rax
   1a796:	48 83 c4 28          	add    $0x28,%rsp
   1a79a:	5b                   	pop    %rbx
   1a79b:	41 5c                	pop    %r12
   1a79d:	41 5d                	pop    %r13
   1a79f:	41 5e                	pop    %r14
   1a7a1:	41 5f                	pop    %r15
   1a7a3:	5d                   	pop    %rbp
   1a7a4:	c3                   	ret
   1a7a5:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a7aa:	49 8d 14 2f          	lea    (%r15,%rbp,1),%rdx
   1a7ae:	49 8d 47 ff          	lea    -0x1(%r15),%rax
   1a7b2:	48 89 ee             	mov    %rbp,%rsi
   1a7b5:	48 21 c6             	and    %rax,%rsi
   1a7b8:	4c 89 ff             	mov    %r15,%rdi
   1a7bb:	48 29 f7             	sub    %rsi,%rdi
   1a7be:	48 85 ed             	test   %rbp,%rbp
   1a7c1:	48 0f 49 fa          	cmovns %rdx,%rdi
   1a7c5:	4a 8d 14 39          	lea    (%rcx,%r15,1),%rdx
   1a7c9:	48 89 ce             	mov    %rcx,%rsi
   1a7cc:	48 21 c6             	and    %rax,%rsi
   1a7cf:	49 29 f7             	sub    %rsi,%r15
   1a7d2:	48 85 c9             	test   %rcx,%rcx
   1a7d5:	4c 0f 49 fa          	cmovns %rdx,%r15
   1a7d9:	b2 01                	mov    $0x1,%dl
   1a7db:	4c 39 ff             	cmp    %r15,%rdi
   1a7de:	77 a0                	ja     1a780 <<hyperinterval::float::F64Enclosure>::reciprocal+0x70>
   1a7e0:	48 c7 44 24 10 01 00 	movq   $0x1,0x10(%rsp)
   1a7e7:	00 00 
   1a7e9:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
   1a7ee:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   1a7f3:	49 83 7e 08 00       	cmpq   $0x0,0x8(%r14)
   1a7f8:	7f 0e                	jg     1a808 <<hyperinterval::float::F64Enclosure>::reciprocal+0xf8>
   1a7fa:	49 8b 4e 10          	mov    0x10(%r14),%rcx
   1a7fe:	48 85 c9             	test   %rcx,%rcx
   1a801:	79 1f                	jns    1a822 <<hyperinterval::float::F64Enclosure>::reciprocal+0x112>
   1a803:	48 21 c1             	and    %rax,%rcx
   1a806:	74 1a                	je     1a822 <<hyperinterval::float::F64Enclosure>::reciprocal+0x112>
   1a808:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
   1a80d:	48 89 df             	mov    %rbx,%rdi
   1a810:	4c 89 f2             	mov    %r14,%rdx
   1a813:	b9 01 00 00 00       	mov    $0x1,%ecx
   1a818:	e8 93 02 00 00       	call   1aab0 <<hyperinterval::float::F64Enclosure>::corner_image>
   1a81d:	e9 71 ff ff ff       	jmp    1a793 <<hyperinterval::float::F64Enclosure>::reciprocal+0x83>
   1a822:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
   1a826:	e9 58 ff ff ff       	jmp    1a783 <<hyperinterval::float::F64Enclosure>::reciprocal+0x73>
   1a82b:	cc                   	int3
   1a82c:	cc                   	int3
   1a82d:	cc                   	int3
   1a82e:	cc                   	int3
   1a82f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::checked_pow:
   1a830:	55                   	push   %rbp
   1a831:	41 57                	push   %r15
   1a833:	41 56                	push   %r14
   1a835:	41 55                	push   %r13
   1a837:	41 54                	push   %r12
   1a839:	53                   	push   %rbx
   1a83a:	48 83 ec 48          	sub    $0x48,%rsp
   1a83e:	48 89 fb             	mov    %rdi,%rbx
   1a841:	83 fa 02             	cmp    $0x2,%edx
   1a844:	75 0e                	jne    1a854 <<hyperinterval::float::F64Enclosure>::checked_pow+0x24>
   1a846:	48 89 df             	mov    %rbx,%rdi
   1a849:	ff 15 f9 2d 04 00    	call   *0x42df9(%rip)        # 5d648 <_DYNAMIC+0x2f0>
   1a84f:	e9 e0 00 00 00       	jmp    1a934 <<hyperinterval::float::F64Enclosure>::checked_pow+0x104>
   1a854:	f6 06 01             	testb  $0x1,(%rsi)
   1a857:	0f 84 d0 00 00 00    	je     1a92d <<hyperinterval::float::F64Enclosure>::checked_pow+0xfd>
   1a85d:	89 d5                	mov    %edx,%ebp
   1a85f:	4c 8b 76 10          	mov    0x10(%rsi),%r14
   1a863:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
   1a86a:	00 00 80 
   1a86d:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   1a874:	00 f0 7f 
   1a877:	4c 8b 7e 08          	mov    0x8(%rsi),%r15
   1a87b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a880:	4c 89 e6             	mov    %r12,%rsi
   1a883:	4c 89 ea             	mov    %r13,%rdx
   1a886:	4c 89 f9             	mov    %r15,%rcx
   1a889:	41 89 e8             	mov    %ebp,%r8d
   1a88c:	e8 af 2c 00 00       	call   1d540 <<hyperinterval::ieee::Format>::power>
   1a891:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   1a896:	0f 85 80 00 00 00    	jne    1a91c <<hyperinterval::float::F64Enclosure>::checked_pow+0xec>
   1a89c:	4c 89 f1             	mov    %r14,%rcx
   1a89f:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   1a8a4:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1a8a9:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1a8ae:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a8b3:	4c 89 e6             	mov    %r12,%rsi
   1a8b6:	4c 89 ea             	mov    %r13,%rdx
   1a8b9:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
   1a8be:	41 89 e8             	mov    %ebp,%r8d
   1a8c1:	e8 7a 2c 00 00       	call   1d540 <<hyperinterval::ieee::Format>::power>
   1a8c6:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a8cb:	74 4f                	je     1a91c <<hyperinterval::float::F64Enclosure>::checked_pow+0xec>
   1a8cd:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1a8d2:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1a8d7:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1a8dc:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1a8e1:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a8e6:	4c 89 e6             	mov    %r12,%rsi
   1a8e9:	4c 89 ea             	mov    %r13,%rdx
   1a8ec:	4c 89 f1             	mov    %r14,%rcx
   1a8ef:	e8 3c 1d 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1a8f4:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a8f9:	74 21                	je     1a91c <<hyperinterval::float::F64Enclosure>::checked_pow+0xec>
   1a8fb:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   1a900:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a905:	4c 89 e6             	mov    %r12,%rsi
   1a908:	4c 89 ea             	mov    %r13,%rdx
   1a90b:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   1a910:	e8 1b 1d 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1a915:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a91a:	75 2a                	jne    1a946 <<hyperinterval::float::F64Enclosure>::checked_pow+0x116>
   1a91c:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1a921:	88 43 08             	mov    %al,0x8(%rbx)
   1a924:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a92b:	eb 07                	jmp    1a934 <<hyperinterval::float::F64Enclosure>::checked_pow+0x104>
   1a92d:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1a934:	48 89 d8             	mov    %rbx,%rax
   1a937:	48 83 c4 48          	add    $0x48,%rsp
   1a93b:	5b                   	pop    %rbx
   1a93c:	41 5c                	pop    %r12
   1a93e:	41 5d                	pop    %r13
   1a940:	41 5e                	pop    %r14
   1a942:	41 5f                	pop    %r15
   1a944:	5d                   	pop    %rbp
   1a945:	c3                   	ret
   1a946:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
   1a94b:	4b 8d 04 26          	lea    (%r14,%r12,1),%rax
   1a94f:	4c 89 f6             	mov    %r14,%rsi
   1a952:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
   1a957:	48 89 f1             	mov    %rsi,%rcx
   1a95a:	4c 21 f1             	and    %r14,%rcx
   1a95d:	4c 89 e2             	mov    %r12,%rdx
   1a960:	48 29 ca             	sub    %rcx,%rdx
   1a963:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
   1a968:	48 85 f6             	test   %rsi,%rsi
   1a96b:	48 0f 49 d0          	cmovns %rax,%rdx
   1a96f:	4a 8d 04 27          	lea    (%rdi,%r12,1),%rax
   1a973:	48 89 f9             	mov    %rdi,%rcx
   1a976:	4c 21 f1             	and    %r14,%rcx
   1a979:	4c 89 e6             	mov    %r12,%rsi
   1a97c:	48 29 ce             	sub    %rcx,%rsi
   1a97f:	48 85 ff             	test   %rdi,%rdi
   1a982:	48 0f 49 f0          	cmovns %rax,%rsi
   1a986:	b0 01                	mov    $0x1,%al
   1a988:	48 39 f2             	cmp    %rsi,%rdx
   1a98b:	77 94                	ja     1a921 <<hyperinterval::float::F64Enclosure>::checked_pow+0xf1>
   1a98d:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
   1a992:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a997:	4c 89 e6             	mov    %r12,%rsi
   1a99a:	4c 89 ea             	mov    %r13,%rdx
   1a99d:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1a9a2:	e8 89 1c 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1a9a7:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a9ac:	0f 84 6a ff ff ff    	je     1a91c <<hyperinterval::float::F64Enclosure>::checked_pow+0xec>
   1a9b2:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1a9b7:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1a9bc:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a9c1:	4c 89 e6             	mov    %r12,%rsi
   1a9c4:	4c 89 ea             	mov    %r13,%rdx
   1a9c7:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   1a9cc:	e8 5f 1c 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1a9d1:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a9d6:	0f 84 40 ff ff ff    	je     1a91c <<hyperinterval::float::F64Enclosure>::checked_pow+0xec>
   1a9dc:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1a9e1:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
   1a9e6:	4a 8d 04 22          	lea    (%rdx,%r12,1),%rax
   1a9ea:	48 89 d7             	mov    %rdx,%rdi
   1a9ed:	4c 21 f7             	and    %r14,%rdi
   1a9f0:	4c 89 e6             	mov    %r12,%rsi
   1a9f3:	48 29 fe             	sub    %rdi,%rsi
   1a9f6:	48 85 d2             	test   %rdx,%rdx
   1a9f9:	48 0f 49 f0          	cmovns %rax,%rsi
   1a9fd:	4a 8d 04 21          	lea    (%rcx,%r12,1),%rax
   1aa01:	49 21 ce             	and    %rcx,%r14
   1aa04:	4d 29 f4             	sub    %r14,%r12
   1aa07:	48 85 c9             	test   %rcx,%rcx
   1aa0a:	4c 0f 49 e0          	cmovns %rax,%r12
   1aa0e:	b0 01                	mov    $0x1,%al
   1aa10:	4c 39 e6             	cmp    %r12,%rsi
   1aa13:	0f 87 08 ff ff ff    	ja     1a921 <<hyperinterval::float::F64Enclosure>::checked_pow+0xf1>
   1aa19:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1aa1e:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   1aa23:	e8 48 37 00 00       	call   1e170 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1aa28:	49 89 c5             	mov    %rax,%r13
   1aa2b:	49 89 d4             	mov    %rdx,%r12
   1aa2e:	85 ed                	test   %ebp,%ebp
   1aa30:	0f 95 c0             	setne  %al
   1aa33:	40 f6 c5 01          	test   $0x1,%bpl
   1aa37:	0f 94 c1             	sete   %cl
   1aa3a:	84 c8                	test   %cl,%al
   1aa3c:	74 13                	je     1aa51 <<hyperinterval::float::F64Enclosure>::checked_pow+0x221>
   1aa3e:	4c 89 ff             	mov    %r15,%rdi
   1aa41:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
   1aa46:	31 d2                	xor    %edx,%edx
   1aa48:	e8 a3 37 00 00       	call   1e1f0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::signs>
   1aa4d:	a8 02                	test   $0x2,%al
   1aa4f:	75 14                	jne    1aa65 <<hyperinterval::float::F64Enclosure>::checked_pow+0x235>
   1aa51:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1aa58:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1aa5c:	4c 89 63 10          	mov    %r12,0x10(%rbx)
   1aa60:	e9 cf fe ff ff       	jmp    1a934 <<hyperinterval::float::F64Enclosure>::checked_pow+0x104>
   1aa65:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1aa6a:	31 f6                	xor    %esi,%esi
   1aa6c:	31 d2                	xor    %edx,%edx
   1aa6e:	e8 2d 18 00 00       	call   1c2a0 <<hyperinterval::float::F64Enclosure>::from_bits>
   1aa73:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1aa78:	48 83 f8 02          	cmp    $0x2,%rax
   1aa7c:	75 0a                	jne    1aa88 <<hyperinterval::float::F64Enclosure>::checked_pow+0x258>
   1aa7e:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   1aa83:	e9 99 fe ff ff       	jmp    1a921 <<hyperinterval::float::F64Enclosure>::checked_pow+0xf1>
   1aa88:	83 f8 01             	cmp    $0x1,%eax
   1aa8b:	75 c4                	jne    1aa51 <<hyperinterval::float::F64Enclosure>::checked_pow+0x221>
   1aa8d:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   1aa92:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1aa97:	4c 89 ef             	mov    %r13,%rdi
   1aa9a:	4c 89 e6             	mov    %r12,%rsi
   1aa9d:	e8 ce 36 00 00       	call   1e170 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1aaa2:	49 89 c5             	mov    %rax,%r13
   1aaa5:	49 89 d4             	mov    %rdx,%r12
   1aaa8:	eb a7                	jmp    1aa51 <<hyperinterval::float::F64Enclosure>::checked_pow+0x221>
   1aaaa:	cc                   	int3
   1aaab:	cc                   	int3
   1aaac:	cc                   	int3
   1aaad:	cc                   	int3
   1aaae:	cc                   	int3
   1aaaf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::corner_image:
   1aab0:	55                   	push   %rbp
   1aab1:	41 57                	push   %r15
   1aab3:	41 56                	push   %r14
   1aab5:	41 55                	push   %r13
   1aab7:	41 54                	push   %r12
   1aab9:	53                   	push   %rbx
   1aaba:	48 83 ec 68          	sub    $0x68,%rsp
   1aabe:	48 89 fb             	mov    %rdi,%rbx
   1aac1:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1aac5:	75 5f                	jne    1ab26 <<hyperinterval::float::F64Enclosure>::corner_image+0x76>
   1aac7:	f6 02 01             	testb  $0x1,(%rdx)
   1aaca:	74 5a                	je     1ab26 <<hyperinterval::float::F64Enclosure>::corner_image+0x76>
   1aacc:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1aad3:	00 00 80 
   1aad6:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   1aadd:	00 f0 7f 
   1aae0:	4c 8b 66 08          	mov    0x8(%rsi),%r12
   1aae4:	48 8b 46 10          	mov    0x10(%rsi),%rax
   1aae8:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1aaed:	48 8b 6a 08          	mov    0x8(%rdx),%rbp
   1aaf1:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1aaf5:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1aafa:	84 c9                	test   %cl,%cl
   1aafc:	74 34                	je     1ab32 <<hyperinterval::float::F64Enclosure>::corner_image+0x82>
   1aafe:	48 89 e7             	mov    %rsp,%rdi
   1ab01:	4c 89 f6             	mov    %r14,%rsi
   1ab04:	4c 89 ea             	mov    %r13,%rdx
   1ab07:	4c 89 e1             	mov    %r12,%rcx
   1ab0a:	49 89 e8             	mov    %rbp,%r8
   1ab0d:	e8 0e 1e 00 00       	call   1c920 <<hyperinterval::ieee::Format>::div>
   1ab12:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ab16:	0f 84 c3 00 00 00    	je     1abdf <<hyperinterval::float::F64Enclosure>::corner_image+0x12f>
   1ab1c:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1ab21:	e9 b1 00 00 00       	jmp    1abd7 <<hyperinterval::float::F64Enclosure>::corner_image+0x127>
   1ab26:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1ab2d:	e9 12 04 00 00       	jmp    1af44 <<hyperinterval::float::F64Enclosure>::corner_image+0x494>
   1ab32:	4c 89 e1             	mov    %r12,%rcx
   1ab35:	48 c1 e9 34          	shr    $0x34,%rcx
   1ab39:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1ab3f:	48 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%rdx
   1ab46:	ff 0f 00 
   1ab49:	4c 89 e7             	mov    %r12,%rdi
   1ab4c:	48 21 d7             	and    %rdx,%rdi
   1ab4f:	48 8d 42 01          	lea    0x1(%rdx),%rax
   1ab53:	44 8d 81 9a f7 ff ff 	lea    -0x866(%rcx),%r8d
   1ab5a:	48 85 c9             	test   %rcx,%rcx
   1ab5d:	48 0f 45 c8          	cmovne %rax,%rcx
   1ab61:	be 9b f7 ff ff       	mov    $0xfffff79b,%esi
   1ab66:	41 0f 45 f0          	cmovne %r8d,%esi
   1ab6a:	48 09 f9             	or     %rdi,%rcx
   1ab6d:	48 89 ef             	mov    %rbp,%rdi
   1ab70:	48 c1 ef 34          	shr    $0x34,%rdi
   1ab74:	81 e7 ff 07 00 00    	and    $0x7ff,%edi
   1ab7a:	48 21 ea             	and    %rbp,%rdx
   1ab7d:	48 85 ff             	test   %rdi,%rdi
   1ab80:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1ab86:	44 0f 45 c7          	cmovne %edi,%r8d
   1ab8a:	48 0f 44 c7          	cmove  %rdi,%rax
   1ab8e:	48 09 d0             	or     %rdx,%rax
   1ab91:	48 89 ef             	mov    %rbp,%rdi
   1ab94:	4c 31 e7             	xor    %r12,%rdi
   1ab97:	48 f7 e1             	mul    %rcx
   1ab9a:	41 01 f0             	add    %esi,%r8d
   1ab9d:	48 c1 ef 3f          	shr    $0x3f,%rdi
   1aba1:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
   1aba6:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1abab:	48 89 04 24          	mov    %rax,(%rsp)
   1abaf:	44 89 44 24 10       	mov    %r8d,0x10(%rsp)
   1abb4:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1abb9:	48 89 e1             	mov    %rsp,%rcx
   1abbc:	4c 89 f6             	mov    %r14,%rsi
   1abbf:	4c 89 ea             	mov    %r13,%rdx
   1abc2:	e8 69 31 00 00       	call   1dd30 <<hyperinterval::ieee::Format>::rounded>
   1abc7:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1abcc:	0f 84 22 03 00 00    	je     1aef4 <<hyperinterval::float::F64Enclosure>::corner_image+0x444>
   1abd2:	0f b6 44 24 41       	movzbl 0x41(%rsp),%eax
   1abd7:	88 43 08             	mov    %al,0x8(%rbx)
   1abda:	e9 5e 03 00 00       	jmp    1af3d <<hyperinterval::float::F64Enclosure>::corner_image+0x48d>
   1abdf:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1abe4:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1abe9:	48 89 e7             	mov    %rsp,%rdi
   1abec:	4c 89 f6             	mov    %r14,%rsi
   1abef:	4c 89 ea             	mov    %r13,%rdx
   1abf2:	e8 39 1a 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1abf7:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1abfb:	0f 85 32 03 00 00    	jne    1af33 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1ac01:	4c 89 f6             	mov    %r14,%rsi
   1ac04:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   1ac09:	48 89 e7             	mov    %rsp,%rdi
   1ac0c:	4c 89 ea             	mov    %r13,%rdx
   1ac0f:	4c 89 f9             	mov    %r15,%rcx
   1ac12:	e8 19 1a 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1ac17:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ac1b:	0f 85 12 03 00 00    	jne    1af33 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1ac21:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   1ac26:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1ac2d:	00 00 80 
   1ac30:	49 8d 04 36          	lea    (%r14,%rsi,1),%rax
   1ac34:	4c 8d 6e ff          	lea    -0x1(%rsi),%r13
   1ac38:	4c 89 f1             	mov    %r14,%rcx
   1ac3b:	4c 21 e9             	and    %r13,%rcx
   1ac3e:	48 89 f2             	mov    %rsi,%rdx
   1ac41:	48 29 ca             	sub    %rcx,%rdx
   1ac44:	4d 85 f6             	test   %r14,%r14
   1ac47:	48 0f 49 d0          	cmovns %rax,%rdx
   1ac4b:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
   1ac4f:	48 89 f9             	mov    %rdi,%rcx
   1ac52:	4c 21 e9             	and    %r13,%rcx
   1ac55:	48 29 ce             	sub    %rcx,%rsi
   1ac58:	48 85 ff             	test   %rdi,%rdi
   1ac5b:	48 0f 49 f0          	cmovns %rax,%rsi
   1ac5f:	41 b7 01             	mov    $0x1,%r15b
   1ac62:	48 39 f2             	cmp    %rsi,%rdx
   1ac65:	0f 87 ce 02 00 00    	ja     1af39 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1ac6b:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1ac70:	4c 89 74 24 38       	mov    %r14,0x38(%rsp)
   1ac75:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
   1ac7a:	48 89 e7             	mov    %rsp,%rdi
   1ac7d:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1ac84:	00 00 80 
   1ac87:	4c 89 f6             	mov    %r14,%rsi
   1ac8a:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   1ac91:	00 f0 7f 
   1ac94:	4c 89 ea             	mov    %r13,%rdx
   1ac97:	4c 89 e1             	mov    %r12,%rcx
   1ac9a:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1ac9f:	e8 7c 1c 00 00       	call   1c920 <<hyperinterval::ieee::Format>::div>
   1aca4:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1aca8:	0f 85 6e fe ff ff    	jne    1ab1c <<hyperinterval::float::F64Enclosure>::corner_image+0x6c>
   1acae:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1acb3:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1acb8:	48 89 e7             	mov    %rsp,%rdi
   1acbb:	4c 89 f6             	mov    %r14,%rsi
   1acbe:	4c 89 ea             	mov    %r13,%rdx
   1acc1:	e8 6a 19 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1acc6:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1acca:	0f 85 63 02 00 00    	jne    1af33 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1acd0:	4c 89 ea             	mov    %r13,%rdx
   1acd3:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1acd8:	48 89 e7             	mov    %rsp,%rdi
   1acdb:	4c 89 f6             	mov    %r14,%rsi
   1acde:	4c 89 e1             	mov    %r12,%rcx
   1ace1:	e8 4a 19 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1ace6:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1acea:	0f 85 43 02 00 00    	jne    1af33 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1acf0:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1acf5:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1acfc:	00 00 80 
   1acff:	4b 8d 04 2e          	lea    (%r14,%r13,1),%rax
   1ad03:	4d 89 e8             	mov    %r13,%r8
   1ad06:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1ad0b:	49 21 f8             	and    %rdi,%r8
   1ad0e:	4c 89 f6             	mov    %r14,%rsi
   1ad11:	4c 29 c6             	sub    %r8,%rsi
   1ad14:	4d 85 ed             	test   %r13,%r13
   1ad17:	48 0f 49 f0          	cmovns %rax,%rsi
   1ad1b:	4a 8d 04 31          	lea    (%rcx,%r14,1),%rax
   1ad1f:	49 89 c8             	mov    %rcx,%r8
   1ad22:	49 21 f8             	and    %rdi,%r8
   1ad25:	4c 89 f7             	mov    %r14,%rdi
   1ad28:	4c 29 c7             	sub    %r8,%rdi
   1ad2b:	48 85 c9             	test   %rcx,%rcx
   1ad2e:	48 0f 49 f8          	cmovns %rax,%rdi
   1ad32:	48 39 fe             	cmp    %rdi,%rsi
   1ad35:	0f 87 fe 01 00 00    	ja     1af39 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1ad3b:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
   1ad40:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1ad45:	4c 89 ea             	mov    %r13,%rdx
   1ad48:	e8 23 34 00 00       	call   1e170 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1ad4d:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1ad52:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
   1ad57:	48 89 e7             	mov    %rsp,%rdi
   1ad5a:	4c 89 f6             	mov    %r14,%rsi
   1ad5d:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1ad64:	00 f0 7f 
   1ad67:	4c 89 e2             	mov    %r12,%rdx
   1ad6a:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1ad6f:	49 89 e8             	mov    %rbp,%r8
   1ad72:	e8 a9 1b 00 00       	call   1c920 <<hyperinterval::ieee::Format>::div>
   1ad77:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ad7b:	0f 85 9b fd ff ff    	jne    1ab1c <<hyperinterval::float::F64Enclosure>::corner_image+0x6c>
   1ad81:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1ad86:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1ad8b:	48 89 e7             	mov    %rsp,%rdi
   1ad8e:	4c 89 f6             	mov    %r14,%rsi
   1ad91:	4c 89 e2             	mov    %r12,%rdx
   1ad94:	e8 97 18 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1ad99:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ad9d:	0f 85 90 01 00 00    	jne    1af33 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1ada3:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1ada8:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1adad:	48 89 e7             	mov    %rsp,%rdi
   1adb0:	4c 89 f6             	mov    %r14,%rsi
   1adb3:	4c 89 e2             	mov    %r12,%rdx
   1adb6:	48 89 e9             	mov    %rbp,%rcx
   1adb9:	e8 72 18 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1adbe:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1adc2:	0f 85 6b 01 00 00    	jne    1af33 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1adc8:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1adcd:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1add4:	00 00 80 
   1add7:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
   1addc:	4a 8d 04 32          	lea    (%rdx,%r14,1),%rax
   1ade0:	49 89 d0             	mov    %rdx,%r8
   1ade3:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1ade8:	49 21 f8             	and    %rdi,%r8
   1adeb:	4c 89 f6             	mov    %r14,%rsi
   1adee:	4c 29 c6             	sub    %r8,%rsi
   1adf1:	48 85 d2             	test   %rdx,%rdx
   1adf4:	48 0f 49 f0          	cmovns %rax,%rsi
   1adf8:	4a 8d 04 31          	lea    (%rcx,%r14,1),%rax
   1adfc:	49 89 c8             	mov    %rcx,%r8
   1adff:	49 21 f8             	and    %rdi,%r8
   1ae02:	4c 89 f7             	mov    %r14,%rdi
   1ae05:	4c 29 c7             	sub    %r8,%rdi
   1ae08:	48 85 c9             	test   %rcx,%rcx
   1ae0b:	48 0f 49 f8          	cmovns %rax,%rdi
   1ae0f:	48 39 fe             	cmp    %rdi,%rsi
   1ae12:	0f 87 21 01 00 00    	ja     1af39 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1ae18:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
   1ae1d:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1ae22:	e8 49 33 00 00       	call   1e170 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1ae27:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1ae2c:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
   1ae31:	48 89 e7             	mov    %rsp,%rdi
   1ae34:	4c 89 f6             	mov    %r14,%rsi
   1ae37:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1ae3e:	00 f0 7f 
   1ae41:	4c 89 e2             	mov    %r12,%rdx
   1ae44:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1ae49:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1ae4e:	e8 cd 1a 00 00       	call   1c920 <<hyperinterval::ieee::Format>::div>
   1ae53:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ae57:	0f 85 bf fc ff ff    	jne    1ab1c <<hyperinterval::float::F64Enclosure>::corner_image+0x6c>
   1ae5d:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1ae62:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1ae67:	48 89 e7             	mov    %rsp,%rdi
   1ae6a:	4c 89 f6             	mov    %r14,%rsi
   1ae6d:	4c 89 e2             	mov    %r12,%rdx
   1ae70:	e8 bb 17 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1ae75:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ae79:	0f 85 b4 00 00 00    	jne    1af33 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1ae7f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1ae84:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1ae89:	48 89 e7             	mov    %rsp,%rdi
   1ae8c:	4c 89 f6             	mov    %r14,%rsi
   1ae8f:	4c 89 e2             	mov    %r12,%rdx
   1ae92:	48 89 e9             	mov    %rbp,%rcx
   1ae95:	e8 96 17 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1ae9a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ae9e:	0f 85 8f 00 00 00    	jne    1af33 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1aea4:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1aeab:	00 00 80 
   1aeae:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
   1aeb3:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
   1aeb7:	48 89 f9             	mov    %rdi,%rcx
   1aeba:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
   1aebf:	4c 21 e9             	and    %r13,%rcx
   1aec2:	48 89 f2             	mov    %rsi,%rdx
   1aec5:	48 29 ca             	sub    %rcx,%rdx
   1aec8:	48 85 ff             	test   %rdi,%rdi
   1aecb:	48 0f 49 d0          	cmovns %rax,%rdx
   1aecf:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1aed4:	48 8d 04 31          	lea    (%rcx,%rsi,1),%rax
   1aed8:	49 21 cd             	and    %rcx,%r13
   1aedb:	4c 29 ee             	sub    %r13,%rsi
   1aede:	48 85 c9             	test   %rcx,%rcx
   1aee1:	48 0f 49 f0          	cmovns %rax,%rsi
   1aee5:	48 39 f2             	cmp    %rsi,%rdx
   1aee8:	77 4f                	ja     1af39 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1aeea:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
   1aeef:	e9 2f 03 00 00       	jmp    1b223 <<hyperinterval::float::F64Enclosure>::corner_image+0x773>
   1aef4:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1aef9:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
   1aefe:	48 89 e7             	mov    %rsp,%rdi
   1af01:	4c 89 f6             	mov    %r14,%rsi
   1af04:	4c 89 ea             	mov    %r13,%rdx
   1af07:	e8 24 17 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1af0c:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1af10:	74 21                	je     1af33 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1af12:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1af17:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1af1c:	48 89 e7             	mov    %rsp,%rdi
   1af1f:	4c 89 f6             	mov    %r14,%rsi
   1af22:	4c 89 ea             	mov    %r13,%rdx
   1af25:	4c 89 f9             	mov    %r15,%rcx
   1af28:	e8 03 17 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1af2d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1af31:	75 20                	jne    1af53 <<hyperinterval::float::F64Enclosure>::corner_image+0x4a3>
   1af33:	44 0f b6 7c 24 01    	movzbl 0x1(%rsp),%r15d
   1af39:	44 88 7b 08          	mov    %r15b,0x8(%rbx)
   1af3d:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1af44:	48 83 c4 68          	add    $0x68,%rsp
   1af48:	5b                   	pop    %rbx
   1af49:	41 5c                	pop    %r12
   1af4b:	41 5d                	pop    %r13
   1af4d:	41 5e                	pop    %r14
   1af4f:	41 5f                	pop    %r15
   1af51:	5d                   	pop    %rbp
   1af52:	c3                   	ret
   1af53:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   1af58:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1af5f:	00 00 80 
   1af62:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   1af67:	4a 8d 04 36          	lea    (%rsi,%r14,1),%rax
   1af6b:	4d 8d 6e ff          	lea    -0x1(%r14),%r13
   1af6f:	48 89 f1             	mov    %rsi,%rcx
   1af72:	4c 21 e9             	and    %r13,%rcx
   1af75:	4c 89 f2             	mov    %r14,%rdx
   1af78:	48 29 ca             	sub    %rcx,%rdx
   1af7b:	48 85 f6             	test   %rsi,%rsi
   1af7e:	48 0f 49 d0          	cmovns %rax,%rdx
   1af82:	4a 8d 04 37          	lea    (%rdi,%r14,1),%rax
   1af86:	48 89 f9             	mov    %rdi,%rcx
   1af89:	4c 21 e9             	and    %r13,%rcx
   1af8c:	4c 89 f6             	mov    %r14,%rsi
   1af8f:	48 29 ce             	sub    %rcx,%rsi
   1af92:	48 85 ff             	test   %rdi,%rdi
   1af95:	48 0f 49 f0          	cmovns %rax,%rsi
   1af99:	41 b7 01             	mov    $0x1,%r15b
   1af9c:	48 39 f2             	cmp    %rsi,%rdx
   1af9f:	77 98                	ja     1af39 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1afa1:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1afa6:	4c 89 6c 24 38       	mov    %r13,0x38(%rsp)
   1afab:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1afb0:	4c 89 f6             	mov    %r14,%rsi
   1afb3:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   1afba:	00 f0 7f 
   1afbd:	4c 89 ea             	mov    %r13,%rdx
   1afc0:	4c 89 e1             	mov    %r12,%rcx
   1afc3:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1afc8:	e8 93 1d 00 00       	call   1cd60 <<hyperinterval::ieee::Format>::mul>
   1afcd:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1afd2:	0f 85 fa fb ff ff    	jne    1abd2 <<hyperinterval::float::F64Enclosure>::corner_image+0x122>
   1afd8:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1afdd:	4c 8b 64 24 50       	mov    0x50(%rsp),%r12
   1afe2:	48 89 e7             	mov    %rsp,%rdi
   1afe5:	4c 89 f6             	mov    %r14,%rsi
   1afe8:	4c 89 ea             	mov    %r13,%rdx
   1afeb:	e8 40 16 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1aff0:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1aff4:	0f 85 39 ff ff ff    	jne    1af33 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1affa:	4c 89 ea             	mov    %r13,%rdx
   1affd:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1b002:	48 89 e7             	mov    %rsp,%rdi
   1b005:	4c 89 f6             	mov    %r14,%rsi
   1b008:	4c 89 e1             	mov    %r12,%rcx
   1b00b:	e8 20 16 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1b010:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b014:	0f 85 19 ff ff ff    	jne    1af33 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1b01a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b01f:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b026:	00 00 80 
   1b029:	4b 8d 04 2e          	lea    (%r14,%r13,1),%rax
   1b02d:	4d 89 e8             	mov    %r13,%r8
   1b030:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
   1b035:	49 21 f8             	and    %rdi,%r8
   1b038:	4c 89 f6             	mov    %r14,%rsi
   1b03b:	4c 29 c6             	sub    %r8,%rsi
   1b03e:	4d 85 ed             	test   %r13,%r13
   1b041:	48 0f 49 f0          	cmovns %rax,%rsi
   1b045:	4a 8d 04 31          	lea    (%rcx,%r14,1),%rax
   1b049:	49 89 c8             	mov    %rcx,%r8
   1b04c:	49 21 f8             	and    %rdi,%r8
   1b04f:	4c 89 f7             	mov    %r14,%rdi
   1b052:	4c 29 c7             	sub    %r8,%rdi
   1b055:	48 85 c9             	test   %rcx,%rcx
   1b058:	48 0f 49 f8          	cmovns %rax,%rdi
   1b05c:	48 39 fe             	cmp    %rdi,%rsi
   1b05f:	0f 87 d4 fe ff ff    	ja     1af39 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1b065:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1b06a:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1b06f:	4c 89 ea             	mov    %r13,%rdx
   1b072:	e8 f9 30 00 00       	call   1e170 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1b077:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1b07c:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
   1b081:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1b086:	4c 89 f6             	mov    %r14,%rsi
   1b089:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1b090:	00 f0 7f 
   1b093:	4c 89 e2             	mov    %r12,%rdx
   1b096:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1b09b:	49 89 e8             	mov    %rbp,%r8
   1b09e:	e8 bd 1c 00 00       	call   1cd60 <<hyperinterval::ieee::Format>::mul>
   1b0a3:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1b0a8:	0f 85 24 fb ff ff    	jne    1abd2 <<hyperinterval::float::F64Enclosure>::corner_image+0x122>
   1b0ae:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1b0b3:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
   1b0b8:	48 89 e7             	mov    %rsp,%rdi
   1b0bb:	4c 89 f6             	mov    %r14,%rsi
   1b0be:	4c 89 e2             	mov    %r12,%rdx
   1b0c1:	e8 6a 15 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1b0c6:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b0ca:	0f 85 63 fe ff ff    	jne    1af33 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1b0d0:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b0d5:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1b0da:	48 89 e7             	mov    %rsp,%rdi
   1b0dd:	4c 89 f6             	mov    %r14,%rsi
   1b0e0:	4c 89 e2             	mov    %r12,%rdx
   1b0e3:	48 89 e9             	mov    %rbp,%rcx
   1b0e6:	e8 45 15 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1b0eb:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b0ef:	0f 85 3e fe ff ff    	jne    1af33 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1b0f5:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b0fa:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b101:	00 00 80 
   1b104:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
   1b109:	4a 8d 04 32          	lea    (%rdx,%r14,1),%rax
   1b10d:	49 89 d0             	mov    %rdx,%r8
   1b110:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
   1b115:	49 21 f8             	and    %rdi,%r8
   1b118:	4c 89 f6             	mov    %r14,%rsi
   1b11b:	4c 29 c6             	sub    %r8,%rsi
   1b11e:	48 85 d2             	test   %rdx,%rdx
   1b121:	48 0f 49 f0          	cmovns %rax,%rsi
   1b125:	4a 8d 04 31          	lea    (%rcx,%r14,1),%rax
   1b129:	49 89 c8             	mov    %rcx,%r8
   1b12c:	49 21 f8             	and    %rdi,%r8
   1b12f:	4c 89 f7             	mov    %r14,%rdi
   1b132:	4c 29 c7             	sub    %r8,%rdi
   1b135:	48 85 c9             	test   %rcx,%rcx
   1b138:	48 0f 49 f8          	cmovns %rax,%rdi
   1b13c:	48 39 fe             	cmp    %rdi,%rsi
   1b13f:	0f 87 f4 fd ff ff    	ja     1af39 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1b145:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1b14a:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1b14f:	e8 1c 30 00 00       	call   1e170 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1b154:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1b159:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
   1b15e:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1b163:	4c 89 f6             	mov    %r14,%rsi
   1b166:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1b16d:	00 f0 7f 
   1b170:	4c 89 e2             	mov    %r12,%rdx
   1b173:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1b178:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1b17d:	e8 de 1b 00 00       	call   1cd60 <<hyperinterval::ieee::Format>::mul>
   1b182:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1b187:	0f 85 45 fa ff ff    	jne    1abd2 <<hyperinterval::float::F64Enclosure>::corner_image+0x122>
   1b18d:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1b192:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
   1b197:	48 89 e7             	mov    %rsp,%rdi
   1b19a:	4c 89 f6             	mov    %r14,%rsi
   1b19d:	4c 89 e2             	mov    %r12,%rdx
   1b1a0:	e8 8b 14 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1b1a5:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b1a9:	0f 85 84 fd ff ff    	jne    1af33 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1b1af:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b1b4:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1b1b9:	48 89 e7             	mov    %rsp,%rdi
   1b1bc:	4c 89 f6             	mov    %r14,%rsi
   1b1bf:	4c 89 e2             	mov    %r12,%rdx
   1b1c2:	48 89 e9             	mov    %rbp,%rcx
   1b1c5:	e8 66 14 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1b1ca:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b1ce:	0f 85 5f fd ff ff    	jne    1af33 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1b1d4:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b1db:	00 00 80 
   1b1de:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
   1b1e3:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
   1b1e7:	48 89 f9             	mov    %rdi,%rcx
   1b1ea:	4c 8b 6c 24 38       	mov    0x38(%rsp),%r13
   1b1ef:	4c 21 e9             	and    %r13,%rcx
   1b1f2:	48 89 f2             	mov    %rsi,%rdx
   1b1f5:	48 29 ca             	sub    %rcx,%rdx
   1b1f8:	48 85 ff             	test   %rdi,%rdi
   1b1fb:	48 0f 49 d0          	cmovns %rax,%rdx
   1b1ff:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b204:	48 8d 04 31          	lea    (%rcx,%rsi,1),%rax
   1b208:	49 21 cd             	and    %rcx,%r13
   1b20b:	4c 29 ee             	sub    %r13,%rsi
   1b20e:	48 85 c9             	test   %rcx,%rcx
   1b211:	48 0f 49 f0          	cmovns %rax,%rsi
   1b215:	48 39 f2             	cmp    %rsi,%rdx
   1b218:	0f 87 1b fd ff ff    	ja     1af39 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1b21e:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1b223:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1b228:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
   1b22d:	e8 3e 2f 00 00       	call   1e170 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1b232:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1b239:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1b23d:	48 89 53 10          	mov    %rdx,0x10(%rbx)
   1b241:	e9 fe fc ff ff       	jmp    1af44 <<hyperinterval::float::F64Enclosure>::corner_image+0x494>
   1b246:	cc                   	int3
   1b247:	cc                   	int3
   1b248:	cc                   	int3
   1b249:	cc                   	int3
   1b24a:	cc                   	int3
   1b24b:	cc                   	int3
   1b24c:	cc                   	int3
   1b24d:	cc                   	int3
   1b24e:	cc                   	int3
   1b24f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::intersection:
   1b250:	48 89 f8             	mov    %rdi,%rax
   1b253:	45 31 c0             	xor    %r8d,%r8d
   1b256:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b25a:	0f 85 d5 00 00 00    	jne    1b335 <<hyperinterval::float::F64Enclosure>::intersection+0xe5>
   1b260:	f6 02 01             	testb  $0x1,(%rdx)
   1b263:	0f 84 c0 00 00 00    	je     1b329 <<hyperinterval::float::F64Enclosure>::intersection+0xd9>
   1b269:	41 56                	push   %r14
   1b26b:	53                   	push   %rbx
   1b26c:	4c 8b 52 08          	mov    0x8(%rdx),%r10
   1b270:	4c 8b 4a 10          	mov    0x10(%rdx),%r9
   1b274:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1b278:	48 ba 00 00 00 00 00 	movabs $0x8000000000000000,%rdx
   1b27f:	00 00 80 
   1b282:	48 8d 3c 11          	lea    (%rcx,%rdx,1),%rdi
   1b286:	4c 8d 42 ff          	lea    -0x1(%rdx),%r8
   1b28a:	49 89 cb             	mov    %rcx,%r11
   1b28d:	4d 21 c3             	and    %r8,%r11
   1b290:	48 89 d3             	mov    %rdx,%rbx
   1b293:	4c 29 db             	sub    %r11,%rbx
   1b296:	48 85 c9             	test   %rcx,%rcx
   1b299:	48 0f 49 df          	cmovns %rdi,%rbx
   1b29d:	49 8d 3c 12          	lea    (%r10,%rdx,1),%rdi
   1b2a1:	4d 89 d3             	mov    %r10,%r11
   1b2a4:	4d 21 c3             	and    %r8,%r11
   1b2a7:	49 89 d6             	mov    %rdx,%r14
   1b2aa:	4d 29 de             	sub    %r11,%r14
   1b2ad:	4d 85 d2             	test   %r10,%r10
   1b2b0:	4c 0f 49 f7          	cmovns %rdi,%r14
   1b2b4:	48 8b 7e 10          	mov    0x10(%rsi),%rdi
   1b2b8:	4c 39 f3             	cmp    %r14,%rbx
   1b2bb:	49 0f 42 ca          	cmovb  %r10,%rcx
   1b2bf:	48 8d 34 17          	lea    (%rdi,%rdx,1),%rsi
   1b2c3:	49 89 fa             	mov    %rdi,%r10
   1b2c6:	4d 21 c2             	and    %r8,%r10
   1b2c9:	49 89 d3             	mov    %rdx,%r11
   1b2cc:	4d 29 d3             	sub    %r10,%r11
   1b2cf:	48 85 ff             	test   %rdi,%rdi
   1b2d2:	4c 0f 49 de          	cmovns %rsi,%r11
   1b2d6:	49 8d 34 11          	lea    (%r9,%rdx,1),%rsi
   1b2da:	4d 89 ca             	mov    %r9,%r10
   1b2dd:	4d 21 c2             	and    %r8,%r10
   1b2e0:	48 89 d3             	mov    %rdx,%rbx
   1b2e3:	4c 29 d3             	sub    %r10,%rbx
   1b2e6:	4d 85 c9             	test   %r9,%r9
   1b2e9:	48 0f 49 de          	cmovns %rsi,%rbx
   1b2ed:	49 39 db             	cmp    %rbx,%r11
   1b2f0:	49 0f 47 f9          	cmova  %r9,%rdi
   1b2f4:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
   1b2f8:	49 89 c9             	mov    %rcx,%r9
   1b2fb:	4d 21 c1             	and    %r8,%r9
   1b2fe:	49 89 d2             	mov    %rdx,%r10
   1b301:	4d 29 ca             	sub    %r9,%r10
   1b304:	48 85 c9             	test   %rcx,%rcx
   1b307:	4c 0f 49 d6          	cmovns %rsi,%r10
   1b30b:	48 8d 34 17          	lea    (%rdi,%rdx,1),%rsi
   1b30f:	49 21 f8             	and    %rdi,%r8
   1b312:	4c 29 c2             	sub    %r8,%rdx
   1b315:	48 85 ff             	test   %rdi,%rdi
   1b318:	48 0f 49 d6          	cmovns %rsi,%rdx
   1b31c:	45 31 c0             	xor    %r8d,%r8d
   1b31f:	49 39 d2             	cmp    %rdx,%r10
   1b322:	41 0f 96 c0          	setbe  %r8b
   1b326:	5b                   	pop    %rbx
   1b327:	41 5e                	pop    %r14
   1b329:	4c 89 00             	mov    %r8,(%rax)
   1b32c:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1b330:	48 89 78 10          	mov    %rdi,0x10(%rax)
   1b334:	c3                   	ret
   1b335:	4c 89 00             	mov    %r8,(%rax)
   1b338:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1b33c:	48 89 78 10          	mov    %rdi,0x10(%rax)
   1b340:	c3                   	ret
   1b341:	cc                   	int3
   1b342:	cc                   	int3
   1b343:	cc                   	int3
   1b344:	cc                   	int3
   1b345:	cc                   	int3
   1b346:	cc                   	int3
   1b347:	cc                   	int3
   1b348:	cc                   	int3
   1b349:	cc                   	int3
   1b34a:	cc                   	int3
   1b34b:	cc                   	int3
   1b34c:	cc                   	int3
   1b34d:	cc                   	int3
   1b34e:	cc                   	int3
   1b34f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::contains_point:
   1b350:	41 56                	push   %r14
   1b352:	53                   	push   %rbx
   1b353:	48 83 ec 18          	sub    $0x18,%rsp
   1b357:	49 89 fe             	mov    %rdi,%r14
   1b35a:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1b361:	00 00 80 
   1b364:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1b369:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1b36e:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1b375:	00 f0 7f 
   1b378:	48 89 de             	mov    %rbx,%rsi
   1b37b:	e8 b0 12 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1b380:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1b385:	3c 01                	cmp    $0x1,%al
   1b387:	75 0d                	jne    1b396 <<hyperinterval::float::F64Enclosure>::contains_point+0x46>
   1b389:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   1b38e:	48 83 c4 18          	add    $0x18,%rsp
   1b392:	5b                   	pop    %rbx
   1b393:	41 5e                	pop    %r14
   1b395:	c3                   	ret
   1b396:	49 83 3e 01          	cmpq   $0x1,(%r14)
   1b39a:	75 40                	jne    1b3dc <<hyperinterval::float::F64Enclosure>::contains_point+0x8c>
   1b39c:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1b3a1:	49 8b 56 08          	mov    0x8(%r14),%rdx
   1b3a5:	48 8d 3c 1a          	lea    (%rdx,%rbx,1),%rdi
   1b3a9:	48 8d 4b ff          	lea    -0x1(%rbx),%rcx
   1b3ad:	49 89 d0             	mov    %rdx,%r8
   1b3b0:	49 21 c8             	and    %rcx,%r8
   1b3b3:	49 89 d9             	mov    %rbx,%r9
   1b3b6:	4d 29 c1             	sub    %r8,%r9
   1b3b9:	48 85 d2             	test   %rdx,%rdx
   1b3bc:	4c 0f 49 cf          	cmovns %rdi,%r9
   1b3c0:	48 8d 3c 1e          	lea    (%rsi,%rbx,1),%rdi
   1b3c4:	49 89 f0             	mov    %rsi,%r8
   1b3c7:	49 21 c8             	and    %rcx,%r8
   1b3ca:	48 89 da             	mov    %rbx,%rdx
   1b3cd:	4c 29 c2             	sub    %r8,%rdx
   1b3d0:	48 85 f6             	test   %rsi,%rsi
   1b3d3:	48 0f 49 d7          	cmovns %rdi,%rdx
   1b3d7:	49 39 d1             	cmp    %rdx,%r9
   1b3da:	76 0a                	jbe    1b3e6 <<hyperinterval::float::F64Enclosure>::contains_point+0x96>
   1b3dc:	31 d2                	xor    %edx,%edx
   1b3de:	48 83 c4 18          	add    $0x18,%rsp
   1b3e2:	5b                   	pop    %rbx
   1b3e3:	41 5e                	pop    %r14
   1b3e5:	c3                   	ret
   1b3e6:	49 8b 76 10          	mov    0x10(%r14),%rsi
   1b3ea:	48 8d 3c 1e          	lea    (%rsi,%rbx,1),%rdi
   1b3ee:	48 21 f1             	and    %rsi,%rcx
   1b3f1:	48 29 cb             	sub    %rcx,%rbx
   1b3f4:	48 85 f6             	test   %rsi,%rsi
   1b3f7:	48 0f 49 df          	cmovns %rdi,%rbx
   1b3fb:	48 39 da             	cmp    %rbx,%rdx
   1b3fe:	0f 96 c2             	setbe  %dl
   1b401:	48 83 c4 18          	add    $0x18,%rsp
   1b405:	5b                   	pop    %rbx
   1b406:	41 5e                	pop    %r14
   1b408:	c3                   	ret
   1b409:	cc                   	int3
   1b40a:	cc                   	int3
   1b40b:	cc                   	int3
   1b40c:	cc                   	int3
   1b40d:	cc                   	int3
   1b40e:	cc                   	int3
   1b40f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::interior_subset_of:
   1b410:	b0 01                	mov    $0x1,%al
   1b412:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1b416:	0f 85 8b 00 00 00    	jne    1b4a7 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x97>
   1b41c:	f6 06 01             	testb  $0x1,(%rsi)
   1b41f:	0f 84 80 00 00 00    	je     1b4a5 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x95>
   1b425:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1b429:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1b42d:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1b434:	00 00 80 
   1b437:	4d 8d 0c 00          	lea    (%r8,%rax,1),%r9
   1b43b:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1b43f:	4d 89 c2             	mov    %r8,%r10
   1b442:	49 21 ca             	and    %rcx,%r10
   1b445:	49 89 c3             	mov    %rax,%r11
   1b448:	4d 29 d3             	sub    %r10,%r11
   1b44b:	4d 85 c0             	test   %r8,%r8
   1b44e:	4d 0f 49 d9          	cmovns %r9,%r11
   1b452:	4c 8d 04 02          	lea    (%rdx,%rax,1),%r8
   1b456:	49 89 d1             	mov    %rdx,%r9
   1b459:	49 21 c9             	and    %rcx,%r9
   1b45c:	49 89 c2             	mov    %rax,%r10
   1b45f:	4d 29 ca             	sub    %r9,%r10
   1b462:	48 85 d2             	test   %rdx,%rdx
   1b465:	4d 0f 49 d0          	cmovns %r8,%r10
   1b469:	4d 39 d3             	cmp    %r10,%r11
   1b46c:	73 37                	jae    1b4a5 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x95>
   1b46e:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1b472:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1b476:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1b47a:	49 89 d0             	mov    %rdx,%r8
   1b47d:	49 21 c8             	and    %rcx,%r8
   1b480:	49 89 c1             	mov    %rax,%r9
   1b483:	4d 29 c1             	sub    %r8,%r9
   1b486:	48 85 d2             	test   %rdx,%rdx
   1b489:	4c 0f 49 cf          	cmovns %rdi,%r9
   1b48d:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1b491:	48 21 f1             	and    %rsi,%rcx
   1b494:	48 29 c8             	sub    %rcx,%rax
   1b497:	48 85 f6             	test   %rsi,%rsi
   1b49a:	48 0f 49 c2          	cmovns %rdx,%rax
   1b49e:	49 39 c1             	cmp    %rax,%r9
   1b4a1:	0f 92 c0             	setb   %al
   1b4a4:	c3                   	ret
   1b4a5:	31 c0                	xor    %eax,%eax
   1b4a7:	c3                   	ret
   1b4a8:	cc                   	int3
   1b4a9:	cc                   	int3
   1b4aa:	cc                   	int3
   1b4ab:	cc                   	int3
   1b4ac:	cc                   	int3
   1b4ad:	cc                   	int3
   1b4ae:	cc                   	int3
   1b4af:	cc                   	int3

<hyperinterval::float::F64Enclosure>::add:
   1b4b0:	48 89 f8             	mov    %rdi,%rax
   1b4b3:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b4b7:	0f 85 cb 00 00 00    	jne    1b588 <<hyperinterval::float::F64Enclosure>::add+0xd8>
   1b4bd:	f6 02 01             	testb  $0x1,(%rdx)
   1b4c0:	0f 84 c2 00 00 00    	je     1b588 <<hyperinterval::float::F64Enclosure>::add+0xd8>
   1b4c6:	55                   	push   %rbp
   1b4c7:	41 57                	push   %r15
   1b4c9:	41 56                	push   %r14
   1b4cb:	41 55                	push   %r13
   1b4cd:	41 54                	push   %r12
   1b4cf:	53                   	push   %rbx
   1b4d0:	48 83 ec 18          	sub    $0x18,%rsp
   1b4d4:	48 89 c5             	mov    %rax,%rbp
   1b4d7:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1b4db:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1b4df:	4c 8b 62 10          	mov    0x10(%rdx),%r12
   1b4e3:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1b4ea:	00 00 80 
   1b4ed:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1b4f4:	00 f0 7f 
   1b4f7:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   1b4fb:	48 89 e7             	mov    %rsp,%rdi
   1b4fe:	48 89 de             	mov    %rbx,%rsi
   1b501:	4c 89 f2             	mov    %r14,%rdx
   1b504:	e8 67 11 00 00       	call   1c670 <<hyperinterval::ieee::Format>::add>
   1b509:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b50d:	74 57                	je     1b566 <<hyperinterval::float::F64Enclosure>::add+0xb6>
   1b50f:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1b514:	48 89 e7             	mov    %rsp,%rdi
   1b517:	48 89 de             	mov    %rbx,%rsi
   1b51a:	4c 89 f2             	mov    %r14,%rdx
   1b51d:	4c 89 f9             	mov    %r15,%rcx
   1b520:	4d 89 e0             	mov    %r12,%r8
   1b523:	e8 48 11 00 00       	call   1c670 <<hyperinterval::ieee::Format>::add>
   1b528:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b52c:	74 38                	je     1b566 <<hyperinterval::float::F64Enclosure>::add+0xb6>
   1b52e:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1b533:	48 89 e7             	mov    %rsp,%rdi
   1b536:	48 89 de             	mov    %rbx,%rsi
   1b539:	4c 89 f2             	mov    %r14,%rdx
   1b53c:	4c 89 e9             	mov    %r13,%rcx
   1b53f:	e8 ec 10 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1b544:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b548:	74 1c                	je     1b566 <<hyperinterval::float::F64Enclosure>::add+0xb6>
   1b54a:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1b54f:	48 89 e7             	mov    %rsp,%rdi
   1b552:	48 89 de             	mov    %rbx,%rsi
   1b555:	4c 89 f2             	mov    %r14,%rdx
   1b558:	4c 89 f9             	mov    %r15,%rcx
   1b55b:	e8 d0 10 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1b560:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b564:	75 2a                	jne    1b590 <<hyperinterval::float::F64Enclosure>::add+0xe0>
   1b566:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   1b56b:	48 89 e8             	mov    %rbp,%rax
   1b56e:	88 4d 08             	mov    %cl,0x8(%rbp)
   1b571:	48 c7 45 00 02 00 00 	movq   $0x2,0x0(%rbp)
   1b578:	00 
   1b579:	48 83 c4 18          	add    $0x18,%rsp
   1b57d:	5b                   	pop    %rbx
   1b57e:	41 5c                	pop    %r12
   1b580:	41 5d                	pop    %r13
   1b582:	41 5e                	pop    %r14
   1b584:	41 5f                	pop    %r15
   1b586:	5d                   	pop    %rbp
   1b587:	c3                   	ret
   1b588:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   1b58f:	c3                   	ret
   1b590:	49 8d 04 1c          	lea    (%r12,%rbx,1),%rax
   1b594:	48 8d 53 ff          	lea    -0x1(%rbx),%rdx
   1b598:	4c 89 e1             	mov    %r12,%rcx
   1b59b:	48 21 d1             	and    %rdx,%rcx
   1b59e:	48 89 de             	mov    %rbx,%rsi
   1b5a1:	48 29 ce             	sub    %rcx,%rsi
   1b5a4:	4d 85 e4             	test   %r12,%r12
   1b5a7:	48 0f 49 f0          	cmovns %rax,%rsi
   1b5ab:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b5b0:	48 8d 04 19          	lea    (%rcx,%rbx,1),%rax
   1b5b4:	48 21 ca             	and    %rcx,%rdx
   1b5b7:	48 29 d3             	sub    %rdx,%rbx
   1b5ba:	48 85 c9             	test   %rcx,%rcx
   1b5bd:	48 0f 49 d8          	cmovns %rax,%rbx
   1b5c1:	48 39 de             	cmp    %rbx,%rsi
   1b5c4:	48 89 e8             	mov    %rbp,%rax
   1b5c7:	76 0d                	jbe    1b5d6 <<hyperinterval::float::F64Enclosure>::add+0x126>
   1b5c9:	c6 40 08 01          	movb   $0x1,0x8(%rax)
   1b5cd:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1b5d4:	eb a3                	jmp    1b579 <<hyperinterval::float::F64Enclosure>::add+0xc9>
   1b5d6:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   1b5dd:	4c 89 60 08          	mov    %r12,0x8(%rax)
   1b5e1:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1b5e5:	eb 92                	jmp    1b579 <<hyperinterval::float::F64Enclosure>::add+0xc9>
   1b5e7:	cc                   	int3
   1b5e8:	cc                   	int3
   1b5e9:	cc                   	int3
   1b5ea:	cc                   	int3
   1b5eb:	cc                   	int3
   1b5ec:	cc                   	int3
   1b5ed:	cc                   	int3
   1b5ee:	cc                   	int3
   1b5ef:	cc                   	int3

<hyperinterval::float::F64Enclosure>::div:
   1b5f0:	53                   	push   %rbx
   1b5f1:	48 89 fb             	mov    %rdi,%rbx
   1b5f4:	83 3a 01             	cmpl   $0x1,(%rdx)
   1b5f7:	75 1e                	jne    1b617 <<hyperinterval::float::F64Enclosure>::div+0x27>
   1b5f9:	48 83 7a 08 00       	cmpq   $0x0,0x8(%rdx)
   1b5fe:	7f 17                	jg     1b617 <<hyperinterval::float::F64Enclosure>::div+0x27>
   1b600:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1b604:	48 85 c0             	test   %rax,%rax
   1b607:	0f 99 c1             	setns  %cl
   1b60a:	48 d1 e0             	shl    $1,%rax
   1b60d:	48 85 c0             	test   %rax,%rax
   1b610:	0f 94 c0             	sete   %al
   1b613:	08 c8                	or     %cl,%al
   1b615:	75 12                	jne    1b629 <<hyperinterval::float::F64Enclosure>::div+0x39>
   1b617:	48 89 df             	mov    %rbx,%rdi
   1b61a:	b9 01 00 00 00       	mov    $0x1,%ecx
   1b61f:	e8 8c f4 ff ff       	call   1aab0 <<hyperinterval::float::F64Enclosure>::corner_image>
   1b624:	48 89 d8             	mov    %rbx,%rax
   1b627:	5b                   	pop    %rbx
   1b628:	c3                   	ret
   1b629:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
   1b62d:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b634:	48 89 d8             	mov    %rbx,%rax
   1b637:	5b                   	pop    %rbx
   1b638:	c3                   	ret
   1b639:	cc                   	int3
   1b63a:	cc                   	int3
   1b63b:	cc                   	int3
   1b63c:	cc                   	int3
   1b63d:	cc                   	int3
   1b63e:	cc                   	int3
   1b63f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::new:
   1b640:	41 57                	push   %r15
   1b642:	41 56                	push   %r14
   1b644:	41 54                	push   %r12
   1b646:	53                   	push   %rbx
   1b647:	48 83 ec 18          	sub    $0x18,%rsp
   1b64b:	f2 0f 11 4c 24 10    	movsd  %xmm1,0x10(%rsp)
   1b651:	48 89 fb             	mov    %rdi,%rbx
   1b654:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b65b:	00 00 80 
   1b65e:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1b665:	00 f0 7f 
   1b668:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1b66d:	48 89 e7             	mov    %rsp,%rdi
   1b670:	4c 89 f6             	mov    %r14,%rsi
   1b673:	4c 89 fa             	mov    %r15,%rdx
   1b676:	e8 b5 0f 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1b67b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b67f:	74 24                	je     1b6a5 <<hyperinterval::float::F64Enclosure>::new+0x65>
   1b681:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1b686:	f3 0f 7e 44 24 10    	movq   0x10(%rsp),%xmm0
   1b68c:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1b691:	48 89 e7             	mov    %rsp,%rdi
   1b694:	4c 89 f6             	mov    %r14,%rsi
   1b697:	4c 89 fa             	mov    %r15,%rdx
   1b69a:	e8 91 0f 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1b69f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b6a3:	75 1e                	jne    1b6c3 <<hyperinterval::float::F64Enclosure>::new+0x83>
   1b6a5:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1b6aa:	88 43 08             	mov    %al,0x8(%rbx)
   1b6ad:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b6b4:	48 89 d8             	mov    %rbx,%rax
   1b6b7:	48 83 c4 18          	add    $0x18,%rsp
   1b6bb:	5b                   	pop    %rbx
   1b6bc:	41 5c                	pop    %r12
   1b6be:	41 5e                	pop    %r14
   1b6c0:	41 5f                	pop    %r15
   1b6c2:	c3                   	ret
   1b6c3:	4b 8d 04 34          	lea    (%r12,%r14,1),%rax
   1b6c7:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1b6cb:	4c 89 e2             	mov    %r12,%rdx
   1b6ce:	48 21 ca             	and    %rcx,%rdx
   1b6d1:	4c 89 f6             	mov    %r14,%rsi
   1b6d4:	48 29 d6             	sub    %rdx,%rsi
   1b6d7:	4d 85 e4             	test   %r12,%r12
   1b6da:	48 0f 49 f0          	cmovns %rax,%rsi
   1b6de:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b6e3:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1b6e7:	48 21 c1             	and    %rax,%rcx
   1b6ea:	49 29 ce             	sub    %rcx,%r14
   1b6ed:	48 85 c0             	test   %rax,%rax
   1b6f0:	4c 0f 49 f2          	cmovns %rdx,%r14
   1b6f4:	4c 39 f6             	cmp    %r14,%rsi
   1b6f7:	76 06                	jbe    1b6ff <<hyperinterval::float::F64Enclosure>::new+0xbf>
   1b6f9:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1b6fd:	eb ae                	jmp    1b6ad <<hyperinterval::float::F64Enclosure>::new+0x6d>
   1b6ff:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1b706:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   1b70a:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1b70e:	eb a4                	jmp    1b6b4 <<hyperinterval::float::F64Enclosure>::new+0x74>

<hyperinterval::float::F64Enclosure>::sub:
   1b710:	53                   	push   %rbx
   1b711:	48 83 ec 20          	sub    $0x20,%rsp
   1b715:	48 89 fb             	mov    %rdi,%rbx
   1b718:	48 83 3a 01          	cmpq   $0x1,(%rdx)
   1b71c:	75 30                	jne    1b74e <<hyperinterval::float::F64Enclosure>::sub+0x3e>
   1b71e:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   1b722:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1b726:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1b72d:	00 00 80 
   1b730:	48 89 d1             	mov    %rdx,%rcx
   1b733:	48 31 c1             	xor    %rax,%rcx
   1b736:	48 85 d2             	test   %rdx,%rdx
   1b739:	48 0f 44 ca          	cmove  %rdx,%rcx
   1b73d:	48 31 f8             	xor    %rdi,%rax
   1b740:	48 85 ff             	test   %rdi,%rdi
   1b743:	48 0f 44 c7          	cmove  %rdi,%rax
   1b747:	ba 01 00 00 00       	mov    $0x1,%edx
   1b74c:	eb 02                	jmp    1b750 <<hyperinterval::float::F64Enclosure>::sub+0x40>
   1b74e:	31 d2                	xor    %edx,%edx
   1b750:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b755:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
   1b75a:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1b75f:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
   1b764:	48 89 df             	mov    %rbx,%rdi
   1b767:	ff 15 eb 1e 04 00    	call   *0x41eeb(%rip)        # 5d658 <_DYNAMIC+0x300>
   1b76d:	48 89 d8             	mov    %rbx,%rax
   1b770:	48 83 c4 20          	add    $0x20,%rsp
   1b774:	5b                   	pop    %rbx
   1b775:	c3                   	ret
   1b776:	cc                   	int3
   1b777:	cc                   	int3
   1b778:	cc                   	int3
   1b779:	cc                   	int3
   1b77a:	cc                   	int3
   1b77b:	cc                   	int3
   1b77c:	cc                   	int3
   1b77d:	cc                   	int3
   1b77e:	cc                   	int3
   1b77f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::hull:
   1b780:	48 89 f8             	mov    %rdi,%rax
   1b783:	4c 8b 02             	mov    (%rdx),%r8
   1b786:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   1b78a:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
   1b78e:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b792:	0f 85 9f 00 00 00    	jne    1b837 <<hyperinterval::float::F64Enclosure>::hull+0xb7>
   1b798:	4c 8b 56 08          	mov    0x8(%rsi),%r10
   1b79c:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1b7a0:	ba 01 00 00 00       	mov    $0x1,%edx
   1b7a5:	49 83 f8 01          	cmp    $0x1,%r8
   1b7a9:	0f 85 97 00 00 00    	jne    1b846 <<hyperinterval::float::F64Enclosure>::hull+0xc6>
   1b7af:	41 57                	push   %r15
   1b7b1:	41 56                	push   %r14
   1b7b3:	53                   	push   %rbx
   1b7b4:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1b7bb:	00 00 80 
   1b7be:	4f 8d 1c 02          	lea    (%r10,%r8,1),%r11
   1b7c2:	4d 8d 48 ff          	lea    -0x1(%r8),%r9
   1b7c6:	4c 89 d3             	mov    %r10,%rbx
   1b7c9:	4c 21 cb             	and    %r9,%rbx
   1b7cc:	4d 89 c6             	mov    %r8,%r14
   1b7cf:	49 29 de             	sub    %rbx,%r14
   1b7d2:	4d 85 d2             	test   %r10,%r10
   1b7d5:	4d 0f 49 f3          	cmovns %r11,%r14
   1b7d9:	4e 8d 1c 07          	lea    (%rdi,%r8,1),%r11
   1b7dd:	48 89 fb             	mov    %rdi,%rbx
   1b7e0:	4c 21 cb             	and    %r9,%rbx
   1b7e3:	4d 89 c7             	mov    %r8,%r15
   1b7e6:	49 29 df             	sub    %rbx,%r15
   1b7e9:	48 85 ff             	test   %rdi,%rdi
   1b7ec:	4d 0f 49 fb          	cmovns %r11,%r15
   1b7f0:	4d 39 fe             	cmp    %r15,%r14
   1b7f3:	49 0f 46 fa          	cmovbe %r10,%rdi
   1b7f7:	4e 8d 14 06          	lea    (%rsi,%r8,1),%r10
   1b7fb:	49 89 f3             	mov    %rsi,%r11
   1b7fe:	4d 21 cb             	and    %r9,%r11
   1b801:	4c 89 c3             	mov    %r8,%rbx
   1b804:	4c 29 db             	sub    %r11,%rbx
   1b807:	48 85 f6             	test   %rsi,%rsi
   1b80a:	49 0f 49 da          	cmovns %r10,%rbx
   1b80e:	4e 8d 14 01          	lea    (%rcx,%r8,1),%r10
   1b812:	49 21 c9             	and    %rcx,%r9
   1b815:	4d 29 c8             	sub    %r9,%r8
   1b818:	48 85 c9             	test   %rcx,%rcx
   1b81b:	4d 0f 49 c2          	cmovns %r10,%r8
   1b81f:	4c 39 c3             	cmp    %r8,%rbx
   1b822:	48 0f 43 ce          	cmovae %rsi,%rcx
   1b826:	5b                   	pop    %rbx
   1b827:	41 5e                	pop    %r14
   1b829:	41 5f                	pop    %r15
   1b82b:	48 89 10             	mov    %rdx,(%rax)
   1b82e:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1b832:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1b836:	c3                   	ret
   1b837:	4c 89 c2             	mov    %r8,%rdx
   1b83a:	48 89 10             	mov    %rdx,(%rax)
   1b83d:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1b841:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1b845:	c3                   	ret
   1b846:	48 89 f1             	mov    %rsi,%rcx
   1b849:	4c 89 d7             	mov    %r10,%rdi
   1b84c:	48 89 10             	mov    %rdx,(%rax)
   1b84f:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1b853:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1b857:	c3                   	ret
   1b858:	cc                   	int3
   1b859:	cc                   	int3
   1b85a:	cc                   	int3
   1b85b:	cc                   	int3
   1b85c:	cc                   	int3
   1b85d:	cc                   	int3
   1b85e:	cc                   	int3
   1b85f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::sqrt:
   1b860:	48 89 f8             	mov    %rdi,%rax
   1b863:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b867:	75 3a                	jne    1b8a3 <<hyperinterval::float::F64Enclosure>::sqrt+0x43>
   1b869:	55                   	push   %rbp
   1b86a:	41 57                	push   %r15
   1b86c:	41 56                	push   %r14
   1b86e:	41 55                	push   %r13
   1b870:	41 54                	push   %r12
   1b872:	53                   	push   %rbx
   1b873:	48 83 ec 28          	sub    $0x28,%rsp
   1b877:	4c 8b 6e 08          	mov    0x8(%rsi),%r13
   1b87b:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1b87f:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1b886:	00 00 80 
   1b889:	48 8d 6b ff          	lea    -0x1(%rbx),%rbp
   1b88d:	4d 85 ff             	test   %r15,%r15
   1b890:	79 1d                	jns    1b8af <<hyperinterval::float::F64Enclosure>::sqrt+0x4f>
   1b892:	4c 89 f9             	mov    %r15,%rcx
   1b895:	48 21 e9             	and    %rbp,%rcx
   1b898:	74 15                	je     1b8af <<hyperinterval::float::F64Enclosure>::sqrt+0x4f>
   1b89a:	c6 40 08 05          	movb   $0x5,0x8(%rax)
   1b89e:	e9 da 00 00 00       	jmp    1b97d <<hyperinterval::float::F64Enclosure>::sqrt+0x11d>
   1b8a3:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   1b8aa:	c6 40 18 00          	movb   $0x0,0x18(%rax)
   1b8ae:	c3                   	ret
   1b8af:	48 89 04 24          	mov    %rax,(%rsp)
   1b8b3:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1b8ba:	00 f0 7f 
   1b8bd:	4d 85 ed             	test   %r13,%r13
   1b8c0:	0f 98 c0             	sets   %al
   1b8c3:	49 85 ed             	test   %rbp,%r13
   1b8c6:	41 0f 95 c6          	setne  %r14b
   1b8ca:	31 c9                	xor    %ecx,%ecx
   1b8cc:	41 20 c6             	and    %al,%r14b
   1b8cf:	49 0f 44 cd          	cmove  %r13,%rcx
   1b8d3:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1b8d8:	48 89 de             	mov    %rbx,%rsi
   1b8db:	49 89 d4             	mov    %rdx,%r12
   1b8de:	e8 4d 15 00 00       	call   1ce30 <<hyperinterval::ieee::Format>::sqrt>
   1b8e3:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   1b8e8:	74 11                	je     1b8fb <<hyperinterval::float::F64Enclosure>::sqrt+0x9b>
   1b8ea:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   1b8ef:	48 8b 04 24          	mov    (%rsp),%rax
   1b8f3:	88 48 08             	mov    %cl,0x8(%rax)
   1b8f6:	e9 82 00 00 00       	jmp    1b97d <<hyperinterval::float::F64Enclosure>::sqrt+0x11d>
   1b8fb:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1b900:	4d 39 fd             	cmp    %r15,%r13
   1b903:	75 0a                	jne    1b90f <<hyperinterval::float::F64Enclosure>::sqrt+0xaf>
   1b905:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
   1b90a:	4d 89 e5             	mov    %r12,%r13
   1b90d:	eb 2c                	jmp    1b93b <<hyperinterval::float::F64Enclosure>::sqrt+0xdb>
   1b90f:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   1b914:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1b919:	48 89 de             	mov    %rbx,%rsi
   1b91c:	4d 89 e5             	mov    %r12,%r13
   1b91f:	4c 89 e2             	mov    %r12,%rdx
   1b922:	4c 89 f9             	mov    %r15,%rcx
   1b925:	e8 06 15 00 00       	call   1ce30 <<hyperinterval::ieee::Format>::sqrt>
   1b92a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1b92f:	74 b9                	je     1b8ea <<hyperinterval::float::F64Enclosure>::sqrt+0x8a>
   1b931:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
   1b936:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1b93b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1b940:	48 89 de             	mov    %rbx,%rsi
   1b943:	4c 89 ea             	mov    %r13,%rdx
   1b946:	e8 e5 0c 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1b94b:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1b950:	74 1f                	je     1b971 <<hyperinterval::float::F64Enclosure>::sqrt+0x111>
   1b952:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1b957:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1b95c:	48 89 de             	mov    %rbx,%rsi
   1b95f:	4c 89 ea             	mov    %r13,%rdx
   1b962:	4c 89 f9             	mov    %r15,%rcx
   1b965:	e8 c6 0c 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1b96a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1b96f:	75 22                	jne    1b993 <<hyperinterval::float::F64Enclosure>::sqrt+0x133>
   1b971:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   1b976:	48 8b 04 24          	mov    (%rsp),%rax
   1b97a:	88 50 08             	mov    %dl,0x8(%rax)
   1b97d:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1b984:	48 83 c4 28          	add    $0x28,%rsp
   1b988:	5b                   	pop    %rbx
   1b989:	41 5c                	pop    %r12
   1b98b:	41 5d                	pop    %r13
   1b98d:	41 5e                	pop    %r14
   1b98f:	41 5f                	pop    %r15
   1b991:	5d                   	pop    %rbp
   1b992:	c3                   	ret
   1b993:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1b998:	49 8d 04 1c          	lea    (%r12,%rbx,1),%rax
   1b99c:	4c 89 e2             	mov    %r12,%rdx
   1b99f:	48 21 ea             	and    %rbp,%rdx
   1b9a2:	48 89 de             	mov    %rbx,%rsi
   1b9a5:	48 29 d6             	sub    %rdx,%rsi
   1b9a8:	4d 85 e4             	test   %r12,%r12
   1b9ab:	48 0f 49 f0          	cmovns %rax,%rsi
   1b9af:	48 8d 04 19          	lea    (%rcx,%rbx,1),%rax
   1b9b3:	48 21 cd             	and    %rcx,%rbp
   1b9b6:	48 29 eb             	sub    %rbp,%rbx
   1b9b9:	48 85 c9             	test   %rcx,%rcx
   1b9bc:	48 0f 49 d8          	cmovns %rax,%rbx
   1b9c0:	b2 01                	mov    $0x1,%dl
   1b9c2:	48 39 de             	cmp    %rbx,%rsi
   1b9c5:	48 8b 04 24          	mov    (%rsp),%rax
   1b9c9:	77 af                	ja     1b97a <<hyperinterval::float::F64Enclosure>::sqrt+0x11a>
   1b9cb:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   1b9d2:	4c 89 60 08          	mov    %r12,0x8(%rax)
   1b9d6:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1b9da:	44 88 70 18          	mov    %r14b,0x18(%rax)
   1b9de:	eb a4                	jmp    1b984 <<hyperinterval::float::F64Enclosure>::sqrt+0x124>

<hyperinterval::float::F64Enclosure>::point:
   1b9e0:	53                   	push   %rbx
   1b9e1:	48 83 ec 10          	sub    $0x10,%rsp
   1b9e5:	48 89 fb             	mov    %rdi,%rbx
   1b9e8:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1b9ed:	48 89 e7             	mov    %rsp,%rdi
   1b9f0:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b9f7:	00 00 80 
   1b9fa:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1ba01:	00 f0 7f 
   1ba04:	e8 27 0c 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1ba09:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1ba0d:	75 0f                	jne    1ba1e <<hyperinterval::float::F64Enclosure>::point+0x3e>
   1ba0f:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1ba14:	88 43 08             	mov    %al,0x8(%rbx)
   1ba17:	b8 02 00 00 00       	mov    $0x2,%eax
   1ba1c:	eb 12                	jmp    1ba30 <<hyperinterval::float::F64Enclosure>::point+0x50>
   1ba1e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1ba23:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1ba27:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1ba2b:	b8 01 00 00 00       	mov    $0x1,%eax
   1ba30:	48 89 03             	mov    %rax,(%rbx)
   1ba33:	48 89 d8             	mov    %rbx,%rax
   1ba36:	48 83 c4 10          	add    $0x10,%rsp
   1ba3a:	5b                   	pop    %rbx
   1ba3b:	c3                   	ret
   1ba3c:	cc                   	int3
   1ba3d:	cc                   	int3
   1ba3e:	cc                   	int3
   1ba3f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::signs:
   1ba40:	83 3f 01             	cmpl   $0x1,(%rdi)
   1ba43:	75 69                	jne    1baae <<hyperinterval::float::F64Enclosure>::signs+0x6e>
   1ba45:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1ba4c:	00 00 80 
   1ba4f:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   1ba53:	48 8b 47 10          	mov    0x10(%rdi),%rax
   1ba57:	4a 8d 14 01          	lea    (%rcx,%r8,1),%rdx
   1ba5b:	49 8d 70 ff          	lea    -0x1(%r8),%rsi
   1ba5f:	49 89 c9             	mov    %rcx,%r9
   1ba62:	49 21 f1             	and    %rsi,%r9
   1ba65:	4c 89 c7             	mov    %r8,%rdi
   1ba68:	4c 29 cf             	sub    %r9,%rdi
   1ba6b:	48 85 c9             	test   %rcx,%rcx
   1ba6e:	48 0f 49 fa          	cmovns %rdx,%rdi
   1ba72:	31 d2                	xor    %edx,%edx
   1ba74:	48 85 ff             	test   %rdi,%rdi
   1ba77:	0f 99 c1             	setns  %cl
   1ba7a:	4c 39 c7             	cmp    %r8,%rdi
   1ba7d:	77 1f                	ja     1ba9e <<hyperinterval::float::F64Enclosure>::signs+0x5e>
   1ba7f:	48 85 ff             	test   %rdi,%rdi
   1ba82:	40 0f 99 c7          	setns  %dil
   1ba86:	40 80 cf 02          	or     $0x2,%dil
   1ba8a:	48 85 f0             	test   %rsi,%rax
   1ba8d:	88 ca                	mov    %cl,%dl
   1ba8f:	40 0f b6 cf          	movzbl %dil,%ecx
   1ba93:	0f 44 d1             	cmove  %ecx,%edx
   1ba96:	48 85 c0             	test   %rax,%rax
   1ba99:	0f 49 d1             	cmovns %ecx,%edx
   1ba9c:	89 d1                	mov    %edx,%ecx
   1ba9e:	8d 51 04             	lea    0x4(%rcx),%edx
   1baa1:	48 85 c0             	test   %rax,%rax
   1baa4:	0f b6 c9             	movzbl %cl,%ecx
   1baa7:	0f b6 c2             	movzbl %dl,%eax
   1baaa:	0f 4e c1             	cmovle %ecx,%eax
   1baad:	c3                   	ret
   1baae:	31 c0                	xor    %eax,%eax
   1bab0:	c3                   	ret
   1bab1:	cc                   	int3
   1bab2:	cc                   	int3
   1bab3:	cc                   	int3
   1bab4:	cc                   	int3
   1bab5:	cc                   	int3
   1bab6:	cc                   	int3
   1bab7:	cc                   	int3
   1bab8:	cc                   	int3
   1bab9:	cc                   	int3
   1baba:	cc                   	int3
   1babb:	cc                   	int3
   1babc:	cc                   	int3
   1babd:	cc                   	int3
   1babe:	cc                   	int3
   1babf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::affine:
   1bac0:	55                   	push   %rbp
   1bac1:	41 57                	push   %r15
   1bac3:	41 56                	push   %r14
   1bac5:	41 55                	push   %r13
   1bac7:	41 54                	push   %r12
   1bac9:	53                   	push   %rbx
   1baca:	48 83 ec 28          	sub    $0x28,%rsp
   1bace:	f2 0f 11 4c 24 18    	movsd  %xmm1,0x18(%rsp)
   1bad4:	49 89 f5             	mov    %rsi,%r13
   1bad7:	48 89 fb             	mov    %rdi,%rbx
   1bada:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1bae1:	00 00 80 
   1bae4:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1baeb:	00 f0 7f 
   1baee:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1baf3:	48 89 e7             	mov    %rsp,%rdi
   1baf6:	4c 89 f6             	mov    %r14,%rsi
   1baf9:	4c 89 fa             	mov    %r15,%rdx
   1bafc:	e8 2f 0b 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1bb01:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bb05:	74 24                	je     1bb2b <<hyperinterval::float::F64Enclosure>::affine+0x6b>
   1bb07:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1bb0c:	f3 0f 7e 44 24 18    	movq   0x18(%rsp),%xmm0
   1bb12:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1bb17:	48 89 e7             	mov    %rsp,%rdi
   1bb1a:	4c 89 f6             	mov    %r14,%rsi
   1bb1d:	4c 89 fa             	mov    %r15,%rdx
   1bb20:	e8 0b 0b 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1bb25:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bb29:	75 21                	jne    1bb4c <<hyperinterval::float::F64Enclosure>::affine+0x8c>
   1bb2b:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1bb30:	88 43 08             	mov    %al,0x8(%rbx)
   1bb33:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1bb3a:	48 89 d8             	mov    %rbx,%rax
   1bb3d:	48 83 c4 28          	add    $0x28,%rsp
   1bb41:	5b                   	pop    %rbx
   1bb42:	41 5c                	pop    %r12
   1bb44:	41 5d                	pop    %r13
   1bb46:	41 5e                	pop    %r14
   1bb48:	41 5f                	pop    %r15
   1bb4a:	5d                   	pop    %rbp
   1bb4b:	c3                   	ret
   1bb4c:	41 f6 45 00 01       	testb  $0x1,0x0(%r13)
   1bb51:	0f 84 06 01 00 00    	je     1bc5d <<hyperinterval::float::F64Enclosure>::affine+0x19d>
   1bb57:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1bb5c:	49 8b 45 10          	mov    0x10(%r13),%rax
   1bb60:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1bb65:	49 8b 4d 08          	mov    0x8(%r13),%rcx
   1bb69:	48 89 e7             	mov    %rsp,%rdi
   1bb6c:	4c 89 f6             	mov    %r14,%rsi
   1bb6f:	4c 89 fa             	mov    %r15,%rdx
   1bb72:	4d 89 e0             	mov    %r12,%r8
   1bb75:	49 89 e9             	mov    %rbp,%r9
   1bb78:	e8 c3 1d 00 00       	call   1d940 <<hyperinterval::ieee::Format>::affine>
   1bb7d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bb81:	74 a8                	je     1bb2b <<hyperinterval::float::F64Enclosure>::affine+0x6b>
   1bb83:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1bb88:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1bb8d:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1bb92:	48 89 e7             	mov    %rsp,%rdi
   1bb95:	4c 89 f6             	mov    %r14,%rsi
   1bb98:	4c 89 fa             	mov    %r15,%rdx
   1bb9b:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1bba0:	4d 89 e0             	mov    %r12,%r8
   1bba3:	49 89 e9             	mov    %rbp,%r9
   1bba6:	e8 95 1d 00 00       	call   1d940 <<hyperinterval::ieee::Format>::affine>
   1bbab:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bbaf:	0f 84 76 ff ff ff    	je     1bb2b <<hyperinterval::float::F64Enclosure>::affine+0x6b>
   1bbb5:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1bbba:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1bbbf:	48 89 e7             	mov    %rsp,%rdi
   1bbc2:	4c 89 f6             	mov    %r14,%rsi
   1bbc5:	4c 89 fa             	mov    %r15,%rdx
   1bbc8:	4c 89 e9             	mov    %r13,%rcx
   1bbcb:	e8 60 0a 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1bbd0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bbd4:	0f 84 51 ff ff ff    	je     1bb2b <<hyperinterval::float::F64Enclosure>::affine+0x6b>
   1bbda:	4d 89 e5             	mov    %r12,%r13
   1bbdd:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1bbe2:	48 89 e7             	mov    %rsp,%rdi
   1bbe5:	4c 89 f6             	mov    %r14,%rsi
   1bbe8:	4c 89 fa             	mov    %r15,%rdx
   1bbeb:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1bbf0:	e8 3b 0a 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1bbf5:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bbf9:	0f 84 2c ff ff ff    	je     1bb2b <<hyperinterval::float::F64Enclosure>::affine+0x6b>
   1bbff:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1bc04:	4b 8d 04 34          	lea    (%r12,%r14,1),%rax
   1bc08:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1bc0c:	4c 89 e2             	mov    %r12,%rdx
   1bc0f:	48 21 ca             	and    %rcx,%rdx
   1bc12:	4c 89 f6             	mov    %r14,%rsi
   1bc15:	48 29 d6             	sub    %rdx,%rsi
   1bc18:	4d 85 e4             	test   %r12,%r12
   1bc1b:	48 0f 49 f0          	cmovns %rax,%rsi
   1bc1f:	4b 8d 04 37          	lea    (%r15,%r14,1),%rax
   1bc23:	4c 21 f9             	and    %r15,%rcx
   1bc26:	49 29 ce             	sub    %rcx,%r14
   1bc29:	4d 85 ff             	test   %r15,%r15
   1bc2c:	4c 0f 49 f0          	cmovns %rax,%r14
   1bc30:	b0 01                	mov    $0x1,%al
   1bc32:	4c 39 f6             	cmp    %r14,%rsi
   1bc35:	0f 87 f5 fe ff ff    	ja     1bb30 <<hyperinterval::float::F64Enclosure>::affine+0x70>
   1bc3b:	48 89 e7             	mov    %rsp,%rdi
   1bc3e:	4c 89 ee             	mov    %r13,%rsi
   1bc41:	48 89 ea             	mov    %rbp,%rdx
   1bc44:	e8 57 06 00 00       	call   1c2a0 <<hyperinterval::float::F64Enclosure>::from_bits>
   1bc49:	48 8b 04 24          	mov    (%rsp),%rax
   1bc4d:	48 83 f8 02          	cmp    $0x2,%rax
   1bc51:	75 16                	jne    1bc69 <<hyperinterval::float::F64Enclosure>::affine+0x1a9>
   1bc53:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1bc58:	e9 d3 fe ff ff       	jmp    1bb30 <<hyperinterval::float::F64Enclosure>::affine+0x70>
   1bc5d:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1bc64:	e9 d1 fe ff ff       	jmp    1bb3a <<hyperinterval::float::F64Enclosure>::affine+0x7a>
   1bc69:	83 f8 01             	cmp    $0x1,%eax
   1bc6c:	75 1b                	jne    1bc89 <<hyperinterval::float::F64Enclosure>::affine+0x1c9>
   1bc6e:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1bc73:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1bc78:	4c 89 e7             	mov    %r12,%rdi
   1bc7b:	4c 89 fe             	mov    %r15,%rsi
   1bc7e:	e8 ed 24 00 00       	call   1e170 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1bc83:	49 89 c4             	mov    %rax,%r12
   1bc86:	49 89 d7             	mov    %rdx,%r15
   1bc89:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1bc90:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   1bc94:	4c 89 7b 10          	mov    %r15,0x10(%rbx)
   1bc98:	e9 9d fe ff ff       	jmp    1bb3a <<hyperinterval::float::F64Enclosure>::affine+0x7a>
   1bc9d:	cc                   	int3
   1bc9e:	cc                   	int3
   1bc9f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::square:
   1bca0:	55                   	push   %rbp
   1bca1:	41 57                	push   %r15
   1bca3:	41 56                	push   %r14
   1bca5:	41 55                	push   %r13
   1bca7:	41 54                	push   %r12
   1bca9:	53                   	push   %rbx
   1bcaa:	48 83 ec 58          	sub    $0x58,%rsp
   1bcae:	48 89 fb             	mov    %rdi,%rbx
   1bcb1:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1bcb5:	0f 85 0c 01 00 00    	jne    1bdc7 <<hyperinterval::float::F64Enclosure>::square+0x127>
   1bcbb:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1bcbf:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
   1bcc6:	00 00 80 
   1bcc9:	49 b8 00 00 00 00 00 	movabs $0x7ff0000000000000,%r8
   1bcd0:	00 f0 7f 
   1bcd3:	49 be ff ff ff ff ff 	movabs $0xfffffffffffff,%r14
   1bcda:	ff 0f 00 
   1bcdd:	48 8b 56 08          	mov    0x8(%rsi),%rdx
   1bce1:	48 89 d1             	mov    %rdx,%rcx
   1bce4:	48 c1 e9 34          	shr    $0x34,%rcx
   1bce8:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1bcee:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
   1bcf3:	4c 21 f2             	and    %r14,%rdx
   1bcf6:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   1bcfa:	48 85 c9             	test   %rcx,%rcx
   1bcfd:	48 89 e8             	mov    %rbp,%rax
   1bd00:	48 0f 44 c1          	cmove  %rcx,%rax
   1bd04:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1bd0b:	41 bd 9c f7 ff ff    	mov    $0xfffff79c,%r13d
   1bd11:	41 0f 44 cd          	cmove  %r13d,%ecx
   1bd15:	48 09 d0             	or     %rdx,%rax
   1bd18:	48 f7 e0             	mul    %rax
   1bd1b:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1bd20:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1bd25:	48 89 04 24          	mov    %rax,(%rsp)
   1bd29:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1bd2d:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1bd32:	48 89 e1             	mov    %rsp,%rcx
   1bd35:	4c 89 e6             	mov    %r12,%rsi
   1bd38:	4c 89 c2             	mov    %r8,%rdx
   1bd3b:	e8 f0 1f 00 00       	call   1dd30 <<hyperinterval::ieee::Format>::rounded>
   1bd40:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   1bd45:	75 79                	jne    1bdc0 <<hyperinterval::float::F64Enclosure>::square+0x120>
   1bd47:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   1bd4c:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1bd51:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1bd56:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1bd5b:	4c 89 f8             	mov    %r15,%rax
   1bd5e:	48 c1 e8 34          	shr    $0x34,%rax
   1bd62:	25 ff 07 00 00       	and    $0x7ff,%eax
   1bd67:	4c 89 7c 24 48       	mov    %r15,0x48(%rsp)
   1bd6c:	4d 21 fe             	and    %r15,%r14
   1bd6f:	48 85 c0             	test   %rax,%rax
   1bd72:	48 0f 44 e8          	cmove  %rax,%rbp
   1bd76:	8d 8c 00 9a f7 ff ff 	lea    -0x866(%rax,%rax,1),%ecx
   1bd7d:	41 0f 44 cd          	cmove  %r13d,%ecx
   1bd81:	4c 09 f5             	or     %r14,%rbp
   1bd84:	48 89 e8             	mov    %rbp,%rax
   1bd87:	48 f7 e5             	mul    %rbp
   1bd8a:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1bd8f:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1bd94:	48 89 04 24          	mov    %rax,(%rsp)
   1bd98:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1bd9c:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1bda1:	48 89 e1             	mov    %rsp,%rcx
   1bda4:	4c 89 e6             	mov    %r12,%rsi
   1bda7:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1bdae:	00 f0 7f 
   1bdb1:	4c 89 fa             	mov    %r15,%rdx
   1bdb4:	e8 77 1f 00 00       	call   1dd30 <<hyperinterval::ieee::Format>::rounded>
   1bdb9:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   1bdbe:	75 10                	jne    1bdd0 <<hyperinterval::float::F64Enclosure>::square+0x130>
   1bdc0:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   1bdc5:	eb 4f                	jmp    1be16 <<hyperinterval::float::F64Enclosure>::square+0x176>
   1bdc7:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1bdce:	eb 50                	jmp    1be20 <<hyperinterval::float::F64Enclosure>::square+0x180>
   1bdd0:	4c 8b 6c 24 38       	mov    0x38(%rsp),%r13
   1bdd5:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
   1bdda:	48 89 e7             	mov    %rsp,%rdi
   1bddd:	4c 89 e6             	mov    %r12,%rsi
   1bde0:	4c 89 fa             	mov    %r15,%rdx
   1bde3:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   1bde8:	e8 43 08 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1bded:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bdf1:	74 1e                	je     1be11 <<hyperinterval::float::F64Enclosure>::square+0x171>
   1bdf3:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1bdf8:	48 89 e7             	mov    %rsp,%rdi
   1bdfb:	4c 89 e6             	mov    %r12,%rsi
   1bdfe:	4c 89 fa             	mov    %r15,%rdx
   1be01:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1be06:	e8 25 08 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1be0b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1be0f:	75 21                	jne    1be32 <<hyperinterval::float::F64Enclosure>::square+0x192>
   1be11:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1be16:	88 43 08             	mov    %al,0x8(%rbx)
   1be19:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1be20:	48 89 d8             	mov    %rbx,%rax
   1be23:	48 83 c4 58          	add    $0x58,%rsp
   1be27:	5b                   	pop    %rbx
   1be28:	41 5c                	pop    %r12
   1be2a:	41 5d                	pop    %r13
   1be2c:	41 5e                	pop    %r14
   1be2e:	41 5f                	pop    %r15
   1be30:	5d                   	pop    %rbp
   1be31:	c3                   	ret
   1be32:	4c 89 e9             	mov    %r13,%rcx
   1be35:	4c 89 74 24 28       	mov    %r14,0x28(%rsp)
   1be3a:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1be3f:	49 8d 04 2c          	lea    (%r12,%rbp,1),%rax
   1be43:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
   1be48:	48 89 ee             	mov    %rbp,%rsi
   1be4b:	4c 21 f6             	and    %r14,%rsi
   1be4e:	4c 89 e2             	mov    %r12,%rdx
   1be51:	48 29 f2             	sub    %rsi,%rdx
   1be54:	48 85 ed             	test   %rbp,%rbp
   1be57:	48 0f 49 d0          	cmovns %rax,%rdx
   1be5b:	4b 8d 04 2c          	lea    (%r12,%r13,1),%rax
   1be5f:	4c 89 ef             	mov    %r13,%rdi
   1be62:	4c 21 f7             	and    %r14,%rdi
   1be65:	4c 89 e6             	mov    %r12,%rsi
   1be68:	48 29 fe             	sub    %rdi,%rsi
   1be6b:	4d 85 ed             	test   %r13,%r13
   1be6e:	48 0f 49 f0          	cmovns %rax,%rsi
   1be72:	b0 01                	mov    $0x1,%al
   1be74:	48 39 f2             	cmp    %rsi,%rdx
   1be77:	77 9d                	ja     1be16 <<hyperinterval::float::F64Enclosure>::square+0x176>
   1be79:	48 89 e7             	mov    %rsp,%rdi
   1be7c:	4c 89 e6             	mov    %r12,%rsi
   1be7f:	4c 89 fa             	mov    %r15,%rdx
   1be82:	e8 a9 07 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1be87:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1be8b:	74 84                	je     1be11 <<hyperinterval::float::F64Enclosure>::square+0x171>
   1be8d:	4c 89 6c 24 20       	mov    %r13,0x20(%rsp)
   1be92:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1be97:	48 89 e7             	mov    %rsp,%rdi
   1be9a:	4c 89 e6             	mov    %r12,%rsi
   1be9d:	4c 89 fa             	mov    %r15,%rdx
   1bea0:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   1bea5:	e8 86 07 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1beaa:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1beae:	0f 84 5d ff ff ff    	je     1be11 <<hyperinterval::float::F64Enclosure>::square+0x171>
   1beb4:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1beb9:	4b 8d 04 2c          	lea    (%r12,%r13,1),%rax
   1bebd:	4c 89 ea             	mov    %r13,%rdx
   1bec0:	4c 21 f2             	and    %r14,%rdx
   1bec3:	4c 89 e6             	mov    %r12,%rsi
   1bec6:	48 29 d6             	sub    %rdx,%rsi
   1bec9:	4d 85 ed             	test   %r13,%r13
   1becc:	48 0f 49 f0          	cmovns %rax,%rsi
   1bed0:	4a 8d 04 21          	lea    (%rcx,%r12,1),%rax
   1bed4:	49 21 ce             	and    %rcx,%r14
   1bed7:	4d 29 f4             	sub    %r14,%r12
   1beda:	48 85 c9             	test   %rcx,%rcx
   1bedd:	4c 0f 49 e0          	cmovns %rax,%r12
   1bee1:	b0 01                	mov    $0x1,%al
   1bee3:	4c 39 e6             	cmp    %r12,%rsi
   1bee6:	0f 87 2a ff ff ff    	ja     1be16 <<hyperinterval::float::F64Enclosure>::square+0x176>
   1beec:	48 89 ef             	mov    %rbp,%rdi
   1beef:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1bef4:	4c 89 ea             	mov    %r13,%rdx
   1bef7:	e8 74 22 00 00       	call   1e170 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1befc:	49 89 c5             	mov    %rax,%r13
   1beff:	49 89 d4             	mov    %rdx,%r12
   1bf02:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1bf07:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
   1bf0c:	31 d2                	xor    %edx,%edx
   1bf0e:	e8 dd 22 00 00       	call   1e1f0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::signs>
   1bf13:	a8 02                	test   $0x2,%al
   1bf15:	75 14                	jne    1bf2b <<hyperinterval::float::F64Enclosure>::square+0x28b>
   1bf17:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1bf1e:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1bf22:	4c 89 63 10          	mov    %r12,0x10(%rbx)
   1bf26:	e9 f5 fe ff ff       	jmp    1be20 <<hyperinterval::float::F64Enclosure>::square+0x180>
   1bf2b:	48 89 e7             	mov    %rsp,%rdi
   1bf2e:	31 f6                	xor    %esi,%esi
   1bf30:	31 d2                	xor    %edx,%edx
   1bf32:	e8 69 03 00 00       	call   1c2a0 <<hyperinterval::float::F64Enclosure>::from_bits>
   1bf37:	48 8b 04 24          	mov    (%rsp),%rax
   1bf3b:	48 83 f8 02          	cmp    $0x2,%rax
   1bf3f:	75 0a                	jne    1bf4b <<hyperinterval::float::F64Enclosure>::square+0x2ab>
   1bf41:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1bf46:	e9 cb fe ff ff       	jmp    1be16 <<hyperinterval::float::F64Enclosure>::square+0x176>
   1bf4b:	83 f8 01             	cmp    $0x1,%eax
   1bf4e:	75 c7                	jne    1bf17 <<hyperinterval::float::F64Enclosure>::square+0x277>
   1bf50:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1bf55:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1bf5a:	4c 89 ef             	mov    %r13,%rdi
   1bf5d:	4c 89 e6             	mov    %r12,%rsi
   1bf60:	e8 0b 22 00 00       	call   1e170 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1bf65:	49 89 c5             	mov    %rax,%r13
   1bf68:	49 89 d4             	mov    %rdx,%r12
   1bf6b:	eb aa                	jmp    1bf17 <<hyperinterval::float::F64Enclosure>::square+0x277>
   1bf6d:	cc                   	int3
   1bf6e:	cc                   	int3
   1bf6f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::next_up:
   1bf70:	41 57                	push   %r15
   1bf72:	41 56                	push   %r14
   1bf74:	53                   	push   %rbx
   1bf75:	48 83 ec 10          	sub    $0x10,%rsp
   1bf79:	48 89 fb             	mov    %rdi,%rbx
   1bf7c:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1bf83:	00 00 80 
   1bf86:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1bf8d:	00 f0 7f 
   1bf90:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1bf95:	48 89 e7             	mov    %rsp,%rdi
   1bf98:	4c 89 f6             	mov    %r14,%rsi
   1bf9b:	4c 89 fa             	mov    %r15,%rdx
   1bf9e:	e8 8d 06 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1bfa3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bfa7:	75 0c                	jne    1bfb5 <<hyperinterval::float::F64Enclosure>::next_up+0x45>
   1bfa9:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1bfae:	88 43 01             	mov    %al,0x1(%rbx)
   1bfb1:	b0 01                	mov    $0x1,%al
   1bfb3:	eb 3c                	jmp    1bff1 <<hyperinterval::float::F64Enclosure>::next_up+0x81>
   1bfb5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1bfba:	48 89 c1             	mov    %rax,%rcx
   1bfbd:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1bfc1:	48 83 c9 01          	or     $0x1,%rcx
   1bfc5:	48 01 c1             	add    %rax,%rcx
   1bfc8:	48 89 e7             	mov    %rsp,%rdi
   1bfcb:	4c 89 f6             	mov    %r14,%rsi
   1bfce:	4c 89 fa             	mov    %r15,%rdx
   1bfd1:	e8 5a 06 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1bfd6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bfda:	75 08                	jne    1bfe4 <<hyperinterval::float::F64Enclosure>::next_up+0x74>
   1bfdc:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
   1bfe0:	b0 01                	mov    $0x1,%al
   1bfe2:	eb 0d                	jmp    1bff1 <<hyperinterval::float::F64Enclosure>::next_up+0x81>
   1bfe4:	f3 0f 7e 44 24 08    	movq   0x8(%rsp),%xmm0
   1bfea:	66 0f d6 43 08       	movq   %xmm0,0x8(%rbx)
   1bfef:	31 c0                	xor    %eax,%eax
   1bff1:	88 03                	mov    %al,(%rbx)
   1bff3:	48 89 d8             	mov    %rbx,%rax
   1bff6:	48 83 c4 10          	add    $0x10,%rsp
   1bffa:	5b                   	pop    %rbx
   1bffb:	41 5e                	pop    %r14
   1bffd:	41 5f                	pop    %r15
   1bfff:	c3                   	ret

<hyperinterval::float::F64Enclosure>::disjoint:
   1c000:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1c004:	b0 01                	mov    $0x1,%al
   1c006:	0f 84 8b 00 00 00    	je     1c097 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1c00c:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1c010:	0f 84 81 00 00 00    	je     1c097 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1c016:	53                   	push   %rbx
   1c017:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
   1c01e:	00 00 80 
   1c021:	4c 8b 47 10          	mov    0x10(%rdi),%r8
   1c025:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
   1c029:	4d 8d 14 08          	lea    (%r8,%rcx,1),%r10
   1c02d:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
   1c031:	4d 89 c3             	mov    %r8,%r11
   1c034:	49 21 d3             	and    %rdx,%r11
   1c037:	48 89 cb             	mov    %rcx,%rbx
   1c03a:	4c 29 db             	sub    %r11,%rbx
   1c03d:	4d 85 c0             	test   %r8,%r8
   1c040:	49 0f 49 da          	cmovns %r10,%rbx
   1c044:	4d 8d 04 09          	lea    (%r9,%rcx,1),%r8
   1c048:	4d 89 ca             	mov    %r9,%r10
   1c04b:	49 21 d2             	and    %rdx,%r10
   1c04e:	49 89 cb             	mov    %rcx,%r11
   1c051:	4d 29 d3             	sub    %r10,%r11
   1c054:	4d 85 c9             	test   %r9,%r9
   1c057:	4d 0f 49 d8          	cmovns %r8,%r11
   1c05b:	4c 39 db             	cmp    %r11,%rbx
   1c05e:	5b                   	pop    %rbx
   1c05f:	72 36                	jb     1c097 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1c061:	48 8b 47 08          	mov    0x8(%rdi),%rax
   1c065:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1c069:	48 8d 3c 0e          	lea    (%rsi,%rcx,1),%rdi
   1c06d:	49 89 f0             	mov    %rsi,%r8
   1c070:	49 21 d0             	and    %rdx,%r8
   1c073:	49 89 c9             	mov    %rcx,%r9
   1c076:	4d 29 c1             	sub    %r8,%r9
   1c079:	48 85 f6             	test   %rsi,%rsi
   1c07c:	4c 0f 49 cf          	cmovns %rdi,%r9
   1c080:	48 8d 34 08          	lea    (%rax,%rcx,1),%rsi
   1c084:	48 21 c2             	and    %rax,%rdx
   1c087:	48 29 d1             	sub    %rdx,%rcx
   1c08a:	48 85 c0             	test   %rax,%rax
   1c08d:	48 0f 49 ce          	cmovns %rsi,%rcx
   1c091:	49 39 c9             	cmp    %rcx,%r9
   1c094:	0f 92 c0             	setb   %al
   1c097:	c3                   	ret
   1c098:	cc                   	int3
   1c099:	cc                   	int3
   1c09a:	cc                   	int3
   1c09b:	cc                   	int3
   1c09c:	cc                   	int3
   1c09d:	cc                   	int3
   1c09e:	cc                   	int3
   1c09f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::expanded:
   1c0a0:	41 57                	push   %r15
   1c0a2:	41 56                	push   %r14
   1c0a4:	41 55                	push   %r13
   1c0a6:	41 54                	push   %r12
   1c0a8:	53                   	push   %rbx
   1c0a9:	48 83 ec 10          	sub    $0x10,%rsp
   1c0ad:	48 89 fb             	mov    %rdi,%rbx
   1c0b0:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1c0b4:	75 7f                	jne    1c135 <<hyperinterval::float::F64Enclosure>::expanded+0x95>
   1c0b6:	4c 8b 66 10          	mov    0x10(%rsi),%r12
   1c0ba:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1c0c1:	00 00 80 
   1c0c4:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1c0cb:	00 f0 7f 
   1c0ce:	48 8b 46 08          	mov    0x8(%rsi),%rax
   1c0d2:	48 89 c2             	mov    %rax,%rdx
   1c0d5:	4c 31 f2             	xor    %r14,%rdx
   1c0d8:	48 85 c0             	test   %rax,%rax
   1c0db:	48 0f 44 d0          	cmove  %rax,%rdx
   1c0df:	48 89 d1             	mov    %rdx,%rcx
   1c0e2:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1c0e6:	48 83 c9 01          	or     $0x1,%rcx
   1c0ea:	48 01 d1             	add    %rdx,%rcx
   1c0ed:	48 89 e7             	mov    %rsp,%rdi
   1c0f0:	4c 89 f6             	mov    %r14,%rsi
   1c0f3:	4c 89 fa             	mov    %r15,%rdx
   1c0f6:	e8 35 05 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1c0fb:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1c0ff:	75 27                	jne    1c128 <<hyperinterval::float::F64Enclosure>::expanded+0x88>
   1c101:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1c106:	4c 89 e1             	mov    %r12,%rcx
   1c109:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1c10d:	48 83 c9 01          	or     $0x1,%rcx
   1c111:	4c 01 e1             	add    %r12,%rcx
   1c114:	48 89 e7             	mov    %rsp,%rdi
   1c117:	4c 89 f6             	mov    %r14,%rsi
   1c11a:	4c 89 fa             	mov    %r15,%rdx
   1c11d:	e8 0e 05 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1c122:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c126:	75 25                	jne    1c14d <<hyperinterval::float::F64Enclosure>::expanded+0xad>
   1c128:	c6 43 08 03          	movb   $0x3,0x8(%rbx)
   1c12c:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c133:	eb 07                	jmp    1c13c <<hyperinterval::float::F64Enclosure>::expanded+0x9c>
   1c135:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1c13c:	48 89 d8             	mov    %rbx,%rax
   1c13f:	48 83 c4 10          	add    $0x10,%rsp
   1c143:	5b                   	pop    %rbx
   1c144:	41 5c                	pop    %r12
   1c146:	41 5d                	pop    %r13
   1c148:	41 5e                	pop    %r14
   1c14a:	41 5f                	pop    %r15
   1c14c:	c3                   	ret
   1c14d:	4c 89 e9             	mov    %r13,%rcx
   1c150:	4c 31 f1             	xor    %r14,%rcx
   1c153:	4d 85 ed             	test   %r13,%r13
   1c156:	49 0f 44 cd          	cmove  %r13,%rcx
   1c15a:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1c15f:	48 89 e7             	mov    %rsp,%rdi
   1c162:	4c 89 f6             	mov    %r14,%rsi
   1c165:	4c 89 fa             	mov    %r15,%rdx
   1c168:	e8 c3 04 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1c16d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c171:	74 1c                	je     1c18f <<hyperinterval::float::F64Enclosure>::expanded+0xef>
   1c173:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1c178:	48 89 e7             	mov    %rsp,%rdi
   1c17b:	4c 89 f6             	mov    %r14,%rsi
   1c17e:	4c 89 fa             	mov    %r15,%rdx
   1c181:	4c 89 e1             	mov    %r12,%rcx
   1c184:	e8 a7 04 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1c189:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c18d:	75 11                	jne    1c1a0 <<hyperinterval::float::F64Enclosure>::expanded+0x100>
   1c18f:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1c194:	88 43 08             	mov    %al,0x8(%rbx)
   1c197:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c19e:	eb 9c                	jmp    1c13c <<hyperinterval::float::F64Enclosure>::expanded+0x9c>
   1c1a0:	4b 8d 04 2e          	lea    (%r14,%r13,1),%rax
   1c1a4:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1c1a8:	4c 89 ea             	mov    %r13,%rdx
   1c1ab:	48 21 ca             	and    %rcx,%rdx
   1c1ae:	4c 89 f6             	mov    %r14,%rsi
   1c1b1:	48 29 d6             	sub    %rdx,%rsi
   1c1b4:	4d 85 ed             	test   %r13,%r13
   1c1b7:	48 0f 49 f0          	cmovns %rax,%rsi
   1c1bb:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c1c0:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1c1c4:	48 21 c1             	and    %rax,%rcx
   1c1c7:	49 29 ce             	sub    %rcx,%r14
   1c1ca:	48 85 c0             	test   %rax,%rax
   1c1cd:	4c 0f 49 f2          	cmovns %rdx,%r14
   1c1d1:	4c 39 f6             	cmp    %r14,%rsi
   1c1d4:	76 10                	jbe    1c1e6 <<hyperinterval::float::F64Enclosure>::expanded+0x146>
   1c1d6:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1c1da:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c1e1:	e9 56 ff ff ff       	jmp    1c13c <<hyperinterval::float::F64Enclosure>::expanded+0x9c>
   1c1e6:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1c1ed:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1c1f1:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1c1f5:	e9 42 ff ff ff       	jmp    1c13c <<hyperinterval::float::F64Enclosure>::expanded+0x9c>
   1c1fa:	cc                   	int3
   1c1fb:	cc                   	int3
   1c1fc:	cc                   	int3
   1c1fd:	cc                   	int3
   1c1fe:	cc                   	int3
   1c1ff:	cc                   	int3

<hyperinterval::float::F64Enclosure>::overlaps:
   1c200:	31 c0                	xor    %eax,%eax
   1c202:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1c206:	0f 84 8c 00 00 00    	je     1c298 <<hyperinterval::float::F64Enclosure>::overlaps+0x98>
   1c20c:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1c210:	0f 84 82 00 00 00    	je     1c298 <<hyperinterval::float::F64Enclosure>::overlaps+0x98>
   1c216:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1c21d:	00 00 80 
   1c220:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1c224:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1c228:	4c 8d 0c 02          	lea    (%rdx,%rax,1),%r9
   1c22c:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1c230:	49 89 d2             	mov    %rdx,%r10
   1c233:	49 21 ca             	and    %rcx,%r10
   1c236:	49 89 c3             	mov    %rax,%r11
   1c239:	4d 29 d3             	sub    %r10,%r11
   1c23c:	48 85 d2             	test   %rdx,%rdx
   1c23f:	4d 0f 49 d9          	cmovns %r9,%r11
   1c243:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
   1c247:	4d 89 c1             	mov    %r8,%r9
   1c24a:	49 21 c9             	and    %rcx,%r9
   1c24d:	49 89 c2             	mov    %rax,%r10
   1c250:	4d 29 ca             	sub    %r9,%r10
   1c253:	4d 85 c0             	test   %r8,%r8
   1c256:	4c 0f 49 d2          	cmovns %rdx,%r10
   1c25a:	4d 39 d3             	cmp    %r10,%r11
   1c25d:	73 03                	jae    1c262 <<hyperinterval::float::F64Enclosure>::overlaps+0x62>
   1c25f:	31 c0                	xor    %eax,%eax
   1c261:	c3                   	ret
   1c262:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1c266:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1c26a:	48 8d 3c 06          	lea    (%rsi,%rax,1),%rdi
   1c26e:	49 89 f0             	mov    %rsi,%r8
   1c271:	49 21 c8             	and    %rcx,%r8
   1c274:	49 89 c1             	mov    %rax,%r9
   1c277:	4d 29 c1             	sub    %r8,%r9
   1c27a:	48 85 f6             	test   %rsi,%rsi
   1c27d:	4c 0f 49 cf          	cmovns %rdi,%r9
   1c281:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
   1c285:	48 21 d1             	and    %rdx,%rcx
   1c288:	48 29 c8             	sub    %rcx,%rax
   1c28b:	48 85 d2             	test   %rdx,%rdx
   1c28e:	48 0f 49 c6          	cmovns %rsi,%rax
   1c292:	49 39 c1             	cmp    %rax,%r9
   1c295:	0f 93 c0             	setae  %al
   1c298:	c3                   	ret
   1c299:	cc                   	int3
   1c29a:	cc                   	int3
   1c29b:	cc                   	int3
   1c29c:	cc                   	int3
   1c29d:	cc                   	int3
   1c29e:	cc                   	int3
   1c29f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::from_bits:
   1c2a0:	41 57                	push   %r15
   1c2a2:	41 56                	push   %r14
   1c2a4:	41 55                	push   %r13
   1c2a6:	41 54                	push   %r12
   1c2a8:	53                   	push   %rbx
   1c2a9:	48 83 ec 10          	sub    $0x10,%rsp
   1c2ad:	49 89 d7             	mov    %rdx,%r15
   1c2b0:	48 89 f1             	mov    %rsi,%rcx
   1c2b3:	48 89 fb             	mov    %rdi,%rbx
   1c2b6:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1c2bd:	00 00 80 
   1c2c0:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1c2c7:	00 f0 7f 
   1c2ca:	48 89 e7             	mov    %rsp,%rdi
   1c2cd:	4c 89 f6             	mov    %r14,%rsi
   1c2d0:	4c 89 e2             	mov    %r12,%rdx
   1c2d3:	e8 58 03 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1c2d8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c2dc:	74 1c                	je     1c2fa <<hyperinterval::float::F64Enclosure>::from_bits+0x5a>
   1c2de:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1c2e3:	48 89 e7             	mov    %rsp,%rdi
   1c2e6:	4c 89 f6             	mov    %r14,%rsi
   1c2e9:	4c 89 e2             	mov    %r12,%rdx
   1c2ec:	4c 89 f9             	mov    %r15,%rcx
   1c2ef:	e8 3c 03 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1c2f4:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c2f8:	75 1d                	jne    1c317 <<hyperinterval::float::F64Enclosure>::from_bits+0x77>
   1c2fa:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1c2ff:	88 43 08             	mov    %al,0x8(%rbx)
   1c302:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c309:	48 83 c4 10          	add    $0x10,%rsp
   1c30d:	5b                   	pop    %rbx
   1c30e:	41 5c                	pop    %r12
   1c310:	41 5d                	pop    %r13
   1c312:	41 5e                	pop    %r14
   1c314:	41 5f                	pop    %r15
   1c316:	c3                   	ret
   1c317:	4b 8d 04 2e          	lea    (%r14,%r13,1),%rax
   1c31b:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1c31f:	4c 89 ea             	mov    %r13,%rdx
   1c322:	48 21 ca             	and    %rcx,%rdx
   1c325:	4c 89 f6             	mov    %r14,%rsi
   1c328:	48 29 d6             	sub    %rdx,%rsi
   1c32b:	4d 85 ed             	test   %r13,%r13
   1c32e:	48 0f 49 f0          	cmovns %rax,%rsi
   1c332:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c337:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1c33b:	48 21 c1             	and    %rax,%rcx
   1c33e:	49 29 ce             	sub    %rcx,%r14
   1c341:	48 85 c0             	test   %rax,%rax
   1c344:	4c 0f 49 f2          	cmovns %rdx,%r14
   1c348:	4c 39 f6             	cmp    %r14,%rsi
   1c34b:	76 06                	jbe    1c353 <<hyperinterval::float::F64Enclosure>::from_bits+0xb3>
   1c34d:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1c351:	eb af                	jmp    1c302 <<hyperinterval::float::F64Enclosure>::from_bits+0x62>
   1c353:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1c35a:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1c35e:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1c362:	eb a5                	jmp    1c309 <<hyperinterval::float::F64Enclosure>::from_bits+0x69>
   1c364:	cc                   	int3
   1c365:	cc                   	int3
   1c366:	cc                   	int3
   1c367:	cc                   	int3
   1c368:	cc                   	int3
   1c369:	cc                   	int3
   1c36a:	cc                   	int3
   1c36b:	cc                   	int3
   1c36c:	cc                   	int3
   1c36d:	cc                   	int3
   1c36e:	cc                   	int3
   1c36f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::max_image:
   1c370:	48 89 f8             	mov    %rdi,%rax
   1c373:	45 31 c0             	xor    %r8d,%r8d
   1c376:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1c37a:	0f 85 a3 00 00 00    	jne    1c423 <<hyperinterval::float::F64Enclosure>::max_image+0xb3>
   1c380:	f6 02 01             	testb  $0x1,(%rdx)
   1c383:	0f 84 8e 00 00 00    	je     1c417 <<hyperinterval::float::F64Enclosure>::max_image+0xa7>
   1c389:	41 56                	push   %r14
   1c38b:	53                   	push   %rbx
   1c38c:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
   1c390:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1c394:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
   1c398:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
   1c39c:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1c3a3:	00 00 80 
   1c3a6:	4c 8d 14 37          	lea    (%rdi,%rsi,1),%r10
   1c3aa:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   1c3ae:	49 89 fb             	mov    %rdi,%r11
   1c3b1:	4d 21 c3             	and    %r8,%r11
   1c3b4:	48 89 f3             	mov    %rsi,%rbx
   1c3b7:	4c 29 db             	sub    %r11,%rbx
   1c3ba:	48 85 ff             	test   %rdi,%rdi
   1c3bd:	49 0f 49 da          	cmovns %r10,%rbx
   1c3c1:	4d 8d 14 31          	lea    (%r9,%rsi,1),%r10
   1c3c5:	4d 89 cb             	mov    %r9,%r11
   1c3c8:	4d 21 c3             	and    %r8,%r11
   1c3cb:	49 89 f6             	mov    %rsi,%r14
   1c3ce:	4d 29 de             	sub    %r11,%r14
   1c3d1:	4d 85 c9             	test   %r9,%r9
   1c3d4:	4d 0f 49 f2          	cmovns %r10,%r14
   1c3d8:	4c 39 f3             	cmp    %r14,%rbx
   1c3db:	49 0f 42 f9          	cmovb  %r9,%rdi
   1c3df:	4c 8d 0c 31          	lea    (%rcx,%rsi,1),%r9
   1c3e3:	49 89 ca             	mov    %rcx,%r10
   1c3e6:	4d 21 c2             	and    %r8,%r10
   1c3e9:	49 89 f3             	mov    %rsi,%r11
   1c3ec:	4d 29 d3             	sub    %r10,%r11
   1c3ef:	48 85 c9             	test   %rcx,%rcx
   1c3f2:	4d 0f 49 d9          	cmovns %r9,%r11
   1c3f6:	4c 8d 0c 32          	lea    (%rdx,%rsi,1),%r9
   1c3fa:	49 21 d0             	and    %rdx,%r8
   1c3fd:	4c 29 c6             	sub    %r8,%rsi
   1c400:	48 85 d2             	test   %rdx,%rdx
   1c403:	49 0f 49 f1          	cmovns %r9,%rsi
   1c407:	49 39 f3             	cmp    %rsi,%r11
   1c40a:	48 0f 42 ca          	cmovb  %rdx,%rcx
   1c40e:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1c414:	5b                   	pop    %rbx
   1c415:	41 5e                	pop    %r14
   1c417:	4c 89 00             	mov    %r8,(%rax)
   1c41a:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1c41e:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1c422:	c3                   	ret
   1c423:	4c 89 00             	mov    %r8,(%rax)
   1c426:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1c42a:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1c42e:	c3                   	ret
   1c42f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::min_image:
   1c430:	48 89 f8             	mov    %rdi,%rax
   1c433:	45 31 c0             	xor    %r8d,%r8d
   1c436:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1c43a:	0f 85 a3 00 00 00    	jne    1c4e3 <<hyperinterval::float::F64Enclosure>::min_image+0xb3>
   1c440:	f6 02 01             	testb  $0x1,(%rdx)
   1c443:	0f 84 8e 00 00 00    	je     1c4d7 <<hyperinterval::float::F64Enclosure>::min_image+0xa7>
   1c449:	41 56                	push   %r14
   1c44b:	53                   	push   %rbx
   1c44c:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
   1c450:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
   1c454:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
   1c458:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1c45f:	00 00 80 
   1c462:	4c 8d 14 37          	lea    (%rdi,%rsi,1),%r10
   1c466:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   1c46a:	49 89 fb             	mov    %rdi,%r11
   1c46d:	4d 21 c3             	and    %r8,%r11
   1c470:	48 89 f3             	mov    %rsi,%rbx
   1c473:	4c 29 db             	sub    %r11,%rbx
   1c476:	48 85 ff             	test   %rdi,%rdi
   1c479:	49 0f 49 da          	cmovns %r10,%rbx
   1c47d:	4d 8d 14 31          	lea    (%r9,%rsi,1),%r10
   1c481:	4d 89 cb             	mov    %r9,%r11
   1c484:	4d 21 c3             	and    %r8,%r11
   1c487:	49 89 f6             	mov    %rsi,%r14
   1c48a:	4d 29 de             	sub    %r11,%r14
   1c48d:	4d 85 c9             	test   %r9,%r9
   1c490:	4d 0f 49 f2          	cmovns %r10,%r14
   1c494:	4c 39 f3             	cmp    %r14,%rbx
   1c497:	49 0f 47 f9          	cmova  %r9,%rdi
   1c49b:	4c 8d 0c 31          	lea    (%rcx,%rsi,1),%r9
   1c49f:	49 89 ca             	mov    %rcx,%r10
   1c4a2:	4d 21 c2             	and    %r8,%r10
   1c4a5:	49 89 f3             	mov    %rsi,%r11
   1c4a8:	4d 29 d3             	sub    %r10,%r11
   1c4ab:	48 85 c9             	test   %rcx,%rcx
   1c4ae:	4d 0f 49 d9          	cmovns %r9,%r11
   1c4b2:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1c4b6:	4c 8d 0c 32          	lea    (%rdx,%rsi,1),%r9
   1c4ba:	49 21 d0             	and    %rdx,%r8
   1c4bd:	4c 29 c6             	sub    %r8,%rsi
   1c4c0:	48 85 d2             	test   %rdx,%rdx
   1c4c3:	49 0f 49 f1          	cmovns %r9,%rsi
   1c4c7:	49 39 f3             	cmp    %rsi,%r11
   1c4ca:	48 0f 47 ca          	cmova  %rdx,%rcx
   1c4ce:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1c4d4:	5b                   	pop    %rbx
   1c4d5:	41 5e                	pop    %r14
   1c4d7:	4c 89 00             	mov    %r8,(%rax)
   1c4da:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1c4de:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1c4e2:	c3                   	ret
   1c4e3:	4c 89 00             	mov    %r8,(%rax)
   1c4e6:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1c4ea:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1c4ee:	c3                   	ret
   1c4ef:	cc                   	int3

<hyperinterval::float::F64Enclosure>::next_down:
   1c4f0:	41 57                	push   %r15
   1c4f2:	41 56                	push   %r14
   1c4f4:	53                   	push   %rbx
   1c4f5:	48 83 ec 10          	sub    $0x10,%rsp
   1c4f9:	48 89 fb             	mov    %rdi,%rbx
   1c4fc:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1c503:	00 00 80 
   1c506:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1c50d:	00 f0 7f 
   1c510:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1c515:	48 89 e7             	mov    %rsp,%rdi
   1c518:	4c 89 f6             	mov    %r14,%rsi
   1c51b:	4c 89 fa             	mov    %r15,%rdx
   1c51e:	e8 0d 01 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1c523:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c527:	75 0c                	jne    1c535 <<hyperinterval::float::F64Enclosure>::next_down+0x45>
   1c529:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1c52e:	88 43 01             	mov    %al,0x1(%rbx)
   1c531:	b0 01                	mov    $0x1,%al
   1c533:	eb 51                	jmp    1c586 <<hyperinterval::float::F64Enclosure>::next_down+0x96>
   1c535:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c53a:	48 89 c2             	mov    %rax,%rdx
   1c53d:	4c 31 f2             	xor    %r14,%rdx
   1c540:	48 85 c0             	test   %rax,%rax
   1c543:	48 0f 44 d0          	cmove  %rax,%rdx
   1c547:	48 89 d1             	mov    %rdx,%rcx
   1c54a:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1c54e:	48 83 c9 01          	or     $0x1,%rcx
   1c552:	48 01 d1             	add    %rdx,%rcx
   1c555:	48 89 e7             	mov    %rsp,%rdi
   1c558:	4c 89 f6             	mov    %r14,%rsi
   1c55b:	4c 89 fa             	mov    %r15,%rdx
   1c55e:	e8 cd 00 00 00       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1c563:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c567:	75 08                	jne    1c571 <<hyperinterval::float::F64Enclosure>::next_down+0x81>
   1c569:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
   1c56d:	b0 01                	mov    $0x1,%al
   1c56f:	eb 15                	jmp    1c586 <<hyperinterval::float::F64Enclosure>::next_down+0x96>
   1c571:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c576:	49 31 c6             	xor    %rax,%r14
   1c579:	48 85 c0             	test   %rax,%rax
   1c57c:	4c 0f 44 f0          	cmove  %rax,%r14
   1c580:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1c584:	31 c0                	xor    %eax,%eax
   1c586:	88 03                	mov    %al,(%rbx)
   1c588:	48 89 d8             	mov    %rbx,%rax
   1c58b:	48 83 c4 10          	add    $0x10,%rsp
   1c58f:	5b                   	pop    %rbx
   1c590:	41 5e                	pop    %r14
   1c592:	41 5f                	pop    %r15
   1c594:	c3                   	ret
   1c595:	cc                   	int3
   1c596:	cc                   	int3
   1c597:	cc                   	int3
   1c598:	cc                   	int3
   1c599:	cc                   	int3
   1c59a:	cc                   	int3
   1c59b:	cc                   	int3
   1c59c:	cc                   	int3
   1c59d:	cc                   	int3
   1c59e:	cc                   	int3
   1c59f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::subset_of:
   1c5a0:	b0 01                	mov    $0x1,%al
   1c5a2:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1c5a6:	75 50                	jne    1c5f8 <<hyperinterval::float::F64Enclosure>::subset_of+0x58>
   1c5a8:	f6 06 01             	testb  $0x1,(%rsi)
   1c5ab:	74 49                	je     1c5f6 <<hyperinterval::float::F64Enclosure>::subset_of+0x56>
   1c5ad:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1c5b1:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1c5b5:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1c5bc:	00 00 80 
   1c5bf:	4d 8d 0c 00          	lea    (%r8,%rax,1),%r9
   1c5c3:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1c5c7:	4d 89 c2             	mov    %r8,%r10
   1c5ca:	49 21 ca             	and    %rcx,%r10
   1c5cd:	49 89 c3             	mov    %rax,%r11
   1c5d0:	4d 29 d3             	sub    %r10,%r11
   1c5d3:	4d 85 c0             	test   %r8,%r8
   1c5d6:	4d 0f 49 d9          	cmovns %r9,%r11
   1c5da:	4c 8d 04 02          	lea    (%rdx,%rax,1),%r8
   1c5de:	49 89 d1             	mov    %rdx,%r9
   1c5e1:	49 21 c9             	and    %rcx,%r9
   1c5e4:	49 89 c2             	mov    %rax,%r10
   1c5e7:	4d 29 ca             	sub    %r9,%r10
   1c5ea:	48 85 d2             	test   %rdx,%rdx
   1c5ed:	4d 0f 49 d0          	cmovns %r8,%r10
   1c5f1:	4d 39 d3             	cmp    %r10,%r11
   1c5f4:	76 03                	jbe    1c5f9 <<hyperinterval::float::F64Enclosure>::subset_of+0x59>
   1c5f6:	31 c0                	xor    %eax,%eax
   1c5f8:	c3                   	ret
   1c5f9:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1c5fd:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1c601:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1c605:	49 89 d0             	mov    %rdx,%r8
   1c608:	49 21 c8             	and    %rcx,%r8
   1c60b:	49 89 c1             	mov    %rax,%r9
   1c60e:	4d 29 c1             	sub    %r8,%r9
   1c611:	48 85 d2             	test   %rdx,%rdx
   1c614:	4c 0f 49 cf          	cmovns %rdi,%r9
   1c618:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1c61c:	48 21 f1             	and    %rsi,%rcx
   1c61f:	48 29 c8             	sub    %rcx,%rax
   1c622:	48 85 f6             	test   %rsi,%rsi
   1c625:	48 0f 49 c2          	cmovns %rdx,%rax
   1c629:	49 39 c1             	cmp    %rax,%r9
   1c62c:	0f 96 c0             	setbe  %al
   1c62f:	c3                   	ret

<hyperinterval::ieee::Format>::finite:
   1c630:	48 89 f8             	mov    %rdi,%rax
   1c633:	48 89 cf             	mov    %rcx,%rdi
   1c636:	48 f7 d7             	not    %rdi
   1c639:	48 85 d7             	test   %rdx,%rdi
   1c63c:	75 09                	jne    1c647 <<hyperinterval::ieee::Format>::finite+0x17>
   1c63e:	c6 40 01 00          	movb   $0x0,0x1(%rax)
   1c642:	b1 01                	mov    $0x1,%cl
   1c644:	88 08                	mov    %cl,(%rax)
   1c646:	c3                   	ret
   1c647:	48 ff ce             	dec    %rsi
   1c64a:	48 85 f1             	test   %rsi,%rcx
   1c64d:	74 09                	je     1c658 <<hyperinterval::ieee::Format>::finite+0x28>
   1c64f:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1c653:	31 c9                	xor    %ecx,%ecx
   1c655:	88 08                	mov    %cl,(%rax)
   1c657:	c3                   	ret
   1c658:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
   1c65f:	00 
   1c660:	31 c9                	xor    %ecx,%ecx
   1c662:	88 08                	mov    %cl,(%rax)
   1c664:	c3                   	ret
   1c665:	cc                   	int3
   1c666:	cc                   	int3
   1c667:	cc                   	int3
   1c668:	cc                   	int3
   1c669:	cc                   	int3
   1c66a:	cc                   	int3
   1c66b:	cc                   	int3
   1c66c:	cc                   	int3
   1c66d:	cc                   	int3
   1c66e:	cc                   	int3
   1c66f:	cc                   	int3

<hyperinterval::ieee::Format>::add:
   1c670:	55                   	push   %rbp
   1c671:	41 57                	push   %r15
   1c673:	41 56                	push   %r14
   1c675:	41 55                	push   %r13
   1c677:	41 54                	push   %r12
   1c679:	53                   	push   %rbx
   1c67a:	48 83 ec 38          	sub    $0x38,%rsp
   1c67e:	48 89 fb             	mov    %rdi,%rbx
   1c681:	48 85 c9             	test   %rcx,%rcx
   1c684:	0f 84 63 01 00 00    	je     1c7ed <<hyperinterval::ieee::Format>::add+0x17d>
   1c68a:	48 89 c8             	mov    %rcx,%rax
   1c68d:	4d 85 c0             	test   %r8,%r8
   1c690:	0f 84 61 01 00 00    	je     1c7f7 <<hyperinterval::ieee::Format>::add+0x187>
   1c696:	41 b9 40 00 00 00    	mov    $0x40,%r9d
   1c69c:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
   1c6a1:	49 89 c2             	mov    %rax,%r10
   1c6a4:	49 21 d2             	and    %rdx,%r10
   1c6a7:	44 89 c9             	mov    %r9d,%ecx
   1c6aa:	49 d3 ea             	shr    %cl,%r10
   1c6ad:	41 bb 01 00 00 00    	mov    $0x1,%r11d
   1c6b3:	49 d3 e3             	shl    %cl,%r11
   1c6b6:	4d 8d 63 ff          	lea    -0x1(%r11),%r12
   1c6ba:	4d 89 e7             	mov    %r12,%r15
   1c6bd:	49 21 c7             	and    %rax,%r15
   1c6c0:	4d 85 d2             	test   %r10,%r10
   1c6c3:	bf 01 00 00 00       	mov    $0x1,%edi
   1c6c8:	44 89 d5             	mov    %r10d,%ebp
   1c6cb:	0f 44 ef             	cmove  %edi,%ebp
   1c6ce:	4d 0f 45 d3          	cmovne %r11,%r10
   1c6d2:	49 89 d6             	mov    %rdx,%r14
   1c6d5:	49 d3 ee             	shr    %cl,%r14
   1c6d8:	4d 09 fa             	or     %r15,%r10
   1c6db:	49 d1 ee             	shr    $1,%r14
   1c6de:	45 01 ce             	add    %r9d,%r14d
   1c6e1:	48 85 f0             	test   %rsi,%rax
   1c6e4:	0f 95 44 24 0f       	setne  0xf(%rsp)
   1c6e9:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1c6ee:	49 0f bd ca          	bsr    %r10,%rcx
   1c6f2:	83 f1 3f             	xor    $0x3f,%ecx
   1c6f5:	44 01 c9             	add    %r9d,%ecx
   1c6f8:	83 c1 c1             	add    $0xffffffc1,%ecx
   1c6fb:	45 31 ed             	xor    %r13d,%r13d
   1c6fe:	4d 0f a5 d5          	shld   %cl,%r10,%r13
   1c702:	45 31 ff             	xor    %r15d,%r15d
   1c705:	49 d3 e2             	shl    %cl,%r10
   1c708:	f6 c1 40             	test   $0x40,%cl
   1c70b:	4d 0f 45 ea          	cmovne %r10,%r13
   1c70f:	4d 0f 45 d7          	cmovne %r15,%r10
   1c713:	44 01 f1             	add    %r14d,%ecx
   1c716:	29 cd                	sub    %ecx,%ebp
   1c718:	4d 89 c7             	mov    %r8,%r15
   1c71b:	49 21 d7             	and    %rdx,%r15
   1c71e:	44 89 c9             	mov    %r9d,%ecx
   1c721:	49 d3 ef             	shr    %cl,%r15
   1c724:	4d 21 c4             	and    %r8,%r12
   1c727:	4d 85 ff             	test   %r15,%r15
   1c72a:	41 0f 45 ff          	cmovne %r15d,%edi
   1c72e:	4d 0f 45 fb          	cmovne %r11,%r15
   1c732:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1c737:	4d 09 e7             	or     %r12,%r15
   1c73a:	49 85 f0             	test   %rsi,%r8
   1c73d:	41 0f 95 c3          	setne  %r11b
   1c741:	49 0f bd cf          	bsr    %r15,%rcx
   1c745:	83 f1 3f             	xor    $0x3f,%ecx
   1c748:	44 01 c9             	add    %r9d,%ecx
   1c74b:	83 c1 c1             	add    $0xffffffc1,%ecx
   1c74e:	45 31 c9             	xor    %r9d,%r9d
   1c751:	4d 0f a5 f9          	shld   %cl,%r15,%r9
   1c755:	49 d3 e7             	shl    %cl,%r15
   1c758:	f6 c1 40             	test   $0x40,%cl
   1c75b:	4d 0f 45 cf          	cmovne %r15,%r9
   1c75f:	41 bc 00 00 00 00    	mov    $0x0,%r12d
   1c765:	4d 0f 45 fc          	cmovne %r12,%r15
   1c769:	41 01 ce             	add    %ecx,%r14d
   1c76c:	44 29 f7             	sub    %r14d,%edi
   1c76f:	39 fd                	cmp    %edi,%ebp
   1c771:	0f 8d 90 00 00 00    	jge    1c807 <<hyperinterval::ieee::Format>::add+0x197>
   1c777:	44 88 5c 24 0e       	mov    %r11b,0xe(%rsp)
   1c77c:	41 89 ee             	mov    %ebp,%r14d
   1c77f:	44 0f b6 5c 24 0f    	movzbl 0xf(%rsp),%r11d
   1c785:	4d 89 d4             	mov    %r10,%r12
   1c788:	4c 89 ed             	mov    %r13,%rbp
   1c78b:	4d 89 c5             	mov    %r8,%r13
   1c78e:	44 29 f7             	sub    %r14d,%edi
   1c791:	83 ff 4a             	cmp    $0x4a,%edi
   1c794:	0f 8f ab 00 00 00    	jg     1c845 <<hyperinterval::ieee::Format>::add+0x1d5>
   1c79a:	49 85 f0             	test   %rsi,%r8
   1c79d:	41 0f 95 c0          	setne  %r8b
   1c7a1:	48 85 f0             	test   %rsi,%rax
   1c7a4:	41 0f 95 c2          	setne  %r10b
   1c7a8:	89 f9                	mov    %edi,%ecx
   1c7aa:	4d 0f a5 f9          	shld   %cl,%r15,%r9
   1c7ae:	49 d3 e7             	shl    %cl,%r15
   1c7b1:	31 c0                	xor    %eax,%eax
   1c7b3:	40 f6 c7 40          	test   $0x40,%dil
   1c7b7:	4d 0f 45 cf          	cmovne %r15,%r9
   1c7bb:	49 0f 44 c7          	cmove  %r15,%rax
   1c7bf:	45 30 c2             	xor    %r8b,%r10b
   1c7c2:	0f 84 ce 00 00 00    	je     1c896 <<hyperinterval::ieee::Format>::add+0x226>
   1c7c8:	4c 39 e0             	cmp    %r12,%rax
   1c7cb:	4c 89 c9             	mov    %r9,%rcx
   1c7ce:	48 19 e9             	sbb    %rbp,%rcx
   1c7d1:	0f 83 f5 00 00 00    	jae    1c8cc <<hyperinterval::ieee::Format>::add+0x25c>
   1c7d7:	49 29 c4             	sub    %rax,%r12
   1c7da:	4c 19 cd             	sbb    %r9,%rbp
   1c7dd:	44 88 5c 24 0e       	mov    %r11b,0xe(%rsp)
   1c7e2:	4c 89 e0             	mov    %r12,%rax
   1c7e5:	49 89 e9             	mov    %rbp,%r9
   1c7e8:	e9 e5 00 00 00       	jmp    1c8d2 <<hyperinterval::ieee::Format>::add+0x262>
   1c7ed:	4c 89 43 08          	mov    %r8,0x8(%rbx)
   1c7f1:	4c 89 43 10          	mov    %r8,0x10(%rbx)
   1c7f5:	eb 08                	jmp    1c7ff <<hyperinterval::ieee::Format>::add+0x18f>
   1c7f7:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1c7fb:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1c7ff:	c6 03 00             	movb   $0x0,(%rbx)
   1c802:	e9 f0 00 00 00       	jmp    1c8f7 <<hyperinterval::ieee::Format>::add+0x287>
   1c807:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1c80c:	48 89 d6             	mov    %rdx,%rsi
   1c80f:	89 fa                	mov    %edi,%edx
   1c811:	4d 89 fc             	mov    %r15,%r12
   1c814:	4d 89 ce             	mov    %r9,%r14
   1c817:	4d 89 e9             	mov    %r13,%r9
   1c81a:	4d 89 d7             	mov    %r10,%r15
   1c81d:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
   1c822:	88 4c 24 0e          	mov    %cl,0xe(%rsp)
   1c826:	89 ef                	mov    %ebp,%edi
   1c828:	4c 89 f5             	mov    %r14,%rbp
   1c82b:	41 89 d6             	mov    %edx,%r14d
   1c82e:	48 89 f2             	mov    %rsi,%rdx
   1c831:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   1c836:	49 89 c5             	mov    %rax,%r13
   1c839:	44 29 f7             	sub    %r14d,%edi
   1c83c:	83 ff 4a             	cmp    $0x4a,%edi
   1c83f:	0f 8e 55 ff ff ff    	jle    1c79a <<hyperinterval::ieee::Format>::add+0x12a>
   1c845:	4c 89 e8             	mov    %r13,%rax
   1c848:	45 84 db             	test   %r11b,%r11b
   1c84b:	74 51                	je     1c89e <<hyperinterval::ieee::Format>::add+0x22e>
   1c84d:	48 31 f0             	xor    %rsi,%rax
   1c850:	48 89 c1             	mov    %rax,%rcx
   1c853:	48 21 f1             	and    %rsi,%rcx
   1c856:	31 ff                	xor    %edi,%edi
   1c858:	48 f7 d9             	neg    %rcx
   1c85b:	40 0f 93 c7          	setae  %dil
   1c85f:	48 8d 0c 78          	lea    (%rax,%rdi,2),%rcx
   1c863:	48 ff c9             	dec    %rcx
   1c866:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1c86b:	49 89 f6             	mov    %rsi,%r14
   1c86e:	e8 bd fd ff ff       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1c873:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1c878:	75 4b                	jne    1c8c5 <<hyperinterval::ieee::Format>::add+0x255>
   1c87a:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1c87f:	49 31 c6             	xor    %rax,%r14
   1c882:	48 85 c0             	test   %rax,%rax
   1c885:	4c 0f 44 f0          	cmove  %rax,%r14
   1c889:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1c88d:	4c 89 6b 10          	mov    %r13,0x10(%rbx)
   1c891:	e9 69 ff ff ff       	jmp    1c7ff <<hyperinterval::ieee::Format>::add+0x18f>
   1c896:	4c 01 e0             	add    %r12,%rax
   1c899:	49 11 e9             	adc    %rbp,%r9
   1c89c:	eb 34                	jmp    1c8d2 <<hyperinterval::ieee::Format>::add+0x262>
   1c89e:	48 21 f0             	and    %rsi,%rax
   1c8a1:	31 c9                	xor    %ecx,%ecx
   1c8a3:	48 f7 d8             	neg    %rax
   1c8a6:	0f 93 c1             	setae  %cl
   1c8a9:	48 8d 0c 4d ff ff ff 	lea    -0x1(,%rcx,2),%rcx
   1c8b0:	ff 
   1c8b1:	4c 01 e9             	add    %r13,%rcx
   1c8b4:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1c8b9:	e8 72 fd ff ff       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1c8be:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1c8c3:	74 44                	je     1c909 <<hyperinterval::ieee::Format>::add+0x299>
   1c8c5:	66 c7 03 01 03       	movw   $0x301,(%rbx)
   1c8ca:	eb 2b                	jmp    1c8f7 <<hyperinterval::ieee::Format>::add+0x287>
   1c8cc:	4c 29 e0             	sub    %r12,%rax
   1c8cf:	49 19 e9             	sbb    %rbp,%r9
   1c8d2:	0f b6 4c 24 0e       	movzbl 0xe(%rsp),%ecx
   1c8d7:	88 4c 24 24          	mov    %cl,0x24(%rsp)
   1c8db:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1c8e0:	4c 89 4c 24 18       	mov    %r9,0x18(%rsp)
   1c8e5:	44 89 74 24 20       	mov    %r14d,0x20(%rsp)
   1c8ea:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1c8ef:	48 89 df             	mov    %rbx,%rdi
   1c8f2:	e8 39 14 00 00       	call   1dd30 <<hyperinterval::ieee::Format>::rounded>
   1c8f7:	48 89 d8             	mov    %rbx,%rax
   1c8fa:	48 83 c4 38          	add    $0x38,%rsp
   1c8fe:	5b                   	pop    %rbx
   1c8ff:	41 5c                	pop    %r12
   1c901:	41 5d                	pop    %r13
   1c903:	41 5e                	pop    %r14
   1c905:	41 5f                	pop    %r15
   1c907:	5d                   	pop    %rbp
   1c908:	c3                   	ret
   1c909:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1c90e:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1c912:	e9 e4 fe ff ff       	jmp    1c7fb <<hyperinterval::ieee::Format>::add+0x18b>
   1c917:	cc                   	int3
   1c918:	cc                   	int3
   1c919:	cc                   	int3
   1c91a:	cc                   	int3
   1c91b:	cc                   	int3
   1c91c:	cc                   	int3
   1c91d:	cc                   	int3
   1c91e:	cc                   	int3
   1c91f:	cc                   	int3

<hyperinterval::ieee::Format>::div:
   1c920:	55                   	push   %rbp
   1c921:	41 57                	push   %r15
   1c923:	41 56                	push   %r14
   1c925:	41 55                	push   %r13
   1c927:	41 54                	push   %r12
   1c929:	53                   	push   %rbx
   1c92a:	48 83 ec 48          	sub    $0x48,%rsp
   1c92e:	4d 85 c0             	test   %r8,%r8
   1c931:	0f 84 cb 00 00 00    	je     1ca02 <<hyperinterval::ieee::Format>::div+0xe2>
   1c937:	48 85 c9             	test   %rcx,%rcx
   1c93a:	0f 84 cc 00 00 00    	je     1ca0c <<hyperinterval::ieee::Format>::div+0xec>
   1c940:	41 be 40 00 00 00    	mov    $0x40,%r14d
   1c946:	f3 4c 0f bc f2       	tzcnt  %rdx,%r14
   1c94b:	49 89 cd             	mov    %rcx,%r13
   1c94e:	49 21 d5             	and    %rdx,%r13
   1c951:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
   1c956:	41 83 e6 3f          	and    $0x3f,%r14d
   1c95a:	48 89 c8             	mov    %rcx,%rax
   1c95d:	44 89 f1             	mov    %r14d,%ecx
   1c960:	49 d3 ed             	shr    %cl,%r13
   1c963:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1c969:	49 d3 e2             	shl    %cl,%r10
   1c96c:	4d 8d 5a ff          	lea    -0x1(%r10),%r11
   1c970:	4c 89 db             	mov    %r11,%rbx
   1c973:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1c978:	48 21 c3             	and    %rax,%rbx
   1c97b:	4d 85 ed             	test   %r13,%r13
   1c97e:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1c984:	44 89 e8             	mov    %r13d,%eax
   1c987:	41 0f 44 c1          	cmove  %r9d,%eax
   1c98b:	4d 0f 45 ea          	cmovne %r10,%r13
   1c98f:	4c 89 c5             	mov    %r8,%rbp
   1c992:	48 21 d5             	and    %rdx,%rbp
   1c995:	48 d3 ea             	shr    %cl,%rdx
   1c998:	48 d3 ed             	shr    %cl,%rbp
   1c99b:	49 09 dd             	or     %rbx,%r13
   1c99e:	48 d1 ea             	shr    $1,%rdx
   1c9a1:	4d 21 c3             	and    %r8,%r11
   1c9a4:	48 85 ed             	test   %rbp,%rbp
   1c9a7:	44 0f 45 cd          	cmovne %ebp,%r9d
   1c9ab:	49 0f 45 ea          	cmovne %r10,%rbp
   1c9af:	4c 09 dd             	or     %r11,%rbp
   1c9b2:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1c9b7:	41 ba 7f 00 00 00    	mov    $0x7f,%r10d
   1c9bd:	4c 0f bd d5          	bsr    %rbp,%r10
   1c9c1:	41 83 f2 3f          	xor    $0x3f,%r10d
   1c9c5:	41 83 c2 40          	add    $0x40,%r10d
   1c9c9:	49 0f bd cd          	bsr    %r13,%rcx
   1c9cd:	83 f1 3f             	xor    $0x3f,%ecx
   1c9d0:	45 89 d7             	mov    %r10d,%r15d
   1c9d3:	41 29 cf             	sub    %ecx,%r15d
   1c9d6:	41 83 c7 c0          	add    $0xffffffc0,%r15d
   1c9da:	78 3f                	js     1ca1b <<hyperinterval::ieee::Format>::div+0xfb>
   1c9dc:	45 31 db             	xor    %r11d,%r11d
   1c9df:	44 89 f9             	mov    %r15d,%ecx
   1c9e2:	49 0f a5 eb          	shld   %cl,%rbp,%r11
   1c9e6:	31 db                	xor    %ebx,%ebx
   1c9e8:	49 89 ec             	mov    %rbp,%r12
   1c9eb:	49 d3 e4             	shl    %cl,%r12
   1c9ee:	41 f6 c7 40          	test   $0x40,%r15b
   1c9f2:	4d 0f 45 dc          	cmovne %r12,%r11
   1c9f6:	4c 0f 45 e3          	cmovne %rbx,%r12
   1c9fa:	4d 39 e5             	cmp    %r12,%r13
   1c9fd:	4c 19 db             	sbb    %r11,%rbx
   1ca00:	eb 3f                	jmp    1ca41 <<hyperinterval::ieee::Format>::div+0x121>
   1ca02:	66 c7 07 01 04       	movw   $0x401,(%rdi)
   1ca07:	e9 24 03 00 00       	jmp    1cd30 <<hyperinterval::ieee::Format>::div+0x410>
   1ca0c:	c6 07 00             	movb   $0x0,(%rdi)
   1ca0f:	0f 57 c0             	xorps  %xmm0,%xmm0
   1ca12:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1ca16:	e9 15 03 00 00       	jmp    1cd30 <<hyperinterval::ieee::Format>::div+0x410>
   1ca1b:	44 89 f9             	mov    %r15d,%ecx
   1ca1e:	f6 d9                	neg    %cl
   1ca20:	45 31 db             	xor    %r11d,%r11d
   1ca23:	4d 0f a5 eb          	shld   %cl,%r13,%r11
   1ca27:	31 db                	xor    %ebx,%ebx
   1ca29:	4d 89 ec             	mov    %r13,%r12
   1ca2c:	49 d3 e4             	shl    %cl,%r12
   1ca2f:	f6 c1 40             	test   $0x40,%cl
   1ca32:	4d 0f 45 dc          	cmovne %r12,%r11
   1ca36:	4c 0f 45 e3          	cmovne %rbx,%r12
   1ca3a:	49 39 ec             	cmp    %rbp,%r12
   1ca3d:	49 83 db 00          	sbb    $0x0,%r11
   1ca41:	0f 92 c1             	setb   %cl
   1ca44:	44 29 c8             	sub    %r9d,%eax
   1ca47:	41 01 c7             	add    %eax,%r15d
   1ca4a:	0f b6 c9             	movzbl %cl,%ecx
   1ca4d:	41 29 cf             	sub    %ecx,%r15d
   1ca50:	41 39 d7             	cmp    %edx,%r15d
   1ca53:	0f 8f 19 02 00 00    	jg     1cc72 <<hyperinterval::ieee::Format>::div+0x352>
   1ca59:	4c 8b 4c 24 10       	mov    0x10(%rsp),%r9
   1ca5e:	46 8d 1c 0a          	lea    (%rdx,%r9,1),%r11d
   1ca62:	b9 01 00 00 00       	mov    $0x1,%ecx
   1ca67:	4c 89 5c 24 18       	mov    %r11,0x18(%rsp)
   1ca6c:	44 29 d9             	sub    %r11d,%ecx
   1ca6f:	45 29 cf             	sub    %r9d,%r15d
   1ca72:	41 39 cf             	cmp    %ecx,%r15d
   1ca75:	44 0f 4e f9          	cmovle %ecx,%r15d
   1ca79:	44 29 f8             	sub    %r15d,%eax
   1ca7c:	78 61                	js     1cadf <<hyperinterval::ieee::Format>::div+0x1bf>
   1ca7e:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1ca83:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
   1ca88:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1ca8d:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1ca92:	48 85 ed             	test   %rbp,%rbp
   1ca95:	0f 84 a7 02 00 00    	je     1cd42 <<hyperinterval::ieee::Format>::div+0x422>
   1ca9b:	45 31 e4             	xor    %r12d,%r12d
   1ca9e:	89 c1                	mov    %eax,%ecx
   1caa0:	4d 0f a5 ec          	shld   %cl,%r13,%r12
   1caa4:	31 d2                	xor    %edx,%edx
   1caa6:	49 d3 e5             	shl    %cl,%r13
   1caa9:	a8 40                	test   $0x40,%al
   1caab:	4d 0f 45 e5          	cmovne %r13,%r12
   1caaf:	4c 0f 45 ea          	cmovne %rdx,%r13
   1cab3:	4c 89 ef             	mov    %r13,%rdi
   1cab6:	4c 89 e6             	mov    %r12,%rsi
   1cab9:	48 89 ea             	mov    %rbp,%rdx
   1cabc:	31 c9                	xor    %ecx,%ecx
   1cabe:	ff 15 dc 0c 04 00    	call   *0x40cdc(%rip)        # 5d7a0 <_DYNAMIC+0x448>
   1cac4:	49 89 c2             	mov    %rax,%r10
   1cac7:	49 89 d1             	mov    %rdx,%r9
   1caca:	48 89 d1             	mov    %rdx,%rcx
   1cacd:	48 0f af cd          	imul   %rbp,%rcx
   1cad1:	48 f7 e5             	mul    %rbp
   1cad4:	48 01 ca             	add    %rcx,%rdx
   1cad7:	49 29 c5             	sub    %rax,%r13
   1cada:	49 19 d4             	sbb    %rdx,%r12
   1cadd:	eb 79                	jmp    1cb58 <<hyperinterval::ieee::Format>::div+0x238>
   1cadf:	f7 d8                	neg    %eax
   1cae1:	44 39 d0             	cmp    %r10d,%eax
   1cae4:	7e 07                	jle    1caed <<hyperinterval::ieee::Format>::div+0x1cd>
   1cae6:	b3 01                	mov    $0x1,%bl
   1cae8:	e9 df 00 00 00       	jmp    1cbcc <<hyperinterval::ieee::Format>::div+0x2ac>
   1caed:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1caf2:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
   1caf7:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1cafc:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1cb01:	31 db                	xor    %ebx,%ebx
   1cb03:	89 c1                	mov    %eax,%ecx
   1cb05:	48 0f a5 eb          	shld   %cl,%rbp,%rbx
   1cb09:	48 d3 e5             	shl    %cl,%rbp
   1cb0c:	31 c9                	xor    %ecx,%ecx
   1cb0e:	a8 40                	test   $0x40,%al
   1cb10:	48 0f 45 dd          	cmovne %rbp,%rbx
   1cb14:	48 0f 45 e9          	cmovne %rcx,%rbp
   1cb18:	48 89 e8             	mov    %rbp,%rax
   1cb1b:	48 09 d8             	or     %rbx,%rax
   1cb1e:	0f 84 2b 02 00 00    	je     1cd4f <<hyperinterval::ieee::Format>::div+0x42f>
   1cb24:	45 31 e4             	xor    %r12d,%r12d
   1cb27:	4c 89 ef             	mov    %r13,%rdi
   1cb2a:	31 f6                	xor    %esi,%esi
   1cb2c:	48 89 ea             	mov    %rbp,%rdx
   1cb2f:	48 89 d9             	mov    %rbx,%rcx
   1cb32:	ff 15 68 0c 04 00    	call   *0x40c68(%rip)        # 5d7a0 <_DYNAMIC+0x448>
   1cb38:	49 89 c2             	mov    %rax,%r10
   1cb3b:	49 89 d1             	mov    %rdx,%r9
   1cb3e:	48 0f af d8          	imul   %rax,%rbx
   1cb42:	48 f7 e5             	mul    %rbp
   1cb45:	48 01 da             	add    %rbx,%rdx
   1cb48:	4c 89 c9             	mov    %r9,%rcx
   1cb4b:	48 0f af cd          	imul   %rbp,%rcx
   1cb4f:	48 01 d1             	add    %rdx,%rcx
   1cb52:	49 29 c5             	sub    %rax,%r13
   1cb55:	49 19 cc             	sbb    %rcx,%r12
   1cb58:	4d 09 e5             	or     %r12,%r13
   1cb5b:	0f 95 c3             	setne  %bl
   1cb5e:	4c 89 d0             	mov    %r10,%rax
   1cb61:	4c 09 c8             	or     %r9,%rax
   1cb64:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
   1cb69:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   1cb6e:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
   1cb73:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
   1cb78:	74 52                	je     1cbcc <<hyperinterval::ieee::Format>::div+0x2ac>
   1cb7a:	49 0f bd c1          	bsr    %r9,%rax
   1cb7e:	83 f0 3f             	xor    $0x3f,%eax
   1cb81:	4d 0f bd da          	bsr    %r10,%r11
   1cb85:	41 83 f3 3f          	xor    $0x3f,%r11d
   1cb89:	41 83 cb 40          	or     $0x40,%r11d
   1cb8d:	4d 85 c9             	test   %r9,%r9
   1cb90:	44 0f 45 d8          	cmovne %eax,%r11d
   1cb94:	41 83 f3 7f          	xor    $0x7f,%r11d
   1cb98:	43 8d 2c 3b          	lea    (%r11,%r15,1),%ebp
   1cb9c:	39 d5                	cmp    %edx,%ebp
   1cb9e:	0f 8f ce 00 00 00    	jg     1cc72 <<hyperinterval::ieee::Format>::div+0x352>
   1cba4:	b8 01 00 00 00       	mov    $0x1,%eax
   1cba9:	29 d0                	sub    %edx,%eax
   1cbab:	39 c5                	cmp    %eax,%ebp
   1cbad:	7d 28                	jge    1cbd7 <<hyperinterval::ieee::Format>::div+0x2b7>
   1cbaf:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1cbb4:	42 8d 0c 38          	lea    (%rax,%r15,1),%ecx
   1cbb8:	fe c9                	dec    %cl
   1cbba:	4c 89 d0             	mov    %r10,%rax
   1cbbd:	48 d3 e0             	shl    %cl,%rax
   1cbc0:	45 31 db             	xor    %r11d,%r11d
   1cbc3:	f6 c1 40             	test   $0x40,%cl
   1cbc6:	4c 0f 44 d8          	cmove  %rax,%r11
   1cbca:	eb 6e                	jmp    1cc3a <<hyperinterval::ieee::Format>::div+0x31a>
   1cbcc:	45 31 d2             	xor    %r10d,%r10d
   1cbcf:	45 31 c9             	xor    %r9d,%r9d
   1cbd2:	45 31 db             	xor    %r11d,%r11d
   1cbd5:	eb 63                	jmp    1cc3a <<hyperinterval::ieee::Format>::div+0x31a>
   1cbd7:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1cbdc:	89 c1                	mov    %eax,%ecx
   1cbde:	44 29 d9             	sub    %r11d,%ecx
   1cbe1:	4d 89 d4             	mov    %r10,%r12
   1cbe4:	49 d3 e4             	shl    %cl,%r12
   1cbe7:	89 c8                	mov    %ecx,%eax
   1cbe9:	f7 d8                	neg    %eax
   1cbeb:	45 31 ed             	xor    %r13d,%r13d
   1cbee:	f6 c1 40             	test   $0x40,%cl
   1cbf1:	4d 0f 44 ec          	cmove  %r12,%r13
   1cbf5:	4d 89 d4             	mov    %r10,%r12
   1cbf8:	89 c1                	mov    %eax,%ecx
   1cbfa:	4d 0f ad cc          	shrd   %cl,%r9,%r12
   1cbfe:	88 5c 24 0f          	mov    %bl,0xf(%rsp)
   1cc02:	4c 89 cb             	mov    %r9,%rbx
   1cc05:	48 d3 eb             	shr    %cl,%rbx
   1cc08:	a8 40                	test   $0x40,%al
   1cc0a:	49 0f 44 dc          	cmove  %r12,%rbx
   1cc0e:	44 39 5c 24 10       	cmp    %r11d,0x10(%rsp)
   1cc13:	49 0f 43 dd          	cmovae %r13,%rbx
   1cc17:	01 d5                	add    %edx,%ebp
   1cc19:	48 63 c5             	movslq %ebp,%rax
   1cc1c:	44 89 f1             	mov    %r14d,%ecx
   1cc1f:	48 d3 e0             	shl    %cl,%rax
   1cc22:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   1cc29:	49 d3 e3             	shl    %cl,%r11
   1cc2c:	49 f7 d3             	not    %r11
   1cc2f:	49 21 db             	and    %rbx,%r11
   1cc32:	0f b6 5c 24 0f       	movzbl 0xf(%rsp),%ebx
   1cc37:	49 09 c3             	or     %rax,%r11
   1cc3a:	0f b6 db             	movzbl %bl,%ebx
   1cc3d:	4c 01 d3             	add    %r10,%rbx
   1cc40:	49 83 d1 00          	adc    $0x0,%r9
   1cc44:	48 89 d8             	mov    %rbx,%rax
   1cc47:	4c 09 c8             	or     %r9,%rax
   1cc4a:	74 30                	je     1cc7c <<hyperinterval::ieee::Format>::div+0x35c>
   1cc4c:	49 0f bd c1          	bsr    %r9,%rax
   1cc50:	83 f0 3f             	xor    $0x3f,%eax
   1cc53:	4c 0f bd d3          	bsr    %rbx,%r10
   1cc57:	41 83 f2 3f          	xor    $0x3f,%r10d
   1cc5b:	41 83 ca 40          	or     $0x40,%r10d
   1cc5f:	4d 85 c9             	test   %r9,%r9
   1cc62:	44 0f 45 d0          	cmovne %eax,%r10d
   1cc66:	41 83 f2 7f          	xor    $0x7f,%r10d
   1cc6a:	43 8d 2c 3a          	lea    (%r10,%r15,1),%ebp
   1cc6e:	39 d5                	cmp    %edx,%ebp
   1cc70:	7e 0e                	jle    1cc80 <<hyperinterval::ieee::Format>::div+0x360>
   1cc72:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   1cc77:	e9 b4 00 00 00       	jmp    1cd30 <<hyperinterval::ieee::Format>::div+0x410>
   1cc7c:	31 c0                	xor    %eax,%eax
   1cc7e:	eb 76                	jmp    1ccf6 <<hyperinterval::ieee::Format>::div+0x3d6>
   1cc80:	b8 01 00 00 00       	mov    $0x1,%eax
   1cc85:	29 d0                	sub    %edx,%eax
   1cc87:	39 c5                	cmp    %eax,%ebp
   1cc89:	7d 18                	jge    1cca3 <<hyperinterval::ieee::Format>::div+0x383>
   1cc8b:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1cc90:	44 01 f9             	add    %r15d,%ecx
   1cc93:	fe c9                	dec    %cl
   1cc95:	48 d3 e3             	shl    %cl,%rbx
   1cc98:	31 c0                	xor    %eax,%eax
   1cc9a:	f6 c1 40             	test   $0x40,%cl
   1cc9d:	48 0f 44 c3          	cmove  %rbx,%rax
   1cca1:	eb 53                	jmp    1ccf6 <<hyperinterval::ieee::Format>::div+0x3d6>
   1cca3:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   1cca8:	44 89 e9             	mov    %r13d,%ecx
   1ccab:	44 29 d1             	sub    %r10d,%ecx
   1ccae:	89 c8                	mov    %ecx,%eax
   1ccb0:	f7 d8                	neg    %eax
   1ccb2:	49 89 df             	mov    %rbx,%r15
   1ccb5:	49 d3 e7             	shl    %cl,%r15
   1ccb8:	45 31 e4             	xor    %r12d,%r12d
   1ccbb:	f6 c1 40             	test   $0x40,%cl
   1ccbe:	4d 0f 44 e7          	cmove  %r15,%r12
   1ccc2:	89 c1                	mov    %eax,%ecx
   1ccc4:	4c 0f ad cb          	shrd   %cl,%r9,%rbx
   1ccc8:	49 d3 e9             	shr    %cl,%r9
   1cccb:	a8 40                	test   $0x40,%al
   1cccd:	4c 0f 44 cb          	cmove  %rbx,%r9
   1ccd1:	45 39 d5             	cmp    %r10d,%r13d
   1ccd4:	4d 0f 43 cc          	cmovae %r12,%r9
   1ccd8:	01 d5                	add    %edx,%ebp
   1ccda:	48 63 d5             	movslq %ebp,%rdx
   1ccdd:	44 89 f1             	mov    %r14d,%ecx
   1cce0:	48 d3 e2             	shl    %cl,%rdx
   1cce3:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   1ccea:	48 d3 e0             	shl    %cl,%rax
   1cced:	48 f7 d0             	not    %rax
   1ccf0:	4c 21 c8             	and    %r9,%rax
   1ccf3:	48 09 d0             	or     %rdx,%rax
   1ccf6:	48 85 74 24 40       	test   %rsi,0x40(%rsp)
   1ccfb:	0f 95 c1             	setne  %cl
   1ccfe:	49 85 f0             	test   %rsi,%r8
   1cd01:	0f 94 c2             	sete   %dl
   1cd04:	30 ca                	xor    %cl,%dl
   1cd06:	75 1d                	jne    1cd25 <<hyperinterval::ieee::Format>::div+0x405>
   1cd08:	48 89 c1             	mov    %rax,%rcx
   1cd0b:	48 31 f1             	xor    %rsi,%rcx
   1cd0e:	48 85 c0             	test   %rax,%rax
   1cd11:	48 0f 44 c8          	cmove  %rax,%rcx
   1cd15:	4c 31 de             	xor    %r11,%rsi
   1cd18:	4d 85 db             	test   %r11,%r11
   1cd1b:	49 0f 44 f3          	cmove  %r11,%rsi
   1cd1f:	48 89 f0             	mov    %rsi,%rax
   1cd22:	49 89 cb             	mov    %rcx,%r11
   1cd25:	4c 89 5f 08          	mov    %r11,0x8(%rdi)
   1cd29:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1cd2d:	c6 07 00             	movb   $0x0,(%rdi)
   1cd30:	48 89 f8             	mov    %rdi,%rax
   1cd33:	48 83 c4 48          	add    $0x48,%rsp
   1cd37:	5b                   	pop    %rbx
   1cd38:	41 5c                	pop    %r12
   1cd3a:	41 5d                	pop    %r13
   1cd3c:	41 5e                	pop    %r14
   1cd3e:	41 5f                	pop    %r15
   1cd40:	5d                   	pop    %rbp
   1cd41:	c3                   	ret
   1cd42:	48 8d 3d 07 e8 03 00 	lea    0x3e807(%rip),%rdi        # 5b550 <__frame_dummy_init_array_entry+0x1f0>
   1cd49:	ff 15 59 0a 04 00    	call   *0x40a59(%rip)        # 5d7a8 <_DYNAMIC+0x450>
   1cd4f:	48 8d 3d e2 e7 03 00 	lea    0x3e7e2(%rip),%rdi        # 5b538 <__frame_dummy_init_array_entry+0x1d8>
   1cd56:	ff 15 4c 0a 04 00    	call   *0x40a4c(%rip)        # 5d7a8 <_DYNAMIC+0x450>
   1cd5c:	cc                   	int3
   1cd5d:	cc                   	int3
   1cd5e:	cc                   	int3
   1cd5f:	cc                   	int3

<hyperinterval::ieee::Format>::mul:
   1cd60:	55                   	push   %rbp
   1cd61:	41 57                	push   %r15
   1cd63:	41 56                	push   %r14
   1cd65:	41 54                	push   %r12
   1cd67:	53                   	push   %rbx
   1cd68:	48 83 ec 20          	sub    $0x20,%rsp
   1cd6c:	48 89 c8             	mov    %rcx,%rax
   1cd6f:	49 89 d1             	mov    %rdx,%r9
   1cd72:	b9 40 00 00 00       	mov    $0x40,%ecx
   1cd77:	f3 48 0f bc ca       	tzcnt  %rdx,%rcx
   1cd7c:	48 89 c2             	mov    %rax,%rdx
   1cd7f:	4c 21 ca             	and    %r9,%rdx
   1cd82:	48 d3 ea             	shr    %cl,%rdx
   1cd85:	41 be 01 00 00 00    	mov    $0x1,%r14d
   1cd8b:	49 d3 e6             	shl    %cl,%r14
   1cd8e:	4d 8d 66 ff          	lea    -0x1(%r14),%r12
   1cd92:	4c 89 e3             	mov    %r12,%rbx
   1cd95:	48 21 c3             	and    %rax,%rbx
   1cd98:	48 85 d2             	test   %rdx,%rdx
   1cd9b:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1cda1:	41 89 d3             	mov    %edx,%r11d
   1cda4:	45 0f 44 da          	cmove  %r10d,%r11d
   1cda8:	49 0f 45 d6          	cmovne %r14,%rdx
   1cdac:	48 09 da             	or     %rbx,%rdx
   1cdaf:	4d 89 cf             	mov    %r9,%r15
   1cdb2:	49 d3 ef             	shr    %cl,%r15
   1cdb5:	48 85 f0             	test   %rsi,%rax
   1cdb8:	40 0f 95 c5          	setne  %bpl
   1cdbc:	4c 89 c0             	mov    %r8,%rax
   1cdbf:	4c 21 c8             	and    %r9,%rax
   1cdc2:	48 d3 e8             	shr    %cl,%rax
   1cdc5:	4d 21 c4             	and    %r8,%r12
   1cdc8:	48 85 c0             	test   %rax,%rax
   1cdcb:	44 0f 45 d0          	cmovne %eax,%r10d
   1cdcf:	48 89 fb             	mov    %rdi,%rbx
   1cdd2:	49 0f 45 c6          	cmovne %r14,%rax
   1cdd6:	4c 09 e0             	or     %r12,%rax
   1cdd9:	49 85 f0             	test   %rsi,%r8
   1cddc:	40 0f 95 c7          	setne  %dil
   1cde0:	40 30 ef             	xor    %bpl,%dil
   1cde3:	48 f7 e2             	mul    %rdx
   1cde6:	45 01 da             	add    %r11d,%r10d
   1cde9:	41 8d 0c 4f          	lea    (%r15,%rcx,2),%ecx
   1cded:	83 e1 fe             	and    $0xfffffffe,%ecx
   1cdf0:	41 29 ca             	sub    %ecx,%r10d
   1cdf3:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
   1cdf8:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1cdfd:	48 89 04 24          	mov    %rax,(%rsp)
   1ce01:	44 89 54 24 10       	mov    %r10d,0x10(%rsp)
   1ce06:	48 89 e1             	mov    %rsp,%rcx
   1ce09:	48 89 df             	mov    %rbx,%rdi
   1ce0c:	4c 89 ca             	mov    %r9,%rdx
   1ce0f:	e8 1c 0f 00 00       	call   1dd30 <<hyperinterval::ieee::Format>::rounded>
   1ce14:	48 89 d8             	mov    %rbx,%rax
   1ce17:	48 83 c4 20          	add    $0x20,%rsp
   1ce1b:	5b                   	pop    %rbx
   1ce1c:	41 5c                	pop    %r12
   1ce1e:	41 5e                	pop    %r14
   1ce20:	41 5f                	pop    %r15
   1ce22:	5d                   	pop    %rbp
   1ce23:	c3                   	ret
   1ce24:	cc                   	int3
   1ce25:	cc                   	int3
   1ce26:	cc                   	int3
   1ce27:	cc                   	int3
   1ce28:	cc                   	int3
   1ce29:	cc                   	int3
   1ce2a:	cc                   	int3
   1ce2b:	cc                   	int3
   1ce2c:	cc                   	int3
   1ce2d:	cc                   	int3
   1ce2e:	cc                   	int3
   1ce2f:	cc                   	int3

<hyperinterval::ieee::Format>::sqrt:
   1ce30:	55                   	push   %rbp
   1ce31:	41 57                	push   %r15
   1ce33:	41 56                	push   %r14
   1ce35:	41 55                	push   %r13
   1ce37:	41 54                	push   %r12
   1ce39:	53                   	push   %rbx
   1ce3a:	48 83 ec 38          	sub    $0x38,%rsp
   1ce3e:	48 89 c8             	mov    %rcx,%rax
   1ce41:	49 89 d6             	mov    %rdx,%r14
   1ce44:	41 b8 40 00 00 00    	mov    $0x40,%r8d
   1ce4a:	f3 4c 0f bc c2       	tzcnt  %rdx,%r8
   1ce4f:	48 89 ca             	mov    %rcx,%rdx
   1ce52:	4c 21 f2             	and    %r14,%rdx
   1ce55:	45 89 c5             	mov    %r8d,%r13d
   1ce58:	41 83 e5 3f          	and    $0x3f,%r13d
   1ce5c:	44 89 e9             	mov    %r13d,%ecx
   1ce5f:	48 d3 ea             	shr    %cl,%rdx
   1ce62:	bd 01 00 00 00       	mov    $0x1,%ebp
   1ce67:	48 d3 e5             	shl    %cl,%rbp
   1ce6a:	49 89 ff             	mov    %rdi,%r15
   1ce6d:	48 8d 75 ff          	lea    -0x1(%rbp),%rsi
   1ce71:	48 21 c6             	and    %rax,%rsi
   1ce74:	48 85 d2             	test   %rdx,%rdx
   1ce77:	48 0f 44 ea          	cmove  %rdx,%rbp
   1ce7b:	49 d3 ee             	shr    %cl,%r14
   1ce7e:	48 09 f5             	or     %rsi,%rbp
   1ce81:	0f 84 8a 00 00 00    	je     1cf11 <<hyperinterval::ieee::Format>::sqrt+0xe1>
   1ce87:	49 d1 ee             	shr    $1,%r14
   1ce8a:	48 85 d2             	test   %rdx,%rdx
   1ce8d:	b9 01 00 00 00       	mov    $0x1,%ecx
   1ce92:	0f 45 ca             	cmovne %edx,%ecx
   1ce95:	44 29 f1             	sub    %r14d,%ecx
   1ce98:	44 29 c1             	sub    %r8d,%ecx
   1ce9b:	48 0f bd dd          	bsr    %rbp,%rbx
   1ce9f:	83 f3 3f             	xor    $0x3f,%ebx
   1cea2:	83 cb 40             	or     $0x40,%ebx
   1cea5:	83 f3 7f             	xor    $0x7f,%ebx
   1cea8:	01 cb                	add    %ecx,%ebx
   1ceaa:	d1 fb                	sar    $1,%ebx
   1ceac:	41 89 db             	mov    %ebx,%r11d
   1ceaf:	45 29 c3             	sub    %r8d,%r11d
   1ceb2:	44 29 d9             	sub    %r11d,%ecx
   1ceb5:	44 29 d9             	sub    %r11d,%ecx
   1ceb8:	45 31 d2             	xor    %r10d,%r10d
   1cebb:	49 0f a5 ea          	shld   %cl,%rbp,%r10
   1cebf:	48 d3 e5             	shl    %cl,%rbp
   1cec2:	31 f6                	xor    %esi,%esi
   1cec4:	f6 c1 40             	test   $0x40,%cl
   1cec7:	4c 0f 45 d5          	cmovne %rbp,%r10
   1cecb:	48 0f 45 ee          	cmovne %rsi,%rbp
   1cecf:	4d 85 d2             	test   %r10,%r10
   1ced2:	4c 89 44 24 10       	mov    %r8,0x10(%rsp)
   1ced7:	75 45                	jne    1cf1e <<hyperinterval::ieee::Format>::sqrt+0xee>
   1ced9:	48 89 e8             	mov    %rbp,%rax
   1cedc:	48 c1 e8 20          	shr    $0x20,%rax
   1cee0:	0f 85 64 01 00 00    	jne    1d04a <<hyperinterval::ieee::Format>::sqrt+0x21a>
   1cee6:	48 81 fd 00 00 01 00 	cmp    $0x10000,%rbp
   1ceed:	0f 83 17 03 00 00    	jae    1d20a <<hyperinterval::ieee::Format>::sqrt+0x3da>
   1cef3:	48 81 fd 00 01 00 00 	cmp    $0x100,%rbp
   1cefa:	0f 83 eb 03 00 00    	jae    1d2eb <<hyperinterval::ieee::Format>::sqrt+0x4bb>
   1cf00:	48 8d 05 89 a8 fe ff 	lea    -0x15777(%rip),%rax        # 7790 <__abi_tag+0x7494>
   1cf07:	44 0f b6 24 68       	movzbl (%rax,%rbp,2),%r12d
   1cf0c:	e9 d6 03 00 00       	jmp    1d2e7 <<hyperinterval::ieee::Format>::sqrt+0x4b7>
   1cf11:	0f 57 c0             	xorps  %xmm0,%xmm0
   1cf14:	41 0f 11 47 08       	movups %xmm0,0x8(%r15)
   1cf19:	e9 fe 05 00 00       	jmp    1d51c <<hyperinterval::ieee::Format>::sqrt+0x6ec>
   1cf1e:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
   1cf23:	4c 89 7c 24 30       	mov    %r15,0x30(%rsp)
   1cf28:	49 0f bd c2          	bsr    %r10,%rax
   1cf2c:	48 83 f0 3f          	xor    $0x3f,%rax
   1cf30:	4c 0f bd ed          	bsr    %rbp,%r13
   1cf34:	49 83 f5 3f          	xor    $0x3f,%r13
   1cf38:	49 83 cd 40          	or     $0x40,%r13
   1cf3c:	4d 85 d2             	test   %r10,%r10
   1cf3f:	4c 0f 45 e8          	cmovne %rax,%r13
   1cf43:	44 89 e9             	mov    %r13d,%ecx
   1cf46:	80 e1 3e             	and    $0x3e,%cl
   1cf49:	4d 89 d7             	mov    %r10,%r15
   1cf4c:	49 0f a5 ef          	shld   %cl,%rbp,%r15
   1cf50:	48 89 e8             	mov    %rbp,%rax
   1cf53:	48 d3 e0             	shl    %cl,%rax
   1cf56:	41 f6 c5 40          	test   $0x40,%r13b
   1cf5a:	4c 0f 45 f8          	cmovne %rax,%r15
   1cf5e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   1cf64:	4c 0f 44 c0          	cmove  %rax,%r8
   1cf68:	4c 89 f8             	mov    %r15,%rax
   1cf6b:	48 c1 e8 38          	shr    $0x38,%rax
   1cf6f:	48 8d 15 1a a8 fe ff 	lea    -0x157e6(%rip),%rdx        # 7790 <__abi_tag+0x7494>
   1cf76:	0f b6 0c 42          	movzbl (%rdx,%rax,2),%ecx
   1cf7a:	89 cf                	mov    %ecx,%edi
   1cf7c:	01 cf                	add    %ecx,%edi
   1cf7e:	0f b6 54 42 01       	movzbl 0x1(%rdx,%rax,2),%edx
   1cf83:	c1 e2 04             	shl    $0x4,%edx
   1cf86:	4c 89 f8             	mov    %r15,%rax
   1cf89:	48 c1 e8 34          	shr    $0x34,%rax
   1cf8d:	83 e0 0f             	and    $0xf,%eax
   1cf90:	09 d0                	or     %edx,%eax
   1cf92:	31 d2                	xor    %edx,%edx
   1cf94:	66 f7 f7             	div    %di
   1cf97:	4c 89 ff             	mov    %r15,%rdi
   1cf9a:	48 c1 ef 30          	shr    $0x30,%rdi
   1cf9e:	0f b7 d2             	movzwl %dx,%edx
   1cfa1:	c0 e1 04             	shl    $0x4,%cl
   1cfa4:	0f b6 c9             	movzbl %cl,%ecx
   1cfa7:	01 c1                	add    %eax,%ecx
   1cfa9:	0f b7 c9             	movzwl %cx,%ecx
   1cfac:	c1 e2 04             	shl    $0x4,%edx
   1cfaf:	83 e7 0f             	and    $0xf,%edi
   1cfb2:	09 d7                	or     %edx,%edi
   1cfb4:	0f af c0             	imul   %eax,%eax
   1cfb7:	66 29 c7             	sub    %ax,%di
   1cfba:	8d 44 09 ff          	lea    -0x1(%rcx,%rcx,1),%eax
   1cfbe:	0f 43 c6             	cmovae %esi,%eax
   1cfc1:	66 83 d9 00          	sbb    $0x0,%cx
   1cfc5:	01 f8                	add    %edi,%eax
   1cfc7:	0f b7 f9             	movzwl %cx,%edi
   1cfca:	01 ff                	add    %edi,%edi
   1cfcc:	0f b7 d0             	movzwl %ax,%edx
   1cfcf:	c1 e2 08             	shl    $0x8,%edx
   1cfd2:	4c 89 f8             	mov    %r15,%rax
   1cfd5:	48 c1 e8 28          	shr    $0x28,%rax
   1cfd9:	0f b6 c0             	movzbl %al,%eax
   1cfdc:	09 d0                	or     %edx,%eax
   1cfde:	31 d2                	xor    %edx,%edx
   1cfe0:	f7 f7                	div    %edi
   1cfe2:	4c 89 ff             	mov    %r15,%rdi
   1cfe5:	48 c1 ef 20          	shr    $0x20,%rdi
   1cfe9:	c1 e1 08             	shl    $0x8,%ecx
   1cfec:	44 0f b7 e1          	movzwl %cx,%r12d
   1cff0:	41 01 c4             	add    %eax,%r12d
   1cff3:	c1 e2 08             	shl    $0x8,%edx
   1cff6:	40 0f b6 cf          	movzbl %dil,%ecx
   1cffa:	09 d1                	or     %edx,%ecx
   1cffc:	0f af c0             	imul   %eax,%eax
   1cfff:	29 c1                	sub    %eax,%ecx
   1d001:	43 8d 44 24 ff       	lea    -0x1(%r12,%r12,1),%eax
   1d006:	0f 43 c6             	cmovae %esi,%eax
   1d009:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1d00c:	41 83 dc 00          	sbb    $0x0,%r12d
   1d010:	4b 8d 0c 24          	lea    (%r12,%r12,1),%rcx
   1d014:	48 c1 e2 10          	shl    $0x10,%rdx
   1d018:	44 89 f8             	mov    %r15d,%eax
   1d01b:	c1 e8 10             	shr    $0x10,%eax
   1d01e:	48 09 d0             	or     %rdx,%rax
   1d021:	48 09 ca             	or     %rcx,%rdx
   1d024:	48 c1 ea 20          	shr    $0x20,%rdx
   1d028:	66 85 d2             	test   %dx,%dx
   1d02b:	4c 89 5c 24 08       	mov    %r11,0x8(%rsp)
   1d030:	4c 89 54 24 20       	mov    %r10,0x20(%rsp)
   1d035:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
   1d03a:	0f 84 06 01 00 00    	je     1d146 <<hyperinterval::ieee::Format>::sqrt+0x316>
   1d040:	31 d2                	xor    %edx,%edx
   1d042:	48 f7 f1             	div    %rcx
   1d045:	e9 00 01 00 00       	jmp    1d14a <<hyperinterval::ieee::Format>::sqrt+0x31a>
   1d04a:	48 0f bd f5          	bsr    %rbp,%rsi
   1d04e:	48 83 f6 3f          	xor    $0x3f,%rsi
   1d052:	89 f1                	mov    %esi,%ecx
   1d054:	80 e1 3e             	and    $0x3e,%cl
   1d057:	48 89 ef             	mov    %rbp,%rdi
   1d05a:	48 d3 e7             	shl    %cl,%rdi
   1d05d:	48 89 f8             	mov    %rdi,%rax
   1d060:	48 c1 e8 38          	shr    $0x38,%rax
   1d064:	48 8d 0d 25 a7 fe ff 	lea    -0x158db(%rip),%rcx        # 7790 <__abi_tag+0x7494>
   1d06b:	44 0f b6 04 41       	movzbl (%rcx,%rax,2),%r8d
   1d070:	45 89 c1             	mov    %r8d,%r9d
   1d073:	45 01 c1             	add    %r8d,%r9d
   1d076:	0f b6 4c 41 01       	movzbl 0x1(%rcx,%rax,2),%ecx
   1d07b:	c1 e1 04             	shl    $0x4,%ecx
   1d07e:	48 89 f8             	mov    %rdi,%rax
   1d081:	48 c1 e8 34          	shr    $0x34,%rax
   1d085:	83 e0 0f             	and    $0xf,%eax
   1d088:	09 c8                	or     %ecx,%eax
   1d08a:	31 d2                	xor    %edx,%edx
   1d08c:	66 41 f7 f1          	div    %r9w
   1d090:	49 89 f9             	mov    %rdi,%r9
   1d093:	49 c1 e9 30          	shr    $0x30,%r9
   1d097:	31 c9                	xor    %ecx,%ecx
   1d099:	0f b7 d2             	movzwl %dx,%edx
   1d09c:	41 c0 e0 04          	shl    $0x4,%r8b
   1d0a0:	45 0f b6 c0          	movzbl %r8b,%r8d
   1d0a4:	41 01 c0             	add    %eax,%r8d
   1d0a7:	45 0f b7 c0          	movzwl %r8w,%r8d
   1d0ab:	c1 e2 04             	shl    $0x4,%edx
   1d0ae:	41 83 e1 0f          	and    $0xf,%r9d
   1d0b2:	41 09 d1             	or     %edx,%r9d
   1d0b5:	0f af c0             	imul   %eax,%eax
   1d0b8:	66 41 29 c1          	sub    %ax,%r9w
   1d0bc:	43 8d 44 00 ff       	lea    -0x1(%r8,%r8,1),%eax
   1d0c1:	0f 43 c1             	cmovae %ecx,%eax
   1d0c4:	66 41 83 d8 00       	sbb    $0x0,%r8w
   1d0c9:	44 01 c8             	add    %r9d,%eax
   1d0cc:	45 0f b7 c8          	movzwl %r8w,%r9d
   1d0d0:	45 01 c9             	add    %r9d,%r9d
   1d0d3:	0f b7 d0             	movzwl %ax,%edx
   1d0d6:	c1 e2 08             	shl    $0x8,%edx
   1d0d9:	48 89 f8             	mov    %rdi,%rax
   1d0dc:	48 c1 e8 28          	shr    $0x28,%rax
   1d0e0:	0f b6 c0             	movzbl %al,%eax
   1d0e3:	09 d0                	or     %edx,%eax
   1d0e5:	31 d2                	xor    %edx,%edx
   1d0e7:	41 f7 f1             	div    %r9d
   1d0ea:	49 89 f9             	mov    %rdi,%r9
   1d0ed:	49 c1 e9 20          	shr    $0x20,%r9
   1d0f1:	41 c1 e0 08          	shl    $0x8,%r8d
   1d0f5:	45 0f b7 e0          	movzwl %r8w,%r12d
   1d0f9:	41 01 c4             	add    %eax,%r12d
   1d0fc:	c1 e2 08             	shl    $0x8,%edx
   1d0ff:	45 0f b6 c1          	movzbl %r9b,%r8d
   1d103:	41 09 d0             	or     %edx,%r8d
   1d106:	0f af c0             	imul   %eax,%eax
   1d109:	41 29 c0             	sub    %eax,%r8d
   1d10c:	43 8d 44 24 ff       	lea    -0x1(%r12,%r12,1),%eax
   1d111:	0f 43 c1             	cmovae %ecx,%eax
   1d114:	41 8d 14 00          	lea    (%r8,%rax,1),%edx
   1d118:	41 83 dc 00          	sbb    $0x0,%r12d
   1d11c:	4b 8d 0c 24          	lea    (%r12,%r12,1),%rcx
   1d120:	48 c1 e2 10          	shl    $0x10,%rdx
   1d124:	89 f8                	mov    %edi,%eax
   1d126:	c1 e8 10             	shr    $0x10,%eax
   1d129:	48 09 d0             	or     %rdx,%rax
   1d12c:	48 09 ca             	or     %rcx,%rdx
   1d12f:	48 c1 ea 20          	shr    $0x20,%rdx
   1d133:	66 85 d2             	test   %dx,%dx
   1d136:	0f 84 82 01 00 00    	je     1d2be <<hyperinterval::ieee::Format>::sqrt+0x48e>
   1d13c:	31 d2                	xor    %edx,%edx
   1d13e:	48 f7 f1             	div    %rcx
   1d141:	e9 7c 01 00 00       	jmp    1d2c2 <<hyperinterval::ieee::Format>::sqrt+0x492>
   1d146:	31 d2                	xor    %edx,%edx
   1d148:	f7 f1                	div    %ecx
   1d14a:	41 c1 e4 10          	shl    $0x10,%r12d
   1d14e:	49 01 c4             	add    %rax,%r12
   1d151:	48 c1 e2 10          	shl    $0x10,%rdx
   1d155:	41 0f b7 cf          	movzwl %r15w,%ecx
   1d159:	48 09 d1             	or     %rdx,%rcx
   1d15c:	48 0f af c0          	imul   %rax,%rax
   1d160:	31 d2                	xor    %edx,%edx
   1d162:	48 29 c1             	sub    %rax,%rcx
   1d165:	4b 8d 44 24 ff       	lea    -0x1(%r12,%r12,1),%rax
   1d16a:	48 0f 42 d0          	cmovb  %rax,%rdx
   1d16e:	49 83 dc 00          	sbb    $0x0,%r12
   1d172:	48 8d 3c 11          	lea    (%rcx,%rdx,1),%rdi
   1d176:	4b 8d 14 24          	lea    (%r12,%r12,1),%rdx
   1d17a:	4c 89 e1             	mov    %r12,%rcx
   1d17d:	48 c1 e9 3f          	shr    $0x3f,%rcx
   1d181:	48 89 fe             	mov    %rdi,%rsi
   1d184:	48 c1 ee 20          	shr    $0x20,%rsi
   1d188:	4c 0f a4 c7 20       	shld   $0x20,%r8,%rdi
   1d18d:	4c 89 c3             	mov    %r8,%rbx
   1d190:	ff 15 0a 06 04 00    	call   *0x4060a(%rip)        # 5d7a0 <_DYNAMIC+0x448>
   1d196:	48 89 d6             	mov    %rdx,%rsi
   1d199:	49 c1 e4 20          	shl    $0x20,%r12
   1d19d:	49 01 c4             	add    %rax,%r12
   1d1a0:	48 83 d6 00          	adc    $0x0,%rsi
   1d1a4:	48 89 f0             	mov    %rsi,%rax
   1d1a7:	49 f7 e4             	mul    %r12
   1d1aa:	0f 90 c1             	seto   %cl
   1d1ad:	48 85 f6             	test   %rsi,%rsi
   1d1b0:	40 0f 95 c7          	setne  %dil
   1d1b4:	40 08 cf             	or     %cl,%dil
   1d1b7:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   1d1bb:	4c 89 e0             	mov    %r12,%rax
   1d1be:	49 f7 e4             	mul    %r12
   1d1c1:	48 01 ca             	add    %rcx,%rdx
   1d1c4:	0f 92 c1             	setb   %cl
   1d1c7:	40 08 f9             	or     %dil,%cl
   1d1ca:	48 39 c3             	cmp    %rax,%rbx
   1d1cd:	49 19 d7             	sbb    %rdx,%r15
   1d1d0:	0f 92 c0             	setb   %al
   1d1d3:	08 c8                	or     %cl,%al
   1d1d5:	0f b6 c0             	movzbl %al,%eax
   1d1d8:	49 29 c4             	sub    %rax,%r12
   1d1db:	48 83 de 00          	sbb    $0x0,%rsi
   1d1df:	41 d1 ed             	shr    $1,%r13d
   1d1e2:	44 89 e9             	mov    %r13d,%ecx
   1d1e5:	49 0f ad f4          	shrd   %cl,%rsi,%r12
   1d1e9:	48 d3 ee             	shr    %cl,%rsi
   1d1ec:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
   1d1f1:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
   1d1f6:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
   1d1fb:	4c 8b 54 24 20       	mov    0x20(%rsp),%r10
   1d200:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
   1d205:	e9 52 01 00 00       	jmp    1d35c <<hyperinterval::ieee::Format>::sqrt+0x52c>
   1d20a:	0f bd fd             	bsr    %ebp,%edi
   1d20d:	83 f7 1f             	xor    $0x1f,%edi
   1d210:	89 f9                	mov    %edi,%ecx
   1d212:	80 e1 1e             	and    $0x1e,%cl
   1d215:	89 ea                	mov    %ebp,%edx
   1d217:	d3 e2                	shl    %cl,%edx
   1d219:	89 d0                	mov    %edx,%eax
   1d21b:	41 89 d0             	mov    %edx,%r8d
   1d21e:	c1 e8 18             	shr    $0x18,%eax
   1d221:	48 8d 15 68 a5 fe ff 	lea    -0x15a98(%rip),%rdx        # 7790 <__abi_tag+0x7494>
   1d228:	0f b6 0c 42          	movzbl (%rdx,%rax,2),%ecx
   1d22c:	89 ce                	mov    %ecx,%esi
   1d22e:	01 ce                	add    %ecx,%esi
   1d230:	0f b6 54 42 01       	movzbl 0x1(%rdx,%rax,2),%edx
   1d235:	c1 e2 04             	shl    $0x4,%edx
   1d238:	45 89 c1             	mov    %r8d,%r9d
   1d23b:	44 89 c0             	mov    %r8d,%eax
   1d23e:	c1 e8 14             	shr    $0x14,%eax
   1d241:	83 e0 0f             	and    $0xf,%eax
   1d244:	09 d0                	or     %edx,%eax
   1d246:	31 d2                	xor    %edx,%edx
   1d248:	66 f7 f6             	div    %si
   1d24b:	41 c1 e8 10          	shr    $0x10,%r8d
   1d24f:	31 f6                	xor    %esi,%esi
   1d251:	0f b7 d2             	movzwl %dx,%edx
   1d254:	c0 e1 04             	shl    $0x4,%cl
   1d257:	0f b6 c9             	movzbl %cl,%ecx
   1d25a:	01 c1                	add    %eax,%ecx
   1d25c:	0f b7 c9             	movzwl %cx,%ecx
   1d25f:	c1 e2 04             	shl    $0x4,%edx
   1d262:	41 83 e0 0f          	and    $0xf,%r8d
   1d266:	41 09 d0             	or     %edx,%r8d
   1d269:	0f af c0             	imul   %eax,%eax
   1d26c:	66 41 29 c0          	sub    %ax,%r8w
   1d270:	8d 44 09 ff          	lea    -0x1(%rcx,%rcx,1),%eax
   1d274:	0f 43 c6             	cmovae %esi,%eax
   1d277:	66 83 d9 00          	sbb    $0x0,%cx
   1d27b:	44 01 c0             	add    %r8d,%eax
   1d27e:	44 0f b7 c1          	movzwl %cx,%r8d
   1d282:	45 01 c0             	add    %r8d,%r8d
   1d285:	0f b7 d0             	movzwl %ax,%edx
   1d288:	c1 e2 08             	shl    $0x8,%edx
   1d28b:	44 89 c8             	mov    %r9d,%eax
   1d28e:	0f b6 c4             	movzbl %ah,%eax
   1d291:	09 d0                	or     %edx,%eax
   1d293:	31 d2                	xor    %edx,%edx
   1d295:	41 f7 f0             	div    %r8d
   1d298:	c1 e1 08             	shl    $0x8,%ecx
   1d29b:	44 0f b7 e1          	movzwl %cx,%r12d
   1d29f:	41 01 c4             	add    %eax,%r12d
   1d2a2:	44 89 e0             	mov    %r12d,%eax
   1d2a5:	41 f7 e4             	mul    %r12d
   1d2a8:	0f 90 c1             	seto   %cl
   1d2ab:	44 39 c8             	cmp    %r9d,%eax
   1d2ae:	0f 97 c0             	seta   %al
   1d2b1:	08 c8                	or     %cl,%al
   1d2b3:	0f b6 c0             	movzbl %al,%eax
   1d2b6:	41 29 c4             	sub    %eax,%r12d
   1d2b9:	e9 97 00 00 00       	jmp    1d355 <<hyperinterval::ieee::Format>::sqrt+0x525>
   1d2be:	31 d2                	xor    %edx,%edx
   1d2c0:	f7 f1                	div    %ecx
   1d2c2:	41 c1 e4 10          	shl    $0x10,%r12d
   1d2c6:	49 01 c4             	add    %rax,%r12
   1d2c9:	4c 89 e0             	mov    %r12,%rax
   1d2cc:	49 f7 e4             	mul    %r12
   1d2cf:	0f 90 c1             	seto   %cl
   1d2d2:	48 39 f8             	cmp    %rdi,%rax
   1d2d5:	0f 97 c0             	seta   %al
   1d2d8:	08 c8                	or     %cl,%al
   1d2da:	0f b6 c0             	movzbl %al,%eax
   1d2dd:	49 29 c4             	sub    %rax,%r12
   1d2e0:	d1 ee                	shr    $1,%esi
   1d2e2:	89 f1                	mov    %esi,%ecx
   1d2e4:	49 d3 ec             	shr    %cl,%r12
   1d2e7:	31 f6                	xor    %esi,%esi
   1d2e9:	eb 71                	jmp    1d35c <<hyperinterval::ieee::Format>::sqrt+0x52c>
   1d2eb:	66 0f bd fd          	bsr    %bp,%di
   1d2ef:	83 f7 0f             	xor    $0xf,%edi
   1d2f2:	89 f9                	mov    %edi,%ecx
   1d2f4:	80 e1 0e             	and    $0xe,%cl
   1d2f7:	89 e8                	mov    %ebp,%eax
   1d2f9:	d3 e0                	shl    %cl,%eax
   1d2fb:	41 89 c0             	mov    %eax,%r8d
   1d2fe:	0f b6 cc             	movzbl %ah,%ecx
   1d301:	48 8d 15 88 a4 fe ff 	lea    -0x15b78(%rip),%rdx        # 7790 <__abi_tag+0x7494>
   1d308:	44 0f b6 0c 4a       	movzbl (%rdx,%rcx,2),%r9d
   1d30d:	4d 89 d4             	mov    %r10,%r12
   1d310:	45 89 ca             	mov    %r9d,%r10d
   1d313:	45 01 ca             	add    %r9d,%r10d
   1d316:	0f b6 4c 4a 01       	movzbl 0x1(%rdx,%rcx,2),%ecx
   1d31b:	c1 e1 04             	shl    $0x4,%ecx
   1d31e:	c1 e8 04             	shr    $0x4,%eax
   1d321:	83 e0 0f             	and    $0xf,%eax
   1d324:	09 c8                	or     %ecx,%eax
   1d326:	31 f6                	xor    %esi,%esi
   1d328:	31 d2                	xor    %edx,%edx
   1d32a:	66 41 f7 f2          	div    %r10w
   1d32e:	4d 89 e2             	mov    %r12,%r10
   1d331:	41 c0 e1 04          	shl    $0x4,%r9b
   1d335:	41 0f b6 c9          	movzbl %r9b,%ecx
   1d339:	01 c1                	add    %eax,%ecx
   1d33b:	89 c8                	mov    %ecx,%eax
   1d33d:	66 f7 e1             	mul    %cx
   1d340:	0f 90 c2             	seto   %dl
   1d343:	66 44 39 c0          	cmp    %r8w,%ax
   1d347:	0f 97 c0             	seta   %al
   1d34a:	08 d0                	or     %dl,%al
   1d34c:	0f b6 c0             	movzbl %al,%eax
   1d34f:	29 c1                	sub    %eax,%ecx
   1d351:	44 0f b7 e1          	movzwl %cx,%r12d
   1d355:	d1 ef                	shr    $1,%edi
   1d357:	89 f9                	mov    %edi,%ecx
   1d359:	41 d3 ec             	shr    %cl,%r12d
   1d35c:	4c 89 e1             	mov    %r12,%rcx
   1d35f:	4c 89 e0             	mov    %r12,%rax
   1d362:	49 f7 e4             	mul    %r12
   1d365:	48 0f af ce          	imul   %rsi,%rcx
   1d369:	48 01 ca             	add    %rcx,%rdx
   1d36c:	48 01 ca             	add    %rcx,%rdx
   1d36f:	4c 31 d2             	xor    %r10,%rdx
   1d372:	48 31 e8             	xor    %rbp,%rax
   1d375:	31 ff                	xor    %edi,%edi
   1d377:	48 09 d0             	or     %rdx,%rax
   1d37a:	40 0f 95 c7          	setne  %dil
   1d37e:	4c 01 e7             	add    %r12,%rdi
   1d381:	48 89 f2             	mov    %rsi,%rdx
   1d384:	48 83 d2 00          	adc    $0x0,%rdx
   1d388:	4c 89 e0             	mov    %r12,%rax
   1d38b:	48 09 f0             	or     %rsi,%rax
   1d38e:	74 58                	je     1d3e8 <<hyperinterval::ieee::Format>::sqrt+0x5b8>
   1d390:	48 0f bd c6          	bsr    %rsi,%rax
   1d394:	83 f0 3f             	xor    $0x3f,%eax
   1d397:	4d 0f bd c4          	bsr    %r12,%r8
   1d39b:	41 83 f0 3f          	xor    $0x3f,%r8d
   1d39f:	41 83 c8 40          	or     $0x40,%r8d
   1d3a3:	48 85 f6             	test   %rsi,%rsi
   1d3a6:	44 0f 45 c0          	cmovne %eax,%r8d
   1d3aa:	41 83 f0 7f          	xor    $0x7f,%r8d
   1d3ae:	47 8d 0c 18          	lea    (%r8,%r11,1),%r9d
   1d3b2:	45 39 f1             	cmp    %r14d,%r9d
   1d3b5:	7f 62                	jg     1d419 <<hyperinterval::ieee::Format>::sqrt+0x5e9>
   1d3b7:	b8 01 00 00 00       	mov    $0x1,%eax
   1d3bc:	44 29 f0             	sub    %r14d,%eax
   1d3bf:	41 39 c1             	cmp    %eax,%r9d
   1d3c2:	0f 8d 89 00 00 00    	jge    1d451 <<hyperinterval::ieee::Format>::sqrt+0x621>
   1d3c8:	41 8d 0c 1e          	lea    (%r14,%rbx,1),%ecx
   1d3cc:	fe c9                	dec    %cl
   1d3ce:	49 d3 e4             	shl    %cl,%r12
   1d3d1:	45 31 c0             	xor    %r8d,%r8d
   1d3d4:	f6 c1 40             	test   $0x40,%cl
   1d3d7:	4d 0f 44 c4          	cmove  %r12,%r8
   1d3db:	48 89 f8             	mov    %rdi,%rax
   1d3de:	48 09 d0             	or     %rdx,%rax
   1d3e1:	75 14                	jne    1d3f7 <<hyperinterval::ieee::Format>::sqrt+0x5c7>
   1d3e3:	e9 d2 00 00 00       	jmp    1d4ba <<hyperinterval::ieee::Format>::sqrt+0x68a>
   1d3e8:	45 31 c0             	xor    %r8d,%r8d
   1d3eb:	48 89 f8             	mov    %rdi,%rax
   1d3ee:	48 09 d0             	or     %rdx,%rax
   1d3f1:	0f 84 c3 00 00 00    	je     1d4ba <<hyperinterval::ieee::Format>::sqrt+0x68a>
   1d3f7:	48 0f bd c2          	bsr    %rdx,%rax
   1d3fb:	83 f0 3f             	xor    $0x3f,%eax
   1d3fe:	48 0f bd f7          	bsr    %rdi,%rsi
   1d402:	83 f6 3f             	xor    $0x3f,%esi
   1d405:	83 ce 40             	or     $0x40,%esi
   1d408:	48 85 d2             	test   %rdx,%rdx
   1d40b:	0f 45 f0             	cmovne %eax,%esi
   1d40e:	83 f6 7f             	xor    $0x7f,%esi
   1d411:	41 01 f3             	add    %esi,%r11d
   1d414:	45 39 f3             	cmp    %r14d,%r11d
   1d417:	7e 0c                	jle    1d425 <<hyperinterval::ieee::Format>::sqrt+0x5f5>
   1d419:	41 c6 47 01 03       	movb   $0x3,0x1(%r15)
   1d41e:	b0 01                	mov    $0x1,%al
   1d420:	e9 f9 00 00 00       	jmp    1d51e <<hyperinterval::ieee::Format>::sqrt+0x6ee>
   1d425:	b8 01 00 00 00       	mov    $0x1,%eax
   1d42a:	44 29 f0             	sub    %r14d,%eax
   1d42d:	41 39 c3             	cmp    %eax,%r11d
   1d430:	0f 8d 88 00 00 00    	jge    1d4be <<hyperinterval::ieee::Format>::sqrt+0x68e>
   1d436:	41 01 de             	add    %ebx,%r14d
   1d439:	41 fe ce             	dec    %r14b
   1d43c:	44 89 f1             	mov    %r14d,%ecx
   1d43f:	48 d3 e7             	shl    %cl,%rdi
   1d442:	31 c0                	xor    %eax,%eax
   1d444:	41 f6 c6 40          	test   $0x40,%r14b
   1d448:	48 0f 44 c7          	cmove  %rdi,%rax
   1d44c:	e9 c3 00 00 00       	jmp    1d514 <<hyperinterval::ieee::Format>::sqrt+0x6e4>
   1d451:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1d456:	89 e9                	mov    %ebp,%ecx
   1d458:	44 29 c1             	sub    %r8d,%ecx
   1d45b:	89 c8                	mov    %ecx,%eax
   1d45d:	f7 d8                	neg    %eax
   1d45f:	4d 89 e2             	mov    %r12,%r10
   1d462:	49 d3 e2             	shl    %cl,%r10
   1d465:	4c 89 5c 24 08       	mov    %r11,0x8(%rsp)
   1d46a:	45 31 db             	xor    %r11d,%r11d
   1d46d:	f6 c1 40             	test   $0x40,%cl
   1d470:	4d 0f 44 da          	cmove  %r10,%r11
   1d474:	89 c1                	mov    %eax,%ecx
   1d476:	49 0f ad f4          	shrd   %cl,%rsi,%r12
   1d47a:	48 d3 ee             	shr    %cl,%rsi
   1d47d:	a8 40                	test   $0x40,%al
   1d47f:	49 0f 44 f4          	cmove  %r12,%rsi
   1d483:	44 39 c5             	cmp    %r8d,%ebp
   1d486:	49 0f 43 f3          	cmovae %r11,%rsi
   1d48a:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
   1d48f:	45 01 f1             	add    %r14d,%r9d
   1d492:	49 63 c1             	movslq %r9d,%rax
   1d495:	44 89 e9             	mov    %r13d,%ecx
   1d498:	48 d3 e0             	shl    %cl,%rax
   1d49b:	49 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%r8
   1d4a2:	49 d3 e0             	shl    %cl,%r8
   1d4a5:	49 f7 d0             	not    %r8
   1d4a8:	49 21 f0             	and    %rsi,%r8
   1d4ab:	49 09 c0             	or     %rax,%r8
   1d4ae:	48 89 f8             	mov    %rdi,%rax
   1d4b1:	48 09 d0             	or     %rdx,%rax
   1d4b4:	0f 85 3d ff ff ff    	jne    1d3f7 <<hyperinterval::ieee::Format>::sqrt+0x5c7>
   1d4ba:	31 c0                	xor    %eax,%eax
   1d4bc:	eb 56                	jmp    1d514 <<hyperinterval::ieee::Format>::sqrt+0x6e4>
   1d4be:	4c 89 db             	mov    %r11,%rbx
   1d4c1:	4c 8b 5c 24 10       	mov    0x10(%rsp),%r11
   1d4c6:	44 89 d9             	mov    %r11d,%ecx
   1d4c9:	29 f1                	sub    %esi,%ecx
   1d4cb:	89 c8                	mov    %ecx,%eax
   1d4cd:	f7 d8                	neg    %eax
   1d4cf:	49 89 f9             	mov    %rdi,%r9
   1d4d2:	49 d3 e1             	shl    %cl,%r9
   1d4d5:	45 31 d2             	xor    %r10d,%r10d
   1d4d8:	f6 c1 40             	test   $0x40,%cl
   1d4db:	4d 0f 44 d1          	cmove  %r9,%r10
   1d4df:	89 c1                	mov    %eax,%ecx
   1d4e1:	48 0f ad d7          	shrd   %cl,%rdx,%rdi
   1d4e5:	48 d3 ea             	shr    %cl,%rdx
   1d4e8:	a8 40                	test   $0x40,%al
   1d4ea:	48 0f 44 d7          	cmove  %rdi,%rdx
   1d4ee:	41 39 f3             	cmp    %esi,%r11d
   1d4f1:	49 0f 43 d2          	cmovae %r10,%rdx
   1d4f5:	44 01 f3             	add    %r14d,%ebx
   1d4f8:	48 63 f3             	movslq %ebx,%rsi
   1d4fb:	44 89 e9             	mov    %r13d,%ecx
   1d4fe:	48 d3 e6             	shl    %cl,%rsi
   1d501:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   1d508:	48 d3 e0             	shl    %cl,%rax
   1d50b:	48 f7 d0             	not    %rax
   1d50e:	48 21 d0             	and    %rdx,%rax
   1d511:	48 09 f0             	or     %rsi,%rax
   1d514:	4d 89 47 08          	mov    %r8,0x8(%r15)
   1d518:	49 89 47 10          	mov    %rax,0x10(%r15)
   1d51c:	31 c0                	xor    %eax,%eax
   1d51e:	41 88 07             	mov    %al,(%r15)
   1d521:	4c 89 f8             	mov    %r15,%rax
   1d524:	48 83 c4 38          	add    $0x38,%rsp
   1d528:	5b                   	pop    %rbx
   1d529:	41 5c                	pop    %r12
   1d52b:	41 5d                	pop    %r13
   1d52d:	41 5e                	pop    %r14
   1d52f:	41 5f                	pop    %r15
   1d531:	5d                   	pop    %rbp
   1d532:	c3                   	ret
   1d533:	cc                   	int3
   1d534:	cc                   	int3
   1d535:	cc                   	int3
   1d536:	cc                   	int3
   1d537:	cc                   	int3
   1d538:	cc                   	int3
   1d539:	cc                   	int3
   1d53a:	cc                   	int3
   1d53b:	cc                   	int3
   1d53c:	cc                   	int3
   1d53d:	cc                   	int3
   1d53e:	cc                   	int3
   1d53f:	cc                   	int3

<hyperinterval::ieee::Format>::power:
   1d540:	55                   	push   %rbp
   1d541:	41 57                	push   %r15
   1d543:	41 56                	push   %r14
   1d545:	41 55                	push   %r13
   1d547:	41 54                	push   %r12
   1d549:	53                   	push   %rbx
   1d54a:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
   1d551:	49 89 cb             	mov    %rcx,%r11
   1d554:	49 89 d6             	mov    %rdx,%r14
   1d557:	48 85 f1             	test   %rsi,%rcx
   1d55a:	41 0f 95 c1          	setne  %r9b
   1d55e:	b8 40 00 00 00       	mov    $0x40,%eax
   1d563:	f3 48 0f bc c2       	tzcnt  %rdx,%rax
   1d568:	41 89 c2             	mov    %eax,%r10d
   1d56b:	41 83 e2 3f          	and    $0x3f,%r10d
   1d56f:	44 89 d1             	mov    %r10d,%ecx
   1d572:	48 d3 ea             	shr    %cl,%rdx
   1d575:	48 89 d1             	mov    %rdx,%rcx
   1d578:	48 d1 e9             	shr    $1,%rcx
   1d57b:	48 63 d9             	movslq %ecx,%rbx
   1d57e:	44 89 d1             	mov    %r10d,%ecx
   1d581:	48 d3 e3             	shl    %cl,%rbx
   1d584:	45 85 c0             	test   %r8d,%r8d
   1d587:	0f 84 46 03 00 00    	je     1d8d3 <<hyperinterval::ieee::Format>::power+0x393>
   1d58d:	44 88 4c 24 03       	mov    %r9b,0x3(%rsp)
   1d592:	48 89 7c 24 48       	mov    %rdi,0x48(%rsp)
   1d597:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1d59d:	44 89 d1             	mov    %r10d,%ecx
   1d5a0:	49 d3 e1             	shl    %cl,%r9
   1d5a3:	48 8d 4e ff          	lea    -0x1(%rsi),%rcx
   1d5a7:	49 21 cb             	and    %rcx,%r11
   1d5aa:	48 89 d9             	mov    %rbx,%rcx
   1d5ad:	4d 8d 79 ff          	lea    -0x1(%r9),%r15
   1d5b1:	8d 2c 42             	lea    (%rdx,%rax,2),%ebp
   1d5b4:	83 e5 fe             	and    $0xfffffffe,%ebp
   1d5b7:	ba 02 00 00 00       	mov    $0x2,%edx
   1d5bc:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1d5c1:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1d5c6:	44 89 44 24 68       	mov    %r8d,0x68(%rsp)
   1d5cb:	44 89 c3             	mov    %r8d,%ebx
   1d5ce:	4c 89 5c 24 58       	mov    %r11,0x58(%rsp)
   1d5d3:	4c 89 5c 24 60       	mov    %r11,0x60(%rsp)
   1d5d8:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
   1d5dd:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   1d5e2:	4c 89 8c 24 80 00 00 	mov    %r9,0x80(%rsp)
   1d5e9:	00 
   1d5ea:	4c 89 54 24 78       	mov    %r10,0x78(%rsp)
   1d5ef:	4c 89 7c 24 70       	mov    %r15,0x70(%rsp)
   1d5f4:	89 6c 24 6c          	mov    %ebp,0x6c(%rsp)
   1d5f8:	f6 c3 01             	test   $0x1,%bl
   1d5fb:	0f 84 a4 01 00 00    	je     1d7a5 <<hyperinterval::ieee::Format>::power+0x265>
   1d601:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   1d608:	0f 1f 84 00 00 00 00 
   1d60f:	00 
   1d610:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
   1d614:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1d619:	48 89 d0             	mov    %rdx,%rax
   1d61c:	4c 21 f0             	and    %r14,%rax
   1d61f:	44 89 d1             	mov    %r10d,%ecx
   1d622:	48 d3 e8             	shr    %cl,%rax
   1d625:	48 89 d1             	mov    %rdx,%rcx
   1d628:	4c 21 f9             	and    %r15,%rcx
   1d62b:	48 85 c0             	test   %rax,%rax
   1d62e:	41 89 c3             	mov    %eax,%r11d
   1d631:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1d637:	45 0f 44 d8          	cmove  %r8d,%r11d
   1d63b:	49 0f 45 c1          	cmovne %r9,%rax
   1d63f:	48 09 c8             	or     %rcx,%rax
   1d642:	48 85 f2             	test   %rsi,%rdx
   1d645:	0f 95 44 24 08       	setne  0x8(%rsp)
   1d64a:	4c 8b 6c 24 60       	mov    0x60(%rsp),%r13
   1d64f:	4c 89 eb             	mov    %r13,%rbx
   1d652:	4c 21 f3             	and    %r14,%rbx
   1d655:	44 89 d1             	mov    %r10d,%ecx
   1d658:	48 d3 eb             	shr    %cl,%rbx
   1d65b:	4c 89 e9             	mov    %r13,%rcx
   1d65e:	4c 21 f9             	and    %r15,%rcx
   1d661:	48 85 db             	test   %rbx,%rbx
   1d664:	41 89 d8             	mov    %ebx,%r8d
   1d667:	ba 01 00 00 00       	mov    $0x1,%edx
   1d66c:	44 0f 44 c2          	cmove  %edx,%r8d
   1d670:	49 0f 45 d9          	cmovne %r9,%rbx
   1d674:	48 09 cb             	or     %rcx,%rbx
   1d677:	49 85 f5             	test   %rsi,%r13
   1d67a:	0f 95 c1             	setne  %cl
   1d67d:	32 4c 24 08          	xor    0x8(%rsp),%cl
   1d681:	48 f7 e3             	mul    %rbx
   1d684:	41 29 e8             	sub    %ebp,%r8d
   1d687:	45 01 d8             	add    %r11d,%r8d
   1d68a:	88 4c 24 24          	mov    %cl,0x24(%rsp)
   1d68e:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1d693:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1d698:	44 89 44 24 20       	mov    %r8d,0x20(%rsp)
   1d69d:	4c 89 f2             	mov    %r14,%rdx
   1d6a0:	4c 89 e1             	mov    %r12,%rcx
   1d6a3:	49 89 fd             	mov    %rdi,%r13
   1d6a6:	4d 89 cc             	mov    %r9,%r12
   1d6a9:	48 89 f3             	mov    %rsi,%rbx
   1d6ac:	4c 89 f5             	mov    %r14,%rbp
   1d6af:	4d 89 d6             	mov    %r10,%r14
   1d6b2:	e8 79 06 00 00       	call   1dd30 <<hyperinterval::ieee::Format>::rounded>
   1d6b7:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   1d6bc:	0f 85 00 02 00 00    	jne    1d8c2 <<hyperinterval::ieee::Format>::power+0x382>
   1d6c2:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
   1d6c7:	48 89 d0             	mov    %rdx,%rax
   1d6ca:	48 21 e8             	and    %rbp,%rax
   1d6cd:	44 89 f1             	mov    %r14d,%ecx
   1d6d0:	48 d3 e8             	shr    %cl,%rax
   1d6d3:	48 89 d1             	mov    %rdx,%rcx
   1d6d6:	4c 21 f9             	and    %r15,%rcx
   1d6d9:	48 85 c0             	test   %rax,%rax
   1d6dc:	89 c6                	mov    %eax,%esi
   1d6de:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1d6e4:	41 0f 44 f2          	cmove  %r10d,%esi
   1d6e8:	49 0f 45 c4          	cmovne %r12,%rax
   1d6ec:	48 09 c8             	or     %rcx,%rax
   1d6ef:	48 85 da             	test   %rbx,%rdx
   1d6f2:	0f 95 c2             	setne  %dl
   1d6f5:	4c 8b 4c 24 58       	mov    0x58(%rsp),%r9
   1d6fa:	4c 89 cf             	mov    %r9,%rdi
   1d6fd:	48 21 ef             	and    %rbp,%rdi
   1d700:	44 89 f1             	mov    %r14d,%ecx
   1d703:	48 d3 ef             	shr    %cl,%rdi
   1d706:	4c 89 c9             	mov    %r9,%rcx
   1d709:	4c 21 f9             	and    %r15,%rcx
   1d70c:	48 85 ff             	test   %rdi,%rdi
   1d70f:	41 89 f8             	mov    %edi,%r8d
   1d712:	45 0f 44 c2          	cmove  %r10d,%r8d
   1d716:	49 0f 45 fc          	cmovne %r12,%rdi
   1d71a:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
   1d71f:	4c 89 54 24 08       	mov    %r10,0x8(%rsp)
   1d724:	48 09 cf             	or     %rcx,%rdi
   1d727:	49 85 d9             	test   %rbx,%r9
   1d72a:	0f 95 c1             	setne  %cl
   1d72d:	30 d1                	xor    %dl,%cl
   1d72f:	48 f7 e7             	mul    %rdi
   1d732:	4d 89 ef             	mov    %r13,%r15
   1d735:	44 8b 6c 24 6c       	mov    0x6c(%rsp),%r13d
   1d73a:	45 29 e8             	sub    %r13d,%r8d
   1d73d:	41 01 f0             	add    %esi,%r8d
   1d740:	88 4c 24 24          	mov    %cl,0x24(%rsp)
   1d744:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1d749:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1d74e:	44 89 44 24 20       	mov    %r8d,0x20(%rsp)
   1d753:	4c 89 ff             	mov    %r15,%rdi
   1d756:	48 89 de             	mov    %rbx,%rsi
   1d759:	48 89 ea             	mov    %rbp,%rdx
   1d75c:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1d761:	4c 89 e1             	mov    %r12,%rcx
   1d764:	e8 c7 05 00 00       	call   1dd30 <<hyperinterval::ieee::Format>::rounded>
   1d769:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   1d76e:	0f 84 4e 01 00 00    	je     1d8c2 <<hyperinterval::ieee::Format>::power+0x382>
   1d774:	48 89 de             	mov    %rbx,%rsi
   1d777:	49 89 ee             	mov    %rbp,%r14
   1d77a:	44 89 ed             	mov    %r13d,%ebp
   1d77d:	4c 89 ff             	mov    %r15,%rdi
   1d780:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1d785:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1d78a:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1d791:	00 
   1d792:	4c 8b 54 24 78       	mov    0x78(%rsp),%r10
   1d797:	4c 8b 7c 24 70       	mov    0x70(%rsp),%r15
   1d79c:	ba 02 00 00 00       	mov    $0x2,%edx
   1d7a1:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
   1d7a5:	d1 eb                	shr    $1,%ebx
   1d7a7:	0f 84 6c 01 00 00    	je     1d919 <<hyperinterval::ieee::Format>::power+0x3d9>
   1d7ad:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
   1d7b1:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   1d7b6:	4c 89 c0             	mov    %r8,%rax
   1d7b9:	4c 21 f0             	and    %r14,%rax
   1d7bc:	44 89 d1             	mov    %r10d,%ecx
   1d7bf:	48 d3 e8             	shr    %cl,%rax
   1d7c2:	4d 21 f8             	and    %r15,%r8
   1d7c5:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
   1d7c8:	48 85 c0             	test   %rax,%rax
   1d7cb:	49 0f 45 c1          	cmovne %r9,%rax
   1d7cf:	0f 44 ca             	cmove  %edx,%ecx
   1d7d2:	4c 09 c0             	or     %r8,%rax
   1d7d5:	48 f7 e0             	mul    %rax
   1d7d8:	29 e9                	sub    %ebp,%ecx
   1d7da:	c6 44 24 24 00       	movb   $0x0,0x24(%rsp)
   1d7df:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1d7e4:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1d7e9:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   1d7ed:	4c 89 f2             	mov    %r14,%rdx
   1d7f0:	4c 89 e1             	mov    %r12,%rcx
   1d7f3:	41 89 ed             	mov    %ebp,%r13d
   1d7f6:	4d 89 cc             	mov    %r9,%r12
   1d7f9:	4c 89 fb             	mov    %r15,%rbx
   1d7fc:	49 89 f7             	mov    %rsi,%r15
   1d7ff:	4c 89 f5             	mov    %r14,%rbp
   1d802:	4d 89 d6             	mov    %r10,%r14
   1d805:	e8 26 05 00 00       	call   1dd30 <<hyperinterval::ieee::Format>::rounded>
   1d80a:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   1d80f:	0f 85 ad 00 00 00    	jne    1d8c2 <<hyperinterval::ieee::Format>::power+0x382>
   1d815:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
   1d81a:	48 89 d0             	mov    %rdx,%rax
   1d81d:	48 21 e8             	and    %rbp,%rax
   1d820:	44 89 f1             	mov    %r14d,%ecx
   1d823:	48 d3 e8             	shr    %cl,%rax
   1d826:	48 21 da             	and    %rbx,%rdx
   1d829:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
   1d82c:	48 85 c0             	test   %rax,%rax
   1d82f:	49 0f 45 c4          	cmovne %r12,%rax
   1d833:	be 02 00 00 00       	mov    $0x2,%esi
   1d838:	0f 44 ce             	cmove  %esi,%ecx
   1d83b:	48 09 d0             	or     %rdx,%rax
   1d83e:	48 f7 e0             	mul    %rax
   1d841:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
   1d846:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   1d84b:	44 29 e9             	sub    %r13d,%ecx
   1d84e:	c6 44 24 24 00       	movb   $0x0,0x24(%rsp)
   1d853:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1d858:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1d85d:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   1d861:	48 8d 5c 24 30       	lea    0x30(%rsp),%rbx
   1d866:	48 89 df             	mov    %rbx,%rdi
   1d869:	4c 89 fe             	mov    %r15,%rsi
   1d86c:	48 89 ea             	mov    %rbp,%rdx
   1d86f:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1d874:	4c 89 e1             	mov    %r12,%rcx
   1d877:	e8 b4 04 00 00       	call   1dd30 <<hyperinterval::ieee::Format>::rounded>
   1d87c:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   1d881:	ba 02 00 00 00       	mov    $0x2,%edx
   1d886:	74 3a                	je     1d8c2 <<hyperinterval::ieee::Format>::power+0x382>
   1d888:	4c 89 fe             	mov    %r15,%rsi
   1d88b:	49 89 ee             	mov    %rbp,%r14
   1d88e:	44 89 ed             	mov    %r13d,%ebp
   1d891:	48 89 df             	mov    %rbx,%rdi
   1d894:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1d899:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1d89e:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1d8a5:	00 
   1d8a6:	4c 8b 54 24 78       	mov    0x78(%rsp),%r10
   1d8ab:	4c 8b 7c 24 70       	mov    0x70(%rsp),%r15
   1d8b0:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
   1d8b4:	f6 c3 01             	test   $0x1,%bl
   1d8b7:	0f 85 53 fd ff ff    	jne    1d610 <<hyperinterval::ieee::Format>::power+0xd0>
   1d8bd:	e9 e3 fe ff ff       	jmp    1d7a5 <<hyperinterval::ieee::Format>::power+0x265>
   1d8c2:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   1d8c7:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
   1d8cc:	88 47 01             	mov    %al,0x1(%rdi)
   1d8cf:	b0 01                	mov    $0x1,%al
   1d8d1:	eb 2f                	jmp    1d902 <<hyperinterval::ieee::Format>::power+0x3c2>
   1d8d3:	48 89 d9             	mov    %rbx,%rcx
   1d8d6:	45 20 c1             	and    %r8b,%r9b
   1d8d9:	74 1d                	je     1d8f8 <<hyperinterval::ieee::Format>::power+0x3b8>
   1d8db:	48 89 d8             	mov    %rbx,%rax
   1d8de:	48 31 f0             	xor    %rsi,%rax
   1d8e1:	48 85 db             	test   %rbx,%rbx
   1d8e4:	48 0f 44 c3          	cmove  %rbx,%rax
   1d8e8:	48 31 ce             	xor    %rcx,%rsi
   1d8eb:	48 85 c9             	test   %rcx,%rcx
   1d8ee:	48 0f 44 f1          	cmove  %rcx,%rsi
   1d8f2:	48 89 c1             	mov    %rax,%rcx
   1d8f5:	48 89 f3             	mov    %rsi,%rbx
   1d8f8:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1d8fc:	48 89 5f 10          	mov    %rbx,0x10(%rdi)
   1d900:	31 c0                	xor    %eax,%eax
   1d902:	88 07                	mov    %al,(%rdi)
   1d904:	48 89 f8             	mov    %rdi,%rax
   1d907:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
   1d90e:	5b                   	pop    %rbx
   1d90f:	41 5c                	pop    %r12
   1d911:	41 5d                	pop    %r13
   1d913:	41 5e                	pop    %r14
   1d915:	41 5f                	pop    %r15
   1d917:	5d                   	pop    %rbp
   1d918:	c3                   	ret
   1d919:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
   1d91e:	44 8b 44 24 68       	mov    0x68(%rsp),%r8d
   1d923:	44 0f b6 4c 24 03    	movzbl 0x3(%rsp),%r9d
   1d929:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
   1d92e:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1d933:	45 20 c1             	and    %r8b,%r9b
   1d936:	75 a3                	jne    1d8db <<hyperinterval::ieee::Format>::power+0x39b>
   1d938:	eb be                	jmp    1d8f8 <<hyperinterval::ieee::Format>::power+0x3b8>
   1d93a:	cc                   	int3
   1d93b:	cc                   	int3
   1d93c:	cc                   	int3
   1d93d:	cc                   	int3
   1d93e:	cc                   	int3
   1d93f:	cc                   	int3

<hyperinterval::ieee::Format>::affine:
   1d940:	55                   	push   %rbp
   1d941:	41 57                	push   %r15
   1d943:	41 56                	push   %r14
   1d945:	41 55                	push   %r13
   1d947:	41 54                	push   %r12
   1d949:	53                   	push   %rbx
   1d94a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   1d951:	48 89 c8             	mov    %rcx,%rax
   1d954:	49 89 d6             	mov    %rdx,%r14
   1d957:	b9 40 00 00 00       	mov    $0x40,%ecx
   1d95c:	f3 48 0f bc ca       	tzcnt  %rdx,%rcx
   1d961:	48 89 c2             	mov    %rax,%rdx
   1d964:	4c 21 f2             	and    %r14,%rdx
   1d967:	48 d3 ea             	shr    %cl,%rdx
   1d96a:	41 bb 01 00 00 00    	mov    $0x1,%r11d
   1d970:	49 d3 e3             	shl    %cl,%r11
   1d973:	4d 8d 7b ff          	lea    -0x1(%r11),%r15
   1d977:	4c 89 fb             	mov    %r15,%rbx
   1d97a:	48 21 c3             	and    %rax,%rbx
   1d97d:	48 85 d2             	test   %rdx,%rdx
   1d980:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1d986:	89 d5                	mov    %edx,%ebp
   1d988:	41 0f 44 ea          	cmove  %r10d,%ebp
   1d98c:	48 89 3c 24          	mov    %rdi,(%rsp)
   1d990:	49 0f 45 d3          	cmovne %r11,%rdx
   1d994:	4d 89 f5             	mov    %r14,%r13
   1d997:	49 d3 ed             	shr    %cl,%r13
   1d99a:	48 09 da             	or     %rbx,%rdx
   1d99d:	49 d1 ed             	shr    $1,%r13
   1d9a0:	41 01 cd             	add    %ecx,%r13d
   1d9a3:	44 29 ed             	sub    %r13d,%ebp
   1d9a6:	48 85 f0             	test   %rsi,%rax
   1d9a9:	0f 95 c3             	setne  %bl
   1d9ac:	4c 89 c0             	mov    %r8,%rax
   1d9af:	4c 21 f0             	and    %r14,%rax
   1d9b2:	48 d3 e8             	shr    %cl,%rax
   1d9b5:	4d 89 fc             	mov    %r15,%r12
   1d9b8:	4d 21 c4             	and    %r8,%r12
   1d9bb:	48 85 c0             	test   %rax,%rax
   1d9be:	89 c7                	mov    %eax,%edi
   1d9c0:	41 0f 44 fa          	cmove  %r10d,%edi
   1d9c4:	49 0f 45 c3          	cmovne %r11,%rax
   1d9c8:	4c 09 e0             	or     %r12,%rax
   1d9cb:	44 29 ef             	sub    %r13d,%edi
   1d9ce:	49 85 f0             	test   %rsi,%r8
   1d9d1:	41 0f 95 c0          	setne  %r8b
   1d9d5:	01 ef                	add    %ebp,%edi
   1d9d7:	4c 89 f5             	mov    %r14,%rbp
   1d9da:	4d 89 cc             	mov    %r9,%r12
   1d9dd:	4d 21 f4             	and    %r14,%r12
   1d9e0:	49 d3 ec             	shr    %cl,%r12
   1d9e3:	41 30 d8             	xor    %bl,%r8b
   1d9e6:	48 f7 e2             	mul    %rdx
   1d9e9:	4d 21 cf             	and    %r9,%r15
   1d9ec:	4d 85 e4             	test   %r12,%r12
   1d9ef:	45 0f 45 d4          	cmovne %r12d,%r10d
   1d9f3:	4d 0f 45 e3          	cmovne %r11,%r12
   1d9f7:	4d 09 fc             	or     %r15,%r12
   1d9fa:	45 29 ea             	sub    %r13d,%r10d
   1d9fd:	49 85 f1             	test   %rsi,%r9
   1da00:	0f 95 84 24 84 00 00 	setne  0x84(%rsp)
   1da07:	00 
   1da08:	0f 95 c3             	setne  %bl
   1da0b:	48 89 c1             	mov    %rax,%rcx
   1da0e:	48 09 d1             	or     %rdx,%rcx
   1da11:	44 88 44 24 64       	mov    %r8b,0x64(%rsp)
   1da16:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   1da1b:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1da20:	89 7c 24 60          	mov    %edi,0x60(%rsp)
   1da24:	4c 89 64 24 70       	mov    %r12,0x70(%rsp)
   1da29:	48 c7 44 24 78 00 00 	movq   $0x0,0x78(%rsp)
   1da30:	00 00 
   1da32:	44 89 94 24 80 00 00 	mov    %r10d,0x80(%rsp)
   1da39:	00 
   1da3a:	74 79                	je     1dab5 <<hyperinterval::ieee::Format>::affine+0x175>
   1da3c:	4d 85 e4             	test   %r12,%r12
   1da3f:	74 7b                	je     1dabc <<hyperinterval::ieee::Format>::affine+0x17c>
   1da41:	48 89 6c 24 30       	mov    %rbp,0x30(%rsp)
   1da46:	48 0f bd ca          	bsr    %rdx,%rcx
   1da4a:	83 f1 3f             	xor    $0x3f,%ecx
   1da4d:	4c 0f bd d8          	bsr    %rax,%r11
   1da51:	41 83 f3 3f          	xor    $0x3f,%r11d
   1da55:	41 83 cb 40          	or     $0x40,%r11d
   1da59:	48 85 d2             	test   %rdx,%rdx
   1da5c:	44 0f 45 d9          	cmovne %ecx,%r11d
   1da60:	41 83 f3 7f          	xor    $0x7f,%r11d
   1da64:	41 01 fb             	add    %edi,%r11d
   1da67:	4d 0f bd fc          	bsr    %r12,%r15
   1da6b:	41 83 f7 3f          	xor    $0x3f,%r15d
   1da6f:	41 83 cf 40          	or     $0x40,%r15d
   1da73:	41 83 f7 7f          	xor    $0x7f,%r15d
   1da77:	45 01 d7             	add    %r10d,%r15d
   1da7a:	45 39 df             	cmp    %r11d,%r15d
   1da7d:	45 0f 4e fb          	cmovle %r11d,%r15d
   1da81:	41 83 c7 82          	add    $0xffffff82,%r15d
   1da85:	44 29 ff             	sub    %r15d,%edi
   1da88:	78 4b                	js     1dad5 <<hyperinterval::ieee::Format>::affine+0x195>
   1da8a:	89 f9                	mov    %edi,%ecx
   1da8c:	48 0f a5 c2          	shld   %cl,%rax,%rdx
   1da90:	48 d3 e0             	shl    %cl,%rax
   1da93:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   1da9a:	00 00 
   1da9c:	40 f6 c7 40          	test   $0x40,%dil
   1daa0:	48 0f 45 d0          	cmovne %rax,%rdx
   1daa4:	bd 00 00 00 00       	mov    $0x0,%ebp
   1daa9:	48 0f 44 e8          	cmove  %rax,%rbp
   1daad:	49 89 d3             	mov    %rdx,%r11
   1dab0:	e9 9b 00 00 00       	jmp    1db50 <<hyperinterval::ieee::Format>::affine+0x210>
   1dab5:	48 8d 4c 24 70       	lea    0x70(%rsp),%rcx
   1daba:	eb 05                	jmp    1dac1 <<hyperinterval::ieee::Format>::affine+0x181>
   1dabc:	48 8d 4c 24 50       	lea    0x50(%rsp),%rcx
   1dac1:	4c 8b 34 24          	mov    (%rsp),%r14
   1dac5:	4c 89 f7             	mov    %r14,%rdi
   1dac8:	48 89 ea             	mov    %rbp,%rdx
   1dacb:	e8 60 02 00 00       	call   1dd30 <<hyperinterval::ieee::Format>::rounded>
   1dad0:	e9 43 02 00 00       	jmp    1dd18 <<hyperinterval::ieee::Format>::affine+0x3d8>
   1dad5:	f7 df                	neg    %edi
   1dad7:	bd 00 00 00 00       	mov    $0x0,%ebp
   1dadc:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   1dae2:	83 ff 7f             	cmp    $0x7f,%edi
   1dae5:	7f 5b                	jg     1db42 <<hyperinterval::ieee::Format>::affine+0x202>
   1dae7:	48 89 c5             	mov    %rax,%rbp
   1daea:	89 f9                	mov    %edi,%ecx
   1daec:	48 0f ad d5          	shrd   %cl,%rdx,%rbp
   1daf0:	49 89 d3             	mov    %rdx,%r11
   1daf3:	49 d3 eb             	shr    %cl,%r11
   1daf6:	41 89 dd             	mov    %ebx,%r13d
   1daf9:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
   1db00:	48 d3 e3             	shl    %cl,%rbx
   1db03:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
   1db0a:	40 f6 c7 40          	test   $0x40,%dil
   1db0e:	49 0f 45 eb          	cmovne %r11,%rbp
   1db12:	41 be 00 00 00 00    	mov    $0x0,%r14d
   1db18:	4d 0f 45 de          	cmovne %r14,%r11
   1db1c:	48 0f 45 cb          	cmovne %rbx,%rcx
   1db20:	bf 00 00 00 00       	mov    $0x0,%edi
   1db25:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
   1db2a:	49 0f 45 de          	cmovne %r14,%rbx
   1db2e:	48 f7 d3             	not    %rbx
   1db31:	48 f7 d1             	not    %rcx
   1db34:	48 21 d1             	and    %rdx,%rcx
   1db37:	48 21 c3             	and    %rax,%rbx
   1db3a:	48 09 cb             	or     %rcx,%rbx
   1db3d:	44 89 eb             	mov    %r13d,%ebx
   1db40:	74 0e                	je     1db50 <<hyperinterval::ieee::Format>::affine+0x210>
   1db42:	41 0f b6 c0          	movzbl %r8b,%eax
   1db46:	f7 d8                	neg    %eax
   1db48:	83 c8 01             	or     $0x1,%eax
   1db4b:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
   1db50:	45 29 fa             	sub    %r15d,%r10d
   1db53:	78 20                	js     1db75 <<hyperinterval::ieee::Format>::affine+0x235>
   1db55:	31 d2                	xor    %edx,%edx
   1db57:	44 89 d1             	mov    %r10d,%ecx
   1db5a:	4c 0f a5 e2          	shld   %cl,%r12,%rdx
   1db5e:	49 d3 e4             	shl    %cl,%r12
   1db61:	45 31 ed             	xor    %r13d,%r13d
   1db64:	41 f6 c2 40          	test   $0x40,%r10b
   1db68:	49 0f 45 d4          	cmovne %r12,%rdx
   1db6c:	4d 0f 45 e5          	cmovne %r13,%r12
   1db70:	4c 89 e0             	mov    %r12,%rax
   1db73:	eb 58                	jmp    1dbcd <<hyperinterval::ieee::Format>::affine+0x28d>
   1db75:	41 f7 da             	neg    %r10d
   1db78:	45 31 ed             	xor    %r13d,%r13d
   1db7b:	b8 00 00 00 00       	mov    $0x0,%eax
   1db80:	41 83 fa 7f          	cmp    $0x7f,%r10d
   1db84:	7f 2d                	jg     1dbb3 <<hyperinterval::ieee::Format>::affine+0x273>
   1db86:	4c 89 e0             	mov    %r12,%rax
   1db89:	44 89 d1             	mov    %r10d,%ecx
   1db8c:	4c 0f ad e8          	shrd   %cl,%r13,%rax
   1db90:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
   1db97:	48 d3 e7             	shl    %cl,%rdi
   1db9a:	41 f6 c2 40          	test   $0x40,%r10b
   1db9e:	49 0f 45 c5          	cmovne %r13,%rax
   1dba2:	49 0f 45 fd          	cmovne %r13,%rdi
   1dba6:	48 f7 d7             	not    %rdi
   1dba9:	ba 00 00 00 00       	mov    $0x0,%edx
   1dbae:	4c 85 e7             	test   %r12,%rdi
   1dbb1:	74 1a                	je     1dbcd <<hyperinterval::ieee::Format>::affine+0x28d>
   1dbb3:	4c 89 ea             	mov    %r13,%rdx
   1dbb6:	4c 89 c9             	mov    %r9,%rcx
   1dbb9:	48 21 f1             	and    %rsi,%rcx
   1dbbc:	31 ff                	xor    %edi,%edi
   1dbbe:	48 f7 d9             	neg    %rcx
   1dbc1:	40 0f 93 c7          	setae  %dil
   1dbc5:	44 8d 2c 7d ff ff ff 	lea    -0x1(,%rdi,2),%r13d
   1dbcc:	ff 
   1dbcd:	49 85 f1             	test   %rsi,%r9
   1dbd0:	0f 95 c1             	setne  %cl
   1dbd3:	41 38 c8             	cmp    %cl,%r8b
   1dbd6:	74 16                	je     1dbee <<hyperinterval::ieee::Format>::affine+0x2ae>
   1dbd8:	48 39 c5             	cmp    %rax,%rbp
   1dbdb:	4c 89 d9             	mov    %r11,%rcx
   1dbde:	48 19 d1             	sbb    %rdx,%rcx
   1dbe1:	73 13                	jae    1dbf6 <<hyperinterval::ieee::Format>::affine+0x2b6>
   1dbe3:	48 29 e8             	sub    %rbp,%rax
   1dbe6:	4c 19 da             	sbb    %r11,%rdx
   1dbe9:	41 89 d8             	mov    %ebx,%r8d
   1dbec:	eb 14                	jmp    1dc02 <<hyperinterval::ieee::Format>::affine+0x2c2>
   1dbee:	48 01 e8             	add    %rbp,%rax
   1dbf1:	4c 11 da             	adc    %r11,%rdx
   1dbf4:	eb 0c                	jmp    1dc02 <<hyperinterval::ieee::Format>::affine+0x2c2>
   1dbf6:	48 29 c5             	sub    %rax,%rbp
   1dbf9:	49 19 d3             	sbb    %rdx,%r11
   1dbfc:	48 89 e8             	mov    %rbp,%rax
   1dbff:	4c 89 da             	mov    %r11,%rdx
   1dc02:	44 88 44 24 24       	mov    %r8b,0x24(%rsp)
   1dc07:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1dc0c:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1dc11:	44 89 7c 24 20       	mov    %r15d,0x20(%rsp)
   1dc16:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1dc1b:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1dc20:	49 89 f4             	mov    %rsi,%r12
   1dc23:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
   1dc28:	48 89 da             	mov    %rbx,%rdx
   1dc2b:	e8 00 01 00 00       	call   1dd30 <<hyperinterval::ieee::Format>::rounded>
   1dc30:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   1dc35:	75 16                	jne    1dc4d <<hyperinterval::ieee::Format>::affine+0x30d>
   1dc37:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
   1dc3c:	4c 8b 34 24          	mov    (%rsp),%r14
   1dc40:	41 88 46 01          	mov    %al,0x1(%r14)
   1dc44:	41 c6 06 01          	movb   $0x1,(%r14)
   1dc48:	e9 cb 00 00 00       	jmp    1dd18 <<hyperinterval::ieee::Format>::affine+0x3d8>
   1dc4d:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
   1dc52:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
   1dc57:	49 39 c7             	cmp    %rax,%r15
   1dc5a:	0f 85 a8 00 00 00    	jne    1dd08 <<hyperinterval::ieee::Format>::affine+0x3c8>
   1dc60:	44 03 6c 24 08       	add    0x8(%rsp),%r13d
   1dc65:	41 83 fd 01          	cmp    $0x1,%r13d
   1dc69:	74 60                	je     1dccb <<hyperinterval::ieee::Format>::affine+0x38b>
   1dc6b:	41 83 fd ff          	cmp    $0xffffffff,%r13d
   1dc6f:	0f 85 93 00 00 00    	jne    1dd08 <<hyperinterval::ieee::Format>::affine+0x3c8>
   1dc75:	4c 89 f8             	mov    %r15,%rax
   1dc78:	4c 89 e6             	mov    %r12,%rsi
   1dc7b:	4c 31 e0             	xor    %r12,%rax
   1dc7e:	4d 85 ff             	test   %r15,%r15
   1dc81:	49 0f 44 c7          	cmove  %r15,%rax
   1dc85:	48 89 c1             	mov    %rax,%rcx
   1dc88:	4c 21 e1             	and    %r12,%rcx
   1dc8b:	31 d2                	xor    %edx,%edx
   1dc8d:	48 f7 d9             	neg    %rcx
   1dc90:	0f 93 c2             	setae  %dl
   1dc93:	48 8d 0c 50          	lea    (%rax,%rdx,2),%rcx
   1dc97:	48 ff c9             	dec    %rcx
   1dc9a:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1dc9f:	48 89 da             	mov    %rbx,%rdx
   1dca2:	e8 89 e9 ff ff       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1dca7:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1dcac:	75 49                	jne    1dcf7 <<hyperinterval::ieee::Format>::affine+0x3b7>
   1dcae:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1dcb3:	49 31 c4             	xor    %rax,%r12
   1dcb6:	48 85 c0             	test   %rax,%rax
   1dcb9:	4c 0f 44 e0          	cmove  %rax,%r12
   1dcbd:	4c 8b 34 24          	mov    (%rsp),%r14
   1dcc1:	4d 89 66 08          	mov    %r12,0x8(%r14)
   1dcc5:	4d 89 7e 10          	mov    %r15,0x10(%r14)
   1dcc9:	eb 49                	jmp    1dd14 <<hyperinterval::ieee::Format>::affine+0x3d4>
   1dccb:	4c 89 e6             	mov    %r12,%rsi
   1dcce:	4c 89 f8             	mov    %r15,%rax
   1dcd1:	4c 21 e0             	and    %r12,%rax
   1dcd4:	31 c9                	xor    %ecx,%ecx
   1dcd6:	48 f7 d8             	neg    %rax
   1dcd9:	0f 93 c1             	setae  %cl
   1dcdc:	49 8d 0c 4f          	lea    (%r15,%rcx,2),%rcx
   1dce0:	48 ff c9             	dec    %rcx
   1dce3:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1dce8:	48 89 da             	mov    %rbx,%rdx
   1dceb:	e8 40 e9 ff ff       	call   1c630 <<hyperinterval::ieee::Format>::finite>
   1dcf0:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1dcf5:	74 0c                	je     1dd03 <<hyperinterval::ieee::Format>::affine+0x3c3>
   1dcf7:	4c 8b 34 24          	mov    (%rsp),%r14
   1dcfb:	66 41 c7 06 01 03    	movw   $0x301,(%r14)
   1dd01:	eb 15                	jmp    1dd18 <<hyperinterval::ieee::Format>::affine+0x3d8>
   1dd03:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1dd08:	4c 8b 34 24          	mov    (%rsp),%r14
   1dd0c:	4d 89 7e 08          	mov    %r15,0x8(%r14)
   1dd10:	49 89 46 10          	mov    %rax,0x10(%r14)
   1dd14:	41 c6 06 00          	movb   $0x0,(%r14)
   1dd18:	4c 89 f0             	mov    %r14,%rax
   1dd1b:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1dd22:	5b                   	pop    %rbx
   1dd23:	41 5c                	pop    %r12
   1dd25:	41 5d                	pop    %r13
   1dd27:	41 5e                	pop    %r14
   1dd29:	41 5f                	pop    %r15
   1dd2b:	5d                   	pop    %rbp
   1dd2c:	c3                   	ret
   1dd2d:	cc                   	int3
   1dd2e:	cc                   	int3
   1dd2f:	cc                   	int3

<hyperinterval::ieee::Format>::rounded:
   1dd30:	48 89 c8             	mov    %rcx,%rax
   1dd33:	4c 8b 11             	mov    (%rcx),%r10
   1dd36:	4c 8b 59 08          	mov    0x8(%rcx),%r11
   1dd3a:	4c 89 d1             	mov    %r10,%rcx
   1dd3d:	4c 09 d9             	or     %r11,%rcx
   1dd40:	0f 84 f6 00 00 00    	je     1de3c <<hyperinterval::ieee::Format>::rounded+0x10c>
   1dd46:	55                   	push   %rbp
   1dd47:	41 57                	push   %r15
   1dd49:	41 56                	push   %r14
   1dd4b:	41 55                	push   %r13
   1dd4d:	41 54                	push   %r12
   1dd4f:	53                   	push   %rbx
   1dd50:	8b 68 10             	mov    0x10(%rax),%ebp
   1dd53:	49 0f bd cb          	bsr    %r11,%rcx
   1dd57:	83 f1 3f             	xor    $0x3f,%ecx
   1dd5a:	4d 0f bd f2          	bsr    %r10,%r14
   1dd5e:	41 83 f6 3f          	xor    $0x3f,%r14d
   1dd62:	41 83 ce 40          	or     $0x40,%r14d
   1dd66:	4d 85 db             	test   %r11,%r11
   1dd69:	44 0f 45 f1          	cmovne %ecx,%r14d
   1dd6d:	bb 40 00 00 00       	mov    $0x40,%ebx
   1dd72:	f3 48 0f bc da       	tzcnt  %rdx,%rbx
   1dd77:	41 89 d8             	mov    %ebx,%r8d
   1dd7a:	41 83 e0 3f          	and    $0x3f,%r8d
   1dd7e:	44 89 c1             	mov    %r8d,%ecx
   1dd81:	48 d3 ea             	shr    %cl,%rdx
   1dd84:	41 83 f6 7f          	xor    $0x7f,%r14d
   1dd88:	41 01 ee             	add    %ebp,%r14d
   1dd8b:	48 d1 ea             	shr    $1,%rdx
   1dd8e:	41 39 d6             	cmp    %edx,%r14d
   1dd91:	0f 8f 9a 01 00 00    	jg     1df31 <<hyperinterval::ieee::Format>::rounded+0x201>
   1dd97:	44 8d 2c 13          	lea    (%rbx,%rdx,1),%r13d
   1dd9b:	b9 01 00 00 00       	mov    $0x1,%ecx
   1dda0:	44 29 e9             	sub    %r13d,%ecx
   1dda3:	41 29 de             	sub    %ebx,%r14d
   1dda6:	41 39 ce             	cmp    %ecx,%r14d
   1dda9:	44 0f 4e f1          	cmovle %ecx,%r14d
   1ddad:	44 89 f1             	mov    %r14d,%ecx
   1ddb0:	29 e9                	sub    %ebp,%ecx
   1ddb2:	83 f9 7f             	cmp    $0x7f,%ecx
   1ddb5:	0f 8e 8c 00 00 00    	jle    1de47 <<hyperinterval::ieee::Format>::rounded+0x117>
   1ddbb:	41 b4 01             	mov    $0x1,%r12b
   1ddbe:	45 31 ff             	xor    %r15d,%r15d
   1ddc1:	45 31 db             	xor    %r11d,%r11d
   1ddc4:	45 31 d2             	xor    %r10d,%r10d
   1ddc7:	45 0f b6 e4          	movzbl %r12b,%r12d
   1ddcb:	4d 01 fc             	add    %r15,%r12
   1ddce:	49 83 d3 00          	adc    $0x0,%r11
   1ddd2:	4c 89 e1             	mov    %r12,%rcx
   1ddd5:	4c 09 d9             	or     %r11,%rcx
   1ddd8:	0f 84 d2 00 00 00    	je     1deb0 <<hyperinterval::ieee::Format>::rounded+0x180>
   1ddde:	49 0f bd cb          	bsr    %r11,%rcx
   1dde2:	83 f1 3f             	xor    $0x3f,%ecx
   1dde5:	4d 0f bd fc          	bsr    %r12,%r15
   1dde9:	41 83 f7 3f          	xor    $0x3f,%r15d
   1dded:	41 83 cf 40          	or     $0x40,%r15d
   1ddf1:	4d 85 db             	test   %r11,%r11
   1ddf4:	44 0f 45 f9          	cmovne %ecx,%r15d
   1ddf8:	41 83 f7 7f          	xor    $0x7f,%r15d
   1ddfc:	43 8d 2c 37          	lea    (%r15,%r14,1),%ebp
   1de00:	39 d5                	cmp    %edx,%ebp
   1de02:	0f 8f 29 01 00 00    	jg     1df31 <<hyperinterval::ieee::Format>::rounded+0x201>
   1de08:	b9 01 00 00 00       	mov    $0x1,%ecx
   1de0d:	29 d1                	sub    %edx,%ecx
   1de0f:	39 cd                	cmp    %ecx,%ebp
   1de11:	0f 8d 59 01 00 00    	jge    1df70 <<hyperinterval::ieee::Format>::rounded+0x240>
   1de17:	45 01 f5             	add    %r14d,%r13d
   1de1a:	41 fe cd             	dec    %r13b
   1de1d:	44 89 e9             	mov    %r13d,%ecx
   1de20:	49 d3 e4             	shl    %cl,%r12
   1de23:	31 d2                	xor    %edx,%edx
   1de25:	41 f6 c5 40          	test   $0x40,%r13b
   1de29:	49 0f 44 d4          	cmove  %r12,%rdx
   1de2d:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1de31:	0f 84 81 00 00 00    	je     1deb8 <<hyperinterval::ieee::Format>::rounded+0x188>
   1de37:	e9 99 00 00 00       	jmp    1ded5 <<hyperinterval::ieee::Format>::rounded+0x1a5>
   1de3c:	c6 07 00             	movb   $0x0,(%rdi)
   1de3f:	0f 57 c0             	xorps  %xmm0,%xmm0
   1de42:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1de46:	c3                   	ret
   1de47:	85 c9                	test   %ecx,%ecx
   1de49:	4c 89 6c 24 f0       	mov    %r13,-0x10(%rsp)
   1de4e:	0f 8e 8e 00 00 00    	jle    1dee2 <<hyperinterval::ieee::Format>::rounded+0x1b2>
   1de54:	4d 89 d7             	mov    %r10,%r15
   1de57:	4d 0f ad df          	shrd   %cl,%r11,%r15
   1de5b:	4d 89 dd             	mov    %r11,%r13
   1de5e:	49 d3 ed             	shr    %cl,%r13
   1de61:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
   1de68:	49 d3 e4             	shl    %cl,%r12
   1de6b:	48 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%rbp
   1de72:	45 31 c9             	xor    %r9d,%r9d
   1de75:	f6 c1 40             	test   $0x40,%cl
   1de78:	4d 0f 45 fd          	cmovne %r13,%r15
   1de7c:	4d 0f 45 e9          	cmovne %r9,%r13
   1de80:	49 0f 45 ec          	cmovne %r12,%rbp
   1de84:	4d 0f 45 e1          	cmovne %r9,%r12
   1de88:	49 f7 d4             	not    %r12
   1de8b:	48 f7 d5             	not    %rbp
   1de8e:	4c 21 dd             	and    %r11,%rbp
   1de91:	4d 21 d4             	and    %r10,%r12
   1de94:	49 09 ec             	or     %rbp,%r12
   1de97:	41 0f 95 c4          	setne  %r12b
   1de9b:	4d 89 eb             	mov    %r13,%r11
   1de9e:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1dea3:	4c 89 f9             	mov    %r15,%rcx
   1dea6:	4c 09 d9             	or     %r11,%rcx
   1dea9:	75 60                	jne    1df0b <<hyperinterval::ieee::Format>::rounded+0x1db>
   1deab:	e9 0e ff ff ff       	jmp    1ddbe <<hyperinterval::ieee::Format>::rounded+0x8e>
   1deb0:	31 d2                	xor    %edx,%edx
   1deb2:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1deb6:	75 1d                	jne    1ded5 <<hyperinterval::ieee::Format>::rounded+0x1a5>
   1deb8:	48 89 d0             	mov    %rdx,%rax
   1debb:	48 31 f0             	xor    %rsi,%rax
   1debe:	48 85 d2             	test   %rdx,%rdx
   1dec1:	48 0f 44 c2          	cmove  %rdx,%rax
   1dec5:	4c 31 d6             	xor    %r10,%rsi
   1dec8:	4d 85 d2             	test   %r10,%r10
   1decb:	49 0f 44 f2          	cmove  %r10,%rsi
   1decf:	49 89 c2             	mov    %rax,%r10
   1ded2:	48 89 f2             	mov    %rsi,%rdx
   1ded5:	4c 89 57 08          	mov    %r10,0x8(%rdi)
   1ded9:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   1dedd:	c6 07 00             	movb   $0x0,(%rdi)
   1dee0:	eb 54                	jmp    1df36 <<hyperinterval::ieee::Format>::rounded+0x206>
   1dee2:	f6 d9                	neg    %cl
   1dee4:	4d 0f a5 d3          	shld   %cl,%r10,%r11
   1dee8:	49 d3 e2             	shl    %cl,%r10
   1deeb:	45 31 e4             	xor    %r12d,%r12d
   1deee:	f6 c1 40             	test   $0x40,%cl
   1def1:	4d 0f 45 da          	cmovne %r10,%r11
   1def5:	41 bf 00 00 00 00    	mov    $0x0,%r15d
   1defb:	4d 0f 44 fa          	cmove  %r10,%r15
   1deff:	4c 89 f9             	mov    %r15,%rcx
   1df02:	4c 09 d9             	or     %r11,%rcx
   1df05:	0f 84 b3 fe ff ff    	je     1ddbe <<hyperinterval::ieee::Format>::rounded+0x8e>
   1df0b:	49 0f bd cb          	bsr    %r11,%rcx
   1df0f:	83 f1 3f             	xor    $0x3f,%ecx
   1df12:	4d 0f bd ef          	bsr    %r15,%r13
   1df16:	41 83 f5 3f          	xor    $0x3f,%r13d
   1df1a:	41 83 cd 40          	or     $0x40,%r13d
   1df1e:	4d 85 db             	test   %r11,%r11
   1df21:	44 0f 45 e9          	cmovne %ecx,%r13d
   1df25:	41 83 f5 7f          	xor    $0x7f,%r13d
   1df29:	43 8d 2c 2e          	lea    (%r14,%r13,1),%ebp
   1df2d:	39 d5                	cmp    %edx,%ebp
   1df2f:	7e 10                	jle    1df41 <<hyperinterval::ieee::Format>::rounded+0x211>
   1df31:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   1df36:	5b                   	pop    %rbx
   1df37:	41 5c                	pop    %r12
   1df39:	41 5d                	pop    %r13
   1df3b:	41 5e                	pop    %r14
   1df3d:	41 5f                	pop    %r15
   1df3f:	5d                   	pop    %rbp
   1df40:	c3                   	ret
   1df41:	b9 01 00 00 00       	mov    $0x1,%ecx
   1df46:	29 d1                	sub    %edx,%ecx
   1df48:	39 cd                	cmp    %ecx,%ebp
   1df4a:	0f 8d 81 00 00 00    	jge    1dfd1 <<hyperinterval::ieee::Format>::rounded+0x2a1>
   1df50:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1df55:	43 8d 0c 2e          	lea    (%r14,%r13,1),%ecx
   1df59:	fe c9                	dec    %cl
   1df5b:	4d 89 f9             	mov    %r15,%r9
   1df5e:	49 d3 e1             	shl    %cl,%r9
   1df61:	45 31 d2             	xor    %r10d,%r10d
   1df64:	f6 c1 40             	test   $0x40,%cl
   1df67:	4d 0f 44 d1          	cmove  %r9,%r10
   1df6b:	e9 57 fe ff ff       	jmp    1ddc7 <<hyperinterval::ieee::Format>::rounded+0x97>
   1df70:	89 d9                	mov    %ebx,%ecx
   1df72:	44 29 f9             	sub    %r15d,%ecx
   1df75:	41 89 c9             	mov    %ecx,%r9d
   1df78:	41 f7 d9             	neg    %r9d
   1df7b:	4d 89 e6             	mov    %r12,%r14
   1df7e:	49 d3 e6             	shl    %cl,%r14
   1df81:	45 31 ed             	xor    %r13d,%r13d
   1df84:	f6 c1 40             	test   $0x40,%cl
   1df87:	4d 0f 44 ee          	cmove  %r14,%r13
   1df8b:	44 89 c9             	mov    %r9d,%ecx
   1df8e:	4d 0f ad dc          	shrd   %cl,%r11,%r12
   1df92:	49 d3 eb             	shr    %cl,%r11
   1df95:	41 f6 c1 40          	test   $0x40,%r9b
   1df99:	4d 0f 44 dc          	cmove  %r12,%r11
   1df9d:	44 39 fb             	cmp    %r15d,%ebx
   1dfa0:	4d 0f 43 dd          	cmovae %r13,%r11
   1dfa4:	01 d5                	add    %edx,%ebp
   1dfa6:	4c 63 cd             	movslq %ebp,%r9
   1dfa9:	44 89 c1             	mov    %r8d,%ecx
   1dfac:	49 d3 e1             	shl    %cl,%r9
   1dfaf:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
   1dfb6:	48 d3 e2             	shl    %cl,%rdx
   1dfb9:	48 f7 d2             	not    %rdx
   1dfbc:	4c 21 da             	and    %r11,%rdx
   1dfbf:	4c 09 ca             	or     %r9,%rdx
   1dfc2:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1dfc6:	0f 85 09 ff ff ff    	jne    1ded5 <<hyperinterval::ieee::Format>::rounded+0x1a5>
   1dfcc:	e9 e7 fe ff ff       	jmp    1deb8 <<hyperinterval::ieee::Format>::rounded+0x188>
   1dfd1:	89 d9                	mov    %ebx,%ecx
   1dfd3:	44 29 e9             	sub    %r13d,%ecx
   1dfd6:	4d 89 f9             	mov    %r15,%r9
   1dfd9:	49 d3 e1             	shl    %cl,%r9
   1dfdc:	41 89 ca             	mov    %ecx,%r10d
   1dfdf:	41 f7 da             	neg    %r10d
   1dfe2:	48 c7 44 24 e8 00 00 	movq   $0x0,-0x18(%rsp)
   1dfe9:	00 00 
   1dfeb:	f6 c1 40             	test   $0x40,%cl
   1dfee:	48 8b 4c 24 e8       	mov    -0x18(%rsp),%rcx
   1dff3:	49 0f 44 c9          	cmove  %r9,%rcx
   1dff7:	48 89 4c 24 e8       	mov    %rcx,-0x18(%rsp)
   1dffc:	4d 89 f9             	mov    %r15,%r9
   1dfff:	44 89 d1             	mov    %r10d,%ecx
   1e002:	4d 0f ad d9          	shrd   %cl,%r11,%r9
   1e006:	4c 89 4c 24 f8       	mov    %r9,-0x8(%rsp)
   1e00b:	4d 89 d9             	mov    %r11,%r9
   1e00e:	49 d3 e9             	shr    %cl,%r9
   1e011:	41 f6 c2 40          	test   $0x40,%r10b
   1e015:	4c 0f 44 4c 24 f8    	cmove  -0x8(%rsp),%r9
   1e01b:	44 39 eb             	cmp    %r13d,%ebx
   1e01e:	4c 0f 43 4c 24 e8    	cmovae -0x18(%rsp),%r9
   1e024:	01 d5                	add    %edx,%ebp
   1e026:	4c 63 ed             	movslq %ebp,%r13
   1e029:	44 89 c1             	mov    %r8d,%ecx
   1e02c:	49 d3 e5             	shl    %cl,%r13
   1e02f:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
   1e036:	49 d3 e2             	shl    %cl,%r10
   1e039:	49 f7 d2             	not    %r10
   1e03c:	4d 21 ca             	and    %r9,%r10
   1e03f:	4d 09 ea             	or     %r13,%r10
   1e042:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1e047:	e9 7b fd ff ff       	jmp    1ddc7 <<hyperinterval::ieee::Format>::rounded+0x97>
   1e04c:	cc                   	int3
   1e04d:	cc                   	int3
   1e04e:	cc                   	int3
   1e04f:	cc                   	int3

<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull:
   1e050:	89 f8                	mov    %edi,%eax
   1e052:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1e057:	41 89 c0             	mov    %eax,%r8d
   1e05a:	41 09 f8             	or     %edi,%r8d
   1e05d:	41 89 c1             	mov    %eax,%r9d
   1e060:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1e067:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1e06d:	45 29 ca             	sub    %r9d,%r10d
   1e070:	85 c0                	test   %eax,%eax
   1e072:	4d 0f 49 d0          	cmovns %r8,%r10
   1e076:	41 89 d0             	mov    %edx,%r8d
   1e079:	41 09 f8             	or     %edi,%r8d
   1e07c:	41 89 d1             	mov    %edx,%r9d
   1e07f:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1e086:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1e08c:	45 29 cb             	sub    %r9d,%r11d
   1e08f:	85 d2                	test   %edx,%edx
   1e091:	4d 0f 49 d8          	cmovns %r8,%r11
   1e095:	45 39 da             	cmp    %r11d,%r10d
   1e098:	0f 47 c2             	cmova  %edx,%eax
   1e09b:	89 f2                	mov    %esi,%edx
   1e09d:	09 fe                	or     %edi,%esi
   1e09f:	41 89 d0             	mov    %edx,%r8d
   1e0a2:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1e0a9:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1e0af:	45 29 c1             	sub    %r8d,%r9d
   1e0b2:	85 d2                	test   %edx,%edx
   1e0b4:	4c 0f 49 ce          	cmovns %rsi,%r9
   1e0b8:	89 ce                	mov    %ecx,%esi
   1e0ba:	09 fe                	or     %edi,%esi
   1e0bc:	41 89 c8             	mov    %ecx,%r8d
   1e0bf:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1e0c6:	44 29 c7             	sub    %r8d,%edi
   1e0c9:	85 c9                	test   %ecx,%ecx
   1e0cb:	48 0f 49 fe          	cmovns %rsi,%rdi
   1e0cf:	41 39 f9             	cmp    %edi,%r9d
   1e0d2:	0f 42 d1             	cmovb  %ecx,%edx
   1e0d5:	c3                   	ret
   1e0d6:	cc                   	int3
   1e0d7:	cc                   	int3
   1e0d8:	cc                   	int3
   1e0d9:	cc                   	int3
   1e0da:	cc                   	int3
   1e0db:	cc                   	int3
   1e0dc:	cc                   	int3
   1e0dd:	cc                   	int3
   1e0de:	cc                   	int3
   1e0df:	cc                   	int3

<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::signs:
   1e0e0:	89 f9                	mov    %edi,%ecx
   1e0e2:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1e0e7:	4c 8d 04 01          	lea    (%rcx,%rax,1),%r8
   1e0eb:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1e0f1:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1e0f7:	49 29 c9             	sub    %rcx,%r9
   1e0fa:	85 ff                	test   %edi,%edi
   1e0fc:	4d 0f 49 c8          	cmovns %r8,%r9
   1e100:	89 d7                	mov    %edx,%edi
   1e102:	4c 8d 04 07          	lea    (%rdi,%rax,1),%r8
   1e106:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1e10c:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   1e111:	48 29 f9             	sub    %rdi,%rcx
   1e114:	85 d2                	test   %edx,%edx
   1e116:	49 0f 49 c8          	cmovns %r8,%rcx
   1e11a:	89 f7                	mov    %esi,%edi
   1e11c:	48 8d 14 07          	lea    (%rdi,%rax,1),%rdx
   1e120:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1e126:	48 29 f8             	sub    %rdi,%rax
   1e129:	45 31 c0             	xor    %r8d,%r8d
   1e12c:	49 39 c9             	cmp    %rcx,%r9
   1e12f:	40 0f 92 c7          	setb   %dil
   1e133:	77 1e                	ja     1e153 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::signs+0x73>
   1e135:	85 f6                	test   %esi,%esi
   1e137:	49 89 d1             	mov    %rdx,%r9
   1e13a:	4c 0f 48 c8          	cmovs  %rax,%r9
   1e13e:	44 8d 57 02          	lea    0x2(%rdi),%r10d
   1e142:	4c 39 c9             	cmp    %r9,%rcx
   1e145:	45 0f b6 ca          	movzbl %r10b,%r9d
   1e149:	41 88 f8             	mov    %dil,%r8b
   1e14c:	45 0f 46 c1          	cmovbe %r9d,%r8d
   1e150:	44 89 c7             	mov    %r8d,%edi
   1e153:	85 f6                	test   %esi,%esi
   1e155:	48 0f 48 d0          	cmovs  %rax,%rdx
   1e159:	8d 47 04             	lea    0x4(%rdi),%eax
   1e15c:	39 ca                	cmp    %ecx,%edx
   1e15e:	40 0f b6 cf          	movzbl %dil,%ecx
   1e162:	0f b6 c0             	movzbl %al,%eax
   1e165:	0f 46 c1             	cmovbe %ecx,%eax
   1e168:	c3                   	ret
   1e169:	cc                   	int3
   1e16a:	cc                   	int3
   1e16b:	cc                   	int3
   1e16c:	cc                   	int3
   1e16d:	cc                   	int3
   1e16e:	cc                   	int3
   1e16f:	cc                   	int3

<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull:
   1e170:	53                   	push   %rbx
   1e171:	49 89 d0             	mov    %rdx,%r8
   1e174:	48 89 f2             	mov    %rsi,%rdx
   1e177:	48 89 f8             	mov    %rdi,%rax
   1e17a:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1e181:	00 00 80 
   1e184:	4c 8d 0c 37          	lea    (%rdi,%rsi,1),%r9
   1e188:	48 8d 7e ff          	lea    -0x1(%rsi),%rdi
   1e18c:	49 89 c2             	mov    %rax,%r10
   1e18f:	49 21 fa             	and    %rdi,%r10
   1e192:	49 89 f3             	mov    %rsi,%r11
   1e195:	4d 29 d3             	sub    %r10,%r11
   1e198:	48 85 c0             	test   %rax,%rax
   1e19b:	4d 0f 49 d9          	cmovns %r9,%r11
   1e19f:	4d 8d 0c 30          	lea    (%r8,%rsi,1),%r9
   1e1a3:	4d 89 c2             	mov    %r8,%r10
   1e1a6:	49 21 fa             	and    %rdi,%r10
   1e1a9:	48 89 f3             	mov    %rsi,%rbx
   1e1ac:	4c 29 d3             	sub    %r10,%rbx
   1e1af:	4d 85 c0             	test   %r8,%r8
   1e1b2:	49 0f 49 d9          	cmovns %r9,%rbx
   1e1b6:	49 39 db             	cmp    %rbx,%r11
   1e1b9:	49 0f 47 c0          	cmova  %r8,%rax
   1e1bd:	4c 8d 04 32          	lea    (%rdx,%rsi,1),%r8
   1e1c1:	49 89 d1             	mov    %rdx,%r9
   1e1c4:	49 21 f9             	and    %rdi,%r9
   1e1c7:	49 89 f2             	mov    %rsi,%r10
   1e1ca:	4d 29 ca             	sub    %r9,%r10
   1e1cd:	48 85 d2             	test   %rdx,%rdx
   1e1d0:	4d 0f 49 d0          	cmovns %r8,%r10
   1e1d4:	4c 8d 04 31          	lea    (%rcx,%rsi,1),%r8
   1e1d8:	48 21 cf             	and    %rcx,%rdi
   1e1db:	48 29 fe             	sub    %rdi,%rsi
   1e1de:	48 85 c9             	test   %rcx,%rcx
   1e1e1:	49 0f 49 f0          	cmovns %r8,%rsi
   1e1e5:	49 39 f2             	cmp    %rsi,%r10
   1e1e8:	48 0f 42 d1          	cmovb  %rcx,%rdx
   1e1ec:	5b                   	pop    %rbx
   1e1ed:	c3                   	ret
   1e1ee:	cc                   	int3
   1e1ef:	cc                   	int3

<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::signs:
   1e1f0:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1e1f7:	00 00 80 
   1e1fa:	48 8d 0c 07          	lea    (%rdi,%rax,1),%rcx
   1e1fe:	4c 8d 40 ff          	lea    -0x1(%rax),%r8
   1e202:	49 89 f9             	mov    %rdi,%r9
   1e205:	4d 21 c1             	and    %r8,%r9
   1e208:	49 89 c2             	mov    %rax,%r10
   1e20b:	4d 29 ca             	sub    %r9,%r10
   1e20e:	48 85 ff             	test   %rdi,%rdi
   1e211:	4c 0f 49 d1          	cmovns %rcx,%r10
   1e215:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1e219:	49 89 d1             	mov    %rdx,%r9
   1e21c:	4d 21 c1             	and    %r8,%r9
   1e21f:	48 89 c1             	mov    %rax,%rcx
   1e222:	4c 29 c9             	sub    %r9,%rcx
   1e225:	48 85 d2             	test   %rdx,%rdx
   1e228:	48 0f 49 cf          	cmovns %rdi,%rcx
   1e22c:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1e230:	49 21 f0             	and    %rsi,%r8
   1e233:	4c 29 c0             	sub    %r8,%rax
   1e236:	45 31 c0             	xor    %r8d,%r8d
   1e239:	49 39 ca             	cmp    %rcx,%r10
   1e23c:	40 0f 92 c7          	setb   %dil
   1e240:	77 1f                	ja     1e261 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::signs+0x71>
   1e242:	48 85 f6             	test   %rsi,%rsi
   1e245:	49 89 d1             	mov    %rdx,%r9
   1e248:	4c 0f 48 c8          	cmovs  %rax,%r9
   1e24c:	44 8d 57 02          	lea    0x2(%rdi),%r10d
   1e250:	4c 39 c9             	cmp    %r9,%rcx
   1e253:	45 0f b6 ca          	movzbl %r10b,%r9d
   1e257:	41 88 f8             	mov    %dil,%r8b
   1e25a:	45 0f 46 c1          	cmovbe %r9d,%r8d
   1e25e:	44 89 c7             	mov    %r8d,%edi
   1e261:	48 85 f6             	test   %rsi,%rsi
   1e264:	48 0f 48 d0          	cmovs  %rax,%rdx
   1e268:	8d 47 04             	lea    0x4(%rdi),%eax
   1e26b:	48 39 ca             	cmp    %rcx,%rdx
   1e26e:	40 0f b6 cf          	movzbl %dil,%ecx
   1e272:	0f b6 c0             	movzbl %al,%eax
   1e275:	0f 46 c1             	cmovbe %ecx,%eax
   1e278:	c3                   	ret
   1e279:	cc                   	int3
   1e27a:	cc                   	int3
   1e27b:	cc                   	int3
   1e27c:	cc                   	int3
   1e27d:	cc                   	int3
   1e27e:	cc                   	int3
   1e27f:	cc                   	int3

__udivti3:
   5a200:	49 89 d0             	mov    %rdx,%r8
   5a203:	48 85 c9             	test   %rcx,%rcx
   5a206:	74 76                	je     5a27e <__udivti3+0x7e>
   5a208:	53                   	push   %rbx
   5a209:	4c 0f bd c9          	bsr    %rcx,%r9
   5a20d:	44 89 ca             	mov    %r9d,%edx
   5a210:	83 f2 3f             	xor    $0x3f,%edx
   5a213:	b0 40                	mov    $0x40,%al
   5a215:	28 d0                	sub    %dl,%al
   5a217:	4c 89 c2             	mov    %r8,%rdx
   5a21a:	49 89 cb             	mov    %rcx,%r11
   5a21d:	89 c1                	mov    %eax,%ecx
   5a21f:	4c 0f ad da          	shrd   %cl,%r11,%rdx
   5a223:	4d 89 da             	mov    %r11,%r10
   5a226:	49 d3 ea             	shr    %cl,%r10
   5a229:	a8 40                	test   $0x40,%al
   5a22b:	4c 0f 44 d2          	cmove  %rdx,%r10
   5a22f:	48 89 f8             	mov    %rdi,%rax
   5a232:	48 0f ac f0 01       	shrd   $0x1,%rsi,%rax
   5a237:	48 89 f2             	mov    %rsi,%rdx
   5a23a:	48 d1 ea             	shr    $1,%rdx
   5a23d:	49 f7 f2             	div    %r10
   5a240:	49 89 c2             	mov    %rax,%r10
   5a243:	44 89 c9             	mov    %r9d,%ecx
   5a246:	49 d3 ea             	shr    %cl,%r10
   5a249:	31 c9                	xor    %ecx,%ecx
   5a24b:	49 83 ea 01          	sub    $0x1,%r10
   5a24f:	4c 0f 42 d1          	cmovb  %rcx,%r10
   5a253:	4c 89 db             	mov    %r11,%rbx
   5a256:	4c 89 c0             	mov    %r8,%rax
   5a259:	49 f7 e2             	mul    %r10
   5a25c:	49 89 c1             	mov    %rax,%r9
   5a25f:	4c 89 d0             	mov    %r10,%rax
   5a262:	49 0f af da          	imul   %r10,%rbx
   5a266:	48 01 da             	add    %rbx,%rdx
   5a269:	4c 29 cf             	sub    %r9,%rdi
   5a26c:	48 19 d6             	sbb    %rdx,%rsi
   5a26f:	4c 39 c7             	cmp    %r8,%rdi
   5a272:	4c 19 de             	sbb    %r11,%rsi
   5a275:	48 83 d8 ff          	sbb    $0xffffffffffffffff,%rax
   5a279:	5b                   	pop    %rbx
   5a27a:	48 89 ca             	mov    %rcx,%rdx
   5a27d:	c3                   	ret
   5a27e:	4c 39 c6             	cmp    %r8,%rsi
   5a281:	73 0f                	jae    5a292 <__udivti3+0x92>
   5a283:	48 89 f8             	mov    %rdi,%rax
   5a286:	48 89 f2             	mov    %rsi,%rdx
   5a289:	49 f7 f0             	div    %r8
   5a28c:	31 c9                	xor    %ecx,%ecx
   5a28e:	48 89 ca             	mov    %rcx,%rdx
   5a291:	c3                   	ret
   5a292:	48 89 f0             	mov    %rsi,%rax
   5a295:	4c 09 c0             	or     %r8,%rax
   5a298:	48 c1 e8 20          	shr    $0x20,%rax
   5a29c:	74 15                	je     5a2b3 <__udivti3+0xb3>
   5a29e:	48 89 f0             	mov    %rsi,%rax
   5a2a1:	31 d2                	xor    %edx,%edx
   5a2a3:	49 f7 f0             	div    %r8
   5a2a6:	48 89 c1             	mov    %rax,%rcx
   5a2a9:	48 89 f8             	mov    %rdi,%rax
   5a2ac:	49 f7 f0             	div    %r8
   5a2af:	48 89 ca             	mov    %rcx,%rdx
   5a2b2:	c3                   	ret
   5a2b3:	89 f0                	mov    %esi,%eax
   5a2b5:	31 d2                	xor    %edx,%edx
   5a2b7:	41 f7 f0             	div    %r8d
   5a2ba:	89 c1                	mov    %eax,%ecx
   5a2bc:	48 89 f8             	mov    %rdi,%rax
   5a2bf:	49 f7 f0             	div    %r8
   5a2c2:	48 89 ca             	mov    %rcx,%rdx
   5a2c5:	c3                   	ret

Disassembly of section .init:
