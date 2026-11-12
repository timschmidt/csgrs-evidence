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
    8b80:	ff 15 7a 7a 05 00    	call   *0x57a7a(%rip)        # 60600 <_GLOBAL_OFFSET_TABLE_+0x48>
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
    8bd0:	f2 0f 10 05 28 54 04 	movsd  0x45428(%rip),%xmm0        # 4e000 <_fini+0x904>
    8bd7:	00 
    8bd8:	f2 0f 10 0d 28 54 04 	movsd  0x45428(%rip),%xmm1        # 4e008 <_fini+0x90c>
    8bdf:	00 
    8be0:	ff 15 b2 82 05 00    	call   *0x582b2(%rip)        # 60e98 <_GLOBAL_OFFSET_TABLE_+0x8e0>
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
    8c30:	ff 15 c2 7e 05 00    	call   *0x57ec2(%rip)        # 60af8 <_GLOBAL_OFFSET_TABLE_+0x540>
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
    8c6c:	f2 0f 10 05 9c 53 04 	movsd  0x4539c(%rip),%xmm0        # 4e010 <_fini+0x914>
    8c73:	00 
    8c74:	ff 15 96 82 05 00    	call   *0x58296(%rip)        # 60f10 <_GLOBAL_OFFSET_TABLE_+0x958>
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
    8cb6:	ff 15 cc 7f 05 00    	call   *0x57fcc(%rip)        # 60c88 <_GLOBAL_OFFSET_TABLE_+0x6d0>
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
    8d07:	ff 15 93 7a 05 00    	call   *0x57a93(%rip)        # 607a0 <_GLOBAL_OFFSET_TABLE_+0x1e8>
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
    8d2d:	ff 15 5d 82 05 00    	call   *0x5825d(%rip)        # 60f90 <_GLOBAL_OFFSET_TABLE_+0x9d8>
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
    8d67:	f3 0f 10 05 c1 54 04 	movss  0x454c1(%rip),%xmm0        # 4e230 <_fini+0xb34>
    8d6e:	00 
    8d6f:	f3 0f 10 0d bd 54 04 	movss  0x454bd(%rip),%xmm1        # 4e234 <_fini+0xb38>
    8d76:	00 
    8d77:	ff 15 f3 80 05 00    	call   *0x580f3(%rip)        # 60e70 <_GLOBAL_OFFSET_TABLE_+0x8b8>
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
    8db1:	ff 15 01 81 05 00    	call   *0x58101(%rip)        # 60eb8 <_GLOBAL_OFFSET_TABLE_+0x900>
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
    8de2:	f3 0f 10 05 4e 54 04 	movss  0x4544e(%rip),%xmm0        # 4e238 <_fini+0xb3c>
    8de9:	00 
    8dea:	ff 15 a0 7b 05 00    	call   *0x57ba0(%rip)        # 60990 <_GLOBAL_OFFSET_TABLE_+0x3d8>
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
    8e25:	ff 15 ad 78 05 00    	call   *0x578ad(%rip)        # 606d8 <_GLOBAL_OFFSET_TABLE_+0x120>
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
    8e6b:	ff 15 0f 7e 05 00    	call   *0x57e0f(%rip)        # 60c80 <_GLOBAL_OFFSET_TABLE_+0x6c8>
    8e71:	48 89 d8             	mov    %rbx,%rax
    8e74:	48 83 c4 60          	add    $0x60,%rsp
    8e78:	5b                   	pop    %rbx
    8e79:	c3                   	ret
    8e7a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

hyperinterval_strict_sqrt32:
    8e80:	53                   	push   %rbx
    8e81:	48 83 ec 20          	sub    $0x20,%rsp
    8e85:	48 89 fb             	mov    %rdi,%rbx
    8e88:	48 8d 7c 24 14       	lea    0x14(%rsp),%rdi
    8e8d:	ff 15 fd 80 05 00    	call   *0x580fd(%rip)        # 60f90 <_GLOBAL_OFFSET_TABLE_+0x9d8>
    8e93:	8b 4c 24 14          	mov    0x14(%rsp),%ecx
    8e97:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
    8e9c:	83 f9 02             	cmp    $0x2,%ecx
    8e9f:	75 12                	jne    8eb3 <hyperinterval_strict_sqrt32+0x33>
    8ea1:	88 43 04             	mov    %al,0x4(%rbx)
    8ea4:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    8eaa:	48 89 d8             	mov    %rbx,%rax
    8ead:	48 83 c4 20          	add    $0x20,%rsp
    8eb1:	5b                   	pop    %rbx
    8eb2:	c3                   	ret
    8eb3:	8b 54 24 19          	mov    0x19(%rsp),%edx
    8eb7:	8b 74 24 1c          	mov    0x1c(%rsp),%esi
    8ebb:	89 74 24 10          	mov    %esi,0x10(%rsp)
    8ebf:	89 54 24 0d          	mov    %edx,0xd(%rsp)
    8ec3:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
    8ec7:	88 44 24 0c          	mov    %al,0xc(%rsp)
    8ecb:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
    8ed0:	48 89 df             	mov    %rbx,%rdi
    8ed3:	ff 15 8f 78 05 00    	call   *0x5788f(%rip)        # 60768 <_GLOBAL_OFFSET_TABLE_+0x1b0>
    8ed9:	48 89 d8             	mov    %rbx,%rax
    8edc:	48 83 c4 20          	add    $0x20,%rsp
    8ee0:	5b                   	pop    %rbx
    8ee1:	c3                   	ret
    8ee2:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    8ee9:	00 00 00 
    8eec:	0f 1f 40 00          	nopl   0x0(%rax)

hyperinterval_strict_sqrt64:
    8ef0:	53                   	push   %rbx
    8ef1:	48 83 ec 30          	sub    $0x30,%rsp
    8ef5:	48 89 fb             	mov    %rdi,%rbx
    8ef8:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
    8efd:	ff 15 fd 76 05 00    	call   *0x576fd(%rip)        # 60600 <_GLOBAL_OFFSET_TABLE_+0x48>
    8f03:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    8f08:	0f b6 44 24 20       	movzbl 0x20(%rsp),%eax
    8f0d:	48 83 f9 02          	cmp    $0x2,%rcx
    8f11:	75 13                	jne    8f26 <hyperinterval_strict_sqrt64+0x36>
    8f13:	88 43 08             	mov    %al,0x8(%rbx)
    8f16:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    8f1d:	48 89 d8             	mov    %rbx,%rax
    8f20:	48 83 c4 30          	add    $0x30,%rsp
    8f24:	5b                   	pop    %rbx
    8f25:	c3                   	ret
    8f26:	48 8b 54 24 21       	mov    0x21(%rsp),%rdx
    8f2b:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
    8f30:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
    8f35:	48 89 54 24 09       	mov    %rdx,0x9(%rsp)
    8f3a:	48 89 0c 24          	mov    %rcx,(%rsp)
    8f3e:	88 44 24 08          	mov    %al,0x8(%rsp)
    8f42:	48 89 e6             	mov    %rsp,%rsi
    8f45:	48 89 df             	mov    %rbx,%rdi
    8f48:	ff 15 4a 77 05 00    	call   *0x5774a(%rip)        # 60698 <_GLOBAL_OFFSET_TABLE_+0xe0>
    8f4e:	48 89 d8             	mov    %rbx,%rax
    8f51:	48 83 c4 30          	add    $0x30,%rsp
    8f55:	5b                   	pop    %rbx
    8f56:	c3                   	ret
    8f57:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    8f5e:	00 00 

hyperinterval_strict_surface32:
    9790:	55                   	push   %rbp
    9791:	41 57                	push   %r15
    9793:	41 56                	push   %r14
    9795:	41 55                	push   %r13
    9797:	41 54                	push   %r12
    9799:	53                   	push   %rbx
    979a:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
    97a1:	89 f5                	mov    %esi,%ebp
    97a3:	48 89 fb             	mov    %rdi,%rbx
    97a6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    97ab:	66 0f 7e 44 24 38    	movd   %xmm0,0x38(%rsp)
    97b1:	66 0f 7e 4c 24 54    	movd   %xmm1,0x54(%rsp)
    97b7:	ff 15 d3 77 05 00    	call   *0x577d3(%rip)        # 60f90 <_GLOBAL_OFFSET_TABLE_+0x9d8>
    97bd:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    97c1:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
    97c6:	83 f9 02             	cmp    $0x2,%ecx
    97c9:	75 0e                	jne    97d9 <hyperinterval_strict_surface32+0x49>
    97cb:	88 43 04             	mov    %al,0x4(%rbx)
    97ce:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    97d4:	e9 8a 00 00 00       	jmp    9863 <hyperinterval_strict_surface32+0xd3>
    97d9:	49 89 dd             	mov    %rbx,%r13
    97dc:	8b 54 24 0d          	mov    0xd(%rsp),%edx
    97e0:	8b 74 24 10          	mov    0x10(%rsp),%esi
    97e4:	89 74 24 44          	mov    %esi,0x44(%rsp)
    97e8:	89 54 24 41          	mov    %edx,0x41(%rsp)
    97ec:	89 4c 24 3c          	mov    %ecx,0x3c(%rsp)
    97f0:	88 44 24 40          	mov    %al,0x40(%rsp)
    97f4:	66 0f 6e 44 24 38    	movd   0x38(%rsp),%xmm0
    97fa:	ff 15 60 76 05 00    	call   *0x57660(%rip)        # 60e60 <_GLOBAL_OFFSET_TABLE_+0x8a8>
    9800:	48 89 c3             	mov    %rax,%rbx
    9803:	f6 c3 01             	test   $0x1,%bl
    9806:	74 0b                	je     9813 <hyperinterval_strict_surface32+0x83>
    9808:	4c 89 e8             	mov    %r13,%rax
    980b:	88 78 04             	mov    %bh,0x4(%rax)
    980e:	4c 89 eb             	mov    %r13,%rbx
    9811:	eb 48                	jmp    985b <hyperinterval_strict_surface32+0xcb>
    9813:	66 0f 6e 44 24 54    	movd   0x54(%rsp),%xmm0
    9819:	ff 15 d1 70 05 00    	call   *0x570d1(%rip)        # 608f0 <_GLOBAL_OFFSET_TABLE_+0x338>
    981f:	a8 01                	test   $0x1,%al
    9821:	74 08                	je     982b <hyperinterval_strict_surface32+0x9b>
    9823:	4c 89 eb             	mov    %r13,%rbx
    9826:	88 63 04             	mov    %ah,0x4(%rbx)
    9829:	eb 30                	jmp    985b <hyperinterval_strict_surface32+0xcb>
    982b:	48 c1 eb 20          	shr    $0x20,%rbx
    982f:	66 0f 6e c3          	movd   %ebx,%xmm0
    9833:	48 c1 e8 20          	shr    $0x20,%rax
    9837:	66 0f 6e c8          	movd   %eax,%xmm1
    983b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    9840:	ff 15 4a 77 05 00    	call   *0x5774a(%rip)        # 60f90 <_GLOBAL_OFFSET_TABLE_+0x9d8>
    9846:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    984a:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
    984f:	83 f9 02             	cmp    $0x2,%ecx
    9852:	75 24                	jne    9878 <hyperinterval_strict_surface32+0xe8>
    9854:	4c 89 eb             	mov    %r13,%rbx
    9857:	41 88 45 04          	mov    %al,0x4(%r13)
    985b:	41 c7 45 00 02 00 00 	movl   $0x2,0x0(%r13)
    9862:	00 
    9863:	48 89 d8             	mov    %rbx,%rax
    9866:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
    986d:	5b                   	pop    %rbx
    986e:	41 5c                	pop    %r12
    9870:	41 5d                	pop    %r13
    9872:	41 5e                	pop    %r14
    9874:	41 5f                	pop    %r15
    9876:	5d                   	pop    %rbp
    9877:	c3                   	ret
    9878:	8b 54 24 0d          	mov    0xd(%rsp),%edx
    987c:	8b 74 24 10          	mov    0x10(%rsp),%esi
    9880:	89 74 24 60          	mov    %esi,0x60(%rsp)
    9884:	89 54 24 5d          	mov    %edx,0x5d(%rsp)
    9888:	89 4c 24 58          	mov    %ecx,0x58(%rsp)
    988c:	88 44 24 5c          	mov    %al,0x5c(%rsp)
    9890:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    9895:	48 8d 74 24 3c       	lea    0x3c(%rsp),%rsi
    989a:	89 ea                	mov    %ebp,%edx
    989c:	ff 15 fe 76 05 00    	call   *0x576fe(%rip)        # 60fa0 <_GLOBAL_OFFSET_TABLE_+0x9e8>
    98a2:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    98a6:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
    98ab:	83 f9 02             	cmp    $0x2,%ecx
    98ae:	4c 89 eb             	mov    %r13,%rbx
    98b1:	0f 84 14 ff ff ff    	je     97cb <hyperinterval_strict_surface32+0x3b>
    98b7:	8b 54 24 0d          	mov    0xd(%rsp),%edx
    98bb:	8b 74 24 10          	mov    0x10(%rsp),%esi
    98bf:	89 74 24 78          	mov    %esi,0x78(%rsp)
    98c3:	89 54 24 75          	mov    %edx,0x75(%rsp)
    98c7:	89 4c 24 70          	mov    %ecx,0x70(%rsp)
    98cb:	88 44 24 74          	mov    %al,0x74(%rsp)
    98cf:	48 8d 7c 24 48       	lea    0x48(%rsp),%rdi
    98d4:	48 8d 74 24 70       	lea    0x70(%rsp),%rsi
    98d9:	ff 15 c1 6f 05 00    	call   *0x56fc1(%rip)        # 608a0 <_GLOBAL_OFFSET_TABLE_+0x2e8>
    98df:	8b 4c 24 48          	mov    0x48(%rsp),%ecx
    98e3:	0f b6 44 24 4c       	movzbl 0x4c(%rsp),%eax
    98e8:	83 f9 02             	cmp    $0x2,%ecx
    98eb:	0f 84 da fe ff ff    	je     97cb <hyperinterval_strict_surface32+0x3b>
    98f1:	8b 54 24 4d          	mov    0x4d(%rsp),%edx
    98f5:	8b 74 24 50          	mov    0x50(%rsp),%esi
    98f9:	89 74 24 34          	mov    %esi,0x34(%rsp)
    98fd:	89 54 24 31          	mov    %edx,0x31(%rsp)
    9901:	89 4c 24 2c          	mov    %ecx,0x2c(%rsp)
    9905:	88 44 24 30          	mov    %al,0x30(%rsp)
    9909:	48 8d 9c 24 9c 00 00 	lea    0x9c(%rsp),%rbx
    9910:	00 
    9911:	48 8d 74 24 2c       	lea    0x2c(%rsp),%rsi
    9916:	4c 8d 7c 24 58       	lea    0x58(%rsp),%r15
    991b:	48 89 df             	mov    %rbx,%rdi
    991e:	4c 89 fa             	mov    %r15,%rdx
    9921:	ff 15 39 74 05 00    	call   *0x57439(%rip)        # 60d60 <_GLOBAL_OFFSET_TABLE_+0x7a8>
    9927:	4c 8d 74 24 64       	lea    0x64(%rsp),%r14
    992c:	48 8d 54 24 3c       	lea    0x3c(%rsp),%rdx
    9931:	4c 89 f7             	mov    %r14,%rdi
    9934:	48 89 de             	mov    %rbx,%rsi
    9937:	ff 15 c3 6e 05 00    	call   *0x56ec3(%rip)        # 60800 <_GLOBAL_OFFSET_TABLE_+0x248>
    993d:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    9942:	4c 89 f6             	mov    %r14,%rsi
    9945:	ff 15 75 71 05 00    	call   *0x57175(%rip)        # 60ac0 <_GLOBAL_OFFSET_TABLE_+0x508>
    994b:	48 8d 7c 24 14       	lea    0x14(%rsp),%rdi
    9950:	4c 89 f6             	mov    %r14,%rsi
    9953:	4c 89 fa             	mov    %r15,%rdx
    9956:	ff 15 0c 71 05 00    	call   *0x5710c(%rip)        # 60a68 <_GLOBAL_OFFSET_TABLE_+0x4b0>
    995c:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
    9961:	4c 89 f6             	mov    %r14,%rsi
    9964:	4c 89 fa             	mov    %r15,%rdx
    9967:	ff 15 4b 6f 05 00    	call   *0x56f4b(%rip)        # 608b8 <_GLOBAL_OFFSET_TABLE_+0x300>
    996d:	8b 44 24 28          	mov    0x28(%rsp),%eax
    9971:	89 84 24 90 00 00 00 	mov    %eax,0x90(%rsp)
    9978:	0f 10 44 24 08       	movups 0x8(%rsp),%xmm0
    997d:	0f 10 4c 24 18       	movups 0x18(%rsp),%xmm1
    9982:	0f 29 8c 24 80 00 00 	movaps %xmm1,0x80(%rsp)
    9989:	00 
    998a:	0f 29 44 24 70       	movaps %xmm0,0x70(%rsp)
    998f:	48 8d 44 24 70       	lea    0x70(%rsp),%rax
    9994:	4c 89 f7             	mov    %r14,%rdi
    9997:	ff 15 83 6c 05 00    	call   *0x56c83(%rip)        # 60620 <_GLOBAL_OFFSET_TABLE_+0x68>
    999d:	8b 4c 24 64          	mov    0x64(%rsp),%ecx
    99a1:	83 f9 01             	cmp    $0x1,%ecx
    99a4:	75 1c                	jne    99c2 <hyperinterval_strict_surface32+0x232>
    99a6:	8b 74 24 68          	mov    0x68(%rsp),%esi
    99aa:	8b 7c 24 6c          	mov    0x6c(%rsp),%edi
    99ae:	39 fe                	cmp    %edi,%esi
    99b0:	0f 94 c2             	sete   %dl
    99b3:	66 0f 6e ce          	movd   %esi,%xmm1
    99b7:	66 0f 6e c7          	movd   %edi,%xmm0
    99bb:	be 01 00 00 00       	mov    $0x1,%esi
    99c0:	eb 04                	jmp    99c6 <hyperinterval_strict_surface32+0x236>
    99c2:	31 d2                	xor    %edx,%edx
    99c4:	31 f6                	xor    %esi,%esi
    99c6:	80 f1 01             	xor    $0x1,%cl
    99c9:	89 74 24 08          	mov    %esi,0x8(%rsp)
    99cd:	66 0f 7e 4c 24 0c    	movd   %xmm1,0xc(%rsp)
    99d3:	88 4c 24 10          	mov    %cl,0x10(%rsp)
    99d7:	88 54 24 11          	mov    %dl,0x11(%rsp)
    99db:	88 44 24 12          	mov    %al,0x12(%rsp)
    99df:	89 74 24 14          	mov    %esi,0x14(%rsp)
    99e3:	66 0f 7e 44 24 18    	movd   %xmm0,0x18(%rsp)
    99e9:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
    99ee:	4c 8d 64 24 64       	lea    0x64(%rsp),%r12
    99f3:	48 8d 5c 24 58       	lea    0x58(%rsp),%rbx
    99f8:	4c 89 e7             	mov    %r12,%rdi
    99fb:	48 89 de             	mov    %rbx,%rsi
    99fe:	ff 15 74 74 05 00    	call   *0x57474(%rip)        # 60e78 <_GLOBAL_OFFSET_TABLE_+0x8c0>
    9a04:	89 c5                	mov    %eax,%ebp
    9a06:	4c 89 e7             	mov    %r12,%rdi
    9a09:	48 89 de             	mov    %rbx,%rsi
    9a0c:	ff 15 de 71 05 00    	call   *0x571de(%rip)        # 60bf0 <_GLOBAL_OFFSET_TABLE_+0x638>
    9a12:	41 89 c6             	mov    %eax,%r14d
    9a15:	48 8d 5c 24 3c       	lea    0x3c(%rsp),%rbx
    9a1a:	4c 89 e7             	mov    %r12,%rdi
    9a1d:	48 89 de             	mov    %rbx,%rsi
    9a20:	ff 15 a2 71 05 00    	call   *0x571a2(%rip)        # 60bc8 <_GLOBAL_OFFSET_TABLE_+0x610>
    9a26:	41 89 c7             	mov    %eax,%r15d
    9a29:	4c 89 e7             	mov    %r12,%rdi
    9a2c:	48 89 de             	mov    %rbx,%rsi
    9a2f:	ff 15 db 70 05 00    	call   *0x570db(%rip)        # 60b10 <_GLOBAL_OFFSET_TABLE_+0x558>
    9a35:	89 c3                	mov    %eax,%ebx
    9a37:	4c 89 e7             	mov    %r12,%rdi
    9a3a:	66 0f 6e 44 24 38    	movd   0x38(%rsp),%xmm0
    9a40:	ff 15 3a 75 05 00    	call   *0x5753a(%rip)        # 60f80 <_GLOBAL_OFFSET_TABLE_+0x9c8>
    9a46:	a8 01                	test   $0x1,%al
    9a48:	74 0c                	je     9a56 <hyperinterval_strict_surface32+0x2c6>
    9a4a:	4c 89 eb             	mov    %r13,%rbx
    9a4d:	41 88 55 04          	mov    %dl,0x4(%r13)
    9a51:	e9 05 fe ff ff       	jmp    985b <hyperinterval_strict_surface32+0xcb>
    9a56:	80 e2 01             	and    $0x1,%dl
    9a59:	40 88 6c 24 08       	mov    %bpl,0x8(%rsp)
    9a5e:	44 88 74 24 09       	mov    %r14b,0x9(%rsp)
    9a63:	44 88 7c 24 0a       	mov    %r15b,0xa(%rsp)
    9a68:	88 5c 24 0b          	mov    %bl,0xb(%rsp)
    9a6c:	88 54 24 0c          	mov    %dl,0xc(%rsp)
    9a70:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
    9a75:	f6 44 24 3c 01       	testb  $0x1,0x3c(%rsp)
    9a7a:	74 2a                	je     9aa6 <hyperinterval_strict_surface32+0x316>
    9a7c:	f3 0f 7e 44 24 40    	movq   0x40(%rsp),%xmm0
    9a82:	66 0f 70 c8 e1       	pshufd $0xe1,%xmm0,%xmm1
    9a87:	66 0f ef c0          	pxor   %xmm0,%xmm0
    9a8b:	66 0f 6f 15 6d 48 04 	movdqa 0x4486d(%rip),%xmm2        # 4e300 <_fini+0xc04>
    9a92:	00 
    9a93:	66 0f ef d1          	pxor   %xmm1,%xmm2
    9a97:	66 0f 76 c1          	pcmpeqd %xmm1,%xmm0
    9a9b:	66 0f df c2          	pandn  %xmm2,%xmm0
    9a9f:	b8 01 00 00 00       	mov    $0x1,%eax
    9aa4:	eb 02                	jmp    9aa8 <hyperinterval_strict_surface32+0x318>
    9aa6:	31 c0                	xor    %eax,%eax
    9aa8:	89 44 24 48          	mov    %eax,0x48(%rsp)
    9aac:	66 0f d6 44 24 4c    	movq   %xmm0,0x4c(%rsp)
    9ab2:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    9ab7:	48 8d 74 24 64       	lea    0x64(%rsp),%rsi
    9abc:	48 8d 54 24 48       	lea    0x48(%rsp),%rdx
    9ac1:	ff 15 d9 70 05 00    	call   *0x570d9(%rip)        # 60ba0 <_GLOBAL_OFFSET_TABLE_+0x5e8>
    9ac7:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    9acb:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
    9ad0:	83 f9 02             	cmp    $0x2,%ecx
    9ad3:	4c 89 eb             	mov    %r13,%rbx
    9ad6:	0f 84 ef fc ff ff    	je     97cb <hyperinterval_strict_surface32+0x3b>
    9adc:	8b 54 24 0d          	mov    0xd(%rsp),%edx
    9ae0:	8b 74 24 10          	mov    0x10(%rsp),%esi
    9ae4:	89 74 24 34          	mov    %esi,0x34(%rsp)
    9ae8:	89 54 24 31          	mov    %edx,0x31(%rsp)
    9aec:	89 4c 24 2c          	mov    %ecx,0x2c(%rsp)
    9af0:	88 44 24 30          	mov    %al,0x30(%rsp)
    9af4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    9af9:	66 0f 6e 05 3f 47 04 	movd   0x4473f(%rip),%xmm0        # 4e240 <_fini+0xb44>
    9b00:	00 
    9b01:	ff 15 89 6e 05 00    	call   *0x56e89(%rip)        # 60990 <_GLOBAL_OFFSET_TABLE_+0x3d8>
    9b07:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    9b0b:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
    9b10:	83 f9 02             	cmp    $0x2,%ecx
    9b13:	0f 84 b2 fc ff ff    	je     97cb <hyperinterval_strict_surface32+0x3b>
    9b19:	8b 54 24 0d          	mov    0xd(%rsp),%edx
    9b1d:	8b 74 24 10          	mov    0x10(%rsp),%esi
    9b21:	89 74 24 78          	mov    %esi,0x78(%rsp)
    9b25:	89 54 24 75          	mov    %edx,0x75(%rsp)
    9b29:	89 4c 24 70          	mov    %ecx,0x70(%rsp)
    9b2d:	88 44 24 74          	mov    %al,0x74(%rsp)
    9b31:	48 8d 74 24 2c       	lea    0x2c(%rsp),%rsi
    9b36:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
    9b3b:	48 89 df             	mov    %rbx,%rdi
    9b3e:	ff 15 a4 72 05 00    	call   *0x572a4(%rip)        # 60de8 <_GLOBAL_OFFSET_TABLE_+0x830>
    9b44:	e9 1a fd ff ff       	jmp    9863 <hyperinterval_strict_surface32+0xd3>
    9b49:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

hyperinterval_strict_surface64:
    9b50:	55                   	push   %rbp
    9b51:	41 57                	push   %r15
    9b53:	41 56                	push   %r14
    9b55:	41 55                	push   %r13
    9b57:	41 54                	push   %r12
    9b59:	53                   	push   %rbx
    9b5a:	48 81 ec 58 01 00 00 	sub    $0x158,%rsp
    9b61:	89 f5                	mov    %esi,%ebp
    9b63:	48 89 fb             	mov    %rdi,%rbx
    9b66:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    9b6b:	f2 0f 11 84 24 98 00 	movsd  %xmm0,0x98(%rsp)
    9b72:	00 00 
    9b74:	66 0f d6 4c 24 60    	movq   %xmm1,0x60(%rsp)
    9b7a:	ff 15 80 6a 05 00    	call   *0x56a80(%rip)        # 60600 <_GLOBAL_OFFSET_TABLE_+0x48>
    9b80:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
    9b85:	44 0f b6 64 24 18    	movzbl 0x18(%rsp),%r12d
    9b8b:	49 83 ff 02          	cmp    $0x2,%r15
    9b8f:	75 09                	jne    9b9a <hyperinterval_strict_surface64+0x4a>
    9b91:	44 88 63 08          	mov    %r12b,0x8(%rbx)
    9b95:	e9 9c 00 00 00       	jmp    9c36 <hyperinterval_strict_surface64+0xe6>
    9b9a:	44 0f b6 74 24 1f    	movzbl 0x1f(%rsp),%r14d
    9ba0:	44 0f b7 6c 24 1d    	movzwl 0x1d(%rsp),%r13d
    9ba6:	8b 44 24 19          	mov    0x19(%rsp),%eax
    9baa:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    9baf:	4c 89 7c 24 68       	mov    %r15,0x68(%rsp)
    9bb4:	44 88 64 24 70       	mov    %r12b,0x70(%rsp)
    9bb9:	44 88 74 24 77       	mov    %r14b,0x77(%rsp)
    9bbe:	66 44 89 6c 24 75    	mov    %r13w,0x75(%rsp)
    9bc4:	48 89 84 24 20 01 00 	mov    %rax,0x120(%rsp)
    9bcb:	00 
    9bcc:	89 44 24 71          	mov    %eax,0x71(%rsp)
    9bd0:	48 89 8c 24 18 01 00 	mov    %rcx,0x118(%rsp)
    9bd7:	00 
    9bd8:	48 89 4c 24 78       	mov    %rcx,0x78(%rsp)
    9bdd:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
    9be4:	00 
    9be5:	f2 0f 10 84 24 98 00 	movsd  0x98(%rsp),%xmm0
    9bec:	00 00 
    9bee:	ff 15 3c 73 05 00    	call   *0x5733c(%rip)        # 60f30 <_GLOBAL_OFFSET_TABLE_+0x978>
    9bf4:	80 bc 24 d0 00 00 00 	cmpb   $0x1,0xd0(%rsp)
    9bfb:	01 
    9bfc:	74 2d                	je     9c2b <hyperinterval_strict_surface64+0xdb>
    9bfe:	f2 0f 10 84 24 d8 00 	movsd  0xd8(%rsp),%xmm0
    9c05:	00 00 
    9c07:	f2 0f 11 44 24 58    	movsd  %xmm0,0x58(%rsp)
    9c0d:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
    9c14:	00 
    9c15:	f2 0f 10 44 24 60    	movsd  0x60(%rsp),%xmm0
    9c1b:	ff 15 8f 70 05 00    	call   *0x5708f(%rip)        # 60cb0 <_GLOBAL_OFFSET_TABLE_+0x6f8>
    9c21:	80 bc 24 d0 00 00 00 	cmpb   $0x1,0xd0(%rsp)
    9c28:	01 
    9c29:	75 27                	jne    9c52 <hyperinterval_strict_surface64+0x102>
    9c2b:	0f b6 84 24 d1 00 00 	movzbl 0xd1(%rsp),%eax
    9c32:	00 
    9c33:	88 43 08             	mov    %al,0x8(%rbx)
    9c36:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    9c3d:	48 89 d8             	mov    %rbx,%rax
    9c40:	48 81 c4 58 01 00 00 	add    $0x158,%rsp
    9c47:	5b                   	pop    %rbx
    9c48:	41 5c                	pop    %r12
    9c4a:	41 5d                	pop    %r13
    9c4c:	41 5e                	pop    %r14
    9c4e:	41 5f                	pop    %r15
    9c50:	5d                   	pop    %rbp
    9c51:	c3                   	ret
    9c52:	f3 0f 7e 8c 24 d8 00 	movq   0xd8(%rsp),%xmm1
    9c59:	00 00 
    9c5b:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    9c60:	f2 0f 10 44 24 58    	movsd  0x58(%rsp),%xmm0
    9c66:	ff 15 94 69 05 00    	call   *0x56994(%rip)        # 60600 <_GLOBAL_OFFSET_TABLE_+0x48>
    9c6c:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    9c71:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
    9c76:	48 83 f9 02          	cmp    $0x2,%rcx
    9c7a:	74 b7                	je     9c33 <hyperinterval_strict_surface64+0xe3>
    9c7c:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
    9c81:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    9c86:	48 89 b4 24 b0 00 00 	mov    %rsi,0xb0(%rsp)
    9c8d:	00 
    9c8e:	48 89 94 24 a9 00 00 	mov    %rdx,0xa9(%rsp)
    9c95:	00 
    9c96:	48 89 8c 24 a0 00 00 	mov    %rcx,0xa0(%rsp)
    9c9d:	00 
    9c9e:	88 84 24 a8 00 00 00 	mov    %al,0xa8(%rsp)
    9ca5:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    9caa:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
    9caf:	89 ea                	mov    %ebp,%edx
    9cb1:	ff 15 81 6e 05 00    	call   *0x56e81(%rip)        # 60b38 <_GLOBAL_OFFSET_TABLE_+0x580>
    9cb7:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    9cbc:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
    9cc1:	48 83 f9 02          	cmp    $0x2,%rcx
    9cc5:	0f 84 68 ff ff ff    	je     9c33 <hyperinterval_strict_surface64+0xe3>
    9ccb:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
    9cd0:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    9cd5:	48 89 b4 24 e0 00 00 	mov    %rsi,0xe0(%rsp)
    9cdc:	00 
    9cdd:	48 89 94 24 d9 00 00 	mov    %rdx,0xd9(%rsp)
    9ce4:	00 
    9ce5:	48 89 8c 24 d0 00 00 	mov    %rcx,0xd0(%rsp)
    9cec:	00 
    9ced:	88 84 24 d8 00 00 00 	mov    %al,0xd8(%rsp)
    9cf4:	48 8d bc 24 b8 00 00 	lea    0xb8(%rsp),%rdi
    9cfb:	00 
    9cfc:	48 8d b4 24 d0 00 00 	lea    0xd0(%rsp),%rsi
    9d03:	00 
    9d04:	ff 15 be 69 05 00    	call   *0x569be(%rip)        # 606c8 <_GLOBAL_OFFSET_TABLE_+0x110>
    9d0a:	48 8b 8c 24 b8 00 00 	mov    0xb8(%rsp),%rcx
    9d11:	00 
    9d12:	0f b6 84 24 c0 00 00 	movzbl 0xc0(%rsp),%eax
    9d19:	00 
    9d1a:	48 83 f9 02          	cmp    $0x2,%rcx
    9d1e:	0f 84 0f ff ff ff    	je     9c33 <hyperinterval_strict_surface64+0xe3>
    9d24:	48 8b 94 24 c1 00 00 	mov    0xc1(%rsp),%rdx
    9d2b:	00 
    9d2c:	48 8b b4 24 c8 00 00 	mov    0xc8(%rsp),%rsi
    9d33:	00 
    9d34:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
    9d3b:	00 
    9d3c:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
    9d43:	00 
    9d44:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
    9d4b:	00 
    9d4c:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
    9d53:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
    9d5a:	00 
    9d5b:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
    9d62:	00 
    9d63:	48 8d 94 24 a0 00 00 	lea    0xa0(%rsp),%rdx
    9d6a:	00 
    9d6b:	ff 15 87 69 05 00    	call   *0x56987(%rip)        # 606f8 <_GLOBAL_OFFSET_TABLE_+0x140>
    9d71:	48 8d ac 24 28 01 00 	lea    0x128(%rsp),%rbp
    9d78:	00 
    9d79:	48 8d 54 24 68       	lea    0x68(%rsp),%rdx
    9d7e:	48 89 ef             	mov    %rbp,%rdi
    9d81:	48 8d b4 24 40 01 00 	lea    0x140(%rsp),%rsi
    9d88:	00 
    9d89:	ff 15 61 69 05 00    	call   *0x56961(%rip)        # 606f0 <_GLOBAL_OFFSET_TABLE_+0x138>
    9d8f:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    9d94:	48 89 ee             	mov    %rbp,%rsi
    9d97:	e8 b4 ec ff ff       	call   8a50 <hyperinterval::float::F64Enclosure::abs>
    9d9c:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    9da1:	48 89 ee             	mov    %rbp,%rsi
    9da4:	48 8d 94 24 a0 00 00 	lea    0xa0(%rsp),%rdx
    9dab:	00 
    9dac:	ff 15 26 6e 05 00    	call   *0x56e26(%rip)        # 60bd8 <_GLOBAL_OFFSET_TABLE_+0x620>
    9db2:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    9db7:	48 89 ee             	mov    %rbp,%rsi
    9dba:	48 8d 94 24 a0 00 00 	lea    0xa0(%rsp),%rdx
    9dc1:	00 
    9dc2:	ff 15 30 68 05 00    	call   *0x56830(%rip)        # 605f8 <_GLOBAL_OFFSET_TABLE_+0x40>
    9dc8:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
    9dcd:	48 89 84 24 10 01 00 	mov    %rax,0x110(%rsp)
    9dd4:	00 
    9dd5:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
    9dda:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
    9ddf:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
    9de4:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
    9de9:	0f 29 9c 24 00 01 00 	movaps %xmm3,0x100(%rsp)
    9df0:	00 
    9df1:	0f 29 94 24 f0 00 00 	movaps %xmm2,0xf0(%rsp)
    9df8:	00 
    9df9:	0f 29 8c 24 e0 00 00 	movaps %xmm1,0xe0(%rsp)
    9e00:	00 
    9e01:	0f 29 84 24 d0 00 00 	movaps %xmm0,0xd0(%rsp)
    9e08:	00 
    9e09:	48 8d 84 24 d0 00 00 	lea    0xd0(%rsp),%rax
    9e10:	00 
    9e11:	48 89 ef             	mov    %rbp,%rdi
    9e14:	ff 15 96 6d 05 00    	call   *0x56d96(%rip)        # 60bb0 <_GLOBAL_OFFSET_TABLE_+0x5f8>
    9e1a:	48 8b 8c 24 28 01 00 	mov    0x128(%rsp),%rcx
    9e21:	00 
    9e22:	48 83 f9 01          	cmp    $0x1,%rcx
    9e26:	75 27                	jne    9e4f <hyperinterval_strict_surface64+0x2ff>
    9e28:	48 8b b4 24 30 01 00 	mov    0x130(%rsp),%rsi
    9e2f:	00 
    9e30:	48 8b bc 24 38 01 00 	mov    0x138(%rsp),%rdi
    9e37:	00 
    9e38:	48 39 fe             	cmp    %rdi,%rsi
    9e3b:	0f 94 c2             	sete   %dl
    9e3e:	66 48 0f 6e ce       	movq   %rsi,%xmm1
    9e43:	66 48 0f 6e c7       	movq   %rdi,%xmm0
    9e48:	be 01 00 00 00       	mov    $0x1,%esi
    9e4d:	eb 04                	jmp    9e53 <hyperinterval_strict_surface64+0x303>
    9e4f:	31 d2                	xor    %edx,%edx
    9e51:	31 f6                	xor    %esi,%esi
    9e53:	80 f1 01             	xor    $0x1,%cl
    9e56:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
    9e5b:	66 0f d6 4c 24 18    	movq   %xmm1,0x18(%rsp)
    9e61:	88 4c 24 20          	mov    %cl,0x20(%rsp)
    9e65:	88 54 24 21          	mov    %dl,0x21(%rsp)
    9e69:	88 44 24 22          	mov    %al,0x22(%rsp)
    9e6d:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
    9e72:	66 0f d6 44 24 30    	movq   %xmm0,0x30(%rsp)
    9e78:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
    9e7d:	48 8d ac 24 28 01 00 	lea    0x128(%rsp),%rbp
    9e84:	00 
    9e85:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
    9e8c:	00 
    9e8d:	48 89 ef             	mov    %rbp,%rdi
    9e90:	ff 15 ba 6d 05 00    	call   *0x56dba(%rip)        # 60c50 <_GLOBAL_OFFSET_TABLE_+0x698>
    9e96:	88 44 24 60          	mov    %al,0x60(%rsp)
    9e9a:	48 89 ef             	mov    %rbp,%rdi
    9e9d:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
    9ea4:	00 
    9ea5:	ff 15 55 6b 05 00    	call   *0x56b55(%rip)        # 60a00 <_GLOBAL_OFFSET_TABLE_+0x448>
    9eab:	88 44 24 58          	mov    %al,0x58(%rsp)
    9eaf:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
    9eb4:	48 89 ef             	mov    %rbp,%rdi
    9eb7:	ff 15 6b 6d 05 00    	call   *0x56d6b(%rip)        # 60c28 <_GLOBAL_OFFSET_TABLE_+0x670>
    9ebd:	88 44 24 0f          	mov    %al,0xf(%rsp)
    9ec1:	48 89 ef             	mov    %rbp,%rdi
    9ec4:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
    9ec9:	ff 15 d1 6f 05 00    	call   *0x56fd1(%rip)        # 60ea0 <_GLOBAL_OFFSET_TABLE_+0x8e8>
    9ecf:	88 44 24 0e          	mov    %al,0xe(%rsp)
    9ed3:	48 89 ef             	mov    %rbp,%rdi
    9ed6:	f2 0f 10 84 24 98 00 	movsd  0x98(%rsp),%xmm0
    9edd:	00 00 
    9edf:	ff 15 5b 67 05 00    	call   *0x5675b(%rip)        # 60640 <_GLOBAL_OFFSET_TABLE_+0x88>
    9ee5:	a8 01                	test   $0x1,%al
    9ee7:	74 08                	je     9ef1 <hyperinterval_strict_surface64+0x3a1>
    9ee9:	88 53 08             	mov    %dl,0x8(%rbx)
    9eec:	e9 45 fd ff ff       	jmp    9c36 <hyperinterval_strict_surface64+0xe6>
    9ef1:	80 e2 01             	and    $0x1,%dl
    9ef4:	0f b6 44 24 60       	movzbl 0x60(%rsp),%eax
    9ef9:	88 44 24 10          	mov    %al,0x10(%rsp)
    9efd:	0f b6 44 24 58       	movzbl 0x58(%rsp),%eax
    9f02:	88 44 24 11          	mov    %al,0x11(%rsp)
    9f06:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
    9f0b:	88 44 24 12          	mov    %al,0x12(%rsp)
    9f0f:	0f b6 44 24 0e       	movzbl 0xe(%rsp),%eax
    9f14:	88 44 24 13          	mov    %al,0x13(%rsp)
    9f18:	88 54 24 14          	mov    %dl,0x14(%rsp)
    9f1c:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
    9f21:	41 f6 c7 01          	test   $0x1,%r15b
    9f25:	74 51                	je     9f78 <hyperinterval_strict_surface64+0x428>
    9f27:	41 c1 e6 10          	shl    $0x10,%r14d
    9f2b:	45 09 f5             	or     %r14d,%r13d
    9f2e:	41 0f b6 c4          	movzbl %r12b,%eax
    9f32:	49 c1 e5 20          	shl    $0x20,%r13
    9f36:	48 8b 94 24 20 01 00 	mov    0x120(%rsp),%rdx
    9f3d:	00 
    9f3e:	4c 09 ea             	or     %r13,%rdx
    9f41:	48 c1 e2 08          	shl    $0x8,%rdx
    9f45:	48 09 c2             	or     %rax,%rdx
    9f48:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    9f4f:	00 00 80 
    9f52:	48 8b b4 24 18 01 00 	mov    0x118(%rsp),%rsi
    9f59:	00 
    9f5a:	48 89 f1             	mov    %rsi,%rcx
    9f5d:	48 31 c1             	xor    %rax,%rcx
    9f60:	48 85 f6             	test   %rsi,%rsi
    9f63:	48 0f 44 ce          	cmove  %rsi,%rcx
    9f67:	48 31 d0             	xor    %rdx,%rax
    9f6a:	48 85 d2             	test   %rdx,%rdx
    9f6d:	48 0f 44 c2          	cmove  %rdx,%rax
    9f71:	ba 01 00 00 00       	mov    $0x1,%edx
    9f76:	eb 02                	jmp    9f7a <hyperinterval_strict_surface64+0x42a>
    9f78:	31 d2                	xor    %edx,%edx
    9f7a:	48 89 94 24 b8 00 00 	mov    %rdx,0xb8(%rsp)
    9f81:	00 
    9f82:	48 89 8c 24 c0 00 00 	mov    %rcx,0xc0(%rsp)
    9f89:	00 
    9f8a:	48 89 84 24 c8 00 00 	mov    %rax,0xc8(%rsp)
    9f91:	00 
    9f92:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    9f97:	48 8d b4 24 28 01 00 	lea    0x128(%rsp),%rsi
    9f9e:	00 
    9f9f:	48 8d 94 24 b8 00 00 	lea    0xb8(%rsp),%rdx
    9fa6:	00 
    9fa7:	ff 15 9b 6d 05 00    	call   *0x56d9b(%rip)        # 60d48 <_GLOBAL_OFFSET_TABLE_+0x790>
    9fad:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    9fb2:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
    9fb7:	48 83 f9 02          	cmp    $0x2,%rcx
    9fbb:	0f 84 72 fc ff ff    	je     9c33 <hyperinterval_strict_surface64+0xe3>
    9fc1:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
    9fc6:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    9fcb:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
    9fd2:	00 
    9fd3:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
    9fda:	00 
    9fdb:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
    9fe2:	00 
    9fe3:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
    9fea:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    9fef:	f2 0f 10 05 29 40 04 	movsd  0x44029(%rip),%xmm0        # 4e020 <_fini+0x924>
    9ff6:	00 
    9ff7:	ff 15 13 6f 05 00    	call   *0x56f13(%rip)        # 60f10 <_GLOBAL_OFFSET_TABLE_+0x958>
    9ffd:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    a002:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
    a007:	48 83 f9 02          	cmp    $0x2,%rcx
    a00b:	0f 84 22 fc ff ff    	je     9c33 <hyperinterval_strict_surface64+0xe3>
    a011:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
    a016:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    a01b:	48 89 b4 24 e0 00 00 	mov    %rsi,0xe0(%rsp)
    a022:	00 
    a023:	48 89 94 24 d9 00 00 	mov    %rdx,0xd9(%rsp)
    a02a:	00 
    a02b:	48 89 8c 24 d0 00 00 	mov    %rcx,0xd0(%rsp)
    a032:	00 
    a033:	88 84 24 d8 00 00 00 	mov    %al,0xd8(%rsp)
    a03a:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
    a041:	00 
    a042:	48 8d 94 24 d0 00 00 	lea    0xd0(%rsp),%rdx
    a049:	00 
    a04a:	48 89 df             	mov    %rbx,%rdi
    a04d:	ff 15 35 6e 05 00    	call   *0x56e35(%rip)        # 60e88 <_GLOBAL_OFFSET_TABLE_+0x8d0>
    a053:	e9 e5 fb ff ff       	jmp    9c3d <hyperinterval_strict_surface64+0xed>
    a058:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    a05f:	00 

hyperinterval::float::F32Enclosure::new:
    a0e0:	41 57                	push   %r15
    a0e2:	41 56                	push   %r14
    a0e4:	53                   	push   %rbx
    a0e5:	48 83 ec 20          	sub    $0x20,%rsp
    a0e9:	f3 0f 11 4c 24 1c    	movss  %xmm1,0x1c(%rsp)
    a0ef:	48 89 fb             	mov    %rdi,%rbx
    a0f2:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
    a0f8:	66 0f 7e c1          	movd   %xmm0,%ecx
    a0fc:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    a101:	be 00 00 00 80       	mov    $0x80000000,%esi
    a106:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a10b:	e8 30 4c 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    a110:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    a115:	74 2a                	je     a141 <hyperinterval::float::F32Enclosure::new+0x61>
    a117:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
    a11c:	66 0f 6e 44 24 1c    	movd   0x1c(%rsp),%xmm0
    a122:	66 0f 7e c1          	movd   %xmm0,%ecx
    a126:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    a12b:	be 00 00 00 80       	mov    $0x80000000,%esi
    a130:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a135:	e8 06 4c 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    a13a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    a13f:	75 1b                	jne    a15c <hyperinterval::float::F32Enclosure::new+0x7c>
    a141:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
    a146:	88 43 04             	mov    %al,0x4(%rbx)
    a149:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    a14f:	48 89 d8             	mov    %rbx,%rax
    a152:	48 83 c4 20          	add    $0x20,%rsp
    a156:	5b                   	pop    %rbx
    a157:	41 5e                	pop    %r14
    a159:	41 5f                	pop    %r15
    a15b:	c3                   	ret
    a15c:	8b 44 24 10          	mov    0x10(%rsp),%eax
    a160:	44 89 f9             	mov    %r15d,%ecx
    a163:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    a169:	89 c2                	mov    %eax,%edx
    a16b:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    a171:	be 00 00 00 80       	mov    $0x80000000,%esi
    a176:	29 ce                	sub    %ecx,%esi
    a178:	44 09 f1             	or     %r14d,%ecx
    a17b:	45 85 ff             	test   %r15d,%r15d
    a17e:	48 0f 49 f1          	cmovns %rcx,%rsi
    a182:	89 d1                	mov    %edx,%ecx
    a184:	44 09 f1             	or     %r14d,%ecx
    a187:	41 29 d6             	sub    %edx,%r14d
    a18a:	85 c0                	test   %eax,%eax
    a18c:	4c 0f 49 f1          	cmovns %rcx,%r14
    a190:	44 39 f6             	cmp    %r14d,%esi
    a193:	76 06                	jbe    a19b <hyperinterval::float::F32Enclosure::new+0xbb>
    a195:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
    a199:	eb ae                	jmp    a149 <hyperinterval::float::F32Enclosure::new+0x69>
    a19b:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
    a1a1:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
    a1a5:	89 43 08             	mov    %eax,0x8(%rbx)
    a1a8:	eb a5                	jmp    a14f <hyperinterval::float::F32Enclosure::new+0x6f>
    a1aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

hyperinterval::float::F32Enclosure::point:
    a1b0:	53                   	push   %rbx
    a1b1:	48 83 ec 10          	sub    $0x10,%rsp
    a1b5:	48 89 fb             	mov    %rdi,%rbx
    a1b8:	66 0f 7e c1          	movd   %xmm0,%ecx
    a1bc:	48 89 e7             	mov    %rsp,%rdi
    a1bf:	be 00 00 00 80       	mov    $0x80000000,%esi
    a1c4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a1c9:	e8 72 4b 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    a1ce:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    a1d2:	75 0f                	jne    a1e3 <hyperinterval::float::F32Enclosure::point+0x33>
    a1d4:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    a1d9:	88 43 04             	mov    %al,0x4(%rbx)
    a1dc:	b8 02 00 00 00       	mov    $0x2,%eax
    a1e1:	eb 0f                	jmp    a1f2 <hyperinterval::float::F32Enclosure::point+0x42>
    a1e3:	8b 44 24 08          	mov    0x8(%rsp),%eax
    a1e7:	89 43 04             	mov    %eax,0x4(%rbx)
    a1ea:	89 43 08             	mov    %eax,0x8(%rbx)
    a1ed:	b8 01 00 00 00       	mov    $0x1,%eax
    a1f2:	89 03                	mov    %eax,(%rbx)
    a1f4:	48 89 d8             	mov    %rbx,%rax
    a1f7:	48 83 c4 10          	add    $0x10,%rsp
    a1fb:	5b                   	pop    %rbx
    a1fc:	c3                   	ret
    a1fd:	0f 1f 00             	nopl   (%rax)

hyperinterval::float::F32Enclosure::from_bits:
    a200:	41 57                	push   %r15
    a202:	41 56                	push   %r14
    a204:	41 54                	push   %r12
    a206:	53                   	push   %rbx
    a207:	48 83 ec 18          	sub    $0x18,%rsp
    a20b:	49 89 d6             	mov    %rdx,%r14
    a20e:	48 89 fb             	mov    %rdi,%rbx
    a211:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
    a217:	89 f1                	mov    %esi,%ecx
    a219:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    a21e:	be 00 00 00 80       	mov    $0x80000000,%esi
    a223:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a228:	e8 13 4b 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    a22d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    a232:	74 23                	je     a257 <hyperinterval::float::F32Enclosure::from_bits+0x57>
    a234:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    a239:	44 89 f1             	mov    %r14d,%ecx
    a23c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    a241:	be 00 00 00 80       	mov    $0x80000000,%esi
    a246:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a24b:	e8 f0 4a 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    a250:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    a255:	75 1a                	jne    a271 <hyperinterval::float::F32Enclosure::from_bits+0x71>
    a257:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
    a25c:	88 43 04             	mov    %al,0x4(%rbx)
    a25f:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    a265:	48 83 c4 18          	add    $0x18,%rsp
    a269:	5b                   	pop    %rbx
    a26a:	41 5c                	pop    %r12
    a26c:	41 5e                	pop    %r14
    a26e:	41 5f                	pop    %r15
    a270:	c3                   	ret
    a271:	8b 44 24 10          	mov    0x10(%rsp),%eax
    a275:	44 89 e1             	mov    %r12d,%ecx
    a278:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    a27e:	89 c2                	mov    %eax,%edx
    a280:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    a286:	be 00 00 00 80       	mov    $0x80000000,%esi
    a28b:	29 ce                	sub    %ecx,%esi
    a28d:	44 09 f9             	or     %r15d,%ecx
    a290:	45 85 e4             	test   %r12d,%r12d
    a293:	48 0f 49 f1          	cmovns %rcx,%rsi
    a297:	89 d1                	mov    %edx,%ecx
    a299:	44 09 f9             	or     %r15d,%ecx
    a29c:	41 29 d7             	sub    %edx,%r15d
    a29f:	85 c0                	test   %eax,%eax
    a2a1:	4c 0f 49 f9          	cmovns %rcx,%r15
    a2a5:	44 39 fe             	cmp    %r15d,%esi
    a2a8:	76 06                	jbe    a2b0 <hyperinterval::float::F32Enclosure::from_bits+0xb0>
    a2aa:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
    a2ae:	eb af                	jmp    a25f <hyperinterval::float::F32Enclosure::from_bits+0x5f>
    a2b0:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
    a2b6:	44 89 63 04          	mov    %r12d,0x4(%rbx)
    a2ba:	89 43 08             	mov    %eax,0x8(%rbx)
    a2bd:	eb a6                	jmp    a265 <hyperinterval::float::F32Enclosure::from_bits+0x65>
    a2bf:	90                   	nop

hyperinterval::float::F32Enclosure::contains_point:
    a2c0:	41 56                	push   %r14
    a2c2:	53                   	push   %rbx
    a2c3:	48 83 ec 18          	sub    $0x18,%rsp
    a2c7:	48 89 fb             	mov    %rdi,%rbx
    a2ca:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
    a2d0:	66 0f 7e c1          	movd   %xmm0,%ecx
    a2d4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    a2d9:	be 00 00 00 80       	mov    $0x80000000,%esi
    a2de:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a2e3:	e8 58 4a 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    a2e8:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
    a2ed:	3c 01                	cmp    $0x1,%al
    a2ef:	75 0d                	jne    a2fe <hyperinterval::float::F32Enclosure::contains_point+0x3e>
    a2f1:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
    a2f6:	48 83 c4 18          	add    $0x18,%rsp
    a2fa:	5b                   	pop    %rbx
    a2fb:	41 5e                	pop    %r14
    a2fd:	c3                   	ret
    a2fe:	f6 03 01             	testb  $0x1,(%rbx)
    a301:	74 44                	je     a347 <hyperinterval::float::F32Enclosure::contains_point+0x87>
    a303:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    a308:	8b 73 04             	mov    0x4(%rbx),%esi
    a30b:	89 d1                	mov    %edx,%ecx
    a30d:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    a313:	89 f7                	mov    %esi,%edi
    a315:	44 09 f7             	or     %r14d,%edi
    a318:	41 89 f0             	mov    %esi,%r8d
    a31b:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
    a322:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
    a328:	45 29 c1             	sub    %r8d,%r9d
    a32b:	85 f6                	test   %esi,%esi
    a32d:	4c 0f 49 cf          	cmovns %rdi,%r9
    a331:	be 00 00 00 80       	mov    $0x80000000,%esi
    a336:	48 29 ce             	sub    %rcx,%rsi
    a339:	4c 09 f1             	or     %r14,%rcx
    a33c:	85 d2                	test   %edx,%edx
    a33e:	48 0f 48 ce          	cmovs  %rsi,%rcx
    a342:	41 39 c9             	cmp    %ecx,%r9d
    a345:	76 0a                	jbe    a351 <hyperinterval::float::F32Enclosure::contains_point+0x91>
    a347:	31 d2                	xor    %edx,%edx
    a349:	48 83 c4 18          	add    $0x18,%rsp
    a34d:	5b                   	pop    %rbx
    a34e:	41 5e                	pop    %r14
    a350:	c3                   	ret
    a351:	8b 53 08             	mov    0x8(%rbx),%edx
    a354:	89 d6                	mov    %edx,%esi
    a356:	44 09 f6             	or     %r14d,%esi
    a359:	89 d7                	mov    %edx,%edi
    a35b:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    a361:	41 29 fe             	sub    %edi,%r14d
    a364:	85 d2                	test   %edx,%edx
    a366:	4c 0f 49 f6          	cmovns %rsi,%r14
    a36a:	44 39 f1             	cmp    %r14d,%ecx
    a36d:	0f 96 c2             	setbe  %dl
    a370:	48 83 c4 18          	add    $0x18,%rsp
    a374:	5b                   	pop    %rbx
    a375:	41 5e                	pop    %r14
    a377:	c3                   	ret
    a378:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    a37f:	00 

hyperinterval::float::F32Enclosure::subset_of:
    a380:	b0 01                	mov    $0x1,%al
    a382:	f6 07 01             	testb  $0x1,(%rdi)
    a385:	74 53                	je     a3da <hyperinterval::float::F32Enclosure::subset_of+0x5a>
    a387:	f6 06 01             	testb  $0x1,(%rsi)
    a38a:	74 4c                	je     a3d8 <hyperinterval::float::F32Enclosure::subset_of+0x58>
    a38c:	8b 4f 04             	mov    0x4(%rdi),%ecx
    a38f:	8b 56 04             	mov    0x4(%rsi),%edx
    a392:	b8 00 00 00 80       	mov    $0x80000000,%eax
    a397:	41 89 d0             	mov    %edx,%r8d
    a39a:	41 09 c0             	or     %eax,%r8d
    a39d:	41 89 d1             	mov    %edx,%r9d
    a3a0:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a3a7:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a3ad:	45 29 ca             	sub    %r9d,%r10d
    a3b0:	85 d2                	test   %edx,%edx
    a3b2:	4d 0f 49 d0          	cmovns %r8,%r10
    a3b6:	89 ca                	mov    %ecx,%edx
    a3b8:	09 c2                	or     %eax,%edx
    a3ba:	41 89 c8             	mov    %ecx,%r8d
    a3bd:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
    a3c4:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
    a3ca:	45 29 c1             	sub    %r8d,%r9d
    a3cd:	85 c9                	test   %ecx,%ecx
    a3cf:	4c 0f 49 ca          	cmovns %rdx,%r9
    a3d3:	45 39 ca             	cmp    %r9d,%r10d
    a3d6:	76 03                	jbe    a3db <hyperinterval::float::F32Enclosure::subset_of+0x5b>
    a3d8:	31 c0                	xor    %eax,%eax
    a3da:	c3                   	ret
    a3db:	8b 4f 08             	mov    0x8(%rdi),%ecx
    a3de:	8b 56 08             	mov    0x8(%rsi),%edx
    a3e1:	89 ce                	mov    %ecx,%esi
    a3e3:	09 c6                	or     %eax,%esi
    a3e5:	89 cf                	mov    %ecx,%edi
    a3e7:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    a3ed:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    a3f3:	41 29 f8             	sub    %edi,%r8d
    a3f6:	85 c9                	test   %ecx,%ecx
    a3f8:	4c 0f 49 c6          	cmovns %rsi,%r8
    a3fc:	89 d1                	mov    %edx,%ecx
    a3fe:	09 c1                	or     %eax,%ecx
    a400:	89 d6                	mov    %edx,%esi
    a402:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    a408:	29 f0                	sub    %esi,%eax
    a40a:	85 d2                	test   %edx,%edx
    a40c:	48 0f 49 c1          	cmovns %rcx,%rax
    a410:	41 39 c0             	cmp    %eax,%r8d
    a413:	0f 96 c0             	setbe  %al
    a416:	c3                   	ret
    a417:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    a41e:	00 00 

hyperinterval::float::F32Enclosure::interior_subset_of:
    a420:	b0 01                	mov    $0x1,%al
    a422:	f6 07 01             	testb  $0x1,(%rdi)
    a425:	0f 84 93 00 00 00    	je     a4be <hyperinterval::float::F32Enclosure::interior_subset_of+0x9e>
    a42b:	f6 06 01             	testb  $0x1,(%rsi)
    a42e:	0f 84 88 00 00 00    	je     a4bc <hyperinterval::float::F32Enclosure::interior_subset_of+0x9c>
    a434:	8b 4f 04             	mov    0x4(%rdi),%ecx
    a437:	8b 56 04             	mov    0x4(%rsi),%edx
    a43a:	b8 00 00 00 80       	mov    $0x80000000,%eax
    a43f:	41 89 d0             	mov    %edx,%r8d
    a442:	41 09 c0             	or     %eax,%r8d
    a445:	41 89 d1             	mov    %edx,%r9d
    a448:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a44f:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a455:	45 29 ca             	sub    %r9d,%r10d
    a458:	85 d2                	test   %edx,%edx
    a45a:	4d 0f 49 d0          	cmovns %r8,%r10
    a45e:	89 ca                	mov    %ecx,%edx
    a460:	09 c2                	or     %eax,%edx
    a462:	41 89 c8             	mov    %ecx,%r8d
    a465:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
    a46c:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
    a472:	45 29 c1             	sub    %r8d,%r9d
    a475:	85 c9                	test   %ecx,%ecx
    a477:	4c 0f 49 ca          	cmovns %rdx,%r9
    a47b:	45 39 ca             	cmp    %r9d,%r10d
    a47e:	73 3c                	jae    a4bc <hyperinterval::float::F32Enclosure::interior_subset_of+0x9c>
    a480:	8b 4f 08             	mov    0x8(%rdi),%ecx
    a483:	8b 56 08             	mov    0x8(%rsi),%edx
    a486:	89 ce                	mov    %ecx,%esi
    a488:	09 c6                	or     %eax,%esi
    a48a:	89 cf                	mov    %ecx,%edi
    a48c:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    a492:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    a498:	41 29 f8             	sub    %edi,%r8d
    a49b:	85 c9                	test   %ecx,%ecx
    a49d:	4c 0f 49 c6          	cmovns %rsi,%r8
    a4a1:	89 d1                	mov    %edx,%ecx
    a4a3:	09 c1                	or     %eax,%ecx
    a4a5:	89 d6                	mov    %edx,%esi
    a4a7:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    a4ad:	29 f0                	sub    %esi,%eax
    a4af:	85 d2                	test   %edx,%edx
    a4b1:	48 0f 49 c1          	cmovns %rcx,%rax
    a4b5:	41 39 c0             	cmp    %eax,%r8d
    a4b8:	0f 92 c0             	setb   %al
    a4bb:	c3                   	ret
    a4bc:	31 c0                	xor    %eax,%eax
    a4be:	c3                   	ret
    a4bf:	90                   	nop

hyperinterval::float::F32Enclosure::disjoint:
    a4c0:	83 3f 00             	cmpl   $0x0,(%rdi)
    a4c3:	0f 94 c0             	sete   %al
    a4c6:	8b 0e                	mov    (%rsi),%ecx
    a4c8:	85 c9                	test   %ecx,%ecx
    a4ca:	0f 94 c2             	sete   %dl
    a4cd:	08 c2                	or     %al,%dl
    a4cf:	b0 01                	mov    $0x1,%al
    a4d1:	74 01                	je     a4d4 <hyperinterval::float::F32Enclosure::disjoint+0x14>
    a4d3:	c3                   	ret
    a4d4:	f6 c1 01             	test   $0x1,%cl
    a4d7:	0f 84 8c 00 00 00    	je     a569 <hyperinterval::float::F32Enclosure::disjoint+0xa9>
    a4dd:	b9 00 00 00 80       	mov    $0x80000000,%ecx
    a4e2:	8b 56 04             	mov    0x4(%rsi),%edx
    a4e5:	44 8b 47 08          	mov    0x8(%rdi),%r8d
    a4e9:	45 89 c1             	mov    %r8d,%r9d
    a4ec:	41 09 c9             	or     %ecx,%r9d
    a4ef:	45 89 c2             	mov    %r8d,%r10d
    a4f2:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
    a4f9:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
    a4ff:	45 29 d3             	sub    %r10d,%r11d
    a502:	45 85 c0             	test   %r8d,%r8d
    a505:	4d 0f 49 d9          	cmovns %r9,%r11
    a509:	41 89 d0             	mov    %edx,%r8d
    a50c:	41 09 c8             	or     %ecx,%r8d
    a50f:	41 89 d1             	mov    %edx,%r9d
    a512:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a519:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a51f:	45 29 ca             	sub    %r9d,%r10d
    a522:	85 d2                	test   %edx,%edx
    a524:	4d 0f 49 d0          	cmovns %r8,%r10
    a528:	45 39 d3             	cmp    %r10d,%r11d
    a52b:	72 a6                	jb     a4d3 <hyperinterval::float::F32Enclosure::disjoint+0x13>
    a52d:	8b 47 04             	mov    0x4(%rdi),%eax
    a530:	8b 56 08             	mov    0x8(%rsi),%edx
    a533:	89 d6                	mov    %edx,%esi
    a535:	09 ce                	or     %ecx,%esi
    a537:	89 d7                	mov    %edx,%edi
    a539:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    a53f:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    a545:	41 29 f8             	sub    %edi,%r8d
    a548:	85 d2                	test   %edx,%edx
    a54a:	4c 0f 49 c6          	cmovns %rsi,%r8
    a54e:	89 c2                	mov    %eax,%edx
    a550:	09 ca                	or     %ecx,%edx
    a552:	89 c6                	mov    %eax,%esi
    a554:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    a55a:	29 f1                	sub    %esi,%ecx
    a55c:	85 c0                	test   %eax,%eax
    a55e:	48 0f 49 ca          	cmovns %rdx,%rcx
    a562:	41 39 c8             	cmp    %ecx,%r8d
    a565:	0f 92 c0             	setb   %al
    a568:	c3                   	ret
    a569:	31 c0                	xor    %eax,%eax
    a56b:	c3                   	ret
    a56c:	0f 1f 40 00          	nopl   0x0(%rax)

hyperinterval::float::F32Enclosure::overlaps:
    a570:	83 3f 00             	cmpl   $0x0,(%rdi)
    a573:	0f 94 c0             	sete   %al
    a576:	8b 0e                	mov    (%rsi),%ecx
    a578:	85 c9                	test   %ecx,%ecx
    a57a:	0f 94 c2             	sete   %dl
    a57d:	08 c2                	or     %al,%dl
    a57f:	74 03                	je     a584 <hyperinterval::float::F32Enclosure::overlaps+0x14>
    a581:	31 c0                	xor    %eax,%eax
    a583:	c3                   	ret
    a584:	b0 01                	mov    $0x1,%al
    a586:	f6 c1 01             	test   $0x1,%cl
    a589:	0f 84 8a 00 00 00    	je     a619 <hyperinterval::float::F32Enclosure::overlaps+0xa9>
    a58f:	b8 00 00 00 80       	mov    $0x80000000,%eax
    a594:	8b 4e 04             	mov    0x4(%rsi),%ecx
    a597:	8b 57 08             	mov    0x8(%rdi),%edx
    a59a:	41 89 d0             	mov    %edx,%r8d
    a59d:	41 09 c0             	or     %eax,%r8d
    a5a0:	41 89 d1             	mov    %edx,%r9d
    a5a3:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a5aa:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a5b0:	45 29 ca             	sub    %r9d,%r10d
    a5b3:	85 d2                	test   %edx,%edx
    a5b5:	4d 0f 49 d0          	cmovns %r8,%r10
    a5b9:	89 ca                	mov    %ecx,%edx
    a5bb:	09 c2                	or     %eax,%edx
    a5bd:	41 89 c8             	mov    %ecx,%r8d
    a5c0:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
    a5c7:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
    a5cd:	45 29 c1             	sub    %r8d,%r9d
    a5d0:	85 c9                	test   %ecx,%ecx
    a5d2:	4c 0f 49 ca          	cmovns %rdx,%r9
    a5d6:	45 39 ca             	cmp    %r9d,%r10d
    a5d9:	73 03                	jae    a5de <hyperinterval::float::F32Enclosure::overlaps+0x6e>
    a5db:	31 c0                	xor    %eax,%eax
    a5dd:	c3                   	ret
    a5de:	8b 4f 04             	mov    0x4(%rdi),%ecx
    a5e1:	8b 56 08             	mov    0x8(%rsi),%edx
    a5e4:	89 d6                	mov    %edx,%esi
    a5e6:	09 c6                	or     %eax,%esi
    a5e8:	89 d7                	mov    %edx,%edi
    a5ea:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    a5f0:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    a5f6:	41 29 f8             	sub    %edi,%r8d
    a5f9:	85 d2                	test   %edx,%edx
    a5fb:	4c 0f 49 c6          	cmovns %rsi,%r8
    a5ff:	89 ca                	mov    %ecx,%edx
    a601:	09 c2                	or     %eax,%edx
    a603:	89 ce                	mov    %ecx,%esi
    a605:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    a60b:	29 f0                	sub    %esi,%eax
    a60d:	85 c9                	test   %ecx,%ecx
    a60f:	48 0f 49 c2          	cmovns %rdx,%rax
    a613:	41 39 c0             	cmp    %eax,%r8d
    a616:	0f 93 c0             	setae  %al
    a619:	c3                   	ret
    a61a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

hyperinterval::float::F32Enclosure::hull:
    a620:	48 89 f8             	mov    %rdi,%rax
    a623:	44 8b 0e             	mov    (%rsi),%r9d
    a626:	44 8b 02             	mov    (%rdx),%r8d
    a629:	8b 7a 04             	mov    0x4(%rdx),%edi
    a62c:	8b 4a 08             	mov    0x8(%rdx),%ecx
    a62f:	41 f6 c1 01          	test   $0x1,%r9b
    a633:	0f 84 a1 00 00 00    	je     a6da <hyperinterval::float::F32Enclosure::hull+0xba>
    a639:	8b 56 04             	mov    0x4(%rsi),%edx
    a63c:	8b 76 08             	mov    0x8(%rsi),%esi
    a63f:	41 f6 c0 01          	test   $0x1,%r8b
    a643:	0f 84 9b 00 00 00    	je     a6e4 <hyperinterval::float::F32Enclosure::hull+0xc4>
    a649:	53                   	push   %rbx
    a64a:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    a650:	41 89 d1             	mov    %edx,%r9d
    a653:	45 09 c1             	or     %r8d,%r9d
    a656:	41 89 d2             	mov    %edx,%r10d
    a659:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
    a660:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
    a666:	45 29 d3             	sub    %r10d,%r11d
    a669:	85 d2                	test   %edx,%edx
    a66b:	4d 0f 49 d9          	cmovns %r9,%r11
    a66f:	41 89 f9             	mov    %edi,%r9d
    a672:	45 09 c1             	or     %r8d,%r9d
    a675:	41 89 fa             	mov    %edi,%r10d
    a678:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
    a67f:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    a684:	44 29 d3             	sub    %r10d,%ebx
    a687:	85 ff                	test   %edi,%edi
    a689:	49 0f 49 d9          	cmovns %r9,%rbx
    a68d:	41 39 db             	cmp    %ebx,%r11d
    a690:	0f 47 d7             	cmova  %edi,%edx
    a693:	89 f7                	mov    %esi,%edi
    a695:	44 09 c7             	or     %r8d,%edi
    a698:	41 89 f1             	mov    %esi,%r9d
    a69b:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a6a2:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a6a8:	45 29 ca             	sub    %r9d,%r10d
    a6ab:	85 f6                	test   %esi,%esi
    a6ad:	4c 0f 49 d7          	cmovns %rdi,%r10
    a6b1:	89 cf                	mov    %ecx,%edi
    a6b3:	44 09 c7             	or     %r8d,%edi
    a6b6:	41 89 c9             	mov    %ecx,%r9d
    a6b9:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a6c0:	45 29 c8             	sub    %r9d,%r8d
    a6c3:	85 c9                	test   %ecx,%ecx
    a6c5:	4c 0f 49 c7          	cmovns %rdi,%r8
    a6c9:	45 39 c2             	cmp    %r8d,%r10d
    a6cc:	0f 42 f1             	cmovb  %ecx,%esi
    a6cf:	41 b8 01 00 00 00    	mov    $0x1,%r8d
    a6d5:	89 f1                	mov    %esi,%ecx
    a6d7:	89 d7                	mov    %edx,%edi
    a6d9:	5b                   	pop    %rbx
    a6da:	44 89 00             	mov    %r8d,(%rax)
    a6dd:	89 78 04             	mov    %edi,0x4(%rax)
    a6e0:	89 48 08             	mov    %ecx,0x8(%rax)
    a6e3:	c3                   	ret
    a6e4:	89 f1                	mov    %esi,%ecx
    a6e6:	89 d7                	mov    %edx,%edi
    a6e8:	45 89 c8             	mov    %r9d,%r8d
    a6eb:	44 89 00             	mov    %r8d,(%rax)
    a6ee:	89 78 04             	mov    %edi,0x4(%rax)
    a6f1:	89 48 08             	mov    %ecx,0x8(%rax)
    a6f4:	c3                   	ret
    a6f5:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    a6fc:	00 00 00 
    a6ff:	90                   	nop

hyperinterval::float::F32Enclosure::intersection:
    a700:	48 89 f8             	mov    %rdi,%rax
    a703:	45 31 c9             	xor    %r9d,%r9d
    a706:	f6 06 01             	testb  $0x1,(%rsi)
    a709:	0f 84 ed 00 00 00    	je     a7fc <hyperinterval::float::F32Enclosure::intersection+0xfc>
    a70f:	f6 02 01             	testb  $0x1,(%rdx)
    a712:	0f 84 d9 00 00 00    	je     a7f1 <hyperinterval::float::F32Enclosure::intersection+0xf1>
    a718:	53                   	push   %rbx
    a719:	8b 4e 04             	mov    0x4(%rsi),%ecx
    a71c:	44 8b 4a 04          	mov    0x4(%rdx),%r9d
    a720:	bf 00 00 00 80       	mov    $0x80000000,%edi
    a725:	41 89 c8             	mov    %ecx,%r8d
    a728:	41 09 f8             	or     %edi,%r8d
    a72b:	41 89 ca             	mov    %ecx,%r10d
    a72e:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
    a735:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
    a73b:	45 29 d3             	sub    %r10d,%r11d
    a73e:	85 c9                	test   %ecx,%ecx
    a740:	4d 0f 49 d8          	cmovns %r8,%r11
    a744:	45 89 c8             	mov    %r9d,%r8d
    a747:	41 09 f8             	or     %edi,%r8d
    a74a:	45 89 ca             	mov    %r9d,%r10d
    a74d:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
    a754:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    a759:	44 29 d3             	sub    %r10d,%ebx
    a75c:	45 85 c9             	test   %r9d,%r9d
    a75f:	49 0f 49 d8          	cmovns %r8,%rbx
    a763:	44 8b 46 08          	mov    0x8(%rsi),%r8d
    a767:	41 39 db             	cmp    %ebx,%r11d
    a76a:	41 0f 42 c9          	cmovb  %r9d,%ecx
    a76e:	8b 52 08             	mov    0x8(%rdx),%edx
    a771:	44 89 c6             	mov    %r8d,%esi
    a774:	09 fe                	or     %edi,%esi
    a776:	45 89 c1             	mov    %r8d,%r9d
    a779:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a780:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a786:	45 29 ca             	sub    %r9d,%r10d
    a789:	45 85 c0             	test   %r8d,%r8d
    a78c:	4c 0f 49 d6          	cmovns %rsi,%r10
    a790:	89 d6                	mov    %edx,%esi
    a792:	09 fe                	or     %edi,%esi
    a794:	41 89 d1             	mov    %edx,%r9d
    a797:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a79e:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
    a7a4:	45 29 cb             	sub    %r9d,%r11d
    a7a7:	85 d2                	test   %edx,%edx
    a7a9:	4c 0f 49 de          	cmovns %rsi,%r11
    a7ad:	45 39 da             	cmp    %r11d,%r10d
    a7b0:	44 0f 47 c2          	cmova  %edx,%r8d
    a7b4:	89 ca                	mov    %ecx,%edx
    a7b6:	09 fa                	or     %edi,%edx
    a7b8:	89 ce                	mov    %ecx,%esi
    a7ba:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    a7c0:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a7c6:	41 29 f2             	sub    %esi,%r10d
    a7c9:	85 c9                	test   %ecx,%ecx
    a7cb:	4c 0f 49 d2          	cmovns %rdx,%r10
    a7cf:	44 89 c2             	mov    %r8d,%edx
    a7d2:	09 fa                	or     %edi,%edx
    a7d4:	44 89 c6             	mov    %r8d,%esi
    a7d7:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    a7dd:	29 f7                	sub    %esi,%edi
    a7df:	45 85 c0             	test   %r8d,%r8d
    a7e2:	48 0f 49 fa          	cmovns %rdx,%rdi
    a7e6:	45 31 c9             	xor    %r9d,%r9d
    a7e9:	41 39 fa             	cmp    %edi,%r10d
    a7ec:	41 0f 96 c1          	setbe  %r9b
    a7f0:	5b                   	pop    %rbx
    a7f1:	44 89 08             	mov    %r9d,(%rax)
    a7f4:	89 48 04             	mov    %ecx,0x4(%rax)
    a7f7:	44 89 40 08          	mov    %r8d,0x8(%rax)
    a7fb:	c3                   	ret
    a7fc:	44 89 08             	mov    %r9d,(%rax)
    a7ff:	89 48 04             	mov    %ecx,0x4(%rax)
    a802:	44 89 40 08          	mov    %r8d,0x8(%rax)
    a806:	c3                   	ret
    a807:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    a80e:	00 00 

hyperinterval::float::F32Enclosure::signs:
    a810:	f6 07 01             	testb  $0x1,(%rdi)
    a813:	0f 84 84 00 00 00    	je     a89d <hyperinterval::float::F32Enclosure::signs+0x8d>
    a819:	b8 00 00 00 80       	mov    $0x80000000,%eax
    a81e:	8b 57 04             	mov    0x4(%rdi),%edx
    a821:	8b 4f 08             	mov    0x8(%rdi),%ecx
    a824:	48 89 d6             	mov    %rdx,%rsi
    a827:	48 09 c6             	or     %rax,%rsi
    a82a:	89 d7                	mov    %edx,%edi
    a82c:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    a832:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a838:	49 29 fa             	sub    %rdi,%r10
    a83b:	85 d2                	test   %edx,%edx
    a83d:	4c 0f 49 d6          	cmovns %rsi,%r10
    a841:	45 31 c0             	xor    %r8d,%r8d
    a844:	41 f7 c2 00 00 00 80 	test   $0x80000000,%r10d
    a84b:	40 0f 94 c6          	sete   %sil
    a84f:	48 89 ca             	mov    %rcx,%rdx
    a852:	48 09 c2             	or     %rax,%rdx
    a855:	41 89 c9             	mov    %ecx,%r9d
    a858:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a85f:	bf 00 00 00 80       	mov    $0x80000000,%edi
    a864:	4c 29 cf             	sub    %r9,%rdi
    a867:	49 39 c2             	cmp    %rax,%r10
    a86a:	77 1b                	ja     a887 <hyperinterval::float::F32Enclosure::signs+0x77>
    a86c:	44 8d 56 02          	lea    0x2(%rsi),%r10d
    a870:	4d 85 c9             	test   %r9,%r9
    a873:	41 88 f0             	mov    %sil,%r8b
    a876:	41 0f b6 f2          	movzbl %r10b,%esi
    a87a:	44 0f 44 c6          	cmove  %esi,%r8d
    a87e:	85 c9                	test   %ecx,%ecx
    a880:	44 0f 49 c6          	cmovns %esi,%r8d
    a884:	44 89 c6             	mov    %r8d,%esi
    a887:	85 c9                	test   %ecx,%ecx
    a889:	48 0f 48 d7          	cmovs  %rdi,%rdx
    a88d:	8d 4e 04             	lea    0x4(%rsi),%ecx
    a890:	39 c2                	cmp    %eax,%edx
    a892:	40 0f b6 d6          	movzbl %sil,%edx
    a896:	0f b6 c1             	movzbl %cl,%eax
    a899:	0f 46 c2             	cmovbe %edx,%eax
    a89c:	c3                   	ret
    a89d:	31 c0                	xor    %eax,%eax
    a89f:	c3                   	ret

hyperinterval::float::F32Enclosure::abs:
    a8a0:	48 89 f8             	mov    %rdi,%rax
    a8a3:	f6 06 01             	testb  $0x1,(%rsi)
    a8a6:	74 24                	je     a8cc <hyperinterval::float::F32Enclosure::abs+0x2c>
    a8a8:	8b 4e 04             	mov    0x4(%rsi),%ecx
    a8ab:	85 c9                	test   %ecx,%ecx
    a8ad:	0f 99 c2             	setns  %dl
    a8b0:	f7 c1 ff ff ff 7f    	test   $0x7fffffff,%ecx
    a8b6:	40 0f 94 c7          	sete   %dil
    a8ba:	40 08 d7             	or     %dl,%dil
    a8bd:	74 14                	je     a8d3 <hyperinterval::float::F32Enclosure::abs+0x33>
    a8bf:	8b 4e 08             	mov    0x8(%rsi),%ecx
    a8c2:	89 48 08             	mov    %ecx,0x8(%rax)
    a8c5:	48 8b 0e             	mov    (%rsi),%rcx
    a8c8:	48 89 08             	mov    %rcx,(%rax)
    a8cb:	c3                   	ret
    a8cc:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
    a8d2:	c3                   	ret
    a8d3:	8b 56 08             	mov    0x8(%rsi),%edx
    a8d6:	85 d2                	test   %edx,%edx
    a8d8:	40 0f 98 c7          	sets   %dil
    a8dc:	48 89 d6             	mov    %rdx,%rsi
    a8df:	48 81 e6 ff ff ff 7f 	and    $0x7fffffff,%rsi
    a8e6:	41 0f 95 c0          	setne  %r8b
    a8ea:	44 84 c7             	test   %r8b,%dil
    a8ed:	74 19                	je     a908 <hyperinterval::float::F32Enclosure::abs+0x68>
    a8ef:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    a8f5:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    a8fb:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
    a901:	89 50 04             	mov    %edx,0x4(%rax)
    a904:	89 48 08             	mov    %ecx,0x8(%rax)
    a907:	c3                   	ret
    a908:	89 cf                	mov    %ecx,%edi
    a90a:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    a910:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    a916:	41 89 d1             	mov    %edx,%r9d
    a919:	45 09 c1             	or     %r8d,%r9d
    a91c:	41 29 f0             	sub    %esi,%r8d
    a91f:	85 d2                	test   %edx,%edx
    a921:	4d 0f 49 c1          	cmovns %r9,%r8
    a925:	41 39 c8             	cmp    %ecx,%r8d
    a928:	0f 43 fa             	cmovae %edx,%edi
    a92b:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
    a932:	89 78 08             	mov    %edi,0x8(%rax)
    a935:	c3                   	ret
    a936:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    a93d:	00 00 00 

hyperinterval::float::F32Enclosure::min_image:
    a940:	48 89 f8             	mov    %rdi,%rax
    a943:	31 c9                	xor    %ecx,%ecx
    a945:	f6 06 01             	testb  $0x1,(%rsi)
    a948:	0f 84 d8 00 00 00    	je     aa26 <hyperinterval::float::F32Enclosure::min_image+0xe6>
    a94e:	f6 02 01             	testb  $0x1,(%rdx)
    a951:	0f 84 c7 00 00 00    	je     aa1e <hyperinterval::float::F32Enclosure::min_image+0xde>
    a957:	f3 0f 7e 4e 04       	movq   0x4(%rsi),%xmm1
    a95c:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
    a961:	66 0f ef d2          	pxor   %xmm2,%xmm2
    a965:	66 0f 6f e1          	movdqa %xmm1,%xmm4
    a969:	66 0f 62 e2          	punpckldq %xmm2,%xmm4
    a96d:	66 0f 6f e8          	movdqa %xmm0,%xmm5
    a971:	66 0f 62 ea          	punpckldq %xmm2,%xmm5
    a975:	66 0f 70 f1 50       	pshufd $0x50,%xmm1,%xmm6
    a97a:	66 0f ef db          	pxor   %xmm3,%xmm3
    a97e:	66 0f 66 de          	pcmpgtd %xmm6,%xmm3
    a982:	66 0f 70 f0 50       	pshufd $0x50,%xmm0,%xmm6
    a987:	66 0f 66 d6          	pcmpgtd %xmm6,%xmm2
    a98b:	66 0f 6f 35 7d 39 04 	movdqa 0x4397d(%rip),%xmm6        # 4e310 <_fini+0xc14>
    a992:	00 
    a993:	66 0f 6f fc          	movdqa %xmm4,%xmm7
    a997:	66 0f eb fe          	por    %xmm6,%xmm7
    a99b:	66 44 0f 6f 05 7c 39 	movdqa 0x4397c(%rip),%xmm8        # 4e320 <_fini+0xc24>
    a9a2:	04 00 
    a9a4:	66 41 0f db e0       	pand   %xmm8,%xmm4
    a9a9:	66 44 0f 6f ce       	movdqa %xmm6,%xmm9
    a9ae:	66 44 0f fb cc       	psubq  %xmm4,%xmm9
    a9b3:	66 44 0f db cb       	pand   %xmm3,%xmm9
    a9b8:	66 0f df df          	pandn  %xmm7,%xmm3
    a9bc:	66 41 0f eb d9       	por    %xmm9,%xmm3
    a9c1:	66 0f 6f e5          	movdqa %xmm5,%xmm4
    a9c5:	66 0f eb e6          	por    %xmm6,%xmm4
    a9c9:	66 41 0f db e8       	pand   %xmm8,%xmm5
    a9ce:	66 0f 6f fe          	movdqa %xmm6,%xmm7
    a9d2:	66 0f fb fd          	psubq  %xmm5,%xmm7
    a9d6:	66 0f db fa          	pand   %xmm2,%xmm7
    a9da:	66 0f df d4          	pandn  %xmm4,%xmm2
    a9de:	66 0f eb d7          	por    %xmm7,%xmm2
    a9e2:	66 0f ef d6          	pxor   %xmm6,%xmm2
    a9e6:	66 0f ef de          	pxor   %xmm6,%xmm3
    a9ea:	66 0f 6f e3          	movdqa %xmm3,%xmm4
    a9ee:	66 0f 66 e2          	pcmpgtd %xmm2,%xmm4
    a9f2:	66 0f 70 ec e8       	pshufd $0xe8,%xmm4,%xmm5
    a9f7:	66 0f 76 da          	pcmpeqd %xmm2,%xmm3
    a9fb:	66 0f 70 db fd       	pshufd $0xfd,%xmm3,%xmm3
    aa00:	66 0f db dd          	pand   %xmm5,%xmm3
    aa04:	66 0f 70 d4 fd       	pshufd $0xfd,%xmm4,%xmm2
    aa09:	66 0f eb d3          	por    %xmm3,%xmm2
    aa0d:	66 0f db c2          	pand   %xmm2,%xmm0
    aa11:	66 0f df d1          	pandn  %xmm1,%xmm2
    aa15:	66 0f eb d0          	por    %xmm0,%xmm2
    aa19:	b9 01 00 00 00       	mov    $0x1,%ecx
    aa1e:	89 08                	mov    %ecx,(%rax)
    aa20:	66 0f d6 50 04       	movq   %xmm2,0x4(%rax)
    aa25:	c3                   	ret
    aa26:	89 08                	mov    %ecx,(%rax)
    aa28:	0f 13 50 04          	movlps %xmm2,0x4(%rax)
    aa2c:	c3                   	ret
    aa2d:	0f 1f 00             	nopl   (%rax)

hyperinterval::float::F32Enclosure::max_image:
    aa30:	48 89 f8             	mov    %rdi,%rax
    aa33:	31 c9                	xor    %ecx,%ecx
    aa35:	f6 06 01             	testb  $0x1,(%rsi)
    aa38:	0f 84 d8 00 00 00    	je     ab16 <hyperinterval::float::F32Enclosure::max_image+0xe6>
    aa3e:	f6 02 01             	testb  $0x1,(%rdx)
    aa41:	0f 84 c7 00 00 00    	je     ab0e <hyperinterval::float::F32Enclosure::max_image+0xde>
    aa47:	f3 0f 7e 4e 04       	movq   0x4(%rsi),%xmm1
    aa4c:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
    aa51:	66 0f ef d2          	pxor   %xmm2,%xmm2
    aa55:	66 0f 6f e1          	movdqa %xmm1,%xmm4
    aa59:	66 0f 62 e2          	punpckldq %xmm2,%xmm4
    aa5d:	66 0f 6f e8          	movdqa %xmm0,%xmm5
    aa61:	66 0f 62 ea          	punpckldq %xmm2,%xmm5
    aa65:	66 0f 70 f1 50       	pshufd $0x50,%xmm1,%xmm6
    aa6a:	66 0f ef db          	pxor   %xmm3,%xmm3
    aa6e:	66 0f 66 de          	pcmpgtd %xmm6,%xmm3
    aa72:	66 0f 70 f0 50       	pshufd $0x50,%xmm0,%xmm6
    aa77:	66 0f 66 d6          	pcmpgtd %xmm6,%xmm2
    aa7b:	66 0f 6f 35 8d 38 04 	movdqa 0x4388d(%rip),%xmm6        # 4e310 <_fini+0xc14>
    aa82:	00 
    aa83:	66 0f 6f fc          	movdqa %xmm4,%xmm7
    aa87:	66 0f eb fe          	por    %xmm6,%xmm7
    aa8b:	66 44 0f 6f 05 8c 38 	movdqa 0x4388c(%rip),%xmm8        # 4e320 <_fini+0xc24>
    aa92:	04 00 
    aa94:	66 41 0f db e0       	pand   %xmm8,%xmm4
    aa99:	66 44 0f 6f ce       	movdqa %xmm6,%xmm9
    aa9e:	66 44 0f fb cc       	psubq  %xmm4,%xmm9
    aaa3:	66 44 0f db cb       	pand   %xmm3,%xmm9
    aaa8:	66 0f df df          	pandn  %xmm7,%xmm3
    aaac:	66 41 0f eb d9       	por    %xmm9,%xmm3
    aab1:	66 0f 6f e5          	movdqa %xmm5,%xmm4
    aab5:	66 0f eb e6          	por    %xmm6,%xmm4
    aab9:	66 41 0f db e8       	pand   %xmm8,%xmm5
    aabe:	66 0f 6f fe          	movdqa %xmm6,%xmm7
    aac2:	66 0f fb fd          	psubq  %xmm5,%xmm7
    aac6:	66 0f db fa          	pand   %xmm2,%xmm7
    aaca:	66 0f df d4          	pandn  %xmm4,%xmm2
    aace:	66 0f eb d7          	por    %xmm7,%xmm2
    aad2:	66 0f ef de          	pxor   %xmm6,%xmm3
    aad6:	66 0f ef d6          	pxor   %xmm6,%xmm2
    aada:	66 0f 6f e2          	movdqa %xmm2,%xmm4
    aade:	66 0f 66 e3          	pcmpgtd %xmm3,%xmm4
    aae2:	66 0f 70 ec e8       	pshufd $0xe8,%xmm4,%xmm5
    aae7:	66 0f 76 d3          	pcmpeqd %xmm3,%xmm2
    aaeb:	66 0f 70 da fd       	pshufd $0xfd,%xmm2,%xmm3
    aaf0:	66 0f db dd          	pand   %xmm5,%xmm3
    aaf4:	66 0f 70 d4 fd       	pshufd $0xfd,%xmm4,%xmm2
    aaf9:	66 0f eb d3          	por    %xmm3,%xmm2
    aafd:	66 0f db c2          	pand   %xmm2,%xmm0
    ab01:	66 0f df d1          	pandn  %xmm1,%xmm2
    ab05:	66 0f eb d0          	por    %xmm0,%xmm2
    ab09:	b9 01 00 00 00       	mov    $0x1,%ecx
    ab0e:	89 08                	mov    %ecx,(%rax)
    ab10:	66 0f d6 50 04       	movq   %xmm2,0x4(%rax)
    ab15:	c3                   	ret
    ab16:	89 08                	mov    %ecx,(%rax)
    ab18:	0f 13 50 04          	movlps %xmm2,0x4(%rax)
    ab1c:	c3                   	ret
    ab1d:	0f 1f 00             	nopl   (%rax)

hyperinterval::float::F32Enclosure::add:
    ab20:	48 89 f8             	mov    %rdi,%rax
    ab23:	f6 06 01             	testb  $0x1,(%rsi)
    ab26:	0f 84 d6 00 00 00    	je     ac02 <hyperinterval::float::F32Enclosure::add+0xe2>
    ab2c:	f6 02 01             	testb  $0x1,(%rdx)
    ab2f:	0f 84 cd 00 00 00    	je     ac02 <hyperinterval::float::F32Enclosure::add+0xe2>
    ab35:	41 57                	push   %r15
    ab37:	41 56                	push   %r14
    ab39:	41 55                	push   %r13
    ab3b:	41 54                	push   %r12
    ab3d:	53                   	push   %rbx
    ab3e:	48 83 ec 20          	sub    $0x20,%rsp
    ab42:	49 89 c4             	mov    %rax,%r12
    ab45:	8b 5e 08             	mov    0x8(%rsi),%ebx
    ab48:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
    ab4e:	44 8b 42 04          	mov    0x4(%rdx),%r8d
    ab52:	44 8b 72 08          	mov    0x8(%rdx),%r14d
    ab56:	8b 4e 04             	mov    0x4(%rsi),%ecx
    ab59:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    ab5e:	be 00 00 00 80       	mov    $0x80000000,%esi
    ab63:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ab68:	e8 83 47 00 00       	call   f2f0 <hyperinterval::ieee::Format::add>
    ab6d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    ab72:	74 6b                	je     abdf <hyperinterval::float::F32Enclosure::add+0xbf>
    ab74:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
    ab79:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    ab7e:	be 00 00 00 80       	mov    $0x80000000,%esi
    ab83:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ab88:	48 89 d9             	mov    %rbx,%rcx
    ab8b:	4d 89 f0             	mov    %r14,%r8
    ab8e:	e8 5d 47 00 00       	call   f2f0 <hyperinterval::ieee::Format::add>
    ab93:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    ab98:	74 45                	je     abdf <hyperinterval::float::F32Enclosure::add+0xbf>
    ab9a:	8b 5c 24 18          	mov    0x18(%rsp),%ebx
    ab9e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    aba3:	be 00 00 00 80       	mov    $0x80000000,%esi
    aba8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    abad:	4c 89 f9             	mov    %r15,%rcx
    abb0:	e8 8b 41 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    abb5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    abba:	74 23                	je     abdf <hyperinterval::float::F32Enclosure::add+0xbf>
    abbc:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
    abc1:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    abc6:	be 00 00 00 80       	mov    $0x80000000,%esi
    abcb:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    abd0:	48 89 d9             	mov    %rbx,%rcx
    abd3:	e8 68 41 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    abd8:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    abdd:	75 2a                	jne    ac09 <hyperinterval::float::F32Enclosure::add+0xe9>
    abdf:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
    abe4:	4c 89 e0             	mov    %r12,%rax
    abe7:	41 88 4c 24 04       	mov    %cl,0x4(%r12)
    abec:	41 c7 04 24 02 00 00 	movl   $0x2,(%r12)
    abf3:	00 
    abf4:	48 83 c4 20          	add    $0x20,%rsp
    abf8:	5b                   	pop    %rbx
    abf9:	41 5c                	pop    %r12
    abfb:	41 5d                	pop    %r13
    abfd:	41 5e                	pop    %r14
    abff:	41 5f                	pop    %r15
    ac01:	c3                   	ret
    ac02:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
    ac08:	c3                   	ret
    ac09:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
    ac0d:	44 89 f0             	mov    %r14d,%eax
    ac10:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    ac15:	89 ca                	mov    %ecx,%edx
    ac17:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    ac1d:	be 00 00 00 80       	mov    $0x80000000,%esi
    ac22:	29 c6                	sub    %eax,%esi
    ac24:	44 09 e8             	or     %r13d,%eax
    ac27:	45 85 f6             	test   %r14d,%r14d
    ac2a:	48 0f 49 f0          	cmovns %rax,%rsi
    ac2e:	89 d0                	mov    %edx,%eax
    ac30:	44 09 e8             	or     %r13d,%eax
    ac33:	41 29 d5             	sub    %edx,%r13d
    ac36:	85 c9                	test   %ecx,%ecx
    ac38:	4c 0f 49 e8          	cmovns %rax,%r13
    ac3c:	44 39 ee             	cmp    %r13d,%esi
    ac3f:	4c 89 e0             	mov    %r12,%rax
    ac42:	76 0c                	jbe    ac50 <hyperinterval::float::F32Enclosure::add+0x130>
    ac44:	c6 40 04 01          	movb   $0x1,0x4(%rax)
    ac48:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
    ac4e:	eb a4                	jmp    abf4 <hyperinterval::float::F32Enclosure::add+0xd4>
    ac50:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
    ac56:	44 89 70 04          	mov    %r14d,0x4(%rax)
    ac5a:	89 48 08             	mov    %ecx,0x8(%rax)
    ac5d:	eb 95                	jmp    abf4 <hyperinterval::float::F32Enclosure::add+0xd4>
    ac5f:	90                   	nop

hyperinterval::float::F32Enclosure::sub:
    ac60:	53                   	push   %rbx
    ac61:	48 83 ec 10          	sub    $0x10,%rsp
    ac65:	48 89 fb             	mov    %rdi,%rbx
    ac68:	f6 02 01             	testb  $0x1,(%rdx)
    ac6b:	74 29                	je     ac96 <hyperinterval::float::F32Enclosure::sub+0x36>
    ac6d:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
    ac72:	66 0f 70 c8 e1       	pshufd $0xe1,%xmm0,%xmm1
    ac77:	66 0f ef c0          	pxor   %xmm0,%xmm0
    ac7b:	66 0f 6f 15 7d 36 04 	movdqa 0x4367d(%rip),%xmm2        # 4e300 <_fini+0xc04>
    ac82:	00 
    ac83:	66 0f ef d1          	pxor   %xmm1,%xmm2
    ac87:	66 0f 76 c1          	pcmpeqd %xmm1,%xmm0
    ac8b:	66 0f df c2          	pandn  %xmm2,%xmm0
    ac8f:	b8 01 00 00 00       	mov    $0x1,%eax
    ac94:	eb 02                	jmp    ac98 <hyperinterval::float::F32Enclosure::sub+0x38>
    ac96:	31 c0                	xor    %eax,%eax
    ac98:	89 44 24 04          	mov    %eax,0x4(%rsp)
    ac9c:	66 0f d6 44 24 08    	movq   %xmm0,0x8(%rsp)
    aca2:	48 8d 54 24 04       	lea    0x4(%rsp),%rdx
    aca7:	48 89 df             	mov    %rbx,%rdi
    acaa:	ff 15 28 5a 05 00    	call   *0x55a28(%rip)        # 606d8 <_GLOBAL_OFFSET_TABLE_+0x120>
    acb0:	48 89 d8             	mov    %rbx,%rax
    acb3:	48 83 c4 10          	add    $0x10,%rsp
    acb7:	5b                   	pop    %rbx
    acb8:	c3                   	ret
    acb9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

hyperinterval::float::F32Enclosure::corner_image:
    acc0:	f6 06 01             	testb  $0x1,(%rsi)
    acc3:	0f 84 b4 03 00 00    	je     b07d <hyperinterval::float::F32Enclosure::corner_image+0x3bd>
    acc9:	f6 02 01             	testb  $0x1,(%rdx)
    accc:	0f 84 ab 03 00 00    	je     b07d <hyperinterval::float::F32Enclosure::corner_image+0x3bd>
    acd2:	55                   	push   %rbp
    acd3:	41 57                	push   %r15
    acd5:	41 56                	push   %r14
    acd7:	41 55                	push   %r13
    acd9:	41 54                	push   %r12
    acdb:	53                   	push   %rbx
    acdc:	48 83 ec 78          	sub    $0x78,%rsp
    ace0:	48 89 7c 24 60       	mov    %rdi,0x60(%rsp)
    ace5:	44 8b 62 04          	mov    0x4(%rdx),%r12d
    ace9:	8b 42 08             	mov    0x8(%rdx),%eax
    acec:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
    acf1:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
    acf5:	8b 46 08             	mov    0x8(%rsi),%eax
    acf8:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
    acfd:	84 c9                	test   %cl,%cl
    acff:	0f 84 7f 03 00 00    	je     b084 <hyperinterval::float::F32Enclosure::corner_image+0x3c4>
    ad05:	48 89 e7             	mov    %rsp,%rdi
    ad08:	be 00 00 00 80       	mov    $0x80000000,%esi
    ad0d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ad12:	4c 89 e9             	mov    %r13,%rcx
    ad15:	4d 89 e0             	mov    %r12,%r8
    ad18:	e8 73 4c 00 00       	call   f990 <hyperinterval::ieee::Format::div>
    ad1d:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ad21:	0f 85 4d 04 00 00    	jne    b174 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    ad27:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    ad2b:	8b 6c 24 10          	mov    0x10(%rsp),%ebp
    ad2f:	48 89 e7             	mov    %rsp,%rdi
    ad32:	be 00 00 00 80       	mov    $0x80000000,%esi
    ad37:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ad3c:	e8 ff 3f 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    ad41:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ad45:	0f 85 29 04 00 00    	jne    b174 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    ad4b:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
    ad50:	48 89 e7             	mov    %rsp,%rdi
    ad53:	be 00 00 00 80       	mov    $0x80000000,%esi
    ad58:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ad5d:	48 89 e9             	mov    %rbp,%rcx
    ad60:	e8 db 3f 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    ad65:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ad69:	0f 85 05 04 00 00    	jne    b174 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    ad6f:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    ad74:	44 89 f0             	mov    %r14d,%eax
    ad77:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    ad7c:	89 d9                	mov    %ebx,%ecx
    ad7e:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    ad84:	ba 00 00 00 80       	mov    $0x80000000,%edx
    ad89:	29 c2                	sub    %eax,%edx
    ad8b:	be 00 00 00 80       	mov    $0x80000000,%esi
    ad90:	09 f0                	or     %esi,%eax
    ad92:	45 85 f6             	test   %r14d,%r14d
    ad95:	48 0f 49 d0          	cmovns %rax,%rdx
    ad99:	b8 00 00 00 80       	mov    $0x80000000,%eax
    ad9e:	29 c8                	sub    %ecx,%eax
    ada0:	09 f1                	or     %esi,%ecx
    ada2:	85 db                	test   %ebx,%ebx
    ada4:	48 0f 49 c1          	cmovns %rcx,%rax
    ada8:	40 b5 01             	mov    $0x1,%bpl
    adab:	39 c2                	cmp    %eax,%edx
    adad:	0f 87 c6 03 00 00    	ja     b179 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    adb3:	48 89 e7             	mov    %rsp,%rdi
    adb6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    adbb:	4c 89 e9             	mov    %r13,%rcx
    adbe:	4c 8b 44 24 50       	mov    0x50(%rsp),%r8
    adc3:	e8 c8 4b 00 00       	call   f990 <hyperinterval::ieee::Format::div>
    adc8:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    adcc:	0f 85 a2 03 00 00    	jne    b174 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    add2:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    add6:	44 8b 6c 24 10       	mov    0x10(%rsp),%r13d
    addb:	48 89 e7             	mov    %rsp,%rdi
    adde:	be 00 00 00 80       	mov    $0x80000000,%esi
    ade3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ade8:	e8 53 3f 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    aded:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    adf1:	0f 85 7d 03 00 00    	jne    b174 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    adf7:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
    adfc:	48 89 e7             	mov    %rsp,%rdi
    adff:	be 00 00 00 80       	mov    $0x80000000,%esi
    ae04:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ae09:	4c 89 e9             	mov    %r13,%rcx
    ae0c:	e8 2f 3f 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    ae11:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ae15:	0f 85 59 03 00 00    	jne    b174 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    ae1b:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    ae20:	44 89 f9             	mov    %r15d,%ecx
    ae23:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    ae29:	44 89 e8             	mov    %r13d,%eax
    ae2c:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    ae31:	ba 00 00 00 80       	mov    $0x80000000,%edx
    ae36:	48 29 ca             	sub    %rcx,%rdx
    ae39:	bf 00 00 00 80       	mov    $0x80000000,%edi
    ae3e:	48 09 f9             	or     %rdi,%rcx
    ae41:	45 85 ff             	test   %r15d,%r15d
    ae44:	48 0f 48 ca          	cmovs  %rdx,%rcx
    ae48:	ba 00 00 00 80       	mov    $0x80000000,%edx
    ae4d:	48 29 c2             	sub    %rax,%rdx
    ae50:	48 09 f8             	or     %rdi,%rax
    ae53:	45 85 ed             	test   %r13d,%r13d
    ae56:	48 0f 48 c2          	cmovs  %rdx,%rax
    ae5a:	48 39 c1             	cmp    %rax,%rcx
    ae5d:	0f 87 16 03 00 00    	ja     b179 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    ae63:	44 89 f2             	mov    %r14d,%edx
    ae66:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    ae6c:	be 00 00 00 80       	mov    $0x80000000,%esi
    ae71:	29 d6                	sub    %edx,%esi
    ae73:	09 fa                	or     %edi,%edx
    ae75:	45 85 f6             	test   %r14d,%r14d
    ae78:	48 0f 49 f2          	cmovns %rdx,%rsi
    ae7c:	39 ce                	cmp    %ecx,%esi
    ae7e:	45 0f 46 fe          	cmovbe %r14d,%r15d
    ae82:	89 d9                	mov    %ebx,%ecx
    ae84:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    ae8a:	ba 00 00 00 80       	mov    $0x80000000,%edx
    ae8f:	29 ca                	sub    %ecx,%edx
    ae91:	09 f9                	or     %edi,%ecx
    ae93:	85 db                	test   %ebx,%ebx
    ae95:	48 0f 49 d1          	cmovns %rcx,%rdx
    ae99:	39 c2                	cmp    %eax,%edx
    ae9b:	44 0f 43 eb          	cmovae %ebx,%r13d
    ae9f:	48 89 e7             	mov    %rsp,%rdi
    aea2:	be 00 00 00 80       	mov    $0x80000000,%esi
    aea7:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    aeac:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    aeb1:	4d 89 e0             	mov    %r12,%r8
    aeb4:	e8 d7 4a 00 00       	call   f990 <hyperinterval::ieee::Format::div>
    aeb9:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    aebd:	0f 85 b1 02 00 00    	jne    b174 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    aec3:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    aec7:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
    aecc:	48 89 e7             	mov    %rsp,%rdi
    aecf:	be 00 00 00 80       	mov    $0x80000000,%esi
    aed4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    aed9:	e8 62 3e 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    aede:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    aee2:	0f 85 8c 02 00 00    	jne    b174 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    aee8:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    aeed:	48 89 e7             	mov    %rsp,%rdi
    aef0:	be 00 00 00 80       	mov    $0x80000000,%esi
    aef5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    aefa:	4c 89 e1             	mov    %r12,%rcx
    aefd:	e8 3e 3e 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    af02:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    af06:	0f 85 68 02 00 00    	jne    b174 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    af0c:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    af11:	89 d9                	mov    %ebx,%ecx
    af13:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    af19:	44 89 e0             	mov    %r12d,%eax
    af1c:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    af21:	ba 00 00 00 80       	mov    $0x80000000,%edx
    af26:	48 29 ca             	sub    %rcx,%rdx
    af29:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    af2f:	4c 09 c1             	or     %r8,%rcx
    af32:	85 db                	test   %ebx,%ebx
    af34:	48 0f 48 ca          	cmovs  %rdx,%rcx
    af38:	ba 00 00 00 80       	mov    $0x80000000,%edx
    af3d:	48 29 c2             	sub    %rax,%rdx
    af40:	4c 09 c0             	or     %r8,%rax
    af43:	45 85 e4             	test   %r12d,%r12d
    af46:	48 0f 48 c2          	cmovs  %rdx,%rax
    af4a:	48 39 c1             	cmp    %rax,%rcx
    af4d:	0f 87 26 02 00 00    	ja     b179 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    af53:	44 89 fa             	mov    %r15d,%edx
    af56:	44 09 c2             	or     %r8d,%edx
    af59:	44 89 fe             	mov    %r15d,%esi
    af5c:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    af62:	bf 00 00 00 80       	mov    $0x80000000,%edi
    af67:	29 f7                	sub    %esi,%edi
    af69:	45 85 ff             	test   %r15d,%r15d
    af6c:	48 0f 49 fa          	cmovns %rdx,%rdi
    af70:	39 cf                	cmp    %ecx,%edi
    af72:	41 0f 46 df          	cmovbe %r15d,%ebx
    af76:	44 89 e9             	mov    %r13d,%ecx
    af79:	44 09 c1             	or     %r8d,%ecx
    af7c:	44 89 ea             	mov    %r13d,%edx
    af7f:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    af85:	be 00 00 00 80       	mov    $0x80000000,%esi
    af8a:	29 d6                	sub    %edx,%esi
    af8c:	45 85 ed             	test   %r13d,%r13d
    af8f:	48 0f 49 f1          	cmovns %rcx,%rsi
    af93:	39 c6                	cmp    %eax,%esi
    af95:	45 0f 43 e5          	cmovae %r13d,%r12d
    af99:	48 89 e7             	mov    %rsp,%rdi
    af9c:	be 00 00 00 80       	mov    $0x80000000,%esi
    afa1:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    afa6:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    afab:	4c 8b 44 24 50       	mov    0x50(%rsp),%r8
    afb0:	e8 db 49 00 00       	call   f990 <hyperinterval::ieee::Format::div>
    afb5:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    afb9:	0f 85 b5 01 00 00    	jne    b174 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    afbf:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    afc3:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
    afc8:	48 89 e7             	mov    %rsp,%rdi
    afcb:	be 00 00 00 80       	mov    $0x80000000,%esi
    afd0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    afd5:	e8 66 3d 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    afda:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    afde:	0f 85 90 01 00 00    	jne    b174 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    afe4:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    afe9:	48 89 e7             	mov    %rsp,%rdi
    afec:	be 00 00 00 80       	mov    $0x80000000,%esi
    aff1:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    aff6:	4c 89 f1             	mov    %r14,%rcx
    aff9:	e8 42 3d 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    affe:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    b002:	0f 85 6c 01 00 00    	jne    b174 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    b008:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    b00d:	44 89 ea             	mov    %r13d,%edx
    b010:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    b016:	89 c1                	mov    %eax,%ecx
    b018:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    b01e:	be 00 00 00 80       	mov    $0x80000000,%esi
    b023:	48 29 d6             	sub    %rdx,%rsi
    b026:	bf 00 00 00 80       	mov    $0x80000000,%edi
    b02b:	48 09 fa             	or     %rdi,%rdx
    b02e:	45 85 ed             	test   %r13d,%r13d
    b031:	48 0f 48 d6          	cmovs  %rsi,%rdx
    b035:	be 00 00 00 80       	mov    $0x80000000,%esi
    b03a:	48 29 ce             	sub    %rcx,%rsi
    b03d:	48 09 f9             	or     %rdi,%rcx
    b040:	85 c0                	test   %eax,%eax
    b042:	48 0f 48 ce          	cmovs  %rsi,%rcx
    b046:	48 39 ca             	cmp    %rcx,%rdx
    b049:	0f 87 2a 01 00 00    	ja     b179 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    b04f:	89 de                	mov    %ebx,%esi
    b051:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
    b057:	44 09 ce             	or     %r9d,%esi
    b05a:	89 df                	mov    %ebx,%edi
    b05c:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    b062:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    b068:	41 29 f8             	sub    %edi,%r8d
    b06b:	85 db                	test   %ebx,%ebx
    b06d:	4c 0f 49 c6          	cmovns %rsi,%r8
    b071:	41 39 d0             	cmp    %edx,%r8d
    b074:	44 0f 46 eb          	cmovbe %ebx,%r13d
    b078:	e9 3a 05 00 00       	jmp    b5b7 <hyperinterval::float::F32Enclosure::corner_image+0x8f7>
    b07d:	c7 07 00 00 00 00    	movl   $0x0,(%rdi)
    b083:	c3                   	ret
    b084:	44 89 e8             	mov    %r13d,%eax
    b087:	c1 e8 17             	shr    $0x17,%eax
    b08a:	0f b6 d8             	movzbl %al,%ebx
    b08d:	44 89 e9             	mov    %r13d,%ecx
    b090:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
    b096:	45 31 f6             	xor    %r14d,%r14d
    b099:	85 db                	test   %ebx,%ebx
    b09b:	41 0f 95 c6          	setne  %r14b
    b09f:	b8 01 00 00 00       	mov    $0x1,%eax
    b0a4:	0f 45 c3             	cmovne %ebx,%eax
    b0a7:	41 c1 e6 17          	shl    $0x17,%r14d
    b0ab:	49 09 ce             	or     %rcx,%r14
    b0ae:	44 89 e1             	mov    %r12d,%ecx
    b0b1:	c1 e9 17             	shr    $0x17,%ecx
    b0b4:	0f b6 f1             	movzbl %cl,%esi
    b0b7:	44 89 e1             	mov    %r12d,%ecx
    b0ba:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
    b0c0:	8d 96 d4 fe ff ff    	lea    -0x12c(%rsi),%edx
    b0c6:	45 31 ff             	xor    %r15d,%r15d
    b0c9:	48 89 74 24 58       	mov    %rsi,0x58(%rsp)
    b0ce:	85 f6                	test   %esi,%esi
    b0d0:	41 0f 95 c7          	setne  %r15b
    b0d4:	be d5 fe ff ff       	mov    $0xfffffed5,%esi
    b0d9:	0f 45 f2             	cmovne %edx,%esi
    b0dc:	41 c1 e7 17          	shl    $0x17,%r15d
    b0e0:	49 09 cf             	or     %rcx,%r15
    b0e3:	44 89 e9             	mov    %r13d,%ecx
    b0e6:	44 31 e1             	xor    %r12d,%ecx
    b0e9:	4c 89 f2             	mov    %r14,%rdx
    b0ec:	49 0f af d7          	imul   %r15,%rdx
    b0f0:	01 c6                	add    %eax,%esi
    b0f2:	c1 e9 1f             	shr    $0x1f,%ecx
    b0f5:	88 4c 24 14          	mov    %cl,0x14(%rsp)
    b0f9:	48 89 14 24          	mov    %rdx,(%rsp)
    b0fd:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    b104:	00 00 
    b106:	89 74 24 10          	mov    %esi,0x10(%rsp)
    b10a:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    b10f:	48 89 e1             	mov    %rsp,%rcx
    b112:	be 00 00 00 80       	mov    $0x80000000,%esi
    b117:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b11c:	e8 bf 3e 00 00       	call   efe0 <hyperinterval::ieee::Format::rounded>
    b121:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
    b126:	74 07                	je     b12f <hyperinterval::float::F32Enclosure::corner_image+0x46f>
    b128:	0f b6 6c 24 29       	movzbl 0x29(%rsp),%ebp
    b12d:	eb 4a                	jmp    b179 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    b12f:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
    b133:	8b 6c 24 38          	mov    0x38(%rsp),%ebp
    b137:	48 89 e7             	mov    %rsp,%rdi
    b13a:	be 00 00 00 80       	mov    $0x80000000,%esi
    b13f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b144:	e8 f7 3b 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    b149:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    b14d:	75 25                	jne    b174 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    b14f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    b154:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    b159:	48 89 e7             	mov    %rsp,%rdi
    b15c:	be 00 00 00 80       	mov    $0x80000000,%esi
    b161:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b166:	48 89 e9             	mov    %rbp,%rcx
    b169:	e8 d2 3b 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    b16e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    b172:	74 23                	je     b197 <hyperinterval::float::F32Enclosure::corner_image+0x4d7>
    b174:	0f b6 6c 24 01       	movzbl 0x1(%rsp),%ebp
    b179:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
    b17e:	40 88 68 04          	mov    %bpl,0x4(%rax)
    b182:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
    b188:	48 83 c4 78          	add    $0x78,%rsp
    b18c:	5b                   	pop    %rbx
    b18d:	41 5c                	pop    %r12
    b18f:	41 5d                	pop    %r13
    b191:	41 5e                	pop    %r14
    b193:	41 5f                	pop    %r15
    b195:	5d                   	pop    %rbp
    b196:	c3                   	ret
    b197:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    b19c:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
    b1a1:	44 89 c0             	mov    %r8d,%eax
    b1a4:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    b1a9:	89 f9                	mov    %edi,%ecx
    b1ab:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    b1b1:	ba 00 00 00 80       	mov    $0x80000000,%edx
    b1b6:	29 c2                	sub    %eax,%edx
    b1b8:	be 00 00 00 80       	mov    $0x80000000,%esi
    b1bd:	09 f0                	or     %esi,%eax
    b1bf:	45 85 c0             	test   %r8d,%r8d
    b1c2:	48 0f 49 d0          	cmovns %rax,%rdx
    b1c6:	b8 00 00 00 80       	mov    $0x80000000,%eax
    b1cb:	29 c8                	sub    %ecx,%eax
    b1cd:	09 f1                	or     %esi,%ecx
    b1cf:	85 ff                	test   %edi,%edi
    b1d1:	48 0f 49 c1          	cmovns %rcx,%rax
    b1d5:	40 b5 01             	mov    $0x1,%bpl
    b1d8:	39 c2                	cmp    %eax,%edx
    b1da:	77 9d                	ja     b179 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    b1dc:	48 89 7c 24 70       	mov    %rdi,0x70(%rsp)
    b1e1:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
    b1e6:	89 c8                	mov    %ecx,%eax
    b1e8:	c1 e8 17             	shr    $0x17,%eax
    b1eb:	0f b6 c0             	movzbl %al,%eax
    b1ee:	41 31 cd             	xor    %ecx,%r13d
    b1f1:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
    b1f7:	31 d2                	xor    %edx,%edx
    b1f9:	85 c0                	test   %eax,%eax
    b1fb:	be 01 00 00 00       	mov    $0x1,%esi
    b200:	0f 45 f0             	cmovne %eax,%esi
    b203:	0f 95 c2             	setne  %dl
    b206:	c1 e2 17             	shl    $0x17,%edx
    b209:	48 09 ca             	or     %rcx,%rdx
    b20c:	48 89 54 24 68       	mov    %rdx,0x68(%rsp)
    b211:	4c 0f af f2          	imul   %rdx,%r14
    b215:	89 d8                	mov    %ebx,%eax
    b217:	05 d4 fe ff ff       	add    $0xfffffed4,%eax
    b21c:	48 85 db             	test   %rbx,%rbx
    b21f:	b9 d5 fe ff ff       	mov    $0xfffffed5,%ecx
    b224:	0f 45 c8             	cmovne %eax,%ecx
    b227:	89 f3                	mov    %esi,%ebx
    b229:	01 f1                	add    %esi,%ecx
    b22b:	41 c1 ed 1f          	shr    $0x1f,%r13d
    b22f:	44 88 6c 24 14       	mov    %r13b,0x14(%rsp)
    b234:	4c 89 34 24          	mov    %r14,(%rsp)
    b238:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    b23f:	00 00 
    b241:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
    b245:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    b24a:	48 89 e1             	mov    %rsp,%rcx
    b24d:	be 00 00 00 80       	mov    $0x80000000,%esi
    b252:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b257:	e8 84 3d 00 00       	call   efe0 <hyperinterval::ieee::Format::rounded>
    b25c:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
    b261:	0f 85 c1 fe ff ff    	jne    b128 <hyperinterval::float::F32Enclosure::corner_image+0x468>
    b267:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
    b26b:	44 8b 6c 24 38       	mov    0x38(%rsp),%r13d
    b270:	48 89 e7             	mov    %rsp,%rdi
    b273:	be 00 00 00 80       	mov    $0x80000000,%esi
    b278:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b27d:	e8 be 3a 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    b282:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    b286:	0f 84 e8 fe ff ff    	je     b174 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    b28c:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
    b291:	48 89 e7             	mov    %rsp,%rdi
    b294:	be 00 00 00 80       	mov    $0x80000000,%esi
    b299:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b29e:	4c 89 e9             	mov    %r13,%rcx
    b2a1:	e8 9a 3a 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    b2a6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    b2aa:	0f 84 c4 fe ff ff    	je     b174 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    b2b0:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    b2b5:	44 89 f1             	mov    %r14d,%ecx
    b2b8:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    b2be:	44 89 e8             	mov    %r13d,%eax
    b2c1:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    b2c6:	ba 00 00 00 80       	mov    $0x80000000,%edx
    b2cb:	48 29 ca             	sub    %rcx,%rdx
    b2ce:	bf 00 00 00 80       	mov    $0x80000000,%edi
    b2d3:	48 09 f9             	or     %rdi,%rcx
    b2d6:	45 85 f6             	test   %r14d,%r14d
    b2d9:	48 0f 48 ca          	cmovs  %rdx,%rcx
    b2dd:	ba 00 00 00 80       	mov    $0x80000000,%edx
    b2e2:	48 29 c2             	sub    %rax,%rdx
    b2e5:	48 09 f8             	or     %rdi,%rax
    b2e8:	45 85 ed             	test   %r13d,%r13d
    b2eb:	48 0f 48 c2          	cmovs  %rdx,%rax
    b2ef:	48 39 c1             	cmp    %rax,%rcx
    b2f2:	0f 87 81 fe ff ff    	ja     b179 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    b2f8:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
    b2fd:	44 89 c2             	mov    %r8d,%edx
    b300:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    b306:	be 00 00 00 80       	mov    $0x80000000,%esi
    b30b:	29 d6                	sub    %edx,%esi
    b30d:	09 fa                	or     %edi,%edx
    b30f:	45 85 c0             	test   %r8d,%r8d
    b312:	48 0f 49 f2          	cmovns %rdx,%rsi
    b316:	39 ce                	cmp    %ecx,%esi
    b318:	45 0f 46 f0          	cmovbe %r8d,%r14d
    b31c:	4c 89 74 24 40       	mov    %r14,0x40(%rsp)
    b321:	48 8b 74 24 70       	mov    0x70(%rsp),%rsi
    b326:	89 f1                	mov    %esi,%ecx
    b328:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    b32e:	ba 00 00 00 80       	mov    $0x80000000,%edx
    b333:	29 ca                	sub    %ecx,%edx
    b335:	09 f9                	or     %edi,%ecx
    b337:	85 f6                	test   %esi,%esi
    b339:	48 0f 49 d1          	cmovns %rcx,%rdx
    b33d:	39 c2                	cmp    %eax,%edx
    b33f:	44 0f 43 ee          	cmovae %esi,%r13d
    b343:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
    b348:	89 f0                	mov    %esi,%eax
    b34a:	c1 e8 17             	shr    $0x17,%eax
    b34d:	0f b6 c0             	movzbl %al,%eax
    b350:	89 f1                	mov    %esi,%ecx
    b352:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
    b358:	8d 90 d4 fe ff ff    	lea    -0x12c(%rax),%edx
    b35e:	45 31 f6             	xor    %r14d,%r14d
    b361:	85 c0                	test   %eax,%eax
    b363:	41 0f 95 c6          	setne  %r14b
    b367:	bf d5 fe ff ff       	mov    $0xfffffed5,%edi
    b36c:	0f 45 fa             	cmovne %edx,%edi
    b36f:	41 c1 e6 17          	shl    $0x17,%r14d
    b373:	49 09 ce             	or     %rcx,%r14
    b376:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
    b37b:	48 85 c9             	test   %rcx,%rcx
    b37e:	b8 01 00 00 00       	mov    $0x1,%eax
    b383:	0f 45 c1             	cmovne %ecx,%eax
    b386:	41 31 f4             	xor    %esi,%r12d
    b389:	4d 0f af fe          	imul   %r14,%r15
    b38d:	89 7c 24 58          	mov    %edi,0x58(%rsp)
    b391:	01 f8                	add    %edi,%eax
    b393:	41 c1 ec 1f          	shr    $0x1f,%r12d
    b397:	44 88 64 24 14       	mov    %r12b,0x14(%rsp)
    b39c:	4c 89 3c 24          	mov    %r15,(%rsp)
    b3a0:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    b3a7:	00 00 
    b3a9:	89 44 24 10          	mov    %eax,0x10(%rsp)
    b3ad:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    b3b2:	48 89 e1             	mov    %rsp,%rcx
    b3b5:	be 00 00 00 80       	mov    $0x80000000,%esi
    b3ba:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b3bf:	e8 1c 3c 00 00       	call   efe0 <hyperinterval::ieee::Format::rounded>
    b3c4:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
    b3c9:	0f 85 59 fd ff ff    	jne    b128 <hyperinterval::float::F32Enclosure::corner_image+0x468>
    b3cf:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
    b3d3:	44 8b 64 24 38       	mov    0x38(%rsp),%r12d
    b3d8:	48 89 e7             	mov    %rsp,%rdi
    b3db:	be 00 00 00 80       	mov    $0x80000000,%esi
    b3e0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b3e5:	e8 56 39 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    b3ea:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    b3ee:	0f 85 80 fd ff ff    	jne    b174 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    b3f4:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
    b3f9:	48 89 e7             	mov    %rsp,%rdi
    b3fc:	be 00 00 00 80       	mov    $0x80000000,%esi
    b401:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b406:	4c 89 e1             	mov    %r12,%rcx
    b409:	e8 32 39 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    b40e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    b412:	0f 85 5c fd ff ff    	jne    b174 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    b418:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    b41d:	44 89 f9             	mov    %r15d,%ecx
    b420:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    b426:	44 89 e0             	mov    %r12d,%eax
    b429:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    b42e:	ba 00 00 00 80       	mov    $0x80000000,%edx
    b433:	48 29 ca             	sub    %rcx,%rdx
    b436:	bf 00 00 00 80       	mov    $0x80000000,%edi
    b43b:	48 09 f9             	or     %rdi,%rcx
    b43e:	45 85 ff             	test   %r15d,%r15d
    b441:	48 0f 48 ca          	cmovs  %rdx,%rcx
    b445:	ba 00 00 00 80       	mov    $0x80000000,%edx
    b44a:	48 29 c2             	sub    %rax,%rdx
    b44d:	48 09 f8             	or     %rdi,%rax
    b450:	45 85 e4             	test   %r12d,%r12d
    b453:	48 0f 48 c2          	cmovs  %rdx,%rax
    b457:	48 39 c1             	cmp    %rax,%rcx
    b45a:	0f 87 19 fd ff ff    	ja     b179 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    b460:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
    b465:	44 89 c2             	mov    %r8d,%edx
    b468:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    b46e:	be 00 00 00 80       	mov    $0x80000000,%esi
    b473:	29 d6                	sub    %edx,%esi
    b475:	44 89 c2             	mov    %r8d,%edx
    b478:	09 fa                	or     %edi,%edx
    b47a:	45 85 c0             	test   %r8d,%r8d
    b47d:	48 0f 49 f2          	cmovns %rdx,%rsi
    b481:	39 ce                	cmp    %ecx,%esi
    b483:	45 0f 46 f8          	cmovbe %r8d,%r15d
    b487:	44 89 e9             	mov    %r13d,%ecx
    b48a:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    b490:	ba 00 00 00 80       	mov    $0x80000000,%edx
    b495:	29 ca                	sub    %ecx,%edx
    b497:	44 89 e9             	mov    %r13d,%ecx
    b49a:	09 f9                	or     %edi,%ecx
    b49c:	45 85 ed             	test   %r13d,%r13d
    b49f:	48 0f 49 d1          	cmovns %rcx,%rdx
    b4a3:	39 c2                	cmp    %eax,%edx
    b4a5:	45 0f 43 e5          	cmovae %r13d,%r12d
    b4a9:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
    b4ae:	33 44 24 48          	xor    0x48(%rsp),%eax
    b4b2:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
    b4b7:	49 0f af ce          	imul   %r14,%rcx
    b4bb:	8b 54 24 58          	mov    0x58(%rsp),%edx
    b4bf:	01 da                	add    %ebx,%edx
    b4c1:	c1 e8 1f             	shr    $0x1f,%eax
    b4c4:	88 44 24 14          	mov    %al,0x14(%rsp)
    b4c8:	48 89 0c 24          	mov    %rcx,(%rsp)
    b4cc:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    b4d3:	00 00 
    b4d5:	89 54 24 10          	mov    %edx,0x10(%rsp)
    b4d9:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    b4de:	48 89 e1             	mov    %rsp,%rcx
    b4e1:	be 00 00 00 80       	mov    $0x80000000,%esi
    b4e6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b4eb:	e8 f0 3a 00 00       	call   efe0 <hyperinterval::ieee::Format::rounded>
    b4f0:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
    b4f5:	0f 85 2d fc ff ff    	jne    b128 <hyperinterval::float::F32Enclosure::corner_image+0x468>
    b4fb:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
    b4ff:	44 8b 74 24 38       	mov    0x38(%rsp),%r14d
    b504:	48 89 e7             	mov    %rsp,%rdi
    b507:	be 00 00 00 80       	mov    $0x80000000,%esi
    b50c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b511:	e8 2a 38 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    b516:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    b51a:	0f 85 54 fc ff ff    	jne    b174 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    b520:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    b525:	48 89 e7             	mov    %rsp,%rdi
    b528:	be 00 00 00 80       	mov    $0x80000000,%esi
    b52d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b532:	4c 89 f1             	mov    %r14,%rcx
    b535:	e8 06 38 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    b53a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    b53e:	0f 85 30 fc ff ff    	jne    b174 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    b544:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    b549:	44 89 ea             	mov    %r13d,%edx
    b54c:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    b552:	89 c1                	mov    %eax,%ecx
    b554:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    b55a:	be 00 00 00 80       	mov    $0x80000000,%esi
    b55f:	48 29 d6             	sub    %rdx,%rsi
    b562:	bf 00 00 00 80       	mov    $0x80000000,%edi
    b567:	48 09 fa             	or     %rdi,%rdx
    b56a:	45 85 ed             	test   %r13d,%r13d
    b56d:	48 0f 48 d6          	cmovs  %rsi,%rdx
    b571:	be 00 00 00 80       	mov    $0x80000000,%esi
    b576:	48 29 ce             	sub    %rcx,%rsi
    b579:	48 09 f9             	or     %rdi,%rcx
    b57c:	85 c0                	test   %eax,%eax
    b57e:	48 0f 48 ce          	cmovs  %rsi,%rcx
    b582:	48 39 ca             	cmp    %rcx,%rdx
    b585:	0f 87 ee fb ff ff    	ja     b179 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    b58b:	44 89 fe             	mov    %r15d,%esi
    b58e:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
    b594:	44 09 ce             	or     %r9d,%esi
    b597:	44 89 ff             	mov    %r15d,%edi
    b59a:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    b5a0:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    b5a6:	41 29 f8             	sub    %edi,%r8d
    b5a9:	45 85 ff             	test   %r15d,%r15d
    b5ac:	4c 0f 49 c6          	cmovns %rsi,%r8
    b5b0:	41 39 d0             	cmp    %edx,%r8d
    b5b3:	45 0f 46 ef          	cmovbe %r15d,%r13d
    b5b7:	44 89 e2             	mov    %r12d,%edx
    b5ba:	44 09 ca             	or     %r9d,%edx
    b5bd:	44 89 e6             	mov    %r12d,%esi
    b5c0:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    b5c6:	41 29 f1             	sub    %esi,%r9d
    b5c9:	45 85 e4             	test   %r12d,%r12d
    b5cc:	4c 0f 49 ca          	cmovns %rdx,%r9
    b5d0:	41 39 c9             	cmp    %ecx,%r9d
    b5d3:	41 0f 43 c4          	cmovae %r12d,%eax
    b5d7:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
    b5dc:	c7 01 01 00 00 00    	movl   $0x1,(%rcx)
    b5e2:	44 89 69 04          	mov    %r13d,0x4(%rcx)
    b5e6:	89 41 08             	mov    %eax,0x8(%rcx)
    b5e9:	e9 9a fb ff ff       	jmp    b188 <hyperinterval::float::F32Enclosure::corner_image+0x4c8>
    b5ee:	66 90                	xchg   %ax,%ax

hyperinterval::float::F32Enclosure::div:
    b5f0:	53                   	push   %rbx
    b5f1:	48 89 fb             	mov    %rdi,%rbx
    b5f4:	f6 02 01             	testb  $0x1,(%rdx)
    b5f7:	74 4d                	je     b646 <hyperinterval::float::F32Enclosure::div+0x56>
    b5f9:	8b 42 04             	mov    0x4(%rdx),%eax
    b5fc:	b9 00 00 00 80       	mov    $0x80000000,%ecx
    b601:	89 c7                	mov    %eax,%edi
    b603:	09 cf                	or     %ecx,%edi
    b605:	41 89 c0             	mov    %eax,%r8d
    b608:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
    b60f:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
    b615:	45 29 c1             	sub    %r8d,%r9d
    b618:	85 c0                	test   %eax,%eax
    b61a:	4c 0f 49 cf          	cmovns %rdi,%r9
    b61e:	41 39 c9             	cmp    %ecx,%r9d
    b621:	77 23                	ja     b646 <hyperinterval::float::F32Enclosure::div+0x56>
    b623:	8b 42 08             	mov    0x8(%rdx),%eax
    b626:	85 c0                	test   %eax,%eax
    b628:	0f 99 c1             	setns  %cl
    b62b:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
    b630:	0f 94 c0             	sete   %al
    b633:	08 c8                	or     %cl,%al
    b635:	74 0f                	je     b646 <hyperinterval::float::F32Enclosure::div+0x56>
    b637:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
    b63b:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    b641:	48 89 d8             	mov    %rbx,%rax
    b644:	5b                   	pop    %rbx
    b645:	c3                   	ret
    b646:	48 89 df             	mov    %rbx,%rdi
    b649:	b9 01 00 00 00       	mov    $0x1,%ecx
    b64e:	e8 6d f6 ff ff       	call   acc0 <hyperinterval::float::F32Enclosure::corner_image>
    b653:	48 89 d8             	mov    %rbx,%rax
    b656:	5b                   	pop    %rbx
    b657:	c3                   	ret
    b658:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    b65f:	00 

hyperinterval::float::F32Enclosure::reciprocal:
    b660:	41 57                	push   %r15
    b662:	41 56                	push   %r14
    b664:	41 54                	push   %r12
    b666:	53                   	push   %rbx
    b667:	48 83 ec 28          	sub    $0x28,%rsp
    b66b:	48 89 fb             	mov    %rdi,%rbx
    b66e:	83 3e 00             	cmpl   $0x0,(%rsi)
    b671:	74 5e                	je     b6d1 <hyperinterval::float::F32Enclosure::reciprocal+0x71>
    b673:	49 89 f6             	mov    %rsi,%r14
    b676:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
    b67c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b681:	be 00 00 00 80       	mov    $0x80000000,%esi
    b686:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b68b:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
    b690:	e8 ab 36 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    b695:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b69a:	74 25                	je     b6c1 <hyperinterval::float::F32Enclosure::reciprocal+0x61>
    b69c:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    b6a1:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b6a6:	be 00 00 00 80       	mov    $0x80000000,%esi
    b6ab:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b6b0:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
    b6b5:	e8 86 36 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    b6ba:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b6bf:	75 25                	jne    b6e6 <hyperinterval::float::F32Enclosure::reciprocal+0x86>
    b6c1:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
    b6c6:	88 4b 04             	mov    %cl,0x4(%rbx)
    b6c9:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    b6cf:	eb 06                	jmp    b6d7 <hyperinterval::float::F32Enclosure::reciprocal+0x77>
    b6d1:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
    b6d7:	48 89 d8             	mov    %rbx,%rax
    b6da:	48 83 c4 28          	add    $0x28,%rsp
    b6de:	5b                   	pop    %rbx
    b6df:	41 5c                	pop    %r12
    b6e1:	41 5e                	pop    %r14
    b6e3:	41 5f                	pop    %r15
    b6e5:	c3                   	ret
    b6e6:	8b 44 24 10          	mov    0x10(%rsp),%eax
    b6ea:	44 89 e1             	mov    %r12d,%ecx
    b6ed:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    b6f3:	89 c2                	mov    %eax,%edx
    b6f5:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    b6fb:	be 00 00 00 80       	mov    $0x80000000,%esi
    b700:	29 ce                	sub    %ecx,%esi
    b702:	44 09 f9             	or     %r15d,%ecx
    b705:	45 85 e4             	test   %r12d,%r12d
    b708:	48 0f 49 f1          	cmovns %rcx,%rsi
    b70c:	bf 00 00 00 80       	mov    $0x80000000,%edi
    b711:	29 d7                	sub    %edx,%edi
    b713:	89 d1                	mov    %edx,%ecx
    b715:	44 09 f9             	or     %r15d,%ecx
    b718:	85 c0                	test   %eax,%eax
    b71a:	48 0f 49 f9          	cmovns %rcx,%rdi
    b71e:	b1 01                	mov    $0x1,%cl
    b720:	39 fe                	cmp    %edi,%esi
    b722:	77 a2                	ja     b6c6 <hyperinterval::float::F32Enclosure::reciprocal+0x66>
    b724:	44 89 e1             	mov    %r12d,%ecx
    b727:	c1 e9 08             	shr    $0x8,%ecx
    b72a:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%rsp)
    b731:	00 
    b732:	44 88 64 24 20       	mov    %r12b,0x20(%rsp)
    b737:	41 c1 ec 18          	shr    $0x18,%r12d
    b73b:	44 88 64 24 23       	mov    %r12b,0x23(%rsp)
    b740:	66 89 4c 24 21       	mov    %cx,0x21(%rsp)
    b745:	89 44 24 24          	mov    %eax,0x24(%rsp)
    b749:	41 8b 46 04          	mov    0x4(%r14),%eax
    b74d:	89 c1                	mov    %eax,%ecx
    b74f:	44 09 f9             	or     %r15d,%ecx
    b752:	89 c2                	mov    %eax,%edx
    b754:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    b75a:	be 00 00 00 80       	mov    $0x80000000,%esi
    b75f:	29 d6                	sub    %edx,%esi
    b761:	85 c0                	test   %eax,%eax
    b763:	48 0f 49 f1          	cmovns %rcx,%rsi
    b767:	44 39 fe             	cmp    %r15d,%esi
    b76a:	77 1e                	ja     b78a <hyperinterval::float::F32Enclosure::reciprocal+0x12a>
    b76c:	41 8b 46 08          	mov    0x8(%r14),%eax
    b770:	85 c0                	test   %eax,%eax
    b772:	0f 99 c1             	setns  %cl
    b775:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
    b77a:	0f 94 c0             	sete   %al
    b77d:	08 c8                	or     %cl,%al
    b77f:	74 09                	je     b78a <hyperinterval::float::F32Enclosure::reciprocal+0x12a>
    b781:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
    b785:	e9 3f ff ff ff       	jmp    b6c9 <hyperinterval::float::F32Enclosure::reciprocal+0x69>
    b78a:	48 8d 74 24 1c       	lea    0x1c(%rsp),%rsi
    b78f:	48 89 df             	mov    %rbx,%rdi
    b792:	4c 89 f2             	mov    %r14,%rdx
    b795:	b9 01 00 00 00       	mov    $0x1,%ecx
    b79a:	e8 21 f5 ff ff       	call   acc0 <hyperinterval::float::F32Enclosure::corner_image>
    b79f:	e9 33 ff ff ff       	jmp    b6d7 <hyperinterval::float::F32Enclosure::reciprocal+0x77>
    b7a4:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    b7ab:	00 00 00 
    b7ae:	66 90                	xchg   %ax,%ax

hyperinterval::float::F32Enclosure::sqrt:
    b7b0:	48 89 f8             	mov    %rdi,%rax
    b7b3:	f6 06 01             	testb  $0x1,(%rsi)
    b7b6:	74 2c                	je     b7e4 <hyperinterval::float::F32Enclosure::sqrt+0x34>
    b7b8:	55                   	push   %rbp
    b7b9:	41 57                	push   %r15
    b7bb:	41 56                	push   %r14
    b7bd:	41 55                	push   %r13
    b7bf:	41 54                	push   %r12
    b7c1:	53                   	push   %rbx
    b7c2:	48 83 ec 18          	sub    $0x18,%rsp
    b7c6:	8b 5e 08             	mov    0x8(%rsi),%ebx
    b7c9:	85 db                	test   %ebx,%ebx
    b7cb:	0f 98 c1             	sets   %cl
    b7ce:	f7 c3 ff ff ff 7f    	test   $0x7fffffff,%ebx
    b7d4:	0f 95 c2             	setne  %dl
    b7d7:	84 d1                	test   %dl,%cl
    b7d9:	74 14                	je     b7ef <hyperinterval::float::F32Enclosure::sqrt+0x3f>
    b7db:	c6 40 04 05          	movb   $0x5,0x4(%rax)
    b7df:	e9 ce 00 00 00       	jmp    b8b2 <hyperinterval::float::F32Enclosure::sqrt+0x102>
    b7e4:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
    b7ea:	c6 40 0c 00          	movb   $0x0,0xc(%rax)
    b7ee:	c3                   	ret
    b7ef:	49 89 c7             	mov    %rax,%r15
    b7f2:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
    b7f6:	41 bc 00 00 00 80    	mov    $0x80000000,%r12d
    b7fc:	45 85 ed             	test   %r13d,%r13d
    b7ff:	0f 98 c0             	sets   %al
    b802:	41 f7 c5 ff ff ff 7f 	test   $0x7fffffff,%r13d
    b809:	40 0f 95 c5          	setne  %bpl
    b80d:	31 c9                	xor    %ecx,%ecx
    b80f:	40 20 c5             	and    %al,%bpl
    b812:	49 0f 44 cd          	cmove  %r13,%rcx
    b816:	48 89 e7             	mov    %rsp,%rdi
    b819:	be 00 00 00 80       	mov    $0x80000000,%esi
    b81e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b823:	e8 58 35 00 00       	call   ed80 <hyperinterval::ieee::Format::sqrt>
    b828:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    b82c:	74 15                	je     b843 <hyperinterval::float::F32Enclosure::sqrt+0x93>
    b82e:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
    b833:	4c 89 f8             	mov    %r15,%rax
    b836:	41 88 4f 04          	mov    %cl,0x4(%r15)
    b83a:	41 c7 07 02 00 00 00 	movl   $0x2,(%r15)
    b841:	eb 75                	jmp    b8b8 <hyperinterval::float::F32Enclosure::sqrt+0x108>
    b843:	44 8b 74 24 08       	mov    0x8(%rsp),%r14d
    b848:	41 39 dd             	cmp    %ebx,%r13d
    b84b:	74 1b                	je     b868 <hyperinterval::float::F32Enclosure::sqrt+0xb8>
    b84d:	48 89 e7             	mov    %rsp,%rdi
    b850:	be 00 00 00 80       	mov    $0x80000000,%esi
    b855:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b85a:	48 89 d9             	mov    %rbx,%rcx
    b85d:	e8 1e 35 00 00       	call   ed80 <hyperinterval::ieee::Format::sqrt>
    b862:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    b866:	74 c6                	je     b82e <hyperinterval::float::F32Enclosure::sqrt+0x7e>
    b868:	8b 5c 24 10          	mov    0x10(%rsp),%ebx
    b86c:	48 89 e7             	mov    %rsp,%rdi
    b86f:	be 00 00 00 80       	mov    $0x80000000,%esi
    b874:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b879:	4c 89 f1             	mov    %r14,%rcx
    b87c:	e8 bf 34 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    b881:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    b885:	74 20                	je     b8a7 <hyperinterval::float::F32Enclosure::sqrt+0xf7>
    b887:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
    b88c:	48 89 e7             	mov    %rsp,%rdi
    b88f:	be 00 00 00 80       	mov    $0x80000000,%esi
    b894:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b899:	48 89 d9             	mov    %rbx,%rcx
    b89c:	e8 9f 34 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    b8a1:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    b8a5:	75 20                	jne    b8c7 <hyperinterval::float::F32Enclosure::sqrt+0x117>
    b8a7:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
    b8ac:	4c 89 f8             	mov    %r15,%rax
    b8af:	88 50 04             	mov    %dl,0x4(%rax)
    b8b2:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
    b8b8:	48 83 c4 18          	add    $0x18,%rsp
    b8bc:	5b                   	pop    %rbx
    b8bd:	41 5c                	pop    %r12
    b8bf:	41 5d                	pop    %r13
    b8c1:	41 5e                	pop    %r14
    b8c3:	41 5f                	pop    %r15
    b8c5:	5d                   	pop    %rbp
    b8c6:	c3                   	ret
    b8c7:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    b8cb:	44 89 f0             	mov    %r14d,%eax
    b8ce:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    b8d3:	89 ca                	mov    %ecx,%edx
    b8d5:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    b8db:	be 00 00 00 80       	mov    $0x80000000,%esi
    b8e0:	29 c6                	sub    %eax,%esi
    b8e2:	44 09 e0             	or     %r12d,%eax
    b8e5:	45 85 f6             	test   %r14d,%r14d
    b8e8:	48 0f 49 f0          	cmovns %rax,%rsi
    b8ec:	89 d0                	mov    %edx,%eax
    b8ee:	44 09 e0             	or     %r12d,%eax
    b8f1:	41 29 d4             	sub    %edx,%r12d
    b8f4:	85 c9                	test   %ecx,%ecx
    b8f6:	4c 0f 49 e0          	cmovns %rax,%r12
    b8fa:	b2 01                	mov    $0x1,%dl
    b8fc:	44 39 e6             	cmp    %r12d,%esi
    b8ff:	4c 89 f8             	mov    %r15,%rax
    b902:	77 ab                	ja     b8af <hyperinterval::float::F32Enclosure::sqrt+0xff>
    b904:	44 89 f2             	mov    %r14d,%edx
    b907:	c1 ea 08             	shr    $0x8,%edx
    b90a:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
    b910:	44 88 70 04          	mov    %r14b,0x4(%rax)
    b914:	41 c1 ee 18          	shr    $0x18,%r14d
    b918:	44 88 70 07          	mov    %r14b,0x7(%rax)
    b91c:	66 89 50 05          	mov    %dx,0x5(%rax)
    b920:	89 48 08             	mov    %ecx,0x8(%rax)
    b923:	40 88 68 0c          	mov    %bpl,0xc(%rax)
    b927:	eb 8f                	jmp    b8b8 <hyperinterval::float::F32Enclosure::sqrt+0x108>
    b929:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

hyperinterval::float::F32Enclosure::square:
    b930:	55                   	push   %rbp
    b931:	41 57                	push   %r15
    b933:	41 56                	push   %r14
    b935:	41 55                	push   %r13
    b937:	41 54                	push   %r12
    b939:	53                   	push   %rbx
    b93a:	48 83 ec 48          	sub    $0x48,%rsp
    b93e:	48 89 fb             	mov    %rdi,%rbx
    b941:	f6 06 01             	testb  $0x1,(%rsi)
    b944:	0f 84 d8 00 00 00    	je     ba22 <hyperinterval::float::F32Enclosure::square+0xf2>
    b94a:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
    b94e:	44 8b 76 08          	mov    0x8(%rsi),%r14d
    b952:	44 89 f8             	mov    %r15d,%eax
    b955:	c1 e8 17             	shr    $0x17,%eax
    b958:	0f b6 c8             	movzbl %al,%ecx
    b95b:	44 89 fa             	mov    %r15d,%edx
    b95e:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
    b964:	31 c0                	xor    %eax,%eax
    b966:	85 c9                	test   %ecx,%ecx
    b968:	8d 8c 09 d4 fe ff ff 	lea    -0x12c(%rcx,%rcx,1),%ecx
    b96f:	41 bc d6 fe ff ff    	mov    $0xfffffed6,%r12d
    b975:	41 0f 44 cc          	cmove  %r12d,%ecx
    b979:	0f 95 c0             	setne  %al
    b97c:	c1 e0 17             	shl    $0x17,%eax
    b97f:	48 09 d0             	or     %rdx,%rax
    b982:	48 f7 e0             	mul    %rax
    b985:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
    b98a:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    b98f:	48 89 04 24          	mov    %rax,(%rsp)
    b993:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
    b997:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
    b99c:	48 89 e1             	mov    %rsp,%rcx
    b99f:	be 00 00 00 80       	mov    $0x80000000,%esi
    b9a4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b9a9:	e8 32 36 00 00       	call   efe0 <hyperinterval::ieee::Format::rounded>
    b9ae:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
    b9b3:	75 66                	jne    ba1b <hyperinterval::float::F32Enclosure::square+0xeb>
    b9b5:	44 8b 6c 24 38       	mov    0x38(%rsp),%r13d
    b9ba:	8b 6c 24 40          	mov    0x40(%rsp),%ebp
    b9be:	44 89 f0             	mov    %r14d,%eax
    b9c1:	c1 e8 17             	shr    $0x17,%eax
    b9c4:	0f b6 c8             	movzbl %al,%ecx
    b9c7:	44 89 f2             	mov    %r14d,%edx
    b9ca:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
    b9d0:	31 c0                	xor    %eax,%eax
    b9d2:	85 c9                	test   %ecx,%ecx
    b9d4:	8d 8c 09 d4 fe ff ff 	lea    -0x12c(%rcx,%rcx,1),%ecx
    b9db:	41 0f 44 cc          	cmove  %r12d,%ecx
    b9df:	0f 95 c0             	setne  %al
    b9e2:	c1 e0 17             	shl    $0x17,%eax
    b9e5:	48 09 d0             	or     %rdx,%rax
    b9e8:	48 f7 e0             	mul    %rax
    b9eb:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
    b9f0:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    b9f5:	48 89 04 24          	mov    %rax,(%rsp)
    b9f9:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
    b9fd:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
    ba02:	48 89 e1             	mov    %rsp,%rcx
    ba05:	be 00 00 00 80       	mov    $0x80000000,%esi
    ba0a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ba0f:	e8 cc 35 00 00       	call   efe0 <hyperinterval::ieee::Format::rounded>
    ba14:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
    ba19:	75 0f                	jne    ba2a <hyperinterval::float::F32Enclosure::square+0xfa>
    ba1b:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
    ba20:	eb 59                	jmp    ba7b <hyperinterval::float::F32Enclosure::square+0x14b>
    ba22:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
    ba28:	eb 5a                	jmp    ba84 <hyperinterval::float::F32Enclosure::square+0x154>
    ba2a:	8b 44 24 38          	mov    0x38(%rsp),%eax
    ba2e:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    ba33:	44 8b 64 24 40       	mov    0x40(%rsp),%r12d
    ba38:	48 89 e7             	mov    %rsp,%rdi
    ba3b:	be 00 00 00 80       	mov    $0x80000000,%esi
    ba40:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ba45:	4c 89 e9             	mov    %r13,%rcx
    ba48:	e8 f3 32 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    ba4d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    ba51:	74 23                	je     ba76 <hyperinterval::float::F32Enclosure::square+0x146>
    ba53:	4d 89 e5             	mov    %r12,%r13
    ba56:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    ba5b:	48 89 e7             	mov    %rsp,%rdi
    ba5e:	be 00 00 00 80       	mov    $0x80000000,%esi
    ba63:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ba68:	48 89 e9             	mov    %rbp,%rcx
    ba6b:	e8 d0 32 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    ba70:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    ba74:	75 20                	jne    ba96 <hyperinterval::float::F32Enclosure::square+0x166>
    ba76:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    ba7b:	88 43 04             	mov    %al,0x4(%rbx)
    ba7e:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    ba84:	48 89 d8             	mov    %rbx,%rax
    ba87:	48 83 c4 48          	add    $0x48,%rsp
    ba8b:	5b                   	pop    %rbx
    ba8c:	41 5c                	pop    %r12
    ba8e:	41 5d                	pop    %r13
    ba90:	41 5e                	pop    %r14
    ba92:	41 5f                	pop    %r15
    ba94:	5d                   	pop    %rbp
    ba95:	c3                   	ret
    ba96:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
    ba9a:	44 89 e0             	mov    %r12d,%eax
    ba9d:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    baa2:	89 e9                	mov    %ebp,%ecx
    baa4:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    baaa:	ba 00 00 00 80       	mov    $0x80000000,%edx
    baaf:	29 c2                	sub    %eax,%edx
    bab1:	bf 00 00 00 80       	mov    $0x80000000,%edi
    bab6:	09 f8                	or     %edi,%eax
    bab8:	45 85 e4             	test   %r12d,%r12d
    babb:	48 0f 49 d0          	cmovns %rax,%rdx
    babf:	be 00 00 00 80       	mov    $0x80000000,%esi
    bac4:	29 ce                	sub    %ecx,%esi
    bac6:	89 c8                	mov    %ecx,%eax
    bac8:	09 f8                	or     %edi,%eax
    baca:	85 ed                	test   %ebp,%ebp
    bacc:	48 0f 49 f0          	cmovns %rax,%rsi
    bad0:	b0 01                	mov    $0x1,%al
    bad2:	39 f2                	cmp    %esi,%edx
    bad4:	77 a5                	ja     ba7b <hyperinterval::float::F32Enclosure::square+0x14b>
    bad6:	48 89 e7             	mov    %rsp,%rdi
    bad9:	be 00 00 00 80       	mov    $0x80000000,%esi
    bade:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bae3:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    bae8:	e8 53 32 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    baed:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    baf1:	74 83                	je     ba76 <hyperinterval::float::F32Enclosure::square+0x146>
    baf3:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    baf8:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    bafd:	48 89 e7             	mov    %rsp,%rdi
    bb00:	be 00 00 00 80       	mov    $0x80000000,%esi
    bb05:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bb0a:	4c 89 e9             	mov    %r13,%rcx
    bb0d:	e8 2e 32 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    bb12:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    bb16:	0f 84 5a ff ff ff    	je     ba76 <hyperinterval::float::F32Enclosure::square+0x146>
    bb1c:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    bb20:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
    bb25:	89 d0                	mov    %edx,%eax
    bb27:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    bb2c:	41 89 c8             	mov    %ecx,%r8d
    bb2f:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
    bb36:	be 00 00 00 80       	mov    $0x80000000,%esi
    bb3b:	29 c6                	sub    %eax,%esi
    bb3d:	bf 00 00 00 80       	mov    $0x80000000,%edi
    bb42:	09 f8                	or     %edi,%eax
    bb44:	85 d2                	test   %edx,%edx
    bb46:	48 0f 49 f0          	cmovns %rax,%rsi
    bb4a:	44 89 c0             	mov    %r8d,%eax
    bb4d:	09 f8                	or     %edi,%eax
    bb4f:	44 29 c7             	sub    %r8d,%edi
    bb52:	85 c9                	test   %ecx,%ecx
    bb54:	48 0f 49 f8          	cmovns %rax,%rdi
    bb58:	b0 01                	mov    $0x1,%al
    bb5a:	39 fe                	cmp    %edi,%esi
    bb5c:	0f 87 19 ff ff ff    	ja     ba7b <hyperinterval::float::F32Enclosure::square+0x14b>
    bb62:	44 89 e7             	mov    %r12d,%edi
    bb65:	89 ee                	mov    %ebp,%esi
    bb67:	e8 94 2b 00 00       	call   e700 <hyperinterval::bounds::Bounds<T>::hull>
    bb6c:	41 89 c4             	mov    %eax,%r12d
    bb6f:	89 d5                	mov    %edx,%ebp
    bb71:	44 89 ff             	mov    %r15d,%edi
    bb74:	44 89 f6             	mov    %r14d,%esi
    bb77:	31 d2                	xor    %edx,%edx
    bb79:	e8 12 2c 00 00       	call   e790 <hyperinterval::bounds::Bounds<T>::signs>
    bb7e:	a8 02                	test   $0x2,%al
    bb80:	75 12                	jne    bb94 <hyperinterval::float::F32Enclosure::square+0x264>
    bb82:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
    bb88:	44 89 63 04          	mov    %r12d,0x4(%rbx)
    bb8c:	89 6b 08             	mov    %ebp,0x8(%rbx)
    bb8f:	e9 f0 fe ff ff       	jmp    ba84 <hyperinterval::float::F32Enclosure::square+0x154>
    bb94:	48 89 e7             	mov    %rsp,%rdi
    bb97:	31 f6                	xor    %esi,%esi
    bb99:	31 d2                	xor    %edx,%edx
    bb9b:	e8 60 e6 ff ff       	call   a200 <hyperinterval::float::F32Enclosure::from_bits>
    bba0:	8b 0c 24             	mov    (%rsp),%ecx
    bba3:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
    bba8:	83 f9 02             	cmp    $0x2,%ecx
    bbab:	0f 84 ca fe ff ff    	je     ba7b <hyperinterval::float::F32Enclosure::square+0x14b>
    bbb1:	f6 c1 01             	test   $0x1,%cl
    bbb4:	74 cc                	je     bb82 <hyperinterval::float::F32Enclosure::square+0x252>
    bbb6:	0f b6 c0             	movzbl %al,%eax
    bbb9:	0f b6 4c 24 07       	movzbl 0x7(%rsp),%ecx
    bbbe:	c1 e1 10             	shl    $0x10,%ecx
    bbc1:	0f b7 54 24 05       	movzwl 0x5(%rsp),%edx
    bbc6:	09 ca                	or     %ecx,%edx
    bbc8:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    bbcc:	c1 e2 08             	shl    $0x8,%edx
    bbcf:	09 c2                	or     %eax,%edx
    bbd1:	44 89 e7             	mov    %r12d,%edi
    bbd4:	89 ee                	mov    %ebp,%esi
    bbd6:	e8 25 2b 00 00       	call   e700 <hyperinterval::bounds::Bounds<T>::hull>
    bbdb:	41 89 c4             	mov    %eax,%r12d
    bbde:	89 d5                	mov    %edx,%ebp
    bbe0:	eb a0                	jmp    bb82 <hyperinterval::float::F32Enclosure::square+0x252>
    bbe2:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    bbe9:	00 00 00 
    bbec:	0f 1f 40 00          	nopl   0x0(%rax)

hyperinterval::float::F32Enclosure::checked_pow:
    bbf0:	55                   	push   %rbp
    bbf1:	41 57                	push   %r15
    bbf3:	41 56                	push   %r14
    bbf5:	41 55                	push   %r13
    bbf7:	41 54                	push   %r12
    bbf9:	53                   	push   %rbx
    bbfa:	48 83 ec 38          	sub    $0x38,%rsp
    bbfe:	48 89 fb             	mov    %rdi,%rbx
    bc01:	83 fa 02             	cmp    $0x2,%edx
    bc04:	75 0e                	jne    bc14 <hyperinterval::float::F32Enclosure::checked_pow+0x24>
    bc06:	48 89 df             	mov    %rbx,%rdi
    bc09:	ff 15 a9 52 05 00    	call   *0x552a9(%rip)        # 60eb8 <_GLOBAL_OFFSET_TABLE_+0x900>
    bc0f:	e9 c8 00 00 00       	jmp    bcdc <hyperinterval::float::F32Enclosure::checked_pow+0xec>
    bc14:	f6 06 01             	testb  $0x1,(%rsi)
    bc17:	0f 84 b9 00 00 00    	je     bcd6 <hyperinterval::float::F32Enclosure::checked_pow+0xe6>
    bc1d:	89 d5                	mov    %edx,%ebp
    bc1f:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
    bc23:	44 8b 76 08          	mov    0x8(%rsi),%r14d
    bc27:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bc2c:	be 00 00 00 80       	mov    $0x80000000,%esi
    bc31:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bc36:	4c 89 f9             	mov    %r15,%rcx
    bc39:	41 89 e8             	mov    %ebp,%r8d
    bc3c:	e8 8f 41 00 00       	call   fdd0 <hyperinterval::ieee::Format::power>
    bc41:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
    bc46:	75 7e                	jne    bcc6 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
    bc48:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
    bc4d:	44 8b 6c 24 18       	mov    0x18(%rsp),%r13d
    bc52:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bc57:	be 00 00 00 80       	mov    $0x80000000,%esi
    bc5c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bc61:	4c 89 f1             	mov    %r14,%rcx
    bc64:	41 89 e8             	mov    %ebp,%r8d
    bc67:	e8 64 41 00 00       	call   fdd0 <hyperinterval::ieee::Format::power>
    bc6c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bc71:	74 53                	je     bcc6 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
    bc73:	8b 44 24 10          	mov    0x10(%rsp),%eax
    bc77:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    bc7c:	8b 44 24 18          	mov    0x18(%rsp),%eax
    bc80:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
    bc85:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bc8a:	be 00 00 00 80       	mov    $0x80000000,%esi
    bc8f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bc94:	4c 89 e1             	mov    %r12,%rcx
    bc97:	e8 a4 30 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    bc9c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bca1:	74 23                	je     bcc6 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
    bca3:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    bca8:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bcad:	be 00 00 00 80       	mov    $0x80000000,%esi
    bcb2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bcb7:	4c 89 e9             	mov    %r13,%rcx
    bcba:	e8 81 30 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    bcbf:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bcc4:	75 28                	jne    bcee <hyperinterval::float::F32Enclosure::checked_pow+0xfe>
    bcc6:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
    bccb:	88 43 04             	mov    %al,0x4(%rbx)
    bcce:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    bcd4:	eb 06                	jmp    bcdc <hyperinterval::float::F32Enclosure::checked_pow+0xec>
    bcd6:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
    bcdc:	48 89 d8             	mov    %rbx,%rax
    bcdf:	48 83 c4 38          	add    $0x38,%rsp
    bce3:	5b                   	pop    %rbx
    bce4:	41 5c                	pop    %r12
    bce6:	41 5d                	pop    %r13
    bce8:	41 5e                	pop    %r14
    bcea:	41 5f                	pop    %r15
    bcec:	5d                   	pop    %rbp
    bced:	c3                   	ret
    bcee:	8b 7c 24 10          	mov    0x10(%rsp),%edi
    bcf2:	44 89 e0             	mov    %r12d,%eax
    bcf5:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    bcfa:	89 f9                	mov    %edi,%ecx
    bcfc:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    bd02:	ba 00 00 00 80       	mov    $0x80000000,%edx
    bd07:	29 c2                	sub    %eax,%edx
    bd09:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
    bd0f:	44 09 e8             	or     %r13d,%eax
    bd12:	45 85 e4             	test   %r12d,%r12d
    bd15:	48 0f 49 d0          	cmovns %rax,%rdx
    bd19:	be 00 00 00 80       	mov    $0x80000000,%esi
    bd1e:	29 ce                	sub    %ecx,%esi
    bd20:	89 c8                	mov    %ecx,%eax
    bd22:	44 09 e8             	or     %r13d,%eax
    bd25:	85 ff                	test   %edi,%edi
    bd27:	48 0f 49 f0          	cmovns %rax,%rsi
    bd2b:	b0 01                	mov    $0x1,%al
    bd2d:	39 f2                	cmp    %esi,%edx
    bd2f:	77 9a                	ja     bccb <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
    bd31:	89 7c 24 2c          	mov    %edi,0x2c(%rsp)
    bd35:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bd3a:	be 00 00 00 80       	mov    $0x80000000,%esi
    bd3f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bd44:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    bd49:	e8 f2 2f 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    bd4e:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bd53:	0f 84 6d ff ff ff    	je     bcc6 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
    bd59:	4c 89 64 24 20       	mov    %r12,0x20(%rsp)
    bd5e:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    bd63:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bd68:	be 00 00 00 80       	mov    $0x80000000,%esi
    bd6d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bd72:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
    bd77:	e8 c4 2f 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    bd7c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bd81:	0f 84 3f ff ff ff    	je     bcc6 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
    bd87:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
    bd8b:	44 89 e0             	mov    %r12d,%eax
    bd8e:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    bd93:	89 ca                	mov    %ecx,%edx
    bd95:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    bd9b:	be 00 00 00 80       	mov    $0x80000000,%esi
    bda0:	29 c6                	sub    %eax,%esi
    bda2:	44 09 e8             	or     %r13d,%eax
    bda5:	45 85 e4             	test   %r12d,%r12d
    bda8:	48 0f 49 f0          	cmovns %rax,%rsi
    bdac:	89 d0                	mov    %edx,%eax
    bdae:	44 09 e8             	or     %r13d,%eax
    bdb1:	41 29 d5             	sub    %edx,%r13d
    bdb4:	85 c9                	test   %ecx,%ecx
    bdb6:	4c 0f 49 e8          	cmovns %rax,%r13
    bdba:	b0 01                	mov    $0x1,%al
    bdbc:	44 39 ee             	cmp    %r13d,%esi
    bdbf:	0f 87 06 ff ff ff    	ja     bccb <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
    bdc5:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
    bdca:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
    bdce:	44 89 e2             	mov    %r12d,%edx
    bdd1:	e8 2a 29 00 00       	call   e700 <hyperinterval::bounds::Bounds<T>::hull>
    bdd6:	41 89 c5             	mov    %eax,%r13d
    bdd9:	41 89 d4             	mov    %edx,%r12d
    bddc:	85 ed                	test   %ebp,%ebp
    bdde:	0f 95 c0             	setne  %al
    bde1:	40 f6 c5 01          	test   $0x1,%bpl
    bde5:	0f 94 c1             	sete   %cl
    bde8:	84 c8                	test   %cl,%al
    bdea:	74 11                	je     bdfd <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
    bdec:	44 89 ff             	mov    %r15d,%edi
    bdef:	44 89 f6             	mov    %r14d,%esi
    bdf2:	31 d2                	xor    %edx,%edx
    bdf4:	e8 97 29 00 00       	call   e790 <hyperinterval::bounds::Bounds<T>::signs>
    bdf9:	a8 02                	test   $0x2,%al
    bdfb:	75 13                	jne    be10 <hyperinterval::float::F32Enclosure::checked_pow+0x220>
    bdfd:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
    be03:	44 89 6b 04          	mov    %r13d,0x4(%rbx)
    be07:	44 89 63 08          	mov    %r12d,0x8(%rbx)
    be0b:	e9 cc fe ff ff       	jmp    bcdc <hyperinterval::float::F32Enclosure::checked_pow+0xec>
    be10:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    be15:	31 f6                	xor    %esi,%esi
    be17:	31 d2                	xor    %edx,%edx
    be19:	e8 e2 e3 ff ff       	call   a200 <hyperinterval::float::F32Enclosure::from_bits>
    be1e:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    be22:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
    be27:	83 f9 02             	cmp    $0x2,%ecx
    be2a:	0f 84 9b fe ff ff    	je     bccb <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
    be30:	f6 c1 01             	test   $0x1,%cl
    be33:	74 c8                	je     bdfd <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
    be35:	0f b6 c0             	movzbl %al,%eax
    be38:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
    be3d:	c1 e1 10             	shl    $0x10,%ecx
    be40:	0f b7 54 24 0d       	movzwl 0xd(%rsp),%edx
    be45:	09 ca                	or     %ecx,%edx
    be47:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
    be4b:	c1 e2 08             	shl    $0x8,%edx
    be4e:	09 c2                	or     %eax,%edx
    be50:	44 89 ef             	mov    %r13d,%edi
    be53:	44 89 e6             	mov    %r12d,%esi
    be56:	e8 a5 28 00 00       	call   e700 <hyperinterval::bounds::Bounds<T>::hull>
    be5b:	41 89 c5             	mov    %eax,%r13d
    be5e:	41 89 d4             	mov    %edx,%r12d
    be61:	eb 9a                	jmp    bdfd <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
    be63:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    be6a:	00 00 00 
    be6d:	0f 1f 00             	nopl   (%rax)

hyperinterval::float::F32Enclosure::affine:
    be70:	55                   	push   %rbp
    be71:	41 57                	push   %r15
    be73:	41 56                	push   %r14
    be75:	41 55                	push   %r13
    be77:	41 54                	push   %r12
    be79:	53                   	push   %rbx
    be7a:	48 83 ec 28          	sub    $0x28,%rsp
    be7e:	f3 0f 11 4c 24 20    	movss  %xmm1,0x20(%rsp)
    be84:	49 89 f7             	mov    %rsi,%r15
    be87:	48 89 fb             	mov    %rdi,%rbx
    be8a:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
    be90:	66 0f 7e c1          	movd   %xmm0,%ecx
    be94:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    be99:	be 00 00 00 80       	mov    $0x80000000,%esi
    be9e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bea3:	e8 98 2e 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    bea8:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bead:	74 2a                	je     bed9 <hyperinterval::float::F32Enclosure::affine+0x69>
    beaf:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
    beb4:	66 0f 6e 44 24 20    	movd   0x20(%rsp),%xmm0
    beba:	66 0f 7e c1          	movd   %xmm0,%ecx
    bebe:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bec3:	be 00 00 00 80       	mov    $0x80000000,%esi
    bec8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    becd:	e8 6e 2e 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    bed2:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bed7:	75 20                	jne    bef9 <hyperinterval::float::F32Enclosure::affine+0x89>
    bed9:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
    bede:	88 43 04             	mov    %al,0x4(%rbx)
    bee1:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    bee7:	48 89 d8             	mov    %rbx,%rax
    beea:	48 83 c4 28          	add    $0x28,%rsp
    beee:	5b                   	pop    %rbx
    beef:	41 5c                	pop    %r12
    bef1:	41 5d                	pop    %r13
    bef3:	41 5e                	pop    %r14
    bef5:	41 5f                	pop    %r15
    bef7:	5d                   	pop    %rbp
    bef8:	c3                   	ret
    bef9:	41 f6 07 01          	testb  $0x1,(%r15)
    befd:	0f 84 60 01 00 00    	je     c063 <hyperinterval::float::F32Enclosure::affine+0x1f3>
    bf03:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
    bf08:	41 8b 6f 08          	mov    0x8(%r15),%ebp
    bf0c:	41 8b 4f 04          	mov    0x4(%r15),%ecx
    bf10:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bf15:	be 00 00 00 80       	mov    $0x80000000,%esi
    bf1a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bf1f:	4d 89 f0             	mov    %r14,%r8
    bf22:	4d 89 e1             	mov    %r12,%r9
    bf25:	e8 76 36 00 00       	call   f5a0 <hyperinterval::ieee::Format::affine>
    bf2a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bf2f:	74 a8                	je     bed9 <hyperinterval::float::F32Enclosure::affine+0x69>
    bf31:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
    bf36:	8b 44 24 18          	mov    0x18(%rsp),%eax
    bf3a:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    bf3f:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bf44:	be 00 00 00 80       	mov    $0x80000000,%esi
    bf49:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bf4e:	48 89 e9             	mov    %rbp,%rcx
    bf51:	4d 89 f0             	mov    %r14,%r8
    bf54:	4d 89 e1             	mov    %r12,%r9
    bf57:	e8 44 36 00 00       	call   f5a0 <hyperinterval::ieee::Format::affine>
    bf5c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bf61:	0f 84 72 ff ff ff    	je     bed9 <hyperinterval::float::F32Enclosure::affine+0x69>
    bf67:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
    bf6c:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
    bf71:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bf76:	be 00 00 00 80       	mov    $0x80000000,%esi
    bf7b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bf80:	4c 89 f9             	mov    %r15,%rcx
    bf83:	e8 b8 2d 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    bf88:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bf8d:	0f 84 46 ff ff ff    	je     bed9 <hyperinterval::float::F32Enclosure::affine+0x69>
    bf93:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
    bf98:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bf9d:	be 00 00 00 80       	mov    $0x80000000,%esi
    bfa2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bfa7:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    bfac:	e8 8f 2d 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    bfb1:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bfb6:	0f 84 1d ff ff ff    	je     bed9 <hyperinterval::float::F32Enclosure::affine+0x69>
    bfbc:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
    bfc1:	44 89 f0             	mov    %r14d,%eax
    bfc4:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    bfc9:	44 89 f9             	mov    %r15d,%ecx
    bfcc:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    bfd2:	ba 00 00 00 80       	mov    $0x80000000,%edx
    bfd7:	29 c2                	sub    %eax,%edx
    bfd9:	44 09 e8             	or     %r13d,%eax
    bfdc:	45 85 f6             	test   %r14d,%r14d
    bfdf:	48 0f 49 d0          	cmovns %rax,%rdx
    bfe3:	89 c8                	mov    %ecx,%eax
    bfe5:	44 09 e8             	or     %r13d,%eax
    bfe8:	41 29 cd             	sub    %ecx,%r13d
    bfeb:	45 85 ff             	test   %r15d,%r15d
    bfee:	4c 0f 49 e8          	cmovns %rax,%r13
    bff2:	b0 01                	mov    $0x1,%al
    bff4:	44 39 ea             	cmp    %r13d,%edx
    bff7:	0f 87 e1 fe ff ff    	ja     bede <hyperinterval::float::F32Enclosure::affine+0x6e>
    bffd:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    c002:	48 89 ee             	mov    %rbp,%rsi
    c005:	4c 89 e2             	mov    %r12,%rdx
    c008:	e8 f3 e1 ff ff       	call   a200 <hyperinterval::float::F32Enclosure::from_bits>
    c00d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    c011:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
    c016:	83 f9 02             	cmp    $0x2,%ecx
    c019:	0f 84 bf fe ff ff    	je     bede <hyperinterval::float::F32Enclosure::affine+0x6e>
    c01f:	f6 c1 01             	test   $0x1,%cl
    c022:	74 2c                	je     c050 <hyperinterval::float::F32Enclosure::affine+0x1e0>
    c024:	0f b6 c0             	movzbl %al,%eax
    c027:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
    c02c:	c1 e1 10             	shl    $0x10,%ecx
    c02f:	0f b7 54 24 0d       	movzwl 0xd(%rsp),%edx
    c034:	09 ca                	or     %ecx,%edx
    c036:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
    c03a:	c1 e2 08             	shl    $0x8,%edx
    c03d:	09 c2                	or     %eax,%edx
    c03f:	44 89 f7             	mov    %r14d,%edi
    c042:	44 89 fe             	mov    %r15d,%esi
    c045:	e8 b6 26 00 00       	call   e700 <hyperinterval::bounds::Bounds<T>::hull>
    c04a:	41 89 c6             	mov    %eax,%r14d
    c04d:	41 89 d7             	mov    %edx,%r15d
    c050:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
    c056:	44 89 73 04          	mov    %r14d,0x4(%rbx)
    c05a:	44 89 7b 08          	mov    %r15d,0x8(%rbx)
    c05e:	e9 84 fe ff ff       	jmp    bee7 <hyperinterval::float::F32Enclosure::affine+0x77>
    c063:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
    c069:	e9 79 fe ff ff       	jmp    bee7 <hyperinterval::float::F32Enclosure::affine+0x77>
    c06e:	66 90                	xchg   %ax,%ax

hyperinterval::float::F32Enclosure::next_down:
    c070:	53                   	push   %rbx
    c071:	48 83 ec 10          	sub    $0x10,%rsp
    c075:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    c07a:	66 0f 7e c1          	movd   %xmm0,%ecx
    c07e:	48 89 e7             	mov    %rsp,%rdi
    c081:	be 00 00 00 80       	mov    $0x80000000,%esi
    c086:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    c08b:	e8 b0 2c 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    c090:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    c094:	75 0a                	jne    c0a0 <hyperinterval::float::F32Enclosure::next_down+0x30>
    c096:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
    c09b:	c1 e1 08             	shl    $0x8,%ecx
    c09e:	eb 3d                	jmp    c0dd <hyperinterval::float::F32Enclosure::next_down+0x6d>
    c0a0:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    c0a5:	48 89 c1             	mov    %rax,%rcx
    c0a8:	48 31 d9             	xor    %rbx,%rcx
    c0ab:	48 85 c0             	test   %rax,%rax
    c0ae:	48 0f 44 c8          	cmove  %rax,%rcx
    c0b2:	31 c0                	xor    %eax,%eax
    c0b4:	85 c9                	test   %ecx,%ecx
    c0b6:	0f 99 c0             	setns  %al
    c0b9:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
    c0bd:	48 ff c9             	dec    %rcx
    c0c0:	48 89 e7             	mov    %rsp,%rdi
    c0c3:	be 00 00 00 80       	mov    $0x80000000,%esi
    c0c8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    c0cd:	e8 6e 2c 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    c0d2:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    c0d6:	75 13                	jne    c0eb <hyperinterval::float::F32Enclosure::next_down+0x7b>
    c0d8:	b9 00 03 00 00       	mov    $0x300,%ecx
    c0dd:	b8 01 00 00 00       	mov    $0x1,%eax
    c0e2:	48 09 c8             	or     %rcx,%rax
    c0e5:	48 83 c4 10          	add    $0x10,%rsp
    c0e9:	5b                   	pop    %rbx
    c0ea:	c3                   	ret
    c0eb:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    c0f0:	48 89 c1             	mov    %rax,%rcx
    c0f3:	48 81 f1 00 00 00 80 	xor    $0xffffffff80000000,%rcx
    c0fa:	48 c1 e1 20          	shl    $0x20,%rcx
    c0fe:	48 85 c0             	test   %rax,%rax
    c101:	48 0f 44 c8          	cmove  %rax,%rcx
    c105:	31 c0                	xor    %eax,%eax
    c107:	48 09 c8             	or     %rcx,%rax
    c10a:	48 83 c4 10          	add    $0x10,%rsp
    c10e:	5b                   	pop    %rbx
    c10f:	c3                   	ret

hyperinterval::float::F32Enclosure::next_up:
    c110:	48 83 ec 18          	sub    $0x18,%rsp
    c114:	66 0f 7e c1          	movd   %xmm0,%ecx
    c118:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    c11d:	be 00 00 00 80       	mov    $0x80000000,%esi
    c122:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    c127:	e8 14 2c 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    c12c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    c131:	75 15                	jne    c148 <hyperinterval::float::F32Enclosure::next_up+0x38>
    c133:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
    c138:	c1 e1 08             	shl    $0x8,%ecx
    c13b:	b8 01 00 00 00       	mov    $0x1,%eax
    c140:	48 09 c8             	or     %rcx,%rax
    c143:	48 83 c4 18          	add    $0x18,%rsp
    c147:	c3                   	ret
    c148:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    c14d:	31 c9                	xor    %ecx,%ecx
    c14f:	85 c0                	test   %eax,%eax
    c151:	0f 99 c1             	setns  %cl
    c154:	48 8d 0c 48          	lea    (%rax,%rcx,2),%rcx
    c158:	48 ff c9             	dec    %rcx
    c15b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    c160:	be 00 00 00 80       	mov    $0x80000000,%esi
    c165:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    c16a:	e8 d1 2b 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    c16f:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    c174:	75 12                	jne    c188 <hyperinterval::float::F32Enclosure::next_up+0x78>
    c176:	b9 00 03 00 00       	mov    $0x300,%ecx
    c17b:	b8 01 00 00 00       	mov    $0x1,%eax
    c180:	48 09 c8             	or     %rcx,%rax
    c183:	48 83 c4 18          	add    $0x18,%rsp
    c187:	c3                   	ret
    c188:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    c18d:	48 c1 e1 20          	shl    $0x20,%rcx
    c191:	31 c0                	xor    %eax,%eax
    c193:	48 09 c8             	or     %rcx,%rax
    c196:	48 83 c4 18          	add    $0x18,%rsp
    c19a:	c3                   	ret
    c19b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

hyperinterval::float::F32Enclosure::expanded:
    c1a0:	41 57                	push   %r15
    c1a2:	41 56                	push   %r14
    c1a4:	41 54                	push   %r12
    c1a6:	53                   	push   %rbx
    c1a7:	48 83 ec 18          	sub    $0x18,%rsp
    c1ab:	48 89 fb             	mov    %rdi,%rbx
    c1ae:	f6 06 01             	testb  $0x1,(%rsi)
    c1b1:	74 7c                	je     c22f <hyperinterval::float::F32Enclosure::expanded+0x8f>
    c1b3:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
    c1b9:	8b 46 04             	mov    0x4(%rsi),%eax
    c1bc:	44 8b 76 08          	mov    0x8(%rsi),%r14d
    c1c0:	8d 88 00 00 00 80    	lea    -0x80000000(%rax),%ecx
    c1c6:	85 c0                	test   %eax,%eax
    c1c8:	0f 44 c8             	cmove  %eax,%ecx
    c1cb:	31 c0                	xor    %eax,%eax
    c1cd:	85 c9                	test   %ecx,%ecx
    c1cf:	0f 99 c0             	setns  %al
    c1d2:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
    c1d6:	48 ff c9             	dec    %rcx
    c1d9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    c1de:	be 00 00 00 80       	mov    $0x80000000,%esi
    c1e3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    c1e8:	e8 53 2b 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    c1ed:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
    c1f2:	75 2f                	jne    c223 <hyperinterval::float::F32Enclosure::expanded+0x83>
    c1f4:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    c1f9:	31 c0                	xor    %eax,%eax
    c1fb:	45 85 f6             	test   %r14d,%r14d
    c1fe:	0f 99 c0             	setns  %al
    c201:	49 8d 0c 46          	lea    (%r14,%rax,2),%rcx
    c205:	48 ff c9             	dec    %rcx
    c208:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    c20d:	be 00 00 00 80       	mov    $0x80000000,%esi
    c212:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    c217:	e8 24 2b 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    c21c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    c221:	75 21                	jne    c244 <hyperinterval::float::F32Enclosure::expanded+0xa4>
    c223:	c6 43 04 03          	movb   $0x3,0x4(%rbx)
    c227:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    c22d:	eb 06                	jmp    c235 <hyperinterval::float::F32Enclosure::expanded+0x95>
    c22f:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
    c235:	48 89 d8             	mov    %rbx,%rax
    c238:	48 83 c4 18          	add    $0x18,%rsp
    c23c:	5b                   	pop    %rbx
    c23d:	41 5c                	pop    %r12
    c23f:	41 5e                	pop    %r14
    c241:	41 5f                	pop    %r15
    c243:	c3                   	ret
    c244:	44 89 e1             	mov    %r12d,%ecx
    c247:	4c 31 f9             	xor    %r15,%rcx
    c24a:	4d 85 e4             	test   %r12,%r12
    c24d:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
    c252:	49 0f 44 cc          	cmove  %r12,%rcx
    c256:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    c25b:	be 00 00 00 80       	mov    $0x80000000,%esi
    c260:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    c265:	e8 d6 2a 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    c26a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    c26f:	74 23                	je     c294 <hyperinterval::float::F32Enclosure::expanded+0xf4>
    c271:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    c276:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    c27b:	be 00 00 00 80       	mov    $0x80000000,%esi
    c280:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    c285:	4c 89 f1             	mov    %r14,%rcx
    c288:	e8 b3 2a 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    c28d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    c292:	75 10                	jne    c2a4 <hyperinterval::float::F32Enclosure::expanded+0x104>
    c294:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
    c299:	88 43 04             	mov    %al,0x4(%rbx)
    c29c:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    c2a2:	eb 91                	jmp    c235 <hyperinterval::float::F32Enclosure::expanded+0x95>
    c2a4:	8b 44 24 10          	mov    0x10(%rsp),%eax
    c2a8:	44 89 e1             	mov    %r12d,%ecx
    c2ab:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    c2b1:	89 c2                	mov    %eax,%edx
    c2b3:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    c2b9:	be 00 00 00 80       	mov    $0x80000000,%esi
    c2be:	29 ce                	sub    %ecx,%esi
    c2c0:	44 09 f9             	or     %r15d,%ecx
    c2c3:	45 85 e4             	test   %r12d,%r12d
    c2c6:	48 0f 49 f1          	cmovns %rcx,%rsi
    c2ca:	89 d1                	mov    %edx,%ecx
    c2cc:	44 09 f9             	or     %r15d,%ecx
    c2cf:	41 29 d7             	sub    %edx,%r15d
    c2d2:	85 c0                	test   %eax,%eax
    c2d4:	4c 0f 49 f9          	cmovns %rcx,%r15
    c2d8:	44 39 fe             	cmp    %r15d,%esi
    c2db:	76 0f                	jbe    c2ec <hyperinterval::float::F32Enclosure::expanded+0x14c>
    c2dd:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
    c2e1:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    c2e7:	e9 49 ff ff ff       	jmp    c235 <hyperinterval::float::F32Enclosure::expanded+0x95>
    c2ec:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
    c2f2:	44 89 63 04          	mov    %r12d,0x4(%rbx)
    c2f6:	89 43 08             	mov    %eax,0x8(%rbx)
    c2f9:	e9 37 ff ff ff       	jmp    c235 <hyperinterval::float::F32Enclosure::expanded+0x95>
    c2fe:	66 90                	xchg   %ax,%ax

hyperinterval::float::F64Enclosure::new:
    c300:	41 57                	push   %r15
    c302:	41 56                	push   %r14
    c304:	41 54                	push   %r12
    c306:	53                   	push   %rbx
    c307:	48 83 ec 18          	sub    $0x18,%rsp
    c30b:	f2 0f 11 4c 24 10    	movsd  %xmm1,0x10(%rsp)
    c311:	48 89 fb             	mov    %rdi,%rbx
    c314:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
    c31b:	00 00 80 
    c31e:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
    c325:	00 f0 7f 
    c328:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    c32d:	48 89 e7             	mov    %rsp,%rdi
    c330:	4c 89 f6             	mov    %r14,%rsi
    c333:	4c 89 fa             	mov    %r15,%rdx
    c336:	e8 05 2a 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    c33b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    c33f:	74 24                	je     c365 <hyperinterval::float::F64Enclosure::new+0x65>
    c341:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    c346:	f3 0f 7e 44 24 10    	movq   0x10(%rsp),%xmm0
    c34c:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    c351:	48 89 e7             	mov    %rsp,%rdi
    c354:	4c 89 f6             	mov    %r14,%rsi
    c357:	4c 89 fa             	mov    %r15,%rdx
    c35a:	e8 e1 29 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    c35f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    c363:	75 1e                	jne    c383 <hyperinterval::float::F64Enclosure::new+0x83>
    c365:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    c36a:	88 43 08             	mov    %al,0x8(%rbx)
    c36d:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    c374:	48 89 d8             	mov    %rbx,%rax
    c377:	48 83 c4 18          	add    $0x18,%rsp
    c37b:	5b                   	pop    %rbx
    c37c:	41 5c                	pop    %r12
    c37e:	41 5e                	pop    %r14
    c380:	41 5f                	pop    %r15
    c382:	c3                   	ret
    c383:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    c388:	4c 89 e1             	mov    %r12,%rcx
    c38b:	4c 09 f1             	or     %r14,%rcx
    c38e:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
    c392:	4c 89 e6             	mov    %r12,%rsi
    c395:	48 21 d6             	and    %rdx,%rsi
    c398:	4c 89 f7             	mov    %r14,%rdi
    c39b:	48 29 f7             	sub    %rsi,%rdi
    c39e:	4d 85 e4             	test   %r12,%r12
    c3a1:	48 0f 49 f9          	cmovns %rcx,%rdi
    c3a5:	48 89 c1             	mov    %rax,%rcx
    c3a8:	4c 09 f1             	or     %r14,%rcx
    c3ab:	48 21 c2             	and    %rax,%rdx
    c3ae:	49 29 d6             	sub    %rdx,%r14
    c3b1:	48 85 c0             	test   %rax,%rax
    c3b4:	4c 0f 49 f1          	cmovns %rcx,%r14
    c3b8:	4c 39 f7             	cmp    %r14,%rdi
    c3bb:	76 06                	jbe    c3c3 <hyperinterval::float::F64Enclosure::new+0xc3>
    c3bd:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
    c3c1:	eb aa                	jmp    c36d <hyperinterval::float::F64Enclosure::new+0x6d>
    c3c3:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
    c3ca:	4c 89 63 08          	mov    %r12,0x8(%rbx)
    c3ce:	48 89 43 10          	mov    %rax,0x10(%rbx)
    c3d2:	eb a0                	jmp    c374 <hyperinterval::float::F64Enclosure::new+0x74>
    c3d4:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    c3db:	00 00 00 
    c3de:	66 90                	xchg   %ax,%ax

hyperinterval::float::F64Enclosure::point:
    c3e0:	53                   	push   %rbx
    c3e1:	48 83 ec 10          	sub    $0x10,%rsp
    c3e5:	48 89 fb             	mov    %rdi,%rbx
    c3e8:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    c3ed:	48 89 e7             	mov    %rsp,%rdi
    c3f0:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c3f7:	00 00 80 
    c3fa:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
    c401:	00 f0 7f 
    c404:	e8 37 29 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    c409:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    c40d:	75 0f                	jne    c41e <hyperinterval::float::F64Enclosure::point+0x3e>
    c40f:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    c414:	88 43 08             	mov    %al,0x8(%rbx)
    c417:	b8 02 00 00 00       	mov    $0x2,%eax
    c41c:	eb 12                	jmp    c430 <hyperinterval::float::F64Enclosure::point+0x50>
    c41e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    c423:	48 89 43 08          	mov    %rax,0x8(%rbx)
    c427:	48 89 43 10          	mov    %rax,0x10(%rbx)
    c42b:	b8 01 00 00 00       	mov    $0x1,%eax
    c430:	48 89 03             	mov    %rax,(%rbx)
    c433:	48 89 d8             	mov    %rbx,%rax
    c436:	48 83 c4 10          	add    $0x10,%rsp
    c43a:	5b                   	pop    %rbx
    c43b:	c3                   	ret
    c43c:	0f 1f 40 00          	nopl   0x0(%rax)

hyperinterval::float::F64Enclosure::from_bits:
    c440:	41 57                	push   %r15
    c442:	41 56                	push   %r14
    c444:	41 55                	push   %r13
    c446:	41 54                	push   %r12
    c448:	53                   	push   %rbx
    c449:	48 83 ec 10          	sub    $0x10,%rsp
    c44d:	49 89 d7             	mov    %rdx,%r15
    c450:	48 89 f1             	mov    %rsi,%rcx
    c453:	48 89 fb             	mov    %rdi,%rbx
    c456:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
    c45d:	00 00 80 
    c460:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
    c467:	00 f0 7f 
    c46a:	48 89 e7             	mov    %rsp,%rdi
    c46d:	4c 89 f6             	mov    %r14,%rsi
    c470:	4c 89 e2             	mov    %r12,%rdx
    c473:	e8 c8 28 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    c478:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    c47c:	74 1c                	je     c49a <hyperinterval::float::F64Enclosure::from_bits+0x5a>
    c47e:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    c483:	48 89 e7             	mov    %rsp,%rdi
    c486:	4c 89 f6             	mov    %r14,%rsi
    c489:	4c 89 e2             	mov    %r12,%rdx
    c48c:	4c 89 f9             	mov    %r15,%rcx
    c48f:	e8 ac 28 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    c494:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    c498:	75 1d                	jne    c4b7 <hyperinterval::float::F64Enclosure::from_bits+0x77>
    c49a:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    c49f:	88 43 08             	mov    %al,0x8(%rbx)
    c4a2:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    c4a9:	48 83 c4 10          	add    $0x10,%rsp
    c4ad:	5b                   	pop    %rbx
    c4ae:	41 5c                	pop    %r12
    c4b0:	41 5d                	pop    %r13
    c4b2:	41 5e                	pop    %r14
    c4b4:	41 5f                	pop    %r15
    c4b6:	c3                   	ret
    c4b7:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    c4bc:	4c 89 e9             	mov    %r13,%rcx
    c4bf:	4c 09 f1             	or     %r14,%rcx
    c4c2:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
    c4c6:	4c 89 ee             	mov    %r13,%rsi
    c4c9:	48 21 d6             	and    %rdx,%rsi
    c4cc:	4c 89 f7             	mov    %r14,%rdi
    c4cf:	48 29 f7             	sub    %rsi,%rdi
    c4d2:	4d 85 ed             	test   %r13,%r13
    c4d5:	48 0f 49 f9          	cmovns %rcx,%rdi
    c4d9:	48 89 c1             	mov    %rax,%rcx
    c4dc:	4c 09 f1             	or     %r14,%rcx
    c4df:	48 21 c2             	and    %rax,%rdx
    c4e2:	49 29 d6             	sub    %rdx,%r14
    c4e5:	48 85 c0             	test   %rax,%rax
    c4e8:	4c 0f 49 f1          	cmovns %rcx,%r14
    c4ec:	4c 39 f7             	cmp    %r14,%rdi
    c4ef:	76 06                	jbe    c4f7 <hyperinterval::float::F64Enclosure::from_bits+0xb7>
    c4f1:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
    c4f5:	eb ab                	jmp    c4a2 <hyperinterval::float::F64Enclosure::from_bits+0x62>
    c4f7:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
    c4fe:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
    c502:	48 89 43 10          	mov    %rax,0x10(%rbx)
    c506:	eb a1                	jmp    c4a9 <hyperinterval::float::F64Enclosure::from_bits+0x69>
    c508:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    c50f:	00 

hyperinterval::float::F64Enclosure::contains_point:
    c510:	41 56                	push   %r14
    c512:	53                   	push   %rbx
    c513:	48 83 ec 18          	sub    $0x18,%rsp
    c517:	49 89 fe             	mov    %rdi,%r14
    c51a:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
    c521:	00 00 80 
    c524:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    c529:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    c52e:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
    c535:	00 f0 7f 
    c538:	48 89 de             	mov    %rbx,%rsi
    c53b:	e8 00 28 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    c540:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
    c545:	3c 01                	cmp    $0x1,%al
    c547:	75 0d                	jne    c556 <hyperinterval::float::F64Enclosure::contains_point+0x46>
    c549:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
    c54e:	48 83 c4 18          	add    $0x18,%rsp
    c552:	5b                   	pop    %rbx
    c553:	41 5e                	pop    %r14
    c555:	c3                   	ret
    c556:	41 f6 06 01          	testb  $0x1,(%r14)
    c55a:	74 44                	je     c5a0 <hyperinterval::float::F64Enclosure::contains_point+0x90>
    c55c:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
    c561:	49 8b 56 08          	mov    0x8(%r14),%rdx
    c565:	48 89 d7             	mov    %rdx,%rdi
    c568:	48 09 df             	or     %rbx,%rdi
    c56b:	48 8d 4b ff          	lea    -0x1(%rbx),%rcx
    c56f:	49 89 d0             	mov    %rdx,%r8
    c572:	49 21 c8             	and    %rcx,%r8
    c575:	49 89 d9             	mov    %rbx,%r9
    c578:	4d 29 c1             	sub    %r8,%r9
    c57b:	48 85 d2             	test   %rdx,%rdx
    c57e:	4c 0f 49 cf          	cmovns %rdi,%r9
    c582:	48 89 f7             	mov    %rsi,%rdi
    c585:	48 09 df             	or     %rbx,%rdi
    c588:	49 89 f0             	mov    %rsi,%r8
    c58b:	49 21 c8             	and    %rcx,%r8
    c58e:	48 89 da             	mov    %rbx,%rdx
    c591:	4c 29 c2             	sub    %r8,%rdx
    c594:	48 85 f6             	test   %rsi,%rsi
    c597:	48 0f 49 d7          	cmovns %rdi,%rdx
    c59b:	49 39 d1             	cmp    %rdx,%r9
    c59e:	76 0a                	jbe    c5aa <hyperinterval::float::F64Enclosure::contains_point+0x9a>
    c5a0:	31 d2                	xor    %edx,%edx
    c5a2:	48 83 c4 18          	add    $0x18,%rsp
    c5a6:	5b                   	pop    %rbx
    c5a7:	41 5e                	pop    %r14
    c5a9:	c3                   	ret
    c5aa:	49 8b 76 10          	mov    0x10(%r14),%rsi
    c5ae:	48 89 f7             	mov    %rsi,%rdi
    c5b1:	48 09 df             	or     %rbx,%rdi
    c5b4:	48 21 f1             	and    %rsi,%rcx
    c5b7:	48 29 cb             	sub    %rcx,%rbx
    c5ba:	48 85 f6             	test   %rsi,%rsi
    c5bd:	48 0f 49 df          	cmovns %rdi,%rbx
    c5c1:	48 39 da             	cmp    %rbx,%rdx
    c5c4:	0f 96 c2             	setbe  %dl
    c5c7:	48 83 c4 18          	add    $0x18,%rsp
    c5cb:	5b                   	pop    %rbx
    c5cc:	41 5e                	pop    %r14
    c5ce:	c3                   	ret
    c5cf:	90                   	nop

hyperinterval::float::F64Enclosure::subset_of:
    c5d0:	b0 01                	mov    $0x1,%al
    c5d2:	f6 07 01             	testb  $0x1,(%rdi)
    c5d5:	74 54                	je     c62b <hyperinterval::float::F64Enclosure::subset_of+0x5b>
    c5d7:	f6 06 01             	testb  $0x1,(%rsi)
    c5da:	74 4d                	je     c629 <hyperinterval::float::F64Enclosure::subset_of+0x59>
    c5dc:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    c5e0:	4c 8b 46 08          	mov    0x8(%rsi),%r8
    c5e4:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    c5eb:	00 00 80 
    c5ee:	4d 89 c1             	mov    %r8,%r9
    c5f1:	49 09 c1             	or     %rax,%r9
    c5f4:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
    c5f8:	4d 89 c2             	mov    %r8,%r10
    c5fb:	49 21 ca             	and    %rcx,%r10
    c5fe:	49 89 c3             	mov    %rax,%r11
    c601:	4d 29 d3             	sub    %r10,%r11
    c604:	4d 85 c0             	test   %r8,%r8
    c607:	4d 0f 49 d9          	cmovns %r9,%r11
    c60b:	49 89 d0             	mov    %rdx,%r8
    c60e:	49 09 c0             	or     %rax,%r8
    c611:	49 89 d1             	mov    %rdx,%r9
    c614:	49 21 c9             	and    %rcx,%r9
    c617:	49 89 c2             	mov    %rax,%r10
    c61a:	4d 29 ca             	sub    %r9,%r10
    c61d:	48 85 d2             	test   %rdx,%rdx
    c620:	4d 0f 49 d0          	cmovns %r8,%r10
    c624:	4d 39 d3             	cmp    %r10,%r11
    c627:	76 03                	jbe    c62c <hyperinterval::float::F64Enclosure::subset_of+0x5c>
    c629:	31 c0                	xor    %eax,%eax
    c62b:	c3                   	ret
    c62c:	48 8b 57 10          	mov    0x10(%rdi),%rdx
    c630:	48 89 d7             	mov    %rdx,%rdi
    c633:	48 09 c7             	or     %rax,%rdi
    c636:	49 89 d0             	mov    %rdx,%r8
    c639:	49 21 c8             	and    %rcx,%r8
    c63c:	49 89 c1             	mov    %rax,%r9
    c63f:	4d 29 c1             	sub    %r8,%r9
    c642:	48 85 d2             	test   %rdx,%rdx
    c645:	4c 0f 49 cf          	cmovns %rdi,%r9
    c649:	48 8b 56 10          	mov    0x10(%rsi),%rdx
    c64d:	48 89 d6             	mov    %rdx,%rsi
    c650:	48 09 c6             	or     %rax,%rsi
    c653:	48 21 d1             	and    %rdx,%rcx
    c656:	48 29 c8             	sub    %rcx,%rax
    c659:	48 85 d2             	test   %rdx,%rdx
    c65c:	48 0f 49 c6          	cmovns %rsi,%rax
    c660:	49 39 c1             	cmp    %rax,%r9
    c663:	0f 96 c0             	setbe  %al
    c666:	c3                   	ret
    c667:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    c66e:	00 00 

hyperinterval::float::F64Enclosure::interior_subset_of:
    c670:	b0 01                	mov    $0x1,%al
    c672:	f6 07 01             	testb  $0x1,(%rdi)
    c675:	0f 84 93 00 00 00    	je     c70e <hyperinterval::float::F64Enclosure::interior_subset_of+0x9e>
    c67b:	f6 06 01             	testb  $0x1,(%rsi)
    c67e:	0f 84 88 00 00 00    	je     c70c <hyperinterval::float::F64Enclosure::interior_subset_of+0x9c>
    c684:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    c688:	4c 8b 46 08          	mov    0x8(%rsi),%r8
    c68c:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    c693:	00 00 80 
    c696:	4d 89 c1             	mov    %r8,%r9
    c699:	49 09 c1             	or     %rax,%r9
    c69c:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
    c6a0:	4d 89 c2             	mov    %r8,%r10
    c6a3:	49 21 ca             	and    %rcx,%r10
    c6a6:	49 89 c3             	mov    %rax,%r11
    c6a9:	4d 29 d3             	sub    %r10,%r11
    c6ac:	4d 85 c0             	test   %r8,%r8
    c6af:	4d 0f 49 d9          	cmovns %r9,%r11
    c6b3:	49 89 d0             	mov    %rdx,%r8
    c6b6:	49 09 c0             	or     %rax,%r8
    c6b9:	49 89 d1             	mov    %rdx,%r9
    c6bc:	49 21 c9             	and    %rcx,%r9
    c6bf:	49 89 c2             	mov    %rax,%r10
    c6c2:	4d 29 ca             	sub    %r9,%r10
    c6c5:	48 85 d2             	test   %rdx,%rdx
    c6c8:	4d 0f 49 d0          	cmovns %r8,%r10
    c6cc:	4d 39 d3             	cmp    %r10,%r11
    c6cf:	73 3b                	jae    c70c <hyperinterval::float::F64Enclosure::interior_subset_of+0x9c>
    c6d1:	48 8b 57 10          	mov    0x10(%rdi),%rdx
    c6d5:	48 8b 76 10          	mov    0x10(%rsi),%rsi
    c6d9:	48 89 d7             	mov    %rdx,%rdi
    c6dc:	48 09 c7             	or     %rax,%rdi
    c6df:	49 89 d0             	mov    %rdx,%r8
    c6e2:	49 21 c8             	and    %rcx,%r8
    c6e5:	49 89 c1             	mov    %rax,%r9
    c6e8:	4d 29 c1             	sub    %r8,%r9
    c6eb:	48 85 d2             	test   %rdx,%rdx
    c6ee:	4c 0f 49 cf          	cmovns %rdi,%r9
    c6f2:	48 89 f2             	mov    %rsi,%rdx
    c6f5:	48 09 c2             	or     %rax,%rdx
    c6f8:	48 21 f1             	and    %rsi,%rcx
    c6fb:	48 29 c8             	sub    %rcx,%rax
    c6fe:	48 85 f6             	test   %rsi,%rsi
    c701:	48 0f 49 c2          	cmovns %rdx,%rax
    c705:	49 39 c1             	cmp    %rax,%r9
    c708:	0f 92 c0             	setb   %al
    c70b:	c3                   	ret
    c70c:	31 c0                	xor    %eax,%eax
    c70e:	c3                   	ret
    c70f:	90                   	nop

hyperinterval::float::F64Enclosure::disjoint:
    c710:	48 83 3f 00          	cmpq   $0x0,(%rdi)
    c714:	0f 94 c0             	sete   %al
    c717:	48 8b 0e             	mov    (%rsi),%rcx
    c71a:	48 85 c9             	test   %rcx,%rcx
    c71d:	0f 94 c2             	sete   %dl
    c720:	08 c2                	or     %al,%dl
    c722:	b0 01                	mov    $0x1,%al
    c724:	74 01                	je     c727 <hyperinterval::float::F64Enclosure::disjoint+0x17>
    c726:	c3                   	ret
    c727:	f6 c1 01             	test   $0x1,%cl
    c72a:	0f 84 8a 00 00 00    	je     c7ba <hyperinterval::float::F64Enclosure::disjoint+0xaa>
    c730:	53                   	push   %rbx
    c731:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
    c738:	00 00 80 
    c73b:	4c 8b 46 08          	mov    0x8(%rsi),%r8
    c73f:	4c 8b 4f 10          	mov    0x10(%rdi),%r9
    c743:	4d 89 ca             	mov    %r9,%r10
    c746:	49 09 ca             	or     %rcx,%r10
    c749:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
    c74d:	4d 89 cb             	mov    %r9,%r11
    c750:	49 21 d3             	and    %rdx,%r11
    c753:	48 89 cb             	mov    %rcx,%rbx
    c756:	4c 29 db             	sub    %r11,%rbx
    c759:	4d 85 c9             	test   %r9,%r9
    c75c:	49 0f 49 da          	cmovns %r10,%rbx
    c760:	4d 89 c1             	mov    %r8,%r9
    c763:	49 09 c9             	or     %rcx,%r9
    c766:	4d 89 c2             	mov    %r8,%r10
    c769:	49 21 d2             	and    %rdx,%r10
    c76c:	49 89 cb             	mov    %rcx,%r11
    c76f:	4d 29 d3             	sub    %r10,%r11
    c772:	4d 85 c0             	test   %r8,%r8
    c775:	4d 0f 49 d9          	cmovns %r9,%r11
    c779:	4c 39 db             	cmp    %r11,%rbx
    c77c:	5b                   	pop    %rbx
    c77d:	72 a7                	jb     c726 <hyperinterval::float::F64Enclosure::disjoint+0x16>
    c77f:	48 8b 47 08          	mov    0x8(%rdi),%rax
    c783:	48 8b 76 10          	mov    0x10(%rsi),%rsi
    c787:	48 89 f7             	mov    %rsi,%rdi
    c78a:	48 09 cf             	or     %rcx,%rdi
    c78d:	49 89 f0             	mov    %rsi,%r8
    c790:	49 21 d0             	and    %rdx,%r8
    c793:	49 89 c9             	mov    %rcx,%r9
    c796:	4d 29 c1             	sub    %r8,%r9
    c799:	48 85 f6             	test   %rsi,%rsi
    c79c:	4c 0f 49 cf          	cmovns %rdi,%r9
    c7a0:	48 89 c6             	mov    %rax,%rsi
    c7a3:	48 09 ce             	or     %rcx,%rsi
    c7a6:	48 21 c2             	and    %rax,%rdx
    c7a9:	48 29 d1             	sub    %rdx,%rcx
    c7ac:	48 85 c0             	test   %rax,%rax
    c7af:	48 0f 49 ce          	cmovns %rsi,%rcx
    c7b3:	49 39 c9             	cmp    %rcx,%r9
    c7b6:	0f 92 c0             	setb   %al
    c7b9:	c3                   	ret
    c7ba:	31 c0                	xor    %eax,%eax
    c7bc:	c3                   	ret
    c7bd:	0f 1f 00             	nopl   (%rax)

hyperinterval::float::F64Enclosure::overlaps:
    c7c0:	48 83 3f 00          	cmpq   $0x0,(%rdi)
    c7c4:	0f 94 c0             	sete   %al
    c7c7:	48 8b 0e             	mov    (%rsi),%rcx
    c7ca:	48 85 c9             	test   %rcx,%rcx
    c7cd:	0f 94 c2             	sete   %dl
    c7d0:	08 c2                	or     %al,%dl
    c7d2:	74 03                	je     c7d7 <hyperinterval::float::F64Enclosure::overlaps+0x17>
    c7d4:	31 c0                	xor    %eax,%eax
    c7d6:	c3                   	ret
    c7d7:	b0 01                	mov    $0x1,%al
    c7d9:	f6 c1 01             	test   $0x1,%cl
    c7dc:	0f 84 8a 00 00 00    	je     c86c <hyperinterval::float::F64Enclosure::overlaps+0xac>
    c7e2:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    c7e9:	00 00 80 
    c7ec:	48 8b 56 08          	mov    0x8(%rsi),%rdx
    c7f0:	4c 8b 47 10          	mov    0x10(%rdi),%r8
    c7f4:	4d 89 c1             	mov    %r8,%r9
    c7f7:	49 09 c1             	or     %rax,%r9
    c7fa:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
    c7fe:	4d 89 c2             	mov    %r8,%r10
    c801:	49 21 ca             	and    %rcx,%r10
    c804:	49 89 c3             	mov    %rax,%r11
    c807:	4d 29 d3             	sub    %r10,%r11
    c80a:	4d 85 c0             	test   %r8,%r8
    c80d:	4d 0f 49 d9          	cmovns %r9,%r11
    c811:	49 89 d0             	mov    %rdx,%r8
    c814:	49 09 c0             	or     %rax,%r8
    c817:	49 89 d1             	mov    %rdx,%r9
    c81a:	49 21 c9             	and    %rcx,%r9
    c81d:	49 89 c2             	mov    %rax,%r10
    c820:	4d 29 ca             	sub    %r9,%r10
    c823:	48 85 d2             	test   %rdx,%rdx
    c826:	4d 0f 49 d0          	cmovns %r8,%r10
    c82a:	4d 39 d3             	cmp    %r10,%r11
    c82d:	73 03                	jae    c832 <hyperinterval::float::F64Enclosure::overlaps+0x72>
    c82f:	31 c0                	xor    %eax,%eax
    c831:	c3                   	ret
    c832:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    c836:	48 8b 76 10          	mov    0x10(%rsi),%rsi
    c83a:	48 89 f7             	mov    %rsi,%rdi
    c83d:	48 09 c7             	or     %rax,%rdi
    c840:	49 89 f0             	mov    %rsi,%r8
    c843:	49 21 c8             	and    %rcx,%r8
    c846:	49 89 c1             	mov    %rax,%r9
    c849:	4d 29 c1             	sub    %r8,%r9
    c84c:	48 85 f6             	test   %rsi,%rsi
    c84f:	4c 0f 49 cf          	cmovns %rdi,%r9
    c853:	48 89 d6             	mov    %rdx,%rsi
    c856:	48 09 c6             	or     %rax,%rsi
    c859:	48 21 d1             	and    %rdx,%rcx
    c85c:	48 29 c8             	sub    %rcx,%rax
    c85f:	48 85 d2             	test   %rdx,%rdx
    c862:	48 0f 49 c6          	cmovns %rsi,%rax
    c866:	49 39 c1             	cmp    %rax,%r9
    c869:	0f 93 c0             	setae  %al
    c86c:	c3                   	ret
    c86d:	0f 1f 00             	nopl   (%rax)

hyperinterval::float::F64Enclosure::hull:
    c870:	48 89 f8             	mov    %rdi,%rax
    c873:	4c 8b 16             	mov    (%rsi),%r10
    c876:	4c 8b 02             	mov    (%rdx),%r8
    c879:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
    c87d:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
    c881:	41 f6 c2 01          	test   $0x1,%r10b
    c885:	0f 84 98 00 00 00    	je     c923 <hyperinterval::float::F64Enclosure::hull+0xb3>
    c88b:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
    c88f:	48 8b 56 10          	mov    0x10(%rsi),%rdx
    c893:	41 f6 c0 01          	test   $0x1,%r8b
    c897:	0f 84 92 00 00 00    	je     c92f <hyperinterval::float::F64Enclosure::hull+0xbf>
    c89d:	41 56                	push   %r14
    c89f:	53                   	push   %rbx
    c8a0:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c8a7:	00 00 80 
    c8aa:	4d 89 ca             	mov    %r9,%r10
    c8ad:	49 09 f2             	or     %rsi,%r10
    c8b0:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
    c8b4:	4d 89 cb             	mov    %r9,%r11
    c8b7:	4d 21 c3             	and    %r8,%r11
    c8ba:	48 89 f3             	mov    %rsi,%rbx
    c8bd:	4c 29 db             	sub    %r11,%rbx
    c8c0:	4d 85 c9             	test   %r9,%r9
    c8c3:	49 0f 49 da          	cmovns %r10,%rbx
    c8c7:	49 89 fa             	mov    %rdi,%r10
    c8ca:	49 09 f2             	or     %rsi,%r10
    c8cd:	49 89 fb             	mov    %rdi,%r11
    c8d0:	4d 21 c3             	and    %r8,%r11
    c8d3:	49 89 f6             	mov    %rsi,%r14
    c8d6:	4d 29 de             	sub    %r11,%r14
    c8d9:	48 85 ff             	test   %rdi,%rdi
    c8dc:	4d 0f 49 f2          	cmovns %r10,%r14
    c8e0:	4c 39 f3             	cmp    %r14,%rbx
    c8e3:	49 0f 46 f9          	cmovbe %r9,%rdi
    c8e7:	49 89 d1             	mov    %rdx,%r9
    c8ea:	49 09 f1             	or     %rsi,%r9
    c8ed:	49 89 d2             	mov    %rdx,%r10
    c8f0:	4d 21 c2             	and    %r8,%r10
    c8f3:	49 89 f3             	mov    %rsi,%r11
    c8f6:	4d 29 d3             	sub    %r10,%r11
    c8f9:	48 85 d2             	test   %rdx,%rdx
    c8fc:	4d 0f 49 d9          	cmovns %r9,%r11
    c900:	49 89 c9             	mov    %rcx,%r9
    c903:	49 09 f1             	or     %rsi,%r9
    c906:	49 21 c8             	and    %rcx,%r8
    c909:	4c 29 c6             	sub    %r8,%rsi
    c90c:	48 85 c9             	test   %rcx,%rcx
    c90f:	49 0f 49 f1          	cmovns %r9,%rsi
    c913:	49 39 f3             	cmp    %rsi,%r11
    c916:	48 0f 43 ca          	cmovae %rdx,%rcx
    c91a:	41 b8 01 00 00 00    	mov    $0x1,%r8d
    c920:	5b                   	pop    %rbx
    c921:	41 5e                	pop    %r14
    c923:	4c 89 00             	mov    %r8,(%rax)
    c926:	48 89 78 08          	mov    %rdi,0x8(%rax)
    c92a:	48 89 48 10          	mov    %rcx,0x10(%rax)
    c92e:	c3                   	ret
    c92f:	48 89 d1             	mov    %rdx,%rcx
    c932:	4c 89 cf             	mov    %r9,%rdi
    c935:	4d 89 d0             	mov    %r10,%r8
    c938:	4c 89 00             	mov    %r8,(%rax)
    c93b:	48 89 78 08          	mov    %rdi,0x8(%rax)
    c93f:	48 89 48 10          	mov    %rcx,0x10(%rax)
    c943:	c3                   	ret
    c944:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    c94b:	00 00 00 
    c94e:	66 90                	xchg   %ax,%ax

hyperinterval::float::F64Enclosure::intersection:
    c950:	48 89 f8             	mov    %rdi,%rax
    c953:	f6 06 01             	testb  $0x1,(%rsi)
    c956:	0f 84 df 00 00 00    	je     ca3b <hyperinterval::float::F64Enclosure::intersection+0xeb>
    c95c:	f6 02 01             	testb  $0x1,(%rdx)
    c95f:	0f 84 d6 00 00 00    	je     ca3b <hyperinterval::float::F64Enclosure::intersection+0xeb>
    c965:	41 56                	push   %r14
    c967:	53                   	push   %rbx
    c968:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
    c96c:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
    c970:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
    c977:	00 00 80 
    c97a:	49 89 ca             	mov    %rcx,%r10
    c97d:	49 09 fa             	or     %rdi,%r10
    c980:	4c 8d 47 ff          	lea    -0x1(%rdi),%r8
    c984:	49 89 cb             	mov    %rcx,%r11
    c987:	4d 21 c3             	and    %r8,%r11
    c98a:	48 89 fb             	mov    %rdi,%rbx
    c98d:	4c 29 db             	sub    %r11,%rbx
    c990:	48 85 c9             	test   %rcx,%rcx
    c993:	49 0f 49 da          	cmovns %r10,%rbx
    c997:	4d 89 ca             	mov    %r9,%r10
    c99a:	49 09 fa             	or     %rdi,%r10
    c99d:	4d 89 cb             	mov    %r9,%r11
    c9a0:	4d 21 c3             	and    %r8,%r11
    c9a3:	49 89 fe             	mov    %rdi,%r14
    c9a6:	4d 29 de             	sub    %r11,%r14
    c9a9:	4d 85 c9             	test   %r9,%r9
    c9ac:	4d 0f 49 f2          	cmovns %r10,%r14
    c9b0:	48 8b 76 10          	mov    0x10(%rsi),%rsi
    c9b4:	4c 39 f3             	cmp    %r14,%rbx
    c9b7:	49 0f 42 c9          	cmovb  %r9,%rcx
    c9bb:	48 8b 52 10          	mov    0x10(%rdx),%rdx
    c9bf:	49 89 f1             	mov    %rsi,%r9
    c9c2:	49 09 f9             	or     %rdi,%r9
    c9c5:	49 89 f2             	mov    %rsi,%r10
    c9c8:	4d 21 c2             	and    %r8,%r10
    c9cb:	49 89 fb             	mov    %rdi,%r11
    c9ce:	4d 29 d3             	sub    %r10,%r11
    c9d1:	48 85 f6             	test   %rsi,%rsi
    c9d4:	4d 0f 49 d9          	cmovns %r9,%r11
    c9d8:	49 89 d1             	mov    %rdx,%r9
    c9db:	49 09 f9             	or     %rdi,%r9
    c9de:	49 89 d2             	mov    %rdx,%r10
    c9e1:	4d 21 c2             	and    %r8,%r10
    c9e4:	48 89 fb             	mov    %rdi,%rbx
    c9e7:	4c 29 d3             	sub    %r10,%rbx
    c9ea:	48 85 d2             	test   %rdx,%rdx
    c9ed:	49 0f 49 d9          	cmovns %r9,%rbx
    c9f1:	49 39 db             	cmp    %rbx,%r11
    c9f4:	48 0f 47 f2          	cmova  %rdx,%rsi
    c9f8:	48 89 ca             	mov    %rcx,%rdx
    c9fb:	48 09 fa             	or     %rdi,%rdx
    c9fe:	49 89 c9             	mov    %rcx,%r9
    ca01:	4d 21 c1             	and    %r8,%r9
    ca04:	49 89 fa             	mov    %rdi,%r10
    ca07:	4d 29 ca             	sub    %r9,%r10
    ca0a:	48 85 c9             	test   %rcx,%rcx
    ca0d:	4c 0f 49 d2          	cmovns %rdx,%r10
    ca11:	48 89 f2             	mov    %rsi,%rdx
    ca14:	48 09 fa             	or     %rdi,%rdx
    ca17:	49 21 f0             	and    %rsi,%r8
    ca1a:	4c 29 c7             	sub    %r8,%rdi
    ca1d:	48 85 f6             	test   %rsi,%rsi
    ca20:	48 0f 49 fa          	cmovns %rdx,%rdi
    ca24:	31 d2                	xor    %edx,%edx
    ca26:	49 39 fa             	cmp    %rdi,%r10
    ca29:	0f 96 c2             	setbe  %dl
    ca2c:	5b                   	pop    %rbx
    ca2d:	41 5e                	pop    %r14
    ca2f:	48 89 10             	mov    %rdx,(%rax)
    ca32:	48 89 48 08          	mov    %rcx,0x8(%rax)
    ca36:	48 89 70 10          	mov    %rsi,0x10(%rax)
    ca3a:	c3                   	ret
    ca3b:	31 d2                	xor    %edx,%edx
    ca3d:	48 89 10             	mov    %rdx,(%rax)
    ca40:	48 89 48 08          	mov    %rcx,0x8(%rax)
    ca44:	48 89 70 10          	mov    %rsi,0x10(%rax)
    ca48:	c3                   	ret
    ca49:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

hyperinterval::float::F64Enclosure::signs:
    ca50:	f6 07 01             	testb  $0x1,(%rdi)
    ca53:	0f 84 81 00 00 00    	je     cada <hyperinterval::float::F64Enclosure::signs+0x8a>
    ca59:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    ca60:	00 00 80 
    ca63:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    ca67:	48 8b 4f 10          	mov    0x10(%rdi),%rcx
    ca6b:	48 89 d6             	mov    %rdx,%rsi
    ca6e:	48 09 c6             	or     %rax,%rsi
    ca71:	4c 8d 48 ff          	lea    -0x1(%rax),%r9
    ca75:	48 89 d7             	mov    %rdx,%rdi
    ca78:	4c 21 cf             	and    %r9,%rdi
    ca7b:	49 89 c2             	mov    %rax,%r10
    ca7e:	49 29 fa             	sub    %rdi,%r10
    ca81:	48 85 d2             	test   %rdx,%rdx
    ca84:	4c 0f 49 d6          	cmovns %rsi,%r10
    ca88:	45 31 c0             	xor    %r8d,%r8d
    ca8b:	4d 85 d2             	test   %r10,%r10
    ca8e:	40 0f 99 c6          	setns  %sil
    ca92:	48 89 ca             	mov    %rcx,%rdx
    ca95:	48 09 c2             	or     %rax,%rdx
    ca98:	49 21 c9             	and    %rcx,%r9
    ca9b:	48 89 c7             	mov    %rax,%rdi
    ca9e:	4c 29 cf             	sub    %r9,%rdi
    caa1:	49 39 c2             	cmp    %rax,%r10
    caa4:	77 1c                	ja     cac2 <hyperinterval::float::F64Enclosure::signs+0x72>
    caa6:	44 8d 4e 02          	lea    0x2(%rsi),%r9d
    caaa:	48 85 ff             	test   %rdi,%rdi
    caad:	41 88 f0             	mov    %sil,%r8b
    cab0:	41 0f b6 f1          	movzbl %r9b,%esi
    cab4:	44 0f 48 c6          	cmovs  %esi,%r8d
    cab8:	48 85 c9             	test   %rcx,%rcx
    cabb:	44 0f 49 c6          	cmovns %esi,%r8d
    cabf:	44 89 c6             	mov    %r8d,%esi
    cac2:	48 85 c9             	test   %rcx,%rcx
    cac5:	48 0f 48 d7          	cmovs  %rdi,%rdx
    cac9:	8d 4e 04             	lea    0x4(%rsi),%ecx
    cacc:	48 39 c2             	cmp    %rax,%rdx
    cacf:	40 0f b6 d6          	movzbl %sil,%edx
    cad3:	0f b6 c1             	movzbl %cl,%eax
    cad6:	0f 46 c2             	cmovbe %edx,%eax
    cad9:	c3                   	ret
    cada:	31 c0                	xor    %eax,%eax
    cadc:	c3                   	ret
    cadd:	0f 1f 00             	nopl   (%rax)

hyperinterval::float::F64Enclosure::min_image:
    cae0:	48 89 f8             	mov    %rdi,%rax
    cae3:	f6 06 01             	testb  $0x1,(%rsi)
    cae6:	0f 84 aa 00 00 00    	je     cb96 <hyperinterval::float::F64Enclosure::min_image+0xb6>
    caec:	f6 02 01             	testb  $0x1,(%rdx)
    caef:	0f 84 a1 00 00 00    	je     cb96 <hyperinterval::float::F64Enclosure::min_image+0xb6>
    caf5:	41 56                	push   %r14
    caf7:	53                   	push   %rbx
    caf8:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
    cafc:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
    cb00:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
    cb04:	48 8b 52 10          	mov    0x10(%rdx),%rdx
    cb08:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cb0f:	00 00 80 
    cb12:	49 89 fa             	mov    %rdi,%r10
    cb15:	49 09 f2             	or     %rsi,%r10
    cb18:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
    cb1c:	49 89 fb             	mov    %rdi,%r11
    cb1f:	4d 21 c3             	and    %r8,%r11
    cb22:	48 89 f3             	mov    %rsi,%rbx
    cb25:	4c 29 db             	sub    %r11,%rbx
    cb28:	48 85 ff             	test   %rdi,%rdi
    cb2b:	49 0f 49 da          	cmovns %r10,%rbx
    cb2f:	4d 89 ca             	mov    %r9,%r10
    cb32:	49 09 f2             	or     %rsi,%r10
    cb35:	4d 89 cb             	mov    %r9,%r11
    cb38:	4d 21 c3             	and    %r8,%r11
    cb3b:	49 89 f6             	mov    %rsi,%r14
    cb3e:	4d 29 de             	sub    %r11,%r14
    cb41:	4d 85 c9             	test   %r9,%r9
    cb44:	4d 0f 49 f2          	cmovns %r10,%r14
    cb48:	4c 39 f3             	cmp    %r14,%rbx
    cb4b:	49 0f 47 f9          	cmova  %r9,%rdi
    cb4f:	49 89 c9             	mov    %rcx,%r9
    cb52:	49 09 f1             	or     %rsi,%r9
    cb55:	49 89 ca             	mov    %rcx,%r10
    cb58:	4d 21 c2             	and    %r8,%r10
    cb5b:	49 89 f3             	mov    %rsi,%r11
    cb5e:	4d 29 d3             	sub    %r10,%r11
    cb61:	48 85 c9             	test   %rcx,%rcx
    cb64:	4d 0f 49 d9          	cmovns %r9,%r11
    cb68:	49 89 d1             	mov    %rdx,%r9
    cb6b:	49 09 f1             	or     %rsi,%r9
    cb6e:	49 21 d0             	and    %rdx,%r8
    cb71:	4c 29 c6             	sub    %r8,%rsi
    cb74:	48 85 d2             	test   %rdx,%rdx
    cb77:	49 0f 49 f1          	cmovns %r9,%rsi
    cb7b:	49 39 f3             	cmp    %rsi,%r11
    cb7e:	48 0f 47 ca          	cmova  %rdx,%rcx
    cb82:	ba 01 00 00 00       	mov    $0x1,%edx
    cb87:	5b                   	pop    %rbx
    cb88:	41 5e                	pop    %r14
    cb8a:	48 89 10             	mov    %rdx,(%rax)
    cb8d:	48 89 78 08          	mov    %rdi,0x8(%rax)
    cb91:	48 89 48 10          	mov    %rcx,0x10(%rax)
    cb95:	c3                   	ret
    cb96:	31 d2                	xor    %edx,%edx
    cb98:	48 89 10             	mov    %rdx,(%rax)
    cb9b:	48 89 78 08          	mov    %rdi,0x8(%rax)
    cb9f:	48 89 48 10          	mov    %rcx,0x10(%rax)
    cba3:	c3                   	ret
    cba4:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    cbab:	00 00 00 
    cbae:	66 90                	xchg   %ax,%ax

hyperinterval::float::F64Enclosure::max_image:
    cbb0:	48 89 f8             	mov    %rdi,%rax
    cbb3:	f6 06 01             	testb  $0x1,(%rsi)
    cbb6:	0f 84 aa 00 00 00    	je     cc66 <hyperinterval::float::F64Enclosure::max_image+0xb6>
    cbbc:	f6 02 01             	testb  $0x1,(%rdx)
    cbbf:	0f 84 a1 00 00 00    	je     cc66 <hyperinterval::float::F64Enclosure::max_image+0xb6>
    cbc5:	41 56                	push   %r14
    cbc7:	53                   	push   %rbx
    cbc8:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
    cbcc:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
    cbd0:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
    cbd4:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cbdb:	00 00 80 
    cbde:	49 89 fa             	mov    %rdi,%r10
    cbe1:	49 09 f2             	or     %rsi,%r10
    cbe4:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
    cbe8:	49 89 fb             	mov    %rdi,%r11
    cbeb:	4d 21 c3             	and    %r8,%r11
    cbee:	48 89 f3             	mov    %rsi,%rbx
    cbf1:	4c 29 db             	sub    %r11,%rbx
    cbf4:	48 85 ff             	test   %rdi,%rdi
    cbf7:	49 0f 49 da          	cmovns %r10,%rbx
    cbfb:	4d 89 ca             	mov    %r9,%r10
    cbfe:	49 09 f2             	or     %rsi,%r10
    cc01:	4d 89 cb             	mov    %r9,%r11
    cc04:	4d 21 c3             	and    %r8,%r11
    cc07:	49 89 f6             	mov    %rsi,%r14
    cc0a:	4d 29 de             	sub    %r11,%r14
    cc0d:	4d 85 c9             	test   %r9,%r9
    cc10:	4d 0f 49 f2          	cmovns %r10,%r14
    cc14:	4c 39 f3             	cmp    %r14,%rbx
    cc17:	49 0f 42 f9          	cmovb  %r9,%rdi
    cc1b:	49 89 c9             	mov    %rcx,%r9
    cc1e:	49 09 f1             	or     %rsi,%r9
    cc21:	49 89 ca             	mov    %rcx,%r10
    cc24:	4d 21 c2             	and    %r8,%r10
    cc27:	49 89 f3             	mov    %rsi,%r11
    cc2a:	4d 29 d3             	sub    %r10,%r11
    cc2d:	48 85 c9             	test   %rcx,%rcx
    cc30:	4d 0f 49 d9          	cmovns %r9,%r11
    cc34:	48 8b 52 10          	mov    0x10(%rdx),%rdx
    cc38:	49 89 d1             	mov    %rdx,%r9
    cc3b:	49 09 f1             	or     %rsi,%r9
    cc3e:	49 21 d0             	and    %rdx,%r8
    cc41:	4c 29 c6             	sub    %r8,%rsi
    cc44:	48 85 d2             	test   %rdx,%rdx
    cc47:	49 0f 49 f1          	cmovns %r9,%rsi
    cc4b:	49 39 f3             	cmp    %rsi,%r11
    cc4e:	48 0f 42 ca          	cmovb  %rdx,%rcx
    cc52:	ba 01 00 00 00       	mov    $0x1,%edx
    cc57:	5b                   	pop    %rbx
    cc58:	41 5e                	pop    %r14
    cc5a:	48 89 10             	mov    %rdx,(%rax)
    cc5d:	48 89 78 08          	mov    %rdi,0x8(%rax)
    cc61:	48 89 48 10          	mov    %rcx,0x10(%rax)
    cc65:	c3                   	ret
    cc66:	31 d2                	xor    %edx,%edx
    cc68:	48 89 10             	mov    %rdx,(%rax)
    cc6b:	48 89 78 08          	mov    %rdi,0x8(%rax)
    cc6f:	48 89 48 10          	mov    %rcx,0x10(%rax)
    cc73:	c3                   	ret
    cc74:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    cc7b:	00 00 00 
    cc7e:	66 90                	xchg   %ax,%ax

hyperinterval::float::F64Enclosure::add:
    cc80:	48 89 f8             	mov    %rdi,%rax
    cc83:	f6 06 01             	testb  $0x1,(%rsi)
    cc86:	0f 84 cb 00 00 00    	je     cd57 <hyperinterval::float::F64Enclosure::add+0xd7>
    cc8c:	f6 02 01             	testb  $0x1,(%rdx)
    cc8f:	0f 84 c2 00 00 00    	je     cd57 <hyperinterval::float::F64Enclosure::add+0xd7>
    cc95:	55                   	push   %rbp
    cc96:	41 57                	push   %r15
    cc98:	41 56                	push   %r14
    cc9a:	41 55                	push   %r13
    cc9c:	41 54                	push   %r12
    cc9e:	53                   	push   %rbx
    cc9f:	48 83 ec 18          	sub    $0x18,%rsp
    cca3:	48 89 c5             	mov    %rax,%rbp
    cca6:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
    ccaa:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
    ccae:	4c 8b 62 10          	mov    0x10(%rdx),%r12
    ccb2:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
    ccb9:	00 00 80 
    ccbc:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
    ccc3:	00 f0 7f 
    ccc6:	4c 8b 42 08          	mov    0x8(%rdx),%r8
    ccca:	48 89 e7             	mov    %rsp,%rdi
    cccd:	48 89 de             	mov    %rbx,%rsi
    ccd0:	4c 89 f2             	mov    %r14,%rdx
    ccd3:	e8 18 26 00 00       	call   f2f0 <hyperinterval::ieee::Format::add>
    ccd8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    ccdc:	74 57                	je     cd35 <hyperinterval::float::F64Enclosure::add+0xb5>
    ccde:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    cce3:	48 89 e7             	mov    %rsp,%rdi
    cce6:	48 89 de             	mov    %rbx,%rsi
    cce9:	4c 89 f2             	mov    %r14,%rdx
    ccec:	4c 89 f9             	mov    %r15,%rcx
    ccef:	4d 89 e0             	mov    %r12,%r8
    ccf2:	e8 f9 25 00 00       	call   f2f0 <hyperinterval::ieee::Format::add>
    ccf7:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    ccfb:	74 38                	je     cd35 <hyperinterval::float::F64Enclosure::add+0xb5>
    ccfd:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
    cd02:	48 89 e7             	mov    %rsp,%rdi
    cd05:	48 89 de             	mov    %rbx,%rsi
    cd08:	4c 89 f2             	mov    %r14,%rdx
    cd0b:	4c 89 e9             	mov    %r13,%rcx
    cd0e:	e8 2d 20 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    cd13:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    cd17:	74 1c                	je     cd35 <hyperinterval::float::F64Enclosure::add+0xb5>
    cd19:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    cd1e:	48 89 e7             	mov    %rsp,%rdi
    cd21:	48 89 de             	mov    %rbx,%rsi
    cd24:	4c 89 f2             	mov    %r14,%rdx
    cd27:	4c 89 f9             	mov    %r15,%rcx
    cd2a:	e8 11 20 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    cd2f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    cd33:	75 2a                	jne    cd5f <hyperinterval::float::F64Enclosure::add+0xdf>
    cd35:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
    cd3a:	48 89 e8             	mov    %rbp,%rax
    cd3d:	88 4d 08             	mov    %cl,0x8(%rbp)
    cd40:	48 c7 45 00 02 00 00 	movq   $0x2,0x0(%rbp)
    cd47:	00 
    cd48:	48 83 c4 18          	add    $0x18,%rsp
    cd4c:	5b                   	pop    %rbx
    cd4d:	41 5c                	pop    %r12
    cd4f:	41 5d                	pop    %r13
    cd51:	41 5e                	pop    %r14
    cd53:	41 5f                	pop    %r15
    cd55:	5d                   	pop    %rbp
    cd56:	c3                   	ret
    cd57:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
    cd5e:	c3                   	ret
    cd5f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    cd64:	4c 89 e0             	mov    %r12,%rax
    cd67:	48 09 d8             	or     %rbx,%rax
    cd6a:	48 8d 53 ff          	lea    -0x1(%rbx),%rdx
    cd6e:	4c 89 e6             	mov    %r12,%rsi
    cd71:	48 21 d6             	and    %rdx,%rsi
    cd74:	48 89 df             	mov    %rbx,%rdi
    cd77:	48 29 f7             	sub    %rsi,%rdi
    cd7a:	4d 85 e4             	test   %r12,%r12
    cd7d:	48 0f 49 f8          	cmovns %rax,%rdi
    cd81:	48 89 c8             	mov    %rcx,%rax
    cd84:	48 09 d8             	or     %rbx,%rax
    cd87:	48 21 ca             	and    %rcx,%rdx
    cd8a:	48 29 d3             	sub    %rdx,%rbx
    cd8d:	48 85 c9             	test   %rcx,%rcx
    cd90:	48 0f 49 d8          	cmovns %rax,%rbx
    cd94:	48 39 df             	cmp    %rbx,%rdi
    cd97:	48 89 e8             	mov    %rbp,%rax
    cd9a:	76 0d                	jbe    cda9 <hyperinterval::float::F64Enclosure::add+0x129>
    cd9c:	c6 40 08 01          	movb   $0x1,0x8(%rax)
    cda0:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
    cda7:	eb 9f                	jmp    cd48 <hyperinterval::float::F64Enclosure::add+0xc8>
    cda9:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
    cdb0:	4c 89 60 08          	mov    %r12,0x8(%rax)
    cdb4:	48 89 48 10          	mov    %rcx,0x10(%rax)
    cdb8:	eb 8e                	jmp    cd48 <hyperinterval::float::F64Enclosure::add+0xc8>
    cdba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

hyperinterval::float::F64Enclosure::sub:
    cdc0:	53                   	push   %rbx
    cdc1:	48 83 ec 20          	sub    $0x20,%rsp
    cdc5:	48 89 fb             	mov    %rdi,%rbx
    cdc8:	f6 02 01             	testb  $0x1,(%rdx)
    cdcb:	74 30                	je     cdfd <hyperinterval::float::F64Enclosure::sub+0x3d>
    cdcd:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
    cdd1:	48 8b 52 10          	mov    0x10(%rdx),%rdx
    cdd5:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    cddc:	00 00 80 
    cddf:	48 89 d1             	mov    %rdx,%rcx
    cde2:	48 31 c1             	xor    %rax,%rcx
    cde5:	48 85 d2             	test   %rdx,%rdx
    cde8:	48 0f 44 ca          	cmove  %rdx,%rcx
    cdec:	48 31 f8             	xor    %rdi,%rax
    cdef:	48 85 ff             	test   %rdi,%rdi
    cdf2:	48 0f 44 c7          	cmove  %rdi,%rax
    cdf6:	ba 01 00 00 00       	mov    $0x1,%edx
    cdfb:	eb 02                	jmp    cdff <hyperinterval::float::F64Enclosure::sub+0x3f>
    cdfd:	31 d2                	xor    %edx,%edx
    cdff:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    ce04:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
    ce09:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    ce0e:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
    ce13:	48 89 df             	mov    %rbx,%rdi
    ce16:	ff 15 6c 3e 05 00    	call   *0x53e6c(%rip)        # 60c88 <_GLOBAL_OFFSET_TABLE_+0x6d0>
    ce1c:	48 89 d8             	mov    %rbx,%rax
    ce1f:	48 83 c4 20          	add    $0x20,%rsp
    ce23:	5b                   	pop    %rbx
    ce24:	c3                   	ret
    ce25:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    ce2c:	00 00 00 
    ce2f:	90                   	nop

hyperinterval::float::F64Enclosure::corner_image:
    ce30:	f6 06 01             	testb  $0x1,(%rsi)
    ce33:	0f 84 48 04 00 00    	je     d281 <hyperinterval::float::F64Enclosure::corner_image+0x451>
    ce39:	f6 02 01             	testb  $0x1,(%rdx)
    ce3c:	0f 84 3f 04 00 00    	je     d281 <hyperinterval::float::F64Enclosure::corner_image+0x451>
    ce42:	55                   	push   %rbp
    ce43:	41 57                	push   %r15
    ce45:	41 56                	push   %r14
    ce47:	41 55                	push   %r13
    ce49:	41 54                	push   %r12
    ce4b:	53                   	push   %rbx
    ce4c:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
    ce53:	48 89 7c 24 78       	mov    %rdi,0x78(%rsp)
    ce58:	49 ba 00 00 00 00 00 	movabs $0x8000000000000000,%r10
    ce5f:	00 00 80 
    ce62:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
    ce69:	00 f0 7f 
    ce6c:	4c 8b 42 08          	mov    0x8(%rdx),%r8
    ce70:	48 8b 42 10          	mov    0x10(%rdx),%rax
    ce74:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    ce79:	48 8b 5e 08          	mov    0x8(%rsi),%rbx
    ce7d:	48 8b 46 10          	mov    0x10(%rsi),%rax
    ce81:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
    ce86:	84 c9                	test   %cl,%cl
    ce88:	0f 84 fb 03 00 00    	je     d289 <hyperinterval::float::F64Enclosure::corner_image+0x459>
    ce8e:	48 89 e7             	mov    %rsp,%rdi
    ce91:	4c 89 d6             	mov    %r10,%rsi
    ce94:	4c 89 f2             	mov    %r14,%rdx
    ce97:	48 89 d9             	mov    %rbx,%rcx
    ce9a:	4d 89 c5             	mov    %r8,%r13
    ce9d:	4d 89 f7             	mov    %r14,%r15
    cea0:	e8 eb 2a 00 00       	call   f990 <hyperinterval::ieee::Format::div>
    cea5:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    cea9:	0f 85 e1 04 00 00    	jne    d390 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    ceaf:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    ceb4:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
    ceb9:	48 89 e7             	mov    %rsp,%rdi
    cebc:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cec3:	00 00 80 
    cec6:	4c 89 fa             	mov    %r15,%rdx
    cec9:	e8 72 1e 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    cece:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ced2:	0f 85 b8 04 00 00    	jne    d390 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    ced8:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    cedd:	48 89 e7             	mov    %rsp,%rdi
    cee0:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cee7:	00 00 80 
    ceea:	4c 89 fa             	mov    %r15,%rdx
    ceed:	4c 89 f1             	mov    %r14,%rcx
    cef0:	e8 4b 1e 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    cef5:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    cef9:	0f 85 91 04 00 00    	jne    d390 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    ceff:	48 89 e8             	mov    %rbp,%rax
    cf02:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cf09:	00 00 80 
    cf0c:	48 09 f0             	or     %rsi,%rax
    cf0f:	48 8d 56 ff          	lea    -0x1(%rsi),%rdx
    cf13:	48 89 e9             	mov    %rbp,%rcx
    cf16:	48 21 d1             	and    %rdx,%rcx
    cf19:	49 89 f7             	mov    %rsi,%r15
    cf1c:	49 29 cf             	sub    %rcx,%r15
    cf1f:	48 85 ed             	test   %rbp,%rbp
    cf22:	4c 0f 49 f8          	cmovns %rax,%r15
    cf26:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    cf2b:	48 89 f8             	mov    %rdi,%rax
    cf2e:	48 09 f0             	or     %rsi,%rax
    cf31:	48 89 f9             	mov    %rdi,%rcx
    cf34:	48 21 d1             	and    %rdx,%rcx
    cf37:	49 89 f4             	mov    %rsi,%r12
    cf3a:	49 29 cc             	sub    %rcx,%r12
    cf3d:	48 85 ff             	test   %rdi,%rdi
    cf40:	4c 0f 49 e0          	cmovns %rax,%r12
    cf44:	41 b6 01             	mov    $0x1,%r14b
    cf47:	4d 39 e7             	cmp    %r12,%r15
    cf4a:	0f 87 46 04 00 00    	ja     d396 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    cf50:	48 89 7c 24 38       	mov    %rdi,0x38(%rsp)
    cf55:	48 89 6c 24 28       	mov    %rbp,0x28(%rsp)
    cf5a:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
    cf5f:	48 89 e7             	mov    %rsp,%rdi
    cf62:	48 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%rbp
    cf69:	00 f0 7f 
    cf6c:	48 89 ea             	mov    %rbp,%rdx
    cf6f:	48 89 d9             	mov    %rbx,%rcx
    cf72:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
    cf77:	e8 14 2a 00 00       	call   f990 <hyperinterval::ieee::Format::div>
    cf7c:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    cf80:	0f 85 0a 04 00 00    	jne    d390 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    cf86:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    cf8b:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    cf90:	48 89 e7             	mov    %rsp,%rdi
    cf93:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cf9a:	00 00 80 
    cf9d:	48 89 ea             	mov    %rbp,%rdx
    cfa0:	e8 9b 1d 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    cfa5:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    cfa9:	0f 85 e1 03 00 00    	jne    d390 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    cfaf:	48 89 ea             	mov    %rbp,%rdx
    cfb2:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    cfb7:	48 89 e7             	mov    %rsp,%rdi
    cfba:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cfc1:	00 00 80 
    cfc4:	48 89 d9             	mov    %rbx,%rcx
    cfc7:	e8 74 1d 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    cfcc:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    cfd0:	0f 85 ba 03 00 00    	jne    d390 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    cfd6:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    cfdb:	48 89 ea             	mov    %rbp,%rdx
    cfde:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cfe5:	00 00 80 
    cfe8:	48 09 f2             	or     %rsi,%rdx
    cfeb:	48 89 ef             	mov    %rbp,%rdi
    cfee:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
    cff3:	4c 21 cf             	and    %r9,%rdi
    cff6:	48 89 f1             	mov    %rsi,%rcx
    cff9:	48 29 f9             	sub    %rdi,%rcx
    cffc:	48 85 ed             	test   %rbp,%rbp
    cfff:	48 0f 49 ca          	cmovns %rdx,%rcx
    d003:	49 89 c0             	mov    %rax,%r8
    d006:	49 09 f0             	or     %rsi,%r8
    d009:	48 89 c7             	mov    %rax,%rdi
    d00c:	4c 21 cf             	and    %r9,%rdi
    d00f:	48 89 f2             	mov    %rsi,%rdx
    d012:	48 29 fa             	sub    %rdi,%rdx
    d015:	48 85 c0             	test   %rax,%rax
    d018:	49 0f 49 d0          	cmovns %r8,%rdx
    d01c:	48 39 d1             	cmp    %rdx,%rcx
    d01f:	0f 87 71 03 00 00    	ja     d396 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    d025:	49 39 cf             	cmp    %rcx,%r15
    d028:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    d02d:	48 0f 47 cd          	cmova  %rbp,%rcx
    d031:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
    d036:	49 39 d4             	cmp    %rdx,%r12
    d039:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
    d03e:	48 0f 42 c8          	cmovb  %rax,%rcx
    d042:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
    d047:	48 89 e7             	mov    %rsp,%rdi
    d04a:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
    d051:	00 f0 7f 
    d054:	4c 89 e2             	mov    %r12,%rdx
    d057:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
    d05c:	4d 89 e8             	mov    %r13,%r8
    d05f:	e8 2c 29 00 00       	call   f990 <hyperinterval::ieee::Format::div>
    d064:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    d068:	0f 85 22 03 00 00    	jne    d390 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    d06e:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    d073:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
    d078:	48 89 e7             	mov    %rsp,%rdi
    d07b:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d082:	00 00 80 
    d085:	4c 89 e2             	mov    %r12,%rdx
    d088:	e8 b3 1c 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    d08d:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    d091:	0f 85 f9 02 00 00    	jne    d390 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    d097:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    d09c:	48 89 e7             	mov    %rsp,%rdi
    d09f:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d0a6:	00 00 80 
    d0a9:	4c 89 e2             	mov    %r12,%rdx
    d0ac:	4c 89 f9             	mov    %r15,%rcx
    d0af:	e8 8c 1c 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    d0b4:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    d0b8:	0f 85 d2 02 00 00    	jne    d390 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    d0be:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
    d0c3:	48 89 d8             	mov    %rbx,%rax
    d0c6:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d0cd:	00 00 80 
    d0d0:	48 09 f0             	or     %rsi,%rax
    d0d3:	48 89 da             	mov    %rbx,%rdx
    d0d6:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
    d0db:	4c 21 ca             	and    %r9,%rdx
    d0de:	48 89 f1             	mov    %rsi,%rcx
    d0e1:	48 29 d1             	sub    %rdx,%rcx
    d0e4:	48 85 db             	test   %rbx,%rbx
    d0e7:	48 0f 49 c8          	cmovns %rax,%rcx
    d0eb:	4c 89 fa             	mov    %r15,%rdx
    d0ee:	48 09 f2             	or     %rsi,%rdx
    d0f1:	4c 89 ff             	mov    %r15,%rdi
    d0f4:	4c 21 cf             	and    %r9,%rdi
    d0f7:	48 89 f0             	mov    %rsi,%rax
    d0fa:	48 29 f8             	sub    %rdi,%rax
    d0fd:	4d 85 ff             	test   %r15,%r15
    d100:	48 0f 49 c2          	cmovns %rdx,%rax
    d104:	48 39 c1             	cmp    %rax,%rcx
    d107:	0f 87 89 02 00 00    	ja     d396 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    d10d:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
    d112:	4c 89 d2             	mov    %r10,%rdx
    d115:	48 09 f2             	or     %rsi,%rdx
    d118:	4d 89 d0             	mov    %r10,%r8
    d11b:	4d 21 c8             	and    %r9,%r8
    d11e:	48 89 f7             	mov    %rsi,%rdi
    d121:	4c 29 c7             	sub    %r8,%rdi
    d124:	4d 85 d2             	test   %r10,%r10
    d127:	48 0f 49 fa          	cmovns %rdx,%rdi
    d12b:	48 39 cf             	cmp    %rcx,%rdi
    d12e:	49 0f 46 da          	cmovbe %r10,%rbx
    d132:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
    d137:	4c 89 c1             	mov    %r8,%rcx
    d13a:	48 09 f1             	or     %rsi,%rcx
    d13d:	4c 89 c2             	mov    %r8,%rdx
    d140:	4c 21 ca             	and    %r9,%rdx
    d143:	48 89 f7             	mov    %rsi,%rdi
    d146:	48 29 d7             	sub    %rdx,%rdi
    d149:	4d 85 c0             	test   %r8,%r8
    d14c:	48 0f 49 f9          	cmovns %rcx,%rdi
    d150:	48 39 c7             	cmp    %rax,%rdi
    d153:	4d 0f 43 f8          	cmovae %r8,%r15
    d157:	48 89 e7             	mov    %rsp,%rdi
    d15a:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
    d161:	00 f0 7f 
    d164:	4c 89 e2             	mov    %r12,%rdx
    d167:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
    d16c:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
    d171:	e8 1a 28 00 00       	call   f990 <hyperinterval::ieee::Format::div>
    d176:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    d17a:	0f 85 10 02 00 00    	jne    d390 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    d180:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    d185:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
    d18a:	48 89 e7             	mov    %rsp,%rdi
    d18d:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d194:	00 00 80 
    d197:	4c 89 e2             	mov    %r12,%rdx
    d19a:	e8 a1 1b 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    d19f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    d1a3:	0f 85 e7 01 00 00    	jne    d390 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    d1a9:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    d1ae:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    d1b3:	48 89 e7             	mov    %rsp,%rdi
    d1b6:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d1bd:	00 00 80 
    d1c0:	4c 89 e2             	mov    %r12,%rdx
    d1c3:	4c 89 e9             	mov    %r13,%rcx
    d1c6:	e8 75 1b 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    d1cb:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    d1cf:	0f 85 bb 01 00 00    	jne    d390 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    d1d5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    d1da:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
    d1df:	48 89 f9             	mov    %rdi,%rcx
    d1e2:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
    d1e9:	00 00 80 
    d1ec:	4c 09 c1             	or     %r8,%rcx
    d1ef:	48 89 fe             	mov    %rdi,%rsi
    d1f2:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
    d1f7:	4c 21 ce             	and    %r9,%rsi
    d1fa:	4c 89 c2             	mov    %r8,%rdx
    d1fd:	48 29 f2             	sub    %rsi,%rdx
    d200:	48 85 ff             	test   %rdi,%rdi
    d203:	48 0f 49 d1          	cmovns %rcx,%rdx
    d207:	48 89 c6             	mov    %rax,%rsi
    d20a:	4c 09 c6             	or     %r8,%rsi
    d20d:	48 89 c7             	mov    %rax,%rdi
    d210:	4c 21 cf             	and    %r9,%rdi
    d213:	4c 89 c1             	mov    %r8,%rcx
    d216:	48 29 f9             	sub    %rdi,%rcx
    d219:	48 85 c0             	test   %rax,%rax
    d21c:	48 0f 49 ce          	cmovns %rsi,%rcx
    d220:	48 39 ca             	cmp    %rcx,%rdx
    d223:	0f 87 6d 01 00 00    	ja     d396 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    d229:	48 89 de             	mov    %rbx,%rsi
    d22c:	48 bd 00 00 00 00 00 	movabs $0x8000000000000000,%rbp
    d233:	00 00 80 
    d236:	48 09 ee             	or     %rbp,%rsi
    d239:	48 89 df             	mov    %rbx,%rdi
    d23c:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
    d241:	4c 21 cf             	and    %r9,%rdi
    d244:	49 89 e8             	mov    %rbp,%r8
    d247:	49 29 f8             	sub    %rdi,%r8
    d24a:	48 85 db             	test   %rbx,%rbx
    d24d:	4c 0f 49 c6          	cmovns %rsi,%r8
    d251:	49 39 d0             	cmp    %rdx,%r8
    d254:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    d259:	48 0f 46 d3          	cmovbe %rbx,%rdx
    d25d:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
    d262:	4c 89 fa             	mov    %r15,%rdx
    d265:	48 09 ea             	or     %rbp,%rdx
    d268:	4d 21 f9             	and    %r15,%r9
    d26b:	4c 29 cd             	sub    %r9,%rbp
    d26e:	4d 85 ff             	test   %r15,%r15
    d271:	48 0f 49 ea          	cmovns %rdx,%rbp
    d275:	48 39 cd             	cmp    %rcx,%rbp
    d278:	49 0f 43 c7          	cmovae %r15,%rax
    d27c:	e9 d8 05 00 00       	jmp    d859 <hyperinterval::float::F64Enclosure::corner_image+0xa29>
    d281:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
    d288:	c3                   	ret
    d289:	48 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%rdx
    d290:	ff 0f 00 
    d293:	49 89 dd             	mov    %rbx,%r13
    d296:	49 c1 ed 34          	shr    $0x34,%r13
    d29a:	41 81 e5 ff 07 00 00 	and    $0x7ff,%r13d
    d2a1:	48 89 d8             	mov    %rbx,%rax
    d2a4:	48 21 d0             	and    %rdx,%rax
    d2a7:	4d 85 ed             	test   %r13,%r13
    d2aa:	b9 01 00 00 00       	mov    $0x1,%ecx
    d2af:	41 0f 45 cd          	cmovne %r13d,%ecx
    d2b3:	4c 8d 62 01          	lea    0x1(%rdx),%r12
    d2b7:	4d 89 e7             	mov    %r12,%r15
    d2ba:	4d 0f 44 fd          	cmove  %r13,%r15
    d2be:	49 09 c7             	or     %rax,%r15
    d2c1:	4c 89 c5             	mov    %r8,%rbp
    d2c4:	48 c1 ed 34          	shr    $0x34,%rbp
    d2c8:	81 e5 ff 07 00 00    	and    $0x7ff,%ebp
    d2ce:	4c 89 c0             	mov    %r8,%rax
    d2d1:	48 21 d0             	and    %rdx,%rax
    d2d4:	8d 95 9a f7 ff ff    	lea    -0x866(%rbp),%edx
    d2da:	48 85 ed             	test   %rbp,%rbp
    d2dd:	4c 89 64 24 30       	mov    %r12,0x30(%rsp)
    d2e2:	4c 0f 44 e5          	cmove  %rbp,%r12
    d2e6:	be 9b f7 ff ff       	mov    $0xfffff79b,%esi
    d2eb:	0f 45 f2             	cmovne %edx,%esi
    d2ee:	49 09 c4             	or     %rax,%r12
    d2f1:	48 89 df             	mov    %rbx,%rdi
    d2f4:	4c 89 44 24 38       	mov    %r8,0x38(%rsp)
    d2f9:	4c 31 c7             	xor    %r8,%rdi
    d2fc:	4c 89 f8             	mov    %r15,%rax
    d2ff:	49 f7 e4             	mul    %r12
    d302:	01 ce                	add    %ecx,%esi
    d304:	48 c1 ef 3f          	shr    $0x3f,%rdi
    d308:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
    d30d:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    d312:	48 89 04 24          	mov    %rax,(%rsp)
    d316:	89 74 24 10          	mov    %esi,0x10(%rsp)
    d31a:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    d31f:	48 89 e1             	mov    %rsp,%rcx
    d322:	4c 89 d6             	mov    %r10,%rsi
    d325:	4c 89 f2             	mov    %r14,%rdx
    d328:	e8 b3 1c 00 00       	call   efe0 <hyperinterval::ieee::Format::rounded>
    d32d:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
    d332:	74 08                	je     d33c <hyperinterval::float::F64Enclosure::corner_image+0x50c>
    d334:	44 0f b6 74 24 41    	movzbl 0x41(%rsp),%r14d
    d33a:	eb 5a                	jmp    d396 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    d33c:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    d341:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
    d346:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    d34b:	48 89 e7             	mov    %rsp,%rdi
    d34e:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d355:	00 00 80 
    d358:	4c 89 f2             	mov    %r14,%rdx
    d35b:	e8 e0 19 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    d360:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    d364:	75 2a                	jne    d390 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    d366:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    d36b:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
    d370:	48 89 e7             	mov    %rsp,%rdi
    d373:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d37a:	00 00 80 
    d37d:	4c 89 f2             	mov    %r14,%rdx
    d380:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    d385:	e8 b6 19 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    d38a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    d38e:	74 28                	je     d3b8 <hyperinterval::float::F64Enclosure::corner_image+0x588>
    d390:	44 0f b6 74 24 01    	movzbl 0x1(%rsp),%r14d
    d396:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
    d39b:	44 88 70 08          	mov    %r14b,0x8(%rax)
    d39f:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
    d3a6:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
    d3ad:	5b                   	pop    %rbx
    d3ae:	41 5c                	pop    %r12
    d3b0:	41 5d                	pop    %r13
    d3b2:	41 5e                	pop    %r14
    d3b4:	41 5f                	pop    %r15
    d3b6:	5d                   	pop    %rbp
    d3b7:	c3                   	ret
    d3b8:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
    d3bd:	48 89 f8             	mov    %rdi,%rax
    d3c0:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d3c7:	00 00 80 
    d3ca:	48 09 f0             	or     %rsi,%rax
    d3cd:	48 8d 56 ff          	lea    -0x1(%rsi),%rdx
    d3d1:	48 89 f9             	mov    %rdi,%rcx
    d3d4:	48 21 d1             	and    %rdx,%rcx
    d3d7:	49 89 f0             	mov    %rsi,%r8
    d3da:	49 29 c8             	sub    %rcx,%r8
    d3dd:	48 85 ff             	test   %rdi,%rdi
    d3e0:	4c 0f 49 c0          	cmovns %rax,%r8
    d3e4:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    d3e9:	48 89 f8             	mov    %rdi,%rax
    d3ec:	48 09 f0             	or     %rsi,%rax
    d3ef:	48 89 f9             	mov    %rdi,%rcx
    d3f2:	48 21 d1             	and    %rdx,%rcx
    d3f5:	49 89 f1             	mov    %rsi,%r9
    d3f8:	49 29 c9             	sub    %rcx,%r9
    d3fb:	48 85 ff             	test   %rdi,%rdi
    d3fe:	4c 0f 49 c8          	cmovns %rax,%r9
    d402:	41 b6 01             	mov    $0x1,%r14b
    d405:	4d 39 c8             	cmp    %r9,%r8
    d408:	77 8c                	ja     d396 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    d40a:	4c 89 8c 24 88 00 00 	mov    %r9,0x88(%rsp)
    d411:	00 
    d412:	4c 89 84 24 90 00 00 	mov    %r8,0x90(%rsp)
    d419:	00 
    d41a:	48 89 7c 24 68       	mov    %rdi,0x68(%rsp)
    d41f:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
    d424:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    d429:	48 89 c8             	mov    %rcx,%rax
    d42c:	48 c1 e8 34          	shr    $0x34,%rax
    d430:	25 ff 07 00 00       	and    $0x7ff,%eax
    d435:	48 89 ca             	mov    %rcx,%rdx
    d438:	48 bf ff ff ff ff ff 	movabs $0xfffffffffffff,%rdi
    d43f:	ff 0f 00 
    d442:	48 21 fa             	and    %rdi,%rdx
    d445:	48 85 c0             	test   %rax,%rax
    d448:	41 b8 01 00 00 00    	mov    $0x1,%r8d
    d44e:	44 0f 45 c0          	cmovne %eax,%r8d
    d452:	48 0f 45 44 24 30    	cmovne 0x30(%rsp),%rax
    d458:	48 09 d0             	or     %rdx,%rax
    d45b:	48 31 cb             	xor    %rcx,%rbx
    d45e:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
    d465:	00 
    d466:	49 f7 e7             	mul    %r15
    d469:	41 8d 8d 9a f7 ff ff 	lea    -0x866(%r13),%ecx
    d470:	4d 85 ed             	test   %r13,%r13
    d473:	bf 9b f7 ff ff       	mov    $0xfffff79b,%edi
    d478:	0f 45 f9             	cmovne %ecx,%edi
    d47b:	44 89 44 24 74       	mov    %r8d,0x74(%rsp)
    d480:	44 01 c7             	add    %r8d,%edi
    d483:	48 c1 eb 3f          	shr    $0x3f,%rbx
    d487:	88 5c 24 14          	mov    %bl,0x14(%rsp)
    d48b:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    d490:	48 89 04 24          	mov    %rax,(%rsp)
    d494:	89 7c 24 10          	mov    %edi,0x10(%rsp)
    d498:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    d49d:	48 89 e1             	mov    %rsp,%rcx
    d4a0:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
    d4a7:	00 f0 7f 
    d4aa:	4c 89 ea             	mov    %r13,%rdx
    d4ad:	e8 2e 1b 00 00       	call   efe0 <hyperinterval::ieee::Format::rounded>
    d4b2:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
    d4b7:	0f 85 77 fe ff ff    	jne    d334 <hyperinterval::float::F64Enclosure::corner_image+0x504>
    d4bd:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    d4c2:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
    d4c7:	48 89 e7             	mov    %rsp,%rdi
    d4ca:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d4d1:	00 00 80 
    d4d4:	4c 89 ea             	mov    %r13,%rdx
    d4d7:	e8 64 18 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    d4dc:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d4e0:	0f 84 aa fe ff ff    	je     d390 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    d4e6:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    d4eb:	48 89 e7             	mov    %rsp,%rdi
    d4ee:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d4f5:	00 00 80 
    d4f8:	4c 89 ea             	mov    %r13,%rdx
    d4fb:	4c 89 f9             	mov    %r15,%rcx
    d4fe:	e8 3d 18 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    d503:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d507:	0f 84 83 fe ff ff    	je     d390 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    d50d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    d512:	48 89 da             	mov    %rbx,%rdx
    d515:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d51c:	00 00 80 
    d51f:	48 09 f2             	or     %rsi,%rdx
    d522:	48 89 df             	mov    %rbx,%rdi
    d525:	4c 8b 4c 24 28       	mov    0x28(%rsp),%r9
    d52a:	4c 21 cf             	and    %r9,%rdi
    d52d:	48 89 f1             	mov    %rsi,%rcx
    d530:	48 29 f9             	sub    %rdi,%rcx
    d533:	48 85 db             	test   %rbx,%rbx
    d536:	48 0f 49 ca          	cmovns %rdx,%rcx
    d53a:	49 89 c0             	mov    %rax,%r8
    d53d:	49 09 f0             	or     %rsi,%r8
    d540:	48 89 c7             	mov    %rax,%rdi
    d543:	4c 21 cf             	and    %r9,%rdi
    d546:	48 89 f2             	mov    %rsi,%rdx
    d549:	48 29 fa             	sub    %rdi,%rdx
    d54c:	48 85 c0             	test   %rax,%rax
    d54f:	49 0f 49 d0          	cmovns %r8,%rdx
    d553:	48 39 d1             	cmp    %rdx,%rcx
    d556:	0f 87 3a fe ff ff    	ja     d396 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    d55c:	48 39 8c 24 90 00 00 	cmp    %rcx,0x90(%rsp)
    d563:	00 
    d564:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
    d569:	48 0f 47 cb          	cmova  %rbx,%rcx
    d56d:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
    d572:	48 39 94 24 88 00 00 	cmp    %rdx,0x88(%rsp)
    d579:	00 
    d57a:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
    d57f:	48 0f 42 c8          	cmovb  %rax,%rcx
    d583:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
    d588:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
    d58d:	48 89 d0             	mov    %rdx,%rax
    d590:	48 c1 e8 34          	shr    $0x34,%rax
    d594:	25 ff 07 00 00       	and    $0x7ff,%eax
    d599:	48 bf ff ff ff ff ff 	movabs $0xfffffffffffff,%rdi
    d5a0:	ff 0f 00 
    d5a3:	48 21 d7             	and    %rdx,%rdi
    d5a6:	8d 88 9a f7 ff ff    	lea    -0x866(%rax),%ecx
    d5ac:	48 85 c0             	test   %rax,%rax
    d5af:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
    d5b4:	4c 0f 44 c0          	cmove  %rax,%r8
    d5b8:	41 bd 9b f7 ff ff    	mov    $0xfffff79b,%r13d
    d5be:	44 0f 45 e9          	cmovne %ecx,%r13d
    d5c2:	49 09 f8             	or     %rdi,%r8
    d5c5:	48 85 ed             	test   %rbp,%rbp
    d5c8:	b9 01 00 00 00       	mov    $0x1,%ecx
    d5cd:	0f 45 cd             	cmovne %ebp,%ecx
    d5d0:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
    d5d5:	48 31 d7             	xor    %rdx,%rdi
    d5d8:	4c 89 e0             	mov    %r12,%rax
    d5db:	4c 89 c5             	mov    %r8,%rbp
    d5de:	49 f7 e0             	mul    %r8
    d5e1:	44 01 e9             	add    %r13d,%ecx
    d5e4:	48 c1 ef 3f          	shr    $0x3f,%rdi
    d5e8:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
    d5ed:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    d5f2:	48 89 04 24          	mov    %rax,(%rsp)
    d5f6:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
    d5fa:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    d5ff:	48 89 e1             	mov    %rsp,%rcx
    d602:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
    d609:	00 f0 7f 
    d60c:	4c 89 e2             	mov    %r12,%rdx
    d60f:	e8 cc 19 00 00       	call   efe0 <hyperinterval::ieee::Format::rounded>
    d614:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
    d619:	0f 85 15 fd ff ff    	jne    d334 <hyperinterval::float::F64Enclosure::corner_image+0x504>
    d61f:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    d624:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
    d629:	48 89 e7             	mov    %rsp,%rdi
    d62c:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d633:	00 00 80 
    d636:	4c 89 e2             	mov    %r12,%rdx
    d639:	e8 02 17 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    d63e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    d642:	0f 85 48 fd ff ff    	jne    d390 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    d648:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    d64d:	48 89 e7             	mov    %rsp,%rdi
    d650:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d657:	00 00 80 
    d65a:	4c 89 e2             	mov    %r12,%rdx
    d65d:	4c 89 f9             	mov    %r15,%rcx
    d660:	e8 db 16 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    d665:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    d669:	0f 85 21 fd ff ff    	jne    d390 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    d66f:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    d674:	48 89 d8             	mov    %rbx,%rax
    d677:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d67e:	00 00 80 
    d681:	48 09 f0             	or     %rsi,%rax
    d684:	48 89 da             	mov    %rbx,%rdx
    d687:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
    d68c:	4c 21 c2             	and    %r8,%rdx
    d68f:	48 89 f1             	mov    %rsi,%rcx
    d692:	48 29 d1             	sub    %rdx,%rcx
    d695:	48 85 db             	test   %rbx,%rbx
    d698:	48 0f 49 c8          	cmovns %rax,%rcx
    d69c:	4c 89 e2             	mov    %r12,%rdx
    d69f:	48 09 f2             	or     %rsi,%rdx
    d6a2:	4c 89 e7             	mov    %r12,%rdi
    d6a5:	4c 21 c7             	and    %r8,%rdi
    d6a8:	48 89 f0             	mov    %rsi,%rax
    d6ab:	48 29 f8             	sub    %rdi,%rax
    d6ae:	4d 85 e4             	test   %r12,%r12
    d6b1:	48 0f 49 c2          	cmovns %rdx,%rax
    d6b5:	48 39 c1             	cmp    %rax,%rcx
    d6b8:	0f 87 d8 fc ff ff    	ja     d396 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    d6be:	4c 8b 4c 24 58       	mov    0x58(%rsp),%r9
    d6c3:	4c 89 ca             	mov    %r9,%rdx
    d6c6:	4c 21 c2             	and    %r8,%rdx
    d6c9:	48 89 f7             	mov    %rsi,%rdi
    d6cc:	48 29 d7             	sub    %rdx,%rdi
    d6cf:	4c 89 ca             	mov    %r9,%rdx
    d6d2:	48 09 f2             	or     %rsi,%rdx
    d6d5:	4d 85 c9             	test   %r9,%r9
    d6d8:	48 0f 49 fa          	cmovns %rdx,%rdi
    d6dc:	48 39 cf             	cmp    %rcx,%rdi
    d6df:	49 0f 46 d9          	cmovbe %r9,%rbx
    d6e3:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
    d6e8:	48 89 f9             	mov    %rdi,%rcx
    d6eb:	4c 21 c1             	and    %r8,%rcx
    d6ee:	48 89 f2             	mov    %rsi,%rdx
    d6f1:	48 29 ca             	sub    %rcx,%rdx
    d6f4:	48 89 f9             	mov    %rdi,%rcx
    d6f7:	48 09 f1             	or     %rsi,%rcx
    d6fa:	48 85 ff             	test   %rdi,%rdi
    d6fd:	48 0f 49 d1          	cmovns %rcx,%rdx
    d701:	48 39 c2             	cmp    %rax,%rdx
    d704:	4c 0f 43 e7          	cmovae %rdi,%r12
    d708:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
    d70d:	48 33 44 24 60       	xor    0x60(%rsp),%rax
    d712:	44 03 6c 24 74       	add    0x74(%rsp),%r13d
    d717:	48 c1 e8 3f          	shr    $0x3f,%rax
    d71b:	88 44 24 14          	mov    %al,0x14(%rsp)
    d71f:	48 8b 84 24 80 00 00 	mov    0x80(%rsp),%rax
    d726:	00 
    d727:	48 f7 e5             	mul    %rbp
    d72a:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    d72f:	48 89 04 24          	mov    %rax,(%rsp)
    d733:	44 89 6c 24 10       	mov    %r13d,0x10(%rsp)
    d738:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    d73d:	48 89 e1             	mov    %rsp,%rcx
    d740:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
    d747:	00 f0 7f 
    d74a:	4c 89 ea             	mov    %r13,%rdx
    d74d:	e8 8e 18 00 00       	call   efe0 <hyperinterval::ieee::Format::rounded>
    d752:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
    d757:	0f 85 d7 fb ff ff    	jne    d334 <hyperinterval::float::F64Enclosure::corner_image+0x504>
    d75d:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    d762:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
    d767:	48 89 e7             	mov    %rsp,%rdi
    d76a:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d771:	00 00 80 
    d774:	4c 89 ea             	mov    %r13,%rdx
    d777:	e8 c4 15 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    d77c:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    d780:	0f 85 0a fc ff ff    	jne    d390 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    d786:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    d78b:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    d790:	48 89 e7             	mov    %rsp,%rdi
    d793:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    d79a:	00 00 80 
    d79d:	4c 89 ea             	mov    %r13,%rdx
    d7a0:	4c 89 f9             	mov    %r15,%rcx
    d7a3:	e8 98 15 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    d7a8:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    d7ac:	0f 85 de fb ff ff    	jne    d390 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    d7b2:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    d7b7:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
    d7bc:	48 89 f9             	mov    %rdi,%rcx
    d7bf:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
    d7c6:	00 00 80 
    d7c9:	4c 09 c1             	or     %r8,%rcx
    d7cc:	48 89 fe             	mov    %rdi,%rsi
    d7cf:	4c 8b 4c 24 28       	mov    0x28(%rsp),%r9
    d7d4:	4c 21 ce             	and    %r9,%rsi
    d7d7:	4c 89 c2             	mov    %r8,%rdx
    d7da:	48 29 f2             	sub    %rsi,%rdx
    d7dd:	48 85 ff             	test   %rdi,%rdi
    d7e0:	48 0f 49 d1          	cmovns %rcx,%rdx
    d7e4:	48 89 c6             	mov    %rax,%rsi
    d7e7:	4c 09 c6             	or     %r8,%rsi
    d7ea:	48 89 c7             	mov    %rax,%rdi
    d7ed:	4c 21 cf             	and    %r9,%rdi
    d7f0:	4c 89 c1             	mov    %r8,%rcx
    d7f3:	48 29 f9             	sub    %rdi,%rcx
    d7f6:	48 85 c0             	test   %rax,%rax
    d7f9:	48 0f 49 ce          	cmovns %rsi,%rcx
    d7fd:	48 39 ca             	cmp    %rcx,%rdx
    d800:	0f 87 90 fb ff ff    	ja     d396 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    d806:	48 89 de             	mov    %rbx,%rsi
    d809:	49 b9 00 00 00 00 00 	movabs $0x8000000000000000,%r9
    d810:	00 00 80 
    d813:	4c 09 ce             	or     %r9,%rsi
    d816:	48 89 df             	mov    %rbx,%rdi
    d819:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
    d81e:	4c 21 d7             	and    %r10,%rdi
    d821:	4d 89 c8             	mov    %r9,%r8
    d824:	49 29 f8             	sub    %rdi,%r8
    d827:	48 85 db             	test   %rbx,%rbx
    d82a:	4c 0f 49 c6          	cmovns %rsi,%r8
    d82e:	49 39 d0             	cmp    %rdx,%r8
    d831:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    d836:	48 0f 46 d3          	cmovbe %rbx,%rdx
    d83a:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
    d83f:	4c 89 e2             	mov    %r12,%rdx
    d842:	4c 09 ca             	or     %r9,%rdx
    d845:	4d 21 e2             	and    %r12,%r10
    d848:	4d 29 d1             	sub    %r10,%r9
    d84b:	4d 85 e4             	test   %r12,%r12
    d84e:	4c 0f 49 ca          	cmovns %rdx,%r9
    d852:	49 39 c9             	cmp    %rcx,%r9
    d855:	49 0f 43 c4          	cmovae %r12,%rax
    d859:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
    d85e:	48 c7 01 01 00 00 00 	movq   $0x1,(%rcx)
    d865:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    d86a:	48 89 51 08          	mov    %rdx,0x8(%rcx)
    d86e:	48 89 41 10          	mov    %rax,0x10(%rcx)
    d872:	e9 2f fb ff ff       	jmp    d3a6 <hyperinterval::float::F64Enclosure::corner_image+0x576>
    d877:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    d87e:	00 00 

hyperinterval::float::F64Enclosure::div:
    d880:	53                   	push   %rbx
    d881:	48 89 fb             	mov    %rdi,%rbx
    d884:	f6 02 01             	testb  $0x1,(%rdx)
    d887:	74 56                	je     d8df <hyperinterval::float::F64Enclosure::div+0x5f>
    d889:	48 b8 ff ff ff ff ff 	movabs $0x7fffffffffffffff,%rax
    d890:	ff ff 7f 
    d893:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
    d897:	48 8d 78 01          	lea    0x1(%rax),%rdi
    d89b:	4c 8d 04 01          	lea    (%rcx,%rax,1),%r8
    d89f:	49 ff c0             	inc    %r8
    d8a2:	49 89 c9             	mov    %rcx,%r9
    d8a5:	49 21 c1             	and    %rax,%r9
    d8a8:	49 f7 d9             	neg    %r9
    d8ab:	49 01 c1             	add    %rax,%r9
    d8ae:	49 ff c1             	inc    %r9
    d8b1:	48 85 c9             	test   %rcx,%rcx
    d8b4:	4d 0f 49 c8          	cmovns %r8,%r9
    d8b8:	49 39 f9             	cmp    %rdi,%r9
    d8bb:	77 22                	ja     d8df <hyperinterval::float::F64Enclosure::div+0x5f>
    d8bd:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
    d8c1:	48 89 cf             	mov    %rcx,%rdi
    d8c4:	48 21 c7             	and    %rax,%rdi
    d8c7:	48 01 c7             	add    %rax,%rdi
    d8ca:	48 85 f9             	test   %rdi,%rcx
    d8cd:	78 10                	js     d8df <hyperinterval::float::F64Enclosure::div+0x5f>
    d8cf:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
    d8d3:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    d8da:	48 89 d8             	mov    %rbx,%rax
    d8dd:	5b                   	pop    %rbx
    d8de:	c3                   	ret
    d8df:	48 89 df             	mov    %rbx,%rdi
    d8e2:	b9 01 00 00 00       	mov    $0x1,%ecx
    d8e7:	e8 44 f5 ff ff       	call   ce30 <hyperinterval::float::F64Enclosure::corner_image>
    d8ec:	48 89 d8             	mov    %rbx,%rax
    d8ef:	5b                   	pop    %rbx
    d8f0:	c3                   	ret
    d8f1:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    d8f8:	00 00 00 
    d8fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

hyperinterval::float::F64Enclosure::reciprocal:
    d900:	55                   	push   %rbp
    d901:	41 57                	push   %r15
    d903:	41 56                	push   %r14
    d905:	41 55                	push   %r13
    d907:	41 54                	push   %r12
    d909:	53                   	push   %rbx
    d90a:	48 83 ec 28          	sub    $0x28,%rsp
    d90e:	48 89 fb             	mov    %rdi,%rbx
    d911:	48 83 3e 00          	cmpq   $0x0,(%rsi)
    d915:	74 65                	je     d97c <hyperinterval::float::F64Enclosure::reciprocal+0x7c>
    d917:	49 89 f6             	mov    %rsi,%r14
    d91a:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
    d921:	00 00 80 
    d924:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
    d92b:	00 f0 7f 
    d92e:	49 bd 00 00 00 00 00 	movabs $0x3ff0000000000000,%r13
    d935:	00 f0 3f 
    d938:	48 89 e7             	mov    %rsp,%rdi
    d93b:	4c 89 fe             	mov    %r15,%rsi
    d93e:	4c 89 e2             	mov    %r12,%rdx
    d941:	4c 89 e9             	mov    %r13,%rcx
    d944:	e8 f7 13 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    d949:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d94d:	74 1c                	je     d96b <hyperinterval::float::F64Enclosure::reciprocal+0x6b>
    d94f:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    d954:	48 89 e7             	mov    %rsp,%rdi
    d957:	4c 89 fe             	mov    %r15,%rsi
    d95a:	4c 89 e2             	mov    %r12,%rdx
    d95d:	4c 89 e9             	mov    %r13,%rcx
    d960:	e8 db 13 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    d965:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d969:	75 2a                	jne    d995 <hyperinterval::float::F64Enclosure::reciprocal+0x95>
    d96b:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
    d970:	88 53 08             	mov    %dl,0x8(%rbx)
    d973:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    d97a:	eb 07                	jmp    d983 <hyperinterval::float::F64Enclosure::reciprocal+0x83>
    d97c:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    d983:	48 89 d8             	mov    %rbx,%rax
    d986:	48 83 c4 28          	add    $0x28,%rsp
    d98a:	5b                   	pop    %rbx
    d98b:	41 5c                	pop    %r12
    d98d:	41 5d                	pop    %r13
    d98f:	41 5e                	pop    %r14
    d991:	41 5f                	pop    %r15
    d993:	5d                   	pop    %rbp
    d994:	c3                   	ret
    d995:	48 89 e9             	mov    %rbp,%rcx
    d998:	4c 09 f9             	or     %r15,%rcx
    d99b:	49 8d 47 ff          	lea    -0x1(%r15),%rax
    d99f:	48 89 ea             	mov    %rbp,%rdx
    d9a2:	48 21 c2             	and    %rax,%rdx
    d9a5:	4c 89 fe             	mov    %r15,%rsi
    d9a8:	48 29 d6             	sub    %rdx,%rsi
    d9ab:	48 85 ed             	test   %rbp,%rbp
    d9ae:	48 0f 49 f1          	cmovns %rcx,%rsi
    d9b2:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    d9b7:	48 89 ca             	mov    %rcx,%rdx
    d9ba:	4c 09 fa             	or     %r15,%rdx
    d9bd:	48 89 cf             	mov    %rcx,%rdi
    d9c0:	48 21 c7             	and    %rax,%rdi
    d9c3:	4d 89 f8             	mov    %r15,%r8
    d9c6:	49 29 f8             	sub    %rdi,%r8
    d9c9:	48 85 c9             	test   %rcx,%rcx
    d9cc:	4c 0f 49 c2          	cmovns %rdx,%r8
    d9d0:	b2 01                	mov    $0x1,%dl
    d9d2:	4c 39 c6             	cmp    %r8,%rsi
    d9d5:	77 99                	ja     d970 <hyperinterval::float::F64Enclosure::reciprocal+0x70>
    d9d7:	48 89 ea             	mov    %rbp,%rdx
    d9da:	48 c1 ea 08          	shr    $0x8,%rdx
    d9de:	48 c7 44 24 10 01 00 	movq   $0x1,0x10(%rsp)
    d9e5:	00 00 
    d9e7:	40 88 6c 24 18       	mov    %bpl,0x18(%rsp)
    d9ec:	48 89 ee             	mov    %rbp,%rsi
    d9ef:	48 c1 ee 38          	shr    $0x38,%rsi
    d9f3:	40 88 74 24 1f       	mov    %sil,0x1f(%rsp)
    d9f8:	48 c1 ed 28          	shr    $0x28,%rbp
    d9fc:	66 89 6c 24 1d       	mov    %bp,0x1d(%rsp)
    da01:	89 54 24 19          	mov    %edx,0x19(%rsp)
    da05:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
    da0a:	49 8b 4e 08          	mov    0x8(%r14),%rcx
    da0e:	48 89 ca             	mov    %rcx,%rdx
    da11:	4c 09 fa             	or     %r15,%rdx
    da14:	48 89 ce             	mov    %rcx,%rsi
    da17:	48 21 c6             	and    %rax,%rsi
    da1a:	4c 89 ff             	mov    %r15,%rdi
    da1d:	48 29 f7             	sub    %rsi,%rdi
    da20:	48 85 c9             	test   %rcx,%rcx
    da23:	48 0f 49 fa          	cmovns %rdx,%rdi
    da27:	4c 39 ff             	cmp    %r15,%rdi
    da2a:	77 1b                	ja     da47 <hyperinterval::float::F64Enclosure::reciprocal+0x147>
    da2c:	49 8b 4e 10          	mov    0x10(%r14),%rcx
    da30:	48 21 c8             	and    %rcx,%rax
    da33:	4c 01 f8             	add    %r15,%rax
    da36:	48 ff c8             	dec    %rax
    da39:	48 85 c1             	test   %rax,%rcx
    da3c:	78 09                	js     da47 <hyperinterval::float::F64Enclosure::reciprocal+0x147>
    da3e:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
    da42:	e9 2c ff ff ff       	jmp    d973 <hyperinterval::float::F64Enclosure::reciprocal+0x73>
    da47:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
    da4c:	48 89 df             	mov    %rbx,%rdi
    da4f:	4c 89 f2             	mov    %r14,%rdx
    da52:	b9 01 00 00 00       	mov    $0x1,%ecx
    da57:	e8 d4 f3 ff ff       	call   ce30 <hyperinterval::float::F64Enclosure::corner_image>
    da5c:	e9 22 ff ff ff       	jmp    d983 <hyperinterval::float::F64Enclosure::reciprocal+0x83>
    da61:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    da68:	00 00 00 
    da6b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

hyperinterval::float::F64Enclosure::sqrt:
    da70:	48 89 f8             	mov    %rdi,%rax
    da73:	f6 06 01             	testb  $0x1,(%rsi)
    da76:	74 43                	je     dabb <hyperinterval::float::F64Enclosure::sqrt+0x4b>
    da78:	55                   	push   %rbp
    da79:	41 57                	push   %r15
    da7b:	41 56                	push   %r14
    da7d:	41 55                	push   %r13
    da7f:	41 54                	push   %r12
    da81:	53                   	push   %rbx
    da82:	48 83 ec 28          	sub    $0x28,%rsp
    da86:	4c 8b 76 08          	mov    0x8(%rsi),%r14
    da8a:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
    da8e:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
    da95:	00 00 80 
    da98:	48 8d 6b ff          	lea    -0x1(%rbx),%rbp
    da9c:	4d 85 ff             	test   %r15,%r15
    da9f:	79 26                	jns    dac7 <hyperinterval::float::F64Enclosure::sqrt+0x57>
    daa1:	4c 89 f9             	mov    %r15,%rcx
    daa4:	48 21 e9             	and    %rbp,%rcx
    daa7:	48 01 d9             	add    %rbx,%rcx
    daaa:	48 ff c9             	dec    %rcx
    daad:	48 85 c9             	test   %rcx,%rcx
    dab0:	79 15                	jns    dac7 <hyperinterval::float::F64Enclosure::sqrt+0x57>
    dab2:	c6 40 08 05          	movb   $0x5,0x8(%rax)
    dab6:	e9 da 00 00 00       	jmp    db95 <hyperinterval::float::F64Enclosure::sqrt+0x125>
    dabb:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
    dac2:	c6 40 18 00          	movb   $0x0,0x18(%rax)
    dac6:	c3                   	ret
    dac7:	48 89 04 24          	mov    %rax,(%rsp)
    dacb:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
    dad2:	00 f0 7f 
    dad5:	4c 89 f0             	mov    %r14,%rax
    dad8:	48 21 e8             	and    %rbp,%rax
    dadb:	4c 8d 2c 18          	lea    (%rax,%rbx,1),%r13
    dadf:	49 ff cd             	dec    %r13
    dae2:	31 c9                	xor    %ecx,%ecx
    dae4:	4d 21 f5             	and    %r14,%r13
    dae7:	49 0f 49 ce          	cmovns %r14,%rcx
    daeb:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    daf0:	48 89 de             	mov    %rbx,%rsi
    daf3:	49 89 d4             	mov    %rdx,%r12
    daf6:	e8 85 12 00 00       	call   ed80 <hyperinterval::ieee::Format::sqrt>
    dafb:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
    db00:	74 11                	je     db13 <hyperinterval::float::F64Enclosure::sqrt+0xa3>
    db02:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
    db07:	48 8b 04 24          	mov    (%rsp),%rax
    db0b:	88 48 08             	mov    %cl,0x8(%rax)
    db0e:	e9 82 00 00 00       	jmp    db95 <hyperinterval::float::F64Enclosure::sqrt+0x125>
    db13:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    db18:	4d 39 fe             	cmp    %r15,%r14
    db1b:	75 0a                	jne    db27 <hyperinterval::float::F64Enclosure::sqrt+0xb7>
    db1d:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
    db22:	4d 89 e6             	mov    %r12,%r14
    db25:	eb 2c                	jmp    db53 <hyperinterval::float::F64Enclosure::sqrt+0xe3>
    db27:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
    db2c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    db31:	48 89 de             	mov    %rbx,%rsi
    db34:	4d 89 e6             	mov    %r12,%r14
    db37:	4c 89 e2             	mov    %r12,%rdx
    db3a:	4c 89 f9             	mov    %r15,%rcx
    db3d:	e8 3e 12 00 00       	call   ed80 <hyperinterval::ieee::Format::sqrt>
    db42:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    db47:	74 b9                	je     db02 <hyperinterval::float::F64Enclosure::sqrt+0x92>
    db49:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
    db4e:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    db53:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    db58:	48 89 de             	mov    %rbx,%rsi
    db5b:	4c 89 f2             	mov    %r14,%rdx
    db5e:	e8 dd 11 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    db63:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    db68:	74 1f                	je     db89 <hyperinterval::float::F64Enclosure::sqrt+0x119>
    db6a:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    db6f:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    db74:	48 89 de             	mov    %rbx,%rsi
    db77:	4c 89 f2             	mov    %r14,%rdx
    db7a:	4c 89 f9             	mov    %r15,%rcx
    db7d:	e8 be 11 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    db82:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    db87:	75 22                	jne    dbab <hyperinterval::float::F64Enclosure::sqrt+0x13b>
    db89:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
    db8e:	48 8b 04 24          	mov    (%rsp),%rax
    db92:	88 50 08             	mov    %dl,0x8(%rax)
    db95:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
    db9c:	48 83 c4 28          	add    $0x28,%rsp
    dba0:	5b                   	pop    %rbx
    dba1:	41 5c                	pop    %r12
    dba3:	41 5d                	pop    %r13
    dba5:	41 5e                	pop    %r14
    dba7:	41 5f                	pop    %r15
    dba9:	5d                   	pop    %rbp
    dbaa:	c3                   	ret
    dbab:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    dbb0:	4c 89 e0             	mov    %r12,%rax
    dbb3:	48 09 d8             	or     %rbx,%rax
    dbb6:	4c 89 e2             	mov    %r12,%rdx
    dbb9:	48 21 ea             	and    %rbp,%rdx
    dbbc:	48 89 de             	mov    %rbx,%rsi
    dbbf:	48 29 d6             	sub    %rdx,%rsi
    dbc2:	4d 85 e4             	test   %r12,%r12
    dbc5:	48 0f 49 f0          	cmovns %rax,%rsi
    dbc9:	48 89 c8             	mov    %rcx,%rax
    dbcc:	48 09 d8             	or     %rbx,%rax
    dbcf:	48 21 cd             	and    %rcx,%rbp
    dbd2:	48 29 eb             	sub    %rbp,%rbx
    dbd5:	48 85 c9             	test   %rcx,%rcx
    dbd8:	48 0f 49 d8          	cmovns %rax,%rbx
    dbdc:	b2 01                	mov    $0x1,%dl
    dbde:	48 39 de             	cmp    %rbx,%rsi
    dbe1:	48 8b 04 24          	mov    (%rsp),%rax
    dbe5:	77 ab                	ja     db92 <hyperinterval::float::F64Enclosure::sqrt+0x122>
    dbe7:	49 c1 ed 3f          	shr    $0x3f,%r13
    dbeb:	4c 89 e2             	mov    %r12,%rdx
    dbee:	48 c1 ea 08          	shr    $0x8,%rdx
    dbf2:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
    dbf9:	44 88 60 08          	mov    %r12b,0x8(%rax)
    dbfd:	4c 89 e6             	mov    %r12,%rsi
    dc00:	48 c1 ee 38          	shr    $0x38,%rsi
    dc04:	40 88 70 0f          	mov    %sil,0xf(%rax)
    dc08:	49 c1 ec 28          	shr    $0x28,%r12
    dc0c:	66 44 89 60 0d       	mov    %r12w,0xd(%rax)
    dc11:	89 50 09             	mov    %edx,0x9(%rax)
    dc14:	48 89 48 10          	mov    %rcx,0x10(%rax)
    dc18:	44 88 68 18          	mov    %r13b,0x18(%rax)
    dc1c:	e9 7b ff ff ff       	jmp    db9c <hyperinterval::float::F64Enclosure::sqrt+0x12c>
    dc21:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    dc28:	00 00 00 
    dc2b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

hyperinterval::float::F64Enclosure::square:
    dc30:	55                   	push   %rbp
    dc31:	41 57                	push   %r15
    dc33:	41 56                	push   %r14
    dc35:	41 55                	push   %r13
    dc37:	41 54                	push   %r12
    dc39:	53                   	push   %rbx
    dc3a:	48 83 ec 58          	sub    $0x58,%rsp
    dc3e:	48 89 fb             	mov    %rdi,%rbx
    dc41:	f6 06 01             	testb  $0x1,(%rsi)
    dc44:	0f 84 08 01 00 00    	je     dd52 <hyperinterval::float::F64Enclosure::square+0x122>
    dc4a:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
    dc4e:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
    dc55:	00 00 80 
    dc58:	49 b8 00 00 00 00 00 	movabs $0x7ff0000000000000,%r8
    dc5f:	00 f0 7f 
    dc62:	49 be ff ff ff ff ff 	movabs $0xfffffffffffff,%r14
    dc69:	ff 0f 00 
    dc6c:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
    dc70:	48 89 c8             	mov    %rcx,%rax
    dc73:	48 c1 e8 34          	shr    $0x34,%rax
    dc77:	25 ff 07 00 00       	and    $0x7ff,%eax
    dc7c:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
    dc81:	4c 21 f1             	and    %r14,%rcx
    dc84:	49 8d 6e 01          	lea    0x1(%r14),%rbp
    dc88:	48 85 c0             	test   %rax,%rax
    dc8b:	8d b4 00 9a f7 ff ff 	lea    -0x866(%rax,%rax,1),%esi
    dc92:	48 0f 45 c5          	cmovne %rbp,%rax
    dc96:	41 bd 9c f7 ff ff    	mov    $0xfffff79c,%r13d
    dc9c:	41 0f 44 f5          	cmove  %r13d,%esi
    dca0:	48 09 c8             	or     %rcx,%rax
    dca3:	48 f7 e0             	mul    %rax
    dca6:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
    dcab:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    dcb0:	48 89 04 24          	mov    %rax,(%rsp)
    dcb4:	89 74 24 10          	mov    %esi,0x10(%rsp)
    dcb8:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
    dcbd:	48 89 e1             	mov    %rsp,%rcx
    dcc0:	4c 89 e6             	mov    %r12,%rsi
    dcc3:	4c 89 c2             	mov    %r8,%rdx
    dcc6:	e8 15 13 00 00       	call   efe0 <hyperinterval::ieee::Format::rounded>
    dccb:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
    dcd0:	75 79                	jne    dd4b <hyperinterval::float::F64Enclosure::square+0x11b>
    dcd2:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
    dcd7:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    dcdc:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
    dce1:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    dce6:	4c 89 f8             	mov    %r15,%rax
    dce9:	48 c1 e8 34          	shr    $0x34,%rax
    dced:	25 ff 07 00 00       	and    $0x7ff,%eax
    dcf2:	4c 89 7c 24 48       	mov    %r15,0x48(%rsp)
    dcf7:	4d 21 fe             	and    %r15,%r14
    dcfa:	48 85 c0             	test   %rax,%rax
    dcfd:	48 0f 44 e8          	cmove  %rax,%rbp
    dd01:	8d 8c 00 9a f7 ff ff 	lea    -0x866(%rax,%rax,1),%ecx
    dd08:	41 0f 44 cd          	cmove  %r13d,%ecx
    dd0c:	4c 09 f5             	or     %r14,%rbp
    dd0f:	48 89 e8             	mov    %rbp,%rax
    dd12:	48 f7 e5             	mul    %rbp
    dd15:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
    dd1a:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    dd1f:	48 89 04 24          	mov    %rax,(%rsp)
    dd23:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
    dd27:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
    dd2c:	48 89 e1             	mov    %rsp,%rcx
    dd2f:	4c 89 e6             	mov    %r12,%rsi
    dd32:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
    dd39:	00 f0 7f 
    dd3c:	4c 89 fa             	mov    %r15,%rdx
    dd3f:	e8 9c 12 00 00       	call   efe0 <hyperinterval::ieee::Format::rounded>
    dd44:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
    dd49:	75 10                	jne    dd5b <hyperinterval::float::F64Enclosure::square+0x12b>
    dd4b:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
    dd50:	eb 4f                	jmp    dda1 <hyperinterval::float::F64Enclosure::square+0x171>
    dd52:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    dd59:	eb 50                	jmp    ddab <hyperinterval::float::F64Enclosure::square+0x17b>
    dd5b:	48 8b 6c 24 38       	mov    0x38(%rsp),%rbp
    dd60:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
    dd65:	48 89 e7             	mov    %rsp,%rdi
    dd68:	4c 89 e6             	mov    %r12,%rsi
    dd6b:	4c 89 fa             	mov    %r15,%rdx
    dd6e:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    dd73:	e8 c8 0f 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    dd78:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    dd7c:	74 1e                	je     dd9c <hyperinterval::float::F64Enclosure::square+0x16c>
    dd7e:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    dd83:	48 89 e7             	mov    %rsp,%rdi
    dd86:	4c 89 e6             	mov    %r12,%rsi
    dd89:	4c 89 fa             	mov    %r15,%rdx
    dd8c:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    dd91:	e8 aa 0f 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    dd96:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    dd9a:	75 21                	jne    ddbd <hyperinterval::float::F64Enclosure::square+0x18d>
    dd9c:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    dda1:	88 43 08             	mov    %al,0x8(%rbx)
    dda4:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    ddab:	48 89 d8             	mov    %rbx,%rax
    ddae:	48 83 c4 58          	add    $0x58,%rsp
    ddb2:	5b                   	pop    %rbx
    ddb3:	41 5c                	pop    %r12
    ddb5:	41 5d                	pop    %r13
    ddb7:	41 5e                	pop    %r14
    ddb9:	41 5f                	pop    %r15
    ddbb:	5d                   	pop    %rbp
    ddbc:	c3                   	ret
    ddbd:	4c 89 74 24 28       	mov    %r14,0x28(%rsp)
    ddc2:	4c 89 e8             	mov    %r13,%rax
    ddc5:	4c 09 e0             	or     %r12,%rax
    ddc8:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
    ddcd:	4c 89 e9             	mov    %r13,%rcx
    ddd0:	4c 21 f1             	and    %r14,%rcx
    ddd3:	4c 89 e2             	mov    %r12,%rdx
    ddd6:	48 29 ca             	sub    %rcx,%rdx
    ddd9:	4d 85 ed             	test   %r13,%r13
    dddc:	48 0f 49 d0          	cmovns %rax,%rdx
    dde0:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    dde5:	48 89 f8             	mov    %rdi,%rax
    dde8:	4c 09 e0             	or     %r12,%rax
    ddeb:	48 89 f9             	mov    %rdi,%rcx
    ddee:	4c 21 f1             	and    %r14,%rcx
    ddf1:	4c 89 e6             	mov    %r12,%rsi
    ddf4:	48 29 ce             	sub    %rcx,%rsi
    ddf7:	48 85 ff             	test   %rdi,%rdi
    ddfa:	48 0f 49 f0          	cmovns %rax,%rsi
    ddfe:	b0 01                	mov    $0x1,%al
    de00:	48 39 f2             	cmp    %rsi,%rdx
    de03:	77 9c                	ja     dda1 <hyperinterval::float::F64Enclosure::square+0x171>
    de05:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
    de0a:	48 89 e7             	mov    %rsp,%rdi
    de0d:	4c 89 e6             	mov    %r12,%rsi
    de10:	4c 89 fa             	mov    %r15,%rdx
    de13:	48 89 e9             	mov    %rbp,%rcx
    de16:	e8 25 0f 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    de1b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    de1f:	0f 84 77 ff ff ff    	je     dd9c <hyperinterval::float::F64Enclosure::square+0x16c>
    de25:	4c 89 ed             	mov    %r13,%rbp
    de28:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    de2d:	48 89 e7             	mov    %rsp,%rdi
    de30:	4c 89 e6             	mov    %r12,%rsi
    de33:	4c 89 fa             	mov    %r15,%rdx
    de36:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    de3b:	e8 00 0f 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    de40:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    de44:	0f 84 52 ff ff ff    	je     dd9c <hyperinterval::float::F64Enclosure::square+0x16c>
    de4a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    de4f:	4c 89 e8             	mov    %r13,%rax
    de52:	4c 09 e0             	or     %r12,%rax
    de55:	4c 89 ea             	mov    %r13,%rdx
    de58:	4c 21 f2             	and    %r14,%rdx
    de5b:	4c 89 e6             	mov    %r12,%rsi
    de5e:	48 29 d6             	sub    %rdx,%rsi
    de61:	4d 85 ed             	test   %r13,%r13
    de64:	48 0f 49 f0          	cmovns %rax,%rsi
    de68:	48 89 c8             	mov    %rcx,%rax
    de6b:	4c 09 e0             	or     %r12,%rax
    de6e:	49 21 ce             	and    %rcx,%r14
    de71:	4d 29 f4             	sub    %r14,%r12
    de74:	48 85 c9             	test   %rcx,%rcx
    de77:	4c 0f 49 e0          	cmovns %rax,%r12
    de7b:	b0 01                	mov    $0x1,%al
    de7d:	4c 39 e6             	cmp    %r12,%rsi
    de80:	0f 87 1b ff ff ff    	ja     dda1 <hyperinterval::float::F64Enclosure::square+0x171>
    de86:	48 89 ef             	mov    %rbp,%rdi
    de89:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    de8e:	4c 89 ea             	mov    %r13,%rdx
    de91:	e8 da 07 00 00       	call   e670 <hyperinterval::bounds::Bounds<T>::hull>
    de96:	49 89 c5             	mov    %rax,%r13
    de99:	49 89 d4             	mov    %rdx,%r12
    de9c:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
    dea1:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
    dea6:	31 d2                	xor    %edx,%edx
    dea8:	e8 73 09 00 00       	call   e820 <hyperinterval::bounds::Bounds<T>::signs>
    dead:	a8 02                	test   $0x2,%al
    deaf:	75 14                	jne    dec5 <hyperinterval::float::F64Enclosure::square+0x295>
    deb1:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
    deb8:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
    debc:	4c 89 63 10          	mov    %r12,0x10(%rbx)
    dec0:	e9 e6 fe ff ff       	jmp    ddab <hyperinterval::float::F64Enclosure::square+0x17b>
    dec5:	48 89 e7             	mov    %rsp,%rdi
    dec8:	31 f6                	xor    %esi,%esi
    deca:	31 d2                	xor    %edx,%edx
    decc:	e8 6f e5 ff ff       	call   c440 <hyperinterval::float::F64Enclosure::from_bits>
    ded1:	48 8b 0c 24          	mov    (%rsp),%rcx
    ded5:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
    deda:	48 83 f9 02          	cmp    $0x2,%rcx
    dede:	0f 84 bd fe ff ff    	je     dda1 <hyperinterval::float::F64Enclosure::square+0x171>
    dee4:	f6 c1 01             	test   $0x1,%cl
    dee7:	74 c8                	je     deb1 <hyperinterval::float::F64Enclosure::square+0x281>
    dee9:	0f b6 c0             	movzbl %al,%eax
    deec:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
    def1:	c1 e1 10             	shl    $0x10,%ecx
    def4:	0f b7 74 24 0d       	movzwl 0xd(%rsp),%esi
    def9:	09 ce                	or     %ecx,%esi
    defb:	48 c1 e6 20          	shl    $0x20,%rsi
    deff:	8b 54 24 09          	mov    0x9(%rsp),%edx
    df03:	48 09 f2             	or     %rsi,%rdx
    df06:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    df0b:	48 c1 e2 08          	shl    $0x8,%rdx
    df0f:	48 09 c2             	or     %rax,%rdx
    df12:	4c 89 ef             	mov    %r13,%rdi
    df15:	4c 89 e6             	mov    %r12,%rsi
    df18:	e8 53 07 00 00       	call   e670 <hyperinterval::bounds::Bounds<T>::hull>
    df1d:	49 89 c5             	mov    %rax,%r13
    df20:	49 89 d4             	mov    %rdx,%r12
    df23:	eb 8c                	jmp    deb1 <hyperinterval::float::F64Enclosure::square+0x281>
    df25:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    df2c:	00 00 00 
    df2f:	90                   	nop

hyperinterval::float::F64Enclosure::checked_pow:
    df30:	55                   	push   %rbp
    df31:	41 57                	push   %r15
    df33:	41 56                	push   %r14
    df35:	41 55                	push   %r13
    df37:	41 54                	push   %r12
    df39:	53                   	push   %rbx
    df3a:	48 83 ec 48          	sub    $0x48,%rsp
    df3e:	48 89 fb             	mov    %rdi,%rbx
    df41:	83 fa 02             	cmp    $0x2,%edx
    df44:	75 0e                	jne    df54 <hyperinterval::float::F64Enclosure::checked_pow+0x24>
    df46:	48 89 df             	mov    %rbx,%rdi
    df49:	ff 15 a9 2b 05 00    	call   *0x52ba9(%rip)        # 60af8 <_GLOBAL_OFFSET_TABLE_+0x540>
    df4f:	e9 e0 00 00 00       	jmp    e034 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
    df54:	f6 06 01             	testb  $0x1,(%rsi)
    df57:	0f 84 d0 00 00 00    	je     e02d <hyperinterval::float::F64Enclosure::checked_pow+0xfd>
    df5d:	89 d5                	mov    %edx,%ebp
    df5f:	4c 8b 76 10          	mov    0x10(%rsi),%r14
    df63:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
    df6a:	00 00 80 
    df6d:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
    df74:	00 f0 7f 
    df77:	4c 8b 7e 08          	mov    0x8(%rsi),%r15
    df7b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    df80:	4c 89 e6             	mov    %r12,%rsi
    df83:	4c 89 ea             	mov    %r13,%rdx
    df86:	4c 89 f9             	mov    %r15,%rcx
    df89:	41 89 e8             	mov    %ebp,%r8d
    df8c:	e8 3f 1e 00 00       	call   fdd0 <hyperinterval::ieee::Format::power>
    df91:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
    df96:	0f 85 80 00 00 00    	jne    e01c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
    df9c:	4c 89 f1             	mov    %r14,%rcx
    df9f:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
    dfa4:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    dfa9:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    dfae:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    dfb3:	4c 89 e6             	mov    %r12,%rsi
    dfb6:	4c 89 ea             	mov    %r13,%rdx
    dfb9:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
    dfbe:	41 89 e8             	mov    %ebp,%r8d
    dfc1:	e8 0a 1e 00 00       	call   fdd0 <hyperinterval::ieee::Format::power>
    dfc6:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    dfcb:	74 4f                	je     e01c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
    dfcd:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    dfd2:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    dfd7:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    dfdc:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
    dfe1:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    dfe6:	4c 89 e6             	mov    %r12,%rsi
    dfe9:	4c 89 ea             	mov    %r13,%rdx
    dfec:	4c 89 f1             	mov    %r14,%rcx
    dfef:	e8 4c 0d 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    dff4:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    dff9:	74 21                	je     e01c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
    dffb:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
    e000:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    e005:	4c 89 e6             	mov    %r12,%rsi
    e008:	4c 89 ea             	mov    %r13,%rdx
    e00b:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    e010:	e8 2b 0d 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    e015:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    e01a:	75 2a                	jne    e046 <hyperinterval::float::F64Enclosure::checked_pow+0x116>
    e01c:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
    e021:	88 43 08             	mov    %al,0x8(%rbx)
    e024:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    e02b:	eb 07                	jmp    e034 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
    e02d:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    e034:	48 89 d8             	mov    %rbx,%rax
    e037:	48 83 c4 48          	add    $0x48,%rsp
    e03b:	5b                   	pop    %rbx
    e03c:	41 5c                	pop    %r12
    e03e:	41 5d                	pop    %r13
    e040:	41 5e                	pop    %r14
    e042:	41 5f                	pop    %r15
    e044:	5d                   	pop    %rbp
    e045:	c3                   	ret
    e046:	4c 89 f0             	mov    %r14,%rax
    e049:	4c 09 e0             	or     %r12,%rax
    e04c:	4c 89 f6             	mov    %r14,%rsi
    e04f:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
    e054:	48 89 f1             	mov    %rsi,%rcx
    e057:	4c 21 f1             	and    %r14,%rcx
    e05a:	4c 89 e2             	mov    %r12,%rdx
    e05d:	48 29 ca             	sub    %rcx,%rdx
    e060:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
    e065:	48 85 f6             	test   %rsi,%rsi
    e068:	48 0f 49 d0          	cmovns %rax,%rdx
    e06c:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    e071:	48 89 f8             	mov    %rdi,%rax
    e074:	4c 09 e0             	or     %r12,%rax
    e077:	48 89 f9             	mov    %rdi,%rcx
    e07a:	4c 21 f1             	and    %r14,%rcx
    e07d:	4c 89 e6             	mov    %r12,%rsi
    e080:	48 29 ce             	sub    %rcx,%rsi
    e083:	48 85 ff             	test   %rdi,%rdi
    e086:	48 0f 49 f0          	cmovns %rax,%rsi
    e08a:	b0 01                	mov    $0x1,%al
    e08c:	48 39 f2             	cmp    %rsi,%rdx
    e08f:	77 90                	ja     e021 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
    e091:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
    e096:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    e09b:	4c 89 e6             	mov    %r12,%rsi
    e09e:	4c 89 ea             	mov    %r13,%rdx
    e0a1:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    e0a6:	e8 95 0c 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    e0ab:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    e0b0:	0f 84 66 ff ff ff    	je     e01c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
    e0b6:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    e0bb:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    e0c0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    e0c5:	4c 89 e6             	mov    %r12,%rsi
    e0c8:	4c 89 ea             	mov    %r13,%rdx
    e0cb:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
    e0d0:	e8 6b 0c 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    e0d5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    e0da:	0f 84 3c ff ff ff    	je     e01c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
    e0e0:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    e0e5:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    e0ea:	48 89 d0             	mov    %rdx,%rax
    e0ed:	4c 09 e0             	or     %r12,%rax
    e0f0:	48 89 d7             	mov    %rdx,%rdi
    e0f3:	4c 21 f7             	and    %r14,%rdi
    e0f6:	4c 89 e6             	mov    %r12,%rsi
    e0f9:	48 29 fe             	sub    %rdi,%rsi
    e0fc:	48 85 d2             	test   %rdx,%rdx
    e0ff:	48 0f 49 f0          	cmovns %rax,%rsi
    e103:	48 89 c8             	mov    %rcx,%rax
    e106:	4c 09 e0             	or     %r12,%rax
    e109:	49 21 ce             	and    %rcx,%r14
    e10c:	4d 29 f4             	sub    %r14,%r12
    e10f:	48 85 c9             	test   %rcx,%rcx
    e112:	4c 0f 49 e0          	cmovns %rax,%r12
    e116:	b0 01                	mov    $0x1,%al
    e118:	4c 39 e6             	cmp    %r12,%rsi
    e11b:	0f 87 00 ff ff ff    	ja     e021 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
    e121:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
    e126:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
    e12b:	e8 40 05 00 00       	call   e670 <hyperinterval::bounds::Bounds<T>::hull>
    e130:	49 89 c5             	mov    %rax,%r13
    e133:	49 89 d4             	mov    %rdx,%r12
    e136:	85 ed                	test   %ebp,%ebp
    e138:	0f 95 c0             	setne  %al
    e13b:	40 f6 c5 01          	test   $0x1,%bpl
    e13f:	0f 94 c1             	sete   %cl
    e142:	84 c8                	test   %cl,%al
    e144:	74 13                	je     e159 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
    e146:	4c 89 ff             	mov    %r15,%rdi
    e149:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
    e14e:	31 d2                	xor    %edx,%edx
    e150:	e8 cb 06 00 00       	call   e820 <hyperinterval::bounds::Bounds<T>::signs>
    e155:	a8 02                	test   $0x2,%al
    e157:	75 14                	jne    e16d <hyperinterval::float::F64Enclosure::checked_pow+0x23d>
    e159:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
    e160:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
    e164:	4c 89 63 10          	mov    %r12,0x10(%rbx)
    e168:	e9 c7 fe ff ff       	jmp    e034 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
    e16d:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    e172:	31 f6                	xor    %esi,%esi
    e174:	31 d2                	xor    %edx,%edx
    e176:	e8 c5 e2 ff ff       	call   c440 <hyperinterval::float::F64Enclosure::from_bits>
    e17b:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    e180:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
    e185:	48 83 f9 02          	cmp    $0x2,%rcx
    e189:	0f 84 92 fe ff ff    	je     e021 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
    e18f:	f6 c1 01             	test   $0x1,%cl
    e192:	74 c5                	je     e159 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
    e194:	0f b6 c0             	movzbl %al,%eax
    e197:	0f b6 4c 24 17       	movzbl 0x17(%rsp),%ecx
    e19c:	c1 e1 10             	shl    $0x10,%ecx
    e19f:	0f b7 74 24 15       	movzwl 0x15(%rsp),%esi
    e1a4:	09 ce                	or     %ecx,%esi
    e1a6:	48 c1 e6 20          	shl    $0x20,%rsi
    e1aa:	8b 54 24 11          	mov    0x11(%rsp),%edx
    e1ae:	48 09 f2             	or     %rsi,%rdx
    e1b1:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    e1b6:	48 c1 e2 08          	shl    $0x8,%rdx
    e1ba:	48 09 c2             	or     %rax,%rdx
    e1bd:	4c 89 ef             	mov    %r13,%rdi
    e1c0:	4c 89 e6             	mov    %r12,%rsi
    e1c3:	e8 a8 04 00 00       	call   e670 <hyperinterval::bounds::Bounds<T>::hull>
    e1c8:	49 89 c5             	mov    %rax,%r13
    e1cb:	49 89 d4             	mov    %rdx,%r12
    e1ce:	eb 89                	jmp    e159 <hyperinterval::float::F64Enclosure::checked_pow+0x229>

hyperinterval::float::F64Enclosure::affine:
    e1d0:	55                   	push   %rbp
    e1d1:	41 57                	push   %r15
    e1d3:	41 56                	push   %r14
    e1d5:	41 55                	push   %r13
    e1d7:	41 54                	push   %r12
    e1d9:	53                   	push   %rbx
    e1da:	48 83 ec 28          	sub    $0x28,%rsp
    e1de:	f2 0f 11 4c 24 18    	movsd  %xmm1,0x18(%rsp)
    e1e4:	49 89 f5             	mov    %rsi,%r13
    e1e7:	48 89 fb             	mov    %rdi,%rbx
    e1ea:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
    e1f1:	00 00 80 
    e1f4:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
    e1fb:	00 f0 7f 
    e1fe:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    e203:	48 89 e7             	mov    %rsp,%rdi
    e206:	4c 89 f6             	mov    %r14,%rsi
    e209:	4c 89 e2             	mov    %r12,%rdx
    e20c:	e8 2f 0b 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    e211:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    e215:	74 24                	je     e23b <hyperinterval::float::F64Enclosure::affine+0x6b>
    e217:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
    e21c:	f3 0f 7e 44 24 18    	movq   0x18(%rsp),%xmm0
    e222:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    e227:	48 89 e7             	mov    %rsp,%rdi
    e22a:	4c 89 f6             	mov    %r14,%rsi
    e22d:	4c 89 e2             	mov    %r12,%rdx
    e230:	e8 0b 0b 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    e235:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    e239:	75 21                	jne    e25c <hyperinterval::float::F64Enclosure::affine+0x8c>
    e23b:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    e240:	88 43 08             	mov    %al,0x8(%rbx)
    e243:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    e24a:	48 89 d8             	mov    %rbx,%rax
    e24d:	48 83 c4 28          	add    $0x28,%rsp
    e251:	5b                   	pop    %rbx
    e252:	41 5c                	pop    %r12
    e254:	41 5d                	pop    %r13
    e256:	41 5e                	pop    %r14
    e258:	41 5f                	pop    %r15
    e25a:	5d                   	pop    %rbp
    e25b:	c3                   	ret
    e25c:	41 f6 45 00 01       	testb  $0x1,0x0(%r13)
    e261:	0f 84 59 01 00 00    	je     e3c0 <hyperinterval::float::F64Enclosure::affine+0x1f0>
    e267:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    e26c:	49 8b 45 10          	mov    0x10(%r13),%rax
    e270:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    e275:	49 8b 4d 08          	mov    0x8(%r13),%rcx
    e279:	48 89 e7             	mov    %rsp,%rdi
    e27c:	4c 89 f6             	mov    %r14,%rsi
    e27f:	4c 89 e2             	mov    %r12,%rdx
    e282:	4d 89 f8             	mov    %r15,%r8
    e285:	49 89 e9             	mov    %rbp,%r9
    e288:	e8 13 13 00 00       	call   f5a0 <hyperinterval::ieee::Format::affine>
    e28d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    e291:	74 a8                	je     e23b <hyperinterval::float::F64Enclosure::affine+0x6b>
    e293:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    e298:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    e29d:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    e2a2:	48 89 e7             	mov    %rsp,%rdi
    e2a5:	4c 89 f6             	mov    %r14,%rsi
    e2a8:	4c 89 e2             	mov    %r12,%rdx
    e2ab:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    e2b0:	4d 89 f8             	mov    %r15,%r8
    e2b3:	49 89 e9             	mov    %rbp,%r9
    e2b6:	e8 e5 12 00 00       	call   f5a0 <hyperinterval::ieee::Format::affine>
    e2bb:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    e2bf:	0f 84 76 ff ff ff    	je     e23b <hyperinterval::float::F64Enclosure::affine+0x6b>
    e2c5:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
    e2ca:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
    e2cf:	48 89 e7             	mov    %rsp,%rdi
    e2d2:	4c 89 f6             	mov    %r14,%rsi
    e2d5:	4c 89 e2             	mov    %r12,%rdx
    e2d8:	4c 89 e9             	mov    %r13,%rcx
    e2db:	e8 60 0a 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    e2e0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    e2e4:	0f 84 51 ff ff ff    	je     e23b <hyperinterval::float::F64Enclosure::affine+0x6b>
    e2ea:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    e2ef:	48 89 e7             	mov    %rsp,%rdi
    e2f2:	4c 89 f6             	mov    %r14,%rsi
    e2f5:	4c 89 e2             	mov    %r12,%rdx
    e2f8:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    e2fd:	e8 3e 0a 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    e302:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    e306:	0f 84 2f ff ff ff    	je     e23b <hyperinterval::float::F64Enclosure::affine+0x6b>
    e30c:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    e311:	4c 89 e8             	mov    %r13,%rax
    e314:	4c 09 f0             	or     %r14,%rax
    e317:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
    e31b:	4c 89 ea             	mov    %r13,%rdx
    e31e:	48 21 ca             	and    %rcx,%rdx
    e321:	4c 89 f6             	mov    %r14,%rsi
    e324:	48 29 d6             	sub    %rdx,%rsi
    e327:	4d 85 ed             	test   %r13,%r13
    e32a:	48 0f 49 f0          	cmovns %rax,%rsi
    e32e:	4c 89 e0             	mov    %r12,%rax
    e331:	4c 09 f0             	or     %r14,%rax
    e334:	4c 21 e1             	and    %r12,%rcx
    e337:	49 29 ce             	sub    %rcx,%r14
    e33a:	4d 85 e4             	test   %r12,%r12
    e33d:	4c 0f 49 f0          	cmovns %rax,%r14
    e341:	b0 01                	mov    $0x1,%al
    e343:	4c 39 f6             	cmp    %r14,%rsi
    e346:	0f 87 f4 fe ff ff    	ja     e240 <hyperinterval::float::F64Enclosure::affine+0x70>
    e34c:	48 89 e7             	mov    %rsp,%rdi
    e34f:	4c 89 fe             	mov    %r15,%rsi
    e352:	48 89 ea             	mov    %rbp,%rdx
    e355:	e8 e6 e0 ff ff       	call   c440 <hyperinterval::float::F64Enclosure::from_bits>
    e35a:	48 8b 0c 24          	mov    (%rsp),%rcx
    e35e:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
    e363:	48 83 f9 02          	cmp    $0x2,%rcx
    e367:	0f 84 d3 fe ff ff    	je     e240 <hyperinterval::float::F64Enclosure::affine+0x70>
    e36d:	f6 c1 01             	test   $0x1,%cl
    e370:	74 3a                	je     e3ac <hyperinterval::float::F64Enclosure::affine+0x1dc>
    e372:	0f b6 c0             	movzbl %al,%eax
    e375:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
    e37a:	c1 e1 10             	shl    $0x10,%ecx
    e37d:	0f b7 74 24 0d       	movzwl 0xd(%rsp),%esi
    e382:	09 ce                	or     %ecx,%esi
    e384:	48 c1 e6 20          	shl    $0x20,%rsi
    e388:	8b 54 24 09          	mov    0x9(%rsp),%edx
    e38c:	48 09 f2             	or     %rsi,%rdx
    e38f:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    e394:	48 c1 e2 08          	shl    $0x8,%rdx
    e398:	48 09 c2             	or     %rax,%rdx
    e39b:	4c 89 ef             	mov    %r13,%rdi
    e39e:	4c 89 e6             	mov    %r12,%rsi
    e3a1:	e8 ca 02 00 00       	call   e670 <hyperinterval::bounds::Bounds<T>::hull>
    e3a6:	49 89 c5             	mov    %rax,%r13
    e3a9:	49 89 d4             	mov    %rdx,%r12
    e3ac:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
    e3b3:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
    e3b7:	4c 89 63 10          	mov    %r12,0x10(%rbx)
    e3bb:	e9 8a fe ff ff       	jmp    e24a <hyperinterval::float::F64Enclosure::affine+0x7a>
    e3c0:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    e3c7:	e9 7e fe ff ff       	jmp    e24a <hyperinterval::float::F64Enclosure::affine+0x7a>
    e3cc:	0f 1f 40 00          	nopl   0x0(%rax)

hyperinterval::float::F64Enclosure::next_down:
    e3d0:	41 57                	push   %r15
    e3d2:	41 56                	push   %r14
    e3d4:	53                   	push   %rbx
    e3d5:	48 83 ec 10          	sub    $0x10,%rsp
    e3d9:	48 89 fb             	mov    %rdi,%rbx
    e3dc:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
    e3e3:	00 00 80 
    e3e6:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
    e3ed:	00 f0 7f 
    e3f0:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    e3f5:	48 89 e7             	mov    %rsp,%rdi
    e3f8:	4c 89 f6             	mov    %r14,%rsi
    e3fb:	4c 89 fa             	mov    %r15,%rdx
    e3fe:	e8 3d 09 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    e403:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    e407:	75 0c                	jne    e415 <hyperinterval::float::F64Enclosure::next_down+0x45>
    e409:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    e40e:	88 43 01             	mov    %al,0x1(%rbx)
    e411:	b0 01                	mov    $0x1,%al
    e413:	eb 51                	jmp    e466 <hyperinterval::float::F64Enclosure::next_down+0x96>
    e415:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    e41a:	48 89 c2             	mov    %rax,%rdx
    e41d:	4c 31 f2             	xor    %r14,%rdx
    e420:	48 85 c0             	test   %rax,%rax
    e423:	48 0f 44 d0          	cmove  %rax,%rdx
    e427:	48 89 d1             	mov    %rdx,%rcx
    e42a:	48 c1 f9 3f          	sar    $0x3f,%rcx
    e42e:	48 83 c9 01          	or     $0x1,%rcx
    e432:	48 01 d1             	add    %rdx,%rcx
    e435:	48 89 e7             	mov    %rsp,%rdi
    e438:	4c 89 f6             	mov    %r14,%rsi
    e43b:	4c 89 fa             	mov    %r15,%rdx
    e43e:	e8 fd 08 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    e443:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    e447:	75 08                	jne    e451 <hyperinterval::float::F64Enclosure::next_down+0x81>
    e449:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
    e44d:	b0 01                	mov    $0x1,%al
    e44f:	eb 15                	jmp    e466 <hyperinterval::float::F64Enclosure::next_down+0x96>
    e451:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    e456:	49 31 c6             	xor    %rax,%r14
    e459:	48 85 c0             	test   %rax,%rax
    e45c:	4c 0f 44 f0          	cmove  %rax,%r14
    e460:	4c 89 73 08          	mov    %r14,0x8(%rbx)
    e464:	31 c0                	xor    %eax,%eax
    e466:	88 03                	mov    %al,(%rbx)
    e468:	48 89 d8             	mov    %rbx,%rax
    e46b:	48 83 c4 10          	add    $0x10,%rsp
    e46f:	5b                   	pop    %rbx
    e470:	41 5e                	pop    %r14
    e472:	41 5f                	pop    %r15
    e474:	c3                   	ret
    e475:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    e47c:	00 00 00 
    e47f:	90                   	nop

hyperinterval::float::F64Enclosure::next_up:
    e480:	41 57                	push   %r15
    e482:	41 56                	push   %r14
    e484:	53                   	push   %rbx
    e485:	48 83 ec 10          	sub    $0x10,%rsp
    e489:	48 89 fb             	mov    %rdi,%rbx
    e48c:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
    e493:	00 00 80 
    e496:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
    e49d:	00 f0 7f 
    e4a0:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    e4a5:	48 89 e7             	mov    %rsp,%rdi
    e4a8:	4c 89 f6             	mov    %r14,%rsi
    e4ab:	4c 89 fa             	mov    %r15,%rdx
    e4ae:	e8 8d 08 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    e4b3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    e4b7:	75 0c                	jne    e4c5 <hyperinterval::float::F64Enclosure::next_up+0x45>
    e4b9:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    e4be:	88 43 01             	mov    %al,0x1(%rbx)
    e4c1:	b0 01                	mov    $0x1,%al
    e4c3:	eb 3c                	jmp    e501 <hyperinterval::float::F64Enclosure::next_up+0x81>
    e4c5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    e4ca:	48 89 c1             	mov    %rax,%rcx
    e4cd:	48 c1 f9 3f          	sar    $0x3f,%rcx
    e4d1:	48 83 c9 01          	or     $0x1,%rcx
    e4d5:	48 01 c1             	add    %rax,%rcx
    e4d8:	48 89 e7             	mov    %rsp,%rdi
    e4db:	4c 89 f6             	mov    %r14,%rsi
    e4de:	4c 89 fa             	mov    %r15,%rdx
    e4e1:	e8 5a 08 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    e4e6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    e4ea:	75 08                	jne    e4f4 <hyperinterval::float::F64Enclosure::next_up+0x74>
    e4ec:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
    e4f0:	b0 01                	mov    $0x1,%al
    e4f2:	eb 0d                	jmp    e501 <hyperinterval::float::F64Enclosure::next_up+0x81>
    e4f4:	f3 0f 7e 44 24 08    	movq   0x8(%rsp),%xmm0
    e4fa:	66 0f d6 43 08       	movq   %xmm0,0x8(%rbx)
    e4ff:	31 c0                	xor    %eax,%eax
    e501:	88 03                	mov    %al,(%rbx)
    e503:	48 89 d8             	mov    %rbx,%rax
    e506:	48 83 c4 10          	add    $0x10,%rsp
    e50a:	5b                   	pop    %rbx
    e50b:	41 5e                	pop    %r14
    e50d:	41 5f                	pop    %r15
    e50f:	c3                   	ret

hyperinterval::float::F64Enclosure::expanded:
    e510:	41 57                	push   %r15
    e512:	41 56                	push   %r14
    e514:	41 55                	push   %r13
    e516:	41 54                	push   %r12
    e518:	53                   	push   %rbx
    e519:	48 83 ec 10          	sub    $0x10,%rsp
    e51d:	48 89 fb             	mov    %rdi,%rbx
    e520:	f6 06 01             	testb  $0x1,(%rsi)
    e523:	74 7f                	je     e5a4 <hyperinterval::float::F64Enclosure::expanded+0x94>
    e525:	4c 8b 66 10          	mov    0x10(%rsi),%r12
    e529:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
    e530:	00 00 80 
    e533:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
    e53a:	00 f0 7f 
    e53d:	48 8b 46 08          	mov    0x8(%rsi),%rax
    e541:	48 89 c2             	mov    %rax,%rdx
    e544:	4c 31 f2             	xor    %r14,%rdx
    e547:	48 85 c0             	test   %rax,%rax
    e54a:	48 0f 44 d0          	cmove  %rax,%rdx
    e54e:	48 89 d1             	mov    %rdx,%rcx
    e551:	48 c1 f9 3f          	sar    $0x3f,%rcx
    e555:	48 83 c9 01          	or     $0x1,%rcx
    e559:	48 01 d1             	add    %rdx,%rcx
    e55c:	48 89 e7             	mov    %rsp,%rdi
    e55f:	4c 89 f6             	mov    %r14,%rsi
    e562:	4c 89 fa             	mov    %r15,%rdx
    e565:	e8 d6 07 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    e56a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    e56e:	75 27                	jne    e597 <hyperinterval::float::F64Enclosure::expanded+0x87>
    e570:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    e575:	4c 89 e1             	mov    %r12,%rcx
    e578:	48 c1 f9 3f          	sar    $0x3f,%rcx
    e57c:	48 83 c9 01          	or     $0x1,%rcx
    e580:	4c 01 e1             	add    %r12,%rcx
    e583:	48 89 e7             	mov    %rsp,%rdi
    e586:	4c 89 f6             	mov    %r14,%rsi
    e589:	4c 89 fa             	mov    %r15,%rdx
    e58c:	e8 af 07 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    e591:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    e595:	75 25                	jne    e5bc <hyperinterval::float::F64Enclosure::expanded+0xac>
    e597:	c6 43 08 03          	movb   $0x3,0x8(%rbx)
    e59b:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    e5a2:	eb 07                	jmp    e5ab <hyperinterval::float::F64Enclosure::expanded+0x9b>
    e5a4:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    e5ab:	48 89 d8             	mov    %rbx,%rax
    e5ae:	48 83 c4 10          	add    $0x10,%rsp
    e5b2:	5b                   	pop    %rbx
    e5b3:	41 5c                	pop    %r12
    e5b5:	41 5d                	pop    %r13
    e5b7:	41 5e                	pop    %r14
    e5b9:	41 5f                	pop    %r15
    e5bb:	c3                   	ret
    e5bc:	4c 89 e9             	mov    %r13,%rcx
    e5bf:	4c 31 f1             	xor    %r14,%rcx
    e5c2:	4d 85 ed             	test   %r13,%r13
    e5c5:	49 0f 44 cd          	cmove  %r13,%rcx
    e5c9:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    e5ce:	48 89 e7             	mov    %rsp,%rdi
    e5d1:	4c 89 f6             	mov    %r14,%rsi
    e5d4:	4c 89 fa             	mov    %r15,%rdx
    e5d7:	e8 64 07 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    e5dc:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    e5e0:	74 1c                	je     e5fe <hyperinterval::float::F64Enclosure::expanded+0xee>
    e5e2:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    e5e7:	48 89 e7             	mov    %rsp,%rdi
    e5ea:	4c 89 f6             	mov    %r14,%rsi
    e5ed:	4c 89 fa             	mov    %r15,%rdx
    e5f0:	4c 89 e1             	mov    %r12,%rcx
    e5f3:	e8 48 07 00 00       	call   ed40 <hyperinterval::ieee::Format::finite>
    e5f8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    e5fc:	75 11                	jne    e60f <hyperinterval::float::F64Enclosure::expanded+0xff>
    e5fe:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    e603:	88 43 08             	mov    %al,0x8(%rbx)
    e606:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    e60d:	eb 9c                	jmp    e5ab <hyperinterval::float::F64Enclosure::expanded+0x9b>
    e60f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    e614:	4c 89 e9             	mov    %r13,%rcx
    e617:	4c 09 f1             	or     %r14,%rcx
    e61a:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
    e61e:	4c 89 ee             	mov    %r13,%rsi
    e621:	48 21 d6             	and    %rdx,%rsi
    e624:	4c 89 f7             	mov    %r14,%rdi
    e627:	48 29 f7             	sub    %rsi,%rdi
    e62a:	4d 85 ed             	test   %r13,%r13
    e62d:	48 0f 49 f9          	cmovns %rcx,%rdi
    e631:	48 89 c1             	mov    %rax,%rcx
    e634:	4c 09 f1             	or     %r14,%rcx
    e637:	48 21 c2             	and    %rax,%rdx
    e63a:	49 29 d6             	sub    %rdx,%r14
    e63d:	48 85 c0             	test   %rax,%rax
    e640:	4c 0f 49 f1          	cmovns %rcx,%r14
    e644:	4c 39 f7             	cmp    %r14,%rdi
    e647:	76 10                	jbe    e659 <hyperinterval::float::F64Enclosure::expanded+0x149>
    e649:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
    e64d:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    e654:	e9 52 ff ff ff       	jmp    e5ab <hyperinterval::float::F64Enclosure::expanded+0x9b>
    e659:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
    e660:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
    e664:	48 89 43 10          	mov    %rax,0x10(%rbx)
    e668:	e9 3e ff ff ff       	jmp    e5ab <hyperinterval::float::F64Enclosure::expanded+0x9b>
    e66d:	0f 1f 00             	nopl   (%rax)

hyperinterval::bounds::Bounds<T>::hull:
    e700:	89 f8                	mov    %edi,%eax
    e702:	bf 00 00 00 80       	mov    $0x80000000,%edi
    e707:	41 89 c0             	mov    %eax,%r8d
    e70a:	41 09 f8             	or     %edi,%r8d
    e70d:	41 89 c1             	mov    %eax,%r9d
    e710:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    e717:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    e71d:	45 29 ca             	sub    %r9d,%r10d
    e720:	85 c0                	test   %eax,%eax
    e722:	4d 0f 49 d0          	cmovns %r8,%r10
    e726:	41 89 d0             	mov    %edx,%r8d
    e729:	41 09 f8             	or     %edi,%r8d
    e72c:	41 89 d1             	mov    %edx,%r9d
    e72f:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    e736:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
    e73c:	45 29 cb             	sub    %r9d,%r11d
    e73f:	85 d2                	test   %edx,%edx
    e741:	4d 0f 49 d8          	cmovns %r8,%r11
    e745:	45 39 da             	cmp    %r11d,%r10d
    e748:	0f 47 c2             	cmova  %edx,%eax
    e74b:	89 f2                	mov    %esi,%edx
    e74d:	09 fe                	or     %edi,%esi
    e74f:	41 89 d0             	mov    %edx,%r8d
    e752:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
    e759:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
    e75f:	45 29 c1             	sub    %r8d,%r9d
    e762:	85 d2                	test   %edx,%edx
    e764:	4c 0f 49 ce          	cmovns %rsi,%r9
    e768:	89 ce                	mov    %ecx,%esi
    e76a:	09 fe                	or     %edi,%esi
    e76c:	41 89 c8             	mov    %ecx,%r8d
    e76f:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
    e776:	44 29 c7             	sub    %r8d,%edi
    e779:	85 c9                	test   %ecx,%ecx
    e77b:	48 0f 49 fe          	cmovns %rsi,%rdi
    e77f:	41 39 f9             	cmp    %edi,%r9d
    e782:	0f 42 d1             	cmovb  %ecx,%edx
    e785:	c3                   	ret
    e786:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    e78d:	00 00 00 

hyperinterval::bounds::Bounds<T>::signs:
    e820:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    e827:	00 00 80 
    e82a:	48 89 f9             	mov    %rdi,%rcx
    e82d:	48 09 c1             	or     %rax,%rcx
    e830:	4c 8d 40 ff          	lea    -0x1(%rax),%r8
    e834:	49 89 f9             	mov    %rdi,%r9
    e837:	4d 21 c1             	and    %r8,%r9
    e83a:	49 89 c2             	mov    %rax,%r10
    e83d:	4d 29 ca             	sub    %r9,%r10
    e840:	48 85 ff             	test   %rdi,%rdi
    e843:	4c 0f 49 d1          	cmovns %rcx,%r10
    e847:	48 89 d7             	mov    %rdx,%rdi
    e84a:	48 09 c7             	or     %rax,%rdi
    e84d:	49 89 d1             	mov    %rdx,%r9
    e850:	4d 21 c1             	and    %r8,%r9
    e853:	48 89 c1             	mov    %rax,%rcx
    e856:	4c 29 c9             	sub    %r9,%rcx
    e859:	48 85 d2             	test   %rdx,%rdx
    e85c:	48 0f 49 cf          	cmovns %rdi,%rcx
    e860:	48 89 f2             	mov    %rsi,%rdx
    e863:	48 09 c2             	or     %rax,%rdx
    e866:	49 21 f0             	and    %rsi,%r8
    e869:	4c 29 c0             	sub    %r8,%rax
    e86c:	45 31 c0             	xor    %r8d,%r8d
    e86f:	49 39 ca             	cmp    %rcx,%r10
    e872:	40 0f 92 c7          	setb   %dil
    e876:	77 1c                	ja     e894 <hyperinterval::bounds::Bounds<T>::signs+0x74>
    e878:	48 85 f6             	test   %rsi,%rsi
    e87b:	49 89 d1             	mov    %rdx,%r9
    e87e:	4c 0f 48 c8          	cmovs  %rax,%r9
    e882:	44 8d 57 02          	lea    0x2(%rdi),%r10d
    e886:	4c 39 c9             	cmp    %r9,%rcx
    e889:	41 88 f8             	mov    %dil,%r8b
    e88c:	41 0f b6 fa          	movzbl %r10b,%edi
    e890:	41 0f 47 f8          	cmova  %r8d,%edi
    e894:	48 85 f6             	test   %rsi,%rsi
    e897:	48 0f 48 d0          	cmovs  %rax,%rdx
    e89b:	8d 47 04             	lea    0x4(%rdi),%eax
    e89e:	48 39 ca             	cmp    %rcx,%rdx
    e8a1:	40 0f b6 cf          	movzbl %dil,%ecx
    e8a5:	0f b6 c0             	movzbl %al,%eax
    e8a8:	0f 46 c1             	cmovbe %ecx,%eax
    e8ab:	c3                   	ret
    e8ac:	0f 1f 40 00          	nopl   0x0(%rax)

hyperinterval::sqrt::integer_sqrt_bounds:
    e8b0:	55                   	push   %rbp
    e8b1:	41 57                	push   %r15
    e8b3:	41 56                	push   %r14
    e8b5:	41 55                	push   %r13
    e8b7:	41 54                	push   %r12
    e8b9:	53                   	push   %rbx
    e8ba:	50                   	push   %rax
    e8bb:	49 89 d2             	mov    %rdx,%r10
    e8be:	48 89 f3             	mov    %rsi,%rbx
    e8c1:	49 89 fe             	mov    %rdi,%r14
    e8c4:	48 85 d2             	test   %rdx,%rdx
    e8c7:	75 37                	jne    e900 <hyperinterval::sqrt::integer_sqrt_bounds+0x50>
    e8c9:	48 89 d8             	mov    %rbx,%rax
    e8cc:	48 c1 e8 20          	shr    $0x20,%rax
    e8d0:	0f 85 3e 01 00 00    	jne    ea14 <hyperinterval::sqrt::integer_sqrt_bounds+0x164>
    e8d6:	48 81 fb 00 00 01 00 	cmp    $0x10000,%rbx
    e8dd:	0f 83 d1 02 00 00    	jae    ebb4 <hyperinterval::sqrt::integer_sqrt_bounds+0x304>
    e8e3:	48 81 fb 00 01 00 00 	cmp    $0x100,%rbx
    e8ea:	0f 83 93 03 00 00    	jae    ec83 <hyperinterval::sqrt::integer_sqrt_bounds+0x3d3>
    e8f0:	48 8d 05 65 00 04 00 	lea    0x40065(%rip),%rax        # 4e95c <_fini+0x1260>
    e8f7:	0f b6 04 58          	movzbl (%rax,%rbx,2),%eax
    e8fb:	e9 eb 03 00 00       	jmp    eceb <hyperinterval::sqrt::integer_sqrt_bounds+0x43b>
    e900:	49 0f bd c2          	bsr    %r10,%rax
    e904:	48 83 f0 3f          	xor    $0x3f,%rax
    e908:	4c 0f bd eb          	bsr    %rbx,%r13
    e90c:	49 83 f5 3f          	xor    $0x3f,%r13
    e910:	49 83 cd 40          	or     $0x40,%r13
    e914:	4d 85 d2             	test   %r10,%r10
    e917:	4c 0f 45 e8          	cmovne %rax,%r13
    e91b:	44 89 e9             	mov    %r13d,%ecx
    e91e:	80 e1 3e             	and    $0x3e,%cl
    e921:	4c 89 14 24          	mov    %r10,(%rsp)
    e925:	4c 89 d5             	mov    %r10,%rbp
    e928:	48 0f a5 dd          	shld   %cl,%rbx,%rbp
    e92c:	48 89 d8             	mov    %rbx,%rax
    e92f:	48 d3 e0             	shl    %cl,%rax
    e932:	31 c9                	xor    %ecx,%ecx
    e934:	41 f6 c5 40          	test   $0x40,%r13b
    e938:	48 0f 45 e8          	cmovne %rax,%rbp
    e93c:	41 bf 00 00 00 00    	mov    $0x0,%r15d
    e942:	4c 0f 44 f8          	cmove  %rax,%r15
    e946:	48 89 e8             	mov    %rbp,%rax
    e949:	48 c1 e8 38          	shr    $0x38,%rax
    e94d:	48 8d 15 08 00 04 00 	lea    0x40008(%rip),%rdx        # 4e95c <_fini+0x1260>
    e954:	0f b6 34 42          	movzbl (%rdx,%rax,2),%esi
    e958:	0f b6 54 42 01       	movzbl 0x1(%rdx,%rax,2),%edx
    e95d:	89 f7                	mov    %esi,%edi
    e95f:	01 f7                	add    %esi,%edi
    e961:	c1 e2 04             	shl    $0x4,%edx
    e964:	48 89 e8             	mov    %rbp,%rax
    e967:	48 c1 e8 34          	shr    $0x34,%rax
    e96b:	83 e0 0f             	and    $0xf,%eax
    e96e:	09 d0                	or     %edx,%eax
    e970:	31 d2                	xor    %edx,%edx
    e972:	66 f7 f7             	div    %di
    e975:	48 89 ef             	mov    %rbp,%rdi
    e978:	48 c1 ef 30          	shr    $0x30,%rdi
    e97c:	40 c0 e6 04          	shl    $0x4,%sil
    e980:	40 0f b6 f6          	movzbl %sil,%esi
    e984:	01 c6                	add    %eax,%esi
    e986:	c1 e2 04             	shl    $0x4,%edx
    e989:	83 e7 0f             	and    $0xf,%edi
    e98c:	09 d7                	or     %edx,%edi
    e98e:	0f af c0             	imul   %eax,%eax
    e991:	66 29 c7             	sub    %ax,%di
    e994:	8d 44 36 ff          	lea    -0x1(%rsi,%rsi,1),%eax
    e998:	0f 43 c1             	cmovae %ecx,%eax
    e99b:	66 83 de 00          	sbb    $0x0,%si
    e99f:	01 f8                	add    %edi,%eax
    e9a1:	0f b7 fe             	movzwl %si,%edi
    e9a4:	01 ff                	add    %edi,%edi
    e9a6:	0f b7 d0             	movzwl %ax,%edx
    e9a9:	c1 e2 08             	shl    $0x8,%edx
    e9ac:	48 89 e8             	mov    %rbp,%rax
    e9af:	48 c1 e8 28          	shr    $0x28,%rax
    e9b3:	0f b6 c0             	movzbl %al,%eax
    e9b6:	09 d0                	or     %edx,%eax
    e9b8:	31 d2                	xor    %edx,%edx
    e9ba:	f7 f7                	div    %edi
    e9bc:	48 89 ef             	mov    %rbp,%rdi
    e9bf:	48 c1 ef 20          	shr    $0x20,%rdi
    e9c3:	c1 e6 08             	shl    $0x8,%esi
    e9c6:	44 0f b7 e6          	movzwl %si,%r12d
    e9ca:	41 01 c4             	add    %eax,%r12d
    e9cd:	c1 e2 08             	shl    $0x8,%edx
    e9d0:	40 0f b6 f7          	movzbl %dil,%esi
    e9d4:	09 d6                	or     %edx,%esi
    e9d6:	0f af c0             	imul   %eax,%eax
    e9d9:	29 c6                	sub    %eax,%esi
    e9db:	43 8d 44 24 ff       	lea    -0x1(%r12,%r12,1),%eax
    e9e0:	0f 43 c1             	cmovae %ecx,%eax
    e9e3:	8d 14 06             	lea    (%rsi,%rax,1),%edx
    e9e6:	41 83 dc 00          	sbb    $0x0,%r12d
    e9ea:	4b 8d 0c 24          	lea    (%r12,%r12,1),%rcx
    e9ee:	48 c1 e2 10          	shl    $0x10,%rdx
    e9f2:	89 e8                	mov    %ebp,%eax
    e9f4:	c1 e8 10             	shr    $0x10,%eax
    e9f7:	48 09 d0             	or     %rdx,%rax
    e9fa:	48 09 ca             	or     %rcx,%rdx
    e9fd:	48 c1 ea 20          	shr    $0x20,%rdx
    ea01:	66 85 d2             	test   %dx,%dx
    ea04:	0f 84 ff 00 00 00    	je     eb09 <hyperinterval::sqrt::integer_sqrt_bounds+0x259>
    ea0a:	31 d2                	xor    %edx,%edx
    ea0c:	48 f7 f1             	div    %rcx
    ea0f:	e9 f9 00 00 00       	jmp    eb0d <hyperinterval::sqrt::integer_sqrt_bounds+0x25d>
    ea14:	48 0f bd f3          	bsr    %rbx,%rsi
    ea18:	48 83 f6 3f          	xor    $0x3f,%rsi
    ea1c:	89 f1                	mov    %esi,%ecx
    ea1e:	80 e1 3e             	and    $0x3e,%cl
    ea21:	48 89 df             	mov    %rbx,%rdi
    ea24:	48 d3 e7             	shl    %cl,%rdi
    ea27:	48 89 f8             	mov    %rdi,%rax
    ea2a:	48 c1 e8 38          	shr    $0x38,%rax
    ea2e:	48 8d 0d 27 ff 03 00 	lea    0x3ff27(%rip),%rcx        # 4e95c <_fini+0x1260>
    ea35:	44 0f b6 04 41       	movzbl (%rcx,%rax,2),%r8d
    ea3a:	0f b6 4c 41 01       	movzbl 0x1(%rcx,%rax,2),%ecx
    ea3f:	45 89 c1             	mov    %r8d,%r9d
    ea42:	45 01 c1             	add    %r8d,%r9d
    ea45:	c1 e1 04             	shl    $0x4,%ecx
    ea48:	48 89 f8             	mov    %rdi,%rax
    ea4b:	48 c1 e8 34          	shr    $0x34,%rax
    ea4f:	83 e0 0f             	and    $0xf,%eax
    ea52:	09 c8                	or     %ecx,%eax
    ea54:	31 d2                	xor    %edx,%edx
    ea56:	66 41 f7 f1          	div    %r9w
    ea5a:	49 89 f9             	mov    %rdi,%r9
    ea5d:	49 c1 e9 30          	shr    $0x30,%r9
    ea61:	31 c9                	xor    %ecx,%ecx
    ea63:	41 c0 e0 04          	shl    $0x4,%r8b
    ea67:	45 0f b6 c0          	movzbl %r8b,%r8d
    ea6b:	41 01 c0             	add    %eax,%r8d
    ea6e:	c1 e2 04             	shl    $0x4,%edx
    ea71:	41 83 e1 0f          	and    $0xf,%r9d
    ea75:	41 09 d1             	or     %edx,%r9d
    ea78:	0f af c0             	imul   %eax,%eax
    ea7b:	66 41 29 c1          	sub    %ax,%r9w
    ea7f:	43 8d 44 00 ff       	lea    -0x1(%r8,%r8,1),%eax
    ea84:	0f 43 c1             	cmovae %ecx,%eax
    ea87:	66 41 83 d8 00       	sbb    $0x0,%r8w
    ea8c:	44 01 c8             	add    %r9d,%eax
    ea8f:	45 0f b7 c8          	movzwl %r8w,%r9d
    ea93:	45 01 c9             	add    %r9d,%r9d
    ea96:	0f b7 d0             	movzwl %ax,%edx
    ea99:	c1 e2 08             	shl    $0x8,%edx
    ea9c:	48 89 f8             	mov    %rdi,%rax
    ea9f:	48 c1 e8 28          	shr    $0x28,%rax
    eaa3:	0f b6 c0             	movzbl %al,%eax
    eaa6:	09 d0                	or     %edx,%eax
    eaa8:	31 d2                	xor    %edx,%edx
    eaaa:	41 f7 f1             	div    %r9d
    eaad:	49 89 f9             	mov    %rdi,%r9
    eab0:	49 c1 e9 20          	shr    $0x20,%r9
    eab4:	41 c1 e0 08          	shl    $0x8,%r8d
    eab8:	45 0f b7 e0          	movzwl %r8w,%r12d
    eabc:	41 01 c4             	add    %eax,%r12d
    eabf:	c1 e2 08             	shl    $0x8,%edx
    eac2:	45 0f b6 c1          	movzbl %r9b,%r8d
    eac6:	41 09 d0             	or     %edx,%r8d
    eac9:	0f af c0             	imul   %eax,%eax
    eacc:	41 29 c0             	sub    %eax,%r8d
    eacf:	43 8d 44 24 ff       	lea    -0x1(%r12,%r12,1),%eax
    ead4:	0f 43 c1             	cmovae %ecx,%eax
    ead7:	41 8d 14 00          	lea    (%r8,%rax,1),%edx
    eadb:	41 83 dc 00          	sbb    $0x0,%r12d
    eadf:	4b 8d 0c 24          	lea    (%r12,%r12,1),%rcx
    eae3:	48 c1 e2 10          	shl    $0x10,%rdx
    eae7:	89 f8                	mov    %edi,%eax
    eae9:	c1 e8 10             	shr    $0x10,%eax
    eaec:	48 09 d0             	or     %rdx,%rax
    eaef:	48 09 ca             	or     %rcx,%rdx
    eaf2:	48 c1 ea 20          	shr    $0x20,%rdx
    eaf6:	66 85 d2             	test   %dx,%dx
    eaf9:	0f 84 59 01 00 00    	je     ec58 <hyperinterval::sqrt::integer_sqrt_bounds+0x3a8>
    eaff:	31 d2                	xor    %edx,%edx
    eb01:	48 f7 f1             	div    %rcx
    eb04:	e9 53 01 00 00       	jmp    ec5c <hyperinterval::sqrt::integer_sqrt_bounds+0x3ac>
    eb09:	31 d2                	xor    %edx,%edx
    eb0b:	f7 f1                	div    %ecx
    eb0d:	41 c1 e4 10          	shl    $0x10,%r12d
    eb11:	49 01 c4             	add    %rax,%r12
    eb14:	48 c1 e2 10          	shl    $0x10,%rdx
    eb18:	0f b7 cd             	movzwl %bp,%ecx
    eb1b:	48 09 d1             	or     %rdx,%rcx
    eb1e:	48 0f af c0          	imul   %rax,%rax
    eb22:	31 d2                	xor    %edx,%edx
    eb24:	48 29 c1             	sub    %rax,%rcx
    eb27:	4b 8d 44 24 ff       	lea    -0x1(%r12,%r12,1),%rax
    eb2c:	48 0f 42 d0          	cmovb  %rax,%rdx
    eb30:	49 83 dc 00          	sbb    $0x0,%r12
    eb34:	48 8d 3c 11          	lea    (%rcx,%rdx,1),%rdi
    eb38:	4b 8d 14 24          	lea    (%r12,%r12,1),%rdx
    eb3c:	4c 89 e1             	mov    %r12,%rcx
    eb3f:	48 c1 e9 3f          	shr    $0x3f,%rcx
    eb43:	48 89 fe             	mov    %rdi,%rsi
    eb46:	48 c1 ee 20          	shr    $0x20,%rsi
    eb4a:	4c 0f a4 ff 20       	shld   $0x20,%r15,%rdi
    eb4f:	ff 15 1b 24 05 00    	call   *0x5241b(%rip)        # 60f70 <_GLOBAL_OFFSET_TABLE_+0x9b8>
    eb55:	48 89 d6             	mov    %rdx,%rsi
    eb58:	49 c1 e4 20          	shl    $0x20,%r12
    eb5c:	49 01 c4             	add    %rax,%r12
    eb5f:	48 83 d6 00          	adc    $0x0,%rsi
    eb63:	48 89 f0             	mov    %rsi,%rax
    eb66:	49 f7 e4             	mul    %r12
    eb69:	0f 90 c1             	seto   %cl
    eb6c:	48 85 f6             	test   %rsi,%rsi
    eb6f:	40 0f 95 c7          	setne  %dil
    eb73:	40 08 cf             	or     %cl,%dil
    eb76:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
    eb7a:	4c 89 e0             	mov    %r12,%rax
    eb7d:	49 f7 e4             	mul    %r12
    eb80:	48 01 ca             	add    %rcx,%rdx
    eb83:	0f 92 c1             	setb   %cl
    eb86:	40 08 f9             	or     %dil,%cl
    eb89:	49 39 c7             	cmp    %rax,%r15
    eb8c:	48 19 d5             	sbb    %rdx,%rbp
    eb8f:	0f 92 c0             	setb   %al
    eb92:	08 c8                	or     %cl,%al
    eb94:	0f b6 c0             	movzbl %al,%eax
    eb97:	49 29 c4             	sub    %rax,%r12
    eb9a:	48 83 de 00          	sbb    $0x0,%rsi
    eb9e:	41 d1 ed             	shr    $1,%r13d
    eba1:	44 89 e9             	mov    %r13d,%ecx
    eba4:	49 0f ad f4          	shrd   %cl,%rsi,%r12
    eba8:	48 d3 ee             	shr    %cl,%rsi
    ebab:	4c 8b 14 24          	mov    (%rsp),%r10
    ebaf:	e9 3f 01 00 00       	jmp    ecf3 <hyperinterval::sqrt::integer_sqrt_bounds+0x443>
    ebb4:	0f bd f3             	bsr    %ebx,%esi
    ebb7:	83 f6 1f             	xor    $0x1f,%esi
    ebba:	89 f1                	mov    %esi,%ecx
    ebbc:	80 e1 1e             	and    $0x1e,%cl
    ebbf:	49 89 d9             	mov    %rbx,%r9
    ebc2:	d3 e3                	shl    %cl,%ebx
    ebc4:	89 d8                	mov    %ebx,%eax
    ebc6:	c1 e8 18             	shr    $0x18,%eax
    ebc9:	48 8d 15 8c fd 03 00 	lea    0x3fd8c(%rip),%rdx        # 4e95c <_fini+0x1260>
    ebd0:	0f b6 0c 42          	movzbl (%rdx,%rax,2),%ecx
    ebd4:	0f b6 54 42 01       	movzbl 0x1(%rdx,%rax,2),%edx
    ebd9:	89 cf                	mov    %ecx,%edi
    ebdb:	01 cf                	add    %ecx,%edi
    ebdd:	c1 e2 04             	shl    $0x4,%edx
    ebe0:	89 d8                	mov    %ebx,%eax
    ebe2:	c1 e8 14             	shr    $0x14,%eax
    ebe5:	83 e0 0f             	and    $0xf,%eax
    ebe8:	09 d0                	or     %edx,%eax
    ebea:	31 d2                	xor    %edx,%edx
    ebec:	66 f7 f7             	div    %di
    ebef:	89 df                	mov    %ebx,%edi
    ebf1:	c1 ef 10             	shr    $0x10,%edi
    ebf4:	45 31 c0             	xor    %r8d,%r8d
    ebf7:	c0 e1 04             	shl    $0x4,%cl
    ebfa:	0f b6 c9             	movzbl %cl,%ecx
    ebfd:	01 c1                	add    %eax,%ecx
    ebff:	c1 e2 04             	shl    $0x4,%edx
    ec02:	83 e7 0f             	and    $0xf,%edi
    ec05:	09 d7                	or     %edx,%edi
    ec07:	0f af c0             	imul   %eax,%eax
    ec0a:	66 29 c7             	sub    %ax,%di
    ec0d:	8d 44 09 ff          	lea    -0x1(%rcx,%rcx,1),%eax
    ec11:	41 0f 43 c0          	cmovae %r8d,%eax
    ec15:	66 83 d9 00          	sbb    $0x0,%cx
    ec19:	01 f8                	add    %edi,%eax
    ec1b:	0f b7 f9             	movzwl %cx,%edi
    ec1e:	01 ff                	add    %edi,%edi
    ec20:	0f b7 d0             	movzwl %ax,%edx
    ec23:	c1 e2 08             	shl    $0x8,%edx
    ec26:	0f b6 c7             	movzbl %bh,%eax
    ec29:	09 d0                	or     %edx,%eax
    ec2b:	31 d2                	xor    %edx,%edx
    ec2d:	f7 f7                	div    %edi
    ec2f:	c1 e1 08             	shl    $0x8,%ecx
    ec32:	0f b7 f9             	movzwl %cx,%edi
    ec35:	01 c7                	add    %eax,%edi
    ec37:	89 f8                	mov    %edi,%eax
    ec39:	f7 e7                	mul    %edi
    ec3b:	0f 90 c1             	seto   %cl
    ec3e:	39 d8                	cmp    %ebx,%eax
    ec40:	4c 89 cb             	mov    %r9,%rbx
    ec43:	0f 97 c0             	seta   %al
    ec46:	08 c8                	or     %cl,%al
    ec48:	0f b6 c0             	movzbl %al,%eax
    ec4b:	29 c7                	sub    %eax,%edi
    ec4d:	d1 ee                	shr    $1,%esi
    ec4f:	89 f1                	mov    %esi,%ecx
    ec51:	d3 ef                	shr    %cl,%edi
    ec53:	e9 96 00 00 00       	jmp    ecee <hyperinterval::sqrt::integer_sqrt_bounds+0x43e>
    ec58:	31 d2                	xor    %edx,%edx
    ec5a:	f7 f1                	div    %ecx
    ec5c:	41 c1 e4 10          	shl    $0x10,%r12d
    ec60:	49 01 c4             	add    %rax,%r12
    ec63:	4c 89 e0             	mov    %r12,%rax
    ec66:	49 f7 e4             	mul    %r12
    ec69:	0f 90 c1             	seto   %cl
    ec6c:	48 39 f8             	cmp    %rdi,%rax
    ec6f:	0f 97 c0             	seta   %al
    ec72:	08 c8                	or     %cl,%al
    ec74:	0f b6 c0             	movzbl %al,%eax
    ec77:	49 29 c4             	sub    %rax,%r12
    ec7a:	d1 ee                	shr    $1,%esi
    ec7c:	89 f1                	mov    %esi,%ecx
    ec7e:	49 d3 ec             	shr    %cl,%r12
    ec81:	eb 6e                	jmp    ecf1 <hyperinterval::sqrt::integer_sqrt_bounds+0x441>
    ec83:	66 0f bd f3          	bsr    %bx,%si
    ec87:	83 f6 0f             	xor    $0xf,%esi
    ec8a:	89 f1                	mov    %esi,%ecx
    ec8c:	80 e1 0e             	and    $0xe,%cl
    ec8f:	49 89 d9             	mov    %rbx,%r9
    ec92:	d3 e3                	shl    %cl,%ebx
    ec94:	0f b6 c7             	movzbl %bh,%eax
    ec97:	48 8d 0d be fc 03 00 	lea    0x3fcbe(%rip),%rcx        # 4e95c <_fini+0x1260>
    ec9e:	0f b6 3c 41          	movzbl (%rcx,%rax,2),%edi
    eca2:	0f b6 4c 41 01       	movzbl 0x1(%rcx,%rax,2),%ecx
    eca7:	41 89 f8             	mov    %edi,%r8d
    ecaa:	41 01 f8             	add    %edi,%r8d
    ecad:	c1 e1 04             	shl    $0x4,%ecx
    ecb0:	89 d8                	mov    %ebx,%eax
    ecb2:	c1 e8 04             	shr    $0x4,%eax
    ecb5:	83 e0 0f             	and    $0xf,%eax
    ecb8:	09 c8                	or     %ecx,%eax
    ecba:	31 d2                	xor    %edx,%edx
    ecbc:	66 41 f7 f0          	div    %r8w
    ecc0:	40 c0 e7 04          	shl    $0x4,%dil
    ecc4:	40 0f b6 cf          	movzbl %dil,%ecx
    ecc8:	01 c1                	add    %eax,%ecx
    ecca:	89 c8                	mov    %ecx,%eax
    eccc:	66 f7 e1             	mul    %cx
    eccf:	0f 90 c2             	seto   %dl
    ecd2:	66 39 d8             	cmp    %bx,%ax
    ecd5:	4c 89 cb             	mov    %r9,%rbx
    ecd8:	0f 97 c0             	seta   %al
    ecdb:	08 d0                	or     %dl,%al
    ecdd:	0f b6 c0             	movzbl %al,%eax
    ece0:	29 c1                	sub    %eax,%ecx
    ece2:	0f b7 c1             	movzwl %cx,%eax
    ece5:	d1 ee                	shr    $1,%esi
    ece7:	89 f1                	mov    %esi,%ecx
    ece9:	d3 e8                	shr    %cl,%eax
    eceb:	0f b7 f8             	movzwl %ax,%edi
    ecee:	41 89 fc             	mov    %edi,%r12d
    ecf1:	31 f6                	xor    %esi,%esi
    ecf3:	4c 89 e1             	mov    %r12,%rcx
    ecf6:	48 0f af ce          	imul   %rsi,%rcx
    ecfa:	4c 89 e0             	mov    %r12,%rax
    ecfd:	49 f7 e4             	mul    %r12
    ed00:	48 01 ca             	add    %rcx,%rdx
    ed03:	48 01 ca             	add    %rcx,%rdx
    ed06:	4c 31 d2             	xor    %r10,%rdx
    ed09:	48 31 d8             	xor    %rbx,%rax
    ed0c:	31 c9                	xor    %ecx,%ecx
    ed0e:	48 09 d0             	or     %rdx,%rax
    ed11:	0f 95 c1             	setne  %cl
    ed14:	4c 01 e1             	add    %r12,%rcx
    ed17:	49 89 76 08          	mov    %rsi,0x8(%r14)
    ed1b:	48 83 d6 00          	adc    $0x0,%rsi
    ed1f:	4d 89 26             	mov    %r12,(%r14)
    ed22:	49 89 4e 10          	mov    %rcx,0x10(%r14)
    ed26:	49 89 76 18          	mov    %rsi,0x18(%r14)
    ed2a:	4c 89 f0             	mov    %r14,%rax
    ed2d:	48 83 c4 08          	add    $0x8,%rsp
    ed31:	5b                   	pop    %rbx
    ed32:	41 5c                	pop    %r12
    ed34:	41 5d                	pop    %r13
    ed36:	41 5e                	pop    %r14
    ed38:	41 5f                	pop    %r15
    ed3a:	5d                   	pop    %rbp
    ed3b:	c3                   	ret
    ed3c:	0f 1f 40 00          	nopl   0x0(%rax)

hyperinterval::ieee::Format::finite:
    ed40:	48 89 f8             	mov    %rdi,%rax
    ed43:	48 89 cf             	mov    %rcx,%rdi
    ed46:	48 f7 d7             	not    %rdi
    ed49:	48 85 fa             	test   %rdi,%rdx
    ed4c:	75 09                	jne    ed57 <hyperinterval::ieee::Format::finite+0x17>
    ed4e:	c6 40 01 00          	movb   $0x0,0x1(%rax)
    ed52:	b1 01                	mov    $0x1,%cl
    ed54:	88 08                	mov    %cl,(%rax)
    ed56:	c3                   	ret
    ed57:	48 ff ce             	dec    %rsi
    ed5a:	48 85 f1             	test   %rsi,%rcx
    ed5d:	74 09                	je     ed68 <hyperinterval::ieee::Format::finite+0x28>
    ed5f:	48 89 48 08          	mov    %rcx,0x8(%rax)
    ed63:	31 c9                	xor    %ecx,%ecx
    ed65:	88 08                	mov    %cl,(%rax)
    ed67:	c3                   	ret
    ed68:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
    ed6f:	00 
    ed70:	31 c9                	xor    %ecx,%ecx
    ed72:	88 08                	mov    %cl,(%rax)
    ed74:	c3                   	ret
    ed75:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    ed7c:	00 00 00 
    ed7f:	90                   	nop

hyperinterval::ieee::Format::sqrt:
    ed80:	55                   	push   %rbp
    ed81:	41 57                	push   %r15
    ed83:	41 56                	push   %r14
    ed85:	41 55                	push   %r13
    ed87:	41 54                	push   %r12
    ed89:	53                   	push   %rbx
    ed8a:	48 83 ec 38          	sub    $0x38,%rsp
    ed8e:	49 89 c8             	mov    %rcx,%r8
    ed91:	49 89 d6             	mov    %rdx,%r14
    ed94:	41 bc 40 00 00 00    	mov    $0x40,%r12d
    ed9a:	f3 4c 0f bc e2       	tzcnt  %rdx,%r12
    ed9f:	48 89 ca             	mov    %rcx,%rdx
    eda2:	4c 21 f2             	and    %r14,%rdx
    eda5:	45 89 e7             	mov    %r12d,%r15d
    eda8:	41 83 e7 3f          	and    $0x3f,%r15d
    edac:	44 89 f9             	mov    %r15d,%ecx
    edaf:	48 d3 ea             	shr    %cl,%rdx
    edb2:	be 01 00 00 00       	mov    $0x1,%esi
    edb7:	48 d3 e6             	shl    %cl,%rsi
    edba:	48 89 f8             	mov    %rdi,%rax
    edbd:	48 8d 7e ff          	lea    -0x1(%rsi),%rdi
    edc1:	4c 21 c7             	and    %r8,%rdi
    edc4:	48 85 d2             	test   %rdx,%rdx
    edc7:	48 0f 44 f2          	cmove  %rdx,%rsi
    edcb:	49 d3 ee             	shr    %cl,%r14
    edce:	48 09 fe             	or     %rdi,%rsi
    edd1:	0f 84 a0 00 00 00    	je     ee77 <hyperinterval::ieee::Format::sqrt+0xf7>
    edd7:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    eddc:	49 d1 ee             	shr    $1,%r14
    eddf:	48 85 d2             	test   %rdx,%rdx
    ede2:	b9 01 00 00 00       	mov    $0x1,%ecx
    ede7:	0f 45 ca             	cmovne %edx,%ecx
    edea:	44 29 f1             	sub    %r14d,%ecx
    eded:	44 29 e1             	sub    %r12d,%ecx
    edf0:	48 0f bd ee          	bsr    %rsi,%rbp
    edf4:	83 f5 3f             	xor    $0x3f,%ebp
    edf7:	83 cd 40             	or     $0x40,%ebp
    edfa:	83 f5 7f             	xor    $0x7f,%ebp
    edfd:	01 cd                	add    %ecx,%ebp
    edff:	d1 fd                	sar    $1,%ebp
    ee01:	41 89 ed             	mov    %ebp,%r13d
    ee04:	45 29 e5             	sub    %r12d,%r13d
    ee07:	44 29 e9             	sub    %r13d,%ecx
    ee0a:	44 29 e9             	sub    %r13d,%ecx
    ee0d:	31 d2                	xor    %edx,%edx
    ee0f:	48 0f a5 f2          	shld   %cl,%rsi,%rdx
    ee13:	31 db                	xor    %ebx,%ebx
    ee15:	48 d3 e6             	shl    %cl,%rsi
    ee18:	f6 c1 40             	test   $0x40,%cl
    ee1b:	48 0f 45 d6          	cmovne %rsi,%rdx
    ee1f:	48 0f 45 f3          	cmovne %rbx,%rsi
    ee23:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    ee28:	e8 83 fa ff ff       	call   e8b0 <hyperinterval::sqrt::integer_sqrt_bounds>
    ee2d:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
    ee32:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
    ee37:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
    ee3c:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    ee41:	4c 89 c0             	mov    %r8,%rax
    ee44:	48 09 f8             	or     %rdi,%rax
    ee47:	74 59                	je     eea2 <hyperinterval::ieee::Format::sqrt+0x122>
    ee49:	48 0f bd c7          	bsr    %rdi,%rax
    ee4d:	83 f0 3f             	xor    $0x3f,%eax
    ee50:	4d 0f bd c8          	bsr    %r8,%r9
    ee54:	41 83 f1 3f          	xor    $0x3f,%r9d
    ee58:	41 83 c9 40          	or     $0x40,%r9d
    ee5c:	48 85 ff             	test   %rdi,%rdi
    ee5f:	44 0f 45 c8          	cmovne %eax,%r9d
    ee63:	41 83 f1 7f          	xor    $0x7f,%r9d
    ee67:	47 8d 14 29          	lea    (%r9,%r13,1),%r10d
    ee6b:	45 39 f2             	cmp    %r14d,%r10d
    ee6e:	7e 13                	jle    ee83 <hyperinterval::ieee::Format::sqrt+0x103>
    ee70:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    ee75:	eb 5e                	jmp    eed5 <hyperinterval::ieee::Format::sqrt+0x155>
    ee77:	0f 57 c0             	xorps  %xmm0,%xmm0
    ee7a:	0f 11 40 08          	movups %xmm0,0x8(%rax)
    ee7e:	e9 43 01 00 00       	jmp    efc6 <hyperinterval::ieee::Format::sqrt+0x246>
    ee83:	b8 01 00 00 00       	mov    $0x1,%eax
    ee88:	44 29 f0             	sub    %r14d,%eax
    ee8b:	41 39 c2             	cmp    %eax,%r10d
    ee8e:	7d 78                	jge    ef08 <hyperinterval::ieee::Format::sqrt+0x188>
    ee90:	41 8d 0c 2e          	lea    (%r14,%rbp,1),%ecx
    ee94:	fe c9                	dec    %cl
    ee96:	49 d3 e0             	shl    %cl,%r8
    ee99:	31 db                	xor    %ebx,%ebx
    ee9b:	f6 c1 40             	test   $0x40,%cl
    ee9e:	49 0f 44 d8          	cmove  %r8,%rbx
    eea2:	48 89 f0             	mov    %rsi,%rax
    eea5:	48 09 d0             	or     %rdx,%rax
    eea8:	0f 84 b4 00 00 00    	je     ef62 <hyperinterval::ieee::Format::sqrt+0x1e2>
    eeae:	48 0f bd c2          	bsr    %rdx,%rax
    eeb2:	83 f0 3f             	xor    $0x3f,%eax
    eeb5:	48 0f bd fe          	bsr    %rsi,%rdi
    eeb9:	83 f7 3f             	xor    $0x3f,%edi
    eebc:	83 cf 40             	or     $0x40,%edi
    eebf:	48 85 d2             	test   %rdx,%rdx
    eec2:	0f 45 f8             	cmovne %eax,%edi
    eec5:	83 f7 7f             	xor    $0x7f,%edi
    eec8:	41 01 fd             	add    %edi,%r13d
    eecb:	45 39 f5             	cmp    %r14d,%r13d
    eece:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    eed3:	7e 0b                	jle    eee0 <hyperinterval::ieee::Format::sqrt+0x160>
    eed5:	c6 40 01 03          	movb   $0x3,0x1(%rax)
    eed9:	b1 01                	mov    $0x1,%cl
    eedb:	e9 e8 00 00 00       	jmp    efc8 <hyperinterval::ieee::Format::sqrt+0x248>
    eee0:	b9 01 00 00 00       	mov    $0x1,%ecx
    eee5:	44 29 f1             	sub    %r14d,%ecx
    eee8:	41 39 cd             	cmp    %ecx,%r13d
    eeeb:	7d 7e                	jge    ef6b <hyperinterval::ieee::Format::sqrt+0x1eb>
    eeed:	41 01 ee             	add    %ebp,%r14d
    eef0:	41 fe ce             	dec    %r14b
    eef3:	44 89 f1             	mov    %r14d,%ecx
    eef6:	48 d3 e6             	shl    %cl,%rsi
    eef9:	31 ff                	xor    %edi,%edi
    eefb:	41 f6 c6 40          	test   $0x40,%r14b
    eeff:	48 0f 44 fe          	cmove  %rsi,%rdi
    ef03:	e9 b6 00 00 00       	jmp    efbe <hyperinterval::ieee::Format::sqrt+0x23e>
    ef08:	44 89 e1             	mov    %r12d,%ecx
    ef0b:	44 29 c9             	sub    %r9d,%ecx
    ef0e:	89 c8                	mov    %ecx,%eax
    ef10:	f7 d8                	neg    %eax
    ef12:	4d 89 c3             	mov    %r8,%r11
    ef15:	49 d3 e3             	shl    %cl,%r11
    ef18:	31 db                	xor    %ebx,%ebx
    ef1a:	f6 c1 40             	test   $0x40,%cl
    ef1d:	49 0f 44 db          	cmove  %r11,%rbx
    ef21:	89 c1                	mov    %eax,%ecx
    ef23:	49 0f ad f8          	shrd   %cl,%rdi,%r8
    ef27:	48 d3 ef             	shr    %cl,%rdi
    ef2a:	a8 40                	test   $0x40,%al
    ef2c:	49 0f 44 f8          	cmove  %r8,%rdi
    ef30:	45 39 cc             	cmp    %r9d,%r12d
    ef33:	48 0f 43 fb          	cmovae %rbx,%rdi
    ef37:	45 01 f2             	add    %r14d,%r10d
    ef3a:	49 63 c2             	movslq %r10d,%rax
    ef3d:	44 89 f9             	mov    %r15d,%ecx
    ef40:	48 d3 e0             	shl    %cl,%rax
    ef43:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
    ef4a:	48 d3 e3             	shl    %cl,%rbx
    ef4d:	48 f7 d3             	not    %rbx
    ef50:	48 21 fb             	and    %rdi,%rbx
    ef53:	48 09 c3             	or     %rax,%rbx
    ef56:	48 89 f0             	mov    %rsi,%rax
    ef59:	48 09 d0             	or     %rdx,%rax
    ef5c:	0f 85 4c ff ff ff    	jne    eeae <hyperinterval::ieee::Format::sqrt+0x12e>
    ef62:	31 ff                	xor    %edi,%edi
    ef64:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    ef69:	eb 53                	jmp    efbe <hyperinterval::ieee::Format::sqrt+0x23e>
    ef6b:	44 89 e1             	mov    %r12d,%ecx
    ef6e:	29 f9                	sub    %edi,%ecx
    ef70:	41 89 ca             	mov    %ecx,%r10d
    ef73:	41 f7 da             	neg    %r10d
    ef76:	49 89 f0             	mov    %rsi,%r8
    ef79:	49 d3 e0             	shl    %cl,%r8
    ef7c:	45 31 c9             	xor    %r9d,%r9d
    ef7f:	f6 c1 40             	test   $0x40,%cl
    ef82:	4d 0f 44 c8          	cmove  %r8,%r9
    ef86:	44 89 d1             	mov    %r10d,%ecx
    ef89:	48 0f ad d6          	shrd   %cl,%rdx,%rsi
    ef8d:	48 d3 ea             	shr    %cl,%rdx
    ef90:	41 f6 c2 40          	test   $0x40,%r10b
    ef94:	48 0f 44 d6          	cmove  %rsi,%rdx
    ef98:	41 39 fc             	cmp    %edi,%r12d
    ef9b:	49 0f 43 d1          	cmovae %r9,%rdx
    ef9f:	45 01 f5             	add    %r14d,%r13d
    efa2:	49 63 f5             	movslq %r13d,%rsi
    efa5:	44 89 f9             	mov    %r15d,%ecx
    efa8:	48 d3 e6             	shl    %cl,%rsi
    efab:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
    efb2:	48 d3 e7             	shl    %cl,%rdi
    efb5:	48 f7 d7             	not    %rdi
    efb8:	48 21 d7             	and    %rdx,%rdi
    efbb:	48 09 f7             	or     %rsi,%rdi
    efbe:	48 89 58 08          	mov    %rbx,0x8(%rax)
    efc2:	48 89 78 10          	mov    %rdi,0x10(%rax)
    efc6:	31 c9                	xor    %ecx,%ecx
    efc8:	88 08                	mov    %cl,(%rax)
    efca:	48 83 c4 38          	add    $0x38,%rsp
    efce:	5b                   	pop    %rbx
    efcf:	41 5c                	pop    %r12
    efd1:	41 5d                	pop    %r13
    efd3:	41 5e                	pop    %r14
    efd5:	41 5f                	pop    %r15
    efd7:	5d                   	pop    %rbp
    efd8:	c3                   	ret
    efd9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

hyperinterval::ieee::Format::rounded:
    efe0:	48 89 c8             	mov    %rcx,%rax
    efe3:	4c 8b 11             	mov    (%rcx),%r10
    efe6:	4c 8b 59 08          	mov    0x8(%rcx),%r11
    efea:	4c 89 d1             	mov    %r10,%rcx
    efed:	4c 09 d9             	or     %r11,%rcx
    eff0:	74 79                	je     f06b <hyperinterval::ieee::Format::rounded+0x8b>
    eff2:	55                   	push   %rbp
    eff3:	41 57                	push   %r15
    eff5:	41 56                	push   %r14
    eff7:	41 55                	push   %r13
    eff9:	41 54                	push   %r12
    effb:	53                   	push   %rbx
    effc:	8b 68 10             	mov    0x10(%rax),%ebp
    efff:	49 0f bd cb          	bsr    %r11,%rcx
    f003:	83 f1 3f             	xor    $0x3f,%ecx
    f006:	4d 0f bd f2          	bsr    %r10,%r14
    f00a:	41 83 f6 3f          	xor    $0x3f,%r14d
    f00e:	41 83 ce 40          	or     $0x40,%r14d
    f012:	4d 85 db             	test   %r11,%r11
    f015:	44 0f 45 f1          	cmovne %ecx,%r14d
    f019:	bb 40 00 00 00       	mov    $0x40,%ebx
    f01e:	f3 48 0f bc da       	tzcnt  %rdx,%rbx
    f023:	41 89 d8             	mov    %ebx,%r8d
    f026:	41 83 e0 3f          	and    $0x3f,%r8d
    f02a:	44 89 c1             	mov    %r8d,%ecx
    f02d:	48 d3 ea             	shr    %cl,%rdx
    f030:	41 83 f6 7f          	xor    $0x7f,%r14d
    f034:	41 01 ee             	add    %ebp,%r14d
    f037:	48 d1 ea             	shr    $1,%rdx
    f03a:	41 39 d6             	cmp    %edx,%r14d
    f03d:	0f 8f 54 01 00 00    	jg     f197 <hyperinterval::ieee::Format::rounded+0x1b7>
    f043:	44 8d 2c 13          	lea    (%rbx,%rdx,1),%r13d
    f047:	b9 01 00 00 00       	mov    $0x1,%ecx
    f04c:	44 29 e9             	sub    %r13d,%ecx
    f04f:	41 29 de             	sub    %ebx,%r14d
    f052:	41 39 ce             	cmp    %ecx,%r14d
    f055:	44 0f 4e f1          	cmovle %ecx,%r14d
    f059:	44 89 f1             	mov    %r14d,%ecx
    f05c:	29 e9                	sub    %ebp,%ecx
    f05e:	83 f9 7f             	cmp    $0x7f,%ecx
    f061:	7e 13                	jle    f076 <hyperinterval::ieee::Format::rounded+0x96>
    f063:	41 b4 01             	mov    $0x1,%r12b
    f066:	e9 ea 00 00 00       	jmp    f155 <hyperinterval::ieee::Format::rounded+0x175>
    f06b:	c6 07 00             	movb   $0x0,(%rdi)
    f06e:	0f 57 c0             	xorps  %xmm0,%xmm0
    f071:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
    f075:	c3                   	ret
    f076:	85 c9                	test   %ecx,%ecx
    f078:	4c 89 6c 24 f0       	mov    %r13,-0x10(%rsp)
    f07d:	0f 8e ad 00 00 00    	jle    f130 <hyperinterval::ieee::Format::rounded+0x150>
    f083:	4d 89 d7             	mov    %r10,%r15
    f086:	4d 0f ad df          	shrd   %cl,%r11,%r15
    f08a:	4d 89 dd             	mov    %r11,%r13
    f08d:	49 d3 ed             	shr    %cl,%r13
    f090:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
    f097:	49 d3 e4             	shl    %cl,%r12
    f09a:	48 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%rbp
    f0a1:	45 31 c9             	xor    %r9d,%r9d
    f0a4:	f6 c1 40             	test   $0x40,%cl
    f0a7:	4d 0f 45 fd          	cmovne %r13,%r15
    f0ab:	4d 0f 45 e9          	cmovne %r9,%r13
    f0af:	49 0f 45 ec          	cmovne %r12,%rbp
    f0b3:	4d 0f 45 e1          	cmovne %r9,%r12
    f0b7:	49 f7 d4             	not    %r12
    f0ba:	48 f7 d5             	not    %rbp
    f0bd:	4c 21 dd             	and    %r11,%rbp
    f0c0:	4d 21 d4             	and    %r10,%r12
    f0c3:	49 09 ec             	or     %rbp,%r12
    f0c6:	41 0f 95 c4          	setne  %r12b
    f0ca:	4d 89 eb             	mov    %r13,%r11
    f0cd:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
    f0d2:	4c 89 f9             	mov    %r15,%rcx
    f0d5:	4c 09 d9             	or     %r11,%rcx
    f0d8:	74 7b                	je     f155 <hyperinterval::ieee::Format::rounded+0x175>
    f0da:	49 0f bd cb          	bsr    %r11,%rcx
    f0de:	83 f1 3f             	xor    $0x3f,%ecx
    f0e1:	4d 0f bd ef          	bsr    %r15,%r13
    f0e5:	41 83 f5 3f          	xor    $0x3f,%r13d
    f0e9:	41 83 cd 40          	or     $0x40,%r13d
    f0ed:	4d 85 db             	test   %r11,%r11
    f0f0:	44 0f 45 e9          	cmovne %ecx,%r13d
    f0f4:	41 83 f5 7f          	xor    $0x7f,%r13d
    f0f8:	43 8d 2c 2e          	lea    (%r14,%r13,1),%ebp
    f0fc:	39 d5                	cmp    %edx,%ebp
    f0fe:	0f 8f 93 00 00 00    	jg     f197 <hyperinterval::ieee::Format::rounded+0x1b7>
    f104:	b9 01 00 00 00       	mov    $0x1,%ecx
    f109:	29 d1                	sub    %edx,%ecx
    f10b:	39 cd                	cmp    %ecx,%ebp
    f10d:	0f 8d 53 01 00 00    	jge    f266 <hyperinterval::ieee::Format::rounded+0x286>
    f113:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
    f118:	43 8d 0c 2e          	lea    (%r14,%r13,1),%ecx
    f11c:	fe c9                	dec    %cl
    f11e:	4d 89 f9             	mov    %r15,%r9
    f121:	49 d3 e1             	shl    %cl,%r9
    f124:	45 31 d2             	xor    %r10d,%r10d
    f127:	f6 c1 40             	test   $0x40,%cl
    f12a:	4d 0f 44 d1          	cmove  %r9,%r10
    f12e:	eb 2e                	jmp    f15e <hyperinterval::ieee::Format::rounded+0x17e>
    f130:	f6 d9                	neg    %cl
    f132:	4d 0f a5 d3          	shld   %cl,%r10,%r11
    f136:	49 d3 e2             	shl    %cl,%r10
    f139:	45 31 e4             	xor    %r12d,%r12d
    f13c:	f6 c1 40             	test   $0x40,%cl
    f13f:	4d 0f 45 da          	cmovne %r10,%r11
    f143:	41 bf 00 00 00 00    	mov    $0x0,%r15d
    f149:	4d 0f 44 fa          	cmove  %r10,%r15
    f14d:	4c 89 f9             	mov    %r15,%rcx
    f150:	4c 09 d9             	or     %r11,%rcx
    f153:	75 85                	jne    f0da <hyperinterval::ieee::Format::rounded+0xfa>
    f155:	45 31 ff             	xor    %r15d,%r15d
    f158:	45 31 db             	xor    %r11d,%r11d
    f15b:	45 31 d2             	xor    %r10d,%r10d
    f15e:	45 0f b6 e4          	movzbl %r12b,%r12d
    f162:	4d 01 fc             	add    %r15,%r12
    f165:	49 83 d3 00          	adc    $0x0,%r11
    f169:	4c 89 e1             	mov    %r12,%rcx
    f16c:	4c 09 d9             	or     %r11,%rcx
    f16f:	74 30                	je     f1a1 <hyperinterval::ieee::Format::rounded+0x1c1>
    f171:	49 0f bd cb          	bsr    %r11,%rcx
    f175:	83 f1 3f             	xor    $0x3f,%ecx
    f178:	4d 0f bd fc          	bsr    %r12,%r15
    f17c:	41 83 f7 3f          	xor    $0x3f,%r15d
    f180:	41 83 cf 40          	or     $0x40,%r15d
    f184:	4d 85 db             	test   %r11,%r11
    f187:	44 0f 45 f9          	cmovne %ecx,%r15d
    f18b:	41 83 f7 7f          	xor    $0x7f,%r15d
    f18f:	43 8d 2c 37          	lea    (%r15,%r14,1),%ebp
    f193:	39 d5                	cmp    %edx,%ebp
    f195:	7e 1b                	jle    f1b2 <hyperinterval::ieee::Format::rounded+0x1d2>
    f197:	66 c7 07 01 03       	movw   $0x301,(%rdi)
    f19c:	e9 ba 00 00 00       	jmp    f25b <hyperinterval::ieee::Format::rounded+0x27b>
    f1a1:	31 d2                	xor    %edx,%edx
    f1a3:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
    f1a7:	0f 84 86 00 00 00    	je     f233 <hyperinterval::ieee::Format::rounded+0x253>
    f1ad:	e9 9e 00 00 00       	jmp    f250 <hyperinterval::ieee::Format::rounded+0x270>
    f1b2:	b9 01 00 00 00       	mov    $0x1,%ecx
    f1b7:	29 d1                	sub    %edx,%ecx
    f1b9:	39 cd                	cmp    %ecx,%ebp
    f1bb:	7d 1e                	jge    f1db <hyperinterval::ieee::Format::rounded+0x1fb>
    f1bd:	45 01 f5             	add    %r14d,%r13d
    f1c0:	41 fe cd             	dec    %r13b
    f1c3:	44 89 e9             	mov    %r13d,%ecx
    f1c6:	49 d3 e4             	shl    %cl,%r12
    f1c9:	31 d2                	xor    %edx,%edx
    f1cb:	41 f6 c5 40          	test   $0x40,%r13b
    f1cf:	49 0f 44 d4          	cmove  %r12,%rdx
    f1d3:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
    f1d7:	74 5a                	je     f233 <hyperinterval::ieee::Format::rounded+0x253>
    f1d9:	eb 75                	jmp    f250 <hyperinterval::ieee::Format::rounded+0x270>
    f1db:	89 d9                	mov    %ebx,%ecx
    f1dd:	44 29 f9             	sub    %r15d,%ecx
    f1e0:	41 89 c9             	mov    %ecx,%r9d
    f1e3:	41 f7 d9             	neg    %r9d
    f1e6:	4d 89 e6             	mov    %r12,%r14
    f1e9:	49 d3 e6             	shl    %cl,%r14
    f1ec:	45 31 ed             	xor    %r13d,%r13d
    f1ef:	f6 c1 40             	test   $0x40,%cl
    f1f2:	4d 0f 44 ee          	cmove  %r14,%r13
    f1f6:	44 89 c9             	mov    %r9d,%ecx
    f1f9:	4d 0f ad dc          	shrd   %cl,%r11,%r12
    f1fd:	49 d3 eb             	shr    %cl,%r11
    f200:	41 f6 c1 40          	test   $0x40,%r9b
    f204:	4d 0f 44 dc          	cmove  %r12,%r11
    f208:	44 39 fb             	cmp    %r15d,%ebx
    f20b:	4d 0f 43 dd          	cmovae %r13,%r11
    f20f:	01 d5                	add    %edx,%ebp
    f211:	4c 63 cd             	movslq %ebp,%r9
    f214:	44 89 c1             	mov    %r8d,%ecx
    f217:	49 d3 e1             	shl    %cl,%r9
    f21a:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    f221:	48 d3 e2             	shl    %cl,%rdx
    f224:	48 f7 d2             	not    %rdx
    f227:	4c 21 da             	and    %r11,%rdx
    f22a:	4c 09 ca             	or     %r9,%rdx
    f22d:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
    f231:	75 1d                	jne    f250 <hyperinterval::ieee::Format::rounded+0x270>
    f233:	48 89 d0             	mov    %rdx,%rax
    f236:	48 31 f0             	xor    %rsi,%rax
    f239:	48 85 d2             	test   %rdx,%rdx
    f23c:	48 0f 44 c2          	cmove  %rdx,%rax
    f240:	4c 31 d6             	xor    %r10,%rsi
    f243:	4d 85 d2             	test   %r10,%r10
    f246:	49 0f 44 f2          	cmove  %r10,%rsi
    f24a:	49 89 c2             	mov    %rax,%r10
    f24d:	48 89 f2             	mov    %rsi,%rdx
    f250:	4c 89 57 08          	mov    %r10,0x8(%rdi)
    f254:	48 89 57 10          	mov    %rdx,0x10(%rdi)
    f258:	c6 07 00             	movb   $0x0,(%rdi)
    f25b:	5b                   	pop    %rbx
    f25c:	41 5c                	pop    %r12
    f25e:	41 5d                	pop    %r13
    f260:	41 5e                	pop    %r14
    f262:	41 5f                	pop    %r15
    f264:	5d                   	pop    %rbp
    f265:	c3                   	ret
    f266:	89 d9                	mov    %ebx,%ecx
    f268:	44 29 e9             	sub    %r13d,%ecx
    f26b:	4d 89 f9             	mov    %r15,%r9
    f26e:	49 d3 e1             	shl    %cl,%r9
    f271:	41 89 ca             	mov    %ecx,%r10d
    f274:	41 f7 da             	neg    %r10d
    f277:	48 c7 44 24 e8 00 00 	movq   $0x0,-0x18(%rsp)
    f27e:	00 00 
    f280:	f6 c1 40             	test   $0x40,%cl
    f283:	48 8b 4c 24 e8       	mov    -0x18(%rsp),%rcx
    f288:	49 0f 44 c9          	cmove  %r9,%rcx
    f28c:	48 89 4c 24 e8       	mov    %rcx,-0x18(%rsp)
    f291:	4d 89 f9             	mov    %r15,%r9
    f294:	44 89 d1             	mov    %r10d,%ecx
    f297:	4d 0f ad d9          	shrd   %cl,%r11,%r9
    f29b:	4c 89 4c 24 f8       	mov    %r9,-0x8(%rsp)
    f2a0:	4d 89 d9             	mov    %r11,%r9
    f2a3:	49 d3 e9             	shr    %cl,%r9
    f2a6:	41 f6 c2 40          	test   $0x40,%r10b
    f2aa:	4c 0f 44 4c 24 f8    	cmove  -0x8(%rsp),%r9
    f2b0:	44 39 eb             	cmp    %r13d,%ebx
    f2b3:	4c 0f 43 4c 24 e8    	cmovae -0x18(%rsp),%r9
    f2b9:	01 d5                	add    %edx,%ebp
    f2bb:	4c 63 ed             	movslq %ebp,%r13
    f2be:	44 89 c1             	mov    %r8d,%ecx
    f2c1:	49 d3 e5             	shl    %cl,%r13
    f2c4:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
    f2cb:	49 d3 e2             	shl    %cl,%r10
    f2ce:	49 f7 d2             	not    %r10
    f2d1:	4d 21 ca             	and    %r9,%r10
    f2d4:	4d 09 ea             	or     %r13,%r10
    f2d7:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
    f2dc:	e9 7d fe ff ff       	jmp    f15e <hyperinterval::ieee::Format::rounded+0x17e>
    f2e1:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    f2e8:	00 00 00 
    f2eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

hyperinterval::ieee::Format::add:
    f2f0:	55                   	push   %rbp
    f2f1:	41 57                	push   %r15
    f2f3:	41 56                	push   %r14
    f2f5:	41 55                	push   %r13
    f2f7:	41 54                	push   %r12
    f2f9:	53                   	push   %rbx
    f2fa:	48 83 ec 38          	sub    $0x38,%rsp
    f2fe:	48 89 fb             	mov    %rdi,%rbx
    f301:	48 85 c9             	test   %rcx,%rcx
    f304:	0f 84 48 01 00 00    	je     f452 <hyperinterval::ieee::Format::add+0x162>
    f30a:	49 89 c9             	mov    %rcx,%r9
    f30d:	4d 85 c0             	test   %r8,%r8
    f310:	0f 84 46 01 00 00    	je     f45c <hyperinterval::ieee::Format::add+0x16c>
    f316:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
    f31b:	bf 40 00 00 00       	mov    $0x40,%edi
    f320:	f3 48 0f bc fa       	tzcnt  %rdx,%rdi
    f325:	4d 89 ca             	mov    %r9,%r10
    f328:	49 21 d2             	and    %rdx,%r10
    f32b:	89 f9                	mov    %edi,%ecx
    f32d:	49 d3 ea             	shr    %cl,%r10
    f330:	bb 01 00 00 00       	mov    $0x1,%ebx
    f335:	48 d3 e3             	shl    %cl,%rbx
    f338:	4c 8d 73 ff          	lea    -0x1(%rbx),%r14
    f33c:	4d 89 f7             	mov    %r14,%r15
    f33f:	4d 21 cf             	and    %r9,%r15
    f342:	4d 85 d2             	test   %r10,%r10
    f345:	b8 01 00 00 00       	mov    $0x1,%eax
    f34a:	45 89 d3             	mov    %r10d,%r11d
    f34d:	44 0f 44 d8          	cmove  %eax,%r11d
    f351:	4c 0f 45 d3          	cmovne %rbx,%r10
    f355:	49 89 d5             	mov    %rdx,%r13
    f358:	49 d3 ed             	shr    %cl,%r13
    f35b:	4d 09 fa             	or     %r15,%r10
    f35e:	49 d1 ed             	shr    $1,%r13
    f361:	41 01 fd             	add    %edi,%r13d
    f364:	45 31 e4             	xor    %r12d,%r12d
    f367:	49 85 f1             	test   %rsi,%r9
    f36a:	41 0f 95 c4          	setne  %r12b
    f36e:	b9 7f 00 00 00       	mov    $0x7f,%ecx
    f373:	49 0f bd ca          	bsr    %r10,%rcx
    f377:	83 f1 3f             	xor    $0x3f,%ecx
    f37a:	01 f9                	add    %edi,%ecx
    f37c:	83 c1 c1             	add    $0xffffffc1,%ecx
    f37f:	31 ed                	xor    %ebp,%ebp
    f381:	4c 0f a5 d5          	shld   %cl,%r10,%rbp
    f385:	49 d3 e2             	shl    %cl,%r10
    f388:	45 31 ff             	xor    %r15d,%r15d
    f38b:	f6 c1 40             	test   $0x40,%cl
    f38e:	49 0f 45 ea          	cmovne %r10,%rbp
    f392:	4d 0f 45 d7          	cmovne %r15,%r10
    f396:	44 01 e9             	add    %r13d,%ecx
    f399:	41 29 cb             	sub    %ecx,%r11d
    f39c:	49 c1 e4 20          	shl    $0x20,%r12
    f3a0:	4d 09 dc             	or     %r11,%r12
    f3a3:	4d 89 c7             	mov    %r8,%r15
    f3a6:	49 21 d7             	and    %rdx,%r15
    f3a9:	89 f9                	mov    %edi,%ecx
    f3ab:	49 d3 ef             	shr    %cl,%r15
    f3ae:	4d 21 c6             	and    %r8,%r14
    f3b1:	4d 85 ff             	test   %r15,%r15
    f3b4:	41 0f 45 c7          	cmovne %r15d,%eax
    f3b8:	4c 0f 45 fb          	cmovne %rbx,%r15
    f3bc:	b9 7f 00 00 00       	mov    $0x7f,%ecx
    f3c1:	4d 09 f7             	or     %r14,%r15
    f3c4:	45 31 f6             	xor    %r14d,%r14d
    f3c7:	48 89 f3             	mov    %rsi,%rbx
    f3ca:	49 85 f0             	test   %rsi,%r8
    f3cd:	41 0f 95 c6          	setne  %r14b
    f3d1:	49 0f bd cf          	bsr    %r15,%rcx
    f3d5:	83 f1 3f             	xor    $0x3f,%ecx
    f3d8:	01 f9                	add    %edi,%ecx
    f3da:	83 c1 c1             	add    $0xffffffc1,%ecx
    f3dd:	31 ff                	xor    %edi,%edi
    f3df:	4c 0f a5 ff          	shld   %cl,%r15,%rdi
    f3e3:	49 d3 e7             	shl    %cl,%r15
    f3e6:	f6 c1 40             	test   $0x40,%cl
    f3e9:	49 0f 45 ff          	cmovne %r15,%rdi
    f3ed:	be 00 00 00 00       	mov    $0x0,%esi
    f3f2:	4c 0f 45 fe          	cmovne %rsi,%r15
    f3f6:	41 01 cd             	add    %ecx,%r13d
    f3f9:	44 29 e8             	sub    %r13d,%eax
    f3fc:	49 c1 e6 20          	shl    $0x20,%r14
    f400:	49 09 c6             	or     %rax,%r14
    f403:	41 39 c3             	cmp    %eax,%r11d
    f406:	7d 64                	jge    f46c <hyperinterval::ieee::Format::add+0x17c>
    f408:	4d 89 e5             	mov    %r12,%r13
    f40b:	4d 89 d1             	mov    %r10,%r9
    f40e:	45 89 da             	mov    %r11d,%r10d
    f411:	44 29 d0             	sub    %r10d,%eax
    f414:	83 f8 4a             	cmp    $0x4a,%eax
    f417:	48 89 de             	mov    %rbx,%rsi
    f41a:	7f 7c                	jg     f498 <hyperinterval::ieee::Format::add+0x1a8>
    f41c:	89 c1                	mov    %eax,%ecx
    f41e:	4c 0f a5 ff          	shld   %cl,%r15,%rdi
    f422:	49 d3 e7             	shl    %cl,%r15
    f425:	31 c9                	xor    %ecx,%ecx
    f427:	a8 40                	test   $0x40,%al
    f429:	49 0f 45 ff          	cmovne %r15,%rdi
    f42d:	49 0f 44 cf          	cmove  %r15,%rcx
    f431:	49 c1 ee 20          	shr    $0x20,%r14
    f435:	49 c1 ed 20          	shr    $0x20,%r13
    f439:	4d 39 ee             	cmp    %r13,%r14
    f43c:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    f441:	0f 85 a0 00 00 00    	jne    f4e7 <hyperinterval::ieee::Format::add+0x1f7>
    f447:	49 01 c9             	add    %rcx,%r9
    f44a:	48 11 fd             	adc    %rdi,%rbp
    f44d:	e9 f3 00 00 00       	jmp    f545 <hyperinterval::ieee::Format::add+0x255>
    f452:	4c 89 43 08          	mov    %r8,0x8(%rbx)
    f456:	4c 89 43 10          	mov    %r8,0x10(%rbx)
    f45a:	eb 08                	jmp    f464 <hyperinterval::ieee::Format::add+0x174>
    f45c:	4c 89 4b 08          	mov    %r9,0x8(%rbx)
    f460:	4c 89 4b 10          	mov    %r9,0x10(%rbx)
    f464:	c6 03 00             	movb   $0x0,(%rbx)
    f467:	e9 17 01 00 00       	jmp    f583 <hyperinterval::ieee::Format::add+0x293>
    f46c:	4d 89 f5             	mov    %r14,%r13
    f46f:	4c 89 f9             	mov    %r15,%rcx
    f472:	48 89 fe             	mov    %rdi,%rsi
    f475:	4d 89 e6             	mov    %r12,%r14
    f478:	4d 89 d7             	mov    %r10,%r15
    f47b:	48 89 ef             	mov    %rbp,%rdi
    f47e:	48 89 f5             	mov    %rsi,%rbp
    f481:	41 89 c2             	mov    %eax,%r10d
    f484:	44 89 d8             	mov    %r11d,%eax
    f487:	4d 89 c8             	mov    %r9,%r8
    f48a:	49 89 c9             	mov    %rcx,%r9
    f48d:	44 29 d0             	sub    %r10d,%eax
    f490:	83 f8 4a             	cmp    $0x4a,%eax
    f493:	48 89 de             	mov    %rbx,%rsi
    f496:	7e 84                	jle    f41c <hyperinterval::ieee::Format::add+0x12c>
    f498:	48 b8 00 00 00 00 01 	movabs $0x100000000,%rax
    f49f:	00 00 00 
    f4a2:	49 85 c5             	test   %rax,%r13
    f4a5:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    f4aa:	75 51                	jne    f4fd <hyperinterval::ieee::Format::add+0x20d>
    f4ac:	4c 89 c0             	mov    %r8,%rax
    f4af:	48 21 f0             	and    %rsi,%rax
    f4b2:	31 c9                	xor    %ecx,%ecx
    f4b4:	48 f7 d8             	neg    %rax
    f4b7:	48 19 c9             	sbb    %rcx,%rcx
    f4ba:	48 83 c9 01          	or     $0x1,%rcx
    f4be:	4d 89 c6             	mov    %r8,%r14
    f4c1:	4c 01 c1             	add    %r8,%rcx
    f4c4:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    f4c9:	e8 72 f8 ff ff       	call   ed40 <hyperinterval::ieee::Format::finite>
    f4ce:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
    f4d3:	75 5a                	jne    f52f <hyperinterval::ieee::Format::add+0x23f>
    f4d5:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    f4da:	4c 89 73 08          	mov    %r14,0x8(%rbx)
    f4de:	48 89 43 10          	mov    %rax,0x10(%rbx)
    f4e2:	e9 98 00 00 00       	jmp    f57f <hyperinterval::ieee::Format::add+0x28f>
    f4e7:	4c 39 c9             	cmp    %r9,%rcx
    f4ea:	48 89 f8             	mov    %rdi,%rax
    f4ed:	48 19 e8             	sbb    %rbp,%rax
    f4f0:	73 47                	jae    f539 <hyperinterval::ieee::Format::add+0x249>
    f4f2:	49 29 c9             	sub    %rcx,%r9
    f4f5:	48 19 fd             	sbb    %rdi,%rbp
    f4f8:	4d 89 ee             	mov    %r13,%r14
    f4fb:	eb 48                	jmp    f545 <hyperinterval::ieee::Format::add+0x255>
    f4fd:	4d 89 c6             	mov    %r8,%r14
    f500:	4c 89 c0             	mov    %r8,%rax
    f503:	48 31 f0             	xor    %rsi,%rax
    f506:	48 89 c7             	mov    %rax,%rdi
    f509:	48 21 f7             	and    %rsi,%rdi
    f50c:	31 c9                	xor    %ecx,%ecx
    f50e:	48 f7 df             	neg    %rdi
    f511:	48 19 c9             	sbb    %rcx,%rcx
    f514:	48 83 c9 01          	or     $0x1,%rcx
    f518:	48 01 c1             	add    %rax,%rcx
    f51b:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    f520:	49 89 f7             	mov    %rsi,%r15
    f523:	e8 18 f8 ff ff       	call   ed40 <hyperinterval::ieee::Format::finite>
    f528:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
    f52d:	74 39                	je     f568 <hyperinterval::ieee::Format::add+0x278>
    f52f:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
    f533:	b0 01                	mov    $0x1,%al
    f535:	88 03                	mov    %al,(%rbx)
    f537:	eb 4a                	jmp    f583 <hyperinterval::ieee::Format::add+0x293>
    f539:	4c 29 c9             	sub    %r9,%rcx
    f53c:	48 19 ef             	sbb    %rbp,%rdi
    f53f:	49 89 c9             	mov    %rcx,%r9
    f542:	48 89 fd             	mov    %rdi,%rbp
    f545:	44 88 74 24 24       	mov    %r14b,0x24(%rsp)
    f54a:	4c 89 4c 24 10       	mov    %r9,0x10(%rsp)
    f54f:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    f554:	44 89 54 24 20       	mov    %r10d,0x20(%rsp)
    f559:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
    f55e:	48 89 df             	mov    %rbx,%rdi
    f561:	e8 7a fa ff ff       	call   efe0 <hyperinterval::ieee::Format::rounded>
    f566:	eb 1b                	jmp    f583 <hyperinterval::ieee::Format::add+0x293>
    f568:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    f56d:	49 31 c7             	xor    %rax,%r15
    f570:	48 85 c0             	test   %rax,%rax
    f573:	4c 0f 44 f8          	cmove  %rax,%r15
    f577:	4c 89 7b 08          	mov    %r15,0x8(%rbx)
    f57b:	4c 89 73 10          	mov    %r14,0x10(%rbx)
    f57f:	31 c0                	xor    %eax,%eax
    f581:	88 03                	mov    %al,(%rbx)
    f583:	48 89 d8             	mov    %rbx,%rax
    f586:	48 83 c4 38          	add    $0x38,%rsp
    f58a:	5b                   	pop    %rbx
    f58b:	41 5c                	pop    %r12
    f58d:	41 5d                	pop    %r13
    f58f:	41 5e                	pop    %r14
    f591:	41 5f                	pop    %r15
    f593:	5d                   	pop    %rbp
    f594:	c3                   	ret
    f595:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    f59c:	00 00 00 
    f59f:	90                   	nop

hyperinterval::ieee::Format::affine:
    f5a0:	55                   	push   %rbp
    f5a1:	41 57                	push   %r15
    f5a3:	41 56                	push   %r14
    f5a5:	41 55                	push   %r13
    f5a7:	41 54                	push   %r12
    f5a9:	53                   	push   %rbx
    f5aa:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
    f5b1:	48 89 c8             	mov    %rcx,%rax
    f5b4:	49 89 d6             	mov    %rdx,%r14
    f5b7:	b9 40 00 00 00       	mov    $0x40,%ecx
    f5bc:	f3 48 0f bc ca       	tzcnt  %rdx,%rcx
    f5c1:	48 89 c2             	mov    %rax,%rdx
    f5c4:	4c 21 f2             	and    %r14,%rdx
    f5c7:	48 d3 ea             	shr    %cl,%rdx
    f5ca:	41 bb 01 00 00 00    	mov    $0x1,%r11d
    f5d0:	49 d3 e3             	shl    %cl,%r11
    f5d3:	4d 8d 7b ff          	lea    -0x1(%r11),%r15
    f5d7:	4c 89 fb             	mov    %r15,%rbx
    f5da:	48 21 c3             	and    %rax,%rbx
    f5dd:	48 85 d2             	test   %rdx,%rdx
    f5e0:	41 ba 01 00 00 00    	mov    $0x1,%r10d
    f5e6:	89 d5                	mov    %edx,%ebp
    f5e8:	41 0f 44 ea          	cmove  %r10d,%ebp
    f5ec:	48 89 3c 24          	mov    %rdi,(%rsp)
    f5f0:	49 0f 45 d3          	cmovne %r11,%rdx
    f5f4:	4d 89 f5             	mov    %r14,%r13
    f5f7:	49 d3 ed             	shr    %cl,%r13
    f5fa:	48 09 da             	or     %rbx,%rdx
    f5fd:	49 d1 ed             	shr    $1,%r13
    f600:	41 01 cd             	add    %ecx,%r13d
    f603:	44 29 ed             	sub    %r13d,%ebp
    f606:	48 85 f0             	test   %rsi,%rax
    f609:	0f 95 c3             	setne  %bl
    f60c:	4c 89 c0             	mov    %r8,%rax
    f60f:	4c 21 f0             	and    %r14,%rax
    f612:	48 d3 e8             	shr    %cl,%rax
    f615:	4d 89 fc             	mov    %r15,%r12
    f618:	4d 21 c4             	and    %r8,%r12
    f61b:	48 85 c0             	test   %rax,%rax
    f61e:	89 c7                	mov    %eax,%edi
    f620:	41 0f 44 fa          	cmove  %r10d,%edi
    f624:	49 0f 45 c3          	cmovne %r11,%rax
    f628:	4c 09 e0             	or     %r12,%rax
    f62b:	44 29 ef             	sub    %r13d,%edi
    f62e:	49 85 f0             	test   %rsi,%r8
    f631:	41 0f 95 c0          	setne  %r8b
    f635:	01 ef                	add    %ebp,%edi
    f637:	4c 89 f5             	mov    %r14,%rbp
    f63a:	4d 89 cc             	mov    %r9,%r12
    f63d:	4d 21 f4             	and    %r14,%r12
    f640:	49 d3 ec             	shr    %cl,%r12
    f643:	41 30 d8             	xor    %bl,%r8b
    f646:	48 f7 e2             	mul    %rdx
    f649:	4d 21 cf             	and    %r9,%r15
    f64c:	4d 85 e4             	test   %r12,%r12
    f64f:	45 0f 45 d4          	cmovne %r12d,%r10d
    f653:	4d 0f 45 e3          	cmovne %r11,%r12
    f657:	4d 09 fc             	or     %r15,%r12
    f65a:	45 29 ea             	sub    %r13d,%r10d
    f65d:	49 85 f1             	test   %rsi,%r9
    f660:	0f 95 84 24 84 00 00 	setne  0x84(%rsp)
    f667:	00 
    f668:	0f 95 c3             	setne  %bl
    f66b:	48 89 c1             	mov    %rax,%rcx
    f66e:	48 09 d1             	or     %rdx,%rcx
    f671:	44 88 44 24 64       	mov    %r8b,0x64(%rsp)
    f676:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
    f67b:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
    f680:	89 7c 24 60          	mov    %edi,0x60(%rsp)
    f684:	4c 89 64 24 70       	mov    %r12,0x70(%rsp)
    f689:	48 c7 44 24 78 00 00 	movq   $0x0,0x78(%rsp)
    f690:	00 00 
    f692:	44 89 94 24 80 00 00 	mov    %r10d,0x80(%rsp)
    f699:	00 
    f69a:	74 79                	je     f715 <hyperinterval::ieee::Format::affine+0x175>
    f69c:	4d 85 e4             	test   %r12,%r12
    f69f:	74 7b                	je     f71c <hyperinterval::ieee::Format::affine+0x17c>
    f6a1:	48 89 6c 24 30       	mov    %rbp,0x30(%rsp)
    f6a6:	48 0f bd ca          	bsr    %rdx,%rcx
    f6aa:	83 f1 3f             	xor    $0x3f,%ecx
    f6ad:	4c 0f bd d8          	bsr    %rax,%r11
    f6b1:	41 83 f3 3f          	xor    $0x3f,%r11d
    f6b5:	41 83 cb 40          	or     $0x40,%r11d
    f6b9:	48 85 d2             	test   %rdx,%rdx
    f6bc:	44 0f 45 d9          	cmovne %ecx,%r11d
    f6c0:	41 83 f3 7f          	xor    $0x7f,%r11d
    f6c4:	41 01 fb             	add    %edi,%r11d
    f6c7:	4d 0f bd fc          	bsr    %r12,%r15
    f6cb:	41 83 f7 3f          	xor    $0x3f,%r15d
    f6cf:	41 83 cf 40          	or     $0x40,%r15d
    f6d3:	41 83 f7 7f          	xor    $0x7f,%r15d
    f6d7:	45 01 d7             	add    %r10d,%r15d
    f6da:	45 39 df             	cmp    %r11d,%r15d
    f6dd:	45 0f 4e fb          	cmovle %r11d,%r15d
    f6e1:	41 83 c7 82          	add    $0xffffff82,%r15d
    f6e5:	44 29 ff             	sub    %r15d,%edi
    f6e8:	78 4b                	js     f735 <hyperinterval::ieee::Format::affine+0x195>
    f6ea:	89 f9                	mov    %edi,%ecx
    f6ec:	48 0f a5 c2          	shld   %cl,%rax,%rdx
    f6f0:	48 d3 e0             	shl    %cl,%rax
    f6f3:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    f6fa:	00 00 
    f6fc:	40 f6 c7 40          	test   $0x40,%dil
    f700:	48 0f 45 d0          	cmovne %rax,%rdx
    f704:	bd 00 00 00 00       	mov    $0x0,%ebp
    f709:	48 0f 44 e8          	cmove  %rax,%rbp
    f70d:	49 89 d3             	mov    %rdx,%r11
    f710:	e9 9b 00 00 00       	jmp    f7b0 <hyperinterval::ieee::Format::affine+0x210>
    f715:	48 8d 4c 24 70       	lea    0x70(%rsp),%rcx
    f71a:	eb 05                	jmp    f721 <hyperinterval::ieee::Format::affine+0x181>
    f71c:	48 8d 4c 24 50       	lea    0x50(%rsp),%rcx
    f721:	4c 8b 34 24          	mov    (%rsp),%r14
    f725:	4c 89 f7             	mov    %r14,%rdi
    f728:	48 89 ea             	mov    %rbp,%rdx
    f72b:	e8 b0 f8 ff ff       	call   efe0 <hyperinterval::ieee::Format::rounded>
    f730:	e9 3f 02 00 00       	jmp    f974 <hyperinterval::ieee::Format::affine+0x3d4>
    f735:	f7 df                	neg    %edi
    f737:	bd 00 00 00 00       	mov    $0x0,%ebp
    f73c:	41 bb 00 00 00 00    	mov    $0x0,%r11d
    f742:	83 ff 7f             	cmp    $0x7f,%edi
    f745:	7f 5b                	jg     f7a2 <hyperinterval::ieee::Format::affine+0x202>
    f747:	48 89 c5             	mov    %rax,%rbp
    f74a:	89 f9                	mov    %edi,%ecx
    f74c:	48 0f ad d5          	shrd   %cl,%rdx,%rbp
    f750:	49 89 d3             	mov    %rdx,%r11
    f753:	49 d3 eb             	shr    %cl,%r11
    f756:	41 89 dd             	mov    %ebx,%r13d
    f759:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
    f760:	48 d3 e3             	shl    %cl,%rbx
    f763:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    f76a:	40 f6 c7 40          	test   $0x40,%dil
    f76e:	49 0f 45 eb          	cmovne %r11,%rbp
    f772:	41 be 00 00 00 00    	mov    $0x0,%r14d
    f778:	4d 0f 45 de          	cmovne %r14,%r11
    f77c:	48 0f 45 cb          	cmovne %rbx,%rcx
    f780:	bf 00 00 00 00       	mov    $0x0,%edi
    f785:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
    f78a:	49 0f 45 de          	cmovne %r14,%rbx
    f78e:	48 f7 d3             	not    %rbx
    f791:	48 f7 d1             	not    %rcx
    f794:	48 21 d1             	and    %rdx,%rcx
    f797:	48 21 c3             	and    %rax,%rbx
    f79a:	48 09 cb             	or     %rcx,%rbx
    f79d:	44 89 eb             	mov    %r13d,%ebx
    f7a0:	74 0e                	je     f7b0 <hyperinterval::ieee::Format::affine+0x210>
    f7a2:	41 0f b6 c0          	movzbl %r8b,%eax
    f7a6:	f7 d8                	neg    %eax
    f7a8:	83 c8 01             	or     $0x1,%eax
    f7ab:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    f7b0:	45 29 fa             	sub    %r15d,%r10d
    f7b3:	78 20                	js     f7d5 <hyperinterval::ieee::Format::affine+0x235>
    f7b5:	31 d2                	xor    %edx,%edx
    f7b7:	44 89 d1             	mov    %r10d,%ecx
    f7ba:	4c 0f a5 e2          	shld   %cl,%r12,%rdx
    f7be:	49 d3 e4             	shl    %cl,%r12
    f7c1:	45 31 ed             	xor    %r13d,%r13d
    f7c4:	41 f6 c2 40          	test   $0x40,%r10b
    f7c8:	49 0f 45 d4          	cmovne %r12,%rdx
    f7cc:	4d 0f 45 e5          	cmovne %r13,%r12
    f7d0:	4c 89 e0             	mov    %r12,%rax
    f7d3:	eb 54                	jmp    f829 <hyperinterval::ieee::Format::affine+0x289>
    f7d5:	41 f7 da             	neg    %r10d
    f7d8:	45 31 ed             	xor    %r13d,%r13d
    f7db:	b8 00 00 00 00       	mov    $0x0,%eax
    f7e0:	41 83 fa 7f          	cmp    $0x7f,%r10d
    f7e4:	7f 2d                	jg     f813 <hyperinterval::ieee::Format::affine+0x273>
    f7e6:	4c 89 e0             	mov    %r12,%rax
    f7e9:	44 89 d1             	mov    %r10d,%ecx
    f7ec:	4c 0f ad e8          	shrd   %cl,%r13,%rax
    f7f0:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
    f7f7:	48 d3 e7             	shl    %cl,%rdi
    f7fa:	41 f6 c2 40          	test   $0x40,%r10b
    f7fe:	49 0f 45 c5          	cmovne %r13,%rax
    f802:	49 0f 45 fd          	cmovne %r13,%rdi
    f806:	48 f7 d7             	not    %rdi
    f809:	ba 00 00 00 00       	mov    $0x0,%edx
    f80e:	4c 85 e7             	test   %r12,%rdi
    f811:	74 16                	je     f829 <hyperinterval::ieee::Format::affine+0x289>
    f813:	4c 89 ea             	mov    %r13,%rdx
    f816:	4c 89 c9             	mov    %r9,%rcx
    f819:	48 21 f1             	and    %rsi,%rcx
    f81c:	45 31 ed             	xor    %r13d,%r13d
    f81f:	48 f7 d9             	neg    %rcx
    f822:	45 19 ed             	sbb    %r13d,%r13d
    f825:	41 83 cd 01          	or     $0x1,%r13d
    f829:	49 85 f1             	test   %rsi,%r9
    f82c:	0f 95 c1             	setne  %cl
    f82f:	41 38 c8             	cmp    %cl,%r8b
    f832:	74 16                	je     f84a <hyperinterval::ieee::Format::affine+0x2aa>
    f834:	48 39 c5             	cmp    %rax,%rbp
    f837:	4c 89 d9             	mov    %r11,%rcx
    f83a:	48 19 d1             	sbb    %rdx,%rcx
    f83d:	73 13                	jae    f852 <hyperinterval::ieee::Format::affine+0x2b2>
    f83f:	48 29 e8             	sub    %rbp,%rax
    f842:	4c 19 da             	sbb    %r11,%rdx
    f845:	41 89 d8             	mov    %ebx,%r8d
    f848:	eb 14                	jmp    f85e <hyperinterval::ieee::Format::affine+0x2be>
    f84a:	48 01 e8             	add    %rbp,%rax
    f84d:	4c 11 da             	adc    %r11,%rdx
    f850:	eb 0c                	jmp    f85e <hyperinterval::ieee::Format::affine+0x2be>
    f852:	48 29 c5             	sub    %rax,%rbp
    f855:	49 19 d3             	sbb    %rdx,%r11
    f858:	48 89 e8             	mov    %rbp,%rax
    f85b:	4c 89 da             	mov    %r11,%rdx
    f85e:	44 88 44 24 24       	mov    %r8b,0x24(%rsp)
    f863:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
    f868:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
    f86d:	44 89 7c 24 20       	mov    %r15d,0x20(%rsp)
    f872:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
    f877:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
    f87c:	49 89 f4             	mov    %rsi,%r12
    f87f:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
    f884:	48 89 da             	mov    %rbx,%rdx
    f887:	e8 54 f7 ff ff       	call   efe0 <hyperinterval::ieee::Format::rounded>
    f88c:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
    f891:	75 16                	jne    f8a9 <hyperinterval::ieee::Format::affine+0x309>
    f893:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
    f898:	4c 8b 34 24          	mov    (%rsp),%r14
    f89c:	41 88 46 01          	mov    %al,0x1(%r14)
    f8a0:	41 c6 06 01          	movb   $0x1,(%r14)
    f8a4:	e9 cb 00 00 00       	jmp    f974 <hyperinterval::ieee::Format::affine+0x3d4>
    f8a9:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
    f8ae:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
    f8b3:	49 39 c7             	cmp    %rax,%r15
    f8b6:	0f 85 a8 00 00 00    	jne    f964 <hyperinterval::ieee::Format::affine+0x3c4>
    f8bc:	44 03 6c 24 08       	add    0x8(%rsp),%r13d
    f8c1:	41 83 fd 01          	cmp    $0x1,%r13d
    f8c5:	74 60                	je     f927 <hyperinterval::ieee::Format::affine+0x387>
    f8c7:	41 83 fd ff          	cmp    $0xffffffff,%r13d
    f8cb:	0f 85 93 00 00 00    	jne    f964 <hyperinterval::ieee::Format::affine+0x3c4>
    f8d1:	4c 89 f8             	mov    %r15,%rax
    f8d4:	4c 89 e6             	mov    %r12,%rsi
    f8d7:	4c 31 e0             	xor    %r12,%rax
    f8da:	4d 85 ff             	test   %r15,%r15
    f8dd:	49 0f 44 c7          	cmove  %r15,%rax
    f8e1:	48 89 c2             	mov    %rax,%rdx
    f8e4:	4c 21 e2             	and    %r12,%rdx
    f8e7:	31 c9                	xor    %ecx,%ecx
    f8e9:	48 f7 da             	neg    %rdx
    f8ec:	48 19 c9             	sbb    %rcx,%rcx
    f8ef:	48 83 c9 01          	or     $0x1,%rcx
    f8f3:	48 01 c1             	add    %rax,%rcx
    f8f6:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    f8fb:	48 89 da             	mov    %rbx,%rdx
    f8fe:	e8 3d f4 ff ff       	call   ed40 <hyperinterval::ieee::Format::finite>
    f903:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
    f908:	75 49                	jne    f953 <hyperinterval::ieee::Format::affine+0x3b3>
    f90a:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    f90f:	49 31 c4             	xor    %rax,%r12
    f912:	48 85 c0             	test   %rax,%rax
    f915:	4c 0f 44 e0          	cmove  %rax,%r12
    f919:	4c 8b 34 24          	mov    (%rsp),%r14
    f91d:	4d 89 66 08          	mov    %r12,0x8(%r14)
    f921:	4d 89 7e 10          	mov    %r15,0x10(%r14)
    f925:	eb 49                	jmp    f970 <hyperinterval::ieee::Format::affine+0x3d0>
    f927:	4c 89 e6             	mov    %r12,%rsi
    f92a:	4c 89 f8             	mov    %r15,%rax
    f92d:	4c 21 e0             	and    %r12,%rax
    f930:	31 c9                	xor    %ecx,%ecx
    f932:	48 f7 d8             	neg    %rax
    f935:	48 19 c9             	sbb    %rcx,%rcx
    f938:	48 83 c9 01          	or     $0x1,%rcx
    f93c:	4c 01 f9             	add    %r15,%rcx
    f93f:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    f944:	48 89 da             	mov    %rbx,%rdx
    f947:	e8 f4 f3 ff ff       	call   ed40 <hyperinterval::ieee::Format::finite>
    f94c:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
    f951:	74 0c                	je     f95f <hyperinterval::ieee::Format::affine+0x3bf>
    f953:	4c 8b 34 24          	mov    (%rsp),%r14
    f957:	66 41 c7 06 01 03    	movw   $0x301,(%r14)
    f95d:	eb 15                	jmp    f974 <hyperinterval::ieee::Format::affine+0x3d4>
    f95f:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    f964:	4c 8b 34 24          	mov    (%rsp),%r14
    f968:	4d 89 7e 08          	mov    %r15,0x8(%r14)
    f96c:	49 89 46 10          	mov    %rax,0x10(%r14)
    f970:	41 c6 06 00          	movb   $0x0,(%r14)
    f974:	4c 89 f0             	mov    %r14,%rax
    f977:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
    f97e:	5b                   	pop    %rbx
    f97f:	41 5c                	pop    %r12
    f981:	41 5d                	pop    %r13
    f983:	41 5e                	pop    %r14
    f985:	41 5f                	pop    %r15
    f987:	5d                   	pop    %rbp
    f988:	c3                   	ret
    f989:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

hyperinterval::ieee::Format::div:
    f990:	55                   	push   %rbp
    f991:	41 57                	push   %r15
    f993:	41 56                	push   %r14
    f995:	41 55                	push   %r13
    f997:	41 54                	push   %r12
    f999:	53                   	push   %rbx
    f99a:	48 83 ec 48          	sub    $0x48,%rsp
    f99e:	4d 85 c0             	test   %r8,%r8
    f9a1:	0f 84 cb 00 00 00    	je     fa72 <hyperinterval::ieee::Format::div+0xe2>
    f9a7:	48 85 c9             	test   %rcx,%rcx
    f9aa:	0f 84 cc 00 00 00    	je     fa7c <hyperinterval::ieee::Format::div+0xec>
    f9b0:	41 be 40 00 00 00    	mov    $0x40,%r14d
    f9b6:	f3 4c 0f bc f2       	tzcnt  %rdx,%r14
    f9bb:	49 89 cd             	mov    %rcx,%r13
    f9be:	49 21 d5             	and    %rdx,%r13
    f9c1:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
    f9c6:	41 83 e6 3f          	and    $0x3f,%r14d
    f9ca:	48 89 c8             	mov    %rcx,%rax
    f9cd:	44 89 f1             	mov    %r14d,%ecx
    f9d0:	49 d3 ed             	shr    %cl,%r13
    f9d3:	41 ba 01 00 00 00    	mov    $0x1,%r10d
    f9d9:	49 d3 e2             	shl    %cl,%r10
    f9dc:	4d 8d 5a ff          	lea    -0x1(%r10),%r11
    f9e0:	4c 89 db             	mov    %r11,%rbx
    f9e3:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    f9e8:	48 21 c3             	and    %rax,%rbx
    f9eb:	4d 85 ed             	test   %r13,%r13
    f9ee:	41 b9 01 00 00 00    	mov    $0x1,%r9d
    f9f4:	44 89 e8             	mov    %r13d,%eax
    f9f7:	41 0f 44 c1          	cmove  %r9d,%eax
    f9fb:	4d 0f 45 ea          	cmovne %r10,%r13
    f9ff:	4c 89 c5             	mov    %r8,%rbp
    fa02:	48 21 d5             	and    %rdx,%rbp
    fa05:	48 d3 ea             	shr    %cl,%rdx
    fa08:	48 d3 ed             	shr    %cl,%rbp
    fa0b:	49 09 dd             	or     %rbx,%r13
    fa0e:	48 d1 ea             	shr    $1,%rdx
    fa11:	4d 21 c3             	and    %r8,%r11
    fa14:	48 85 ed             	test   %rbp,%rbp
    fa17:	44 0f 45 cd          	cmovne %ebp,%r9d
    fa1b:	49 0f 45 ea          	cmovne %r10,%rbp
    fa1f:	4c 09 dd             	or     %r11,%rbp
    fa22:	b9 7f 00 00 00       	mov    $0x7f,%ecx
    fa27:	41 ba 7f 00 00 00    	mov    $0x7f,%r10d
    fa2d:	4c 0f bd d5          	bsr    %rbp,%r10
    fa31:	41 83 f2 3f          	xor    $0x3f,%r10d
    fa35:	41 83 c2 40          	add    $0x40,%r10d
    fa39:	49 0f bd cd          	bsr    %r13,%rcx
    fa3d:	83 f1 3f             	xor    $0x3f,%ecx
    fa40:	45 89 d7             	mov    %r10d,%r15d
    fa43:	41 29 cf             	sub    %ecx,%r15d
    fa46:	41 83 c7 c0          	add    $0xffffffc0,%r15d
    fa4a:	78 3f                	js     fa8b <hyperinterval::ieee::Format::div+0xfb>
    fa4c:	45 31 db             	xor    %r11d,%r11d
    fa4f:	44 89 f9             	mov    %r15d,%ecx
    fa52:	49 0f a5 eb          	shld   %cl,%rbp,%r11
    fa56:	31 db                	xor    %ebx,%ebx
    fa58:	49 89 ec             	mov    %rbp,%r12
    fa5b:	49 d3 e4             	shl    %cl,%r12
    fa5e:	41 f6 c7 40          	test   $0x40,%r15b
    fa62:	4d 0f 45 dc          	cmovne %r12,%r11
    fa66:	4c 0f 45 e3          	cmovne %rbx,%r12
    fa6a:	4d 39 e5             	cmp    %r12,%r13
    fa6d:	4c 19 db             	sbb    %r11,%rbx
    fa70:	eb 3f                	jmp    fab1 <hyperinterval::ieee::Format::div+0x121>
    fa72:	66 c7 07 01 04       	movw   $0x401,(%rdi)
    fa77:	e9 24 03 00 00       	jmp    fda0 <hyperinterval::ieee::Format::div+0x410>
    fa7c:	c6 07 00             	movb   $0x0,(%rdi)
    fa7f:	0f 57 c0             	xorps  %xmm0,%xmm0
    fa82:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
    fa86:	e9 15 03 00 00       	jmp    fda0 <hyperinterval::ieee::Format::div+0x410>
    fa8b:	44 89 f9             	mov    %r15d,%ecx
    fa8e:	f6 d9                	neg    %cl
    fa90:	45 31 db             	xor    %r11d,%r11d
    fa93:	4d 0f a5 eb          	shld   %cl,%r13,%r11
    fa97:	31 db                	xor    %ebx,%ebx
    fa99:	4d 89 ec             	mov    %r13,%r12
    fa9c:	49 d3 e4             	shl    %cl,%r12
    fa9f:	f6 c1 40             	test   $0x40,%cl
    faa2:	4d 0f 45 dc          	cmovne %r12,%r11
    faa6:	4c 0f 45 e3          	cmovne %rbx,%r12
    faaa:	49 39 ec             	cmp    %rbp,%r12
    faad:	49 83 db 00          	sbb    $0x0,%r11
    fab1:	0f 92 c1             	setb   %cl
    fab4:	44 29 c8             	sub    %r9d,%eax
    fab7:	41 01 c7             	add    %eax,%r15d
    faba:	0f b6 c9             	movzbl %cl,%ecx
    fabd:	41 29 cf             	sub    %ecx,%r15d
    fac0:	41 39 d7             	cmp    %edx,%r15d
    fac3:	0f 8f 19 02 00 00    	jg     fce2 <hyperinterval::ieee::Format::div+0x352>
    fac9:	4c 8b 4c 24 10       	mov    0x10(%rsp),%r9
    face:	46 8d 1c 0a          	lea    (%rdx,%r9,1),%r11d
    fad2:	b9 01 00 00 00       	mov    $0x1,%ecx
    fad7:	4c 89 5c 24 18       	mov    %r11,0x18(%rsp)
    fadc:	44 29 d9             	sub    %r11d,%ecx
    fadf:	45 29 cf             	sub    %r9d,%r15d
    fae2:	41 39 cf             	cmp    %ecx,%r15d
    fae5:	44 0f 4e f9          	cmovle %ecx,%r15d
    fae9:	44 29 f8             	sub    %r15d,%eax
    faec:	78 61                	js     fb4f <hyperinterval::ieee::Format::div+0x1bf>
    faee:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
    faf3:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
    faf8:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
    fafd:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
    fb02:	48 85 ed             	test   %rbp,%rbp
    fb05:	0f 84 a7 02 00 00    	je     fdb2 <hyperinterval::ieee::Format::div+0x422>
    fb0b:	45 31 e4             	xor    %r12d,%r12d
    fb0e:	89 c1                	mov    %eax,%ecx
    fb10:	4d 0f a5 ec          	shld   %cl,%r13,%r12
    fb14:	31 d2                	xor    %edx,%edx
    fb16:	49 d3 e5             	shl    %cl,%r13
    fb19:	a8 40                	test   $0x40,%al
    fb1b:	4d 0f 45 e5          	cmovne %r13,%r12
    fb1f:	4c 0f 45 ea          	cmovne %rdx,%r13
    fb23:	4c 89 ef             	mov    %r13,%rdi
    fb26:	4c 89 e6             	mov    %r12,%rsi
    fb29:	48 89 ea             	mov    %rbp,%rdx
    fb2c:	31 c9                	xor    %ecx,%ecx
    fb2e:	ff 15 3c 14 05 00    	call   *0x5143c(%rip)        # 60f70 <_GLOBAL_OFFSET_TABLE_+0x9b8>
    fb34:	49 89 c2             	mov    %rax,%r10
    fb37:	49 89 d1             	mov    %rdx,%r9
    fb3a:	48 89 d1             	mov    %rdx,%rcx
    fb3d:	48 0f af cd          	imul   %rbp,%rcx
    fb41:	48 f7 e5             	mul    %rbp
    fb44:	48 01 ca             	add    %rcx,%rdx
    fb47:	49 29 c5             	sub    %rax,%r13
    fb4a:	49 19 d4             	sbb    %rdx,%r12
    fb4d:	eb 79                	jmp    fbc8 <hyperinterval::ieee::Format::div+0x238>
    fb4f:	f7 d8                	neg    %eax
    fb51:	44 39 d0             	cmp    %r10d,%eax
    fb54:	7e 07                	jle    fb5d <hyperinterval::ieee::Format::div+0x1cd>
    fb56:	b3 01                	mov    $0x1,%bl
    fb58:	e9 df 00 00 00       	jmp    fc3c <hyperinterval::ieee::Format::div+0x2ac>
    fb5d:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
    fb62:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
    fb67:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
    fb6c:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
    fb71:	31 db                	xor    %ebx,%ebx
    fb73:	89 c1                	mov    %eax,%ecx
    fb75:	48 0f a5 eb          	shld   %cl,%rbp,%rbx
    fb79:	48 d3 e5             	shl    %cl,%rbp
    fb7c:	31 c9                	xor    %ecx,%ecx
    fb7e:	a8 40                	test   $0x40,%al
    fb80:	48 0f 45 dd          	cmovne %rbp,%rbx
    fb84:	48 0f 45 e9          	cmovne %rcx,%rbp
    fb88:	48 89 e8             	mov    %rbp,%rax
    fb8b:	48 09 d8             	or     %rbx,%rax
    fb8e:	0f 84 2b 02 00 00    	je     fdbf <hyperinterval::ieee::Format::div+0x42f>
    fb94:	45 31 e4             	xor    %r12d,%r12d
    fb97:	4c 89 ef             	mov    %r13,%rdi
    fb9a:	31 f6                	xor    %esi,%esi
    fb9c:	48 89 ea             	mov    %rbp,%rdx
    fb9f:	48 89 d9             	mov    %rbx,%rcx
    fba2:	ff 15 c8 13 05 00    	call   *0x513c8(%rip)        # 60f70 <_GLOBAL_OFFSET_TABLE_+0x9b8>
    fba8:	49 89 c2             	mov    %rax,%r10
    fbab:	49 89 d1             	mov    %rdx,%r9
    fbae:	48 0f af d8          	imul   %rax,%rbx
    fbb2:	48 f7 e5             	mul    %rbp
    fbb5:	48 01 da             	add    %rbx,%rdx
    fbb8:	4c 89 c9             	mov    %r9,%rcx
    fbbb:	48 0f af cd          	imul   %rbp,%rcx
    fbbf:	48 01 d1             	add    %rdx,%rcx
    fbc2:	49 29 c5             	sub    %rax,%r13
    fbc5:	49 19 cc             	sbb    %rcx,%r12
    fbc8:	4d 09 e5             	or     %r12,%r13
    fbcb:	0f 95 c3             	setne  %bl
    fbce:	4c 89 d0             	mov    %r10,%rax
    fbd1:	4c 09 c8             	or     %r9,%rax
    fbd4:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
    fbd9:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
    fbde:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
    fbe3:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    fbe8:	74 52                	je     fc3c <hyperinterval::ieee::Format::div+0x2ac>
    fbea:	49 0f bd c1          	bsr    %r9,%rax
    fbee:	83 f0 3f             	xor    $0x3f,%eax
    fbf1:	4d 0f bd da          	bsr    %r10,%r11
    fbf5:	41 83 f3 3f          	xor    $0x3f,%r11d
    fbf9:	41 83 cb 40          	or     $0x40,%r11d
    fbfd:	4d 85 c9             	test   %r9,%r9
    fc00:	44 0f 45 d8          	cmovne %eax,%r11d
    fc04:	41 83 f3 7f          	xor    $0x7f,%r11d
    fc08:	43 8d 2c 3b          	lea    (%r11,%r15,1),%ebp
    fc0c:	39 d5                	cmp    %edx,%ebp
    fc0e:	0f 8f ce 00 00 00    	jg     fce2 <hyperinterval::ieee::Format::div+0x352>
    fc14:	b8 01 00 00 00       	mov    $0x1,%eax
    fc19:	29 d0                	sub    %edx,%eax
    fc1b:	39 c5                	cmp    %eax,%ebp
    fc1d:	7d 28                	jge    fc47 <hyperinterval::ieee::Format::div+0x2b7>
    fc1f:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    fc24:	42 8d 0c 38          	lea    (%rax,%r15,1),%ecx
    fc28:	fe c9                	dec    %cl
    fc2a:	4c 89 d0             	mov    %r10,%rax
    fc2d:	48 d3 e0             	shl    %cl,%rax
    fc30:	45 31 db             	xor    %r11d,%r11d
    fc33:	f6 c1 40             	test   $0x40,%cl
    fc36:	4c 0f 44 d8          	cmove  %rax,%r11
    fc3a:	eb 6e                	jmp    fcaa <hyperinterval::ieee::Format::div+0x31a>
    fc3c:	45 31 d2             	xor    %r10d,%r10d
    fc3f:	45 31 c9             	xor    %r9d,%r9d
    fc42:	45 31 db             	xor    %r11d,%r11d
    fc45:	eb 63                	jmp    fcaa <hyperinterval::ieee::Format::div+0x31a>
    fc47:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    fc4c:	89 c1                	mov    %eax,%ecx
    fc4e:	44 29 d9             	sub    %r11d,%ecx
    fc51:	4d 89 d4             	mov    %r10,%r12
    fc54:	49 d3 e4             	shl    %cl,%r12
    fc57:	89 c8                	mov    %ecx,%eax
    fc59:	f7 d8                	neg    %eax
    fc5b:	45 31 ed             	xor    %r13d,%r13d
    fc5e:	f6 c1 40             	test   $0x40,%cl
    fc61:	4d 0f 44 ec          	cmove  %r12,%r13
    fc65:	4d 89 d4             	mov    %r10,%r12
    fc68:	89 c1                	mov    %eax,%ecx
    fc6a:	4d 0f ad cc          	shrd   %cl,%r9,%r12
    fc6e:	88 5c 24 0f          	mov    %bl,0xf(%rsp)
    fc72:	4c 89 cb             	mov    %r9,%rbx
    fc75:	48 d3 eb             	shr    %cl,%rbx
    fc78:	a8 40                	test   $0x40,%al
    fc7a:	49 0f 44 dc          	cmove  %r12,%rbx
    fc7e:	44 39 5c 24 10       	cmp    %r11d,0x10(%rsp)
    fc83:	49 0f 43 dd          	cmovae %r13,%rbx
    fc87:	01 d5                	add    %edx,%ebp
    fc89:	48 63 c5             	movslq %ebp,%rax
    fc8c:	44 89 f1             	mov    %r14d,%ecx
    fc8f:	48 d3 e0             	shl    %cl,%rax
    fc92:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
    fc99:	49 d3 e3             	shl    %cl,%r11
    fc9c:	49 f7 d3             	not    %r11
    fc9f:	49 21 db             	and    %rbx,%r11
    fca2:	0f b6 5c 24 0f       	movzbl 0xf(%rsp),%ebx
    fca7:	49 09 c3             	or     %rax,%r11
    fcaa:	0f b6 db             	movzbl %bl,%ebx
    fcad:	4c 01 d3             	add    %r10,%rbx
    fcb0:	49 83 d1 00          	adc    $0x0,%r9
    fcb4:	48 89 d8             	mov    %rbx,%rax
    fcb7:	4c 09 c8             	or     %r9,%rax
    fcba:	74 30                	je     fcec <hyperinterval::ieee::Format::div+0x35c>
    fcbc:	49 0f bd c1          	bsr    %r9,%rax
    fcc0:	83 f0 3f             	xor    $0x3f,%eax
    fcc3:	4c 0f bd d3          	bsr    %rbx,%r10
    fcc7:	41 83 f2 3f          	xor    $0x3f,%r10d
    fccb:	41 83 ca 40          	or     $0x40,%r10d
    fccf:	4d 85 c9             	test   %r9,%r9
    fcd2:	44 0f 45 d0          	cmovne %eax,%r10d
    fcd6:	41 83 f2 7f          	xor    $0x7f,%r10d
    fcda:	43 8d 2c 3a          	lea    (%r10,%r15,1),%ebp
    fcde:	39 d5                	cmp    %edx,%ebp
    fce0:	7e 0e                	jle    fcf0 <hyperinterval::ieee::Format::div+0x360>
    fce2:	66 c7 07 01 03       	movw   $0x301,(%rdi)
    fce7:	e9 b4 00 00 00       	jmp    fda0 <hyperinterval::ieee::Format::div+0x410>
    fcec:	31 c0                	xor    %eax,%eax
    fcee:	eb 76                	jmp    fd66 <hyperinterval::ieee::Format::div+0x3d6>
    fcf0:	b8 01 00 00 00       	mov    $0x1,%eax
    fcf5:	29 d0                	sub    %edx,%eax
    fcf7:	39 c5                	cmp    %eax,%ebp
    fcf9:	7d 18                	jge    fd13 <hyperinterval::ieee::Format::div+0x383>
    fcfb:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    fd00:	44 01 f9             	add    %r15d,%ecx
    fd03:	fe c9                	dec    %cl
    fd05:	48 d3 e3             	shl    %cl,%rbx
    fd08:	31 c0                	xor    %eax,%eax
    fd0a:	f6 c1 40             	test   $0x40,%cl
    fd0d:	48 0f 44 c3          	cmove  %rbx,%rax
    fd11:	eb 53                	jmp    fd66 <hyperinterval::ieee::Format::div+0x3d6>
    fd13:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
    fd18:	44 89 e9             	mov    %r13d,%ecx
    fd1b:	44 29 d1             	sub    %r10d,%ecx
    fd1e:	89 c8                	mov    %ecx,%eax
    fd20:	f7 d8                	neg    %eax
    fd22:	49 89 df             	mov    %rbx,%r15
    fd25:	49 d3 e7             	shl    %cl,%r15
    fd28:	45 31 e4             	xor    %r12d,%r12d
    fd2b:	f6 c1 40             	test   $0x40,%cl
    fd2e:	4d 0f 44 e7          	cmove  %r15,%r12
    fd32:	89 c1                	mov    %eax,%ecx
    fd34:	4c 0f ad cb          	shrd   %cl,%r9,%rbx
    fd38:	49 d3 e9             	shr    %cl,%r9
    fd3b:	a8 40                	test   $0x40,%al
    fd3d:	4c 0f 44 cb          	cmove  %rbx,%r9
    fd41:	45 39 d5             	cmp    %r10d,%r13d
    fd44:	4d 0f 43 cc          	cmovae %r12,%r9
    fd48:	01 d5                	add    %edx,%ebp
    fd4a:	48 63 d5             	movslq %ebp,%rdx
    fd4d:	44 89 f1             	mov    %r14d,%ecx
    fd50:	48 d3 e2             	shl    %cl,%rdx
    fd53:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    fd5a:	48 d3 e0             	shl    %cl,%rax
    fd5d:	48 f7 d0             	not    %rax
    fd60:	4c 21 c8             	and    %r9,%rax
    fd63:	48 09 d0             	or     %rdx,%rax
    fd66:	48 85 74 24 40       	test   %rsi,0x40(%rsp)
    fd6b:	0f 95 c1             	setne  %cl
    fd6e:	49 85 f0             	test   %rsi,%r8
    fd71:	0f 94 c2             	sete   %dl
    fd74:	30 ca                	xor    %cl,%dl
    fd76:	75 1d                	jne    fd95 <hyperinterval::ieee::Format::div+0x405>
    fd78:	48 89 c1             	mov    %rax,%rcx
    fd7b:	48 31 f1             	xor    %rsi,%rcx
    fd7e:	48 85 c0             	test   %rax,%rax
    fd81:	48 0f 44 c8          	cmove  %rax,%rcx
    fd85:	4c 31 de             	xor    %r11,%rsi
    fd88:	4d 85 db             	test   %r11,%r11
    fd8b:	49 0f 44 f3          	cmove  %r11,%rsi
    fd8f:	48 89 f0             	mov    %rsi,%rax
    fd92:	49 89 cb             	mov    %rcx,%r11
    fd95:	4c 89 5f 08          	mov    %r11,0x8(%rdi)
    fd99:	48 89 47 10          	mov    %rax,0x10(%rdi)
    fd9d:	c6 07 00             	movb   $0x0,(%rdi)
    fda0:	48 89 f8             	mov    %rdi,%rax
    fda3:	48 83 c4 48          	add    $0x48,%rsp
    fda7:	5b                   	pop    %rbx
    fda8:	41 5c                	pop    %r12
    fdaa:	41 5d                	pop    %r13
    fdac:	41 5e                	pop    %r14
    fdae:	41 5f                	pop    %r15
    fdb0:	5d                   	pop    %rbp
    fdb1:	c3                   	ret
    fdb2:	48 8d 3d bf dd 04 00 	lea    0x4ddbf(%rip),%rdi        # 5db78 <__do_global_dtors_aux_fini_array_entry+0x2d0>
    fdb9:	ff 15 79 10 05 00    	call   *0x51079(%rip)        # 60e38 <_GLOBAL_OFFSET_TABLE_+0x880>
    fdbf:	48 8d 3d 9a dd 04 00 	lea    0x4dd9a(%rip),%rdi        # 5db60 <__do_global_dtors_aux_fini_array_entry+0x2b8>
    fdc6:	ff 15 6c 10 05 00    	call   *0x5106c(%rip)        # 60e38 <_GLOBAL_OFFSET_TABLE_+0x880>
    fdcc:	0f 1f 40 00          	nopl   0x0(%rax)

hyperinterval::ieee::Format::power:
    fdd0:	55                   	push   %rbp
    fdd1:	41 57                	push   %r15
    fdd3:	41 56                	push   %r14
    fdd5:	41 55                	push   %r13
    fdd7:	41 54                	push   %r12
    fdd9:	53                   	push   %rbx
    fdda:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
    fde1:	48 89 cb             	mov    %rcx,%rbx
    fde4:	49 89 d6             	mov    %rdx,%r14
    fde7:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
    fdec:	48 85 f1             	test   %rsi,%rcx
    fdef:	0f 95 44 24 0f       	setne  0xf(%rsp)
    fdf4:	b8 40 00 00 00       	mov    $0x40,%eax
    fdf9:	f3 48 0f bc c2       	tzcnt  %rdx,%rax
    fdfe:	41 89 c2             	mov    %eax,%r10d
    fe01:	41 83 e2 3f          	and    $0x3f,%r10d
    fe05:	44 89 d1             	mov    %r10d,%ecx
    fe08:	48 d3 ea             	shr    %cl,%rdx
    fe0b:	48 89 d1             	mov    %rdx,%rcx
    fe0e:	48 d1 e9             	shr    $1,%rcx
    fe11:	4c 63 d9             	movslq %ecx,%r11
    fe14:	44 89 d1             	mov    %r10d,%ecx
    fe17:	49 d3 e3             	shl    %cl,%r11
    fe1a:	45 85 c0             	test   %r8d,%r8d
    fe1d:	44 89 44 24 70       	mov    %r8d,0x70(%rsp)
    fe22:	4c 89 5c 24 68       	mov    %r11,0x68(%rsp)
    fe27:	0f 84 55 03 00 00    	je     10182 <hyperinterval::ieee::Format::power+0x3b2>
    fe2d:	41 b9 01 00 00 00    	mov    $0x1,%r9d
    fe33:	44 89 d1             	mov    %r10d,%ecx
    fe36:	49 d3 e1             	shl    %cl,%r9
    fe39:	48 8d 4e ff          	lea    -0x1(%rsi),%rcx
    fe3d:	48 21 cb             	and    %rcx,%rbx
    fe40:	4d 8d 79 ff          	lea    -0x1(%r9),%r15
    fe44:	44 8d 24 42          	lea    (%rdx,%rax,2),%r12d
    fe48:	41 83 e4 fe          	and    $0xfffffffe,%r12d
    fe4c:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    fe51:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
    fe56:	48 89 d9             	mov    %rbx,%rcx
    fe59:	44 89 c0             	mov    %r8d,%eax
    fe5c:	49 89 d8             	mov    %rbx,%r8
    fe5f:	4c 89 5c 24 10       	mov    %r11,0x10(%rsp)
    fe64:	49 89 cd             	mov    %rcx,%r13
    fe67:	4c 89 8c 24 88 00 00 	mov    %r9,0x88(%rsp)
    fe6e:	00 
    fe6f:	4c 89 94 24 80 00 00 	mov    %r10,0x80(%rsp)
    fe76:	00 
    fe77:	4c 89 7c 24 78       	mov    %r15,0x78(%rsp)
    fe7c:	44 89 64 24 74       	mov    %r12d,0x74(%rsp)
    fe81:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    fe88:	0f 1f 84 00 00 00 00 
    fe8f:	00 
    fe90:	a8 01                	test   $0x1,%al
    fe92:	4c 89 84 24 90 00 00 	mov    %r8,0x90(%rsp)
    fe99:	00 
    fe9a:	89 44 24 24          	mov    %eax,0x24(%rsp)
    fe9e:	0f 84 87 01 00 00    	je     1002b <hyperinterval::ieee::Format::power+0x25b>
    fea4:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
    fea9:	4c 89 c2             	mov    %r8,%rdx
    feac:	4c 21 f2             	and    %r14,%rdx
    feaf:	44 89 d1             	mov    %r10d,%ecx
    feb2:	48 d3 ea             	shr    %cl,%rdx
    feb5:	4c 89 c0             	mov    %r8,%rax
    feb8:	4c 21 f8             	and    %r15,%rax
    febb:	48 85 d2             	test   %rdx,%rdx
    febe:	41 89 d3             	mov    %edx,%r11d
    fec1:	b9 01 00 00 00       	mov    $0x1,%ecx
    fec6:	44 0f 44 d9          	cmove  %ecx,%r11d
    feca:	49 0f 45 d1          	cmovne %r9,%rdx
    fece:	48 09 c2             	or     %rax,%rdx
    fed1:	49 85 f0             	test   %rsi,%r8
    fed4:	0f 95 44 24 10       	setne  0x10(%rsp)
    fed9:	4c 89 e8             	mov    %r13,%rax
    fedc:	4c 21 f0             	and    %r14,%rax
    fedf:	44 89 d1             	mov    %r10d,%ecx
    fee2:	48 d3 e8             	shr    %cl,%rax
    fee5:	4c 89 e9             	mov    %r13,%rcx
    fee8:	4c 21 f9             	and    %r15,%rcx
    feeb:	48 85 c0             	test   %rax,%rax
    feee:	41 89 c0             	mov    %eax,%r8d
    fef1:	bb 01 00 00 00       	mov    $0x1,%ebx
    fef6:	44 0f 44 c3          	cmove  %ebx,%r8d
    fefa:	49 0f 45 c1          	cmovne %r9,%rax
    fefe:	48 09 c8             	or     %rcx,%rax
    ff01:	49 85 f5             	test   %rsi,%r13
    ff04:	0f 95 c1             	setne  %cl
    ff07:	32 4c 24 10          	xor    0x10(%rsp),%cl
    ff0b:	48 f7 e2             	mul    %rdx
    ff0e:	45 29 e3             	sub    %r12d,%r11d
    ff11:	45 01 c3             	add    %r8d,%r11d
    ff14:	88 4c 24 54          	mov    %cl,0x54(%rsp)
    ff18:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
    ff1d:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    ff22:	44 89 5c 24 50       	mov    %r11d,0x50(%rsp)
    ff27:	4c 89 f2             	mov    %r14,%rdx
    ff2a:	48 89 e9             	mov    %rbp,%rcx
    ff2d:	4d 89 cc             	mov    %r9,%r12
    ff30:	48 89 f5             	mov    %rsi,%rbp
    ff33:	4c 89 f3             	mov    %r14,%rbx
    ff36:	4d 89 d6             	mov    %r10,%r14
    ff39:	e8 a2 f0 ff ff       	call   efe0 <hyperinterval::ieee::Format::rounded>
    ff3e:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
    ff43:	0f 85 28 02 00 00    	jne    10171 <hyperinterval::ieee::Format::power+0x3a1>
    ff49:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
    ff4e:	48 89 fa             	mov    %rdi,%rdx
    ff51:	48 21 da             	and    %rbx,%rdx
    ff54:	44 89 f1             	mov    %r14d,%ecx
    ff57:	48 d3 ea             	shr    %cl,%rdx
    ff5a:	48 89 f8             	mov    %rdi,%rax
    ff5d:	4c 21 f8             	and    %r15,%rax
    ff60:	48 85 d2             	test   %rdx,%rdx
    ff63:	89 d6                	mov    %edx,%esi
    ff65:	41 ba 01 00 00 00    	mov    $0x1,%r10d
    ff6b:	41 0f 44 f2          	cmove  %r10d,%esi
    ff6f:	49 0f 45 d4          	cmovne %r12,%rdx
    ff73:	48 09 c2             	or     %rax,%rdx
    ff76:	48 85 ef             	test   %rbp,%rdi
    ff79:	40 0f 95 c7          	setne  %dil
    ff7d:	4c 8b 8c 24 90 00 00 	mov    0x90(%rsp),%r9
    ff84:	00 
    ff85:	4c 89 c8             	mov    %r9,%rax
    ff88:	48 21 d8             	and    %rbx,%rax
    ff8b:	48 d3 e8             	shr    %cl,%rax
    ff8e:	4c 89 c9             	mov    %r9,%rcx
    ff91:	4c 21 f9             	and    %r15,%rcx
    ff94:	48 85 c0             	test   %rax,%rax
    ff97:	41 89 c0             	mov    %eax,%r8d
    ff9a:	45 0f 44 c2          	cmove  %r10d,%r8d
    ff9e:	49 0f 45 c4          	cmovne %r12,%rax
    ffa2:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
    ffa7:	48 09 c8             	or     %rcx,%rax
    ffaa:	49 85 e9             	test   %rbp,%r9
    ffad:	0f 95 c1             	setne  %cl
    ffb0:	40 30 f9             	xor    %dil,%cl
    ffb3:	48 f7 e2             	mul    %rdx
    ffb6:	44 8b 64 24 74       	mov    0x74(%rsp),%r12d
    ffbb:	44 29 e6             	sub    %r12d,%esi
    ffbe:	44 01 c6             	add    %r8d,%esi
    ffc1:	88 4c 24 54          	mov    %cl,0x54(%rsp)
    ffc5:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
    ffca:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    ffcf:	89 74 24 50          	mov    %esi,0x50(%rsp)
    ffd3:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    ffd8:	48 89 ee             	mov    %rbp,%rsi
    ffdb:	48 89 da             	mov    %rbx,%rdx
    ffde:	48 8d 4c 24 40       	lea    0x40(%rsp),%rcx
    ffe3:	e8 f8 ef ff ff       	call   efe0 <hyperinterval::ieee::Format::rounded>
    ffe8:	80 7c 24 28 01       	cmpb   $0x1,0x28(%rsp)
    ffed:	0f 84 7e 01 00 00    	je     10171 <hyperinterval::ieee::Format::power+0x3a1>
    fff3:	48 89 ee             	mov    %rbp,%rsi
    fff6:	49 89 de             	mov    %rbx,%r14
    fff9:	4c 89 7c 24 10       	mov    %r15,0x10(%rsp)
    fffe:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   10003:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
   10008:	4c 8b 8c 24 88 00 00 	mov    0x88(%rsp),%r9
   1000f:	00 
   10010:	4c 8b 94 24 80 00 00 	mov    0x80(%rsp),%r10
   10017:	00 
   10018:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
   1001d:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   10022:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
   10027:	8b 44 24 24          	mov    0x24(%rsp),%eax
   1002b:	83 f8 01             	cmp    $0x1,%eax
   1002e:	ba 02 00 00 00       	mov    $0x2,%edx
   10033:	0f 84 02 01 00 00    	je     1013b <hyperinterval::ieee::Format::power+0x36b>
   10039:	4c 89 e8             	mov    %r13,%rax
   1003c:	4c 21 f0             	and    %r14,%rax
   1003f:	44 89 d1             	mov    %r10d,%ecx
   10042:	48 d3 e8             	shr    %cl,%rax
   10045:	4d 21 fd             	and    %r15,%r13
   10048:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
   1004b:	48 85 c0             	test   %rax,%rax
   1004e:	49 0f 45 c1          	cmovne %r9,%rax
   10052:	0f 44 ca             	cmove  %edx,%ecx
   10055:	4c 09 e8             	or     %r13,%rax
   10058:	48 f7 e0             	mul    %rax
   1005b:	44 29 e1             	sub    %r12d,%ecx
   1005e:	c6 44 24 54 00       	movb   $0x0,0x54(%rsp)
   10063:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
   10068:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1006d:	89 4c 24 50          	mov    %ecx,0x50(%rsp)
   10071:	4c 89 f2             	mov    %r14,%rdx
   10074:	48 89 e9             	mov    %rbp,%rcx
   10077:	44 89 e5             	mov    %r12d,%ebp
   1007a:	4d 89 cc             	mov    %r9,%r12
   1007d:	4d 89 fd             	mov    %r15,%r13
   10080:	49 89 f7             	mov    %rsi,%r15
   10083:	4c 89 f3             	mov    %r14,%rbx
   10086:	4d 89 d6             	mov    %r10,%r14
   10089:	e8 52 ef ff ff       	call   efe0 <hyperinterval::ieee::Format::rounded>
   1008e:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
   10093:	0f 85 d8 00 00 00    	jne    10171 <hyperinterval::ieee::Format::power+0x3a1>
   10099:	48 8b 94 24 90 00 00 	mov    0x90(%rsp),%rdx
   100a0:	00 
   100a1:	48 89 d0             	mov    %rdx,%rax
   100a4:	48 21 d8             	and    %rbx,%rax
   100a7:	44 89 f1             	mov    %r14d,%ecx
   100aa:	48 d3 e8             	shr    %cl,%rax
   100ad:	4c 21 ea             	and    %r13,%rdx
   100b0:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
   100b3:	48 85 c0             	test   %rax,%rax
   100b6:	49 0f 45 c4          	cmovne %r12,%rax
   100ba:	be 02 00 00 00       	mov    $0x2,%esi
   100bf:	0f 44 ce             	cmove  %esi,%ecx
   100c2:	48 09 d0             	or     %rdx,%rax
   100c5:	48 f7 e0             	mul    %rax
   100c8:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
   100cd:	29 e9                	sub    %ebp,%ecx
   100cf:	c6 44 24 54 00       	movb   $0x0,0x54(%rsp)
   100d4:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
   100d9:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   100de:	89 4c 24 50          	mov    %ecx,0x50(%rsp)
   100e2:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   100e7:	4c 89 fe             	mov    %r15,%rsi
   100ea:	48 89 da             	mov    %rbx,%rdx
   100ed:	48 8d 4c 24 40       	lea    0x40(%rsp),%rcx
   100f2:	e8 e9 ee ff ff       	call   efe0 <hyperinterval::ieee::Format::rounded>
   100f7:	80 7c 24 28 01       	cmpb   $0x1,0x28(%rsp)
   100fc:	74 73                	je     10171 <hyperinterval::ieee::Format::power+0x3a1>
   100fe:	4c 89 fe             	mov    %r15,%rsi
   10101:	49 89 de             	mov    %rbx,%r14
   10104:	41 89 ec             	mov    %ebp,%r12d
   10107:	8b 4c 24 24          	mov    0x24(%rsp),%ecx
   1010b:	89 c8                	mov    %ecx,%eax
   1010d:	d1 e8                	shr    $1,%eax
   1010f:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
   10114:	85 c9                	test   %ecx,%ecx
   10116:	4c 8b 8c 24 88 00 00 	mov    0x88(%rsp),%r9
   1011d:	00 
   1011e:	4c 8b 94 24 80 00 00 	mov    0x80(%rsp),%r10
   10125:	00 
   10126:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
   1012b:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   10130:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
   10135:	0f 85 55 fd ff ff    	jne    fe90 <hyperinterval::ieee::Format::power+0xc0>
   1013b:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
   10140:	22 44 24 70          	and    0x70(%rsp),%al
   10144:	74 4c                	je     10192 <hyperinterval::ieee::Format::power+0x3c2>
   10146:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
   1014b:	48 89 c8             	mov    %rcx,%rax
   1014e:	48 31 f0             	xor    %rsi,%rax
   10151:	48 85 c9             	test   %rcx,%rcx
   10154:	48 0f 44 c1          	cmove  %rcx,%rax
   10158:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1015d:	48 31 ce             	xor    %rcx,%rsi
   10160:	48 85 c9             	test   %rcx,%rcx
   10163:	48 0f 44 f1          	cmove  %rcx,%rsi
   10167:	48 89 c1             	mov    %rax,%rcx
   1016a:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1016f:	eb 30                	jmp    101a1 <hyperinterval::ieee::Format::power+0x3d1>
   10171:	0f b6 4c 24 29       	movzbl 0x29(%rsp),%ecx
   10176:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1017b:	88 48 01             	mov    %cl,0x1(%rax)
   1017e:	b1 01                	mov    $0x1,%cl
   10180:	eb 29                	jmp    101ab <hyperinterval::ieee::Format::power+0x3db>
   10182:	4c 89 5c 24 10       	mov    %r11,0x10(%rsp)
   10187:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
   1018c:	22 44 24 70          	and    0x70(%rsp),%al
   10190:	75 b4                	jne    10146 <hyperinterval::ieee::Format::power+0x376>
   10192:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   10197:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
   1019c:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   101a1:	48 89 48 08          	mov    %rcx,0x8(%rax)
   101a5:	48 89 70 10          	mov    %rsi,0x10(%rax)
   101a9:	31 c9                	xor    %ecx,%ecx
   101ab:	88 08                	mov    %cl,(%rax)
   101ad:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   101b4:	5b                   	pop    %rbx
   101b5:	41 5c                	pop    %r12
   101b7:	41 5d                	pop    %r13
   101b9:	41 5e                	pop    %r14
   101bb:	41 5f                	pop    %r15
   101bd:	5d                   	pop    %rbp
   101be:	c3                   	ret
   101bf:	90                   	nop

__udivti3:
   4d630:	49 89 d0             	mov    %rdx,%r8
   4d633:	48 85 c9             	test   %rcx,%rcx
   4d636:	74 7b                	je     4d6b3 <__udivti3+0x83>
   4d638:	55                   	push   %rbp
   4d639:	48 89 e5             	mov    %rsp,%rbp
   4d63c:	53                   	push   %rbx
   4d63d:	4c 0f bd c9          	bsr    %rcx,%r9
   4d641:	44 89 ca             	mov    %r9d,%edx
   4d644:	83 f2 3f             	xor    $0x3f,%edx
   4d647:	b0 40                	mov    $0x40,%al
   4d649:	28 d0                	sub    %dl,%al
   4d64b:	4c 89 c2             	mov    %r8,%rdx
   4d64e:	49 89 cb             	mov    %rcx,%r11
   4d651:	89 c1                	mov    %eax,%ecx
   4d653:	4c 0f ad da          	shrd   %cl,%r11,%rdx
   4d657:	4d 89 da             	mov    %r11,%r10
   4d65a:	49 d3 ea             	shr    %cl,%r10
   4d65d:	a8 40                	test   $0x40,%al
   4d65f:	4c 0f 44 d2          	cmove  %rdx,%r10
   4d663:	48 89 f0             	mov    %rsi,%rax
   4d666:	48 0f a4 f8 3f       	shld   $0x3f,%rdi,%rax
   4d66b:	48 89 f2             	mov    %rsi,%rdx
   4d66e:	48 d1 ea             	shr    $1,%rdx
   4d671:	49 f7 f2             	div    %r10
   4d674:	49 89 c2             	mov    %rax,%r10
   4d677:	44 89 c9             	mov    %r9d,%ecx
   4d67a:	49 d3 ea             	shr    %cl,%r10
   4d67d:	31 c9                	xor    %ecx,%ecx
   4d67f:	49 83 ea 01          	sub    $0x1,%r10
   4d683:	4c 0f 42 d1          	cmovb  %rcx,%r10
   4d687:	4c 89 db             	mov    %r11,%rbx
   4d68a:	4c 89 c0             	mov    %r8,%rax
   4d68d:	49 f7 e2             	mul    %r10
   4d690:	49 89 c1             	mov    %rax,%r9
   4d693:	4c 89 d0             	mov    %r10,%rax
   4d696:	49 0f af da          	imul   %r10,%rbx
   4d69a:	48 01 da             	add    %rbx,%rdx
   4d69d:	4c 29 cf             	sub    %r9,%rdi
   4d6a0:	48 19 d6             	sbb    %rdx,%rsi
   4d6a3:	4c 39 c7             	cmp    %r8,%rdi
   4d6a6:	4c 19 de             	sbb    %r11,%rsi
   4d6a9:	48 83 d8 ff          	sbb    $0xffffffffffffffff,%rax
   4d6ad:	5b                   	pop    %rbx
   4d6ae:	5d                   	pop    %rbp
   4d6af:	48 89 ca             	mov    %rcx,%rdx
   4d6b2:	c3                   	ret
   4d6b3:	4c 39 c6             	cmp    %r8,%rsi
   4d6b6:	73 0f                	jae    4d6c7 <__udivti3+0x97>
   4d6b8:	48 89 f8             	mov    %rdi,%rax
   4d6bb:	48 89 f2             	mov    %rsi,%rdx
   4d6be:	49 f7 f0             	div    %r8
   4d6c1:	31 c9                	xor    %ecx,%ecx
   4d6c3:	48 89 ca             	mov    %rcx,%rdx
   4d6c6:	c3                   	ret
   4d6c7:	48 89 f0             	mov    %rsi,%rax
   4d6ca:	4c 09 c0             	or     %r8,%rax
   4d6cd:	48 c1 e8 20          	shr    $0x20,%rax
   4d6d1:	74 15                	je     4d6e8 <__udivti3+0xb8>
   4d6d3:	48 89 f0             	mov    %rsi,%rax
   4d6d6:	31 d2                	xor    %edx,%edx
   4d6d8:	49 f7 f0             	div    %r8
   4d6db:	48 89 c1             	mov    %rax,%rcx
   4d6de:	48 89 f8             	mov    %rdi,%rax
   4d6e1:	49 f7 f0             	div    %r8
   4d6e4:	48 89 ca             	mov    %rcx,%rdx
   4d6e7:	c3                   	ret
   4d6e8:	89 f0                	mov    %esi,%eax
   4d6ea:	31 d2                	xor    %edx,%edx
   4d6ec:	41 f7 f0             	div    %r8d
   4d6ef:	89 c1                	mov    %eax,%ecx
   4d6f1:	48 89 f8             	mov    %rdi,%rax
   4d6f4:	49 f7 f0             	div    %r8
   4d6f7:	48 89 ca             	mov    %rcx,%rdx
   4d6fa:	c3                   	ret

Disassembly of section .fini:
