<hyperinterval::float::F64Enclosure>::abs:
   17b50:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   17b54:	75 33                	jne    17b89 <<hyperinterval::float::F64Enclosure>::abs+0x39>
   17b56:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   17b5a:	48 ba ff ff ff ff ff 	movabs $0x7fffffffffffffff,%rdx
   17b61:	ff ff 7f 
   17b64:	48 85 c9             	test   %rcx,%rcx
   17b67:	41 0f 99 c0          	setns  %r8b
   17b6b:	48 89 c8             	mov    %rcx,%rax
   17b6e:	48 21 d0             	and    %rdx,%rax
   17b71:	41 0f 94 c1          	sete   %r9b
   17b75:	45 08 c1             	or     %r8b,%r9b
   17b78:	74 17                	je     17b91 <<hyperinterval::float::F64Enclosure>::abs+0x41>
   17b7a:	48 8b 46 10          	mov    0x10(%rsi),%rax
   17b7e:	48 89 47 10          	mov    %rax,0x10(%rdi)
   17b82:	0f 10 06             	movups (%rsi),%xmm0
   17b85:	0f 11 07             	movups %xmm0,(%rdi)
   17b88:	c3                   	ret
   17b89:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
   17b90:	c3                   	ret
   17b91:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   17b95:	48 85 f6             	test   %rsi,%rsi
   17b98:	41 0f 98 c1          	sets   %r9b
   17b9c:	49 89 f0             	mov    %rsi,%r8
   17b9f:	49 21 d0             	and    %rdx,%r8
   17ba2:	41 0f 95 c2          	setne  %r10b
   17ba6:	45 84 d1             	test   %r10b,%r9b
   17ba9:	74 10                	je     17bbb <<hyperinterval::float::F64Enclosure>::abs+0x6b>
   17bab:	48 c7 07 01 00 00 00 	movq   $0x1,(%rdi)
   17bb2:	4c 89 47 08          	mov    %r8,0x8(%rdi)
   17bb6:	48 89 47 10          	mov    %rax,0x10(%rdi)
   17bba:	c3                   	ret
   17bbb:	49 f7 d8             	neg    %r8
   17bbe:	48 85 f6             	test   %rsi,%rsi
   17bc1:	4c 8d 4c 16 01       	lea    0x1(%rsi,%rdx,1),%r9
   17bc6:	4a 8d 54 02 01       	lea    0x1(%rdx,%r8,1),%rdx
   17bcb:	49 0f 49 d1          	cmovns %r9,%rdx
   17bcf:	48 39 d1             	cmp    %rdx,%rcx
   17bd2:	48 0f 46 c6          	cmovbe %rsi,%rax
   17bd6:	48 c7 07 01 00 00 00 	movq   $0x1,(%rdi)
   17bdd:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
   17be4:	00 
   17be5:	48 89 47 10          	mov    %rax,0x10(%rdi)
   17be9:	c3                   	ret
   17bea:	cc                   	int3
   17beb:	cc                   	int3
   17bec:	cc                   	int3
   17bed:	cc                   	int3
   17bee:	cc                   	int3
   17bef:	cc                   	int3

hyperinterval_strict_chain32:
   17c20:	53                   	push   %rbx
   17c21:	48 83 ec 60          	sub    $0x60,%rsp
   17c25:	48 89 fb             	mov    %rdi,%rbx
   17c28:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   17c2d:	ff 15 05 5a 04 00    	call   *0x45a05(%rip)        # 5d638 <_DYNAMIC+0x2b0>
   17c33:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   17c37:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   17c3c:	83 f9 02             	cmp    $0x2,%ecx
   17c3f:	0f 84 f4 00 00 00    	je     17d39 <hyperinterval_strict_chain32+0x119>
   17c45:	8b 54 24 11          	mov    0x11(%rsp),%edx
   17c49:	8b 74 24 14          	mov    0x14(%rsp),%esi
   17c4d:	89 74 24 5c          	mov    %esi,0x5c(%rsp)
   17c51:	89 54 24 59          	mov    %edx,0x59(%rsp)
   17c55:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
   17c59:	88 44 24 58          	mov    %al,0x58(%rsp)
   17c5d:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   17c62:	48 8d 74 24 54       	lea    0x54(%rsp),%rsi
   17c67:	f3 0f 10 05 b9 df fe 	movss  -0x12047(%rip),%xmm0        # 5c28 <__abi_tag+0x592c>
   17c6e:	ff 
   17c6f:	f3 0f 10 0d a9 df fe 	movss  -0x12057(%rip),%xmm1        # 5c20 <__abi_tag+0x5924>
   17c76:	ff 
   17c77:	ff 15 c3 59 04 00    	call   *0x459c3(%rip)        # 5d640 <_DYNAMIC+0x2b8>
   17c7d:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
   17c81:	0f b6 44 24 1c       	movzbl 0x1c(%rsp),%eax
   17c86:	83 f9 02             	cmp    $0x2,%ecx
   17c89:	0f 84 aa 00 00 00    	je     17d39 <hyperinterval_strict_chain32+0x119>
   17c8f:	8b 54 24 1d          	mov    0x1d(%rsp),%edx
   17c93:	8b 74 24 20          	mov    0x20(%rsp),%esi
   17c97:	89 74 24 50          	mov    %esi,0x50(%rsp)
   17c9b:	89 54 24 4d          	mov    %edx,0x4d(%rsp)
   17c9f:	89 4c 24 48          	mov    %ecx,0x48(%rsp)
   17ca3:	88 44 24 4c          	mov    %al,0x4c(%rsp)
   17ca7:	48 8d 7c 24 3c       	lea    0x3c(%rsp),%rdi
   17cac:	48 8d 74 24 48       	lea    0x48(%rsp),%rsi
   17cb1:	ff 15 91 59 04 00    	call   *0x45991(%rip)        # 5d648 <_DYNAMIC+0x2c0>
   17cb7:	8b 4c 24 3c          	mov    0x3c(%rsp),%ecx
   17cbb:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   17cc0:	83 f9 02             	cmp    $0x2,%ecx
   17cc3:	74 74                	je     17d39 <hyperinterval_strict_chain32+0x119>
   17cc5:	8b 54 24 41          	mov    0x41(%rsp),%edx
   17cc9:	8b 74 24 44          	mov    0x44(%rsp),%esi
   17ccd:	89 74 24 38          	mov    %esi,0x38(%rsp)
   17cd1:	89 54 24 35          	mov    %edx,0x35(%rsp)
   17cd5:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   17cd9:	88 44 24 34          	mov    %al,0x34(%rsp)
   17cdd:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   17ce2:	f3 0f 10 05 0a df fe 	movss  -0x120f6(%rip),%xmm0        # 5bf4 <__abi_tag+0x58f8>
   17ce9:	ff 
   17cea:	ff 15 60 59 04 00    	call   *0x45960(%rip)        # 5d650 <_DYNAMIC+0x2c8>
   17cf0:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   17cf4:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   17cf9:	83 f9 02             	cmp    $0x2,%ecx
   17cfc:	74 3b                	je     17d39 <hyperinterval_strict_chain32+0x119>
   17cfe:	8b 54 24 11          	mov    0x11(%rsp),%edx
   17d02:	8b 74 24 14          	mov    0x14(%rsp),%esi
   17d06:	89 74 24 20          	mov    %esi,0x20(%rsp)
   17d0a:	89 54 24 1d          	mov    %edx,0x1d(%rsp)
   17d0e:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
   17d12:	88 44 24 1c          	mov    %al,0x1c(%rsp)
   17d16:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
   17d1b:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   17d20:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
   17d25:	ff 15 2d 59 04 00    	call   *0x4592d(%rip)        # 5d658 <_DYNAMIC+0x2d0>
   17d2b:	8b 4c 24 24          	mov    0x24(%rsp),%ecx
   17d2f:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   17d34:	83 f9 02             	cmp    $0x2,%ecx
   17d37:	75 12                	jne    17d4b <hyperinterval_strict_chain32+0x12b>
   17d39:	88 43 04             	mov    %al,0x4(%rbx)
   17d3c:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17d42:	48 89 d8             	mov    %rbx,%rax
   17d45:	48 83 c4 60          	add    $0x60,%rsp
   17d49:	5b                   	pop    %rbx
   17d4a:	c3                   	ret
   17d4b:	8b 54 24 29          	mov    0x29(%rsp),%edx
   17d4f:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
   17d53:	89 74 24 14          	mov    %esi,0x14(%rsp)
   17d57:	89 54 24 11          	mov    %edx,0x11(%rsp)
   17d5b:	89 4c 24 0c          	mov    %ecx,0xc(%rsp)
   17d5f:	88 44 24 10          	mov    %al,0x10(%rsp)
   17d63:	48 8d 74 24 0c       	lea    0xc(%rsp),%rsi
   17d68:	48 89 df             	mov    %rbx,%rdi
   17d6b:	ff 15 ef 58 04 00    	call   *0x458ef(%rip)        # 5d660 <_DYNAMIC+0x2d8>
   17d71:	48 89 d8             	mov    %rbx,%rax
   17d74:	48 83 c4 60          	add    $0x60,%rsp
   17d78:	5b                   	pop    %rbx
   17d79:	c3                   	ret
   17d7a:	cc                   	int3
   17d7b:	cc                   	int3
   17d7c:	cc                   	int3
   17d7d:	cc                   	int3
   17d7e:	cc                   	int3
   17d7f:	cc                   	int3

hyperinterval_strict_chain64:
   17d80:	53                   	push   %rbx
   17d81:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
   17d88:	48 89 fb             	mov    %rdi,%rbx
   17d8b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17d90:	ff 15 d2 58 04 00    	call   *0x458d2(%rip)        # 5d668 <_DYNAMIC+0x2e0>
   17d96:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   17d9b:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   17da0:	48 83 f9 02          	cmp    $0x2,%rcx
   17da4:	0f 84 32 01 00 00    	je     17edc <hyperinterval_strict_chain64+0x15c>
   17daa:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   17daf:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   17db4:	48 89 b4 24 a8 00 00 	mov    %rsi,0xa8(%rsp)
   17dbb:	00 
   17dbc:	48 89 94 24 a1 00 00 	mov    %rdx,0xa1(%rsp)
   17dc3:	00 
   17dc4:	48 89 8c 24 98 00 00 	mov    %rcx,0x98(%rsp)
   17dcb:	00 
   17dcc:	88 84 24 a0 00 00 00 	mov    %al,0xa0(%rsp)
   17dd3:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   17dd8:	48 8d b4 24 98 00 00 	lea    0x98(%rsp),%rsi
   17ddf:	00 
   17de0:	f2 0f 10 05 c8 dd fe 	movsd  -0x12238(%rip),%xmm0        # 5bb0 <__abi_tag+0x58b4>
   17de7:	ff 
   17de8:	f2 0f 10 0d d0 dd fe 	movsd  -0x12230(%rip),%xmm1        # 5bc0 <__abi_tag+0x58c4>
   17def:	ff 
   17df0:	ff 15 7a 58 04 00    	call   *0x4587a(%rip)        # 5d670 <_DYNAMIC+0x2e8>
   17df6:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   17dfb:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   17e00:	48 83 f9 02          	cmp    $0x2,%rcx
   17e04:	0f 84 d2 00 00 00    	je     17edc <hyperinterval_strict_chain64+0x15c>
   17e0a:	48 8b 54 24 29       	mov    0x29(%rsp),%rdx
   17e0f:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   17e14:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
   17e1b:	00 
   17e1c:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
   17e23:	00 
   17e24:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
   17e2b:	00 
   17e2c:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
   17e33:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
   17e38:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   17e3f:	00 
   17e40:	ff 15 32 58 04 00    	call   *0x45832(%rip)        # 5d678 <_DYNAMIC+0x2f0>
   17e46:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
   17e4b:	0f b6 44 24 70       	movzbl 0x70(%rsp),%eax
   17e50:	48 83 f9 02          	cmp    $0x2,%rcx
   17e54:	0f 84 82 00 00 00    	je     17edc <hyperinterval_strict_chain64+0x15c>
   17e5a:	48 8b 54 24 71       	mov    0x71(%rsp),%rdx
   17e5f:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
   17e64:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   17e69:	48 89 54 24 59       	mov    %rdx,0x59(%rsp)
   17e6e:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
   17e73:	88 44 24 58          	mov    %al,0x58(%rsp)
   17e77:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17e7c:	f2 0f 10 05 1c dd fe 	movsd  -0x122e4(%rip),%xmm0        # 5ba0 <__abi_tag+0x58a4>
   17e83:	ff 
   17e84:	ff 15 f6 57 04 00    	call   *0x457f6(%rip)        # 5d680 <_DYNAMIC+0x2f8>
   17e8a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   17e8f:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   17e94:	48 83 f9 02          	cmp    $0x2,%rcx
   17e98:	74 42                	je     17edc <hyperinterval_strict_chain64+0x15c>
   17e9a:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   17e9f:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   17ea4:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   17ea9:	48 89 54 24 29       	mov    %rdx,0x29(%rsp)
   17eae:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   17eb3:	88 44 24 28          	mov    %al,0x28(%rsp)
   17eb7:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   17ebc:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   17ec1:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
   17ec6:	ff 15 bc 57 04 00    	call   *0x457bc(%rip)        # 5d688 <_DYNAMIC+0x300>
   17ecc:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   17ed1:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   17ed6:	48 83 f9 02          	cmp    $0x2,%rcx
   17eda:	75 16                	jne    17ef2 <hyperinterval_strict_chain64+0x172>
   17edc:	88 43 08             	mov    %al,0x8(%rbx)
   17edf:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   17ee6:	48 89 d8             	mov    %rbx,%rax
   17ee9:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   17ef0:	5b                   	pop    %rbx
   17ef1:	c3                   	ret
   17ef2:	48 8b 54 24 41       	mov    0x41(%rsp),%rdx
   17ef7:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
   17efc:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
   17f01:	48 89 54 24 11       	mov    %rdx,0x11(%rsp)
   17f06:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   17f0b:	88 44 24 10          	mov    %al,0x10(%rsp)
   17f0f:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
   17f14:	48 89 df             	mov    %rbx,%rdi
   17f17:	ff 15 73 57 04 00    	call   *0x45773(%rip)        # 5d690 <_DYNAMIC+0x308>
   17f1d:	48 89 d8             	mov    %rbx,%rax
   17f20:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   17f27:	5b                   	pop    %rbx
   17f28:	c3                   	ret
   17f29:	cc                   	int3
   17f2a:	cc                   	int3
   17f2b:	cc                   	int3
   17f2c:	cc                   	int3
   17f2d:	cc                   	int3
   17f2e:	cc                   	int3
   17f2f:	cc                   	int3

hyperinterval_strict_sqrt32:
   17f30:	53                   	push   %rbx
   17f31:	48 83 ec 20          	sub    $0x20,%rsp
   17f35:	48 89 fb             	mov    %rdi,%rbx
   17f38:	48 8d 7c 24 14       	lea    0x14(%rsp),%rdi
   17f3d:	ff 15 f5 56 04 00    	call   *0x456f5(%rip)        # 5d638 <_DYNAMIC+0x2b0>
   17f43:	8b 4c 24 14          	mov    0x14(%rsp),%ecx
   17f47:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17f4c:	83 f9 02             	cmp    $0x2,%ecx
   17f4f:	75 12                	jne    17f63 <hyperinterval_strict_sqrt32+0x33>
   17f51:	88 43 04             	mov    %al,0x4(%rbx)
   17f54:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17f5a:	48 89 d8             	mov    %rbx,%rax
   17f5d:	48 83 c4 20          	add    $0x20,%rsp
   17f61:	5b                   	pop    %rbx
   17f62:	c3                   	ret
   17f63:	8b 54 24 19          	mov    0x19(%rsp),%edx
   17f67:	8b 74 24 1c          	mov    0x1c(%rsp),%esi
   17f6b:	89 74 24 10          	mov    %esi,0x10(%rsp)
   17f6f:	89 54 24 0d          	mov    %edx,0xd(%rsp)
   17f73:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
   17f77:	88 44 24 0c          	mov    %al,0xc(%rsp)
   17f7b:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
   17f80:	48 89 df             	mov    %rbx,%rdi
   17f83:	ff 15 0f 57 04 00    	call   *0x4570f(%rip)        # 5d698 <_DYNAMIC+0x310>
   17f89:	48 89 d8             	mov    %rbx,%rax
   17f8c:	48 83 c4 20          	add    $0x20,%rsp
   17f90:	5b                   	pop    %rbx
   17f91:	c3                   	ret
   17f92:	cc                   	int3
   17f93:	cc                   	int3
   17f94:	cc                   	int3
   17f95:	cc                   	int3
   17f96:	cc                   	int3
   17f97:	cc                   	int3
   17f98:	cc                   	int3
   17f99:	cc                   	int3
   17f9a:	cc                   	int3
   17f9b:	cc                   	int3
   17f9c:	cc                   	int3
   17f9d:	cc                   	int3
   17f9e:	cc                   	int3
   17f9f:	cc                   	int3

hyperinterval_strict_sqrt64:
   17fa0:	53                   	push   %rbx
   17fa1:	48 83 ec 30          	sub    $0x30,%rsp
   17fa5:	48 89 fb             	mov    %rdi,%rbx
   17fa8:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   17fad:	ff 15 b5 56 04 00    	call   *0x456b5(%rip)        # 5d668 <_DYNAMIC+0x2e0>
   17fb3:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   17fb8:	0f b6 44 24 20       	movzbl 0x20(%rsp),%eax
   17fbd:	48 83 f9 02          	cmp    $0x2,%rcx
   17fc1:	75 13                	jne    17fd6 <hyperinterval_strict_sqrt64+0x36>
   17fc3:	88 43 08             	mov    %al,0x8(%rbx)
   17fc6:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   17fcd:	48 89 d8             	mov    %rbx,%rax
   17fd0:	48 83 c4 30          	add    $0x30,%rsp
   17fd4:	5b                   	pop    %rbx
   17fd5:	c3                   	ret
   17fd6:	48 8b 54 24 21       	mov    0x21(%rsp),%rdx
   17fdb:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   17fe0:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
   17fe5:	48 89 54 24 09       	mov    %rdx,0x9(%rsp)
   17fea:	48 89 0c 24          	mov    %rcx,(%rsp)
   17fee:	88 44 24 08          	mov    %al,0x8(%rsp)
   17ff2:	48 89 e6             	mov    %rsp,%rsi
   17ff5:	48 89 df             	mov    %rbx,%rdi
   17ff8:	ff 15 a2 56 04 00    	call   *0x456a2(%rip)        # 5d6a0 <_DYNAMIC+0x318>
   17ffe:	48 89 d8             	mov    %rbx,%rax
   18001:	48 83 c4 30          	add    $0x30,%rsp
   18005:	5b                   	pop    %rbx
   18006:	c3                   	ret
   18007:	cc                   	int3
   18008:	cc                   	int3
   18009:	cc                   	int3
   1800a:	cc                   	int3
   1800b:	cc                   	int3
   1800c:	cc                   	int3
   1800d:	cc                   	int3
   1800e:	cc                   	int3
   1800f:	cc                   	int3

hyperinterval_strict_surface32:
   18010:	55                   	push   %rbp
   18011:	41 57                	push   %r15
   18013:	41 56                	push   %r14
   18015:	41 55                	push   %r13
   18017:	41 54                	push   %r12
   18019:	53                   	push   %rbx
   1801a:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
   18021:	89 f5                	mov    %esi,%ebp
   18023:	48 89 fb             	mov    %rdi,%rbx
   18026:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1802b:	66 0f 7e 44 24 3c    	movd   %xmm0,0x3c(%rsp)
   18031:	66 0f 7e 4c 24 2c    	movd   %xmm1,0x2c(%rsp)
   18037:	ff 15 fb 55 04 00    	call   *0x455fb(%rip)        # 5d638 <_DYNAMIC+0x2b0>
   1803d:	44 8b 6c 24 08       	mov    0x8(%rsp),%r13d
   18042:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   18047:	41 83 fd 02          	cmp    $0x2,%r13d
   1804b:	75 0e                	jne    1805b <hyperinterval_strict_surface32+0x4b>
   1804d:	88 43 04             	mov    %al,0x4(%rbx)
   18050:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18056:	e9 8a 00 00 00       	jmp    180e5 <hyperinterval_strict_surface32+0xd5>
   1805b:	49 89 df             	mov    %rbx,%r15
   1805e:	8b 4c 24 0d          	mov    0xd(%rsp),%ecx
   18062:	8b 54 24 10          	mov    0x10(%rsp),%edx
   18066:	89 54 24 48          	mov    %edx,0x48(%rsp)
   1806a:	89 4c 24 45          	mov    %ecx,0x45(%rsp)
   1806e:	44 89 6c 24 40       	mov    %r13d,0x40(%rsp)
   18073:	88 44 24 44          	mov    %al,0x44(%rsp)
   18077:	66 0f 6e 44 24 3c    	movd   0x3c(%rsp),%xmm0
   1807d:	ff 15 25 56 04 00    	call   *0x45625(%rip)        # 5d6a8 <_DYNAMIC+0x320>
   18083:	48 89 c3             	mov    %rax,%rbx
   18086:	f6 c3 01             	test   $0x1,%bl
   18089:	74 0b                	je     18096 <hyperinterval_strict_surface32+0x86>
   1808b:	4c 89 f8             	mov    %r15,%rax
   1808e:	88 78 04             	mov    %bh,0x4(%rax)
   18091:	4c 89 fb             	mov    %r15,%rbx
   18094:	eb 48                	jmp    180de <hyperinterval_strict_surface32+0xce>
   18096:	66 0f 6e 44 24 2c    	movd   0x2c(%rsp),%xmm0
   1809c:	ff 15 0e 56 04 00    	call   *0x4560e(%rip)        # 5d6b0 <_DYNAMIC+0x328>
   180a2:	a8 01                	test   $0x1,%al
   180a4:	74 08                	je     180ae <hyperinterval_strict_surface32+0x9e>
   180a6:	4c 89 fb             	mov    %r15,%rbx
   180a9:	88 63 04             	mov    %ah,0x4(%rbx)
   180ac:	eb 30                	jmp    180de <hyperinterval_strict_surface32+0xce>
   180ae:	48 c1 eb 20          	shr    $0x20,%rbx
   180b2:	66 0f 6e c3          	movd   %ebx,%xmm0
   180b6:	48 c1 e8 20          	shr    $0x20,%rax
   180ba:	66 0f 6e c8          	movd   %eax,%xmm1
   180be:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   180c3:	ff 15 6f 55 04 00    	call   *0x4556f(%rip)        # 5d638 <_DYNAMIC+0x2b0>
   180c9:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   180cd:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   180d2:	83 f9 02             	cmp    $0x2,%ecx
   180d5:	75 23                	jne    180fa <hyperinterval_strict_surface32+0xea>
   180d7:	4c 89 fb             	mov    %r15,%rbx
   180da:	41 88 47 04          	mov    %al,0x4(%r15)
   180de:	41 c7 07 02 00 00 00 	movl   $0x2,(%r15)
   180e5:	48 89 d8             	mov    %rbx,%rax
   180e8:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
   180ef:	5b                   	pop    %rbx
   180f0:	41 5c                	pop    %r12
   180f2:	41 5d                	pop    %r13
   180f4:	41 5e                	pop    %r14
   180f6:	41 5f                	pop    %r15
   180f8:	5d                   	pop    %rbp
   180f9:	c3                   	ret
   180fa:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   180fe:	8b 74 24 10          	mov    0x10(%rsp),%esi
   18102:	89 74 24 60          	mov    %esi,0x60(%rsp)
   18106:	89 54 24 5d          	mov    %edx,0x5d(%rsp)
   1810a:	89 4c 24 58          	mov    %ecx,0x58(%rsp)
   1810e:	88 44 24 5c          	mov    %al,0x5c(%rsp)
   18112:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18117:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
   1811c:	89 ea                	mov    %ebp,%edx
   1811e:	ff 15 94 55 04 00    	call   *0x45594(%rip)        # 5d6b8 <_DYNAMIC+0x330>
   18124:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18128:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   1812d:	83 f9 02             	cmp    $0x2,%ecx
   18130:	4c 89 fb             	mov    %r15,%rbx
   18133:	0f 84 14 ff ff ff    	je     1804d <hyperinterval_strict_surface32+0x3d>
   18139:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   1813d:	8b 74 24 10          	mov    0x10(%rsp),%esi
   18141:	89 74 24 78          	mov    %esi,0x78(%rsp)
   18145:	89 54 24 75          	mov    %edx,0x75(%rsp)
   18149:	89 4c 24 70          	mov    %ecx,0x70(%rsp)
   1814d:	88 44 24 74          	mov    %al,0x74(%rsp)
   18151:	48 8d 7c 24 4c       	lea    0x4c(%rsp),%rdi
   18156:	48 8d 74 24 70       	lea    0x70(%rsp),%rsi
   1815b:	ff 15 5f 55 04 00    	call   *0x4555f(%rip)        # 5d6c0 <_DYNAMIC+0x338>
   18161:	8b 4c 24 4c          	mov    0x4c(%rsp),%ecx
   18165:	0f b6 44 24 50       	movzbl 0x50(%rsp),%eax
   1816a:	83 f9 02             	cmp    $0x2,%ecx
   1816d:	0f 84 da fe ff ff    	je     1804d <hyperinterval_strict_surface32+0x3d>
   18173:	8b 54 24 51          	mov    0x51(%rsp),%edx
   18177:	8b 74 24 54          	mov    0x54(%rsp),%esi
   1817b:	89 74 24 38          	mov    %esi,0x38(%rsp)
   1817f:	89 54 24 35          	mov    %edx,0x35(%rsp)
   18183:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   18187:	88 44 24 34          	mov    %al,0x34(%rsp)
   1818b:	48 8d 9c 24 9c 00 00 	lea    0x9c(%rsp),%rbx
   18192:	00 
   18193:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   18198:	4c 8d 64 24 58       	lea    0x58(%rsp),%r12
   1819d:	48 89 df             	mov    %rbx,%rdi
   181a0:	4c 89 e2             	mov    %r12,%rdx
   181a3:	ff 15 1f 55 04 00    	call   *0x4551f(%rip)        # 5d6c8 <_DYNAMIC+0x340>
   181a9:	4c 8d 74 24 64       	lea    0x64(%rsp),%r14
   181ae:	48 8d 54 24 40       	lea    0x40(%rsp),%rdx
   181b3:	4c 89 f7             	mov    %r14,%rdi
   181b6:	48 89 de             	mov    %rbx,%rsi
   181b9:	ff 15 11 55 04 00    	call   *0x45511(%rip)        # 5d6d0 <_DYNAMIC+0x348>
   181bf:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   181c4:	4c 89 f6             	mov    %r14,%rsi
   181c7:	ff 15 0b 55 04 00    	call   *0x4550b(%rip)        # 5d6d8 <_DYNAMIC+0x350>
   181cd:	48 8d 7c 24 14       	lea    0x14(%rsp),%rdi
   181d2:	4c 89 f6             	mov    %r14,%rsi
   181d5:	4c 89 e2             	mov    %r12,%rdx
   181d8:	ff 15 02 55 04 00    	call   *0x45502(%rip)        # 5d6e0 <_DYNAMIC+0x358>
   181de:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   181e3:	4c 89 f6             	mov    %r14,%rsi
   181e6:	4c 89 e2             	mov    %r12,%rdx
   181e9:	ff 15 f9 54 04 00    	call   *0x454f9(%rip)        # 5d6e8 <_DYNAMIC+0x360>
   181ef:	8b 44 24 28          	mov    0x28(%rsp),%eax
   181f3:	89 84 24 90 00 00 00 	mov    %eax,0x90(%rsp)
   181fa:	0f 10 44 24 08       	movups 0x8(%rsp),%xmm0
   181ff:	0f 10 4c 24 18       	movups 0x18(%rsp),%xmm1
   18204:	0f 29 8c 24 80 00 00 	movaps %xmm1,0x80(%rsp)
   1820b:	00 
   1820c:	0f 29 44 24 70       	movaps %xmm0,0x70(%rsp)
   18211:	48 8d 44 24 70       	lea    0x70(%rsp),%rax
   18216:	4c 89 f7             	mov    %r14,%rdi
   18219:	ff 15 d1 54 04 00    	call   *0x454d1(%rip)        # 5d6f0 <_DYNAMIC+0x368>
   1821f:	8b 4c 24 64          	mov    0x64(%rsp),%ecx
   18223:	83 f9 01             	cmp    $0x1,%ecx
   18226:	75 1c                	jne    18244 <hyperinterval_strict_surface32+0x234>
   18228:	8b 74 24 68          	mov    0x68(%rsp),%esi
   1822c:	8b 7c 24 6c          	mov    0x6c(%rsp),%edi
   18230:	39 fe                	cmp    %edi,%esi
   18232:	0f 94 c2             	sete   %dl
   18235:	66 0f 6e ce          	movd   %esi,%xmm1
   18239:	66 0f 6e c7          	movd   %edi,%xmm0
   1823d:	be 01 00 00 00       	mov    $0x1,%esi
   18242:	eb 04                	jmp    18248 <hyperinterval_strict_surface32+0x238>
   18244:	31 d2                	xor    %edx,%edx
   18246:	31 f6                	xor    %esi,%esi
   18248:	80 f1 01             	xor    $0x1,%cl
   1824b:	89 74 24 08          	mov    %esi,0x8(%rsp)
   1824f:	66 0f 7e 4c 24 0c    	movd   %xmm1,0xc(%rsp)
   18255:	88 4c 24 10          	mov    %cl,0x10(%rsp)
   18259:	88 54 24 11          	mov    %dl,0x11(%rsp)
   1825d:	88 44 24 12          	mov    %al,0x12(%rsp)
   18261:	89 74 24 14          	mov    %esi,0x14(%rsp)
   18265:	66 0f 7e 44 24 18    	movd   %xmm0,0x18(%rsp)
   1826b:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   18270:	4c 8d 64 24 64       	lea    0x64(%rsp),%r12
   18275:	48 8d 5c 24 58       	lea    0x58(%rsp),%rbx
   1827a:	4c 89 e7             	mov    %r12,%rdi
   1827d:	48 89 de             	mov    %rbx,%rsi
   18280:	ff 15 72 54 04 00    	call   *0x45472(%rip)        # 5d6f8 <_DYNAMIC+0x370>
   18286:	88 44 24 2c          	mov    %al,0x2c(%rsp)
   1828a:	4c 89 e7             	mov    %r12,%rdi
   1828d:	48 89 de             	mov    %rbx,%rsi
   18290:	ff 15 6a 54 04 00    	call   *0x4546a(%rip)        # 5d700 <_DYNAMIC+0x378>
   18296:	41 89 c6             	mov    %eax,%r14d
   18299:	48 8d 5c 24 40       	lea    0x40(%rsp),%rbx
   1829e:	4c 89 e7             	mov    %r12,%rdi
   182a1:	48 89 de             	mov    %rbx,%rsi
   182a4:	ff 15 5e 54 04 00    	call   *0x4545e(%rip)        # 5d708 <_DYNAMIC+0x380>
   182aa:	89 c5                	mov    %eax,%ebp
   182ac:	4c 89 e7             	mov    %r12,%rdi
   182af:	48 89 de             	mov    %rbx,%rsi
   182b2:	ff 15 58 54 04 00    	call   *0x45458(%rip)        # 5d710 <_DYNAMIC+0x388>
   182b8:	89 c3                	mov    %eax,%ebx
   182ba:	4c 89 e7             	mov    %r12,%rdi
   182bd:	66 0f 6e 44 24 3c    	movd   0x3c(%rsp),%xmm0
   182c3:	ff 15 07 53 04 00    	call   *0x45307(%rip)        # 5d5d0 <_DYNAMIC+0x248>
   182c9:	a8 01                	test   $0x1,%al
   182cb:	74 0c                	je     182d9 <hyperinterval_strict_surface32+0x2c9>
   182cd:	4c 89 fb             	mov    %r15,%rbx
   182d0:	41 88 57 04          	mov    %dl,0x4(%r15)
   182d4:	e9 05 fe ff ff       	jmp    180de <hyperinterval_strict_surface32+0xce>
   182d9:	0f b6 44 24 2c       	movzbl 0x2c(%rsp),%eax
   182de:	88 44 24 08          	mov    %al,0x8(%rsp)
   182e2:	44 88 74 24 09       	mov    %r14b,0x9(%rsp)
   182e7:	40 88 6c 24 0a       	mov    %bpl,0xa(%rsp)
   182ec:	88 5c 24 0b          	mov    %bl,0xb(%rsp)
   182f0:	88 54 24 0c          	mov    %dl,0xc(%rsp)
   182f4:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   182f9:	41 83 fd 01          	cmp    $0x1,%r13d
   182fd:	75 2a                	jne    18329 <hyperinterval_strict_surface32+0x319>
   182ff:	f3 0f 7e 44 24 44    	movq   0x44(%rsp),%xmm0
   18305:	66 0f ef c9          	pxor   %xmm1,%xmm1
   18309:	66 0f 6f 15 af d9 fe 	movdqa -0x12651(%rip),%xmm2        # 5cc0 <__abi_tag+0x59c4>
   18310:	ff 
   18311:	66 0f ef d0          	pxor   %xmm0,%xmm2
   18315:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   18319:	66 0f df ca          	pandn  %xmm2,%xmm1
   1831d:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   18322:	b8 01 00 00 00       	mov    $0x1,%eax
   18327:	eb 02                	jmp    1832b <hyperinterval_strict_surface32+0x31b>
   18329:	31 c0                	xor    %eax,%eax
   1832b:	89 44 24 4c          	mov    %eax,0x4c(%rsp)
   1832f:	66 0f d6 44 24 50    	movq   %xmm0,0x50(%rsp)
   18335:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1833a:	48 8d 74 24 64       	lea    0x64(%rsp),%rsi
   1833f:	48 8d 54 24 4c       	lea    0x4c(%rsp),%rdx
   18344:	ff 15 ce 53 04 00    	call   *0x453ce(%rip)        # 5d718 <_DYNAMIC+0x390>
   1834a:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1834e:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   18353:	83 f9 02             	cmp    $0x2,%ecx
   18356:	4c 89 fb             	mov    %r15,%rbx
   18359:	0f 84 ee fc ff ff    	je     1804d <hyperinterval_strict_surface32+0x3d>
   1835f:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   18363:	8b 74 24 10          	mov    0x10(%rsp),%esi
   18367:	89 74 24 38          	mov    %esi,0x38(%rsp)
   1836b:	89 54 24 35          	mov    %edx,0x35(%rsp)
   1836f:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   18373:	88 44 24 34          	mov    %al,0x34(%rsp)
   18377:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1837c:	66 0f 6e 05 a0 d8 fe 	movd   -0x12760(%rip),%xmm0        # 5c24 <__abi_tag+0x5928>
   18383:	ff 
   18384:	ff 15 c6 52 04 00    	call   *0x452c6(%rip)        # 5d650 <_DYNAMIC+0x2c8>
   1838a:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1838e:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   18393:	83 f9 02             	cmp    $0x2,%ecx
   18396:	0f 84 b1 fc ff ff    	je     1804d <hyperinterval_strict_surface32+0x3d>
   1839c:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   183a0:	8b 74 24 10          	mov    0x10(%rsp),%esi
   183a4:	89 74 24 78          	mov    %esi,0x78(%rsp)
   183a8:	89 54 24 75          	mov    %edx,0x75(%rsp)
   183ac:	89 4c 24 70          	mov    %ecx,0x70(%rsp)
   183b0:	88 44 24 74          	mov    %al,0x74(%rsp)
   183b4:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   183b9:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   183be:	48 89 df             	mov    %rbx,%rdi
   183c1:	ff 15 59 53 04 00    	call   *0x45359(%rip)        # 5d720 <_DYNAMIC+0x398>
   183c7:	e9 19 fd ff ff       	jmp    180e5 <hyperinterval_strict_surface32+0xd5>
   183cc:	cc                   	int3
   183cd:	cc                   	int3
   183ce:	cc                   	int3
   183cf:	cc                   	int3

hyperinterval_strict_surface64:
   183d0:	55                   	push   %rbp
   183d1:	41 57                	push   %r15
   183d3:	41 56                	push   %r14
   183d5:	41 55                	push   %r13
   183d7:	41 54                	push   %r12
   183d9:	53                   	push   %rbx
   183da:	48 81 ec 48 01 00 00 	sub    $0x148,%rsp
   183e1:	89 f5                	mov    %esi,%ebp
   183e3:	48 89 fb             	mov    %rdi,%rbx
   183e6:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   183eb:	f2 0f 11 84 24 80 00 	movsd  %xmm0,0x80(%rsp)
   183f2:	00 00 
   183f4:	66 0f d6 4c 24 60    	movq   %xmm1,0x60(%rsp)
   183fa:	ff 15 68 52 04 00    	call   *0x45268(%rip)        # 5d668 <_DYNAMIC+0x2e0>
   18400:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   18405:	49 83 fc 02          	cmp    $0x2,%r12
   18409:	75 07                	jne    18412 <hyperinterval_strict_surface64+0x42>
   1840b:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   18410:	eb 78                	jmp    1848a <hyperinterval_strict_surface64+0xba>
   18412:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
   18417:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
   1841c:	4c 89 a4 24 00 01 00 	mov    %r12,0x100(%rsp)
   18423:	00 
   18424:	4c 89 bc 24 08 01 00 	mov    %r15,0x108(%rsp)
   1842b:	00 
   1842c:	4c 89 b4 24 10 01 00 	mov    %r14,0x110(%rsp)
   18433:	00 
   18434:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
   1843b:	00 
   1843c:	f2 0f 10 84 24 80 00 	movsd  0x80(%rsp),%xmm0
   18443:	00 00 
   18445:	ff 15 dd 52 04 00    	call   *0x452dd(%rip)        # 5d728 <_DYNAMIC+0x3a0>
   1844b:	80 bc 24 a0 00 00 00 	cmpb   $0x1,0xa0(%rsp)
   18452:	01 
   18453:	74 2d                	je     18482 <hyperinterval_strict_surface64+0xb2>
   18455:	f2 0f 10 84 24 a8 00 	movsd  0xa8(%rsp),%xmm0
   1845c:	00 00 
   1845e:	f2 0f 11 44 24 58    	movsd  %xmm0,0x58(%rsp)
   18464:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
   1846b:	00 
   1846c:	f2 0f 10 44 24 60    	movsd  0x60(%rsp),%xmm0
   18472:	ff 15 b8 52 04 00    	call   *0x452b8(%rip)        # 5d730 <_DYNAMIC+0x3a8>
   18478:	80 bc 24 a0 00 00 00 	cmpb   $0x1,0xa0(%rsp)
   1847f:	01 
   18480:	75 27                	jne    184a9 <hyperinterval_strict_surface64+0xd9>
   18482:	0f b6 84 24 a1 00 00 	movzbl 0xa1(%rsp),%eax
   18489:	00 
   1848a:	88 43 08             	mov    %al,0x8(%rbx)
   1848d:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   18494:	48 89 d8             	mov    %rbx,%rax
   18497:	48 81 c4 48 01 00 00 	add    $0x148,%rsp
   1849e:	5b                   	pop    %rbx
   1849f:	41 5c                	pop    %r12
   184a1:	41 5d                	pop    %r13
   184a3:	41 5e                	pop    %r14
   184a5:	41 5f                	pop    %r15
   184a7:	5d                   	pop    %rbp
   184a8:	c3                   	ret
   184a9:	f3 0f 7e 8c 24 a8 00 	movq   0xa8(%rsp),%xmm1
   184b0:	00 00 
   184b2:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   184b7:	f2 0f 10 44 24 58    	movsd  0x58(%rsp),%xmm0
   184bd:	ff 15 a5 51 04 00    	call   *0x451a5(%rip)        # 5d668 <_DYNAMIC+0x2e0>
   184c3:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   184c8:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   184cd:	48 83 f9 02          	cmp    $0x2,%rcx
   184d1:	74 b7                	je     1848a <hyperinterval_strict_surface64+0xba>
   184d3:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   184d8:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   184dd:	48 89 b4 24 f8 00 00 	mov    %rsi,0xf8(%rsp)
   184e4:	00 
   184e5:	48 89 94 24 f1 00 00 	mov    %rdx,0xf1(%rsp)
   184ec:	00 
   184ed:	48 89 8c 24 e8 00 00 	mov    %rcx,0xe8(%rsp)
   184f4:	00 
   184f5:	88 84 24 f0 00 00 00 	mov    %al,0xf0(%rsp)
   184fc:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   18501:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
   18508:	00 
   18509:	89 ea                	mov    %ebp,%edx
   1850b:	ff 15 27 52 04 00    	call   *0x45227(%rip)        # 5d738 <_DYNAMIC+0x3b0>
   18511:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   18516:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   1851b:	48 83 f9 02          	cmp    $0x2,%rcx
   1851f:	0f 84 65 ff ff ff    	je     1848a <hyperinterval_strict_surface64+0xba>
   18525:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   1852a:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1852f:	48 89 b4 24 b0 00 00 	mov    %rsi,0xb0(%rsp)
   18536:	00 
   18537:	48 89 94 24 a9 00 00 	mov    %rdx,0xa9(%rsp)
   1853e:	00 
   1853f:	48 89 8c 24 a0 00 00 	mov    %rcx,0xa0(%rsp)
   18546:	00 
   18547:	88 84 24 a8 00 00 00 	mov    %al,0xa8(%rsp)
   1854e:	48 8d bc 24 88 00 00 	lea    0x88(%rsp),%rdi
   18555:	00 
   18556:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
   1855d:	00 
   1855e:	ff 15 dc 51 04 00    	call   *0x451dc(%rip)        # 5d740 <_DYNAMIC+0x3b8>
   18564:	48 8b 8c 24 88 00 00 	mov    0x88(%rsp),%rcx
   1856b:	00 
   1856c:	0f b6 84 24 90 00 00 	movzbl 0x90(%rsp),%eax
   18573:	00 
   18574:	48 83 f9 02          	cmp    $0x2,%rcx
   18578:	0f 84 0c ff ff ff    	je     1848a <hyperinterval_strict_surface64+0xba>
   1857e:	48 8b 94 24 91 00 00 	mov    0x91(%rsp),%rdx
   18585:	00 
   18586:	48 8b b4 24 98 00 00 	mov    0x98(%rsp),%rsi
   1858d:	00 
   1858e:	48 89 74 24 78       	mov    %rsi,0x78(%rsp)
   18593:	48 89 54 24 71       	mov    %rdx,0x71(%rsp)
   18598:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
   1859d:	88 44 24 70          	mov    %al,0x70(%rsp)
   185a1:	4c 8d ac 24 30 01 00 	lea    0x130(%rsp),%r13
   185a8:	00 
   185a9:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
   185ae:	48 8d 94 24 e8 00 00 	lea    0xe8(%rsp),%rdx
   185b5:	00 
   185b6:	4c 89 ef             	mov    %r13,%rdi
   185b9:	ff 15 89 51 04 00    	call   *0x45189(%rip)        # 5d748 <_DYNAMIC+0x3c0>
   185bf:	48 8d ac 24 18 01 00 	lea    0x118(%rsp),%rbp
   185c6:	00 
   185c7:	48 8d 94 24 00 01 00 	lea    0x100(%rsp),%rdx
   185ce:	00 
   185cf:	48 89 ef             	mov    %rbp,%rdi
   185d2:	4c 89 ee             	mov    %r13,%rsi
   185d5:	ff 15 75 51 04 00    	call   *0x45175(%rip)        # 5d750 <_DYNAMIC+0x3c8>
   185db:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   185e0:	48 89 ee             	mov    %rbp,%rsi
   185e3:	e8 68 f5 ff ff       	call   17b50 <<hyperinterval::float::F64Enclosure>::abs>
   185e8:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   185ed:	48 89 ee             	mov    %rbp,%rsi
   185f0:	48 8d 94 24 e8 00 00 	lea    0xe8(%rsp),%rdx
   185f7:	00 
   185f8:	ff 15 5a 51 04 00    	call   *0x4515a(%rip)        # 5d758 <_DYNAMIC+0x3d0>
   185fe:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   18603:	48 89 ee             	mov    %rbp,%rsi
   18606:	48 8d 94 24 e8 00 00 	lea    0xe8(%rsp),%rdx
   1860d:	00 
   1860e:	ff 15 4c 51 04 00    	call   *0x4514c(%rip)        # 5d760 <_DYNAMIC+0x3d8>
   18614:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   18619:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
   18620:	00 
   18621:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
   18626:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
   1862b:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
   18630:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
   18635:	0f 29 9c 24 d0 00 00 	movaps %xmm3,0xd0(%rsp)
   1863c:	00 
   1863d:	0f 29 94 24 c0 00 00 	movaps %xmm2,0xc0(%rsp)
   18644:	00 
   18645:	0f 29 8c 24 b0 00 00 	movaps %xmm1,0xb0(%rsp)
   1864c:	00 
   1864d:	0f 29 84 24 a0 00 00 	movaps %xmm0,0xa0(%rsp)
   18654:	00 
   18655:	48 8d 84 24 a0 00 00 	lea    0xa0(%rsp),%rax
   1865c:	00 
   1865d:	48 89 ef             	mov    %rbp,%rdi
   18660:	ff 15 02 51 04 00    	call   *0x45102(%rip)        # 5d768 <_DYNAMIC+0x3e0>
   18666:	48 8b 8c 24 18 01 00 	mov    0x118(%rsp),%rcx
   1866d:	00 
   1866e:	48 83 f9 01          	cmp    $0x1,%rcx
   18672:	75 27                	jne    1869b <hyperinterval_strict_surface64+0x2cb>
   18674:	48 8b b4 24 20 01 00 	mov    0x120(%rsp),%rsi
   1867b:	00 
   1867c:	48 8b bc 24 28 01 00 	mov    0x128(%rsp),%rdi
   18683:	00 
   18684:	48 39 fe             	cmp    %rdi,%rsi
   18687:	0f 94 c2             	sete   %dl
   1868a:	66 48 0f 6e ce       	movq   %rsi,%xmm1
   1868f:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   18694:	be 01 00 00 00       	mov    $0x1,%esi
   18699:	eb 04                	jmp    1869f <hyperinterval_strict_surface64+0x2cf>
   1869b:	31 d2                	xor    %edx,%edx
   1869d:	31 f6                	xor    %esi,%esi
   1869f:	80 f1 01             	xor    $0x1,%cl
   186a2:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
   186a7:	66 0f d6 4c 24 18    	movq   %xmm1,0x18(%rsp)
   186ad:	88 4c 24 20          	mov    %cl,0x20(%rsp)
   186b1:	88 54 24 21          	mov    %dl,0x21(%rsp)
   186b5:	88 44 24 22          	mov    %al,0x22(%rsp)
   186b9:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
   186be:	66 0f d6 44 24 30    	movq   %xmm0,0x30(%rsp)
   186c4:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
   186c9:	4c 8d ac 24 18 01 00 	lea    0x118(%rsp),%r13
   186d0:	00 
   186d1:	48 8d ac 24 e8 00 00 	lea    0xe8(%rsp),%rbp
   186d8:	00 
   186d9:	4c 89 ef             	mov    %r13,%rdi
   186dc:	48 89 ee             	mov    %rbp,%rsi
   186df:	ff 15 8b 50 04 00    	call   *0x4508b(%rip)        # 5d770 <_DYNAMIC+0x3e8>
   186e5:	88 44 24 60          	mov    %al,0x60(%rsp)
   186e9:	4c 89 ef             	mov    %r13,%rdi
   186ec:	48 89 ee             	mov    %rbp,%rsi
   186ef:	ff 15 83 50 04 00    	call   *0x45083(%rip)        # 5d778 <_DYNAMIC+0x3f0>
   186f5:	88 44 24 58          	mov    %al,0x58(%rsp)
   186f9:	48 8d ac 24 00 01 00 	lea    0x100(%rsp),%rbp
   18700:	00 
   18701:	4c 89 ef             	mov    %r13,%rdi
   18704:	48 89 ee             	mov    %rbp,%rsi
   18707:	ff 15 73 50 04 00    	call   *0x45073(%rip)        # 5d780 <_DYNAMIC+0x3f8>
   1870d:	88 44 24 0f          	mov    %al,0xf(%rsp)
   18711:	4c 89 ef             	mov    %r13,%rdi
   18714:	48 89 ee             	mov    %rbp,%rsi
   18717:	ff 15 6b 50 04 00    	call   *0x4506b(%rip)        # 5d788 <_DYNAMIC+0x400>
   1871d:	89 c5                	mov    %eax,%ebp
   1871f:	4c 89 ef             	mov    %r13,%rdi
   18722:	f2 0f 10 84 24 80 00 	movsd  0x80(%rsp),%xmm0
   18729:	00 00 
   1872b:	ff 15 97 4e 04 00    	call   *0x44e97(%rip)        # 5d5c8 <_DYNAMIC+0x240>
   18731:	a8 01                	test   $0x1,%al
   18733:	74 08                	je     1873d <hyperinterval_strict_surface64+0x36d>
   18735:	88 53 08             	mov    %dl,0x8(%rbx)
   18738:	e9 50 fd ff ff       	jmp    1848d <hyperinterval_strict_surface64+0xbd>
   1873d:	0f b6 44 24 60       	movzbl 0x60(%rsp),%eax
   18742:	88 44 24 10          	mov    %al,0x10(%rsp)
   18746:	0f b6 44 24 58       	movzbl 0x58(%rsp),%eax
   1874b:	88 44 24 11          	mov    %al,0x11(%rsp)
   1874f:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
   18754:	88 44 24 12          	mov    %al,0x12(%rsp)
   18758:	40 88 6c 24 13       	mov    %bpl,0x13(%rsp)
   1875d:	88 54 24 14          	mov    %dl,0x14(%rsp)
   18761:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
   18766:	41 83 fc 01          	cmp    $0x1,%r12d
   1876a:	75 28                	jne    18794 <hyperinterval_strict_surface64+0x3c4>
   1876c:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   18773:	00 00 80 
   18776:	4c 89 f1             	mov    %r14,%rcx
   18779:	48 31 c1             	xor    %rax,%rcx
   1877c:	4d 85 f6             	test   %r14,%r14
   1877f:	49 0f 44 ce          	cmove  %r14,%rcx
   18783:	4c 31 f8             	xor    %r15,%rax
   18786:	4d 85 ff             	test   %r15,%r15
   18789:	49 0f 44 c7          	cmove  %r15,%rax
   1878d:	ba 01 00 00 00       	mov    $0x1,%edx
   18792:	eb 02                	jmp    18796 <hyperinterval_strict_surface64+0x3c6>
   18794:	31 d2                	xor    %edx,%edx
   18796:	48 89 94 24 88 00 00 	mov    %rdx,0x88(%rsp)
   1879d:	00 
   1879e:	48 89 8c 24 90 00 00 	mov    %rcx,0x90(%rsp)
   187a5:	00 
   187a6:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
   187ad:	00 
   187ae:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   187b3:	48 8d b4 24 18 01 00 	lea    0x118(%rsp),%rsi
   187ba:	00 
   187bb:	48 8d 94 24 88 00 00 	lea    0x88(%rsp),%rdx
   187c2:	00 
   187c3:	ff 15 c7 4f 04 00    	call   *0x44fc7(%rip)        # 5d790 <_DYNAMIC+0x408>
   187c9:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   187ce:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   187d3:	48 83 f9 02          	cmp    $0x2,%rcx
   187d7:	0f 84 ad fc ff ff    	je     1848a <hyperinterval_strict_surface64+0xba>
   187dd:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   187e2:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   187e7:	48 89 74 24 78       	mov    %rsi,0x78(%rsp)
   187ec:	48 89 54 24 71       	mov    %rdx,0x71(%rsp)
   187f1:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
   187f6:	88 44 24 70          	mov    %al,0x70(%rsp)
   187fa:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   187ff:	f2 0f 10 05 89 d3 fe 	movsd  -0x12c77(%rip),%xmm0        # 5b90 <__abi_tag+0x5894>
   18806:	ff 
   18807:	ff 15 73 4e 04 00    	call   *0x44e73(%rip)        # 5d680 <_DYNAMIC+0x2f8>
   1880d:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   18812:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   18817:	48 83 f9 02          	cmp    $0x2,%rcx
   1881b:	0f 84 69 fc ff ff    	je     1848a <hyperinterval_strict_surface64+0xba>
   18821:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   18826:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1882b:	48 89 b4 24 b0 00 00 	mov    %rsi,0xb0(%rsp)
   18832:	00 
   18833:	48 89 94 24 a9 00 00 	mov    %rdx,0xa9(%rsp)
   1883a:	00 
   1883b:	48 89 8c 24 a0 00 00 	mov    %rcx,0xa0(%rsp)
   18842:	00 
   18843:	88 84 24 a8 00 00 00 	mov    %al,0xa8(%rsp)
   1884a:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
   1884f:	48 8d 94 24 a0 00 00 	lea    0xa0(%rsp),%rdx
   18856:	00 
   18857:	48 89 df             	mov    %rbx,%rdi
   1885a:	ff 15 38 4f 04 00    	call   *0x44f38(%rip)        # 5d798 <_DYNAMIC+0x410>
   18860:	e9 2f fc ff ff       	jmp    18494 <hyperinterval_strict_surface64+0xc4>
   18865:	cc                   	int3
   18866:	cc                   	int3
   18867:	cc                   	int3
   18868:	cc                   	int3
   18869:	cc                   	int3
   1886a:	cc                   	int3
   1886b:	cc                   	int3
   1886c:	cc                   	int3
   1886d:	cc                   	int3
   1886e:	cc                   	int3
   1886f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::reciprocal:
   188c0:	41 57                	push   %r15
   188c2:	41 56                	push   %r14
   188c4:	41 54                	push   %r12
   188c6:	53                   	push   %rbx
   188c7:	48 83 ec 28          	sub    $0x28,%rsp
   188cb:	48 89 fb             	mov    %rdi,%rbx
   188ce:	83 3e 00             	cmpl   $0x0,(%rsi)
   188d1:	74 5e                	je     18931 <<hyperinterval::float::F32Enclosure>::reciprocal+0x71>
   188d3:	49 89 f6             	mov    %rsi,%r14
   188d6:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   188dc:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   188e1:	be 00 00 00 80       	mov    $0x80000000,%esi
   188e6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   188eb:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   188f0:	e8 6b 3d 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   188f5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   188fa:	74 25                	je     18921 <<hyperinterval::float::F32Enclosure>::reciprocal+0x61>
   188fc:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   18901:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18906:	be 00 00 00 80       	mov    $0x80000000,%esi
   1890b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18910:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   18915:	e8 46 3d 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1891a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1891f:	75 25                	jne    18946 <<hyperinterval::float::F32Enclosure>::reciprocal+0x86>
   18921:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   18926:	88 4b 04             	mov    %cl,0x4(%rbx)
   18929:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1892f:	eb 06                	jmp    18937 <<hyperinterval::float::F32Enclosure>::reciprocal+0x77>
   18931:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   18937:	48 89 d8             	mov    %rbx,%rax
   1893a:	48 83 c4 28          	add    $0x28,%rsp
   1893e:	5b                   	pop    %rbx
   1893f:	41 5c                	pop    %r12
   18941:	41 5e                	pop    %r14
   18943:	41 5f                	pop    %r15
   18945:	c3                   	ret
   18946:	8b 44 24 10          	mov    0x10(%rsp),%eax
   1894a:	44 89 e1             	mov    %r12d,%ecx
   1894d:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18953:	89 c2                	mov    %eax,%edx
   18955:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1895b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18960:	29 ce                	sub    %ecx,%esi
   18962:	44 09 f9             	or     %r15d,%ecx
   18965:	45 85 e4             	test   %r12d,%r12d
   18968:	48 0f 49 f1          	cmovns %rcx,%rsi
   1896c:	89 d1                	mov    %edx,%ecx
   1896e:	44 09 f9             	or     %r15d,%ecx
   18971:	41 29 d7             	sub    %edx,%r15d
   18974:	85 c0                	test   %eax,%eax
   18976:	4c 0f 49 f9          	cmovns %rcx,%r15
   1897a:	b1 01                	mov    $0x1,%cl
   1897c:	44 39 fe             	cmp    %r15d,%esi
   1897f:	77 a5                	ja     18926 <<hyperinterval::float::F32Enclosure>::reciprocal+0x66>
   18981:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%rsp)
   18988:	00 
   18989:	44 89 64 24 20       	mov    %r12d,0x20(%rsp)
   1898e:	89 44 24 24          	mov    %eax,0x24(%rsp)
   18992:	41 83 7e 04 00       	cmpl   $0x0,0x4(%r14)
   18997:	7f 15                	jg     189ae <<hyperinterval::float::F32Enclosure>::reciprocal+0xee>
   18999:	41 8b 46 08          	mov    0x8(%r14),%eax
   1899d:	85 c0                	test   %eax,%eax
   1899f:	0f 99 c1             	setns  %cl
   189a2:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   189a7:	0f 94 c0             	sete   %al
   189aa:	08 c8                	or     %cl,%al
   189ac:	75 1a                	jne    189c8 <<hyperinterval::float::F32Enclosure>::reciprocal+0x108>
   189ae:	48 8d 74 24 1c       	lea    0x1c(%rsp),%rsi
   189b3:	48 89 df             	mov    %rbx,%rdi
   189b6:	4c 89 f2             	mov    %r14,%rdx
   189b9:	b9 01 00 00 00       	mov    $0x1,%ecx
   189be:	e8 8d 02 00 00       	call   18c50 <<hyperinterval::float::F32Enclosure>::corner_image>
   189c3:	e9 6f ff ff ff       	jmp    18937 <<hyperinterval::float::F32Enclosure>::reciprocal+0x77>
   189c8:	c6 43 04 06          	movb   $0x6,0x4(%rbx)
   189cc:	e9 58 ff ff ff       	jmp    18929 <<hyperinterval::float::F32Enclosure>::reciprocal+0x69>
   189d1:	cc                   	int3
   189d2:	cc                   	int3
   189d3:	cc                   	int3
   189d4:	cc                   	int3
   189d5:	cc                   	int3
   189d6:	cc                   	int3
   189d7:	cc                   	int3
   189d8:	cc                   	int3
   189d9:	cc                   	int3
   189da:	cc                   	int3
   189db:	cc                   	int3
   189dc:	cc                   	int3
   189dd:	cc                   	int3
   189de:	cc                   	int3
   189df:	cc                   	int3

<hyperinterval::float::F32Enclosure>::checked_pow:
   189e0:	55                   	push   %rbp
   189e1:	41 57                	push   %r15
   189e3:	41 56                	push   %r14
   189e5:	41 55                	push   %r13
   189e7:	41 54                	push   %r12
   189e9:	53                   	push   %rbx
   189ea:	48 83 ec 38          	sub    $0x38,%rsp
   189ee:	48 89 fb             	mov    %rdi,%rbx
   189f1:	83 fa 02             	cmp    $0x2,%edx
   189f4:	75 0e                	jne    18a04 <<hyperinterval::float::F32Enclosure>::checked_pow+0x24>
   189f6:	48 89 df             	mov    %rbx,%rdi
   189f9:	ff 15 49 4c 04 00    	call   *0x44c49(%rip)        # 5d648 <_DYNAMIC+0x2c0>
   189ff:	e9 c8 00 00 00       	jmp    18acc <<hyperinterval::float::F32Enclosure>::checked_pow+0xec>
   18a04:	f6 06 01             	testb  $0x1,(%rsi)
   18a07:	0f 84 b9 00 00 00    	je     18ac6 <<hyperinterval::float::F32Enclosure>::checked_pow+0xe6>
   18a0d:	89 d5                	mov    %edx,%ebp
   18a0f:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
   18a13:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   18a17:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18a1c:	be 00 00 00 80       	mov    $0x80000000,%esi
   18a21:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18a26:	4c 89 f9             	mov    %r15,%rcx
   18a29:	41 89 e8             	mov    %ebp,%r8d
   18a2c:	e8 3f 4b 00 00       	call   1d570 <<hyperinterval::ieee::Format>::power>
   18a31:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   18a36:	75 7e                	jne    18ab6 <<hyperinterval::float::F32Enclosure>::checked_pow+0xd6>
   18a38:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   18a3d:	44 8b 6c 24 18       	mov    0x18(%rsp),%r13d
   18a42:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18a47:	be 00 00 00 80       	mov    $0x80000000,%esi
   18a4c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18a51:	4c 89 f1             	mov    %r14,%rcx
   18a54:	41 89 e8             	mov    %ebp,%r8d
   18a57:	e8 14 4b 00 00       	call   1d570 <<hyperinterval::ieee::Format>::power>
   18a5c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18a61:	74 53                	je     18ab6 <<hyperinterval::float::F32Enclosure>::checked_pow+0xd6>
   18a63:	8b 44 24 10          	mov    0x10(%rsp),%eax
   18a67:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   18a6c:	8b 44 24 18          	mov    0x18(%rsp),%eax
   18a70:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   18a75:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18a7a:	be 00 00 00 80       	mov    $0x80000000,%esi
   18a7f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18a84:	4c 89 e1             	mov    %r12,%rcx
   18a87:	e8 d4 3b 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   18a8c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18a91:	74 23                	je     18ab6 <<hyperinterval::float::F32Enclosure>::checked_pow+0xd6>
   18a93:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   18a98:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18a9d:	be 00 00 00 80       	mov    $0x80000000,%esi
   18aa2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18aa7:	4c 89 e9             	mov    %r13,%rcx
   18aaa:	e8 b1 3b 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   18aaf:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18ab4:	75 28                	jne    18ade <<hyperinterval::float::F32Enclosure>::checked_pow+0xfe>
   18ab6:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   18abb:	88 43 04             	mov    %al,0x4(%rbx)
   18abe:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18ac4:	eb 06                	jmp    18acc <<hyperinterval::float::F32Enclosure>::checked_pow+0xec>
   18ac6:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   18acc:	48 89 d8             	mov    %rbx,%rax
   18acf:	48 83 c4 38          	add    $0x38,%rsp
   18ad3:	5b                   	pop    %rbx
   18ad4:	41 5c                	pop    %r12
   18ad6:	41 5d                	pop    %r13
   18ad8:	41 5e                	pop    %r14
   18ada:	41 5f                	pop    %r15
   18adc:	5d                   	pop    %rbp
   18add:	c3                   	ret
   18ade:	8b 7c 24 10          	mov    0x10(%rsp),%edi
   18ae2:	44 89 e0             	mov    %r12d,%eax
   18ae5:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18aea:	89 f9                	mov    %edi,%ecx
   18aec:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18af2:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18af7:	29 c2                	sub    %eax,%edx
   18af9:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   18aff:	44 09 e8             	or     %r13d,%eax
   18b02:	45 85 e4             	test   %r12d,%r12d
   18b05:	48 0f 49 d0          	cmovns %rax,%rdx
   18b09:	be 00 00 00 80       	mov    $0x80000000,%esi
   18b0e:	29 ce                	sub    %ecx,%esi
   18b10:	89 c8                	mov    %ecx,%eax
   18b12:	44 09 e8             	or     %r13d,%eax
   18b15:	85 ff                	test   %edi,%edi
   18b17:	48 0f 49 f0          	cmovns %rax,%rsi
   18b1b:	b0 01                	mov    $0x1,%al
   18b1d:	39 f2                	cmp    %esi,%edx
   18b1f:	77 9a                	ja     18abb <<hyperinterval::float::F32Enclosure>::checked_pow+0xdb>
   18b21:	89 7c 24 2c          	mov    %edi,0x2c(%rsp)
   18b25:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18b2a:	be 00 00 00 80       	mov    $0x80000000,%esi
   18b2f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18b34:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   18b39:	e8 22 3b 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   18b3e:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18b43:	0f 84 6d ff ff ff    	je     18ab6 <<hyperinterval::float::F32Enclosure>::checked_pow+0xd6>
   18b49:	4c 89 64 24 20       	mov    %r12,0x20(%rsp)
   18b4e:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   18b53:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18b58:	be 00 00 00 80       	mov    $0x80000000,%esi
   18b5d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18b62:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
   18b67:	e8 f4 3a 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   18b6c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18b71:	0f 84 3f ff ff ff    	je     18ab6 <<hyperinterval::float::F32Enclosure>::checked_pow+0xd6>
   18b77:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   18b7b:	44 89 e0             	mov    %r12d,%eax
   18b7e:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18b83:	89 ca                	mov    %ecx,%edx
   18b85:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18b8b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18b90:	29 c6                	sub    %eax,%esi
   18b92:	44 09 e8             	or     %r13d,%eax
   18b95:	45 85 e4             	test   %r12d,%r12d
   18b98:	48 0f 49 f0          	cmovns %rax,%rsi
   18b9c:	89 d0                	mov    %edx,%eax
   18b9e:	44 09 e8             	or     %r13d,%eax
   18ba1:	41 29 d5             	sub    %edx,%r13d
   18ba4:	85 c9                	test   %ecx,%ecx
   18ba6:	4c 0f 49 e8          	cmovns %rax,%r13
   18baa:	b0 01                	mov    $0x1,%al
   18bac:	44 39 ee             	cmp    %r13d,%esi
   18baf:	0f 87 06 ff ff ff    	ja     18abb <<hyperinterval::float::F32Enclosure>::checked_pow+0xdb>
   18bb5:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
   18bba:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
   18bbe:	44 89 e2             	mov    %r12d,%edx
   18bc1:	e8 ba 54 00 00       	call   1e080 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   18bc6:	41 89 c5             	mov    %eax,%r13d
   18bc9:	41 89 d4             	mov    %edx,%r12d
   18bcc:	85 ed                	test   %ebp,%ebp
   18bce:	0f 95 c0             	setne  %al
   18bd1:	40 f6 c5 01          	test   $0x1,%bpl
   18bd5:	0f 94 c1             	sete   %cl
   18bd8:	84 c8                	test   %cl,%al
   18bda:	74 11                	je     18bed <<hyperinterval::float::F32Enclosure>::checked_pow+0x20d>
   18bdc:	44 89 ff             	mov    %r15d,%edi
   18bdf:	44 89 f6             	mov    %r14d,%esi
   18be2:	31 d2                	xor    %edx,%edx
   18be4:	e8 27 55 00 00       	call   1e110 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::signs>
   18be9:	a8 02                	test   $0x2,%al
   18beb:	75 13                	jne    18c00 <<hyperinterval::float::F32Enclosure>::checked_pow+0x220>
   18bed:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   18bf3:	44 89 6b 04          	mov    %r13d,0x4(%rbx)
   18bf7:	44 89 63 08          	mov    %r12d,0x8(%rbx)
   18bfb:	e9 cc fe ff ff       	jmp    18acc <<hyperinterval::float::F32Enclosure>::checked_pow+0xec>
   18c00:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18c05:	31 f6                	xor    %esi,%esi
   18c07:	31 d2                	xor    %edx,%edx
   18c09:	e8 42 17 00 00       	call   1a350 <<hyperinterval::float::F32Enclosure>::from_bits>
   18c0e:	8b 44 24 08          	mov    0x8(%rsp),%eax
   18c12:	83 f8 02             	cmp    $0x2,%eax
   18c15:	75 0a                	jne    18c21 <<hyperinterval::float::F32Enclosure>::checked_pow+0x241>
   18c17:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   18c1c:	e9 9a fe ff ff       	jmp    18abb <<hyperinterval::float::F32Enclosure>::checked_pow+0xdb>
   18c21:	83 f8 01             	cmp    $0x1,%eax
   18c24:	75 c7                	jne    18bed <<hyperinterval::float::F32Enclosure>::checked_pow+0x20d>
   18c26:	8b 54 24 0c          	mov    0xc(%rsp),%edx
   18c2a:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   18c2e:	44 89 ef             	mov    %r13d,%edi
   18c31:	44 89 e6             	mov    %r12d,%esi
   18c34:	e8 47 54 00 00       	call   1e080 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   18c39:	41 89 c5             	mov    %eax,%r13d
   18c3c:	41 89 d4             	mov    %edx,%r12d
   18c3f:	eb ac                	jmp    18bed <<hyperinterval::float::F32Enclosure>::checked_pow+0x20d>
   18c41:	cc                   	int3
   18c42:	cc                   	int3
   18c43:	cc                   	int3
   18c44:	cc                   	int3
   18c45:	cc                   	int3
   18c46:	cc                   	int3
   18c47:	cc                   	int3
   18c48:	cc                   	int3
   18c49:	cc                   	int3
   18c4a:	cc                   	int3
   18c4b:	cc                   	int3
   18c4c:	cc                   	int3
   18c4d:	cc                   	int3
   18c4e:	cc                   	int3
   18c4f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::corner_image:
   18c50:	55                   	push   %rbp
   18c51:	41 57                	push   %r15
   18c53:	41 56                	push   %r14
   18c55:	41 55                	push   %r13
   18c57:	41 54                	push   %r12
   18c59:	53                   	push   %rbx
   18c5a:	48 83 ec 58          	sub    $0x58,%rsp
   18c5e:	48 89 fb             	mov    %rdi,%rbx
   18c61:	f6 06 01             	testb  $0x1,(%rsi)
   18c64:	74 49                	je     18caf <<hyperinterval::float::F32Enclosure>::corner_image+0x5f>
   18c66:	f6 02 01             	testb  $0x1,(%rdx)
   18c69:	74 44                	je     18caf <<hyperinterval::float::F32Enclosure>::corner_image+0x5f>
   18c6b:	44 8b 62 04          	mov    0x4(%rdx),%r12d
   18c6f:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   18c73:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
   18c77:	8b 46 08             	mov    0x8(%rsi),%eax
   18c7a:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   18c7f:	84 c9                	test   %cl,%cl
   18c81:	74 37                	je     18cba <<hyperinterval::float::F32Enclosure>::corner_image+0x6a>
   18c83:	48 89 e7             	mov    %rsp,%rdi
   18c86:	be 00 00 00 80       	mov    $0x80000000,%esi
   18c8b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18c90:	4c 89 e9             	mov    %r13,%rcx
   18c93:	4d 89 e0             	mov    %r12,%r8
   18c96:	e8 b5 3c 00 00       	call   1c950 <<hyperinterval::ieee::Format>::div>
   18c9b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18c9f:	0f 84 bf 00 00 00    	je     18d64 <<hyperinterval::float::F32Enclosure>::corner_image+0x114>
   18ca5:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   18caa:	e9 ad 00 00 00       	jmp    18d5c <<hyperinterval::float::F32Enclosure>::corner_image+0x10c>
   18caf:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   18cb5:	e9 42 03 00 00       	jmp    18ffc <<hyperinterval::float::F32Enclosure>::corner_image+0x3ac>
   18cba:	44 89 e8             	mov    %r13d,%eax
   18cbd:	c1 e8 17             	shr    $0x17,%eax
   18cc0:	0f b6 d0             	movzbl %al,%edx
   18cc3:	44 89 ee             	mov    %r13d,%esi
   18cc6:	81 e6 ff ff 7f 00    	and    $0x7fffff,%esi
   18ccc:	31 c9                	xor    %ecx,%ecx
   18cce:	85 d2                	test   %edx,%edx
   18cd0:	0f 95 c1             	setne  %cl
   18cd3:	b8 01 00 00 00       	mov    $0x1,%eax
   18cd8:	0f 45 c2             	cmovne %edx,%eax
   18cdb:	c1 e1 17             	shl    $0x17,%ecx
   18cde:	48 09 f1             	or     %rsi,%rcx
   18ce1:	44 89 e2             	mov    %r12d,%edx
   18ce4:	c1 ea 17             	shr    $0x17,%edx
   18ce7:	0f b6 d2             	movzbl %dl,%edx
   18cea:	44 89 e6             	mov    %r12d,%esi
   18ced:	81 e6 ff ff 7f 00    	and    $0x7fffff,%esi
   18cf3:	8d ba d4 fe ff ff    	lea    -0x12c(%rdx),%edi
   18cf9:	45 31 c0             	xor    %r8d,%r8d
   18cfc:	85 d2                	test   %edx,%edx
   18cfe:	ba d5 fe ff ff       	mov    $0xfffffed5,%edx
   18d03:	0f 45 d7             	cmovne %edi,%edx
   18d06:	41 0f 95 c0          	setne  %r8b
   18d0a:	41 c1 e0 17          	shl    $0x17,%r8d
   18d0e:	49 09 f0             	or     %rsi,%r8
   18d11:	4c 0f af c1          	imul   %rcx,%r8
   18d15:	44 89 e9             	mov    %r13d,%ecx
   18d18:	44 31 e1             	xor    %r12d,%ecx
   18d1b:	01 c2                	add    %eax,%edx
   18d1d:	c1 e9 1f             	shr    $0x1f,%ecx
   18d20:	88 4c 24 14          	mov    %cl,0x14(%rsp)
   18d24:	4c 89 04 24          	mov    %r8,(%rsp)
   18d28:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   18d2f:	00 00 
   18d31:	89 54 24 10          	mov    %edx,0x10(%rsp)
   18d35:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   18d3a:	48 89 e1             	mov    %rsp,%rcx
   18d3d:	be 00 00 00 80       	mov    $0x80000000,%esi
   18d42:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18d47:	e8 14 50 00 00       	call   1dd60 <<hyperinterval::ieee::Format>::rounded>
   18d4c:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   18d51:	0f 84 54 02 00 00    	je     18fab <<hyperinterval::float::F32Enclosure>::corner_image+0x35b>
   18d57:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   18d5c:	88 43 04             	mov    %al,0x4(%rbx)
   18d5f:	e9 92 02 00 00       	jmp    18ff6 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a6>
   18d64:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18d68:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   18d6d:	48 89 e7             	mov    %rsp,%rdi
   18d70:	be 00 00 00 80       	mov    $0x80000000,%esi
   18d75:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18d7a:	e8 e1 38 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   18d7f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18d83:	0f 85 63 02 00 00    	jne    18fec <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   18d89:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   18d8e:	48 89 e7             	mov    %rsp,%rdi
   18d91:	be 00 00 00 80       	mov    $0x80000000,%esi
   18d96:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18d9b:	4c 89 f9             	mov    %r15,%rcx
   18d9e:	e8 bd 38 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   18da3:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18da7:	0f 85 3f 02 00 00    	jne    18fec <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   18dad:	8b 7c 24 08          	mov    0x8(%rsp),%edi
   18db1:	89 e8                	mov    %ebp,%eax
   18db3:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18db8:	89 f9                	mov    %edi,%ecx
   18dba:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18dc0:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18dc5:	29 c2                	sub    %eax,%edx
   18dc7:	be 00 00 00 80       	mov    $0x80000000,%esi
   18dcc:	09 f0                	or     %esi,%eax
   18dce:	85 ed                	test   %ebp,%ebp
   18dd0:	48 0f 49 d0          	cmovns %rax,%rdx
   18dd4:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18dd9:	29 c8                	sub    %ecx,%eax
   18ddb:	09 f1                	or     %esi,%ecx
   18ddd:	85 ff                	test   %edi,%edi
   18ddf:	48 0f 49 c1          	cmovns %rcx,%rax
   18de3:	41 b7 01             	mov    $0x1,%r15b
   18de6:	39 c2                	cmp    %eax,%edx
   18de8:	0f 87 04 02 00 00    	ja     18ff2 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a2>
   18dee:	89 7c 24 50          	mov    %edi,0x50(%rsp)
   18df2:	48 89 6c 24 28       	mov    %rbp,0x28(%rsp)
   18df7:	48 89 e7             	mov    %rsp,%rdi
   18dfa:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18dff:	4c 89 e9             	mov    %r13,%rcx
   18e02:	4d 89 f0             	mov    %r14,%r8
   18e05:	e8 46 3b 00 00       	call   1c950 <<hyperinterval::ieee::Format>::div>
   18e0a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18e0e:	0f 85 91 fe ff ff    	jne    18ca5 <<hyperinterval::float::F32Enclosure>::corner_image+0x55>
   18e14:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18e18:	44 8b 6c 24 10       	mov    0x10(%rsp),%r13d
   18e1d:	48 89 e7             	mov    %rsp,%rdi
   18e20:	be 00 00 00 80       	mov    $0x80000000,%esi
   18e25:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18e2a:	e8 31 38 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   18e2f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18e33:	0f 85 b3 01 00 00    	jne    18fec <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   18e39:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   18e3e:	48 89 e7             	mov    %rsp,%rdi
   18e41:	be 00 00 00 80       	mov    $0x80000000,%esi
   18e46:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18e4b:	4c 89 e9             	mov    %r13,%rcx
   18e4e:	e8 0d 38 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   18e53:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18e57:	0f 85 8f 01 00 00    	jne    18fec <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   18e5d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18e61:	89 e8                	mov    %ebp,%eax
   18e63:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18e68:	89 ca                	mov    %ecx,%edx
   18e6a:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18e70:	be 00 00 00 80       	mov    $0x80000000,%esi
   18e75:	29 c6                	sub    %eax,%esi
   18e77:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18e7c:	09 f8                	or     %edi,%eax
   18e7e:	85 ed                	test   %ebp,%ebp
   18e80:	48 0f 49 f0          	cmovns %rax,%rsi
   18e84:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18e89:	29 d0                	sub    %edx,%eax
   18e8b:	09 fa                	or     %edi,%edx
   18e8d:	85 c9                	test   %ecx,%ecx
   18e8f:	48 0f 49 c2          	cmovns %rdx,%rax
   18e93:	39 c6                	cmp    %eax,%esi
   18e95:	0f 87 57 01 00 00    	ja     18ff2 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a2>
   18e9b:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   18ea0:	8b 74 24 50          	mov    0x50(%rsp),%esi
   18ea4:	89 ea                	mov    %ebp,%edx
   18ea6:	e8 d5 51 00 00       	call   1e080 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   18eab:	89 c5                	mov    %eax,%ebp
   18ead:	41 89 d5             	mov    %edx,%r13d
   18eb0:	48 89 e7             	mov    %rsp,%rdi
   18eb3:	be 00 00 00 80       	mov    $0x80000000,%esi
   18eb8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18ebd:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   18ec2:	4d 89 e0             	mov    %r12,%r8
   18ec5:	e8 86 3a 00 00       	call   1c950 <<hyperinterval::ieee::Format>::div>
   18eca:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18ece:	0f 85 d1 fd ff ff    	jne    18ca5 <<hyperinterval::float::F32Enclosure>::corner_image+0x55>
   18ed4:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18ed8:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   18edd:	48 89 e7             	mov    %rsp,%rdi
   18ee0:	be 00 00 00 80       	mov    $0x80000000,%esi
   18ee5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18eea:	e8 71 37 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   18eef:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18ef3:	0f 85 f3 00 00 00    	jne    18fec <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   18ef9:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   18efe:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   18f03:	48 89 e7             	mov    %rsp,%rdi
   18f06:	be 00 00 00 80       	mov    $0x80000000,%esi
   18f0b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18f10:	4c 89 e1             	mov    %r12,%rcx
   18f13:	e8 48 37 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   18f18:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18f1c:	0f 85 ca 00 00 00    	jne    18fec <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   18f22:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18f26:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   18f2b:	89 d0                	mov    %edx,%eax
   18f2d:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18f32:	41 89 c8             	mov    %ecx,%r8d
   18f35:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18f3c:	be 00 00 00 80       	mov    $0x80000000,%esi
   18f41:	29 c6                	sub    %eax,%esi
   18f43:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18f48:	09 f8                	or     %edi,%eax
   18f4a:	85 d2                	test   %edx,%edx
   18f4c:	48 0f 49 f0          	cmovns %rax,%rsi
   18f50:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18f55:	44 29 c0             	sub    %r8d,%eax
   18f58:	41 09 f8             	or     %edi,%r8d
   18f5b:	85 c9                	test   %ecx,%ecx
   18f5d:	49 0f 49 c0          	cmovns %r8,%rax
   18f61:	39 c6                	cmp    %eax,%esi
   18f63:	0f 87 89 00 00 00    	ja     18ff2 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a2>
   18f69:	89 ef                	mov    %ebp,%edi
   18f6b:	44 89 ee             	mov    %r13d,%esi
   18f6e:	e8 0d 51 00 00       	call   1e080 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   18f73:	41 89 c5             	mov    %eax,%r13d
   18f76:	41 89 d4             	mov    %edx,%r12d
   18f79:	48 89 e7             	mov    %rsp,%rdi
   18f7c:	be 00 00 00 80       	mov    $0x80000000,%esi
   18f81:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18f86:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   18f8b:	4d 89 f0             	mov    %r14,%r8
   18f8e:	e8 bd 39 00 00       	call   1c950 <<hyperinterval::ieee::Format>::div>
   18f93:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18f97:	0f 85 08 fd ff ff    	jne    18ca5 <<hyperinterval::float::F32Enclosure>::corner_image+0x55>
   18f9d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18fa1:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   18fa6:	e9 62 02 00 00       	jmp    1920d <<hyperinterval::float::F32Enclosure>::corner_image+0x5bd>
   18fab:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   18faf:	44 8b 7c 24 40       	mov    0x40(%rsp),%r15d
   18fb4:	48 89 e7             	mov    %rsp,%rdi
   18fb7:	be 00 00 00 80       	mov    $0x80000000,%esi
   18fbc:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18fc1:	e8 9a 36 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   18fc6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18fca:	74 20                	je     18fec <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   18fcc:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   18fd1:	48 89 e7             	mov    %rsp,%rdi
   18fd4:	be 00 00 00 80       	mov    $0x80000000,%esi
   18fd9:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18fde:	4c 89 f9             	mov    %r15,%rcx
   18fe1:	e8 7a 36 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   18fe6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18fea:	75 1f                	jne    1900b <<hyperinterval::float::F32Enclosure>::corner_image+0x3bb>
   18fec:	44 0f b6 7c 24 01    	movzbl 0x1(%rsp),%r15d
   18ff2:	44 88 7b 04          	mov    %r15b,0x4(%rbx)
   18ff6:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18ffc:	48 83 c4 58          	add    $0x58,%rsp
   19000:	5b                   	pop    %rbx
   19001:	41 5c                	pop    %r12
   19003:	41 5d                	pop    %r13
   19005:	41 5e                	pop    %r14
   19007:	41 5f                	pop    %r15
   19009:	5d                   	pop    %rbp
   1900a:	c3                   	ret
   1900b:	8b 7c 24 08          	mov    0x8(%rsp),%edi
   1900f:	89 e8                	mov    %ebp,%eax
   19011:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19016:	89 f9                	mov    %edi,%ecx
   19018:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1901e:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19023:	29 c2                	sub    %eax,%edx
   19025:	be 00 00 00 80       	mov    $0x80000000,%esi
   1902a:	09 f0                	or     %esi,%eax
   1902c:	85 ed                	test   %ebp,%ebp
   1902e:	48 0f 49 d0          	cmovns %rax,%rdx
   19032:	b8 00 00 00 80       	mov    $0x80000000,%eax
   19037:	29 c8                	sub    %ecx,%eax
   19039:	09 f1                	or     %esi,%ecx
   1903b:	85 ff                	test   %edi,%edi
   1903d:	48 0f 49 c1          	cmovns %rcx,%rax
   19041:	41 b7 01             	mov    $0x1,%r15b
   19044:	39 c2                	cmp    %eax,%edx
   19046:	77 aa                	ja     18ff2 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a2>
   19048:	89 7c 24 28          	mov    %edi,0x28(%rsp)
   1904c:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   19051:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19056:	4c 89 e9             	mov    %r13,%rcx
   19059:	4d 89 f0             	mov    %r14,%r8
   1905c:	e8 2f 3d 00 00       	call   1cd90 <<hyperinterval::ieee::Format>::mul>
   19061:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   19066:	0f 85 eb fc ff ff    	jne    18d57 <<hyperinterval::float::F32Enclosure>::corner_image+0x107>
   1906c:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   19070:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
   19075:	48 89 e7             	mov    %rsp,%rdi
   19078:	be 00 00 00 80       	mov    $0x80000000,%esi
   1907d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19082:	e8 d9 35 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   19087:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1908b:	0f 85 5b ff ff ff    	jne    18fec <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   19091:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19096:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1909b:	48 89 e7             	mov    %rsp,%rdi
   1909e:	be 00 00 00 80       	mov    $0x80000000,%esi
   190a3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   190a8:	4c 89 e9             	mov    %r13,%rcx
   190ab:	e8 b0 35 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   190b0:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   190b4:	0f 85 32 ff ff ff    	jne    18fec <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   190ba:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   190be:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
   190c3:	89 d0                	mov    %edx,%eax
   190c5:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   190ca:	41 89 c8             	mov    %ecx,%r8d
   190cd:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   190d4:	be 00 00 00 80       	mov    $0x80000000,%esi
   190d9:	29 c6                	sub    %eax,%esi
   190db:	bf 00 00 00 80       	mov    $0x80000000,%edi
   190e0:	09 f8                	or     %edi,%eax
   190e2:	85 d2                	test   %edx,%edx
   190e4:	48 0f 49 f0          	cmovns %rax,%rsi
   190e8:	b8 00 00 00 80       	mov    $0x80000000,%eax
   190ed:	44 29 c0             	sub    %r8d,%eax
   190f0:	41 09 f8             	or     %edi,%r8d
   190f3:	85 c9                	test   %ecx,%ecx
   190f5:	49 0f 49 c0          	cmovns %r8,%rax
   190f9:	39 c6                	cmp    %eax,%esi
   190fb:	0f 87 f1 fe ff ff    	ja     18ff2 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a2>
   19101:	89 ef                	mov    %ebp,%edi
   19103:	8b 74 24 28          	mov    0x28(%rsp),%esi
   19107:	e8 74 4f 00 00       	call   1e080 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   1910c:	89 c5                	mov    %eax,%ebp
   1910e:	41 89 d5             	mov    %edx,%r13d
   19111:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   19116:	be 00 00 00 80       	mov    $0x80000000,%esi
   1911b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19120:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   19125:	4d 89 e0             	mov    %r12,%r8
   19128:	e8 63 3c 00 00       	call   1cd90 <<hyperinterval::ieee::Format>::mul>
   1912d:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   19132:	0f 85 1f fc ff ff    	jne    18d57 <<hyperinterval::float::F32Enclosure>::corner_image+0x107>
   19138:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   1913c:	44 8b 64 24 40       	mov    0x40(%rsp),%r12d
   19141:	48 89 e7             	mov    %rsp,%rdi
   19144:	be 00 00 00 80       	mov    $0x80000000,%esi
   19149:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1914e:	e8 0d 35 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   19153:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19157:	0f 85 8f fe ff ff    	jne    18fec <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   1915d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19162:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   19167:	48 89 e7             	mov    %rsp,%rdi
   1916a:	be 00 00 00 80       	mov    $0x80000000,%esi
   1916f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19174:	4c 89 e1             	mov    %r12,%rcx
   19177:	e8 e4 34 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1917c:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19180:	0f 85 66 fe ff ff    	jne    18fec <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   19186:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1918a:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   1918f:	89 d0                	mov    %edx,%eax
   19191:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19196:	41 89 c8             	mov    %ecx,%r8d
   19199:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   191a0:	be 00 00 00 80       	mov    $0x80000000,%esi
   191a5:	29 c6                	sub    %eax,%esi
   191a7:	bf 00 00 00 80       	mov    $0x80000000,%edi
   191ac:	09 f8                	or     %edi,%eax
   191ae:	85 d2                	test   %edx,%edx
   191b0:	48 0f 49 f0          	cmovns %rax,%rsi
   191b4:	b8 00 00 00 80       	mov    $0x80000000,%eax
   191b9:	44 29 c0             	sub    %r8d,%eax
   191bc:	41 09 f8             	or     %edi,%r8d
   191bf:	85 c9                	test   %ecx,%ecx
   191c1:	49 0f 49 c0          	cmovns %r8,%rax
   191c5:	39 c6                	cmp    %eax,%esi
   191c7:	0f 87 25 fe ff ff    	ja     18ff2 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a2>
   191cd:	89 ef                	mov    %ebp,%edi
   191cf:	44 89 ee             	mov    %r13d,%esi
   191d2:	e8 a9 4e 00 00       	call   1e080 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   191d7:	41 89 c5             	mov    %eax,%r13d
   191da:	41 89 d4             	mov    %edx,%r12d
   191dd:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   191e2:	be 00 00 00 80       	mov    $0x80000000,%esi
   191e7:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   191ec:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   191f1:	4d 89 f0             	mov    %r14,%r8
   191f4:	e8 97 3b 00 00       	call   1cd90 <<hyperinterval::ieee::Format>::mul>
   191f9:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   191fe:	0f 85 53 fb ff ff    	jne    18d57 <<hyperinterval::float::F32Enclosure>::corner_image+0x107>
   19204:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   19208:	44 8b 74 24 40       	mov    0x40(%rsp),%r14d
   1920d:	48 89 e7             	mov    %rsp,%rdi
   19210:	be 00 00 00 80       	mov    $0x80000000,%esi
   19215:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1921a:	e8 41 34 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1921f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19223:	0f 85 c3 fd ff ff    	jne    18fec <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   19229:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1922e:	48 89 e7             	mov    %rsp,%rdi
   19231:	be 00 00 00 80       	mov    $0x80000000,%esi
   19236:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1923b:	4c 89 f1             	mov    %r14,%rcx
   1923e:	e8 1d 34 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   19243:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19247:	0f 85 9f fd ff ff    	jne    18fec <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   1924d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   19251:	89 e8                	mov    %ebp,%eax
   19253:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19258:	89 ca                	mov    %ecx,%edx
   1925a:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19260:	be 00 00 00 80       	mov    $0x80000000,%esi
   19265:	29 c6                	sub    %eax,%esi
   19267:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1926c:	09 f8                	or     %edi,%eax
   1926e:	85 ed                	test   %ebp,%ebp
   19270:	48 0f 49 f0          	cmovns %rax,%rsi
   19274:	89 d0                	mov    %edx,%eax
   19276:	09 f8                	or     %edi,%eax
   19278:	29 d7                	sub    %edx,%edi
   1927a:	85 c9                	test   %ecx,%ecx
   1927c:	48 0f 49 f8          	cmovns %rax,%rdi
   19280:	39 fe                	cmp    %edi,%esi
   19282:	0f 87 6a fd ff ff    	ja     18ff2 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a2>
   19288:	44 89 ef             	mov    %r13d,%edi
   1928b:	44 89 e6             	mov    %r12d,%esi
   1928e:	89 ea                	mov    %ebp,%edx
   19290:	e8 eb 4d 00 00       	call   1e080 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   19295:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   1929b:	89 43 04             	mov    %eax,0x4(%rbx)
   1929e:	89 53 08             	mov    %edx,0x8(%rbx)
   192a1:	e9 56 fd ff ff       	jmp    18ffc <<hyperinterval::float::F32Enclosure>::corner_image+0x3ac>
   192a6:	cc                   	int3
   192a7:	cc                   	int3
   192a8:	cc                   	int3
   192a9:	cc                   	int3
   192aa:	cc                   	int3
   192ab:	cc                   	int3
   192ac:	cc                   	int3
   192ad:	cc                   	int3
   192ae:	cc                   	int3
   192af:	cc                   	int3

<hyperinterval::float::F32Enclosure>::intersection:
   192b0:	48 89 f8             	mov    %rdi,%rax
   192b3:	45 31 c9             	xor    %r9d,%r9d
   192b6:	f6 06 01             	testb  $0x1,(%rsi)
   192b9:	0f 84 ed 00 00 00    	je     193ac <<hyperinterval::float::F32Enclosure>::intersection+0xfc>
   192bf:	f6 02 01             	testb  $0x1,(%rdx)
   192c2:	0f 84 d9 00 00 00    	je     193a1 <<hyperinterval::float::F32Enclosure>::intersection+0xf1>
   192c8:	53                   	push   %rbx
   192c9:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   192cd:	8b 4e 04             	mov    0x4(%rsi),%ecx
   192d0:	bf 00 00 00 80       	mov    $0x80000000,%edi
   192d5:	41 89 c9             	mov    %ecx,%r9d
   192d8:	41 09 f9             	or     %edi,%r9d
   192db:	41 89 ca             	mov    %ecx,%r10d
   192de:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   192e5:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   192eb:	45 29 d3             	sub    %r10d,%r11d
   192ee:	85 c9                	test   %ecx,%ecx
   192f0:	4d 0f 49 d9          	cmovns %r9,%r11
   192f4:	45 89 c1             	mov    %r8d,%r9d
   192f7:	41 09 f9             	or     %edi,%r9d
   192fa:	45 89 c2             	mov    %r8d,%r10d
   192fd:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   19304:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   19309:	44 29 d3             	sub    %r10d,%ebx
   1930c:	45 85 c0             	test   %r8d,%r8d
   1930f:	49 0f 49 d9          	cmovns %r9,%rbx
   19313:	8b 52 08             	mov    0x8(%rdx),%edx
   19316:	41 39 db             	cmp    %ebx,%r11d
   19319:	41 0f 42 c8          	cmovb  %r8d,%ecx
   1931d:	44 8b 46 08          	mov    0x8(%rsi),%r8d
   19321:	44 89 c6             	mov    %r8d,%esi
   19324:	09 fe                	or     %edi,%esi
   19326:	45 89 c1             	mov    %r8d,%r9d
   19329:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   19330:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   19336:	45 29 ca             	sub    %r9d,%r10d
   19339:	45 85 c0             	test   %r8d,%r8d
   1933c:	4c 0f 49 d6          	cmovns %rsi,%r10
   19340:	89 d6                	mov    %edx,%esi
   19342:	09 fe                	or     %edi,%esi
   19344:	41 89 d1             	mov    %edx,%r9d
   19347:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1934e:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   19354:	45 29 cb             	sub    %r9d,%r11d
   19357:	85 d2                	test   %edx,%edx
   19359:	4c 0f 49 de          	cmovns %rsi,%r11
   1935d:	45 39 da             	cmp    %r11d,%r10d
   19360:	44 0f 47 c2          	cmova  %edx,%r8d
   19364:	89 ca                	mov    %ecx,%edx
   19366:	09 fa                	or     %edi,%edx
   19368:	89 ce                	mov    %ecx,%esi
   1936a:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   19370:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   19376:	41 29 f2             	sub    %esi,%r10d
   19379:	85 c9                	test   %ecx,%ecx
   1937b:	4c 0f 49 d2          	cmovns %rdx,%r10
   1937f:	44 89 c2             	mov    %r8d,%edx
   19382:	09 fa                	or     %edi,%edx
   19384:	44 89 c6             	mov    %r8d,%esi
   19387:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1938d:	29 f7                	sub    %esi,%edi
   1938f:	45 85 c0             	test   %r8d,%r8d
   19392:	48 0f 49 fa          	cmovns %rdx,%rdi
   19396:	45 31 c9             	xor    %r9d,%r9d
   19399:	41 39 fa             	cmp    %edi,%r10d
   1939c:	41 0f 96 c1          	setbe  %r9b
   193a0:	5b                   	pop    %rbx
   193a1:	44 89 08             	mov    %r9d,(%rax)
   193a4:	89 48 04             	mov    %ecx,0x4(%rax)
   193a7:	44 89 40 08          	mov    %r8d,0x8(%rax)
   193ab:	c3                   	ret
   193ac:	44 89 08             	mov    %r9d,(%rax)
   193af:	89 48 04             	mov    %ecx,0x4(%rax)
   193b2:	44 89 40 08          	mov    %r8d,0x8(%rax)
   193b6:	c3                   	ret
   193b7:	cc                   	int3
   193b8:	cc                   	int3
   193b9:	cc                   	int3
   193ba:	cc                   	int3
   193bb:	cc                   	int3
   193bc:	cc                   	int3
   193bd:	cc                   	int3
   193be:	cc                   	int3
   193bf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::contains_point:
   193c0:	41 56                	push   %r14
   193c2:	53                   	push   %rbx
   193c3:	48 83 ec 18          	sub    $0x18,%rsp
   193c7:	48 89 fb             	mov    %rdi,%rbx
   193ca:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   193d0:	66 0f 7e c1          	movd   %xmm0,%ecx
   193d4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   193d9:	be 00 00 00 80       	mov    $0x80000000,%esi
   193de:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   193e3:	e8 78 32 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   193e8:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   193ed:	3c 01                	cmp    $0x1,%al
   193ef:	75 0d                	jne    193fe <<hyperinterval::float::F32Enclosure>::contains_point+0x3e>
   193f1:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   193f6:	48 83 c4 18          	add    $0x18,%rsp
   193fa:	5b                   	pop    %rbx
   193fb:	41 5e                	pop    %r14
   193fd:	c3                   	ret
   193fe:	f6 03 01             	testb  $0x1,(%rbx)
   19401:	74 44                	je     19447 <<hyperinterval::float::F32Enclosure>::contains_point+0x87>
   19403:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   19408:	8b 73 04             	mov    0x4(%rbx),%esi
   1940b:	89 d1                	mov    %edx,%ecx
   1940d:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19413:	89 f7                	mov    %esi,%edi
   19415:	44 09 f7             	or     %r14d,%edi
   19418:	41 89 f0             	mov    %esi,%r8d
   1941b:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   19422:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   19428:	45 29 c1             	sub    %r8d,%r9d
   1942b:	85 f6                	test   %esi,%esi
   1942d:	4c 0f 49 cf          	cmovns %rdi,%r9
   19431:	be 00 00 00 80       	mov    $0x80000000,%esi
   19436:	48 29 ce             	sub    %rcx,%rsi
   19439:	4c 09 f1             	or     %r14,%rcx
   1943c:	85 d2                	test   %edx,%edx
   1943e:	48 0f 48 ce          	cmovs  %rsi,%rcx
   19442:	41 39 c9             	cmp    %ecx,%r9d
   19445:	76 0a                	jbe    19451 <<hyperinterval::float::F32Enclosure>::contains_point+0x91>
   19447:	31 d2                	xor    %edx,%edx
   19449:	48 83 c4 18          	add    $0x18,%rsp
   1944d:	5b                   	pop    %rbx
   1944e:	41 5e                	pop    %r14
   19450:	c3                   	ret
   19451:	8b 53 08             	mov    0x8(%rbx),%edx
   19454:	89 d6                	mov    %edx,%esi
   19456:	44 09 f6             	or     %r14d,%esi
   19459:	89 d7                	mov    %edx,%edi
   1945b:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   19461:	41 29 fe             	sub    %edi,%r14d
   19464:	85 d2                	test   %edx,%edx
   19466:	4c 0f 49 f6          	cmovns %rsi,%r14
   1946a:	44 39 f1             	cmp    %r14d,%ecx
   1946d:	0f 96 c2             	setbe  %dl
   19470:	48 83 c4 18          	add    $0x18,%rsp
   19474:	5b                   	pop    %rbx
   19475:	41 5e                	pop    %r14
   19477:	c3                   	ret
   19478:	cc                   	int3
   19479:	cc                   	int3
   1947a:	cc                   	int3
   1947b:	cc                   	int3
   1947c:	cc                   	int3
   1947d:	cc                   	int3
   1947e:	cc                   	int3
   1947f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::interior_subset_of:
   19480:	b0 01                	mov    $0x1,%al
   19482:	f6 07 01             	testb  $0x1,(%rdi)
   19485:	0f 84 8e 00 00 00    	je     19519 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x99>
   1948b:	f6 06 01             	testb  $0x1,(%rsi)
   1948e:	0f 84 83 00 00 00    	je     19517 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x97>
   19494:	8b 4f 04             	mov    0x4(%rdi),%ecx
   19497:	8b 56 04             	mov    0x4(%rsi),%edx
   1949a:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1949f:	44 8d 04 02          	lea    (%rdx,%rax,1),%r8d
   194a3:	41 89 d1             	mov    %edx,%r9d
   194a6:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   194ad:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   194b3:	45 29 ca             	sub    %r9d,%r10d
   194b6:	85 d2                	test   %edx,%edx
   194b8:	4d 0f 49 d0          	cmovns %r8,%r10
   194bc:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   194bf:	41 89 c8             	mov    %ecx,%r8d
   194c2:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   194c9:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   194cf:	45 29 c1             	sub    %r8d,%r9d
   194d2:	85 c9                	test   %ecx,%ecx
   194d4:	4c 0f 49 ca          	cmovns %rdx,%r9
   194d8:	45 39 ca             	cmp    %r9d,%r10d
   194db:	73 3a                	jae    19517 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x97>
   194dd:	8b 4f 08             	mov    0x8(%rdi),%ecx
   194e0:	8b 56 08             	mov    0x8(%rsi),%edx
   194e3:	8d 34 01             	lea    (%rcx,%rax,1),%esi
   194e6:	89 cf                	mov    %ecx,%edi
   194e8:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   194ee:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   194f4:	41 29 f8             	sub    %edi,%r8d
   194f7:	85 c9                	test   %ecx,%ecx
   194f9:	4c 0f 49 c6          	cmovns %rsi,%r8
   194fd:	8d 0c 02             	lea    (%rdx,%rax,1),%ecx
   19500:	89 d6                	mov    %edx,%esi
   19502:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   19508:	29 f0                	sub    %esi,%eax
   1950a:	85 d2                	test   %edx,%edx
   1950c:	48 0f 49 c1          	cmovns %rcx,%rax
   19510:	41 39 c0             	cmp    %eax,%r8d
   19513:	0f 92 c0             	setb   %al
   19516:	c3                   	ret
   19517:	31 c0                	xor    %eax,%eax
   19519:	c3                   	ret
   1951a:	cc                   	int3
   1951b:	cc                   	int3
   1951c:	cc                   	int3
   1951d:	cc                   	int3
   1951e:	cc                   	int3
   1951f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::abs:
   19520:	48 89 f8             	mov    %rdi,%rax
   19523:	f6 06 01             	testb  $0x1,(%rsi)
   19526:	74 24                	je     1954c <<hyperinterval::float::F32Enclosure>::abs+0x2c>
   19528:	8b 4e 04             	mov    0x4(%rsi),%ecx
   1952b:	85 c9                	test   %ecx,%ecx
   1952d:	0f 99 c2             	setns  %dl
   19530:	f7 c1 ff ff ff 7f    	test   $0x7fffffff,%ecx
   19536:	40 0f 94 c7          	sete   %dil
   1953a:	40 08 d7             	or     %dl,%dil
   1953d:	74 14                	je     19553 <<hyperinterval::float::F32Enclosure>::abs+0x33>
   1953f:	8b 4e 08             	mov    0x8(%rsi),%ecx
   19542:	89 48 08             	mov    %ecx,0x8(%rax)
   19545:	48 8b 0e             	mov    (%rsi),%rcx
   19548:	48 89 08             	mov    %rcx,(%rax)
   1954b:	c3                   	ret
   1954c:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   19552:	c3                   	ret
   19553:	8b 56 08             	mov    0x8(%rsi),%edx
   19556:	85 d2                	test   %edx,%edx
   19558:	40 0f 98 c7          	sets   %dil
   1955c:	48 89 d6             	mov    %rdx,%rsi
   1955f:	48 81 e6 ff ff ff 7f 	and    $0x7fffffff,%rsi
   19566:	41 0f 95 c0          	setne  %r8b
   1956a:	44 84 c7             	test   %r8b,%dil
   1956d:	74 19                	je     19588 <<hyperinterval::float::F32Enclosure>::abs+0x68>
   1956f:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19575:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1957b:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   19581:	89 50 04             	mov    %edx,0x4(%rax)
   19584:	89 48 08             	mov    %ecx,0x8(%rax)
   19587:	c3                   	ret
   19588:	89 cf                	mov    %ecx,%edi
   1958a:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   19590:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   19596:	46 8d 0c 02          	lea    (%rdx,%r8,1),%r9d
   1959a:	41 29 f0             	sub    %esi,%r8d
   1959d:	85 d2                	test   %edx,%edx
   1959f:	4d 0f 49 c1          	cmovns %r9,%r8
   195a3:	41 39 c8             	cmp    %ecx,%r8d
   195a6:	0f 43 fa             	cmovae %edx,%edi
   195a9:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   195b0:	89 78 08             	mov    %edi,0x8(%rax)
   195b3:	c3                   	ret
   195b4:	cc                   	int3
   195b5:	cc                   	int3
   195b6:	cc                   	int3
   195b7:	cc                   	int3
   195b8:	cc                   	int3
   195b9:	cc                   	int3
   195ba:	cc                   	int3
   195bb:	cc                   	int3
   195bc:	cc                   	int3
   195bd:	cc                   	int3
   195be:	cc                   	int3
   195bf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::add:
   195c0:	48 89 f8             	mov    %rdi,%rax
   195c3:	f6 06 01             	testb  $0x1,(%rsi)
   195c6:	0f 84 d6 00 00 00    	je     196a2 <<hyperinterval::float::F32Enclosure>::add+0xe2>
   195cc:	f6 02 01             	testb  $0x1,(%rdx)
   195cf:	0f 84 cd 00 00 00    	je     196a2 <<hyperinterval::float::F32Enclosure>::add+0xe2>
   195d5:	41 57                	push   %r15
   195d7:	41 56                	push   %r14
   195d9:	41 55                	push   %r13
   195db:	41 54                	push   %r12
   195dd:	53                   	push   %rbx
   195de:	48 83 ec 20          	sub    $0x20,%rsp
   195e2:	49 89 c4             	mov    %rax,%r12
   195e5:	8b 5e 08             	mov    0x8(%rsi),%ebx
   195e8:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   195ee:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   195f2:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   195f6:	8b 4e 04             	mov    0x4(%rsi),%ecx
   195f9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   195fe:	be 00 00 00 80       	mov    $0x80000000,%esi
   19603:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19608:	e8 93 30 00 00       	call   1c6a0 <<hyperinterval::ieee::Format>::add>
   1960d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19612:	74 6b                	je     1967f <<hyperinterval::float::F32Enclosure>::add+0xbf>
   19614:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   19619:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1961e:	be 00 00 00 80       	mov    $0x80000000,%esi
   19623:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19628:	48 89 d9             	mov    %rbx,%rcx
   1962b:	4d 89 f0             	mov    %r14,%r8
   1962e:	e8 6d 30 00 00       	call   1c6a0 <<hyperinterval::ieee::Format>::add>
   19633:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19638:	74 45                	je     1967f <<hyperinterval::float::F32Enclosure>::add+0xbf>
   1963a:	8b 5c 24 18          	mov    0x18(%rsp),%ebx
   1963e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19643:	be 00 00 00 80       	mov    $0x80000000,%esi
   19648:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1964d:	4c 89 f9             	mov    %r15,%rcx
   19650:	e8 0b 30 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   19655:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1965a:	74 23                	je     1967f <<hyperinterval::float::F32Enclosure>::add+0xbf>
   1965c:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   19661:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19666:	be 00 00 00 80       	mov    $0x80000000,%esi
   1966b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19670:	48 89 d9             	mov    %rbx,%rcx
   19673:	e8 e8 2f 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   19678:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1967d:	75 2a                	jne    196a9 <<hyperinterval::float::F32Enclosure>::add+0xe9>
   1967f:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   19684:	4c 89 e0             	mov    %r12,%rax
   19687:	41 88 4c 24 04       	mov    %cl,0x4(%r12)
   1968c:	41 c7 04 24 02 00 00 	movl   $0x2,(%r12)
   19693:	00 
   19694:	48 83 c4 20          	add    $0x20,%rsp
   19698:	5b                   	pop    %rbx
   19699:	41 5c                	pop    %r12
   1969b:	41 5d                	pop    %r13
   1969d:	41 5e                	pop    %r14
   1969f:	41 5f                	pop    %r15
   196a1:	c3                   	ret
   196a2:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   196a8:	c3                   	ret
   196a9:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   196ad:	44 89 f0             	mov    %r14d,%eax
   196b0:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   196b5:	89 ca                	mov    %ecx,%edx
   196b7:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   196bd:	be 00 00 00 80       	mov    $0x80000000,%esi
   196c2:	29 c6                	sub    %eax,%esi
   196c4:	44 09 e8             	or     %r13d,%eax
   196c7:	45 85 f6             	test   %r14d,%r14d
   196ca:	48 0f 49 f0          	cmovns %rax,%rsi
   196ce:	89 d0                	mov    %edx,%eax
   196d0:	44 09 e8             	or     %r13d,%eax
   196d3:	41 29 d5             	sub    %edx,%r13d
   196d6:	85 c9                	test   %ecx,%ecx
   196d8:	4c 0f 49 e8          	cmovns %rax,%r13
   196dc:	44 39 ee             	cmp    %r13d,%esi
   196df:	4c 89 e0             	mov    %r12,%rax
   196e2:	76 0c                	jbe    196f0 <<hyperinterval::float::F32Enclosure>::add+0x130>
   196e4:	c6 40 04 01          	movb   $0x1,0x4(%rax)
   196e8:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   196ee:	eb a4                	jmp    19694 <<hyperinterval::float::F32Enclosure>::add+0xd4>
   196f0:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   196f6:	44 89 70 04          	mov    %r14d,0x4(%rax)
   196fa:	89 48 08             	mov    %ecx,0x8(%rax)
   196fd:	eb 95                	jmp    19694 <<hyperinterval::float::F32Enclosure>::add+0xd4>
   196ff:	cc                   	int3

<hyperinterval::float::F32Enclosure>::div:
   19700:	53                   	push   %rbx
   19701:	48 89 fb             	mov    %rdi,%rbx
   19704:	83 3a 01             	cmpl   $0x1,(%rdx)
   19707:	75 1a                	jne    19723 <<hyperinterval::float::F32Enclosure>::div+0x23>
   19709:	83 7a 04 00          	cmpl   $0x0,0x4(%rdx)
   1970d:	7f 14                	jg     19723 <<hyperinterval::float::F32Enclosure>::div+0x23>
   1970f:	8b 42 08             	mov    0x8(%rdx),%eax
   19712:	85 c0                	test   %eax,%eax
   19714:	0f 99 c1             	setns  %cl
   19717:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   1971c:	0f 94 c0             	sete   %al
   1971f:	08 c8                	or     %cl,%al
   19721:	75 12                	jne    19735 <<hyperinterval::float::F32Enclosure>::div+0x35>
   19723:	48 89 df             	mov    %rbx,%rdi
   19726:	b9 01 00 00 00       	mov    $0x1,%ecx
   1972b:	e8 20 f5 ff ff       	call   18c50 <<hyperinterval::float::F32Enclosure>::corner_image>
   19730:	48 89 d8             	mov    %rbx,%rax
   19733:	5b                   	pop    %rbx
   19734:	c3                   	ret
   19735:	c6 43 04 06          	movb   $0x6,0x4(%rbx)
   19739:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1973f:	48 89 d8             	mov    %rbx,%rax
   19742:	5b                   	pop    %rbx
   19743:	c3                   	ret
   19744:	cc                   	int3
   19745:	cc                   	int3
   19746:	cc                   	int3
   19747:	cc                   	int3
   19748:	cc                   	int3
   19749:	cc                   	int3
   1974a:	cc                   	int3
   1974b:	cc                   	int3
   1974c:	cc                   	int3
   1974d:	cc                   	int3
   1974e:	cc                   	int3
   1974f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::new:
   19750:	41 57                	push   %r15
   19752:	41 56                	push   %r14
   19754:	53                   	push   %rbx
   19755:	48 83 ec 20          	sub    $0x20,%rsp
   19759:	f3 0f 11 4c 24 1c    	movss  %xmm1,0x1c(%rsp)
   1975f:	48 89 fb             	mov    %rdi,%rbx
   19762:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   19768:	66 0f 7e c1          	movd   %xmm0,%ecx
   1976c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19771:	be 00 00 00 80       	mov    $0x80000000,%esi
   19776:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1977b:	e8 e0 2e 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   19780:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19785:	74 2a                	je     197b1 <<hyperinterval::float::F32Enclosure>::new+0x61>
   19787:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1978c:	66 0f 6e 44 24 1c    	movd   0x1c(%rsp),%xmm0
   19792:	66 0f 7e c1          	movd   %xmm0,%ecx
   19796:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1979b:	be 00 00 00 80       	mov    $0x80000000,%esi
   197a0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   197a5:	e8 b6 2e 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   197aa:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   197af:	75 1b                	jne    197cc <<hyperinterval::float::F32Enclosure>::new+0x7c>
   197b1:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   197b6:	88 43 04             	mov    %al,0x4(%rbx)
   197b9:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   197bf:	48 89 d8             	mov    %rbx,%rax
   197c2:	48 83 c4 20          	add    $0x20,%rsp
   197c6:	5b                   	pop    %rbx
   197c7:	41 5e                	pop    %r14
   197c9:	41 5f                	pop    %r15
   197cb:	c3                   	ret
   197cc:	8b 44 24 10          	mov    0x10(%rsp),%eax
   197d0:	44 89 f9             	mov    %r15d,%ecx
   197d3:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   197d9:	89 c2                	mov    %eax,%edx
   197db:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   197e1:	be 00 00 00 80       	mov    $0x80000000,%esi
   197e6:	29 ce                	sub    %ecx,%esi
   197e8:	44 09 f1             	or     %r14d,%ecx
   197eb:	45 85 ff             	test   %r15d,%r15d
   197ee:	48 0f 49 f1          	cmovns %rcx,%rsi
   197f2:	89 d1                	mov    %edx,%ecx
   197f4:	44 09 f1             	or     %r14d,%ecx
   197f7:	41 29 d6             	sub    %edx,%r14d
   197fa:	85 c0                	test   %eax,%eax
   197fc:	4c 0f 49 f1          	cmovns %rcx,%r14
   19800:	44 39 f6             	cmp    %r14d,%esi
   19803:	76 06                	jbe    1980b <<hyperinterval::float::F32Enclosure>::new+0xbb>
   19805:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   19809:	eb ae                	jmp    197b9 <<hyperinterval::float::F32Enclosure>::new+0x69>
   1980b:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   19811:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
   19815:	89 43 08             	mov    %eax,0x8(%rbx)
   19818:	eb a5                	jmp    197bf <<hyperinterval::float::F32Enclosure>::new+0x6f>
   1981a:	cc                   	int3
   1981b:	cc                   	int3
   1981c:	cc                   	int3
   1981d:	cc                   	int3
   1981e:	cc                   	int3
   1981f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::sub:
   19820:	53                   	push   %rbx
   19821:	48 83 ec 10          	sub    $0x10,%rsp
   19825:	48 89 fb             	mov    %rdi,%rbx
   19828:	f6 02 01             	testb  $0x1,(%rdx)
   1982b:	74 29                	je     19856 <<hyperinterval::float::F32Enclosure>::sub+0x36>
   1982d:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   19832:	66 0f ef c9          	pxor   %xmm1,%xmm1
   19836:	66 0f 6f 15 82 c4 fe 	movdqa -0x13b7e(%rip),%xmm2        # 5cc0 <__abi_tag+0x59c4>
   1983d:	ff 
   1983e:	66 0f ef d0          	pxor   %xmm0,%xmm2
   19842:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   19846:	66 0f df ca          	pandn  %xmm2,%xmm1
   1984a:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   1984f:	b8 01 00 00 00       	mov    $0x1,%eax
   19854:	eb 02                	jmp    19858 <<hyperinterval::float::F32Enclosure>::sub+0x38>
   19856:	31 c0                	xor    %eax,%eax
   19858:	89 44 24 04          	mov    %eax,0x4(%rsp)
   1985c:	66 0f d6 44 24 08    	movq   %xmm0,0x8(%rsp)
   19862:	48 8d 54 24 04       	lea    0x4(%rsp),%rdx
   19867:	48 89 df             	mov    %rbx,%rdi
   1986a:	ff 15 e8 3d 04 00    	call   *0x43de8(%rip)        # 5d658 <_DYNAMIC+0x2d0>
   19870:	48 89 d8             	mov    %rbx,%rax
   19873:	48 83 c4 10          	add    $0x10,%rsp
   19877:	5b                   	pop    %rbx
   19878:	c3                   	ret
   19879:	cc                   	int3
   1987a:	cc                   	int3
   1987b:	cc                   	int3
   1987c:	cc                   	int3
   1987d:	cc                   	int3
   1987e:	cc                   	int3
   1987f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::hull:
   19880:	48 89 f8             	mov    %rdi,%rax
   19883:	44 8b 0e             	mov    (%rsi),%r9d
   19886:	44 8b 02             	mov    (%rdx),%r8d
   19889:	8b 7a 04             	mov    0x4(%rdx),%edi
   1988c:	8b 4a 08             	mov    0x8(%rdx),%ecx
   1988f:	41 f6 c1 01          	test   $0x1,%r9b
   19893:	0f 84 9b 00 00 00    	je     19934 <<hyperinterval::float::F32Enclosure>::hull+0xb4>
   19899:	8b 56 04             	mov    0x4(%rsi),%edx
   1989c:	8b 76 08             	mov    0x8(%rsi),%esi
   1989f:	41 f6 c0 01          	test   $0x1,%r8b
   198a3:	0f 84 95 00 00 00    	je     1993e <<hyperinterval::float::F32Enclosure>::hull+0xbe>
   198a9:	53                   	push   %rbx
   198aa:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   198b0:	46 8d 0c 02          	lea    (%rdx,%r8,1),%r9d
   198b4:	41 89 d2             	mov    %edx,%r10d
   198b7:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   198be:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   198c4:	45 29 d3             	sub    %r10d,%r11d
   198c7:	85 d2                	test   %edx,%edx
   198c9:	4d 0f 49 d9          	cmovns %r9,%r11
   198cd:	46 8d 0c 07          	lea    (%rdi,%r8,1),%r9d
   198d1:	41 89 fa             	mov    %edi,%r10d
   198d4:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   198db:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   198e0:	44 29 d3             	sub    %r10d,%ebx
   198e3:	85 ff                	test   %edi,%edi
   198e5:	49 0f 49 d9          	cmovns %r9,%rbx
   198e9:	41 39 db             	cmp    %ebx,%r11d
   198ec:	0f 47 d7             	cmova  %edi,%edx
   198ef:	42 8d 3c 06          	lea    (%rsi,%r8,1),%edi
   198f3:	41 89 f1             	mov    %esi,%r9d
   198f6:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   198fd:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   19903:	45 29 ca             	sub    %r9d,%r10d
   19906:	85 f6                	test   %esi,%esi
   19908:	4c 0f 49 d7          	cmovns %rdi,%r10
   1990c:	42 8d 3c 01          	lea    (%rcx,%r8,1),%edi
   19910:	41 89 c9             	mov    %ecx,%r9d
   19913:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1991a:	45 29 c8             	sub    %r9d,%r8d
   1991d:	85 c9                	test   %ecx,%ecx
   1991f:	4c 0f 49 c7          	cmovns %rdi,%r8
   19923:	45 39 c2             	cmp    %r8d,%r10d
   19926:	0f 42 f1             	cmovb  %ecx,%esi
   19929:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1992f:	89 f1                	mov    %esi,%ecx
   19931:	89 d7                	mov    %edx,%edi
   19933:	5b                   	pop    %rbx
   19934:	44 89 00             	mov    %r8d,(%rax)
   19937:	89 78 04             	mov    %edi,0x4(%rax)
   1993a:	89 48 08             	mov    %ecx,0x8(%rax)
   1993d:	c3                   	ret
   1993e:	89 f1                	mov    %esi,%ecx
   19940:	89 d7                	mov    %edx,%edi
   19942:	45 89 c8             	mov    %r9d,%r8d
   19945:	44 89 00             	mov    %r8d,(%rax)
   19948:	89 78 04             	mov    %edi,0x4(%rax)
   1994b:	89 48 08             	mov    %ecx,0x8(%rax)
   1994e:	c3                   	ret
   1994f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::sqrt:
   19950:	48 89 f8             	mov    %rdi,%rax
   19953:	f6 06 01             	testb  $0x1,(%rsi)
   19956:	74 2c                	je     19984 <<hyperinterval::float::F32Enclosure>::sqrt+0x34>
   19958:	55                   	push   %rbp
   19959:	41 57                	push   %r15
   1995b:	41 56                	push   %r14
   1995d:	41 55                	push   %r13
   1995f:	41 54                	push   %r12
   19961:	53                   	push   %rbx
   19962:	48 83 ec 18          	sub    $0x18,%rsp
   19966:	8b 5e 08             	mov    0x8(%rsi),%ebx
   19969:	85 db                	test   %ebx,%ebx
   1996b:	0f 98 c1             	sets   %cl
   1996e:	f7 c3 ff ff ff 7f    	test   $0x7fffffff,%ebx
   19974:	0f 95 c2             	setne  %dl
   19977:	84 d1                	test   %dl,%cl
   19979:	74 14                	je     1998f <<hyperinterval::float::F32Enclosure>::sqrt+0x3f>
   1997b:	c6 40 04 07          	movb   $0x7,0x4(%rax)
   1997f:	e9 ce 00 00 00       	jmp    19a52 <<hyperinterval::float::F32Enclosure>::sqrt+0x102>
   19984:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   1998a:	c6 40 0c 00          	movb   $0x0,0xc(%rax)
   1998e:	c3                   	ret
   1998f:	49 89 c7             	mov    %rax,%r15
   19992:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
   19996:	41 bc 00 00 00 80    	mov    $0x80000000,%r12d
   1999c:	45 85 ed             	test   %r13d,%r13d
   1999f:	0f 98 c0             	sets   %al
   199a2:	41 f7 c5 ff ff ff 7f 	test   $0x7fffffff,%r13d
   199a9:	40 0f 95 c5          	setne  %bpl
   199ad:	31 c9                	xor    %ecx,%ecx
   199af:	40 20 c5             	and    %al,%bpl
   199b2:	49 0f 44 cd          	cmove  %r13,%rcx
   199b6:	48 89 e7             	mov    %rsp,%rdi
   199b9:	be 00 00 00 80       	mov    $0x80000000,%esi
   199be:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   199c3:	e8 98 34 00 00       	call   1ce60 <<hyperinterval::ieee::Format>::sqrt>
   199c8:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   199cc:	74 15                	je     199e3 <<hyperinterval::float::F32Enclosure>::sqrt+0x93>
   199ce:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   199d3:	4c 89 f8             	mov    %r15,%rax
   199d6:	41 88 4f 04          	mov    %cl,0x4(%r15)
   199da:	41 c7 07 02 00 00 00 	movl   $0x2,(%r15)
   199e1:	eb 75                	jmp    19a58 <<hyperinterval::float::F32Enclosure>::sqrt+0x108>
   199e3:	44 8b 74 24 08       	mov    0x8(%rsp),%r14d
   199e8:	41 39 dd             	cmp    %ebx,%r13d
   199eb:	74 1b                	je     19a08 <<hyperinterval::float::F32Enclosure>::sqrt+0xb8>
   199ed:	48 89 e7             	mov    %rsp,%rdi
   199f0:	be 00 00 00 80       	mov    $0x80000000,%esi
   199f5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   199fa:	48 89 d9             	mov    %rbx,%rcx
   199fd:	e8 5e 34 00 00       	call   1ce60 <<hyperinterval::ieee::Format>::sqrt>
   19a02:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19a06:	74 c6                	je     199ce <<hyperinterval::float::F32Enclosure>::sqrt+0x7e>
   19a08:	8b 5c 24 10          	mov    0x10(%rsp),%ebx
   19a0c:	48 89 e7             	mov    %rsp,%rdi
   19a0f:	be 00 00 00 80       	mov    $0x80000000,%esi
   19a14:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19a19:	4c 89 f1             	mov    %r14,%rcx
   19a1c:	e8 3f 2c 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   19a21:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19a25:	74 20                	je     19a47 <<hyperinterval::float::F32Enclosure>::sqrt+0xf7>
   19a27:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   19a2c:	48 89 e7             	mov    %rsp,%rdi
   19a2f:	be 00 00 00 80       	mov    $0x80000000,%esi
   19a34:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19a39:	48 89 d9             	mov    %rbx,%rcx
   19a3c:	e8 1f 2c 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   19a41:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19a45:	75 20                	jne    19a67 <<hyperinterval::float::F32Enclosure>::sqrt+0x117>
   19a47:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   19a4c:	4c 89 f8             	mov    %r15,%rax
   19a4f:	88 50 04             	mov    %dl,0x4(%rax)
   19a52:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   19a58:	48 83 c4 18          	add    $0x18,%rsp
   19a5c:	5b                   	pop    %rbx
   19a5d:	41 5c                	pop    %r12
   19a5f:	41 5d                	pop    %r13
   19a61:	41 5e                	pop    %r14
   19a63:	41 5f                	pop    %r15
   19a65:	5d                   	pop    %rbp
   19a66:	c3                   	ret
   19a67:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   19a6b:	44 89 f0             	mov    %r14d,%eax
   19a6e:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19a73:	89 ca                	mov    %ecx,%edx
   19a75:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19a7b:	be 00 00 00 80       	mov    $0x80000000,%esi
   19a80:	29 c6                	sub    %eax,%esi
   19a82:	44 09 e0             	or     %r12d,%eax
   19a85:	45 85 f6             	test   %r14d,%r14d
   19a88:	48 0f 49 f0          	cmovns %rax,%rsi
   19a8c:	89 d0                	mov    %edx,%eax
   19a8e:	44 09 e0             	or     %r12d,%eax
   19a91:	41 29 d4             	sub    %edx,%r12d
   19a94:	85 c9                	test   %ecx,%ecx
   19a96:	4c 0f 49 e0          	cmovns %rax,%r12
   19a9a:	b2 01                	mov    $0x1,%dl
   19a9c:	44 39 e6             	cmp    %r12d,%esi
   19a9f:	4c 89 f8             	mov    %r15,%rax
   19aa2:	77 ab                	ja     19a4f <<hyperinterval::float::F32Enclosure>::sqrt+0xff>
   19aa4:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   19aaa:	44 89 70 04          	mov    %r14d,0x4(%rax)
   19aae:	89 48 08             	mov    %ecx,0x8(%rax)
   19ab1:	40 88 68 0c          	mov    %bpl,0xc(%rax)
   19ab5:	eb a1                	jmp    19a58 <<hyperinterval::float::F32Enclosure>::sqrt+0x108>
   19ab7:	cc                   	int3
   19ab8:	cc                   	int3
   19ab9:	cc                   	int3
   19aba:	cc                   	int3
   19abb:	cc                   	int3
   19abc:	cc                   	int3
   19abd:	cc                   	int3
   19abe:	cc                   	int3
   19abf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::point:
   19ac0:	53                   	push   %rbx
   19ac1:	48 83 ec 10          	sub    $0x10,%rsp
   19ac5:	48 89 fb             	mov    %rdi,%rbx
   19ac8:	66 0f 7e c1          	movd   %xmm0,%ecx
   19acc:	48 89 e7             	mov    %rsp,%rdi
   19acf:	be 00 00 00 80       	mov    $0x80000000,%esi
   19ad4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19ad9:	e8 82 2b 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   19ade:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19ae2:	75 0f                	jne    19af3 <<hyperinterval::float::F32Enclosure>::point+0x33>
   19ae4:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   19ae9:	88 43 04             	mov    %al,0x4(%rbx)
   19aec:	b8 02 00 00 00       	mov    $0x2,%eax
   19af1:	eb 0f                	jmp    19b02 <<hyperinterval::float::F32Enclosure>::point+0x42>
   19af3:	8b 44 24 08          	mov    0x8(%rsp),%eax
   19af7:	89 43 04             	mov    %eax,0x4(%rbx)
   19afa:	89 43 08             	mov    %eax,0x8(%rbx)
   19afd:	b8 01 00 00 00       	mov    $0x1,%eax
   19b02:	89 03                	mov    %eax,(%rbx)
   19b04:	48 89 d8             	mov    %rbx,%rax
   19b07:	48 83 c4 10          	add    $0x10,%rsp
   19b0b:	5b                   	pop    %rbx
   19b0c:	c3                   	ret
   19b0d:	cc                   	int3
   19b0e:	cc                   	int3
   19b0f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::signs:
   19b10:	83 3f 01             	cmpl   $0x1,(%rdi)
   19b13:	75 65                	jne    19b7a <<hyperinterval::float::F32Enclosure>::signs+0x6a>
   19b15:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   19b1a:	8b 57 04             	mov    0x4(%rdi),%edx
   19b1d:	8b 47 08             	mov    0x8(%rdi),%eax
   19b20:	48 89 d6             	mov    %rdx,%rsi
   19b23:	48 09 ce             	or     %rcx,%rsi
   19b26:	41 89 d0             	mov    %edx,%r8d
   19b29:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   19b30:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19b35:	4c 29 c7             	sub    %r8,%rdi
   19b38:	85 d2                	test   %edx,%edx
   19b3a:	48 0f 49 fe          	cmovns %rsi,%rdi
   19b3e:	31 f6                	xor    %esi,%esi
   19b40:	f7 c7 00 00 00 80    	test   $0x80000000,%edi
   19b46:	0f 94 c2             	sete   %dl
   19b49:	48 39 cf             	cmp    %rcx,%rdi
   19b4c:	77 1d                	ja     19b6b <<hyperinterval::float::F32Enclosure>::signs+0x5b>
   19b4e:	39 cf                	cmp    %ecx,%edi
   19b50:	0f 92 c1             	setb   %cl
   19b53:	80 c9 02             	or     $0x2,%cl
   19b56:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   19b5b:	0f b6 c9             	movzbl %cl,%ecx
   19b5e:	40 88 d6             	mov    %dl,%sil
   19b61:	0f 44 f1             	cmove  %ecx,%esi
   19b64:	85 c0                	test   %eax,%eax
   19b66:	0f 49 f1             	cmovns %ecx,%esi
   19b69:	89 f2                	mov    %esi,%edx
   19b6b:	8d 4a 04             	lea    0x4(%rdx),%ecx
   19b6e:	85 c0                	test   %eax,%eax
   19b70:	0f b6 d2             	movzbl %dl,%edx
   19b73:	0f b6 c1             	movzbl %cl,%eax
   19b76:	0f 4e c2             	cmovle %edx,%eax
   19b79:	c3                   	ret
   19b7a:	31 c0                	xor    %eax,%eax
   19b7c:	c3                   	ret
   19b7d:	cc                   	int3
   19b7e:	cc                   	int3
   19b7f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::affine:
   19b80:	55                   	push   %rbp
   19b81:	41 57                	push   %r15
   19b83:	41 56                	push   %r14
   19b85:	41 55                	push   %r13
   19b87:	41 54                	push   %r12
   19b89:	53                   	push   %rbx
   19b8a:	48 83 ec 28          	sub    $0x28,%rsp
   19b8e:	f3 0f 11 4c 24 20    	movss  %xmm1,0x20(%rsp)
   19b94:	49 89 f7             	mov    %rsi,%r15
   19b97:	48 89 fb             	mov    %rdi,%rbx
   19b9a:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   19ba0:	66 0f 7e c1          	movd   %xmm0,%ecx
   19ba4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19ba9:	be 00 00 00 80       	mov    $0x80000000,%esi
   19bae:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19bb3:	e8 a8 2a 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   19bb8:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19bbd:	74 2a                	je     19be9 <<hyperinterval::float::F32Enclosure>::affine+0x69>
   19bbf:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   19bc4:	66 0f 6e 44 24 20    	movd   0x20(%rsp),%xmm0
   19bca:	66 0f 7e c1          	movd   %xmm0,%ecx
   19bce:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19bd3:	be 00 00 00 80       	mov    $0x80000000,%esi
   19bd8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19bdd:	e8 7e 2a 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   19be2:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19be7:	75 20                	jne    19c09 <<hyperinterval::float::F32Enclosure>::affine+0x89>
   19be9:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   19bee:	88 43 04             	mov    %al,0x4(%rbx)
   19bf1:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19bf7:	48 89 d8             	mov    %rbx,%rax
   19bfa:	48 83 c4 28          	add    $0x28,%rsp
   19bfe:	5b                   	pop    %rbx
   19bff:	41 5c                	pop    %r12
   19c01:	41 5d                	pop    %r13
   19c03:	41 5e                	pop    %r14
   19c05:	41 5f                	pop    %r15
   19c07:	5d                   	pop    %rbp
   19c08:	c3                   	ret
   19c09:	41 f6 07 01          	testb  $0x1,(%r15)
   19c0d:	0f 84 19 01 00 00    	je     19d2c <<hyperinterval::float::F32Enclosure>::affine+0x1ac>
   19c13:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   19c18:	41 8b 4f 04          	mov    0x4(%r15),%ecx
   19c1c:	45 8b 7f 08          	mov    0x8(%r15),%r15d
   19c20:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19c25:	be 00 00 00 80       	mov    $0x80000000,%esi
   19c2a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19c2f:	4d 89 f0             	mov    %r14,%r8
   19c32:	4d 89 e1             	mov    %r12,%r9
   19c35:	e8 36 3d 00 00       	call   1d970 <<hyperinterval::ieee::Format>::affine>
   19c3a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19c3f:	74 a8                	je     19be9 <<hyperinterval::float::F32Enclosure>::affine+0x69>
   19c41:	8b 6c 24 10          	mov    0x10(%rsp),%ebp
   19c45:	8b 44 24 18          	mov    0x18(%rsp),%eax
   19c49:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   19c4e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19c53:	be 00 00 00 80       	mov    $0x80000000,%esi
   19c58:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19c5d:	4c 89 f9             	mov    %r15,%rcx
   19c60:	4d 89 f0             	mov    %r14,%r8
   19c63:	4d 89 e1             	mov    %r12,%r9
   19c66:	e8 05 3d 00 00       	call   1d970 <<hyperinterval::ieee::Format>::affine>
   19c6b:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19c70:	0f 84 73 ff ff ff    	je     19be9 <<hyperinterval::float::F32Enclosure>::affine+0x69>
   19c76:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   19c7b:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
   19c80:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19c85:	be 00 00 00 80       	mov    $0x80000000,%esi
   19c8a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19c8f:	48 89 e9             	mov    %rbp,%rcx
   19c92:	e8 c9 29 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   19c97:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19c9c:	0f 84 47 ff ff ff    	je     19be9 <<hyperinterval::float::F32Enclosure>::affine+0x69>
   19ca2:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   19ca7:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19cac:	be 00 00 00 80       	mov    $0x80000000,%esi
   19cb1:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19cb6:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   19cbb:	e8 a0 29 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   19cc0:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19cc5:	0f 84 1e ff ff ff    	je     19be9 <<hyperinterval::float::F32Enclosure>::affine+0x69>
   19ccb:	8b 6c 24 10          	mov    0x10(%rsp),%ebp
   19ccf:	44 89 f0             	mov    %r14d,%eax
   19cd2:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19cd7:	89 e9                	mov    %ebp,%ecx
   19cd9:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19cdf:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19ce4:	29 c2                	sub    %eax,%edx
   19ce6:	44 09 e8             	or     %r13d,%eax
   19ce9:	45 85 f6             	test   %r14d,%r14d
   19cec:	48 0f 49 d0          	cmovns %rax,%rdx
   19cf0:	89 c8                	mov    %ecx,%eax
   19cf2:	44 09 e8             	or     %r13d,%eax
   19cf5:	41 29 cd             	sub    %ecx,%r13d
   19cf8:	85 ed                	test   %ebp,%ebp
   19cfa:	4c 0f 49 e8          	cmovns %rax,%r13
   19cfe:	b0 01                	mov    $0x1,%al
   19d00:	44 39 ea             	cmp    %r13d,%edx
   19d03:	0f 87 e5 fe ff ff    	ja     19bee <<hyperinterval::float::F32Enclosure>::affine+0x6e>
   19d09:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19d0e:	4c 89 fe             	mov    %r15,%rsi
   19d11:	4c 89 e2             	mov    %r12,%rdx
   19d14:	e8 37 06 00 00       	call   1a350 <<hyperinterval::float::F32Enclosure>::from_bits>
   19d19:	8b 44 24 08          	mov    0x8(%rsp),%eax
   19d1d:	83 f8 02             	cmp    $0x2,%eax
   19d20:	75 15                	jne    19d37 <<hyperinterval::float::F32Enclosure>::affine+0x1b7>
   19d22:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   19d27:	e9 c2 fe ff ff       	jmp    19bee <<hyperinterval::float::F32Enclosure>::affine+0x6e>
   19d2c:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   19d32:	e9 c0 fe ff ff       	jmp    19bf7 <<hyperinterval::float::F32Enclosure>::affine+0x77>
   19d37:	83 f8 01             	cmp    $0x1,%eax
   19d3a:	75 17                	jne    19d53 <<hyperinterval::float::F32Enclosure>::affine+0x1d3>
   19d3c:	8b 54 24 0c          	mov    0xc(%rsp),%edx
   19d40:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   19d44:	44 89 f7             	mov    %r14d,%edi
   19d47:	89 ee                	mov    %ebp,%esi
   19d49:	e8 32 43 00 00       	call   1e080 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   19d4e:	41 89 c6             	mov    %eax,%r14d
   19d51:	89 d5                	mov    %edx,%ebp
   19d53:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   19d59:	44 89 73 04          	mov    %r14d,0x4(%rbx)
   19d5d:	89 6b 08             	mov    %ebp,0x8(%rbx)
   19d60:	e9 92 fe ff ff       	jmp    19bf7 <<hyperinterval::float::F32Enclosure>::affine+0x77>
   19d65:	cc                   	int3
   19d66:	cc                   	int3
   19d67:	cc                   	int3
   19d68:	cc                   	int3
   19d69:	cc                   	int3
   19d6a:	cc                   	int3
   19d6b:	cc                   	int3
   19d6c:	cc                   	int3
   19d6d:	cc                   	int3
   19d6e:	cc                   	int3
   19d6f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::square:
   19d70:	55                   	push   %rbp
   19d71:	41 57                	push   %r15
   19d73:	41 56                	push   %r14
   19d75:	41 55                	push   %r13
   19d77:	41 54                	push   %r12
   19d79:	53                   	push   %rbx
   19d7a:	48 83 ec 48          	sub    $0x48,%rsp
   19d7e:	48 89 fb             	mov    %rdi,%rbx
   19d81:	f6 06 01             	testb  $0x1,(%rsi)
   19d84:	0f 84 d8 00 00 00    	je     19e62 <<hyperinterval::float::F32Enclosure>::square+0xf2>
   19d8a:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
   19d8e:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   19d92:	44 89 f8             	mov    %r15d,%eax
   19d95:	c1 e8 17             	shr    $0x17,%eax
   19d98:	0f b6 c8             	movzbl %al,%ecx
   19d9b:	44 89 fa             	mov    %r15d,%edx
   19d9e:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
   19da4:	31 c0                	xor    %eax,%eax
   19da6:	85 c9                	test   %ecx,%ecx
   19da8:	8d 8c 09 d4 fe ff ff 	lea    -0x12c(%rcx,%rcx,1),%ecx
   19daf:	41 bc d6 fe ff ff    	mov    $0xfffffed6,%r12d
   19db5:	41 0f 44 cc          	cmove  %r12d,%ecx
   19db9:	0f 95 c0             	setne  %al
   19dbc:	c1 e0 17             	shl    $0x17,%eax
   19dbf:	48 09 d0             	or     %rdx,%rax
   19dc2:	48 f7 e0             	mul    %rax
   19dc5:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   19dca:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   19dcf:	48 89 04 24          	mov    %rax,(%rsp)
   19dd3:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   19dd7:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   19ddc:	48 89 e1             	mov    %rsp,%rcx
   19ddf:	be 00 00 00 80       	mov    $0x80000000,%esi
   19de4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19de9:	e8 72 3f 00 00       	call   1dd60 <<hyperinterval::ieee::Format>::rounded>
   19dee:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   19df3:	75 66                	jne    19e5b <<hyperinterval::float::F32Enclosure>::square+0xeb>
   19df5:	44 8b 6c 24 38       	mov    0x38(%rsp),%r13d
   19dfa:	8b 6c 24 40          	mov    0x40(%rsp),%ebp
   19dfe:	44 89 f0             	mov    %r14d,%eax
   19e01:	c1 e8 17             	shr    $0x17,%eax
   19e04:	0f b6 c8             	movzbl %al,%ecx
   19e07:	44 89 f2             	mov    %r14d,%edx
   19e0a:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
   19e10:	31 c0                	xor    %eax,%eax
   19e12:	85 c9                	test   %ecx,%ecx
   19e14:	8d 8c 09 d4 fe ff ff 	lea    -0x12c(%rcx,%rcx,1),%ecx
   19e1b:	41 0f 44 cc          	cmove  %r12d,%ecx
   19e1f:	0f 95 c0             	setne  %al
   19e22:	c1 e0 17             	shl    $0x17,%eax
   19e25:	48 09 d0             	or     %rdx,%rax
   19e28:	48 f7 e0             	mul    %rax
   19e2b:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   19e30:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   19e35:	48 89 04 24          	mov    %rax,(%rsp)
   19e39:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   19e3d:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   19e42:	48 89 e1             	mov    %rsp,%rcx
   19e45:	be 00 00 00 80       	mov    $0x80000000,%esi
   19e4a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19e4f:	e8 0c 3f 00 00       	call   1dd60 <<hyperinterval::ieee::Format>::rounded>
   19e54:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   19e59:	75 0f                	jne    19e6a <<hyperinterval::float::F32Enclosure>::square+0xfa>
   19e5b:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   19e60:	eb 59                	jmp    19ebb <<hyperinterval::float::F32Enclosure>::square+0x14b>
   19e62:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   19e68:	eb 5a                	jmp    19ec4 <<hyperinterval::float::F32Enclosure>::square+0x154>
   19e6a:	8b 44 24 38          	mov    0x38(%rsp),%eax
   19e6e:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   19e73:	44 8b 64 24 40       	mov    0x40(%rsp),%r12d
   19e78:	48 89 e7             	mov    %rsp,%rdi
   19e7b:	be 00 00 00 80       	mov    $0x80000000,%esi
   19e80:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19e85:	4c 89 e9             	mov    %r13,%rcx
   19e88:	e8 d3 27 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   19e8d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19e91:	74 23                	je     19eb6 <<hyperinterval::float::F32Enclosure>::square+0x146>
   19e93:	4d 89 e5             	mov    %r12,%r13
   19e96:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   19e9b:	48 89 e7             	mov    %rsp,%rdi
   19e9e:	be 00 00 00 80       	mov    $0x80000000,%esi
   19ea3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19ea8:	48 89 e9             	mov    %rbp,%rcx
   19eab:	e8 b0 27 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   19eb0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19eb4:	75 20                	jne    19ed6 <<hyperinterval::float::F32Enclosure>::square+0x166>
   19eb6:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   19ebb:	88 43 04             	mov    %al,0x4(%rbx)
   19ebe:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19ec4:	48 89 d8             	mov    %rbx,%rax
   19ec7:	48 83 c4 48          	add    $0x48,%rsp
   19ecb:	5b                   	pop    %rbx
   19ecc:	41 5c                	pop    %r12
   19ece:	41 5d                	pop    %r13
   19ed0:	41 5e                	pop    %r14
   19ed2:	41 5f                	pop    %r15
   19ed4:	5d                   	pop    %rbp
   19ed5:	c3                   	ret
   19ed6:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   19eda:	44 89 e0             	mov    %r12d,%eax
   19edd:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19ee2:	89 e9                	mov    %ebp,%ecx
   19ee4:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19eea:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19eef:	29 c2                	sub    %eax,%edx
   19ef1:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19ef6:	09 f8                	or     %edi,%eax
   19ef8:	45 85 e4             	test   %r12d,%r12d
   19efb:	48 0f 49 d0          	cmovns %rax,%rdx
   19eff:	be 00 00 00 80       	mov    $0x80000000,%esi
   19f04:	29 ce                	sub    %ecx,%esi
   19f06:	89 c8                	mov    %ecx,%eax
   19f08:	09 f8                	or     %edi,%eax
   19f0a:	85 ed                	test   %ebp,%ebp
   19f0c:	48 0f 49 f0          	cmovns %rax,%rsi
   19f10:	b0 01                	mov    $0x1,%al
   19f12:	39 f2                	cmp    %esi,%edx
   19f14:	77 a5                	ja     19ebb <<hyperinterval::float::F32Enclosure>::square+0x14b>
   19f16:	48 89 e7             	mov    %rsp,%rdi
   19f19:	be 00 00 00 80       	mov    $0x80000000,%esi
   19f1e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19f23:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   19f28:	e8 33 27 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   19f2d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19f31:	74 83                	je     19eb6 <<hyperinterval::float::F32Enclosure>::square+0x146>
   19f33:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19f38:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   19f3d:	48 89 e7             	mov    %rsp,%rdi
   19f40:	be 00 00 00 80       	mov    $0x80000000,%esi
   19f45:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19f4a:	4c 89 e9             	mov    %r13,%rcx
   19f4d:	e8 0e 27 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   19f52:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19f56:	0f 84 5a ff ff ff    	je     19eb6 <<hyperinterval::float::F32Enclosure>::square+0x146>
   19f5c:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   19f60:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   19f65:	89 d0                	mov    %edx,%eax
   19f67:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19f6c:	41 89 c8             	mov    %ecx,%r8d
   19f6f:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   19f76:	be 00 00 00 80       	mov    $0x80000000,%esi
   19f7b:	29 c6                	sub    %eax,%esi
   19f7d:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19f82:	09 f8                	or     %edi,%eax
   19f84:	85 d2                	test   %edx,%edx
   19f86:	48 0f 49 f0          	cmovns %rax,%rsi
   19f8a:	44 89 c0             	mov    %r8d,%eax
   19f8d:	09 f8                	or     %edi,%eax
   19f8f:	44 29 c7             	sub    %r8d,%edi
   19f92:	85 c9                	test   %ecx,%ecx
   19f94:	48 0f 49 f8          	cmovns %rax,%rdi
   19f98:	b0 01                	mov    $0x1,%al
   19f9a:	39 fe                	cmp    %edi,%esi
   19f9c:	0f 87 19 ff ff ff    	ja     19ebb <<hyperinterval::float::F32Enclosure>::square+0x14b>
   19fa2:	44 89 e7             	mov    %r12d,%edi
   19fa5:	89 ee                	mov    %ebp,%esi
   19fa7:	e8 d4 40 00 00       	call   1e080 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   19fac:	41 89 c4             	mov    %eax,%r12d
   19faf:	89 d5                	mov    %edx,%ebp
   19fb1:	44 89 ff             	mov    %r15d,%edi
   19fb4:	44 89 f6             	mov    %r14d,%esi
   19fb7:	31 d2                	xor    %edx,%edx
   19fb9:	e8 52 41 00 00       	call   1e110 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::signs>
   19fbe:	a8 02                	test   $0x2,%al
   19fc0:	75 12                	jne    19fd4 <<hyperinterval::float::F32Enclosure>::square+0x264>
   19fc2:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   19fc8:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   19fcc:	89 6b 08             	mov    %ebp,0x8(%rbx)
   19fcf:	e9 f0 fe ff ff       	jmp    19ec4 <<hyperinterval::float::F32Enclosure>::square+0x154>
   19fd4:	48 89 e7             	mov    %rsp,%rdi
   19fd7:	31 f6                	xor    %esi,%esi
   19fd9:	31 d2                	xor    %edx,%edx
   19fdb:	e8 70 03 00 00       	call   1a350 <<hyperinterval::float::F32Enclosure>::from_bits>
   19fe0:	8b 04 24             	mov    (%rsp),%eax
   19fe3:	83 f8 02             	cmp    $0x2,%eax
   19fe6:	75 0a                	jne    19ff2 <<hyperinterval::float::F32Enclosure>::square+0x282>
   19fe8:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   19fed:	e9 c9 fe ff ff       	jmp    19ebb <<hyperinterval::float::F32Enclosure>::square+0x14b>
   19ff2:	83 f8 01             	cmp    $0x1,%eax
   19ff5:	75 cb                	jne    19fc2 <<hyperinterval::float::F32Enclosure>::square+0x252>
   19ff7:	8b 54 24 04          	mov    0x4(%rsp),%edx
   19ffb:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   19fff:	44 89 e7             	mov    %r12d,%edi
   1a002:	89 ee                	mov    %ebp,%esi
   1a004:	e8 77 40 00 00       	call   1e080 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   1a009:	41 89 c4             	mov    %eax,%r12d
   1a00c:	89 d5                	mov    %edx,%ebp
   1a00e:	eb b2                	jmp    19fc2 <<hyperinterval::float::F32Enclosure>::square+0x252>

<hyperinterval::float::F32Enclosure>::next_up:
   1a010:	48 83 ec 18          	sub    $0x18,%rsp
   1a014:	66 0f 7e c1          	movd   %xmm0,%ecx
   1a018:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a01d:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a022:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a027:	e8 34 26 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1a02c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a031:	75 10                	jne    1a043 <<hyperinterval::float::F32Enclosure>::next_up+0x33>
   1a033:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1a038:	c1 e0 08             	shl    $0x8,%eax
   1a03b:	48 ff c0             	inc    %rax
   1a03e:	48 83 c4 18          	add    $0x18,%rsp
   1a042:	c3                   	ret
   1a043:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1a048:	31 c9                	xor    %ecx,%ecx
   1a04a:	85 c0                	test   %eax,%eax
   1a04c:	0f 99 c1             	setns  %cl
   1a04f:	48 8d 0c 48          	lea    (%rax,%rcx,2),%rcx
   1a053:	48 ff c9             	dec    %rcx
   1a056:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a05b:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a060:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a065:	e8 f6 25 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1a06a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a06f:	75 0a                	jne    1a07b <<hyperinterval::float::F32Enclosure>::next_up+0x6b>
   1a071:	b8 01 05 00 00       	mov    $0x501,%eax
   1a076:	48 83 c4 18          	add    $0x18,%rsp
   1a07a:	c3                   	ret
   1a07b:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1a080:	48 c1 e0 20          	shl    $0x20,%rax
   1a084:	48 83 c4 18          	add    $0x18,%rsp
   1a088:	c3                   	ret
   1a089:	cc                   	int3
   1a08a:	cc                   	int3
   1a08b:	cc                   	int3
   1a08c:	cc                   	int3
   1a08d:	cc                   	int3
   1a08e:	cc                   	int3
   1a08f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::disjoint:
   1a090:	83 3f 00             	cmpl   $0x0,(%rdi)
   1a093:	b0 01                	mov    $0x1,%al
   1a095:	0f 84 a3 00 00 00    	je     1a13e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   1a09b:	8b 0e                	mov    (%rsi),%ecx
   1a09d:	85 c9                	test   %ecx,%ecx
   1a09f:	0f 84 99 00 00 00    	je     1a13e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   1a0a5:	f6 c1 01             	test   $0x1,%cl
   1a0a8:	74 4c                	je     1a0f6 <<hyperinterval::float::F32Enclosure>::disjoint+0x66>
   1a0aa:	53                   	push   %rbx
   1a0ab:	8b 56 04             	mov    0x4(%rsi),%edx
   1a0ae:	44 8b 47 08          	mov    0x8(%rdi),%r8d
   1a0b2:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1a0b8:	45 89 c2             	mov    %r8d,%r10d
   1a0bb:	45 09 ca             	or     %r9d,%r10d
   1a0be:	45 89 c3             	mov    %r8d,%r11d
   1a0c1:	41 81 e3 ff ff ff 7f 	and    $0x7fffffff,%r11d
   1a0c8:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   1a0cd:	44 29 db             	sub    %r11d,%ebx
   1a0d0:	45 85 c0             	test   %r8d,%r8d
   1a0d3:	49 0f 49 da          	cmovns %r10,%rbx
   1a0d7:	41 89 d0             	mov    %edx,%r8d
   1a0da:	45 09 c8             	or     %r9d,%r8d
   1a0dd:	41 89 d2             	mov    %edx,%r10d
   1a0e0:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1a0e7:	45 29 d1             	sub    %r10d,%r9d
   1a0ea:	85 d2                	test   %edx,%edx
   1a0ec:	4d 0f 49 c8          	cmovns %r8,%r9
   1a0f0:	44 39 cb             	cmp    %r9d,%ebx
   1a0f3:	5b                   	pop    %rbx
   1a0f4:	72 48                	jb     1a13e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   1a0f6:	f6 c1 01             	test   $0x1,%cl
   1a0f9:	75 03                	jne    1a0fe <<hyperinterval::float::F32Enclosure>::disjoint+0x6e>
   1a0fb:	31 c0                	xor    %eax,%eax
   1a0fd:	c3                   	ret
   1a0fe:	8b 47 04             	mov    0x4(%rdi),%eax
   1a101:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1a104:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1a109:	89 ce                	mov    %ecx,%esi
   1a10b:	09 d6                	or     %edx,%esi
   1a10d:	89 cf                	mov    %ecx,%edi
   1a10f:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1a115:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1a11b:	41 29 f8             	sub    %edi,%r8d
   1a11e:	85 c9                	test   %ecx,%ecx
   1a120:	4c 0f 49 c6          	cmovns %rsi,%r8
   1a124:	89 c1                	mov    %eax,%ecx
   1a126:	09 d1                	or     %edx,%ecx
   1a128:	89 c6                	mov    %eax,%esi
   1a12a:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1a130:	29 f2                	sub    %esi,%edx
   1a132:	85 c0                	test   %eax,%eax
   1a134:	48 0f 49 d1          	cmovns %rcx,%rdx
   1a138:	41 39 d0             	cmp    %edx,%r8d
   1a13b:	0f 92 c0             	setb   %al
   1a13e:	c3                   	ret
   1a13f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::expanded:
   1a140:	41 57                	push   %r15
   1a142:	41 56                	push   %r14
   1a144:	41 54                	push   %r12
   1a146:	53                   	push   %rbx
   1a147:	48 83 ec 18          	sub    $0x18,%rsp
   1a14b:	48 89 fb             	mov    %rdi,%rbx
   1a14e:	f6 06 01             	testb  $0x1,(%rsi)
   1a151:	74 7c                	je     1a1cf <<hyperinterval::float::F32Enclosure>::expanded+0x8f>
   1a153:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   1a159:	8b 46 04             	mov    0x4(%rsi),%eax
   1a15c:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   1a160:	8d 88 00 00 00 80    	lea    -0x80000000(%rax),%ecx
   1a166:	85 c0                	test   %eax,%eax
   1a168:	0f 44 c8             	cmove  %eax,%ecx
   1a16b:	31 c0                	xor    %eax,%eax
   1a16d:	85 c9                	test   %ecx,%ecx
   1a16f:	0f 99 c0             	setns  %al
   1a172:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
   1a176:	48 ff c9             	dec    %rcx
   1a179:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a17e:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a183:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a188:	e8 d3 24 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1a18d:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   1a192:	75 2f                	jne    1a1c3 <<hyperinterval::float::F32Enclosure>::expanded+0x83>
   1a194:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1a199:	31 c0                	xor    %eax,%eax
   1a19b:	45 85 f6             	test   %r14d,%r14d
   1a19e:	0f 99 c0             	setns  %al
   1a1a1:	49 8d 0c 46          	lea    (%r14,%rax,2),%rcx
   1a1a5:	48 ff c9             	dec    %rcx
   1a1a8:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a1ad:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a1b2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a1b7:	e8 a4 24 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1a1bc:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a1c1:	75 21                	jne    1a1e4 <<hyperinterval::float::F32Enclosure>::expanded+0xa4>
   1a1c3:	c6 43 04 05          	movb   $0x5,0x4(%rbx)
   1a1c7:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1a1cd:	eb 06                	jmp    1a1d5 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   1a1cf:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   1a1d5:	48 89 d8             	mov    %rbx,%rax
   1a1d8:	48 83 c4 18          	add    $0x18,%rsp
   1a1dc:	5b                   	pop    %rbx
   1a1dd:	41 5c                	pop    %r12
   1a1df:	41 5e                	pop    %r14
   1a1e1:	41 5f                	pop    %r15
   1a1e3:	c3                   	ret
   1a1e4:	44 89 e1             	mov    %r12d,%ecx
   1a1e7:	4c 31 f9             	xor    %r15,%rcx
   1a1ea:	4d 85 e4             	test   %r12,%r12
   1a1ed:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   1a1f2:	49 0f 44 cc          	cmove  %r12,%rcx
   1a1f6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a1fb:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a200:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a205:	e8 56 24 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1a20a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a20f:	74 23                	je     1a234 <<hyperinterval::float::F32Enclosure>::expanded+0xf4>
   1a211:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1a216:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a21b:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a220:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a225:	4c 89 f1             	mov    %r14,%rcx
   1a228:	e8 33 24 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1a22d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a232:	75 10                	jne    1a244 <<hyperinterval::float::F32Enclosure>::expanded+0x104>
   1a234:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1a239:	88 43 04             	mov    %al,0x4(%rbx)
   1a23c:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1a242:	eb 91                	jmp    1a1d5 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   1a244:	8b 44 24 10          	mov    0x10(%rsp),%eax
   1a248:	44 89 e1             	mov    %r12d,%ecx
   1a24b:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1a251:	89 c2                	mov    %eax,%edx
   1a253:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1a259:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a25e:	29 ce                	sub    %ecx,%esi
   1a260:	44 09 f9             	or     %r15d,%ecx
   1a263:	45 85 e4             	test   %r12d,%r12d
   1a266:	48 0f 49 f1          	cmovns %rcx,%rsi
   1a26a:	89 d1                	mov    %edx,%ecx
   1a26c:	44 09 f9             	or     %r15d,%ecx
   1a26f:	41 29 d7             	sub    %edx,%r15d
   1a272:	85 c0                	test   %eax,%eax
   1a274:	4c 0f 49 f9          	cmovns %rcx,%r15
   1a278:	44 39 fe             	cmp    %r15d,%esi
   1a27b:	76 0f                	jbe    1a28c <<hyperinterval::float::F32Enclosure>::expanded+0x14c>
   1a27d:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   1a281:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1a287:	e9 49 ff ff ff       	jmp    1a1d5 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   1a28c:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   1a292:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   1a296:	89 43 08             	mov    %eax,0x8(%rbx)
   1a299:	e9 37 ff ff ff       	jmp    1a1d5 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   1a29e:	cc                   	int3
   1a29f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::overlaps:
   1a2a0:	31 c0                	xor    %eax,%eax
   1a2a2:	83 3f 00             	cmpl   $0x0,(%rdi)
   1a2a5:	0f 84 a1 00 00 00    	je     1a34c <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1a2ab:	8b 0e                	mov    (%rsi),%ecx
   1a2ad:	85 c9                	test   %ecx,%ecx
   1a2af:	0f 84 97 00 00 00    	je     1a34c <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1a2b5:	f6 c1 01             	test   $0x1,%cl
   1a2b8:	74 4b                	je     1a305 <<hyperinterval::float::F32Enclosure>::overlaps+0x65>
   1a2ba:	8b 46 04             	mov    0x4(%rsi),%eax
   1a2bd:	8b 57 08             	mov    0x8(%rdi),%edx
   1a2c0:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1a2c6:	41 89 d1             	mov    %edx,%r9d
   1a2c9:	45 09 c1             	or     %r8d,%r9d
   1a2cc:	41 89 d2             	mov    %edx,%r10d
   1a2cf:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1a2d6:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1a2dc:	45 29 d3             	sub    %r10d,%r11d
   1a2df:	85 d2                	test   %edx,%edx
   1a2e1:	4d 0f 49 d9          	cmovns %r9,%r11
   1a2e5:	89 c2                	mov    %eax,%edx
   1a2e7:	44 09 c2             	or     %r8d,%edx
   1a2ea:	41 89 c1             	mov    %eax,%r9d
   1a2ed:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1a2f4:	45 29 c8             	sub    %r9d,%r8d
   1a2f7:	85 c0                	test   %eax,%eax
   1a2f9:	4c 0f 49 c2          	cmovns %rdx,%r8
   1a2fd:	45 39 c3             	cmp    %r8d,%r11d
   1a300:	73 03                	jae    1a305 <<hyperinterval::float::F32Enclosure>::overlaps+0x65>
   1a302:	31 c0                	xor    %eax,%eax
   1a304:	c3                   	ret
   1a305:	b0 01                	mov    $0x1,%al
   1a307:	f6 c1 01             	test   $0x1,%cl
   1a30a:	74 40                	je     1a34c <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1a30c:	8b 47 04             	mov    0x4(%rdi),%eax
   1a30f:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1a312:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1a317:	89 ce                	mov    %ecx,%esi
   1a319:	09 d6                	or     %edx,%esi
   1a31b:	89 cf                	mov    %ecx,%edi
   1a31d:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1a323:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1a329:	41 29 f8             	sub    %edi,%r8d
   1a32c:	85 c9                	test   %ecx,%ecx
   1a32e:	4c 0f 49 c6          	cmovns %rsi,%r8
   1a332:	89 c1                	mov    %eax,%ecx
   1a334:	09 d1                	or     %edx,%ecx
   1a336:	89 c6                	mov    %eax,%esi
   1a338:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1a33e:	29 f2                	sub    %esi,%edx
   1a340:	85 c0                	test   %eax,%eax
   1a342:	48 0f 49 d1          	cmovns %rcx,%rdx
   1a346:	41 39 d0             	cmp    %edx,%r8d
   1a349:	0f 93 c0             	setae  %al
   1a34c:	c3                   	ret
   1a34d:	cc                   	int3
   1a34e:	cc                   	int3
   1a34f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::from_bits:
   1a350:	41 57                	push   %r15
   1a352:	41 56                	push   %r14
   1a354:	41 54                	push   %r12
   1a356:	53                   	push   %rbx
   1a357:	48 83 ec 18          	sub    $0x18,%rsp
   1a35b:	49 89 d6             	mov    %rdx,%r14
   1a35e:	48 89 fb             	mov    %rdi,%rbx
   1a361:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   1a367:	89 f1                	mov    %esi,%ecx
   1a369:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a36e:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a373:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a378:	e8 e3 22 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1a37d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a382:	74 23                	je     1a3a7 <<hyperinterval::float::F32Enclosure>::from_bits+0x57>
   1a384:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1a389:	44 89 f1             	mov    %r14d,%ecx
   1a38c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a391:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a396:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a39b:	e8 c0 22 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1a3a0:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a3a5:	75 1a                	jne    1a3c1 <<hyperinterval::float::F32Enclosure>::from_bits+0x71>
   1a3a7:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1a3ac:	88 43 04             	mov    %al,0x4(%rbx)
   1a3af:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1a3b5:	48 83 c4 18          	add    $0x18,%rsp
   1a3b9:	5b                   	pop    %rbx
   1a3ba:	41 5c                	pop    %r12
   1a3bc:	41 5e                	pop    %r14
   1a3be:	41 5f                	pop    %r15
   1a3c0:	c3                   	ret
   1a3c1:	8b 44 24 10          	mov    0x10(%rsp),%eax
   1a3c5:	44 89 e1             	mov    %r12d,%ecx
   1a3c8:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1a3ce:	89 c2                	mov    %eax,%edx
   1a3d0:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1a3d6:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a3db:	29 ce                	sub    %ecx,%esi
   1a3dd:	44 09 f9             	or     %r15d,%ecx
   1a3e0:	45 85 e4             	test   %r12d,%r12d
   1a3e3:	48 0f 49 f1          	cmovns %rcx,%rsi
   1a3e7:	89 d1                	mov    %edx,%ecx
   1a3e9:	44 09 f9             	or     %r15d,%ecx
   1a3ec:	41 29 d7             	sub    %edx,%r15d
   1a3ef:	85 c0                	test   %eax,%eax
   1a3f1:	4c 0f 49 f9          	cmovns %rcx,%r15
   1a3f5:	44 39 fe             	cmp    %r15d,%esi
   1a3f8:	76 06                	jbe    1a400 <<hyperinterval::float::F32Enclosure>::from_bits+0xb0>
   1a3fa:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   1a3fe:	eb af                	jmp    1a3af <<hyperinterval::float::F32Enclosure>::from_bits+0x5f>
   1a400:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   1a406:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   1a40a:	89 43 08             	mov    %eax,0x8(%rbx)
   1a40d:	eb a6                	jmp    1a3b5 <<hyperinterval::float::F32Enclosure>::from_bits+0x65>
   1a40f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::max_image:
   1a410:	48 89 f8             	mov    %rdi,%rax
   1a413:	31 c9                	xor    %ecx,%ecx
   1a415:	f6 06 01             	testb  $0x1,(%rsi)
   1a418:	0f 84 db 00 00 00    	je     1a4f9 <<hyperinterval::float::F32Enclosure>::max_image+0xe9>
   1a41e:	f6 02 01             	testb  $0x1,(%rdx)
   1a421:	0f 84 ca 00 00 00    	je     1a4f1 <<hyperinterval::float::F32Enclosure>::max_image+0xe1>
   1a427:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   1a42c:	f3 0f 7e 4e 04       	movq   0x4(%rsi),%xmm1
   1a431:	66 0f ef d2          	pxor   %xmm2,%xmm2
   1a435:	66 0f 6f e1          	movdqa %xmm1,%xmm4
   1a439:	66 0f 62 e2          	punpckldq %xmm2,%xmm4
   1a43d:	66 0f 6f e8          	movdqa %xmm0,%xmm5
   1a441:	66 0f 62 ea          	punpckldq %xmm2,%xmm5
   1a445:	66 0f 6f 1d 53 ba fe 	movdqa -0x145ad(%rip),%xmm3        # 5ea0 <__abi_tag+0x5ba4>
   1a44c:	ff 
   1a44d:	66 0f 6f f4          	movdqa %xmm4,%xmm6
   1a451:	66 0f eb f3          	por    %xmm3,%xmm6
   1a455:	66 0f 6f 3d 03 b8 fe 	movdqa -0x147fd(%rip),%xmm7        # 5c60 <__abi_tag+0x5964>
   1a45c:	ff 
   1a45d:	66 0f db e7          	pand   %xmm7,%xmm4
   1a461:	66 44 0f 6f c3       	movdqa %xmm3,%xmm8
   1a466:	66 44 0f fb c4       	psubq  %xmm4,%xmm8
   1a46b:	66 0f 70 e1 50       	pshufd $0x50,%xmm1,%xmm4
   1a470:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
   1a475:	66 44 0f 66 cc       	pcmpgtd %xmm4,%xmm9
   1a47a:	66 45 0f db c1       	pand   %xmm9,%xmm8
   1a47f:	66 44 0f df ce       	pandn  %xmm6,%xmm9
   1a484:	66 45 0f eb c8       	por    %xmm8,%xmm9
   1a489:	66 0f 6f e5          	movdqa %xmm5,%xmm4
   1a48d:	66 0f eb e3          	por    %xmm3,%xmm4
   1a491:	66 0f db ef          	pand   %xmm7,%xmm5
   1a495:	66 0f 6f f3          	movdqa %xmm3,%xmm6
   1a499:	66 0f fb f5          	psubq  %xmm5,%xmm6
   1a49d:	66 0f 70 e8 50       	pshufd $0x50,%xmm0,%xmm5
   1a4a2:	66 0f 66 d5          	pcmpgtd %xmm5,%xmm2
   1a4a6:	66 0f db f2          	pand   %xmm2,%xmm6
   1a4aa:	66 0f df d4          	pandn  %xmm4,%xmm2
   1a4ae:	66 0f eb d6          	por    %xmm6,%xmm2
   1a4b2:	66 44 0f ef cb       	pxor   %xmm3,%xmm9
   1a4b7:	66 0f ef d3          	pxor   %xmm3,%xmm2
   1a4bb:	66 0f 6f da          	movdqa %xmm2,%xmm3
   1a4bf:	66 41 0f 66 d9       	pcmpgtd %xmm9,%xmm3
   1a4c4:	66 0f 70 e3 e8       	pshufd $0xe8,%xmm3,%xmm4
   1a4c9:	66 41 0f 76 d1       	pcmpeqd %xmm9,%xmm2
   1a4ce:	66 0f 70 ea fd       	pshufd $0xfd,%xmm2,%xmm5
   1a4d3:	66 0f db ec          	pand   %xmm4,%xmm5
   1a4d7:	66 0f 70 d3 fd       	pshufd $0xfd,%xmm3,%xmm2
   1a4dc:	66 0f eb d5          	por    %xmm5,%xmm2
   1a4e0:	66 0f db c2          	pand   %xmm2,%xmm0
   1a4e4:	66 0f df d1          	pandn  %xmm1,%xmm2
   1a4e8:	66 0f eb d0          	por    %xmm0,%xmm2
   1a4ec:	b9 01 00 00 00       	mov    $0x1,%ecx
   1a4f1:	89 08                	mov    %ecx,(%rax)
   1a4f3:	66 0f d6 50 04       	movq   %xmm2,0x4(%rax)
   1a4f8:	c3                   	ret
   1a4f9:	89 08                	mov    %ecx,(%rax)
   1a4fb:	0f 13 50 04          	movlps %xmm2,0x4(%rax)
   1a4ff:	c3                   	ret

<hyperinterval::float::F32Enclosure>::min_image:
   1a500:	48 89 f8             	mov    %rdi,%rax
   1a503:	31 c9                	xor    %ecx,%ecx
   1a505:	f6 06 01             	testb  $0x1,(%rsi)
   1a508:	0f 84 dc 00 00 00    	je     1a5ea <<hyperinterval::float::F32Enclosure>::min_image+0xea>
   1a50e:	f6 02 01             	testb  $0x1,(%rdx)
   1a511:	0f 84 cb 00 00 00    	je     1a5e2 <<hyperinterval::float::F32Enclosure>::min_image+0xe2>
   1a517:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   1a51c:	f3 0f 7e 4e 04       	movq   0x4(%rsi),%xmm1
   1a521:	66 0f ef d2          	pxor   %xmm2,%xmm2
   1a525:	66 0f 6f e1          	movdqa %xmm1,%xmm4
   1a529:	66 0f 62 e2          	punpckldq %xmm2,%xmm4
   1a52d:	66 0f 6f e8          	movdqa %xmm0,%xmm5
   1a531:	66 0f 62 ea          	punpckldq %xmm2,%xmm5
   1a535:	66 0f 6f 1d 63 b9 fe 	movdqa -0x1469d(%rip),%xmm3        # 5ea0 <__abi_tag+0x5ba4>
   1a53c:	ff 
   1a53d:	66 0f 6f f4          	movdqa %xmm4,%xmm6
   1a541:	66 0f eb f3          	por    %xmm3,%xmm6
   1a545:	66 0f 6f 3d 13 b7 fe 	movdqa -0x148ed(%rip),%xmm7        # 5c60 <__abi_tag+0x5964>
   1a54c:	ff 
   1a54d:	66 0f db e7          	pand   %xmm7,%xmm4
   1a551:	66 44 0f 6f c3       	movdqa %xmm3,%xmm8
   1a556:	66 44 0f fb c4       	psubq  %xmm4,%xmm8
   1a55b:	66 0f 70 e1 50       	pshufd $0x50,%xmm1,%xmm4
   1a560:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
   1a565:	66 44 0f 66 cc       	pcmpgtd %xmm4,%xmm9
   1a56a:	66 45 0f db c1       	pand   %xmm9,%xmm8
   1a56f:	66 44 0f df ce       	pandn  %xmm6,%xmm9
   1a574:	66 45 0f eb c8       	por    %xmm8,%xmm9
   1a579:	66 0f 6f e5          	movdqa %xmm5,%xmm4
   1a57d:	66 0f eb e3          	por    %xmm3,%xmm4
   1a581:	66 0f db ef          	pand   %xmm7,%xmm5
   1a585:	66 0f 6f f3          	movdqa %xmm3,%xmm6
   1a589:	66 0f fb f5          	psubq  %xmm5,%xmm6
   1a58d:	66 0f 70 e8 50       	pshufd $0x50,%xmm0,%xmm5
   1a592:	66 0f 66 d5          	pcmpgtd %xmm5,%xmm2
   1a596:	66 0f db f2          	pand   %xmm2,%xmm6
   1a59a:	66 0f df d4          	pandn  %xmm4,%xmm2
   1a59e:	66 0f eb d6          	por    %xmm6,%xmm2
   1a5a2:	66 0f ef d3          	pxor   %xmm3,%xmm2
   1a5a6:	66 44 0f ef cb       	pxor   %xmm3,%xmm9
   1a5ab:	66 41 0f 6f d9       	movdqa %xmm9,%xmm3
   1a5b0:	66 0f 66 da          	pcmpgtd %xmm2,%xmm3
   1a5b4:	66 0f 70 e3 e8       	pshufd $0xe8,%xmm3,%xmm4
   1a5b9:	66 44 0f 76 ca       	pcmpeqd %xmm2,%xmm9
   1a5be:	66 41 0f 70 e9 fd    	pshufd $0xfd,%xmm9,%xmm5
   1a5c4:	66 0f db ec          	pand   %xmm4,%xmm5
   1a5c8:	66 0f 70 d3 fd       	pshufd $0xfd,%xmm3,%xmm2
   1a5cd:	66 0f eb d5          	por    %xmm5,%xmm2
   1a5d1:	66 0f db c2          	pand   %xmm2,%xmm0
   1a5d5:	66 0f df d1          	pandn  %xmm1,%xmm2
   1a5d9:	66 0f eb d0          	por    %xmm0,%xmm2
   1a5dd:	b9 01 00 00 00       	mov    $0x1,%ecx
   1a5e2:	89 08                	mov    %ecx,(%rax)
   1a5e4:	66 0f d6 50 04       	movq   %xmm2,0x4(%rax)
   1a5e9:	c3                   	ret
   1a5ea:	89 08                	mov    %ecx,(%rax)
   1a5ec:	0f 13 50 04          	movlps %xmm2,0x4(%rax)
   1a5f0:	c3                   	ret
   1a5f1:	cc                   	int3
   1a5f2:	cc                   	int3
   1a5f3:	cc                   	int3
   1a5f4:	cc                   	int3
   1a5f5:	cc                   	int3
   1a5f6:	cc                   	int3
   1a5f7:	cc                   	int3
   1a5f8:	cc                   	int3
   1a5f9:	cc                   	int3
   1a5fa:	cc                   	int3
   1a5fb:	cc                   	int3
   1a5fc:	cc                   	int3
   1a5fd:	cc                   	int3
   1a5fe:	cc                   	int3
   1a5ff:	cc                   	int3

<hyperinterval::float::F32Enclosure>::next_down:
   1a600:	53                   	push   %rbx
   1a601:	48 83 ec 10          	sub    $0x10,%rsp
   1a605:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   1a60a:	66 0f 7e c1          	movd   %xmm0,%ecx
   1a60e:	48 89 e7             	mov    %rsp,%rdi
   1a611:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a616:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a61b:	e8 40 20 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1a620:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a624:	75 11                	jne    1a637 <<hyperinterval::float::F32Enclosure>::next_down+0x37>
   1a626:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a62b:	c1 e0 08             	shl    $0x8,%eax
   1a62e:	48 ff c0             	inc    %rax
   1a631:	48 83 c4 10          	add    $0x10,%rsp
   1a635:	5b                   	pop    %rbx
   1a636:	c3                   	ret
   1a637:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a63c:	48 89 c1             	mov    %rax,%rcx
   1a63f:	48 31 d9             	xor    %rbx,%rcx
   1a642:	48 85 c0             	test   %rax,%rax
   1a645:	48 0f 44 c8          	cmove  %rax,%rcx
   1a649:	31 c0                	xor    %eax,%eax
   1a64b:	85 c9                	test   %ecx,%ecx
   1a64d:	0f 99 c0             	setns  %al
   1a650:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
   1a654:	48 ff c9             	dec    %rcx
   1a657:	48 89 e7             	mov    %rsp,%rdi
   1a65a:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a65f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a664:	e8 f7 1f 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1a669:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a66d:	75 0b                	jne    1a67a <<hyperinterval::float::F32Enclosure>::next_down+0x7a>
   1a66f:	b8 01 05 00 00       	mov    $0x501,%eax
   1a674:	48 83 c4 10          	add    $0x10,%rsp
   1a678:	5b                   	pop    %rbx
   1a679:	c3                   	ret
   1a67a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a67f:	48 89 c8             	mov    %rcx,%rax
   1a682:	48 35 00 00 00 80    	xor    $0xffffffff80000000,%rax
   1a688:	48 c1 e0 20          	shl    $0x20,%rax
   1a68c:	48 85 c9             	test   %rcx,%rcx
   1a68f:	48 0f 44 c1          	cmove  %rcx,%rax
   1a693:	48 83 c4 10          	add    $0x10,%rsp
   1a697:	5b                   	pop    %rbx
   1a698:	c3                   	ret
   1a699:	cc                   	int3
   1a69a:	cc                   	int3
   1a69b:	cc                   	int3
   1a69c:	cc                   	int3
   1a69d:	cc                   	int3
   1a69e:	cc                   	int3
   1a69f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::subset_of:
   1a6a0:	b0 01                	mov    $0x1,%al
   1a6a2:	f6 07 01             	testb  $0x1,(%rdi)
   1a6a5:	74 50                	je     1a6f7 <<hyperinterval::float::F32Enclosure>::subset_of+0x57>
   1a6a7:	f6 06 01             	testb  $0x1,(%rsi)
   1a6aa:	74 49                	je     1a6f5 <<hyperinterval::float::F32Enclosure>::subset_of+0x55>
   1a6ac:	8b 4f 04             	mov    0x4(%rdi),%ecx
   1a6af:	8b 56 04             	mov    0x4(%rsi),%edx
   1a6b2:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1a6b7:	44 8d 04 02          	lea    (%rdx,%rax,1),%r8d
   1a6bb:	41 89 d1             	mov    %edx,%r9d
   1a6be:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1a6c5:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1a6cb:	45 29 ca             	sub    %r9d,%r10d
   1a6ce:	85 d2                	test   %edx,%edx
   1a6d0:	4d 0f 49 d0          	cmovns %r8,%r10
   1a6d4:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1a6d7:	41 89 c8             	mov    %ecx,%r8d
   1a6da:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1a6e1:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1a6e7:	45 29 c1             	sub    %r8d,%r9d
   1a6ea:	85 c9                	test   %ecx,%ecx
   1a6ec:	4c 0f 49 ca          	cmovns %rdx,%r9
   1a6f0:	45 39 ca             	cmp    %r9d,%r10d
   1a6f3:	76 03                	jbe    1a6f8 <<hyperinterval::float::F32Enclosure>::subset_of+0x58>
   1a6f5:	31 c0                	xor    %eax,%eax
   1a6f7:	c3                   	ret
   1a6f8:	8b 4f 08             	mov    0x8(%rdi),%ecx
   1a6fb:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1a6fe:	89 cf                	mov    %ecx,%edi
   1a700:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1a706:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1a70c:	41 29 f8             	sub    %edi,%r8d
   1a70f:	85 c9                	test   %ecx,%ecx
   1a711:	4c 0f 49 c2          	cmovns %rdx,%r8
   1a715:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1a718:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1a71b:	89 ce                	mov    %ecx,%esi
   1a71d:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1a723:	29 f0                	sub    %esi,%eax
   1a725:	85 c9                	test   %ecx,%ecx
   1a727:	48 0f 49 c2          	cmovns %rdx,%rax
   1a72b:	41 39 c0             	cmp    %eax,%r8d
   1a72e:	0f 96 c0             	setbe  %al
   1a731:	c3                   	ret
   1a732:	cc                   	int3
   1a733:	cc                   	int3
   1a734:	cc                   	int3
   1a735:	cc                   	int3
   1a736:	cc                   	int3
   1a737:	cc                   	int3
   1a738:	cc                   	int3
   1a739:	cc                   	int3
   1a73a:	cc                   	int3
   1a73b:	cc                   	int3
   1a73c:	cc                   	int3
   1a73d:	cc                   	int3
   1a73e:	cc                   	int3
   1a73f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::reciprocal:
   1a740:	55                   	push   %rbp
   1a741:	41 57                	push   %r15
   1a743:	41 56                	push   %r14
   1a745:	41 55                	push   %r13
   1a747:	41 54                	push   %r12
   1a749:	53                   	push   %rbx
   1a74a:	48 83 ec 28          	sub    $0x28,%rsp
   1a74e:	48 89 fb             	mov    %rdi,%rbx
   1a751:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1a755:	74 65                	je     1a7bc <<hyperinterval::float::F64Enclosure>::reciprocal+0x7c>
   1a757:	49 89 f6             	mov    %rsi,%r14
   1a75a:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
   1a761:	00 00 80 
   1a764:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1a76b:	00 f0 7f 
   1a76e:	49 bd 00 00 00 00 00 	movabs $0x3ff0000000000000,%r13
   1a775:	00 f0 3f 
   1a778:	48 89 e7             	mov    %rsp,%rdi
   1a77b:	4c 89 fe             	mov    %r15,%rsi
   1a77e:	4c 89 e2             	mov    %r12,%rdx
   1a781:	4c 89 e9             	mov    %r13,%rcx
   1a784:	e8 d7 1e 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1a789:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a78d:	74 1c                	je     1a7ab <<hyperinterval::float::F64Enclosure>::reciprocal+0x6b>
   1a78f:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1a794:	48 89 e7             	mov    %rsp,%rdi
   1a797:	4c 89 fe             	mov    %r15,%rsi
   1a79a:	4c 89 e2             	mov    %r12,%rdx
   1a79d:	4c 89 e9             	mov    %r13,%rcx
   1a7a0:	e8 bb 1e 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1a7a5:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a7a9:	75 2a                	jne    1a7d5 <<hyperinterval::float::F64Enclosure>::reciprocal+0x95>
   1a7ab:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   1a7b0:	88 53 08             	mov    %dl,0x8(%rbx)
   1a7b3:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a7ba:	eb 07                	jmp    1a7c3 <<hyperinterval::float::F64Enclosure>::reciprocal+0x83>
   1a7bc:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1a7c3:	48 89 d8             	mov    %rbx,%rax
   1a7c6:	48 83 c4 28          	add    $0x28,%rsp
   1a7ca:	5b                   	pop    %rbx
   1a7cb:	41 5c                	pop    %r12
   1a7cd:	41 5d                	pop    %r13
   1a7cf:	41 5e                	pop    %r14
   1a7d1:	41 5f                	pop    %r15
   1a7d3:	5d                   	pop    %rbp
   1a7d4:	c3                   	ret
   1a7d5:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a7da:	49 8d 14 2f          	lea    (%r15,%rbp,1),%rdx
   1a7de:	49 8d 47 ff          	lea    -0x1(%r15),%rax
   1a7e2:	48 89 ee             	mov    %rbp,%rsi
   1a7e5:	48 21 c6             	and    %rax,%rsi
   1a7e8:	4c 89 ff             	mov    %r15,%rdi
   1a7eb:	48 29 f7             	sub    %rsi,%rdi
   1a7ee:	48 85 ed             	test   %rbp,%rbp
   1a7f1:	48 0f 49 fa          	cmovns %rdx,%rdi
   1a7f5:	4a 8d 14 39          	lea    (%rcx,%r15,1),%rdx
   1a7f9:	48 89 ce             	mov    %rcx,%rsi
   1a7fc:	48 21 c6             	and    %rax,%rsi
   1a7ff:	49 29 f7             	sub    %rsi,%r15
   1a802:	48 85 c9             	test   %rcx,%rcx
   1a805:	4c 0f 49 fa          	cmovns %rdx,%r15
   1a809:	b2 01                	mov    $0x1,%dl
   1a80b:	4c 39 ff             	cmp    %r15,%rdi
   1a80e:	77 a0                	ja     1a7b0 <<hyperinterval::float::F64Enclosure>::reciprocal+0x70>
   1a810:	48 c7 44 24 10 01 00 	movq   $0x1,0x10(%rsp)
   1a817:	00 00 
   1a819:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
   1a81e:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   1a823:	49 83 7e 08 00       	cmpq   $0x0,0x8(%r14)
   1a828:	7f 0e                	jg     1a838 <<hyperinterval::float::F64Enclosure>::reciprocal+0xf8>
   1a82a:	49 8b 4e 10          	mov    0x10(%r14),%rcx
   1a82e:	48 85 c9             	test   %rcx,%rcx
   1a831:	79 1f                	jns    1a852 <<hyperinterval::float::F64Enclosure>::reciprocal+0x112>
   1a833:	48 21 c1             	and    %rax,%rcx
   1a836:	74 1a                	je     1a852 <<hyperinterval::float::F64Enclosure>::reciprocal+0x112>
   1a838:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
   1a83d:	48 89 df             	mov    %rbx,%rdi
   1a840:	4c 89 f2             	mov    %r14,%rdx
   1a843:	b9 01 00 00 00       	mov    $0x1,%ecx
   1a848:	e8 93 02 00 00       	call   1aae0 <<hyperinterval::float::F64Enclosure>::corner_image>
   1a84d:	e9 71 ff ff ff       	jmp    1a7c3 <<hyperinterval::float::F64Enclosure>::reciprocal+0x83>
   1a852:	c6 43 08 06          	movb   $0x6,0x8(%rbx)
   1a856:	e9 58 ff ff ff       	jmp    1a7b3 <<hyperinterval::float::F64Enclosure>::reciprocal+0x73>
   1a85b:	cc                   	int3
   1a85c:	cc                   	int3
   1a85d:	cc                   	int3
   1a85e:	cc                   	int3
   1a85f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::checked_pow:
   1a860:	55                   	push   %rbp
   1a861:	41 57                	push   %r15
   1a863:	41 56                	push   %r14
   1a865:	41 55                	push   %r13
   1a867:	41 54                	push   %r12
   1a869:	53                   	push   %rbx
   1a86a:	48 83 ec 48          	sub    $0x48,%rsp
   1a86e:	48 89 fb             	mov    %rdi,%rbx
   1a871:	83 fa 02             	cmp    $0x2,%edx
   1a874:	75 0e                	jne    1a884 <<hyperinterval::float::F64Enclosure>::checked_pow+0x24>
   1a876:	48 89 df             	mov    %rbx,%rdi
   1a879:	ff 15 f9 2d 04 00    	call   *0x42df9(%rip)        # 5d678 <_DYNAMIC+0x2f0>
   1a87f:	e9 e0 00 00 00       	jmp    1a964 <<hyperinterval::float::F64Enclosure>::checked_pow+0x104>
   1a884:	f6 06 01             	testb  $0x1,(%rsi)
   1a887:	0f 84 d0 00 00 00    	je     1a95d <<hyperinterval::float::F64Enclosure>::checked_pow+0xfd>
   1a88d:	89 d5                	mov    %edx,%ebp
   1a88f:	4c 8b 76 10          	mov    0x10(%rsi),%r14
   1a893:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
   1a89a:	00 00 80 
   1a89d:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   1a8a4:	00 f0 7f 
   1a8a7:	4c 8b 7e 08          	mov    0x8(%rsi),%r15
   1a8ab:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a8b0:	4c 89 e6             	mov    %r12,%rsi
   1a8b3:	4c 89 ea             	mov    %r13,%rdx
   1a8b6:	4c 89 f9             	mov    %r15,%rcx
   1a8b9:	41 89 e8             	mov    %ebp,%r8d
   1a8bc:	e8 af 2c 00 00       	call   1d570 <<hyperinterval::ieee::Format>::power>
   1a8c1:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   1a8c6:	0f 85 80 00 00 00    	jne    1a94c <<hyperinterval::float::F64Enclosure>::checked_pow+0xec>
   1a8cc:	4c 89 f1             	mov    %r14,%rcx
   1a8cf:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   1a8d4:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1a8d9:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1a8de:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a8e3:	4c 89 e6             	mov    %r12,%rsi
   1a8e6:	4c 89 ea             	mov    %r13,%rdx
   1a8e9:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
   1a8ee:	41 89 e8             	mov    %ebp,%r8d
   1a8f1:	e8 7a 2c 00 00       	call   1d570 <<hyperinterval::ieee::Format>::power>
   1a8f6:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a8fb:	74 4f                	je     1a94c <<hyperinterval::float::F64Enclosure>::checked_pow+0xec>
   1a8fd:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1a902:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1a907:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1a90c:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1a911:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a916:	4c 89 e6             	mov    %r12,%rsi
   1a919:	4c 89 ea             	mov    %r13,%rdx
   1a91c:	4c 89 f1             	mov    %r14,%rcx
   1a91f:	e8 3c 1d 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1a924:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a929:	74 21                	je     1a94c <<hyperinterval::float::F64Enclosure>::checked_pow+0xec>
   1a92b:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   1a930:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a935:	4c 89 e6             	mov    %r12,%rsi
   1a938:	4c 89 ea             	mov    %r13,%rdx
   1a93b:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   1a940:	e8 1b 1d 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1a945:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a94a:	75 2a                	jne    1a976 <<hyperinterval::float::F64Enclosure>::checked_pow+0x116>
   1a94c:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1a951:	88 43 08             	mov    %al,0x8(%rbx)
   1a954:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a95b:	eb 07                	jmp    1a964 <<hyperinterval::float::F64Enclosure>::checked_pow+0x104>
   1a95d:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1a964:	48 89 d8             	mov    %rbx,%rax
   1a967:	48 83 c4 48          	add    $0x48,%rsp
   1a96b:	5b                   	pop    %rbx
   1a96c:	41 5c                	pop    %r12
   1a96e:	41 5d                	pop    %r13
   1a970:	41 5e                	pop    %r14
   1a972:	41 5f                	pop    %r15
   1a974:	5d                   	pop    %rbp
   1a975:	c3                   	ret
   1a976:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
   1a97b:	4b 8d 04 26          	lea    (%r14,%r12,1),%rax
   1a97f:	4c 89 f6             	mov    %r14,%rsi
   1a982:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
   1a987:	48 89 f1             	mov    %rsi,%rcx
   1a98a:	4c 21 f1             	and    %r14,%rcx
   1a98d:	4c 89 e2             	mov    %r12,%rdx
   1a990:	48 29 ca             	sub    %rcx,%rdx
   1a993:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
   1a998:	48 85 f6             	test   %rsi,%rsi
   1a99b:	48 0f 49 d0          	cmovns %rax,%rdx
   1a99f:	4a 8d 04 27          	lea    (%rdi,%r12,1),%rax
   1a9a3:	48 89 f9             	mov    %rdi,%rcx
   1a9a6:	4c 21 f1             	and    %r14,%rcx
   1a9a9:	4c 89 e6             	mov    %r12,%rsi
   1a9ac:	48 29 ce             	sub    %rcx,%rsi
   1a9af:	48 85 ff             	test   %rdi,%rdi
   1a9b2:	48 0f 49 f0          	cmovns %rax,%rsi
   1a9b6:	b0 01                	mov    $0x1,%al
   1a9b8:	48 39 f2             	cmp    %rsi,%rdx
   1a9bb:	77 94                	ja     1a951 <<hyperinterval::float::F64Enclosure>::checked_pow+0xf1>
   1a9bd:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
   1a9c2:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a9c7:	4c 89 e6             	mov    %r12,%rsi
   1a9ca:	4c 89 ea             	mov    %r13,%rdx
   1a9cd:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1a9d2:	e8 89 1c 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1a9d7:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a9dc:	0f 84 6a ff ff ff    	je     1a94c <<hyperinterval::float::F64Enclosure>::checked_pow+0xec>
   1a9e2:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1a9e7:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1a9ec:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a9f1:	4c 89 e6             	mov    %r12,%rsi
   1a9f4:	4c 89 ea             	mov    %r13,%rdx
   1a9f7:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   1a9fc:	e8 5f 1c 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1aa01:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1aa06:	0f 84 40 ff ff ff    	je     1a94c <<hyperinterval::float::F64Enclosure>::checked_pow+0xec>
   1aa0c:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1aa11:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
   1aa16:	4a 8d 04 22          	lea    (%rdx,%r12,1),%rax
   1aa1a:	48 89 d7             	mov    %rdx,%rdi
   1aa1d:	4c 21 f7             	and    %r14,%rdi
   1aa20:	4c 89 e6             	mov    %r12,%rsi
   1aa23:	48 29 fe             	sub    %rdi,%rsi
   1aa26:	48 85 d2             	test   %rdx,%rdx
   1aa29:	48 0f 49 f0          	cmovns %rax,%rsi
   1aa2d:	4a 8d 04 21          	lea    (%rcx,%r12,1),%rax
   1aa31:	49 21 ce             	and    %rcx,%r14
   1aa34:	4d 29 f4             	sub    %r14,%r12
   1aa37:	48 85 c9             	test   %rcx,%rcx
   1aa3a:	4c 0f 49 e0          	cmovns %rax,%r12
   1aa3e:	b0 01                	mov    $0x1,%al
   1aa40:	4c 39 e6             	cmp    %r12,%rsi
   1aa43:	0f 87 08 ff ff ff    	ja     1a951 <<hyperinterval::float::F64Enclosure>::checked_pow+0xf1>
   1aa49:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1aa4e:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   1aa53:	e8 48 37 00 00       	call   1e1a0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1aa58:	49 89 c5             	mov    %rax,%r13
   1aa5b:	49 89 d4             	mov    %rdx,%r12
   1aa5e:	85 ed                	test   %ebp,%ebp
   1aa60:	0f 95 c0             	setne  %al
   1aa63:	40 f6 c5 01          	test   $0x1,%bpl
   1aa67:	0f 94 c1             	sete   %cl
   1aa6a:	84 c8                	test   %cl,%al
   1aa6c:	74 13                	je     1aa81 <<hyperinterval::float::F64Enclosure>::checked_pow+0x221>
   1aa6e:	4c 89 ff             	mov    %r15,%rdi
   1aa71:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
   1aa76:	31 d2                	xor    %edx,%edx
   1aa78:	e8 a3 37 00 00       	call   1e220 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::signs>
   1aa7d:	a8 02                	test   $0x2,%al
   1aa7f:	75 14                	jne    1aa95 <<hyperinterval::float::F64Enclosure>::checked_pow+0x235>
   1aa81:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1aa88:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1aa8c:	4c 89 63 10          	mov    %r12,0x10(%rbx)
   1aa90:	e9 cf fe ff ff       	jmp    1a964 <<hyperinterval::float::F64Enclosure>::checked_pow+0x104>
   1aa95:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1aa9a:	31 f6                	xor    %esi,%esi
   1aa9c:	31 d2                	xor    %edx,%edx
   1aa9e:	e8 2d 18 00 00       	call   1c2d0 <<hyperinterval::float::F64Enclosure>::from_bits>
   1aaa3:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1aaa8:	48 83 f8 02          	cmp    $0x2,%rax
   1aaac:	75 0a                	jne    1aab8 <<hyperinterval::float::F64Enclosure>::checked_pow+0x258>
   1aaae:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   1aab3:	e9 99 fe ff ff       	jmp    1a951 <<hyperinterval::float::F64Enclosure>::checked_pow+0xf1>
   1aab8:	83 f8 01             	cmp    $0x1,%eax
   1aabb:	75 c4                	jne    1aa81 <<hyperinterval::float::F64Enclosure>::checked_pow+0x221>
   1aabd:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   1aac2:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1aac7:	4c 89 ef             	mov    %r13,%rdi
   1aaca:	4c 89 e6             	mov    %r12,%rsi
   1aacd:	e8 ce 36 00 00       	call   1e1a0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1aad2:	49 89 c5             	mov    %rax,%r13
   1aad5:	49 89 d4             	mov    %rdx,%r12
   1aad8:	eb a7                	jmp    1aa81 <<hyperinterval::float::F64Enclosure>::checked_pow+0x221>
   1aada:	cc                   	int3
   1aadb:	cc                   	int3
   1aadc:	cc                   	int3
   1aadd:	cc                   	int3
   1aade:	cc                   	int3
   1aadf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::corner_image:
   1aae0:	55                   	push   %rbp
   1aae1:	41 57                	push   %r15
   1aae3:	41 56                	push   %r14
   1aae5:	41 55                	push   %r13
   1aae7:	41 54                	push   %r12
   1aae9:	53                   	push   %rbx
   1aaea:	48 83 ec 68          	sub    $0x68,%rsp
   1aaee:	48 89 fb             	mov    %rdi,%rbx
   1aaf1:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1aaf5:	75 5f                	jne    1ab56 <<hyperinterval::float::F64Enclosure>::corner_image+0x76>
   1aaf7:	f6 02 01             	testb  $0x1,(%rdx)
   1aafa:	74 5a                	je     1ab56 <<hyperinterval::float::F64Enclosure>::corner_image+0x76>
   1aafc:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1ab03:	00 00 80 
   1ab06:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   1ab0d:	00 f0 7f 
   1ab10:	4c 8b 66 08          	mov    0x8(%rsi),%r12
   1ab14:	48 8b 46 10          	mov    0x10(%rsi),%rax
   1ab18:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1ab1d:	48 8b 6a 08          	mov    0x8(%rdx),%rbp
   1ab21:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1ab25:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1ab2a:	84 c9                	test   %cl,%cl
   1ab2c:	74 34                	je     1ab62 <<hyperinterval::float::F64Enclosure>::corner_image+0x82>
   1ab2e:	48 89 e7             	mov    %rsp,%rdi
   1ab31:	4c 89 f6             	mov    %r14,%rsi
   1ab34:	4c 89 ea             	mov    %r13,%rdx
   1ab37:	4c 89 e1             	mov    %r12,%rcx
   1ab3a:	49 89 e8             	mov    %rbp,%r8
   1ab3d:	e8 0e 1e 00 00       	call   1c950 <<hyperinterval::ieee::Format>::div>
   1ab42:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ab46:	0f 84 c3 00 00 00    	je     1ac0f <<hyperinterval::float::F64Enclosure>::corner_image+0x12f>
   1ab4c:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1ab51:	e9 b1 00 00 00       	jmp    1ac07 <<hyperinterval::float::F64Enclosure>::corner_image+0x127>
   1ab56:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1ab5d:	e9 12 04 00 00       	jmp    1af74 <<hyperinterval::float::F64Enclosure>::corner_image+0x494>
   1ab62:	4c 89 e1             	mov    %r12,%rcx
   1ab65:	48 c1 e9 34          	shr    $0x34,%rcx
   1ab69:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1ab6f:	48 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%rdx
   1ab76:	ff 0f 00 
   1ab79:	4c 89 e7             	mov    %r12,%rdi
   1ab7c:	48 21 d7             	and    %rdx,%rdi
   1ab7f:	48 8d 42 01          	lea    0x1(%rdx),%rax
   1ab83:	44 8d 81 9a f7 ff ff 	lea    -0x866(%rcx),%r8d
   1ab8a:	48 85 c9             	test   %rcx,%rcx
   1ab8d:	48 0f 45 c8          	cmovne %rax,%rcx
   1ab91:	be 9b f7 ff ff       	mov    $0xfffff79b,%esi
   1ab96:	41 0f 45 f0          	cmovne %r8d,%esi
   1ab9a:	48 09 f9             	or     %rdi,%rcx
   1ab9d:	48 89 ef             	mov    %rbp,%rdi
   1aba0:	48 c1 ef 34          	shr    $0x34,%rdi
   1aba4:	81 e7 ff 07 00 00    	and    $0x7ff,%edi
   1abaa:	48 21 ea             	and    %rbp,%rdx
   1abad:	48 85 ff             	test   %rdi,%rdi
   1abb0:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1abb6:	44 0f 45 c7          	cmovne %edi,%r8d
   1abba:	48 0f 44 c7          	cmove  %rdi,%rax
   1abbe:	48 09 d0             	or     %rdx,%rax
   1abc1:	48 89 ef             	mov    %rbp,%rdi
   1abc4:	4c 31 e7             	xor    %r12,%rdi
   1abc7:	48 f7 e1             	mul    %rcx
   1abca:	41 01 f0             	add    %esi,%r8d
   1abcd:	48 c1 ef 3f          	shr    $0x3f,%rdi
   1abd1:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
   1abd6:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1abdb:	48 89 04 24          	mov    %rax,(%rsp)
   1abdf:	44 89 44 24 10       	mov    %r8d,0x10(%rsp)
   1abe4:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1abe9:	48 89 e1             	mov    %rsp,%rcx
   1abec:	4c 89 f6             	mov    %r14,%rsi
   1abef:	4c 89 ea             	mov    %r13,%rdx
   1abf2:	e8 69 31 00 00       	call   1dd60 <<hyperinterval::ieee::Format>::rounded>
   1abf7:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1abfc:	0f 84 22 03 00 00    	je     1af24 <<hyperinterval::float::F64Enclosure>::corner_image+0x444>
   1ac02:	0f b6 44 24 41       	movzbl 0x41(%rsp),%eax
   1ac07:	88 43 08             	mov    %al,0x8(%rbx)
   1ac0a:	e9 5e 03 00 00       	jmp    1af6d <<hyperinterval::float::F64Enclosure>::corner_image+0x48d>
   1ac0f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1ac14:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1ac19:	48 89 e7             	mov    %rsp,%rdi
   1ac1c:	4c 89 f6             	mov    %r14,%rsi
   1ac1f:	4c 89 ea             	mov    %r13,%rdx
   1ac22:	e8 39 1a 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1ac27:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ac2b:	0f 85 32 03 00 00    	jne    1af63 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1ac31:	4c 89 f6             	mov    %r14,%rsi
   1ac34:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   1ac39:	48 89 e7             	mov    %rsp,%rdi
   1ac3c:	4c 89 ea             	mov    %r13,%rdx
   1ac3f:	4c 89 f9             	mov    %r15,%rcx
   1ac42:	e8 19 1a 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1ac47:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ac4b:	0f 85 12 03 00 00    	jne    1af63 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1ac51:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   1ac56:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1ac5d:	00 00 80 
   1ac60:	49 8d 04 36          	lea    (%r14,%rsi,1),%rax
   1ac64:	4c 8d 6e ff          	lea    -0x1(%rsi),%r13
   1ac68:	4c 89 f1             	mov    %r14,%rcx
   1ac6b:	4c 21 e9             	and    %r13,%rcx
   1ac6e:	48 89 f2             	mov    %rsi,%rdx
   1ac71:	48 29 ca             	sub    %rcx,%rdx
   1ac74:	4d 85 f6             	test   %r14,%r14
   1ac77:	48 0f 49 d0          	cmovns %rax,%rdx
   1ac7b:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
   1ac7f:	48 89 f9             	mov    %rdi,%rcx
   1ac82:	4c 21 e9             	and    %r13,%rcx
   1ac85:	48 29 ce             	sub    %rcx,%rsi
   1ac88:	48 85 ff             	test   %rdi,%rdi
   1ac8b:	48 0f 49 f0          	cmovns %rax,%rsi
   1ac8f:	41 b7 01             	mov    $0x1,%r15b
   1ac92:	48 39 f2             	cmp    %rsi,%rdx
   1ac95:	0f 87 ce 02 00 00    	ja     1af69 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1ac9b:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1aca0:	4c 89 74 24 38       	mov    %r14,0x38(%rsp)
   1aca5:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
   1acaa:	48 89 e7             	mov    %rsp,%rdi
   1acad:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1acb4:	00 00 80 
   1acb7:	4c 89 f6             	mov    %r14,%rsi
   1acba:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   1acc1:	00 f0 7f 
   1acc4:	4c 89 ea             	mov    %r13,%rdx
   1acc7:	4c 89 e1             	mov    %r12,%rcx
   1acca:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1accf:	e8 7c 1c 00 00       	call   1c950 <<hyperinterval::ieee::Format>::div>
   1acd4:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1acd8:	0f 85 6e fe ff ff    	jne    1ab4c <<hyperinterval::float::F64Enclosure>::corner_image+0x6c>
   1acde:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1ace3:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1ace8:	48 89 e7             	mov    %rsp,%rdi
   1aceb:	4c 89 f6             	mov    %r14,%rsi
   1acee:	4c 89 ea             	mov    %r13,%rdx
   1acf1:	e8 6a 19 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1acf6:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1acfa:	0f 85 63 02 00 00    	jne    1af63 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1ad00:	4c 89 ea             	mov    %r13,%rdx
   1ad03:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1ad08:	48 89 e7             	mov    %rsp,%rdi
   1ad0b:	4c 89 f6             	mov    %r14,%rsi
   1ad0e:	4c 89 e1             	mov    %r12,%rcx
   1ad11:	e8 4a 19 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1ad16:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ad1a:	0f 85 43 02 00 00    	jne    1af63 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1ad20:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1ad25:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1ad2c:	00 00 80 
   1ad2f:	4b 8d 04 2e          	lea    (%r14,%r13,1),%rax
   1ad33:	4d 89 e8             	mov    %r13,%r8
   1ad36:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1ad3b:	49 21 f8             	and    %rdi,%r8
   1ad3e:	4c 89 f6             	mov    %r14,%rsi
   1ad41:	4c 29 c6             	sub    %r8,%rsi
   1ad44:	4d 85 ed             	test   %r13,%r13
   1ad47:	48 0f 49 f0          	cmovns %rax,%rsi
   1ad4b:	4a 8d 04 31          	lea    (%rcx,%r14,1),%rax
   1ad4f:	49 89 c8             	mov    %rcx,%r8
   1ad52:	49 21 f8             	and    %rdi,%r8
   1ad55:	4c 89 f7             	mov    %r14,%rdi
   1ad58:	4c 29 c7             	sub    %r8,%rdi
   1ad5b:	48 85 c9             	test   %rcx,%rcx
   1ad5e:	48 0f 49 f8          	cmovns %rax,%rdi
   1ad62:	48 39 fe             	cmp    %rdi,%rsi
   1ad65:	0f 87 fe 01 00 00    	ja     1af69 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1ad6b:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
   1ad70:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1ad75:	4c 89 ea             	mov    %r13,%rdx
   1ad78:	e8 23 34 00 00       	call   1e1a0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1ad7d:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1ad82:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
   1ad87:	48 89 e7             	mov    %rsp,%rdi
   1ad8a:	4c 89 f6             	mov    %r14,%rsi
   1ad8d:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1ad94:	00 f0 7f 
   1ad97:	4c 89 e2             	mov    %r12,%rdx
   1ad9a:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1ad9f:	49 89 e8             	mov    %rbp,%r8
   1ada2:	e8 a9 1b 00 00       	call   1c950 <<hyperinterval::ieee::Format>::div>
   1ada7:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1adab:	0f 85 9b fd ff ff    	jne    1ab4c <<hyperinterval::float::F64Enclosure>::corner_image+0x6c>
   1adb1:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1adb6:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1adbb:	48 89 e7             	mov    %rsp,%rdi
   1adbe:	4c 89 f6             	mov    %r14,%rsi
   1adc1:	4c 89 e2             	mov    %r12,%rdx
   1adc4:	e8 97 18 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1adc9:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1adcd:	0f 85 90 01 00 00    	jne    1af63 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1add3:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1add8:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1addd:	48 89 e7             	mov    %rsp,%rdi
   1ade0:	4c 89 f6             	mov    %r14,%rsi
   1ade3:	4c 89 e2             	mov    %r12,%rdx
   1ade6:	48 89 e9             	mov    %rbp,%rcx
   1ade9:	e8 72 18 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1adee:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1adf2:	0f 85 6b 01 00 00    	jne    1af63 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1adf8:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1adfd:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1ae04:	00 00 80 
   1ae07:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
   1ae0c:	4a 8d 04 32          	lea    (%rdx,%r14,1),%rax
   1ae10:	49 89 d0             	mov    %rdx,%r8
   1ae13:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1ae18:	49 21 f8             	and    %rdi,%r8
   1ae1b:	4c 89 f6             	mov    %r14,%rsi
   1ae1e:	4c 29 c6             	sub    %r8,%rsi
   1ae21:	48 85 d2             	test   %rdx,%rdx
   1ae24:	48 0f 49 f0          	cmovns %rax,%rsi
   1ae28:	4a 8d 04 31          	lea    (%rcx,%r14,1),%rax
   1ae2c:	49 89 c8             	mov    %rcx,%r8
   1ae2f:	49 21 f8             	and    %rdi,%r8
   1ae32:	4c 89 f7             	mov    %r14,%rdi
   1ae35:	4c 29 c7             	sub    %r8,%rdi
   1ae38:	48 85 c9             	test   %rcx,%rcx
   1ae3b:	48 0f 49 f8          	cmovns %rax,%rdi
   1ae3f:	48 39 fe             	cmp    %rdi,%rsi
   1ae42:	0f 87 21 01 00 00    	ja     1af69 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1ae48:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
   1ae4d:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1ae52:	e8 49 33 00 00       	call   1e1a0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1ae57:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1ae5c:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
   1ae61:	48 89 e7             	mov    %rsp,%rdi
   1ae64:	4c 89 f6             	mov    %r14,%rsi
   1ae67:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1ae6e:	00 f0 7f 
   1ae71:	4c 89 e2             	mov    %r12,%rdx
   1ae74:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1ae79:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1ae7e:	e8 cd 1a 00 00       	call   1c950 <<hyperinterval::ieee::Format>::div>
   1ae83:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ae87:	0f 85 bf fc ff ff    	jne    1ab4c <<hyperinterval::float::F64Enclosure>::corner_image+0x6c>
   1ae8d:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1ae92:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1ae97:	48 89 e7             	mov    %rsp,%rdi
   1ae9a:	4c 89 f6             	mov    %r14,%rsi
   1ae9d:	4c 89 e2             	mov    %r12,%rdx
   1aea0:	e8 bb 17 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1aea5:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1aea9:	0f 85 b4 00 00 00    	jne    1af63 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1aeaf:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1aeb4:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1aeb9:	48 89 e7             	mov    %rsp,%rdi
   1aebc:	4c 89 f6             	mov    %r14,%rsi
   1aebf:	4c 89 e2             	mov    %r12,%rdx
   1aec2:	48 89 e9             	mov    %rbp,%rcx
   1aec5:	e8 96 17 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1aeca:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1aece:	0f 85 8f 00 00 00    	jne    1af63 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1aed4:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1aedb:	00 00 80 
   1aede:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
   1aee3:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
   1aee7:	48 89 f9             	mov    %rdi,%rcx
   1aeea:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
   1aeef:	4c 21 e9             	and    %r13,%rcx
   1aef2:	48 89 f2             	mov    %rsi,%rdx
   1aef5:	48 29 ca             	sub    %rcx,%rdx
   1aef8:	48 85 ff             	test   %rdi,%rdi
   1aefb:	48 0f 49 d0          	cmovns %rax,%rdx
   1aeff:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1af04:	48 8d 04 31          	lea    (%rcx,%rsi,1),%rax
   1af08:	49 21 cd             	and    %rcx,%r13
   1af0b:	4c 29 ee             	sub    %r13,%rsi
   1af0e:	48 85 c9             	test   %rcx,%rcx
   1af11:	48 0f 49 f0          	cmovns %rax,%rsi
   1af15:	48 39 f2             	cmp    %rsi,%rdx
   1af18:	77 4f                	ja     1af69 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1af1a:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
   1af1f:	e9 2f 03 00 00       	jmp    1b253 <<hyperinterval::float::F64Enclosure>::corner_image+0x773>
   1af24:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1af29:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
   1af2e:	48 89 e7             	mov    %rsp,%rdi
   1af31:	4c 89 f6             	mov    %r14,%rsi
   1af34:	4c 89 ea             	mov    %r13,%rdx
   1af37:	e8 24 17 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1af3c:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1af40:	74 21                	je     1af63 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1af42:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1af47:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1af4c:	48 89 e7             	mov    %rsp,%rdi
   1af4f:	4c 89 f6             	mov    %r14,%rsi
   1af52:	4c 89 ea             	mov    %r13,%rdx
   1af55:	4c 89 f9             	mov    %r15,%rcx
   1af58:	e8 03 17 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1af5d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1af61:	75 20                	jne    1af83 <<hyperinterval::float::F64Enclosure>::corner_image+0x4a3>
   1af63:	44 0f b6 7c 24 01    	movzbl 0x1(%rsp),%r15d
   1af69:	44 88 7b 08          	mov    %r15b,0x8(%rbx)
   1af6d:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1af74:	48 83 c4 68          	add    $0x68,%rsp
   1af78:	5b                   	pop    %rbx
   1af79:	41 5c                	pop    %r12
   1af7b:	41 5d                	pop    %r13
   1af7d:	41 5e                	pop    %r14
   1af7f:	41 5f                	pop    %r15
   1af81:	5d                   	pop    %rbp
   1af82:	c3                   	ret
   1af83:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   1af88:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1af8f:	00 00 80 
   1af92:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   1af97:	4a 8d 04 36          	lea    (%rsi,%r14,1),%rax
   1af9b:	4d 8d 6e ff          	lea    -0x1(%r14),%r13
   1af9f:	48 89 f1             	mov    %rsi,%rcx
   1afa2:	4c 21 e9             	and    %r13,%rcx
   1afa5:	4c 89 f2             	mov    %r14,%rdx
   1afa8:	48 29 ca             	sub    %rcx,%rdx
   1afab:	48 85 f6             	test   %rsi,%rsi
   1afae:	48 0f 49 d0          	cmovns %rax,%rdx
   1afb2:	4a 8d 04 37          	lea    (%rdi,%r14,1),%rax
   1afb6:	48 89 f9             	mov    %rdi,%rcx
   1afb9:	4c 21 e9             	and    %r13,%rcx
   1afbc:	4c 89 f6             	mov    %r14,%rsi
   1afbf:	48 29 ce             	sub    %rcx,%rsi
   1afc2:	48 85 ff             	test   %rdi,%rdi
   1afc5:	48 0f 49 f0          	cmovns %rax,%rsi
   1afc9:	41 b7 01             	mov    $0x1,%r15b
   1afcc:	48 39 f2             	cmp    %rsi,%rdx
   1afcf:	77 98                	ja     1af69 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1afd1:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1afd6:	4c 89 6c 24 38       	mov    %r13,0x38(%rsp)
   1afdb:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1afe0:	4c 89 f6             	mov    %r14,%rsi
   1afe3:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   1afea:	00 f0 7f 
   1afed:	4c 89 ea             	mov    %r13,%rdx
   1aff0:	4c 89 e1             	mov    %r12,%rcx
   1aff3:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1aff8:	e8 93 1d 00 00       	call   1cd90 <<hyperinterval::ieee::Format>::mul>
   1affd:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1b002:	0f 85 fa fb ff ff    	jne    1ac02 <<hyperinterval::float::F64Enclosure>::corner_image+0x122>
   1b008:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1b00d:	4c 8b 64 24 50       	mov    0x50(%rsp),%r12
   1b012:	48 89 e7             	mov    %rsp,%rdi
   1b015:	4c 89 f6             	mov    %r14,%rsi
   1b018:	4c 89 ea             	mov    %r13,%rdx
   1b01b:	e8 40 16 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1b020:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b024:	0f 85 39 ff ff ff    	jne    1af63 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1b02a:	4c 89 ea             	mov    %r13,%rdx
   1b02d:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1b032:	48 89 e7             	mov    %rsp,%rdi
   1b035:	4c 89 f6             	mov    %r14,%rsi
   1b038:	4c 89 e1             	mov    %r12,%rcx
   1b03b:	e8 20 16 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1b040:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b044:	0f 85 19 ff ff ff    	jne    1af63 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1b04a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b04f:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b056:	00 00 80 
   1b059:	4b 8d 04 2e          	lea    (%r14,%r13,1),%rax
   1b05d:	4d 89 e8             	mov    %r13,%r8
   1b060:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
   1b065:	49 21 f8             	and    %rdi,%r8
   1b068:	4c 89 f6             	mov    %r14,%rsi
   1b06b:	4c 29 c6             	sub    %r8,%rsi
   1b06e:	4d 85 ed             	test   %r13,%r13
   1b071:	48 0f 49 f0          	cmovns %rax,%rsi
   1b075:	4a 8d 04 31          	lea    (%rcx,%r14,1),%rax
   1b079:	49 89 c8             	mov    %rcx,%r8
   1b07c:	49 21 f8             	and    %rdi,%r8
   1b07f:	4c 89 f7             	mov    %r14,%rdi
   1b082:	4c 29 c7             	sub    %r8,%rdi
   1b085:	48 85 c9             	test   %rcx,%rcx
   1b088:	48 0f 49 f8          	cmovns %rax,%rdi
   1b08c:	48 39 fe             	cmp    %rdi,%rsi
   1b08f:	0f 87 d4 fe ff ff    	ja     1af69 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1b095:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1b09a:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1b09f:	4c 89 ea             	mov    %r13,%rdx
   1b0a2:	e8 f9 30 00 00       	call   1e1a0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1b0a7:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1b0ac:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
   1b0b1:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1b0b6:	4c 89 f6             	mov    %r14,%rsi
   1b0b9:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1b0c0:	00 f0 7f 
   1b0c3:	4c 89 e2             	mov    %r12,%rdx
   1b0c6:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1b0cb:	49 89 e8             	mov    %rbp,%r8
   1b0ce:	e8 bd 1c 00 00       	call   1cd90 <<hyperinterval::ieee::Format>::mul>
   1b0d3:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1b0d8:	0f 85 24 fb ff ff    	jne    1ac02 <<hyperinterval::float::F64Enclosure>::corner_image+0x122>
   1b0de:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1b0e3:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
   1b0e8:	48 89 e7             	mov    %rsp,%rdi
   1b0eb:	4c 89 f6             	mov    %r14,%rsi
   1b0ee:	4c 89 e2             	mov    %r12,%rdx
   1b0f1:	e8 6a 15 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1b0f6:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b0fa:	0f 85 63 fe ff ff    	jne    1af63 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1b100:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b105:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1b10a:	48 89 e7             	mov    %rsp,%rdi
   1b10d:	4c 89 f6             	mov    %r14,%rsi
   1b110:	4c 89 e2             	mov    %r12,%rdx
   1b113:	48 89 e9             	mov    %rbp,%rcx
   1b116:	e8 45 15 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1b11b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b11f:	0f 85 3e fe ff ff    	jne    1af63 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1b125:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b12a:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b131:	00 00 80 
   1b134:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
   1b139:	4a 8d 04 32          	lea    (%rdx,%r14,1),%rax
   1b13d:	49 89 d0             	mov    %rdx,%r8
   1b140:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
   1b145:	49 21 f8             	and    %rdi,%r8
   1b148:	4c 89 f6             	mov    %r14,%rsi
   1b14b:	4c 29 c6             	sub    %r8,%rsi
   1b14e:	48 85 d2             	test   %rdx,%rdx
   1b151:	48 0f 49 f0          	cmovns %rax,%rsi
   1b155:	4a 8d 04 31          	lea    (%rcx,%r14,1),%rax
   1b159:	49 89 c8             	mov    %rcx,%r8
   1b15c:	49 21 f8             	and    %rdi,%r8
   1b15f:	4c 89 f7             	mov    %r14,%rdi
   1b162:	4c 29 c7             	sub    %r8,%rdi
   1b165:	48 85 c9             	test   %rcx,%rcx
   1b168:	48 0f 49 f8          	cmovns %rax,%rdi
   1b16c:	48 39 fe             	cmp    %rdi,%rsi
   1b16f:	0f 87 f4 fd ff ff    	ja     1af69 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1b175:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1b17a:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1b17f:	e8 1c 30 00 00       	call   1e1a0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1b184:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1b189:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
   1b18e:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1b193:	4c 89 f6             	mov    %r14,%rsi
   1b196:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1b19d:	00 f0 7f 
   1b1a0:	4c 89 e2             	mov    %r12,%rdx
   1b1a3:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1b1a8:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1b1ad:	e8 de 1b 00 00       	call   1cd90 <<hyperinterval::ieee::Format>::mul>
   1b1b2:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1b1b7:	0f 85 45 fa ff ff    	jne    1ac02 <<hyperinterval::float::F64Enclosure>::corner_image+0x122>
   1b1bd:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1b1c2:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
   1b1c7:	48 89 e7             	mov    %rsp,%rdi
   1b1ca:	4c 89 f6             	mov    %r14,%rsi
   1b1cd:	4c 89 e2             	mov    %r12,%rdx
   1b1d0:	e8 8b 14 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1b1d5:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b1d9:	0f 85 84 fd ff ff    	jne    1af63 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1b1df:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b1e4:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1b1e9:	48 89 e7             	mov    %rsp,%rdi
   1b1ec:	4c 89 f6             	mov    %r14,%rsi
   1b1ef:	4c 89 e2             	mov    %r12,%rdx
   1b1f2:	48 89 e9             	mov    %rbp,%rcx
   1b1f5:	e8 66 14 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1b1fa:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b1fe:	0f 85 5f fd ff ff    	jne    1af63 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1b204:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b20b:	00 00 80 
   1b20e:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
   1b213:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
   1b217:	48 89 f9             	mov    %rdi,%rcx
   1b21a:	4c 8b 6c 24 38       	mov    0x38(%rsp),%r13
   1b21f:	4c 21 e9             	and    %r13,%rcx
   1b222:	48 89 f2             	mov    %rsi,%rdx
   1b225:	48 29 ca             	sub    %rcx,%rdx
   1b228:	48 85 ff             	test   %rdi,%rdi
   1b22b:	48 0f 49 d0          	cmovns %rax,%rdx
   1b22f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b234:	48 8d 04 31          	lea    (%rcx,%rsi,1),%rax
   1b238:	49 21 cd             	and    %rcx,%r13
   1b23b:	4c 29 ee             	sub    %r13,%rsi
   1b23e:	48 85 c9             	test   %rcx,%rcx
   1b241:	48 0f 49 f0          	cmovns %rax,%rsi
   1b245:	48 39 f2             	cmp    %rsi,%rdx
   1b248:	0f 87 1b fd ff ff    	ja     1af69 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1b24e:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1b253:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1b258:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
   1b25d:	e8 3e 2f 00 00       	call   1e1a0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1b262:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1b269:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1b26d:	48 89 53 10          	mov    %rdx,0x10(%rbx)
   1b271:	e9 fe fc ff ff       	jmp    1af74 <<hyperinterval::float::F64Enclosure>::corner_image+0x494>
   1b276:	cc                   	int3
   1b277:	cc                   	int3
   1b278:	cc                   	int3
   1b279:	cc                   	int3
   1b27a:	cc                   	int3
   1b27b:	cc                   	int3
   1b27c:	cc                   	int3
   1b27d:	cc                   	int3
   1b27e:	cc                   	int3
   1b27f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::intersection:
   1b280:	48 89 f8             	mov    %rdi,%rax
   1b283:	45 31 c0             	xor    %r8d,%r8d
   1b286:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b28a:	0f 85 d5 00 00 00    	jne    1b365 <<hyperinterval::float::F64Enclosure>::intersection+0xe5>
   1b290:	f6 02 01             	testb  $0x1,(%rdx)
   1b293:	0f 84 c0 00 00 00    	je     1b359 <<hyperinterval::float::F64Enclosure>::intersection+0xd9>
   1b299:	41 56                	push   %r14
   1b29b:	53                   	push   %rbx
   1b29c:	4c 8b 52 08          	mov    0x8(%rdx),%r10
   1b2a0:	4c 8b 4a 10          	mov    0x10(%rdx),%r9
   1b2a4:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1b2a8:	48 ba 00 00 00 00 00 	movabs $0x8000000000000000,%rdx
   1b2af:	00 00 80 
   1b2b2:	48 8d 3c 11          	lea    (%rcx,%rdx,1),%rdi
   1b2b6:	4c 8d 42 ff          	lea    -0x1(%rdx),%r8
   1b2ba:	49 89 cb             	mov    %rcx,%r11
   1b2bd:	4d 21 c3             	and    %r8,%r11
   1b2c0:	48 89 d3             	mov    %rdx,%rbx
   1b2c3:	4c 29 db             	sub    %r11,%rbx
   1b2c6:	48 85 c9             	test   %rcx,%rcx
   1b2c9:	48 0f 49 df          	cmovns %rdi,%rbx
   1b2cd:	49 8d 3c 12          	lea    (%r10,%rdx,1),%rdi
   1b2d1:	4d 89 d3             	mov    %r10,%r11
   1b2d4:	4d 21 c3             	and    %r8,%r11
   1b2d7:	49 89 d6             	mov    %rdx,%r14
   1b2da:	4d 29 de             	sub    %r11,%r14
   1b2dd:	4d 85 d2             	test   %r10,%r10
   1b2e0:	4c 0f 49 f7          	cmovns %rdi,%r14
   1b2e4:	48 8b 7e 10          	mov    0x10(%rsi),%rdi
   1b2e8:	4c 39 f3             	cmp    %r14,%rbx
   1b2eb:	49 0f 42 ca          	cmovb  %r10,%rcx
   1b2ef:	48 8d 34 17          	lea    (%rdi,%rdx,1),%rsi
   1b2f3:	49 89 fa             	mov    %rdi,%r10
   1b2f6:	4d 21 c2             	and    %r8,%r10
   1b2f9:	49 89 d3             	mov    %rdx,%r11
   1b2fc:	4d 29 d3             	sub    %r10,%r11
   1b2ff:	48 85 ff             	test   %rdi,%rdi
   1b302:	4c 0f 49 de          	cmovns %rsi,%r11
   1b306:	49 8d 34 11          	lea    (%r9,%rdx,1),%rsi
   1b30a:	4d 89 ca             	mov    %r9,%r10
   1b30d:	4d 21 c2             	and    %r8,%r10
   1b310:	48 89 d3             	mov    %rdx,%rbx
   1b313:	4c 29 d3             	sub    %r10,%rbx
   1b316:	4d 85 c9             	test   %r9,%r9
   1b319:	48 0f 49 de          	cmovns %rsi,%rbx
   1b31d:	49 39 db             	cmp    %rbx,%r11
   1b320:	49 0f 47 f9          	cmova  %r9,%rdi
   1b324:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
   1b328:	49 89 c9             	mov    %rcx,%r9
   1b32b:	4d 21 c1             	and    %r8,%r9
   1b32e:	49 89 d2             	mov    %rdx,%r10
   1b331:	4d 29 ca             	sub    %r9,%r10
   1b334:	48 85 c9             	test   %rcx,%rcx
   1b337:	4c 0f 49 d6          	cmovns %rsi,%r10
   1b33b:	48 8d 34 17          	lea    (%rdi,%rdx,1),%rsi
   1b33f:	49 21 f8             	and    %rdi,%r8
   1b342:	4c 29 c2             	sub    %r8,%rdx
   1b345:	48 85 ff             	test   %rdi,%rdi
   1b348:	48 0f 49 d6          	cmovns %rsi,%rdx
   1b34c:	45 31 c0             	xor    %r8d,%r8d
   1b34f:	49 39 d2             	cmp    %rdx,%r10
   1b352:	41 0f 96 c0          	setbe  %r8b
   1b356:	5b                   	pop    %rbx
   1b357:	41 5e                	pop    %r14
   1b359:	4c 89 00             	mov    %r8,(%rax)
   1b35c:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1b360:	48 89 78 10          	mov    %rdi,0x10(%rax)
   1b364:	c3                   	ret
   1b365:	4c 89 00             	mov    %r8,(%rax)
   1b368:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1b36c:	48 89 78 10          	mov    %rdi,0x10(%rax)
   1b370:	c3                   	ret
   1b371:	cc                   	int3
   1b372:	cc                   	int3
   1b373:	cc                   	int3
   1b374:	cc                   	int3
   1b375:	cc                   	int3
   1b376:	cc                   	int3
   1b377:	cc                   	int3
   1b378:	cc                   	int3
   1b379:	cc                   	int3
   1b37a:	cc                   	int3
   1b37b:	cc                   	int3
   1b37c:	cc                   	int3
   1b37d:	cc                   	int3
   1b37e:	cc                   	int3
   1b37f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::contains_point:
   1b380:	41 56                	push   %r14
   1b382:	53                   	push   %rbx
   1b383:	48 83 ec 18          	sub    $0x18,%rsp
   1b387:	49 89 fe             	mov    %rdi,%r14
   1b38a:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1b391:	00 00 80 
   1b394:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1b399:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1b39e:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1b3a5:	00 f0 7f 
   1b3a8:	48 89 de             	mov    %rbx,%rsi
   1b3ab:	e8 b0 12 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1b3b0:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1b3b5:	3c 01                	cmp    $0x1,%al
   1b3b7:	75 0d                	jne    1b3c6 <<hyperinterval::float::F64Enclosure>::contains_point+0x46>
   1b3b9:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   1b3be:	48 83 c4 18          	add    $0x18,%rsp
   1b3c2:	5b                   	pop    %rbx
   1b3c3:	41 5e                	pop    %r14
   1b3c5:	c3                   	ret
   1b3c6:	49 83 3e 01          	cmpq   $0x1,(%r14)
   1b3ca:	75 40                	jne    1b40c <<hyperinterval::float::F64Enclosure>::contains_point+0x8c>
   1b3cc:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1b3d1:	49 8b 56 08          	mov    0x8(%r14),%rdx
   1b3d5:	48 8d 3c 1a          	lea    (%rdx,%rbx,1),%rdi
   1b3d9:	48 8d 4b ff          	lea    -0x1(%rbx),%rcx
   1b3dd:	49 89 d0             	mov    %rdx,%r8
   1b3e0:	49 21 c8             	and    %rcx,%r8
   1b3e3:	49 89 d9             	mov    %rbx,%r9
   1b3e6:	4d 29 c1             	sub    %r8,%r9
   1b3e9:	48 85 d2             	test   %rdx,%rdx
   1b3ec:	4c 0f 49 cf          	cmovns %rdi,%r9
   1b3f0:	48 8d 3c 1e          	lea    (%rsi,%rbx,1),%rdi
   1b3f4:	49 89 f0             	mov    %rsi,%r8
   1b3f7:	49 21 c8             	and    %rcx,%r8
   1b3fa:	48 89 da             	mov    %rbx,%rdx
   1b3fd:	4c 29 c2             	sub    %r8,%rdx
   1b400:	48 85 f6             	test   %rsi,%rsi
   1b403:	48 0f 49 d7          	cmovns %rdi,%rdx
   1b407:	49 39 d1             	cmp    %rdx,%r9
   1b40a:	76 0a                	jbe    1b416 <<hyperinterval::float::F64Enclosure>::contains_point+0x96>
   1b40c:	31 d2                	xor    %edx,%edx
   1b40e:	48 83 c4 18          	add    $0x18,%rsp
   1b412:	5b                   	pop    %rbx
   1b413:	41 5e                	pop    %r14
   1b415:	c3                   	ret
   1b416:	49 8b 76 10          	mov    0x10(%r14),%rsi
   1b41a:	48 8d 3c 1e          	lea    (%rsi,%rbx,1),%rdi
   1b41e:	48 21 f1             	and    %rsi,%rcx
   1b421:	48 29 cb             	sub    %rcx,%rbx
   1b424:	48 85 f6             	test   %rsi,%rsi
   1b427:	48 0f 49 df          	cmovns %rdi,%rbx
   1b42b:	48 39 da             	cmp    %rbx,%rdx
   1b42e:	0f 96 c2             	setbe  %dl
   1b431:	48 83 c4 18          	add    $0x18,%rsp
   1b435:	5b                   	pop    %rbx
   1b436:	41 5e                	pop    %r14
   1b438:	c3                   	ret
   1b439:	cc                   	int3
   1b43a:	cc                   	int3
   1b43b:	cc                   	int3
   1b43c:	cc                   	int3
   1b43d:	cc                   	int3
   1b43e:	cc                   	int3
   1b43f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::interior_subset_of:
   1b440:	b0 01                	mov    $0x1,%al
   1b442:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1b446:	0f 85 8b 00 00 00    	jne    1b4d7 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x97>
   1b44c:	f6 06 01             	testb  $0x1,(%rsi)
   1b44f:	0f 84 80 00 00 00    	je     1b4d5 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x95>
   1b455:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1b459:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1b45d:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1b464:	00 00 80 
   1b467:	4d 8d 0c 00          	lea    (%r8,%rax,1),%r9
   1b46b:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1b46f:	4d 89 c2             	mov    %r8,%r10
   1b472:	49 21 ca             	and    %rcx,%r10
   1b475:	49 89 c3             	mov    %rax,%r11
   1b478:	4d 29 d3             	sub    %r10,%r11
   1b47b:	4d 85 c0             	test   %r8,%r8
   1b47e:	4d 0f 49 d9          	cmovns %r9,%r11
   1b482:	4c 8d 04 02          	lea    (%rdx,%rax,1),%r8
   1b486:	49 89 d1             	mov    %rdx,%r9
   1b489:	49 21 c9             	and    %rcx,%r9
   1b48c:	49 89 c2             	mov    %rax,%r10
   1b48f:	4d 29 ca             	sub    %r9,%r10
   1b492:	48 85 d2             	test   %rdx,%rdx
   1b495:	4d 0f 49 d0          	cmovns %r8,%r10
   1b499:	4d 39 d3             	cmp    %r10,%r11
   1b49c:	73 37                	jae    1b4d5 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x95>
   1b49e:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1b4a2:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1b4a6:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1b4aa:	49 89 d0             	mov    %rdx,%r8
   1b4ad:	49 21 c8             	and    %rcx,%r8
   1b4b0:	49 89 c1             	mov    %rax,%r9
   1b4b3:	4d 29 c1             	sub    %r8,%r9
   1b4b6:	48 85 d2             	test   %rdx,%rdx
   1b4b9:	4c 0f 49 cf          	cmovns %rdi,%r9
   1b4bd:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1b4c1:	48 21 f1             	and    %rsi,%rcx
   1b4c4:	48 29 c8             	sub    %rcx,%rax
   1b4c7:	48 85 f6             	test   %rsi,%rsi
   1b4ca:	48 0f 49 c2          	cmovns %rdx,%rax
   1b4ce:	49 39 c1             	cmp    %rax,%r9
   1b4d1:	0f 92 c0             	setb   %al
   1b4d4:	c3                   	ret
   1b4d5:	31 c0                	xor    %eax,%eax
   1b4d7:	c3                   	ret
   1b4d8:	cc                   	int3
   1b4d9:	cc                   	int3
   1b4da:	cc                   	int3
   1b4db:	cc                   	int3
   1b4dc:	cc                   	int3
   1b4dd:	cc                   	int3
   1b4de:	cc                   	int3
   1b4df:	cc                   	int3

<hyperinterval::float::F64Enclosure>::add:
   1b4e0:	48 89 f8             	mov    %rdi,%rax
   1b4e3:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b4e7:	0f 85 cb 00 00 00    	jne    1b5b8 <<hyperinterval::float::F64Enclosure>::add+0xd8>
   1b4ed:	f6 02 01             	testb  $0x1,(%rdx)
   1b4f0:	0f 84 c2 00 00 00    	je     1b5b8 <<hyperinterval::float::F64Enclosure>::add+0xd8>
   1b4f6:	55                   	push   %rbp
   1b4f7:	41 57                	push   %r15
   1b4f9:	41 56                	push   %r14
   1b4fb:	41 55                	push   %r13
   1b4fd:	41 54                	push   %r12
   1b4ff:	53                   	push   %rbx
   1b500:	48 83 ec 18          	sub    $0x18,%rsp
   1b504:	48 89 c5             	mov    %rax,%rbp
   1b507:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1b50b:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1b50f:	4c 8b 62 10          	mov    0x10(%rdx),%r12
   1b513:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1b51a:	00 00 80 
   1b51d:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1b524:	00 f0 7f 
   1b527:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   1b52b:	48 89 e7             	mov    %rsp,%rdi
   1b52e:	48 89 de             	mov    %rbx,%rsi
   1b531:	4c 89 f2             	mov    %r14,%rdx
   1b534:	e8 67 11 00 00       	call   1c6a0 <<hyperinterval::ieee::Format>::add>
   1b539:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b53d:	74 57                	je     1b596 <<hyperinterval::float::F64Enclosure>::add+0xb6>
   1b53f:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1b544:	48 89 e7             	mov    %rsp,%rdi
   1b547:	48 89 de             	mov    %rbx,%rsi
   1b54a:	4c 89 f2             	mov    %r14,%rdx
   1b54d:	4c 89 f9             	mov    %r15,%rcx
   1b550:	4d 89 e0             	mov    %r12,%r8
   1b553:	e8 48 11 00 00       	call   1c6a0 <<hyperinterval::ieee::Format>::add>
   1b558:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b55c:	74 38                	je     1b596 <<hyperinterval::float::F64Enclosure>::add+0xb6>
   1b55e:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1b563:	48 89 e7             	mov    %rsp,%rdi
   1b566:	48 89 de             	mov    %rbx,%rsi
   1b569:	4c 89 f2             	mov    %r14,%rdx
   1b56c:	4c 89 e9             	mov    %r13,%rcx
   1b56f:	e8 ec 10 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1b574:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b578:	74 1c                	je     1b596 <<hyperinterval::float::F64Enclosure>::add+0xb6>
   1b57a:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1b57f:	48 89 e7             	mov    %rsp,%rdi
   1b582:	48 89 de             	mov    %rbx,%rsi
   1b585:	4c 89 f2             	mov    %r14,%rdx
   1b588:	4c 89 f9             	mov    %r15,%rcx
   1b58b:	e8 d0 10 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1b590:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b594:	75 2a                	jne    1b5c0 <<hyperinterval::float::F64Enclosure>::add+0xe0>
   1b596:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   1b59b:	48 89 e8             	mov    %rbp,%rax
   1b59e:	88 4d 08             	mov    %cl,0x8(%rbp)
   1b5a1:	48 c7 45 00 02 00 00 	movq   $0x2,0x0(%rbp)
   1b5a8:	00 
   1b5a9:	48 83 c4 18          	add    $0x18,%rsp
   1b5ad:	5b                   	pop    %rbx
   1b5ae:	41 5c                	pop    %r12
   1b5b0:	41 5d                	pop    %r13
   1b5b2:	41 5e                	pop    %r14
   1b5b4:	41 5f                	pop    %r15
   1b5b6:	5d                   	pop    %rbp
   1b5b7:	c3                   	ret
   1b5b8:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   1b5bf:	c3                   	ret
   1b5c0:	49 8d 04 1c          	lea    (%r12,%rbx,1),%rax
   1b5c4:	48 8d 53 ff          	lea    -0x1(%rbx),%rdx
   1b5c8:	4c 89 e1             	mov    %r12,%rcx
   1b5cb:	48 21 d1             	and    %rdx,%rcx
   1b5ce:	48 89 de             	mov    %rbx,%rsi
   1b5d1:	48 29 ce             	sub    %rcx,%rsi
   1b5d4:	4d 85 e4             	test   %r12,%r12
   1b5d7:	48 0f 49 f0          	cmovns %rax,%rsi
   1b5db:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b5e0:	48 8d 04 19          	lea    (%rcx,%rbx,1),%rax
   1b5e4:	48 21 ca             	and    %rcx,%rdx
   1b5e7:	48 29 d3             	sub    %rdx,%rbx
   1b5ea:	48 85 c9             	test   %rcx,%rcx
   1b5ed:	48 0f 49 d8          	cmovns %rax,%rbx
   1b5f1:	48 39 de             	cmp    %rbx,%rsi
   1b5f4:	48 89 e8             	mov    %rbp,%rax
   1b5f7:	76 0d                	jbe    1b606 <<hyperinterval::float::F64Enclosure>::add+0x126>
   1b5f9:	c6 40 08 01          	movb   $0x1,0x8(%rax)
   1b5fd:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1b604:	eb a3                	jmp    1b5a9 <<hyperinterval::float::F64Enclosure>::add+0xc9>
   1b606:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   1b60d:	4c 89 60 08          	mov    %r12,0x8(%rax)
   1b611:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1b615:	eb 92                	jmp    1b5a9 <<hyperinterval::float::F64Enclosure>::add+0xc9>
   1b617:	cc                   	int3
   1b618:	cc                   	int3
   1b619:	cc                   	int3
   1b61a:	cc                   	int3
   1b61b:	cc                   	int3
   1b61c:	cc                   	int3
   1b61d:	cc                   	int3
   1b61e:	cc                   	int3
   1b61f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::div:
   1b620:	53                   	push   %rbx
   1b621:	48 89 fb             	mov    %rdi,%rbx
   1b624:	83 3a 01             	cmpl   $0x1,(%rdx)
   1b627:	75 1e                	jne    1b647 <<hyperinterval::float::F64Enclosure>::div+0x27>
   1b629:	48 83 7a 08 00       	cmpq   $0x0,0x8(%rdx)
   1b62e:	7f 17                	jg     1b647 <<hyperinterval::float::F64Enclosure>::div+0x27>
   1b630:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1b634:	48 85 c0             	test   %rax,%rax
   1b637:	0f 99 c1             	setns  %cl
   1b63a:	48 d1 e0             	shl    $1,%rax
   1b63d:	48 85 c0             	test   %rax,%rax
   1b640:	0f 94 c0             	sete   %al
   1b643:	08 c8                	or     %cl,%al
   1b645:	75 12                	jne    1b659 <<hyperinterval::float::F64Enclosure>::div+0x39>
   1b647:	48 89 df             	mov    %rbx,%rdi
   1b64a:	b9 01 00 00 00       	mov    $0x1,%ecx
   1b64f:	e8 8c f4 ff ff       	call   1aae0 <<hyperinterval::float::F64Enclosure>::corner_image>
   1b654:	48 89 d8             	mov    %rbx,%rax
   1b657:	5b                   	pop    %rbx
   1b658:	c3                   	ret
   1b659:	c6 43 08 06          	movb   $0x6,0x8(%rbx)
   1b65d:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b664:	48 89 d8             	mov    %rbx,%rax
   1b667:	5b                   	pop    %rbx
   1b668:	c3                   	ret
   1b669:	cc                   	int3
   1b66a:	cc                   	int3
   1b66b:	cc                   	int3
   1b66c:	cc                   	int3
   1b66d:	cc                   	int3
   1b66e:	cc                   	int3
   1b66f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::new:
   1b670:	41 57                	push   %r15
   1b672:	41 56                	push   %r14
   1b674:	41 54                	push   %r12
   1b676:	53                   	push   %rbx
   1b677:	48 83 ec 18          	sub    $0x18,%rsp
   1b67b:	f2 0f 11 4c 24 10    	movsd  %xmm1,0x10(%rsp)
   1b681:	48 89 fb             	mov    %rdi,%rbx
   1b684:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b68b:	00 00 80 
   1b68e:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1b695:	00 f0 7f 
   1b698:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1b69d:	48 89 e7             	mov    %rsp,%rdi
   1b6a0:	4c 89 f6             	mov    %r14,%rsi
   1b6a3:	4c 89 fa             	mov    %r15,%rdx
   1b6a6:	e8 b5 0f 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1b6ab:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b6af:	74 24                	je     1b6d5 <<hyperinterval::float::F64Enclosure>::new+0x65>
   1b6b1:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1b6b6:	f3 0f 7e 44 24 10    	movq   0x10(%rsp),%xmm0
   1b6bc:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1b6c1:	48 89 e7             	mov    %rsp,%rdi
   1b6c4:	4c 89 f6             	mov    %r14,%rsi
   1b6c7:	4c 89 fa             	mov    %r15,%rdx
   1b6ca:	e8 91 0f 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1b6cf:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b6d3:	75 1e                	jne    1b6f3 <<hyperinterval::float::F64Enclosure>::new+0x83>
   1b6d5:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1b6da:	88 43 08             	mov    %al,0x8(%rbx)
   1b6dd:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b6e4:	48 89 d8             	mov    %rbx,%rax
   1b6e7:	48 83 c4 18          	add    $0x18,%rsp
   1b6eb:	5b                   	pop    %rbx
   1b6ec:	41 5c                	pop    %r12
   1b6ee:	41 5e                	pop    %r14
   1b6f0:	41 5f                	pop    %r15
   1b6f2:	c3                   	ret
   1b6f3:	4b 8d 04 34          	lea    (%r12,%r14,1),%rax
   1b6f7:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1b6fb:	4c 89 e2             	mov    %r12,%rdx
   1b6fe:	48 21 ca             	and    %rcx,%rdx
   1b701:	4c 89 f6             	mov    %r14,%rsi
   1b704:	48 29 d6             	sub    %rdx,%rsi
   1b707:	4d 85 e4             	test   %r12,%r12
   1b70a:	48 0f 49 f0          	cmovns %rax,%rsi
   1b70e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b713:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1b717:	48 21 c1             	and    %rax,%rcx
   1b71a:	49 29 ce             	sub    %rcx,%r14
   1b71d:	48 85 c0             	test   %rax,%rax
   1b720:	4c 0f 49 f2          	cmovns %rdx,%r14
   1b724:	4c 39 f6             	cmp    %r14,%rsi
   1b727:	76 06                	jbe    1b72f <<hyperinterval::float::F64Enclosure>::new+0xbf>
   1b729:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1b72d:	eb ae                	jmp    1b6dd <<hyperinterval::float::F64Enclosure>::new+0x6d>
   1b72f:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1b736:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   1b73a:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1b73e:	eb a4                	jmp    1b6e4 <<hyperinterval::float::F64Enclosure>::new+0x74>

<hyperinterval::float::F64Enclosure>::sub:
   1b740:	53                   	push   %rbx
   1b741:	48 83 ec 20          	sub    $0x20,%rsp
   1b745:	48 89 fb             	mov    %rdi,%rbx
   1b748:	48 83 3a 01          	cmpq   $0x1,(%rdx)
   1b74c:	75 30                	jne    1b77e <<hyperinterval::float::F64Enclosure>::sub+0x3e>
   1b74e:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   1b752:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1b756:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1b75d:	00 00 80 
   1b760:	48 89 d1             	mov    %rdx,%rcx
   1b763:	48 31 c1             	xor    %rax,%rcx
   1b766:	48 85 d2             	test   %rdx,%rdx
   1b769:	48 0f 44 ca          	cmove  %rdx,%rcx
   1b76d:	48 31 f8             	xor    %rdi,%rax
   1b770:	48 85 ff             	test   %rdi,%rdi
   1b773:	48 0f 44 c7          	cmove  %rdi,%rax
   1b777:	ba 01 00 00 00       	mov    $0x1,%edx
   1b77c:	eb 02                	jmp    1b780 <<hyperinterval::float::F64Enclosure>::sub+0x40>
   1b77e:	31 d2                	xor    %edx,%edx
   1b780:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b785:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
   1b78a:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1b78f:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
   1b794:	48 89 df             	mov    %rbx,%rdi
   1b797:	ff 15 eb 1e 04 00    	call   *0x41eeb(%rip)        # 5d688 <_DYNAMIC+0x300>
   1b79d:	48 89 d8             	mov    %rbx,%rax
   1b7a0:	48 83 c4 20          	add    $0x20,%rsp
   1b7a4:	5b                   	pop    %rbx
   1b7a5:	c3                   	ret
   1b7a6:	cc                   	int3
   1b7a7:	cc                   	int3
   1b7a8:	cc                   	int3
   1b7a9:	cc                   	int3
   1b7aa:	cc                   	int3
   1b7ab:	cc                   	int3
   1b7ac:	cc                   	int3
   1b7ad:	cc                   	int3
   1b7ae:	cc                   	int3
   1b7af:	cc                   	int3

<hyperinterval::float::F64Enclosure>::hull:
   1b7b0:	48 89 f8             	mov    %rdi,%rax
   1b7b3:	4c 8b 02             	mov    (%rdx),%r8
   1b7b6:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   1b7ba:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
   1b7be:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b7c2:	0f 85 9f 00 00 00    	jne    1b867 <<hyperinterval::float::F64Enclosure>::hull+0xb7>
   1b7c8:	4c 8b 56 08          	mov    0x8(%rsi),%r10
   1b7cc:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1b7d0:	ba 01 00 00 00       	mov    $0x1,%edx
   1b7d5:	49 83 f8 01          	cmp    $0x1,%r8
   1b7d9:	0f 85 97 00 00 00    	jne    1b876 <<hyperinterval::float::F64Enclosure>::hull+0xc6>
   1b7df:	41 57                	push   %r15
   1b7e1:	41 56                	push   %r14
   1b7e3:	53                   	push   %rbx
   1b7e4:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1b7eb:	00 00 80 
   1b7ee:	4f 8d 1c 02          	lea    (%r10,%r8,1),%r11
   1b7f2:	4d 8d 48 ff          	lea    -0x1(%r8),%r9
   1b7f6:	4c 89 d3             	mov    %r10,%rbx
   1b7f9:	4c 21 cb             	and    %r9,%rbx
   1b7fc:	4d 89 c6             	mov    %r8,%r14
   1b7ff:	49 29 de             	sub    %rbx,%r14
   1b802:	4d 85 d2             	test   %r10,%r10
   1b805:	4d 0f 49 f3          	cmovns %r11,%r14
   1b809:	4e 8d 1c 07          	lea    (%rdi,%r8,1),%r11
   1b80d:	48 89 fb             	mov    %rdi,%rbx
   1b810:	4c 21 cb             	and    %r9,%rbx
   1b813:	4d 89 c7             	mov    %r8,%r15
   1b816:	49 29 df             	sub    %rbx,%r15
   1b819:	48 85 ff             	test   %rdi,%rdi
   1b81c:	4d 0f 49 fb          	cmovns %r11,%r15
   1b820:	4d 39 fe             	cmp    %r15,%r14
   1b823:	49 0f 46 fa          	cmovbe %r10,%rdi
   1b827:	4e 8d 14 06          	lea    (%rsi,%r8,1),%r10
   1b82b:	49 89 f3             	mov    %rsi,%r11
   1b82e:	4d 21 cb             	and    %r9,%r11
   1b831:	4c 89 c3             	mov    %r8,%rbx
   1b834:	4c 29 db             	sub    %r11,%rbx
   1b837:	48 85 f6             	test   %rsi,%rsi
   1b83a:	49 0f 49 da          	cmovns %r10,%rbx
   1b83e:	4e 8d 14 01          	lea    (%rcx,%r8,1),%r10
   1b842:	49 21 c9             	and    %rcx,%r9
   1b845:	4d 29 c8             	sub    %r9,%r8
   1b848:	48 85 c9             	test   %rcx,%rcx
   1b84b:	4d 0f 49 c2          	cmovns %r10,%r8
   1b84f:	4c 39 c3             	cmp    %r8,%rbx
   1b852:	48 0f 43 ce          	cmovae %rsi,%rcx
   1b856:	5b                   	pop    %rbx
   1b857:	41 5e                	pop    %r14
   1b859:	41 5f                	pop    %r15
   1b85b:	48 89 10             	mov    %rdx,(%rax)
   1b85e:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1b862:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1b866:	c3                   	ret
   1b867:	4c 89 c2             	mov    %r8,%rdx
   1b86a:	48 89 10             	mov    %rdx,(%rax)
   1b86d:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1b871:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1b875:	c3                   	ret
   1b876:	48 89 f1             	mov    %rsi,%rcx
   1b879:	4c 89 d7             	mov    %r10,%rdi
   1b87c:	48 89 10             	mov    %rdx,(%rax)
   1b87f:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1b883:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1b887:	c3                   	ret
   1b888:	cc                   	int3
   1b889:	cc                   	int3
   1b88a:	cc                   	int3
   1b88b:	cc                   	int3
   1b88c:	cc                   	int3
   1b88d:	cc                   	int3
   1b88e:	cc                   	int3
   1b88f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::sqrt:
   1b890:	48 89 f8             	mov    %rdi,%rax
   1b893:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b897:	75 3a                	jne    1b8d3 <<hyperinterval::float::F64Enclosure>::sqrt+0x43>
   1b899:	55                   	push   %rbp
   1b89a:	41 57                	push   %r15
   1b89c:	41 56                	push   %r14
   1b89e:	41 55                	push   %r13
   1b8a0:	41 54                	push   %r12
   1b8a2:	53                   	push   %rbx
   1b8a3:	48 83 ec 28          	sub    $0x28,%rsp
   1b8a7:	4c 8b 6e 08          	mov    0x8(%rsi),%r13
   1b8ab:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1b8af:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1b8b6:	00 00 80 
   1b8b9:	48 8d 6b ff          	lea    -0x1(%rbx),%rbp
   1b8bd:	4d 85 ff             	test   %r15,%r15
   1b8c0:	79 1d                	jns    1b8df <<hyperinterval::float::F64Enclosure>::sqrt+0x4f>
   1b8c2:	4c 89 f9             	mov    %r15,%rcx
   1b8c5:	48 21 e9             	and    %rbp,%rcx
   1b8c8:	74 15                	je     1b8df <<hyperinterval::float::F64Enclosure>::sqrt+0x4f>
   1b8ca:	c6 40 08 07          	movb   $0x7,0x8(%rax)
   1b8ce:	e9 da 00 00 00       	jmp    1b9ad <<hyperinterval::float::F64Enclosure>::sqrt+0x11d>
   1b8d3:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   1b8da:	c6 40 18 00          	movb   $0x0,0x18(%rax)
   1b8de:	c3                   	ret
   1b8df:	48 89 04 24          	mov    %rax,(%rsp)
   1b8e3:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1b8ea:	00 f0 7f 
   1b8ed:	4d 85 ed             	test   %r13,%r13
   1b8f0:	0f 98 c0             	sets   %al
   1b8f3:	49 85 ed             	test   %rbp,%r13
   1b8f6:	41 0f 95 c6          	setne  %r14b
   1b8fa:	31 c9                	xor    %ecx,%ecx
   1b8fc:	41 20 c6             	and    %al,%r14b
   1b8ff:	49 0f 44 cd          	cmove  %r13,%rcx
   1b903:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1b908:	48 89 de             	mov    %rbx,%rsi
   1b90b:	49 89 d4             	mov    %rdx,%r12
   1b90e:	e8 4d 15 00 00       	call   1ce60 <<hyperinterval::ieee::Format>::sqrt>
   1b913:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   1b918:	74 11                	je     1b92b <<hyperinterval::float::F64Enclosure>::sqrt+0x9b>
   1b91a:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   1b91f:	48 8b 04 24          	mov    (%rsp),%rax
   1b923:	88 48 08             	mov    %cl,0x8(%rax)
   1b926:	e9 82 00 00 00       	jmp    1b9ad <<hyperinterval::float::F64Enclosure>::sqrt+0x11d>
   1b92b:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1b930:	4d 39 fd             	cmp    %r15,%r13
   1b933:	75 0a                	jne    1b93f <<hyperinterval::float::F64Enclosure>::sqrt+0xaf>
   1b935:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
   1b93a:	4d 89 e5             	mov    %r12,%r13
   1b93d:	eb 2c                	jmp    1b96b <<hyperinterval::float::F64Enclosure>::sqrt+0xdb>
   1b93f:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   1b944:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1b949:	48 89 de             	mov    %rbx,%rsi
   1b94c:	4d 89 e5             	mov    %r12,%r13
   1b94f:	4c 89 e2             	mov    %r12,%rdx
   1b952:	4c 89 f9             	mov    %r15,%rcx
   1b955:	e8 06 15 00 00       	call   1ce60 <<hyperinterval::ieee::Format>::sqrt>
   1b95a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1b95f:	74 b9                	je     1b91a <<hyperinterval::float::F64Enclosure>::sqrt+0x8a>
   1b961:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
   1b966:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1b96b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1b970:	48 89 de             	mov    %rbx,%rsi
   1b973:	4c 89 ea             	mov    %r13,%rdx
   1b976:	e8 e5 0c 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1b97b:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1b980:	74 1f                	je     1b9a1 <<hyperinterval::float::F64Enclosure>::sqrt+0x111>
   1b982:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1b987:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1b98c:	48 89 de             	mov    %rbx,%rsi
   1b98f:	4c 89 ea             	mov    %r13,%rdx
   1b992:	4c 89 f9             	mov    %r15,%rcx
   1b995:	e8 c6 0c 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1b99a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1b99f:	75 22                	jne    1b9c3 <<hyperinterval::float::F64Enclosure>::sqrt+0x133>
   1b9a1:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   1b9a6:	48 8b 04 24          	mov    (%rsp),%rax
   1b9aa:	88 50 08             	mov    %dl,0x8(%rax)
   1b9ad:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1b9b4:	48 83 c4 28          	add    $0x28,%rsp
   1b9b8:	5b                   	pop    %rbx
   1b9b9:	41 5c                	pop    %r12
   1b9bb:	41 5d                	pop    %r13
   1b9bd:	41 5e                	pop    %r14
   1b9bf:	41 5f                	pop    %r15
   1b9c1:	5d                   	pop    %rbp
   1b9c2:	c3                   	ret
   1b9c3:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1b9c8:	49 8d 04 1c          	lea    (%r12,%rbx,1),%rax
   1b9cc:	4c 89 e2             	mov    %r12,%rdx
   1b9cf:	48 21 ea             	and    %rbp,%rdx
   1b9d2:	48 89 de             	mov    %rbx,%rsi
   1b9d5:	48 29 d6             	sub    %rdx,%rsi
   1b9d8:	4d 85 e4             	test   %r12,%r12
   1b9db:	48 0f 49 f0          	cmovns %rax,%rsi
   1b9df:	48 8d 04 19          	lea    (%rcx,%rbx,1),%rax
   1b9e3:	48 21 cd             	and    %rcx,%rbp
   1b9e6:	48 29 eb             	sub    %rbp,%rbx
   1b9e9:	48 85 c9             	test   %rcx,%rcx
   1b9ec:	48 0f 49 d8          	cmovns %rax,%rbx
   1b9f0:	b2 01                	mov    $0x1,%dl
   1b9f2:	48 39 de             	cmp    %rbx,%rsi
   1b9f5:	48 8b 04 24          	mov    (%rsp),%rax
   1b9f9:	77 af                	ja     1b9aa <<hyperinterval::float::F64Enclosure>::sqrt+0x11a>
   1b9fb:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   1ba02:	4c 89 60 08          	mov    %r12,0x8(%rax)
   1ba06:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1ba0a:	44 88 70 18          	mov    %r14b,0x18(%rax)
   1ba0e:	eb a4                	jmp    1b9b4 <<hyperinterval::float::F64Enclosure>::sqrt+0x124>

<hyperinterval::float::F64Enclosure>::point:
   1ba10:	53                   	push   %rbx
   1ba11:	48 83 ec 10          	sub    $0x10,%rsp
   1ba15:	48 89 fb             	mov    %rdi,%rbx
   1ba18:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1ba1d:	48 89 e7             	mov    %rsp,%rdi
   1ba20:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1ba27:	00 00 80 
   1ba2a:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1ba31:	00 f0 7f 
   1ba34:	e8 27 0c 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1ba39:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1ba3d:	75 0f                	jne    1ba4e <<hyperinterval::float::F64Enclosure>::point+0x3e>
   1ba3f:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1ba44:	88 43 08             	mov    %al,0x8(%rbx)
   1ba47:	b8 02 00 00 00       	mov    $0x2,%eax
   1ba4c:	eb 12                	jmp    1ba60 <<hyperinterval::float::F64Enclosure>::point+0x50>
   1ba4e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1ba53:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1ba57:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1ba5b:	b8 01 00 00 00       	mov    $0x1,%eax
   1ba60:	48 89 03             	mov    %rax,(%rbx)
   1ba63:	48 89 d8             	mov    %rbx,%rax
   1ba66:	48 83 c4 10          	add    $0x10,%rsp
   1ba6a:	5b                   	pop    %rbx
   1ba6b:	c3                   	ret
   1ba6c:	cc                   	int3
   1ba6d:	cc                   	int3
   1ba6e:	cc                   	int3
   1ba6f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::signs:
   1ba70:	83 3f 01             	cmpl   $0x1,(%rdi)
   1ba73:	75 69                	jne    1bade <<hyperinterval::float::F64Enclosure>::signs+0x6e>
   1ba75:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1ba7c:	00 00 80 
   1ba7f:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   1ba83:	48 8b 47 10          	mov    0x10(%rdi),%rax
   1ba87:	4a 8d 14 01          	lea    (%rcx,%r8,1),%rdx
   1ba8b:	49 8d 70 ff          	lea    -0x1(%r8),%rsi
   1ba8f:	49 89 c9             	mov    %rcx,%r9
   1ba92:	49 21 f1             	and    %rsi,%r9
   1ba95:	4c 89 c7             	mov    %r8,%rdi
   1ba98:	4c 29 cf             	sub    %r9,%rdi
   1ba9b:	48 85 c9             	test   %rcx,%rcx
   1ba9e:	48 0f 49 fa          	cmovns %rdx,%rdi
   1baa2:	31 d2                	xor    %edx,%edx
   1baa4:	48 85 ff             	test   %rdi,%rdi
   1baa7:	0f 99 c1             	setns  %cl
   1baaa:	4c 39 c7             	cmp    %r8,%rdi
   1baad:	77 1f                	ja     1bace <<hyperinterval::float::F64Enclosure>::signs+0x5e>
   1baaf:	48 85 ff             	test   %rdi,%rdi
   1bab2:	40 0f 99 c7          	setns  %dil
   1bab6:	40 80 cf 02          	or     $0x2,%dil
   1baba:	48 85 f0             	test   %rsi,%rax
   1babd:	88 ca                	mov    %cl,%dl
   1babf:	40 0f b6 cf          	movzbl %dil,%ecx
   1bac3:	0f 44 d1             	cmove  %ecx,%edx
   1bac6:	48 85 c0             	test   %rax,%rax
   1bac9:	0f 49 d1             	cmovns %ecx,%edx
   1bacc:	89 d1                	mov    %edx,%ecx
   1bace:	8d 51 04             	lea    0x4(%rcx),%edx
   1bad1:	48 85 c0             	test   %rax,%rax
   1bad4:	0f b6 c9             	movzbl %cl,%ecx
   1bad7:	0f b6 c2             	movzbl %dl,%eax
   1bada:	0f 4e c1             	cmovle %ecx,%eax
   1badd:	c3                   	ret
   1bade:	31 c0                	xor    %eax,%eax
   1bae0:	c3                   	ret
   1bae1:	cc                   	int3
   1bae2:	cc                   	int3
   1bae3:	cc                   	int3
   1bae4:	cc                   	int3
   1bae5:	cc                   	int3
   1bae6:	cc                   	int3
   1bae7:	cc                   	int3
   1bae8:	cc                   	int3
   1bae9:	cc                   	int3
   1baea:	cc                   	int3
   1baeb:	cc                   	int3
   1baec:	cc                   	int3
   1baed:	cc                   	int3
   1baee:	cc                   	int3
   1baef:	cc                   	int3

<hyperinterval::float::F64Enclosure>::affine:
   1baf0:	55                   	push   %rbp
   1baf1:	41 57                	push   %r15
   1baf3:	41 56                	push   %r14
   1baf5:	41 55                	push   %r13
   1baf7:	41 54                	push   %r12
   1baf9:	53                   	push   %rbx
   1bafa:	48 83 ec 28          	sub    $0x28,%rsp
   1bafe:	f2 0f 11 4c 24 18    	movsd  %xmm1,0x18(%rsp)
   1bb04:	49 89 f5             	mov    %rsi,%r13
   1bb07:	48 89 fb             	mov    %rdi,%rbx
   1bb0a:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1bb11:	00 00 80 
   1bb14:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1bb1b:	00 f0 7f 
   1bb1e:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1bb23:	48 89 e7             	mov    %rsp,%rdi
   1bb26:	4c 89 f6             	mov    %r14,%rsi
   1bb29:	4c 89 fa             	mov    %r15,%rdx
   1bb2c:	e8 2f 0b 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1bb31:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bb35:	74 24                	je     1bb5b <<hyperinterval::float::F64Enclosure>::affine+0x6b>
   1bb37:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1bb3c:	f3 0f 7e 44 24 18    	movq   0x18(%rsp),%xmm0
   1bb42:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1bb47:	48 89 e7             	mov    %rsp,%rdi
   1bb4a:	4c 89 f6             	mov    %r14,%rsi
   1bb4d:	4c 89 fa             	mov    %r15,%rdx
   1bb50:	e8 0b 0b 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1bb55:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bb59:	75 21                	jne    1bb7c <<hyperinterval::float::F64Enclosure>::affine+0x8c>
   1bb5b:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1bb60:	88 43 08             	mov    %al,0x8(%rbx)
   1bb63:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1bb6a:	48 89 d8             	mov    %rbx,%rax
   1bb6d:	48 83 c4 28          	add    $0x28,%rsp
   1bb71:	5b                   	pop    %rbx
   1bb72:	41 5c                	pop    %r12
   1bb74:	41 5d                	pop    %r13
   1bb76:	41 5e                	pop    %r14
   1bb78:	41 5f                	pop    %r15
   1bb7a:	5d                   	pop    %rbp
   1bb7b:	c3                   	ret
   1bb7c:	41 f6 45 00 01       	testb  $0x1,0x0(%r13)
   1bb81:	0f 84 06 01 00 00    	je     1bc8d <<hyperinterval::float::F64Enclosure>::affine+0x19d>
   1bb87:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1bb8c:	49 8b 45 10          	mov    0x10(%r13),%rax
   1bb90:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1bb95:	49 8b 4d 08          	mov    0x8(%r13),%rcx
   1bb99:	48 89 e7             	mov    %rsp,%rdi
   1bb9c:	4c 89 f6             	mov    %r14,%rsi
   1bb9f:	4c 89 fa             	mov    %r15,%rdx
   1bba2:	4d 89 e0             	mov    %r12,%r8
   1bba5:	49 89 e9             	mov    %rbp,%r9
   1bba8:	e8 c3 1d 00 00       	call   1d970 <<hyperinterval::ieee::Format>::affine>
   1bbad:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bbb1:	74 a8                	je     1bb5b <<hyperinterval::float::F64Enclosure>::affine+0x6b>
   1bbb3:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1bbb8:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1bbbd:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1bbc2:	48 89 e7             	mov    %rsp,%rdi
   1bbc5:	4c 89 f6             	mov    %r14,%rsi
   1bbc8:	4c 89 fa             	mov    %r15,%rdx
   1bbcb:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1bbd0:	4d 89 e0             	mov    %r12,%r8
   1bbd3:	49 89 e9             	mov    %rbp,%r9
   1bbd6:	e8 95 1d 00 00       	call   1d970 <<hyperinterval::ieee::Format>::affine>
   1bbdb:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bbdf:	0f 84 76 ff ff ff    	je     1bb5b <<hyperinterval::float::F64Enclosure>::affine+0x6b>
   1bbe5:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1bbea:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1bbef:	48 89 e7             	mov    %rsp,%rdi
   1bbf2:	4c 89 f6             	mov    %r14,%rsi
   1bbf5:	4c 89 fa             	mov    %r15,%rdx
   1bbf8:	4c 89 e9             	mov    %r13,%rcx
   1bbfb:	e8 60 0a 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1bc00:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bc04:	0f 84 51 ff ff ff    	je     1bb5b <<hyperinterval::float::F64Enclosure>::affine+0x6b>
   1bc0a:	4d 89 e5             	mov    %r12,%r13
   1bc0d:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1bc12:	48 89 e7             	mov    %rsp,%rdi
   1bc15:	4c 89 f6             	mov    %r14,%rsi
   1bc18:	4c 89 fa             	mov    %r15,%rdx
   1bc1b:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1bc20:	e8 3b 0a 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1bc25:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bc29:	0f 84 2c ff ff ff    	je     1bb5b <<hyperinterval::float::F64Enclosure>::affine+0x6b>
   1bc2f:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1bc34:	4b 8d 04 34          	lea    (%r12,%r14,1),%rax
   1bc38:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1bc3c:	4c 89 e2             	mov    %r12,%rdx
   1bc3f:	48 21 ca             	and    %rcx,%rdx
   1bc42:	4c 89 f6             	mov    %r14,%rsi
   1bc45:	48 29 d6             	sub    %rdx,%rsi
   1bc48:	4d 85 e4             	test   %r12,%r12
   1bc4b:	48 0f 49 f0          	cmovns %rax,%rsi
   1bc4f:	4b 8d 04 37          	lea    (%r15,%r14,1),%rax
   1bc53:	4c 21 f9             	and    %r15,%rcx
   1bc56:	49 29 ce             	sub    %rcx,%r14
   1bc59:	4d 85 ff             	test   %r15,%r15
   1bc5c:	4c 0f 49 f0          	cmovns %rax,%r14
   1bc60:	b0 01                	mov    $0x1,%al
   1bc62:	4c 39 f6             	cmp    %r14,%rsi
   1bc65:	0f 87 f5 fe ff ff    	ja     1bb60 <<hyperinterval::float::F64Enclosure>::affine+0x70>
   1bc6b:	48 89 e7             	mov    %rsp,%rdi
   1bc6e:	4c 89 ee             	mov    %r13,%rsi
   1bc71:	48 89 ea             	mov    %rbp,%rdx
   1bc74:	e8 57 06 00 00       	call   1c2d0 <<hyperinterval::float::F64Enclosure>::from_bits>
   1bc79:	48 8b 04 24          	mov    (%rsp),%rax
   1bc7d:	48 83 f8 02          	cmp    $0x2,%rax
   1bc81:	75 16                	jne    1bc99 <<hyperinterval::float::F64Enclosure>::affine+0x1a9>
   1bc83:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1bc88:	e9 d3 fe ff ff       	jmp    1bb60 <<hyperinterval::float::F64Enclosure>::affine+0x70>
   1bc8d:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1bc94:	e9 d1 fe ff ff       	jmp    1bb6a <<hyperinterval::float::F64Enclosure>::affine+0x7a>
   1bc99:	83 f8 01             	cmp    $0x1,%eax
   1bc9c:	75 1b                	jne    1bcb9 <<hyperinterval::float::F64Enclosure>::affine+0x1c9>
   1bc9e:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1bca3:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1bca8:	4c 89 e7             	mov    %r12,%rdi
   1bcab:	4c 89 fe             	mov    %r15,%rsi
   1bcae:	e8 ed 24 00 00       	call   1e1a0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1bcb3:	49 89 c4             	mov    %rax,%r12
   1bcb6:	49 89 d7             	mov    %rdx,%r15
   1bcb9:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1bcc0:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   1bcc4:	4c 89 7b 10          	mov    %r15,0x10(%rbx)
   1bcc8:	e9 9d fe ff ff       	jmp    1bb6a <<hyperinterval::float::F64Enclosure>::affine+0x7a>
   1bccd:	cc                   	int3
   1bcce:	cc                   	int3
   1bccf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::square:
   1bcd0:	55                   	push   %rbp
   1bcd1:	41 57                	push   %r15
   1bcd3:	41 56                	push   %r14
   1bcd5:	41 55                	push   %r13
   1bcd7:	41 54                	push   %r12
   1bcd9:	53                   	push   %rbx
   1bcda:	48 83 ec 58          	sub    $0x58,%rsp
   1bcde:	48 89 fb             	mov    %rdi,%rbx
   1bce1:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1bce5:	0f 85 0c 01 00 00    	jne    1bdf7 <<hyperinterval::float::F64Enclosure>::square+0x127>
   1bceb:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1bcef:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
   1bcf6:	00 00 80 
   1bcf9:	49 b8 00 00 00 00 00 	movabs $0x7ff0000000000000,%r8
   1bd00:	00 f0 7f 
   1bd03:	49 be ff ff ff ff ff 	movabs $0xfffffffffffff,%r14
   1bd0a:	ff 0f 00 
   1bd0d:	48 8b 56 08          	mov    0x8(%rsi),%rdx
   1bd11:	48 89 d1             	mov    %rdx,%rcx
   1bd14:	48 c1 e9 34          	shr    $0x34,%rcx
   1bd18:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1bd1e:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
   1bd23:	4c 21 f2             	and    %r14,%rdx
   1bd26:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   1bd2a:	48 85 c9             	test   %rcx,%rcx
   1bd2d:	48 89 e8             	mov    %rbp,%rax
   1bd30:	48 0f 44 c1          	cmove  %rcx,%rax
   1bd34:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1bd3b:	41 bd 9c f7 ff ff    	mov    $0xfffff79c,%r13d
   1bd41:	41 0f 44 cd          	cmove  %r13d,%ecx
   1bd45:	48 09 d0             	or     %rdx,%rax
   1bd48:	48 f7 e0             	mul    %rax
   1bd4b:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1bd50:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1bd55:	48 89 04 24          	mov    %rax,(%rsp)
   1bd59:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1bd5d:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1bd62:	48 89 e1             	mov    %rsp,%rcx
   1bd65:	4c 89 e6             	mov    %r12,%rsi
   1bd68:	4c 89 c2             	mov    %r8,%rdx
   1bd6b:	e8 f0 1f 00 00       	call   1dd60 <<hyperinterval::ieee::Format>::rounded>
   1bd70:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   1bd75:	75 79                	jne    1bdf0 <<hyperinterval::float::F64Enclosure>::square+0x120>
   1bd77:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   1bd7c:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1bd81:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1bd86:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1bd8b:	4c 89 f8             	mov    %r15,%rax
   1bd8e:	48 c1 e8 34          	shr    $0x34,%rax
   1bd92:	25 ff 07 00 00       	and    $0x7ff,%eax
   1bd97:	4c 89 7c 24 48       	mov    %r15,0x48(%rsp)
   1bd9c:	4d 21 fe             	and    %r15,%r14
   1bd9f:	48 85 c0             	test   %rax,%rax
   1bda2:	48 0f 44 e8          	cmove  %rax,%rbp
   1bda6:	8d 8c 00 9a f7 ff ff 	lea    -0x866(%rax,%rax,1),%ecx
   1bdad:	41 0f 44 cd          	cmove  %r13d,%ecx
   1bdb1:	4c 09 f5             	or     %r14,%rbp
   1bdb4:	48 89 e8             	mov    %rbp,%rax
   1bdb7:	48 f7 e5             	mul    %rbp
   1bdba:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1bdbf:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1bdc4:	48 89 04 24          	mov    %rax,(%rsp)
   1bdc8:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1bdcc:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1bdd1:	48 89 e1             	mov    %rsp,%rcx
   1bdd4:	4c 89 e6             	mov    %r12,%rsi
   1bdd7:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1bdde:	00 f0 7f 
   1bde1:	4c 89 fa             	mov    %r15,%rdx
   1bde4:	e8 77 1f 00 00       	call   1dd60 <<hyperinterval::ieee::Format>::rounded>
   1bde9:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   1bdee:	75 10                	jne    1be00 <<hyperinterval::float::F64Enclosure>::square+0x130>
   1bdf0:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   1bdf5:	eb 4f                	jmp    1be46 <<hyperinterval::float::F64Enclosure>::square+0x176>
   1bdf7:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1bdfe:	eb 50                	jmp    1be50 <<hyperinterval::float::F64Enclosure>::square+0x180>
   1be00:	4c 8b 6c 24 38       	mov    0x38(%rsp),%r13
   1be05:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
   1be0a:	48 89 e7             	mov    %rsp,%rdi
   1be0d:	4c 89 e6             	mov    %r12,%rsi
   1be10:	4c 89 fa             	mov    %r15,%rdx
   1be13:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   1be18:	e8 43 08 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1be1d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1be21:	74 1e                	je     1be41 <<hyperinterval::float::F64Enclosure>::square+0x171>
   1be23:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1be28:	48 89 e7             	mov    %rsp,%rdi
   1be2b:	4c 89 e6             	mov    %r12,%rsi
   1be2e:	4c 89 fa             	mov    %r15,%rdx
   1be31:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1be36:	e8 25 08 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1be3b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1be3f:	75 21                	jne    1be62 <<hyperinterval::float::F64Enclosure>::square+0x192>
   1be41:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1be46:	88 43 08             	mov    %al,0x8(%rbx)
   1be49:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1be50:	48 89 d8             	mov    %rbx,%rax
   1be53:	48 83 c4 58          	add    $0x58,%rsp
   1be57:	5b                   	pop    %rbx
   1be58:	41 5c                	pop    %r12
   1be5a:	41 5d                	pop    %r13
   1be5c:	41 5e                	pop    %r14
   1be5e:	41 5f                	pop    %r15
   1be60:	5d                   	pop    %rbp
   1be61:	c3                   	ret
   1be62:	4c 89 e9             	mov    %r13,%rcx
   1be65:	4c 89 74 24 28       	mov    %r14,0x28(%rsp)
   1be6a:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1be6f:	49 8d 04 2c          	lea    (%r12,%rbp,1),%rax
   1be73:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
   1be78:	48 89 ee             	mov    %rbp,%rsi
   1be7b:	4c 21 f6             	and    %r14,%rsi
   1be7e:	4c 89 e2             	mov    %r12,%rdx
   1be81:	48 29 f2             	sub    %rsi,%rdx
   1be84:	48 85 ed             	test   %rbp,%rbp
   1be87:	48 0f 49 d0          	cmovns %rax,%rdx
   1be8b:	4b 8d 04 2c          	lea    (%r12,%r13,1),%rax
   1be8f:	4c 89 ef             	mov    %r13,%rdi
   1be92:	4c 21 f7             	and    %r14,%rdi
   1be95:	4c 89 e6             	mov    %r12,%rsi
   1be98:	48 29 fe             	sub    %rdi,%rsi
   1be9b:	4d 85 ed             	test   %r13,%r13
   1be9e:	48 0f 49 f0          	cmovns %rax,%rsi
   1bea2:	b0 01                	mov    $0x1,%al
   1bea4:	48 39 f2             	cmp    %rsi,%rdx
   1bea7:	77 9d                	ja     1be46 <<hyperinterval::float::F64Enclosure>::square+0x176>
   1bea9:	48 89 e7             	mov    %rsp,%rdi
   1beac:	4c 89 e6             	mov    %r12,%rsi
   1beaf:	4c 89 fa             	mov    %r15,%rdx
   1beb2:	e8 a9 07 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1beb7:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bebb:	74 84                	je     1be41 <<hyperinterval::float::F64Enclosure>::square+0x171>
   1bebd:	4c 89 6c 24 20       	mov    %r13,0x20(%rsp)
   1bec2:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1bec7:	48 89 e7             	mov    %rsp,%rdi
   1beca:	4c 89 e6             	mov    %r12,%rsi
   1becd:	4c 89 fa             	mov    %r15,%rdx
   1bed0:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   1bed5:	e8 86 07 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1beda:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bede:	0f 84 5d ff ff ff    	je     1be41 <<hyperinterval::float::F64Enclosure>::square+0x171>
   1bee4:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1bee9:	4b 8d 04 2c          	lea    (%r12,%r13,1),%rax
   1beed:	4c 89 ea             	mov    %r13,%rdx
   1bef0:	4c 21 f2             	and    %r14,%rdx
   1bef3:	4c 89 e6             	mov    %r12,%rsi
   1bef6:	48 29 d6             	sub    %rdx,%rsi
   1bef9:	4d 85 ed             	test   %r13,%r13
   1befc:	48 0f 49 f0          	cmovns %rax,%rsi
   1bf00:	4a 8d 04 21          	lea    (%rcx,%r12,1),%rax
   1bf04:	49 21 ce             	and    %rcx,%r14
   1bf07:	4d 29 f4             	sub    %r14,%r12
   1bf0a:	48 85 c9             	test   %rcx,%rcx
   1bf0d:	4c 0f 49 e0          	cmovns %rax,%r12
   1bf11:	b0 01                	mov    $0x1,%al
   1bf13:	4c 39 e6             	cmp    %r12,%rsi
   1bf16:	0f 87 2a ff ff ff    	ja     1be46 <<hyperinterval::float::F64Enclosure>::square+0x176>
   1bf1c:	48 89 ef             	mov    %rbp,%rdi
   1bf1f:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1bf24:	4c 89 ea             	mov    %r13,%rdx
   1bf27:	e8 74 22 00 00       	call   1e1a0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1bf2c:	49 89 c5             	mov    %rax,%r13
   1bf2f:	49 89 d4             	mov    %rdx,%r12
   1bf32:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1bf37:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
   1bf3c:	31 d2                	xor    %edx,%edx
   1bf3e:	e8 dd 22 00 00       	call   1e220 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::signs>
   1bf43:	a8 02                	test   $0x2,%al
   1bf45:	75 14                	jne    1bf5b <<hyperinterval::float::F64Enclosure>::square+0x28b>
   1bf47:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1bf4e:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1bf52:	4c 89 63 10          	mov    %r12,0x10(%rbx)
   1bf56:	e9 f5 fe ff ff       	jmp    1be50 <<hyperinterval::float::F64Enclosure>::square+0x180>
   1bf5b:	48 89 e7             	mov    %rsp,%rdi
   1bf5e:	31 f6                	xor    %esi,%esi
   1bf60:	31 d2                	xor    %edx,%edx
   1bf62:	e8 69 03 00 00       	call   1c2d0 <<hyperinterval::float::F64Enclosure>::from_bits>
   1bf67:	48 8b 04 24          	mov    (%rsp),%rax
   1bf6b:	48 83 f8 02          	cmp    $0x2,%rax
   1bf6f:	75 0a                	jne    1bf7b <<hyperinterval::float::F64Enclosure>::square+0x2ab>
   1bf71:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1bf76:	e9 cb fe ff ff       	jmp    1be46 <<hyperinterval::float::F64Enclosure>::square+0x176>
   1bf7b:	83 f8 01             	cmp    $0x1,%eax
   1bf7e:	75 c7                	jne    1bf47 <<hyperinterval::float::F64Enclosure>::square+0x277>
   1bf80:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1bf85:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1bf8a:	4c 89 ef             	mov    %r13,%rdi
   1bf8d:	4c 89 e6             	mov    %r12,%rsi
   1bf90:	e8 0b 22 00 00       	call   1e1a0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1bf95:	49 89 c5             	mov    %rax,%r13
   1bf98:	49 89 d4             	mov    %rdx,%r12
   1bf9b:	eb aa                	jmp    1bf47 <<hyperinterval::float::F64Enclosure>::square+0x277>
   1bf9d:	cc                   	int3
   1bf9e:	cc                   	int3
   1bf9f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::next_up:
   1bfa0:	41 57                	push   %r15
   1bfa2:	41 56                	push   %r14
   1bfa4:	53                   	push   %rbx
   1bfa5:	48 83 ec 10          	sub    $0x10,%rsp
   1bfa9:	48 89 fb             	mov    %rdi,%rbx
   1bfac:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1bfb3:	00 00 80 
   1bfb6:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1bfbd:	00 f0 7f 
   1bfc0:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1bfc5:	48 89 e7             	mov    %rsp,%rdi
   1bfc8:	4c 89 f6             	mov    %r14,%rsi
   1bfcb:	4c 89 fa             	mov    %r15,%rdx
   1bfce:	e8 8d 06 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1bfd3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bfd7:	75 0c                	jne    1bfe5 <<hyperinterval::float::F64Enclosure>::next_up+0x45>
   1bfd9:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1bfde:	88 43 01             	mov    %al,0x1(%rbx)
   1bfe1:	b0 01                	mov    $0x1,%al
   1bfe3:	eb 3c                	jmp    1c021 <<hyperinterval::float::F64Enclosure>::next_up+0x81>
   1bfe5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1bfea:	48 89 c1             	mov    %rax,%rcx
   1bfed:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1bff1:	48 83 c9 01          	or     $0x1,%rcx
   1bff5:	48 01 c1             	add    %rax,%rcx
   1bff8:	48 89 e7             	mov    %rsp,%rdi
   1bffb:	4c 89 f6             	mov    %r14,%rsi
   1bffe:	4c 89 fa             	mov    %r15,%rdx
   1c001:	e8 5a 06 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1c006:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c00a:	75 08                	jne    1c014 <<hyperinterval::float::F64Enclosure>::next_up+0x74>
   1c00c:	c6 43 01 05          	movb   $0x5,0x1(%rbx)
   1c010:	b0 01                	mov    $0x1,%al
   1c012:	eb 0d                	jmp    1c021 <<hyperinterval::float::F64Enclosure>::next_up+0x81>
   1c014:	f3 0f 7e 44 24 08    	movq   0x8(%rsp),%xmm0
   1c01a:	66 0f d6 43 08       	movq   %xmm0,0x8(%rbx)
   1c01f:	31 c0                	xor    %eax,%eax
   1c021:	88 03                	mov    %al,(%rbx)
   1c023:	48 89 d8             	mov    %rbx,%rax
   1c026:	48 83 c4 10          	add    $0x10,%rsp
   1c02a:	5b                   	pop    %rbx
   1c02b:	41 5e                	pop    %r14
   1c02d:	41 5f                	pop    %r15
   1c02f:	c3                   	ret

<hyperinterval::float::F64Enclosure>::disjoint:
   1c030:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1c034:	b0 01                	mov    $0x1,%al
   1c036:	0f 84 8b 00 00 00    	je     1c0c7 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1c03c:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1c040:	0f 84 81 00 00 00    	je     1c0c7 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1c046:	53                   	push   %rbx
   1c047:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
   1c04e:	00 00 80 
   1c051:	4c 8b 47 10          	mov    0x10(%rdi),%r8
   1c055:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
   1c059:	4d 8d 14 08          	lea    (%r8,%rcx,1),%r10
   1c05d:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
   1c061:	4d 89 c3             	mov    %r8,%r11
   1c064:	49 21 d3             	and    %rdx,%r11
   1c067:	48 89 cb             	mov    %rcx,%rbx
   1c06a:	4c 29 db             	sub    %r11,%rbx
   1c06d:	4d 85 c0             	test   %r8,%r8
   1c070:	49 0f 49 da          	cmovns %r10,%rbx
   1c074:	4d 8d 04 09          	lea    (%r9,%rcx,1),%r8
   1c078:	4d 89 ca             	mov    %r9,%r10
   1c07b:	49 21 d2             	and    %rdx,%r10
   1c07e:	49 89 cb             	mov    %rcx,%r11
   1c081:	4d 29 d3             	sub    %r10,%r11
   1c084:	4d 85 c9             	test   %r9,%r9
   1c087:	4d 0f 49 d8          	cmovns %r8,%r11
   1c08b:	4c 39 db             	cmp    %r11,%rbx
   1c08e:	5b                   	pop    %rbx
   1c08f:	72 36                	jb     1c0c7 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1c091:	48 8b 47 08          	mov    0x8(%rdi),%rax
   1c095:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1c099:	48 8d 3c 0e          	lea    (%rsi,%rcx,1),%rdi
   1c09d:	49 89 f0             	mov    %rsi,%r8
   1c0a0:	49 21 d0             	and    %rdx,%r8
   1c0a3:	49 89 c9             	mov    %rcx,%r9
   1c0a6:	4d 29 c1             	sub    %r8,%r9
   1c0a9:	48 85 f6             	test   %rsi,%rsi
   1c0ac:	4c 0f 49 cf          	cmovns %rdi,%r9
   1c0b0:	48 8d 34 08          	lea    (%rax,%rcx,1),%rsi
   1c0b4:	48 21 c2             	and    %rax,%rdx
   1c0b7:	48 29 d1             	sub    %rdx,%rcx
   1c0ba:	48 85 c0             	test   %rax,%rax
   1c0bd:	48 0f 49 ce          	cmovns %rsi,%rcx
   1c0c1:	49 39 c9             	cmp    %rcx,%r9
   1c0c4:	0f 92 c0             	setb   %al
   1c0c7:	c3                   	ret
   1c0c8:	cc                   	int3
   1c0c9:	cc                   	int3
   1c0ca:	cc                   	int3
   1c0cb:	cc                   	int3
   1c0cc:	cc                   	int3
   1c0cd:	cc                   	int3
   1c0ce:	cc                   	int3
   1c0cf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::expanded:
   1c0d0:	41 57                	push   %r15
   1c0d2:	41 56                	push   %r14
   1c0d4:	41 55                	push   %r13
   1c0d6:	41 54                	push   %r12
   1c0d8:	53                   	push   %rbx
   1c0d9:	48 83 ec 10          	sub    $0x10,%rsp
   1c0dd:	48 89 fb             	mov    %rdi,%rbx
   1c0e0:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1c0e4:	75 7f                	jne    1c165 <<hyperinterval::float::F64Enclosure>::expanded+0x95>
   1c0e6:	4c 8b 66 10          	mov    0x10(%rsi),%r12
   1c0ea:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1c0f1:	00 00 80 
   1c0f4:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1c0fb:	00 f0 7f 
   1c0fe:	48 8b 46 08          	mov    0x8(%rsi),%rax
   1c102:	48 89 c2             	mov    %rax,%rdx
   1c105:	4c 31 f2             	xor    %r14,%rdx
   1c108:	48 85 c0             	test   %rax,%rax
   1c10b:	48 0f 44 d0          	cmove  %rax,%rdx
   1c10f:	48 89 d1             	mov    %rdx,%rcx
   1c112:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1c116:	48 83 c9 01          	or     $0x1,%rcx
   1c11a:	48 01 d1             	add    %rdx,%rcx
   1c11d:	48 89 e7             	mov    %rsp,%rdi
   1c120:	4c 89 f6             	mov    %r14,%rsi
   1c123:	4c 89 fa             	mov    %r15,%rdx
   1c126:	e8 35 05 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1c12b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1c12f:	75 27                	jne    1c158 <<hyperinterval::float::F64Enclosure>::expanded+0x88>
   1c131:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1c136:	4c 89 e1             	mov    %r12,%rcx
   1c139:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1c13d:	48 83 c9 01          	or     $0x1,%rcx
   1c141:	4c 01 e1             	add    %r12,%rcx
   1c144:	48 89 e7             	mov    %rsp,%rdi
   1c147:	4c 89 f6             	mov    %r14,%rsi
   1c14a:	4c 89 fa             	mov    %r15,%rdx
   1c14d:	e8 0e 05 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1c152:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c156:	75 25                	jne    1c17d <<hyperinterval::float::F64Enclosure>::expanded+0xad>
   1c158:	c6 43 08 05          	movb   $0x5,0x8(%rbx)
   1c15c:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c163:	eb 07                	jmp    1c16c <<hyperinterval::float::F64Enclosure>::expanded+0x9c>
   1c165:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1c16c:	48 89 d8             	mov    %rbx,%rax
   1c16f:	48 83 c4 10          	add    $0x10,%rsp
   1c173:	5b                   	pop    %rbx
   1c174:	41 5c                	pop    %r12
   1c176:	41 5d                	pop    %r13
   1c178:	41 5e                	pop    %r14
   1c17a:	41 5f                	pop    %r15
   1c17c:	c3                   	ret
   1c17d:	4c 89 e9             	mov    %r13,%rcx
   1c180:	4c 31 f1             	xor    %r14,%rcx
   1c183:	4d 85 ed             	test   %r13,%r13
   1c186:	49 0f 44 cd          	cmove  %r13,%rcx
   1c18a:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1c18f:	48 89 e7             	mov    %rsp,%rdi
   1c192:	4c 89 f6             	mov    %r14,%rsi
   1c195:	4c 89 fa             	mov    %r15,%rdx
   1c198:	e8 c3 04 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1c19d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c1a1:	74 1c                	je     1c1bf <<hyperinterval::float::F64Enclosure>::expanded+0xef>
   1c1a3:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1c1a8:	48 89 e7             	mov    %rsp,%rdi
   1c1ab:	4c 89 f6             	mov    %r14,%rsi
   1c1ae:	4c 89 fa             	mov    %r15,%rdx
   1c1b1:	4c 89 e1             	mov    %r12,%rcx
   1c1b4:	e8 a7 04 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1c1b9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c1bd:	75 11                	jne    1c1d0 <<hyperinterval::float::F64Enclosure>::expanded+0x100>
   1c1bf:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1c1c4:	88 43 08             	mov    %al,0x8(%rbx)
   1c1c7:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c1ce:	eb 9c                	jmp    1c16c <<hyperinterval::float::F64Enclosure>::expanded+0x9c>
   1c1d0:	4b 8d 04 2e          	lea    (%r14,%r13,1),%rax
   1c1d4:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1c1d8:	4c 89 ea             	mov    %r13,%rdx
   1c1db:	48 21 ca             	and    %rcx,%rdx
   1c1de:	4c 89 f6             	mov    %r14,%rsi
   1c1e1:	48 29 d6             	sub    %rdx,%rsi
   1c1e4:	4d 85 ed             	test   %r13,%r13
   1c1e7:	48 0f 49 f0          	cmovns %rax,%rsi
   1c1eb:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c1f0:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1c1f4:	48 21 c1             	and    %rax,%rcx
   1c1f7:	49 29 ce             	sub    %rcx,%r14
   1c1fa:	48 85 c0             	test   %rax,%rax
   1c1fd:	4c 0f 49 f2          	cmovns %rdx,%r14
   1c201:	4c 39 f6             	cmp    %r14,%rsi
   1c204:	76 10                	jbe    1c216 <<hyperinterval::float::F64Enclosure>::expanded+0x146>
   1c206:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1c20a:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c211:	e9 56 ff ff ff       	jmp    1c16c <<hyperinterval::float::F64Enclosure>::expanded+0x9c>
   1c216:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1c21d:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1c221:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1c225:	e9 42 ff ff ff       	jmp    1c16c <<hyperinterval::float::F64Enclosure>::expanded+0x9c>
   1c22a:	cc                   	int3
   1c22b:	cc                   	int3
   1c22c:	cc                   	int3
   1c22d:	cc                   	int3
   1c22e:	cc                   	int3
   1c22f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::overlaps:
   1c230:	31 c0                	xor    %eax,%eax
   1c232:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1c236:	0f 84 8c 00 00 00    	je     1c2c8 <<hyperinterval::float::F64Enclosure>::overlaps+0x98>
   1c23c:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1c240:	0f 84 82 00 00 00    	je     1c2c8 <<hyperinterval::float::F64Enclosure>::overlaps+0x98>
   1c246:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1c24d:	00 00 80 
   1c250:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1c254:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1c258:	4c 8d 0c 02          	lea    (%rdx,%rax,1),%r9
   1c25c:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1c260:	49 89 d2             	mov    %rdx,%r10
   1c263:	49 21 ca             	and    %rcx,%r10
   1c266:	49 89 c3             	mov    %rax,%r11
   1c269:	4d 29 d3             	sub    %r10,%r11
   1c26c:	48 85 d2             	test   %rdx,%rdx
   1c26f:	4d 0f 49 d9          	cmovns %r9,%r11
   1c273:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
   1c277:	4d 89 c1             	mov    %r8,%r9
   1c27a:	49 21 c9             	and    %rcx,%r9
   1c27d:	49 89 c2             	mov    %rax,%r10
   1c280:	4d 29 ca             	sub    %r9,%r10
   1c283:	4d 85 c0             	test   %r8,%r8
   1c286:	4c 0f 49 d2          	cmovns %rdx,%r10
   1c28a:	4d 39 d3             	cmp    %r10,%r11
   1c28d:	73 03                	jae    1c292 <<hyperinterval::float::F64Enclosure>::overlaps+0x62>
   1c28f:	31 c0                	xor    %eax,%eax
   1c291:	c3                   	ret
   1c292:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1c296:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1c29a:	48 8d 3c 06          	lea    (%rsi,%rax,1),%rdi
   1c29e:	49 89 f0             	mov    %rsi,%r8
   1c2a1:	49 21 c8             	and    %rcx,%r8
   1c2a4:	49 89 c1             	mov    %rax,%r9
   1c2a7:	4d 29 c1             	sub    %r8,%r9
   1c2aa:	48 85 f6             	test   %rsi,%rsi
   1c2ad:	4c 0f 49 cf          	cmovns %rdi,%r9
   1c2b1:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
   1c2b5:	48 21 d1             	and    %rdx,%rcx
   1c2b8:	48 29 c8             	sub    %rcx,%rax
   1c2bb:	48 85 d2             	test   %rdx,%rdx
   1c2be:	48 0f 49 c6          	cmovns %rsi,%rax
   1c2c2:	49 39 c1             	cmp    %rax,%r9
   1c2c5:	0f 93 c0             	setae  %al
   1c2c8:	c3                   	ret
   1c2c9:	cc                   	int3
   1c2ca:	cc                   	int3
   1c2cb:	cc                   	int3
   1c2cc:	cc                   	int3
   1c2cd:	cc                   	int3
   1c2ce:	cc                   	int3
   1c2cf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::from_bits:
   1c2d0:	41 57                	push   %r15
   1c2d2:	41 56                	push   %r14
   1c2d4:	41 55                	push   %r13
   1c2d6:	41 54                	push   %r12
   1c2d8:	53                   	push   %rbx
   1c2d9:	48 83 ec 10          	sub    $0x10,%rsp
   1c2dd:	49 89 d7             	mov    %rdx,%r15
   1c2e0:	48 89 f1             	mov    %rsi,%rcx
   1c2e3:	48 89 fb             	mov    %rdi,%rbx
   1c2e6:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1c2ed:	00 00 80 
   1c2f0:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1c2f7:	00 f0 7f 
   1c2fa:	48 89 e7             	mov    %rsp,%rdi
   1c2fd:	4c 89 f6             	mov    %r14,%rsi
   1c300:	4c 89 e2             	mov    %r12,%rdx
   1c303:	e8 58 03 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1c308:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c30c:	74 1c                	je     1c32a <<hyperinterval::float::F64Enclosure>::from_bits+0x5a>
   1c30e:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1c313:	48 89 e7             	mov    %rsp,%rdi
   1c316:	4c 89 f6             	mov    %r14,%rsi
   1c319:	4c 89 e2             	mov    %r12,%rdx
   1c31c:	4c 89 f9             	mov    %r15,%rcx
   1c31f:	e8 3c 03 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1c324:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c328:	75 1d                	jne    1c347 <<hyperinterval::float::F64Enclosure>::from_bits+0x77>
   1c32a:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1c32f:	88 43 08             	mov    %al,0x8(%rbx)
   1c332:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c339:	48 83 c4 10          	add    $0x10,%rsp
   1c33d:	5b                   	pop    %rbx
   1c33e:	41 5c                	pop    %r12
   1c340:	41 5d                	pop    %r13
   1c342:	41 5e                	pop    %r14
   1c344:	41 5f                	pop    %r15
   1c346:	c3                   	ret
   1c347:	4b 8d 04 2e          	lea    (%r14,%r13,1),%rax
   1c34b:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1c34f:	4c 89 ea             	mov    %r13,%rdx
   1c352:	48 21 ca             	and    %rcx,%rdx
   1c355:	4c 89 f6             	mov    %r14,%rsi
   1c358:	48 29 d6             	sub    %rdx,%rsi
   1c35b:	4d 85 ed             	test   %r13,%r13
   1c35e:	48 0f 49 f0          	cmovns %rax,%rsi
   1c362:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c367:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1c36b:	48 21 c1             	and    %rax,%rcx
   1c36e:	49 29 ce             	sub    %rcx,%r14
   1c371:	48 85 c0             	test   %rax,%rax
   1c374:	4c 0f 49 f2          	cmovns %rdx,%r14
   1c378:	4c 39 f6             	cmp    %r14,%rsi
   1c37b:	76 06                	jbe    1c383 <<hyperinterval::float::F64Enclosure>::from_bits+0xb3>
   1c37d:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1c381:	eb af                	jmp    1c332 <<hyperinterval::float::F64Enclosure>::from_bits+0x62>
   1c383:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1c38a:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1c38e:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1c392:	eb a5                	jmp    1c339 <<hyperinterval::float::F64Enclosure>::from_bits+0x69>
   1c394:	cc                   	int3
   1c395:	cc                   	int3
   1c396:	cc                   	int3
   1c397:	cc                   	int3
   1c398:	cc                   	int3
   1c399:	cc                   	int3
   1c39a:	cc                   	int3
   1c39b:	cc                   	int3
   1c39c:	cc                   	int3
   1c39d:	cc                   	int3
   1c39e:	cc                   	int3
   1c39f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::max_image:
   1c3a0:	48 89 f8             	mov    %rdi,%rax
   1c3a3:	45 31 c0             	xor    %r8d,%r8d
   1c3a6:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1c3aa:	0f 85 a3 00 00 00    	jne    1c453 <<hyperinterval::float::F64Enclosure>::max_image+0xb3>
   1c3b0:	f6 02 01             	testb  $0x1,(%rdx)
   1c3b3:	0f 84 8e 00 00 00    	je     1c447 <<hyperinterval::float::F64Enclosure>::max_image+0xa7>
   1c3b9:	41 56                	push   %r14
   1c3bb:	53                   	push   %rbx
   1c3bc:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
   1c3c0:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1c3c4:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
   1c3c8:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
   1c3cc:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1c3d3:	00 00 80 
   1c3d6:	4c 8d 14 37          	lea    (%rdi,%rsi,1),%r10
   1c3da:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   1c3de:	49 89 fb             	mov    %rdi,%r11
   1c3e1:	4d 21 c3             	and    %r8,%r11
   1c3e4:	48 89 f3             	mov    %rsi,%rbx
   1c3e7:	4c 29 db             	sub    %r11,%rbx
   1c3ea:	48 85 ff             	test   %rdi,%rdi
   1c3ed:	49 0f 49 da          	cmovns %r10,%rbx
   1c3f1:	4d 8d 14 31          	lea    (%r9,%rsi,1),%r10
   1c3f5:	4d 89 cb             	mov    %r9,%r11
   1c3f8:	4d 21 c3             	and    %r8,%r11
   1c3fb:	49 89 f6             	mov    %rsi,%r14
   1c3fe:	4d 29 de             	sub    %r11,%r14
   1c401:	4d 85 c9             	test   %r9,%r9
   1c404:	4d 0f 49 f2          	cmovns %r10,%r14
   1c408:	4c 39 f3             	cmp    %r14,%rbx
   1c40b:	49 0f 42 f9          	cmovb  %r9,%rdi
   1c40f:	4c 8d 0c 31          	lea    (%rcx,%rsi,1),%r9
   1c413:	49 89 ca             	mov    %rcx,%r10
   1c416:	4d 21 c2             	and    %r8,%r10
   1c419:	49 89 f3             	mov    %rsi,%r11
   1c41c:	4d 29 d3             	sub    %r10,%r11
   1c41f:	48 85 c9             	test   %rcx,%rcx
   1c422:	4d 0f 49 d9          	cmovns %r9,%r11
   1c426:	4c 8d 0c 32          	lea    (%rdx,%rsi,1),%r9
   1c42a:	49 21 d0             	and    %rdx,%r8
   1c42d:	4c 29 c6             	sub    %r8,%rsi
   1c430:	48 85 d2             	test   %rdx,%rdx
   1c433:	49 0f 49 f1          	cmovns %r9,%rsi
   1c437:	49 39 f3             	cmp    %rsi,%r11
   1c43a:	48 0f 42 ca          	cmovb  %rdx,%rcx
   1c43e:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1c444:	5b                   	pop    %rbx
   1c445:	41 5e                	pop    %r14
   1c447:	4c 89 00             	mov    %r8,(%rax)
   1c44a:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1c44e:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1c452:	c3                   	ret
   1c453:	4c 89 00             	mov    %r8,(%rax)
   1c456:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1c45a:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1c45e:	c3                   	ret
   1c45f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::min_image:
   1c460:	48 89 f8             	mov    %rdi,%rax
   1c463:	45 31 c0             	xor    %r8d,%r8d
   1c466:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1c46a:	0f 85 a3 00 00 00    	jne    1c513 <<hyperinterval::float::F64Enclosure>::min_image+0xb3>
   1c470:	f6 02 01             	testb  $0x1,(%rdx)
   1c473:	0f 84 8e 00 00 00    	je     1c507 <<hyperinterval::float::F64Enclosure>::min_image+0xa7>
   1c479:	41 56                	push   %r14
   1c47b:	53                   	push   %rbx
   1c47c:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
   1c480:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
   1c484:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
   1c488:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1c48f:	00 00 80 
   1c492:	4c 8d 14 37          	lea    (%rdi,%rsi,1),%r10
   1c496:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   1c49a:	49 89 fb             	mov    %rdi,%r11
   1c49d:	4d 21 c3             	and    %r8,%r11
   1c4a0:	48 89 f3             	mov    %rsi,%rbx
   1c4a3:	4c 29 db             	sub    %r11,%rbx
   1c4a6:	48 85 ff             	test   %rdi,%rdi
   1c4a9:	49 0f 49 da          	cmovns %r10,%rbx
   1c4ad:	4d 8d 14 31          	lea    (%r9,%rsi,1),%r10
   1c4b1:	4d 89 cb             	mov    %r9,%r11
   1c4b4:	4d 21 c3             	and    %r8,%r11
   1c4b7:	49 89 f6             	mov    %rsi,%r14
   1c4ba:	4d 29 de             	sub    %r11,%r14
   1c4bd:	4d 85 c9             	test   %r9,%r9
   1c4c0:	4d 0f 49 f2          	cmovns %r10,%r14
   1c4c4:	4c 39 f3             	cmp    %r14,%rbx
   1c4c7:	49 0f 47 f9          	cmova  %r9,%rdi
   1c4cb:	4c 8d 0c 31          	lea    (%rcx,%rsi,1),%r9
   1c4cf:	49 89 ca             	mov    %rcx,%r10
   1c4d2:	4d 21 c2             	and    %r8,%r10
   1c4d5:	49 89 f3             	mov    %rsi,%r11
   1c4d8:	4d 29 d3             	sub    %r10,%r11
   1c4db:	48 85 c9             	test   %rcx,%rcx
   1c4de:	4d 0f 49 d9          	cmovns %r9,%r11
   1c4e2:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1c4e6:	4c 8d 0c 32          	lea    (%rdx,%rsi,1),%r9
   1c4ea:	49 21 d0             	and    %rdx,%r8
   1c4ed:	4c 29 c6             	sub    %r8,%rsi
   1c4f0:	48 85 d2             	test   %rdx,%rdx
   1c4f3:	49 0f 49 f1          	cmovns %r9,%rsi
   1c4f7:	49 39 f3             	cmp    %rsi,%r11
   1c4fa:	48 0f 47 ca          	cmova  %rdx,%rcx
   1c4fe:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1c504:	5b                   	pop    %rbx
   1c505:	41 5e                	pop    %r14
   1c507:	4c 89 00             	mov    %r8,(%rax)
   1c50a:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1c50e:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1c512:	c3                   	ret
   1c513:	4c 89 00             	mov    %r8,(%rax)
   1c516:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1c51a:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1c51e:	c3                   	ret
   1c51f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::next_down:
   1c520:	41 57                	push   %r15
   1c522:	41 56                	push   %r14
   1c524:	53                   	push   %rbx
   1c525:	48 83 ec 10          	sub    $0x10,%rsp
   1c529:	48 89 fb             	mov    %rdi,%rbx
   1c52c:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1c533:	00 00 80 
   1c536:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1c53d:	00 f0 7f 
   1c540:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1c545:	48 89 e7             	mov    %rsp,%rdi
   1c548:	4c 89 f6             	mov    %r14,%rsi
   1c54b:	4c 89 fa             	mov    %r15,%rdx
   1c54e:	e8 0d 01 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1c553:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c557:	75 0c                	jne    1c565 <<hyperinterval::float::F64Enclosure>::next_down+0x45>
   1c559:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1c55e:	88 43 01             	mov    %al,0x1(%rbx)
   1c561:	b0 01                	mov    $0x1,%al
   1c563:	eb 51                	jmp    1c5b6 <<hyperinterval::float::F64Enclosure>::next_down+0x96>
   1c565:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c56a:	48 89 c2             	mov    %rax,%rdx
   1c56d:	4c 31 f2             	xor    %r14,%rdx
   1c570:	48 85 c0             	test   %rax,%rax
   1c573:	48 0f 44 d0          	cmove  %rax,%rdx
   1c577:	48 89 d1             	mov    %rdx,%rcx
   1c57a:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1c57e:	48 83 c9 01          	or     $0x1,%rcx
   1c582:	48 01 d1             	add    %rdx,%rcx
   1c585:	48 89 e7             	mov    %rsp,%rdi
   1c588:	4c 89 f6             	mov    %r14,%rsi
   1c58b:	4c 89 fa             	mov    %r15,%rdx
   1c58e:	e8 cd 00 00 00       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1c593:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c597:	75 08                	jne    1c5a1 <<hyperinterval::float::F64Enclosure>::next_down+0x81>
   1c599:	c6 43 01 05          	movb   $0x5,0x1(%rbx)
   1c59d:	b0 01                	mov    $0x1,%al
   1c59f:	eb 15                	jmp    1c5b6 <<hyperinterval::float::F64Enclosure>::next_down+0x96>
   1c5a1:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c5a6:	49 31 c6             	xor    %rax,%r14
   1c5a9:	48 85 c0             	test   %rax,%rax
   1c5ac:	4c 0f 44 f0          	cmove  %rax,%r14
   1c5b0:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1c5b4:	31 c0                	xor    %eax,%eax
   1c5b6:	88 03                	mov    %al,(%rbx)
   1c5b8:	48 89 d8             	mov    %rbx,%rax
   1c5bb:	48 83 c4 10          	add    $0x10,%rsp
   1c5bf:	5b                   	pop    %rbx
   1c5c0:	41 5e                	pop    %r14
   1c5c2:	41 5f                	pop    %r15
   1c5c4:	c3                   	ret
   1c5c5:	cc                   	int3
   1c5c6:	cc                   	int3
   1c5c7:	cc                   	int3
   1c5c8:	cc                   	int3
   1c5c9:	cc                   	int3
   1c5ca:	cc                   	int3
   1c5cb:	cc                   	int3
   1c5cc:	cc                   	int3
   1c5cd:	cc                   	int3
   1c5ce:	cc                   	int3
   1c5cf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::subset_of:
   1c5d0:	b0 01                	mov    $0x1,%al
   1c5d2:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1c5d6:	75 50                	jne    1c628 <<hyperinterval::float::F64Enclosure>::subset_of+0x58>
   1c5d8:	f6 06 01             	testb  $0x1,(%rsi)
   1c5db:	74 49                	je     1c626 <<hyperinterval::float::F64Enclosure>::subset_of+0x56>
   1c5dd:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1c5e1:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1c5e5:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1c5ec:	00 00 80 
   1c5ef:	4d 8d 0c 00          	lea    (%r8,%rax,1),%r9
   1c5f3:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1c5f7:	4d 89 c2             	mov    %r8,%r10
   1c5fa:	49 21 ca             	and    %rcx,%r10
   1c5fd:	49 89 c3             	mov    %rax,%r11
   1c600:	4d 29 d3             	sub    %r10,%r11
   1c603:	4d 85 c0             	test   %r8,%r8
   1c606:	4d 0f 49 d9          	cmovns %r9,%r11
   1c60a:	4c 8d 04 02          	lea    (%rdx,%rax,1),%r8
   1c60e:	49 89 d1             	mov    %rdx,%r9
   1c611:	49 21 c9             	and    %rcx,%r9
   1c614:	49 89 c2             	mov    %rax,%r10
   1c617:	4d 29 ca             	sub    %r9,%r10
   1c61a:	48 85 d2             	test   %rdx,%rdx
   1c61d:	4d 0f 49 d0          	cmovns %r8,%r10
   1c621:	4d 39 d3             	cmp    %r10,%r11
   1c624:	76 03                	jbe    1c629 <<hyperinterval::float::F64Enclosure>::subset_of+0x59>
   1c626:	31 c0                	xor    %eax,%eax
   1c628:	c3                   	ret
   1c629:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1c62d:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1c631:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1c635:	49 89 d0             	mov    %rdx,%r8
   1c638:	49 21 c8             	and    %rcx,%r8
   1c63b:	49 89 c1             	mov    %rax,%r9
   1c63e:	4d 29 c1             	sub    %r8,%r9
   1c641:	48 85 d2             	test   %rdx,%rdx
   1c644:	4c 0f 49 cf          	cmovns %rdi,%r9
   1c648:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1c64c:	48 21 f1             	and    %rsi,%rcx
   1c64f:	48 29 c8             	sub    %rcx,%rax
   1c652:	48 85 f6             	test   %rsi,%rsi
   1c655:	48 0f 49 c2          	cmovns %rdx,%rax
   1c659:	49 39 c1             	cmp    %rax,%r9
   1c65c:	0f 96 c0             	setbe  %al
   1c65f:	c3                   	ret

<hyperinterval::ieee::Format>::finite:
   1c660:	48 89 f8             	mov    %rdi,%rax
   1c663:	48 89 cf             	mov    %rcx,%rdi
   1c666:	48 f7 d7             	not    %rdi
   1c669:	48 85 d7             	test   %rdx,%rdi
   1c66c:	75 09                	jne    1c677 <<hyperinterval::ieee::Format>::finite+0x17>
   1c66e:	c6 40 01 00          	movb   $0x0,0x1(%rax)
   1c672:	b1 01                	mov    $0x1,%cl
   1c674:	88 08                	mov    %cl,(%rax)
   1c676:	c3                   	ret
   1c677:	48 ff ce             	dec    %rsi
   1c67a:	48 85 f1             	test   %rsi,%rcx
   1c67d:	74 09                	je     1c688 <<hyperinterval::ieee::Format>::finite+0x28>
   1c67f:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1c683:	31 c9                	xor    %ecx,%ecx
   1c685:	88 08                	mov    %cl,(%rax)
   1c687:	c3                   	ret
   1c688:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
   1c68f:	00 
   1c690:	31 c9                	xor    %ecx,%ecx
   1c692:	88 08                	mov    %cl,(%rax)
   1c694:	c3                   	ret
   1c695:	cc                   	int3
   1c696:	cc                   	int3
   1c697:	cc                   	int3
   1c698:	cc                   	int3
   1c699:	cc                   	int3
   1c69a:	cc                   	int3
   1c69b:	cc                   	int3
   1c69c:	cc                   	int3
   1c69d:	cc                   	int3
   1c69e:	cc                   	int3
   1c69f:	cc                   	int3

<hyperinterval::ieee::Format>::add:
   1c6a0:	55                   	push   %rbp
   1c6a1:	41 57                	push   %r15
   1c6a3:	41 56                	push   %r14
   1c6a5:	41 55                	push   %r13
   1c6a7:	41 54                	push   %r12
   1c6a9:	53                   	push   %rbx
   1c6aa:	48 83 ec 38          	sub    $0x38,%rsp
   1c6ae:	48 89 fb             	mov    %rdi,%rbx
   1c6b1:	48 85 c9             	test   %rcx,%rcx
   1c6b4:	0f 84 63 01 00 00    	je     1c81d <<hyperinterval::ieee::Format>::add+0x17d>
   1c6ba:	48 89 c8             	mov    %rcx,%rax
   1c6bd:	4d 85 c0             	test   %r8,%r8
   1c6c0:	0f 84 61 01 00 00    	je     1c827 <<hyperinterval::ieee::Format>::add+0x187>
   1c6c6:	41 b9 40 00 00 00    	mov    $0x40,%r9d
   1c6cc:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
   1c6d1:	49 89 c2             	mov    %rax,%r10
   1c6d4:	49 21 d2             	and    %rdx,%r10
   1c6d7:	44 89 c9             	mov    %r9d,%ecx
   1c6da:	49 d3 ea             	shr    %cl,%r10
   1c6dd:	41 bb 01 00 00 00    	mov    $0x1,%r11d
   1c6e3:	49 d3 e3             	shl    %cl,%r11
   1c6e6:	4d 8d 63 ff          	lea    -0x1(%r11),%r12
   1c6ea:	4d 89 e7             	mov    %r12,%r15
   1c6ed:	49 21 c7             	and    %rax,%r15
   1c6f0:	4d 85 d2             	test   %r10,%r10
   1c6f3:	bf 01 00 00 00       	mov    $0x1,%edi
   1c6f8:	44 89 d5             	mov    %r10d,%ebp
   1c6fb:	0f 44 ef             	cmove  %edi,%ebp
   1c6fe:	4d 0f 45 d3          	cmovne %r11,%r10
   1c702:	49 89 d6             	mov    %rdx,%r14
   1c705:	49 d3 ee             	shr    %cl,%r14
   1c708:	4d 09 fa             	or     %r15,%r10
   1c70b:	49 d1 ee             	shr    $1,%r14
   1c70e:	45 01 ce             	add    %r9d,%r14d
   1c711:	48 85 f0             	test   %rsi,%rax
   1c714:	0f 95 44 24 0f       	setne  0xf(%rsp)
   1c719:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1c71e:	49 0f bd ca          	bsr    %r10,%rcx
   1c722:	83 f1 3f             	xor    $0x3f,%ecx
   1c725:	44 01 c9             	add    %r9d,%ecx
   1c728:	83 c1 c1             	add    $0xffffffc1,%ecx
   1c72b:	45 31 ed             	xor    %r13d,%r13d
   1c72e:	4d 0f a5 d5          	shld   %cl,%r10,%r13
   1c732:	45 31 ff             	xor    %r15d,%r15d
   1c735:	49 d3 e2             	shl    %cl,%r10
   1c738:	f6 c1 40             	test   $0x40,%cl
   1c73b:	4d 0f 45 ea          	cmovne %r10,%r13
   1c73f:	4d 0f 45 d7          	cmovne %r15,%r10
   1c743:	44 01 f1             	add    %r14d,%ecx
   1c746:	29 cd                	sub    %ecx,%ebp
   1c748:	4d 89 c7             	mov    %r8,%r15
   1c74b:	49 21 d7             	and    %rdx,%r15
   1c74e:	44 89 c9             	mov    %r9d,%ecx
   1c751:	49 d3 ef             	shr    %cl,%r15
   1c754:	4d 21 c4             	and    %r8,%r12
   1c757:	4d 85 ff             	test   %r15,%r15
   1c75a:	41 0f 45 ff          	cmovne %r15d,%edi
   1c75e:	4d 0f 45 fb          	cmovne %r11,%r15
   1c762:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1c767:	4d 09 e7             	or     %r12,%r15
   1c76a:	49 85 f0             	test   %rsi,%r8
   1c76d:	41 0f 95 c3          	setne  %r11b
   1c771:	49 0f bd cf          	bsr    %r15,%rcx
   1c775:	83 f1 3f             	xor    $0x3f,%ecx
   1c778:	44 01 c9             	add    %r9d,%ecx
   1c77b:	83 c1 c1             	add    $0xffffffc1,%ecx
   1c77e:	45 31 c9             	xor    %r9d,%r9d
   1c781:	4d 0f a5 f9          	shld   %cl,%r15,%r9
   1c785:	49 d3 e7             	shl    %cl,%r15
   1c788:	f6 c1 40             	test   $0x40,%cl
   1c78b:	4d 0f 45 cf          	cmovne %r15,%r9
   1c78f:	41 bc 00 00 00 00    	mov    $0x0,%r12d
   1c795:	4d 0f 45 fc          	cmovne %r12,%r15
   1c799:	41 01 ce             	add    %ecx,%r14d
   1c79c:	44 29 f7             	sub    %r14d,%edi
   1c79f:	39 fd                	cmp    %edi,%ebp
   1c7a1:	0f 8d 90 00 00 00    	jge    1c837 <<hyperinterval::ieee::Format>::add+0x197>
   1c7a7:	44 88 5c 24 0e       	mov    %r11b,0xe(%rsp)
   1c7ac:	41 89 ee             	mov    %ebp,%r14d
   1c7af:	44 0f b6 5c 24 0f    	movzbl 0xf(%rsp),%r11d
   1c7b5:	4d 89 d4             	mov    %r10,%r12
   1c7b8:	4c 89 ed             	mov    %r13,%rbp
   1c7bb:	4d 89 c5             	mov    %r8,%r13
   1c7be:	44 29 f7             	sub    %r14d,%edi
   1c7c1:	83 ff 4a             	cmp    $0x4a,%edi
   1c7c4:	0f 8f ab 00 00 00    	jg     1c875 <<hyperinterval::ieee::Format>::add+0x1d5>
   1c7ca:	49 85 f0             	test   %rsi,%r8
   1c7cd:	41 0f 95 c0          	setne  %r8b
   1c7d1:	48 85 f0             	test   %rsi,%rax
   1c7d4:	41 0f 95 c2          	setne  %r10b
   1c7d8:	89 f9                	mov    %edi,%ecx
   1c7da:	4d 0f a5 f9          	shld   %cl,%r15,%r9
   1c7de:	49 d3 e7             	shl    %cl,%r15
   1c7e1:	31 c0                	xor    %eax,%eax
   1c7e3:	40 f6 c7 40          	test   $0x40,%dil
   1c7e7:	4d 0f 45 cf          	cmovne %r15,%r9
   1c7eb:	49 0f 44 c7          	cmove  %r15,%rax
   1c7ef:	45 30 c2             	xor    %r8b,%r10b
   1c7f2:	0f 84 ce 00 00 00    	je     1c8c6 <<hyperinterval::ieee::Format>::add+0x226>
   1c7f8:	4c 39 e0             	cmp    %r12,%rax
   1c7fb:	4c 89 c9             	mov    %r9,%rcx
   1c7fe:	48 19 e9             	sbb    %rbp,%rcx
   1c801:	0f 83 f5 00 00 00    	jae    1c8fc <<hyperinterval::ieee::Format>::add+0x25c>
   1c807:	49 29 c4             	sub    %rax,%r12
   1c80a:	4c 19 cd             	sbb    %r9,%rbp
   1c80d:	44 88 5c 24 0e       	mov    %r11b,0xe(%rsp)
   1c812:	4c 89 e0             	mov    %r12,%rax
   1c815:	49 89 e9             	mov    %rbp,%r9
   1c818:	e9 e5 00 00 00       	jmp    1c902 <<hyperinterval::ieee::Format>::add+0x262>
   1c81d:	4c 89 43 08          	mov    %r8,0x8(%rbx)
   1c821:	4c 89 43 10          	mov    %r8,0x10(%rbx)
   1c825:	eb 08                	jmp    1c82f <<hyperinterval::ieee::Format>::add+0x18f>
   1c827:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1c82b:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1c82f:	c6 03 00             	movb   $0x0,(%rbx)
   1c832:	e9 f0 00 00 00       	jmp    1c927 <<hyperinterval::ieee::Format>::add+0x287>
   1c837:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1c83c:	48 89 d6             	mov    %rdx,%rsi
   1c83f:	89 fa                	mov    %edi,%edx
   1c841:	4d 89 fc             	mov    %r15,%r12
   1c844:	4d 89 ce             	mov    %r9,%r14
   1c847:	4d 89 e9             	mov    %r13,%r9
   1c84a:	4d 89 d7             	mov    %r10,%r15
   1c84d:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
   1c852:	88 4c 24 0e          	mov    %cl,0xe(%rsp)
   1c856:	89 ef                	mov    %ebp,%edi
   1c858:	4c 89 f5             	mov    %r14,%rbp
   1c85b:	41 89 d6             	mov    %edx,%r14d
   1c85e:	48 89 f2             	mov    %rsi,%rdx
   1c861:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   1c866:	49 89 c5             	mov    %rax,%r13
   1c869:	44 29 f7             	sub    %r14d,%edi
   1c86c:	83 ff 4a             	cmp    $0x4a,%edi
   1c86f:	0f 8e 55 ff ff ff    	jle    1c7ca <<hyperinterval::ieee::Format>::add+0x12a>
   1c875:	4c 89 e8             	mov    %r13,%rax
   1c878:	45 84 db             	test   %r11b,%r11b
   1c87b:	74 51                	je     1c8ce <<hyperinterval::ieee::Format>::add+0x22e>
   1c87d:	48 31 f0             	xor    %rsi,%rax
   1c880:	48 89 c1             	mov    %rax,%rcx
   1c883:	48 21 f1             	and    %rsi,%rcx
   1c886:	31 ff                	xor    %edi,%edi
   1c888:	48 f7 d9             	neg    %rcx
   1c88b:	40 0f 93 c7          	setae  %dil
   1c88f:	48 8d 0c 78          	lea    (%rax,%rdi,2),%rcx
   1c893:	48 ff c9             	dec    %rcx
   1c896:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1c89b:	49 89 f6             	mov    %rsi,%r14
   1c89e:	e8 bd fd ff ff       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1c8a3:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1c8a8:	75 4b                	jne    1c8f5 <<hyperinterval::ieee::Format>::add+0x255>
   1c8aa:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1c8af:	49 31 c6             	xor    %rax,%r14
   1c8b2:	48 85 c0             	test   %rax,%rax
   1c8b5:	4c 0f 44 f0          	cmove  %rax,%r14
   1c8b9:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1c8bd:	4c 89 6b 10          	mov    %r13,0x10(%rbx)
   1c8c1:	e9 69 ff ff ff       	jmp    1c82f <<hyperinterval::ieee::Format>::add+0x18f>
   1c8c6:	4c 01 e0             	add    %r12,%rax
   1c8c9:	49 11 e9             	adc    %rbp,%r9
   1c8cc:	eb 34                	jmp    1c902 <<hyperinterval::ieee::Format>::add+0x262>
   1c8ce:	48 21 f0             	and    %rsi,%rax
   1c8d1:	31 c9                	xor    %ecx,%ecx
   1c8d3:	48 f7 d8             	neg    %rax
   1c8d6:	0f 93 c1             	setae  %cl
   1c8d9:	48 8d 0c 4d ff ff ff 	lea    -0x1(,%rcx,2),%rcx
   1c8e0:	ff 
   1c8e1:	4c 01 e9             	add    %r13,%rcx
   1c8e4:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1c8e9:	e8 72 fd ff ff       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1c8ee:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1c8f3:	74 44                	je     1c939 <<hyperinterval::ieee::Format>::add+0x299>
   1c8f5:	66 c7 03 01 05       	movw   $0x501,(%rbx)
   1c8fa:	eb 2b                	jmp    1c927 <<hyperinterval::ieee::Format>::add+0x287>
   1c8fc:	4c 29 e0             	sub    %r12,%rax
   1c8ff:	49 19 e9             	sbb    %rbp,%r9
   1c902:	0f b6 4c 24 0e       	movzbl 0xe(%rsp),%ecx
   1c907:	88 4c 24 24          	mov    %cl,0x24(%rsp)
   1c90b:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1c910:	4c 89 4c 24 18       	mov    %r9,0x18(%rsp)
   1c915:	44 89 74 24 20       	mov    %r14d,0x20(%rsp)
   1c91a:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1c91f:	48 89 df             	mov    %rbx,%rdi
   1c922:	e8 39 14 00 00       	call   1dd60 <<hyperinterval::ieee::Format>::rounded>
   1c927:	48 89 d8             	mov    %rbx,%rax
   1c92a:	48 83 c4 38          	add    $0x38,%rsp
   1c92e:	5b                   	pop    %rbx
   1c92f:	41 5c                	pop    %r12
   1c931:	41 5d                	pop    %r13
   1c933:	41 5e                	pop    %r14
   1c935:	41 5f                	pop    %r15
   1c937:	5d                   	pop    %rbp
   1c938:	c3                   	ret
   1c939:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1c93e:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1c942:	e9 e4 fe ff ff       	jmp    1c82b <<hyperinterval::ieee::Format>::add+0x18b>
   1c947:	cc                   	int3
   1c948:	cc                   	int3
   1c949:	cc                   	int3
   1c94a:	cc                   	int3
   1c94b:	cc                   	int3
   1c94c:	cc                   	int3
   1c94d:	cc                   	int3
   1c94e:	cc                   	int3
   1c94f:	cc                   	int3

<hyperinterval::ieee::Format>::div:
   1c950:	55                   	push   %rbp
   1c951:	41 57                	push   %r15
   1c953:	41 56                	push   %r14
   1c955:	41 55                	push   %r13
   1c957:	41 54                	push   %r12
   1c959:	53                   	push   %rbx
   1c95a:	48 83 ec 48          	sub    $0x48,%rsp
   1c95e:	4d 85 c0             	test   %r8,%r8
   1c961:	0f 84 cb 00 00 00    	je     1ca32 <<hyperinterval::ieee::Format>::div+0xe2>
   1c967:	48 85 c9             	test   %rcx,%rcx
   1c96a:	0f 84 cc 00 00 00    	je     1ca3c <<hyperinterval::ieee::Format>::div+0xec>
   1c970:	41 be 40 00 00 00    	mov    $0x40,%r14d
   1c976:	f3 4c 0f bc f2       	tzcnt  %rdx,%r14
   1c97b:	49 89 cd             	mov    %rcx,%r13
   1c97e:	49 21 d5             	and    %rdx,%r13
   1c981:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
   1c986:	41 83 e6 3f          	and    $0x3f,%r14d
   1c98a:	48 89 c8             	mov    %rcx,%rax
   1c98d:	44 89 f1             	mov    %r14d,%ecx
   1c990:	49 d3 ed             	shr    %cl,%r13
   1c993:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1c999:	49 d3 e2             	shl    %cl,%r10
   1c99c:	4d 8d 5a ff          	lea    -0x1(%r10),%r11
   1c9a0:	4c 89 db             	mov    %r11,%rbx
   1c9a3:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1c9a8:	48 21 c3             	and    %rax,%rbx
   1c9ab:	4d 85 ed             	test   %r13,%r13
   1c9ae:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1c9b4:	44 89 e8             	mov    %r13d,%eax
   1c9b7:	41 0f 44 c1          	cmove  %r9d,%eax
   1c9bb:	4d 0f 45 ea          	cmovne %r10,%r13
   1c9bf:	4c 89 c5             	mov    %r8,%rbp
   1c9c2:	48 21 d5             	and    %rdx,%rbp
   1c9c5:	48 d3 ea             	shr    %cl,%rdx
   1c9c8:	48 d3 ed             	shr    %cl,%rbp
   1c9cb:	49 09 dd             	or     %rbx,%r13
   1c9ce:	48 d1 ea             	shr    $1,%rdx
   1c9d1:	4d 21 c3             	and    %r8,%r11
   1c9d4:	48 85 ed             	test   %rbp,%rbp
   1c9d7:	44 0f 45 cd          	cmovne %ebp,%r9d
   1c9db:	49 0f 45 ea          	cmovne %r10,%rbp
   1c9df:	4c 09 dd             	or     %r11,%rbp
   1c9e2:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1c9e7:	41 ba 7f 00 00 00    	mov    $0x7f,%r10d
   1c9ed:	4c 0f bd d5          	bsr    %rbp,%r10
   1c9f1:	41 83 f2 3f          	xor    $0x3f,%r10d
   1c9f5:	41 83 c2 40          	add    $0x40,%r10d
   1c9f9:	49 0f bd cd          	bsr    %r13,%rcx
   1c9fd:	83 f1 3f             	xor    $0x3f,%ecx
   1ca00:	45 89 d7             	mov    %r10d,%r15d
   1ca03:	41 29 cf             	sub    %ecx,%r15d
   1ca06:	41 83 c7 c0          	add    $0xffffffc0,%r15d
   1ca0a:	78 3f                	js     1ca4b <<hyperinterval::ieee::Format>::div+0xfb>
   1ca0c:	45 31 db             	xor    %r11d,%r11d
   1ca0f:	44 89 f9             	mov    %r15d,%ecx
   1ca12:	49 0f a5 eb          	shld   %cl,%rbp,%r11
   1ca16:	31 db                	xor    %ebx,%ebx
   1ca18:	49 89 ec             	mov    %rbp,%r12
   1ca1b:	49 d3 e4             	shl    %cl,%r12
   1ca1e:	41 f6 c7 40          	test   $0x40,%r15b
   1ca22:	4d 0f 45 dc          	cmovne %r12,%r11
   1ca26:	4c 0f 45 e3          	cmovne %rbx,%r12
   1ca2a:	4d 39 e5             	cmp    %r12,%r13
   1ca2d:	4c 19 db             	sbb    %r11,%rbx
   1ca30:	eb 3f                	jmp    1ca71 <<hyperinterval::ieee::Format>::div+0x121>
   1ca32:	66 c7 07 01 06       	movw   $0x601,(%rdi)
   1ca37:	e9 24 03 00 00       	jmp    1cd60 <<hyperinterval::ieee::Format>::div+0x410>
   1ca3c:	c6 07 00             	movb   $0x0,(%rdi)
   1ca3f:	0f 57 c0             	xorps  %xmm0,%xmm0
   1ca42:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1ca46:	e9 15 03 00 00       	jmp    1cd60 <<hyperinterval::ieee::Format>::div+0x410>
   1ca4b:	44 89 f9             	mov    %r15d,%ecx
   1ca4e:	f6 d9                	neg    %cl
   1ca50:	45 31 db             	xor    %r11d,%r11d
   1ca53:	4d 0f a5 eb          	shld   %cl,%r13,%r11
   1ca57:	31 db                	xor    %ebx,%ebx
   1ca59:	4d 89 ec             	mov    %r13,%r12
   1ca5c:	49 d3 e4             	shl    %cl,%r12
   1ca5f:	f6 c1 40             	test   $0x40,%cl
   1ca62:	4d 0f 45 dc          	cmovne %r12,%r11
   1ca66:	4c 0f 45 e3          	cmovne %rbx,%r12
   1ca6a:	49 39 ec             	cmp    %rbp,%r12
   1ca6d:	49 83 db 00          	sbb    $0x0,%r11
   1ca71:	0f 92 c1             	setb   %cl
   1ca74:	44 29 c8             	sub    %r9d,%eax
   1ca77:	41 01 c7             	add    %eax,%r15d
   1ca7a:	0f b6 c9             	movzbl %cl,%ecx
   1ca7d:	41 29 cf             	sub    %ecx,%r15d
   1ca80:	41 39 d7             	cmp    %edx,%r15d
   1ca83:	0f 8f 19 02 00 00    	jg     1cca2 <<hyperinterval::ieee::Format>::div+0x352>
   1ca89:	4c 8b 4c 24 10       	mov    0x10(%rsp),%r9
   1ca8e:	46 8d 1c 0a          	lea    (%rdx,%r9,1),%r11d
   1ca92:	b9 01 00 00 00       	mov    $0x1,%ecx
   1ca97:	4c 89 5c 24 18       	mov    %r11,0x18(%rsp)
   1ca9c:	44 29 d9             	sub    %r11d,%ecx
   1ca9f:	45 29 cf             	sub    %r9d,%r15d
   1caa2:	41 39 cf             	cmp    %ecx,%r15d
   1caa5:	44 0f 4e f9          	cmovle %ecx,%r15d
   1caa9:	44 29 f8             	sub    %r15d,%eax
   1caac:	78 61                	js     1cb0f <<hyperinterval::ieee::Format>::div+0x1bf>
   1caae:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1cab3:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
   1cab8:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1cabd:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1cac2:	48 85 ed             	test   %rbp,%rbp
   1cac5:	0f 84 a7 02 00 00    	je     1cd72 <<hyperinterval::ieee::Format>::div+0x422>
   1cacb:	45 31 e4             	xor    %r12d,%r12d
   1cace:	89 c1                	mov    %eax,%ecx
   1cad0:	4d 0f a5 ec          	shld   %cl,%r13,%r12
   1cad4:	31 d2                	xor    %edx,%edx
   1cad6:	49 d3 e5             	shl    %cl,%r13
   1cad9:	a8 40                	test   $0x40,%al
   1cadb:	4d 0f 45 e5          	cmovne %r13,%r12
   1cadf:	4c 0f 45 ea          	cmovne %rdx,%r13
   1cae3:	4c 89 ef             	mov    %r13,%rdi
   1cae6:	4c 89 e6             	mov    %r12,%rsi
   1cae9:	48 89 ea             	mov    %rbp,%rdx
   1caec:	31 c9                	xor    %ecx,%ecx
   1caee:	ff 15 dc 0c 04 00    	call   *0x40cdc(%rip)        # 5d7d0 <_DYNAMIC+0x448>
   1caf4:	49 89 c2             	mov    %rax,%r10
   1caf7:	49 89 d1             	mov    %rdx,%r9
   1cafa:	48 89 d1             	mov    %rdx,%rcx
   1cafd:	48 0f af cd          	imul   %rbp,%rcx
   1cb01:	48 f7 e5             	mul    %rbp
   1cb04:	48 01 ca             	add    %rcx,%rdx
   1cb07:	49 29 c5             	sub    %rax,%r13
   1cb0a:	49 19 d4             	sbb    %rdx,%r12
   1cb0d:	eb 79                	jmp    1cb88 <<hyperinterval::ieee::Format>::div+0x238>
   1cb0f:	f7 d8                	neg    %eax
   1cb11:	44 39 d0             	cmp    %r10d,%eax
   1cb14:	7e 07                	jle    1cb1d <<hyperinterval::ieee::Format>::div+0x1cd>
   1cb16:	b3 01                	mov    $0x1,%bl
   1cb18:	e9 df 00 00 00       	jmp    1cbfc <<hyperinterval::ieee::Format>::div+0x2ac>
   1cb1d:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1cb22:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
   1cb27:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1cb2c:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1cb31:	31 db                	xor    %ebx,%ebx
   1cb33:	89 c1                	mov    %eax,%ecx
   1cb35:	48 0f a5 eb          	shld   %cl,%rbp,%rbx
   1cb39:	48 d3 e5             	shl    %cl,%rbp
   1cb3c:	31 c9                	xor    %ecx,%ecx
   1cb3e:	a8 40                	test   $0x40,%al
   1cb40:	48 0f 45 dd          	cmovne %rbp,%rbx
   1cb44:	48 0f 45 e9          	cmovne %rcx,%rbp
   1cb48:	48 89 e8             	mov    %rbp,%rax
   1cb4b:	48 09 d8             	or     %rbx,%rax
   1cb4e:	0f 84 2b 02 00 00    	je     1cd7f <<hyperinterval::ieee::Format>::div+0x42f>
   1cb54:	45 31 e4             	xor    %r12d,%r12d
   1cb57:	4c 89 ef             	mov    %r13,%rdi
   1cb5a:	31 f6                	xor    %esi,%esi
   1cb5c:	48 89 ea             	mov    %rbp,%rdx
   1cb5f:	48 89 d9             	mov    %rbx,%rcx
   1cb62:	ff 15 68 0c 04 00    	call   *0x40c68(%rip)        # 5d7d0 <_DYNAMIC+0x448>
   1cb68:	49 89 c2             	mov    %rax,%r10
   1cb6b:	49 89 d1             	mov    %rdx,%r9
   1cb6e:	48 0f af d8          	imul   %rax,%rbx
   1cb72:	48 f7 e5             	mul    %rbp
   1cb75:	48 01 da             	add    %rbx,%rdx
   1cb78:	4c 89 c9             	mov    %r9,%rcx
   1cb7b:	48 0f af cd          	imul   %rbp,%rcx
   1cb7f:	48 01 d1             	add    %rdx,%rcx
   1cb82:	49 29 c5             	sub    %rax,%r13
   1cb85:	49 19 cc             	sbb    %rcx,%r12
   1cb88:	4d 09 e5             	or     %r12,%r13
   1cb8b:	0f 95 c3             	setne  %bl
   1cb8e:	4c 89 d0             	mov    %r10,%rax
   1cb91:	4c 09 c8             	or     %r9,%rax
   1cb94:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
   1cb99:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   1cb9e:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
   1cba3:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
   1cba8:	74 52                	je     1cbfc <<hyperinterval::ieee::Format>::div+0x2ac>
   1cbaa:	49 0f bd c1          	bsr    %r9,%rax
   1cbae:	83 f0 3f             	xor    $0x3f,%eax
   1cbb1:	4d 0f bd da          	bsr    %r10,%r11
   1cbb5:	41 83 f3 3f          	xor    $0x3f,%r11d
   1cbb9:	41 83 cb 40          	or     $0x40,%r11d
   1cbbd:	4d 85 c9             	test   %r9,%r9
   1cbc0:	44 0f 45 d8          	cmovne %eax,%r11d
   1cbc4:	41 83 f3 7f          	xor    $0x7f,%r11d
   1cbc8:	43 8d 2c 3b          	lea    (%r11,%r15,1),%ebp
   1cbcc:	39 d5                	cmp    %edx,%ebp
   1cbce:	0f 8f ce 00 00 00    	jg     1cca2 <<hyperinterval::ieee::Format>::div+0x352>
   1cbd4:	b8 01 00 00 00       	mov    $0x1,%eax
   1cbd9:	29 d0                	sub    %edx,%eax
   1cbdb:	39 c5                	cmp    %eax,%ebp
   1cbdd:	7d 28                	jge    1cc07 <<hyperinterval::ieee::Format>::div+0x2b7>
   1cbdf:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1cbe4:	42 8d 0c 38          	lea    (%rax,%r15,1),%ecx
   1cbe8:	fe c9                	dec    %cl
   1cbea:	4c 89 d0             	mov    %r10,%rax
   1cbed:	48 d3 e0             	shl    %cl,%rax
   1cbf0:	45 31 db             	xor    %r11d,%r11d
   1cbf3:	f6 c1 40             	test   $0x40,%cl
   1cbf6:	4c 0f 44 d8          	cmove  %rax,%r11
   1cbfa:	eb 6e                	jmp    1cc6a <<hyperinterval::ieee::Format>::div+0x31a>
   1cbfc:	45 31 d2             	xor    %r10d,%r10d
   1cbff:	45 31 c9             	xor    %r9d,%r9d
   1cc02:	45 31 db             	xor    %r11d,%r11d
   1cc05:	eb 63                	jmp    1cc6a <<hyperinterval::ieee::Format>::div+0x31a>
   1cc07:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1cc0c:	89 c1                	mov    %eax,%ecx
   1cc0e:	44 29 d9             	sub    %r11d,%ecx
   1cc11:	4d 89 d4             	mov    %r10,%r12
   1cc14:	49 d3 e4             	shl    %cl,%r12
   1cc17:	89 c8                	mov    %ecx,%eax
   1cc19:	f7 d8                	neg    %eax
   1cc1b:	45 31 ed             	xor    %r13d,%r13d
   1cc1e:	f6 c1 40             	test   $0x40,%cl
   1cc21:	4d 0f 44 ec          	cmove  %r12,%r13
   1cc25:	4d 89 d4             	mov    %r10,%r12
   1cc28:	89 c1                	mov    %eax,%ecx
   1cc2a:	4d 0f ad cc          	shrd   %cl,%r9,%r12
   1cc2e:	88 5c 24 0f          	mov    %bl,0xf(%rsp)
   1cc32:	4c 89 cb             	mov    %r9,%rbx
   1cc35:	48 d3 eb             	shr    %cl,%rbx
   1cc38:	a8 40                	test   $0x40,%al
   1cc3a:	49 0f 44 dc          	cmove  %r12,%rbx
   1cc3e:	44 39 5c 24 10       	cmp    %r11d,0x10(%rsp)
   1cc43:	49 0f 43 dd          	cmovae %r13,%rbx
   1cc47:	01 d5                	add    %edx,%ebp
   1cc49:	48 63 c5             	movslq %ebp,%rax
   1cc4c:	44 89 f1             	mov    %r14d,%ecx
   1cc4f:	48 d3 e0             	shl    %cl,%rax
   1cc52:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   1cc59:	49 d3 e3             	shl    %cl,%r11
   1cc5c:	49 f7 d3             	not    %r11
   1cc5f:	49 21 db             	and    %rbx,%r11
   1cc62:	0f b6 5c 24 0f       	movzbl 0xf(%rsp),%ebx
   1cc67:	49 09 c3             	or     %rax,%r11
   1cc6a:	0f b6 db             	movzbl %bl,%ebx
   1cc6d:	4c 01 d3             	add    %r10,%rbx
   1cc70:	49 83 d1 00          	adc    $0x0,%r9
   1cc74:	48 89 d8             	mov    %rbx,%rax
   1cc77:	4c 09 c8             	or     %r9,%rax
   1cc7a:	74 30                	je     1ccac <<hyperinterval::ieee::Format>::div+0x35c>
   1cc7c:	49 0f bd c1          	bsr    %r9,%rax
   1cc80:	83 f0 3f             	xor    $0x3f,%eax
   1cc83:	4c 0f bd d3          	bsr    %rbx,%r10
   1cc87:	41 83 f2 3f          	xor    $0x3f,%r10d
   1cc8b:	41 83 ca 40          	or     $0x40,%r10d
   1cc8f:	4d 85 c9             	test   %r9,%r9
   1cc92:	44 0f 45 d0          	cmovne %eax,%r10d
   1cc96:	41 83 f2 7f          	xor    $0x7f,%r10d
   1cc9a:	43 8d 2c 3a          	lea    (%r10,%r15,1),%ebp
   1cc9e:	39 d5                	cmp    %edx,%ebp
   1cca0:	7e 0e                	jle    1ccb0 <<hyperinterval::ieee::Format>::div+0x360>
   1cca2:	66 c7 07 01 05       	movw   $0x501,(%rdi)
   1cca7:	e9 b4 00 00 00       	jmp    1cd60 <<hyperinterval::ieee::Format>::div+0x410>
   1ccac:	31 c0                	xor    %eax,%eax
   1ccae:	eb 76                	jmp    1cd26 <<hyperinterval::ieee::Format>::div+0x3d6>
   1ccb0:	b8 01 00 00 00       	mov    $0x1,%eax
   1ccb5:	29 d0                	sub    %edx,%eax
   1ccb7:	39 c5                	cmp    %eax,%ebp
   1ccb9:	7d 18                	jge    1ccd3 <<hyperinterval::ieee::Format>::div+0x383>
   1ccbb:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1ccc0:	44 01 f9             	add    %r15d,%ecx
   1ccc3:	fe c9                	dec    %cl
   1ccc5:	48 d3 e3             	shl    %cl,%rbx
   1ccc8:	31 c0                	xor    %eax,%eax
   1ccca:	f6 c1 40             	test   $0x40,%cl
   1cccd:	48 0f 44 c3          	cmove  %rbx,%rax
   1ccd1:	eb 53                	jmp    1cd26 <<hyperinterval::ieee::Format>::div+0x3d6>
   1ccd3:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   1ccd8:	44 89 e9             	mov    %r13d,%ecx
   1ccdb:	44 29 d1             	sub    %r10d,%ecx
   1ccde:	89 c8                	mov    %ecx,%eax
   1cce0:	f7 d8                	neg    %eax
   1cce2:	49 89 df             	mov    %rbx,%r15
   1cce5:	49 d3 e7             	shl    %cl,%r15
   1cce8:	45 31 e4             	xor    %r12d,%r12d
   1cceb:	f6 c1 40             	test   $0x40,%cl
   1ccee:	4d 0f 44 e7          	cmove  %r15,%r12
   1ccf2:	89 c1                	mov    %eax,%ecx
   1ccf4:	4c 0f ad cb          	shrd   %cl,%r9,%rbx
   1ccf8:	49 d3 e9             	shr    %cl,%r9
   1ccfb:	a8 40                	test   $0x40,%al
   1ccfd:	4c 0f 44 cb          	cmove  %rbx,%r9
   1cd01:	45 39 d5             	cmp    %r10d,%r13d
   1cd04:	4d 0f 43 cc          	cmovae %r12,%r9
   1cd08:	01 d5                	add    %edx,%ebp
   1cd0a:	48 63 d5             	movslq %ebp,%rdx
   1cd0d:	44 89 f1             	mov    %r14d,%ecx
   1cd10:	48 d3 e2             	shl    %cl,%rdx
   1cd13:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   1cd1a:	48 d3 e0             	shl    %cl,%rax
   1cd1d:	48 f7 d0             	not    %rax
   1cd20:	4c 21 c8             	and    %r9,%rax
   1cd23:	48 09 d0             	or     %rdx,%rax
   1cd26:	48 85 74 24 40       	test   %rsi,0x40(%rsp)
   1cd2b:	0f 95 c1             	setne  %cl
   1cd2e:	49 85 f0             	test   %rsi,%r8
   1cd31:	0f 94 c2             	sete   %dl
   1cd34:	30 ca                	xor    %cl,%dl
   1cd36:	75 1d                	jne    1cd55 <<hyperinterval::ieee::Format>::div+0x405>
   1cd38:	48 89 c1             	mov    %rax,%rcx
   1cd3b:	48 31 f1             	xor    %rsi,%rcx
   1cd3e:	48 85 c0             	test   %rax,%rax
   1cd41:	48 0f 44 c8          	cmove  %rax,%rcx
   1cd45:	4c 31 de             	xor    %r11,%rsi
   1cd48:	4d 85 db             	test   %r11,%r11
   1cd4b:	49 0f 44 f3          	cmove  %r11,%rsi
   1cd4f:	48 89 f0             	mov    %rsi,%rax
   1cd52:	49 89 cb             	mov    %rcx,%r11
   1cd55:	4c 89 5f 08          	mov    %r11,0x8(%rdi)
   1cd59:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1cd5d:	c6 07 00             	movb   $0x0,(%rdi)
   1cd60:	48 89 f8             	mov    %rdi,%rax
   1cd63:	48 83 c4 48          	add    $0x48,%rsp
   1cd67:	5b                   	pop    %rbx
   1cd68:	41 5c                	pop    %r12
   1cd6a:	41 5d                	pop    %r13
   1cd6c:	41 5e                	pop    %r14
   1cd6e:	41 5f                	pop    %r15
   1cd70:	5d                   	pop    %rbp
   1cd71:	c3                   	ret
   1cd72:	48 8d 3d 07 e8 03 00 	lea    0x3e807(%rip),%rdi        # 5b580 <__frame_dummy_init_array_entry+0x1f0>
   1cd79:	ff 15 59 0a 04 00    	call   *0x40a59(%rip)        # 5d7d8 <_DYNAMIC+0x450>
   1cd7f:	48 8d 3d e2 e7 03 00 	lea    0x3e7e2(%rip),%rdi        # 5b568 <__frame_dummy_init_array_entry+0x1d8>
   1cd86:	ff 15 4c 0a 04 00    	call   *0x40a4c(%rip)        # 5d7d8 <_DYNAMIC+0x450>
   1cd8c:	cc                   	int3
   1cd8d:	cc                   	int3
   1cd8e:	cc                   	int3
   1cd8f:	cc                   	int3

<hyperinterval::ieee::Format>::mul:
   1cd90:	55                   	push   %rbp
   1cd91:	41 57                	push   %r15
   1cd93:	41 56                	push   %r14
   1cd95:	41 54                	push   %r12
   1cd97:	53                   	push   %rbx
   1cd98:	48 83 ec 20          	sub    $0x20,%rsp
   1cd9c:	48 89 c8             	mov    %rcx,%rax
   1cd9f:	49 89 d1             	mov    %rdx,%r9
   1cda2:	b9 40 00 00 00       	mov    $0x40,%ecx
   1cda7:	f3 48 0f bc ca       	tzcnt  %rdx,%rcx
   1cdac:	48 89 c2             	mov    %rax,%rdx
   1cdaf:	4c 21 ca             	and    %r9,%rdx
   1cdb2:	48 d3 ea             	shr    %cl,%rdx
   1cdb5:	41 be 01 00 00 00    	mov    $0x1,%r14d
   1cdbb:	49 d3 e6             	shl    %cl,%r14
   1cdbe:	4d 8d 66 ff          	lea    -0x1(%r14),%r12
   1cdc2:	4c 89 e3             	mov    %r12,%rbx
   1cdc5:	48 21 c3             	and    %rax,%rbx
   1cdc8:	48 85 d2             	test   %rdx,%rdx
   1cdcb:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1cdd1:	41 89 d3             	mov    %edx,%r11d
   1cdd4:	45 0f 44 da          	cmove  %r10d,%r11d
   1cdd8:	49 0f 45 d6          	cmovne %r14,%rdx
   1cddc:	48 09 da             	or     %rbx,%rdx
   1cddf:	4d 89 cf             	mov    %r9,%r15
   1cde2:	49 d3 ef             	shr    %cl,%r15
   1cde5:	48 85 f0             	test   %rsi,%rax
   1cde8:	40 0f 95 c5          	setne  %bpl
   1cdec:	4c 89 c0             	mov    %r8,%rax
   1cdef:	4c 21 c8             	and    %r9,%rax
   1cdf2:	48 d3 e8             	shr    %cl,%rax
   1cdf5:	4d 21 c4             	and    %r8,%r12
   1cdf8:	48 85 c0             	test   %rax,%rax
   1cdfb:	44 0f 45 d0          	cmovne %eax,%r10d
   1cdff:	48 89 fb             	mov    %rdi,%rbx
   1ce02:	49 0f 45 c6          	cmovne %r14,%rax
   1ce06:	4c 09 e0             	or     %r12,%rax
   1ce09:	49 85 f0             	test   %rsi,%r8
   1ce0c:	40 0f 95 c7          	setne  %dil
   1ce10:	40 30 ef             	xor    %bpl,%dil
   1ce13:	48 f7 e2             	mul    %rdx
   1ce16:	45 01 da             	add    %r11d,%r10d
   1ce19:	41 8d 0c 4f          	lea    (%r15,%rcx,2),%ecx
   1ce1d:	83 e1 fe             	and    $0xfffffffe,%ecx
   1ce20:	41 29 ca             	sub    %ecx,%r10d
   1ce23:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
   1ce28:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1ce2d:	48 89 04 24          	mov    %rax,(%rsp)
   1ce31:	44 89 54 24 10       	mov    %r10d,0x10(%rsp)
   1ce36:	48 89 e1             	mov    %rsp,%rcx
   1ce39:	48 89 df             	mov    %rbx,%rdi
   1ce3c:	4c 89 ca             	mov    %r9,%rdx
   1ce3f:	e8 1c 0f 00 00       	call   1dd60 <<hyperinterval::ieee::Format>::rounded>
   1ce44:	48 89 d8             	mov    %rbx,%rax
   1ce47:	48 83 c4 20          	add    $0x20,%rsp
   1ce4b:	5b                   	pop    %rbx
   1ce4c:	41 5c                	pop    %r12
   1ce4e:	41 5e                	pop    %r14
   1ce50:	41 5f                	pop    %r15
   1ce52:	5d                   	pop    %rbp
   1ce53:	c3                   	ret
   1ce54:	cc                   	int3
   1ce55:	cc                   	int3
   1ce56:	cc                   	int3
   1ce57:	cc                   	int3
   1ce58:	cc                   	int3
   1ce59:	cc                   	int3
   1ce5a:	cc                   	int3
   1ce5b:	cc                   	int3
   1ce5c:	cc                   	int3
   1ce5d:	cc                   	int3
   1ce5e:	cc                   	int3
   1ce5f:	cc                   	int3

<hyperinterval::ieee::Format>::sqrt:
   1ce60:	55                   	push   %rbp
   1ce61:	41 57                	push   %r15
   1ce63:	41 56                	push   %r14
   1ce65:	41 55                	push   %r13
   1ce67:	41 54                	push   %r12
   1ce69:	53                   	push   %rbx
   1ce6a:	48 83 ec 38          	sub    $0x38,%rsp
   1ce6e:	48 89 c8             	mov    %rcx,%rax
   1ce71:	49 89 d6             	mov    %rdx,%r14
   1ce74:	41 b8 40 00 00 00    	mov    $0x40,%r8d
   1ce7a:	f3 4c 0f bc c2       	tzcnt  %rdx,%r8
   1ce7f:	48 89 ca             	mov    %rcx,%rdx
   1ce82:	4c 21 f2             	and    %r14,%rdx
   1ce85:	45 89 c5             	mov    %r8d,%r13d
   1ce88:	41 83 e5 3f          	and    $0x3f,%r13d
   1ce8c:	44 89 e9             	mov    %r13d,%ecx
   1ce8f:	48 d3 ea             	shr    %cl,%rdx
   1ce92:	bd 01 00 00 00       	mov    $0x1,%ebp
   1ce97:	48 d3 e5             	shl    %cl,%rbp
   1ce9a:	49 89 ff             	mov    %rdi,%r15
   1ce9d:	48 8d 75 ff          	lea    -0x1(%rbp),%rsi
   1cea1:	48 21 c6             	and    %rax,%rsi
   1cea4:	48 85 d2             	test   %rdx,%rdx
   1cea7:	48 0f 44 ea          	cmove  %rdx,%rbp
   1ceab:	49 d3 ee             	shr    %cl,%r14
   1ceae:	48 09 f5             	or     %rsi,%rbp
   1ceb1:	0f 84 8a 00 00 00    	je     1cf41 <<hyperinterval::ieee::Format>::sqrt+0xe1>
   1ceb7:	49 d1 ee             	shr    $1,%r14
   1ceba:	48 85 d2             	test   %rdx,%rdx
   1cebd:	b9 01 00 00 00       	mov    $0x1,%ecx
   1cec2:	0f 45 ca             	cmovne %edx,%ecx
   1cec5:	44 29 f1             	sub    %r14d,%ecx
   1cec8:	44 29 c1             	sub    %r8d,%ecx
   1cecb:	48 0f bd dd          	bsr    %rbp,%rbx
   1cecf:	83 f3 3f             	xor    $0x3f,%ebx
   1ced2:	83 cb 40             	or     $0x40,%ebx
   1ced5:	83 f3 7f             	xor    $0x7f,%ebx
   1ced8:	01 cb                	add    %ecx,%ebx
   1ceda:	d1 fb                	sar    $1,%ebx
   1cedc:	41 89 db             	mov    %ebx,%r11d
   1cedf:	45 29 c3             	sub    %r8d,%r11d
   1cee2:	44 29 d9             	sub    %r11d,%ecx
   1cee5:	44 29 d9             	sub    %r11d,%ecx
   1cee8:	45 31 d2             	xor    %r10d,%r10d
   1ceeb:	49 0f a5 ea          	shld   %cl,%rbp,%r10
   1ceef:	48 d3 e5             	shl    %cl,%rbp
   1cef2:	31 f6                	xor    %esi,%esi
   1cef4:	f6 c1 40             	test   $0x40,%cl
   1cef7:	4c 0f 45 d5          	cmovne %rbp,%r10
   1cefb:	48 0f 45 ee          	cmovne %rsi,%rbp
   1ceff:	4d 85 d2             	test   %r10,%r10
   1cf02:	4c 89 44 24 10       	mov    %r8,0x10(%rsp)
   1cf07:	75 45                	jne    1cf4e <<hyperinterval::ieee::Format>::sqrt+0xee>
   1cf09:	48 89 e8             	mov    %rbp,%rax
   1cf0c:	48 c1 e8 20          	shr    $0x20,%rax
   1cf10:	0f 85 64 01 00 00    	jne    1d07a <<hyperinterval::ieee::Format>::sqrt+0x21a>
   1cf16:	48 81 fd 00 00 01 00 	cmp    $0x10000,%rbp
   1cf1d:	0f 83 17 03 00 00    	jae    1d23a <<hyperinterval::ieee::Format>::sqrt+0x3da>
   1cf23:	48 81 fd 00 01 00 00 	cmp    $0x100,%rbp
   1cf2a:	0f 83 eb 03 00 00    	jae    1d31b <<hyperinterval::ieee::Format>::sqrt+0x4bb>
   1cf30:	48 8d 05 85 a8 fe ff 	lea    -0x1577b(%rip),%rax        # 77bc <__abi_tag+0x74c0>
   1cf37:	44 0f b6 24 68       	movzbl (%rax,%rbp,2),%r12d
   1cf3c:	e9 d6 03 00 00       	jmp    1d317 <<hyperinterval::ieee::Format>::sqrt+0x4b7>
   1cf41:	0f 57 c0             	xorps  %xmm0,%xmm0
   1cf44:	41 0f 11 47 08       	movups %xmm0,0x8(%r15)
   1cf49:	e9 fe 05 00 00       	jmp    1d54c <<hyperinterval::ieee::Format>::sqrt+0x6ec>
   1cf4e:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
   1cf53:	4c 89 7c 24 30       	mov    %r15,0x30(%rsp)
   1cf58:	49 0f bd c2          	bsr    %r10,%rax
   1cf5c:	48 83 f0 3f          	xor    $0x3f,%rax
   1cf60:	4c 0f bd ed          	bsr    %rbp,%r13
   1cf64:	49 83 f5 3f          	xor    $0x3f,%r13
   1cf68:	49 83 cd 40          	or     $0x40,%r13
   1cf6c:	4d 85 d2             	test   %r10,%r10
   1cf6f:	4c 0f 45 e8          	cmovne %rax,%r13
   1cf73:	44 89 e9             	mov    %r13d,%ecx
   1cf76:	80 e1 3e             	and    $0x3e,%cl
   1cf79:	4d 89 d7             	mov    %r10,%r15
   1cf7c:	49 0f a5 ef          	shld   %cl,%rbp,%r15
   1cf80:	48 89 e8             	mov    %rbp,%rax
   1cf83:	48 d3 e0             	shl    %cl,%rax
   1cf86:	41 f6 c5 40          	test   $0x40,%r13b
   1cf8a:	4c 0f 45 f8          	cmovne %rax,%r15
   1cf8e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   1cf94:	4c 0f 44 c0          	cmove  %rax,%r8
   1cf98:	4c 89 f8             	mov    %r15,%rax
   1cf9b:	48 c1 e8 38          	shr    $0x38,%rax
   1cf9f:	48 8d 15 16 a8 fe ff 	lea    -0x157ea(%rip),%rdx        # 77bc <__abi_tag+0x74c0>
   1cfa6:	0f b6 0c 42          	movzbl (%rdx,%rax,2),%ecx
   1cfaa:	89 cf                	mov    %ecx,%edi
   1cfac:	01 cf                	add    %ecx,%edi
   1cfae:	0f b6 54 42 01       	movzbl 0x1(%rdx,%rax,2),%edx
   1cfb3:	c1 e2 04             	shl    $0x4,%edx
   1cfb6:	4c 89 f8             	mov    %r15,%rax
   1cfb9:	48 c1 e8 34          	shr    $0x34,%rax
   1cfbd:	83 e0 0f             	and    $0xf,%eax
   1cfc0:	09 d0                	or     %edx,%eax
   1cfc2:	31 d2                	xor    %edx,%edx
   1cfc4:	66 f7 f7             	div    %di
   1cfc7:	4c 89 ff             	mov    %r15,%rdi
   1cfca:	48 c1 ef 30          	shr    $0x30,%rdi
   1cfce:	0f b7 d2             	movzwl %dx,%edx
   1cfd1:	c0 e1 04             	shl    $0x4,%cl
   1cfd4:	0f b6 c9             	movzbl %cl,%ecx
   1cfd7:	01 c1                	add    %eax,%ecx
   1cfd9:	0f b7 c9             	movzwl %cx,%ecx
   1cfdc:	c1 e2 04             	shl    $0x4,%edx
   1cfdf:	83 e7 0f             	and    $0xf,%edi
   1cfe2:	09 d7                	or     %edx,%edi
   1cfe4:	0f af c0             	imul   %eax,%eax
   1cfe7:	66 29 c7             	sub    %ax,%di
   1cfea:	8d 44 09 ff          	lea    -0x1(%rcx,%rcx,1),%eax
   1cfee:	0f 43 c6             	cmovae %esi,%eax
   1cff1:	66 83 d9 00          	sbb    $0x0,%cx
   1cff5:	01 f8                	add    %edi,%eax
   1cff7:	0f b7 f9             	movzwl %cx,%edi
   1cffa:	01 ff                	add    %edi,%edi
   1cffc:	0f b7 d0             	movzwl %ax,%edx
   1cfff:	c1 e2 08             	shl    $0x8,%edx
   1d002:	4c 89 f8             	mov    %r15,%rax
   1d005:	48 c1 e8 28          	shr    $0x28,%rax
   1d009:	0f b6 c0             	movzbl %al,%eax
   1d00c:	09 d0                	or     %edx,%eax
   1d00e:	31 d2                	xor    %edx,%edx
   1d010:	f7 f7                	div    %edi
   1d012:	4c 89 ff             	mov    %r15,%rdi
   1d015:	48 c1 ef 20          	shr    $0x20,%rdi
   1d019:	c1 e1 08             	shl    $0x8,%ecx
   1d01c:	44 0f b7 e1          	movzwl %cx,%r12d
   1d020:	41 01 c4             	add    %eax,%r12d
   1d023:	c1 e2 08             	shl    $0x8,%edx
   1d026:	40 0f b6 cf          	movzbl %dil,%ecx
   1d02a:	09 d1                	or     %edx,%ecx
   1d02c:	0f af c0             	imul   %eax,%eax
   1d02f:	29 c1                	sub    %eax,%ecx
   1d031:	43 8d 44 24 ff       	lea    -0x1(%r12,%r12,1),%eax
   1d036:	0f 43 c6             	cmovae %esi,%eax
   1d039:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1d03c:	41 83 dc 00          	sbb    $0x0,%r12d
   1d040:	4b 8d 0c 24          	lea    (%r12,%r12,1),%rcx
   1d044:	48 c1 e2 10          	shl    $0x10,%rdx
   1d048:	44 89 f8             	mov    %r15d,%eax
   1d04b:	c1 e8 10             	shr    $0x10,%eax
   1d04e:	48 09 d0             	or     %rdx,%rax
   1d051:	48 09 ca             	or     %rcx,%rdx
   1d054:	48 c1 ea 20          	shr    $0x20,%rdx
   1d058:	66 85 d2             	test   %dx,%dx
   1d05b:	4c 89 5c 24 08       	mov    %r11,0x8(%rsp)
   1d060:	4c 89 54 24 20       	mov    %r10,0x20(%rsp)
   1d065:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
   1d06a:	0f 84 06 01 00 00    	je     1d176 <<hyperinterval::ieee::Format>::sqrt+0x316>
   1d070:	31 d2                	xor    %edx,%edx
   1d072:	48 f7 f1             	div    %rcx
   1d075:	e9 00 01 00 00       	jmp    1d17a <<hyperinterval::ieee::Format>::sqrt+0x31a>
   1d07a:	48 0f bd f5          	bsr    %rbp,%rsi
   1d07e:	48 83 f6 3f          	xor    $0x3f,%rsi
   1d082:	89 f1                	mov    %esi,%ecx
   1d084:	80 e1 3e             	and    $0x3e,%cl
   1d087:	48 89 ef             	mov    %rbp,%rdi
   1d08a:	48 d3 e7             	shl    %cl,%rdi
   1d08d:	48 89 f8             	mov    %rdi,%rax
   1d090:	48 c1 e8 38          	shr    $0x38,%rax
   1d094:	48 8d 0d 21 a7 fe ff 	lea    -0x158df(%rip),%rcx        # 77bc <__abi_tag+0x74c0>
   1d09b:	44 0f b6 04 41       	movzbl (%rcx,%rax,2),%r8d
   1d0a0:	45 89 c1             	mov    %r8d,%r9d
   1d0a3:	45 01 c1             	add    %r8d,%r9d
   1d0a6:	0f b6 4c 41 01       	movzbl 0x1(%rcx,%rax,2),%ecx
   1d0ab:	c1 e1 04             	shl    $0x4,%ecx
   1d0ae:	48 89 f8             	mov    %rdi,%rax
   1d0b1:	48 c1 e8 34          	shr    $0x34,%rax
   1d0b5:	83 e0 0f             	and    $0xf,%eax
   1d0b8:	09 c8                	or     %ecx,%eax
   1d0ba:	31 d2                	xor    %edx,%edx
   1d0bc:	66 41 f7 f1          	div    %r9w
   1d0c0:	49 89 f9             	mov    %rdi,%r9
   1d0c3:	49 c1 e9 30          	shr    $0x30,%r9
   1d0c7:	31 c9                	xor    %ecx,%ecx
   1d0c9:	0f b7 d2             	movzwl %dx,%edx
   1d0cc:	41 c0 e0 04          	shl    $0x4,%r8b
   1d0d0:	45 0f b6 c0          	movzbl %r8b,%r8d
   1d0d4:	41 01 c0             	add    %eax,%r8d
   1d0d7:	45 0f b7 c0          	movzwl %r8w,%r8d
   1d0db:	c1 e2 04             	shl    $0x4,%edx
   1d0de:	41 83 e1 0f          	and    $0xf,%r9d
   1d0e2:	41 09 d1             	or     %edx,%r9d
   1d0e5:	0f af c0             	imul   %eax,%eax
   1d0e8:	66 41 29 c1          	sub    %ax,%r9w
   1d0ec:	43 8d 44 00 ff       	lea    -0x1(%r8,%r8,1),%eax
   1d0f1:	0f 43 c1             	cmovae %ecx,%eax
   1d0f4:	66 41 83 d8 00       	sbb    $0x0,%r8w
   1d0f9:	44 01 c8             	add    %r9d,%eax
   1d0fc:	45 0f b7 c8          	movzwl %r8w,%r9d
   1d100:	45 01 c9             	add    %r9d,%r9d
   1d103:	0f b7 d0             	movzwl %ax,%edx
   1d106:	c1 e2 08             	shl    $0x8,%edx
   1d109:	48 89 f8             	mov    %rdi,%rax
   1d10c:	48 c1 e8 28          	shr    $0x28,%rax
   1d110:	0f b6 c0             	movzbl %al,%eax
   1d113:	09 d0                	or     %edx,%eax
   1d115:	31 d2                	xor    %edx,%edx
   1d117:	41 f7 f1             	div    %r9d
   1d11a:	49 89 f9             	mov    %rdi,%r9
   1d11d:	49 c1 e9 20          	shr    $0x20,%r9
   1d121:	41 c1 e0 08          	shl    $0x8,%r8d
   1d125:	45 0f b7 e0          	movzwl %r8w,%r12d
   1d129:	41 01 c4             	add    %eax,%r12d
   1d12c:	c1 e2 08             	shl    $0x8,%edx
   1d12f:	45 0f b6 c1          	movzbl %r9b,%r8d
   1d133:	41 09 d0             	or     %edx,%r8d
   1d136:	0f af c0             	imul   %eax,%eax
   1d139:	41 29 c0             	sub    %eax,%r8d
   1d13c:	43 8d 44 24 ff       	lea    -0x1(%r12,%r12,1),%eax
   1d141:	0f 43 c1             	cmovae %ecx,%eax
   1d144:	41 8d 14 00          	lea    (%r8,%rax,1),%edx
   1d148:	41 83 dc 00          	sbb    $0x0,%r12d
   1d14c:	4b 8d 0c 24          	lea    (%r12,%r12,1),%rcx
   1d150:	48 c1 e2 10          	shl    $0x10,%rdx
   1d154:	89 f8                	mov    %edi,%eax
   1d156:	c1 e8 10             	shr    $0x10,%eax
   1d159:	48 09 d0             	or     %rdx,%rax
   1d15c:	48 09 ca             	or     %rcx,%rdx
   1d15f:	48 c1 ea 20          	shr    $0x20,%rdx
   1d163:	66 85 d2             	test   %dx,%dx
   1d166:	0f 84 82 01 00 00    	je     1d2ee <<hyperinterval::ieee::Format>::sqrt+0x48e>
   1d16c:	31 d2                	xor    %edx,%edx
   1d16e:	48 f7 f1             	div    %rcx
   1d171:	e9 7c 01 00 00       	jmp    1d2f2 <<hyperinterval::ieee::Format>::sqrt+0x492>
   1d176:	31 d2                	xor    %edx,%edx
   1d178:	f7 f1                	div    %ecx
   1d17a:	41 c1 e4 10          	shl    $0x10,%r12d
   1d17e:	49 01 c4             	add    %rax,%r12
   1d181:	48 c1 e2 10          	shl    $0x10,%rdx
   1d185:	41 0f b7 cf          	movzwl %r15w,%ecx
   1d189:	48 09 d1             	or     %rdx,%rcx
   1d18c:	48 0f af c0          	imul   %rax,%rax
   1d190:	31 d2                	xor    %edx,%edx
   1d192:	48 29 c1             	sub    %rax,%rcx
   1d195:	4b 8d 44 24 ff       	lea    -0x1(%r12,%r12,1),%rax
   1d19a:	48 0f 42 d0          	cmovb  %rax,%rdx
   1d19e:	49 83 dc 00          	sbb    $0x0,%r12
   1d1a2:	48 8d 3c 11          	lea    (%rcx,%rdx,1),%rdi
   1d1a6:	4b 8d 14 24          	lea    (%r12,%r12,1),%rdx
   1d1aa:	4c 89 e1             	mov    %r12,%rcx
   1d1ad:	48 c1 e9 3f          	shr    $0x3f,%rcx
   1d1b1:	48 89 fe             	mov    %rdi,%rsi
   1d1b4:	48 c1 ee 20          	shr    $0x20,%rsi
   1d1b8:	4c 0f a4 c7 20       	shld   $0x20,%r8,%rdi
   1d1bd:	4c 89 c3             	mov    %r8,%rbx
   1d1c0:	ff 15 0a 06 04 00    	call   *0x4060a(%rip)        # 5d7d0 <_DYNAMIC+0x448>
   1d1c6:	48 89 d6             	mov    %rdx,%rsi
   1d1c9:	49 c1 e4 20          	shl    $0x20,%r12
   1d1cd:	49 01 c4             	add    %rax,%r12
   1d1d0:	48 83 d6 00          	adc    $0x0,%rsi
   1d1d4:	48 89 f0             	mov    %rsi,%rax
   1d1d7:	49 f7 e4             	mul    %r12
   1d1da:	0f 90 c1             	seto   %cl
   1d1dd:	48 85 f6             	test   %rsi,%rsi
   1d1e0:	40 0f 95 c7          	setne  %dil
   1d1e4:	40 08 cf             	or     %cl,%dil
   1d1e7:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   1d1eb:	4c 89 e0             	mov    %r12,%rax
   1d1ee:	49 f7 e4             	mul    %r12
   1d1f1:	48 01 ca             	add    %rcx,%rdx
   1d1f4:	0f 92 c1             	setb   %cl
   1d1f7:	40 08 f9             	or     %dil,%cl
   1d1fa:	48 39 c3             	cmp    %rax,%rbx
   1d1fd:	49 19 d7             	sbb    %rdx,%r15
   1d200:	0f 92 c0             	setb   %al
   1d203:	08 c8                	or     %cl,%al
   1d205:	0f b6 c0             	movzbl %al,%eax
   1d208:	49 29 c4             	sub    %rax,%r12
   1d20b:	48 83 de 00          	sbb    $0x0,%rsi
   1d20f:	41 d1 ed             	shr    $1,%r13d
   1d212:	44 89 e9             	mov    %r13d,%ecx
   1d215:	49 0f ad f4          	shrd   %cl,%rsi,%r12
   1d219:	48 d3 ee             	shr    %cl,%rsi
   1d21c:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
   1d221:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
   1d226:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
   1d22b:	4c 8b 54 24 20       	mov    0x20(%rsp),%r10
   1d230:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
   1d235:	e9 52 01 00 00       	jmp    1d38c <<hyperinterval::ieee::Format>::sqrt+0x52c>
   1d23a:	0f bd fd             	bsr    %ebp,%edi
   1d23d:	83 f7 1f             	xor    $0x1f,%edi
   1d240:	89 f9                	mov    %edi,%ecx
   1d242:	80 e1 1e             	and    $0x1e,%cl
   1d245:	89 ea                	mov    %ebp,%edx
   1d247:	d3 e2                	shl    %cl,%edx
   1d249:	89 d0                	mov    %edx,%eax
   1d24b:	41 89 d0             	mov    %edx,%r8d
   1d24e:	c1 e8 18             	shr    $0x18,%eax
   1d251:	48 8d 15 64 a5 fe ff 	lea    -0x15a9c(%rip),%rdx        # 77bc <__abi_tag+0x74c0>
   1d258:	0f b6 0c 42          	movzbl (%rdx,%rax,2),%ecx
   1d25c:	89 ce                	mov    %ecx,%esi
   1d25e:	01 ce                	add    %ecx,%esi
   1d260:	0f b6 54 42 01       	movzbl 0x1(%rdx,%rax,2),%edx
   1d265:	c1 e2 04             	shl    $0x4,%edx
   1d268:	45 89 c1             	mov    %r8d,%r9d
   1d26b:	44 89 c0             	mov    %r8d,%eax
   1d26e:	c1 e8 14             	shr    $0x14,%eax
   1d271:	83 e0 0f             	and    $0xf,%eax
   1d274:	09 d0                	or     %edx,%eax
   1d276:	31 d2                	xor    %edx,%edx
   1d278:	66 f7 f6             	div    %si
   1d27b:	41 c1 e8 10          	shr    $0x10,%r8d
   1d27f:	31 f6                	xor    %esi,%esi
   1d281:	0f b7 d2             	movzwl %dx,%edx
   1d284:	c0 e1 04             	shl    $0x4,%cl
   1d287:	0f b6 c9             	movzbl %cl,%ecx
   1d28a:	01 c1                	add    %eax,%ecx
   1d28c:	0f b7 c9             	movzwl %cx,%ecx
   1d28f:	c1 e2 04             	shl    $0x4,%edx
   1d292:	41 83 e0 0f          	and    $0xf,%r8d
   1d296:	41 09 d0             	or     %edx,%r8d
   1d299:	0f af c0             	imul   %eax,%eax
   1d29c:	66 41 29 c0          	sub    %ax,%r8w
   1d2a0:	8d 44 09 ff          	lea    -0x1(%rcx,%rcx,1),%eax
   1d2a4:	0f 43 c6             	cmovae %esi,%eax
   1d2a7:	66 83 d9 00          	sbb    $0x0,%cx
   1d2ab:	44 01 c0             	add    %r8d,%eax
   1d2ae:	44 0f b7 c1          	movzwl %cx,%r8d
   1d2b2:	45 01 c0             	add    %r8d,%r8d
   1d2b5:	0f b7 d0             	movzwl %ax,%edx
   1d2b8:	c1 e2 08             	shl    $0x8,%edx
   1d2bb:	44 89 c8             	mov    %r9d,%eax
   1d2be:	0f b6 c4             	movzbl %ah,%eax
   1d2c1:	09 d0                	or     %edx,%eax
   1d2c3:	31 d2                	xor    %edx,%edx
   1d2c5:	41 f7 f0             	div    %r8d
   1d2c8:	c1 e1 08             	shl    $0x8,%ecx
   1d2cb:	44 0f b7 e1          	movzwl %cx,%r12d
   1d2cf:	41 01 c4             	add    %eax,%r12d
   1d2d2:	44 89 e0             	mov    %r12d,%eax
   1d2d5:	41 f7 e4             	mul    %r12d
   1d2d8:	0f 90 c1             	seto   %cl
   1d2db:	44 39 c8             	cmp    %r9d,%eax
   1d2de:	0f 97 c0             	seta   %al
   1d2e1:	08 c8                	or     %cl,%al
   1d2e3:	0f b6 c0             	movzbl %al,%eax
   1d2e6:	41 29 c4             	sub    %eax,%r12d
   1d2e9:	e9 97 00 00 00       	jmp    1d385 <<hyperinterval::ieee::Format>::sqrt+0x525>
   1d2ee:	31 d2                	xor    %edx,%edx
   1d2f0:	f7 f1                	div    %ecx
   1d2f2:	41 c1 e4 10          	shl    $0x10,%r12d
   1d2f6:	49 01 c4             	add    %rax,%r12
   1d2f9:	4c 89 e0             	mov    %r12,%rax
   1d2fc:	49 f7 e4             	mul    %r12
   1d2ff:	0f 90 c1             	seto   %cl
   1d302:	48 39 f8             	cmp    %rdi,%rax
   1d305:	0f 97 c0             	seta   %al
   1d308:	08 c8                	or     %cl,%al
   1d30a:	0f b6 c0             	movzbl %al,%eax
   1d30d:	49 29 c4             	sub    %rax,%r12
   1d310:	d1 ee                	shr    $1,%esi
   1d312:	89 f1                	mov    %esi,%ecx
   1d314:	49 d3 ec             	shr    %cl,%r12
   1d317:	31 f6                	xor    %esi,%esi
   1d319:	eb 71                	jmp    1d38c <<hyperinterval::ieee::Format>::sqrt+0x52c>
   1d31b:	66 0f bd fd          	bsr    %bp,%di
   1d31f:	83 f7 0f             	xor    $0xf,%edi
   1d322:	89 f9                	mov    %edi,%ecx
   1d324:	80 e1 0e             	and    $0xe,%cl
   1d327:	89 e8                	mov    %ebp,%eax
   1d329:	d3 e0                	shl    %cl,%eax
   1d32b:	41 89 c0             	mov    %eax,%r8d
   1d32e:	0f b6 cc             	movzbl %ah,%ecx
   1d331:	48 8d 15 84 a4 fe ff 	lea    -0x15b7c(%rip),%rdx        # 77bc <__abi_tag+0x74c0>
   1d338:	44 0f b6 0c 4a       	movzbl (%rdx,%rcx,2),%r9d
   1d33d:	4d 89 d4             	mov    %r10,%r12
   1d340:	45 89 ca             	mov    %r9d,%r10d
   1d343:	45 01 ca             	add    %r9d,%r10d
   1d346:	0f b6 4c 4a 01       	movzbl 0x1(%rdx,%rcx,2),%ecx
   1d34b:	c1 e1 04             	shl    $0x4,%ecx
   1d34e:	c1 e8 04             	shr    $0x4,%eax
   1d351:	83 e0 0f             	and    $0xf,%eax
   1d354:	09 c8                	or     %ecx,%eax
   1d356:	31 f6                	xor    %esi,%esi
   1d358:	31 d2                	xor    %edx,%edx
   1d35a:	66 41 f7 f2          	div    %r10w
   1d35e:	4d 89 e2             	mov    %r12,%r10
   1d361:	41 c0 e1 04          	shl    $0x4,%r9b
   1d365:	41 0f b6 c9          	movzbl %r9b,%ecx
   1d369:	01 c1                	add    %eax,%ecx
   1d36b:	89 c8                	mov    %ecx,%eax
   1d36d:	66 f7 e1             	mul    %cx
   1d370:	0f 90 c2             	seto   %dl
   1d373:	66 44 39 c0          	cmp    %r8w,%ax
   1d377:	0f 97 c0             	seta   %al
   1d37a:	08 d0                	or     %dl,%al
   1d37c:	0f b6 c0             	movzbl %al,%eax
   1d37f:	29 c1                	sub    %eax,%ecx
   1d381:	44 0f b7 e1          	movzwl %cx,%r12d
   1d385:	d1 ef                	shr    $1,%edi
   1d387:	89 f9                	mov    %edi,%ecx
   1d389:	41 d3 ec             	shr    %cl,%r12d
   1d38c:	4c 89 e1             	mov    %r12,%rcx
   1d38f:	4c 89 e0             	mov    %r12,%rax
   1d392:	49 f7 e4             	mul    %r12
   1d395:	48 0f af ce          	imul   %rsi,%rcx
   1d399:	48 01 ca             	add    %rcx,%rdx
   1d39c:	48 01 ca             	add    %rcx,%rdx
   1d39f:	4c 31 d2             	xor    %r10,%rdx
   1d3a2:	48 31 e8             	xor    %rbp,%rax
   1d3a5:	31 ff                	xor    %edi,%edi
   1d3a7:	48 09 d0             	or     %rdx,%rax
   1d3aa:	40 0f 95 c7          	setne  %dil
   1d3ae:	4c 01 e7             	add    %r12,%rdi
   1d3b1:	48 89 f2             	mov    %rsi,%rdx
   1d3b4:	48 83 d2 00          	adc    $0x0,%rdx
   1d3b8:	4c 89 e0             	mov    %r12,%rax
   1d3bb:	48 09 f0             	or     %rsi,%rax
   1d3be:	74 58                	je     1d418 <<hyperinterval::ieee::Format>::sqrt+0x5b8>
   1d3c0:	48 0f bd c6          	bsr    %rsi,%rax
   1d3c4:	83 f0 3f             	xor    $0x3f,%eax
   1d3c7:	4d 0f bd c4          	bsr    %r12,%r8
   1d3cb:	41 83 f0 3f          	xor    $0x3f,%r8d
   1d3cf:	41 83 c8 40          	or     $0x40,%r8d
   1d3d3:	48 85 f6             	test   %rsi,%rsi
   1d3d6:	44 0f 45 c0          	cmovne %eax,%r8d
   1d3da:	41 83 f0 7f          	xor    $0x7f,%r8d
   1d3de:	47 8d 0c 18          	lea    (%r8,%r11,1),%r9d
   1d3e2:	45 39 f1             	cmp    %r14d,%r9d
   1d3e5:	7f 62                	jg     1d449 <<hyperinterval::ieee::Format>::sqrt+0x5e9>
   1d3e7:	b8 01 00 00 00       	mov    $0x1,%eax
   1d3ec:	44 29 f0             	sub    %r14d,%eax
   1d3ef:	41 39 c1             	cmp    %eax,%r9d
   1d3f2:	0f 8d 89 00 00 00    	jge    1d481 <<hyperinterval::ieee::Format>::sqrt+0x621>
   1d3f8:	41 8d 0c 1e          	lea    (%r14,%rbx,1),%ecx
   1d3fc:	fe c9                	dec    %cl
   1d3fe:	49 d3 e4             	shl    %cl,%r12
   1d401:	45 31 c0             	xor    %r8d,%r8d
   1d404:	f6 c1 40             	test   $0x40,%cl
   1d407:	4d 0f 44 c4          	cmove  %r12,%r8
   1d40b:	48 89 f8             	mov    %rdi,%rax
   1d40e:	48 09 d0             	or     %rdx,%rax
   1d411:	75 14                	jne    1d427 <<hyperinterval::ieee::Format>::sqrt+0x5c7>
   1d413:	e9 d2 00 00 00       	jmp    1d4ea <<hyperinterval::ieee::Format>::sqrt+0x68a>
   1d418:	45 31 c0             	xor    %r8d,%r8d
   1d41b:	48 89 f8             	mov    %rdi,%rax
   1d41e:	48 09 d0             	or     %rdx,%rax
   1d421:	0f 84 c3 00 00 00    	je     1d4ea <<hyperinterval::ieee::Format>::sqrt+0x68a>
   1d427:	48 0f bd c2          	bsr    %rdx,%rax
   1d42b:	83 f0 3f             	xor    $0x3f,%eax
   1d42e:	48 0f bd f7          	bsr    %rdi,%rsi
   1d432:	83 f6 3f             	xor    $0x3f,%esi
   1d435:	83 ce 40             	or     $0x40,%esi
   1d438:	48 85 d2             	test   %rdx,%rdx
   1d43b:	0f 45 f0             	cmovne %eax,%esi
   1d43e:	83 f6 7f             	xor    $0x7f,%esi
   1d441:	41 01 f3             	add    %esi,%r11d
   1d444:	45 39 f3             	cmp    %r14d,%r11d
   1d447:	7e 0c                	jle    1d455 <<hyperinterval::ieee::Format>::sqrt+0x5f5>
   1d449:	41 c6 47 01 05       	movb   $0x5,0x1(%r15)
   1d44e:	b0 01                	mov    $0x1,%al
   1d450:	e9 f9 00 00 00       	jmp    1d54e <<hyperinterval::ieee::Format>::sqrt+0x6ee>
   1d455:	b8 01 00 00 00       	mov    $0x1,%eax
   1d45a:	44 29 f0             	sub    %r14d,%eax
   1d45d:	41 39 c3             	cmp    %eax,%r11d
   1d460:	0f 8d 88 00 00 00    	jge    1d4ee <<hyperinterval::ieee::Format>::sqrt+0x68e>
   1d466:	41 01 de             	add    %ebx,%r14d
   1d469:	41 fe ce             	dec    %r14b
   1d46c:	44 89 f1             	mov    %r14d,%ecx
   1d46f:	48 d3 e7             	shl    %cl,%rdi
   1d472:	31 c0                	xor    %eax,%eax
   1d474:	41 f6 c6 40          	test   $0x40,%r14b
   1d478:	48 0f 44 c7          	cmove  %rdi,%rax
   1d47c:	e9 c3 00 00 00       	jmp    1d544 <<hyperinterval::ieee::Format>::sqrt+0x6e4>
   1d481:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1d486:	89 e9                	mov    %ebp,%ecx
   1d488:	44 29 c1             	sub    %r8d,%ecx
   1d48b:	89 c8                	mov    %ecx,%eax
   1d48d:	f7 d8                	neg    %eax
   1d48f:	4d 89 e2             	mov    %r12,%r10
   1d492:	49 d3 e2             	shl    %cl,%r10
   1d495:	4c 89 5c 24 08       	mov    %r11,0x8(%rsp)
   1d49a:	45 31 db             	xor    %r11d,%r11d
   1d49d:	f6 c1 40             	test   $0x40,%cl
   1d4a0:	4d 0f 44 da          	cmove  %r10,%r11
   1d4a4:	89 c1                	mov    %eax,%ecx
   1d4a6:	49 0f ad f4          	shrd   %cl,%rsi,%r12
   1d4aa:	48 d3 ee             	shr    %cl,%rsi
   1d4ad:	a8 40                	test   $0x40,%al
   1d4af:	49 0f 44 f4          	cmove  %r12,%rsi
   1d4b3:	44 39 c5             	cmp    %r8d,%ebp
   1d4b6:	49 0f 43 f3          	cmovae %r11,%rsi
   1d4ba:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
   1d4bf:	45 01 f1             	add    %r14d,%r9d
   1d4c2:	49 63 c1             	movslq %r9d,%rax
   1d4c5:	44 89 e9             	mov    %r13d,%ecx
   1d4c8:	48 d3 e0             	shl    %cl,%rax
   1d4cb:	49 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%r8
   1d4d2:	49 d3 e0             	shl    %cl,%r8
   1d4d5:	49 f7 d0             	not    %r8
   1d4d8:	49 21 f0             	and    %rsi,%r8
   1d4db:	49 09 c0             	or     %rax,%r8
   1d4de:	48 89 f8             	mov    %rdi,%rax
   1d4e1:	48 09 d0             	or     %rdx,%rax
   1d4e4:	0f 85 3d ff ff ff    	jne    1d427 <<hyperinterval::ieee::Format>::sqrt+0x5c7>
   1d4ea:	31 c0                	xor    %eax,%eax
   1d4ec:	eb 56                	jmp    1d544 <<hyperinterval::ieee::Format>::sqrt+0x6e4>
   1d4ee:	4c 89 db             	mov    %r11,%rbx
   1d4f1:	4c 8b 5c 24 10       	mov    0x10(%rsp),%r11
   1d4f6:	44 89 d9             	mov    %r11d,%ecx
   1d4f9:	29 f1                	sub    %esi,%ecx
   1d4fb:	89 c8                	mov    %ecx,%eax
   1d4fd:	f7 d8                	neg    %eax
   1d4ff:	49 89 f9             	mov    %rdi,%r9
   1d502:	49 d3 e1             	shl    %cl,%r9
   1d505:	45 31 d2             	xor    %r10d,%r10d
   1d508:	f6 c1 40             	test   $0x40,%cl
   1d50b:	4d 0f 44 d1          	cmove  %r9,%r10
   1d50f:	89 c1                	mov    %eax,%ecx
   1d511:	48 0f ad d7          	shrd   %cl,%rdx,%rdi
   1d515:	48 d3 ea             	shr    %cl,%rdx
   1d518:	a8 40                	test   $0x40,%al
   1d51a:	48 0f 44 d7          	cmove  %rdi,%rdx
   1d51e:	41 39 f3             	cmp    %esi,%r11d
   1d521:	49 0f 43 d2          	cmovae %r10,%rdx
   1d525:	44 01 f3             	add    %r14d,%ebx
   1d528:	48 63 f3             	movslq %ebx,%rsi
   1d52b:	44 89 e9             	mov    %r13d,%ecx
   1d52e:	48 d3 e6             	shl    %cl,%rsi
   1d531:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   1d538:	48 d3 e0             	shl    %cl,%rax
   1d53b:	48 f7 d0             	not    %rax
   1d53e:	48 21 d0             	and    %rdx,%rax
   1d541:	48 09 f0             	or     %rsi,%rax
   1d544:	4d 89 47 08          	mov    %r8,0x8(%r15)
   1d548:	49 89 47 10          	mov    %rax,0x10(%r15)
   1d54c:	31 c0                	xor    %eax,%eax
   1d54e:	41 88 07             	mov    %al,(%r15)
   1d551:	4c 89 f8             	mov    %r15,%rax
   1d554:	48 83 c4 38          	add    $0x38,%rsp
   1d558:	5b                   	pop    %rbx
   1d559:	41 5c                	pop    %r12
   1d55b:	41 5d                	pop    %r13
   1d55d:	41 5e                	pop    %r14
   1d55f:	41 5f                	pop    %r15
   1d561:	5d                   	pop    %rbp
   1d562:	c3                   	ret
   1d563:	cc                   	int3
   1d564:	cc                   	int3
   1d565:	cc                   	int3
   1d566:	cc                   	int3
   1d567:	cc                   	int3
   1d568:	cc                   	int3
   1d569:	cc                   	int3
   1d56a:	cc                   	int3
   1d56b:	cc                   	int3
   1d56c:	cc                   	int3
   1d56d:	cc                   	int3
   1d56e:	cc                   	int3
   1d56f:	cc                   	int3

<hyperinterval::ieee::Format>::power:
   1d570:	55                   	push   %rbp
   1d571:	41 57                	push   %r15
   1d573:	41 56                	push   %r14
   1d575:	41 55                	push   %r13
   1d577:	41 54                	push   %r12
   1d579:	53                   	push   %rbx
   1d57a:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
   1d581:	49 89 cb             	mov    %rcx,%r11
   1d584:	49 89 d6             	mov    %rdx,%r14
   1d587:	48 85 f1             	test   %rsi,%rcx
   1d58a:	41 0f 95 c1          	setne  %r9b
   1d58e:	b8 40 00 00 00       	mov    $0x40,%eax
   1d593:	f3 48 0f bc c2       	tzcnt  %rdx,%rax
   1d598:	41 89 c2             	mov    %eax,%r10d
   1d59b:	41 83 e2 3f          	and    $0x3f,%r10d
   1d59f:	44 89 d1             	mov    %r10d,%ecx
   1d5a2:	48 d3 ea             	shr    %cl,%rdx
   1d5a5:	48 89 d1             	mov    %rdx,%rcx
   1d5a8:	48 d1 e9             	shr    $1,%rcx
   1d5ab:	48 63 d9             	movslq %ecx,%rbx
   1d5ae:	44 89 d1             	mov    %r10d,%ecx
   1d5b1:	48 d3 e3             	shl    %cl,%rbx
   1d5b4:	45 85 c0             	test   %r8d,%r8d
   1d5b7:	0f 84 46 03 00 00    	je     1d903 <<hyperinterval::ieee::Format>::power+0x393>
   1d5bd:	44 88 4c 24 03       	mov    %r9b,0x3(%rsp)
   1d5c2:	48 89 7c 24 48       	mov    %rdi,0x48(%rsp)
   1d5c7:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1d5cd:	44 89 d1             	mov    %r10d,%ecx
   1d5d0:	49 d3 e1             	shl    %cl,%r9
   1d5d3:	48 8d 4e ff          	lea    -0x1(%rsi),%rcx
   1d5d7:	49 21 cb             	and    %rcx,%r11
   1d5da:	48 89 d9             	mov    %rbx,%rcx
   1d5dd:	4d 8d 79 ff          	lea    -0x1(%r9),%r15
   1d5e1:	8d 2c 42             	lea    (%rdx,%rax,2),%ebp
   1d5e4:	83 e5 fe             	and    $0xfffffffe,%ebp
   1d5e7:	ba 02 00 00 00       	mov    $0x2,%edx
   1d5ec:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1d5f1:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1d5f6:	44 89 44 24 68       	mov    %r8d,0x68(%rsp)
   1d5fb:	44 89 c3             	mov    %r8d,%ebx
   1d5fe:	4c 89 5c 24 58       	mov    %r11,0x58(%rsp)
   1d603:	4c 89 5c 24 60       	mov    %r11,0x60(%rsp)
   1d608:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
   1d60d:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   1d612:	4c 89 8c 24 80 00 00 	mov    %r9,0x80(%rsp)
   1d619:	00 
   1d61a:	4c 89 54 24 78       	mov    %r10,0x78(%rsp)
   1d61f:	4c 89 7c 24 70       	mov    %r15,0x70(%rsp)
   1d624:	89 6c 24 6c          	mov    %ebp,0x6c(%rsp)
   1d628:	f6 c3 01             	test   $0x1,%bl
   1d62b:	0f 84 a4 01 00 00    	je     1d7d5 <<hyperinterval::ieee::Format>::power+0x265>
   1d631:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   1d638:	0f 1f 84 00 00 00 00 
   1d63f:	00 
   1d640:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
   1d644:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1d649:	48 89 d0             	mov    %rdx,%rax
   1d64c:	4c 21 f0             	and    %r14,%rax
   1d64f:	44 89 d1             	mov    %r10d,%ecx
   1d652:	48 d3 e8             	shr    %cl,%rax
   1d655:	48 89 d1             	mov    %rdx,%rcx
   1d658:	4c 21 f9             	and    %r15,%rcx
   1d65b:	48 85 c0             	test   %rax,%rax
   1d65e:	41 89 c3             	mov    %eax,%r11d
   1d661:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1d667:	45 0f 44 d8          	cmove  %r8d,%r11d
   1d66b:	49 0f 45 c1          	cmovne %r9,%rax
   1d66f:	48 09 c8             	or     %rcx,%rax
   1d672:	48 85 f2             	test   %rsi,%rdx
   1d675:	0f 95 44 24 08       	setne  0x8(%rsp)
   1d67a:	4c 8b 6c 24 60       	mov    0x60(%rsp),%r13
   1d67f:	4c 89 eb             	mov    %r13,%rbx
   1d682:	4c 21 f3             	and    %r14,%rbx
   1d685:	44 89 d1             	mov    %r10d,%ecx
   1d688:	48 d3 eb             	shr    %cl,%rbx
   1d68b:	4c 89 e9             	mov    %r13,%rcx
   1d68e:	4c 21 f9             	and    %r15,%rcx
   1d691:	48 85 db             	test   %rbx,%rbx
   1d694:	41 89 d8             	mov    %ebx,%r8d
   1d697:	ba 01 00 00 00       	mov    $0x1,%edx
   1d69c:	44 0f 44 c2          	cmove  %edx,%r8d
   1d6a0:	49 0f 45 d9          	cmovne %r9,%rbx
   1d6a4:	48 09 cb             	or     %rcx,%rbx
   1d6a7:	49 85 f5             	test   %rsi,%r13
   1d6aa:	0f 95 c1             	setne  %cl
   1d6ad:	32 4c 24 08          	xor    0x8(%rsp),%cl
   1d6b1:	48 f7 e3             	mul    %rbx
   1d6b4:	41 29 e8             	sub    %ebp,%r8d
   1d6b7:	45 01 d8             	add    %r11d,%r8d
   1d6ba:	88 4c 24 24          	mov    %cl,0x24(%rsp)
   1d6be:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1d6c3:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1d6c8:	44 89 44 24 20       	mov    %r8d,0x20(%rsp)
   1d6cd:	4c 89 f2             	mov    %r14,%rdx
   1d6d0:	4c 89 e1             	mov    %r12,%rcx
   1d6d3:	49 89 fd             	mov    %rdi,%r13
   1d6d6:	4d 89 cc             	mov    %r9,%r12
   1d6d9:	48 89 f3             	mov    %rsi,%rbx
   1d6dc:	4c 89 f5             	mov    %r14,%rbp
   1d6df:	4d 89 d6             	mov    %r10,%r14
   1d6e2:	e8 79 06 00 00       	call   1dd60 <<hyperinterval::ieee::Format>::rounded>
   1d6e7:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   1d6ec:	0f 85 00 02 00 00    	jne    1d8f2 <<hyperinterval::ieee::Format>::power+0x382>
   1d6f2:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
   1d6f7:	48 89 d0             	mov    %rdx,%rax
   1d6fa:	48 21 e8             	and    %rbp,%rax
   1d6fd:	44 89 f1             	mov    %r14d,%ecx
   1d700:	48 d3 e8             	shr    %cl,%rax
   1d703:	48 89 d1             	mov    %rdx,%rcx
   1d706:	4c 21 f9             	and    %r15,%rcx
   1d709:	48 85 c0             	test   %rax,%rax
   1d70c:	89 c6                	mov    %eax,%esi
   1d70e:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1d714:	41 0f 44 f2          	cmove  %r10d,%esi
   1d718:	49 0f 45 c4          	cmovne %r12,%rax
   1d71c:	48 09 c8             	or     %rcx,%rax
   1d71f:	48 85 da             	test   %rbx,%rdx
   1d722:	0f 95 c2             	setne  %dl
   1d725:	4c 8b 4c 24 58       	mov    0x58(%rsp),%r9
   1d72a:	4c 89 cf             	mov    %r9,%rdi
   1d72d:	48 21 ef             	and    %rbp,%rdi
   1d730:	44 89 f1             	mov    %r14d,%ecx
   1d733:	48 d3 ef             	shr    %cl,%rdi
   1d736:	4c 89 c9             	mov    %r9,%rcx
   1d739:	4c 21 f9             	and    %r15,%rcx
   1d73c:	48 85 ff             	test   %rdi,%rdi
   1d73f:	41 89 f8             	mov    %edi,%r8d
   1d742:	45 0f 44 c2          	cmove  %r10d,%r8d
   1d746:	49 0f 45 fc          	cmovne %r12,%rdi
   1d74a:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
   1d74f:	4c 89 54 24 08       	mov    %r10,0x8(%rsp)
   1d754:	48 09 cf             	or     %rcx,%rdi
   1d757:	49 85 d9             	test   %rbx,%r9
   1d75a:	0f 95 c1             	setne  %cl
   1d75d:	30 d1                	xor    %dl,%cl
   1d75f:	48 f7 e7             	mul    %rdi
   1d762:	4d 89 ef             	mov    %r13,%r15
   1d765:	44 8b 6c 24 6c       	mov    0x6c(%rsp),%r13d
   1d76a:	45 29 e8             	sub    %r13d,%r8d
   1d76d:	41 01 f0             	add    %esi,%r8d
   1d770:	88 4c 24 24          	mov    %cl,0x24(%rsp)
   1d774:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1d779:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1d77e:	44 89 44 24 20       	mov    %r8d,0x20(%rsp)
   1d783:	4c 89 ff             	mov    %r15,%rdi
   1d786:	48 89 de             	mov    %rbx,%rsi
   1d789:	48 89 ea             	mov    %rbp,%rdx
   1d78c:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1d791:	4c 89 e1             	mov    %r12,%rcx
   1d794:	e8 c7 05 00 00       	call   1dd60 <<hyperinterval::ieee::Format>::rounded>
   1d799:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   1d79e:	0f 84 4e 01 00 00    	je     1d8f2 <<hyperinterval::ieee::Format>::power+0x382>
   1d7a4:	48 89 de             	mov    %rbx,%rsi
   1d7a7:	49 89 ee             	mov    %rbp,%r14
   1d7aa:	44 89 ed             	mov    %r13d,%ebp
   1d7ad:	4c 89 ff             	mov    %r15,%rdi
   1d7b0:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1d7b5:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1d7ba:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1d7c1:	00 
   1d7c2:	4c 8b 54 24 78       	mov    0x78(%rsp),%r10
   1d7c7:	4c 8b 7c 24 70       	mov    0x70(%rsp),%r15
   1d7cc:	ba 02 00 00 00       	mov    $0x2,%edx
   1d7d1:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
   1d7d5:	d1 eb                	shr    $1,%ebx
   1d7d7:	0f 84 6c 01 00 00    	je     1d949 <<hyperinterval::ieee::Format>::power+0x3d9>
   1d7dd:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
   1d7e1:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   1d7e6:	4c 89 c0             	mov    %r8,%rax
   1d7e9:	4c 21 f0             	and    %r14,%rax
   1d7ec:	44 89 d1             	mov    %r10d,%ecx
   1d7ef:	48 d3 e8             	shr    %cl,%rax
   1d7f2:	4d 21 f8             	and    %r15,%r8
   1d7f5:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
   1d7f8:	48 85 c0             	test   %rax,%rax
   1d7fb:	49 0f 45 c1          	cmovne %r9,%rax
   1d7ff:	0f 44 ca             	cmove  %edx,%ecx
   1d802:	4c 09 c0             	or     %r8,%rax
   1d805:	48 f7 e0             	mul    %rax
   1d808:	29 e9                	sub    %ebp,%ecx
   1d80a:	c6 44 24 24 00       	movb   $0x0,0x24(%rsp)
   1d80f:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1d814:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1d819:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   1d81d:	4c 89 f2             	mov    %r14,%rdx
   1d820:	4c 89 e1             	mov    %r12,%rcx
   1d823:	41 89 ed             	mov    %ebp,%r13d
   1d826:	4d 89 cc             	mov    %r9,%r12
   1d829:	4c 89 fb             	mov    %r15,%rbx
   1d82c:	49 89 f7             	mov    %rsi,%r15
   1d82f:	4c 89 f5             	mov    %r14,%rbp
   1d832:	4d 89 d6             	mov    %r10,%r14
   1d835:	e8 26 05 00 00       	call   1dd60 <<hyperinterval::ieee::Format>::rounded>
   1d83a:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   1d83f:	0f 85 ad 00 00 00    	jne    1d8f2 <<hyperinterval::ieee::Format>::power+0x382>
   1d845:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
   1d84a:	48 89 d0             	mov    %rdx,%rax
   1d84d:	48 21 e8             	and    %rbp,%rax
   1d850:	44 89 f1             	mov    %r14d,%ecx
   1d853:	48 d3 e8             	shr    %cl,%rax
   1d856:	48 21 da             	and    %rbx,%rdx
   1d859:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
   1d85c:	48 85 c0             	test   %rax,%rax
   1d85f:	49 0f 45 c4          	cmovne %r12,%rax
   1d863:	be 02 00 00 00       	mov    $0x2,%esi
   1d868:	0f 44 ce             	cmove  %esi,%ecx
   1d86b:	48 09 d0             	or     %rdx,%rax
   1d86e:	48 f7 e0             	mul    %rax
   1d871:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
   1d876:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   1d87b:	44 29 e9             	sub    %r13d,%ecx
   1d87e:	c6 44 24 24 00       	movb   $0x0,0x24(%rsp)
   1d883:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1d888:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1d88d:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   1d891:	48 8d 5c 24 30       	lea    0x30(%rsp),%rbx
   1d896:	48 89 df             	mov    %rbx,%rdi
   1d899:	4c 89 fe             	mov    %r15,%rsi
   1d89c:	48 89 ea             	mov    %rbp,%rdx
   1d89f:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1d8a4:	4c 89 e1             	mov    %r12,%rcx
   1d8a7:	e8 b4 04 00 00       	call   1dd60 <<hyperinterval::ieee::Format>::rounded>
   1d8ac:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   1d8b1:	ba 02 00 00 00       	mov    $0x2,%edx
   1d8b6:	74 3a                	je     1d8f2 <<hyperinterval::ieee::Format>::power+0x382>
   1d8b8:	4c 89 fe             	mov    %r15,%rsi
   1d8bb:	49 89 ee             	mov    %rbp,%r14
   1d8be:	44 89 ed             	mov    %r13d,%ebp
   1d8c1:	48 89 df             	mov    %rbx,%rdi
   1d8c4:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1d8c9:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1d8ce:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1d8d5:	00 
   1d8d6:	4c 8b 54 24 78       	mov    0x78(%rsp),%r10
   1d8db:	4c 8b 7c 24 70       	mov    0x70(%rsp),%r15
   1d8e0:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
   1d8e4:	f6 c3 01             	test   $0x1,%bl
   1d8e7:	0f 85 53 fd ff ff    	jne    1d640 <<hyperinterval::ieee::Format>::power+0xd0>
   1d8ed:	e9 e3 fe ff ff       	jmp    1d7d5 <<hyperinterval::ieee::Format>::power+0x265>
   1d8f2:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   1d8f7:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
   1d8fc:	88 47 01             	mov    %al,0x1(%rdi)
   1d8ff:	b0 01                	mov    $0x1,%al
   1d901:	eb 2f                	jmp    1d932 <<hyperinterval::ieee::Format>::power+0x3c2>
   1d903:	48 89 d9             	mov    %rbx,%rcx
   1d906:	45 20 c1             	and    %r8b,%r9b
   1d909:	74 1d                	je     1d928 <<hyperinterval::ieee::Format>::power+0x3b8>
   1d90b:	48 89 d8             	mov    %rbx,%rax
   1d90e:	48 31 f0             	xor    %rsi,%rax
   1d911:	48 85 db             	test   %rbx,%rbx
   1d914:	48 0f 44 c3          	cmove  %rbx,%rax
   1d918:	48 31 ce             	xor    %rcx,%rsi
   1d91b:	48 85 c9             	test   %rcx,%rcx
   1d91e:	48 0f 44 f1          	cmove  %rcx,%rsi
   1d922:	48 89 c1             	mov    %rax,%rcx
   1d925:	48 89 f3             	mov    %rsi,%rbx
   1d928:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1d92c:	48 89 5f 10          	mov    %rbx,0x10(%rdi)
   1d930:	31 c0                	xor    %eax,%eax
   1d932:	88 07                	mov    %al,(%rdi)
   1d934:	48 89 f8             	mov    %rdi,%rax
   1d937:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
   1d93e:	5b                   	pop    %rbx
   1d93f:	41 5c                	pop    %r12
   1d941:	41 5d                	pop    %r13
   1d943:	41 5e                	pop    %r14
   1d945:	41 5f                	pop    %r15
   1d947:	5d                   	pop    %rbp
   1d948:	c3                   	ret
   1d949:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
   1d94e:	44 8b 44 24 68       	mov    0x68(%rsp),%r8d
   1d953:	44 0f b6 4c 24 03    	movzbl 0x3(%rsp),%r9d
   1d959:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
   1d95e:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1d963:	45 20 c1             	and    %r8b,%r9b
   1d966:	75 a3                	jne    1d90b <<hyperinterval::ieee::Format>::power+0x39b>
   1d968:	eb be                	jmp    1d928 <<hyperinterval::ieee::Format>::power+0x3b8>
   1d96a:	cc                   	int3
   1d96b:	cc                   	int3
   1d96c:	cc                   	int3
   1d96d:	cc                   	int3
   1d96e:	cc                   	int3
   1d96f:	cc                   	int3

<hyperinterval::ieee::Format>::affine:
   1d970:	55                   	push   %rbp
   1d971:	41 57                	push   %r15
   1d973:	41 56                	push   %r14
   1d975:	41 55                	push   %r13
   1d977:	41 54                	push   %r12
   1d979:	53                   	push   %rbx
   1d97a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   1d981:	48 89 c8             	mov    %rcx,%rax
   1d984:	49 89 d6             	mov    %rdx,%r14
   1d987:	b9 40 00 00 00       	mov    $0x40,%ecx
   1d98c:	f3 48 0f bc ca       	tzcnt  %rdx,%rcx
   1d991:	48 89 c2             	mov    %rax,%rdx
   1d994:	4c 21 f2             	and    %r14,%rdx
   1d997:	48 d3 ea             	shr    %cl,%rdx
   1d99a:	41 bb 01 00 00 00    	mov    $0x1,%r11d
   1d9a0:	49 d3 e3             	shl    %cl,%r11
   1d9a3:	4d 8d 7b ff          	lea    -0x1(%r11),%r15
   1d9a7:	4c 89 fb             	mov    %r15,%rbx
   1d9aa:	48 21 c3             	and    %rax,%rbx
   1d9ad:	48 85 d2             	test   %rdx,%rdx
   1d9b0:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1d9b6:	89 d5                	mov    %edx,%ebp
   1d9b8:	41 0f 44 ea          	cmove  %r10d,%ebp
   1d9bc:	48 89 3c 24          	mov    %rdi,(%rsp)
   1d9c0:	49 0f 45 d3          	cmovne %r11,%rdx
   1d9c4:	4d 89 f5             	mov    %r14,%r13
   1d9c7:	49 d3 ed             	shr    %cl,%r13
   1d9ca:	48 09 da             	or     %rbx,%rdx
   1d9cd:	49 d1 ed             	shr    $1,%r13
   1d9d0:	41 01 cd             	add    %ecx,%r13d
   1d9d3:	44 29 ed             	sub    %r13d,%ebp
   1d9d6:	48 85 f0             	test   %rsi,%rax
   1d9d9:	0f 95 c3             	setne  %bl
   1d9dc:	4c 89 c0             	mov    %r8,%rax
   1d9df:	4c 21 f0             	and    %r14,%rax
   1d9e2:	48 d3 e8             	shr    %cl,%rax
   1d9e5:	4d 89 fc             	mov    %r15,%r12
   1d9e8:	4d 21 c4             	and    %r8,%r12
   1d9eb:	48 85 c0             	test   %rax,%rax
   1d9ee:	89 c7                	mov    %eax,%edi
   1d9f0:	41 0f 44 fa          	cmove  %r10d,%edi
   1d9f4:	49 0f 45 c3          	cmovne %r11,%rax
   1d9f8:	4c 09 e0             	or     %r12,%rax
   1d9fb:	44 29 ef             	sub    %r13d,%edi
   1d9fe:	49 85 f0             	test   %rsi,%r8
   1da01:	41 0f 95 c0          	setne  %r8b
   1da05:	01 ef                	add    %ebp,%edi
   1da07:	4c 89 f5             	mov    %r14,%rbp
   1da0a:	4d 89 cc             	mov    %r9,%r12
   1da0d:	4d 21 f4             	and    %r14,%r12
   1da10:	49 d3 ec             	shr    %cl,%r12
   1da13:	41 30 d8             	xor    %bl,%r8b
   1da16:	48 f7 e2             	mul    %rdx
   1da19:	4d 21 cf             	and    %r9,%r15
   1da1c:	4d 85 e4             	test   %r12,%r12
   1da1f:	45 0f 45 d4          	cmovne %r12d,%r10d
   1da23:	4d 0f 45 e3          	cmovne %r11,%r12
   1da27:	4d 09 fc             	or     %r15,%r12
   1da2a:	45 29 ea             	sub    %r13d,%r10d
   1da2d:	49 85 f1             	test   %rsi,%r9
   1da30:	0f 95 84 24 84 00 00 	setne  0x84(%rsp)
   1da37:	00 
   1da38:	0f 95 c3             	setne  %bl
   1da3b:	48 89 c1             	mov    %rax,%rcx
   1da3e:	48 09 d1             	or     %rdx,%rcx
   1da41:	44 88 44 24 64       	mov    %r8b,0x64(%rsp)
   1da46:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   1da4b:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1da50:	89 7c 24 60          	mov    %edi,0x60(%rsp)
   1da54:	4c 89 64 24 70       	mov    %r12,0x70(%rsp)
   1da59:	48 c7 44 24 78 00 00 	movq   $0x0,0x78(%rsp)
   1da60:	00 00 
   1da62:	44 89 94 24 80 00 00 	mov    %r10d,0x80(%rsp)
   1da69:	00 
   1da6a:	74 79                	je     1dae5 <<hyperinterval::ieee::Format>::affine+0x175>
   1da6c:	4d 85 e4             	test   %r12,%r12
   1da6f:	74 7b                	je     1daec <<hyperinterval::ieee::Format>::affine+0x17c>
   1da71:	48 89 6c 24 30       	mov    %rbp,0x30(%rsp)
   1da76:	48 0f bd ca          	bsr    %rdx,%rcx
   1da7a:	83 f1 3f             	xor    $0x3f,%ecx
   1da7d:	4c 0f bd d8          	bsr    %rax,%r11
   1da81:	41 83 f3 3f          	xor    $0x3f,%r11d
   1da85:	41 83 cb 40          	or     $0x40,%r11d
   1da89:	48 85 d2             	test   %rdx,%rdx
   1da8c:	44 0f 45 d9          	cmovne %ecx,%r11d
   1da90:	41 83 f3 7f          	xor    $0x7f,%r11d
   1da94:	41 01 fb             	add    %edi,%r11d
   1da97:	4d 0f bd fc          	bsr    %r12,%r15
   1da9b:	41 83 f7 3f          	xor    $0x3f,%r15d
   1da9f:	41 83 cf 40          	or     $0x40,%r15d
   1daa3:	41 83 f7 7f          	xor    $0x7f,%r15d
   1daa7:	45 01 d7             	add    %r10d,%r15d
   1daaa:	45 39 df             	cmp    %r11d,%r15d
   1daad:	45 0f 4e fb          	cmovle %r11d,%r15d
   1dab1:	41 83 c7 82          	add    $0xffffff82,%r15d
   1dab5:	44 29 ff             	sub    %r15d,%edi
   1dab8:	78 4b                	js     1db05 <<hyperinterval::ieee::Format>::affine+0x195>
   1daba:	89 f9                	mov    %edi,%ecx
   1dabc:	48 0f a5 c2          	shld   %cl,%rax,%rdx
   1dac0:	48 d3 e0             	shl    %cl,%rax
   1dac3:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   1daca:	00 00 
   1dacc:	40 f6 c7 40          	test   $0x40,%dil
   1dad0:	48 0f 45 d0          	cmovne %rax,%rdx
   1dad4:	bd 00 00 00 00       	mov    $0x0,%ebp
   1dad9:	48 0f 44 e8          	cmove  %rax,%rbp
   1dadd:	49 89 d3             	mov    %rdx,%r11
   1dae0:	e9 9b 00 00 00       	jmp    1db80 <<hyperinterval::ieee::Format>::affine+0x210>
   1dae5:	48 8d 4c 24 70       	lea    0x70(%rsp),%rcx
   1daea:	eb 05                	jmp    1daf1 <<hyperinterval::ieee::Format>::affine+0x181>
   1daec:	48 8d 4c 24 50       	lea    0x50(%rsp),%rcx
   1daf1:	4c 8b 34 24          	mov    (%rsp),%r14
   1daf5:	4c 89 f7             	mov    %r14,%rdi
   1daf8:	48 89 ea             	mov    %rbp,%rdx
   1dafb:	e8 60 02 00 00       	call   1dd60 <<hyperinterval::ieee::Format>::rounded>
   1db00:	e9 43 02 00 00       	jmp    1dd48 <<hyperinterval::ieee::Format>::affine+0x3d8>
   1db05:	f7 df                	neg    %edi
   1db07:	bd 00 00 00 00       	mov    $0x0,%ebp
   1db0c:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   1db12:	83 ff 7f             	cmp    $0x7f,%edi
   1db15:	7f 5b                	jg     1db72 <<hyperinterval::ieee::Format>::affine+0x202>
   1db17:	48 89 c5             	mov    %rax,%rbp
   1db1a:	89 f9                	mov    %edi,%ecx
   1db1c:	48 0f ad d5          	shrd   %cl,%rdx,%rbp
   1db20:	49 89 d3             	mov    %rdx,%r11
   1db23:	49 d3 eb             	shr    %cl,%r11
   1db26:	41 89 dd             	mov    %ebx,%r13d
   1db29:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
   1db30:	48 d3 e3             	shl    %cl,%rbx
   1db33:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
   1db3a:	40 f6 c7 40          	test   $0x40,%dil
   1db3e:	49 0f 45 eb          	cmovne %r11,%rbp
   1db42:	41 be 00 00 00 00    	mov    $0x0,%r14d
   1db48:	4d 0f 45 de          	cmovne %r14,%r11
   1db4c:	48 0f 45 cb          	cmovne %rbx,%rcx
   1db50:	bf 00 00 00 00       	mov    $0x0,%edi
   1db55:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
   1db5a:	49 0f 45 de          	cmovne %r14,%rbx
   1db5e:	48 f7 d3             	not    %rbx
   1db61:	48 f7 d1             	not    %rcx
   1db64:	48 21 d1             	and    %rdx,%rcx
   1db67:	48 21 c3             	and    %rax,%rbx
   1db6a:	48 09 cb             	or     %rcx,%rbx
   1db6d:	44 89 eb             	mov    %r13d,%ebx
   1db70:	74 0e                	je     1db80 <<hyperinterval::ieee::Format>::affine+0x210>
   1db72:	41 0f b6 c0          	movzbl %r8b,%eax
   1db76:	f7 d8                	neg    %eax
   1db78:	83 c8 01             	or     $0x1,%eax
   1db7b:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
   1db80:	45 29 fa             	sub    %r15d,%r10d
   1db83:	78 20                	js     1dba5 <<hyperinterval::ieee::Format>::affine+0x235>
   1db85:	31 d2                	xor    %edx,%edx
   1db87:	44 89 d1             	mov    %r10d,%ecx
   1db8a:	4c 0f a5 e2          	shld   %cl,%r12,%rdx
   1db8e:	49 d3 e4             	shl    %cl,%r12
   1db91:	45 31 ed             	xor    %r13d,%r13d
   1db94:	41 f6 c2 40          	test   $0x40,%r10b
   1db98:	49 0f 45 d4          	cmovne %r12,%rdx
   1db9c:	4d 0f 45 e5          	cmovne %r13,%r12
   1dba0:	4c 89 e0             	mov    %r12,%rax
   1dba3:	eb 58                	jmp    1dbfd <<hyperinterval::ieee::Format>::affine+0x28d>
   1dba5:	41 f7 da             	neg    %r10d
   1dba8:	45 31 ed             	xor    %r13d,%r13d
   1dbab:	b8 00 00 00 00       	mov    $0x0,%eax
   1dbb0:	41 83 fa 7f          	cmp    $0x7f,%r10d
   1dbb4:	7f 2d                	jg     1dbe3 <<hyperinterval::ieee::Format>::affine+0x273>
   1dbb6:	4c 89 e0             	mov    %r12,%rax
   1dbb9:	44 89 d1             	mov    %r10d,%ecx
   1dbbc:	4c 0f ad e8          	shrd   %cl,%r13,%rax
   1dbc0:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
   1dbc7:	48 d3 e7             	shl    %cl,%rdi
   1dbca:	41 f6 c2 40          	test   $0x40,%r10b
   1dbce:	49 0f 45 c5          	cmovne %r13,%rax
   1dbd2:	49 0f 45 fd          	cmovne %r13,%rdi
   1dbd6:	48 f7 d7             	not    %rdi
   1dbd9:	ba 00 00 00 00       	mov    $0x0,%edx
   1dbde:	4c 85 e7             	test   %r12,%rdi
   1dbe1:	74 1a                	je     1dbfd <<hyperinterval::ieee::Format>::affine+0x28d>
   1dbe3:	4c 89 ea             	mov    %r13,%rdx
   1dbe6:	4c 89 c9             	mov    %r9,%rcx
   1dbe9:	48 21 f1             	and    %rsi,%rcx
   1dbec:	31 ff                	xor    %edi,%edi
   1dbee:	48 f7 d9             	neg    %rcx
   1dbf1:	40 0f 93 c7          	setae  %dil
   1dbf5:	44 8d 2c 7d ff ff ff 	lea    -0x1(,%rdi,2),%r13d
   1dbfc:	ff 
   1dbfd:	49 85 f1             	test   %rsi,%r9
   1dc00:	0f 95 c1             	setne  %cl
   1dc03:	41 38 c8             	cmp    %cl,%r8b
   1dc06:	74 16                	je     1dc1e <<hyperinterval::ieee::Format>::affine+0x2ae>
   1dc08:	48 39 c5             	cmp    %rax,%rbp
   1dc0b:	4c 89 d9             	mov    %r11,%rcx
   1dc0e:	48 19 d1             	sbb    %rdx,%rcx
   1dc11:	73 13                	jae    1dc26 <<hyperinterval::ieee::Format>::affine+0x2b6>
   1dc13:	48 29 e8             	sub    %rbp,%rax
   1dc16:	4c 19 da             	sbb    %r11,%rdx
   1dc19:	41 89 d8             	mov    %ebx,%r8d
   1dc1c:	eb 14                	jmp    1dc32 <<hyperinterval::ieee::Format>::affine+0x2c2>
   1dc1e:	48 01 e8             	add    %rbp,%rax
   1dc21:	4c 11 da             	adc    %r11,%rdx
   1dc24:	eb 0c                	jmp    1dc32 <<hyperinterval::ieee::Format>::affine+0x2c2>
   1dc26:	48 29 c5             	sub    %rax,%rbp
   1dc29:	49 19 d3             	sbb    %rdx,%r11
   1dc2c:	48 89 e8             	mov    %rbp,%rax
   1dc2f:	4c 89 da             	mov    %r11,%rdx
   1dc32:	44 88 44 24 24       	mov    %r8b,0x24(%rsp)
   1dc37:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1dc3c:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1dc41:	44 89 7c 24 20       	mov    %r15d,0x20(%rsp)
   1dc46:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1dc4b:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1dc50:	49 89 f4             	mov    %rsi,%r12
   1dc53:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
   1dc58:	48 89 da             	mov    %rbx,%rdx
   1dc5b:	e8 00 01 00 00       	call   1dd60 <<hyperinterval::ieee::Format>::rounded>
   1dc60:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   1dc65:	75 16                	jne    1dc7d <<hyperinterval::ieee::Format>::affine+0x30d>
   1dc67:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
   1dc6c:	4c 8b 34 24          	mov    (%rsp),%r14
   1dc70:	41 88 46 01          	mov    %al,0x1(%r14)
   1dc74:	41 c6 06 01          	movb   $0x1,(%r14)
   1dc78:	e9 cb 00 00 00       	jmp    1dd48 <<hyperinterval::ieee::Format>::affine+0x3d8>
   1dc7d:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
   1dc82:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
   1dc87:	49 39 c7             	cmp    %rax,%r15
   1dc8a:	0f 85 a8 00 00 00    	jne    1dd38 <<hyperinterval::ieee::Format>::affine+0x3c8>
   1dc90:	44 03 6c 24 08       	add    0x8(%rsp),%r13d
   1dc95:	41 83 fd 01          	cmp    $0x1,%r13d
   1dc99:	74 60                	je     1dcfb <<hyperinterval::ieee::Format>::affine+0x38b>
   1dc9b:	41 83 fd ff          	cmp    $0xffffffff,%r13d
   1dc9f:	0f 85 93 00 00 00    	jne    1dd38 <<hyperinterval::ieee::Format>::affine+0x3c8>
   1dca5:	4c 89 f8             	mov    %r15,%rax
   1dca8:	4c 89 e6             	mov    %r12,%rsi
   1dcab:	4c 31 e0             	xor    %r12,%rax
   1dcae:	4d 85 ff             	test   %r15,%r15
   1dcb1:	49 0f 44 c7          	cmove  %r15,%rax
   1dcb5:	48 89 c1             	mov    %rax,%rcx
   1dcb8:	4c 21 e1             	and    %r12,%rcx
   1dcbb:	31 d2                	xor    %edx,%edx
   1dcbd:	48 f7 d9             	neg    %rcx
   1dcc0:	0f 93 c2             	setae  %dl
   1dcc3:	48 8d 0c 50          	lea    (%rax,%rdx,2),%rcx
   1dcc7:	48 ff c9             	dec    %rcx
   1dcca:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1dccf:	48 89 da             	mov    %rbx,%rdx
   1dcd2:	e8 89 e9 ff ff       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1dcd7:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1dcdc:	75 49                	jne    1dd27 <<hyperinterval::ieee::Format>::affine+0x3b7>
   1dcde:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1dce3:	49 31 c4             	xor    %rax,%r12
   1dce6:	48 85 c0             	test   %rax,%rax
   1dce9:	4c 0f 44 e0          	cmove  %rax,%r12
   1dced:	4c 8b 34 24          	mov    (%rsp),%r14
   1dcf1:	4d 89 66 08          	mov    %r12,0x8(%r14)
   1dcf5:	4d 89 7e 10          	mov    %r15,0x10(%r14)
   1dcf9:	eb 49                	jmp    1dd44 <<hyperinterval::ieee::Format>::affine+0x3d4>
   1dcfb:	4c 89 e6             	mov    %r12,%rsi
   1dcfe:	4c 89 f8             	mov    %r15,%rax
   1dd01:	4c 21 e0             	and    %r12,%rax
   1dd04:	31 c9                	xor    %ecx,%ecx
   1dd06:	48 f7 d8             	neg    %rax
   1dd09:	0f 93 c1             	setae  %cl
   1dd0c:	49 8d 0c 4f          	lea    (%r15,%rcx,2),%rcx
   1dd10:	48 ff c9             	dec    %rcx
   1dd13:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1dd18:	48 89 da             	mov    %rbx,%rdx
   1dd1b:	e8 40 e9 ff ff       	call   1c660 <<hyperinterval::ieee::Format>::finite>
   1dd20:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1dd25:	74 0c                	je     1dd33 <<hyperinterval::ieee::Format>::affine+0x3c3>
   1dd27:	4c 8b 34 24          	mov    (%rsp),%r14
   1dd2b:	66 41 c7 06 01 05    	movw   $0x501,(%r14)
   1dd31:	eb 15                	jmp    1dd48 <<hyperinterval::ieee::Format>::affine+0x3d8>
   1dd33:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1dd38:	4c 8b 34 24          	mov    (%rsp),%r14
   1dd3c:	4d 89 7e 08          	mov    %r15,0x8(%r14)
   1dd40:	49 89 46 10          	mov    %rax,0x10(%r14)
   1dd44:	41 c6 06 00          	movb   $0x0,(%r14)
   1dd48:	4c 89 f0             	mov    %r14,%rax
   1dd4b:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1dd52:	5b                   	pop    %rbx
   1dd53:	41 5c                	pop    %r12
   1dd55:	41 5d                	pop    %r13
   1dd57:	41 5e                	pop    %r14
   1dd59:	41 5f                	pop    %r15
   1dd5b:	5d                   	pop    %rbp
   1dd5c:	c3                   	ret
   1dd5d:	cc                   	int3
   1dd5e:	cc                   	int3
   1dd5f:	cc                   	int3

<hyperinterval::ieee::Format>::rounded:
   1dd60:	48 89 c8             	mov    %rcx,%rax
   1dd63:	4c 8b 11             	mov    (%rcx),%r10
   1dd66:	4c 8b 59 08          	mov    0x8(%rcx),%r11
   1dd6a:	4c 89 d1             	mov    %r10,%rcx
   1dd6d:	4c 09 d9             	or     %r11,%rcx
   1dd70:	0f 84 f6 00 00 00    	je     1de6c <<hyperinterval::ieee::Format>::rounded+0x10c>
   1dd76:	55                   	push   %rbp
   1dd77:	41 57                	push   %r15
   1dd79:	41 56                	push   %r14
   1dd7b:	41 55                	push   %r13
   1dd7d:	41 54                	push   %r12
   1dd7f:	53                   	push   %rbx
   1dd80:	8b 68 10             	mov    0x10(%rax),%ebp
   1dd83:	49 0f bd cb          	bsr    %r11,%rcx
   1dd87:	83 f1 3f             	xor    $0x3f,%ecx
   1dd8a:	4d 0f bd f2          	bsr    %r10,%r14
   1dd8e:	41 83 f6 3f          	xor    $0x3f,%r14d
   1dd92:	41 83 ce 40          	or     $0x40,%r14d
   1dd96:	4d 85 db             	test   %r11,%r11
   1dd99:	44 0f 45 f1          	cmovne %ecx,%r14d
   1dd9d:	bb 40 00 00 00       	mov    $0x40,%ebx
   1dda2:	f3 48 0f bc da       	tzcnt  %rdx,%rbx
   1dda7:	41 89 d8             	mov    %ebx,%r8d
   1ddaa:	41 83 e0 3f          	and    $0x3f,%r8d
   1ddae:	44 89 c1             	mov    %r8d,%ecx
   1ddb1:	48 d3 ea             	shr    %cl,%rdx
   1ddb4:	41 83 f6 7f          	xor    $0x7f,%r14d
   1ddb8:	41 01 ee             	add    %ebp,%r14d
   1ddbb:	48 d1 ea             	shr    $1,%rdx
   1ddbe:	41 39 d6             	cmp    %edx,%r14d
   1ddc1:	0f 8f 9a 01 00 00    	jg     1df61 <<hyperinterval::ieee::Format>::rounded+0x201>
   1ddc7:	44 8d 2c 13          	lea    (%rbx,%rdx,1),%r13d
   1ddcb:	b9 01 00 00 00       	mov    $0x1,%ecx
   1ddd0:	44 29 e9             	sub    %r13d,%ecx
   1ddd3:	41 29 de             	sub    %ebx,%r14d
   1ddd6:	41 39 ce             	cmp    %ecx,%r14d
   1ddd9:	44 0f 4e f1          	cmovle %ecx,%r14d
   1dddd:	44 89 f1             	mov    %r14d,%ecx
   1dde0:	29 e9                	sub    %ebp,%ecx
   1dde2:	83 f9 7f             	cmp    $0x7f,%ecx
   1dde5:	0f 8e 8c 00 00 00    	jle    1de77 <<hyperinterval::ieee::Format>::rounded+0x117>
   1ddeb:	41 b4 01             	mov    $0x1,%r12b
   1ddee:	45 31 ff             	xor    %r15d,%r15d
   1ddf1:	45 31 db             	xor    %r11d,%r11d
   1ddf4:	45 31 d2             	xor    %r10d,%r10d
   1ddf7:	45 0f b6 e4          	movzbl %r12b,%r12d
   1ddfb:	4d 01 fc             	add    %r15,%r12
   1ddfe:	49 83 d3 00          	adc    $0x0,%r11
   1de02:	4c 89 e1             	mov    %r12,%rcx
   1de05:	4c 09 d9             	or     %r11,%rcx
   1de08:	0f 84 d2 00 00 00    	je     1dee0 <<hyperinterval::ieee::Format>::rounded+0x180>
   1de0e:	49 0f bd cb          	bsr    %r11,%rcx
   1de12:	83 f1 3f             	xor    $0x3f,%ecx
   1de15:	4d 0f bd fc          	bsr    %r12,%r15
   1de19:	41 83 f7 3f          	xor    $0x3f,%r15d
   1de1d:	41 83 cf 40          	or     $0x40,%r15d
   1de21:	4d 85 db             	test   %r11,%r11
   1de24:	44 0f 45 f9          	cmovne %ecx,%r15d
   1de28:	41 83 f7 7f          	xor    $0x7f,%r15d
   1de2c:	43 8d 2c 37          	lea    (%r15,%r14,1),%ebp
   1de30:	39 d5                	cmp    %edx,%ebp
   1de32:	0f 8f 29 01 00 00    	jg     1df61 <<hyperinterval::ieee::Format>::rounded+0x201>
   1de38:	b9 01 00 00 00       	mov    $0x1,%ecx
   1de3d:	29 d1                	sub    %edx,%ecx
   1de3f:	39 cd                	cmp    %ecx,%ebp
   1de41:	0f 8d 59 01 00 00    	jge    1dfa0 <<hyperinterval::ieee::Format>::rounded+0x240>
   1de47:	45 01 f5             	add    %r14d,%r13d
   1de4a:	41 fe cd             	dec    %r13b
   1de4d:	44 89 e9             	mov    %r13d,%ecx
   1de50:	49 d3 e4             	shl    %cl,%r12
   1de53:	31 d2                	xor    %edx,%edx
   1de55:	41 f6 c5 40          	test   $0x40,%r13b
   1de59:	49 0f 44 d4          	cmove  %r12,%rdx
   1de5d:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1de61:	0f 84 81 00 00 00    	je     1dee8 <<hyperinterval::ieee::Format>::rounded+0x188>
   1de67:	e9 99 00 00 00       	jmp    1df05 <<hyperinterval::ieee::Format>::rounded+0x1a5>
   1de6c:	c6 07 00             	movb   $0x0,(%rdi)
   1de6f:	0f 57 c0             	xorps  %xmm0,%xmm0
   1de72:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1de76:	c3                   	ret
   1de77:	85 c9                	test   %ecx,%ecx
   1de79:	4c 89 6c 24 f0       	mov    %r13,-0x10(%rsp)
   1de7e:	0f 8e 8e 00 00 00    	jle    1df12 <<hyperinterval::ieee::Format>::rounded+0x1b2>
   1de84:	4d 89 d7             	mov    %r10,%r15
   1de87:	4d 0f ad df          	shrd   %cl,%r11,%r15
   1de8b:	4d 89 dd             	mov    %r11,%r13
   1de8e:	49 d3 ed             	shr    %cl,%r13
   1de91:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
   1de98:	49 d3 e4             	shl    %cl,%r12
   1de9b:	48 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%rbp
   1dea2:	45 31 c9             	xor    %r9d,%r9d
   1dea5:	f6 c1 40             	test   $0x40,%cl
   1dea8:	4d 0f 45 fd          	cmovne %r13,%r15
   1deac:	4d 0f 45 e9          	cmovne %r9,%r13
   1deb0:	49 0f 45 ec          	cmovne %r12,%rbp
   1deb4:	4d 0f 45 e1          	cmovne %r9,%r12
   1deb8:	49 f7 d4             	not    %r12
   1debb:	48 f7 d5             	not    %rbp
   1debe:	4c 21 dd             	and    %r11,%rbp
   1dec1:	4d 21 d4             	and    %r10,%r12
   1dec4:	49 09 ec             	or     %rbp,%r12
   1dec7:	41 0f 95 c4          	setne  %r12b
   1decb:	4d 89 eb             	mov    %r13,%r11
   1dece:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1ded3:	4c 89 f9             	mov    %r15,%rcx
   1ded6:	4c 09 d9             	or     %r11,%rcx
   1ded9:	75 60                	jne    1df3b <<hyperinterval::ieee::Format>::rounded+0x1db>
   1dedb:	e9 0e ff ff ff       	jmp    1ddee <<hyperinterval::ieee::Format>::rounded+0x8e>
   1dee0:	31 d2                	xor    %edx,%edx
   1dee2:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1dee6:	75 1d                	jne    1df05 <<hyperinterval::ieee::Format>::rounded+0x1a5>
   1dee8:	48 89 d0             	mov    %rdx,%rax
   1deeb:	48 31 f0             	xor    %rsi,%rax
   1deee:	48 85 d2             	test   %rdx,%rdx
   1def1:	48 0f 44 c2          	cmove  %rdx,%rax
   1def5:	4c 31 d6             	xor    %r10,%rsi
   1def8:	4d 85 d2             	test   %r10,%r10
   1defb:	49 0f 44 f2          	cmove  %r10,%rsi
   1deff:	49 89 c2             	mov    %rax,%r10
   1df02:	48 89 f2             	mov    %rsi,%rdx
   1df05:	4c 89 57 08          	mov    %r10,0x8(%rdi)
   1df09:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   1df0d:	c6 07 00             	movb   $0x0,(%rdi)
   1df10:	eb 54                	jmp    1df66 <<hyperinterval::ieee::Format>::rounded+0x206>
   1df12:	f6 d9                	neg    %cl
   1df14:	4d 0f a5 d3          	shld   %cl,%r10,%r11
   1df18:	49 d3 e2             	shl    %cl,%r10
   1df1b:	45 31 e4             	xor    %r12d,%r12d
   1df1e:	f6 c1 40             	test   $0x40,%cl
   1df21:	4d 0f 45 da          	cmovne %r10,%r11
   1df25:	41 bf 00 00 00 00    	mov    $0x0,%r15d
   1df2b:	4d 0f 44 fa          	cmove  %r10,%r15
   1df2f:	4c 89 f9             	mov    %r15,%rcx
   1df32:	4c 09 d9             	or     %r11,%rcx
   1df35:	0f 84 b3 fe ff ff    	je     1ddee <<hyperinterval::ieee::Format>::rounded+0x8e>
   1df3b:	49 0f bd cb          	bsr    %r11,%rcx
   1df3f:	83 f1 3f             	xor    $0x3f,%ecx
   1df42:	4d 0f bd ef          	bsr    %r15,%r13
   1df46:	41 83 f5 3f          	xor    $0x3f,%r13d
   1df4a:	41 83 cd 40          	or     $0x40,%r13d
   1df4e:	4d 85 db             	test   %r11,%r11
   1df51:	44 0f 45 e9          	cmovne %ecx,%r13d
   1df55:	41 83 f5 7f          	xor    $0x7f,%r13d
   1df59:	43 8d 2c 2e          	lea    (%r14,%r13,1),%ebp
   1df5d:	39 d5                	cmp    %edx,%ebp
   1df5f:	7e 10                	jle    1df71 <<hyperinterval::ieee::Format>::rounded+0x211>
   1df61:	66 c7 07 01 05       	movw   $0x501,(%rdi)
   1df66:	5b                   	pop    %rbx
   1df67:	41 5c                	pop    %r12
   1df69:	41 5d                	pop    %r13
   1df6b:	41 5e                	pop    %r14
   1df6d:	41 5f                	pop    %r15
   1df6f:	5d                   	pop    %rbp
   1df70:	c3                   	ret
   1df71:	b9 01 00 00 00       	mov    $0x1,%ecx
   1df76:	29 d1                	sub    %edx,%ecx
   1df78:	39 cd                	cmp    %ecx,%ebp
   1df7a:	0f 8d 81 00 00 00    	jge    1e001 <<hyperinterval::ieee::Format>::rounded+0x2a1>
   1df80:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1df85:	43 8d 0c 2e          	lea    (%r14,%r13,1),%ecx
   1df89:	fe c9                	dec    %cl
   1df8b:	4d 89 f9             	mov    %r15,%r9
   1df8e:	49 d3 e1             	shl    %cl,%r9
   1df91:	45 31 d2             	xor    %r10d,%r10d
   1df94:	f6 c1 40             	test   $0x40,%cl
   1df97:	4d 0f 44 d1          	cmove  %r9,%r10
   1df9b:	e9 57 fe ff ff       	jmp    1ddf7 <<hyperinterval::ieee::Format>::rounded+0x97>
   1dfa0:	89 d9                	mov    %ebx,%ecx
   1dfa2:	44 29 f9             	sub    %r15d,%ecx
   1dfa5:	41 89 c9             	mov    %ecx,%r9d
   1dfa8:	41 f7 d9             	neg    %r9d
   1dfab:	4d 89 e6             	mov    %r12,%r14
   1dfae:	49 d3 e6             	shl    %cl,%r14
   1dfb1:	45 31 ed             	xor    %r13d,%r13d
   1dfb4:	f6 c1 40             	test   $0x40,%cl
   1dfb7:	4d 0f 44 ee          	cmove  %r14,%r13
   1dfbb:	44 89 c9             	mov    %r9d,%ecx
   1dfbe:	4d 0f ad dc          	shrd   %cl,%r11,%r12
   1dfc2:	49 d3 eb             	shr    %cl,%r11
   1dfc5:	41 f6 c1 40          	test   $0x40,%r9b
   1dfc9:	4d 0f 44 dc          	cmove  %r12,%r11
   1dfcd:	44 39 fb             	cmp    %r15d,%ebx
   1dfd0:	4d 0f 43 dd          	cmovae %r13,%r11
   1dfd4:	01 d5                	add    %edx,%ebp
   1dfd6:	4c 63 cd             	movslq %ebp,%r9
   1dfd9:	44 89 c1             	mov    %r8d,%ecx
   1dfdc:	49 d3 e1             	shl    %cl,%r9
   1dfdf:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
   1dfe6:	48 d3 e2             	shl    %cl,%rdx
   1dfe9:	48 f7 d2             	not    %rdx
   1dfec:	4c 21 da             	and    %r11,%rdx
   1dfef:	4c 09 ca             	or     %r9,%rdx
   1dff2:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1dff6:	0f 85 09 ff ff ff    	jne    1df05 <<hyperinterval::ieee::Format>::rounded+0x1a5>
   1dffc:	e9 e7 fe ff ff       	jmp    1dee8 <<hyperinterval::ieee::Format>::rounded+0x188>
   1e001:	89 d9                	mov    %ebx,%ecx
   1e003:	44 29 e9             	sub    %r13d,%ecx
   1e006:	4d 89 f9             	mov    %r15,%r9
   1e009:	49 d3 e1             	shl    %cl,%r9
   1e00c:	41 89 ca             	mov    %ecx,%r10d
   1e00f:	41 f7 da             	neg    %r10d
   1e012:	48 c7 44 24 e8 00 00 	movq   $0x0,-0x18(%rsp)
   1e019:	00 00 
   1e01b:	f6 c1 40             	test   $0x40,%cl
   1e01e:	48 8b 4c 24 e8       	mov    -0x18(%rsp),%rcx
   1e023:	49 0f 44 c9          	cmove  %r9,%rcx
   1e027:	48 89 4c 24 e8       	mov    %rcx,-0x18(%rsp)
   1e02c:	4d 89 f9             	mov    %r15,%r9
   1e02f:	44 89 d1             	mov    %r10d,%ecx
   1e032:	4d 0f ad d9          	shrd   %cl,%r11,%r9
   1e036:	4c 89 4c 24 f8       	mov    %r9,-0x8(%rsp)
   1e03b:	4d 89 d9             	mov    %r11,%r9
   1e03e:	49 d3 e9             	shr    %cl,%r9
   1e041:	41 f6 c2 40          	test   $0x40,%r10b
   1e045:	4c 0f 44 4c 24 f8    	cmove  -0x8(%rsp),%r9
   1e04b:	44 39 eb             	cmp    %r13d,%ebx
   1e04e:	4c 0f 43 4c 24 e8    	cmovae -0x18(%rsp),%r9
   1e054:	01 d5                	add    %edx,%ebp
   1e056:	4c 63 ed             	movslq %ebp,%r13
   1e059:	44 89 c1             	mov    %r8d,%ecx
   1e05c:	49 d3 e5             	shl    %cl,%r13
   1e05f:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
   1e066:	49 d3 e2             	shl    %cl,%r10
   1e069:	49 f7 d2             	not    %r10
   1e06c:	4d 21 ca             	and    %r9,%r10
   1e06f:	4d 09 ea             	or     %r13,%r10
   1e072:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1e077:	e9 7b fd ff ff       	jmp    1ddf7 <<hyperinterval::ieee::Format>::rounded+0x97>
   1e07c:	cc                   	int3
   1e07d:	cc                   	int3
   1e07e:	cc                   	int3
   1e07f:	cc                   	int3

<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull:
   1e080:	89 f8                	mov    %edi,%eax
   1e082:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1e087:	41 89 c0             	mov    %eax,%r8d
   1e08a:	41 09 f8             	or     %edi,%r8d
   1e08d:	41 89 c1             	mov    %eax,%r9d
   1e090:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1e097:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1e09d:	45 29 ca             	sub    %r9d,%r10d
   1e0a0:	85 c0                	test   %eax,%eax
   1e0a2:	4d 0f 49 d0          	cmovns %r8,%r10
   1e0a6:	41 89 d0             	mov    %edx,%r8d
   1e0a9:	41 09 f8             	or     %edi,%r8d
   1e0ac:	41 89 d1             	mov    %edx,%r9d
   1e0af:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1e0b6:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1e0bc:	45 29 cb             	sub    %r9d,%r11d
   1e0bf:	85 d2                	test   %edx,%edx
   1e0c1:	4d 0f 49 d8          	cmovns %r8,%r11
   1e0c5:	45 39 da             	cmp    %r11d,%r10d
   1e0c8:	0f 47 c2             	cmova  %edx,%eax
   1e0cb:	89 f2                	mov    %esi,%edx
   1e0cd:	09 fe                	or     %edi,%esi
   1e0cf:	41 89 d0             	mov    %edx,%r8d
   1e0d2:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1e0d9:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1e0df:	45 29 c1             	sub    %r8d,%r9d
   1e0e2:	85 d2                	test   %edx,%edx
   1e0e4:	4c 0f 49 ce          	cmovns %rsi,%r9
   1e0e8:	89 ce                	mov    %ecx,%esi
   1e0ea:	09 fe                	or     %edi,%esi
   1e0ec:	41 89 c8             	mov    %ecx,%r8d
   1e0ef:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1e0f6:	44 29 c7             	sub    %r8d,%edi
   1e0f9:	85 c9                	test   %ecx,%ecx
   1e0fb:	48 0f 49 fe          	cmovns %rsi,%rdi
   1e0ff:	41 39 f9             	cmp    %edi,%r9d
   1e102:	0f 42 d1             	cmovb  %ecx,%edx
   1e105:	c3                   	ret
   1e106:	cc                   	int3
   1e107:	cc                   	int3
   1e108:	cc                   	int3
   1e109:	cc                   	int3
   1e10a:	cc                   	int3
   1e10b:	cc                   	int3
   1e10c:	cc                   	int3
   1e10d:	cc                   	int3
   1e10e:	cc                   	int3
   1e10f:	cc                   	int3

<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::signs:
   1e110:	89 f9                	mov    %edi,%ecx
   1e112:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1e117:	4c 8d 04 01          	lea    (%rcx,%rax,1),%r8
   1e11b:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1e121:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1e127:	49 29 c9             	sub    %rcx,%r9
   1e12a:	85 ff                	test   %edi,%edi
   1e12c:	4d 0f 49 c8          	cmovns %r8,%r9
   1e130:	89 d7                	mov    %edx,%edi
   1e132:	4c 8d 04 07          	lea    (%rdi,%rax,1),%r8
   1e136:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1e13c:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   1e141:	48 29 f9             	sub    %rdi,%rcx
   1e144:	85 d2                	test   %edx,%edx
   1e146:	49 0f 49 c8          	cmovns %r8,%rcx
   1e14a:	89 f7                	mov    %esi,%edi
   1e14c:	48 8d 14 07          	lea    (%rdi,%rax,1),%rdx
   1e150:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1e156:	48 29 f8             	sub    %rdi,%rax
   1e159:	45 31 c0             	xor    %r8d,%r8d
   1e15c:	49 39 c9             	cmp    %rcx,%r9
   1e15f:	40 0f 92 c7          	setb   %dil
   1e163:	77 1e                	ja     1e183 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::signs+0x73>
   1e165:	85 f6                	test   %esi,%esi
   1e167:	49 89 d1             	mov    %rdx,%r9
   1e16a:	4c 0f 48 c8          	cmovs  %rax,%r9
   1e16e:	44 8d 57 02          	lea    0x2(%rdi),%r10d
   1e172:	4c 39 c9             	cmp    %r9,%rcx
   1e175:	45 0f b6 ca          	movzbl %r10b,%r9d
   1e179:	41 88 f8             	mov    %dil,%r8b
   1e17c:	45 0f 46 c1          	cmovbe %r9d,%r8d
   1e180:	44 89 c7             	mov    %r8d,%edi
   1e183:	85 f6                	test   %esi,%esi
   1e185:	48 0f 48 d0          	cmovs  %rax,%rdx
   1e189:	8d 47 04             	lea    0x4(%rdi),%eax
   1e18c:	39 ca                	cmp    %ecx,%edx
   1e18e:	40 0f b6 cf          	movzbl %dil,%ecx
   1e192:	0f b6 c0             	movzbl %al,%eax
   1e195:	0f 46 c1             	cmovbe %ecx,%eax
   1e198:	c3                   	ret
   1e199:	cc                   	int3
   1e19a:	cc                   	int3
   1e19b:	cc                   	int3
   1e19c:	cc                   	int3
   1e19d:	cc                   	int3
   1e19e:	cc                   	int3
   1e19f:	cc                   	int3

<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull:
   1e1a0:	53                   	push   %rbx
   1e1a1:	49 89 d0             	mov    %rdx,%r8
   1e1a4:	48 89 f2             	mov    %rsi,%rdx
   1e1a7:	48 89 f8             	mov    %rdi,%rax
   1e1aa:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1e1b1:	00 00 80 
   1e1b4:	4c 8d 0c 37          	lea    (%rdi,%rsi,1),%r9
   1e1b8:	48 8d 7e ff          	lea    -0x1(%rsi),%rdi
   1e1bc:	49 89 c2             	mov    %rax,%r10
   1e1bf:	49 21 fa             	and    %rdi,%r10
   1e1c2:	49 89 f3             	mov    %rsi,%r11
   1e1c5:	4d 29 d3             	sub    %r10,%r11
   1e1c8:	48 85 c0             	test   %rax,%rax
   1e1cb:	4d 0f 49 d9          	cmovns %r9,%r11
   1e1cf:	4d 8d 0c 30          	lea    (%r8,%rsi,1),%r9
   1e1d3:	4d 89 c2             	mov    %r8,%r10
   1e1d6:	49 21 fa             	and    %rdi,%r10
   1e1d9:	48 89 f3             	mov    %rsi,%rbx
   1e1dc:	4c 29 d3             	sub    %r10,%rbx
   1e1df:	4d 85 c0             	test   %r8,%r8
   1e1e2:	49 0f 49 d9          	cmovns %r9,%rbx
   1e1e6:	49 39 db             	cmp    %rbx,%r11
   1e1e9:	49 0f 47 c0          	cmova  %r8,%rax
   1e1ed:	4c 8d 04 32          	lea    (%rdx,%rsi,1),%r8
   1e1f1:	49 89 d1             	mov    %rdx,%r9
   1e1f4:	49 21 f9             	and    %rdi,%r9
   1e1f7:	49 89 f2             	mov    %rsi,%r10
   1e1fa:	4d 29 ca             	sub    %r9,%r10
   1e1fd:	48 85 d2             	test   %rdx,%rdx
   1e200:	4d 0f 49 d0          	cmovns %r8,%r10
   1e204:	4c 8d 04 31          	lea    (%rcx,%rsi,1),%r8
   1e208:	48 21 cf             	and    %rcx,%rdi
   1e20b:	48 29 fe             	sub    %rdi,%rsi
   1e20e:	48 85 c9             	test   %rcx,%rcx
   1e211:	49 0f 49 f0          	cmovns %r8,%rsi
   1e215:	49 39 f2             	cmp    %rsi,%r10
   1e218:	48 0f 42 d1          	cmovb  %rcx,%rdx
   1e21c:	5b                   	pop    %rbx
   1e21d:	c3                   	ret
   1e21e:	cc                   	int3
   1e21f:	cc                   	int3

<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::signs:
   1e220:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1e227:	00 00 80 
   1e22a:	48 8d 0c 07          	lea    (%rdi,%rax,1),%rcx
   1e22e:	4c 8d 40 ff          	lea    -0x1(%rax),%r8
   1e232:	49 89 f9             	mov    %rdi,%r9
   1e235:	4d 21 c1             	and    %r8,%r9
   1e238:	49 89 c2             	mov    %rax,%r10
   1e23b:	4d 29 ca             	sub    %r9,%r10
   1e23e:	48 85 ff             	test   %rdi,%rdi
   1e241:	4c 0f 49 d1          	cmovns %rcx,%r10
   1e245:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1e249:	49 89 d1             	mov    %rdx,%r9
   1e24c:	4d 21 c1             	and    %r8,%r9
   1e24f:	48 89 c1             	mov    %rax,%rcx
   1e252:	4c 29 c9             	sub    %r9,%rcx
   1e255:	48 85 d2             	test   %rdx,%rdx
   1e258:	48 0f 49 cf          	cmovns %rdi,%rcx
   1e25c:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1e260:	49 21 f0             	and    %rsi,%r8
   1e263:	4c 29 c0             	sub    %r8,%rax
   1e266:	45 31 c0             	xor    %r8d,%r8d
   1e269:	49 39 ca             	cmp    %rcx,%r10
   1e26c:	40 0f 92 c7          	setb   %dil
   1e270:	77 1f                	ja     1e291 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::signs+0x71>
   1e272:	48 85 f6             	test   %rsi,%rsi
   1e275:	49 89 d1             	mov    %rdx,%r9
   1e278:	4c 0f 48 c8          	cmovs  %rax,%r9
   1e27c:	44 8d 57 02          	lea    0x2(%rdi),%r10d
   1e280:	4c 39 c9             	cmp    %r9,%rcx
   1e283:	45 0f b6 ca          	movzbl %r10b,%r9d
   1e287:	41 88 f8             	mov    %dil,%r8b
   1e28a:	45 0f 46 c1          	cmovbe %r9d,%r8d
   1e28e:	44 89 c7             	mov    %r8d,%edi
   1e291:	48 85 f6             	test   %rsi,%rsi
   1e294:	48 0f 48 d0          	cmovs  %rax,%rdx
   1e298:	8d 47 04             	lea    0x4(%rdi),%eax
   1e29b:	48 39 ca             	cmp    %rcx,%rdx
   1e29e:	40 0f b6 cf          	movzbl %dil,%ecx
   1e2a2:	0f b6 c0             	movzbl %al,%eax
   1e2a5:	0f 46 c1             	cmovbe %ecx,%eax
   1e2a8:	c3                   	ret
   1e2a9:	cc                   	int3
   1e2aa:	cc                   	int3
   1e2ab:	cc                   	int3
   1e2ac:	cc                   	int3
   1e2ad:	cc                   	int3
   1e2ae:	cc                   	int3
   1e2af:	cc                   	int3

__udivti3:
   5a230:	49 89 d0             	mov    %rdx,%r8
   5a233:	48 85 c9             	test   %rcx,%rcx
   5a236:	74 76                	je     5a2ae <__udivti3+0x7e>
   5a238:	53                   	push   %rbx
   5a239:	4c 0f bd c9          	bsr    %rcx,%r9
   5a23d:	44 89 ca             	mov    %r9d,%edx
   5a240:	83 f2 3f             	xor    $0x3f,%edx
   5a243:	b0 40                	mov    $0x40,%al
   5a245:	28 d0                	sub    %dl,%al
   5a247:	4c 89 c2             	mov    %r8,%rdx
   5a24a:	49 89 cb             	mov    %rcx,%r11
   5a24d:	89 c1                	mov    %eax,%ecx
   5a24f:	4c 0f ad da          	shrd   %cl,%r11,%rdx
   5a253:	4d 89 da             	mov    %r11,%r10
   5a256:	49 d3 ea             	shr    %cl,%r10
   5a259:	a8 40                	test   $0x40,%al
   5a25b:	4c 0f 44 d2          	cmove  %rdx,%r10
   5a25f:	48 89 f8             	mov    %rdi,%rax
   5a262:	48 0f ac f0 01       	shrd   $0x1,%rsi,%rax
   5a267:	48 89 f2             	mov    %rsi,%rdx
   5a26a:	48 d1 ea             	shr    $1,%rdx
   5a26d:	49 f7 f2             	div    %r10
   5a270:	49 89 c2             	mov    %rax,%r10
   5a273:	44 89 c9             	mov    %r9d,%ecx
   5a276:	49 d3 ea             	shr    %cl,%r10
   5a279:	31 c9                	xor    %ecx,%ecx
   5a27b:	49 83 ea 01          	sub    $0x1,%r10
   5a27f:	4c 0f 42 d1          	cmovb  %rcx,%r10
   5a283:	4c 89 db             	mov    %r11,%rbx
   5a286:	4c 89 c0             	mov    %r8,%rax
   5a289:	49 f7 e2             	mul    %r10
   5a28c:	49 89 c1             	mov    %rax,%r9
   5a28f:	4c 89 d0             	mov    %r10,%rax
   5a292:	49 0f af da          	imul   %r10,%rbx
   5a296:	48 01 da             	add    %rbx,%rdx
   5a299:	4c 29 cf             	sub    %r9,%rdi
   5a29c:	48 19 d6             	sbb    %rdx,%rsi
   5a29f:	4c 39 c7             	cmp    %r8,%rdi
   5a2a2:	4c 19 de             	sbb    %r11,%rsi
   5a2a5:	48 83 d8 ff          	sbb    $0xffffffffffffffff,%rax
   5a2a9:	5b                   	pop    %rbx
   5a2aa:	48 89 ca             	mov    %rcx,%rdx
   5a2ad:	c3                   	ret
   5a2ae:	4c 39 c6             	cmp    %r8,%rsi
   5a2b1:	73 0f                	jae    5a2c2 <__udivti3+0x92>
   5a2b3:	48 89 f8             	mov    %rdi,%rax
   5a2b6:	48 89 f2             	mov    %rsi,%rdx
   5a2b9:	49 f7 f0             	div    %r8
   5a2bc:	31 c9                	xor    %ecx,%ecx
   5a2be:	48 89 ca             	mov    %rcx,%rdx
   5a2c1:	c3                   	ret
   5a2c2:	48 89 f0             	mov    %rsi,%rax
   5a2c5:	4c 09 c0             	or     %r8,%rax
   5a2c8:	48 c1 e8 20          	shr    $0x20,%rax
   5a2cc:	74 15                	je     5a2e3 <__udivti3+0xb3>
   5a2ce:	48 89 f0             	mov    %rsi,%rax
   5a2d1:	31 d2                	xor    %edx,%edx
   5a2d3:	49 f7 f0             	div    %r8
   5a2d6:	48 89 c1             	mov    %rax,%rcx
   5a2d9:	48 89 f8             	mov    %rdi,%rax
   5a2dc:	49 f7 f0             	div    %r8
   5a2df:	48 89 ca             	mov    %rcx,%rdx
   5a2e2:	c3                   	ret
   5a2e3:	89 f0                	mov    %esi,%eax
   5a2e5:	31 d2                	xor    %edx,%edx
   5a2e7:	41 f7 f0             	div    %r8d
   5a2ea:	89 c1                	mov    %eax,%ecx
   5a2ec:	48 89 f8             	mov    %rdi,%rax
   5a2ef:	49 f7 f0             	div    %r8
   5a2f2:	48 89 ca             	mov    %rcx,%rdx
   5a2f5:	c3                   	ret

Disassembly of section .init:
