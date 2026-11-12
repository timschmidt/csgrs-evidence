hyperinterval_strict_chain32:
   169d0:	53                   	push   %rbx
   169d1:	48 83 ec 60          	sub    $0x60,%rsp
   169d5:	48 89 fb             	mov    %rdi,%rbx
   169d8:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   169dd:	ff 15 0d 73 04 00    	call   *0x4730d(%rip)        # 5dcf0 <_DYNAMIC+0x2b0>
   169e3:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   169e7:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   169ec:	83 f9 02             	cmp    $0x2,%ecx
   169ef:	0f 84 f4 00 00 00    	je     16ae9 <hyperinterval_strict_chain32+0x119>
   169f5:	8b 54 24 11          	mov    0x11(%rsp),%edx
   169f9:	8b 74 24 14          	mov    0x14(%rsp),%esi
   169fd:	89 74 24 5c          	mov    %esi,0x5c(%rsp)
   16a01:	89 54 24 59          	mov    %edx,0x59(%rsp)
   16a05:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
   16a09:	88 44 24 58          	mov    %al,0x58(%rsp)
   16a0d:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   16a12:	48 8d 74 24 54       	lea    0x54(%rsp),%rsi
   16a17:	f3 0f 10 05 c9 ed fe 	movss  -0x11237(%rip),%xmm0        # 57e8 <__abi_tag+0x54ec>
   16a1e:	ff 
   16a1f:	f3 0f 10 0d b9 ed fe 	movss  -0x11247(%rip),%xmm1        # 57e0 <__abi_tag+0x54e4>
   16a26:	ff 
   16a27:	ff 15 cb 72 04 00    	call   *0x472cb(%rip)        # 5dcf8 <_DYNAMIC+0x2b8>
   16a2d:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
   16a31:	0f b6 44 24 1c       	movzbl 0x1c(%rsp),%eax
   16a36:	83 f9 02             	cmp    $0x2,%ecx
   16a39:	0f 84 aa 00 00 00    	je     16ae9 <hyperinterval_strict_chain32+0x119>
   16a3f:	8b 54 24 1d          	mov    0x1d(%rsp),%edx
   16a43:	8b 74 24 20          	mov    0x20(%rsp),%esi
   16a47:	89 74 24 50          	mov    %esi,0x50(%rsp)
   16a4b:	89 54 24 4d          	mov    %edx,0x4d(%rsp)
   16a4f:	89 4c 24 48          	mov    %ecx,0x48(%rsp)
   16a53:	88 44 24 4c          	mov    %al,0x4c(%rsp)
   16a57:	48 8d 7c 24 3c       	lea    0x3c(%rsp),%rdi
   16a5c:	48 8d 74 24 48       	lea    0x48(%rsp),%rsi
   16a61:	ff 15 99 72 04 00    	call   *0x47299(%rip)        # 5dd00 <_DYNAMIC+0x2c0>
   16a67:	8b 4c 24 3c          	mov    0x3c(%rsp),%ecx
   16a6b:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   16a70:	83 f9 02             	cmp    $0x2,%ecx
   16a73:	74 74                	je     16ae9 <hyperinterval_strict_chain32+0x119>
   16a75:	8b 54 24 41          	mov    0x41(%rsp),%edx
   16a79:	8b 74 24 44          	mov    0x44(%rsp),%esi
   16a7d:	89 74 24 38          	mov    %esi,0x38(%rsp)
   16a81:	89 54 24 35          	mov    %edx,0x35(%rsp)
   16a85:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   16a89:	88 44 24 34          	mov    %al,0x34(%rsp)
   16a8d:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   16a92:	f3 0f 10 05 1a ed fe 	movss  -0x112e6(%rip),%xmm0        # 57b4 <__abi_tag+0x54b8>
   16a99:	ff 
   16a9a:	ff 15 68 72 04 00    	call   *0x47268(%rip)        # 5dd08 <_DYNAMIC+0x2c8>
   16aa0:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   16aa4:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   16aa9:	83 f9 02             	cmp    $0x2,%ecx
   16aac:	74 3b                	je     16ae9 <hyperinterval_strict_chain32+0x119>
   16aae:	8b 54 24 11          	mov    0x11(%rsp),%edx
   16ab2:	8b 74 24 14          	mov    0x14(%rsp),%esi
   16ab6:	89 74 24 20          	mov    %esi,0x20(%rsp)
   16aba:	89 54 24 1d          	mov    %edx,0x1d(%rsp)
   16abe:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
   16ac2:	88 44 24 1c          	mov    %al,0x1c(%rsp)
   16ac6:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
   16acb:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   16ad0:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
   16ad5:	ff 15 35 72 04 00    	call   *0x47235(%rip)        # 5dd10 <_DYNAMIC+0x2d0>
   16adb:	8b 4c 24 24          	mov    0x24(%rsp),%ecx
   16adf:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   16ae4:	83 f9 02             	cmp    $0x2,%ecx
   16ae7:	75 12                	jne    16afb <hyperinterval_strict_chain32+0x12b>
   16ae9:	88 43 04             	mov    %al,0x4(%rbx)
   16aec:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   16af2:	48 89 d8             	mov    %rbx,%rax
   16af5:	48 83 c4 60          	add    $0x60,%rsp
   16af9:	5b                   	pop    %rbx
   16afa:	c3                   	ret
   16afb:	8b 54 24 29          	mov    0x29(%rsp),%edx
   16aff:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
   16b03:	89 74 24 14          	mov    %esi,0x14(%rsp)
   16b07:	89 54 24 11          	mov    %edx,0x11(%rsp)
   16b0b:	89 4c 24 0c          	mov    %ecx,0xc(%rsp)
   16b0f:	88 44 24 10          	mov    %al,0x10(%rsp)
   16b13:	48 8d 74 24 0c       	lea    0xc(%rsp),%rsi
   16b18:	48 89 df             	mov    %rbx,%rdi
   16b1b:	ff 15 f7 71 04 00    	call   *0x471f7(%rip)        # 5dd18 <_DYNAMIC+0x2d8>
   16b21:	48 89 d8             	mov    %rbx,%rax
   16b24:	48 83 c4 60          	add    $0x60,%rsp
   16b28:	5b                   	pop    %rbx
   16b29:	c3                   	ret
   16b2a:	cc                   	int3
   16b2b:	cc                   	int3
   16b2c:	cc                   	int3
   16b2d:	cc                   	int3
   16b2e:	cc                   	int3
   16b2f:	cc                   	int3

hyperinterval_strict_chain64:
   16b30:	53                   	push   %rbx
   16b31:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
   16b38:	48 89 fb             	mov    %rdi,%rbx
   16b3b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   16b40:	ff 15 da 71 04 00    	call   *0x471da(%rip)        # 5dd20 <_DYNAMIC+0x2e0>
   16b46:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   16b4b:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   16b50:	48 83 f9 02          	cmp    $0x2,%rcx
   16b54:	0f 84 32 01 00 00    	je     16c8c <hyperinterval_strict_chain64+0x15c>
   16b5a:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   16b5f:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   16b64:	48 89 b4 24 a8 00 00 	mov    %rsi,0xa8(%rsp)
   16b6b:	00 
   16b6c:	48 89 94 24 a1 00 00 	mov    %rdx,0xa1(%rsp)
   16b73:	00 
   16b74:	48 89 8c 24 98 00 00 	mov    %rcx,0x98(%rsp)
   16b7b:	00 
   16b7c:	88 84 24 a0 00 00 00 	mov    %al,0xa0(%rsp)
   16b83:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   16b88:	48 8d b4 24 98 00 00 	lea    0x98(%rsp),%rsi
   16b8f:	00 
   16b90:	f2 0f 10 05 d8 eb fe 	movsd  -0x11428(%rip),%xmm0        # 5770 <__abi_tag+0x5474>
   16b97:	ff 
   16b98:	f2 0f 10 0d e0 eb fe 	movsd  -0x11420(%rip),%xmm1        # 5780 <__abi_tag+0x5484>
   16b9f:	ff 
   16ba0:	ff 15 82 71 04 00    	call   *0x47182(%rip)        # 5dd28 <_DYNAMIC+0x2e8>
   16ba6:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   16bab:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   16bb0:	48 83 f9 02          	cmp    $0x2,%rcx
   16bb4:	0f 84 d2 00 00 00    	je     16c8c <hyperinterval_strict_chain64+0x15c>
   16bba:	48 8b 54 24 29       	mov    0x29(%rsp),%rdx
   16bbf:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   16bc4:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
   16bcb:	00 
   16bcc:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
   16bd3:	00 
   16bd4:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
   16bdb:	00 
   16bdc:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
   16be3:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
   16be8:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   16bef:	00 
   16bf0:	ff 15 3a 71 04 00    	call   *0x4713a(%rip)        # 5dd30 <_DYNAMIC+0x2f0>
   16bf6:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
   16bfb:	0f b6 44 24 70       	movzbl 0x70(%rsp),%eax
   16c00:	48 83 f9 02          	cmp    $0x2,%rcx
   16c04:	0f 84 82 00 00 00    	je     16c8c <hyperinterval_strict_chain64+0x15c>
   16c0a:	48 8b 54 24 71       	mov    0x71(%rsp),%rdx
   16c0f:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
   16c14:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   16c19:	48 89 54 24 59       	mov    %rdx,0x59(%rsp)
   16c1e:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
   16c23:	88 44 24 58          	mov    %al,0x58(%rsp)
   16c27:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   16c2c:	f2 0f 10 05 2c eb fe 	movsd  -0x114d4(%rip),%xmm0        # 5760 <__abi_tag+0x5464>
   16c33:	ff 
   16c34:	ff 15 fe 70 04 00    	call   *0x470fe(%rip)        # 5dd38 <_DYNAMIC+0x2f8>
   16c3a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   16c3f:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   16c44:	48 83 f9 02          	cmp    $0x2,%rcx
   16c48:	74 42                	je     16c8c <hyperinterval_strict_chain64+0x15c>
   16c4a:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   16c4f:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   16c54:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   16c59:	48 89 54 24 29       	mov    %rdx,0x29(%rsp)
   16c5e:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   16c63:	88 44 24 28          	mov    %al,0x28(%rsp)
   16c67:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   16c6c:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   16c71:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
   16c76:	ff 15 c4 70 04 00    	call   *0x470c4(%rip)        # 5dd40 <_DYNAMIC+0x300>
   16c7c:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   16c81:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   16c86:	48 83 f9 02          	cmp    $0x2,%rcx
   16c8a:	75 16                	jne    16ca2 <hyperinterval_strict_chain64+0x172>
   16c8c:	88 43 08             	mov    %al,0x8(%rbx)
   16c8f:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   16c96:	48 89 d8             	mov    %rbx,%rax
   16c99:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   16ca0:	5b                   	pop    %rbx
   16ca1:	c3                   	ret
   16ca2:	48 8b 54 24 41       	mov    0x41(%rsp),%rdx
   16ca7:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
   16cac:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
   16cb1:	48 89 54 24 11       	mov    %rdx,0x11(%rsp)
   16cb6:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   16cbb:	88 44 24 10          	mov    %al,0x10(%rsp)
   16cbf:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
   16cc4:	48 89 df             	mov    %rbx,%rdi
   16cc7:	ff 15 7b 70 04 00    	call   *0x4707b(%rip)        # 5dd48 <_DYNAMIC+0x308>
   16ccd:	48 89 d8             	mov    %rbx,%rax
   16cd0:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   16cd7:	5b                   	pop    %rbx
   16cd8:	c3                   	ret
   16cd9:	cc                   	int3
   16cda:	cc                   	int3
   16cdb:	cc                   	int3
   16cdc:	cc                   	int3
   16cdd:	cc                   	int3
   16cde:	cc                   	int3
   16cdf:	cc                   	int3

hyperinterval_strict_surface32:
   16ce0:	55                   	push   %rbp
   16ce1:	41 57                	push   %r15
   16ce3:	41 56                	push   %r14
   16ce5:	41 55                	push   %r13
   16ce7:	41 54                	push   %r12
   16ce9:	53                   	push   %rbx
   16cea:	48 83 ec 78          	sub    $0x78,%rsp
   16cee:	41 89 f6             	mov    %esi,%r14d
   16cf1:	48 89 fd             	mov    %rdi,%rbp
   16cf4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   16cf9:	66 0f 7e 44 24 38    	movd   %xmm0,0x38(%rsp)
   16cff:	66 0f 7e 4c 24 1c    	movd   %xmm1,0x1c(%rsp)
   16d05:	ff 15 e5 6f 04 00    	call   *0x46fe5(%rip)        # 5dcf0 <_DYNAMIC+0x2b0>
   16d0b:	44 8b 7c 24 08       	mov    0x8(%rsp),%r15d
   16d10:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   16d15:	41 83 ff 02          	cmp    $0x2,%r15d
   16d19:	75 05                	jne    16d20 <hyperinterval_strict_surface32+0x40>
   16d1b:	88 45 04             	mov    %al,0x4(%rbp)
   16d1e:	eb 45                	jmp    16d65 <hyperinterval_strict_surface32+0x85>
   16d20:	8b 4c 24 0d          	mov    0xd(%rsp),%ecx
   16d24:	8b 54 24 10          	mov    0x10(%rsp),%edx
   16d28:	89 54 24 44          	mov    %edx,0x44(%rsp)
   16d2c:	89 4c 24 41          	mov    %ecx,0x41(%rsp)
   16d30:	44 89 7c 24 3c       	mov    %r15d,0x3c(%rsp)
   16d35:	88 44 24 40          	mov    %al,0x40(%rsp)
   16d39:	66 0f 6e 44 24 38    	movd   0x38(%rsp),%xmm0
   16d3f:	ff 15 0b 70 04 00    	call   *0x4700b(%rip)        # 5dd50 <_DYNAMIC+0x310>
   16d45:	48 89 c3             	mov    %rax,%rbx
   16d48:	f6 c3 01             	test   $0x1,%bl
   16d4b:	74 05                	je     16d52 <hyperinterval_strict_surface32+0x72>
   16d4d:	88 7d 04             	mov    %bh,0x4(%rbp)
   16d50:	eb 13                	jmp    16d65 <hyperinterval_strict_surface32+0x85>
   16d52:	66 0f 6e 44 24 1c    	movd   0x1c(%rsp),%xmm0
   16d58:	ff 15 fa 6f 04 00    	call   *0x46ffa(%rip)        # 5dd58 <_DYNAMIC+0x318>
   16d5e:	a8 01                	test   $0x1,%al
   16d60:	74 1c                	je     16d7e <hyperinterval_strict_surface32+0x9e>
   16d62:	88 65 04             	mov    %ah,0x4(%rbp)
   16d65:	c7 45 00 02 00 00 00 	movl   $0x2,0x0(%rbp)
   16d6c:	48 89 e8             	mov    %rbp,%rax
   16d6f:	48 83 c4 78          	add    $0x78,%rsp
   16d73:	5b                   	pop    %rbx
   16d74:	41 5c                	pop    %r12
   16d76:	41 5d                	pop    %r13
   16d78:	41 5e                	pop    %r14
   16d7a:	41 5f                	pop    %r15
   16d7c:	5d                   	pop    %rbp
   16d7d:	c3                   	ret
   16d7e:	48 c1 eb 20          	shr    $0x20,%rbx
   16d82:	66 0f 6e c3          	movd   %ebx,%xmm0
   16d86:	48 c1 e8 20          	shr    $0x20,%rax
   16d8a:	66 0f 6e c8          	movd   %eax,%xmm1
   16d8e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   16d93:	ff 15 57 6f 04 00    	call   *0x46f57(%rip)        # 5dcf0 <_DYNAMIC+0x2b0>
   16d99:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   16d9d:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   16da2:	83 f9 02             	cmp    $0x2,%ecx
   16da5:	0f 84 70 ff ff ff    	je     16d1b <hyperinterval_strict_surface32+0x3b>
   16dab:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   16daf:	8b 74 24 10          	mov    0x10(%rsp),%esi
   16db3:	89 74 24 5c          	mov    %esi,0x5c(%rsp)
   16db7:	89 54 24 59          	mov    %edx,0x59(%rsp)
   16dbb:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
   16dbf:	88 44 24 58          	mov    %al,0x58(%rsp)
   16dc3:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   16dc8:	48 8d 74 24 3c       	lea    0x3c(%rsp),%rsi
   16dcd:	44 89 f2             	mov    %r14d,%edx
   16dd0:	ff 15 8a 6f 04 00    	call   *0x46f8a(%rip)        # 5dd60 <_DYNAMIC+0x320>
   16dd6:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   16dda:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   16ddf:	83 f9 02             	cmp    $0x2,%ecx
   16de2:	0f 84 33 ff ff ff    	je     16d1b <hyperinterval_strict_surface32+0x3b>
   16de8:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   16dec:	8b 74 24 10          	mov    0x10(%rsp),%esi
   16df0:	89 74 24 34          	mov    %esi,0x34(%rsp)
   16df4:	89 54 24 31          	mov    %edx,0x31(%rsp)
   16df8:	89 4c 24 2c          	mov    %ecx,0x2c(%rsp)
   16dfc:	88 44 24 30          	mov    %al,0x30(%rsp)
   16e00:	48 8d 7c 24 48       	lea    0x48(%rsp),%rdi
   16e05:	48 8d 74 24 2c       	lea    0x2c(%rsp),%rsi
   16e0a:	ff 15 58 6f 04 00    	call   *0x46f58(%rip)        # 5dd68 <_DYNAMIC+0x328>
   16e10:	8b 4c 24 48          	mov    0x48(%rsp),%ecx
   16e14:	0f b6 44 24 4c       	movzbl 0x4c(%rsp),%eax
   16e19:	83 f9 02             	cmp    $0x2,%ecx
   16e1c:	0f 84 f9 fe ff ff    	je     16d1b <hyperinterval_strict_surface32+0x3b>
   16e22:	8b 54 24 4d          	mov    0x4d(%rsp),%edx
   16e26:	8b 74 24 50          	mov    0x50(%rsp),%esi
   16e2a:	89 74 24 28          	mov    %esi,0x28(%rsp)
   16e2e:	89 54 24 25          	mov    %edx,0x25(%rsp)
   16e32:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   16e36:	88 44 24 24          	mov    %al,0x24(%rsp)
   16e3a:	48 8d 5c 24 6c       	lea    0x6c(%rsp),%rbx
   16e3f:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
   16e44:	48 8d 54 24 54       	lea    0x54(%rsp),%rdx
   16e49:	48 89 df             	mov    %rbx,%rdi
   16e4c:	ff 15 1e 6f 04 00    	call   *0x46f1e(%rip)        # 5dd70 <_DYNAMIC+0x330>
   16e52:	4c 8d 74 24 60       	lea    0x60(%rsp),%r14
   16e57:	48 8d 54 24 3c       	lea    0x3c(%rsp),%rdx
   16e5c:	4c 89 f7             	mov    %r14,%rdi
   16e5f:	48 89 de             	mov    %rbx,%rsi
   16e62:	ff 15 10 6f 04 00    	call   *0x46f10(%rip)        # 5dd78 <_DYNAMIC+0x338>
   16e68:	4c 89 f7             	mov    %r14,%rdi
   16e6b:	ff 15 0f 6f 04 00    	call   *0x46f0f(%rip)        # 5dd80 <_DYNAMIC+0x340>
   16e71:	8b 4c 24 60          	mov    0x60(%rsp),%ecx
   16e75:	83 f9 01             	cmp    $0x1,%ecx
   16e78:	75 1c                	jne    16e96 <hyperinterval_strict_surface32+0x1b6>
   16e7a:	8b 74 24 64          	mov    0x64(%rsp),%esi
   16e7e:	8b 7c 24 68          	mov    0x68(%rsp),%edi
   16e82:	39 fe                	cmp    %edi,%esi
   16e84:	0f 94 c2             	sete   %dl
   16e87:	66 0f 6e ce          	movd   %esi,%xmm1
   16e8b:	66 0f 6e c7          	movd   %edi,%xmm0
   16e8f:	be 01 00 00 00       	mov    $0x1,%esi
   16e94:	eb 04                	jmp    16e9a <hyperinterval_strict_surface32+0x1ba>
   16e96:	31 d2                	xor    %edx,%edx
   16e98:	31 f6                	xor    %esi,%esi
   16e9a:	80 f1 01             	xor    $0x1,%cl
   16e9d:	89 74 24 08          	mov    %esi,0x8(%rsp)
   16ea1:	66 0f 7e 4c 24 0c    	movd   %xmm1,0xc(%rsp)
   16ea7:	88 4c 24 10          	mov    %cl,0x10(%rsp)
   16eab:	88 54 24 11          	mov    %dl,0x11(%rsp)
   16eaf:	88 44 24 12          	mov    %al,0x12(%rsp)
   16eb3:	89 74 24 14          	mov    %esi,0x14(%rsp)
   16eb7:	66 0f 7e 44 24 18    	movd   %xmm0,0x18(%rsp)
   16ebd:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   16ec2:	4c 8d 6c 24 60       	lea    0x60(%rsp),%r13
   16ec7:	4c 8d 74 24 54       	lea    0x54(%rsp),%r14
   16ecc:	4c 89 ef             	mov    %r13,%rdi
   16ecf:	4c 89 f6             	mov    %r14,%rsi
   16ed2:	ff 15 b0 6e 04 00    	call   *0x46eb0(%rip)        # 5dd88 <_DYNAMIC+0x348>
   16ed8:	88 44 24 1c          	mov    %al,0x1c(%rsp)
   16edc:	4c 89 ef             	mov    %r13,%rdi
   16edf:	4c 89 f6             	mov    %r14,%rsi
   16ee2:	ff 15 a8 6e 04 00    	call   *0x46ea8(%rip)        # 5dd90 <_DYNAMIC+0x350>
   16ee8:	41 89 c6             	mov    %eax,%r14d
   16eeb:	4c 8d 64 24 3c       	lea    0x3c(%rsp),%r12
   16ef0:	4c 89 ef             	mov    %r13,%rdi
   16ef3:	4c 89 e6             	mov    %r12,%rsi
   16ef6:	ff 15 9c 6e 04 00    	call   *0x46e9c(%rip)        # 5dd98 <_DYNAMIC+0x358>
   16efc:	89 c3                	mov    %eax,%ebx
   16efe:	4c 89 ef             	mov    %r13,%rdi
   16f01:	4c 89 e6             	mov    %r12,%rsi
   16f04:	ff 15 96 6e 04 00    	call   *0x46e96(%rip)        # 5dda0 <_DYNAMIC+0x360>
   16f0a:	41 89 c4             	mov    %eax,%r12d
   16f0d:	4c 89 ef             	mov    %r13,%rdi
   16f10:	66 0f 6e 44 24 38    	movd   0x38(%rsp),%xmm0
   16f16:	ff 15 6c 6d 04 00    	call   *0x46d6c(%rip)        # 5dc88 <_DYNAMIC+0x248>
   16f1c:	a8 01                	test   $0x1,%al
   16f1e:	74 08                	je     16f28 <hyperinterval_strict_surface32+0x248>
   16f20:	88 55 04             	mov    %dl,0x4(%rbp)
   16f23:	e9 3d fe ff ff       	jmp    16d65 <hyperinterval_strict_surface32+0x85>
   16f28:	80 e2 01             	and    $0x1,%dl
   16f2b:	0f b6 44 24 1c       	movzbl 0x1c(%rsp),%eax
   16f30:	88 44 24 08          	mov    %al,0x8(%rsp)
   16f34:	44 88 74 24 09       	mov    %r14b,0x9(%rsp)
   16f39:	88 5c 24 0a          	mov    %bl,0xa(%rsp)
   16f3d:	44 88 64 24 0b       	mov    %r12b,0xb(%rsp)
   16f42:	88 54 24 0c          	mov    %dl,0xc(%rsp)
   16f46:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   16f4b:	41 83 ff 01          	cmp    $0x1,%r15d
   16f4f:	75 2a                	jne    16f7b <hyperinterval_strict_surface32+0x29b>
   16f51:	f3 0f 7e 44 24 40    	movq   0x40(%rsp),%xmm0
   16f57:	66 0f ef c9          	pxor   %xmm1,%xmm1
   16f5b:	66 0f 6f 15 1d e9 fe 	movdqa -0x116e3(%rip),%xmm2        # 5880 <__abi_tag+0x5584>
   16f62:	ff 
   16f63:	66 0f ef d0          	pxor   %xmm0,%xmm2
   16f67:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   16f6b:	66 0f df ca          	pandn  %xmm2,%xmm1
   16f6f:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   16f74:	b8 01 00 00 00       	mov    $0x1,%eax
   16f79:	eb 02                	jmp    16f7d <hyperinterval_strict_surface32+0x29d>
   16f7b:	31 c0                	xor    %eax,%eax
   16f7d:	89 44 24 48          	mov    %eax,0x48(%rsp)
   16f81:	66 0f d6 44 24 4c    	movq   %xmm0,0x4c(%rsp)
   16f87:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   16f8c:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
   16f91:	48 8d 54 24 48       	lea    0x48(%rsp),%rdx
   16f96:	ff 15 0c 6e 04 00    	call   *0x46e0c(%rip)        # 5dda8 <_DYNAMIC+0x368>
   16f9c:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   16fa0:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   16fa5:	83 f9 02             	cmp    $0x2,%ecx
   16fa8:	0f 84 6d fd ff ff    	je     16d1b <hyperinterval_strict_surface32+0x3b>
   16fae:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   16fb2:	8b 74 24 10          	mov    0x10(%rsp),%esi
   16fb6:	89 74 24 28          	mov    %esi,0x28(%rsp)
   16fba:	89 54 24 25          	mov    %edx,0x25(%rsp)
   16fbe:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   16fc2:	88 44 24 24          	mov    %al,0x24(%rsp)
   16fc6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   16fcb:	66 0f 6e 05 11 e8 fe 	movd   -0x117ef(%rip),%xmm0        # 57e4 <__abi_tag+0x54e8>
   16fd2:	ff 
   16fd3:	ff 15 2f 6d 04 00    	call   *0x46d2f(%rip)        # 5dd08 <_DYNAMIC+0x2c8>
   16fd9:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   16fdd:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   16fe2:	83 f9 02             	cmp    $0x2,%ecx
   16fe5:	0f 84 30 fd ff ff    	je     16d1b <hyperinterval_strict_surface32+0x3b>
   16feb:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   16fef:	8b 74 24 10          	mov    0x10(%rsp),%esi
   16ff3:	89 74 24 34          	mov    %esi,0x34(%rsp)
   16ff7:	89 54 24 31          	mov    %edx,0x31(%rsp)
   16ffb:	89 4c 24 2c          	mov    %ecx,0x2c(%rsp)
   16fff:	88 44 24 30          	mov    %al,0x30(%rsp)
   17003:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
   17008:	48 8d 54 24 2c       	lea    0x2c(%rsp),%rdx
   1700d:	48 89 ef             	mov    %rbp,%rdi
   17010:	ff 15 9a 6d 04 00    	call   *0x46d9a(%rip)        # 5ddb0 <_DYNAMIC+0x370>
   17016:	e9 51 fd ff ff       	jmp    16d6c <hyperinterval_strict_surface32+0x8c>
   1701b:	cc                   	int3
   1701c:	cc                   	int3
   1701d:	cc                   	int3
   1701e:	cc                   	int3
   1701f:	cc                   	int3

hyperinterval_strict_surface64:
   17020:	55                   	push   %rbp
   17021:	41 57                	push   %r15
   17023:	41 56                	push   %r14
   17025:	41 55                	push   %r13
   17027:	41 54                	push   %r12
   17029:	53                   	push   %rbx
   1702a:	48 81 ec 08 01 00 00 	sub    $0x108,%rsp
   17031:	89 f5                	mov    %esi,%ebp
   17033:	48 89 fb             	mov    %rdi,%rbx
   17036:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1703b:	f2 0f 11 84 24 90 00 	movsd  %xmm0,0x90(%rsp)
   17042:	00 00 
   17044:	66 0f d6 4c 24 58    	movq   %xmm1,0x58(%rsp)
   1704a:	ff 15 d0 6c 04 00    	call   *0x46cd0(%rip)        # 5dd20 <_DYNAMIC+0x2e0>
   17050:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   17055:	44 0f b6 64 24 18    	movzbl 0x18(%rsp),%r12d
   1705b:	49 83 fe 02          	cmp    $0x2,%r14
   1705f:	75 09                	jne    1706a <hyperinterval_strict_surface64+0x4a>
   17061:	44 88 63 08          	mov    %r12b,0x8(%rbx)
   17065:	e9 8a 00 00 00       	jmp    170f4 <hyperinterval_strict_surface64+0xd4>
   1706a:	44 0f b6 7c 24 1f    	movzbl 0x1f(%rsp),%r15d
   17070:	44 0f b7 6c 24 1d    	movzwl 0x1d(%rsp),%r13d
   17076:	8b 44 24 19          	mov    0x19(%rsp),%eax
   1707a:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1707f:	4c 89 74 24 60       	mov    %r14,0x60(%rsp)
   17084:	44 88 64 24 68       	mov    %r12b,0x68(%rsp)
   17089:	44 88 7c 24 6f       	mov    %r15b,0x6f(%rsp)
   1708e:	66 44 89 6c 24 6d    	mov    %r13w,0x6d(%rsp)
   17094:	48 89 84 24 d0 00 00 	mov    %rax,0xd0(%rsp)
   1709b:	00 
   1709c:	89 44 24 69          	mov    %eax,0x69(%rsp)
   170a0:	48 89 8c 24 c8 00 00 	mov    %rcx,0xc8(%rsp)
   170a7:	00 
   170a8:	48 89 4c 24 70       	mov    %rcx,0x70(%rsp)
   170ad:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   170b2:	f2 0f 10 84 24 90 00 	movsd  0x90(%rsp),%xmm0
   170b9:	00 00 
   170bb:	ff 15 f7 6c 04 00    	call   *0x46cf7(%rip)        # 5ddb8 <_DYNAMIC+0x378>
   170c1:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   170c6:	74 24                	je     170ec <hyperinterval_strict_surface64+0xcc>
   170c8:	f2 0f 10 44 24 40    	movsd  0x40(%rsp),%xmm0
   170ce:	f2 0f 11 44 24 50    	movsd  %xmm0,0x50(%rsp)
   170d4:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   170d9:	f2 0f 10 44 24 58    	movsd  0x58(%rsp),%xmm0
   170df:	ff 15 db 6c 04 00    	call   *0x46cdb(%rip)        # 5ddc0 <_DYNAMIC+0x380>
   170e5:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   170ea:	75 24                	jne    17110 <hyperinterval_strict_surface64+0xf0>
   170ec:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
   170f1:	88 43 08             	mov    %al,0x8(%rbx)
   170f4:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   170fb:	48 89 d8             	mov    %rbx,%rax
   170fe:	48 81 c4 08 01 00 00 	add    $0x108,%rsp
   17105:	5b                   	pop    %rbx
   17106:	41 5c                	pop    %r12
   17108:	41 5d                	pop    %r13
   1710a:	41 5e                	pop    %r14
   1710c:	41 5f                	pop    %r15
   1710e:	5d                   	pop    %rbp
   1710f:	c3                   	ret
   17110:	f3 0f 7e 4c 24 40    	movq   0x40(%rsp),%xmm1
   17116:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1711b:	f2 0f 10 44 24 50    	movsd  0x50(%rsp),%xmm0
   17121:	ff 15 f9 6b 04 00    	call   *0x46bf9(%rip)        # 5dd20 <_DYNAMIC+0x2e0>
   17127:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1712c:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17131:	48 83 f9 02          	cmp    $0x2,%rcx
   17135:	74 ba                	je     170f1 <hyperinterval_strict_surface64+0xd1>
   17137:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   1713c:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   17141:	48 89 b4 24 c0 00 00 	mov    %rsi,0xc0(%rsp)
   17148:	00 
   17149:	48 89 94 24 b9 00 00 	mov    %rdx,0xb9(%rsp)
   17150:	00 
   17151:	48 89 8c 24 b0 00 00 	mov    %rcx,0xb0(%rsp)
   17158:	00 
   17159:	88 84 24 b8 00 00 00 	mov    %al,0xb8(%rsp)
   17160:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17165:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
   1716a:	89 ea                	mov    %ebp,%edx
   1716c:	ff 15 56 6c 04 00    	call   *0x46c56(%rip)        # 5ddc8 <_DYNAMIC+0x388>
   17172:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17177:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   1717c:	48 83 f9 02          	cmp    $0x2,%rcx
   17180:	0f 84 6b ff ff ff    	je     170f1 <hyperinterval_strict_surface64+0xd1>
   17186:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   1718b:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   17190:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
   17195:	48 89 54 24 41       	mov    %rdx,0x41(%rsp)
   1719a:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
   1719f:	88 44 24 40          	mov    %al,0x40(%rsp)
   171a3:	48 8d bc 24 98 00 00 	lea    0x98(%rsp),%rdi
   171aa:	00 
   171ab:	48 8d 74 24 38       	lea    0x38(%rsp),%rsi
   171b0:	ff 15 1a 6c 04 00    	call   *0x46c1a(%rip)        # 5ddd0 <_DYNAMIC+0x390>
   171b6:	48 8b 8c 24 98 00 00 	mov    0x98(%rsp),%rcx
   171bd:	00 
   171be:	0f b6 84 24 a0 00 00 	movzbl 0xa0(%rsp),%eax
   171c5:	00 
   171c6:	48 83 f9 02          	cmp    $0x2,%rcx
   171ca:	0f 84 21 ff ff ff    	je     170f1 <hyperinterval_strict_surface64+0xd1>
   171d0:	48 8b 94 24 a1 00 00 	mov    0xa1(%rsp),%rdx
   171d7:	00 
   171d8:	48 8b b4 24 a8 00 00 	mov    0xa8(%rsp),%rsi
   171df:	00 
   171e0:	48 89 b4 24 88 00 00 	mov    %rsi,0x88(%rsp)
   171e7:	00 
   171e8:	48 89 94 24 81 00 00 	mov    %rdx,0x81(%rsp)
   171ef:	00 
   171f0:	48 89 4c 24 78       	mov    %rcx,0x78(%rsp)
   171f5:	88 84 24 80 00 00 00 	mov    %al,0x80(%rsp)
   171fc:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
   17203:	00 
   17204:	48 8d 74 24 78       	lea    0x78(%rsp),%rsi
   17209:	48 8d 94 24 b0 00 00 	lea    0xb0(%rsp),%rdx
   17210:	00 
   17211:	ff 15 c1 6b 04 00    	call   *0x46bc1(%rip)        # 5ddd8 <_DYNAMIC+0x398>
   17217:	48 8d ac 24 d8 00 00 	lea    0xd8(%rsp),%rbp
   1721e:	00 
   1721f:	48 8d 54 24 60       	lea    0x60(%rsp),%rdx
   17224:	48 89 ef             	mov    %rbp,%rdi
   17227:	48 8d b4 24 f0 00 00 	lea    0xf0(%rsp),%rsi
   1722e:	00 
   1722f:	ff 15 ab 6b 04 00    	call   *0x46bab(%rip)        # 5dde0 <_DYNAMIC+0x3a0>
   17235:	48 89 ef             	mov    %rbp,%rdi
   17238:	ff 15 aa 6b 04 00    	call   *0x46baa(%rip)        # 5dde8 <_DYNAMIC+0x3a8>
   1723e:	48 8b 8c 24 d8 00 00 	mov    0xd8(%rsp),%rcx
   17245:	00 
   17246:	48 83 f9 01          	cmp    $0x1,%rcx
   1724a:	75 27                	jne    17273 <hyperinterval_strict_surface64+0x253>
   1724c:	48 8b b4 24 e0 00 00 	mov    0xe0(%rsp),%rsi
   17253:	00 
   17254:	48 8b bc 24 e8 00 00 	mov    0xe8(%rsp),%rdi
   1725b:	00 
   1725c:	48 39 fe             	cmp    %rdi,%rsi
   1725f:	0f 94 c2             	sete   %dl
   17262:	66 48 0f 6e ce       	movq   %rsi,%xmm1
   17267:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   1726c:	be 01 00 00 00       	mov    $0x1,%esi
   17271:	eb 04                	jmp    17277 <hyperinterval_strict_surface64+0x257>
   17273:	31 d2                	xor    %edx,%edx
   17275:	31 f6                	xor    %esi,%esi
   17277:	80 f1 01             	xor    $0x1,%cl
   1727a:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
   1727f:	66 0f d6 4c 24 18    	movq   %xmm1,0x18(%rsp)
   17285:	88 4c 24 20          	mov    %cl,0x20(%rsp)
   17289:	88 54 24 21          	mov    %dl,0x21(%rsp)
   1728d:	88 44 24 22          	mov    %al,0x22(%rsp)
   17291:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
   17296:	66 0f d6 44 24 30    	movq   %xmm0,0x30(%rsp)
   1729c:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
   172a1:	48 8d ac 24 d8 00 00 	lea    0xd8(%rsp),%rbp
   172a8:	00 
   172a9:	48 8d b4 24 b0 00 00 	lea    0xb0(%rsp),%rsi
   172b0:	00 
   172b1:	48 89 ef             	mov    %rbp,%rdi
   172b4:	ff 15 36 6b 04 00    	call   *0x46b36(%rip)        # 5ddf0 <_DYNAMIC+0x3b0>
   172ba:	88 44 24 58          	mov    %al,0x58(%rsp)
   172be:	48 89 ef             	mov    %rbp,%rdi
   172c1:	48 8d b4 24 b0 00 00 	lea    0xb0(%rsp),%rsi
   172c8:	00 
   172c9:	ff 15 29 6b 04 00    	call   *0x46b29(%rip)        # 5ddf8 <_DYNAMIC+0x3b8>
   172cf:	88 44 24 50          	mov    %al,0x50(%rsp)
   172d3:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
   172d8:	48 89 ef             	mov    %rbp,%rdi
   172db:	ff 15 1f 6b 04 00    	call   *0x46b1f(%rip)        # 5de00 <_DYNAMIC+0x3c0>
   172e1:	88 44 24 0f          	mov    %al,0xf(%rsp)
   172e5:	48 89 ef             	mov    %rbp,%rdi
   172e8:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
   172ed:	ff 15 15 6b 04 00    	call   *0x46b15(%rip)        # 5de08 <_DYNAMIC+0x3c8>
   172f3:	88 44 24 0e          	mov    %al,0xe(%rsp)
   172f7:	48 89 ef             	mov    %rbp,%rdi
   172fa:	f2 0f 10 84 24 90 00 	movsd  0x90(%rsp),%xmm0
   17301:	00 00 
   17303:	ff 15 77 69 04 00    	call   *0x46977(%rip)        # 5dc80 <_DYNAMIC+0x240>
   17309:	a8 01                	test   $0x1,%al
   1730b:	74 08                	je     17315 <hyperinterval_strict_surface64+0x2f5>
   1730d:	88 53 08             	mov    %dl,0x8(%rbx)
   17310:	e9 df fd ff ff       	jmp    170f4 <hyperinterval_strict_surface64+0xd4>
   17315:	80 e2 01             	and    $0x1,%dl
   17318:	0f b6 44 24 58       	movzbl 0x58(%rsp),%eax
   1731d:	88 44 24 10          	mov    %al,0x10(%rsp)
   17321:	0f b6 44 24 50       	movzbl 0x50(%rsp),%eax
   17326:	88 44 24 11          	mov    %al,0x11(%rsp)
   1732a:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
   1732f:	88 44 24 12          	mov    %al,0x12(%rsp)
   17333:	0f b6 44 24 0e       	movzbl 0xe(%rsp),%eax
   17338:	88 44 24 13          	mov    %al,0x13(%rsp)
   1733c:	88 54 24 14          	mov    %dl,0x14(%rsp)
   17340:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
   17345:	41 83 fe 01          	cmp    $0x1,%r14d
   17349:	75 51                	jne    1739c <hyperinterval_strict_surface64+0x37c>
   1734b:	41 c1 e7 10          	shl    $0x10,%r15d
   1734f:	45 09 fd             	or     %r15d,%r13d
   17352:	41 0f b6 c4          	movzbl %r12b,%eax
   17356:	49 c1 e5 20          	shl    $0x20,%r13
   1735a:	48 8b 94 24 d0 00 00 	mov    0xd0(%rsp),%rdx
   17361:	00 
   17362:	4c 09 ea             	or     %r13,%rdx
   17365:	48 c1 e2 08          	shl    $0x8,%rdx
   17369:	48 09 c2             	or     %rax,%rdx
   1736c:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   17373:	00 00 80 
   17376:	48 8b b4 24 c8 00 00 	mov    0xc8(%rsp),%rsi
   1737d:	00 
   1737e:	48 89 f1             	mov    %rsi,%rcx
   17381:	48 31 c1             	xor    %rax,%rcx
   17384:	48 85 f6             	test   %rsi,%rsi
   17387:	48 0f 44 ce          	cmove  %rsi,%rcx
   1738b:	48 31 d0             	xor    %rdx,%rax
   1738e:	48 85 d2             	test   %rdx,%rdx
   17391:	48 0f 44 c2          	cmove  %rdx,%rax
   17395:	ba 01 00 00 00       	mov    $0x1,%edx
   1739a:	eb 02                	jmp    1739e <hyperinterval_strict_surface64+0x37e>
   1739c:	31 d2                	xor    %edx,%edx
   1739e:	48 89 94 24 98 00 00 	mov    %rdx,0x98(%rsp)
   173a5:	00 
   173a6:	48 89 8c 24 a0 00 00 	mov    %rcx,0xa0(%rsp)
   173ad:	00 
   173ae:	48 89 84 24 a8 00 00 	mov    %rax,0xa8(%rsp)
   173b5:	00 
   173b6:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   173bb:	48 8d b4 24 d8 00 00 	lea    0xd8(%rsp),%rsi
   173c2:	00 
   173c3:	48 8d 94 24 98 00 00 	lea    0x98(%rsp),%rdx
   173ca:	00 
   173cb:	ff 15 3f 6a 04 00    	call   *0x46a3f(%rip)        # 5de10 <_DYNAMIC+0x3d0>
   173d1:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   173d6:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   173db:	48 83 f9 02          	cmp    $0x2,%rcx
   173df:	0f 84 0c fd ff ff    	je     170f1 <hyperinterval_strict_surface64+0xd1>
   173e5:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   173ea:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   173ef:	48 89 b4 24 88 00 00 	mov    %rsi,0x88(%rsp)
   173f6:	00 
   173f7:	48 89 94 24 81 00 00 	mov    %rdx,0x81(%rsp)
   173fe:	00 
   173ff:	48 89 4c 24 78       	mov    %rcx,0x78(%rsp)
   17404:	88 84 24 80 00 00 00 	mov    %al,0x80(%rsp)
   1740b:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17410:	f2 0f 10 05 38 e3 fe 	movsd  -0x11cc8(%rip),%xmm0        # 5750 <__abi_tag+0x5454>
   17417:	ff 
   17418:	ff 15 1a 69 04 00    	call   *0x4691a(%rip)        # 5dd38 <_DYNAMIC+0x2f8>
   1741e:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17423:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17428:	48 83 f9 02          	cmp    $0x2,%rcx
   1742c:	0f 84 bf fc ff ff    	je     170f1 <hyperinterval_strict_surface64+0xd1>
   17432:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   17437:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1743c:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
   17441:	48 89 54 24 41       	mov    %rdx,0x41(%rsp)
   17446:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
   1744b:	88 44 24 40          	mov    %al,0x40(%rsp)
   1744f:	48 8d 74 24 78       	lea    0x78(%rsp),%rsi
   17454:	48 8d 54 24 38       	lea    0x38(%rsp),%rdx
   17459:	48 89 df             	mov    %rbx,%rdi
   1745c:	ff 15 b6 69 04 00    	call   *0x469b6(%rip)        # 5de18 <_DYNAMIC+0x3d8>
   17462:	e9 94 fc ff ff       	jmp    170fb <hyperinterval_strict_surface64+0xdb>
   17467:	cc                   	int3
   17468:	cc                   	int3
   17469:	cc                   	int3
   1746a:	cc                   	int3
   1746b:	cc                   	int3
   1746c:	cc                   	int3
   1746d:	cc                   	int3
   1746e:	cc                   	int3
   1746f:	cc                   	int3

hyperinterval::float::F32Enclosure::reciprocal:
   174f0:	41 57                	push   %r15
   174f2:	41 56                	push   %r14
   174f4:	41 54                	push   %r12
   174f6:	53                   	push   %rbx
   174f7:	48 83 ec 28          	sub    $0x28,%rsp
   174fb:	48 89 fb             	mov    %rdi,%rbx
   174fe:	83 3e 00             	cmpl   $0x0,(%rsi)
   17501:	74 5e                	je     17561 <hyperinterval::float::F32Enclosure::reciprocal+0x71>
   17503:	49 89 f6             	mov    %rsi,%r14
   17506:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   1750c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17511:	be 00 00 00 80       	mov    $0x80000000,%esi
   17516:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1751b:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   17520:	e8 fb 45 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   17525:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1752a:	74 25                	je     17551 <hyperinterval::float::F32Enclosure::reciprocal+0x61>
   1752c:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   17531:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17536:	be 00 00 00 80       	mov    $0x80000000,%esi
   1753b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17540:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   17545:	e8 d6 45 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1754a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1754f:	75 25                	jne    17576 <hyperinterval::float::F32Enclosure::reciprocal+0x86>
   17551:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   17556:	88 4b 04             	mov    %cl,0x4(%rbx)
   17559:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1755f:	eb 06                	jmp    17567 <hyperinterval::float::F32Enclosure::reciprocal+0x77>
   17561:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   17567:	48 89 d8             	mov    %rbx,%rax
   1756a:	48 83 c4 28          	add    $0x28,%rsp
   1756e:	5b                   	pop    %rbx
   1756f:	41 5c                	pop    %r12
   17571:	41 5e                	pop    %r14
   17573:	41 5f                	pop    %r15
   17575:	c3                   	ret
   17576:	8b 44 24 10          	mov    0x10(%rsp),%eax
   1757a:	44 89 e1             	mov    %r12d,%ecx
   1757d:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   17583:	89 c2                	mov    %eax,%edx
   17585:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1758b:	be 00 00 00 80       	mov    $0x80000000,%esi
   17590:	29 ce                	sub    %ecx,%esi
   17592:	44 09 f9             	or     %r15d,%ecx
   17595:	45 85 e4             	test   %r12d,%r12d
   17598:	48 0f 49 f1          	cmovns %rcx,%rsi
   1759c:	89 d1                	mov    %edx,%ecx
   1759e:	44 09 f9             	or     %r15d,%ecx
   175a1:	41 29 d7             	sub    %edx,%r15d
   175a4:	85 c0                	test   %eax,%eax
   175a6:	4c 0f 49 f9          	cmovns %rcx,%r15
   175aa:	b1 01                	mov    $0x1,%cl
   175ac:	44 39 fe             	cmp    %r15d,%esi
   175af:	77 a5                	ja     17556 <hyperinterval::float::F32Enclosure::reciprocal+0x66>
   175b1:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%rsp)
   175b8:	00 
   175b9:	44 89 64 24 20       	mov    %r12d,0x20(%rsp)
   175be:	89 44 24 24          	mov    %eax,0x24(%rsp)
   175c2:	41 83 7e 04 00       	cmpl   $0x0,0x4(%r14)
   175c7:	7f 15                	jg     175de <hyperinterval::float::F32Enclosure::reciprocal+0xee>
   175c9:	41 8b 46 08          	mov    0x8(%r14),%eax
   175cd:	85 c0                	test   %eax,%eax
   175cf:	0f 99 c1             	setns  %cl
   175d2:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   175d7:	0f 94 c0             	sete   %al
   175da:	08 c8                	or     %cl,%al
   175dc:	75 1a                	jne    175f8 <hyperinterval::float::F32Enclosure::reciprocal+0x108>
   175de:	48 8d 74 24 1c       	lea    0x1c(%rsp),%rsi
   175e3:	48 89 df             	mov    %rbx,%rdi
   175e6:	4c 89 f2             	mov    %r14,%rdx
   175e9:	b9 01 00 00 00       	mov    $0x1,%ecx
   175ee:	e8 8d 02 00 00       	call   17880 <hyperinterval::float::F32Enclosure::corner_image>
   175f3:	e9 6f ff ff ff       	jmp    17567 <hyperinterval::float::F32Enclosure::reciprocal+0x77>
   175f8:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
   175fc:	e9 58 ff ff ff       	jmp    17559 <hyperinterval::float::F32Enclosure::reciprocal+0x69>
   17601:	cc                   	int3
   17602:	cc                   	int3
   17603:	cc                   	int3
   17604:	cc                   	int3
   17605:	cc                   	int3
   17606:	cc                   	int3
   17607:	cc                   	int3
   17608:	cc                   	int3
   17609:	cc                   	int3
   1760a:	cc                   	int3
   1760b:	cc                   	int3
   1760c:	cc                   	int3
   1760d:	cc                   	int3
   1760e:	cc                   	int3
   1760f:	cc                   	int3

hyperinterval::float::F32Enclosure::checked_pow:
   17610:	55                   	push   %rbp
   17611:	41 57                	push   %r15
   17613:	41 56                	push   %r14
   17615:	41 55                	push   %r13
   17617:	41 54                	push   %r12
   17619:	53                   	push   %rbx
   1761a:	48 83 ec 38          	sub    $0x38,%rsp
   1761e:	48 89 fb             	mov    %rdi,%rbx
   17621:	83 fa 02             	cmp    $0x2,%edx
   17624:	75 0e                	jne    17634 <hyperinterval::float::F32Enclosure::checked_pow+0x24>
   17626:	48 89 df             	mov    %rbx,%rdi
   17629:	ff 15 d1 66 04 00    	call   *0x466d1(%rip)        # 5dd00 <_DYNAMIC+0x2c0>
   1762f:	e9 c8 00 00 00       	jmp    176fc <hyperinterval::float::F32Enclosure::checked_pow+0xec>
   17634:	f6 06 01             	testb  $0x1,(%rsi)
   17637:	0f 84 b9 00 00 00    	je     176f6 <hyperinterval::float::F32Enclosure::checked_pow+0xe6>
   1763d:	89 d5                	mov    %edx,%ebp
   1763f:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
   17643:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   17647:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1764c:	be 00 00 00 80       	mov    $0x80000000,%esi
   17651:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17656:	4c 89 f9             	mov    %r15,%rcx
   17659:	41 89 e8             	mov    %ebp,%r8d
   1765c:	e8 cf 3c 00 00       	call   1b330 <hyperinterval::ieee::Format::power>
   17661:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   17666:	75 7e                	jne    176e6 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   17668:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   1766d:	44 8b 6c 24 18       	mov    0x18(%rsp),%r13d
   17672:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17677:	be 00 00 00 80       	mov    $0x80000000,%esi
   1767c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17681:	4c 89 f1             	mov    %r14,%rcx
   17684:	41 89 e8             	mov    %ebp,%r8d
   17687:	e8 a4 3c 00 00       	call   1b330 <hyperinterval::ieee::Format::power>
   1768c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   17691:	74 53                	je     176e6 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   17693:	8b 44 24 10          	mov    0x10(%rsp),%eax
   17697:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1769c:	8b 44 24 18          	mov    0x18(%rsp),%eax
   176a0:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   176a5:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   176aa:	be 00 00 00 80       	mov    $0x80000000,%esi
   176af:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   176b4:	4c 89 e1             	mov    %r12,%rcx
   176b7:	e8 64 44 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   176bc:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   176c1:	74 23                	je     176e6 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   176c3:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   176c8:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   176cd:	be 00 00 00 80       	mov    $0x80000000,%esi
   176d2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   176d7:	4c 89 e9             	mov    %r13,%rcx
   176da:	e8 41 44 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   176df:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   176e4:	75 28                	jne    1770e <hyperinterval::float::F32Enclosure::checked_pow+0xfe>
   176e6:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   176eb:	88 43 04             	mov    %al,0x4(%rbx)
   176ee:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   176f4:	eb 06                	jmp    176fc <hyperinterval::float::F32Enclosure::checked_pow+0xec>
   176f6:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   176fc:	48 89 d8             	mov    %rbx,%rax
   176ff:	48 83 c4 38          	add    $0x38,%rsp
   17703:	5b                   	pop    %rbx
   17704:	41 5c                	pop    %r12
   17706:	41 5d                	pop    %r13
   17708:	41 5e                	pop    %r14
   1770a:	41 5f                	pop    %r15
   1770c:	5d                   	pop    %rbp
   1770d:	c3                   	ret
   1770e:	8b 7c 24 10          	mov    0x10(%rsp),%edi
   17712:	44 89 e0             	mov    %r12d,%eax
   17715:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   1771a:	89 f9                	mov    %edi,%ecx
   1771c:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   17722:	ba 00 00 00 80       	mov    $0x80000000,%edx
   17727:	29 c2                	sub    %eax,%edx
   17729:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   1772f:	44 09 e8             	or     %r13d,%eax
   17732:	45 85 e4             	test   %r12d,%r12d
   17735:	48 0f 49 d0          	cmovns %rax,%rdx
   17739:	be 00 00 00 80       	mov    $0x80000000,%esi
   1773e:	29 ce                	sub    %ecx,%esi
   17740:	89 c8                	mov    %ecx,%eax
   17742:	44 09 e8             	or     %r13d,%eax
   17745:	85 ff                	test   %edi,%edi
   17747:	48 0f 49 f0          	cmovns %rax,%rsi
   1774b:	b0 01                	mov    $0x1,%al
   1774d:	39 f2                	cmp    %esi,%edx
   1774f:	77 9a                	ja     176eb <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
   17751:	89 7c 24 2c          	mov    %edi,0x2c(%rsp)
   17755:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1775a:	be 00 00 00 80       	mov    $0x80000000,%esi
   1775f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17764:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   17769:	e8 b2 43 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1776e:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   17773:	0f 84 6d ff ff ff    	je     176e6 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   17779:	4c 89 64 24 20       	mov    %r12,0x20(%rsp)
   1777e:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   17783:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17788:	be 00 00 00 80       	mov    $0x80000000,%esi
   1778d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17792:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
   17797:	e8 84 43 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1779c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   177a1:	0f 84 3f ff ff ff    	je     176e6 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   177a7:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   177ab:	44 89 e0             	mov    %r12d,%eax
   177ae:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   177b3:	89 ca                	mov    %ecx,%edx
   177b5:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   177bb:	be 00 00 00 80       	mov    $0x80000000,%esi
   177c0:	29 c6                	sub    %eax,%esi
   177c2:	44 09 e8             	or     %r13d,%eax
   177c5:	45 85 e4             	test   %r12d,%r12d
   177c8:	48 0f 49 f0          	cmovns %rax,%rsi
   177cc:	89 d0                	mov    %edx,%eax
   177ce:	44 09 e8             	or     %r13d,%eax
   177d1:	41 29 d5             	sub    %edx,%r13d
   177d4:	85 c9                	test   %ecx,%ecx
   177d6:	4c 0f 49 e8          	cmovns %rax,%r13
   177da:	b0 01                	mov    $0x1,%al
   177dc:	44 39 ee             	cmp    %r13d,%esi
   177df:	0f 87 06 ff ff ff    	ja     176eb <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
   177e5:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
   177ea:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
   177ee:	44 89 e2             	mov    %r12d,%edx
   177f1:	e8 7a 46 00 00       	call   1be70 <hyperinterval::bounds::Bounds<T>::hull>
   177f6:	41 89 c5             	mov    %eax,%r13d
   177f9:	41 89 d4             	mov    %edx,%r12d
   177fc:	85 ed                	test   %ebp,%ebp
   177fe:	0f 95 c0             	setne  %al
   17801:	40 f6 c5 01          	test   $0x1,%bpl
   17805:	0f 94 c1             	sete   %cl
   17808:	84 c8                	test   %cl,%al
   1780a:	74 11                	je     1781d <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
   1780c:	44 89 ff             	mov    %r15d,%edi
   1780f:	44 89 f6             	mov    %r14d,%esi
   17812:	31 d2                	xor    %edx,%edx
   17814:	e8 07 48 00 00       	call   1c020 <hyperinterval::bounds::Bounds<T>::signs>
   17819:	a8 02                	test   $0x2,%al
   1781b:	75 13                	jne    17830 <hyperinterval::float::F32Enclosure::checked_pow+0x220>
   1781d:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   17823:	44 89 6b 04          	mov    %r13d,0x4(%rbx)
   17827:	44 89 63 08          	mov    %r12d,0x8(%rbx)
   1782b:	e9 cc fe ff ff       	jmp    176fc <hyperinterval::float::F32Enclosure::checked_pow+0xec>
   17830:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17835:	31 f6                	xor    %esi,%esi
   17837:	31 d2                	xor    %edx,%edx
   17839:	e8 42 15 00 00       	call   18d80 <hyperinterval::float::F32Enclosure::from_bits>
   1783e:	8b 44 24 08          	mov    0x8(%rsp),%eax
   17842:	83 f8 02             	cmp    $0x2,%eax
   17845:	75 0a                	jne    17851 <hyperinterval::float::F32Enclosure::checked_pow+0x241>
   17847:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   1784c:	e9 9a fe ff ff       	jmp    176eb <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
   17851:	83 f8 01             	cmp    $0x1,%eax
   17854:	75 c7                	jne    1781d <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
   17856:	8b 54 24 0c          	mov    0xc(%rsp),%edx
   1785a:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   1785e:	44 89 ef             	mov    %r13d,%edi
   17861:	44 89 e6             	mov    %r12d,%esi
   17864:	e8 07 46 00 00       	call   1be70 <hyperinterval::bounds::Bounds<T>::hull>
   17869:	41 89 c5             	mov    %eax,%r13d
   1786c:	41 89 d4             	mov    %edx,%r12d
   1786f:	eb ac                	jmp    1781d <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
   17871:	cc                   	int3
   17872:	cc                   	int3
   17873:	cc                   	int3
   17874:	cc                   	int3
   17875:	cc                   	int3
   17876:	cc                   	int3
   17877:	cc                   	int3
   17878:	cc                   	int3
   17879:	cc                   	int3
   1787a:	cc                   	int3
   1787b:	cc                   	int3
   1787c:	cc                   	int3
   1787d:	cc                   	int3
   1787e:	cc                   	int3
   1787f:	cc                   	int3

hyperinterval::float::F32Enclosure::corner_image:
   17880:	55                   	push   %rbp
   17881:	41 57                	push   %r15
   17883:	41 56                	push   %r14
   17885:	41 55                	push   %r13
   17887:	41 54                	push   %r12
   17889:	53                   	push   %rbx
   1788a:	48 83 ec 58          	sub    $0x58,%rsp
   1788e:	48 89 fb             	mov    %rdi,%rbx
   17891:	f6 06 01             	testb  $0x1,(%rsi)
   17894:	74 49                	je     178df <hyperinterval::float::F32Enclosure::corner_image+0x5f>
   17896:	f6 02 01             	testb  $0x1,(%rdx)
   17899:	74 44                	je     178df <hyperinterval::float::F32Enclosure::corner_image+0x5f>
   1789b:	44 8b 62 04          	mov    0x4(%rdx),%r12d
   1789f:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   178a3:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
   178a7:	8b 46 08             	mov    0x8(%rsi),%eax
   178aa:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   178af:	84 c9                	test   %cl,%cl
   178b1:	74 37                	je     178ea <hyperinterval::float::F32Enclosure::corner_image+0x6a>
   178b3:	48 89 e7             	mov    %rsp,%rdi
   178b6:	be 00 00 00 80       	mov    $0x80000000,%esi
   178bb:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   178c0:	4c 89 e9             	mov    %r13,%rcx
   178c3:	4d 89 e0             	mov    %r12,%r8
   178c6:	e8 55 35 00 00       	call   1ae20 <hyperinterval::ieee::Format::div>
   178cb:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   178cf:	0f 84 bf 00 00 00    	je     17994 <hyperinterval::float::F32Enclosure::corner_image+0x114>
   178d5:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   178da:	e9 ad 00 00 00       	jmp    1798c <hyperinterval::float::F32Enclosure::corner_image+0x10c>
   178df:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   178e5:	e9 42 03 00 00       	jmp    17c2c <hyperinterval::float::F32Enclosure::corner_image+0x3ac>
   178ea:	44 89 e8             	mov    %r13d,%eax
   178ed:	c1 e8 17             	shr    $0x17,%eax
   178f0:	0f b6 d0             	movzbl %al,%edx
   178f3:	44 89 ee             	mov    %r13d,%esi
   178f6:	81 e6 ff ff 7f 00    	and    $0x7fffff,%esi
   178fc:	31 c9                	xor    %ecx,%ecx
   178fe:	85 d2                	test   %edx,%edx
   17900:	0f 95 c1             	setne  %cl
   17903:	b8 01 00 00 00       	mov    $0x1,%eax
   17908:	0f 45 c2             	cmovne %edx,%eax
   1790b:	c1 e1 17             	shl    $0x17,%ecx
   1790e:	48 09 f1             	or     %rsi,%rcx
   17911:	44 89 e2             	mov    %r12d,%edx
   17914:	c1 ea 17             	shr    $0x17,%edx
   17917:	0f b6 d2             	movzbl %dl,%edx
   1791a:	44 89 e6             	mov    %r12d,%esi
   1791d:	81 e6 ff ff 7f 00    	and    $0x7fffff,%esi
   17923:	8d ba d4 fe ff ff    	lea    -0x12c(%rdx),%edi
   17929:	45 31 c0             	xor    %r8d,%r8d
   1792c:	85 d2                	test   %edx,%edx
   1792e:	ba d5 fe ff ff       	mov    $0xfffffed5,%edx
   17933:	0f 45 d7             	cmovne %edi,%edx
   17936:	41 0f 95 c0          	setne  %r8b
   1793a:	41 c1 e0 17          	shl    $0x17,%r8d
   1793e:	49 09 f0             	or     %rsi,%r8
   17941:	4c 0f af c1          	imul   %rcx,%r8
   17945:	44 89 e9             	mov    %r13d,%ecx
   17948:	44 31 e1             	xor    %r12d,%ecx
   1794b:	01 c2                	add    %eax,%edx
   1794d:	c1 e9 1f             	shr    $0x1f,%ecx
   17950:	88 4c 24 14          	mov    %cl,0x14(%rsp)
   17954:	4c 89 04 24          	mov    %r8,(%rsp)
   17958:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   1795f:	00 00 
   17961:	89 54 24 10          	mov    %edx,0x10(%rsp)
   17965:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1796a:	48 89 e1             	mov    %rsp,%rcx
   1796d:	be 00 00 00 80       	mov    $0x80000000,%esi
   17972:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17977:	e8 e4 41 00 00       	call   1bb60 <hyperinterval::ieee::Format::rounded>
   1797c:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   17981:	0f 84 54 02 00 00    	je     17bdb <hyperinterval::float::F32Enclosure::corner_image+0x35b>
   17987:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   1798c:	88 43 04             	mov    %al,0x4(%rbx)
   1798f:	e9 92 02 00 00       	jmp    17c26 <hyperinterval::float::F32Enclosure::corner_image+0x3a6>
   17994:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17998:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   1799d:	48 89 e7             	mov    %rsp,%rdi
   179a0:	be 00 00 00 80       	mov    $0x80000000,%esi
   179a5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   179aa:	e8 71 41 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   179af:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   179b3:	0f 85 63 02 00 00    	jne    17c1c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   179b9:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   179be:	48 89 e7             	mov    %rsp,%rdi
   179c1:	be 00 00 00 80       	mov    $0x80000000,%esi
   179c6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   179cb:	4c 89 f9             	mov    %r15,%rcx
   179ce:	e8 4d 41 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   179d3:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   179d7:	0f 85 3f 02 00 00    	jne    17c1c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   179dd:	8b 7c 24 08          	mov    0x8(%rsp),%edi
   179e1:	89 e8                	mov    %ebp,%eax
   179e3:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   179e8:	89 f9                	mov    %edi,%ecx
   179ea:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   179f0:	ba 00 00 00 80       	mov    $0x80000000,%edx
   179f5:	29 c2                	sub    %eax,%edx
   179f7:	be 00 00 00 80       	mov    $0x80000000,%esi
   179fc:	09 f0                	or     %esi,%eax
   179fe:	85 ed                	test   %ebp,%ebp
   17a00:	48 0f 49 d0          	cmovns %rax,%rdx
   17a04:	b8 00 00 00 80       	mov    $0x80000000,%eax
   17a09:	29 c8                	sub    %ecx,%eax
   17a0b:	09 f1                	or     %esi,%ecx
   17a0d:	85 ff                	test   %edi,%edi
   17a0f:	48 0f 49 c1          	cmovns %rcx,%rax
   17a13:	41 b7 01             	mov    $0x1,%r15b
   17a16:	39 c2                	cmp    %eax,%edx
   17a18:	0f 87 04 02 00 00    	ja     17c22 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   17a1e:	89 7c 24 50          	mov    %edi,0x50(%rsp)
   17a22:	48 89 6c 24 28       	mov    %rbp,0x28(%rsp)
   17a27:	48 89 e7             	mov    %rsp,%rdi
   17a2a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17a2f:	4c 89 e9             	mov    %r13,%rcx
   17a32:	4d 89 f0             	mov    %r14,%r8
   17a35:	e8 e6 33 00 00       	call   1ae20 <hyperinterval::ieee::Format::div>
   17a3a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17a3e:	0f 85 91 fe ff ff    	jne    178d5 <hyperinterval::float::F32Enclosure::corner_image+0x55>
   17a44:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17a48:	44 8b 6c 24 10       	mov    0x10(%rsp),%r13d
   17a4d:	48 89 e7             	mov    %rsp,%rdi
   17a50:	be 00 00 00 80       	mov    $0x80000000,%esi
   17a55:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17a5a:	e8 c1 40 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   17a5f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17a63:	0f 85 b3 01 00 00    	jne    17c1c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17a69:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   17a6e:	48 89 e7             	mov    %rsp,%rdi
   17a71:	be 00 00 00 80       	mov    $0x80000000,%esi
   17a76:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17a7b:	4c 89 e9             	mov    %r13,%rcx
   17a7e:	e8 9d 40 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   17a83:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17a87:	0f 85 8f 01 00 00    	jne    17c1c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17a8d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17a91:	89 e8                	mov    %ebp,%eax
   17a93:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   17a98:	89 ca                	mov    %ecx,%edx
   17a9a:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   17aa0:	be 00 00 00 80       	mov    $0x80000000,%esi
   17aa5:	29 c6                	sub    %eax,%esi
   17aa7:	bf 00 00 00 80       	mov    $0x80000000,%edi
   17aac:	09 f8                	or     %edi,%eax
   17aae:	85 ed                	test   %ebp,%ebp
   17ab0:	48 0f 49 f0          	cmovns %rax,%rsi
   17ab4:	b8 00 00 00 80       	mov    $0x80000000,%eax
   17ab9:	29 d0                	sub    %edx,%eax
   17abb:	09 fa                	or     %edi,%edx
   17abd:	85 c9                	test   %ecx,%ecx
   17abf:	48 0f 49 c2          	cmovns %rdx,%rax
   17ac3:	39 c6                	cmp    %eax,%esi
   17ac5:	0f 87 57 01 00 00    	ja     17c22 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   17acb:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   17ad0:	8b 74 24 50          	mov    0x50(%rsp),%esi
   17ad4:	89 ea                	mov    %ebp,%edx
   17ad6:	e8 95 43 00 00       	call   1be70 <hyperinterval::bounds::Bounds<T>::hull>
   17adb:	89 c5                	mov    %eax,%ebp
   17add:	41 89 d5             	mov    %edx,%r13d
   17ae0:	48 89 e7             	mov    %rsp,%rdi
   17ae3:	be 00 00 00 80       	mov    $0x80000000,%esi
   17ae8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17aed:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   17af2:	4d 89 e0             	mov    %r12,%r8
   17af5:	e8 26 33 00 00       	call   1ae20 <hyperinterval::ieee::Format::div>
   17afa:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17afe:	0f 85 d1 fd ff ff    	jne    178d5 <hyperinterval::float::F32Enclosure::corner_image+0x55>
   17b04:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17b08:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   17b0d:	48 89 e7             	mov    %rsp,%rdi
   17b10:	be 00 00 00 80       	mov    $0x80000000,%esi
   17b15:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17b1a:	e8 01 40 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   17b1f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17b23:	0f 85 f3 00 00 00    	jne    17c1c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17b29:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   17b2e:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   17b33:	48 89 e7             	mov    %rsp,%rdi
   17b36:	be 00 00 00 80       	mov    $0x80000000,%esi
   17b3b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17b40:	4c 89 e1             	mov    %r12,%rcx
   17b43:	e8 d8 3f 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   17b48:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17b4c:	0f 85 ca 00 00 00    	jne    17c1c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17b52:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17b56:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   17b5b:	89 d0                	mov    %edx,%eax
   17b5d:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   17b62:	41 89 c8             	mov    %ecx,%r8d
   17b65:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   17b6c:	be 00 00 00 80       	mov    $0x80000000,%esi
   17b71:	29 c6                	sub    %eax,%esi
   17b73:	bf 00 00 00 80       	mov    $0x80000000,%edi
   17b78:	09 f8                	or     %edi,%eax
   17b7a:	85 d2                	test   %edx,%edx
   17b7c:	48 0f 49 f0          	cmovns %rax,%rsi
   17b80:	b8 00 00 00 80       	mov    $0x80000000,%eax
   17b85:	44 29 c0             	sub    %r8d,%eax
   17b88:	41 09 f8             	or     %edi,%r8d
   17b8b:	85 c9                	test   %ecx,%ecx
   17b8d:	49 0f 49 c0          	cmovns %r8,%rax
   17b91:	39 c6                	cmp    %eax,%esi
   17b93:	0f 87 89 00 00 00    	ja     17c22 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   17b99:	89 ef                	mov    %ebp,%edi
   17b9b:	44 89 ee             	mov    %r13d,%esi
   17b9e:	e8 cd 42 00 00       	call   1be70 <hyperinterval::bounds::Bounds<T>::hull>
   17ba3:	41 89 c5             	mov    %eax,%r13d
   17ba6:	41 89 d4             	mov    %edx,%r12d
   17ba9:	48 89 e7             	mov    %rsp,%rdi
   17bac:	be 00 00 00 80       	mov    $0x80000000,%esi
   17bb1:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17bb6:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   17bbb:	4d 89 f0             	mov    %r14,%r8
   17bbe:	e8 5d 32 00 00       	call   1ae20 <hyperinterval::ieee::Format::div>
   17bc3:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17bc7:	0f 85 08 fd ff ff    	jne    178d5 <hyperinterval::float::F32Enclosure::corner_image+0x55>
   17bcd:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17bd1:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   17bd6:	e9 62 02 00 00       	jmp    17e3d <hyperinterval::float::F32Enclosure::corner_image+0x5bd>
   17bdb:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   17bdf:	44 8b 7c 24 40       	mov    0x40(%rsp),%r15d
   17be4:	48 89 e7             	mov    %rsp,%rdi
   17be7:	be 00 00 00 80       	mov    $0x80000000,%esi
   17bec:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17bf1:	e8 2a 3f 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   17bf6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   17bfa:	74 20                	je     17c1c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17bfc:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   17c01:	48 89 e7             	mov    %rsp,%rdi
   17c04:	be 00 00 00 80       	mov    $0x80000000,%esi
   17c09:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17c0e:	4c 89 f9             	mov    %r15,%rcx
   17c11:	e8 0a 3f 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   17c16:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   17c1a:	75 1f                	jne    17c3b <hyperinterval::float::F32Enclosure::corner_image+0x3bb>
   17c1c:	44 0f b6 7c 24 01    	movzbl 0x1(%rsp),%r15d
   17c22:	44 88 7b 04          	mov    %r15b,0x4(%rbx)
   17c26:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17c2c:	48 83 c4 58          	add    $0x58,%rsp
   17c30:	5b                   	pop    %rbx
   17c31:	41 5c                	pop    %r12
   17c33:	41 5d                	pop    %r13
   17c35:	41 5e                	pop    %r14
   17c37:	41 5f                	pop    %r15
   17c39:	5d                   	pop    %rbp
   17c3a:	c3                   	ret
   17c3b:	8b 7c 24 08          	mov    0x8(%rsp),%edi
   17c3f:	89 e8                	mov    %ebp,%eax
   17c41:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   17c46:	89 f9                	mov    %edi,%ecx
   17c48:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   17c4e:	ba 00 00 00 80       	mov    $0x80000000,%edx
   17c53:	29 c2                	sub    %eax,%edx
   17c55:	be 00 00 00 80       	mov    $0x80000000,%esi
   17c5a:	09 f0                	or     %esi,%eax
   17c5c:	85 ed                	test   %ebp,%ebp
   17c5e:	48 0f 49 d0          	cmovns %rax,%rdx
   17c62:	b8 00 00 00 80       	mov    $0x80000000,%eax
   17c67:	29 c8                	sub    %ecx,%eax
   17c69:	09 f1                	or     %esi,%ecx
   17c6b:	85 ff                	test   %edi,%edi
   17c6d:	48 0f 49 c1          	cmovns %rcx,%rax
   17c71:	41 b7 01             	mov    $0x1,%r15b
   17c74:	39 c2                	cmp    %eax,%edx
   17c76:	77 aa                	ja     17c22 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   17c78:	89 7c 24 28          	mov    %edi,0x28(%rsp)
   17c7c:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   17c81:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17c86:	4c 89 e9             	mov    %r13,%rcx
   17c89:	4d 89 f0             	mov    %r14,%r8
   17c8c:	e8 cf 35 00 00       	call   1b260 <hyperinterval::ieee::Format::mul>
   17c91:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   17c96:	0f 85 eb fc ff ff    	jne    17987 <hyperinterval::float::F32Enclosure::corner_image+0x107>
   17c9c:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   17ca0:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
   17ca5:	48 89 e7             	mov    %rsp,%rdi
   17ca8:	be 00 00 00 80       	mov    $0x80000000,%esi
   17cad:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17cb2:	e8 69 3e 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   17cb7:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17cbb:	0f 85 5b ff ff ff    	jne    17c1c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17cc1:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   17cc6:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   17ccb:	48 89 e7             	mov    %rsp,%rdi
   17cce:	be 00 00 00 80       	mov    $0x80000000,%esi
   17cd3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17cd8:	4c 89 e9             	mov    %r13,%rcx
   17cdb:	e8 40 3e 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   17ce0:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17ce4:	0f 85 32 ff ff ff    	jne    17c1c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17cea:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17cee:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
   17cf3:	89 d0                	mov    %edx,%eax
   17cf5:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   17cfa:	41 89 c8             	mov    %ecx,%r8d
   17cfd:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   17d04:	be 00 00 00 80       	mov    $0x80000000,%esi
   17d09:	29 c6                	sub    %eax,%esi
   17d0b:	bf 00 00 00 80       	mov    $0x80000000,%edi
   17d10:	09 f8                	or     %edi,%eax
   17d12:	85 d2                	test   %edx,%edx
   17d14:	48 0f 49 f0          	cmovns %rax,%rsi
   17d18:	b8 00 00 00 80       	mov    $0x80000000,%eax
   17d1d:	44 29 c0             	sub    %r8d,%eax
   17d20:	41 09 f8             	or     %edi,%r8d
   17d23:	85 c9                	test   %ecx,%ecx
   17d25:	49 0f 49 c0          	cmovns %r8,%rax
   17d29:	39 c6                	cmp    %eax,%esi
   17d2b:	0f 87 f1 fe ff ff    	ja     17c22 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   17d31:	89 ef                	mov    %ebp,%edi
   17d33:	8b 74 24 28          	mov    0x28(%rsp),%esi
   17d37:	e8 34 41 00 00       	call   1be70 <hyperinterval::bounds::Bounds<T>::hull>
   17d3c:	89 c5                	mov    %eax,%ebp
   17d3e:	41 89 d5             	mov    %edx,%r13d
   17d41:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   17d46:	be 00 00 00 80       	mov    $0x80000000,%esi
   17d4b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17d50:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   17d55:	4d 89 e0             	mov    %r12,%r8
   17d58:	e8 03 35 00 00       	call   1b260 <hyperinterval::ieee::Format::mul>
   17d5d:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   17d62:	0f 85 1f fc ff ff    	jne    17987 <hyperinterval::float::F32Enclosure::corner_image+0x107>
   17d68:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   17d6c:	44 8b 64 24 40       	mov    0x40(%rsp),%r12d
   17d71:	48 89 e7             	mov    %rsp,%rdi
   17d74:	be 00 00 00 80       	mov    $0x80000000,%esi
   17d79:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17d7e:	e8 9d 3d 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   17d83:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17d87:	0f 85 8f fe ff ff    	jne    17c1c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17d8d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   17d92:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   17d97:	48 89 e7             	mov    %rsp,%rdi
   17d9a:	be 00 00 00 80       	mov    $0x80000000,%esi
   17d9f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17da4:	4c 89 e1             	mov    %r12,%rcx
   17da7:	e8 74 3d 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   17dac:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17db0:	0f 85 66 fe ff ff    	jne    17c1c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17db6:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17dba:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   17dbf:	89 d0                	mov    %edx,%eax
   17dc1:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   17dc6:	41 89 c8             	mov    %ecx,%r8d
   17dc9:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   17dd0:	be 00 00 00 80       	mov    $0x80000000,%esi
   17dd5:	29 c6                	sub    %eax,%esi
   17dd7:	bf 00 00 00 80       	mov    $0x80000000,%edi
   17ddc:	09 f8                	or     %edi,%eax
   17dde:	85 d2                	test   %edx,%edx
   17de0:	48 0f 49 f0          	cmovns %rax,%rsi
   17de4:	b8 00 00 00 80       	mov    $0x80000000,%eax
   17de9:	44 29 c0             	sub    %r8d,%eax
   17dec:	41 09 f8             	or     %edi,%r8d
   17def:	85 c9                	test   %ecx,%ecx
   17df1:	49 0f 49 c0          	cmovns %r8,%rax
   17df5:	39 c6                	cmp    %eax,%esi
   17df7:	0f 87 25 fe ff ff    	ja     17c22 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   17dfd:	89 ef                	mov    %ebp,%edi
   17dff:	44 89 ee             	mov    %r13d,%esi
   17e02:	e8 69 40 00 00       	call   1be70 <hyperinterval::bounds::Bounds<T>::hull>
   17e07:	41 89 c5             	mov    %eax,%r13d
   17e0a:	41 89 d4             	mov    %edx,%r12d
   17e0d:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   17e12:	be 00 00 00 80       	mov    $0x80000000,%esi
   17e17:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17e1c:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   17e21:	4d 89 f0             	mov    %r14,%r8
   17e24:	e8 37 34 00 00       	call   1b260 <hyperinterval::ieee::Format::mul>
   17e29:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   17e2e:	0f 85 53 fb ff ff    	jne    17987 <hyperinterval::float::F32Enclosure::corner_image+0x107>
   17e34:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   17e38:	44 8b 74 24 40       	mov    0x40(%rsp),%r14d
   17e3d:	48 89 e7             	mov    %rsp,%rdi
   17e40:	be 00 00 00 80       	mov    $0x80000000,%esi
   17e45:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17e4a:	e8 d1 3c 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   17e4f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17e53:	0f 85 c3 fd ff ff    	jne    17c1c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17e59:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   17e5e:	48 89 e7             	mov    %rsp,%rdi
   17e61:	be 00 00 00 80       	mov    $0x80000000,%esi
   17e66:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17e6b:	4c 89 f1             	mov    %r14,%rcx
   17e6e:	e8 ad 3c 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   17e73:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17e77:	0f 85 9f fd ff ff    	jne    17c1c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17e7d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17e81:	89 e8                	mov    %ebp,%eax
   17e83:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   17e88:	89 ca                	mov    %ecx,%edx
   17e8a:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   17e90:	be 00 00 00 80       	mov    $0x80000000,%esi
   17e95:	29 c6                	sub    %eax,%esi
   17e97:	bf 00 00 00 80       	mov    $0x80000000,%edi
   17e9c:	09 f8                	or     %edi,%eax
   17e9e:	85 ed                	test   %ebp,%ebp
   17ea0:	48 0f 49 f0          	cmovns %rax,%rsi
   17ea4:	89 d0                	mov    %edx,%eax
   17ea6:	09 f8                	or     %edi,%eax
   17ea8:	29 d7                	sub    %edx,%edi
   17eaa:	85 c9                	test   %ecx,%ecx
   17eac:	48 0f 49 f8          	cmovns %rax,%rdi
   17eb0:	39 fe                	cmp    %edi,%esi
   17eb2:	0f 87 6a fd ff ff    	ja     17c22 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   17eb8:	44 89 ef             	mov    %r13d,%edi
   17ebb:	44 89 e6             	mov    %r12d,%esi
   17ebe:	89 ea                	mov    %ebp,%edx
   17ec0:	e8 ab 3f 00 00       	call   1be70 <hyperinterval::bounds::Bounds<T>::hull>
   17ec5:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   17ecb:	89 43 04             	mov    %eax,0x4(%rbx)
   17ece:	89 53 08             	mov    %edx,0x8(%rbx)
   17ed1:	e9 56 fd ff ff       	jmp    17c2c <hyperinterval::float::F32Enclosure::corner_image+0x3ac>
   17ed6:	cc                   	int3
   17ed7:	cc                   	int3
   17ed8:	cc                   	int3
   17ed9:	cc                   	int3
   17eda:	cc                   	int3
   17edb:	cc                   	int3
   17edc:	cc                   	int3
   17edd:	cc                   	int3
   17ede:	cc                   	int3
   17edf:	cc                   	int3

hyperinterval::float::F32Enclosure::intersection:
   17ee0:	48 89 f8             	mov    %rdi,%rax
   17ee3:	45 31 c9             	xor    %r9d,%r9d
   17ee6:	f6 06 01             	testb  $0x1,(%rsi)
   17ee9:	0f 84 ed 00 00 00    	je     17fdc <hyperinterval::float::F32Enclosure::intersection+0xfc>
   17eef:	f6 02 01             	testb  $0x1,(%rdx)
   17ef2:	0f 84 d9 00 00 00    	je     17fd1 <hyperinterval::float::F32Enclosure::intersection+0xf1>
   17ef8:	53                   	push   %rbx
   17ef9:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   17efd:	8b 4e 04             	mov    0x4(%rsi),%ecx
   17f00:	bf 00 00 00 80       	mov    $0x80000000,%edi
   17f05:	41 89 c9             	mov    %ecx,%r9d
   17f08:	41 09 f9             	or     %edi,%r9d
   17f0b:	41 89 ca             	mov    %ecx,%r10d
   17f0e:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   17f15:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   17f1b:	45 29 d3             	sub    %r10d,%r11d
   17f1e:	85 c9                	test   %ecx,%ecx
   17f20:	4d 0f 49 d9          	cmovns %r9,%r11
   17f24:	45 89 c1             	mov    %r8d,%r9d
   17f27:	41 09 f9             	or     %edi,%r9d
   17f2a:	45 89 c2             	mov    %r8d,%r10d
   17f2d:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   17f34:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   17f39:	44 29 d3             	sub    %r10d,%ebx
   17f3c:	45 85 c0             	test   %r8d,%r8d
   17f3f:	49 0f 49 d9          	cmovns %r9,%rbx
   17f43:	8b 52 08             	mov    0x8(%rdx),%edx
   17f46:	41 39 db             	cmp    %ebx,%r11d
   17f49:	41 0f 42 c8          	cmovb  %r8d,%ecx
   17f4d:	44 8b 46 08          	mov    0x8(%rsi),%r8d
   17f51:	44 89 c6             	mov    %r8d,%esi
   17f54:	09 fe                	or     %edi,%esi
   17f56:	45 89 c1             	mov    %r8d,%r9d
   17f59:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   17f60:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   17f66:	45 29 ca             	sub    %r9d,%r10d
   17f69:	45 85 c0             	test   %r8d,%r8d
   17f6c:	4c 0f 49 d6          	cmovns %rsi,%r10
   17f70:	89 d6                	mov    %edx,%esi
   17f72:	09 fe                	or     %edi,%esi
   17f74:	41 89 d1             	mov    %edx,%r9d
   17f77:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   17f7e:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   17f84:	45 29 cb             	sub    %r9d,%r11d
   17f87:	85 d2                	test   %edx,%edx
   17f89:	4c 0f 49 de          	cmovns %rsi,%r11
   17f8d:	45 39 da             	cmp    %r11d,%r10d
   17f90:	44 0f 47 c2          	cmova  %edx,%r8d
   17f94:	89 ca                	mov    %ecx,%edx
   17f96:	09 fa                	or     %edi,%edx
   17f98:	89 ce                	mov    %ecx,%esi
   17f9a:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   17fa0:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   17fa6:	41 29 f2             	sub    %esi,%r10d
   17fa9:	85 c9                	test   %ecx,%ecx
   17fab:	4c 0f 49 d2          	cmovns %rdx,%r10
   17faf:	44 89 c2             	mov    %r8d,%edx
   17fb2:	09 fa                	or     %edi,%edx
   17fb4:	44 89 c6             	mov    %r8d,%esi
   17fb7:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   17fbd:	29 f7                	sub    %esi,%edi
   17fbf:	45 85 c0             	test   %r8d,%r8d
   17fc2:	48 0f 49 fa          	cmovns %rdx,%rdi
   17fc6:	45 31 c9             	xor    %r9d,%r9d
   17fc9:	41 39 fa             	cmp    %edi,%r10d
   17fcc:	41 0f 96 c1          	setbe  %r9b
   17fd0:	5b                   	pop    %rbx
   17fd1:	44 89 08             	mov    %r9d,(%rax)
   17fd4:	89 48 04             	mov    %ecx,0x4(%rax)
   17fd7:	44 89 40 08          	mov    %r8d,0x8(%rax)
   17fdb:	c3                   	ret
   17fdc:	44 89 08             	mov    %r9d,(%rax)
   17fdf:	89 48 04             	mov    %ecx,0x4(%rax)
   17fe2:	44 89 40 08          	mov    %r8d,0x8(%rax)
   17fe6:	c3                   	ret
   17fe7:	cc                   	int3
   17fe8:	cc                   	int3
   17fe9:	cc                   	int3
   17fea:	cc                   	int3
   17feb:	cc                   	int3
   17fec:	cc                   	int3
   17fed:	cc                   	int3
   17fee:	cc                   	int3
   17fef:	cc                   	int3

hyperinterval::float::F32Enclosure::contains_point:
   17ff0:	41 56                	push   %r14
   17ff2:	53                   	push   %rbx
   17ff3:	48 83 ec 18          	sub    $0x18,%rsp
   17ff7:	48 89 fb             	mov    %rdi,%rbx
   17ffa:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   18000:	66 0f 7e c1          	movd   %xmm0,%ecx
   18004:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18009:	be 00 00 00 80       	mov    $0x80000000,%esi
   1800e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18013:	e8 08 3b 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   18018:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1801d:	3c 01                	cmp    $0x1,%al
   1801f:	75 0d                	jne    1802e <hyperinterval::float::F32Enclosure::contains_point+0x3e>
   18021:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   18026:	48 83 c4 18          	add    $0x18,%rsp
   1802a:	5b                   	pop    %rbx
   1802b:	41 5e                	pop    %r14
   1802d:	c3                   	ret
   1802e:	f6 03 01             	testb  $0x1,(%rbx)
   18031:	74 44                	je     18077 <hyperinterval::float::F32Enclosure::contains_point+0x87>
   18033:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   18038:	8b 73 04             	mov    0x4(%rbx),%esi
   1803b:	89 d1                	mov    %edx,%ecx
   1803d:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18043:	89 f7                	mov    %esi,%edi
   18045:	44 09 f7             	or     %r14d,%edi
   18048:	41 89 f0             	mov    %esi,%r8d
   1804b:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18052:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   18058:	45 29 c1             	sub    %r8d,%r9d
   1805b:	85 f6                	test   %esi,%esi
   1805d:	4c 0f 49 cf          	cmovns %rdi,%r9
   18061:	be 00 00 00 80       	mov    $0x80000000,%esi
   18066:	48 29 ce             	sub    %rcx,%rsi
   18069:	4c 09 f1             	or     %r14,%rcx
   1806c:	85 d2                	test   %edx,%edx
   1806e:	48 0f 48 ce          	cmovs  %rsi,%rcx
   18072:	41 39 c9             	cmp    %ecx,%r9d
   18075:	76 0a                	jbe    18081 <hyperinterval::float::F32Enclosure::contains_point+0x91>
   18077:	31 d2                	xor    %edx,%edx
   18079:	48 83 c4 18          	add    $0x18,%rsp
   1807d:	5b                   	pop    %rbx
   1807e:	41 5e                	pop    %r14
   18080:	c3                   	ret
   18081:	8b 53 08             	mov    0x8(%rbx),%edx
   18084:	89 d6                	mov    %edx,%esi
   18086:	44 09 f6             	or     %r14d,%esi
   18089:	89 d7                	mov    %edx,%edi
   1808b:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18091:	41 29 fe             	sub    %edi,%r14d
   18094:	85 d2                	test   %edx,%edx
   18096:	4c 0f 49 f6          	cmovns %rsi,%r14
   1809a:	44 39 f1             	cmp    %r14d,%ecx
   1809d:	0f 96 c2             	setbe  %dl
   180a0:	48 83 c4 18          	add    $0x18,%rsp
   180a4:	5b                   	pop    %rbx
   180a5:	41 5e                	pop    %r14
   180a7:	c3                   	ret
   180a8:	cc                   	int3
   180a9:	cc                   	int3
   180aa:	cc                   	int3
   180ab:	cc                   	int3
   180ac:	cc                   	int3
   180ad:	cc                   	int3
   180ae:	cc                   	int3
   180af:	cc                   	int3

hyperinterval::float::F32Enclosure::interior_subset_of:
   180b0:	b0 01                	mov    $0x1,%al
   180b2:	f6 07 01             	testb  $0x1,(%rdi)
   180b5:	0f 84 93 00 00 00    	je     1814e <hyperinterval::float::F32Enclosure::interior_subset_of+0x9e>
   180bb:	f6 06 01             	testb  $0x1,(%rsi)
   180be:	0f 84 88 00 00 00    	je     1814c <hyperinterval::float::F32Enclosure::interior_subset_of+0x9c>
   180c4:	8b 4f 04             	mov    0x4(%rdi),%ecx
   180c7:	8b 56 04             	mov    0x4(%rsi),%edx
   180ca:	b8 00 00 00 80       	mov    $0x80000000,%eax
   180cf:	41 89 d0             	mov    %edx,%r8d
   180d2:	41 09 c0             	or     %eax,%r8d
   180d5:	41 89 d1             	mov    %edx,%r9d
   180d8:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   180df:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   180e5:	45 29 ca             	sub    %r9d,%r10d
   180e8:	85 d2                	test   %edx,%edx
   180ea:	4d 0f 49 d0          	cmovns %r8,%r10
   180ee:	89 ca                	mov    %ecx,%edx
   180f0:	09 c2                	or     %eax,%edx
   180f2:	41 89 c8             	mov    %ecx,%r8d
   180f5:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   180fc:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   18102:	45 29 c1             	sub    %r8d,%r9d
   18105:	85 c9                	test   %ecx,%ecx
   18107:	4c 0f 49 ca          	cmovns %rdx,%r9
   1810b:	45 39 ca             	cmp    %r9d,%r10d
   1810e:	73 3c                	jae    1814c <hyperinterval::float::F32Enclosure::interior_subset_of+0x9c>
   18110:	8b 4f 08             	mov    0x8(%rdi),%ecx
   18113:	8b 56 08             	mov    0x8(%rsi),%edx
   18116:	89 ce                	mov    %ecx,%esi
   18118:	09 c6                	or     %eax,%esi
   1811a:	89 cf                	mov    %ecx,%edi
   1811c:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18122:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18128:	41 29 f8             	sub    %edi,%r8d
   1812b:	85 c9                	test   %ecx,%ecx
   1812d:	4c 0f 49 c6          	cmovns %rsi,%r8
   18131:	89 d1                	mov    %edx,%ecx
   18133:	09 c1                	or     %eax,%ecx
   18135:	89 d6                	mov    %edx,%esi
   18137:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1813d:	29 f0                	sub    %esi,%eax
   1813f:	85 d2                	test   %edx,%edx
   18141:	48 0f 49 c1          	cmovns %rcx,%rax
   18145:	41 39 c0             	cmp    %eax,%r8d
   18148:	0f 92 c0             	setb   %al
   1814b:	c3                   	ret
   1814c:	31 c0                	xor    %eax,%eax
   1814e:	c3                   	ret
   1814f:	cc                   	int3

hyperinterval::float::F32Enclosure::add:
   18150:	48 89 f8             	mov    %rdi,%rax
   18153:	f6 06 01             	testb  $0x1,(%rsi)
   18156:	0f 84 d6 00 00 00    	je     18232 <hyperinterval::float::F32Enclosure::add+0xe2>
   1815c:	f6 02 01             	testb  $0x1,(%rdx)
   1815f:	0f 84 cd 00 00 00    	je     18232 <hyperinterval::float::F32Enclosure::add+0xe2>
   18165:	41 57                	push   %r15
   18167:	41 56                	push   %r14
   18169:	41 55                	push   %r13
   1816b:	41 54                	push   %r12
   1816d:	53                   	push   %rbx
   1816e:	48 83 ec 20          	sub    $0x20,%rsp
   18172:	49 89 c4             	mov    %rax,%r12
   18175:	8b 5e 08             	mov    0x8(%rsi),%ebx
   18178:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   1817e:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   18182:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   18186:	8b 4e 04             	mov    0x4(%rsi),%ecx
   18189:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1818e:	be 00 00 00 80       	mov    $0x80000000,%esi
   18193:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18198:	e8 d3 29 00 00       	call   1ab70 <hyperinterval::ieee::Format::add>
   1819d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   181a2:	74 6b                	je     1820f <hyperinterval::float::F32Enclosure::add+0xbf>
   181a4:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   181a9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   181ae:	be 00 00 00 80       	mov    $0x80000000,%esi
   181b3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   181b8:	48 89 d9             	mov    %rbx,%rcx
   181bb:	4d 89 f0             	mov    %r14,%r8
   181be:	e8 ad 29 00 00       	call   1ab70 <hyperinterval::ieee::Format::add>
   181c3:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   181c8:	74 45                	je     1820f <hyperinterval::float::F32Enclosure::add+0xbf>
   181ca:	8b 5c 24 18          	mov    0x18(%rsp),%ebx
   181ce:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   181d3:	be 00 00 00 80       	mov    $0x80000000,%esi
   181d8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   181dd:	4c 89 f9             	mov    %r15,%rcx
   181e0:	e8 3b 39 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   181e5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   181ea:	74 23                	je     1820f <hyperinterval::float::F32Enclosure::add+0xbf>
   181ec:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   181f1:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   181f6:	be 00 00 00 80       	mov    $0x80000000,%esi
   181fb:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18200:	48 89 d9             	mov    %rbx,%rcx
   18203:	e8 18 39 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   18208:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1820d:	75 2a                	jne    18239 <hyperinterval::float::F32Enclosure::add+0xe9>
   1820f:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   18214:	4c 89 e0             	mov    %r12,%rax
   18217:	41 88 4c 24 04       	mov    %cl,0x4(%r12)
   1821c:	41 c7 04 24 02 00 00 	movl   $0x2,(%r12)
   18223:	00 
   18224:	48 83 c4 20          	add    $0x20,%rsp
   18228:	5b                   	pop    %rbx
   18229:	41 5c                	pop    %r12
   1822b:	41 5d                	pop    %r13
   1822d:	41 5e                	pop    %r14
   1822f:	41 5f                	pop    %r15
   18231:	c3                   	ret
   18232:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   18238:	c3                   	ret
   18239:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   1823d:	44 89 f0             	mov    %r14d,%eax
   18240:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18245:	89 ca                	mov    %ecx,%edx
   18247:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1824d:	be 00 00 00 80       	mov    $0x80000000,%esi
   18252:	29 c6                	sub    %eax,%esi
   18254:	44 09 e8             	or     %r13d,%eax
   18257:	45 85 f6             	test   %r14d,%r14d
   1825a:	48 0f 49 f0          	cmovns %rax,%rsi
   1825e:	89 d0                	mov    %edx,%eax
   18260:	44 09 e8             	or     %r13d,%eax
   18263:	41 29 d5             	sub    %edx,%r13d
   18266:	85 c9                	test   %ecx,%ecx
   18268:	4c 0f 49 e8          	cmovns %rax,%r13
   1826c:	44 39 ee             	cmp    %r13d,%esi
   1826f:	4c 89 e0             	mov    %r12,%rax
   18272:	76 0c                	jbe    18280 <hyperinterval::float::F32Enclosure::add+0x130>
   18274:	c6 40 04 01          	movb   $0x1,0x4(%rax)
   18278:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   1827e:	eb a4                	jmp    18224 <hyperinterval::float::F32Enclosure::add+0xd4>
   18280:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   18286:	44 89 70 04          	mov    %r14d,0x4(%rax)
   1828a:	89 48 08             	mov    %ecx,0x8(%rax)
   1828d:	eb 95                	jmp    18224 <hyperinterval::float::F32Enclosure::add+0xd4>
   1828f:	cc                   	int3

hyperinterval::float::F32Enclosure::div:
   18290:	53                   	push   %rbx
   18291:	48 89 fb             	mov    %rdi,%rbx
   18294:	83 3a 01             	cmpl   $0x1,(%rdx)
   18297:	75 1a                	jne    182b3 <hyperinterval::float::F32Enclosure::div+0x23>
   18299:	83 7a 04 00          	cmpl   $0x0,0x4(%rdx)
   1829d:	7f 14                	jg     182b3 <hyperinterval::float::F32Enclosure::div+0x23>
   1829f:	8b 42 08             	mov    0x8(%rdx),%eax
   182a2:	85 c0                	test   %eax,%eax
   182a4:	0f 99 c1             	setns  %cl
   182a7:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   182ac:	0f 94 c0             	sete   %al
   182af:	08 c8                	or     %cl,%al
   182b1:	75 12                	jne    182c5 <hyperinterval::float::F32Enclosure::div+0x35>
   182b3:	48 89 df             	mov    %rbx,%rdi
   182b6:	b9 01 00 00 00       	mov    $0x1,%ecx
   182bb:	e8 c0 f5 ff ff       	call   17880 <hyperinterval::float::F32Enclosure::corner_image>
   182c0:	48 89 d8             	mov    %rbx,%rax
   182c3:	5b                   	pop    %rbx
   182c4:	c3                   	ret
   182c5:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
   182c9:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   182cf:	48 89 d8             	mov    %rbx,%rax
   182d2:	5b                   	pop    %rbx
   182d3:	c3                   	ret
   182d4:	cc                   	int3
   182d5:	cc                   	int3
   182d6:	cc                   	int3
   182d7:	cc                   	int3
   182d8:	cc                   	int3
   182d9:	cc                   	int3
   182da:	cc                   	int3
   182db:	cc                   	int3
   182dc:	cc                   	int3
   182dd:	cc                   	int3
   182de:	cc                   	int3
   182df:	cc                   	int3

hyperinterval::float::F32Enclosure::new:
   182e0:	41 57                	push   %r15
   182e2:	41 56                	push   %r14
   182e4:	53                   	push   %rbx
   182e5:	48 83 ec 20          	sub    $0x20,%rsp
   182e9:	f3 0f 11 4c 24 1c    	movss  %xmm1,0x1c(%rsp)
   182ef:	48 89 fb             	mov    %rdi,%rbx
   182f2:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   182f8:	66 0f 7e c1          	movd   %xmm0,%ecx
   182fc:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18301:	be 00 00 00 80       	mov    $0x80000000,%esi
   18306:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1830b:	e8 10 38 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   18310:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18315:	74 2a                	je     18341 <hyperinterval::float::F32Enclosure::new+0x61>
   18317:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1831c:	66 0f 6e 44 24 1c    	movd   0x1c(%rsp),%xmm0
   18322:	66 0f 7e c1          	movd   %xmm0,%ecx
   18326:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1832b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18330:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18335:	e8 e6 37 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1833a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1833f:	75 1b                	jne    1835c <hyperinterval::float::F32Enclosure::new+0x7c>
   18341:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   18346:	88 43 04             	mov    %al,0x4(%rbx)
   18349:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1834f:	48 89 d8             	mov    %rbx,%rax
   18352:	48 83 c4 20          	add    $0x20,%rsp
   18356:	5b                   	pop    %rbx
   18357:	41 5e                	pop    %r14
   18359:	41 5f                	pop    %r15
   1835b:	c3                   	ret
   1835c:	8b 44 24 10          	mov    0x10(%rsp),%eax
   18360:	44 89 f9             	mov    %r15d,%ecx
   18363:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18369:	89 c2                	mov    %eax,%edx
   1836b:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18371:	be 00 00 00 80       	mov    $0x80000000,%esi
   18376:	29 ce                	sub    %ecx,%esi
   18378:	44 09 f1             	or     %r14d,%ecx
   1837b:	45 85 ff             	test   %r15d,%r15d
   1837e:	48 0f 49 f1          	cmovns %rcx,%rsi
   18382:	89 d1                	mov    %edx,%ecx
   18384:	44 09 f1             	or     %r14d,%ecx
   18387:	41 29 d6             	sub    %edx,%r14d
   1838a:	85 c0                	test   %eax,%eax
   1838c:	4c 0f 49 f1          	cmovns %rcx,%r14
   18390:	44 39 f6             	cmp    %r14d,%esi
   18393:	76 06                	jbe    1839b <hyperinterval::float::F32Enclosure::new+0xbb>
   18395:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   18399:	eb ae                	jmp    18349 <hyperinterval::float::F32Enclosure::new+0x69>
   1839b:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   183a1:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
   183a5:	89 43 08             	mov    %eax,0x8(%rbx)
   183a8:	eb a5                	jmp    1834f <hyperinterval::float::F32Enclosure::new+0x6f>
   183aa:	cc                   	int3
   183ab:	cc                   	int3
   183ac:	cc                   	int3
   183ad:	cc                   	int3
   183ae:	cc                   	int3
   183af:	cc                   	int3

hyperinterval::float::F32Enclosure::sub:
   183b0:	53                   	push   %rbx
   183b1:	48 83 ec 10          	sub    $0x10,%rsp
   183b5:	48 89 fb             	mov    %rdi,%rbx
   183b8:	f6 02 01             	testb  $0x1,(%rdx)
   183bb:	74 29                	je     183e6 <hyperinterval::float::F32Enclosure::sub+0x36>
   183bd:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   183c2:	66 0f ef c9          	pxor   %xmm1,%xmm1
   183c6:	66 0f 6f 15 b2 d4 fe 	movdqa -0x12b4e(%rip),%xmm2        # 5880 <__abi_tag+0x5584>
   183cd:	ff 
   183ce:	66 0f ef d0          	pxor   %xmm0,%xmm2
   183d2:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   183d6:	66 0f df ca          	pandn  %xmm2,%xmm1
   183da:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   183df:	b8 01 00 00 00       	mov    $0x1,%eax
   183e4:	eb 02                	jmp    183e8 <hyperinterval::float::F32Enclosure::sub+0x38>
   183e6:	31 c0                	xor    %eax,%eax
   183e8:	89 44 24 04          	mov    %eax,0x4(%rsp)
   183ec:	66 0f d6 44 24 08    	movq   %xmm0,0x8(%rsp)
   183f2:	48 8d 54 24 04       	lea    0x4(%rsp),%rdx
   183f7:	48 89 df             	mov    %rbx,%rdi
   183fa:	ff 15 10 59 04 00    	call   *0x45910(%rip)        # 5dd10 <_DYNAMIC+0x2d0>
   18400:	48 89 d8             	mov    %rbx,%rax
   18403:	48 83 c4 10          	add    $0x10,%rsp
   18407:	5b                   	pop    %rbx
   18408:	c3                   	ret
   18409:	cc                   	int3
   1840a:	cc                   	int3
   1840b:	cc                   	int3
   1840c:	cc                   	int3
   1840d:	cc                   	int3
   1840e:	cc                   	int3
   1840f:	cc                   	int3

hyperinterval::float::F32Enclosure::hull:
   18410:	48 89 f8             	mov    %rdi,%rax
   18413:	44 8b 0e             	mov    (%rsi),%r9d
   18416:	44 8b 02             	mov    (%rdx),%r8d
   18419:	8b 7a 04             	mov    0x4(%rdx),%edi
   1841c:	8b 4a 08             	mov    0x8(%rdx),%ecx
   1841f:	41 f6 c1 01          	test   $0x1,%r9b
   18423:	0f 84 a1 00 00 00    	je     184ca <hyperinterval::float::F32Enclosure::hull+0xba>
   18429:	8b 56 04             	mov    0x4(%rsi),%edx
   1842c:	8b 76 08             	mov    0x8(%rsi),%esi
   1842f:	41 f6 c0 01          	test   $0x1,%r8b
   18433:	0f 84 9b 00 00 00    	je     184d4 <hyperinterval::float::F32Enclosure::hull+0xc4>
   18439:	53                   	push   %rbx
   1843a:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18440:	41 89 d1             	mov    %edx,%r9d
   18443:	45 09 c1             	or     %r8d,%r9d
   18446:	41 89 d2             	mov    %edx,%r10d
   18449:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18450:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   18456:	45 29 d3             	sub    %r10d,%r11d
   18459:	85 d2                	test   %edx,%edx
   1845b:	4d 0f 49 d9          	cmovns %r9,%r11
   1845f:	41 89 f9             	mov    %edi,%r9d
   18462:	45 09 c1             	or     %r8d,%r9d
   18465:	41 89 fa             	mov    %edi,%r10d
   18468:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1846f:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   18474:	44 29 d3             	sub    %r10d,%ebx
   18477:	85 ff                	test   %edi,%edi
   18479:	49 0f 49 d9          	cmovns %r9,%rbx
   1847d:	41 39 db             	cmp    %ebx,%r11d
   18480:	0f 47 d7             	cmova  %edi,%edx
   18483:	89 f7                	mov    %esi,%edi
   18485:	44 09 c7             	or     %r8d,%edi
   18488:	41 89 f1             	mov    %esi,%r9d
   1848b:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18492:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18498:	45 29 ca             	sub    %r9d,%r10d
   1849b:	85 f6                	test   %esi,%esi
   1849d:	4c 0f 49 d7          	cmovns %rdi,%r10
   184a1:	89 cf                	mov    %ecx,%edi
   184a3:	44 09 c7             	or     %r8d,%edi
   184a6:	41 89 c9             	mov    %ecx,%r9d
   184a9:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   184b0:	45 29 c8             	sub    %r9d,%r8d
   184b3:	85 c9                	test   %ecx,%ecx
   184b5:	4c 0f 49 c7          	cmovns %rdi,%r8
   184b9:	45 39 c2             	cmp    %r8d,%r10d
   184bc:	0f 42 f1             	cmovb  %ecx,%esi
   184bf:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   184c5:	89 f1                	mov    %esi,%ecx
   184c7:	89 d7                	mov    %edx,%edi
   184c9:	5b                   	pop    %rbx
   184ca:	44 89 00             	mov    %r8d,(%rax)
   184cd:	89 78 04             	mov    %edi,0x4(%rax)
   184d0:	89 48 08             	mov    %ecx,0x8(%rax)
   184d3:	c3                   	ret
   184d4:	89 f1                	mov    %esi,%ecx
   184d6:	89 d7                	mov    %edx,%edi
   184d8:	45 89 c8             	mov    %r9d,%r8d
   184db:	44 89 00             	mov    %r8d,(%rax)
   184de:	89 78 04             	mov    %edi,0x4(%rax)
   184e1:	89 48 08             	mov    %ecx,0x8(%rax)
   184e4:	c3                   	ret
   184e5:	cc                   	int3
   184e6:	cc                   	int3
   184e7:	cc                   	int3
   184e8:	cc                   	int3
   184e9:	cc                   	int3
   184ea:	cc                   	int3
   184eb:	cc                   	int3
   184ec:	cc                   	int3
   184ed:	cc                   	int3
   184ee:	cc                   	int3
   184ef:	cc                   	int3

hyperinterval::float::F32Enclosure::point:
   184f0:	53                   	push   %rbx
   184f1:	48 83 ec 10          	sub    $0x10,%rsp
   184f5:	48 89 fb             	mov    %rdi,%rbx
   184f8:	66 0f 7e c1          	movd   %xmm0,%ecx
   184fc:	48 89 e7             	mov    %rsp,%rdi
   184ff:	be 00 00 00 80       	mov    $0x80000000,%esi
   18504:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18509:	e8 12 36 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1850e:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18512:	75 0f                	jne    18523 <hyperinterval::float::F32Enclosure::point+0x33>
   18514:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   18519:	88 43 04             	mov    %al,0x4(%rbx)
   1851c:	b8 02 00 00 00       	mov    $0x2,%eax
   18521:	eb 0f                	jmp    18532 <hyperinterval::float::F32Enclosure::point+0x42>
   18523:	8b 44 24 08          	mov    0x8(%rsp),%eax
   18527:	89 43 04             	mov    %eax,0x4(%rbx)
   1852a:	89 43 08             	mov    %eax,0x8(%rbx)
   1852d:	b8 01 00 00 00       	mov    $0x1,%eax
   18532:	89 03                	mov    %eax,(%rbx)
   18534:	48 89 d8             	mov    %rbx,%rax
   18537:	48 83 c4 10          	add    $0x10,%rsp
   1853b:	5b                   	pop    %rbx
   1853c:	c3                   	ret
   1853d:	cc                   	int3
   1853e:	cc                   	int3
   1853f:	cc                   	int3

hyperinterval::float::F32Enclosure::signs:
   18540:	83 3f 01             	cmpl   $0x1,(%rdi)
   18543:	75 65                	jne    185aa <hyperinterval::float::F32Enclosure::signs+0x6a>
   18545:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   1854a:	8b 57 04             	mov    0x4(%rdi),%edx
   1854d:	8b 47 08             	mov    0x8(%rdi),%eax
   18550:	48 89 d6             	mov    %rdx,%rsi
   18553:	48 09 ce             	or     %rcx,%rsi
   18556:	41 89 d0             	mov    %edx,%r8d
   18559:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18560:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18565:	4c 29 c7             	sub    %r8,%rdi
   18568:	85 d2                	test   %edx,%edx
   1856a:	48 0f 49 fe          	cmovns %rsi,%rdi
   1856e:	31 f6                	xor    %esi,%esi
   18570:	f7 c7 00 00 00 80    	test   $0x80000000,%edi
   18576:	0f 94 c2             	sete   %dl
   18579:	48 39 cf             	cmp    %rcx,%rdi
   1857c:	77 1d                	ja     1859b <hyperinterval::float::F32Enclosure::signs+0x5b>
   1857e:	39 cf                	cmp    %ecx,%edi
   18580:	0f 92 c1             	setb   %cl
   18583:	80 c9 02             	or     $0x2,%cl
   18586:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   1858b:	0f b6 c9             	movzbl %cl,%ecx
   1858e:	40 88 d6             	mov    %dl,%sil
   18591:	0f 44 f1             	cmove  %ecx,%esi
   18594:	85 c0                	test   %eax,%eax
   18596:	0f 49 f1             	cmovns %ecx,%esi
   18599:	89 f2                	mov    %esi,%edx
   1859b:	8d 4a 04             	lea    0x4(%rdx),%ecx
   1859e:	85 c0                	test   %eax,%eax
   185a0:	0f b6 d2             	movzbl %dl,%edx
   185a3:	0f b6 c1             	movzbl %cl,%eax
   185a6:	0f 4e c2             	cmovle %edx,%eax
   185a9:	c3                   	ret
   185aa:	31 c0                	xor    %eax,%eax
   185ac:	c3                   	ret
   185ad:	cc                   	int3
   185ae:	cc                   	int3
   185af:	cc                   	int3

hyperinterval::float::F32Enclosure::affine:
   185b0:	55                   	push   %rbp
   185b1:	41 57                	push   %r15
   185b3:	41 56                	push   %r14
   185b5:	41 55                	push   %r13
   185b7:	41 54                	push   %r12
   185b9:	53                   	push   %rbx
   185ba:	48 83 ec 28          	sub    $0x28,%rsp
   185be:	f3 0f 11 4c 24 20    	movss  %xmm1,0x20(%rsp)
   185c4:	49 89 f7             	mov    %rsi,%r15
   185c7:	48 89 fb             	mov    %rdi,%rbx
   185ca:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   185d0:	66 0f 7e c1          	movd   %xmm0,%ecx
   185d4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   185d9:	be 00 00 00 80       	mov    $0x80000000,%esi
   185de:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   185e3:	e8 38 35 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   185e8:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   185ed:	74 2a                	je     18619 <hyperinterval::float::F32Enclosure::affine+0x69>
   185ef:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   185f4:	66 0f 6e 44 24 20    	movd   0x20(%rsp),%xmm0
   185fa:	66 0f 7e c1          	movd   %xmm0,%ecx
   185fe:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18603:	be 00 00 00 80       	mov    $0x80000000,%esi
   18608:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1860d:	e8 0e 35 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   18612:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18617:	75 20                	jne    18639 <hyperinterval::float::F32Enclosure::affine+0x89>
   18619:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1861e:	88 43 04             	mov    %al,0x4(%rbx)
   18621:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18627:	48 89 d8             	mov    %rbx,%rax
   1862a:	48 83 c4 28          	add    $0x28,%rsp
   1862e:	5b                   	pop    %rbx
   1862f:	41 5c                	pop    %r12
   18631:	41 5d                	pop    %r13
   18633:	41 5e                	pop    %r14
   18635:	41 5f                	pop    %r15
   18637:	5d                   	pop    %rbp
   18638:	c3                   	ret
   18639:	41 f6 07 01          	testb  $0x1,(%r15)
   1863d:	0f 84 19 01 00 00    	je     1875c <hyperinterval::float::F32Enclosure::affine+0x1ac>
   18643:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   18648:	41 8b 4f 04          	mov    0x4(%r15),%ecx
   1864c:	45 8b 7f 08          	mov    0x8(%r15),%r15d
   18650:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18655:	be 00 00 00 80       	mov    $0x80000000,%esi
   1865a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1865f:	4d 89 f0             	mov    %r14,%r8
   18662:	4d 89 e1             	mov    %r12,%r9
   18665:	e8 c6 30 00 00       	call   1b730 <hyperinterval::ieee::Format::affine>
   1866a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1866f:	74 a8                	je     18619 <hyperinterval::float::F32Enclosure::affine+0x69>
   18671:	8b 6c 24 10          	mov    0x10(%rsp),%ebp
   18675:	8b 44 24 18          	mov    0x18(%rsp),%eax
   18679:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1867e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18683:	be 00 00 00 80       	mov    $0x80000000,%esi
   18688:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1868d:	4c 89 f9             	mov    %r15,%rcx
   18690:	4d 89 f0             	mov    %r14,%r8
   18693:	4d 89 e1             	mov    %r12,%r9
   18696:	e8 95 30 00 00       	call   1b730 <hyperinterval::ieee::Format::affine>
   1869b:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   186a0:	0f 84 73 ff ff ff    	je     18619 <hyperinterval::float::F32Enclosure::affine+0x69>
   186a6:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   186ab:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
   186b0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   186b5:	be 00 00 00 80       	mov    $0x80000000,%esi
   186ba:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   186bf:	48 89 e9             	mov    %rbp,%rcx
   186c2:	e8 59 34 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   186c7:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   186cc:	0f 84 47 ff ff ff    	je     18619 <hyperinterval::float::F32Enclosure::affine+0x69>
   186d2:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   186d7:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   186dc:	be 00 00 00 80       	mov    $0x80000000,%esi
   186e1:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   186e6:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   186eb:	e8 30 34 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   186f0:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   186f5:	0f 84 1e ff ff ff    	je     18619 <hyperinterval::float::F32Enclosure::affine+0x69>
   186fb:	8b 6c 24 10          	mov    0x10(%rsp),%ebp
   186ff:	44 89 f0             	mov    %r14d,%eax
   18702:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18707:	89 e9                	mov    %ebp,%ecx
   18709:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1870f:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18714:	29 c2                	sub    %eax,%edx
   18716:	44 09 e8             	or     %r13d,%eax
   18719:	45 85 f6             	test   %r14d,%r14d
   1871c:	48 0f 49 d0          	cmovns %rax,%rdx
   18720:	89 c8                	mov    %ecx,%eax
   18722:	44 09 e8             	or     %r13d,%eax
   18725:	41 29 cd             	sub    %ecx,%r13d
   18728:	85 ed                	test   %ebp,%ebp
   1872a:	4c 0f 49 e8          	cmovns %rax,%r13
   1872e:	b0 01                	mov    $0x1,%al
   18730:	44 39 ea             	cmp    %r13d,%edx
   18733:	0f 87 e5 fe ff ff    	ja     1861e <hyperinterval::float::F32Enclosure::affine+0x6e>
   18739:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1873e:	4c 89 fe             	mov    %r15,%rsi
   18741:	4c 89 e2             	mov    %r12,%rdx
   18744:	e8 37 06 00 00       	call   18d80 <hyperinterval::float::F32Enclosure::from_bits>
   18749:	8b 44 24 08          	mov    0x8(%rsp),%eax
   1874d:	83 f8 02             	cmp    $0x2,%eax
   18750:	75 15                	jne    18767 <hyperinterval::float::F32Enclosure::affine+0x1b7>
   18752:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   18757:	e9 c2 fe ff ff       	jmp    1861e <hyperinterval::float::F32Enclosure::affine+0x6e>
   1875c:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   18762:	e9 c0 fe ff ff       	jmp    18627 <hyperinterval::float::F32Enclosure::affine+0x77>
   18767:	83 f8 01             	cmp    $0x1,%eax
   1876a:	75 17                	jne    18783 <hyperinterval::float::F32Enclosure::affine+0x1d3>
   1876c:	8b 54 24 0c          	mov    0xc(%rsp),%edx
   18770:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   18774:	44 89 f7             	mov    %r14d,%edi
   18777:	89 ee                	mov    %ebp,%esi
   18779:	e8 f2 36 00 00       	call   1be70 <hyperinterval::bounds::Bounds<T>::hull>
   1877e:	41 89 c6             	mov    %eax,%r14d
   18781:	89 d5                	mov    %edx,%ebp
   18783:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   18789:	44 89 73 04          	mov    %r14d,0x4(%rbx)
   1878d:	89 6b 08             	mov    %ebp,0x8(%rbx)
   18790:	e9 92 fe ff ff       	jmp    18627 <hyperinterval::float::F32Enclosure::affine+0x77>
   18795:	cc                   	int3
   18796:	cc                   	int3
   18797:	cc                   	int3
   18798:	cc                   	int3
   18799:	cc                   	int3
   1879a:	cc                   	int3
   1879b:	cc                   	int3
   1879c:	cc                   	int3
   1879d:	cc                   	int3
   1879e:	cc                   	int3
   1879f:	cc                   	int3

hyperinterval::float::F32Enclosure::square:
   187a0:	55                   	push   %rbp
   187a1:	41 57                	push   %r15
   187a3:	41 56                	push   %r14
   187a5:	41 55                	push   %r13
   187a7:	41 54                	push   %r12
   187a9:	53                   	push   %rbx
   187aa:	48 83 ec 48          	sub    $0x48,%rsp
   187ae:	48 89 fb             	mov    %rdi,%rbx
   187b1:	f6 06 01             	testb  $0x1,(%rsi)
   187b4:	0f 84 d8 00 00 00    	je     18892 <hyperinterval::float::F32Enclosure::square+0xf2>
   187ba:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
   187be:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   187c2:	44 89 f8             	mov    %r15d,%eax
   187c5:	c1 e8 17             	shr    $0x17,%eax
   187c8:	0f b6 c8             	movzbl %al,%ecx
   187cb:	44 89 fa             	mov    %r15d,%edx
   187ce:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
   187d4:	31 c0                	xor    %eax,%eax
   187d6:	85 c9                	test   %ecx,%ecx
   187d8:	8d 8c 09 d4 fe ff ff 	lea    -0x12c(%rcx,%rcx,1),%ecx
   187df:	41 bc d6 fe ff ff    	mov    $0xfffffed6,%r12d
   187e5:	41 0f 44 cc          	cmove  %r12d,%ecx
   187e9:	0f 95 c0             	setne  %al
   187ec:	c1 e0 17             	shl    $0x17,%eax
   187ef:	48 09 d0             	or     %rdx,%rax
   187f2:	48 f7 e0             	mul    %rax
   187f5:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   187fa:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   187ff:	48 89 04 24          	mov    %rax,(%rsp)
   18803:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   18807:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1880c:	48 89 e1             	mov    %rsp,%rcx
   1880f:	be 00 00 00 80       	mov    $0x80000000,%esi
   18814:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18819:	e8 42 33 00 00       	call   1bb60 <hyperinterval::ieee::Format::rounded>
   1881e:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   18823:	75 66                	jne    1888b <hyperinterval::float::F32Enclosure::square+0xeb>
   18825:	44 8b 6c 24 38       	mov    0x38(%rsp),%r13d
   1882a:	8b 6c 24 40          	mov    0x40(%rsp),%ebp
   1882e:	44 89 f0             	mov    %r14d,%eax
   18831:	c1 e8 17             	shr    $0x17,%eax
   18834:	0f b6 c8             	movzbl %al,%ecx
   18837:	44 89 f2             	mov    %r14d,%edx
   1883a:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
   18840:	31 c0                	xor    %eax,%eax
   18842:	85 c9                	test   %ecx,%ecx
   18844:	8d 8c 09 d4 fe ff ff 	lea    -0x12c(%rcx,%rcx,1),%ecx
   1884b:	41 0f 44 cc          	cmove  %r12d,%ecx
   1884f:	0f 95 c0             	setne  %al
   18852:	c1 e0 17             	shl    $0x17,%eax
   18855:	48 09 d0             	or     %rdx,%rax
   18858:	48 f7 e0             	mul    %rax
   1885b:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   18860:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   18865:	48 89 04 24          	mov    %rax,(%rsp)
   18869:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1886d:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   18872:	48 89 e1             	mov    %rsp,%rcx
   18875:	be 00 00 00 80       	mov    $0x80000000,%esi
   1887a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1887f:	e8 dc 32 00 00       	call   1bb60 <hyperinterval::ieee::Format::rounded>
   18884:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   18889:	75 0f                	jne    1889a <hyperinterval::float::F32Enclosure::square+0xfa>
   1888b:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   18890:	eb 59                	jmp    188eb <hyperinterval::float::F32Enclosure::square+0x14b>
   18892:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   18898:	eb 5a                	jmp    188f4 <hyperinterval::float::F32Enclosure::square+0x154>
   1889a:	8b 44 24 38          	mov    0x38(%rsp),%eax
   1889e:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   188a3:	44 8b 64 24 40       	mov    0x40(%rsp),%r12d
   188a8:	48 89 e7             	mov    %rsp,%rdi
   188ab:	be 00 00 00 80       	mov    $0x80000000,%esi
   188b0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   188b5:	4c 89 e9             	mov    %r13,%rcx
   188b8:	e8 63 32 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   188bd:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   188c1:	74 23                	je     188e6 <hyperinterval::float::F32Enclosure::square+0x146>
   188c3:	4d 89 e5             	mov    %r12,%r13
   188c6:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   188cb:	48 89 e7             	mov    %rsp,%rdi
   188ce:	be 00 00 00 80       	mov    $0x80000000,%esi
   188d3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   188d8:	48 89 e9             	mov    %rbp,%rcx
   188db:	e8 40 32 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   188e0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   188e4:	75 20                	jne    18906 <hyperinterval::float::F32Enclosure::square+0x166>
   188e6:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   188eb:	88 43 04             	mov    %al,0x4(%rbx)
   188ee:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   188f4:	48 89 d8             	mov    %rbx,%rax
   188f7:	48 83 c4 48          	add    $0x48,%rsp
   188fb:	5b                   	pop    %rbx
   188fc:	41 5c                	pop    %r12
   188fe:	41 5d                	pop    %r13
   18900:	41 5e                	pop    %r14
   18902:	41 5f                	pop    %r15
   18904:	5d                   	pop    %rbp
   18905:	c3                   	ret
   18906:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   1890a:	44 89 e0             	mov    %r12d,%eax
   1890d:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18912:	89 e9                	mov    %ebp,%ecx
   18914:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1891a:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1891f:	29 c2                	sub    %eax,%edx
   18921:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18926:	09 f8                	or     %edi,%eax
   18928:	45 85 e4             	test   %r12d,%r12d
   1892b:	48 0f 49 d0          	cmovns %rax,%rdx
   1892f:	be 00 00 00 80       	mov    $0x80000000,%esi
   18934:	29 ce                	sub    %ecx,%esi
   18936:	89 c8                	mov    %ecx,%eax
   18938:	09 f8                	or     %edi,%eax
   1893a:	85 ed                	test   %ebp,%ebp
   1893c:	48 0f 49 f0          	cmovns %rax,%rsi
   18940:	b0 01                	mov    $0x1,%al
   18942:	39 f2                	cmp    %esi,%edx
   18944:	77 a5                	ja     188eb <hyperinterval::float::F32Enclosure::square+0x14b>
   18946:	48 89 e7             	mov    %rsp,%rdi
   18949:	be 00 00 00 80       	mov    $0x80000000,%esi
   1894e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18953:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   18958:	e8 c3 31 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1895d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18961:	74 83                	je     188e6 <hyperinterval::float::F32Enclosure::square+0x146>
   18963:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   18968:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1896d:	48 89 e7             	mov    %rsp,%rdi
   18970:	be 00 00 00 80       	mov    $0x80000000,%esi
   18975:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1897a:	4c 89 e9             	mov    %r13,%rcx
   1897d:	e8 9e 31 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   18982:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18986:	0f 84 5a ff ff ff    	je     188e6 <hyperinterval::float::F32Enclosure::square+0x146>
   1898c:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18990:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   18995:	89 d0                	mov    %edx,%eax
   18997:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   1899c:	41 89 c8             	mov    %ecx,%r8d
   1899f:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   189a6:	be 00 00 00 80       	mov    $0x80000000,%esi
   189ab:	29 c6                	sub    %eax,%esi
   189ad:	bf 00 00 00 80       	mov    $0x80000000,%edi
   189b2:	09 f8                	or     %edi,%eax
   189b4:	85 d2                	test   %edx,%edx
   189b6:	48 0f 49 f0          	cmovns %rax,%rsi
   189ba:	44 89 c0             	mov    %r8d,%eax
   189bd:	09 f8                	or     %edi,%eax
   189bf:	44 29 c7             	sub    %r8d,%edi
   189c2:	85 c9                	test   %ecx,%ecx
   189c4:	48 0f 49 f8          	cmovns %rax,%rdi
   189c8:	b0 01                	mov    $0x1,%al
   189ca:	39 fe                	cmp    %edi,%esi
   189cc:	0f 87 19 ff ff ff    	ja     188eb <hyperinterval::float::F32Enclosure::square+0x14b>
   189d2:	44 89 e7             	mov    %r12d,%edi
   189d5:	89 ee                	mov    %ebp,%esi
   189d7:	e8 94 34 00 00       	call   1be70 <hyperinterval::bounds::Bounds<T>::hull>
   189dc:	41 89 c4             	mov    %eax,%r12d
   189df:	89 d5                	mov    %edx,%ebp
   189e1:	44 89 ff             	mov    %r15d,%edi
   189e4:	44 89 f6             	mov    %r14d,%esi
   189e7:	31 d2                	xor    %edx,%edx
   189e9:	e8 32 36 00 00       	call   1c020 <hyperinterval::bounds::Bounds<T>::signs>
   189ee:	a8 02                	test   $0x2,%al
   189f0:	75 12                	jne    18a04 <hyperinterval::float::F32Enclosure::square+0x264>
   189f2:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   189f8:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   189fc:	89 6b 08             	mov    %ebp,0x8(%rbx)
   189ff:	e9 f0 fe ff ff       	jmp    188f4 <hyperinterval::float::F32Enclosure::square+0x154>
   18a04:	48 89 e7             	mov    %rsp,%rdi
   18a07:	31 f6                	xor    %esi,%esi
   18a09:	31 d2                	xor    %edx,%edx
   18a0b:	e8 70 03 00 00       	call   18d80 <hyperinterval::float::F32Enclosure::from_bits>
   18a10:	8b 04 24             	mov    (%rsp),%eax
   18a13:	83 f8 02             	cmp    $0x2,%eax
   18a16:	75 0a                	jne    18a22 <hyperinterval::float::F32Enclosure::square+0x282>
   18a18:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   18a1d:	e9 c9 fe ff ff       	jmp    188eb <hyperinterval::float::F32Enclosure::square+0x14b>
   18a22:	83 f8 01             	cmp    $0x1,%eax
   18a25:	75 cb                	jne    189f2 <hyperinterval::float::F32Enclosure::square+0x252>
   18a27:	8b 54 24 04          	mov    0x4(%rsp),%edx
   18a2b:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18a2f:	44 89 e7             	mov    %r12d,%edi
   18a32:	89 ee                	mov    %ebp,%esi
   18a34:	e8 37 34 00 00       	call   1be70 <hyperinterval::bounds::Bounds<T>::hull>
   18a39:	41 89 c4             	mov    %eax,%r12d
   18a3c:	89 d5                	mov    %edx,%ebp
   18a3e:	eb b2                	jmp    189f2 <hyperinterval::float::F32Enclosure::square+0x252>

hyperinterval::float::F32Enclosure::next_up:
   18a40:	48 83 ec 18          	sub    $0x18,%rsp
   18a44:	66 0f 7e c1          	movd   %xmm0,%ecx
   18a48:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18a4d:	be 00 00 00 80       	mov    $0x80000000,%esi
   18a52:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18a57:	e8 c4 30 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   18a5c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18a61:	75 10                	jne    18a73 <hyperinterval::float::F32Enclosure::next_up+0x33>
   18a63:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   18a68:	c1 e0 08             	shl    $0x8,%eax
   18a6b:	48 ff c0             	inc    %rax
   18a6e:	48 83 c4 18          	add    $0x18,%rsp
   18a72:	c3                   	ret
   18a73:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   18a78:	31 c9                	xor    %ecx,%ecx
   18a7a:	85 c0                	test   %eax,%eax
   18a7c:	0f 99 c1             	setns  %cl
   18a7f:	48 8d 0c 48          	lea    (%rax,%rcx,2),%rcx
   18a83:	48 ff c9             	dec    %rcx
   18a86:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18a8b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18a90:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18a95:	e8 86 30 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   18a9a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18a9f:	75 0a                	jne    18aab <hyperinterval::float::F32Enclosure::next_up+0x6b>
   18aa1:	b8 01 03 00 00       	mov    $0x301,%eax
   18aa6:	48 83 c4 18          	add    $0x18,%rsp
   18aaa:	c3                   	ret
   18aab:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   18ab0:	48 c1 e0 20          	shl    $0x20,%rax
   18ab4:	48 83 c4 18          	add    $0x18,%rsp
   18ab8:	c3                   	ret
   18ab9:	cc                   	int3
   18aba:	cc                   	int3
   18abb:	cc                   	int3
   18abc:	cc                   	int3
   18abd:	cc                   	int3
   18abe:	cc                   	int3
   18abf:	cc                   	int3

hyperinterval::float::F32Enclosure::disjoint:
   18ac0:	83 3f 00             	cmpl   $0x0,(%rdi)
   18ac3:	b0 01                	mov    $0x1,%al
   18ac5:	0f 84 a3 00 00 00    	je     18b6e <hyperinterval::float::F32Enclosure::disjoint+0xae>
   18acb:	8b 0e                	mov    (%rsi),%ecx
   18acd:	85 c9                	test   %ecx,%ecx
   18acf:	0f 84 99 00 00 00    	je     18b6e <hyperinterval::float::F32Enclosure::disjoint+0xae>
   18ad5:	f6 c1 01             	test   $0x1,%cl
   18ad8:	74 4c                	je     18b26 <hyperinterval::float::F32Enclosure::disjoint+0x66>
   18ada:	53                   	push   %rbx
   18adb:	8b 56 04             	mov    0x4(%rsi),%edx
   18ade:	44 8b 47 08          	mov    0x8(%rdi),%r8d
   18ae2:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   18ae8:	45 89 c2             	mov    %r8d,%r10d
   18aeb:	45 09 ca             	or     %r9d,%r10d
   18aee:	45 89 c3             	mov    %r8d,%r11d
   18af1:	41 81 e3 ff ff ff 7f 	and    $0x7fffffff,%r11d
   18af8:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   18afd:	44 29 db             	sub    %r11d,%ebx
   18b00:	45 85 c0             	test   %r8d,%r8d
   18b03:	49 0f 49 da          	cmovns %r10,%rbx
   18b07:	41 89 d0             	mov    %edx,%r8d
   18b0a:	45 09 c8             	or     %r9d,%r8d
   18b0d:	41 89 d2             	mov    %edx,%r10d
   18b10:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18b17:	45 29 d1             	sub    %r10d,%r9d
   18b1a:	85 d2                	test   %edx,%edx
   18b1c:	4d 0f 49 c8          	cmovns %r8,%r9
   18b20:	44 39 cb             	cmp    %r9d,%ebx
   18b23:	5b                   	pop    %rbx
   18b24:	72 48                	jb     18b6e <hyperinterval::float::F32Enclosure::disjoint+0xae>
   18b26:	f6 c1 01             	test   $0x1,%cl
   18b29:	75 03                	jne    18b2e <hyperinterval::float::F32Enclosure::disjoint+0x6e>
   18b2b:	31 c0                	xor    %eax,%eax
   18b2d:	c3                   	ret
   18b2e:	8b 47 04             	mov    0x4(%rdi),%eax
   18b31:	8b 4e 08             	mov    0x8(%rsi),%ecx
   18b34:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18b39:	89 ce                	mov    %ecx,%esi
   18b3b:	09 d6                	or     %edx,%esi
   18b3d:	89 cf                	mov    %ecx,%edi
   18b3f:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18b45:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18b4b:	41 29 f8             	sub    %edi,%r8d
   18b4e:	85 c9                	test   %ecx,%ecx
   18b50:	4c 0f 49 c6          	cmovns %rsi,%r8
   18b54:	89 c1                	mov    %eax,%ecx
   18b56:	09 d1                	or     %edx,%ecx
   18b58:	89 c6                	mov    %eax,%esi
   18b5a:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18b60:	29 f2                	sub    %esi,%edx
   18b62:	85 c0                	test   %eax,%eax
   18b64:	48 0f 49 d1          	cmovns %rcx,%rdx
   18b68:	41 39 d0             	cmp    %edx,%r8d
   18b6b:	0f 92 c0             	setb   %al
   18b6e:	c3                   	ret
   18b6f:	cc                   	int3

hyperinterval::float::F32Enclosure::expanded:
   18b70:	41 57                	push   %r15
   18b72:	41 56                	push   %r14
   18b74:	41 54                	push   %r12
   18b76:	53                   	push   %rbx
   18b77:	48 83 ec 18          	sub    $0x18,%rsp
   18b7b:	48 89 fb             	mov    %rdi,%rbx
   18b7e:	f6 06 01             	testb  $0x1,(%rsi)
   18b81:	74 7c                	je     18bff <hyperinterval::float::F32Enclosure::expanded+0x8f>
   18b83:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   18b89:	8b 46 04             	mov    0x4(%rsi),%eax
   18b8c:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   18b90:	8d 88 00 00 00 80    	lea    -0x80000000(%rax),%ecx
   18b96:	85 c0                	test   %eax,%eax
   18b98:	0f 44 c8             	cmove  %eax,%ecx
   18b9b:	31 c0                	xor    %eax,%eax
   18b9d:	85 c9                	test   %ecx,%ecx
   18b9f:	0f 99 c0             	setns  %al
   18ba2:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
   18ba6:	48 ff c9             	dec    %rcx
   18ba9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18bae:	be 00 00 00 80       	mov    $0x80000000,%esi
   18bb3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18bb8:	e8 63 2f 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   18bbd:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   18bc2:	75 2f                	jne    18bf3 <hyperinterval::float::F32Enclosure::expanded+0x83>
   18bc4:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   18bc9:	31 c0                	xor    %eax,%eax
   18bcb:	45 85 f6             	test   %r14d,%r14d
   18bce:	0f 99 c0             	setns  %al
   18bd1:	49 8d 0c 46          	lea    (%r14,%rax,2),%rcx
   18bd5:	48 ff c9             	dec    %rcx
   18bd8:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18bdd:	be 00 00 00 80       	mov    $0x80000000,%esi
   18be2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18be7:	e8 34 2f 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   18bec:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18bf1:	75 21                	jne    18c14 <hyperinterval::float::F32Enclosure::expanded+0xa4>
   18bf3:	c6 43 04 03          	movb   $0x3,0x4(%rbx)
   18bf7:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18bfd:	eb 06                	jmp    18c05 <hyperinterval::float::F32Enclosure::expanded+0x95>
   18bff:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   18c05:	48 89 d8             	mov    %rbx,%rax
   18c08:	48 83 c4 18          	add    $0x18,%rsp
   18c0c:	5b                   	pop    %rbx
   18c0d:	41 5c                	pop    %r12
   18c0f:	41 5e                	pop    %r14
   18c11:	41 5f                	pop    %r15
   18c13:	c3                   	ret
   18c14:	44 89 e1             	mov    %r12d,%ecx
   18c17:	4c 31 f9             	xor    %r15,%rcx
   18c1a:	4d 85 e4             	test   %r12,%r12
   18c1d:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   18c22:	49 0f 44 cc          	cmove  %r12,%rcx
   18c26:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18c2b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18c30:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18c35:	e8 e6 2e 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   18c3a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18c3f:	74 23                	je     18c64 <hyperinterval::float::F32Enclosure::expanded+0xf4>
   18c41:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   18c46:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18c4b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18c50:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18c55:	4c 89 f1             	mov    %r14,%rcx
   18c58:	e8 c3 2e 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   18c5d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18c62:	75 10                	jne    18c74 <hyperinterval::float::F32Enclosure::expanded+0x104>
   18c64:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   18c69:	88 43 04             	mov    %al,0x4(%rbx)
   18c6c:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18c72:	eb 91                	jmp    18c05 <hyperinterval::float::F32Enclosure::expanded+0x95>
   18c74:	8b 44 24 10          	mov    0x10(%rsp),%eax
   18c78:	44 89 e1             	mov    %r12d,%ecx
   18c7b:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18c81:	89 c2                	mov    %eax,%edx
   18c83:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18c89:	be 00 00 00 80       	mov    $0x80000000,%esi
   18c8e:	29 ce                	sub    %ecx,%esi
   18c90:	44 09 f9             	or     %r15d,%ecx
   18c93:	45 85 e4             	test   %r12d,%r12d
   18c96:	48 0f 49 f1          	cmovns %rcx,%rsi
   18c9a:	89 d1                	mov    %edx,%ecx
   18c9c:	44 09 f9             	or     %r15d,%ecx
   18c9f:	41 29 d7             	sub    %edx,%r15d
   18ca2:	85 c0                	test   %eax,%eax
   18ca4:	4c 0f 49 f9          	cmovns %rcx,%r15
   18ca8:	44 39 fe             	cmp    %r15d,%esi
   18cab:	76 0f                	jbe    18cbc <hyperinterval::float::F32Enclosure::expanded+0x14c>
   18cad:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   18cb1:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18cb7:	e9 49 ff ff ff       	jmp    18c05 <hyperinterval::float::F32Enclosure::expanded+0x95>
   18cbc:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   18cc2:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   18cc6:	89 43 08             	mov    %eax,0x8(%rbx)
   18cc9:	e9 37 ff ff ff       	jmp    18c05 <hyperinterval::float::F32Enclosure::expanded+0x95>
   18cce:	cc                   	int3
   18ccf:	cc                   	int3

hyperinterval::float::F32Enclosure::overlaps:
   18cd0:	31 c0                	xor    %eax,%eax
   18cd2:	83 3f 00             	cmpl   $0x0,(%rdi)
   18cd5:	0f 84 a1 00 00 00    	je     18d7c <hyperinterval::float::F32Enclosure::overlaps+0xac>
   18cdb:	8b 0e                	mov    (%rsi),%ecx
   18cdd:	85 c9                	test   %ecx,%ecx
   18cdf:	0f 84 97 00 00 00    	je     18d7c <hyperinterval::float::F32Enclosure::overlaps+0xac>
   18ce5:	f6 c1 01             	test   $0x1,%cl
   18ce8:	74 4b                	je     18d35 <hyperinterval::float::F32Enclosure::overlaps+0x65>
   18cea:	8b 46 04             	mov    0x4(%rsi),%eax
   18ced:	8b 57 08             	mov    0x8(%rdi),%edx
   18cf0:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18cf6:	41 89 d1             	mov    %edx,%r9d
   18cf9:	45 09 c1             	or     %r8d,%r9d
   18cfc:	41 89 d2             	mov    %edx,%r10d
   18cff:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18d06:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   18d0c:	45 29 d3             	sub    %r10d,%r11d
   18d0f:	85 d2                	test   %edx,%edx
   18d11:	4d 0f 49 d9          	cmovns %r9,%r11
   18d15:	89 c2                	mov    %eax,%edx
   18d17:	44 09 c2             	or     %r8d,%edx
   18d1a:	41 89 c1             	mov    %eax,%r9d
   18d1d:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18d24:	45 29 c8             	sub    %r9d,%r8d
   18d27:	85 c0                	test   %eax,%eax
   18d29:	4c 0f 49 c2          	cmovns %rdx,%r8
   18d2d:	45 39 c3             	cmp    %r8d,%r11d
   18d30:	73 03                	jae    18d35 <hyperinterval::float::F32Enclosure::overlaps+0x65>
   18d32:	31 c0                	xor    %eax,%eax
   18d34:	c3                   	ret
   18d35:	b0 01                	mov    $0x1,%al
   18d37:	f6 c1 01             	test   $0x1,%cl
   18d3a:	74 40                	je     18d7c <hyperinterval::float::F32Enclosure::overlaps+0xac>
   18d3c:	8b 47 04             	mov    0x4(%rdi),%eax
   18d3f:	8b 4e 08             	mov    0x8(%rsi),%ecx
   18d42:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18d47:	89 ce                	mov    %ecx,%esi
   18d49:	09 d6                	or     %edx,%esi
   18d4b:	89 cf                	mov    %ecx,%edi
   18d4d:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18d53:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18d59:	41 29 f8             	sub    %edi,%r8d
   18d5c:	85 c9                	test   %ecx,%ecx
   18d5e:	4c 0f 49 c6          	cmovns %rsi,%r8
   18d62:	89 c1                	mov    %eax,%ecx
   18d64:	09 d1                	or     %edx,%ecx
   18d66:	89 c6                	mov    %eax,%esi
   18d68:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18d6e:	29 f2                	sub    %esi,%edx
   18d70:	85 c0                	test   %eax,%eax
   18d72:	48 0f 49 d1          	cmovns %rcx,%rdx
   18d76:	41 39 d0             	cmp    %edx,%r8d
   18d79:	0f 93 c0             	setae  %al
   18d7c:	c3                   	ret
   18d7d:	cc                   	int3
   18d7e:	cc                   	int3
   18d7f:	cc                   	int3

hyperinterval::float::F32Enclosure::from_bits:
   18d80:	41 57                	push   %r15
   18d82:	41 56                	push   %r14
   18d84:	41 54                	push   %r12
   18d86:	53                   	push   %rbx
   18d87:	48 83 ec 18          	sub    $0x18,%rsp
   18d8b:	49 89 d6             	mov    %rdx,%r14
   18d8e:	48 89 fb             	mov    %rdi,%rbx
   18d91:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   18d97:	89 f1                	mov    %esi,%ecx
   18d99:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18d9e:	be 00 00 00 80       	mov    $0x80000000,%esi
   18da3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18da8:	e8 73 2d 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   18dad:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18db2:	74 23                	je     18dd7 <hyperinterval::float::F32Enclosure::from_bits+0x57>
   18db4:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   18db9:	44 89 f1             	mov    %r14d,%ecx
   18dbc:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18dc1:	be 00 00 00 80       	mov    $0x80000000,%esi
   18dc6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18dcb:	e8 50 2d 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   18dd0:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18dd5:	75 1a                	jne    18df1 <hyperinterval::float::F32Enclosure::from_bits+0x71>
   18dd7:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   18ddc:	88 43 04             	mov    %al,0x4(%rbx)
   18ddf:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18de5:	48 83 c4 18          	add    $0x18,%rsp
   18de9:	5b                   	pop    %rbx
   18dea:	41 5c                	pop    %r12
   18dec:	41 5e                	pop    %r14
   18dee:	41 5f                	pop    %r15
   18df0:	c3                   	ret
   18df1:	8b 44 24 10          	mov    0x10(%rsp),%eax
   18df5:	44 89 e1             	mov    %r12d,%ecx
   18df8:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18dfe:	89 c2                	mov    %eax,%edx
   18e00:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18e06:	be 00 00 00 80       	mov    $0x80000000,%esi
   18e0b:	29 ce                	sub    %ecx,%esi
   18e0d:	44 09 f9             	or     %r15d,%ecx
   18e10:	45 85 e4             	test   %r12d,%r12d
   18e13:	48 0f 49 f1          	cmovns %rcx,%rsi
   18e17:	89 d1                	mov    %edx,%ecx
   18e19:	44 09 f9             	or     %r15d,%ecx
   18e1c:	41 29 d7             	sub    %edx,%r15d
   18e1f:	85 c0                	test   %eax,%eax
   18e21:	4c 0f 49 f9          	cmovns %rcx,%r15
   18e25:	44 39 fe             	cmp    %r15d,%esi
   18e28:	76 06                	jbe    18e30 <hyperinterval::float::F32Enclosure::from_bits+0xb0>
   18e2a:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   18e2e:	eb af                	jmp    18ddf <hyperinterval::float::F32Enclosure::from_bits+0x5f>
   18e30:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   18e36:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   18e3a:	89 43 08             	mov    %eax,0x8(%rbx)
   18e3d:	eb a6                	jmp    18de5 <hyperinterval::float::F32Enclosure::from_bits+0x65>
   18e3f:	cc                   	int3

hyperinterval::float::F32Enclosure::next_down:
   18e40:	53                   	push   %rbx
   18e41:	48 83 ec 10          	sub    $0x10,%rsp
   18e45:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   18e4a:	66 0f 7e c1          	movd   %xmm0,%ecx
   18e4e:	48 89 e7             	mov    %rsp,%rdi
   18e51:	be 00 00 00 80       	mov    $0x80000000,%esi
   18e56:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18e5b:	e8 c0 2c 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   18e60:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18e64:	75 11                	jne    18e77 <hyperinterval::float::F32Enclosure::next_down+0x37>
   18e66:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   18e6b:	c1 e0 08             	shl    $0x8,%eax
   18e6e:	48 ff c0             	inc    %rax
   18e71:	48 83 c4 10          	add    $0x10,%rsp
   18e75:	5b                   	pop    %rbx
   18e76:	c3                   	ret
   18e77:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   18e7c:	48 89 c1             	mov    %rax,%rcx
   18e7f:	48 31 d9             	xor    %rbx,%rcx
   18e82:	48 85 c0             	test   %rax,%rax
   18e85:	48 0f 44 c8          	cmove  %rax,%rcx
   18e89:	31 c0                	xor    %eax,%eax
   18e8b:	85 c9                	test   %ecx,%ecx
   18e8d:	0f 99 c0             	setns  %al
   18e90:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
   18e94:	48 ff c9             	dec    %rcx
   18e97:	48 89 e7             	mov    %rsp,%rdi
   18e9a:	be 00 00 00 80       	mov    $0x80000000,%esi
   18e9f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18ea4:	e8 77 2c 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   18ea9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18ead:	75 0b                	jne    18eba <hyperinterval::float::F32Enclosure::next_down+0x7a>
   18eaf:	b8 01 03 00 00       	mov    $0x301,%eax
   18eb4:	48 83 c4 10          	add    $0x10,%rsp
   18eb8:	5b                   	pop    %rbx
   18eb9:	c3                   	ret
   18eba:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   18ebf:	48 89 c8             	mov    %rcx,%rax
   18ec2:	48 35 00 00 00 80    	xor    $0xffffffff80000000,%rax
   18ec8:	48 c1 e0 20          	shl    $0x20,%rax
   18ecc:	48 85 c9             	test   %rcx,%rcx
   18ecf:	48 0f 44 c1          	cmove  %rcx,%rax
   18ed3:	48 83 c4 10          	add    $0x10,%rsp
   18ed7:	5b                   	pop    %rbx
   18ed8:	c3                   	ret
   18ed9:	cc                   	int3
   18eda:	cc                   	int3
   18edb:	cc                   	int3
   18edc:	cc                   	int3
   18edd:	cc                   	int3
   18ede:	cc                   	int3
   18edf:	cc                   	int3

hyperinterval::float::F32Enclosure::subset_of:
   18ee0:	b0 01                	mov    $0x1,%al
   18ee2:	f6 07 01             	testb  $0x1,(%rdi)
   18ee5:	74 53                	je     18f3a <hyperinterval::float::F32Enclosure::subset_of+0x5a>
   18ee7:	f6 06 01             	testb  $0x1,(%rsi)
   18eea:	74 4c                	je     18f38 <hyperinterval::float::F32Enclosure::subset_of+0x58>
   18eec:	8b 4f 04             	mov    0x4(%rdi),%ecx
   18eef:	8b 56 04             	mov    0x4(%rsi),%edx
   18ef2:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18ef7:	41 89 d0             	mov    %edx,%r8d
   18efa:	41 09 c0             	or     %eax,%r8d
   18efd:	41 89 d1             	mov    %edx,%r9d
   18f00:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18f07:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18f0d:	45 29 ca             	sub    %r9d,%r10d
   18f10:	85 d2                	test   %edx,%edx
   18f12:	4d 0f 49 d0          	cmovns %r8,%r10
   18f16:	89 ca                	mov    %ecx,%edx
   18f18:	09 c2                	or     %eax,%edx
   18f1a:	41 89 c8             	mov    %ecx,%r8d
   18f1d:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18f24:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   18f2a:	45 29 c1             	sub    %r8d,%r9d
   18f2d:	85 c9                	test   %ecx,%ecx
   18f2f:	4c 0f 49 ca          	cmovns %rdx,%r9
   18f33:	45 39 ca             	cmp    %r9d,%r10d
   18f36:	76 03                	jbe    18f3b <hyperinterval::float::F32Enclosure::subset_of+0x5b>
   18f38:	31 c0                	xor    %eax,%eax
   18f3a:	c3                   	ret
   18f3b:	8b 4f 08             	mov    0x8(%rdi),%ecx
   18f3e:	8b 56 08             	mov    0x8(%rsi),%edx
   18f41:	89 ce                	mov    %ecx,%esi
   18f43:	09 c6                	or     %eax,%esi
   18f45:	89 cf                	mov    %ecx,%edi
   18f47:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18f4d:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18f53:	41 29 f8             	sub    %edi,%r8d
   18f56:	85 c9                	test   %ecx,%ecx
   18f58:	4c 0f 49 c6          	cmovns %rsi,%r8
   18f5c:	89 d1                	mov    %edx,%ecx
   18f5e:	09 c1                	or     %eax,%ecx
   18f60:	89 d6                	mov    %edx,%esi
   18f62:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18f68:	29 f0                	sub    %esi,%eax
   18f6a:	85 d2                	test   %edx,%edx
   18f6c:	48 0f 49 c1          	cmovns %rcx,%rax
   18f70:	41 39 c0             	cmp    %eax,%r8d
   18f73:	0f 96 c0             	setbe  %al
   18f76:	c3                   	ret
   18f77:	cc                   	int3
   18f78:	cc                   	int3
   18f79:	cc                   	int3
   18f7a:	cc                   	int3
   18f7b:	cc                   	int3
   18f7c:	cc                   	int3
   18f7d:	cc                   	int3
   18f7e:	cc                   	int3
   18f7f:	cc                   	int3

hyperinterval::float::F64Enclosure::reciprocal:
   18f80:	55                   	push   %rbp
   18f81:	41 57                	push   %r15
   18f83:	41 56                	push   %r14
   18f85:	41 55                	push   %r13
   18f87:	41 54                	push   %r12
   18f89:	53                   	push   %rbx
   18f8a:	48 83 ec 28          	sub    $0x28,%rsp
   18f8e:	48 89 fb             	mov    %rdi,%rbx
   18f91:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   18f95:	74 65                	je     18ffc <hyperinterval::float::F64Enclosure::reciprocal+0x7c>
   18f97:	49 89 f6             	mov    %rsi,%r14
   18f9a:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
   18fa1:	00 00 80 
   18fa4:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   18fab:	00 f0 7f 
   18fae:	49 bd 00 00 00 00 00 	movabs $0x3ff0000000000000,%r13
   18fb5:	00 f0 3f 
   18fb8:	48 89 e7             	mov    %rsp,%rdi
   18fbb:	4c 89 fe             	mov    %r15,%rsi
   18fbe:	4c 89 e2             	mov    %r12,%rdx
   18fc1:	4c 89 e9             	mov    %r13,%rcx
   18fc4:	e8 57 2b 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   18fc9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18fcd:	74 1c                	je     18feb <hyperinterval::float::F64Enclosure::reciprocal+0x6b>
   18fcf:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   18fd4:	48 89 e7             	mov    %rsp,%rdi
   18fd7:	4c 89 fe             	mov    %r15,%rsi
   18fda:	4c 89 e2             	mov    %r12,%rdx
   18fdd:	4c 89 e9             	mov    %r13,%rcx
   18fe0:	e8 3b 2b 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   18fe5:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18fe9:	75 2a                	jne    19015 <hyperinterval::float::F64Enclosure::reciprocal+0x95>
   18feb:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   18ff0:	88 53 08             	mov    %dl,0x8(%rbx)
   18ff3:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   18ffa:	eb 07                	jmp    19003 <hyperinterval::float::F64Enclosure::reciprocal+0x83>
   18ffc:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   19003:	48 89 d8             	mov    %rbx,%rax
   19006:	48 83 c4 28          	add    $0x28,%rsp
   1900a:	5b                   	pop    %rbx
   1900b:	41 5c                	pop    %r12
   1900d:	41 5d                	pop    %r13
   1900f:	41 5e                	pop    %r14
   19011:	41 5f                	pop    %r15
   19013:	5d                   	pop    %rbp
   19014:	c3                   	ret
   19015:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1901a:	48 89 ea             	mov    %rbp,%rdx
   1901d:	4c 09 fa             	or     %r15,%rdx
   19020:	49 8d 47 ff          	lea    -0x1(%r15),%rax
   19024:	48 89 ee             	mov    %rbp,%rsi
   19027:	48 21 c6             	and    %rax,%rsi
   1902a:	4c 89 ff             	mov    %r15,%rdi
   1902d:	48 29 f7             	sub    %rsi,%rdi
   19030:	48 85 ed             	test   %rbp,%rbp
   19033:	48 0f 49 fa          	cmovns %rdx,%rdi
   19037:	48 89 ca             	mov    %rcx,%rdx
   1903a:	4c 09 fa             	or     %r15,%rdx
   1903d:	48 89 ce             	mov    %rcx,%rsi
   19040:	48 21 c6             	and    %rax,%rsi
   19043:	49 29 f7             	sub    %rsi,%r15
   19046:	48 85 c9             	test   %rcx,%rcx
   19049:	4c 0f 49 fa          	cmovns %rdx,%r15
   1904d:	b2 01                	mov    $0x1,%dl
   1904f:	4c 39 ff             	cmp    %r15,%rdi
   19052:	77 9c                	ja     18ff0 <hyperinterval::float::F64Enclosure::reciprocal+0x70>
   19054:	48 c7 44 24 10 01 00 	movq   $0x1,0x10(%rsp)
   1905b:	00 00 
   1905d:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
   19062:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   19067:	49 83 7e 08 00       	cmpq   $0x0,0x8(%r14)
   1906c:	7f 0e                	jg     1907c <hyperinterval::float::F64Enclosure::reciprocal+0xfc>
   1906e:	49 8b 4e 10          	mov    0x10(%r14),%rcx
   19072:	48 85 c9             	test   %rcx,%rcx
   19075:	79 1f                	jns    19096 <hyperinterval::float::F64Enclosure::reciprocal+0x116>
   19077:	48 21 c1             	and    %rax,%rcx
   1907a:	74 1a                	je     19096 <hyperinterval::float::F64Enclosure::reciprocal+0x116>
   1907c:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
   19081:	48 89 df             	mov    %rbx,%rdi
   19084:	4c 89 f2             	mov    %r14,%rdx
   19087:	b9 01 00 00 00       	mov    $0x1,%ecx
   1908c:	e8 9f 02 00 00       	call   19330 <hyperinterval::float::F64Enclosure::corner_image>
   19091:	e9 6d ff ff ff       	jmp    19003 <hyperinterval::float::F64Enclosure::reciprocal+0x83>
   19096:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
   1909a:	e9 54 ff ff ff       	jmp    18ff3 <hyperinterval::float::F64Enclosure::reciprocal+0x73>
   1909f:	cc                   	int3

hyperinterval::float::F64Enclosure::checked_pow:
   190a0:	55                   	push   %rbp
   190a1:	41 57                	push   %r15
   190a3:	41 56                	push   %r14
   190a5:	41 55                	push   %r13
   190a7:	41 54                	push   %r12
   190a9:	53                   	push   %rbx
   190aa:	48 83 ec 48          	sub    $0x48,%rsp
   190ae:	48 89 fb             	mov    %rdi,%rbx
   190b1:	83 fa 02             	cmp    $0x2,%edx
   190b4:	75 0e                	jne    190c4 <hyperinterval::float::F64Enclosure::checked_pow+0x24>
   190b6:	48 89 df             	mov    %rbx,%rdi
   190b9:	ff 15 71 4c 04 00    	call   *0x44c71(%rip)        # 5dd30 <_DYNAMIC+0x2f0>
   190bf:	e9 e0 00 00 00       	jmp    191a4 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
   190c4:	f6 06 01             	testb  $0x1,(%rsi)
   190c7:	0f 84 d0 00 00 00    	je     1919d <hyperinterval::float::F64Enclosure::checked_pow+0xfd>
   190cd:	89 d5                	mov    %edx,%ebp
   190cf:	4c 8b 76 10          	mov    0x10(%rsi),%r14
   190d3:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
   190da:	00 00 80 
   190dd:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   190e4:	00 f0 7f 
   190e7:	4c 8b 7e 08          	mov    0x8(%rsi),%r15
   190eb:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   190f0:	4c 89 e6             	mov    %r12,%rsi
   190f3:	4c 89 ea             	mov    %r13,%rdx
   190f6:	4c 89 f9             	mov    %r15,%rcx
   190f9:	41 89 e8             	mov    %ebp,%r8d
   190fc:	e8 2f 22 00 00       	call   1b330 <hyperinterval::ieee::Format::power>
   19101:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19106:	0f 85 80 00 00 00    	jne    1918c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   1910c:	4c 89 f1             	mov    %r14,%rcx
   1910f:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   19114:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   19119:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1911e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19123:	4c 89 e6             	mov    %r12,%rsi
   19126:	4c 89 ea             	mov    %r13,%rdx
   19129:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
   1912e:	41 89 e8             	mov    %ebp,%r8d
   19131:	e8 fa 21 00 00       	call   1b330 <hyperinterval::ieee::Format::power>
   19136:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1913b:	74 4f                	je     1918c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   1913d:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   19142:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   19147:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1914c:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   19151:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19156:	4c 89 e6             	mov    %r12,%rsi
   19159:	4c 89 ea             	mov    %r13,%rdx
   1915c:	4c 89 f1             	mov    %r14,%rcx
   1915f:	e8 bc 29 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   19164:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19169:	74 21                	je     1918c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   1916b:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   19170:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19175:	4c 89 e6             	mov    %r12,%rsi
   19178:	4c 89 ea             	mov    %r13,%rdx
   1917b:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   19180:	e8 9b 29 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   19185:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1918a:	75 2a                	jne    191b6 <hyperinterval::float::F64Enclosure::checked_pow+0x116>
   1918c:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   19191:	88 43 08             	mov    %al,0x8(%rbx)
   19194:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1919b:	eb 07                	jmp    191a4 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
   1919d:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   191a4:	48 89 d8             	mov    %rbx,%rax
   191a7:	48 83 c4 48          	add    $0x48,%rsp
   191ab:	5b                   	pop    %rbx
   191ac:	41 5c                	pop    %r12
   191ae:	41 5d                	pop    %r13
   191b0:	41 5e                	pop    %r14
   191b2:	41 5f                	pop    %r15
   191b4:	5d                   	pop    %rbp
   191b5:	c3                   	ret
   191b6:	4c 89 f0             	mov    %r14,%rax
   191b9:	4c 09 e0             	or     %r12,%rax
   191bc:	4c 89 f6             	mov    %r14,%rsi
   191bf:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
   191c4:	48 89 f1             	mov    %rsi,%rcx
   191c7:	4c 21 f1             	and    %r14,%rcx
   191ca:	4c 89 e2             	mov    %r12,%rdx
   191cd:	48 29 ca             	sub    %rcx,%rdx
   191d0:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
   191d5:	48 85 f6             	test   %rsi,%rsi
   191d8:	48 0f 49 d0          	cmovns %rax,%rdx
   191dc:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
   191e1:	48 89 f8             	mov    %rdi,%rax
   191e4:	4c 09 e0             	or     %r12,%rax
   191e7:	48 89 f9             	mov    %rdi,%rcx
   191ea:	4c 21 f1             	and    %r14,%rcx
   191ed:	4c 89 e6             	mov    %r12,%rsi
   191f0:	48 29 ce             	sub    %rcx,%rsi
   191f3:	48 85 ff             	test   %rdi,%rdi
   191f6:	48 0f 49 f0          	cmovns %rax,%rsi
   191fa:	b0 01                	mov    $0x1,%al
   191fc:	48 39 f2             	cmp    %rsi,%rdx
   191ff:	77 90                	ja     19191 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
   19201:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
   19206:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1920b:	4c 89 e6             	mov    %r12,%rsi
   1920e:	4c 89 ea             	mov    %r13,%rdx
   19211:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   19216:	e8 05 29 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1921b:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19220:	0f 84 66 ff ff ff    	je     1918c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   19226:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1922b:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   19230:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19235:	4c 89 e6             	mov    %r12,%rsi
   19238:	4c 89 ea             	mov    %r13,%rdx
   1923b:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   19240:	e8 db 28 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   19245:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1924a:	0f 84 3c ff ff ff    	je     1918c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   19250:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   19255:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
   1925a:	48 89 d0             	mov    %rdx,%rax
   1925d:	4c 09 e0             	or     %r12,%rax
   19260:	48 89 d7             	mov    %rdx,%rdi
   19263:	4c 21 f7             	and    %r14,%rdi
   19266:	4c 89 e6             	mov    %r12,%rsi
   19269:	48 29 fe             	sub    %rdi,%rsi
   1926c:	48 85 d2             	test   %rdx,%rdx
   1926f:	48 0f 49 f0          	cmovns %rax,%rsi
   19273:	48 89 c8             	mov    %rcx,%rax
   19276:	4c 09 e0             	or     %r12,%rax
   19279:	49 21 ce             	and    %rcx,%r14
   1927c:	4d 29 f4             	sub    %r14,%r12
   1927f:	48 85 c9             	test   %rcx,%rcx
   19282:	4c 0f 49 e0          	cmovns %rax,%r12
   19286:	b0 01                	mov    $0x1,%al
   19288:	4c 39 e6             	cmp    %r12,%rsi
   1928b:	0f 87 00 ff ff ff    	ja     19191 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
   19291:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   19296:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   1929b:	e8 60 2c 00 00       	call   1bf00 <hyperinterval::bounds::Bounds<T>::hull>
   192a0:	49 89 c5             	mov    %rax,%r13
   192a3:	49 89 d4             	mov    %rdx,%r12
   192a6:	85 ed                	test   %ebp,%ebp
   192a8:	0f 95 c0             	setne  %al
   192ab:	40 f6 c5 01          	test   $0x1,%bpl
   192af:	0f 94 c1             	sete   %cl
   192b2:	84 c8                	test   %cl,%al
   192b4:	74 13                	je     192c9 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
   192b6:	4c 89 ff             	mov    %r15,%rdi
   192b9:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
   192be:	31 d2                	xor    %edx,%edx
   192c0:	e8 cb 2c 00 00       	call   1bf90 <hyperinterval::bounds::Bounds<T>::signs>
   192c5:	a8 02                	test   $0x2,%al
   192c7:	75 14                	jne    192dd <hyperinterval::float::F64Enclosure::checked_pow+0x23d>
   192c9:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   192d0:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   192d4:	4c 89 63 10          	mov    %r12,0x10(%rbx)
   192d8:	e9 c7 fe ff ff       	jmp    191a4 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
   192dd:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   192e2:	31 f6                	xor    %esi,%esi
   192e4:	31 d2                	xor    %edx,%edx
   192e6:	e8 65 16 00 00       	call   1a950 <hyperinterval::float::F64Enclosure::from_bits>
   192eb:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   192f0:	48 83 f8 02          	cmp    $0x2,%rax
   192f4:	75 0a                	jne    19300 <hyperinterval::float::F64Enclosure::checked_pow+0x260>
   192f6:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   192fb:	e9 91 fe ff ff       	jmp    19191 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
   19300:	83 f8 01             	cmp    $0x1,%eax
   19303:	75 c4                	jne    192c9 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
   19305:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   1930a:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1930f:	4c 89 ef             	mov    %r13,%rdi
   19312:	4c 89 e6             	mov    %r12,%rsi
   19315:	e8 e6 2b 00 00       	call   1bf00 <hyperinterval::bounds::Bounds<T>::hull>
   1931a:	49 89 c5             	mov    %rax,%r13
   1931d:	49 89 d4             	mov    %rdx,%r12
   19320:	eb a7                	jmp    192c9 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
   19322:	cc                   	int3
   19323:	cc                   	int3
   19324:	cc                   	int3
   19325:	cc                   	int3
   19326:	cc                   	int3
   19327:	cc                   	int3
   19328:	cc                   	int3
   19329:	cc                   	int3
   1932a:	cc                   	int3
   1932b:	cc                   	int3
   1932c:	cc                   	int3
   1932d:	cc                   	int3
   1932e:	cc                   	int3
   1932f:	cc                   	int3

hyperinterval::float::F64Enclosure::corner_image:
   19330:	55                   	push   %rbp
   19331:	41 57                	push   %r15
   19333:	41 56                	push   %r14
   19335:	41 55                	push   %r13
   19337:	41 54                	push   %r12
   19339:	53                   	push   %rbx
   1933a:	48 83 ec 68          	sub    $0x68,%rsp
   1933e:	48 89 fb             	mov    %rdi,%rbx
   19341:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   19345:	75 5f                	jne    193a6 <hyperinterval::float::F64Enclosure::corner_image+0x76>
   19347:	f6 02 01             	testb  $0x1,(%rdx)
   1934a:	74 5a                	je     193a6 <hyperinterval::float::F64Enclosure::corner_image+0x76>
   1934c:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   19353:	00 00 80 
   19356:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1935d:	00 f0 7f 
   19360:	4c 8b 66 08          	mov    0x8(%rsi),%r12
   19364:	48 8b 46 10          	mov    0x10(%rsi),%rax
   19368:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1936d:	48 8b 6a 08          	mov    0x8(%rdx),%rbp
   19371:	48 8b 42 10          	mov    0x10(%rdx),%rax
   19375:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1937a:	84 c9                	test   %cl,%cl
   1937c:	74 34                	je     193b2 <hyperinterval::float::F64Enclosure::corner_image+0x82>
   1937e:	48 89 e7             	mov    %rsp,%rdi
   19381:	4c 89 f6             	mov    %r14,%rsi
   19384:	4c 89 fa             	mov    %r15,%rdx
   19387:	4c 89 e1             	mov    %r12,%rcx
   1938a:	49 89 e8             	mov    %rbp,%r8
   1938d:	e8 8e 1a 00 00       	call   1ae20 <hyperinterval::ieee::Format::div>
   19392:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19396:	0f 84 c3 00 00 00    	je     1945f <hyperinterval::float::F64Enclosure::corner_image+0x12f>
   1939c:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   193a1:	e9 b1 00 00 00       	jmp    19457 <hyperinterval::float::F64Enclosure::corner_image+0x127>
   193a6:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   193ad:	e9 84 03 00 00       	jmp    19736 <hyperinterval::float::F64Enclosure::corner_image+0x406>
   193b2:	4c 89 e1             	mov    %r12,%rcx
   193b5:	48 c1 e9 34          	shr    $0x34,%rcx
   193b9:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   193bf:	48 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%rdx
   193c6:	ff 0f 00 
   193c9:	4c 89 e7             	mov    %r12,%rdi
   193cc:	48 21 d7             	and    %rdx,%rdi
   193cf:	48 8d 42 01          	lea    0x1(%rdx),%rax
   193d3:	44 8d 81 9a f7 ff ff 	lea    -0x866(%rcx),%r8d
   193da:	48 85 c9             	test   %rcx,%rcx
   193dd:	48 0f 45 c8          	cmovne %rax,%rcx
   193e1:	be 9b f7 ff ff       	mov    $0xfffff79b,%esi
   193e6:	41 0f 45 f0          	cmovne %r8d,%esi
   193ea:	48 09 f9             	or     %rdi,%rcx
   193ed:	48 89 ef             	mov    %rbp,%rdi
   193f0:	48 c1 ef 34          	shr    $0x34,%rdi
   193f4:	81 e7 ff 07 00 00    	and    $0x7ff,%edi
   193fa:	48 21 ea             	and    %rbp,%rdx
   193fd:	48 85 ff             	test   %rdi,%rdi
   19400:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   19406:	44 0f 45 c7          	cmovne %edi,%r8d
   1940a:	48 0f 44 c7          	cmove  %rdi,%rax
   1940e:	48 09 d0             	or     %rdx,%rax
   19411:	48 89 ef             	mov    %rbp,%rdi
   19414:	4c 31 e7             	xor    %r12,%rdi
   19417:	48 f7 e1             	mul    %rcx
   1941a:	41 01 f0             	add    %esi,%r8d
   1941d:	48 c1 ef 3f          	shr    $0x3f,%rdi
   19421:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
   19426:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1942b:	48 89 04 24          	mov    %rax,(%rsp)
   1942f:	44 89 44 24 10       	mov    %r8d,0x10(%rsp)
   19434:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   19439:	48 89 e1             	mov    %rsp,%rcx
   1943c:	4c 89 f6             	mov    %r14,%rsi
   1943f:	4c 89 fa             	mov    %r15,%rdx
   19442:	e8 19 27 00 00       	call   1bb60 <hyperinterval::ieee::Format::rounded>
   19447:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1944c:	0f 84 99 02 00 00    	je     196eb <hyperinterval::float::F64Enclosure::corner_image+0x3bb>
   19452:	0f b6 44 24 41       	movzbl 0x41(%rsp),%eax
   19457:	88 43 08             	mov    %al,0x8(%rbx)
   1945a:	e9 d0 02 00 00       	jmp    1972f <hyperinterval::float::F64Enclosure::corner_image+0x3ff>
   1945f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19464:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   19469:	48 89 e7             	mov    %rsp,%rdi
   1946c:	4c 89 f6             	mov    %r14,%rsi
   1946f:	4c 89 fa             	mov    %r15,%rdx
   19472:	e8 a9 26 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   19477:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1947b:	0f 85 a4 02 00 00    	jne    19725 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19481:	4c 89 fa             	mov    %r15,%rdx
   19484:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   19489:	48 89 e7             	mov    %rsp,%rdi
   1948c:	4c 89 f6             	mov    %r14,%rsi
   1948f:	4c 89 e9             	mov    %r13,%rcx
   19492:	e8 89 26 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   19497:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1949b:	0f 85 84 02 00 00    	jne    19725 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   194a1:	4c 89 f8             	mov    %r15,%rax
   194a4:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   194ab:	00 00 80 
   194ae:	4c 09 f0             	or     %r14,%rax
   194b1:	49 8d 76 ff          	lea    -0x1(%r14),%rsi
   194b5:	4c 89 f9             	mov    %r15,%rcx
   194b8:	48 21 f1             	and    %rsi,%rcx
   194bb:	4c 89 f2             	mov    %r14,%rdx
   194be:	48 29 ca             	sub    %rcx,%rdx
   194c1:	4d 85 ff             	test   %r15,%r15
   194c4:	48 0f 49 d0          	cmovns %rax,%rdx
   194c8:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   194cd:	48 89 f8             	mov    %rdi,%rax
   194d0:	4c 09 f0             	or     %r14,%rax
   194d3:	48 89 f9             	mov    %rdi,%rcx
   194d6:	48 21 f1             	and    %rsi,%rcx
   194d9:	4c 89 f6             	mov    %r14,%rsi
   194dc:	48 29 ce             	sub    %rcx,%rsi
   194df:	48 85 ff             	test   %rdi,%rdi
   194e2:	48 0f 49 f0          	cmovns %rax,%rsi
   194e6:	41 b5 01             	mov    $0x1,%r13b
   194e9:	48 39 f2             	cmp    %rsi,%rdx
   194ec:	0f 87 39 02 00 00    	ja     1972b <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   194f2:	48 89 7c 24 38       	mov    %rdi,0x38(%rsp)
   194f7:	4c 89 7c 24 28       	mov    %r15,0x28(%rsp)
   194fc:	48 89 e7             	mov    %rsp,%rdi
   194ff:	4c 89 f6             	mov    %r14,%rsi
   19502:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   19509:	00 f0 7f 
   1950c:	4c 89 fa             	mov    %r15,%rdx
   1950f:	4c 89 e1             	mov    %r12,%rcx
   19512:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   19517:	e8 04 19 00 00       	call   1ae20 <hyperinterval::ieee::Format::div>
   1951c:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19520:	0f 85 76 fe ff ff    	jne    1939c <hyperinterval::float::F64Enclosure::corner_image+0x6c>
   19526:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1952b:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   19530:	48 89 e7             	mov    %rsp,%rdi
   19533:	4c 89 f6             	mov    %r14,%rsi
   19536:	4c 89 fa             	mov    %r15,%rdx
   19539:	e8 e2 25 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1953e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19542:	0f 85 dd 01 00 00    	jne    19725 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19548:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1954d:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   19552:	48 89 e7             	mov    %rsp,%rdi
   19555:	4c 89 f6             	mov    %r14,%rsi
   19558:	4c 89 fa             	mov    %r15,%rdx
   1955b:	4c 89 e1             	mov    %r12,%rcx
   1955e:	e8 bd 25 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   19563:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19567:	0f 85 b8 01 00 00    	jne    19725 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1956d:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19572:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
   19577:	48 89 d0             	mov    %rdx,%rax
   1957a:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   19581:	00 00 80 
   19584:	4c 09 f0             	or     %r14,%rax
   19587:	49 89 d0             	mov    %rdx,%r8
   1958a:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   1958e:	49 21 f8             	and    %rdi,%r8
   19591:	4c 89 f6             	mov    %r14,%rsi
   19594:	4c 29 c6             	sub    %r8,%rsi
   19597:	48 85 d2             	test   %rdx,%rdx
   1959a:	48 0f 49 f0          	cmovns %rax,%rsi
   1959e:	48 89 c8             	mov    %rcx,%rax
   195a1:	4c 09 f0             	or     %r14,%rax
   195a4:	49 89 c8             	mov    %rcx,%r8
   195a7:	49 21 f8             	and    %rdi,%r8
   195aa:	4c 89 f7             	mov    %r14,%rdi
   195ad:	4c 29 c7             	sub    %r8,%rdi
   195b0:	48 85 c9             	test   %rcx,%rcx
   195b3:	48 0f 49 f8          	cmovns %rax,%rdi
   195b7:	48 39 fe             	cmp    %rdi,%rsi
   195ba:	0f 87 6b 01 00 00    	ja     1972b <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   195c0:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   195c5:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
   195ca:	e8 31 29 00 00       	call   1bf00 <hyperinterval::bounds::Bounds<T>::hull>
   195cf:	49 89 c4             	mov    %rax,%r12
   195d2:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   195d7:	48 89 e7             	mov    %rsp,%rdi
   195da:	4c 89 f6             	mov    %r14,%rsi
   195dd:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   195e4:	00 f0 7f 
   195e7:	4c 89 fa             	mov    %r15,%rdx
   195ea:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   195ef:	49 89 e8             	mov    %rbp,%r8
   195f2:	e8 29 18 00 00       	call   1ae20 <hyperinterval::ieee::Format::div>
   195f7:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   195fb:	0f 85 9b fd ff ff    	jne    1939c <hyperinterval::float::F64Enclosure::corner_image+0x6c>
   19601:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19606:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1960b:	48 89 e7             	mov    %rsp,%rdi
   1960e:	4c 89 f6             	mov    %r14,%rsi
   19611:	4c 89 fa             	mov    %r15,%rdx
   19614:	e8 07 25 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   19619:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1961d:	0f 85 02 01 00 00    	jne    19725 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19623:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19628:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1962d:	48 89 e7             	mov    %rsp,%rdi
   19630:	4c 89 f6             	mov    %r14,%rsi
   19633:	4c 89 fa             	mov    %r15,%rdx
   19636:	48 89 e9             	mov    %rbp,%rcx
   19639:	e8 e2 24 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1963e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19642:	0f 85 dd 00 00 00    	jne    19725 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19648:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1964d:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
   19652:	48 89 d0             	mov    %rdx,%rax
   19655:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1965c:	00 00 80 
   1965f:	4c 09 f0             	or     %r14,%rax
   19662:	49 89 d0             	mov    %rdx,%r8
   19665:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   19669:	49 21 f8             	and    %rdi,%r8
   1966c:	4c 89 f6             	mov    %r14,%rsi
   1966f:	4c 29 c6             	sub    %r8,%rsi
   19672:	48 85 d2             	test   %rdx,%rdx
   19675:	48 0f 49 f0          	cmovns %rax,%rsi
   19679:	48 89 c8             	mov    %rcx,%rax
   1967c:	4c 09 f0             	or     %r14,%rax
   1967f:	49 89 c8             	mov    %rcx,%r8
   19682:	49 21 f8             	and    %rdi,%r8
   19685:	4c 89 f7             	mov    %r14,%rdi
   19688:	4c 29 c7             	sub    %r8,%rdi
   1968b:	48 85 c9             	test   %rcx,%rcx
   1968e:	48 0f 49 f8          	cmovns %rax,%rdi
   19692:	48 39 fe             	cmp    %rdi,%rsi
   19695:	0f 87 90 00 00 00    	ja     1972b <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   1969b:	4c 89 e7             	mov    %r12,%rdi
   1969e:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   196a3:	e8 58 28 00 00       	call   1bf00 <hyperinterval::bounds::Bounds<T>::hull>
   196a8:	49 89 c4             	mov    %rax,%r12
   196ab:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   196b0:	48 89 e7             	mov    %rsp,%rdi
   196b3:	4c 89 f6             	mov    %r14,%rsi
   196b6:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   196bd:	00 f0 7f 
   196c0:	4c 89 fa             	mov    %r15,%rdx
   196c3:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   196c8:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   196cd:	e8 4e 17 00 00       	call   1ae20 <hyperinterval::ieee::Format::div>
   196d2:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   196d6:	0f 85 c0 fc ff ff    	jne    1939c <hyperinterval::float::F64Enclosure::corner_image+0x6c>
   196dc:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   196e1:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   196e6:	e9 ae 02 00 00       	jmp    19999 <hyperinterval::float::F64Enclosure::corner_image+0x669>
   196eb:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   196f0:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
   196f5:	48 89 e7             	mov    %rsp,%rdi
   196f8:	4c 89 f6             	mov    %r14,%rsi
   196fb:	4c 89 fa             	mov    %r15,%rdx
   196fe:	e8 1d 24 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   19703:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19707:	74 1c                	je     19725 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19709:	4c 89 f6             	mov    %r14,%rsi
   1970c:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   19711:	48 89 e7             	mov    %rsp,%rdi
   19714:	4c 89 fa             	mov    %r15,%rdx
   19717:	4c 89 e9             	mov    %r13,%rcx
   1971a:	e8 01 24 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1971f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19723:	75 20                	jne    19745 <hyperinterval::float::F64Enclosure::corner_image+0x415>
   19725:	44 0f b6 6c 24 01    	movzbl 0x1(%rsp),%r13d
   1972b:	44 88 6b 08          	mov    %r13b,0x8(%rbx)
   1972f:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   19736:	48 83 c4 68          	add    $0x68,%rsp
   1973a:	5b                   	pop    %rbx
   1973b:	41 5c                	pop    %r12
   1973d:	41 5d                	pop    %r13
   1973f:	41 5e                	pop    %r14
   19741:	41 5f                	pop    %r15
   19743:	5d                   	pop    %rbp
   19744:	c3                   	ret
   19745:	4c 89 f0             	mov    %r14,%rax
   19748:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   1974f:	00 00 80 
   19752:	48 09 f8             	or     %rdi,%rax
   19755:	48 8d 77 ff          	lea    -0x1(%rdi),%rsi
   19759:	4c 89 f1             	mov    %r14,%rcx
   1975c:	48 21 f1             	and    %rsi,%rcx
   1975f:	48 89 fa             	mov    %rdi,%rdx
   19762:	48 29 ca             	sub    %rcx,%rdx
   19765:	4d 85 f6             	test   %r14,%r14
   19768:	48 0f 49 d0          	cmovns %rax,%rdx
   1976c:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
   19771:	4c 89 c0             	mov    %r8,%rax
   19774:	48 09 f8             	or     %rdi,%rax
   19777:	4c 89 c1             	mov    %r8,%rcx
   1977a:	48 21 f1             	and    %rsi,%rcx
   1977d:	48 89 fe             	mov    %rdi,%rsi
   19780:	48 29 ce             	sub    %rcx,%rsi
   19783:	4d 85 c0             	test   %r8,%r8
   19786:	48 0f 49 f0          	cmovns %rax,%rsi
   1978a:	41 b5 01             	mov    $0x1,%r13b
   1978d:	48 39 f2             	cmp    %rsi,%rdx
   19790:	77 99                	ja     1972b <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   19792:	4c 89 44 24 38       	mov    %r8,0x38(%rsp)
   19797:	4c 89 74 24 28       	mov    %r14,0x28(%rsp)
   1979c:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   197a1:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   197a8:	00 00 80 
   197ab:	4c 89 f6             	mov    %r14,%rsi
   197ae:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   197b5:	00 f0 7f 
   197b8:	4c 89 fa             	mov    %r15,%rdx
   197bb:	4c 89 e1             	mov    %r12,%rcx
   197be:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   197c3:	e8 98 1a 00 00       	call   1b260 <hyperinterval::ieee::Format::mul>
   197c8:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   197cd:	0f 85 7f fc ff ff    	jne    19452 <hyperinterval::float::F64Enclosure::corner_image+0x122>
   197d3:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   197d8:	4c 8b 64 24 50       	mov    0x50(%rsp),%r12
   197dd:	48 89 e7             	mov    %rsp,%rdi
   197e0:	4c 89 f6             	mov    %r14,%rsi
   197e3:	4c 89 fa             	mov    %r15,%rdx
   197e6:	e8 35 23 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   197eb:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   197ef:	0f 85 30 ff ff ff    	jne    19725 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   197f5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   197fa:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   197ff:	48 89 e7             	mov    %rsp,%rdi
   19802:	4c 89 f6             	mov    %r14,%rsi
   19805:	4c 89 fa             	mov    %r15,%rdx
   19808:	4c 89 e1             	mov    %r12,%rcx
   1980b:	e8 10 23 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   19810:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19814:	0f 85 0b ff ff ff    	jne    19725 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1981a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1981f:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
   19824:	48 89 d0             	mov    %rdx,%rax
   19827:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1982e:	00 00 80 
   19831:	4c 09 f0             	or     %r14,%rax
   19834:	49 89 d0             	mov    %rdx,%r8
   19837:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   1983b:	49 21 f8             	and    %rdi,%r8
   1983e:	4c 89 f6             	mov    %r14,%rsi
   19841:	4c 29 c6             	sub    %r8,%rsi
   19844:	48 85 d2             	test   %rdx,%rdx
   19847:	48 0f 49 f0          	cmovns %rax,%rsi
   1984b:	48 89 c8             	mov    %rcx,%rax
   1984e:	4c 09 f0             	or     %r14,%rax
   19851:	49 89 c8             	mov    %rcx,%r8
   19854:	49 21 f8             	and    %rdi,%r8
   19857:	4c 89 f7             	mov    %r14,%rdi
   1985a:	4c 29 c7             	sub    %r8,%rdi
   1985d:	48 85 c9             	test   %rcx,%rcx
   19860:	48 0f 49 f8          	cmovns %rax,%rdi
   19864:	48 39 fe             	cmp    %rdi,%rsi
   19867:	0f 87 be fe ff ff    	ja     1972b <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   1986d:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   19872:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
   19877:	e8 84 26 00 00       	call   1bf00 <hyperinterval::bounds::Bounds<T>::hull>
   1987c:	49 89 c4             	mov    %rax,%r12
   1987f:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   19884:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   19889:	4c 89 f6             	mov    %r14,%rsi
   1988c:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   19893:	00 f0 7f 
   19896:	4c 89 fa             	mov    %r15,%rdx
   19899:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1989e:	49 89 e8             	mov    %rbp,%r8
   198a1:	e8 ba 19 00 00       	call   1b260 <hyperinterval::ieee::Format::mul>
   198a6:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   198ab:	0f 85 a1 fb ff ff    	jne    19452 <hyperinterval::float::F64Enclosure::corner_image+0x122>
   198b1:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   198b6:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
   198bb:	48 89 e7             	mov    %rsp,%rdi
   198be:	4c 89 f6             	mov    %r14,%rsi
   198c1:	4c 89 fa             	mov    %r15,%rdx
   198c4:	e8 57 22 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   198c9:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   198cd:	0f 85 52 fe ff ff    	jne    19725 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   198d3:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   198d8:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   198dd:	48 89 e7             	mov    %rsp,%rdi
   198e0:	4c 89 f6             	mov    %r14,%rsi
   198e3:	4c 89 fa             	mov    %r15,%rdx
   198e6:	48 89 e9             	mov    %rbp,%rcx
   198e9:	e8 32 22 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   198ee:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   198f2:	0f 85 2d fe ff ff    	jne    19725 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   198f8:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   198fd:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
   19902:	48 89 d0             	mov    %rdx,%rax
   19905:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1990c:	00 00 80 
   1990f:	4c 09 f0             	or     %r14,%rax
   19912:	49 89 d0             	mov    %rdx,%r8
   19915:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   19919:	49 21 f8             	and    %rdi,%r8
   1991c:	4c 89 f6             	mov    %r14,%rsi
   1991f:	4c 29 c6             	sub    %r8,%rsi
   19922:	48 85 d2             	test   %rdx,%rdx
   19925:	48 0f 49 f0          	cmovns %rax,%rsi
   19929:	48 89 c8             	mov    %rcx,%rax
   1992c:	4c 09 f0             	or     %r14,%rax
   1992f:	49 89 c8             	mov    %rcx,%r8
   19932:	49 21 f8             	and    %rdi,%r8
   19935:	4c 89 f7             	mov    %r14,%rdi
   19938:	4c 29 c7             	sub    %r8,%rdi
   1993b:	48 85 c9             	test   %rcx,%rcx
   1993e:	48 0f 49 f8          	cmovns %rax,%rdi
   19942:	48 39 fe             	cmp    %rdi,%rsi
   19945:	0f 87 e0 fd ff ff    	ja     1972b <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   1994b:	4c 89 e7             	mov    %r12,%rdi
   1994e:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   19953:	e8 a8 25 00 00       	call   1bf00 <hyperinterval::bounds::Bounds<T>::hull>
   19958:	49 89 c4             	mov    %rax,%r12
   1995b:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   19960:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   19965:	4c 89 f6             	mov    %r14,%rsi
   19968:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1996f:	00 f0 7f 
   19972:	4c 89 fa             	mov    %r15,%rdx
   19975:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1997a:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1997f:	e8 dc 18 00 00       	call   1b260 <hyperinterval::ieee::Format::mul>
   19984:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   19989:	0f 85 c3 fa ff ff    	jne    19452 <hyperinterval::float::F64Enclosure::corner_image+0x122>
   1998f:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   19994:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
   19999:	48 89 e7             	mov    %rsp,%rdi
   1999c:	4c 89 f6             	mov    %r14,%rsi
   1999f:	4c 89 fa             	mov    %r15,%rdx
   199a2:	e8 79 21 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   199a7:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   199ab:	0f 85 74 fd ff ff    	jne    19725 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   199b1:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   199b6:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   199bb:	48 89 e7             	mov    %rsp,%rdi
   199be:	4c 89 f6             	mov    %r14,%rsi
   199c1:	4c 89 fa             	mov    %r15,%rdx
   199c4:	48 89 e9             	mov    %rbp,%rcx
   199c7:	e8 54 21 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   199cc:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   199d0:	0f 85 4f fd ff ff    	jne    19725 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   199d6:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   199db:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
   199e0:	4c 89 c8             	mov    %r9,%rax
   199e3:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   199ea:	00 00 80 
   199ed:	4c 09 c0             	or     %r8,%rax
   199f0:	4c 89 ca             	mov    %r9,%rdx
   199f3:	49 8d 78 ff          	lea    -0x1(%r8),%rdi
   199f7:	48 21 fa             	and    %rdi,%rdx
   199fa:	4c 89 c6             	mov    %r8,%rsi
   199fd:	48 29 d6             	sub    %rdx,%rsi
   19a00:	4d 85 c9             	test   %r9,%r9
   19a03:	48 0f 49 f0          	cmovns %rax,%rsi
   19a07:	48 89 c8             	mov    %rcx,%rax
   19a0a:	4c 09 c0             	or     %r8,%rax
   19a0d:	48 21 cf             	and    %rcx,%rdi
   19a10:	49 29 f8             	sub    %rdi,%r8
   19a13:	48 85 c9             	test   %rcx,%rcx
   19a16:	4c 0f 49 c0          	cmovns %rax,%r8
   19a1a:	4c 39 c6             	cmp    %r8,%rsi
   19a1d:	0f 87 08 fd ff ff    	ja     1972b <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   19a23:	4c 89 e7             	mov    %r12,%rdi
   19a26:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   19a2b:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
   19a30:	e8 cb 24 00 00       	call   1bf00 <hyperinterval::bounds::Bounds<T>::hull>
   19a35:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   19a3c:	48 89 43 08          	mov    %rax,0x8(%rbx)
   19a40:	48 89 53 10          	mov    %rdx,0x10(%rbx)
   19a44:	e9 ed fc ff ff       	jmp    19736 <hyperinterval::float::F64Enclosure::corner_image+0x406>
   19a49:	cc                   	int3
   19a4a:	cc                   	int3
   19a4b:	cc                   	int3
   19a4c:	cc                   	int3
   19a4d:	cc                   	int3
   19a4e:	cc                   	int3
   19a4f:	cc                   	int3

hyperinterval::float::F64Enclosure::intersection:
   19a50:	48 89 f8             	mov    %rdi,%rax
   19a53:	45 31 c9             	xor    %r9d,%r9d
   19a56:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   19a5a:	0f 85 e1 00 00 00    	jne    19b41 <hyperinterval::float::F64Enclosure::intersection+0xf1>
   19a60:	f6 02 01             	testb  $0x1,(%rdx)
   19a63:	0f 84 cc 00 00 00    	je     19b35 <hyperinterval::float::F64Enclosure::intersection+0xe5>
   19a69:	41 56                	push   %r14
   19a6b:	53                   	push   %rbx
   19a6c:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   19a70:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   19a74:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   19a7b:	00 00 80 
   19a7e:	49 89 ca             	mov    %rcx,%r10
   19a81:	49 09 fa             	or     %rdi,%r10
   19a84:	4c 8d 4f ff          	lea    -0x1(%rdi),%r9
   19a88:	49 89 cb             	mov    %rcx,%r11
   19a8b:	4d 21 cb             	and    %r9,%r11
   19a8e:	48 89 fb             	mov    %rdi,%rbx
   19a91:	4c 29 db             	sub    %r11,%rbx
   19a94:	48 85 c9             	test   %rcx,%rcx
   19a97:	49 0f 49 da          	cmovns %r10,%rbx
   19a9b:	4d 89 c2             	mov    %r8,%r10
   19a9e:	49 09 fa             	or     %rdi,%r10
   19aa1:	4d 89 c3             	mov    %r8,%r11
   19aa4:	4d 21 cb             	and    %r9,%r11
   19aa7:	49 89 fe             	mov    %rdi,%r14
   19aaa:	4d 29 de             	sub    %r11,%r14
   19aad:	4d 85 c0             	test   %r8,%r8
   19ab0:	4d 0f 49 f2          	cmovns %r10,%r14
   19ab4:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   19ab8:	4c 39 f3             	cmp    %r14,%rbx
   19abb:	49 0f 42 c8          	cmovb  %r8,%rcx
   19abf:	4c 8b 46 10          	mov    0x10(%rsi),%r8
   19ac3:	4c 89 c6             	mov    %r8,%rsi
   19ac6:	48 09 fe             	or     %rdi,%rsi
   19ac9:	4d 89 c2             	mov    %r8,%r10
   19acc:	4d 21 ca             	and    %r9,%r10
   19acf:	49 89 fb             	mov    %rdi,%r11
   19ad2:	4d 29 d3             	sub    %r10,%r11
   19ad5:	4d 85 c0             	test   %r8,%r8
   19ad8:	4c 0f 49 de          	cmovns %rsi,%r11
   19adc:	48 89 d6             	mov    %rdx,%rsi
   19adf:	48 09 fe             	or     %rdi,%rsi
   19ae2:	49 89 d2             	mov    %rdx,%r10
   19ae5:	4d 21 ca             	and    %r9,%r10
   19ae8:	48 89 fb             	mov    %rdi,%rbx
   19aeb:	4c 29 d3             	sub    %r10,%rbx
   19aee:	48 85 d2             	test   %rdx,%rdx
   19af1:	48 0f 49 de          	cmovns %rsi,%rbx
   19af5:	49 39 db             	cmp    %rbx,%r11
   19af8:	4c 0f 47 c2          	cmova  %rdx,%r8
   19afc:	48 89 ca             	mov    %rcx,%rdx
   19aff:	48 09 fa             	or     %rdi,%rdx
   19b02:	48 89 ce             	mov    %rcx,%rsi
   19b05:	4c 21 ce             	and    %r9,%rsi
   19b08:	49 89 fa             	mov    %rdi,%r10
   19b0b:	49 29 f2             	sub    %rsi,%r10
   19b0e:	48 85 c9             	test   %rcx,%rcx
   19b11:	4c 0f 49 d2          	cmovns %rdx,%r10
   19b15:	4c 89 c2             	mov    %r8,%rdx
   19b18:	48 09 fa             	or     %rdi,%rdx
   19b1b:	4d 21 c1             	and    %r8,%r9
   19b1e:	4c 29 cf             	sub    %r9,%rdi
   19b21:	4d 85 c0             	test   %r8,%r8
   19b24:	48 0f 49 fa          	cmovns %rdx,%rdi
   19b28:	45 31 c9             	xor    %r9d,%r9d
   19b2b:	49 39 fa             	cmp    %rdi,%r10
   19b2e:	41 0f 96 c1          	setbe  %r9b
   19b32:	5b                   	pop    %rbx
   19b33:	41 5e                	pop    %r14
   19b35:	4c 89 08             	mov    %r9,(%rax)
   19b38:	48 89 48 08          	mov    %rcx,0x8(%rax)
   19b3c:	4c 89 40 10          	mov    %r8,0x10(%rax)
   19b40:	c3                   	ret
   19b41:	4c 89 08             	mov    %r9,(%rax)
   19b44:	48 89 48 08          	mov    %rcx,0x8(%rax)
   19b48:	4c 89 40 10          	mov    %r8,0x10(%rax)
   19b4c:	c3                   	ret
   19b4d:	cc                   	int3
   19b4e:	cc                   	int3
   19b4f:	cc                   	int3

hyperinterval::float::F64Enclosure::contains_point:
   19b50:	41 56                	push   %r14
   19b52:	53                   	push   %rbx
   19b53:	48 83 ec 18          	sub    $0x18,%rsp
   19b57:	49 89 fe             	mov    %rdi,%r14
   19b5a:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   19b61:	00 00 80 
   19b64:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   19b69:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19b6e:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   19b75:	00 f0 7f 
   19b78:	48 89 de             	mov    %rbx,%rsi
   19b7b:	e8 a0 1f 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   19b80:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   19b85:	3c 01                	cmp    $0x1,%al
   19b87:	75 0d                	jne    19b96 <hyperinterval::float::F64Enclosure::contains_point+0x46>
   19b89:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   19b8e:	48 83 c4 18          	add    $0x18,%rsp
   19b92:	5b                   	pop    %rbx
   19b93:	41 5e                	pop    %r14
   19b95:	c3                   	ret
   19b96:	49 83 3e 01          	cmpq   $0x1,(%r14)
   19b9a:	75 44                	jne    19be0 <hyperinterval::float::F64Enclosure::contains_point+0x90>
   19b9c:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   19ba1:	49 8b 56 08          	mov    0x8(%r14),%rdx
   19ba5:	48 89 d7             	mov    %rdx,%rdi
   19ba8:	48 09 df             	or     %rbx,%rdi
   19bab:	48 8d 4b ff          	lea    -0x1(%rbx),%rcx
   19baf:	49 89 d0             	mov    %rdx,%r8
   19bb2:	49 21 c8             	and    %rcx,%r8
   19bb5:	49 89 d9             	mov    %rbx,%r9
   19bb8:	4d 29 c1             	sub    %r8,%r9
   19bbb:	48 85 d2             	test   %rdx,%rdx
   19bbe:	4c 0f 49 cf          	cmovns %rdi,%r9
   19bc2:	48 89 f7             	mov    %rsi,%rdi
   19bc5:	48 09 df             	or     %rbx,%rdi
   19bc8:	49 89 f0             	mov    %rsi,%r8
   19bcb:	49 21 c8             	and    %rcx,%r8
   19bce:	48 89 da             	mov    %rbx,%rdx
   19bd1:	4c 29 c2             	sub    %r8,%rdx
   19bd4:	48 85 f6             	test   %rsi,%rsi
   19bd7:	48 0f 49 d7          	cmovns %rdi,%rdx
   19bdb:	49 39 d1             	cmp    %rdx,%r9
   19bde:	76 0a                	jbe    19bea <hyperinterval::float::F64Enclosure::contains_point+0x9a>
   19be0:	31 d2                	xor    %edx,%edx
   19be2:	48 83 c4 18          	add    $0x18,%rsp
   19be6:	5b                   	pop    %rbx
   19be7:	41 5e                	pop    %r14
   19be9:	c3                   	ret
   19bea:	49 8b 76 10          	mov    0x10(%r14),%rsi
   19bee:	48 89 f7             	mov    %rsi,%rdi
   19bf1:	48 09 df             	or     %rbx,%rdi
   19bf4:	48 21 f1             	and    %rsi,%rcx
   19bf7:	48 29 cb             	sub    %rcx,%rbx
   19bfa:	48 85 f6             	test   %rsi,%rsi
   19bfd:	48 0f 49 df          	cmovns %rdi,%rbx
   19c01:	48 39 da             	cmp    %rbx,%rdx
   19c04:	0f 96 c2             	setbe  %dl
   19c07:	48 83 c4 18          	add    $0x18,%rsp
   19c0b:	5b                   	pop    %rbx
   19c0c:	41 5e                	pop    %r14
   19c0e:	c3                   	ret
   19c0f:	cc                   	int3

hyperinterval::float::F64Enclosure::interior_subset_of:
   19c10:	b0 01                	mov    $0x1,%al
   19c12:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   19c16:	0f 85 93 00 00 00    	jne    19caf <hyperinterval::float::F64Enclosure::interior_subset_of+0x9f>
   19c1c:	f6 06 01             	testb  $0x1,(%rsi)
   19c1f:	0f 84 88 00 00 00    	je     19cad <hyperinterval::float::F64Enclosure::interior_subset_of+0x9d>
   19c25:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   19c29:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   19c2d:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   19c34:	00 00 80 
   19c37:	4d 89 c1             	mov    %r8,%r9
   19c3a:	49 09 c1             	or     %rax,%r9
   19c3d:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   19c41:	4d 89 c2             	mov    %r8,%r10
   19c44:	49 21 ca             	and    %rcx,%r10
   19c47:	49 89 c3             	mov    %rax,%r11
   19c4a:	4d 29 d3             	sub    %r10,%r11
   19c4d:	4d 85 c0             	test   %r8,%r8
   19c50:	4d 0f 49 d9          	cmovns %r9,%r11
   19c54:	49 89 d0             	mov    %rdx,%r8
   19c57:	49 09 c0             	or     %rax,%r8
   19c5a:	49 89 d1             	mov    %rdx,%r9
   19c5d:	49 21 c9             	and    %rcx,%r9
   19c60:	49 89 c2             	mov    %rax,%r10
   19c63:	4d 29 ca             	sub    %r9,%r10
   19c66:	48 85 d2             	test   %rdx,%rdx
   19c69:	4d 0f 49 d0          	cmovns %r8,%r10
   19c6d:	4d 39 d3             	cmp    %r10,%r11
   19c70:	73 3b                	jae    19cad <hyperinterval::float::F64Enclosure::interior_subset_of+0x9d>
   19c72:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   19c76:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   19c7a:	48 89 d7             	mov    %rdx,%rdi
   19c7d:	48 09 c7             	or     %rax,%rdi
   19c80:	49 89 d0             	mov    %rdx,%r8
   19c83:	49 21 c8             	and    %rcx,%r8
   19c86:	49 89 c1             	mov    %rax,%r9
   19c89:	4d 29 c1             	sub    %r8,%r9
   19c8c:	48 85 d2             	test   %rdx,%rdx
   19c8f:	4c 0f 49 cf          	cmovns %rdi,%r9
   19c93:	48 89 f2             	mov    %rsi,%rdx
   19c96:	48 09 c2             	or     %rax,%rdx
   19c99:	48 21 f1             	and    %rsi,%rcx
   19c9c:	48 29 c8             	sub    %rcx,%rax
   19c9f:	48 85 f6             	test   %rsi,%rsi
   19ca2:	48 0f 49 c2          	cmovns %rdx,%rax
   19ca6:	49 39 c1             	cmp    %rax,%r9
   19ca9:	0f 92 c0             	setb   %al
   19cac:	c3                   	ret
   19cad:	31 c0                	xor    %eax,%eax
   19caf:	c3                   	ret

hyperinterval::float::F64Enclosure::add:
   19cb0:	48 89 f8             	mov    %rdi,%rax
   19cb3:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   19cb7:	0f 85 cb 00 00 00    	jne    19d88 <hyperinterval::float::F64Enclosure::add+0xd8>
   19cbd:	f6 02 01             	testb  $0x1,(%rdx)
   19cc0:	0f 84 c2 00 00 00    	je     19d88 <hyperinterval::float::F64Enclosure::add+0xd8>
   19cc6:	55                   	push   %rbp
   19cc7:	41 57                	push   %r15
   19cc9:	41 56                	push   %r14
   19ccb:	41 55                	push   %r13
   19ccd:	41 54                	push   %r12
   19ccf:	53                   	push   %rbx
   19cd0:	48 83 ec 18          	sub    $0x18,%rsp
   19cd4:	48 89 c5             	mov    %rax,%rbp
   19cd7:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   19cdb:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   19cdf:	4c 8b 62 10          	mov    0x10(%rdx),%r12
   19ce3:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   19cea:	00 00 80 
   19ced:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   19cf4:	00 f0 7f 
   19cf7:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   19cfb:	48 89 e7             	mov    %rsp,%rdi
   19cfe:	48 89 de             	mov    %rbx,%rsi
   19d01:	4c 89 f2             	mov    %r14,%rdx
   19d04:	e8 67 0e 00 00       	call   1ab70 <hyperinterval::ieee::Format::add>
   19d09:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19d0d:	74 57                	je     19d66 <hyperinterval::float::F64Enclosure::add+0xb6>
   19d0f:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   19d14:	48 89 e7             	mov    %rsp,%rdi
   19d17:	48 89 de             	mov    %rbx,%rsi
   19d1a:	4c 89 f2             	mov    %r14,%rdx
   19d1d:	4c 89 f9             	mov    %r15,%rcx
   19d20:	4d 89 e0             	mov    %r12,%r8
   19d23:	e8 48 0e 00 00       	call   1ab70 <hyperinterval::ieee::Format::add>
   19d28:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19d2c:	74 38                	je     19d66 <hyperinterval::float::F64Enclosure::add+0xb6>
   19d2e:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   19d33:	48 89 e7             	mov    %rsp,%rdi
   19d36:	48 89 de             	mov    %rbx,%rsi
   19d39:	4c 89 f2             	mov    %r14,%rdx
   19d3c:	4c 89 e9             	mov    %r13,%rcx
   19d3f:	e8 dc 1d 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   19d44:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19d48:	74 1c                	je     19d66 <hyperinterval::float::F64Enclosure::add+0xb6>
   19d4a:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   19d4f:	48 89 e7             	mov    %rsp,%rdi
   19d52:	48 89 de             	mov    %rbx,%rsi
   19d55:	4c 89 f2             	mov    %r14,%rdx
   19d58:	4c 89 f9             	mov    %r15,%rcx
   19d5b:	e8 c0 1d 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   19d60:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19d64:	75 2a                	jne    19d90 <hyperinterval::float::F64Enclosure::add+0xe0>
   19d66:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   19d6b:	48 89 e8             	mov    %rbp,%rax
   19d6e:	88 4d 08             	mov    %cl,0x8(%rbp)
   19d71:	48 c7 45 00 02 00 00 	movq   $0x2,0x0(%rbp)
   19d78:	00 
   19d79:	48 83 c4 18          	add    $0x18,%rsp
   19d7d:	5b                   	pop    %rbx
   19d7e:	41 5c                	pop    %r12
   19d80:	41 5d                	pop    %r13
   19d82:	41 5e                	pop    %r14
   19d84:	41 5f                	pop    %r15
   19d86:	5d                   	pop    %rbp
   19d87:	c3                   	ret
   19d88:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   19d8f:	c3                   	ret
   19d90:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19d95:	4c 89 e0             	mov    %r12,%rax
   19d98:	48 09 d8             	or     %rbx,%rax
   19d9b:	48 8d 53 ff          	lea    -0x1(%rbx),%rdx
   19d9f:	4c 89 e6             	mov    %r12,%rsi
   19da2:	48 21 d6             	and    %rdx,%rsi
   19da5:	48 89 df             	mov    %rbx,%rdi
   19da8:	48 29 f7             	sub    %rsi,%rdi
   19dab:	4d 85 e4             	test   %r12,%r12
   19dae:	48 0f 49 f8          	cmovns %rax,%rdi
   19db2:	48 89 c8             	mov    %rcx,%rax
   19db5:	48 09 d8             	or     %rbx,%rax
   19db8:	48 21 ca             	and    %rcx,%rdx
   19dbb:	48 29 d3             	sub    %rdx,%rbx
   19dbe:	48 85 c9             	test   %rcx,%rcx
   19dc1:	48 0f 49 d8          	cmovns %rax,%rbx
   19dc5:	48 39 df             	cmp    %rbx,%rdi
   19dc8:	48 89 e8             	mov    %rbp,%rax
   19dcb:	76 0d                	jbe    19dda <hyperinterval::float::F64Enclosure::add+0x12a>
   19dcd:	c6 40 08 01          	movb   $0x1,0x8(%rax)
   19dd1:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   19dd8:	eb 9f                	jmp    19d79 <hyperinterval::float::F64Enclosure::add+0xc9>
   19dda:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   19de1:	4c 89 60 08          	mov    %r12,0x8(%rax)
   19de5:	48 89 48 10          	mov    %rcx,0x10(%rax)
   19de9:	eb 8e                	jmp    19d79 <hyperinterval::float::F64Enclosure::add+0xc9>
   19deb:	cc                   	int3
   19dec:	cc                   	int3
   19ded:	cc                   	int3
   19dee:	cc                   	int3
   19def:	cc                   	int3

hyperinterval::float::F64Enclosure::div:
   19df0:	53                   	push   %rbx
   19df1:	48 89 fb             	mov    %rdi,%rbx
   19df4:	83 3a 01             	cmpl   $0x1,(%rdx)
   19df7:	75 1e                	jne    19e17 <hyperinterval::float::F64Enclosure::div+0x27>
   19df9:	48 83 7a 08 00       	cmpq   $0x0,0x8(%rdx)
   19dfe:	7f 17                	jg     19e17 <hyperinterval::float::F64Enclosure::div+0x27>
   19e00:	48 8b 42 10          	mov    0x10(%rdx),%rax
   19e04:	48 85 c0             	test   %rax,%rax
   19e07:	0f 99 c1             	setns  %cl
   19e0a:	48 d1 e0             	shl    $1,%rax
   19e0d:	48 85 c0             	test   %rax,%rax
   19e10:	0f 94 c0             	sete   %al
   19e13:	08 c8                	or     %cl,%al
   19e15:	75 12                	jne    19e29 <hyperinterval::float::F64Enclosure::div+0x39>
   19e17:	48 89 df             	mov    %rbx,%rdi
   19e1a:	b9 01 00 00 00       	mov    $0x1,%ecx
   19e1f:	e8 0c f5 ff ff       	call   19330 <hyperinterval::float::F64Enclosure::corner_image>
   19e24:	48 89 d8             	mov    %rbx,%rax
   19e27:	5b                   	pop    %rbx
   19e28:	c3                   	ret
   19e29:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
   19e2d:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   19e34:	48 89 d8             	mov    %rbx,%rax
   19e37:	5b                   	pop    %rbx
   19e38:	c3                   	ret
   19e39:	cc                   	int3
   19e3a:	cc                   	int3
   19e3b:	cc                   	int3
   19e3c:	cc                   	int3
   19e3d:	cc                   	int3
   19e3e:	cc                   	int3
   19e3f:	cc                   	int3

hyperinterval::float::F64Enclosure::new:
   19e40:	41 57                	push   %r15
   19e42:	41 56                	push   %r14
   19e44:	41 54                	push   %r12
   19e46:	53                   	push   %rbx
   19e47:	48 83 ec 18          	sub    $0x18,%rsp
   19e4b:	f2 0f 11 4c 24 10    	movsd  %xmm1,0x10(%rsp)
   19e51:	48 89 fb             	mov    %rdi,%rbx
   19e54:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   19e5b:	00 00 80 
   19e5e:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   19e65:	00 f0 7f 
   19e68:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   19e6d:	48 89 e7             	mov    %rsp,%rdi
   19e70:	4c 89 f6             	mov    %r14,%rsi
   19e73:	4c 89 fa             	mov    %r15,%rdx
   19e76:	e8 a5 1c 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   19e7b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19e7f:	74 24                	je     19ea5 <hyperinterval::float::F64Enclosure::new+0x65>
   19e81:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   19e86:	f3 0f 7e 44 24 10    	movq   0x10(%rsp),%xmm0
   19e8c:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   19e91:	48 89 e7             	mov    %rsp,%rdi
   19e94:	4c 89 f6             	mov    %r14,%rsi
   19e97:	4c 89 fa             	mov    %r15,%rdx
   19e9a:	e8 81 1c 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   19e9f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19ea3:	75 1e                	jne    19ec3 <hyperinterval::float::F64Enclosure::new+0x83>
   19ea5:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   19eaa:	88 43 08             	mov    %al,0x8(%rbx)
   19ead:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   19eb4:	48 89 d8             	mov    %rbx,%rax
   19eb7:	48 83 c4 18          	add    $0x18,%rsp
   19ebb:	5b                   	pop    %rbx
   19ebc:	41 5c                	pop    %r12
   19ebe:	41 5e                	pop    %r14
   19ec0:	41 5f                	pop    %r15
   19ec2:	c3                   	ret
   19ec3:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19ec8:	4c 89 e1             	mov    %r12,%rcx
   19ecb:	4c 09 f1             	or     %r14,%rcx
   19ece:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   19ed2:	4c 89 e6             	mov    %r12,%rsi
   19ed5:	48 21 d6             	and    %rdx,%rsi
   19ed8:	4c 89 f7             	mov    %r14,%rdi
   19edb:	48 29 f7             	sub    %rsi,%rdi
   19ede:	4d 85 e4             	test   %r12,%r12
   19ee1:	48 0f 49 f9          	cmovns %rcx,%rdi
   19ee5:	48 89 c1             	mov    %rax,%rcx
   19ee8:	4c 09 f1             	or     %r14,%rcx
   19eeb:	48 21 c2             	and    %rax,%rdx
   19eee:	49 29 d6             	sub    %rdx,%r14
   19ef1:	48 85 c0             	test   %rax,%rax
   19ef4:	4c 0f 49 f1          	cmovns %rcx,%r14
   19ef8:	4c 39 f7             	cmp    %r14,%rdi
   19efb:	76 06                	jbe    19f03 <hyperinterval::float::F64Enclosure::new+0xc3>
   19efd:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   19f01:	eb aa                	jmp    19ead <hyperinterval::float::F64Enclosure::new+0x6d>
   19f03:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   19f0a:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   19f0e:	48 89 43 10          	mov    %rax,0x10(%rbx)
   19f12:	eb a0                	jmp    19eb4 <hyperinterval::float::F64Enclosure::new+0x74>
   19f14:	cc                   	int3
   19f15:	cc                   	int3
   19f16:	cc                   	int3
   19f17:	cc                   	int3
   19f18:	cc                   	int3
   19f19:	cc                   	int3
   19f1a:	cc                   	int3
   19f1b:	cc                   	int3
   19f1c:	cc                   	int3
   19f1d:	cc                   	int3
   19f1e:	cc                   	int3
   19f1f:	cc                   	int3

hyperinterval::float::F64Enclosure::sub:
   19f20:	53                   	push   %rbx
   19f21:	48 83 ec 20          	sub    $0x20,%rsp
   19f25:	48 89 fb             	mov    %rdi,%rbx
   19f28:	48 83 3a 01          	cmpq   $0x1,(%rdx)
   19f2c:	75 30                	jne    19f5e <hyperinterval::float::F64Enclosure::sub+0x3e>
   19f2e:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   19f32:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   19f36:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   19f3d:	00 00 80 
   19f40:	48 89 d1             	mov    %rdx,%rcx
   19f43:	48 31 c1             	xor    %rax,%rcx
   19f46:	48 85 d2             	test   %rdx,%rdx
   19f49:	48 0f 44 ca          	cmove  %rdx,%rcx
   19f4d:	48 31 f8             	xor    %rdi,%rax
   19f50:	48 85 ff             	test   %rdi,%rdi
   19f53:	48 0f 44 c7          	cmove  %rdi,%rax
   19f57:	ba 01 00 00 00       	mov    $0x1,%edx
   19f5c:	eb 02                	jmp    19f60 <hyperinterval::float::F64Enclosure::sub+0x40>
   19f5e:	31 d2                	xor    %edx,%edx
   19f60:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   19f65:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
   19f6a:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   19f6f:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
   19f74:	48 89 df             	mov    %rbx,%rdi
   19f77:	ff 15 c3 3d 04 00    	call   *0x43dc3(%rip)        # 5dd40 <_DYNAMIC+0x300>
   19f7d:	48 89 d8             	mov    %rbx,%rax
   19f80:	48 83 c4 20          	add    $0x20,%rsp
   19f84:	5b                   	pop    %rbx
   19f85:	c3                   	ret
   19f86:	cc                   	int3
   19f87:	cc                   	int3
   19f88:	cc                   	int3
   19f89:	cc                   	int3
   19f8a:	cc                   	int3
   19f8b:	cc                   	int3
   19f8c:	cc                   	int3
   19f8d:	cc                   	int3
   19f8e:	cc                   	int3
   19f8f:	cc                   	int3

hyperinterval::float::F64Enclosure::hull:
   19f90:	48 89 f8             	mov    %rdi,%rax
   19f93:	4c 8b 02             	mov    (%rdx),%r8
   19f96:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   19f9a:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
   19f9e:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   19fa2:	0f 85 a7 00 00 00    	jne    1a04f <hyperinterval::float::F64Enclosure::hull+0xbf>
   19fa8:	4c 8b 56 08          	mov    0x8(%rsi),%r10
   19fac:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   19fb0:	ba 01 00 00 00       	mov    $0x1,%edx
   19fb5:	49 83 f8 01          	cmp    $0x1,%r8
   19fb9:	0f 85 9f 00 00 00    	jne    1a05e <hyperinterval::float::F64Enclosure::hull+0xce>
   19fbf:	41 57                	push   %r15
   19fc1:	41 56                	push   %r14
   19fc3:	53                   	push   %rbx
   19fc4:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   19fcb:	00 00 80 
   19fce:	4d 89 d3             	mov    %r10,%r11
   19fd1:	4d 09 c3             	or     %r8,%r11
   19fd4:	4d 8d 48 ff          	lea    -0x1(%r8),%r9
   19fd8:	4c 89 d3             	mov    %r10,%rbx
   19fdb:	4c 21 cb             	and    %r9,%rbx
   19fde:	4d 89 c6             	mov    %r8,%r14
   19fe1:	49 29 de             	sub    %rbx,%r14
   19fe4:	4d 85 d2             	test   %r10,%r10
   19fe7:	4d 0f 49 f3          	cmovns %r11,%r14
   19feb:	49 89 fb             	mov    %rdi,%r11
   19fee:	4d 09 c3             	or     %r8,%r11
   19ff1:	48 89 fb             	mov    %rdi,%rbx
   19ff4:	4c 21 cb             	and    %r9,%rbx
   19ff7:	4d 89 c7             	mov    %r8,%r15
   19ffa:	49 29 df             	sub    %rbx,%r15
   19ffd:	48 85 ff             	test   %rdi,%rdi
   1a000:	4d 0f 49 fb          	cmovns %r11,%r15
   1a004:	4d 39 fe             	cmp    %r15,%r14
   1a007:	49 0f 46 fa          	cmovbe %r10,%rdi
   1a00b:	49 89 f2             	mov    %rsi,%r10
   1a00e:	4d 09 c2             	or     %r8,%r10
   1a011:	49 89 f3             	mov    %rsi,%r11
   1a014:	4d 21 cb             	and    %r9,%r11
   1a017:	4c 89 c3             	mov    %r8,%rbx
   1a01a:	4c 29 db             	sub    %r11,%rbx
   1a01d:	48 85 f6             	test   %rsi,%rsi
   1a020:	49 0f 49 da          	cmovns %r10,%rbx
   1a024:	49 89 ca             	mov    %rcx,%r10
   1a027:	4d 09 c2             	or     %r8,%r10
   1a02a:	49 21 c9             	and    %rcx,%r9
   1a02d:	4d 29 c8             	sub    %r9,%r8
   1a030:	48 85 c9             	test   %rcx,%rcx
   1a033:	4d 0f 49 c2          	cmovns %r10,%r8
   1a037:	4c 39 c3             	cmp    %r8,%rbx
   1a03a:	48 0f 43 ce          	cmovae %rsi,%rcx
   1a03e:	5b                   	pop    %rbx
   1a03f:	41 5e                	pop    %r14
   1a041:	41 5f                	pop    %r15
   1a043:	48 89 10             	mov    %rdx,(%rax)
   1a046:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1a04a:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1a04e:	c3                   	ret
   1a04f:	4c 89 c2             	mov    %r8,%rdx
   1a052:	48 89 10             	mov    %rdx,(%rax)
   1a055:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1a059:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1a05d:	c3                   	ret
   1a05e:	48 89 f1             	mov    %rsi,%rcx
   1a061:	4c 89 d7             	mov    %r10,%rdi
   1a064:	48 89 10             	mov    %rdx,(%rax)
   1a067:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1a06b:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1a06f:	c3                   	ret

hyperinterval::float::F64Enclosure::point:
   1a070:	53                   	push   %rbx
   1a071:	48 83 ec 10          	sub    $0x10,%rsp
   1a075:	48 89 fb             	mov    %rdi,%rbx
   1a078:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1a07d:	48 89 e7             	mov    %rsp,%rdi
   1a080:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1a087:	00 00 80 
   1a08a:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1a091:	00 f0 7f 
   1a094:	e8 87 1a 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1a099:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a09d:	75 0f                	jne    1a0ae <hyperinterval::float::F64Enclosure::point+0x3e>
   1a09f:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a0a4:	88 43 08             	mov    %al,0x8(%rbx)
   1a0a7:	b8 02 00 00 00       	mov    $0x2,%eax
   1a0ac:	eb 12                	jmp    1a0c0 <hyperinterval::float::F64Enclosure::point+0x50>
   1a0ae:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a0b3:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1a0b7:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1a0bb:	b8 01 00 00 00       	mov    $0x1,%eax
   1a0c0:	48 89 03             	mov    %rax,(%rbx)
   1a0c3:	48 89 d8             	mov    %rbx,%rax
   1a0c6:	48 83 c4 10          	add    $0x10,%rsp
   1a0ca:	5b                   	pop    %rbx
   1a0cb:	c3                   	ret
   1a0cc:	cc                   	int3
   1a0cd:	cc                   	int3
   1a0ce:	cc                   	int3
   1a0cf:	cc                   	int3

hyperinterval::float::F64Enclosure::signs:
   1a0d0:	83 3f 01             	cmpl   $0x1,(%rdi)
   1a0d3:	75 6b                	jne    1a140 <hyperinterval::float::F64Enclosure::signs+0x70>
   1a0d5:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1a0dc:	00 00 80 
   1a0df:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   1a0e3:	48 8b 47 10          	mov    0x10(%rdi),%rax
   1a0e7:	48 89 ca             	mov    %rcx,%rdx
   1a0ea:	4c 09 c2             	or     %r8,%rdx
   1a0ed:	49 8d 70 ff          	lea    -0x1(%r8),%rsi
   1a0f1:	49 89 c9             	mov    %rcx,%r9
   1a0f4:	49 21 f1             	and    %rsi,%r9
   1a0f7:	4c 89 c7             	mov    %r8,%rdi
   1a0fa:	4c 29 cf             	sub    %r9,%rdi
   1a0fd:	48 85 c9             	test   %rcx,%rcx
   1a100:	48 0f 49 fa          	cmovns %rdx,%rdi
   1a104:	31 d2                	xor    %edx,%edx
   1a106:	48 85 ff             	test   %rdi,%rdi
   1a109:	0f 99 c1             	setns  %cl
   1a10c:	4c 39 c7             	cmp    %r8,%rdi
   1a10f:	77 1f                	ja     1a130 <hyperinterval::float::F64Enclosure::signs+0x60>
   1a111:	48 85 ff             	test   %rdi,%rdi
   1a114:	40 0f 99 c7          	setns  %dil
   1a118:	40 80 cf 02          	or     $0x2,%dil
   1a11c:	48 85 f0             	test   %rsi,%rax
   1a11f:	88 ca                	mov    %cl,%dl
   1a121:	40 0f b6 cf          	movzbl %dil,%ecx
   1a125:	0f 44 d1             	cmove  %ecx,%edx
   1a128:	48 85 c0             	test   %rax,%rax
   1a12b:	0f 49 d1             	cmovns %ecx,%edx
   1a12e:	89 d1                	mov    %edx,%ecx
   1a130:	8d 51 04             	lea    0x4(%rcx),%edx
   1a133:	48 85 c0             	test   %rax,%rax
   1a136:	0f b6 c9             	movzbl %cl,%ecx
   1a139:	0f b6 c2             	movzbl %dl,%eax
   1a13c:	0f 4e c1             	cmovle %ecx,%eax
   1a13f:	c3                   	ret
   1a140:	31 c0                	xor    %eax,%eax
   1a142:	c3                   	ret
   1a143:	cc                   	int3
   1a144:	cc                   	int3
   1a145:	cc                   	int3
   1a146:	cc                   	int3
   1a147:	cc                   	int3
   1a148:	cc                   	int3
   1a149:	cc                   	int3
   1a14a:	cc                   	int3
   1a14b:	cc                   	int3
   1a14c:	cc                   	int3
   1a14d:	cc                   	int3
   1a14e:	cc                   	int3
   1a14f:	cc                   	int3

hyperinterval::float::F64Enclosure::affine:
   1a150:	55                   	push   %rbp
   1a151:	41 57                	push   %r15
   1a153:	41 56                	push   %r14
   1a155:	41 55                	push   %r13
   1a157:	41 54                	push   %r12
   1a159:	53                   	push   %rbx
   1a15a:	48 83 ec 28          	sub    $0x28,%rsp
   1a15e:	f2 0f 11 4c 24 18    	movsd  %xmm1,0x18(%rsp)
   1a164:	49 89 f5             	mov    %rsi,%r13
   1a167:	48 89 fb             	mov    %rdi,%rbx
   1a16a:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a171:	00 00 80 
   1a174:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a17b:	00 f0 7f 
   1a17e:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1a183:	48 89 e7             	mov    %rsp,%rdi
   1a186:	4c 89 f6             	mov    %r14,%rsi
   1a189:	4c 89 fa             	mov    %r15,%rdx
   1a18c:	e8 8f 19 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1a191:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a195:	74 24                	je     1a1bb <hyperinterval::float::F64Enclosure::affine+0x6b>
   1a197:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1a19c:	f3 0f 7e 44 24 18    	movq   0x18(%rsp),%xmm0
   1a1a2:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1a1a7:	48 89 e7             	mov    %rsp,%rdi
   1a1aa:	4c 89 f6             	mov    %r14,%rsi
   1a1ad:	4c 89 fa             	mov    %r15,%rdx
   1a1b0:	e8 6b 19 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1a1b5:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a1b9:	75 21                	jne    1a1dc <hyperinterval::float::F64Enclosure::affine+0x8c>
   1a1bb:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a1c0:	88 43 08             	mov    %al,0x8(%rbx)
   1a1c3:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a1ca:	48 89 d8             	mov    %rbx,%rax
   1a1cd:	48 83 c4 28          	add    $0x28,%rsp
   1a1d1:	5b                   	pop    %rbx
   1a1d2:	41 5c                	pop    %r12
   1a1d4:	41 5d                	pop    %r13
   1a1d6:	41 5e                	pop    %r14
   1a1d8:	41 5f                	pop    %r15
   1a1da:	5d                   	pop    %rbp
   1a1db:	c3                   	ret
   1a1dc:	41 f6 45 00 01       	testb  $0x1,0x0(%r13)
   1a1e1:	0f 84 0a 01 00 00    	je     1a2f1 <hyperinterval::float::F64Enclosure::affine+0x1a1>
   1a1e7:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1a1ec:	49 8b 45 10          	mov    0x10(%r13),%rax
   1a1f0:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1a1f5:	49 8b 4d 08          	mov    0x8(%r13),%rcx
   1a1f9:	48 89 e7             	mov    %rsp,%rdi
   1a1fc:	4c 89 f6             	mov    %r14,%rsi
   1a1ff:	4c 89 fa             	mov    %r15,%rdx
   1a202:	4d 89 e0             	mov    %r12,%r8
   1a205:	49 89 e9             	mov    %rbp,%r9
   1a208:	e8 23 15 00 00       	call   1b730 <hyperinterval::ieee::Format::affine>
   1a20d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a211:	74 a8                	je     1a1bb <hyperinterval::float::F64Enclosure::affine+0x6b>
   1a213:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1a218:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1a21d:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1a222:	48 89 e7             	mov    %rsp,%rdi
   1a225:	4c 89 f6             	mov    %r14,%rsi
   1a228:	4c 89 fa             	mov    %r15,%rdx
   1a22b:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1a230:	4d 89 e0             	mov    %r12,%r8
   1a233:	49 89 e9             	mov    %rbp,%r9
   1a236:	e8 f5 14 00 00       	call   1b730 <hyperinterval::ieee::Format::affine>
   1a23b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a23f:	0f 84 76 ff ff ff    	je     1a1bb <hyperinterval::float::F64Enclosure::affine+0x6b>
   1a245:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1a24a:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1a24f:	48 89 e7             	mov    %rsp,%rdi
   1a252:	4c 89 f6             	mov    %r14,%rsi
   1a255:	4c 89 fa             	mov    %r15,%rdx
   1a258:	4c 89 e9             	mov    %r13,%rcx
   1a25b:	e8 c0 18 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1a260:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a264:	0f 84 51 ff ff ff    	je     1a1bb <hyperinterval::float::F64Enclosure::affine+0x6b>
   1a26a:	4d 89 e5             	mov    %r12,%r13
   1a26d:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1a272:	48 89 e7             	mov    %rsp,%rdi
   1a275:	4c 89 f6             	mov    %r14,%rsi
   1a278:	4c 89 fa             	mov    %r15,%rdx
   1a27b:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1a280:	e8 9b 18 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1a285:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a289:	0f 84 2c ff ff ff    	je     1a1bb <hyperinterval::float::F64Enclosure::affine+0x6b>
   1a28f:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1a294:	4c 89 e0             	mov    %r12,%rax
   1a297:	4c 09 f0             	or     %r14,%rax
   1a29a:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1a29e:	4c 89 e2             	mov    %r12,%rdx
   1a2a1:	48 21 ca             	and    %rcx,%rdx
   1a2a4:	4c 89 f6             	mov    %r14,%rsi
   1a2a7:	48 29 d6             	sub    %rdx,%rsi
   1a2aa:	4d 85 e4             	test   %r12,%r12
   1a2ad:	48 0f 49 f0          	cmovns %rax,%rsi
   1a2b1:	4c 89 f8             	mov    %r15,%rax
   1a2b4:	4c 09 f0             	or     %r14,%rax
   1a2b7:	4c 21 f9             	and    %r15,%rcx
   1a2ba:	49 29 ce             	sub    %rcx,%r14
   1a2bd:	4d 85 ff             	test   %r15,%r15
   1a2c0:	4c 0f 49 f0          	cmovns %rax,%r14
   1a2c4:	b0 01                	mov    $0x1,%al
   1a2c6:	4c 39 f6             	cmp    %r14,%rsi
   1a2c9:	0f 87 f1 fe ff ff    	ja     1a1c0 <hyperinterval::float::F64Enclosure::affine+0x70>
   1a2cf:	48 89 e7             	mov    %rsp,%rdi
   1a2d2:	4c 89 ee             	mov    %r13,%rsi
   1a2d5:	48 89 ea             	mov    %rbp,%rdx
   1a2d8:	e8 73 06 00 00       	call   1a950 <hyperinterval::float::F64Enclosure::from_bits>
   1a2dd:	48 8b 04 24          	mov    (%rsp),%rax
   1a2e1:	48 83 f8 02          	cmp    $0x2,%rax
   1a2e5:	75 16                	jne    1a2fd <hyperinterval::float::F64Enclosure::affine+0x1ad>
   1a2e7:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1a2ec:	e9 cf fe ff ff       	jmp    1a1c0 <hyperinterval::float::F64Enclosure::affine+0x70>
   1a2f1:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1a2f8:	e9 cd fe ff ff       	jmp    1a1ca <hyperinterval::float::F64Enclosure::affine+0x7a>
   1a2fd:	83 f8 01             	cmp    $0x1,%eax
   1a300:	75 1b                	jne    1a31d <hyperinterval::float::F64Enclosure::affine+0x1cd>
   1a302:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1a307:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1a30c:	4c 89 e7             	mov    %r12,%rdi
   1a30f:	4c 89 fe             	mov    %r15,%rsi
   1a312:	e8 e9 1b 00 00       	call   1bf00 <hyperinterval::bounds::Bounds<T>::hull>
   1a317:	49 89 c4             	mov    %rax,%r12
   1a31a:	49 89 d7             	mov    %rdx,%r15
   1a31d:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1a324:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   1a328:	4c 89 7b 10          	mov    %r15,0x10(%rbx)
   1a32c:	e9 99 fe ff ff       	jmp    1a1ca <hyperinterval::float::F64Enclosure::affine+0x7a>
   1a331:	cc                   	int3
   1a332:	cc                   	int3
   1a333:	cc                   	int3
   1a334:	cc                   	int3
   1a335:	cc                   	int3
   1a336:	cc                   	int3
   1a337:	cc                   	int3
   1a338:	cc                   	int3
   1a339:	cc                   	int3
   1a33a:	cc                   	int3
   1a33b:	cc                   	int3
   1a33c:	cc                   	int3
   1a33d:	cc                   	int3
   1a33e:	cc                   	int3
   1a33f:	cc                   	int3

hyperinterval::float::F64Enclosure::square:
   1a340:	55                   	push   %rbp
   1a341:	41 57                	push   %r15
   1a343:	41 56                	push   %r14
   1a345:	41 55                	push   %r13
   1a347:	41 54                	push   %r12
   1a349:	53                   	push   %rbx
   1a34a:	48 83 ec 58          	sub    $0x58,%rsp
   1a34e:	48 89 fb             	mov    %rdi,%rbx
   1a351:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1a355:	0f 85 0c 01 00 00    	jne    1a467 <hyperinterval::float::F64Enclosure::square+0x127>
   1a35b:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1a35f:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
   1a366:	00 00 80 
   1a369:	49 b8 00 00 00 00 00 	movabs $0x7ff0000000000000,%r8
   1a370:	00 f0 7f 
   1a373:	49 be ff ff ff ff ff 	movabs $0xfffffffffffff,%r14
   1a37a:	ff 0f 00 
   1a37d:	48 8b 56 08          	mov    0x8(%rsi),%rdx
   1a381:	48 89 d1             	mov    %rdx,%rcx
   1a384:	48 c1 e9 34          	shr    $0x34,%rcx
   1a388:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1a38e:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
   1a393:	4c 21 f2             	and    %r14,%rdx
   1a396:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   1a39a:	48 85 c9             	test   %rcx,%rcx
   1a39d:	48 89 e8             	mov    %rbp,%rax
   1a3a0:	48 0f 44 c1          	cmove  %rcx,%rax
   1a3a4:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1a3ab:	41 bd 9c f7 ff ff    	mov    $0xfffff79c,%r13d
   1a3b1:	41 0f 44 cd          	cmove  %r13d,%ecx
   1a3b5:	48 09 d0             	or     %rdx,%rax
   1a3b8:	48 f7 e0             	mul    %rax
   1a3bb:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1a3c0:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1a3c5:	48 89 04 24          	mov    %rax,(%rsp)
   1a3c9:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1a3cd:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1a3d2:	48 89 e1             	mov    %rsp,%rcx
   1a3d5:	4c 89 e6             	mov    %r12,%rsi
   1a3d8:	4c 89 c2             	mov    %r8,%rdx
   1a3db:	e8 80 17 00 00       	call   1bb60 <hyperinterval::ieee::Format::rounded>
   1a3e0:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
   1a3e5:	75 79                	jne    1a460 <hyperinterval::float::F64Enclosure::square+0x120>
   1a3e7:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   1a3ec:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1a3f1:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   1a3f6:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1a3fb:	4c 89 f8             	mov    %r15,%rax
   1a3fe:	48 c1 e8 34          	shr    $0x34,%rax
   1a402:	25 ff 07 00 00       	and    $0x7ff,%eax
   1a407:	4c 89 7c 24 40       	mov    %r15,0x40(%rsp)
   1a40c:	4d 21 fe             	and    %r15,%r14
   1a40f:	48 85 c0             	test   %rax,%rax
   1a412:	48 0f 44 e8          	cmove  %rax,%rbp
   1a416:	8d 8c 00 9a f7 ff ff 	lea    -0x866(%rax,%rax,1),%ecx
   1a41d:	41 0f 44 cd          	cmove  %r13d,%ecx
   1a421:	4c 09 f5             	or     %r14,%rbp
   1a424:	48 89 e8             	mov    %rbp,%rax
   1a427:	48 f7 e5             	mul    %rbp
   1a42a:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1a42f:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1a434:	48 89 04 24          	mov    %rax,(%rsp)
   1a438:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1a43c:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1a441:	48 89 e1             	mov    %rsp,%rcx
   1a444:	4c 89 e6             	mov    %r12,%rsi
   1a447:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a44e:	00 f0 7f 
   1a451:	4c 89 fa             	mov    %r15,%rdx
   1a454:	e8 07 17 00 00       	call   1bb60 <hyperinterval::ieee::Format::rounded>
   1a459:	80 7c 24 28 01       	cmpb   $0x1,0x28(%rsp)
   1a45e:	75 10                	jne    1a470 <hyperinterval::float::F64Enclosure::square+0x130>
   1a460:	0f b6 44 24 29       	movzbl 0x29(%rsp),%eax
   1a465:	eb 4f                	jmp    1a4b6 <hyperinterval::float::F64Enclosure::square+0x176>
   1a467:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1a46e:	eb 50                	jmp    1a4c0 <hyperinterval::float::F64Enclosure::square+0x180>
   1a470:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   1a475:	4c 8b 6c 24 38       	mov    0x38(%rsp),%r13
   1a47a:	48 89 e7             	mov    %rsp,%rdi
   1a47d:	4c 89 e6             	mov    %r12,%rsi
   1a480:	4c 89 fa             	mov    %r15,%rdx
   1a483:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1a488:	e8 93 16 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1a48d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a491:	74 1e                	je     1a4b1 <hyperinterval::float::F64Enclosure::square+0x171>
   1a493:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1a498:	48 89 e7             	mov    %rsp,%rdi
   1a49b:	4c 89 e6             	mov    %r12,%rsi
   1a49e:	4c 89 fa             	mov    %r15,%rdx
   1a4a1:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1a4a6:	e8 75 16 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1a4ab:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a4af:	75 21                	jne    1a4d2 <hyperinterval::float::F64Enclosure::square+0x192>
   1a4b1:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a4b6:	88 43 08             	mov    %al,0x8(%rbx)
   1a4b9:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a4c0:	48 89 d8             	mov    %rbx,%rax
   1a4c3:	48 83 c4 58          	add    $0x58,%rsp
   1a4c7:	5b                   	pop    %rbx
   1a4c8:	41 5c                	pop    %r12
   1a4ca:	41 5d                	pop    %r13
   1a4cc:	41 5e                	pop    %r14
   1a4ce:	41 5f                	pop    %r15
   1a4d0:	5d                   	pop    %rbp
   1a4d1:	c3                   	ret
   1a4d2:	4c 89 f1             	mov    %r14,%rcx
   1a4d5:	48 89 e8             	mov    %rbp,%rax
   1a4d8:	4c 09 e0             	or     %r12,%rax
   1a4db:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
   1a4e0:	48 89 ee             	mov    %rbp,%rsi
   1a4e3:	4c 21 f6             	and    %r14,%rsi
   1a4e6:	4c 89 e2             	mov    %r12,%rdx
   1a4e9:	48 29 f2             	sub    %rsi,%rdx
   1a4ec:	48 85 ed             	test   %rbp,%rbp
   1a4ef:	48 0f 49 d0          	cmovns %rax,%rdx
   1a4f3:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   1a4f8:	48 89 f8             	mov    %rdi,%rax
   1a4fb:	4c 09 e0             	or     %r12,%rax
   1a4fe:	49 89 f8             	mov    %rdi,%r8
   1a501:	4d 21 f0             	and    %r14,%r8
   1a504:	4c 89 e6             	mov    %r12,%rsi
   1a507:	4c 29 c6             	sub    %r8,%rsi
   1a50a:	48 85 ff             	test   %rdi,%rdi
   1a50d:	48 0f 49 f0          	cmovns %rax,%rsi
   1a511:	b0 01                	mov    $0x1,%al
   1a513:	48 39 f2             	cmp    %rsi,%rdx
   1a516:	77 9e                	ja     1a4b6 <hyperinterval::float::F64Enclosure::square+0x176>
   1a518:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1a51d:	48 89 e7             	mov    %rsp,%rdi
   1a520:	4c 89 e6             	mov    %r12,%rsi
   1a523:	4c 89 fa             	mov    %r15,%rdx
   1a526:	e8 f5 15 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1a52b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a52f:	74 80                	je     1a4b1 <hyperinterval::float::F64Enclosure::square+0x171>
   1a531:	4c 89 e9             	mov    %r13,%rcx
   1a534:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1a539:	48 89 e7             	mov    %rsp,%rdi
   1a53c:	4c 89 e6             	mov    %r12,%rsi
   1a53f:	4c 89 fa             	mov    %r15,%rdx
   1a542:	e8 d9 15 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1a547:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a54b:	0f 84 60 ff ff ff    	je     1a4b1 <hyperinterval::float::F64Enclosure::square+0x171>
   1a551:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a556:	4c 89 e8             	mov    %r13,%rax
   1a559:	4c 09 e0             	or     %r12,%rax
   1a55c:	4c 89 ea             	mov    %r13,%rdx
   1a55f:	4c 21 f2             	and    %r14,%rdx
   1a562:	4c 89 e6             	mov    %r12,%rsi
   1a565:	48 29 d6             	sub    %rdx,%rsi
   1a568:	4d 85 ed             	test   %r13,%r13
   1a56b:	48 0f 49 f0          	cmovns %rax,%rsi
   1a56f:	48 89 c8             	mov    %rcx,%rax
   1a572:	4c 09 e0             	or     %r12,%rax
   1a575:	49 21 ce             	and    %rcx,%r14
   1a578:	4d 29 f4             	sub    %r14,%r12
   1a57b:	48 85 c9             	test   %rcx,%rcx
   1a57e:	4c 0f 49 e0          	cmovns %rax,%r12
   1a582:	b0 01                	mov    $0x1,%al
   1a584:	4c 39 e6             	cmp    %r12,%rsi
   1a587:	0f 87 29 ff ff ff    	ja     1a4b6 <hyperinterval::float::F64Enclosure::square+0x176>
   1a58d:	48 89 ef             	mov    %rbp,%rdi
   1a590:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1a595:	4c 89 ea             	mov    %r13,%rdx
   1a598:	e8 63 19 00 00       	call   1bf00 <hyperinterval::bounds::Bounds<T>::hull>
   1a59d:	49 89 c5             	mov    %rax,%r13
   1a5a0:	49 89 d4             	mov    %rdx,%r12
   1a5a3:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1a5a8:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
   1a5ad:	31 d2                	xor    %edx,%edx
   1a5af:	e8 dc 19 00 00       	call   1bf90 <hyperinterval::bounds::Bounds<T>::signs>
   1a5b4:	a8 02                	test   $0x2,%al
   1a5b6:	75 14                	jne    1a5cc <hyperinterval::float::F64Enclosure::square+0x28c>
   1a5b8:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1a5bf:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1a5c3:	4c 89 63 10          	mov    %r12,0x10(%rbx)
   1a5c7:	e9 f4 fe ff ff       	jmp    1a4c0 <hyperinterval::float::F64Enclosure::square+0x180>
   1a5cc:	48 89 e7             	mov    %rsp,%rdi
   1a5cf:	31 f6                	xor    %esi,%esi
   1a5d1:	31 d2                	xor    %edx,%edx
   1a5d3:	e8 78 03 00 00       	call   1a950 <hyperinterval::float::F64Enclosure::from_bits>
   1a5d8:	48 8b 04 24          	mov    (%rsp),%rax
   1a5dc:	48 83 f8 02          	cmp    $0x2,%rax
   1a5e0:	75 0a                	jne    1a5ec <hyperinterval::float::F64Enclosure::square+0x2ac>
   1a5e2:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1a5e7:	e9 ca fe ff ff       	jmp    1a4b6 <hyperinterval::float::F64Enclosure::square+0x176>
   1a5ec:	83 f8 01             	cmp    $0x1,%eax
   1a5ef:	75 c7                	jne    1a5b8 <hyperinterval::float::F64Enclosure::square+0x278>
   1a5f1:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1a5f6:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1a5fb:	4c 89 ef             	mov    %r13,%rdi
   1a5fe:	4c 89 e6             	mov    %r12,%rsi
   1a601:	e8 fa 18 00 00       	call   1bf00 <hyperinterval::bounds::Bounds<T>::hull>
   1a606:	49 89 c5             	mov    %rax,%r13
   1a609:	49 89 d4             	mov    %rdx,%r12
   1a60c:	eb aa                	jmp    1a5b8 <hyperinterval::float::F64Enclosure::square+0x278>
   1a60e:	cc                   	int3
   1a60f:	cc                   	int3

hyperinterval::float::F64Enclosure::next_up:
   1a610:	41 57                	push   %r15
   1a612:	41 56                	push   %r14
   1a614:	53                   	push   %rbx
   1a615:	48 83 ec 10          	sub    $0x10,%rsp
   1a619:	48 89 fb             	mov    %rdi,%rbx
   1a61c:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a623:	00 00 80 
   1a626:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a62d:	00 f0 7f 
   1a630:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1a635:	48 89 e7             	mov    %rsp,%rdi
   1a638:	4c 89 f6             	mov    %r14,%rsi
   1a63b:	4c 89 fa             	mov    %r15,%rdx
   1a63e:	e8 dd 14 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1a643:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a647:	75 0c                	jne    1a655 <hyperinterval::float::F64Enclosure::next_up+0x45>
   1a649:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a64e:	88 43 01             	mov    %al,0x1(%rbx)
   1a651:	b0 01                	mov    $0x1,%al
   1a653:	eb 3c                	jmp    1a691 <hyperinterval::float::F64Enclosure::next_up+0x81>
   1a655:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a65a:	48 89 c1             	mov    %rax,%rcx
   1a65d:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1a661:	48 83 c9 01          	or     $0x1,%rcx
   1a665:	48 01 c1             	add    %rax,%rcx
   1a668:	48 89 e7             	mov    %rsp,%rdi
   1a66b:	4c 89 f6             	mov    %r14,%rsi
   1a66e:	4c 89 fa             	mov    %r15,%rdx
   1a671:	e8 aa 14 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1a676:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a67a:	75 08                	jne    1a684 <hyperinterval::float::F64Enclosure::next_up+0x74>
   1a67c:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
   1a680:	b0 01                	mov    $0x1,%al
   1a682:	eb 0d                	jmp    1a691 <hyperinterval::float::F64Enclosure::next_up+0x81>
   1a684:	f3 0f 7e 44 24 08    	movq   0x8(%rsp),%xmm0
   1a68a:	66 0f d6 43 08       	movq   %xmm0,0x8(%rbx)
   1a68f:	31 c0                	xor    %eax,%eax
   1a691:	88 03                	mov    %al,(%rbx)
   1a693:	48 89 d8             	mov    %rbx,%rax
   1a696:	48 83 c4 10          	add    $0x10,%rsp
   1a69a:	5b                   	pop    %rbx
   1a69b:	41 5e                	pop    %r14
   1a69d:	41 5f                	pop    %r15
   1a69f:	c3                   	ret

hyperinterval::float::F64Enclosure::disjoint:
   1a6a0:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1a6a4:	b0 01                	mov    $0x1,%al
   1a6a6:	0f 84 93 00 00 00    	je     1a73f <hyperinterval::float::F64Enclosure::disjoint+0x9f>
   1a6ac:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1a6b0:	0f 84 89 00 00 00    	je     1a73f <hyperinterval::float::F64Enclosure::disjoint+0x9f>
   1a6b6:	53                   	push   %rbx
   1a6b7:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
   1a6be:	00 00 80 
   1a6c1:	4c 8b 47 10          	mov    0x10(%rdi),%r8
   1a6c5:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
   1a6c9:	4d 89 c2             	mov    %r8,%r10
   1a6cc:	49 09 ca             	or     %rcx,%r10
   1a6cf:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
   1a6d3:	4d 89 c3             	mov    %r8,%r11
   1a6d6:	49 21 d3             	and    %rdx,%r11
   1a6d9:	48 89 cb             	mov    %rcx,%rbx
   1a6dc:	4c 29 db             	sub    %r11,%rbx
   1a6df:	4d 85 c0             	test   %r8,%r8
   1a6e2:	49 0f 49 da          	cmovns %r10,%rbx
   1a6e6:	4d 89 c8             	mov    %r9,%r8
   1a6e9:	49 09 c8             	or     %rcx,%r8
   1a6ec:	4d 89 ca             	mov    %r9,%r10
   1a6ef:	49 21 d2             	and    %rdx,%r10
   1a6f2:	49 89 cb             	mov    %rcx,%r11
   1a6f5:	4d 29 d3             	sub    %r10,%r11
   1a6f8:	4d 85 c9             	test   %r9,%r9
   1a6fb:	4d 0f 49 d8          	cmovns %r8,%r11
   1a6ff:	4c 39 db             	cmp    %r11,%rbx
   1a702:	5b                   	pop    %rbx
   1a703:	72 3a                	jb     1a73f <hyperinterval::float::F64Enclosure::disjoint+0x9f>
   1a705:	48 8b 47 08          	mov    0x8(%rdi),%rax
   1a709:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1a70d:	48 89 f7             	mov    %rsi,%rdi
   1a710:	48 09 cf             	or     %rcx,%rdi
   1a713:	49 89 f0             	mov    %rsi,%r8
   1a716:	49 21 d0             	and    %rdx,%r8
   1a719:	49 89 c9             	mov    %rcx,%r9
   1a71c:	4d 29 c1             	sub    %r8,%r9
   1a71f:	48 85 f6             	test   %rsi,%rsi
   1a722:	4c 0f 49 cf          	cmovns %rdi,%r9
   1a726:	48 89 c6             	mov    %rax,%rsi
   1a729:	48 09 ce             	or     %rcx,%rsi
   1a72c:	48 21 c2             	and    %rax,%rdx
   1a72f:	48 29 d1             	sub    %rdx,%rcx
   1a732:	48 85 c0             	test   %rax,%rax
   1a735:	48 0f 49 ce          	cmovns %rsi,%rcx
   1a739:	49 39 c9             	cmp    %rcx,%r9
   1a73c:	0f 92 c0             	setb   %al
   1a73f:	c3                   	ret

hyperinterval::float::F64Enclosure::expanded:
   1a740:	41 57                	push   %r15
   1a742:	41 56                	push   %r14
   1a744:	41 55                	push   %r13
   1a746:	41 54                	push   %r12
   1a748:	53                   	push   %rbx
   1a749:	48 83 ec 10          	sub    $0x10,%rsp
   1a74d:	48 89 fb             	mov    %rdi,%rbx
   1a750:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1a754:	75 7f                	jne    1a7d5 <hyperinterval::float::F64Enclosure::expanded+0x95>
   1a756:	4c 8b 66 10          	mov    0x10(%rsi),%r12
   1a75a:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a761:	00 00 80 
   1a764:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a76b:	00 f0 7f 
   1a76e:	48 8b 46 08          	mov    0x8(%rsi),%rax
   1a772:	48 89 c2             	mov    %rax,%rdx
   1a775:	4c 31 f2             	xor    %r14,%rdx
   1a778:	48 85 c0             	test   %rax,%rax
   1a77b:	48 0f 44 d0          	cmove  %rax,%rdx
   1a77f:	48 89 d1             	mov    %rdx,%rcx
   1a782:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1a786:	48 83 c9 01          	or     $0x1,%rcx
   1a78a:	48 01 d1             	add    %rdx,%rcx
   1a78d:	48 89 e7             	mov    %rsp,%rdi
   1a790:	4c 89 f6             	mov    %r14,%rsi
   1a793:	4c 89 fa             	mov    %r15,%rdx
   1a796:	e8 85 13 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1a79b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a79f:	75 27                	jne    1a7c8 <hyperinterval::float::F64Enclosure::expanded+0x88>
   1a7a1:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1a7a6:	4c 89 e1             	mov    %r12,%rcx
   1a7a9:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1a7ad:	48 83 c9 01          	or     $0x1,%rcx
   1a7b1:	4c 01 e1             	add    %r12,%rcx
   1a7b4:	48 89 e7             	mov    %rsp,%rdi
   1a7b7:	4c 89 f6             	mov    %r14,%rsi
   1a7ba:	4c 89 fa             	mov    %r15,%rdx
   1a7bd:	e8 5e 13 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1a7c2:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a7c6:	75 25                	jne    1a7ed <hyperinterval::float::F64Enclosure::expanded+0xad>
   1a7c8:	c6 43 08 03          	movb   $0x3,0x8(%rbx)
   1a7cc:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a7d3:	eb 07                	jmp    1a7dc <hyperinterval::float::F64Enclosure::expanded+0x9c>
   1a7d5:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1a7dc:	48 89 d8             	mov    %rbx,%rax
   1a7df:	48 83 c4 10          	add    $0x10,%rsp
   1a7e3:	5b                   	pop    %rbx
   1a7e4:	41 5c                	pop    %r12
   1a7e6:	41 5d                	pop    %r13
   1a7e8:	41 5e                	pop    %r14
   1a7ea:	41 5f                	pop    %r15
   1a7ec:	c3                   	ret
   1a7ed:	4c 89 e9             	mov    %r13,%rcx
   1a7f0:	4c 31 f1             	xor    %r14,%rcx
   1a7f3:	4d 85 ed             	test   %r13,%r13
   1a7f6:	49 0f 44 cd          	cmove  %r13,%rcx
   1a7fa:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1a7ff:	48 89 e7             	mov    %rsp,%rdi
   1a802:	4c 89 f6             	mov    %r14,%rsi
   1a805:	4c 89 fa             	mov    %r15,%rdx
   1a808:	e8 13 13 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1a80d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a811:	74 1c                	je     1a82f <hyperinterval::float::F64Enclosure::expanded+0xef>
   1a813:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1a818:	48 89 e7             	mov    %rsp,%rdi
   1a81b:	4c 89 f6             	mov    %r14,%rsi
   1a81e:	4c 89 fa             	mov    %r15,%rdx
   1a821:	4c 89 e1             	mov    %r12,%rcx
   1a824:	e8 f7 12 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1a829:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a82d:	75 11                	jne    1a840 <hyperinterval::float::F64Enclosure::expanded+0x100>
   1a82f:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a834:	88 43 08             	mov    %al,0x8(%rbx)
   1a837:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a83e:	eb 9c                	jmp    1a7dc <hyperinterval::float::F64Enclosure::expanded+0x9c>
   1a840:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a845:	4c 89 e9             	mov    %r13,%rcx
   1a848:	4c 09 f1             	or     %r14,%rcx
   1a84b:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   1a84f:	4c 89 ee             	mov    %r13,%rsi
   1a852:	48 21 d6             	and    %rdx,%rsi
   1a855:	4c 89 f7             	mov    %r14,%rdi
   1a858:	48 29 f7             	sub    %rsi,%rdi
   1a85b:	4d 85 ed             	test   %r13,%r13
   1a85e:	48 0f 49 f9          	cmovns %rcx,%rdi
   1a862:	48 89 c1             	mov    %rax,%rcx
   1a865:	4c 09 f1             	or     %r14,%rcx
   1a868:	48 21 c2             	and    %rax,%rdx
   1a86b:	49 29 d6             	sub    %rdx,%r14
   1a86e:	48 85 c0             	test   %rax,%rax
   1a871:	4c 0f 49 f1          	cmovns %rcx,%r14
   1a875:	4c 39 f7             	cmp    %r14,%rdi
   1a878:	76 10                	jbe    1a88a <hyperinterval::float::F64Enclosure::expanded+0x14a>
   1a87a:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1a87e:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a885:	e9 52 ff ff ff       	jmp    1a7dc <hyperinterval::float::F64Enclosure::expanded+0x9c>
   1a88a:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1a891:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1a895:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1a899:	e9 3e ff ff ff       	jmp    1a7dc <hyperinterval::float::F64Enclosure::expanded+0x9c>
   1a89e:	cc                   	int3
   1a89f:	cc                   	int3

hyperinterval::float::F64Enclosure::overlaps:
   1a8a0:	31 c0                	xor    %eax,%eax
   1a8a2:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1a8a6:	0f 84 94 00 00 00    	je     1a940 <hyperinterval::float::F64Enclosure::overlaps+0xa0>
   1a8ac:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1a8b0:	0f 84 8a 00 00 00    	je     1a940 <hyperinterval::float::F64Enclosure::overlaps+0xa0>
   1a8b6:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1a8bd:	00 00 80 
   1a8c0:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1a8c4:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1a8c8:	49 89 d1             	mov    %rdx,%r9
   1a8cb:	49 09 c1             	or     %rax,%r9
   1a8ce:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1a8d2:	49 89 d2             	mov    %rdx,%r10
   1a8d5:	49 21 ca             	and    %rcx,%r10
   1a8d8:	49 89 c3             	mov    %rax,%r11
   1a8db:	4d 29 d3             	sub    %r10,%r11
   1a8de:	48 85 d2             	test   %rdx,%rdx
   1a8e1:	4d 0f 49 d9          	cmovns %r9,%r11
   1a8e5:	4c 89 c2             	mov    %r8,%rdx
   1a8e8:	48 09 c2             	or     %rax,%rdx
   1a8eb:	4d 89 c1             	mov    %r8,%r9
   1a8ee:	49 21 c9             	and    %rcx,%r9
   1a8f1:	49 89 c2             	mov    %rax,%r10
   1a8f4:	4d 29 ca             	sub    %r9,%r10
   1a8f7:	4d 85 c0             	test   %r8,%r8
   1a8fa:	4c 0f 49 d2          	cmovns %rdx,%r10
   1a8fe:	4d 39 d3             	cmp    %r10,%r11
   1a901:	73 03                	jae    1a906 <hyperinterval::float::F64Enclosure::overlaps+0x66>
   1a903:	31 c0                	xor    %eax,%eax
   1a905:	c3                   	ret
   1a906:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1a90a:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1a90e:	48 89 f7             	mov    %rsi,%rdi
   1a911:	48 09 c7             	or     %rax,%rdi
   1a914:	49 89 f0             	mov    %rsi,%r8
   1a917:	49 21 c8             	and    %rcx,%r8
   1a91a:	49 89 c1             	mov    %rax,%r9
   1a91d:	4d 29 c1             	sub    %r8,%r9
   1a920:	48 85 f6             	test   %rsi,%rsi
   1a923:	4c 0f 49 cf          	cmovns %rdi,%r9
   1a927:	48 89 d6             	mov    %rdx,%rsi
   1a92a:	48 09 c6             	or     %rax,%rsi
   1a92d:	48 21 d1             	and    %rdx,%rcx
   1a930:	48 29 c8             	sub    %rcx,%rax
   1a933:	48 85 d2             	test   %rdx,%rdx
   1a936:	48 0f 49 c6          	cmovns %rsi,%rax
   1a93a:	49 39 c1             	cmp    %rax,%r9
   1a93d:	0f 93 c0             	setae  %al
   1a940:	c3                   	ret
   1a941:	cc                   	int3
   1a942:	cc                   	int3
   1a943:	cc                   	int3
   1a944:	cc                   	int3
   1a945:	cc                   	int3
   1a946:	cc                   	int3
   1a947:	cc                   	int3
   1a948:	cc                   	int3
   1a949:	cc                   	int3
   1a94a:	cc                   	int3
   1a94b:	cc                   	int3
   1a94c:	cc                   	int3
   1a94d:	cc                   	int3
   1a94e:	cc                   	int3
   1a94f:	cc                   	int3

hyperinterval::float::F64Enclosure::from_bits:
   1a950:	41 57                	push   %r15
   1a952:	41 56                	push   %r14
   1a954:	41 55                	push   %r13
   1a956:	41 54                	push   %r12
   1a958:	53                   	push   %rbx
   1a959:	48 83 ec 10          	sub    $0x10,%rsp
   1a95d:	49 89 d7             	mov    %rdx,%r15
   1a960:	48 89 f1             	mov    %rsi,%rcx
   1a963:	48 89 fb             	mov    %rdi,%rbx
   1a966:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a96d:	00 00 80 
   1a970:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1a977:	00 f0 7f 
   1a97a:	48 89 e7             	mov    %rsp,%rdi
   1a97d:	4c 89 f6             	mov    %r14,%rsi
   1a980:	4c 89 e2             	mov    %r12,%rdx
   1a983:	e8 98 11 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1a988:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a98c:	74 1c                	je     1a9aa <hyperinterval::float::F64Enclosure::from_bits+0x5a>
   1a98e:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1a993:	48 89 e7             	mov    %rsp,%rdi
   1a996:	4c 89 f6             	mov    %r14,%rsi
   1a999:	4c 89 e2             	mov    %r12,%rdx
   1a99c:	4c 89 f9             	mov    %r15,%rcx
   1a99f:	e8 7c 11 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1a9a4:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a9a8:	75 1d                	jne    1a9c7 <hyperinterval::float::F64Enclosure::from_bits+0x77>
   1a9aa:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a9af:	88 43 08             	mov    %al,0x8(%rbx)
   1a9b2:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a9b9:	48 83 c4 10          	add    $0x10,%rsp
   1a9bd:	5b                   	pop    %rbx
   1a9be:	41 5c                	pop    %r12
   1a9c0:	41 5d                	pop    %r13
   1a9c2:	41 5e                	pop    %r14
   1a9c4:	41 5f                	pop    %r15
   1a9c6:	c3                   	ret
   1a9c7:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a9cc:	4c 89 e9             	mov    %r13,%rcx
   1a9cf:	4c 09 f1             	or     %r14,%rcx
   1a9d2:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   1a9d6:	4c 89 ee             	mov    %r13,%rsi
   1a9d9:	48 21 d6             	and    %rdx,%rsi
   1a9dc:	4c 89 f7             	mov    %r14,%rdi
   1a9df:	48 29 f7             	sub    %rsi,%rdi
   1a9e2:	4d 85 ed             	test   %r13,%r13
   1a9e5:	48 0f 49 f9          	cmovns %rcx,%rdi
   1a9e9:	48 89 c1             	mov    %rax,%rcx
   1a9ec:	4c 09 f1             	or     %r14,%rcx
   1a9ef:	48 21 c2             	and    %rax,%rdx
   1a9f2:	49 29 d6             	sub    %rdx,%r14
   1a9f5:	48 85 c0             	test   %rax,%rax
   1a9f8:	4c 0f 49 f1          	cmovns %rcx,%r14
   1a9fc:	4c 39 f7             	cmp    %r14,%rdi
   1a9ff:	76 06                	jbe    1aa07 <hyperinterval::float::F64Enclosure::from_bits+0xb7>
   1aa01:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1aa05:	eb ab                	jmp    1a9b2 <hyperinterval::float::F64Enclosure::from_bits+0x62>
   1aa07:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1aa0e:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1aa12:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1aa16:	eb a1                	jmp    1a9b9 <hyperinterval::float::F64Enclosure::from_bits+0x69>
   1aa18:	cc                   	int3
   1aa19:	cc                   	int3
   1aa1a:	cc                   	int3
   1aa1b:	cc                   	int3
   1aa1c:	cc                   	int3
   1aa1d:	cc                   	int3
   1aa1e:	cc                   	int3
   1aa1f:	cc                   	int3

hyperinterval::float::F64Enclosure::next_down:
   1aa20:	41 57                	push   %r15
   1aa22:	41 56                	push   %r14
   1aa24:	53                   	push   %rbx
   1aa25:	48 83 ec 10          	sub    $0x10,%rsp
   1aa29:	48 89 fb             	mov    %rdi,%rbx
   1aa2c:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1aa33:	00 00 80 
   1aa36:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1aa3d:	00 f0 7f 
   1aa40:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1aa45:	48 89 e7             	mov    %rsp,%rdi
   1aa48:	4c 89 f6             	mov    %r14,%rsi
   1aa4b:	4c 89 fa             	mov    %r15,%rdx
   1aa4e:	e8 cd 10 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1aa53:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1aa57:	75 0c                	jne    1aa65 <hyperinterval::float::F64Enclosure::next_down+0x45>
   1aa59:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1aa5e:	88 43 01             	mov    %al,0x1(%rbx)
   1aa61:	b0 01                	mov    $0x1,%al
   1aa63:	eb 51                	jmp    1aab6 <hyperinterval::float::F64Enclosure::next_down+0x96>
   1aa65:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1aa6a:	48 89 c2             	mov    %rax,%rdx
   1aa6d:	4c 31 f2             	xor    %r14,%rdx
   1aa70:	48 85 c0             	test   %rax,%rax
   1aa73:	48 0f 44 d0          	cmove  %rax,%rdx
   1aa77:	48 89 d1             	mov    %rdx,%rcx
   1aa7a:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1aa7e:	48 83 c9 01          	or     $0x1,%rcx
   1aa82:	48 01 d1             	add    %rdx,%rcx
   1aa85:	48 89 e7             	mov    %rsp,%rdi
   1aa88:	4c 89 f6             	mov    %r14,%rsi
   1aa8b:	4c 89 fa             	mov    %r15,%rdx
   1aa8e:	e8 8d 10 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1aa93:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1aa97:	75 08                	jne    1aaa1 <hyperinterval::float::F64Enclosure::next_down+0x81>
   1aa99:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
   1aa9d:	b0 01                	mov    $0x1,%al
   1aa9f:	eb 15                	jmp    1aab6 <hyperinterval::float::F64Enclosure::next_down+0x96>
   1aaa1:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1aaa6:	49 31 c6             	xor    %rax,%r14
   1aaa9:	48 85 c0             	test   %rax,%rax
   1aaac:	4c 0f 44 f0          	cmove  %rax,%r14
   1aab0:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1aab4:	31 c0                	xor    %eax,%eax
   1aab6:	88 03                	mov    %al,(%rbx)
   1aab8:	48 89 d8             	mov    %rbx,%rax
   1aabb:	48 83 c4 10          	add    $0x10,%rsp
   1aabf:	5b                   	pop    %rbx
   1aac0:	41 5e                	pop    %r14
   1aac2:	41 5f                	pop    %r15
   1aac4:	c3                   	ret
   1aac5:	cc                   	int3
   1aac6:	cc                   	int3
   1aac7:	cc                   	int3
   1aac8:	cc                   	int3
   1aac9:	cc                   	int3
   1aaca:	cc                   	int3
   1aacb:	cc                   	int3
   1aacc:	cc                   	int3
   1aacd:	cc                   	int3
   1aace:	cc                   	int3
   1aacf:	cc                   	int3

hyperinterval::float::F64Enclosure::subset_of:
   1aad0:	b0 01                	mov    $0x1,%al
   1aad2:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1aad6:	75 54                	jne    1ab2c <hyperinterval::float::F64Enclosure::subset_of+0x5c>
   1aad8:	f6 06 01             	testb  $0x1,(%rsi)
   1aadb:	74 4d                	je     1ab2a <hyperinterval::float::F64Enclosure::subset_of+0x5a>
   1aadd:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1aae1:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1aae5:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1aaec:	00 00 80 
   1aaef:	4d 89 c1             	mov    %r8,%r9
   1aaf2:	49 09 c1             	or     %rax,%r9
   1aaf5:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1aaf9:	4d 89 c2             	mov    %r8,%r10
   1aafc:	49 21 ca             	and    %rcx,%r10
   1aaff:	49 89 c3             	mov    %rax,%r11
   1ab02:	4d 29 d3             	sub    %r10,%r11
   1ab05:	4d 85 c0             	test   %r8,%r8
   1ab08:	4d 0f 49 d9          	cmovns %r9,%r11
   1ab0c:	49 89 d0             	mov    %rdx,%r8
   1ab0f:	49 09 c0             	or     %rax,%r8
   1ab12:	49 89 d1             	mov    %rdx,%r9
   1ab15:	49 21 c9             	and    %rcx,%r9
   1ab18:	49 89 c2             	mov    %rax,%r10
   1ab1b:	4d 29 ca             	sub    %r9,%r10
   1ab1e:	48 85 d2             	test   %rdx,%rdx
   1ab21:	4d 0f 49 d0          	cmovns %r8,%r10
   1ab25:	4d 39 d3             	cmp    %r10,%r11
   1ab28:	76 03                	jbe    1ab2d <hyperinterval::float::F64Enclosure::subset_of+0x5d>
   1ab2a:	31 c0                	xor    %eax,%eax
   1ab2c:	c3                   	ret
   1ab2d:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1ab31:	48 89 d7             	mov    %rdx,%rdi
   1ab34:	48 09 c7             	or     %rax,%rdi
   1ab37:	49 89 d0             	mov    %rdx,%r8
   1ab3a:	49 21 c8             	and    %rcx,%r8
   1ab3d:	49 89 c1             	mov    %rax,%r9
   1ab40:	4d 29 c1             	sub    %r8,%r9
   1ab43:	48 85 d2             	test   %rdx,%rdx
   1ab46:	4c 0f 49 cf          	cmovns %rdi,%r9
   1ab4a:	48 8b 56 10          	mov    0x10(%rsi),%rdx
   1ab4e:	48 89 d6             	mov    %rdx,%rsi
   1ab51:	48 09 c6             	or     %rax,%rsi
   1ab54:	48 21 d1             	and    %rdx,%rcx
   1ab57:	48 29 c8             	sub    %rcx,%rax
   1ab5a:	48 85 d2             	test   %rdx,%rdx
   1ab5d:	48 0f 49 c6          	cmovns %rsi,%rax
   1ab61:	49 39 c1             	cmp    %rax,%r9
   1ab64:	0f 96 c0             	setbe  %al
   1ab67:	c3                   	ret
   1ab68:	cc                   	int3
   1ab69:	cc                   	int3
   1ab6a:	cc                   	int3
   1ab6b:	cc                   	int3
   1ab6c:	cc                   	int3
   1ab6d:	cc                   	int3
   1ab6e:	cc                   	int3
   1ab6f:	cc                   	int3

hyperinterval::ieee::Format::add:
   1ab70:	55                   	push   %rbp
   1ab71:	41 57                	push   %r15
   1ab73:	41 56                	push   %r14
   1ab75:	41 55                	push   %r13
   1ab77:	41 54                	push   %r12
   1ab79:	53                   	push   %rbx
   1ab7a:	48 83 ec 38          	sub    $0x38,%rsp
   1ab7e:	48 89 fb             	mov    %rdi,%rbx
   1ab81:	48 85 c9             	test   %rcx,%rcx
   1ab84:	0f 84 63 01 00 00    	je     1aced <hyperinterval::ieee::Format::add+0x17d>
   1ab8a:	48 89 c8             	mov    %rcx,%rax
   1ab8d:	4d 85 c0             	test   %r8,%r8
   1ab90:	0f 84 61 01 00 00    	je     1acf7 <hyperinterval::ieee::Format::add+0x187>
   1ab96:	41 b9 40 00 00 00    	mov    $0x40,%r9d
   1ab9c:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
   1aba1:	49 89 c2             	mov    %rax,%r10
   1aba4:	49 21 d2             	and    %rdx,%r10
   1aba7:	44 89 c9             	mov    %r9d,%ecx
   1abaa:	49 d3 ea             	shr    %cl,%r10
   1abad:	41 bb 01 00 00 00    	mov    $0x1,%r11d
   1abb3:	49 d3 e3             	shl    %cl,%r11
   1abb6:	4d 8d 63 ff          	lea    -0x1(%r11),%r12
   1abba:	4d 89 e7             	mov    %r12,%r15
   1abbd:	49 21 c7             	and    %rax,%r15
   1abc0:	4d 85 d2             	test   %r10,%r10
   1abc3:	bf 01 00 00 00       	mov    $0x1,%edi
   1abc8:	44 89 d5             	mov    %r10d,%ebp
   1abcb:	0f 44 ef             	cmove  %edi,%ebp
   1abce:	4d 0f 45 d3          	cmovne %r11,%r10
   1abd2:	49 89 d6             	mov    %rdx,%r14
   1abd5:	49 d3 ee             	shr    %cl,%r14
   1abd8:	4d 09 fa             	or     %r15,%r10
   1abdb:	49 d1 ee             	shr    $1,%r14
   1abde:	45 01 ce             	add    %r9d,%r14d
   1abe1:	48 85 f0             	test   %rsi,%rax
   1abe4:	0f 95 44 24 0f       	setne  0xf(%rsp)
   1abe9:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1abee:	49 0f bd ca          	bsr    %r10,%rcx
   1abf2:	83 f1 3f             	xor    $0x3f,%ecx
   1abf5:	44 01 c9             	add    %r9d,%ecx
   1abf8:	83 c1 c1             	add    $0xffffffc1,%ecx
   1abfb:	45 31 ed             	xor    %r13d,%r13d
   1abfe:	4d 0f a5 d5          	shld   %cl,%r10,%r13
   1ac02:	45 31 ff             	xor    %r15d,%r15d
   1ac05:	49 d3 e2             	shl    %cl,%r10
   1ac08:	f6 c1 40             	test   $0x40,%cl
   1ac0b:	4d 0f 45 ea          	cmovne %r10,%r13
   1ac0f:	4d 0f 45 d7          	cmovne %r15,%r10
   1ac13:	44 01 f1             	add    %r14d,%ecx
   1ac16:	29 cd                	sub    %ecx,%ebp
   1ac18:	4d 89 c7             	mov    %r8,%r15
   1ac1b:	49 21 d7             	and    %rdx,%r15
   1ac1e:	44 89 c9             	mov    %r9d,%ecx
   1ac21:	49 d3 ef             	shr    %cl,%r15
   1ac24:	4d 21 c4             	and    %r8,%r12
   1ac27:	4d 85 ff             	test   %r15,%r15
   1ac2a:	41 0f 45 ff          	cmovne %r15d,%edi
   1ac2e:	4d 0f 45 fb          	cmovne %r11,%r15
   1ac32:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1ac37:	4d 09 e7             	or     %r12,%r15
   1ac3a:	49 85 f0             	test   %rsi,%r8
   1ac3d:	41 0f 95 c3          	setne  %r11b
   1ac41:	49 0f bd cf          	bsr    %r15,%rcx
   1ac45:	83 f1 3f             	xor    $0x3f,%ecx
   1ac48:	44 01 c9             	add    %r9d,%ecx
   1ac4b:	83 c1 c1             	add    $0xffffffc1,%ecx
   1ac4e:	45 31 c9             	xor    %r9d,%r9d
   1ac51:	4d 0f a5 f9          	shld   %cl,%r15,%r9
   1ac55:	49 d3 e7             	shl    %cl,%r15
   1ac58:	f6 c1 40             	test   $0x40,%cl
   1ac5b:	4d 0f 45 cf          	cmovne %r15,%r9
   1ac5f:	41 bc 00 00 00 00    	mov    $0x0,%r12d
   1ac65:	4d 0f 45 fc          	cmovne %r12,%r15
   1ac69:	41 01 ce             	add    %ecx,%r14d
   1ac6c:	44 29 f7             	sub    %r14d,%edi
   1ac6f:	39 fd                	cmp    %edi,%ebp
   1ac71:	0f 8d 90 00 00 00    	jge    1ad07 <hyperinterval::ieee::Format::add+0x197>
   1ac77:	44 88 5c 24 0e       	mov    %r11b,0xe(%rsp)
   1ac7c:	41 89 ee             	mov    %ebp,%r14d
   1ac7f:	44 0f b6 5c 24 0f    	movzbl 0xf(%rsp),%r11d
   1ac85:	4d 89 d4             	mov    %r10,%r12
   1ac88:	4c 89 ed             	mov    %r13,%rbp
   1ac8b:	4d 89 c5             	mov    %r8,%r13
   1ac8e:	44 29 f7             	sub    %r14d,%edi
   1ac91:	83 ff 4a             	cmp    $0x4a,%edi
   1ac94:	0f 8f ab 00 00 00    	jg     1ad45 <hyperinterval::ieee::Format::add+0x1d5>
   1ac9a:	49 85 f0             	test   %rsi,%r8
   1ac9d:	41 0f 95 c0          	setne  %r8b
   1aca1:	48 85 f0             	test   %rsi,%rax
   1aca4:	41 0f 95 c2          	setne  %r10b
   1aca8:	89 f9                	mov    %edi,%ecx
   1acaa:	4d 0f a5 f9          	shld   %cl,%r15,%r9
   1acae:	49 d3 e7             	shl    %cl,%r15
   1acb1:	31 c0                	xor    %eax,%eax
   1acb3:	40 f6 c7 40          	test   $0x40,%dil
   1acb7:	4d 0f 45 cf          	cmovne %r15,%r9
   1acbb:	49 0f 44 c7          	cmove  %r15,%rax
   1acbf:	45 30 c2             	xor    %r8b,%r10b
   1acc2:	0f 84 ce 00 00 00    	je     1ad96 <hyperinterval::ieee::Format::add+0x226>
   1acc8:	4c 39 e0             	cmp    %r12,%rax
   1accb:	4c 89 c9             	mov    %r9,%rcx
   1acce:	48 19 e9             	sbb    %rbp,%rcx
   1acd1:	0f 83 f5 00 00 00    	jae    1adcc <hyperinterval::ieee::Format::add+0x25c>
   1acd7:	49 29 c4             	sub    %rax,%r12
   1acda:	4c 19 cd             	sbb    %r9,%rbp
   1acdd:	44 88 5c 24 0e       	mov    %r11b,0xe(%rsp)
   1ace2:	4c 89 e0             	mov    %r12,%rax
   1ace5:	49 89 e9             	mov    %rbp,%r9
   1ace8:	e9 e5 00 00 00       	jmp    1add2 <hyperinterval::ieee::Format::add+0x262>
   1aced:	4c 89 43 08          	mov    %r8,0x8(%rbx)
   1acf1:	4c 89 43 10          	mov    %r8,0x10(%rbx)
   1acf5:	eb 08                	jmp    1acff <hyperinterval::ieee::Format::add+0x18f>
   1acf7:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1acfb:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1acff:	c6 03 00             	movb   $0x0,(%rbx)
   1ad02:	e9 f0 00 00 00       	jmp    1adf7 <hyperinterval::ieee::Format::add+0x287>
   1ad07:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1ad0c:	48 89 d6             	mov    %rdx,%rsi
   1ad0f:	89 fa                	mov    %edi,%edx
   1ad11:	4d 89 fc             	mov    %r15,%r12
   1ad14:	4d 89 ce             	mov    %r9,%r14
   1ad17:	4d 89 e9             	mov    %r13,%r9
   1ad1a:	4d 89 d7             	mov    %r10,%r15
   1ad1d:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
   1ad22:	88 4c 24 0e          	mov    %cl,0xe(%rsp)
   1ad26:	89 ef                	mov    %ebp,%edi
   1ad28:	4c 89 f5             	mov    %r14,%rbp
   1ad2b:	41 89 d6             	mov    %edx,%r14d
   1ad2e:	48 89 f2             	mov    %rsi,%rdx
   1ad31:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   1ad36:	49 89 c5             	mov    %rax,%r13
   1ad39:	44 29 f7             	sub    %r14d,%edi
   1ad3c:	83 ff 4a             	cmp    $0x4a,%edi
   1ad3f:	0f 8e 55 ff ff ff    	jle    1ac9a <hyperinterval::ieee::Format::add+0x12a>
   1ad45:	4c 89 e8             	mov    %r13,%rax
   1ad48:	45 84 db             	test   %r11b,%r11b
   1ad4b:	74 51                	je     1ad9e <hyperinterval::ieee::Format::add+0x22e>
   1ad4d:	48 31 f0             	xor    %rsi,%rax
   1ad50:	48 89 c1             	mov    %rax,%rcx
   1ad53:	48 21 f1             	and    %rsi,%rcx
   1ad56:	31 ff                	xor    %edi,%edi
   1ad58:	48 f7 d9             	neg    %rcx
   1ad5b:	40 0f 93 c7          	setae  %dil
   1ad5f:	48 8d 0c 78          	lea    (%rax,%rdi,2),%rcx
   1ad63:	48 ff c9             	dec    %rcx
   1ad66:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1ad6b:	49 89 f6             	mov    %rsi,%r14
   1ad6e:	e8 ad 0d 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1ad73:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1ad78:	75 4b                	jne    1adc5 <hyperinterval::ieee::Format::add+0x255>
   1ad7a:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1ad7f:	49 31 c6             	xor    %rax,%r14
   1ad82:	48 85 c0             	test   %rax,%rax
   1ad85:	4c 0f 44 f0          	cmove  %rax,%r14
   1ad89:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1ad8d:	4c 89 6b 10          	mov    %r13,0x10(%rbx)
   1ad91:	e9 69 ff ff ff       	jmp    1acff <hyperinterval::ieee::Format::add+0x18f>
   1ad96:	4c 01 e0             	add    %r12,%rax
   1ad99:	49 11 e9             	adc    %rbp,%r9
   1ad9c:	eb 34                	jmp    1add2 <hyperinterval::ieee::Format::add+0x262>
   1ad9e:	48 21 f0             	and    %rsi,%rax
   1ada1:	31 c9                	xor    %ecx,%ecx
   1ada3:	48 f7 d8             	neg    %rax
   1ada6:	0f 93 c1             	setae  %cl
   1ada9:	48 8d 0c 4d ff ff ff 	lea    -0x1(,%rcx,2),%rcx
   1adb0:	ff 
   1adb1:	4c 01 e9             	add    %r13,%rcx
   1adb4:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1adb9:	e8 62 0d 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1adbe:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1adc3:	74 44                	je     1ae09 <hyperinterval::ieee::Format::add+0x299>
   1adc5:	66 c7 03 01 03       	movw   $0x301,(%rbx)
   1adca:	eb 2b                	jmp    1adf7 <hyperinterval::ieee::Format::add+0x287>
   1adcc:	4c 29 e0             	sub    %r12,%rax
   1adcf:	49 19 e9             	sbb    %rbp,%r9
   1add2:	0f b6 4c 24 0e       	movzbl 0xe(%rsp),%ecx
   1add7:	88 4c 24 24          	mov    %cl,0x24(%rsp)
   1addb:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1ade0:	4c 89 4c 24 18       	mov    %r9,0x18(%rsp)
   1ade5:	44 89 74 24 20       	mov    %r14d,0x20(%rsp)
   1adea:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1adef:	48 89 df             	mov    %rbx,%rdi
   1adf2:	e8 69 0d 00 00       	call   1bb60 <hyperinterval::ieee::Format::rounded>
   1adf7:	48 89 d8             	mov    %rbx,%rax
   1adfa:	48 83 c4 38          	add    $0x38,%rsp
   1adfe:	5b                   	pop    %rbx
   1adff:	41 5c                	pop    %r12
   1ae01:	41 5d                	pop    %r13
   1ae03:	41 5e                	pop    %r14
   1ae05:	41 5f                	pop    %r15
   1ae07:	5d                   	pop    %rbp
   1ae08:	c3                   	ret
   1ae09:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1ae0e:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1ae12:	e9 e4 fe ff ff       	jmp    1acfb <hyperinterval::ieee::Format::add+0x18b>
   1ae17:	cc                   	int3
   1ae18:	cc                   	int3
   1ae19:	cc                   	int3
   1ae1a:	cc                   	int3
   1ae1b:	cc                   	int3
   1ae1c:	cc                   	int3
   1ae1d:	cc                   	int3
   1ae1e:	cc                   	int3
   1ae1f:	cc                   	int3

hyperinterval::ieee::Format::div:
   1ae20:	55                   	push   %rbp
   1ae21:	41 57                	push   %r15
   1ae23:	41 56                	push   %r14
   1ae25:	41 55                	push   %r13
   1ae27:	41 54                	push   %r12
   1ae29:	53                   	push   %rbx
   1ae2a:	48 83 ec 48          	sub    $0x48,%rsp
   1ae2e:	4d 85 c0             	test   %r8,%r8
   1ae31:	0f 84 cb 00 00 00    	je     1af02 <hyperinterval::ieee::Format::div+0xe2>
   1ae37:	48 85 c9             	test   %rcx,%rcx
   1ae3a:	0f 84 cc 00 00 00    	je     1af0c <hyperinterval::ieee::Format::div+0xec>
   1ae40:	41 be 40 00 00 00    	mov    $0x40,%r14d
   1ae46:	f3 4c 0f bc f2       	tzcnt  %rdx,%r14
   1ae4b:	49 89 cd             	mov    %rcx,%r13
   1ae4e:	49 21 d5             	and    %rdx,%r13
   1ae51:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
   1ae56:	41 83 e6 3f          	and    $0x3f,%r14d
   1ae5a:	48 89 c8             	mov    %rcx,%rax
   1ae5d:	44 89 f1             	mov    %r14d,%ecx
   1ae60:	49 d3 ed             	shr    %cl,%r13
   1ae63:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1ae69:	49 d3 e2             	shl    %cl,%r10
   1ae6c:	4d 8d 5a ff          	lea    -0x1(%r10),%r11
   1ae70:	4c 89 db             	mov    %r11,%rbx
   1ae73:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1ae78:	48 21 c3             	and    %rax,%rbx
   1ae7b:	4d 85 ed             	test   %r13,%r13
   1ae7e:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1ae84:	44 89 e8             	mov    %r13d,%eax
   1ae87:	41 0f 44 c1          	cmove  %r9d,%eax
   1ae8b:	4d 0f 45 ea          	cmovne %r10,%r13
   1ae8f:	4c 89 c5             	mov    %r8,%rbp
   1ae92:	48 21 d5             	and    %rdx,%rbp
   1ae95:	48 d3 ea             	shr    %cl,%rdx
   1ae98:	48 d3 ed             	shr    %cl,%rbp
   1ae9b:	49 09 dd             	or     %rbx,%r13
   1ae9e:	48 d1 ea             	shr    $1,%rdx
   1aea1:	4d 21 c3             	and    %r8,%r11
   1aea4:	48 85 ed             	test   %rbp,%rbp
   1aea7:	44 0f 45 cd          	cmovne %ebp,%r9d
   1aeab:	49 0f 45 ea          	cmovne %r10,%rbp
   1aeaf:	4c 09 dd             	or     %r11,%rbp
   1aeb2:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1aeb7:	41 ba 7f 00 00 00    	mov    $0x7f,%r10d
   1aebd:	4c 0f bd d5          	bsr    %rbp,%r10
   1aec1:	41 83 f2 3f          	xor    $0x3f,%r10d
   1aec5:	41 83 c2 40          	add    $0x40,%r10d
   1aec9:	49 0f bd cd          	bsr    %r13,%rcx
   1aecd:	83 f1 3f             	xor    $0x3f,%ecx
   1aed0:	45 89 d7             	mov    %r10d,%r15d
   1aed3:	41 29 cf             	sub    %ecx,%r15d
   1aed6:	41 83 c7 c0          	add    $0xffffffc0,%r15d
   1aeda:	78 3f                	js     1af1b <hyperinterval::ieee::Format::div+0xfb>
   1aedc:	45 31 db             	xor    %r11d,%r11d
   1aedf:	44 89 f9             	mov    %r15d,%ecx
   1aee2:	49 0f a5 eb          	shld   %cl,%rbp,%r11
   1aee6:	31 db                	xor    %ebx,%ebx
   1aee8:	49 89 ec             	mov    %rbp,%r12
   1aeeb:	49 d3 e4             	shl    %cl,%r12
   1aeee:	41 f6 c7 40          	test   $0x40,%r15b
   1aef2:	4d 0f 45 dc          	cmovne %r12,%r11
   1aef6:	4c 0f 45 e3          	cmovne %rbx,%r12
   1aefa:	4d 39 e5             	cmp    %r12,%r13
   1aefd:	4c 19 db             	sbb    %r11,%rbx
   1af00:	eb 3f                	jmp    1af41 <hyperinterval::ieee::Format::div+0x121>
   1af02:	66 c7 07 01 04       	movw   $0x401,(%rdi)
   1af07:	e9 24 03 00 00       	jmp    1b230 <hyperinterval::ieee::Format::div+0x410>
   1af0c:	c6 07 00             	movb   $0x0,(%rdi)
   1af0f:	0f 57 c0             	xorps  %xmm0,%xmm0
   1af12:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1af16:	e9 15 03 00 00       	jmp    1b230 <hyperinterval::ieee::Format::div+0x410>
   1af1b:	44 89 f9             	mov    %r15d,%ecx
   1af1e:	f6 d9                	neg    %cl
   1af20:	45 31 db             	xor    %r11d,%r11d
   1af23:	4d 0f a5 eb          	shld   %cl,%r13,%r11
   1af27:	31 db                	xor    %ebx,%ebx
   1af29:	4d 89 ec             	mov    %r13,%r12
   1af2c:	49 d3 e4             	shl    %cl,%r12
   1af2f:	f6 c1 40             	test   $0x40,%cl
   1af32:	4d 0f 45 dc          	cmovne %r12,%r11
   1af36:	4c 0f 45 e3          	cmovne %rbx,%r12
   1af3a:	49 39 ec             	cmp    %rbp,%r12
   1af3d:	49 83 db 00          	sbb    $0x0,%r11
   1af41:	0f 92 c1             	setb   %cl
   1af44:	44 29 c8             	sub    %r9d,%eax
   1af47:	41 01 c7             	add    %eax,%r15d
   1af4a:	0f b6 c9             	movzbl %cl,%ecx
   1af4d:	41 29 cf             	sub    %ecx,%r15d
   1af50:	41 39 d7             	cmp    %edx,%r15d
   1af53:	0f 8f 19 02 00 00    	jg     1b172 <hyperinterval::ieee::Format::div+0x352>
   1af59:	4c 8b 4c 24 10       	mov    0x10(%rsp),%r9
   1af5e:	46 8d 1c 0a          	lea    (%rdx,%r9,1),%r11d
   1af62:	b9 01 00 00 00       	mov    $0x1,%ecx
   1af67:	4c 89 5c 24 18       	mov    %r11,0x18(%rsp)
   1af6c:	44 29 d9             	sub    %r11d,%ecx
   1af6f:	45 29 cf             	sub    %r9d,%r15d
   1af72:	41 39 cf             	cmp    %ecx,%r15d
   1af75:	44 0f 4e f9          	cmovle %ecx,%r15d
   1af79:	44 29 f8             	sub    %r15d,%eax
   1af7c:	78 61                	js     1afdf <hyperinterval::ieee::Format::div+0x1bf>
   1af7e:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1af83:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
   1af88:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1af8d:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1af92:	48 85 ed             	test   %rbp,%rbp
   1af95:	0f 84 a7 02 00 00    	je     1b242 <hyperinterval::ieee::Format::div+0x422>
   1af9b:	45 31 e4             	xor    %r12d,%r12d
   1af9e:	89 c1                	mov    %eax,%ecx
   1afa0:	4d 0f a5 ec          	shld   %cl,%r13,%r12
   1afa4:	31 d2                	xor    %edx,%edx
   1afa6:	49 d3 e5             	shl    %cl,%r13
   1afa9:	a8 40                	test   $0x40,%al
   1afab:	4d 0f 45 e5          	cmovne %r13,%r12
   1afaf:	4c 0f 45 ea          	cmovne %rdx,%r13
   1afb3:	4c 89 ef             	mov    %r13,%rdi
   1afb6:	4c 89 e6             	mov    %r12,%rsi
   1afb9:	48 89 ea             	mov    %rbp,%rdx
   1afbc:	31 c9                	xor    %ecx,%ecx
   1afbe:	ff 15 8c 2e 04 00    	call   *0x42e8c(%rip)        # 5de50 <_DYNAMIC+0x410>
   1afc4:	49 89 c2             	mov    %rax,%r10
   1afc7:	49 89 d1             	mov    %rdx,%r9
   1afca:	48 89 d1             	mov    %rdx,%rcx
   1afcd:	48 0f af cd          	imul   %rbp,%rcx
   1afd1:	48 f7 e5             	mul    %rbp
   1afd4:	48 01 ca             	add    %rcx,%rdx
   1afd7:	49 29 c5             	sub    %rax,%r13
   1afda:	49 19 d4             	sbb    %rdx,%r12
   1afdd:	eb 79                	jmp    1b058 <hyperinterval::ieee::Format::div+0x238>
   1afdf:	f7 d8                	neg    %eax
   1afe1:	44 39 d0             	cmp    %r10d,%eax
   1afe4:	7e 07                	jle    1afed <hyperinterval::ieee::Format::div+0x1cd>
   1afe6:	b3 01                	mov    $0x1,%bl
   1afe8:	e9 df 00 00 00       	jmp    1b0cc <hyperinterval::ieee::Format::div+0x2ac>
   1afed:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1aff2:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
   1aff7:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1affc:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1b001:	31 db                	xor    %ebx,%ebx
   1b003:	89 c1                	mov    %eax,%ecx
   1b005:	48 0f a5 eb          	shld   %cl,%rbp,%rbx
   1b009:	48 d3 e5             	shl    %cl,%rbp
   1b00c:	31 c9                	xor    %ecx,%ecx
   1b00e:	a8 40                	test   $0x40,%al
   1b010:	48 0f 45 dd          	cmovne %rbp,%rbx
   1b014:	48 0f 45 e9          	cmovne %rcx,%rbp
   1b018:	48 89 e8             	mov    %rbp,%rax
   1b01b:	48 09 d8             	or     %rbx,%rax
   1b01e:	0f 84 2b 02 00 00    	je     1b24f <hyperinterval::ieee::Format::div+0x42f>
   1b024:	45 31 e4             	xor    %r12d,%r12d
   1b027:	4c 89 ef             	mov    %r13,%rdi
   1b02a:	31 f6                	xor    %esi,%esi
   1b02c:	48 89 ea             	mov    %rbp,%rdx
   1b02f:	48 89 d9             	mov    %rbx,%rcx
   1b032:	ff 15 18 2e 04 00    	call   *0x42e18(%rip)        # 5de50 <_DYNAMIC+0x410>
   1b038:	49 89 c2             	mov    %rax,%r10
   1b03b:	49 89 d1             	mov    %rdx,%r9
   1b03e:	48 0f af d8          	imul   %rax,%rbx
   1b042:	48 f7 e5             	mul    %rbp
   1b045:	48 01 da             	add    %rbx,%rdx
   1b048:	4c 89 c9             	mov    %r9,%rcx
   1b04b:	48 0f af cd          	imul   %rbp,%rcx
   1b04f:	48 01 d1             	add    %rdx,%rcx
   1b052:	49 29 c5             	sub    %rax,%r13
   1b055:	49 19 cc             	sbb    %rcx,%r12
   1b058:	4d 09 e5             	or     %r12,%r13
   1b05b:	0f 95 c3             	setne  %bl
   1b05e:	4c 89 d0             	mov    %r10,%rax
   1b061:	4c 09 c8             	or     %r9,%rax
   1b064:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
   1b069:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   1b06e:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
   1b073:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
   1b078:	74 52                	je     1b0cc <hyperinterval::ieee::Format::div+0x2ac>
   1b07a:	49 0f bd c1          	bsr    %r9,%rax
   1b07e:	83 f0 3f             	xor    $0x3f,%eax
   1b081:	4d 0f bd da          	bsr    %r10,%r11
   1b085:	41 83 f3 3f          	xor    $0x3f,%r11d
   1b089:	41 83 cb 40          	or     $0x40,%r11d
   1b08d:	4d 85 c9             	test   %r9,%r9
   1b090:	44 0f 45 d8          	cmovne %eax,%r11d
   1b094:	41 83 f3 7f          	xor    $0x7f,%r11d
   1b098:	43 8d 2c 3b          	lea    (%r11,%r15,1),%ebp
   1b09c:	39 d5                	cmp    %edx,%ebp
   1b09e:	0f 8f ce 00 00 00    	jg     1b172 <hyperinterval::ieee::Format::div+0x352>
   1b0a4:	b8 01 00 00 00       	mov    $0x1,%eax
   1b0a9:	29 d0                	sub    %edx,%eax
   1b0ab:	39 c5                	cmp    %eax,%ebp
   1b0ad:	7d 28                	jge    1b0d7 <hyperinterval::ieee::Format::div+0x2b7>
   1b0af:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1b0b4:	42 8d 0c 38          	lea    (%rax,%r15,1),%ecx
   1b0b8:	fe c9                	dec    %cl
   1b0ba:	4c 89 d0             	mov    %r10,%rax
   1b0bd:	48 d3 e0             	shl    %cl,%rax
   1b0c0:	45 31 db             	xor    %r11d,%r11d
   1b0c3:	f6 c1 40             	test   $0x40,%cl
   1b0c6:	4c 0f 44 d8          	cmove  %rax,%r11
   1b0ca:	eb 6e                	jmp    1b13a <hyperinterval::ieee::Format::div+0x31a>
   1b0cc:	45 31 d2             	xor    %r10d,%r10d
   1b0cf:	45 31 c9             	xor    %r9d,%r9d
   1b0d2:	45 31 db             	xor    %r11d,%r11d
   1b0d5:	eb 63                	jmp    1b13a <hyperinterval::ieee::Format::div+0x31a>
   1b0d7:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1b0dc:	89 c1                	mov    %eax,%ecx
   1b0de:	44 29 d9             	sub    %r11d,%ecx
   1b0e1:	4d 89 d4             	mov    %r10,%r12
   1b0e4:	49 d3 e4             	shl    %cl,%r12
   1b0e7:	89 c8                	mov    %ecx,%eax
   1b0e9:	f7 d8                	neg    %eax
   1b0eb:	45 31 ed             	xor    %r13d,%r13d
   1b0ee:	f6 c1 40             	test   $0x40,%cl
   1b0f1:	4d 0f 44 ec          	cmove  %r12,%r13
   1b0f5:	4d 89 d4             	mov    %r10,%r12
   1b0f8:	89 c1                	mov    %eax,%ecx
   1b0fa:	4d 0f ad cc          	shrd   %cl,%r9,%r12
   1b0fe:	88 5c 24 0f          	mov    %bl,0xf(%rsp)
   1b102:	4c 89 cb             	mov    %r9,%rbx
   1b105:	48 d3 eb             	shr    %cl,%rbx
   1b108:	a8 40                	test   $0x40,%al
   1b10a:	49 0f 44 dc          	cmove  %r12,%rbx
   1b10e:	44 39 5c 24 10       	cmp    %r11d,0x10(%rsp)
   1b113:	49 0f 43 dd          	cmovae %r13,%rbx
   1b117:	01 d5                	add    %edx,%ebp
   1b119:	48 63 c5             	movslq %ebp,%rax
   1b11c:	44 89 f1             	mov    %r14d,%ecx
   1b11f:	48 d3 e0             	shl    %cl,%rax
   1b122:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   1b129:	49 d3 e3             	shl    %cl,%r11
   1b12c:	49 f7 d3             	not    %r11
   1b12f:	49 21 db             	and    %rbx,%r11
   1b132:	0f b6 5c 24 0f       	movzbl 0xf(%rsp),%ebx
   1b137:	49 09 c3             	or     %rax,%r11
   1b13a:	0f b6 db             	movzbl %bl,%ebx
   1b13d:	4c 01 d3             	add    %r10,%rbx
   1b140:	49 83 d1 00          	adc    $0x0,%r9
   1b144:	48 89 d8             	mov    %rbx,%rax
   1b147:	4c 09 c8             	or     %r9,%rax
   1b14a:	74 30                	je     1b17c <hyperinterval::ieee::Format::div+0x35c>
   1b14c:	49 0f bd c1          	bsr    %r9,%rax
   1b150:	83 f0 3f             	xor    $0x3f,%eax
   1b153:	4c 0f bd d3          	bsr    %rbx,%r10
   1b157:	41 83 f2 3f          	xor    $0x3f,%r10d
   1b15b:	41 83 ca 40          	or     $0x40,%r10d
   1b15f:	4d 85 c9             	test   %r9,%r9
   1b162:	44 0f 45 d0          	cmovne %eax,%r10d
   1b166:	41 83 f2 7f          	xor    $0x7f,%r10d
   1b16a:	43 8d 2c 3a          	lea    (%r10,%r15,1),%ebp
   1b16e:	39 d5                	cmp    %edx,%ebp
   1b170:	7e 0e                	jle    1b180 <hyperinterval::ieee::Format::div+0x360>
   1b172:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   1b177:	e9 b4 00 00 00       	jmp    1b230 <hyperinterval::ieee::Format::div+0x410>
   1b17c:	31 c0                	xor    %eax,%eax
   1b17e:	eb 76                	jmp    1b1f6 <hyperinterval::ieee::Format::div+0x3d6>
   1b180:	b8 01 00 00 00       	mov    $0x1,%eax
   1b185:	29 d0                	sub    %edx,%eax
   1b187:	39 c5                	cmp    %eax,%ebp
   1b189:	7d 18                	jge    1b1a3 <hyperinterval::ieee::Format::div+0x383>
   1b18b:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1b190:	44 01 f9             	add    %r15d,%ecx
   1b193:	fe c9                	dec    %cl
   1b195:	48 d3 e3             	shl    %cl,%rbx
   1b198:	31 c0                	xor    %eax,%eax
   1b19a:	f6 c1 40             	test   $0x40,%cl
   1b19d:	48 0f 44 c3          	cmove  %rbx,%rax
   1b1a1:	eb 53                	jmp    1b1f6 <hyperinterval::ieee::Format::div+0x3d6>
   1b1a3:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   1b1a8:	44 89 e9             	mov    %r13d,%ecx
   1b1ab:	44 29 d1             	sub    %r10d,%ecx
   1b1ae:	89 c8                	mov    %ecx,%eax
   1b1b0:	f7 d8                	neg    %eax
   1b1b2:	49 89 df             	mov    %rbx,%r15
   1b1b5:	49 d3 e7             	shl    %cl,%r15
   1b1b8:	45 31 e4             	xor    %r12d,%r12d
   1b1bb:	f6 c1 40             	test   $0x40,%cl
   1b1be:	4d 0f 44 e7          	cmove  %r15,%r12
   1b1c2:	89 c1                	mov    %eax,%ecx
   1b1c4:	4c 0f ad cb          	shrd   %cl,%r9,%rbx
   1b1c8:	49 d3 e9             	shr    %cl,%r9
   1b1cb:	a8 40                	test   $0x40,%al
   1b1cd:	4c 0f 44 cb          	cmove  %rbx,%r9
   1b1d1:	45 39 d5             	cmp    %r10d,%r13d
   1b1d4:	4d 0f 43 cc          	cmovae %r12,%r9
   1b1d8:	01 d5                	add    %edx,%ebp
   1b1da:	48 63 d5             	movslq %ebp,%rdx
   1b1dd:	44 89 f1             	mov    %r14d,%ecx
   1b1e0:	48 d3 e2             	shl    %cl,%rdx
   1b1e3:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   1b1ea:	48 d3 e0             	shl    %cl,%rax
   1b1ed:	48 f7 d0             	not    %rax
   1b1f0:	4c 21 c8             	and    %r9,%rax
   1b1f3:	48 09 d0             	or     %rdx,%rax
   1b1f6:	48 85 74 24 40       	test   %rsi,0x40(%rsp)
   1b1fb:	0f 95 c1             	setne  %cl
   1b1fe:	49 85 f0             	test   %rsi,%r8
   1b201:	0f 94 c2             	sete   %dl
   1b204:	30 ca                	xor    %cl,%dl
   1b206:	75 1d                	jne    1b225 <hyperinterval::ieee::Format::div+0x405>
   1b208:	48 89 c1             	mov    %rax,%rcx
   1b20b:	48 31 f1             	xor    %rsi,%rcx
   1b20e:	48 85 c0             	test   %rax,%rax
   1b211:	48 0f 44 c8          	cmove  %rax,%rcx
   1b215:	4c 31 de             	xor    %r11,%rsi
   1b218:	4d 85 db             	test   %r11,%r11
   1b21b:	49 0f 44 f3          	cmove  %r11,%rsi
   1b21f:	48 89 f0             	mov    %rsi,%rax
   1b222:	49 89 cb             	mov    %rcx,%r11
   1b225:	4c 89 5f 08          	mov    %r11,0x8(%rdi)
   1b229:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1b22d:	c6 07 00             	movb   $0x0,(%rdi)
   1b230:	48 89 f8             	mov    %rdi,%rax
   1b233:	48 83 c4 48          	add    $0x48,%rsp
   1b237:	5b                   	pop    %rbx
   1b238:	41 5c                	pop    %r12
   1b23a:	41 5d                	pop    %r13
   1b23c:	41 5e                	pop    %r14
   1b23e:	41 5f                	pop    %r15
   1b240:	5d                   	pop    %rbp
   1b241:	c3                   	ret
   1b242:	48 8d 3d 77 09 04 00 	lea    0x40977(%rip),%rdi        # 5bbc0 <__frame_dummy_init_array_entry+0x1c0>
   1b249:	ff 15 09 2c 04 00    	call   *0x42c09(%rip)        # 5de58 <_DYNAMIC+0x418>
   1b24f:	48 8d 3d 52 09 04 00 	lea    0x40952(%rip),%rdi        # 5bba8 <__frame_dummy_init_array_entry+0x1a8>
   1b256:	ff 15 fc 2b 04 00    	call   *0x42bfc(%rip)        # 5de58 <_DYNAMIC+0x418>
   1b25c:	cc                   	int3
   1b25d:	cc                   	int3
   1b25e:	cc                   	int3
   1b25f:	cc                   	int3

hyperinterval::ieee::Format::mul:
   1b260:	55                   	push   %rbp
   1b261:	41 57                	push   %r15
   1b263:	41 56                	push   %r14
   1b265:	41 54                	push   %r12
   1b267:	53                   	push   %rbx
   1b268:	48 83 ec 20          	sub    $0x20,%rsp
   1b26c:	48 89 c8             	mov    %rcx,%rax
   1b26f:	49 89 d1             	mov    %rdx,%r9
   1b272:	b9 40 00 00 00       	mov    $0x40,%ecx
   1b277:	f3 48 0f bc ca       	tzcnt  %rdx,%rcx
   1b27c:	48 89 c2             	mov    %rax,%rdx
   1b27f:	4c 21 ca             	and    %r9,%rdx
   1b282:	48 d3 ea             	shr    %cl,%rdx
   1b285:	41 be 01 00 00 00    	mov    $0x1,%r14d
   1b28b:	49 d3 e6             	shl    %cl,%r14
   1b28e:	4d 8d 66 ff          	lea    -0x1(%r14),%r12
   1b292:	4c 89 e3             	mov    %r12,%rbx
   1b295:	48 21 c3             	and    %rax,%rbx
   1b298:	48 85 d2             	test   %rdx,%rdx
   1b29b:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1b2a1:	41 89 d3             	mov    %edx,%r11d
   1b2a4:	45 0f 44 da          	cmove  %r10d,%r11d
   1b2a8:	49 0f 45 d6          	cmovne %r14,%rdx
   1b2ac:	48 09 da             	or     %rbx,%rdx
   1b2af:	4d 89 cf             	mov    %r9,%r15
   1b2b2:	49 d3 ef             	shr    %cl,%r15
   1b2b5:	48 85 f0             	test   %rsi,%rax
   1b2b8:	40 0f 95 c5          	setne  %bpl
   1b2bc:	4c 89 c0             	mov    %r8,%rax
   1b2bf:	4c 21 c8             	and    %r9,%rax
   1b2c2:	48 d3 e8             	shr    %cl,%rax
   1b2c5:	4d 21 c4             	and    %r8,%r12
   1b2c8:	48 85 c0             	test   %rax,%rax
   1b2cb:	44 0f 45 d0          	cmovne %eax,%r10d
   1b2cf:	48 89 fb             	mov    %rdi,%rbx
   1b2d2:	49 0f 45 c6          	cmovne %r14,%rax
   1b2d6:	4c 09 e0             	or     %r12,%rax
   1b2d9:	49 85 f0             	test   %rsi,%r8
   1b2dc:	40 0f 95 c7          	setne  %dil
   1b2e0:	40 30 ef             	xor    %bpl,%dil
   1b2e3:	48 f7 e2             	mul    %rdx
   1b2e6:	45 01 da             	add    %r11d,%r10d
   1b2e9:	41 8d 0c 4f          	lea    (%r15,%rcx,2),%ecx
   1b2ed:	83 e1 fe             	and    $0xfffffffe,%ecx
   1b2f0:	41 29 ca             	sub    %ecx,%r10d
   1b2f3:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
   1b2f8:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b2fd:	48 89 04 24          	mov    %rax,(%rsp)
   1b301:	44 89 54 24 10       	mov    %r10d,0x10(%rsp)
   1b306:	48 89 e1             	mov    %rsp,%rcx
   1b309:	48 89 df             	mov    %rbx,%rdi
   1b30c:	4c 89 ca             	mov    %r9,%rdx
   1b30f:	e8 4c 08 00 00       	call   1bb60 <hyperinterval::ieee::Format::rounded>
   1b314:	48 89 d8             	mov    %rbx,%rax
   1b317:	48 83 c4 20          	add    $0x20,%rsp
   1b31b:	5b                   	pop    %rbx
   1b31c:	41 5c                	pop    %r12
   1b31e:	41 5e                	pop    %r14
   1b320:	41 5f                	pop    %r15
   1b322:	5d                   	pop    %rbp
   1b323:	c3                   	ret
   1b324:	cc                   	int3
   1b325:	cc                   	int3
   1b326:	cc                   	int3
   1b327:	cc                   	int3
   1b328:	cc                   	int3
   1b329:	cc                   	int3
   1b32a:	cc                   	int3
   1b32b:	cc                   	int3
   1b32c:	cc                   	int3
   1b32d:	cc                   	int3
   1b32e:	cc                   	int3
   1b32f:	cc                   	int3

hyperinterval::ieee::Format::power:
   1b330:	55                   	push   %rbp
   1b331:	41 57                	push   %r15
   1b333:	41 56                	push   %r14
   1b335:	41 55                	push   %r13
   1b337:	41 54                	push   %r12
   1b339:	53                   	push   %rbx
   1b33a:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
   1b341:	49 89 cb             	mov    %rcx,%r11
   1b344:	49 89 d6             	mov    %rdx,%r14
   1b347:	48 85 f1             	test   %rsi,%rcx
   1b34a:	41 0f 95 c1          	setne  %r9b
   1b34e:	b8 40 00 00 00       	mov    $0x40,%eax
   1b353:	f3 48 0f bc c2       	tzcnt  %rdx,%rax
   1b358:	41 89 c2             	mov    %eax,%r10d
   1b35b:	41 83 e2 3f          	and    $0x3f,%r10d
   1b35f:	44 89 d1             	mov    %r10d,%ecx
   1b362:	48 d3 ea             	shr    %cl,%rdx
   1b365:	48 89 d1             	mov    %rdx,%rcx
   1b368:	48 d1 e9             	shr    $1,%rcx
   1b36b:	48 63 d9             	movslq %ecx,%rbx
   1b36e:	44 89 d1             	mov    %r10d,%ecx
   1b371:	48 d3 e3             	shl    %cl,%rbx
   1b374:	45 85 c0             	test   %r8d,%r8d
   1b377:	0f 84 46 03 00 00    	je     1b6c3 <hyperinterval::ieee::Format::power+0x393>
   1b37d:	44 88 4c 24 03       	mov    %r9b,0x3(%rsp)
   1b382:	48 89 7c 24 48       	mov    %rdi,0x48(%rsp)
   1b387:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1b38d:	44 89 d1             	mov    %r10d,%ecx
   1b390:	49 d3 e1             	shl    %cl,%r9
   1b393:	48 8d 4e ff          	lea    -0x1(%rsi),%rcx
   1b397:	49 21 cb             	and    %rcx,%r11
   1b39a:	48 89 d9             	mov    %rbx,%rcx
   1b39d:	4d 8d 79 ff          	lea    -0x1(%r9),%r15
   1b3a1:	8d 2c 42             	lea    (%rdx,%rax,2),%ebp
   1b3a4:	83 e5 fe             	and    $0xfffffffe,%ebp
   1b3a7:	ba 02 00 00 00       	mov    $0x2,%edx
   1b3ac:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1b3b1:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1b3b6:	44 89 44 24 68       	mov    %r8d,0x68(%rsp)
   1b3bb:	44 89 c3             	mov    %r8d,%ebx
   1b3be:	4c 89 5c 24 58       	mov    %r11,0x58(%rsp)
   1b3c3:	4c 89 5c 24 60       	mov    %r11,0x60(%rsp)
   1b3c8:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
   1b3cd:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   1b3d2:	4c 89 8c 24 80 00 00 	mov    %r9,0x80(%rsp)
   1b3d9:	00 
   1b3da:	4c 89 54 24 78       	mov    %r10,0x78(%rsp)
   1b3df:	4c 89 7c 24 70       	mov    %r15,0x70(%rsp)
   1b3e4:	89 6c 24 6c          	mov    %ebp,0x6c(%rsp)
   1b3e8:	f6 c3 01             	test   $0x1,%bl
   1b3eb:	0f 84 a4 01 00 00    	je     1b595 <hyperinterval::ieee::Format::power+0x265>
   1b3f1:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   1b3f8:	0f 1f 84 00 00 00 00 
   1b3ff:	00 
   1b400:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
   1b404:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1b409:	48 89 d0             	mov    %rdx,%rax
   1b40c:	4c 21 f0             	and    %r14,%rax
   1b40f:	44 89 d1             	mov    %r10d,%ecx
   1b412:	48 d3 e8             	shr    %cl,%rax
   1b415:	48 89 d1             	mov    %rdx,%rcx
   1b418:	4c 21 f9             	and    %r15,%rcx
   1b41b:	48 85 c0             	test   %rax,%rax
   1b41e:	41 89 c3             	mov    %eax,%r11d
   1b421:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1b427:	45 0f 44 d8          	cmove  %r8d,%r11d
   1b42b:	49 0f 45 c1          	cmovne %r9,%rax
   1b42f:	48 09 c8             	or     %rcx,%rax
   1b432:	48 85 f2             	test   %rsi,%rdx
   1b435:	0f 95 44 24 08       	setne  0x8(%rsp)
   1b43a:	4c 8b 6c 24 60       	mov    0x60(%rsp),%r13
   1b43f:	4c 89 eb             	mov    %r13,%rbx
   1b442:	4c 21 f3             	and    %r14,%rbx
   1b445:	44 89 d1             	mov    %r10d,%ecx
   1b448:	48 d3 eb             	shr    %cl,%rbx
   1b44b:	4c 89 e9             	mov    %r13,%rcx
   1b44e:	4c 21 f9             	and    %r15,%rcx
   1b451:	48 85 db             	test   %rbx,%rbx
   1b454:	41 89 d8             	mov    %ebx,%r8d
   1b457:	ba 01 00 00 00       	mov    $0x1,%edx
   1b45c:	44 0f 44 c2          	cmove  %edx,%r8d
   1b460:	49 0f 45 d9          	cmovne %r9,%rbx
   1b464:	48 09 cb             	or     %rcx,%rbx
   1b467:	49 85 f5             	test   %rsi,%r13
   1b46a:	0f 95 c1             	setne  %cl
   1b46d:	32 4c 24 08          	xor    0x8(%rsp),%cl
   1b471:	48 f7 e3             	mul    %rbx
   1b474:	41 29 e8             	sub    %ebp,%r8d
   1b477:	45 01 d8             	add    %r11d,%r8d
   1b47a:	88 4c 24 24          	mov    %cl,0x24(%rsp)
   1b47e:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1b483:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1b488:	44 89 44 24 20       	mov    %r8d,0x20(%rsp)
   1b48d:	4c 89 f2             	mov    %r14,%rdx
   1b490:	4c 89 e1             	mov    %r12,%rcx
   1b493:	49 89 fd             	mov    %rdi,%r13
   1b496:	4d 89 cc             	mov    %r9,%r12
   1b499:	48 89 f3             	mov    %rsi,%rbx
   1b49c:	4c 89 f5             	mov    %r14,%rbp
   1b49f:	4d 89 d6             	mov    %r10,%r14
   1b4a2:	e8 b9 06 00 00       	call   1bb60 <hyperinterval::ieee::Format::rounded>
   1b4a7:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   1b4ac:	0f 85 00 02 00 00    	jne    1b6b2 <hyperinterval::ieee::Format::power+0x382>
   1b4b2:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
   1b4b7:	48 89 d0             	mov    %rdx,%rax
   1b4ba:	48 21 e8             	and    %rbp,%rax
   1b4bd:	44 89 f1             	mov    %r14d,%ecx
   1b4c0:	48 d3 e8             	shr    %cl,%rax
   1b4c3:	48 89 d1             	mov    %rdx,%rcx
   1b4c6:	4c 21 f9             	and    %r15,%rcx
   1b4c9:	48 85 c0             	test   %rax,%rax
   1b4cc:	89 c6                	mov    %eax,%esi
   1b4ce:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1b4d4:	41 0f 44 f2          	cmove  %r10d,%esi
   1b4d8:	49 0f 45 c4          	cmovne %r12,%rax
   1b4dc:	48 09 c8             	or     %rcx,%rax
   1b4df:	48 85 da             	test   %rbx,%rdx
   1b4e2:	0f 95 c2             	setne  %dl
   1b4e5:	4c 8b 4c 24 58       	mov    0x58(%rsp),%r9
   1b4ea:	4c 89 cf             	mov    %r9,%rdi
   1b4ed:	48 21 ef             	and    %rbp,%rdi
   1b4f0:	44 89 f1             	mov    %r14d,%ecx
   1b4f3:	48 d3 ef             	shr    %cl,%rdi
   1b4f6:	4c 89 c9             	mov    %r9,%rcx
   1b4f9:	4c 21 f9             	and    %r15,%rcx
   1b4fc:	48 85 ff             	test   %rdi,%rdi
   1b4ff:	41 89 f8             	mov    %edi,%r8d
   1b502:	45 0f 44 c2          	cmove  %r10d,%r8d
   1b506:	49 0f 45 fc          	cmovne %r12,%rdi
   1b50a:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
   1b50f:	4c 89 54 24 08       	mov    %r10,0x8(%rsp)
   1b514:	48 09 cf             	or     %rcx,%rdi
   1b517:	49 85 d9             	test   %rbx,%r9
   1b51a:	0f 95 c1             	setne  %cl
   1b51d:	30 d1                	xor    %dl,%cl
   1b51f:	48 f7 e7             	mul    %rdi
   1b522:	4d 89 ef             	mov    %r13,%r15
   1b525:	44 8b 6c 24 6c       	mov    0x6c(%rsp),%r13d
   1b52a:	45 29 e8             	sub    %r13d,%r8d
   1b52d:	41 01 f0             	add    %esi,%r8d
   1b530:	88 4c 24 24          	mov    %cl,0x24(%rsp)
   1b534:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1b539:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1b53e:	44 89 44 24 20       	mov    %r8d,0x20(%rsp)
   1b543:	4c 89 ff             	mov    %r15,%rdi
   1b546:	48 89 de             	mov    %rbx,%rsi
   1b549:	48 89 ea             	mov    %rbp,%rdx
   1b54c:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1b551:	4c 89 e1             	mov    %r12,%rcx
   1b554:	e8 07 06 00 00       	call   1bb60 <hyperinterval::ieee::Format::rounded>
   1b559:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   1b55e:	0f 84 4e 01 00 00    	je     1b6b2 <hyperinterval::ieee::Format::power+0x382>
   1b564:	48 89 de             	mov    %rbx,%rsi
   1b567:	49 89 ee             	mov    %rbp,%r14
   1b56a:	44 89 ed             	mov    %r13d,%ebp
   1b56d:	4c 89 ff             	mov    %r15,%rdi
   1b570:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1b575:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1b57a:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1b581:	00 
   1b582:	4c 8b 54 24 78       	mov    0x78(%rsp),%r10
   1b587:	4c 8b 7c 24 70       	mov    0x70(%rsp),%r15
   1b58c:	ba 02 00 00 00       	mov    $0x2,%edx
   1b591:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
   1b595:	d1 eb                	shr    $1,%ebx
   1b597:	0f 84 6c 01 00 00    	je     1b709 <hyperinterval::ieee::Format::power+0x3d9>
   1b59d:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
   1b5a1:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   1b5a6:	4c 89 c0             	mov    %r8,%rax
   1b5a9:	4c 21 f0             	and    %r14,%rax
   1b5ac:	44 89 d1             	mov    %r10d,%ecx
   1b5af:	48 d3 e8             	shr    %cl,%rax
   1b5b2:	4d 21 f8             	and    %r15,%r8
   1b5b5:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
   1b5b8:	48 85 c0             	test   %rax,%rax
   1b5bb:	49 0f 45 c1          	cmovne %r9,%rax
   1b5bf:	0f 44 ca             	cmove  %edx,%ecx
   1b5c2:	4c 09 c0             	or     %r8,%rax
   1b5c5:	48 f7 e0             	mul    %rax
   1b5c8:	29 e9                	sub    %ebp,%ecx
   1b5ca:	c6 44 24 24 00       	movb   $0x0,0x24(%rsp)
   1b5cf:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1b5d4:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1b5d9:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   1b5dd:	4c 89 f2             	mov    %r14,%rdx
   1b5e0:	4c 89 e1             	mov    %r12,%rcx
   1b5e3:	41 89 ed             	mov    %ebp,%r13d
   1b5e6:	4d 89 cc             	mov    %r9,%r12
   1b5e9:	4c 89 fb             	mov    %r15,%rbx
   1b5ec:	49 89 f7             	mov    %rsi,%r15
   1b5ef:	4c 89 f5             	mov    %r14,%rbp
   1b5f2:	4d 89 d6             	mov    %r10,%r14
   1b5f5:	e8 66 05 00 00       	call   1bb60 <hyperinterval::ieee::Format::rounded>
   1b5fa:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   1b5ff:	0f 85 ad 00 00 00    	jne    1b6b2 <hyperinterval::ieee::Format::power+0x382>
   1b605:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
   1b60a:	48 89 d0             	mov    %rdx,%rax
   1b60d:	48 21 e8             	and    %rbp,%rax
   1b610:	44 89 f1             	mov    %r14d,%ecx
   1b613:	48 d3 e8             	shr    %cl,%rax
   1b616:	48 21 da             	and    %rbx,%rdx
   1b619:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
   1b61c:	48 85 c0             	test   %rax,%rax
   1b61f:	49 0f 45 c4          	cmovne %r12,%rax
   1b623:	be 02 00 00 00       	mov    $0x2,%esi
   1b628:	0f 44 ce             	cmove  %esi,%ecx
   1b62b:	48 09 d0             	or     %rdx,%rax
   1b62e:	48 f7 e0             	mul    %rax
   1b631:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
   1b636:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   1b63b:	44 29 e9             	sub    %r13d,%ecx
   1b63e:	c6 44 24 24 00       	movb   $0x0,0x24(%rsp)
   1b643:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1b648:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1b64d:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   1b651:	48 8d 5c 24 30       	lea    0x30(%rsp),%rbx
   1b656:	48 89 df             	mov    %rbx,%rdi
   1b659:	4c 89 fe             	mov    %r15,%rsi
   1b65c:	48 89 ea             	mov    %rbp,%rdx
   1b65f:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1b664:	4c 89 e1             	mov    %r12,%rcx
   1b667:	e8 f4 04 00 00       	call   1bb60 <hyperinterval::ieee::Format::rounded>
   1b66c:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   1b671:	ba 02 00 00 00       	mov    $0x2,%edx
   1b676:	74 3a                	je     1b6b2 <hyperinterval::ieee::Format::power+0x382>
   1b678:	4c 89 fe             	mov    %r15,%rsi
   1b67b:	49 89 ee             	mov    %rbp,%r14
   1b67e:	44 89 ed             	mov    %r13d,%ebp
   1b681:	48 89 df             	mov    %rbx,%rdi
   1b684:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1b689:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1b68e:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1b695:	00 
   1b696:	4c 8b 54 24 78       	mov    0x78(%rsp),%r10
   1b69b:	4c 8b 7c 24 70       	mov    0x70(%rsp),%r15
   1b6a0:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
   1b6a4:	f6 c3 01             	test   $0x1,%bl
   1b6a7:	0f 85 53 fd ff ff    	jne    1b400 <hyperinterval::ieee::Format::power+0xd0>
   1b6ad:	e9 e3 fe ff ff       	jmp    1b595 <hyperinterval::ieee::Format::power+0x265>
   1b6b2:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   1b6b7:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
   1b6bc:	88 47 01             	mov    %al,0x1(%rdi)
   1b6bf:	b0 01                	mov    $0x1,%al
   1b6c1:	eb 2f                	jmp    1b6f2 <hyperinterval::ieee::Format::power+0x3c2>
   1b6c3:	48 89 d9             	mov    %rbx,%rcx
   1b6c6:	45 20 c1             	and    %r8b,%r9b
   1b6c9:	74 1d                	je     1b6e8 <hyperinterval::ieee::Format::power+0x3b8>
   1b6cb:	48 89 d8             	mov    %rbx,%rax
   1b6ce:	48 31 f0             	xor    %rsi,%rax
   1b6d1:	48 85 db             	test   %rbx,%rbx
   1b6d4:	48 0f 44 c3          	cmove  %rbx,%rax
   1b6d8:	48 31 ce             	xor    %rcx,%rsi
   1b6db:	48 85 c9             	test   %rcx,%rcx
   1b6de:	48 0f 44 f1          	cmove  %rcx,%rsi
   1b6e2:	48 89 c1             	mov    %rax,%rcx
   1b6e5:	48 89 f3             	mov    %rsi,%rbx
   1b6e8:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1b6ec:	48 89 5f 10          	mov    %rbx,0x10(%rdi)
   1b6f0:	31 c0                	xor    %eax,%eax
   1b6f2:	88 07                	mov    %al,(%rdi)
   1b6f4:	48 89 f8             	mov    %rdi,%rax
   1b6f7:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
   1b6fe:	5b                   	pop    %rbx
   1b6ff:	41 5c                	pop    %r12
   1b701:	41 5d                	pop    %r13
   1b703:	41 5e                	pop    %r14
   1b705:	41 5f                	pop    %r15
   1b707:	5d                   	pop    %rbp
   1b708:	c3                   	ret
   1b709:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
   1b70e:	44 8b 44 24 68       	mov    0x68(%rsp),%r8d
   1b713:	44 0f b6 4c 24 03    	movzbl 0x3(%rsp),%r9d
   1b719:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
   1b71e:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b723:	45 20 c1             	and    %r8b,%r9b
   1b726:	75 a3                	jne    1b6cb <hyperinterval::ieee::Format::power+0x39b>
   1b728:	eb be                	jmp    1b6e8 <hyperinterval::ieee::Format::power+0x3b8>
   1b72a:	cc                   	int3
   1b72b:	cc                   	int3
   1b72c:	cc                   	int3
   1b72d:	cc                   	int3
   1b72e:	cc                   	int3
   1b72f:	cc                   	int3

hyperinterval::ieee::Format::affine:
   1b730:	55                   	push   %rbp
   1b731:	41 57                	push   %r15
   1b733:	41 56                	push   %r14
   1b735:	41 55                	push   %r13
   1b737:	41 54                	push   %r12
   1b739:	53                   	push   %rbx
   1b73a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   1b741:	48 89 c8             	mov    %rcx,%rax
   1b744:	49 89 d6             	mov    %rdx,%r14
   1b747:	b9 40 00 00 00       	mov    $0x40,%ecx
   1b74c:	f3 48 0f bc ca       	tzcnt  %rdx,%rcx
   1b751:	48 89 c2             	mov    %rax,%rdx
   1b754:	4c 21 f2             	and    %r14,%rdx
   1b757:	48 d3 ea             	shr    %cl,%rdx
   1b75a:	41 bb 01 00 00 00    	mov    $0x1,%r11d
   1b760:	49 d3 e3             	shl    %cl,%r11
   1b763:	4d 8d 7b ff          	lea    -0x1(%r11),%r15
   1b767:	4c 89 fb             	mov    %r15,%rbx
   1b76a:	48 21 c3             	and    %rax,%rbx
   1b76d:	48 85 d2             	test   %rdx,%rdx
   1b770:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1b776:	89 d5                	mov    %edx,%ebp
   1b778:	41 0f 44 ea          	cmove  %r10d,%ebp
   1b77c:	48 89 3c 24          	mov    %rdi,(%rsp)
   1b780:	49 0f 45 d3          	cmovne %r11,%rdx
   1b784:	4d 89 f5             	mov    %r14,%r13
   1b787:	49 d3 ed             	shr    %cl,%r13
   1b78a:	48 09 da             	or     %rbx,%rdx
   1b78d:	49 d1 ed             	shr    $1,%r13
   1b790:	41 01 cd             	add    %ecx,%r13d
   1b793:	44 29 ed             	sub    %r13d,%ebp
   1b796:	48 85 f0             	test   %rsi,%rax
   1b799:	0f 95 c3             	setne  %bl
   1b79c:	4c 89 c0             	mov    %r8,%rax
   1b79f:	4c 21 f0             	and    %r14,%rax
   1b7a2:	48 d3 e8             	shr    %cl,%rax
   1b7a5:	4d 89 fc             	mov    %r15,%r12
   1b7a8:	4d 21 c4             	and    %r8,%r12
   1b7ab:	48 85 c0             	test   %rax,%rax
   1b7ae:	89 c7                	mov    %eax,%edi
   1b7b0:	41 0f 44 fa          	cmove  %r10d,%edi
   1b7b4:	49 0f 45 c3          	cmovne %r11,%rax
   1b7b8:	4c 09 e0             	or     %r12,%rax
   1b7bb:	44 29 ef             	sub    %r13d,%edi
   1b7be:	49 85 f0             	test   %rsi,%r8
   1b7c1:	41 0f 95 c0          	setne  %r8b
   1b7c5:	01 ef                	add    %ebp,%edi
   1b7c7:	4c 89 f5             	mov    %r14,%rbp
   1b7ca:	4d 89 cc             	mov    %r9,%r12
   1b7cd:	4d 21 f4             	and    %r14,%r12
   1b7d0:	49 d3 ec             	shr    %cl,%r12
   1b7d3:	41 30 d8             	xor    %bl,%r8b
   1b7d6:	48 f7 e2             	mul    %rdx
   1b7d9:	4d 21 cf             	and    %r9,%r15
   1b7dc:	4d 85 e4             	test   %r12,%r12
   1b7df:	45 0f 45 d4          	cmovne %r12d,%r10d
   1b7e3:	4d 0f 45 e3          	cmovne %r11,%r12
   1b7e7:	4d 09 fc             	or     %r15,%r12
   1b7ea:	45 29 ea             	sub    %r13d,%r10d
   1b7ed:	49 85 f1             	test   %rsi,%r9
   1b7f0:	0f 95 84 24 84 00 00 	setne  0x84(%rsp)
   1b7f7:	00 
   1b7f8:	0f 95 c3             	setne  %bl
   1b7fb:	48 89 c1             	mov    %rax,%rcx
   1b7fe:	48 09 d1             	or     %rdx,%rcx
   1b801:	44 88 44 24 64       	mov    %r8b,0x64(%rsp)
   1b806:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   1b80b:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1b810:	89 7c 24 60          	mov    %edi,0x60(%rsp)
   1b814:	4c 89 64 24 70       	mov    %r12,0x70(%rsp)
   1b819:	48 c7 44 24 78 00 00 	movq   $0x0,0x78(%rsp)
   1b820:	00 00 
   1b822:	44 89 94 24 80 00 00 	mov    %r10d,0x80(%rsp)
   1b829:	00 
   1b82a:	74 79                	je     1b8a5 <hyperinterval::ieee::Format::affine+0x175>
   1b82c:	4d 85 e4             	test   %r12,%r12
   1b82f:	74 7b                	je     1b8ac <hyperinterval::ieee::Format::affine+0x17c>
   1b831:	48 89 6c 24 30       	mov    %rbp,0x30(%rsp)
   1b836:	48 0f bd ca          	bsr    %rdx,%rcx
   1b83a:	83 f1 3f             	xor    $0x3f,%ecx
   1b83d:	4c 0f bd d8          	bsr    %rax,%r11
   1b841:	41 83 f3 3f          	xor    $0x3f,%r11d
   1b845:	41 83 cb 40          	or     $0x40,%r11d
   1b849:	48 85 d2             	test   %rdx,%rdx
   1b84c:	44 0f 45 d9          	cmovne %ecx,%r11d
   1b850:	41 83 f3 7f          	xor    $0x7f,%r11d
   1b854:	41 01 fb             	add    %edi,%r11d
   1b857:	4d 0f bd fc          	bsr    %r12,%r15
   1b85b:	41 83 f7 3f          	xor    $0x3f,%r15d
   1b85f:	41 83 cf 40          	or     $0x40,%r15d
   1b863:	41 83 f7 7f          	xor    $0x7f,%r15d
   1b867:	45 01 d7             	add    %r10d,%r15d
   1b86a:	45 39 df             	cmp    %r11d,%r15d
   1b86d:	45 0f 4e fb          	cmovle %r11d,%r15d
   1b871:	41 83 c7 82          	add    $0xffffff82,%r15d
   1b875:	44 29 ff             	sub    %r15d,%edi
   1b878:	78 4b                	js     1b8c5 <hyperinterval::ieee::Format::affine+0x195>
   1b87a:	89 f9                	mov    %edi,%ecx
   1b87c:	48 0f a5 c2          	shld   %cl,%rax,%rdx
   1b880:	48 d3 e0             	shl    %cl,%rax
   1b883:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   1b88a:	00 00 
   1b88c:	40 f6 c7 40          	test   $0x40,%dil
   1b890:	48 0f 45 d0          	cmovne %rax,%rdx
   1b894:	bd 00 00 00 00       	mov    $0x0,%ebp
   1b899:	48 0f 44 e8          	cmove  %rax,%rbp
   1b89d:	49 89 d3             	mov    %rdx,%r11
   1b8a0:	e9 9b 00 00 00       	jmp    1b940 <hyperinterval::ieee::Format::affine+0x210>
   1b8a5:	48 8d 4c 24 70       	lea    0x70(%rsp),%rcx
   1b8aa:	eb 05                	jmp    1b8b1 <hyperinterval::ieee::Format::affine+0x181>
   1b8ac:	48 8d 4c 24 50       	lea    0x50(%rsp),%rcx
   1b8b1:	4c 8b 34 24          	mov    (%rsp),%r14
   1b8b5:	4c 89 f7             	mov    %r14,%rdi
   1b8b8:	48 89 ea             	mov    %rbp,%rdx
   1b8bb:	e8 a0 02 00 00       	call   1bb60 <hyperinterval::ieee::Format::rounded>
   1b8c0:	e9 43 02 00 00       	jmp    1bb08 <hyperinterval::ieee::Format::affine+0x3d8>
   1b8c5:	f7 df                	neg    %edi
   1b8c7:	bd 00 00 00 00       	mov    $0x0,%ebp
   1b8cc:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   1b8d2:	83 ff 7f             	cmp    $0x7f,%edi
   1b8d5:	7f 5b                	jg     1b932 <hyperinterval::ieee::Format::affine+0x202>
   1b8d7:	48 89 c5             	mov    %rax,%rbp
   1b8da:	89 f9                	mov    %edi,%ecx
   1b8dc:	48 0f ad d5          	shrd   %cl,%rdx,%rbp
   1b8e0:	49 89 d3             	mov    %rdx,%r11
   1b8e3:	49 d3 eb             	shr    %cl,%r11
   1b8e6:	41 89 dd             	mov    %ebx,%r13d
   1b8e9:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
   1b8f0:	48 d3 e3             	shl    %cl,%rbx
   1b8f3:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
   1b8fa:	40 f6 c7 40          	test   $0x40,%dil
   1b8fe:	49 0f 45 eb          	cmovne %r11,%rbp
   1b902:	41 be 00 00 00 00    	mov    $0x0,%r14d
   1b908:	4d 0f 45 de          	cmovne %r14,%r11
   1b90c:	48 0f 45 cb          	cmovne %rbx,%rcx
   1b910:	bf 00 00 00 00       	mov    $0x0,%edi
   1b915:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
   1b91a:	49 0f 45 de          	cmovne %r14,%rbx
   1b91e:	48 f7 d3             	not    %rbx
   1b921:	48 f7 d1             	not    %rcx
   1b924:	48 21 d1             	and    %rdx,%rcx
   1b927:	48 21 c3             	and    %rax,%rbx
   1b92a:	48 09 cb             	or     %rcx,%rbx
   1b92d:	44 89 eb             	mov    %r13d,%ebx
   1b930:	74 0e                	je     1b940 <hyperinterval::ieee::Format::affine+0x210>
   1b932:	41 0f b6 c0          	movzbl %r8b,%eax
   1b936:	f7 d8                	neg    %eax
   1b938:	83 c8 01             	or     $0x1,%eax
   1b93b:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
   1b940:	45 29 fa             	sub    %r15d,%r10d
   1b943:	78 20                	js     1b965 <hyperinterval::ieee::Format::affine+0x235>
   1b945:	31 d2                	xor    %edx,%edx
   1b947:	44 89 d1             	mov    %r10d,%ecx
   1b94a:	4c 0f a5 e2          	shld   %cl,%r12,%rdx
   1b94e:	49 d3 e4             	shl    %cl,%r12
   1b951:	45 31 ed             	xor    %r13d,%r13d
   1b954:	41 f6 c2 40          	test   $0x40,%r10b
   1b958:	49 0f 45 d4          	cmovne %r12,%rdx
   1b95c:	4d 0f 45 e5          	cmovne %r13,%r12
   1b960:	4c 89 e0             	mov    %r12,%rax
   1b963:	eb 58                	jmp    1b9bd <hyperinterval::ieee::Format::affine+0x28d>
   1b965:	41 f7 da             	neg    %r10d
   1b968:	45 31 ed             	xor    %r13d,%r13d
   1b96b:	b8 00 00 00 00       	mov    $0x0,%eax
   1b970:	41 83 fa 7f          	cmp    $0x7f,%r10d
   1b974:	7f 2d                	jg     1b9a3 <hyperinterval::ieee::Format::affine+0x273>
   1b976:	4c 89 e0             	mov    %r12,%rax
   1b979:	44 89 d1             	mov    %r10d,%ecx
   1b97c:	4c 0f ad e8          	shrd   %cl,%r13,%rax
   1b980:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
   1b987:	48 d3 e7             	shl    %cl,%rdi
   1b98a:	41 f6 c2 40          	test   $0x40,%r10b
   1b98e:	49 0f 45 c5          	cmovne %r13,%rax
   1b992:	49 0f 45 fd          	cmovne %r13,%rdi
   1b996:	48 f7 d7             	not    %rdi
   1b999:	ba 00 00 00 00       	mov    $0x0,%edx
   1b99e:	4c 85 e7             	test   %r12,%rdi
   1b9a1:	74 1a                	je     1b9bd <hyperinterval::ieee::Format::affine+0x28d>
   1b9a3:	4c 89 ea             	mov    %r13,%rdx
   1b9a6:	4c 89 c9             	mov    %r9,%rcx
   1b9a9:	48 21 f1             	and    %rsi,%rcx
   1b9ac:	31 ff                	xor    %edi,%edi
   1b9ae:	48 f7 d9             	neg    %rcx
   1b9b1:	40 0f 93 c7          	setae  %dil
   1b9b5:	44 8d 2c 7d ff ff ff 	lea    -0x1(,%rdi,2),%r13d
   1b9bc:	ff 
   1b9bd:	49 85 f1             	test   %rsi,%r9
   1b9c0:	0f 95 c1             	setne  %cl
   1b9c3:	41 38 c8             	cmp    %cl,%r8b
   1b9c6:	74 16                	je     1b9de <hyperinterval::ieee::Format::affine+0x2ae>
   1b9c8:	48 39 c5             	cmp    %rax,%rbp
   1b9cb:	4c 89 d9             	mov    %r11,%rcx
   1b9ce:	48 19 d1             	sbb    %rdx,%rcx
   1b9d1:	73 13                	jae    1b9e6 <hyperinterval::ieee::Format::affine+0x2b6>
   1b9d3:	48 29 e8             	sub    %rbp,%rax
   1b9d6:	4c 19 da             	sbb    %r11,%rdx
   1b9d9:	41 89 d8             	mov    %ebx,%r8d
   1b9dc:	eb 14                	jmp    1b9f2 <hyperinterval::ieee::Format::affine+0x2c2>
   1b9de:	48 01 e8             	add    %rbp,%rax
   1b9e1:	4c 11 da             	adc    %r11,%rdx
   1b9e4:	eb 0c                	jmp    1b9f2 <hyperinterval::ieee::Format::affine+0x2c2>
   1b9e6:	48 29 c5             	sub    %rax,%rbp
   1b9e9:	49 19 d3             	sbb    %rdx,%r11
   1b9ec:	48 89 e8             	mov    %rbp,%rax
   1b9ef:	4c 89 da             	mov    %r11,%rdx
   1b9f2:	44 88 44 24 24       	mov    %r8b,0x24(%rsp)
   1b9f7:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1b9fc:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1ba01:	44 89 7c 24 20       	mov    %r15d,0x20(%rsp)
   1ba06:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1ba0b:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1ba10:	49 89 f4             	mov    %rsi,%r12
   1ba13:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
   1ba18:	48 89 da             	mov    %rbx,%rdx
   1ba1b:	e8 40 01 00 00       	call   1bb60 <hyperinterval::ieee::Format::rounded>
   1ba20:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   1ba25:	75 16                	jne    1ba3d <hyperinterval::ieee::Format::affine+0x30d>
   1ba27:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
   1ba2c:	4c 8b 34 24          	mov    (%rsp),%r14
   1ba30:	41 88 46 01          	mov    %al,0x1(%r14)
   1ba34:	41 c6 06 01          	movb   $0x1,(%r14)
   1ba38:	e9 cb 00 00 00       	jmp    1bb08 <hyperinterval::ieee::Format::affine+0x3d8>
   1ba3d:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
   1ba42:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
   1ba47:	49 39 c7             	cmp    %rax,%r15
   1ba4a:	0f 85 a8 00 00 00    	jne    1baf8 <hyperinterval::ieee::Format::affine+0x3c8>
   1ba50:	44 03 6c 24 08       	add    0x8(%rsp),%r13d
   1ba55:	41 83 fd 01          	cmp    $0x1,%r13d
   1ba59:	74 60                	je     1babb <hyperinterval::ieee::Format::affine+0x38b>
   1ba5b:	41 83 fd ff          	cmp    $0xffffffff,%r13d
   1ba5f:	0f 85 93 00 00 00    	jne    1baf8 <hyperinterval::ieee::Format::affine+0x3c8>
   1ba65:	4c 89 f8             	mov    %r15,%rax
   1ba68:	4c 89 e6             	mov    %r12,%rsi
   1ba6b:	4c 31 e0             	xor    %r12,%rax
   1ba6e:	4d 85 ff             	test   %r15,%r15
   1ba71:	49 0f 44 c7          	cmove  %r15,%rax
   1ba75:	48 89 c1             	mov    %rax,%rcx
   1ba78:	4c 21 e1             	and    %r12,%rcx
   1ba7b:	31 d2                	xor    %edx,%edx
   1ba7d:	48 f7 d9             	neg    %rcx
   1ba80:	0f 93 c2             	setae  %dl
   1ba83:	48 8d 0c 50          	lea    (%rax,%rdx,2),%rcx
   1ba87:	48 ff c9             	dec    %rcx
   1ba8a:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1ba8f:	48 89 da             	mov    %rbx,%rdx
   1ba92:	e8 89 00 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1ba97:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1ba9c:	75 49                	jne    1bae7 <hyperinterval::ieee::Format::affine+0x3b7>
   1ba9e:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1baa3:	49 31 c4             	xor    %rax,%r12
   1baa6:	48 85 c0             	test   %rax,%rax
   1baa9:	4c 0f 44 e0          	cmove  %rax,%r12
   1baad:	4c 8b 34 24          	mov    (%rsp),%r14
   1bab1:	4d 89 66 08          	mov    %r12,0x8(%r14)
   1bab5:	4d 89 7e 10          	mov    %r15,0x10(%r14)
   1bab9:	eb 49                	jmp    1bb04 <hyperinterval::ieee::Format::affine+0x3d4>
   1babb:	4c 89 e6             	mov    %r12,%rsi
   1babe:	4c 89 f8             	mov    %r15,%rax
   1bac1:	4c 21 e0             	and    %r12,%rax
   1bac4:	31 c9                	xor    %ecx,%ecx
   1bac6:	48 f7 d8             	neg    %rax
   1bac9:	0f 93 c1             	setae  %cl
   1bacc:	49 8d 0c 4f          	lea    (%r15,%rcx,2),%rcx
   1bad0:	48 ff c9             	dec    %rcx
   1bad3:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1bad8:	48 89 da             	mov    %rbx,%rdx
   1badb:	e8 40 00 00 00       	call   1bb20 <hyperinterval::ieee::Format::finite>
   1bae0:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1bae5:	74 0c                	je     1baf3 <hyperinterval::ieee::Format::affine+0x3c3>
   1bae7:	4c 8b 34 24          	mov    (%rsp),%r14
   1baeb:	66 41 c7 06 01 03    	movw   $0x301,(%r14)
   1baf1:	eb 15                	jmp    1bb08 <hyperinterval::ieee::Format::affine+0x3d8>
   1baf3:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1baf8:	4c 8b 34 24          	mov    (%rsp),%r14
   1bafc:	4d 89 7e 08          	mov    %r15,0x8(%r14)
   1bb00:	49 89 46 10          	mov    %rax,0x10(%r14)
   1bb04:	41 c6 06 00          	movb   $0x0,(%r14)
   1bb08:	4c 89 f0             	mov    %r14,%rax
   1bb0b:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1bb12:	5b                   	pop    %rbx
   1bb13:	41 5c                	pop    %r12
   1bb15:	41 5d                	pop    %r13
   1bb17:	41 5e                	pop    %r14
   1bb19:	41 5f                	pop    %r15
   1bb1b:	5d                   	pop    %rbp
   1bb1c:	c3                   	ret
   1bb1d:	cc                   	int3
   1bb1e:	cc                   	int3
   1bb1f:	cc                   	int3

hyperinterval::ieee::Format::finite:
   1bb20:	48 89 f8             	mov    %rdi,%rax
   1bb23:	48 89 cf             	mov    %rcx,%rdi
   1bb26:	48 f7 d7             	not    %rdi
   1bb29:	48 85 fa             	test   %rdi,%rdx
   1bb2c:	75 09                	jne    1bb37 <hyperinterval::ieee::Format::finite+0x17>
   1bb2e:	c6 40 01 00          	movb   $0x0,0x1(%rax)
   1bb32:	b1 01                	mov    $0x1,%cl
   1bb34:	88 08                	mov    %cl,(%rax)
   1bb36:	c3                   	ret
   1bb37:	48 ff ce             	dec    %rsi
   1bb3a:	48 85 f1             	test   %rsi,%rcx
   1bb3d:	74 09                	je     1bb48 <hyperinterval::ieee::Format::finite+0x28>
   1bb3f:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1bb43:	31 c9                	xor    %ecx,%ecx
   1bb45:	88 08                	mov    %cl,(%rax)
   1bb47:	c3                   	ret
   1bb48:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
   1bb4f:	00 
   1bb50:	31 c9                	xor    %ecx,%ecx
   1bb52:	88 08                	mov    %cl,(%rax)
   1bb54:	c3                   	ret
   1bb55:	cc                   	int3
   1bb56:	cc                   	int3
   1bb57:	cc                   	int3
   1bb58:	cc                   	int3
   1bb59:	cc                   	int3
   1bb5a:	cc                   	int3
   1bb5b:	cc                   	int3
   1bb5c:	cc                   	int3
   1bb5d:	cc                   	int3
   1bb5e:	cc                   	int3
   1bb5f:	cc                   	int3

hyperinterval::ieee::Format::rounded:
   1bb60:	48 89 c8             	mov    %rcx,%rax
   1bb63:	4c 8b 11             	mov    (%rcx),%r10
   1bb66:	4c 8b 59 08          	mov    0x8(%rcx),%r11
   1bb6a:	4c 89 d1             	mov    %r10,%rcx
   1bb6d:	4c 09 d9             	or     %r11,%rcx
   1bb70:	74 79                	je     1bbeb <hyperinterval::ieee::Format::rounded+0x8b>
   1bb72:	55                   	push   %rbp
   1bb73:	41 57                	push   %r15
   1bb75:	41 56                	push   %r14
   1bb77:	41 55                	push   %r13
   1bb79:	41 54                	push   %r12
   1bb7b:	53                   	push   %rbx
   1bb7c:	8b 68 10             	mov    0x10(%rax),%ebp
   1bb7f:	49 0f bd cb          	bsr    %r11,%rcx
   1bb83:	83 f1 3f             	xor    $0x3f,%ecx
   1bb86:	4d 0f bd f2          	bsr    %r10,%r14
   1bb8a:	41 83 f6 3f          	xor    $0x3f,%r14d
   1bb8e:	41 83 ce 40          	or     $0x40,%r14d
   1bb92:	4d 85 db             	test   %r11,%r11
   1bb95:	44 0f 45 f1          	cmovne %ecx,%r14d
   1bb99:	bb 40 00 00 00       	mov    $0x40,%ebx
   1bb9e:	f3 48 0f bc da       	tzcnt  %rdx,%rbx
   1bba3:	41 89 d8             	mov    %ebx,%r8d
   1bba6:	41 83 e0 3f          	and    $0x3f,%r8d
   1bbaa:	44 89 c1             	mov    %r8d,%ecx
   1bbad:	48 d3 ea             	shr    %cl,%rdx
   1bbb0:	41 83 f6 7f          	xor    $0x7f,%r14d
   1bbb4:	41 01 ee             	add    %ebp,%r14d
   1bbb7:	48 d1 ea             	shr    $1,%rdx
   1bbba:	41 39 d6             	cmp    %edx,%r14d
   1bbbd:	0f 8f 54 01 00 00    	jg     1bd17 <hyperinterval::ieee::Format::rounded+0x1b7>
   1bbc3:	44 8d 2c 13          	lea    (%rbx,%rdx,1),%r13d
   1bbc7:	b9 01 00 00 00       	mov    $0x1,%ecx
   1bbcc:	44 29 e9             	sub    %r13d,%ecx
   1bbcf:	41 29 de             	sub    %ebx,%r14d
   1bbd2:	41 39 ce             	cmp    %ecx,%r14d
   1bbd5:	44 0f 4e f1          	cmovle %ecx,%r14d
   1bbd9:	44 89 f1             	mov    %r14d,%ecx
   1bbdc:	29 e9                	sub    %ebp,%ecx
   1bbde:	83 f9 7f             	cmp    $0x7f,%ecx
   1bbe1:	7e 13                	jle    1bbf6 <hyperinterval::ieee::Format::rounded+0x96>
   1bbe3:	41 b4 01             	mov    $0x1,%r12b
   1bbe6:	e9 ea 00 00 00       	jmp    1bcd5 <hyperinterval::ieee::Format::rounded+0x175>
   1bbeb:	c6 07 00             	movb   $0x0,(%rdi)
   1bbee:	0f 57 c0             	xorps  %xmm0,%xmm0
   1bbf1:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1bbf5:	c3                   	ret
   1bbf6:	85 c9                	test   %ecx,%ecx
   1bbf8:	4c 89 6c 24 f0       	mov    %r13,-0x10(%rsp)
   1bbfd:	0f 8e ad 00 00 00    	jle    1bcb0 <hyperinterval::ieee::Format::rounded+0x150>
   1bc03:	4d 89 d7             	mov    %r10,%r15
   1bc06:	4d 0f ad df          	shrd   %cl,%r11,%r15
   1bc0a:	4d 89 dd             	mov    %r11,%r13
   1bc0d:	49 d3 ed             	shr    %cl,%r13
   1bc10:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
   1bc17:	49 d3 e4             	shl    %cl,%r12
   1bc1a:	48 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%rbp
   1bc21:	45 31 c9             	xor    %r9d,%r9d
   1bc24:	f6 c1 40             	test   $0x40,%cl
   1bc27:	4d 0f 45 fd          	cmovne %r13,%r15
   1bc2b:	4d 0f 45 e9          	cmovne %r9,%r13
   1bc2f:	49 0f 45 ec          	cmovne %r12,%rbp
   1bc33:	4d 0f 45 e1          	cmovne %r9,%r12
   1bc37:	49 f7 d4             	not    %r12
   1bc3a:	48 f7 d5             	not    %rbp
   1bc3d:	4c 21 dd             	and    %r11,%rbp
   1bc40:	4d 21 d4             	and    %r10,%r12
   1bc43:	49 09 ec             	or     %rbp,%r12
   1bc46:	41 0f 95 c4          	setne  %r12b
   1bc4a:	4d 89 eb             	mov    %r13,%r11
   1bc4d:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1bc52:	4c 89 f9             	mov    %r15,%rcx
   1bc55:	4c 09 d9             	or     %r11,%rcx
   1bc58:	74 7b                	je     1bcd5 <hyperinterval::ieee::Format::rounded+0x175>
   1bc5a:	49 0f bd cb          	bsr    %r11,%rcx
   1bc5e:	83 f1 3f             	xor    $0x3f,%ecx
   1bc61:	4d 0f bd ef          	bsr    %r15,%r13
   1bc65:	41 83 f5 3f          	xor    $0x3f,%r13d
   1bc69:	41 83 cd 40          	or     $0x40,%r13d
   1bc6d:	4d 85 db             	test   %r11,%r11
   1bc70:	44 0f 45 e9          	cmovne %ecx,%r13d
   1bc74:	41 83 f5 7f          	xor    $0x7f,%r13d
   1bc78:	43 8d 2c 2e          	lea    (%r14,%r13,1),%ebp
   1bc7c:	39 d5                	cmp    %edx,%ebp
   1bc7e:	0f 8f 93 00 00 00    	jg     1bd17 <hyperinterval::ieee::Format::rounded+0x1b7>
   1bc84:	b9 01 00 00 00       	mov    $0x1,%ecx
   1bc89:	29 d1                	sub    %edx,%ecx
   1bc8b:	39 cd                	cmp    %ecx,%ebp
   1bc8d:	0f 8d 53 01 00 00    	jge    1bde6 <hyperinterval::ieee::Format::rounded+0x286>
   1bc93:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1bc98:	43 8d 0c 2e          	lea    (%r14,%r13,1),%ecx
   1bc9c:	fe c9                	dec    %cl
   1bc9e:	4d 89 f9             	mov    %r15,%r9
   1bca1:	49 d3 e1             	shl    %cl,%r9
   1bca4:	45 31 d2             	xor    %r10d,%r10d
   1bca7:	f6 c1 40             	test   $0x40,%cl
   1bcaa:	4d 0f 44 d1          	cmove  %r9,%r10
   1bcae:	eb 2e                	jmp    1bcde <hyperinterval::ieee::Format::rounded+0x17e>
   1bcb0:	f6 d9                	neg    %cl
   1bcb2:	4d 0f a5 d3          	shld   %cl,%r10,%r11
   1bcb6:	49 d3 e2             	shl    %cl,%r10
   1bcb9:	45 31 e4             	xor    %r12d,%r12d
   1bcbc:	f6 c1 40             	test   $0x40,%cl
   1bcbf:	4d 0f 45 da          	cmovne %r10,%r11
   1bcc3:	41 bf 00 00 00 00    	mov    $0x0,%r15d
   1bcc9:	4d 0f 44 fa          	cmove  %r10,%r15
   1bccd:	4c 89 f9             	mov    %r15,%rcx
   1bcd0:	4c 09 d9             	or     %r11,%rcx
   1bcd3:	75 85                	jne    1bc5a <hyperinterval::ieee::Format::rounded+0xfa>
   1bcd5:	45 31 ff             	xor    %r15d,%r15d
   1bcd8:	45 31 db             	xor    %r11d,%r11d
   1bcdb:	45 31 d2             	xor    %r10d,%r10d
   1bcde:	45 0f b6 e4          	movzbl %r12b,%r12d
   1bce2:	4d 01 fc             	add    %r15,%r12
   1bce5:	49 83 d3 00          	adc    $0x0,%r11
   1bce9:	4c 89 e1             	mov    %r12,%rcx
   1bcec:	4c 09 d9             	or     %r11,%rcx
   1bcef:	74 30                	je     1bd21 <hyperinterval::ieee::Format::rounded+0x1c1>
   1bcf1:	49 0f bd cb          	bsr    %r11,%rcx
   1bcf5:	83 f1 3f             	xor    $0x3f,%ecx
   1bcf8:	4d 0f bd fc          	bsr    %r12,%r15
   1bcfc:	41 83 f7 3f          	xor    $0x3f,%r15d
   1bd00:	41 83 cf 40          	or     $0x40,%r15d
   1bd04:	4d 85 db             	test   %r11,%r11
   1bd07:	44 0f 45 f9          	cmovne %ecx,%r15d
   1bd0b:	41 83 f7 7f          	xor    $0x7f,%r15d
   1bd0f:	43 8d 2c 37          	lea    (%r15,%r14,1),%ebp
   1bd13:	39 d5                	cmp    %edx,%ebp
   1bd15:	7e 1b                	jle    1bd32 <hyperinterval::ieee::Format::rounded+0x1d2>
   1bd17:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   1bd1c:	e9 ba 00 00 00       	jmp    1bddb <hyperinterval::ieee::Format::rounded+0x27b>
   1bd21:	31 d2                	xor    %edx,%edx
   1bd23:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1bd27:	0f 84 86 00 00 00    	je     1bdb3 <hyperinterval::ieee::Format::rounded+0x253>
   1bd2d:	e9 9e 00 00 00       	jmp    1bdd0 <hyperinterval::ieee::Format::rounded+0x270>
   1bd32:	b9 01 00 00 00       	mov    $0x1,%ecx
   1bd37:	29 d1                	sub    %edx,%ecx
   1bd39:	39 cd                	cmp    %ecx,%ebp
   1bd3b:	7d 1e                	jge    1bd5b <hyperinterval::ieee::Format::rounded+0x1fb>
   1bd3d:	45 01 f5             	add    %r14d,%r13d
   1bd40:	41 fe cd             	dec    %r13b
   1bd43:	44 89 e9             	mov    %r13d,%ecx
   1bd46:	49 d3 e4             	shl    %cl,%r12
   1bd49:	31 d2                	xor    %edx,%edx
   1bd4b:	41 f6 c5 40          	test   $0x40,%r13b
   1bd4f:	49 0f 44 d4          	cmove  %r12,%rdx
   1bd53:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1bd57:	74 5a                	je     1bdb3 <hyperinterval::ieee::Format::rounded+0x253>
   1bd59:	eb 75                	jmp    1bdd0 <hyperinterval::ieee::Format::rounded+0x270>
   1bd5b:	89 d9                	mov    %ebx,%ecx
   1bd5d:	44 29 f9             	sub    %r15d,%ecx
   1bd60:	41 89 c9             	mov    %ecx,%r9d
   1bd63:	41 f7 d9             	neg    %r9d
   1bd66:	4d 89 e6             	mov    %r12,%r14
   1bd69:	49 d3 e6             	shl    %cl,%r14
   1bd6c:	45 31 ed             	xor    %r13d,%r13d
   1bd6f:	f6 c1 40             	test   $0x40,%cl
   1bd72:	4d 0f 44 ee          	cmove  %r14,%r13
   1bd76:	44 89 c9             	mov    %r9d,%ecx
   1bd79:	4d 0f ad dc          	shrd   %cl,%r11,%r12
   1bd7d:	49 d3 eb             	shr    %cl,%r11
   1bd80:	41 f6 c1 40          	test   $0x40,%r9b
   1bd84:	4d 0f 44 dc          	cmove  %r12,%r11
   1bd88:	44 39 fb             	cmp    %r15d,%ebx
   1bd8b:	4d 0f 43 dd          	cmovae %r13,%r11
   1bd8f:	01 d5                	add    %edx,%ebp
   1bd91:	4c 63 cd             	movslq %ebp,%r9
   1bd94:	44 89 c1             	mov    %r8d,%ecx
   1bd97:	49 d3 e1             	shl    %cl,%r9
   1bd9a:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
   1bda1:	48 d3 e2             	shl    %cl,%rdx
   1bda4:	48 f7 d2             	not    %rdx
   1bda7:	4c 21 da             	and    %r11,%rdx
   1bdaa:	4c 09 ca             	or     %r9,%rdx
   1bdad:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1bdb1:	75 1d                	jne    1bdd0 <hyperinterval::ieee::Format::rounded+0x270>
   1bdb3:	48 89 d0             	mov    %rdx,%rax
   1bdb6:	48 31 f0             	xor    %rsi,%rax
   1bdb9:	48 85 d2             	test   %rdx,%rdx
   1bdbc:	48 0f 44 c2          	cmove  %rdx,%rax
   1bdc0:	4c 31 d6             	xor    %r10,%rsi
   1bdc3:	4d 85 d2             	test   %r10,%r10
   1bdc6:	49 0f 44 f2          	cmove  %r10,%rsi
   1bdca:	49 89 c2             	mov    %rax,%r10
   1bdcd:	48 89 f2             	mov    %rsi,%rdx
   1bdd0:	4c 89 57 08          	mov    %r10,0x8(%rdi)
   1bdd4:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   1bdd8:	c6 07 00             	movb   $0x0,(%rdi)
   1bddb:	5b                   	pop    %rbx
   1bddc:	41 5c                	pop    %r12
   1bdde:	41 5d                	pop    %r13
   1bde0:	41 5e                	pop    %r14
   1bde2:	41 5f                	pop    %r15
   1bde4:	5d                   	pop    %rbp
   1bde5:	c3                   	ret
   1bde6:	89 d9                	mov    %ebx,%ecx
   1bde8:	44 29 e9             	sub    %r13d,%ecx
   1bdeb:	4d 89 f9             	mov    %r15,%r9
   1bdee:	49 d3 e1             	shl    %cl,%r9
   1bdf1:	41 89 ca             	mov    %ecx,%r10d
   1bdf4:	41 f7 da             	neg    %r10d
   1bdf7:	48 c7 44 24 e8 00 00 	movq   $0x0,-0x18(%rsp)
   1bdfe:	00 00 
   1be00:	f6 c1 40             	test   $0x40,%cl
   1be03:	48 8b 4c 24 e8       	mov    -0x18(%rsp),%rcx
   1be08:	49 0f 44 c9          	cmove  %r9,%rcx
   1be0c:	48 89 4c 24 e8       	mov    %rcx,-0x18(%rsp)
   1be11:	4d 89 f9             	mov    %r15,%r9
   1be14:	44 89 d1             	mov    %r10d,%ecx
   1be17:	4d 0f ad d9          	shrd   %cl,%r11,%r9
   1be1b:	4c 89 4c 24 f8       	mov    %r9,-0x8(%rsp)
   1be20:	4d 89 d9             	mov    %r11,%r9
   1be23:	49 d3 e9             	shr    %cl,%r9
   1be26:	41 f6 c2 40          	test   $0x40,%r10b
   1be2a:	4c 0f 44 4c 24 f8    	cmove  -0x8(%rsp),%r9
   1be30:	44 39 eb             	cmp    %r13d,%ebx
   1be33:	4c 0f 43 4c 24 e8    	cmovae -0x18(%rsp),%r9
   1be39:	01 d5                	add    %edx,%ebp
   1be3b:	4c 63 ed             	movslq %ebp,%r13
   1be3e:	44 89 c1             	mov    %r8d,%ecx
   1be41:	49 d3 e5             	shl    %cl,%r13
   1be44:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
   1be4b:	49 d3 e2             	shl    %cl,%r10
   1be4e:	49 f7 d2             	not    %r10
   1be51:	4d 21 ca             	and    %r9,%r10
   1be54:	4d 09 ea             	or     %r13,%r10
   1be57:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1be5c:	e9 7d fe ff ff       	jmp    1bcde <hyperinterval::ieee::Format::rounded+0x17e>
   1be61:	cc                   	int3
   1be62:	cc                   	int3
   1be63:	cc                   	int3
   1be64:	cc                   	int3
   1be65:	cc                   	int3
   1be66:	cc                   	int3
   1be67:	cc                   	int3
   1be68:	cc                   	int3
   1be69:	cc                   	int3
   1be6a:	cc                   	int3
   1be6b:	cc                   	int3
   1be6c:	cc                   	int3
   1be6d:	cc                   	int3
   1be6e:	cc                   	int3
   1be6f:	cc                   	int3

__udivti3:
   5a8b0:	49 89 d0             	mov    %rdx,%r8
   5a8b3:	48 85 c9             	test   %rcx,%rcx
   5a8b6:	74 71                	je     5a929 <__udivti3+0x79>
   5a8b8:	4c 0f bd c9          	bsr    %rcx,%r9
   5a8bc:	44 89 ca             	mov    %r9d,%edx
   5a8bf:	83 f2 3f             	xor    $0x3f,%edx
   5a8c2:	b0 40                	mov    $0x40,%al
   5a8c4:	28 d0                	sub    %dl,%al
   5a8c6:	4c 89 c2             	mov    %r8,%rdx
   5a8c9:	49 89 cb             	mov    %rcx,%r11
   5a8cc:	89 c1                	mov    %eax,%ecx
   5a8ce:	4c 0f ad da          	shrd   %cl,%r11,%rdx
   5a8d2:	4d 89 da             	mov    %r11,%r10
   5a8d5:	49 d3 ea             	shr    %cl,%r10
   5a8d8:	a8 40                	test   $0x40,%al
   5a8da:	4c 0f 44 d2          	cmove  %rdx,%r10
   5a8de:	48 89 f0             	mov    %rsi,%rax
   5a8e1:	48 0f a4 f8 3f       	shld   $0x3f,%rdi,%rax
   5a8e6:	48 89 f2             	mov    %rsi,%rdx
   5a8e9:	48 d1 ea             	shr    $1,%rdx
   5a8ec:	49 f7 f2             	div    %r10
   5a8ef:	49 89 c2             	mov    %rax,%r10
   5a8f2:	44 89 c9             	mov    %r9d,%ecx
   5a8f5:	49 d3 ea             	shr    %cl,%r10
   5a8f8:	49 83 fa 01          	cmp    $0x1,%r10
   5a8fc:	49 83 d2 ff          	adc    $0xffffffffffffffff,%r10
   5a900:	4d 89 d9             	mov    %r11,%r9
   5a903:	4d 0f af ca          	imul   %r10,%r9
   5a907:	4c 89 c0             	mov    %r8,%rax
   5a90a:	49 f7 e2             	mul    %r10
   5a90d:	48 89 c1             	mov    %rax,%rcx
   5a910:	4c 89 d0             	mov    %r10,%rax
   5a913:	4c 01 ca             	add    %r9,%rdx
   5a916:	48 29 cf             	sub    %rcx,%rdi
   5a919:	48 19 d6             	sbb    %rdx,%rsi
   5a91c:	4c 39 c7             	cmp    %r8,%rdi
   5a91f:	4c 19 de             	sbb    %r11,%rsi
   5a922:	48 83 d8 ff          	sbb    $0xffffffffffffffff,%rax
   5a926:	31 d2                	xor    %edx,%edx
   5a928:	c3                   	ret
   5a929:	4c 39 c6             	cmp    %r8,%rsi
   5a92c:	73 0c                	jae    5a93a <__udivti3+0x8a>
   5a92e:	48 89 f8             	mov    %rdi,%rax
   5a931:	48 89 f2             	mov    %rsi,%rdx
   5a934:	49 f7 f0             	div    %r8
   5a937:	31 d2                	xor    %edx,%edx
   5a939:	c3                   	ret
   5a93a:	48 89 f0             	mov    %rsi,%rax
   5a93d:	4c 09 c0             	or     %r8,%rax
   5a940:	48 c1 e8 20          	shr    $0x20,%rax
   5a944:	74 15                	je     5a95b <__udivti3+0xab>
   5a946:	48 89 f0             	mov    %rsi,%rax
   5a949:	31 d2                	xor    %edx,%edx
   5a94b:	49 f7 f0             	div    %r8
   5a94e:	48 89 c1             	mov    %rax,%rcx
   5a951:	48 89 f8             	mov    %rdi,%rax
   5a954:	49 f7 f0             	div    %r8
   5a957:	48 89 ca             	mov    %rcx,%rdx
   5a95a:	c3                   	ret
   5a95b:	89 f0                	mov    %esi,%eax
   5a95d:	31 d2                	xor    %edx,%edx
   5a95f:	41 f7 f0             	div    %r8d
   5a962:	89 c1                	mov    %eax,%ecx
   5a964:	48 89 f8             	mov    %rdi,%rax
   5a967:	49 f7 f0             	div    %r8
   5a96a:	48 89 ca             	mov    %rcx,%rdx
   5a96d:	c3                   	ret

Disassembly of section .init:
