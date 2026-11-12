hyperinterval_strict_chain64:
    8ae0:	53                   	push   %rbx
    8ae1:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
    8ae8:	48 89 fb             	mov    %rdi,%rbx
    8aeb:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    8af0:	ff 15 3a 5b 05 00    	call   *0x55b3a(%rip)        # 5e630 <_GLOBAL_OFFSET_TABLE_+0x40>
    8af6:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    8afb:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
    8b00:	48 83 f9 02          	cmp    $0x2,%rcx
    8b04:	0f 84 32 01 00 00    	je     8c3c <hyperinterval_strict_chain64+0x15c>
    8b0a:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
    8b0f:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
    8b14:	48 89 b4 24 a8 00 00 	mov    %rsi,0xa8(%rsp)
    8b1b:	00 
    8b1c:	48 89 94 24 a1 00 00 	mov    %rdx,0xa1(%rsp)
    8b23:	00 
    8b24:	48 89 8c 24 98 00 00 	mov    %rcx,0x98(%rsp)
    8b2b:	00 
    8b2c:	88 84 24 a0 00 00 00 	mov    %al,0xa0(%rsp)
    8b33:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
    8b38:	48 8d b4 24 98 00 00 	lea    0x98(%rsp),%rsi
    8b3f:	00 
    8b40:	f2 0f 10 05 b8 34 04 	movsd  0x434b8(%rip),%xmm0        # 4c000 <_fini+0x84>
    8b47:	00 
    8b48:	f2 0f 10 0d b8 34 04 	movsd  0x434b8(%rip),%xmm1        # 4c008 <_fini+0x8c>
    8b4f:	00 
    8b50:	ff 15 42 63 05 00    	call   *0x56342(%rip)        # 5ee98 <_GLOBAL_OFFSET_TABLE_+0x8a8>
    8b56:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    8b5b:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
    8b60:	48 83 f9 02          	cmp    $0x2,%rcx
    8b64:	0f 84 d2 00 00 00    	je     8c3c <hyperinterval_strict_chain64+0x15c>
    8b6a:	48 8b 54 24 29       	mov    0x29(%rsp),%rdx
    8b6f:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
    8b74:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
    8b7b:	00 
    8b7c:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
    8b83:	00 
    8b84:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
    8b8b:	00 
    8b8c:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
    8b93:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
    8b98:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
    8b9f:	00 
    8ba0:	ff 15 5a 5f 05 00    	call   *0x55f5a(%rip)        # 5eb00 <_GLOBAL_OFFSET_TABLE_+0x510>
    8ba6:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
    8bab:	0f b6 44 24 70       	movzbl 0x70(%rsp),%eax
    8bb0:	48 83 f9 02          	cmp    $0x2,%rcx
    8bb4:	0f 84 82 00 00 00    	je     8c3c <hyperinterval_strict_chain64+0x15c>
    8bba:	48 8b 54 24 71       	mov    0x71(%rsp),%rdx
    8bbf:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
    8bc4:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
    8bc9:	48 89 54 24 59       	mov    %rdx,0x59(%rsp)
    8bce:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
    8bd3:	88 44 24 58          	mov    %al,0x58(%rsp)
    8bd7:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    8bdc:	f2 0f 10 05 2c 34 04 	movsd  0x4342c(%rip),%xmm0        # 4c010 <_fini+0x94>
    8be3:	00 
    8be4:	ff 15 26 63 05 00    	call   *0x56326(%rip)        # 5ef10 <_GLOBAL_OFFSET_TABLE_+0x920>
    8bea:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    8bef:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
    8bf4:	48 83 f9 02          	cmp    $0x2,%rcx
    8bf8:	74 42                	je     8c3c <hyperinterval_strict_chain64+0x15c>
    8bfa:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
    8bff:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
    8c04:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
    8c09:	48 89 54 24 29       	mov    %rdx,0x29(%rsp)
    8c0e:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
    8c13:	88 44 24 28          	mov    %al,0x28(%rsp)
    8c17:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
    8c1c:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
    8c21:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
    8c26:	ff 15 5c 60 05 00    	call   *0x5605c(%rip)        # 5ec88 <_GLOBAL_OFFSET_TABLE_+0x698>
    8c2c:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
    8c31:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
    8c36:	48 83 f9 02          	cmp    $0x2,%rcx
    8c3a:	75 16                	jne    8c52 <hyperinterval_strict_chain64+0x172>
    8c3c:	88 43 08             	mov    %al,0x8(%rbx)
    8c3f:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    8c46:	48 89 d8             	mov    %rbx,%rax
    8c49:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
    8c50:	5b                   	pop    %rbx
    8c51:	c3                   	ret
    8c52:	48 8b 54 24 41       	mov    0x41(%rsp),%rdx
    8c57:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
    8c5c:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
    8c61:	48 89 54 24 11       	mov    %rdx,0x11(%rsp)
    8c66:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    8c6b:	88 44 24 10          	mov    %al,0x10(%rsp)
    8c6f:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
    8c74:	48 89 df             	mov    %rbx,%rdi
    8c77:	ff 15 43 5b 05 00    	call   *0x55b43(%rip)        # 5e7c0 <_GLOBAL_OFFSET_TABLE_+0x1d0>
    8c7d:	48 89 d8             	mov    %rbx,%rax
    8c80:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
    8c87:	5b                   	pop    %rbx
    8c88:	c3                   	ret
    8c89:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

hyperinterval_strict_chain32:
    8c90:	53                   	push   %rbx
    8c91:	48 83 ec 60          	sub    $0x60,%rsp
    8c95:	48 89 fb             	mov    %rdi,%rbx
    8c98:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
    8c9d:	ff 15 ed 62 05 00    	call   *0x562ed(%rip)        # 5ef90 <_GLOBAL_OFFSET_TABLE_+0x9a0>
    8ca3:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
    8ca7:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
    8cac:	83 f9 02             	cmp    $0x2,%ecx
    8caf:	0f 84 f4 00 00 00    	je     8da9 <hyperinterval_strict_chain32+0x119>
    8cb5:	8b 54 24 11          	mov    0x11(%rsp),%edx
    8cb9:	8b 74 24 14          	mov    0x14(%rsp),%esi
    8cbd:	89 74 24 5c          	mov    %esi,0x5c(%rsp)
    8cc1:	89 54 24 59          	mov    %edx,0x59(%rsp)
    8cc5:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
    8cc9:	88 44 24 58          	mov    %al,0x58(%rsp)
    8ccd:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
    8cd2:	48 8d 74 24 54       	lea    0x54(%rsp),%rsi
    8cd7:	f3 0f 10 05 51 35 04 	movss  0x43551(%rip),%xmm0        # 4c230 <_fini+0x2b4>
    8cde:	00 
    8cdf:	f3 0f 10 0d 4d 35 04 	movss  0x4354d(%rip),%xmm1        # 4c234 <_fini+0x2b8>
    8ce6:	00 
    8ce7:	ff 15 83 61 05 00    	call   *0x56183(%rip)        # 5ee70 <_GLOBAL_OFFSET_TABLE_+0x880>
    8ced:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
    8cf1:	0f b6 44 24 1c       	movzbl 0x1c(%rsp),%eax
    8cf6:	83 f9 02             	cmp    $0x2,%ecx
    8cf9:	0f 84 aa 00 00 00    	je     8da9 <hyperinterval_strict_chain32+0x119>
    8cff:	8b 54 24 1d          	mov    0x1d(%rsp),%edx
    8d03:	8b 74 24 20          	mov    0x20(%rsp),%esi
    8d07:	89 74 24 50          	mov    %esi,0x50(%rsp)
    8d0b:	89 54 24 4d          	mov    %edx,0x4d(%rsp)
    8d0f:	89 4c 24 48          	mov    %ecx,0x48(%rsp)
    8d13:	88 44 24 4c          	mov    %al,0x4c(%rsp)
    8d17:	48 8d 7c 24 3c       	lea    0x3c(%rsp),%rdi
    8d1c:	48 8d 74 24 48       	lea    0x48(%rsp),%rsi
    8d21:	ff 15 91 61 05 00    	call   *0x56191(%rip)        # 5eeb8 <_GLOBAL_OFFSET_TABLE_+0x8c8>
    8d27:	8b 4c 24 3c          	mov    0x3c(%rsp),%ecx
    8d2b:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
    8d30:	83 f9 02             	cmp    $0x2,%ecx
    8d33:	74 74                	je     8da9 <hyperinterval_strict_chain32+0x119>
    8d35:	8b 54 24 41          	mov    0x41(%rsp),%edx
    8d39:	8b 74 24 44          	mov    0x44(%rsp),%esi
    8d3d:	89 74 24 38          	mov    %esi,0x38(%rsp)
    8d41:	89 54 24 35          	mov    %edx,0x35(%rsp)
    8d45:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
    8d49:	88 44 24 34          	mov    %al,0x34(%rsp)
    8d4d:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
    8d52:	f3 0f 10 05 de 34 04 	movss  0x434de(%rip),%xmm0        # 4c238 <_fini+0x2bc>
    8d59:	00 
    8d5a:	ff 15 48 5c 05 00    	call   *0x55c48(%rip)        # 5e9a8 <_GLOBAL_OFFSET_TABLE_+0x3b8>
    8d60:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
    8d64:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
    8d69:	83 f9 02             	cmp    $0x2,%ecx
    8d6c:	74 3b                	je     8da9 <hyperinterval_strict_chain32+0x119>
    8d6e:	8b 54 24 11          	mov    0x11(%rsp),%edx
    8d72:	8b 74 24 14          	mov    0x14(%rsp),%esi
    8d76:	89 74 24 20          	mov    %esi,0x20(%rsp)
    8d7a:	89 54 24 1d          	mov    %edx,0x1d(%rsp)
    8d7e:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
    8d82:	88 44 24 1c          	mov    %al,0x1c(%rsp)
    8d86:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
    8d8b:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
    8d90:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
    8d95:	ff 15 65 59 05 00    	call   *0x55965(%rip)        # 5e700 <_GLOBAL_OFFSET_TABLE_+0x110>
    8d9b:	8b 4c 24 24          	mov    0x24(%rsp),%ecx
    8d9f:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
    8da4:	83 f9 02             	cmp    $0x2,%ecx
    8da7:	75 12                	jne    8dbb <hyperinterval_strict_chain32+0x12b>
    8da9:	88 43 04             	mov    %al,0x4(%rbx)
    8dac:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    8db2:	48 89 d8             	mov    %rbx,%rax
    8db5:	48 83 c4 60          	add    $0x60,%rsp
    8db9:	5b                   	pop    %rbx
    8dba:	c3                   	ret
    8dbb:	8b 54 24 29          	mov    0x29(%rsp),%edx
    8dbf:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
    8dc3:	89 74 24 14          	mov    %esi,0x14(%rsp)
    8dc7:	89 54 24 11          	mov    %edx,0x11(%rsp)
    8dcb:	89 4c 24 0c          	mov    %ecx,0xc(%rsp)
    8dcf:	88 44 24 10          	mov    %al,0x10(%rsp)
    8dd3:	48 8d 74 24 0c       	lea    0xc(%rsp),%rsi
    8dd8:	48 89 df             	mov    %rbx,%rdi
    8ddb:	ff 15 9f 5e 05 00    	call   *0x55e9f(%rip)        # 5ec80 <_GLOBAL_OFFSET_TABLE_+0x690>
    8de1:	48 89 d8             	mov    %rbx,%rax
    8de4:	48 83 c4 60          	add    $0x60,%rsp
    8de8:	5b                   	pop    %rbx
    8de9:	c3                   	ret
    8dea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

hyperinterval_strict_surface32:
    9560:	55                   	push   %rbp
    9561:	41 57                	push   %r15
    9563:	41 56                	push   %r14
    9565:	41 55                	push   %r13
    9567:	41 54                	push   %r12
    9569:	53                   	push   %rbx
    956a:	48 83 ec 78          	sub    $0x78,%rsp
    956e:	41 89 f6             	mov    %esi,%r14d
    9571:	48 89 fd             	mov    %rdi,%rbp
    9574:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    9579:	66 0f 7e 44 24 34    	movd   %xmm0,0x34(%rsp)
    957f:	66 0f 7e 4c 24 50    	movd   %xmm1,0x50(%rsp)
    9585:	ff 15 05 5a 05 00    	call   *0x55a05(%rip)        # 5ef90 <_GLOBAL_OFFSET_TABLE_+0x9a0>
    958b:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    958f:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
    9594:	83 f9 02             	cmp    $0x2,%ecx
    9597:	75 05                	jne    959e <hyperinterval_strict_surface32+0x3e>
    9599:	88 45 04             	mov    %al,0x4(%rbp)
    959c:	eb 44                	jmp    95e2 <hyperinterval_strict_surface32+0x82>
    959e:	8b 54 24 0d          	mov    0xd(%rsp),%edx
    95a2:	8b 74 24 10          	mov    0x10(%rsp),%esi
    95a6:	89 74 24 40          	mov    %esi,0x40(%rsp)
    95aa:	89 54 24 3d          	mov    %edx,0x3d(%rsp)
    95ae:	89 4c 24 38          	mov    %ecx,0x38(%rsp)
    95b2:	88 44 24 3c          	mov    %al,0x3c(%rsp)
    95b6:	66 0f 6e 44 24 34    	movd   0x34(%rsp),%xmm0
    95bc:	ff 15 9e 58 05 00    	call   *0x5589e(%rip)        # 5ee60 <_GLOBAL_OFFSET_TABLE_+0x870>
    95c2:	48 89 c3             	mov    %rax,%rbx
    95c5:	f6 c3 01             	test   $0x1,%bl
    95c8:	74 05                	je     95cf <hyperinterval_strict_surface32+0x6f>
    95ca:	88 7d 04             	mov    %bh,0x4(%rbp)
    95cd:	eb 13                	jmp    95e2 <hyperinterval_strict_surface32+0x82>
    95cf:	66 0f 6e 44 24 50    	movd   0x50(%rsp),%xmm0
    95d5:	ff 15 2d 53 05 00    	call   *0x5532d(%rip)        # 5e908 <_GLOBAL_OFFSET_TABLE_+0x318>
    95db:	a8 01                	test   $0x1,%al
    95dd:	74 1c                	je     95fb <hyperinterval_strict_surface32+0x9b>
    95df:	88 65 04             	mov    %ah,0x4(%rbp)
    95e2:	c7 45 00 02 00 00 00 	movl   $0x2,0x0(%rbp)
    95e9:	48 89 e8             	mov    %rbp,%rax
    95ec:	48 83 c4 78          	add    $0x78,%rsp
    95f0:	5b                   	pop    %rbx
    95f1:	41 5c                	pop    %r12
    95f3:	41 5d                	pop    %r13
    95f5:	41 5e                	pop    %r14
    95f7:	41 5f                	pop    %r15
    95f9:	5d                   	pop    %rbp
    95fa:	c3                   	ret
    95fb:	48 c1 eb 20          	shr    $0x20,%rbx
    95ff:	66 0f 6e c3          	movd   %ebx,%xmm0
    9603:	48 c1 e8 20          	shr    $0x20,%rax
    9607:	66 0f 6e c8          	movd   %eax,%xmm1
    960b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    9610:	ff 15 7a 59 05 00    	call   *0x5597a(%rip)        # 5ef90 <_GLOBAL_OFFSET_TABLE_+0x9a0>
    9616:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    961a:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
    961f:	83 f9 02             	cmp    $0x2,%ecx
    9622:	0f 84 71 ff ff ff    	je     9599 <hyperinterval_strict_surface32+0x39>
    9628:	8b 54 24 0d          	mov    0xd(%rsp),%edx
    962c:	8b 74 24 10          	mov    0x10(%rsp),%esi
    9630:	89 74 24 5c          	mov    %esi,0x5c(%rsp)
    9634:	89 54 24 59          	mov    %edx,0x59(%rsp)
    9638:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
    963c:	88 44 24 58          	mov    %al,0x58(%rsp)
    9640:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    9645:	48 8d 74 24 38       	lea    0x38(%rsp),%rsi
    964a:	44 89 f2             	mov    %r14d,%edx
    964d:	ff 15 4d 59 05 00    	call   *0x5594d(%rip)        # 5efa0 <_GLOBAL_OFFSET_TABLE_+0x9b0>
    9653:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    9657:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
    965c:	83 f9 02             	cmp    $0x2,%ecx
    965f:	0f 84 34 ff ff ff    	je     9599 <hyperinterval_strict_surface32+0x39>
    9665:	8b 54 24 0d          	mov    0xd(%rsp),%edx
    9669:	8b 74 24 10          	mov    0x10(%rsp),%esi
    966d:	89 74 24 30          	mov    %esi,0x30(%rsp)
    9671:	89 54 24 2d          	mov    %edx,0x2d(%rsp)
    9675:	89 4c 24 28          	mov    %ecx,0x28(%rsp)
    9679:	88 44 24 2c          	mov    %al,0x2c(%rsp)
    967d:	48 8d 7c 24 44       	lea    0x44(%rsp),%rdi
    9682:	48 8d 74 24 28       	lea    0x28(%rsp),%rsi
    9687:	ff 15 33 52 05 00    	call   *0x55233(%rip)        # 5e8c0 <_GLOBAL_OFFSET_TABLE_+0x2d0>
    968d:	8b 4c 24 44          	mov    0x44(%rsp),%ecx
    9691:	0f b6 44 24 48       	movzbl 0x48(%rsp),%eax
    9696:	83 f9 02             	cmp    $0x2,%ecx
    9699:	0f 84 fa fe ff ff    	je     9599 <hyperinterval_strict_surface32+0x39>
    969f:	8b 54 24 49          	mov    0x49(%rsp),%edx
    96a3:	8b 74 24 4c          	mov    0x4c(%rsp),%esi
    96a7:	89 74 24 24          	mov    %esi,0x24(%rsp)
    96ab:	89 54 24 21          	mov    %edx,0x21(%rsp)
    96af:	89 4c 24 1c          	mov    %ecx,0x1c(%rsp)
    96b3:	88 44 24 20          	mov    %al,0x20(%rsp)
    96b7:	48 8d 5c 24 6c       	lea    0x6c(%rsp),%rbx
    96bc:	48 8d 74 24 1c       	lea    0x1c(%rsp),%rsi
    96c1:	48 8d 54 24 54       	lea    0x54(%rsp),%rdx
    96c6:	48 89 df             	mov    %rbx,%rdi
    96c9:	ff 15 91 56 05 00    	call   *0x55691(%rip)        # 5ed60 <_GLOBAL_OFFSET_TABLE_+0x770>
    96cf:	4c 8d 74 24 60       	lea    0x60(%rsp),%r14
    96d4:	48 8d 54 24 38       	lea    0x38(%rsp),%rdx
    96d9:	4c 89 f7             	mov    %r14,%rdi
    96dc:	48 89 de             	mov    %rbx,%rsi
    96df:	ff 15 3b 51 05 00    	call   *0x5513b(%rip)        # 5e820 <_GLOBAL_OFFSET_TABLE_+0x230>
    96e5:	4c 89 f7             	mov    %r14,%rdi
    96e8:	ff 15 62 4f 05 00    	call   *0x54f62(%rip)        # 5e650 <_GLOBAL_OFFSET_TABLE_+0x60>
    96ee:	8b 4c 24 60          	mov    0x60(%rsp),%ecx
    96f2:	83 f9 01             	cmp    $0x1,%ecx
    96f5:	75 1c                	jne    9713 <hyperinterval_strict_surface32+0x1b3>
    96f7:	8b 74 24 64          	mov    0x64(%rsp),%esi
    96fb:	8b 7c 24 68          	mov    0x68(%rsp),%edi
    96ff:	39 fe                	cmp    %edi,%esi
    9701:	0f 94 c2             	sete   %dl
    9704:	66 0f 6e ce          	movd   %esi,%xmm1
    9708:	66 0f 6e c7          	movd   %edi,%xmm0
    970c:	be 01 00 00 00       	mov    $0x1,%esi
    9711:	eb 04                	jmp    9717 <hyperinterval_strict_surface32+0x1b7>
    9713:	31 d2                	xor    %edx,%edx
    9715:	31 f6                	xor    %esi,%esi
    9717:	80 f1 01             	xor    $0x1,%cl
    971a:	89 74 24 08          	mov    %esi,0x8(%rsp)
    971e:	66 0f 7e 4c 24 0c    	movd   %xmm1,0xc(%rsp)
    9724:	88 4c 24 10          	mov    %cl,0x10(%rsp)
    9728:	88 54 24 11          	mov    %dl,0x11(%rsp)
    972c:	88 44 24 12          	mov    %al,0x12(%rsp)
    9730:	89 74 24 14          	mov    %esi,0x14(%rsp)
    9734:	66 0f 7e 44 24 18    	movd   %xmm0,0x18(%rsp)
    973a:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
    973f:	4c 8d 6c 24 60       	lea    0x60(%rsp),%r13
    9744:	4c 8d 74 24 54       	lea    0x54(%rsp),%r14
    9749:	4c 89 ef             	mov    %r13,%rdi
    974c:	4c 89 f6             	mov    %r14,%rsi
    974f:	ff 15 23 57 05 00    	call   *0x55723(%rip)        # 5ee78 <_GLOBAL_OFFSET_TABLE_+0x888>
    9755:	89 c3                	mov    %eax,%ebx
    9757:	4c 89 ef             	mov    %r13,%rdi
    975a:	4c 89 f6             	mov    %r14,%rsi
    975d:	ff 15 8d 54 05 00    	call   *0x5548d(%rip)        # 5ebf0 <_GLOBAL_OFFSET_TABLE_+0x600>
    9763:	41 89 c6             	mov    %eax,%r14d
    9766:	4c 8d 64 24 38       	lea    0x38(%rsp),%r12
    976b:	4c 89 ef             	mov    %r13,%rdi
    976e:	4c 89 e6             	mov    %r12,%rsi
    9771:	ff 15 59 54 05 00    	call   *0x55459(%rip)        # 5ebd0 <_GLOBAL_OFFSET_TABLE_+0x5e0>
    9777:	41 89 c7             	mov    %eax,%r15d
    977a:	4c 89 ef             	mov    %r13,%rdi
    977d:	4c 89 e6             	mov    %r12,%rsi
    9780:	ff 15 92 53 05 00    	call   *0x55392(%rip)        # 5eb18 <_GLOBAL_OFFSET_TABLE_+0x528>
    9786:	41 89 c4             	mov    %eax,%r12d
    9789:	4c 89 ef             	mov    %r13,%rdi
    978c:	66 0f 6e 44 24 34    	movd   0x34(%rsp),%xmm0
    9792:	ff 15 e8 57 05 00    	call   *0x557e8(%rip)        # 5ef80 <_GLOBAL_OFFSET_TABLE_+0x990>
    9798:	a8 01                	test   $0x1,%al
    979a:	74 08                	je     97a4 <hyperinterval_strict_surface32+0x244>
    979c:	88 55 04             	mov    %dl,0x4(%rbp)
    979f:	e9 3e fe ff ff       	jmp    95e2 <hyperinterval_strict_surface32+0x82>
    97a4:	80 e2 01             	and    $0x1,%dl
    97a7:	88 5c 24 08          	mov    %bl,0x8(%rsp)
    97ab:	44 88 74 24 09       	mov    %r14b,0x9(%rsp)
    97b0:	44 88 7c 24 0a       	mov    %r15b,0xa(%rsp)
    97b5:	44 88 64 24 0b       	mov    %r12b,0xb(%rsp)
    97ba:	88 54 24 0c          	mov    %dl,0xc(%rsp)
    97be:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
    97c3:	f6 44 24 38 01       	testb  $0x1,0x38(%rsp)
    97c8:	74 2a                	je     97f4 <hyperinterval_strict_surface32+0x294>
    97ca:	f3 0f 7e 44 24 3c    	movq   0x3c(%rsp),%xmm0
    97d0:	66 0f 70 c8 e1       	pshufd $0xe1,%xmm0,%xmm1
    97d5:	66 0f ef c0          	pxor   %xmm0,%xmm0
    97d9:	66 0f 6f 15 1f 2b 04 	movdqa 0x42b1f(%rip),%xmm2        # 4c300 <_fini+0x384>
    97e0:	00 
    97e1:	66 0f ef d1          	pxor   %xmm1,%xmm2
    97e5:	66 0f 76 c1          	pcmpeqd %xmm1,%xmm0
    97e9:	66 0f df c2          	pandn  %xmm2,%xmm0
    97ed:	b8 01 00 00 00       	mov    $0x1,%eax
    97f2:	eb 02                	jmp    97f6 <hyperinterval_strict_surface32+0x296>
    97f4:	31 c0                	xor    %eax,%eax
    97f6:	89 44 24 44          	mov    %eax,0x44(%rsp)
    97fa:	66 0f d6 44 24 48    	movq   %xmm0,0x48(%rsp)
    9800:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    9805:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
    980a:	48 8d 54 24 44       	lea    0x44(%rsp),%rdx
    980f:	ff 15 93 53 05 00    	call   *0x55393(%rip)        # 5eba8 <_GLOBAL_OFFSET_TABLE_+0x5b8>
    9815:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    9819:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
    981e:	83 f9 02             	cmp    $0x2,%ecx
    9821:	0f 84 72 fd ff ff    	je     9599 <hyperinterval_strict_surface32+0x39>
    9827:	8b 54 24 0d          	mov    0xd(%rsp),%edx
    982b:	8b 74 24 10          	mov    0x10(%rsp),%esi
    982f:	89 74 24 24          	mov    %esi,0x24(%rsp)
    9833:	89 54 24 21          	mov    %edx,0x21(%rsp)
    9837:	89 4c 24 1c          	mov    %ecx,0x1c(%rsp)
    983b:	88 44 24 20          	mov    %al,0x20(%rsp)
    983f:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    9844:	66 0f 6e 05 f4 29 04 	movd   0x429f4(%rip),%xmm0        # 4c240 <_fini+0x2c4>
    984b:	00 
    984c:	ff 15 56 51 05 00    	call   *0x55156(%rip)        # 5e9a8 <_GLOBAL_OFFSET_TABLE_+0x3b8>
    9852:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    9856:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
    985b:	83 f9 02             	cmp    $0x2,%ecx
    985e:	0f 84 35 fd ff ff    	je     9599 <hyperinterval_strict_surface32+0x39>
    9864:	8b 54 24 0d          	mov    0xd(%rsp),%edx
    9868:	8b 74 24 10          	mov    0x10(%rsp),%esi
    986c:	89 74 24 30          	mov    %esi,0x30(%rsp)
    9870:	89 54 24 2d          	mov    %edx,0x2d(%rsp)
    9874:	89 4c 24 28          	mov    %ecx,0x28(%rsp)
    9878:	88 44 24 2c          	mov    %al,0x2c(%rsp)
    987c:	48 8d 74 24 1c       	lea    0x1c(%rsp),%rsi
    9881:	48 8d 54 24 28       	lea    0x28(%rsp),%rdx
    9886:	48 89 ef             	mov    %rbp,%rdi
    9889:	ff 15 59 55 05 00    	call   *0x55559(%rip)        # 5ede8 <_GLOBAL_OFFSET_TABLE_+0x7f8>
    988f:	e9 55 fd ff ff       	jmp    95e9 <hyperinterval_strict_surface32+0x89>
    9894:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    989b:	00 00 00 
    989e:	66 90                	xchg   %ax,%ax

hyperinterval_strict_surface64:
    98a0:	55                   	push   %rbp
    98a1:	41 57                	push   %r15
    98a3:	41 56                	push   %r14
    98a5:	41 55                	push   %r13
    98a7:	41 54                	push   %r12
    98a9:	53                   	push   %rbx
    98aa:	48 81 ec 08 01 00 00 	sub    $0x108,%rsp
    98b1:	89 f5                	mov    %esi,%ebp
    98b3:	48 89 fb             	mov    %rdi,%rbx
    98b6:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    98bb:	f2 0f 11 84 24 90 00 	movsd  %xmm0,0x90(%rsp)
    98c2:	00 00 
    98c4:	66 0f d6 4c 24 58    	movq   %xmm1,0x58(%rsp)
    98ca:	ff 15 60 4d 05 00    	call   *0x54d60(%rip)        # 5e630 <_GLOBAL_OFFSET_TABLE_+0x40>
    98d0:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
    98d5:	44 0f b6 64 24 18    	movzbl 0x18(%rsp),%r12d
    98db:	49 83 fe 02          	cmp    $0x2,%r14
    98df:	75 09                	jne    98ea <hyperinterval_strict_surface64+0x4a>
    98e1:	44 88 63 08          	mov    %r12b,0x8(%rbx)
    98e5:	e9 8a 00 00 00       	jmp    9974 <hyperinterval_strict_surface64+0xd4>
    98ea:	44 0f b6 7c 24 1f    	movzbl 0x1f(%rsp),%r15d
    98f0:	44 0f b7 6c 24 1d    	movzwl 0x1d(%rsp),%r13d
    98f6:	8b 44 24 19          	mov    0x19(%rsp),%eax
    98fa:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    98ff:	4c 89 74 24 60       	mov    %r14,0x60(%rsp)
    9904:	44 88 64 24 68       	mov    %r12b,0x68(%rsp)
    9909:	44 88 7c 24 6f       	mov    %r15b,0x6f(%rsp)
    990e:	66 44 89 6c 24 6d    	mov    %r13w,0x6d(%rsp)
    9914:	48 89 84 24 d0 00 00 	mov    %rax,0xd0(%rsp)
    991b:	00 
    991c:	89 44 24 69          	mov    %eax,0x69(%rsp)
    9920:	48 89 8c 24 c8 00 00 	mov    %rcx,0xc8(%rsp)
    9927:	00 
    9928:	48 89 4c 24 70       	mov    %rcx,0x70(%rsp)
    992d:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
    9932:	f2 0f 10 84 24 90 00 	movsd  0x90(%rsp),%xmm0
    9939:	00 00 
    993b:	ff 15 ef 55 05 00    	call   *0x555ef(%rip)        # 5ef30 <_GLOBAL_OFFSET_TABLE_+0x940>
    9941:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
    9946:	74 24                	je     996c <hyperinterval_strict_surface64+0xcc>
    9948:	f2 0f 10 44 24 40    	movsd  0x40(%rsp),%xmm0
    994e:	f2 0f 11 44 24 50    	movsd  %xmm0,0x50(%rsp)
    9954:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
    9959:	f2 0f 10 44 24 58    	movsd  0x58(%rsp),%xmm0
    995f:	ff 15 4b 53 05 00    	call   *0x5534b(%rip)        # 5ecb0 <_GLOBAL_OFFSET_TABLE_+0x6c0>
    9965:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
    996a:	75 24                	jne    9990 <hyperinterval_strict_surface64+0xf0>
    996c:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
    9971:	88 43 08             	mov    %al,0x8(%rbx)
    9974:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    997b:	48 89 d8             	mov    %rbx,%rax
    997e:	48 81 c4 08 01 00 00 	add    $0x108,%rsp
    9985:	5b                   	pop    %rbx
    9986:	41 5c                	pop    %r12
    9988:	41 5d                	pop    %r13
    998a:	41 5e                	pop    %r14
    998c:	41 5f                	pop    %r15
    998e:	5d                   	pop    %rbp
    998f:	c3                   	ret
    9990:	f3 0f 7e 4c 24 40    	movq   0x40(%rsp),%xmm1
    9996:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    999b:	f2 0f 10 44 24 50    	movsd  0x50(%rsp),%xmm0
    99a1:	ff 15 89 4c 05 00    	call   *0x54c89(%rip)        # 5e630 <_GLOBAL_OFFSET_TABLE_+0x40>
    99a7:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    99ac:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
    99b1:	48 83 f9 02          	cmp    $0x2,%rcx
    99b5:	74 ba                	je     9971 <hyperinterval_strict_surface64+0xd1>
    99b7:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
    99bc:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    99c1:	48 89 b4 24 c0 00 00 	mov    %rsi,0xc0(%rsp)
    99c8:	00 
    99c9:	48 89 94 24 b9 00 00 	mov    %rdx,0xb9(%rsp)
    99d0:	00 
    99d1:	48 89 8c 24 b0 00 00 	mov    %rcx,0xb0(%rsp)
    99d8:	00 
    99d9:	88 84 24 b8 00 00 00 	mov    %al,0xb8(%rsp)
    99e0:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    99e5:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
    99ea:	89 ea                	mov    %ebp,%edx
    99ec:	ff 15 4e 51 05 00    	call   *0x5514e(%rip)        # 5eb40 <_GLOBAL_OFFSET_TABLE_+0x550>
    99f2:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    99f7:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
    99fc:	48 83 f9 02          	cmp    $0x2,%rcx
    9a00:	0f 84 6b ff ff ff    	je     9971 <hyperinterval_strict_surface64+0xd1>
    9a06:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
    9a0b:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    9a10:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
    9a15:	48 89 54 24 41       	mov    %rdx,0x41(%rsp)
    9a1a:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
    9a1f:	88 44 24 40          	mov    %al,0x40(%rsp)
    9a23:	48 8d bc 24 98 00 00 	lea    0x98(%rsp),%rdi
    9a2a:	00 
    9a2b:	48 8d 74 24 38       	lea    0x38(%rsp),%rsi
    9a30:	ff 15 ba 4c 05 00    	call   *0x54cba(%rip)        # 5e6f0 <_GLOBAL_OFFSET_TABLE_+0x100>
    9a36:	48 8b 8c 24 98 00 00 	mov    0x98(%rsp),%rcx
    9a3d:	00 
    9a3e:	0f b6 84 24 a0 00 00 	movzbl 0xa0(%rsp),%eax
    9a45:	00 
    9a46:	48 83 f9 02          	cmp    $0x2,%rcx
    9a4a:	0f 84 21 ff ff ff    	je     9971 <hyperinterval_strict_surface64+0xd1>
    9a50:	48 8b 94 24 a1 00 00 	mov    0xa1(%rsp),%rdx
    9a57:	00 
    9a58:	48 8b b4 24 a8 00 00 	mov    0xa8(%rsp),%rsi
    9a5f:	00 
    9a60:	48 89 b4 24 88 00 00 	mov    %rsi,0x88(%rsp)
    9a67:	00 
    9a68:	48 89 94 24 81 00 00 	mov    %rdx,0x81(%rsp)
    9a6f:	00 
    9a70:	48 89 4c 24 78       	mov    %rcx,0x78(%rsp)
    9a75:	88 84 24 80 00 00 00 	mov    %al,0x80(%rsp)
    9a7c:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
    9a83:	00 
    9a84:	48 8d 74 24 78       	lea    0x78(%rsp),%rsi
    9a89:	48 8d 94 24 b0 00 00 	lea    0xb0(%rsp),%rdx
    9a90:	00 
    9a91:	ff 15 89 4c 05 00    	call   *0x54c89(%rip)        # 5e720 <_GLOBAL_OFFSET_TABLE_+0x130>
    9a97:	48 8d ac 24 d8 00 00 	lea    0xd8(%rsp),%rbp
    9a9e:	00 
    9a9f:	48 8d 54 24 60       	lea    0x60(%rsp),%rdx
    9aa4:	48 89 ef             	mov    %rbp,%rdi
    9aa7:	48 8d b4 24 f0 00 00 	lea    0xf0(%rsp),%rsi
    9aae:	00 
    9aaf:	ff 15 63 4c 05 00    	call   *0x54c63(%rip)        # 5e718 <_GLOBAL_OFFSET_TABLE_+0x128>
    9ab5:	48 89 ef             	mov    %rbp,%rdi
    9ab8:	ff 15 fa 50 05 00    	call   *0x550fa(%rip)        # 5ebb8 <_GLOBAL_OFFSET_TABLE_+0x5c8>
    9abe:	48 8b 8c 24 d8 00 00 	mov    0xd8(%rsp),%rcx
    9ac5:	00 
    9ac6:	48 83 f9 01          	cmp    $0x1,%rcx
    9aca:	75 27                	jne    9af3 <hyperinterval_strict_surface64+0x253>
    9acc:	48 8b b4 24 e0 00 00 	mov    0xe0(%rsp),%rsi
    9ad3:	00 
    9ad4:	48 8b bc 24 e8 00 00 	mov    0xe8(%rsp),%rdi
    9adb:	00 
    9adc:	48 39 fe             	cmp    %rdi,%rsi
    9adf:	0f 94 c2             	sete   %dl
    9ae2:	66 48 0f 6e ce       	movq   %rsi,%xmm1
    9ae7:	66 48 0f 6e c7       	movq   %rdi,%xmm0
    9aec:	be 01 00 00 00       	mov    $0x1,%esi
    9af1:	eb 04                	jmp    9af7 <hyperinterval_strict_surface64+0x257>
    9af3:	31 d2                	xor    %edx,%edx
    9af5:	31 f6                	xor    %esi,%esi
    9af7:	80 f1 01             	xor    $0x1,%cl
    9afa:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
    9aff:	66 0f d6 4c 24 18    	movq   %xmm1,0x18(%rsp)
    9b05:	88 4c 24 20          	mov    %cl,0x20(%rsp)
    9b09:	88 54 24 21          	mov    %dl,0x21(%rsp)
    9b0d:	88 44 24 22          	mov    %al,0x22(%rsp)
    9b11:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
    9b16:	66 0f d6 44 24 30    	movq   %xmm0,0x30(%rsp)
    9b1c:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
    9b21:	48 8d ac 24 d8 00 00 	lea    0xd8(%rsp),%rbp
    9b28:	00 
    9b29:	48 8d b4 24 b0 00 00 	lea    0xb0(%rsp),%rsi
    9b30:	00 
    9b31:	48 89 ef             	mov    %rbp,%rdi
    9b34:	ff 15 16 51 05 00    	call   *0x55116(%rip)        # 5ec50 <_GLOBAL_OFFSET_TABLE_+0x660>
    9b3a:	88 44 24 58          	mov    %al,0x58(%rsp)
    9b3e:	48 89 ef             	mov    %rbp,%rdi
    9b41:	48 8d b4 24 b0 00 00 	lea    0xb0(%rsp),%rsi
    9b48:	00 
    9b49:	ff 15 c9 4e 05 00    	call   *0x54ec9(%rip)        # 5ea18 <_GLOBAL_OFFSET_TABLE_+0x428>
    9b4f:	88 44 24 50          	mov    %al,0x50(%rsp)
    9b53:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
    9b58:	48 89 ef             	mov    %rbp,%rdi
    9b5b:	ff 15 c7 50 05 00    	call   *0x550c7(%rip)        # 5ec28 <_GLOBAL_OFFSET_TABLE_+0x638>
    9b61:	88 44 24 0f          	mov    %al,0xf(%rsp)
    9b65:	48 89 ef             	mov    %rbp,%rdi
    9b68:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
    9b6d:	ff 15 2d 53 05 00    	call   *0x5532d(%rip)        # 5eea0 <_GLOBAL_OFFSET_TABLE_+0x8b0>
    9b73:	88 44 24 0e          	mov    %al,0xe(%rsp)
    9b77:	48 89 ef             	mov    %rbp,%rdi
    9b7a:	f2 0f 10 84 24 90 00 	movsd  0x90(%rsp),%xmm0
    9b81:	00 00 
    9b83:	ff 15 e7 4a 05 00    	call   *0x54ae7(%rip)        # 5e670 <_GLOBAL_OFFSET_TABLE_+0x80>
    9b89:	a8 01                	test   $0x1,%al
    9b8b:	74 08                	je     9b95 <hyperinterval_strict_surface64+0x2f5>
    9b8d:	88 53 08             	mov    %dl,0x8(%rbx)
    9b90:	e9 df fd ff ff       	jmp    9974 <hyperinterval_strict_surface64+0xd4>
    9b95:	80 e2 01             	and    $0x1,%dl
    9b98:	0f b6 44 24 58       	movzbl 0x58(%rsp),%eax
    9b9d:	88 44 24 10          	mov    %al,0x10(%rsp)
    9ba1:	0f b6 44 24 50       	movzbl 0x50(%rsp),%eax
    9ba6:	88 44 24 11          	mov    %al,0x11(%rsp)
    9baa:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
    9baf:	88 44 24 12          	mov    %al,0x12(%rsp)
    9bb3:	0f b6 44 24 0e       	movzbl 0xe(%rsp),%eax
    9bb8:	88 44 24 13          	mov    %al,0x13(%rsp)
    9bbc:	88 54 24 14          	mov    %dl,0x14(%rsp)
    9bc0:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
    9bc5:	41 f6 c6 01          	test   $0x1,%r14b
    9bc9:	74 51                	je     9c1c <hyperinterval_strict_surface64+0x37c>
    9bcb:	41 c1 e7 10          	shl    $0x10,%r15d
    9bcf:	45 09 fd             	or     %r15d,%r13d
    9bd2:	41 0f b6 c4          	movzbl %r12b,%eax
    9bd6:	49 c1 e5 20          	shl    $0x20,%r13
    9bda:	48 8b 94 24 d0 00 00 	mov    0xd0(%rsp),%rdx
    9be1:	00 
    9be2:	4c 09 ea             	or     %r13,%rdx
    9be5:	48 c1 e2 08          	shl    $0x8,%rdx
    9be9:	48 09 c2             	or     %rax,%rdx
    9bec:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    9bf3:	00 00 80 
    9bf6:	48 8b b4 24 c8 00 00 	mov    0xc8(%rsp),%rsi
    9bfd:	00 
    9bfe:	48 89 f1             	mov    %rsi,%rcx
    9c01:	48 31 c1             	xor    %rax,%rcx
    9c04:	48 85 f6             	test   %rsi,%rsi
    9c07:	48 0f 44 ce          	cmove  %rsi,%rcx
    9c0b:	48 31 d0             	xor    %rdx,%rax
    9c0e:	48 85 d2             	test   %rdx,%rdx
    9c11:	48 0f 44 c2          	cmove  %rdx,%rax
    9c15:	ba 01 00 00 00       	mov    $0x1,%edx
    9c1a:	eb 02                	jmp    9c1e <hyperinterval_strict_surface64+0x37e>
    9c1c:	31 d2                	xor    %edx,%edx
    9c1e:	48 89 94 24 98 00 00 	mov    %rdx,0x98(%rsp)
    9c25:	00 
    9c26:	48 89 8c 24 a0 00 00 	mov    %rcx,0xa0(%rsp)
    9c2d:	00 
    9c2e:	48 89 84 24 a8 00 00 	mov    %rax,0xa8(%rsp)
    9c35:	00 
    9c36:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    9c3b:	48 8d b4 24 d8 00 00 	lea    0xd8(%rsp),%rsi
    9c42:	00 
    9c43:	48 8d 94 24 98 00 00 	lea    0x98(%rsp),%rdx
    9c4a:	00 
    9c4b:	ff 15 f7 50 05 00    	call   *0x550f7(%rip)        # 5ed48 <_GLOBAL_OFFSET_TABLE_+0x758>
    9c51:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    9c56:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
    9c5b:	48 83 f9 02          	cmp    $0x2,%rcx
    9c5f:	0f 84 0c fd ff ff    	je     9971 <hyperinterval_strict_surface64+0xd1>
    9c65:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
    9c6a:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    9c6f:	48 89 b4 24 88 00 00 	mov    %rsi,0x88(%rsp)
    9c76:	00 
    9c77:	48 89 94 24 81 00 00 	mov    %rdx,0x81(%rsp)
    9c7e:	00 
    9c7f:	48 89 4c 24 78       	mov    %rcx,0x78(%rsp)
    9c84:	88 84 24 80 00 00 00 	mov    %al,0x80(%rsp)
    9c8b:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    9c90:	f2 0f 10 05 88 23 04 	movsd  0x42388(%rip),%xmm0        # 4c020 <_fini+0xa4>
    9c97:	00 
    9c98:	ff 15 72 52 05 00    	call   *0x55272(%rip)        # 5ef10 <_GLOBAL_OFFSET_TABLE_+0x920>
    9c9e:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    9ca3:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
    9ca8:	48 83 f9 02          	cmp    $0x2,%rcx
    9cac:	0f 84 bf fc ff ff    	je     9971 <hyperinterval_strict_surface64+0xd1>
    9cb2:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
    9cb7:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    9cbc:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
    9cc1:	48 89 54 24 41       	mov    %rdx,0x41(%rsp)
    9cc6:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
    9ccb:	88 44 24 40          	mov    %al,0x40(%rsp)
    9ccf:	48 8d 74 24 78       	lea    0x78(%rsp),%rsi
    9cd4:	48 8d 54 24 38       	lea    0x38(%rsp),%rdx
    9cd9:	48 89 df             	mov    %rbx,%rdi
    9cdc:	ff 15 a6 51 05 00    	call   *0x551a6(%rip)        # 5ee88 <_GLOBAL_OFFSET_TABLE_+0x898>
    9ce2:	e9 94 fc ff ff       	jmp    997b <hyperinterval_strict_surface64+0xdb>
    9ce7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    9cee:	00 00 

hyperinterval::float::F32Enclosure::new:
    9d70:	41 57                	push   %r15
    9d72:	41 56                	push   %r14
    9d74:	53                   	push   %rbx
    9d75:	48 83 ec 20          	sub    $0x20,%rsp
    9d79:	f3 0f 11 4c 24 1c    	movss  %xmm1,0x1c(%rsp)
    9d7f:	48 89 fb             	mov    %rdi,%rbx
    9d82:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
    9d88:	66 0f 7e c1          	movd   %xmm0,%ecx
    9d8c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    9d91:	be 00 00 00 80       	mov    $0x80000000,%esi
    9d96:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    9d9b:	e8 80 3e 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    9da0:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    9da5:	74 2a                	je     9dd1 <hyperinterval::float::F32Enclosure::new+0x61>
    9da7:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
    9dac:	66 0f 6e 44 24 1c    	movd   0x1c(%rsp),%xmm0
    9db2:	66 0f 7e c1          	movd   %xmm0,%ecx
    9db6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    9dbb:	be 00 00 00 80       	mov    $0x80000000,%esi
    9dc0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    9dc5:	e8 56 3e 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    9dca:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    9dcf:	75 1b                	jne    9dec <hyperinterval::float::F32Enclosure::new+0x7c>
    9dd1:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
    9dd6:	88 43 04             	mov    %al,0x4(%rbx)
    9dd9:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    9ddf:	48 89 d8             	mov    %rbx,%rax
    9de2:	48 83 c4 20          	add    $0x20,%rsp
    9de6:	5b                   	pop    %rbx
    9de7:	41 5e                	pop    %r14
    9de9:	41 5f                	pop    %r15
    9deb:	c3                   	ret
    9dec:	8b 44 24 10          	mov    0x10(%rsp),%eax
    9df0:	44 89 f9             	mov    %r15d,%ecx
    9df3:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    9df9:	89 c2                	mov    %eax,%edx
    9dfb:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    9e01:	be 00 00 00 80       	mov    $0x80000000,%esi
    9e06:	29 ce                	sub    %ecx,%esi
    9e08:	44 09 f1             	or     %r14d,%ecx
    9e0b:	45 85 ff             	test   %r15d,%r15d
    9e0e:	48 0f 49 f1          	cmovns %rcx,%rsi
    9e12:	89 d1                	mov    %edx,%ecx
    9e14:	44 09 f1             	or     %r14d,%ecx
    9e17:	41 29 d6             	sub    %edx,%r14d
    9e1a:	85 c0                	test   %eax,%eax
    9e1c:	4c 0f 49 f1          	cmovns %rcx,%r14
    9e20:	44 39 f6             	cmp    %r14d,%esi
    9e23:	76 06                	jbe    9e2b <hyperinterval::float::F32Enclosure::new+0xbb>
    9e25:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
    9e29:	eb ae                	jmp    9dd9 <hyperinterval::float::F32Enclosure::new+0x69>
    9e2b:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
    9e31:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
    9e35:	89 43 08             	mov    %eax,0x8(%rbx)
    9e38:	eb a5                	jmp    9ddf <hyperinterval::float::F32Enclosure::new+0x6f>
    9e3a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

hyperinterval::float::F32Enclosure::point:
    9e40:	53                   	push   %rbx
    9e41:	48 83 ec 10          	sub    $0x10,%rsp
    9e45:	48 89 fb             	mov    %rdi,%rbx
    9e48:	66 0f 7e c1          	movd   %xmm0,%ecx
    9e4c:	48 89 e7             	mov    %rsp,%rdi
    9e4f:	be 00 00 00 80       	mov    $0x80000000,%esi
    9e54:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    9e59:	e8 c2 3d 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    9e5e:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    9e62:	75 0f                	jne    9e73 <hyperinterval::float::F32Enclosure::point+0x33>
    9e64:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    9e69:	88 43 04             	mov    %al,0x4(%rbx)
    9e6c:	b8 02 00 00 00       	mov    $0x2,%eax
    9e71:	eb 0f                	jmp    9e82 <hyperinterval::float::F32Enclosure::point+0x42>
    9e73:	8b 44 24 08          	mov    0x8(%rsp),%eax
    9e77:	89 43 04             	mov    %eax,0x4(%rbx)
    9e7a:	89 43 08             	mov    %eax,0x8(%rbx)
    9e7d:	b8 01 00 00 00       	mov    $0x1,%eax
    9e82:	89 03                	mov    %eax,(%rbx)
    9e84:	48 89 d8             	mov    %rbx,%rax
    9e87:	48 83 c4 10          	add    $0x10,%rsp
    9e8b:	5b                   	pop    %rbx
    9e8c:	c3                   	ret
    9e8d:	0f 1f 00             	nopl   (%rax)

hyperinterval::float::F32Enclosure::from_bits:
    9e90:	41 57                	push   %r15
    9e92:	41 56                	push   %r14
    9e94:	53                   	push   %rbx
    9e95:	48 83 ec 10          	sub    $0x10,%rsp
    9e99:	48 89 fb             	mov    %rdi,%rbx
    9e9c:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
    9ea2:	48 89 e7             	mov    %rsp,%rdi
    9ea5:	be 00 00 00 80       	mov    $0x80000000,%esi
    9eaa:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    9eaf:	31 c9                	xor    %ecx,%ecx
    9eb1:	e8 6a 3d 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    9eb6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    9eba:	74 1f                	je     9edb <hyperinterval::float::F32Enclosure::from_bits+0x4b>
    9ebc:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
    9ec1:	48 89 e7             	mov    %rsp,%rdi
    9ec4:	be 00 00 00 80       	mov    $0x80000000,%esi
    9ec9:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    9ece:	31 c9                	xor    %ecx,%ecx
    9ed0:	e8 4b 3d 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    9ed5:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    9ed9:	75 18                	jne    9ef3 <hyperinterval::float::F32Enclosure::from_bits+0x63>
    9edb:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    9ee0:	88 43 04             	mov    %al,0x4(%rbx)
    9ee3:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    9ee9:	48 83 c4 10          	add    $0x10,%rsp
    9eed:	5b                   	pop    %rbx
    9eee:	41 5e                	pop    %r14
    9ef0:	41 5f                	pop    %r15
    9ef2:	c3                   	ret
    9ef3:	8b 44 24 08          	mov    0x8(%rsp),%eax
    9ef7:	44 89 f9             	mov    %r15d,%ecx
    9efa:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    9f00:	89 c2                	mov    %eax,%edx
    9f02:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    9f08:	be 00 00 00 80       	mov    $0x80000000,%esi
    9f0d:	29 ce                	sub    %ecx,%esi
    9f0f:	44 09 f1             	or     %r14d,%ecx
    9f12:	45 85 ff             	test   %r15d,%r15d
    9f15:	48 0f 49 f1          	cmovns %rcx,%rsi
    9f19:	89 d1                	mov    %edx,%ecx
    9f1b:	44 09 f1             	or     %r14d,%ecx
    9f1e:	41 29 d6             	sub    %edx,%r14d
    9f21:	85 c0                	test   %eax,%eax
    9f23:	4c 0f 49 f1          	cmovns %rcx,%r14
    9f27:	44 39 f6             	cmp    %r14d,%esi
    9f2a:	76 06                	jbe    9f32 <hyperinterval::float::F32Enclosure::from_bits+0xa2>
    9f2c:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
    9f30:	eb b1                	jmp    9ee3 <hyperinterval::float::F32Enclosure::from_bits+0x53>
    9f32:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
    9f38:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
    9f3c:	89 43 08             	mov    %eax,0x8(%rbx)
    9f3f:	eb a8                	jmp    9ee9 <hyperinterval::float::F32Enclosure::from_bits+0x59>
    9f41:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    9f48:	00 00 00 
    9f4b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

hyperinterval::float::F32Enclosure::contains_point:
    9f50:	41 56                	push   %r14
    9f52:	53                   	push   %rbx
    9f53:	48 83 ec 18          	sub    $0x18,%rsp
    9f57:	48 89 fb             	mov    %rdi,%rbx
    9f5a:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
    9f60:	66 0f 7e c1          	movd   %xmm0,%ecx
    9f64:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    9f69:	be 00 00 00 80       	mov    $0x80000000,%esi
    9f6e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    9f73:	e8 a8 3c 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    9f78:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
    9f7d:	3c 01                	cmp    $0x1,%al
    9f7f:	75 0d                	jne    9f8e <hyperinterval::float::F32Enclosure::contains_point+0x3e>
    9f81:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
    9f86:	48 83 c4 18          	add    $0x18,%rsp
    9f8a:	5b                   	pop    %rbx
    9f8b:	41 5e                	pop    %r14
    9f8d:	c3                   	ret
    9f8e:	f6 03 01             	testb  $0x1,(%rbx)
    9f91:	74 44                	je     9fd7 <hyperinterval::float::F32Enclosure::contains_point+0x87>
    9f93:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    9f98:	8b 73 04             	mov    0x4(%rbx),%esi
    9f9b:	89 d1                	mov    %edx,%ecx
    9f9d:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    9fa3:	89 f7                	mov    %esi,%edi
    9fa5:	44 09 f7             	or     %r14d,%edi
    9fa8:	41 89 f0             	mov    %esi,%r8d
    9fab:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
    9fb2:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
    9fb8:	45 29 c1             	sub    %r8d,%r9d
    9fbb:	85 f6                	test   %esi,%esi
    9fbd:	4c 0f 49 cf          	cmovns %rdi,%r9
    9fc1:	be 00 00 00 80       	mov    $0x80000000,%esi
    9fc6:	48 29 ce             	sub    %rcx,%rsi
    9fc9:	4c 09 f1             	or     %r14,%rcx
    9fcc:	85 d2                	test   %edx,%edx
    9fce:	48 0f 48 ce          	cmovs  %rsi,%rcx
    9fd2:	41 39 c9             	cmp    %ecx,%r9d
    9fd5:	76 0a                	jbe    9fe1 <hyperinterval::float::F32Enclosure::contains_point+0x91>
    9fd7:	31 d2                	xor    %edx,%edx
    9fd9:	48 83 c4 18          	add    $0x18,%rsp
    9fdd:	5b                   	pop    %rbx
    9fde:	41 5e                	pop    %r14
    9fe0:	c3                   	ret
    9fe1:	8b 53 08             	mov    0x8(%rbx),%edx
    9fe4:	89 d6                	mov    %edx,%esi
    9fe6:	44 09 f6             	or     %r14d,%esi
    9fe9:	89 d7                	mov    %edx,%edi
    9feb:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    9ff1:	41 29 fe             	sub    %edi,%r14d
    9ff4:	85 d2                	test   %edx,%edx
    9ff6:	4c 0f 49 f6          	cmovns %rsi,%r14
    9ffa:	44 39 f1             	cmp    %r14d,%ecx
    9ffd:	0f 96 c2             	setbe  %dl
    a000:	48 83 c4 18          	add    $0x18,%rsp
    a004:	5b                   	pop    %rbx
    a005:	41 5e                	pop    %r14
    a007:	c3                   	ret
    a008:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    a00f:	00 

hyperinterval::float::F32Enclosure::subset_of:
    a010:	b0 01                	mov    $0x1,%al
    a012:	f6 07 01             	testb  $0x1,(%rdi)
    a015:	74 53                	je     a06a <hyperinterval::float::F32Enclosure::subset_of+0x5a>
    a017:	f6 06 01             	testb  $0x1,(%rsi)
    a01a:	74 4c                	je     a068 <hyperinterval::float::F32Enclosure::subset_of+0x58>
    a01c:	8b 4f 04             	mov    0x4(%rdi),%ecx
    a01f:	8b 56 04             	mov    0x4(%rsi),%edx
    a022:	b8 00 00 00 80       	mov    $0x80000000,%eax
    a027:	41 89 d0             	mov    %edx,%r8d
    a02a:	41 09 c0             	or     %eax,%r8d
    a02d:	41 89 d1             	mov    %edx,%r9d
    a030:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a037:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a03d:	45 29 ca             	sub    %r9d,%r10d
    a040:	85 d2                	test   %edx,%edx
    a042:	4d 0f 49 d0          	cmovns %r8,%r10
    a046:	89 ca                	mov    %ecx,%edx
    a048:	09 c2                	or     %eax,%edx
    a04a:	41 89 c8             	mov    %ecx,%r8d
    a04d:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
    a054:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
    a05a:	45 29 c1             	sub    %r8d,%r9d
    a05d:	85 c9                	test   %ecx,%ecx
    a05f:	4c 0f 49 ca          	cmovns %rdx,%r9
    a063:	45 39 ca             	cmp    %r9d,%r10d
    a066:	76 03                	jbe    a06b <hyperinterval::float::F32Enclosure::subset_of+0x5b>
    a068:	31 c0                	xor    %eax,%eax
    a06a:	c3                   	ret
    a06b:	8b 4f 08             	mov    0x8(%rdi),%ecx
    a06e:	8b 56 08             	mov    0x8(%rsi),%edx
    a071:	89 ce                	mov    %ecx,%esi
    a073:	09 c6                	or     %eax,%esi
    a075:	89 cf                	mov    %ecx,%edi
    a077:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    a07d:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    a083:	41 29 f8             	sub    %edi,%r8d
    a086:	85 c9                	test   %ecx,%ecx
    a088:	4c 0f 49 c6          	cmovns %rsi,%r8
    a08c:	89 d1                	mov    %edx,%ecx
    a08e:	09 c1                	or     %eax,%ecx
    a090:	89 d6                	mov    %edx,%esi
    a092:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    a098:	29 f0                	sub    %esi,%eax
    a09a:	85 d2                	test   %edx,%edx
    a09c:	48 0f 49 c1          	cmovns %rcx,%rax
    a0a0:	41 39 c0             	cmp    %eax,%r8d
    a0a3:	0f 96 c0             	setbe  %al
    a0a6:	c3                   	ret
    a0a7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    a0ae:	00 00 

hyperinterval::float::F32Enclosure::interior_subset_of:
    a0b0:	b0 01                	mov    $0x1,%al
    a0b2:	f6 07 01             	testb  $0x1,(%rdi)
    a0b5:	0f 84 93 00 00 00    	je     a14e <hyperinterval::float::F32Enclosure::interior_subset_of+0x9e>
    a0bb:	f6 06 01             	testb  $0x1,(%rsi)
    a0be:	0f 84 88 00 00 00    	je     a14c <hyperinterval::float::F32Enclosure::interior_subset_of+0x9c>
    a0c4:	8b 4f 04             	mov    0x4(%rdi),%ecx
    a0c7:	8b 56 04             	mov    0x4(%rsi),%edx
    a0ca:	b8 00 00 00 80       	mov    $0x80000000,%eax
    a0cf:	41 89 d0             	mov    %edx,%r8d
    a0d2:	41 09 c0             	or     %eax,%r8d
    a0d5:	41 89 d1             	mov    %edx,%r9d
    a0d8:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a0df:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a0e5:	45 29 ca             	sub    %r9d,%r10d
    a0e8:	85 d2                	test   %edx,%edx
    a0ea:	4d 0f 49 d0          	cmovns %r8,%r10
    a0ee:	89 ca                	mov    %ecx,%edx
    a0f0:	09 c2                	or     %eax,%edx
    a0f2:	41 89 c8             	mov    %ecx,%r8d
    a0f5:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
    a0fc:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
    a102:	45 29 c1             	sub    %r8d,%r9d
    a105:	85 c9                	test   %ecx,%ecx
    a107:	4c 0f 49 ca          	cmovns %rdx,%r9
    a10b:	45 39 ca             	cmp    %r9d,%r10d
    a10e:	73 3c                	jae    a14c <hyperinterval::float::F32Enclosure::interior_subset_of+0x9c>
    a110:	8b 4f 08             	mov    0x8(%rdi),%ecx
    a113:	8b 56 08             	mov    0x8(%rsi),%edx
    a116:	89 ce                	mov    %ecx,%esi
    a118:	09 c6                	or     %eax,%esi
    a11a:	89 cf                	mov    %ecx,%edi
    a11c:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    a122:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    a128:	41 29 f8             	sub    %edi,%r8d
    a12b:	85 c9                	test   %ecx,%ecx
    a12d:	4c 0f 49 c6          	cmovns %rsi,%r8
    a131:	89 d1                	mov    %edx,%ecx
    a133:	09 c1                	or     %eax,%ecx
    a135:	89 d6                	mov    %edx,%esi
    a137:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    a13d:	29 f0                	sub    %esi,%eax
    a13f:	85 d2                	test   %edx,%edx
    a141:	48 0f 49 c1          	cmovns %rcx,%rax
    a145:	41 39 c0             	cmp    %eax,%r8d
    a148:	0f 92 c0             	setb   %al
    a14b:	c3                   	ret
    a14c:	31 c0                	xor    %eax,%eax
    a14e:	c3                   	ret
    a14f:	90                   	nop

hyperinterval::float::F32Enclosure::disjoint:
    a150:	83 3f 00             	cmpl   $0x0,(%rdi)
    a153:	0f 94 c0             	sete   %al
    a156:	8b 0e                	mov    (%rsi),%ecx
    a158:	85 c9                	test   %ecx,%ecx
    a15a:	0f 94 c2             	sete   %dl
    a15d:	08 c2                	or     %al,%dl
    a15f:	b0 01                	mov    $0x1,%al
    a161:	74 01                	je     a164 <hyperinterval::float::F32Enclosure::disjoint+0x14>
    a163:	c3                   	ret
    a164:	f6 c1 01             	test   $0x1,%cl
    a167:	0f 84 8c 00 00 00    	je     a1f9 <hyperinterval::float::F32Enclosure::disjoint+0xa9>
    a16d:	b9 00 00 00 80       	mov    $0x80000000,%ecx
    a172:	8b 56 04             	mov    0x4(%rsi),%edx
    a175:	44 8b 47 08          	mov    0x8(%rdi),%r8d
    a179:	45 89 c1             	mov    %r8d,%r9d
    a17c:	41 09 c9             	or     %ecx,%r9d
    a17f:	45 89 c2             	mov    %r8d,%r10d
    a182:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
    a189:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
    a18f:	45 29 d3             	sub    %r10d,%r11d
    a192:	45 85 c0             	test   %r8d,%r8d
    a195:	4d 0f 49 d9          	cmovns %r9,%r11
    a199:	41 89 d0             	mov    %edx,%r8d
    a19c:	41 09 c8             	or     %ecx,%r8d
    a19f:	41 89 d1             	mov    %edx,%r9d
    a1a2:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a1a9:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a1af:	45 29 ca             	sub    %r9d,%r10d
    a1b2:	85 d2                	test   %edx,%edx
    a1b4:	4d 0f 49 d0          	cmovns %r8,%r10
    a1b8:	45 39 d3             	cmp    %r10d,%r11d
    a1bb:	72 a6                	jb     a163 <hyperinterval::float::F32Enclosure::disjoint+0x13>
    a1bd:	8b 47 04             	mov    0x4(%rdi),%eax
    a1c0:	8b 56 08             	mov    0x8(%rsi),%edx
    a1c3:	89 d6                	mov    %edx,%esi
    a1c5:	09 ce                	or     %ecx,%esi
    a1c7:	89 d7                	mov    %edx,%edi
    a1c9:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    a1cf:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    a1d5:	41 29 f8             	sub    %edi,%r8d
    a1d8:	85 d2                	test   %edx,%edx
    a1da:	4c 0f 49 c6          	cmovns %rsi,%r8
    a1de:	89 c2                	mov    %eax,%edx
    a1e0:	09 ca                	or     %ecx,%edx
    a1e2:	89 c6                	mov    %eax,%esi
    a1e4:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    a1ea:	29 f1                	sub    %esi,%ecx
    a1ec:	85 c0                	test   %eax,%eax
    a1ee:	48 0f 49 ca          	cmovns %rdx,%rcx
    a1f2:	41 39 c8             	cmp    %ecx,%r8d
    a1f5:	0f 92 c0             	setb   %al
    a1f8:	c3                   	ret
    a1f9:	31 c0                	xor    %eax,%eax
    a1fb:	c3                   	ret
    a1fc:	0f 1f 40 00          	nopl   0x0(%rax)

hyperinterval::float::F32Enclosure::overlaps:
    a200:	83 3f 00             	cmpl   $0x0,(%rdi)
    a203:	0f 94 c0             	sete   %al
    a206:	8b 0e                	mov    (%rsi),%ecx
    a208:	85 c9                	test   %ecx,%ecx
    a20a:	0f 94 c2             	sete   %dl
    a20d:	08 c2                	or     %al,%dl
    a20f:	74 03                	je     a214 <hyperinterval::float::F32Enclosure::overlaps+0x14>
    a211:	31 c0                	xor    %eax,%eax
    a213:	c3                   	ret
    a214:	b0 01                	mov    $0x1,%al
    a216:	f6 c1 01             	test   $0x1,%cl
    a219:	0f 84 8a 00 00 00    	je     a2a9 <hyperinterval::float::F32Enclosure::overlaps+0xa9>
    a21f:	b8 00 00 00 80       	mov    $0x80000000,%eax
    a224:	8b 4e 04             	mov    0x4(%rsi),%ecx
    a227:	8b 57 08             	mov    0x8(%rdi),%edx
    a22a:	41 89 d0             	mov    %edx,%r8d
    a22d:	41 09 c0             	or     %eax,%r8d
    a230:	41 89 d1             	mov    %edx,%r9d
    a233:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a23a:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a240:	45 29 ca             	sub    %r9d,%r10d
    a243:	85 d2                	test   %edx,%edx
    a245:	4d 0f 49 d0          	cmovns %r8,%r10
    a249:	89 ca                	mov    %ecx,%edx
    a24b:	09 c2                	or     %eax,%edx
    a24d:	41 89 c8             	mov    %ecx,%r8d
    a250:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
    a257:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
    a25d:	45 29 c1             	sub    %r8d,%r9d
    a260:	85 c9                	test   %ecx,%ecx
    a262:	4c 0f 49 ca          	cmovns %rdx,%r9
    a266:	45 39 ca             	cmp    %r9d,%r10d
    a269:	73 03                	jae    a26e <hyperinterval::float::F32Enclosure::overlaps+0x6e>
    a26b:	31 c0                	xor    %eax,%eax
    a26d:	c3                   	ret
    a26e:	8b 4f 04             	mov    0x4(%rdi),%ecx
    a271:	8b 56 08             	mov    0x8(%rsi),%edx
    a274:	89 d6                	mov    %edx,%esi
    a276:	09 c6                	or     %eax,%esi
    a278:	89 d7                	mov    %edx,%edi
    a27a:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    a280:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    a286:	41 29 f8             	sub    %edi,%r8d
    a289:	85 d2                	test   %edx,%edx
    a28b:	4c 0f 49 c6          	cmovns %rsi,%r8
    a28f:	89 ca                	mov    %ecx,%edx
    a291:	09 c2                	or     %eax,%edx
    a293:	89 ce                	mov    %ecx,%esi
    a295:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    a29b:	29 f0                	sub    %esi,%eax
    a29d:	85 c9                	test   %ecx,%ecx
    a29f:	48 0f 49 c2          	cmovns %rdx,%rax
    a2a3:	41 39 c0             	cmp    %eax,%r8d
    a2a6:	0f 93 c0             	setae  %al
    a2a9:	c3                   	ret
    a2aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

hyperinterval::float::F32Enclosure::hull:
    a2b0:	48 89 f8             	mov    %rdi,%rax
    a2b3:	44 8b 0e             	mov    (%rsi),%r9d
    a2b6:	44 8b 02             	mov    (%rdx),%r8d
    a2b9:	8b 7a 04             	mov    0x4(%rdx),%edi
    a2bc:	8b 4a 08             	mov    0x8(%rdx),%ecx
    a2bf:	41 f6 c1 01          	test   $0x1,%r9b
    a2c3:	0f 84 a1 00 00 00    	je     a36a <hyperinterval::float::F32Enclosure::hull+0xba>
    a2c9:	8b 56 04             	mov    0x4(%rsi),%edx
    a2cc:	8b 76 08             	mov    0x8(%rsi),%esi
    a2cf:	41 f6 c0 01          	test   $0x1,%r8b
    a2d3:	0f 84 9b 00 00 00    	je     a374 <hyperinterval::float::F32Enclosure::hull+0xc4>
    a2d9:	53                   	push   %rbx
    a2da:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    a2e0:	41 89 d1             	mov    %edx,%r9d
    a2e3:	45 09 c1             	or     %r8d,%r9d
    a2e6:	41 89 d2             	mov    %edx,%r10d
    a2e9:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
    a2f0:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
    a2f6:	45 29 d3             	sub    %r10d,%r11d
    a2f9:	85 d2                	test   %edx,%edx
    a2fb:	4d 0f 49 d9          	cmovns %r9,%r11
    a2ff:	41 89 f9             	mov    %edi,%r9d
    a302:	45 09 c1             	or     %r8d,%r9d
    a305:	41 89 fa             	mov    %edi,%r10d
    a308:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
    a30f:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    a314:	44 29 d3             	sub    %r10d,%ebx
    a317:	85 ff                	test   %edi,%edi
    a319:	49 0f 49 d9          	cmovns %r9,%rbx
    a31d:	41 39 db             	cmp    %ebx,%r11d
    a320:	0f 47 d7             	cmova  %edi,%edx
    a323:	89 f7                	mov    %esi,%edi
    a325:	44 09 c7             	or     %r8d,%edi
    a328:	41 89 f1             	mov    %esi,%r9d
    a32b:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a332:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a338:	45 29 ca             	sub    %r9d,%r10d
    a33b:	85 f6                	test   %esi,%esi
    a33d:	4c 0f 49 d7          	cmovns %rdi,%r10
    a341:	89 cf                	mov    %ecx,%edi
    a343:	44 09 c7             	or     %r8d,%edi
    a346:	41 89 c9             	mov    %ecx,%r9d
    a349:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a350:	45 29 c8             	sub    %r9d,%r8d
    a353:	85 c9                	test   %ecx,%ecx
    a355:	4c 0f 49 c7          	cmovns %rdi,%r8
    a359:	45 39 c2             	cmp    %r8d,%r10d
    a35c:	0f 42 f1             	cmovb  %ecx,%esi
    a35f:	41 b8 01 00 00 00    	mov    $0x1,%r8d
    a365:	89 f1                	mov    %esi,%ecx
    a367:	89 d7                	mov    %edx,%edi
    a369:	5b                   	pop    %rbx
    a36a:	44 89 00             	mov    %r8d,(%rax)
    a36d:	89 78 04             	mov    %edi,0x4(%rax)
    a370:	89 48 08             	mov    %ecx,0x8(%rax)
    a373:	c3                   	ret
    a374:	89 f1                	mov    %esi,%ecx
    a376:	89 d7                	mov    %edx,%edi
    a378:	45 89 c8             	mov    %r9d,%r8d
    a37b:	44 89 00             	mov    %r8d,(%rax)
    a37e:	89 78 04             	mov    %edi,0x4(%rax)
    a381:	89 48 08             	mov    %ecx,0x8(%rax)
    a384:	c3                   	ret
    a385:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    a38c:	00 00 00 
    a38f:	90                   	nop

hyperinterval::float::F32Enclosure::intersection:
    a390:	48 89 f8             	mov    %rdi,%rax
    a393:	45 31 c9             	xor    %r9d,%r9d
    a396:	f6 06 01             	testb  $0x1,(%rsi)
    a399:	0f 84 ed 00 00 00    	je     a48c <hyperinterval::float::F32Enclosure::intersection+0xfc>
    a39f:	f6 02 01             	testb  $0x1,(%rdx)
    a3a2:	0f 84 d9 00 00 00    	je     a481 <hyperinterval::float::F32Enclosure::intersection+0xf1>
    a3a8:	53                   	push   %rbx
    a3a9:	8b 4e 04             	mov    0x4(%rsi),%ecx
    a3ac:	44 8b 4a 04          	mov    0x4(%rdx),%r9d
    a3b0:	bf 00 00 00 80       	mov    $0x80000000,%edi
    a3b5:	41 89 c8             	mov    %ecx,%r8d
    a3b8:	41 09 f8             	or     %edi,%r8d
    a3bb:	41 89 ca             	mov    %ecx,%r10d
    a3be:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
    a3c5:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
    a3cb:	45 29 d3             	sub    %r10d,%r11d
    a3ce:	85 c9                	test   %ecx,%ecx
    a3d0:	4d 0f 49 d8          	cmovns %r8,%r11
    a3d4:	45 89 c8             	mov    %r9d,%r8d
    a3d7:	41 09 f8             	or     %edi,%r8d
    a3da:	45 89 ca             	mov    %r9d,%r10d
    a3dd:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
    a3e4:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    a3e9:	44 29 d3             	sub    %r10d,%ebx
    a3ec:	45 85 c9             	test   %r9d,%r9d
    a3ef:	49 0f 49 d8          	cmovns %r8,%rbx
    a3f3:	44 8b 46 08          	mov    0x8(%rsi),%r8d
    a3f7:	41 39 db             	cmp    %ebx,%r11d
    a3fa:	41 0f 42 c9          	cmovb  %r9d,%ecx
    a3fe:	8b 52 08             	mov    0x8(%rdx),%edx
    a401:	44 89 c6             	mov    %r8d,%esi
    a404:	09 fe                	or     %edi,%esi
    a406:	45 89 c1             	mov    %r8d,%r9d
    a409:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a410:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a416:	45 29 ca             	sub    %r9d,%r10d
    a419:	45 85 c0             	test   %r8d,%r8d
    a41c:	4c 0f 49 d6          	cmovns %rsi,%r10
    a420:	89 d6                	mov    %edx,%esi
    a422:	09 fe                	or     %edi,%esi
    a424:	41 89 d1             	mov    %edx,%r9d
    a427:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a42e:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
    a434:	45 29 cb             	sub    %r9d,%r11d
    a437:	85 d2                	test   %edx,%edx
    a439:	4c 0f 49 de          	cmovns %rsi,%r11
    a43d:	45 39 da             	cmp    %r11d,%r10d
    a440:	44 0f 47 c2          	cmova  %edx,%r8d
    a444:	89 ca                	mov    %ecx,%edx
    a446:	09 fa                	or     %edi,%edx
    a448:	89 ce                	mov    %ecx,%esi
    a44a:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    a450:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a456:	41 29 f2             	sub    %esi,%r10d
    a459:	85 c9                	test   %ecx,%ecx
    a45b:	4c 0f 49 d2          	cmovns %rdx,%r10
    a45f:	44 89 c2             	mov    %r8d,%edx
    a462:	09 fa                	or     %edi,%edx
    a464:	44 89 c6             	mov    %r8d,%esi
    a467:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    a46d:	29 f7                	sub    %esi,%edi
    a46f:	45 85 c0             	test   %r8d,%r8d
    a472:	48 0f 49 fa          	cmovns %rdx,%rdi
    a476:	45 31 c9             	xor    %r9d,%r9d
    a479:	41 39 fa             	cmp    %edi,%r10d
    a47c:	41 0f 96 c1          	setbe  %r9b
    a480:	5b                   	pop    %rbx
    a481:	44 89 08             	mov    %r9d,(%rax)
    a484:	89 48 04             	mov    %ecx,0x4(%rax)
    a487:	44 89 40 08          	mov    %r8d,0x8(%rax)
    a48b:	c3                   	ret
    a48c:	44 89 08             	mov    %r9d,(%rax)
    a48f:	89 48 04             	mov    %ecx,0x4(%rax)
    a492:	44 89 40 08          	mov    %r8d,0x8(%rax)
    a496:	c3                   	ret
    a497:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    a49e:	00 00 

hyperinterval::float::F32Enclosure::signs:
    a4a0:	f6 07 01             	testb  $0x1,(%rdi)
    a4a3:	0f 84 84 00 00 00    	je     a52d <hyperinterval::float::F32Enclosure::signs+0x8d>
    a4a9:	b8 00 00 00 80       	mov    $0x80000000,%eax
    a4ae:	8b 57 04             	mov    0x4(%rdi),%edx
    a4b1:	8b 4f 08             	mov    0x8(%rdi),%ecx
    a4b4:	48 89 d6             	mov    %rdx,%rsi
    a4b7:	48 09 c6             	or     %rax,%rsi
    a4ba:	89 d7                	mov    %edx,%edi
    a4bc:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    a4c2:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
    a4c8:	49 29 fa             	sub    %rdi,%r10
    a4cb:	85 d2                	test   %edx,%edx
    a4cd:	4c 0f 49 d6          	cmovns %rsi,%r10
    a4d1:	45 31 c0             	xor    %r8d,%r8d
    a4d4:	41 f7 c2 00 00 00 80 	test   $0x80000000,%r10d
    a4db:	40 0f 94 c6          	sete   %sil
    a4df:	48 89 ca             	mov    %rcx,%rdx
    a4e2:	48 09 c2             	or     %rax,%rdx
    a4e5:	41 89 c9             	mov    %ecx,%r9d
    a4e8:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
    a4ef:	bf 00 00 00 80       	mov    $0x80000000,%edi
    a4f4:	4c 29 cf             	sub    %r9,%rdi
    a4f7:	49 39 c2             	cmp    %rax,%r10
    a4fa:	77 1b                	ja     a517 <hyperinterval::float::F32Enclosure::signs+0x77>
    a4fc:	44 8d 56 02          	lea    0x2(%rsi),%r10d
    a500:	4d 85 c9             	test   %r9,%r9
    a503:	41 88 f0             	mov    %sil,%r8b
    a506:	41 0f b6 f2          	movzbl %r10b,%esi
    a50a:	44 0f 44 c6          	cmove  %esi,%r8d
    a50e:	85 c9                	test   %ecx,%ecx
    a510:	44 0f 49 c6          	cmovns %esi,%r8d
    a514:	44 89 c6             	mov    %r8d,%esi
    a517:	85 c9                	test   %ecx,%ecx
    a519:	48 0f 48 d7          	cmovs  %rdi,%rdx
    a51d:	8d 4e 04             	lea    0x4(%rsi),%ecx
    a520:	39 c2                	cmp    %eax,%edx
    a522:	40 0f b6 d6          	movzbl %sil,%edx
    a526:	0f b6 c1             	movzbl %cl,%eax
    a529:	0f 46 c2             	cmovbe %edx,%eax
    a52c:	c3                   	ret
    a52d:	31 c0                	xor    %eax,%eax
    a52f:	c3                   	ret

hyperinterval::float::F32Enclosure::add:
    a530:	48 89 f8             	mov    %rdi,%rax
    a533:	f6 06 01             	testb  $0x1,(%rsi)
    a536:	0f 84 d6 00 00 00    	je     a612 <hyperinterval::float::F32Enclosure::add+0xe2>
    a53c:	f6 02 01             	testb  $0x1,(%rdx)
    a53f:	0f 84 cd 00 00 00    	je     a612 <hyperinterval::float::F32Enclosure::add+0xe2>
    a545:	41 57                	push   %r15
    a547:	41 56                	push   %r14
    a549:	41 55                	push   %r13
    a54b:	41 54                	push   %r12
    a54d:	53                   	push   %rbx
    a54e:	48 83 ec 20          	sub    $0x20,%rsp
    a552:	49 89 c4             	mov    %rax,%r12
    a555:	8b 5e 08             	mov    0x8(%rsi),%ebx
    a558:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
    a55e:	44 8b 42 04          	mov    0x4(%rdx),%r8d
    a562:	44 8b 72 08          	mov    0x8(%rdx),%r14d
    a566:	8b 4e 04             	mov    0x4(%rsi),%ecx
    a569:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    a56e:	be 00 00 00 80       	mov    $0x80000000,%esi
    a573:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a578:	e8 f3 39 00 00       	call   df70 <hyperinterval::ieee::Format::add>
    a57d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    a582:	74 6b                	je     a5ef <hyperinterval::float::F32Enclosure::add+0xbf>
    a584:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
    a589:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    a58e:	be 00 00 00 80       	mov    $0x80000000,%esi
    a593:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a598:	48 89 d9             	mov    %rbx,%rcx
    a59b:	4d 89 f0             	mov    %r14,%r8
    a59e:	e8 cd 39 00 00       	call   df70 <hyperinterval::ieee::Format::add>
    a5a3:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    a5a8:	74 45                	je     a5ef <hyperinterval::float::F32Enclosure::add+0xbf>
    a5aa:	8b 5c 24 18          	mov    0x18(%rsp),%ebx
    a5ae:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    a5b3:	be 00 00 00 80       	mov    $0x80000000,%esi
    a5b8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a5bd:	4c 89 f9             	mov    %r15,%rcx
    a5c0:	e8 5b 36 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    a5c5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    a5ca:	74 23                	je     a5ef <hyperinterval::float::F32Enclosure::add+0xbf>
    a5cc:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
    a5d1:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    a5d6:	be 00 00 00 80       	mov    $0x80000000,%esi
    a5db:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a5e0:	48 89 d9             	mov    %rbx,%rcx
    a5e3:	e8 38 36 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    a5e8:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    a5ed:	75 2a                	jne    a619 <hyperinterval::float::F32Enclosure::add+0xe9>
    a5ef:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
    a5f4:	4c 89 e0             	mov    %r12,%rax
    a5f7:	41 88 4c 24 04       	mov    %cl,0x4(%r12)
    a5fc:	41 c7 04 24 02 00 00 	movl   $0x2,(%r12)
    a603:	00 
    a604:	48 83 c4 20          	add    $0x20,%rsp
    a608:	5b                   	pop    %rbx
    a609:	41 5c                	pop    %r12
    a60b:	41 5d                	pop    %r13
    a60d:	41 5e                	pop    %r14
    a60f:	41 5f                	pop    %r15
    a611:	c3                   	ret
    a612:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
    a618:	c3                   	ret
    a619:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
    a61d:	44 89 f0             	mov    %r14d,%eax
    a620:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    a625:	89 ca                	mov    %ecx,%edx
    a627:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    a62d:	be 00 00 00 80       	mov    $0x80000000,%esi
    a632:	29 c6                	sub    %eax,%esi
    a634:	44 09 e8             	or     %r13d,%eax
    a637:	45 85 f6             	test   %r14d,%r14d
    a63a:	48 0f 49 f0          	cmovns %rax,%rsi
    a63e:	89 d0                	mov    %edx,%eax
    a640:	44 09 e8             	or     %r13d,%eax
    a643:	41 29 d5             	sub    %edx,%r13d
    a646:	85 c9                	test   %ecx,%ecx
    a648:	4c 0f 49 e8          	cmovns %rax,%r13
    a64c:	44 39 ee             	cmp    %r13d,%esi
    a64f:	4c 89 e0             	mov    %r12,%rax
    a652:	76 0c                	jbe    a660 <hyperinterval::float::F32Enclosure::add+0x130>
    a654:	c6 40 04 01          	movb   $0x1,0x4(%rax)
    a658:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
    a65e:	eb a4                	jmp    a604 <hyperinterval::float::F32Enclosure::add+0xd4>
    a660:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
    a666:	44 89 70 04          	mov    %r14d,0x4(%rax)
    a66a:	89 48 08             	mov    %ecx,0x8(%rax)
    a66d:	eb 95                	jmp    a604 <hyperinterval::float::F32Enclosure::add+0xd4>
    a66f:	90                   	nop

hyperinterval::float::F32Enclosure::sub:
    a670:	53                   	push   %rbx
    a671:	48 83 ec 10          	sub    $0x10,%rsp
    a675:	48 89 fb             	mov    %rdi,%rbx
    a678:	f6 02 01             	testb  $0x1,(%rdx)
    a67b:	74 29                	je     a6a6 <hyperinterval::float::F32Enclosure::sub+0x36>
    a67d:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
    a682:	66 0f 70 c8 e1       	pshufd $0xe1,%xmm0,%xmm1
    a687:	66 0f ef c0          	pxor   %xmm0,%xmm0
    a68b:	66 0f 6f 15 6d 1c 04 	movdqa 0x41c6d(%rip),%xmm2        # 4c300 <_fini+0x384>
    a692:	00 
    a693:	66 0f ef d1          	pxor   %xmm1,%xmm2
    a697:	66 0f 76 c1          	pcmpeqd %xmm1,%xmm0
    a69b:	66 0f df c2          	pandn  %xmm2,%xmm0
    a69f:	b8 01 00 00 00       	mov    $0x1,%eax
    a6a4:	eb 02                	jmp    a6a8 <hyperinterval::float::F32Enclosure::sub+0x38>
    a6a6:	31 c0                	xor    %eax,%eax
    a6a8:	89 44 24 04          	mov    %eax,0x4(%rsp)
    a6ac:	66 0f d6 44 24 08    	movq   %xmm0,0x8(%rsp)
    a6b2:	48 8d 54 24 04       	lea    0x4(%rsp),%rdx
    a6b7:	48 89 df             	mov    %rbx,%rdi
    a6ba:	ff 15 40 40 05 00    	call   *0x54040(%rip)        # 5e700 <_GLOBAL_OFFSET_TABLE_+0x110>
    a6c0:	48 89 d8             	mov    %rbx,%rax
    a6c3:	48 83 c4 10          	add    $0x10,%rsp
    a6c7:	5b                   	pop    %rbx
    a6c8:	c3                   	ret
    a6c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

hyperinterval::float::F32Enclosure::corner_image:
    a6d0:	f6 06 01             	testb  $0x1,(%rsi)
    a6d3:	0f 84 b4 03 00 00    	je     aa8d <hyperinterval::float::F32Enclosure::corner_image+0x3bd>
    a6d9:	f6 02 01             	testb  $0x1,(%rdx)
    a6dc:	0f 84 ab 03 00 00    	je     aa8d <hyperinterval::float::F32Enclosure::corner_image+0x3bd>
    a6e2:	55                   	push   %rbp
    a6e3:	41 57                	push   %r15
    a6e5:	41 56                	push   %r14
    a6e7:	41 55                	push   %r13
    a6e9:	41 54                	push   %r12
    a6eb:	53                   	push   %rbx
    a6ec:	48 83 ec 78          	sub    $0x78,%rsp
    a6f0:	48 89 7c 24 60       	mov    %rdi,0x60(%rsp)
    a6f5:	44 8b 62 04          	mov    0x4(%rdx),%r12d
    a6f9:	8b 42 08             	mov    0x8(%rdx),%eax
    a6fc:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
    a701:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
    a705:	8b 46 08             	mov    0x8(%rsi),%eax
    a708:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
    a70d:	84 c9                	test   %cl,%cl
    a70f:	0f 84 7f 03 00 00    	je     aa94 <hyperinterval::float::F32Enclosure::corner_image+0x3c4>
    a715:	48 89 e7             	mov    %rsp,%rdi
    a718:	be 00 00 00 80       	mov    $0x80000000,%esi
    a71d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a722:	4c 89 e9             	mov    %r13,%rcx
    a725:	4d 89 e0             	mov    %r12,%r8
    a728:	e8 e3 3a 00 00       	call   e210 <hyperinterval::ieee::Format::div>
    a72d:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    a731:	0f 85 4d 04 00 00    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    a737:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    a73b:	8b 6c 24 10          	mov    0x10(%rsp),%ebp
    a73f:	48 89 e7             	mov    %rsp,%rdi
    a742:	be 00 00 00 80       	mov    $0x80000000,%esi
    a747:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a74c:	e8 cf 34 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    a751:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    a755:	0f 85 29 04 00 00    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    a75b:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
    a760:	48 89 e7             	mov    %rsp,%rdi
    a763:	be 00 00 00 80       	mov    $0x80000000,%esi
    a768:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a76d:	48 89 e9             	mov    %rbp,%rcx
    a770:	e8 ab 34 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    a775:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    a779:	0f 85 05 04 00 00    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    a77f:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    a784:	44 89 f0             	mov    %r14d,%eax
    a787:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    a78c:	89 d9                	mov    %ebx,%ecx
    a78e:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    a794:	ba 00 00 00 80       	mov    $0x80000000,%edx
    a799:	29 c2                	sub    %eax,%edx
    a79b:	be 00 00 00 80       	mov    $0x80000000,%esi
    a7a0:	09 f0                	or     %esi,%eax
    a7a2:	45 85 f6             	test   %r14d,%r14d
    a7a5:	48 0f 49 d0          	cmovns %rax,%rdx
    a7a9:	b8 00 00 00 80       	mov    $0x80000000,%eax
    a7ae:	29 c8                	sub    %ecx,%eax
    a7b0:	09 f1                	or     %esi,%ecx
    a7b2:	85 db                	test   %ebx,%ebx
    a7b4:	48 0f 49 c1          	cmovns %rcx,%rax
    a7b8:	40 b5 01             	mov    $0x1,%bpl
    a7bb:	39 c2                	cmp    %eax,%edx
    a7bd:	0f 87 c6 03 00 00    	ja     ab89 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    a7c3:	48 89 e7             	mov    %rsp,%rdi
    a7c6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a7cb:	4c 89 e9             	mov    %r13,%rcx
    a7ce:	4c 8b 44 24 50       	mov    0x50(%rsp),%r8
    a7d3:	e8 38 3a 00 00       	call   e210 <hyperinterval::ieee::Format::div>
    a7d8:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    a7dc:	0f 85 a2 03 00 00    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    a7e2:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    a7e6:	44 8b 6c 24 10       	mov    0x10(%rsp),%r13d
    a7eb:	48 89 e7             	mov    %rsp,%rdi
    a7ee:	be 00 00 00 80       	mov    $0x80000000,%esi
    a7f3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a7f8:	e8 23 34 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    a7fd:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    a801:	0f 85 7d 03 00 00    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    a807:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
    a80c:	48 89 e7             	mov    %rsp,%rdi
    a80f:	be 00 00 00 80       	mov    $0x80000000,%esi
    a814:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a819:	4c 89 e9             	mov    %r13,%rcx
    a81c:	e8 ff 33 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    a821:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    a825:	0f 85 59 03 00 00    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    a82b:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    a830:	44 89 f9             	mov    %r15d,%ecx
    a833:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    a839:	44 89 e8             	mov    %r13d,%eax
    a83c:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    a841:	ba 00 00 00 80       	mov    $0x80000000,%edx
    a846:	48 29 ca             	sub    %rcx,%rdx
    a849:	bf 00 00 00 80       	mov    $0x80000000,%edi
    a84e:	48 09 f9             	or     %rdi,%rcx
    a851:	45 85 ff             	test   %r15d,%r15d
    a854:	48 0f 48 ca          	cmovs  %rdx,%rcx
    a858:	ba 00 00 00 80       	mov    $0x80000000,%edx
    a85d:	48 29 c2             	sub    %rax,%rdx
    a860:	48 09 f8             	or     %rdi,%rax
    a863:	45 85 ed             	test   %r13d,%r13d
    a866:	48 0f 48 c2          	cmovs  %rdx,%rax
    a86a:	48 39 c1             	cmp    %rax,%rcx
    a86d:	0f 87 16 03 00 00    	ja     ab89 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    a873:	44 89 f2             	mov    %r14d,%edx
    a876:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    a87c:	be 00 00 00 80       	mov    $0x80000000,%esi
    a881:	29 d6                	sub    %edx,%esi
    a883:	09 fa                	or     %edi,%edx
    a885:	45 85 f6             	test   %r14d,%r14d
    a888:	48 0f 49 f2          	cmovns %rdx,%rsi
    a88c:	39 ce                	cmp    %ecx,%esi
    a88e:	45 0f 46 fe          	cmovbe %r14d,%r15d
    a892:	89 d9                	mov    %ebx,%ecx
    a894:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    a89a:	ba 00 00 00 80       	mov    $0x80000000,%edx
    a89f:	29 ca                	sub    %ecx,%edx
    a8a1:	09 f9                	or     %edi,%ecx
    a8a3:	85 db                	test   %ebx,%ebx
    a8a5:	48 0f 49 d1          	cmovns %rcx,%rdx
    a8a9:	39 c2                	cmp    %eax,%edx
    a8ab:	44 0f 43 eb          	cmovae %ebx,%r13d
    a8af:	48 89 e7             	mov    %rsp,%rdi
    a8b2:	be 00 00 00 80       	mov    $0x80000000,%esi
    a8b7:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a8bc:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    a8c1:	4d 89 e0             	mov    %r12,%r8
    a8c4:	e8 47 39 00 00       	call   e210 <hyperinterval::ieee::Format::div>
    a8c9:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    a8cd:	0f 85 b1 02 00 00    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    a8d3:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    a8d7:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
    a8dc:	48 89 e7             	mov    %rsp,%rdi
    a8df:	be 00 00 00 80       	mov    $0x80000000,%esi
    a8e4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a8e9:	e8 32 33 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    a8ee:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    a8f2:	0f 85 8c 02 00 00    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    a8f8:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    a8fd:	48 89 e7             	mov    %rsp,%rdi
    a900:	be 00 00 00 80       	mov    $0x80000000,%esi
    a905:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a90a:	4c 89 e1             	mov    %r12,%rcx
    a90d:	e8 0e 33 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    a912:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    a916:	0f 85 68 02 00 00    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    a91c:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    a921:	89 d9                	mov    %ebx,%ecx
    a923:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    a929:	44 89 e0             	mov    %r12d,%eax
    a92c:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    a931:	ba 00 00 00 80       	mov    $0x80000000,%edx
    a936:	48 29 ca             	sub    %rcx,%rdx
    a939:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    a93f:	4c 09 c1             	or     %r8,%rcx
    a942:	85 db                	test   %ebx,%ebx
    a944:	48 0f 48 ca          	cmovs  %rdx,%rcx
    a948:	ba 00 00 00 80       	mov    $0x80000000,%edx
    a94d:	48 29 c2             	sub    %rax,%rdx
    a950:	4c 09 c0             	or     %r8,%rax
    a953:	45 85 e4             	test   %r12d,%r12d
    a956:	48 0f 48 c2          	cmovs  %rdx,%rax
    a95a:	48 39 c1             	cmp    %rax,%rcx
    a95d:	0f 87 26 02 00 00    	ja     ab89 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    a963:	44 89 fa             	mov    %r15d,%edx
    a966:	44 09 c2             	or     %r8d,%edx
    a969:	44 89 fe             	mov    %r15d,%esi
    a96c:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    a972:	bf 00 00 00 80       	mov    $0x80000000,%edi
    a977:	29 f7                	sub    %esi,%edi
    a979:	45 85 ff             	test   %r15d,%r15d
    a97c:	48 0f 49 fa          	cmovns %rdx,%rdi
    a980:	39 cf                	cmp    %ecx,%edi
    a982:	41 0f 46 df          	cmovbe %r15d,%ebx
    a986:	44 89 e9             	mov    %r13d,%ecx
    a989:	44 09 c1             	or     %r8d,%ecx
    a98c:	44 89 ea             	mov    %r13d,%edx
    a98f:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    a995:	be 00 00 00 80       	mov    $0x80000000,%esi
    a99a:	29 d6                	sub    %edx,%esi
    a99c:	45 85 ed             	test   %r13d,%r13d
    a99f:	48 0f 49 f1          	cmovns %rcx,%rsi
    a9a3:	39 c6                	cmp    %eax,%esi
    a9a5:	45 0f 43 e5          	cmovae %r13d,%r12d
    a9a9:	48 89 e7             	mov    %rsp,%rdi
    a9ac:	be 00 00 00 80       	mov    $0x80000000,%esi
    a9b1:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a9b6:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    a9bb:	4c 8b 44 24 50       	mov    0x50(%rsp),%r8
    a9c0:	e8 4b 38 00 00       	call   e210 <hyperinterval::ieee::Format::div>
    a9c5:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    a9c9:	0f 85 b5 01 00 00    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    a9cf:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    a9d3:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
    a9d8:	48 89 e7             	mov    %rsp,%rdi
    a9db:	be 00 00 00 80       	mov    $0x80000000,%esi
    a9e0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a9e5:	e8 36 32 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    a9ea:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    a9ee:	0f 85 90 01 00 00    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    a9f4:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    a9f9:	48 89 e7             	mov    %rsp,%rdi
    a9fc:	be 00 00 00 80       	mov    $0x80000000,%esi
    aa01:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    aa06:	4c 89 f1             	mov    %r14,%rcx
    aa09:	e8 12 32 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    aa0e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    aa12:	0f 85 6c 01 00 00    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    aa18:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    aa1d:	44 89 ea             	mov    %r13d,%edx
    aa20:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    aa26:	89 c1                	mov    %eax,%ecx
    aa28:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    aa2e:	be 00 00 00 80       	mov    $0x80000000,%esi
    aa33:	48 29 d6             	sub    %rdx,%rsi
    aa36:	bf 00 00 00 80       	mov    $0x80000000,%edi
    aa3b:	48 09 fa             	or     %rdi,%rdx
    aa3e:	45 85 ed             	test   %r13d,%r13d
    aa41:	48 0f 48 d6          	cmovs  %rsi,%rdx
    aa45:	be 00 00 00 80       	mov    $0x80000000,%esi
    aa4a:	48 29 ce             	sub    %rcx,%rsi
    aa4d:	48 09 f9             	or     %rdi,%rcx
    aa50:	85 c0                	test   %eax,%eax
    aa52:	48 0f 48 ce          	cmovs  %rsi,%rcx
    aa56:	48 39 ca             	cmp    %rcx,%rdx
    aa59:	0f 87 2a 01 00 00    	ja     ab89 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    aa5f:	89 de                	mov    %ebx,%esi
    aa61:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
    aa67:	44 09 ce             	or     %r9d,%esi
    aa6a:	89 df                	mov    %ebx,%edi
    aa6c:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    aa72:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    aa78:	41 29 f8             	sub    %edi,%r8d
    aa7b:	85 db                	test   %ebx,%ebx
    aa7d:	4c 0f 49 c6          	cmovns %rsi,%r8
    aa81:	41 39 d0             	cmp    %edx,%r8d
    aa84:	44 0f 46 eb          	cmovbe %ebx,%r13d
    aa88:	e9 3a 05 00 00       	jmp    afc7 <hyperinterval::float::F32Enclosure::corner_image+0x8f7>
    aa8d:	c7 07 00 00 00 00    	movl   $0x0,(%rdi)
    aa93:	c3                   	ret
    aa94:	44 89 e8             	mov    %r13d,%eax
    aa97:	c1 e8 17             	shr    $0x17,%eax
    aa9a:	0f b6 d8             	movzbl %al,%ebx
    aa9d:	44 89 e9             	mov    %r13d,%ecx
    aaa0:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
    aaa6:	45 31 f6             	xor    %r14d,%r14d
    aaa9:	85 db                	test   %ebx,%ebx
    aaab:	41 0f 95 c6          	setne  %r14b
    aaaf:	b8 01 00 00 00       	mov    $0x1,%eax
    aab4:	0f 45 c3             	cmovne %ebx,%eax
    aab7:	41 c1 e6 17          	shl    $0x17,%r14d
    aabb:	49 09 ce             	or     %rcx,%r14
    aabe:	44 89 e1             	mov    %r12d,%ecx
    aac1:	c1 e9 17             	shr    $0x17,%ecx
    aac4:	0f b6 f1             	movzbl %cl,%esi
    aac7:	44 89 e1             	mov    %r12d,%ecx
    aaca:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
    aad0:	8d 96 d4 fe ff ff    	lea    -0x12c(%rsi),%edx
    aad6:	45 31 ff             	xor    %r15d,%r15d
    aad9:	48 89 74 24 58       	mov    %rsi,0x58(%rsp)
    aade:	85 f6                	test   %esi,%esi
    aae0:	41 0f 95 c7          	setne  %r15b
    aae4:	be d5 fe ff ff       	mov    $0xfffffed5,%esi
    aae9:	0f 45 f2             	cmovne %edx,%esi
    aaec:	41 c1 e7 17          	shl    $0x17,%r15d
    aaf0:	49 09 cf             	or     %rcx,%r15
    aaf3:	44 89 e9             	mov    %r13d,%ecx
    aaf6:	44 31 e1             	xor    %r12d,%ecx
    aaf9:	4c 89 f2             	mov    %r14,%rdx
    aafc:	49 0f af d7          	imul   %r15,%rdx
    ab00:	01 c6                	add    %eax,%esi
    ab02:	c1 e9 1f             	shr    $0x1f,%ecx
    ab05:	88 4c 24 14          	mov    %cl,0x14(%rsp)
    ab09:	48 89 14 24          	mov    %rdx,(%rsp)
    ab0d:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    ab14:	00 00 
    ab16:	89 74 24 10          	mov    %esi,0x10(%rsp)
    ab1a:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    ab1f:	48 89 e1             	mov    %rsp,%rcx
    ab22:	be 00 00 00 80       	mov    $0x80000000,%esi
    ab27:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ab2c:	e8 2f 31 00 00       	call   dc60 <hyperinterval::ieee::Format::rounded>
    ab31:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
    ab36:	74 07                	je     ab3f <hyperinterval::float::F32Enclosure::corner_image+0x46f>
    ab38:	0f b6 6c 24 29       	movzbl 0x29(%rsp),%ebp
    ab3d:	eb 4a                	jmp    ab89 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    ab3f:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
    ab43:	8b 6c 24 38          	mov    0x38(%rsp),%ebp
    ab47:	48 89 e7             	mov    %rsp,%rdi
    ab4a:	be 00 00 00 80       	mov    $0x80000000,%esi
    ab4f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ab54:	e8 c7 30 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    ab59:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ab5d:	75 25                	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    ab5f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    ab64:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    ab69:	48 89 e7             	mov    %rsp,%rdi
    ab6c:	be 00 00 00 80       	mov    $0x80000000,%esi
    ab71:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ab76:	48 89 e9             	mov    %rbp,%rcx
    ab79:	e8 a2 30 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    ab7e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ab82:	74 23                	je     aba7 <hyperinterval::float::F32Enclosure::corner_image+0x4d7>
    ab84:	0f b6 6c 24 01       	movzbl 0x1(%rsp),%ebp
    ab89:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
    ab8e:	40 88 68 04          	mov    %bpl,0x4(%rax)
    ab92:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
    ab98:	48 83 c4 78          	add    $0x78,%rsp
    ab9c:	5b                   	pop    %rbx
    ab9d:	41 5c                	pop    %r12
    ab9f:	41 5d                	pop    %r13
    aba1:	41 5e                	pop    %r14
    aba3:	41 5f                	pop    %r15
    aba5:	5d                   	pop    %rbp
    aba6:	c3                   	ret
    aba7:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    abac:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
    abb1:	44 89 c0             	mov    %r8d,%eax
    abb4:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    abb9:	89 f9                	mov    %edi,%ecx
    abbb:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    abc1:	ba 00 00 00 80       	mov    $0x80000000,%edx
    abc6:	29 c2                	sub    %eax,%edx
    abc8:	be 00 00 00 80       	mov    $0x80000000,%esi
    abcd:	09 f0                	or     %esi,%eax
    abcf:	45 85 c0             	test   %r8d,%r8d
    abd2:	48 0f 49 d0          	cmovns %rax,%rdx
    abd6:	b8 00 00 00 80       	mov    $0x80000000,%eax
    abdb:	29 c8                	sub    %ecx,%eax
    abdd:	09 f1                	or     %esi,%ecx
    abdf:	85 ff                	test   %edi,%edi
    abe1:	48 0f 49 c1          	cmovns %rcx,%rax
    abe5:	40 b5 01             	mov    $0x1,%bpl
    abe8:	39 c2                	cmp    %eax,%edx
    abea:	77 9d                	ja     ab89 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    abec:	48 89 7c 24 70       	mov    %rdi,0x70(%rsp)
    abf1:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
    abf6:	89 c8                	mov    %ecx,%eax
    abf8:	c1 e8 17             	shr    $0x17,%eax
    abfb:	0f b6 c0             	movzbl %al,%eax
    abfe:	41 31 cd             	xor    %ecx,%r13d
    ac01:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
    ac07:	31 d2                	xor    %edx,%edx
    ac09:	85 c0                	test   %eax,%eax
    ac0b:	be 01 00 00 00       	mov    $0x1,%esi
    ac10:	0f 45 f0             	cmovne %eax,%esi
    ac13:	0f 95 c2             	setne  %dl
    ac16:	c1 e2 17             	shl    $0x17,%edx
    ac19:	48 09 ca             	or     %rcx,%rdx
    ac1c:	48 89 54 24 68       	mov    %rdx,0x68(%rsp)
    ac21:	4c 0f af f2          	imul   %rdx,%r14
    ac25:	89 d8                	mov    %ebx,%eax
    ac27:	05 d4 fe ff ff       	add    $0xfffffed4,%eax
    ac2c:	48 85 db             	test   %rbx,%rbx
    ac2f:	b9 d5 fe ff ff       	mov    $0xfffffed5,%ecx
    ac34:	0f 45 c8             	cmovne %eax,%ecx
    ac37:	89 f3                	mov    %esi,%ebx
    ac39:	01 f1                	add    %esi,%ecx
    ac3b:	41 c1 ed 1f          	shr    $0x1f,%r13d
    ac3f:	44 88 6c 24 14       	mov    %r13b,0x14(%rsp)
    ac44:	4c 89 34 24          	mov    %r14,(%rsp)
    ac48:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    ac4f:	00 00 
    ac51:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
    ac55:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    ac5a:	48 89 e1             	mov    %rsp,%rcx
    ac5d:	be 00 00 00 80       	mov    $0x80000000,%esi
    ac62:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ac67:	e8 f4 2f 00 00       	call   dc60 <hyperinterval::ieee::Format::rounded>
    ac6c:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
    ac71:	0f 85 c1 fe ff ff    	jne    ab38 <hyperinterval::float::F32Enclosure::corner_image+0x468>
    ac77:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
    ac7b:	44 8b 6c 24 38       	mov    0x38(%rsp),%r13d
    ac80:	48 89 e7             	mov    %rsp,%rdi
    ac83:	be 00 00 00 80       	mov    $0x80000000,%esi
    ac88:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ac8d:	e8 8e 2f 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    ac92:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    ac96:	0f 84 e8 fe ff ff    	je     ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    ac9c:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
    aca1:	48 89 e7             	mov    %rsp,%rdi
    aca4:	be 00 00 00 80       	mov    $0x80000000,%esi
    aca9:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    acae:	4c 89 e9             	mov    %r13,%rcx
    acb1:	e8 6a 2f 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    acb6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    acba:	0f 84 c4 fe ff ff    	je     ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    acc0:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    acc5:	44 89 f1             	mov    %r14d,%ecx
    acc8:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    acce:	44 89 e8             	mov    %r13d,%eax
    acd1:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    acd6:	ba 00 00 00 80       	mov    $0x80000000,%edx
    acdb:	48 29 ca             	sub    %rcx,%rdx
    acde:	bf 00 00 00 80       	mov    $0x80000000,%edi
    ace3:	48 09 f9             	or     %rdi,%rcx
    ace6:	45 85 f6             	test   %r14d,%r14d
    ace9:	48 0f 48 ca          	cmovs  %rdx,%rcx
    aced:	ba 00 00 00 80       	mov    $0x80000000,%edx
    acf2:	48 29 c2             	sub    %rax,%rdx
    acf5:	48 09 f8             	or     %rdi,%rax
    acf8:	45 85 ed             	test   %r13d,%r13d
    acfb:	48 0f 48 c2          	cmovs  %rdx,%rax
    acff:	48 39 c1             	cmp    %rax,%rcx
    ad02:	0f 87 81 fe ff ff    	ja     ab89 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    ad08:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
    ad0d:	44 89 c2             	mov    %r8d,%edx
    ad10:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    ad16:	be 00 00 00 80       	mov    $0x80000000,%esi
    ad1b:	29 d6                	sub    %edx,%esi
    ad1d:	09 fa                	or     %edi,%edx
    ad1f:	45 85 c0             	test   %r8d,%r8d
    ad22:	48 0f 49 f2          	cmovns %rdx,%rsi
    ad26:	39 ce                	cmp    %ecx,%esi
    ad28:	45 0f 46 f0          	cmovbe %r8d,%r14d
    ad2c:	4c 89 74 24 40       	mov    %r14,0x40(%rsp)
    ad31:	48 8b 74 24 70       	mov    0x70(%rsp),%rsi
    ad36:	89 f1                	mov    %esi,%ecx
    ad38:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    ad3e:	ba 00 00 00 80       	mov    $0x80000000,%edx
    ad43:	29 ca                	sub    %ecx,%edx
    ad45:	09 f9                	or     %edi,%ecx
    ad47:	85 f6                	test   %esi,%esi
    ad49:	48 0f 49 d1          	cmovns %rcx,%rdx
    ad4d:	39 c2                	cmp    %eax,%edx
    ad4f:	44 0f 43 ee          	cmovae %esi,%r13d
    ad53:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
    ad58:	89 f0                	mov    %esi,%eax
    ad5a:	c1 e8 17             	shr    $0x17,%eax
    ad5d:	0f b6 c0             	movzbl %al,%eax
    ad60:	89 f1                	mov    %esi,%ecx
    ad62:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
    ad68:	8d 90 d4 fe ff ff    	lea    -0x12c(%rax),%edx
    ad6e:	45 31 f6             	xor    %r14d,%r14d
    ad71:	85 c0                	test   %eax,%eax
    ad73:	41 0f 95 c6          	setne  %r14b
    ad77:	bf d5 fe ff ff       	mov    $0xfffffed5,%edi
    ad7c:	0f 45 fa             	cmovne %edx,%edi
    ad7f:	41 c1 e6 17          	shl    $0x17,%r14d
    ad83:	49 09 ce             	or     %rcx,%r14
    ad86:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
    ad8b:	48 85 c9             	test   %rcx,%rcx
    ad8e:	b8 01 00 00 00       	mov    $0x1,%eax
    ad93:	0f 45 c1             	cmovne %ecx,%eax
    ad96:	41 31 f4             	xor    %esi,%r12d
    ad99:	4d 0f af fe          	imul   %r14,%r15
    ad9d:	89 7c 24 58          	mov    %edi,0x58(%rsp)
    ada1:	01 f8                	add    %edi,%eax
    ada3:	41 c1 ec 1f          	shr    $0x1f,%r12d
    ada7:	44 88 64 24 14       	mov    %r12b,0x14(%rsp)
    adac:	4c 89 3c 24          	mov    %r15,(%rsp)
    adb0:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    adb7:	00 00 
    adb9:	89 44 24 10          	mov    %eax,0x10(%rsp)
    adbd:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    adc2:	48 89 e1             	mov    %rsp,%rcx
    adc5:	be 00 00 00 80       	mov    $0x80000000,%esi
    adca:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    adcf:	e8 8c 2e 00 00       	call   dc60 <hyperinterval::ieee::Format::rounded>
    add4:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
    add9:	0f 85 59 fd ff ff    	jne    ab38 <hyperinterval::float::F32Enclosure::corner_image+0x468>
    addf:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
    ade3:	44 8b 64 24 38       	mov    0x38(%rsp),%r12d
    ade8:	48 89 e7             	mov    %rsp,%rdi
    adeb:	be 00 00 00 80       	mov    $0x80000000,%esi
    adf0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    adf5:	e8 26 2e 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    adfa:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    adfe:	0f 85 80 fd ff ff    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    ae04:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
    ae09:	48 89 e7             	mov    %rsp,%rdi
    ae0c:	be 00 00 00 80       	mov    $0x80000000,%esi
    ae11:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ae16:	4c 89 e1             	mov    %r12,%rcx
    ae19:	e8 02 2e 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    ae1e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ae22:	0f 85 5c fd ff ff    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    ae28:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    ae2d:	44 89 f9             	mov    %r15d,%ecx
    ae30:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    ae36:	44 89 e0             	mov    %r12d,%eax
    ae39:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    ae3e:	ba 00 00 00 80       	mov    $0x80000000,%edx
    ae43:	48 29 ca             	sub    %rcx,%rdx
    ae46:	bf 00 00 00 80       	mov    $0x80000000,%edi
    ae4b:	48 09 f9             	or     %rdi,%rcx
    ae4e:	45 85 ff             	test   %r15d,%r15d
    ae51:	48 0f 48 ca          	cmovs  %rdx,%rcx
    ae55:	ba 00 00 00 80       	mov    $0x80000000,%edx
    ae5a:	48 29 c2             	sub    %rax,%rdx
    ae5d:	48 09 f8             	or     %rdi,%rax
    ae60:	45 85 e4             	test   %r12d,%r12d
    ae63:	48 0f 48 c2          	cmovs  %rdx,%rax
    ae67:	48 39 c1             	cmp    %rax,%rcx
    ae6a:	0f 87 19 fd ff ff    	ja     ab89 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    ae70:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
    ae75:	44 89 c2             	mov    %r8d,%edx
    ae78:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    ae7e:	be 00 00 00 80       	mov    $0x80000000,%esi
    ae83:	29 d6                	sub    %edx,%esi
    ae85:	44 89 c2             	mov    %r8d,%edx
    ae88:	09 fa                	or     %edi,%edx
    ae8a:	45 85 c0             	test   %r8d,%r8d
    ae8d:	48 0f 49 f2          	cmovns %rdx,%rsi
    ae91:	39 ce                	cmp    %ecx,%esi
    ae93:	45 0f 46 f8          	cmovbe %r8d,%r15d
    ae97:	44 89 e9             	mov    %r13d,%ecx
    ae9a:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    aea0:	ba 00 00 00 80       	mov    $0x80000000,%edx
    aea5:	29 ca                	sub    %ecx,%edx
    aea7:	44 89 e9             	mov    %r13d,%ecx
    aeaa:	09 f9                	or     %edi,%ecx
    aeac:	45 85 ed             	test   %r13d,%r13d
    aeaf:	48 0f 49 d1          	cmovns %rcx,%rdx
    aeb3:	39 c2                	cmp    %eax,%edx
    aeb5:	45 0f 43 e5          	cmovae %r13d,%r12d
    aeb9:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
    aebe:	33 44 24 48          	xor    0x48(%rsp),%eax
    aec2:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
    aec7:	49 0f af ce          	imul   %r14,%rcx
    aecb:	8b 54 24 58          	mov    0x58(%rsp),%edx
    aecf:	01 da                	add    %ebx,%edx
    aed1:	c1 e8 1f             	shr    $0x1f,%eax
    aed4:	88 44 24 14          	mov    %al,0x14(%rsp)
    aed8:	48 89 0c 24          	mov    %rcx,(%rsp)
    aedc:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    aee3:	00 00 
    aee5:	89 54 24 10          	mov    %edx,0x10(%rsp)
    aee9:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    aeee:	48 89 e1             	mov    %rsp,%rcx
    aef1:	be 00 00 00 80       	mov    $0x80000000,%esi
    aef6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    aefb:	e8 60 2d 00 00       	call   dc60 <hyperinterval::ieee::Format::rounded>
    af00:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
    af05:	0f 85 2d fc ff ff    	jne    ab38 <hyperinterval::float::F32Enclosure::corner_image+0x468>
    af0b:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
    af0f:	44 8b 74 24 38       	mov    0x38(%rsp),%r14d
    af14:	48 89 e7             	mov    %rsp,%rdi
    af17:	be 00 00 00 80       	mov    $0x80000000,%esi
    af1c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    af21:	e8 fa 2c 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    af26:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    af2a:	0f 85 54 fc ff ff    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    af30:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    af35:	48 89 e7             	mov    %rsp,%rdi
    af38:	be 00 00 00 80       	mov    $0x80000000,%esi
    af3d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    af42:	4c 89 f1             	mov    %r14,%rcx
    af45:	e8 d6 2c 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    af4a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    af4e:	0f 85 30 fc ff ff    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    af54:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    af59:	44 89 ea             	mov    %r13d,%edx
    af5c:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    af62:	89 c1                	mov    %eax,%ecx
    af64:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    af6a:	be 00 00 00 80       	mov    $0x80000000,%esi
    af6f:	48 29 d6             	sub    %rdx,%rsi
    af72:	bf 00 00 00 80       	mov    $0x80000000,%edi
    af77:	48 09 fa             	or     %rdi,%rdx
    af7a:	45 85 ed             	test   %r13d,%r13d
    af7d:	48 0f 48 d6          	cmovs  %rsi,%rdx
    af81:	be 00 00 00 80       	mov    $0x80000000,%esi
    af86:	48 29 ce             	sub    %rcx,%rsi
    af89:	48 09 f9             	or     %rdi,%rcx
    af8c:	85 c0                	test   %eax,%eax
    af8e:	48 0f 48 ce          	cmovs  %rsi,%rcx
    af92:	48 39 ca             	cmp    %rcx,%rdx
    af95:	0f 87 ee fb ff ff    	ja     ab89 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    af9b:	44 89 fe             	mov    %r15d,%esi
    af9e:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
    afa4:	44 09 ce             	or     %r9d,%esi
    afa7:	44 89 ff             	mov    %r15d,%edi
    afaa:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    afb0:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    afb6:	41 29 f8             	sub    %edi,%r8d
    afb9:	45 85 ff             	test   %r15d,%r15d
    afbc:	4c 0f 49 c6          	cmovns %rsi,%r8
    afc0:	41 39 d0             	cmp    %edx,%r8d
    afc3:	45 0f 46 ef          	cmovbe %r15d,%r13d
    afc7:	44 89 e2             	mov    %r12d,%edx
    afca:	44 09 ca             	or     %r9d,%edx
    afcd:	44 89 e6             	mov    %r12d,%esi
    afd0:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
    afd6:	41 29 f1             	sub    %esi,%r9d
    afd9:	45 85 e4             	test   %r12d,%r12d
    afdc:	4c 0f 49 ca          	cmovns %rdx,%r9
    afe0:	41 39 c9             	cmp    %ecx,%r9d
    afe3:	41 0f 43 c4          	cmovae %r12d,%eax
    afe7:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
    afec:	c7 01 01 00 00 00    	movl   $0x1,(%rcx)
    aff2:	44 89 69 04          	mov    %r13d,0x4(%rcx)
    aff6:	89 41 08             	mov    %eax,0x8(%rcx)
    aff9:	e9 9a fb ff ff       	jmp    ab98 <hyperinterval::float::F32Enclosure::corner_image+0x4c8>
    affe:	66 90                	xchg   %ax,%ax

hyperinterval::float::F32Enclosure::div:
    b000:	53                   	push   %rbx
    b001:	48 89 fb             	mov    %rdi,%rbx
    b004:	f6 02 01             	testb  $0x1,(%rdx)
    b007:	74 4d                	je     b056 <hyperinterval::float::F32Enclosure::div+0x56>
    b009:	8b 42 04             	mov    0x4(%rdx),%eax
    b00c:	b9 00 00 00 80       	mov    $0x80000000,%ecx
    b011:	89 c7                	mov    %eax,%edi
    b013:	09 cf                	or     %ecx,%edi
    b015:	41 89 c0             	mov    %eax,%r8d
    b018:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
    b01f:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
    b025:	45 29 c1             	sub    %r8d,%r9d
    b028:	85 c0                	test   %eax,%eax
    b02a:	4c 0f 49 cf          	cmovns %rdi,%r9
    b02e:	41 39 c9             	cmp    %ecx,%r9d
    b031:	77 23                	ja     b056 <hyperinterval::float::F32Enclosure::div+0x56>
    b033:	8b 42 08             	mov    0x8(%rdx),%eax
    b036:	85 c0                	test   %eax,%eax
    b038:	0f 99 c1             	setns  %cl
    b03b:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
    b040:	0f 94 c0             	sete   %al
    b043:	08 c8                	or     %cl,%al
    b045:	74 0f                	je     b056 <hyperinterval::float::F32Enclosure::div+0x56>
    b047:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
    b04b:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    b051:	48 89 d8             	mov    %rbx,%rax
    b054:	5b                   	pop    %rbx
    b055:	c3                   	ret
    b056:	48 89 df             	mov    %rbx,%rdi
    b059:	b9 01 00 00 00       	mov    $0x1,%ecx
    b05e:	e8 6d f6 ff ff       	call   a6d0 <hyperinterval::float::F32Enclosure::corner_image>
    b063:	48 89 d8             	mov    %rbx,%rax
    b066:	5b                   	pop    %rbx
    b067:	c3                   	ret
    b068:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    b06f:	00 

hyperinterval::float::F32Enclosure::reciprocal:
    b070:	41 57                	push   %r15
    b072:	41 56                	push   %r14
    b074:	41 54                	push   %r12
    b076:	53                   	push   %rbx
    b077:	48 83 ec 28          	sub    $0x28,%rsp
    b07b:	48 89 fb             	mov    %rdi,%rbx
    b07e:	83 3e 00             	cmpl   $0x0,(%rsi)
    b081:	74 5e                	je     b0e1 <hyperinterval::float::F32Enclosure::reciprocal+0x71>
    b083:	49 89 f6             	mov    %rsi,%r14
    b086:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
    b08c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b091:	be 00 00 00 80       	mov    $0x80000000,%esi
    b096:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b09b:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
    b0a0:	e8 7b 2b 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    b0a5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b0aa:	74 25                	je     b0d1 <hyperinterval::float::F32Enclosure::reciprocal+0x61>
    b0ac:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    b0b1:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b0b6:	be 00 00 00 80       	mov    $0x80000000,%esi
    b0bb:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b0c0:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
    b0c5:	e8 56 2b 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    b0ca:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b0cf:	75 25                	jne    b0f6 <hyperinterval::float::F32Enclosure::reciprocal+0x86>
    b0d1:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
    b0d6:	88 4b 04             	mov    %cl,0x4(%rbx)
    b0d9:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    b0df:	eb 06                	jmp    b0e7 <hyperinterval::float::F32Enclosure::reciprocal+0x77>
    b0e1:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
    b0e7:	48 89 d8             	mov    %rbx,%rax
    b0ea:	48 83 c4 28          	add    $0x28,%rsp
    b0ee:	5b                   	pop    %rbx
    b0ef:	41 5c                	pop    %r12
    b0f1:	41 5e                	pop    %r14
    b0f3:	41 5f                	pop    %r15
    b0f5:	c3                   	ret
    b0f6:	8b 44 24 10          	mov    0x10(%rsp),%eax
    b0fa:	44 89 e1             	mov    %r12d,%ecx
    b0fd:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    b103:	89 c2                	mov    %eax,%edx
    b105:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    b10b:	be 00 00 00 80       	mov    $0x80000000,%esi
    b110:	29 ce                	sub    %ecx,%esi
    b112:	44 09 f9             	or     %r15d,%ecx
    b115:	45 85 e4             	test   %r12d,%r12d
    b118:	48 0f 49 f1          	cmovns %rcx,%rsi
    b11c:	bf 00 00 00 80       	mov    $0x80000000,%edi
    b121:	29 d7                	sub    %edx,%edi
    b123:	89 d1                	mov    %edx,%ecx
    b125:	44 09 f9             	or     %r15d,%ecx
    b128:	85 c0                	test   %eax,%eax
    b12a:	48 0f 49 f9          	cmovns %rcx,%rdi
    b12e:	b1 01                	mov    $0x1,%cl
    b130:	39 fe                	cmp    %edi,%esi
    b132:	77 a2                	ja     b0d6 <hyperinterval::float::F32Enclosure::reciprocal+0x66>
    b134:	44 89 e1             	mov    %r12d,%ecx
    b137:	c1 e9 08             	shr    $0x8,%ecx
    b13a:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%rsp)
    b141:	00 
    b142:	44 88 64 24 20       	mov    %r12b,0x20(%rsp)
    b147:	41 c1 ec 18          	shr    $0x18,%r12d
    b14b:	44 88 64 24 23       	mov    %r12b,0x23(%rsp)
    b150:	66 89 4c 24 21       	mov    %cx,0x21(%rsp)
    b155:	89 44 24 24          	mov    %eax,0x24(%rsp)
    b159:	41 8b 46 04          	mov    0x4(%r14),%eax
    b15d:	89 c1                	mov    %eax,%ecx
    b15f:	44 09 f9             	or     %r15d,%ecx
    b162:	89 c2                	mov    %eax,%edx
    b164:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    b16a:	be 00 00 00 80       	mov    $0x80000000,%esi
    b16f:	29 d6                	sub    %edx,%esi
    b171:	85 c0                	test   %eax,%eax
    b173:	48 0f 49 f1          	cmovns %rcx,%rsi
    b177:	44 39 fe             	cmp    %r15d,%esi
    b17a:	77 1e                	ja     b19a <hyperinterval::float::F32Enclosure::reciprocal+0x12a>
    b17c:	41 8b 46 08          	mov    0x8(%r14),%eax
    b180:	85 c0                	test   %eax,%eax
    b182:	0f 99 c1             	setns  %cl
    b185:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
    b18a:	0f 94 c0             	sete   %al
    b18d:	08 c8                	or     %cl,%al
    b18f:	74 09                	je     b19a <hyperinterval::float::F32Enclosure::reciprocal+0x12a>
    b191:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
    b195:	e9 3f ff ff ff       	jmp    b0d9 <hyperinterval::float::F32Enclosure::reciprocal+0x69>
    b19a:	48 8d 74 24 1c       	lea    0x1c(%rsp),%rsi
    b19f:	48 89 df             	mov    %rbx,%rdi
    b1a2:	4c 89 f2             	mov    %r14,%rdx
    b1a5:	b9 01 00 00 00       	mov    $0x1,%ecx
    b1aa:	e8 21 f5 ff ff       	call   a6d0 <hyperinterval::float::F32Enclosure::corner_image>
    b1af:	e9 33 ff ff ff       	jmp    b0e7 <hyperinterval::float::F32Enclosure::reciprocal+0x77>
    b1b4:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    b1bb:	00 00 00 
    b1be:	66 90                	xchg   %ax,%ax

hyperinterval::float::F32Enclosure::square:
    b1c0:	55                   	push   %rbp
    b1c1:	41 57                	push   %r15
    b1c3:	41 56                	push   %r14
    b1c5:	41 55                	push   %r13
    b1c7:	41 54                	push   %r12
    b1c9:	53                   	push   %rbx
    b1ca:	48 83 ec 48          	sub    $0x48,%rsp
    b1ce:	48 89 fb             	mov    %rdi,%rbx
    b1d1:	f6 06 01             	testb  $0x1,(%rsi)
    b1d4:	0f 84 d8 00 00 00    	je     b2b2 <hyperinterval::float::F32Enclosure::square+0xf2>
    b1da:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
    b1de:	44 8b 76 08          	mov    0x8(%rsi),%r14d
    b1e2:	44 89 f8             	mov    %r15d,%eax
    b1e5:	c1 e8 17             	shr    $0x17,%eax
    b1e8:	0f b6 c8             	movzbl %al,%ecx
    b1eb:	44 89 fa             	mov    %r15d,%edx
    b1ee:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
    b1f4:	31 c0                	xor    %eax,%eax
    b1f6:	85 c9                	test   %ecx,%ecx
    b1f8:	8d 8c 09 d4 fe ff ff 	lea    -0x12c(%rcx,%rcx,1),%ecx
    b1ff:	41 bc d6 fe ff ff    	mov    $0xfffffed6,%r12d
    b205:	41 0f 44 cc          	cmove  %r12d,%ecx
    b209:	0f 95 c0             	setne  %al
    b20c:	c1 e0 17             	shl    $0x17,%eax
    b20f:	48 09 d0             	or     %rdx,%rax
    b212:	48 f7 e0             	mul    %rax
    b215:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
    b21a:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    b21f:	48 89 04 24          	mov    %rax,(%rsp)
    b223:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
    b227:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
    b22c:	48 89 e1             	mov    %rsp,%rcx
    b22f:	be 00 00 00 80       	mov    $0x80000000,%esi
    b234:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b239:	e8 22 2a 00 00       	call   dc60 <hyperinterval::ieee::Format::rounded>
    b23e:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
    b243:	75 66                	jne    b2ab <hyperinterval::float::F32Enclosure::square+0xeb>
    b245:	44 8b 6c 24 38       	mov    0x38(%rsp),%r13d
    b24a:	8b 6c 24 40          	mov    0x40(%rsp),%ebp
    b24e:	44 89 f0             	mov    %r14d,%eax
    b251:	c1 e8 17             	shr    $0x17,%eax
    b254:	0f b6 c8             	movzbl %al,%ecx
    b257:	44 89 f2             	mov    %r14d,%edx
    b25a:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
    b260:	31 c0                	xor    %eax,%eax
    b262:	85 c9                	test   %ecx,%ecx
    b264:	8d 8c 09 d4 fe ff ff 	lea    -0x12c(%rcx,%rcx,1),%ecx
    b26b:	41 0f 44 cc          	cmove  %r12d,%ecx
    b26f:	0f 95 c0             	setne  %al
    b272:	c1 e0 17             	shl    $0x17,%eax
    b275:	48 09 d0             	or     %rdx,%rax
    b278:	48 f7 e0             	mul    %rax
    b27b:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
    b280:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    b285:	48 89 04 24          	mov    %rax,(%rsp)
    b289:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
    b28d:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
    b292:	48 89 e1             	mov    %rsp,%rcx
    b295:	be 00 00 00 80       	mov    $0x80000000,%esi
    b29a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b29f:	e8 bc 29 00 00       	call   dc60 <hyperinterval::ieee::Format::rounded>
    b2a4:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
    b2a9:	75 0f                	jne    b2ba <hyperinterval::float::F32Enclosure::square+0xfa>
    b2ab:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
    b2b0:	eb 59                	jmp    b30b <hyperinterval::float::F32Enclosure::square+0x14b>
    b2b2:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
    b2b8:	eb 5a                	jmp    b314 <hyperinterval::float::F32Enclosure::square+0x154>
    b2ba:	8b 44 24 38          	mov    0x38(%rsp),%eax
    b2be:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    b2c3:	44 8b 64 24 40       	mov    0x40(%rsp),%r12d
    b2c8:	48 89 e7             	mov    %rsp,%rdi
    b2cb:	be 00 00 00 80       	mov    $0x80000000,%esi
    b2d0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b2d5:	4c 89 e9             	mov    %r13,%rcx
    b2d8:	e8 43 29 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    b2dd:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    b2e1:	74 23                	je     b306 <hyperinterval::float::F32Enclosure::square+0x146>
    b2e3:	4d 89 e5             	mov    %r12,%r13
    b2e6:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    b2eb:	48 89 e7             	mov    %rsp,%rdi
    b2ee:	be 00 00 00 80       	mov    $0x80000000,%esi
    b2f3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b2f8:	48 89 e9             	mov    %rbp,%rcx
    b2fb:	e8 20 29 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    b300:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    b304:	75 20                	jne    b326 <hyperinterval::float::F32Enclosure::square+0x166>
    b306:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    b30b:	88 43 04             	mov    %al,0x4(%rbx)
    b30e:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    b314:	48 89 d8             	mov    %rbx,%rax
    b317:	48 83 c4 48          	add    $0x48,%rsp
    b31b:	5b                   	pop    %rbx
    b31c:	41 5c                	pop    %r12
    b31e:	41 5d                	pop    %r13
    b320:	41 5e                	pop    %r14
    b322:	41 5f                	pop    %r15
    b324:	5d                   	pop    %rbp
    b325:	c3                   	ret
    b326:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
    b32a:	44 89 e0             	mov    %r12d,%eax
    b32d:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    b332:	89 e9                	mov    %ebp,%ecx
    b334:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    b33a:	ba 00 00 00 80       	mov    $0x80000000,%edx
    b33f:	29 c2                	sub    %eax,%edx
    b341:	bf 00 00 00 80       	mov    $0x80000000,%edi
    b346:	09 f8                	or     %edi,%eax
    b348:	45 85 e4             	test   %r12d,%r12d
    b34b:	48 0f 49 d0          	cmovns %rax,%rdx
    b34f:	be 00 00 00 80       	mov    $0x80000000,%esi
    b354:	29 ce                	sub    %ecx,%esi
    b356:	89 c8                	mov    %ecx,%eax
    b358:	09 f8                	or     %edi,%eax
    b35a:	85 ed                	test   %ebp,%ebp
    b35c:	48 0f 49 f0          	cmovns %rax,%rsi
    b360:	b0 01                	mov    $0x1,%al
    b362:	39 f2                	cmp    %esi,%edx
    b364:	77 a5                	ja     b30b <hyperinterval::float::F32Enclosure::square+0x14b>
    b366:	48 89 e7             	mov    %rsp,%rdi
    b369:	be 00 00 00 80       	mov    $0x80000000,%esi
    b36e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b373:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    b378:	e8 a3 28 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    b37d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    b381:	74 83                	je     b306 <hyperinterval::float::F32Enclosure::square+0x146>
    b383:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    b388:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    b38d:	48 89 e7             	mov    %rsp,%rdi
    b390:	be 00 00 00 80       	mov    $0x80000000,%esi
    b395:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b39a:	4c 89 e9             	mov    %r13,%rcx
    b39d:	e8 7e 28 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    b3a2:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    b3a6:	0f 84 5a ff ff ff    	je     b306 <hyperinterval::float::F32Enclosure::square+0x146>
    b3ac:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    b3b0:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
    b3b5:	89 d0                	mov    %edx,%eax
    b3b7:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    b3bc:	41 89 c8             	mov    %ecx,%r8d
    b3bf:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
    b3c6:	be 00 00 00 80       	mov    $0x80000000,%esi
    b3cb:	29 c6                	sub    %eax,%esi
    b3cd:	bf 00 00 00 80       	mov    $0x80000000,%edi
    b3d2:	09 f8                	or     %edi,%eax
    b3d4:	85 d2                	test   %edx,%edx
    b3d6:	48 0f 49 f0          	cmovns %rax,%rsi
    b3da:	44 89 c0             	mov    %r8d,%eax
    b3dd:	09 f8                	or     %edi,%eax
    b3df:	44 29 c7             	sub    %r8d,%edi
    b3e2:	85 c9                	test   %ecx,%ecx
    b3e4:	48 0f 49 f8          	cmovns %rax,%rdi
    b3e8:	b0 01                	mov    $0x1,%al
    b3ea:	39 fe                	cmp    %edi,%esi
    b3ec:	0f 87 19 ff ff ff    	ja     b30b <hyperinterval::float::F32Enclosure::square+0x14b>
    b3f2:	44 89 e7             	mov    %r12d,%edi
    b3f5:	89 ee                	mov    %ebp,%esi
    b3f7:	e8 74 26 00 00       	call   da70 <hyperinterval::bounds::Bounds<T>::hull>
    b3fc:	41 89 c4             	mov    %eax,%r12d
    b3ff:	89 d5                	mov    %edx,%ebp
    b401:	44 89 ff             	mov    %r15d,%edi
    b404:	44 89 f6             	mov    %r14d,%esi
    b407:	31 d2                	xor    %edx,%edx
    b409:	e8 f2 26 00 00       	call   db00 <hyperinterval::bounds::Bounds<T>::signs>
    b40e:	a8 02                	test   $0x2,%al
    b410:	75 12                	jne    b424 <hyperinterval::float::F32Enclosure::square+0x264>
    b412:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
    b418:	44 89 63 04          	mov    %r12d,0x4(%rbx)
    b41c:	89 6b 08             	mov    %ebp,0x8(%rbx)
    b41f:	e9 f0 fe ff ff       	jmp    b314 <hyperinterval::float::F32Enclosure::square+0x154>
    b424:	48 89 e7             	mov    %rsp,%rdi
    b427:	e8 64 ea ff ff       	call   9e90 <hyperinterval::float::F32Enclosure::from_bits>
    b42c:	8b 0c 24             	mov    (%rsp),%ecx
    b42f:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
    b434:	83 f9 02             	cmp    $0x2,%ecx
    b437:	0f 84 ce fe ff ff    	je     b30b <hyperinterval::float::F32Enclosure::square+0x14b>
    b43d:	f6 c1 01             	test   $0x1,%cl
    b440:	74 d0                	je     b412 <hyperinterval::float::F32Enclosure::square+0x252>
    b442:	0f b6 c0             	movzbl %al,%eax
    b445:	0f b6 4c 24 07       	movzbl 0x7(%rsp),%ecx
    b44a:	c1 e1 10             	shl    $0x10,%ecx
    b44d:	0f b7 54 24 05       	movzwl 0x5(%rsp),%edx
    b452:	09 ca                	or     %ecx,%edx
    b454:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    b458:	c1 e2 08             	shl    $0x8,%edx
    b45b:	09 c2                	or     %eax,%edx
    b45d:	44 89 e7             	mov    %r12d,%edi
    b460:	89 ee                	mov    %ebp,%esi
    b462:	e8 09 26 00 00       	call   da70 <hyperinterval::bounds::Bounds<T>::hull>
    b467:	41 89 c4             	mov    %eax,%r12d
    b46a:	89 d5                	mov    %edx,%ebp
    b46c:	eb a4                	jmp    b412 <hyperinterval::float::F32Enclosure::square+0x252>
    b46e:	66 90                	xchg   %ax,%ax

hyperinterval::float::F32Enclosure::checked_pow:
    b470:	55                   	push   %rbp
    b471:	41 57                	push   %r15
    b473:	41 56                	push   %r14
    b475:	41 55                	push   %r13
    b477:	41 54                	push   %r12
    b479:	53                   	push   %rbx
    b47a:	48 83 ec 38          	sub    $0x38,%rsp
    b47e:	48 89 fb             	mov    %rdi,%rbx
    b481:	83 fa 02             	cmp    $0x2,%edx
    b484:	75 0e                	jne    b494 <hyperinterval::float::F32Enclosure::checked_pow+0x24>
    b486:	48 89 df             	mov    %rbx,%rdi
    b489:	ff 15 29 3a 05 00    	call   *0x53a29(%rip)        # 5eeb8 <_GLOBAL_OFFSET_TABLE_+0x8c8>
    b48f:	e9 c8 00 00 00       	jmp    b55c <hyperinterval::float::F32Enclosure::checked_pow+0xec>
    b494:	f6 06 01             	testb  $0x1,(%rsi)
    b497:	0f 84 b9 00 00 00    	je     b556 <hyperinterval::float::F32Enclosure::checked_pow+0xe6>
    b49d:	89 d5                	mov    %edx,%ebp
    b49f:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
    b4a3:	44 8b 76 08          	mov    0x8(%rsi),%r14d
    b4a7:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b4ac:	be 00 00 00 80       	mov    $0x80000000,%esi
    b4b1:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b4b6:	4c 89 f9             	mov    %r15,%rcx
    b4b9:	41 89 e8             	mov    %ebp,%r8d
    b4bc:	e8 8f 31 00 00       	call   e650 <hyperinterval::ieee::Format::power>
    b4c1:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
    b4c6:	75 7e                	jne    b546 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
    b4c8:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
    b4cd:	44 8b 6c 24 18       	mov    0x18(%rsp),%r13d
    b4d2:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b4d7:	be 00 00 00 80       	mov    $0x80000000,%esi
    b4dc:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b4e1:	4c 89 f1             	mov    %r14,%rcx
    b4e4:	41 89 e8             	mov    %ebp,%r8d
    b4e7:	e8 64 31 00 00       	call   e650 <hyperinterval::ieee::Format::power>
    b4ec:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b4f1:	74 53                	je     b546 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
    b4f3:	8b 44 24 10          	mov    0x10(%rsp),%eax
    b4f7:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    b4fc:	8b 44 24 18          	mov    0x18(%rsp),%eax
    b500:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
    b505:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b50a:	be 00 00 00 80       	mov    $0x80000000,%esi
    b50f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b514:	4c 89 e1             	mov    %r12,%rcx
    b517:	e8 04 27 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    b51c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b521:	74 23                	je     b546 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
    b523:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    b528:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b52d:	be 00 00 00 80       	mov    $0x80000000,%esi
    b532:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b537:	4c 89 e9             	mov    %r13,%rcx
    b53a:	e8 e1 26 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    b53f:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b544:	75 28                	jne    b56e <hyperinterval::float::F32Enclosure::checked_pow+0xfe>
    b546:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
    b54b:	88 43 04             	mov    %al,0x4(%rbx)
    b54e:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    b554:	eb 06                	jmp    b55c <hyperinterval::float::F32Enclosure::checked_pow+0xec>
    b556:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
    b55c:	48 89 d8             	mov    %rbx,%rax
    b55f:	48 83 c4 38          	add    $0x38,%rsp
    b563:	5b                   	pop    %rbx
    b564:	41 5c                	pop    %r12
    b566:	41 5d                	pop    %r13
    b568:	41 5e                	pop    %r14
    b56a:	41 5f                	pop    %r15
    b56c:	5d                   	pop    %rbp
    b56d:	c3                   	ret
    b56e:	8b 7c 24 10          	mov    0x10(%rsp),%edi
    b572:	44 89 e0             	mov    %r12d,%eax
    b575:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    b57a:	89 f9                	mov    %edi,%ecx
    b57c:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    b582:	ba 00 00 00 80       	mov    $0x80000000,%edx
    b587:	29 c2                	sub    %eax,%edx
    b589:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
    b58f:	44 09 e8             	or     %r13d,%eax
    b592:	45 85 e4             	test   %r12d,%r12d
    b595:	48 0f 49 d0          	cmovns %rax,%rdx
    b599:	be 00 00 00 80       	mov    $0x80000000,%esi
    b59e:	29 ce                	sub    %ecx,%esi
    b5a0:	89 c8                	mov    %ecx,%eax
    b5a2:	44 09 e8             	or     %r13d,%eax
    b5a5:	85 ff                	test   %edi,%edi
    b5a7:	48 0f 49 f0          	cmovns %rax,%rsi
    b5ab:	b0 01                	mov    $0x1,%al
    b5ad:	39 f2                	cmp    %esi,%edx
    b5af:	77 9a                	ja     b54b <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
    b5b1:	89 7c 24 2c          	mov    %edi,0x2c(%rsp)
    b5b5:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b5ba:	be 00 00 00 80       	mov    $0x80000000,%esi
    b5bf:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b5c4:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    b5c9:	e8 52 26 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    b5ce:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b5d3:	0f 84 6d ff ff ff    	je     b546 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
    b5d9:	4c 89 64 24 20       	mov    %r12,0x20(%rsp)
    b5de:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    b5e3:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b5e8:	be 00 00 00 80       	mov    $0x80000000,%esi
    b5ed:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b5f2:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
    b5f7:	e8 24 26 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    b5fc:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b601:	0f 84 3f ff ff ff    	je     b546 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
    b607:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
    b60b:	44 89 e0             	mov    %r12d,%eax
    b60e:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    b613:	89 ca                	mov    %ecx,%edx
    b615:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    b61b:	be 00 00 00 80       	mov    $0x80000000,%esi
    b620:	29 c6                	sub    %eax,%esi
    b622:	44 09 e8             	or     %r13d,%eax
    b625:	45 85 e4             	test   %r12d,%r12d
    b628:	48 0f 49 f0          	cmovns %rax,%rsi
    b62c:	89 d0                	mov    %edx,%eax
    b62e:	44 09 e8             	or     %r13d,%eax
    b631:	41 29 d5             	sub    %edx,%r13d
    b634:	85 c9                	test   %ecx,%ecx
    b636:	4c 0f 49 e8          	cmovns %rax,%r13
    b63a:	b0 01                	mov    $0x1,%al
    b63c:	44 39 ee             	cmp    %r13d,%esi
    b63f:	0f 87 06 ff ff ff    	ja     b54b <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
    b645:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
    b64a:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
    b64e:	44 89 e2             	mov    %r12d,%edx
    b651:	e8 1a 24 00 00       	call   da70 <hyperinterval::bounds::Bounds<T>::hull>
    b656:	41 89 c5             	mov    %eax,%r13d
    b659:	41 89 d4             	mov    %edx,%r12d
    b65c:	85 ed                	test   %ebp,%ebp
    b65e:	0f 95 c0             	setne  %al
    b661:	40 f6 c5 01          	test   $0x1,%bpl
    b665:	0f 94 c1             	sete   %cl
    b668:	84 c8                	test   %cl,%al
    b66a:	74 11                	je     b67d <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
    b66c:	44 89 ff             	mov    %r15d,%edi
    b66f:	44 89 f6             	mov    %r14d,%esi
    b672:	31 d2                	xor    %edx,%edx
    b674:	e8 87 24 00 00       	call   db00 <hyperinterval::bounds::Bounds<T>::signs>
    b679:	a8 02                	test   $0x2,%al
    b67b:	75 13                	jne    b690 <hyperinterval::float::F32Enclosure::checked_pow+0x220>
    b67d:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
    b683:	44 89 6b 04          	mov    %r13d,0x4(%rbx)
    b687:	44 89 63 08          	mov    %r12d,0x8(%rbx)
    b68b:	e9 cc fe ff ff       	jmp    b55c <hyperinterval::float::F32Enclosure::checked_pow+0xec>
    b690:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b695:	e8 f6 e7 ff ff       	call   9e90 <hyperinterval::float::F32Enclosure::from_bits>
    b69a:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    b69e:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
    b6a3:	83 f9 02             	cmp    $0x2,%ecx
    b6a6:	0f 84 9f fe ff ff    	je     b54b <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
    b6ac:	f6 c1 01             	test   $0x1,%cl
    b6af:	74 cc                	je     b67d <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
    b6b1:	0f b6 c0             	movzbl %al,%eax
    b6b4:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
    b6b9:	c1 e1 10             	shl    $0x10,%ecx
    b6bc:	0f b7 54 24 0d       	movzwl 0xd(%rsp),%edx
    b6c1:	09 ca                	or     %ecx,%edx
    b6c3:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
    b6c7:	c1 e2 08             	shl    $0x8,%edx
    b6ca:	09 c2                	or     %eax,%edx
    b6cc:	44 89 ef             	mov    %r13d,%edi
    b6cf:	44 89 e6             	mov    %r12d,%esi
    b6d2:	e8 99 23 00 00       	call   da70 <hyperinterval::bounds::Bounds<T>::hull>
    b6d7:	41 89 c5             	mov    %eax,%r13d
    b6da:	41 89 d4             	mov    %edx,%r12d
    b6dd:	eb 9e                	jmp    b67d <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
    b6df:	90                   	nop

hyperinterval::float::F32Enclosure::affine:
    b6e0:	41 56                	push   %r14
    b6e2:	53                   	push   %rbx
    b6e3:	48 83 ec 38          	sub    $0x38,%rsp
    b6e7:	f3 0f 11 4c 24 10    	movss  %xmm1,0x10(%rsp)
    b6ed:	49 89 f6             	mov    %rsi,%r14
    b6f0:	48 89 fb             	mov    %rdi,%rbx
    b6f3:	66 0f 7e c1          	movd   %xmm0,%ecx
    b6f7:	48 89 e7             	mov    %rsp,%rdi
    b6fa:	be 00 00 00 80       	mov    $0x80000000,%esi
    b6ff:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b704:	e8 17 25 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    b709:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    b70d:	74 4a                	je     b759 <hyperinterval::float::F32Enclosure::affine+0x79>
    b70f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    b714:	89 c1                	mov    %eax,%ecx
    b716:	c1 e9 08             	shr    $0x8,%ecx
    b719:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%rsp)
    b720:	00 
    b721:	88 44 24 18          	mov    %al,0x18(%rsp)
    b725:	89 c2                	mov    %eax,%edx
    b727:	c1 ea 18             	shr    $0x18,%edx
    b72a:	88 54 24 1b          	mov    %dl,0x1b(%rsp)
    b72e:	66 89 4c 24 19       	mov    %cx,0x19(%rsp)
    b733:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
    b737:	66 0f 6e 44 24 10    	movd   0x10(%rsp),%xmm0
    b73d:	66 0f 7e c1          	movd   %xmm0,%ecx
    b741:	48 89 e7             	mov    %rsp,%rdi
    b744:	be 00 00 00 80       	mov    $0x80000000,%esi
    b749:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b74e:	e8 cd 24 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    b753:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    b757:	75 19                	jne    b772 <hyperinterval::float::F32Enclosure::affine+0x92>
    b759:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    b75e:	88 43 04             	mov    %al,0x4(%rbx)
    b761:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    b767:	48 89 d8             	mov    %rbx,%rax
    b76a:	48 83 c4 38          	add    $0x38,%rsp
    b76e:	5b                   	pop    %rbx
    b76f:	41 5e                	pop    %r14
    b771:	c3                   	ret
    b772:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    b777:	89 c1                	mov    %eax,%ecx
    b779:	c1 e9 08             	shr    $0x8,%ecx
    b77c:	c7 44 24 20 01 00 00 	movl   $0x1,0x20(%rsp)
    b783:	00 
    b784:	88 44 24 24          	mov    %al,0x24(%rsp)
    b788:	89 c2                	mov    %eax,%edx
    b78a:	c1 ea 18             	shr    $0x18,%edx
    b78d:	88 54 24 27          	mov    %dl,0x27(%rsp)
    b791:	66 89 4c 24 25       	mov    %cx,0x25(%rsp)
    b796:	89 44 24 28          	mov    %eax,0x28(%rsp)
    b79a:	48 89 e7             	mov    %rsp,%rdi
    b79d:	48 8d 54 24 14       	lea    0x14(%rsp),%rdx
    b7a2:	4c 89 f6             	mov    %r14,%rsi
    b7a5:	31 c9                	xor    %ecx,%ecx
    b7a7:	e8 24 ef ff ff       	call   a6d0 <hyperinterval::float::F32Enclosure::corner_image>
    b7ac:	8b 0c 24             	mov    (%rsp),%ecx
    b7af:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
    b7b4:	83 f9 02             	cmp    $0x2,%ecx
    b7b7:	74 a5                	je     b75e <hyperinterval::float::F32Enclosure::affine+0x7e>
    b7b9:	8b 54 24 05          	mov    0x5(%rsp),%edx
    b7bd:	8b 74 24 08          	mov    0x8(%rsp),%esi
    b7c1:	89 74 24 34          	mov    %esi,0x34(%rsp)
    b7c5:	89 54 24 31          	mov    %edx,0x31(%rsp)
    b7c9:	89 4c 24 2c          	mov    %ecx,0x2c(%rsp)
    b7cd:	88 44 24 30          	mov    %al,0x30(%rsp)
    b7d1:	48 8d 74 24 2c       	lea    0x2c(%rsp),%rsi
    b7d6:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
    b7db:	48 89 df             	mov    %rbx,%rdi
    b7de:	ff 15 1c 2f 05 00    	call   *0x52f1c(%rip)        # 5e700 <_GLOBAL_OFFSET_TABLE_+0x110>
    b7e4:	eb 81                	jmp    b767 <hyperinterval::float::F32Enclosure::affine+0x87>
    b7e6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    b7ed:	00 00 00 

hyperinterval::float::F32Enclosure::next_down:
    b7f0:	53                   	push   %rbx
    b7f1:	48 83 ec 10          	sub    $0x10,%rsp
    b7f5:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    b7fa:	66 0f 7e c1          	movd   %xmm0,%ecx
    b7fe:	48 89 e7             	mov    %rsp,%rdi
    b801:	be 00 00 00 80       	mov    $0x80000000,%esi
    b806:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b80b:	e8 10 24 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    b810:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    b814:	75 0a                	jne    b820 <hyperinterval::float::F32Enclosure::next_down+0x30>
    b816:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
    b81b:	c1 e1 08             	shl    $0x8,%ecx
    b81e:	eb 3d                	jmp    b85d <hyperinterval::float::F32Enclosure::next_down+0x6d>
    b820:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    b825:	48 89 c1             	mov    %rax,%rcx
    b828:	48 31 d9             	xor    %rbx,%rcx
    b82b:	48 85 c0             	test   %rax,%rax
    b82e:	48 0f 44 c8          	cmove  %rax,%rcx
    b832:	31 c0                	xor    %eax,%eax
    b834:	85 c9                	test   %ecx,%ecx
    b836:	0f 99 c0             	setns  %al
    b839:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
    b83d:	48 ff c9             	dec    %rcx
    b840:	48 89 e7             	mov    %rsp,%rdi
    b843:	be 00 00 00 80       	mov    $0x80000000,%esi
    b848:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b84d:	e8 ce 23 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    b852:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    b856:	75 13                	jne    b86b <hyperinterval::float::F32Enclosure::next_down+0x7b>
    b858:	b9 00 03 00 00       	mov    $0x300,%ecx
    b85d:	b8 01 00 00 00       	mov    $0x1,%eax
    b862:	48 09 c8             	or     %rcx,%rax
    b865:	48 83 c4 10          	add    $0x10,%rsp
    b869:	5b                   	pop    %rbx
    b86a:	c3                   	ret
    b86b:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    b870:	48 89 c1             	mov    %rax,%rcx
    b873:	48 81 f1 00 00 00 80 	xor    $0xffffffff80000000,%rcx
    b87a:	48 c1 e1 20          	shl    $0x20,%rcx
    b87e:	48 85 c0             	test   %rax,%rax
    b881:	48 0f 44 c8          	cmove  %rax,%rcx
    b885:	31 c0                	xor    %eax,%eax
    b887:	48 09 c8             	or     %rcx,%rax
    b88a:	48 83 c4 10          	add    $0x10,%rsp
    b88e:	5b                   	pop    %rbx
    b88f:	c3                   	ret

hyperinterval::float::F32Enclosure::next_up:
    b890:	48 83 ec 18          	sub    $0x18,%rsp
    b894:	66 0f 7e c1          	movd   %xmm0,%ecx
    b898:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b89d:	be 00 00 00 80       	mov    $0x80000000,%esi
    b8a2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b8a7:	e8 74 23 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    b8ac:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b8b1:	75 15                	jne    b8c8 <hyperinterval::float::F32Enclosure::next_up+0x38>
    b8b3:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
    b8b8:	c1 e1 08             	shl    $0x8,%ecx
    b8bb:	b8 01 00 00 00       	mov    $0x1,%eax
    b8c0:	48 09 c8             	or     %rcx,%rax
    b8c3:	48 83 c4 18          	add    $0x18,%rsp
    b8c7:	c3                   	ret
    b8c8:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    b8cd:	31 c9                	xor    %ecx,%ecx
    b8cf:	85 c0                	test   %eax,%eax
    b8d1:	0f 99 c1             	setns  %cl
    b8d4:	48 8d 0c 48          	lea    (%rax,%rcx,2),%rcx
    b8d8:	48 ff c9             	dec    %rcx
    b8db:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b8e0:	be 00 00 00 80       	mov    $0x80000000,%esi
    b8e5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b8ea:	e8 31 23 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    b8ef:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b8f4:	75 12                	jne    b908 <hyperinterval::float::F32Enclosure::next_up+0x78>
    b8f6:	b9 00 03 00 00       	mov    $0x300,%ecx
    b8fb:	b8 01 00 00 00       	mov    $0x1,%eax
    b900:	48 09 c8             	or     %rcx,%rax
    b903:	48 83 c4 18          	add    $0x18,%rsp
    b907:	c3                   	ret
    b908:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    b90d:	48 c1 e1 20          	shl    $0x20,%rcx
    b911:	31 c0                	xor    %eax,%eax
    b913:	48 09 c8             	or     %rcx,%rax
    b916:	48 83 c4 18          	add    $0x18,%rsp
    b91a:	c3                   	ret
    b91b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

hyperinterval::float::F32Enclosure::expanded:
    b920:	41 57                	push   %r15
    b922:	41 56                	push   %r14
    b924:	41 54                	push   %r12
    b926:	53                   	push   %rbx
    b927:	48 83 ec 18          	sub    $0x18,%rsp
    b92b:	48 89 fb             	mov    %rdi,%rbx
    b92e:	f6 06 01             	testb  $0x1,(%rsi)
    b931:	74 7c                	je     b9af <hyperinterval::float::F32Enclosure::expanded+0x8f>
    b933:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
    b939:	8b 46 04             	mov    0x4(%rsi),%eax
    b93c:	44 8b 76 08          	mov    0x8(%rsi),%r14d
    b940:	8d 88 00 00 00 80    	lea    -0x80000000(%rax),%ecx
    b946:	85 c0                	test   %eax,%eax
    b948:	0f 44 c8             	cmove  %eax,%ecx
    b94b:	31 c0                	xor    %eax,%eax
    b94d:	85 c9                	test   %ecx,%ecx
    b94f:	0f 99 c0             	setns  %al
    b952:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
    b956:	48 ff c9             	dec    %rcx
    b959:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b95e:	be 00 00 00 80       	mov    $0x80000000,%esi
    b963:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b968:	e8 b3 22 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    b96d:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
    b972:	75 2f                	jne    b9a3 <hyperinterval::float::F32Enclosure::expanded+0x83>
    b974:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    b979:	31 c0                	xor    %eax,%eax
    b97b:	45 85 f6             	test   %r14d,%r14d
    b97e:	0f 99 c0             	setns  %al
    b981:	49 8d 0c 46          	lea    (%r14,%rax,2),%rcx
    b985:	48 ff c9             	dec    %rcx
    b988:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b98d:	be 00 00 00 80       	mov    $0x80000000,%esi
    b992:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b997:	e8 84 22 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    b99c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b9a1:	75 21                	jne    b9c4 <hyperinterval::float::F32Enclosure::expanded+0xa4>
    b9a3:	c6 43 04 03          	movb   $0x3,0x4(%rbx)
    b9a7:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    b9ad:	eb 06                	jmp    b9b5 <hyperinterval::float::F32Enclosure::expanded+0x95>
    b9af:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
    b9b5:	48 89 d8             	mov    %rbx,%rax
    b9b8:	48 83 c4 18          	add    $0x18,%rsp
    b9bc:	5b                   	pop    %rbx
    b9bd:	41 5c                	pop    %r12
    b9bf:	41 5e                	pop    %r14
    b9c1:	41 5f                	pop    %r15
    b9c3:	c3                   	ret
    b9c4:	44 89 e1             	mov    %r12d,%ecx
    b9c7:	4c 31 f9             	xor    %r15,%rcx
    b9ca:	4d 85 e4             	test   %r12,%r12
    b9cd:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
    b9d2:	49 0f 44 cc          	cmove  %r12,%rcx
    b9d6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b9db:	be 00 00 00 80       	mov    $0x80000000,%esi
    b9e0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b9e5:	e8 36 22 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    b9ea:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b9ef:	74 23                	je     ba14 <hyperinterval::float::F32Enclosure::expanded+0xf4>
    b9f1:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    b9f6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b9fb:	be 00 00 00 80       	mov    $0x80000000,%esi
    ba00:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ba05:	4c 89 f1             	mov    %r14,%rcx
    ba08:	e8 13 22 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    ba0d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    ba12:	75 10                	jne    ba24 <hyperinterval::float::F32Enclosure::expanded+0x104>
    ba14:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
    ba19:	88 43 04             	mov    %al,0x4(%rbx)
    ba1c:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    ba22:	eb 91                	jmp    b9b5 <hyperinterval::float::F32Enclosure::expanded+0x95>
    ba24:	8b 44 24 10          	mov    0x10(%rsp),%eax
    ba28:	44 89 e1             	mov    %r12d,%ecx
    ba2b:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    ba31:	89 c2                	mov    %eax,%edx
    ba33:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    ba39:	be 00 00 00 80       	mov    $0x80000000,%esi
    ba3e:	29 ce                	sub    %ecx,%esi
    ba40:	44 09 f9             	or     %r15d,%ecx
    ba43:	45 85 e4             	test   %r12d,%r12d
    ba46:	48 0f 49 f1          	cmovns %rcx,%rsi
    ba4a:	89 d1                	mov    %edx,%ecx
    ba4c:	44 09 f9             	or     %r15d,%ecx
    ba4f:	41 29 d7             	sub    %edx,%r15d
    ba52:	85 c0                	test   %eax,%eax
    ba54:	4c 0f 49 f9          	cmovns %rcx,%r15
    ba58:	44 39 fe             	cmp    %r15d,%esi
    ba5b:	76 0f                	jbe    ba6c <hyperinterval::float::F32Enclosure::expanded+0x14c>
    ba5d:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
    ba61:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    ba67:	e9 49 ff ff ff       	jmp    b9b5 <hyperinterval::float::F32Enclosure::expanded+0x95>
    ba6c:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
    ba72:	44 89 63 04          	mov    %r12d,0x4(%rbx)
    ba76:	89 43 08             	mov    %eax,0x8(%rbx)
    ba79:	e9 37 ff ff ff       	jmp    b9b5 <hyperinterval::float::F32Enclosure::expanded+0x95>
    ba7e:	66 90                	xchg   %ax,%ax

hyperinterval::float::F64Enclosure::new:
    ba80:	41 57                	push   %r15
    ba82:	41 56                	push   %r14
    ba84:	41 54                	push   %r12
    ba86:	53                   	push   %rbx
    ba87:	48 83 ec 18          	sub    $0x18,%rsp
    ba8b:	f2 0f 11 4c 24 10    	movsd  %xmm1,0x10(%rsp)
    ba91:	48 89 fb             	mov    %rdi,%rbx
    ba94:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
    ba9b:	00 00 80 
    ba9e:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
    baa5:	00 f0 7f 
    baa8:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    baad:	48 89 e7             	mov    %rsp,%rdi
    bab0:	4c 89 f6             	mov    %r14,%rsi
    bab3:	4c 89 fa             	mov    %r15,%rdx
    bab6:	e8 65 21 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    babb:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    babf:	74 24                	je     bae5 <hyperinterval::float::F64Enclosure::new+0x65>
    bac1:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    bac6:	f3 0f 7e 44 24 10    	movq   0x10(%rsp),%xmm0
    bacc:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    bad1:	48 89 e7             	mov    %rsp,%rdi
    bad4:	4c 89 f6             	mov    %r14,%rsi
    bad7:	4c 89 fa             	mov    %r15,%rdx
    bada:	e8 41 21 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    badf:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    bae3:	75 1e                	jne    bb03 <hyperinterval::float::F64Enclosure::new+0x83>
    bae5:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    baea:	88 43 08             	mov    %al,0x8(%rbx)
    baed:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    baf4:	48 89 d8             	mov    %rbx,%rax
    baf7:	48 83 c4 18          	add    $0x18,%rsp
    bafb:	5b                   	pop    %rbx
    bafc:	41 5c                	pop    %r12
    bafe:	41 5e                	pop    %r14
    bb00:	41 5f                	pop    %r15
    bb02:	c3                   	ret
    bb03:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    bb08:	4c 89 e1             	mov    %r12,%rcx
    bb0b:	4c 09 f1             	or     %r14,%rcx
    bb0e:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
    bb12:	4c 89 e6             	mov    %r12,%rsi
    bb15:	48 21 d6             	and    %rdx,%rsi
    bb18:	4c 89 f7             	mov    %r14,%rdi
    bb1b:	48 29 f7             	sub    %rsi,%rdi
    bb1e:	4d 85 e4             	test   %r12,%r12
    bb21:	48 0f 49 f9          	cmovns %rcx,%rdi
    bb25:	48 89 c1             	mov    %rax,%rcx
    bb28:	4c 09 f1             	or     %r14,%rcx
    bb2b:	48 21 c2             	and    %rax,%rdx
    bb2e:	49 29 d6             	sub    %rdx,%r14
    bb31:	48 85 c0             	test   %rax,%rax
    bb34:	4c 0f 49 f1          	cmovns %rcx,%r14
    bb38:	4c 39 f7             	cmp    %r14,%rdi
    bb3b:	76 06                	jbe    bb43 <hyperinterval::float::F64Enclosure::new+0xc3>
    bb3d:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
    bb41:	eb aa                	jmp    baed <hyperinterval::float::F64Enclosure::new+0x6d>
    bb43:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
    bb4a:	4c 89 63 08          	mov    %r12,0x8(%rbx)
    bb4e:	48 89 43 10          	mov    %rax,0x10(%rbx)
    bb52:	eb a0                	jmp    baf4 <hyperinterval::float::F64Enclosure::new+0x74>
    bb54:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    bb5b:	00 00 00 
    bb5e:	66 90                	xchg   %ax,%ax

hyperinterval::float::F64Enclosure::point:
    bb60:	53                   	push   %rbx
    bb61:	48 83 ec 10          	sub    $0x10,%rsp
    bb65:	48 89 fb             	mov    %rdi,%rbx
    bb68:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    bb6d:	48 89 e7             	mov    %rsp,%rdi
    bb70:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    bb77:	00 00 80 
    bb7a:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
    bb81:	00 f0 7f 
    bb84:	e8 97 20 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    bb89:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    bb8d:	75 0f                	jne    bb9e <hyperinterval::float::F64Enclosure::point+0x3e>
    bb8f:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    bb94:	88 43 08             	mov    %al,0x8(%rbx)
    bb97:	b8 02 00 00 00       	mov    $0x2,%eax
    bb9c:	eb 12                	jmp    bbb0 <hyperinterval::float::F64Enclosure::point+0x50>
    bb9e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    bba3:	48 89 43 08          	mov    %rax,0x8(%rbx)
    bba7:	48 89 43 10          	mov    %rax,0x10(%rbx)
    bbab:	b8 01 00 00 00       	mov    $0x1,%eax
    bbb0:	48 89 03             	mov    %rax,(%rbx)
    bbb3:	48 89 d8             	mov    %rbx,%rax
    bbb6:	48 83 c4 10          	add    $0x10,%rsp
    bbba:	5b                   	pop    %rbx
    bbbb:	c3                   	ret
    bbbc:	0f 1f 40 00          	nopl   0x0(%rax)

hyperinterval::float::F64Enclosure::from_bits:
    bbc0:	41 57                	push   %r15
    bbc2:	41 56                	push   %r14
    bbc4:	41 54                	push   %r12
    bbc6:	53                   	push   %rbx
    bbc7:	48 83 ec 18          	sub    $0x18,%rsp
    bbcb:	48 89 fb             	mov    %rdi,%rbx
    bbce:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
    bbd5:	00 00 80 
    bbd8:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
    bbdf:	00 f0 7f 
    bbe2:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bbe7:	4c 89 f6             	mov    %r14,%rsi
    bbea:	4c 89 fa             	mov    %r15,%rdx
    bbed:	31 c9                	xor    %ecx,%ecx
    bbef:	e8 2c 20 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    bbf4:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bbf9:	74 1e                	je     bc19 <hyperinterval::float::F64Enclosure::from_bits+0x59>
    bbfb:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    bc00:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bc05:	4c 89 f6             	mov    %r14,%rsi
    bc08:	4c 89 fa             	mov    %r15,%rdx
    bc0b:	31 c9                	xor    %ecx,%ecx
    bc0d:	e8 0e 20 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    bc12:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bc17:	75 1b                	jne    bc34 <hyperinterval::float::F64Enclosure::from_bits+0x74>
    bc19:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
    bc1e:	88 43 08             	mov    %al,0x8(%rbx)
    bc21:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    bc28:	48 83 c4 18          	add    $0x18,%rsp
    bc2c:	5b                   	pop    %rbx
    bc2d:	41 5c                	pop    %r12
    bc2f:	41 5e                	pop    %r14
    bc31:	41 5f                	pop    %r15
    bc33:	c3                   	ret
    bc34:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    bc39:	4c 89 e1             	mov    %r12,%rcx
    bc3c:	4c 09 f1             	or     %r14,%rcx
    bc3f:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
    bc43:	4c 89 e6             	mov    %r12,%rsi
    bc46:	48 21 d6             	and    %rdx,%rsi
    bc49:	4c 89 f7             	mov    %r14,%rdi
    bc4c:	48 29 f7             	sub    %rsi,%rdi
    bc4f:	4d 85 e4             	test   %r12,%r12
    bc52:	48 0f 49 f9          	cmovns %rcx,%rdi
    bc56:	48 89 c1             	mov    %rax,%rcx
    bc59:	4c 09 f1             	or     %r14,%rcx
    bc5c:	48 21 c2             	and    %rax,%rdx
    bc5f:	49 29 d6             	sub    %rdx,%r14
    bc62:	48 85 c0             	test   %rax,%rax
    bc65:	4c 0f 49 f1          	cmovns %rcx,%r14
    bc69:	4c 39 f7             	cmp    %r14,%rdi
    bc6c:	76 06                	jbe    bc74 <hyperinterval::float::F64Enclosure::from_bits+0xb4>
    bc6e:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
    bc72:	eb ad                	jmp    bc21 <hyperinterval::float::F64Enclosure::from_bits+0x61>
    bc74:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
    bc7b:	4c 89 63 08          	mov    %r12,0x8(%rbx)
    bc7f:	48 89 43 10          	mov    %rax,0x10(%rbx)
    bc83:	eb a3                	jmp    bc28 <hyperinterval::float::F64Enclosure::from_bits+0x68>
    bc85:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    bc8c:	00 00 00 
    bc8f:	90                   	nop

hyperinterval::float::F64Enclosure::contains_point:
    bc90:	41 56                	push   %r14
    bc92:	53                   	push   %rbx
    bc93:	48 83 ec 18          	sub    $0x18,%rsp
    bc97:	49 89 fe             	mov    %rdi,%r14
    bc9a:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
    bca1:	00 00 80 
    bca4:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    bca9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bcae:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
    bcb5:	00 f0 7f 
    bcb8:	48 89 de             	mov    %rbx,%rsi
    bcbb:	e8 60 1f 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    bcc0:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
    bcc5:	3c 01                	cmp    $0x1,%al
    bcc7:	75 0d                	jne    bcd6 <hyperinterval::float::F64Enclosure::contains_point+0x46>
    bcc9:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
    bcce:	48 83 c4 18          	add    $0x18,%rsp
    bcd2:	5b                   	pop    %rbx
    bcd3:	41 5e                	pop    %r14
    bcd5:	c3                   	ret
    bcd6:	41 f6 06 01          	testb  $0x1,(%r14)
    bcda:	74 44                	je     bd20 <hyperinterval::float::F64Enclosure::contains_point+0x90>
    bcdc:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
    bce1:	49 8b 56 08          	mov    0x8(%r14),%rdx
    bce5:	48 89 d7             	mov    %rdx,%rdi
    bce8:	48 09 df             	or     %rbx,%rdi
    bceb:	48 8d 4b ff          	lea    -0x1(%rbx),%rcx
    bcef:	49 89 d0             	mov    %rdx,%r8
    bcf2:	49 21 c8             	and    %rcx,%r8
    bcf5:	49 89 d9             	mov    %rbx,%r9
    bcf8:	4d 29 c1             	sub    %r8,%r9
    bcfb:	48 85 d2             	test   %rdx,%rdx
    bcfe:	4c 0f 49 cf          	cmovns %rdi,%r9
    bd02:	48 89 f7             	mov    %rsi,%rdi
    bd05:	48 09 df             	or     %rbx,%rdi
    bd08:	49 89 f0             	mov    %rsi,%r8
    bd0b:	49 21 c8             	and    %rcx,%r8
    bd0e:	48 89 da             	mov    %rbx,%rdx
    bd11:	4c 29 c2             	sub    %r8,%rdx
    bd14:	48 85 f6             	test   %rsi,%rsi
    bd17:	48 0f 49 d7          	cmovns %rdi,%rdx
    bd1b:	49 39 d1             	cmp    %rdx,%r9
    bd1e:	76 0a                	jbe    bd2a <hyperinterval::float::F64Enclosure::contains_point+0x9a>
    bd20:	31 d2                	xor    %edx,%edx
    bd22:	48 83 c4 18          	add    $0x18,%rsp
    bd26:	5b                   	pop    %rbx
    bd27:	41 5e                	pop    %r14
    bd29:	c3                   	ret
    bd2a:	49 8b 76 10          	mov    0x10(%r14),%rsi
    bd2e:	48 89 f7             	mov    %rsi,%rdi
    bd31:	48 09 df             	or     %rbx,%rdi
    bd34:	48 21 f1             	and    %rsi,%rcx
    bd37:	48 29 cb             	sub    %rcx,%rbx
    bd3a:	48 85 f6             	test   %rsi,%rsi
    bd3d:	48 0f 49 df          	cmovns %rdi,%rbx
    bd41:	48 39 da             	cmp    %rbx,%rdx
    bd44:	0f 96 c2             	setbe  %dl
    bd47:	48 83 c4 18          	add    $0x18,%rsp
    bd4b:	5b                   	pop    %rbx
    bd4c:	41 5e                	pop    %r14
    bd4e:	c3                   	ret
    bd4f:	90                   	nop

hyperinterval::float::F64Enclosure::subset_of:
    bd50:	b0 01                	mov    $0x1,%al
    bd52:	f6 07 01             	testb  $0x1,(%rdi)
    bd55:	74 54                	je     bdab <hyperinterval::float::F64Enclosure::subset_of+0x5b>
    bd57:	f6 06 01             	testb  $0x1,(%rsi)
    bd5a:	74 4d                	je     bda9 <hyperinterval::float::F64Enclosure::subset_of+0x59>
    bd5c:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    bd60:	4c 8b 46 08          	mov    0x8(%rsi),%r8
    bd64:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    bd6b:	00 00 80 
    bd6e:	4d 89 c1             	mov    %r8,%r9
    bd71:	49 09 c1             	or     %rax,%r9
    bd74:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
    bd78:	4d 89 c2             	mov    %r8,%r10
    bd7b:	49 21 ca             	and    %rcx,%r10
    bd7e:	49 89 c3             	mov    %rax,%r11
    bd81:	4d 29 d3             	sub    %r10,%r11
    bd84:	4d 85 c0             	test   %r8,%r8
    bd87:	4d 0f 49 d9          	cmovns %r9,%r11
    bd8b:	49 89 d0             	mov    %rdx,%r8
    bd8e:	49 09 c0             	or     %rax,%r8
    bd91:	49 89 d1             	mov    %rdx,%r9
    bd94:	49 21 c9             	and    %rcx,%r9
    bd97:	49 89 c2             	mov    %rax,%r10
    bd9a:	4d 29 ca             	sub    %r9,%r10
    bd9d:	48 85 d2             	test   %rdx,%rdx
    bda0:	4d 0f 49 d0          	cmovns %r8,%r10
    bda4:	4d 39 d3             	cmp    %r10,%r11
    bda7:	76 03                	jbe    bdac <hyperinterval::float::F64Enclosure::subset_of+0x5c>
    bda9:	31 c0                	xor    %eax,%eax
    bdab:	c3                   	ret
    bdac:	48 8b 57 10          	mov    0x10(%rdi),%rdx
    bdb0:	48 89 d7             	mov    %rdx,%rdi
    bdb3:	48 09 c7             	or     %rax,%rdi
    bdb6:	49 89 d0             	mov    %rdx,%r8
    bdb9:	49 21 c8             	and    %rcx,%r8
    bdbc:	49 89 c1             	mov    %rax,%r9
    bdbf:	4d 29 c1             	sub    %r8,%r9
    bdc2:	48 85 d2             	test   %rdx,%rdx
    bdc5:	4c 0f 49 cf          	cmovns %rdi,%r9
    bdc9:	48 8b 56 10          	mov    0x10(%rsi),%rdx
    bdcd:	48 89 d6             	mov    %rdx,%rsi
    bdd0:	48 09 c6             	or     %rax,%rsi
    bdd3:	48 21 d1             	and    %rdx,%rcx
    bdd6:	48 29 c8             	sub    %rcx,%rax
    bdd9:	48 85 d2             	test   %rdx,%rdx
    bddc:	48 0f 49 c6          	cmovns %rsi,%rax
    bde0:	49 39 c1             	cmp    %rax,%r9
    bde3:	0f 96 c0             	setbe  %al
    bde6:	c3                   	ret
    bde7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    bdee:	00 00 

hyperinterval::float::F64Enclosure::interior_subset_of:
    bdf0:	b0 01                	mov    $0x1,%al
    bdf2:	f6 07 01             	testb  $0x1,(%rdi)
    bdf5:	0f 84 93 00 00 00    	je     be8e <hyperinterval::float::F64Enclosure::interior_subset_of+0x9e>
    bdfb:	f6 06 01             	testb  $0x1,(%rsi)
    bdfe:	0f 84 88 00 00 00    	je     be8c <hyperinterval::float::F64Enclosure::interior_subset_of+0x9c>
    be04:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    be08:	4c 8b 46 08          	mov    0x8(%rsi),%r8
    be0c:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    be13:	00 00 80 
    be16:	4d 89 c1             	mov    %r8,%r9
    be19:	49 09 c1             	or     %rax,%r9
    be1c:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
    be20:	4d 89 c2             	mov    %r8,%r10
    be23:	49 21 ca             	and    %rcx,%r10
    be26:	49 89 c3             	mov    %rax,%r11
    be29:	4d 29 d3             	sub    %r10,%r11
    be2c:	4d 85 c0             	test   %r8,%r8
    be2f:	4d 0f 49 d9          	cmovns %r9,%r11
    be33:	49 89 d0             	mov    %rdx,%r8
    be36:	49 09 c0             	or     %rax,%r8
    be39:	49 89 d1             	mov    %rdx,%r9
    be3c:	49 21 c9             	and    %rcx,%r9
    be3f:	49 89 c2             	mov    %rax,%r10
    be42:	4d 29 ca             	sub    %r9,%r10
    be45:	48 85 d2             	test   %rdx,%rdx
    be48:	4d 0f 49 d0          	cmovns %r8,%r10
    be4c:	4d 39 d3             	cmp    %r10,%r11
    be4f:	73 3b                	jae    be8c <hyperinterval::float::F64Enclosure::interior_subset_of+0x9c>
    be51:	48 8b 57 10          	mov    0x10(%rdi),%rdx
    be55:	48 8b 76 10          	mov    0x10(%rsi),%rsi
    be59:	48 89 d7             	mov    %rdx,%rdi
    be5c:	48 09 c7             	or     %rax,%rdi
    be5f:	49 89 d0             	mov    %rdx,%r8
    be62:	49 21 c8             	and    %rcx,%r8
    be65:	49 89 c1             	mov    %rax,%r9
    be68:	4d 29 c1             	sub    %r8,%r9
    be6b:	48 85 d2             	test   %rdx,%rdx
    be6e:	4c 0f 49 cf          	cmovns %rdi,%r9
    be72:	48 89 f2             	mov    %rsi,%rdx
    be75:	48 09 c2             	or     %rax,%rdx
    be78:	48 21 f1             	and    %rsi,%rcx
    be7b:	48 29 c8             	sub    %rcx,%rax
    be7e:	48 85 f6             	test   %rsi,%rsi
    be81:	48 0f 49 c2          	cmovns %rdx,%rax
    be85:	49 39 c1             	cmp    %rax,%r9
    be88:	0f 92 c0             	setb   %al
    be8b:	c3                   	ret
    be8c:	31 c0                	xor    %eax,%eax
    be8e:	c3                   	ret
    be8f:	90                   	nop

hyperinterval::float::F64Enclosure::disjoint:
    be90:	48 83 3f 00          	cmpq   $0x0,(%rdi)
    be94:	0f 94 c0             	sete   %al
    be97:	48 8b 0e             	mov    (%rsi),%rcx
    be9a:	48 85 c9             	test   %rcx,%rcx
    be9d:	0f 94 c2             	sete   %dl
    bea0:	08 c2                	or     %al,%dl
    bea2:	b0 01                	mov    $0x1,%al
    bea4:	74 01                	je     bea7 <hyperinterval::float::F64Enclosure::disjoint+0x17>
    bea6:	c3                   	ret
    bea7:	f6 c1 01             	test   $0x1,%cl
    beaa:	0f 84 8a 00 00 00    	je     bf3a <hyperinterval::float::F64Enclosure::disjoint+0xaa>
    beb0:	53                   	push   %rbx
    beb1:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
    beb8:	00 00 80 
    bebb:	4c 8b 46 08          	mov    0x8(%rsi),%r8
    bebf:	4c 8b 4f 10          	mov    0x10(%rdi),%r9
    bec3:	4d 89 ca             	mov    %r9,%r10
    bec6:	49 09 ca             	or     %rcx,%r10
    bec9:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
    becd:	4d 89 cb             	mov    %r9,%r11
    bed0:	49 21 d3             	and    %rdx,%r11
    bed3:	48 89 cb             	mov    %rcx,%rbx
    bed6:	4c 29 db             	sub    %r11,%rbx
    bed9:	4d 85 c9             	test   %r9,%r9
    bedc:	49 0f 49 da          	cmovns %r10,%rbx
    bee0:	4d 89 c1             	mov    %r8,%r9
    bee3:	49 09 c9             	or     %rcx,%r9
    bee6:	4d 89 c2             	mov    %r8,%r10
    bee9:	49 21 d2             	and    %rdx,%r10
    beec:	49 89 cb             	mov    %rcx,%r11
    beef:	4d 29 d3             	sub    %r10,%r11
    bef2:	4d 85 c0             	test   %r8,%r8
    bef5:	4d 0f 49 d9          	cmovns %r9,%r11
    bef9:	4c 39 db             	cmp    %r11,%rbx
    befc:	5b                   	pop    %rbx
    befd:	72 a7                	jb     bea6 <hyperinterval::float::F64Enclosure::disjoint+0x16>
    beff:	48 8b 47 08          	mov    0x8(%rdi),%rax
    bf03:	48 8b 76 10          	mov    0x10(%rsi),%rsi
    bf07:	48 89 f7             	mov    %rsi,%rdi
    bf0a:	48 09 cf             	or     %rcx,%rdi
    bf0d:	49 89 f0             	mov    %rsi,%r8
    bf10:	49 21 d0             	and    %rdx,%r8
    bf13:	49 89 c9             	mov    %rcx,%r9
    bf16:	4d 29 c1             	sub    %r8,%r9
    bf19:	48 85 f6             	test   %rsi,%rsi
    bf1c:	4c 0f 49 cf          	cmovns %rdi,%r9
    bf20:	48 89 c6             	mov    %rax,%rsi
    bf23:	48 09 ce             	or     %rcx,%rsi
    bf26:	48 21 c2             	and    %rax,%rdx
    bf29:	48 29 d1             	sub    %rdx,%rcx
    bf2c:	48 85 c0             	test   %rax,%rax
    bf2f:	48 0f 49 ce          	cmovns %rsi,%rcx
    bf33:	49 39 c9             	cmp    %rcx,%r9
    bf36:	0f 92 c0             	setb   %al
    bf39:	c3                   	ret
    bf3a:	31 c0                	xor    %eax,%eax
    bf3c:	c3                   	ret
    bf3d:	0f 1f 00             	nopl   (%rax)

hyperinterval::float::F64Enclosure::overlaps:
    bf40:	48 83 3f 00          	cmpq   $0x0,(%rdi)
    bf44:	0f 94 c0             	sete   %al
    bf47:	48 8b 0e             	mov    (%rsi),%rcx
    bf4a:	48 85 c9             	test   %rcx,%rcx
    bf4d:	0f 94 c2             	sete   %dl
    bf50:	08 c2                	or     %al,%dl
    bf52:	74 03                	je     bf57 <hyperinterval::float::F64Enclosure::overlaps+0x17>
    bf54:	31 c0                	xor    %eax,%eax
    bf56:	c3                   	ret
    bf57:	b0 01                	mov    $0x1,%al
    bf59:	f6 c1 01             	test   $0x1,%cl
    bf5c:	0f 84 8a 00 00 00    	je     bfec <hyperinterval::float::F64Enclosure::overlaps+0xac>
    bf62:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    bf69:	00 00 80 
    bf6c:	48 8b 56 08          	mov    0x8(%rsi),%rdx
    bf70:	4c 8b 47 10          	mov    0x10(%rdi),%r8
    bf74:	4d 89 c1             	mov    %r8,%r9
    bf77:	49 09 c1             	or     %rax,%r9
    bf7a:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
    bf7e:	4d 89 c2             	mov    %r8,%r10
    bf81:	49 21 ca             	and    %rcx,%r10
    bf84:	49 89 c3             	mov    %rax,%r11
    bf87:	4d 29 d3             	sub    %r10,%r11
    bf8a:	4d 85 c0             	test   %r8,%r8
    bf8d:	4d 0f 49 d9          	cmovns %r9,%r11
    bf91:	49 89 d0             	mov    %rdx,%r8
    bf94:	49 09 c0             	or     %rax,%r8
    bf97:	49 89 d1             	mov    %rdx,%r9
    bf9a:	49 21 c9             	and    %rcx,%r9
    bf9d:	49 89 c2             	mov    %rax,%r10
    bfa0:	4d 29 ca             	sub    %r9,%r10
    bfa3:	48 85 d2             	test   %rdx,%rdx
    bfa6:	4d 0f 49 d0          	cmovns %r8,%r10
    bfaa:	4d 39 d3             	cmp    %r10,%r11
    bfad:	73 03                	jae    bfb2 <hyperinterval::float::F64Enclosure::overlaps+0x72>
    bfaf:	31 c0                	xor    %eax,%eax
    bfb1:	c3                   	ret
    bfb2:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    bfb6:	48 8b 76 10          	mov    0x10(%rsi),%rsi
    bfba:	48 89 f7             	mov    %rsi,%rdi
    bfbd:	48 09 c7             	or     %rax,%rdi
    bfc0:	49 89 f0             	mov    %rsi,%r8
    bfc3:	49 21 c8             	and    %rcx,%r8
    bfc6:	49 89 c1             	mov    %rax,%r9
    bfc9:	4d 29 c1             	sub    %r8,%r9
    bfcc:	48 85 f6             	test   %rsi,%rsi
    bfcf:	4c 0f 49 cf          	cmovns %rdi,%r9
    bfd3:	48 89 d6             	mov    %rdx,%rsi
    bfd6:	48 09 c6             	or     %rax,%rsi
    bfd9:	48 21 d1             	and    %rdx,%rcx
    bfdc:	48 29 c8             	sub    %rcx,%rax
    bfdf:	48 85 d2             	test   %rdx,%rdx
    bfe2:	48 0f 49 c6          	cmovns %rsi,%rax
    bfe6:	49 39 c1             	cmp    %rax,%r9
    bfe9:	0f 93 c0             	setae  %al
    bfec:	c3                   	ret
    bfed:	0f 1f 00             	nopl   (%rax)

hyperinterval::float::F64Enclosure::hull:
    bff0:	48 89 f8             	mov    %rdi,%rax
    bff3:	4c 8b 16             	mov    (%rsi),%r10
    bff6:	4c 8b 02             	mov    (%rdx),%r8
    bff9:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
    bffd:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
    c001:	41 f6 c2 01          	test   $0x1,%r10b
    c005:	0f 84 98 00 00 00    	je     c0a3 <hyperinterval::float::F64Enclosure::hull+0xb3>
    c00b:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
    c00f:	48 8b 56 10          	mov    0x10(%rsi),%rdx
    c013:	41 f6 c0 01          	test   $0x1,%r8b
    c017:	0f 84 92 00 00 00    	je     c0af <hyperinterval::float::F64Enclosure::hull+0xbf>
    c01d:	41 56                	push   %r14
    c01f:	53                   	push   %rbx
    c020:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c027:	00 00 80 
    c02a:	4d 89 ca             	mov    %r9,%r10
    c02d:	49 09 f2             	or     %rsi,%r10
    c030:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
    c034:	4d 89 cb             	mov    %r9,%r11
    c037:	4d 21 c3             	and    %r8,%r11
    c03a:	48 89 f3             	mov    %rsi,%rbx
    c03d:	4c 29 db             	sub    %r11,%rbx
    c040:	4d 85 c9             	test   %r9,%r9
    c043:	49 0f 49 da          	cmovns %r10,%rbx
    c047:	49 89 fa             	mov    %rdi,%r10
    c04a:	49 09 f2             	or     %rsi,%r10
    c04d:	49 89 fb             	mov    %rdi,%r11
    c050:	4d 21 c3             	and    %r8,%r11
    c053:	49 89 f6             	mov    %rsi,%r14
    c056:	4d 29 de             	sub    %r11,%r14
    c059:	48 85 ff             	test   %rdi,%rdi
    c05c:	4d 0f 49 f2          	cmovns %r10,%r14
    c060:	4c 39 f3             	cmp    %r14,%rbx
    c063:	49 0f 46 f9          	cmovbe %r9,%rdi
    c067:	49 89 d1             	mov    %rdx,%r9
    c06a:	49 09 f1             	or     %rsi,%r9
    c06d:	49 89 d2             	mov    %rdx,%r10
    c070:	4d 21 c2             	and    %r8,%r10
    c073:	49 89 f3             	mov    %rsi,%r11
    c076:	4d 29 d3             	sub    %r10,%r11
    c079:	48 85 d2             	test   %rdx,%rdx
    c07c:	4d 0f 49 d9          	cmovns %r9,%r11
    c080:	49 89 c9             	mov    %rcx,%r9
    c083:	49 09 f1             	or     %rsi,%r9
    c086:	49 21 c8             	and    %rcx,%r8
    c089:	4c 29 c6             	sub    %r8,%rsi
    c08c:	48 85 c9             	test   %rcx,%rcx
    c08f:	49 0f 49 f1          	cmovns %r9,%rsi
    c093:	49 39 f3             	cmp    %rsi,%r11
    c096:	48 0f 43 ca          	cmovae %rdx,%rcx
    c09a:	41 b8 01 00 00 00    	mov    $0x1,%r8d
    c0a0:	5b                   	pop    %rbx
    c0a1:	41 5e                	pop    %r14
    c0a3:	4c 89 00             	mov    %r8,(%rax)
    c0a6:	48 89 78 08          	mov    %rdi,0x8(%rax)
    c0aa:	48 89 48 10          	mov    %rcx,0x10(%rax)
    c0ae:	c3                   	ret
    c0af:	48 89 d1             	mov    %rdx,%rcx
    c0b2:	4c 89 cf             	mov    %r9,%rdi
    c0b5:	4d 89 d0             	mov    %r10,%r8
    c0b8:	4c 89 00             	mov    %r8,(%rax)
    c0bb:	48 89 78 08          	mov    %rdi,0x8(%rax)
    c0bf:	48 89 48 10          	mov    %rcx,0x10(%rax)
    c0c3:	c3                   	ret
    c0c4:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    c0cb:	00 00 00 
    c0ce:	66 90                	xchg   %ax,%ax

hyperinterval::float::F64Enclosure::intersection:
    c0d0:	48 89 f8             	mov    %rdi,%rax
    c0d3:	f6 06 01             	testb  $0x1,(%rsi)
    c0d6:	0f 84 df 00 00 00    	je     c1bb <hyperinterval::float::F64Enclosure::intersection+0xeb>
    c0dc:	f6 02 01             	testb  $0x1,(%rdx)
    c0df:	0f 84 d6 00 00 00    	je     c1bb <hyperinterval::float::F64Enclosure::intersection+0xeb>
    c0e5:	41 56                	push   %r14
    c0e7:	53                   	push   %rbx
    c0e8:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
    c0ec:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
    c0f0:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
    c0f7:	00 00 80 
    c0fa:	49 89 ca             	mov    %rcx,%r10
    c0fd:	49 09 fa             	or     %rdi,%r10
    c100:	4c 8d 47 ff          	lea    -0x1(%rdi),%r8
    c104:	49 89 cb             	mov    %rcx,%r11
    c107:	4d 21 c3             	and    %r8,%r11
    c10a:	48 89 fb             	mov    %rdi,%rbx
    c10d:	4c 29 db             	sub    %r11,%rbx
    c110:	48 85 c9             	test   %rcx,%rcx
    c113:	49 0f 49 da          	cmovns %r10,%rbx
    c117:	4d 89 ca             	mov    %r9,%r10
    c11a:	49 09 fa             	or     %rdi,%r10
    c11d:	4d 89 cb             	mov    %r9,%r11
    c120:	4d 21 c3             	and    %r8,%r11
    c123:	49 89 fe             	mov    %rdi,%r14
    c126:	4d 29 de             	sub    %r11,%r14
    c129:	4d 85 c9             	test   %r9,%r9
    c12c:	4d 0f 49 f2          	cmovns %r10,%r14
    c130:	48 8b 76 10          	mov    0x10(%rsi),%rsi
    c134:	4c 39 f3             	cmp    %r14,%rbx
    c137:	49 0f 42 c9          	cmovb  %r9,%rcx
    c13b:	48 8b 52 10          	mov    0x10(%rdx),%rdx
    c13f:	49 89 f1             	mov    %rsi,%r9
    c142:	49 09 f9             	or     %rdi,%r9
    c145:	49 89 f2             	mov    %rsi,%r10
    c148:	4d 21 c2             	and    %r8,%r10
    c14b:	49 89 fb             	mov    %rdi,%r11
    c14e:	4d 29 d3             	sub    %r10,%r11
    c151:	48 85 f6             	test   %rsi,%rsi
    c154:	4d 0f 49 d9          	cmovns %r9,%r11
    c158:	49 89 d1             	mov    %rdx,%r9
    c15b:	49 09 f9             	or     %rdi,%r9
    c15e:	49 89 d2             	mov    %rdx,%r10
    c161:	4d 21 c2             	and    %r8,%r10
    c164:	48 89 fb             	mov    %rdi,%rbx
    c167:	4c 29 d3             	sub    %r10,%rbx
    c16a:	48 85 d2             	test   %rdx,%rdx
    c16d:	49 0f 49 d9          	cmovns %r9,%rbx
    c171:	49 39 db             	cmp    %rbx,%r11
    c174:	48 0f 47 f2          	cmova  %rdx,%rsi
    c178:	48 89 ca             	mov    %rcx,%rdx
    c17b:	48 09 fa             	or     %rdi,%rdx
    c17e:	49 89 c9             	mov    %rcx,%r9
    c181:	4d 21 c1             	and    %r8,%r9
    c184:	49 89 fa             	mov    %rdi,%r10
    c187:	4d 29 ca             	sub    %r9,%r10
    c18a:	48 85 c9             	test   %rcx,%rcx
    c18d:	4c 0f 49 d2          	cmovns %rdx,%r10
    c191:	48 89 f2             	mov    %rsi,%rdx
    c194:	48 09 fa             	or     %rdi,%rdx
    c197:	49 21 f0             	and    %rsi,%r8
    c19a:	4c 29 c7             	sub    %r8,%rdi
    c19d:	48 85 f6             	test   %rsi,%rsi
    c1a0:	48 0f 49 fa          	cmovns %rdx,%rdi
    c1a4:	31 d2                	xor    %edx,%edx
    c1a6:	49 39 fa             	cmp    %rdi,%r10
    c1a9:	0f 96 c2             	setbe  %dl
    c1ac:	5b                   	pop    %rbx
    c1ad:	41 5e                	pop    %r14
    c1af:	48 89 10             	mov    %rdx,(%rax)
    c1b2:	48 89 48 08          	mov    %rcx,0x8(%rax)
    c1b6:	48 89 70 10          	mov    %rsi,0x10(%rax)
    c1ba:	c3                   	ret
    c1bb:	31 d2                	xor    %edx,%edx
    c1bd:	48 89 10             	mov    %rdx,(%rax)
    c1c0:	48 89 48 08          	mov    %rcx,0x8(%rax)
    c1c4:	48 89 70 10          	mov    %rsi,0x10(%rax)
    c1c8:	c3                   	ret
    c1c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

hyperinterval::float::F64Enclosure::signs:
    c1d0:	f6 07 01             	testb  $0x1,(%rdi)
    c1d3:	0f 84 81 00 00 00    	je     c25a <hyperinterval::float::F64Enclosure::signs+0x8a>
    c1d9:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    c1e0:	00 00 80 
    c1e3:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    c1e7:	48 8b 4f 10          	mov    0x10(%rdi),%rcx
    c1eb:	48 89 d6             	mov    %rdx,%rsi
    c1ee:	48 09 c6             	or     %rax,%rsi
    c1f1:	4c 8d 48 ff          	lea    -0x1(%rax),%r9
    c1f5:	48 89 d7             	mov    %rdx,%rdi
    c1f8:	4c 21 cf             	and    %r9,%rdi
    c1fb:	49 89 c2             	mov    %rax,%r10
    c1fe:	49 29 fa             	sub    %rdi,%r10
    c201:	48 85 d2             	test   %rdx,%rdx
    c204:	4c 0f 49 d6          	cmovns %rsi,%r10
    c208:	45 31 c0             	xor    %r8d,%r8d
    c20b:	4d 85 d2             	test   %r10,%r10
    c20e:	40 0f 99 c6          	setns  %sil
    c212:	48 89 ca             	mov    %rcx,%rdx
    c215:	48 09 c2             	or     %rax,%rdx
    c218:	49 21 c9             	and    %rcx,%r9
    c21b:	48 89 c7             	mov    %rax,%rdi
    c21e:	4c 29 cf             	sub    %r9,%rdi
    c221:	49 39 c2             	cmp    %rax,%r10
    c224:	77 1c                	ja     c242 <hyperinterval::float::F64Enclosure::signs+0x72>
    c226:	44 8d 4e 02          	lea    0x2(%rsi),%r9d
    c22a:	48 85 ff             	test   %rdi,%rdi
    c22d:	41 88 f0             	mov    %sil,%r8b
    c230:	41 0f b6 f1          	movzbl %r9b,%esi
    c234:	44 0f 48 c6          	cmovs  %esi,%r8d
    c238:	48 85 c9             	test   %rcx,%rcx
    c23b:	44 0f 49 c6          	cmovns %esi,%r8d
    c23f:	44 89 c6             	mov    %r8d,%esi
    c242:	48 85 c9             	test   %rcx,%rcx
    c245:	48 0f 48 d7          	cmovs  %rdi,%rdx
    c249:	8d 4e 04             	lea    0x4(%rsi),%ecx
    c24c:	48 39 c2             	cmp    %rax,%rdx
    c24f:	40 0f b6 d6          	movzbl %sil,%edx
    c253:	0f b6 c1             	movzbl %cl,%eax
    c256:	0f 46 c2             	cmovbe %edx,%eax
    c259:	c3                   	ret
    c25a:	31 c0                	xor    %eax,%eax
    c25c:	c3                   	ret
    c25d:	0f 1f 00             	nopl   (%rax)

hyperinterval::float::F64Enclosure::add:
    c260:	48 89 f8             	mov    %rdi,%rax
    c263:	f6 06 01             	testb  $0x1,(%rsi)
    c266:	0f 84 cb 00 00 00    	je     c337 <hyperinterval::float::F64Enclosure::add+0xd7>
    c26c:	f6 02 01             	testb  $0x1,(%rdx)
    c26f:	0f 84 c2 00 00 00    	je     c337 <hyperinterval::float::F64Enclosure::add+0xd7>
    c275:	55                   	push   %rbp
    c276:	41 57                	push   %r15
    c278:	41 56                	push   %r14
    c27a:	41 55                	push   %r13
    c27c:	41 54                	push   %r12
    c27e:	53                   	push   %rbx
    c27f:	48 83 ec 18          	sub    $0x18,%rsp
    c283:	48 89 c5             	mov    %rax,%rbp
    c286:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
    c28a:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
    c28e:	4c 8b 62 10          	mov    0x10(%rdx),%r12
    c292:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
    c299:	00 00 80 
    c29c:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
    c2a3:	00 f0 7f 
    c2a6:	4c 8b 42 08          	mov    0x8(%rdx),%r8
    c2aa:	48 89 e7             	mov    %rsp,%rdi
    c2ad:	48 89 de             	mov    %rbx,%rsi
    c2b0:	4c 89 f2             	mov    %r14,%rdx
    c2b3:	e8 b8 1c 00 00       	call   df70 <hyperinterval::ieee::Format::add>
    c2b8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    c2bc:	74 57                	je     c315 <hyperinterval::float::F64Enclosure::add+0xb5>
    c2be:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    c2c3:	48 89 e7             	mov    %rsp,%rdi
    c2c6:	48 89 de             	mov    %rbx,%rsi
    c2c9:	4c 89 f2             	mov    %r14,%rdx
    c2cc:	4c 89 f9             	mov    %r15,%rcx
    c2cf:	4d 89 e0             	mov    %r12,%r8
    c2d2:	e8 99 1c 00 00       	call   df70 <hyperinterval::ieee::Format::add>
    c2d7:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    c2db:	74 38                	je     c315 <hyperinterval::float::F64Enclosure::add+0xb5>
    c2dd:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
    c2e2:	48 89 e7             	mov    %rsp,%rdi
    c2e5:	48 89 de             	mov    %rbx,%rsi
    c2e8:	4c 89 f2             	mov    %r14,%rdx
    c2eb:	4c 89 e9             	mov    %r13,%rcx
    c2ee:	e8 2d 19 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    c2f3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    c2f7:	74 1c                	je     c315 <hyperinterval::float::F64Enclosure::add+0xb5>
    c2f9:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    c2fe:	48 89 e7             	mov    %rsp,%rdi
    c301:	48 89 de             	mov    %rbx,%rsi
    c304:	4c 89 f2             	mov    %r14,%rdx
    c307:	4c 89 f9             	mov    %r15,%rcx
    c30a:	e8 11 19 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    c30f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    c313:	75 2a                	jne    c33f <hyperinterval::float::F64Enclosure::add+0xdf>
    c315:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
    c31a:	48 89 e8             	mov    %rbp,%rax
    c31d:	88 4d 08             	mov    %cl,0x8(%rbp)
    c320:	48 c7 45 00 02 00 00 	movq   $0x2,0x0(%rbp)
    c327:	00 
    c328:	48 83 c4 18          	add    $0x18,%rsp
    c32c:	5b                   	pop    %rbx
    c32d:	41 5c                	pop    %r12
    c32f:	41 5d                	pop    %r13
    c331:	41 5e                	pop    %r14
    c333:	41 5f                	pop    %r15
    c335:	5d                   	pop    %rbp
    c336:	c3                   	ret
    c337:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
    c33e:	c3                   	ret
    c33f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    c344:	4c 89 e0             	mov    %r12,%rax
    c347:	48 09 d8             	or     %rbx,%rax
    c34a:	48 8d 53 ff          	lea    -0x1(%rbx),%rdx
    c34e:	4c 89 e6             	mov    %r12,%rsi
    c351:	48 21 d6             	and    %rdx,%rsi
    c354:	48 89 df             	mov    %rbx,%rdi
    c357:	48 29 f7             	sub    %rsi,%rdi
    c35a:	4d 85 e4             	test   %r12,%r12
    c35d:	48 0f 49 f8          	cmovns %rax,%rdi
    c361:	48 89 c8             	mov    %rcx,%rax
    c364:	48 09 d8             	or     %rbx,%rax
    c367:	48 21 ca             	and    %rcx,%rdx
    c36a:	48 29 d3             	sub    %rdx,%rbx
    c36d:	48 85 c9             	test   %rcx,%rcx
    c370:	48 0f 49 d8          	cmovns %rax,%rbx
    c374:	48 39 df             	cmp    %rbx,%rdi
    c377:	48 89 e8             	mov    %rbp,%rax
    c37a:	76 0d                	jbe    c389 <hyperinterval::float::F64Enclosure::add+0x129>
    c37c:	c6 40 08 01          	movb   $0x1,0x8(%rax)
    c380:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
    c387:	eb 9f                	jmp    c328 <hyperinterval::float::F64Enclosure::add+0xc8>
    c389:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
    c390:	4c 89 60 08          	mov    %r12,0x8(%rax)
    c394:	48 89 48 10          	mov    %rcx,0x10(%rax)
    c398:	eb 8e                	jmp    c328 <hyperinterval::float::F64Enclosure::add+0xc8>
    c39a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

hyperinterval::float::F64Enclosure::sub:
    c3a0:	53                   	push   %rbx
    c3a1:	48 83 ec 20          	sub    $0x20,%rsp
    c3a5:	48 89 fb             	mov    %rdi,%rbx
    c3a8:	f6 02 01             	testb  $0x1,(%rdx)
    c3ab:	74 30                	je     c3dd <hyperinterval::float::F64Enclosure::sub+0x3d>
    c3ad:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
    c3b1:	48 8b 52 10          	mov    0x10(%rdx),%rdx
    c3b5:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    c3bc:	00 00 80 
    c3bf:	48 89 d1             	mov    %rdx,%rcx
    c3c2:	48 31 c1             	xor    %rax,%rcx
    c3c5:	48 85 d2             	test   %rdx,%rdx
    c3c8:	48 0f 44 ca          	cmove  %rdx,%rcx
    c3cc:	48 31 f8             	xor    %rdi,%rax
    c3cf:	48 85 ff             	test   %rdi,%rdi
    c3d2:	48 0f 44 c7          	cmove  %rdi,%rax
    c3d6:	ba 01 00 00 00       	mov    $0x1,%edx
    c3db:	eb 02                	jmp    c3df <hyperinterval::float::F64Enclosure::sub+0x3f>
    c3dd:	31 d2                	xor    %edx,%edx
    c3df:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    c3e4:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
    c3e9:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    c3ee:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
    c3f3:	48 89 df             	mov    %rbx,%rdi
    c3f6:	ff 15 8c 28 05 00    	call   *0x5288c(%rip)        # 5ec88 <_GLOBAL_OFFSET_TABLE_+0x698>
    c3fc:	48 89 d8             	mov    %rbx,%rax
    c3ff:	48 83 c4 20          	add    $0x20,%rsp
    c403:	5b                   	pop    %rbx
    c404:	c3                   	ret
    c405:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    c40c:	00 00 00 
    c40f:	90                   	nop

hyperinterval::float::F64Enclosure::corner_image:
    c410:	f6 06 01             	testb  $0x1,(%rsi)
    c413:	0f 84 48 04 00 00    	je     c861 <hyperinterval::float::F64Enclosure::corner_image+0x451>
    c419:	f6 02 01             	testb  $0x1,(%rdx)
    c41c:	0f 84 3f 04 00 00    	je     c861 <hyperinterval::float::F64Enclosure::corner_image+0x451>
    c422:	55                   	push   %rbp
    c423:	41 57                	push   %r15
    c425:	41 56                	push   %r14
    c427:	41 55                	push   %r13
    c429:	41 54                	push   %r12
    c42b:	53                   	push   %rbx
    c42c:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
    c433:	48 89 7c 24 78       	mov    %rdi,0x78(%rsp)
    c438:	49 ba 00 00 00 00 00 	movabs $0x8000000000000000,%r10
    c43f:	00 00 80 
    c442:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
    c449:	00 f0 7f 
    c44c:	4c 8b 42 08          	mov    0x8(%rdx),%r8
    c450:	48 8b 42 10          	mov    0x10(%rdx),%rax
    c454:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    c459:	48 8b 5e 08          	mov    0x8(%rsi),%rbx
    c45d:	48 8b 46 10          	mov    0x10(%rsi),%rax
    c461:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
    c466:	84 c9                	test   %cl,%cl
    c468:	0f 84 fb 03 00 00    	je     c869 <hyperinterval::float::F64Enclosure::corner_image+0x459>
    c46e:	48 89 e7             	mov    %rsp,%rdi
    c471:	4c 89 d6             	mov    %r10,%rsi
    c474:	4c 89 f2             	mov    %r14,%rdx
    c477:	48 89 d9             	mov    %rbx,%rcx
    c47a:	4d 89 c5             	mov    %r8,%r13
    c47d:	4d 89 f7             	mov    %r14,%r15
    c480:	e8 8b 1d 00 00       	call   e210 <hyperinterval::ieee::Format::div>
    c485:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c489:	0f 85 e1 04 00 00    	jne    c970 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c48f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    c494:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
    c499:	48 89 e7             	mov    %rsp,%rdi
    c49c:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c4a3:	00 00 80 
    c4a6:	4c 89 fa             	mov    %r15,%rdx
    c4a9:	e8 72 17 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    c4ae:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c4b2:	0f 85 b8 04 00 00    	jne    c970 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c4b8:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    c4bd:	48 89 e7             	mov    %rsp,%rdi
    c4c0:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c4c7:	00 00 80 
    c4ca:	4c 89 fa             	mov    %r15,%rdx
    c4cd:	4c 89 f1             	mov    %r14,%rcx
    c4d0:	e8 4b 17 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    c4d5:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c4d9:	0f 85 91 04 00 00    	jne    c970 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c4df:	48 89 e8             	mov    %rbp,%rax
    c4e2:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c4e9:	00 00 80 
    c4ec:	48 09 f0             	or     %rsi,%rax
    c4ef:	48 8d 56 ff          	lea    -0x1(%rsi),%rdx
    c4f3:	48 89 e9             	mov    %rbp,%rcx
    c4f6:	48 21 d1             	and    %rdx,%rcx
    c4f9:	49 89 f7             	mov    %rsi,%r15
    c4fc:	49 29 cf             	sub    %rcx,%r15
    c4ff:	48 85 ed             	test   %rbp,%rbp
    c502:	4c 0f 49 f8          	cmovns %rax,%r15
    c506:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    c50b:	48 89 f8             	mov    %rdi,%rax
    c50e:	48 09 f0             	or     %rsi,%rax
    c511:	48 89 f9             	mov    %rdi,%rcx
    c514:	48 21 d1             	and    %rdx,%rcx
    c517:	49 89 f4             	mov    %rsi,%r12
    c51a:	49 29 cc             	sub    %rcx,%r12
    c51d:	48 85 ff             	test   %rdi,%rdi
    c520:	4c 0f 49 e0          	cmovns %rax,%r12
    c524:	41 b6 01             	mov    $0x1,%r14b
    c527:	4d 39 e7             	cmp    %r12,%r15
    c52a:	0f 87 46 04 00 00    	ja     c976 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    c530:	48 89 7c 24 38       	mov    %rdi,0x38(%rsp)
    c535:	48 89 6c 24 28       	mov    %rbp,0x28(%rsp)
    c53a:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
    c53f:	48 89 e7             	mov    %rsp,%rdi
    c542:	48 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%rbp
    c549:	00 f0 7f 
    c54c:	48 89 ea             	mov    %rbp,%rdx
    c54f:	48 89 d9             	mov    %rbx,%rcx
    c552:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
    c557:	e8 b4 1c 00 00       	call   e210 <hyperinterval::ieee::Format::div>
    c55c:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c560:	0f 85 0a 04 00 00    	jne    c970 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c566:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    c56b:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    c570:	48 89 e7             	mov    %rsp,%rdi
    c573:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c57a:	00 00 80 
    c57d:	48 89 ea             	mov    %rbp,%rdx
    c580:	e8 9b 16 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    c585:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c589:	0f 85 e1 03 00 00    	jne    c970 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c58f:	48 89 ea             	mov    %rbp,%rdx
    c592:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    c597:	48 89 e7             	mov    %rsp,%rdi
    c59a:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c5a1:	00 00 80 
    c5a4:	48 89 d9             	mov    %rbx,%rcx
    c5a7:	e8 74 16 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    c5ac:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c5b0:	0f 85 ba 03 00 00    	jne    c970 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c5b6:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    c5bb:	48 89 ea             	mov    %rbp,%rdx
    c5be:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c5c5:	00 00 80 
    c5c8:	48 09 f2             	or     %rsi,%rdx
    c5cb:	48 89 ef             	mov    %rbp,%rdi
    c5ce:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
    c5d3:	4c 21 cf             	and    %r9,%rdi
    c5d6:	48 89 f1             	mov    %rsi,%rcx
    c5d9:	48 29 f9             	sub    %rdi,%rcx
    c5dc:	48 85 ed             	test   %rbp,%rbp
    c5df:	48 0f 49 ca          	cmovns %rdx,%rcx
    c5e3:	49 89 c0             	mov    %rax,%r8
    c5e6:	49 09 f0             	or     %rsi,%r8
    c5e9:	48 89 c7             	mov    %rax,%rdi
    c5ec:	4c 21 cf             	and    %r9,%rdi
    c5ef:	48 89 f2             	mov    %rsi,%rdx
    c5f2:	48 29 fa             	sub    %rdi,%rdx
    c5f5:	48 85 c0             	test   %rax,%rax
    c5f8:	49 0f 49 d0          	cmovns %r8,%rdx
    c5fc:	48 39 d1             	cmp    %rdx,%rcx
    c5ff:	0f 87 71 03 00 00    	ja     c976 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    c605:	49 39 cf             	cmp    %rcx,%r15
    c608:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    c60d:	48 0f 47 cd          	cmova  %rbp,%rcx
    c611:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
    c616:	49 39 d4             	cmp    %rdx,%r12
    c619:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
    c61e:	48 0f 42 c8          	cmovb  %rax,%rcx
    c622:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
    c627:	48 89 e7             	mov    %rsp,%rdi
    c62a:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
    c631:	00 f0 7f 
    c634:	4c 89 e2             	mov    %r12,%rdx
    c637:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
    c63c:	4d 89 e8             	mov    %r13,%r8
    c63f:	e8 cc 1b 00 00       	call   e210 <hyperinterval::ieee::Format::div>
    c644:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c648:	0f 85 22 03 00 00    	jne    c970 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c64e:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    c653:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
    c658:	48 89 e7             	mov    %rsp,%rdi
    c65b:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c662:	00 00 80 
    c665:	4c 89 e2             	mov    %r12,%rdx
    c668:	e8 b3 15 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    c66d:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c671:	0f 85 f9 02 00 00    	jne    c970 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c677:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    c67c:	48 89 e7             	mov    %rsp,%rdi
    c67f:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c686:	00 00 80 
    c689:	4c 89 e2             	mov    %r12,%rdx
    c68c:	4c 89 f9             	mov    %r15,%rcx
    c68f:	e8 8c 15 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    c694:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c698:	0f 85 d2 02 00 00    	jne    c970 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c69e:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
    c6a3:	48 89 d8             	mov    %rbx,%rax
    c6a6:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c6ad:	00 00 80 
    c6b0:	48 09 f0             	or     %rsi,%rax
    c6b3:	48 89 da             	mov    %rbx,%rdx
    c6b6:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
    c6bb:	4c 21 ca             	and    %r9,%rdx
    c6be:	48 89 f1             	mov    %rsi,%rcx
    c6c1:	48 29 d1             	sub    %rdx,%rcx
    c6c4:	48 85 db             	test   %rbx,%rbx
    c6c7:	48 0f 49 c8          	cmovns %rax,%rcx
    c6cb:	4c 89 fa             	mov    %r15,%rdx
    c6ce:	48 09 f2             	or     %rsi,%rdx
    c6d1:	4c 89 ff             	mov    %r15,%rdi
    c6d4:	4c 21 cf             	and    %r9,%rdi
    c6d7:	48 89 f0             	mov    %rsi,%rax
    c6da:	48 29 f8             	sub    %rdi,%rax
    c6dd:	4d 85 ff             	test   %r15,%r15
    c6e0:	48 0f 49 c2          	cmovns %rdx,%rax
    c6e4:	48 39 c1             	cmp    %rax,%rcx
    c6e7:	0f 87 89 02 00 00    	ja     c976 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    c6ed:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
    c6f2:	4c 89 d2             	mov    %r10,%rdx
    c6f5:	48 09 f2             	or     %rsi,%rdx
    c6f8:	4d 89 d0             	mov    %r10,%r8
    c6fb:	4d 21 c8             	and    %r9,%r8
    c6fe:	48 89 f7             	mov    %rsi,%rdi
    c701:	4c 29 c7             	sub    %r8,%rdi
    c704:	4d 85 d2             	test   %r10,%r10
    c707:	48 0f 49 fa          	cmovns %rdx,%rdi
    c70b:	48 39 cf             	cmp    %rcx,%rdi
    c70e:	49 0f 46 da          	cmovbe %r10,%rbx
    c712:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
    c717:	4c 89 c1             	mov    %r8,%rcx
    c71a:	48 09 f1             	or     %rsi,%rcx
    c71d:	4c 89 c2             	mov    %r8,%rdx
    c720:	4c 21 ca             	and    %r9,%rdx
    c723:	48 89 f7             	mov    %rsi,%rdi
    c726:	48 29 d7             	sub    %rdx,%rdi
    c729:	4d 85 c0             	test   %r8,%r8
    c72c:	48 0f 49 f9          	cmovns %rcx,%rdi
    c730:	48 39 c7             	cmp    %rax,%rdi
    c733:	4d 0f 43 f8          	cmovae %r8,%r15
    c737:	48 89 e7             	mov    %rsp,%rdi
    c73a:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
    c741:	00 f0 7f 
    c744:	4c 89 e2             	mov    %r12,%rdx
    c747:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
    c74c:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
    c751:	e8 ba 1a 00 00       	call   e210 <hyperinterval::ieee::Format::div>
    c756:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c75a:	0f 85 10 02 00 00    	jne    c970 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c760:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    c765:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
    c76a:	48 89 e7             	mov    %rsp,%rdi
    c76d:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c774:	00 00 80 
    c777:	4c 89 e2             	mov    %r12,%rdx
    c77a:	e8 a1 14 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    c77f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c783:	0f 85 e7 01 00 00    	jne    c970 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c789:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    c78e:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    c793:	48 89 e7             	mov    %rsp,%rdi
    c796:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c79d:	00 00 80 
    c7a0:	4c 89 e2             	mov    %r12,%rdx
    c7a3:	4c 89 e9             	mov    %r13,%rcx
    c7a6:	e8 75 14 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    c7ab:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c7af:	0f 85 bb 01 00 00    	jne    c970 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c7b5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    c7ba:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
    c7bf:	48 89 f9             	mov    %rdi,%rcx
    c7c2:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
    c7c9:	00 00 80 
    c7cc:	4c 09 c1             	or     %r8,%rcx
    c7cf:	48 89 fe             	mov    %rdi,%rsi
    c7d2:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
    c7d7:	4c 21 ce             	and    %r9,%rsi
    c7da:	4c 89 c2             	mov    %r8,%rdx
    c7dd:	48 29 f2             	sub    %rsi,%rdx
    c7e0:	48 85 ff             	test   %rdi,%rdi
    c7e3:	48 0f 49 d1          	cmovns %rcx,%rdx
    c7e7:	48 89 c6             	mov    %rax,%rsi
    c7ea:	4c 09 c6             	or     %r8,%rsi
    c7ed:	48 89 c7             	mov    %rax,%rdi
    c7f0:	4c 21 cf             	and    %r9,%rdi
    c7f3:	4c 89 c1             	mov    %r8,%rcx
    c7f6:	48 29 f9             	sub    %rdi,%rcx
    c7f9:	48 85 c0             	test   %rax,%rax
    c7fc:	48 0f 49 ce          	cmovns %rsi,%rcx
    c800:	48 39 ca             	cmp    %rcx,%rdx
    c803:	0f 87 6d 01 00 00    	ja     c976 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    c809:	48 89 de             	mov    %rbx,%rsi
    c80c:	48 bd 00 00 00 00 00 	movabs $0x8000000000000000,%rbp
    c813:	00 00 80 
    c816:	48 09 ee             	or     %rbp,%rsi
    c819:	48 89 df             	mov    %rbx,%rdi
    c81c:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
    c821:	4c 21 cf             	and    %r9,%rdi
    c824:	49 89 e8             	mov    %rbp,%r8
    c827:	49 29 f8             	sub    %rdi,%r8
    c82a:	48 85 db             	test   %rbx,%rbx
    c82d:	4c 0f 49 c6          	cmovns %rsi,%r8
    c831:	49 39 d0             	cmp    %rdx,%r8
    c834:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    c839:	48 0f 46 d3          	cmovbe %rbx,%rdx
    c83d:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
    c842:	4c 89 fa             	mov    %r15,%rdx
    c845:	48 09 ea             	or     %rbp,%rdx
    c848:	4d 21 f9             	and    %r15,%r9
    c84b:	4c 29 cd             	sub    %r9,%rbp
    c84e:	4d 85 ff             	test   %r15,%r15
    c851:	48 0f 49 ea          	cmovns %rdx,%rbp
    c855:	48 39 cd             	cmp    %rcx,%rbp
    c858:	49 0f 43 c7          	cmovae %r15,%rax
    c85c:	e9 d8 05 00 00       	jmp    ce39 <hyperinterval::float::F64Enclosure::corner_image+0xa29>
    c861:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
    c868:	c3                   	ret
    c869:	48 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%rdx
    c870:	ff 0f 00 
    c873:	49 89 dd             	mov    %rbx,%r13
    c876:	49 c1 ed 34          	shr    $0x34,%r13
    c87a:	41 81 e5 ff 07 00 00 	and    $0x7ff,%r13d
    c881:	48 89 d8             	mov    %rbx,%rax
    c884:	48 21 d0             	and    %rdx,%rax
    c887:	4d 85 ed             	test   %r13,%r13
    c88a:	b9 01 00 00 00       	mov    $0x1,%ecx
    c88f:	41 0f 45 cd          	cmovne %r13d,%ecx
    c893:	4c 8d 62 01          	lea    0x1(%rdx),%r12
    c897:	4d 89 e7             	mov    %r12,%r15
    c89a:	4d 0f 44 fd          	cmove  %r13,%r15
    c89e:	49 09 c7             	or     %rax,%r15
    c8a1:	4c 89 c5             	mov    %r8,%rbp
    c8a4:	48 c1 ed 34          	shr    $0x34,%rbp
    c8a8:	81 e5 ff 07 00 00    	and    $0x7ff,%ebp
    c8ae:	4c 89 c0             	mov    %r8,%rax
    c8b1:	48 21 d0             	and    %rdx,%rax
    c8b4:	8d 95 9a f7 ff ff    	lea    -0x866(%rbp),%edx
    c8ba:	48 85 ed             	test   %rbp,%rbp
    c8bd:	4c 89 64 24 30       	mov    %r12,0x30(%rsp)
    c8c2:	4c 0f 44 e5          	cmove  %rbp,%r12
    c8c6:	be 9b f7 ff ff       	mov    $0xfffff79b,%esi
    c8cb:	0f 45 f2             	cmovne %edx,%esi
    c8ce:	49 09 c4             	or     %rax,%r12
    c8d1:	48 89 df             	mov    %rbx,%rdi
    c8d4:	4c 89 44 24 38       	mov    %r8,0x38(%rsp)
    c8d9:	4c 31 c7             	xor    %r8,%rdi
    c8dc:	4c 89 f8             	mov    %r15,%rax
    c8df:	49 f7 e4             	mul    %r12
    c8e2:	01 ce                	add    %ecx,%esi
    c8e4:	48 c1 ef 3f          	shr    $0x3f,%rdi
    c8e8:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
    c8ed:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    c8f2:	48 89 04 24          	mov    %rax,(%rsp)
    c8f6:	89 74 24 10          	mov    %esi,0x10(%rsp)
    c8fa:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    c8ff:	48 89 e1             	mov    %rsp,%rcx
    c902:	4c 89 d6             	mov    %r10,%rsi
    c905:	4c 89 f2             	mov    %r14,%rdx
    c908:	e8 53 13 00 00       	call   dc60 <hyperinterval::ieee::Format::rounded>
    c90d:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
    c912:	74 08                	je     c91c <hyperinterval::float::F64Enclosure::corner_image+0x50c>
    c914:	44 0f b6 74 24 41    	movzbl 0x41(%rsp),%r14d
    c91a:	eb 5a                	jmp    c976 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    c91c:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    c921:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
    c926:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    c92b:	48 89 e7             	mov    %rsp,%rdi
    c92e:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c935:	00 00 80 
    c938:	4c 89 f2             	mov    %r14,%rdx
    c93b:	e8 e0 12 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    c940:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c944:	75 2a                	jne    c970 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c946:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    c94b:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
    c950:	48 89 e7             	mov    %rsp,%rdi
    c953:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c95a:	00 00 80 
    c95d:	4c 89 f2             	mov    %r14,%rdx
    c960:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    c965:	e8 b6 12 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    c96a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c96e:	74 28                	je     c998 <hyperinterval::float::F64Enclosure::corner_image+0x588>
    c970:	44 0f b6 74 24 01    	movzbl 0x1(%rsp),%r14d
    c976:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
    c97b:	44 88 70 08          	mov    %r14b,0x8(%rax)
    c97f:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
    c986:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
    c98d:	5b                   	pop    %rbx
    c98e:	41 5c                	pop    %r12
    c990:	41 5d                	pop    %r13
    c992:	41 5e                	pop    %r14
    c994:	41 5f                	pop    %r15
    c996:	5d                   	pop    %rbp
    c997:	c3                   	ret
    c998:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
    c99d:	48 89 f8             	mov    %rdi,%rax
    c9a0:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c9a7:	00 00 80 
    c9aa:	48 09 f0             	or     %rsi,%rax
    c9ad:	48 8d 56 ff          	lea    -0x1(%rsi),%rdx
    c9b1:	48 89 f9             	mov    %rdi,%rcx
    c9b4:	48 21 d1             	and    %rdx,%rcx
    c9b7:	49 89 f0             	mov    %rsi,%r8
    c9ba:	49 29 c8             	sub    %rcx,%r8
    c9bd:	48 85 ff             	test   %rdi,%rdi
    c9c0:	4c 0f 49 c0          	cmovns %rax,%r8
    c9c4:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    c9c9:	48 89 f8             	mov    %rdi,%rax
    c9cc:	48 09 f0             	or     %rsi,%rax
    c9cf:	48 89 f9             	mov    %rdi,%rcx
    c9d2:	48 21 d1             	and    %rdx,%rcx
    c9d5:	49 89 f1             	mov    %rsi,%r9
    c9d8:	49 29 c9             	sub    %rcx,%r9
    c9db:	48 85 ff             	test   %rdi,%rdi
    c9de:	4c 0f 49 c8          	cmovns %rax,%r9
    c9e2:	41 b6 01             	mov    $0x1,%r14b
    c9e5:	4d 39 c8             	cmp    %r9,%r8
    c9e8:	77 8c                	ja     c976 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    c9ea:	4c 89 8c 24 88 00 00 	mov    %r9,0x88(%rsp)
    c9f1:	00 
    c9f2:	4c 89 84 24 90 00 00 	mov    %r8,0x90(%rsp)
    c9f9:	00 
    c9fa:	48 89 7c 24 68       	mov    %rdi,0x68(%rsp)
    c9ff:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
    ca04:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    ca09:	48 89 c8             	mov    %rcx,%rax
    ca0c:	48 c1 e8 34          	shr    $0x34,%rax
    ca10:	25 ff 07 00 00       	and    $0x7ff,%eax
    ca15:	48 89 ca             	mov    %rcx,%rdx
    ca18:	48 bf ff ff ff ff ff 	movabs $0xfffffffffffff,%rdi
    ca1f:	ff 0f 00 
    ca22:	48 21 fa             	and    %rdi,%rdx
    ca25:	48 85 c0             	test   %rax,%rax
    ca28:	41 b8 01 00 00 00    	mov    $0x1,%r8d
    ca2e:	44 0f 45 c0          	cmovne %eax,%r8d
    ca32:	48 0f 45 44 24 30    	cmovne 0x30(%rsp),%rax
    ca38:	48 09 d0             	or     %rdx,%rax
    ca3b:	48 31 cb             	xor    %rcx,%rbx
    ca3e:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
    ca45:	00 
    ca46:	49 f7 e7             	mul    %r15
    ca49:	41 8d 8d 9a f7 ff ff 	lea    -0x866(%r13),%ecx
    ca50:	4d 85 ed             	test   %r13,%r13
    ca53:	bf 9b f7 ff ff       	mov    $0xfffff79b,%edi
    ca58:	0f 45 f9             	cmovne %ecx,%edi
    ca5b:	44 89 44 24 74       	mov    %r8d,0x74(%rsp)
    ca60:	44 01 c7             	add    %r8d,%edi
    ca63:	48 c1 eb 3f          	shr    $0x3f,%rbx
    ca67:	88 5c 24 14          	mov    %bl,0x14(%rsp)
    ca6b:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    ca70:	48 89 04 24          	mov    %rax,(%rsp)
    ca74:	89 7c 24 10          	mov    %edi,0x10(%rsp)
    ca78:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    ca7d:	48 89 e1             	mov    %rsp,%rcx
    ca80:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
    ca87:	00 f0 7f 
    ca8a:	4c 89 ea             	mov    %r13,%rdx
    ca8d:	e8 ce 11 00 00       	call   dc60 <hyperinterval::ieee::Format::rounded>
    ca92:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
    ca97:	0f 85 77 fe ff ff    	jne    c914 <hyperinterval::float::F64Enclosure::corner_image+0x504>
    ca9d:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    caa2:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
    caa7:	48 89 e7             	mov    %rsp,%rdi
    caaa:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cab1:	00 00 80 
    cab4:	4c 89 ea             	mov    %r13,%rdx
    cab7:	e8 64 11 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    cabc:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    cac0:	0f 84 aa fe ff ff    	je     c970 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    cac6:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    cacb:	48 89 e7             	mov    %rsp,%rdi
    cace:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cad5:	00 00 80 
    cad8:	4c 89 ea             	mov    %r13,%rdx
    cadb:	4c 89 f9             	mov    %r15,%rcx
    cade:	e8 3d 11 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    cae3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    cae7:	0f 84 83 fe ff ff    	je     c970 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    caed:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    caf2:	48 89 da             	mov    %rbx,%rdx
    caf5:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cafc:	00 00 80 
    caff:	48 09 f2             	or     %rsi,%rdx
    cb02:	48 89 df             	mov    %rbx,%rdi
    cb05:	4c 8b 4c 24 28       	mov    0x28(%rsp),%r9
    cb0a:	4c 21 cf             	and    %r9,%rdi
    cb0d:	48 89 f1             	mov    %rsi,%rcx
    cb10:	48 29 f9             	sub    %rdi,%rcx
    cb13:	48 85 db             	test   %rbx,%rbx
    cb16:	48 0f 49 ca          	cmovns %rdx,%rcx
    cb1a:	49 89 c0             	mov    %rax,%r8
    cb1d:	49 09 f0             	or     %rsi,%r8
    cb20:	48 89 c7             	mov    %rax,%rdi
    cb23:	4c 21 cf             	and    %r9,%rdi
    cb26:	48 89 f2             	mov    %rsi,%rdx
    cb29:	48 29 fa             	sub    %rdi,%rdx
    cb2c:	48 85 c0             	test   %rax,%rax
    cb2f:	49 0f 49 d0          	cmovns %r8,%rdx
    cb33:	48 39 d1             	cmp    %rdx,%rcx
    cb36:	0f 87 3a fe ff ff    	ja     c976 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    cb3c:	48 39 8c 24 90 00 00 	cmp    %rcx,0x90(%rsp)
    cb43:	00 
    cb44:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
    cb49:	48 0f 47 cb          	cmova  %rbx,%rcx
    cb4d:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
    cb52:	48 39 94 24 88 00 00 	cmp    %rdx,0x88(%rsp)
    cb59:	00 
    cb5a:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
    cb5f:	48 0f 42 c8          	cmovb  %rax,%rcx
    cb63:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
    cb68:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
    cb6d:	48 89 d0             	mov    %rdx,%rax
    cb70:	48 c1 e8 34          	shr    $0x34,%rax
    cb74:	25 ff 07 00 00       	and    $0x7ff,%eax
    cb79:	48 bf ff ff ff ff ff 	movabs $0xfffffffffffff,%rdi
    cb80:	ff 0f 00 
    cb83:	48 21 d7             	and    %rdx,%rdi
    cb86:	8d 88 9a f7 ff ff    	lea    -0x866(%rax),%ecx
    cb8c:	48 85 c0             	test   %rax,%rax
    cb8f:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
    cb94:	4c 0f 44 c0          	cmove  %rax,%r8
    cb98:	41 bd 9b f7 ff ff    	mov    $0xfffff79b,%r13d
    cb9e:	44 0f 45 e9          	cmovne %ecx,%r13d
    cba2:	49 09 f8             	or     %rdi,%r8
    cba5:	48 85 ed             	test   %rbp,%rbp
    cba8:	b9 01 00 00 00       	mov    $0x1,%ecx
    cbad:	0f 45 cd             	cmovne %ebp,%ecx
    cbb0:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
    cbb5:	48 31 d7             	xor    %rdx,%rdi
    cbb8:	4c 89 e0             	mov    %r12,%rax
    cbbb:	4c 89 c5             	mov    %r8,%rbp
    cbbe:	49 f7 e0             	mul    %r8
    cbc1:	44 01 e9             	add    %r13d,%ecx
    cbc4:	48 c1 ef 3f          	shr    $0x3f,%rdi
    cbc8:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
    cbcd:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    cbd2:	48 89 04 24          	mov    %rax,(%rsp)
    cbd6:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
    cbda:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    cbdf:	48 89 e1             	mov    %rsp,%rcx
    cbe2:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
    cbe9:	00 f0 7f 
    cbec:	4c 89 e2             	mov    %r12,%rdx
    cbef:	e8 6c 10 00 00       	call   dc60 <hyperinterval::ieee::Format::rounded>
    cbf4:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
    cbf9:	0f 85 15 fd ff ff    	jne    c914 <hyperinterval::float::F64Enclosure::corner_image+0x504>
    cbff:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    cc04:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
    cc09:	48 89 e7             	mov    %rsp,%rdi
    cc0c:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cc13:	00 00 80 
    cc16:	4c 89 e2             	mov    %r12,%rdx
    cc19:	e8 02 10 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    cc1e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    cc22:	0f 85 48 fd ff ff    	jne    c970 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    cc28:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    cc2d:	48 89 e7             	mov    %rsp,%rdi
    cc30:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cc37:	00 00 80 
    cc3a:	4c 89 e2             	mov    %r12,%rdx
    cc3d:	4c 89 f9             	mov    %r15,%rcx
    cc40:	e8 db 0f 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    cc45:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    cc49:	0f 85 21 fd ff ff    	jne    c970 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    cc4f:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    cc54:	48 89 d8             	mov    %rbx,%rax
    cc57:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cc5e:	00 00 80 
    cc61:	48 09 f0             	or     %rsi,%rax
    cc64:	48 89 da             	mov    %rbx,%rdx
    cc67:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
    cc6c:	4c 21 c2             	and    %r8,%rdx
    cc6f:	48 89 f1             	mov    %rsi,%rcx
    cc72:	48 29 d1             	sub    %rdx,%rcx
    cc75:	48 85 db             	test   %rbx,%rbx
    cc78:	48 0f 49 c8          	cmovns %rax,%rcx
    cc7c:	4c 89 e2             	mov    %r12,%rdx
    cc7f:	48 09 f2             	or     %rsi,%rdx
    cc82:	4c 89 e7             	mov    %r12,%rdi
    cc85:	4c 21 c7             	and    %r8,%rdi
    cc88:	48 89 f0             	mov    %rsi,%rax
    cc8b:	48 29 f8             	sub    %rdi,%rax
    cc8e:	4d 85 e4             	test   %r12,%r12
    cc91:	48 0f 49 c2          	cmovns %rdx,%rax
    cc95:	48 39 c1             	cmp    %rax,%rcx
    cc98:	0f 87 d8 fc ff ff    	ja     c976 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    cc9e:	4c 8b 4c 24 58       	mov    0x58(%rsp),%r9
    cca3:	4c 89 ca             	mov    %r9,%rdx
    cca6:	4c 21 c2             	and    %r8,%rdx
    cca9:	48 89 f7             	mov    %rsi,%rdi
    ccac:	48 29 d7             	sub    %rdx,%rdi
    ccaf:	4c 89 ca             	mov    %r9,%rdx
    ccb2:	48 09 f2             	or     %rsi,%rdx
    ccb5:	4d 85 c9             	test   %r9,%r9
    ccb8:	48 0f 49 fa          	cmovns %rdx,%rdi
    ccbc:	48 39 cf             	cmp    %rcx,%rdi
    ccbf:	49 0f 46 d9          	cmovbe %r9,%rbx
    ccc3:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
    ccc8:	48 89 f9             	mov    %rdi,%rcx
    cccb:	4c 21 c1             	and    %r8,%rcx
    ccce:	48 89 f2             	mov    %rsi,%rdx
    ccd1:	48 29 ca             	sub    %rcx,%rdx
    ccd4:	48 89 f9             	mov    %rdi,%rcx
    ccd7:	48 09 f1             	or     %rsi,%rcx
    ccda:	48 85 ff             	test   %rdi,%rdi
    ccdd:	48 0f 49 d1          	cmovns %rcx,%rdx
    cce1:	48 39 c2             	cmp    %rax,%rdx
    cce4:	4c 0f 43 e7          	cmovae %rdi,%r12
    cce8:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
    cced:	48 33 44 24 60       	xor    0x60(%rsp),%rax
    ccf2:	44 03 6c 24 74       	add    0x74(%rsp),%r13d
    ccf7:	48 c1 e8 3f          	shr    $0x3f,%rax
    ccfb:	88 44 24 14          	mov    %al,0x14(%rsp)
    ccff:	48 8b 84 24 80 00 00 	mov    0x80(%rsp),%rax
    cd06:	00 
    cd07:	48 f7 e5             	mul    %rbp
    cd0a:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    cd0f:	48 89 04 24          	mov    %rax,(%rsp)
    cd13:	44 89 6c 24 10       	mov    %r13d,0x10(%rsp)
    cd18:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    cd1d:	48 89 e1             	mov    %rsp,%rcx
    cd20:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
    cd27:	00 f0 7f 
    cd2a:	4c 89 ea             	mov    %r13,%rdx
    cd2d:	e8 2e 0f 00 00       	call   dc60 <hyperinterval::ieee::Format::rounded>
    cd32:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
    cd37:	0f 85 d7 fb ff ff    	jne    c914 <hyperinterval::float::F64Enclosure::corner_image+0x504>
    cd3d:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    cd42:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
    cd47:	48 89 e7             	mov    %rsp,%rdi
    cd4a:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cd51:	00 00 80 
    cd54:	4c 89 ea             	mov    %r13,%rdx
    cd57:	e8 c4 0e 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    cd5c:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    cd60:	0f 85 0a fc ff ff    	jne    c970 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    cd66:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    cd6b:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    cd70:	48 89 e7             	mov    %rsp,%rdi
    cd73:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cd7a:	00 00 80 
    cd7d:	4c 89 ea             	mov    %r13,%rdx
    cd80:	4c 89 f9             	mov    %r15,%rcx
    cd83:	e8 98 0e 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    cd88:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    cd8c:	0f 85 de fb ff ff    	jne    c970 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    cd92:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    cd97:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
    cd9c:	48 89 f9             	mov    %rdi,%rcx
    cd9f:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
    cda6:	00 00 80 
    cda9:	4c 09 c1             	or     %r8,%rcx
    cdac:	48 89 fe             	mov    %rdi,%rsi
    cdaf:	4c 8b 4c 24 28       	mov    0x28(%rsp),%r9
    cdb4:	4c 21 ce             	and    %r9,%rsi
    cdb7:	4c 89 c2             	mov    %r8,%rdx
    cdba:	48 29 f2             	sub    %rsi,%rdx
    cdbd:	48 85 ff             	test   %rdi,%rdi
    cdc0:	48 0f 49 d1          	cmovns %rcx,%rdx
    cdc4:	48 89 c6             	mov    %rax,%rsi
    cdc7:	4c 09 c6             	or     %r8,%rsi
    cdca:	48 89 c7             	mov    %rax,%rdi
    cdcd:	4c 21 cf             	and    %r9,%rdi
    cdd0:	4c 89 c1             	mov    %r8,%rcx
    cdd3:	48 29 f9             	sub    %rdi,%rcx
    cdd6:	48 85 c0             	test   %rax,%rax
    cdd9:	48 0f 49 ce          	cmovns %rsi,%rcx
    cddd:	48 39 ca             	cmp    %rcx,%rdx
    cde0:	0f 87 90 fb ff ff    	ja     c976 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    cde6:	48 89 de             	mov    %rbx,%rsi
    cde9:	49 b9 00 00 00 00 00 	movabs $0x8000000000000000,%r9
    cdf0:	00 00 80 
    cdf3:	4c 09 ce             	or     %r9,%rsi
    cdf6:	48 89 df             	mov    %rbx,%rdi
    cdf9:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
    cdfe:	4c 21 d7             	and    %r10,%rdi
    ce01:	4d 89 c8             	mov    %r9,%r8
    ce04:	49 29 f8             	sub    %rdi,%r8
    ce07:	48 85 db             	test   %rbx,%rbx
    ce0a:	4c 0f 49 c6          	cmovns %rsi,%r8
    ce0e:	49 39 d0             	cmp    %rdx,%r8
    ce11:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    ce16:	48 0f 46 d3          	cmovbe %rbx,%rdx
    ce1a:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
    ce1f:	4c 89 e2             	mov    %r12,%rdx
    ce22:	4c 09 ca             	or     %r9,%rdx
    ce25:	4d 21 e2             	and    %r12,%r10
    ce28:	4d 29 d1             	sub    %r10,%r9
    ce2b:	4d 85 e4             	test   %r12,%r12
    ce2e:	4c 0f 49 ca          	cmovns %rdx,%r9
    ce32:	49 39 c9             	cmp    %rcx,%r9
    ce35:	49 0f 43 c4          	cmovae %r12,%rax
    ce39:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
    ce3e:	48 c7 01 01 00 00 00 	movq   $0x1,(%rcx)
    ce45:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    ce4a:	48 89 51 08          	mov    %rdx,0x8(%rcx)
    ce4e:	48 89 41 10          	mov    %rax,0x10(%rcx)
    ce52:	e9 2f fb ff ff       	jmp    c986 <hyperinterval::float::F64Enclosure::corner_image+0x576>
    ce57:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    ce5e:	00 00 

hyperinterval::float::F64Enclosure::div:
    ce60:	53                   	push   %rbx
    ce61:	48 89 fb             	mov    %rdi,%rbx
    ce64:	f6 02 01             	testb  $0x1,(%rdx)
    ce67:	74 56                	je     cebf <hyperinterval::float::F64Enclosure::div+0x5f>
    ce69:	48 b8 ff ff ff ff ff 	movabs $0x7fffffffffffffff,%rax
    ce70:	ff ff 7f 
    ce73:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
    ce77:	48 8d 78 01          	lea    0x1(%rax),%rdi
    ce7b:	4c 8d 04 01          	lea    (%rcx,%rax,1),%r8
    ce7f:	49 ff c0             	inc    %r8
    ce82:	49 89 c9             	mov    %rcx,%r9
    ce85:	49 21 c1             	and    %rax,%r9
    ce88:	49 f7 d9             	neg    %r9
    ce8b:	49 01 c1             	add    %rax,%r9
    ce8e:	49 ff c1             	inc    %r9
    ce91:	48 85 c9             	test   %rcx,%rcx
    ce94:	4d 0f 49 c8          	cmovns %r8,%r9
    ce98:	49 39 f9             	cmp    %rdi,%r9
    ce9b:	77 22                	ja     cebf <hyperinterval::float::F64Enclosure::div+0x5f>
    ce9d:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
    cea1:	48 89 cf             	mov    %rcx,%rdi
    cea4:	48 21 c7             	and    %rax,%rdi
    cea7:	48 01 c7             	add    %rax,%rdi
    ceaa:	48 85 f9             	test   %rdi,%rcx
    cead:	78 10                	js     cebf <hyperinterval::float::F64Enclosure::div+0x5f>
    ceaf:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
    ceb3:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    ceba:	48 89 d8             	mov    %rbx,%rax
    cebd:	5b                   	pop    %rbx
    cebe:	c3                   	ret
    cebf:	48 89 df             	mov    %rbx,%rdi
    cec2:	b9 01 00 00 00       	mov    $0x1,%ecx
    cec7:	e8 44 f5 ff ff       	call   c410 <hyperinterval::float::F64Enclosure::corner_image>
    cecc:	48 89 d8             	mov    %rbx,%rax
    cecf:	5b                   	pop    %rbx
    ced0:	c3                   	ret
    ced1:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    ced8:	00 00 00 
    cedb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

hyperinterval::float::F64Enclosure::reciprocal:
    cee0:	55                   	push   %rbp
    cee1:	41 57                	push   %r15
    cee3:	41 56                	push   %r14
    cee5:	41 55                	push   %r13
    cee7:	41 54                	push   %r12
    cee9:	53                   	push   %rbx
    ceea:	48 83 ec 28          	sub    $0x28,%rsp
    ceee:	48 89 fb             	mov    %rdi,%rbx
    cef1:	48 83 3e 00          	cmpq   $0x0,(%rsi)
    cef5:	74 65                	je     cf5c <hyperinterval::float::F64Enclosure::reciprocal+0x7c>
    cef7:	49 89 f6             	mov    %rsi,%r14
    cefa:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
    cf01:	00 00 80 
    cf04:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
    cf0b:	00 f0 7f 
    cf0e:	49 bd 00 00 00 00 00 	movabs $0x3ff0000000000000,%r13
    cf15:	00 f0 3f 
    cf18:	48 89 e7             	mov    %rsp,%rdi
    cf1b:	4c 89 fe             	mov    %r15,%rsi
    cf1e:	4c 89 e2             	mov    %r12,%rdx
    cf21:	4c 89 e9             	mov    %r13,%rcx
    cf24:	e8 f7 0c 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    cf29:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    cf2d:	74 1c                	je     cf4b <hyperinterval::float::F64Enclosure::reciprocal+0x6b>
    cf2f:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    cf34:	48 89 e7             	mov    %rsp,%rdi
    cf37:	4c 89 fe             	mov    %r15,%rsi
    cf3a:	4c 89 e2             	mov    %r12,%rdx
    cf3d:	4c 89 e9             	mov    %r13,%rcx
    cf40:	e8 db 0c 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    cf45:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    cf49:	75 2a                	jne    cf75 <hyperinterval::float::F64Enclosure::reciprocal+0x95>
    cf4b:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
    cf50:	88 53 08             	mov    %dl,0x8(%rbx)
    cf53:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    cf5a:	eb 07                	jmp    cf63 <hyperinterval::float::F64Enclosure::reciprocal+0x83>
    cf5c:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    cf63:	48 89 d8             	mov    %rbx,%rax
    cf66:	48 83 c4 28          	add    $0x28,%rsp
    cf6a:	5b                   	pop    %rbx
    cf6b:	41 5c                	pop    %r12
    cf6d:	41 5d                	pop    %r13
    cf6f:	41 5e                	pop    %r14
    cf71:	41 5f                	pop    %r15
    cf73:	5d                   	pop    %rbp
    cf74:	c3                   	ret
    cf75:	48 89 e9             	mov    %rbp,%rcx
    cf78:	4c 09 f9             	or     %r15,%rcx
    cf7b:	49 8d 47 ff          	lea    -0x1(%r15),%rax
    cf7f:	48 89 ea             	mov    %rbp,%rdx
    cf82:	48 21 c2             	and    %rax,%rdx
    cf85:	4c 89 fe             	mov    %r15,%rsi
    cf88:	48 29 d6             	sub    %rdx,%rsi
    cf8b:	48 85 ed             	test   %rbp,%rbp
    cf8e:	48 0f 49 f1          	cmovns %rcx,%rsi
    cf92:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    cf97:	48 89 ca             	mov    %rcx,%rdx
    cf9a:	4c 09 fa             	or     %r15,%rdx
    cf9d:	48 89 cf             	mov    %rcx,%rdi
    cfa0:	48 21 c7             	and    %rax,%rdi
    cfa3:	4d 89 f8             	mov    %r15,%r8
    cfa6:	49 29 f8             	sub    %rdi,%r8
    cfa9:	48 85 c9             	test   %rcx,%rcx
    cfac:	4c 0f 49 c2          	cmovns %rdx,%r8
    cfb0:	b2 01                	mov    $0x1,%dl
    cfb2:	4c 39 c6             	cmp    %r8,%rsi
    cfb5:	77 99                	ja     cf50 <hyperinterval::float::F64Enclosure::reciprocal+0x70>
    cfb7:	48 89 ea             	mov    %rbp,%rdx
    cfba:	48 c1 ea 08          	shr    $0x8,%rdx
    cfbe:	48 c7 44 24 10 01 00 	movq   $0x1,0x10(%rsp)
    cfc5:	00 00 
    cfc7:	40 88 6c 24 18       	mov    %bpl,0x18(%rsp)
    cfcc:	48 89 ee             	mov    %rbp,%rsi
    cfcf:	48 c1 ee 38          	shr    $0x38,%rsi
    cfd3:	40 88 74 24 1f       	mov    %sil,0x1f(%rsp)
    cfd8:	48 c1 ed 28          	shr    $0x28,%rbp
    cfdc:	66 89 6c 24 1d       	mov    %bp,0x1d(%rsp)
    cfe1:	89 54 24 19          	mov    %edx,0x19(%rsp)
    cfe5:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
    cfea:	49 8b 4e 08          	mov    0x8(%r14),%rcx
    cfee:	48 89 ca             	mov    %rcx,%rdx
    cff1:	4c 09 fa             	or     %r15,%rdx
    cff4:	48 89 ce             	mov    %rcx,%rsi
    cff7:	48 21 c6             	and    %rax,%rsi
    cffa:	4c 89 ff             	mov    %r15,%rdi
    cffd:	48 29 f7             	sub    %rsi,%rdi
    d000:	48 85 c9             	test   %rcx,%rcx
    d003:	48 0f 49 fa          	cmovns %rdx,%rdi
    d007:	4c 39 ff             	cmp    %r15,%rdi
    d00a:	77 1b                	ja     d027 <hyperinterval::float::F64Enclosure::reciprocal+0x147>
    d00c:	49 8b 4e 10          	mov    0x10(%r14),%rcx
    d010:	48 21 c8             	and    %rcx,%rax
    d013:	4c 01 f8             	add    %r15,%rax
    d016:	48 ff c8             	dec    %rax
    d019:	48 85 c1             	test   %rax,%rcx
    d01c:	78 09                	js     d027 <hyperinterval::float::F64Enclosure::reciprocal+0x147>
    d01e:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
    d022:	e9 2c ff ff ff       	jmp    cf53 <hyperinterval::float::F64Enclosure::reciprocal+0x73>
    d027:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
    d02c:	48 89 df             	mov    %rbx,%rdi
    d02f:	4c 89 f2             	mov    %r14,%rdx
    d032:	b9 01 00 00 00       	mov    $0x1,%ecx
    d037:	e8 d4 f3 ff ff       	call   c410 <hyperinterval::float::F64Enclosure::corner_image>
    d03c:	e9 22 ff ff ff       	jmp    cf63 <hyperinterval::float::F64Enclosure::reciprocal+0x83>
    d041:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    d048:	00 00 00 
    d04b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

hyperinterval::float::F64Enclosure::square:
    d050:	55                   	push   %rbp
    d051:	41 57                	push   %r15
    d053:	41 56                	push   %r14
    d055:	41 55                	push   %r13
    d057:	41 54                	push   %r12
    d059:	53                   	push   %rbx
    d05a:	48 83 ec 58          	sub    $0x58,%rsp
    d05e:	48 89 fb             	mov    %rdi,%rbx
    d061:	f6 06 01             	testb  $0x1,(%rsi)
    d064:	0f 84 08 01 00 00    	je     d172 <hyperinterval::float::F64Enclosure::square+0x122>
    d06a:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
    d06e:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
    d075:	00 00 80 
    d078:	49 b8 00 00 00 00 00 	movabs $0x7ff0000000000000,%r8
    d07f:	00 f0 7f 
    d082:	49 be ff ff ff ff ff 	movabs $0xfffffffffffff,%r14
    d089:	ff 0f 00 
    d08c:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
    d090:	48 89 c8             	mov    %rcx,%rax
    d093:	48 c1 e8 34          	shr    $0x34,%rax
    d097:	25 ff 07 00 00       	and    $0x7ff,%eax
    d09c:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
    d0a1:	4c 21 f1             	and    %r14,%rcx
    d0a4:	49 8d 6e 01          	lea    0x1(%r14),%rbp
    d0a8:	48 85 c0             	test   %rax,%rax
    d0ab:	8d b4 00 9a f7 ff ff 	lea    -0x866(%rax,%rax,1),%esi
    d0b2:	48 0f 45 c5          	cmovne %rbp,%rax
    d0b6:	41 bd 9c f7 ff ff    	mov    $0xfffff79c,%r13d
    d0bc:	41 0f 44 f5          	cmove  %r13d,%esi
    d0c0:	48 09 c8             	or     %rcx,%rax
    d0c3:	48 f7 e0             	mul    %rax
    d0c6:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
    d0cb:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    d0d0:	48 89 04 24          	mov    %rax,(%rsp)
    d0d4:	89 74 24 10          	mov    %esi,0x10(%rsp)
    d0d8:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
    d0dd:	48 89 e1             	mov    %rsp,%rcx
    d0e0:	4c 89 e6             	mov    %r12,%rsi
    d0e3:	4c 89 c2             	mov    %r8,%rdx
    d0e6:	e8 75 0b 00 00       	call   dc60 <hyperinterval::ieee::Format::rounded>
    d0eb:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
    d0f0:	75 79                	jne    d16b <hyperinterval::float::F64Enclosure::square+0x11b>
    d0f2:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
    d0f7:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    d0fc:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
    d101:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    d106:	4c 89 f8             	mov    %r15,%rax
    d109:	48 c1 e8 34          	shr    $0x34,%rax
    d10d:	25 ff 07 00 00       	and    $0x7ff,%eax
    d112:	4c 89 7c 24 48       	mov    %r15,0x48(%rsp)
    d117:	4d 21 fe             	and    %r15,%r14
    d11a:	48 85 c0             	test   %rax,%rax
    d11d:	48 0f 44 e8          	cmove  %rax,%rbp
    d121:	8d 8c 00 9a f7 ff ff 	lea    -0x866(%rax,%rax,1),%ecx
    d128:	41 0f 44 cd          	cmove  %r13d,%ecx
    d12c:	4c 09 f5             	or     %r14,%rbp
    d12f:	48 89 e8             	mov    %rbp,%rax
    d132:	48 f7 e5             	mul    %rbp
    d135:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
    d13a:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    d13f:	48 89 04 24          	mov    %rax,(%rsp)
    d143:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
    d147:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
    d14c:	48 89 e1             	mov    %rsp,%rcx
    d14f:	4c 89 e6             	mov    %r12,%rsi
    d152:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
    d159:	00 f0 7f 
    d15c:	4c 89 fa             	mov    %r15,%rdx
    d15f:	e8 fc 0a 00 00       	call   dc60 <hyperinterval::ieee::Format::rounded>
    d164:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
    d169:	75 10                	jne    d17b <hyperinterval::float::F64Enclosure::square+0x12b>
    d16b:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
    d170:	eb 4f                	jmp    d1c1 <hyperinterval::float::F64Enclosure::square+0x171>
    d172:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    d179:	eb 50                	jmp    d1cb <hyperinterval::float::F64Enclosure::square+0x17b>
    d17b:	48 8b 6c 24 38       	mov    0x38(%rsp),%rbp
    d180:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
    d185:	48 89 e7             	mov    %rsp,%rdi
    d188:	4c 89 e6             	mov    %r12,%rsi
    d18b:	4c 89 fa             	mov    %r15,%rdx
    d18e:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    d193:	e8 88 0a 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    d198:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d19c:	74 1e                	je     d1bc <hyperinterval::float::F64Enclosure::square+0x16c>
    d19e:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    d1a3:	48 89 e7             	mov    %rsp,%rdi
    d1a6:	4c 89 e6             	mov    %r12,%rsi
    d1a9:	4c 89 fa             	mov    %r15,%rdx
    d1ac:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    d1b1:	e8 6a 0a 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    d1b6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d1ba:	75 21                	jne    d1dd <hyperinterval::float::F64Enclosure::square+0x18d>
    d1bc:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    d1c1:	88 43 08             	mov    %al,0x8(%rbx)
    d1c4:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    d1cb:	48 89 d8             	mov    %rbx,%rax
    d1ce:	48 83 c4 58          	add    $0x58,%rsp
    d1d2:	5b                   	pop    %rbx
    d1d3:	41 5c                	pop    %r12
    d1d5:	41 5d                	pop    %r13
    d1d7:	41 5e                	pop    %r14
    d1d9:	41 5f                	pop    %r15
    d1db:	5d                   	pop    %rbp
    d1dc:	c3                   	ret
    d1dd:	4c 89 74 24 28       	mov    %r14,0x28(%rsp)
    d1e2:	4c 89 e8             	mov    %r13,%rax
    d1e5:	4c 09 e0             	or     %r12,%rax
    d1e8:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
    d1ed:	4c 89 e9             	mov    %r13,%rcx
    d1f0:	4c 21 f1             	and    %r14,%rcx
    d1f3:	4c 89 e2             	mov    %r12,%rdx
    d1f6:	48 29 ca             	sub    %rcx,%rdx
    d1f9:	4d 85 ed             	test   %r13,%r13
    d1fc:	48 0f 49 d0          	cmovns %rax,%rdx
    d200:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    d205:	48 89 f8             	mov    %rdi,%rax
    d208:	4c 09 e0             	or     %r12,%rax
    d20b:	48 89 f9             	mov    %rdi,%rcx
    d20e:	4c 21 f1             	and    %r14,%rcx
    d211:	4c 89 e6             	mov    %r12,%rsi
    d214:	48 29 ce             	sub    %rcx,%rsi
    d217:	48 85 ff             	test   %rdi,%rdi
    d21a:	48 0f 49 f0          	cmovns %rax,%rsi
    d21e:	b0 01                	mov    $0x1,%al
    d220:	48 39 f2             	cmp    %rsi,%rdx
    d223:	77 9c                	ja     d1c1 <hyperinterval::float::F64Enclosure::square+0x171>
    d225:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
    d22a:	48 89 e7             	mov    %rsp,%rdi
    d22d:	4c 89 e6             	mov    %r12,%rsi
    d230:	4c 89 fa             	mov    %r15,%rdx
    d233:	48 89 e9             	mov    %rbp,%rcx
    d236:	e8 e5 09 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    d23b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d23f:	0f 84 77 ff ff ff    	je     d1bc <hyperinterval::float::F64Enclosure::square+0x16c>
    d245:	4c 89 ed             	mov    %r13,%rbp
    d248:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    d24d:	48 89 e7             	mov    %rsp,%rdi
    d250:	4c 89 e6             	mov    %r12,%rsi
    d253:	4c 89 fa             	mov    %r15,%rdx
    d256:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    d25b:	e8 c0 09 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    d260:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d264:	0f 84 52 ff ff ff    	je     d1bc <hyperinterval::float::F64Enclosure::square+0x16c>
    d26a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    d26f:	4c 89 e8             	mov    %r13,%rax
    d272:	4c 09 e0             	or     %r12,%rax
    d275:	4c 89 ea             	mov    %r13,%rdx
    d278:	4c 21 f2             	and    %r14,%rdx
    d27b:	4c 89 e6             	mov    %r12,%rsi
    d27e:	48 29 d6             	sub    %rdx,%rsi
    d281:	4d 85 ed             	test   %r13,%r13
    d284:	48 0f 49 f0          	cmovns %rax,%rsi
    d288:	48 89 c8             	mov    %rcx,%rax
    d28b:	4c 09 e0             	or     %r12,%rax
    d28e:	49 21 ce             	and    %rcx,%r14
    d291:	4d 29 f4             	sub    %r14,%r12
    d294:	48 85 c9             	test   %rcx,%rcx
    d297:	4c 0f 49 e0          	cmovns %rax,%r12
    d29b:	b0 01                	mov    $0x1,%al
    d29d:	4c 39 e6             	cmp    %r12,%rsi
    d2a0:	0f 87 1b ff ff ff    	ja     d1c1 <hyperinterval::float::F64Enclosure::square+0x171>
    d2a6:	48 89 ef             	mov    %rbp,%rdi
    d2a9:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    d2ae:	4c 89 ea             	mov    %r13,%rdx
    d2b1:	e8 2a 07 00 00       	call   d9e0 <hyperinterval::bounds::Bounds<T>::hull>
    d2b6:	49 89 c5             	mov    %rax,%r13
    d2b9:	49 89 d4             	mov    %rdx,%r12
    d2bc:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
    d2c1:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
    d2c6:	31 d2                	xor    %edx,%edx
    d2c8:	e8 c3 08 00 00       	call   db90 <hyperinterval::bounds::Bounds<T>::signs>
    d2cd:	a8 02                	test   $0x2,%al
    d2cf:	75 14                	jne    d2e5 <hyperinterval::float::F64Enclosure::square+0x295>
    d2d1:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
    d2d8:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
    d2dc:	4c 89 63 10          	mov    %r12,0x10(%rbx)
    d2e0:	e9 e6 fe ff ff       	jmp    d1cb <hyperinterval::float::F64Enclosure::square+0x17b>
    d2e5:	48 89 e7             	mov    %rsp,%rdi
    d2e8:	e8 d3 e8 ff ff       	call   bbc0 <hyperinterval::float::F64Enclosure::from_bits>
    d2ed:	48 8b 0c 24          	mov    (%rsp),%rcx
    d2f1:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
    d2f6:	48 83 f9 02          	cmp    $0x2,%rcx
    d2fa:	0f 84 c1 fe ff ff    	je     d1c1 <hyperinterval::float::F64Enclosure::square+0x171>
    d300:	f6 c1 01             	test   $0x1,%cl
    d303:	74 cc                	je     d2d1 <hyperinterval::float::F64Enclosure::square+0x281>
    d305:	0f b6 c0             	movzbl %al,%eax
    d308:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
    d30d:	c1 e1 10             	shl    $0x10,%ecx
    d310:	0f b7 74 24 0d       	movzwl 0xd(%rsp),%esi
    d315:	09 ce                	or     %ecx,%esi
    d317:	48 c1 e6 20          	shl    $0x20,%rsi
    d31b:	8b 54 24 09          	mov    0x9(%rsp),%edx
    d31f:	48 09 f2             	or     %rsi,%rdx
    d322:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    d327:	48 c1 e2 08          	shl    $0x8,%rdx
    d32b:	48 09 c2             	or     %rax,%rdx
    d32e:	4c 89 ef             	mov    %r13,%rdi
    d331:	4c 89 e6             	mov    %r12,%rsi
    d334:	e8 a7 06 00 00       	call   d9e0 <hyperinterval::bounds::Bounds<T>::hull>
    d339:	49 89 c5             	mov    %rax,%r13
    d33c:	49 89 d4             	mov    %rdx,%r12
    d33f:	eb 90                	jmp    d2d1 <hyperinterval::float::F64Enclosure::square+0x281>
    d341:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    d348:	00 00 00 
    d34b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

hyperinterval::float::F64Enclosure::checked_pow:
    d350:	55                   	push   %rbp
    d351:	41 57                	push   %r15
    d353:	41 56                	push   %r14
    d355:	41 55                	push   %r13
    d357:	41 54                	push   %r12
    d359:	53                   	push   %rbx
    d35a:	48 83 ec 48          	sub    $0x48,%rsp
    d35e:	48 89 fb             	mov    %rdi,%rbx
    d361:	83 fa 02             	cmp    $0x2,%edx
    d364:	75 0e                	jne    d374 <hyperinterval::float::F64Enclosure::checked_pow+0x24>
    d366:	48 89 df             	mov    %rbx,%rdi
    d369:	ff 15 91 17 05 00    	call   *0x51791(%rip)        # 5eb00 <_GLOBAL_OFFSET_TABLE_+0x510>
    d36f:	e9 e0 00 00 00       	jmp    d454 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
    d374:	f6 06 01             	testb  $0x1,(%rsi)
    d377:	0f 84 d0 00 00 00    	je     d44d <hyperinterval::float::F64Enclosure::checked_pow+0xfd>
    d37d:	89 d5                	mov    %edx,%ebp
    d37f:	4c 8b 76 10          	mov    0x10(%rsi),%r14
    d383:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
    d38a:	00 00 80 
    d38d:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
    d394:	00 f0 7f 
    d397:	4c 8b 7e 08          	mov    0x8(%rsi),%r15
    d39b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    d3a0:	4c 89 e6             	mov    %r12,%rsi
    d3a3:	4c 89 ea             	mov    %r13,%rdx
    d3a6:	4c 89 f9             	mov    %r15,%rcx
    d3a9:	41 89 e8             	mov    %ebp,%r8d
    d3ac:	e8 9f 12 00 00       	call   e650 <hyperinterval::ieee::Format::power>
    d3b1:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
    d3b6:	0f 85 80 00 00 00    	jne    d43c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
    d3bc:	4c 89 f1             	mov    %r14,%rcx
    d3bf:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
    d3c4:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    d3c9:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    d3ce:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    d3d3:	4c 89 e6             	mov    %r12,%rsi
    d3d6:	4c 89 ea             	mov    %r13,%rdx
    d3d9:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
    d3de:	41 89 e8             	mov    %ebp,%r8d
    d3e1:	e8 6a 12 00 00       	call   e650 <hyperinterval::ieee::Format::power>
    d3e6:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    d3eb:	74 4f                	je     d43c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
    d3ed:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    d3f2:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    d3f7:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    d3fc:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
    d401:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    d406:	4c 89 e6             	mov    %r12,%rsi
    d409:	4c 89 ea             	mov    %r13,%rdx
    d40c:	4c 89 f1             	mov    %r14,%rcx
    d40f:	e8 0c 08 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    d414:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    d419:	74 21                	je     d43c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
    d41b:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
    d420:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    d425:	4c 89 e6             	mov    %r12,%rsi
    d428:	4c 89 ea             	mov    %r13,%rdx
    d42b:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    d430:	e8 eb 07 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    d435:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    d43a:	75 2a                	jne    d466 <hyperinterval::float::F64Enclosure::checked_pow+0x116>
    d43c:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
    d441:	88 43 08             	mov    %al,0x8(%rbx)
    d444:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    d44b:	eb 07                	jmp    d454 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
    d44d:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    d454:	48 89 d8             	mov    %rbx,%rax
    d457:	48 83 c4 48          	add    $0x48,%rsp
    d45b:	5b                   	pop    %rbx
    d45c:	41 5c                	pop    %r12
    d45e:	41 5d                	pop    %r13
    d460:	41 5e                	pop    %r14
    d462:	41 5f                	pop    %r15
    d464:	5d                   	pop    %rbp
    d465:	c3                   	ret
    d466:	4c 89 f0             	mov    %r14,%rax
    d469:	4c 09 e0             	or     %r12,%rax
    d46c:	4c 89 f6             	mov    %r14,%rsi
    d46f:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
    d474:	48 89 f1             	mov    %rsi,%rcx
    d477:	4c 21 f1             	and    %r14,%rcx
    d47a:	4c 89 e2             	mov    %r12,%rdx
    d47d:	48 29 ca             	sub    %rcx,%rdx
    d480:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
    d485:	48 85 f6             	test   %rsi,%rsi
    d488:	48 0f 49 d0          	cmovns %rax,%rdx
    d48c:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    d491:	48 89 f8             	mov    %rdi,%rax
    d494:	4c 09 e0             	or     %r12,%rax
    d497:	48 89 f9             	mov    %rdi,%rcx
    d49a:	4c 21 f1             	and    %r14,%rcx
    d49d:	4c 89 e6             	mov    %r12,%rsi
    d4a0:	48 29 ce             	sub    %rcx,%rsi
    d4a3:	48 85 ff             	test   %rdi,%rdi
    d4a6:	48 0f 49 f0          	cmovns %rax,%rsi
    d4aa:	b0 01                	mov    $0x1,%al
    d4ac:	48 39 f2             	cmp    %rsi,%rdx
    d4af:	77 90                	ja     d441 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
    d4b1:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
    d4b6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    d4bb:	4c 89 e6             	mov    %r12,%rsi
    d4be:	4c 89 ea             	mov    %r13,%rdx
    d4c1:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    d4c6:	e8 55 07 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    d4cb:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    d4d0:	0f 84 66 ff ff ff    	je     d43c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
    d4d6:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    d4db:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    d4e0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    d4e5:	4c 89 e6             	mov    %r12,%rsi
    d4e8:	4c 89 ea             	mov    %r13,%rdx
    d4eb:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
    d4f0:	e8 2b 07 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    d4f5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    d4fa:	0f 84 3c ff ff ff    	je     d43c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
    d500:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    d505:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    d50a:	48 89 d0             	mov    %rdx,%rax
    d50d:	4c 09 e0             	or     %r12,%rax
    d510:	48 89 d7             	mov    %rdx,%rdi
    d513:	4c 21 f7             	and    %r14,%rdi
    d516:	4c 89 e6             	mov    %r12,%rsi
    d519:	48 29 fe             	sub    %rdi,%rsi
    d51c:	48 85 d2             	test   %rdx,%rdx
    d51f:	48 0f 49 f0          	cmovns %rax,%rsi
    d523:	48 89 c8             	mov    %rcx,%rax
    d526:	4c 09 e0             	or     %r12,%rax
    d529:	49 21 ce             	and    %rcx,%r14
    d52c:	4d 29 f4             	sub    %r14,%r12
    d52f:	48 85 c9             	test   %rcx,%rcx
    d532:	4c 0f 49 e0          	cmovns %rax,%r12
    d536:	b0 01                	mov    $0x1,%al
    d538:	4c 39 e6             	cmp    %r12,%rsi
    d53b:	0f 87 00 ff ff ff    	ja     d441 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
    d541:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
    d546:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
    d54b:	e8 90 04 00 00       	call   d9e0 <hyperinterval::bounds::Bounds<T>::hull>
    d550:	49 89 c5             	mov    %rax,%r13
    d553:	49 89 d4             	mov    %rdx,%r12
    d556:	85 ed                	test   %ebp,%ebp
    d558:	0f 95 c0             	setne  %al
    d55b:	40 f6 c5 01          	test   $0x1,%bpl
    d55f:	0f 94 c1             	sete   %cl
    d562:	84 c8                	test   %cl,%al
    d564:	74 13                	je     d579 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
    d566:	4c 89 ff             	mov    %r15,%rdi
    d569:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
    d56e:	31 d2                	xor    %edx,%edx
    d570:	e8 1b 06 00 00       	call   db90 <hyperinterval::bounds::Bounds<T>::signs>
    d575:	a8 02                	test   $0x2,%al
    d577:	75 14                	jne    d58d <hyperinterval::float::F64Enclosure::checked_pow+0x23d>
    d579:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
    d580:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
    d584:	4c 89 63 10          	mov    %r12,0x10(%rbx)
    d588:	e9 c7 fe ff ff       	jmp    d454 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
    d58d:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    d592:	e8 29 e6 ff ff       	call   bbc0 <hyperinterval::float::F64Enclosure::from_bits>
    d597:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    d59c:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
    d5a1:	48 83 f9 02          	cmp    $0x2,%rcx
    d5a5:	0f 84 96 fe ff ff    	je     d441 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
    d5ab:	f6 c1 01             	test   $0x1,%cl
    d5ae:	74 c9                	je     d579 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
    d5b0:	0f b6 c0             	movzbl %al,%eax
    d5b3:	0f b6 4c 24 17       	movzbl 0x17(%rsp),%ecx
    d5b8:	c1 e1 10             	shl    $0x10,%ecx
    d5bb:	0f b7 74 24 15       	movzwl 0x15(%rsp),%esi
    d5c0:	09 ce                	or     %ecx,%esi
    d5c2:	48 c1 e6 20          	shl    $0x20,%rsi
    d5c6:	8b 54 24 11          	mov    0x11(%rsp),%edx
    d5ca:	48 09 f2             	or     %rsi,%rdx
    d5cd:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    d5d2:	48 c1 e2 08          	shl    $0x8,%rdx
    d5d6:	48 09 c2             	or     %rax,%rdx
    d5d9:	4c 89 ef             	mov    %r13,%rdi
    d5dc:	4c 89 e6             	mov    %r12,%rsi
    d5df:	e8 fc 03 00 00       	call   d9e0 <hyperinterval::bounds::Bounds<T>::hull>
    d5e4:	49 89 c5             	mov    %rax,%r13
    d5e7:	49 89 d4             	mov    %rdx,%r12
    d5ea:	eb 8d                	jmp    d579 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
    d5ec:	0f 1f 40 00          	nopl   0x0(%rax)

hyperinterval::float::F64Enclosure::affine:
    d5f0:	41 57                	push   %r15
    d5f2:	41 56                	push   %r14
    d5f4:	41 54                	push   %r12
    d5f6:	53                   	push   %rbx
    d5f7:	48 83 ec 68          	sub    $0x68,%rsp
    d5fb:	f2 0f 11 4c 24 48    	movsd  %xmm1,0x48(%rsp)
    d601:	49 89 f6             	mov    %rsi,%r14
    d604:	48 89 fb             	mov    %rdi,%rbx
    d607:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
    d60e:	00 00 80 
    d611:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
    d618:	00 f0 7f 
    d61b:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    d620:	48 89 e7             	mov    %rsp,%rdi
    d623:	4c 89 fe             	mov    %r15,%rsi
    d626:	4c 89 e2             	mov    %r12,%rdx
    d629:	e8 f2 05 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    d62e:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d632:	74 58                	je     d68c <hyperinterval::float::F64Enclosure::affine+0x9c>
    d634:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    d639:	48 89 c1             	mov    %rax,%rcx
    d63c:	48 c1 e9 08          	shr    $0x8,%rcx
    d640:	48 c7 44 24 18 01 00 	movq   $0x1,0x18(%rsp)
    d647:	00 00 
    d649:	88 44 24 20          	mov    %al,0x20(%rsp)
    d64d:	48 89 c2             	mov    %rax,%rdx
    d650:	48 c1 ea 38          	shr    $0x38,%rdx
    d654:	88 54 24 27          	mov    %dl,0x27(%rsp)
    d658:	48 89 c2             	mov    %rax,%rdx
    d65b:	48 c1 ea 28          	shr    $0x28,%rdx
    d65f:	66 89 54 24 25       	mov    %dx,0x25(%rsp)
    d664:	89 4c 24 21          	mov    %ecx,0x21(%rsp)
    d668:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    d66d:	f3 0f 7e 44 24 48    	movq   0x48(%rsp),%xmm0
    d673:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    d678:	48 89 e7             	mov    %rsp,%rdi
    d67b:	4c 89 fe             	mov    %r15,%rsi
    d67e:	4c 89 e2             	mov    %r12,%rdx
    d681:	e8 9a 05 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    d686:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d68a:	75 1e                	jne    d6aa <hyperinterval::float::F64Enclosure::affine+0xba>
    d68c:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    d691:	88 43 08             	mov    %al,0x8(%rbx)
    d694:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    d69b:	48 89 d8             	mov    %rbx,%rax
    d69e:	48 83 c4 68          	add    $0x68,%rsp
    d6a2:	5b                   	pop    %rbx
    d6a3:	41 5c                	pop    %r12
    d6a5:	41 5e                	pop    %r14
    d6a7:	41 5f                	pop    %r15
    d6a9:	c3                   	ret
    d6aa:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    d6af:	48 89 c1             	mov    %rax,%rcx
    d6b2:	48 c1 e9 08          	shr    $0x8,%rcx
    d6b6:	48 c7 44 24 30 01 00 	movq   $0x1,0x30(%rsp)
    d6bd:	00 00 
    d6bf:	88 44 24 38          	mov    %al,0x38(%rsp)
    d6c3:	48 89 c2             	mov    %rax,%rdx
    d6c6:	48 c1 ea 38          	shr    $0x38,%rdx
    d6ca:	88 54 24 3f          	mov    %dl,0x3f(%rsp)
    d6ce:	48 89 c2             	mov    %rax,%rdx
    d6d1:	48 c1 ea 28          	shr    $0x28,%rdx
    d6d5:	66 89 54 24 3d       	mov    %dx,0x3d(%rsp)
    d6da:	89 4c 24 39          	mov    %ecx,0x39(%rsp)
    d6de:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    d6e3:	48 89 e7             	mov    %rsp,%rdi
    d6e6:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
    d6eb:	4c 89 f6             	mov    %r14,%rsi
    d6ee:	31 c9                	xor    %ecx,%ecx
    d6f0:	e8 1b ed ff ff       	call   c410 <hyperinterval::float::F64Enclosure::corner_image>
    d6f5:	48 8b 0c 24          	mov    (%rsp),%rcx
    d6f9:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
    d6fe:	48 83 f9 02          	cmp    $0x2,%rcx
    d702:	74 8d                	je     d691 <hyperinterval::float::F64Enclosure::affine+0xa1>
    d704:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
    d709:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
    d70e:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
    d713:	48 89 54 24 59       	mov    %rdx,0x59(%rsp)
    d718:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
    d71d:	88 44 24 58          	mov    %al,0x58(%rsp)
    d721:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
    d726:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
    d72b:	48 89 df             	mov    %rbx,%rdi
    d72e:	ff 15 54 15 05 00    	call   *0x51554(%rip)        # 5ec88 <_GLOBAL_OFFSET_TABLE_+0x698>
    d734:	e9 62 ff ff ff       	jmp    d69b <hyperinterval::float::F64Enclosure::affine+0xab>
    d739:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

hyperinterval::float::F64Enclosure::next_down:
    d740:	41 57                	push   %r15
    d742:	41 56                	push   %r14
    d744:	53                   	push   %rbx
    d745:	48 83 ec 10          	sub    $0x10,%rsp
    d749:	48 89 fb             	mov    %rdi,%rbx
    d74c:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
    d753:	00 00 80 
    d756:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
    d75d:	00 f0 7f 
    d760:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    d765:	48 89 e7             	mov    %rsp,%rdi
    d768:	4c 89 f6             	mov    %r14,%rsi
    d76b:	4c 89 fa             	mov    %r15,%rdx
    d76e:	e8 ad 04 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    d773:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d777:	75 0c                	jne    d785 <hyperinterval::float::F64Enclosure::next_down+0x45>
    d779:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    d77e:	88 43 01             	mov    %al,0x1(%rbx)
    d781:	b0 01                	mov    $0x1,%al
    d783:	eb 51                	jmp    d7d6 <hyperinterval::float::F64Enclosure::next_down+0x96>
    d785:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    d78a:	48 89 c2             	mov    %rax,%rdx
    d78d:	4c 31 f2             	xor    %r14,%rdx
    d790:	48 85 c0             	test   %rax,%rax
    d793:	48 0f 44 d0          	cmove  %rax,%rdx
    d797:	48 89 d1             	mov    %rdx,%rcx
    d79a:	48 c1 f9 3f          	sar    $0x3f,%rcx
    d79e:	48 83 c9 01          	or     $0x1,%rcx
    d7a2:	48 01 d1             	add    %rdx,%rcx
    d7a5:	48 89 e7             	mov    %rsp,%rdi
    d7a8:	4c 89 f6             	mov    %r14,%rsi
    d7ab:	4c 89 fa             	mov    %r15,%rdx
    d7ae:	e8 6d 04 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    d7b3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d7b7:	75 08                	jne    d7c1 <hyperinterval::float::F64Enclosure::next_down+0x81>
    d7b9:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
    d7bd:	b0 01                	mov    $0x1,%al
    d7bf:	eb 15                	jmp    d7d6 <hyperinterval::float::F64Enclosure::next_down+0x96>
    d7c1:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    d7c6:	49 31 c6             	xor    %rax,%r14
    d7c9:	48 85 c0             	test   %rax,%rax
    d7cc:	4c 0f 44 f0          	cmove  %rax,%r14
    d7d0:	4c 89 73 08          	mov    %r14,0x8(%rbx)
    d7d4:	31 c0                	xor    %eax,%eax
    d7d6:	88 03                	mov    %al,(%rbx)
    d7d8:	48 89 d8             	mov    %rbx,%rax
    d7db:	48 83 c4 10          	add    $0x10,%rsp
    d7df:	5b                   	pop    %rbx
    d7e0:	41 5e                	pop    %r14
    d7e2:	41 5f                	pop    %r15
    d7e4:	c3                   	ret
    d7e5:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    d7ec:	00 00 00 
    d7ef:	90                   	nop

hyperinterval::float::F64Enclosure::next_up:
    d7f0:	41 57                	push   %r15
    d7f2:	41 56                	push   %r14
    d7f4:	53                   	push   %rbx
    d7f5:	48 83 ec 10          	sub    $0x10,%rsp
    d7f9:	48 89 fb             	mov    %rdi,%rbx
    d7fc:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
    d803:	00 00 80 
    d806:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
    d80d:	00 f0 7f 
    d810:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    d815:	48 89 e7             	mov    %rsp,%rdi
    d818:	4c 89 f6             	mov    %r14,%rsi
    d81b:	4c 89 fa             	mov    %r15,%rdx
    d81e:	e8 fd 03 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    d823:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d827:	75 0c                	jne    d835 <hyperinterval::float::F64Enclosure::next_up+0x45>
    d829:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    d82e:	88 43 01             	mov    %al,0x1(%rbx)
    d831:	b0 01                	mov    $0x1,%al
    d833:	eb 3c                	jmp    d871 <hyperinterval::float::F64Enclosure::next_up+0x81>
    d835:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    d83a:	48 89 c1             	mov    %rax,%rcx
    d83d:	48 c1 f9 3f          	sar    $0x3f,%rcx
    d841:	48 83 c9 01          	or     $0x1,%rcx
    d845:	48 01 c1             	add    %rax,%rcx
    d848:	48 89 e7             	mov    %rsp,%rdi
    d84b:	4c 89 f6             	mov    %r14,%rsi
    d84e:	4c 89 fa             	mov    %r15,%rdx
    d851:	e8 ca 03 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    d856:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d85a:	75 08                	jne    d864 <hyperinterval::float::F64Enclosure::next_up+0x74>
    d85c:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
    d860:	b0 01                	mov    $0x1,%al
    d862:	eb 0d                	jmp    d871 <hyperinterval::float::F64Enclosure::next_up+0x81>
    d864:	f3 0f 7e 44 24 08    	movq   0x8(%rsp),%xmm0
    d86a:	66 0f d6 43 08       	movq   %xmm0,0x8(%rbx)
    d86f:	31 c0                	xor    %eax,%eax
    d871:	88 03                	mov    %al,(%rbx)
    d873:	48 89 d8             	mov    %rbx,%rax
    d876:	48 83 c4 10          	add    $0x10,%rsp
    d87a:	5b                   	pop    %rbx
    d87b:	41 5e                	pop    %r14
    d87d:	41 5f                	pop    %r15
    d87f:	c3                   	ret

hyperinterval::float::F64Enclosure::expanded:
    d880:	41 57                	push   %r15
    d882:	41 56                	push   %r14
    d884:	41 55                	push   %r13
    d886:	41 54                	push   %r12
    d888:	53                   	push   %rbx
    d889:	48 83 ec 10          	sub    $0x10,%rsp
    d88d:	48 89 fb             	mov    %rdi,%rbx
    d890:	f6 06 01             	testb  $0x1,(%rsi)
    d893:	74 7f                	je     d914 <hyperinterval::float::F64Enclosure::expanded+0x94>
    d895:	4c 8b 66 10          	mov    0x10(%rsi),%r12
    d899:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
    d8a0:	00 00 80 
    d8a3:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
    d8aa:	00 f0 7f 
    d8ad:	48 8b 46 08          	mov    0x8(%rsi),%rax
    d8b1:	48 89 c2             	mov    %rax,%rdx
    d8b4:	4c 31 f2             	xor    %r14,%rdx
    d8b7:	48 85 c0             	test   %rax,%rax
    d8ba:	48 0f 44 d0          	cmove  %rax,%rdx
    d8be:	48 89 d1             	mov    %rdx,%rcx
    d8c1:	48 c1 f9 3f          	sar    $0x3f,%rcx
    d8c5:	48 83 c9 01          	or     $0x1,%rcx
    d8c9:	48 01 d1             	add    %rdx,%rcx
    d8cc:	48 89 e7             	mov    %rsp,%rdi
    d8cf:	4c 89 f6             	mov    %r14,%rsi
    d8d2:	4c 89 fa             	mov    %r15,%rdx
    d8d5:	e8 46 03 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    d8da:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    d8de:	75 27                	jne    d907 <hyperinterval::float::F64Enclosure::expanded+0x87>
    d8e0:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    d8e5:	4c 89 e1             	mov    %r12,%rcx
    d8e8:	48 c1 f9 3f          	sar    $0x3f,%rcx
    d8ec:	48 83 c9 01          	or     $0x1,%rcx
    d8f0:	4c 01 e1             	add    %r12,%rcx
    d8f3:	48 89 e7             	mov    %rsp,%rdi
    d8f6:	4c 89 f6             	mov    %r14,%rsi
    d8f9:	4c 89 fa             	mov    %r15,%rdx
    d8fc:	e8 1f 03 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    d901:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d905:	75 25                	jne    d92c <hyperinterval::float::F64Enclosure::expanded+0xac>
    d907:	c6 43 08 03          	movb   $0x3,0x8(%rbx)
    d90b:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    d912:	eb 07                	jmp    d91b <hyperinterval::float::F64Enclosure::expanded+0x9b>
    d914:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    d91b:	48 89 d8             	mov    %rbx,%rax
    d91e:	48 83 c4 10          	add    $0x10,%rsp
    d922:	5b                   	pop    %rbx
    d923:	41 5c                	pop    %r12
    d925:	41 5d                	pop    %r13
    d927:	41 5e                	pop    %r14
    d929:	41 5f                	pop    %r15
    d92b:	c3                   	ret
    d92c:	4c 89 e9             	mov    %r13,%rcx
    d92f:	4c 31 f1             	xor    %r14,%rcx
    d932:	4d 85 ed             	test   %r13,%r13
    d935:	49 0f 44 cd          	cmove  %r13,%rcx
    d939:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    d93e:	48 89 e7             	mov    %rsp,%rdi
    d941:	4c 89 f6             	mov    %r14,%rsi
    d944:	4c 89 fa             	mov    %r15,%rdx
    d947:	e8 d4 02 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    d94c:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d950:	74 1c                	je     d96e <hyperinterval::float::F64Enclosure::expanded+0xee>
    d952:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    d957:	48 89 e7             	mov    %rsp,%rdi
    d95a:	4c 89 f6             	mov    %r14,%rsi
    d95d:	4c 89 fa             	mov    %r15,%rdx
    d960:	4c 89 e1             	mov    %r12,%rcx
    d963:	e8 b8 02 00 00       	call   dc20 <hyperinterval::ieee::Format::finite>
    d968:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d96c:	75 11                	jne    d97f <hyperinterval::float::F64Enclosure::expanded+0xff>
    d96e:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    d973:	88 43 08             	mov    %al,0x8(%rbx)
    d976:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    d97d:	eb 9c                	jmp    d91b <hyperinterval::float::F64Enclosure::expanded+0x9b>
    d97f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    d984:	4c 89 e9             	mov    %r13,%rcx
    d987:	4c 09 f1             	or     %r14,%rcx
    d98a:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
    d98e:	4c 89 ee             	mov    %r13,%rsi
    d991:	48 21 d6             	and    %rdx,%rsi
    d994:	4c 89 f7             	mov    %r14,%rdi
    d997:	48 29 f7             	sub    %rsi,%rdi
    d99a:	4d 85 ed             	test   %r13,%r13
    d99d:	48 0f 49 f9          	cmovns %rcx,%rdi
    d9a1:	48 89 c1             	mov    %rax,%rcx
    d9a4:	4c 09 f1             	or     %r14,%rcx
    d9a7:	48 21 c2             	and    %rax,%rdx
    d9aa:	49 29 d6             	sub    %rdx,%r14
    d9ad:	48 85 c0             	test   %rax,%rax
    d9b0:	4c 0f 49 f1          	cmovns %rcx,%r14
    d9b4:	4c 39 f7             	cmp    %r14,%rdi
    d9b7:	76 10                	jbe    d9c9 <hyperinterval::float::F64Enclosure::expanded+0x149>
    d9b9:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
    d9bd:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    d9c4:	e9 52 ff ff ff       	jmp    d91b <hyperinterval::float::F64Enclosure::expanded+0x9b>
    d9c9:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
    d9d0:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
    d9d4:	48 89 43 10          	mov    %rax,0x10(%rbx)
    d9d8:	e9 3e ff ff ff       	jmp    d91b <hyperinterval::float::F64Enclosure::expanded+0x9b>
    d9dd:	0f 1f 00             	nopl   (%rax)

hyperinterval::ieee::Format::finite:
    dc20:	48 89 f8             	mov    %rdi,%rax
    dc23:	48 89 cf             	mov    %rcx,%rdi
    dc26:	48 f7 d7             	not    %rdi
    dc29:	48 85 fa             	test   %rdi,%rdx
    dc2c:	75 09                	jne    dc37 <hyperinterval::ieee::Format::finite+0x17>
    dc2e:	c6 40 01 00          	movb   $0x0,0x1(%rax)
    dc32:	b1 01                	mov    $0x1,%cl
    dc34:	88 08                	mov    %cl,(%rax)
    dc36:	c3                   	ret
    dc37:	48 ff ce             	dec    %rsi
    dc3a:	48 85 f1             	test   %rsi,%rcx
    dc3d:	74 09                	je     dc48 <hyperinterval::ieee::Format::finite+0x28>
    dc3f:	48 89 48 08          	mov    %rcx,0x8(%rax)
    dc43:	31 c9                	xor    %ecx,%ecx
    dc45:	88 08                	mov    %cl,(%rax)
    dc47:	c3                   	ret
    dc48:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
    dc4f:	00 
    dc50:	31 c9                	xor    %ecx,%ecx
    dc52:	88 08                	mov    %cl,(%rax)
    dc54:	c3                   	ret
    dc55:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    dc5c:	00 00 00 
    dc5f:	90                   	nop

hyperinterval::ieee::Format::rounded:
    dc60:	48 89 c8             	mov    %rcx,%rax
    dc63:	4c 8b 11             	mov    (%rcx),%r10
    dc66:	4c 8b 59 08          	mov    0x8(%rcx),%r11
    dc6a:	4c 89 d1             	mov    %r10,%rcx
    dc6d:	4c 09 d9             	or     %r11,%rcx
    dc70:	74 79                	je     dceb <hyperinterval::ieee::Format::rounded+0x8b>
    dc72:	55                   	push   %rbp
    dc73:	41 57                	push   %r15
    dc75:	41 56                	push   %r14
    dc77:	41 55                	push   %r13
    dc79:	41 54                	push   %r12
    dc7b:	53                   	push   %rbx
    dc7c:	8b 68 10             	mov    0x10(%rax),%ebp
    dc7f:	49 0f bd cb          	bsr    %r11,%rcx
    dc83:	83 f1 3f             	xor    $0x3f,%ecx
    dc86:	4d 0f bd f2          	bsr    %r10,%r14
    dc8a:	41 83 f6 3f          	xor    $0x3f,%r14d
    dc8e:	41 83 ce 40          	or     $0x40,%r14d
    dc92:	4d 85 db             	test   %r11,%r11
    dc95:	44 0f 45 f1          	cmovne %ecx,%r14d
    dc99:	bb 40 00 00 00       	mov    $0x40,%ebx
    dc9e:	f3 48 0f bc da       	tzcnt  %rdx,%rbx
    dca3:	41 89 d8             	mov    %ebx,%r8d
    dca6:	41 83 e0 3f          	and    $0x3f,%r8d
    dcaa:	44 89 c1             	mov    %r8d,%ecx
    dcad:	48 d3 ea             	shr    %cl,%rdx
    dcb0:	41 83 f6 7f          	xor    $0x7f,%r14d
    dcb4:	41 01 ee             	add    %ebp,%r14d
    dcb7:	48 d1 ea             	shr    $1,%rdx
    dcba:	41 39 d6             	cmp    %edx,%r14d
    dcbd:	0f 8f 54 01 00 00    	jg     de17 <hyperinterval::ieee::Format::rounded+0x1b7>
    dcc3:	44 8d 2c 13          	lea    (%rbx,%rdx,1),%r13d
    dcc7:	b9 01 00 00 00       	mov    $0x1,%ecx
    dccc:	44 29 e9             	sub    %r13d,%ecx
    dccf:	41 29 de             	sub    %ebx,%r14d
    dcd2:	41 39 ce             	cmp    %ecx,%r14d
    dcd5:	44 0f 4e f1          	cmovle %ecx,%r14d
    dcd9:	44 89 f1             	mov    %r14d,%ecx
    dcdc:	29 e9                	sub    %ebp,%ecx
    dcde:	83 f9 7f             	cmp    $0x7f,%ecx
    dce1:	7e 13                	jle    dcf6 <hyperinterval::ieee::Format::rounded+0x96>
    dce3:	41 b4 01             	mov    $0x1,%r12b
    dce6:	e9 ea 00 00 00       	jmp    ddd5 <hyperinterval::ieee::Format::rounded+0x175>
    dceb:	c6 07 00             	movb   $0x0,(%rdi)
    dcee:	0f 57 c0             	xorps  %xmm0,%xmm0
    dcf1:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
    dcf5:	c3                   	ret
    dcf6:	85 c9                	test   %ecx,%ecx
    dcf8:	4c 89 6c 24 f0       	mov    %r13,-0x10(%rsp)
    dcfd:	0f 8e ad 00 00 00    	jle    ddb0 <hyperinterval::ieee::Format::rounded+0x150>
    dd03:	4d 89 d7             	mov    %r10,%r15
    dd06:	4d 0f ad df          	shrd   %cl,%r11,%r15
    dd0a:	4d 89 dd             	mov    %r11,%r13
    dd0d:	49 d3 ed             	shr    %cl,%r13
    dd10:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
    dd17:	49 d3 e4             	shl    %cl,%r12
    dd1a:	48 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%rbp
    dd21:	45 31 c9             	xor    %r9d,%r9d
    dd24:	f6 c1 40             	test   $0x40,%cl
    dd27:	4d 0f 45 fd          	cmovne %r13,%r15
    dd2b:	4d 0f 45 e9          	cmovne %r9,%r13
    dd2f:	49 0f 45 ec          	cmovne %r12,%rbp
    dd33:	4d 0f 45 e1          	cmovne %r9,%r12
    dd37:	49 f7 d4             	not    %r12
    dd3a:	48 f7 d5             	not    %rbp
    dd3d:	4c 21 dd             	and    %r11,%rbp
    dd40:	4d 21 d4             	and    %r10,%r12
    dd43:	49 09 ec             	or     %rbp,%r12
    dd46:	41 0f 95 c4          	setne  %r12b
    dd4a:	4d 89 eb             	mov    %r13,%r11
    dd4d:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
    dd52:	4c 89 f9             	mov    %r15,%rcx
    dd55:	4c 09 d9             	or     %r11,%rcx
    dd58:	74 7b                	je     ddd5 <hyperinterval::ieee::Format::rounded+0x175>
    dd5a:	49 0f bd cb          	bsr    %r11,%rcx
    dd5e:	83 f1 3f             	xor    $0x3f,%ecx
    dd61:	4d 0f bd ef          	bsr    %r15,%r13
    dd65:	41 83 f5 3f          	xor    $0x3f,%r13d
    dd69:	41 83 cd 40          	or     $0x40,%r13d
    dd6d:	4d 85 db             	test   %r11,%r11
    dd70:	44 0f 45 e9          	cmovne %ecx,%r13d
    dd74:	41 83 f5 7f          	xor    $0x7f,%r13d
    dd78:	43 8d 2c 2e          	lea    (%r14,%r13,1),%ebp
    dd7c:	39 d5                	cmp    %edx,%ebp
    dd7e:	0f 8f 93 00 00 00    	jg     de17 <hyperinterval::ieee::Format::rounded+0x1b7>
    dd84:	b9 01 00 00 00       	mov    $0x1,%ecx
    dd89:	29 d1                	sub    %edx,%ecx
    dd8b:	39 cd                	cmp    %ecx,%ebp
    dd8d:	0f 8d 53 01 00 00    	jge    dee6 <hyperinterval::ieee::Format::rounded+0x286>
    dd93:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
    dd98:	43 8d 0c 2e          	lea    (%r14,%r13,1),%ecx
    dd9c:	fe c9                	dec    %cl
    dd9e:	4d 89 f9             	mov    %r15,%r9
    dda1:	49 d3 e1             	shl    %cl,%r9
    dda4:	45 31 d2             	xor    %r10d,%r10d
    dda7:	f6 c1 40             	test   $0x40,%cl
    ddaa:	4d 0f 44 d1          	cmove  %r9,%r10
    ddae:	eb 2e                	jmp    ddde <hyperinterval::ieee::Format::rounded+0x17e>
    ddb0:	f6 d9                	neg    %cl
    ddb2:	4d 0f a5 d3          	shld   %cl,%r10,%r11
    ddb6:	49 d3 e2             	shl    %cl,%r10
    ddb9:	45 31 e4             	xor    %r12d,%r12d
    ddbc:	f6 c1 40             	test   $0x40,%cl
    ddbf:	4d 0f 45 da          	cmovne %r10,%r11
    ddc3:	41 bf 00 00 00 00    	mov    $0x0,%r15d
    ddc9:	4d 0f 44 fa          	cmove  %r10,%r15
    ddcd:	4c 89 f9             	mov    %r15,%rcx
    ddd0:	4c 09 d9             	or     %r11,%rcx
    ddd3:	75 85                	jne    dd5a <hyperinterval::ieee::Format::rounded+0xfa>
    ddd5:	45 31 ff             	xor    %r15d,%r15d
    ddd8:	45 31 db             	xor    %r11d,%r11d
    dddb:	45 31 d2             	xor    %r10d,%r10d
    ddde:	45 0f b6 e4          	movzbl %r12b,%r12d
    dde2:	4d 01 fc             	add    %r15,%r12
    dde5:	49 83 d3 00          	adc    $0x0,%r11
    dde9:	4c 89 e1             	mov    %r12,%rcx
    ddec:	4c 09 d9             	or     %r11,%rcx
    ddef:	74 30                	je     de21 <hyperinterval::ieee::Format::rounded+0x1c1>
    ddf1:	49 0f bd cb          	bsr    %r11,%rcx
    ddf5:	83 f1 3f             	xor    $0x3f,%ecx
    ddf8:	4d 0f bd fc          	bsr    %r12,%r15
    ddfc:	41 83 f7 3f          	xor    $0x3f,%r15d
    de00:	41 83 cf 40          	or     $0x40,%r15d
    de04:	4d 85 db             	test   %r11,%r11
    de07:	44 0f 45 f9          	cmovne %ecx,%r15d
    de0b:	41 83 f7 7f          	xor    $0x7f,%r15d
    de0f:	43 8d 2c 37          	lea    (%r15,%r14,1),%ebp
    de13:	39 d5                	cmp    %edx,%ebp
    de15:	7e 1b                	jle    de32 <hyperinterval::ieee::Format::rounded+0x1d2>
    de17:	66 c7 07 01 03       	movw   $0x301,(%rdi)
    de1c:	e9 ba 00 00 00       	jmp    dedb <hyperinterval::ieee::Format::rounded+0x27b>
    de21:	31 d2                	xor    %edx,%edx
    de23:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
    de27:	0f 84 86 00 00 00    	je     deb3 <hyperinterval::ieee::Format::rounded+0x253>
    de2d:	e9 9e 00 00 00       	jmp    ded0 <hyperinterval::ieee::Format::rounded+0x270>
    de32:	b9 01 00 00 00       	mov    $0x1,%ecx
    de37:	29 d1                	sub    %edx,%ecx
    de39:	39 cd                	cmp    %ecx,%ebp
    de3b:	7d 1e                	jge    de5b <hyperinterval::ieee::Format::rounded+0x1fb>
    de3d:	45 01 f5             	add    %r14d,%r13d
    de40:	41 fe cd             	dec    %r13b
    de43:	44 89 e9             	mov    %r13d,%ecx
    de46:	49 d3 e4             	shl    %cl,%r12
    de49:	31 d2                	xor    %edx,%edx
    de4b:	41 f6 c5 40          	test   $0x40,%r13b
    de4f:	49 0f 44 d4          	cmove  %r12,%rdx
    de53:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
    de57:	74 5a                	je     deb3 <hyperinterval::ieee::Format::rounded+0x253>
    de59:	eb 75                	jmp    ded0 <hyperinterval::ieee::Format::rounded+0x270>
    de5b:	89 d9                	mov    %ebx,%ecx
    de5d:	44 29 f9             	sub    %r15d,%ecx
    de60:	41 89 c9             	mov    %ecx,%r9d
    de63:	41 f7 d9             	neg    %r9d
    de66:	4d 89 e6             	mov    %r12,%r14
    de69:	49 d3 e6             	shl    %cl,%r14
    de6c:	45 31 ed             	xor    %r13d,%r13d
    de6f:	f6 c1 40             	test   $0x40,%cl
    de72:	4d 0f 44 ee          	cmove  %r14,%r13
    de76:	44 89 c9             	mov    %r9d,%ecx
    de79:	4d 0f ad dc          	shrd   %cl,%r11,%r12
    de7d:	49 d3 eb             	shr    %cl,%r11
    de80:	41 f6 c1 40          	test   $0x40,%r9b
    de84:	4d 0f 44 dc          	cmove  %r12,%r11
    de88:	44 39 fb             	cmp    %r15d,%ebx
    de8b:	4d 0f 43 dd          	cmovae %r13,%r11
    de8f:	01 d5                	add    %edx,%ebp
    de91:	4c 63 cd             	movslq %ebp,%r9
    de94:	44 89 c1             	mov    %r8d,%ecx
    de97:	49 d3 e1             	shl    %cl,%r9
    de9a:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    dea1:	48 d3 e2             	shl    %cl,%rdx
    dea4:	48 f7 d2             	not    %rdx
    dea7:	4c 21 da             	and    %r11,%rdx
    deaa:	4c 09 ca             	or     %r9,%rdx
    dead:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
    deb1:	75 1d                	jne    ded0 <hyperinterval::ieee::Format::rounded+0x270>
    deb3:	48 89 d0             	mov    %rdx,%rax
    deb6:	48 31 f0             	xor    %rsi,%rax
    deb9:	48 85 d2             	test   %rdx,%rdx
    debc:	48 0f 44 c2          	cmove  %rdx,%rax
    dec0:	4c 31 d6             	xor    %r10,%rsi
    dec3:	4d 85 d2             	test   %r10,%r10
    dec6:	49 0f 44 f2          	cmove  %r10,%rsi
    deca:	49 89 c2             	mov    %rax,%r10
    decd:	48 89 f2             	mov    %rsi,%rdx
    ded0:	4c 89 57 08          	mov    %r10,0x8(%rdi)
    ded4:	48 89 57 10          	mov    %rdx,0x10(%rdi)
    ded8:	c6 07 00             	movb   $0x0,(%rdi)
    dedb:	5b                   	pop    %rbx
    dedc:	41 5c                	pop    %r12
    dede:	41 5d                	pop    %r13
    dee0:	41 5e                	pop    %r14
    dee2:	41 5f                	pop    %r15
    dee4:	5d                   	pop    %rbp
    dee5:	c3                   	ret
    dee6:	89 d9                	mov    %ebx,%ecx
    dee8:	44 29 e9             	sub    %r13d,%ecx
    deeb:	4d 89 f9             	mov    %r15,%r9
    deee:	49 d3 e1             	shl    %cl,%r9
    def1:	41 89 ca             	mov    %ecx,%r10d
    def4:	41 f7 da             	neg    %r10d
    def7:	48 c7 44 24 e8 00 00 	movq   $0x0,-0x18(%rsp)
    defe:	00 00 
    df00:	f6 c1 40             	test   $0x40,%cl
    df03:	48 8b 4c 24 e8       	mov    -0x18(%rsp),%rcx
    df08:	49 0f 44 c9          	cmove  %r9,%rcx
    df0c:	48 89 4c 24 e8       	mov    %rcx,-0x18(%rsp)
    df11:	4d 89 f9             	mov    %r15,%r9
    df14:	44 89 d1             	mov    %r10d,%ecx
    df17:	4d 0f ad d9          	shrd   %cl,%r11,%r9
    df1b:	4c 89 4c 24 f8       	mov    %r9,-0x8(%rsp)
    df20:	4d 89 d9             	mov    %r11,%r9
    df23:	49 d3 e9             	shr    %cl,%r9
    df26:	41 f6 c2 40          	test   $0x40,%r10b
    df2a:	4c 0f 44 4c 24 f8    	cmove  -0x8(%rsp),%r9
    df30:	44 39 eb             	cmp    %r13d,%ebx
    df33:	4c 0f 43 4c 24 e8    	cmovae -0x18(%rsp),%r9
    df39:	01 d5                	add    %edx,%ebp
    df3b:	4c 63 ed             	movslq %ebp,%r13
    df3e:	44 89 c1             	mov    %r8d,%ecx
    df41:	49 d3 e5             	shl    %cl,%r13
    df44:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
    df4b:	49 d3 e2             	shl    %cl,%r10
    df4e:	49 f7 d2             	not    %r10
    df51:	4d 21 ca             	and    %r9,%r10
    df54:	4d 09 ea             	or     %r13,%r10
    df57:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
    df5c:	e9 7d fe ff ff       	jmp    ddde <hyperinterval::ieee::Format::rounded+0x17e>
    df61:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    df68:	00 00 00 
    df6b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

hyperinterval::ieee::Format::add:
    df70:	55                   	push   %rbp
    df71:	41 57                	push   %r15
    df73:	41 56                	push   %r14
    df75:	41 55                	push   %r13
    df77:	41 54                	push   %r12
    df79:	53                   	push   %rbx
    df7a:	48 83 ec 38          	sub    $0x38,%rsp
    df7e:	48 89 fb             	mov    %rdi,%rbx
    df81:	48 85 c9             	test   %rcx,%rcx
    df84:	0f 84 6a 01 00 00    	je     e0f4 <hyperinterval::ieee::Format::add+0x184>
    df8a:	48 89 c8             	mov    %rcx,%rax
    df8d:	4d 85 c0             	test   %r8,%r8
    df90:	0f 84 68 01 00 00    	je     e0fe <hyperinterval::ieee::Format::add+0x18e>
    df96:	41 b9 40 00 00 00    	mov    $0x40,%r9d
    df9c:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
    dfa1:	49 89 c2             	mov    %rax,%r10
    dfa4:	49 21 d2             	and    %rdx,%r10
    dfa7:	44 89 c9             	mov    %r9d,%ecx
    dfaa:	49 d3 ea             	shr    %cl,%r10
    dfad:	41 bb 01 00 00 00    	mov    $0x1,%r11d
    dfb3:	49 d3 e3             	shl    %cl,%r11
    dfb6:	4d 8d 63 ff          	lea    -0x1(%r11),%r12
    dfba:	4d 89 e6             	mov    %r12,%r14
    dfbd:	49 21 c6             	and    %rax,%r14
    dfc0:	4d 85 d2             	test   %r10,%r10
    dfc3:	bf 01 00 00 00       	mov    $0x1,%edi
    dfc8:	44 89 d5             	mov    %r10d,%ebp
    dfcb:	0f 44 ef             	cmove  %edi,%ebp
    dfce:	4d 0f 45 d3          	cmovne %r11,%r10
    dfd2:	49 89 d7             	mov    %rdx,%r15
    dfd5:	49 d3 ef             	shr    %cl,%r15
    dfd8:	4d 09 f2             	or     %r14,%r10
    dfdb:	49 d1 ef             	shr    $1,%r15
    dfde:	45 01 cf             	add    %r9d,%r15d
    dfe1:	48 85 f0             	test   %rsi,%rax
    dfe4:	0f 95 44 24 0f       	setne  0xf(%rsp)
    dfe9:	b9 7f 00 00 00       	mov    $0x7f,%ecx
    dfee:	49 0f bd ca          	bsr    %r10,%rcx
    dff2:	83 f1 3f             	xor    $0x3f,%ecx
    dff5:	44 01 c9             	add    %r9d,%ecx
    dff8:	83 c1 c1             	add    $0xffffffc1,%ecx
    dffb:	45 31 ed             	xor    %r13d,%r13d
    dffe:	4d 0f a5 d5          	shld   %cl,%r10,%r13
    e002:	45 31 f6             	xor    %r14d,%r14d
    e005:	49 d3 e2             	shl    %cl,%r10
    e008:	f6 c1 40             	test   $0x40,%cl
    e00b:	4d 0f 45 ea          	cmovne %r10,%r13
    e00f:	4d 0f 45 d6          	cmovne %r14,%r10
    e013:	44 01 f9             	add    %r15d,%ecx
    e016:	29 cd                	sub    %ecx,%ebp
    e018:	4d 89 c6             	mov    %r8,%r14
    e01b:	49 21 d6             	and    %rdx,%r14
    e01e:	44 89 c9             	mov    %r9d,%ecx
    e021:	49 d3 ee             	shr    %cl,%r14
    e024:	4d 21 c4             	and    %r8,%r12
    e027:	4d 85 f6             	test   %r14,%r14
    e02a:	41 0f 45 fe          	cmovne %r14d,%edi
    e02e:	4d 0f 45 f3          	cmovne %r11,%r14
    e032:	b9 7f 00 00 00       	mov    $0x7f,%ecx
    e037:	4d 09 e6             	or     %r12,%r14
    e03a:	49 85 f0             	test   %rsi,%r8
    e03d:	41 0f 95 c3          	setne  %r11b
    e041:	49 0f bd ce          	bsr    %r14,%rcx
    e045:	83 f1 3f             	xor    $0x3f,%ecx
    e048:	44 01 c9             	add    %r9d,%ecx
    e04b:	83 c1 c1             	add    $0xffffffc1,%ecx
    e04e:	45 31 c9             	xor    %r9d,%r9d
    e051:	4d 0f a5 f1          	shld   %cl,%r14,%r9
    e055:	49 d3 e6             	shl    %cl,%r14
    e058:	f6 c1 40             	test   $0x40,%cl
    e05b:	4d 0f 45 ce          	cmovne %r14,%r9
    e05f:	41 bc 00 00 00 00    	mov    $0x0,%r12d
    e065:	4d 0f 45 f4          	cmovne %r12,%r14
    e069:	41 01 cf             	add    %ecx,%r15d
    e06c:	44 29 ff             	sub    %r15d,%edi
    e06f:	39 fd                	cmp    %edi,%ebp
    e071:	0f 8d 97 00 00 00    	jge    e10e <hyperinterval::ieee::Format::add+0x19e>
    e077:	44 88 5c 24 0e       	mov    %r11b,0xe(%rsp)
    e07c:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
    e081:	88 4c 24 0d          	mov    %cl,0xd(%rsp)
    e085:	41 89 ef             	mov    %ebp,%r15d
    e088:	4d 89 d3             	mov    %r10,%r11
    e08b:	4d 89 ec             	mov    %r13,%r12
    e08e:	4d 89 c5             	mov    %r8,%r13
    e091:	44 29 ff             	sub    %r15d,%edi
    e094:	83 ff 4a             	cmp    $0x4a,%edi
    e097:	0f 8f 9f 00 00 00    	jg     e13c <hyperinterval::ieee::Format::add+0x1cc>
    e09d:	49 85 f0             	test   %rsi,%r8
    e0a0:	41 0f 95 c0          	setne  %r8b
    e0a4:	48 85 f0             	test   %rsi,%rax
    e0a7:	41 0f 95 c2          	setne  %r10b
    e0ab:	89 f9                	mov    %edi,%ecx
    e0ad:	4d 0f a5 f1          	shld   %cl,%r14,%r9
    e0b1:	49 d3 e6             	shl    %cl,%r14
    e0b4:	31 c0                	xor    %eax,%eax
    e0b6:	40 f6 c7 40          	test   $0x40,%dil
    e0ba:	4d 0f 45 ce          	cmovne %r14,%r9
    e0be:	49 0f 44 c6          	cmove  %r14,%rax
    e0c2:	45 30 c2             	xor    %r8b,%r10b
    e0c5:	0f 84 c3 00 00 00    	je     e18e <hyperinterval::ieee::Format::add+0x21e>
    e0cb:	4c 39 d8             	cmp    %r11,%rax
    e0ce:	4c 89 c9             	mov    %r9,%rcx
    e0d1:	4c 19 e1             	sbb    %r12,%rcx
    e0d4:	0f 83 e9 00 00 00    	jae    e1c3 <hyperinterval::ieee::Format::add+0x253>
    e0da:	49 29 c3             	sub    %rax,%r11
    e0dd:	4d 19 cc             	sbb    %r9,%r12
    e0e0:	0f b6 44 24 0d       	movzbl 0xd(%rsp),%eax
    e0e5:	88 44 24 0e          	mov    %al,0xe(%rsp)
    e0e9:	4c 89 d8             	mov    %r11,%rax
    e0ec:	4d 89 e1             	mov    %r12,%r9
    e0ef:	e9 d5 00 00 00       	jmp    e1c9 <hyperinterval::ieee::Format::add+0x259>
    e0f4:	4c 89 43 08          	mov    %r8,0x8(%rbx)
    e0f8:	4c 89 43 10          	mov    %r8,0x10(%rbx)
    e0fc:	eb 08                	jmp    e106 <hyperinterval::ieee::Format::add+0x196>
    e0fe:	48 89 43 08          	mov    %rax,0x8(%rbx)
    e102:	48 89 43 10          	mov    %rax,0x10(%rbx)
    e106:	c6 03 00             	movb   $0x0,(%rbx)
    e109:	e9 e0 00 00 00       	jmp    e1ee <hyperinterval::ieee::Format::add+0x27e>
    e10e:	44 88 5c 24 0d       	mov    %r11b,0xd(%rsp)
    e113:	41 89 ff             	mov    %edi,%r15d
    e116:	4d 89 f3             	mov    %r14,%r11
    e119:	4d 89 cc             	mov    %r9,%r12
    e11c:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
    e121:	88 4c 24 0e          	mov    %cl,0xe(%rsp)
    e125:	89 ef                	mov    %ebp,%edi
    e127:	4d 89 d6             	mov    %r10,%r14
    e12a:	4d 89 e9             	mov    %r13,%r9
    e12d:	49 89 c5             	mov    %rax,%r13
    e130:	44 29 ff             	sub    %r15d,%edi
    e133:	83 ff 4a             	cmp    $0x4a,%edi
    e136:	0f 8e 61 ff ff ff    	jle    e09d <hyperinterval::ieee::Format::add+0x12d>
    e13c:	80 7c 24 0d 00       	cmpb   $0x0,0xd(%rsp)
    e141:	74 53                	je     e196 <hyperinterval::ieee::Format::add+0x226>
    e143:	4c 89 e8             	mov    %r13,%rax
    e146:	48 31 f0             	xor    %rsi,%rax
    e149:	48 89 c7             	mov    %rax,%rdi
    e14c:	48 21 f7             	and    %rsi,%rdi
    e14f:	31 c9                	xor    %ecx,%ecx
    e151:	48 f7 df             	neg    %rdi
    e154:	48 19 c9             	sbb    %rcx,%rcx
    e157:	48 83 c9 01          	or     $0x1,%rcx
    e15b:	48 01 c1             	add    %rax,%rcx
    e15e:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    e163:	49 89 f6             	mov    %rsi,%r14
    e166:	e8 b5 fa ff ff       	call   dc20 <hyperinterval::ieee::Format::finite>
    e16b:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
    e170:	75 4a                	jne    e1bc <hyperinterval::ieee::Format::add+0x24c>
    e172:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    e177:	49 31 c6             	xor    %rax,%r14
    e17a:	48 85 c0             	test   %rax,%rax
    e17d:	4c 0f 44 f0          	cmove  %rax,%r14
    e181:	4c 89 73 08          	mov    %r14,0x8(%rbx)
    e185:	4c 89 6b 10          	mov    %r13,0x10(%rbx)
    e189:	e9 78 ff ff ff       	jmp    e106 <hyperinterval::ieee::Format::add+0x196>
    e18e:	4c 01 d8             	add    %r11,%rax
    e191:	4d 11 e1             	adc    %r12,%r9
    e194:	eb 33                	jmp    e1c9 <hyperinterval::ieee::Format::add+0x259>
    e196:	4c 89 e8             	mov    %r13,%rax
    e199:	48 21 f0             	and    %rsi,%rax
    e19c:	31 c9                	xor    %ecx,%ecx
    e19e:	48 f7 d8             	neg    %rax
    e1a1:	48 19 c9             	sbb    %rcx,%rcx
    e1a4:	48 83 c9 01          	or     $0x1,%rcx
    e1a8:	4c 01 e9             	add    %r13,%rcx
    e1ab:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    e1b0:	e8 6b fa ff ff       	call   dc20 <hyperinterval::ieee::Format::finite>
    e1b5:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
    e1ba:	74 44                	je     e200 <hyperinterval::ieee::Format::add+0x290>
    e1bc:	66 c7 03 01 03       	movw   $0x301,(%rbx)
    e1c1:	eb 2b                	jmp    e1ee <hyperinterval::ieee::Format::add+0x27e>
    e1c3:	4c 29 d8             	sub    %r11,%rax
    e1c6:	4d 19 e1             	sbb    %r12,%r9
    e1c9:	0f b6 4c 24 0e       	movzbl 0xe(%rsp),%ecx
    e1ce:	88 4c 24 24          	mov    %cl,0x24(%rsp)
    e1d2:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
    e1d7:	4c 89 4c 24 18       	mov    %r9,0x18(%rsp)
    e1dc:	44 89 7c 24 20       	mov    %r15d,0x20(%rsp)
    e1e1:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
    e1e6:	48 89 df             	mov    %rbx,%rdi
    e1e9:	e8 72 fa ff ff       	call   dc60 <hyperinterval::ieee::Format::rounded>
    e1ee:	48 89 d8             	mov    %rbx,%rax
    e1f1:	48 83 c4 38          	add    $0x38,%rsp
    e1f5:	5b                   	pop    %rbx
    e1f6:	41 5c                	pop    %r12
    e1f8:	41 5d                	pop    %r13
    e1fa:	41 5e                	pop    %r14
    e1fc:	41 5f                	pop    %r15
    e1fe:	5d                   	pop    %rbp
    e1ff:	c3                   	ret
    e200:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    e205:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
    e209:	e9 f4 fe ff ff       	jmp    e102 <hyperinterval::ieee::Format::add+0x192>
    e20e:	66 90                	xchg   %ax,%ax

hyperinterval::ieee::Format::div:
    e210:	55                   	push   %rbp
    e211:	41 57                	push   %r15
    e213:	41 56                	push   %r14
    e215:	41 55                	push   %r13
    e217:	41 54                	push   %r12
    e219:	53                   	push   %rbx
    e21a:	48 83 ec 48          	sub    $0x48,%rsp
    e21e:	4d 85 c0             	test   %r8,%r8
    e221:	0f 84 cb 00 00 00    	je     e2f2 <hyperinterval::ieee::Format::div+0xe2>
    e227:	48 85 c9             	test   %rcx,%rcx
    e22a:	0f 84 cc 00 00 00    	je     e2fc <hyperinterval::ieee::Format::div+0xec>
    e230:	41 be 40 00 00 00    	mov    $0x40,%r14d
    e236:	f3 4c 0f bc f2       	tzcnt  %rdx,%r14
    e23b:	49 89 cd             	mov    %rcx,%r13
    e23e:	49 21 d5             	and    %rdx,%r13
    e241:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
    e246:	41 83 e6 3f          	and    $0x3f,%r14d
    e24a:	48 89 c8             	mov    %rcx,%rax
    e24d:	44 89 f1             	mov    %r14d,%ecx
    e250:	49 d3 ed             	shr    %cl,%r13
    e253:	41 ba 01 00 00 00    	mov    $0x1,%r10d
    e259:	49 d3 e2             	shl    %cl,%r10
    e25c:	4d 8d 5a ff          	lea    -0x1(%r10),%r11
    e260:	4c 89 db             	mov    %r11,%rbx
    e263:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    e268:	48 21 c3             	and    %rax,%rbx
    e26b:	4d 85 ed             	test   %r13,%r13
    e26e:	41 b9 01 00 00 00    	mov    $0x1,%r9d
    e274:	44 89 e8             	mov    %r13d,%eax
    e277:	41 0f 44 c1          	cmove  %r9d,%eax
    e27b:	4d 0f 45 ea          	cmovne %r10,%r13
    e27f:	4c 89 c5             	mov    %r8,%rbp
    e282:	48 21 d5             	and    %rdx,%rbp
    e285:	48 d3 ea             	shr    %cl,%rdx
    e288:	48 d3 ed             	shr    %cl,%rbp
    e28b:	49 09 dd             	or     %rbx,%r13
    e28e:	48 d1 ea             	shr    $1,%rdx
    e291:	4d 21 c3             	and    %r8,%r11
    e294:	48 85 ed             	test   %rbp,%rbp
    e297:	44 0f 45 cd          	cmovne %ebp,%r9d
    e29b:	49 0f 45 ea          	cmovne %r10,%rbp
    e29f:	4c 09 dd             	or     %r11,%rbp
    e2a2:	b9 7f 00 00 00       	mov    $0x7f,%ecx
    e2a7:	41 ba 7f 00 00 00    	mov    $0x7f,%r10d
    e2ad:	4c 0f bd d5          	bsr    %rbp,%r10
    e2b1:	41 83 f2 3f          	xor    $0x3f,%r10d
    e2b5:	41 83 c2 40          	add    $0x40,%r10d
    e2b9:	49 0f bd cd          	bsr    %r13,%rcx
    e2bd:	83 f1 3f             	xor    $0x3f,%ecx
    e2c0:	45 89 d7             	mov    %r10d,%r15d
    e2c3:	41 29 cf             	sub    %ecx,%r15d
    e2c6:	41 83 c7 c0          	add    $0xffffffc0,%r15d
    e2ca:	78 3f                	js     e30b <hyperinterval::ieee::Format::div+0xfb>
    e2cc:	45 31 db             	xor    %r11d,%r11d
    e2cf:	44 89 f9             	mov    %r15d,%ecx
    e2d2:	49 0f a5 eb          	shld   %cl,%rbp,%r11
    e2d6:	31 db                	xor    %ebx,%ebx
    e2d8:	49 89 ec             	mov    %rbp,%r12
    e2db:	49 d3 e4             	shl    %cl,%r12
    e2de:	41 f6 c7 40          	test   $0x40,%r15b
    e2e2:	4d 0f 45 dc          	cmovne %r12,%r11
    e2e6:	4c 0f 45 e3          	cmovne %rbx,%r12
    e2ea:	4d 39 e5             	cmp    %r12,%r13
    e2ed:	4c 19 db             	sbb    %r11,%rbx
    e2f0:	eb 3f                	jmp    e331 <hyperinterval::ieee::Format::div+0x121>
    e2f2:	66 c7 07 01 04       	movw   $0x401,(%rdi)
    e2f7:	e9 24 03 00 00       	jmp    e620 <hyperinterval::ieee::Format::div+0x410>
    e2fc:	c6 07 00             	movb   $0x0,(%rdi)
    e2ff:	0f 57 c0             	xorps  %xmm0,%xmm0
    e302:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
    e306:	e9 15 03 00 00       	jmp    e620 <hyperinterval::ieee::Format::div+0x410>
    e30b:	44 89 f9             	mov    %r15d,%ecx
    e30e:	f6 d9                	neg    %cl
    e310:	45 31 db             	xor    %r11d,%r11d
    e313:	4d 0f a5 eb          	shld   %cl,%r13,%r11
    e317:	31 db                	xor    %ebx,%ebx
    e319:	4d 89 ec             	mov    %r13,%r12
    e31c:	49 d3 e4             	shl    %cl,%r12
    e31f:	f6 c1 40             	test   $0x40,%cl
    e322:	4d 0f 45 dc          	cmovne %r12,%r11
    e326:	4c 0f 45 e3          	cmovne %rbx,%r12
    e32a:	49 39 ec             	cmp    %rbp,%r12
    e32d:	49 83 db 00          	sbb    $0x0,%r11
    e331:	0f 92 c1             	setb   %cl
    e334:	44 29 c8             	sub    %r9d,%eax
    e337:	41 01 c7             	add    %eax,%r15d
    e33a:	0f b6 c9             	movzbl %cl,%ecx
    e33d:	41 29 cf             	sub    %ecx,%r15d
    e340:	41 39 d7             	cmp    %edx,%r15d
    e343:	0f 8f 19 02 00 00    	jg     e562 <hyperinterval::ieee::Format::div+0x352>
    e349:	4c 8b 4c 24 10       	mov    0x10(%rsp),%r9
    e34e:	46 8d 1c 0a          	lea    (%rdx,%r9,1),%r11d
    e352:	b9 01 00 00 00       	mov    $0x1,%ecx
    e357:	4c 89 5c 24 18       	mov    %r11,0x18(%rsp)
    e35c:	44 29 d9             	sub    %r11d,%ecx
    e35f:	45 29 cf             	sub    %r9d,%r15d
    e362:	41 39 cf             	cmp    %ecx,%r15d
    e365:	44 0f 4e f9          	cmovle %ecx,%r15d
    e369:	44 29 f8             	sub    %r15d,%eax
    e36c:	78 61                	js     e3cf <hyperinterval::ieee::Format::div+0x1bf>
    e36e:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
    e373:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
    e378:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
    e37d:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
    e382:	48 85 ed             	test   %rbp,%rbp
    e385:	0f 84 a7 02 00 00    	je     e632 <hyperinterval::ieee::Format::div+0x422>
    e38b:	45 31 e4             	xor    %r12d,%r12d
    e38e:	89 c1                	mov    %eax,%ecx
    e390:	4d 0f a5 ec          	shld   %cl,%r13,%r12
    e394:	31 d2                	xor    %edx,%edx
    e396:	49 d3 e5             	shl    %cl,%r13
    e399:	a8 40                	test   $0x40,%al
    e39b:	4d 0f 45 e5          	cmovne %r13,%r12
    e39f:	4c 0f 45 ea          	cmovne %rdx,%r13
    e3a3:	4c 89 ef             	mov    %r13,%rdi
    e3a6:	4c 89 e6             	mov    %r12,%rsi
    e3a9:	48 89 ea             	mov    %rbp,%rdx
    e3ac:	31 c9                	xor    %ecx,%ecx
    e3ae:	ff 15 bc 0b 05 00    	call   *0x50bbc(%rip)        # 5ef70 <_GLOBAL_OFFSET_TABLE_+0x980>
    e3b4:	49 89 c2             	mov    %rax,%r10
    e3b7:	49 89 d1             	mov    %rdx,%r9
    e3ba:	48 89 d1             	mov    %rdx,%rcx
    e3bd:	48 0f af cd          	imul   %rbp,%rcx
    e3c1:	48 f7 e5             	mul    %rbp
    e3c4:	48 01 ca             	add    %rcx,%rdx
    e3c7:	49 29 c5             	sub    %rax,%r13
    e3ca:	49 19 d4             	sbb    %rdx,%r12
    e3cd:	eb 79                	jmp    e448 <hyperinterval::ieee::Format::div+0x238>
    e3cf:	f7 d8                	neg    %eax
    e3d1:	44 39 d0             	cmp    %r10d,%eax
    e3d4:	7e 07                	jle    e3dd <hyperinterval::ieee::Format::div+0x1cd>
    e3d6:	b3 01                	mov    $0x1,%bl
    e3d8:	e9 df 00 00 00       	jmp    e4bc <hyperinterval::ieee::Format::div+0x2ac>
    e3dd:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
    e3e2:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
    e3e7:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
    e3ec:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
    e3f1:	31 db                	xor    %ebx,%ebx
    e3f3:	89 c1                	mov    %eax,%ecx
    e3f5:	48 0f a5 eb          	shld   %cl,%rbp,%rbx
    e3f9:	48 d3 e5             	shl    %cl,%rbp
    e3fc:	31 c9                	xor    %ecx,%ecx
    e3fe:	a8 40                	test   $0x40,%al
    e400:	48 0f 45 dd          	cmovne %rbp,%rbx
    e404:	48 0f 45 e9          	cmovne %rcx,%rbp
    e408:	48 89 e8             	mov    %rbp,%rax
    e40b:	48 09 d8             	or     %rbx,%rax
    e40e:	0f 84 2b 02 00 00    	je     e63f <hyperinterval::ieee::Format::div+0x42f>
    e414:	45 31 e4             	xor    %r12d,%r12d
    e417:	4c 89 ef             	mov    %r13,%rdi
    e41a:	31 f6                	xor    %esi,%esi
    e41c:	48 89 ea             	mov    %rbp,%rdx
    e41f:	48 89 d9             	mov    %rbx,%rcx
    e422:	ff 15 48 0b 05 00    	call   *0x50b48(%rip)        # 5ef70 <_GLOBAL_OFFSET_TABLE_+0x980>
    e428:	49 89 c2             	mov    %rax,%r10
    e42b:	49 89 d1             	mov    %rdx,%r9
    e42e:	48 0f af d8          	imul   %rax,%rbx
    e432:	48 f7 e5             	mul    %rbp
    e435:	48 01 da             	add    %rbx,%rdx
    e438:	4c 89 c9             	mov    %r9,%rcx
    e43b:	48 0f af cd          	imul   %rbp,%rcx
    e43f:	48 01 d1             	add    %rdx,%rcx
    e442:	49 29 c5             	sub    %rax,%r13
    e445:	49 19 cc             	sbb    %rcx,%r12
    e448:	4d 09 e5             	or     %r12,%r13
    e44b:	0f 95 c3             	setne  %bl
    e44e:	4c 89 d0             	mov    %r10,%rax
    e451:	4c 09 c8             	or     %r9,%rax
    e454:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
    e459:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
    e45e:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
    e463:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    e468:	74 52                	je     e4bc <hyperinterval::ieee::Format::div+0x2ac>
    e46a:	49 0f bd c1          	bsr    %r9,%rax
    e46e:	83 f0 3f             	xor    $0x3f,%eax
    e471:	4d 0f bd da          	bsr    %r10,%r11
    e475:	41 83 f3 3f          	xor    $0x3f,%r11d
    e479:	41 83 cb 40          	or     $0x40,%r11d
    e47d:	4d 85 c9             	test   %r9,%r9
    e480:	44 0f 45 d8          	cmovne %eax,%r11d
    e484:	41 83 f3 7f          	xor    $0x7f,%r11d
    e488:	43 8d 2c 3b          	lea    (%r11,%r15,1),%ebp
    e48c:	39 d5                	cmp    %edx,%ebp
    e48e:	0f 8f ce 00 00 00    	jg     e562 <hyperinterval::ieee::Format::div+0x352>
    e494:	b8 01 00 00 00       	mov    $0x1,%eax
    e499:	29 d0                	sub    %edx,%eax
    e49b:	39 c5                	cmp    %eax,%ebp
    e49d:	7d 28                	jge    e4c7 <hyperinterval::ieee::Format::div+0x2b7>
    e49f:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    e4a4:	42 8d 0c 38          	lea    (%rax,%r15,1),%ecx
    e4a8:	fe c9                	dec    %cl
    e4aa:	4c 89 d0             	mov    %r10,%rax
    e4ad:	48 d3 e0             	shl    %cl,%rax
    e4b0:	45 31 db             	xor    %r11d,%r11d
    e4b3:	f6 c1 40             	test   $0x40,%cl
    e4b6:	4c 0f 44 d8          	cmove  %rax,%r11
    e4ba:	eb 6e                	jmp    e52a <hyperinterval::ieee::Format::div+0x31a>
    e4bc:	45 31 d2             	xor    %r10d,%r10d
    e4bf:	45 31 c9             	xor    %r9d,%r9d
    e4c2:	45 31 db             	xor    %r11d,%r11d
    e4c5:	eb 63                	jmp    e52a <hyperinterval::ieee::Format::div+0x31a>
    e4c7:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    e4cc:	89 c1                	mov    %eax,%ecx
    e4ce:	44 29 d9             	sub    %r11d,%ecx
    e4d1:	4d 89 d4             	mov    %r10,%r12
    e4d4:	49 d3 e4             	shl    %cl,%r12
    e4d7:	89 c8                	mov    %ecx,%eax
    e4d9:	f7 d8                	neg    %eax
    e4db:	45 31 ed             	xor    %r13d,%r13d
    e4de:	f6 c1 40             	test   $0x40,%cl
    e4e1:	4d 0f 44 ec          	cmove  %r12,%r13
    e4e5:	4d 89 d4             	mov    %r10,%r12
    e4e8:	89 c1                	mov    %eax,%ecx
    e4ea:	4d 0f ad cc          	shrd   %cl,%r9,%r12
    e4ee:	88 5c 24 0f          	mov    %bl,0xf(%rsp)
    e4f2:	4c 89 cb             	mov    %r9,%rbx
    e4f5:	48 d3 eb             	shr    %cl,%rbx
    e4f8:	a8 40                	test   $0x40,%al
    e4fa:	49 0f 44 dc          	cmove  %r12,%rbx
    e4fe:	44 39 5c 24 10       	cmp    %r11d,0x10(%rsp)
    e503:	49 0f 43 dd          	cmovae %r13,%rbx
    e507:	01 d5                	add    %edx,%ebp
    e509:	48 63 c5             	movslq %ebp,%rax
    e50c:	44 89 f1             	mov    %r14d,%ecx
    e50f:	48 d3 e0             	shl    %cl,%rax
    e512:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
    e519:	49 d3 e3             	shl    %cl,%r11
    e51c:	49 f7 d3             	not    %r11
    e51f:	49 21 db             	and    %rbx,%r11
    e522:	0f b6 5c 24 0f       	movzbl 0xf(%rsp),%ebx
    e527:	49 09 c3             	or     %rax,%r11
    e52a:	0f b6 db             	movzbl %bl,%ebx
    e52d:	4c 01 d3             	add    %r10,%rbx
    e530:	49 83 d1 00          	adc    $0x0,%r9
    e534:	48 89 d8             	mov    %rbx,%rax
    e537:	4c 09 c8             	or     %r9,%rax
    e53a:	74 30                	je     e56c <hyperinterval::ieee::Format::div+0x35c>
    e53c:	49 0f bd c1          	bsr    %r9,%rax
    e540:	83 f0 3f             	xor    $0x3f,%eax
    e543:	4c 0f bd d3          	bsr    %rbx,%r10
    e547:	41 83 f2 3f          	xor    $0x3f,%r10d
    e54b:	41 83 ca 40          	or     $0x40,%r10d
    e54f:	4d 85 c9             	test   %r9,%r9
    e552:	44 0f 45 d0          	cmovne %eax,%r10d
    e556:	41 83 f2 7f          	xor    $0x7f,%r10d
    e55a:	43 8d 2c 3a          	lea    (%r10,%r15,1),%ebp
    e55e:	39 d5                	cmp    %edx,%ebp
    e560:	7e 0e                	jle    e570 <hyperinterval::ieee::Format::div+0x360>
    e562:	66 c7 07 01 03       	movw   $0x301,(%rdi)
    e567:	e9 b4 00 00 00       	jmp    e620 <hyperinterval::ieee::Format::div+0x410>
    e56c:	31 c0                	xor    %eax,%eax
    e56e:	eb 76                	jmp    e5e6 <hyperinterval::ieee::Format::div+0x3d6>
    e570:	b8 01 00 00 00       	mov    $0x1,%eax
    e575:	29 d0                	sub    %edx,%eax
    e577:	39 c5                	cmp    %eax,%ebp
    e579:	7d 18                	jge    e593 <hyperinterval::ieee::Format::div+0x383>
    e57b:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    e580:	44 01 f9             	add    %r15d,%ecx
    e583:	fe c9                	dec    %cl
    e585:	48 d3 e3             	shl    %cl,%rbx
    e588:	31 c0                	xor    %eax,%eax
    e58a:	f6 c1 40             	test   $0x40,%cl
    e58d:	48 0f 44 c3          	cmove  %rbx,%rax
    e591:	eb 53                	jmp    e5e6 <hyperinterval::ieee::Format::div+0x3d6>
    e593:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
    e598:	44 89 e9             	mov    %r13d,%ecx
    e59b:	44 29 d1             	sub    %r10d,%ecx
    e59e:	89 c8                	mov    %ecx,%eax
    e5a0:	f7 d8                	neg    %eax
    e5a2:	49 89 df             	mov    %rbx,%r15
    e5a5:	49 d3 e7             	shl    %cl,%r15
    e5a8:	45 31 e4             	xor    %r12d,%r12d
    e5ab:	f6 c1 40             	test   $0x40,%cl
    e5ae:	4d 0f 44 e7          	cmove  %r15,%r12
    e5b2:	89 c1                	mov    %eax,%ecx
    e5b4:	4c 0f ad cb          	shrd   %cl,%r9,%rbx
    e5b8:	49 d3 e9             	shr    %cl,%r9
    e5bb:	a8 40                	test   $0x40,%al
    e5bd:	4c 0f 44 cb          	cmove  %rbx,%r9
    e5c1:	45 39 d5             	cmp    %r10d,%r13d
    e5c4:	4d 0f 43 cc          	cmovae %r12,%r9
    e5c8:	01 d5                	add    %edx,%ebp
    e5ca:	48 63 d5             	movslq %ebp,%rdx
    e5cd:	44 89 f1             	mov    %r14d,%ecx
    e5d0:	48 d3 e2             	shl    %cl,%rdx
    e5d3:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    e5da:	48 d3 e0             	shl    %cl,%rax
    e5dd:	48 f7 d0             	not    %rax
    e5e0:	4c 21 c8             	and    %r9,%rax
    e5e3:	48 09 d0             	or     %rdx,%rax
    e5e6:	48 85 74 24 40       	test   %rsi,0x40(%rsp)
    e5eb:	0f 95 c1             	setne  %cl
    e5ee:	49 85 f0             	test   %rsi,%r8
    e5f1:	0f 94 c2             	sete   %dl
    e5f4:	30 ca                	xor    %cl,%dl
    e5f6:	75 1d                	jne    e615 <hyperinterval::ieee::Format::div+0x405>
    e5f8:	48 89 c1             	mov    %rax,%rcx
    e5fb:	48 31 f1             	xor    %rsi,%rcx
    e5fe:	48 85 c0             	test   %rax,%rax
    e601:	48 0f 44 c8          	cmove  %rax,%rcx
    e605:	4c 31 de             	xor    %r11,%rsi
    e608:	4d 85 db             	test   %r11,%r11
    e60b:	49 0f 44 f3          	cmove  %r11,%rsi
    e60f:	48 89 f0             	mov    %rsi,%rax
    e612:	49 89 cb             	mov    %rcx,%r11
    e615:	4c 89 5f 08          	mov    %r11,0x8(%rdi)
    e619:	48 89 47 10          	mov    %rax,0x10(%rdi)
    e61d:	c6 07 00             	movb   $0x0,(%rdi)
    e620:	48 89 f8             	mov    %rdi,%rax
    e623:	48 83 c4 48          	add    $0x48,%rsp
    e627:	5b                   	pop    %rbx
    e628:	41 5c                	pop    %r12
    e62a:	41 5d                	pop    %r13
    e62c:	41 5e                	pop    %r14
    e62e:	41 5f                	pop    %r15
    e630:	5d                   	pop    %rbp
    e631:	c3                   	ret
    e632:	48 8d 3d 77 d5 04 00 	lea    0x4d577(%rip),%rdi        # 5bbb0 <__do_global_dtors_aux_fini_array_entry+0x2a0>
    e639:	ff 15 f9 07 05 00    	call   *0x507f9(%rip)        # 5ee38 <_GLOBAL_OFFSET_TABLE_+0x848>
    e63f:	48 8d 3d 52 d5 04 00 	lea    0x4d552(%rip),%rdi        # 5bb98 <__do_global_dtors_aux_fini_array_entry+0x288>
    e646:	ff 15 ec 07 05 00    	call   *0x507ec(%rip)        # 5ee38 <_GLOBAL_OFFSET_TABLE_+0x848>
    e64c:	0f 1f 40 00          	nopl   0x0(%rax)

hyperinterval::ieee::Format::power:
    e650:	55                   	push   %rbp
    e651:	41 57                	push   %r15
    e653:	41 56                	push   %r14
    e655:	41 55                	push   %r13
    e657:	41 54                	push   %r12
    e659:	53                   	push   %rbx
    e65a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
    e661:	48 89 cb             	mov    %rcx,%rbx
    e664:	49 89 d6             	mov    %rdx,%r14
    e667:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
    e66c:	48 85 f1             	test   %rsi,%rcx
    e66f:	0f 95 44 24 0f       	setne  0xf(%rsp)
    e674:	b8 40 00 00 00       	mov    $0x40,%eax
    e679:	f3 48 0f bc c2       	tzcnt  %rdx,%rax
    e67e:	41 89 c2             	mov    %eax,%r10d
    e681:	41 83 e2 3f          	and    $0x3f,%r10d
    e685:	44 89 d1             	mov    %r10d,%ecx
    e688:	48 d3 ea             	shr    %cl,%rdx
    e68b:	48 89 d1             	mov    %rdx,%rcx
    e68e:	48 d1 e9             	shr    $1,%rcx
    e691:	4c 63 d9             	movslq %ecx,%r11
    e694:	44 89 d1             	mov    %r10d,%ecx
    e697:	49 d3 e3             	shl    %cl,%r11
    e69a:	45 85 c0             	test   %r8d,%r8d
    e69d:	44 89 44 24 70       	mov    %r8d,0x70(%rsp)
    e6a2:	4c 89 5c 24 68       	mov    %r11,0x68(%rsp)
    e6a7:	0f 84 55 03 00 00    	je     ea02 <hyperinterval::ieee::Format::power+0x3b2>
    e6ad:	41 b9 01 00 00 00    	mov    $0x1,%r9d
    e6b3:	44 89 d1             	mov    %r10d,%ecx
    e6b6:	49 d3 e1             	shl    %cl,%r9
    e6b9:	48 8d 4e ff          	lea    -0x1(%rsi),%rcx
    e6bd:	48 21 cb             	and    %rcx,%rbx
    e6c0:	4d 8d 79 ff          	lea    -0x1(%r9),%r15
    e6c4:	44 8d 24 42          	lea    (%rdx,%rax,2),%r12d
    e6c8:	41 83 e4 fe          	and    $0xfffffffe,%r12d
    e6cc:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    e6d1:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
    e6d6:	48 89 d9             	mov    %rbx,%rcx
    e6d9:	44 89 c0             	mov    %r8d,%eax
    e6dc:	49 89 d8             	mov    %rbx,%r8
    e6df:	4c 89 5c 24 10       	mov    %r11,0x10(%rsp)
    e6e4:	49 89 cd             	mov    %rcx,%r13
    e6e7:	4c 89 8c 24 88 00 00 	mov    %r9,0x88(%rsp)
    e6ee:	00 
    e6ef:	4c 89 94 24 80 00 00 	mov    %r10,0x80(%rsp)
    e6f6:	00 
    e6f7:	4c 89 7c 24 78       	mov    %r15,0x78(%rsp)
    e6fc:	44 89 64 24 74       	mov    %r12d,0x74(%rsp)
    e701:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    e708:	0f 1f 84 00 00 00 00 
    e70f:	00 
    e710:	a8 01                	test   $0x1,%al
    e712:	4c 89 84 24 90 00 00 	mov    %r8,0x90(%rsp)
    e719:	00 
    e71a:	89 44 24 24          	mov    %eax,0x24(%rsp)
    e71e:	0f 84 87 01 00 00    	je     e8ab <hyperinterval::ieee::Format::power+0x25b>
    e724:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
    e729:	4c 89 c2             	mov    %r8,%rdx
    e72c:	4c 21 f2             	and    %r14,%rdx
    e72f:	44 89 d1             	mov    %r10d,%ecx
    e732:	48 d3 ea             	shr    %cl,%rdx
    e735:	4c 89 c0             	mov    %r8,%rax
    e738:	4c 21 f8             	and    %r15,%rax
    e73b:	48 85 d2             	test   %rdx,%rdx
    e73e:	41 89 d3             	mov    %edx,%r11d
    e741:	b9 01 00 00 00       	mov    $0x1,%ecx
    e746:	44 0f 44 d9          	cmove  %ecx,%r11d
    e74a:	49 0f 45 d1          	cmovne %r9,%rdx
    e74e:	48 09 c2             	or     %rax,%rdx
    e751:	49 85 f0             	test   %rsi,%r8
    e754:	0f 95 44 24 10       	setne  0x10(%rsp)
    e759:	4c 89 e8             	mov    %r13,%rax
    e75c:	4c 21 f0             	and    %r14,%rax
    e75f:	44 89 d1             	mov    %r10d,%ecx
    e762:	48 d3 e8             	shr    %cl,%rax
    e765:	4c 89 e9             	mov    %r13,%rcx
    e768:	4c 21 f9             	and    %r15,%rcx
    e76b:	48 85 c0             	test   %rax,%rax
    e76e:	41 89 c0             	mov    %eax,%r8d
    e771:	bb 01 00 00 00       	mov    $0x1,%ebx
    e776:	44 0f 44 c3          	cmove  %ebx,%r8d
    e77a:	49 0f 45 c1          	cmovne %r9,%rax
    e77e:	48 09 c8             	or     %rcx,%rax
    e781:	49 85 f5             	test   %rsi,%r13
    e784:	0f 95 c1             	setne  %cl
    e787:	32 4c 24 10          	xor    0x10(%rsp),%cl
    e78b:	48 f7 e2             	mul    %rdx
    e78e:	45 29 e3             	sub    %r12d,%r11d
    e791:	45 01 c3             	add    %r8d,%r11d
    e794:	88 4c 24 54          	mov    %cl,0x54(%rsp)
    e798:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
    e79d:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    e7a2:	44 89 5c 24 50       	mov    %r11d,0x50(%rsp)
    e7a7:	4c 89 f2             	mov    %r14,%rdx
    e7aa:	48 89 e9             	mov    %rbp,%rcx
    e7ad:	4d 89 cc             	mov    %r9,%r12
    e7b0:	48 89 f5             	mov    %rsi,%rbp
    e7b3:	4c 89 f3             	mov    %r14,%rbx
    e7b6:	4d 89 d6             	mov    %r10,%r14
    e7b9:	e8 a2 f4 ff ff       	call   dc60 <hyperinterval::ieee::Format::rounded>
    e7be:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
    e7c3:	0f 85 28 02 00 00    	jne    e9f1 <hyperinterval::ieee::Format::power+0x3a1>
    e7c9:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
    e7ce:	48 89 fa             	mov    %rdi,%rdx
    e7d1:	48 21 da             	and    %rbx,%rdx
    e7d4:	44 89 f1             	mov    %r14d,%ecx
    e7d7:	48 d3 ea             	shr    %cl,%rdx
    e7da:	48 89 f8             	mov    %rdi,%rax
    e7dd:	4c 21 f8             	and    %r15,%rax
    e7e0:	48 85 d2             	test   %rdx,%rdx
    e7e3:	89 d6                	mov    %edx,%esi
    e7e5:	41 ba 01 00 00 00    	mov    $0x1,%r10d
    e7eb:	41 0f 44 f2          	cmove  %r10d,%esi
    e7ef:	49 0f 45 d4          	cmovne %r12,%rdx
    e7f3:	48 09 c2             	or     %rax,%rdx
    e7f6:	48 85 ef             	test   %rbp,%rdi
    e7f9:	40 0f 95 c7          	setne  %dil
    e7fd:	4c 8b 8c 24 90 00 00 	mov    0x90(%rsp),%r9
    e804:	00 
    e805:	4c 89 c8             	mov    %r9,%rax
    e808:	48 21 d8             	and    %rbx,%rax
    e80b:	48 d3 e8             	shr    %cl,%rax
    e80e:	4c 89 c9             	mov    %r9,%rcx
    e811:	4c 21 f9             	and    %r15,%rcx
    e814:	48 85 c0             	test   %rax,%rax
    e817:	41 89 c0             	mov    %eax,%r8d
    e81a:	45 0f 44 c2          	cmove  %r10d,%r8d
    e81e:	49 0f 45 c4          	cmovne %r12,%rax
    e822:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
    e827:	48 09 c8             	or     %rcx,%rax
    e82a:	49 85 e9             	test   %rbp,%r9
    e82d:	0f 95 c1             	setne  %cl
    e830:	40 30 f9             	xor    %dil,%cl
    e833:	48 f7 e2             	mul    %rdx
    e836:	44 8b 64 24 74       	mov    0x74(%rsp),%r12d
    e83b:	44 29 e6             	sub    %r12d,%esi
    e83e:	44 01 c6             	add    %r8d,%esi
    e841:	88 4c 24 54          	mov    %cl,0x54(%rsp)
    e845:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
    e84a:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    e84f:	89 74 24 50          	mov    %esi,0x50(%rsp)
    e853:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    e858:	48 89 ee             	mov    %rbp,%rsi
    e85b:	48 89 da             	mov    %rbx,%rdx
    e85e:	48 8d 4c 24 40       	lea    0x40(%rsp),%rcx
    e863:	e8 f8 f3 ff ff       	call   dc60 <hyperinterval::ieee::Format::rounded>
    e868:	80 7c 24 28 01       	cmpb   $0x1,0x28(%rsp)
    e86d:	0f 84 7e 01 00 00    	je     e9f1 <hyperinterval::ieee::Format::power+0x3a1>
    e873:	48 89 ee             	mov    %rbp,%rsi
    e876:	49 89 de             	mov    %rbx,%r14
    e879:	4c 89 7c 24 10       	mov    %r15,0x10(%rsp)
    e87e:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
    e883:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
    e888:	4c 8b 8c 24 88 00 00 	mov    0x88(%rsp),%r9
    e88f:	00 
    e890:	4c 8b 94 24 80 00 00 	mov    0x80(%rsp),%r10
    e897:	00 
    e898:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
    e89d:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    e8a2:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
    e8a7:	8b 44 24 24          	mov    0x24(%rsp),%eax
    e8ab:	83 f8 01             	cmp    $0x1,%eax
    e8ae:	ba 02 00 00 00       	mov    $0x2,%edx
    e8b3:	0f 84 02 01 00 00    	je     e9bb <hyperinterval::ieee::Format::power+0x36b>
    e8b9:	4c 89 e8             	mov    %r13,%rax
    e8bc:	4c 21 f0             	and    %r14,%rax
    e8bf:	44 89 d1             	mov    %r10d,%ecx
    e8c2:	48 d3 e8             	shr    %cl,%rax
    e8c5:	4d 21 fd             	and    %r15,%r13
    e8c8:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
    e8cb:	48 85 c0             	test   %rax,%rax
    e8ce:	49 0f 45 c1          	cmovne %r9,%rax
    e8d2:	0f 44 ca             	cmove  %edx,%ecx
    e8d5:	4c 09 e8             	or     %r13,%rax
    e8d8:	48 f7 e0             	mul    %rax
    e8db:	44 29 e1             	sub    %r12d,%ecx
    e8de:	c6 44 24 54 00       	movb   $0x0,0x54(%rsp)
    e8e3:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
    e8e8:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    e8ed:	89 4c 24 50          	mov    %ecx,0x50(%rsp)
    e8f1:	4c 89 f2             	mov    %r14,%rdx
    e8f4:	48 89 e9             	mov    %rbp,%rcx
    e8f7:	44 89 e5             	mov    %r12d,%ebp
    e8fa:	4d 89 cc             	mov    %r9,%r12
    e8fd:	4d 89 fd             	mov    %r15,%r13
    e900:	49 89 f7             	mov    %rsi,%r15
    e903:	4c 89 f3             	mov    %r14,%rbx
    e906:	4d 89 d6             	mov    %r10,%r14
    e909:	e8 52 f3 ff ff       	call   dc60 <hyperinterval::ieee::Format::rounded>
    e90e:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
    e913:	0f 85 d8 00 00 00    	jne    e9f1 <hyperinterval::ieee::Format::power+0x3a1>
    e919:	48 8b 94 24 90 00 00 	mov    0x90(%rsp),%rdx
    e920:	00 
    e921:	48 89 d0             	mov    %rdx,%rax
    e924:	48 21 d8             	and    %rbx,%rax
    e927:	44 89 f1             	mov    %r14d,%ecx
    e92a:	48 d3 e8             	shr    %cl,%rax
    e92d:	4c 21 ea             	and    %r13,%rdx
    e930:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
    e933:	48 85 c0             	test   %rax,%rax
    e936:	49 0f 45 c4          	cmovne %r12,%rax
    e93a:	be 02 00 00 00       	mov    $0x2,%esi
    e93f:	0f 44 ce             	cmove  %esi,%ecx
    e942:	48 09 d0             	or     %rdx,%rax
    e945:	48 f7 e0             	mul    %rax
    e948:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
    e94d:	29 e9                	sub    %ebp,%ecx
    e94f:	c6 44 24 54 00       	movb   $0x0,0x54(%rsp)
    e954:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
    e959:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    e95e:	89 4c 24 50          	mov    %ecx,0x50(%rsp)
    e962:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    e967:	4c 89 fe             	mov    %r15,%rsi
    e96a:	48 89 da             	mov    %rbx,%rdx
    e96d:	48 8d 4c 24 40       	lea    0x40(%rsp),%rcx
    e972:	e8 e9 f2 ff ff       	call   dc60 <hyperinterval::ieee::Format::rounded>
    e977:	80 7c 24 28 01       	cmpb   $0x1,0x28(%rsp)
    e97c:	74 73                	je     e9f1 <hyperinterval::ieee::Format::power+0x3a1>
    e97e:	4c 89 fe             	mov    %r15,%rsi
    e981:	49 89 de             	mov    %rbx,%r14
    e984:	41 89 ec             	mov    %ebp,%r12d
    e987:	8b 4c 24 24          	mov    0x24(%rsp),%ecx
    e98b:	89 c8                	mov    %ecx,%eax
    e98d:	d1 e8                	shr    $1,%eax
    e98f:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
    e994:	85 c9                	test   %ecx,%ecx
    e996:	4c 8b 8c 24 88 00 00 	mov    0x88(%rsp),%r9
    e99d:	00 
    e99e:	4c 8b 94 24 80 00 00 	mov    0x80(%rsp),%r10
    e9a5:	00 
    e9a6:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
    e9ab:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    e9b0:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
    e9b5:	0f 85 55 fd ff ff    	jne    e710 <hyperinterval::ieee::Format::power+0xc0>
    e9bb:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
    e9c0:	22 44 24 70          	and    0x70(%rsp),%al
    e9c4:	74 4c                	je     ea12 <hyperinterval::ieee::Format::power+0x3c2>
    e9c6:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
    e9cb:	48 89 c8             	mov    %rcx,%rax
    e9ce:	48 31 f0             	xor    %rsi,%rax
    e9d1:	48 85 c9             	test   %rcx,%rcx
    e9d4:	48 0f 44 c1          	cmove  %rcx,%rax
    e9d8:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    e9dd:	48 31 ce             	xor    %rcx,%rsi
    e9e0:	48 85 c9             	test   %rcx,%rcx
    e9e3:	48 0f 44 f1          	cmove  %rcx,%rsi
    e9e7:	48 89 c1             	mov    %rax,%rcx
    e9ea:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    e9ef:	eb 30                	jmp    ea21 <hyperinterval::ieee::Format::power+0x3d1>
    e9f1:	0f b6 4c 24 29       	movzbl 0x29(%rsp),%ecx
    e9f6:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    e9fb:	88 48 01             	mov    %cl,0x1(%rax)
    e9fe:	b1 01                	mov    $0x1,%cl
    ea00:	eb 29                	jmp    ea2b <hyperinterval::ieee::Format::power+0x3db>
    ea02:	4c 89 5c 24 10       	mov    %r11,0x10(%rsp)
    ea07:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
    ea0c:	22 44 24 70          	and    0x70(%rsp),%al
    ea10:	75 b4                	jne    e9c6 <hyperinterval::ieee::Format::power+0x376>
    ea12:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    ea17:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
    ea1c:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    ea21:	48 89 48 08          	mov    %rcx,0x8(%rax)
    ea25:	48 89 70 10          	mov    %rsi,0x10(%rax)
    ea29:	31 c9                	xor    %ecx,%ecx
    ea2b:	88 08                	mov    %cl,(%rax)
    ea2d:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
    ea34:	5b                   	pop    %rbx
    ea35:	41 5c                	pop    %r12
    ea37:	41 5d                	pop    %r13
    ea39:	41 5e                	pop    %r14
    ea3b:	41 5f                	pop    %r15
    ea3d:	5d                   	pop    %rbp
    ea3e:	c3                   	ret
    ea3f:	90                   	nop

__udivti3:
   4beb0:	49 89 d0             	mov    %rdx,%r8
   4beb3:	48 85 c9             	test   %rcx,%rcx
   4beb6:	74 7b                	je     4bf33 <__udivti3+0x83>
   4beb8:	55                   	push   %rbp
   4beb9:	48 89 e5             	mov    %rsp,%rbp
   4bebc:	53                   	push   %rbx
   4bebd:	4c 0f bd c9          	bsr    %rcx,%r9
   4bec1:	44 89 ca             	mov    %r9d,%edx
   4bec4:	83 f2 3f             	xor    $0x3f,%edx
   4bec7:	b0 40                	mov    $0x40,%al
   4bec9:	28 d0                	sub    %dl,%al
   4becb:	4c 89 c2             	mov    %r8,%rdx
   4bece:	49 89 cb             	mov    %rcx,%r11
   4bed1:	89 c1                	mov    %eax,%ecx
   4bed3:	4c 0f ad da          	shrd   %cl,%r11,%rdx
   4bed7:	4d 89 da             	mov    %r11,%r10
   4beda:	49 d3 ea             	shr    %cl,%r10
   4bedd:	a8 40                	test   $0x40,%al
   4bedf:	4c 0f 44 d2          	cmove  %rdx,%r10
   4bee3:	48 89 f0             	mov    %rsi,%rax
   4bee6:	48 0f a4 f8 3f       	shld   $0x3f,%rdi,%rax
   4beeb:	48 89 f2             	mov    %rsi,%rdx
   4beee:	48 d1 ea             	shr    $1,%rdx
   4bef1:	49 f7 f2             	div    %r10
   4bef4:	49 89 c2             	mov    %rax,%r10
   4bef7:	44 89 c9             	mov    %r9d,%ecx
   4befa:	49 d3 ea             	shr    %cl,%r10
   4befd:	31 c9                	xor    %ecx,%ecx
   4beff:	49 83 ea 01          	sub    $0x1,%r10
   4bf03:	4c 0f 42 d1          	cmovb  %rcx,%r10
   4bf07:	4c 89 db             	mov    %r11,%rbx
   4bf0a:	4c 89 c0             	mov    %r8,%rax
   4bf0d:	49 f7 e2             	mul    %r10
   4bf10:	49 89 c1             	mov    %rax,%r9
   4bf13:	4c 89 d0             	mov    %r10,%rax
   4bf16:	49 0f af da          	imul   %r10,%rbx
   4bf1a:	48 01 da             	add    %rbx,%rdx
   4bf1d:	4c 29 cf             	sub    %r9,%rdi
   4bf20:	48 19 d6             	sbb    %rdx,%rsi
   4bf23:	4c 39 c7             	cmp    %r8,%rdi
   4bf26:	4c 19 de             	sbb    %r11,%rsi
   4bf29:	48 83 d8 ff          	sbb    $0xffffffffffffffff,%rax
   4bf2d:	5b                   	pop    %rbx
   4bf2e:	5d                   	pop    %rbp
   4bf2f:	48 89 ca             	mov    %rcx,%rdx
   4bf32:	c3                   	ret
   4bf33:	4c 39 c6             	cmp    %r8,%rsi
   4bf36:	73 0f                	jae    4bf47 <__udivti3+0x97>
   4bf38:	48 89 f8             	mov    %rdi,%rax
   4bf3b:	48 89 f2             	mov    %rsi,%rdx
   4bf3e:	49 f7 f0             	div    %r8
   4bf41:	31 c9                	xor    %ecx,%ecx
   4bf43:	48 89 ca             	mov    %rcx,%rdx
   4bf46:	c3                   	ret
   4bf47:	48 89 f0             	mov    %rsi,%rax
   4bf4a:	4c 09 c0             	or     %r8,%rax
   4bf4d:	48 c1 e8 20          	shr    $0x20,%rax
   4bf51:	74 15                	je     4bf68 <__udivti3+0xb8>
   4bf53:	48 89 f0             	mov    %rsi,%rax
   4bf56:	31 d2                	xor    %edx,%edx
   4bf58:	49 f7 f0             	div    %r8
   4bf5b:	48 89 c1             	mov    %rax,%rcx
   4bf5e:	48 89 f8             	mov    %rdi,%rax
   4bf61:	49 f7 f0             	div    %r8
   4bf64:	48 89 ca             	mov    %rcx,%rdx
   4bf67:	c3                   	ret
   4bf68:	89 f0                	mov    %esi,%eax
   4bf6a:	31 d2                	xor    %edx,%edx
   4bf6c:	41 f7 f0             	div    %r8d
   4bf6f:	89 c1                	mov    %eax,%ecx
   4bf71:	48 89 f8             	mov    %rdi,%rax
   4bf74:	49 f7 f0             	div    %r8
   4bf77:	48 89 ca             	mov    %rcx,%rdx
   4bf7a:	c3                   	ret

Disassembly of section .fini:
