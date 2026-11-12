hyperinterval_strict_chain32:
   16940:	53                   	push   %rbx
   16941:	48 83 ec 60          	sub    $0x60,%rsp
   16945:	48 89 fb             	mov    %rdi,%rbx
   16948:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   1694d:	ff 15 0d 6d 04 00    	call   *0x46d0d(%rip)        # 5d660 <_DYNAMIC+0x2b0>
   16953:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   16957:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   1695c:	83 f9 02             	cmp    $0x2,%ecx
   1695f:	0f 84 f4 00 00 00    	je     16a59 <hyperinterval_strict_chain32+0x119>
   16965:	8b 54 24 11          	mov    0x11(%rsp),%edx
   16969:	8b 74 24 14          	mov    0x14(%rsp),%esi
   1696d:	89 74 24 5c          	mov    %esi,0x5c(%rsp)
   16971:	89 54 24 59          	mov    %edx,0x59(%rsp)
   16975:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
   16979:	88 44 24 58          	mov    %al,0x58(%rsp)
   1697d:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   16982:	48 8d 74 24 54       	lea    0x54(%rsp),%rsi
   16987:	f3 0f 10 05 59 ee fe 	movss  -0x111a7(%rip),%xmm0        # 57e8 <__abi_tag+0x54ec>
   1698e:	ff 
   1698f:	f3 0f 10 0d 49 ee fe 	movss  -0x111b7(%rip),%xmm1        # 57e0 <__abi_tag+0x54e4>
   16996:	ff 
   16997:	ff 15 cb 6c 04 00    	call   *0x46ccb(%rip)        # 5d668 <_DYNAMIC+0x2b8>
   1699d:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
   169a1:	0f b6 44 24 1c       	movzbl 0x1c(%rsp),%eax
   169a6:	83 f9 02             	cmp    $0x2,%ecx
   169a9:	0f 84 aa 00 00 00    	je     16a59 <hyperinterval_strict_chain32+0x119>
   169af:	8b 54 24 1d          	mov    0x1d(%rsp),%edx
   169b3:	8b 74 24 20          	mov    0x20(%rsp),%esi
   169b7:	89 74 24 50          	mov    %esi,0x50(%rsp)
   169bb:	89 54 24 4d          	mov    %edx,0x4d(%rsp)
   169bf:	89 4c 24 48          	mov    %ecx,0x48(%rsp)
   169c3:	88 44 24 4c          	mov    %al,0x4c(%rsp)
   169c7:	48 8d 7c 24 3c       	lea    0x3c(%rsp),%rdi
   169cc:	48 8d 74 24 48       	lea    0x48(%rsp),%rsi
   169d1:	ff 15 99 6c 04 00    	call   *0x46c99(%rip)        # 5d670 <_DYNAMIC+0x2c0>
   169d7:	8b 4c 24 3c          	mov    0x3c(%rsp),%ecx
   169db:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   169e0:	83 f9 02             	cmp    $0x2,%ecx
   169e3:	74 74                	je     16a59 <hyperinterval_strict_chain32+0x119>
   169e5:	8b 54 24 41          	mov    0x41(%rsp),%edx
   169e9:	8b 74 24 44          	mov    0x44(%rsp),%esi
   169ed:	89 74 24 38          	mov    %esi,0x38(%rsp)
   169f1:	89 54 24 35          	mov    %edx,0x35(%rsp)
   169f5:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   169f9:	88 44 24 34          	mov    %al,0x34(%rsp)
   169fd:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   16a02:	f3 0f 10 05 aa ed fe 	movss  -0x11256(%rip),%xmm0        # 57b4 <__abi_tag+0x54b8>
   16a09:	ff 
   16a0a:	ff 15 68 6c 04 00    	call   *0x46c68(%rip)        # 5d678 <_DYNAMIC+0x2c8>
   16a10:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   16a14:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   16a19:	83 f9 02             	cmp    $0x2,%ecx
   16a1c:	74 3b                	je     16a59 <hyperinterval_strict_chain32+0x119>
   16a1e:	8b 54 24 11          	mov    0x11(%rsp),%edx
   16a22:	8b 74 24 14          	mov    0x14(%rsp),%esi
   16a26:	89 74 24 20          	mov    %esi,0x20(%rsp)
   16a2a:	89 54 24 1d          	mov    %edx,0x1d(%rsp)
   16a2e:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
   16a32:	88 44 24 1c          	mov    %al,0x1c(%rsp)
   16a36:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
   16a3b:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   16a40:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
   16a45:	ff 15 35 6c 04 00    	call   *0x46c35(%rip)        # 5d680 <_DYNAMIC+0x2d0>
   16a4b:	8b 4c 24 24          	mov    0x24(%rsp),%ecx
   16a4f:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   16a54:	83 f9 02             	cmp    $0x2,%ecx
   16a57:	75 12                	jne    16a6b <hyperinterval_strict_chain32+0x12b>
   16a59:	88 43 04             	mov    %al,0x4(%rbx)
   16a5c:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   16a62:	48 89 d8             	mov    %rbx,%rax
   16a65:	48 83 c4 60          	add    $0x60,%rsp
   16a69:	5b                   	pop    %rbx
   16a6a:	c3                   	ret
   16a6b:	8b 54 24 29          	mov    0x29(%rsp),%edx
   16a6f:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
   16a73:	89 74 24 14          	mov    %esi,0x14(%rsp)
   16a77:	89 54 24 11          	mov    %edx,0x11(%rsp)
   16a7b:	89 4c 24 0c          	mov    %ecx,0xc(%rsp)
   16a7f:	88 44 24 10          	mov    %al,0x10(%rsp)
   16a83:	48 8d 74 24 0c       	lea    0xc(%rsp),%rsi
   16a88:	48 89 df             	mov    %rbx,%rdi
   16a8b:	ff 15 f7 6b 04 00    	call   *0x46bf7(%rip)        # 5d688 <_DYNAMIC+0x2d8>
   16a91:	48 89 d8             	mov    %rbx,%rax
   16a94:	48 83 c4 60          	add    $0x60,%rsp
   16a98:	5b                   	pop    %rbx
   16a99:	c3                   	ret
   16a9a:	cc                   	int3
   16a9b:	cc                   	int3
   16a9c:	cc                   	int3
   16a9d:	cc                   	int3
   16a9e:	cc                   	int3
   16a9f:	cc                   	int3

hyperinterval_strict_chain64:
   16aa0:	53                   	push   %rbx
   16aa1:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
   16aa8:	48 89 fb             	mov    %rdi,%rbx
   16aab:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   16ab0:	ff 15 da 6b 04 00    	call   *0x46bda(%rip)        # 5d690 <_DYNAMIC+0x2e0>
   16ab6:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   16abb:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   16ac0:	48 83 f9 02          	cmp    $0x2,%rcx
   16ac4:	0f 84 32 01 00 00    	je     16bfc <hyperinterval_strict_chain64+0x15c>
   16aca:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   16acf:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   16ad4:	48 89 b4 24 a8 00 00 	mov    %rsi,0xa8(%rsp)
   16adb:	00 
   16adc:	48 89 94 24 a1 00 00 	mov    %rdx,0xa1(%rsp)
   16ae3:	00 
   16ae4:	48 89 8c 24 98 00 00 	mov    %rcx,0x98(%rsp)
   16aeb:	00 
   16aec:	88 84 24 a0 00 00 00 	mov    %al,0xa0(%rsp)
   16af3:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   16af8:	48 8d b4 24 98 00 00 	lea    0x98(%rsp),%rsi
   16aff:	00 
   16b00:	f2 0f 10 05 68 ec fe 	movsd  -0x11398(%rip),%xmm0        # 5770 <__abi_tag+0x5474>
   16b07:	ff 
   16b08:	f2 0f 10 0d 70 ec fe 	movsd  -0x11390(%rip),%xmm1        # 5780 <__abi_tag+0x5484>
   16b0f:	ff 
   16b10:	ff 15 82 6b 04 00    	call   *0x46b82(%rip)        # 5d698 <_DYNAMIC+0x2e8>
   16b16:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   16b1b:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   16b20:	48 83 f9 02          	cmp    $0x2,%rcx
   16b24:	0f 84 d2 00 00 00    	je     16bfc <hyperinterval_strict_chain64+0x15c>
   16b2a:	48 8b 54 24 29       	mov    0x29(%rsp),%rdx
   16b2f:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   16b34:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
   16b3b:	00 
   16b3c:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
   16b43:	00 
   16b44:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
   16b4b:	00 
   16b4c:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
   16b53:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
   16b58:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   16b5f:	00 
   16b60:	ff 15 3a 6b 04 00    	call   *0x46b3a(%rip)        # 5d6a0 <_DYNAMIC+0x2f0>
   16b66:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
   16b6b:	0f b6 44 24 70       	movzbl 0x70(%rsp),%eax
   16b70:	48 83 f9 02          	cmp    $0x2,%rcx
   16b74:	0f 84 82 00 00 00    	je     16bfc <hyperinterval_strict_chain64+0x15c>
   16b7a:	48 8b 54 24 71       	mov    0x71(%rsp),%rdx
   16b7f:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
   16b84:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   16b89:	48 89 54 24 59       	mov    %rdx,0x59(%rsp)
   16b8e:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
   16b93:	88 44 24 58          	mov    %al,0x58(%rsp)
   16b97:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   16b9c:	f2 0f 10 05 bc eb fe 	movsd  -0x11444(%rip),%xmm0        # 5760 <__abi_tag+0x5464>
   16ba3:	ff 
   16ba4:	ff 15 fe 6a 04 00    	call   *0x46afe(%rip)        # 5d6a8 <_DYNAMIC+0x2f8>
   16baa:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   16baf:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   16bb4:	48 83 f9 02          	cmp    $0x2,%rcx
   16bb8:	74 42                	je     16bfc <hyperinterval_strict_chain64+0x15c>
   16bba:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   16bbf:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   16bc4:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   16bc9:	48 89 54 24 29       	mov    %rdx,0x29(%rsp)
   16bce:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   16bd3:	88 44 24 28          	mov    %al,0x28(%rsp)
   16bd7:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   16bdc:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   16be1:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
   16be6:	ff 15 c4 6a 04 00    	call   *0x46ac4(%rip)        # 5d6b0 <_DYNAMIC+0x300>
   16bec:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   16bf1:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   16bf6:	48 83 f9 02          	cmp    $0x2,%rcx
   16bfa:	75 16                	jne    16c12 <hyperinterval_strict_chain64+0x172>
   16bfc:	88 43 08             	mov    %al,0x8(%rbx)
   16bff:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   16c06:	48 89 d8             	mov    %rbx,%rax
   16c09:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   16c10:	5b                   	pop    %rbx
   16c11:	c3                   	ret
   16c12:	48 8b 54 24 41       	mov    0x41(%rsp),%rdx
   16c17:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
   16c1c:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
   16c21:	48 89 54 24 11       	mov    %rdx,0x11(%rsp)
   16c26:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   16c2b:	88 44 24 10          	mov    %al,0x10(%rsp)
   16c2f:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
   16c34:	48 89 df             	mov    %rbx,%rdi
   16c37:	ff 15 7b 6a 04 00    	call   *0x46a7b(%rip)        # 5d6b8 <_DYNAMIC+0x308>
   16c3d:	48 89 d8             	mov    %rbx,%rax
   16c40:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   16c47:	5b                   	pop    %rbx
   16c48:	c3                   	ret
   16c49:	cc                   	int3
   16c4a:	cc                   	int3
   16c4b:	cc                   	int3
   16c4c:	cc                   	int3
   16c4d:	cc                   	int3
   16c4e:	cc                   	int3
   16c4f:	cc                   	int3

hyperinterval_strict_surface32:
   16c50:	55                   	push   %rbp
   16c51:	41 57                	push   %r15
   16c53:	41 56                	push   %r14
   16c55:	41 55                	push   %r13
   16c57:	41 54                	push   %r12
   16c59:	53                   	push   %rbx
   16c5a:	48 83 ec 78          	sub    $0x78,%rsp
   16c5e:	41 89 f6             	mov    %esi,%r14d
   16c61:	48 89 fd             	mov    %rdi,%rbp
   16c64:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   16c69:	66 0f 7e 44 24 38    	movd   %xmm0,0x38(%rsp)
   16c6f:	66 0f 7e 4c 24 1c    	movd   %xmm1,0x1c(%rsp)
   16c75:	ff 15 e5 69 04 00    	call   *0x469e5(%rip)        # 5d660 <_DYNAMIC+0x2b0>
   16c7b:	44 8b 7c 24 08       	mov    0x8(%rsp),%r15d
   16c80:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   16c85:	41 83 ff 02          	cmp    $0x2,%r15d
   16c89:	75 05                	jne    16c90 <hyperinterval_strict_surface32+0x40>
   16c8b:	88 45 04             	mov    %al,0x4(%rbp)
   16c8e:	eb 45                	jmp    16cd5 <hyperinterval_strict_surface32+0x85>
   16c90:	8b 4c 24 0d          	mov    0xd(%rsp),%ecx
   16c94:	8b 54 24 10          	mov    0x10(%rsp),%edx
   16c98:	89 54 24 44          	mov    %edx,0x44(%rsp)
   16c9c:	89 4c 24 41          	mov    %ecx,0x41(%rsp)
   16ca0:	44 89 7c 24 3c       	mov    %r15d,0x3c(%rsp)
   16ca5:	88 44 24 40          	mov    %al,0x40(%rsp)
   16ca9:	66 0f 6e 44 24 38    	movd   0x38(%rsp),%xmm0
   16caf:	ff 15 0b 6a 04 00    	call   *0x46a0b(%rip)        # 5d6c0 <_DYNAMIC+0x310>
   16cb5:	48 89 c3             	mov    %rax,%rbx
   16cb8:	f6 c3 01             	test   $0x1,%bl
   16cbb:	74 05                	je     16cc2 <hyperinterval_strict_surface32+0x72>
   16cbd:	88 7d 04             	mov    %bh,0x4(%rbp)
   16cc0:	eb 13                	jmp    16cd5 <hyperinterval_strict_surface32+0x85>
   16cc2:	66 0f 6e 44 24 1c    	movd   0x1c(%rsp),%xmm0
   16cc8:	ff 15 fa 69 04 00    	call   *0x469fa(%rip)        # 5d6c8 <_DYNAMIC+0x318>
   16cce:	a8 01                	test   $0x1,%al
   16cd0:	74 1c                	je     16cee <hyperinterval_strict_surface32+0x9e>
   16cd2:	88 65 04             	mov    %ah,0x4(%rbp)
   16cd5:	c7 45 00 02 00 00 00 	movl   $0x2,0x0(%rbp)
   16cdc:	48 89 e8             	mov    %rbp,%rax
   16cdf:	48 83 c4 78          	add    $0x78,%rsp
   16ce3:	5b                   	pop    %rbx
   16ce4:	41 5c                	pop    %r12
   16ce6:	41 5d                	pop    %r13
   16ce8:	41 5e                	pop    %r14
   16cea:	41 5f                	pop    %r15
   16cec:	5d                   	pop    %rbp
   16ced:	c3                   	ret
   16cee:	48 c1 eb 20          	shr    $0x20,%rbx
   16cf2:	66 0f 6e c3          	movd   %ebx,%xmm0
   16cf6:	48 c1 e8 20          	shr    $0x20,%rax
   16cfa:	66 0f 6e c8          	movd   %eax,%xmm1
   16cfe:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   16d03:	ff 15 57 69 04 00    	call   *0x46957(%rip)        # 5d660 <_DYNAMIC+0x2b0>
   16d09:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   16d0d:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   16d12:	83 f9 02             	cmp    $0x2,%ecx
   16d15:	0f 84 70 ff ff ff    	je     16c8b <hyperinterval_strict_surface32+0x3b>
   16d1b:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   16d1f:	8b 74 24 10          	mov    0x10(%rsp),%esi
   16d23:	89 74 24 5c          	mov    %esi,0x5c(%rsp)
   16d27:	89 54 24 59          	mov    %edx,0x59(%rsp)
   16d2b:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
   16d2f:	88 44 24 58          	mov    %al,0x58(%rsp)
   16d33:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   16d38:	48 8d 74 24 3c       	lea    0x3c(%rsp),%rsi
   16d3d:	44 89 f2             	mov    %r14d,%edx
   16d40:	ff 15 8a 69 04 00    	call   *0x4698a(%rip)        # 5d6d0 <_DYNAMIC+0x320>
   16d46:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   16d4a:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   16d4f:	83 f9 02             	cmp    $0x2,%ecx
   16d52:	0f 84 33 ff ff ff    	je     16c8b <hyperinterval_strict_surface32+0x3b>
   16d58:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   16d5c:	8b 74 24 10          	mov    0x10(%rsp),%esi
   16d60:	89 74 24 34          	mov    %esi,0x34(%rsp)
   16d64:	89 54 24 31          	mov    %edx,0x31(%rsp)
   16d68:	89 4c 24 2c          	mov    %ecx,0x2c(%rsp)
   16d6c:	88 44 24 30          	mov    %al,0x30(%rsp)
   16d70:	48 8d 7c 24 48       	lea    0x48(%rsp),%rdi
   16d75:	48 8d 74 24 2c       	lea    0x2c(%rsp),%rsi
   16d7a:	ff 15 58 69 04 00    	call   *0x46958(%rip)        # 5d6d8 <_DYNAMIC+0x328>
   16d80:	8b 4c 24 48          	mov    0x48(%rsp),%ecx
   16d84:	0f b6 44 24 4c       	movzbl 0x4c(%rsp),%eax
   16d89:	83 f9 02             	cmp    $0x2,%ecx
   16d8c:	0f 84 f9 fe ff ff    	je     16c8b <hyperinterval_strict_surface32+0x3b>
   16d92:	8b 54 24 4d          	mov    0x4d(%rsp),%edx
   16d96:	8b 74 24 50          	mov    0x50(%rsp),%esi
   16d9a:	89 74 24 28          	mov    %esi,0x28(%rsp)
   16d9e:	89 54 24 25          	mov    %edx,0x25(%rsp)
   16da2:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   16da6:	88 44 24 24          	mov    %al,0x24(%rsp)
   16daa:	48 8d 5c 24 6c       	lea    0x6c(%rsp),%rbx
   16daf:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
   16db4:	48 8d 54 24 54       	lea    0x54(%rsp),%rdx
   16db9:	48 89 df             	mov    %rbx,%rdi
   16dbc:	ff 15 1e 69 04 00    	call   *0x4691e(%rip)        # 5d6e0 <_DYNAMIC+0x330>
   16dc2:	4c 8d 74 24 60       	lea    0x60(%rsp),%r14
   16dc7:	48 8d 54 24 3c       	lea    0x3c(%rsp),%rdx
   16dcc:	4c 89 f7             	mov    %r14,%rdi
   16dcf:	48 89 de             	mov    %rbx,%rsi
   16dd2:	ff 15 10 69 04 00    	call   *0x46910(%rip)        # 5d6e8 <_DYNAMIC+0x338>
   16dd8:	4c 89 f7             	mov    %r14,%rdi
   16ddb:	ff 15 0f 69 04 00    	call   *0x4690f(%rip)        # 5d6f0 <_DYNAMIC+0x340>
   16de1:	8b 4c 24 60          	mov    0x60(%rsp),%ecx
   16de5:	83 f9 01             	cmp    $0x1,%ecx
   16de8:	75 1c                	jne    16e06 <hyperinterval_strict_surface32+0x1b6>
   16dea:	8b 74 24 64          	mov    0x64(%rsp),%esi
   16dee:	8b 7c 24 68          	mov    0x68(%rsp),%edi
   16df2:	39 fe                	cmp    %edi,%esi
   16df4:	0f 94 c2             	sete   %dl
   16df7:	66 0f 6e ce          	movd   %esi,%xmm1
   16dfb:	66 0f 6e c7          	movd   %edi,%xmm0
   16dff:	be 01 00 00 00       	mov    $0x1,%esi
   16e04:	eb 04                	jmp    16e0a <hyperinterval_strict_surface32+0x1ba>
   16e06:	31 d2                	xor    %edx,%edx
   16e08:	31 f6                	xor    %esi,%esi
   16e0a:	80 f1 01             	xor    $0x1,%cl
   16e0d:	89 74 24 08          	mov    %esi,0x8(%rsp)
   16e11:	66 0f 7e 4c 24 0c    	movd   %xmm1,0xc(%rsp)
   16e17:	88 4c 24 10          	mov    %cl,0x10(%rsp)
   16e1b:	88 54 24 11          	mov    %dl,0x11(%rsp)
   16e1f:	88 44 24 12          	mov    %al,0x12(%rsp)
   16e23:	89 74 24 14          	mov    %esi,0x14(%rsp)
   16e27:	66 0f 7e 44 24 18    	movd   %xmm0,0x18(%rsp)
   16e2d:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   16e32:	4c 8d 6c 24 60       	lea    0x60(%rsp),%r13
   16e37:	4c 8d 74 24 54       	lea    0x54(%rsp),%r14
   16e3c:	4c 89 ef             	mov    %r13,%rdi
   16e3f:	4c 89 f6             	mov    %r14,%rsi
   16e42:	ff 15 b0 68 04 00    	call   *0x468b0(%rip)        # 5d6f8 <_DYNAMIC+0x348>
   16e48:	88 44 24 1c          	mov    %al,0x1c(%rsp)
   16e4c:	4c 89 ef             	mov    %r13,%rdi
   16e4f:	4c 89 f6             	mov    %r14,%rsi
   16e52:	ff 15 a8 68 04 00    	call   *0x468a8(%rip)        # 5d700 <_DYNAMIC+0x350>
   16e58:	41 89 c6             	mov    %eax,%r14d
   16e5b:	4c 8d 64 24 3c       	lea    0x3c(%rsp),%r12
   16e60:	4c 89 ef             	mov    %r13,%rdi
   16e63:	4c 89 e6             	mov    %r12,%rsi
   16e66:	ff 15 9c 68 04 00    	call   *0x4689c(%rip)        # 5d708 <_DYNAMIC+0x358>
   16e6c:	89 c3                	mov    %eax,%ebx
   16e6e:	4c 89 ef             	mov    %r13,%rdi
   16e71:	4c 89 e6             	mov    %r12,%rsi
   16e74:	ff 15 96 68 04 00    	call   *0x46896(%rip)        # 5d710 <_DYNAMIC+0x360>
   16e7a:	41 89 c4             	mov    %eax,%r12d
   16e7d:	4c 89 ef             	mov    %r13,%rdi
   16e80:	66 0f 6e 44 24 38    	movd   0x38(%rsp),%xmm0
   16e86:	ff 15 6c 67 04 00    	call   *0x4676c(%rip)        # 5d5f8 <_DYNAMIC+0x248>
   16e8c:	a8 01                	test   $0x1,%al
   16e8e:	74 08                	je     16e98 <hyperinterval_strict_surface32+0x248>
   16e90:	88 55 04             	mov    %dl,0x4(%rbp)
   16e93:	e9 3d fe ff ff       	jmp    16cd5 <hyperinterval_strict_surface32+0x85>
   16e98:	80 e2 01             	and    $0x1,%dl
   16e9b:	0f b6 44 24 1c       	movzbl 0x1c(%rsp),%eax
   16ea0:	88 44 24 08          	mov    %al,0x8(%rsp)
   16ea4:	44 88 74 24 09       	mov    %r14b,0x9(%rsp)
   16ea9:	88 5c 24 0a          	mov    %bl,0xa(%rsp)
   16ead:	44 88 64 24 0b       	mov    %r12b,0xb(%rsp)
   16eb2:	88 54 24 0c          	mov    %dl,0xc(%rsp)
   16eb6:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   16ebb:	41 83 ff 01          	cmp    $0x1,%r15d
   16ebf:	75 2a                	jne    16eeb <hyperinterval_strict_surface32+0x29b>
   16ec1:	f3 0f 7e 44 24 40    	movq   0x40(%rsp),%xmm0
   16ec7:	66 0f ef c9          	pxor   %xmm1,%xmm1
   16ecb:	66 0f 6f 15 ad e9 fe 	movdqa -0x11653(%rip),%xmm2        # 5880 <__abi_tag+0x5584>
   16ed2:	ff 
   16ed3:	66 0f ef d0          	pxor   %xmm0,%xmm2
   16ed7:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   16edb:	66 0f df ca          	pandn  %xmm2,%xmm1
   16edf:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   16ee4:	b8 01 00 00 00       	mov    $0x1,%eax
   16ee9:	eb 02                	jmp    16eed <hyperinterval_strict_surface32+0x29d>
   16eeb:	31 c0                	xor    %eax,%eax
   16eed:	89 44 24 48          	mov    %eax,0x48(%rsp)
   16ef1:	66 0f d6 44 24 4c    	movq   %xmm0,0x4c(%rsp)
   16ef7:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   16efc:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
   16f01:	48 8d 54 24 48       	lea    0x48(%rsp),%rdx
   16f06:	ff 15 0c 68 04 00    	call   *0x4680c(%rip)        # 5d718 <_DYNAMIC+0x368>
   16f0c:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   16f10:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   16f15:	83 f9 02             	cmp    $0x2,%ecx
   16f18:	0f 84 6d fd ff ff    	je     16c8b <hyperinterval_strict_surface32+0x3b>
   16f1e:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   16f22:	8b 74 24 10          	mov    0x10(%rsp),%esi
   16f26:	89 74 24 28          	mov    %esi,0x28(%rsp)
   16f2a:	89 54 24 25          	mov    %edx,0x25(%rsp)
   16f2e:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   16f32:	88 44 24 24          	mov    %al,0x24(%rsp)
   16f36:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   16f3b:	66 0f 6e 05 a1 e8 fe 	movd   -0x1175f(%rip),%xmm0        # 57e4 <__abi_tag+0x54e8>
   16f42:	ff 
   16f43:	ff 15 2f 67 04 00    	call   *0x4672f(%rip)        # 5d678 <_DYNAMIC+0x2c8>
   16f49:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   16f4d:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   16f52:	83 f9 02             	cmp    $0x2,%ecx
   16f55:	0f 84 30 fd ff ff    	je     16c8b <hyperinterval_strict_surface32+0x3b>
   16f5b:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   16f5f:	8b 74 24 10          	mov    0x10(%rsp),%esi
   16f63:	89 74 24 34          	mov    %esi,0x34(%rsp)
   16f67:	89 54 24 31          	mov    %edx,0x31(%rsp)
   16f6b:	89 4c 24 2c          	mov    %ecx,0x2c(%rsp)
   16f6f:	88 44 24 30          	mov    %al,0x30(%rsp)
   16f73:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
   16f78:	48 8d 54 24 2c       	lea    0x2c(%rsp),%rdx
   16f7d:	48 89 ef             	mov    %rbp,%rdi
   16f80:	ff 15 9a 67 04 00    	call   *0x4679a(%rip)        # 5d720 <_DYNAMIC+0x370>
   16f86:	e9 51 fd ff ff       	jmp    16cdc <hyperinterval_strict_surface32+0x8c>
   16f8b:	cc                   	int3
   16f8c:	cc                   	int3
   16f8d:	cc                   	int3
   16f8e:	cc                   	int3
   16f8f:	cc                   	int3

hyperinterval_strict_surface64:
   16f90:	55                   	push   %rbp
   16f91:	41 57                	push   %r15
   16f93:	41 56                	push   %r14
   16f95:	41 55                	push   %r13
   16f97:	41 54                	push   %r12
   16f99:	53                   	push   %rbx
   16f9a:	48 81 ec 08 01 00 00 	sub    $0x108,%rsp
   16fa1:	89 f5                	mov    %esi,%ebp
   16fa3:	48 89 fb             	mov    %rdi,%rbx
   16fa6:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   16fab:	f2 0f 11 84 24 90 00 	movsd  %xmm0,0x90(%rsp)
   16fb2:	00 00 
   16fb4:	66 0f d6 4c 24 58    	movq   %xmm1,0x58(%rsp)
   16fba:	ff 15 d0 66 04 00    	call   *0x466d0(%rip)        # 5d690 <_DYNAMIC+0x2e0>
   16fc0:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   16fc5:	44 0f b6 64 24 18    	movzbl 0x18(%rsp),%r12d
   16fcb:	49 83 fe 02          	cmp    $0x2,%r14
   16fcf:	75 09                	jne    16fda <hyperinterval_strict_surface64+0x4a>
   16fd1:	44 88 63 08          	mov    %r12b,0x8(%rbx)
   16fd5:	e9 8a 00 00 00       	jmp    17064 <hyperinterval_strict_surface64+0xd4>
   16fda:	44 0f b6 7c 24 1f    	movzbl 0x1f(%rsp),%r15d
   16fe0:	44 0f b7 6c 24 1d    	movzwl 0x1d(%rsp),%r13d
   16fe6:	8b 44 24 19          	mov    0x19(%rsp),%eax
   16fea:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   16fef:	4c 89 74 24 60       	mov    %r14,0x60(%rsp)
   16ff4:	44 88 64 24 68       	mov    %r12b,0x68(%rsp)
   16ff9:	44 88 7c 24 6f       	mov    %r15b,0x6f(%rsp)
   16ffe:	66 44 89 6c 24 6d    	mov    %r13w,0x6d(%rsp)
   17004:	48 89 84 24 d0 00 00 	mov    %rax,0xd0(%rsp)
   1700b:	00 
   1700c:	89 44 24 69          	mov    %eax,0x69(%rsp)
   17010:	48 89 8c 24 c8 00 00 	mov    %rcx,0xc8(%rsp)
   17017:	00 
   17018:	48 89 4c 24 70       	mov    %rcx,0x70(%rsp)
   1701d:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   17022:	f2 0f 10 84 24 90 00 	movsd  0x90(%rsp),%xmm0
   17029:	00 00 
   1702b:	ff 15 f7 66 04 00    	call   *0x466f7(%rip)        # 5d728 <_DYNAMIC+0x378>
   17031:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   17036:	74 24                	je     1705c <hyperinterval_strict_surface64+0xcc>
   17038:	f2 0f 10 44 24 40    	movsd  0x40(%rsp),%xmm0
   1703e:	f2 0f 11 44 24 50    	movsd  %xmm0,0x50(%rsp)
   17044:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   17049:	f2 0f 10 44 24 58    	movsd  0x58(%rsp),%xmm0
   1704f:	ff 15 db 66 04 00    	call   *0x466db(%rip)        # 5d730 <_DYNAMIC+0x380>
   17055:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   1705a:	75 24                	jne    17080 <hyperinterval_strict_surface64+0xf0>
   1705c:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
   17061:	88 43 08             	mov    %al,0x8(%rbx)
   17064:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1706b:	48 89 d8             	mov    %rbx,%rax
   1706e:	48 81 c4 08 01 00 00 	add    $0x108,%rsp
   17075:	5b                   	pop    %rbx
   17076:	41 5c                	pop    %r12
   17078:	41 5d                	pop    %r13
   1707a:	41 5e                	pop    %r14
   1707c:	41 5f                	pop    %r15
   1707e:	5d                   	pop    %rbp
   1707f:	c3                   	ret
   17080:	f3 0f 7e 4c 24 40    	movq   0x40(%rsp),%xmm1
   17086:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1708b:	f2 0f 10 44 24 50    	movsd  0x50(%rsp),%xmm0
   17091:	ff 15 f9 65 04 00    	call   *0x465f9(%rip)        # 5d690 <_DYNAMIC+0x2e0>
   17097:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1709c:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   170a1:	48 83 f9 02          	cmp    $0x2,%rcx
   170a5:	74 ba                	je     17061 <hyperinterval_strict_surface64+0xd1>
   170a7:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   170ac:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   170b1:	48 89 b4 24 c0 00 00 	mov    %rsi,0xc0(%rsp)
   170b8:	00 
   170b9:	48 89 94 24 b9 00 00 	mov    %rdx,0xb9(%rsp)
   170c0:	00 
   170c1:	48 89 8c 24 b0 00 00 	mov    %rcx,0xb0(%rsp)
   170c8:	00 
   170c9:	88 84 24 b8 00 00 00 	mov    %al,0xb8(%rsp)
   170d0:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   170d5:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
   170da:	89 ea                	mov    %ebp,%edx
   170dc:	ff 15 56 66 04 00    	call   *0x46656(%rip)        # 5d738 <_DYNAMIC+0x388>
   170e2:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   170e7:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   170ec:	48 83 f9 02          	cmp    $0x2,%rcx
   170f0:	0f 84 6b ff ff ff    	je     17061 <hyperinterval_strict_surface64+0xd1>
   170f6:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   170fb:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   17100:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
   17105:	48 89 54 24 41       	mov    %rdx,0x41(%rsp)
   1710a:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
   1710f:	88 44 24 40          	mov    %al,0x40(%rsp)
   17113:	48 8d bc 24 98 00 00 	lea    0x98(%rsp),%rdi
   1711a:	00 
   1711b:	48 8d 74 24 38       	lea    0x38(%rsp),%rsi
   17120:	ff 15 1a 66 04 00    	call   *0x4661a(%rip)        # 5d740 <_DYNAMIC+0x390>
   17126:	48 8b 8c 24 98 00 00 	mov    0x98(%rsp),%rcx
   1712d:	00 
   1712e:	0f b6 84 24 a0 00 00 	movzbl 0xa0(%rsp),%eax
   17135:	00 
   17136:	48 83 f9 02          	cmp    $0x2,%rcx
   1713a:	0f 84 21 ff ff ff    	je     17061 <hyperinterval_strict_surface64+0xd1>
   17140:	48 8b 94 24 a1 00 00 	mov    0xa1(%rsp),%rdx
   17147:	00 
   17148:	48 8b b4 24 a8 00 00 	mov    0xa8(%rsp),%rsi
   1714f:	00 
   17150:	48 89 b4 24 88 00 00 	mov    %rsi,0x88(%rsp)
   17157:	00 
   17158:	48 89 94 24 81 00 00 	mov    %rdx,0x81(%rsp)
   1715f:	00 
   17160:	48 89 4c 24 78       	mov    %rcx,0x78(%rsp)
   17165:	88 84 24 80 00 00 00 	mov    %al,0x80(%rsp)
   1716c:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
   17173:	00 
   17174:	48 8d 74 24 78       	lea    0x78(%rsp),%rsi
   17179:	48 8d 94 24 b0 00 00 	lea    0xb0(%rsp),%rdx
   17180:	00 
   17181:	ff 15 c1 65 04 00    	call   *0x465c1(%rip)        # 5d748 <_DYNAMIC+0x398>
   17187:	48 8d ac 24 d8 00 00 	lea    0xd8(%rsp),%rbp
   1718e:	00 
   1718f:	48 8d 54 24 60       	lea    0x60(%rsp),%rdx
   17194:	48 89 ef             	mov    %rbp,%rdi
   17197:	48 8d b4 24 f0 00 00 	lea    0xf0(%rsp),%rsi
   1719e:	00 
   1719f:	ff 15 ab 65 04 00    	call   *0x465ab(%rip)        # 5d750 <_DYNAMIC+0x3a0>
   171a5:	48 89 ef             	mov    %rbp,%rdi
   171a8:	ff 15 aa 65 04 00    	call   *0x465aa(%rip)        # 5d758 <_DYNAMIC+0x3a8>
   171ae:	48 8b 8c 24 d8 00 00 	mov    0xd8(%rsp),%rcx
   171b5:	00 
   171b6:	48 83 f9 01          	cmp    $0x1,%rcx
   171ba:	75 27                	jne    171e3 <hyperinterval_strict_surface64+0x253>
   171bc:	48 8b b4 24 e0 00 00 	mov    0xe0(%rsp),%rsi
   171c3:	00 
   171c4:	48 8b bc 24 e8 00 00 	mov    0xe8(%rsp),%rdi
   171cb:	00 
   171cc:	48 39 fe             	cmp    %rdi,%rsi
   171cf:	0f 94 c2             	sete   %dl
   171d2:	66 48 0f 6e ce       	movq   %rsi,%xmm1
   171d7:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   171dc:	be 01 00 00 00       	mov    $0x1,%esi
   171e1:	eb 04                	jmp    171e7 <hyperinterval_strict_surface64+0x257>
   171e3:	31 d2                	xor    %edx,%edx
   171e5:	31 f6                	xor    %esi,%esi
   171e7:	80 f1 01             	xor    $0x1,%cl
   171ea:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
   171ef:	66 0f d6 4c 24 18    	movq   %xmm1,0x18(%rsp)
   171f5:	88 4c 24 20          	mov    %cl,0x20(%rsp)
   171f9:	88 54 24 21          	mov    %dl,0x21(%rsp)
   171fd:	88 44 24 22          	mov    %al,0x22(%rsp)
   17201:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
   17206:	66 0f d6 44 24 30    	movq   %xmm0,0x30(%rsp)
   1720c:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
   17211:	48 8d ac 24 d8 00 00 	lea    0xd8(%rsp),%rbp
   17218:	00 
   17219:	48 8d b4 24 b0 00 00 	lea    0xb0(%rsp),%rsi
   17220:	00 
   17221:	48 89 ef             	mov    %rbp,%rdi
   17224:	ff 15 36 65 04 00    	call   *0x46536(%rip)        # 5d760 <_DYNAMIC+0x3b0>
   1722a:	88 44 24 58          	mov    %al,0x58(%rsp)
   1722e:	48 89 ef             	mov    %rbp,%rdi
   17231:	48 8d b4 24 b0 00 00 	lea    0xb0(%rsp),%rsi
   17238:	00 
   17239:	ff 15 29 65 04 00    	call   *0x46529(%rip)        # 5d768 <_DYNAMIC+0x3b8>
   1723f:	88 44 24 50          	mov    %al,0x50(%rsp)
   17243:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
   17248:	48 89 ef             	mov    %rbp,%rdi
   1724b:	ff 15 1f 65 04 00    	call   *0x4651f(%rip)        # 5d770 <_DYNAMIC+0x3c0>
   17251:	88 44 24 0f          	mov    %al,0xf(%rsp)
   17255:	48 89 ef             	mov    %rbp,%rdi
   17258:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
   1725d:	ff 15 15 65 04 00    	call   *0x46515(%rip)        # 5d778 <_DYNAMIC+0x3c8>
   17263:	88 44 24 0e          	mov    %al,0xe(%rsp)
   17267:	48 89 ef             	mov    %rbp,%rdi
   1726a:	f2 0f 10 84 24 90 00 	movsd  0x90(%rsp),%xmm0
   17271:	00 00 
   17273:	ff 15 77 63 04 00    	call   *0x46377(%rip)        # 5d5f0 <_DYNAMIC+0x240>
   17279:	a8 01                	test   $0x1,%al
   1727b:	74 08                	je     17285 <hyperinterval_strict_surface64+0x2f5>
   1727d:	88 53 08             	mov    %dl,0x8(%rbx)
   17280:	e9 df fd ff ff       	jmp    17064 <hyperinterval_strict_surface64+0xd4>
   17285:	80 e2 01             	and    $0x1,%dl
   17288:	0f b6 44 24 58       	movzbl 0x58(%rsp),%eax
   1728d:	88 44 24 10          	mov    %al,0x10(%rsp)
   17291:	0f b6 44 24 50       	movzbl 0x50(%rsp),%eax
   17296:	88 44 24 11          	mov    %al,0x11(%rsp)
   1729a:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
   1729f:	88 44 24 12          	mov    %al,0x12(%rsp)
   172a3:	0f b6 44 24 0e       	movzbl 0xe(%rsp),%eax
   172a8:	88 44 24 13          	mov    %al,0x13(%rsp)
   172ac:	88 54 24 14          	mov    %dl,0x14(%rsp)
   172b0:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
   172b5:	41 83 fe 01          	cmp    $0x1,%r14d
   172b9:	75 51                	jne    1730c <hyperinterval_strict_surface64+0x37c>
   172bb:	41 c1 e7 10          	shl    $0x10,%r15d
   172bf:	45 09 fd             	or     %r15d,%r13d
   172c2:	41 0f b6 c4          	movzbl %r12b,%eax
   172c6:	49 c1 e5 20          	shl    $0x20,%r13
   172ca:	48 8b 94 24 d0 00 00 	mov    0xd0(%rsp),%rdx
   172d1:	00 
   172d2:	4c 09 ea             	or     %r13,%rdx
   172d5:	48 c1 e2 08          	shl    $0x8,%rdx
   172d9:	48 09 c2             	or     %rax,%rdx
   172dc:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   172e3:	00 00 80 
   172e6:	48 8b b4 24 c8 00 00 	mov    0xc8(%rsp),%rsi
   172ed:	00 
   172ee:	48 89 f1             	mov    %rsi,%rcx
   172f1:	48 31 c1             	xor    %rax,%rcx
   172f4:	48 85 f6             	test   %rsi,%rsi
   172f7:	48 0f 44 ce          	cmove  %rsi,%rcx
   172fb:	48 31 d0             	xor    %rdx,%rax
   172fe:	48 85 d2             	test   %rdx,%rdx
   17301:	48 0f 44 c2          	cmove  %rdx,%rax
   17305:	ba 01 00 00 00       	mov    $0x1,%edx
   1730a:	eb 02                	jmp    1730e <hyperinterval_strict_surface64+0x37e>
   1730c:	31 d2                	xor    %edx,%edx
   1730e:	48 89 94 24 98 00 00 	mov    %rdx,0x98(%rsp)
   17315:	00 
   17316:	48 89 8c 24 a0 00 00 	mov    %rcx,0xa0(%rsp)
   1731d:	00 
   1731e:	48 89 84 24 a8 00 00 	mov    %rax,0xa8(%rsp)
   17325:	00 
   17326:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1732b:	48 8d b4 24 d8 00 00 	lea    0xd8(%rsp),%rsi
   17332:	00 
   17333:	48 8d 94 24 98 00 00 	lea    0x98(%rsp),%rdx
   1733a:	00 
   1733b:	ff 15 3f 64 04 00    	call   *0x4643f(%rip)        # 5d780 <_DYNAMIC+0x3d0>
   17341:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17346:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   1734b:	48 83 f9 02          	cmp    $0x2,%rcx
   1734f:	0f 84 0c fd ff ff    	je     17061 <hyperinterval_strict_surface64+0xd1>
   17355:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   1735a:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1735f:	48 89 b4 24 88 00 00 	mov    %rsi,0x88(%rsp)
   17366:	00 
   17367:	48 89 94 24 81 00 00 	mov    %rdx,0x81(%rsp)
   1736e:	00 
   1736f:	48 89 4c 24 78       	mov    %rcx,0x78(%rsp)
   17374:	88 84 24 80 00 00 00 	mov    %al,0x80(%rsp)
   1737b:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17380:	f2 0f 10 05 c8 e3 fe 	movsd  -0x11c38(%rip),%xmm0        # 5750 <__abi_tag+0x5454>
   17387:	ff 
   17388:	ff 15 1a 63 04 00    	call   *0x4631a(%rip)        # 5d6a8 <_DYNAMIC+0x2f8>
   1738e:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17393:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17398:	48 83 f9 02          	cmp    $0x2,%rcx
   1739c:	0f 84 bf fc ff ff    	je     17061 <hyperinterval_strict_surface64+0xd1>
   173a2:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   173a7:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   173ac:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
   173b1:	48 89 54 24 41       	mov    %rdx,0x41(%rsp)
   173b6:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
   173bb:	88 44 24 40          	mov    %al,0x40(%rsp)
   173bf:	48 8d 74 24 78       	lea    0x78(%rsp),%rsi
   173c4:	48 8d 54 24 38       	lea    0x38(%rsp),%rdx
   173c9:	48 89 df             	mov    %rbx,%rdi
   173cc:	ff 15 b6 63 04 00    	call   *0x463b6(%rip)        # 5d788 <_DYNAMIC+0x3d8>
   173d2:	e9 94 fc ff ff       	jmp    1706b <hyperinterval_strict_surface64+0xdb>
   173d7:	cc                   	int3
   173d8:	cc                   	int3
   173d9:	cc                   	int3
   173da:	cc                   	int3
   173db:	cc                   	int3
   173dc:	cc                   	int3
   173dd:	cc                   	int3
   173de:	cc                   	int3
   173df:	cc                   	int3

hyperinterval::float::F32Enclosure::reciprocal:
   17460:	41 57                	push   %r15
   17462:	41 56                	push   %r14
   17464:	41 54                	push   %r12
   17466:	53                   	push   %rbx
   17467:	48 83 ec 28          	sub    $0x28,%rsp
   1746b:	48 89 fb             	mov    %rdi,%rbx
   1746e:	83 3e 00             	cmpl   $0x0,(%rsi)
   17471:	74 5e                	je     174d1 <hyperinterval::float::F32Enclosure::reciprocal+0x71>
   17473:	49 89 f6             	mov    %rsi,%r14
   17476:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   1747c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17481:	be 00 00 00 80       	mov    $0x80000000,%esi
   17486:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1748b:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   17490:	e8 fb 3f 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   17495:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1749a:	74 25                	je     174c1 <hyperinterval::float::F32Enclosure::reciprocal+0x61>
   1749c:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   174a1:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   174a6:	be 00 00 00 80       	mov    $0x80000000,%esi
   174ab:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   174b0:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   174b5:	e8 d6 3f 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   174ba:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   174bf:	75 25                	jne    174e6 <hyperinterval::float::F32Enclosure::reciprocal+0x86>
   174c1:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   174c6:	88 4b 04             	mov    %cl,0x4(%rbx)
   174c9:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   174cf:	eb 06                	jmp    174d7 <hyperinterval::float::F32Enclosure::reciprocal+0x77>
   174d1:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   174d7:	48 89 d8             	mov    %rbx,%rax
   174da:	48 83 c4 28          	add    $0x28,%rsp
   174de:	5b                   	pop    %rbx
   174df:	41 5c                	pop    %r12
   174e1:	41 5e                	pop    %r14
   174e3:	41 5f                	pop    %r15
   174e5:	c3                   	ret
   174e6:	8b 44 24 10          	mov    0x10(%rsp),%eax
   174ea:	44 89 e1             	mov    %r12d,%ecx
   174ed:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   174f3:	89 c2                	mov    %eax,%edx
   174f5:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   174fb:	be 00 00 00 80       	mov    $0x80000000,%esi
   17500:	29 ce                	sub    %ecx,%esi
   17502:	44 09 f9             	or     %r15d,%ecx
   17505:	45 85 e4             	test   %r12d,%r12d
   17508:	48 0f 49 f1          	cmovns %rcx,%rsi
   1750c:	89 d1                	mov    %edx,%ecx
   1750e:	44 09 f9             	or     %r15d,%ecx
   17511:	41 29 d7             	sub    %edx,%r15d
   17514:	85 c0                	test   %eax,%eax
   17516:	4c 0f 49 f9          	cmovns %rcx,%r15
   1751a:	b1 01                	mov    $0x1,%cl
   1751c:	44 39 fe             	cmp    %r15d,%esi
   1751f:	77 a5                	ja     174c6 <hyperinterval::float::F32Enclosure::reciprocal+0x66>
   17521:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%rsp)
   17528:	00 
   17529:	44 89 64 24 20       	mov    %r12d,0x20(%rsp)
   1752e:	89 44 24 24          	mov    %eax,0x24(%rsp)
   17532:	41 83 7e 04 00       	cmpl   $0x0,0x4(%r14)
   17537:	7f 15                	jg     1754e <hyperinterval::float::F32Enclosure::reciprocal+0xee>
   17539:	41 8b 46 08          	mov    0x8(%r14),%eax
   1753d:	85 c0                	test   %eax,%eax
   1753f:	0f 99 c1             	setns  %cl
   17542:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   17547:	0f 94 c0             	sete   %al
   1754a:	08 c8                	or     %cl,%al
   1754c:	75 1a                	jne    17568 <hyperinterval::float::F32Enclosure::reciprocal+0x108>
   1754e:	48 8d 74 24 1c       	lea    0x1c(%rsp),%rsi
   17553:	48 89 df             	mov    %rbx,%rdi
   17556:	4c 89 f2             	mov    %r14,%rdx
   17559:	b9 01 00 00 00       	mov    $0x1,%ecx
   1755e:	e8 7d 02 00 00       	call   177e0 <hyperinterval::float::F32Enclosure::corner_image>
   17563:	e9 6f ff ff ff       	jmp    174d7 <hyperinterval::float::F32Enclosure::reciprocal+0x77>
   17568:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
   1756c:	e9 58 ff ff ff       	jmp    174c9 <hyperinterval::float::F32Enclosure::reciprocal+0x69>
   17571:	cc                   	int3
   17572:	cc                   	int3
   17573:	cc                   	int3
   17574:	cc                   	int3
   17575:	cc                   	int3
   17576:	cc                   	int3
   17577:	cc                   	int3
   17578:	cc                   	int3
   17579:	cc                   	int3
   1757a:	cc                   	int3
   1757b:	cc                   	int3
   1757c:	cc                   	int3
   1757d:	cc                   	int3
   1757e:	cc                   	int3
   1757f:	cc                   	int3

hyperinterval::float::F32Enclosure::checked_pow:
   17580:	55                   	push   %rbp
   17581:	41 57                	push   %r15
   17583:	41 56                	push   %r14
   17585:	41 55                	push   %r13
   17587:	41 54                	push   %r12
   17589:	53                   	push   %rbx
   1758a:	48 83 ec 38          	sub    $0x38,%rsp
   1758e:	48 89 fb             	mov    %rdi,%rbx
   17591:	83 fa 02             	cmp    $0x2,%edx
   17594:	75 0e                	jne    175a4 <hyperinterval::float::F32Enclosure::checked_pow+0x24>
   17596:	48 89 df             	mov    %rbx,%rdi
   17599:	ff 15 d1 60 04 00    	call   *0x460d1(%rip)        # 5d670 <_DYNAMIC+0x2c0>
   1759f:	e9 c8 00 00 00       	jmp    1766c <hyperinterval::float::F32Enclosure::checked_pow+0xec>
   175a4:	f6 06 01             	testb  $0x1,(%rsi)
   175a7:	0f 84 b9 00 00 00    	je     17666 <hyperinterval::float::F32Enclosure::checked_pow+0xe6>
   175ad:	89 d5                	mov    %edx,%ebp
   175af:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
   175b3:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   175b7:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   175bc:	be 00 00 00 80       	mov    $0x80000000,%esi
   175c1:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   175c6:	4c 89 f9             	mov    %r15,%rcx
   175c9:	41 89 e8             	mov    %ebp,%r8d
   175cc:	e8 bf 3a 00 00       	call   1b090 <hyperinterval::ieee::Format::power>
   175d1:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   175d6:	75 7e                	jne    17656 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   175d8:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   175dd:	44 8b 6c 24 18       	mov    0x18(%rsp),%r13d
   175e2:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   175e7:	be 00 00 00 80       	mov    $0x80000000,%esi
   175ec:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   175f1:	4c 89 f1             	mov    %r14,%rcx
   175f4:	41 89 e8             	mov    %ebp,%r8d
   175f7:	e8 94 3a 00 00       	call   1b090 <hyperinterval::ieee::Format::power>
   175fc:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   17601:	74 53                	je     17656 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   17603:	8b 44 24 10          	mov    0x10(%rsp),%eax
   17607:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1760c:	8b 44 24 18          	mov    0x18(%rsp),%eax
   17610:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   17615:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1761a:	be 00 00 00 80       	mov    $0x80000000,%esi
   1761f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17624:	4c 89 e1             	mov    %r12,%rcx
   17627:	e8 64 3e 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1762c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   17631:	74 23                	je     17656 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   17633:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   17638:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1763d:	be 00 00 00 80       	mov    $0x80000000,%esi
   17642:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17647:	4c 89 e9             	mov    %r13,%rcx
   1764a:	e8 41 3e 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1764f:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   17654:	75 28                	jne    1767e <hyperinterval::float::F32Enclosure::checked_pow+0xfe>
   17656:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1765b:	88 43 04             	mov    %al,0x4(%rbx)
   1765e:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17664:	eb 06                	jmp    1766c <hyperinterval::float::F32Enclosure::checked_pow+0xec>
   17666:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   1766c:	48 89 d8             	mov    %rbx,%rax
   1766f:	48 83 c4 38          	add    $0x38,%rsp
   17673:	5b                   	pop    %rbx
   17674:	41 5c                	pop    %r12
   17676:	41 5d                	pop    %r13
   17678:	41 5e                	pop    %r14
   1767a:	41 5f                	pop    %r15
   1767c:	5d                   	pop    %rbp
   1767d:	c3                   	ret
   1767e:	8b 7c 24 10          	mov    0x10(%rsp),%edi
   17682:	44 89 e0             	mov    %r12d,%eax
   17685:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   1768a:	89 f9                	mov    %edi,%ecx
   1768c:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   17692:	ba 00 00 00 80       	mov    $0x80000000,%edx
   17697:	29 c2                	sub    %eax,%edx
   17699:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   1769f:	44 09 e8             	or     %r13d,%eax
   176a2:	45 85 e4             	test   %r12d,%r12d
   176a5:	48 0f 49 d0          	cmovns %rax,%rdx
   176a9:	be 00 00 00 80       	mov    $0x80000000,%esi
   176ae:	29 ce                	sub    %ecx,%esi
   176b0:	89 c8                	mov    %ecx,%eax
   176b2:	44 09 e8             	or     %r13d,%eax
   176b5:	85 ff                	test   %edi,%edi
   176b7:	48 0f 49 f0          	cmovns %rax,%rsi
   176bb:	b0 01                	mov    $0x1,%al
   176bd:	39 f2                	cmp    %esi,%edx
   176bf:	77 9a                	ja     1765b <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
   176c1:	89 7c 24 2c          	mov    %edi,0x2c(%rsp)
   176c5:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   176ca:	be 00 00 00 80       	mov    $0x80000000,%esi
   176cf:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   176d4:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   176d9:	e8 b2 3d 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   176de:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   176e3:	0f 84 6d ff ff ff    	je     17656 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   176e9:	4c 89 64 24 20       	mov    %r12,0x20(%rsp)
   176ee:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   176f3:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   176f8:	be 00 00 00 80       	mov    $0x80000000,%esi
   176fd:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17702:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
   17707:	e8 84 3d 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1770c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   17711:	0f 84 3f ff ff ff    	je     17656 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   17717:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   1771b:	44 89 e0             	mov    %r12d,%eax
   1771e:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   17723:	89 ca                	mov    %ecx,%edx
   17725:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1772b:	be 00 00 00 80       	mov    $0x80000000,%esi
   17730:	29 c6                	sub    %eax,%esi
   17732:	44 09 e8             	or     %r13d,%eax
   17735:	45 85 e4             	test   %r12d,%r12d
   17738:	48 0f 49 f0          	cmovns %rax,%rsi
   1773c:	89 d0                	mov    %edx,%eax
   1773e:	44 09 e8             	or     %r13d,%eax
   17741:	41 29 d5             	sub    %edx,%r13d
   17744:	85 c9                	test   %ecx,%ecx
   17746:	4c 0f 49 e8          	cmovns %rax,%r13
   1774a:	b0 01                	mov    $0x1,%al
   1774c:	44 39 ee             	cmp    %r13d,%esi
   1774f:	0f 87 06 ff ff ff    	ja     1765b <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
   17755:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
   1775a:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
   1775e:	44 89 e2             	mov    %r12d,%edx
   17761:	e8 7a 40 00 00       	call   1b7e0 <hyperinterval::bounds::Bounds<T>::hull>
   17766:	41 89 c5             	mov    %eax,%r13d
   17769:	41 89 d4             	mov    %edx,%r12d
   1776c:	85 ed                	test   %ebp,%ebp
   1776e:	0f 95 c0             	setne  %al
   17771:	40 f6 c5 01          	test   $0x1,%bpl
   17775:	0f 94 c1             	sete   %cl
   17778:	84 c8                	test   %cl,%al
   1777a:	74 11                	je     1778d <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
   1777c:	44 89 ff             	mov    %r15d,%edi
   1777f:	44 89 f6             	mov    %r14d,%esi
   17782:	31 d2                	xor    %edx,%edx
   17784:	e8 07 42 00 00       	call   1b990 <hyperinterval::bounds::Bounds<T>::signs>
   17789:	a8 02                	test   $0x2,%al
   1778b:	75 13                	jne    177a0 <hyperinterval::float::F32Enclosure::checked_pow+0x220>
   1778d:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   17793:	44 89 6b 04          	mov    %r13d,0x4(%rbx)
   17797:	44 89 63 08          	mov    %r12d,0x8(%rbx)
   1779b:	e9 cc fe ff ff       	jmp    1766c <hyperinterval::float::F32Enclosure::checked_pow+0xec>
   177a0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   177a5:	e8 26 14 00 00       	call   18bd0 <hyperinterval::float::F32Enclosure::from_bits>
   177aa:	8b 44 24 08          	mov    0x8(%rsp),%eax
   177ae:	83 f8 02             	cmp    $0x2,%eax
   177b1:	75 0a                	jne    177bd <hyperinterval::float::F32Enclosure::checked_pow+0x23d>
   177b3:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   177b8:	e9 9e fe ff ff       	jmp    1765b <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
   177bd:	83 f8 01             	cmp    $0x1,%eax
   177c0:	75 cb                	jne    1778d <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
   177c2:	8b 54 24 0c          	mov    0xc(%rsp),%edx
   177c6:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   177ca:	44 89 ef             	mov    %r13d,%edi
   177cd:	44 89 e6             	mov    %r12d,%esi
   177d0:	e8 0b 40 00 00       	call   1b7e0 <hyperinterval::bounds::Bounds<T>::hull>
   177d5:	41 89 c5             	mov    %eax,%r13d
   177d8:	41 89 d4             	mov    %edx,%r12d
   177db:	eb b0                	jmp    1778d <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
   177dd:	cc                   	int3
   177de:	cc                   	int3
   177df:	cc                   	int3

hyperinterval::float::F32Enclosure::corner_image:
   177e0:	55                   	push   %rbp
   177e1:	41 57                	push   %r15
   177e3:	41 56                	push   %r14
   177e5:	41 55                	push   %r13
   177e7:	41 54                	push   %r12
   177e9:	53                   	push   %rbx
   177ea:	48 83 ec 58          	sub    $0x58,%rsp
   177ee:	48 89 fb             	mov    %rdi,%rbx
   177f1:	f6 06 01             	testb  $0x1,(%rsi)
   177f4:	74 49                	je     1783f <hyperinterval::float::F32Enclosure::corner_image+0x5f>
   177f6:	f6 02 01             	testb  $0x1,(%rdx)
   177f9:	74 44                	je     1783f <hyperinterval::float::F32Enclosure::corner_image+0x5f>
   177fb:	44 8b 62 04          	mov    0x4(%rdx),%r12d
   177ff:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   17803:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
   17807:	8b 46 08             	mov    0x8(%rsi),%eax
   1780a:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1780f:	84 c9                	test   %cl,%cl
   17811:	74 37                	je     1784a <hyperinterval::float::F32Enclosure::corner_image+0x6a>
   17813:	48 89 e7             	mov    %rsp,%rdi
   17816:	be 00 00 00 80       	mov    $0x80000000,%esi
   1781b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17820:	4c 89 e9             	mov    %r13,%rcx
   17823:	4d 89 e0             	mov    %r12,%r8
   17826:	e8 55 33 00 00       	call   1ab80 <hyperinterval::ieee::Format::div>
   1782b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1782f:	0f 84 bf 00 00 00    	je     178f4 <hyperinterval::float::F32Enclosure::corner_image+0x114>
   17835:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1783a:	e9 ad 00 00 00       	jmp    178ec <hyperinterval::float::F32Enclosure::corner_image+0x10c>
   1783f:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   17845:	e9 42 03 00 00       	jmp    17b8c <hyperinterval::float::F32Enclosure::corner_image+0x3ac>
   1784a:	44 89 e8             	mov    %r13d,%eax
   1784d:	c1 e8 17             	shr    $0x17,%eax
   17850:	0f b6 d0             	movzbl %al,%edx
   17853:	44 89 ee             	mov    %r13d,%esi
   17856:	81 e6 ff ff 7f 00    	and    $0x7fffff,%esi
   1785c:	31 c9                	xor    %ecx,%ecx
   1785e:	85 d2                	test   %edx,%edx
   17860:	0f 95 c1             	setne  %cl
   17863:	b8 01 00 00 00       	mov    $0x1,%eax
   17868:	0f 45 c2             	cmovne %edx,%eax
   1786b:	c1 e1 17             	shl    $0x17,%ecx
   1786e:	48 09 f1             	or     %rsi,%rcx
   17871:	44 89 e2             	mov    %r12d,%edx
   17874:	c1 ea 17             	shr    $0x17,%edx
   17877:	0f b6 d2             	movzbl %dl,%edx
   1787a:	44 89 e6             	mov    %r12d,%esi
   1787d:	81 e6 ff ff 7f 00    	and    $0x7fffff,%esi
   17883:	8d ba d4 fe ff ff    	lea    -0x12c(%rdx),%edi
   17889:	45 31 c0             	xor    %r8d,%r8d
   1788c:	85 d2                	test   %edx,%edx
   1788e:	ba d5 fe ff ff       	mov    $0xfffffed5,%edx
   17893:	0f 45 d7             	cmovne %edi,%edx
   17896:	41 0f 95 c0          	setne  %r8b
   1789a:	41 c1 e0 17          	shl    $0x17,%r8d
   1789e:	49 09 f0             	or     %rsi,%r8
   178a1:	4c 0f af c1          	imul   %rcx,%r8
   178a5:	44 89 e9             	mov    %r13d,%ecx
   178a8:	44 31 e1             	xor    %r12d,%ecx
   178ab:	01 c2                	add    %eax,%edx
   178ad:	c1 e9 1f             	shr    $0x1f,%ecx
   178b0:	88 4c 24 14          	mov    %cl,0x14(%rsp)
   178b4:	4c 89 04 24          	mov    %r8,(%rsp)
   178b8:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   178bf:	00 00 
   178c1:	89 54 24 10          	mov    %edx,0x10(%rsp)
   178c5:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   178ca:	48 89 e1             	mov    %rsp,%rcx
   178cd:	be 00 00 00 80       	mov    $0x80000000,%esi
   178d2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   178d7:	e8 f4 3b 00 00       	call   1b4d0 <hyperinterval::ieee::Format::rounded>
   178dc:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   178e1:	0f 84 54 02 00 00    	je     17b3b <hyperinterval::float::F32Enclosure::corner_image+0x35b>
   178e7:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   178ec:	88 43 04             	mov    %al,0x4(%rbx)
   178ef:	e9 92 02 00 00       	jmp    17b86 <hyperinterval::float::F32Enclosure::corner_image+0x3a6>
   178f4:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   178f8:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   178fd:	48 89 e7             	mov    %rsp,%rdi
   17900:	be 00 00 00 80       	mov    $0x80000000,%esi
   17905:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1790a:	e8 81 3b 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1790f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17913:	0f 85 63 02 00 00    	jne    17b7c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17919:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1791e:	48 89 e7             	mov    %rsp,%rdi
   17921:	be 00 00 00 80       	mov    $0x80000000,%esi
   17926:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1792b:	4c 89 f9             	mov    %r15,%rcx
   1792e:	e8 5d 3b 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   17933:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17937:	0f 85 3f 02 00 00    	jne    17b7c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   1793d:	8b 7c 24 08          	mov    0x8(%rsp),%edi
   17941:	89 e8                	mov    %ebp,%eax
   17943:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   17948:	89 f9                	mov    %edi,%ecx
   1794a:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   17950:	ba 00 00 00 80       	mov    $0x80000000,%edx
   17955:	29 c2                	sub    %eax,%edx
   17957:	be 00 00 00 80       	mov    $0x80000000,%esi
   1795c:	09 f0                	or     %esi,%eax
   1795e:	85 ed                	test   %ebp,%ebp
   17960:	48 0f 49 d0          	cmovns %rax,%rdx
   17964:	b8 00 00 00 80       	mov    $0x80000000,%eax
   17969:	29 c8                	sub    %ecx,%eax
   1796b:	09 f1                	or     %esi,%ecx
   1796d:	85 ff                	test   %edi,%edi
   1796f:	48 0f 49 c1          	cmovns %rcx,%rax
   17973:	41 b7 01             	mov    $0x1,%r15b
   17976:	39 c2                	cmp    %eax,%edx
   17978:	0f 87 04 02 00 00    	ja     17b82 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   1797e:	89 7c 24 50          	mov    %edi,0x50(%rsp)
   17982:	48 89 6c 24 28       	mov    %rbp,0x28(%rsp)
   17987:	48 89 e7             	mov    %rsp,%rdi
   1798a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1798f:	4c 89 e9             	mov    %r13,%rcx
   17992:	4d 89 f0             	mov    %r14,%r8
   17995:	e8 e6 31 00 00       	call   1ab80 <hyperinterval::ieee::Format::div>
   1799a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1799e:	0f 85 91 fe ff ff    	jne    17835 <hyperinterval::float::F32Enclosure::corner_image+0x55>
   179a4:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   179a8:	44 8b 6c 24 10       	mov    0x10(%rsp),%r13d
   179ad:	48 89 e7             	mov    %rsp,%rdi
   179b0:	be 00 00 00 80       	mov    $0x80000000,%esi
   179b5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   179ba:	e8 d1 3a 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   179bf:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   179c3:	0f 85 b3 01 00 00    	jne    17b7c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   179c9:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   179ce:	48 89 e7             	mov    %rsp,%rdi
   179d1:	be 00 00 00 80       	mov    $0x80000000,%esi
   179d6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   179db:	4c 89 e9             	mov    %r13,%rcx
   179de:	e8 ad 3a 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   179e3:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   179e7:	0f 85 8f 01 00 00    	jne    17b7c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   179ed:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   179f1:	89 e8                	mov    %ebp,%eax
   179f3:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   179f8:	89 ca                	mov    %ecx,%edx
   179fa:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   17a00:	be 00 00 00 80       	mov    $0x80000000,%esi
   17a05:	29 c6                	sub    %eax,%esi
   17a07:	bf 00 00 00 80       	mov    $0x80000000,%edi
   17a0c:	09 f8                	or     %edi,%eax
   17a0e:	85 ed                	test   %ebp,%ebp
   17a10:	48 0f 49 f0          	cmovns %rax,%rsi
   17a14:	b8 00 00 00 80       	mov    $0x80000000,%eax
   17a19:	29 d0                	sub    %edx,%eax
   17a1b:	09 fa                	or     %edi,%edx
   17a1d:	85 c9                	test   %ecx,%ecx
   17a1f:	48 0f 49 c2          	cmovns %rdx,%rax
   17a23:	39 c6                	cmp    %eax,%esi
   17a25:	0f 87 57 01 00 00    	ja     17b82 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   17a2b:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   17a30:	8b 74 24 50          	mov    0x50(%rsp),%esi
   17a34:	89 ea                	mov    %ebp,%edx
   17a36:	e8 a5 3d 00 00       	call   1b7e0 <hyperinterval::bounds::Bounds<T>::hull>
   17a3b:	89 c5                	mov    %eax,%ebp
   17a3d:	41 89 d5             	mov    %edx,%r13d
   17a40:	48 89 e7             	mov    %rsp,%rdi
   17a43:	be 00 00 00 80       	mov    $0x80000000,%esi
   17a48:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17a4d:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   17a52:	4d 89 e0             	mov    %r12,%r8
   17a55:	e8 26 31 00 00       	call   1ab80 <hyperinterval::ieee::Format::div>
   17a5a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17a5e:	0f 85 d1 fd ff ff    	jne    17835 <hyperinterval::float::F32Enclosure::corner_image+0x55>
   17a64:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17a68:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   17a6d:	48 89 e7             	mov    %rsp,%rdi
   17a70:	be 00 00 00 80       	mov    $0x80000000,%esi
   17a75:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17a7a:	e8 11 3a 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   17a7f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17a83:	0f 85 f3 00 00 00    	jne    17b7c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17a89:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   17a8e:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   17a93:	48 89 e7             	mov    %rsp,%rdi
   17a96:	be 00 00 00 80       	mov    $0x80000000,%esi
   17a9b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17aa0:	4c 89 e1             	mov    %r12,%rcx
   17aa3:	e8 e8 39 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   17aa8:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17aac:	0f 85 ca 00 00 00    	jne    17b7c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17ab2:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17ab6:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   17abb:	89 d0                	mov    %edx,%eax
   17abd:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   17ac2:	41 89 c8             	mov    %ecx,%r8d
   17ac5:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   17acc:	be 00 00 00 80       	mov    $0x80000000,%esi
   17ad1:	29 c6                	sub    %eax,%esi
   17ad3:	bf 00 00 00 80       	mov    $0x80000000,%edi
   17ad8:	09 f8                	or     %edi,%eax
   17ada:	85 d2                	test   %edx,%edx
   17adc:	48 0f 49 f0          	cmovns %rax,%rsi
   17ae0:	b8 00 00 00 80       	mov    $0x80000000,%eax
   17ae5:	44 29 c0             	sub    %r8d,%eax
   17ae8:	41 09 f8             	or     %edi,%r8d
   17aeb:	85 c9                	test   %ecx,%ecx
   17aed:	49 0f 49 c0          	cmovns %r8,%rax
   17af1:	39 c6                	cmp    %eax,%esi
   17af3:	0f 87 89 00 00 00    	ja     17b82 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   17af9:	89 ef                	mov    %ebp,%edi
   17afb:	44 89 ee             	mov    %r13d,%esi
   17afe:	e8 dd 3c 00 00       	call   1b7e0 <hyperinterval::bounds::Bounds<T>::hull>
   17b03:	41 89 c5             	mov    %eax,%r13d
   17b06:	41 89 d4             	mov    %edx,%r12d
   17b09:	48 89 e7             	mov    %rsp,%rdi
   17b0c:	be 00 00 00 80       	mov    $0x80000000,%esi
   17b11:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17b16:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   17b1b:	4d 89 f0             	mov    %r14,%r8
   17b1e:	e8 5d 30 00 00       	call   1ab80 <hyperinterval::ieee::Format::div>
   17b23:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17b27:	0f 85 08 fd ff ff    	jne    17835 <hyperinterval::float::F32Enclosure::corner_image+0x55>
   17b2d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17b31:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   17b36:	e9 62 02 00 00       	jmp    17d9d <hyperinterval::float::F32Enclosure::corner_image+0x5bd>
   17b3b:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   17b3f:	44 8b 7c 24 40       	mov    0x40(%rsp),%r15d
   17b44:	48 89 e7             	mov    %rsp,%rdi
   17b47:	be 00 00 00 80       	mov    $0x80000000,%esi
   17b4c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17b51:	e8 3a 39 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   17b56:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   17b5a:	74 20                	je     17b7c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17b5c:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   17b61:	48 89 e7             	mov    %rsp,%rdi
   17b64:	be 00 00 00 80       	mov    $0x80000000,%esi
   17b69:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17b6e:	4c 89 f9             	mov    %r15,%rcx
   17b71:	e8 1a 39 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   17b76:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   17b7a:	75 1f                	jne    17b9b <hyperinterval::float::F32Enclosure::corner_image+0x3bb>
   17b7c:	44 0f b6 7c 24 01    	movzbl 0x1(%rsp),%r15d
   17b82:	44 88 7b 04          	mov    %r15b,0x4(%rbx)
   17b86:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17b8c:	48 83 c4 58          	add    $0x58,%rsp
   17b90:	5b                   	pop    %rbx
   17b91:	41 5c                	pop    %r12
   17b93:	41 5d                	pop    %r13
   17b95:	41 5e                	pop    %r14
   17b97:	41 5f                	pop    %r15
   17b99:	5d                   	pop    %rbp
   17b9a:	c3                   	ret
   17b9b:	8b 7c 24 08          	mov    0x8(%rsp),%edi
   17b9f:	89 e8                	mov    %ebp,%eax
   17ba1:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   17ba6:	89 f9                	mov    %edi,%ecx
   17ba8:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   17bae:	ba 00 00 00 80       	mov    $0x80000000,%edx
   17bb3:	29 c2                	sub    %eax,%edx
   17bb5:	be 00 00 00 80       	mov    $0x80000000,%esi
   17bba:	09 f0                	or     %esi,%eax
   17bbc:	85 ed                	test   %ebp,%ebp
   17bbe:	48 0f 49 d0          	cmovns %rax,%rdx
   17bc2:	b8 00 00 00 80       	mov    $0x80000000,%eax
   17bc7:	29 c8                	sub    %ecx,%eax
   17bc9:	09 f1                	or     %esi,%ecx
   17bcb:	85 ff                	test   %edi,%edi
   17bcd:	48 0f 49 c1          	cmovns %rcx,%rax
   17bd1:	41 b7 01             	mov    $0x1,%r15b
   17bd4:	39 c2                	cmp    %eax,%edx
   17bd6:	77 aa                	ja     17b82 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   17bd8:	89 7c 24 28          	mov    %edi,0x28(%rsp)
   17bdc:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   17be1:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17be6:	4c 89 e9             	mov    %r13,%rcx
   17be9:	4d 89 f0             	mov    %r14,%r8
   17bec:	e8 cf 33 00 00       	call   1afc0 <hyperinterval::ieee::Format::mul>
   17bf1:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   17bf6:	0f 85 eb fc ff ff    	jne    178e7 <hyperinterval::float::F32Enclosure::corner_image+0x107>
   17bfc:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   17c00:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
   17c05:	48 89 e7             	mov    %rsp,%rdi
   17c08:	be 00 00 00 80       	mov    $0x80000000,%esi
   17c0d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17c12:	e8 79 38 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   17c17:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17c1b:	0f 85 5b ff ff ff    	jne    17b7c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17c21:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   17c26:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   17c2b:	48 89 e7             	mov    %rsp,%rdi
   17c2e:	be 00 00 00 80       	mov    $0x80000000,%esi
   17c33:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17c38:	4c 89 e9             	mov    %r13,%rcx
   17c3b:	e8 50 38 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   17c40:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17c44:	0f 85 32 ff ff ff    	jne    17b7c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17c4a:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17c4e:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
   17c53:	89 d0                	mov    %edx,%eax
   17c55:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   17c5a:	41 89 c8             	mov    %ecx,%r8d
   17c5d:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   17c64:	be 00 00 00 80       	mov    $0x80000000,%esi
   17c69:	29 c6                	sub    %eax,%esi
   17c6b:	bf 00 00 00 80       	mov    $0x80000000,%edi
   17c70:	09 f8                	or     %edi,%eax
   17c72:	85 d2                	test   %edx,%edx
   17c74:	48 0f 49 f0          	cmovns %rax,%rsi
   17c78:	b8 00 00 00 80       	mov    $0x80000000,%eax
   17c7d:	44 29 c0             	sub    %r8d,%eax
   17c80:	41 09 f8             	or     %edi,%r8d
   17c83:	85 c9                	test   %ecx,%ecx
   17c85:	49 0f 49 c0          	cmovns %r8,%rax
   17c89:	39 c6                	cmp    %eax,%esi
   17c8b:	0f 87 f1 fe ff ff    	ja     17b82 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   17c91:	89 ef                	mov    %ebp,%edi
   17c93:	8b 74 24 28          	mov    0x28(%rsp),%esi
   17c97:	e8 44 3b 00 00       	call   1b7e0 <hyperinterval::bounds::Bounds<T>::hull>
   17c9c:	89 c5                	mov    %eax,%ebp
   17c9e:	41 89 d5             	mov    %edx,%r13d
   17ca1:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   17ca6:	be 00 00 00 80       	mov    $0x80000000,%esi
   17cab:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17cb0:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   17cb5:	4d 89 e0             	mov    %r12,%r8
   17cb8:	e8 03 33 00 00       	call   1afc0 <hyperinterval::ieee::Format::mul>
   17cbd:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   17cc2:	0f 85 1f fc ff ff    	jne    178e7 <hyperinterval::float::F32Enclosure::corner_image+0x107>
   17cc8:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   17ccc:	44 8b 64 24 40       	mov    0x40(%rsp),%r12d
   17cd1:	48 89 e7             	mov    %rsp,%rdi
   17cd4:	be 00 00 00 80       	mov    $0x80000000,%esi
   17cd9:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17cde:	e8 ad 37 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   17ce3:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17ce7:	0f 85 8f fe ff ff    	jne    17b7c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17ced:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   17cf2:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   17cf7:	48 89 e7             	mov    %rsp,%rdi
   17cfa:	be 00 00 00 80       	mov    $0x80000000,%esi
   17cff:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17d04:	4c 89 e1             	mov    %r12,%rcx
   17d07:	e8 84 37 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   17d0c:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17d10:	0f 85 66 fe ff ff    	jne    17b7c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17d16:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17d1a:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   17d1f:	89 d0                	mov    %edx,%eax
   17d21:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   17d26:	41 89 c8             	mov    %ecx,%r8d
   17d29:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   17d30:	be 00 00 00 80       	mov    $0x80000000,%esi
   17d35:	29 c6                	sub    %eax,%esi
   17d37:	bf 00 00 00 80       	mov    $0x80000000,%edi
   17d3c:	09 f8                	or     %edi,%eax
   17d3e:	85 d2                	test   %edx,%edx
   17d40:	48 0f 49 f0          	cmovns %rax,%rsi
   17d44:	b8 00 00 00 80       	mov    $0x80000000,%eax
   17d49:	44 29 c0             	sub    %r8d,%eax
   17d4c:	41 09 f8             	or     %edi,%r8d
   17d4f:	85 c9                	test   %ecx,%ecx
   17d51:	49 0f 49 c0          	cmovns %r8,%rax
   17d55:	39 c6                	cmp    %eax,%esi
   17d57:	0f 87 25 fe ff ff    	ja     17b82 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   17d5d:	89 ef                	mov    %ebp,%edi
   17d5f:	44 89 ee             	mov    %r13d,%esi
   17d62:	e8 79 3a 00 00       	call   1b7e0 <hyperinterval::bounds::Bounds<T>::hull>
   17d67:	41 89 c5             	mov    %eax,%r13d
   17d6a:	41 89 d4             	mov    %edx,%r12d
   17d6d:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   17d72:	be 00 00 00 80       	mov    $0x80000000,%esi
   17d77:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17d7c:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   17d81:	4d 89 f0             	mov    %r14,%r8
   17d84:	e8 37 32 00 00       	call   1afc0 <hyperinterval::ieee::Format::mul>
   17d89:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   17d8e:	0f 85 53 fb ff ff    	jne    178e7 <hyperinterval::float::F32Enclosure::corner_image+0x107>
   17d94:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   17d98:	44 8b 74 24 40       	mov    0x40(%rsp),%r14d
   17d9d:	48 89 e7             	mov    %rsp,%rdi
   17da0:	be 00 00 00 80       	mov    $0x80000000,%esi
   17da5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17daa:	e8 e1 36 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   17daf:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17db3:	0f 85 c3 fd ff ff    	jne    17b7c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17db9:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   17dbe:	48 89 e7             	mov    %rsp,%rdi
   17dc1:	be 00 00 00 80       	mov    $0x80000000,%esi
   17dc6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17dcb:	4c 89 f1             	mov    %r14,%rcx
   17dce:	e8 bd 36 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   17dd3:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17dd7:	0f 85 9f fd ff ff    	jne    17b7c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   17ddd:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17de1:	89 e8                	mov    %ebp,%eax
   17de3:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   17de8:	89 ca                	mov    %ecx,%edx
   17dea:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   17df0:	be 00 00 00 80       	mov    $0x80000000,%esi
   17df5:	29 c6                	sub    %eax,%esi
   17df7:	bf 00 00 00 80       	mov    $0x80000000,%edi
   17dfc:	09 f8                	or     %edi,%eax
   17dfe:	85 ed                	test   %ebp,%ebp
   17e00:	48 0f 49 f0          	cmovns %rax,%rsi
   17e04:	89 d0                	mov    %edx,%eax
   17e06:	09 f8                	or     %edi,%eax
   17e08:	29 d7                	sub    %edx,%edi
   17e0a:	85 c9                	test   %ecx,%ecx
   17e0c:	48 0f 49 f8          	cmovns %rax,%rdi
   17e10:	39 fe                	cmp    %edi,%esi
   17e12:	0f 87 6a fd ff ff    	ja     17b82 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   17e18:	44 89 ef             	mov    %r13d,%edi
   17e1b:	44 89 e6             	mov    %r12d,%esi
   17e1e:	89 ea                	mov    %ebp,%edx
   17e20:	e8 bb 39 00 00       	call   1b7e0 <hyperinterval::bounds::Bounds<T>::hull>
   17e25:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   17e2b:	89 43 04             	mov    %eax,0x4(%rbx)
   17e2e:	89 53 08             	mov    %edx,0x8(%rbx)
   17e31:	e9 56 fd ff ff       	jmp    17b8c <hyperinterval::float::F32Enclosure::corner_image+0x3ac>
   17e36:	cc                   	int3
   17e37:	cc                   	int3
   17e38:	cc                   	int3
   17e39:	cc                   	int3
   17e3a:	cc                   	int3
   17e3b:	cc                   	int3
   17e3c:	cc                   	int3
   17e3d:	cc                   	int3
   17e3e:	cc                   	int3
   17e3f:	cc                   	int3

hyperinterval::float::F32Enclosure::intersection:
   17e40:	48 89 f8             	mov    %rdi,%rax
   17e43:	45 31 c9             	xor    %r9d,%r9d
   17e46:	f6 06 01             	testb  $0x1,(%rsi)
   17e49:	0f 84 ed 00 00 00    	je     17f3c <hyperinterval::float::F32Enclosure::intersection+0xfc>
   17e4f:	f6 02 01             	testb  $0x1,(%rdx)
   17e52:	0f 84 d9 00 00 00    	je     17f31 <hyperinterval::float::F32Enclosure::intersection+0xf1>
   17e58:	53                   	push   %rbx
   17e59:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   17e5d:	8b 4e 04             	mov    0x4(%rsi),%ecx
   17e60:	bf 00 00 00 80       	mov    $0x80000000,%edi
   17e65:	41 89 c9             	mov    %ecx,%r9d
   17e68:	41 09 f9             	or     %edi,%r9d
   17e6b:	41 89 ca             	mov    %ecx,%r10d
   17e6e:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   17e75:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   17e7b:	45 29 d3             	sub    %r10d,%r11d
   17e7e:	85 c9                	test   %ecx,%ecx
   17e80:	4d 0f 49 d9          	cmovns %r9,%r11
   17e84:	45 89 c1             	mov    %r8d,%r9d
   17e87:	41 09 f9             	or     %edi,%r9d
   17e8a:	45 89 c2             	mov    %r8d,%r10d
   17e8d:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   17e94:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   17e99:	44 29 d3             	sub    %r10d,%ebx
   17e9c:	45 85 c0             	test   %r8d,%r8d
   17e9f:	49 0f 49 d9          	cmovns %r9,%rbx
   17ea3:	8b 52 08             	mov    0x8(%rdx),%edx
   17ea6:	41 39 db             	cmp    %ebx,%r11d
   17ea9:	41 0f 42 c8          	cmovb  %r8d,%ecx
   17ead:	44 8b 46 08          	mov    0x8(%rsi),%r8d
   17eb1:	44 89 c6             	mov    %r8d,%esi
   17eb4:	09 fe                	or     %edi,%esi
   17eb6:	45 89 c1             	mov    %r8d,%r9d
   17eb9:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   17ec0:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   17ec6:	45 29 ca             	sub    %r9d,%r10d
   17ec9:	45 85 c0             	test   %r8d,%r8d
   17ecc:	4c 0f 49 d6          	cmovns %rsi,%r10
   17ed0:	89 d6                	mov    %edx,%esi
   17ed2:	09 fe                	or     %edi,%esi
   17ed4:	41 89 d1             	mov    %edx,%r9d
   17ed7:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   17ede:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   17ee4:	45 29 cb             	sub    %r9d,%r11d
   17ee7:	85 d2                	test   %edx,%edx
   17ee9:	4c 0f 49 de          	cmovns %rsi,%r11
   17eed:	45 39 da             	cmp    %r11d,%r10d
   17ef0:	44 0f 47 c2          	cmova  %edx,%r8d
   17ef4:	89 ca                	mov    %ecx,%edx
   17ef6:	09 fa                	or     %edi,%edx
   17ef8:	89 ce                	mov    %ecx,%esi
   17efa:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   17f00:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   17f06:	41 29 f2             	sub    %esi,%r10d
   17f09:	85 c9                	test   %ecx,%ecx
   17f0b:	4c 0f 49 d2          	cmovns %rdx,%r10
   17f0f:	44 89 c2             	mov    %r8d,%edx
   17f12:	09 fa                	or     %edi,%edx
   17f14:	44 89 c6             	mov    %r8d,%esi
   17f17:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   17f1d:	29 f7                	sub    %esi,%edi
   17f1f:	45 85 c0             	test   %r8d,%r8d
   17f22:	48 0f 49 fa          	cmovns %rdx,%rdi
   17f26:	45 31 c9             	xor    %r9d,%r9d
   17f29:	41 39 fa             	cmp    %edi,%r10d
   17f2c:	41 0f 96 c1          	setbe  %r9b
   17f30:	5b                   	pop    %rbx
   17f31:	44 89 08             	mov    %r9d,(%rax)
   17f34:	89 48 04             	mov    %ecx,0x4(%rax)
   17f37:	44 89 40 08          	mov    %r8d,0x8(%rax)
   17f3b:	c3                   	ret
   17f3c:	44 89 08             	mov    %r9d,(%rax)
   17f3f:	89 48 04             	mov    %ecx,0x4(%rax)
   17f42:	44 89 40 08          	mov    %r8d,0x8(%rax)
   17f46:	c3                   	ret
   17f47:	cc                   	int3
   17f48:	cc                   	int3
   17f49:	cc                   	int3
   17f4a:	cc                   	int3
   17f4b:	cc                   	int3
   17f4c:	cc                   	int3
   17f4d:	cc                   	int3
   17f4e:	cc                   	int3
   17f4f:	cc                   	int3

hyperinterval::float::F32Enclosure::contains_point:
   17f50:	41 56                	push   %r14
   17f52:	53                   	push   %rbx
   17f53:	48 83 ec 18          	sub    $0x18,%rsp
   17f57:	48 89 fb             	mov    %rdi,%rbx
   17f5a:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   17f60:	66 0f 7e c1          	movd   %xmm0,%ecx
   17f64:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17f69:	be 00 00 00 80       	mov    $0x80000000,%esi
   17f6e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17f73:	e8 18 35 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   17f78:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   17f7d:	3c 01                	cmp    $0x1,%al
   17f7f:	75 0d                	jne    17f8e <hyperinterval::float::F32Enclosure::contains_point+0x3e>
   17f81:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   17f86:	48 83 c4 18          	add    $0x18,%rsp
   17f8a:	5b                   	pop    %rbx
   17f8b:	41 5e                	pop    %r14
   17f8d:	c3                   	ret
   17f8e:	f6 03 01             	testb  $0x1,(%rbx)
   17f91:	74 44                	je     17fd7 <hyperinterval::float::F32Enclosure::contains_point+0x87>
   17f93:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   17f98:	8b 73 04             	mov    0x4(%rbx),%esi
   17f9b:	89 d1                	mov    %edx,%ecx
   17f9d:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   17fa3:	89 f7                	mov    %esi,%edi
   17fa5:	44 09 f7             	or     %r14d,%edi
   17fa8:	41 89 f0             	mov    %esi,%r8d
   17fab:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   17fb2:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   17fb8:	45 29 c1             	sub    %r8d,%r9d
   17fbb:	85 f6                	test   %esi,%esi
   17fbd:	4c 0f 49 cf          	cmovns %rdi,%r9
   17fc1:	be 00 00 00 80       	mov    $0x80000000,%esi
   17fc6:	48 29 ce             	sub    %rcx,%rsi
   17fc9:	4c 09 f1             	or     %r14,%rcx
   17fcc:	85 d2                	test   %edx,%edx
   17fce:	48 0f 48 ce          	cmovs  %rsi,%rcx
   17fd2:	41 39 c9             	cmp    %ecx,%r9d
   17fd5:	76 0a                	jbe    17fe1 <hyperinterval::float::F32Enclosure::contains_point+0x91>
   17fd7:	31 d2                	xor    %edx,%edx
   17fd9:	48 83 c4 18          	add    $0x18,%rsp
   17fdd:	5b                   	pop    %rbx
   17fde:	41 5e                	pop    %r14
   17fe0:	c3                   	ret
   17fe1:	8b 53 08             	mov    0x8(%rbx),%edx
   17fe4:	89 d6                	mov    %edx,%esi
   17fe6:	44 09 f6             	or     %r14d,%esi
   17fe9:	89 d7                	mov    %edx,%edi
   17feb:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   17ff1:	41 29 fe             	sub    %edi,%r14d
   17ff4:	85 d2                	test   %edx,%edx
   17ff6:	4c 0f 49 f6          	cmovns %rsi,%r14
   17ffa:	44 39 f1             	cmp    %r14d,%ecx
   17ffd:	0f 96 c2             	setbe  %dl
   18000:	48 83 c4 18          	add    $0x18,%rsp
   18004:	5b                   	pop    %rbx
   18005:	41 5e                	pop    %r14
   18007:	c3                   	ret
   18008:	cc                   	int3
   18009:	cc                   	int3
   1800a:	cc                   	int3
   1800b:	cc                   	int3
   1800c:	cc                   	int3
   1800d:	cc                   	int3
   1800e:	cc                   	int3
   1800f:	cc                   	int3

hyperinterval::float::F32Enclosure::interior_subset_of:
   18010:	b0 01                	mov    $0x1,%al
   18012:	f6 07 01             	testb  $0x1,(%rdi)
   18015:	0f 84 93 00 00 00    	je     180ae <hyperinterval::float::F32Enclosure::interior_subset_of+0x9e>
   1801b:	f6 06 01             	testb  $0x1,(%rsi)
   1801e:	0f 84 88 00 00 00    	je     180ac <hyperinterval::float::F32Enclosure::interior_subset_of+0x9c>
   18024:	8b 4f 04             	mov    0x4(%rdi),%ecx
   18027:	8b 56 04             	mov    0x4(%rsi),%edx
   1802a:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1802f:	41 89 d0             	mov    %edx,%r8d
   18032:	41 09 c0             	or     %eax,%r8d
   18035:	41 89 d1             	mov    %edx,%r9d
   18038:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1803f:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18045:	45 29 ca             	sub    %r9d,%r10d
   18048:	85 d2                	test   %edx,%edx
   1804a:	4d 0f 49 d0          	cmovns %r8,%r10
   1804e:	89 ca                	mov    %ecx,%edx
   18050:	09 c2                	or     %eax,%edx
   18052:	41 89 c8             	mov    %ecx,%r8d
   18055:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1805c:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   18062:	45 29 c1             	sub    %r8d,%r9d
   18065:	85 c9                	test   %ecx,%ecx
   18067:	4c 0f 49 ca          	cmovns %rdx,%r9
   1806b:	45 39 ca             	cmp    %r9d,%r10d
   1806e:	73 3c                	jae    180ac <hyperinterval::float::F32Enclosure::interior_subset_of+0x9c>
   18070:	8b 4f 08             	mov    0x8(%rdi),%ecx
   18073:	8b 56 08             	mov    0x8(%rsi),%edx
   18076:	89 ce                	mov    %ecx,%esi
   18078:	09 c6                	or     %eax,%esi
   1807a:	89 cf                	mov    %ecx,%edi
   1807c:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18082:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18088:	41 29 f8             	sub    %edi,%r8d
   1808b:	85 c9                	test   %ecx,%ecx
   1808d:	4c 0f 49 c6          	cmovns %rsi,%r8
   18091:	89 d1                	mov    %edx,%ecx
   18093:	09 c1                	or     %eax,%ecx
   18095:	89 d6                	mov    %edx,%esi
   18097:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1809d:	29 f0                	sub    %esi,%eax
   1809f:	85 d2                	test   %edx,%edx
   180a1:	48 0f 49 c1          	cmovns %rcx,%rax
   180a5:	41 39 c0             	cmp    %eax,%r8d
   180a8:	0f 92 c0             	setb   %al
   180ab:	c3                   	ret
   180ac:	31 c0                	xor    %eax,%eax
   180ae:	c3                   	ret
   180af:	cc                   	int3

hyperinterval::float::F32Enclosure::add:
   180b0:	48 89 f8             	mov    %rdi,%rax
   180b3:	f6 06 01             	testb  $0x1,(%rsi)
   180b6:	0f 84 d6 00 00 00    	je     18192 <hyperinterval::float::F32Enclosure::add+0xe2>
   180bc:	f6 02 01             	testb  $0x1,(%rdx)
   180bf:	0f 84 cd 00 00 00    	je     18192 <hyperinterval::float::F32Enclosure::add+0xe2>
   180c5:	41 57                	push   %r15
   180c7:	41 56                	push   %r14
   180c9:	41 55                	push   %r13
   180cb:	41 54                	push   %r12
   180cd:	53                   	push   %rbx
   180ce:	48 83 ec 20          	sub    $0x20,%rsp
   180d2:	49 89 c4             	mov    %rax,%r12
   180d5:	8b 5e 08             	mov    0x8(%rsi),%ebx
   180d8:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   180de:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   180e2:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   180e6:	8b 4e 04             	mov    0x4(%rsi),%ecx
   180e9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   180ee:	be 00 00 00 80       	mov    $0x80000000,%esi
   180f3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   180f8:	e8 d3 27 00 00       	call   1a8d0 <hyperinterval::ieee::Format::add>
   180fd:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18102:	74 6b                	je     1816f <hyperinterval::float::F32Enclosure::add+0xbf>
   18104:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   18109:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1810e:	be 00 00 00 80       	mov    $0x80000000,%esi
   18113:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18118:	48 89 d9             	mov    %rbx,%rcx
   1811b:	4d 89 f0             	mov    %r14,%r8
   1811e:	e8 ad 27 00 00       	call   1a8d0 <hyperinterval::ieee::Format::add>
   18123:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18128:	74 45                	je     1816f <hyperinterval::float::F32Enclosure::add+0xbf>
   1812a:	8b 5c 24 18          	mov    0x18(%rsp),%ebx
   1812e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18133:	be 00 00 00 80       	mov    $0x80000000,%esi
   18138:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1813d:	4c 89 f9             	mov    %r15,%rcx
   18140:	e8 4b 33 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   18145:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1814a:	74 23                	je     1816f <hyperinterval::float::F32Enclosure::add+0xbf>
   1814c:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   18151:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18156:	be 00 00 00 80       	mov    $0x80000000,%esi
   1815b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18160:	48 89 d9             	mov    %rbx,%rcx
   18163:	e8 28 33 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   18168:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1816d:	75 2a                	jne    18199 <hyperinterval::float::F32Enclosure::add+0xe9>
   1816f:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   18174:	4c 89 e0             	mov    %r12,%rax
   18177:	41 88 4c 24 04       	mov    %cl,0x4(%r12)
   1817c:	41 c7 04 24 02 00 00 	movl   $0x2,(%r12)
   18183:	00 
   18184:	48 83 c4 20          	add    $0x20,%rsp
   18188:	5b                   	pop    %rbx
   18189:	41 5c                	pop    %r12
   1818b:	41 5d                	pop    %r13
   1818d:	41 5e                	pop    %r14
   1818f:	41 5f                	pop    %r15
   18191:	c3                   	ret
   18192:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   18198:	c3                   	ret
   18199:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   1819d:	44 89 f0             	mov    %r14d,%eax
   181a0:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   181a5:	89 ca                	mov    %ecx,%edx
   181a7:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   181ad:	be 00 00 00 80       	mov    $0x80000000,%esi
   181b2:	29 c6                	sub    %eax,%esi
   181b4:	44 09 e8             	or     %r13d,%eax
   181b7:	45 85 f6             	test   %r14d,%r14d
   181ba:	48 0f 49 f0          	cmovns %rax,%rsi
   181be:	89 d0                	mov    %edx,%eax
   181c0:	44 09 e8             	or     %r13d,%eax
   181c3:	41 29 d5             	sub    %edx,%r13d
   181c6:	85 c9                	test   %ecx,%ecx
   181c8:	4c 0f 49 e8          	cmovns %rax,%r13
   181cc:	44 39 ee             	cmp    %r13d,%esi
   181cf:	4c 89 e0             	mov    %r12,%rax
   181d2:	76 0c                	jbe    181e0 <hyperinterval::float::F32Enclosure::add+0x130>
   181d4:	c6 40 04 01          	movb   $0x1,0x4(%rax)
   181d8:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   181de:	eb a4                	jmp    18184 <hyperinterval::float::F32Enclosure::add+0xd4>
   181e0:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   181e6:	44 89 70 04          	mov    %r14d,0x4(%rax)
   181ea:	89 48 08             	mov    %ecx,0x8(%rax)
   181ed:	eb 95                	jmp    18184 <hyperinterval::float::F32Enclosure::add+0xd4>
   181ef:	cc                   	int3

hyperinterval::float::F32Enclosure::div:
   181f0:	53                   	push   %rbx
   181f1:	48 89 fb             	mov    %rdi,%rbx
   181f4:	83 3a 01             	cmpl   $0x1,(%rdx)
   181f7:	75 1a                	jne    18213 <hyperinterval::float::F32Enclosure::div+0x23>
   181f9:	83 7a 04 00          	cmpl   $0x0,0x4(%rdx)
   181fd:	7f 14                	jg     18213 <hyperinterval::float::F32Enclosure::div+0x23>
   181ff:	8b 42 08             	mov    0x8(%rdx),%eax
   18202:	85 c0                	test   %eax,%eax
   18204:	0f 99 c1             	setns  %cl
   18207:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   1820c:	0f 94 c0             	sete   %al
   1820f:	08 c8                	or     %cl,%al
   18211:	75 12                	jne    18225 <hyperinterval::float::F32Enclosure::div+0x35>
   18213:	48 89 df             	mov    %rbx,%rdi
   18216:	b9 01 00 00 00       	mov    $0x1,%ecx
   1821b:	e8 c0 f5 ff ff       	call   177e0 <hyperinterval::float::F32Enclosure::corner_image>
   18220:	48 89 d8             	mov    %rbx,%rax
   18223:	5b                   	pop    %rbx
   18224:	c3                   	ret
   18225:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
   18229:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1822f:	48 89 d8             	mov    %rbx,%rax
   18232:	5b                   	pop    %rbx
   18233:	c3                   	ret
   18234:	cc                   	int3
   18235:	cc                   	int3
   18236:	cc                   	int3
   18237:	cc                   	int3
   18238:	cc                   	int3
   18239:	cc                   	int3
   1823a:	cc                   	int3
   1823b:	cc                   	int3
   1823c:	cc                   	int3
   1823d:	cc                   	int3
   1823e:	cc                   	int3
   1823f:	cc                   	int3

hyperinterval::float::F32Enclosure::new:
   18240:	41 57                	push   %r15
   18242:	41 56                	push   %r14
   18244:	53                   	push   %rbx
   18245:	48 83 ec 20          	sub    $0x20,%rsp
   18249:	f3 0f 11 4c 24 1c    	movss  %xmm1,0x1c(%rsp)
   1824f:	48 89 fb             	mov    %rdi,%rbx
   18252:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   18258:	66 0f 7e c1          	movd   %xmm0,%ecx
   1825c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18261:	be 00 00 00 80       	mov    $0x80000000,%esi
   18266:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1826b:	e8 20 32 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   18270:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18275:	74 2a                	je     182a1 <hyperinterval::float::F32Enclosure::new+0x61>
   18277:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1827c:	66 0f 6e 44 24 1c    	movd   0x1c(%rsp),%xmm0
   18282:	66 0f 7e c1          	movd   %xmm0,%ecx
   18286:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1828b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18290:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18295:	e8 f6 31 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1829a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1829f:	75 1b                	jne    182bc <hyperinterval::float::F32Enclosure::new+0x7c>
   182a1:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   182a6:	88 43 04             	mov    %al,0x4(%rbx)
   182a9:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   182af:	48 89 d8             	mov    %rbx,%rax
   182b2:	48 83 c4 20          	add    $0x20,%rsp
   182b6:	5b                   	pop    %rbx
   182b7:	41 5e                	pop    %r14
   182b9:	41 5f                	pop    %r15
   182bb:	c3                   	ret
   182bc:	8b 44 24 10          	mov    0x10(%rsp),%eax
   182c0:	44 89 f9             	mov    %r15d,%ecx
   182c3:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   182c9:	89 c2                	mov    %eax,%edx
   182cb:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   182d1:	be 00 00 00 80       	mov    $0x80000000,%esi
   182d6:	29 ce                	sub    %ecx,%esi
   182d8:	44 09 f1             	or     %r14d,%ecx
   182db:	45 85 ff             	test   %r15d,%r15d
   182de:	48 0f 49 f1          	cmovns %rcx,%rsi
   182e2:	89 d1                	mov    %edx,%ecx
   182e4:	44 09 f1             	or     %r14d,%ecx
   182e7:	41 29 d6             	sub    %edx,%r14d
   182ea:	85 c0                	test   %eax,%eax
   182ec:	4c 0f 49 f1          	cmovns %rcx,%r14
   182f0:	44 39 f6             	cmp    %r14d,%esi
   182f3:	76 06                	jbe    182fb <hyperinterval::float::F32Enclosure::new+0xbb>
   182f5:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   182f9:	eb ae                	jmp    182a9 <hyperinterval::float::F32Enclosure::new+0x69>
   182fb:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   18301:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
   18305:	89 43 08             	mov    %eax,0x8(%rbx)
   18308:	eb a5                	jmp    182af <hyperinterval::float::F32Enclosure::new+0x6f>
   1830a:	cc                   	int3
   1830b:	cc                   	int3
   1830c:	cc                   	int3
   1830d:	cc                   	int3
   1830e:	cc                   	int3
   1830f:	cc                   	int3

hyperinterval::float::F32Enclosure::sub:
   18310:	53                   	push   %rbx
   18311:	48 83 ec 10          	sub    $0x10,%rsp
   18315:	48 89 fb             	mov    %rdi,%rbx
   18318:	f6 02 01             	testb  $0x1,(%rdx)
   1831b:	74 29                	je     18346 <hyperinterval::float::F32Enclosure::sub+0x36>
   1831d:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   18322:	66 0f ef c9          	pxor   %xmm1,%xmm1
   18326:	66 0f 6f 15 52 d5 fe 	movdqa -0x12aae(%rip),%xmm2        # 5880 <__abi_tag+0x5584>
   1832d:	ff 
   1832e:	66 0f ef d0          	pxor   %xmm0,%xmm2
   18332:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   18336:	66 0f df ca          	pandn  %xmm2,%xmm1
   1833a:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   1833f:	b8 01 00 00 00       	mov    $0x1,%eax
   18344:	eb 02                	jmp    18348 <hyperinterval::float::F32Enclosure::sub+0x38>
   18346:	31 c0                	xor    %eax,%eax
   18348:	89 44 24 04          	mov    %eax,0x4(%rsp)
   1834c:	66 0f d6 44 24 08    	movq   %xmm0,0x8(%rsp)
   18352:	48 8d 54 24 04       	lea    0x4(%rsp),%rdx
   18357:	48 89 df             	mov    %rbx,%rdi
   1835a:	ff 15 20 53 04 00    	call   *0x45320(%rip)        # 5d680 <_DYNAMIC+0x2d0>
   18360:	48 89 d8             	mov    %rbx,%rax
   18363:	48 83 c4 10          	add    $0x10,%rsp
   18367:	5b                   	pop    %rbx
   18368:	c3                   	ret
   18369:	cc                   	int3
   1836a:	cc                   	int3
   1836b:	cc                   	int3
   1836c:	cc                   	int3
   1836d:	cc                   	int3
   1836e:	cc                   	int3
   1836f:	cc                   	int3

hyperinterval::float::F32Enclosure::hull:
   18370:	48 89 f8             	mov    %rdi,%rax
   18373:	44 8b 0e             	mov    (%rsi),%r9d
   18376:	44 8b 02             	mov    (%rdx),%r8d
   18379:	8b 7a 04             	mov    0x4(%rdx),%edi
   1837c:	8b 4a 08             	mov    0x8(%rdx),%ecx
   1837f:	41 f6 c1 01          	test   $0x1,%r9b
   18383:	0f 84 a1 00 00 00    	je     1842a <hyperinterval::float::F32Enclosure::hull+0xba>
   18389:	8b 56 04             	mov    0x4(%rsi),%edx
   1838c:	8b 76 08             	mov    0x8(%rsi),%esi
   1838f:	41 f6 c0 01          	test   $0x1,%r8b
   18393:	0f 84 9b 00 00 00    	je     18434 <hyperinterval::float::F32Enclosure::hull+0xc4>
   18399:	53                   	push   %rbx
   1839a:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   183a0:	41 89 d1             	mov    %edx,%r9d
   183a3:	45 09 c1             	or     %r8d,%r9d
   183a6:	41 89 d2             	mov    %edx,%r10d
   183a9:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   183b0:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   183b6:	45 29 d3             	sub    %r10d,%r11d
   183b9:	85 d2                	test   %edx,%edx
   183bb:	4d 0f 49 d9          	cmovns %r9,%r11
   183bf:	41 89 f9             	mov    %edi,%r9d
   183c2:	45 09 c1             	or     %r8d,%r9d
   183c5:	41 89 fa             	mov    %edi,%r10d
   183c8:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   183cf:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   183d4:	44 29 d3             	sub    %r10d,%ebx
   183d7:	85 ff                	test   %edi,%edi
   183d9:	49 0f 49 d9          	cmovns %r9,%rbx
   183dd:	41 39 db             	cmp    %ebx,%r11d
   183e0:	0f 47 d7             	cmova  %edi,%edx
   183e3:	89 f7                	mov    %esi,%edi
   183e5:	44 09 c7             	or     %r8d,%edi
   183e8:	41 89 f1             	mov    %esi,%r9d
   183eb:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   183f2:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   183f8:	45 29 ca             	sub    %r9d,%r10d
   183fb:	85 f6                	test   %esi,%esi
   183fd:	4c 0f 49 d7          	cmovns %rdi,%r10
   18401:	89 cf                	mov    %ecx,%edi
   18403:	44 09 c7             	or     %r8d,%edi
   18406:	41 89 c9             	mov    %ecx,%r9d
   18409:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18410:	45 29 c8             	sub    %r9d,%r8d
   18413:	85 c9                	test   %ecx,%ecx
   18415:	4c 0f 49 c7          	cmovns %rdi,%r8
   18419:	45 39 c2             	cmp    %r8d,%r10d
   1841c:	0f 42 f1             	cmovb  %ecx,%esi
   1841f:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   18425:	89 f1                	mov    %esi,%ecx
   18427:	89 d7                	mov    %edx,%edi
   18429:	5b                   	pop    %rbx
   1842a:	44 89 00             	mov    %r8d,(%rax)
   1842d:	89 78 04             	mov    %edi,0x4(%rax)
   18430:	89 48 08             	mov    %ecx,0x8(%rax)
   18433:	c3                   	ret
   18434:	89 f1                	mov    %esi,%ecx
   18436:	89 d7                	mov    %edx,%edi
   18438:	45 89 c8             	mov    %r9d,%r8d
   1843b:	44 89 00             	mov    %r8d,(%rax)
   1843e:	89 78 04             	mov    %edi,0x4(%rax)
   18441:	89 48 08             	mov    %ecx,0x8(%rax)
   18444:	c3                   	ret
   18445:	cc                   	int3
   18446:	cc                   	int3
   18447:	cc                   	int3
   18448:	cc                   	int3
   18449:	cc                   	int3
   1844a:	cc                   	int3
   1844b:	cc                   	int3
   1844c:	cc                   	int3
   1844d:	cc                   	int3
   1844e:	cc                   	int3
   1844f:	cc                   	int3

hyperinterval::float::F32Enclosure::point:
   18450:	53                   	push   %rbx
   18451:	48 83 ec 10          	sub    $0x10,%rsp
   18455:	48 89 fb             	mov    %rdi,%rbx
   18458:	66 0f 7e c1          	movd   %xmm0,%ecx
   1845c:	48 89 e7             	mov    %rsp,%rdi
   1845f:	be 00 00 00 80       	mov    $0x80000000,%esi
   18464:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18469:	e8 22 30 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1846e:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18472:	75 0f                	jne    18483 <hyperinterval::float::F32Enclosure::point+0x33>
   18474:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   18479:	88 43 04             	mov    %al,0x4(%rbx)
   1847c:	b8 02 00 00 00       	mov    $0x2,%eax
   18481:	eb 0f                	jmp    18492 <hyperinterval::float::F32Enclosure::point+0x42>
   18483:	8b 44 24 08          	mov    0x8(%rsp),%eax
   18487:	89 43 04             	mov    %eax,0x4(%rbx)
   1848a:	89 43 08             	mov    %eax,0x8(%rbx)
   1848d:	b8 01 00 00 00       	mov    $0x1,%eax
   18492:	89 03                	mov    %eax,(%rbx)
   18494:	48 89 d8             	mov    %rbx,%rax
   18497:	48 83 c4 10          	add    $0x10,%rsp
   1849b:	5b                   	pop    %rbx
   1849c:	c3                   	ret
   1849d:	cc                   	int3
   1849e:	cc                   	int3
   1849f:	cc                   	int3

hyperinterval::float::F32Enclosure::signs:
   184a0:	83 3f 01             	cmpl   $0x1,(%rdi)
   184a3:	75 65                	jne    1850a <hyperinterval::float::F32Enclosure::signs+0x6a>
   184a5:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   184aa:	8b 57 04             	mov    0x4(%rdi),%edx
   184ad:	8b 47 08             	mov    0x8(%rdi),%eax
   184b0:	48 89 d6             	mov    %rdx,%rsi
   184b3:	48 09 ce             	or     %rcx,%rsi
   184b6:	41 89 d0             	mov    %edx,%r8d
   184b9:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   184c0:	bf 00 00 00 80       	mov    $0x80000000,%edi
   184c5:	4c 29 c7             	sub    %r8,%rdi
   184c8:	85 d2                	test   %edx,%edx
   184ca:	48 0f 49 fe          	cmovns %rsi,%rdi
   184ce:	31 f6                	xor    %esi,%esi
   184d0:	f7 c7 00 00 00 80    	test   $0x80000000,%edi
   184d6:	0f 94 c2             	sete   %dl
   184d9:	48 39 cf             	cmp    %rcx,%rdi
   184dc:	77 1d                	ja     184fb <hyperinterval::float::F32Enclosure::signs+0x5b>
   184de:	39 cf                	cmp    %ecx,%edi
   184e0:	0f 92 c1             	setb   %cl
   184e3:	80 c9 02             	or     $0x2,%cl
   184e6:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   184eb:	0f b6 c9             	movzbl %cl,%ecx
   184ee:	40 88 d6             	mov    %dl,%sil
   184f1:	0f 44 f1             	cmove  %ecx,%esi
   184f4:	85 c0                	test   %eax,%eax
   184f6:	0f 49 f1             	cmovns %ecx,%esi
   184f9:	89 f2                	mov    %esi,%edx
   184fb:	8d 4a 04             	lea    0x4(%rdx),%ecx
   184fe:	85 c0                	test   %eax,%eax
   18500:	0f b6 d2             	movzbl %dl,%edx
   18503:	0f b6 c1             	movzbl %cl,%eax
   18506:	0f 4e c2             	cmovle %edx,%eax
   18509:	c3                   	ret
   1850a:	31 c0                	xor    %eax,%eax
   1850c:	c3                   	ret
   1850d:	cc                   	int3
   1850e:	cc                   	int3
   1850f:	cc                   	int3

hyperinterval::float::F32Enclosure::affine:
   18510:	41 56                	push   %r14
   18512:	53                   	push   %rbx
   18513:	48 83 ec 38          	sub    $0x38,%rsp
   18517:	f3 0f 11 4c 24 10    	movss  %xmm1,0x10(%rsp)
   1851d:	49 89 f6             	mov    %rsi,%r14
   18520:	48 89 fb             	mov    %rdi,%rbx
   18523:	66 0f 7e c1          	movd   %xmm0,%ecx
   18527:	48 89 e7             	mov    %rsp,%rdi
   1852a:	be 00 00 00 80       	mov    $0x80000000,%esi
   1852f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18534:	e8 57 2f 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   18539:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1853d:	74 36                	je     18575 <hyperinterval::float::F32Enclosure::affine+0x65>
   1853f:	8b 44 24 08          	mov    0x8(%rsp),%eax
   18543:	c7 44 24 20 01 00 00 	movl   $0x1,0x20(%rsp)
   1854a:	00 
   1854b:	89 44 24 24          	mov    %eax,0x24(%rsp)
   1854f:	89 44 24 28          	mov    %eax,0x28(%rsp)
   18553:	66 0f 6e 44 24 10    	movd   0x10(%rsp),%xmm0
   18559:	66 0f 7e c1          	movd   %xmm0,%ecx
   1855d:	48 89 e7             	mov    %rsp,%rdi
   18560:	be 00 00 00 80       	mov    $0x80000000,%esi
   18565:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1856a:	e8 21 2f 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1856f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18573:	75 19                	jne    1858e <hyperinterval::float::F32Enclosure::affine+0x7e>
   18575:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1857a:	88 43 04             	mov    %al,0x4(%rbx)
   1857d:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18583:	48 89 d8             	mov    %rbx,%rax
   18586:	48 83 c4 38          	add    $0x38,%rsp
   1858a:	5b                   	pop    %rbx
   1858b:	41 5e                	pop    %r14
   1858d:	c3                   	ret
   1858e:	8b 44 24 08          	mov    0x8(%rsp),%eax
   18592:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%rsp)
   18599:	00 
   1859a:	89 44 24 30          	mov    %eax,0x30(%rsp)
   1859e:	89 44 24 34          	mov    %eax,0x34(%rsp)
   185a2:	48 89 e7             	mov    %rsp,%rdi
   185a5:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
   185aa:	4c 89 f6             	mov    %r14,%rsi
   185ad:	31 c9                	xor    %ecx,%ecx
   185af:	e8 2c f2 ff ff       	call   177e0 <hyperinterval::float::F32Enclosure::corner_image>
   185b4:	8b 0c 24             	mov    (%rsp),%ecx
   185b7:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   185bc:	83 f9 02             	cmp    $0x2,%ecx
   185bf:	74 b9                	je     1857a <hyperinterval::float::F32Enclosure::affine+0x6a>
   185c1:	8b 54 24 05          	mov    0x5(%rsp),%edx
   185c5:	8b 74 24 08          	mov    0x8(%rsp),%esi
   185c9:	89 74 24 1c          	mov    %esi,0x1c(%rsp)
   185cd:	89 54 24 19          	mov    %edx,0x19(%rsp)
   185d1:	89 4c 24 14          	mov    %ecx,0x14(%rsp)
   185d5:	88 44 24 18          	mov    %al,0x18(%rsp)
   185d9:	48 8d 74 24 14       	lea    0x14(%rsp),%rsi
   185de:	48 8d 54 24 2c       	lea    0x2c(%rsp),%rdx
   185e3:	48 89 df             	mov    %rbx,%rdi
   185e6:	ff 15 94 50 04 00    	call   *0x45094(%rip)        # 5d680 <_DYNAMIC+0x2d0>
   185ec:	eb 95                	jmp    18583 <hyperinterval::float::F32Enclosure::affine+0x73>
   185ee:	cc                   	int3
   185ef:	cc                   	int3

hyperinterval::float::F32Enclosure::square:
   185f0:	55                   	push   %rbp
   185f1:	41 57                	push   %r15
   185f3:	41 56                	push   %r14
   185f5:	41 55                	push   %r13
   185f7:	41 54                	push   %r12
   185f9:	53                   	push   %rbx
   185fa:	48 83 ec 48          	sub    $0x48,%rsp
   185fe:	48 89 fb             	mov    %rdi,%rbx
   18601:	f6 06 01             	testb  $0x1,(%rsi)
   18604:	0f 84 d8 00 00 00    	je     186e2 <hyperinterval::float::F32Enclosure::square+0xf2>
   1860a:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
   1860e:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   18612:	44 89 f8             	mov    %r15d,%eax
   18615:	c1 e8 17             	shr    $0x17,%eax
   18618:	0f b6 c8             	movzbl %al,%ecx
   1861b:	44 89 fa             	mov    %r15d,%edx
   1861e:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
   18624:	31 c0                	xor    %eax,%eax
   18626:	85 c9                	test   %ecx,%ecx
   18628:	8d 8c 09 d4 fe ff ff 	lea    -0x12c(%rcx,%rcx,1),%ecx
   1862f:	41 bc d6 fe ff ff    	mov    $0xfffffed6,%r12d
   18635:	41 0f 44 cc          	cmove  %r12d,%ecx
   18639:	0f 95 c0             	setne  %al
   1863c:	c1 e0 17             	shl    $0x17,%eax
   1863f:	48 09 d0             	or     %rdx,%rax
   18642:	48 f7 e0             	mul    %rax
   18645:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1864a:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1864f:	48 89 04 24          	mov    %rax,(%rsp)
   18653:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   18657:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1865c:	48 89 e1             	mov    %rsp,%rcx
   1865f:	be 00 00 00 80       	mov    $0x80000000,%esi
   18664:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18669:	e8 62 2e 00 00       	call   1b4d0 <hyperinterval::ieee::Format::rounded>
   1866e:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   18673:	75 66                	jne    186db <hyperinterval::float::F32Enclosure::square+0xeb>
   18675:	44 8b 6c 24 38       	mov    0x38(%rsp),%r13d
   1867a:	8b 6c 24 40          	mov    0x40(%rsp),%ebp
   1867e:	44 89 f0             	mov    %r14d,%eax
   18681:	c1 e8 17             	shr    $0x17,%eax
   18684:	0f b6 c8             	movzbl %al,%ecx
   18687:	44 89 f2             	mov    %r14d,%edx
   1868a:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
   18690:	31 c0                	xor    %eax,%eax
   18692:	85 c9                	test   %ecx,%ecx
   18694:	8d 8c 09 d4 fe ff ff 	lea    -0x12c(%rcx,%rcx,1),%ecx
   1869b:	41 0f 44 cc          	cmove  %r12d,%ecx
   1869f:	0f 95 c0             	setne  %al
   186a2:	c1 e0 17             	shl    $0x17,%eax
   186a5:	48 09 d0             	or     %rdx,%rax
   186a8:	48 f7 e0             	mul    %rax
   186ab:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   186b0:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   186b5:	48 89 04 24          	mov    %rax,(%rsp)
   186b9:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   186bd:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   186c2:	48 89 e1             	mov    %rsp,%rcx
   186c5:	be 00 00 00 80       	mov    $0x80000000,%esi
   186ca:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   186cf:	e8 fc 2d 00 00       	call   1b4d0 <hyperinterval::ieee::Format::rounded>
   186d4:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   186d9:	75 0f                	jne    186ea <hyperinterval::float::F32Enclosure::square+0xfa>
   186db:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   186e0:	eb 59                	jmp    1873b <hyperinterval::float::F32Enclosure::square+0x14b>
   186e2:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   186e8:	eb 5a                	jmp    18744 <hyperinterval::float::F32Enclosure::square+0x154>
   186ea:	8b 44 24 38          	mov    0x38(%rsp),%eax
   186ee:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   186f3:	44 8b 64 24 40       	mov    0x40(%rsp),%r12d
   186f8:	48 89 e7             	mov    %rsp,%rdi
   186fb:	be 00 00 00 80       	mov    $0x80000000,%esi
   18700:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18705:	4c 89 e9             	mov    %r13,%rcx
   18708:	e8 83 2d 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1870d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18711:	74 23                	je     18736 <hyperinterval::float::F32Enclosure::square+0x146>
   18713:	4d 89 e5             	mov    %r12,%r13
   18716:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1871b:	48 89 e7             	mov    %rsp,%rdi
   1871e:	be 00 00 00 80       	mov    $0x80000000,%esi
   18723:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18728:	48 89 e9             	mov    %rbp,%rcx
   1872b:	e8 60 2d 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   18730:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18734:	75 20                	jne    18756 <hyperinterval::float::F32Enclosure::square+0x166>
   18736:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1873b:	88 43 04             	mov    %al,0x4(%rbx)
   1873e:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18744:	48 89 d8             	mov    %rbx,%rax
   18747:	48 83 c4 48          	add    $0x48,%rsp
   1874b:	5b                   	pop    %rbx
   1874c:	41 5c                	pop    %r12
   1874e:	41 5d                	pop    %r13
   18750:	41 5e                	pop    %r14
   18752:	41 5f                	pop    %r15
   18754:	5d                   	pop    %rbp
   18755:	c3                   	ret
   18756:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   1875a:	44 89 e0             	mov    %r12d,%eax
   1875d:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18762:	89 e9                	mov    %ebp,%ecx
   18764:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1876a:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1876f:	29 c2                	sub    %eax,%edx
   18771:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18776:	09 f8                	or     %edi,%eax
   18778:	45 85 e4             	test   %r12d,%r12d
   1877b:	48 0f 49 d0          	cmovns %rax,%rdx
   1877f:	be 00 00 00 80       	mov    $0x80000000,%esi
   18784:	29 ce                	sub    %ecx,%esi
   18786:	89 c8                	mov    %ecx,%eax
   18788:	09 f8                	or     %edi,%eax
   1878a:	85 ed                	test   %ebp,%ebp
   1878c:	48 0f 49 f0          	cmovns %rax,%rsi
   18790:	b0 01                	mov    $0x1,%al
   18792:	39 f2                	cmp    %esi,%edx
   18794:	77 a5                	ja     1873b <hyperinterval::float::F32Enclosure::square+0x14b>
   18796:	48 89 e7             	mov    %rsp,%rdi
   18799:	be 00 00 00 80       	mov    $0x80000000,%esi
   1879e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   187a3:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   187a8:	e8 e3 2c 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   187ad:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   187b1:	74 83                	je     18736 <hyperinterval::float::F32Enclosure::square+0x146>
   187b3:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   187b8:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   187bd:	48 89 e7             	mov    %rsp,%rdi
   187c0:	be 00 00 00 80       	mov    $0x80000000,%esi
   187c5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   187ca:	4c 89 e9             	mov    %r13,%rcx
   187cd:	e8 be 2c 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   187d2:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   187d6:	0f 84 5a ff ff ff    	je     18736 <hyperinterval::float::F32Enclosure::square+0x146>
   187dc:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   187e0:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   187e5:	89 d0                	mov    %edx,%eax
   187e7:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   187ec:	41 89 c8             	mov    %ecx,%r8d
   187ef:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   187f6:	be 00 00 00 80       	mov    $0x80000000,%esi
   187fb:	29 c6                	sub    %eax,%esi
   187fd:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18802:	09 f8                	or     %edi,%eax
   18804:	85 d2                	test   %edx,%edx
   18806:	48 0f 49 f0          	cmovns %rax,%rsi
   1880a:	44 89 c0             	mov    %r8d,%eax
   1880d:	09 f8                	or     %edi,%eax
   1880f:	44 29 c7             	sub    %r8d,%edi
   18812:	85 c9                	test   %ecx,%ecx
   18814:	48 0f 49 f8          	cmovns %rax,%rdi
   18818:	b0 01                	mov    $0x1,%al
   1881a:	39 fe                	cmp    %edi,%esi
   1881c:	0f 87 19 ff ff ff    	ja     1873b <hyperinterval::float::F32Enclosure::square+0x14b>
   18822:	44 89 e7             	mov    %r12d,%edi
   18825:	89 ee                	mov    %ebp,%esi
   18827:	e8 b4 2f 00 00       	call   1b7e0 <hyperinterval::bounds::Bounds<T>::hull>
   1882c:	41 89 c4             	mov    %eax,%r12d
   1882f:	89 d5                	mov    %edx,%ebp
   18831:	44 89 ff             	mov    %r15d,%edi
   18834:	44 89 f6             	mov    %r14d,%esi
   18837:	31 d2                	xor    %edx,%edx
   18839:	e8 52 31 00 00       	call   1b990 <hyperinterval::bounds::Bounds<T>::signs>
   1883e:	a8 02                	test   $0x2,%al
   18840:	75 12                	jne    18854 <hyperinterval::float::F32Enclosure::square+0x264>
   18842:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   18848:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   1884c:	89 6b 08             	mov    %ebp,0x8(%rbx)
   1884f:	e9 f0 fe ff ff       	jmp    18744 <hyperinterval::float::F32Enclosure::square+0x154>
   18854:	48 89 e7             	mov    %rsp,%rdi
   18857:	e8 74 03 00 00       	call   18bd0 <hyperinterval::float::F32Enclosure::from_bits>
   1885c:	8b 04 24             	mov    (%rsp),%eax
   1885f:	83 f8 02             	cmp    $0x2,%eax
   18862:	75 0a                	jne    1886e <hyperinterval::float::F32Enclosure::square+0x27e>
   18864:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   18869:	e9 cd fe ff ff       	jmp    1873b <hyperinterval::float::F32Enclosure::square+0x14b>
   1886e:	83 f8 01             	cmp    $0x1,%eax
   18871:	75 cf                	jne    18842 <hyperinterval::float::F32Enclosure::square+0x252>
   18873:	8b 54 24 04          	mov    0x4(%rsp),%edx
   18877:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1887b:	44 89 e7             	mov    %r12d,%edi
   1887e:	89 ee                	mov    %ebp,%esi
   18880:	e8 5b 2f 00 00       	call   1b7e0 <hyperinterval::bounds::Bounds<T>::hull>
   18885:	41 89 c4             	mov    %eax,%r12d
   18888:	89 d5                	mov    %edx,%ebp
   1888a:	eb b6                	jmp    18842 <hyperinterval::float::F32Enclosure::square+0x252>
   1888c:	cc                   	int3
   1888d:	cc                   	int3
   1888e:	cc                   	int3
   1888f:	cc                   	int3

hyperinterval::float::F32Enclosure::next_up:
   18890:	48 83 ec 18          	sub    $0x18,%rsp
   18894:	66 0f 7e c1          	movd   %xmm0,%ecx
   18898:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1889d:	be 00 00 00 80       	mov    $0x80000000,%esi
   188a2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   188a7:	e8 e4 2b 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   188ac:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   188b1:	75 10                	jne    188c3 <hyperinterval::float::F32Enclosure::next_up+0x33>
   188b3:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   188b8:	c1 e0 08             	shl    $0x8,%eax
   188bb:	48 ff c0             	inc    %rax
   188be:	48 83 c4 18          	add    $0x18,%rsp
   188c2:	c3                   	ret
   188c3:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   188c8:	31 c9                	xor    %ecx,%ecx
   188ca:	85 c0                	test   %eax,%eax
   188cc:	0f 99 c1             	setns  %cl
   188cf:	48 8d 0c 48          	lea    (%rax,%rcx,2),%rcx
   188d3:	48 ff c9             	dec    %rcx
   188d6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   188db:	be 00 00 00 80       	mov    $0x80000000,%esi
   188e0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   188e5:	e8 a6 2b 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   188ea:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   188ef:	75 0a                	jne    188fb <hyperinterval::float::F32Enclosure::next_up+0x6b>
   188f1:	b8 01 03 00 00       	mov    $0x301,%eax
   188f6:	48 83 c4 18          	add    $0x18,%rsp
   188fa:	c3                   	ret
   188fb:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   18900:	48 c1 e0 20          	shl    $0x20,%rax
   18904:	48 83 c4 18          	add    $0x18,%rsp
   18908:	c3                   	ret
   18909:	cc                   	int3
   1890a:	cc                   	int3
   1890b:	cc                   	int3
   1890c:	cc                   	int3
   1890d:	cc                   	int3
   1890e:	cc                   	int3
   1890f:	cc                   	int3

hyperinterval::float::F32Enclosure::disjoint:
   18910:	83 3f 00             	cmpl   $0x0,(%rdi)
   18913:	b0 01                	mov    $0x1,%al
   18915:	0f 84 a3 00 00 00    	je     189be <hyperinterval::float::F32Enclosure::disjoint+0xae>
   1891b:	8b 0e                	mov    (%rsi),%ecx
   1891d:	85 c9                	test   %ecx,%ecx
   1891f:	0f 84 99 00 00 00    	je     189be <hyperinterval::float::F32Enclosure::disjoint+0xae>
   18925:	f6 c1 01             	test   $0x1,%cl
   18928:	74 4c                	je     18976 <hyperinterval::float::F32Enclosure::disjoint+0x66>
   1892a:	53                   	push   %rbx
   1892b:	8b 56 04             	mov    0x4(%rsi),%edx
   1892e:	44 8b 47 08          	mov    0x8(%rdi),%r8d
   18932:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   18938:	45 89 c2             	mov    %r8d,%r10d
   1893b:	45 09 ca             	or     %r9d,%r10d
   1893e:	45 89 c3             	mov    %r8d,%r11d
   18941:	41 81 e3 ff ff ff 7f 	and    $0x7fffffff,%r11d
   18948:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   1894d:	44 29 db             	sub    %r11d,%ebx
   18950:	45 85 c0             	test   %r8d,%r8d
   18953:	49 0f 49 da          	cmovns %r10,%rbx
   18957:	41 89 d0             	mov    %edx,%r8d
   1895a:	45 09 c8             	or     %r9d,%r8d
   1895d:	41 89 d2             	mov    %edx,%r10d
   18960:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18967:	45 29 d1             	sub    %r10d,%r9d
   1896a:	85 d2                	test   %edx,%edx
   1896c:	4d 0f 49 c8          	cmovns %r8,%r9
   18970:	44 39 cb             	cmp    %r9d,%ebx
   18973:	5b                   	pop    %rbx
   18974:	72 48                	jb     189be <hyperinterval::float::F32Enclosure::disjoint+0xae>
   18976:	f6 c1 01             	test   $0x1,%cl
   18979:	75 03                	jne    1897e <hyperinterval::float::F32Enclosure::disjoint+0x6e>
   1897b:	31 c0                	xor    %eax,%eax
   1897d:	c3                   	ret
   1897e:	8b 47 04             	mov    0x4(%rdi),%eax
   18981:	8b 4e 08             	mov    0x8(%rsi),%ecx
   18984:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18989:	89 ce                	mov    %ecx,%esi
   1898b:	09 d6                	or     %edx,%esi
   1898d:	89 cf                	mov    %ecx,%edi
   1898f:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18995:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1899b:	41 29 f8             	sub    %edi,%r8d
   1899e:	85 c9                	test   %ecx,%ecx
   189a0:	4c 0f 49 c6          	cmovns %rsi,%r8
   189a4:	89 c1                	mov    %eax,%ecx
   189a6:	09 d1                	or     %edx,%ecx
   189a8:	89 c6                	mov    %eax,%esi
   189aa:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   189b0:	29 f2                	sub    %esi,%edx
   189b2:	85 c0                	test   %eax,%eax
   189b4:	48 0f 49 d1          	cmovns %rcx,%rdx
   189b8:	41 39 d0             	cmp    %edx,%r8d
   189bb:	0f 92 c0             	setb   %al
   189be:	c3                   	ret
   189bf:	cc                   	int3

hyperinterval::float::F32Enclosure::expanded:
   189c0:	41 57                	push   %r15
   189c2:	41 56                	push   %r14
   189c4:	41 54                	push   %r12
   189c6:	53                   	push   %rbx
   189c7:	48 83 ec 18          	sub    $0x18,%rsp
   189cb:	48 89 fb             	mov    %rdi,%rbx
   189ce:	f6 06 01             	testb  $0x1,(%rsi)
   189d1:	74 7c                	je     18a4f <hyperinterval::float::F32Enclosure::expanded+0x8f>
   189d3:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   189d9:	8b 46 04             	mov    0x4(%rsi),%eax
   189dc:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   189e0:	8d 88 00 00 00 80    	lea    -0x80000000(%rax),%ecx
   189e6:	85 c0                	test   %eax,%eax
   189e8:	0f 44 c8             	cmove  %eax,%ecx
   189eb:	31 c0                	xor    %eax,%eax
   189ed:	85 c9                	test   %ecx,%ecx
   189ef:	0f 99 c0             	setns  %al
   189f2:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
   189f6:	48 ff c9             	dec    %rcx
   189f9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   189fe:	be 00 00 00 80       	mov    $0x80000000,%esi
   18a03:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18a08:	e8 83 2a 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   18a0d:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   18a12:	75 2f                	jne    18a43 <hyperinterval::float::F32Enclosure::expanded+0x83>
   18a14:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   18a19:	31 c0                	xor    %eax,%eax
   18a1b:	45 85 f6             	test   %r14d,%r14d
   18a1e:	0f 99 c0             	setns  %al
   18a21:	49 8d 0c 46          	lea    (%r14,%rax,2),%rcx
   18a25:	48 ff c9             	dec    %rcx
   18a28:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18a2d:	be 00 00 00 80       	mov    $0x80000000,%esi
   18a32:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18a37:	e8 54 2a 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   18a3c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18a41:	75 21                	jne    18a64 <hyperinterval::float::F32Enclosure::expanded+0xa4>
   18a43:	c6 43 04 03          	movb   $0x3,0x4(%rbx)
   18a47:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18a4d:	eb 06                	jmp    18a55 <hyperinterval::float::F32Enclosure::expanded+0x95>
   18a4f:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   18a55:	48 89 d8             	mov    %rbx,%rax
   18a58:	48 83 c4 18          	add    $0x18,%rsp
   18a5c:	5b                   	pop    %rbx
   18a5d:	41 5c                	pop    %r12
   18a5f:	41 5e                	pop    %r14
   18a61:	41 5f                	pop    %r15
   18a63:	c3                   	ret
   18a64:	44 89 e1             	mov    %r12d,%ecx
   18a67:	4c 31 f9             	xor    %r15,%rcx
   18a6a:	4d 85 e4             	test   %r12,%r12
   18a6d:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   18a72:	49 0f 44 cc          	cmove  %r12,%rcx
   18a76:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18a7b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18a80:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18a85:	e8 06 2a 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   18a8a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18a8f:	74 23                	je     18ab4 <hyperinterval::float::F32Enclosure::expanded+0xf4>
   18a91:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   18a96:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18a9b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18aa0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18aa5:	4c 89 f1             	mov    %r14,%rcx
   18aa8:	e8 e3 29 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   18aad:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18ab2:	75 10                	jne    18ac4 <hyperinterval::float::F32Enclosure::expanded+0x104>
   18ab4:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   18ab9:	88 43 04             	mov    %al,0x4(%rbx)
   18abc:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18ac2:	eb 91                	jmp    18a55 <hyperinterval::float::F32Enclosure::expanded+0x95>
   18ac4:	8b 44 24 10          	mov    0x10(%rsp),%eax
   18ac8:	44 89 e1             	mov    %r12d,%ecx
   18acb:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18ad1:	89 c2                	mov    %eax,%edx
   18ad3:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18ad9:	be 00 00 00 80       	mov    $0x80000000,%esi
   18ade:	29 ce                	sub    %ecx,%esi
   18ae0:	44 09 f9             	or     %r15d,%ecx
   18ae3:	45 85 e4             	test   %r12d,%r12d
   18ae6:	48 0f 49 f1          	cmovns %rcx,%rsi
   18aea:	89 d1                	mov    %edx,%ecx
   18aec:	44 09 f9             	or     %r15d,%ecx
   18aef:	41 29 d7             	sub    %edx,%r15d
   18af2:	85 c0                	test   %eax,%eax
   18af4:	4c 0f 49 f9          	cmovns %rcx,%r15
   18af8:	44 39 fe             	cmp    %r15d,%esi
   18afb:	76 0f                	jbe    18b0c <hyperinterval::float::F32Enclosure::expanded+0x14c>
   18afd:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   18b01:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18b07:	e9 49 ff ff ff       	jmp    18a55 <hyperinterval::float::F32Enclosure::expanded+0x95>
   18b0c:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   18b12:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   18b16:	89 43 08             	mov    %eax,0x8(%rbx)
   18b19:	e9 37 ff ff ff       	jmp    18a55 <hyperinterval::float::F32Enclosure::expanded+0x95>
   18b1e:	cc                   	int3
   18b1f:	cc                   	int3

hyperinterval::float::F32Enclosure::overlaps:
   18b20:	31 c0                	xor    %eax,%eax
   18b22:	83 3f 00             	cmpl   $0x0,(%rdi)
   18b25:	0f 84 a1 00 00 00    	je     18bcc <hyperinterval::float::F32Enclosure::overlaps+0xac>
   18b2b:	8b 0e                	mov    (%rsi),%ecx
   18b2d:	85 c9                	test   %ecx,%ecx
   18b2f:	0f 84 97 00 00 00    	je     18bcc <hyperinterval::float::F32Enclosure::overlaps+0xac>
   18b35:	f6 c1 01             	test   $0x1,%cl
   18b38:	74 4b                	je     18b85 <hyperinterval::float::F32Enclosure::overlaps+0x65>
   18b3a:	8b 46 04             	mov    0x4(%rsi),%eax
   18b3d:	8b 57 08             	mov    0x8(%rdi),%edx
   18b40:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18b46:	41 89 d1             	mov    %edx,%r9d
   18b49:	45 09 c1             	or     %r8d,%r9d
   18b4c:	41 89 d2             	mov    %edx,%r10d
   18b4f:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18b56:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   18b5c:	45 29 d3             	sub    %r10d,%r11d
   18b5f:	85 d2                	test   %edx,%edx
   18b61:	4d 0f 49 d9          	cmovns %r9,%r11
   18b65:	89 c2                	mov    %eax,%edx
   18b67:	44 09 c2             	or     %r8d,%edx
   18b6a:	41 89 c1             	mov    %eax,%r9d
   18b6d:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18b74:	45 29 c8             	sub    %r9d,%r8d
   18b77:	85 c0                	test   %eax,%eax
   18b79:	4c 0f 49 c2          	cmovns %rdx,%r8
   18b7d:	45 39 c3             	cmp    %r8d,%r11d
   18b80:	73 03                	jae    18b85 <hyperinterval::float::F32Enclosure::overlaps+0x65>
   18b82:	31 c0                	xor    %eax,%eax
   18b84:	c3                   	ret
   18b85:	b0 01                	mov    $0x1,%al
   18b87:	f6 c1 01             	test   $0x1,%cl
   18b8a:	74 40                	je     18bcc <hyperinterval::float::F32Enclosure::overlaps+0xac>
   18b8c:	8b 47 04             	mov    0x4(%rdi),%eax
   18b8f:	8b 4e 08             	mov    0x8(%rsi),%ecx
   18b92:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18b97:	89 ce                	mov    %ecx,%esi
   18b99:	09 d6                	or     %edx,%esi
   18b9b:	89 cf                	mov    %ecx,%edi
   18b9d:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18ba3:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18ba9:	41 29 f8             	sub    %edi,%r8d
   18bac:	85 c9                	test   %ecx,%ecx
   18bae:	4c 0f 49 c6          	cmovns %rsi,%r8
   18bb2:	89 c1                	mov    %eax,%ecx
   18bb4:	09 d1                	or     %edx,%ecx
   18bb6:	89 c6                	mov    %eax,%esi
   18bb8:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18bbe:	29 f2                	sub    %esi,%edx
   18bc0:	85 c0                	test   %eax,%eax
   18bc2:	48 0f 49 d1          	cmovns %rcx,%rdx
   18bc6:	41 39 d0             	cmp    %edx,%r8d
   18bc9:	0f 93 c0             	setae  %al
   18bcc:	c3                   	ret
   18bcd:	cc                   	int3
   18bce:	cc                   	int3
   18bcf:	cc                   	int3

hyperinterval::float::F32Enclosure::from_bits:
   18bd0:	41 57                	push   %r15
   18bd2:	41 56                	push   %r14
   18bd4:	53                   	push   %rbx
   18bd5:	48 83 ec 10          	sub    $0x10,%rsp
   18bd9:	48 89 fb             	mov    %rdi,%rbx
   18bdc:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   18be2:	48 89 e7             	mov    %rsp,%rdi
   18be5:	be 00 00 00 80       	mov    $0x80000000,%esi
   18bea:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18bef:	31 c9                	xor    %ecx,%ecx
   18bf1:	e8 9a 28 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   18bf6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18bfa:	74 1f                	je     18c1b <hyperinterval::float::F32Enclosure::from_bits+0x4b>
   18bfc:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   18c01:	48 89 e7             	mov    %rsp,%rdi
   18c04:	be 00 00 00 80       	mov    $0x80000000,%esi
   18c09:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18c0e:	31 c9                	xor    %ecx,%ecx
   18c10:	e8 7b 28 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   18c15:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18c19:	75 18                	jne    18c33 <hyperinterval::float::F32Enclosure::from_bits+0x63>
   18c1b:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   18c20:	88 43 04             	mov    %al,0x4(%rbx)
   18c23:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18c29:	48 83 c4 10          	add    $0x10,%rsp
   18c2d:	5b                   	pop    %rbx
   18c2e:	41 5e                	pop    %r14
   18c30:	41 5f                	pop    %r15
   18c32:	c3                   	ret
   18c33:	8b 44 24 08          	mov    0x8(%rsp),%eax
   18c37:	44 89 f9             	mov    %r15d,%ecx
   18c3a:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18c40:	89 c2                	mov    %eax,%edx
   18c42:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18c48:	be 00 00 00 80       	mov    $0x80000000,%esi
   18c4d:	29 ce                	sub    %ecx,%esi
   18c4f:	44 09 f1             	or     %r14d,%ecx
   18c52:	45 85 ff             	test   %r15d,%r15d
   18c55:	48 0f 49 f1          	cmovns %rcx,%rsi
   18c59:	89 d1                	mov    %edx,%ecx
   18c5b:	44 09 f1             	or     %r14d,%ecx
   18c5e:	41 29 d6             	sub    %edx,%r14d
   18c61:	85 c0                	test   %eax,%eax
   18c63:	4c 0f 49 f1          	cmovns %rcx,%r14
   18c67:	44 39 f6             	cmp    %r14d,%esi
   18c6a:	76 06                	jbe    18c72 <hyperinterval::float::F32Enclosure::from_bits+0xa2>
   18c6c:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   18c70:	eb b1                	jmp    18c23 <hyperinterval::float::F32Enclosure::from_bits+0x53>
   18c72:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   18c78:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
   18c7c:	89 43 08             	mov    %eax,0x8(%rbx)
   18c7f:	eb a8                	jmp    18c29 <hyperinterval::float::F32Enclosure::from_bits+0x59>
   18c81:	cc                   	int3
   18c82:	cc                   	int3
   18c83:	cc                   	int3
   18c84:	cc                   	int3
   18c85:	cc                   	int3
   18c86:	cc                   	int3
   18c87:	cc                   	int3
   18c88:	cc                   	int3
   18c89:	cc                   	int3
   18c8a:	cc                   	int3
   18c8b:	cc                   	int3
   18c8c:	cc                   	int3
   18c8d:	cc                   	int3
   18c8e:	cc                   	int3
   18c8f:	cc                   	int3

hyperinterval::float::F32Enclosure::next_down:
   18c90:	53                   	push   %rbx
   18c91:	48 83 ec 10          	sub    $0x10,%rsp
   18c95:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   18c9a:	66 0f 7e c1          	movd   %xmm0,%ecx
   18c9e:	48 89 e7             	mov    %rsp,%rdi
   18ca1:	be 00 00 00 80       	mov    $0x80000000,%esi
   18ca6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18cab:	e8 e0 27 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   18cb0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18cb4:	75 11                	jne    18cc7 <hyperinterval::float::F32Enclosure::next_down+0x37>
   18cb6:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   18cbb:	c1 e0 08             	shl    $0x8,%eax
   18cbe:	48 ff c0             	inc    %rax
   18cc1:	48 83 c4 10          	add    $0x10,%rsp
   18cc5:	5b                   	pop    %rbx
   18cc6:	c3                   	ret
   18cc7:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   18ccc:	48 89 c1             	mov    %rax,%rcx
   18ccf:	48 31 d9             	xor    %rbx,%rcx
   18cd2:	48 85 c0             	test   %rax,%rax
   18cd5:	48 0f 44 c8          	cmove  %rax,%rcx
   18cd9:	31 c0                	xor    %eax,%eax
   18cdb:	85 c9                	test   %ecx,%ecx
   18cdd:	0f 99 c0             	setns  %al
   18ce0:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
   18ce4:	48 ff c9             	dec    %rcx
   18ce7:	48 89 e7             	mov    %rsp,%rdi
   18cea:	be 00 00 00 80       	mov    $0x80000000,%esi
   18cef:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18cf4:	e8 97 27 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   18cf9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18cfd:	75 0b                	jne    18d0a <hyperinterval::float::F32Enclosure::next_down+0x7a>
   18cff:	b8 01 03 00 00       	mov    $0x301,%eax
   18d04:	48 83 c4 10          	add    $0x10,%rsp
   18d08:	5b                   	pop    %rbx
   18d09:	c3                   	ret
   18d0a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   18d0f:	48 89 c8             	mov    %rcx,%rax
   18d12:	48 35 00 00 00 80    	xor    $0xffffffff80000000,%rax
   18d18:	48 c1 e0 20          	shl    $0x20,%rax
   18d1c:	48 85 c9             	test   %rcx,%rcx
   18d1f:	48 0f 44 c1          	cmove  %rcx,%rax
   18d23:	48 83 c4 10          	add    $0x10,%rsp
   18d27:	5b                   	pop    %rbx
   18d28:	c3                   	ret
   18d29:	cc                   	int3
   18d2a:	cc                   	int3
   18d2b:	cc                   	int3
   18d2c:	cc                   	int3
   18d2d:	cc                   	int3
   18d2e:	cc                   	int3
   18d2f:	cc                   	int3

hyperinterval::float::F32Enclosure::subset_of:
   18d30:	b0 01                	mov    $0x1,%al
   18d32:	f6 07 01             	testb  $0x1,(%rdi)
   18d35:	74 53                	je     18d8a <hyperinterval::float::F32Enclosure::subset_of+0x5a>
   18d37:	f6 06 01             	testb  $0x1,(%rsi)
   18d3a:	74 4c                	je     18d88 <hyperinterval::float::F32Enclosure::subset_of+0x58>
   18d3c:	8b 4f 04             	mov    0x4(%rdi),%ecx
   18d3f:	8b 56 04             	mov    0x4(%rsi),%edx
   18d42:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18d47:	41 89 d0             	mov    %edx,%r8d
   18d4a:	41 09 c0             	or     %eax,%r8d
   18d4d:	41 89 d1             	mov    %edx,%r9d
   18d50:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18d57:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18d5d:	45 29 ca             	sub    %r9d,%r10d
   18d60:	85 d2                	test   %edx,%edx
   18d62:	4d 0f 49 d0          	cmovns %r8,%r10
   18d66:	89 ca                	mov    %ecx,%edx
   18d68:	09 c2                	or     %eax,%edx
   18d6a:	41 89 c8             	mov    %ecx,%r8d
   18d6d:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18d74:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   18d7a:	45 29 c1             	sub    %r8d,%r9d
   18d7d:	85 c9                	test   %ecx,%ecx
   18d7f:	4c 0f 49 ca          	cmovns %rdx,%r9
   18d83:	45 39 ca             	cmp    %r9d,%r10d
   18d86:	76 03                	jbe    18d8b <hyperinterval::float::F32Enclosure::subset_of+0x5b>
   18d88:	31 c0                	xor    %eax,%eax
   18d8a:	c3                   	ret
   18d8b:	8b 4f 08             	mov    0x8(%rdi),%ecx
   18d8e:	8b 56 08             	mov    0x8(%rsi),%edx
   18d91:	89 ce                	mov    %ecx,%esi
   18d93:	09 c6                	or     %eax,%esi
   18d95:	89 cf                	mov    %ecx,%edi
   18d97:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18d9d:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18da3:	41 29 f8             	sub    %edi,%r8d
   18da6:	85 c9                	test   %ecx,%ecx
   18da8:	4c 0f 49 c6          	cmovns %rsi,%r8
   18dac:	89 d1                	mov    %edx,%ecx
   18dae:	09 c1                	or     %eax,%ecx
   18db0:	89 d6                	mov    %edx,%esi
   18db2:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18db8:	29 f0                	sub    %esi,%eax
   18dba:	85 d2                	test   %edx,%edx
   18dbc:	48 0f 49 c1          	cmovns %rcx,%rax
   18dc0:	41 39 c0             	cmp    %eax,%r8d
   18dc3:	0f 96 c0             	setbe  %al
   18dc6:	c3                   	ret
   18dc7:	cc                   	int3
   18dc8:	cc                   	int3
   18dc9:	cc                   	int3
   18dca:	cc                   	int3
   18dcb:	cc                   	int3
   18dcc:	cc                   	int3
   18dcd:	cc                   	int3
   18dce:	cc                   	int3
   18dcf:	cc                   	int3

hyperinterval::float::F64Enclosure::reciprocal:
   18dd0:	55                   	push   %rbp
   18dd1:	41 57                	push   %r15
   18dd3:	41 56                	push   %r14
   18dd5:	41 55                	push   %r13
   18dd7:	41 54                	push   %r12
   18dd9:	53                   	push   %rbx
   18dda:	48 83 ec 28          	sub    $0x28,%rsp
   18dde:	48 89 fb             	mov    %rdi,%rbx
   18de1:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   18de5:	74 65                	je     18e4c <hyperinterval::float::F64Enclosure::reciprocal+0x7c>
   18de7:	49 89 f6             	mov    %rsi,%r14
   18dea:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
   18df1:	00 00 80 
   18df4:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   18dfb:	00 f0 7f 
   18dfe:	49 bd 00 00 00 00 00 	movabs $0x3ff0000000000000,%r13
   18e05:	00 f0 3f 
   18e08:	48 89 e7             	mov    %rsp,%rdi
   18e0b:	4c 89 fe             	mov    %r15,%rsi
   18e0e:	4c 89 e2             	mov    %r12,%rdx
   18e11:	4c 89 e9             	mov    %r13,%rcx
   18e14:	e8 77 26 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   18e19:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18e1d:	74 1c                	je     18e3b <hyperinterval::float::F64Enclosure::reciprocal+0x6b>
   18e1f:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   18e24:	48 89 e7             	mov    %rsp,%rdi
   18e27:	4c 89 fe             	mov    %r15,%rsi
   18e2a:	4c 89 e2             	mov    %r12,%rdx
   18e2d:	4c 89 e9             	mov    %r13,%rcx
   18e30:	e8 5b 26 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   18e35:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18e39:	75 2a                	jne    18e65 <hyperinterval::float::F64Enclosure::reciprocal+0x95>
   18e3b:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   18e40:	88 53 08             	mov    %dl,0x8(%rbx)
   18e43:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   18e4a:	eb 07                	jmp    18e53 <hyperinterval::float::F64Enclosure::reciprocal+0x83>
   18e4c:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   18e53:	48 89 d8             	mov    %rbx,%rax
   18e56:	48 83 c4 28          	add    $0x28,%rsp
   18e5a:	5b                   	pop    %rbx
   18e5b:	41 5c                	pop    %r12
   18e5d:	41 5d                	pop    %r13
   18e5f:	41 5e                	pop    %r14
   18e61:	41 5f                	pop    %r15
   18e63:	5d                   	pop    %rbp
   18e64:	c3                   	ret
   18e65:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   18e6a:	48 89 ea             	mov    %rbp,%rdx
   18e6d:	4c 09 fa             	or     %r15,%rdx
   18e70:	49 8d 47 ff          	lea    -0x1(%r15),%rax
   18e74:	48 89 ee             	mov    %rbp,%rsi
   18e77:	48 21 c6             	and    %rax,%rsi
   18e7a:	4c 89 ff             	mov    %r15,%rdi
   18e7d:	48 29 f7             	sub    %rsi,%rdi
   18e80:	48 85 ed             	test   %rbp,%rbp
   18e83:	48 0f 49 fa          	cmovns %rdx,%rdi
   18e87:	48 89 ca             	mov    %rcx,%rdx
   18e8a:	4c 09 fa             	or     %r15,%rdx
   18e8d:	48 89 ce             	mov    %rcx,%rsi
   18e90:	48 21 c6             	and    %rax,%rsi
   18e93:	49 29 f7             	sub    %rsi,%r15
   18e96:	48 85 c9             	test   %rcx,%rcx
   18e99:	4c 0f 49 fa          	cmovns %rdx,%r15
   18e9d:	b2 01                	mov    $0x1,%dl
   18e9f:	4c 39 ff             	cmp    %r15,%rdi
   18ea2:	77 9c                	ja     18e40 <hyperinterval::float::F64Enclosure::reciprocal+0x70>
   18ea4:	48 c7 44 24 10 01 00 	movq   $0x1,0x10(%rsp)
   18eab:	00 00 
   18ead:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
   18eb2:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   18eb7:	49 83 7e 08 00       	cmpq   $0x0,0x8(%r14)
   18ebc:	7f 0e                	jg     18ecc <hyperinterval::float::F64Enclosure::reciprocal+0xfc>
   18ebe:	49 8b 4e 10          	mov    0x10(%r14),%rcx
   18ec2:	48 85 c9             	test   %rcx,%rcx
   18ec5:	79 1f                	jns    18ee6 <hyperinterval::float::F64Enclosure::reciprocal+0x116>
   18ec7:	48 21 c1             	and    %rax,%rcx
   18eca:	74 1a                	je     18ee6 <hyperinterval::float::F64Enclosure::reciprocal+0x116>
   18ecc:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
   18ed1:	48 89 df             	mov    %rbx,%rdi
   18ed4:	4c 89 f2             	mov    %r14,%rdx
   18ed7:	b9 01 00 00 00       	mov    $0x1,%ecx
   18edc:	e8 8f 02 00 00       	call   19170 <hyperinterval::float::F64Enclosure::corner_image>
   18ee1:	e9 6d ff ff ff       	jmp    18e53 <hyperinterval::float::F64Enclosure::reciprocal+0x83>
   18ee6:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
   18eea:	e9 54 ff ff ff       	jmp    18e43 <hyperinterval::float::F64Enclosure::reciprocal+0x73>
   18eef:	cc                   	int3

hyperinterval::float::F64Enclosure::checked_pow:
   18ef0:	55                   	push   %rbp
   18ef1:	41 57                	push   %r15
   18ef3:	41 56                	push   %r14
   18ef5:	41 55                	push   %r13
   18ef7:	41 54                	push   %r12
   18ef9:	53                   	push   %rbx
   18efa:	48 83 ec 48          	sub    $0x48,%rsp
   18efe:	48 89 fb             	mov    %rdi,%rbx
   18f01:	83 fa 02             	cmp    $0x2,%edx
   18f04:	75 0e                	jne    18f14 <hyperinterval::float::F64Enclosure::checked_pow+0x24>
   18f06:	48 89 df             	mov    %rbx,%rdi
   18f09:	ff 15 91 47 04 00    	call   *0x44791(%rip)        # 5d6a0 <_DYNAMIC+0x2f0>
   18f0f:	e9 e0 00 00 00       	jmp    18ff4 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
   18f14:	f6 06 01             	testb  $0x1,(%rsi)
   18f17:	0f 84 d0 00 00 00    	je     18fed <hyperinterval::float::F64Enclosure::checked_pow+0xfd>
   18f1d:	89 d5                	mov    %edx,%ebp
   18f1f:	4c 8b 76 10          	mov    0x10(%rsi),%r14
   18f23:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
   18f2a:	00 00 80 
   18f2d:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   18f34:	00 f0 7f 
   18f37:	4c 8b 7e 08          	mov    0x8(%rsi),%r15
   18f3b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18f40:	4c 89 e6             	mov    %r12,%rsi
   18f43:	4c 89 ea             	mov    %r13,%rdx
   18f46:	4c 89 f9             	mov    %r15,%rcx
   18f49:	41 89 e8             	mov    %ebp,%r8d
   18f4c:	e8 3f 21 00 00       	call   1b090 <hyperinterval::ieee::Format::power>
   18f51:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   18f56:	0f 85 80 00 00 00    	jne    18fdc <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   18f5c:	4c 89 f1             	mov    %r14,%rcx
   18f5f:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   18f64:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   18f69:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   18f6e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18f73:	4c 89 e6             	mov    %r12,%rsi
   18f76:	4c 89 ea             	mov    %r13,%rdx
   18f79:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
   18f7e:	41 89 e8             	mov    %ebp,%r8d
   18f81:	e8 0a 21 00 00       	call   1b090 <hyperinterval::ieee::Format::power>
   18f86:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18f8b:	74 4f                	je     18fdc <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   18f8d:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   18f92:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   18f97:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   18f9c:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   18fa1:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18fa6:	4c 89 e6             	mov    %r12,%rsi
   18fa9:	4c 89 ea             	mov    %r13,%rdx
   18fac:	4c 89 f1             	mov    %r14,%rcx
   18faf:	e8 dc 24 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   18fb4:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18fb9:	74 21                	je     18fdc <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   18fbb:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   18fc0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18fc5:	4c 89 e6             	mov    %r12,%rsi
   18fc8:	4c 89 ea             	mov    %r13,%rdx
   18fcb:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   18fd0:	e8 bb 24 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   18fd5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18fda:	75 2a                	jne    19006 <hyperinterval::float::F64Enclosure::checked_pow+0x116>
   18fdc:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   18fe1:	88 43 08             	mov    %al,0x8(%rbx)
   18fe4:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   18feb:	eb 07                	jmp    18ff4 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
   18fed:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   18ff4:	48 89 d8             	mov    %rbx,%rax
   18ff7:	48 83 c4 48          	add    $0x48,%rsp
   18ffb:	5b                   	pop    %rbx
   18ffc:	41 5c                	pop    %r12
   18ffe:	41 5d                	pop    %r13
   19000:	41 5e                	pop    %r14
   19002:	41 5f                	pop    %r15
   19004:	5d                   	pop    %rbp
   19005:	c3                   	ret
   19006:	4c 89 f0             	mov    %r14,%rax
   19009:	4c 09 e0             	or     %r12,%rax
   1900c:	4c 89 f6             	mov    %r14,%rsi
   1900f:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
   19014:	48 89 f1             	mov    %rsi,%rcx
   19017:	4c 21 f1             	and    %r14,%rcx
   1901a:	4c 89 e2             	mov    %r12,%rdx
   1901d:	48 29 ca             	sub    %rcx,%rdx
   19020:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
   19025:	48 85 f6             	test   %rsi,%rsi
   19028:	48 0f 49 d0          	cmovns %rax,%rdx
   1902c:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
   19031:	48 89 f8             	mov    %rdi,%rax
   19034:	4c 09 e0             	or     %r12,%rax
   19037:	48 89 f9             	mov    %rdi,%rcx
   1903a:	4c 21 f1             	and    %r14,%rcx
   1903d:	4c 89 e6             	mov    %r12,%rsi
   19040:	48 29 ce             	sub    %rcx,%rsi
   19043:	48 85 ff             	test   %rdi,%rdi
   19046:	48 0f 49 f0          	cmovns %rax,%rsi
   1904a:	b0 01                	mov    $0x1,%al
   1904c:	48 39 f2             	cmp    %rsi,%rdx
   1904f:	77 90                	ja     18fe1 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
   19051:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
   19056:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1905b:	4c 89 e6             	mov    %r12,%rsi
   1905e:	4c 89 ea             	mov    %r13,%rdx
   19061:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   19066:	e8 25 24 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1906b:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19070:	0f 84 66 ff ff ff    	je     18fdc <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   19076:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1907b:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   19080:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19085:	4c 89 e6             	mov    %r12,%rsi
   19088:	4c 89 ea             	mov    %r13,%rdx
   1908b:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   19090:	e8 fb 23 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   19095:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1909a:	0f 84 3c ff ff ff    	je     18fdc <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   190a0:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   190a5:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
   190aa:	48 89 d0             	mov    %rdx,%rax
   190ad:	4c 09 e0             	or     %r12,%rax
   190b0:	48 89 d7             	mov    %rdx,%rdi
   190b3:	4c 21 f7             	and    %r14,%rdi
   190b6:	4c 89 e6             	mov    %r12,%rsi
   190b9:	48 29 fe             	sub    %rdi,%rsi
   190bc:	48 85 d2             	test   %rdx,%rdx
   190bf:	48 0f 49 f0          	cmovns %rax,%rsi
   190c3:	48 89 c8             	mov    %rcx,%rax
   190c6:	4c 09 e0             	or     %r12,%rax
   190c9:	49 21 ce             	and    %rcx,%r14
   190cc:	4d 29 f4             	sub    %r14,%r12
   190cf:	48 85 c9             	test   %rcx,%rcx
   190d2:	4c 0f 49 e0          	cmovns %rax,%r12
   190d6:	b0 01                	mov    $0x1,%al
   190d8:	4c 39 e6             	cmp    %r12,%rsi
   190db:	0f 87 00 ff ff ff    	ja     18fe1 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
   190e1:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   190e6:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   190eb:	e8 80 27 00 00       	call   1b870 <hyperinterval::bounds::Bounds<T>::hull>
   190f0:	49 89 c5             	mov    %rax,%r13
   190f3:	49 89 d4             	mov    %rdx,%r12
   190f6:	85 ed                	test   %ebp,%ebp
   190f8:	0f 95 c0             	setne  %al
   190fb:	40 f6 c5 01          	test   $0x1,%bpl
   190ff:	0f 94 c1             	sete   %cl
   19102:	84 c8                	test   %cl,%al
   19104:	74 13                	je     19119 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
   19106:	4c 89 ff             	mov    %r15,%rdi
   19109:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
   1910e:	31 d2                	xor    %edx,%edx
   19110:	e8 eb 27 00 00       	call   1b900 <hyperinterval::bounds::Bounds<T>::signs>
   19115:	a8 02                	test   $0x2,%al
   19117:	75 14                	jne    1912d <hyperinterval::float::F64Enclosure::checked_pow+0x23d>
   19119:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   19120:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   19124:	4c 89 63 10          	mov    %r12,0x10(%rbx)
   19128:	e9 c7 fe ff ff       	jmp    18ff4 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
   1912d:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19132:	e8 79 15 00 00       	call   1a6b0 <hyperinterval::float::F64Enclosure::from_bits>
   19137:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1913c:	48 83 f8 02          	cmp    $0x2,%rax
   19140:	75 0a                	jne    1914c <hyperinterval::float::F64Enclosure::checked_pow+0x25c>
   19142:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   19147:	e9 95 fe ff ff       	jmp    18fe1 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
   1914c:	83 f8 01             	cmp    $0x1,%eax
   1914f:	75 c8                	jne    19119 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
   19151:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   19156:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1915b:	4c 89 ef             	mov    %r13,%rdi
   1915e:	4c 89 e6             	mov    %r12,%rsi
   19161:	e8 0a 27 00 00       	call   1b870 <hyperinterval::bounds::Bounds<T>::hull>
   19166:	49 89 c5             	mov    %rax,%r13
   19169:	49 89 d4             	mov    %rdx,%r12
   1916c:	eb ab                	jmp    19119 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
   1916e:	cc                   	int3
   1916f:	cc                   	int3

hyperinterval::float::F64Enclosure::corner_image:
   19170:	55                   	push   %rbp
   19171:	41 57                	push   %r15
   19173:	41 56                	push   %r14
   19175:	41 55                	push   %r13
   19177:	41 54                	push   %r12
   19179:	53                   	push   %rbx
   1917a:	48 83 ec 68          	sub    $0x68,%rsp
   1917e:	48 89 fb             	mov    %rdi,%rbx
   19181:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   19185:	75 5f                	jne    191e6 <hyperinterval::float::F64Enclosure::corner_image+0x76>
   19187:	f6 02 01             	testb  $0x1,(%rdx)
   1918a:	74 5a                	je     191e6 <hyperinterval::float::F64Enclosure::corner_image+0x76>
   1918c:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   19193:	00 00 80 
   19196:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1919d:	00 f0 7f 
   191a0:	4c 8b 66 08          	mov    0x8(%rsi),%r12
   191a4:	48 8b 46 10          	mov    0x10(%rsi),%rax
   191a8:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   191ad:	48 8b 6a 08          	mov    0x8(%rdx),%rbp
   191b1:	48 8b 42 10          	mov    0x10(%rdx),%rax
   191b5:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   191ba:	84 c9                	test   %cl,%cl
   191bc:	74 34                	je     191f2 <hyperinterval::float::F64Enclosure::corner_image+0x82>
   191be:	48 89 e7             	mov    %rsp,%rdi
   191c1:	4c 89 f6             	mov    %r14,%rsi
   191c4:	4c 89 fa             	mov    %r15,%rdx
   191c7:	4c 89 e1             	mov    %r12,%rcx
   191ca:	49 89 e8             	mov    %rbp,%r8
   191cd:	e8 ae 19 00 00       	call   1ab80 <hyperinterval::ieee::Format::div>
   191d2:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   191d6:	0f 84 c3 00 00 00    	je     1929f <hyperinterval::float::F64Enclosure::corner_image+0x12f>
   191dc:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   191e1:	e9 b1 00 00 00       	jmp    19297 <hyperinterval::float::F64Enclosure::corner_image+0x127>
   191e6:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   191ed:	e9 84 03 00 00       	jmp    19576 <hyperinterval::float::F64Enclosure::corner_image+0x406>
   191f2:	4c 89 e1             	mov    %r12,%rcx
   191f5:	48 c1 e9 34          	shr    $0x34,%rcx
   191f9:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   191ff:	48 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%rdx
   19206:	ff 0f 00 
   19209:	4c 89 e7             	mov    %r12,%rdi
   1920c:	48 21 d7             	and    %rdx,%rdi
   1920f:	48 8d 42 01          	lea    0x1(%rdx),%rax
   19213:	44 8d 81 9a f7 ff ff 	lea    -0x866(%rcx),%r8d
   1921a:	48 85 c9             	test   %rcx,%rcx
   1921d:	48 0f 45 c8          	cmovne %rax,%rcx
   19221:	be 9b f7 ff ff       	mov    $0xfffff79b,%esi
   19226:	41 0f 45 f0          	cmovne %r8d,%esi
   1922a:	48 09 f9             	or     %rdi,%rcx
   1922d:	48 89 ef             	mov    %rbp,%rdi
   19230:	48 c1 ef 34          	shr    $0x34,%rdi
   19234:	81 e7 ff 07 00 00    	and    $0x7ff,%edi
   1923a:	48 21 ea             	and    %rbp,%rdx
   1923d:	48 85 ff             	test   %rdi,%rdi
   19240:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   19246:	44 0f 45 c7          	cmovne %edi,%r8d
   1924a:	48 0f 44 c7          	cmove  %rdi,%rax
   1924e:	48 09 d0             	or     %rdx,%rax
   19251:	48 89 ef             	mov    %rbp,%rdi
   19254:	4c 31 e7             	xor    %r12,%rdi
   19257:	48 f7 e1             	mul    %rcx
   1925a:	41 01 f0             	add    %esi,%r8d
   1925d:	48 c1 ef 3f          	shr    $0x3f,%rdi
   19261:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
   19266:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1926b:	48 89 04 24          	mov    %rax,(%rsp)
   1926f:	44 89 44 24 10       	mov    %r8d,0x10(%rsp)
   19274:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   19279:	48 89 e1             	mov    %rsp,%rcx
   1927c:	4c 89 f6             	mov    %r14,%rsi
   1927f:	4c 89 fa             	mov    %r15,%rdx
   19282:	e8 49 22 00 00       	call   1b4d0 <hyperinterval::ieee::Format::rounded>
   19287:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1928c:	0f 84 99 02 00 00    	je     1952b <hyperinterval::float::F64Enclosure::corner_image+0x3bb>
   19292:	0f b6 44 24 41       	movzbl 0x41(%rsp),%eax
   19297:	88 43 08             	mov    %al,0x8(%rbx)
   1929a:	e9 d0 02 00 00       	jmp    1956f <hyperinterval::float::F64Enclosure::corner_image+0x3ff>
   1929f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   192a4:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   192a9:	48 89 e7             	mov    %rsp,%rdi
   192ac:	4c 89 f6             	mov    %r14,%rsi
   192af:	4c 89 fa             	mov    %r15,%rdx
   192b2:	e8 d9 21 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   192b7:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   192bb:	0f 85 a4 02 00 00    	jne    19565 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   192c1:	4c 89 fa             	mov    %r15,%rdx
   192c4:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   192c9:	48 89 e7             	mov    %rsp,%rdi
   192cc:	4c 89 f6             	mov    %r14,%rsi
   192cf:	4c 89 e9             	mov    %r13,%rcx
   192d2:	e8 b9 21 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   192d7:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   192db:	0f 85 84 02 00 00    	jne    19565 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   192e1:	4c 89 f8             	mov    %r15,%rax
   192e4:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   192eb:	00 00 80 
   192ee:	4c 09 f0             	or     %r14,%rax
   192f1:	49 8d 76 ff          	lea    -0x1(%r14),%rsi
   192f5:	4c 89 f9             	mov    %r15,%rcx
   192f8:	48 21 f1             	and    %rsi,%rcx
   192fb:	4c 89 f2             	mov    %r14,%rdx
   192fe:	48 29 ca             	sub    %rcx,%rdx
   19301:	4d 85 ff             	test   %r15,%r15
   19304:	48 0f 49 d0          	cmovns %rax,%rdx
   19308:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   1930d:	48 89 f8             	mov    %rdi,%rax
   19310:	4c 09 f0             	or     %r14,%rax
   19313:	48 89 f9             	mov    %rdi,%rcx
   19316:	48 21 f1             	and    %rsi,%rcx
   19319:	4c 89 f6             	mov    %r14,%rsi
   1931c:	48 29 ce             	sub    %rcx,%rsi
   1931f:	48 85 ff             	test   %rdi,%rdi
   19322:	48 0f 49 f0          	cmovns %rax,%rsi
   19326:	41 b5 01             	mov    $0x1,%r13b
   19329:	48 39 f2             	cmp    %rsi,%rdx
   1932c:	0f 87 39 02 00 00    	ja     1956b <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   19332:	48 89 7c 24 38       	mov    %rdi,0x38(%rsp)
   19337:	4c 89 7c 24 28       	mov    %r15,0x28(%rsp)
   1933c:	48 89 e7             	mov    %rsp,%rdi
   1933f:	4c 89 f6             	mov    %r14,%rsi
   19342:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   19349:	00 f0 7f 
   1934c:	4c 89 fa             	mov    %r15,%rdx
   1934f:	4c 89 e1             	mov    %r12,%rcx
   19352:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   19357:	e8 24 18 00 00       	call   1ab80 <hyperinterval::ieee::Format::div>
   1935c:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19360:	0f 85 76 fe ff ff    	jne    191dc <hyperinterval::float::F64Enclosure::corner_image+0x6c>
   19366:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1936b:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   19370:	48 89 e7             	mov    %rsp,%rdi
   19373:	4c 89 f6             	mov    %r14,%rsi
   19376:	4c 89 fa             	mov    %r15,%rdx
   19379:	e8 12 21 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1937e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19382:	0f 85 dd 01 00 00    	jne    19565 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19388:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1938d:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   19392:	48 89 e7             	mov    %rsp,%rdi
   19395:	4c 89 f6             	mov    %r14,%rsi
   19398:	4c 89 fa             	mov    %r15,%rdx
   1939b:	4c 89 e1             	mov    %r12,%rcx
   1939e:	e8 ed 20 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   193a3:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   193a7:	0f 85 b8 01 00 00    	jne    19565 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   193ad:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   193b2:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
   193b7:	48 89 d0             	mov    %rdx,%rax
   193ba:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   193c1:	00 00 80 
   193c4:	4c 09 f0             	or     %r14,%rax
   193c7:	49 89 d0             	mov    %rdx,%r8
   193ca:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   193ce:	49 21 f8             	and    %rdi,%r8
   193d1:	4c 89 f6             	mov    %r14,%rsi
   193d4:	4c 29 c6             	sub    %r8,%rsi
   193d7:	48 85 d2             	test   %rdx,%rdx
   193da:	48 0f 49 f0          	cmovns %rax,%rsi
   193de:	48 89 c8             	mov    %rcx,%rax
   193e1:	4c 09 f0             	or     %r14,%rax
   193e4:	49 89 c8             	mov    %rcx,%r8
   193e7:	49 21 f8             	and    %rdi,%r8
   193ea:	4c 89 f7             	mov    %r14,%rdi
   193ed:	4c 29 c7             	sub    %r8,%rdi
   193f0:	48 85 c9             	test   %rcx,%rcx
   193f3:	48 0f 49 f8          	cmovns %rax,%rdi
   193f7:	48 39 fe             	cmp    %rdi,%rsi
   193fa:	0f 87 6b 01 00 00    	ja     1956b <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   19400:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   19405:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
   1940a:	e8 61 24 00 00       	call   1b870 <hyperinterval::bounds::Bounds<T>::hull>
   1940f:	49 89 c4             	mov    %rax,%r12
   19412:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   19417:	48 89 e7             	mov    %rsp,%rdi
   1941a:	4c 89 f6             	mov    %r14,%rsi
   1941d:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   19424:	00 f0 7f 
   19427:	4c 89 fa             	mov    %r15,%rdx
   1942a:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1942f:	49 89 e8             	mov    %rbp,%r8
   19432:	e8 49 17 00 00       	call   1ab80 <hyperinterval::ieee::Format::div>
   19437:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1943b:	0f 85 9b fd ff ff    	jne    191dc <hyperinterval::float::F64Enclosure::corner_image+0x6c>
   19441:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19446:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1944b:	48 89 e7             	mov    %rsp,%rdi
   1944e:	4c 89 f6             	mov    %r14,%rsi
   19451:	4c 89 fa             	mov    %r15,%rdx
   19454:	e8 37 20 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   19459:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1945d:	0f 85 02 01 00 00    	jne    19565 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19463:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19468:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1946d:	48 89 e7             	mov    %rsp,%rdi
   19470:	4c 89 f6             	mov    %r14,%rsi
   19473:	4c 89 fa             	mov    %r15,%rdx
   19476:	48 89 e9             	mov    %rbp,%rcx
   19479:	e8 12 20 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1947e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19482:	0f 85 dd 00 00 00    	jne    19565 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19488:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1948d:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
   19492:	48 89 d0             	mov    %rdx,%rax
   19495:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1949c:	00 00 80 
   1949f:	4c 09 f0             	or     %r14,%rax
   194a2:	49 89 d0             	mov    %rdx,%r8
   194a5:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   194a9:	49 21 f8             	and    %rdi,%r8
   194ac:	4c 89 f6             	mov    %r14,%rsi
   194af:	4c 29 c6             	sub    %r8,%rsi
   194b2:	48 85 d2             	test   %rdx,%rdx
   194b5:	48 0f 49 f0          	cmovns %rax,%rsi
   194b9:	48 89 c8             	mov    %rcx,%rax
   194bc:	4c 09 f0             	or     %r14,%rax
   194bf:	49 89 c8             	mov    %rcx,%r8
   194c2:	49 21 f8             	and    %rdi,%r8
   194c5:	4c 89 f7             	mov    %r14,%rdi
   194c8:	4c 29 c7             	sub    %r8,%rdi
   194cb:	48 85 c9             	test   %rcx,%rcx
   194ce:	48 0f 49 f8          	cmovns %rax,%rdi
   194d2:	48 39 fe             	cmp    %rdi,%rsi
   194d5:	0f 87 90 00 00 00    	ja     1956b <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   194db:	4c 89 e7             	mov    %r12,%rdi
   194de:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   194e3:	e8 88 23 00 00       	call   1b870 <hyperinterval::bounds::Bounds<T>::hull>
   194e8:	49 89 c4             	mov    %rax,%r12
   194eb:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   194f0:	48 89 e7             	mov    %rsp,%rdi
   194f3:	4c 89 f6             	mov    %r14,%rsi
   194f6:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   194fd:	00 f0 7f 
   19500:	4c 89 fa             	mov    %r15,%rdx
   19503:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   19508:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1950d:	e8 6e 16 00 00       	call   1ab80 <hyperinterval::ieee::Format::div>
   19512:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19516:	0f 85 c0 fc ff ff    	jne    191dc <hyperinterval::float::F64Enclosure::corner_image+0x6c>
   1951c:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19521:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   19526:	e9 ae 02 00 00       	jmp    197d9 <hyperinterval::float::F64Enclosure::corner_image+0x669>
   1952b:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   19530:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
   19535:	48 89 e7             	mov    %rsp,%rdi
   19538:	4c 89 f6             	mov    %r14,%rsi
   1953b:	4c 89 fa             	mov    %r15,%rdx
   1953e:	e8 4d 1f 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   19543:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19547:	74 1c                	je     19565 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19549:	4c 89 f6             	mov    %r14,%rsi
   1954c:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   19551:	48 89 e7             	mov    %rsp,%rdi
   19554:	4c 89 fa             	mov    %r15,%rdx
   19557:	4c 89 e9             	mov    %r13,%rcx
   1955a:	e8 31 1f 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1955f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19563:	75 20                	jne    19585 <hyperinterval::float::F64Enclosure::corner_image+0x415>
   19565:	44 0f b6 6c 24 01    	movzbl 0x1(%rsp),%r13d
   1956b:	44 88 6b 08          	mov    %r13b,0x8(%rbx)
   1956f:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   19576:	48 83 c4 68          	add    $0x68,%rsp
   1957a:	5b                   	pop    %rbx
   1957b:	41 5c                	pop    %r12
   1957d:	41 5d                	pop    %r13
   1957f:	41 5e                	pop    %r14
   19581:	41 5f                	pop    %r15
   19583:	5d                   	pop    %rbp
   19584:	c3                   	ret
   19585:	4c 89 f0             	mov    %r14,%rax
   19588:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   1958f:	00 00 80 
   19592:	48 09 f8             	or     %rdi,%rax
   19595:	48 8d 77 ff          	lea    -0x1(%rdi),%rsi
   19599:	4c 89 f1             	mov    %r14,%rcx
   1959c:	48 21 f1             	and    %rsi,%rcx
   1959f:	48 89 fa             	mov    %rdi,%rdx
   195a2:	48 29 ca             	sub    %rcx,%rdx
   195a5:	4d 85 f6             	test   %r14,%r14
   195a8:	48 0f 49 d0          	cmovns %rax,%rdx
   195ac:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
   195b1:	4c 89 c0             	mov    %r8,%rax
   195b4:	48 09 f8             	or     %rdi,%rax
   195b7:	4c 89 c1             	mov    %r8,%rcx
   195ba:	48 21 f1             	and    %rsi,%rcx
   195bd:	48 89 fe             	mov    %rdi,%rsi
   195c0:	48 29 ce             	sub    %rcx,%rsi
   195c3:	4d 85 c0             	test   %r8,%r8
   195c6:	48 0f 49 f0          	cmovns %rax,%rsi
   195ca:	41 b5 01             	mov    $0x1,%r13b
   195cd:	48 39 f2             	cmp    %rsi,%rdx
   195d0:	77 99                	ja     1956b <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   195d2:	4c 89 44 24 38       	mov    %r8,0x38(%rsp)
   195d7:	4c 89 74 24 28       	mov    %r14,0x28(%rsp)
   195dc:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   195e1:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   195e8:	00 00 80 
   195eb:	4c 89 f6             	mov    %r14,%rsi
   195ee:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   195f5:	00 f0 7f 
   195f8:	4c 89 fa             	mov    %r15,%rdx
   195fb:	4c 89 e1             	mov    %r12,%rcx
   195fe:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   19603:	e8 b8 19 00 00       	call   1afc0 <hyperinterval::ieee::Format::mul>
   19608:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1960d:	0f 85 7f fc ff ff    	jne    19292 <hyperinterval::float::F64Enclosure::corner_image+0x122>
   19613:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   19618:	4c 8b 64 24 50       	mov    0x50(%rsp),%r12
   1961d:	48 89 e7             	mov    %rsp,%rdi
   19620:	4c 89 f6             	mov    %r14,%rsi
   19623:	4c 89 fa             	mov    %r15,%rdx
   19626:	e8 65 1e 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1962b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1962f:	0f 85 30 ff ff ff    	jne    19565 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19635:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1963a:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1963f:	48 89 e7             	mov    %rsp,%rdi
   19642:	4c 89 f6             	mov    %r14,%rsi
   19645:	4c 89 fa             	mov    %r15,%rdx
   19648:	4c 89 e1             	mov    %r12,%rcx
   1964b:	e8 40 1e 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   19650:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19654:	0f 85 0b ff ff ff    	jne    19565 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1965a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1965f:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
   19664:	48 89 d0             	mov    %rdx,%rax
   19667:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1966e:	00 00 80 
   19671:	4c 09 f0             	or     %r14,%rax
   19674:	49 89 d0             	mov    %rdx,%r8
   19677:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   1967b:	49 21 f8             	and    %rdi,%r8
   1967e:	4c 89 f6             	mov    %r14,%rsi
   19681:	4c 29 c6             	sub    %r8,%rsi
   19684:	48 85 d2             	test   %rdx,%rdx
   19687:	48 0f 49 f0          	cmovns %rax,%rsi
   1968b:	48 89 c8             	mov    %rcx,%rax
   1968e:	4c 09 f0             	or     %r14,%rax
   19691:	49 89 c8             	mov    %rcx,%r8
   19694:	49 21 f8             	and    %rdi,%r8
   19697:	4c 89 f7             	mov    %r14,%rdi
   1969a:	4c 29 c7             	sub    %r8,%rdi
   1969d:	48 85 c9             	test   %rcx,%rcx
   196a0:	48 0f 49 f8          	cmovns %rax,%rdi
   196a4:	48 39 fe             	cmp    %rdi,%rsi
   196a7:	0f 87 be fe ff ff    	ja     1956b <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   196ad:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   196b2:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
   196b7:	e8 b4 21 00 00       	call   1b870 <hyperinterval::bounds::Bounds<T>::hull>
   196bc:	49 89 c4             	mov    %rax,%r12
   196bf:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   196c4:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   196c9:	4c 89 f6             	mov    %r14,%rsi
   196cc:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   196d3:	00 f0 7f 
   196d6:	4c 89 fa             	mov    %r15,%rdx
   196d9:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   196de:	49 89 e8             	mov    %rbp,%r8
   196e1:	e8 da 18 00 00       	call   1afc0 <hyperinterval::ieee::Format::mul>
   196e6:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   196eb:	0f 85 a1 fb ff ff    	jne    19292 <hyperinterval::float::F64Enclosure::corner_image+0x122>
   196f1:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   196f6:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
   196fb:	48 89 e7             	mov    %rsp,%rdi
   196fe:	4c 89 f6             	mov    %r14,%rsi
   19701:	4c 89 fa             	mov    %r15,%rdx
   19704:	e8 87 1d 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   19709:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1970d:	0f 85 52 fe ff ff    	jne    19565 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19713:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19718:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1971d:	48 89 e7             	mov    %rsp,%rdi
   19720:	4c 89 f6             	mov    %r14,%rsi
   19723:	4c 89 fa             	mov    %r15,%rdx
   19726:	48 89 e9             	mov    %rbp,%rcx
   19729:	e8 62 1d 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1972e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19732:	0f 85 2d fe ff ff    	jne    19565 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19738:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1973d:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
   19742:	48 89 d0             	mov    %rdx,%rax
   19745:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1974c:	00 00 80 
   1974f:	4c 09 f0             	or     %r14,%rax
   19752:	49 89 d0             	mov    %rdx,%r8
   19755:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   19759:	49 21 f8             	and    %rdi,%r8
   1975c:	4c 89 f6             	mov    %r14,%rsi
   1975f:	4c 29 c6             	sub    %r8,%rsi
   19762:	48 85 d2             	test   %rdx,%rdx
   19765:	48 0f 49 f0          	cmovns %rax,%rsi
   19769:	48 89 c8             	mov    %rcx,%rax
   1976c:	4c 09 f0             	or     %r14,%rax
   1976f:	49 89 c8             	mov    %rcx,%r8
   19772:	49 21 f8             	and    %rdi,%r8
   19775:	4c 89 f7             	mov    %r14,%rdi
   19778:	4c 29 c7             	sub    %r8,%rdi
   1977b:	48 85 c9             	test   %rcx,%rcx
   1977e:	48 0f 49 f8          	cmovns %rax,%rdi
   19782:	48 39 fe             	cmp    %rdi,%rsi
   19785:	0f 87 e0 fd ff ff    	ja     1956b <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   1978b:	4c 89 e7             	mov    %r12,%rdi
   1978e:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   19793:	e8 d8 20 00 00       	call   1b870 <hyperinterval::bounds::Bounds<T>::hull>
   19798:	49 89 c4             	mov    %rax,%r12
   1979b:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   197a0:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   197a5:	4c 89 f6             	mov    %r14,%rsi
   197a8:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   197af:	00 f0 7f 
   197b2:	4c 89 fa             	mov    %r15,%rdx
   197b5:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   197ba:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   197bf:	e8 fc 17 00 00       	call   1afc0 <hyperinterval::ieee::Format::mul>
   197c4:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   197c9:	0f 85 c3 fa ff ff    	jne    19292 <hyperinterval::float::F64Enclosure::corner_image+0x122>
   197cf:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   197d4:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
   197d9:	48 89 e7             	mov    %rsp,%rdi
   197dc:	4c 89 f6             	mov    %r14,%rsi
   197df:	4c 89 fa             	mov    %r15,%rdx
   197e2:	e8 a9 1c 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   197e7:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   197eb:	0f 85 74 fd ff ff    	jne    19565 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   197f1:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   197f6:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   197fb:	48 89 e7             	mov    %rsp,%rdi
   197fe:	4c 89 f6             	mov    %r14,%rsi
   19801:	4c 89 fa             	mov    %r15,%rdx
   19804:	48 89 e9             	mov    %rbp,%rcx
   19807:	e8 84 1c 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1980c:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   19810:	0f 85 4f fd ff ff    	jne    19565 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   19816:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1981b:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
   19820:	4c 89 c8             	mov    %r9,%rax
   19823:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1982a:	00 00 80 
   1982d:	4c 09 c0             	or     %r8,%rax
   19830:	4c 89 ca             	mov    %r9,%rdx
   19833:	49 8d 78 ff          	lea    -0x1(%r8),%rdi
   19837:	48 21 fa             	and    %rdi,%rdx
   1983a:	4c 89 c6             	mov    %r8,%rsi
   1983d:	48 29 d6             	sub    %rdx,%rsi
   19840:	4d 85 c9             	test   %r9,%r9
   19843:	48 0f 49 f0          	cmovns %rax,%rsi
   19847:	48 89 c8             	mov    %rcx,%rax
   1984a:	4c 09 c0             	or     %r8,%rax
   1984d:	48 21 cf             	and    %rcx,%rdi
   19850:	49 29 f8             	sub    %rdi,%r8
   19853:	48 85 c9             	test   %rcx,%rcx
   19856:	4c 0f 49 c0          	cmovns %rax,%r8
   1985a:	4c 39 c6             	cmp    %r8,%rsi
   1985d:	0f 87 08 fd ff ff    	ja     1956b <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   19863:	4c 89 e7             	mov    %r12,%rdi
   19866:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   1986b:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
   19870:	e8 fb 1f 00 00       	call   1b870 <hyperinterval::bounds::Bounds<T>::hull>
   19875:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1987c:	48 89 43 08          	mov    %rax,0x8(%rbx)
   19880:	48 89 53 10          	mov    %rdx,0x10(%rbx)
   19884:	e9 ed fc ff ff       	jmp    19576 <hyperinterval::float::F64Enclosure::corner_image+0x406>
   19889:	cc                   	int3
   1988a:	cc                   	int3
   1988b:	cc                   	int3
   1988c:	cc                   	int3
   1988d:	cc                   	int3
   1988e:	cc                   	int3
   1988f:	cc                   	int3

hyperinterval::float::F64Enclosure::intersection:
   19890:	48 89 f8             	mov    %rdi,%rax
   19893:	45 31 c9             	xor    %r9d,%r9d
   19896:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1989a:	0f 85 e1 00 00 00    	jne    19981 <hyperinterval::float::F64Enclosure::intersection+0xf1>
   198a0:	f6 02 01             	testb  $0x1,(%rdx)
   198a3:	0f 84 cc 00 00 00    	je     19975 <hyperinterval::float::F64Enclosure::intersection+0xe5>
   198a9:	41 56                	push   %r14
   198ab:	53                   	push   %rbx
   198ac:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   198b0:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   198b4:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   198bb:	00 00 80 
   198be:	49 89 ca             	mov    %rcx,%r10
   198c1:	49 09 fa             	or     %rdi,%r10
   198c4:	4c 8d 4f ff          	lea    -0x1(%rdi),%r9
   198c8:	49 89 cb             	mov    %rcx,%r11
   198cb:	4d 21 cb             	and    %r9,%r11
   198ce:	48 89 fb             	mov    %rdi,%rbx
   198d1:	4c 29 db             	sub    %r11,%rbx
   198d4:	48 85 c9             	test   %rcx,%rcx
   198d7:	49 0f 49 da          	cmovns %r10,%rbx
   198db:	4d 89 c2             	mov    %r8,%r10
   198de:	49 09 fa             	or     %rdi,%r10
   198e1:	4d 89 c3             	mov    %r8,%r11
   198e4:	4d 21 cb             	and    %r9,%r11
   198e7:	49 89 fe             	mov    %rdi,%r14
   198ea:	4d 29 de             	sub    %r11,%r14
   198ed:	4d 85 c0             	test   %r8,%r8
   198f0:	4d 0f 49 f2          	cmovns %r10,%r14
   198f4:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   198f8:	4c 39 f3             	cmp    %r14,%rbx
   198fb:	49 0f 42 c8          	cmovb  %r8,%rcx
   198ff:	4c 8b 46 10          	mov    0x10(%rsi),%r8
   19903:	4c 89 c6             	mov    %r8,%rsi
   19906:	48 09 fe             	or     %rdi,%rsi
   19909:	4d 89 c2             	mov    %r8,%r10
   1990c:	4d 21 ca             	and    %r9,%r10
   1990f:	49 89 fb             	mov    %rdi,%r11
   19912:	4d 29 d3             	sub    %r10,%r11
   19915:	4d 85 c0             	test   %r8,%r8
   19918:	4c 0f 49 de          	cmovns %rsi,%r11
   1991c:	48 89 d6             	mov    %rdx,%rsi
   1991f:	48 09 fe             	or     %rdi,%rsi
   19922:	49 89 d2             	mov    %rdx,%r10
   19925:	4d 21 ca             	and    %r9,%r10
   19928:	48 89 fb             	mov    %rdi,%rbx
   1992b:	4c 29 d3             	sub    %r10,%rbx
   1992e:	48 85 d2             	test   %rdx,%rdx
   19931:	48 0f 49 de          	cmovns %rsi,%rbx
   19935:	49 39 db             	cmp    %rbx,%r11
   19938:	4c 0f 47 c2          	cmova  %rdx,%r8
   1993c:	48 89 ca             	mov    %rcx,%rdx
   1993f:	48 09 fa             	or     %rdi,%rdx
   19942:	48 89 ce             	mov    %rcx,%rsi
   19945:	4c 21 ce             	and    %r9,%rsi
   19948:	49 89 fa             	mov    %rdi,%r10
   1994b:	49 29 f2             	sub    %rsi,%r10
   1994e:	48 85 c9             	test   %rcx,%rcx
   19951:	4c 0f 49 d2          	cmovns %rdx,%r10
   19955:	4c 89 c2             	mov    %r8,%rdx
   19958:	48 09 fa             	or     %rdi,%rdx
   1995b:	4d 21 c1             	and    %r8,%r9
   1995e:	4c 29 cf             	sub    %r9,%rdi
   19961:	4d 85 c0             	test   %r8,%r8
   19964:	48 0f 49 fa          	cmovns %rdx,%rdi
   19968:	45 31 c9             	xor    %r9d,%r9d
   1996b:	49 39 fa             	cmp    %rdi,%r10
   1996e:	41 0f 96 c1          	setbe  %r9b
   19972:	5b                   	pop    %rbx
   19973:	41 5e                	pop    %r14
   19975:	4c 89 08             	mov    %r9,(%rax)
   19978:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1997c:	4c 89 40 10          	mov    %r8,0x10(%rax)
   19980:	c3                   	ret
   19981:	4c 89 08             	mov    %r9,(%rax)
   19984:	48 89 48 08          	mov    %rcx,0x8(%rax)
   19988:	4c 89 40 10          	mov    %r8,0x10(%rax)
   1998c:	c3                   	ret
   1998d:	cc                   	int3
   1998e:	cc                   	int3
   1998f:	cc                   	int3

hyperinterval::float::F64Enclosure::contains_point:
   19990:	41 56                	push   %r14
   19992:	53                   	push   %rbx
   19993:	48 83 ec 18          	sub    $0x18,%rsp
   19997:	49 89 fe             	mov    %rdi,%r14
   1999a:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   199a1:	00 00 80 
   199a4:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   199a9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   199ae:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   199b5:	00 f0 7f 
   199b8:	48 89 de             	mov    %rbx,%rsi
   199bb:	e8 d0 1a 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   199c0:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   199c5:	3c 01                	cmp    $0x1,%al
   199c7:	75 0d                	jne    199d6 <hyperinterval::float::F64Enclosure::contains_point+0x46>
   199c9:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   199ce:	48 83 c4 18          	add    $0x18,%rsp
   199d2:	5b                   	pop    %rbx
   199d3:	41 5e                	pop    %r14
   199d5:	c3                   	ret
   199d6:	49 83 3e 01          	cmpq   $0x1,(%r14)
   199da:	75 44                	jne    19a20 <hyperinterval::float::F64Enclosure::contains_point+0x90>
   199dc:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   199e1:	49 8b 56 08          	mov    0x8(%r14),%rdx
   199e5:	48 89 d7             	mov    %rdx,%rdi
   199e8:	48 09 df             	or     %rbx,%rdi
   199eb:	48 8d 4b ff          	lea    -0x1(%rbx),%rcx
   199ef:	49 89 d0             	mov    %rdx,%r8
   199f2:	49 21 c8             	and    %rcx,%r8
   199f5:	49 89 d9             	mov    %rbx,%r9
   199f8:	4d 29 c1             	sub    %r8,%r9
   199fb:	48 85 d2             	test   %rdx,%rdx
   199fe:	4c 0f 49 cf          	cmovns %rdi,%r9
   19a02:	48 89 f7             	mov    %rsi,%rdi
   19a05:	48 09 df             	or     %rbx,%rdi
   19a08:	49 89 f0             	mov    %rsi,%r8
   19a0b:	49 21 c8             	and    %rcx,%r8
   19a0e:	48 89 da             	mov    %rbx,%rdx
   19a11:	4c 29 c2             	sub    %r8,%rdx
   19a14:	48 85 f6             	test   %rsi,%rsi
   19a17:	48 0f 49 d7          	cmovns %rdi,%rdx
   19a1b:	49 39 d1             	cmp    %rdx,%r9
   19a1e:	76 0a                	jbe    19a2a <hyperinterval::float::F64Enclosure::contains_point+0x9a>
   19a20:	31 d2                	xor    %edx,%edx
   19a22:	48 83 c4 18          	add    $0x18,%rsp
   19a26:	5b                   	pop    %rbx
   19a27:	41 5e                	pop    %r14
   19a29:	c3                   	ret
   19a2a:	49 8b 76 10          	mov    0x10(%r14),%rsi
   19a2e:	48 89 f7             	mov    %rsi,%rdi
   19a31:	48 09 df             	or     %rbx,%rdi
   19a34:	48 21 f1             	and    %rsi,%rcx
   19a37:	48 29 cb             	sub    %rcx,%rbx
   19a3a:	48 85 f6             	test   %rsi,%rsi
   19a3d:	48 0f 49 df          	cmovns %rdi,%rbx
   19a41:	48 39 da             	cmp    %rbx,%rdx
   19a44:	0f 96 c2             	setbe  %dl
   19a47:	48 83 c4 18          	add    $0x18,%rsp
   19a4b:	5b                   	pop    %rbx
   19a4c:	41 5e                	pop    %r14
   19a4e:	c3                   	ret
   19a4f:	cc                   	int3

hyperinterval::float::F64Enclosure::interior_subset_of:
   19a50:	b0 01                	mov    $0x1,%al
   19a52:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   19a56:	0f 85 93 00 00 00    	jne    19aef <hyperinterval::float::F64Enclosure::interior_subset_of+0x9f>
   19a5c:	f6 06 01             	testb  $0x1,(%rsi)
   19a5f:	0f 84 88 00 00 00    	je     19aed <hyperinterval::float::F64Enclosure::interior_subset_of+0x9d>
   19a65:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   19a69:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   19a6d:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   19a74:	00 00 80 
   19a77:	4d 89 c1             	mov    %r8,%r9
   19a7a:	49 09 c1             	or     %rax,%r9
   19a7d:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   19a81:	4d 89 c2             	mov    %r8,%r10
   19a84:	49 21 ca             	and    %rcx,%r10
   19a87:	49 89 c3             	mov    %rax,%r11
   19a8a:	4d 29 d3             	sub    %r10,%r11
   19a8d:	4d 85 c0             	test   %r8,%r8
   19a90:	4d 0f 49 d9          	cmovns %r9,%r11
   19a94:	49 89 d0             	mov    %rdx,%r8
   19a97:	49 09 c0             	or     %rax,%r8
   19a9a:	49 89 d1             	mov    %rdx,%r9
   19a9d:	49 21 c9             	and    %rcx,%r9
   19aa0:	49 89 c2             	mov    %rax,%r10
   19aa3:	4d 29 ca             	sub    %r9,%r10
   19aa6:	48 85 d2             	test   %rdx,%rdx
   19aa9:	4d 0f 49 d0          	cmovns %r8,%r10
   19aad:	4d 39 d3             	cmp    %r10,%r11
   19ab0:	73 3b                	jae    19aed <hyperinterval::float::F64Enclosure::interior_subset_of+0x9d>
   19ab2:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   19ab6:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   19aba:	48 89 d7             	mov    %rdx,%rdi
   19abd:	48 09 c7             	or     %rax,%rdi
   19ac0:	49 89 d0             	mov    %rdx,%r8
   19ac3:	49 21 c8             	and    %rcx,%r8
   19ac6:	49 89 c1             	mov    %rax,%r9
   19ac9:	4d 29 c1             	sub    %r8,%r9
   19acc:	48 85 d2             	test   %rdx,%rdx
   19acf:	4c 0f 49 cf          	cmovns %rdi,%r9
   19ad3:	48 89 f2             	mov    %rsi,%rdx
   19ad6:	48 09 c2             	or     %rax,%rdx
   19ad9:	48 21 f1             	and    %rsi,%rcx
   19adc:	48 29 c8             	sub    %rcx,%rax
   19adf:	48 85 f6             	test   %rsi,%rsi
   19ae2:	48 0f 49 c2          	cmovns %rdx,%rax
   19ae6:	49 39 c1             	cmp    %rax,%r9
   19ae9:	0f 92 c0             	setb   %al
   19aec:	c3                   	ret
   19aed:	31 c0                	xor    %eax,%eax
   19aef:	c3                   	ret

hyperinterval::float::F64Enclosure::add:
   19af0:	48 89 f8             	mov    %rdi,%rax
   19af3:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   19af7:	0f 85 cb 00 00 00    	jne    19bc8 <hyperinterval::float::F64Enclosure::add+0xd8>
   19afd:	f6 02 01             	testb  $0x1,(%rdx)
   19b00:	0f 84 c2 00 00 00    	je     19bc8 <hyperinterval::float::F64Enclosure::add+0xd8>
   19b06:	55                   	push   %rbp
   19b07:	41 57                	push   %r15
   19b09:	41 56                	push   %r14
   19b0b:	41 55                	push   %r13
   19b0d:	41 54                	push   %r12
   19b0f:	53                   	push   %rbx
   19b10:	48 83 ec 18          	sub    $0x18,%rsp
   19b14:	48 89 c5             	mov    %rax,%rbp
   19b17:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   19b1b:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   19b1f:	4c 8b 62 10          	mov    0x10(%rdx),%r12
   19b23:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   19b2a:	00 00 80 
   19b2d:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   19b34:	00 f0 7f 
   19b37:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   19b3b:	48 89 e7             	mov    %rsp,%rdi
   19b3e:	48 89 de             	mov    %rbx,%rsi
   19b41:	4c 89 f2             	mov    %r14,%rdx
   19b44:	e8 87 0d 00 00       	call   1a8d0 <hyperinterval::ieee::Format::add>
   19b49:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19b4d:	74 57                	je     19ba6 <hyperinterval::float::F64Enclosure::add+0xb6>
   19b4f:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   19b54:	48 89 e7             	mov    %rsp,%rdi
   19b57:	48 89 de             	mov    %rbx,%rsi
   19b5a:	4c 89 f2             	mov    %r14,%rdx
   19b5d:	4c 89 f9             	mov    %r15,%rcx
   19b60:	4d 89 e0             	mov    %r12,%r8
   19b63:	e8 68 0d 00 00       	call   1a8d0 <hyperinterval::ieee::Format::add>
   19b68:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19b6c:	74 38                	je     19ba6 <hyperinterval::float::F64Enclosure::add+0xb6>
   19b6e:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   19b73:	48 89 e7             	mov    %rsp,%rdi
   19b76:	48 89 de             	mov    %rbx,%rsi
   19b79:	4c 89 f2             	mov    %r14,%rdx
   19b7c:	4c 89 e9             	mov    %r13,%rcx
   19b7f:	e8 0c 19 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   19b84:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19b88:	74 1c                	je     19ba6 <hyperinterval::float::F64Enclosure::add+0xb6>
   19b8a:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   19b8f:	48 89 e7             	mov    %rsp,%rdi
   19b92:	48 89 de             	mov    %rbx,%rsi
   19b95:	4c 89 f2             	mov    %r14,%rdx
   19b98:	4c 89 f9             	mov    %r15,%rcx
   19b9b:	e8 f0 18 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   19ba0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19ba4:	75 2a                	jne    19bd0 <hyperinterval::float::F64Enclosure::add+0xe0>
   19ba6:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   19bab:	48 89 e8             	mov    %rbp,%rax
   19bae:	88 4d 08             	mov    %cl,0x8(%rbp)
   19bb1:	48 c7 45 00 02 00 00 	movq   $0x2,0x0(%rbp)
   19bb8:	00 
   19bb9:	48 83 c4 18          	add    $0x18,%rsp
   19bbd:	5b                   	pop    %rbx
   19bbe:	41 5c                	pop    %r12
   19bc0:	41 5d                	pop    %r13
   19bc2:	41 5e                	pop    %r14
   19bc4:	41 5f                	pop    %r15
   19bc6:	5d                   	pop    %rbp
   19bc7:	c3                   	ret
   19bc8:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   19bcf:	c3                   	ret
   19bd0:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19bd5:	4c 89 e0             	mov    %r12,%rax
   19bd8:	48 09 d8             	or     %rbx,%rax
   19bdb:	48 8d 53 ff          	lea    -0x1(%rbx),%rdx
   19bdf:	4c 89 e6             	mov    %r12,%rsi
   19be2:	48 21 d6             	and    %rdx,%rsi
   19be5:	48 89 df             	mov    %rbx,%rdi
   19be8:	48 29 f7             	sub    %rsi,%rdi
   19beb:	4d 85 e4             	test   %r12,%r12
   19bee:	48 0f 49 f8          	cmovns %rax,%rdi
   19bf2:	48 89 c8             	mov    %rcx,%rax
   19bf5:	48 09 d8             	or     %rbx,%rax
   19bf8:	48 21 ca             	and    %rcx,%rdx
   19bfb:	48 29 d3             	sub    %rdx,%rbx
   19bfe:	48 85 c9             	test   %rcx,%rcx
   19c01:	48 0f 49 d8          	cmovns %rax,%rbx
   19c05:	48 39 df             	cmp    %rbx,%rdi
   19c08:	48 89 e8             	mov    %rbp,%rax
   19c0b:	76 0d                	jbe    19c1a <hyperinterval::float::F64Enclosure::add+0x12a>
   19c0d:	c6 40 08 01          	movb   $0x1,0x8(%rax)
   19c11:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   19c18:	eb 9f                	jmp    19bb9 <hyperinterval::float::F64Enclosure::add+0xc9>
   19c1a:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   19c21:	4c 89 60 08          	mov    %r12,0x8(%rax)
   19c25:	48 89 48 10          	mov    %rcx,0x10(%rax)
   19c29:	eb 8e                	jmp    19bb9 <hyperinterval::float::F64Enclosure::add+0xc9>
   19c2b:	cc                   	int3
   19c2c:	cc                   	int3
   19c2d:	cc                   	int3
   19c2e:	cc                   	int3
   19c2f:	cc                   	int3

hyperinterval::float::F64Enclosure::div:
   19c30:	53                   	push   %rbx
   19c31:	48 89 fb             	mov    %rdi,%rbx
   19c34:	83 3a 01             	cmpl   $0x1,(%rdx)
   19c37:	75 1e                	jne    19c57 <hyperinterval::float::F64Enclosure::div+0x27>
   19c39:	48 83 7a 08 00       	cmpq   $0x0,0x8(%rdx)
   19c3e:	7f 17                	jg     19c57 <hyperinterval::float::F64Enclosure::div+0x27>
   19c40:	48 8b 42 10          	mov    0x10(%rdx),%rax
   19c44:	48 85 c0             	test   %rax,%rax
   19c47:	0f 99 c1             	setns  %cl
   19c4a:	48 d1 e0             	shl    $1,%rax
   19c4d:	48 85 c0             	test   %rax,%rax
   19c50:	0f 94 c0             	sete   %al
   19c53:	08 c8                	or     %cl,%al
   19c55:	75 12                	jne    19c69 <hyperinterval::float::F64Enclosure::div+0x39>
   19c57:	48 89 df             	mov    %rbx,%rdi
   19c5a:	b9 01 00 00 00       	mov    $0x1,%ecx
   19c5f:	e8 0c f5 ff ff       	call   19170 <hyperinterval::float::F64Enclosure::corner_image>
   19c64:	48 89 d8             	mov    %rbx,%rax
   19c67:	5b                   	pop    %rbx
   19c68:	c3                   	ret
   19c69:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
   19c6d:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   19c74:	48 89 d8             	mov    %rbx,%rax
   19c77:	5b                   	pop    %rbx
   19c78:	c3                   	ret
   19c79:	cc                   	int3
   19c7a:	cc                   	int3
   19c7b:	cc                   	int3
   19c7c:	cc                   	int3
   19c7d:	cc                   	int3
   19c7e:	cc                   	int3
   19c7f:	cc                   	int3

hyperinterval::float::F64Enclosure::new:
   19c80:	41 57                	push   %r15
   19c82:	41 56                	push   %r14
   19c84:	41 54                	push   %r12
   19c86:	53                   	push   %rbx
   19c87:	48 83 ec 18          	sub    $0x18,%rsp
   19c8b:	f2 0f 11 4c 24 10    	movsd  %xmm1,0x10(%rsp)
   19c91:	48 89 fb             	mov    %rdi,%rbx
   19c94:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   19c9b:	00 00 80 
   19c9e:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   19ca5:	00 f0 7f 
   19ca8:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   19cad:	48 89 e7             	mov    %rsp,%rdi
   19cb0:	4c 89 f6             	mov    %r14,%rsi
   19cb3:	4c 89 fa             	mov    %r15,%rdx
   19cb6:	e8 d5 17 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   19cbb:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19cbf:	74 24                	je     19ce5 <hyperinterval::float::F64Enclosure::new+0x65>
   19cc1:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   19cc6:	f3 0f 7e 44 24 10    	movq   0x10(%rsp),%xmm0
   19ccc:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   19cd1:	48 89 e7             	mov    %rsp,%rdi
   19cd4:	4c 89 f6             	mov    %r14,%rsi
   19cd7:	4c 89 fa             	mov    %r15,%rdx
   19cda:	e8 b1 17 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   19cdf:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19ce3:	75 1e                	jne    19d03 <hyperinterval::float::F64Enclosure::new+0x83>
   19ce5:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   19cea:	88 43 08             	mov    %al,0x8(%rbx)
   19ced:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   19cf4:	48 89 d8             	mov    %rbx,%rax
   19cf7:	48 83 c4 18          	add    $0x18,%rsp
   19cfb:	5b                   	pop    %rbx
   19cfc:	41 5c                	pop    %r12
   19cfe:	41 5e                	pop    %r14
   19d00:	41 5f                	pop    %r15
   19d02:	c3                   	ret
   19d03:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19d08:	4c 89 e1             	mov    %r12,%rcx
   19d0b:	4c 09 f1             	or     %r14,%rcx
   19d0e:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   19d12:	4c 89 e6             	mov    %r12,%rsi
   19d15:	48 21 d6             	and    %rdx,%rsi
   19d18:	4c 89 f7             	mov    %r14,%rdi
   19d1b:	48 29 f7             	sub    %rsi,%rdi
   19d1e:	4d 85 e4             	test   %r12,%r12
   19d21:	48 0f 49 f9          	cmovns %rcx,%rdi
   19d25:	48 89 c1             	mov    %rax,%rcx
   19d28:	4c 09 f1             	or     %r14,%rcx
   19d2b:	48 21 c2             	and    %rax,%rdx
   19d2e:	49 29 d6             	sub    %rdx,%r14
   19d31:	48 85 c0             	test   %rax,%rax
   19d34:	4c 0f 49 f1          	cmovns %rcx,%r14
   19d38:	4c 39 f7             	cmp    %r14,%rdi
   19d3b:	76 06                	jbe    19d43 <hyperinterval::float::F64Enclosure::new+0xc3>
   19d3d:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   19d41:	eb aa                	jmp    19ced <hyperinterval::float::F64Enclosure::new+0x6d>
   19d43:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   19d4a:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   19d4e:	48 89 43 10          	mov    %rax,0x10(%rbx)
   19d52:	eb a0                	jmp    19cf4 <hyperinterval::float::F64Enclosure::new+0x74>
   19d54:	cc                   	int3
   19d55:	cc                   	int3
   19d56:	cc                   	int3
   19d57:	cc                   	int3
   19d58:	cc                   	int3
   19d59:	cc                   	int3
   19d5a:	cc                   	int3
   19d5b:	cc                   	int3
   19d5c:	cc                   	int3
   19d5d:	cc                   	int3
   19d5e:	cc                   	int3
   19d5f:	cc                   	int3

hyperinterval::float::F64Enclosure::sub:
   19d60:	53                   	push   %rbx
   19d61:	48 83 ec 20          	sub    $0x20,%rsp
   19d65:	48 89 fb             	mov    %rdi,%rbx
   19d68:	48 83 3a 01          	cmpq   $0x1,(%rdx)
   19d6c:	75 30                	jne    19d9e <hyperinterval::float::F64Enclosure::sub+0x3e>
   19d6e:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   19d72:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   19d76:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   19d7d:	00 00 80 
   19d80:	48 89 d1             	mov    %rdx,%rcx
   19d83:	48 31 c1             	xor    %rax,%rcx
   19d86:	48 85 d2             	test   %rdx,%rdx
   19d89:	48 0f 44 ca          	cmove  %rdx,%rcx
   19d8d:	48 31 f8             	xor    %rdi,%rax
   19d90:	48 85 ff             	test   %rdi,%rdi
   19d93:	48 0f 44 c7          	cmove  %rdi,%rax
   19d97:	ba 01 00 00 00       	mov    $0x1,%edx
   19d9c:	eb 02                	jmp    19da0 <hyperinterval::float::F64Enclosure::sub+0x40>
   19d9e:	31 d2                	xor    %edx,%edx
   19da0:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   19da5:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
   19daa:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   19daf:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
   19db4:	48 89 df             	mov    %rbx,%rdi
   19db7:	ff 15 f3 38 04 00    	call   *0x438f3(%rip)        # 5d6b0 <_DYNAMIC+0x300>
   19dbd:	48 89 d8             	mov    %rbx,%rax
   19dc0:	48 83 c4 20          	add    $0x20,%rsp
   19dc4:	5b                   	pop    %rbx
   19dc5:	c3                   	ret
   19dc6:	cc                   	int3
   19dc7:	cc                   	int3
   19dc8:	cc                   	int3
   19dc9:	cc                   	int3
   19dca:	cc                   	int3
   19dcb:	cc                   	int3
   19dcc:	cc                   	int3
   19dcd:	cc                   	int3
   19dce:	cc                   	int3
   19dcf:	cc                   	int3

hyperinterval::float::F64Enclosure::hull:
   19dd0:	48 89 f8             	mov    %rdi,%rax
   19dd3:	4c 8b 02             	mov    (%rdx),%r8
   19dd6:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   19dda:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
   19dde:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   19de2:	0f 85 a7 00 00 00    	jne    19e8f <hyperinterval::float::F64Enclosure::hull+0xbf>
   19de8:	4c 8b 56 08          	mov    0x8(%rsi),%r10
   19dec:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   19df0:	ba 01 00 00 00       	mov    $0x1,%edx
   19df5:	49 83 f8 01          	cmp    $0x1,%r8
   19df9:	0f 85 9f 00 00 00    	jne    19e9e <hyperinterval::float::F64Enclosure::hull+0xce>
   19dff:	41 57                	push   %r15
   19e01:	41 56                	push   %r14
   19e03:	53                   	push   %rbx
   19e04:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   19e0b:	00 00 80 
   19e0e:	4d 89 d3             	mov    %r10,%r11
   19e11:	4d 09 c3             	or     %r8,%r11
   19e14:	4d 8d 48 ff          	lea    -0x1(%r8),%r9
   19e18:	4c 89 d3             	mov    %r10,%rbx
   19e1b:	4c 21 cb             	and    %r9,%rbx
   19e1e:	4d 89 c6             	mov    %r8,%r14
   19e21:	49 29 de             	sub    %rbx,%r14
   19e24:	4d 85 d2             	test   %r10,%r10
   19e27:	4d 0f 49 f3          	cmovns %r11,%r14
   19e2b:	49 89 fb             	mov    %rdi,%r11
   19e2e:	4d 09 c3             	or     %r8,%r11
   19e31:	48 89 fb             	mov    %rdi,%rbx
   19e34:	4c 21 cb             	and    %r9,%rbx
   19e37:	4d 89 c7             	mov    %r8,%r15
   19e3a:	49 29 df             	sub    %rbx,%r15
   19e3d:	48 85 ff             	test   %rdi,%rdi
   19e40:	4d 0f 49 fb          	cmovns %r11,%r15
   19e44:	4d 39 fe             	cmp    %r15,%r14
   19e47:	49 0f 46 fa          	cmovbe %r10,%rdi
   19e4b:	49 89 f2             	mov    %rsi,%r10
   19e4e:	4d 09 c2             	or     %r8,%r10
   19e51:	49 89 f3             	mov    %rsi,%r11
   19e54:	4d 21 cb             	and    %r9,%r11
   19e57:	4c 89 c3             	mov    %r8,%rbx
   19e5a:	4c 29 db             	sub    %r11,%rbx
   19e5d:	48 85 f6             	test   %rsi,%rsi
   19e60:	49 0f 49 da          	cmovns %r10,%rbx
   19e64:	49 89 ca             	mov    %rcx,%r10
   19e67:	4d 09 c2             	or     %r8,%r10
   19e6a:	49 21 c9             	and    %rcx,%r9
   19e6d:	4d 29 c8             	sub    %r9,%r8
   19e70:	48 85 c9             	test   %rcx,%rcx
   19e73:	4d 0f 49 c2          	cmovns %r10,%r8
   19e77:	4c 39 c3             	cmp    %r8,%rbx
   19e7a:	48 0f 43 ce          	cmovae %rsi,%rcx
   19e7e:	5b                   	pop    %rbx
   19e7f:	41 5e                	pop    %r14
   19e81:	41 5f                	pop    %r15
   19e83:	48 89 10             	mov    %rdx,(%rax)
   19e86:	48 89 78 08          	mov    %rdi,0x8(%rax)
   19e8a:	48 89 48 10          	mov    %rcx,0x10(%rax)
   19e8e:	c3                   	ret
   19e8f:	4c 89 c2             	mov    %r8,%rdx
   19e92:	48 89 10             	mov    %rdx,(%rax)
   19e95:	48 89 78 08          	mov    %rdi,0x8(%rax)
   19e99:	48 89 48 10          	mov    %rcx,0x10(%rax)
   19e9d:	c3                   	ret
   19e9e:	48 89 f1             	mov    %rsi,%rcx
   19ea1:	4c 89 d7             	mov    %r10,%rdi
   19ea4:	48 89 10             	mov    %rdx,(%rax)
   19ea7:	48 89 78 08          	mov    %rdi,0x8(%rax)
   19eab:	48 89 48 10          	mov    %rcx,0x10(%rax)
   19eaf:	c3                   	ret

hyperinterval::float::F64Enclosure::point:
   19eb0:	53                   	push   %rbx
   19eb1:	48 83 ec 10          	sub    $0x10,%rsp
   19eb5:	48 89 fb             	mov    %rdi,%rbx
   19eb8:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   19ebd:	48 89 e7             	mov    %rsp,%rdi
   19ec0:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   19ec7:	00 00 80 
   19eca:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   19ed1:	00 f0 7f 
   19ed4:	e8 b7 15 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   19ed9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19edd:	75 0f                	jne    19eee <hyperinterval::float::F64Enclosure::point+0x3e>
   19edf:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   19ee4:	88 43 08             	mov    %al,0x8(%rbx)
   19ee7:	b8 02 00 00 00       	mov    $0x2,%eax
   19eec:	eb 12                	jmp    19f00 <hyperinterval::float::F64Enclosure::point+0x50>
   19eee:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19ef3:	48 89 43 08          	mov    %rax,0x8(%rbx)
   19ef7:	48 89 43 10          	mov    %rax,0x10(%rbx)
   19efb:	b8 01 00 00 00       	mov    $0x1,%eax
   19f00:	48 89 03             	mov    %rax,(%rbx)
   19f03:	48 89 d8             	mov    %rbx,%rax
   19f06:	48 83 c4 10          	add    $0x10,%rsp
   19f0a:	5b                   	pop    %rbx
   19f0b:	c3                   	ret
   19f0c:	cc                   	int3
   19f0d:	cc                   	int3
   19f0e:	cc                   	int3
   19f0f:	cc                   	int3

hyperinterval::float::F64Enclosure::signs:
   19f10:	83 3f 01             	cmpl   $0x1,(%rdi)
   19f13:	75 6b                	jne    19f80 <hyperinterval::float::F64Enclosure::signs+0x70>
   19f15:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   19f1c:	00 00 80 
   19f1f:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   19f23:	48 8b 47 10          	mov    0x10(%rdi),%rax
   19f27:	48 89 ca             	mov    %rcx,%rdx
   19f2a:	4c 09 c2             	or     %r8,%rdx
   19f2d:	49 8d 70 ff          	lea    -0x1(%r8),%rsi
   19f31:	49 89 c9             	mov    %rcx,%r9
   19f34:	49 21 f1             	and    %rsi,%r9
   19f37:	4c 89 c7             	mov    %r8,%rdi
   19f3a:	4c 29 cf             	sub    %r9,%rdi
   19f3d:	48 85 c9             	test   %rcx,%rcx
   19f40:	48 0f 49 fa          	cmovns %rdx,%rdi
   19f44:	31 d2                	xor    %edx,%edx
   19f46:	48 85 ff             	test   %rdi,%rdi
   19f49:	0f 99 c1             	setns  %cl
   19f4c:	4c 39 c7             	cmp    %r8,%rdi
   19f4f:	77 1f                	ja     19f70 <hyperinterval::float::F64Enclosure::signs+0x60>
   19f51:	48 85 ff             	test   %rdi,%rdi
   19f54:	40 0f 99 c7          	setns  %dil
   19f58:	40 80 cf 02          	or     $0x2,%dil
   19f5c:	48 85 f0             	test   %rsi,%rax
   19f5f:	88 ca                	mov    %cl,%dl
   19f61:	40 0f b6 cf          	movzbl %dil,%ecx
   19f65:	0f 44 d1             	cmove  %ecx,%edx
   19f68:	48 85 c0             	test   %rax,%rax
   19f6b:	0f 49 d1             	cmovns %ecx,%edx
   19f6e:	89 d1                	mov    %edx,%ecx
   19f70:	8d 51 04             	lea    0x4(%rcx),%edx
   19f73:	48 85 c0             	test   %rax,%rax
   19f76:	0f b6 c9             	movzbl %cl,%ecx
   19f79:	0f b6 c2             	movzbl %dl,%eax
   19f7c:	0f 4e c1             	cmovle %ecx,%eax
   19f7f:	c3                   	ret
   19f80:	31 c0                	xor    %eax,%eax
   19f82:	c3                   	ret
   19f83:	cc                   	int3
   19f84:	cc                   	int3
   19f85:	cc                   	int3
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

hyperinterval::float::F64Enclosure::affine:
   19f90:	41 57                	push   %r15
   19f92:	41 56                	push   %r14
   19f94:	41 54                	push   %r12
   19f96:	53                   	push   %rbx
   19f97:	48 83 ec 68          	sub    $0x68,%rsp
   19f9b:	f2 0f 11 4c 24 18    	movsd  %xmm1,0x18(%rsp)
   19fa1:	49 89 f6             	mov    %rsi,%r14
   19fa4:	48 89 fb             	mov    %rdi,%rbx
   19fa7:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
   19fae:	00 00 80 
   19fb1:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   19fb8:	00 f0 7f 
   19fbb:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   19fc0:	48 89 e7             	mov    %rsp,%rdi
   19fc3:	4c 89 fe             	mov    %r15,%rsi
   19fc6:	4c 89 e2             	mov    %r12,%rdx
   19fc9:	e8 c2 14 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   19fce:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19fd2:	74 37                	je     1a00b <hyperinterval::float::F64Enclosure::affine+0x7b>
   19fd4:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19fd9:	48 c7 44 24 38 01 00 	movq   $0x1,0x38(%rsp)
   19fe0:	00 00 
   19fe2:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   19fe7:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   19fec:	f3 0f 7e 44 24 18    	movq   0x18(%rsp),%xmm0
   19ff2:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   19ff7:	48 89 e7             	mov    %rsp,%rdi
   19ffa:	4c 89 fe             	mov    %r15,%rsi
   19ffd:	4c 89 e2             	mov    %r12,%rdx
   1a000:	e8 8b 14 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1a005:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a009:	75 1e                	jne    1a029 <hyperinterval::float::F64Enclosure::affine+0x99>
   1a00b:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a010:	88 43 08             	mov    %al,0x8(%rbx)
   1a013:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a01a:	48 89 d8             	mov    %rbx,%rax
   1a01d:	48 83 c4 68          	add    $0x68,%rsp
   1a021:	5b                   	pop    %rbx
   1a022:	41 5c                	pop    %r12
   1a024:	41 5e                	pop    %r14
   1a026:	41 5f                	pop    %r15
   1a028:	c3                   	ret
   1a029:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a02e:	48 c7 44 24 50 01 00 	movq   $0x1,0x50(%rsp)
   1a035:	00 00 
   1a037:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1a03c:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1a041:	48 89 e7             	mov    %rsp,%rdi
   1a044:	48 8d 54 24 38       	lea    0x38(%rsp),%rdx
   1a049:	4c 89 f6             	mov    %r14,%rsi
   1a04c:	31 c9                	xor    %ecx,%ecx
   1a04e:	e8 1d f1 ff ff       	call   19170 <hyperinterval::float::F64Enclosure::corner_image>
   1a053:	48 8b 0c 24          	mov    (%rsp),%rcx
   1a057:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1a05c:	48 83 f9 02          	cmp    $0x2,%rcx
   1a060:	74 ae                	je     1a010 <hyperinterval::float::F64Enclosure::affine+0x80>
   1a062:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   1a067:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1a06c:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1a071:	48 89 54 24 29       	mov    %rdx,0x29(%rsp)
   1a076:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   1a07b:	88 44 24 28          	mov    %al,0x28(%rsp)
   1a07f:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
   1a084:	48 8d 54 24 50       	lea    0x50(%rsp),%rdx
   1a089:	48 89 df             	mov    %rbx,%rdi
   1a08c:	ff 15 1e 36 04 00    	call   *0x4361e(%rip)        # 5d6b0 <_DYNAMIC+0x300>
   1a092:	eb 86                	jmp    1a01a <hyperinterval::float::F64Enclosure::affine+0x8a>
   1a094:	cc                   	int3
   1a095:	cc                   	int3
   1a096:	cc                   	int3
   1a097:	cc                   	int3
   1a098:	cc                   	int3
   1a099:	cc                   	int3
   1a09a:	cc                   	int3
   1a09b:	cc                   	int3
   1a09c:	cc                   	int3
   1a09d:	cc                   	int3
   1a09e:	cc                   	int3
   1a09f:	cc                   	int3

hyperinterval::float::F64Enclosure::square:
   1a0a0:	55                   	push   %rbp
   1a0a1:	41 57                	push   %r15
   1a0a3:	41 56                	push   %r14
   1a0a5:	41 55                	push   %r13
   1a0a7:	41 54                	push   %r12
   1a0a9:	53                   	push   %rbx
   1a0aa:	48 83 ec 58          	sub    $0x58,%rsp
   1a0ae:	48 89 fb             	mov    %rdi,%rbx
   1a0b1:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1a0b5:	0f 85 0c 01 00 00    	jne    1a1c7 <hyperinterval::float::F64Enclosure::square+0x127>
   1a0bb:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1a0bf:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
   1a0c6:	00 00 80 
   1a0c9:	49 b8 00 00 00 00 00 	movabs $0x7ff0000000000000,%r8
   1a0d0:	00 f0 7f 
   1a0d3:	49 be ff ff ff ff ff 	movabs $0xfffffffffffff,%r14
   1a0da:	ff 0f 00 
   1a0dd:	48 8b 56 08          	mov    0x8(%rsi),%rdx
   1a0e1:	48 89 d1             	mov    %rdx,%rcx
   1a0e4:	48 c1 e9 34          	shr    $0x34,%rcx
   1a0e8:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1a0ee:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
   1a0f3:	4c 21 f2             	and    %r14,%rdx
   1a0f6:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   1a0fa:	48 85 c9             	test   %rcx,%rcx
   1a0fd:	48 89 e8             	mov    %rbp,%rax
   1a100:	48 0f 44 c1          	cmove  %rcx,%rax
   1a104:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1a10b:	41 bd 9c f7 ff ff    	mov    $0xfffff79c,%r13d
   1a111:	41 0f 44 cd          	cmove  %r13d,%ecx
   1a115:	48 09 d0             	or     %rdx,%rax
   1a118:	48 f7 e0             	mul    %rax
   1a11b:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1a120:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1a125:	48 89 04 24          	mov    %rax,(%rsp)
   1a129:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1a12d:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1a132:	48 89 e1             	mov    %rsp,%rcx
   1a135:	4c 89 e6             	mov    %r12,%rsi
   1a138:	4c 89 c2             	mov    %r8,%rdx
   1a13b:	e8 90 13 00 00       	call   1b4d0 <hyperinterval::ieee::Format::rounded>
   1a140:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
   1a145:	75 79                	jne    1a1c0 <hyperinterval::float::F64Enclosure::square+0x120>
   1a147:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   1a14c:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1a151:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   1a156:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1a15b:	4c 89 f8             	mov    %r15,%rax
   1a15e:	48 c1 e8 34          	shr    $0x34,%rax
   1a162:	25 ff 07 00 00       	and    $0x7ff,%eax
   1a167:	4c 89 7c 24 40       	mov    %r15,0x40(%rsp)
   1a16c:	4d 21 fe             	and    %r15,%r14
   1a16f:	48 85 c0             	test   %rax,%rax
   1a172:	48 0f 44 e8          	cmove  %rax,%rbp
   1a176:	8d 8c 00 9a f7 ff ff 	lea    -0x866(%rax,%rax,1),%ecx
   1a17d:	41 0f 44 cd          	cmove  %r13d,%ecx
   1a181:	4c 09 f5             	or     %r14,%rbp
   1a184:	48 89 e8             	mov    %rbp,%rax
   1a187:	48 f7 e5             	mul    %rbp
   1a18a:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1a18f:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1a194:	48 89 04 24          	mov    %rax,(%rsp)
   1a198:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1a19c:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1a1a1:	48 89 e1             	mov    %rsp,%rcx
   1a1a4:	4c 89 e6             	mov    %r12,%rsi
   1a1a7:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a1ae:	00 f0 7f 
   1a1b1:	4c 89 fa             	mov    %r15,%rdx
   1a1b4:	e8 17 13 00 00       	call   1b4d0 <hyperinterval::ieee::Format::rounded>
   1a1b9:	80 7c 24 28 01       	cmpb   $0x1,0x28(%rsp)
   1a1be:	75 10                	jne    1a1d0 <hyperinterval::float::F64Enclosure::square+0x130>
   1a1c0:	0f b6 44 24 29       	movzbl 0x29(%rsp),%eax
   1a1c5:	eb 4f                	jmp    1a216 <hyperinterval::float::F64Enclosure::square+0x176>
   1a1c7:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1a1ce:	eb 50                	jmp    1a220 <hyperinterval::float::F64Enclosure::square+0x180>
   1a1d0:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   1a1d5:	4c 8b 6c 24 38       	mov    0x38(%rsp),%r13
   1a1da:	48 89 e7             	mov    %rsp,%rdi
   1a1dd:	4c 89 e6             	mov    %r12,%rsi
   1a1e0:	4c 89 fa             	mov    %r15,%rdx
   1a1e3:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1a1e8:	e8 a3 12 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1a1ed:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a1f1:	74 1e                	je     1a211 <hyperinterval::float::F64Enclosure::square+0x171>
   1a1f3:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1a1f8:	48 89 e7             	mov    %rsp,%rdi
   1a1fb:	4c 89 e6             	mov    %r12,%rsi
   1a1fe:	4c 89 fa             	mov    %r15,%rdx
   1a201:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1a206:	e8 85 12 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1a20b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a20f:	75 21                	jne    1a232 <hyperinterval::float::F64Enclosure::square+0x192>
   1a211:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a216:	88 43 08             	mov    %al,0x8(%rbx)
   1a219:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a220:	48 89 d8             	mov    %rbx,%rax
   1a223:	48 83 c4 58          	add    $0x58,%rsp
   1a227:	5b                   	pop    %rbx
   1a228:	41 5c                	pop    %r12
   1a22a:	41 5d                	pop    %r13
   1a22c:	41 5e                	pop    %r14
   1a22e:	41 5f                	pop    %r15
   1a230:	5d                   	pop    %rbp
   1a231:	c3                   	ret
   1a232:	4c 89 f1             	mov    %r14,%rcx
   1a235:	48 89 e8             	mov    %rbp,%rax
   1a238:	4c 09 e0             	or     %r12,%rax
   1a23b:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
   1a240:	48 89 ee             	mov    %rbp,%rsi
   1a243:	4c 21 f6             	and    %r14,%rsi
   1a246:	4c 89 e2             	mov    %r12,%rdx
   1a249:	48 29 f2             	sub    %rsi,%rdx
   1a24c:	48 85 ed             	test   %rbp,%rbp
   1a24f:	48 0f 49 d0          	cmovns %rax,%rdx
   1a253:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   1a258:	48 89 f8             	mov    %rdi,%rax
   1a25b:	4c 09 e0             	or     %r12,%rax
   1a25e:	49 89 f8             	mov    %rdi,%r8
   1a261:	4d 21 f0             	and    %r14,%r8
   1a264:	4c 89 e6             	mov    %r12,%rsi
   1a267:	4c 29 c6             	sub    %r8,%rsi
   1a26a:	48 85 ff             	test   %rdi,%rdi
   1a26d:	48 0f 49 f0          	cmovns %rax,%rsi
   1a271:	b0 01                	mov    $0x1,%al
   1a273:	48 39 f2             	cmp    %rsi,%rdx
   1a276:	77 9e                	ja     1a216 <hyperinterval::float::F64Enclosure::square+0x176>
   1a278:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1a27d:	48 89 e7             	mov    %rsp,%rdi
   1a280:	4c 89 e6             	mov    %r12,%rsi
   1a283:	4c 89 fa             	mov    %r15,%rdx
   1a286:	e8 05 12 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1a28b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a28f:	74 80                	je     1a211 <hyperinterval::float::F64Enclosure::square+0x171>
   1a291:	4c 89 e9             	mov    %r13,%rcx
   1a294:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1a299:	48 89 e7             	mov    %rsp,%rdi
   1a29c:	4c 89 e6             	mov    %r12,%rsi
   1a29f:	4c 89 fa             	mov    %r15,%rdx
   1a2a2:	e8 e9 11 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1a2a7:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a2ab:	0f 84 60 ff ff ff    	je     1a211 <hyperinterval::float::F64Enclosure::square+0x171>
   1a2b1:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a2b6:	4c 89 e8             	mov    %r13,%rax
   1a2b9:	4c 09 e0             	or     %r12,%rax
   1a2bc:	4c 89 ea             	mov    %r13,%rdx
   1a2bf:	4c 21 f2             	and    %r14,%rdx
   1a2c2:	4c 89 e6             	mov    %r12,%rsi
   1a2c5:	48 29 d6             	sub    %rdx,%rsi
   1a2c8:	4d 85 ed             	test   %r13,%r13
   1a2cb:	48 0f 49 f0          	cmovns %rax,%rsi
   1a2cf:	48 89 c8             	mov    %rcx,%rax
   1a2d2:	4c 09 e0             	or     %r12,%rax
   1a2d5:	49 21 ce             	and    %rcx,%r14
   1a2d8:	4d 29 f4             	sub    %r14,%r12
   1a2db:	48 85 c9             	test   %rcx,%rcx
   1a2de:	4c 0f 49 e0          	cmovns %rax,%r12
   1a2e2:	b0 01                	mov    $0x1,%al
   1a2e4:	4c 39 e6             	cmp    %r12,%rsi
   1a2e7:	0f 87 29 ff ff ff    	ja     1a216 <hyperinterval::float::F64Enclosure::square+0x176>
   1a2ed:	48 89 ef             	mov    %rbp,%rdi
   1a2f0:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1a2f5:	4c 89 ea             	mov    %r13,%rdx
   1a2f8:	e8 73 15 00 00       	call   1b870 <hyperinterval::bounds::Bounds<T>::hull>
   1a2fd:	49 89 c5             	mov    %rax,%r13
   1a300:	49 89 d4             	mov    %rdx,%r12
   1a303:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1a308:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
   1a30d:	31 d2                	xor    %edx,%edx
   1a30f:	e8 ec 15 00 00       	call   1b900 <hyperinterval::bounds::Bounds<T>::signs>
   1a314:	a8 02                	test   $0x2,%al
   1a316:	75 14                	jne    1a32c <hyperinterval::float::F64Enclosure::square+0x28c>
   1a318:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1a31f:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1a323:	4c 89 63 10          	mov    %r12,0x10(%rbx)
   1a327:	e9 f4 fe ff ff       	jmp    1a220 <hyperinterval::float::F64Enclosure::square+0x180>
   1a32c:	48 89 e7             	mov    %rsp,%rdi
   1a32f:	e8 7c 03 00 00       	call   1a6b0 <hyperinterval::float::F64Enclosure::from_bits>
   1a334:	48 8b 04 24          	mov    (%rsp),%rax
   1a338:	48 83 f8 02          	cmp    $0x2,%rax
   1a33c:	75 0a                	jne    1a348 <hyperinterval::float::F64Enclosure::square+0x2a8>
   1a33e:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1a343:	e9 ce fe ff ff       	jmp    1a216 <hyperinterval::float::F64Enclosure::square+0x176>
   1a348:	83 f8 01             	cmp    $0x1,%eax
   1a34b:	75 cb                	jne    1a318 <hyperinterval::float::F64Enclosure::square+0x278>
   1a34d:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1a352:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1a357:	4c 89 ef             	mov    %r13,%rdi
   1a35a:	4c 89 e6             	mov    %r12,%rsi
   1a35d:	e8 0e 15 00 00       	call   1b870 <hyperinterval::bounds::Bounds<T>::hull>
   1a362:	49 89 c5             	mov    %rax,%r13
   1a365:	49 89 d4             	mov    %rdx,%r12
   1a368:	eb ae                	jmp    1a318 <hyperinterval::float::F64Enclosure::square+0x278>
   1a36a:	cc                   	int3
   1a36b:	cc                   	int3
   1a36c:	cc                   	int3
   1a36d:	cc                   	int3
   1a36e:	cc                   	int3
   1a36f:	cc                   	int3

hyperinterval::float::F64Enclosure::next_up:
   1a370:	41 57                	push   %r15
   1a372:	41 56                	push   %r14
   1a374:	53                   	push   %rbx
   1a375:	48 83 ec 10          	sub    $0x10,%rsp
   1a379:	48 89 fb             	mov    %rdi,%rbx
   1a37c:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a383:	00 00 80 
   1a386:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a38d:	00 f0 7f 
   1a390:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1a395:	48 89 e7             	mov    %rsp,%rdi
   1a398:	4c 89 f6             	mov    %r14,%rsi
   1a39b:	4c 89 fa             	mov    %r15,%rdx
   1a39e:	e8 ed 10 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1a3a3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a3a7:	75 0c                	jne    1a3b5 <hyperinterval::float::F64Enclosure::next_up+0x45>
   1a3a9:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a3ae:	88 43 01             	mov    %al,0x1(%rbx)
   1a3b1:	b0 01                	mov    $0x1,%al
   1a3b3:	eb 3c                	jmp    1a3f1 <hyperinterval::float::F64Enclosure::next_up+0x81>
   1a3b5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a3ba:	48 89 c1             	mov    %rax,%rcx
   1a3bd:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1a3c1:	48 83 c9 01          	or     $0x1,%rcx
   1a3c5:	48 01 c1             	add    %rax,%rcx
   1a3c8:	48 89 e7             	mov    %rsp,%rdi
   1a3cb:	4c 89 f6             	mov    %r14,%rsi
   1a3ce:	4c 89 fa             	mov    %r15,%rdx
   1a3d1:	e8 ba 10 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1a3d6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a3da:	75 08                	jne    1a3e4 <hyperinterval::float::F64Enclosure::next_up+0x74>
   1a3dc:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
   1a3e0:	b0 01                	mov    $0x1,%al
   1a3e2:	eb 0d                	jmp    1a3f1 <hyperinterval::float::F64Enclosure::next_up+0x81>
   1a3e4:	f3 0f 7e 44 24 08    	movq   0x8(%rsp),%xmm0
   1a3ea:	66 0f d6 43 08       	movq   %xmm0,0x8(%rbx)
   1a3ef:	31 c0                	xor    %eax,%eax
   1a3f1:	88 03                	mov    %al,(%rbx)
   1a3f3:	48 89 d8             	mov    %rbx,%rax
   1a3f6:	48 83 c4 10          	add    $0x10,%rsp
   1a3fa:	5b                   	pop    %rbx
   1a3fb:	41 5e                	pop    %r14
   1a3fd:	41 5f                	pop    %r15
   1a3ff:	c3                   	ret

hyperinterval::float::F64Enclosure::disjoint:
   1a400:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1a404:	b0 01                	mov    $0x1,%al
   1a406:	0f 84 93 00 00 00    	je     1a49f <hyperinterval::float::F64Enclosure::disjoint+0x9f>
   1a40c:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1a410:	0f 84 89 00 00 00    	je     1a49f <hyperinterval::float::F64Enclosure::disjoint+0x9f>
   1a416:	53                   	push   %rbx
   1a417:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
   1a41e:	00 00 80 
   1a421:	4c 8b 47 10          	mov    0x10(%rdi),%r8
   1a425:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
   1a429:	4d 89 c2             	mov    %r8,%r10
   1a42c:	49 09 ca             	or     %rcx,%r10
   1a42f:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
   1a433:	4d 89 c3             	mov    %r8,%r11
   1a436:	49 21 d3             	and    %rdx,%r11
   1a439:	48 89 cb             	mov    %rcx,%rbx
   1a43c:	4c 29 db             	sub    %r11,%rbx
   1a43f:	4d 85 c0             	test   %r8,%r8
   1a442:	49 0f 49 da          	cmovns %r10,%rbx
   1a446:	4d 89 c8             	mov    %r9,%r8
   1a449:	49 09 c8             	or     %rcx,%r8
   1a44c:	4d 89 ca             	mov    %r9,%r10
   1a44f:	49 21 d2             	and    %rdx,%r10
   1a452:	49 89 cb             	mov    %rcx,%r11
   1a455:	4d 29 d3             	sub    %r10,%r11
   1a458:	4d 85 c9             	test   %r9,%r9
   1a45b:	4d 0f 49 d8          	cmovns %r8,%r11
   1a45f:	4c 39 db             	cmp    %r11,%rbx
   1a462:	5b                   	pop    %rbx
   1a463:	72 3a                	jb     1a49f <hyperinterval::float::F64Enclosure::disjoint+0x9f>
   1a465:	48 8b 47 08          	mov    0x8(%rdi),%rax
   1a469:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1a46d:	48 89 f7             	mov    %rsi,%rdi
   1a470:	48 09 cf             	or     %rcx,%rdi
   1a473:	49 89 f0             	mov    %rsi,%r8
   1a476:	49 21 d0             	and    %rdx,%r8
   1a479:	49 89 c9             	mov    %rcx,%r9
   1a47c:	4d 29 c1             	sub    %r8,%r9
   1a47f:	48 85 f6             	test   %rsi,%rsi
   1a482:	4c 0f 49 cf          	cmovns %rdi,%r9
   1a486:	48 89 c6             	mov    %rax,%rsi
   1a489:	48 09 ce             	or     %rcx,%rsi
   1a48c:	48 21 c2             	and    %rax,%rdx
   1a48f:	48 29 d1             	sub    %rdx,%rcx
   1a492:	48 85 c0             	test   %rax,%rax
   1a495:	48 0f 49 ce          	cmovns %rsi,%rcx
   1a499:	49 39 c9             	cmp    %rcx,%r9
   1a49c:	0f 92 c0             	setb   %al
   1a49f:	c3                   	ret

hyperinterval::float::F64Enclosure::expanded:
   1a4a0:	41 57                	push   %r15
   1a4a2:	41 56                	push   %r14
   1a4a4:	41 55                	push   %r13
   1a4a6:	41 54                	push   %r12
   1a4a8:	53                   	push   %rbx
   1a4a9:	48 83 ec 10          	sub    $0x10,%rsp
   1a4ad:	48 89 fb             	mov    %rdi,%rbx
   1a4b0:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1a4b4:	75 7f                	jne    1a535 <hyperinterval::float::F64Enclosure::expanded+0x95>
   1a4b6:	4c 8b 66 10          	mov    0x10(%rsi),%r12
   1a4ba:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a4c1:	00 00 80 
   1a4c4:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a4cb:	00 f0 7f 
   1a4ce:	48 8b 46 08          	mov    0x8(%rsi),%rax
   1a4d2:	48 89 c2             	mov    %rax,%rdx
   1a4d5:	4c 31 f2             	xor    %r14,%rdx
   1a4d8:	48 85 c0             	test   %rax,%rax
   1a4db:	48 0f 44 d0          	cmove  %rax,%rdx
   1a4df:	48 89 d1             	mov    %rdx,%rcx
   1a4e2:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1a4e6:	48 83 c9 01          	or     $0x1,%rcx
   1a4ea:	48 01 d1             	add    %rdx,%rcx
   1a4ed:	48 89 e7             	mov    %rsp,%rdi
   1a4f0:	4c 89 f6             	mov    %r14,%rsi
   1a4f3:	4c 89 fa             	mov    %r15,%rdx
   1a4f6:	e8 95 0f 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1a4fb:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a4ff:	75 27                	jne    1a528 <hyperinterval::float::F64Enclosure::expanded+0x88>
   1a501:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1a506:	4c 89 e1             	mov    %r12,%rcx
   1a509:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1a50d:	48 83 c9 01          	or     $0x1,%rcx
   1a511:	4c 01 e1             	add    %r12,%rcx
   1a514:	48 89 e7             	mov    %rsp,%rdi
   1a517:	4c 89 f6             	mov    %r14,%rsi
   1a51a:	4c 89 fa             	mov    %r15,%rdx
   1a51d:	e8 6e 0f 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1a522:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a526:	75 25                	jne    1a54d <hyperinterval::float::F64Enclosure::expanded+0xad>
   1a528:	c6 43 08 03          	movb   $0x3,0x8(%rbx)
   1a52c:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a533:	eb 07                	jmp    1a53c <hyperinterval::float::F64Enclosure::expanded+0x9c>
   1a535:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1a53c:	48 89 d8             	mov    %rbx,%rax
   1a53f:	48 83 c4 10          	add    $0x10,%rsp
   1a543:	5b                   	pop    %rbx
   1a544:	41 5c                	pop    %r12
   1a546:	41 5d                	pop    %r13
   1a548:	41 5e                	pop    %r14
   1a54a:	41 5f                	pop    %r15
   1a54c:	c3                   	ret
   1a54d:	4c 89 e9             	mov    %r13,%rcx
   1a550:	4c 31 f1             	xor    %r14,%rcx
   1a553:	4d 85 ed             	test   %r13,%r13
   1a556:	49 0f 44 cd          	cmove  %r13,%rcx
   1a55a:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1a55f:	48 89 e7             	mov    %rsp,%rdi
   1a562:	4c 89 f6             	mov    %r14,%rsi
   1a565:	4c 89 fa             	mov    %r15,%rdx
   1a568:	e8 23 0f 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1a56d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a571:	74 1c                	je     1a58f <hyperinterval::float::F64Enclosure::expanded+0xef>
   1a573:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1a578:	48 89 e7             	mov    %rsp,%rdi
   1a57b:	4c 89 f6             	mov    %r14,%rsi
   1a57e:	4c 89 fa             	mov    %r15,%rdx
   1a581:	4c 89 e1             	mov    %r12,%rcx
   1a584:	e8 07 0f 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1a589:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a58d:	75 11                	jne    1a5a0 <hyperinterval::float::F64Enclosure::expanded+0x100>
   1a58f:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a594:	88 43 08             	mov    %al,0x8(%rbx)
   1a597:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a59e:	eb 9c                	jmp    1a53c <hyperinterval::float::F64Enclosure::expanded+0x9c>
   1a5a0:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a5a5:	4c 89 e9             	mov    %r13,%rcx
   1a5a8:	4c 09 f1             	or     %r14,%rcx
   1a5ab:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   1a5af:	4c 89 ee             	mov    %r13,%rsi
   1a5b2:	48 21 d6             	and    %rdx,%rsi
   1a5b5:	4c 89 f7             	mov    %r14,%rdi
   1a5b8:	48 29 f7             	sub    %rsi,%rdi
   1a5bb:	4d 85 ed             	test   %r13,%r13
   1a5be:	48 0f 49 f9          	cmovns %rcx,%rdi
   1a5c2:	48 89 c1             	mov    %rax,%rcx
   1a5c5:	4c 09 f1             	or     %r14,%rcx
   1a5c8:	48 21 c2             	and    %rax,%rdx
   1a5cb:	49 29 d6             	sub    %rdx,%r14
   1a5ce:	48 85 c0             	test   %rax,%rax
   1a5d1:	4c 0f 49 f1          	cmovns %rcx,%r14
   1a5d5:	4c 39 f7             	cmp    %r14,%rdi
   1a5d8:	76 10                	jbe    1a5ea <hyperinterval::float::F64Enclosure::expanded+0x14a>
   1a5da:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1a5de:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a5e5:	e9 52 ff ff ff       	jmp    1a53c <hyperinterval::float::F64Enclosure::expanded+0x9c>
   1a5ea:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1a5f1:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1a5f5:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1a5f9:	e9 3e ff ff ff       	jmp    1a53c <hyperinterval::float::F64Enclosure::expanded+0x9c>
   1a5fe:	cc                   	int3
   1a5ff:	cc                   	int3

hyperinterval::float::F64Enclosure::overlaps:
   1a600:	31 c0                	xor    %eax,%eax
   1a602:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1a606:	0f 84 94 00 00 00    	je     1a6a0 <hyperinterval::float::F64Enclosure::overlaps+0xa0>
   1a60c:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1a610:	0f 84 8a 00 00 00    	je     1a6a0 <hyperinterval::float::F64Enclosure::overlaps+0xa0>
   1a616:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1a61d:	00 00 80 
   1a620:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1a624:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1a628:	49 89 d1             	mov    %rdx,%r9
   1a62b:	49 09 c1             	or     %rax,%r9
   1a62e:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1a632:	49 89 d2             	mov    %rdx,%r10
   1a635:	49 21 ca             	and    %rcx,%r10
   1a638:	49 89 c3             	mov    %rax,%r11
   1a63b:	4d 29 d3             	sub    %r10,%r11
   1a63e:	48 85 d2             	test   %rdx,%rdx
   1a641:	4d 0f 49 d9          	cmovns %r9,%r11
   1a645:	4c 89 c2             	mov    %r8,%rdx
   1a648:	48 09 c2             	or     %rax,%rdx
   1a64b:	4d 89 c1             	mov    %r8,%r9
   1a64e:	49 21 c9             	and    %rcx,%r9
   1a651:	49 89 c2             	mov    %rax,%r10
   1a654:	4d 29 ca             	sub    %r9,%r10
   1a657:	4d 85 c0             	test   %r8,%r8
   1a65a:	4c 0f 49 d2          	cmovns %rdx,%r10
   1a65e:	4d 39 d3             	cmp    %r10,%r11
   1a661:	73 03                	jae    1a666 <hyperinterval::float::F64Enclosure::overlaps+0x66>
   1a663:	31 c0                	xor    %eax,%eax
   1a665:	c3                   	ret
   1a666:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1a66a:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1a66e:	48 89 f7             	mov    %rsi,%rdi
   1a671:	48 09 c7             	or     %rax,%rdi
   1a674:	49 89 f0             	mov    %rsi,%r8
   1a677:	49 21 c8             	and    %rcx,%r8
   1a67a:	49 89 c1             	mov    %rax,%r9
   1a67d:	4d 29 c1             	sub    %r8,%r9
   1a680:	48 85 f6             	test   %rsi,%rsi
   1a683:	4c 0f 49 cf          	cmovns %rdi,%r9
   1a687:	48 89 d6             	mov    %rdx,%rsi
   1a68a:	48 09 c6             	or     %rax,%rsi
   1a68d:	48 21 d1             	and    %rdx,%rcx
   1a690:	48 29 c8             	sub    %rcx,%rax
   1a693:	48 85 d2             	test   %rdx,%rdx
   1a696:	48 0f 49 c6          	cmovns %rsi,%rax
   1a69a:	49 39 c1             	cmp    %rax,%r9
   1a69d:	0f 93 c0             	setae  %al
   1a6a0:	c3                   	ret
   1a6a1:	cc                   	int3
   1a6a2:	cc                   	int3
   1a6a3:	cc                   	int3
   1a6a4:	cc                   	int3
   1a6a5:	cc                   	int3
   1a6a6:	cc                   	int3
   1a6a7:	cc                   	int3
   1a6a8:	cc                   	int3
   1a6a9:	cc                   	int3
   1a6aa:	cc                   	int3
   1a6ab:	cc                   	int3
   1a6ac:	cc                   	int3
   1a6ad:	cc                   	int3
   1a6ae:	cc                   	int3
   1a6af:	cc                   	int3

hyperinterval::float::F64Enclosure::from_bits:
   1a6b0:	41 57                	push   %r15
   1a6b2:	41 56                	push   %r14
   1a6b4:	41 54                	push   %r12
   1a6b6:	53                   	push   %rbx
   1a6b7:	48 83 ec 18          	sub    $0x18,%rsp
   1a6bb:	48 89 fb             	mov    %rdi,%rbx
   1a6be:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a6c5:	00 00 80 
   1a6c8:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a6cf:	00 f0 7f 
   1a6d2:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a6d7:	4c 89 f6             	mov    %r14,%rsi
   1a6da:	4c 89 fa             	mov    %r15,%rdx
   1a6dd:	31 c9                	xor    %ecx,%ecx
   1a6df:	e8 ac 0d 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1a6e4:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a6e9:	74 1e                	je     1a709 <hyperinterval::float::F64Enclosure::from_bits+0x59>
   1a6eb:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1a6f0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a6f5:	4c 89 f6             	mov    %r14,%rsi
   1a6f8:	4c 89 fa             	mov    %r15,%rdx
   1a6fb:	31 c9                	xor    %ecx,%ecx
   1a6fd:	e8 8e 0d 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1a702:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a707:	75 1b                	jne    1a724 <hyperinterval::float::F64Enclosure::from_bits+0x74>
   1a709:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1a70e:	88 43 08             	mov    %al,0x8(%rbx)
   1a711:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a718:	48 83 c4 18          	add    $0x18,%rsp
   1a71c:	5b                   	pop    %rbx
   1a71d:	41 5c                	pop    %r12
   1a71f:	41 5e                	pop    %r14
   1a721:	41 5f                	pop    %r15
   1a723:	c3                   	ret
   1a724:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1a729:	4c 89 e1             	mov    %r12,%rcx
   1a72c:	4c 09 f1             	or     %r14,%rcx
   1a72f:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   1a733:	4c 89 e6             	mov    %r12,%rsi
   1a736:	48 21 d6             	and    %rdx,%rsi
   1a739:	4c 89 f7             	mov    %r14,%rdi
   1a73c:	48 29 f7             	sub    %rsi,%rdi
   1a73f:	4d 85 e4             	test   %r12,%r12
   1a742:	48 0f 49 f9          	cmovns %rcx,%rdi
   1a746:	48 89 c1             	mov    %rax,%rcx
   1a749:	4c 09 f1             	or     %r14,%rcx
   1a74c:	48 21 c2             	and    %rax,%rdx
   1a74f:	49 29 d6             	sub    %rdx,%r14
   1a752:	48 85 c0             	test   %rax,%rax
   1a755:	4c 0f 49 f1          	cmovns %rcx,%r14
   1a759:	4c 39 f7             	cmp    %r14,%rdi
   1a75c:	76 06                	jbe    1a764 <hyperinterval::float::F64Enclosure::from_bits+0xb4>
   1a75e:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1a762:	eb ad                	jmp    1a711 <hyperinterval::float::F64Enclosure::from_bits+0x61>
   1a764:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1a76b:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   1a76f:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1a773:	eb a3                	jmp    1a718 <hyperinterval::float::F64Enclosure::from_bits+0x68>
   1a775:	cc                   	int3
   1a776:	cc                   	int3
   1a777:	cc                   	int3
   1a778:	cc                   	int3
   1a779:	cc                   	int3
   1a77a:	cc                   	int3
   1a77b:	cc                   	int3
   1a77c:	cc                   	int3
   1a77d:	cc                   	int3
   1a77e:	cc                   	int3
   1a77f:	cc                   	int3

hyperinterval::float::F64Enclosure::next_down:
   1a780:	41 57                	push   %r15
   1a782:	41 56                	push   %r14
   1a784:	53                   	push   %rbx
   1a785:	48 83 ec 10          	sub    $0x10,%rsp
   1a789:	48 89 fb             	mov    %rdi,%rbx
   1a78c:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a793:	00 00 80 
   1a796:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a79d:	00 f0 7f 
   1a7a0:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1a7a5:	48 89 e7             	mov    %rsp,%rdi
   1a7a8:	4c 89 f6             	mov    %r14,%rsi
   1a7ab:	4c 89 fa             	mov    %r15,%rdx
   1a7ae:	e8 dd 0c 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1a7b3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a7b7:	75 0c                	jne    1a7c5 <hyperinterval::float::F64Enclosure::next_down+0x45>
   1a7b9:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a7be:	88 43 01             	mov    %al,0x1(%rbx)
   1a7c1:	b0 01                	mov    $0x1,%al
   1a7c3:	eb 51                	jmp    1a816 <hyperinterval::float::F64Enclosure::next_down+0x96>
   1a7c5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a7ca:	48 89 c2             	mov    %rax,%rdx
   1a7cd:	4c 31 f2             	xor    %r14,%rdx
   1a7d0:	48 85 c0             	test   %rax,%rax
   1a7d3:	48 0f 44 d0          	cmove  %rax,%rdx
   1a7d7:	48 89 d1             	mov    %rdx,%rcx
   1a7da:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1a7de:	48 83 c9 01          	or     $0x1,%rcx
   1a7e2:	48 01 d1             	add    %rdx,%rcx
   1a7e5:	48 89 e7             	mov    %rsp,%rdi
   1a7e8:	4c 89 f6             	mov    %r14,%rsi
   1a7eb:	4c 89 fa             	mov    %r15,%rdx
   1a7ee:	e8 9d 0c 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1a7f3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a7f7:	75 08                	jne    1a801 <hyperinterval::float::F64Enclosure::next_down+0x81>
   1a7f9:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
   1a7fd:	b0 01                	mov    $0x1,%al
   1a7ff:	eb 15                	jmp    1a816 <hyperinterval::float::F64Enclosure::next_down+0x96>
   1a801:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a806:	49 31 c6             	xor    %rax,%r14
   1a809:	48 85 c0             	test   %rax,%rax
   1a80c:	4c 0f 44 f0          	cmove  %rax,%r14
   1a810:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1a814:	31 c0                	xor    %eax,%eax
   1a816:	88 03                	mov    %al,(%rbx)
   1a818:	48 89 d8             	mov    %rbx,%rax
   1a81b:	48 83 c4 10          	add    $0x10,%rsp
   1a81f:	5b                   	pop    %rbx
   1a820:	41 5e                	pop    %r14
   1a822:	41 5f                	pop    %r15
   1a824:	c3                   	ret
   1a825:	cc                   	int3
   1a826:	cc                   	int3
   1a827:	cc                   	int3
   1a828:	cc                   	int3
   1a829:	cc                   	int3
   1a82a:	cc                   	int3
   1a82b:	cc                   	int3
   1a82c:	cc                   	int3
   1a82d:	cc                   	int3
   1a82e:	cc                   	int3
   1a82f:	cc                   	int3

hyperinterval::float::F64Enclosure::subset_of:
   1a830:	b0 01                	mov    $0x1,%al
   1a832:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1a836:	75 54                	jne    1a88c <hyperinterval::float::F64Enclosure::subset_of+0x5c>
   1a838:	f6 06 01             	testb  $0x1,(%rsi)
   1a83b:	74 4d                	je     1a88a <hyperinterval::float::F64Enclosure::subset_of+0x5a>
   1a83d:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1a841:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1a845:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1a84c:	00 00 80 
   1a84f:	4d 89 c1             	mov    %r8,%r9
   1a852:	49 09 c1             	or     %rax,%r9
   1a855:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1a859:	4d 89 c2             	mov    %r8,%r10
   1a85c:	49 21 ca             	and    %rcx,%r10
   1a85f:	49 89 c3             	mov    %rax,%r11
   1a862:	4d 29 d3             	sub    %r10,%r11
   1a865:	4d 85 c0             	test   %r8,%r8
   1a868:	4d 0f 49 d9          	cmovns %r9,%r11
   1a86c:	49 89 d0             	mov    %rdx,%r8
   1a86f:	49 09 c0             	or     %rax,%r8
   1a872:	49 89 d1             	mov    %rdx,%r9
   1a875:	49 21 c9             	and    %rcx,%r9
   1a878:	49 89 c2             	mov    %rax,%r10
   1a87b:	4d 29 ca             	sub    %r9,%r10
   1a87e:	48 85 d2             	test   %rdx,%rdx
   1a881:	4d 0f 49 d0          	cmovns %r8,%r10
   1a885:	4d 39 d3             	cmp    %r10,%r11
   1a888:	76 03                	jbe    1a88d <hyperinterval::float::F64Enclosure::subset_of+0x5d>
   1a88a:	31 c0                	xor    %eax,%eax
   1a88c:	c3                   	ret
   1a88d:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1a891:	48 89 d7             	mov    %rdx,%rdi
   1a894:	48 09 c7             	or     %rax,%rdi
   1a897:	49 89 d0             	mov    %rdx,%r8
   1a89a:	49 21 c8             	and    %rcx,%r8
   1a89d:	49 89 c1             	mov    %rax,%r9
   1a8a0:	4d 29 c1             	sub    %r8,%r9
   1a8a3:	48 85 d2             	test   %rdx,%rdx
   1a8a6:	4c 0f 49 cf          	cmovns %rdi,%r9
   1a8aa:	48 8b 56 10          	mov    0x10(%rsi),%rdx
   1a8ae:	48 89 d6             	mov    %rdx,%rsi
   1a8b1:	48 09 c6             	or     %rax,%rsi
   1a8b4:	48 21 d1             	and    %rdx,%rcx
   1a8b7:	48 29 c8             	sub    %rcx,%rax
   1a8ba:	48 85 d2             	test   %rdx,%rdx
   1a8bd:	48 0f 49 c6          	cmovns %rsi,%rax
   1a8c1:	49 39 c1             	cmp    %rax,%r9
   1a8c4:	0f 96 c0             	setbe  %al
   1a8c7:	c3                   	ret
   1a8c8:	cc                   	int3
   1a8c9:	cc                   	int3
   1a8ca:	cc                   	int3
   1a8cb:	cc                   	int3
   1a8cc:	cc                   	int3
   1a8cd:	cc                   	int3
   1a8ce:	cc                   	int3
   1a8cf:	cc                   	int3

hyperinterval::ieee::Format::add:
   1a8d0:	55                   	push   %rbp
   1a8d1:	41 57                	push   %r15
   1a8d3:	41 56                	push   %r14
   1a8d5:	41 55                	push   %r13
   1a8d7:	41 54                	push   %r12
   1a8d9:	53                   	push   %rbx
   1a8da:	48 83 ec 38          	sub    $0x38,%rsp
   1a8de:	48 89 fb             	mov    %rdi,%rbx
   1a8e1:	48 85 c9             	test   %rcx,%rcx
   1a8e4:	0f 84 63 01 00 00    	je     1aa4d <hyperinterval::ieee::Format::add+0x17d>
   1a8ea:	48 89 c8             	mov    %rcx,%rax
   1a8ed:	4d 85 c0             	test   %r8,%r8
   1a8f0:	0f 84 61 01 00 00    	je     1aa57 <hyperinterval::ieee::Format::add+0x187>
   1a8f6:	41 b9 40 00 00 00    	mov    $0x40,%r9d
   1a8fc:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
   1a901:	49 89 c2             	mov    %rax,%r10
   1a904:	49 21 d2             	and    %rdx,%r10
   1a907:	44 89 c9             	mov    %r9d,%ecx
   1a90a:	49 d3 ea             	shr    %cl,%r10
   1a90d:	41 bb 01 00 00 00    	mov    $0x1,%r11d
   1a913:	49 d3 e3             	shl    %cl,%r11
   1a916:	4d 8d 63 ff          	lea    -0x1(%r11),%r12
   1a91a:	4d 89 e7             	mov    %r12,%r15
   1a91d:	49 21 c7             	and    %rax,%r15
   1a920:	4d 85 d2             	test   %r10,%r10
   1a923:	bf 01 00 00 00       	mov    $0x1,%edi
   1a928:	44 89 d5             	mov    %r10d,%ebp
   1a92b:	0f 44 ef             	cmove  %edi,%ebp
   1a92e:	4d 0f 45 d3          	cmovne %r11,%r10
   1a932:	49 89 d6             	mov    %rdx,%r14
   1a935:	49 d3 ee             	shr    %cl,%r14
   1a938:	4d 09 fa             	or     %r15,%r10
   1a93b:	49 d1 ee             	shr    $1,%r14
   1a93e:	45 01 ce             	add    %r9d,%r14d
   1a941:	48 85 f0             	test   %rsi,%rax
   1a944:	0f 95 44 24 0f       	setne  0xf(%rsp)
   1a949:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1a94e:	49 0f bd ca          	bsr    %r10,%rcx
   1a952:	83 f1 3f             	xor    $0x3f,%ecx
   1a955:	44 01 c9             	add    %r9d,%ecx
   1a958:	83 c1 c1             	add    $0xffffffc1,%ecx
   1a95b:	45 31 ed             	xor    %r13d,%r13d
   1a95e:	4d 0f a5 d5          	shld   %cl,%r10,%r13
   1a962:	45 31 ff             	xor    %r15d,%r15d
   1a965:	49 d3 e2             	shl    %cl,%r10
   1a968:	f6 c1 40             	test   $0x40,%cl
   1a96b:	4d 0f 45 ea          	cmovne %r10,%r13
   1a96f:	4d 0f 45 d7          	cmovne %r15,%r10
   1a973:	44 01 f1             	add    %r14d,%ecx
   1a976:	29 cd                	sub    %ecx,%ebp
   1a978:	4d 89 c7             	mov    %r8,%r15
   1a97b:	49 21 d7             	and    %rdx,%r15
   1a97e:	44 89 c9             	mov    %r9d,%ecx
   1a981:	49 d3 ef             	shr    %cl,%r15
   1a984:	4d 21 c4             	and    %r8,%r12
   1a987:	4d 85 ff             	test   %r15,%r15
   1a98a:	41 0f 45 ff          	cmovne %r15d,%edi
   1a98e:	4d 0f 45 fb          	cmovne %r11,%r15
   1a992:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1a997:	4d 09 e7             	or     %r12,%r15
   1a99a:	49 85 f0             	test   %rsi,%r8
   1a99d:	41 0f 95 c3          	setne  %r11b
   1a9a1:	49 0f bd cf          	bsr    %r15,%rcx
   1a9a5:	83 f1 3f             	xor    $0x3f,%ecx
   1a9a8:	44 01 c9             	add    %r9d,%ecx
   1a9ab:	83 c1 c1             	add    $0xffffffc1,%ecx
   1a9ae:	45 31 c9             	xor    %r9d,%r9d
   1a9b1:	4d 0f a5 f9          	shld   %cl,%r15,%r9
   1a9b5:	49 d3 e7             	shl    %cl,%r15
   1a9b8:	f6 c1 40             	test   $0x40,%cl
   1a9bb:	4d 0f 45 cf          	cmovne %r15,%r9
   1a9bf:	41 bc 00 00 00 00    	mov    $0x0,%r12d
   1a9c5:	4d 0f 45 fc          	cmovne %r12,%r15
   1a9c9:	41 01 ce             	add    %ecx,%r14d
   1a9cc:	44 29 f7             	sub    %r14d,%edi
   1a9cf:	39 fd                	cmp    %edi,%ebp
   1a9d1:	0f 8d 90 00 00 00    	jge    1aa67 <hyperinterval::ieee::Format::add+0x197>
   1a9d7:	44 88 5c 24 0e       	mov    %r11b,0xe(%rsp)
   1a9dc:	41 89 ee             	mov    %ebp,%r14d
   1a9df:	44 0f b6 5c 24 0f    	movzbl 0xf(%rsp),%r11d
   1a9e5:	4d 89 d4             	mov    %r10,%r12
   1a9e8:	4c 89 ed             	mov    %r13,%rbp
   1a9eb:	4d 89 c5             	mov    %r8,%r13
   1a9ee:	44 29 f7             	sub    %r14d,%edi
   1a9f1:	83 ff 4a             	cmp    $0x4a,%edi
   1a9f4:	0f 8f ab 00 00 00    	jg     1aaa5 <hyperinterval::ieee::Format::add+0x1d5>
   1a9fa:	49 85 f0             	test   %rsi,%r8
   1a9fd:	41 0f 95 c0          	setne  %r8b
   1aa01:	48 85 f0             	test   %rsi,%rax
   1aa04:	41 0f 95 c2          	setne  %r10b
   1aa08:	89 f9                	mov    %edi,%ecx
   1aa0a:	4d 0f a5 f9          	shld   %cl,%r15,%r9
   1aa0e:	49 d3 e7             	shl    %cl,%r15
   1aa11:	31 c0                	xor    %eax,%eax
   1aa13:	40 f6 c7 40          	test   $0x40,%dil
   1aa17:	4d 0f 45 cf          	cmovne %r15,%r9
   1aa1b:	49 0f 44 c7          	cmove  %r15,%rax
   1aa1f:	45 30 c2             	xor    %r8b,%r10b
   1aa22:	0f 84 ce 00 00 00    	je     1aaf6 <hyperinterval::ieee::Format::add+0x226>
   1aa28:	4c 39 e0             	cmp    %r12,%rax
   1aa2b:	4c 89 c9             	mov    %r9,%rcx
   1aa2e:	48 19 e9             	sbb    %rbp,%rcx
   1aa31:	0f 83 f5 00 00 00    	jae    1ab2c <hyperinterval::ieee::Format::add+0x25c>
   1aa37:	49 29 c4             	sub    %rax,%r12
   1aa3a:	4c 19 cd             	sbb    %r9,%rbp
   1aa3d:	44 88 5c 24 0e       	mov    %r11b,0xe(%rsp)
   1aa42:	4c 89 e0             	mov    %r12,%rax
   1aa45:	49 89 e9             	mov    %rbp,%r9
   1aa48:	e9 e5 00 00 00       	jmp    1ab32 <hyperinterval::ieee::Format::add+0x262>
   1aa4d:	4c 89 43 08          	mov    %r8,0x8(%rbx)
   1aa51:	4c 89 43 10          	mov    %r8,0x10(%rbx)
   1aa55:	eb 08                	jmp    1aa5f <hyperinterval::ieee::Format::add+0x18f>
   1aa57:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1aa5b:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1aa5f:	c6 03 00             	movb   $0x0,(%rbx)
   1aa62:	e9 f0 00 00 00       	jmp    1ab57 <hyperinterval::ieee::Format::add+0x287>
   1aa67:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1aa6c:	48 89 d6             	mov    %rdx,%rsi
   1aa6f:	89 fa                	mov    %edi,%edx
   1aa71:	4d 89 fc             	mov    %r15,%r12
   1aa74:	4d 89 ce             	mov    %r9,%r14
   1aa77:	4d 89 e9             	mov    %r13,%r9
   1aa7a:	4d 89 d7             	mov    %r10,%r15
   1aa7d:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
   1aa82:	88 4c 24 0e          	mov    %cl,0xe(%rsp)
   1aa86:	89 ef                	mov    %ebp,%edi
   1aa88:	4c 89 f5             	mov    %r14,%rbp
   1aa8b:	41 89 d6             	mov    %edx,%r14d
   1aa8e:	48 89 f2             	mov    %rsi,%rdx
   1aa91:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   1aa96:	49 89 c5             	mov    %rax,%r13
   1aa99:	44 29 f7             	sub    %r14d,%edi
   1aa9c:	83 ff 4a             	cmp    $0x4a,%edi
   1aa9f:	0f 8e 55 ff ff ff    	jle    1a9fa <hyperinterval::ieee::Format::add+0x12a>
   1aaa5:	4c 89 e8             	mov    %r13,%rax
   1aaa8:	45 84 db             	test   %r11b,%r11b
   1aaab:	74 51                	je     1aafe <hyperinterval::ieee::Format::add+0x22e>
   1aaad:	48 31 f0             	xor    %rsi,%rax
   1aab0:	48 89 c1             	mov    %rax,%rcx
   1aab3:	48 21 f1             	and    %rsi,%rcx
   1aab6:	31 ff                	xor    %edi,%edi
   1aab8:	48 f7 d9             	neg    %rcx
   1aabb:	40 0f 93 c7          	setae  %dil
   1aabf:	48 8d 0c 78          	lea    (%rax,%rdi,2),%rcx
   1aac3:	48 ff c9             	dec    %rcx
   1aac6:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1aacb:	49 89 f6             	mov    %rsi,%r14
   1aace:	e8 bd 09 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1aad3:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1aad8:	75 4b                	jne    1ab25 <hyperinterval::ieee::Format::add+0x255>
   1aada:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1aadf:	49 31 c6             	xor    %rax,%r14
   1aae2:	48 85 c0             	test   %rax,%rax
   1aae5:	4c 0f 44 f0          	cmove  %rax,%r14
   1aae9:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1aaed:	4c 89 6b 10          	mov    %r13,0x10(%rbx)
   1aaf1:	e9 69 ff ff ff       	jmp    1aa5f <hyperinterval::ieee::Format::add+0x18f>
   1aaf6:	4c 01 e0             	add    %r12,%rax
   1aaf9:	49 11 e9             	adc    %rbp,%r9
   1aafc:	eb 34                	jmp    1ab32 <hyperinterval::ieee::Format::add+0x262>
   1aafe:	48 21 f0             	and    %rsi,%rax
   1ab01:	31 c9                	xor    %ecx,%ecx
   1ab03:	48 f7 d8             	neg    %rax
   1ab06:	0f 93 c1             	setae  %cl
   1ab09:	48 8d 0c 4d ff ff ff 	lea    -0x1(,%rcx,2),%rcx
   1ab10:	ff 
   1ab11:	4c 01 e9             	add    %r13,%rcx
   1ab14:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1ab19:	e8 72 09 00 00       	call   1b490 <hyperinterval::ieee::Format::finite>
   1ab1e:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1ab23:	74 44                	je     1ab69 <hyperinterval::ieee::Format::add+0x299>
   1ab25:	66 c7 03 01 03       	movw   $0x301,(%rbx)
   1ab2a:	eb 2b                	jmp    1ab57 <hyperinterval::ieee::Format::add+0x287>
   1ab2c:	4c 29 e0             	sub    %r12,%rax
   1ab2f:	49 19 e9             	sbb    %rbp,%r9
   1ab32:	0f b6 4c 24 0e       	movzbl 0xe(%rsp),%ecx
   1ab37:	88 4c 24 24          	mov    %cl,0x24(%rsp)
   1ab3b:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1ab40:	4c 89 4c 24 18       	mov    %r9,0x18(%rsp)
   1ab45:	44 89 74 24 20       	mov    %r14d,0x20(%rsp)
   1ab4a:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1ab4f:	48 89 df             	mov    %rbx,%rdi
   1ab52:	e8 79 09 00 00       	call   1b4d0 <hyperinterval::ieee::Format::rounded>
   1ab57:	48 89 d8             	mov    %rbx,%rax
   1ab5a:	48 83 c4 38          	add    $0x38,%rsp
   1ab5e:	5b                   	pop    %rbx
   1ab5f:	41 5c                	pop    %r12
   1ab61:	41 5d                	pop    %r13
   1ab63:	41 5e                	pop    %r14
   1ab65:	41 5f                	pop    %r15
   1ab67:	5d                   	pop    %rbp
   1ab68:	c3                   	ret
   1ab69:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1ab6e:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1ab72:	e9 e4 fe ff ff       	jmp    1aa5b <hyperinterval::ieee::Format::add+0x18b>
   1ab77:	cc                   	int3
   1ab78:	cc                   	int3
   1ab79:	cc                   	int3
   1ab7a:	cc                   	int3
   1ab7b:	cc                   	int3
   1ab7c:	cc                   	int3
   1ab7d:	cc                   	int3
   1ab7e:	cc                   	int3
   1ab7f:	cc                   	int3

hyperinterval::ieee::Format::div:
   1ab80:	55                   	push   %rbp
   1ab81:	41 57                	push   %r15
   1ab83:	41 56                	push   %r14
   1ab85:	41 55                	push   %r13
   1ab87:	41 54                	push   %r12
   1ab89:	53                   	push   %rbx
   1ab8a:	48 83 ec 48          	sub    $0x48,%rsp
   1ab8e:	4d 85 c0             	test   %r8,%r8
   1ab91:	0f 84 cb 00 00 00    	je     1ac62 <hyperinterval::ieee::Format::div+0xe2>
   1ab97:	48 85 c9             	test   %rcx,%rcx
   1ab9a:	0f 84 cc 00 00 00    	je     1ac6c <hyperinterval::ieee::Format::div+0xec>
   1aba0:	41 be 40 00 00 00    	mov    $0x40,%r14d
   1aba6:	f3 4c 0f bc f2       	tzcnt  %rdx,%r14
   1abab:	49 89 cd             	mov    %rcx,%r13
   1abae:	49 21 d5             	and    %rdx,%r13
   1abb1:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
   1abb6:	41 83 e6 3f          	and    $0x3f,%r14d
   1abba:	48 89 c8             	mov    %rcx,%rax
   1abbd:	44 89 f1             	mov    %r14d,%ecx
   1abc0:	49 d3 ed             	shr    %cl,%r13
   1abc3:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1abc9:	49 d3 e2             	shl    %cl,%r10
   1abcc:	4d 8d 5a ff          	lea    -0x1(%r10),%r11
   1abd0:	4c 89 db             	mov    %r11,%rbx
   1abd3:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1abd8:	48 21 c3             	and    %rax,%rbx
   1abdb:	4d 85 ed             	test   %r13,%r13
   1abde:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1abe4:	44 89 e8             	mov    %r13d,%eax
   1abe7:	41 0f 44 c1          	cmove  %r9d,%eax
   1abeb:	4d 0f 45 ea          	cmovne %r10,%r13
   1abef:	4c 89 c5             	mov    %r8,%rbp
   1abf2:	48 21 d5             	and    %rdx,%rbp
   1abf5:	48 d3 ea             	shr    %cl,%rdx
   1abf8:	48 d3 ed             	shr    %cl,%rbp
   1abfb:	49 09 dd             	or     %rbx,%r13
   1abfe:	48 d1 ea             	shr    $1,%rdx
   1ac01:	4d 21 c3             	and    %r8,%r11
   1ac04:	48 85 ed             	test   %rbp,%rbp
   1ac07:	44 0f 45 cd          	cmovne %ebp,%r9d
   1ac0b:	49 0f 45 ea          	cmovne %r10,%rbp
   1ac0f:	4c 09 dd             	or     %r11,%rbp
   1ac12:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1ac17:	41 ba 7f 00 00 00    	mov    $0x7f,%r10d
   1ac1d:	4c 0f bd d5          	bsr    %rbp,%r10
   1ac21:	41 83 f2 3f          	xor    $0x3f,%r10d
   1ac25:	41 83 c2 40          	add    $0x40,%r10d
   1ac29:	49 0f bd cd          	bsr    %r13,%rcx
   1ac2d:	83 f1 3f             	xor    $0x3f,%ecx
   1ac30:	45 89 d7             	mov    %r10d,%r15d
   1ac33:	41 29 cf             	sub    %ecx,%r15d
   1ac36:	41 83 c7 c0          	add    $0xffffffc0,%r15d
   1ac3a:	78 3f                	js     1ac7b <hyperinterval::ieee::Format::div+0xfb>
   1ac3c:	45 31 db             	xor    %r11d,%r11d
   1ac3f:	44 89 f9             	mov    %r15d,%ecx
   1ac42:	49 0f a5 eb          	shld   %cl,%rbp,%r11
   1ac46:	31 db                	xor    %ebx,%ebx
   1ac48:	49 89 ec             	mov    %rbp,%r12
   1ac4b:	49 d3 e4             	shl    %cl,%r12
   1ac4e:	41 f6 c7 40          	test   $0x40,%r15b
   1ac52:	4d 0f 45 dc          	cmovne %r12,%r11
   1ac56:	4c 0f 45 e3          	cmovne %rbx,%r12
   1ac5a:	4d 39 e5             	cmp    %r12,%r13
   1ac5d:	4c 19 db             	sbb    %r11,%rbx
   1ac60:	eb 3f                	jmp    1aca1 <hyperinterval::ieee::Format::div+0x121>
   1ac62:	66 c7 07 01 04       	movw   $0x401,(%rdi)
   1ac67:	e9 24 03 00 00       	jmp    1af90 <hyperinterval::ieee::Format::div+0x410>
   1ac6c:	c6 07 00             	movb   $0x0,(%rdi)
   1ac6f:	0f 57 c0             	xorps  %xmm0,%xmm0
   1ac72:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1ac76:	e9 15 03 00 00       	jmp    1af90 <hyperinterval::ieee::Format::div+0x410>
   1ac7b:	44 89 f9             	mov    %r15d,%ecx
   1ac7e:	f6 d9                	neg    %cl
   1ac80:	45 31 db             	xor    %r11d,%r11d
   1ac83:	4d 0f a5 eb          	shld   %cl,%r13,%r11
   1ac87:	31 db                	xor    %ebx,%ebx
   1ac89:	4d 89 ec             	mov    %r13,%r12
   1ac8c:	49 d3 e4             	shl    %cl,%r12
   1ac8f:	f6 c1 40             	test   $0x40,%cl
   1ac92:	4d 0f 45 dc          	cmovne %r12,%r11
   1ac96:	4c 0f 45 e3          	cmovne %rbx,%r12
   1ac9a:	49 39 ec             	cmp    %rbp,%r12
   1ac9d:	49 83 db 00          	sbb    $0x0,%r11
   1aca1:	0f 92 c1             	setb   %cl
   1aca4:	44 29 c8             	sub    %r9d,%eax
   1aca7:	41 01 c7             	add    %eax,%r15d
   1acaa:	0f b6 c9             	movzbl %cl,%ecx
   1acad:	41 29 cf             	sub    %ecx,%r15d
   1acb0:	41 39 d7             	cmp    %edx,%r15d
   1acb3:	0f 8f 19 02 00 00    	jg     1aed2 <hyperinterval::ieee::Format::div+0x352>
   1acb9:	4c 8b 4c 24 10       	mov    0x10(%rsp),%r9
   1acbe:	46 8d 1c 0a          	lea    (%rdx,%r9,1),%r11d
   1acc2:	b9 01 00 00 00       	mov    $0x1,%ecx
   1acc7:	4c 89 5c 24 18       	mov    %r11,0x18(%rsp)
   1accc:	44 29 d9             	sub    %r11d,%ecx
   1accf:	45 29 cf             	sub    %r9d,%r15d
   1acd2:	41 39 cf             	cmp    %ecx,%r15d
   1acd5:	44 0f 4e f9          	cmovle %ecx,%r15d
   1acd9:	44 29 f8             	sub    %r15d,%eax
   1acdc:	78 61                	js     1ad3f <hyperinterval::ieee::Format::div+0x1bf>
   1acde:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1ace3:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
   1ace8:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1aced:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1acf2:	48 85 ed             	test   %rbp,%rbp
   1acf5:	0f 84 a7 02 00 00    	je     1afa2 <hyperinterval::ieee::Format::div+0x422>
   1acfb:	45 31 e4             	xor    %r12d,%r12d
   1acfe:	89 c1                	mov    %eax,%ecx
   1ad00:	4d 0f a5 ec          	shld   %cl,%r13,%r12
   1ad04:	31 d2                	xor    %edx,%edx
   1ad06:	49 d3 e5             	shl    %cl,%r13
   1ad09:	a8 40                	test   $0x40,%al
   1ad0b:	4d 0f 45 e5          	cmovne %r13,%r12
   1ad0f:	4c 0f 45 ea          	cmovne %rdx,%r13
   1ad13:	4c 89 ef             	mov    %r13,%rdi
   1ad16:	4c 89 e6             	mov    %r12,%rsi
   1ad19:	48 89 ea             	mov    %rbp,%rdx
   1ad1c:	31 c9                	xor    %ecx,%ecx
   1ad1e:	ff 15 9c 2a 04 00    	call   *0x42a9c(%rip)        # 5d7c0 <_DYNAMIC+0x410>
   1ad24:	49 89 c2             	mov    %rax,%r10
   1ad27:	49 89 d1             	mov    %rdx,%r9
   1ad2a:	48 89 d1             	mov    %rdx,%rcx
   1ad2d:	48 0f af cd          	imul   %rbp,%rcx
   1ad31:	48 f7 e5             	mul    %rbp
   1ad34:	48 01 ca             	add    %rcx,%rdx
   1ad37:	49 29 c5             	sub    %rax,%r13
   1ad3a:	49 19 d4             	sbb    %rdx,%r12
   1ad3d:	eb 79                	jmp    1adb8 <hyperinterval::ieee::Format::div+0x238>
   1ad3f:	f7 d8                	neg    %eax
   1ad41:	44 39 d0             	cmp    %r10d,%eax
   1ad44:	7e 07                	jle    1ad4d <hyperinterval::ieee::Format::div+0x1cd>
   1ad46:	b3 01                	mov    $0x1,%bl
   1ad48:	e9 df 00 00 00       	jmp    1ae2c <hyperinterval::ieee::Format::div+0x2ac>
   1ad4d:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1ad52:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
   1ad57:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1ad5c:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1ad61:	31 db                	xor    %ebx,%ebx
   1ad63:	89 c1                	mov    %eax,%ecx
   1ad65:	48 0f a5 eb          	shld   %cl,%rbp,%rbx
   1ad69:	48 d3 e5             	shl    %cl,%rbp
   1ad6c:	31 c9                	xor    %ecx,%ecx
   1ad6e:	a8 40                	test   $0x40,%al
   1ad70:	48 0f 45 dd          	cmovne %rbp,%rbx
   1ad74:	48 0f 45 e9          	cmovne %rcx,%rbp
   1ad78:	48 89 e8             	mov    %rbp,%rax
   1ad7b:	48 09 d8             	or     %rbx,%rax
   1ad7e:	0f 84 2b 02 00 00    	je     1afaf <hyperinterval::ieee::Format::div+0x42f>
   1ad84:	45 31 e4             	xor    %r12d,%r12d
   1ad87:	4c 89 ef             	mov    %r13,%rdi
   1ad8a:	31 f6                	xor    %esi,%esi
   1ad8c:	48 89 ea             	mov    %rbp,%rdx
   1ad8f:	48 89 d9             	mov    %rbx,%rcx
   1ad92:	ff 15 28 2a 04 00    	call   *0x42a28(%rip)        # 5d7c0 <_DYNAMIC+0x410>
   1ad98:	49 89 c2             	mov    %rax,%r10
   1ad9b:	49 89 d1             	mov    %rdx,%r9
   1ad9e:	48 0f af d8          	imul   %rax,%rbx
   1ada2:	48 f7 e5             	mul    %rbp
   1ada5:	48 01 da             	add    %rbx,%rdx
   1ada8:	4c 89 c9             	mov    %r9,%rcx
   1adab:	48 0f af cd          	imul   %rbp,%rcx
   1adaf:	48 01 d1             	add    %rdx,%rcx
   1adb2:	49 29 c5             	sub    %rax,%r13
   1adb5:	49 19 cc             	sbb    %rcx,%r12
   1adb8:	4d 09 e5             	or     %r12,%r13
   1adbb:	0f 95 c3             	setne  %bl
   1adbe:	4c 89 d0             	mov    %r10,%rax
   1adc1:	4c 09 c8             	or     %r9,%rax
   1adc4:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
   1adc9:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   1adce:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
   1add3:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
   1add8:	74 52                	je     1ae2c <hyperinterval::ieee::Format::div+0x2ac>
   1adda:	49 0f bd c1          	bsr    %r9,%rax
   1adde:	83 f0 3f             	xor    $0x3f,%eax
   1ade1:	4d 0f bd da          	bsr    %r10,%r11
   1ade5:	41 83 f3 3f          	xor    $0x3f,%r11d
   1ade9:	41 83 cb 40          	or     $0x40,%r11d
   1aded:	4d 85 c9             	test   %r9,%r9
   1adf0:	44 0f 45 d8          	cmovne %eax,%r11d
   1adf4:	41 83 f3 7f          	xor    $0x7f,%r11d
   1adf8:	43 8d 2c 3b          	lea    (%r11,%r15,1),%ebp
   1adfc:	39 d5                	cmp    %edx,%ebp
   1adfe:	0f 8f ce 00 00 00    	jg     1aed2 <hyperinterval::ieee::Format::div+0x352>
   1ae04:	b8 01 00 00 00       	mov    $0x1,%eax
   1ae09:	29 d0                	sub    %edx,%eax
   1ae0b:	39 c5                	cmp    %eax,%ebp
   1ae0d:	7d 28                	jge    1ae37 <hyperinterval::ieee::Format::div+0x2b7>
   1ae0f:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1ae14:	42 8d 0c 38          	lea    (%rax,%r15,1),%ecx
   1ae18:	fe c9                	dec    %cl
   1ae1a:	4c 89 d0             	mov    %r10,%rax
   1ae1d:	48 d3 e0             	shl    %cl,%rax
   1ae20:	45 31 db             	xor    %r11d,%r11d
   1ae23:	f6 c1 40             	test   $0x40,%cl
   1ae26:	4c 0f 44 d8          	cmove  %rax,%r11
   1ae2a:	eb 6e                	jmp    1ae9a <hyperinterval::ieee::Format::div+0x31a>
   1ae2c:	45 31 d2             	xor    %r10d,%r10d
   1ae2f:	45 31 c9             	xor    %r9d,%r9d
   1ae32:	45 31 db             	xor    %r11d,%r11d
   1ae35:	eb 63                	jmp    1ae9a <hyperinterval::ieee::Format::div+0x31a>
   1ae37:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1ae3c:	89 c1                	mov    %eax,%ecx
   1ae3e:	44 29 d9             	sub    %r11d,%ecx
   1ae41:	4d 89 d4             	mov    %r10,%r12
   1ae44:	49 d3 e4             	shl    %cl,%r12
   1ae47:	89 c8                	mov    %ecx,%eax
   1ae49:	f7 d8                	neg    %eax
   1ae4b:	45 31 ed             	xor    %r13d,%r13d
   1ae4e:	f6 c1 40             	test   $0x40,%cl
   1ae51:	4d 0f 44 ec          	cmove  %r12,%r13
   1ae55:	4d 89 d4             	mov    %r10,%r12
   1ae58:	89 c1                	mov    %eax,%ecx
   1ae5a:	4d 0f ad cc          	shrd   %cl,%r9,%r12
   1ae5e:	88 5c 24 0f          	mov    %bl,0xf(%rsp)
   1ae62:	4c 89 cb             	mov    %r9,%rbx
   1ae65:	48 d3 eb             	shr    %cl,%rbx
   1ae68:	a8 40                	test   $0x40,%al
   1ae6a:	49 0f 44 dc          	cmove  %r12,%rbx
   1ae6e:	44 39 5c 24 10       	cmp    %r11d,0x10(%rsp)
   1ae73:	49 0f 43 dd          	cmovae %r13,%rbx
   1ae77:	01 d5                	add    %edx,%ebp
   1ae79:	48 63 c5             	movslq %ebp,%rax
   1ae7c:	44 89 f1             	mov    %r14d,%ecx
   1ae7f:	48 d3 e0             	shl    %cl,%rax
   1ae82:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   1ae89:	49 d3 e3             	shl    %cl,%r11
   1ae8c:	49 f7 d3             	not    %r11
   1ae8f:	49 21 db             	and    %rbx,%r11
   1ae92:	0f b6 5c 24 0f       	movzbl 0xf(%rsp),%ebx
   1ae97:	49 09 c3             	or     %rax,%r11
   1ae9a:	0f b6 db             	movzbl %bl,%ebx
   1ae9d:	4c 01 d3             	add    %r10,%rbx
   1aea0:	49 83 d1 00          	adc    $0x0,%r9
   1aea4:	48 89 d8             	mov    %rbx,%rax
   1aea7:	4c 09 c8             	or     %r9,%rax
   1aeaa:	74 30                	je     1aedc <hyperinterval::ieee::Format::div+0x35c>
   1aeac:	49 0f bd c1          	bsr    %r9,%rax
   1aeb0:	83 f0 3f             	xor    $0x3f,%eax
   1aeb3:	4c 0f bd d3          	bsr    %rbx,%r10
   1aeb7:	41 83 f2 3f          	xor    $0x3f,%r10d
   1aebb:	41 83 ca 40          	or     $0x40,%r10d
   1aebf:	4d 85 c9             	test   %r9,%r9
   1aec2:	44 0f 45 d0          	cmovne %eax,%r10d
   1aec6:	41 83 f2 7f          	xor    $0x7f,%r10d
   1aeca:	43 8d 2c 3a          	lea    (%r10,%r15,1),%ebp
   1aece:	39 d5                	cmp    %edx,%ebp
   1aed0:	7e 0e                	jle    1aee0 <hyperinterval::ieee::Format::div+0x360>
   1aed2:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   1aed7:	e9 b4 00 00 00       	jmp    1af90 <hyperinterval::ieee::Format::div+0x410>
   1aedc:	31 c0                	xor    %eax,%eax
   1aede:	eb 76                	jmp    1af56 <hyperinterval::ieee::Format::div+0x3d6>
   1aee0:	b8 01 00 00 00       	mov    $0x1,%eax
   1aee5:	29 d0                	sub    %edx,%eax
   1aee7:	39 c5                	cmp    %eax,%ebp
   1aee9:	7d 18                	jge    1af03 <hyperinterval::ieee::Format::div+0x383>
   1aeeb:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1aef0:	44 01 f9             	add    %r15d,%ecx
   1aef3:	fe c9                	dec    %cl
   1aef5:	48 d3 e3             	shl    %cl,%rbx
   1aef8:	31 c0                	xor    %eax,%eax
   1aefa:	f6 c1 40             	test   $0x40,%cl
   1aefd:	48 0f 44 c3          	cmove  %rbx,%rax
   1af01:	eb 53                	jmp    1af56 <hyperinterval::ieee::Format::div+0x3d6>
   1af03:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   1af08:	44 89 e9             	mov    %r13d,%ecx
   1af0b:	44 29 d1             	sub    %r10d,%ecx
   1af0e:	89 c8                	mov    %ecx,%eax
   1af10:	f7 d8                	neg    %eax
   1af12:	49 89 df             	mov    %rbx,%r15
   1af15:	49 d3 e7             	shl    %cl,%r15
   1af18:	45 31 e4             	xor    %r12d,%r12d
   1af1b:	f6 c1 40             	test   $0x40,%cl
   1af1e:	4d 0f 44 e7          	cmove  %r15,%r12
   1af22:	89 c1                	mov    %eax,%ecx
   1af24:	4c 0f ad cb          	shrd   %cl,%r9,%rbx
   1af28:	49 d3 e9             	shr    %cl,%r9
   1af2b:	a8 40                	test   $0x40,%al
   1af2d:	4c 0f 44 cb          	cmove  %rbx,%r9
   1af31:	45 39 d5             	cmp    %r10d,%r13d
   1af34:	4d 0f 43 cc          	cmovae %r12,%r9
   1af38:	01 d5                	add    %edx,%ebp
   1af3a:	48 63 d5             	movslq %ebp,%rdx
   1af3d:	44 89 f1             	mov    %r14d,%ecx
   1af40:	48 d3 e2             	shl    %cl,%rdx
   1af43:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   1af4a:	48 d3 e0             	shl    %cl,%rax
   1af4d:	48 f7 d0             	not    %rax
   1af50:	4c 21 c8             	and    %r9,%rax
   1af53:	48 09 d0             	or     %rdx,%rax
   1af56:	48 85 74 24 40       	test   %rsi,0x40(%rsp)
   1af5b:	0f 95 c1             	setne  %cl
   1af5e:	49 85 f0             	test   %rsi,%r8
   1af61:	0f 94 c2             	sete   %dl
   1af64:	30 ca                	xor    %cl,%dl
   1af66:	75 1d                	jne    1af85 <hyperinterval::ieee::Format::div+0x405>
   1af68:	48 89 c1             	mov    %rax,%rcx
   1af6b:	48 31 f1             	xor    %rsi,%rcx
   1af6e:	48 85 c0             	test   %rax,%rax
   1af71:	48 0f 44 c8          	cmove  %rax,%rcx
   1af75:	4c 31 de             	xor    %r11,%rsi
   1af78:	4d 85 db             	test   %r11,%r11
   1af7b:	49 0f 44 f3          	cmove  %r11,%rsi
   1af7f:	48 89 f0             	mov    %rsi,%rax
   1af82:	49 89 cb             	mov    %rcx,%r11
   1af85:	4c 89 5f 08          	mov    %r11,0x8(%rdi)
   1af89:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1af8d:	c6 07 00             	movb   $0x0,(%rdi)
   1af90:	48 89 f8             	mov    %rdi,%rax
   1af93:	48 83 c4 48          	add    $0x48,%rsp
   1af97:	5b                   	pop    %rbx
   1af98:	41 5c                	pop    %r12
   1af9a:	41 5d                	pop    %r13
   1af9c:	41 5e                	pop    %r14
   1af9e:	41 5f                	pop    %r15
   1afa0:	5d                   	pop    %rbp
   1afa1:	c3                   	ret
   1afa2:	48 8d 3d 87 05 04 00 	lea    0x40587(%rip),%rdi        # 5b530 <__frame_dummy_init_array_entry+0x1c0>
   1afa9:	ff 15 19 28 04 00    	call   *0x42819(%rip)        # 5d7c8 <_DYNAMIC+0x418>
   1afaf:	48 8d 3d 62 05 04 00 	lea    0x40562(%rip),%rdi        # 5b518 <__frame_dummy_init_array_entry+0x1a8>
   1afb6:	ff 15 0c 28 04 00    	call   *0x4280c(%rip)        # 5d7c8 <_DYNAMIC+0x418>
   1afbc:	cc                   	int3
   1afbd:	cc                   	int3
   1afbe:	cc                   	int3
   1afbf:	cc                   	int3

hyperinterval::ieee::Format::mul:
   1afc0:	55                   	push   %rbp
   1afc1:	41 57                	push   %r15
   1afc3:	41 56                	push   %r14
   1afc5:	41 54                	push   %r12
   1afc7:	53                   	push   %rbx
   1afc8:	48 83 ec 20          	sub    $0x20,%rsp
   1afcc:	48 89 c8             	mov    %rcx,%rax
   1afcf:	49 89 d1             	mov    %rdx,%r9
   1afd2:	b9 40 00 00 00       	mov    $0x40,%ecx
   1afd7:	f3 48 0f bc ca       	tzcnt  %rdx,%rcx
   1afdc:	48 89 c2             	mov    %rax,%rdx
   1afdf:	4c 21 ca             	and    %r9,%rdx
   1afe2:	48 d3 ea             	shr    %cl,%rdx
   1afe5:	41 be 01 00 00 00    	mov    $0x1,%r14d
   1afeb:	49 d3 e6             	shl    %cl,%r14
   1afee:	4d 8d 66 ff          	lea    -0x1(%r14),%r12
   1aff2:	4c 89 e3             	mov    %r12,%rbx
   1aff5:	48 21 c3             	and    %rax,%rbx
   1aff8:	48 85 d2             	test   %rdx,%rdx
   1affb:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1b001:	41 89 d3             	mov    %edx,%r11d
   1b004:	45 0f 44 da          	cmove  %r10d,%r11d
   1b008:	49 0f 45 d6          	cmovne %r14,%rdx
   1b00c:	48 09 da             	or     %rbx,%rdx
   1b00f:	4d 89 cf             	mov    %r9,%r15
   1b012:	49 d3 ef             	shr    %cl,%r15
   1b015:	48 85 f0             	test   %rsi,%rax
   1b018:	40 0f 95 c5          	setne  %bpl
   1b01c:	4c 89 c0             	mov    %r8,%rax
   1b01f:	4c 21 c8             	and    %r9,%rax
   1b022:	48 d3 e8             	shr    %cl,%rax
   1b025:	4d 21 c4             	and    %r8,%r12
   1b028:	48 85 c0             	test   %rax,%rax
   1b02b:	44 0f 45 d0          	cmovne %eax,%r10d
   1b02f:	48 89 fb             	mov    %rdi,%rbx
   1b032:	49 0f 45 c6          	cmovne %r14,%rax
   1b036:	4c 09 e0             	or     %r12,%rax
   1b039:	49 85 f0             	test   %rsi,%r8
   1b03c:	40 0f 95 c7          	setne  %dil
   1b040:	40 30 ef             	xor    %bpl,%dil
   1b043:	48 f7 e2             	mul    %rdx
   1b046:	45 01 da             	add    %r11d,%r10d
   1b049:	41 8d 0c 4f          	lea    (%r15,%rcx,2),%ecx
   1b04d:	83 e1 fe             	and    $0xfffffffe,%ecx
   1b050:	41 29 ca             	sub    %ecx,%r10d
   1b053:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
   1b058:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b05d:	48 89 04 24          	mov    %rax,(%rsp)
   1b061:	44 89 54 24 10       	mov    %r10d,0x10(%rsp)
   1b066:	48 89 e1             	mov    %rsp,%rcx
   1b069:	48 89 df             	mov    %rbx,%rdi
   1b06c:	4c 89 ca             	mov    %r9,%rdx
   1b06f:	e8 5c 04 00 00       	call   1b4d0 <hyperinterval::ieee::Format::rounded>
   1b074:	48 89 d8             	mov    %rbx,%rax
   1b077:	48 83 c4 20          	add    $0x20,%rsp
   1b07b:	5b                   	pop    %rbx
   1b07c:	41 5c                	pop    %r12
   1b07e:	41 5e                	pop    %r14
   1b080:	41 5f                	pop    %r15
   1b082:	5d                   	pop    %rbp
   1b083:	c3                   	ret
   1b084:	cc                   	int3
   1b085:	cc                   	int3
   1b086:	cc                   	int3
   1b087:	cc                   	int3
   1b088:	cc                   	int3
   1b089:	cc                   	int3
   1b08a:	cc                   	int3
   1b08b:	cc                   	int3
   1b08c:	cc                   	int3
   1b08d:	cc                   	int3
   1b08e:	cc                   	int3
   1b08f:	cc                   	int3

hyperinterval::ieee::Format::power:
   1b090:	55                   	push   %rbp
   1b091:	41 57                	push   %r15
   1b093:	41 56                	push   %r14
   1b095:	41 55                	push   %r13
   1b097:	41 54                	push   %r12
   1b099:	53                   	push   %rbx
   1b09a:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
   1b0a1:	49 89 cb             	mov    %rcx,%r11
   1b0a4:	49 89 d6             	mov    %rdx,%r14
   1b0a7:	48 85 f1             	test   %rsi,%rcx
   1b0aa:	41 0f 95 c1          	setne  %r9b
   1b0ae:	b8 40 00 00 00       	mov    $0x40,%eax
   1b0b3:	f3 48 0f bc c2       	tzcnt  %rdx,%rax
   1b0b8:	41 89 c2             	mov    %eax,%r10d
   1b0bb:	41 83 e2 3f          	and    $0x3f,%r10d
   1b0bf:	44 89 d1             	mov    %r10d,%ecx
   1b0c2:	48 d3 ea             	shr    %cl,%rdx
   1b0c5:	48 89 d1             	mov    %rdx,%rcx
   1b0c8:	48 d1 e9             	shr    $1,%rcx
   1b0cb:	48 63 d9             	movslq %ecx,%rbx
   1b0ce:	44 89 d1             	mov    %r10d,%ecx
   1b0d1:	48 d3 e3             	shl    %cl,%rbx
   1b0d4:	45 85 c0             	test   %r8d,%r8d
   1b0d7:	0f 84 46 03 00 00    	je     1b423 <hyperinterval::ieee::Format::power+0x393>
   1b0dd:	44 88 4c 24 03       	mov    %r9b,0x3(%rsp)
   1b0e2:	48 89 7c 24 48       	mov    %rdi,0x48(%rsp)
   1b0e7:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1b0ed:	44 89 d1             	mov    %r10d,%ecx
   1b0f0:	49 d3 e1             	shl    %cl,%r9
   1b0f3:	48 8d 4e ff          	lea    -0x1(%rsi),%rcx
   1b0f7:	49 21 cb             	and    %rcx,%r11
   1b0fa:	48 89 d9             	mov    %rbx,%rcx
   1b0fd:	4d 8d 79 ff          	lea    -0x1(%r9),%r15
   1b101:	8d 2c 42             	lea    (%rdx,%rax,2),%ebp
   1b104:	83 e5 fe             	and    $0xfffffffe,%ebp
   1b107:	ba 02 00 00 00       	mov    $0x2,%edx
   1b10c:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1b111:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1b116:	44 89 44 24 68       	mov    %r8d,0x68(%rsp)
   1b11b:	44 89 c3             	mov    %r8d,%ebx
   1b11e:	4c 89 5c 24 58       	mov    %r11,0x58(%rsp)
   1b123:	4c 89 5c 24 60       	mov    %r11,0x60(%rsp)
   1b128:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
   1b12d:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   1b132:	4c 89 8c 24 80 00 00 	mov    %r9,0x80(%rsp)
   1b139:	00 
   1b13a:	4c 89 54 24 78       	mov    %r10,0x78(%rsp)
   1b13f:	4c 89 7c 24 70       	mov    %r15,0x70(%rsp)
   1b144:	89 6c 24 6c          	mov    %ebp,0x6c(%rsp)
   1b148:	f6 c3 01             	test   $0x1,%bl
   1b14b:	0f 84 a4 01 00 00    	je     1b2f5 <hyperinterval::ieee::Format::power+0x265>
   1b151:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   1b158:	0f 1f 84 00 00 00 00 
   1b15f:	00 
   1b160:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
   1b164:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1b169:	48 89 d0             	mov    %rdx,%rax
   1b16c:	4c 21 f0             	and    %r14,%rax
   1b16f:	44 89 d1             	mov    %r10d,%ecx
   1b172:	48 d3 e8             	shr    %cl,%rax
   1b175:	48 89 d1             	mov    %rdx,%rcx
   1b178:	4c 21 f9             	and    %r15,%rcx
   1b17b:	48 85 c0             	test   %rax,%rax
   1b17e:	41 89 c3             	mov    %eax,%r11d
   1b181:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1b187:	45 0f 44 d8          	cmove  %r8d,%r11d
   1b18b:	49 0f 45 c1          	cmovne %r9,%rax
   1b18f:	48 09 c8             	or     %rcx,%rax
   1b192:	48 85 f2             	test   %rsi,%rdx
   1b195:	0f 95 44 24 08       	setne  0x8(%rsp)
   1b19a:	4c 8b 6c 24 60       	mov    0x60(%rsp),%r13
   1b19f:	4c 89 eb             	mov    %r13,%rbx
   1b1a2:	4c 21 f3             	and    %r14,%rbx
   1b1a5:	44 89 d1             	mov    %r10d,%ecx
   1b1a8:	48 d3 eb             	shr    %cl,%rbx
   1b1ab:	4c 89 e9             	mov    %r13,%rcx
   1b1ae:	4c 21 f9             	and    %r15,%rcx
   1b1b1:	48 85 db             	test   %rbx,%rbx
   1b1b4:	41 89 d8             	mov    %ebx,%r8d
   1b1b7:	ba 01 00 00 00       	mov    $0x1,%edx
   1b1bc:	44 0f 44 c2          	cmove  %edx,%r8d
   1b1c0:	49 0f 45 d9          	cmovne %r9,%rbx
   1b1c4:	48 09 cb             	or     %rcx,%rbx
   1b1c7:	49 85 f5             	test   %rsi,%r13
   1b1ca:	0f 95 c1             	setne  %cl
   1b1cd:	32 4c 24 08          	xor    0x8(%rsp),%cl
   1b1d1:	48 f7 e3             	mul    %rbx
   1b1d4:	41 29 e8             	sub    %ebp,%r8d
   1b1d7:	45 01 d8             	add    %r11d,%r8d
   1b1da:	88 4c 24 24          	mov    %cl,0x24(%rsp)
   1b1de:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1b1e3:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1b1e8:	44 89 44 24 20       	mov    %r8d,0x20(%rsp)
   1b1ed:	4c 89 f2             	mov    %r14,%rdx
   1b1f0:	4c 89 e1             	mov    %r12,%rcx
   1b1f3:	49 89 fd             	mov    %rdi,%r13
   1b1f6:	4d 89 cc             	mov    %r9,%r12
   1b1f9:	48 89 f3             	mov    %rsi,%rbx
   1b1fc:	4c 89 f5             	mov    %r14,%rbp
   1b1ff:	4d 89 d6             	mov    %r10,%r14
   1b202:	e8 c9 02 00 00       	call   1b4d0 <hyperinterval::ieee::Format::rounded>
   1b207:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   1b20c:	0f 85 00 02 00 00    	jne    1b412 <hyperinterval::ieee::Format::power+0x382>
   1b212:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
   1b217:	48 89 d0             	mov    %rdx,%rax
   1b21a:	48 21 e8             	and    %rbp,%rax
   1b21d:	44 89 f1             	mov    %r14d,%ecx
   1b220:	48 d3 e8             	shr    %cl,%rax
   1b223:	48 89 d1             	mov    %rdx,%rcx
   1b226:	4c 21 f9             	and    %r15,%rcx
   1b229:	48 85 c0             	test   %rax,%rax
   1b22c:	89 c6                	mov    %eax,%esi
   1b22e:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1b234:	41 0f 44 f2          	cmove  %r10d,%esi
   1b238:	49 0f 45 c4          	cmovne %r12,%rax
   1b23c:	48 09 c8             	or     %rcx,%rax
   1b23f:	48 85 da             	test   %rbx,%rdx
   1b242:	0f 95 c2             	setne  %dl
   1b245:	4c 8b 4c 24 58       	mov    0x58(%rsp),%r9
   1b24a:	4c 89 cf             	mov    %r9,%rdi
   1b24d:	48 21 ef             	and    %rbp,%rdi
   1b250:	44 89 f1             	mov    %r14d,%ecx
   1b253:	48 d3 ef             	shr    %cl,%rdi
   1b256:	4c 89 c9             	mov    %r9,%rcx
   1b259:	4c 21 f9             	and    %r15,%rcx
   1b25c:	48 85 ff             	test   %rdi,%rdi
   1b25f:	41 89 f8             	mov    %edi,%r8d
   1b262:	45 0f 44 c2          	cmove  %r10d,%r8d
   1b266:	49 0f 45 fc          	cmovne %r12,%rdi
   1b26a:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
   1b26f:	4c 89 54 24 08       	mov    %r10,0x8(%rsp)
   1b274:	48 09 cf             	or     %rcx,%rdi
   1b277:	49 85 d9             	test   %rbx,%r9
   1b27a:	0f 95 c1             	setne  %cl
   1b27d:	30 d1                	xor    %dl,%cl
   1b27f:	48 f7 e7             	mul    %rdi
   1b282:	4d 89 ef             	mov    %r13,%r15
   1b285:	44 8b 6c 24 6c       	mov    0x6c(%rsp),%r13d
   1b28a:	45 29 e8             	sub    %r13d,%r8d
   1b28d:	41 01 f0             	add    %esi,%r8d
   1b290:	88 4c 24 24          	mov    %cl,0x24(%rsp)
   1b294:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1b299:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1b29e:	44 89 44 24 20       	mov    %r8d,0x20(%rsp)
   1b2a3:	4c 89 ff             	mov    %r15,%rdi
   1b2a6:	48 89 de             	mov    %rbx,%rsi
   1b2a9:	48 89 ea             	mov    %rbp,%rdx
   1b2ac:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1b2b1:	4c 89 e1             	mov    %r12,%rcx
   1b2b4:	e8 17 02 00 00       	call   1b4d0 <hyperinterval::ieee::Format::rounded>
   1b2b9:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   1b2be:	0f 84 4e 01 00 00    	je     1b412 <hyperinterval::ieee::Format::power+0x382>
   1b2c4:	48 89 de             	mov    %rbx,%rsi
   1b2c7:	49 89 ee             	mov    %rbp,%r14
   1b2ca:	44 89 ed             	mov    %r13d,%ebp
   1b2cd:	4c 89 ff             	mov    %r15,%rdi
   1b2d0:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1b2d5:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1b2da:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1b2e1:	00 
   1b2e2:	4c 8b 54 24 78       	mov    0x78(%rsp),%r10
   1b2e7:	4c 8b 7c 24 70       	mov    0x70(%rsp),%r15
   1b2ec:	ba 02 00 00 00       	mov    $0x2,%edx
   1b2f1:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
   1b2f5:	d1 eb                	shr    $1,%ebx
   1b2f7:	0f 84 6c 01 00 00    	je     1b469 <hyperinterval::ieee::Format::power+0x3d9>
   1b2fd:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
   1b301:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   1b306:	4c 89 c0             	mov    %r8,%rax
   1b309:	4c 21 f0             	and    %r14,%rax
   1b30c:	44 89 d1             	mov    %r10d,%ecx
   1b30f:	48 d3 e8             	shr    %cl,%rax
   1b312:	4d 21 f8             	and    %r15,%r8
   1b315:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
   1b318:	48 85 c0             	test   %rax,%rax
   1b31b:	49 0f 45 c1          	cmovne %r9,%rax
   1b31f:	0f 44 ca             	cmove  %edx,%ecx
   1b322:	4c 09 c0             	or     %r8,%rax
   1b325:	48 f7 e0             	mul    %rax
   1b328:	29 e9                	sub    %ebp,%ecx
   1b32a:	c6 44 24 24 00       	movb   $0x0,0x24(%rsp)
   1b32f:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1b334:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1b339:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   1b33d:	4c 89 f2             	mov    %r14,%rdx
   1b340:	4c 89 e1             	mov    %r12,%rcx
   1b343:	41 89 ed             	mov    %ebp,%r13d
   1b346:	4d 89 cc             	mov    %r9,%r12
   1b349:	4c 89 fb             	mov    %r15,%rbx
   1b34c:	49 89 f7             	mov    %rsi,%r15
   1b34f:	4c 89 f5             	mov    %r14,%rbp
   1b352:	4d 89 d6             	mov    %r10,%r14
   1b355:	e8 76 01 00 00       	call   1b4d0 <hyperinterval::ieee::Format::rounded>
   1b35a:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   1b35f:	0f 85 ad 00 00 00    	jne    1b412 <hyperinterval::ieee::Format::power+0x382>
   1b365:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
   1b36a:	48 89 d0             	mov    %rdx,%rax
   1b36d:	48 21 e8             	and    %rbp,%rax
   1b370:	44 89 f1             	mov    %r14d,%ecx
   1b373:	48 d3 e8             	shr    %cl,%rax
   1b376:	48 21 da             	and    %rbx,%rdx
   1b379:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
   1b37c:	48 85 c0             	test   %rax,%rax
   1b37f:	49 0f 45 c4          	cmovne %r12,%rax
   1b383:	be 02 00 00 00       	mov    $0x2,%esi
   1b388:	0f 44 ce             	cmove  %esi,%ecx
   1b38b:	48 09 d0             	or     %rdx,%rax
   1b38e:	48 f7 e0             	mul    %rax
   1b391:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
   1b396:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   1b39b:	44 29 e9             	sub    %r13d,%ecx
   1b39e:	c6 44 24 24 00       	movb   $0x0,0x24(%rsp)
   1b3a3:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1b3a8:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1b3ad:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   1b3b1:	48 8d 5c 24 30       	lea    0x30(%rsp),%rbx
   1b3b6:	48 89 df             	mov    %rbx,%rdi
   1b3b9:	4c 89 fe             	mov    %r15,%rsi
   1b3bc:	48 89 ea             	mov    %rbp,%rdx
   1b3bf:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1b3c4:	4c 89 e1             	mov    %r12,%rcx
   1b3c7:	e8 04 01 00 00       	call   1b4d0 <hyperinterval::ieee::Format::rounded>
   1b3cc:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   1b3d1:	ba 02 00 00 00       	mov    $0x2,%edx
   1b3d6:	74 3a                	je     1b412 <hyperinterval::ieee::Format::power+0x382>
   1b3d8:	4c 89 fe             	mov    %r15,%rsi
   1b3db:	49 89 ee             	mov    %rbp,%r14
   1b3de:	44 89 ed             	mov    %r13d,%ebp
   1b3e1:	48 89 df             	mov    %rbx,%rdi
   1b3e4:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1b3e9:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1b3ee:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1b3f5:	00 
   1b3f6:	4c 8b 54 24 78       	mov    0x78(%rsp),%r10
   1b3fb:	4c 8b 7c 24 70       	mov    0x70(%rsp),%r15
   1b400:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
   1b404:	f6 c3 01             	test   $0x1,%bl
   1b407:	0f 85 53 fd ff ff    	jne    1b160 <hyperinterval::ieee::Format::power+0xd0>
   1b40d:	e9 e3 fe ff ff       	jmp    1b2f5 <hyperinterval::ieee::Format::power+0x265>
   1b412:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   1b417:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
   1b41c:	88 47 01             	mov    %al,0x1(%rdi)
   1b41f:	b0 01                	mov    $0x1,%al
   1b421:	eb 2f                	jmp    1b452 <hyperinterval::ieee::Format::power+0x3c2>
   1b423:	48 89 d9             	mov    %rbx,%rcx
   1b426:	45 20 c1             	and    %r8b,%r9b
   1b429:	74 1d                	je     1b448 <hyperinterval::ieee::Format::power+0x3b8>
   1b42b:	48 89 d8             	mov    %rbx,%rax
   1b42e:	48 31 f0             	xor    %rsi,%rax
   1b431:	48 85 db             	test   %rbx,%rbx
   1b434:	48 0f 44 c3          	cmove  %rbx,%rax
   1b438:	48 31 ce             	xor    %rcx,%rsi
   1b43b:	48 85 c9             	test   %rcx,%rcx
   1b43e:	48 0f 44 f1          	cmove  %rcx,%rsi
   1b442:	48 89 c1             	mov    %rax,%rcx
   1b445:	48 89 f3             	mov    %rsi,%rbx
   1b448:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1b44c:	48 89 5f 10          	mov    %rbx,0x10(%rdi)
   1b450:	31 c0                	xor    %eax,%eax
   1b452:	88 07                	mov    %al,(%rdi)
   1b454:	48 89 f8             	mov    %rdi,%rax
   1b457:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
   1b45e:	5b                   	pop    %rbx
   1b45f:	41 5c                	pop    %r12
   1b461:	41 5d                	pop    %r13
   1b463:	41 5e                	pop    %r14
   1b465:	41 5f                	pop    %r15
   1b467:	5d                   	pop    %rbp
   1b468:	c3                   	ret
   1b469:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
   1b46e:	44 8b 44 24 68       	mov    0x68(%rsp),%r8d
   1b473:	44 0f b6 4c 24 03    	movzbl 0x3(%rsp),%r9d
   1b479:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
   1b47e:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b483:	45 20 c1             	and    %r8b,%r9b
   1b486:	75 a3                	jne    1b42b <hyperinterval::ieee::Format::power+0x39b>
   1b488:	eb be                	jmp    1b448 <hyperinterval::ieee::Format::power+0x3b8>
   1b48a:	cc                   	int3
   1b48b:	cc                   	int3
   1b48c:	cc                   	int3
   1b48d:	cc                   	int3
   1b48e:	cc                   	int3
   1b48f:	cc                   	int3

hyperinterval::ieee::Format::finite:
   1b490:	48 89 f8             	mov    %rdi,%rax
   1b493:	48 89 cf             	mov    %rcx,%rdi
   1b496:	48 f7 d7             	not    %rdi
   1b499:	48 85 fa             	test   %rdi,%rdx
   1b49c:	75 09                	jne    1b4a7 <hyperinterval::ieee::Format::finite+0x17>
   1b49e:	c6 40 01 00          	movb   $0x0,0x1(%rax)
   1b4a2:	b1 01                	mov    $0x1,%cl
   1b4a4:	88 08                	mov    %cl,(%rax)
   1b4a6:	c3                   	ret
   1b4a7:	48 ff ce             	dec    %rsi
   1b4aa:	48 85 f1             	test   %rsi,%rcx
   1b4ad:	74 09                	je     1b4b8 <hyperinterval::ieee::Format::finite+0x28>
   1b4af:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1b4b3:	31 c9                	xor    %ecx,%ecx
   1b4b5:	88 08                	mov    %cl,(%rax)
   1b4b7:	c3                   	ret
   1b4b8:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
   1b4bf:	00 
   1b4c0:	31 c9                	xor    %ecx,%ecx
   1b4c2:	88 08                	mov    %cl,(%rax)
   1b4c4:	c3                   	ret
   1b4c5:	cc                   	int3
   1b4c6:	cc                   	int3
   1b4c7:	cc                   	int3
   1b4c8:	cc                   	int3
   1b4c9:	cc                   	int3
   1b4ca:	cc                   	int3
   1b4cb:	cc                   	int3
   1b4cc:	cc                   	int3
   1b4cd:	cc                   	int3
   1b4ce:	cc                   	int3
   1b4cf:	cc                   	int3

hyperinterval::ieee::Format::rounded:
   1b4d0:	48 89 c8             	mov    %rcx,%rax
   1b4d3:	4c 8b 11             	mov    (%rcx),%r10
   1b4d6:	4c 8b 59 08          	mov    0x8(%rcx),%r11
   1b4da:	4c 89 d1             	mov    %r10,%rcx
   1b4dd:	4c 09 d9             	or     %r11,%rcx
   1b4e0:	74 79                	je     1b55b <hyperinterval::ieee::Format::rounded+0x8b>
   1b4e2:	55                   	push   %rbp
   1b4e3:	41 57                	push   %r15
   1b4e5:	41 56                	push   %r14
   1b4e7:	41 55                	push   %r13
   1b4e9:	41 54                	push   %r12
   1b4eb:	53                   	push   %rbx
   1b4ec:	8b 68 10             	mov    0x10(%rax),%ebp
   1b4ef:	49 0f bd cb          	bsr    %r11,%rcx
   1b4f3:	83 f1 3f             	xor    $0x3f,%ecx
   1b4f6:	4d 0f bd f2          	bsr    %r10,%r14
   1b4fa:	41 83 f6 3f          	xor    $0x3f,%r14d
   1b4fe:	41 83 ce 40          	or     $0x40,%r14d
   1b502:	4d 85 db             	test   %r11,%r11
   1b505:	44 0f 45 f1          	cmovne %ecx,%r14d
   1b509:	bb 40 00 00 00       	mov    $0x40,%ebx
   1b50e:	f3 48 0f bc da       	tzcnt  %rdx,%rbx
   1b513:	41 89 d8             	mov    %ebx,%r8d
   1b516:	41 83 e0 3f          	and    $0x3f,%r8d
   1b51a:	44 89 c1             	mov    %r8d,%ecx
   1b51d:	48 d3 ea             	shr    %cl,%rdx
   1b520:	41 83 f6 7f          	xor    $0x7f,%r14d
   1b524:	41 01 ee             	add    %ebp,%r14d
   1b527:	48 d1 ea             	shr    $1,%rdx
   1b52a:	41 39 d6             	cmp    %edx,%r14d
   1b52d:	0f 8f 54 01 00 00    	jg     1b687 <hyperinterval::ieee::Format::rounded+0x1b7>
   1b533:	44 8d 2c 13          	lea    (%rbx,%rdx,1),%r13d
   1b537:	b9 01 00 00 00       	mov    $0x1,%ecx
   1b53c:	44 29 e9             	sub    %r13d,%ecx
   1b53f:	41 29 de             	sub    %ebx,%r14d
   1b542:	41 39 ce             	cmp    %ecx,%r14d
   1b545:	44 0f 4e f1          	cmovle %ecx,%r14d
   1b549:	44 89 f1             	mov    %r14d,%ecx
   1b54c:	29 e9                	sub    %ebp,%ecx
   1b54e:	83 f9 7f             	cmp    $0x7f,%ecx
   1b551:	7e 13                	jle    1b566 <hyperinterval::ieee::Format::rounded+0x96>
   1b553:	41 b4 01             	mov    $0x1,%r12b
   1b556:	e9 ea 00 00 00       	jmp    1b645 <hyperinterval::ieee::Format::rounded+0x175>
   1b55b:	c6 07 00             	movb   $0x0,(%rdi)
   1b55e:	0f 57 c0             	xorps  %xmm0,%xmm0
   1b561:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1b565:	c3                   	ret
   1b566:	85 c9                	test   %ecx,%ecx
   1b568:	4c 89 6c 24 f0       	mov    %r13,-0x10(%rsp)
   1b56d:	0f 8e ad 00 00 00    	jle    1b620 <hyperinterval::ieee::Format::rounded+0x150>
   1b573:	4d 89 d7             	mov    %r10,%r15
   1b576:	4d 0f ad df          	shrd   %cl,%r11,%r15
   1b57a:	4d 89 dd             	mov    %r11,%r13
   1b57d:	49 d3 ed             	shr    %cl,%r13
   1b580:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
   1b587:	49 d3 e4             	shl    %cl,%r12
   1b58a:	48 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%rbp
   1b591:	45 31 c9             	xor    %r9d,%r9d
   1b594:	f6 c1 40             	test   $0x40,%cl
   1b597:	4d 0f 45 fd          	cmovne %r13,%r15
   1b59b:	4d 0f 45 e9          	cmovne %r9,%r13
   1b59f:	49 0f 45 ec          	cmovne %r12,%rbp
   1b5a3:	4d 0f 45 e1          	cmovne %r9,%r12
   1b5a7:	49 f7 d4             	not    %r12
   1b5aa:	48 f7 d5             	not    %rbp
   1b5ad:	4c 21 dd             	and    %r11,%rbp
   1b5b0:	4d 21 d4             	and    %r10,%r12
   1b5b3:	49 09 ec             	or     %rbp,%r12
   1b5b6:	41 0f 95 c4          	setne  %r12b
   1b5ba:	4d 89 eb             	mov    %r13,%r11
   1b5bd:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1b5c2:	4c 89 f9             	mov    %r15,%rcx
   1b5c5:	4c 09 d9             	or     %r11,%rcx
   1b5c8:	74 7b                	je     1b645 <hyperinterval::ieee::Format::rounded+0x175>
   1b5ca:	49 0f bd cb          	bsr    %r11,%rcx
   1b5ce:	83 f1 3f             	xor    $0x3f,%ecx
   1b5d1:	4d 0f bd ef          	bsr    %r15,%r13
   1b5d5:	41 83 f5 3f          	xor    $0x3f,%r13d
   1b5d9:	41 83 cd 40          	or     $0x40,%r13d
   1b5dd:	4d 85 db             	test   %r11,%r11
   1b5e0:	44 0f 45 e9          	cmovne %ecx,%r13d
   1b5e4:	41 83 f5 7f          	xor    $0x7f,%r13d
   1b5e8:	43 8d 2c 2e          	lea    (%r14,%r13,1),%ebp
   1b5ec:	39 d5                	cmp    %edx,%ebp
   1b5ee:	0f 8f 93 00 00 00    	jg     1b687 <hyperinterval::ieee::Format::rounded+0x1b7>
   1b5f4:	b9 01 00 00 00       	mov    $0x1,%ecx
   1b5f9:	29 d1                	sub    %edx,%ecx
   1b5fb:	39 cd                	cmp    %ecx,%ebp
   1b5fd:	0f 8d 53 01 00 00    	jge    1b756 <hyperinterval::ieee::Format::rounded+0x286>
   1b603:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1b608:	43 8d 0c 2e          	lea    (%r14,%r13,1),%ecx
   1b60c:	fe c9                	dec    %cl
   1b60e:	4d 89 f9             	mov    %r15,%r9
   1b611:	49 d3 e1             	shl    %cl,%r9
   1b614:	45 31 d2             	xor    %r10d,%r10d
   1b617:	f6 c1 40             	test   $0x40,%cl
   1b61a:	4d 0f 44 d1          	cmove  %r9,%r10
   1b61e:	eb 2e                	jmp    1b64e <hyperinterval::ieee::Format::rounded+0x17e>
   1b620:	f6 d9                	neg    %cl
   1b622:	4d 0f a5 d3          	shld   %cl,%r10,%r11
   1b626:	49 d3 e2             	shl    %cl,%r10
   1b629:	45 31 e4             	xor    %r12d,%r12d
   1b62c:	f6 c1 40             	test   $0x40,%cl
   1b62f:	4d 0f 45 da          	cmovne %r10,%r11
   1b633:	41 bf 00 00 00 00    	mov    $0x0,%r15d
   1b639:	4d 0f 44 fa          	cmove  %r10,%r15
   1b63d:	4c 89 f9             	mov    %r15,%rcx
   1b640:	4c 09 d9             	or     %r11,%rcx
   1b643:	75 85                	jne    1b5ca <hyperinterval::ieee::Format::rounded+0xfa>
   1b645:	45 31 ff             	xor    %r15d,%r15d
   1b648:	45 31 db             	xor    %r11d,%r11d
   1b64b:	45 31 d2             	xor    %r10d,%r10d
   1b64e:	45 0f b6 e4          	movzbl %r12b,%r12d
   1b652:	4d 01 fc             	add    %r15,%r12
   1b655:	49 83 d3 00          	adc    $0x0,%r11
   1b659:	4c 89 e1             	mov    %r12,%rcx
   1b65c:	4c 09 d9             	or     %r11,%rcx
   1b65f:	74 30                	je     1b691 <hyperinterval::ieee::Format::rounded+0x1c1>
   1b661:	49 0f bd cb          	bsr    %r11,%rcx
   1b665:	83 f1 3f             	xor    $0x3f,%ecx
   1b668:	4d 0f bd fc          	bsr    %r12,%r15
   1b66c:	41 83 f7 3f          	xor    $0x3f,%r15d
   1b670:	41 83 cf 40          	or     $0x40,%r15d
   1b674:	4d 85 db             	test   %r11,%r11
   1b677:	44 0f 45 f9          	cmovne %ecx,%r15d
   1b67b:	41 83 f7 7f          	xor    $0x7f,%r15d
   1b67f:	43 8d 2c 37          	lea    (%r15,%r14,1),%ebp
   1b683:	39 d5                	cmp    %edx,%ebp
   1b685:	7e 1b                	jle    1b6a2 <hyperinterval::ieee::Format::rounded+0x1d2>
   1b687:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   1b68c:	e9 ba 00 00 00       	jmp    1b74b <hyperinterval::ieee::Format::rounded+0x27b>
   1b691:	31 d2                	xor    %edx,%edx
   1b693:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1b697:	0f 84 86 00 00 00    	je     1b723 <hyperinterval::ieee::Format::rounded+0x253>
   1b69d:	e9 9e 00 00 00       	jmp    1b740 <hyperinterval::ieee::Format::rounded+0x270>
   1b6a2:	b9 01 00 00 00       	mov    $0x1,%ecx
   1b6a7:	29 d1                	sub    %edx,%ecx
   1b6a9:	39 cd                	cmp    %ecx,%ebp
   1b6ab:	7d 1e                	jge    1b6cb <hyperinterval::ieee::Format::rounded+0x1fb>
   1b6ad:	45 01 f5             	add    %r14d,%r13d
   1b6b0:	41 fe cd             	dec    %r13b
   1b6b3:	44 89 e9             	mov    %r13d,%ecx
   1b6b6:	49 d3 e4             	shl    %cl,%r12
   1b6b9:	31 d2                	xor    %edx,%edx
   1b6bb:	41 f6 c5 40          	test   $0x40,%r13b
   1b6bf:	49 0f 44 d4          	cmove  %r12,%rdx
   1b6c3:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1b6c7:	74 5a                	je     1b723 <hyperinterval::ieee::Format::rounded+0x253>
   1b6c9:	eb 75                	jmp    1b740 <hyperinterval::ieee::Format::rounded+0x270>
   1b6cb:	89 d9                	mov    %ebx,%ecx
   1b6cd:	44 29 f9             	sub    %r15d,%ecx
   1b6d0:	41 89 c9             	mov    %ecx,%r9d
   1b6d3:	41 f7 d9             	neg    %r9d
   1b6d6:	4d 89 e6             	mov    %r12,%r14
   1b6d9:	49 d3 e6             	shl    %cl,%r14
   1b6dc:	45 31 ed             	xor    %r13d,%r13d
   1b6df:	f6 c1 40             	test   $0x40,%cl
   1b6e2:	4d 0f 44 ee          	cmove  %r14,%r13
   1b6e6:	44 89 c9             	mov    %r9d,%ecx
   1b6e9:	4d 0f ad dc          	shrd   %cl,%r11,%r12
   1b6ed:	49 d3 eb             	shr    %cl,%r11
   1b6f0:	41 f6 c1 40          	test   $0x40,%r9b
   1b6f4:	4d 0f 44 dc          	cmove  %r12,%r11
   1b6f8:	44 39 fb             	cmp    %r15d,%ebx
   1b6fb:	4d 0f 43 dd          	cmovae %r13,%r11
   1b6ff:	01 d5                	add    %edx,%ebp
   1b701:	4c 63 cd             	movslq %ebp,%r9
   1b704:	44 89 c1             	mov    %r8d,%ecx
   1b707:	49 d3 e1             	shl    %cl,%r9
   1b70a:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
   1b711:	48 d3 e2             	shl    %cl,%rdx
   1b714:	48 f7 d2             	not    %rdx
   1b717:	4c 21 da             	and    %r11,%rdx
   1b71a:	4c 09 ca             	or     %r9,%rdx
   1b71d:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1b721:	75 1d                	jne    1b740 <hyperinterval::ieee::Format::rounded+0x270>
   1b723:	48 89 d0             	mov    %rdx,%rax
   1b726:	48 31 f0             	xor    %rsi,%rax
   1b729:	48 85 d2             	test   %rdx,%rdx
   1b72c:	48 0f 44 c2          	cmove  %rdx,%rax
   1b730:	4c 31 d6             	xor    %r10,%rsi
   1b733:	4d 85 d2             	test   %r10,%r10
   1b736:	49 0f 44 f2          	cmove  %r10,%rsi
   1b73a:	49 89 c2             	mov    %rax,%r10
   1b73d:	48 89 f2             	mov    %rsi,%rdx
   1b740:	4c 89 57 08          	mov    %r10,0x8(%rdi)
   1b744:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   1b748:	c6 07 00             	movb   $0x0,(%rdi)
   1b74b:	5b                   	pop    %rbx
   1b74c:	41 5c                	pop    %r12
   1b74e:	41 5d                	pop    %r13
   1b750:	41 5e                	pop    %r14
   1b752:	41 5f                	pop    %r15
   1b754:	5d                   	pop    %rbp
   1b755:	c3                   	ret
   1b756:	89 d9                	mov    %ebx,%ecx
   1b758:	44 29 e9             	sub    %r13d,%ecx
   1b75b:	4d 89 f9             	mov    %r15,%r9
   1b75e:	49 d3 e1             	shl    %cl,%r9
   1b761:	41 89 ca             	mov    %ecx,%r10d
   1b764:	41 f7 da             	neg    %r10d
   1b767:	48 c7 44 24 e8 00 00 	movq   $0x0,-0x18(%rsp)
   1b76e:	00 00 
   1b770:	f6 c1 40             	test   $0x40,%cl
   1b773:	48 8b 4c 24 e8       	mov    -0x18(%rsp),%rcx
   1b778:	49 0f 44 c9          	cmove  %r9,%rcx
   1b77c:	48 89 4c 24 e8       	mov    %rcx,-0x18(%rsp)
   1b781:	4d 89 f9             	mov    %r15,%r9
   1b784:	44 89 d1             	mov    %r10d,%ecx
   1b787:	4d 0f ad d9          	shrd   %cl,%r11,%r9
   1b78b:	4c 89 4c 24 f8       	mov    %r9,-0x8(%rsp)
   1b790:	4d 89 d9             	mov    %r11,%r9
   1b793:	49 d3 e9             	shr    %cl,%r9
   1b796:	41 f6 c2 40          	test   $0x40,%r10b
   1b79a:	4c 0f 44 4c 24 f8    	cmove  -0x8(%rsp),%r9
   1b7a0:	44 39 eb             	cmp    %r13d,%ebx
   1b7a3:	4c 0f 43 4c 24 e8    	cmovae -0x18(%rsp),%r9
   1b7a9:	01 d5                	add    %edx,%ebp
   1b7ab:	4c 63 ed             	movslq %ebp,%r13
   1b7ae:	44 89 c1             	mov    %r8d,%ecx
   1b7b1:	49 d3 e5             	shl    %cl,%r13
   1b7b4:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
   1b7bb:	49 d3 e2             	shl    %cl,%r10
   1b7be:	49 f7 d2             	not    %r10
   1b7c1:	4d 21 ca             	and    %r9,%r10
   1b7c4:	4d 09 ea             	or     %r13,%r10
   1b7c7:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1b7cc:	e9 7d fe ff ff       	jmp    1b64e <hyperinterval::ieee::Format::rounded+0x17e>
   1b7d1:	cc                   	int3
   1b7d2:	cc                   	int3
   1b7d3:	cc                   	int3
   1b7d4:	cc                   	int3
   1b7d5:	cc                   	int3
   1b7d6:	cc                   	int3
   1b7d7:	cc                   	int3
   1b7d8:	cc                   	int3
   1b7d9:	cc                   	int3
   1b7da:	cc                   	int3
   1b7db:	cc                   	int3
   1b7dc:	cc                   	int3
   1b7dd:	cc                   	int3
   1b7de:	cc                   	int3
   1b7df:	cc                   	int3

__udivti3:
   5a220:	49 89 d0             	mov    %rdx,%r8
   5a223:	48 85 c9             	test   %rcx,%rcx
   5a226:	74 71                	je     5a299 <__udivti3+0x79>
   5a228:	4c 0f bd c9          	bsr    %rcx,%r9
   5a22c:	44 89 ca             	mov    %r9d,%edx
   5a22f:	83 f2 3f             	xor    $0x3f,%edx
   5a232:	b0 40                	mov    $0x40,%al
   5a234:	28 d0                	sub    %dl,%al
   5a236:	4c 89 c2             	mov    %r8,%rdx
   5a239:	49 89 cb             	mov    %rcx,%r11
   5a23c:	89 c1                	mov    %eax,%ecx
   5a23e:	4c 0f ad da          	shrd   %cl,%r11,%rdx
   5a242:	4d 89 da             	mov    %r11,%r10
   5a245:	49 d3 ea             	shr    %cl,%r10
   5a248:	a8 40                	test   $0x40,%al
   5a24a:	4c 0f 44 d2          	cmove  %rdx,%r10
   5a24e:	48 89 f0             	mov    %rsi,%rax
   5a251:	48 0f a4 f8 3f       	shld   $0x3f,%rdi,%rax
   5a256:	48 89 f2             	mov    %rsi,%rdx
   5a259:	48 d1 ea             	shr    $1,%rdx
   5a25c:	49 f7 f2             	div    %r10
   5a25f:	49 89 c2             	mov    %rax,%r10
   5a262:	44 89 c9             	mov    %r9d,%ecx
   5a265:	49 d3 ea             	shr    %cl,%r10
   5a268:	49 83 fa 01          	cmp    $0x1,%r10
   5a26c:	49 83 d2 ff          	adc    $0xffffffffffffffff,%r10
   5a270:	4d 89 d9             	mov    %r11,%r9
   5a273:	4d 0f af ca          	imul   %r10,%r9
   5a277:	4c 89 c0             	mov    %r8,%rax
   5a27a:	49 f7 e2             	mul    %r10
   5a27d:	48 89 c1             	mov    %rax,%rcx
   5a280:	4c 89 d0             	mov    %r10,%rax
   5a283:	4c 01 ca             	add    %r9,%rdx
   5a286:	48 29 cf             	sub    %rcx,%rdi
   5a289:	48 19 d6             	sbb    %rdx,%rsi
   5a28c:	4c 39 c7             	cmp    %r8,%rdi
   5a28f:	4c 19 de             	sbb    %r11,%rsi
   5a292:	48 83 d8 ff          	sbb    $0xffffffffffffffff,%rax
   5a296:	31 d2                	xor    %edx,%edx
   5a298:	c3                   	ret
   5a299:	4c 39 c6             	cmp    %r8,%rsi
   5a29c:	73 0c                	jae    5a2aa <__udivti3+0x8a>
   5a29e:	48 89 f8             	mov    %rdi,%rax
   5a2a1:	48 89 f2             	mov    %rsi,%rdx
   5a2a4:	49 f7 f0             	div    %r8
   5a2a7:	31 d2                	xor    %edx,%edx
   5a2a9:	c3                   	ret
   5a2aa:	48 89 f0             	mov    %rsi,%rax
   5a2ad:	4c 09 c0             	or     %r8,%rax
   5a2b0:	48 c1 e8 20          	shr    $0x20,%rax
   5a2b4:	74 15                	je     5a2cb <__udivti3+0xab>
   5a2b6:	48 89 f0             	mov    %rsi,%rax
   5a2b9:	31 d2                	xor    %edx,%edx
   5a2bb:	49 f7 f0             	div    %r8
   5a2be:	48 89 c1             	mov    %rax,%rcx
   5a2c1:	48 89 f8             	mov    %rdi,%rax
   5a2c4:	49 f7 f0             	div    %r8
   5a2c7:	48 89 ca             	mov    %rcx,%rdx
   5a2ca:	c3                   	ret
   5a2cb:	89 f0                	mov    %esi,%eax
   5a2cd:	31 d2                	xor    %edx,%edx
   5a2cf:	41 f7 f0             	div    %r8d
   5a2d2:	89 c1                	mov    %eax,%ecx
   5a2d4:	48 89 f8             	mov    %rdi,%rax
   5a2d7:	49 f7 f0             	div    %r8
   5a2da:	48 89 ca             	mov    %rcx,%rdx
   5a2dd:	c3                   	ret

Disassembly of section .init:
