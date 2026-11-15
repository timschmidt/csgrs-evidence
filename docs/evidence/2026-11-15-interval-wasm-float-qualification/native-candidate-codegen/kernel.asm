<hyperinterval::float::F64Enclosure>::abs:
   17b70:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   17b74:	75 33                	jne    17ba9 <<hyperinterval::float::F64Enclosure>::abs+0x39>
   17b76:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   17b7a:	48 ba ff ff ff ff ff 	movabs $0x7fffffffffffffff,%rdx
   17b81:	ff ff 7f 
   17b84:	48 85 c9             	test   %rcx,%rcx
   17b87:	41 0f 99 c0          	setns  %r8b
   17b8b:	48 89 c8             	mov    %rcx,%rax
   17b8e:	48 21 d0             	and    %rdx,%rax
   17b91:	41 0f 94 c1          	sete   %r9b
   17b95:	45 08 c1             	or     %r8b,%r9b
   17b98:	74 17                	je     17bb1 <<hyperinterval::float::F64Enclosure>::abs+0x41>
   17b9a:	48 8b 46 10          	mov    0x10(%rsi),%rax
   17b9e:	48 89 47 10          	mov    %rax,0x10(%rdi)
   17ba2:	0f 10 06             	movups (%rsi),%xmm0
   17ba5:	0f 11 07             	movups %xmm0,(%rdi)
   17ba8:	c3                   	ret
   17ba9:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
   17bb0:	c3                   	ret
   17bb1:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   17bb5:	48 85 f6             	test   %rsi,%rsi
   17bb8:	41 0f 98 c1          	sets   %r9b
   17bbc:	49 89 f0             	mov    %rsi,%r8
   17bbf:	49 21 d0             	and    %rdx,%r8
   17bc2:	41 0f 95 c2          	setne  %r10b
   17bc6:	45 84 d1             	test   %r10b,%r9b
   17bc9:	74 10                	je     17bdb <<hyperinterval::float::F64Enclosure>::abs+0x6b>
   17bcb:	48 c7 07 01 00 00 00 	movq   $0x1,(%rdi)
   17bd2:	4c 89 47 08          	mov    %r8,0x8(%rdi)
   17bd6:	48 89 47 10          	mov    %rax,0x10(%rdi)
   17bda:	c3                   	ret
   17bdb:	49 f7 d8             	neg    %r8
   17bde:	48 85 f6             	test   %rsi,%rsi
   17be1:	4c 8d 4c 16 01       	lea    0x1(%rsi,%rdx,1),%r9
   17be6:	4a 8d 54 02 01       	lea    0x1(%rdx,%r8,1),%rdx
   17beb:	49 0f 49 d1          	cmovns %r9,%rdx
   17bef:	48 39 d1             	cmp    %rdx,%rcx
   17bf2:	48 0f 46 c6          	cmovbe %rsi,%rax
   17bf6:	48 c7 07 01 00 00 00 	movq   $0x1,(%rdi)
   17bfd:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
   17c04:	00 
   17c05:	48 89 47 10          	mov    %rax,0x10(%rdi)
   17c09:	c3                   	ret
   17c0a:	cc                   	int3
   17c0b:	cc                   	int3
   17c0c:	cc                   	int3
   17c0d:	cc                   	int3
   17c0e:	cc                   	int3
   17c0f:	cc                   	int3

hyperinterval_strict_chain32:
   17c40:	53                   	push   %rbx
   17c41:	48 83 ec 60          	sub    $0x60,%rsp
   17c45:	48 89 fb             	mov    %rdi,%rbx
   17c48:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   17c4d:	ff 15 25 5c 04 00    	call   *0x45c25(%rip)        # 5d878 <_DYNAMIC+0x2b0>
   17c53:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   17c57:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   17c5c:	83 f9 02             	cmp    $0x2,%ecx
   17c5f:	0f 84 f4 00 00 00    	je     17d59 <hyperinterval_strict_chain32+0x119>
   17c65:	8b 54 24 11          	mov    0x11(%rsp),%edx
   17c69:	8b 74 24 14          	mov    0x14(%rsp),%esi
   17c6d:	89 74 24 5c          	mov    %esi,0x5c(%rsp)
   17c71:	89 54 24 59          	mov    %edx,0x59(%rsp)
   17c75:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
   17c79:	88 44 24 58          	mov    %al,0x58(%rsp)
   17c7d:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   17c82:	48 8d 74 24 54       	lea    0x54(%rsp),%rsi
   17c87:	f3 0f 10 05 99 df fe 	movss  -0x12067(%rip),%xmm0        # 5c28 <__abi_tag+0x592c>
   17c8e:	ff 
   17c8f:	f3 0f 10 0d 89 df fe 	movss  -0x12077(%rip),%xmm1        # 5c20 <__abi_tag+0x5924>
   17c96:	ff 
   17c97:	ff 15 e3 5b 04 00    	call   *0x45be3(%rip)        # 5d880 <_DYNAMIC+0x2b8>
   17c9d:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
   17ca1:	0f b6 44 24 1c       	movzbl 0x1c(%rsp),%eax
   17ca6:	83 f9 02             	cmp    $0x2,%ecx
   17ca9:	0f 84 aa 00 00 00    	je     17d59 <hyperinterval_strict_chain32+0x119>
   17caf:	8b 54 24 1d          	mov    0x1d(%rsp),%edx
   17cb3:	8b 74 24 20          	mov    0x20(%rsp),%esi
   17cb7:	89 74 24 50          	mov    %esi,0x50(%rsp)
   17cbb:	89 54 24 4d          	mov    %edx,0x4d(%rsp)
   17cbf:	89 4c 24 48          	mov    %ecx,0x48(%rsp)
   17cc3:	88 44 24 4c          	mov    %al,0x4c(%rsp)
   17cc7:	48 8d 7c 24 3c       	lea    0x3c(%rsp),%rdi
   17ccc:	48 8d 74 24 48       	lea    0x48(%rsp),%rsi
   17cd1:	ff 15 b1 5b 04 00    	call   *0x45bb1(%rip)        # 5d888 <_DYNAMIC+0x2c0>
   17cd7:	8b 4c 24 3c          	mov    0x3c(%rsp),%ecx
   17cdb:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   17ce0:	83 f9 02             	cmp    $0x2,%ecx
   17ce3:	74 74                	je     17d59 <hyperinterval_strict_chain32+0x119>
   17ce5:	8b 54 24 41          	mov    0x41(%rsp),%edx
   17ce9:	8b 74 24 44          	mov    0x44(%rsp),%esi
   17ced:	89 74 24 38          	mov    %esi,0x38(%rsp)
   17cf1:	89 54 24 35          	mov    %edx,0x35(%rsp)
   17cf5:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   17cf9:	88 44 24 34          	mov    %al,0x34(%rsp)
   17cfd:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   17d02:	f3 0f 10 05 ea de fe 	movss  -0x12116(%rip),%xmm0        # 5bf4 <__abi_tag+0x58f8>
   17d09:	ff 
   17d0a:	ff 15 80 5b 04 00    	call   *0x45b80(%rip)        # 5d890 <_DYNAMIC+0x2c8>
   17d10:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   17d14:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   17d19:	83 f9 02             	cmp    $0x2,%ecx
   17d1c:	74 3b                	je     17d59 <hyperinterval_strict_chain32+0x119>
   17d1e:	8b 54 24 11          	mov    0x11(%rsp),%edx
   17d22:	8b 74 24 14          	mov    0x14(%rsp),%esi
   17d26:	89 74 24 20          	mov    %esi,0x20(%rsp)
   17d2a:	89 54 24 1d          	mov    %edx,0x1d(%rsp)
   17d2e:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
   17d32:	88 44 24 1c          	mov    %al,0x1c(%rsp)
   17d36:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
   17d3b:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   17d40:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
   17d45:	ff 15 4d 5b 04 00    	call   *0x45b4d(%rip)        # 5d898 <_DYNAMIC+0x2d0>
   17d4b:	8b 4c 24 24          	mov    0x24(%rsp),%ecx
   17d4f:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   17d54:	83 f9 02             	cmp    $0x2,%ecx
   17d57:	75 12                	jne    17d6b <hyperinterval_strict_chain32+0x12b>
   17d59:	88 43 04             	mov    %al,0x4(%rbx)
   17d5c:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17d62:	48 89 d8             	mov    %rbx,%rax
   17d65:	48 83 c4 60          	add    $0x60,%rsp
   17d69:	5b                   	pop    %rbx
   17d6a:	c3                   	ret
   17d6b:	8b 54 24 29          	mov    0x29(%rsp),%edx
   17d6f:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
   17d73:	89 74 24 14          	mov    %esi,0x14(%rsp)
   17d77:	89 54 24 11          	mov    %edx,0x11(%rsp)
   17d7b:	89 4c 24 0c          	mov    %ecx,0xc(%rsp)
   17d7f:	88 44 24 10          	mov    %al,0x10(%rsp)
   17d83:	48 8d 74 24 0c       	lea    0xc(%rsp),%rsi
   17d88:	48 89 df             	mov    %rbx,%rdi
   17d8b:	ff 15 0f 5b 04 00    	call   *0x45b0f(%rip)        # 5d8a0 <_DYNAMIC+0x2d8>
   17d91:	48 89 d8             	mov    %rbx,%rax
   17d94:	48 83 c4 60          	add    $0x60,%rsp
   17d98:	5b                   	pop    %rbx
   17d99:	c3                   	ret
   17d9a:	cc                   	int3
   17d9b:	cc                   	int3
   17d9c:	cc                   	int3
   17d9d:	cc                   	int3
   17d9e:	cc                   	int3
   17d9f:	cc                   	int3

hyperinterval_strict_chain64:
   17da0:	53                   	push   %rbx
   17da1:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
   17da8:	48 89 fb             	mov    %rdi,%rbx
   17dab:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17db0:	ff 15 f2 5a 04 00    	call   *0x45af2(%rip)        # 5d8a8 <_DYNAMIC+0x2e0>
   17db6:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   17dbb:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   17dc0:	48 83 f9 02          	cmp    $0x2,%rcx
   17dc4:	0f 84 32 01 00 00    	je     17efc <hyperinterval_strict_chain64+0x15c>
   17dca:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   17dcf:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   17dd4:	48 89 b4 24 a8 00 00 	mov    %rsi,0xa8(%rsp)
   17ddb:	00 
   17ddc:	48 89 94 24 a1 00 00 	mov    %rdx,0xa1(%rsp)
   17de3:	00 
   17de4:	48 89 8c 24 98 00 00 	mov    %rcx,0x98(%rsp)
   17deb:	00 
   17dec:	88 84 24 a0 00 00 00 	mov    %al,0xa0(%rsp)
   17df3:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   17df8:	48 8d b4 24 98 00 00 	lea    0x98(%rsp),%rsi
   17dff:	00 
   17e00:	f2 0f 10 05 a8 dd fe 	movsd  -0x12258(%rip),%xmm0        # 5bb0 <__abi_tag+0x58b4>
   17e07:	ff 
   17e08:	f2 0f 10 0d b0 dd fe 	movsd  -0x12250(%rip),%xmm1        # 5bc0 <__abi_tag+0x58c4>
   17e0f:	ff 
   17e10:	ff 15 9a 5a 04 00    	call   *0x45a9a(%rip)        # 5d8b0 <_DYNAMIC+0x2e8>
   17e16:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   17e1b:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   17e20:	48 83 f9 02          	cmp    $0x2,%rcx
   17e24:	0f 84 d2 00 00 00    	je     17efc <hyperinterval_strict_chain64+0x15c>
   17e2a:	48 8b 54 24 29       	mov    0x29(%rsp),%rdx
   17e2f:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   17e34:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
   17e3b:	00 
   17e3c:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
   17e43:	00 
   17e44:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
   17e4b:	00 
   17e4c:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
   17e53:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
   17e58:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   17e5f:	00 
   17e60:	ff 15 52 5a 04 00    	call   *0x45a52(%rip)        # 5d8b8 <_DYNAMIC+0x2f0>
   17e66:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
   17e6b:	0f b6 44 24 70       	movzbl 0x70(%rsp),%eax
   17e70:	48 83 f9 02          	cmp    $0x2,%rcx
   17e74:	0f 84 82 00 00 00    	je     17efc <hyperinterval_strict_chain64+0x15c>
   17e7a:	48 8b 54 24 71       	mov    0x71(%rsp),%rdx
   17e7f:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
   17e84:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   17e89:	48 89 54 24 59       	mov    %rdx,0x59(%rsp)
   17e8e:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
   17e93:	88 44 24 58          	mov    %al,0x58(%rsp)
   17e97:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17e9c:	f2 0f 10 05 fc dc fe 	movsd  -0x12304(%rip),%xmm0        # 5ba0 <__abi_tag+0x58a4>
   17ea3:	ff 
   17ea4:	ff 15 16 5a 04 00    	call   *0x45a16(%rip)        # 5d8c0 <_DYNAMIC+0x2f8>
   17eaa:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   17eaf:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   17eb4:	48 83 f9 02          	cmp    $0x2,%rcx
   17eb8:	74 42                	je     17efc <hyperinterval_strict_chain64+0x15c>
   17eba:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   17ebf:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   17ec4:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   17ec9:	48 89 54 24 29       	mov    %rdx,0x29(%rsp)
   17ece:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   17ed3:	88 44 24 28          	mov    %al,0x28(%rsp)
   17ed7:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   17edc:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   17ee1:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
   17ee6:	ff 15 dc 59 04 00    	call   *0x459dc(%rip)        # 5d8c8 <_DYNAMIC+0x300>
   17eec:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   17ef1:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   17ef6:	48 83 f9 02          	cmp    $0x2,%rcx
   17efa:	75 16                	jne    17f12 <hyperinterval_strict_chain64+0x172>
   17efc:	88 43 08             	mov    %al,0x8(%rbx)
   17eff:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   17f06:	48 89 d8             	mov    %rbx,%rax
   17f09:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   17f10:	5b                   	pop    %rbx
   17f11:	c3                   	ret
   17f12:	48 8b 54 24 41       	mov    0x41(%rsp),%rdx
   17f17:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
   17f1c:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
   17f21:	48 89 54 24 11       	mov    %rdx,0x11(%rsp)
   17f26:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   17f2b:	88 44 24 10          	mov    %al,0x10(%rsp)
   17f2f:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
   17f34:	48 89 df             	mov    %rbx,%rdi
   17f37:	ff 15 93 59 04 00    	call   *0x45993(%rip)        # 5d8d0 <_DYNAMIC+0x308>
   17f3d:	48 89 d8             	mov    %rbx,%rax
   17f40:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   17f47:	5b                   	pop    %rbx
   17f48:	c3                   	ret
   17f49:	cc                   	int3
   17f4a:	cc                   	int3
   17f4b:	cc                   	int3
   17f4c:	cc                   	int3
   17f4d:	cc                   	int3
   17f4e:	cc                   	int3
   17f4f:	cc                   	int3

hyperinterval_strict_sqrt32:
   17f50:	53                   	push   %rbx
   17f51:	48 83 ec 20          	sub    $0x20,%rsp
   17f55:	48 89 fb             	mov    %rdi,%rbx
   17f58:	48 8d 7c 24 14       	lea    0x14(%rsp),%rdi
   17f5d:	ff 15 15 59 04 00    	call   *0x45915(%rip)        # 5d878 <_DYNAMIC+0x2b0>
   17f63:	8b 4c 24 14          	mov    0x14(%rsp),%ecx
   17f67:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17f6c:	83 f9 02             	cmp    $0x2,%ecx
   17f6f:	75 12                	jne    17f83 <hyperinterval_strict_sqrt32+0x33>
   17f71:	88 43 04             	mov    %al,0x4(%rbx)
   17f74:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17f7a:	48 89 d8             	mov    %rbx,%rax
   17f7d:	48 83 c4 20          	add    $0x20,%rsp
   17f81:	5b                   	pop    %rbx
   17f82:	c3                   	ret
   17f83:	8b 54 24 19          	mov    0x19(%rsp),%edx
   17f87:	8b 74 24 1c          	mov    0x1c(%rsp),%esi
   17f8b:	89 74 24 10          	mov    %esi,0x10(%rsp)
   17f8f:	89 54 24 0d          	mov    %edx,0xd(%rsp)
   17f93:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
   17f97:	88 44 24 0c          	mov    %al,0xc(%rsp)
   17f9b:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
   17fa0:	48 89 df             	mov    %rbx,%rdi
   17fa3:	ff 15 2f 59 04 00    	call   *0x4592f(%rip)        # 5d8d8 <_DYNAMIC+0x310>
   17fa9:	48 89 d8             	mov    %rbx,%rax
   17fac:	48 83 c4 20          	add    $0x20,%rsp
   17fb0:	5b                   	pop    %rbx
   17fb1:	c3                   	ret
   17fb2:	cc                   	int3
   17fb3:	cc                   	int3
   17fb4:	cc                   	int3
   17fb5:	cc                   	int3
   17fb6:	cc                   	int3
   17fb7:	cc                   	int3
   17fb8:	cc                   	int3
   17fb9:	cc                   	int3
   17fba:	cc                   	int3
   17fbb:	cc                   	int3
   17fbc:	cc                   	int3
   17fbd:	cc                   	int3
   17fbe:	cc                   	int3
   17fbf:	cc                   	int3

hyperinterval_strict_sqrt64:
   17fc0:	53                   	push   %rbx
   17fc1:	48 83 ec 30          	sub    $0x30,%rsp
   17fc5:	48 89 fb             	mov    %rdi,%rbx
   17fc8:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   17fcd:	ff 15 d5 58 04 00    	call   *0x458d5(%rip)        # 5d8a8 <_DYNAMIC+0x2e0>
   17fd3:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   17fd8:	0f b6 44 24 20       	movzbl 0x20(%rsp),%eax
   17fdd:	48 83 f9 02          	cmp    $0x2,%rcx
   17fe1:	75 13                	jne    17ff6 <hyperinterval_strict_sqrt64+0x36>
   17fe3:	88 43 08             	mov    %al,0x8(%rbx)
   17fe6:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   17fed:	48 89 d8             	mov    %rbx,%rax
   17ff0:	48 83 c4 30          	add    $0x30,%rsp
   17ff4:	5b                   	pop    %rbx
   17ff5:	c3                   	ret
   17ff6:	48 8b 54 24 21       	mov    0x21(%rsp),%rdx
   17ffb:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   18000:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
   18005:	48 89 54 24 09       	mov    %rdx,0x9(%rsp)
   1800a:	48 89 0c 24          	mov    %rcx,(%rsp)
   1800e:	88 44 24 08          	mov    %al,0x8(%rsp)
   18012:	48 89 e6             	mov    %rsp,%rsi
   18015:	48 89 df             	mov    %rbx,%rdi
   18018:	ff 15 c2 58 04 00    	call   *0x458c2(%rip)        # 5d8e0 <_DYNAMIC+0x318>
   1801e:	48 89 d8             	mov    %rbx,%rax
   18021:	48 83 c4 30          	add    $0x30,%rsp
   18025:	5b                   	pop    %rbx
   18026:	c3                   	ret
   18027:	cc                   	int3
   18028:	cc                   	int3
   18029:	cc                   	int3
   1802a:	cc                   	int3
   1802b:	cc                   	int3
   1802c:	cc                   	int3
   1802d:	cc                   	int3
   1802e:	cc                   	int3
   1802f:	cc                   	int3

hyperinterval_strict_surface32:
   18030:	55                   	push   %rbp
   18031:	41 57                	push   %r15
   18033:	41 56                	push   %r14
   18035:	41 55                	push   %r13
   18037:	41 54                	push   %r12
   18039:	53                   	push   %rbx
   1803a:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
   18041:	89 f5                	mov    %esi,%ebp
   18043:	48 89 fb             	mov    %rdi,%rbx
   18046:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1804b:	66 0f 7e 44 24 3c    	movd   %xmm0,0x3c(%rsp)
   18051:	66 0f 7e 4c 24 2c    	movd   %xmm1,0x2c(%rsp)
   18057:	ff 15 1b 58 04 00    	call   *0x4581b(%rip)        # 5d878 <_DYNAMIC+0x2b0>
   1805d:	44 8b 6c 24 08       	mov    0x8(%rsp),%r13d
   18062:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   18067:	41 83 fd 02          	cmp    $0x2,%r13d
   1806b:	75 0e                	jne    1807b <hyperinterval_strict_surface32+0x4b>
   1806d:	88 43 04             	mov    %al,0x4(%rbx)
   18070:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18076:	e9 8a 00 00 00       	jmp    18105 <hyperinterval_strict_surface32+0xd5>
   1807b:	49 89 df             	mov    %rbx,%r15
   1807e:	8b 4c 24 0d          	mov    0xd(%rsp),%ecx
   18082:	8b 54 24 10          	mov    0x10(%rsp),%edx
   18086:	89 54 24 48          	mov    %edx,0x48(%rsp)
   1808a:	89 4c 24 45          	mov    %ecx,0x45(%rsp)
   1808e:	44 89 6c 24 40       	mov    %r13d,0x40(%rsp)
   18093:	88 44 24 44          	mov    %al,0x44(%rsp)
   18097:	66 0f 6e 44 24 3c    	movd   0x3c(%rsp),%xmm0
   1809d:	ff 15 45 58 04 00    	call   *0x45845(%rip)        # 5d8e8 <_DYNAMIC+0x320>
   180a3:	48 89 c3             	mov    %rax,%rbx
   180a6:	f6 c3 01             	test   $0x1,%bl
   180a9:	74 0b                	je     180b6 <hyperinterval_strict_surface32+0x86>
   180ab:	4c 89 f8             	mov    %r15,%rax
   180ae:	88 78 04             	mov    %bh,0x4(%rax)
   180b1:	4c 89 fb             	mov    %r15,%rbx
   180b4:	eb 48                	jmp    180fe <hyperinterval_strict_surface32+0xce>
   180b6:	66 0f 6e 44 24 2c    	movd   0x2c(%rsp),%xmm0
   180bc:	ff 15 2e 58 04 00    	call   *0x4582e(%rip)        # 5d8f0 <_DYNAMIC+0x328>
   180c2:	a8 01                	test   $0x1,%al
   180c4:	74 08                	je     180ce <hyperinterval_strict_surface32+0x9e>
   180c6:	4c 89 fb             	mov    %r15,%rbx
   180c9:	88 63 04             	mov    %ah,0x4(%rbx)
   180cc:	eb 30                	jmp    180fe <hyperinterval_strict_surface32+0xce>
   180ce:	48 c1 eb 20          	shr    $0x20,%rbx
   180d2:	66 0f 6e c3          	movd   %ebx,%xmm0
   180d6:	48 c1 e8 20          	shr    $0x20,%rax
   180da:	66 0f 6e c8          	movd   %eax,%xmm1
   180de:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   180e3:	ff 15 8f 57 04 00    	call   *0x4578f(%rip)        # 5d878 <_DYNAMIC+0x2b0>
   180e9:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   180ed:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   180f2:	83 f9 02             	cmp    $0x2,%ecx
   180f5:	75 23                	jne    1811a <hyperinterval_strict_surface32+0xea>
   180f7:	4c 89 fb             	mov    %r15,%rbx
   180fa:	41 88 47 04          	mov    %al,0x4(%r15)
   180fe:	41 c7 07 02 00 00 00 	movl   $0x2,(%r15)
   18105:	48 89 d8             	mov    %rbx,%rax
   18108:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
   1810f:	5b                   	pop    %rbx
   18110:	41 5c                	pop    %r12
   18112:	41 5d                	pop    %r13
   18114:	41 5e                	pop    %r14
   18116:	41 5f                	pop    %r15
   18118:	5d                   	pop    %rbp
   18119:	c3                   	ret
   1811a:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   1811e:	8b 74 24 10          	mov    0x10(%rsp),%esi
   18122:	89 74 24 60          	mov    %esi,0x60(%rsp)
   18126:	89 54 24 5d          	mov    %edx,0x5d(%rsp)
   1812a:	89 4c 24 58          	mov    %ecx,0x58(%rsp)
   1812e:	88 44 24 5c          	mov    %al,0x5c(%rsp)
   18132:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18137:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
   1813c:	89 ea                	mov    %ebp,%edx
   1813e:	ff 15 b4 57 04 00    	call   *0x457b4(%rip)        # 5d8f8 <_DYNAMIC+0x330>
   18144:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18148:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   1814d:	83 f9 02             	cmp    $0x2,%ecx
   18150:	4c 89 fb             	mov    %r15,%rbx
   18153:	0f 84 14 ff ff ff    	je     1806d <hyperinterval_strict_surface32+0x3d>
   18159:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   1815d:	8b 74 24 10          	mov    0x10(%rsp),%esi
   18161:	89 74 24 78          	mov    %esi,0x78(%rsp)
   18165:	89 54 24 75          	mov    %edx,0x75(%rsp)
   18169:	89 4c 24 70          	mov    %ecx,0x70(%rsp)
   1816d:	88 44 24 74          	mov    %al,0x74(%rsp)
   18171:	48 8d 7c 24 4c       	lea    0x4c(%rsp),%rdi
   18176:	48 8d 74 24 70       	lea    0x70(%rsp),%rsi
   1817b:	ff 15 7f 57 04 00    	call   *0x4577f(%rip)        # 5d900 <_DYNAMIC+0x338>
   18181:	8b 4c 24 4c          	mov    0x4c(%rsp),%ecx
   18185:	0f b6 44 24 50       	movzbl 0x50(%rsp),%eax
   1818a:	83 f9 02             	cmp    $0x2,%ecx
   1818d:	0f 84 da fe ff ff    	je     1806d <hyperinterval_strict_surface32+0x3d>
   18193:	8b 54 24 51          	mov    0x51(%rsp),%edx
   18197:	8b 74 24 54          	mov    0x54(%rsp),%esi
   1819b:	89 74 24 38          	mov    %esi,0x38(%rsp)
   1819f:	89 54 24 35          	mov    %edx,0x35(%rsp)
   181a3:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   181a7:	88 44 24 34          	mov    %al,0x34(%rsp)
   181ab:	48 8d 9c 24 9c 00 00 	lea    0x9c(%rsp),%rbx
   181b2:	00 
   181b3:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   181b8:	4c 8d 64 24 58       	lea    0x58(%rsp),%r12
   181bd:	48 89 df             	mov    %rbx,%rdi
   181c0:	4c 89 e2             	mov    %r12,%rdx
   181c3:	ff 15 3f 57 04 00    	call   *0x4573f(%rip)        # 5d908 <_DYNAMIC+0x340>
   181c9:	4c 8d 74 24 64       	lea    0x64(%rsp),%r14
   181ce:	48 8d 54 24 40       	lea    0x40(%rsp),%rdx
   181d3:	4c 89 f7             	mov    %r14,%rdi
   181d6:	48 89 de             	mov    %rbx,%rsi
   181d9:	ff 15 31 57 04 00    	call   *0x45731(%rip)        # 5d910 <_DYNAMIC+0x348>
   181df:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   181e4:	4c 89 f6             	mov    %r14,%rsi
   181e7:	ff 15 2b 57 04 00    	call   *0x4572b(%rip)        # 5d918 <_DYNAMIC+0x350>
   181ed:	48 8d 7c 24 14       	lea    0x14(%rsp),%rdi
   181f2:	4c 89 f6             	mov    %r14,%rsi
   181f5:	4c 89 e2             	mov    %r12,%rdx
   181f8:	ff 15 22 57 04 00    	call   *0x45722(%rip)        # 5d920 <_DYNAMIC+0x358>
   181fe:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   18203:	4c 89 f6             	mov    %r14,%rsi
   18206:	4c 89 e2             	mov    %r12,%rdx
   18209:	ff 15 19 57 04 00    	call   *0x45719(%rip)        # 5d928 <_DYNAMIC+0x360>
   1820f:	8b 44 24 28          	mov    0x28(%rsp),%eax
   18213:	89 84 24 90 00 00 00 	mov    %eax,0x90(%rsp)
   1821a:	0f 10 44 24 08       	movups 0x8(%rsp),%xmm0
   1821f:	0f 10 4c 24 18       	movups 0x18(%rsp),%xmm1
   18224:	0f 29 8c 24 80 00 00 	movaps %xmm1,0x80(%rsp)
   1822b:	00 
   1822c:	0f 29 44 24 70       	movaps %xmm0,0x70(%rsp)
   18231:	48 8d 44 24 70       	lea    0x70(%rsp),%rax
   18236:	4c 89 f7             	mov    %r14,%rdi
   18239:	ff 15 f1 56 04 00    	call   *0x456f1(%rip)        # 5d930 <_DYNAMIC+0x368>
   1823f:	8b 4c 24 64          	mov    0x64(%rsp),%ecx
   18243:	83 f9 01             	cmp    $0x1,%ecx
   18246:	75 1c                	jne    18264 <hyperinterval_strict_surface32+0x234>
   18248:	8b 74 24 68          	mov    0x68(%rsp),%esi
   1824c:	8b 7c 24 6c          	mov    0x6c(%rsp),%edi
   18250:	39 fe                	cmp    %edi,%esi
   18252:	0f 94 c2             	sete   %dl
   18255:	66 0f 6e ce          	movd   %esi,%xmm1
   18259:	66 0f 6e c7          	movd   %edi,%xmm0
   1825d:	be 01 00 00 00       	mov    $0x1,%esi
   18262:	eb 04                	jmp    18268 <hyperinterval_strict_surface32+0x238>
   18264:	31 d2                	xor    %edx,%edx
   18266:	31 f6                	xor    %esi,%esi
   18268:	80 f1 01             	xor    $0x1,%cl
   1826b:	89 74 24 08          	mov    %esi,0x8(%rsp)
   1826f:	66 0f 7e 4c 24 0c    	movd   %xmm1,0xc(%rsp)
   18275:	88 4c 24 10          	mov    %cl,0x10(%rsp)
   18279:	88 54 24 11          	mov    %dl,0x11(%rsp)
   1827d:	88 44 24 12          	mov    %al,0x12(%rsp)
   18281:	89 74 24 14          	mov    %esi,0x14(%rsp)
   18285:	66 0f 7e 44 24 18    	movd   %xmm0,0x18(%rsp)
   1828b:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   18290:	4c 8d 64 24 64       	lea    0x64(%rsp),%r12
   18295:	48 8d 5c 24 58       	lea    0x58(%rsp),%rbx
   1829a:	4c 89 e7             	mov    %r12,%rdi
   1829d:	48 89 de             	mov    %rbx,%rsi
   182a0:	ff 15 92 56 04 00    	call   *0x45692(%rip)        # 5d938 <_DYNAMIC+0x370>
   182a6:	88 44 24 2c          	mov    %al,0x2c(%rsp)
   182aa:	4c 89 e7             	mov    %r12,%rdi
   182ad:	48 89 de             	mov    %rbx,%rsi
   182b0:	ff 15 8a 56 04 00    	call   *0x4568a(%rip)        # 5d940 <_DYNAMIC+0x378>
   182b6:	41 89 c6             	mov    %eax,%r14d
   182b9:	48 8d 5c 24 40       	lea    0x40(%rsp),%rbx
   182be:	4c 89 e7             	mov    %r12,%rdi
   182c1:	48 89 de             	mov    %rbx,%rsi
   182c4:	ff 15 7e 56 04 00    	call   *0x4567e(%rip)        # 5d948 <_DYNAMIC+0x380>
   182ca:	89 c5                	mov    %eax,%ebp
   182cc:	4c 89 e7             	mov    %r12,%rdi
   182cf:	48 89 de             	mov    %rbx,%rsi
   182d2:	ff 15 78 56 04 00    	call   *0x45678(%rip)        # 5d950 <_DYNAMIC+0x388>
   182d8:	89 c3                	mov    %eax,%ebx
   182da:	4c 89 e7             	mov    %r12,%rdi
   182dd:	66 0f 6e 44 24 3c    	movd   0x3c(%rsp),%xmm0
   182e3:	ff 15 27 55 04 00    	call   *0x45527(%rip)        # 5d810 <_DYNAMIC+0x248>
   182e9:	a8 01                	test   $0x1,%al
   182eb:	74 0c                	je     182f9 <hyperinterval_strict_surface32+0x2c9>
   182ed:	4c 89 fb             	mov    %r15,%rbx
   182f0:	41 88 57 04          	mov    %dl,0x4(%r15)
   182f4:	e9 05 fe ff ff       	jmp    180fe <hyperinterval_strict_surface32+0xce>
   182f9:	0f b6 44 24 2c       	movzbl 0x2c(%rsp),%eax
   182fe:	88 44 24 08          	mov    %al,0x8(%rsp)
   18302:	44 88 74 24 09       	mov    %r14b,0x9(%rsp)
   18307:	40 88 6c 24 0a       	mov    %bpl,0xa(%rsp)
   1830c:	88 5c 24 0b          	mov    %bl,0xb(%rsp)
   18310:	88 54 24 0c          	mov    %dl,0xc(%rsp)
   18314:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   18319:	41 83 fd 01          	cmp    $0x1,%r13d
   1831d:	75 2a                	jne    18349 <hyperinterval_strict_surface32+0x319>
   1831f:	f3 0f 7e 44 24 44    	movq   0x44(%rsp),%xmm0
   18325:	66 0f ef c9          	pxor   %xmm1,%xmm1
   18329:	66 0f 6f 15 8f d9 fe 	movdqa -0x12671(%rip),%xmm2        # 5cc0 <__abi_tag+0x59c4>
   18330:	ff 
   18331:	66 0f ef d0          	pxor   %xmm0,%xmm2
   18335:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   18339:	66 0f df ca          	pandn  %xmm2,%xmm1
   1833d:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   18342:	b8 01 00 00 00       	mov    $0x1,%eax
   18347:	eb 02                	jmp    1834b <hyperinterval_strict_surface32+0x31b>
   18349:	31 c0                	xor    %eax,%eax
   1834b:	89 44 24 4c          	mov    %eax,0x4c(%rsp)
   1834f:	66 0f d6 44 24 50    	movq   %xmm0,0x50(%rsp)
   18355:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1835a:	48 8d 74 24 64       	lea    0x64(%rsp),%rsi
   1835f:	48 8d 54 24 4c       	lea    0x4c(%rsp),%rdx
   18364:	ff 15 ee 55 04 00    	call   *0x455ee(%rip)        # 5d958 <_DYNAMIC+0x390>
   1836a:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1836e:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   18373:	83 f9 02             	cmp    $0x2,%ecx
   18376:	4c 89 fb             	mov    %r15,%rbx
   18379:	0f 84 ee fc ff ff    	je     1806d <hyperinterval_strict_surface32+0x3d>
   1837f:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   18383:	8b 74 24 10          	mov    0x10(%rsp),%esi
   18387:	89 74 24 38          	mov    %esi,0x38(%rsp)
   1838b:	89 54 24 35          	mov    %edx,0x35(%rsp)
   1838f:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   18393:	88 44 24 34          	mov    %al,0x34(%rsp)
   18397:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1839c:	66 0f 6e 05 80 d8 fe 	movd   -0x12780(%rip),%xmm0        # 5c24 <__abi_tag+0x5928>
   183a3:	ff 
   183a4:	ff 15 e6 54 04 00    	call   *0x454e6(%rip)        # 5d890 <_DYNAMIC+0x2c8>
   183aa:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   183ae:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   183b3:	83 f9 02             	cmp    $0x2,%ecx
   183b6:	0f 84 b1 fc ff ff    	je     1806d <hyperinterval_strict_surface32+0x3d>
   183bc:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   183c0:	8b 74 24 10          	mov    0x10(%rsp),%esi
   183c4:	89 74 24 78          	mov    %esi,0x78(%rsp)
   183c8:	89 54 24 75          	mov    %edx,0x75(%rsp)
   183cc:	89 4c 24 70          	mov    %ecx,0x70(%rsp)
   183d0:	88 44 24 74          	mov    %al,0x74(%rsp)
   183d4:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   183d9:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   183de:	48 89 df             	mov    %rbx,%rdi
   183e1:	ff 15 79 55 04 00    	call   *0x45579(%rip)        # 5d960 <_DYNAMIC+0x398>
   183e7:	e9 19 fd ff ff       	jmp    18105 <hyperinterval_strict_surface32+0xd5>
   183ec:	cc                   	int3
   183ed:	cc                   	int3
   183ee:	cc                   	int3
   183ef:	cc                   	int3

hyperinterval_strict_surface64:
   183f0:	55                   	push   %rbp
   183f1:	41 57                	push   %r15
   183f3:	41 56                	push   %r14
   183f5:	41 55                	push   %r13
   183f7:	41 54                	push   %r12
   183f9:	53                   	push   %rbx
   183fa:	48 81 ec 48 01 00 00 	sub    $0x148,%rsp
   18401:	89 f5                	mov    %esi,%ebp
   18403:	48 89 fb             	mov    %rdi,%rbx
   18406:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1840b:	f2 0f 11 84 24 80 00 	movsd  %xmm0,0x80(%rsp)
   18412:	00 00 
   18414:	66 0f d6 4c 24 60    	movq   %xmm1,0x60(%rsp)
   1841a:	ff 15 88 54 04 00    	call   *0x45488(%rip)        # 5d8a8 <_DYNAMIC+0x2e0>
   18420:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   18425:	49 83 fc 02          	cmp    $0x2,%r12
   18429:	75 07                	jne    18432 <hyperinterval_strict_surface64+0x42>
   1842b:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   18430:	eb 78                	jmp    184aa <hyperinterval_strict_surface64+0xba>
   18432:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
   18437:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
   1843c:	4c 89 a4 24 00 01 00 	mov    %r12,0x100(%rsp)
   18443:	00 
   18444:	4c 89 bc 24 08 01 00 	mov    %r15,0x108(%rsp)
   1844b:	00 
   1844c:	4c 89 b4 24 10 01 00 	mov    %r14,0x110(%rsp)
   18453:	00 
   18454:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
   1845b:	00 
   1845c:	f2 0f 10 84 24 80 00 	movsd  0x80(%rsp),%xmm0
   18463:	00 00 
   18465:	ff 15 fd 54 04 00    	call   *0x454fd(%rip)        # 5d968 <_DYNAMIC+0x3a0>
   1846b:	80 bc 24 a0 00 00 00 	cmpb   $0x1,0xa0(%rsp)
   18472:	01 
   18473:	74 2d                	je     184a2 <hyperinterval_strict_surface64+0xb2>
   18475:	f2 0f 10 84 24 a8 00 	movsd  0xa8(%rsp),%xmm0
   1847c:	00 00 
   1847e:	f2 0f 11 44 24 58    	movsd  %xmm0,0x58(%rsp)
   18484:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
   1848b:	00 
   1848c:	f2 0f 10 44 24 60    	movsd  0x60(%rsp),%xmm0
   18492:	ff 15 d8 54 04 00    	call   *0x454d8(%rip)        # 5d970 <_DYNAMIC+0x3a8>
   18498:	80 bc 24 a0 00 00 00 	cmpb   $0x1,0xa0(%rsp)
   1849f:	01 
   184a0:	75 27                	jne    184c9 <hyperinterval_strict_surface64+0xd9>
   184a2:	0f b6 84 24 a1 00 00 	movzbl 0xa1(%rsp),%eax
   184a9:	00 
   184aa:	88 43 08             	mov    %al,0x8(%rbx)
   184ad:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   184b4:	48 89 d8             	mov    %rbx,%rax
   184b7:	48 81 c4 48 01 00 00 	add    $0x148,%rsp
   184be:	5b                   	pop    %rbx
   184bf:	41 5c                	pop    %r12
   184c1:	41 5d                	pop    %r13
   184c3:	41 5e                	pop    %r14
   184c5:	41 5f                	pop    %r15
   184c7:	5d                   	pop    %rbp
   184c8:	c3                   	ret
   184c9:	f3 0f 7e 8c 24 a8 00 	movq   0xa8(%rsp),%xmm1
   184d0:	00 00 
   184d2:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   184d7:	f2 0f 10 44 24 58    	movsd  0x58(%rsp),%xmm0
   184dd:	ff 15 c5 53 04 00    	call   *0x453c5(%rip)        # 5d8a8 <_DYNAMIC+0x2e0>
   184e3:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   184e8:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   184ed:	48 83 f9 02          	cmp    $0x2,%rcx
   184f1:	74 b7                	je     184aa <hyperinterval_strict_surface64+0xba>
   184f3:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   184f8:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   184fd:	48 89 b4 24 f8 00 00 	mov    %rsi,0xf8(%rsp)
   18504:	00 
   18505:	48 89 94 24 f1 00 00 	mov    %rdx,0xf1(%rsp)
   1850c:	00 
   1850d:	48 89 8c 24 e8 00 00 	mov    %rcx,0xe8(%rsp)
   18514:	00 
   18515:	88 84 24 f0 00 00 00 	mov    %al,0xf0(%rsp)
   1851c:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   18521:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
   18528:	00 
   18529:	89 ea                	mov    %ebp,%edx
   1852b:	ff 15 47 54 04 00    	call   *0x45447(%rip)        # 5d978 <_DYNAMIC+0x3b0>
   18531:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   18536:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   1853b:	48 83 f9 02          	cmp    $0x2,%rcx
   1853f:	0f 84 65 ff ff ff    	je     184aa <hyperinterval_strict_surface64+0xba>
   18545:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   1854a:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1854f:	48 89 b4 24 b0 00 00 	mov    %rsi,0xb0(%rsp)
   18556:	00 
   18557:	48 89 94 24 a9 00 00 	mov    %rdx,0xa9(%rsp)
   1855e:	00 
   1855f:	48 89 8c 24 a0 00 00 	mov    %rcx,0xa0(%rsp)
   18566:	00 
   18567:	88 84 24 a8 00 00 00 	mov    %al,0xa8(%rsp)
   1856e:	48 8d bc 24 88 00 00 	lea    0x88(%rsp),%rdi
   18575:	00 
   18576:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
   1857d:	00 
   1857e:	ff 15 fc 53 04 00    	call   *0x453fc(%rip)        # 5d980 <_DYNAMIC+0x3b8>
   18584:	48 8b 8c 24 88 00 00 	mov    0x88(%rsp),%rcx
   1858b:	00 
   1858c:	0f b6 84 24 90 00 00 	movzbl 0x90(%rsp),%eax
   18593:	00 
   18594:	48 83 f9 02          	cmp    $0x2,%rcx
   18598:	0f 84 0c ff ff ff    	je     184aa <hyperinterval_strict_surface64+0xba>
   1859e:	48 8b 94 24 91 00 00 	mov    0x91(%rsp),%rdx
   185a5:	00 
   185a6:	48 8b b4 24 98 00 00 	mov    0x98(%rsp),%rsi
   185ad:	00 
   185ae:	48 89 74 24 78       	mov    %rsi,0x78(%rsp)
   185b3:	48 89 54 24 71       	mov    %rdx,0x71(%rsp)
   185b8:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
   185bd:	88 44 24 70          	mov    %al,0x70(%rsp)
   185c1:	4c 8d ac 24 30 01 00 	lea    0x130(%rsp),%r13
   185c8:	00 
   185c9:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
   185ce:	48 8d 94 24 e8 00 00 	lea    0xe8(%rsp),%rdx
   185d5:	00 
   185d6:	4c 89 ef             	mov    %r13,%rdi
   185d9:	ff 15 a9 53 04 00    	call   *0x453a9(%rip)        # 5d988 <_DYNAMIC+0x3c0>
   185df:	48 8d ac 24 18 01 00 	lea    0x118(%rsp),%rbp
   185e6:	00 
   185e7:	48 8d 94 24 00 01 00 	lea    0x100(%rsp),%rdx
   185ee:	00 
   185ef:	48 89 ef             	mov    %rbp,%rdi
   185f2:	4c 89 ee             	mov    %r13,%rsi
   185f5:	ff 15 95 53 04 00    	call   *0x45395(%rip)        # 5d990 <_DYNAMIC+0x3c8>
   185fb:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   18600:	48 89 ee             	mov    %rbp,%rsi
   18603:	e8 68 f5 ff ff       	call   17b70 <<hyperinterval::float::F64Enclosure>::abs>
   18608:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1860d:	48 89 ee             	mov    %rbp,%rsi
   18610:	48 8d 94 24 e8 00 00 	lea    0xe8(%rsp),%rdx
   18617:	00 
   18618:	ff 15 7a 53 04 00    	call   *0x4537a(%rip)        # 5d998 <_DYNAMIC+0x3d0>
   1861e:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   18623:	48 89 ee             	mov    %rbp,%rsi
   18626:	48 8d 94 24 e8 00 00 	lea    0xe8(%rsp),%rdx
   1862d:	00 
   1862e:	ff 15 6c 53 04 00    	call   *0x4536c(%rip)        # 5d9a0 <_DYNAMIC+0x3d8>
   18634:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   18639:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
   18640:	00 
   18641:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
   18646:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
   1864b:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
   18650:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
   18655:	0f 29 9c 24 d0 00 00 	movaps %xmm3,0xd0(%rsp)
   1865c:	00 
   1865d:	0f 29 94 24 c0 00 00 	movaps %xmm2,0xc0(%rsp)
   18664:	00 
   18665:	0f 29 8c 24 b0 00 00 	movaps %xmm1,0xb0(%rsp)
   1866c:	00 
   1866d:	0f 29 84 24 a0 00 00 	movaps %xmm0,0xa0(%rsp)
   18674:	00 
   18675:	48 8d 84 24 a0 00 00 	lea    0xa0(%rsp),%rax
   1867c:	00 
   1867d:	48 89 ef             	mov    %rbp,%rdi
   18680:	ff 15 22 53 04 00    	call   *0x45322(%rip)        # 5d9a8 <_DYNAMIC+0x3e0>
   18686:	48 8b 8c 24 18 01 00 	mov    0x118(%rsp),%rcx
   1868d:	00 
   1868e:	48 83 f9 01          	cmp    $0x1,%rcx
   18692:	75 27                	jne    186bb <hyperinterval_strict_surface64+0x2cb>
   18694:	48 8b b4 24 20 01 00 	mov    0x120(%rsp),%rsi
   1869b:	00 
   1869c:	48 8b bc 24 28 01 00 	mov    0x128(%rsp),%rdi
   186a3:	00 
   186a4:	48 39 fe             	cmp    %rdi,%rsi
   186a7:	0f 94 c2             	sete   %dl
   186aa:	66 48 0f 6e ce       	movq   %rsi,%xmm1
   186af:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   186b4:	be 01 00 00 00       	mov    $0x1,%esi
   186b9:	eb 04                	jmp    186bf <hyperinterval_strict_surface64+0x2cf>
   186bb:	31 d2                	xor    %edx,%edx
   186bd:	31 f6                	xor    %esi,%esi
   186bf:	80 f1 01             	xor    $0x1,%cl
   186c2:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
   186c7:	66 0f d6 4c 24 18    	movq   %xmm1,0x18(%rsp)
   186cd:	88 4c 24 20          	mov    %cl,0x20(%rsp)
   186d1:	88 54 24 21          	mov    %dl,0x21(%rsp)
   186d5:	88 44 24 22          	mov    %al,0x22(%rsp)
   186d9:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
   186de:	66 0f d6 44 24 30    	movq   %xmm0,0x30(%rsp)
   186e4:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
   186e9:	4c 8d ac 24 18 01 00 	lea    0x118(%rsp),%r13
   186f0:	00 
   186f1:	48 8d ac 24 e8 00 00 	lea    0xe8(%rsp),%rbp
   186f8:	00 
   186f9:	4c 89 ef             	mov    %r13,%rdi
   186fc:	48 89 ee             	mov    %rbp,%rsi
   186ff:	ff 15 ab 52 04 00    	call   *0x452ab(%rip)        # 5d9b0 <_DYNAMIC+0x3e8>
   18705:	88 44 24 60          	mov    %al,0x60(%rsp)
   18709:	4c 89 ef             	mov    %r13,%rdi
   1870c:	48 89 ee             	mov    %rbp,%rsi
   1870f:	ff 15 a3 52 04 00    	call   *0x452a3(%rip)        # 5d9b8 <_DYNAMIC+0x3f0>
   18715:	88 44 24 58          	mov    %al,0x58(%rsp)
   18719:	48 8d ac 24 00 01 00 	lea    0x100(%rsp),%rbp
   18720:	00 
   18721:	4c 89 ef             	mov    %r13,%rdi
   18724:	48 89 ee             	mov    %rbp,%rsi
   18727:	ff 15 93 52 04 00    	call   *0x45293(%rip)        # 5d9c0 <_DYNAMIC+0x3f8>
   1872d:	88 44 24 0f          	mov    %al,0xf(%rsp)
   18731:	4c 89 ef             	mov    %r13,%rdi
   18734:	48 89 ee             	mov    %rbp,%rsi
   18737:	ff 15 8b 52 04 00    	call   *0x4528b(%rip)        # 5d9c8 <_DYNAMIC+0x400>
   1873d:	89 c5                	mov    %eax,%ebp
   1873f:	4c 89 ef             	mov    %r13,%rdi
   18742:	f2 0f 10 84 24 80 00 	movsd  0x80(%rsp),%xmm0
   18749:	00 00 
   1874b:	ff 15 b7 50 04 00    	call   *0x450b7(%rip)        # 5d808 <_DYNAMIC+0x240>
   18751:	a8 01                	test   $0x1,%al
   18753:	74 08                	je     1875d <hyperinterval_strict_surface64+0x36d>
   18755:	88 53 08             	mov    %dl,0x8(%rbx)
   18758:	e9 50 fd ff ff       	jmp    184ad <hyperinterval_strict_surface64+0xbd>
   1875d:	0f b6 44 24 60       	movzbl 0x60(%rsp),%eax
   18762:	88 44 24 10          	mov    %al,0x10(%rsp)
   18766:	0f b6 44 24 58       	movzbl 0x58(%rsp),%eax
   1876b:	88 44 24 11          	mov    %al,0x11(%rsp)
   1876f:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
   18774:	88 44 24 12          	mov    %al,0x12(%rsp)
   18778:	40 88 6c 24 13       	mov    %bpl,0x13(%rsp)
   1877d:	88 54 24 14          	mov    %dl,0x14(%rsp)
   18781:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
   18786:	41 83 fc 01          	cmp    $0x1,%r12d
   1878a:	75 28                	jne    187b4 <hyperinterval_strict_surface64+0x3c4>
   1878c:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   18793:	00 00 80 
   18796:	4c 89 f1             	mov    %r14,%rcx
   18799:	48 31 c1             	xor    %rax,%rcx
   1879c:	4d 85 f6             	test   %r14,%r14
   1879f:	49 0f 44 ce          	cmove  %r14,%rcx
   187a3:	4c 31 f8             	xor    %r15,%rax
   187a6:	4d 85 ff             	test   %r15,%r15
   187a9:	49 0f 44 c7          	cmove  %r15,%rax
   187ad:	ba 01 00 00 00       	mov    $0x1,%edx
   187b2:	eb 02                	jmp    187b6 <hyperinterval_strict_surface64+0x3c6>
   187b4:	31 d2                	xor    %edx,%edx
   187b6:	48 89 94 24 88 00 00 	mov    %rdx,0x88(%rsp)
   187bd:	00 
   187be:	48 89 8c 24 90 00 00 	mov    %rcx,0x90(%rsp)
   187c5:	00 
   187c6:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
   187cd:	00 
   187ce:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   187d3:	48 8d b4 24 18 01 00 	lea    0x118(%rsp),%rsi
   187da:	00 
   187db:	48 8d 94 24 88 00 00 	lea    0x88(%rsp),%rdx
   187e2:	00 
   187e3:	ff 15 e7 51 04 00    	call   *0x451e7(%rip)        # 5d9d0 <_DYNAMIC+0x408>
   187e9:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   187ee:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   187f3:	48 83 f9 02          	cmp    $0x2,%rcx
   187f7:	0f 84 ad fc ff ff    	je     184aa <hyperinterval_strict_surface64+0xba>
   187fd:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   18802:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   18807:	48 89 74 24 78       	mov    %rsi,0x78(%rsp)
   1880c:	48 89 54 24 71       	mov    %rdx,0x71(%rsp)
   18811:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
   18816:	88 44 24 70          	mov    %al,0x70(%rsp)
   1881a:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1881f:	f2 0f 10 05 69 d3 fe 	movsd  -0x12c97(%rip),%xmm0        # 5b90 <__abi_tag+0x5894>
   18826:	ff 
   18827:	ff 15 93 50 04 00    	call   *0x45093(%rip)        # 5d8c0 <_DYNAMIC+0x2f8>
   1882d:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   18832:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   18837:	48 83 f9 02          	cmp    $0x2,%rcx
   1883b:	0f 84 69 fc ff ff    	je     184aa <hyperinterval_strict_surface64+0xba>
   18841:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   18846:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1884b:	48 89 b4 24 b0 00 00 	mov    %rsi,0xb0(%rsp)
   18852:	00 
   18853:	48 89 94 24 a9 00 00 	mov    %rdx,0xa9(%rsp)
   1885a:	00 
   1885b:	48 89 8c 24 a0 00 00 	mov    %rcx,0xa0(%rsp)
   18862:	00 
   18863:	88 84 24 a8 00 00 00 	mov    %al,0xa8(%rsp)
   1886a:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
   1886f:	48 8d 94 24 a0 00 00 	lea    0xa0(%rsp),%rdx
   18876:	00 
   18877:	48 89 df             	mov    %rbx,%rdi
   1887a:	ff 15 58 51 04 00    	call   *0x45158(%rip)        # 5d9d8 <_DYNAMIC+0x410>
   18880:	e9 2f fc ff ff       	jmp    184b4 <hyperinterval_strict_surface64+0xc4>
   18885:	cc                   	int3
   18886:	cc                   	int3
   18887:	cc                   	int3
   18888:	cc                   	int3
   18889:	cc                   	int3
   1888a:	cc                   	int3
   1888b:	cc                   	int3
   1888c:	cc                   	int3
   1888d:	cc                   	int3
   1888e:	cc                   	int3
   1888f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::reciprocal:
   188e0:	41 57                	push   %r15
   188e2:	41 56                	push   %r14
   188e4:	41 54                	push   %r12
   188e6:	53                   	push   %rbx
   188e7:	48 83 ec 28          	sub    $0x28,%rsp
   188eb:	48 89 fb             	mov    %rdi,%rbx
   188ee:	83 3e 00             	cmpl   $0x0,(%rsi)
   188f1:	74 5e                	je     18951 <<hyperinterval::float::F32Enclosure>::reciprocal+0x71>
   188f3:	49 89 f6             	mov    %rsi,%r14
   188f6:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   188fc:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18901:	be 00 00 00 80       	mov    $0x80000000,%esi
   18906:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1890b:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   18910:	e8 3b 40 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   18915:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1891a:	74 25                	je     18941 <<hyperinterval::float::F32Enclosure>::reciprocal+0x61>
   1891c:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   18921:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18926:	be 00 00 00 80       	mov    $0x80000000,%esi
   1892b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18930:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   18935:	e8 16 40 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1893a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1893f:	75 25                	jne    18966 <<hyperinterval::float::F32Enclosure>::reciprocal+0x86>
   18941:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   18946:	88 4b 04             	mov    %cl,0x4(%rbx)
   18949:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1894f:	eb 06                	jmp    18957 <<hyperinterval::float::F32Enclosure>::reciprocal+0x77>
   18951:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   18957:	48 89 d8             	mov    %rbx,%rax
   1895a:	48 83 c4 28          	add    $0x28,%rsp
   1895e:	5b                   	pop    %rbx
   1895f:	41 5c                	pop    %r12
   18961:	41 5e                	pop    %r14
   18963:	41 5f                	pop    %r15
   18965:	c3                   	ret
   18966:	8b 44 24 10          	mov    0x10(%rsp),%eax
   1896a:	44 89 e1             	mov    %r12d,%ecx
   1896d:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18973:	89 c2                	mov    %eax,%edx
   18975:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1897b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18980:	29 ce                	sub    %ecx,%esi
   18982:	44 09 f9             	or     %r15d,%ecx
   18985:	45 85 e4             	test   %r12d,%r12d
   18988:	48 0f 49 f1          	cmovns %rcx,%rsi
   1898c:	89 d1                	mov    %edx,%ecx
   1898e:	44 09 f9             	or     %r15d,%ecx
   18991:	41 29 d7             	sub    %edx,%r15d
   18994:	85 c0                	test   %eax,%eax
   18996:	4c 0f 49 f9          	cmovns %rcx,%r15
   1899a:	b1 01                	mov    $0x1,%cl
   1899c:	44 39 fe             	cmp    %r15d,%esi
   1899f:	77 a5                	ja     18946 <<hyperinterval::float::F32Enclosure>::reciprocal+0x66>
   189a1:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%rsp)
   189a8:	00 
   189a9:	44 89 64 24 20       	mov    %r12d,0x20(%rsp)
   189ae:	89 44 24 24          	mov    %eax,0x24(%rsp)
   189b2:	41 83 7e 04 00       	cmpl   $0x0,0x4(%r14)
   189b7:	7f 15                	jg     189ce <<hyperinterval::float::F32Enclosure>::reciprocal+0xee>
   189b9:	41 8b 46 08          	mov    0x8(%r14),%eax
   189bd:	85 c0                	test   %eax,%eax
   189bf:	0f 99 c1             	setns  %cl
   189c2:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   189c7:	0f 94 c0             	sete   %al
   189ca:	08 c8                	or     %cl,%al
   189cc:	75 1a                	jne    189e8 <<hyperinterval::float::F32Enclosure>::reciprocal+0x108>
   189ce:	48 8d 74 24 1c       	lea    0x1c(%rsp),%rsi
   189d3:	48 89 df             	mov    %rbx,%rdi
   189d6:	4c 89 f2             	mov    %r14,%rdx
   189d9:	b9 01 00 00 00       	mov    $0x1,%ecx
   189de:	e8 8d 02 00 00       	call   18c70 <<hyperinterval::float::F32Enclosure>::corner_image>
   189e3:	e9 6f ff ff ff       	jmp    18957 <<hyperinterval::float::F32Enclosure>::reciprocal+0x77>
   189e8:	c6 43 04 06          	movb   $0x6,0x4(%rbx)
   189ec:	e9 58 ff ff ff       	jmp    18949 <<hyperinterval::float::F32Enclosure>::reciprocal+0x69>
   189f1:	cc                   	int3
   189f2:	cc                   	int3
   189f3:	cc                   	int3
   189f4:	cc                   	int3
   189f5:	cc                   	int3
   189f6:	cc                   	int3
   189f7:	cc                   	int3
   189f8:	cc                   	int3
   189f9:	cc                   	int3
   189fa:	cc                   	int3
   189fb:	cc                   	int3
   189fc:	cc                   	int3
   189fd:	cc                   	int3
   189fe:	cc                   	int3
   189ff:	cc                   	int3

<hyperinterval::float::F32Enclosure>::checked_pow:
   18a00:	55                   	push   %rbp
   18a01:	41 57                	push   %r15
   18a03:	41 56                	push   %r14
   18a05:	41 55                	push   %r13
   18a07:	41 54                	push   %r12
   18a09:	53                   	push   %rbx
   18a0a:	48 83 ec 38          	sub    $0x38,%rsp
   18a0e:	48 89 fb             	mov    %rdi,%rbx
   18a11:	83 fa 02             	cmp    $0x2,%edx
   18a14:	75 0e                	jne    18a24 <<hyperinterval::float::F32Enclosure>::checked_pow+0x24>
   18a16:	48 89 df             	mov    %rbx,%rdi
   18a19:	ff 15 69 4e 04 00    	call   *0x44e69(%rip)        # 5d888 <_DYNAMIC+0x2c0>
   18a1f:	e9 c8 00 00 00       	jmp    18aec <<hyperinterval::float::F32Enclosure>::checked_pow+0xec>
   18a24:	f6 06 01             	testb  $0x1,(%rsi)
   18a27:	0f 84 b9 00 00 00    	je     18ae6 <<hyperinterval::float::F32Enclosure>::checked_pow+0xe6>
   18a2d:	89 d5                	mov    %edx,%ebp
   18a2f:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
   18a33:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   18a37:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18a3c:	be 00 00 00 80       	mov    $0x80000000,%esi
   18a41:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18a46:	4c 89 f9             	mov    %r15,%rcx
   18a49:	41 89 e8             	mov    %ebp,%r8d
   18a4c:	e8 0f 4e 00 00       	call   1d860 <<hyperinterval::ieee::Format>::power>
   18a51:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   18a56:	75 7e                	jne    18ad6 <<hyperinterval::float::F32Enclosure>::checked_pow+0xd6>
   18a58:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   18a5d:	44 8b 6c 24 18       	mov    0x18(%rsp),%r13d
   18a62:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18a67:	be 00 00 00 80       	mov    $0x80000000,%esi
   18a6c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18a71:	4c 89 f1             	mov    %r14,%rcx
   18a74:	41 89 e8             	mov    %ebp,%r8d
   18a77:	e8 e4 4d 00 00       	call   1d860 <<hyperinterval::ieee::Format>::power>
   18a7c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18a81:	74 53                	je     18ad6 <<hyperinterval::float::F32Enclosure>::checked_pow+0xd6>
   18a83:	8b 44 24 10          	mov    0x10(%rsp),%eax
   18a87:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   18a8c:	8b 44 24 18          	mov    0x18(%rsp),%eax
   18a90:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   18a95:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18a9a:	be 00 00 00 80       	mov    $0x80000000,%esi
   18a9f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18aa4:	4c 89 e1             	mov    %r12,%rcx
   18aa7:	e8 a4 3e 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   18aac:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18ab1:	74 23                	je     18ad6 <<hyperinterval::float::F32Enclosure>::checked_pow+0xd6>
   18ab3:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   18ab8:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18abd:	be 00 00 00 80       	mov    $0x80000000,%esi
   18ac2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18ac7:	4c 89 e9             	mov    %r13,%rcx
   18aca:	e8 81 3e 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   18acf:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18ad4:	75 28                	jne    18afe <<hyperinterval::float::F32Enclosure>::checked_pow+0xfe>
   18ad6:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   18adb:	88 43 04             	mov    %al,0x4(%rbx)
   18ade:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18ae4:	eb 06                	jmp    18aec <<hyperinterval::float::F32Enclosure>::checked_pow+0xec>
   18ae6:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   18aec:	48 89 d8             	mov    %rbx,%rax
   18aef:	48 83 c4 38          	add    $0x38,%rsp
   18af3:	5b                   	pop    %rbx
   18af4:	41 5c                	pop    %r12
   18af6:	41 5d                	pop    %r13
   18af8:	41 5e                	pop    %r14
   18afa:	41 5f                	pop    %r15
   18afc:	5d                   	pop    %rbp
   18afd:	c3                   	ret
   18afe:	8b 7c 24 10          	mov    0x10(%rsp),%edi
   18b02:	44 89 e0             	mov    %r12d,%eax
   18b05:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18b0a:	89 f9                	mov    %edi,%ecx
   18b0c:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18b12:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18b17:	29 c2                	sub    %eax,%edx
   18b19:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   18b1f:	44 09 e8             	or     %r13d,%eax
   18b22:	45 85 e4             	test   %r12d,%r12d
   18b25:	48 0f 49 d0          	cmovns %rax,%rdx
   18b29:	be 00 00 00 80       	mov    $0x80000000,%esi
   18b2e:	29 ce                	sub    %ecx,%esi
   18b30:	89 c8                	mov    %ecx,%eax
   18b32:	44 09 e8             	or     %r13d,%eax
   18b35:	85 ff                	test   %edi,%edi
   18b37:	48 0f 49 f0          	cmovns %rax,%rsi
   18b3b:	b0 01                	mov    $0x1,%al
   18b3d:	39 f2                	cmp    %esi,%edx
   18b3f:	77 9a                	ja     18adb <<hyperinterval::float::F32Enclosure>::checked_pow+0xdb>
   18b41:	89 7c 24 2c          	mov    %edi,0x2c(%rsp)
   18b45:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18b4a:	be 00 00 00 80       	mov    $0x80000000,%esi
   18b4f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18b54:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   18b59:	e8 f2 3d 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   18b5e:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18b63:	0f 84 6d ff ff ff    	je     18ad6 <<hyperinterval::float::F32Enclosure>::checked_pow+0xd6>
   18b69:	4c 89 64 24 20       	mov    %r12,0x20(%rsp)
   18b6e:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   18b73:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18b78:	be 00 00 00 80       	mov    $0x80000000,%esi
   18b7d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18b82:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
   18b87:	e8 c4 3d 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   18b8c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18b91:	0f 84 3f ff ff ff    	je     18ad6 <<hyperinterval::float::F32Enclosure>::checked_pow+0xd6>
   18b97:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   18b9b:	44 89 e0             	mov    %r12d,%eax
   18b9e:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18ba3:	89 ca                	mov    %ecx,%edx
   18ba5:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18bab:	be 00 00 00 80       	mov    $0x80000000,%esi
   18bb0:	29 c6                	sub    %eax,%esi
   18bb2:	44 09 e8             	or     %r13d,%eax
   18bb5:	45 85 e4             	test   %r12d,%r12d
   18bb8:	48 0f 49 f0          	cmovns %rax,%rsi
   18bbc:	89 d0                	mov    %edx,%eax
   18bbe:	44 09 e8             	or     %r13d,%eax
   18bc1:	41 29 d5             	sub    %edx,%r13d
   18bc4:	85 c9                	test   %ecx,%ecx
   18bc6:	4c 0f 49 e8          	cmovns %rax,%r13
   18bca:	b0 01                	mov    $0x1,%al
   18bcc:	44 39 ee             	cmp    %r13d,%esi
   18bcf:	0f 87 06 ff ff ff    	ja     18adb <<hyperinterval::float::F32Enclosure>::checked_pow+0xdb>
   18bd5:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
   18bda:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
   18bde:	44 89 e2             	mov    %r12d,%edx
   18be1:	e8 da 56 00 00       	call   1e2c0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   18be6:	41 89 c5             	mov    %eax,%r13d
   18be9:	41 89 d4             	mov    %edx,%r12d
   18bec:	85 ed                	test   %ebp,%ebp
   18bee:	0f 95 c0             	setne  %al
   18bf1:	40 f6 c5 01          	test   $0x1,%bpl
   18bf5:	0f 94 c1             	sete   %cl
   18bf8:	84 c8                	test   %cl,%al
   18bfa:	74 11                	je     18c0d <<hyperinterval::float::F32Enclosure>::checked_pow+0x20d>
   18bfc:	44 89 ff             	mov    %r15d,%edi
   18bff:	44 89 f6             	mov    %r14d,%esi
   18c02:	31 d2                	xor    %edx,%edx
   18c04:	e8 47 57 00 00       	call   1e350 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::signs>
   18c09:	a8 02                	test   $0x2,%al
   18c0b:	75 13                	jne    18c20 <<hyperinterval::float::F32Enclosure>::checked_pow+0x220>
   18c0d:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   18c13:	44 89 6b 04          	mov    %r13d,0x4(%rbx)
   18c17:	44 89 63 08          	mov    %r12d,0x8(%rbx)
   18c1b:	e9 cc fe ff ff       	jmp    18aec <<hyperinterval::float::F32Enclosure>::checked_pow+0xec>
   18c20:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18c25:	31 f6                	xor    %esi,%esi
   18c27:	31 d2                	xor    %edx,%edx
   18c29:	e8 92 18 00 00       	call   1a4c0 <<hyperinterval::float::F32Enclosure>::from_bits>
   18c2e:	8b 44 24 08          	mov    0x8(%rsp),%eax
   18c32:	83 f8 02             	cmp    $0x2,%eax
   18c35:	75 0a                	jne    18c41 <<hyperinterval::float::F32Enclosure>::checked_pow+0x241>
   18c37:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   18c3c:	e9 9a fe ff ff       	jmp    18adb <<hyperinterval::float::F32Enclosure>::checked_pow+0xdb>
   18c41:	83 f8 01             	cmp    $0x1,%eax
   18c44:	75 c7                	jne    18c0d <<hyperinterval::float::F32Enclosure>::checked_pow+0x20d>
   18c46:	8b 54 24 0c          	mov    0xc(%rsp),%edx
   18c4a:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   18c4e:	44 89 ef             	mov    %r13d,%edi
   18c51:	44 89 e6             	mov    %r12d,%esi
   18c54:	e8 67 56 00 00       	call   1e2c0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   18c59:	41 89 c5             	mov    %eax,%r13d
   18c5c:	41 89 d4             	mov    %edx,%r12d
   18c5f:	eb ac                	jmp    18c0d <<hyperinterval::float::F32Enclosure>::checked_pow+0x20d>
   18c61:	cc                   	int3
   18c62:	cc                   	int3
   18c63:	cc                   	int3
   18c64:	cc                   	int3
   18c65:	cc                   	int3
   18c66:	cc                   	int3
   18c67:	cc                   	int3
   18c68:	cc                   	int3
   18c69:	cc                   	int3
   18c6a:	cc                   	int3
   18c6b:	cc                   	int3
   18c6c:	cc                   	int3
   18c6d:	cc                   	int3
   18c6e:	cc                   	int3
   18c6f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::corner_image:
   18c70:	55                   	push   %rbp
   18c71:	41 57                	push   %r15
   18c73:	41 56                	push   %r14
   18c75:	41 55                	push   %r13
   18c77:	41 54                	push   %r12
   18c79:	53                   	push   %rbx
   18c7a:	48 83 ec 58          	sub    $0x58,%rsp
   18c7e:	48 89 fb             	mov    %rdi,%rbx
   18c81:	f6 06 01             	testb  $0x1,(%rsi)
   18c84:	74 49                	je     18ccf <<hyperinterval::float::F32Enclosure>::corner_image+0x5f>
   18c86:	f6 02 01             	testb  $0x1,(%rdx)
   18c89:	74 44                	je     18ccf <<hyperinterval::float::F32Enclosure>::corner_image+0x5f>
   18c8b:	44 8b 62 04          	mov    0x4(%rdx),%r12d
   18c8f:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   18c93:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
   18c97:	8b 46 08             	mov    0x8(%rsi),%eax
   18c9a:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   18c9f:	84 c9                	test   %cl,%cl
   18ca1:	74 37                	je     18cda <<hyperinterval::float::F32Enclosure>::corner_image+0x6a>
   18ca3:	48 89 e7             	mov    %rsp,%rdi
   18ca6:	be 00 00 00 80       	mov    $0x80000000,%esi
   18cab:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18cb0:	4c 89 e9             	mov    %r13,%rcx
   18cb3:	4d 89 e0             	mov    %r12,%r8
   18cb6:	e8 85 3f 00 00       	call   1cc40 <<hyperinterval::ieee::Format>::div>
   18cbb:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18cbf:	0f 84 bf 00 00 00    	je     18d84 <<hyperinterval::float::F32Enclosure>::corner_image+0x114>
   18cc5:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   18cca:	e9 ad 00 00 00       	jmp    18d7c <<hyperinterval::float::F32Enclosure>::corner_image+0x10c>
   18ccf:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   18cd5:	e9 42 03 00 00       	jmp    1901c <<hyperinterval::float::F32Enclosure>::corner_image+0x3ac>
   18cda:	44 89 e8             	mov    %r13d,%eax
   18cdd:	c1 e8 17             	shr    $0x17,%eax
   18ce0:	0f b6 d0             	movzbl %al,%edx
   18ce3:	44 89 ee             	mov    %r13d,%esi
   18ce6:	81 e6 ff ff 7f 00    	and    $0x7fffff,%esi
   18cec:	31 c9                	xor    %ecx,%ecx
   18cee:	85 d2                	test   %edx,%edx
   18cf0:	0f 95 c1             	setne  %cl
   18cf3:	b8 01 00 00 00       	mov    $0x1,%eax
   18cf8:	0f 45 c2             	cmovne %edx,%eax
   18cfb:	c1 e1 17             	shl    $0x17,%ecx
   18cfe:	48 09 f1             	or     %rsi,%rcx
   18d01:	44 89 e2             	mov    %r12d,%edx
   18d04:	c1 ea 17             	shr    $0x17,%edx
   18d07:	0f b6 d2             	movzbl %dl,%edx
   18d0a:	44 89 e6             	mov    %r12d,%esi
   18d0d:	81 e6 ff ff 7f 00    	and    $0x7fffff,%esi
   18d13:	8d ba d4 fe ff ff    	lea    -0x12c(%rdx),%edi
   18d19:	45 31 c0             	xor    %r8d,%r8d
   18d1c:	85 d2                	test   %edx,%edx
   18d1e:	ba d5 fe ff ff       	mov    $0xfffffed5,%edx
   18d23:	0f 45 d7             	cmovne %edi,%edx
   18d26:	41 0f 95 c0          	setne  %r8b
   18d2a:	41 c1 e0 17          	shl    $0x17,%r8d
   18d2e:	49 09 f0             	or     %rsi,%r8
   18d31:	4c 0f af c1          	imul   %rcx,%r8
   18d35:	44 89 e9             	mov    %r13d,%ecx
   18d38:	44 31 e1             	xor    %r12d,%ecx
   18d3b:	01 c2                	add    %eax,%edx
   18d3d:	c1 e9 1f             	shr    $0x1f,%ecx
   18d40:	88 4c 24 14          	mov    %cl,0x14(%rsp)
   18d44:	4c 89 04 24          	mov    %r8,(%rsp)
   18d48:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   18d4f:	00 00 
   18d51:	89 54 24 10          	mov    %edx,0x10(%rsp)
   18d55:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   18d5a:	48 89 e1             	mov    %rsp,%rcx
   18d5d:	be 00 00 00 80       	mov    $0x80000000,%esi
   18d62:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18d67:	e8 f4 4e 00 00       	call   1dc60 <<hyperinterval::ieee::Format>::rounded>
   18d6c:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   18d71:	0f 84 54 02 00 00    	je     18fcb <<hyperinterval::float::F32Enclosure>::corner_image+0x35b>
   18d77:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   18d7c:	88 43 04             	mov    %al,0x4(%rbx)
   18d7f:	e9 92 02 00 00       	jmp    19016 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a6>
   18d84:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18d88:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   18d8d:	48 89 e7             	mov    %rsp,%rdi
   18d90:	be 00 00 00 80       	mov    $0x80000000,%esi
   18d95:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18d9a:	e8 b1 3b 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   18d9f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18da3:	0f 85 63 02 00 00    	jne    1900c <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   18da9:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   18dae:	48 89 e7             	mov    %rsp,%rdi
   18db1:	be 00 00 00 80       	mov    $0x80000000,%esi
   18db6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18dbb:	4c 89 f9             	mov    %r15,%rcx
   18dbe:	e8 8d 3b 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   18dc3:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18dc7:	0f 85 3f 02 00 00    	jne    1900c <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   18dcd:	8b 7c 24 08          	mov    0x8(%rsp),%edi
   18dd1:	89 e8                	mov    %ebp,%eax
   18dd3:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18dd8:	89 f9                	mov    %edi,%ecx
   18dda:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18de0:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18de5:	29 c2                	sub    %eax,%edx
   18de7:	be 00 00 00 80       	mov    $0x80000000,%esi
   18dec:	09 f0                	or     %esi,%eax
   18dee:	85 ed                	test   %ebp,%ebp
   18df0:	48 0f 49 d0          	cmovns %rax,%rdx
   18df4:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18df9:	29 c8                	sub    %ecx,%eax
   18dfb:	09 f1                	or     %esi,%ecx
   18dfd:	85 ff                	test   %edi,%edi
   18dff:	48 0f 49 c1          	cmovns %rcx,%rax
   18e03:	41 b7 01             	mov    $0x1,%r15b
   18e06:	39 c2                	cmp    %eax,%edx
   18e08:	0f 87 04 02 00 00    	ja     19012 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a2>
   18e0e:	89 7c 24 50          	mov    %edi,0x50(%rsp)
   18e12:	48 89 6c 24 28       	mov    %rbp,0x28(%rsp)
   18e17:	48 89 e7             	mov    %rsp,%rdi
   18e1a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18e1f:	4c 89 e9             	mov    %r13,%rcx
   18e22:	4d 89 f0             	mov    %r14,%r8
   18e25:	e8 16 3e 00 00       	call   1cc40 <<hyperinterval::ieee::Format>::div>
   18e2a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18e2e:	0f 85 91 fe ff ff    	jne    18cc5 <<hyperinterval::float::F32Enclosure>::corner_image+0x55>
   18e34:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18e38:	44 8b 6c 24 10       	mov    0x10(%rsp),%r13d
   18e3d:	48 89 e7             	mov    %rsp,%rdi
   18e40:	be 00 00 00 80       	mov    $0x80000000,%esi
   18e45:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18e4a:	e8 01 3b 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   18e4f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18e53:	0f 85 b3 01 00 00    	jne    1900c <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   18e59:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   18e5e:	48 89 e7             	mov    %rsp,%rdi
   18e61:	be 00 00 00 80       	mov    $0x80000000,%esi
   18e66:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18e6b:	4c 89 e9             	mov    %r13,%rcx
   18e6e:	e8 dd 3a 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   18e73:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18e77:	0f 85 8f 01 00 00    	jne    1900c <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   18e7d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18e81:	89 e8                	mov    %ebp,%eax
   18e83:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18e88:	89 ca                	mov    %ecx,%edx
   18e8a:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18e90:	be 00 00 00 80       	mov    $0x80000000,%esi
   18e95:	29 c6                	sub    %eax,%esi
   18e97:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18e9c:	09 f8                	or     %edi,%eax
   18e9e:	85 ed                	test   %ebp,%ebp
   18ea0:	48 0f 49 f0          	cmovns %rax,%rsi
   18ea4:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18ea9:	29 d0                	sub    %edx,%eax
   18eab:	09 fa                	or     %edi,%edx
   18ead:	85 c9                	test   %ecx,%ecx
   18eaf:	48 0f 49 c2          	cmovns %rdx,%rax
   18eb3:	39 c6                	cmp    %eax,%esi
   18eb5:	0f 87 57 01 00 00    	ja     19012 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a2>
   18ebb:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   18ec0:	8b 74 24 50          	mov    0x50(%rsp),%esi
   18ec4:	89 ea                	mov    %ebp,%edx
   18ec6:	e8 f5 53 00 00       	call   1e2c0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   18ecb:	89 c5                	mov    %eax,%ebp
   18ecd:	41 89 d5             	mov    %edx,%r13d
   18ed0:	48 89 e7             	mov    %rsp,%rdi
   18ed3:	be 00 00 00 80       	mov    $0x80000000,%esi
   18ed8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18edd:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   18ee2:	4d 89 e0             	mov    %r12,%r8
   18ee5:	e8 56 3d 00 00       	call   1cc40 <<hyperinterval::ieee::Format>::div>
   18eea:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18eee:	0f 85 d1 fd ff ff    	jne    18cc5 <<hyperinterval::float::F32Enclosure>::corner_image+0x55>
   18ef4:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18ef8:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   18efd:	48 89 e7             	mov    %rsp,%rdi
   18f00:	be 00 00 00 80       	mov    $0x80000000,%esi
   18f05:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18f0a:	e8 41 3a 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   18f0f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18f13:	0f 85 f3 00 00 00    	jne    1900c <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   18f19:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   18f1e:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   18f23:	48 89 e7             	mov    %rsp,%rdi
   18f26:	be 00 00 00 80       	mov    $0x80000000,%esi
   18f2b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18f30:	4c 89 e1             	mov    %r12,%rcx
   18f33:	e8 18 3a 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   18f38:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18f3c:	0f 85 ca 00 00 00    	jne    1900c <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   18f42:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18f46:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   18f4b:	89 d0                	mov    %edx,%eax
   18f4d:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18f52:	41 89 c8             	mov    %ecx,%r8d
   18f55:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18f5c:	be 00 00 00 80       	mov    $0x80000000,%esi
   18f61:	29 c6                	sub    %eax,%esi
   18f63:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18f68:	09 f8                	or     %edi,%eax
   18f6a:	85 d2                	test   %edx,%edx
   18f6c:	48 0f 49 f0          	cmovns %rax,%rsi
   18f70:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18f75:	44 29 c0             	sub    %r8d,%eax
   18f78:	41 09 f8             	or     %edi,%r8d
   18f7b:	85 c9                	test   %ecx,%ecx
   18f7d:	49 0f 49 c0          	cmovns %r8,%rax
   18f81:	39 c6                	cmp    %eax,%esi
   18f83:	0f 87 89 00 00 00    	ja     19012 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a2>
   18f89:	89 ef                	mov    %ebp,%edi
   18f8b:	44 89 ee             	mov    %r13d,%esi
   18f8e:	e8 2d 53 00 00       	call   1e2c0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   18f93:	41 89 c5             	mov    %eax,%r13d
   18f96:	41 89 d4             	mov    %edx,%r12d
   18f99:	48 89 e7             	mov    %rsp,%rdi
   18f9c:	be 00 00 00 80       	mov    $0x80000000,%esi
   18fa1:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18fa6:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   18fab:	4d 89 f0             	mov    %r14,%r8
   18fae:	e8 8d 3c 00 00       	call   1cc40 <<hyperinterval::ieee::Format>::div>
   18fb3:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18fb7:	0f 85 08 fd ff ff    	jne    18cc5 <<hyperinterval::float::F32Enclosure>::corner_image+0x55>
   18fbd:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18fc1:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   18fc6:	e9 62 02 00 00       	jmp    1922d <<hyperinterval::float::F32Enclosure>::corner_image+0x5bd>
   18fcb:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   18fcf:	44 8b 7c 24 40       	mov    0x40(%rsp),%r15d
   18fd4:	48 89 e7             	mov    %rsp,%rdi
   18fd7:	be 00 00 00 80       	mov    $0x80000000,%esi
   18fdc:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18fe1:	e8 6a 39 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   18fe6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18fea:	74 20                	je     1900c <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   18fec:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   18ff1:	48 89 e7             	mov    %rsp,%rdi
   18ff4:	be 00 00 00 80       	mov    $0x80000000,%esi
   18ff9:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18ffe:	4c 89 f9             	mov    %r15,%rcx
   19001:	e8 4a 39 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   19006:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1900a:	75 1f                	jne    1902b <<hyperinterval::float::F32Enclosure>::corner_image+0x3bb>
   1900c:	44 0f b6 7c 24 01    	movzbl 0x1(%rsp),%r15d
   19012:	44 88 7b 04          	mov    %r15b,0x4(%rbx)
   19016:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1901c:	48 83 c4 58          	add    $0x58,%rsp
   19020:	5b                   	pop    %rbx
   19021:	41 5c                	pop    %r12
   19023:	41 5d                	pop    %r13
   19025:	41 5e                	pop    %r14
   19027:	41 5f                	pop    %r15
   19029:	5d                   	pop    %rbp
   1902a:	c3                   	ret
   1902b:	8b 7c 24 08          	mov    0x8(%rsp),%edi
   1902f:	89 e8                	mov    %ebp,%eax
   19031:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19036:	89 f9                	mov    %edi,%ecx
   19038:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1903e:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19043:	29 c2                	sub    %eax,%edx
   19045:	be 00 00 00 80       	mov    $0x80000000,%esi
   1904a:	09 f0                	or     %esi,%eax
   1904c:	85 ed                	test   %ebp,%ebp
   1904e:	48 0f 49 d0          	cmovns %rax,%rdx
   19052:	b8 00 00 00 80       	mov    $0x80000000,%eax
   19057:	29 c8                	sub    %ecx,%eax
   19059:	09 f1                	or     %esi,%ecx
   1905b:	85 ff                	test   %edi,%edi
   1905d:	48 0f 49 c1          	cmovns %rcx,%rax
   19061:	41 b7 01             	mov    $0x1,%r15b
   19064:	39 c2                	cmp    %eax,%edx
   19066:	77 aa                	ja     19012 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a2>
   19068:	89 7c 24 28          	mov    %edi,0x28(%rsp)
   1906c:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   19071:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19076:	4c 89 e9             	mov    %r13,%rcx
   19079:	4d 89 f0             	mov    %r14,%r8
   1907c:	e8 ff 3f 00 00       	call   1d080 <<hyperinterval::ieee::Format>::mul>
   19081:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   19086:	0f 85 eb fc ff ff    	jne    18d77 <<hyperinterval::float::F32Enclosure>::corner_image+0x107>
   1908c:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   19090:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
   19095:	48 89 e7             	mov    %rsp,%rdi
   19098:	be 00 00 00 80       	mov    $0x80000000,%esi
   1909d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   190a2:	e8 a9 38 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   190a7:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   190ab:	0f 85 5b ff ff ff    	jne    1900c <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   190b1:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   190b6:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   190bb:	48 89 e7             	mov    %rsp,%rdi
   190be:	be 00 00 00 80       	mov    $0x80000000,%esi
   190c3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   190c8:	4c 89 e9             	mov    %r13,%rcx
   190cb:	e8 80 38 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   190d0:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   190d4:	0f 85 32 ff ff ff    	jne    1900c <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   190da:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   190de:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
   190e3:	89 d0                	mov    %edx,%eax
   190e5:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   190ea:	41 89 c8             	mov    %ecx,%r8d
   190ed:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   190f4:	be 00 00 00 80       	mov    $0x80000000,%esi
   190f9:	29 c6                	sub    %eax,%esi
   190fb:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19100:	09 f8                	or     %edi,%eax
   19102:	85 d2                	test   %edx,%edx
   19104:	48 0f 49 f0          	cmovns %rax,%rsi
   19108:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1910d:	44 29 c0             	sub    %r8d,%eax
   19110:	41 09 f8             	or     %edi,%r8d
   19113:	85 c9                	test   %ecx,%ecx
   19115:	49 0f 49 c0          	cmovns %r8,%rax
   19119:	39 c6                	cmp    %eax,%esi
   1911b:	0f 87 f1 fe ff ff    	ja     19012 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a2>
   19121:	89 ef                	mov    %ebp,%edi
   19123:	8b 74 24 28          	mov    0x28(%rsp),%esi
   19127:	e8 94 51 00 00       	call   1e2c0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   1912c:	89 c5                	mov    %eax,%ebp
   1912e:	41 89 d5             	mov    %edx,%r13d
   19131:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   19136:	be 00 00 00 80       	mov    $0x80000000,%esi
   1913b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19140:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   19145:	4d 89 e0             	mov    %r12,%r8
   19148:	e8 33 3f 00 00       	call   1d080 <<hyperinterval::ieee::Format>::mul>
   1914d:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   19152:	0f 85 1f fc ff ff    	jne    18d77 <<hyperinterval::float::F32Enclosure>::corner_image+0x107>
   19158:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   1915c:	44 8b 64 24 40       	mov    0x40(%rsp),%r12d
   19161:	48 89 e7             	mov    %rsp,%rdi
   19164:	be 00 00 00 80       	mov    $0x80000000,%esi
   19169:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1916e:	e8 dd 37 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   19173:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19177:	0f 85 8f fe ff ff    	jne    1900c <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   1917d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19182:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   19187:	48 89 e7             	mov    %rsp,%rdi
   1918a:	be 00 00 00 80       	mov    $0x80000000,%esi
   1918f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19194:	4c 89 e1             	mov    %r12,%rcx
   19197:	e8 b4 37 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1919c:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   191a0:	0f 85 66 fe ff ff    	jne    1900c <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   191a6:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   191aa:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   191af:	89 d0                	mov    %edx,%eax
   191b1:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   191b6:	41 89 c8             	mov    %ecx,%r8d
   191b9:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   191c0:	be 00 00 00 80       	mov    $0x80000000,%esi
   191c5:	29 c6                	sub    %eax,%esi
   191c7:	bf 00 00 00 80       	mov    $0x80000000,%edi
   191cc:	09 f8                	or     %edi,%eax
   191ce:	85 d2                	test   %edx,%edx
   191d0:	48 0f 49 f0          	cmovns %rax,%rsi
   191d4:	b8 00 00 00 80       	mov    $0x80000000,%eax
   191d9:	44 29 c0             	sub    %r8d,%eax
   191dc:	41 09 f8             	or     %edi,%r8d
   191df:	85 c9                	test   %ecx,%ecx
   191e1:	49 0f 49 c0          	cmovns %r8,%rax
   191e5:	39 c6                	cmp    %eax,%esi
   191e7:	0f 87 25 fe ff ff    	ja     19012 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a2>
   191ed:	89 ef                	mov    %ebp,%edi
   191ef:	44 89 ee             	mov    %r13d,%esi
   191f2:	e8 c9 50 00 00       	call   1e2c0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   191f7:	41 89 c5             	mov    %eax,%r13d
   191fa:	41 89 d4             	mov    %edx,%r12d
   191fd:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   19202:	be 00 00 00 80       	mov    $0x80000000,%esi
   19207:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1920c:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   19211:	4d 89 f0             	mov    %r14,%r8
   19214:	e8 67 3e 00 00       	call   1d080 <<hyperinterval::ieee::Format>::mul>
   19219:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   1921e:	0f 85 53 fb ff ff    	jne    18d77 <<hyperinterval::float::F32Enclosure>::corner_image+0x107>
   19224:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   19228:	44 8b 74 24 40       	mov    0x40(%rsp),%r14d
   1922d:	48 89 e7             	mov    %rsp,%rdi
   19230:	be 00 00 00 80       	mov    $0x80000000,%esi
   19235:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1923a:	e8 11 37 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1923f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19243:	0f 85 c3 fd ff ff    	jne    1900c <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   19249:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1924e:	48 89 e7             	mov    %rsp,%rdi
   19251:	be 00 00 00 80       	mov    $0x80000000,%esi
   19256:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1925b:	4c 89 f1             	mov    %r14,%rcx
   1925e:	e8 ed 36 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   19263:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19267:	0f 85 9f fd ff ff    	jne    1900c <<hyperinterval::float::F32Enclosure>::corner_image+0x39c>
   1926d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   19271:	89 e8                	mov    %ebp,%eax
   19273:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19278:	89 ca                	mov    %ecx,%edx
   1927a:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19280:	be 00 00 00 80       	mov    $0x80000000,%esi
   19285:	29 c6                	sub    %eax,%esi
   19287:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1928c:	09 f8                	or     %edi,%eax
   1928e:	85 ed                	test   %ebp,%ebp
   19290:	48 0f 49 f0          	cmovns %rax,%rsi
   19294:	89 d0                	mov    %edx,%eax
   19296:	09 f8                	or     %edi,%eax
   19298:	29 d7                	sub    %edx,%edi
   1929a:	85 c9                	test   %ecx,%ecx
   1929c:	48 0f 49 f8          	cmovns %rax,%rdi
   192a0:	39 fe                	cmp    %edi,%esi
   192a2:	0f 87 6a fd ff ff    	ja     19012 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a2>
   192a8:	44 89 ef             	mov    %r13d,%edi
   192ab:	44 89 e6             	mov    %r12d,%esi
   192ae:	89 ea                	mov    %ebp,%edx
   192b0:	e8 0b 50 00 00       	call   1e2c0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   192b5:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   192bb:	89 43 04             	mov    %eax,0x4(%rbx)
   192be:	89 53 08             	mov    %edx,0x8(%rbx)
   192c1:	e9 56 fd ff ff       	jmp    1901c <<hyperinterval::float::F32Enclosure>::corner_image+0x3ac>
   192c6:	cc                   	int3
   192c7:	cc                   	int3
   192c8:	cc                   	int3
   192c9:	cc                   	int3
   192ca:	cc                   	int3
   192cb:	cc                   	int3
   192cc:	cc                   	int3
   192cd:	cc                   	int3
   192ce:	cc                   	int3
   192cf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::intersection:
   192d0:	48 89 f8             	mov    %rdi,%rax
   192d3:	45 31 c9             	xor    %r9d,%r9d
   192d6:	f6 06 01             	testb  $0x1,(%rsi)
   192d9:	0f 84 ed 00 00 00    	je     193cc <<hyperinterval::float::F32Enclosure>::intersection+0xfc>
   192df:	f6 02 01             	testb  $0x1,(%rdx)
   192e2:	0f 84 d9 00 00 00    	je     193c1 <<hyperinterval::float::F32Enclosure>::intersection+0xf1>
   192e8:	53                   	push   %rbx
   192e9:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   192ed:	8b 4e 04             	mov    0x4(%rsi),%ecx
   192f0:	bf 00 00 00 80       	mov    $0x80000000,%edi
   192f5:	41 89 c9             	mov    %ecx,%r9d
   192f8:	41 09 f9             	or     %edi,%r9d
   192fb:	41 89 ca             	mov    %ecx,%r10d
   192fe:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   19305:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1930b:	45 29 d3             	sub    %r10d,%r11d
   1930e:	85 c9                	test   %ecx,%ecx
   19310:	4d 0f 49 d9          	cmovns %r9,%r11
   19314:	45 89 c1             	mov    %r8d,%r9d
   19317:	41 09 f9             	or     %edi,%r9d
   1931a:	45 89 c2             	mov    %r8d,%r10d
   1931d:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   19324:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   19329:	44 29 d3             	sub    %r10d,%ebx
   1932c:	45 85 c0             	test   %r8d,%r8d
   1932f:	49 0f 49 d9          	cmovns %r9,%rbx
   19333:	8b 52 08             	mov    0x8(%rdx),%edx
   19336:	41 39 db             	cmp    %ebx,%r11d
   19339:	41 0f 42 c8          	cmovb  %r8d,%ecx
   1933d:	44 8b 46 08          	mov    0x8(%rsi),%r8d
   19341:	44 89 c6             	mov    %r8d,%esi
   19344:	09 fe                	or     %edi,%esi
   19346:	45 89 c1             	mov    %r8d,%r9d
   19349:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   19350:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   19356:	45 29 ca             	sub    %r9d,%r10d
   19359:	45 85 c0             	test   %r8d,%r8d
   1935c:	4c 0f 49 d6          	cmovns %rsi,%r10
   19360:	89 d6                	mov    %edx,%esi
   19362:	09 fe                	or     %edi,%esi
   19364:	41 89 d1             	mov    %edx,%r9d
   19367:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1936e:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   19374:	45 29 cb             	sub    %r9d,%r11d
   19377:	85 d2                	test   %edx,%edx
   19379:	4c 0f 49 de          	cmovns %rsi,%r11
   1937d:	45 39 da             	cmp    %r11d,%r10d
   19380:	44 0f 47 c2          	cmova  %edx,%r8d
   19384:	89 ca                	mov    %ecx,%edx
   19386:	09 fa                	or     %edi,%edx
   19388:	89 ce                	mov    %ecx,%esi
   1938a:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   19390:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   19396:	41 29 f2             	sub    %esi,%r10d
   19399:	85 c9                	test   %ecx,%ecx
   1939b:	4c 0f 49 d2          	cmovns %rdx,%r10
   1939f:	44 89 c2             	mov    %r8d,%edx
   193a2:	09 fa                	or     %edi,%edx
   193a4:	44 89 c6             	mov    %r8d,%esi
   193a7:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   193ad:	29 f7                	sub    %esi,%edi
   193af:	45 85 c0             	test   %r8d,%r8d
   193b2:	48 0f 49 fa          	cmovns %rdx,%rdi
   193b6:	45 31 c9             	xor    %r9d,%r9d
   193b9:	41 39 fa             	cmp    %edi,%r10d
   193bc:	41 0f 96 c1          	setbe  %r9b
   193c0:	5b                   	pop    %rbx
   193c1:	44 89 08             	mov    %r9d,(%rax)
   193c4:	89 48 04             	mov    %ecx,0x4(%rax)
   193c7:	44 89 40 08          	mov    %r8d,0x8(%rax)
   193cb:	c3                   	ret
   193cc:	44 89 08             	mov    %r9d,(%rax)
   193cf:	89 48 04             	mov    %ecx,0x4(%rax)
   193d2:	44 89 40 08          	mov    %r8d,0x8(%rax)
   193d6:	c3                   	ret
   193d7:	cc                   	int3
   193d8:	cc                   	int3
   193d9:	cc                   	int3
   193da:	cc                   	int3
   193db:	cc                   	int3
   193dc:	cc                   	int3
   193dd:	cc                   	int3
   193de:	cc                   	int3
   193df:	cc                   	int3

<hyperinterval::float::F32Enclosure>::contains_point:
   193e0:	41 56                	push   %r14
   193e2:	53                   	push   %rbx
   193e3:	48 83 ec 18          	sub    $0x18,%rsp
   193e7:	48 89 fb             	mov    %rdi,%rbx
   193ea:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   193f0:	66 0f 7e c1          	movd   %xmm0,%ecx
   193f4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   193f9:	be 00 00 00 80       	mov    $0x80000000,%esi
   193fe:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19403:	e8 48 35 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   19408:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1940d:	3c 01                	cmp    $0x1,%al
   1940f:	75 0d                	jne    1941e <<hyperinterval::float::F32Enclosure>::contains_point+0x3e>
   19411:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   19416:	48 83 c4 18          	add    $0x18,%rsp
   1941a:	5b                   	pop    %rbx
   1941b:	41 5e                	pop    %r14
   1941d:	c3                   	ret
   1941e:	f6 03 01             	testb  $0x1,(%rbx)
   19421:	74 44                	je     19467 <<hyperinterval::float::F32Enclosure>::contains_point+0x87>
   19423:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   19428:	8b 73 04             	mov    0x4(%rbx),%esi
   1942b:	89 d1                	mov    %edx,%ecx
   1942d:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19433:	89 f7                	mov    %esi,%edi
   19435:	44 09 f7             	or     %r14d,%edi
   19438:	41 89 f0             	mov    %esi,%r8d
   1943b:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   19442:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   19448:	45 29 c1             	sub    %r8d,%r9d
   1944b:	85 f6                	test   %esi,%esi
   1944d:	4c 0f 49 cf          	cmovns %rdi,%r9
   19451:	be 00 00 00 80       	mov    $0x80000000,%esi
   19456:	48 29 ce             	sub    %rcx,%rsi
   19459:	4c 09 f1             	or     %r14,%rcx
   1945c:	85 d2                	test   %edx,%edx
   1945e:	48 0f 48 ce          	cmovs  %rsi,%rcx
   19462:	41 39 c9             	cmp    %ecx,%r9d
   19465:	76 0a                	jbe    19471 <<hyperinterval::float::F32Enclosure>::contains_point+0x91>
   19467:	31 d2                	xor    %edx,%edx
   19469:	48 83 c4 18          	add    $0x18,%rsp
   1946d:	5b                   	pop    %rbx
   1946e:	41 5e                	pop    %r14
   19470:	c3                   	ret
   19471:	8b 53 08             	mov    0x8(%rbx),%edx
   19474:	89 d6                	mov    %edx,%esi
   19476:	44 09 f6             	or     %r14d,%esi
   19479:	89 d7                	mov    %edx,%edi
   1947b:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   19481:	41 29 fe             	sub    %edi,%r14d
   19484:	85 d2                	test   %edx,%edx
   19486:	4c 0f 49 f6          	cmovns %rsi,%r14
   1948a:	44 39 f1             	cmp    %r14d,%ecx
   1948d:	0f 96 c2             	setbe  %dl
   19490:	48 83 c4 18          	add    $0x18,%rsp
   19494:	5b                   	pop    %rbx
   19495:	41 5e                	pop    %r14
   19497:	c3                   	ret
   19498:	cc                   	int3
   19499:	cc                   	int3
   1949a:	cc                   	int3
   1949b:	cc                   	int3
   1949c:	cc                   	int3
   1949d:	cc                   	int3
   1949e:	cc                   	int3
   1949f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::interior_subset_of:
   194a0:	b0 01                	mov    $0x1,%al
   194a2:	f6 07 01             	testb  $0x1,(%rdi)
   194a5:	0f 84 8e 00 00 00    	je     19539 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x99>
   194ab:	f6 06 01             	testb  $0x1,(%rsi)
   194ae:	0f 84 83 00 00 00    	je     19537 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x97>
   194b4:	8b 4f 04             	mov    0x4(%rdi),%ecx
   194b7:	8b 56 04             	mov    0x4(%rsi),%edx
   194ba:	b8 00 00 00 80       	mov    $0x80000000,%eax
   194bf:	44 8d 04 02          	lea    (%rdx,%rax,1),%r8d
   194c3:	41 89 d1             	mov    %edx,%r9d
   194c6:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   194cd:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   194d3:	45 29 ca             	sub    %r9d,%r10d
   194d6:	85 d2                	test   %edx,%edx
   194d8:	4d 0f 49 d0          	cmovns %r8,%r10
   194dc:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   194df:	41 89 c8             	mov    %ecx,%r8d
   194e2:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   194e9:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   194ef:	45 29 c1             	sub    %r8d,%r9d
   194f2:	85 c9                	test   %ecx,%ecx
   194f4:	4c 0f 49 ca          	cmovns %rdx,%r9
   194f8:	45 39 ca             	cmp    %r9d,%r10d
   194fb:	73 3a                	jae    19537 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x97>
   194fd:	8b 4f 08             	mov    0x8(%rdi),%ecx
   19500:	8b 56 08             	mov    0x8(%rsi),%edx
   19503:	8d 34 01             	lea    (%rcx,%rax,1),%esi
   19506:	89 cf                	mov    %ecx,%edi
   19508:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1950e:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   19514:	41 29 f8             	sub    %edi,%r8d
   19517:	85 c9                	test   %ecx,%ecx
   19519:	4c 0f 49 c6          	cmovns %rsi,%r8
   1951d:	8d 0c 02             	lea    (%rdx,%rax,1),%ecx
   19520:	89 d6                	mov    %edx,%esi
   19522:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   19528:	29 f0                	sub    %esi,%eax
   1952a:	85 d2                	test   %edx,%edx
   1952c:	48 0f 49 c1          	cmovns %rcx,%rax
   19530:	41 39 c0             	cmp    %eax,%r8d
   19533:	0f 92 c0             	setb   %al
   19536:	c3                   	ret
   19537:	31 c0                	xor    %eax,%eax
   19539:	c3                   	ret
   1953a:	cc                   	int3
   1953b:	cc                   	int3
   1953c:	cc                   	int3
   1953d:	cc                   	int3
   1953e:	cc                   	int3
   1953f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::abs:
   19540:	48 89 f8             	mov    %rdi,%rax
   19543:	f6 06 01             	testb  $0x1,(%rsi)
   19546:	74 24                	je     1956c <<hyperinterval::float::F32Enclosure>::abs+0x2c>
   19548:	8b 4e 04             	mov    0x4(%rsi),%ecx
   1954b:	85 c9                	test   %ecx,%ecx
   1954d:	0f 99 c2             	setns  %dl
   19550:	f7 c1 ff ff ff 7f    	test   $0x7fffffff,%ecx
   19556:	40 0f 94 c7          	sete   %dil
   1955a:	40 08 d7             	or     %dl,%dil
   1955d:	74 14                	je     19573 <<hyperinterval::float::F32Enclosure>::abs+0x33>
   1955f:	8b 4e 08             	mov    0x8(%rsi),%ecx
   19562:	89 48 08             	mov    %ecx,0x8(%rax)
   19565:	48 8b 0e             	mov    (%rsi),%rcx
   19568:	48 89 08             	mov    %rcx,(%rax)
   1956b:	c3                   	ret
   1956c:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   19572:	c3                   	ret
   19573:	8b 56 08             	mov    0x8(%rsi),%edx
   19576:	85 d2                	test   %edx,%edx
   19578:	40 0f 98 c7          	sets   %dil
   1957c:	48 89 d6             	mov    %rdx,%rsi
   1957f:	48 81 e6 ff ff ff 7f 	and    $0x7fffffff,%rsi
   19586:	41 0f 95 c0          	setne  %r8b
   1958a:	44 84 c7             	test   %r8b,%dil
   1958d:	74 19                	je     195a8 <<hyperinterval::float::F32Enclosure>::abs+0x68>
   1958f:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19595:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1959b:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   195a1:	89 50 04             	mov    %edx,0x4(%rax)
   195a4:	89 48 08             	mov    %ecx,0x8(%rax)
   195a7:	c3                   	ret
   195a8:	89 cf                	mov    %ecx,%edi
   195aa:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   195b0:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   195b6:	46 8d 0c 02          	lea    (%rdx,%r8,1),%r9d
   195ba:	41 29 f0             	sub    %esi,%r8d
   195bd:	85 d2                	test   %edx,%edx
   195bf:	4d 0f 49 c1          	cmovns %r9,%r8
   195c3:	41 39 c8             	cmp    %ecx,%r8d
   195c6:	0f 43 fa             	cmovae %edx,%edi
   195c9:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   195d0:	89 78 08             	mov    %edi,0x8(%rax)
   195d3:	c3                   	ret
   195d4:	cc                   	int3
   195d5:	cc                   	int3
   195d6:	cc                   	int3
   195d7:	cc                   	int3
   195d8:	cc                   	int3
   195d9:	cc                   	int3
   195da:	cc                   	int3
   195db:	cc                   	int3
   195dc:	cc                   	int3
   195dd:	cc                   	int3
   195de:	cc                   	int3
   195df:	cc                   	int3

<hyperinterval::float::F32Enclosure>::add:
   195e0:	48 89 f8             	mov    %rdi,%rax
   195e3:	f6 06 01             	testb  $0x1,(%rsi)
   195e6:	0f 84 d6 00 00 00    	je     196c2 <<hyperinterval::float::F32Enclosure>::add+0xe2>
   195ec:	f6 02 01             	testb  $0x1,(%rdx)
   195ef:	0f 84 cd 00 00 00    	je     196c2 <<hyperinterval::float::F32Enclosure>::add+0xe2>
   195f5:	41 57                	push   %r15
   195f7:	41 56                	push   %r14
   195f9:	41 55                	push   %r13
   195fb:	41 54                	push   %r12
   195fd:	53                   	push   %rbx
   195fe:	48 83 ec 20          	sub    $0x20,%rsp
   19602:	49 89 c4             	mov    %rax,%r12
   19605:	8b 5e 08             	mov    0x8(%rsi),%ebx
   19608:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   1960e:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   19612:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   19616:	8b 4e 04             	mov    0x4(%rsi),%ecx
   19619:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1961e:	be 00 00 00 80       	mov    $0x80000000,%esi
   19623:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19628:	e8 63 33 00 00       	call   1c990 <<hyperinterval::ieee::Format>::add>
   1962d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19632:	74 6b                	je     1969f <<hyperinterval::float::F32Enclosure>::add+0xbf>
   19634:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   19639:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1963e:	be 00 00 00 80       	mov    $0x80000000,%esi
   19643:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19648:	48 89 d9             	mov    %rbx,%rcx
   1964b:	4d 89 f0             	mov    %r14,%r8
   1964e:	e8 3d 33 00 00       	call   1c990 <<hyperinterval::ieee::Format>::add>
   19653:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19658:	74 45                	je     1969f <<hyperinterval::float::F32Enclosure>::add+0xbf>
   1965a:	8b 5c 24 18          	mov    0x18(%rsp),%ebx
   1965e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19663:	be 00 00 00 80       	mov    $0x80000000,%esi
   19668:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1966d:	4c 89 f9             	mov    %r15,%rcx
   19670:	e8 db 32 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   19675:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1967a:	74 23                	je     1969f <<hyperinterval::float::F32Enclosure>::add+0xbf>
   1967c:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   19681:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19686:	be 00 00 00 80       	mov    $0x80000000,%esi
   1968b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19690:	48 89 d9             	mov    %rbx,%rcx
   19693:	e8 b8 32 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   19698:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1969d:	75 2a                	jne    196c9 <<hyperinterval::float::F32Enclosure>::add+0xe9>
   1969f:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   196a4:	4c 89 e0             	mov    %r12,%rax
   196a7:	41 88 4c 24 04       	mov    %cl,0x4(%r12)
   196ac:	41 c7 04 24 02 00 00 	movl   $0x2,(%r12)
   196b3:	00 
   196b4:	48 83 c4 20          	add    $0x20,%rsp
   196b8:	5b                   	pop    %rbx
   196b9:	41 5c                	pop    %r12
   196bb:	41 5d                	pop    %r13
   196bd:	41 5e                	pop    %r14
   196bf:	41 5f                	pop    %r15
   196c1:	c3                   	ret
   196c2:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   196c8:	c3                   	ret
   196c9:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   196cd:	44 89 f0             	mov    %r14d,%eax
   196d0:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   196d5:	89 ca                	mov    %ecx,%edx
   196d7:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   196dd:	be 00 00 00 80       	mov    $0x80000000,%esi
   196e2:	29 c6                	sub    %eax,%esi
   196e4:	44 09 e8             	or     %r13d,%eax
   196e7:	45 85 f6             	test   %r14d,%r14d
   196ea:	48 0f 49 f0          	cmovns %rax,%rsi
   196ee:	89 d0                	mov    %edx,%eax
   196f0:	44 09 e8             	or     %r13d,%eax
   196f3:	41 29 d5             	sub    %edx,%r13d
   196f6:	85 c9                	test   %ecx,%ecx
   196f8:	4c 0f 49 e8          	cmovns %rax,%r13
   196fc:	44 39 ee             	cmp    %r13d,%esi
   196ff:	4c 89 e0             	mov    %r12,%rax
   19702:	76 0c                	jbe    19710 <<hyperinterval::float::F32Enclosure>::add+0x130>
   19704:	c6 40 04 01          	movb   $0x1,0x4(%rax)
   19708:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   1970e:	eb a4                	jmp    196b4 <<hyperinterval::float::F32Enclosure>::add+0xd4>
   19710:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   19716:	44 89 70 04          	mov    %r14d,0x4(%rax)
   1971a:	89 48 08             	mov    %ecx,0x8(%rax)
   1971d:	eb 95                	jmp    196b4 <<hyperinterval::float::F32Enclosure>::add+0xd4>
   1971f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::div:
   19720:	53                   	push   %rbx
   19721:	48 89 fb             	mov    %rdi,%rbx
   19724:	83 3a 01             	cmpl   $0x1,(%rdx)
   19727:	75 1a                	jne    19743 <<hyperinterval::float::F32Enclosure>::div+0x23>
   19729:	83 7a 04 00          	cmpl   $0x0,0x4(%rdx)
   1972d:	7f 14                	jg     19743 <<hyperinterval::float::F32Enclosure>::div+0x23>
   1972f:	8b 42 08             	mov    0x8(%rdx),%eax
   19732:	85 c0                	test   %eax,%eax
   19734:	0f 99 c1             	setns  %cl
   19737:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   1973c:	0f 94 c0             	sete   %al
   1973f:	08 c8                	or     %cl,%al
   19741:	75 12                	jne    19755 <<hyperinterval::float::F32Enclosure>::div+0x35>
   19743:	48 89 df             	mov    %rbx,%rdi
   19746:	b9 01 00 00 00       	mov    $0x1,%ecx
   1974b:	e8 20 f5 ff ff       	call   18c70 <<hyperinterval::float::F32Enclosure>::corner_image>
   19750:	48 89 d8             	mov    %rbx,%rax
   19753:	5b                   	pop    %rbx
   19754:	c3                   	ret
   19755:	c6 43 04 06          	movb   $0x6,0x4(%rbx)
   19759:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1975f:	48 89 d8             	mov    %rbx,%rax
   19762:	5b                   	pop    %rbx
   19763:	c3                   	ret
   19764:	cc                   	int3
   19765:	cc                   	int3
   19766:	cc                   	int3
   19767:	cc                   	int3
   19768:	cc                   	int3
   19769:	cc                   	int3
   1976a:	cc                   	int3
   1976b:	cc                   	int3
   1976c:	cc                   	int3
   1976d:	cc                   	int3
   1976e:	cc                   	int3
   1976f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::new:
   19770:	41 57                	push   %r15
   19772:	41 56                	push   %r14
   19774:	53                   	push   %rbx
   19775:	48 83 ec 20          	sub    $0x20,%rsp
   19779:	f3 0f 11 4c 24 1c    	movss  %xmm1,0x1c(%rsp)
   1977f:	48 89 fb             	mov    %rdi,%rbx
   19782:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   19788:	66 0f 7e c1          	movd   %xmm0,%ecx
   1978c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19791:	be 00 00 00 80       	mov    $0x80000000,%esi
   19796:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1979b:	e8 b0 31 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   197a0:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   197a5:	74 2a                	je     197d1 <<hyperinterval::float::F32Enclosure>::new+0x61>
   197a7:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   197ac:	66 0f 6e 44 24 1c    	movd   0x1c(%rsp),%xmm0
   197b2:	66 0f 7e c1          	movd   %xmm0,%ecx
   197b6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   197bb:	be 00 00 00 80       	mov    $0x80000000,%esi
   197c0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   197c5:	e8 86 31 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   197ca:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   197cf:	75 1b                	jne    197ec <<hyperinterval::float::F32Enclosure>::new+0x7c>
   197d1:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   197d6:	88 43 04             	mov    %al,0x4(%rbx)
   197d9:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   197df:	48 89 d8             	mov    %rbx,%rax
   197e2:	48 83 c4 20          	add    $0x20,%rsp
   197e6:	5b                   	pop    %rbx
   197e7:	41 5e                	pop    %r14
   197e9:	41 5f                	pop    %r15
   197eb:	c3                   	ret
   197ec:	8b 44 24 10          	mov    0x10(%rsp),%eax
   197f0:	44 89 f9             	mov    %r15d,%ecx
   197f3:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   197f9:	89 c2                	mov    %eax,%edx
   197fb:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19801:	be 00 00 00 80       	mov    $0x80000000,%esi
   19806:	29 ce                	sub    %ecx,%esi
   19808:	44 09 f1             	or     %r14d,%ecx
   1980b:	45 85 ff             	test   %r15d,%r15d
   1980e:	48 0f 49 f1          	cmovns %rcx,%rsi
   19812:	89 d1                	mov    %edx,%ecx
   19814:	44 09 f1             	or     %r14d,%ecx
   19817:	41 29 d6             	sub    %edx,%r14d
   1981a:	85 c0                	test   %eax,%eax
   1981c:	4c 0f 49 f1          	cmovns %rcx,%r14
   19820:	44 39 f6             	cmp    %r14d,%esi
   19823:	76 06                	jbe    1982b <<hyperinterval::float::F32Enclosure>::new+0xbb>
   19825:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   19829:	eb ae                	jmp    197d9 <<hyperinterval::float::F32Enclosure>::new+0x69>
   1982b:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   19831:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
   19835:	89 43 08             	mov    %eax,0x8(%rbx)
   19838:	eb a5                	jmp    197df <<hyperinterval::float::F32Enclosure>::new+0x6f>
   1983a:	cc                   	int3
   1983b:	cc                   	int3
   1983c:	cc                   	int3
   1983d:	cc                   	int3
   1983e:	cc                   	int3
   1983f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::sub:
   19840:	53                   	push   %rbx
   19841:	48 83 ec 10          	sub    $0x10,%rsp
   19845:	48 89 fb             	mov    %rdi,%rbx
   19848:	f6 02 01             	testb  $0x1,(%rdx)
   1984b:	74 29                	je     19876 <<hyperinterval::float::F32Enclosure>::sub+0x36>
   1984d:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   19852:	66 0f ef c9          	pxor   %xmm1,%xmm1
   19856:	66 0f 6f 15 62 c4 fe 	movdqa -0x13b9e(%rip),%xmm2        # 5cc0 <__abi_tag+0x59c4>
   1985d:	ff 
   1985e:	66 0f ef d0          	pxor   %xmm0,%xmm2
   19862:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   19866:	66 0f df ca          	pandn  %xmm2,%xmm1
   1986a:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   1986f:	b8 01 00 00 00       	mov    $0x1,%eax
   19874:	eb 02                	jmp    19878 <<hyperinterval::float::F32Enclosure>::sub+0x38>
   19876:	31 c0                	xor    %eax,%eax
   19878:	89 44 24 04          	mov    %eax,0x4(%rsp)
   1987c:	66 0f d6 44 24 08    	movq   %xmm0,0x8(%rsp)
   19882:	48 8d 54 24 04       	lea    0x4(%rsp),%rdx
   19887:	48 89 df             	mov    %rbx,%rdi
   1988a:	ff 15 08 40 04 00    	call   *0x44008(%rip)        # 5d898 <_DYNAMIC+0x2d0>
   19890:	48 89 d8             	mov    %rbx,%rax
   19893:	48 83 c4 10          	add    $0x10,%rsp
   19897:	5b                   	pop    %rbx
   19898:	c3                   	ret
   19899:	cc                   	int3
   1989a:	cc                   	int3
   1989b:	cc                   	int3
   1989c:	cc                   	int3
   1989d:	cc                   	int3
   1989e:	cc                   	int3
   1989f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::hull:
   198a0:	48 89 f8             	mov    %rdi,%rax
   198a3:	44 8b 0e             	mov    (%rsi),%r9d
   198a6:	44 8b 02             	mov    (%rdx),%r8d
   198a9:	8b 7a 04             	mov    0x4(%rdx),%edi
   198ac:	8b 4a 08             	mov    0x8(%rdx),%ecx
   198af:	41 f6 c1 01          	test   $0x1,%r9b
   198b3:	0f 84 9b 00 00 00    	je     19954 <<hyperinterval::float::F32Enclosure>::hull+0xb4>
   198b9:	8b 56 04             	mov    0x4(%rsi),%edx
   198bc:	8b 76 08             	mov    0x8(%rsi),%esi
   198bf:	41 f6 c0 01          	test   $0x1,%r8b
   198c3:	0f 84 95 00 00 00    	je     1995e <<hyperinterval::float::F32Enclosure>::hull+0xbe>
   198c9:	53                   	push   %rbx
   198ca:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   198d0:	46 8d 0c 02          	lea    (%rdx,%r8,1),%r9d
   198d4:	41 89 d2             	mov    %edx,%r10d
   198d7:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   198de:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   198e4:	45 29 d3             	sub    %r10d,%r11d
   198e7:	85 d2                	test   %edx,%edx
   198e9:	4d 0f 49 d9          	cmovns %r9,%r11
   198ed:	46 8d 0c 07          	lea    (%rdi,%r8,1),%r9d
   198f1:	41 89 fa             	mov    %edi,%r10d
   198f4:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   198fb:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   19900:	44 29 d3             	sub    %r10d,%ebx
   19903:	85 ff                	test   %edi,%edi
   19905:	49 0f 49 d9          	cmovns %r9,%rbx
   19909:	41 39 db             	cmp    %ebx,%r11d
   1990c:	0f 47 d7             	cmova  %edi,%edx
   1990f:	42 8d 3c 06          	lea    (%rsi,%r8,1),%edi
   19913:	41 89 f1             	mov    %esi,%r9d
   19916:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1991d:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   19923:	45 29 ca             	sub    %r9d,%r10d
   19926:	85 f6                	test   %esi,%esi
   19928:	4c 0f 49 d7          	cmovns %rdi,%r10
   1992c:	42 8d 3c 01          	lea    (%rcx,%r8,1),%edi
   19930:	41 89 c9             	mov    %ecx,%r9d
   19933:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1993a:	45 29 c8             	sub    %r9d,%r8d
   1993d:	85 c9                	test   %ecx,%ecx
   1993f:	4c 0f 49 c7          	cmovns %rdi,%r8
   19943:	45 39 c2             	cmp    %r8d,%r10d
   19946:	0f 42 f1             	cmovb  %ecx,%esi
   19949:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1994f:	89 f1                	mov    %esi,%ecx
   19951:	89 d7                	mov    %edx,%edi
   19953:	5b                   	pop    %rbx
   19954:	44 89 00             	mov    %r8d,(%rax)
   19957:	89 78 04             	mov    %edi,0x4(%rax)
   1995a:	89 48 08             	mov    %ecx,0x8(%rax)
   1995d:	c3                   	ret
   1995e:	89 f1                	mov    %esi,%ecx
   19960:	89 d7                	mov    %edx,%edi
   19962:	45 89 c8             	mov    %r9d,%r8d
   19965:	44 89 00             	mov    %r8d,(%rax)
   19968:	89 78 04             	mov    %edi,0x4(%rax)
   1996b:	89 48 08             	mov    %ecx,0x8(%rax)
   1996e:	c3                   	ret
   1996f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::sqrt:
   19970:	48 89 f8             	mov    %rdi,%rax
   19973:	f6 06 01             	testb  $0x1,(%rsi)
   19976:	74 2c                	je     199a4 <<hyperinterval::float::F32Enclosure>::sqrt+0x34>
   19978:	55                   	push   %rbp
   19979:	41 57                	push   %r15
   1997b:	41 56                	push   %r14
   1997d:	41 55                	push   %r13
   1997f:	41 54                	push   %r12
   19981:	53                   	push   %rbx
   19982:	48 83 ec 18          	sub    $0x18,%rsp
   19986:	8b 5e 08             	mov    0x8(%rsi),%ebx
   19989:	85 db                	test   %ebx,%ebx
   1998b:	0f 98 c1             	sets   %cl
   1998e:	f7 c3 ff ff ff 7f    	test   $0x7fffffff,%ebx
   19994:	0f 95 c2             	setne  %dl
   19997:	84 d1                	test   %dl,%cl
   19999:	74 14                	je     199af <<hyperinterval::float::F32Enclosure>::sqrt+0x3f>
   1999b:	c6 40 04 07          	movb   $0x7,0x4(%rax)
   1999f:	e9 ce 00 00 00       	jmp    19a72 <<hyperinterval::float::F32Enclosure>::sqrt+0x102>
   199a4:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   199aa:	c6 40 0c 00          	movb   $0x0,0xc(%rax)
   199ae:	c3                   	ret
   199af:	49 89 c7             	mov    %rax,%r15
   199b2:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
   199b6:	41 bc 00 00 00 80    	mov    $0x80000000,%r12d
   199bc:	45 85 ed             	test   %r13d,%r13d
   199bf:	0f 98 c0             	sets   %al
   199c2:	41 f7 c5 ff ff ff 7f 	test   $0x7fffffff,%r13d
   199c9:	40 0f 95 c5          	setne  %bpl
   199cd:	31 c9                	xor    %ecx,%ecx
   199cf:	40 20 c5             	and    %al,%bpl
   199d2:	49 0f 44 cd          	cmove  %r13,%rcx
   199d6:	48 89 e7             	mov    %rsp,%rdi
   199d9:	be 00 00 00 80       	mov    $0x80000000,%esi
   199de:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   199e3:	e8 68 37 00 00       	call   1d150 <<hyperinterval::ieee::Format>::sqrt>
   199e8:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   199ec:	74 15                	je     19a03 <<hyperinterval::float::F32Enclosure>::sqrt+0x93>
   199ee:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   199f3:	4c 89 f8             	mov    %r15,%rax
   199f6:	41 88 4f 04          	mov    %cl,0x4(%r15)
   199fa:	41 c7 07 02 00 00 00 	movl   $0x2,(%r15)
   19a01:	eb 75                	jmp    19a78 <<hyperinterval::float::F32Enclosure>::sqrt+0x108>
   19a03:	44 8b 74 24 08       	mov    0x8(%rsp),%r14d
   19a08:	41 39 dd             	cmp    %ebx,%r13d
   19a0b:	74 1b                	je     19a28 <<hyperinterval::float::F32Enclosure>::sqrt+0xb8>
   19a0d:	48 89 e7             	mov    %rsp,%rdi
   19a10:	be 00 00 00 80       	mov    $0x80000000,%esi
   19a15:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19a1a:	48 89 d9             	mov    %rbx,%rcx
   19a1d:	e8 2e 37 00 00       	call   1d150 <<hyperinterval::ieee::Format>::sqrt>
   19a22:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19a26:	74 c6                	je     199ee <<hyperinterval::float::F32Enclosure>::sqrt+0x7e>
   19a28:	8b 5c 24 10          	mov    0x10(%rsp),%ebx
   19a2c:	48 89 e7             	mov    %rsp,%rdi
   19a2f:	be 00 00 00 80       	mov    $0x80000000,%esi
   19a34:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19a39:	4c 89 f1             	mov    %r14,%rcx
   19a3c:	e8 0f 2f 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   19a41:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19a45:	74 20                	je     19a67 <<hyperinterval::float::F32Enclosure>::sqrt+0xf7>
   19a47:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   19a4c:	48 89 e7             	mov    %rsp,%rdi
   19a4f:	be 00 00 00 80       	mov    $0x80000000,%esi
   19a54:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19a59:	48 89 d9             	mov    %rbx,%rcx
   19a5c:	e8 ef 2e 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   19a61:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19a65:	75 20                	jne    19a87 <<hyperinterval::float::F32Enclosure>::sqrt+0x117>
   19a67:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   19a6c:	4c 89 f8             	mov    %r15,%rax
   19a6f:	88 50 04             	mov    %dl,0x4(%rax)
   19a72:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   19a78:	48 83 c4 18          	add    $0x18,%rsp
   19a7c:	5b                   	pop    %rbx
   19a7d:	41 5c                	pop    %r12
   19a7f:	41 5d                	pop    %r13
   19a81:	41 5e                	pop    %r14
   19a83:	41 5f                	pop    %r15
   19a85:	5d                   	pop    %rbp
   19a86:	c3                   	ret
   19a87:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   19a8b:	44 89 f0             	mov    %r14d,%eax
   19a8e:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19a93:	89 ca                	mov    %ecx,%edx
   19a95:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19a9b:	be 00 00 00 80       	mov    $0x80000000,%esi
   19aa0:	29 c6                	sub    %eax,%esi
   19aa2:	44 09 e0             	or     %r12d,%eax
   19aa5:	45 85 f6             	test   %r14d,%r14d
   19aa8:	48 0f 49 f0          	cmovns %rax,%rsi
   19aac:	89 d0                	mov    %edx,%eax
   19aae:	44 09 e0             	or     %r12d,%eax
   19ab1:	41 29 d4             	sub    %edx,%r12d
   19ab4:	85 c9                	test   %ecx,%ecx
   19ab6:	4c 0f 49 e0          	cmovns %rax,%r12
   19aba:	b2 01                	mov    $0x1,%dl
   19abc:	44 39 e6             	cmp    %r12d,%esi
   19abf:	4c 89 f8             	mov    %r15,%rax
   19ac2:	77 ab                	ja     19a6f <<hyperinterval::float::F32Enclosure>::sqrt+0xff>
   19ac4:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   19aca:	44 89 70 04          	mov    %r14d,0x4(%rax)
   19ace:	89 48 08             	mov    %ecx,0x8(%rax)
   19ad1:	40 88 68 0c          	mov    %bpl,0xc(%rax)
   19ad5:	eb a1                	jmp    19a78 <<hyperinterval::float::F32Enclosure>::sqrt+0x108>
   19ad7:	cc                   	int3
   19ad8:	cc                   	int3
   19ad9:	cc                   	int3
   19ada:	cc                   	int3
   19adb:	cc                   	int3
   19adc:	cc                   	int3
   19add:	cc                   	int3
   19ade:	cc                   	int3
   19adf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::point:
   19ae0:	53                   	push   %rbx
   19ae1:	48 83 ec 10          	sub    $0x10,%rsp
   19ae5:	48 89 fb             	mov    %rdi,%rbx
   19ae8:	66 0f 7e c1          	movd   %xmm0,%ecx
   19aec:	48 89 e7             	mov    %rsp,%rdi
   19aef:	be 00 00 00 80       	mov    $0x80000000,%esi
   19af4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19af9:	e8 52 2e 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   19afe:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19b02:	75 0f                	jne    19b13 <<hyperinterval::float::F32Enclosure>::point+0x33>
   19b04:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   19b09:	88 43 04             	mov    %al,0x4(%rbx)
   19b0c:	b8 02 00 00 00       	mov    $0x2,%eax
   19b11:	eb 0f                	jmp    19b22 <<hyperinterval::float::F32Enclosure>::point+0x42>
   19b13:	8b 44 24 08          	mov    0x8(%rsp),%eax
   19b17:	89 43 04             	mov    %eax,0x4(%rbx)
   19b1a:	89 43 08             	mov    %eax,0x8(%rbx)
   19b1d:	b8 01 00 00 00       	mov    $0x1,%eax
   19b22:	89 03                	mov    %eax,(%rbx)
   19b24:	48 89 d8             	mov    %rbx,%rax
   19b27:	48 83 c4 10          	add    $0x10,%rsp
   19b2b:	5b                   	pop    %rbx
   19b2c:	c3                   	ret
   19b2d:	cc                   	int3
   19b2e:	cc                   	int3
   19b2f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::signs:
   19b30:	83 3f 01             	cmpl   $0x1,(%rdi)
   19b33:	75 65                	jne    19b9a <<hyperinterval::float::F32Enclosure>::signs+0x6a>
   19b35:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   19b3a:	8b 57 04             	mov    0x4(%rdi),%edx
   19b3d:	8b 47 08             	mov    0x8(%rdi),%eax
   19b40:	48 89 d6             	mov    %rdx,%rsi
   19b43:	48 09 ce             	or     %rcx,%rsi
   19b46:	41 89 d0             	mov    %edx,%r8d
   19b49:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   19b50:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19b55:	4c 29 c7             	sub    %r8,%rdi
   19b58:	85 d2                	test   %edx,%edx
   19b5a:	48 0f 49 fe          	cmovns %rsi,%rdi
   19b5e:	31 f6                	xor    %esi,%esi
   19b60:	f7 c7 00 00 00 80    	test   $0x80000000,%edi
   19b66:	0f 94 c2             	sete   %dl
   19b69:	48 39 cf             	cmp    %rcx,%rdi
   19b6c:	77 1d                	ja     19b8b <<hyperinterval::float::F32Enclosure>::signs+0x5b>
   19b6e:	39 cf                	cmp    %ecx,%edi
   19b70:	0f 92 c1             	setb   %cl
   19b73:	80 c9 02             	or     $0x2,%cl
   19b76:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   19b7b:	0f b6 c9             	movzbl %cl,%ecx
   19b7e:	40 88 d6             	mov    %dl,%sil
   19b81:	0f 44 f1             	cmove  %ecx,%esi
   19b84:	85 c0                	test   %eax,%eax
   19b86:	0f 49 f1             	cmovns %ecx,%esi
   19b89:	89 f2                	mov    %esi,%edx
   19b8b:	8d 4a 04             	lea    0x4(%rdx),%ecx
   19b8e:	85 c0                	test   %eax,%eax
   19b90:	0f b6 d2             	movzbl %dl,%edx
   19b93:	0f b6 c1             	movzbl %cl,%eax
   19b96:	0f 4e c2             	cmovle %edx,%eax
   19b99:	c3                   	ret
   19b9a:	31 c0                	xor    %eax,%eax
   19b9c:	c3                   	ret
   19b9d:	cc                   	int3
   19b9e:	cc                   	int3
   19b9f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::affine:
   19ba0:	55                   	push   %rbp
   19ba1:	41 57                	push   %r15
   19ba3:	41 56                	push   %r14
   19ba5:	41 55                	push   %r13
   19ba7:	41 54                	push   %r12
   19ba9:	53                   	push   %rbx
   19baa:	48 83 ec 78          	sub    $0x78,%rsp
   19bae:	f3 0f 11 4c 24 20    	movss  %xmm1,0x20(%rsp)
   19bb4:	49 89 f6             	mov    %rsi,%r14
   19bb7:	48 89 fb             	mov    %rdi,%rbx
   19bba:	66 0f 7e c1          	movd   %xmm0,%ecx
   19bbe:	48 89 e7             	mov    %rsp,%rdi
   19bc1:	be 00 00 00 80       	mov    $0x80000000,%esi
   19bc6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19bcb:	e8 80 2d 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   19bd0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19bd4:	74 27                	je     19bfd <<hyperinterval::float::F32Enclosure>::affine+0x5d>
   19bd6:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   19bdb:	66 0f 6e 44 24 20    	movd   0x20(%rsp),%xmm0
   19be1:	66 0f 7e c1          	movd   %xmm0,%ecx
   19be5:	48 89 e7             	mov    %rsp,%rdi
   19be8:	be 00 00 00 80       	mov    $0x80000000,%esi
   19bed:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19bf2:	e8 59 2d 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   19bf7:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19bfb:	75 20                	jne    19c1d <<hyperinterval::float::F32Enclosure>::affine+0x7d>
   19bfd:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   19c02:	88 43 04             	mov    %al,0x4(%rbx)
   19c05:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19c0b:	48 89 d8             	mov    %rbx,%rax
   19c0e:	48 83 c4 78          	add    $0x78,%rsp
   19c12:	5b                   	pop    %rbx
   19c13:	41 5c                	pop    %r12
   19c15:	41 5d                	pop    %r13
   19c17:	41 5e                	pop    %r14
   19c19:	41 5f                	pop    %r15
   19c1b:	5d                   	pop    %rbp
   19c1c:	c3                   	ret
   19c1d:	41 f6 06 01          	testb  $0x1,(%r14)
   19c21:	0f 84 bd 01 00 00    	je     19de4 <<hyperinterval::float::F32Enclosure>::affine+0x244>
   19c27:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
   19c2c:	41 8b 56 04          	mov    0x4(%r14),%edx
   19c30:	41 8b 46 08          	mov    0x8(%r14),%eax
   19c34:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
   19c39:	89 d0                	mov    %edx,%eax
   19c3b:	c1 e8 17             	shr    $0x17,%eax
   19c3e:	0f b6 c0             	movzbl %al,%eax
   19c41:	89 d6                	mov    %edx,%esi
   19c43:	81 e6 ff ff 7f 00    	and    $0x7fffff,%esi
   19c49:	31 c9                	xor    %ecx,%ecx
   19c4b:	85 c0                	test   %eax,%eax
   19c4d:	0f 95 c1             	setne  %cl
   19c50:	bf 01 00 00 00       	mov    $0x1,%edi
   19c55:	0f 44 c7             	cmove  %edi,%eax
   19c58:	c1 e1 17             	shl    $0x17,%ecx
   19c5b:	48 09 f1             	or     %rsi,%rcx
   19c5e:	85 d2                	test   %edx,%edx
   19c60:	0f 98 c2             	sets   %dl
   19c63:	44 89 fe             	mov    %r15d,%esi
   19c66:	c1 ee 17             	shr    $0x17,%esi
   19c69:	40 0f b6 f6          	movzbl %sil,%esi
   19c6d:	44 89 ff             	mov    %r15d,%edi
   19c70:	81 e7 ff ff 7f 00    	and    $0x7fffff,%edi
   19c76:	44 8d 86 d4 fe ff ff 	lea    -0x12c(%rsi),%r8d
   19c7d:	45 31 ed             	xor    %r13d,%r13d
   19c80:	85 f6                	test   %esi,%esi
   19c82:	41 0f 95 c5          	setne  %r13b
   19c86:	41 be d5 fe ff ff    	mov    $0xfffffed5,%r14d
   19c8c:	45 0f 45 f0          	cmovne %r8d,%r14d
   19c90:	41 c1 e5 17          	shl    $0x17,%r13d
   19c94:	49 09 fd             	or     %rdi,%r13
   19c97:	45 85 ff             	test   %r15d,%r15d
   19c9a:	40 0f 98 c6          	sets   %sil
   19c9e:	40 30 d6             	xor    %dl,%sil
   19ca1:	49 0f af cd          	imul   %r13,%rcx
   19ca5:	44 01 f0             	add    %r14d,%eax
   19ca8:	40 88 74 24 54       	mov    %sil,0x54(%rsp)
   19cad:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
   19cb2:	48 c7 44 24 48 00 00 	movq   $0x0,0x48(%rsp)
   19cb9:	00 00 
   19cbb:	89 44 24 50          	mov    %eax,0x50(%rsp)
   19cbf:	44 89 c8             	mov    %r9d,%eax
   19cc2:	c1 e8 17             	shr    $0x17,%eax
   19cc5:	0f b6 c0             	movzbl %al,%eax
   19cc8:	44 89 c9             	mov    %r9d,%ecx
   19ccb:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   19cd1:	8d 90 6a ff ff ff    	lea    -0x96(%rax),%edx
   19cd7:	31 ed                	xor    %ebp,%ebp
   19cd9:	85 c0                	test   %eax,%eax
   19cdb:	41 bc 6b ff ff ff    	mov    $0xffffff6b,%r12d
   19ce1:	44 0f 45 e2          	cmovne %edx,%r12d
   19ce5:	40 0f 95 c5          	setne  %bpl
   19ce9:	c1 e5 17             	shl    $0x17,%ebp
   19cec:	48 09 cd             	or     %rcx,%rbp
   19cef:	41 c1 e9 1f          	shr    $0x1f,%r9d
   19cf3:	4c 89 4c 24 20       	mov    %r9,0x20(%rsp)
   19cf8:	44 88 4c 24 14       	mov    %r9b,0x14(%rsp)
   19cfd:	48 89 2c 24          	mov    %rbp,(%rsp)
   19d01:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   19d08:	00 00 
   19d0a:	44 89 64 24 10       	mov    %r12d,0x10(%rsp)
   19d0f:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   19d14:	48 8d 4c 24 40       	lea    0x40(%rsp),%rcx
   19d19:	49 89 e0             	mov    %rsp,%r8
   19d1c:	be 00 00 00 80       	mov    $0x80000000,%esi
   19d21:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19d26:	e8 55 42 00 00       	call   1df80 <<hyperinterval::ieee::Format>::add_wide>
   19d2b:	80 7c 24 28 01       	cmpb   $0x1,0x28(%rsp)
   19d30:	0f 84 a4 00 00 00    	je     19dda <<hyperinterval::float::F32Enclosure>::affine+0x23a>
   19d36:	45 85 ff             	test   %r15d,%r15d
   19d39:	0f 98 c0             	sets   %al
   19d3c:	44 8b 7c 24 30       	mov    0x30(%rsp),%r15d
   19d41:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   19d45:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
   19d4a:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
   19d4f:	89 f9                	mov    %edi,%ecx
   19d51:	c1 e9 17             	shr    $0x17,%ecx
   19d54:	0f b6 c9             	movzbl %cl,%ecx
   19d57:	89 fa                	mov    %edi,%edx
   19d59:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
   19d5f:	31 f6                	xor    %esi,%esi
   19d61:	85 c9                	test   %ecx,%ecx
   19d63:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   19d69:	44 0f 45 c1          	cmovne %ecx,%r8d
   19d6d:	40 0f 95 c6          	setne  %sil
   19d71:	c1 e6 17             	shl    $0x17,%esi
   19d74:	48 09 d6             	or     %rdx,%rsi
   19d77:	85 ff                	test   %edi,%edi
   19d79:	0f 98 c1             	sets   %cl
   19d7c:	30 c1                	xor    %al,%cl
   19d7e:	49 0f af f5          	imul   %r13,%rsi
   19d82:	45 01 c6             	add    %r8d,%r14d
   19d85:	88 4c 24 54          	mov    %cl,0x54(%rsp)
   19d89:	48 89 74 24 40       	mov    %rsi,0x40(%rsp)
   19d8e:	48 c7 44 24 48 00 00 	movq   $0x0,0x48(%rsp)
   19d95:	00 00 
   19d97:	44 89 74 24 50       	mov    %r14d,0x50(%rsp)
   19d9c:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
   19da1:	88 44 24 14          	mov    %al,0x14(%rsp)
   19da5:	48 89 2c 24          	mov    %rbp,(%rsp)
   19da9:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   19db0:	00 00 
   19db2:	44 89 64 24 10       	mov    %r12d,0x10(%rsp)
   19db7:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   19dbc:	48 8d 4c 24 40       	lea    0x40(%rsp),%rcx
   19dc1:	49 89 e0             	mov    %rsp,%r8
   19dc4:	be 00 00 00 80       	mov    $0x80000000,%esi
   19dc9:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19dce:	e8 ad 41 00 00       	call   1df80 <<hyperinterval::ieee::Format>::add_wide>
   19dd3:	80 7c 24 28 01       	cmpb   $0x1,0x28(%rsp)
   19dd8:	75 15                	jne    19def <<hyperinterval::float::F32Enclosure>::affine+0x24f>
   19dda:	0f b6 44 24 29       	movzbl 0x29(%rsp),%eax
   19ddf:	e9 1e fe ff ff       	jmp    19c02 <<hyperinterval::float::F32Enclosure>::affine+0x62>
   19de4:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   19dea:	e9 1c fe ff ff       	jmp    19c0b <<hyperinterval::float::F32Enclosure>::affine+0x6b>
   19def:	4c 8b 64 24 30       	mov    0x30(%rsp),%r12
   19df4:	4c 8b 6c 24 38       	mov    0x38(%rsp),%r13
   19df9:	48 89 e7             	mov    %rsp,%rdi
   19dfc:	be 00 00 00 80       	mov    $0x80000000,%esi
   19e01:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19e06:	4c 89 f9             	mov    %r15,%rcx
   19e09:	e8 42 2b 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   19e0e:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19e12:	0f 84 e5 fd ff ff    	je     19bfd <<hyperinterval::float::F32Enclosure>::affine+0x5d>
   19e18:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   19e1d:	48 89 e7             	mov    %rsp,%rdi
   19e20:	be 00 00 00 80       	mov    $0x80000000,%esi
   19e25:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19e2a:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
   19e2f:	e8 1c 2b 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   19e34:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19e38:	0f 84 bf fd ff ff    	je     19bfd <<hyperinterval::float::F32Enclosure>::affine+0x5d>
   19e3e:	44 8b 7c 24 08       	mov    0x8(%rsp),%r15d
   19e43:	44 89 f0             	mov    %r14d,%eax
   19e46:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19e4b:	44 89 f9             	mov    %r15d,%ecx
   19e4e:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19e54:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19e59:	29 c2                	sub    %eax,%edx
   19e5b:	be 00 00 00 80       	mov    $0x80000000,%esi
   19e60:	09 f0                	or     %esi,%eax
   19e62:	45 85 f6             	test   %r14d,%r14d
   19e65:	48 0f 49 d0          	cmovns %rax,%rdx
   19e69:	89 c8                	mov    %ecx,%eax
   19e6b:	09 f0                	or     %esi,%eax
   19e6d:	29 ce                	sub    %ecx,%esi
   19e6f:	45 85 ff             	test   %r15d,%r15d
   19e72:	48 0f 49 f0          	cmovns %rax,%rsi
   19e76:	b0 01                	mov    $0x1,%al
   19e78:	39 f2                	cmp    %esi,%edx
   19e7a:	0f 87 82 fd ff ff    	ja     19c02 <<hyperinterval::float::F32Enclosure>::affine+0x62>
   19e80:	48 89 e7             	mov    %rsp,%rdi
   19e83:	4c 89 e6             	mov    %r12,%rsi
   19e86:	4c 89 ea             	mov    %r13,%rdx
   19e89:	e8 32 06 00 00       	call   1a4c0 <<hyperinterval::float::F32Enclosure>::from_bits>
   19e8e:	8b 04 24             	mov    (%rsp),%eax
   19e91:	83 f8 02             	cmp    $0x2,%eax
   19e94:	75 0a                	jne    19ea0 <<hyperinterval::float::F32Enclosure>::affine+0x300>
   19e96:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   19e9b:	e9 62 fd ff ff       	jmp    19c02 <<hyperinterval::float::F32Enclosure>::affine+0x62>
   19ea0:	83 f8 01             	cmp    $0x1,%eax
   19ea3:	75 19                	jne    19ebe <<hyperinterval::float::F32Enclosure>::affine+0x31e>
   19ea5:	8b 54 24 04          	mov    0x4(%rsp),%edx
   19ea9:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   19ead:	44 89 f7             	mov    %r14d,%edi
   19eb0:	44 89 fe             	mov    %r15d,%esi
   19eb3:	e8 08 44 00 00       	call   1e2c0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   19eb8:	41 89 c6             	mov    %eax,%r14d
   19ebb:	41 89 d7             	mov    %edx,%r15d
   19ebe:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   19ec4:	44 89 73 04          	mov    %r14d,0x4(%rbx)
   19ec8:	44 89 7b 08          	mov    %r15d,0x8(%rbx)
   19ecc:	e9 3a fd ff ff       	jmp    19c0b <<hyperinterval::float::F32Enclosure>::affine+0x6b>
   19ed1:	cc                   	int3
   19ed2:	cc                   	int3
   19ed3:	cc                   	int3
   19ed4:	cc                   	int3
   19ed5:	cc                   	int3
   19ed6:	cc                   	int3
   19ed7:	cc                   	int3
   19ed8:	cc                   	int3
   19ed9:	cc                   	int3
   19eda:	cc                   	int3
   19edb:	cc                   	int3
   19edc:	cc                   	int3
   19edd:	cc                   	int3
   19ede:	cc                   	int3
   19edf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::square:
   19ee0:	55                   	push   %rbp
   19ee1:	41 57                	push   %r15
   19ee3:	41 56                	push   %r14
   19ee5:	41 55                	push   %r13
   19ee7:	41 54                	push   %r12
   19ee9:	53                   	push   %rbx
   19eea:	48 83 ec 48          	sub    $0x48,%rsp
   19eee:	48 89 fb             	mov    %rdi,%rbx
   19ef1:	f6 06 01             	testb  $0x1,(%rsi)
   19ef4:	0f 84 d8 00 00 00    	je     19fd2 <<hyperinterval::float::F32Enclosure>::square+0xf2>
   19efa:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
   19efe:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   19f02:	44 89 f8             	mov    %r15d,%eax
   19f05:	c1 e8 17             	shr    $0x17,%eax
   19f08:	0f b6 c8             	movzbl %al,%ecx
   19f0b:	44 89 fa             	mov    %r15d,%edx
   19f0e:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
   19f14:	31 c0                	xor    %eax,%eax
   19f16:	85 c9                	test   %ecx,%ecx
   19f18:	8d 8c 09 d4 fe ff ff 	lea    -0x12c(%rcx,%rcx,1),%ecx
   19f1f:	41 bc d6 fe ff ff    	mov    $0xfffffed6,%r12d
   19f25:	41 0f 44 cc          	cmove  %r12d,%ecx
   19f29:	0f 95 c0             	setne  %al
   19f2c:	c1 e0 17             	shl    $0x17,%eax
   19f2f:	48 09 d0             	or     %rdx,%rax
   19f32:	48 f7 e0             	mul    %rax
   19f35:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   19f3a:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   19f3f:	48 89 04 24          	mov    %rax,(%rsp)
   19f43:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   19f47:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   19f4c:	48 89 e1             	mov    %rsp,%rcx
   19f4f:	be 00 00 00 80       	mov    $0x80000000,%esi
   19f54:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19f59:	e8 02 3d 00 00       	call   1dc60 <<hyperinterval::ieee::Format>::rounded>
   19f5e:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   19f63:	75 66                	jne    19fcb <<hyperinterval::float::F32Enclosure>::square+0xeb>
   19f65:	44 8b 6c 24 38       	mov    0x38(%rsp),%r13d
   19f6a:	8b 6c 24 40          	mov    0x40(%rsp),%ebp
   19f6e:	44 89 f0             	mov    %r14d,%eax
   19f71:	c1 e8 17             	shr    $0x17,%eax
   19f74:	0f b6 c8             	movzbl %al,%ecx
   19f77:	44 89 f2             	mov    %r14d,%edx
   19f7a:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
   19f80:	31 c0                	xor    %eax,%eax
   19f82:	85 c9                	test   %ecx,%ecx
   19f84:	8d 8c 09 d4 fe ff ff 	lea    -0x12c(%rcx,%rcx,1),%ecx
   19f8b:	41 0f 44 cc          	cmove  %r12d,%ecx
   19f8f:	0f 95 c0             	setne  %al
   19f92:	c1 e0 17             	shl    $0x17,%eax
   19f95:	48 09 d0             	or     %rdx,%rax
   19f98:	48 f7 e0             	mul    %rax
   19f9b:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   19fa0:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   19fa5:	48 89 04 24          	mov    %rax,(%rsp)
   19fa9:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   19fad:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   19fb2:	48 89 e1             	mov    %rsp,%rcx
   19fb5:	be 00 00 00 80       	mov    $0x80000000,%esi
   19fba:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19fbf:	e8 9c 3c 00 00       	call   1dc60 <<hyperinterval::ieee::Format>::rounded>
   19fc4:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   19fc9:	75 0f                	jne    19fda <<hyperinterval::float::F32Enclosure>::square+0xfa>
   19fcb:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   19fd0:	eb 59                	jmp    1a02b <<hyperinterval::float::F32Enclosure>::square+0x14b>
   19fd2:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   19fd8:	eb 5a                	jmp    1a034 <<hyperinterval::float::F32Enclosure>::square+0x154>
   19fda:	8b 44 24 38          	mov    0x38(%rsp),%eax
   19fde:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   19fe3:	44 8b 64 24 40       	mov    0x40(%rsp),%r12d
   19fe8:	48 89 e7             	mov    %rsp,%rdi
   19feb:	be 00 00 00 80       	mov    $0x80000000,%esi
   19ff0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19ff5:	4c 89 e9             	mov    %r13,%rcx
   19ff8:	e8 53 29 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   19ffd:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a001:	74 23                	je     1a026 <<hyperinterval::float::F32Enclosure>::square+0x146>
   1a003:	4d 89 e5             	mov    %r12,%r13
   1a006:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1a00b:	48 89 e7             	mov    %rsp,%rdi
   1a00e:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a013:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a018:	48 89 e9             	mov    %rbp,%rcx
   1a01b:	e8 30 29 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1a020:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a024:	75 20                	jne    1a046 <<hyperinterval::float::F32Enclosure>::square+0x166>
   1a026:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a02b:	88 43 04             	mov    %al,0x4(%rbx)
   1a02e:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1a034:	48 89 d8             	mov    %rbx,%rax
   1a037:	48 83 c4 48          	add    $0x48,%rsp
   1a03b:	5b                   	pop    %rbx
   1a03c:	41 5c                	pop    %r12
   1a03e:	41 5d                	pop    %r13
   1a040:	41 5e                	pop    %r14
   1a042:	41 5f                	pop    %r15
   1a044:	5d                   	pop    %rbp
   1a045:	c3                   	ret
   1a046:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   1a04a:	44 89 e0             	mov    %r12d,%eax
   1a04d:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   1a052:	89 e9                	mov    %ebp,%ecx
   1a054:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1a05a:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1a05f:	29 c2                	sub    %eax,%edx
   1a061:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1a066:	09 f8                	or     %edi,%eax
   1a068:	45 85 e4             	test   %r12d,%r12d
   1a06b:	48 0f 49 d0          	cmovns %rax,%rdx
   1a06f:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a074:	29 ce                	sub    %ecx,%esi
   1a076:	89 c8                	mov    %ecx,%eax
   1a078:	09 f8                	or     %edi,%eax
   1a07a:	85 ed                	test   %ebp,%ebp
   1a07c:	48 0f 49 f0          	cmovns %rax,%rsi
   1a080:	b0 01                	mov    $0x1,%al
   1a082:	39 f2                	cmp    %esi,%edx
   1a084:	77 a5                	ja     1a02b <<hyperinterval::float::F32Enclosure>::square+0x14b>
   1a086:	48 89 e7             	mov    %rsp,%rdi
   1a089:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a08e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a093:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   1a098:	e8 b3 28 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1a09d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a0a1:	74 83                	je     1a026 <<hyperinterval::float::F32Enclosure>::square+0x146>
   1a0a3:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a0a8:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1a0ad:	48 89 e7             	mov    %rsp,%rdi
   1a0b0:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a0b5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a0ba:	4c 89 e9             	mov    %r13,%rcx
   1a0bd:	e8 8e 28 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1a0c2:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a0c6:	0f 84 5a ff ff ff    	je     1a026 <<hyperinterval::float::F32Enclosure>::square+0x146>
   1a0cc:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1a0d0:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   1a0d5:	89 d0                	mov    %edx,%eax
   1a0d7:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   1a0dc:	41 89 c8             	mov    %ecx,%r8d
   1a0df:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1a0e6:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a0eb:	29 c6                	sub    %eax,%esi
   1a0ed:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1a0f2:	09 f8                	or     %edi,%eax
   1a0f4:	85 d2                	test   %edx,%edx
   1a0f6:	48 0f 49 f0          	cmovns %rax,%rsi
   1a0fa:	44 89 c0             	mov    %r8d,%eax
   1a0fd:	09 f8                	or     %edi,%eax
   1a0ff:	44 29 c7             	sub    %r8d,%edi
   1a102:	85 c9                	test   %ecx,%ecx
   1a104:	48 0f 49 f8          	cmovns %rax,%rdi
   1a108:	b0 01                	mov    $0x1,%al
   1a10a:	39 fe                	cmp    %edi,%esi
   1a10c:	0f 87 19 ff ff ff    	ja     1a02b <<hyperinterval::float::F32Enclosure>::square+0x14b>
   1a112:	44 89 e7             	mov    %r12d,%edi
   1a115:	89 ee                	mov    %ebp,%esi
   1a117:	e8 a4 41 00 00       	call   1e2c0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   1a11c:	41 89 c4             	mov    %eax,%r12d
   1a11f:	89 d5                	mov    %edx,%ebp
   1a121:	44 89 ff             	mov    %r15d,%edi
   1a124:	44 89 f6             	mov    %r14d,%esi
   1a127:	31 d2                	xor    %edx,%edx
   1a129:	e8 22 42 00 00       	call   1e350 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::signs>
   1a12e:	a8 02                	test   $0x2,%al
   1a130:	75 12                	jne    1a144 <<hyperinterval::float::F32Enclosure>::square+0x264>
   1a132:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   1a138:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   1a13c:	89 6b 08             	mov    %ebp,0x8(%rbx)
   1a13f:	e9 f0 fe ff ff       	jmp    1a034 <<hyperinterval::float::F32Enclosure>::square+0x154>
   1a144:	48 89 e7             	mov    %rsp,%rdi
   1a147:	31 f6                	xor    %esi,%esi
   1a149:	31 d2                	xor    %edx,%edx
   1a14b:	e8 70 03 00 00       	call   1a4c0 <<hyperinterval::float::F32Enclosure>::from_bits>
   1a150:	8b 04 24             	mov    (%rsp),%eax
   1a153:	83 f8 02             	cmp    $0x2,%eax
   1a156:	75 0a                	jne    1a162 <<hyperinterval::float::F32Enclosure>::square+0x282>
   1a158:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   1a15d:	e9 c9 fe ff ff       	jmp    1a02b <<hyperinterval::float::F32Enclosure>::square+0x14b>
   1a162:	83 f8 01             	cmp    $0x1,%eax
   1a165:	75 cb                	jne    1a132 <<hyperinterval::float::F32Enclosure>::square+0x252>
   1a167:	8b 54 24 04          	mov    0x4(%rsp),%edx
   1a16b:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1a16f:	44 89 e7             	mov    %r12d,%edi
   1a172:	89 ee                	mov    %ebp,%esi
   1a174:	e8 47 41 00 00       	call   1e2c0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull>
   1a179:	41 89 c4             	mov    %eax,%r12d
   1a17c:	89 d5                	mov    %edx,%ebp
   1a17e:	eb b2                	jmp    1a132 <<hyperinterval::float::F32Enclosure>::square+0x252>

<hyperinterval::float::F32Enclosure>::next_up:
   1a180:	48 83 ec 18          	sub    $0x18,%rsp
   1a184:	66 0f 7e c1          	movd   %xmm0,%ecx
   1a188:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a18d:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a192:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a197:	e8 b4 27 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1a19c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a1a1:	75 10                	jne    1a1b3 <<hyperinterval::float::F32Enclosure>::next_up+0x33>
   1a1a3:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1a1a8:	c1 e0 08             	shl    $0x8,%eax
   1a1ab:	48 ff c0             	inc    %rax
   1a1ae:	48 83 c4 18          	add    $0x18,%rsp
   1a1b2:	c3                   	ret
   1a1b3:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1a1b8:	31 c9                	xor    %ecx,%ecx
   1a1ba:	85 c0                	test   %eax,%eax
   1a1bc:	0f 99 c1             	setns  %cl
   1a1bf:	48 8d 0c 48          	lea    (%rax,%rcx,2),%rcx
   1a1c3:	48 ff c9             	dec    %rcx
   1a1c6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a1cb:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a1d0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a1d5:	e8 76 27 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1a1da:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a1df:	75 0a                	jne    1a1eb <<hyperinterval::float::F32Enclosure>::next_up+0x6b>
   1a1e1:	b8 01 05 00 00       	mov    $0x501,%eax
   1a1e6:	48 83 c4 18          	add    $0x18,%rsp
   1a1ea:	c3                   	ret
   1a1eb:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1a1f0:	48 c1 e0 20          	shl    $0x20,%rax
   1a1f4:	48 83 c4 18          	add    $0x18,%rsp
   1a1f8:	c3                   	ret
   1a1f9:	cc                   	int3
   1a1fa:	cc                   	int3
   1a1fb:	cc                   	int3
   1a1fc:	cc                   	int3
   1a1fd:	cc                   	int3
   1a1fe:	cc                   	int3
   1a1ff:	cc                   	int3

<hyperinterval::float::F32Enclosure>::disjoint:
   1a200:	83 3f 00             	cmpl   $0x0,(%rdi)
   1a203:	b0 01                	mov    $0x1,%al
   1a205:	0f 84 a3 00 00 00    	je     1a2ae <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   1a20b:	8b 0e                	mov    (%rsi),%ecx
   1a20d:	85 c9                	test   %ecx,%ecx
   1a20f:	0f 84 99 00 00 00    	je     1a2ae <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   1a215:	f6 c1 01             	test   $0x1,%cl
   1a218:	74 4c                	je     1a266 <<hyperinterval::float::F32Enclosure>::disjoint+0x66>
   1a21a:	53                   	push   %rbx
   1a21b:	8b 56 04             	mov    0x4(%rsi),%edx
   1a21e:	44 8b 47 08          	mov    0x8(%rdi),%r8d
   1a222:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1a228:	45 89 c2             	mov    %r8d,%r10d
   1a22b:	45 09 ca             	or     %r9d,%r10d
   1a22e:	45 89 c3             	mov    %r8d,%r11d
   1a231:	41 81 e3 ff ff ff 7f 	and    $0x7fffffff,%r11d
   1a238:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   1a23d:	44 29 db             	sub    %r11d,%ebx
   1a240:	45 85 c0             	test   %r8d,%r8d
   1a243:	49 0f 49 da          	cmovns %r10,%rbx
   1a247:	41 89 d0             	mov    %edx,%r8d
   1a24a:	45 09 c8             	or     %r9d,%r8d
   1a24d:	41 89 d2             	mov    %edx,%r10d
   1a250:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1a257:	45 29 d1             	sub    %r10d,%r9d
   1a25a:	85 d2                	test   %edx,%edx
   1a25c:	4d 0f 49 c8          	cmovns %r8,%r9
   1a260:	44 39 cb             	cmp    %r9d,%ebx
   1a263:	5b                   	pop    %rbx
   1a264:	72 48                	jb     1a2ae <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   1a266:	f6 c1 01             	test   $0x1,%cl
   1a269:	75 03                	jne    1a26e <<hyperinterval::float::F32Enclosure>::disjoint+0x6e>
   1a26b:	31 c0                	xor    %eax,%eax
   1a26d:	c3                   	ret
   1a26e:	8b 47 04             	mov    0x4(%rdi),%eax
   1a271:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1a274:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1a279:	89 ce                	mov    %ecx,%esi
   1a27b:	09 d6                	or     %edx,%esi
   1a27d:	89 cf                	mov    %ecx,%edi
   1a27f:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1a285:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1a28b:	41 29 f8             	sub    %edi,%r8d
   1a28e:	85 c9                	test   %ecx,%ecx
   1a290:	4c 0f 49 c6          	cmovns %rsi,%r8
   1a294:	89 c1                	mov    %eax,%ecx
   1a296:	09 d1                	or     %edx,%ecx
   1a298:	89 c6                	mov    %eax,%esi
   1a29a:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1a2a0:	29 f2                	sub    %esi,%edx
   1a2a2:	85 c0                	test   %eax,%eax
   1a2a4:	48 0f 49 d1          	cmovns %rcx,%rdx
   1a2a8:	41 39 d0             	cmp    %edx,%r8d
   1a2ab:	0f 92 c0             	setb   %al
   1a2ae:	c3                   	ret
   1a2af:	cc                   	int3

<hyperinterval::float::F32Enclosure>::expanded:
   1a2b0:	41 57                	push   %r15
   1a2b2:	41 56                	push   %r14
   1a2b4:	41 54                	push   %r12
   1a2b6:	53                   	push   %rbx
   1a2b7:	48 83 ec 18          	sub    $0x18,%rsp
   1a2bb:	48 89 fb             	mov    %rdi,%rbx
   1a2be:	f6 06 01             	testb  $0x1,(%rsi)
   1a2c1:	74 7c                	je     1a33f <<hyperinterval::float::F32Enclosure>::expanded+0x8f>
   1a2c3:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   1a2c9:	8b 46 04             	mov    0x4(%rsi),%eax
   1a2cc:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   1a2d0:	8d 88 00 00 00 80    	lea    -0x80000000(%rax),%ecx
   1a2d6:	85 c0                	test   %eax,%eax
   1a2d8:	0f 44 c8             	cmove  %eax,%ecx
   1a2db:	31 c0                	xor    %eax,%eax
   1a2dd:	85 c9                	test   %ecx,%ecx
   1a2df:	0f 99 c0             	setns  %al
   1a2e2:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
   1a2e6:	48 ff c9             	dec    %rcx
   1a2e9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a2ee:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a2f3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a2f8:	e8 53 26 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1a2fd:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   1a302:	75 2f                	jne    1a333 <<hyperinterval::float::F32Enclosure>::expanded+0x83>
   1a304:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1a309:	31 c0                	xor    %eax,%eax
   1a30b:	45 85 f6             	test   %r14d,%r14d
   1a30e:	0f 99 c0             	setns  %al
   1a311:	49 8d 0c 46          	lea    (%r14,%rax,2),%rcx
   1a315:	48 ff c9             	dec    %rcx
   1a318:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a31d:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a322:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a327:	e8 24 26 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1a32c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a331:	75 21                	jne    1a354 <<hyperinterval::float::F32Enclosure>::expanded+0xa4>
   1a333:	c6 43 04 05          	movb   $0x5,0x4(%rbx)
   1a337:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1a33d:	eb 06                	jmp    1a345 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   1a33f:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   1a345:	48 89 d8             	mov    %rbx,%rax
   1a348:	48 83 c4 18          	add    $0x18,%rsp
   1a34c:	5b                   	pop    %rbx
   1a34d:	41 5c                	pop    %r12
   1a34f:	41 5e                	pop    %r14
   1a351:	41 5f                	pop    %r15
   1a353:	c3                   	ret
   1a354:	44 89 e1             	mov    %r12d,%ecx
   1a357:	4c 31 f9             	xor    %r15,%rcx
   1a35a:	4d 85 e4             	test   %r12,%r12
   1a35d:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   1a362:	49 0f 44 cc          	cmove  %r12,%rcx
   1a366:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a36b:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a370:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a375:	e8 d6 25 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1a37a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a37f:	74 23                	je     1a3a4 <<hyperinterval::float::F32Enclosure>::expanded+0xf4>
   1a381:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1a386:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a38b:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a390:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a395:	4c 89 f1             	mov    %r14,%rcx
   1a398:	e8 b3 25 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1a39d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a3a2:	75 10                	jne    1a3b4 <<hyperinterval::float::F32Enclosure>::expanded+0x104>
   1a3a4:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1a3a9:	88 43 04             	mov    %al,0x4(%rbx)
   1a3ac:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1a3b2:	eb 91                	jmp    1a345 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   1a3b4:	8b 44 24 10          	mov    0x10(%rsp),%eax
   1a3b8:	44 89 e1             	mov    %r12d,%ecx
   1a3bb:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1a3c1:	89 c2                	mov    %eax,%edx
   1a3c3:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1a3c9:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a3ce:	29 ce                	sub    %ecx,%esi
   1a3d0:	44 09 f9             	or     %r15d,%ecx
   1a3d3:	45 85 e4             	test   %r12d,%r12d
   1a3d6:	48 0f 49 f1          	cmovns %rcx,%rsi
   1a3da:	89 d1                	mov    %edx,%ecx
   1a3dc:	44 09 f9             	or     %r15d,%ecx
   1a3df:	41 29 d7             	sub    %edx,%r15d
   1a3e2:	85 c0                	test   %eax,%eax
   1a3e4:	4c 0f 49 f9          	cmovns %rcx,%r15
   1a3e8:	44 39 fe             	cmp    %r15d,%esi
   1a3eb:	76 0f                	jbe    1a3fc <<hyperinterval::float::F32Enclosure>::expanded+0x14c>
   1a3ed:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   1a3f1:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1a3f7:	e9 49 ff ff ff       	jmp    1a345 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   1a3fc:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   1a402:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   1a406:	89 43 08             	mov    %eax,0x8(%rbx)
   1a409:	e9 37 ff ff ff       	jmp    1a345 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   1a40e:	cc                   	int3
   1a40f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::overlaps:
   1a410:	31 c0                	xor    %eax,%eax
   1a412:	83 3f 00             	cmpl   $0x0,(%rdi)
   1a415:	0f 84 a1 00 00 00    	je     1a4bc <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1a41b:	8b 0e                	mov    (%rsi),%ecx
   1a41d:	85 c9                	test   %ecx,%ecx
   1a41f:	0f 84 97 00 00 00    	je     1a4bc <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1a425:	f6 c1 01             	test   $0x1,%cl
   1a428:	74 4b                	je     1a475 <<hyperinterval::float::F32Enclosure>::overlaps+0x65>
   1a42a:	8b 46 04             	mov    0x4(%rsi),%eax
   1a42d:	8b 57 08             	mov    0x8(%rdi),%edx
   1a430:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1a436:	41 89 d1             	mov    %edx,%r9d
   1a439:	45 09 c1             	or     %r8d,%r9d
   1a43c:	41 89 d2             	mov    %edx,%r10d
   1a43f:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1a446:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1a44c:	45 29 d3             	sub    %r10d,%r11d
   1a44f:	85 d2                	test   %edx,%edx
   1a451:	4d 0f 49 d9          	cmovns %r9,%r11
   1a455:	89 c2                	mov    %eax,%edx
   1a457:	44 09 c2             	or     %r8d,%edx
   1a45a:	41 89 c1             	mov    %eax,%r9d
   1a45d:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1a464:	45 29 c8             	sub    %r9d,%r8d
   1a467:	85 c0                	test   %eax,%eax
   1a469:	4c 0f 49 c2          	cmovns %rdx,%r8
   1a46d:	45 39 c3             	cmp    %r8d,%r11d
   1a470:	73 03                	jae    1a475 <<hyperinterval::float::F32Enclosure>::overlaps+0x65>
   1a472:	31 c0                	xor    %eax,%eax
   1a474:	c3                   	ret
   1a475:	b0 01                	mov    $0x1,%al
   1a477:	f6 c1 01             	test   $0x1,%cl
   1a47a:	74 40                	je     1a4bc <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1a47c:	8b 47 04             	mov    0x4(%rdi),%eax
   1a47f:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1a482:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1a487:	89 ce                	mov    %ecx,%esi
   1a489:	09 d6                	or     %edx,%esi
   1a48b:	89 cf                	mov    %ecx,%edi
   1a48d:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1a493:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1a499:	41 29 f8             	sub    %edi,%r8d
   1a49c:	85 c9                	test   %ecx,%ecx
   1a49e:	4c 0f 49 c6          	cmovns %rsi,%r8
   1a4a2:	89 c1                	mov    %eax,%ecx
   1a4a4:	09 d1                	or     %edx,%ecx
   1a4a6:	89 c6                	mov    %eax,%esi
   1a4a8:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1a4ae:	29 f2                	sub    %esi,%edx
   1a4b0:	85 c0                	test   %eax,%eax
   1a4b2:	48 0f 49 d1          	cmovns %rcx,%rdx
   1a4b6:	41 39 d0             	cmp    %edx,%r8d
   1a4b9:	0f 93 c0             	setae  %al
   1a4bc:	c3                   	ret
   1a4bd:	cc                   	int3
   1a4be:	cc                   	int3
   1a4bf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::from_bits:
   1a4c0:	41 57                	push   %r15
   1a4c2:	41 56                	push   %r14
   1a4c4:	41 54                	push   %r12
   1a4c6:	53                   	push   %rbx
   1a4c7:	48 83 ec 18          	sub    $0x18,%rsp
   1a4cb:	49 89 d6             	mov    %rdx,%r14
   1a4ce:	48 89 fb             	mov    %rdi,%rbx
   1a4d1:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   1a4d7:	89 f1                	mov    %esi,%ecx
   1a4d9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a4de:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a4e3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a4e8:	e8 63 24 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1a4ed:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a4f2:	74 23                	je     1a517 <<hyperinterval::float::F32Enclosure>::from_bits+0x57>
   1a4f4:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1a4f9:	44 89 f1             	mov    %r14d,%ecx
   1a4fc:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a501:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a506:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a50b:	e8 40 24 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1a510:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a515:	75 1a                	jne    1a531 <<hyperinterval::float::F32Enclosure>::from_bits+0x71>
   1a517:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1a51c:	88 43 04             	mov    %al,0x4(%rbx)
   1a51f:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1a525:	48 83 c4 18          	add    $0x18,%rsp
   1a529:	5b                   	pop    %rbx
   1a52a:	41 5c                	pop    %r12
   1a52c:	41 5e                	pop    %r14
   1a52e:	41 5f                	pop    %r15
   1a530:	c3                   	ret
   1a531:	8b 44 24 10          	mov    0x10(%rsp),%eax
   1a535:	44 89 e1             	mov    %r12d,%ecx
   1a538:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1a53e:	89 c2                	mov    %eax,%edx
   1a540:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1a546:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a54b:	29 ce                	sub    %ecx,%esi
   1a54d:	44 09 f9             	or     %r15d,%ecx
   1a550:	45 85 e4             	test   %r12d,%r12d
   1a553:	48 0f 49 f1          	cmovns %rcx,%rsi
   1a557:	89 d1                	mov    %edx,%ecx
   1a559:	44 09 f9             	or     %r15d,%ecx
   1a55c:	41 29 d7             	sub    %edx,%r15d
   1a55f:	85 c0                	test   %eax,%eax
   1a561:	4c 0f 49 f9          	cmovns %rcx,%r15
   1a565:	44 39 fe             	cmp    %r15d,%esi
   1a568:	76 06                	jbe    1a570 <<hyperinterval::float::F32Enclosure>::from_bits+0xb0>
   1a56a:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   1a56e:	eb af                	jmp    1a51f <<hyperinterval::float::F32Enclosure>::from_bits+0x5f>
   1a570:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   1a576:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   1a57a:	89 43 08             	mov    %eax,0x8(%rbx)
   1a57d:	eb a6                	jmp    1a525 <<hyperinterval::float::F32Enclosure>::from_bits+0x65>
   1a57f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::max_image:
   1a580:	48 89 f8             	mov    %rdi,%rax
   1a583:	31 c9                	xor    %ecx,%ecx
   1a585:	f6 06 01             	testb  $0x1,(%rsi)
   1a588:	0f 84 db 00 00 00    	je     1a669 <<hyperinterval::float::F32Enclosure>::max_image+0xe9>
   1a58e:	f6 02 01             	testb  $0x1,(%rdx)
   1a591:	0f 84 ca 00 00 00    	je     1a661 <<hyperinterval::float::F32Enclosure>::max_image+0xe1>
   1a597:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   1a59c:	f3 0f 7e 4e 04       	movq   0x4(%rsi),%xmm1
   1a5a1:	66 0f ef d2          	pxor   %xmm2,%xmm2
   1a5a5:	66 0f 6f e1          	movdqa %xmm1,%xmm4
   1a5a9:	66 0f 62 e2          	punpckldq %xmm2,%xmm4
   1a5ad:	66 0f 6f e8          	movdqa %xmm0,%xmm5
   1a5b1:	66 0f 62 ea          	punpckldq %xmm2,%xmm5
   1a5b5:	66 0f 6f 1d e3 b8 fe 	movdqa -0x1471d(%rip),%xmm3        # 5ea0 <__abi_tag+0x5ba4>
   1a5bc:	ff 
   1a5bd:	66 0f 6f f4          	movdqa %xmm4,%xmm6
   1a5c1:	66 0f eb f3          	por    %xmm3,%xmm6
   1a5c5:	66 0f 6f 3d 93 b6 fe 	movdqa -0x1496d(%rip),%xmm7        # 5c60 <__abi_tag+0x5964>
   1a5cc:	ff 
   1a5cd:	66 0f db e7          	pand   %xmm7,%xmm4
   1a5d1:	66 44 0f 6f c3       	movdqa %xmm3,%xmm8
   1a5d6:	66 44 0f fb c4       	psubq  %xmm4,%xmm8
   1a5db:	66 0f 70 e1 50       	pshufd $0x50,%xmm1,%xmm4
   1a5e0:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
   1a5e5:	66 44 0f 66 cc       	pcmpgtd %xmm4,%xmm9
   1a5ea:	66 45 0f db c1       	pand   %xmm9,%xmm8
   1a5ef:	66 44 0f df ce       	pandn  %xmm6,%xmm9
   1a5f4:	66 45 0f eb c8       	por    %xmm8,%xmm9
   1a5f9:	66 0f 6f e5          	movdqa %xmm5,%xmm4
   1a5fd:	66 0f eb e3          	por    %xmm3,%xmm4
   1a601:	66 0f db ef          	pand   %xmm7,%xmm5
   1a605:	66 0f 6f f3          	movdqa %xmm3,%xmm6
   1a609:	66 0f fb f5          	psubq  %xmm5,%xmm6
   1a60d:	66 0f 70 e8 50       	pshufd $0x50,%xmm0,%xmm5
   1a612:	66 0f 66 d5          	pcmpgtd %xmm5,%xmm2
   1a616:	66 0f db f2          	pand   %xmm2,%xmm6
   1a61a:	66 0f df d4          	pandn  %xmm4,%xmm2
   1a61e:	66 0f eb d6          	por    %xmm6,%xmm2
   1a622:	66 44 0f ef cb       	pxor   %xmm3,%xmm9
   1a627:	66 0f ef d3          	pxor   %xmm3,%xmm2
   1a62b:	66 0f 6f da          	movdqa %xmm2,%xmm3
   1a62f:	66 41 0f 66 d9       	pcmpgtd %xmm9,%xmm3
   1a634:	66 0f 70 e3 e8       	pshufd $0xe8,%xmm3,%xmm4
   1a639:	66 41 0f 76 d1       	pcmpeqd %xmm9,%xmm2
   1a63e:	66 0f 70 ea fd       	pshufd $0xfd,%xmm2,%xmm5
   1a643:	66 0f db ec          	pand   %xmm4,%xmm5
   1a647:	66 0f 70 d3 fd       	pshufd $0xfd,%xmm3,%xmm2
   1a64c:	66 0f eb d5          	por    %xmm5,%xmm2
   1a650:	66 0f db c2          	pand   %xmm2,%xmm0
   1a654:	66 0f df d1          	pandn  %xmm1,%xmm2
   1a658:	66 0f eb d0          	por    %xmm0,%xmm2
   1a65c:	b9 01 00 00 00       	mov    $0x1,%ecx
   1a661:	89 08                	mov    %ecx,(%rax)
   1a663:	66 0f d6 50 04       	movq   %xmm2,0x4(%rax)
   1a668:	c3                   	ret
   1a669:	89 08                	mov    %ecx,(%rax)
   1a66b:	0f 13 50 04          	movlps %xmm2,0x4(%rax)
   1a66f:	c3                   	ret

<hyperinterval::float::F32Enclosure>::min_image:
   1a670:	48 89 f8             	mov    %rdi,%rax
   1a673:	31 c9                	xor    %ecx,%ecx
   1a675:	f6 06 01             	testb  $0x1,(%rsi)
   1a678:	0f 84 dc 00 00 00    	je     1a75a <<hyperinterval::float::F32Enclosure>::min_image+0xea>
   1a67e:	f6 02 01             	testb  $0x1,(%rdx)
   1a681:	0f 84 cb 00 00 00    	je     1a752 <<hyperinterval::float::F32Enclosure>::min_image+0xe2>
   1a687:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   1a68c:	f3 0f 7e 4e 04       	movq   0x4(%rsi),%xmm1
   1a691:	66 0f ef d2          	pxor   %xmm2,%xmm2
   1a695:	66 0f 6f e1          	movdqa %xmm1,%xmm4
   1a699:	66 0f 62 e2          	punpckldq %xmm2,%xmm4
   1a69d:	66 0f 6f e8          	movdqa %xmm0,%xmm5
   1a6a1:	66 0f 62 ea          	punpckldq %xmm2,%xmm5
   1a6a5:	66 0f 6f 1d f3 b7 fe 	movdqa -0x1480d(%rip),%xmm3        # 5ea0 <__abi_tag+0x5ba4>
   1a6ac:	ff 
   1a6ad:	66 0f 6f f4          	movdqa %xmm4,%xmm6
   1a6b1:	66 0f eb f3          	por    %xmm3,%xmm6
   1a6b5:	66 0f 6f 3d a3 b5 fe 	movdqa -0x14a5d(%rip),%xmm7        # 5c60 <__abi_tag+0x5964>
   1a6bc:	ff 
   1a6bd:	66 0f db e7          	pand   %xmm7,%xmm4
   1a6c1:	66 44 0f 6f c3       	movdqa %xmm3,%xmm8
   1a6c6:	66 44 0f fb c4       	psubq  %xmm4,%xmm8
   1a6cb:	66 0f 70 e1 50       	pshufd $0x50,%xmm1,%xmm4
   1a6d0:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
   1a6d5:	66 44 0f 66 cc       	pcmpgtd %xmm4,%xmm9
   1a6da:	66 45 0f db c1       	pand   %xmm9,%xmm8
   1a6df:	66 44 0f df ce       	pandn  %xmm6,%xmm9
   1a6e4:	66 45 0f eb c8       	por    %xmm8,%xmm9
   1a6e9:	66 0f 6f e5          	movdqa %xmm5,%xmm4
   1a6ed:	66 0f eb e3          	por    %xmm3,%xmm4
   1a6f1:	66 0f db ef          	pand   %xmm7,%xmm5
   1a6f5:	66 0f 6f f3          	movdqa %xmm3,%xmm6
   1a6f9:	66 0f fb f5          	psubq  %xmm5,%xmm6
   1a6fd:	66 0f 70 e8 50       	pshufd $0x50,%xmm0,%xmm5
   1a702:	66 0f 66 d5          	pcmpgtd %xmm5,%xmm2
   1a706:	66 0f db f2          	pand   %xmm2,%xmm6
   1a70a:	66 0f df d4          	pandn  %xmm4,%xmm2
   1a70e:	66 0f eb d6          	por    %xmm6,%xmm2
   1a712:	66 0f ef d3          	pxor   %xmm3,%xmm2
   1a716:	66 44 0f ef cb       	pxor   %xmm3,%xmm9
   1a71b:	66 41 0f 6f d9       	movdqa %xmm9,%xmm3
   1a720:	66 0f 66 da          	pcmpgtd %xmm2,%xmm3
   1a724:	66 0f 70 e3 e8       	pshufd $0xe8,%xmm3,%xmm4
   1a729:	66 44 0f 76 ca       	pcmpeqd %xmm2,%xmm9
   1a72e:	66 41 0f 70 e9 fd    	pshufd $0xfd,%xmm9,%xmm5
   1a734:	66 0f db ec          	pand   %xmm4,%xmm5
   1a738:	66 0f 70 d3 fd       	pshufd $0xfd,%xmm3,%xmm2
   1a73d:	66 0f eb d5          	por    %xmm5,%xmm2
   1a741:	66 0f db c2          	pand   %xmm2,%xmm0
   1a745:	66 0f df d1          	pandn  %xmm1,%xmm2
   1a749:	66 0f eb d0          	por    %xmm0,%xmm2
   1a74d:	b9 01 00 00 00       	mov    $0x1,%ecx
   1a752:	89 08                	mov    %ecx,(%rax)
   1a754:	66 0f d6 50 04       	movq   %xmm2,0x4(%rax)
   1a759:	c3                   	ret
   1a75a:	89 08                	mov    %ecx,(%rax)
   1a75c:	0f 13 50 04          	movlps %xmm2,0x4(%rax)
   1a760:	c3                   	ret
   1a761:	cc                   	int3
   1a762:	cc                   	int3
   1a763:	cc                   	int3
   1a764:	cc                   	int3
   1a765:	cc                   	int3
   1a766:	cc                   	int3
   1a767:	cc                   	int3
   1a768:	cc                   	int3
   1a769:	cc                   	int3
   1a76a:	cc                   	int3
   1a76b:	cc                   	int3
   1a76c:	cc                   	int3
   1a76d:	cc                   	int3
   1a76e:	cc                   	int3
   1a76f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::next_down:
   1a770:	53                   	push   %rbx
   1a771:	48 83 ec 10          	sub    $0x10,%rsp
   1a775:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   1a77a:	66 0f 7e c1          	movd   %xmm0,%ecx
   1a77e:	48 89 e7             	mov    %rsp,%rdi
   1a781:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a786:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a78b:	e8 c0 21 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1a790:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a794:	75 11                	jne    1a7a7 <<hyperinterval::float::F32Enclosure>::next_down+0x37>
   1a796:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a79b:	c1 e0 08             	shl    $0x8,%eax
   1a79e:	48 ff c0             	inc    %rax
   1a7a1:	48 83 c4 10          	add    $0x10,%rsp
   1a7a5:	5b                   	pop    %rbx
   1a7a6:	c3                   	ret
   1a7a7:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a7ac:	48 89 c1             	mov    %rax,%rcx
   1a7af:	48 31 d9             	xor    %rbx,%rcx
   1a7b2:	48 85 c0             	test   %rax,%rax
   1a7b5:	48 0f 44 c8          	cmove  %rax,%rcx
   1a7b9:	31 c0                	xor    %eax,%eax
   1a7bb:	85 c9                	test   %ecx,%ecx
   1a7bd:	0f 99 c0             	setns  %al
   1a7c0:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
   1a7c4:	48 ff c9             	dec    %rcx
   1a7c7:	48 89 e7             	mov    %rsp,%rdi
   1a7ca:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a7cf:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a7d4:	e8 77 21 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1a7d9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a7dd:	75 0b                	jne    1a7ea <<hyperinterval::float::F32Enclosure>::next_down+0x7a>
   1a7df:	b8 01 05 00 00       	mov    $0x501,%eax
   1a7e4:	48 83 c4 10          	add    $0x10,%rsp
   1a7e8:	5b                   	pop    %rbx
   1a7e9:	c3                   	ret
   1a7ea:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a7ef:	48 89 c8             	mov    %rcx,%rax
   1a7f2:	48 35 00 00 00 80    	xor    $0xffffffff80000000,%rax
   1a7f8:	48 c1 e0 20          	shl    $0x20,%rax
   1a7fc:	48 85 c9             	test   %rcx,%rcx
   1a7ff:	48 0f 44 c1          	cmove  %rcx,%rax
   1a803:	48 83 c4 10          	add    $0x10,%rsp
   1a807:	5b                   	pop    %rbx
   1a808:	c3                   	ret
   1a809:	cc                   	int3
   1a80a:	cc                   	int3
   1a80b:	cc                   	int3
   1a80c:	cc                   	int3
   1a80d:	cc                   	int3
   1a80e:	cc                   	int3
   1a80f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::subset_of:
   1a810:	b0 01                	mov    $0x1,%al
   1a812:	f6 07 01             	testb  $0x1,(%rdi)
   1a815:	74 50                	je     1a867 <<hyperinterval::float::F32Enclosure>::subset_of+0x57>
   1a817:	f6 06 01             	testb  $0x1,(%rsi)
   1a81a:	74 49                	je     1a865 <<hyperinterval::float::F32Enclosure>::subset_of+0x55>
   1a81c:	8b 4f 04             	mov    0x4(%rdi),%ecx
   1a81f:	8b 56 04             	mov    0x4(%rsi),%edx
   1a822:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1a827:	44 8d 04 02          	lea    (%rdx,%rax,1),%r8d
   1a82b:	41 89 d1             	mov    %edx,%r9d
   1a82e:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1a835:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1a83b:	45 29 ca             	sub    %r9d,%r10d
   1a83e:	85 d2                	test   %edx,%edx
   1a840:	4d 0f 49 d0          	cmovns %r8,%r10
   1a844:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1a847:	41 89 c8             	mov    %ecx,%r8d
   1a84a:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1a851:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1a857:	45 29 c1             	sub    %r8d,%r9d
   1a85a:	85 c9                	test   %ecx,%ecx
   1a85c:	4c 0f 49 ca          	cmovns %rdx,%r9
   1a860:	45 39 ca             	cmp    %r9d,%r10d
   1a863:	76 03                	jbe    1a868 <<hyperinterval::float::F32Enclosure>::subset_of+0x58>
   1a865:	31 c0                	xor    %eax,%eax
   1a867:	c3                   	ret
   1a868:	8b 4f 08             	mov    0x8(%rdi),%ecx
   1a86b:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1a86e:	89 cf                	mov    %ecx,%edi
   1a870:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1a876:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1a87c:	41 29 f8             	sub    %edi,%r8d
   1a87f:	85 c9                	test   %ecx,%ecx
   1a881:	4c 0f 49 c2          	cmovns %rdx,%r8
   1a885:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1a888:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1a88b:	89 ce                	mov    %ecx,%esi
   1a88d:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1a893:	29 f0                	sub    %esi,%eax
   1a895:	85 c9                	test   %ecx,%ecx
   1a897:	48 0f 49 c2          	cmovns %rdx,%rax
   1a89b:	41 39 c0             	cmp    %eax,%r8d
   1a89e:	0f 96 c0             	setbe  %al
   1a8a1:	c3                   	ret
   1a8a2:	cc                   	int3
   1a8a3:	cc                   	int3
   1a8a4:	cc                   	int3
   1a8a5:	cc                   	int3
   1a8a6:	cc                   	int3
   1a8a7:	cc                   	int3
   1a8a8:	cc                   	int3
   1a8a9:	cc                   	int3
   1a8aa:	cc                   	int3
   1a8ab:	cc                   	int3
   1a8ac:	cc                   	int3
   1a8ad:	cc                   	int3
   1a8ae:	cc                   	int3
   1a8af:	cc                   	int3

<hyperinterval::float::F64Enclosure>::reciprocal:
   1a8b0:	55                   	push   %rbp
   1a8b1:	41 57                	push   %r15
   1a8b3:	41 56                	push   %r14
   1a8b5:	41 55                	push   %r13
   1a8b7:	41 54                	push   %r12
   1a8b9:	53                   	push   %rbx
   1a8ba:	48 83 ec 28          	sub    $0x28,%rsp
   1a8be:	48 89 fb             	mov    %rdi,%rbx
   1a8c1:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1a8c5:	74 65                	je     1a92c <<hyperinterval::float::F64Enclosure>::reciprocal+0x7c>
   1a8c7:	49 89 f6             	mov    %rsi,%r14
   1a8ca:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
   1a8d1:	00 00 80 
   1a8d4:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1a8db:	00 f0 7f 
   1a8de:	49 bd 00 00 00 00 00 	movabs $0x3ff0000000000000,%r13
   1a8e5:	00 f0 3f 
   1a8e8:	48 89 e7             	mov    %rsp,%rdi
   1a8eb:	4c 89 fe             	mov    %r15,%rsi
   1a8ee:	4c 89 e2             	mov    %r12,%rdx
   1a8f1:	4c 89 e9             	mov    %r13,%rcx
   1a8f4:	e8 57 20 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1a8f9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a8fd:	74 1c                	je     1a91b <<hyperinterval::float::F64Enclosure>::reciprocal+0x6b>
   1a8ff:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1a904:	48 89 e7             	mov    %rsp,%rdi
   1a907:	4c 89 fe             	mov    %r15,%rsi
   1a90a:	4c 89 e2             	mov    %r12,%rdx
   1a90d:	4c 89 e9             	mov    %r13,%rcx
   1a910:	e8 3b 20 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1a915:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a919:	75 2a                	jne    1a945 <<hyperinterval::float::F64Enclosure>::reciprocal+0x95>
   1a91b:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   1a920:	88 53 08             	mov    %dl,0x8(%rbx)
   1a923:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a92a:	eb 07                	jmp    1a933 <<hyperinterval::float::F64Enclosure>::reciprocal+0x83>
   1a92c:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1a933:	48 89 d8             	mov    %rbx,%rax
   1a936:	48 83 c4 28          	add    $0x28,%rsp
   1a93a:	5b                   	pop    %rbx
   1a93b:	41 5c                	pop    %r12
   1a93d:	41 5d                	pop    %r13
   1a93f:	41 5e                	pop    %r14
   1a941:	41 5f                	pop    %r15
   1a943:	5d                   	pop    %rbp
   1a944:	c3                   	ret
   1a945:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a94a:	49 8d 14 2f          	lea    (%r15,%rbp,1),%rdx
   1a94e:	49 8d 47 ff          	lea    -0x1(%r15),%rax
   1a952:	48 89 ee             	mov    %rbp,%rsi
   1a955:	48 21 c6             	and    %rax,%rsi
   1a958:	4c 89 ff             	mov    %r15,%rdi
   1a95b:	48 29 f7             	sub    %rsi,%rdi
   1a95e:	48 85 ed             	test   %rbp,%rbp
   1a961:	48 0f 49 fa          	cmovns %rdx,%rdi
   1a965:	4a 8d 14 39          	lea    (%rcx,%r15,1),%rdx
   1a969:	48 89 ce             	mov    %rcx,%rsi
   1a96c:	48 21 c6             	and    %rax,%rsi
   1a96f:	49 29 f7             	sub    %rsi,%r15
   1a972:	48 85 c9             	test   %rcx,%rcx
   1a975:	4c 0f 49 fa          	cmovns %rdx,%r15
   1a979:	b2 01                	mov    $0x1,%dl
   1a97b:	4c 39 ff             	cmp    %r15,%rdi
   1a97e:	77 a0                	ja     1a920 <<hyperinterval::float::F64Enclosure>::reciprocal+0x70>
   1a980:	48 c7 44 24 10 01 00 	movq   $0x1,0x10(%rsp)
   1a987:	00 00 
   1a989:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
   1a98e:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   1a993:	49 83 7e 08 00       	cmpq   $0x0,0x8(%r14)
   1a998:	7f 0e                	jg     1a9a8 <<hyperinterval::float::F64Enclosure>::reciprocal+0xf8>
   1a99a:	49 8b 4e 10          	mov    0x10(%r14),%rcx
   1a99e:	48 85 c9             	test   %rcx,%rcx
   1a9a1:	79 1f                	jns    1a9c2 <<hyperinterval::float::F64Enclosure>::reciprocal+0x112>
   1a9a3:	48 21 c1             	and    %rax,%rcx
   1a9a6:	74 1a                	je     1a9c2 <<hyperinterval::float::F64Enclosure>::reciprocal+0x112>
   1a9a8:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
   1a9ad:	48 89 df             	mov    %rbx,%rdi
   1a9b0:	4c 89 f2             	mov    %r14,%rdx
   1a9b3:	b9 01 00 00 00       	mov    $0x1,%ecx
   1a9b8:	e8 93 02 00 00       	call   1ac50 <<hyperinterval::float::F64Enclosure>::corner_image>
   1a9bd:	e9 71 ff ff ff       	jmp    1a933 <<hyperinterval::float::F64Enclosure>::reciprocal+0x83>
   1a9c2:	c6 43 08 06          	movb   $0x6,0x8(%rbx)
   1a9c6:	e9 58 ff ff ff       	jmp    1a923 <<hyperinterval::float::F64Enclosure>::reciprocal+0x73>
   1a9cb:	cc                   	int3
   1a9cc:	cc                   	int3
   1a9cd:	cc                   	int3
   1a9ce:	cc                   	int3
   1a9cf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::checked_pow:
   1a9d0:	55                   	push   %rbp
   1a9d1:	41 57                	push   %r15
   1a9d3:	41 56                	push   %r14
   1a9d5:	41 55                	push   %r13
   1a9d7:	41 54                	push   %r12
   1a9d9:	53                   	push   %rbx
   1a9da:	48 83 ec 48          	sub    $0x48,%rsp
   1a9de:	48 89 fb             	mov    %rdi,%rbx
   1a9e1:	83 fa 02             	cmp    $0x2,%edx
   1a9e4:	75 0e                	jne    1a9f4 <<hyperinterval::float::F64Enclosure>::checked_pow+0x24>
   1a9e6:	48 89 df             	mov    %rbx,%rdi
   1a9e9:	ff 15 c9 2e 04 00    	call   *0x42ec9(%rip)        # 5d8b8 <_DYNAMIC+0x2f0>
   1a9ef:	e9 e0 00 00 00       	jmp    1aad4 <<hyperinterval::float::F64Enclosure>::checked_pow+0x104>
   1a9f4:	f6 06 01             	testb  $0x1,(%rsi)
   1a9f7:	0f 84 d0 00 00 00    	je     1aacd <<hyperinterval::float::F64Enclosure>::checked_pow+0xfd>
   1a9fd:	89 d5                	mov    %edx,%ebp
   1a9ff:	4c 8b 76 10          	mov    0x10(%rsi),%r14
   1aa03:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
   1aa0a:	00 00 80 
   1aa0d:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   1aa14:	00 f0 7f 
   1aa17:	4c 8b 7e 08          	mov    0x8(%rsi),%r15
   1aa1b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1aa20:	4c 89 e6             	mov    %r12,%rsi
   1aa23:	4c 89 ea             	mov    %r13,%rdx
   1aa26:	4c 89 f9             	mov    %r15,%rcx
   1aa29:	41 89 e8             	mov    %ebp,%r8d
   1aa2c:	e8 2f 2e 00 00       	call   1d860 <<hyperinterval::ieee::Format>::power>
   1aa31:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   1aa36:	0f 85 80 00 00 00    	jne    1aabc <<hyperinterval::float::F64Enclosure>::checked_pow+0xec>
   1aa3c:	4c 89 f1             	mov    %r14,%rcx
   1aa3f:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   1aa44:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1aa49:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1aa4e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1aa53:	4c 89 e6             	mov    %r12,%rsi
   1aa56:	4c 89 ea             	mov    %r13,%rdx
   1aa59:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
   1aa5e:	41 89 e8             	mov    %ebp,%r8d
   1aa61:	e8 fa 2d 00 00       	call   1d860 <<hyperinterval::ieee::Format>::power>
   1aa66:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1aa6b:	74 4f                	je     1aabc <<hyperinterval::float::F64Enclosure>::checked_pow+0xec>
   1aa6d:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1aa72:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1aa77:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1aa7c:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1aa81:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1aa86:	4c 89 e6             	mov    %r12,%rsi
   1aa89:	4c 89 ea             	mov    %r13,%rdx
   1aa8c:	4c 89 f1             	mov    %r14,%rcx
   1aa8f:	e8 bc 1e 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1aa94:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1aa99:	74 21                	je     1aabc <<hyperinterval::float::F64Enclosure>::checked_pow+0xec>
   1aa9b:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   1aaa0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1aaa5:	4c 89 e6             	mov    %r12,%rsi
   1aaa8:	4c 89 ea             	mov    %r13,%rdx
   1aaab:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   1aab0:	e8 9b 1e 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1aab5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1aaba:	75 2a                	jne    1aae6 <<hyperinterval::float::F64Enclosure>::checked_pow+0x116>
   1aabc:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1aac1:	88 43 08             	mov    %al,0x8(%rbx)
   1aac4:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1aacb:	eb 07                	jmp    1aad4 <<hyperinterval::float::F64Enclosure>::checked_pow+0x104>
   1aacd:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1aad4:	48 89 d8             	mov    %rbx,%rax
   1aad7:	48 83 c4 48          	add    $0x48,%rsp
   1aadb:	5b                   	pop    %rbx
   1aadc:	41 5c                	pop    %r12
   1aade:	41 5d                	pop    %r13
   1aae0:	41 5e                	pop    %r14
   1aae2:	41 5f                	pop    %r15
   1aae4:	5d                   	pop    %rbp
   1aae5:	c3                   	ret
   1aae6:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
   1aaeb:	4b 8d 04 26          	lea    (%r14,%r12,1),%rax
   1aaef:	4c 89 f6             	mov    %r14,%rsi
   1aaf2:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
   1aaf7:	48 89 f1             	mov    %rsi,%rcx
   1aafa:	4c 21 f1             	and    %r14,%rcx
   1aafd:	4c 89 e2             	mov    %r12,%rdx
   1ab00:	48 29 ca             	sub    %rcx,%rdx
   1ab03:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
   1ab08:	48 85 f6             	test   %rsi,%rsi
   1ab0b:	48 0f 49 d0          	cmovns %rax,%rdx
   1ab0f:	4a 8d 04 27          	lea    (%rdi,%r12,1),%rax
   1ab13:	48 89 f9             	mov    %rdi,%rcx
   1ab16:	4c 21 f1             	and    %r14,%rcx
   1ab19:	4c 89 e6             	mov    %r12,%rsi
   1ab1c:	48 29 ce             	sub    %rcx,%rsi
   1ab1f:	48 85 ff             	test   %rdi,%rdi
   1ab22:	48 0f 49 f0          	cmovns %rax,%rsi
   1ab26:	b0 01                	mov    $0x1,%al
   1ab28:	48 39 f2             	cmp    %rsi,%rdx
   1ab2b:	77 94                	ja     1aac1 <<hyperinterval::float::F64Enclosure>::checked_pow+0xf1>
   1ab2d:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
   1ab32:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1ab37:	4c 89 e6             	mov    %r12,%rsi
   1ab3a:	4c 89 ea             	mov    %r13,%rdx
   1ab3d:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1ab42:	e8 09 1e 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1ab47:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1ab4c:	0f 84 6a ff ff ff    	je     1aabc <<hyperinterval::float::F64Enclosure>::checked_pow+0xec>
   1ab52:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1ab57:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1ab5c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1ab61:	4c 89 e6             	mov    %r12,%rsi
   1ab64:	4c 89 ea             	mov    %r13,%rdx
   1ab67:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   1ab6c:	e8 df 1d 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1ab71:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1ab76:	0f 84 40 ff ff ff    	je     1aabc <<hyperinterval::float::F64Enclosure>::checked_pow+0xec>
   1ab7c:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1ab81:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
   1ab86:	4a 8d 04 22          	lea    (%rdx,%r12,1),%rax
   1ab8a:	48 89 d7             	mov    %rdx,%rdi
   1ab8d:	4c 21 f7             	and    %r14,%rdi
   1ab90:	4c 89 e6             	mov    %r12,%rsi
   1ab93:	48 29 fe             	sub    %rdi,%rsi
   1ab96:	48 85 d2             	test   %rdx,%rdx
   1ab99:	48 0f 49 f0          	cmovns %rax,%rsi
   1ab9d:	4a 8d 04 21          	lea    (%rcx,%r12,1),%rax
   1aba1:	49 21 ce             	and    %rcx,%r14
   1aba4:	4d 29 f4             	sub    %r14,%r12
   1aba7:	48 85 c9             	test   %rcx,%rcx
   1abaa:	4c 0f 49 e0          	cmovns %rax,%r12
   1abae:	b0 01                	mov    $0x1,%al
   1abb0:	4c 39 e6             	cmp    %r12,%rsi
   1abb3:	0f 87 08 ff ff ff    	ja     1aac1 <<hyperinterval::float::F64Enclosure>::checked_pow+0xf1>
   1abb9:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1abbe:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   1abc3:	e8 18 38 00 00       	call   1e3e0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1abc8:	49 89 c5             	mov    %rax,%r13
   1abcb:	49 89 d4             	mov    %rdx,%r12
   1abce:	85 ed                	test   %ebp,%ebp
   1abd0:	0f 95 c0             	setne  %al
   1abd3:	40 f6 c5 01          	test   $0x1,%bpl
   1abd7:	0f 94 c1             	sete   %cl
   1abda:	84 c8                	test   %cl,%al
   1abdc:	74 13                	je     1abf1 <<hyperinterval::float::F64Enclosure>::checked_pow+0x221>
   1abde:	4c 89 ff             	mov    %r15,%rdi
   1abe1:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
   1abe6:	31 d2                	xor    %edx,%edx
   1abe8:	e8 73 38 00 00       	call   1e460 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::signs>
   1abed:	a8 02                	test   $0x2,%al
   1abef:	75 14                	jne    1ac05 <<hyperinterval::float::F64Enclosure>::checked_pow+0x235>
   1abf1:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1abf8:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1abfc:	4c 89 63 10          	mov    %r12,0x10(%rbx)
   1ac00:	e9 cf fe ff ff       	jmp    1aad4 <<hyperinterval::float::F64Enclosure>::checked_pow+0x104>
   1ac05:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1ac0a:	31 f6                	xor    %esi,%esi
   1ac0c:	31 d2                	xor    %edx,%edx
   1ac0e:	e8 ad 19 00 00       	call   1c5c0 <<hyperinterval::float::F64Enclosure>::from_bits>
   1ac13:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1ac18:	48 83 f8 02          	cmp    $0x2,%rax
   1ac1c:	75 0a                	jne    1ac28 <<hyperinterval::float::F64Enclosure>::checked_pow+0x258>
   1ac1e:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   1ac23:	e9 99 fe ff ff       	jmp    1aac1 <<hyperinterval::float::F64Enclosure>::checked_pow+0xf1>
   1ac28:	83 f8 01             	cmp    $0x1,%eax
   1ac2b:	75 c4                	jne    1abf1 <<hyperinterval::float::F64Enclosure>::checked_pow+0x221>
   1ac2d:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   1ac32:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1ac37:	4c 89 ef             	mov    %r13,%rdi
   1ac3a:	4c 89 e6             	mov    %r12,%rsi
   1ac3d:	e8 9e 37 00 00       	call   1e3e0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1ac42:	49 89 c5             	mov    %rax,%r13
   1ac45:	49 89 d4             	mov    %rdx,%r12
   1ac48:	eb a7                	jmp    1abf1 <<hyperinterval::float::F64Enclosure>::checked_pow+0x221>
   1ac4a:	cc                   	int3
   1ac4b:	cc                   	int3
   1ac4c:	cc                   	int3
   1ac4d:	cc                   	int3
   1ac4e:	cc                   	int3
   1ac4f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::corner_image:
   1ac50:	55                   	push   %rbp
   1ac51:	41 57                	push   %r15
   1ac53:	41 56                	push   %r14
   1ac55:	41 55                	push   %r13
   1ac57:	41 54                	push   %r12
   1ac59:	53                   	push   %rbx
   1ac5a:	48 83 ec 68          	sub    $0x68,%rsp
   1ac5e:	48 89 fb             	mov    %rdi,%rbx
   1ac61:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1ac65:	75 5f                	jne    1acc6 <<hyperinterval::float::F64Enclosure>::corner_image+0x76>
   1ac67:	f6 02 01             	testb  $0x1,(%rdx)
   1ac6a:	74 5a                	je     1acc6 <<hyperinterval::float::F64Enclosure>::corner_image+0x76>
   1ac6c:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1ac73:	00 00 80 
   1ac76:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   1ac7d:	00 f0 7f 
   1ac80:	4c 8b 66 08          	mov    0x8(%rsi),%r12
   1ac84:	48 8b 46 10          	mov    0x10(%rsi),%rax
   1ac88:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1ac8d:	48 8b 6a 08          	mov    0x8(%rdx),%rbp
   1ac91:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1ac95:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1ac9a:	84 c9                	test   %cl,%cl
   1ac9c:	74 34                	je     1acd2 <<hyperinterval::float::F64Enclosure>::corner_image+0x82>
   1ac9e:	48 89 e7             	mov    %rsp,%rdi
   1aca1:	4c 89 f6             	mov    %r14,%rsi
   1aca4:	4c 89 ea             	mov    %r13,%rdx
   1aca7:	4c 89 e1             	mov    %r12,%rcx
   1acaa:	49 89 e8             	mov    %rbp,%r8
   1acad:	e8 8e 1f 00 00       	call   1cc40 <<hyperinterval::ieee::Format>::div>
   1acb2:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1acb6:	0f 84 c3 00 00 00    	je     1ad7f <<hyperinterval::float::F64Enclosure>::corner_image+0x12f>
   1acbc:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1acc1:	e9 b1 00 00 00       	jmp    1ad77 <<hyperinterval::float::F64Enclosure>::corner_image+0x127>
   1acc6:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1accd:	e9 12 04 00 00       	jmp    1b0e4 <<hyperinterval::float::F64Enclosure>::corner_image+0x494>
   1acd2:	4c 89 e1             	mov    %r12,%rcx
   1acd5:	48 c1 e9 34          	shr    $0x34,%rcx
   1acd9:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1acdf:	48 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%rdx
   1ace6:	ff 0f 00 
   1ace9:	4c 89 e7             	mov    %r12,%rdi
   1acec:	48 21 d7             	and    %rdx,%rdi
   1acef:	48 8d 42 01          	lea    0x1(%rdx),%rax
   1acf3:	44 8d 81 9a f7 ff ff 	lea    -0x866(%rcx),%r8d
   1acfa:	48 85 c9             	test   %rcx,%rcx
   1acfd:	48 0f 45 c8          	cmovne %rax,%rcx
   1ad01:	be 9b f7 ff ff       	mov    $0xfffff79b,%esi
   1ad06:	41 0f 45 f0          	cmovne %r8d,%esi
   1ad0a:	48 09 f9             	or     %rdi,%rcx
   1ad0d:	48 89 ef             	mov    %rbp,%rdi
   1ad10:	48 c1 ef 34          	shr    $0x34,%rdi
   1ad14:	81 e7 ff 07 00 00    	and    $0x7ff,%edi
   1ad1a:	48 21 ea             	and    %rbp,%rdx
   1ad1d:	48 85 ff             	test   %rdi,%rdi
   1ad20:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1ad26:	44 0f 45 c7          	cmovne %edi,%r8d
   1ad2a:	48 0f 44 c7          	cmove  %rdi,%rax
   1ad2e:	48 09 d0             	or     %rdx,%rax
   1ad31:	48 89 ef             	mov    %rbp,%rdi
   1ad34:	4c 31 e7             	xor    %r12,%rdi
   1ad37:	48 f7 e1             	mul    %rcx
   1ad3a:	41 01 f0             	add    %esi,%r8d
   1ad3d:	48 c1 ef 3f          	shr    $0x3f,%rdi
   1ad41:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
   1ad46:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1ad4b:	48 89 04 24          	mov    %rax,(%rsp)
   1ad4f:	44 89 44 24 10       	mov    %r8d,0x10(%rsp)
   1ad54:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1ad59:	48 89 e1             	mov    %rsp,%rcx
   1ad5c:	4c 89 f6             	mov    %r14,%rsi
   1ad5f:	4c 89 ea             	mov    %r13,%rdx
   1ad62:	e8 f9 2e 00 00       	call   1dc60 <<hyperinterval::ieee::Format>::rounded>
   1ad67:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1ad6c:	0f 84 22 03 00 00    	je     1b094 <<hyperinterval::float::F64Enclosure>::corner_image+0x444>
   1ad72:	0f b6 44 24 41       	movzbl 0x41(%rsp),%eax
   1ad77:	88 43 08             	mov    %al,0x8(%rbx)
   1ad7a:	e9 5e 03 00 00       	jmp    1b0dd <<hyperinterval::float::F64Enclosure>::corner_image+0x48d>
   1ad7f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1ad84:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1ad89:	48 89 e7             	mov    %rsp,%rdi
   1ad8c:	4c 89 f6             	mov    %r14,%rsi
   1ad8f:	4c 89 ea             	mov    %r13,%rdx
   1ad92:	e8 b9 1b 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1ad97:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ad9b:	0f 85 32 03 00 00    	jne    1b0d3 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1ada1:	4c 89 f6             	mov    %r14,%rsi
   1ada4:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   1ada9:	48 89 e7             	mov    %rsp,%rdi
   1adac:	4c 89 ea             	mov    %r13,%rdx
   1adaf:	4c 89 f9             	mov    %r15,%rcx
   1adb2:	e8 99 1b 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1adb7:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1adbb:	0f 85 12 03 00 00    	jne    1b0d3 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1adc1:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   1adc6:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1adcd:	00 00 80 
   1add0:	49 8d 04 36          	lea    (%r14,%rsi,1),%rax
   1add4:	4c 8d 6e ff          	lea    -0x1(%rsi),%r13
   1add8:	4c 89 f1             	mov    %r14,%rcx
   1addb:	4c 21 e9             	and    %r13,%rcx
   1adde:	48 89 f2             	mov    %rsi,%rdx
   1ade1:	48 29 ca             	sub    %rcx,%rdx
   1ade4:	4d 85 f6             	test   %r14,%r14
   1ade7:	48 0f 49 d0          	cmovns %rax,%rdx
   1adeb:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
   1adef:	48 89 f9             	mov    %rdi,%rcx
   1adf2:	4c 21 e9             	and    %r13,%rcx
   1adf5:	48 29 ce             	sub    %rcx,%rsi
   1adf8:	48 85 ff             	test   %rdi,%rdi
   1adfb:	48 0f 49 f0          	cmovns %rax,%rsi
   1adff:	41 b7 01             	mov    $0x1,%r15b
   1ae02:	48 39 f2             	cmp    %rsi,%rdx
   1ae05:	0f 87 ce 02 00 00    	ja     1b0d9 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1ae0b:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1ae10:	4c 89 74 24 38       	mov    %r14,0x38(%rsp)
   1ae15:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
   1ae1a:	48 89 e7             	mov    %rsp,%rdi
   1ae1d:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1ae24:	00 00 80 
   1ae27:	4c 89 f6             	mov    %r14,%rsi
   1ae2a:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   1ae31:	00 f0 7f 
   1ae34:	4c 89 ea             	mov    %r13,%rdx
   1ae37:	4c 89 e1             	mov    %r12,%rcx
   1ae3a:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1ae3f:	e8 fc 1d 00 00       	call   1cc40 <<hyperinterval::ieee::Format>::div>
   1ae44:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ae48:	0f 85 6e fe ff ff    	jne    1acbc <<hyperinterval::float::F64Enclosure>::corner_image+0x6c>
   1ae4e:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1ae53:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1ae58:	48 89 e7             	mov    %rsp,%rdi
   1ae5b:	4c 89 f6             	mov    %r14,%rsi
   1ae5e:	4c 89 ea             	mov    %r13,%rdx
   1ae61:	e8 ea 1a 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1ae66:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ae6a:	0f 85 63 02 00 00    	jne    1b0d3 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1ae70:	4c 89 ea             	mov    %r13,%rdx
   1ae73:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1ae78:	48 89 e7             	mov    %rsp,%rdi
   1ae7b:	4c 89 f6             	mov    %r14,%rsi
   1ae7e:	4c 89 e1             	mov    %r12,%rcx
   1ae81:	e8 ca 1a 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1ae86:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ae8a:	0f 85 43 02 00 00    	jne    1b0d3 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1ae90:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1ae95:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1ae9c:	00 00 80 
   1ae9f:	4b 8d 04 2e          	lea    (%r14,%r13,1),%rax
   1aea3:	4d 89 e8             	mov    %r13,%r8
   1aea6:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1aeab:	49 21 f8             	and    %rdi,%r8
   1aeae:	4c 89 f6             	mov    %r14,%rsi
   1aeb1:	4c 29 c6             	sub    %r8,%rsi
   1aeb4:	4d 85 ed             	test   %r13,%r13
   1aeb7:	48 0f 49 f0          	cmovns %rax,%rsi
   1aebb:	4a 8d 04 31          	lea    (%rcx,%r14,1),%rax
   1aebf:	49 89 c8             	mov    %rcx,%r8
   1aec2:	49 21 f8             	and    %rdi,%r8
   1aec5:	4c 89 f7             	mov    %r14,%rdi
   1aec8:	4c 29 c7             	sub    %r8,%rdi
   1aecb:	48 85 c9             	test   %rcx,%rcx
   1aece:	48 0f 49 f8          	cmovns %rax,%rdi
   1aed2:	48 39 fe             	cmp    %rdi,%rsi
   1aed5:	0f 87 fe 01 00 00    	ja     1b0d9 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1aedb:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
   1aee0:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1aee5:	4c 89 ea             	mov    %r13,%rdx
   1aee8:	e8 f3 34 00 00       	call   1e3e0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1aeed:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1aef2:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
   1aef7:	48 89 e7             	mov    %rsp,%rdi
   1aefa:	4c 89 f6             	mov    %r14,%rsi
   1aefd:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1af04:	00 f0 7f 
   1af07:	4c 89 e2             	mov    %r12,%rdx
   1af0a:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1af0f:	49 89 e8             	mov    %rbp,%r8
   1af12:	e8 29 1d 00 00       	call   1cc40 <<hyperinterval::ieee::Format>::div>
   1af17:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1af1b:	0f 85 9b fd ff ff    	jne    1acbc <<hyperinterval::float::F64Enclosure>::corner_image+0x6c>
   1af21:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1af26:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1af2b:	48 89 e7             	mov    %rsp,%rdi
   1af2e:	4c 89 f6             	mov    %r14,%rsi
   1af31:	4c 89 e2             	mov    %r12,%rdx
   1af34:	e8 17 1a 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1af39:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1af3d:	0f 85 90 01 00 00    	jne    1b0d3 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1af43:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1af48:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1af4d:	48 89 e7             	mov    %rsp,%rdi
   1af50:	4c 89 f6             	mov    %r14,%rsi
   1af53:	4c 89 e2             	mov    %r12,%rdx
   1af56:	48 89 e9             	mov    %rbp,%rcx
   1af59:	e8 f2 19 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1af5e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1af62:	0f 85 6b 01 00 00    	jne    1b0d3 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1af68:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1af6d:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1af74:	00 00 80 
   1af77:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
   1af7c:	4a 8d 04 32          	lea    (%rdx,%r14,1),%rax
   1af80:	49 89 d0             	mov    %rdx,%r8
   1af83:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1af88:	49 21 f8             	and    %rdi,%r8
   1af8b:	4c 89 f6             	mov    %r14,%rsi
   1af8e:	4c 29 c6             	sub    %r8,%rsi
   1af91:	48 85 d2             	test   %rdx,%rdx
   1af94:	48 0f 49 f0          	cmovns %rax,%rsi
   1af98:	4a 8d 04 31          	lea    (%rcx,%r14,1),%rax
   1af9c:	49 89 c8             	mov    %rcx,%r8
   1af9f:	49 21 f8             	and    %rdi,%r8
   1afa2:	4c 89 f7             	mov    %r14,%rdi
   1afa5:	4c 29 c7             	sub    %r8,%rdi
   1afa8:	48 85 c9             	test   %rcx,%rcx
   1afab:	48 0f 49 f8          	cmovns %rax,%rdi
   1afaf:	48 39 fe             	cmp    %rdi,%rsi
   1afb2:	0f 87 21 01 00 00    	ja     1b0d9 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1afb8:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
   1afbd:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1afc2:	e8 19 34 00 00       	call   1e3e0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1afc7:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1afcc:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
   1afd1:	48 89 e7             	mov    %rsp,%rdi
   1afd4:	4c 89 f6             	mov    %r14,%rsi
   1afd7:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1afde:	00 f0 7f 
   1afe1:	4c 89 e2             	mov    %r12,%rdx
   1afe4:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1afe9:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1afee:	e8 4d 1c 00 00       	call   1cc40 <<hyperinterval::ieee::Format>::div>
   1aff3:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1aff7:	0f 85 bf fc ff ff    	jne    1acbc <<hyperinterval::float::F64Enclosure>::corner_image+0x6c>
   1affd:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b002:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1b007:	48 89 e7             	mov    %rsp,%rdi
   1b00a:	4c 89 f6             	mov    %r14,%rsi
   1b00d:	4c 89 e2             	mov    %r12,%rdx
   1b010:	e8 3b 19 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1b015:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b019:	0f 85 b4 00 00 00    	jne    1b0d3 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1b01f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b024:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1b029:	48 89 e7             	mov    %rsp,%rdi
   1b02c:	4c 89 f6             	mov    %r14,%rsi
   1b02f:	4c 89 e2             	mov    %r12,%rdx
   1b032:	48 89 e9             	mov    %rbp,%rcx
   1b035:	e8 16 19 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1b03a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b03e:	0f 85 8f 00 00 00    	jne    1b0d3 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1b044:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b04b:	00 00 80 
   1b04e:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
   1b053:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
   1b057:	48 89 f9             	mov    %rdi,%rcx
   1b05a:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
   1b05f:	4c 21 e9             	and    %r13,%rcx
   1b062:	48 89 f2             	mov    %rsi,%rdx
   1b065:	48 29 ca             	sub    %rcx,%rdx
   1b068:	48 85 ff             	test   %rdi,%rdi
   1b06b:	48 0f 49 d0          	cmovns %rax,%rdx
   1b06f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b074:	48 8d 04 31          	lea    (%rcx,%rsi,1),%rax
   1b078:	49 21 cd             	and    %rcx,%r13
   1b07b:	4c 29 ee             	sub    %r13,%rsi
   1b07e:	48 85 c9             	test   %rcx,%rcx
   1b081:	48 0f 49 f0          	cmovns %rax,%rsi
   1b085:	48 39 f2             	cmp    %rsi,%rdx
   1b088:	77 4f                	ja     1b0d9 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1b08a:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
   1b08f:	e9 2f 03 00 00       	jmp    1b3c3 <<hyperinterval::float::F64Enclosure>::corner_image+0x773>
   1b094:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1b099:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
   1b09e:	48 89 e7             	mov    %rsp,%rdi
   1b0a1:	4c 89 f6             	mov    %r14,%rsi
   1b0a4:	4c 89 ea             	mov    %r13,%rdx
   1b0a7:	e8 a4 18 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1b0ac:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b0b0:	74 21                	je     1b0d3 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1b0b2:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b0b7:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1b0bc:	48 89 e7             	mov    %rsp,%rdi
   1b0bf:	4c 89 f6             	mov    %r14,%rsi
   1b0c2:	4c 89 ea             	mov    %r13,%rdx
   1b0c5:	4c 89 f9             	mov    %r15,%rcx
   1b0c8:	e8 83 18 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1b0cd:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b0d1:	75 20                	jne    1b0f3 <<hyperinterval::float::F64Enclosure>::corner_image+0x4a3>
   1b0d3:	44 0f b6 7c 24 01    	movzbl 0x1(%rsp),%r15d
   1b0d9:	44 88 7b 08          	mov    %r15b,0x8(%rbx)
   1b0dd:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b0e4:	48 83 c4 68          	add    $0x68,%rsp
   1b0e8:	5b                   	pop    %rbx
   1b0e9:	41 5c                	pop    %r12
   1b0eb:	41 5d                	pop    %r13
   1b0ed:	41 5e                	pop    %r14
   1b0ef:	41 5f                	pop    %r15
   1b0f1:	5d                   	pop    %rbp
   1b0f2:	c3                   	ret
   1b0f3:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   1b0f8:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b0ff:	00 00 80 
   1b102:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   1b107:	4a 8d 04 36          	lea    (%rsi,%r14,1),%rax
   1b10b:	4d 8d 6e ff          	lea    -0x1(%r14),%r13
   1b10f:	48 89 f1             	mov    %rsi,%rcx
   1b112:	4c 21 e9             	and    %r13,%rcx
   1b115:	4c 89 f2             	mov    %r14,%rdx
   1b118:	48 29 ca             	sub    %rcx,%rdx
   1b11b:	48 85 f6             	test   %rsi,%rsi
   1b11e:	48 0f 49 d0          	cmovns %rax,%rdx
   1b122:	4a 8d 04 37          	lea    (%rdi,%r14,1),%rax
   1b126:	48 89 f9             	mov    %rdi,%rcx
   1b129:	4c 21 e9             	and    %r13,%rcx
   1b12c:	4c 89 f6             	mov    %r14,%rsi
   1b12f:	48 29 ce             	sub    %rcx,%rsi
   1b132:	48 85 ff             	test   %rdi,%rdi
   1b135:	48 0f 49 f0          	cmovns %rax,%rsi
   1b139:	41 b7 01             	mov    $0x1,%r15b
   1b13c:	48 39 f2             	cmp    %rsi,%rdx
   1b13f:	77 98                	ja     1b0d9 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1b141:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1b146:	4c 89 6c 24 38       	mov    %r13,0x38(%rsp)
   1b14b:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1b150:	4c 89 f6             	mov    %r14,%rsi
   1b153:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   1b15a:	00 f0 7f 
   1b15d:	4c 89 ea             	mov    %r13,%rdx
   1b160:	4c 89 e1             	mov    %r12,%rcx
   1b163:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1b168:	e8 13 1f 00 00       	call   1d080 <<hyperinterval::ieee::Format>::mul>
   1b16d:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1b172:	0f 85 fa fb ff ff    	jne    1ad72 <<hyperinterval::float::F64Enclosure>::corner_image+0x122>
   1b178:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1b17d:	4c 8b 64 24 50       	mov    0x50(%rsp),%r12
   1b182:	48 89 e7             	mov    %rsp,%rdi
   1b185:	4c 89 f6             	mov    %r14,%rsi
   1b188:	4c 89 ea             	mov    %r13,%rdx
   1b18b:	e8 c0 17 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1b190:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b194:	0f 85 39 ff ff ff    	jne    1b0d3 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1b19a:	4c 89 ea             	mov    %r13,%rdx
   1b19d:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1b1a2:	48 89 e7             	mov    %rsp,%rdi
   1b1a5:	4c 89 f6             	mov    %r14,%rsi
   1b1a8:	4c 89 e1             	mov    %r12,%rcx
   1b1ab:	e8 a0 17 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1b1b0:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b1b4:	0f 85 19 ff ff ff    	jne    1b0d3 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1b1ba:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b1bf:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b1c6:	00 00 80 
   1b1c9:	4b 8d 04 2e          	lea    (%r14,%r13,1),%rax
   1b1cd:	4d 89 e8             	mov    %r13,%r8
   1b1d0:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
   1b1d5:	49 21 f8             	and    %rdi,%r8
   1b1d8:	4c 89 f6             	mov    %r14,%rsi
   1b1db:	4c 29 c6             	sub    %r8,%rsi
   1b1de:	4d 85 ed             	test   %r13,%r13
   1b1e1:	48 0f 49 f0          	cmovns %rax,%rsi
   1b1e5:	4a 8d 04 31          	lea    (%rcx,%r14,1),%rax
   1b1e9:	49 89 c8             	mov    %rcx,%r8
   1b1ec:	49 21 f8             	and    %rdi,%r8
   1b1ef:	4c 89 f7             	mov    %r14,%rdi
   1b1f2:	4c 29 c7             	sub    %r8,%rdi
   1b1f5:	48 85 c9             	test   %rcx,%rcx
   1b1f8:	48 0f 49 f8          	cmovns %rax,%rdi
   1b1fc:	48 39 fe             	cmp    %rdi,%rsi
   1b1ff:	0f 87 d4 fe ff ff    	ja     1b0d9 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1b205:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1b20a:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1b20f:	4c 89 ea             	mov    %r13,%rdx
   1b212:	e8 c9 31 00 00       	call   1e3e0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1b217:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1b21c:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
   1b221:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1b226:	4c 89 f6             	mov    %r14,%rsi
   1b229:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1b230:	00 f0 7f 
   1b233:	4c 89 e2             	mov    %r12,%rdx
   1b236:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1b23b:	49 89 e8             	mov    %rbp,%r8
   1b23e:	e8 3d 1e 00 00       	call   1d080 <<hyperinterval::ieee::Format>::mul>
   1b243:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1b248:	0f 85 24 fb ff ff    	jne    1ad72 <<hyperinterval::float::F64Enclosure>::corner_image+0x122>
   1b24e:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1b253:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
   1b258:	48 89 e7             	mov    %rsp,%rdi
   1b25b:	4c 89 f6             	mov    %r14,%rsi
   1b25e:	4c 89 e2             	mov    %r12,%rdx
   1b261:	e8 ea 16 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1b266:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b26a:	0f 85 63 fe ff ff    	jne    1b0d3 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1b270:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b275:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1b27a:	48 89 e7             	mov    %rsp,%rdi
   1b27d:	4c 89 f6             	mov    %r14,%rsi
   1b280:	4c 89 e2             	mov    %r12,%rdx
   1b283:	48 89 e9             	mov    %rbp,%rcx
   1b286:	e8 c5 16 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1b28b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b28f:	0f 85 3e fe ff ff    	jne    1b0d3 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1b295:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b29a:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b2a1:	00 00 80 
   1b2a4:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
   1b2a9:	4a 8d 04 32          	lea    (%rdx,%r14,1),%rax
   1b2ad:	49 89 d0             	mov    %rdx,%r8
   1b2b0:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
   1b2b5:	49 21 f8             	and    %rdi,%r8
   1b2b8:	4c 89 f6             	mov    %r14,%rsi
   1b2bb:	4c 29 c6             	sub    %r8,%rsi
   1b2be:	48 85 d2             	test   %rdx,%rdx
   1b2c1:	48 0f 49 f0          	cmovns %rax,%rsi
   1b2c5:	4a 8d 04 31          	lea    (%rcx,%r14,1),%rax
   1b2c9:	49 89 c8             	mov    %rcx,%r8
   1b2cc:	49 21 f8             	and    %rdi,%r8
   1b2cf:	4c 89 f7             	mov    %r14,%rdi
   1b2d2:	4c 29 c7             	sub    %r8,%rdi
   1b2d5:	48 85 c9             	test   %rcx,%rcx
   1b2d8:	48 0f 49 f8          	cmovns %rax,%rdi
   1b2dc:	48 39 fe             	cmp    %rdi,%rsi
   1b2df:	0f 87 f4 fd ff ff    	ja     1b0d9 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1b2e5:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1b2ea:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1b2ef:	e8 ec 30 00 00       	call   1e3e0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1b2f4:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1b2f9:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
   1b2fe:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1b303:	4c 89 f6             	mov    %r14,%rsi
   1b306:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1b30d:	00 f0 7f 
   1b310:	4c 89 e2             	mov    %r12,%rdx
   1b313:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1b318:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1b31d:	e8 5e 1d 00 00       	call   1d080 <<hyperinterval::ieee::Format>::mul>
   1b322:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1b327:	0f 85 45 fa ff ff    	jne    1ad72 <<hyperinterval::float::F64Enclosure>::corner_image+0x122>
   1b32d:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1b332:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
   1b337:	48 89 e7             	mov    %rsp,%rdi
   1b33a:	4c 89 f6             	mov    %r14,%rsi
   1b33d:	4c 89 e2             	mov    %r12,%rdx
   1b340:	e8 0b 16 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1b345:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b349:	0f 85 84 fd ff ff    	jne    1b0d3 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1b34f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b354:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1b359:	48 89 e7             	mov    %rsp,%rdi
   1b35c:	4c 89 f6             	mov    %r14,%rsi
   1b35f:	4c 89 e2             	mov    %r12,%rdx
   1b362:	48 89 e9             	mov    %rbp,%rcx
   1b365:	e8 e6 15 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1b36a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b36e:	0f 85 5f fd ff ff    	jne    1b0d3 <<hyperinterval::float::F64Enclosure>::corner_image+0x483>
   1b374:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b37b:	00 00 80 
   1b37e:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
   1b383:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
   1b387:	48 89 f9             	mov    %rdi,%rcx
   1b38a:	4c 8b 6c 24 38       	mov    0x38(%rsp),%r13
   1b38f:	4c 21 e9             	and    %r13,%rcx
   1b392:	48 89 f2             	mov    %rsi,%rdx
   1b395:	48 29 ca             	sub    %rcx,%rdx
   1b398:	48 85 ff             	test   %rdi,%rdi
   1b39b:	48 0f 49 d0          	cmovns %rax,%rdx
   1b39f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b3a4:	48 8d 04 31          	lea    (%rcx,%rsi,1),%rax
   1b3a8:	49 21 cd             	and    %rcx,%r13
   1b3ab:	4c 29 ee             	sub    %r13,%rsi
   1b3ae:	48 85 c9             	test   %rcx,%rcx
   1b3b1:	48 0f 49 f0          	cmovns %rax,%rsi
   1b3b5:	48 39 f2             	cmp    %rsi,%rdx
   1b3b8:	0f 87 1b fd ff ff    	ja     1b0d9 <<hyperinterval::float::F64Enclosure>::corner_image+0x489>
   1b3be:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1b3c3:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1b3c8:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
   1b3cd:	e8 0e 30 00 00       	call   1e3e0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1b3d2:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1b3d9:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1b3dd:	48 89 53 10          	mov    %rdx,0x10(%rbx)
   1b3e1:	e9 fe fc ff ff       	jmp    1b0e4 <<hyperinterval::float::F64Enclosure>::corner_image+0x494>
   1b3e6:	cc                   	int3
   1b3e7:	cc                   	int3
   1b3e8:	cc                   	int3
   1b3e9:	cc                   	int3
   1b3ea:	cc                   	int3
   1b3eb:	cc                   	int3
   1b3ec:	cc                   	int3
   1b3ed:	cc                   	int3
   1b3ee:	cc                   	int3
   1b3ef:	cc                   	int3

<hyperinterval::float::F64Enclosure>::intersection:
   1b3f0:	48 89 f8             	mov    %rdi,%rax
   1b3f3:	45 31 c0             	xor    %r8d,%r8d
   1b3f6:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b3fa:	0f 85 d5 00 00 00    	jne    1b4d5 <<hyperinterval::float::F64Enclosure>::intersection+0xe5>
   1b400:	f6 02 01             	testb  $0x1,(%rdx)
   1b403:	0f 84 c0 00 00 00    	je     1b4c9 <<hyperinterval::float::F64Enclosure>::intersection+0xd9>
   1b409:	41 56                	push   %r14
   1b40b:	53                   	push   %rbx
   1b40c:	4c 8b 52 08          	mov    0x8(%rdx),%r10
   1b410:	4c 8b 4a 10          	mov    0x10(%rdx),%r9
   1b414:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1b418:	48 ba 00 00 00 00 00 	movabs $0x8000000000000000,%rdx
   1b41f:	00 00 80 
   1b422:	48 8d 3c 11          	lea    (%rcx,%rdx,1),%rdi
   1b426:	4c 8d 42 ff          	lea    -0x1(%rdx),%r8
   1b42a:	49 89 cb             	mov    %rcx,%r11
   1b42d:	4d 21 c3             	and    %r8,%r11
   1b430:	48 89 d3             	mov    %rdx,%rbx
   1b433:	4c 29 db             	sub    %r11,%rbx
   1b436:	48 85 c9             	test   %rcx,%rcx
   1b439:	48 0f 49 df          	cmovns %rdi,%rbx
   1b43d:	49 8d 3c 12          	lea    (%r10,%rdx,1),%rdi
   1b441:	4d 89 d3             	mov    %r10,%r11
   1b444:	4d 21 c3             	and    %r8,%r11
   1b447:	49 89 d6             	mov    %rdx,%r14
   1b44a:	4d 29 de             	sub    %r11,%r14
   1b44d:	4d 85 d2             	test   %r10,%r10
   1b450:	4c 0f 49 f7          	cmovns %rdi,%r14
   1b454:	48 8b 7e 10          	mov    0x10(%rsi),%rdi
   1b458:	4c 39 f3             	cmp    %r14,%rbx
   1b45b:	49 0f 42 ca          	cmovb  %r10,%rcx
   1b45f:	48 8d 34 17          	lea    (%rdi,%rdx,1),%rsi
   1b463:	49 89 fa             	mov    %rdi,%r10
   1b466:	4d 21 c2             	and    %r8,%r10
   1b469:	49 89 d3             	mov    %rdx,%r11
   1b46c:	4d 29 d3             	sub    %r10,%r11
   1b46f:	48 85 ff             	test   %rdi,%rdi
   1b472:	4c 0f 49 de          	cmovns %rsi,%r11
   1b476:	49 8d 34 11          	lea    (%r9,%rdx,1),%rsi
   1b47a:	4d 89 ca             	mov    %r9,%r10
   1b47d:	4d 21 c2             	and    %r8,%r10
   1b480:	48 89 d3             	mov    %rdx,%rbx
   1b483:	4c 29 d3             	sub    %r10,%rbx
   1b486:	4d 85 c9             	test   %r9,%r9
   1b489:	48 0f 49 de          	cmovns %rsi,%rbx
   1b48d:	49 39 db             	cmp    %rbx,%r11
   1b490:	49 0f 47 f9          	cmova  %r9,%rdi
   1b494:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
   1b498:	49 89 c9             	mov    %rcx,%r9
   1b49b:	4d 21 c1             	and    %r8,%r9
   1b49e:	49 89 d2             	mov    %rdx,%r10
   1b4a1:	4d 29 ca             	sub    %r9,%r10
   1b4a4:	48 85 c9             	test   %rcx,%rcx
   1b4a7:	4c 0f 49 d6          	cmovns %rsi,%r10
   1b4ab:	48 8d 34 17          	lea    (%rdi,%rdx,1),%rsi
   1b4af:	49 21 f8             	and    %rdi,%r8
   1b4b2:	4c 29 c2             	sub    %r8,%rdx
   1b4b5:	48 85 ff             	test   %rdi,%rdi
   1b4b8:	48 0f 49 d6          	cmovns %rsi,%rdx
   1b4bc:	45 31 c0             	xor    %r8d,%r8d
   1b4bf:	49 39 d2             	cmp    %rdx,%r10
   1b4c2:	41 0f 96 c0          	setbe  %r8b
   1b4c6:	5b                   	pop    %rbx
   1b4c7:	41 5e                	pop    %r14
   1b4c9:	4c 89 00             	mov    %r8,(%rax)
   1b4cc:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1b4d0:	48 89 78 10          	mov    %rdi,0x10(%rax)
   1b4d4:	c3                   	ret
   1b4d5:	4c 89 00             	mov    %r8,(%rax)
   1b4d8:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1b4dc:	48 89 78 10          	mov    %rdi,0x10(%rax)
   1b4e0:	c3                   	ret
   1b4e1:	cc                   	int3
   1b4e2:	cc                   	int3
   1b4e3:	cc                   	int3
   1b4e4:	cc                   	int3
   1b4e5:	cc                   	int3
   1b4e6:	cc                   	int3
   1b4e7:	cc                   	int3
   1b4e8:	cc                   	int3
   1b4e9:	cc                   	int3
   1b4ea:	cc                   	int3
   1b4eb:	cc                   	int3
   1b4ec:	cc                   	int3
   1b4ed:	cc                   	int3
   1b4ee:	cc                   	int3
   1b4ef:	cc                   	int3

<hyperinterval::float::F64Enclosure>::contains_point:
   1b4f0:	41 56                	push   %r14
   1b4f2:	53                   	push   %rbx
   1b4f3:	48 83 ec 18          	sub    $0x18,%rsp
   1b4f7:	49 89 fe             	mov    %rdi,%r14
   1b4fa:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1b501:	00 00 80 
   1b504:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1b509:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1b50e:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1b515:	00 f0 7f 
   1b518:	48 89 de             	mov    %rbx,%rsi
   1b51b:	e8 30 14 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1b520:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1b525:	3c 01                	cmp    $0x1,%al
   1b527:	75 0d                	jne    1b536 <<hyperinterval::float::F64Enclosure>::contains_point+0x46>
   1b529:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   1b52e:	48 83 c4 18          	add    $0x18,%rsp
   1b532:	5b                   	pop    %rbx
   1b533:	41 5e                	pop    %r14
   1b535:	c3                   	ret
   1b536:	49 83 3e 01          	cmpq   $0x1,(%r14)
   1b53a:	75 40                	jne    1b57c <<hyperinterval::float::F64Enclosure>::contains_point+0x8c>
   1b53c:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1b541:	49 8b 56 08          	mov    0x8(%r14),%rdx
   1b545:	48 8d 3c 1a          	lea    (%rdx,%rbx,1),%rdi
   1b549:	48 8d 4b ff          	lea    -0x1(%rbx),%rcx
   1b54d:	49 89 d0             	mov    %rdx,%r8
   1b550:	49 21 c8             	and    %rcx,%r8
   1b553:	49 89 d9             	mov    %rbx,%r9
   1b556:	4d 29 c1             	sub    %r8,%r9
   1b559:	48 85 d2             	test   %rdx,%rdx
   1b55c:	4c 0f 49 cf          	cmovns %rdi,%r9
   1b560:	48 8d 3c 1e          	lea    (%rsi,%rbx,1),%rdi
   1b564:	49 89 f0             	mov    %rsi,%r8
   1b567:	49 21 c8             	and    %rcx,%r8
   1b56a:	48 89 da             	mov    %rbx,%rdx
   1b56d:	4c 29 c2             	sub    %r8,%rdx
   1b570:	48 85 f6             	test   %rsi,%rsi
   1b573:	48 0f 49 d7          	cmovns %rdi,%rdx
   1b577:	49 39 d1             	cmp    %rdx,%r9
   1b57a:	76 0a                	jbe    1b586 <<hyperinterval::float::F64Enclosure>::contains_point+0x96>
   1b57c:	31 d2                	xor    %edx,%edx
   1b57e:	48 83 c4 18          	add    $0x18,%rsp
   1b582:	5b                   	pop    %rbx
   1b583:	41 5e                	pop    %r14
   1b585:	c3                   	ret
   1b586:	49 8b 76 10          	mov    0x10(%r14),%rsi
   1b58a:	48 8d 3c 1e          	lea    (%rsi,%rbx,1),%rdi
   1b58e:	48 21 f1             	and    %rsi,%rcx
   1b591:	48 29 cb             	sub    %rcx,%rbx
   1b594:	48 85 f6             	test   %rsi,%rsi
   1b597:	48 0f 49 df          	cmovns %rdi,%rbx
   1b59b:	48 39 da             	cmp    %rbx,%rdx
   1b59e:	0f 96 c2             	setbe  %dl
   1b5a1:	48 83 c4 18          	add    $0x18,%rsp
   1b5a5:	5b                   	pop    %rbx
   1b5a6:	41 5e                	pop    %r14
   1b5a8:	c3                   	ret
   1b5a9:	cc                   	int3
   1b5aa:	cc                   	int3
   1b5ab:	cc                   	int3
   1b5ac:	cc                   	int3
   1b5ad:	cc                   	int3
   1b5ae:	cc                   	int3
   1b5af:	cc                   	int3

<hyperinterval::float::F64Enclosure>::interior_subset_of:
   1b5b0:	b0 01                	mov    $0x1,%al
   1b5b2:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1b5b6:	0f 85 8b 00 00 00    	jne    1b647 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x97>
   1b5bc:	f6 06 01             	testb  $0x1,(%rsi)
   1b5bf:	0f 84 80 00 00 00    	je     1b645 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x95>
   1b5c5:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1b5c9:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1b5cd:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1b5d4:	00 00 80 
   1b5d7:	4d 8d 0c 00          	lea    (%r8,%rax,1),%r9
   1b5db:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1b5df:	4d 89 c2             	mov    %r8,%r10
   1b5e2:	49 21 ca             	and    %rcx,%r10
   1b5e5:	49 89 c3             	mov    %rax,%r11
   1b5e8:	4d 29 d3             	sub    %r10,%r11
   1b5eb:	4d 85 c0             	test   %r8,%r8
   1b5ee:	4d 0f 49 d9          	cmovns %r9,%r11
   1b5f2:	4c 8d 04 02          	lea    (%rdx,%rax,1),%r8
   1b5f6:	49 89 d1             	mov    %rdx,%r9
   1b5f9:	49 21 c9             	and    %rcx,%r9
   1b5fc:	49 89 c2             	mov    %rax,%r10
   1b5ff:	4d 29 ca             	sub    %r9,%r10
   1b602:	48 85 d2             	test   %rdx,%rdx
   1b605:	4d 0f 49 d0          	cmovns %r8,%r10
   1b609:	4d 39 d3             	cmp    %r10,%r11
   1b60c:	73 37                	jae    1b645 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x95>
   1b60e:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1b612:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1b616:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1b61a:	49 89 d0             	mov    %rdx,%r8
   1b61d:	49 21 c8             	and    %rcx,%r8
   1b620:	49 89 c1             	mov    %rax,%r9
   1b623:	4d 29 c1             	sub    %r8,%r9
   1b626:	48 85 d2             	test   %rdx,%rdx
   1b629:	4c 0f 49 cf          	cmovns %rdi,%r9
   1b62d:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1b631:	48 21 f1             	and    %rsi,%rcx
   1b634:	48 29 c8             	sub    %rcx,%rax
   1b637:	48 85 f6             	test   %rsi,%rsi
   1b63a:	48 0f 49 c2          	cmovns %rdx,%rax
   1b63e:	49 39 c1             	cmp    %rax,%r9
   1b641:	0f 92 c0             	setb   %al
   1b644:	c3                   	ret
   1b645:	31 c0                	xor    %eax,%eax
   1b647:	c3                   	ret
   1b648:	cc                   	int3
   1b649:	cc                   	int3
   1b64a:	cc                   	int3
   1b64b:	cc                   	int3
   1b64c:	cc                   	int3
   1b64d:	cc                   	int3
   1b64e:	cc                   	int3
   1b64f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::add:
   1b650:	48 89 f8             	mov    %rdi,%rax
   1b653:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b657:	0f 85 cb 00 00 00    	jne    1b728 <<hyperinterval::float::F64Enclosure>::add+0xd8>
   1b65d:	f6 02 01             	testb  $0x1,(%rdx)
   1b660:	0f 84 c2 00 00 00    	je     1b728 <<hyperinterval::float::F64Enclosure>::add+0xd8>
   1b666:	55                   	push   %rbp
   1b667:	41 57                	push   %r15
   1b669:	41 56                	push   %r14
   1b66b:	41 55                	push   %r13
   1b66d:	41 54                	push   %r12
   1b66f:	53                   	push   %rbx
   1b670:	48 83 ec 18          	sub    $0x18,%rsp
   1b674:	48 89 c5             	mov    %rax,%rbp
   1b677:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1b67b:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1b67f:	4c 8b 62 10          	mov    0x10(%rdx),%r12
   1b683:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1b68a:	00 00 80 
   1b68d:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1b694:	00 f0 7f 
   1b697:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   1b69b:	48 89 e7             	mov    %rsp,%rdi
   1b69e:	48 89 de             	mov    %rbx,%rsi
   1b6a1:	4c 89 f2             	mov    %r14,%rdx
   1b6a4:	e8 e7 12 00 00       	call   1c990 <<hyperinterval::ieee::Format>::add>
   1b6a9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b6ad:	74 57                	je     1b706 <<hyperinterval::float::F64Enclosure>::add+0xb6>
   1b6af:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1b6b4:	48 89 e7             	mov    %rsp,%rdi
   1b6b7:	48 89 de             	mov    %rbx,%rsi
   1b6ba:	4c 89 f2             	mov    %r14,%rdx
   1b6bd:	4c 89 f9             	mov    %r15,%rcx
   1b6c0:	4d 89 e0             	mov    %r12,%r8
   1b6c3:	e8 c8 12 00 00       	call   1c990 <<hyperinterval::ieee::Format>::add>
   1b6c8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b6cc:	74 38                	je     1b706 <<hyperinterval::float::F64Enclosure>::add+0xb6>
   1b6ce:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1b6d3:	48 89 e7             	mov    %rsp,%rdi
   1b6d6:	48 89 de             	mov    %rbx,%rsi
   1b6d9:	4c 89 f2             	mov    %r14,%rdx
   1b6dc:	4c 89 e9             	mov    %r13,%rcx
   1b6df:	e8 6c 12 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1b6e4:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b6e8:	74 1c                	je     1b706 <<hyperinterval::float::F64Enclosure>::add+0xb6>
   1b6ea:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1b6ef:	48 89 e7             	mov    %rsp,%rdi
   1b6f2:	48 89 de             	mov    %rbx,%rsi
   1b6f5:	4c 89 f2             	mov    %r14,%rdx
   1b6f8:	4c 89 f9             	mov    %r15,%rcx
   1b6fb:	e8 50 12 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1b700:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b704:	75 2a                	jne    1b730 <<hyperinterval::float::F64Enclosure>::add+0xe0>
   1b706:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   1b70b:	48 89 e8             	mov    %rbp,%rax
   1b70e:	88 4d 08             	mov    %cl,0x8(%rbp)
   1b711:	48 c7 45 00 02 00 00 	movq   $0x2,0x0(%rbp)
   1b718:	00 
   1b719:	48 83 c4 18          	add    $0x18,%rsp
   1b71d:	5b                   	pop    %rbx
   1b71e:	41 5c                	pop    %r12
   1b720:	41 5d                	pop    %r13
   1b722:	41 5e                	pop    %r14
   1b724:	41 5f                	pop    %r15
   1b726:	5d                   	pop    %rbp
   1b727:	c3                   	ret
   1b728:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   1b72f:	c3                   	ret
   1b730:	49 8d 04 1c          	lea    (%r12,%rbx,1),%rax
   1b734:	48 8d 53 ff          	lea    -0x1(%rbx),%rdx
   1b738:	4c 89 e1             	mov    %r12,%rcx
   1b73b:	48 21 d1             	and    %rdx,%rcx
   1b73e:	48 89 de             	mov    %rbx,%rsi
   1b741:	48 29 ce             	sub    %rcx,%rsi
   1b744:	4d 85 e4             	test   %r12,%r12
   1b747:	48 0f 49 f0          	cmovns %rax,%rsi
   1b74b:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b750:	48 8d 04 19          	lea    (%rcx,%rbx,1),%rax
   1b754:	48 21 ca             	and    %rcx,%rdx
   1b757:	48 29 d3             	sub    %rdx,%rbx
   1b75a:	48 85 c9             	test   %rcx,%rcx
   1b75d:	48 0f 49 d8          	cmovns %rax,%rbx
   1b761:	48 39 de             	cmp    %rbx,%rsi
   1b764:	48 89 e8             	mov    %rbp,%rax
   1b767:	76 0d                	jbe    1b776 <<hyperinterval::float::F64Enclosure>::add+0x126>
   1b769:	c6 40 08 01          	movb   $0x1,0x8(%rax)
   1b76d:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1b774:	eb a3                	jmp    1b719 <<hyperinterval::float::F64Enclosure>::add+0xc9>
   1b776:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   1b77d:	4c 89 60 08          	mov    %r12,0x8(%rax)
   1b781:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1b785:	eb 92                	jmp    1b719 <<hyperinterval::float::F64Enclosure>::add+0xc9>
   1b787:	cc                   	int3
   1b788:	cc                   	int3
   1b789:	cc                   	int3
   1b78a:	cc                   	int3
   1b78b:	cc                   	int3
   1b78c:	cc                   	int3
   1b78d:	cc                   	int3
   1b78e:	cc                   	int3
   1b78f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::div:
   1b790:	53                   	push   %rbx
   1b791:	48 89 fb             	mov    %rdi,%rbx
   1b794:	83 3a 01             	cmpl   $0x1,(%rdx)
   1b797:	75 1e                	jne    1b7b7 <<hyperinterval::float::F64Enclosure>::div+0x27>
   1b799:	48 83 7a 08 00       	cmpq   $0x0,0x8(%rdx)
   1b79e:	7f 17                	jg     1b7b7 <<hyperinterval::float::F64Enclosure>::div+0x27>
   1b7a0:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1b7a4:	48 85 c0             	test   %rax,%rax
   1b7a7:	0f 99 c1             	setns  %cl
   1b7aa:	48 d1 e0             	shl    $1,%rax
   1b7ad:	48 85 c0             	test   %rax,%rax
   1b7b0:	0f 94 c0             	sete   %al
   1b7b3:	08 c8                	or     %cl,%al
   1b7b5:	75 12                	jne    1b7c9 <<hyperinterval::float::F64Enclosure>::div+0x39>
   1b7b7:	48 89 df             	mov    %rbx,%rdi
   1b7ba:	b9 01 00 00 00       	mov    $0x1,%ecx
   1b7bf:	e8 8c f4 ff ff       	call   1ac50 <<hyperinterval::float::F64Enclosure>::corner_image>
   1b7c4:	48 89 d8             	mov    %rbx,%rax
   1b7c7:	5b                   	pop    %rbx
   1b7c8:	c3                   	ret
   1b7c9:	c6 43 08 06          	movb   $0x6,0x8(%rbx)
   1b7cd:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b7d4:	48 89 d8             	mov    %rbx,%rax
   1b7d7:	5b                   	pop    %rbx
   1b7d8:	c3                   	ret
   1b7d9:	cc                   	int3
   1b7da:	cc                   	int3
   1b7db:	cc                   	int3
   1b7dc:	cc                   	int3
   1b7dd:	cc                   	int3
   1b7de:	cc                   	int3
   1b7df:	cc                   	int3

<hyperinterval::float::F64Enclosure>::new:
   1b7e0:	41 57                	push   %r15
   1b7e2:	41 56                	push   %r14
   1b7e4:	41 54                	push   %r12
   1b7e6:	53                   	push   %rbx
   1b7e7:	48 83 ec 18          	sub    $0x18,%rsp
   1b7eb:	f2 0f 11 4c 24 10    	movsd  %xmm1,0x10(%rsp)
   1b7f1:	48 89 fb             	mov    %rdi,%rbx
   1b7f4:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b7fb:	00 00 80 
   1b7fe:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1b805:	00 f0 7f 
   1b808:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1b80d:	48 89 e7             	mov    %rsp,%rdi
   1b810:	4c 89 f6             	mov    %r14,%rsi
   1b813:	4c 89 fa             	mov    %r15,%rdx
   1b816:	e8 35 11 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1b81b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b81f:	74 24                	je     1b845 <<hyperinterval::float::F64Enclosure>::new+0x65>
   1b821:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1b826:	f3 0f 7e 44 24 10    	movq   0x10(%rsp),%xmm0
   1b82c:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1b831:	48 89 e7             	mov    %rsp,%rdi
   1b834:	4c 89 f6             	mov    %r14,%rsi
   1b837:	4c 89 fa             	mov    %r15,%rdx
   1b83a:	e8 11 11 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1b83f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b843:	75 1e                	jne    1b863 <<hyperinterval::float::F64Enclosure>::new+0x83>
   1b845:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1b84a:	88 43 08             	mov    %al,0x8(%rbx)
   1b84d:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b854:	48 89 d8             	mov    %rbx,%rax
   1b857:	48 83 c4 18          	add    $0x18,%rsp
   1b85b:	5b                   	pop    %rbx
   1b85c:	41 5c                	pop    %r12
   1b85e:	41 5e                	pop    %r14
   1b860:	41 5f                	pop    %r15
   1b862:	c3                   	ret
   1b863:	4b 8d 04 34          	lea    (%r12,%r14,1),%rax
   1b867:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1b86b:	4c 89 e2             	mov    %r12,%rdx
   1b86e:	48 21 ca             	and    %rcx,%rdx
   1b871:	4c 89 f6             	mov    %r14,%rsi
   1b874:	48 29 d6             	sub    %rdx,%rsi
   1b877:	4d 85 e4             	test   %r12,%r12
   1b87a:	48 0f 49 f0          	cmovns %rax,%rsi
   1b87e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b883:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1b887:	48 21 c1             	and    %rax,%rcx
   1b88a:	49 29 ce             	sub    %rcx,%r14
   1b88d:	48 85 c0             	test   %rax,%rax
   1b890:	4c 0f 49 f2          	cmovns %rdx,%r14
   1b894:	4c 39 f6             	cmp    %r14,%rsi
   1b897:	76 06                	jbe    1b89f <<hyperinterval::float::F64Enclosure>::new+0xbf>
   1b899:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1b89d:	eb ae                	jmp    1b84d <<hyperinterval::float::F64Enclosure>::new+0x6d>
   1b89f:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1b8a6:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   1b8aa:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1b8ae:	eb a4                	jmp    1b854 <<hyperinterval::float::F64Enclosure>::new+0x74>

<hyperinterval::float::F64Enclosure>::sub:
   1b8b0:	53                   	push   %rbx
   1b8b1:	48 83 ec 20          	sub    $0x20,%rsp
   1b8b5:	48 89 fb             	mov    %rdi,%rbx
   1b8b8:	48 83 3a 01          	cmpq   $0x1,(%rdx)
   1b8bc:	75 30                	jne    1b8ee <<hyperinterval::float::F64Enclosure>::sub+0x3e>
   1b8be:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   1b8c2:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1b8c6:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1b8cd:	00 00 80 
   1b8d0:	48 89 d1             	mov    %rdx,%rcx
   1b8d3:	48 31 c1             	xor    %rax,%rcx
   1b8d6:	48 85 d2             	test   %rdx,%rdx
   1b8d9:	48 0f 44 ca          	cmove  %rdx,%rcx
   1b8dd:	48 31 f8             	xor    %rdi,%rax
   1b8e0:	48 85 ff             	test   %rdi,%rdi
   1b8e3:	48 0f 44 c7          	cmove  %rdi,%rax
   1b8e7:	ba 01 00 00 00       	mov    $0x1,%edx
   1b8ec:	eb 02                	jmp    1b8f0 <<hyperinterval::float::F64Enclosure>::sub+0x40>
   1b8ee:	31 d2                	xor    %edx,%edx
   1b8f0:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b8f5:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
   1b8fa:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1b8ff:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
   1b904:	48 89 df             	mov    %rbx,%rdi
   1b907:	ff 15 bb 1f 04 00    	call   *0x41fbb(%rip)        # 5d8c8 <_DYNAMIC+0x300>
   1b90d:	48 89 d8             	mov    %rbx,%rax
   1b910:	48 83 c4 20          	add    $0x20,%rsp
   1b914:	5b                   	pop    %rbx
   1b915:	c3                   	ret
   1b916:	cc                   	int3
   1b917:	cc                   	int3
   1b918:	cc                   	int3
   1b919:	cc                   	int3
   1b91a:	cc                   	int3
   1b91b:	cc                   	int3
   1b91c:	cc                   	int3
   1b91d:	cc                   	int3
   1b91e:	cc                   	int3
   1b91f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::hull:
   1b920:	48 89 f8             	mov    %rdi,%rax
   1b923:	4c 8b 02             	mov    (%rdx),%r8
   1b926:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   1b92a:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
   1b92e:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b932:	0f 85 9f 00 00 00    	jne    1b9d7 <<hyperinterval::float::F64Enclosure>::hull+0xb7>
   1b938:	4c 8b 56 08          	mov    0x8(%rsi),%r10
   1b93c:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1b940:	ba 01 00 00 00       	mov    $0x1,%edx
   1b945:	49 83 f8 01          	cmp    $0x1,%r8
   1b949:	0f 85 97 00 00 00    	jne    1b9e6 <<hyperinterval::float::F64Enclosure>::hull+0xc6>
   1b94f:	41 57                	push   %r15
   1b951:	41 56                	push   %r14
   1b953:	53                   	push   %rbx
   1b954:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1b95b:	00 00 80 
   1b95e:	4f 8d 1c 02          	lea    (%r10,%r8,1),%r11
   1b962:	4d 8d 48 ff          	lea    -0x1(%r8),%r9
   1b966:	4c 89 d3             	mov    %r10,%rbx
   1b969:	4c 21 cb             	and    %r9,%rbx
   1b96c:	4d 89 c6             	mov    %r8,%r14
   1b96f:	49 29 de             	sub    %rbx,%r14
   1b972:	4d 85 d2             	test   %r10,%r10
   1b975:	4d 0f 49 f3          	cmovns %r11,%r14
   1b979:	4e 8d 1c 07          	lea    (%rdi,%r8,1),%r11
   1b97d:	48 89 fb             	mov    %rdi,%rbx
   1b980:	4c 21 cb             	and    %r9,%rbx
   1b983:	4d 89 c7             	mov    %r8,%r15
   1b986:	49 29 df             	sub    %rbx,%r15
   1b989:	48 85 ff             	test   %rdi,%rdi
   1b98c:	4d 0f 49 fb          	cmovns %r11,%r15
   1b990:	4d 39 fe             	cmp    %r15,%r14
   1b993:	49 0f 46 fa          	cmovbe %r10,%rdi
   1b997:	4e 8d 14 06          	lea    (%rsi,%r8,1),%r10
   1b99b:	49 89 f3             	mov    %rsi,%r11
   1b99e:	4d 21 cb             	and    %r9,%r11
   1b9a1:	4c 89 c3             	mov    %r8,%rbx
   1b9a4:	4c 29 db             	sub    %r11,%rbx
   1b9a7:	48 85 f6             	test   %rsi,%rsi
   1b9aa:	49 0f 49 da          	cmovns %r10,%rbx
   1b9ae:	4e 8d 14 01          	lea    (%rcx,%r8,1),%r10
   1b9b2:	49 21 c9             	and    %rcx,%r9
   1b9b5:	4d 29 c8             	sub    %r9,%r8
   1b9b8:	48 85 c9             	test   %rcx,%rcx
   1b9bb:	4d 0f 49 c2          	cmovns %r10,%r8
   1b9bf:	4c 39 c3             	cmp    %r8,%rbx
   1b9c2:	48 0f 43 ce          	cmovae %rsi,%rcx
   1b9c6:	5b                   	pop    %rbx
   1b9c7:	41 5e                	pop    %r14
   1b9c9:	41 5f                	pop    %r15
   1b9cb:	48 89 10             	mov    %rdx,(%rax)
   1b9ce:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1b9d2:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1b9d6:	c3                   	ret
   1b9d7:	4c 89 c2             	mov    %r8,%rdx
   1b9da:	48 89 10             	mov    %rdx,(%rax)
   1b9dd:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1b9e1:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1b9e5:	c3                   	ret
   1b9e6:	48 89 f1             	mov    %rsi,%rcx
   1b9e9:	4c 89 d7             	mov    %r10,%rdi
   1b9ec:	48 89 10             	mov    %rdx,(%rax)
   1b9ef:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1b9f3:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1b9f7:	c3                   	ret
   1b9f8:	cc                   	int3
   1b9f9:	cc                   	int3
   1b9fa:	cc                   	int3
   1b9fb:	cc                   	int3
   1b9fc:	cc                   	int3
   1b9fd:	cc                   	int3
   1b9fe:	cc                   	int3
   1b9ff:	cc                   	int3

<hyperinterval::float::F64Enclosure>::sqrt:
   1ba00:	48 89 f8             	mov    %rdi,%rax
   1ba03:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1ba07:	75 3a                	jne    1ba43 <<hyperinterval::float::F64Enclosure>::sqrt+0x43>
   1ba09:	55                   	push   %rbp
   1ba0a:	41 57                	push   %r15
   1ba0c:	41 56                	push   %r14
   1ba0e:	41 55                	push   %r13
   1ba10:	41 54                	push   %r12
   1ba12:	53                   	push   %rbx
   1ba13:	48 83 ec 28          	sub    $0x28,%rsp
   1ba17:	4c 8b 6e 08          	mov    0x8(%rsi),%r13
   1ba1b:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1ba1f:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1ba26:	00 00 80 
   1ba29:	48 8d 6b ff          	lea    -0x1(%rbx),%rbp
   1ba2d:	4d 85 ff             	test   %r15,%r15
   1ba30:	79 1d                	jns    1ba4f <<hyperinterval::float::F64Enclosure>::sqrt+0x4f>
   1ba32:	4c 89 f9             	mov    %r15,%rcx
   1ba35:	48 21 e9             	and    %rbp,%rcx
   1ba38:	74 15                	je     1ba4f <<hyperinterval::float::F64Enclosure>::sqrt+0x4f>
   1ba3a:	c6 40 08 07          	movb   $0x7,0x8(%rax)
   1ba3e:	e9 da 00 00 00       	jmp    1bb1d <<hyperinterval::float::F64Enclosure>::sqrt+0x11d>
   1ba43:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   1ba4a:	c6 40 18 00          	movb   $0x0,0x18(%rax)
   1ba4e:	c3                   	ret
   1ba4f:	48 89 04 24          	mov    %rax,(%rsp)
   1ba53:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1ba5a:	00 f0 7f 
   1ba5d:	4d 85 ed             	test   %r13,%r13
   1ba60:	0f 98 c0             	sets   %al
   1ba63:	49 85 ed             	test   %rbp,%r13
   1ba66:	41 0f 95 c6          	setne  %r14b
   1ba6a:	31 c9                	xor    %ecx,%ecx
   1ba6c:	41 20 c6             	and    %al,%r14b
   1ba6f:	49 0f 44 cd          	cmove  %r13,%rcx
   1ba73:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1ba78:	48 89 de             	mov    %rbx,%rsi
   1ba7b:	49 89 d4             	mov    %rdx,%r12
   1ba7e:	e8 cd 16 00 00       	call   1d150 <<hyperinterval::ieee::Format>::sqrt>
   1ba83:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   1ba88:	74 11                	je     1ba9b <<hyperinterval::float::F64Enclosure>::sqrt+0x9b>
   1ba8a:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   1ba8f:	48 8b 04 24          	mov    (%rsp),%rax
   1ba93:	88 48 08             	mov    %cl,0x8(%rax)
   1ba96:	e9 82 00 00 00       	jmp    1bb1d <<hyperinterval::float::F64Enclosure>::sqrt+0x11d>
   1ba9b:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1baa0:	4d 39 fd             	cmp    %r15,%r13
   1baa3:	75 0a                	jne    1baaf <<hyperinterval::float::F64Enclosure>::sqrt+0xaf>
   1baa5:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
   1baaa:	4d 89 e5             	mov    %r12,%r13
   1baad:	eb 2c                	jmp    1badb <<hyperinterval::float::F64Enclosure>::sqrt+0xdb>
   1baaf:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   1bab4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1bab9:	48 89 de             	mov    %rbx,%rsi
   1babc:	4d 89 e5             	mov    %r12,%r13
   1babf:	4c 89 e2             	mov    %r12,%rdx
   1bac2:	4c 89 f9             	mov    %r15,%rcx
   1bac5:	e8 86 16 00 00       	call   1d150 <<hyperinterval::ieee::Format>::sqrt>
   1baca:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1bacf:	74 b9                	je     1ba8a <<hyperinterval::float::F64Enclosure>::sqrt+0x8a>
   1bad1:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
   1bad6:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1badb:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1bae0:	48 89 de             	mov    %rbx,%rsi
   1bae3:	4c 89 ea             	mov    %r13,%rdx
   1bae6:	e8 65 0e 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1baeb:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1baf0:	74 1f                	je     1bb11 <<hyperinterval::float::F64Enclosure>::sqrt+0x111>
   1baf2:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1baf7:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1bafc:	48 89 de             	mov    %rbx,%rsi
   1baff:	4c 89 ea             	mov    %r13,%rdx
   1bb02:	4c 89 f9             	mov    %r15,%rcx
   1bb05:	e8 46 0e 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1bb0a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1bb0f:	75 22                	jne    1bb33 <<hyperinterval::float::F64Enclosure>::sqrt+0x133>
   1bb11:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   1bb16:	48 8b 04 24          	mov    (%rsp),%rax
   1bb1a:	88 50 08             	mov    %dl,0x8(%rax)
   1bb1d:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1bb24:	48 83 c4 28          	add    $0x28,%rsp
   1bb28:	5b                   	pop    %rbx
   1bb29:	41 5c                	pop    %r12
   1bb2b:	41 5d                	pop    %r13
   1bb2d:	41 5e                	pop    %r14
   1bb2f:	41 5f                	pop    %r15
   1bb31:	5d                   	pop    %rbp
   1bb32:	c3                   	ret
   1bb33:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1bb38:	49 8d 04 1c          	lea    (%r12,%rbx,1),%rax
   1bb3c:	4c 89 e2             	mov    %r12,%rdx
   1bb3f:	48 21 ea             	and    %rbp,%rdx
   1bb42:	48 89 de             	mov    %rbx,%rsi
   1bb45:	48 29 d6             	sub    %rdx,%rsi
   1bb48:	4d 85 e4             	test   %r12,%r12
   1bb4b:	48 0f 49 f0          	cmovns %rax,%rsi
   1bb4f:	48 8d 04 19          	lea    (%rcx,%rbx,1),%rax
   1bb53:	48 21 cd             	and    %rcx,%rbp
   1bb56:	48 29 eb             	sub    %rbp,%rbx
   1bb59:	48 85 c9             	test   %rcx,%rcx
   1bb5c:	48 0f 49 d8          	cmovns %rax,%rbx
   1bb60:	b2 01                	mov    $0x1,%dl
   1bb62:	48 39 de             	cmp    %rbx,%rsi
   1bb65:	48 8b 04 24          	mov    (%rsp),%rax
   1bb69:	77 af                	ja     1bb1a <<hyperinterval::float::F64Enclosure>::sqrt+0x11a>
   1bb6b:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   1bb72:	4c 89 60 08          	mov    %r12,0x8(%rax)
   1bb76:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1bb7a:	44 88 70 18          	mov    %r14b,0x18(%rax)
   1bb7e:	eb a4                	jmp    1bb24 <<hyperinterval::float::F64Enclosure>::sqrt+0x124>

<hyperinterval::float::F64Enclosure>::point:
   1bb80:	53                   	push   %rbx
   1bb81:	48 83 ec 10          	sub    $0x10,%rsp
   1bb85:	48 89 fb             	mov    %rdi,%rbx
   1bb88:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1bb8d:	48 89 e7             	mov    %rsp,%rdi
   1bb90:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1bb97:	00 00 80 
   1bb9a:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1bba1:	00 f0 7f 
   1bba4:	e8 a7 0d 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1bba9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bbad:	75 0f                	jne    1bbbe <<hyperinterval::float::F64Enclosure>::point+0x3e>
   1bbaf:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1bbb4:	88 43 08             	mov    %al,0x8(%rbx)
   1bbb7:	b8 02 00 00 00       	mov    $0x2,%eax
   1bbbc:	eb 12                	jmp    1bbd0 <<hyperinterval::float::F64Enclosure>::point+0x50>
   1bbbe:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1bbc3:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1bbc7:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1bbcb:	b8 01 00 00 00       	mov    $0x1,%eax
   1bbd0:	48 89 03             	mov    %rax,(%rbx)
   1bbd3:	48 89 d8             	mov    %rbx,%rax
   1bbd6:	48 83 c4 10          	add    $0x10,%rsp
   1bbda:	5b                   	pop    %rbx
   1bbdb:	c3                   	ret
   1bbdc:	cc                   	int3
   1bbdd:	cc                   	int3
   1bbde:	cc                   	int3
   1bbdf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::signs:
   1bbe0:	83 3f 01             	cmpl   $0x1,(%rdi)
   1bbe3:	75 69                	jne    1bc4e <<hyperinterval::float::F64Enclosure>::signs+0x6e>
   1bbe5:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1bbec:	00 00 80 
   1bbef:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   1bbf3:	48 8b 47 10          	mov    0x10(%rdi),%rax
   1bbf7:	4a 8d 14 01          	lea    (%rcx,%r8,1),%rdx
   1bbfb:	49 8d 70 ff          	lea    -0x1(%r8),%rsi
   1bbff:	49 89 c9             	mov    %rcx,%r9
   1bc02:	49 21 f1             	and    %rsi,%r9
   1bc05:	4c 89 c7             	mov    %r8,%rdi
   1bc08:	4c 29 cf             	sub    %r9,%rdi
   1bc0b:	48 85 c9             	test   %rcx,%rcx
   1bc0e:	48 0f 49 fa          	cmovns %rdx,%rdi
   1bc12:	31 d2                	xor    %edx,%edx
   1bc14:	48 85 ff             	test   %rdi,%rdi
   1bc17:	0f 99 c1             	setns  %cl
   1bc1a:	4c 39 c7             	cmp    %r8,%rdi
   1bc1d:	77 1f                	ja     1bc3e <<hyperinterval::float::F64Enclosure>::signs+0x5e>
   1bc1f:	48 85 ff             	test   %rdi,%rdi
   1bc22:	40 0f 99 c7          	setns  %dil
   1bc26:	40 80 cf 02          	or     $0x2,%dil
   1bc2a:	48 85 f0             	test   %rsi,%rax
   1bc2d:	88 ca                	mov    %cl,%dl
   1bc2f:	40 0f b6 cf          	movzbl %dil,%ecx
   1bc33:	0f 44 d1             	cmove  %ecx,%edx
   1bc36:	48 85 c0             	test   %rax,%rax
   1bc39:	0f 49 d1             	cmovns %ecx,%edx
   1bc3c:	89 d1                	mov    %edx,%ecx
   1bc3e:	8d 51 04             	lea    0x4(%rcx),%edx
   1bc41:	48 85 c0             	test   %rax,%rax
   1bc44:	0f b6 c9             	movzbl %cl,%ecx
   1bc47:	0f b6 c2             	movzbl %dl,%eax
   1bc4a:	0f 4e c1             	cmovle %ecx,%eax
   1bc4d:	c3                   	ret
   1bc4e:	31 c0                	xor    %eax,%eax
   1bc50:	c3                   	ret
   1bc51:	cc                   	int3
   1bc52:	cc                   	int3
   1bc53:	cc                   	int3
   1bc54:	cc                   	int3
   1bc55:	cc                   	int3
   1bc56:	cc                   	int3
   1bc57:	cc                   	int3
   1bc58:	cc                   	int3
   1bc59:	cc                   	int3
   1bc5a:	cc                   	int3
   1bc5b:	cc                   	int3
   1bc5c:	cc                   	int3
   1bc5d:	cc                   	int3
   1bc5e:	cc                   	int3
   1bc5f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::affine:
   1bc60:	55                   	push   %rbp
   1bc61:	41 57                	push   %r15
   1bc63:	41 56                	push   %r14
   1bc65:	41 55                	push   %r13
   1bc67:	41 54                	push   %r12
   1bc69:	53                   	push   %rbx
   1bc6a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   1bc71:	f2 0f 11 4c 24 28    	movsd  %xmm1,0x28(%rsp)
   1bc77:	49 89 f5             	mov    %rsi,%r13
   1bc7a:	48 89 fb             	mov    %rdi,%rbx
   1bc7d:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1bc84:	00 00 80 
   1bc87:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1bc8e:	00 f0 7f 
   1bc91:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1bc96:	48 89 e7             	mov    %rsp,%rdi
   1bc99:	4c 89 f6             	mov    %r14,%rsi
   1bc9c:	4c 89 fa             	mov    %r15,%rdx
   1bc9f:	e8 ac 0c 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1bca4:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bca8:	74 24                	je     1bcce <<hyperinterval::float::F64Enclosure>::affine+0x6e>
   1bcaa:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1bcaf:	f3 0f 7e 44 24 28    	movq   0x28(%rsp),%xmm0
   1bcb5:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1bcba:	48 89 e7             	mov    %rsp,%rdi
   1bcbd:	4c 89 f6             	mov    %r14,%rsi
   1bcc0:	4c 89 fa             	mov    %r15,%rdx
   1bcc3:	e8 88 0c 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1bcc8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bccc:	75 24                	jne    1bcf2 <<hyperinterval::float::F64Enclosure>::affine+0x92>
   1bcce:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1bcd3:	88 43 08             	mov    %al,0x8(%rbx)
   1bcd6:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1bcdd:	48 89 d8             	mov    %rbx,%rax
   1bce0:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1bce7:	5b                   	pop    %rbx
   1bce8:	41 5c                	pop    %r12
   1bcea:	41 5d                	pop    %r13
   1bcec:	41 5e                	pop    %r14
   1bcee:	41 5f                	pop    %r15
   1bcf0:	5d                   	pop    %rbp
   1bcf1:	c3                   	ret
   1bcf2:	41 f6 45 00 01       	testb  $0x1,0x0(%r13)
   1bcf7:	0f 84 d8 01 00 00    	je     1bed5 <<hyperinterval::float::F64Enclosure>::affine+0x275>
   1bcfd:	49 b8 ff ff ff ff ff 	movabs $0xfffffffffffff,%r8
   1bd04:	ff 0f 00 
   1bd07:	49 8b 4d 08          	mov    0x8(%r13),%rcx
   1bd0b:	48 89 c8             	mov    %rcx,%rax
   1bd0e:	48 c1 e8 34          	shr    $0x34,%rax
   1bd12:	25 ff 07 00 00       	and    $0x7ff,%eax
   1bd17:	48 89 ca             	mov    %rcx,%rdx
   1bd1a:	4c 21 c2             	and    %r8,%rdx
   1bd1d:	4d 8d 48 01          	lea    0x1(%r8),%r9
   1bd21:	48 85 c0             	test   %rax,%rax
   1bd24:	bf 01 00 00 00       	mov    $0x1,%edi
   1bd29:	89 c6                	mov    %eax,%esi
   1bd2b:	0f 44 f7             	cmove  %edi,%esi
   1bd2e:	49 0f 45 c1          	cmovne %r9,%rax
   1bd32:	48 09 d0             	or     %rdx,%rax
   1bd35:	4c 89 e5             	mov    %r12,%rbp
   1bd38:	48 c1 ed 34          	shr    $0x34,%rbp
   1bd3c:	81 e5 ff 07 00 00    	and    $0x7ff,%ebp
   1bd42:	4c 89 e2             	mov    %r12,%rdx
   1bd45:	4c 21 c2             	and    %r8,%rdx
   1bd48:	8d bd 9a f7 ff ff    	lea    -0x866(%rbp),%edi
   1bd4e:	48 85 ed             	test   %rbp,%rbp
   1bd51:	49 0f 45 e9          	cmovne %r9,%rbp
   1bd55:	4c 8b 54 24 08       	mov    0x8(%rsp),%r10
   1bd5a:	41 bb 9b f7 ff ff    	mov    $0xfffff79b,%r11d
   1bd60:	44 0f 45 df          	cmovne %edi,%r11d
   1bd64:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   1bd68:	48 89 bc 24 88 00 00 	mov    %rdi,0x88(%rsp)
   1bd6f:	00 
   1bd70:	48 09 d5             	or     %rdx,%rbp
   1bd73:	4c 31 e1             	xor    %r12,%rcx
   1bd76:	48 f7 e5             	mul    %rbp
   1bd79:	44 89 5c 24 34       	mov    %r11d,0x34(%rsp)
   1bd7e:	44 01 de             	add    %r11d,%esi
   1bd81:	48 c1 e9 3f          	shr    $0x3f,%rcx
   1bd85:	88 4c 24 64          	mov    %cl,0x64(%rsp)
   1bd89:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   1bd8e:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1bd93:	89 74 24 60          	mov    %esi,0x60(%rsp)
   1bd97:	4c 89 fa             	mov    %r15,%rdx
   1bd9a:	4d 89 d7             	mov    %r10,%r15
   1bd9d:	49 c1 ef 34          	shr    $0x34,%r15
   1bda1:	41 81 e7 ff 07 00 00 	and    $0x7ff,%r15d
   1bda8:	4c 89 d0             	mov    %r10,%rax
   1bdab:	4c 21 c0             	and    %r8,%rax
   1bdae:	41 8d 8f cd fb ff ff 	lea    -0x433(%r15),%ecx
   1bdb5:	4d 85 ff             	test   %r15,%r15
   1bdb8:	4c 89 4c 24 28       	mov    %r9,0x28(%rsp)
   1bdbd:	4d 0f 45 f9          	cmovne %r9,%r15
   1bdc1:	41 bd ce fb ff ff    	mov    $0xfffffbce,%r13d
   1bdc7:	44 0f 45 e9          	cmovne %ecx,%r13d
   1bdcb:	49 09 c7             	or     %rax,%r15
   1bdce:	49 c1 ea 3f          	shr    $0x3f,%r10
   1bdd2:	4c 89 94 24 90 00 00 	mov    %r10,0x90(%rsp)
   1bdd9:	00 
   1bdda:	44 88 54 24 14       	mov    %r10b,0x14(%rsp)
   1bddf:	4c 89 3c 24          	mov    %r15,(%rsp)
   1bde3:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   1bdea:	00 00 
   1bdec:	44 89 6c 24 10       	mov    %r13d,0x10(%rsp)
   1bdf1:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1bdf6:	48 8d 4c 24 50       	lea    0x50(%rsp),%rcx
   1bdfb:	49 89 e0             	mov    %rsp,%r8
   1bdfe:	4c 89 f6             	mov    %r14,%rsi
   1be01:	e8 7a 21 00 00       	call   1df80 <<hyperinterval::ieee::Format>::add_wide>
   1be06:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   1be0b:	0f 84 ba 00 00 00    	je     1becb <<hyperinterval::float::F64Enclosure>::affine+0x26b>
   1be11:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1be16:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
   1be1d:	00 
   1be1e:	48 8b bc 24 88 00 00 	mov    0x88(%rsp),%rdi
   1be25:	00 
   1be26:	48 89 fa             	mov    %rdi,%rdx
   1be29:	48 c1 ea 34          	shr    $0x34,%rdx
   1be2d:	81 e2 ff 07 00 00    	and    $0x7ff,%edx
   1be33:	48 b9 ff ff ff ff ff 	movabs $0xfffffffffffff,%rcx
   1be3a:	ff 0f 00 
   1be3d:	48 21 f9             	and    %rdi,%rcx
   1be40:	48 85 d2             	test   %rdx,%rdx
   1be43:	be 01 00 00 00       	mov    $0x1,%esi
   1be48:	0f 45 f2             	cmovne %edx,%esi
   1be4b:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
   1be50:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
   1be55:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   1be5a:	48 0f 44 c2          	cmove  %rdx,%rax
   1be5e:	48 09 c8             	or     %rcx,%rax
   1be61:	49 31 fc             	xor    %rdi,%r12
   1be64:	48 f7 e5             	mul    %rbp
   1be67:	8b 4c 24 34          	mov    0x34(%rsp),%ecx
   1be6b:	01 f1                	add    %esi,%ecx
   1be6d:	49 c1 ec 3f          	shr    $0x3f,%r12
   1be71:	44 88 64 24 64       	mov    %r12b,0x64(%rsp)
   1be76:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   1be7b:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1be80:	89 4c 24 60          	mov    %ecx,0x60(%rsp)
   1be84:	48 8b 84 24 90 00 00 	mov    0x90(%rsp),%rax
   1be8b:	00 
   1be8c:	88 44 24 14          	mov    %al,0x14(%rsp)
   1be90:	4c 89 3c 24          	mov    %r15,(%rsp)
   1be94:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   1be9b:	00 00 
   1be9d:	44 89 6c 24 10       	mov    %r13d,0x10(%rsp)
   1bea2:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1bea7:	48 8d 4c 24 50       	lea    0x50(%rsp),%rcx
   1beac:	49 89 e0             	mov    %rsp,%r8
   1beaf:	4c 89 f6             	mov    %r14,%rsi
   1beb2:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1beb9:	00 f0 7f 
   1bebc:	4c 89 fa             	mov    %r15,%rdx
   1bebf:	e8 bc 20 00 00       	call   1df80 <<hyperinterval::ieee::Format>::add_wide>
   1bec4:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   1bec9:	75 16                	jne    1bee1 <<hyperinterval::float::F64Enclosure>::affine+0x281>
   1becb:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
   1bed0:	e9 fe fd ff ff       	jmp    1bcd3 <<hyperinterval::float::F64Enclosure>::affine+0x73>
   1bed5:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1bedc:	e9 fc fd ff ff       	jmp    1bcdd <<hyperinterval::float::F64Enclosure>::affine+0x7d>
   1bee1:	4c 8b 6c 24 40       	mov    0x40(%rsp),%r13
   1bee6:	48 8b 6c 24 48       	mov    0x48(%rsp),%rbp
   1beeb:	48 89 e7             	mov    %rsp,%rdi
   1beee:	4c 89 f6             	mov    %r14,%rsi
   1bef1:	4c 89 fa             	mov    %r15,%rdx
   1bef4:	48 8b 8c 24 80 00 00 	mov    0x80(%rsp),%rcx
   1befb:	00 
   1befc:	e8 4f 0a 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1bf01:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bf05:	0f 84 c3 fd ff ff    	je     1bcce <<hyperinterval::float::F64Enclosure>::affine+0x6e>
   1bf0b:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1bf10:	48 89 e7             	mov    %rsp,%rdi
   1bf13:	4c 89 f6             	mov    %r14,%rsi
   1bf16:	4c 89 fa             	mov    %r15,%rdx
   1bf19:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
   1bf1e:	e8 2d 0a 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1bf23:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bf27:	0f 84 a1 fd ff ff    	je     1bcce <<hyperinterval::float::F64Enclosure>::affine+0x6e>
   1bf2d:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1bf32:	4b 8d 04 34          	lea    (%r12,%r14,1),%rax
   1bf36:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1bf3a:	4c 89 e2             	mov    %r12,%rdx
   1bf3d:	48 21 ca             	and    %rcx,%rdx
   1bf40:	4c 89 f6             	mov    %r14,%rsi
   1bf43:	48 29 d6             	sub    %rdx,%rsi
   1bf46:	4d 85 e4             	test   %r12,%r12
   1bf49:	48 0f 49 f0          	cmovns %rax,%rsi
   1bf4d:	4b 8d 04 37          	lea    (%r15,%r14,1),%rax
   1bf51:	4c 21 f9             	and    %r15,%rcx
   1bf54:	49 29 ce             	sub    %rcx,%r14
   1bf57:	4d 85 ff             	test   %r15,%r15
   1bf5a:	4c 0f 49 f0          	cmovns %rax,%r14
   1bf5e:	b0 01                	mov    $0x1,%al
   1bf60:	4c 39 f6             	cmp    %r14,%rsi
   1bf63:	0f 87 6a fd ff ff    	ja     1bcd3 <<hyperinterval::float::F64Enclosure>::affine+0x73>
   1bf69:	48 89 e7             	mov    %rsp,%rdi
   1bf6c:	4c 89 ee             	mov    %r13,%rsi
   1bf6f:	48 89 ea             	mov    %rbp,%rdx
   1bf72:	e8 49 06 00 00       	call   1c5c0 <<hyperinterval::float::F64Enclosure>::from_bits>
   1bf77:	48 8b 04 24          	mov    (%rsp),%rax
   1bf7b:	48 83 f8 02          	cmp    $0x2,%rax
   1bf7f:	75 0a                	jne    1bf8b <<hyperinterval::float::F64Enclosure>::affine+0x32b>
   1bf81:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1bf86:	e9 48 fd ff ff       	jmp    1bcd3 <<hyperinterval::float::F64Enclosure>::affine+0x73>
   1bf8b:	83 f8 01             	cmp    $0x1,%eax
   1bf8e:	75 1b                	jne    1bfab <<hyperinterval::float::F64Enclosure>::affine+0x34b>
   1bf90:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1bf95:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1bf9a:	4c 89 e7             	mov    %r12,%rdi
   1bf9d:	4c 89 fe             	mov    %r15,%rsi
   1bfa0:	e8 3b 24 00 00       	call   1e3e0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1bfa5:	49 89 c4             	mov    %rax,%r12
   1bfa8:	49 89 d7             	mov    %rdx,%r15
   1bfab:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1bfb2:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   1bfb6:	4c 89 7b 10          	mov    %r15,0x10(%rbx)
   1bfba:	e9 1e fd ff ff       	jmp    1bcdd <<hyperinterval::float::F64Enclosure>::affine+0x7d>
   1bfbf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::square:
   1bfc0:	55                   	push   %rbp
   1bfc1:	41 57                	push   %r15
   1bfc3:	41 56                	push   %r14
   1bfc5:	41 55                	push   %r13
   1bfc7:	41 54                	push   %r12
   1bfc9:	53                   	push   %rbx
   1bfca:	48 83 ec 58          	sub    $0x58,%rsp
   1bfce:	48 89 fb             	mov    %rdi,%rbx
   1bfd1:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1bfd5:	0f 85 0c 01 00 00    	jne    1c0e7 <<hyperinterval::float::F64Enclosure>::square+0x127>
   1bfdb:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1bfdf:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
   1bfe6:	00 00 80 
   1bfe9:	49 b8 00 00 00 00 00 	movabs $0x7ff0000000000000,%r8
   1bff0:	00 f0 7f 
   1bff3:	49 be ff ff ff ff ff 	movabs $0xfffffffffffff,%r14
   1bffa:	ff 0f 00 
   1bffd:	48 8b 56 08          	mov    0x8(%rsi),%rdx
   1c001:	48 89 d1             	mov    %rdx,%rcx
   1c004:	48 c1 e9 34          	shr    $0x34,%rcx
   1c008:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1c00e:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
   1c013:	4c 21 f2             	and    %r14,%rdx
   1c016:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   1c01a:	48 85 c9             	test   %rcx,%rcx
   1c01d:	48 89 e8             	mov    %rbp,%rax
   1c020:	48 0f 44 c1          	cmove  %rcx,%rax
   1c024:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1c02b:	41 bd 9c f7 ff ff    	mov    $0xfffff79c,%r13d
   1c031:	41 0f 44 cd          	cmove  %r13d,%ecx
   1c035:	48 09 d0             	or     %rdx,%rax
   1c038:	48 f7 e0             	mul    %rax
   1c03b:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1c040:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1c045:	48 89 04 24          	mov    %rax,(%rsp)
   1c049:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1c04d:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1c052:	48 89 e1             	mov    %rsp,%rcx
   1c055:	4c 89 e6             	mov    %r12,%rsi
   1c058:	4c 89 c2             	mov    %r8,%rdx
   1c05b:	e8 00 1c 00 00       	call   1dc60 <<hyperinterval::ieee::Format>::rounded>
   1c060:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   1c065:	75 79                	jne    1c0e0 <<hyperinterval::float::F64Enclosure>::square+0x120>
   1c067:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   1c06c:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1c071:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1c076:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1c07b:	4c 89 f8             	mov    %r15,%rax
   1c07e:	48 c1 e8 34          	shr    $0x34,%rax
   1c082:	25 ff 07 00 00       	and    $0x7ff,%eax
   1c087:	4c 89 7c 24 48       	mov    %r15,0x48(%rsp)
   1c08c:	4d 21 fe             	and    %r15,%r14
   1c08f:	48 85 c0             	test   %rax,%rax
   1c092:	48 0f 44 e8          	cmove  %rax,%rbp
   1c096:	8d 8c 00 9a f7 ff ff 	lea    -0x866(%rax,%rax,1),%ecx
   1c09d:	41 0f 44 cd          	cmove  %r13d,%ecx
   1c0a1:	4c 09 f5             	or     %r14,%rbp
   1c0a4:	48 89 e8             	mov    %rbp,%rax
   1c0a7:	48 f7 e5             	mul    %rbp
   1c0aa:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1c0af:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1c0b4:	48 89 04 24          	mov    %rax,(%rsp)
   1c0b8:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1c0bc:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1c0c1:	48 89 e1             	mov    %rsp,%rcx
   1c0c4:	4c 89 e6             	mov    %r12,%rsi
   1c0c7:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1c0ce:	00 f0 7f 
   1c0d1:	4c 89 fa             	mov    %r15,%rdx
   1c0d4:	e8 87 1b 00 00       	call   1dc60 <<hyperinterval::ieee::Format>::rounded>
   1c0d9:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   1c0de:	75 10                	jne    1c0f0 <<hyperinterval::float::F64Enclosure>::square+0x130>
   1c0e0:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   1c0e5:	eb 4f                	jmp    1c136 <<hyperinterval::float::F64Enclosure>::square+0x176>
   1c0e7:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1c0ee:	eb 50                	jmp    1c140 <<hyperinterval::float::F64Enclosure>::square+0x180>
   1c0f0:	4c 8b 6c 24 38       	mov    0x38(%rsp),%r13
   1c0f5:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
   1c0fa:	48 89 e7             	mov    %rsp,%rdi
   1c0fd:	4c 89 e6             	mov    %r12,%rsi
   1c100:	4c 89 fa             	mov    %r15,%rdx
   1c103:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   1c108:	e8 43 08 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1c10d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c111:	74 1e                	je     1c131 <<hyperinterval::float::F64Enclosure>::square+0x171>
   1c113:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1c118:	48 89 e7             	mov    %rsp,%rdi
   1c11b:	4c 89 e6             	mov    %r12,%rsi
   1c11e:	4c 89 fa             	mov    %r15,%rdx
   1c121:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1c126:	e8 25 08 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1c12b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c12f:	75 21                	jne    1c152 <<hyperinterval::float::F64Enclosure>::square+0x192>
   1c131:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1c136:	88 43 08             	mov    %al,0x8(%rbx)
   1c139:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c140:	48 89 d8             	mov    %rbx,%rax
   1c143:	48 83 c4 58          	add    $0x58,%rsp
   1c147:	5b                   	pop    %rbx
   1c148:	41 5c                	pop    %r12
   1c14a:	41 5d                	pop    %r13
   1c14c:	41 5e                	pop    %r14
   1c14e:	41 5f                	pop    %r15
   1c150:	5d                   	pop    %rbp
   1c151:	c3                   	ret
   1c152:	4c 89 e9             	mov    %r13,%rcx
   1c155:	4c 89 74 24 28       	mov    %r14,0x28(%rsp)
   1c15a:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1c15f:	49 8d 04 2c          	lea    (%r12,%rbp,1),%rax
   1c163:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
   1c168:	48 89 ee             	mov    %rbp,%rsi
   1c16b:	4c 21 f6             	and    %r14,%rsi
   1c16e:	4c 89 e2             	mov    %r12,%rdx
   1c171:	48 29 f2             	sub    %rsi,%rdx
   1c174:	48 85 ed             	test   %rbp,%rbp
   1c177:	48 0f 49 d0          	cmovns %rax,%rdx
   1c17b:	4b 8d 04 2c          	lea    (%r12,%r13,1),%rax
   1c17f:	4c 89 ef             	mov    %r13,%rdi
   1c182:	4c 21 f7             	and    %r14,%rdi
   1c185:	4c 89 e6             	mov    %r12,%rsi
   1c188:	48 29 fe             	sub    %rdi,%rsi
   1c18b:	4d 85 ed             	test   %r13,%r13
   1c18e:	48 0f 49 f0          	cmovns %rax,%rsi
   1c192:	b0 01                	mov    $0x1,%al
   1c194:	48 39 f2             	cmp    %rsi,%rdx
   1c197:	77 9d                	ja     1c136 <<hyperinterval::float::F64Enclosure>::square+0x176>
   1c199:	48 89 e7             	mov    %rsp,%rdi
   1c19c:	4c 89 e6             	mov    %r12,%rsi
   1c19f:	4c 89 fa             	mov    %r15,%rdx
   1c1a2:	e8 a9 07 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1c1a7:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c1ab:	74 84                	je     1c131 <<hyperinterval::float::F64Enclosure>::square+0x171>
   1c1ad:	4c 89 6c 24 20       	mov    %r13,0x20(%rsp)
   1c1b2:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1c1b7:	48 89 e7             	mov    %rsp,%rdi
   1c1ba:	4c 89 e6             	mov    %r12,%rsi
   1c1bd:	4c 89 fa             	mov    %r15,%rdx
   1c1c0:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   1c1c5:	e8 86 07 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1c1ca:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c1ce:	0f 84 5d ff ff ff    	je     1c131 <<hyperinterval::float::F64Enclosure>::square+0x171>
   1c1d4:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1c1d9:	4b 8d 04 2c          	lea    (%r12,%r13,1),%rax
   1c1dd:	4c 89 ea             	mov    %r13,%rdx
   1c1e0:	4c 21 f2             	and    %r14,%rdx
   1c1e3:	4c 89 e6             	mov    %r12,%rsi
   1c1e6:	48 29 d6             	sub    %rdx,%rsi
   1c1e9:	4d 85 ed             	test   %r13,%r13
   1c1ec:	48 0f 49 f0          	cmovns %rax,%rsi
   1c1f0:	4a 8d 04 21          	lea    (%rcx,%r12,1),%rax
   1c1f4:	49 21 ce             	and    %rcx,%r14
   1c1f7:	4d 29 f4             	sub    %r14,%r12
   1c1fa:	48 85 c9             	test   %rcx,%rcx
   1c1fd:	4c 0f 49 e0          	cmovns %rax,%r12
   1c201:	b0 01                	mov    $0x1,%al
   1c203:	4c 39 e6             	cmp    %r12,%rsi
   1c206:	0f 87 2a ff ff ff    	ja     1c136 <<hyperinterval::float::F64Enclosure>::square+0x176>
   1c20c:	48 89 ef             	mov    %rbp,%rdi
   1c20f:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1c214:	4c 89 ea             	mov    %r13,%rdx
   1c217:	e8 c4 21 00 00       	call   1e3e0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1c21c:	49 89 c5             	mov    %rax,%r13
   1c21f:	49 89 d4             	mov    %rdx,%r12
   1c222:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1c227:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
   1c22c:	31 d2                	xor    %edx,%edx
   1c22e:	e8 2d 22 00 00       	call   1e460 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::signs>
   1c233:	a8 02                	test   $0x2,%al
   1c235:	75 14                	jne    1c24b <<hyperinterval::float::F64Enclosure>::square+0x28b>
   1c237:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1c23e:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1c242:	4c 89 63 10          	mov    %r12,0x10(%rbx)
   1c246:	e9 f5 fe ff ff       	jmp    1c140 <<hyperinterval::float::F64Enclosure>::square+0x180>
   1c24b:	48 89 e7             	mov    %rsp,%rdi
   1c24e:	31 f6                	xor    %esi,%esi
   1c250:	31 d2                	xor    %edx,%edx
   1c252:	e8 69 03 00 00       	call   1c5c0 <<hyperinterval::float::F64Enclosure>::from_bits>
   1c257:	48 8b 04 24          	mov    (%rsp),%rax
   1c25b:	48 83 f8 02          	cmp    $0x2,%rax
   1c25f:	75 0a                	jne    1c26b <<hyperinterval::float::F64Enclosure>::square+0x2ab>
   1c261:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1c266:	e9 cb fe ff ff       	jmp    1c136 <<hyperinterval::float::F64Enclosure>::square+0x176>
   1c26b:	83 f8 01             	cmp    $0x1,%eax
   1c26e:	75 c7                	jne    1c237 <<hyperinterval::float::F64Enclosure>::square+0x277>
   1c270:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1c275:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1c27a:	4c 89 ef             	mov    %r13,%rdi
   1c27d:	4c 89 e6             	mov    %r12,%rsi
   1c280:	e8 5b 21 00 00       	call   1e3e0 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull>
   1c285:	49 89 c5             	mov    %rax,%r13
   1c288:	49 89 d4             	mov    %rdx,%r12
   1c28b:	eb aa                	jmp    1c237 <<hyperinterval::float::F64Enclosure>::square+0x277>
   1c28d:	cc                   	int3
   1c28e:	cc                   	int3
   1c28f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::next_up:
   1c290:	41 57                	push   %r15
   1c292:	41 56                	push   %r14
   1c294:	53                   	push   %rbx
   1c295:	48 83 ec 10          	sub    $0x10,%rsp
   1c299:	48 89 fb             	mov    %rdi,%rbx
   1c29c:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1c2a3:	00 00 80 
   1c2a6:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1c2ad:	00 f0 7f 
   1c2b0:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1c2b5:	48 89 e7             	mov    %rsp,%rdi
   1c2b8:	4c 89 f6             	mov    %r14,%rsi
   1c2bb:	4c 89 fa             	mov    %r15,%rdx
   1c2be:	e8 8d 06 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1c2c3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c2c7:	75 0c                	jne    1c2d5 <<hyperinterval::float::F64Enclosure>::next_up+0x45>
   1c2c9:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1c2ce:	88 43 01             	mov    %al,0x1(%rbx)
   1c2d1:	b0 01                	mov    $0x1,%al
   1c2d3:	eb 3c                	jmp    1c311 <<hyperinterval::float::F64Enclosure>::next_up+0x81>
   1c2d5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c2da:	48 89 c1             	mov    %rax,%rcx
   1c2dd:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1c2e1:	48 83 c9 01          	or     $0x1,%rcx
   1c2e5:	48 01 c1             	add    %rax,%rcx
   1c2e8:	48 89 e7             	mov    %rsp,%rdi
   1c2eb:	4c 89 f6             	mov    %r14,%rsi
   1c2ee:	4c 89 fa             	mov    %r15,%rdx
   1c2f1:	e8 5a 06 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1c2f6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c2fa:	75 08                	jne    1c304 <<hyperinterval::float::F64Enclosure>::next_up+0x74>
   1c2fc:	c6 43 01 05          	movb   $0x5,0x1(%rbx)
   1c300:	b0 01                	mov    $0x1,%al
   1c302:	eb 0d                	jmp    1c311 <<hyperinterval::float::F64Enclosure>::next_up+0x81>
   1c304:	f3 0f 7e 44 24 08    	movq   0x8(%rsp),%xmm0
   1c30a:	66 0f d6 43 08       	movq   %xmm0,0x8(%rbx)
   1c30f:	31 c0                	xor    %eax,%eax
   1c311:	88 03                	mov    %al,(%rbx)
   1c313:	48 89 d8             	mov    %rbx,%rax
   1c316:	48 83 c4 10          	add    $0x10,%rsp
   1c31a:	5b                   	pop    %rbx
   1c31b:	41 5e                	pop    %r14
   1c31d:	41 5f                	pop    %r15
   1c31f:	c3                   	ret

<hyperinterval::float::F64Enclosure>::disjoint:
   1c320:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1c324:	b0 01                	mov    $0x1,%al
   1c326:	0f 84 8b 00 00 00    	je     1c3b7 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1c32c:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1c330:	0f 84 81 00 00 00    	je     1c3b7 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1c336:	53                   	push   %rbx
   1c337:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
   1c33e:	00 00 80 
   1c341:	4c 8b 47 10          	mov    0x10(%rdi),%r8
   1c345:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
   1c349:	4d 8d 14 08          	lea    (%r8,%rcx,1),%r10
   1c34d:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
   1c351:	4d 89 c3             	mov    %r8,%r11
   1c354:	49 21 d3             	and    %rdx,%r11
   1c357:	48 89 cb             	mov    %rcx,%rbx
   1c35a:	4c 29 db             	sub    %r11,%rbx
   1c35d:	4d 85 c0             	test   %r8,%r8
   1c360:	49 0f 49 da          	cmovns %r10,%rbx
   1c364:	4d 8d 04 09          	lea    (%r9,%rcx,1),%r8
   1c368:	4d 89 ca             	mov    %r9,%r10
   1c36b:	49 21 d2             	and    %rdx,%r10
   1c36e:	49 89 cb             	mov    %rcx,%r11
   1c371:	4d 29 d3             	sub    %r10,%r11
   1c374:	4d 85 c9             	test   %r9,%r9
   1c377:	4d 0f 49 d8          	cmovns %r8,%r11
   1c37b:	4c 39 db             	cmp    %r11,%rbx
   1c37e:	5b                   	pop    %rbx
   1c37f:	72 36                	jb     1c3b7 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1c381:	48 8b 47 08          	mov    0x8(%rdi),%rax
   1c385:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1c389:	48 8d 3c 0e          	lea    (%rsi,%rcx,1),%rdi
   1c38d:	49 89 f0             	mov    %rsi,%r8
   1c390:	49 21 d0             	and    %rdx,%r8
   1c393:	49 89 c9             	mov    %rcx,%r9
   1c396:	4d 29 c1             	sub    %r8,%r9
   1c399:	48 85 f6             	test   %rsi,%rsi
   1c39c:	4c 0f 49 cf          	cmovns %rdi,%r9
   1c3a0:	48 8d 34 08          	lea    (%rax,%rcx,1),%rsi
   1c3a4:	48 21 c2             	and    %rax,%rdx
   1c3a7:	48 29 d1             	sub    %rdx,%rcx
   1c3aa:	48 85 c0             	test   %rax,%rax
   1c3ad:	48 0f 49 ce          	cmovns %rsi,%rcx
   1c3b1:	49 39 c9             	cmp    %rcx,%r9
   1c3b4:	0f 92 c0             	setb   %al
   1c3b7:	c3                   	ret
   1c3b8:	cc                   	int3
   1c3b9:	cc                   	int3
   1c3ba:	cc                   	int3
   1c3bb:	cc                   	int3
   1c3bc:	cc                   	int3
   1c3bd:	cc                   	int3
   1c3be:	cc                   	int3
   1c3bf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::expanded:
   1c3c0:	41 57                	push   %r15
   1c3c2:	41 56                	push   %r14
   1c3c4:	41 55                	push   %r13
   1c3c6:	41 54                	push   %r12
   1c3c8:	53                   	push   %rbx
   1c3c9:	48 83 ec 10          	sub    $0x10,%rsp
   1c3cd:	48 89 fb             	mov    %rdi,%rbx
   1c3d0:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1c3d4:	75 7f                	jne    1c455 <<hyperinterval::float::F64Enclosure>::expanded+0x95>
   1c3d6:	4c 8b 66 10          	mov    0x10(%rsi),%r12
   1c3da:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1c3e1:	00 00 80 
   1c3e4:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1c3eb:	00 f0 7f 
   1c3ee:	48 8b 46 08          	mov    0x8(%rsi),%rax
   1c3f2:	48 89 c2             	mov    %rax,%rdx
   1c3f5:	4c 31 f2             	xor    %r14,%rdx
   1c3f8:	48 85 c0             	test   %rax,%rax
   1c3fb:	48 0f 44 d0          	cmove  %rax,%rdx
   1c3ff:	48 89 d1             	mov    %rdx,%rcx
   1c402:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1c406:	48 83 c9 01          	or     $0x1,%rcx
   1c40a:	48 01 d1             	add    %rdx,%rcx
   1c40d:	48 89 e7             	mov    %rsp,%rdi
   1c410:	4c 89 f6             	mov    %r14,%rsi
   1c413:	4c 89 fa             	mov    %r15,%rdx
   1c416:	e8 35 05 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1c41b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1c41f:	75 27                	jne    1c448 <<hyperinterval::float::F64Enclosure>::expanded+0x88>
   1c421:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1c426:	4c 89 e1             	mov    %r12,%rcx
   1c429:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1c42d:	48 83 c9 01          	or     $0x1,%rcx
   1c431:	4c 01 e1             	add    %r12,%rcx
   1c434:	48 89 e7             	mov    %rsp,%rdi
   1c437:	4c 89 f6             	mov    %r14,%rsi
   1c43a:	4c 89 fa             	mov    %r15,%rdx
   1c43d:	e8 0e 05 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1c442:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c446:	75 25                	jne    1c46d <<hyperinterval::float::F64Enclosure>::expanded+0xad>
   1c448:	c6 43 08 05          	movb   $0x5,0x8(%rbx)
   1c44c:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c453:	eb 07                	jmp    1c45c <<hyperinterval::float::F64Enclosure>::expanded+0x9c>
   1c455:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1c45c:	48 89 d8             	mov    %rbx,%rax
   1c45f:	48 83 c4 10          	add    $0x10,%rsp
   1c463:	5b                   	pop    %rbx
   1c464:	41 5c                	pop    %r12
   1c466:	41 5d                	pop    %r13
   1c468:	41 5e                	pop    %r14
   1c46a:	41 5f                	pop    %r15
   1c46c:	c3                   	ret
   1c46d:	4c 89 e9             	mov    %r13,%rcx
   1c470:	4c 31 f1             	xor    %r14,%rcx
   1c473:	4d 85 ed             	test   %r13,%r13
   1c476:	49 0f 44 cd          	cmove  %r13,%rcx
   1c47a:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1c47f:	48 89 e7             	mov    %rsp,%rdi
   1c482:	4c 89 f6             	mov    %r14,%rsi
   1c485:	4c 89 fa             	mov    %r15,%rdx
   1c488:	e8 c3 04 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1c48d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c491:	74 1c                	je     1c4af <<hyperinterval::float::F64Enclosure>::expanded+0xef>
   1c493:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1c498:	48 89 e7             	mov    %rsp,%rdi
   1c49b:	4c 89 f6             	mov    %r14,%rsi
   1c49e:	4c 89 fa             	mov    %r15,%rdx
   1c4a1:	4c 89 e1             	mov    %r12,%rcx
   1c4a4:	e8 a7 04 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1c4a9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c4ad:	75 11                	jne    1c4c0 <<hyperinterval::float::F64Enclosure>::expanded+0x100>
   1c4af:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1c4b4:	88 43 08             	mov    %al,0x8(%rbx)
   1c4b7:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c4be:	eb 9c                	jmp    1c45c <<hyperinterval::float::F64Enclosure>::expanded+0x9c>
   1c4c0:	4b 8d 04 2e          	lea    (%r14,%r13,1),%rax
   1c4c4:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1c4c8:	4c 89 ea             	mov    %r13,%rdx
   1c4cb:	48 21 ca             	and    %rcx,%rdx
   1c4ce:	4c 89 f6             	mov    %r14,%rsi
   1c4d1:	48 29 d6             	sub    %rdx,%rsi
   1c4d4:	4d 85 ed             	test   %r13,%r13
   1c4d7:	48 0f 49 f0          	cmovns %rax,%rsi
   1c4db:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c4e0:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1c4e4:	48 21 c1             	and    %rax,%rcx
   1c4e7:	49 29 ce             	sub    %rcx,%r14
   1c4ea:	48 85 c0             	test   %rax,%rax
   1c4ed:	4c 0f 49 f2          	cmovns %rdx,%r14
   1c4f1:	4c 39 f6             	cmp    %r14,%rsi
   1c4f4:	76 10                	jbe    1c506 <<hyperinterval::float::F64Enclosure>::expanded+0x146>
   1c4f6:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1c4fa:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c501:	e9 56 ff ff ff       	jmp    1c45c <<hyperinterval::float::F64Enclosure>::expanded+0x9c>
   1c506:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1c50d:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1c511:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1c515:	e9 42 ff ff ff       	jmp    1c45c <<hyperinterval::float::F64Enclosure>::expanded+0x9c>
   1c51a:	cc                   	int3
   1c51b:	cc                   	int3
   1c51c:	cc                   	int3
   1c51d:	cc                   	int3
   1c51e:	cc                   	int3
   1c51f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::overlaps:
   1c520:	31 c0                	xor    %eax,%eax
   1c522:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1c526:	0f 84 8c 00 00 00    	je     1c5b8 <<hyperinterval::float::F64Enclosure>::overlaps+0x98>
   1c52c:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1c530:	0f 84 82 00 00 00    	je     1c5b8 <<hyperinterval::float::F64Enclosure>::overlaps+0x98>
   1c536:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1c53d:	00 00 80 
   1c540:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1c544:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1c548:	4c 8d 0c 02          	lea    (%rdx,%rax,1),%r9
   1c54c:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1c550:	49 89 d2             	mov    %rdx,%r10
   1c553:	49 21 ca             	and    %rcx,%r10
   1c556:	49 89 c3             	mov    %rax,%r11
   1c559:	4d 29 d3             	sub    %r10,%r11
   1c55c:	48 85 d2             	test   %rdx,%rdx
   1c55f:	4d 0f 49 d9          	cmovns %r9,%r11
   1c563:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
   1c567:	4d 89 c1             	mov    %r8,%r9
   1c56a:	49 21 c9             	and    %rcx,%r9
   1c56d:	49 89 c2             	mov    %rax,%r10
   1c570:	4d 29 ca             	sub    %r9,%r10
   1c573:	4d 85 c0             	test   %r8,%r8
   1c576:	4c 0f 49 d2          	cmovns %rdx,%r10
   1c57a:	4d 39 d3             	cmp    %r10,%r11
   1c57d:	73 03                	jae    1c582 <<hyperinterval::float::F64Enclosure>::overlaps+0x62>
   1c57f:	31 c0                	xor    %eax,%eax
   1c581:	c3                   	ret
   1c582:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1c586:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1c58a:	48 8d 3c 06          	lea    (%rsi,%rax,1),%rdi
   1c58e:	49 89 f0             	mov    %rsi,%r8
   1c591:	49 21 c8             	and    %rcx,%r8
   1c594:	49 89 c1             	mov    %rax,%r9
   1c597:	4d 29 c1             	sub    %r8,%r9
   1c59a:	48 85 f6             	test   %rsi,%rsi
   1c59d:	4c 0f 49 cf          	cmovns %rdi,%r9
   1c5a1:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
   1c5a5:	48 21 d1             	and    %rdx,%rcx
   1c5a8:	48 29 c8             	sub    %rcx,%rax
   1c5ab:	48 85 d2             	test   %rdx,%rdx
   1c5ae:	48 0f 49 c6          	cmovns %rsi,%rax
   1c5b2:	49 39 c1             	cmp    %rax,%r9
   1c5b5:	0f 93 c0             	setae  %al
   1c5b8:	c3                   	ret
   1c5b9:	cc                   	int3
   1c5ba:	cc                   	int3
   1c5bb:	cc                   	int3
   1c5bc:	cc                   	int3
   1c5bd:	cc                   	int3
   1c5be:	cc                   	int3
   1c5bf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::from_bits:
   1c5c0:	41 57                	push   %r15
   1c5c2:	41 56                	push   %r14
   1c5c4:	41 55                	push   %r13
   1c5c6:	41 54                	push   %r12
   1c5c8:	53                   	push   %rbx
   1c5c9:	48 83 ec 10          	sub    $0x10,%rsp
   1c5cd:	49 89 d7             	mov    %rdx,%r15
   1c5d0:	48 89 f1             	mov    %rsi,%rcx
   1c5d3:	48 89 fb             	mov    %rdi,%rbx
   1c5d6:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1c5dd:	00 00 80 
   1c5e0:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1c5e7:	00 f0 7f 
   1c5ea:	48 89 e7             	mov    %rsp,%rdi
   1c5ed:	4c 89 f6             	mov    %r14,%rsi
   1c5f0:	4c 89 e2             	mov    %r12,%rdx
   1c5f3:	e8 58 03 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1c5f8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c5fc:	74 1c                	je     1c61a <<hyperinterval::float::F64Enclosure>::from_bits+0x5a>
   1c5fe:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1c603:	48 89 e7             	mov    %rsp,%rdi
   1c606:	4c 89 f6             	mov    %r14,%rsi
   1c609:	4c 89 e2             	mov    %r12,%rdx
   1c60c:	4c 89 f9             	mov    %r15,%rcx
   1c60f:	e8 3c 03 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1c614:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c618:	75 1d                	jne    1c637 <<hyperinterval::float::F64Enclosure>::from_bits+0x77>
   1c61a:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1c61f:	88 43 08             	mov    %al,0x8(%rbx)
   1c622:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c629:	48 83 c4 10          	add    $0x10,%rsp
   1c62d:	5b                   	pop    %rbx
   1c62e:	41 5c                	pop    %r12
   1c630:	41 5d                	pop    %r13
   1c632:	41 5e                	pop    %r14
   1c634:	41 5f                	pop    %r15
   1c636:	c3                   	ret
   1c637:	4b 8d 04 2e          	lea    (%r14,%r13,1),%rax
   1c63b:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1c63f:	4c 89 ea             	mov    %r13,%rdx
   1c642:	48 21 ca             	and    %rcx,%rdx
   1c645:	4c 89 f6             	mov    %r14,%rsi
   1c648:	48 29 d6             	sub    %rdx,%rsi
   1c64b:	4d 85 ed             	test   %r13,%r13
   1c64e:	48 0f 49 f0          	cmovns %rax,%rsi
   1c652:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c657:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1c65b:	48 21 c1             	and    %rax,%rcx
   1c65e:	49 29 ce             	sub    %rcx,%r14
   1c661:	48 85 c0             	test   %rax,%rax
   1c664:	4c 0f 49 f2          	cmovns %rdx,%r14
   1c668:	4c 39 f6             	cmp    %r14,%rsi
   1c66b:	76 06                	jbe    1c673 <<hyperinterval::float::F64Enclosure>::from_bits+0xb3>
   1c66d:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1c671:	eb af                	jmp    1c622 <<hyperinterval::float::F64Enclosure>::from_bits+0x62>
   1c673:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1c67a:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1c67e:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1c682:	eb a5                	jmp    1c629 <<hyperinterval::float::F64Enclosure>::from_bits+0x69>
   1c684:	cc                   	int3
   1c685:	cc                   	int3
   1c686:	cc                   	int3
   1c687:	cc                   	int3
   1c688:	cc                   	int3
   1c689:	cc                   	int3
   1c68a:	cc                   	int3
   1c68b:	cc                   	int3
   1c68c:	cc                   	int3
   1c68d:	cc                   	int3
   1c68e:	cc                   	int3
   1c68f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::max_image:
   1c690:	48 89 f8             	mov    %rdi,%rax
   1c693:	45 31 c0             	xor    %r8d,%r8d
   1c696:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1c69a:	0f 85 a3 00 00 00    	jne    1c743 <<hyperinterval::float::F64Enclosure>::max_image+0xb3>
   1c6a0:	f6 02 01             	testb  $0x1,(%rdx)
   1c6a3:	0f 84 8e 00 00 00    	je     1c737 <<hyperinterval::float::F64Enclosure>::max_image+0xa7>
   1c6a9:	41 56                	push   %r14
   1c6ab:	53                   	push   %rbx
   1c6ac:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
   1c6b0:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1c6b4:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
   1c6b8:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
   1c6bc:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1c6c3:	00 00 80 
   1c6c6:	4c 8d 14 37          	lea    (%rdi,%rsi,1),%r10
   1c6ca:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   1c6ce:	49 89 fb             	mov    %rdi,%r11
   1c6d1:	4d 21 c3             	and    %r8,%r11
   1c6d4:	48 89 f3             	mov    %rsi,%rbx
   1c6d7:	4c 29 db             	sub    %r11,%rbx
   1c6da:	48 85 ff             	test   %rdi,%rdi
   1c6dd:	49 0f 49 da          	cmovns %r10,%rbx
   1c6e1:	4d 8d 14 31          	lea    (%r9,%rsi,1),%r10
   1c6e5:	4d 89 cb             	mov    %r9,%r11
   1c6e8:	4d 21 c3             	and    %r8,%r11
   1c6eb:	49 89 f6             	mov    %rsi,%r14
   1c6ee:	4d 29 de             	sub    %r11,%r14
   1c6f1:	4d 85 c9             	test   %r9,%r9
   1c6f4:	4d 0f 49 f2          	cmovns %r10,%r14
   1c6f8:	4c 39 f3             	cmp    %r14,%rbx
   1c6fb:	49 0f 42 f9          	cmovb  %r9,%rdi
   1c6ff:	4c 8d 0c 31          	lea    (%rcx,%rsi,1),%r9
   1c703:	49 89 ca             	mov    %rcx,%r10
   1c706:	4d 21 c2             	and    %r8,%r10
   1c709:	49 89 f3             	mov    %rsi,%r11
   1c70c:	4d 29 d3             	sub    %r10,%r11
   1c70f:	48 85 c9             	test   %rcx,%rcx
   1c712:	4d 0f 49 d9          	cmovns %r9,%r11
   1c716:	4c 8d 0c 32          	lea    (%rdx,%rsi,1),%r9
   1c71a:	49 21 d0             	and    %rdx,%r8
   1c71d:	4c 29 c6             	sub    %r8,%rsi
   1c720:	48 85 d2             	test   %rdx,%rdx
   1c723:	49 0f 49 f1          	cmovns %r9,%rsi
   1c727:	49 39 f3             	cmp    %rsi,%r11
   1c72a:	48 0f 42 ca          	cmovb  %rdx,%rcx
   1c72e:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1c734:	5b                   	pop    %rbx
   1c735:	41 5e                	pop    %r14
   1c737:	4c 89 00             	mov    %r8,(%rax)
   1c73a:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1c73e:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1c742:	c3                   	ret
   1c743:	4c 89 00             	mov    %r8,(%rax)
   1c746:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1c74a:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1c74e:	c3                   	ret
   1c74f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::min_image:
   1c750:	48 89 f8             	mov    %rdi,%rax
   1c753:	45 31 c0             	xor    %r8d,%r8d
   1c756:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1c75a:	0f 85 a3 00 00 00    	jne    1c803 <<hyperinterval::float::F64Enclosure>::min_image+0xb3>
   1c760:	f6 02 01             	testb  $0x1,(%rdx)
   1c763:	0f 84 8e 00 00 00    	je     1c7f7 <<hyperinterval::float::F64Enclosure>::min_image+0xa7>
   1c769:	41 56                	push   %r14
   1c76b:	53                   	push   %rbx
   1c76c:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
   1c770:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
   1c774:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
   1c778:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1c77f:	00 00 80 
   1c782:	4c 8d 14 37          	lea    (%rdi,%rsi,1),%r10
   1c786:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   1c78a:	49 89 fb             	mov    %rdi,%r11
   1c78d:	4d 21 c3             	and    %r8,%r11
   1c790:	48 89 f3             	mov    %rsi,%rbx
   1c793:	4c 29 db             	sub    %r11,%rbx
   1c796:	48 85 ff             	test   %rdi,%rdi
   1c799:	49 0f 49 da          	cmovns %r10,%rbx
   1c79d:	4d 8d 14 31          	lea    (%r9,%rsi,1),%r10
   1c7a1:	4d 89 cb             	mov    %r9,%r11
   1c7a4:	4d 21 c3             	and    %r8,%r11
   1c7a7:	49 89 f6             	mov    %rsi,%r14
   1c7aa:	4d 29 de             	sub    %r11,%r14
   1c7ad:	4d 85 c9             	test   %r9,%r9
   1c7b0:	4d 0f 49 f2          	cmovns %r10,%r14
   1c7b4:	4c 39 f3             	cmp    %r14,%rbx
   1c7b7:	49 0f 47 f9          	cmova  %r9,%rdi
   1c7bb:	4c 8d 0c 31          	lea    (%rcx,%rsi,1),%r9
   1c7bf:	49 89 ca             	mov    %rcx,%r10
   1c7c2:	4d 21 c2             	and    %r8,%r10
   1c7c5:	49 89 f3             	mov    %rsi,%r11
   1c7c8:	4d 29 d3             	sub    %r10,%r11
   1c7cb:	48 85 c9             	test   %rcx,%rcx
   1c7ce:	4d 0f 49 d9          	cmovns %r9,%r11
   1c7d2:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1c7d6:	4c 8d 0c 32          	lea    (%rdx,%rsi,1),%r9
   1c7da:	49 21 d0             	and    %rdx,%r8
   1c7dd:	4c 29 c6             	sub    %r8,%rsi
   1c7e0:	48 85 d2             	test   %rdx,%rdx
   1c7e3:	49 0f 49 f1          	cmovns %r9,%rsi
   1c7e7:	49 39 f3             	cmp    %rsi,%r11
   1c7ea:	48 0f 47 ca          	cmova  %rdx,%rcx
   1c7ee:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1c7f4:	5b                   	pop    %rbx
   1c7f5:	41 5e                	pop    %r14
   1c7f7:	4c 89 00             	mov    %r8,(%rax)
   1c7fa:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1c7fe:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1c802:	c3                   	ret
   1c803:	4c 89 00             	mov    %r8,(%rax)
   1c806:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1c80a:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1c80e:	c3                   	ret
   1c80f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::next_down:
   1c810:	41 57                	push   %r15
   1c812:	41 56                	push   %r14
   1c814:	53                   	push   %rbx
   1c815:	48 83 ec 10          	sub    $0x10,%rsp
   1c819:	48 89 fb             	mov    %rdi,%rbx
   1c81c:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1c823:	00 00 80 
   1c826:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1c82d:	00 f0 7f 
   1c830:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1c835:	48 89 e7             	mov    %rsp,%rdi
   1c838:	4c 89 f6             	mov    %r14,%rsi
   1c83b:	4c 89 fa             	mov    %r15,%rdx
   1c83e:	e8 0d 01 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1c843:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c847:	75 0c                	jne    1c855 <<hyperinterval::float::F64Enclosure>::next_down+0x45>
   1c849:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1c84e:	88 43 01             	mov    %al,0x1(%rbx)
   1c851:	b0 01                	mov    $0x1,%al
   1c853:	eb 51                	jmp    1c8a6 <<hyperinterval::float::F64Enclosure>::next_down+0x96>
   1c855:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c85a:	48 89 c2             	mov    %rax,%rdx
   1c85d:	4c 31 f2             	xor    %r14,%rdx
   1c860:	48 85 c0             	test   %rax,%rax
   1c863:	48 0f 44 d0          	cmove  %rax,%rdx
   1c867:	48 89 d1             	mov    %rdx,%rcx
   1c86a:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1c86e:	48 83 c9 01          	or     $0x1,%rcx
   1c872:	48 01 d1             	add    %rdx,%rcx
   1c875:	48 89 e7             	mov    %rsp,%rdi
   1c878:	4c 89 f6             	mov    %r14,%rsi
   1c87b:	4c 89 fa             	mov    %r15,%rdx
   1c87e:	e8 cd 00 00 00       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1c883:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c887:	75 08                	jne    1c891 <<hyperinterval::float::F64Enclosure>::next_down+0x81>
   1c889:	c6 43 01 05          	movb   $0x5,0x1(%rbx)
   1c88d:	b0 01                	mov    $0x1,%al
   1c88f:	eb 15                	jmp    1c8a6 <<hyperinterval::float::F64Enclosure>::next_down+0x96>
   1c891:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c896:	49 31 c6             	xor    %rax,%r14
   1c899:	48 85 c0             	test   %rax,%rax
   1c89c:	4c 0f 44 f0          	cmove  %rax,%r14
   1c8a0:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1c8a4:	31 c0                	xor    %eax,%eax
   1c8a6:	88 03                	mov    %al,(%rbx)
   1c8a8:	48 89 d8             	mov    %rbx,%rax
   1c8ab:	48 83 c4 10          	add    $0x10,%rsp
   1c8af:	5b                   	pop    %rbx
   1c8b0:	41 5e                	pop    %r14
   1c8b2:	41 5f                	pop    %r15
   1c8b4:	c3                   	ret
   1c8b5:	cc                   	int3
   1c8b6:	cc                   	int3
   1c8b7:	cc                   	int3
   1c8b8:	cc                   	int3
   1c8b9:	cc                   	int3
   1c8ba:	cc                   	int3
   1c8bb:	cc                   	int3
   1c8bc:	cc                   	int3
   1c8bd:	cc                   	int3
   1c8be:	cc                   	int3
   1c8bf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::subset_of:
   1c8c0:	b0 01                	mov    $0x1,%al
   1c8c2:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1c8c6:	75 50                	jne    1c918 <<hyperinterval::float::F64Enclosure>::subset_of+0x58>
   1c8c8:	f6 06 01             	testb  $0x1,(%rsi)
   1c8cb:	74 49                	je     1c916 <<hyperinterval::float::F64Enclosure>::subset_of+0x56>
   1c8cd:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1c8d1:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1c8d5:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1c8dc:	00 00 80 
   1c8df:	4d 8d 0c 00          	lea    (%r8,%rax,1),%r9
   1c8e3:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1c8e7:	4d 89 c2             	mov    %r8,%r10
   1c8ea:	49 21 ca             	and    %rcx,%r10
   1c8ed:	49 89 c3             	mov    %rax,%r11
   1c8f0:	4d 29 d3             	sub    %r10,%r11
   1c8f3:	4d 85 c0             	test   %r8,%r8
   1c8f6:	4d 0f 49 d9          	cmovns %r9,%r11
   1c8fa:	4c 8d 04 02          	lea    (%rdx,%rax,1),%r8
   1c8fe:	49 89 d1             	mov    %rdx,%r9
   1c901:	49 21 c9             	and    %rcx,%r9
   1c904:	49 89 c2             	mov    %rax,%r10
   1c907:	4d 29 ca             	sub    %r9,%r10
   1c90a:	48 85 d2             	test   %rdx,%rdx
   1c90d:	4d 0f 49 d0          	cmovns %r8,%r10
   1c911:	4d 39 d3             	cmp    %r10,%r11
   1c914:	76 03                	jbe    1c919 <<hyperinterval::float::F64Enclosure>::subset_of+0x59>
   1c916:	31 c0                	xor    %eax,%eax
   1c918:	c3                   	ret
   1c919:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1c91d:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1c921:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1c925:	49 89 d0             	mov    %rdx,%r8
   1c928:	49 21 c8             	and    %rcx,%r8
   1c92b:	49 89 c1             	mov    %rax,%r9
   1c92e:	4d 29 c1             	sub    %r8,%r9
   1c931:	48 85 d2             	test   %rdx,%rdx
   1c934:	4c 0f 49 cf          	cmovns %rdi,%r9
   1c938:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1c93c:	48 21 f1             	and    %rsi,%rcx
   1c93f:	48 29 c8             	sub    %rcx,%rax
   1c942:	48 85 f6             	test   %rsi,%rsi
   1c945:	48 0f 49 c2          	cmovns %rdx,%rax
   1c949:	49 39 c1             	cmp    %rax,%r9
   1c94c:	0f 96 c0             	setbe  %al
   1c94f:	c3                   	ret

<hyperinterval::ieee::Format>::finite:
   1c950:	48 89 f8             	mov    %rdi,%rax
   1c953:	48 89 cf             	mov    %rcx,%rdi
   1c956:	48 f7 d7             	not    %rdi
   1c959:	48 85 d7             	test   %rdx,%rdi
   1c95c:	75 09                	jne    1c967 <<hyperinterval::ieee::Format>::finite+0x17>
   1c95e:	c6 40 01 00          	movb   $0x0,0x1(%rax)
   1c962:	b1 01                	mov    $0x1,%cl
   1c964:	88 08                	mov    %cl,(%rax)
   1c966:	c3                   	ret
   1c967:	48 ff ce             	dec    %rsi
   1c96a:	48 85 f1             	test   %rsi,%rcx
   1c96d:	74 09                	je     1c978 <<hyperinterval::ieee::Format>::finite+0x28>
   1c96f:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1c973:	31 c9                	xor    %ecx,%ecx
   1c975:	88 08                	mov    %cl,(%rax)
   1c977:	c3                   	ret
   1c978:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
   1c97f:	00 
   1c980:	31 c9                	xor    %ecx,%ecx
   1c982:	88 08                	mov    %cl,(%rax)
   1c984:	c3                   	ret
   1c985:	cc                   	int3
   1c986:	cc                   	int3
   1c987:	cc                   	int3
   1c988:	cc                   	int3
   1c989:	cc                   	int3
   1c98a:	cc                   	int3
   1c98b:	cc                   	int3
   1c98c:	cc                   	int3
   1c98d:	cc                   	int3
   1c98e:	cc                   	int3
   1c98f:	cc                   	int3

<hyperinterval::ieee::Format>::add:
   1c990:	55                   	push   %rbp
   1c991:	41 57                	push   %r15
   1c993:	41 56                	push   %r14
   1c995:	41 55                	push   %r13
   1c997:	41 54                	push   %r12
   1c999:	53                   	push   %rbx
   1c99a:	48 83 ec 38          	sub    $0x38,%rsp
   1c99e:	48 89 fb             	mov    %rdi,%rbx
   1c9a1:	48 85 c9             	test   %rcx,%rcx
   1c9a4:	0f 84 63 01 00 00    	je     1cb0d <<hyperinterval::ieee::Format>::add+0x17d>
   1c9aa:	48 89 c8             	mov    %rcx,%rax
   1c9ad:	4d 85 c0             	test   %r8,%r8
   1c9b0:	0f 84 61 01 00 00    	je     1cb17 <<hyperinterval::ieee::Format>::add+0x187>
   1c9b6:	41 b9 40 00 00 00    	mov    $0x40,%r9d
   1c9bc:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
   1c9c1:	49 89 c2             	mov    %rax,%r10
   1c9c4:	49 21 d2             	and    %rdx,%r10
   1c9c7:	44 89 c9             	mov    %r9d,%ecx
   1c9ca:	49 d3 ea             	shr    %cl,%r10
   1c9cd:	41 bb 01 00 00 00    	mov    $0x1,%r11d
   1c9d3:	49 d3 e3             	shl    %cl,%r11
   1c9d6:	4d 8d 63 ff          	lea    -0x1(%r11),%r12
   1c9da:	4d 89 e7             	mov    %r12,%r15
   1c9dd:	49 21 c7             	and    %rax,%r15
   1c9e0:	4d 85 d2             	test   %r10,%r10
   1c9e3:	bf 01 00 00 00       	mov    $0x1,%edi
   1c9e8:	44 89 d5             	mov    %r10d,%ebp
   1c9eb:	0f 44 ef             	cmove  %edi,%ebp
   1c9ee:	4d 0f 45 d3          	cmovne %r11,%r10
   1c9f2:	49 89 d6             	mov    %rdx,%r14
   1c9f5:	49 d3 ee             	shr    %cl,%r14
   1c9f8:	4d 09 fa             	or     %r15,%r10
   1c9fb:	49 d1 ee             	shr    $1,%r14
   1c9fe:	45 01 ce             	add    %r9d,%r14d
   1ca01:	48 85 f0             	test   %rsi,%rax
   1ca04:	0f 95 44 24 0f       	setne  0xf(%rsp)
   1ca09:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1ca0e:	49 0f bd ca          	bsr    %r10,%rcx
   1ca12:	83 f1 3f             	xor    $0x3f,%ecx
   1ca15:	44 01 c9             	add    %r9d,%ecx
   1ca18:	83 c1 c1             	add    $0xffffffc1,%ecx
   1ca1b:	45 31 ed             	xor    %r13d,%r13d
   1ca1e:	4d 0f a5 d5          	shld   %cl,%r10,%r13
   1ca22:	45 31 ff             	xor    %r15d,%r15d
   1ca25:	49 d3 e2             	shl    %cl,%r10
   1ca28:	f6 c1 40             	test   $0x40,%cl
   1ca2b:	4d 0f 45 ea          	cmovne %r10,%r13
   1ca2f:	4d 0f 45 d7          	cmovne %r15,%r10
   1ca33:	44 01 f1             	add    %r14d,%ecx
   1ca36:	29 cd                	sub    %ecx,%ebp
   1ca38:	4d 89 c7             	mov    %r8,%r15
   1ca3b:	49 21 d7             	and    %rdx,%r15
   1ca3e:	44 89 c9             	mov    %r9d,%ecx
   1ca41:	49 d3 ef             	shr    %cl,%r15
   1ca44:	4d 21 c4             	and    %r8,%r12
   1ca47:	4d 85 ff             	test   %r15,%r15
   1ca4a:	41 0f 45 ff          	cmovne %r15d,%edi
   1ca4e:	4d 0f 45 fb          	cmovne %r11,%r15
   1ca52:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1ca57:	4d 09 e7             	or     %r12,%r15
   1ca5a:	49 85 f0             	test   %rsi,%r8
   1ca5d:	41 0f 95 c3          	setne  %r11b
   1ca61:	49 0f bd cf          	bsr    %r15,%rcx
   1ca65:	83 f1 3f             	xor    $0x3f,%ecx
   1ca68:	44 01 c9             	add    %r9d,%ecx
   1ca6b:	83 c1 c1             	add    $0xffffffc1,%ecx
   1ca6e:	45 31 c9             	xor    %r9d,%r9d
   1ca71:	4d 0f a5 f9          	shld   %cl,%r15,%r9
   1ca75:	49 d3 e7             	shl    %cl,%r15
   1ca78:	f6 c1 40             	test   $0x40,%cl
   1ca7b:	4d 0f 45 cf          	cmovne %r15,%r9
   1ca7f:	41 bc 00 00 00 00    	mov    $0x0,%r12d
   1ca85:	4d 0f 45 fc          	cmovne %r12,%r15
   1ca89:	41 01 ce             	add    %ecx,%r14d
   1ca8c:	44 29 f7             	sub    %r14d,%edi
   1ca8f:	39 fd                	cmp    %edi,%ebp
   1ca91:	0f 8d 90 00 00 00    	jge    1cb27 <<hyperinterval::ieee::Format>::add+0x197>
   1ca97:	44 88 5c 24 0e       	mov    %r11b,0xe(%rsp)
   1ca9c:	41 89 ee             	mov    %ebp,%r14d
   1ca9f:	44 0f b6 5c 24 0f    	movzbl 0xf(%rsp),%r11d
   1caa5:	4d 89 d4             	mov    %r10,%r12
   1caa8:	4c 89 ed             	mov    %r13,%rbp
   1caab:	4d 89 c5             	mov    %r8,%r13
   1caae:	44 29 f7             	sub    %r14d,%edi
   1cab1:	83 ff 4a             	cmp    $0x4a,%edi
   1cab4:	0f 8f ab 00 00 00    	jg     1cb65 <<hyperinterval::ieee::Format>::add+0x1d5>
   1caba:	49 85 f0             	test   %rsi,%r8
   1cabd:	41 0f 95 c0          	setne  %r8b
   1cac1:	48 85 f0             	test   %rsi,%rax
   1cac4:	41 0f 95 c2          	setne  %r10b
   1cac8:	89 f9                	mov    %edi,%ecx
   1caca:	4d 0f a5 f9          	shld   %cl,%r15,%r9
   1cace:	49 d3 e7             	shl    %cl,%r15
   1cad1:	31 c0                	xor    %eax,%eax
   1cad3:	40 f6 c7 40          	test   $0x40,%dil
   1cad7:	4d 0f 45 cf          	cmovne %r15,%r9
   1cadb:	49 0f 44 c7          	cmove  %r15,%rax
   1cadf:	45 30 c2             	xor    %r8b,%r10b
   1cae2:	0f 84 ce 00 00 00    	je     1cbb6 <<hyperinterval::ieee::Format>::add+0x226>
   1cae8:	4c 39 e0             	cmp    %r12,%rax
   1caeb:	4c 89 c9             	mov    %r9,%rcx
   1caee:	48 19 e9             	sbb    %rbp,%rcx
   1caf1:	0f 83 f5 00 00 00    	jae    1cbec <<hyperinterval::ieee::Format>::add+0x25c>
   1caf7:	49 29 c4             	sub    %rax,%r12
   1cafa:	4c 19 cd             	sbb    %r9,%rbp
   1cafd:	44 88 5c 24 0e       	mov    %r11b,0xe(%rsp)
   1cb02:	4c 89 e0             	mov    %r12,%rax
   1cb05:	49 89 e9             	mov    %rbp,%r9
   1cb08:	e9 e5 00 00 00       	jmp    1cbf2 <<hyperinterval::ieee::Format>::add+0x262>
   1cb0d:	4c 89 43 08          	mov    %r8,0x8(%rbx)
   1cb11:	4c 89 43 10          	mov    %r8,0x10(%rbx)
   1cb15:	eb 08                	jmp    1cb1f <<hyperinterval::ieee::Format>::add+0x18f>
   1cb17:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1cb1b:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1cb1f:	c6 03 00             	movb   $0x0,(%rbx)
   1cb22:	e9 f0 00 00 00       	jmp    1cc17 <<hyperinterval::ieee::Format>::add+0x287>
   1cb27:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1cb2c:	48 89 d6             	mov    %rdx,%rsi
   1cb2f:	89 fa                	mov    %edi,%edx
   1cb31:	4d 89 fc             	mov    %r15,%r12
   1cb34:	4d 89 ce             	mov    %r9,%r14
   1cb37:	4d 89 e9             	mov    %r13,%r9
   1cb3a:	4d 89 d7             	mov    %r10,%r15
   1cb3d:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
   1cb42:	88 4c 24 0e          	mov    %cl,0xe(%rsp)
   1cb46:	89 ef                	mov    %ebp,%edi
   1cb48:	4c 89 f5             	mov    %r14,%rbp
   1cb4b:	41 89 d6             	mov    %edx,%r14d
   1cb4e:	48 89 f2             	mov    %rsi,%rdx
   1cb51:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   1cb56:	49 89 c5             	mov    %rax,%r13
   1cb59:	44 29 f7             	sub    %r14d,%edi
   1cb5c:	83 ff 4a             	cmp    $0x4a,%edi
   1cb5f:	0f 8e 55 ff ff ff    	jle    1caba <<hyperinterval::ieee::Format>::add+0x12a>
   1cb65:	4c 89 e8             	mov    %r13,%rax
   1cb68:	45 84 db             	test   %r11b,%r11b
   1cb6b:	74 51                	je     1cbbe <<hyperinterval::ieee::Format>::add+0x22e>
   1cb6d:	48 31 f0             	xor    %rsi,%rax
   1cb70:	48 89 c1             	mov    %rax,%rcx
   1cb73:	48 21 f1             	and    %rsi,%rcx
   1cb76:	31 ff                	xor    %edi,%edi
   1cb78:	48 f7 d9             	neg    %rcx
   1cb7b:	40 0f 93 c7          	setae  %dil
   1cb7f:	48 8d 0c 78          	lea    (%rax,%rdi,2),%rcx
   1cb83:	48 ff c9             	dec    %rcx
   1cb86:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1cb8b:	49 89 f6             	mov    %rsi,%r14
   1cb8e:	e8 bd fd ff ff       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1cb93:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1cb98:	75 4b                	jne    1cbe5 <<hyperinterval::ieee::Format>::add+0x255>
   1cb9a:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1cb9f:	49 31 c6             	xor    %rax,%r14
   1cba2:	48 85 c0             	test   %rax,%rax
   1cba5:	4c 0f 44 f0          	cmove  %rax,%r14
   1cba9:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1cbad:	4c 89 6b 10          	mov    %r13,0x10(%rbx)
   1cbb1:	e9 69 ff ff ff       	jmp    1cb1f <<hyperinterval::ieee::Format>::add+0x18f>
   1cbb6:	4c 01 e0             	add    %r12,%rax
   1cbb9:	49 11 e9             	adc    %rbp,%r9
   1cbbc:	eb 34                	jmp    1cbf2 <<hyperinterval::ieee::Format>::add+0x262>
   1cbbe:	48 21 f0             	and    %rsi,%rax
   1cbc1:	31 c9                	xor    %ecx,%ecx
   1cbc3:	48 f7 d8             	neg    %rax
   1cbc6:	0f 93 c1             	setae  %cl
   1cbc9:	48 8d 0c 4d ff ff ff 	lea    -0x1(,%rcx,2),%rcx
   1cbd0:	ff 
   1cbd1:	4c 01 e9             	add    %r13,%rcx
   1cbd4:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1cbd9:	e8 72 fd ff ff       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1cbde:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1cbe3:	74 44                	je     1cc29 <<hyperinterval::ieee::Format>::add+0x299>
   1cbe5:	66 c7 03 01 05       	movw   $0x501,(%rbx)
   1cbea:	eb 2b                	jmp    1cc17 <<hyperinterval::ieee::Format>::add+0x287>
   1cbec:	4c 29 e0             	sub    %r12,%rax
   1cbef:	49 19 e9             	sbb    %rbp,%r9
   1cbf2:	0f b6 4c 24 0e       	movzbl 0xe(%rsp),%ecx
   1cbf7:	88 4c 24 24          	mov    %cl,0x24(%rsp)
   1cbfb:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1cc00:	4c 89 4c 24 18       	mov    %r9,0x18(%rsp)
   1cc05:	44 89 74 24 20       	mov    %r14d,0x20(%rsp)
   1cc0a:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1cc0f:	48 89 df             	mov    %rbx,%rdi
   1cc12:	e8 49 10 00 00       	call   1dc60 <<hyperinterval::ieee::Format>::rounded>
   1cc17:	48 89 d8             	mov    %rbx,%rax
   1cc1a:	48 83 c4 38          	add    $0x38,%rsp
   1cc1e:	5b                   	pop    %rbx
   1cc1f:	41 5c                	pop    %r12
   1cc21:	41 5d                	pop    %r13
   1cc23:	41 5e                	pop    %r14
   1cc25:	41 5f                	pop    %r15
   1cc27:	5d                   	pop    %rbp
   1cc28:	c3                   	ret
   1cc29:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1cc2e:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1cc32:	e9 e4 fe ff ff       	jmp    1cb1b <<hyperinterval::ieee::Format>::add+0x18b>
   1cc37:	cc                   	int3
   1cc38:	cc                   	int3
   1cc39:	cc                   	int3
   1cc3a:	cc                   	int3
   1cc3b:	cc                   	int3
   1cc3c:	cc                   	int3
   1cc3d:	cc                   	int3
   1cc3e:	cc                   	int3
   1cc3f:	cc                   	int3

<hyperinterval::ieee::Format>::div:
   1cc40:	55                   	push   %rbp
   1cc41:	41 57                	push   %r15
   1cc43:	41 56                	push   %r14
   1cc45:	41 55                	push   %r13
   1cc47:	41 54                	push   %r12
   1cc49:	53                   	push   %rbx
   1cc4a:	48 83 ec 48          	sub    $0x48,%rsp
   1cc4e:	4d 85 c0             	test   %r8,%r8
   1cc51:	0f 84 cb 00 00 00    	je     1cd22 <<hyperinterval::ieee::Format>::div+0xe2>
   1cc57:	48 85 c9             	test   %rcx,%rcx
   1cc5a:	0f 84 cc 00 00 00    	je     1cd2c <<hyperinterval::ieee::Format>::div+0xec>
   1cc60:	41 be 40 00 00 00    	mov    $0x40,%r14d
   1cc66:	f3 4c 0f bc f2       	tzcnt  %rdx,%r14
   1cc6b:	49 89 cd             	mov    %rcx,%r13
   1cc6e:	49 21 d5             	and    %rdx,%r13
   1cc71:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
   1cc76:	41 83 e6 3f          	and    $0x3f,%r14d
   1cc7a:	48 89 c8             	mov    %rcx,%rax
   1cc7d:	44 89 f1             	mov    %r14d,%ecx
   1cc80:	49 d3 ed             	shr    %cl,%r13
   1cc83:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1cc89:	49 d3 e2             	shl    %cl,%r10
   1cc8c:	4d 8d 5a ff          	lea    -0x1(%r10),%r11
   1cc90:	4c 89 db             	mov    %r11,%rbx
   1cc93:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1cc98:	48 21 c3             	and    %rax,%rbx
   1cc9b:	4d 85 ed             	test   %r13,%r13
   1cc9e:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1cca4:	44 89 e8             	mov    %r13d,%eax
   1cca7:	41 0f 44 c1          	cmove  %r9d,%eax
   1ccab:	4d 0f 45 ea          	cmovne %r10,%r13
   1ccaf:	4c 89 c5             	mov    %r8,%rbp
   1ccb2:	48 21 d5             	and    %rdx,%rbp
   1ccb5:	48 d3 ea             	shr    %cl,%rdx
   1ccb8:	48 d3 ed             	shr    %cl,%rbp
   1ccbb:	49 09 dd             	or     %rbx,%r13
   1ccbe:	48 d1 ea             	shr    $1,%rdx
   1ccc1:	4d 21 c3             	and    %r8,%r11
   1ccc4:	48 85 ed             	test   %rbp,%rbp
   1ccc7:	44 0f 45 cd          	cmovne %ebp,%r9d
   1cccb:	49 0f 45 ea          	cmovne %r10,%rbp
   1cccf:	4c 09 dd             	or     %r11,%rbp
   1ccd2:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1ccd7:	41 ba 7f 00 00 00    	mov    $0x7f,%r10d
   1ccdd:	4c 0f bd d5          	bsr    %rbp,%r10
   1cce1:	41 83 f2 3f          	xor    $0x3f,%r10d
   1cce5:	41 83 c2 40          	add    $0x40,%r10d
   1cce9:	49 0f bd cd          	bsr    %r13,%rcx
   1cced:	83 f1 3f             	xor    $0x3f,%ecx
   1ccf0:	45 89 d7             	mov    %r10d,%r15d
   1ccf3:	41 29 cf             	sub    %ecx,%r15d
   1ccf6:	41 83 c7 c0          	add    $0xffffffc0,%r15d
   1ccfa:	78 3f                	js     1cd3b <<hyperinterval::ieee::Format>::div+0xfb>
   1ccfc:	45 31 db             	xor    %r11d,%r11d
   1ccff:	44 89 f9             	mov    %r15d,%ecx
   1cd02:	49 0f a5 eb          	shld   %cl,%rbp,%r11
   1cd06:	31 db                	xor    %ebx,%ebx
   1cd08:	49 89 ec             	mov    %rbp,%r12
   1cd0b:	49 d3 e4             	shl    %cl,%r12
   1cd0e:	41 f6 c7 40          	test   $0x40,%r15b
   1cd12:	4d 0f 45 dc          	cmovne %r12,%r11
   1cd16:	4c 0f 45 e3          	cmovne %rbx,%r12
   1cd1a:	4d 39 e5             	cmp    %r12,%r13
   1cd1d:	4c 19 db             	sbb    %r11,%rbx
   1cd20:	eb 3f                	jmp    1cd61 <<hyperinterval::ieee::Format>::div+0x121>
   1cd22:	66 c7 07 01 06       	movw   $0x601,(%rdi)
   1cd27:	e9 24 03 00 00       	jmp    1d050 <<hyperinterval::ieee::Format>::div+0x410>
   1cd2c:	c6 07 00             	movb   $0x0,(%rdi)
   1cd2f:	0f 57 c0             	xorps  %xmm0,%xmm0
   1cd32:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1cd36:	e9 15 03 00 00       	jmp    1d050 <<hyperinterval::ieee::Format>::div+0x410>
   1cd3b:	44 89 f9             	mov    %r15d,%ecx
   1cd3e:	f6 d9                	neg    %cl
   1cd40:	45 31 db             	xor    %r11d,%r11d
   1cd43:	4d 0f a5 eb          	shld   %cl,%r13,%r11
   1cd47:	31 db                	xor    %ebx,%ebx
   1cd49:	4d 89 ec             	mov    %r13,%r12
   1cd4c:	49 d3 e4             	shl    %cl,%r12
   1cd4f:	f6 c1 40             	test   $0x40,%cl
   1cd52:	4d 0f 45 dc          	cmovne %r12,%r11
   1cd56:	4c 0f 45 e3          	cmovne %rbx,%r12
   1cd5a:	49 39 ec             	cmp    %rbp,%r12
   1cd5d:	49 83 db 00          	sbb    $0x0,%r11
   1cd61:	0f 92 c1             	setb   %cl
   1cd64:	44 29 c8             	sub    %r9d,%eax
   1cd67:	41 01 c7             	add    %eax,%r15d
   1cd6a:	0f b6 c9             	movzbl %cl,%ecx
   1cd6d:	41 29 cf             	sub    %ecx,%r15d
   1cd70:	41 39 d7             	cmp    %edx,%r15d
   1cd73:	0f 8f 19 02 00 00    	jg     1cf92 <<hyperinterval::ieee::Format>::div+0x352>
   1cd79:	4c 8b 4c 24 10       	mov    0x10(%rsp),%r9
   1cd7e:	46 8d 1c 0a          	lea    (%rdx,%r9,1),%r11d
   1cd82:	b9 01 00 00 00       	mov    $0x1,%ecx
   1cd87:	4c 89 5c 24 18       	mov    %r11,0x18(%rsp)
   1cd8c:	44 29 d9             	sub    %r11d,%ecx
   1cd8f:	45 29 cf             	sub    %r9d,%r15d
   1cd92:	41 39 cf             	cmp    %ecx,%r15d
   1cd95:	44 0f 4e f9          	cmovle %ecx,%r15d
   1cd99:	44 29 f8             	sub    %r15d,%eax
   1cd9c:	78 61                	js     1cdff <<hyperinterval::ieee::Format>::div+0x1bf>
   1cd9e:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1cda3:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
   1cda8:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1cdad:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1cdb2:	48 85 ed             	test   %rbp,%rbp
   1cdb5:	0f 84 a7 02 00 00    	je     1d062 <<hyperinterval::ieee::Format>::div+0x422>
   1cdbb:	45 31 e4             	xor    %r12d,%r12d
   1cdbe:	89 c1                	mov    %eax,%ecx
   1cdc0:	4d 0f a5 ec          	shld   %cl,%r13,%r12
   1cdc4:	31 d2                	xor    %edx,%edx
   1cdc6:	49 d3 e5             	shl    %cl,%r13
   1cdc9:	a8 40                	test   $0x40,%al
   1cdcb:	4d 0f 45 e5          	cmovne %r13,%r12
   1cdcf:	4c 0f 45 ea          	cmovne %rdx,%r13
   1cdd3:	4c 89 ef             	mov    %r13,%rdi
   1cdd6:	4c 89 e6             	mov    %r12,%rsi
   1cdd9:	48 89 ea             	mov    %rbp,%rdx
   1cddc:	31 c9                	xor    %ecx,%ecx
   1cdde:	ff 15 3c 0c 04 00    	call   *0x40c3c(%rip)        # 5da20 <_DYNAMIC+0x458>
   1cde4:	49 89 c2             	mov    %rax,%r10
   1cde7:	49 89 d1             	mov    %rdx,%r9
   1cdea:	48 89 d1             	mov    %rdx,%rcx
   1cded:	48 0f af cd          	imul   %rbp,%rcx
   1cdf1:	48 f7 e5             	mul    %rbp
   1cdf4:	48 01 ca             	add    %rcx,%rdx
   1cdf7:	49 29 c5             	sub    %rax,%r13
   1cdfa:	49 19 d4             	sbb    %rdx,%r12
   1cdfd:	eb 79                	jmp    1ce78 <<hyperinterval::ieee::Format>::div+0x238>
   1cdff:	f7 d8                	neg    %eax
   1ce01:	44 39 d0             	cmp    %r10d,%eax
   1ce04:	7e 07                	jle    1ce0d <<hyperinterval::ieee::Format>::div+0x1cd>
   1ce06:	b3 01                	mov    $0x1,%bl
   1ce08:	e9 df 00 00 00       	jmp    1ceec <<hyperinterval::ieee::Format>::div+0x2ac>
   1ce0d:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1ce12:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
   1ce17:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1ce1c:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1ce21:	31 db                	xor    %ebx,%ebx
   1ce23:	89 c1                	mov    %eax,%ecx
   1ce25:	48 0f a5 eb          	shld   %cl,%rbp,%rbx
   1ce29:	48 d3 e5             	shl    %cl,%rbp
   1ce2c:	31 c9                	xor    %ecx,%ecx
   1ce2e:	a8 40                	test   $0x40,%al
   1ce30:	48 0f 45 dd          	cmovne %rbp,%rbx
   1ce34:	48 0f 45 e9          	cmovne %rcx,%rbp
   1ce38:	48 89 e8             	mov    %rbp,%rax
   1ce3b:	48 09 d8             	or     %rbx,%rax
   1ce3e:	0f 84 2b 02 00 00    	je     1d06f <<hyperinterval::ieee::Format>::div+0x42f>
   1ce44:	45 31 e4             	xor    %r12d,%r12d
   1ce47:	4c 89 ef             	mov    %r13,%rdi
   1ce4a:	31 f6                	xor    %esi,%esi
   1ce4c:	48 89 ea             	mov    %rbp,%rdx
   1ce4f:	48 89 d9             	mov    %rbx,%rcx
   1ce52:	ff 15 c8 0b 04 00    	call   *0x40bc8(%rip)        # 5da20 <_DYNAMIC+0x458>
   1ce58:	49 89 c2             	mov    %rax,%r10
   1ce5b:	49 89 d1             	mov    %rdx,%r9
   1ce5e:	48 0f af d8          	imul   %rax,%rbx
   1ce62:	48 f7 e5             	mul    %rbp
   1ce65:	48 01 da             	add    %rbx,%rdx
   1ce68:	4c 89 c9             	mov    %r9,%rcx
   1ce6b:	48 0f af cd          	imul   %rbp,%rcx
   1ce6f:	48 01 d1             	add    %rdx,%rcx
   1ce72:	49 29 c5             	sub    %rax,%r13
   1ce75:	49 19 cc             	sbb    %rcx,%r12
   1ce78:	4d 09 e5             	or     %r12,%r13
   1ce7b:	0f 95 c3             	setne  %bl
   1ce7e:	4c 89 d0             	mov    %r10,%rax
   1ce81:	4c 09 c8             	or     %r9,%rax
   1ce84:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
   1ce89:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   1ce8e:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
   1ce93:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
   1ce98:	74 52                	je     1ceec <<hyperinterval::ieee::Format>::div+0x2ac>
   1ce9a:	49 0f bd c1          	bsr    %r9,%rax
   1ce9e:	83 f0 3f             	xor    $0x3f,%eax
   1cea1:	4d 0f bd da          	bsr    %r10,%r11
   1cea5:	41 83 f3 3f          	xor    $0x3f,%r11d
   1cea9:	41 83 cb 40          	or     $0x40,%r11d
   1cead:	4d 85 c9             	test   %r9,%r9
   1ceb0:	44 0f 45 d8          	cmovne %eax,%r11d
   1ceb4:	41 83 f3 7f          	xor    $0x7f,%r11d
   1ceb8:	43 8d 2c 3b          	lea    (%r11,%r15,1),%ebp
   1cebc:	39 d5                	cmp    %edx,%ebp
   1cebe:	0f 8f ce 00 00 00    	jg     1cf92 <<hyperinterval::ieee::Format>::div+0x352>
   1cec4:	b8 01 00 00 00       	mov    $0x1,%eax
   1cec9:	29 d0                	sub    %edx,%eax
   1cecb:	39 c5                	cmp    %eax,%ebp
   1cecd:	7d 28                	jge    1cef7 <<hyperinterval::ieee::Format>::div+0x2b7>
   1cecf:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1ced4:	42 8d 0c 38          	lea    (%rax,%r15,1),%ecx
   1ced8:	fe c9                	dec    %cl
   1ceda:	4c 89 d0             	mov    %r10,%rax
   1cedd:	48 d3 e0             	shl    %cl,%rax
   1cee0:	45 31 db             	xor    %r11d,%r11d
   1cee3:	f6 c1 40             	test   $0x40,%cl
   1cee6:	4c 0f 44 d8          	cmove  %rax,%r11
   1ceea:	eb 6e                	jmp    1cf5a <<hyperinterval::ieee::Format>::div+0x31a>
   1ceec:	45 31 d2             	xor    %r10d,%r10d
   1ceef:	45 31 c9             	xor    %r9d,%r9d
   1cef2:	45 31 db             	xor    %r11d,%r11d
   1cef5:	eb 63                	jmp    1cf5a <<hyperinterval::ieee::Format>::div+0x31a>
   1cef7:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1cefc:	89 c1                	mov    %eax,%ecx
   1cefe:	44 29 d9             	sub    %r11d,%ecx
   1cf01:	4d 89 d4             	mov    %r10,%r12
   1cf04:	49 d3 e4             	shl    %cl,%r12
   1cf07:	89 c8                	mov    %ecx,%eax
   1cf09:	f7 d8                	neg    %eax
   1cf0b:	45 31 ed             	xor    %r13d,%r13d
   1cf0e:	f6 c1 40             	test   $0x40,%cl
   1cf11:	4d 0f 44 ec          	cmove  %r12,%r13
   1cf15:	4d 89 d4             	mov    %r10,%r12
   1cf18:	89 c1                	mov    %eax,%ecx
   1cf1a:	4d 0f ad cc          	shrd   %cl,%r9,%r12
   1cf1e:	88 5c 24 0f          	mov    %bl,0xf(%rsp)
   1cf22:	4c 89 cb             	mov    %r9,%rbx
   1cf25:	48 d3 eb             	shr    %cl,%rbx
   1cf28:	a8 40                	test   $0x40,%al
   1cf2a:	49 0f 44 dc          	cmove  %r12,%rbx
   1cf2e:	44 39 5c 24 10       	cmp    %r11d,0x10(%rsp)
   1cf33:	49 0f 43 dd          	cmovae %r13,%rbx
   1cf37:	01 d5                	add    %edx,%ebp
   1cf39:	48 63 c5             	movslq %ebp,%rax
   1cf3c:	44 89 f1             	mov    %r14d,%ecx
   1cf3f:	48 d3 e0             	shl    %cl,%rax
   1cf42:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   1cf49:	49 d3 e3             	shl    %cl,%r11
   1cf4c:	49 f7 d3             	not    %r11
   1cf4f:	49 21 db             	and    %rbx,%r11
   1cf52:	0f b6 5c 24 0f       	movzbl 0xf(%rsp),%ebx
   1cf57:	49 09 c3             	or     %rax,%r11
   1cf5a:	0f b6 db             	movzbl %bl,%ebx
   1cf5d:	4c 01 d3             	add    %r10,%rbx
   1cf60:	49 83 d1 00          	adc    $0x0,%r9
   1cf64:	48 89 d8             	mov    %rbx,%rax
   1cf67:	4c 09 c8             	or     %r9,%rax
   1cf6a:	74 30                	je     1cf9c <<hyperinterval::ieee::Format>::div+0x35c>
   1cf6c:	49 0f bd c1          	bsr    %r9,%rax
   1cf70:	83 f0 3f             	xor    $0x3f,%eax
   1cf73:	4c 0f bd d3          	bsr    %rbx,%r10
   1cf77:	41 83 f2 3f          	xor    $0x3f,%r10d
   1cf7b:	41 83 ca 40          	or     $0x40,%r10d
   1cf7f:	4d 85 c9             	test   %r9,%r9
   1cf82:	44 0f 45 d0          	cmovne %eax,%r10d
   1cf86:	41 83 f2 7f          	xor    $0x7f,%r10d
   1cf8a:	43 8d 2c 3a          	lea    (%r10,%r15,1),%ebp
   1cf8e:	39 d5                	cmp    %edx,%ebp
   1cf90:	7e 0e                	jle    1cfa0 <<hyperinterval::ieee::Format>::div+0x360>
   1cf92:	66 c7 07 01 05       	movw   $0x501,(%rdi)
   1cf97:	e9 b4 00 00 00       	jmp    1d050 <<hyperinterval::ieee::Format>::div+0x410>
   1cf9c:	31 c0                	xor    %eax,%eax
   1cf9e:	eb 76                	jmp    1d016 <<hyperinterval::ieee::Format>::div+0x3d6>
   1cfa0:	b8 01 00 00 00       	mov    $0x1,%eax
   1cfa5:	29 d0                	sub    %edx,%eax
   1cfa7:	39 c5                	cmp    %eax,%ebp
   1cfa9:	7d 18                	jge    1cfc3 <<hyperinterval::ieee::Format>::div+0x383>
   1cfab:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1cfb0:	44 01 f9             	add    %r15d,%ecx
   1cfb3:	fe c9                	dec    %cl
   1cfb5:	48 d3 e3             	shl    %cl,%rbx
   1cfb8:	31 c0                	xor    %eax,%eax
   1cfba:	f6 c1 40             	test   $0x40,%cl
   1cfbd:	48 0f 44 c3          	cmove  %rbx,%rax
   1cfc1:	eb 53                	jmp    1d016 <<hyperinterval::ieee::Format>::div+0x3d6>
   1cfc3:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   1cfc8:	44 89 e9             	mov    %r13d,%ecx
   1cfcb:	44 29 d1             	sub    %r10d,%ecx
   1cfce:	89 c8                	mov    %ecx,%eax
   1cfd0:	f7 d8                	neg    %eax
   1cfd2:	49 89 df             	mov    %rbx,%r15
   1cfd5:	49 d3 e7             	shl    %cl,%r15
   1cfd8:	45 31 e4             	xor    %r12d,%r12d
   1cfdb:	f6 c1 40             	test   $0x40,%cl
   1cfde:	4d 0f 44 e7          	cmove  %r15,%r12
   1cfe2:	89 c1                	mov    %eax,%ecx
   1cfe4:	4c 0f ad cb          	shrd   %cl,%r9,%rbx
   1cfe8:	49 d3 e9             	shr    %cl,%r9
   1cfeb:	a8 40                	test   $0x40,%al
   1cfed:	4c 0f 44 cb          	cmove  %rbx,%r9
   1cff1:	45 39 d5             	cmp    %r10d,%r13d
   1cff4:	4d 0f 43 cc          	cmovae %r12,%r9
   1cff8:	01 d5                	add    %edx,%ebp
   1cffa:	48 63 d5             	movslq %ebp,%rdx
   1cffd:	44 89 f1             	mov    %r14d,%ecx
   1d000:	48 d3 e2             	shl    %cl,%rdx
   1d003:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   1d00a:	48 d3 e0             	shl    %cl,%rax
   1d00d:	48 f7 d0             	not    %rax
   1d010:	4c 21 c8             	and    %r9,%rax
   1d013:	48 09 d0             	or     %rdx,%rax
   1d016:	48 85 74 24 40       	test   %rsi,0x40(%rsp)
   1d01b:	0f 95 c1             	setne  %cl
   1d01e:	49 85 f0             	test   %rsi,%r8
   1d021:	0f 94 c2             	sete   %dl
   1d024:	30 ca                	xor    %cl,%dl
   1d026:	75 1d                	jne    1d045 <<hyperinterval::ieee::Format>::div+0x405>
   1d028:	48 89 c1             	mov    %rax,%rcx
   1d02b:	48 31 f1             	xor    %rsi,%rcx
   1d02e:	48 85 c0             	test   %rax,%rax
   1d031:	48 0f 44 c8          	cmove  %rax,%rcx
   1d035:	4c 31 de             	xor    %r11,%rsi
   1d038:	4d 85 db             	test   %r11,%r11
   1d03b:	49 0f 44 f3          	cmove  %r11,%rsi
   1d03f:	48 89 f0             	mov    %rsi,%rax
   1d042:	49 89 cb             	mov    %rcx,%r11
   1d045:	4c 89 5f 08          	mov    %r11,0x8(%rdi)
   1d049:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1d04d:	c6 07 00             	movb   $0x0,(%rdi)
   1d050:	48 89 f8             	mov    %rdi,%rax
   1d053:	48 83 c4 48          	add    $0x48,%rsp
   1d057:	5b                   	pop    %rbx
   1d058:	41 5c                	pop    %r12
   1d05a:	41 5d                	pop    %r13
   1d05c:	41 5e                	pop    %r14
   1d05e:	41 5f                	pop    %r15
   1d060:	5d                   	pop    %rbp
   1d061:	c3                   	ret
   1d062:	48 8d 3d 57 e7 03 00 	lea    0x3e757(%rip),%rdi        # 5b7c0 <__frame_dummy_init_array_entry+0x1f0>
   1d069:	ff 15 b9 09 04 00    	call   *0x409b9(%rip)        # 5da28 <_DYNAMIC+0x460>
   1d06f:	48 8d 3d 32 e7 03 00 	lea    0x3e732(%rip),%rdi        # 5b7a8 <__frame_dummy_init_array_entry+0x1d8>
   1d076:	ff 15 ac 09 04 00    	call   *0x409ac(%rip)        # 5da28 <_DYNAMIC+0x460>
   1d07c:	cc                   	int3
   1d07d:	cc                   	int3
   1d07e:	cc                   	int3
   1d07f:	cc                   	int3

<hyperinterval::ieee::Format>::mul:
   1d080:	55                   	push   %rbp
   1d081:	41 57                	push   %r15
   1d083:	41 56                	push   %r14
   1d085:	41 54                	push   %r12
   1d087:	53                   	push   %rbx
   1d088:	48 83 ec 20          	sub    $0x20,%rsp
   1d08c:	48 89 c8             	mov    %rcx,%rax
   1d08f:	49 89 d1             	mov    %rdx,%r9
   1d092:	b9 40 00 00 00       	mov    $0x40,%ecx
   1d097:	f3 48 0f bc ca       	tzcnt  %rdx,%rcx
   1d09c:	48 89 c2             	mov    %rax,%rdx
   1d09f:	4c 21 ca             	and    %r9,%rdx
   1d0a2:	48 d3 ea             	shr    %cl,%rdx
   1d0a5:	41 be 01 00 00 00    	mov    $0x1,%r14d
   1d0ab:	49 d3 e6             	shl    %cl,%r14
   1d0ae:	4d 8d 66 ff          	lea    -0x1(%r14),%r12
   1d0b2:	4c 89 e3             	mov    %r12,%rbx
   1d0b5:	48 21 c3             	and    %rax,%rbx
   1d0b8:	48 85 d2             	test   %rdx,%rdx
   1d0bb:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1d0c1:	41 89 d3             	mov    %edx,%r11d
   1d0c4:	45 0f 44 da          	cmove  %r10d,%r11d
   1d0c8:	49 0f 45 d6          	cmovne %r14,%rdx
   1d0cc:	48 09 da             	or     %rbx,%rdx
   1d0cf:	4d 89 cf             	mov    %r9,%r15
   1d0d2:	49 d3 ef             	shr    %cl,%r15
   1d0d5:	48 85 f0             	test   %rsi,%rax
   1d0d8:	40 0f 95 c5          	setne  %bpl
   1d0dc:	4c 89 c0             	mov    %r8,%rax
   1d0df:	4c 21 c8             	and    %r9,%rax
   1d0e2:	48 d3 e8             	shr    %cl,%rax
   1d0e5:	4d 21 c4             	and    %r8,%r12
   1d0e8:	48 85 c0             	test   %rax,%rax
   1d0eb:	44 0f 45 d0          	cmovne %eax,%r10d
   1d0ef:	48 89 fb             	mov    %rdi,%rbx
   1d0f2:	49 0f 45 c6          	cmovne %r14,%rax
   1d0f6:	4c 09 e0             	or     %r12,%rax
   1d0f9:	49 85 f0             	test   %rsi,%r8
   1d0fc:	40 0f 95 c7          	setne  %dil
   1d100:	40 30 ef             	xor    %bpl,%dil
   1d103:	48 f7 e2             	mul    %rdx
   1d106:	45 01 da             	add    %r11d,%r10d
   1d109:	41 8d 0c 4f          	lea    (%r15,%rcx,2),%ecx
   1d10d:	83 e1 fe             	and    $0xfffffffe,%ecx
   1d110:	41 29 ca             	sub    %ecx,%r10d
   1d113:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
   1d118:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1d11d:	48 89 04 24          	mov    %rax,(%rsp)
   1d121:	44 89 54 24 10       	mov    %r10d,0x10(%rsp)
   1d126:	48 89 e1             	mov    %rsp,%rcx
   1d129:	48 89 df             	mov    %rbx,%rdi
   1d12c:	4c 89 ca             	mov    %r9,%rdx
   1d12f:	e8 2c 0b 00 00       	call   1dc60 <<hyperinterval::ieee::Format>::rounded>
   1d134:	48 89 d8             	mov    %rbx,%rax
   1d137:	48 83 c4 20          	add    $0x20,%rsp
   1d13b:	5b                   	pop    %rbx
   1d13c:	41 5c                	pop    %r12
   1d13e:	41 5e                	pop    %r14
   1d140:	41 5f                	pop    %r15
   1d142:	5d                   	pop    %rbp
   1d143:	c3                   	ret
   1d144:	cc                   	int3
   1d145:	cc                   	int3
   1d146:	cc                   	int3
   1d147:	cc                   	int3
   1d148:	cc                   	int3
   1d149:	cc                   	int3
   1d14a:	cc                   	int3
   1d14b:	cc                   	int3
   1d14c:	cc                   	int3
   1d14d:	cc                   	int3
   1d14e:	cc                   	int3
   1d14f:	cc                   	int3

<hyperinterval::ieee::Format>::sqrt:
   1d150:	55                   	push   %rbp
   1d151:	41 57                	push   %r15
   1d153:	41 56                	push   %r14
   1d155:	41 55                	push   %r13
   1d157:	41 54                	push   %r12
   1d159:	53                   	push   %rbx
   1d15a:	48 83 ec 38          	sub    $0x38,%rsp
   1d15e:	48 89 c8             	mov    %rcx,%rax
   1d161:	49 89 d6             	mov    %rdx,%r14
   1d164:	41 b8 40 00 00 00    	mov    $0x40,%r8d
   1d16a:	f3 4c 0f bc c2       	tzcnt  %rdx,%r8
   1d16f:	48 89 ca             	mov    %rcx,%rdx
   1d172:	4c 21 f2             	and    %r14,%rdx
   1d175:	45 89 c5             	mov    %r8d,%r13d
   1d178:	41 83 e5 3f          	and    $0x3f,%r13d
   1d17c:	44 89 e9             	mov    %r13d,%ecx
   1d17f:	48 d3 ea             	shr    %cl,%rdx
   1d182:	bd 01 00 00 00       	mov    $0x1,%ebp
   1d187:	48 d3 e5             	shl    %cl,%rbp
   1d18a:	49 89 ff             	mov    %rdi,%r15
   1d18d:	48 8d 75 ff          	lea    -0x1(%rbp),%rsi
   1d191:	48 21 c6             	and    %rax,%rsi
   1d194:	48 85 d2             	test   %rdx,%rdx
   1d197:	48 0f 44 ea          	cmove  %rdx,%rbp
   1d19b:	49 d3 ee             	shr    %cl,%r14
   1d19e:	48 09 f5             	or     %rsi,%rbp
   1d1a1:	0f 84 8a 00 00 00    	je     1d231 <<hyperinterval::ieee::Format>::sqrt+0xe1>
   1d1a7:	49 d1 ee             	shr    $1,%r14
   1d1aa:	48 85 d2             	test   %rdx,%rdx
   1d1ad:	b9 01 00 00 00       	mov    $0x1,%ecx
   1d1b2:	0f 45 ca             	cmovne %edx,%ecx
   1d1b5:	44 29 f1             	sub    %r14d,%ecx
   1d1b8:	44 29 c1             	sub    %r8d,%ecx
   1d1bb:	48 0f bd dd          	bsr    %rbp,%rbx
   1d1bf:	83 f3 3f             	xor    $0x3f,%ebx
   1d1c2:	83 cb 40             	or     $0x40,%ebx
   1d1c5:	83 f3 7f             	xor    $0x7f,%ebx
   1d1c8:	01 cb                	add    %ecx,%ebx
   1d1ca:	d1 fb                	sar    $1,%ebx
   1d1cc:	41 89 db             	mov    %ebx,%r11d
   1d1cf:	45 29 c3             	sub    %r8d,%r11d
   1d1d2:	44 29 d9             	sub    %r11d,%ecx
   1d1d5:	44 29 d9             	sub    %r11d,%ecx
   1d1d8:	45 31 d2             	xor    %r10d,%r10d
   1d1db:	49 0f a5 ea          	shld   %cl,%rbp,%r10
   1d1df:	48 d3 e5             	shl    %cl,%rbp
   1d1e2:	31 f6                	xor    %esi,%esi
   1d1e4:	f6 c1 40             	test   $0x40,%cl
   1d1e7:	4c 0f 45 d5          	cmovne %rbp,%r10
   1d1eb:	48 0f 45 ee          	cmovne %rsi,%rbp
   1d1ef:	4d 85 d2             	test   %r10,%r10
   1d1f2:	4c 89 44 24 10       	mov    %r8,0x10(%rsp)
   1d1f7:	75 45                	jne    1d23e <<hyperinterval::ieee::Format>::sqrt+0xee>
   1d1f9:	48 89 e8             	mov    %rbp,%rax
   1d1fc:	48 c1 e8 20          	shr    $0x20,%rax
   1d200:	0f 85 64 01 00 00    	jne    1d36a <<hyperinterval::ieee::Format>::sqrt+0x21a>
   1d206:	48 81 fd 00 00 01 00 	cmp    $0x10000,%rbp
   1d20d:	0f 83 17 03 00 00    	jae    1d52a <<hyperinterval::ieee::Format>::sqrt+0x3da>
   1d213:	48 81 fd 00 01 00 00 	cmp    $0x100,%rbp
   1d21a:	0f 83 eb 03 00 00    	jae    1d60b <<hyperinterval::ieee::Format>::sqrt+0x4bb>
   1d220:	48 8d 05 95 a5 fe ff 	lea    -0x15a6b(%rip),%rax        # 77bc <__abi_tag+0x74c0>
   1d227:	44 0f b6 24 68       	movzbl (%rax,%rbp,2),%r12d
   1d22c:	e9 d6 03 00 00       	jmp    1d607 <<hyperinterval::ieee::Format>::sqrt+0x4b7>
   1d231:	0f 57 c0             	xorps  %xmm0,%xmm0
   1d234:	41 0f 11 47 08       	movups %xmm0,0x8(%r15)
   1d239:	e9 fe 05 00 00       	jmp    1d83c <<hyperinterval::ieee::Format>::sqrt+0x6ec>
   1d23e:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
   1d243:	4c 89 7c 24 30       	mov    %r15,0x30(%rsp)
   1d248:	49 0f bd c2          	bsr    %r10,%rax
   1d24c:	48 83 f0 3f          	xor    $0x3f,%rax
   1d250:	4c 0f bd ed          	bsr    %rbp,%r13
   1d254:	49 83 f5 3f          	xor    $0x3f,%r13
   1d258:	49 83 cd 40          	or     $0x40,%r13
   1d25c:	4d 85 d2             	test   %r10,%r10
   1d25f:	4c 0f 45 e8          	cmovne %rax,%r13
   1d263:	44 89 e9             	mov    %r13d,%ecx
   1d266:	80 e1 3e             	and    $0x3e,%cl
   1d269:	4d 89 d7             	mov    %r10,%r15
   1d26c:	49 0f a5 ef          	shld   %cl,%rbp,%r15
   1d270:	48 89 e8             	mov    %rbp,%rax
   1d273:	48 d3 e0             	shl    %cl,%rax
   1d276:	41 f6 c5 40          	test   $0x40,%r13b
   1d27a:	4c 0f 45 f8          	cmovne %rax,%r15
   1d27e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   1d284:	4c 0f 44 c0          	cmove  %rax,%r8
   1d288:	4c 89 f8             	mov    %r15,%rax
   1d28b:	48 c1 e8 38          	shr    $0x38,%rax
   1d28f:	48 8d 15 26 a5 fe ff 	lea    -0x15ada(%rip),%rdx        # 77bc <__abi_tag+0x74c0>
   1d296:	0f b6 0c 42          	movzbl (%rdx,%rax,2),%ecx
   1d29a:	89 cf                	mov    %ecx,%edi
   1d29c:	01 cf                	add    %ecx,%edi
   1d29e:	0f b6 54 42 01       	movzbl 0x1(%rdx,%rax,2),%edx
   1d2a3:	c1 e2 04             	shl    $0x4,%edx
   1d2a6:	4c 89 f8             	mov    %r15,%rax
   1d2a9:	48 c1 e8 34          	shr    $0x34,%rax
   1d2ad:	83 e0 0f             	and    $0xf,%eax
   1d2b0:	09 d0                	or     %edx,%eax
   1d2b2:	31 d2                	xor    %edx,%edx
   1d2b4:	66 f7 f7             	div    %di
   1d2b7:	4c 89 ff             	mov    %r15,%rdi
   1d2ba:	48 c1 ef 30          	shr    $0x30,%rdi
   1d2be:	0f b7 d2             	movzwl %dx,%edx
   1d2c1:	c0 e1 04             	shl    $0x4,%cl
   1d2c4:	0f b6 c9             	movzbl %cl,%ecx
   1d2c7:	01 c1                	add    %eax,%ecx
   1d2c9:	0f b7 c9             	movzwl %cx,%ecx
   1d2cc:	c1 e2 04             	shl    $0x4,%edx
   1d2cf:	83 e7 0f             	and    $0xf,%edi
   1d2d2:	09 d7                	or     %edx,%edi
   1d2d4:	0f af c0             	imul   %eax,%eax
   1d2d7:	66 29 c7             	sub    %ax,%di
   1d2da:	8d 44 09 ff          	lea    -0x1(%rcx,%rcx,1),%eax
   1d2de:	0f 43 c6             	cmovae %esi,%eax
   1d2e1:	66 83 d9 00          	sbb    $0x0,%cx
   1d2e5:	01 f8                	add    %edi,%eax
   1d2e7:	0f b7 f9             	movzwl %cx,%edi
   1d2ea:	01 ff                	add    %edi,%edi
   1d2ec:	0f b7 d0             	movzwl %ax,%edx
   1d2ef:	c1 e2 08             	shl    $0x8,%edx
   1d2f2:	4c 89 f8             	mov    %r15,%rax
   1d2f5:	48 c1 e8 28          	shr    $0x28,%rax
   1d2f9:	0f b6 c0             	movzbl %al,%eax
   1d2fc:	09 d0                	or     %edx,%eax
   1d2fe:	31 d2                	xor    %edx,%edx
   1d300:	f7 f7                	div    %edi
   1d302:	4c 89 ff             	mov    %r15,%rdi
   1d305:	48 c1 ef 20          	shr    $0x20,%rdi
   1d309:	c1 e1 08             	shl    $0x8,%ecx
   1d30c:	44 0f b7 e1          	movzwl %cx,%r12d
   1d310:	41 01 c4             	add    %eax,%r12d
   1d313:	c1 e2 08             	shl    $0x8,%edx
   1d316:	40 0f b6 cf          	movzbl %dil,%ecx
   1d31a:	09 d1                	or     %edx,%ecx
   1d31c:	0f af c0             	imul   %eax,%eax
   1d31f:	29 c1                	sub    %eax,%ecx
   1d321:	43 8d 44 24 ff       	lea    -0x1(%r12,%r12,1),%eax
   1d326:	0f 43 c6             	cmovae %esi,%eax
   1d329:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1d32c:	41 83 dc 00          	sbb    $0x0,%r12d
   1d330:	4b 8d 0c 24          	lea    (%r12,%r12,1),%rcx
   1d334:	48 c1 e2 10          	shl    $0x10,%rdx
   1d338:	44 89 f8             	mov    %r15d,%eax
   1d33b:	c1 e8 10             	shr    $0x10,%eax
   1d33e:	48 09 d0             	or     %rdx,%rax
   1d341:	48 09 ca             	or     %rcx,%rdx
   1d344:	48 c1 ea 20          	shr    $0x20,%rdx
   1d348:	66 85 d2             	test   %dx,%dx
   1d34b:	4c 89 5c 24 08       	mov    %r11,0x8(%rsp)
   1d350:	4c 89 54 24 20       	mov    %r10,0x20(%rsp)
   1d355:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
   1d35a:	0f 84 06 01 00 00    	je     1d466 <<hyperinterval::ieee::Format>::sqrt+0x316>
   1d360:	31 d2                	xor    %edx,%edx
   1d362:	48 f7 f1             	div    %rcx
   1d365:	e9 00 01 00 00       	jmp    1d46a <<hyperinterval::ieee::Format>::sqrt+0x31a>
   1d36a:	48 0f bd f5          	bsr    %rbp,%rsi
   1d36e:	48 83 f6 3f          	xor    $0x3f,%rsi
   1d372:	89 f1                	mov    %esi,%ecx
   1d374:	80 e1 3e             	and    $0x3e,%cl
   1d377:	48 89 ef             	mov    %rbp,%rdi
   1d37a:	48 d3 e7             	shl    %cl,%rdi
   1d37d:	48 89 f8             	mov    %rdi,%rax
   1d380:	48 c1 e8 38          	shr    $0x38,%rax
   1d384:	48 8d 0d 31 a4 fe ff 	lea    -0x15bcf(%rip),%rcx        # 77bc <__abi_tag+0x74c0>
   1d38b:	44 0f b6 04 41       	movzbl (%rcx,%rax,2),%r8d
   1d390:	45 89 c1             	mov    %r8d,%r9d
   1d393:	45 01 c1             	add    %r8d,%r9d
   1d396:	0f b6 4c 41 01       	movzbl 0x1(%rcx,%rax,2),%ecx
   1d39b:	c1 e1 04             	shl    $0x4,%ecx
   1d39e:	48 89 f8             	mov    %rdi,%rax
   1d3a1:	48 c1 e8 34          	shr    $0x34,%rax
   1d3a5:	83 e0 0f             	and    $0xf,%eax
   1d3a8:	09 c8                	or     %ecx,%eax
   1d3aa:	31 d2                	xor    %edx,%edx
   1d3ac:	66 41 f7 f1          	div    %r9w
   1d3b0:	49 89 f9             	mov    %rdi,%r9
   1d3b3:	49 c1 e9 30          	shr    $0x30,%r9
   1d3b7:	31 c9                	xor    %ecx,%ecx
   1d3b9:	0f b7 d2             	movzwl %dx,%edx
   1d3bc:	41 c0 e0 04          	shl    $0x4,%r8b
   1d3c0:	45 0f b6 c0          	movzbl %r8b,%r8d
   1d3c4:	41 01 c0             	add    %eax,%r8d
   1d3c7:	45 0f b7 c0          	movzwl %r8w,%r8d
   1d3cb:	c1 e2 04             	shl    $0x4,%edx
   1d3ce:	41 83 e1 0f          	and    $0xf,%r9d
   1d3d2:	41 09 d1             	or     %edx,%r9d
   1d3d5:	0f af c0             	imul   %eax,%eax
   1d3d8:	66 41 29 c1          	sub    %ax,%r9w
   1d3dc:	43 8d 44 00 ff       	lea    -0x1(%r8,%r8,1),%eax
   1d3e1:	0f 43 c1             	cmovae %ecx,%eax
   1d3e4:	66 41 83 d8 00       	sbb    $0x0,%r8w
   1d3e9:	44 01 c8             	add    %r9d,%eax
   1d3ec:	45 0f b7 c8          	movzwl %r8w,%r9d
   1d3f0:	45 01 c9             	add    %r9d,%r9d
   1d3f3:	0f b7 d0             	movzwl %ax,%edx
   1d3f6:	c1 e2 08             	shl    $0x8,%edx
   1d3f9:	48 89 f8             	mov    %rdi,%rax
   1d3fc:	48 c1 e8 28          	shr    $0x28,%rax
   1d400:	0f b6 c0             	movzbl %al,%eax
   1d403:	09 d0                	or     %edx,%eax
   1d405:	31 d2                	xor    %edx,%edx
   1d407:	41 f7 f1             	div    %r9d
   1d40a:	49 89 f9             	mov    %rdi,%r9
   1d40d:	49 c1 e9 20          	shr    $0x20,%r9
   1d411:	41 c1 e0 08          	shl    $0x8,%r8d
   1d415:	45 0f b7 e0          	movzwl %r8w,%r12d
   1d419:	41 01 c4             	add    %eax,%r12d
   1d41c:	c1 e2 08             	shl    $0x8,%edx
   1d41f:	45 0f b6 c1          	movzbl %r9b,%r8d
   1d423:	41 09 d0             	or     %edx,%r8d
   1d426:	0f af c0             	imul   %eax,%eax
   1d429:	41 29 c0             	sub    %eax,%r8d
   1d42c:	43 8d 44 24 ff       	lea    -0x1(%r12,%r12,1),%eax
   1d431:	0f 43 c1             	cmovae %ecx,%eax
   1d434:	41 8d 14 00          	lea    (%r8,%rax,1),%edx
   1d438:	41 83 dc 00          	sbb    $0x0,%r12d
   1d43c:	4b 8d 0c 24          	lea    (%r12,%r12,1),%rcx
   1d440:	48 c1 e2 10          	shl    $0x10,%rdx
   1d444:	89 f8                	mov    %edi,%eax
   1d446:	c1 e8 10             	shr    $0x10,%eax
   1d449:	48 09 d0             	or     %rdx,%rax
   1d44c:	48 09 ca             	or     %rcx,%rdx
   1d44f:	48 c1 ea 20          	shr    $0x20,%rdx
   1d453:	66 85 d2             	test   %dx,%dx
   1d456:	0f 84 82 01 00 00    	je     1d5de <<hyperinterval::ieee::Format>::sqrt+0x48e>
   1d45c:	31 d2                	xor    %edx,%edx
   1d45e:	48 f7 f1             	div    %rcx
   1d461:	e9 7c 01 00 00       	jmp    1d5e2 <<hyperinterval::ieee::Format>::sqrt+0x492>
   1d466:	31 d2                	xor    %edx,%edx
   1d468:	f7 f1                	div    %ecx
   1d46a:	41 c1 e4 10          	shl    $0x10,%r12d
   1d46e:	49 01 c4             	add    %rax,%r12
   1d471:	48 c1 e2 10          	shl    $0x10,%rdx
   1d475:	41 0f b7 cf          	movzwl %r15w,%ecx
   1d479:	48 09 d1             	or     %rdx,%rcx
   1d47c:	48 0f af c0          	imul   %rax,%rax
   1d480:	31 d2                	xor    %edx,%edx
   1d482:	48 29 c1             	sub    %rax,%rcx
   1d485:	4b 8d 44 24 ff       	lea    -0x1(%r12,%r12,1),%rax
   1d48a:	48 0f 42 d0          	cmovb  %rax,%rdx
   1d48e:	49 83 dc 00          	sbb    $0x0,%r12
   1d492:	48 8d 3c 11          	lea    (%rcx,%rdx,1),%rdi
   1d496:	4b 8d 14 24          	lea    (%r12,%r12,1),%rdx
   1d49a:	4c 89 e1             	mov    %r12,%rcx
   1d49d:	48 c1 e9 3f          	shr    $0x3f,%rcx
   1d4a1:	48 89 fe             	mov    %rdi,%rsi
   1d4a4:	48 c1 ee 20          	shr    $0x20,%rsi
   1d4a8:	4c 0f a4 c7 20       	shld   $0x20,%r8,%rdi
   1d4ad:	4c 89 c3             	mov    %r8,%rbx
   1d4b0:	ff 15 6a 05 04 00    	call   *0x4056a(%rip)        # 5da20 <_DYNAMIC+0x458>
   1d4b6:	48 89 d6             	mov    %rdx,%rsi
   1d4b9:	49 c1 e4 20          	shl    $0x20,%r12
   1d4bd:	49 01 c4             	add    %rax,%r12
   1d4c0:	48 83 d6 00          	adc    $0x0,%rsi
   1d4c4:	48 89 f0             	mov    %rsi,%rax
   1d4c7:	49 f7 e4             	mul    %r12
   1d4ca:	0f 90 c1             	seto   %cl
   1d4cd:	48 85 f6             	test   %rsi,%rsi
   1d4d0:	40 0f 95 c7          	setne  %dil
   1d4d4:	40 08 cf             	or     %cl,%dil
   1d4d7:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   1d4db:	4c 89 e0             	mov    %r12,%rax
   1d4de:	49 f7 e4             	mul    %r12
   1d4e1:	48 01 ca             	add    %rcx,%rdx
   1d4e4:	0f 92 c1             	setb   %cl
   1d4e7:	40 08 f9             	or     %dil,%cl
   1d4ea:	48 39 c3             	cmp    %rax,%rbx
   1d4ed:	49 19 d7             	sbb    %rdx,%r15
   1d4f0:	0f 92 c0             	setb   %al
   1d4f3:	08 c8                	or     %cl,%al
   1d4f5:	0f b6 c0             	movzbl %al,%eax
   1d4f8:	49 29 c4             	sub    %rax,%r12
   1d4fb:	48 83 de 00          	sbb    $0x0,%rsi
   1d4ff:	41 d1 ed             	shr    $1,%r13d
   1d502:	44 89 e9             	mov    %r13d,%ecx
   1d505:	49 0f ad f4          	shrd   %cl,%rsi,%r12
   1d509:	48 d3 ee             	shr    %cl,%rsi
   1d50c:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
   1d511:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
   1d516:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
   1d51b:	4c 8b 54 24 20       	mov    0x20(%rsp),%r10
   1d520:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
   1d525:	e9 52 01 00 00       	jmp    1d67c <<hyperinterval::ieee::Format>::sqrt+0x52c>
   1d52a:	0f bd fd             	bsr    %ebp,%edi
   1d52d:	83 f7 1f             	xor    $0x1f,%edi
   1d530:	89 f9                	mov    %edi,%ecx
   1d532:	80 e1 1e             	and    $0x1e,%cl
   1d535:	89 ea                	mov    %ebp,%edx
   1d537:	d3 e2                	shl    %cl,%edx
   1d539:	89 d0                	mov    %edx,%eax
   1d53b:	41 89 d0             	mov    %edx,%r8d
   1d53e:	c1 e8 18             	shr    $0x18,%eax
   1d541:	48 8d 15 74 a2 fe ff 	lea    -0x15d8c(%rip),%rdx        # 77bc <__abi_tag+0x74c0>
   1d548:	0f b6 0c 42          	movzbl (%rdx,%rax,2),%ecx
   1d54c:	89 ce                	mov    %ecx,%esi
   1d54e:	01 ce                	add    %ecx,%esi
   1d550:	0f b6 54 42 01       	movzbl 0x1(%rdx,%rax,2),%edx
   1d555:	c1 e2 04             	shl    $0x4,%edx
   1d558:	45 89 c1             	mov    %r8d,%r9d
   1d55b:	44 89 c0             	mov    %r8d,%eax
   1d55e:	c1 e8 14             	shr    $0x14,%eax
   1d561:	83 e0 0f             	and    $0xf,%eax
   1d564:	09 d0                	or     %edx,%eax
   1d566:	31 d2                	xor    %edx,%edx
   1d568:	66 f7 f6             	div    %si
   1d56b:	41 c1 e8 10          	shr    $0x10,%r8d
   1d56f:	31 f6                	xor    %esi,%esi
   1d571:	0f b7 d2             	movzwl %dx,%edx
   1d574:	c0 e1 04             	shl    $0x4,%cl
   1d577:	0f b6 c9             	movzbl %cl,%ecx
   1d57a:	01 c1                	add    %eax,%ecx
   1d57c:	0f b7 c9             	movzwl %cx,%ecx
   1d57f:	c1 e2 04             	shl    $0x4,%edx
   1d582:	41 83 e0 0f          	and    $0xf,%r8d
   1d586:	41 09 d0             	or     %edx,%r8d
   1d589:	0f af c0             	imul   %eax,%eax
   1d58c:	66 41 29 c0          	sub    %ax,%r8w
   1d590:	8d 44 09 ff          	lea    -0x1(%rcx,%rcx,1),%eax
   1d594:	0f 43 c6             	cmovae %esi,%eax
   1d597:	66 83 d9 00          	sbb    $0x0,%cx
   1d59b:	44 01 c0             	add    %r8d,%eax
   1d59e:	44 0f b7 c1          	movzwl %cx,%r8d
   1d5a2:	45 01 c0             	add    %r8d,%r8d
   1d5a5:	0f b7 d0             	movzwl %ax,%edx
   1d5a8:	c1 e2 08             	shl    $0x8,%edx
   1d5ab:	44 89 c8             	mov    %r9d,%eax
   1d5ae:	0f b6 c4             	movzbl %ah,%eax
   1d5b1:	09 d0                	or     %edx,%eax
   1d5b3:	31 d2                	xor    %edx,%edx
   1d5b5:	41 f7 f0             	div    %r8d
   1d5b8:	c1 e1 08             	shl    $0x8,%ecx
   1d5bb:	44 0f b7 e1          	movzwl %cx,%r12d
   1d5bf:	41 01 c4             	add    %eax,%r12d
   1d5c2:	44 89 e0             	mov    %r12d,%eax
   1d5c5:	41 f7 e4             	mul    %r12d
   1d5c8:	0f 90 c1             	seto   %cl
   1d5cb:	44 39 c8             	cmp    %r9d,%eax
   1d5ce:	0f 97 c0             	seta   %al
   1d5d1:	08 c8                	or     %cl,%al
   1d5d3:	0f b6 c0             	movzbl %al,%eax
   1d5d6:	41 29 c4             	sub    %eax,%r12d
   1d5d9:	e9 97 00 00 00       	jmp    1d675 <<hyperinterval::ieee::Format>::sqrt+0x525>
   1d5de:	31 d2                	xor    %edx,%edx
   1d5e0:	f7 f1                	div    %ecx
   1d5e2:	41 c1 e4 10          	shl    $0x10,%r12d
   1d5e6:	49 01 c4             	add    %rax,%r12
   1d5e9:	4c 89 e0             	mov    %r12,%rax
   1d5ec:	49 f7 e4             	mul    %r12
   1d5ef:	0f 90 c1             	seto   %cl
   1d5f2:	48 39 f8             	cmp    %rdi,%rax
   1d5f5:	0f 97 c0             	seta   %al
   1d5f8:	08 c8                	or     %cl,%al
   1d5fa:	0f b6 c0             	movzbl %al,%eax
   1d5fd:	49 29 c4             	sub    %rax,%r12
   1d600:	d1 ee                	shr    $1,%esi
   1d602:	89 f1                	mov    %esi,%ecx
   1d604:	49 d3 ec             	shr    %cl,%r12
   1d607:	31 f6                	xor    %esi,%esi
   1d609:	eb 71                	jmp    1d67c <<hyperinterval::ieee::Format>::sqrt+0x52c>
   1d60b:	66 0f bd fd          	bsr    %bp,%di
   1d60f:	83 f7 0f             	xor    $0xf,%edi
   1d612:	89 f9                	mov    %edi,%ecx
   1d614:	80 e1 0e             	and    $0xe,%cl
   1d617:	89 e8                	mov    %ebp,%eax
   1d619:	d3 e0                	shl    %cl,%eax
   1d61b:	41 89 c0             	mov    %eax,%r8d
   1d61e:	0f b6 cc             	movzbl %ah,%ecx
   1d621:	48 8d 15 94 a1 fe ff 	lea    -0x15e6c(%rip),%rdx        # 77bc <__abi_tag+0x74c0>
   1d628:	44 0f b6 0c 4a       	movzbl (%rdx,%rcx,2),%r9d
   1d62d:	4d 89 d4             	mov    %r10,%r12
   1d630:	45 89 ca             	mov    %r9d,%r10d
   1d633:	45 01 ca             	add    %r9d,%r10d
   1d636:	0f b6 4c 4a 01       	movzbl 0x1(%rdx,%rcx,2),%ecx
   1d63b:	c1 e1 04             	shl    $0x4,%ecx
   1d63e:	c1 e8 04             	shr    $0x4,%eax
   1d641:	83 e0 0f             	and    $0xf,%eax
   1d644:	09 c8                	or     %ecx,%eax
   1d646:	31 f6                	xor    %esi,%esi
   1d648:	31 d2                	xor    %edx,%edx
   1d64a:	66 41 f7 f2          	div    %r10w
   1d64e:	4d 89 e2             	mov    %r12,%r10
   1d651:	41 c0 e1 04          	shl    $0x4,%r9b
   1d655:	41 0f b6 c9          	movzbl %r9b,%ecx
   1d659:	01 c1                	add    %eax,%ecx
   1d65b:	89 c8                	mov    %ecx,%eax
   1d65d:	66 f7 e1             	mul    %cx
   1d660:	0f 90 c2             	seto   %dl
   1d663:	66 44 39 c0          	cmp    %r8w,%ax
   1d667:	0f 97 c0             	seta   %al
   1d66a:	08 d0                	or     %dl,%al
   1d66c:	0f b6 c0             	movzbl %al,%eax
   1d66f:	29 c1                	sub    %eax,%ecx
   1d671:	44 0f b7 e1          	movzwl %cx,%r12d
   1d675:	d1 ef                	shr    $1,%edi
   1d677:	89 f9                	mov    %edi,%ecx
   1d679:	41 d3 ec             	shr    %cl,%r12d
   1d67c:	4c 89 e1             	mov    %r12,%rcx
   1d67f:	4c 89 e0             	mov    %r12,%rax
   1d682:	49 f7 e4             	mul    %r12
   1d685:	48 0f af ce          	imul   %rsi,%rcx
   1d689:	48 01 ca             	add    %rcx,%rdx
   1d68c:	48 01 ca             	add    %rcx,%rdx
   1d68f:	4c 31 d2             	xor    %r10,%rdx
   1d692:	48 31 e8             	xor    %rbp,%rax
   1d695:	31 ff                	xor    %edi,%edi
   1d697:	48 09 d0             	or     %rdx,%rax
   1d69a:	40 0f 95 c7          	setne  %dil
   1d69e:	4c 01 e7             	add    %r12,%rdi
   1d6a1:	48 89 f2             	mov    %rsi,%rdx
   1d6a4:	48 83 d2 00          	adc    $0x0,%rdx
   1d6a8:	4c 89 e0             	mov    %r12,%rax
   1d6ab:	48 09 f0             	or     %rsi,%rax
   1d6ae:	74 58                	je     1d708 <<hyperinterval::ieee::Format>::sqrt+0x5b8>
   1d6b0:	48 0f bd c6          	bsr    %rsi,%rax
   1d6b4:	83 f0 3f             	xor    $0x3f,%eax
   1d6b7:	4d 0f bd c4          	bsr    %r12,%r8
   1d6bb:	41 83 f0 3f          	xor    $0x3f,%r8d
   1d6bf:	41 83 c8 40          	or     $0x40,%r8d
   1d6c3:	48 85 f6             	test   %rsi,%rsi
   1d6c6:	44 0f 45 c0          	cmovne %eax,%r8d
   1d6ca:	41 83 f0 7f          	xor    $0x7f,%r8d
   1d6ce:	47 8d 0c 18          	lea    (%r8,%r11,1),%r9d
   1d6d2:	45 39 f1             	cmp    %r14d,%r9d
   1d6d5:	7f 62                	jg     1d739 <<hyperinterval::ieee::Format>::sqrt+0x5e9>
   1d6d7:	b8 01 00 00 00       	mov    $0x1,%eax
   1d6dc:	44 29 f0             	sub    %r14d,%eax
   1d6df:	41 39 c1             	cmp    %eax,%r9d
   1d6e2:	0f 8d 89 00 00 00    	jge    1d771 <<hyperinterval::ieee::Format>::sqrt+0x621>
   1d6e8:	41 8d 0c 1e          	lea    (%r14,%rbx,1),%ecx
   1d6ec:	fe c9                	dec    %cl
   1d6ee:	49 d3 e4             	shl    %cl,%r12
   1d6f1:	45 31 c0             	xor    %r8d,%r8d
   1d6f4:	f6 c1 40             	test   $0x40,%cl
   1d6f7:	4d 0f 44 c4          	cmove  %r12,%r8
   1d6fb:	48 89 f8             	mov    %rdi,%rax
   1d6fe:	48 09 d0             	or     %rdx,%rax
   1d701:	75 14                	jne    1d717 <<hyperinterval::ieee::Format>::sqrt+0x5c7>
   1d703:	e9 d2 00 00 00       	jmp    1d7da <<hyperinterval::ieee::Format>::sqrt+0x68a>
   1d708:	45 31 c0             	xor    %r8d,%r8d
   1d70b:	48 89 f8             	mov    %rdi,%rax
   1d70e:	48 09 d0             	or     %rdx,%rax
   1d711:	0f 84 c3 00 00 00    	je     1d7da <<hyperinterval::ieee::Format>::sqrt+0x68a>
   1d717:	48 0f bd c2          	bsr    %rdx,%rax
   1d71b:	83 f0 3f             	xor    $0x3f,%eax
   1d71e:	48 0f bd f7          	bsr    %rdi,%rsi
   1d722:	83 f6 3f             	xor    $0x3f,%esi
   1d725:	83 ce 40             	or     $0x40,%esi
   1d728:	48 85 d2             	test   %rdx,%rdx
   1d72b:	0f 45 f0             	cmovne %eax,%esi
   1d72e:	83 f6 7f             	xor    $0x7f,%esi
   1d731:	41 01 f3             	add    %esi,%r11d
   1d734:	45 39 f3             	cmp    %r14d,%r11d
   1d737:	7e 0c                	jle    1d745 <<hyperinterval::ieee::Format>::sqrt+0x5f5>
   1d739:	41 c6 47 01 05       	movb   $0x5,0x1(%r15)
   1d73e:	b0 01                	mov    $0x1,%al
   1d740:	e9 f9 00 00 00       	jmp    1d83e <<hyperinterval::ieee::Format>::sqrt+0x6ee>
   1d745:	b8 01 00 00 00       	mov    $0x1,%eax
   1d74a:	44 29 f0             	sub    %r14d,%eax
   1d74d:	41 39 c3             	cmp    %eax,%r11d
   1d750:	0f 8d 88 00 00 00    	jge    1d7de <<hyperinterval::ieee::Format>::sqrt+0x68e>
   1d756:	41 01 de             	add    %ebx,%r14d
   1d759:	41 fe ce             	dec    %r14b
   1d75c:	44 89 f1             	mov    %r14d,%ecx
   1d75f:	48 d3 e7             	shl    %cl,%rdi
   1d762:	31 c0                	xor    %eax,%eax
   1d764:	41 f6 c6 40          	test   $0x40,%r14b
   1d768:	48 0f 44 c7          	cmove  %rdi,%rax
   1d76c:	e9 c3 00 00 00       	jmp    1d834 <<hyperinterval::ieee::Format>::sqrt+0x6e4>
   1d771:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1d776:	89 e9                	mov    %ebp,%ecx
   1d778:	44 29 c1             	sub    %r8d,%ecx
   1d77b:	89 c8                	mov    %ecx,%eax
   1d77d:	f7 d8                	neg    %eax
   1d77f:	4d 89 e2             	mov    %r12,%r10
   1d782:	49 d3 e2             	shl    %cl,%r10
   1d785:	4c 89 5c 24 08       	mov    %r11,0x8(%rsp)
   1d78a:	45 31 db             	xor    %r11d,%r11d
   1d78d:	f6 c1 40             	test   $0x40,%cl
   1d790:	4d 0f 44 da          	cmove  %r10,%r11
   1d794:	89 c1                	mov    %eax,%ecx
   1d796:	49 0f ad f4          	shrd   %cl,%rsi,%r12
   1d79a:	48 d3 ee             	shr    %cl,%rsi
   1d79d:	a8 40                	test   $0x40,%al
   1d79f:	49 0f 44 f4          	cmove  %r12,%rsi
   1d7a3:	44 39 c5             	cmp    %r8d,%ebp
   1d7a6:	49 0f 43 f3          	cmovae %r11,%rsi
   1d7aa:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
   1d7af:	45 01 f1             	add    %r14d,%r9d
   1d7b2:	49 63 c1             	movslq %r9d,%rax
   1d7b5:	44 89 e9             	mov    %r13d,%ecx
   1d7b8:	48 d3 e0             	shl    %cl,%rax
   1d7bb:	49 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%r8
   1d7c2:	49 d3 e0             	shl    %cl,%r8
   1d7c5:	49 f7 d0             	not    %r8
   1d7c8:	49 21 f0             	and    %rsi,%r8
   1d7cb:	49 09 c0             	or     %rax,%r8
   1d7ce:	48 89 f8             	mov    %rdi,%rax
   1d7d1:	48 09 d0             	or     %rdx,%rax
   1d7d4:	0f 85 3d ff ff ff    	jne    1d717 <<hyperinterval::ieee::Format>::sqrt+0x5c7>
   1d7da:	31 c0                	xor    %eax,%eax
   1d7dc:	eb 56                	jmp    1d834 <<hyperinterval::ieee::Format>::sqrt+0x6e4>
   1d7de:	4c 89 db             	mov    %r11,%rbx
   1d7e1:	4c 8b 5c 24 10       	mov    0x10(%rsp),%r11
   1d7e6:	44 89 d9             	mov    %r11d,%ecx
   1d7e9:	29 f1                	sub    %esi,%ecx
   1d7eb:	89 c8                	mov    %ecx,%eax
   1d7ed:	f7 d8                	neg    %eax
   1d7ef:	49 89 f9             	mov    %rdi,%r9
   1d7f2:	49 d3 e1             	shl    %cl,%r9
   1d7f5:	45 31 d2             	xor    %r10d,%r10d
   1d7f8:	f6 c1 40             	test   $0x40,%cl
   1d7fb:	4d 0f 44 d1          	cmove  %r9,%r10
   1d7ff:	89 c1                	mov    %eax,%ecx
   1d801:	48 0f ad d7          	shrd   %cl,%rdx,%rdi
   1d805:	48 d3 ea             	shr    %cl,%rdx
   1d808:	a8 40                	test   $0x40,%al
   1d80a:	48 0f 44 d7          	cmove  %rdi,%rdx
   1d80e:	41 39 f3             	cmp    %esi,%r11d
   1d811:	49 0f 43 d2          	cmovae %r10,%rdx
   1d815:	44 01 f3             	add    %r14d,%ebx
   1d818:	48 63 f3             	movslq %ebx,%rsi
   1d81b:	44 89 e9             	mov    %r13d,%ecx
   1d81e:	48 d3 e6             	shl    %cl,%rsi
   1d821:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   1d828:	48 d3 e0             	shl    %cl,%rax
   1d82b:	48 f7 d0             	not    %rax
   1d82e:	48 21 d0             	and    %rdx,%rax
   1d831:	48 09 f0             	or     %rsi,%rax
   1d834:	4d 89 47 08          	mov    %r8,0x8(%r15)
   1d838:	49 89 47 10          	mov    %rax,0x10(%r15)
   1d83c:	31 c0                	xor    %eax,%eax
   1d83e:	41 88 07             	mov    %al,(%r15)
   1d841:	4c 89 f8             	mov    %r15,%rax
   1d844:	48 83 c4 38          	add    $0x38,%rsp
   1d848:	5b                   	pop    %rbx
   1d849:	41 5c                	pop    %r12
   1d84b:	41 5d                	pop    %r13
   1d84d:	41 5e                	pop    %r14
   1d84f:	41 5f                	pop    %r15
   1d851:	5d                   	pop    %rbp
   1d852:	c3                   	ret
   1d853:	cc                   	int3
   1d854:	cc                   	int3
   1d855:	cc                   	int3
   1d856:	cc                   	int3
   1d857:	cc                   	int3
   1d858:	cc                   	int3
   1d859:	cc                   	int3
   1d85a:	cc                   	int3
   1d85b:	cc                   	int3
   1d85c:	cc                   	int3
   1d85d:	cc                   	int3
   1d85e:	cc                   	int3
   1d85f:	cc                   	int3

<hyperinterval::ieee::Format>::power:
   1d860:	55                   	push   %rbp
   1d861:	41 57                	push   %r15
   1d863:	41 56                	push   %r14
   1d865:	41 55                	push   %r13
   1d867:	41 54                	push   %r12
   1d869:	53                   	push   %rbx
   1d86a:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
   1d871:	49 89 cb             	mov    %rcx,%r11
   1d874:	49 89 d6             	mov    %rdx,%r14
   1d877:	48 85 f1             	test   %rsi,%rcx
   1d87a:	41 0f 95 c1          	setne  %r9b
   1d87e:	b8 40 00 00 00       	mov    $0x40,%eax
   1d883:	f3 48 0f bc c2       	tzcnt  %rdx,%rax
   1d888:	41 89 c2             	mov    %eax,%r10d
   1d88b:	41 83 e2 3f          	and    $0x3f,%r10d
   1d88f:	44 89 d1             	mov    %r10d,%ecx
   1d892:	48 d3 ea             	shr    %cl,%rdx
   1d895:	48 89 d1             	mov    %rdx,%rcx
   1d898:	48 d1 e9             	shr    $1,%rcx
   1d89b:	48 63 d9             	movslq %ecx,%rbx
   1d89e:	44 89 d1             	mov    %r10d,%ecx
   1d8a1:	48 d3 e3             	shl    %cl,%rbx
   1d8a4:	45 85 c0             	test   %r8d,%r8d
   1d8a7:	0f 84 46 03 00 00    	je     1dbf3 <<hyperinterval::ieee::Format>::power+0x393>
   1d8ad:	44 88 4c 24 03       	mov    %r9b,0x3(%rsp)
   1d8b2:	48 89 7c 24 48       	mov    %rdi,0x48(%rsp)
   1d8b7:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1d8bd:	44 89 d1             	mov    %r10d,%ecx
   1d8c0:	49 d3 e1             	shl    %cl,%r9
   1d8c3:	48 8d 4e ff          	lea    -0x1(%rsi),%rcx
   1d8c7:	49 21 cb             	and    %rcx,%r11
   1d8ca:	48 89 d9             	mov    %rbx,%rcx
   1d8cd:	4d 8d 79 ff          	lea    -0x1(%r9),%r15
   1d8d1:	8d 2c 42             	lea    (%rdx,%rax,2),%ebp
   1d8d4:	83 e5 fe             	and    $0xfffffffe,%ebp
   1d8d7:	ba 02 00 00 00       	mov    $0x2,%edx
   1d8dc:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1d8e1:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1d8e6:	44 89 44 24 68       	mov    %r8d,0x68(%rsp)
   1d8eb:	44 89 c3             	mov    %r8d,%ebx
   1d8ee:	4c 89 5c 24 58       	mov    %r11,0x58(%rsp)
   1d8f3:	4c 89 5c 24 60       	mov    %r11,0x60(%rsp)
   1d8f8:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
   1d8fd:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   1d902:	4c 89 8c 24 80 00 00 	mov    %r9,0x80(%rsp)
   1d909:	00 
   1d90a:	4c 89 54 24 78       	mov    %r10,0x78(%rsp)
   1d90f:	4c 89 7c 24 70       	mov    %r15,0x70(%rsp)
   1d914:	89 6c 24 6c          	mov    %ebp,0x6c(%rsp)
   1d918:	f6 c3 01             	test   $0x1,%bl
   1d91b:	0f 84 a4 01 00 00    	je     1dac5 <<hyperinterval::ieee::Format>::power+0x265>
   1d921:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   1d928:	0f 1f 84 00 00 00 00 
   1d92f:	00 
   1d930:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
   1d934:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1d939:	48 89 d0             	mov    %rdx,%rax
   1d93c:	4c 21 f0             	and    %r14,%rax
   1d93f:	44 89 d1             	mov    %r10d,%ecx
   1d942:	48 d3 e8             	shr    %cl,%rax
   1d945:	48 89 d1             	mov    %rdx,%rcx
   1d948:	4c 21 f9             	and    %r15,%rcx
   1d94b:	48 85 c0             	test   %rax,%rax
   1d94e:	41 89 c3             	mov    %eax,%r11d
   1d951:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1d957:	45 0f 44 d8          	cmove  %r8d,%r11d
   1d95b:	49 0f 45 c1          	cmovne %r9,%rax
   1d95f:	48 09 c8             	or     %rcx,%rax
   1d962:	48 85 f2             	test   %rsi,%rdx
   1d965:	0f 95 44 24 08       	setne  0x8(%rsp)
   1d96a:	4c 8b 6c 24 60       	mov    0x60(%rsp),%r13
   1d96f:	4c 89 eb             	mov    %r13,%rbx
   1d972:	4c 21 f3             	and    %r14,%rbx
   1d975:	44 89 d1             	mov    %r10d,%ecx
   1d978:	48 d3 eb             	shr    %cl,%rbx
   1d97b:	4c 89 e9             	mov    %r13,%rcx
   1d97e:	4c 21 f9             	and    %r15,%rcx
   1d981:	48 85 db             	test   %rbx,%rbx
   1d984:	41 89 d8             	mov    %ebx,%r8d
   1d987:	ba 01 00 00 00       	mov    $0x1,%edx
   1d98c:	44 0f 44 c2          	cmove  %edx,%r8d
   1d990:	49 0f 45 d9          	cmovne %r9,%rbx
   1d994:	48 09 cb             	or     %rcx,%rbx
   1d997:	49 85 f5             	test   %rsi,%r13
   1d99a:	0f 95 c1             	setne  %cl
   1d99d:	32 4c 24 08          	xor    0x8(%rsp),%cl
   1d9a1:	48 f7 e3             	mul    %rbx
   1d9a4:	41 29 e8             	sub    %ebp,%r8d
   1d9a7:	45 01 d8             	add    %r11d,%r8d
   1d9aa:	88 4c 24 24          	mov    %cl,0x24(%rsp)
   1d9ae:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1d9b3:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1d9b8:	44 89 44 24 20       	mov    %r8d,0x20(%rsp)
   1d9bd:	4c 89 f2             	mov    %r14,%rdx
   1d9c0:	4c 89 e1             	mov    %r12,%rcx
   1d9c3:	49 89 fd             	mov    %rdi,%r13
   1d9c6:	4d 89 cc             	mov    %r9,%r12
   1d9c9:	48 89 f3             	mov    %rsi,%rbx
   1d9cc:	4c 89 f5             	mov    %r14,%rbp
   1d9cf:	4d 89 d6             	mov    %r10,%r14
   1d9d2:	e8 89 02 00 00       	call   1dc60 <<hyperinterval::ieee::Format>::rounded>
   1d9d7:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   1d9dc:	0f 85 00 02 00 00    	jne    1dbe2 <<hyperinterval::ieee::Format>::power+0x382>
   1d9e2:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
   1d9e7:	48 89 d0             	mov    %rdx,%rax
   1d9ea:	48 21 e8             	and    %rbp,%rax
   1d9ed:	44 89 f1             	mov    %r14d,%ecx
   1d9f0:	48 d3 e8             	shr    %cl,%rax
   1d9f3:	48 89 d1             	mov    %rdx,%rcx
   1d9f6:	4c 21 f9             	and    %r15,%rcx
   1d9f9:	48 85 c0             	test   %rax,%rax
   1d9fc:	89 c6                	mov    %eax,%esi
   1d9fe:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1da04:	41 0f 44 f2          	cmove  %r10d,%esi
   1da08:	49 0f 45 c4          	cmovne %r12,%rax
   1da0c:	48 09 c8             	or     %rcx,%rax
   1da0f:	48 85 da             	test   %rbx,%rdx
   1da12:	0f 95 c2             	setne  %dl
   1da15:	4c 8b 4c 24 58       	mov    0x58(%rsp),%r9
   1da1a:	4c 89 cf             	mov    %r9,%rdi
   1da1d:	48 21 ef             	and    %rbp,%rdi
   1da20:	44 89 f1             	mov    %r14d,%ecx
   1da23:	48 d3 ef             	shr    %cl,%rdi
   1da26:	4c 89 c9             	mov    %r9,%rcx
   1da29:	4c 21 f9             	and    %r15,%rcx
   1da2c:	48 85 ff             	test   %rdi,%rdi
   1da2f:	41 89 f8             	mov    %edi,%r8d
   1da32:	45 0f 44 c2          	cmove  %r10d,%r8d
   1da36:	49 0f 45 fc          	cmovne %r12,%rdi
   1da3a:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
   1da3f:	4c 89 54 24 08       	mov    %r10,0x8(%rsp)
   1da44:	48 09 cf             	or     %rcx,%rdi
   1da47:	49 85 d9             	test   %rbx,%r9
   1da4a:	0f 95 c1             	setne  %cl
   1da4d:	30 d1                	xor    %dl,%cl
   1da4f:	48 f7 e7             	mul    %rdi
   1da52:	4d 89 ef             	mov    %r13,%r15
   1da55:	44 8b 6c 24 6c       	mov    0x6c(%rsp),%r13d
   1da5a:	45 29 e8             	sub    %r13d,%r8d
   1da5d:	41 01 f0             	add    %esi,%r8d
   1da60:	88 4c 24 24          	mov    %cl,0x24(%rsp)
   1da64:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1da69:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1da6e:	44 89 44 24 20       	mov    %r8d,0x20(%rsp)
   1da73:	4c 89 ff             	mov    %r15,%rdi
   1da76:	48 89 de             	mov    %rbx,%rsi
   1da79:	48 89 ea             	mov    %rbp,%rdx
   1da7c:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1da81:	4c 89 e1             	mov    %r12,%rcx
   1da84:	e8 d7 01 00 00       	call   1dc60 <<hyperinterval::ieee::Format>::rounded>
   1da89:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   1da8e:	0f 84 4e 01 00 00    	je     1dbe2 <<hyperinterval::ieee::Format>::power+0x382>
   1da94:	48 89 de             	mov    %rbx,%rsi
   1da97:	49 89 ee             	mov    %rbp,%r14
   1da9a:	44 89 ed             	mov    %r13d,%ebp
   1da9d:	4c 89 ff             	mov    %r15,%rdi
   1daa0:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1daa5:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1daaa:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1dab1:	00 
   1dab2:	4c 8b 54 24 78       	mov    0x78(%rsp),%r10
   1dab7:	4c 8b 7c 24 70       	mov    0x70(%rsp),%r15
   1dabc:	ba 02 00 00 00       	mov    $0x2,%edx
   1dac1:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
   1dac5:	d1 eb                	shr    $1,%ebx
   1dac7:	0f 84 6c 01 00 00    	je     1dc39 <<hyperinterval::ieee::Format>::power+0x3d9>
   1dacd:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
   1dad1:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   1dad6:	4c 89 c0             	mov    %r8,%rax
   1dad9:	4c 21 f0             	and    %r14,%rax
   1dadc:	44 89 d1             	mov    %r10d,%ecx
   1dadf:	48 d3 e8             	shr    %cl,%rax
   1dae2:	4d 21 f8             	and    %r15,%r8
   1dae5:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
   1dae8:	48 85 c0             	test   %rax,%rax
   1daeb:	49 0f 45 c1          	cmovne %r9,%rax
   1daef:	0f 44 ca             	cmove  %edx,%ecx
   1daf2:	4c 09 c0             	or     %r8,%rax
   1daf5:	48 f7 e0             	mul    %rax
   1daf8:	29 e9                	sub    %ebp,%ecx
   1dafa:	c6 44 24 24 00       	movb   $0x0,0x24(%rsp)
   1daff:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1db04:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1db09:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   1db0d:	4c 89 f2             	mov    %r14,%rdx
   1db10:	4c 89 e1             	mov    %r12,%rcx
   1db13:	41 89 ed             	mov    %ebp,%r13d
   1db16:	4d 89 cc             	mov    %r9,%r12
   1db19:	4c 89 fb             	mov    %r15,%rbx
   1db1c:	49 89 f7             	mov    %rsi,%r15
   1db1f:	4c 89 f5             	mov    %r14,%rbp
   1db22:	4d 89 d6             	mov    %r10,%r14
   1db25:	e8 36 01 00 00       	call   1dc60 <<hyperinterval::ieee::Format>::rounded>
   1db2a:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   1db2f:	0f 85 ad 00 00 00    	jne    1dbe2 <<hyperinterval::ieee::Format>::power+0x382>
   1db35:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
   1db3a:	48 89 d0             	mov    %rdx,%rax
   1db3d:	48 21 e8             	and    %rbp,%rax
   1db40:	44 89 f1             	mov    %r14d,%ecx
   1db43:	48 d3 e8             	shr    %cl,%rax
   1db46:	48 21 da             	and    %rbx,%rdx
   1db49:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
   1db4c:	48 85 c0             	test   %rax,%rax
   1db4f:	49 0f 45 c4          	cmovne %r12,%rax
   1db53:	be 02 00 00 00       	mov    $0x2,%esi
   1db58:	0f 44 ce             	cmove  %esi,%ecx
   1db5b:	48 09 d0             	or     %rdx,%rax
   1db5e:	48 f7 e0             	mul    %rax
   1db61:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
   1db66:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   1db6b:	44 29 e9             	sub    %r13d,%ecx
   1db6e:	c6 44 24 24 00       	movb   $0x0,0x24(%rsp)
   1db73:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1db78:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1db7d:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   1db81:	48 8d 5c 24 30       	lea    0x30(%rsp),%rbx
   1db86:	48 89 df             	mov    %rbx,%rdi
   1db89:	4c 89 fe             	mov    %r15,%rsi
   1db8c:	48 89 ea             	mov    %rbp,%rdx
   1db8f:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1db94:	4c 89 e1             	mov    %r12,%rcx
   1db97:	e8 c4 00 00 00       	call   1dc60 <<hyperinterval::ieee::Format>::rounded>
   1db9c:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   1dba1:	ba 02 00 00 00       	mov    $0x2,%edx
   1dba6:	74 3a                	je     1dbe2 <<hyperinterval::ieee::Format>::power+0x382>
   1dba8:	4c 89 fe             	mov    %r15,%rsi
   1dbab:	49 89 ee             	mov    %rbp,%r14
   1dbae:	44 89 ed             	mov    %r13d,%ebp
   1dbb1:	48 89 df             	mov    %rbx,%rdi
   1dbb4:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1dbb9:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1dbbe:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1dbc5:	00 
   1dbc6:	4c 8b 54 24 78       	mov    0x78(%rsp),%r10
   1dbcb:	4c 8b 7c 24 70       	mov    0x70(%rsp),%r15
   1dbd0:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
   1dbd4:	f6 c3 01             	test   $0x1,%bl
   1dbd7:	0f 85 53 fd ff ff    	jne    1d930 <<hyperinterval::ieee::Format>::power+0xd0>
   1dbdd:	e9 e3 fe ff ff       	jmp    1dac5 <<hyperinterval::ieee::Format>::power+0x265>
   1dbe2:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   1dbe7:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
   1dbec:	88 47 01             	mov    %al,0x1(%rdi)
   1dbef:	b0 01                	mov    $0x1,%al
   1dbf1:	eb 2f                	jmp    1dc22 <<hyperinterval::ieee::Format>::power+0x3c2>
   1dbf3:	48 89 d9             	mov    %rbx,%rcx
   1dbf6:	45 20 c1             	and    %r8b,%r9b
   1dbf9:	74 1d                	je     1dc18 <<hyperinterval::ieee::Format>::power+0x3b8>
   1dbfb:	48 89 d8             	mov    %rbx,%rax
   1dbfe:	48 31 f0             	xor    %rsi,%rax
   1dc01:	48 85 db             	test   %rbx,%rbx
   1dc04:	48 0f 44 c3          	cmove  %rbx,%rax
   1dc08:	48 31 ce             	xor    %rcx,%rsi
   1dc0b:	48 85 c9             	test   %rcx,%rcx
   1dc0e:	48 0f 44 f1          	cmove  %rcx,%rsi
   1dc12:	48 89 c1             	mov    %rax,%rcx
   1dc15:	48 89 f3             	mov    %rsi,%rbx
   1dc18:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1dc1c:	48 89 5f 10          	mov    %rbx,0x10(%rdi)
   1dc20:	31 c0                	xor    %eax,%eax
   1dc22:	88 07                	mov    %al,(%rdi)
   1dc24:	48 89 f8             	mov    %rdi,%rax
   1dc27:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
   1dc2e:	5b                   	pop    %rbx
   1dc2f:	41 5c                	pop    %r12
   1dc31:	41 5d                	pop    %r13
   1dc33:	41 5e                	pop    %r14
   1dc35:	41 5f                	pop    %r15
   1dc37:	5d                   	pop    %rbp
   1dc38:	c3                   	ret
   1dc39:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
   1dc3e:	44 8b 44 24 68       	mov    0x68(%rsp),%r8d
   1dc43:	44 0f b6 4c 24 03    	movzbl 0x3(%rsp),%r9d
   1dc49:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
   1dc4e:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1dc53:	45 20 c1             	and    %r8b,%r9b
   1dc56:	75 a3                	jne    1dbfb <<hyperinterval::ieee::Format>::power+0x39b>
   1dc58:	eb be                	jmp    1dc18 <<hyperinterval::ieee::Format>::power+0x3b8>
   1dc5a:	cc                   	int3
   1dc5b:	cc                   	int3
   1dc5c:	cc                   	int3
   1dc5d:	cc                   	int3
   1dc5e:	cc                   	int3
   1dc5f:	cc                   	int3

<hyperinterval::ieee::Format>::rounded:
   1dc60:	48 89 c8             	mov    %rcx,%rax
   1dc63:	4c 8b 11             	mov    (%rcx),%r10
   1dc66:	4c 8b 59 08          	mov    0x8(%rcx),%r11
   1dc6a:	4c 89 d1             	mov    %r10,%rcx
   1dc6d:	4c 09 d9             	or     %r11,%rcx
   1dc70:	0f 84 f6 00 00 00    	je     1dd6c <<hyperinterval::ieee::Format>::rounded+0x10c>
   1dc76:	55                   	push   %rbp
   1dc77:	41 57                	push   %r15
   1dc79:	41 56                	push   %r14
   1dc7b:	41 55                	push   %r13
   1dc7d:	41 54                	push   %r12
   1dc7f:	53                   	push   %rbx
   1dc80:	8b 68 10             	mov    0x10(%rax),%ebp
   1dc83:	49 0f bd cb          	bsr    %r11,%rcx
   1dc87:	83 f1 3f             	xor    $0x3f,%ecx
   1dc8a:	4d 0f bd f2          	bsr    %r10,%r14
   1dc8e:	41 83 f6 3f          	xor    $0x3f,%r14d
   1dc92:	41 83 ce 40          	or     $0x40,%r14d
   1dc96:	4d 85 db             	test   %r11,%r11
   1dc99:	44 0f 45 f1          	cmovne %ecx,%r14d
   1dc9d:	bb 40 00 00 00       	mov    $0x40,%ebx
   1dca2:	f3 48 0f bc da       	tzcnt  %rdx,%rbx
   1dca7:	41 89 d8             	mov    %ebx,%r8d
   1dcaa:	41 83 e0 3f          	and    $0x3f,%r8d
   1dcae:	44 89 c1             	mov    %r8d,%ecx
   1dcb1:	48 d3 ea             	shr    %cl,%rdx
   1dcb4:	41 83 f6 7f          	xor    $0x7f,%r14d
   1dcb8:	41 01 ee             	add    %ebp,%r14d
   1dcbb:	48 d1 ea             	shr    $1,%rdx
   1dcbe:	41 39 d6             	cmp    %edx,%r14d
   1dcc1:	0f 8f 9a 01 00 00    	jg     1de61 <<hyperinterval::ieee::Format>::rounded+0x201>
   1dcc7:	44 8d 2c 13          	lea    (%rbx,%rdx,1),%r13d
   1dccb:	b9 01 00 00 00       	mov    $0x1,%ecx
   1dcd0:	44 29 e9             	sub    %r13d,%ecx
   1dcd3:	41 29 de             	sub    %ebx,%r14d
   1dcd6:	41 39 ce             	cmp    %ecx,%r14d
   1dcd9:	44 0f 4e f1          	cmovle %ecx,%r14d
   1dcdd:	44 89 f1             	mov    %r14d,%ecx
   1dce0:	29 e9                	sub    %ebp,%ecx
   1dce2:	83 f9 7f             	cmp    $0x7f,%ecx
   1dce5:	0f 8e 8c 00 00 00    	jle    1dd77 <<hyperinterval::ieee::Format>::rounded+0x117>
   1dceb:	41 b4 01             	mov    $0x1,%r12b
   1dcee:	45 31 ff             	xor    %r15d,%r15d
   1dcf1:	45 31 db             	xor    %r11d,%r11d
   1dcf4:	45 31 d2             	xor    %r10d,%r10d
   1dcf7:	45 0f b6 e4          	movzbl %r12b,%r12d
   1dcfb:	4d 01 fc             	add    %r15,%r12
   1dcfe:	49 83 d3 00          	adc    $0x0,%r11
   1dd02:	4c 89 e1             	mov    %r12,%rcx
   1dd05:	4c 09 d9             	or     %r11,%rcx
   1dd08:	0f 84 d2 00 00 00    	je     1dde0 <<hyperinterval::ieee::Format>::rounded+0x180>
   1dd0e:	49 0f bd cb          	bsr    %r11,%rcx
   1dd12:	83 f1 3f             	xor    $0x3f,%ecx
   1dd15:	4d 0f bd fc          	bsr    %r12,%r15
   1dd19:	41 83 f7 3f          	xor    $0x3f,%r15d
   1dd1d:	41 83 cf 40          	or     $0x40,%r15d
   1dd21:	4d 85 db             	test   %r11,%r11
   1dd24:	44 0f 45 f9          	cmovne %ecx,%r15d
   1dd28:	41 83 f7 7f          	xor    $0x7f,%r15d
   1dd2c:	43 8d 2c 37          	lea    (%r15,%r14,1),%ebp
   1dd30:	39 d5                	cmp    %edx,%ebp
   1dd32:	0f 8f 29 01 00 00    	jg     1de61 <<hyperinterval::ieee::Format>::rounded+0x201>
   1dd38:	b9 01 00 00 00       	mov    $0x1,%ecx
   1dd3d:	29 d1                	sub    %edx,%ecx
   1dd3f:	39 cd                	cmp    %ecx,%ebp
   1dd41:	0f 8d 59 01 00 00    	jge    1dea0 <<hyperinterval::ieee::Format>::rounded+0x240>
   1dd47:	45 01 f5             	add    %r14d,%r13d
   1dd4a:	41 fe cd             	dec    %r13b
   1dd4d:	44 89 e9             	mov    %r13d,%ecx
   1dd50:	49 d3 e4             	shl    %cl,%r12
   1dd53:	31 d2                	xor    %edx,%edx
   1dd55:	41 f6 c5 40          	test   $0x40,%r13b
   1dd59:	49 0f 44 d4          	cmove  %r12,%rdx
   1dd5d:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1dd61:	0f 84 81 00 00 00    	je     1dde8 <<hyperinterval::ieee::Format>::rounded+0x188>
   1dd67:	e9 99 00 00 00       	jmp    1de05 <<hyperinterval::ieee::Format>::rounded+0x1a5>
   1dd6c:	c6 07 00             	movb   $0x0,(%rdi)
   1dd6f:	0f 57 c0             	xorps  %xmm0,%xmm0
   1dd72:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1dd76:	c3                   	ret
   1dd77:	85 c9                	test   %ecx,%ecx
   1dd79:	4c 89 6c 24 f0       	mov    %r13,-0x10(%rsp)
   1dd7e:	0f 8e 8e 00 00 00    	jle    1de12 <<hyperinterval::ieee::Format>::rounded+0x1b2>
   1dd84:	4d 89 d7             	mov    %r10,%r15
   1dd87:	4d 0f ad df          	shrd   %cl,%r11,%r15
   1dd8b:	4d 89 dd             	mov    %r11,%r13
   1dd8e:	49 d3 ed             	shr    %cl,%r13
   1dd91:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
   1dd98:	49 d3 e4             	shl    %cl,%r12
   1dd9b:	48 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%rbp
   1dda2:	45 31 c9             	xor    %r9d,%r9d
   1dda5:	f6 c1 40             	test   $0x40,%cl
   1dda8:	4d 0f 45 fd          	cmovne %r13,%r15
   1ddac:	4d 0f 45 e9          	cmovne %r9,%r13
   1ddb0:	49 0f 45 ec          	cmovne %r12,%rbp
   1ddb4:	4d 0f 45 e1          	cmovne %r9,%r12
   1ddb8:	49 f7 d4             	not    %r12
   1ddbb:	48 f7 d5             	not    %rbp
   1ddbe:	4c 21 dd             	and    %r11,%rbp
   1ddc1:	4d 21 d4             	and    %r10,%r12
   1ddc4:	49 09 ec             	or     %rbp,%r12
   1ddc7:	41 0f 95 c4          	setne  %r12b
   1ddcb:	4d 89 eb             	mov    %r13,%r11
   1ddce:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1ddd3:	4c 89 f9             	mov    %r15,%rcx
   1ddd6:	4c 09 d9             	or     %r11,%rcx
   1ddd9:	75 60                	jne    1de3b <<hyperinterval::ieee::Format>::rounded+0x1db>
   1dddb:	e9 0e ff ff ff       	jmp    1dcee <<hyperinterval::ieee::Format>::rounded+0x8e>
   1dde0:	31 d2                	xor    %edx,%edx
   1dde2:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1dde6:	75 1d                	jne    1de05 <<hyperinterval::ieee::Format>::rounded+0x1a5>
   1dde8:	48 89 d0             	mov    %rdx,%rax
   1ddeb:	48 31 f0             	xor    %rsi,%rax
   1ddee:	48 85 d2             	test   %rdx,%rdx
   1ddf1:	48 0f 44 c2          	cmove  %rdx,%rax
   1ddf5:	4c 31 d6             	xor    %r10,%rsi
   1ddf8:	4d 85 d2             	test   %r10,%r10
   1ddfb:	49 0f 44 f2          	cmove  %r10,%rsi
   1ddff:	49 89 c2             	mov    %rax,%r10
   1de02:	48 89 f2             	mov    %rsi,%rdx
   1de05:	4c 89 57 08          	mov    %r10,0x8(%rdi)
   1de09:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   1de0d:	c6 07 00             	movb   $0x0,(%rdi)
   1de10:	eb 54                	jmp    1de66 <<hyperinterval::ieee::Format>::rounded+0x206>
   1de12:	f6 d9                	neg    %cl
   1de14:	4d 0f a5 d3          	shld   %cl,%r10,%r11
   1de18:	49 d3 e2             	shl    %cl,%r10
   1de1b:	45 31 e4             	xor    %r12d,%r12d
   1de1e:	f6 c1 40             	test   $0x40,%cl
   1de21:	4d 0f 45 da          	cmovne %r10,%r11
   1de25:	41 bf 00 00 00 00    	mov    $0x0,%r15d
   1de2b:	4d 0f 44 fa          	cmove  %r10,%r15
   1de2f:	4c 89 f9             	mov    %r15,%rcx
   1de32:	4c 09 d9             	or     %r11,%rcx
   1de35:	0f 84 b3 fe ff ff    	je     1dcee <<hyperinterval::ieee::Format>::rounded+0x8e>
   1de3b:	49 0f bd cb          	bsr    %r11,%rcx
   1de3f:	83 f1 3f             	xor    $0x3f,%ecx
   1de42:	4d 0f bd ef          	bsr    %r15,%r13
   1de46:	41 83 f5 3f          	xor    $0x3f,%r13d
   1de4a:	41 83 cd 40          	or     $0x40,%r13d
   1de4e:	4d 85 db             	test   %r11,%r11
   1de51:	44 0f 45 e9          	cmovne %ecx,%r13d
   1de55:	41 83 f5 7f          	xor    $0x7f,%r13d
   1de59:	43 8d 2c 2e          	lea    (%r14,%r13,1),%ebp
   1de5d:	39 d5                	cmp    %edx,%ebp
   1de5f:	7e 10                	jle    1de71 <<hyperinterval::ieee::Format>::rounded+0x211>
   1de61:	66 c7 07 01 05       	movw   $0x501,(%rdi)
   1de66:	5b                   	pop    %rbx
   1de67:	41 5c                	pop    %r12
   1de69:	41 5d                	pop    %r13
   1de6b:	41 5e                	pop    %r14
   1de6d:	41 5f                	pop    %r15
   1de6f:	5d                   	pop    %rbp
   1de70:	c3                   	ret
   1de71:	b9 01 00 00 00       	mov    $0x1,%ecx
   1de76:	29 d1                	sub    %edx,%ecx
   1de78:	39 cd                	cmp    %ecx,%ebp
   1de7a:	0f 8d 81 00 00 00    	jge    1df01 <<hyperinterval::ieee::Format>::rounded+0x2a1>
   1de80:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1de85:	43 8d 0c 2e          	lea    (%r14,%r13,1),%ecx
   1de89:	fe c9                	dec    %cl
   1de8b:	4d 89 f9             	mov    %r15,%r9
   1de8e:	49 d3 e1             	shl    %cl,%r9
   1de91:	45 31 d2             	xor    %r10d,%r10d
   1de94:	f6 c1 40             	test   $0x40,%cl
   1de97:	4d 0f 44 d1          	cmove  %r9,%r10
   1de9b:	e9 57 fe ff ff       	jmp    1dcf7 <<hyperinterval::ieee::Format>::rounded+0x97>
   1dea0:	89 d9                	mov    %ebx,%ecx
   1dea2:	44 29 f9             	sub    %r15d,%ecx
   1dea5:	41 89 c9             	mov    %ecx,%r9d
   1dea8:	41 f7 d9             	neg    %r9d
   1deab:	4d 89 e6             	mov    %r12,%r14
   1deae:	49 d3 e6             	shl    %cl,%r14
   1deb1:	45 31 ed             	xor    %r13d,%r13d
   1deb4:	f6 c1 40             	test   $0x40,%cl
   1deb7:	4d 0f 44 ee          	cmove  %r14,%r13
   1debb:	44 89 c9             	mov    %r9d,%ecx
   1debe:	4d 0f ad dc          	shrd   %cl,%r11,%r12
   1dec2:	49 d3 eb             	shr    %cl,%r11
   1dec5:	41 f6 c1 40          	test   $0x40,%r9b
   1dec9:	4d 0f 44 dc          	cmove  %r12,%r11
   1decd:	44 39 fb             	cmp    %r15d,%ebx
   1ded0:	4d 0f 43 dd          	cmovae %r13,%r11
   1ded4:	01 d5                	add    %edx,%ebp
   1ded6:	4c 63 cd             	movslq %ebp,%r9
   1ded9:	44 89 c1             	mov    %r8d,%ecx
   1dedc:	49 d3 e1             	shl    %cl,%r9
   1dedf:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
   1dee6:	48 d3 e2             	shl    %cl,%rdx
   1dee9:	48 f7 d2             	not    %rdx
   1deec:	4c 21 da             	and    %r11,%rdx
   1deef:	4c 09 ca             	or     %r9,%rdx
   1def2:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1def6:	0f 85 09 ff ff ff    	jne    1de05 <<hyperinterval::ieee::Format>::rounded+0x1a5>
   1defc:	e9 e7 fe ff ff       	jmp    1dde8 <<hyperinterval::ieee::Format>::rounded+0x188>
   1df01:	89 d9                	mov    %ebx,%ecx
   1df03:	44 29 e9             	sub    %r13d,%ecx
   1df06:	4d 89 f9             	mov    %r15,%r9
   1df09:	49 d3 e1             	shl    %cl,%r9
   1df0c:	41 89 ca             	mov    %ecx,%r10d
   1df0f:	41 f7 da             	neg    %r10d
   1df12:	48 c7 44 24 e8 00 00 	movq   $0x0,-0x18(%rsp)
   1df19:	00 00 
   1df1b:	f6 c1 40             	test   $0x40,%cl
   1df1e:	48 8b 4c 24 e8       	mov    -0x18(%rsp),%rcx
   1df23:	49 0f 44 c9          	cmove  %r9,%rcx
   1df27:	48 89 4c 24 e8       	mov    %rcx,-0x18(%rsp)
   1df2c:	4d 89 f9             	mov    %r15,%r9
   1df2f:	44 89 d1             	mov    %r10d,%ecx
   1df32:	4d 0f ad d9          	shrd   %cl,%r11,%r9
   1df36:	4c 89 4c 24 f8       	mov    %r9,-0x8(%rsp)
   1df3b:	4d 89 d9             	mov    %r11,%r9
   1df3e:	49 d3 e9             	shr    %cl,%r9
   1df41:	41 f6 c2 40          	test   $0x40,%r10b
   1df45:	4c 0f 44 4c 24 f8    	cmove  -0x8(%rsp),%r9
   1df4b:	44 39 eb             	cmp    %r13d,%ebx
   1df4e:	4c 0f 43 4c 24 e8    	cmovae -0x18(%rsp),%r9
   1df54:	01 d5                	add    %edx,%ebp
   1df56:	4c 63 ed             	movslq %ebp,%r13
   1df59:	44 89 c1             	mov    %r8d,%ecx
   1df5c:	49 d3 e5             	shl    %cl,%r13
   1df5f:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
   1df66:	49 d3 e2             	shl    %cl,%r10
   1df69:	49 f7 d2             	not    %r10
   1df6c:	4d 21 ca             	and    %r9,%r10
   1df6f:	4d 09 ea             	or     %r13,%r10
   1df72:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1df77:	e9 7b fd ff ff       	jmp    1dcf7 <<hyperinterval::ieee::Format>::rounded+0x97>
   1df7c:	cc                   	int3
   1df7d:	cc                   	int3
   1df7e:	cc                   	int3
   1df7f:	cc                   	int3

<hyperinterval::ieee::Format>::add_wide:
   1df80:	55                   	push   %rbp
   1df81:	41 57                	push   %r15
   1df83:	41 56                	push   %r14
   1df85:	41 55                	push   %r13
   1df87:	41 54                	push   %r12
   1df89:	53                   	push   %rbx
   1df8a:	48 83 ec 48          	sub    $0x48,%rsp
   1df8e:	4c 8b 29             	mov    (%rcx),%r13
   1df91:	48 8b 69 08          	mov    0x8(%rcx),%rbp
   1df95:	4c 89 e8             	mov    %r13,%rax
   1df98:	48 09 e8             	or     %rbp,%rax
   1df9b:	0f 84 a1 00 00 00    	je     1e042 <<hyperinterval::ieee::Format>::add_wide+0xc2>
   1dfa1:	4d 8b 18             	mov    (%r8),%r11
   1dfa4:	4d 8b 50 08          	mov    0x8(%r8),%r10
   1dfa8:	4c 89 d8             	mov    %r11,%rax
   1dfab:	4c 09 d0             	or     %r10,%rax
   1dfae:	0f 84 91 00 00 00    	je     1e045 <<hyperinterval::ieee::Format>::add_wide+0xc5>
   1dfb4:	48 89 cb             	mov    %rcx,%rbx
   1dfb7:	8b 49 10             	mov    0x10(%rcx),%ecx
   1dfba:	48 0f bd c5          	bsr    %rbp,%rax
   1dfbe:	83 f0 3f             	xor    $0x3f,%eax
   1dfc1:	4d 0f bd f5          	bsr    %r13,%r14
   1dfc5:	41 83 f6 3f          	xor    $0x3f,%r14d
   1dfc9:	41 83 ce 40          	or     $0x40,%r14d
   1dfcd:	48 85 ed             	test   %rbp,%rbp
   1dfd0:	44 0f 45 f0          	cmovne %eax,%r14d
   1dfd4:	41 83 f6 7f          	xor    $0x7f,%r14d
   1dfd8:	41 01 ce             	add    %ecx,%r14d
   1dfdb:	41 8b 40 10          	mov    0x10(%r8),%eax
   1dfdf:	4d 0f bd fa          	bsr    %r10,%r15
   1dfe3:	41 83 f7 3f          	xor    $0x3f,%r15d
   1dfe7:	4d 0f bd cb          	bsr    %r11,%r9
   1dfeb:	41 83 f1 3f          	xor    $0x3f,%r9d
   1dfef:	41 83 c9 40          	or     $0x40,%r9d
   1dff3:	4d 85 d2             	test   %r10,%r10
   1dff6:	45 0f 45 cf          	cmovne %r15d,%r9d
   1dffa:	41 83 f1 7f          	xor    $0x7f,%r9d
   1dffe:	41 01 c1             	add    %eax,%r9d
   1e001:	45 39 f1             	cmp    %r14d,%r9d
   1e004:	45 0f 4e ce          	cmovle %r14d,%r9d
   1e008:	41 83 c1 82          	add    $0xffffff82,%r9d
   1e00c:	0f b6 5b 14          	movzbl 0x14(%rbx),%ebx
   1e010:	88 5c 24 07          	mov    %bl,0x7(%rsp)
   1e014:	44 29 c9             	sub    %r9d,%ecx
   1e017:	78 3f                	js     1e058 <<hyperinterval::ieee::Format>::add_wide+0xd8>
   1e019:	4c 0f a5 ed          	shld   %cl,%r13,%rbp
   1e01d:	49 d3 e5             	shl    %cl,%r13
   1e020:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   1e027:	00 00 
   1e029:	f6 c1 40             	test   $0x40,%cl
   1e02c:	49 0f 45 ed          	cmovne %r13,%rbp
   1e030:	41 be 00 00 00 00    	mov    $0x0,%r14d
   1e036:	4d 0f 44 f5          	cmove  %r13,%r14
   1e03a:	49 89 ec             	mov    %rbp,%r12
   1e03d:	e9 91 00 00 00       	jmp    1e0d3 <<hyperinterval::ieee::Format>::add_wide+0x153>
   1e042:	4c 89 c1             	mov    %r8,%rcx
   1e045:	48 83 c4 48          	add    $0x48,%rsp
   1e049:	5b                   	pop    %rbx
   1e04a:	41 5c                	pop    %r12
   1e04c:	41 5d                	pop    %r13
   1e04e:	41 5e                	pop    %r14
   1e050:	41 5f                	pop    %r15
   1e052:	5d                   	pop    %rbp
   1e053:	e9 08 fc ff ff       	jmp    1dc60 <<hyperinterval::ieee::Format>::rounded>
   1e058:	f7 d9                	neg    %ecx
   1e05a:	41 be 00 00 00 00    	mov    $0x0,%r14d
   1e060:	41 bc 00 00 00 00    	mov    $0x0,%r12d
   1e066:	83 f9 7f             	cmp    $0x7f,%ecx
   1e069:	7f 56                	jg     1e0c1 <<hyperinterval::ieee::Format>::add_wide+0x141>
   1e06b:	4d 89 ee             	mov    %r13,%r14
   1e06e:	49 0f ad ee          	shrd   %cl,%rbp,%r14
   1e072:	49 89 ec             	mov    %rbp,%r12
   1e075:	49 d3 ec             	shr    %cl,%r12
   1e078:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
   1e07f:	48 d3 e3             	shl    %cl,%rbx
   1e082:	49 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%r15
   1e089:	f6 c1 40             	test   $0x40,%cl
   1e08c:	4d 0f 45 f4          	cmovne %r12,%r14
   1e090:	b9 00 00 00 00       	mov    $0x0,%ecx
   1e095:	4c 0f 45 e1          	cmovne %rcx,%r12
   1e099:	4c 0f 45 fb          	cmovne %rbx,%r15
   1e09d:	b9 00 00 00 00       	mov    $0x0,%ecx
   1e0a2:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   1e0a7:	b9 00 00 00 00       	mov    $0x0,%ecx
   1e0ac:	48 0f 45 d9          	cmovne %rcx,%rbx
   1e0b0:	48 f7 d3             	not    %rbx
   1e0b3:	49 f7 d7             	not    %r15
   1e0b6:	49 21 ef             	and    %rbp,%r15
   1e0b9:	4c 21 eb             	and    %r13,%rbx
   1e0bc:	4c 09 fb             	or     %r15,%rbx
   1e0bf:	74 12                	je     1e0d3 <<hyperinterval::ieee::Format>::add_wide+0x153>
   1e0c1:	0f b6 4c 24 07       	movzbl 0x7(%rsp),%ecx
   1e0c6:	83 e1 01             	and    $0x1,%ecx
   1e0c9:	f7 d9                	neg    %ecx
   1e0cb:	83 c9 01             	or     $0x1,%ecx
   1e0ce:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   1e0d3:	45 0f b6 40 14       	movzbl 0x14(%r8),%r8d
   1e0d8:	44 29 c8             	sub    %r9d,%eax
   1e0db:	78 21                	js     1e0fe <<hyperinterval::ieee::Format>::add_wide+0x17e>
   1e0dd:	89 c1                	mov    %eax,%ecx
   1e0df:	4d 0f a5 da          	shld   %cl,%r11,%r10
   1e0e3:	49 d3 e3             	shl    %cl,%r11
   1e0e6:	45 31 ed             	xor    %r13d,%r13d
   1e0e9:	a8 40                	test   $0x40,%al
   1e0eb:	4d 0f 45 d3          	cmovne %r11,%r10
   1e0ef:	41 bf 00 00 00 00    	mov    $0x0,%r15d
   1e0f5:	4d 0f 44 fb          	cmove  %r11,%r15
   1e0f9:	4c 89 d3             	mov    %r10,%rbx
   1e0fc:	eb 67                	jmp    1e165 <<hyperinterval::ieee::Format>::add_wide+0x1e5>
   1e0fe:	f7 d8                	neg    %eax
   1e100:	45 31 ed             	xor    %r13d,%r13d
   1e103:	41 bf 00 00 00 00    	mov    $0x0,%r15d
   1e109:	bb 00 00 00 00       	mov    $0x0,%ebx
   1e10e:	83 f8 7f             	cmp    $0x7f,%eax
   1e111:	7f 43                	jg     1e156 <<hyperinterval::ieee::Format>::add_wide+0x1d6>
   1e113:	4d 89 df             	mov    %r11,%r15
   1e116:	89 c1                	mov    %eax,%ecx
   1e118:	4d 0f ad d7          	shrd   %cl,%r10,%r15
   1e11c:	4c 89 d3             	mov    %r10,%rbx
   1e11f:	48 d3 eb             	shr    %cl,%rbx
   1e122:	48 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%rbp
   1e129:	48 d3 e5             	shl    %cl,%rbp
   1e12c:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
   1e133:	a8 40                	test   $0x40,%al
   1e135:	4c 0f 45 fb          	cmovne %rbx,%r15
   1e139:	49 0f 45 dd          	cmovne %r13,%rbx
   1e13d:	48 0f 45 cd          	cmovne %rbp,%rcx
   1e141:	49 0f 45 ed          	cmovne %r13,%rbp
   1e145:	48 f7 d5             	not    %rbp
   1e148:	48 f7 d1             	not    %rcx
   1e14b:	4c 21 d1             	and    %r10,%rcx
   1e14e:	4c 21 dd             	and    %r11,%rbp
   1e151:	48 09 cd             	or     %rcx,%rbp
   1e154:	74 0f                	je     1e165 <<hyperinterval::ieee::Format>::add_wide+0x1e5>
   1e156:	45 0f b6 e8          	movzbl %r8b,%r13d
   1e15a:	41 83 e5 01          	and    $0x1,%r13d
   1e15e:	41 f7 dd             	neg    %r13d
   1e161:	41 83 cd 01          	or     $0x1,%r13d
   1e165:	0f b6 4c 24 07       	movzbl 0x7(%rsp),%ecx
   1e16a:	44 38 c1             	cmp    %r8b,%cl
   1e16d:	48 89 fd             	mov    %rdi,%rbp
   1e170:	75 08                	jne    1e17a <<hyperinterval::ieee::Format>::add_wide+0x1fa>
   1e172:	4d 01 f7             	add    %r14,%r15
   1e175:	4c 11 e3             	adc    %r12,%rbx
   1e178:	eb 22                	jmp    1e19c <<hyperinterval::ieee::Format>::add_wide+0x21c>
   1e17a:	4d 39 fe             	cmp    %r15,%r14
   1e17d:	4c 89 e0             	mov    %r12,%rax
   1e180:	48 19 d8             	sbb    %rbx,%rax
   1e183:	73 0b                	jae    1e190 <<hyperinterval::ieee::Format>::add_wide+0x210>
   1e185:	4d 29 f7             	sub    %r14,%r15
   1e188:	4c 19 e3             	sbb    %r12,%rbx
   1e18b:	44 89 c1             	mov    %r8d,%ecx
   1e18e:	eb 0c                	jmp    1e19c <<hyperinterval::ieee::Format>::add_wide+0x21c>
   1e190:	4d 29 fe             	sub    %r15,%r14
   1e193:	49 19 dc             	sbb    %rbx,%r12
   1e196:	4d 89 f7             	mov    %r14,%r15
   1e199:	4c 89 e3             	mov    %r12,%rbx
   1e19c:	88 4c 24 24          	mov    %cl,0x24(%rsp)
   1e1a0:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
   1e1a5:	4c 89 7c 24 10       	mov    %r15,0x10(%rsp)
   1e1aa:	44 89 4c 24 20       	mov    %r9d,0x20(%rsp)
   1e1af:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1e1b4:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1e1b9:	49 89 f7             	mov    %rsi,%r15
   1e1bc:	48 89 d3             	mov    %rdx,%rbx
   1e1bf:	e8 9c fa ff ff       	call   1dc60 <<hyperinterval::ieee::Format>::rounded>
   1e1c4:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   1e1c9:	75 11                	jne    1e1dc <<hyperinterval::ieee::Format>::add_wide+0x25c>
   1e1cb:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   1e1d0:	88 45 01             	mov    %al,0x1(%rbp)
   1e1d3:	c6 45 00 01          	movb   $0x1,0x0(%rbp)
   1e1d7:	e9 80 00 00 00       	jmp    1e25c <<hyperinterval::ieee::Format>::add_wide+0x2dc>
   1e1dc:	4c 8b 74 24 38       	mov    0x38(%rsp),%r14
   1e1e1:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1e1e6:	49 39 c6             	cmp    %rax,%r14
   1e1e9:	48 89 e9             	mov    %rbp,%rcx
   1e1ec:	75 63                	jne    1e251 <<hyperinterval::ieee::Format>::add_wide+0x2d1>
   1e1ee:	44 03 6c 24 08       	add    0x8(%rsp),%r13d
   1e1f3:	41 83 fd 01          	cmp    $0x1,%r13d
   1e1f7:	74 72                	je     1e26b <<hyperinterval::ieee::Format>::add_wide+0x2eb>
   1e1f9:	41 83 fd ff          	cmp    $0xffffffff,%r13d
   1e1fd:	75 52                	jne    1e251 <<hyperinterval::ieee::Format>::add_wide+0x2d1>
   1e1ff:	4c 89 f0             	mov    %r14,%rax
   1e202:	4c 89 fe             	mov    %r15,%rsi
   1e205:	4c 31 f8             	xor    %r15,%rax
   1e208:	4d 85 f6             	test   %r14,%r14
   1e20b:	49 0f 44 c6          	cmove  %r14,%rax
   1e20f:	48 89 c1             	mov    %rax,%rcx
   1e212:	4c 21 f9             	and    %r15,%rcx
   1e215:	31 d2                	xor    %edx,%edx
   1e217:	48 f7 d9             	neg    %rcx
   1e21a:	0f 93 c2             	setae  %dl
   1e21d:	48 8d 0c 50          	lea    (%rax,%rdx,2),%rcx
   1e221:	48 ff c9             	dec    %rcx
   1e224:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1e229:	48 89 da             	mov    %rbx,%rdx
   1e22c:	e8 1f e7 ff ff       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1e231:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1e236:	75 5f                	jne    1e297 <<hyperinterval::ieee::Format>::add_wide+0x317>
   1e238:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1e23d:	49 31 c7             	xor    %rax,%r15
   1e240:	48 85 c0             	test   %rax,%rax
   1e243:	4c 0f 44 f8          	cmove  %rax,%r15
   1e247:	4c 89 7d 08          	mov    %r15,0x8(%rbp)
   1e24b:	4c 89 75 10          	mov    %r14,0x10(%rbp)
   1e24f:	eb 5b                	jmp    1e2ac <<hyperinterval::ieee::Format>::add_wide+0x32c>
   1e251:	4c 89 71 08          	mov    %r14,0x8(%rcx)
   1e255:	48 89 41 10          	mov    %rax,0x10(%rcx)
   1e259:	c6 01 00             	movb   $0x0,(%rcx)
   1e25c:	48 83 c4 48          	add    $0x48,%rsp
   1e260:	5b                   	pop    %rbx
   1e261:	41 5c                	pop    %r12
   1e263:	41 5d                	pop    %r13
   1e265:	41 5e                	pop    %r14
   1e267:	41 5f                	pop    %r15
   1e269:	5d                   	pop    %rbp
   1e26a:	c3                   	ret
   1e26b:	4c 89 fe             	mov    %r15,%rsi
   1e26e:	48 89 da             	mov    %rbx,%rdx
   1e271:	4c 89 f0             	mov    %r14,%rax
   1e274:	4c 21 f8             	and    %r15,%rax
   1e277:	31 c9                	xor    %ecx,%ecx
   1e279:	48 f7 d8             	neg    %rax
   1e27c:	0f 93 c1             	setae  %cl
   1e27f:	49 8d 0c 4e          	lea    (%r14,%rcx,2),%rcx
   1e283:	48 ff c9             	dec    %rcx
   1e286:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1e28b:	e8 c0 e6 ff ff       	call   1c950 <<hyperinterval::ieee::Format>::finite>
   1e290:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1e295:	74 08                	je     1e29f <<hyperinterval::ieee::Format>::add_wide+0x31f>
   1e297:	66 c7 45 00 01 05    	movw   $0x501,0x0(%rbp)
   1e29d:	eb bd                	jmp    1e25c <<hyperinterval::ieee::Format>::add_wide+0x2dc>
   1e29f:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1e2a4:	4c 89 75 08          	mov    %r14,0x8(%rbp)
   1e2a8:	48 89 45 10          	mov    %rax,0x10(%rbp)
   1e2ac:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
   1e2b0:	eb aa                	jmp    1e25c <<hyperinterval::ieee::Format>::add_wide+0x2dc>
   1e2b2:	cc                   	int3
   1e2b3:	cc                   	int3
   1e2b4:	cc                   	int3
   1e2b5:	cc                   	int3
   1e2b6:	cc                   	int3
   1e2b7:	cc                   	int3
   1e2b8:	cc                   	int3
   1e2b9:	cc                   	int3
   1e2ba:	cc                   	int3
   1e2bb:	cc                   	int3
   1e2bc:	cc                   	int3
   1e2bd:	cc                   	int3
   1e2be:	cc                   	int3
   1e2bf:	cc                   	int3

<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::hull:
   1e2c0:	89 f8                	mov    %edi,%eax
   1e2c2:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1e2c7:	41 89 c0             	mov    %eax,%r8d
   1e2ca:	41 09 f8             	or     %edi,%r8d
   1e2cd:	41 89 c1             	mov    %eax,%r9d
   1e2d0:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1e2d7:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1e2dd:	45 29 ca             	sub    %r9d,%r10d
   1e2e0:	85 c0                	test   %eax,%eax
   1e2e2:	4d 0f 49 d0          	cmovns %r8,%r10
   1e2e6:	41 89 d0             	mov    %edx,%r8d
   1e2e9:	41 09 f8             	or     %edi,%r8d
   1e2ec:	41 89 d1             	mov    %edx,%r9d
   1e2ef:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1e2f6:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1e2fc:	45 29 cb             	sub    %r9d,%r11d
   1e2ff:	85 d2                	test   %edx,%edx
   1e301:	4d 0f 49 d8          	cmovns %r8,%r11
   1e305:	45 39 da             	cmp    %r11d,%r10d
   1e308:	0f 47 c2             	cmova  %edx,%eax
   1e30b:	89 f2                	mov    %esi,%edx
   1e30d:	09 fe                	or     %edi,%esi
   1e30f:	41 89 d0             	mov    %edx,%r8d
   1e312:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1e319:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1e31f:	45 29 c1             	sub    %r8d,%r9d
   1e322:	85 d2                	test   %edx,%edx
   1e324:	4c 0f 49 ce          	cmovns %rsi,%r9
   1e328:	89 ce                	mov    %ecx,%esi
   1e32a:	09 fe                	or     %edi,%esi
   1e32c:	41 89 c8             	mov    %ecx,%r8d
   1e32f:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1e336:	44 29 c7             	sub    %r8d,%edi
   1e339:	85 c9                	test   %ecx,%ecx
   1e33b:	48 0f 49 fe          	cmovns %rsi,%rdi
   1e33f:	41 39 f9             	cmp    %edi,%r9d
   1e342:	0f 42 d1             	cmovb  %ecx,%edx
   1e345:	c3                   	ret
   1e346:	cc                   	int3
   1e347:	cc                   	int3
   1e348:	cc                   	int3
   1e349:	cc                   	int3
   1e34a:	cc                   	int3
   1e34b:	cc                   	int3
   1e34c:	cc                   	int3
   1e34d:	cc                   	int3
   1e34e:	cc                   	int3
   1e34f:	cc                   	int3

<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::signs:
   1e350:	89 f9                	mov    %edi,%ecx
   1e352:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1e357:	4c 8d 04 01          	lea    (%rcx,%rax,1),%r8
   1e35b:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1e361:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1e367:	49 29 c9             	sub    %rcx,%r9
   1e36a:	85 ff                	test   %edi,%edi
   1e36c:	4d 0f 49 c8          	cmovns %r8,%r9
   1e370:	89 d7                	mov    %edx,%edi
   1e372:	4c 8d 04 07          	lea    (%rdi,%rax,1),%r8
   1e376:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1e37c:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   1e381:	48 29 f9             	sub    %rdi,%rcx
   1e384:	85 d2                	test   %edx,%edx
   1e386:	49 0f 49 c8          	cmovns %r8,%rcx
   1e38a:	89 f7                	mov    %esi,%edi
   1e38c:	48 8d 14 07          	lea    (%rdi,%rax,1),%rdx
   1e390:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1e396:	48 29 f8             	sub    %rdi,%rax
   1e399:	45 31 c0             	xor    %r8d,%r8d
   1e39c:	49 39 c9             	cmp    %rcx,%r9
   1e39f:	40 0f 92 c7          	setb   %dil
   1e3a3:	77 1e                	ja     1e3c3 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary32>>::signs+0x73>
   1e3a5:	85 f6                	test   %esi,%esi
   1e3a7:	49 89 d1             	mov    %rdx,%r9
   1e3aa:	4c 0f 48 c8          	cmovs  %rax,%r9
   1e3ae:	44 8d 57 02          	lea    0x2(%rdi),%r10d
   1e3b2:	4c 39 c9             	cmp    %r9,%rcx
   1e3b5:	45 0f b6 ca          	movzbl %r10b,%r9d
   1e3b9:	41 88 f8             	mov    %dil,%r8b
   1e3bc:	45 0f 46 c1          	cmovbe %r9d,%r8d
   1e3c0:	44 89 c7             	mov    %r8d,%edi
   1e3c3:	85 f6                	test   %esi,%esi
   1e3c5:	48 0f 48 d0          	cmovs  %rax,%rdx
   1e3c9:	8d 47 04             	lea    0x4(%rdi),%eax
   1e3cc:	39 ca                	cmp    %ecx,%edx
   1e3ce:	40 0f b6 cf          	movzbl %dil,%ecx
   1e3d2:	0f b6 c0             	movzbl %al,%eax
   1e3d5:	0f 46 c1             	cmovbe %ecx,%eax
   1e3d8:	c3                   	ret
   1e3d9:	cc                   	int3
   1e3da:	cc                   	int3
   1e3db:	cc                   	int3
   1e3dc:	cc                   	int3
   1e3dd:	cc                   	int3
   1e3de:	cc                   	int3
   1e3df:	cc                   	int3

<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::hull:
   1e3e0:	53                   	push   %rbx
   1e3e1:	49 89 d0             	mov    %rdx,%r8
   1e3e4:	48 89 f2             	mov    %rsi,%rdx
   1e3e7:	48 89 f8             	mov    %rdi,%rax
   1e3ea:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1e3f1:	00 00 80 
   1e3f4:	4c 8d 0c 37          	lea    (%rdi,%rsi,1),%r9
   1e3f8:	48 8d 7e ff          	lea    -0x1(%rsi),%rdi
   1e3fc:	49 89 c2             	mov    %rax,%r10
   1e3ff:	49 21 fa             	and    %rdi,%r10
   1e402:	49 89 f3             	mov    %rsi,%r11
   1e405:	4d 29 d3             	sub    %r10,%r11
   1e408:	48 85 c0             	test   %rax,%rax
   1e40b:	4d 0f 49 d9          	cmovns %r9,%r11
   1e40f:	4d 8d 0c 30          	lea    (%r8,%rsi,1),%r9
   1e413:	4d 89 c2             	mov    %r8,%r10
   1e416:	49 21 fa             	and    %rdi,%r10
   1e419:	48 89 f3             	mov    %rsi,%rbx
   1e41c:	4c 29 d3             	sub    %r10,%rbx
   1e41f:	4d 85 c0             	test   %r8,%r8
   1e422:	49 0f 49 d9          	cmovns %r9,%rbx
   1e426:	49 39 db             	cmp    %rbx,%r11
   1e429:	49 0f 47 c0          	cmova  %r8,%rax
   1e42d:	4c 8d 04 32          	lea    (%rdx,%rsi,1),%r8
   1e431:	49 89 d1             	mov    %rdx,%r9
   1e434:	49 21 f9             	and    %rdi,%r9
   1e437:	49 89 f2             	mov    %rsi,%r10
   1e43a:	4d 29 ca             	sub    %r9,%r10
   1e43d:	48 85 d2             	test   %rdx,%rdx
   1e440:	4d 0f 49 d0          	cmovns %r8,%r10
   1e444:	4c 8d 04 31          	lea    (%rcx,%rsi,1),%r8
   1e448:	48 21 cf             	and    %rcx,%rdi
   1e44b:	48 29 fe             	sub    %rdi,%rsi
   1e44e:	48 85 c9             	test   %rcx,%rcx
   1e451:	49 0f 49 f0          	cmovns %r8,%rsi
   1e455:	49 39 f2             	cmp    %rsi,%r10
   1e458:	48 0f 42 d1          	cmovb  %rcx,%rdx
   1e45c:	5b                   	pop    %rbx
   1e45d:	c3                   	ret
   1e45e:	cc                   	int3
   1e45f:	cc                   	int3

<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::signs:
   1e460:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1e467:	00 00 80 
   1e46a:	48 8d 0c 07          	lea    (%rdi,%rax,1),%rcx
   1e46e:	4c 8d 40 ff          	lea    -0x1(%rax),%r8
   1e472:	49 89 f9             	mov    %rdi,%r9
   1e475:	4d 21 c1             	and    %r8,%r9
   1e478:	49 89 c2             	mov    %rax,%r10
   1e47b:	4d 29 ca             	sub    %r9,%r10
   1e47e:	48 85 ff             	test   %rdi,%rdi
   1e481:	4c 0f 49 d1          	cmovns %rcx,%r10
   1e485:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1e489:	49 89 d1             	mov    %rdx,%r9
   1e48c:	4d 21 c1             	and    %r8,%r9
   1e48f:	48 89 c1             	mov    %rax,%rcx
   1e492:	4c 29 c9             	sub    %r9,%rcx
   1e495:	48 85 d2             	test   %rdx,%rdx
   1e498:	48 0f 49 cf          	cmovns %rdi,%rcx
   1e49c:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1e4a0:	49 21 f0             	and    %rsi,%r8
   1e4a3:	4c 29 c0             	sub    %r8,%rax
   1e4a6:	45 31 c0             	xor    %r8d,%r8d
   1e4a9:	49 39 ca             	cmp    %rcx,%r10
   1e4ac:	40 0f 92 c7          	setb   %dil
   1e4b0:	77 1f                	ja     1e4d1 <<hyperinterval::bounds::Bounds<hyperinterval::float::Binary64>>::signs+0x71>
   1e4b2:	48 85 f6             	test   %rsi,%rsi
   1e4b5:	49 89 d1             	mov    %rdx,%r9
   1e4b8:	4c 0f 48 c8          	cmovs  %rax,%r9
   1e4bc:	44 8d 57 02          	lea    0x2(%rdi),%r10d
   1e4c0:	4c 39 c9             	cmp    %r9,%rcx
   1e4c3:	45 0f b6 ca          	movzbl %r10b,%r9d
   1e4c7:	41 88 f8             	mov    %dil,%r8b
   1e4ca:	45 0f 46 c1          	cmovbe %r9d,%r8d
   1e4ce:	44 89 c7             	mov    %r8d,%edi
   1e4d1:	48 85 f6             	test   %rsi,%rsi
   1e4d4:	48 0f 48 d0          	cmovs  %rax,%rdx
   1e4d8:	8d 47 04             	lea    0x4(%rdi),%eax
   1e4db:	48 39 ca             	cmp    %rcx,%rdx
   1e4de:	40 0f b6 cf          	movzbl %dil,%ecx
   1e4e2:	0f b6 c0             	movzbl %al,%eax
   1e4e5:	0f 46 c1             	cmovbe %ecx,%eax
   1e4e8:	c3                   	ret
   1e4e9:	cc                   	int3
   1e4ea:	cc                   	int3
   1e4eb:	cc                   	int3
   1e4ec:	cc                   	int3
   1e4ed:	cc                   	int3
   1e4ee:	cc                   	int3
   1e4ef:	cc                   	int3

__udivti3:
   5a470:	49 89 d0             	mov    %rdx,%r8
   5a473:	48 85 c9             	test   %rcx,%rcx
   5a476:	74 76                	je     5a4ee <__udivti3+0x7e>
   5a478:	53                   	push   %rbx
   5a479:	4c 0f bd c9          	bsr    %rcx,%r9
   5a47d:	44 89 ca             	mov    %r9d,%edx
   5a480:	83 f2 3f             	xor    $0x3f,%edx
   5a483:	b0 40                	mov    $0x40,%al
   5a485:	28 d0                	sub    %dl,%al
   5a487:	4c 89 c2             	mov    %r8,%rdx
   5a48a:	49 89 cb             	mov    %rcx,%r11
   5a48d:	89 c1                	mov    %eax,%ecx
   5a48f:	4c 0f ad da          	shrd   %cl,%r11,%rdx
   5a493:	4d 89 da             	mov    %r11,%r10
   5a496:	49 d3 ea             	shr    %cl,%r10
   5a499:	a8 40                	test   $0x40,%al
   5a49b:	4c 0f 44 d2          	cmove  %rdx,%r10
   5a49f:	48 89 f8             	mov    %rdi,%rax
   5a4a2:	48 0f ac f0 01       	shrd   $0x1,%rsi,%rax
   5a4a7:	48 89 f2             	mov    %rsi,%rdx
   5a4aa:	48 d1 ea             	shr    $1,%rdx
   5a4ad:	49 f7 f2             	div    %r10
   5a4b0:	49 89 c2             	mov    %rax,%r10
   5a4b3:	44 89 c9             	mov    %r9d,%ecx
   5a4b6:	49 d3 ea             	shr    %cl,%r10
   5a4b9:	31 c9                	xor    %ecx,%ecx
   5a4bb:	49 83 ea 01          	sub    $0x1,%r10
   5a4bf:	4c 0f 42 d1          	cmovb  %rcx,%r10
   5a4c3:	4c 89 db             	mov    %r11,%rbx
   5a4c6:	4c 89 c0             	mov    %r8,%rax
   5a4c9:	49 f7 e2             	mul    %r10
   5a4cc:	49 89 c1             	mov    %rax,%r9
   5a4cf:	4c 89 d0             	mov    %r10,%rax
   5a4d2:	49 0f af da          	imul   %r10,%rbx
   5a4d6:	48 01 da             	add    %rbx,%rdx
   5a4d9:	4c 29 cf             	sub    %r9,%rdi
   5a4dc:	48 19 d6             	sbb    %rdx,%rsi
   5a4df:	4c 39 c7             	cmp    %r8,%rdi
   5a4e2:	4c 19 de             	sbb    %r11,%rsi
   5a4e5:	48 83 d8 ff          	sbb    $0xffffffffffffffff,%rax
   5a4e9:	5b                   	pop    %rbx
   5a4ea:	48 89 ca             	mov    %rcx,%rdx
   5a4ed:	c3                   	ret
   5a4ee:	4c 39 c6             	cmp    %r8,%rsi
   5a4f1:	73 0f                	jae    5a502 <__udivti3+0x92>
   5a4f3:	48 89 f8             	mov    %rdi,%rax
   5a4f6:	48 89 f2             	mov    %rsi,%rdx
   5a4f9:	49 f7 f0             	div    %r8
   5a4fc:	31 c9                	xor    %ecx,%ecx
   5a4fe:	48 89 ca             	mov    %rcx,%rdx
   5a501:	c3                   	ret
   5a502:	48 89 f0             	mov    %rsi,%rax
   5a505:	4c 09 c0             	or     %r8,%rax
   5a508:	48 c1 e8 20          	shr    $0x20,%rax
   5a50c:	74 15                	je     5a523 <__udivti3+0xb3>
   5a50e:	48 89 f0             	mov    %rsi,%rax
   5a511:	31 d2                	xor    %edx,%edx
   5a513:	49 f7 f0             	div    %r8
   5a516:	48 89 c1             	mov    %rax,%rcx
   5a519:	48 89 f8             	mov    %rdi,%rax
   5a51c:	49 f7 f0             	div    %r8
   5a51f:	48 89 ca             	mov    %rcx,%rdx
   5a522:	c3                   	ret
   5a523:	89 f0                	mov    %esi,%eax
   5a525:	31 d2                	xor    %edx,%edx
   5a527:	41 f7 f0             	div    %r8d
   5a52a:	89 c1                	mov    %eax,%ecx
   5a52c:	48 89 f8             	mov    %rdi,%rax
   5a52f:	49 f7 f0             	div    %r8
   5a532:	48 89 ca             	mov    %rcx,%rdx
   5a535:	c3                   	ret

Disassembly of section .init:
