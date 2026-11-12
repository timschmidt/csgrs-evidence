hyperinterval_strict_chain64:
    8ae0:	53                   	push   %rbx
    8ae1:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
    8ae8:	48 89 fb             	mov    %rdi,%rbx
    8aeb:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    8af0:	ff 15 3a 6b 05 00    	call   *0x56b3a(%rip)        # 5f630 <_GLOBAL_OFFSET_TABLE_+0x40>
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
    8b40:	f2 0f 10 05 b8 44 04 	movsd  0x444b8(%rip),%xmm0        # 4d000 <_fini+0xad4>
    8b47:	00 
    8b48:	f2 0f 10 0d b8 44 04 	movsd  0x444b8(%rip),%xmm1        # 4d008 <_fini+0xadc>
    8b4f:	00 
    8b50:	ff 15 42 73 05 00    	call   *0x57342(%rip)        # 5fe98 <_GLOBAL_OFFSET_TABLE_+0x8a8>
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
    8ba0:	ff 15 5a 6f 05 00    	call   *0x56f5a(%rip)        # 5fb00 <_GLOBAL_OFFSET_TABLE_+0x510>
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
    8bdc:	f2 0f 10 05 2c 44 04 	movsd  0x4442c(%rip),%xmm0        # 4d010 <_fini+0xae4>
    8be3:	00 
    8be4:	ff 15 26 73 05 00    	call   *0x57326(%rip)        # 5ff10 <_GLOBAL_OFFSET_TABLE_+0x920>
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
    8c26:	ff 15 5c 70 05 00    	call   *0x5705c(%rip)        # 5fc88 <_GLOBAL_OFFSET_TABLE_+0x698>
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
    8c77:	ff 15 43 6b 05 00    	call   *0x56b43(%rip)        # 5f7c0 <_GLOBAL_OFFSET_TABLE_+0x1d0>
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
    8c9d:	ff 15 ed 72 05 00    	call   *0x572ed(%rip)        # 5ff90 <_GLOBAL_OFFSET_TABLE_+0x9a0>
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
    8cd7:	f3 0f 10 05 51 45 04 	movss  0x44551(%rip),%xmm0        # 4d230 <_fini+0xd04>
    8cde:	00 
    8cdf:	f3 0f 10 0d 4d 45 04 	movss  0x4454d(%rip),%xmm1        # 4d234 <_fini+0xd08>
    8ce6:	00 
    8ce7:	ff 15 83 71 05 00    	call   *0x57183(%rip)        # 5fe70 <_GLOBAL_OFFSET_TABLE_+0x880>
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
    8d21:	ff 15 91 71 05 00    	call   *0x57191(%rip)        # 5feb8 <_GLOBAL_OFFSET_TABLE_+0x8c8>
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
    8d52:	f3 0f 10 05 de 44 04 	movss  0x444de(%rip),%xmm0        # 4d238 <_fini+0xd0c>
    8d59:	00 
    8d5a:	ff 15 48 6c 05 00    	call   *0x56c48(%rip)        # 5f9a8 <_GLOBAL_OFFSET_TABLE_+0x3b8>
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
    8d95:	ff 15 65 69 05 00    	call   *0x56965(%rip)        # 5f700 <_GLOBAL_OFFSET_TABLE_+0x110>
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
    8ddb:	ff 15 9f 6e 05 00    	call   *0x56e9f(%rip)        # 5fc80 <_GLOBAL_OFFSET_TABLE_+0x690>
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
    9585:	ff 15 05 6a 05 00    	call   *0x56a05(%rip)        # 5ff90 <_GLOBAL_OFFSET_TABLE_+0x9a0>
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
    95bc:	ff 15 9e 68 05 00    	call   *0x5689e(%rip)        # 5fe60 <_GLOBAL_OFFSET_TABLE_+0x870>
    95c2:	48 89 c3             	mov    %rax,%rbx
    95c5:	f6 c3 01             	test   $0x1,%bl
    95c8:	74 05                	je     95cf <hyperinterval_strict_surface32+0x6f>
    95ca:	88 7d 04             	mov    %bh,0x4(%rbp)
    95cd:	eb 13                	jmp    95e2 <hyperinterval_strict_surface32+0x82>
    95cf:	66 0f 6e 44 24 50    	movd   0x50(%rsp),%xmm0
    95d5:	ff 15 2d 63 05 00    	call   *0x5632d(%rip)        # 5f908 <_GLOBAL_OFFSET_TABLE_+0x318>
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
    9610:	ff 15 7a 69 05 00    	call   *0x5697a(%rip)        # 5ff90 <_GLOBAL_OFFSET_TABLE_+0x9a0>
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
    964d:	ff 15 4d 69 05 00    	call   *0x5694d(%rip)        # 5ffa0 <_GLOBAL_OFFSET_TABLE_+0x9b0>
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
    9687:	ff 15 33 62 05 00    	call   *0x56233(%rip)        # 5f8c0 <_GLOBAL_OFFSET_TABLE_+0x2d0>
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
    96c9:	ff 15 91 66 05 00    	call   *0x56691(%rip)        # 5fd60 <_GLOBAL_OFFSET_TABLE_+0x770>
    96cf:	4c 8d 74 24 60       	lea    0x60(%rsp),%r14
    96d4:	48 8d 54 24 38       	lea    0x38(%rsp),%rdx
    96d9:	4c 89 f7             	mov    %r14,%rdi
    96dc:	48 89 de             	mov    %rbx,%rsi
    96df:	ff 15 3b 61 05 00    	call   *0x5613b(%rip)        # 5f820 <_GLOBAL_OFFSET_TABLE_+0x230>
    96e5:	4c 89 f7             	mov    %r14,%rdi
    96e8:	ff 15 62 5f 05 00    	call   *0x55f62(%rip)        # 5f650 <_GLOBAL_OFFSET_TABLE_+0x60>
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
    974f:	ff 15 23 67 05 00    	call   *0x56723(%rip)        # 5fe78 <_GLOBAL_OFFSET_TABLE_+0x888>
    9755:	89 c3                	mov    %eax,%ebx
    9757:	4c 89 ef             	mov    %r13,%rdi
    975a:	4c 89 f6             	mov    %r14,%rsi
    975d:	ff 15 8d 64 05 00    	call   *0x5648d(%rip)        # 5fbf0 <_GLOBAL_OFFSET_TABLE_+0x600>
    9763:	41 89 c6             	mov    %eax,%r14d
    9766:	4c 8d 64 24 38       	lea    0x38(%rsp),%r12
    976b:	4c 89 ef             	mov    %r13,%rdi
    976e:	4c 89 e6             	mov    %r12,%rsi
    9771:	ff 15 59 64 05 00    	call   *0x56459(%rip)        # 5fbd0 <_GLOBAL_OFFSET_TABLE_+0x5e0>
    9777:	41 89 c7             	mov    %eax,%r15d
    977a:	4c 89 ef             	mov    %r13,%rdi
    977d:	4c 89 e6             	mov    %r12,%rsi
    9780:	ff 15 92 63 05 00    	call   *0x56392(%rip)        # 5fb18 <_GLOBAL_OFFSET_TABLE_+0x528>
    9786:	41 89 c4             	mov    %eax,%r12d
    9789:	4c 89 ef             	mov    %r13,%rdi
    978c:	66 0f 6e 44 24 34    	movd   0x34(%rsp),%xmm0
    9792:	ff 15 e8 67 05 00    	call   *0x567e8(%rip)        # 5ff80 <_GLOBAL_OFFSET_TABLE_+0x990>
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
    97d9:	66 0f 6f 15 1f 3b 04 	movdqa 0x43b1f(%rip),%xmm2        # 4d300 <_fini+0xdd4>
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
    980f:	ff 15 93 63 05 00    	call   *0x56393(%rip)        # 5fba8 <_GLOBAL_OFFSET_TABLE_+0x5b8>
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
    9844:	66 0f 6e 05 f4 39 04 	movd   0x439f4(%rip),%xmm0        # 4d240 <_fini+0xd14>
    984b:	00 
    984c:	ff 15 56 61 05 00    	call   *0x56156(%rip)        # 5f9a8 <_GLOBAL_OFFSET_TABLE_+0x3b8>
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
    9889:	ff 15 59 65 05 00    	call   *0x56559(%rip)        # 5fde8 <_GLOBAL_OFFSET_TABLE_+0x7f8>
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
    98ca:	ff 15 60 5d 05 00    	call   *0x55d60(%rip)        # 5f630 <_GLOBAL_OFFSET_TABLE_+0x40>
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
    993b:	ff 15 ef 65 05 00    	call   *0x565ef(%rip)        # 5ff30 <_GLOBAL_OFFSET_TABLE_+0x940>
    9941:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
    9946:	74 24                	je     996c <hyperinterval_strict_surface64+0xcc>
    9948:	f2 0f 10 44 24 40    	movsd  0x40(%rsp),%xmm0
    994e:	f2 0f 11 44 24 50    	movsd  %xmm0,0x50(%rsp)
    9954:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
    9959:	f2 0f 10 44 24 58    	movsd  0x58(%rsp),%xmm0
    995f:	ff 15 4b 63 05 00    	call   *0x5634b(%rip)        # 5fcb0 <_GLOBAL_OFFSET_TABLE_+0x6c0>
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
    99a1:	ff 15 89 5c 05 00    	call   *0x55c89(%rip)        # 5f630 <_GLOBAL_OFFSET_TABLE_+0x40>
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
    99ec:	ff 15 4e 61 05 00    	call   *0x5614e(%rip)        # 5fb40 <_GLOBAL_OFFSET_TABLE_+0x550>
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
    9a30:	ff 15 ba 5c 05 00    	call   *0x55cba(%rip)        # 5f6f0 <_GLOBAL_OFFSET_TABLE_+0x100>
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
    9a91:	ff 15 89 5c 05 00    	call   *0x55c89(%rip)        # 5f720 <_GLOBAL_OFFSET_TABLE_+0x130>
    9a97:	48 8d ac 24 d8 00 00 	lea    0xd8(%rsp),%rbp
    9a9e:	00 
    9a9f:	48 8d 54 24 60       	lea    0x60(%rsp),%rdx
    9aa4:	48 89 ef             	mov    %rbp,%rdi
    9aa7:	48 8d b4 24 f0 00 00 	lea    0xf0(%rsp),%rsi
    9aae:	00 
    9aaf:	ff 15 63 5c 05 00    	call   *0x55c63(%rip)        # 5f718 <_GLOBAL_OFFSET_TABLE_+0x128>
    9ab5:	48 89 ef             	mov    %rbp,%rdi
    9ab8:	ff 15 fa 60 05 00    	call   *0x560fa(%rip)        # 5fbb8 <_GLOBAL_OFFSET_TABLE_+0x5c8>
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
    9b34:	ff 15 16 61 05 00    	call   *0x56116(%rip)        # 5fc50 <_GLOBAL_OFFSET_TABLE_+0x660>
    9b3a:	88 44 24 58          	mov    %al,0x58(%rsp)
    9b3e:	48 89 ef             	mov    %rbp,%rdi
    9b41:	48 8d b4 24 b0 00 00 	lea    0xb0(%rsp),%rsi
    9b48:	00 
    9b49:	ff 15 c9 5e 05 00    	call   *0x55ec9(%rip)        # 5fa18 <_GLOBAL_OFFSET_TABLE_+0x428>
    9b4f:	88 44 24 50          	mov    %al,0x50(%rsp)
    9b53:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
    9b58:	48 89 ef             	mov    %rbp,%rdi
    9b5b:	ff 15 c7 60 05 00    	call   *0x560c7(%rip)        # 5fc28 <_GLOBAL_OFFSET_TABLE_+0x638>
    9b61:	88 44 24 0f          	mov    %al,0xf(%rsp)
    9b65:	48 89 ef             	mov    %rbp,%rdi
    9b68:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
    9b6d:	ff 15 2d 63 05 00    	call   *0x5632d(%rip)        # 5fea0 <_GLOBAL_OFFSET_TABLE_+0x8b0>
    9b73:	88 44 24 0e          	mov    %al,0xe(%rsp)
    9b77:	48 89 ef             	mov    %rbp,%rdi
    9b7a:	f2 0f 10 84 24 90 00 	movsd  0x90(%rsp),%xmm0
    9b81:	00 00 
    9b83:	ff 15 e7 5a 05 00    	call   *0x55ae7(%rip)        # 5f670 <_GLOBAL_OFFSET_TABLE_+0x80>
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
    9c4b:	ff 15 f7 60 05 00    	call   *0x560f7(%rip)        # 5fd48 <_GLOBAL_OFFSET_TABLE_+0x758>
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
    9c90:	f2 0f 10 05 88 33 04 	movsd  0x43388(%rip),%xmm0        # 4d020 <_fini+0xaf4>
    9c97:	00 
    9c98:	ff 15 72 62 05 00    	call   *0x56272(%rip)        # 5ff10 <_GLOBAL_OFFSET_TABLE_+0x920>
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
    9cdc:	ff 15 a6 61 05 00    	call   *0x561a6(%rip)        # 5fe88 <_GLOBAL_OFFSET_TABLE_+0x898>
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
    9d9b:	e8 40 40 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    9da0:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    9da5:	74 2a                	je     9dd1 <hyperinterval::float::F32Enclosure::new+0x61>
    9da7:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
    9dac:	66 0f 6e 44 24 1c    	movd   0x1c(%rsp),%xmm0
    9db2:	66 0f 7e c1          	movd   %xmm0,%ecx
    9db6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    9dbb:	be 00 00 00 80       	mov    $0x80000000,%esi
    9dc0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    9dc5:	e8 16 40 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
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
    9e59:	e8 82 3f 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
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
    9e94:	41 54                	push   %r12
    9e96:	53                   	push   %rbx
    9e97:	48 83 ec 18          	sub    $0x18,%rsp
    9e9b:	49 89 d6             	mov    %rdx,%r14
    9e9e:	48 89 fb             	mov    %rdi,%rbx
    9ea1:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
    9ea7:	89 f1                	mov    %esi,%ecx
    9ea9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    9eae:	be 00 00 00 80       	mov    $0x80000000,%esi
    9eb3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    9eb8:	e8 23 3f 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    9ebd:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    9ec2:	74 23                	je     9ee7 <hyperinterval::float::F32Enclosure::from_bits+0x57>
    9ec4:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    9ec9:	44 89 f1             	mov    %r14d,%ecx
    9ecc:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    9ed1:	be 00 00 00 80       	mov    $0x80000000,%esi
    9ed6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    9edb:	e8 00 3f 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    9ee0:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    9ee5:	75 1a                	jne    9f01 <hyperinterval::float::F32Enclosure::from_bits+0x71>
    9ee7:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
    9eec:	88 43 04             	mov    %al,0x4(%rbx)
    9eef:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    9ef5:	48 83 c4 18          	add    $0x18,%rsp
    9ef9:	5b                   	pop    %rbx
    9efa:	41 5c                	pop    %r12
    9efc:	41 5e                	pop    %r14
    9efe:	41 5f                	pop    %r15
    9f00:	c3                   	ret
    9f01:	8b 44 24 10          	mov    0x10(%rsp),%eax
    9f05:	44 89 e1             	mov    %r12d,%ecx
    9f08:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    9f0e:	89 c2                	mov    %eax,%edx
    9f10:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    9f16:	be 00 00 00 80       	mov    $0x80000000,%esi
    9f1b:	29 ce                	sub    %ecx,%esi
    9f1d:	44 09 f9             	or     %r15d,%ecx
    9f20:	45 85 e4             	test   %r12d,%r12d
    9f23:	48 0f 49 f1          	cmovns %rcx,%rsi
    9f27:	89 d1                	mov    %edx,%ecx
    9f29:	44 09 f9             	or     %r15d,%ecx
    9f2c:	41 29 d7             	sub    %edx,%r15d
    9f2f:	85 c0                	test   %eax,%eax
    9f31:	4c 0f 49 f9          	cmovns %rcx,%r15
    9f35:	44 39 fe             	cmp    %r15d,%esi
    9f38:	76 06                	jbe    9f40 <hyperinterval::float::F32Enclosure::from_bits+0xb0>
    9f3a:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
    9f3e:	eb af                	jmp    9eef <hyperinterval::float::F32Enclosure::from_bits+0x5f>
    9f40:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
    9f46:	44 89 63 04          	mov    %r12d,0x4(%rbx)
    9f4a:	89 43 08             	mov    %eax,0x8(%rbx)
    9f4d:	eb a6                	jmp    9ef5 <hyperinterval::float::F32Enclosure::from_bits+0x65>
    9f4f:	90                   	nop

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
    9f73:	e8 68 3e 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
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
    a578:	e8 b3 3b 00 00       	call   e130 <hyperinterval::ieee::Format::add>
    a57d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    a582:	74 6b                	je     a5ef <hyperinterval::float::F32Enclosure::add+0xbf>
    a584:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
    a589:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    a58e:	be 00 00 00 80       	mov    $0x80000000,%esi
    a593:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a598:	48 89 d9             	mov    %rbx,%rcx
    a59b:	4d 89 f0             	mov    %r14,%r8
    a59e:	e8 8d 3b 00 00       	call   e130 <hyperinterval::ieee::Format::add>
    a5a3:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    a5a8:	74 45                	je     a5ef <hyperinterval::float::F32Enclosure::add+0xbf>
    a5aa:	8b 5c 24 18          	mov    0x18(%rsp),%ebx
    a5ae:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    a5b3:	be 00 00 00 80       	mov    $0x80000000,%esi
    a5b8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a5bd:	4c 89 f9             	mov    %r15,%rcx
    a5c0:	e8 1b 38 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    a5c5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    a5ca:	74 23                	je     a5ef <hyperinterval::float::F32Enclosure::add+0xbf>
    a5cc:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
    a5d1:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    a5d6:	be 00 00 00 80       	mov    $0x80000000,%esi
    a5db:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a5e0:	48 89 d9             	mov    %rbx,%rcx
    a5e3:	e8 f8 37 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
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
    a68b:	66 0f 6f 15 6d 2c 04 	movdqa 0x42c6d(%rip),%xmm2        # 4d300 <_fini+0xdd4>
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
    a6ba:	ff 15 40 50 05 00    	call   *0x55040(%rip)        # 5f700 <_GLOBAL_OFFSET_TABLE_+0x110>
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
    a728:	e8 93 40 00 00       	call   e7c0 <hyperinterval::ieee::Format::div>
    a72d:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    a731:	0f 85 4d 04 00 00    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    a737:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    a73b:	8b 6c 24 10          	mov    0x10(%rsp),%ebp
    a73f:	48 89 e7             	mov    %rsp,%rdi
    a742:	be 00 00 00 80       	mov    $0x80000000,%esi
    a747:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a74c:	e8 8f 36 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    a751:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    a755:	0f 85 29 04 00 00    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    a75b:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
    a760:	48 89 e7             	mov    %rsp,%rdi
    a763:	be 00 00 00 80       	mov    $0x80000000,%esi
    a768:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a76d:	48 89 e9             	mov    %rbp,%rcx
    a770:	e8 6b 36 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
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
    a7d3:	e8 e8 3f 00 00       	call   e7c0 <hyperinterval::ieee::Format::div>
    a7d8:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    a7dc:	0f 85 a2 03 00 00    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    a7e2:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    a7e6:	44 8b 6c 24 10       	mov    0x10(%rsp),%r13d
    a7eb:	48 89 e7             	mov    %rsp,%rdi
    a7ee:	be 00 00 00 80       	mov    $0x80000000,%esi
    a7f3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a7f8:	e8 e3 35 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    a7fd:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    a801:	0f 85 7d 03 00 00    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    a807:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
    a80c:	48 89 e7             	mov    %rsp,%rdi
    a80f:	be 00 00 00 80       	mov    $0x80000000,%esi
    a814:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a819:	4c 89 e9             	mov    %r13,%rcx
    a81c:	e8 bf 35 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
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
    a8c4:	e8 f7 3e 00 00       	call   e7c0 <hyperinterval::ieee::Format::div>
    a8c9:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    a8cd:	0f 85 b1 02 00 00    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    a8d3:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    a8d7:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
    a8dc:	48 89 e7             	mov    %rsp,%rdi
    a8df:	be 00 00 00 80       	mov    $0x80000000,%esi
    a8e4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a8e9:	e8 f2 34 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    a8ee:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    a8f2:	0f 85 8c 02 00 00    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    a8f8:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    a8fd:	48 89 e7             	mov    %rsp,%rdi
    a900:	be 00 00 00 80       	mov    $0x80000000,%esi
    a905:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a90a:	4c 89 e1             	mov    %r12,%rcx
    a90d:	e8 ce 34 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
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
    a9c0:	e8 fb 3d 00 00       	call   e7c0 <hyperinterval::ieee::Format::div>
    a9c5:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    a9c9:	0f 85 b5 01 00 00    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    a9cf:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    a9d3:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
    a9d8:	48 89 e7             	mov    %rsp,%rdi
    a9db:	be 00 00 00 80       	mov    $0x80000000,%esi
    a9e0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    a9e5:	e8 f6 33 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    a9ea:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    a9ee:	0f 85 90 01 00 00    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    a9f4:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    a9f9:	48 89 e7             	mov    %rsp,%rdi
    a9fc:	be 00 00 00 80       	mov    $0x80000000,%esi
    aa01:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    aa06:	4c 89 f1             	mov    %r14,%rcx
    aa09:	e8 d2 33 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
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
    ab2c:	e8 ef 32 00 00       	call   de20 <hyperinterval::ieee::Format::rounded>
    ab31:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
    ab36:	74 07                	je     ab3f <hyperinterval::float::F32Enclosure::corner_image+0x46f>
    ab38:	0f b6 6c 24 29       	movzbl 0x29(%rsp),%ebp
    ab3d:	eb 4a                	jmp    ab89 <hyperinterval::float::F32Enclosure::corner_image+0x4b9>
    ab3f:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
    ab43:	8b 6c 24 38          	mov    0x38(%rsp),%ebp
    ab47:	48 89 e7             	mov    %rsp,%rdi
    ab4a:	be 00 00 00 80       	mov    $0x80000000,%esi
    ab4f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ab54:	e8 87 32 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    ab59:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ab5d:	75 25                	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    ab5f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    ab64:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    ab69:	48 89 e7             	mov    %rsp,%rdi
    ab6c:	be 00 00 00 80       	mov    $0x80000000,%esi
    ab71:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ab76:	48 89 e9             	mov    %rbp,%rcx
    ab79:	e8 62 32 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
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
    ac67:	e8 b4 31 00 00       	call   de20 <hyperinterval::ieee::Format::rounded>
    ac6c:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
    ac71:	0f 85 c1 fe ff ff    	jne    ab38 <hyperinterval::float::F32Enclosure::corner_image+0x468>
    ac77:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
    ac7b:	44 8b 6c 24 38       	mov    0x38(%rsp),%r13d
    ac80:	48 89 e7             	mov    %rsp,%rdi
    ac83:	be 00 00 00 80       	mov    $0x80000000,%esi
    ac88:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ac8d:	e8 4e 31 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    ac92:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    ac96:	0f 84 e8 fe ff ff    	je     ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    ac9c:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
    aca1:	48 89 e7             	mov    %rsp,%rdi
    aca4:	be 00 00 00 80       	mov    $0x80000000,%esi
    aca9:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    acae:	4c 89 e9             	mov    %r13,%rcx
    acb1:	e8 2a 31 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
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
    adcf:	e8 4c 30 00 00       	call   de20 <hyperinterval::ieee::Format::rounded>
    add4:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
    add9:	0f 85 59 fd ff ff    	jne    ab38 <hyperinterval::float::F32Enclosure::corner_image+0x468>
    addf:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
    ade3:	44 8b 64 24 38       	mov    0x38(%rsp),%r12d
    ade8:	48 89 e7             	mov    %rsp,%rdi
    adeb:	be 00 00 00 80       	mov    $0x80000000,%esi
    adf0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    adf5:	e8 e6 2f 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    adfa:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    adfe:	0f 85 80 fd ff ff    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    ae04:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
    ae09:	48 89 e7             	mov    %rsp,%rdi
    ae0c:	be 00 00 00 80       	mov    $0x80000000,%esi
    ae11:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ae16:	4c 89 e1             	mov    %r12,%rcx
    ae19:	e8 c2 2f 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
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
    aefb:	e8 20 2f 00 00       	call   de20 <hyperinterval::ieee::Format::rounded>
    af00:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
    af05:	0f 85 2d fc ff ff    	jne    ab38 <hyperinterval::float::F32Enclosure::corner_image+0x468>
    af0b:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
    af0f:	44 8b 74 24 38       	mov    0x38(%rsp),%r14d
    af14:	48 89 e7             	mov    %rsp,%rdi
    af17:	be 00 00 00 80       	mov    $0x80000000,%esi
    af1c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    af21:	e8 ba 2e 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    af26:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    af2a:	0f 85 54 fc ff ff    	jne    ab84 <hyperinterval::float::F32Enclosure::corner_image+0x4b4>
    af30:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    af35:	48 89 e7             	mov    %rsp,%rdi
    af38:	be 00 00 00 80       	mov    $0x80000000,%esi
    af3d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    af42:	4c 89 f1             	mov    %r14,%rcx
    af45:	e8 96 2e 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
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
    b0a0:	e8 3b 2d 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    b0a5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b0aa:	74 25                	je     b0d1 <hyperinterval::float::F32Enclosure::reciprocal+0x61>
    b0ac:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    b0b1:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b0b6:	be 00 00 00 80       	mov    $0x80000000,%esi
    b0bb:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b0c0:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
    b0c5:	e8 16 2d 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
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
    b239:	e8 e2 2b 00 00       	call   de20 <hyperinterval::ieee::Format::rounded>
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
    b29f:	e8 7c 2b 00 00       	call   de20 <hyperinterval::ieee::Format::rounded>
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
    b2d8:	e8 03 2b 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    b2dd:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    b2e1:	74 23                	je     b306 <hyperinterval::float::F32Enclosure::square+0x146>
    b2e3:	4d 89 e5             	mov    %r12,%r13
    b2e6:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    b2eb:	48 89 e7             	mov    %rsp,%rdi
    b2ee:	be 00 00 00 80       	mov    $0x80000000,%esi
    b2f3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b2f8:	48 89 e9             	mov    %rbp,%rcx
    b2fb:	e8 e0 2a 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
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
    b378:	e8 63 2a 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    b37d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    b381:	74 83                	je     b306 <hyperinterval::float::F32Enclosure::square+0x146>
    b383:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    b388:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    b38d:	48 89 e7             	mov    %rsp,%rdi
    b390:	be 00 00 00 80       	mov    $0x80000000,%esi
    b395:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b39a:	4c 89 e9             	mov    %r13,%rcx
    b39d:	e8 3e 2a 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
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
    b3f7:	e8 34 28 00 00       	call   dc30 <hyperinterval::bounds::Bounds<T>::hull>
    b3fc:	41 89 c4             	mov    %eax,%r12d
    b3ff:	89 d5                	mov    %edx,%ebp
    b401:	44 89 ff             	mov    %r15d,%edi
    b404:	44 89 f6             	mov    %r14d,%esi
    b407:	31 d2                	xor    %edx,%edx
    b409:	e8 b2 28 00 00       	call   dcc0 <hyperinterval::bounds::Bounds<T>::signs>
    b40e:	a8 02                	test   $0x2,%al
    b410:	75 12                	jne    b424 <hyperinterval::float::F32Enclosure::square+0x264>
    b412:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
    b418:	44 89 63 04          	mov    %r12d,0x4(%rbx)
    b41c:	89 6b 08             	mov    %ebp,0x8(%rbx)
    b41f:	e9 f0 fe ff ff       	jmp    b314 <hyperinterval::float::F32Enclosure::square+0x154>
    b424:	48 89 e7             	mov    %rsp,%rdi
    b427:	31 f6                	xor    %esi,%esi
    b429:	31 d2                	xor    %edx,%edx
    b42b:	e8 60 ea ff ff       	call   9e90 <hyperinterval::float::F32Enclosure::from_bits>
    b430:	8b 0c 24             	mov    (%rsp),%ecx
    b433:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
    b438:	83 f9 02             	cmp    $0x2,%ecx
    b43b:	0f 84 ca fe ff ff    	je     b30b <hyperinterval::float::F32Enclosure::square+0x14b>
    b441:	f6 c1 01             	test   $0x1,%cl
    b444:	74 cc                	je     b412 <hyperinterval::float::F32Enclosure::square+0x252>
    b446:	0f b6 c0             	movzbl %al,%eax
    b449:	0f b6 4c 24 07       	movzbl 0x7(%rsp),%ecx
    b44e:	c1 e1 10             	shl    $0x10,%ecx
    b451:	0f b7 54 24 05       	movzwl 0x5(%rsp),%edx
    b456:	09 ca                	or     %ecx,%edx
    b458:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    b45c:	c1 e2 08             	shl    $0x8,%edx
    b45f:	09 c2                	or     %eax,%edx
    b461:	44 89 e7             	mov    %r12d,%edi
    b464:	89 ee                	mov    %ebp,%esi
    b466:	e8 c5 27 00 00       	call   dc30 <hyperinterval::bounds::Bounds<T>::hull>
    b46b:	41 89 c4             	mov    %eax,%r12d
    b46e:	89 d5                	mov    %edx,%ebp
    b470:	eb a0                	jmp    b412 <hyperinterval::float::F32Enclosure::square+0x252>
    b472:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    b479:	00 00 00 
    b47c:	0f 1f 40 00          	nopl   0x0(%rax)

hyperinterval::float::F32Enclosure::checked_pow:
    b480:	55                   	push   %rbp
    b481:	41 57                	push   %r15
    b483:	41 56                	push   %r14
    b485:	41 55                	push   %r13
    b487:	41 54                	push   %r12
    b489:	53                   	push   %rbx
    b48a:	48 83 ec 38          	sub    $0x38,%rsp
    b48e:	48 89 fb             	mov    %rdi,%rbx
    b491:	83 fa 02             	cmp    $0x2,%edx
    b494:	75 0e                	jne    b4a4 <hyperinterval::float::F32Enclosure::checked_pow+0x24>
    b496:	48 89 df             	mov    %rbx,%rdi
    b499:	ff 15 19 4a 05 00    	call   *0x54a19(%rip)        # 5feb8 <_GLOBAL_OFFSET_TABLE_+0x8c8>
    b49f:	e9 c8 00 00 00       	jmp    b56c <hyperinterval::float::F32Enclosure::checked_pow+0xec>
    b4a4:	f6 06 01             	testb  $0x1,(%rsi)
    b4a7:	0f 84 b9 00 00 00    	je     b566 <hyperinterval::float::F32Enclosure::checked_pow+0xe6>
    b4ad:	89 d5                	mov    %edx,%ebp
    b4af:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
    b4b3:	44 8b 76 08          	mov    0x8(%rsi),%r14d
    b4b7:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b4bc:	be 00 00 00 80       	mov    $0x80000000,%esi
    b4c1:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b4c6:	4c 89 f9             	mov    %r15,%rcx
    b4c9:	41 89 e8             	mov    %ebp,%r8d
    b4cc:	e8 2f 37 00 00       	call   ec00 <hyperinterval::ieee::Format::power>
    b4d1:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
    b4d6:	75 7e                	jne    b556 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
    b4d8:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
    b4dd:	44 8b 6c 24 18       	mov    0x18(%rsp),%r13d
    b4e2:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b4e7:	be 00 00 00 80       	mov    $0x80000000,%esi
    b4ec:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b4f1:	4c 89 f1             	mov    %r14,%rcx
    b4f4:	41 89 e8             	mov    %ebp,%r8d
    b4f7:	e8 04 37 00 00       	call   ec00 <hyperinterval::ieee::Format::power>
    b4fc:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b501:	74 53                	je     b556 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
    b503:	8b 44 24 10          	mov    0x10(%rsp),%eax
    b507:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    b50c:	8b 44 24 18          	mov    0x18(%rsp),%eax
    b510:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
    b515:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b51a:	be 00 00 00 80       	mov    $0x80000000,%esi
    b51f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b524:	4c 89 e1             	mov    %r12,%rcx
    b527:	e8 b4 28 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    b52c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b531:	74 23                	je     b556 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
    b533:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    b538:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b53d:	be 00 00 00 80       	mov    $0x80000000,%esi
    b542:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b547:	4c 89 e9             	mov    %r13,%rcx
    b54a:	e8 91 28 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    b54f:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b554:	75 28                	jne    b57e <hyperinterval::float::F32Enclosure::checked_pow+0xfe>
    b556:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
    b55b:	88 43 04             	mov    %al,0x4(%rbx)
    b55e:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    b564:	eb 06                	jmp    b56c <hyperinterval::float::F32Enclosure::checked_pow+0xec>
    b566:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
    b56c:	48 89 d8             	mov    %rbx,%rax
    b56f:	48 83 c4 38          	add    $0x38,%rsp
    b573:	5b                   	pop    %rbx
    b574:	41 5c                	pop    %r12
    b576:	41 5d                	pop    %r13
    b578:	41 5e                	pop    %r14
    b57a:	41 5f                	pop    %r15
    b57c:	5d                   	pop    %rbp
    b57d:	c3                   	ret
    b57e:	8b 7c 24 10          	mov    0x10(%rsp),%edi
    b582:	44 89 e0             	mov    %r12d,%eax
    b585:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    b58a:	89 f9                	mov    %edi,%ecx
    b58c:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    b592:	ba 00 00 00 80       	mov    $0x80000000,%edx
    b597:	29 c2                	sub    %eax,%edx
    b599:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
    b59f:	44 09 e8             	or     %r13d,%eax
    b5a2:	45 85 e4             	test   %r12d,%r12d
    b5a5:	48 0f 49 d0          	cmovns %rax,%rdx
    b5a9:	be 00 00 00 80       	mov    $0x80000000,%esi
    b5ae:	29 ce                	sub    %ecx,%esi
    b5b0:	89 c8                	mov    %ecx,%eax
    b5b2:	44 09 e8             	or     %r13d,%eax
    b5b5:	85 ff                	test   %edi,%edi
    b5b7:	48 0f 49 f0          	cmovns %rax,%rsi
    b5bb:	b0 01                	mov    $0x1,%al
    b5bd:	39 f2                	cmp    %esi,%edx
    b5bf:	77 9a                	ja     b55b <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
    b5c1:	89 7c 24 2c          	mov    %edi,0x2c(%rsp)
    b5c5:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b5ca:	be 00 00 00 80       	mov    $0x80000000,%esi
    b5cf:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b5d4:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    b5d9:	e8 02 28 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    b5de:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b5e3:	0f 84 6d ff ff ff    	je     b556 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
    b5e9:	4c 89 64 24 20       	mov    %r12,0x20(%rsp)
    b5ee:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    b5f3:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b5f8:	be 00 00 00 80       	mov    $0x80000000,%esi
    b5fd:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b602:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
    b607:	e8 d4 27 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    b60c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b611:	0f 84 3f ff ff ff    	je     b556 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
    b617:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
    b61b:	44 89 e0             	mov    %r12d,%eax
    b61e:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    b623:	89 ca                	mov    %ecx,%edx
    b625:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    b62b:	be 00 00 00 80       	mov    $0x80000000,%esi
    b630:	29 c6                	sub    %eax,%esi
    b632:	44 09 e8             	or     %r13d,%eax
    b635:	45 85 e4             	test   %r12d,%r12d
    b638:	48 0f 49 f0          	cmovns %rax,%rsi
    b63c:	89 d0                	mov    %edx,%eax
    b63e:	44 09 e8             	or     %r13d,%eax
    b641:	41 29 d5             	sub    %edx,%r13d
    b644:	85 c9                	test   %ecx,%ecx
    b646:	4c 0f 49 e8          	cmovns %rax,%r13
    b64a:	b0 01                	mov    $0x1,%al
    b64c:	44 39 ee             	cmp    %r13d,%esi
    b64f:	0f 87 06 ff ff ff    	ja     b55b <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
    b655:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
    b65a:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
    b65e:	44 89 e2             	mov    %r12d,%edx
    b661:	e8 ca 25 00 00       	call   dc30 <hyperinterval::bounds::Bounds<T>::hull>
    b666:	41 89 c5             	mov    %eax,%r13d
    b669:	41 89 d4             	mov    %edx,%r12d
    b66c:	85 ed                	test   %ebp,%ebp
    b66e:	0f 95 c0             	setne  %al
    b671:	40 f6 c5 01          	test   $0x1,%bpl
    b675:	0f 94 c1             	sete   %cl
    b678:	84 c8                	test   %cl,%al
    b67a:	74 11                	je     b68d <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
    b67c:	44 89 ff             	mov    %r15d,%edi
    b67f:	44 89 f6             	mov    %r14d,%esi
    b682:	31 d2                	xor    %edx,%edx
    b684:	e8 37 26 00 00       	call   dcc0 <hyperinterval::bounds::Bounds<T>::signs>
    b689:	a8 02                	test   $0x2,%al
    b68b:	75 13                	jne    b6a0 <hyperinterval::float::F32Enclosure::checked_pow+0x220>
    b68d:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
    b693:	44 89 6b 04          	mov    %r13d,0x4(%rbx)
    b697:	44 89 63 08          	mov    %r12d,0x8(%rbx)
    b69b:	e9 cc fe ff ff       	jmp    b56c <hyperinterval::float::F32Enclosure::checked_pow+0xec>
    b6a0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b6a5:	31 f6                	xor    %esi,%esi
    b6a7:	31 d2                	xor    %edx,%edx
    b6a9:	e8 e2 e7 ff ff       	call   9e90 <hyperinterval::float::F32Enclosure::from_bits>
    b6ae:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    b6b2:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
    b6b7:	83 f9 02             	cmp    $0x2,%ecx
    b6ba:	0f 84 9b fe ff ff    	je     b55b <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
    b6c0:	f6 c1 01             	test   $0x1,%cl
    b6c3:	74 c8                	je     b68d <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
    b6c5:	0f b6 c0             	movzbl %al,%eax
    b6c8:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
    b6cd:	c1 e1 10             	shl    $0x10,%ecx
    b6d0:	0f b7 54 24 0d       	movzwl 0xd(%rsp),%edx
    b6d5:	09 ca                	or     %ecx,%edx
    b6d7:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
    b6db:	c1 e2 08             	shl    $0x8,%edx
    b6de:	09 c2                	or     %eax,%edx
    b6e0:	44 89 ef             	mov    %r13d,%edi
    b6e3:	44 89 e6             	mov    %r12d,%esi
    b6e6:	e8 45 25 00 00       	call   dc30 <hyperinterval::bounds::Bounds<T>::hull>
    b6eb:	41 89 c5             	mov    %eax,%r13d
    b6ee:	41 89 d4             	mov    %edx,%r12d
    b6f1:	eb 9a                	jmp    b68d <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
    b6f3:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    b6fa:	00 00 00 
    b6fd:	0f 1f 00             	nopl   (%rax)

hyperinterval::float::F32Enclosure::affine:
    b700:	55                   	push   %rbp
    b701:	41 57                	push   %r15
    b703:	41 56                	push   %r14
    b705:	41 55                	push   %r13
    b707:	41 54                	push   %r12
    b709:	53                   	push   %rbx
    b70a:	48 83 ec 28          	sub    $0x28,%rsp
    b70e:	f3 0f 11 4c 24 20    	movss  %xmm1,0x20(%rsp)
    b714:	49 89 f7             	mov    %rsi,%r15
    b717:	48 89 fb             	mov    %rdi,%rbx
    b71a:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
    b720:	66 0f 7e c1          	movd   %xmm0,%ecx
    b724:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b729:	be 00 00 00 80       	mov    $0x80000000,%esi
    b72e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b733:	e8 a8 26 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    b738:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b73d:	74 2a                	je     b769 <hyperinterval::float::F32Enclosure::affine+0x69>
    b73f:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
    b744:	66 0f 6e 44 24 20    	movd   0x20(%rsp),%xmm0
    b74a:	66 0f 7e c1          	movd   %xmm0,%ecx
    b74e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b753:	be 00 00 00 80       	mov    $0x80000000,%esi
    b758:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b75d:	e8 7e 26 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    b762:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b767:	75 20                	jne    b789 <hyperinterval::float::F32Enclosure::affine+0x89>
    b769:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
    b76e:	88 43 04             	mov    %al,0x4(%rbx)
    b771:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    b777:	48 89 d8             	mov    %rbx,%rax
    b77a:	48 83 c4 28          	add    $0x28,%rsp
    b77e:	5b                   	pop    %rbx
    b77f:	41 5c                	pop    %r12
    b781:	41 5d                	pop    %r13
    b783:	41 5e                	pop    %r14
    b785:	41 5f                	pop    %r15
    b787:	5d                   	pop    %rbp
    b788:	c3                   	ret
    b789:	41 f6 07 01          	testb  $0x1,(%r15)
    b78d:	0f 84 60 01 00 00    	je     b8f3 <hyperinterval::float::F32Enclosure::affine+0x1f3>
    b793:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
    b798:	41 8b 6f 08          	mov    0x8(%r15),%ebp
    b79c:	41 8b 4f 04          	mov    0x4(%r15),%ecx
    b7a0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b7a5:	be 00 00 00 80       	mov    $0x80000000,%esi
    b7aa:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b7af:	4d 89 f0             	mov    %r14,%r8
    b7b2:	4d 89 e1             	mov    %r12,%r9
    b7b5:	e8 16 2c 00 00       	call   e3d0 <hyperinterval::ieee::Format::affine>
    b7ba:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b7bf:	74 a8                	je     b769 <hyperinterval::float::F32Enclosure::affine+0x69>
    b7c1:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
    b7c6:	8b 44 24 18          	mov    0x18(%rsp),%eax
    b7ca:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    b7cf:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b7d4:	be 00 00 00 80       	mov    $0x80000000,%esi
    b7d9:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b7de:	48 89 e9             	mov    %rbp,%rcx
    b7e1:	4d 89 f0             	mov    %r14,%r8
    b7e4:	4d 89 e1             	mov    %r12,%r9
    b7e7:	e8 e4 2b 00 00       	call   e3d0 <hyperinterval::ieee::Format::affine>
    b7ec:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b7f1:	0f 84 72 ff ff ff    	je     b769 <hyperinterval::float::F32Enclosure::affine+0x69>
    b7f7:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
    b7fc:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
    b801:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b806:	be 00 00 00 80       	mov    $0x80000000,%esi
    b80b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b810:	4c 89 f9             	mov    %r15,%rcx
    b813:	e8 c8 25 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    b818:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b81d:	0f 84 46 ff ff ff    	je     b769 <hyperinterval::float::F32Enclosure::affine+0x69>
    b823:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
    b828:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b82d:	be 00 00 00 80       	mov    $0x80000000,%esi
    b832:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b837:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    b83c:	e8 9f 25 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    b841:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b846:	0f 84 1d ff ff ff    	je     b769 <hyperinterval::float::F32Enclosure::affine+0x69>
    b84c:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
    b851:	44 89 f0             	mov    %r14d,%eax
    b854:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
    b859:	44 89 f9             	mov    %r15d,%ecx
    b85c:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    b862:	ba 00 00 00 80       	mov    $0x80000000,%edx
    b867:	29 c2                	sub    %eax,%edx
    b869:	44 09 e8             	or     %r13d,%eax
    b86c:	45 85 f6             	test   %r14d,%r14d
    b86f:	48 0f 49 d0          	cmovns %rax,%rdx
    b873:	89 c8                	mov    %ecx,%eax
    b875:	44 09 e8             	or     %r13d,%eax
    b878:	41 29 cd             	sub    %ecx,%r13d
    b87b:	45 85 ff             	test   %r15d,%r15d
    b87e:	4c 0f 49 e8          	cmovns %rax,%r13
    b882:	b0 01                	mov    $0x1,%al
    b884:	44 39 ea             	cmp    %r13d,%edx
    b887:	0f 87 e1 fe ff ff    	ja     b76e <hyperinterval::float::F32Enclosure::affine+0x6e>
    b88d:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b892:	48 89 ee             	mov    %rbp,%rsi
    b895:	4c 89 e2             	mov    %r12,%rdx
    b898:	e8 f3 e5 ff ff       	call   9e90 <hyperinterval::float::F32Enclosure::from_bits>
    b89d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    b8a1:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
    b8a6:	83 f9 02             	cmp    $0x2,%ecx
    b8a9:	0f 84 bf fe ff ff    	je     b76e <hyperinterval::float::F32Enclosure::affine+0x6e>
    b8af:	f6 c1 01             	test   $0x1,%cl
    b8b2:	74 2c                	je     b8e0 <hyperinterval::float::F32Enclosure::affine+0x1e0>
    b8b4:	0f b6 c0             	movzbl %al,%eax
    b8b7:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
    b8bc:	c1 e1 10             	shl    $0x10,%ecx
    b8bf:	0f b7 54 24 0d       	movzwl 0xd(%rsp),%edx
    b8c4:	09 ca                	or     %ecx,%edx
    b8c6:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
    b8ca:	c1 e2 08             	shl    $0x8,%edx
    b8cd:	09 c2                	or     %eax,%edx
    b8cf:	44 89 f7             	mov    %r14d,%edi
    b8d2:	44 89 fe             	mov    %r15d,%esi
    b8d5:	e8 56 23 00 00       	call   dc30 <hyperinterval::bounds::Bounds<T>::hull>
    b8da:	41 89 c6             	mov    %eax,%r14d
    b8dd:	41 89 d7             	mov    %edx,%r15d
    b8e0:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
    b8e6:	44 89 73 04          	mov    %r14d,0x4(%rbx)
    b8ea:	44 89 7b 08          	mov    %r15d,0x8(%rbx)
    b8ee:	e9 84 fe ff ff       	jmp    b777 <hyperinterval::float::F32Enclosure::affine+0x77>
    b8f3:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
    b8f9:	e9 79 fe ff ff       	jmp    b777 <hyperinterval::float::F32Enclosure::affine+0x77>
    b8fe:	66 90                	xchg   %ax,%ax

hyperinterval::float::F32Enclosure::next_down:
    b900:	53                   	push   %rbx
    b901:	48 83 ec 10          	sub    $0x10,%rsp
    b905:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    b90a:	66 0f 7e c1          	movd   %xmm0,%ecx
    b90e:	48 89 e7             	mov    %rsp,%rdi
    b911:	be 00 00 00 80       	mov    $0x80000000,%esi
    b916:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b91b:	e8 c0 24 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    b920:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    b924:	75 0a                	jne    b930 <hyperinterval::float::F32Enclosure::next_down+0x30>
    b926:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
    b92b:	c1 e1 08             	shl    $0x8,%ecx
    b92e:	eb 3d                	jmp    b96d <hyperinterval::float::F32Enclosure::next_down+0x6d>
    b930:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    b935:	48 89 c1             	mov    %rax,%rcx
    b938:	48 31 d9             	xor    %rbx,%rcx
    b93b:	48 85 c0             	test   %rax,%rax
    b93e:	48 0f 44 c8          	cmove  %rax,%rcx
    b942:	31 c0                	xor    %eax,%eax
    b944:	85 c9                	test   %ecx,%ecx
    b946:	0f 99 c0             	setns  %al
    b949:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
    b94d:	48 ff c9             	dec    %rcx
    b950:	48 89 e7             	mov    %rsp,%rdi
    b953:	be 00 00 00 80       	mov    $0x80000000,%esi
    b958:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b95d:	e8 7e 24 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    b962:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    b966:	75 13                	jne    b97b <hyperinterval::float::F32Enclosure::next_down+0x7b>
    b968:	b9 00 03 00 00       	mov    $0x300,%ecx
    b96d:	b8 01 00 00 00       	mov    $0x1,%eax
    b972:	48 09 c8             	or     %rcx,%rax
    b975:	48 83 c4 10          	add    $0x10,%rsp
    b979:	5b                   	pop    %rbx
    b97a:	c3                   	ret
    b97b:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    b980:	48 89 c1             	mov    %rax,%rcx
    b983:	48 81 f1 00 00 00 80 	xor    $0xffffffff80000000,%rcx
    b98a:	48 c1 e1 20          	shl    $0x20,%rcx
    b98e:	48 85 c0             	test   %rax,%rax
    b991:	48 0f 44 c8          	cmove  %rax,%rcx
    b995:	31 c0                	xor    %eax,%eax
    b997:	48 09 c8             	or     %rcx,%rax
    b99a:	48 83 c4 10          	add    $0x10,%rsp
    b99e:	5b                   	pop    %rbx
    b99f:	c3                   	ret

hyperinterval::float::F32Enclosure::next_up:
    b9a0:	48 83 ec 18          	sub    $0x18,%rsp
    b9a4:	66 0f 7e c1          	movd   %xmm0,%ecx
    b9a8:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b9ad:	be 00 00 00 80       	mov    $0x80000000,%esi
    b9b2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b9b7:	e8 24 24 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    b9bc:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    b9c1:	75 15                	jne    b9d8 <hyperinterval::float::F32Enclosure::next_up+0x38>
    b9c3:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
    b9c8:	c1 e1 08             	shl    $0x8,%ecx
    b9cb:	b8 01 00 00 00       	mov    $0x1,%eax
    b9d0:	48 09 c8             	or     %rcx,%rax
    b9d3:	48 83 c4 18          	add    $0x18,%rsp
    b9d7:	c3                   	ret
    b9d8:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    b9dd:	31 c9                	xor    %ecx,%ecx
    b9df:	85 c0                	test   %eax,%eax
    b9e1:	0f 99 c1             	setns  %cl
    b9e4:	48 8d 0c 48          	lea    (%rax,%rcx,2),%rcx
    b9e8:	48 ff c9             	dec    %rcx
    b9eb:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    b9f0:	be 00 00 00 80       	mov    $0x80000000,%esi
    b9f5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    b9fa:	e8 e1 23 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    b9ff:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    ba04:	75 12                	jne    ba18 <hyperinterval::float::F32Enclosure::next_up+0x78>
    ba06:	b9 00 03 00 00       	mov    $0x300,%ecx
    ba0b:	b8 01 00 00 00       	mov    $0x1,%eax
    ba10:	48 09 c8             	or     %rcx,%rax
    ba13:	48 83 c4 18          	add    $0x18,%rsp
    ba17:	c3                   	ret
    ba18:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    ba1d:	48 c1 e1 20          	shl    $0x20,%rcx
    ba21:	31 c0                	xor    %eax,%eax
    ba23:	48 09 c8             	or     %rcx,%rax
    ba26:	48 83 c4 18          	add    $0x18,%rsp
    ba2a:	c3                   	ret
    ba2b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

hyperinterval::float::F32Enclosure::expanded:
    ba30:	41 57                	push   %r15
    ba32:	41 56                	push   %r14
    ba34:	41 54                	push   %r12
    ba36:	53                   	push   %rbx
    ba37:	48 83 ec 18          	sub    $0x18,%rsp
    ba3b:	48 89 fb             	mov    %rdi,%rbx
    ba3e:	f6 06 01             	testb  $0x1,(%rsi)
    ba41:	74 7c                	je     babf <hyperinterval::float::F32Enclosure::expanded+0x8f>
    ba43:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
    ba49:	8b 46 04             	mov    0x4(%rsi),%eax
    ba4c:	44 8b 76 08          	mov    0x8(%rsi),%r14d
    ba50:	8d 88 00 00 00 80    	lea    -0x80000000(%rax),%ecx
    ba56:	85 c0                	test   %eax,%eax
    ba58:	0f 44 c8             	cmove  %eax,%ecx
    ba5b:	31 c0                	xor    %eax,%eax
    ba5d:	85 c9                	test   %ecx,%ecx
    ba5f:	0f 99 c0             	setns  %al
    ba62:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
    ba66:	48 ff c9             	dec    %rcx
    ba69:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    ba6e:	be 00 00 00 80       	mov    $0x80000000,%esi
    ba73:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    ba78:	e8 63 23 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    ba7d:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
    ba82:	75 2f                	jne    bab3 <hyperinterval::float::F32Enclosure::expanded+0x83>
    ba84:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    ba89:	31 c0                	xor    %eax,%eax
    ba8b:	45 85 f6             	test   %r14d,%r14d
    ba8e:	0f 99 c0             	setns  %al
    ba91:	49 8d 0c 46          	lea    (%r14,%rax,2),%rcx
    ba95:	48 ff c9             	dec    %rcx
    ba98:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    ba9d:	be 00 00 00 80       	mov    $0x80000000,%esi
    baa2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    baa7:	e8 34 23 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    baac:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bab1:	75 21                	jne    bad4 <hyperinterval::float::F32Enclosure::expanded+0xa4>
    bab3:	c6 43 04 03          	movb   $0x3,0x4(%rbx)
    bab7:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    babd:	eb 06                	jmp    bac5 <hyperinterval::float::F32Enclosure::expanded+0x95>
    babf:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
    bac5:	48 89 d8             	mov    %rbx,%rax
    bac8:	48 83 c4 18          	add    $0x18,%rsp
    bacc:	5b                   	pop    %rbx
    bacd:	41 5c                	pop    %r12
    bacf:	41 5e                	pop    %r14
    bad1:	41 5f                	pop    %r15
    bad3:	c3                   	ret
    bad4:	44 89 e1             	mov    %r12d,%ecx
    bad7:	4c 31 f9             	xor    %r15,%rcx
    bada:	4d 85 e4             	test   %r12,%r12
    badd:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
    bae2:	49 0f 44 cc          	cmove  %r12,%rcx
    bae6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    baeb:	be 00 00 00 80       	mov    $0x80000000,%esi
    baf0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    baf5:	e8 e6 22 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    bafa:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    baff:	74 23                	je     bb24 <hyperinterval::float::F32Enclosure::expanded+0xf4>
    bb01:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
    bb06:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bb0b:	be 00 00 00 80       	mov    $0x80000000,%esi
    bb10:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
    bb15:	4c 89 f1             	mov    %r14,%rcx
    bb18:	e8 c3 22 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    bb1d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    bb22:	75 10                	jne    bb34 <hyperinterval::float::F32Enclosure::expanded+0x104>
    bb24:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
    bb29:	88 43 04             	mov    %al,0x4(%rbx)
    bb2c:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    bb32:	eb 91                	jmp    bac5 <hyperinterval::float::F32Enclosure::expanded+0x95>
    bb34:	8b 44 24 10          	mov    0x10(%rsp),%eax
    bb38:	44 89 e1             	mov    %r12d,%ecx
    bb3b:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    bb41:	89 c2                	mov    %eax,%edx
    bb43:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
    bb49:	be 00 00 00 80       	mov    $0x80000000,%esi
    bb4e:	29 ce                	sub    %ecx,%esi
    bb50:	44 09 f9             	or     %r15d,%ecx
    bb53:	45 85 e4             	test   %r12d,%r12d
    bb56:	48 0f 49 f1          	cmovns %rcx,%rsi
    bb5a:	89 d1                	mov    %edx,%ecx
    bb5c:	44 09 f9             	or     %r15d,%ecx
    bb5f:	41 29 d7             	sub    %edx,%r15d
    bb62:	85 c0                	test   %eax,%eax
    bb64:	4c 0f 49 f9          	cmovns %rcx,%r15
    bb68:	44 39 fe             	cmp    %r15d,%esi
    bb6b:	76 0f                	jbe    bb7c <hyperinterval::float::F32Enclosure::expanded+0x14c>
    bb6d:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
    bb71:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
    bb77:	e9 49 ff ff ff       	jmp    bac5 <hyperinterval::float::F32Enclosure::expanded+0x95>
    bb7c:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
    bb82:	44 89 63 04          	mov    %r12d,0x4(%rbx)
    bb86:	89 43 08             	mov    %eax,0x8(%rbx)
    bb89:	e9 37 ff ff ff       	jmp    bac5 <hyperinterval::float::F32Enclosure::expanded+0x95>
    bb8e:	66 90                	xchg   %ax,%ax

hyperinterval::float::F64Enclosure::new:
    bb90:	41 57                	push   %r15
    bb92:	41 56                	push   %r14
    bb94:	41 54                	push   %r12
    bb96:	53                   	push   %rbx
    bb97:	48 83 ec 18          	sub    $0x18,%rsp
    bb9b:	f2 0f 11 4c 24 10    	movsd  %xmm1,0x10(%rsp)
    bba1:	48 89 fb             	mov    %rdi,%rbx
    bba4:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
    bbab:	00 00 80 
    bbae:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
    bbb5:	00 f0 7f 
    bbb8:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    bbbd:	48 89 e7             	mov    %rsp,%rdi
    bbc0:	4c 89 f6             	mov    %r14,%rsi
    bbc3:	4c 89 fa             	mov    %r15,%rdx
    bbc6:	e8 15 22 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    bbcb:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    bbcf:	74 24                	je     bbf5 <hyperinterval::float::F64Enclosure::new+0x65>
    bbd1:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    bbd6:	f3 0f 7e 44 24 10    	movq   0x10(%rsp),%xmm0
    bbdc:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    bbe1:	48 89 e7             	mov    %rsp,%rdi
    bbe4:	4c 89 f6             	mov    %r14,%rsi
    bbe7:	4c 89 fa             	mov    %r15,%rdx
    bbea:	e8 f1 21 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    bbef:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    bbf3:	75 1e                	jne    bc13 <hyperinterval::float::F64Enclosure::new+0x83>
    bbf5:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    bbfa:	88 43 08             	mov    %al,0x8(%rbx)
    bbfd:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    bc04:	48 89 d8             	mov    %rbx,%rax
    bc07:	48 83 c4 18          	add    $0x18,%rsp
    bc0b:	5b                   	pop    %rbx
    bc0c:	41 5c                	pop    %r12
    bc0e:	41 5e                	pop    %r14
    bc10:	41 5f                	pop    %r15
    bc12:	c3                   	ret
    bc13:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    bc18:	4c 89 e1             	mov    %r12,%rcx
    bc1b:	4c 09 f1             	or     %r14,%rcx
    bc1e:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
    bc22:	4c 89 e6             	mov    %r12,%rsi
    bc25:	48 21 d6             	and    %rdx,%rsi
    bc28:	4c 89 f7             	mov    %r14,%rdi
    bc2b:	48 29 f7             	sub    %rsi,%rdi
    bc2e:	4d 85 e4             	test   %r12,%r12
    bc31:	48 0f 49 f9          	cmovns %rcx,%rdi
    bc35:	48 89 c1             	mov    %rax,%rcx
    bc38:	4c 09 f1             	or     %r14,%rcx
    bc3b:	48 21 c2             	and    %rax,%rdx
    bc3e:	49 29 d6             	sub    %rdx,%r14
    bc41:	48 85 c0             	test   %rax,%rax
    bc44:	4c 0f 49 f1          	cmovns %rcx,%r14
    bc48:	4c 39 f7             	cmp    %r14,%rdi
    bc4b:	76 06                	jbe    bc53 <hyperinterval::float::F64Enclosure::new+0xc3>
    bc4d:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
    bc51:	eb aa                	jmp    bbfd <hyperinterval::float::F64Enclosure::new+0x6d>
    bc53:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
    bc5a:	4c 89 63 08          	mov    %r12,0x8(%rbx)
    bc5e:	48 89 43 10          	mov    %rax,0x10(%rbx)
    bc62:	eb a0                	jmp    bc04 <hyperinterval::float::F64Enclosure::new+0x74>
    bc64:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    bc6b:	00 00 00 
    bc6e:	66 90                	xchg   %ax,%ax

hyperinterval::float::F64Enclosure::point:
    bc70:	53                   	push   %rbx
    bc71:	48 83 ec 10          	sub    $0x10,%rsp
    bc75:	48 89 fb             	mov    %rdi,%rbx
    bc78:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    bc7d:	48 89 e7             	mov    %rsp,%rdi
    bc80:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    bc87:	00 00 80 
    bc8a:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
    bc91:	00 f0 7f 
    bc94:	e8 47 21 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    bc99:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    bc9d:	75 0f                	jne    bcae <hyperinterval::float::F64Enclosure::point+0x3e>
    bc9f:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    bca4:	88 43 08             	mov    %al,0x8(%rbx)
    bca7:	b8 02 00 00 00       	mov    $0x2,%eax
    bcac:	eb 12                	jmp    bcc0 <hyperinterval::float::F64Enclosure::point+0x50>
    bcae:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    bcb3:	48 89 43 08          	mov    %rax,0x8(%rbx)
    bcb7:	48 89 43 10          	mov    %rax,0x10(%rbx)
    bcbb:	b8 01 00 00 00       	mov    $0x1,%eax
    bcc0:	48 89 03             	mov    %rax,(%rbx)
    bcc3:	48 89 d8             	mov    %rbx,%rax
    bcc6:	48 83 c4 10          	add    $0x10,%rsp
    bcca:	5b                   	pop    %rbx
    bccb:	c3                   	ret
    bccc:	0f 1f 40 00          	nopl   0x0(%rax)

hyperinterval::float::F64Enclosure::from_bits:
    bcd0:	41 57                	push   %r15
    bcd2:	41 56                	push   %r14
    bcd4:	41 55                	push   %r13
    bcd6:	41 54                	push   %r12
    bcd8:	53                   	push   %rbx
    bcd9:	48 83 ec 10          	sub    $0x10,%rsp
    bcdd:	49 89 d7             	mov    %rdx,%r15
    bce0:	48 89 f1             	mov    %rsi,%rcx
    bce3:	48 89 fb             	mov    %rdi,%rbx
    bce6:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
    bced:	00 00 80 
    bcf0:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
    bcf7:	00 f0 7f 
    bcfa:	48 89 e7             	mov    %rsp,%rdi
    bcfd:	4c 89 f6             	mov    %r14,%rsi
    bd00:	4c 89 e2             	mov    %r12,%rdx
    bd03:	e8 d8 20 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    bd08:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    bd0c:	74 1c                	je     bd2a <hyperinterval::float::F64Enclosure::from_bits+0x5a>
    bd0e:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    bd13:	48 89 e7             	mov    %rsp,%rdi
    bd16:	4c 89 f6             	mov    %r14,%rsi
    bd19:	4c 89 e2             	mov    %r12,%rdx
    bd1c:	4c 89 f9             	mov    %r15,%rcx
    bd1f:	e8 bc 20 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    bd24:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    bd28:	75 1d                	jne    bd47 <hyperinterval::float::F64Enclosure::from_bits+0x77>
    bd2a:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    bd2f:	88 43 08             	mov    %al,0x8(%rbx)
    bd32:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    bd39:	48 83 c4 10          	add    $0x10,%rsp
    bd3d:	5b                   	pop    %rbx
    bd3e:	41 5c                	pop    %r12
    bd40:	41 5d                	pop    %r13
    bd42:	41 5e                	pop    %r14
    bd44:	41 5f                	pop    %r15
    bd46:	c3                   	ret
    bd47:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    bd4c:	4c 89 e9             	mov    %r13,%rcx
    bd4f:	4c 09 f1             	or     %r14,%rcx
    bd52:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
    bd56:	4c 89 ee             	mov    %r13,%rsi
    bd59:	48 21 d6             	and    %rdx,%rsi
    bd5c:	4c 89 f7             	mov    %r14,%rdi
    bd5f:	48 29 f7             	sub    %rsi,%rdi
    bd62:	4d 85 ed             	test   %r13,%r13
    bd65:	48 0f 49 f9          	cmovns %rcx,%rdi
    bd69:	48 89 c1             	mov    %rax,%rcx
    bd6c:	4c 09 f1             	or     %r14,%rcx
    bd6f:	48 21 c2             	and    %rax,%rdx
    bd72:	49 29 d6             	sub    %rdx,%r14
    bd75:	48 85 c0             	test   %rax,%rax
    bd78:	4c 0f 49 f1          	cmovns %rcx,%r14
    bd7c:	4c 39 f7             	cmp    %r14,%rdi
    bd7f:	76 06                	jbe    bd87 <hyperinterval::float::F64Enclosure::from_bits+0xb7>
    bd81:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
    bd85:	eb ab                	jmp    bd32 <hyperinterval::float::F64Enclosure::from_bits+0x62>
    bd87:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
    bd8e:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
    bd92:	48 89 43 10          	mov    %rax,0x10(%rbx)
    bd96:	eb a1                	jmp    bd39 <hyperinterval::float::F64Enclosure::from_bits+0x69>
    bd98:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    bd9f:	00 

hyperinterval::float::F64Enclosure::contains_point:
    bda0:	41 56                	push   %r14
    bda2:	53                   	push   %rbx
    bda3:	48 83 ec 18          	sub    $0x18,%rsp
    bda7:	49 89 fe             	mov    %rdi,%r14
    bdaa:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
    bdb1:	00 00 80 
    bdb4:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    bdb9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    bdbe:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
    bdc5:	00 f0 7f 
    bdc8:	48 89 de             	mov    %rbx,%rsi
    bdcb:	e8 10 20 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    bdd0:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
    bdd5:	3c 01                	cmp    $0x1,%al
    bdd7:	75 0d                	jne    bde6 <hyperinterval::float::F64Enclosure::contains_point+0x46>
    bdd9:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
    bdde:	48 83 c4 18          	add    $0x18,%rsp
    bde2:	5b                   	pop    %rbx
    bde3:	41 5e                	pop    %r14
    bde5:	c3                   	ret
    bde6:	41 f6 06 01          	testb  $0x1,(%r14)
    bdea:	74 44                	je     be30 <hyperinterval::float::F64Enclosure::contains_point+0x90>
    bdec:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
    bdf1:	49 8b 56 08          	mov    0x8(%r14),%rdx
    bdf5:	48 89 d7             	mov    %rdx,%rdi
    bdf8:	48 09 df             	or     %rbx,%rdi
    bdfb:	48 8d 4b ff          	lea    -0x1(%rbx),%rcx
    bdff:	49 89 d0             	mov    %rdx,%r8
    be02:	49 21 c8             	and    %rcx,%r8
    be05:	49 89 d9             	mov    %rbx,%r9
    be08:	4d 29 c1             	sub    %r8,%r9
    be0b:	48 85 d2             	test   %rdx,%rdx
    be0e:	4c 0f 49 cf          	cmovns %rdi,%r9
    be12:	48 89 f7             	mov    %rsi,%rdi
    be15:	48 09 df             	or     %rbx,%rdi
    be18:	49 89 f0             	mov    %rsi,%r8
    be1b:	49 21 c8             	and    %rcx,%r8
    be1e:	48 89 da             	mov    %rbx,%rdx
    be21:	4c 29 c2             	sub    %r8,%rdx
    be24:	48 85 f6             	test   %rsi,%rsi
    be27:	48 0f 49 d7          	cmovns %rdi,%rdx
    be2b:	49 39 d1             	cmp    %rdx,%r9
    be2e:	76 0a                	jbe    be3a <hyperinterval::float::F64Enclosure::contains_point+0x9a>
    be30:	31 d2                	xor    %edx,%edx
    be32:	48 83 c4 18          	add    $0x18,%rsp
    be36:	5b                   	pop    %rbx
    be37:	41 5e                	pop    %r14
    be39:	c3                   	ret
    be3a:	49 8b 76 10          	mov    0x10(%r14),%rsi
    be3e:	48 89 f7             	mov    %rsi,%rdi
    be41:	48 09 df             	or     %rbx,%rdi
    be44:	48 21 f1             	and    %rsi,%rcx
    be47:	48 29 cb             	sub    %rcx,%rbx
    be4a:	48 85 f6             	test   %rsi,%rsi
    be4d:	48 0f 49 df          	cmovns %rdi,%rbx
    be51:	48 39 da             	cmp    %rbx,%rdx
    be54:	0f 96 c2             	setbe  %dl
    be57:	48 83 c4 18          	add    $0x18,%rsp
    be5b:	5b                   	pop    %rbx
    be5c:	41 5e                	pop    %r14
    be5e:	c3                   	ret
    be5f:	90                   	nop

hyperinterval::float::F64Enclosure::subset_of:
    be60:	b0 01                	mov    $0x1,%al
    be62:	f6 07 01             	testb  $0x1,(%rdi)
    be65:	74 54                	je     bebb <hyperinterval::float::F64Enclosure::subset_of+0x5b>
    be67:	f6 06 01             	testb  $0x1,(%rsi)
    be6a:	74 4d                	je     beb9 <hyperinterval::float::F64Enclosure::subset_of+0x59>
    be6c:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    be70:	4c 8b 46 08          	mov    0x8(%rsi),%r8
    be74:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    be7b:	00 00 80 
    be7e:	4d 89 c1             	mov    %r8,%r9
    be81:	49 09 c1             	or     %rax,%r9
    be84:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
    be88:	4d 89 c2             	mov    %r8,%r10
    be8b:	49 21 ca             	and    %rcx,%r10
    be8e:	49 89 c3             	mov    %rax,%r11
    be91:	4d 29 d3             	sub    %r10,%r11
    be94:	4d 85 c0             	test   %r8,%r8
    be97:	4d 0f 49 d9          	cmovns %r9,%r11
    be9b:	49 89 d0             	mov    %rdx,%r8
    be9e:	49 09 c0             	or     %rax,%r8
    bea1:	49 89 d1             	mov    %rdx,%r9
    bea4:	49 21 c9             	and    %rcx,%r9
    bea7:	49 89 c2             	mov    %rax,%r10
    beaa:	4d 29 ca             	sub    %r9,%r10
    bead:	48 85 d2             	test   %rdx,%rdx
    beb0:	4d 0f 49 d0          	cmovns %r8,%r10
    beb4:	4d 39 d3             	cmp    %r10,%r11
    beb7:	76 03                	jbe    bebc <hyperinterval::float::F64Enclosure::subset_of+0x5c>
    beb9:	31 c0                	xor    %eax,%eax
    bebb:	c3                   	ret
    bebc:	48 8b 57 10          	mov    0x10(%rdi),%rdx
    bec0:	48 89 d7             	mov    %rdx,%rdi
    bec3:	48 09 c7             	or     %rax,%rdi
    bec6:	49 89 d0             	mov    %rdx,%r8
    bec9:	49 21 c8             	and    %rcx,%r8
    becc:	49 89 c1             	mov    %rax,%r9
    becf:	4d 29 c1             	sub    %r8,%r9
    bed2:	48 85 d2             	test   %rdx,%rdx
    bed5:	4c 0f 49 cf          	cmovns %rdi,%r9
    bed9:	48 8b 56 10          	mov    0x10(%rsi),%rdx
    bedd:	48 89 d6             	mov    %rdx,%rsi
    bee0:	48 09 c6             	or     %rax,%rsi
    bee3:	48 21 d1             	and    %rdx,%rcx
    bee6:	48 29 c8             	sub    %rcx,%rax
    bee9:	48 85 d2             	test   %rdx,%rdx
    beec:	48 0f 49 c6          	cmovns %rsi,%rax
    bef0:	49 39 c1             	cmp    %rax,%r9
    bef3:	0f 96 c0             	setbe  %al
    bef6:	c3                   	ret
    bef7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    befe:	00 00 

hyperinterval::float::F64Enclosure::interior_subset_of:
    bf00:	b0 01                	mov    $0x1,%al
    bf02:	f6 07 01             	testb  $0x1,(%rdi)
    bf05:	0f 84 93 00 00 00    	je     bf9e <hyperinterval::float::F64Enclosure::interior_subset_of+0x9e>
    bf0b:	f6 06 01             	testb  $0x1,(%rsi)
    bf0e:	0f 84 88 00 00 00    	je     bf9c <hyperinterval::float::F64Enclosure::interior_subset_of+0x9c>
    bf14:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    bf18:	4c 8b 46 08          	mov    0x8(%rsi),%r8
    bf1c:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    bf23:	00 00 80 
    bf26:	4d 89 c1             	mov    %r8,%r9
    bf29:	49 09 c1             	or     %rax,%r9
    bf2c:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
    bf30:	4d 89 c2             	mov    %r8,%r10
    bf33:	49 21 ca             	and    %rcx,%r10
    bf36:	49 89 c3             	mov    %rax,%r11
    bf39:	4d 29 d3             	sub    %r10,%r11
    bf3c:	4d 85 c0             	test   %r8,%r8
    bf3f:	4d 0f 49 d9          	cmovns %r9,%r11
    bf43:	49 89 d0             	mov    %rdx,%r8
    bf46:	49 09 c0             	or     %rax,%r8
    bf49:	49 89 d1             	mov    %rdx,%r9
    bf4c:	49 21 c9             	and    %rcx,%r9
    bf4f:	49 89 c2             	mov    %rax,%r10
    bf52:	4d 29 ca             	sub    %r9,%r10
    bf55:	48 85 d2             	test   %rdx,%rdx
    bf58:	4d 0f 49 d0          	cmovns %r8,%r10
    bf5c:	4d 39 d3             	cmp    %r10,%r11
    bf5f:	73 3b                	jae    bf9c <hyperinterval::float::F64Enclosure::interior_subset_of+0x9c>
    bf61:	48 8b 57 10          	mov    0x10(%rdi),%rdx
    bf65:	48 8b 76 10          	mov    0x10(%rsi),%rsi
    bf69:	48 89 d7             	mov    %rdx,%rdi
    bf6c:	48 09 c7             	or     %rax,%rdi
    bf6f:	49 89 d0             	mov    %rdx,%r8
    bf72:	49 21 c8             	and    %rcx,%r8
    bf75:	49 89 c1             	mov    %rax,%r9
    bf78:	4d 29 c1             	sub    %r8,%r9
    bf7b:	48 85 d2             	test   %rdx,%rdx
    bf7e:	4c 0f 49 cf          	cmovns %rdi,%r9
    bf82:	48 89 f2             	mov    %rsi,%rdx
    bf85:	48 09 c2             	or     %rax,%rdx
    bf88:	48 21 f1             	and    %rsi,%rcx
    bf8b:	48 29 c8             	sub    %rcx,%rax
    bf8e:	48 85 f6             	test   %rsi,%rsi
    bf91:	48 0f 49 c2          	cmovns %rdx,%rax
    bf95:	49 39 c1             	cmp    %rax,%r9
    bf98:	0f 92 c0             	setb   %al
    bf9b:	c3                   	ret
    bf9c:	31 c0                	xor    %eax,%eax
    bf9e:	c3                   	ret
    bf9f:	90                   	nop

hyperinterval::float::F64Enclosure::disjoint:
    bfa0:	48 83 3f 00          	cmpq   $0x0,(%rdi)
    bfa4:	0f 94 c0             	sete   %al
    bfa7:	48 8b 0e             	mov    (%rsi),%rcx
    bfaa:	48 85 c9             	test   %rcx,%rcx
    bfad:	0f 94 c2             	sete   %dl
    bfb0:	08 c2                	or     %al,%dl
    bfb2:	b0 01                	mov    $0x1,%al
    bfb4:	74 01                	je     bfb7 <hyperinterval::float::F64Enclosure::disjoint+0x17>
    bfb6:	c3                   	ret
    bfb7:	f6 c1 01             	test   $0x1,%cl
    bfba:	0f 84 8a 00 00 00    	je     c04a <hyperinterval::float::F64Enclosure::disjoint+0xaa>
    bfc0:	53                   	push   %rbx
    bfc1:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
    bfc8:	00 00 80 
    bfcb:	4c 8b 46 08          	mov    0x8(%rsi),%r8
    bfcf:	4c 8b 4f 10          	mov    0x10(%rdi),%r9
    bfd3:	4d 89 ca             	mov    %r9,%r10
    bfd6:	49 09 ca             	or     %rcx,%r10
    bfd9:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
    bfdd:	4d 89 cb             	mov    %r9,%r11
    bfe0:	49 21 d3             	and    %rdx,%r11
    bfe3:	48 89 cb             	mov    %rcx,%rbx
    bfe6:	4c 29 db             	sub    %r11,%rbx
    bfe9:	4d 85 c9             	test   %r9,%r9
    bfec:	49 0f 49 da          	cmovns %r10,%rbx
    bff0:	4d 89 c1             	mov    %r8,%r9
    bff3:	49 09 c9             	or     %rcx,%r9
    bff6:	4d 89 c2             	mov    %r8,%r10
    bff9:	49 21 d2             	and    %rdx,%r10
    bffc:	49 89 cb             	mov    %rcx,%r11
    bfff:	4d 29 d3             	sub    %r10,%r11
    c002:	4d 85 c0             	test   %r8,%r8
    c005:	4d 0f 49 d9          	cmovns %r9,%r11
    c009:	4c 39 db             	cmp    %r11,%rbx
    c00c:	5b                   	pop    %rbx
    c00d:	72 a7                	jb     bfb6 <hyperinterval::float::F64Enclosure::disjoint+0x16>
    c00f:	48 8b 47 08          	mov    0x8(%rdi),%rax
    c013:	48 8b 76 10          	mov    0x10(%rsi),%rsi
    c017:	48 89 f7             	mov    %rsi,%rdi
    c01a:	48 09 cf             	or     %rcx,%rdi
    c01d:	49 89 f0             	mov    %rsi,%r8
    c020:	49 21 d0             	and    %rdx,%r8
    c023:	49 89 c9             	mov    %rcx,%r9
    c026:	4d 29 c1             	sub    %r8,%r9
    c029:	48 85 f6             	test   %rsi,%rsi
    c02c:	4c 0f 49 cf          	cmovns %rdi,%r9
    c030:	48 89 c6             	mov    %rax,%rsi
    c033:	48 09 ce             	or     %rcx,%rsi
    c036:	48 21 c2             	and    %rax,%rdx
    c039:	48 29 d1             	sub    %rdx,%rcx
    c03c:	48 85 c0             	test   %rax,%rax
    c03f:	48 0f 49 ce          	cmovns %rsi,%rcx
    c043:	49 39 c9             	cmp    %rcx,%r9
    c046:	0f 92 c0             	setb   %al
    c049:	c3                   	ret
    c04a:	31 c0                	xor    %eax,%eax
    c04c:	c3                   	ret
    c04d:	0f 1f 00             	nopl   (%rax)

hyperinterval::float::F64Enclosure::overlaps:
    c050:	48 83 3f 00          	cmpq   $0x0,(%rdi)
    c054:	0f 94 c0             	sete   %al
    c057:	48 8b 0e             	mov    (%rsi),%rcx
    c05a:	48 85 c9             	test   %rcx,%rcx
    c05d:	0f 94 c2             	sete   %dl
    c060:	08 c2                	or     %al,%dl
    c062:	74 03                	je     c067 <hyperinterval::float::F64Enclosure::overlaps+0x17>
    c064:	31 c0                	xor    %eax,%eax
    c066:	c3                   	ret
    c067:	b0 01                	mov    $0x1,%al
    c069:	f6 c1 01             	test   $0x1,%cl
    c06c:	0f 84 8a 00 00 00    	je     c0fc <hyperinterval::float::F64Enclosure::overlaps+0xac>
    c072:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    c079:	00 00 80 
    c07c:	48 8b 56 08          	mov    0x8(%rsi),%rdx
    c080:	4c 8b 47 10          	mov    0x10(%rdi),%r8
    c084:	4d 89 c1             	mov    %r8,%r9
    c087:	49 09 c1             	or     %rax,%r9
    c08a:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
    c08e:	4d 89 c2             	mov    %r8,%r10
    c091:	49 21 ca             	and    %rcx,%r10
    c094:	49 89 c3             	mov    %rax,%r11
    c097:	4d 29 d3             	sub    %r10,%r11
    c09a:	4d 85 c0             	test   %r8,%r8
    c09d:	4d 0f 49 d9          	cmovns %r9,%r11
    c0a1:	49 89 d0             	mov    %rdx,%r8
    c0a4:	49 09 c0             	or     %rax,%r8
    c0a7:	49 89 d1             	mov    %rdx,%r9
    c0aa:	49 21 c9             	and    %rcx,%r9
    c0ad:	49 89 c2             	mov    %rax,%r10
    c0b0:	4d 29 ca             	sub    %r9,%r10
    c0b3:	48 85 d2             	test   %rdx,%rdx
    c0b6:	4d 0f 49 d0          	cmovns %r8,%r10
    c0ba:	4d 39 d3             	cmp    %r10,%r11
    c0bd:	73 03                	jae    c0c2 <hyperinterval::float::F64Enclosure::overlaps+0x72>
    c0bf:	31 c0                	xor    %eax,%eax
    c0c1:	c3                   	ret
    c0c2:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    c0c6:	48 8b 76 10          	mov    0x10(%rsi),%rsi
    c0ca:	48 89 f7             	mov    %rsi,%rdi
    c0cd:	48 09 c7             	or     %rax,%rdi
    c0d0:	49 89 f0             	mov    %rsi,%r8
    c0d3:	49 21 c8             	and    %rcx,%r8
    c0d6:	49 89 c1             	mov    %rax,%r9
    c0d9:	4d 29 c1             	sub    %r8,%r9
    c0dc:	48 85 f6             	test   %rsi,%rsi
    c0df:	4c 0f 49 cf          	cmovns %rdi,%r9
    c0e3:	48 89 d6             	mov    %rdx,%rsi
    c0e6:	48 09 c6             	or     %rax,%rsi
    c0e9:	48 21 d1             	and    %rdx,%rcx
    c0ec:	48 29 c8             	sub    %rcx,%rax
    c0ef:	48 85 d2             	test   %rdx,%rdx
    c0f2:	48 0f 49 c6          	cmovns %rsi,%rax
    c0f6:	49 39 c1             	cmp    %rax,%r9
    c0f9:	0f 93 c0             	setae  %al
    c0fc:	c3                   	ret
    c0fd:	0f 1f 00             	nopl   (%rax)

hyperinterval::float::F64Enclosure::hull:
    c100:	48 89 f8             	mov    %rdi,%rax
    c103:	4c 8b 16             	mov    (%rsi),%r10
    c106:	4c 8b 02             	mov    (%rdx),%r8
    c109:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
    c10d:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
    c111:	41 f6 c2 01          	test   $0x1,%r10b
    c115:	0f 84 98 00 00 00    	je     c1b3 <hyperinterval::float::F64Enclosure::hull+0xb3>
    c11b:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
    c11f:	48 8b 56 10          	mov    0x10(%rsi),%rdx
    c123:	41 f6 c0 01          	test   $0x1,%r8b
    c127:	0f 84 92 00 00 00    	je     c1bf <hyperinterval::float::F64Enclosure::hull+0xbf>
    c12d:	41 56                	push   %r14
    c12f:	53                   	push   %rbx
    c130:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c137:	00 00 80 
    c13a:	4d 89 ca             	mov    %r9,%r10
    c13d:	49 09 f2             	or     %rsi,%r10
    c140:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
    c144:	4d 89 cb             	mov    %r9,%r11
    c147:	4d 21 c3             	and    %r8,%r11
    c14a:	48 89 f3             	mov    %rsi,%rbx
    c14d:	4c 29 db             	sub    %r11,%rbx
    c150:	4d 85 c9             	test   %r9,%r9
    c153:	49 0f 49 da          	cmovns %r10,%rbx
    c157:	49 89 fa             	mov    %rdi,%r10
    c15a:	49 09 f2             	or     %rsi,%r10
    c15d:	49 89 fb             	mov    %rdi,%r11
    c160:	4d 21 c3             	and    %r8,%r11
    c163:	49 89 f6             	mov    %rsi,%r14
    c166:	4d 29 de             	sub    %r11,%r14
    c169:	48 85 ff             	test   %rdi,%rdi
    c16c:	4d 0f 49 f2          	cmovns %r10,%r14
    c170:	4c 39 f3             	cmp    %r14,%rbx
    c173:	49 0f 46 f9          	cmovbe %r9,%rdi
    c177:	49 89 d1             	mov    %rdx,%r9
    c17a:	49 09 f1             	or     %rsi,%r9
    c17d:	49 89 d2             	mov    %rdx,%r10
    c180:	4d 21 c2             	and    %r8,%r10
    c183:	49 89 f3             	mov    %rsi,%r11
    c186:	4d 29 d3             	sub    %r10,%r11
    c189:	48 85 d2             	test   %rdx,%rdx
    c18c:	4d 0f 49 d9          	cmovns %r9,%r11
    c190:	49 89 c9             	mov    %rcx,%r9
    c193:	49 09 f1             	or     %rsi,%r9
    c196:	49 21 c8             	and    %rcx,%r8
    c199:	4c 29 c6             	sub    %r8,%rsi
    c19c:	48 85 c9             	test   %rcx,%rcx
    c19f:	49 0f 49 f1          	cmovns %r9,%rsi
    c1a3:	49 39 f3             	cmp    %rsi,%r11
    c1a6:	48 0f 43 ca          	cmovae %rdx,%rcx
    c1aa:	41 b8 01 00 00 00    	mov    $0x1,%r8d
    c1b0:	5b                   	pop    %rbx
    c1b1:	41 5e                	pop    %r14
    c1b3:	4c 89 00             	mov    %r8,(%rax)
    c1b6:	48 89 78 08          	mov    %rdi,0x8(%rax)
    c1ba:	48 89 48 10          	mov    %rcx,0x10(%rax)
    c1be:	c3                   	ret
    c1bf:	48 89 d1             	mov    %rdx,%rcx
    c1c2:	4c 89 cf             	mov    %r9,%rdi
    c1c5:	4d 89 d0             	mov    %r10,%r8
    c1c8:	4c 89 00             	mov    %r8,(%rax)
    c1cb:	48 89 78 08          	mov    %rdi,0x8(%rax)
    c1cf:	48 89 48 10          	mov    %rcx,0x10(%rax)
    c1d3:	c3                   	ret
    c1d4:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    c1db:	00 00 00 
    c1de:	66 90                	xchg   %ax,%ax

hyperinterval::float::F64Enclosure::intersection:
    c1e0:	48 89 f8             	mov    %rdi,%rax
    c1e3:	f6 06 01             	testb  $0x1,(%rsi)
    c1e6:	0f 84 df 00 00 00    	je     c2cb <hyperinterval::float::F64Enclosure::intersection+0xeb>
    c1ec:	f6 02 01             	testb  $0x1,(%rdx)
    c1ef:	0f 84 d6 00 00 00    	je     c2cb <hyperinterval::float::F64Enclosure::intersection+0xeb>
    c1f5:	41 56                	push   %r14
    c1f7:	53                   	push   %rbx
    c1f8:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
    c1fc:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
    c200:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
    c207:	00 00 80 
    c20a:	49 89 ca             	mov    %rcx,%r10
    c20d:	49 09 fa             	or     %rdi,%r10
    c210:	4c 8d 47 ff          	lea    -0x1(%rdi),%r8
    c214:	49 89 cb             	mov    %rcx,%r11
    c217:	4d 21 c3             	and    %r8,%r11
    c21a:	48 89 fb             	mov    %rdi,%rbx
    c21d:	4c 29 db             	sub    %r11,%rbx
    c220:	48 85 c9             	test   %rcx,%rcx
    c223:	49 0f 49 da          	cmovns %r10,%rbx
    c227:	4d 89 ca             	mov    %r9,%r10
    c22a:	49 09 fa             	or     %rdi,%r10
    c22d:	4d 89 cb             	mov    %r9,%r11
    c230:	4d 21 c3             	and    %r8,%r11
    c233:	49 89 fe             	mov    %rdi,%r14
    c236:	4d 29 de             	sub    %r11,%r14
    c239:	4d 85 c9             	test   %r9,%r9
    c23c:	4d 0f 49 f2          	cmovns %r10,%r14
    c240:	48 8b 76 10          	mov    0x10(%rsi),%rsi
    c244:	4c 39 f3             	cmp    %r14,%rbx
    c247:	49 0f 42 c9          	cmovb  %r9,%rcx
    c24b:	48 8b 52 10          	mov    0x10(%rdx),%rdx
    c24f:	49 89 f1             	mov    %rsi,%r9
    c252:	49 09 f9             	or     %rdi,%r9
    c255:	49 89 f2             	mov    %rsi,%r10
    c258:	4d 21 c2             	and    %r8,%r10
    c25b:	49 89 fb             	mov    %rdi,%r11
    c25e:	4d 29 d3             	sub    %r10,%r11
    c261:	48 85 f6             	test   %rsi,%rsi
    c264:	4d 0f 49 d9          	cmovns %r9,%r11
    c268:	49 89 d1             	mov    %rdx,%r9
    c26b:	49 09 f9             	or     %rdi,%r9
    c26e:	49 89 d2             	mov    %rdx,%r10
    c271:	4d 21 c2             	and    %r8,%r10
    c274:	48 89 fb             	mov    %rdi,%rbx
    c277:	4c 29 d3             	sub    %r10,%rbx
    c27a:	48 85 d2             	test   %rdx,%rdx
    c27d:	49 0f 49 d9          	cmovns %r9,%rbx
    c281:	49 39 db             	cmp    %rbx,%r11
    c284:	48 0f 47 f2          	cmova  %rdx,%rsi
    c288:	48 89 ca             	mov    %rcx,%rdx
    c28b:	48 09 fa             	or     %rdi,%rdx
    c28e:	49 89 c9             	mov    %rcx,%r9
    c291:	4d 21 c1             	and    %r8,%r9
    c294:	49 89 fa             	mov    %rdi,%r10
    c297:	4d 29 ca             	sub    %r9,%r10
    c29a:	48 85 c9             	test   %rcx,%rcx
    c29d:	4c 0f 49 d2          	cmovns %rdx,%r10
    c2a1:	48 89 f2             	mov    %rsi,%rdx
    c2a4:	48 09 fa             	or     %rdi,%rdx
    c2a7:	49 21 f0             	and    %rsi,%r8
    c2aa:	4c 29 c7             	sub    %r8,%rdi
    c2ad:	48 85 f6             	test   %rsi,%rsi
    c2b0:	48 0f 49 fa          	cmovns %rdx,%rdi
    c2b4:	31 d2                	xor    %edx,%edx
    c2b6:	49 39 fa             	cmp    %rdi,%r10
    c2b9:	0f 96 c2             	setbe  %dl
    c2bc:	5b                   	pop    %rbx
    c2bd:	41 5e                	pop    %r14
    c2bf:	48 89 10             	mov    %rdx,(%rax)
    c2c2:	48 89 48 08          	mov    %rcx,0x8(%rax)
    c2c6:	48 89 70 10          	mov    %rsi,0x10(%rax)
    c2ca:	c3                   	ret
    c2cb:	31 d2                	xor    %edx,%edx
    c2cd:	48 89 10             	mov    %rdx,(%rax)
    c2d0:	48 89 48 08          	mov    %rcx,0x8(%rax)
    c2d4:	48 89 70 10          	mov    %rsi,0x10(%rax)
    c2d8:	c3                   	ret
    c2d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

hyperinterval::float::F64Enclosure::signs:
    c2e0:	f6 07 01             	testb  $0x1,(%rdi)
    c2e3:	0f 84 81 00 00 00    	je     c36a <hyperinterval::float::F64Enclosure::signs+0x8a>
    c2e9:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    c2f0:	00 00 80 
    c2f3:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    c2f7:	48 8b 4f 10          	mov    0x10(%rdi),%rcx
    c2fb:	48 89 d6             	mov    %rdx,%rsi
    c2fe:	48 09 c6             	or     %rax,%rsi
    c301:	4c 8d 48 ff          	lea    -0x1(%rax),%r9
    c305:	48 89 d7             	mov    %rdx,%rdi
    c308:	4c 21 cf             	and    %r9,%rdi
    c30b:	49 89 c2             	mov    %rax,%r10
    c30e:	49 29 fa             	sub    %rdi,%r10
    c311:	48 85 d2             	test   %rdx,%rdx
    c314:	4c 0f 49 d6          	cmovns %rsi,%r10
    c318:	45 31 c0             	xor    %r8d,%r8d
    c31b:	4d 85 d2             	test   %r10,%r10
    c31e:	40 0f 99 c6          	setns  %sil
    c322:	48 89 ca             	mov    %rcx,%rdx
    c325:	48 09 c2             	or     %rax,%rdx
    c328:	49 21 c9             	and    %rcx,%r9
    c32b:	48 89 c7             	mov    %rax,%rdi
    c32e:	4c 29 cf             	sub    %r9,%rdi
    c331:	49 39 c2             	cmp    %rax,%r10
    c334:	77 1c                	ja     c352 <hyperinterval::float::F64Enclosure::signs+0x72>
    c336:	44 8d 4e 02          	lea    0x2(%rsi),%r9d
    c33a:	48 85 ff             	test   %rdi,%rdi
    c33d:	41 88 f0             	mov    %sil,%r8b
    c340:	41 0f b6 f1          	movzbl %r9b,%esi
    c344:	44 0f 48 c6          	cmovs  %esi,%r8d
    c348:	48 85 c9             	test   %rcx,%rcx
    c34b:	44 0f 49 c6          	cmovns %esi,%r8d
    c34f:	44 89 c6             	mov    %r8d,%esi
    c352:	48 85 c9             	test   %rcx,%rcx
    c355:	48 0f 48 d7          	cmovs  %rdi,%rdx
    c359:	8d 4e 04             	lea    0x4(%rsi),%ecx
    c35c:	48 39 c2             	cmp    %rax,%rdx
    c35f:	40 0f b6 d6          	movzbl %sil,%edx
    c363:	0f b6 c1             	movzbl %cl,%eax
    c366:	0f 46 c2             	cmovbe %edx,%eax
    c369:	c3                   	ret
    c36a:	31 c0                	xor    %eax,%eax
    c36c:	c3                   	ret
    c36d:	0f 1f 00             	nopl   (%rax)

hyperinterval::float::F64Enclosure::add:
    c370:	48 89 f8             	mov    %rdi,%rax
    c373:	f6 06 01             	testb  $0x1,(%rsi)
    c376:	0f 84 cb 00 00 00    	je     c447 <hyperinterval::float::F64Enclosure::add+0xd7>
    c37c:	f6 02 01             	testb  $0x1,(%rdx)
    c37f:	0f 84 c2 00 00 00    	je     c447 <hyperinterval::float::F64Enclosure::add+0xd7>
    c385:	55                   	push   %rbp
    c386:	41 57                	push   %r15
    c388:	41 56                	push   %r14
    c38a:	41 55                	push   %r13
    c38c:	41 54                	push   %r12
    c38e:	53                   	push   %rbx
    c38f:	48 83 ec 18          	sub    $0x18,%rsp
    c393:	48 89 c5             	mov    %rax,%rbp
    c396:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
    c39a:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
    c39e:	4c 8b 62 10          	mov    0x10(%rdx),%r12
    c3a2:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
    c3a9:	00 00 80 
    c3ac:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
    c3b3:	00 f0 7f 
    c3b6:	4c 8b 42 08          	mov    0x8(%rdx),%r8
    c3ba:	48 89 e7             	mov    %rsp,%rdi
    c3bd:	48 89 de             	mov    %rbx,%rsi
    c3c0:	4c 89 f2             	mov    %r14,%rdx
    c3c3:	e8 68 1d 00 00       	call   e130 <hyperinterval::ieee::Format::add>
    c3c8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    c3cc:	74 57                	je     c425 <hyperinterval::float::F64Enclosure::add+0xb5>
    c3ce:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    c3d3:	48 89 e7             	mov    %rsp,%rdi
    c3d6:	48 89 de             	mov    %rbx,%rsi
    c3d9:	4c 89 f2             	mov    %r14,%rdx
    c3dc:	4c 89 f9             	mov    %r15,%rcx
    c3df:	4d 89 e0             	mov    %r12,%r8
    c3e2:	e8 49 1d 00 00       	call   e130 <hyperinterval::ieee::Format::add>
    c3e7:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    c3eb:	74 38                	je     c425 <hyperinterval::float::F64Enclosure::add+0xb5>
    c3ed:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
    c3f2:	48 89 e7             	mov    %rsp,%rdi
    c3f5:	48 89 de             	mov    %rbx,%rsi
    c3f8:	4c 89 f2             	mov    %r14,%rdx
    c3fb:	4c 89 e9             	mov    %r13,%rcx
    c3fe:	e8 dd 19 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    c403:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    c407:	74 1c                	je     c425 <hyperinterval::float::F64Enclosure::add+0xb5>
    c409:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    c40e:	48 89 e7             	mov    %rsp,%rdi
    c411:	48 89 de             	mov    %rbx,%rsi
    c414:	4c 89 f2             	mov    %r14,%rdx
    c417:	4c 89 f9             	mov    %r15,%rcx
    c41a:	e8 c1 19 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    c41f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    c423:	75 2a                	jne    c44f <hyperinterval::float::F64Enclosure::add+0xdf>
    c425:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
    c42a:	48 89 e8             	mov    %rbp,%rax
    c42d:	88 4d 08             	mov    %cl,0x8(%rbp)
    c430:	48 c7 45 00 02 00 00 	movq   $0x2,0x0(%rbp)
    c437:	00 
    c438:	48 83 c4 18          	add    $0x18,%rsp
    c43c:	5b                   	pop    %rbx
    c43d:	41 5c                	pop    %r12
    c43f:	41 5d                	pop    %r13
    c441:	41 5e                	pop    %r14
    c443:	41 5f                	pop    %r15
    c445:	5d                   	pop    %rbp
    c446:	c3                   	ret
    c447:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
    c44e:	c3                   	ret
    c44f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    c454:	4c 89 e0             	mov    %r12,%rax
    c457:	48 09 d8             	or     %rbx,%rax
    c45a:	48 8d 53 ff          	lea    -0x1(%rbx),%rdx
    c45e:	4c 89 e6             	mov    %r12,%rsi
    c461:	48 21 d6             	and    %rdx,%rsi
    c464:	48 89 df             	mov    %rbx,%rdi
    c467:	48 29 f7             	sub    %rsi,%rdi
    c46a:	4d 85 e4             	test   %r12,%r12
    c46d:	48 0f 49 f8          	cmovns %rax,%rdi
    c471:	48 89 c8             	mov    %rcx,%rax
    c474:	48 09 d8             	or     %rbx,%rax
    c477:	48 21 ca             	and    %rcx,%rdx
    c47a:	48 29 d3             	sub    %rdx,%rbx
    c47d:	48 85 c9             	test   %rcx,%rcx
    c480:	48 0f 49 d8          	cmovns %rax,%rbx
    c484:	48 39 df             	cmp    %rbx,%rdi
    c487:	48 89 e8             	mov    %rbp,%rax
    c48a:	76 0d                	jbe    c499 <hyperinterval::float::F64Enclosure::add+0x129>
    c48c:	c6 40 08 01          	movb   $0x1,0x8(%rax)
    c490:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
    c497:	eb 9f                	jmp    c438 <hyperinterval::float::F64Enclosure::add+0xc8>
    c499:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
    c4a0:	4c 89 60 08          	mov    %r12,0x8(%rax)
    c4a4:	48 89 48 10          	mov    %rcx,0x10(%rax)
    c4a8:	eb 8e                	jmp    c438 <hyperinterval::float::F64Enclosure::add+0xc8>
    c4aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

hyperinterval::float::F64Enclosure::sub:
    c4b0:	53                   	push   %rbx
    c4b1:	48 83 ec 20          	sub    $0x20,%rsp
    c4b5:	48 89 fb             	mov    %rdi,%rbx
    c4b8:	f6 02 01             	testb  $0x1,(%rdx)
    c4bb:	74 30                	je     c4ed <hyperinterval::float::F64Enclosure::sub+0x3d>
    c4bd:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
    c4c1:	48 8b 52 10          	mov    0x10(%rdx),%rdx
    c4c5:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
    c4cc:	00 00 80 
    c4cf:	48 89 d1             	mov    %rdx,%rcx
    c4d2:	48 31 c1             	xor    %rax,%rcx
    c4d5:	48 85 d2             	test   %rdx,%rdx
    c4d8:	48 0f 44 ca          	cmove  %rdx,%rcx
    c4dc:	48 31 f8             	xor    %rdi,%rax
    c4df:	48 85 ff             	test   %rdi,%rdi
    c4e2:	48 0f 44 c7          	cmove  %rdi,%rax
    c4e6:	ba 01 00 00 00       	mov    $0x1,%edx
    c4eb:	eb 02                	jmp    c4ef <hyperinterval::float::F64Enclosure::sub+0x3f>
    c4ed:	31 d2                	xor    %edx,%edx
    c4ef:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    c4f4:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
    c4f9:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    c4fe:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
    c503:	48 89 df             	mov    %rbx,%rdi
    c506:	ff 15 7c 37 05 00    	call   *0x5377c(%rip)        # 5fc88 <_GLOBAL_OFFSET_TABLE_+0x698>
    c50c:	48 89 d8             	mov    %rbx,%rax
    c50f:	48 83 c4 20          	add    $0x20,%rsp
    c513:	5b                   	pop    %rbx
    c514:	c3                   	ret
    c515:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    c51c:	00 00 00 
    c51f:	90                   	nop

hyperinterval::float::F64Enclosure::corner_image:
    c520:	f6 06 01             	testb  $0x1,(%rsi)
    c523:	0f 84 48 04 00 00    	je     c971 <hyperinterval::float::F64Enclosure::corner_image+0x451>
    c529:	f6 02 01             	testb  $0x1,(%rdx)
    c52c:	0f 84 3f 04 00 00    	je     c971 <hyperinterval::float::F64Enclosure::corner_image+0x451>
    c532:	55                   	push   %rbp
    c533:	41 57                	push   %r15
    c535:	41 56                	push   %r14
    c537:	41 55                	push   %r13
    c539:	41 54                	push   %r12
    c53b:	53                   	push   %rbx
    c53c:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
    c543:	48 89 7c 24 78       	mov    %rdi,0x78(%rsp)
    c548:	49 ba 00 00 00 00 00 	movabs $0x8000000000000000,%r10
    c54f:	00 00 80 
    c552:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
    c559:	00 f0 7f 
    c55c:	4c 8b 42 08          	mov    0x8(%rdx),%r8
    c560:	48 8b 42 10          	mov    0x10(%rdx),%rax
    c564:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    c569:	48 8b 5e 08          	mov    0x8(%rsi),%rbx
    c56d:	48 8b 46 10          	mov    0x10(%rsi),%rax
    c571:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
    c576:	84 c9                	test   %cl,%cl
    c578:	0f 84 fb 03 00 00    	je     c979 <hyperinterval::float::F64Enclosure::corner_image+0x459>
    c57e:	48 89 e7             	mov    %rsp,%rdi
    c581:	4c 89 d6             	mov    %r10,%rsi
    c584:	4c 89 f2             	mov    %r14,%rdx
    c587:	48 89 d9             	mov    %rbx,%rcx
    c58a:	4d 89 c5             	mov    %r8,%r13
    c58d:	4d 89 f7             	mov    %r14,%r15
    c590:	e8 2b 22 00 00       	call   e7c0 <hyperinterval::ieee::Format::div>
    c595:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c599:	0f 85 e1 04 00 00    	jne    ca80 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c59f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    c5a4:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
    c5a9:	48 89 e7             	mov    %rsp,%rdi
    c5ac:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c5b3:	00 00 80 
    c5b6:	4c 89 fa             	mov    %r15,%rdx
    c5b9:	e8 22 18 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    c5be:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c5c2:	0f 85 b8 04 00 00    	jne    ca80 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c5c8:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    c5cd:	48 89 e7             	mov    %rsp,%rdi
    c5d0:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c5d7:	00 00 80 
    c5da:	4c 89 fa             	mov    %r15,%rdx
    c5dd:	4c 89 f1             	mov    %r14,%rcx
    c5e0:	e8 fb 17 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    c5e5:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c5e9:	0f 85 91 04 00 00    	jne    ca80 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c5ef:	48 89 e8             	mov    %rbp,%rax
    c5f2:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c5f9:	00 00 80 
    c5fc:	48 09 f0             	or     %rsi,%rax
    c5ff:	48 8d 56 ff          	lea    -0x1(%rsi),%rdx
    c603:	48 89 e9             	mov    %rbp,%rcx
    c606:	48 21 d1             	and    %rdx,%rcx
    c609:	49 89 f7             	mov    %rsi,%r15
    c60c:	49 29 cf             	sub    %rcx,%r15
    c60f:	48 85 ed             	test   %rbp,%rbp
    c612:	4c 0f 49 f8          	cmovns %rax,%r15
    c616:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    c61b:	48 89 f8             	mov    %rdi,%rax
    c61e:	48 09 f0             	or     %rsi,%rax
    c621:	48 89 f9             	mov    %rdi,%rcx
    c624:	48 21 d1             	and    %rdx,%rcx
    c627:	49 89 f4             	mov    %rsi,%r12
    c62a:	49 29 cc             	sub    %rcx,%r12
    c62d:	48 85 ff             	test   %rdi,%rdi
    c630:	4c 0f 49 e0          	cmovns %rax,%r12
    c634:	41 b6 01             	mov    $0x1,%r14b
    c637:	4d 39 e7             	cmp    %r12,%r15
    c63a:	0f 87 46 04 00 00    	ja     ca86 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    c640:	48 89 7c 24 38       	mov    %rdi,0x38(%rsp)
    c645:	48 89 6c 24 28       	mov    %rbp,0x28(%rsp)
    c64a:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
    c64f:	48 89 e7             	mov    %rsp,%rdi
    c652:	48 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%rbp
    c659:	00 f0 7f 
    c65c:	48 89 ea             	mov    %rbp,%rdx
    c65f:	48 89 d9             	mov    %rbx,%rcx
    c662:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
    c667:	e8 54 21 00 00       	call   e7c0 <hyperinterval::ieee::Format::div>
    c66c:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c670:	0f 85 0a 04 00 00    	jne    ca80 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c676:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    c67b:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    c680:	48 89 e7             	mov    %rsp,%rdi
    c683:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c68a:	00 00 80 
    c68d:	48 89 ea             	mov    %rbp,%rdx
    c690:	e8 4b 17 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    c695:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c699:	0f 85 e1 03 00 00    	jne    ca80 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c69f:	48 89 ea             	mov    %rbp,%rdx
    c6a2:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    c6a7:	48 89 e7             	mov    %rsp,%rdi
    c6aa:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c6b1:	00 00 80 
    c6b4:	48 89 d9             	mov    %rbx,%rcx
    c6b7:	e8 24 17 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    c6bc:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c6c0:	0f 85 ba 03 00 00    	jne    ca80 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c6c6:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    c6cb:	48 89 ea             	mov    %rbp,%rdx
    c6ce:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c6d5:	00 00 80 
    c6d8:	48 09 f2             	or     %rsi,%rdx
    c6db:	48 89 ef             	mov    %rbp,%rdi
    c6de:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
    c6e3:	4c 21 cf             	and    %r9,%rdi
    c6e6:	48 89 f1             	mov    %rsi,%rcx
    c6e9:	48 29 f9             	sub    %rdi,%rcx
    c6ec:	48 85 ed             	test   %rbp,%rbp
    c6ef:	48 0f 49 ca          	cmovns %rdx,%rcx
    c6f3:	49 89 c0             	mov    %rax,%r8
    c6f6:	49 09 f0             	or     %rsi,%r8
    c6f9:	48 89 c7             	mov    %rax,%rdi
    c6fc:	4c 21 cf             	and    %r9,%rdi
    c6ff:	48 89 f2             	mov    %rsi,%rdx
    c702:	48 29 fa             	sub    %rdi,%rdx
    c705:	48 85 c0             	test   %rax,%rax
    c708:	49 0f 49 d0          	cmovns %r8,%rdx
    c70c:	48 39 d1             	cmp    %rdx,%rcx
    c70f:	0f 87 71 03 00 00    	ja     ca86 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    c715:	49 39 cf             	cmp    %rcx,%r15
    c718:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    c71d:	48 0f 47 cd          	cmova  %rbp,%rcx
    c721:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
    c726:	49 39 d4             	cmp    %rdx,%r12
    c729:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
    c72e:	48 0f 42 c8          	cmovb  %rax,%rcx
    c732:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
    c737:	48 89 e7             	mov    %rsp,%rdi
    c73a:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
    c741:	00 f0 7f 
    c744:	4c 89 e2             	mov    %r12,%rdx
    c747:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
    c74c:	4d 89 e8             	mov    %r13,%r8
    c74f:	e8 6c 20 00 00       	call   e7c0 <hyperinterval::ieee::Format::div>
    c754:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c758:	0f 85 22 03 00 00    	jne    ca80 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c75e:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    c763:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
    c768:	48 89 e7             	mov    %rsp,%rdi
    c76b:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c772:	00 00 80 
    c775:	4c 89 e2             	mov    %r12,%rdx
    c778:	e8 63 16 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    c77d:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c781:	0f 85 f9 02 00 00    	jne    ca80 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c787:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    c78c:	48 89 e7             	mov    %rsp,%rdi
    c78f:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c796:	00 00 80 
    c799:	4c 89 e2             	mov    %r12,%rdx
    c79c:	4c 89 f9             	mov    %r15,%rcx
    c79f:	e8 3c 16 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    c7a4:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c7a8:	0f 85 d2 02 00 00    	jne    ca80 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c7ae:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
    c7b3:	48 89 d8             	mov    %rbx,%rax
    c7b6:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c7bd:	00 00 80 
    c7c0:	48 09 f0             	or     %rsi,%rax
    c7c3:	48 89 da             	mov    %rbx,%rdx
    c7c6:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
    c7cb:	4c 21 ca             	and    %r9,%rdx
    c7ce:	48 89 f1             	mov    %rsi,%rcx
    c7d1:	48 29 d1             	sub    %rdx,%rcx
    c7d4:	48 85 db             	test   %rbx,%rbx
    c7d7:	48 0f 49 c8          	cmovns %rax,%rcx
    c7db:	4c 89 fa             	mov    %r15,%rdx
    c7de:	48 09 f2             	or     %rsi,%rdx
    c7e1:	4c 89 ff             	mov    %r15,%rdi
    c7e4:	4c 21 cf             	and    %r9,%rdi
    c7e7:	48 89 f0             	mov    %rsi,%rax
    c7ea:	48 29 f8             	sub    %rdi,%rax
    c7ed:	4d 85 ff             	test   %r15,%r15
    c7f0:	48 0f 49 c2          	cmovns %rdx,%rax
    c7f4:	48 39 c1             	cmp    %rax,%rcx
    c7f7:	0f 87 89 02 00 00    	ja     ca86 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    c7fd:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
    c802:	4c 89 d2             	mov    %r10,%rdx
    c805:	48 09 f2             	or     %rsi,%rdx
    c808:	4d 89 d0             	mov    %r10,%r8
    c80b:	4d 21 c8             	and    %r9,%r8
    c80e:	48 89 f7             	mov    %rsi,%rdi
    c811:	4c 29 c7             	sub    %r8,%rdi
    c814:	4d 85 d2             	test   %r10,%r10
    c817:	48 0f 49 fa          	cmovns %rdx,%rdi
    c81b:	48 39 cf             	cmp    %rcx,%rdi
    c81e:	49 0f 46 da          	cmovbe %r10,%rbx
    c822:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
    c827:	4c 89 c1             	mov    %r8,%rcx
    c82a:	48 09 f1             	or     %rsi,%rcx
    c82d:	4c 89 c2             	mov    %r8,%rdx
    c830:	4c 21 ca             	and    %r9,%rdx
    c833:	48 89 f7             	mov    %rsi,%rdi
    c836:	48 29 d7             	sub    %rdx,%rdi
    c839:	4d 85 c0             	test   %r8,%r8
    c83c:	48 0f 49 f9          	cmovns %rcx,%rdi
    c840:	48 39 c7             	cmp    %rax,%rdi
    c843:	4d 0f 43 f8          	cmovae %r8,%r15
    c847:	48 89 e7             	mov    %rsp,%rdi
    c84a:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
    c851:	00 f0 7f 
    c854:	4c 89 e2             	mov    %r12,%rdx
    c857:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
    c85c:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
    c861:	e8 5a 1f 00 00       	call   e7c0 <hyperinterval::ieee::Format::div>
    c866:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c86a:	0f 85 10 02 00 00    	jne    ca80 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c870:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    c875:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
    c87a:	48 89 e7             	mov    %rsp,%rdi
    c87d:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c884:	00 00 80 
    c887:	4c 89 e2             	mov    %r12,%rdx
    c88a:	e8 51 15 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    c88f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c893:	0f 85 e7 01 00 00    	jne    ca80 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c899:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    c89e:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    c8a3:	48 89 e7             	mov    %rsp,%rdi
    c8a6:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    c8ad:	00 00 80 
    c8b0:	4c 89 e2             	mov    %r12,%rdx
    c8b3:	4c 89 e9             	mov    %r13,%rcx
    c8b6:	e8 25 15 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    c8bb:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    c8bf:	0f 85 bb 01 00 00    	jne    ca80 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    c8c5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    c8ca:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
    c8cf:	48 89 f9             	mov    %rdi,%rcx
    c8d2:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
    c8d9:	00 00 80 
    c8dc:	4c 09 c1             	or     %r8,%rcx
    c8df:	48 89 fe             	mov    %rdi,%rsi
    c8e2:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
    c8e7:	4c 21 ce             	and    %r9,%rsi
    c8ea:	4c 89 c2             	mov    %r8,%rdx
    c8ed:	48 29 f2             	sub    %rsi,%rdx
    c8f0:	48 85 ff             	test   %rdi,%rdi
    c8f3:	48 0f 49 d1          	cmovns %rcx,%rdx
    c8f7:	48 89 c6             	mov    %rax,%rsi
    c8fa:	4c 09 c6             	or     %r8,%rsi
    c8fd:	48 89 c7             	mov    %rax,%rdi
    c900:	4c 21 cf             	and    %r9,%rdi
    c903:	4c 89 c1             	mov    %r8,%rcx
    c906:	48 29 f9             	sub    %rdi,%rcx
    c909:	48 85 c0             	test   %rax,%rax
    c90c:	48 0f 49 ce          	cmovns %rsi,%rcx
    c910:	48 39 ca             	cmp    %rcx,%rdx
    c913:	0f 87 6d 01 00 00    	ja     ca86 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    c919:	48 89 de             	mov    %rbx,%rsi
    c91c:	48 bd 00 00 00 00 00 	movabs $0x8000000000000000,%rbp
    c923:	00 00 80 
    c926:	48 09 ee             	or     %rbp,%rsi
    c929:	48 89 df             	mov    %rbx,%rdi
    c92c:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
    c931:	4c 21 cf             	and    %r9,%rdi
    c934:	49 89 e8             	mov    %rbp,%r8
    c937:	49 29 f8             	sub    %rdi,%r8
    c93a:	48 85 db             	test   %rbx,%rbx
    c93d:	4c 0f 49 c6          	cmovns %rsi,%r8
    c941:	49 39 d0             	cmp    %rdx,%r8
    c944:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    c949:	48 0f 46 d3          	cmovbe %rbx,%rdx
    c94d:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
    c952:	4c 89 fa             	mov    %r15,%rdx
    c955:	48 09 ea             	or     %rbp,%rdx
    c958:	4d 21 f9             	and    %r15,%r9
    c95b:	4c 29 cd             	sub    %r9,%rbp
    c95e:	4d 85 ff             	test   %r15,%r15
    c961:	48 0f 49 ea          	cmovns %rdx,%rbp
    c965:	48 39 cd             	cmp    %rcx,%rbp
    c968:	49 0f 43 c7          	cmovae %r15,%rax
    c96c:	e9 d8 05 00 00       	jmp    cf49 <hyperinterval::float::F64Enclosure::corner_image+0xa29>
    c971:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
    c978:	c3                   	ret
    c979:	48 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%rdx
    c980:	ff 0f 00 
    c983:	49 89 dd             	mov    %rbx,%r13
    c986:	49 c1 ed 34          	shr    $0x34,%r13
    c98a:	41 81 e5 ff 07 00 00 	and    $0x7ff,%r13d
    c991:	48 89 d8             	mov    %rbx,%rax
    c994:	48 21 d0             	and    %rdx,%rax
    c997:	4d 85 ed             	test   %r13,%r13
    c99a:	b9 01 00 00 00       	mov    $0x1,%ecx
    c99f:	41 0f 45 cd          	cmovne %r13d,%ecx
    c9a3:	4c 8d 62 01          	lea    0x1(%rdx),%r12
    c9a7:	4d 89 e7             	mov    %r12,%r15
    c9aa:	4d 0f 44 fd          	cmove  %r13,%r15
    c9ae:	49 09 c7             	or     %rax,%r15
    c9b1:	4c 89 c5             	mov    %r8,%rbp
    c9b4:	48 c1 ed 34          	shr    $0x34,%rbp
    c9b8:	81 e5 ff 07 00 00    	and    $0x7ff,%ebp
    c9be:	4c 89 c0             	mov    %r8,%rax
    c9c1:	48 21 d0             	and    %rdx,%rax
    c9c4:	8d 95 9a f7 ff ff    	lea    -0x866(%rbp),%edx
    c9ca:	48 85 ed             	test   %rbp,%rbp
    c9cd:	4c 89 64 24 30       	mov    %r12,0x30(%rsp)
    c9d2:	4c 0f 44 e5          	cmove  %rbp,%r12
    c9d6:	be 9b f7 ff ff       	mov    $0xfffff79b,%esi
    c9db:	0f 45 f2             	cmovne %edx,%esi
    c9de:	49 09 c4             	or     %rax,%r12
    c9e1:	48 89 df             	mov    %rbx,%rdi
    c9e4:	4c 89 44 24 38       	mov    %r8,0x38(%rsp)
    c9e9:	4c 31 c7             	xor    %r8,%rdi
    c9ec:	4c 89 f8             	mov    %r15,%rax
    c9ef:	49 f7 e4             	mul    %r12
    c9f2:	01 ce                	add    %ecx,%esi
    c9f4:	48 c1 ef 3f          	shr    $0x3f,%rdi
    c9f8:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
    c9fd:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    ca02:	48 89 04 24          	mov    %rax,(%rsp)
    ca06:	89 74 24 10          	mov    %esi,0x10(%rsp)
    ca0a:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    ca0f:	48 89 e1             	mov    %rsp,%rcx
    ca12:	4c 89 d6             	mov    %r10,%rsi
    ca15:	4c 89 f2             	mov    %r14,%rdx
    ca18:	e8 03 14 00 00       	call   de20 <hyperinterval::ieee::Format::rounded>
    ca1d:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
    ca22:	74 08                	je     ca2c <hyperinterval::float::F64Enclosure::corner_image+0x50c>
    ca24:	44 0f b6 74 24 41    	movzbl 0x41(%rsp),%r14d
    ca2a:	eb 5a                	jmp    ca86 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    ca2c:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    ca31:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
    ca36:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    ca3b:	48 89 e7             	mov    %rsp,%rdi
    ca3e:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    ca45:	00 00 80 
    ca48:	4c 89 f2             	mov    %r14,%rdx
    ca4b:	e8 90 13 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    ca50:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ca54:	75 2a                	jne    ca80 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    ca56:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    ca5b:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
    ca60:	48 89 e7             	mov    %rsp,%rdi
    ca63:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    ca6a:	00 00 80 
    ca6d:	4c 89 f2             	mov    %r14,%rdx
    ca70:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    ca75:	e8 66 13 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    ca7a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ca7e:	74 28                	je     caa8 <hyperinterval::float::F64Enclosure::corner_image+0x588>
    ca80:	44 0f b6 74 24 01    	movzbl 0x1(%rsp),%r14d
    ca86:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
    ca8b:	44 88 70 08          	mov    %r14b,0x8(%rax)
    ca8f:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
    ca96:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
    ca9d:	5b                   	pop    %rbx
    ca9e:	41 5c                	pop    %r12
    caa0:	41 5d                	pop    %r13
    caa2:	41 5e                	pop    %r14
    caa4:	41 5f                	pop    %r15
    caa6:	5d                   	pop    %rbp
    caa7:	c3                   	ret
    caa8:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
    caad:	48 89 f8             	mov    %rdi,%rax
    cab0:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cab7:	00 00 80 
    caba:	48 09 f0             	or     %rsi,%rax
    cabd:	48 8d 56 ff          	lea    -0x1(%rsi),%rdx
    cac1:	48 89 f9             	mov    %rdi,%rcx
    cac4:	48 21 d1             	and    %rdx,%rcx
    cac7:	49 89 f0             	mov    %rsi,%r8
    caca:	49 29 c8             	sub    %rcx,%r8
    cacd:	48 85 ff             	test   %rdi,%rdi
    cad0:	4c 0f 49 c0          	cmovns %rax,%r8
    cad4:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    cad9:	48 89 f8             	mov    %rdi,%rax
    cadc:	48 09 f0             	or     %rsi,%rax
    cadf:	48 89 f9             	mov    %rdi,%rcx
    cae2:	48 21 d1             	and    %rdx,%rcx
    cae5:	49 89 f1             	mov    %rsi,%r9
    cae8:	49 29 c9             	sub    %rcx,%r9
    caeb:	48 85 ff             	test   %rdi,%rdi
    caee:	4c 0f 49 c8          	cmovns %rax,%r9
    caf2:	41 b6 01             	mov    $0x1,%r14b
    caf5:	4d 39 c8             	cmp    %r9,%r8
    caf8:	77 8c                	ja     ca86 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    cafa:	4c 89 8c 24 88 00 00 	mov    %r9,0x88(%rsp)
    cb01:	00 
    cb02:	4c 89 84 24 90 00 00 	mov    %r8,0x90(%rsp)
    cb09:	00 
    cb0a:	48 89 7c 24 68       	mov    %rdi,0x68(%rsp)
    cb0f:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
    cb14:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    cb19:	48 89 c8             	mov    %rcx,%rax
    cb1c:	48 c1 e8 34          	shr    $0x34,%rax
    cb20:	25 ff 07 00 00       	and    $0x7ff,%eax
    cb25:	48 89 ca             	mov    %rcx,%rdx
    cb28:	48 bf ff ff ff ff ff 	movabs $0xfffffffffffff,%rdi
    cb2f:	ff 0f 00 
    cb32:	48 21 fa             	and    %rdi,%rdx
    cb35:	48 85 c0             	test   %rax,%rax
    cb38:	41 b8 01 00 00 00    	mov    $0x1,%r8d
    cb3e:	44 0f 45 c0          	cmovne %eax,%r8d
    cb42:	48 0f 45 44 24 30    	cmovne 0x30(%rsp),%rax
    cb48:	48 09 d0             	or     %rdx,%rax
    cb4b:	48 31 cb             	xor    %rcx,%rbx
    cb4e:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
    cb55:	00 
    cb56:	49 f7 e7             	mul    %r15
    cb59:	41 8d 8d 9a f7 ff ff 	lea    -0x866(%r13),%ecx
    cb60:	4d 85 ed             	test   %r13,%r13
    cb63:	bf 9b f7 ff ff       	mov    $0xfffff79b,%edi
    cb68:	0f 45 f9             	cmovne %ecx,%edi
    cb6b:	44 89 44 24 74       	mov    %r8d,0x74(%rsp)
    cb70:	44 01 c7             	add    %r8d,%edi
    cb73:	48 c1 eb 3f          	shr    $0x3f,%rbx
    cb77:	88 5c 24 14          	mov    %bl,0x14(%rsp)
    cb7b:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    cb80:	48 89 04 24          	mov    %rax,(%rsp)
    cb84:	89 7c 24 10          	mov    %edi,0x10(%rsp)
    cb88:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    cb8d:	48 89 e1             	mov    %rsp,%rcx
    cb90:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
    cb97:	00 f0 7f 
    cb9a:	4c 89 ea             	mov    %r13,%rdx
    cb9d:	e8 7e 12 00 00       	call   de20 <hyperinterval::ieee::Format::rounded>
    cba2:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
    cba7:	0f 85 77 fe ff ff    	jne    ca24 <hyperinterval::float::F64Enclosure::corner_image+0x504>
    cbad:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    cbb2:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
    cbb7:	48 89 e7             	mov    %rsp,%rdi
    cbba:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cbc1:	00 00 80 
    cbc4:	4c 89 ea             	mov    %r13,%rdx
    cbc7:	e8 14 12 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    cbcc:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    cbd0:	0f 84 aa fe ff ff    	je     ca80 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    cbd6:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    cbdb:	48 89 e7             	mov    %rsp,%rdi
    cbde:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cbe5:	00 00 80 
    cbe8:	4c 89 ea             	mov    %r13,%rdx
    cbeb:	4c 89 f9             	mov    %r15,%rcx
    cbee:	e8 ed 11 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    cbf3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    cbf7:	0f 84 83 fe ff ff    	je     ca80 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    cbfd:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    cc02:	48 89 da             	mov    %rbx,%rdx
    cc05:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cc0c:	00 00 80 
    cc0f:	48 09 f2             	or     %rsi,%rdx
    cc12:	48 89 df             	mov    %rbx,%rdi
    cc15:	4c 8b 4c 24 28       	mov    0x28(%rsp),%r9
    cc1a:	4c 21 cf             	and    %r9,%rdi
    cc1d:	48 89 f1             	mov    %rsi,%rcx
    cc20:	48 29 f9             	sub    %rdi,%rcx
    cc23:	48 85 db             	test   %rbx,%rbx
    cc26:	48 0f 49 ca          	cmovns %rdx,%rcx
    cc2a:	49 89 c0             	mov    %rax,%r8
    cc2d:	49 09 f0             	or     %rsi,%r8
    cc30:	48 89 c7             	mov    %rax,%rdi
    cc33:	4c 21 cf             	and    %r9,%rdi
    cc36:	48 89 f2             	mov    %rsi,%rdx
    cc39:	48 29 fa             	sub    %rdi,%rdx
    cc3c:	48 85 c0             	test   %rax,%rax
    cc3f:	49 0f 49 d0          	cmovns %r8,%rdx
    cc43:	48 39 d1             	cmp    %rdx,%rcx
    cc46:	0f 87 3a fe ff ff    	ja     ca86 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    cc4c:	48 39 8c 24 90 00 00 	cmp    %rcx,0x90(%rsp)
    cc53:	00 
    cc54:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
    cc59:	48 0f 47 cb          	cmova  %rbx,%rcx
    cc5d:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
    cc62:	48 39 94 24 88 00 00 	cmp    %rdx,0x88(%rsp)
    cc69:	00 
    cc6a:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
    cc6f:	48 0f 42 c8          	cmovb  %rax,%rcx
    cc73:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
    cc78:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
    cc7d:	48 89 d0             	mov    %rdx,%rax
    cc80:	48 c1 e8 34          	shr    $0x34,%rax
    cc84:	25 ff 07 00 00       	and    $0x7ff,%eax
    cc89:	48 bf ff ff ff ff ff 	movabs $0xfffffffffffff,%rdi
    cc90:	ff 0f 00 
    cc93:	48 21 d7             	and    %rdx,%rdi
    cc96:	8d 88 9a f7 ff ff    	lea    -0x866(%rax),%ecx
    cc9c:	48 85 c0             	test   %rax,%rax
    cc9f:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
    cca4:	4c 0f 44 c0          	cmove  %rax,%r8
    cca8:	41 bd 9b f7 ff ff    	mov    $0xfffff79b,%r13d
    ccae:	44 0f 45 e9          	cmovne %ecx,%r13d
    ccb2:	49 09 f8             	or     %rdi,%r8
    ccb5:	48 85 ed             	test   %rbp,%rbp
    ccb8:	b9 01 00 00 00       	mov    $0x1,%ecx
    ccbd:	0f 45 cd             	cmovne %ebp,%ecx
    ccc0:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
    ccc5:	48 31 d7             	xor    %rdx,%rdi
    ccc8:	4c 89 e0             	mov    %r12,%rax
    cccb:	4c 89 c5             	mov    %r8,%rbp
    ccce:	49 f7 e0             	mul    %r8
    ccd1:	44 01 e9             	add    %r13d,%ecx
    ccd4:	48 c1 ef 3f          	shr    $0x3f,%rdi
    ccd8:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
    ccdd:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    cce2:	48 89 04 24          	mov    %rax,(%rsp)
    cce6:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
    ccea:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    ccef:	48 89 e1             	mov    %rsp,%rcx
    ccf2:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
    ccf9:	00 f0 7f 
    ccfc:	4c 89 e2             	mov    %r12,%rdx
    ccff:	e8 1c 11 00 00       	call   de20 <hyperinterval::ieee::Format::rounded>
    cd04:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
    cd09:	0f 85 15 fd ff ff    	jne    ca24 <hyperinterval::float::F64Enclosure::corner_image+0x504>
    cd0f:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    cd14:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
    cd19:	48 89 e7             	mov    %rsp,%rdi
    cd1c:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cd23:	00 00 80 
    cd26:	4c 89 e2             	mov    %r12,%rdx
    cd29:	e8 b2 10 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    cd2e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    cd32:	0f 85 48 fd ff ff    	jne    ca80 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    cd38:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    cd3d:	48 89 e7             	mov    %rsp,%rdi
    cd40:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cd47:	00 00 80 
    cd4a:	4c 89 e2             	mov    %r12,%rdx
    cd4d:	4c 89 f9             	mov    %r15,%rcx
    cd50:	e8 8b 10 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    cd55:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    cd59:	0f 85 21 fd ff ff    	jne    ca80 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    cd5f:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    cd64:	48 89 d8             	mov    %rbx,%rax
    cd67:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    cd6e:	00 00 80 
    cd71:	48 09 f0             	or     %rsi,%rax
    cd74:	48 89 da             	mov    %rbx,%rdx
    cd77:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
    cd7c:	4c 21 c2             	and    %r8,%rdx
    cd7f:	48 89 f1             	mov    %rsi,%rcx
    cd82:	48 29 d1             	sub    %rdx,%rcx
    cd85:	48 85 db             	test   %rbx,%rbx
    cd88:	48 0f 49 c8          	cmovns %rax,%rcx
    cd8c:	4c 89 e2             	mov    %r12,%rdx
    cd8f:	48 09 f2             	or     %rsi,%rdx
    cd92:	4c 89 e7             	mov    %r12,%rdi
    cd95:	4c 21 c7             	and    %r8,%rdi
    cd98:	48 89 f0             	mov    %rsi,%rax
    cd9b:	48 29 f8             	sub    %rdi,%rax
    cd9e:	4d 85 e4             	test   %r12,%r12
    cda1:	48 0f 49 c2          	cmovns %rdx,%rax
    cda5:	48 39 c1             	cmp    %rax,%rcx
    cda8:	0f 87 d8 fc ff ff    	ja     ca86 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    cdae:	4c 8b 4c 24 58       	mov    0x58(%rsp),%r9
    cdb3:	4c 89 ca             	mov    %r9,%rdx
    cdb6:	4c 21 c2             	and    %r8,%rdx
    cdb9:	48 89 f7             	mov    %rsi,%rdi
    cdbc:	48 29 d7             	sub    %rdx,%rdi
    cdbf:	4c 89 ca             	mov    %r9,%rdx
    cdc2:	48 09 f2             	or     %rsi,%rdx
    cdc5:	4d 85 c9             	test   %r9,%r9
    cdc8:	48 0f 49 fa          	cmovns %rdx,%rdi
    cdcc:	48 39 cf             	cmp    %rcx,%rdi
    cdcf:	49 0f 46 d9          	cmovbe %r9,%rbx
    cdd3:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
    cdd8:	48 89 f9             	mov    %rdi,%rcx
    cddb:	4c 21 c1             	and    %r8,%rcx
    cdde:	48 89 f2             	mov    %rsi,%rdx
    cde1:	48 29 ca             	sub    %rcx,%rdx
    cde4:	48 89 f9             	mov    %rdi,%rcx
    cde7:	48 09 f1             	or     %rsi,%rcx
    cdea:	48 85 ff             	test   %rdi,%rdi
    cded:	48 0f 49 d1          	cmovns %rcx,%rdx
    cdf1:	48 39 c2             	cmp    %rax,%rdx
    cdf4:	4c 0f 43 e7          	cmovae %rdi,%r12
    cdf8:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
    cdfd:	48 33 44 24 60       	xor    0x60(%rsp),%rax
    ce02:	44 03 6c 24 74       	add    0x74(%rsp),%r13d
    ce07:	48 c1 e8 3f          	shr    $0x3f,%rax
    ce0b:	88 44 24 14          	mov    %al,0x14(%rsp)
    ce0f:	48 8b 84 24 80 00 00 	mov    0x80(%rsp),%rax
    ce16:	00 
    ce17:	48 f7 e5             	mul    %rbp
    ce1a:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    ce1f:	48 89 04 24          	mov    %rax,(%rsp)
    ce23:	44 89 6c 24 10       	mov    %r13d,0x10(%rsp)
    ce28:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    ce2d:	48 89 e1             	mov    %rsp,%rcx
    ce30:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
    ce37:	00 f0 7f 
    ce3a:	4c 89 ea             	mov    %r13,%rdx
    ce3d:	e8 de 0f 00 00       	call   de20 <hyperinterval::ieee::Format::rounded>
    ce42:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
    ce47:	0f 85 d7 fb ff ff    	jne    ca24 <hyperinterval::float::F64Enclosure::corner_image+0x504>
    ce4d:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    ce52:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
    ce57:	48 89 e7             	mov    %rsp,%rdi
    ce5a:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    ce61:	00 00 80 
    ce64:	4c 89 ea             	mov    %r13,%rdx
    ce67:	e8 74 0f 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    ce6c:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ce70:	0f 85 0a fc ff ff    	jne    ca80 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    ce76:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    ce7b:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    ce80:	48 89 e7             	mov    %rsp,%rdi
    ce83:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
    ce8a:	00 00 80 
    ce8d:	4c 89 ea             	mov    %r13,%rdx
    ce90:	4c 89 f9             	mov    %r15,%rcx
    ce93:	e8 48 0f 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    ce98:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    ce9c:	0f 85 de fb ff ff    	jne    ca80 <hyperinterval::float::F64Enclosure::corner_image+0x560>
    cea2:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    cea7:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
    ceac:	48 89 f9             	mov    %rdi,%rcx
    ceaf:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
    ceb6:	00 00 80 
    ceb9:	4c 09 c1             	or     %r8,%rcx
    cebc:	48 89 fe             	mov    %rdi,%rsi
    cebf:	4c 8b 4c 24 28       	mov    0x28(%rsp),%r9
    cec4:	4c 21 ce             	and    %r9,%rsi
    cec7:	4c 89 c2             	mov    %r8,%rdx
    ceca:	48 29 f2             	sub    %rsi,%rdx
    cecd:	48 85 ff             	test   %rdi,%rdi
    ced0:	48 0f 49 d1          	cmovns %rcx,%rdx
    ced4:	48 89 c6             	mov    %rax,%rsi
    ced7:	4c 09 c6             	or     %r8,%rsi
    ceda:	48 89 c7             	mov    %rax,%rdi
    cedd:	4c 21 cf             	and    %r9,%rdi
    cee0:	4c 89 c1             	mov    %r8,%rcx
    cee3:	48 29 f9             	sub    %rdi,%rcx
    cee6:	48 85 c0             	test   %rax,%rax
    cee9:	48 0f 49 ce          	cmovns %rsi,%rcx
    ceed:	48 39 ca             	cmp    %rcx,%rdx
    cef0:	0f 87 90 fb ff ff    	ja     ca86 <hyperinterval::float::F64Enclosure::corner_image+0x566>
    cef6:	48 89 de             	mov    %rbx,%rsi
    cef9:	49 b9 00 00 00 00 00 	movabs $0x8000000000000000,%r9
    cf00:	00 00 80 
    cf03:	4c 09 ce             	or     %r9,%rsi
    cf06:	48 89 df             	mov    %rbx,%rdi
    cf09:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
    cf0e:	4c 21 d7             	and    %r10,%rdi
    cf11:	4d 89 c8             	mov    %r9,%r8
    cf14:	49 29 f8             	sub    %rdi,%r8
    cf17:	48 85 db             	test   %rbx,%rbx
    cf1a:	4c 0f 49 c6          	cmovns %rsi,%r8
    cf1e:	49 39 d0             	cmp    %rdx,%r8
    cf21:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    cf26:	48 0f 46 d3          	cmovbe %rbx,%rdx
    cf2a:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
    cf2f:	4c 89 e2             	mov    %r12,%rdx
    cf32:	4c 09 ca             	or     %r9,%rdx
    cf35:	4d 21 e2             	and    %r12,%r10
    cf38:	4d 29 d1             	sub    %r10,%r9
    cf3b:	4d 85 e4             	test   %r12,%r12
    cf3e:	4c 0f 49 ca          	cmovns %rdx,%r9
    cf42:	49 39 c9             	cmp    %rcx,%r9
    cf45:	49 0f 43 c4          	cmovae %r12,%rax
    cf49:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
    cf4e:	48 c7 01 01 00 00 00 	movq   $0x1,(%rcx)
    cf55:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    cf5a:	48 89 51 08          	mov    %rdx,0x8(%rcx)
    cf5e:	48 89 41 10          	mov    %rax,0x10(%rcx)
    cf62:	e9 2f fb ff ff       	jmp    ca96 <hyperinterval::float::F64Enclosure::corner_image+0x576>
    cf67:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    cf6e:	00 00 

hyperinterval::float::F64Enclosure::div:
    cf70:	53                   	push   %rbx
    cf71:	48 89 fb             	mov    %rdi,%rbx
    cf74:	f6 02 01             	testb  $0x1,(%rdx)
    cf77:	74 56                	je     cfcf <hyperinterval::float::F64Enclosure::div+0x5f>
    cf79:	48 b8 ff ff ff ff ff 	movabs $0x7fffffffffffffff,%rax
    cf80:	ff ff 7f 
    cf83:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
    cf87:	48 8d 78 01          	lea    0x1(%rax),%rdi
    cf8b:	4c 8d 04 01          	lea    (%rcx,%rax,1),%r8
    cf8f:	49 ff c0             	inc    %r8
    cf92:	49 89 c9             	mov    %rcx,%r9
    cf95:	49 21 c1             	and    %rax,%r9
    cf98:	49 f7 d9             	neg    %r9
    cf9b:	49 01 c1             	add    %rax,%r9
    cf9e:	49 ff c1             	inc    %r9
    cfa1:	48 85 c9             	test   %rcx,%rcx
    cfa4:	4d 0f 49 c8          	cmovns %r8,%r9
    cfa8:	49 39 f9             	cmp    %rdi,%r9
    cfab:	77 22                	ja     cfcf <hyperinterval::float::F64Enclosure::div+0x5f>
    cfad:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
    cfb1:	48 89 cf             	mov    %rcx,%rdi
    cfb4:	48 21 c7             	and    %rax,%rdi
    cfb7:	48 01 c7             	add    %rax,%rdi
    cfba:	48 85 f9             	test   %rdi,%rcx
    cfbd:	78 10                	js     cfcf <hyperinterval::float::F64Enclosure::div+0x5f>
    cfbf:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
    cfc3:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    cfca:	48 89 d8             	mov    %rbx,%rax
    cfcd:	5b                   	pop    %rbx
    cfce:	c3                   	ret
    cfcf:	48 89 df             	mov    %rbx,%rdi
    cfd2:	b9 01 00 00 00       	mov    $0x1,%ecx
    cfd7:	e8 44 f5 ff ff       	call   c520 <hyperinterval::float::F64Enclosure::corner_image>
    cfdc:	48 89 d8             	mov    %rbx,%rax
    cfdf:	5b                   	pop    %rbx
    cfe0:	c3                   	ret
    cfe1:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    cfe8:	00 00 00 
    cfeb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

hyperinterval::float::F64Enclosure::reciprocal:
    cff0:	55                   	push   %rbp
    cff1:	41 57                	push   %r15
    cff3:	41 56                	push   %r14
    cff5:	41 55                	push   %r13
    cff7:	41 54                	push   %r12
    cff9:	53                   	push   %rbx
    cffa:	48 83 ec 28          	sub    $0x28,%rsp
    cffe:	48 89 fb             	mov    %rdi,%rbx
    d001:	48 83 3e 00          	cmpq   $0x0,(%rsi)
    d005:	74 65                	je     d06c <hyperinterval::float::F64Enclosure::reciprocal+0x7c>
    d007:	49 89 f6             	mov    %rsi,%r14
    d00a:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
    d011:	00 00 80 
    d014:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
    d01b:	00 f0 7f 
    d01e:	49 bd 00 00 00 00 00 	movabs $0x3ff0000000000000,%r13
    d025:	00 f0 3f 
    d028:	48 89 e7             	mov    %rsp,%rdi
    d02b:	4c 89 fe             	mov    %r15,%rsi
    d02e:	4c 89 e2             	mov    %r12,%rdx
    d031:	4c 89 e9             	mov    %r13,%rcx
    d034:	e8 a7 0d 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    d039:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d03d:	74 1c                	je     d05b <hyperinterval::float::F64Enclosure::reciprocal+0x6b>
    d03f:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    d044:	48 89 e7             	mov    %rsp,%rdi
    d047:	4c 89 fe             	mov    %r15,%rsi
    d04a:	4c 89 e2             	mov    %r12,%rdx
    d04d:	4c 89 e9             	mov    %r13,%rcx
    d050:	e8 8b 0d 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    d055:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d059:	75 2a                	jne    d085 <hyperinterval::float::F64Enclosure::reciprocal+0x95>
    d05b:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
    d060:	88 53 08             	mov    %dl,0x8(%rbx)
    d063:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    d06a:	eb 07                	jmp    d073 <hyperinterval::float::F64Enclosure::reciprocal+0x83>
    d06c:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    d073:	48 89 d8             	mov    %rbx,%rax
    d076:	48 83 c4 28          	add    $0x28,%rsp
    d07a:	5b                   	pop    %rbx
    d07b:	41 5c                	pop    %r12
    d07d:	41 5d                	pop    %r13
    d07f:	41 5e                	pop    %r14
    d081:	41 5f                	pop    %r15
    d083:	5d                   	pop    %rbp
    d084:	c3                   	ret
    d085:	48 89 e9             	mov    %rbp,%rcx
    d088:	4c 09 f9             	or     %r15,%rcx
    d08b:	49 8d 47 ff          	lea    -0x1(%r15),%rax
    d08f:	48 89 ea             	mov    %rbp,%rdx
    d092:	48 21 c2             	and    %rax,%rdx
    d095:	4c 89 fe             	mov    %r15,%rsi
    d098:	48 29 d6             	sub    %rdx,%rsi
    d09b:	48 85 ed             	test   %rbp,%rbp
    d09e:	48 0f 49 f1          	cmovns %rcx,%rsi
    d0a2:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    d0a7:	48 89 ca             	mov    %rcx,%rdx
    d0aa:	4c 09 fa             	or     %r15,%rdx
    d0ad:	48 89 cf             	mov    %rcx,%rdi
    d0b0:	48 21 c7             	and    %rax,%rdi
    d0b3:	4d 89 f8             	mov    %r15,%r8
    d0b6:	49 29 f8             	sub    %rdi,%r8
    d0b9:	48 85 c9             	test   %rcx,%rcx
    d0bc:	4c 0f 49 c2          	cmovns %rdx,%r8
    d0c0:	b2 01                	mov    $0x1,%dl
    d0c2:	4c 39 c6             	cmp    %r8,%rsi
    d0c5:	77 99                	ja     d060 <hyperinterval::float::F64Enclosure::reciprocal+0x70>
    d0c7:	48 89 ea             	mov    %rbp,%rdx
    d0ca:	48 c1 ea 08          	shr    $0x8,%rdx
    d0ce:	48 c7 44 24 10 01 00 	movq   $0x1,0x10(%rsp)
    d0d5:	00 00 
    d0d7:	40 88 6c 24 18       	mov    %bpl,0x18(%rsp)
    d0dc:	48 89 ee             	mov    %rbp,%rsi
    d0df:	48 c1 ee 38          	shr    $0x38,%rsi
    d0e3:	40 88 74 24 1f       	mov    %sil,0x1f(%rsp)
    d0e8:	48 c1 ed 28          	shr    $0x28,%rbp
    d0ec:	66 89 6c 24 1d       	mov    %bp,0x1d(%rsp)
    d0f1:	89 54 24 19          	mov    %edx,0x19(%rsp)
    d0f5:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
    d0fa:	49 8b 4e 08          	mov    0x8(%r14),%rcx
    d0fe:	48 89 ca             	mov    %rcx,%rdx
    d101:	4c 09 fa             	or     %r15,%rdx
    d104:	48 89 ce             	mov    %rcx,%rsi
    d107:	48 21 c6             	and    %rax,%rsi
    d10a:	4c 89 ff             	mov    %r15,%rdi
    d10d:	48 29 f7             	sub    %rsi,%rdi
    d110:	48 85 c9             	test   %rcx,%rcx
    d113:	48 0f 49 fa          	cmovns %rdx,%rdi
    d117:	4c 39 ff             	cmp    %r15,%rdi
    d11a:	77 1b                	ja     d137 <hyperinterval::float::F64Enclosure::reciprocal+0x147>
    d11c:	49 8b 4e 10          	mov    0x10(%r14),%rcx
    d120:	48 21 c8             	and    %rcx,%rax
    d123:	4c 01 f8             	add    %r15,%rax
    d126:	48 ff c8             	dec    %rax
    d129:	48 85 c1             	test   %rax,%rcx
    d12c:	78 09                	js     d137 <hyperinterval::float::F64Enclosure::reciprocal+0x147>
    d12e:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
    d132:	e9 2c ff ff ff       	jmp    d063 <hyperinterval::float::F64Enclosure::reciprocal+0x73>
    d137:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
    d13c:	48 89 df             	mov    %rbx,%rdi
    d13f:	4c 89 f2             	mov    %r14,%rdx
    d142:	b9 01 00 00 00       	mov    $0x1,%ecx
    d147:	e8 d4 f3 ff ff       	call   c520 <hyperinterval::float::F64Enclosure::corner_image>
    d14c:	e9 22 ff ff ff       	jmp    d073 <hyperinterval::float::F64Enclosure::reciprocal+0x83>
    d151:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    d158:	00 00 00 
    d15b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

hyperinterval::float::F64Enclosure::square:
    d160:	55                   	push   %rbp
    d161:	41 57                	push   %r15
    d163:	41 56                	push   %r14
    d165:	41 55                	push   %r13
    d167:	41 54                	push   %r12
    d169:	53                   	push   %rbx
    d16a:	48 83 ec 58          	sub    $0x58,%rsp
    d16e:	48 89 fb             	mov    %rdi,%rbx
    d171:	f6 06 01             	testb  $0x1,(%rsi)
    d174:	0f 84 08 01 00 00    	je     d282 <hyperinterval::float::F64Enclosure::square+0x122>
    d17a:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
    d17e:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
    d185:	00 00 80 
    d188:	49 b8 00 00 00 00 00 	movabs $0x7ff0000000000000,%r8
    d18f:	00 f0 7f 
    d192:	49 be ff ff ff ff ff 	movabs $0xfffffffffffff,%r14
    d199:	ff 0f 00 
    d19c:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
    d1a0:	48 89 c8             	mov    %rcx,%rax
    d1a3:	48 c1 e8 34          	shr    $0x34,%rax
    d1a7:	25 ff 07 00 00       	and    $0x7ff,%eax
    d1ac:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
    d1b1:	4c 21 f1             	and    %r14,%rcx
    d1b4:	49 8d 6e 01          	lea    0x1(%r14),%rbp
    d1b8:	48 85 c0             	test   %rax,%rax
    d1bb:	8d b4 00 9a f7 ff ff 	lea    -0x866(%rax,%rax,1),%esi
    d1c2:	48 0f 45 c5          	cmovne %rbp,%rax
    d1c6:	41 bd 9c f7 ff ff    	mov    $0xfffff79c,%r13d
    d1cc:	41 0f 44 f5          	cmove  %r13d,%esi
    d1d0:	48 09 c8             	or     %rcx,%rax
    d1d3:	48 f7 e0             	mul    %rax
    d1d6:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
    d1db:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    d1e0:	48 89 04 24          	mov    %rax,(%rsp)
    d1e4:	89 74 24 10          	mov    %esi,0x10(%rsp)
    d1e8:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
    d1ed:	48 89 e1             	mov    %rsp,%rcx
    d1f0:	4c 89 e6             	mov    %r12,%rsi
    d1f3:	4c 89 c2             	mov    %r8,%rdx
    d1f6:	e8 25 0c 00 00       	call   de20 <hyperinterval::ieee::Format::rounded>
    d1fb:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
    d200:	75 79                	jne    d27b <hyperinterval::float::F64Enclosure::square+0x11b>
    d202:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
    d207:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    d20c:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
    d211:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    d216:	4c 89 f8             	mov    %r15,%rax
    d219:	48 c1 e8 34          	shr    $0x34,%rax
    d21d:	25 ff 07 00 00       	and    $0x7ff,%eax
    d222:	4c 89 7c 24 48       	mov    %r15,0x48(%rsp)
    d227:	4d 21 fe             	and    %r15,%r14
    d22a:	48 85 c0             	test   %rax,%rax
    d22d:	48 0f 44 e8          	cmove  %rax,%rbp
    d231:	8d 8c 00 9a f7 ff ff 	lea    -0x866(%rax,%rax,1),%ecx
    d238:	41 0f 44 cd          	cmove  %r13d,%ecx
    d23c:	4c 09 f5             	or     %r14,%rbp
    d23f:	48 89 e8             	mov    %rbp,%rax
    d242:	48 f7 e5             	mul    %rbp
    d245:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
    d24a:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    d24f:	48 89 04 24          	mov    %rax,(%rsp)
    d253:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
    d257:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
    d25c:	48 89 e1             	mov    %rsp,%rcx
    d25f:	4c 89 e6             	mov    %r12,%rsi
    d262:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
    d269:	00 f0 7f 
    d26c:	4c 89 fa             	mov    %r15,%rdx
    d26f:	e8 ac 0b 00 00       	call   de20 <hyperinterval::ieee::Format::rounded>
    d274:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
    d279:	75 10                	jne    d28b <hyperinterval::float::F64Enclosure::square+0x12b>
    d27b:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
    d280:	eb 4f                	jmp    d2d1 <hyperinterval::float::F64Enclosure::square+0x171>
    d282:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    d289:	eb 50                	jmp    d2db <hyperinterval::float::F64Enclosure::square+0x17b>
    d28b:	48 8b 6c 24 38       	mov    0x38(%rsp),%rbp
    d290:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
    d295:	48 89 e7             	mov    %rsp,%rdi
    d298:	4c 89 e6             	mov    %r12,%rsi
    d29b:	4c 89 fa             	mov    %r15,%rdx
    d29e:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    d2a3:	e8 38 0b 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    d2a8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d2ac:	74 1e                	je     d2cc <hyperinterval::float::F64Enclosure::square+0x16c>
    d2ae:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    d2b3:	48 89 e7             	mov    %rsp,%rdi
    d2b6:	4c 89 e6             	mov    %r12,%rsi
    d2b9:	4c 89 fa             	mov    %r15,%rdx
    d2bc:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    d2c1:	e8 1a 0b 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    d2c6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d2ca:	75 21                	jne    d2ed <hyperinterval::float::F64Enclosure::square+0x18d>
    d2cc:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    d2d1:	88 43 08             	mov    %al,0x8(%rbx)
    d2d4:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    d2db:	48 89 d8             	mov    %rbx,%rax
    d2de:	48 83 c4 58          	add    $0x58,%rsp
    d2e2:	5b                   	pop    %rbx
    d2e3:	41 5c                	pop    %r12
    d2e5:	41 5d                	pop    %r13
    d2e7:	41 5e                	pop    %r14
    d2e9:	41 5f                	pop    %r15
    d2eb:	5d                   	pop    %rbp
    d2ec:	c3                   	ret
    d2ed:	4c 89 74 24 28       	mov    %r14,0x28(%rsp)
    d2f2:	4c 89 e8             	mov    %r13,%rax
    d2f5:	4c 09 e0             	or     %r12,%rax
    d2f8:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
    d2fd:	4c 89 e9             	mov    %r13,%rcx
    d300:	4c 21 f1             	and    %r14,%rcx
    d303:	4c 89 e2             	mov    %r12,%rdx
    d306:	48 29 ca             	sub    %rcx,%rdx
    d309:	4d 85 ed             	test   %r13,%r13
    d30c:	48 0f 49 d0          	cmovns %rax,%rdx
    d310:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    d315:	48 89 f8             	mov    %rdi,%rax
    d318:	4c 09 e0             	or     %r12,%rax
    d31b:	48 89 f9             	mov    %rdi,%rcx
    d31e:	4c 21 f1             	and    %r14,%rcx
    d321:	4c 89 e6             	mov    %r12,%rsi
    d324:	48 29 ce             	sub    %rcx,%rsi
    d327:	48 85 ff             	test   %rdi,%rdi
    d32a:	48 0f 49 f0          	cmovns %rax,%rsi
    d32e:	b0 01                	mov    $0x1,%al
    d330:	48 39 f2             	cmp    %rsi,%rdx
    d333:	77 9c                	ja     d2d1 <hyperinterval::float::F64Enclosure::square+0x171>
    d335:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
    d33a:	48 89 e7             	mov    %rsp,%rdi
    d33d:	4c 89 e6             	mov    %r12,%rsi
    d340:	4c 89 fa             	mov    %r15,%rdx
    d343:	48 89 e9             	mov    %rbp,%rcx
    d346:	e8 95 0a 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    d34b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d34f:	0f 84 77 ff ff ff    	je     d2cc <hyperinterval::float::F64Enclosure::square+0x16c>
    d355:	4c 89 ed             	mov    %r13,%rbp
    d358:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    d35d:	48 89 e7             	mov    %rsp,%rdi
    d360:	4c 89 e6             	mov    %r12,%rsi
    d363:	4c 89 fa             	mov    %r15,%rdx
    d366:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    d36b:	e8 70 0a 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    d370:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d374:	0f 84 52 ff ff ff    	je     d2cc <hyperinterval::float::F64Enclosure::square+0x16c>
    d37a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    d37f:	4c 89 e8             	mov    %r13,%rax
    d382:	4c 09 e0             	or     %r12,%rax
    d385:	4c 89 ea             	mov    %r13,%rdx
    d388:	4c 21 f2             	and    %r14,%rdx
    d38b:	4c 89 e6             	mov    %r12,%rsi
    d38e:	48 29 d6             	sub    %rdx,%rsi
    d391:	4d 85 ed             	test   %r13,%r13
    d394:	48 0f 49 f0          	cmovns %rax,%rsi
    d398:	48 89 c8             	mov    %rcx,%rax
    d39b:	4c 09 e0             	or     %r12,%rax
    d39e:	49 21 ce             	and    %rcx,%r14
    d3a1:	4d 29 f4             	sub    %r14,%r12
    d3a4:	48 85 c9             	test   %rcx,%rcx
    d3a7:	4c 0f 49 e0          	cmovns %rax,%r12
    d3ab:	b0 01                	mov    $0x1,%al
    d3ad:	4c 39 e6             	cmp    %r12,%rsi
    d3b0:	0f 87 1b ff ff ff    	ja     d2d1 <hyperinterval::float::F64Enclosure::square+0x171>
    d3b6:	48 89 ef             	mov    %rbp,%rdi
    d3b9:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    d3be:	4c 89 ea             	mov    %r13,%rdx
    d3c1:	e8 da 07 00 00       	call   dba0 <hyperinterval::bounds::Bounds<T>::hull>
    d3c6:	49 89 c5             	mov    %rax,%r13
    d3c9:	49 89 d4             	mov    %rdx,%r12
    d3cc:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
    d3d1:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
    d3d6:	31 d2                	xor    %edx,%edx
    d3d8:	e8 73 09 00 00       	call   dd50 <hyperinterval::bounds::Bounds<T>::signs>
    d3dd:	a8 02                	test   $0x2,%al
    d3df:	75 14                	jne    d3f5 <hyperinterval::float::F64Enclosure::square+0x295>
    d3e1:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
    d3e8:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
    d3ec:	4c 89 63 10          	mov    %r12,0x10(%rbx)
    d3f0:	e9 e6 fe ff ff       	jmp    d2db <hyperinterval::float::F64Enclosure::square+0x17b>
    d3f5:	48 89 e7             	mov    %rsp,%rdi
    d3f8:	31 f6                	xor    %esi,%esi
    d3fa:	31 d2                	xor    %edx,%edx
    d3fc:	e8 cf e8 ff ff       	call   bcd0 <hyperinterval::float::F64Enclosure::from_bits>
    d401:	48 8b 0c 24          	mov    (%rsp),%rcx
    d405:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
    d40a:	48 83 f9 02          	cmp    $0x2,%rcx
    d40e:	0f 84 bd fe ff ff    	je     d2d1 <hyperinterval::float::F64Enclosure::square+0x171>
    d414:	f6 c1 01             	test   $0x1,%cl
    d417:	74 c8                	je     d3e1 <hyperinterval::float::F64Enclosure::square+0x281>
    d419:	0f b6 c0             	movzbl %al,%eax
    d41c:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
    d421:	c1 e1 10             	shl    $0x10,%ecx
    d424:	0f b7 74 24 0d       	movzwl 0xd(%rsp),%esi
    d429:	09 ce                	or     %ecx,%esi
    d42b:	48 c1 e6 20          	shl    $0x20,%rsi
    d42f:	8b 54 24 09          	mov    0x9(%rsp),%edx
    d433:	48 09 f2             	or     %rsi,%rdx
    d436:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    d43b:	48 c1 e2 08          	shl    $0x8,%rdx
    d43f:	48 09 c2             	or     %rax,%rdx
    d442:	4c 89 ef             	mov    %r13,%rdi
    d445:	4c 89 e6             	mov    %r12,%rsi
    d448:	e8 53 07 00 00       	call   dba0 <hyperinterval::bounds::Bounds<T>::hull>
    d44d:	49 89 c5             	mov    %rax,%r13
    d450:	49 89 d4             	mov    %rdx,%r12
    d453:	eb 8c                	jmp    d3e1 <hyperinterval::float::F64Enclosure::square+0x281>
    d455:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    d45c:	00 00 00 
    d45f:	90                   	nop

hyperinterval::float::F64Enclosure::checked_pow:
    d460:	55                   	push   %rbp
    d461:	41 57                	push   %r15
    d463:	41 56                	push   %r14
    d465:	41 55                	push   %r13
    d467:	41 54                	push   %r12
    d469:	53                   	push   %rbx
    d46a:	48 83 ec 48          	sub    $0x48,%rsp
    d46e:	48 89 fb             	mov    %rdi,%rbx
    d471:	83 fa 02             	cmp    $0x2,%edx
    d474:	75 0e                	jne    d484 <hyperinterval::float::F64Enclosure::checked_pow+0x24>
    d476:	48 89 df             	mov    %rbx,%rdi
    d479:	ff 15 81 26 05 00    	call   *0x52681(%rip)        # 5fb00 <_GLOBAL_OFFSET_TABLE_+0x510>
    d47f:	e9 e0 00 00 00       	jmp    d564 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
    d484:	f6 06 01             	testb  $0x1,(%rsi)
    d487:	0f 84 d0 00 00 00    	je     d55d <hyperinterval::float::F64Enclosure::checked_pow+0xfd>
    d48d:	89 d5                	mov    %edx,%ebp
    d48f:	4c 8b 76 10          	mov    0x10(%rsi),%r14
    d493:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
    d49a:	00 00 80 
    d49d:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
    d4a4:	00 f0 7f 
    d4a7:	4c 8b 7e 08          	mov    0x8(%rsi),%r15
    d4ab:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    d4b0:	4c 89 e6             	mov    %r12,%rsi
    d4b3:	4c 89 ea             	mov    %r13,%rdx
    d4b6:	4c 89 f9             	mov    %r15,%rcx
    d4b9:	41 89 e8             	mov    %ebp,%r8d
    d4bc:	e8 3f 17 00 00       	call   ec00 <hyperinterval::ieee::Format::power>
    d4c1:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
    d4c6:	0f 85 80 00 00 00    	jne    d54c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
    d4cc:	4c 89 f1             	mov    %r14,%rcx
    d4cf:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
    d4d4:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    d4d9:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    d4de:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    d4e3:	4c 89 e6             	mov    %r12,%rsi
    d4e6:	4c 89 ea             	mov    %r13,%rdx
    d4e9:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
    d4ee:	41 89 e8             	mov    %ebp,%r8d
    d4f1:	e8 0a 17 00 00       	call   ec00 <hyperinterval::ieee::Format::power>
    d4f6:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    d4fb:	74 4f                	je     d54c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
    d4fd:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    d502:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    d507:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    d50c:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
    d511:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    d516:	4c 89 e6             	mov    %r12,%rsi
    d519:	4c 89 ea             	mov    %r13,%rdx
    d51c:	4c 89 f1             	mov    %r14,%rcx
    d51f:	e8 bc 08 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    d524:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    d529:	74 21                	je     d54c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
    d52b:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
    d530:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    d535:	4c 89 e6             	mov    %r12,%rsi
    d538:	4c 89 ea             	mov    %r13,%rdx
    d53b:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    d540:	e8 9b 08 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    d545:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    d54a:	75 2a                	jne    d576 <hyperinterval::float::F64Enclosure::checked_pow+0x116>
    d54c:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
    d551:	88 43 08             	mov    %al,0x8(%rbx)
    d554:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    d55b:	eb 07                	jmp    d564 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
    d55d:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    d564:	48 89 d8             	mov    %rbx,%rax
    d567:	48 83 c4 48          	add    $0x48,%rsp
    d56b:	5b                   	pop    %rbx
    d56c:	41 5c                	pop    %r12
    d56e:	41 5d                	pop    %r13
    d570:	41 5e                	pop    %r14
    d572:	41 5f                	pop    %r15
    d574:	5d                   	pop    %rbp
    d575:	c3                   	ret
    d576:	4c 89 f0             	mov    %r14,%rax
    d579:	4c 09 e0             	or     %r12,%rax
    d57c:	4c 89 f6             	mov    %r14,%rsi
    d57f:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
    d584:	48 89 f1             	mov    %rsi,%rcx
    d587:	4c 21 f1             	and    %r14,%rcx
    d58a:	4c 89 e2             	mov    %r12,%rdx
    d58d:	48 29 ca             	sub    %rcx,%rdx
    d590:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
    d595:	48 85 f6             	test   %rsi,%rsi
    d598:	48 0f 49 d0          	cmovns %rax,%rdx
    d59c:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    d5a1:	48 89 f8             	mov    %rdi,%rax
    d5a4:	4c 09 e0             	or     %r12,%rax
    d5a7:	48 89 f9             	mov    %rdi,%rcx
    d5aa:	4c 21 f1             	and    %r14,%rcx
    d5ad:	4c 89 e6             	mov    %r12,%rsi
    d5b0:	48 29 ce             	sub    %rcx,%rsi
    d5b3:	48 85 ff             	test   %rdi,%rdi
    d5b6:	48 0f 49 f0          	cmovns %rax,%rsi
    d5ba:	b0 01                	mov    $0x1,%al
    d5bc:	48 39 f2             	cmp    %rsi,%rdx
    d5bf:	77 90                	ja     d551 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
    d5c1:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
    d5c6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    d5cb:	4c 89 e6             	mov    %r12,%rsi
    d5ce:	4c 89 ea             	mov    %r13,%rdx
    d5d1:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    d5d6:	e8 05 08 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    d5db:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    d5e0:	0f 84 66 ff ff ff    	je     d54c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
    d5e6:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    d5eb:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    d5f0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    d5f5:	4c 89 e6             	mov    %r12,%rsi
    d5f8:	4c 89 ea             	mov    %r13,%rdx
    d5fb:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
    d600:	e8 db 07 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    d605:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
    d60a:	0f 84 3c ff ff ff    	je     d54c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
    d610:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    d615:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    d61a:	48 89 d0             	mov    %rdx,%rax
    d61d:	4c 09 e0             	or     %r12,%rax
    d620:	48 89 d7             	mov    %rdx,%rdi
    d623:	4c 21 f7             	and    %r14,%rdi
    d626:	4c 89 e6             	mov    %r12,%rsi
    d629:	48 29 fe             	sub    %rdi,%rsi
    d62c:	48 85 d2             	test   %rdx,%rdx
    d62f:	48 0f 49 f0          	cmovns %rax,%rsi
    d633:	48 89 c8             	mov    %rcx,%rax
    d636:	4c 09 e0             	or     %r12,%rax
    d639:	49 21 ce             	and    %rcx,%r14
    d63c:	4d 29 f4             	sub    %r14,%r12
    d63f:	48 85 c9             	test   %rcx,%rcx
    d642:	4c 0f 49 e0          	cmovns %rax,%r12
    d646:	b0 01                	mov    $0x1,%al
    d648:	4c 39 e6             	cmp    %r12,%rsi
    d64b:	0f 87 00 ff ff ff    	ja     d551 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
    d651:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
    d656:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
    d65b:	e8 40 05 00 00       	call   dba0 <hyperinterval::bounds::Bounds<T>::hull>
    d660:	49 89 c5             	mov    %rax,%r13
    d663:	49 89 d4             	mov    %rdx,%r12
    d666:	85 ed                	test   %ebp,%ebp
    d668:	0f 95 c0             	setne  %al
    d66b:	40 f6 c5 01          	test   $0x1,%bpl
    d66f:	0f 94 c1             	sete   %cl
    d672:	84 c8                	test   %cl,%al
    d674:	74 13                	je     d689 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
    d676:	4c 89 ff             	mov    %r15,%rdi
    d679:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
    d67e:	31 d2                	xor    %edx,%edx
    d680:	e8 cb 06 00 00       	call   dd50 <hyperinterval::bounds::Bounds<T>::signs>
    d685:	a8 02                	test   $0x2,%al
    d687:	75 14                	jne    d69d <hyperinterval::float::F64Enclosure::checked_pow+0x23d>
    d689:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
    d690:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
    d694:	4c 89 63 10          	mov    %r12,0x10(%rbx)
    d698:	e9 c7 fe ff ff       	jmp    d564 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
    d69d:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    d6a2:	31 f6                	xor    %esi,%esi
    d6a4:	31 d2                	xor    %edx,%edx
    d6a6:	e8 25 e6 ff ff       	call   bcd0 <hyperinterval::float::F64Enclosure::from_bits>
    d6ab:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    d6b0:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
    d6b5:	48 83 f9 02          	cmp    $0x2,%rcx
    d6b9:	0f 84 92 fe ff ff    	je     d551 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
    d6bf:	f6 c1 01             	test   $0x1,%cl
    d6c2:	74 c5                	je     d689 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
    d6c4:	0f b6 c0             	movzbl %al,%eax
    d6c7:	0f b6 4c 24 17       	movzbl 0x17(%rsp),%ecx
    d6cc:	c1 e1 10             	shl    $0x10,%ecx
    d6cf:	0f b7 74 24 15       	movzwl 0x15(%rsp),%esi
    d6d4:	09 ce                	or     %ecx,%esi
    d6d6:	48 c1 e6 20          	shl    $0x20,%rsi
    d6da:	8b 54 24 11          	mov    0x11(%rsp),%edx
    d6de:	48 09 f2             	or     %rsi,%rdx
    d6e1:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    d6e6:	48 c1 e2 08          	shl    $0x8,%rdx
    d6ea:	48 09 c2             	or     %rax,%rdx
    d6ed:	4c 89 ef             	mov    %r13,%rdi
    d6f0:	4c 89 e6             	mov    %r12,%rsi
    d6f3:	e8 a8 04 00 00       	call   dba0 <hyperinterval::bounds::Bounds<T>::hull>
    d6f8:	49 89 c5             	mov    %rax,%r13
    d6fb:	49 89 d4             	mov    %rdx,%r12
    d6fe:	eb 89                	jmp    d689 <hyperinterval::float::F64Enclosure::checked_pow+0x229>

hyperinterval::float::F64Enclosure::affine:
    d700:	55                   	push   %rbp
    d701:	41 57                	push   %r15
    d703:	41 56                	push   %r14
    d705:	41 55                	push   %r13
    d707:	41 54                	push   %r12
    d709:	53                   	push   %rbx
    d70a:	48 83 ec 28          	sub    $0x28,%rsp
    d70e:	f2 0f 11 4c 24 18    	movsd  %xmm1,0x18(%rsp)
    d714:	49 89 f5             	mov    %rsi,%r13
    d717:	48 89 fb             	mov    %rdi,%rbx
    d71a:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
    d721:	00 00 80 
    d724:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
    d72b:	00 f0 7f 
    d72e:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    d733:	48 89 e7             	mov    %rsp,%rdi
    d736:	4c 89 f6             	mov    %r14,%rsi
    d739:	4c 89 e2             	mov    %r12,%rdx
    d73c:	e8 9f 06 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    d741:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d745:	74 24                	je     d76b <hyperinterval::float::F64Enclosure::affine+0x6b>
    d747:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
    d74c:	f3 0f 7e 44 24 18    	movq   0x18(%rsp),%xmm0
    d752:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    d757:	48 89 e7             	mov    %rsp,%rdi
    d75a:	4c 89 f6             	mov    %r14,%rsi
    d75d:	4c 89 e2             	mov    %r12,%rdx
    d760:	e8 7b 06 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    d765:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d769:	75 21                	jne    d78c <hyperinterval::float::F64Enclosure::affine+0x8c>
    d76b:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    d770:	88 43 08             	mov    %al,0x8(%rbx)
    d773:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    d77a:	48 89 d8             	mov    %rbx,%rax
    d77d:	48 83 c4 28          	add    $0x28,%rsp
    d781:	5b                   	pop    %rbx
    d782:	41 5c                	pop    %r12
    d784:	41 5d                	pop    %r13
    d786:	41 5e                	pop    %r14
    d788:	41 5f                	pop    %r15
    d78a:	5d                   	pop    %rbp
    d78b:	c3                   	ret
    d78c:	41 f6 45 00 01       	testb  $0x1,0x0(%r13)
    d791:	0f 84 59 01 00 00    	je     d8f0 <hyperinterval::float::F64Enclosure::affine+0x1f0>
    d797:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    d79c:	49 8b 45 10          	mov    0x10(%r13),%rax
    d7a0:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    d7a5:	49 8b 4d 08          	mov    0x8(%r13),%rcx
    d7a9:	48 89 e7             	mov    %rsp,%rdi
    d7ac:	4c 89 f6             	mov    %r14,%rsi
    d7af:	4c 89 e2             	mov    %r12,%rdx
    d7b2:	4d 89 f8             	mov    %r15,%r8
    d7b5:	49 89 e9             	mov    %rbp,%r9
    d7b8:	e8 13 0c 00 00       	call   e3d0 <hyperinterval::ieee::Format::affine>
    d7bd:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d7c1:	74 a8                	je     d76b <hyperinterval::float::F64Enclosure::affine+0x6b>
    d7c3:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    d7c8:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    d7cd:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    d7d2:	48 89 e7             	mov    %rsp,%rdi
    d7d5:	4c 89 f6             	mov    %r14,%rsi
    d7d8:	4c 89 e2             	mov    %r12,%rdx
    d7db:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    d7e0:	4d 89 f8             	mov    %r15,%r8
    d7e3:	49 89 e9             	mov    %rbp,%r9
    d7e6:	e8 e5 0b 00 00       	call   e3d0 <hyperinterval::ieee::Format::affine>
    d7eb:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d7ef:	0f 84 76 ff ff ff    	je     d76b <hyperinterval::float::F64Enclosure::affine+0x6b>
    d7f5:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
    d7fa:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
    d7ff:	48 89 e7             	mov    %rsp,%rdi
    d802:	4c 89 f6             	mov    %r14,%rsi
    d805:	4c 89 e2             	mov    %r12,%rdx
    d808:	4c 89 e9             	mov    %r13,%rcx
    d80b:	e8 d0 05 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    d810:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d814:	0f 84 51 ff ff ff    	je     d76b <hyperinterval::float::F64Enclosure::affine+0x6b>
    d81a:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    d81f:	48 89 e7             	mov    %rsp,%rdi
    d822:	4c 89 f6             	mov    %r14,%rsi
    d825:	4c 89 e2             	mov    %r12,%rdx
    d828:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    d82d:	e8 ae 05 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    d832:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d836:	0f 84 2f ff ff ff    	je     d76b <hyperinterval::float::F64Enclosure::affine+0x6b>
    d83c:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    d841:	4c 89 e8             	mov    %r13,%rax
    d844:	4c 09 f0             	or     %r14,%rax
    d847:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
    d84b:	4c 89 ea             	mov    %r13,%rdx
    d84e:	48 21 ca             	and    %rcx,%rdx
    d851:	4c 89 f6             	mov    %r14,%rsi
    d854:	48 29 d6             	sub    %rdx,%rsi
    d857:	4d 85 ed             	test   %r13,%r13
    d85a:	48 0f 49 f0          	cmovns %rax,%rsi
    d85e:	4c 89 e0             	mov    %r12,%rax
    d861:	4c 09 f0             	or     %r14,%rax
    d864:	4c 21 e1             	and    %r12,%rcx
    d867:	49 29 ce             	sub    %rcx,%r14
    d86a:	4d 85 e4             	test   %r12,%r12
    d86d:	4c 0f 49 f0          	cmovns %rax,%r14
    d871:	b0 01                	mov    $0x1,%al
    d873:	4c 39 f6             	cmp    %r14,%rsi
    d876:	0f 87 f4 fe ff ff    	ja     d770 <hyperinterval::float::F64Enclosure::affine+0x70>
    d87c:	48 89 e7             	mov    %rsp,%rdi
    d87f:	4c 89 fe             	mov    %r15,%rsi
    d882:	48 89 ea             	mov    %rbp,%rdx
    d885:	e8 46 e4 ff ff       	call   bcd0 <hyperinterval::float::F64Enclosure::from_bits>
    d88a:	48 8b 0c 24          	mov    (%rsp),%rcx
    d88e:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
    d893:	48 83 f9 02          	cmp    $0x2,%rcx
    d897:	0f 84 d3 fe ff ff    	je     d770 <hyperinterval::float::F64Enclosure::affine+0x70>
    d89d:	f6 c1 01             	test   $0x1,%cl
    d8a0:	74 3a                	je     d8dc <hyperinterval::float::F64Enclosure::affine+0x1dc>
    d8a2:	0f b6 c0             	movzbl %al,%eax
    d8a5:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
    d8aa:	c1 e1 10             	shl    $0x10,%ecx
    d8ad:	0f b7 74 24 0d       	movzwl 0xd(%rsp),%esi
    d8b2:	09 ce                	or     %ecx,%esi
    d8b4:	48 c1 e6 20          	shl    $0x20,%rsi
    d8b8:	8b 54 24 09          	mov    0x9(%rsp),%edx
    d8bc:	48 09 f2             	or     %rsi,%rdx
    d8bf:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    d8c4:	48 c1 e2 08          	shl    $0x8,%rdx
    d8c8:	48 09 c2             	or     %rax,%rdx
    d8cb:	4c 89 ef             	mov    %r13,%rdi
    d8ce:	4c 89 e6             	mov    %r12,%rsi
    d8d1:	e8 ca 02 00 00       	call   dba0 <hyperinterval::bounds::Bounds<T>::hull>
    d8d6:	49 89 c5             	mov    %rax,%r13
    d8d9:	49 89 d4             	mov    %rdx,%r12
    d8dc:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
    d8e3:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
    d8e7:	4c 89 63 10          	mov    %r12,0x10(%rbx)
    d8eb:	e9 8a fe ff ff       	jmp    d77a <hyperinterval::float::F64Enclosure::affine+0x7a>
    d8f0:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    d8f7:	e9 7e fe ff ff       	jmp    d77a <hyperinterval::float::F64Enclosure::affine+0x7a>
    d8fc:	0f 1f 40 00          	nopl   0x0(%rax)

hyperinterval::float::F64Enclosure::next_down:
    d900:	41 57                	push   %r15
    d902:	41 56                	push   %r14
    d904:	53                   	push   %rbx
    d905:	48 83 ec 10          	sub    $0x10,%rsp
    d909:	48 89 fb             	mov    %rdi,%rbx
    d90c:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
    d913:	00 00 80 
    d916:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
    d91d:	00 f0 7f 
    d920:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    d925:	48 89 e7             	mov    %rsp,%rdi
    d928:	4c 89 f6             	mov    %r14,%rsi
    d92b:	4c 89 fa             	mov    %r15,%rdx
    d92e:	e8 ad 04 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    d933:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d937:	75 0c                	jne    d945 <hyperinterval::float::F64Enclosure::next_down+0x45>
    d939:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    d93e:	88 43 01             	mov    %al,0x1(%rbx)
    d941:	b0 01                	mov    $0x1,%al
    d943:	eb 51                	jmp    d996 <hyperinterval::float::F64Enclosure::next_down+0x96>
    d945:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    d94a:	48 89 c2             	mov    %rax,%rdx
    d94d:	4c 31 f2             	xor    %r14,%rdx
    d950:	48 85 c0             	test   %rax,%rax
    d953:	48 0f 44 d0          	cmove  %rax,%rdx
    d957:	48 89 d1             	mov    %rdx,%rcx
    d95a:	48 c1 f9 3f          	sar    $0x3f,%rcx
    d95e:	48 83 c9 01          	or     $0x1,%rcx
    d962:	48 01 d1             	add    %rdx,%rcx
    d965:	48 89 e7             	mov    %rsp,%rdi
    d968:	4c 89 f6             	mov    %r14,%rsi
    d96b:	4c 89 fa             	mov    %r15,%rdx
    d96e:	e8 6d 04 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    d973:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d977:	75 08                	jne    d981 <hyperinterval::float::F64Enclosure::next_down+0x81>
    d979:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
    d97d:	b0 01                	mov    $0x1,%al
    d97f:	eb 15                	jmp    d996 <hyperinterval::float::F64Enclosure::next_down+0x96>
    d981:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    d986:	49 31 c6             	xor    %rax,%r14
    d989:	48 85 c0             	test   %rax,%rax
    d98c:	4c 0f 44 f0          	cmove  %rax,%r14
    d990:	4c 89 73 08          	mov    %r14,0x8(%rbx)
    d994:	31 c0                	xor    %eax,%eax
    d996:	88 03                	mov    %al,(%rbx)
    d998:	48 89 d8             	mov    %rbx,%rax
    d99b:	48 83 c4 10          	add    $0x10,%rsp
    d99f:	5b                   	pop    %rbx
    d9a0:	41 5e                	pop    %r14
    d9a2:	41 5f                	pop    %r15
    d9a4:	c3                   	ret
    d9a5:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    d9ac:	00 00 00 
    d9af:	90                   	nop

hyperinterval::float::F64Enclosure::next_up:
    d9b0:	41 57                	push   %r15
    d9b2:	41 56                	push   %r14
    d9b4:	53                   	push   %rbx
    d9b5:	48 83 ec 10          	sub    $0x10,%rsp
    d9b9:	48 89 fb             	mov    %rdi,%rbx
    d9bc:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
    d9c3:	00 00 80 
    d9c6:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
    d9cd:	00 f0 7f 
    d9d0:	66 48 0f 7e c1       	movq   %xmm0,%rcx
    d9d5:	48 89 e7             	mov    %rsp,%rdi
    d9d8:	4c 89 f6             	mov    %r14,%rsi
    d9db:	4c 89 fa             	mov    %r15,%rdx
    d9de:	e8 fd 03 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    d9e3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    d9e7:	75 0c                	jne    d9f5 <hyperinterval::float::F64Enclosure::next_up+0x45>
    d9e9:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    d9ee:	88 43 01             	mov    %al,0x1(%rbx)
    d9f1:	b0 01                	mov    $0x1,%al
    d9f3:	eb 3c                	jmp    da31 <hyperinterval::float::F64Enclosure::next_up+0x81>
    d9f5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    d9fa:	48 89 c1             	mov    %rax,%rcx
    d9fd:	48 c1 f9 3f          	sar    $0x3f,%rcx
    da01:	48 83 c9 01          	or     $0x1,%rcx
    da05:	48 01 c1             	add    %rax,%rcx
    da08:	48 89 e7             	mov    %rsp,%rdi
    da0b:	4c 89 f6             	mov    %r14,%rsi
    da0e:	4c 89 fa             	mov    %r15,%rdx
    da11:	e8 ca 03 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    da16:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    da1a:	75 08                	jne    da24 <hyperinterval::float::F64Enclosure::next_up+0x74>
    da1c:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
    da20:	b0 01                	mov    $0x1,%al
    da22:	eb 0d                	jmp    da31 <hyperinterval::float::F64Enclosure::next_up+0x81>
    da24:	f3 0f 7e 44 24 08    	movq   0x8(%rsp),%xmm0
    da2a:	66 0f d6 43 08       	movq   %xmm0,0x8(%rbx)
    da2f:	31 c0                	xor    %eax,%eax
    da31:	88 03                	mov    %al,(%rbx)
    da33:	48 89 d8             	mov    %rbx,%rax
    da36:	48 83 c4 10          	add    $0x10,%rsp
    da3a:	5b                   	pop    %rbx
    da3b:	41 5e                	pop    %r14
    da3d:	41 5f                	pop    %r15
    da3f:	c3                   	ret

hyperinterval::float::F64Enclosure::expanded:
    da40:	41 57                	push   %r15
    da42:	41 56                	push   %r14
    da44:	41 55                	push   %r13
    da46:	41 54                	push   %r12
    da48:	53                   	push   %rbx
    da49:	48 83 ec 10          	sub    $0x10,%rsp
    da4d:	48 89 fb             	mov    %rdi,%rbx
    da50:	f6 06 01             	testb  $0x1,(%rsi)
    da53:	74 7f                	je     dad4 <hyperinterval::float::F64Enclosure::expanded+0x94>
    da55:	4c 8b 66 10          	mov    0x10(%rsi),%r12
    da59:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
    da60:	00 00 80 
    da63:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
    da6a:	00 f0 7f 
    da6d:	48 8b 46 08          	mov    0x8(%rsi),%rax
    da71:	48 89 c2             	mov    %rax,%rdx
    da74:	4c 31 f2             	xor    %r14,%rdx
    da77:	48 85 c0             	test   %rax,%rax
    da7a:	48 0f 44 d0          	cmove  %rax,%rdx
    da7e:	48 89 d1             	mov    %rdx,%rcx
    da81:	48 c1 f9 3f          	sar    $0x3f,%rcx
    da85:	48 83 c9 01          	or     $0x1,%rcx
    da89:	48 01 d1             	add    %rdx,%rcx
    da8c:	48 89 e7             	mov    %rsp,%rdi
    da8f:	4c 89 f6             	mov    %r14,%rsi
    da92:	4c 89 fa             	mov    %r15,%rdx
    da95:	e8 46 03 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    da9a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
    da9e:	75 27                	jne    dac7 <hyperinterval::float::F64Enclosure::expanded+0x87>
    daa0:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    daa5:	4c 89 e1             	mov    %r12,%rcx
    daa8:	48 c1 f9 3f          	sar    $0x3f,%rcx
    daac:	48 83 c9 01          	or     $0x1,%rcx
    dab0:	4c 01 e1             	add    %r12,%rcx
    dab3:	48 89 e7             	mov    %rsp,%rdi
    dab6:	4c 89 f6             	mov    %r14,%rsi
    dab9:	4c 89 fa             	mov    %r15,%rdx
    dabc:	e8 1f 03 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    dac1:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    dac5:	75 25                	jne    daec <hyperinterval::float::F64Enclosure::expanded+0xac>
    dac7:	c6 43 08 03          	movb   $0x3,0x8(%rbx)
    dacb:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    dad2:	eb 07                	jmp    dadb <hyperinterval::float::F64Enclosure::expanded+0x9b>
    dad4:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    dadb:	48 89 d8             	mov    %rbx,%rax
    dade:	48 83 c4 10          	add    $0x10,%rsp
    dae2:	5b                   	pop    %rbx
    dae3:	41 5c                	pop    %r12
    dae5:	41 5d                	pop    %r13
    dae7:	41 5e                	pop    %r14
    dae9:	41 5f                	pop    %r15
    daeb:	c3                   	ret
    daec:	4c 89 e9             	mov    %r13,%rcx
    daef:	4c 31 f1             	xor    %r14,%rcx
    daf2:	4d 85 ed             	test   %r13,%r13
    daf5:	49 0f 44 cd          	cmove  %r13,%rcx
    daf9:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    dafe:	48 89 e7             	mov    %rsp,%rdi
    db01:	4c 89 f6             	mov    %r14,%rsi
    db04:	4c 89 fa             	mov    %r15,%rdx
    db07:	e8 d4 02 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    db0c:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    db10:	74 1c                	je     db2e <hyperinterval::float::F64Enclosure::expanded+0xee>
    db12:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    db17:	48 89 e7             	mov    %rsp,%rdi
    db1a:	4c 89 f6             	mov    %r14,%rsi
    db1d:	4c 89 fa             	mov    %r15,%rdx
    db20:	4c 89 e1             	mov    %r12,%rcx
    db23:	e8 b8 02 00 00       	call   dde0 <hyperinterval::ieee::Format::finite>
    db28:	80 3c 24 01          	cmpb   $0x1,(%rsp)
    db2c:	75 11                	jne    db3f <hyperinterval::float::F64Enclosure::expanded+0xff>
    db2e:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    db33:	88 43 08             	mov    %al,0x8(%rbx)
    db36:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    db3d:	eb 9c                	jmp    dadb <hyperinterval::float::F64Enclosure::expanded+0x9b>
    db3f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    db44:	4c 89 e9             	mov    %r13,%rcx
    db47:	4c 09 f1             	or     %r14,%rcx
    db4a:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
    db4e:	4c 89 ee             	mov    %r13,%rsi
    db51:	48 21 d6             	and    %rdx,%rsi
    db54:	4c 89 f7             	mov    %r14,%rdi
    db57:	48 29 f7             	sub    %rsi,%rdi
    db5a:	4d 85 ed             	test   %r13,%r13
    db5d:	48 0f 49 f9          	cmovns %rcx,%rdi
    db61:	48 89 c1             	mov    %rax,%rcx
    db64:	4c 09 f1             	or     %r14,%rcx
    db67:	48 21 c2             	and    %rax,%rdx
    db6a:	49 29 d6             	sub    %rdx,%r14
    db6d:	48 85 c0             	test   %rax,%rax
    db70:	4c 0f 49 f1          	cmovns %rcx,%r14
    db74:	4c 39 f7             	cmp    %r14,%rdi
    db77:	76 10                	jbe    db89 <hyperinterval::float::F64Enclosure::expanded+0x149>
    db79:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
    db7d:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
    db84:	e9 52 ff ff ff       	jmp    dadb <hyperinterval::float::F64Enclosure::expanded+0x9b>
    db89:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
    db90:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
    db94:	48 89 43 10          	mov    %rax,0x10(%rbx)
    db98:	e9 3e ff ff ff       	jmp    dadb <hyperinterval::float::F64Enclosure::expanded+0x9b>
    db9d:	0f 1f 00             	nopl   (%rax)

hyperinterval::ieee::Format::finite:
    dde0:	48 89 f8             	mov    %rdi,%rax
    dde3:	48 89 cf             	mov    %rcx,%rdi
    dde6:	48 f7 d7             	not    %rdi
    dde9:	48 85 fa             	test   %rdi,%rdx
    ddec:	75 09                	jne    ddf7 <hyperinterval::ieee::Format::finite+0x17>
    ddee:	c6 40 01 00          	movb   $0x0,0x1(%rax)
    ddf2:	b1 01                	mov    $0x1,%cl
    ddf4:	88 08                	mov    %cl,(%rax)
    ddf6:	c3                   	ret
    ddf7:	48 ff ce             	dec    %rsi
    ddfa:	48 85 f1             	test   %rsi,%rcx
    ddfd:	74 09                	je     de08 <hyperinterval::ieee::Format::finite+0x28>
    ddff:	48 89 48 08          	mov    %rcx,0x8(%rax)
    de03:	31 c9                	xor    %ecx,%ecx
    de05:	88 08                	mov    %cl,(%rax)
    de07:	c3                   	ret
    de08:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
    de0f:	00 
    de10:	31 c9                	xor    %ecx,%ecx
    de12:	88 08                	mov    %cl,(%rax)
    de14:	c3                   	ret
    de15:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    de1c:	00 00 00 
    de1f:	90                   	nop

hyperinterval::ieee::Format::rounded:
    de20:	48 89 c8             	mov    %rcx,%rax
    de23:	4c 8b 11             	mov    (%rcx),%r10
    de26:	4c 8b 59 08          	mov    0x8(%rcx),%r11
    de2a:	4c 89 d1             	mov    %r10,%rcx
    de2d:	4c 09 d9             	or     %r11,%rcx
    de30:	74 79                	je     deab <hyperinterval::ieee::Format::rounded+0x8b>
    de32:	55                   	push   %rbp
    de33:	41 57                	push   %r15
    de35:	41 56                	push   %r14
    de37:	41 55                	push   %r13
    de39:	41 54                	push   %r12
    de3b:	53                   	push   %rbx
    de3c:	8b 68 10             	mov    0x10(%rax),%ebp
    de3f:	49 0f bd cb          	bsr    %r11,%rcx
    de43:	83 f1 3f             	xor    $0x3f,%ecx
    de46:	4d 0f bd f2          	bsr    %r10,%r14
    de4a:	41 83 f6 3f          	xor    $0x3f,%r14d
    de4e:	41 83 ce 40          	or     $0x40,%r14d
    de52:	4d 85 db             	test   %r11,%r11
    de55:	44 0f 45 f1          	cmovne %ecx,%r14d
    de59:	bb 40 00 00 00       	mov    $0x40,%ebx
    de5e:	f3 48 0f bc da       	tzcnt  %rdx,%rbx
    de63:	41 89 d8             	mov    %ebx,%r8d
    de66:	41 83 e0 3f          	and    $0x3f,%r8d
    de6a:	44 89 c1             	mov    %r8d,%ecx
    de6d:	48 d3 ea             	shr    %cl,%rdx
    de70:	41 83 f6 7f          	xor    $0x7f,%r14d
    de74:	41 01 ee             	add    %ebp,%r14d
    de77:	48 d1 ea             	shr    $1,%rdx
    de7a:	41 39 d6             	cmp    %edx,%r14d
    de7d:	0f 8f 54 01 00 00    	jg     dfd7 <hyperinterval::ieee::Format::rounded+0x1b7>
    de83:	44 8d 2c 13          	lea    (%rbx,%rdx,1),%r13d
    de87:	b9 01 00 00 00       	mov    $0x1,%ecx
    de8c:	44 29 e9             	sub    %r13d,%ecx
    de8f:	41 29 de             	sub    %ebx,%r14d
    de92:	41 39 ce             	cmp    %ecx,%r14d
    de95:	44 0f 4e f1          	cmovle %ecx,%r14d
    de99:	44 89 f1             	mov    %r14d,%ecx
    de9c:	29 e9                	sub    %ebp,%ecx
    de9e:	83 f9 7f             	cmp    $0x7f,%ecx
    dea1:	7e 13                	jle    deb6 <hyperinterval::ieee::Format::rounded+0x96>
    dea3:	41 b4 01             	mov    $0x1,%r12b
    dea6:	e9 ea 00 00 00       	jmp    df95 <hyperinterval::ieee::Format::rounded+0x175>
    deab:	c6 07 00             	movb   $0x0,(%rdi)
    deae:	0f 57 c0             	xorps  %xmm0,%xmm0
    deb1:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
    deb5:	c3                   	ret
    deb6:	85 c9                	test   %ecx,%ecx
    deb8:	4c 89 6c 24 f0       	mov    %r13,-0x10(%rsp)
    debd:	0f 8e ad 00 00 00    	jle    df70 <hyperinterval::ieee::Format::rounded+0x150>
    dec3:	4d 89 d7             	mov    %r10,%r15
    dec6:	4d 0f ad df          	shrd   %cl,%r11,%r15
    deca:	4d 89 dd             	mov    %r11,%r13
    decd:	49 d3 ed             	shr    %cl,%r13
    ded0:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
    ded7:	49 d3 e4             	shl    %cl,%r12
    deda:	48 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%rbp
    dee1:	45 31 c9             	xor    %r9d,%r9d
    dee4:	f6 c1 40             	test   $0x40,%cl
    dee7:	4d 0f 45 fd          	cmovne %r13,%r15
    deeb:	4d 0f 45 e9          	cmovne %r9,%r13
    deef:	49 0f 45 ec          	cmovne %r12,%rbp
    def3:	4d 0f 45 e1          	cmovne %r9,%r12
    def7:	49 f7 d4             	not    %r12
    defa:	48 f7 d5             	not    %rbp
    defd:	4c 21 dd             	and    %r11,%rbp
    df00:	4d 21 d4             	and    %r10,%r12
    df03:	49 09 ec             	or     %rbp,%r12
    df06:	41 0f 95 c4          	setne  %r12b
    df0a:	4d 89 eb             	mov    %r13,%r11
    df0d:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
    df12:	4c 89 f9             	mov    %r15,%rcx
    df15:	4c 09 d9             	or     %r11,%rcx
    df18:	74 7b                	je     df95 <hyperinterval::ieee::Format::rounded+0x175>
    df1a:	49 0f bd cb          	bsr    %r11,%rcx
    df1e:	83 f1 3f             	xor    $0x3f,%ecx
    df21:	4d 0f bd ef          	bsr    %r15,%r13
    df25:	41 83 f5 3f          	xor    $0x3f,%r13d
    df29:	41 83 cd 40          	or     $0x40,%r13d
    df2d:	4d 85 db             	test   %r11,%r11
    df30:	44 0f 45 e9          	cmovne %ecx,%r13d
    df34:	41 83 f5 7f          	xor    $0x7f,%r13d
    df38:	43 8d 2c 2e          	lea    (%r14,%r13,1),%ebp
    df3c:	39 d5                	cmp    %edx,%ebp
    df3e:	0f 8f 93 00 00 00    	jg     dfd7 <hyperinterval::ieee::Format::rounded+0x1b7>
    df44:	b9 01 00 00 00       	mov    $0x1,%ecx
    df49:	29 d1                	sub    %edx,%ecx
    df4b:	39 cd                	cmp    %ecx,%ebp
    df4d:	0f 8d 53 01 00 00    	jge    e0a6 <hyperinterval::ieee::Format::rounded+0x286>
    df53:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
    df58:	43 8d 0c 2e          	lea    (%r14,%r13,1),%ecx
    df5c:	fe c9                	dec    %cl
    df5e:	4d 89 f9             	mov    %r15,%r9
    df61:	49 d3 e1             	shl    %cl,%r9
    df64:	45 31 d2             	xor    %r10d,%r10d
    df67:	f6 c1 40             	test   $0x40,%cl
    df6a:	4d 0f 44 d1          	cmove  %r9,%r10
    df6e:	eb 2e                	jmp    df9e <hyperinterval::ieee::Format::rounded+0x17e>
    df70:	f6 d9                	neg    %cl
    df72:	4d 0f a5 d3          	shld   %cl,%r10,%r11
    df76:	49 d3 e2             	shl    %cl,%r10
    df79:	45 31 e4             	xor    %r12d,%r12d
    df7c:	f6 c1 40             	test   $0x40,%cl
    df7f:	4d 0f 45 da          	cmovne %r10,%r11
    df83:	41 bf 00 00 00 00    	mov    $0x0,%r15d
    df89:	4d 0f 44 fa          	cmove  %r10,%r15
    df8d:	4c 89 f9             	mov    %r15,%rcx
    df90:	4c 09 d9             	or     %r11,%rcx
    df93:	75 85                	jne    df1a <hyperinterval::ieee::Format::rounded+0xfa>
    df95:	45 31 ff             	xor    %r15d,%r15d
    df98:	45 31 db             	xor    %r11d,%r11d
    df9b:	45 31 d2             	xor    %r10d,%r10d
    df9e:	45 0f b6 e4          	movzbl %r12b,%r12d
    dfa2:	4d 01 fc             	add    %r15,%r12
    dfa5:	49 83 d3 00          	adc    $0x0,%r11
    dfa9:	4c 89 e1             	mov    %r12,%rcx
    dfac:	4c 09 d9             	or     %r11,%rcx
    dfaf:	74 30                	je     dfe1 <hyperinterval::ieee::Format::rounded+0x1c1>
    dfb1:	49 0f bd cb          	bsr    %r11,%rcx
    dfb5:	83 f1 3f             	xor    $0x3f,%ecx
    dfb8:	4d 0f bd fc          	bsr    %r12,%r15
    dfbc:	41 83 f7 3f          	xor    $0x3f,%r15d
    dfc0:	41 83 cf 40          	or     $0x40,%r15d
    dfc4:	4d 85 db             	test   %r11,%r11
    dfc7:	44 0f 45 f9          	cmovne %ecx,%r15d
    dfcb:	41 83 f7 7f          	xor    $0x7f,%r15d
    dfcf:	43 8d 2c 37          	lea    (%r15,%r14,1),%ebp
    dfd3:	39 d5                	cmp    %edx,%ebp
    dfd5:	7e 1b                	jle    dff2 <hyperinterval::ieee::Format::rounded+0x1d2>
    dfd7:	66 c7 07 01 03       	movw   $0x301,(%rdi)
    dfdc:	e9 ba 00 00 00       	jmp    e09b <hyperinterval::ieee::Format::rounded+0x27b>
    dfe1:	31 d2                	xor    %edx,%edx
    dfe3:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
    dfe7:	0f 84 86 00 00 00    	je     e073 <hyperinterval::ieee::Format::rounded+0x253>
    dfed:	e9 9e 00 00 00       	jmp    e090 <hyperinterval::ieee::Format::rounded+0x270>
    dff2:	b9 01 00 00 00       	mov    $0x1,%ecx
    dff7:	29 d1                	sub    %edx,%ecx
    dff9:	39 cd                	cmp    %ecx,%ebp
    dffb:	7d 1e                	jge    e01b <hyperinterval::ieee::Format::rounded+0x1fb>
    dffd:	45 01 f5             	add    %r14d,%r13d
    e000:	41 fe cd             	dec    %r13b
    e003:	44 89 e9             	mov    %r13d,%ecx
    e006:	49 d3 e4             	shl    %cl,%r12
    e009:	31 d2                	xor    %edx,%edx
    e00b:	41 f6 c5 40          	test   $0x40,%r13b
    e00f:	49 0f 44 d4          	cmove  %r12,%rdx
    e013:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
    e017:	74 5a                	je     e073 <hyperinterval::ieee::Format::rounded+0x253>
    e019:	eb 75                	jmp    e090 <hyperinterval::ieee::Format::rounded+0x270>
    e01b:	89 d9                	mov    %ebx,%ecx
    e01d:	44 29 f9             	sub    %r15d,%ecx
    e020:	41 89 c9             	mov    %ecx,%r9d
    e023:	41 f7 d9             	neg    %r9d
    e026:	4d 89 e6             	mov    %r12,%r14
    e029:	49 d3 e6             	shl    %cl,%r14
    e02c:	45 31 ed             	xor    %r13d,%r13d
    e02f:	f6 c1 40             	test   $0x40,%cl
    e032:	4d 0f 44 ee          	cmove  %r14,%r13
    e036:	44 89 c9             	mov    %r9d,%ecx
    e039:	4d 0f ad dc          	shrd   %cl,%r11,%r12
    e03d:	49 d3 eb             	shr    %cl,%r11
    e040:	41 f6 c1 40          	test   $0x40,%r9b
    e044:	4d 0f 44 dc          	cmove  %r12,%r11
    e048:	44 39 fb             	cmp    %r15d,%ebx
    e04b:	4d 0f 43 dd          	cmovae %r13,%r11
    e04f:	01 d5                	add    %edx,%ebp
    e051:	4c 63 cd             	movslq %ebp,%r9
    e054:	44 89 c1             	mov    %r8d,%ecx
    e057:	49 d3 e1             	shl    %cl,%r9
    e05a:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    e061:	48 d3 e2             	shl    %cl,%rdx
    e064:	48 f7 d2             	not    %rdx
    e067:	4c 21 da             	and    %r11,%rdx
    e06a:	4c 09 ca             	or     %r9,%rdx
    e06d:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
    e071:	75 1d                	jne    e090 <hyperinterval::ieee::Format::rounded+0x270>
    e073:	48 89 d0             	mov    %rdx,%rax
    e076:	48 31 f0             	xor    %rsi,%rax
    e079:	48 85 d2             	test   %rdx,%rdx
    e07c:	48 0f 44 c2          	cmove  %rdx,%rax
    e080:	4c 31 d6             	xor    %r10,%rsi
    e083:	4d 85 d2             	test   %r10,%r10
    e086:	49 0f 44 f2          	cmove  %r10,%rsi
    e08a:	49 89 c2             	mov    %rax,%r10
    e08d:	48 89 f2             	mov    %rsi,%rdx
    e090:	4c 89 57 08          	mov    %r10,0x8(%rdi)
    e094:	48 89 57 10          	mov    %rdx,0x10(%rdi)
    e098:	c6 07 00             	movb   $0x0,(%rdi)
    e09b:	5b                   	pop    %rbx
    e09c:	41 5c                	pop    %r12
    e09e:	41 5d                	pop    %r13
    e0a0:	41 5e                	pop    %r14
    e0a2:	41 5f                	pop    %r15
    e0a4:	5d                   	pop    %rbp
    e0a5:	c3                   	ret
    e0a6:	89 d9                	mov    %ebx,%ecx
    e0a8:	44 29 e9             	sub    %r13d,%ecx
    e0ab:	4d 89 f9             	mov    %r15,%r9
    e0ae:	49 d3 e1             	shl    %cl,%r9
    e0b1:	41 89 ca             	mov    %ecx,%r10d
    e0b4:	41 f7 da             	neg    %r10d
    e0b7:	48 c7 44 24 e8 00 00 	movq   $0x0,-0x18(%rsp)
    e0be:	00 00 
    e0c0:	f6 c1 40             	test   $0x40,%cl
    e0c3:	48 8b 4c 24 e8       	mov    -0x18(%rsp),%rcx
    e0c8:	49 0f 44 c9          	cmove  %r9,%rcx
    e0cc:	48 89 4c 24 e8       	mov    %rcx,-0x18(%rsp)
    e0d1:	4d 89 f9             	mov    %r15,%r9
    e0d4:	44 89 d1             	mov    %r10d,%ecx
    e0d7:	4d 0f ad d9          	shrd   %cl,%r11,%r9
    e0db:	4c 89 4c 24 f8       	mov    %r9,-0x8(%rsp)
    e0e0:	4d 89 d9             	mov    %r11,%r9
    e0e3:	49 d3 e9             	shr    %cl,%r9
    e0e6:	41 f6 c2 40          	test   $0x40,%r10b
    e0ea:	4c 0f 44 4c 24 f8    	cmove  -0x8(%rsp),%r9
    e0f0:	44 39 eb             	cmp    %r13d,%ebx
    e0f3:	4c 0f 43 4c 24 e8    	cmovae -0x18(%rsp),%r9
    e0f9:	01 d5                	add    %edx,%ebp
    e0fb:	4c 63 ed             	movslq %ebp,%r13
    e0fe:	44 89 c1             	mov    %r8d,%ecx
    e101:	49 d3 e5             	shl    %cl,%r13
    e104:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
    e10b:	49 d3 e2             	shl    %cl,%r10
    e10e:	49 f7 d2             	not    %r10
    e111:	4d 21 ca             	and    %r9,%r10
    e114:	4d 09 ea             	or     %r13,%r10
    e117:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
    e11c:	e9 7d fe ff ff       	jmp    df9e <hyperinterval::ieee::Format::rounded+0x17e>
    e121:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    e128:	00 00 00 
    e12b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

hyperinterval::ieee::Format::add:
    e130:	55                   	push   %rbp
    e131:	41 57                	push   %r15
    e133:	41 56                	push   %r14
    e135:	41 55                	push   %r13
    e137:	41 54                	push   %r12
    e139:	53                   	push   %rbx
    e13a:	48 83 ec 38          	sub    $0x38,%rsp
    e13e:	48 89 fb             	mov    %rdi,%rbx
    e141:	48 85 c9             	test   %rcx,%rcx
    e144:	0f 84 6a 01 00 00    	je     e2b4 <hyperinterval::ieee::Format::add+0x184>
    e14a:	48 89 c8             	mov    %rcx,%rax
    e14d:	4d 85 c0             	test   %r8,%r8
    e150:	0f 84 68 01 00 00    	je     e2be <hyperinterval::ieee::Format::add+0x18e>
    e156:	41 b9 40 00 00 00    	mov    $0x40,%r9d
    e15c:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
    e161:	49 89 c2             	mov    %rax,%r10
    e164:	49 21 d2             	and    %rdx,%r10
    e167:	44 89 c9             	mov    %r9d,%ecx
    e16a:	49 d3 ea             	shr    %cl,%r10
    e16d:	41 bb 01 00 00 00    	mov    $0x1,%r11d
    e173:	49 d3 e3             	shl    %cl,%r11
    e176:	4d 8d 63 ff          	lea    -0x1(%r11),%r12
    e17a:	4d 89 e6             	mov    %r12,%r14
    e17d:	49 21 c6             	and    %rax,%r14
    e180:	4d 85 d2             	test   %r10,%r10
    e183:	bf 01 00 00 00       	mov    $0x1,%edi
    e188:	44 89 d5             	mov    %r10d,%ebp
    e18b:	0f 44 ef             	cmove  %edi,%ebp
    e18e:	4d 0f 45 d3          	cmovne %r11,%r10
    e192:	49 89 d7             	mov    %rdx,%r15
    e195:	49 d3 ef             	shr    %cl,%r15
    e198:	4d 09 f2             	or     %r14,%r10
    e19b:	49 d1 ef             	shr    $1,%r15
    e19e:	45 01 cf             	add    %r9d,%r15d
    e1a1:	48 85 f0             	test   %rsi,%rax
    e1a4:	0f 95 44 24 0f       	setne  0xf(%rsp)
    e1a9:	b9 7f 00 00 00       	mov    $0x7f,%ecx
    e1ae:	49 0f bd ca          	bsr    %r10,%rcx
    e1b2:	83 f1 3f             	xor    $0x3f,%ecx
    e1b5:	44 01 c9             	add    %r9d,%ecx
    e1b8:	83 c1 c1             	add    $0xffffffc1,%ecx
    e1bb:	45 31 ed             	xor    %r13d,%r13d
    e1be:	4d 0f a5 d5          	shld   %cl,%r10,%r13
    e1c2:	45 31 f6             	xor    %r14d,%r14d
    e1c5:	49 d3 e2             	shl    %cl,%r10
    e1c8:	f6 c1 40             	test   $0x40,%cl
    e1cb:	4d 0f 45 ea          	cmovne %r10,%r13
    e1cf:	4d 0f 45 d6          	cmovne %r14,%r10
    e1d3:	44 01 f9             	add    %r15d,%ecx
    e1d6:	29 cd                	sub    %ecx,%ebp
    e1d8:	4d 89 c6             	mov    %r8,%r14
    e1db:	49 21 d6             	and    %rdx,%r14
    e1de:	44 89 c9             	mov    %r9d,%ecx
    e1e1:	49 d3 ee             	shr    %cl,%r14
    e1e4:	4d 21 c4             	and    %r8,%r12
    e1e7:	4d 85 f6             	test   %r14,%r14
    e1ea:	41 0f 45 fe          	cmovne %r14d,%edi
    e1ee:	4d 0f 45 f3          	cmovne %r11,%r14
    e1f2:	b9 7f 00 00 00       	mov    $0x7f,%ecx
    e1f7:	4d 09 e6             	or     %r12,%r14
    e1fa:	49 85 f0             	test   %rsi,%r8
    e1fd:	41 0f 95 c3          	setne  %r11b
    e201:	49 0f bd ce          	bsr    %r14,%rcx
    e205:	83 f1 3f             	xor    $0x3f,%ecx
    e208:	44 01 c9             	add    %r9d,%ecx
    e20b:	83 c1 c1             	add    $0xffffffc1,%ecx
    e20e:	45 31 c9             	xor    %r9d,%r9d
    e211:	4d 0f a5 f1          	shld   %cl,%r14,%r9
    e215:	49 d3 e6             	shl    %cl,%r14
    e218:	f6 c1 40             	test   $0x40,%cl
    e21b:	4d 0f 45 ce          	cmovne %r14,%r9
    e21f:	41 bc 00 00 00 00    	mov    $0x0,%r12d
    e225:	4d 0f 45 f4          	cmovne %r12,%r14
    e229:	41 01 cf             	add    %ecx,%r15d
    e22c:	44 29 ff             	sub    %r15d,%edi
    e22f:	39 fd                	cmp    %edi,%ebp
    e231:	0f 8d 97 00 00 00    	jge    e2ce <hyperinterval::ieee::Format::add+0x19e>
    e237:	44 88 5c 24 0e       	mov    %r11b,0xe(%rsp)
    e23c:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
    e241:	88 4c 24 0d          	mov    %cl,0xd(%rsp)
    e245:	41 89 ef             	mov    %ebp,%r15d
    e248:	4d 89 d3             	mov    %r10,%r11
    e24b:	4d 89 ec             	mov    %r13,%r12
    e24e:	4d 89 c5             	mov    %r8,%r13
    e251:	44 29 ff             	sub    %r15d,%edi
    e254:	83 ff 4a             	cmp    $0x4a,%edi
    e257:	0f 8f 9f 00 00 00    	jg     e2fc <hyperinterval::ieee::Format::add+0x1cc>
    e25d:	49 85 f0             	test   %rsi,%r8
    e260:	41 0f 95 c0          	setne  %r8b
    e264:	48 85 f0             	test   %rsi,%rax
    e267:	41 0f 95 c2          	setne  %r10b
    e26b:	89 f9                	mov    %edi,%ecx
    e26d:	4d 0f a5 f1          	shld   %cl,%r14,%r9
    e271:	49 d3 e6             	shl    %cl,%r14
    e274:	31 c0                	xor    %eax,%eax
    e276:	40 f6 c7 40          	test   $0x40,%dil
    e27a:	4d 0f 45 ce          	cmovne %r14,%r9
    e27e:	49 0f 44 c6          	cmove  %r14,%rax
    e282:	45 30 c2             	xor    %r8b,%r10b
    e285:	0f 84 c3 00 00 00    	je     e34e <hyperinterval::ieee::Format::add+0x21e>
    e28b:	4c 39 d8             	cmp    %r11,%rax
    e28e:	4c 89 c9             	mov    %r9,%rcx
    e291:	4c 19 e1             	sbb    %r12,%rcx
    e294:	0f 83 e9 00 00 00    	jae    e383 <hyperinterval::ieee::Format::add+0x253>
    e29a:	49 29 c3             	sub    %rax,%r11
    e29d:	4d 19 cc             	sbb    %r9,%r12
    e2a0:	0f b6 44 24 0d       	movzbl 0xd(%rsp),%eax
    e2a5:	88 44 24 0e          	mov    %al,0xe(%rsp)
    e2a9:	4c 89 d8             	mov    %r11,%rax
    e2ac:	4d 89 e1             	mov    %r12,%r9
    e2af:	e9 d5 00 00 00       	jmp    e389 <hyperinterval::ieee::Format::add+0x259>
    e2b4:	4c 89 43 08          	mov    %r8,0x8(%rbx)
    e2b8:	4c 89 43 10          	mov    %r8,0x10(%rbx)
    e2bc:	eb 08                	jmp    e2c6 <hyperinterval::ieee::Format::add+0x196>
    e2be:	48 89 43 08          	mov    %rax,0x8(%rbx)
    e2c2:	48 89 43 10          	mov    %rax,0x10(%rbx)
    e2c6:	c6 03 00             	movb   $0x0,(%rbx)
    e2c9:	e9 e0 00 00 00       	jmp    e3ae <hyperinterval::ieee::Format::add+0x27e>
    e2ce:	44 88 5c 24 0d       	mov    %r11b,0xd(%rsp)
    e2d3:	41 89 ff             	mov    %edi,%r15d
    e2d6:	4d 89 f3             	mov    %r14,%r11
    e2d9:	4d 89 cc             	mov    %r9,%r12
    e2dc:	0f b6 4c 24 0f       	movzbl 0xf(%rsp),%ecx
    e2e1:	88 4c 24 0e          	mov    %cl,0xe(%rsp)
    e2e5:	89 ef                	mov    %ebp,%edi
    e2e7:	4d 89 d6             	mov    %r10,%r14
    e2ea:	4d 89 e9             	mov    %r13,%r9
    e2ed:	49 89 c5             	mov    %rax,%r13
    e2f0:	44 29 ff             	sub    %r15d,%edi
    e2f3:	83 ff 4a             	cmp    $0x4a,%edi
    e2f6:	0f 8e 61 ff ff ff    	jle    e25d <hyperinterval::ieee::Format::add+0x12d>
    e2fc:	80 7c 24 0d 00       	cmpb   $0x0,0xd(%rsp)
    e301:	74 53                	je     e356 <hyperinterval::ieee::Format::add+0x226>
    e303:	4c 89 e8             	mov    %r13,%rax
    e306:	48 31 f0             	xor    %rsi,%rax
    e309:	48 89 c7             	mov    %rax,%rdi
    e30c:	48 21 f7             	and    %rsi,%rdi
    e30f:	31 c9                	xor    %ecx,%ecx
    e311:	48 f7 df             	neg    %rdi
    e314:	48 19 c9             	sbb    %rcx,%rcx
    e317:	48 83 c9 01          	or     $0x1,%rcx
    e31b:	48 01 c1             	add    %rax,%rcx
    e31e:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    e323:	49 89 f6             	mov    %rsi,%r14
    e326:	e8 b5 fa ff ff       	call   dde0 <hyperinterval::ieee::Format::finite>
    e32b:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
    e330:	75 4a                	jne    e37c <hyperinterval::ieee::Format::add+0x24c>
    e332:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    e337:	49 31 c6             	xor    %rax,%r14
    e33a:	48 85 c0             	test   %rax,%rax
    e33d:	4c 0f 44 f0          	cmove  %rax,%r14
    e341:	4c 89 73 08          	mov    %r14,0x8(%rbx)
    e345:	4c 89 6b 10          	mov    %r13,0x10(%rbx)
    e349:	e9 78 ff ff ff       	jmp    e2c6 <hyperinterval::ieee::Format::add+0x196>
    e34e:	4c 01 d8             	add    %r11,%rax
    e351:	4d 11 e1             	adc    %r12,%r9
    e354:	eb 33                	jmp    e389 <hyperinterval::ieee::Format::add+0x259>
    e356:	4c 89 e8             	mov    %r13,%rax
    e359:	48 21 f0             	and    %rsi,%rax
    e35c:	31 c9                	xor    %ecx,%ecx
    e35e:	48 f7 d8             	neg    %rax
    e361:	48 19 c9             	sbb    %rcx,%rcx
    e364:	48 83 c9 01          	or     $0x1,%rcx
    e368:	4c 01 e9             	add    %r13,%rcx
    e36b:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    e370:	e8 6b fa ff ff       	call   dde0 <hyperinterval::ieee::Format::finite>
    e375:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
    e37a:	74 44                	je     e3c0 <hyperinterval::ieee::Format::add+0x290>
    e37c:	66 c7 03 01 03       	movw   $0x301,(%rbx)
    e381:	eb 2b                	jmp    e3ae <hyperinterval::ieee::Format::add+0x27e>
    e383:	4c 29 d8             	sub    %r11,%rax
    e386:	4d 19 e1             	sbb    %r12,%r9
    e389:	0f b6 4c 24 0e       	movzbl 0xe(%rsp),%ecx
    e38e:	88 4c 24 24          	mov    %cl,0x24(%rsp)
    e392:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
    e397:	4c 89 4c 24 18       	mov    %r9,0x18(%rsp)
    e39c:	44 89 7c 24 20       	mov    %r15d,0x20(%rsp)
    e3a1:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
    e3a6:	48 89 df             	mov    %rbx,%rdi
    e3a9:	e8 72 fa ff ff       	call   de20 <hyperinterval::ieee::Format::rounded>
    e3ae:	48 89 d8             	mov    %rbx,%rax
    e3b1:	48 83 c4 38          	add    $0x38,%rsp
    e3b5:	5b                   	pop    %rbx
    e3b6:	41 5c                	pop    %r12
    e3b8:	41 5d                	pop    %r13
    e3ba:	41 5e                	pop    %r14
    e3bc:	41 5f                	pop    %r15
    e3be:	5d                   	pop    %rbp
    e3bf:	c3                   	ret
    e3c0:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    e3c5:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
    e3c9:	e9 f4 fe ff ff       	jmp    e2c2 <hyperinterval::ieee::Format::add+0x192>
    e3ce:	66 90                	xchg   %ax,%ax

hyperinterval::ieee::Format::affine:
    e3d0:	55                   	push   %rbp
    e3d1:	41 57                	push   %r15
    e3d3:	41 56                	push   %r14
    e3d5:	41 55                	push   %r13
    e3d7:	41 54                	push   %r12
    e3d9:	53                   	push   %rbx
    e3da:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
    e3e1:	48 89 c8             	mov    %rcx,%rax
    e3e4:	49 89 d6             	mov    %rdx,%r14
    e3e7:	b9 40 00 00 00       	mov    $0x40,%ecx
    e3ec:	f3 48 0f bc ca       	tzcnt  %rdx,%rcx
    e3f1:	48 89 c2             	mov    %rax,%rdx
    e3f4:	4c 21 f2             	and    %r14,%rdx
    e3f7:	48 d3 ea             	shr    %cl,%rdx
    e3fa:	41 bb 01 00 00 00    	mov    $0x1,%r11d
    e400:	49 d3 e3             	shl    %cl,%r11
    e403:	4d 8d 7b ff          	lea    -0x1(%r11),%r15
    e407:	4c 89 fb             	mov    %r15,%rbx
    e40a:	48 21 c3             	and    %rax,%rbx
    e40d:	48 85 d2             	test   %rdx,%rdx
    e410:	41 ba 01 00 00 00    	mov    $0x1,%r10d
    e416:	89 d5                	mov    %edx,%ebp
    e418:	41 0f 44 ea          	cmove  %r10d,%ebp
    e41c:	48 89 3c 24          	mov    %rdi,(%rsp)
    e420:	49 0f 45 d3          	cmovne %r11,%rdx
    e424:	4d 89 f5             	mov    %r14,%r13
    e427:	49 d3 ed             	shr    %cl,%r13
    e42a:	48 09 da             	or     %rbx,%rdx
    e42d:	49 d1 ed             	shr    $1,%r13
    e430:	41 01 cd             	add    %ecx,%r13d
    e433:	44 29 ed             	sub    %r13d,%ebp
    e436:	48 85 f0             	test   %rsi,%rax
    e439:	0f 95 c3             	setne  %bl
    e43c:	4c 89 c0             	mov    %r8,%rax
    e43f:	4c 21 f0             	and    %r14,%rax
    e442:	48 d3 e8             	shr    %cl,%rax
    e445:	4d 89 fc             	mov    %r15,%r12
    e448:	4d 21 c4             	and    %r8,%r12
    e44b:	48 85 c0             	test   %rax,%rax
    e44e:	89 c7                	mov    %eax,%edi
    e450:	41 0f 44 fa          	cmove  %r10d,%edi
    e454:	49 0f 45 c3          	cmovne %r11,%rax
    e458:	4c 09 e0             	or     %r12,%rax
    e45b:	44 29 ef             	sub    %r13d,%edi
    e45e:	49 85 f0             	test   %rsi,%r8
    e461:	41 0f 95 c0          	setne  %r8b
    e465:	01 ef                	add    %ebp,%edi
    e467:	4c 89 f5             	mov    %r14,%rbp
    e46a:	4d 89 cc             	mov    %r9,%r12
    e46d:	4d 21 f4             	and    %r14,%r12
    e470:	49 d3 ec             	shr    %cl,%r12
    e473:	41 30 d8             	xor    %bl,%r8b
    e476:	48 f7 e2             	mul    %rdx
    e479:	4d 21 cf             	and    %r9,%r15
    e47c:	4d 85 e4             	test   %r12,%r12
    e47f:	45 0f 45 d4          	cmovne %r12d,%r10d
    e483:	4d 0f 45 e3          	cmovne %r11,%r12
    e487:	4d 09 fc             	or     %r15,%r12
    e48a:	45 29 ea             	sub    %r13d,%r10d
    e48d:	49 85 f1             	test   %rsi,%r9
    e490:	0f 95 84 24 84 00 00 	setne  0x84(%rsp)
    e497:	00 
    e498:	0f 95 c3             	setne  %bl
    e49b:	48 89 c1             	mov    %rax,%rcx
    e49e:	48 09 d1             	or     %rdx,%rcx
    e4a1:	44 88 44 24 64       	mov    %r8b,0x64(%rsp)
    e4a6:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
    e4ab:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
    e4b0:	89 7c 24 60          	mov    %edi,0x60(%rsp)
    e4b4:	4c 89 64 24 70       	mov    %r12,0x70(%rsp)
    e4b9:	48 c7 44 24 78 00 00 	movq   $0x0,0x78(%rsp)
    e4c0:	00 00 
    e4c2:	44 89 94 24 80 00 00 	mov    %r10d,0x80(%rsp)
    e4c9:	00 
    e4ca:	74 79                	je     e545 <hyperinterval::ieee::Format::affine+0x175>
    e4cc:	4d 85 e4             	test   %r12,%r12
    e4cf:	74 7b                	je     e54c <hyperinterval::ieee::Format::affine+0x17c>
    e4d1:	48 89 6c 24 30       	mov    %rbp,0x30(%rsp)
    e4d6:	48 0f bd ca          	bsr    %rdx,%rcx
    e4da:	83 f1 3f             	xor    $0x3f,%ecx
    e4dd:	4c 0f bd d8          	bsr    %rax,%r11
    e4e1:	41 83 f3 3f          	xor    $0x3f,%r11d
    e4e5:	41 83 cb 40          	or     $0x40,%r11d
    e4e9:	48 85 d2             	test   %rdx,%rdx
    e4ec:	44 0f 45 d9          	cmovne %ecx,%r11d
    e4f0:	41 83 f3 7f          	xor    $0x7f,%r11d
    e4f4:	41 01 fb             	add    %edi,%r11d
    e4f7:	4d 0f bd fc          	bsr    %r12,%r15
    e4fb:	41 83 f7 3f          	xor    $0x3f,%r15d
    e4ff:	41 83 cf 40          	or     $0x40,%r15d
    e503:	41 83 f7 7f          	xor    $0x7f,%r15d
    e507:	45 01 d7             	add    %r10d,%r15d
    e50a:	45 39 df             	cmp    %r11d,%r15d
    e50d:	45 0f 4e fb          	cmovle %r11d,%r15d
    e511:	41 83 c7 82          	add    $0xffffff82,%r15d
    e515:	44 29 ff             	sub    %r15d,%edi
    e518:	78 4b                	js     e565 <hyperinterval::ieee::Format::affine+0x195>
    e51a:	89 f9                	mov    %edi,%ecx
    e51c:	48 0f a5 c2          	shld   %cl,%rax,%rdx
    e520:	48 d3 e0             	shl    %cl,%rax
    e523:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    e52a:	00 00 
    e52c:	40 f6 c7 40          	test   $0x40,%dil
    e530:	48 0f 45 d0          	cmovne %rax,%rdx
    e534:	bd 00 00 00 00       	mov    $0x0,%ebp
    e539:	48 0f 44 e8          	cmove  %rax,%rbp
    e53d:	49 89 d3             	mov    %rdx,%r11
    e540:	e9 9b 00 00 00       	jmp    e5e0 <hyperinterval::ieee::Format::affine+0x210>
    e545:	48 8d 4c 24 70       	lea    0x70(%rsp),%rcx
    e54a:	eb 05                	jmp    e551 <hyperinterval::ieee::Format::affine+0x181>
    e54c:	48 8d 4c 24 50       	lea    0x50(%rsp),%rcx
    e551:	4c 8b 34 24          	mov    (%rsp),%r14
    e555:	4c 89 f7             	mov    %r14,%rdi
    e558:	48 89 ea             	mov    %rbp,%rdx
    e55b:	e8 c0 f8 ff ff       	call   de20 <hyperinterval::ieee::Format::rounded>
    e560:	e9 3f 02 00 00       	jmp    e7a4 <hyperinterval::ieee::Format::affine+0x3d4>
    e565:	f7 df                	neg    %edi
    e567:	bd 00 00 00 00       	mov    $0x0,%ebp
    e56c:	41 bb 00 00 00 00    	mov    $0x0,%r11d
    e572:	83 ff 7f             	cmp    $0x7f,%edi
    e575:	7f 5b                	jg     e5d2 <hyperinterval::ieee::Format::affine+0x202>
    e577:	48 89 c5             	mov    %rax,%rbp
    e57a:	89 f9                	mov    %edi,%ecx
    e57c:	48 0f ad d5          	shrd   %cl,%rdx,%rbp
    e580:	49 89 d3             	mov    %rdx,%r11
    e583:	49 d3 eb             	shr    %cl,%r11
    e586:	41 89 dd             	mov    %ebx,%r13d
    e589:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
    e590:	48 d3 e3             	shl    %cl,%rbx
    e593:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    e59a:	40 f6 c7 40          	test   $0x40,%dil
    e59e:	49 0f 45 eb          	cmovne %r11,%rbp
    e5a2:	41 be 00 00 00 00    	mov    $0x0,%r14d
    e5a8:	4d 0f 45 de          	cmovne %r14,%r11
    e5ac:	48 0f 45 cb          	cmovne %rbx,%rcx
    e5b0:	bf 00 00 00 00       	mov    $0x0,%edi
    e5b5:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
    e5ba:	49 0f 45 de          	cmovne %r14,%rbx
    e5be:	48 f7 d3             	not    %rbx
    e5c1:	48 f7 d1             	not    %rcx
    e5c4:	48 21 d1             	and    %rdx,%rcx
    e5c7:	48 21 c3             	and    %rax,%rbx
    e5ca:	48 09 cb             	or     %rcx,%rbx
    e5cd:	44 89 eb             	mov    %r13d,%ebx
    e5d0:	74 0e                	je     e5e0 <hyperinterval::ieee::Format::affine+0x210>
    e5d2:	41 0f b6 c0          	movzbl %r8b,%eax
    e5d6:	f7 d8                	neg    %eax
    e5d8:	83 c8 01             	or     $0x1,%eax
    e5db:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    e5e0:	45 29 fa             	sub    %r15d,%r10d
    e5e3:	78 20                	js     e605 <hyperinterval::ieee::Format::affine+0x235>
    e5e5:	31 d2                	xor    %edx,%edx
    e5e7:	44 89 d1             	mov    %r10d,%ecx
    e5ea:	4c 0f a5 e2          	shld   %cl,%r12,%rdx
    e5ee:	49 d3 e4             	shl    %cl,%r12
    e5f1:	45 31 ed             	xor    %r13d,%r13d
    e5f4:	41 f6 c2 40          	test   $0x40,%r10b
    e5f8:	49 0f 45 d4          	cmovne %r12,%rdx
    e5fc:	4d 0f 45 e5          	cmovne %r13,%r12
    e600:	4c 89 e0             	mov    %r12,%rax
    e603:	eb 54                	jmp    e659 <hyperinterval::ieee::Format::affine+0x289>
    e605:	41 f7 da             	neg    %r10d
    e608:	45 31 ed             	xor    %r13d,%r13d
    e60b:	b8 00 00 00 00       	mov    $0x0,%eax
    e610:	41 83 fa 7f          	cmp    $0x7f,%r10d
    e614:	7f 2d                	jg     e643 <hyperinterval::ieee::Format::affine+0x273>
    e616:	4c 89 e0             	mov    %r12,%rax
    e619:	44 89 d1             	mov    %r10d,%ecx
    e61c:	4c 0f ad e8          	shrd   %cl,%r13,%rax
    e620:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
    e627:	48 d3 e7             	shl    %cl,%rdi
    e62a:	41 f6 c2 40          	test   $0x40,%r10b
    e62e:	49 0f 45 c5          	cmovne %r13,%rax
    e632:	49 0f 45 fd          	cmovne %r13,%rdi
    e636:	48 f7 d7             	not    %rdi
    e639:	ba 00 00 00 00       	mov    $0x0,%edx
    e63e:	4c 85 e7             	test   %r12,%rdi
    e641:	74 16                	je     e659 <hyperinterval::ieee::Format::affine+0x289>
    e643:	4c 89 ea             	mov    %r13,%rdx
    e646:	4c 89 c9             	mov    %r9,%rcx
    e649:	48 21 f1             	and    %rsi,%rcx
    e64c:	45 31 ed             	xor    %r13d,%r13d
    e64f:	48 f7 d9             	neg    %rcx
    e652:	45 19 ed             	sbb    %r13d,%r13d
    e655:	41 83 cd 01          	or     $0x1,%r13d
    e659:	49 85 f1             	test   %rsi,%r9
    e65c:	0f 95 c1             	setne  %cl
    e65f:	41 38 c8             	cmp    %cl,%r8b
    e662:	74 16                	je     e67a <hyperinterval::ieee::Format::affine+0x2aa>
    e664:	48 39 c5             	cmp    %rax,%rbp
    e667:	4c 89 d9             	mov    %r11,%rcx
    e66a:	48 19 d1             	sbb    %rdx,%rcx
    e66d:	73 13                	jae    e682 <hyperinterval::ieee::Format::affine+0x2b2>
    e66f:	48 29 e8             	sub    %rbp,%rax
    e672:	4c 19 da             	sbb    %r11,%rdx
    e675:	41 89 d8             	mov    %ebx,%r8d
    e678:	eb 14                	jmp    e68e <hyperinterval::ieee::Format::affine+0x2be>
    e67a:	48 01 e8             	add    %rbp,%rax
    e67d:	4c 11 da             	adc    %r11,%rdx
    e680:	eb 0c                	jmp    e68e <hyperinterval::ieee::Format::affine+0x2be>
    e682:	48 29 c5             	sub    %rax,%rbp
    e685:	49 19 d3             	sbb    %rdx,%r11
    e688:	48 89 e8             	mov    %rbp,%rax
    e68b:	4c 89 da             	mov    %r11,%rdx
    e68e:	44 88 44 24 24       	mov    %r8b,0x24(%rsp)
    e693:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
    e698:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
    e69d:	44 89 7c 24 20       	mov    %r15d,0x20(%rsp)
    e6a2:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
    e6a7:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
    e6ac:	49 89 f4             	mov    %rsi,%r12
    e6af:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
    e6b4:	48 89 da             	mov    %rbx,%rdx
    e6b7:	e8 64 f7 ff ff       	call   de20 <hyperinterval::ieee::Format::rounded>
    e6bc:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
    e6c1:	75 16                	jne    e6d9 <hyperinterval::ieee::Format::affine+0x309>
    e6c3:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
    e6c8:	4c 8b 34 24          	mov    (%rsp),%r14
    e6cc:	41 88 46 01          	mov    %al,0x1(%r14)
    e6d0:	41 c6 06 01          	movb   $0x1,(%r14)
    e6d4:	e9 cb 00 00 00       	jmp    e7a4 <hyperinterval::ieee::Format::affine+0x3d4>
    e6d9:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
    e6de:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
    e6e3:	49 39 c7             	cmp    %rax,%r15
    e6e6:	0f 85 a8 00 00 00    	jne    e794 <hyperinterval::ieee::Format::affine+0x3c4>
    e6ec:	44 03 6c 24 08       	add    0x8(%rsp),%r13d
    e6f1:	41 83 fd 01          	cmp    $0x1,%r13d
    e6f5:	74 60                	je     e757 <hyperinterval::ieee::Format::affine+0x387>
    e6f7:	41 83 fd ff          	cmp    $0xffffffff,%r13d
    e6fb:	0f 85 93 00 00 00    	jne    e794 <hyperinterval::ieee::Format::affine+0x3c4>
    e701:	4c 89 f8             	mov    %r15,%rax
    e704:	4c 89 e6             	mov    %r12,%rsi
    e707:	4c 31 e0             	xor    %r12,%rax
    e70a:	4d 85 ff             	test   %r15,%r15
    e70d:	49 0f 44 c7          	cmove  %r15,%rax
    e711:	48 89 c2             	mov    %rax,%rdx
    e714:	4c 21 e2             	and    %r12,%rdx
    e717:	31 c9                	xor    %ecx,%ecx
    e719:	48 f7 da             	neg    %rdx
    e71c:	48 19 c9             	sbb    %rcx,%rcx
    e71f:	48 83 c9 01          	or     $0x1,%rcx
    e723:	48 01 c1             	add    %rax,%rcx
    e726:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    e72b:	48 89 da             	mov    %rbx,%rdx
    e72e:	e8 ad f6 ff ff       	call   dde0 <hyperinterval::ieee::Format::finite>
    e733:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
    e738:	75 49                	jne    e783 <hyperinterval::ieee::Format::affine+0x3b3>
    e73a:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    e73f:	49 31 c4             	xor    %rax,%r12
    e742:	48 85 c0             	test   %rax,%rax
    e745:	4c 0f 44 e0          	cmove  %rax,%r12
    e749:	4c 8b 34 24          	mov    (%rsp),%r14
    e74d:	4d 89 66 08          	mov    %r12,0x8(%r14)
    e751:	4d 89 7e 10          	mov    %r15,0x10(%r14)
    e755:	eb 49                	jmp    e7a0 <hyperinterval::ieee::Format::affine+0x3d0>
    e757:	4c 89 e6             	mov    %r12,%rsi
    e75a:	4c 89 f8             	mov    %r15,%rax
    e75d:	4c 21 e0             	and    %r12,%rax
    e760:	31 c9                	xor    %ecx,%ecx
    e762:	48 f7 d8             	neg    %rax
    e765:	48 19 c9             	sbb    %rcx,%rcx
    e768:	48 83 c9 01          	or     $0x1,%rcx
    e76c:	4c 01 f9             	add    %r15,%rcx
    e76f:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    e774:	48 89 da             	mov    %rbx,%rdx
    e777:	e8 64 f6 ff ff       	call   dde0 <hyperinterval::ieee::Format::finite>
    e77c:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
    e781:	74 0c                	je     e78f <hyperinterval::ieee::Format::affine+0x3bf>
    e783:	4c 8b 34 24          	mov    (%rsp),%r14
    e787:	66 41 c7 06 01 03    	movw   $0x301,(%r14)
    e78d:	eb 15                	jmp    e7a4 <hyperinterval::ieee::Format::affine+0x3d4>
    e78f:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    e794:	4c 8b 34 24          	mov    (%rsp),%r14
    e798:	4d 89 7e 08          	mov    %r15,0x8(%r14)
    e79c:	49 89 46 10          	mov    %rax,0x10(%r14)
    e7a0:	41 c6 06 00          	movb   $0x0,(%r14)
    e7a4:	4c 89 f0             	mov    %r14,%rax
    e7a7:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
    e7ae:	5b                   	pop    %rbx
    e7af:	41 5c                	pop    %r12
    e7b1:	41 5d                	pop    %r13
    e7b3:	41 5e                	pop    %r14
    e7b5:	41 5f                	pop    %r15
    e7b7:	5d                   	pop    %rbp
    e7b8:	c3                   	ret
    e7b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

hyperinterval::ieee::Format::div:
    e7c0:	55                   	push   %rbp
    e7c1:	41 57                	push   %r15
    e7c3:	41 56                	push   %r14
    e7c5:	41 55                	push   %r13
    e7c7:	41 54                	push   %r12
    e7c9:	53                   	push   %rbx
    e7ca:	48 83 ec 48          	sub    $0x48,%rsp
    e7ce:	4d 85 c0             	test   %r8,%r8
    e7d1:	0f 84 cb 00 00 00    	je     e8a2 <hyperinterval::ieee::Format::div+0xe2>
    e7d7:	48 85 c9             	test   %rcx,%rcx
    e7da:	0f 84 cc 00 00 00    	je     e8ac <hyperinterval::ieee::Format::div+0xec>
    e7e0:	41 be 40 00 00 00    	mov    $0x40,%r14d
    e7e6:	f3 4c 0f bc f2       	tzcnt  %rdx,%r14
    e7eb:	49 89 cd             	mov    %rcx,%r13
    e7ee:	49 21 d5             	and    %rdx,%r13
    e7f1:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
    e7f6:	41 83 e6 3f          	and    $0x3f,%r14d
    e7fa:	48 89 c8             	mov    %rcx,%rax
    e7fd:	44 89 f1             	mov    %r14d,%ecx
    e800:	49 d3 ed             	shr    %cl,%r13
    e803:	41 ba 01 00 00 00    	mov    $0x1,%r10d
    e809:	49 d3 e2             	shl    %cl,%r10
    e80c:	4d 8d 5a ff          	lea    -0x1(%r10),%r11
    e810:	4c 89 db             	mov    %r11,%rbx
    e813:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    e818:	48 21 c3             	and    %rax,%rbx
    e81b:	4d 85 ed             	test   %r13,%r13
    e81e:	41 b9 01 00 00 00    	mov    $0x1,%r9d
    e824:	44 89 e8             	mov    %r13d,%eax
    e827:	41 0f 44 c1          	cmove  %r9d,%eax
    e82b:	4d 0f 45 ea          	cmovne %r10,%r13
    e82f:	4c 89 c5             	mov    %r8,%rbp
    e832:	48 21 d5             	and    %rdx,%rbp
    e835:	48 d3 ea             	shr    %cl,%rdx
    e838:	48 d3 ed             	shr    %cl,%rbp
    e83b:	49 09 dd             	or     %rbx,%r13
    e83e:	48 d1 ea             	shr    $1,%rdx
    e841:	4d 21 c3             	and    %r8,%r11
    e844:	48 85 ed             	test   %rbp,%rbp
    e847:	44 0f 45 cd          	cmovne %ebp,%r9d
    e84b:	49 0f 45 ea          	cmovne %r10,%rbp
    e84f:	4c 09 dd             	or     %r11,%rbp
    e852:	b9 7f 00 00 00       	mov    $0x7f,%ecx
    e857:	41 ba 7f 00 00 00    	mov    $0x7f,%r10d
    e85d:	4c 0f bd d5          	bsr    %rbp,%r10
    e861:	41 83 f2 3f          	xor    $0x3f,%r10d
    e865:	41 83 c2 40          	add    $0x40,%r10d
    e869:	49 0f bd cd          	bsr    %r13,%rcx
    e86d:	83 f1 3f             	xor    $0x3f,%ecx
    e870:	45 89 d7             	mov    %r10d,%r15d
    e873:	41 29 cf             	sub    %ecx,%r15d
    e876:	41 83 c7 c0          	add    $0xffffffc0,%r15d
    e87a:	78 3f                	js     e8bb <hyperinterval::ieee::Format::div+0xfb>
    e87c:	45 31 db             	xor    %r11d,%r11d
    e87f:	44 89 f9             	mov    %r15d,%ecx
    e882:	49 0f a5 eb          	shld   %cl,%rbp,%r11
    e886:	31 db                	xor    %ebx,%ebx
    e888:	49 89 ec             	mov    %rbp,%r12
    e88b:	49 d3 e4             	shl    %cl,%r12
    e88e:	41 f6 c7 40          	test   $0x40,%r15b
    e892:	4d 0f 45 dc          	cmovne %r12,%r11
    e896:	4c 0f 45 e3          	cmovne %rbx,%r12
    e89a:	4d 39 e5             	cmp    %r12,%r13
    e89d:	4c 19 db             	sbb    %r11,%rbx
    e8a0:	eb 3f                	jmp    e8e1 <hyperinterval::ieee::Format::div+0x121>
    e8a2:	66 c7 07 01 04       	movw   $0x401,(%rdi)
    e8a7:	e9 24 03 00 00       	jmp    ebd0 <hyperinterval::ieee::Format::div+0x410>
    e8ac:	c6 07 00             	movb   $0x0,(%rdi)
    e8af:	0f 57 c0             	xorps  %xmm0,%xmm0
    e8b2:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
    e8b6:	e9 15 03 00 00       	jmp    ebd0 <hyperinterval::ieee::Format::div+0x410>
    e8bb:	44 89 f9             	mov    %r15d,%ecx
    e8be:	f6 d9                	neg    %cl
    e8c0:	45 31 db             	xor    %r11d,%r11d
    e8c3:	4d 0f a5 eb          	shld   %cl,%r13,%r11
    e8c7:	31 db                	xor    %ebx,%ebx
    e8c9:	4d 89 ec             	mov    %r13,%r12
    e8cc:	49 d3 e4             	shl    %cl,%r12
    e8cf:	f6 c1 40             	test   $0x40,%cl
    e8d2:	4d 0f 45 dc          	cmovne %r12,%r11
    e8d6:	4c 0f 45 e3          	cmovne %rbx,%r12
    e8da:	49 39 ec             	cmp    %rbp,%r12
    e8dd:	49 83 db 00          	sbb    $0x0,%r11
    e8e1:	0f 92 c1             	setb   %cl
    e8e4:	44 29 c8             	sub    %r9d,%eax
    e8e7:	41 01 c7             	add    %eax,%r15d
    e8ea:	0f b6 c9             	movzbl %cl,%ecx
    e8ed:	41 29 cf             	sub    %ecx,%r15d
    e8f0:	41 39 d7             	cmp    %edx,%r15d
    e8f3:	0f 8f 19 02 00 00    	jg     eb12 <hyperinterval::ieee::Format::div+0x352>
    e8f9:	4c 8b 4c 24 10       	mov    0x10(%rsp),%r9
    e8fe:	46 8d 1c 0a          	lea    (%rdx,%r9,1),%r11d
    e902:	b9 01 00 00 00       	mov    $0x1,%ecx
    e907:	4c 89 5c 24 18       	mov    %r11,0x18(%rsp)
    e90c:	44 29 d9             	sub    %r11d,%ecx
    e90f:	45 29 cf             	sub    %r9d,%r15d
    e912:	41 39 cf             	cmp    %ecx,%r15d
    e915:	44 0f 4e f9          	cmovle %ecx,%r15d
    e919:	44 29 f8             	sub    %r15d,%eax
    e91c:	78 61                	js     e97f <hyperinterval::ieee::Format::div+0x1bf>
    e91e:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
    e923:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
    e928:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
    e92d:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
    e932:	48 85 ed             	test   %rbp,%rbp
    e935:	0f 84 a7 02 00 00    	je     ebe2 <hyperinterval::ieee::Format::div+0x422>
    e93b:	45 31 e4             	xor    %r12d,%r12d
    e93e:	89 c1                	mov    %eax,%ecx
    e940:	4d 0f a5 ec          	shld   %cl,%r13,%r12
    e944:	31 d2                	xor    %edx,%edx
    e946:	49 d3 e5             	shl    %cl,%r13
    e949:	a8 40                	test   $0x40,%al
    e94b:	4d 0f 45 e5          	cmovne %r13,%r12
    e94f:	4c 0f 45 ea          	cmovne %rdx,%r13
    e953:	4c 89 ef             	mov    %r13,%rdi
    e956:	4c 89 e6             	mov    %r12,%rsi
    e959:	48 89 ea             	mov    %rbp,%rdx
    e95c:	31 c9                	xor    %ecx,%ecx
    e95e:	ff 15 0c 16 05 00    	call   *0x5160c(%rip)        # 5ff70 <_GLOBAL_OFFSET_TABLE_+0x980>
    e964:	49 89 c2             	mov    %rax,%r10
    e967:	49 89 d1             	mov    %rdx,%r9
    e96a:	48 89 d1             	mov    %rdx,%rcx
    e96d:	48 0f af cd          	imul   %rbp,%rcx
    e971:	48 f7 e5             	mul    %rbp
    e974:	48 01 ca             	add    %rcx,%rdx
    e977:	49 29 c5             	sub    %rax,%r13
    e97a:	49 19 d4             	sbb    %rdx,%r12
    e97d:	eb 79                	jmp    e9f8 <hyperinterval::ieee::Format::div+0x238>
    e97f:	f7 d8                	neg    %eax
    e981:	44 39 d0             	cmp    %r10d,%eax
    e984:	7e 07                	jle    e98d <hyperinterval::ieee::Format::div+0x1cd>
    e986:	b3 01                	mov    $0x1,%bl
    e988:	e9 df 00 00 00       	jmp    ea6c <hyperinterval::ieee::Format::div+0x2ac>
    e98d:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
    e992:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
    e997:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
    e99c:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
    e9a1:	31 db                	xor    %ebx,%ebx
    e9a3:	89 c1                	mov    %eax,%ecx
    e9a5:	48 0f a5 eb          	shld   %cl,%rbp,%rbx
    e9a9:	48 d3 e5             	shl    %cl,%rbp
    e9ac:	31 c9                	xor    %ecx,%ecx
    e9ae:	a8 40                	test   $0x40,%al
    e9b0:	48 0f 45 dd          	cmovne %rbp,%rbx
    e9b4:	48 0f 45 e9          	cmovne %rcx,%rbp
    e9b8:	48 89 e8             	mov    %rbp,%rax
    e9bb:	48 09 d8             	or     %rbx,%rax
    e9be:	0f 84 2b 02 00 00    	je     ebef <hyperinterval::ieee::Format::div+0x42f>
    e9c4:	45 31 e4             	xor    %r12d,%r12d
    e9c7:	4c 89 ef             	mov    %r13,%rdi
    e9ca:	31 f6                	xor    %esi,%esi
    e9cc:	48 89 ea             	mov    %rbp,%rdx
    e9cf:	48 89 d9             	mov    %rbx,%rcx
    e9d2:	ff 15 98 15 05 00    	call   *0x51598(%rip)        # 5ff70 <_GLOBAL_OFFSET_TABLE_+0x980>
    e9d8:	49 89 c2             	mov    %rax,%r10
    e9db:	49 89 d1             	mov    %rdx,%r9
    e9de:	48 0f af d8          	imul   %rax,%rbx
    e9e2:	48 f7 e5             	mul    %rbp
    e9e5:	48 01 da             	add    %rbx,%rdx
    e9e8:	4c 89 c9             	mov    %r9,%rcx
    e9eb:	48 0f af cd          	imul   %rbp,%rcx
    e9ef:	48 01 d1             	add    %rdx,%rcx
    e9f2:	49 29 c5             	sub    %rax,%r13
    e9f5:	49 19 cc             	sbb    %rcx,%r12
    e9f8:	4d 09 e5             	or     %r12,%r13
    e9fb:	0f 95 c3             	setne  %bl
    e9fe:	4c 89 d0             	mov    %r10,%rax
    ea01:	4c 09 c8             	or     %r9,%rax
    ea04:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
    ea09:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
    ea0e:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
    ea13:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    ea18:	74 52                	je     ea6c <hyperinterval::ieee::Format::div+0x2ac>
    ea1a:	49 0f bd c1          	bsr    %r9,%rax
    ea1e:	83 f0 3f             	xor    $0x3f,%eax
    ea21:	4d 0f bd da          	bsr    %r10,%r11
    ea25:	41 83 f3 3f          	xor    $0x3f,%r11d
    ea29:	41 83 cb 40          	or     $0x40,%r11d
    ea2d:	4d 85 c9             	test   %r9,%r9
    ea30:	44 0f 45 d8          	cmovne %eax,%r11d
    ea34:	41 83 f3 7f          	xor    $0x7f,%r11d
    ea38:	43 8d 2c 3b          	lea    (%r11,%r15,1),%ebp
    ea3c:	39 d5                	cmp    %edx,%ebp
    ea3e:	0f 8f ce 00 00 00    	jg     eb12 <hyperinterval::ieee::Format::div+0x352>
    ea44:	b8 01 00 00 00       	mov    $0x1,%eax
    ea49:	29 d0                	sub    %edx,%eax
    ea4b:	39 c5                	cmp    %eax,%ebp
    ea4d:	7d 28                	jge    ea77 <hyperinterval::ieee::Format::div+0x2b7>
    ea4f:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    ea54:	42 8d 0c 38          	lea    (%rax,%r15,1),%ecx
    ea58:	fe c9                	dec    %cl
    ea5a:	4c 89 d0             	mov    %r10,%rax
    ea5d:	48 d3 e0             	shl    %cl,%rax
    ea60:	45 31 db             	xor    %r11d,%r11d
    ea63:	f6 c1 40             	test   $0x40,%cl
    ea66:	4c 0f 44 d8          	cmove  %rax,%r11
    ea6a:	eb 6e                	jmp    eada <hyperinterval::ieee::Format::div+0x31a>
    ea6c:	45 31 d2             	xor    %r10d,%r10d
    ea6f:	45 31 c9             	xor    %r9d,%r9d
    ea72:	45 31 db             	xor    %r11d,%r11d
    ea75:	eb 63                	jmp    eada <hyperinterval::ieee::Format::div+0x31a>
    ea77:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    ea7c:	89 c1                	mov    %eax,%ecx
    ea7e:	44 29 d9             	sub    %r11d,%ecx
    ea81:	4d 89 d4             	mov    %r10,%r12
    ea84:	49 d3 e4             	shl    %cl,%r12
    ea87:	89 c8                	mov    %ecx,%eax
    ea89:	f7 d8                	neg    %eax
    ea8b:	45 31 ed             	xor    %r13d,%r13d
    ea8e:	f6 c1 40             	test   $0x40,%cl
    ea91:	4d 0f 44 ec          	cmove  %r12,%r13
    ea95:	4d 89 d4             	mov    %r10,%r12
    ea98:	89 c1                	mov    %eax,%ecx
    ea9a:	4d 0f ad cc          	shrd   %cl,%r9,%r12
    ea9e:	88 5c 24 0f          	mov    %bl,0xf(%rsp)
    eaa2:	4c 89 cb             	mov    %r9,%rbx
    eaa5:	48 d3 eb             	shr    %cl,%rbx
    eaa8:	a8 40                	test   $0x40,%al
    eaaa:	49 0f 44 dc          	cmove  %r12,%rbx
    eaae:	44 39 5c 24 10       	cmp    %r11d,0x10(%rsp)
    eab3:	49 0f 43 dd          	cmovae %r13,%rbx
    eab7:	01 d5                	add    %edx,%ebp
    eab9:	48 63 c5             	movslq %ebp,%rax
    eabc:	44 89 f1             	mov    %r14d,%ecx
    eabf:	48 d3 e0             	shl    %cl,%rax
    eac2:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
    eac9:	49 d3 e3             	shl    %cl,%r11
    eacc:	49 f7 d3             	not    %r11
    eacf:	49 21 db             	and    %rbx,%r11
    ead2:	0f b6 5c 24 0f       	movzbl 0xf(%rsp),%ebx
    ead7:	49 09 c3             	or     %rax,%r11
    eada:	0f b6 db             	movzbl %bl,%ebx
    eadd:	4c 01 d3             	add    %r10,%rbx
    eae0:	49 83 d1 00          	adc    $0x0,%r9
    eae4:	48 89 d8             	mov    %rbx,%rax
    eae7:	4c 09 c8             	or     %r9,%rax
    eaea:	74 30                	je     eb1c <hyperinterval::ieee::Format::div+0x35c>
    eaec:	49 0f bd c1          	bsr    %r9,%rax
    eaf0:	83 f0 3f             	xor    $0x3f,%eax
    eaf3:	4c 0f bd d3          	bsr    %rbx,%r10
    eaf7:	41 83 f2 3f          	xor    $0x3f,%r10d
    eafb:	41 83 ca 40          	or     $0x40,%r10d
    eaff:	4d 85 c9             	test   %r9,%r9
    eb02:	44 0f 45 d0          	cmovne %eax,%r10d
    eb06:	41 83 f2 7f          	xor    $0x7f,%r10d
    eb0a:	43 8d 2c 3a          	lea    (%r10,%r15,1),%ebp
    eb0e:	39 d5                	cmp    %edx,%ebp
    eb10:	7e 0e                	jle    eb20 <hyperinterval::ieee::Format::div+0x360>
    eb12:	66 c7 07 01 03       	movw   $0x301,(%rdi)
    eb17:	e9 b4 00 00 00       	jmp    ebd0 <hyperinterval::ieee::Format::div+0x410>
    eb1c:	31 c0                	xor    %eax,%eax
    eb1e:	eb 76                	jmp    eb96 <hyperinterval::ieee::Format::div+0x3d6>
    eb20:	b8 01 00 00 00       	mov    $0x1,%eax
    eb25:	29 d0                	sub    %edx,%eax
    eb27:	39 c5                	cmp    %eax,%ebp
    eb29:	7d 18                	jge    eb43 <hyperinterval::ieee::Format::div+0x383>
    eb2b:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    eb30:	44 01 f9             	add    %r15d,%ecx
    eb33:	fe c9                	dec    %cl
    eb35:	48 d3 e3             	shl    %cl,%rbx
    eb38:	31 c0                	xor    %eax,%eax
    eb3a:	f6 c1 40             	test   $0x40,%cl
    eb3d:	48 0f 44 c3          	cmove  %rbx,%rax
    eb41:	eb 53                	jmp    eb96 <hyperinterval::ieee::Format::div+0x3d6>
    eb43:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
    eb48:	44 89 e9             	mov    %r13d,%ecx
    eb4b:	44 29 d1             	sub    %r10d,%ecx
    eb4e:	89 c8                	mov    %ecx,%eax
    eb50:	f7 d8                	neg    %eax
    eb52:	49 89 df             	mov    %rbx,%r15
    eb55:	49 d3 e7             	shl    %cl,%r15
    eb58:	45 31 e4             	xor    %r12d,%r12d
    eb5b:	f6 c1 40             	test   $0x40,%cl
    eb5e:	4d 0f 44 e7          	cmove  %r15,%r12
    eb62:	89 c1                	mov    %eax,%ecx
    eb64:	4c 0f ad cb          	shrd   %cl,%r9,%rbx
    eb68:	49 d3 e9             	shr    %cl,%r9
    eb6b:	a8 40                	test   $0x40,%al
    eb6d:	4c 0f 44 cb          	cmove  %rbx,%r9
    eb71:	45 39 d5             	cmp    %r10d,%r13d
    eb74:	4d 0f 43 cc          	cmovae %r12,%r9
    eb78:	01 d5                	add    %edx,%ebp
    eb7a:	48 63 d5             	movslq %ebp,%rdx
    eb7d:	44 89 f1             	mov    %r14d,%ecx
    eb80:	48 d3 e2             	shl    %cl,%rdx
    eb83:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    eb8a:	48 d3 e0             	shl    %cl,%rax
    eb8d:	48 f7 d0             	not    %rax
    eb90:	4c 21 c8             	and    %r9,%rax
    eb93:	48 09 d0             	or     %rdx,%rax
    eb96:	48 85 74 24 40       	test   %rsi,0x40(%rsp)
    eb9b:	0f 95 c1             	setne  %cl
    eb9e:	49 85 f0             	test   %rsi,%r8
    eba1:	0f 94 c2             	sete   %dl
    eba4:	30 ca                	xor    %cl,%dl
    eba6:	75 1d                	jne    ebc5 <hyperinterval::ieee::Format::div+0x405>
    eba8:	48 89 c1             	mov    %rax,%rcx
    ebab:	48 31 f1             	xor    %rsi,%rcx
    ebae:	48 85 c0             	test   %rax,%rax
    ebb1:	48 0f 44 c8          	cmove  %rax,%rcx
    ebb5:	4c 31 de             	xor    %r11,%rsi
    ebb8:	4d 85 db             	test   %r11,%r11
    ebbb:	49 0f 44 f3          	cmove  %r11,%rsi
    ebbf:	48 89 f0             	mov    %rsi,%rax
    ebc2:	49 89 cb             	mov    %rcx,%r11
    ebc5:	4c 89 5f 08          	mov    %r11,0x8(%rdi)
    ebc9:	48 89 47 10          	mov    %rax,0x10(%rdi)
    ebcd:	c6 07 00             	movb   $0x0,(%rdi)
    ebd0:	48 89 f8             	mov    %rdi,%rax
    ebd3:	48 83 c4 48          	add    $0x48,%rsp
    ebd7:	5b                   	pop    %rbx
    ebd8:	41 5c                	pop    %r12
    ebda:	41 5d                	pop    %r13
    ebdc:	41 5e                	pop    %r14
    ebde:	41 5f                	pop    %r15
    ebe0:	5d                   	pop    %rbp
    ebe1:	c3                   	ret
    ebe2:	48 8d 3d c7 df 04 00 	lea    0x4dfc7(%rip),%rdi        # 5cbb0 <__do_global_dtors_aux_fini_array_entry+0x2a0>
    ebe9:	ff 15 49 12 05 00    	call   *0x51249(%rip)        # 5fe38 <_GLOBAL_OFFSET_TABLE_+0x848>
    ebef:	48 8d 3d a2 df 04 00 	lea    0x4dfa2(%rip),%rdi        # 5cb98 <__do_global_dtors_aux_fini_array_entry+0x288>
    ebf6:	ff 15 3c 12 05 00    	call   *0x5123c(%rip)        # 5fe38 <_GLOBAL_OFFSET_TABLE_+0x848>
    ebfc:	0f 1f 40 00          	nopl   0x0(%rax)

hyperinterval::ieee::Format::power:
    ec00:	55                   	push   %rbp
    ec01:	41 57                	push   %r15
    ec03:	41 56                	push   %r14
    ec05:	41 55                	push   %r13
    ec07:	41 54                	push   %r12
    ec09:	53                   	push   %rbx
    ec0a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
    ec11:	48 89 cb             	mov    %rcx,%rbx
    ec14:	49 89 d6             	mov    %rdx,%r14
    ec17:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
    ec1c:	48 85 f1             	test   %rsi,%rcx
    ec1f:	0f 95 44 24 0f       	setne  0xf(%rsp)
    ec24:	b8 40 00 00 00       	mov    $0x40,%eax
    ec29:	f3 48 0f bc c2       	tzcnt  %rdx,%rax
    ec2e:	41 89 c2             	mov    %eax,%r10d
    ec31:	41 83 e2 3f          	and    $0x3f,%r10d
    ec35:	44 89 d1             	mov    %r10d,%ecx
    ec38:	48 d3 ea             	shr    %cl,%rdx
    ec3b:	48 89 d1             	mov    %rdx,%rcx
    ec3e:	48 d1 e9             	shr    $1,%rcx
    ec41:	4c 63 d9             	movslq %ecx,%r11
    ec44:	44 89 d1             	mov    %r10d,%ecx
    ec47:	49 d3 e3             	shl    %cl,%r11
    ec4a:	45 85 c0             	test   %r8d,%r8d
    ec4d:	44 89 44 24 70       	mov    %r8d,0x70(%rsp)
    ec52:	4c 89 5c 24 68       	mov    %r11,0x68(%rsp)
    ec57:	0f 84 55 03 00 00    	je     efb2 <hyperinterval::ieee::Format::power+0x3b2>
    ec5d:	41 b9 01 00 00 00    	mov    $0x1,%r9d
    ec63:	44 89 d1             	mov    %r10d,%ecx
    ec66:	49 d3 e1             	shl    %cl,%r9
    ec69:	48 8d 4e ff          	lea    -0x1(%rsi),%rcx
    ec6d:	48 21 cb             	and    %rcx,%rbx
    ec70:	4d 8d 79 ff          	lea    -0x1(%r9),%r15
    ec74:	44 8d 24 42          	lea    (%rdx,%rax,2),%r12d
    ec78:	41 83 e4 fe          	and    $0xfffffffe,%r12d
    ec7c:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    ec81:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
    ec86:	48 89 d9             	mov    %rbx,%rcx
    ec89:	44 89 c0             	mov    %r8d,%eax
    ec8c:	49 89 d8             	mov    %rbx,%r8
    ec8f:	4c 89 5c 24 10       	mov    %r11,0x10(%rsp)
    ec94:	49 89 cd             	mov    %rcx,%r13
    ec97:	4c 89 8c 24 88 00 00 	mov    %r9,0x88(%rsp)
    ec9e:	00 
    ec9f:	4c 89 94 24 80 00 00 	mov    %r10,0x80(%rsp)
    eca6:	00 
    eca7:	4c 89 7c 24 78       	mov    %r15,0x78(%rsp)
    ecac:	44 89 64 24 74       	mov    %r12d,0x74(%rsp)
    ecb1:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    ecb8:	0f 1f 84 00 00 00 00 
    ecbf:	00 
    ecc0:	a8 01                	test   $0x1,%al
    ecc2:	4c 89 84 24 90 00 00 	mov    %r8,0x90(%rsp)
    ecc9:	00 
    ecca:	89 44 24 24          	mov    %eax,0x24(%rsp)
    ecce:	0f 84 87 01 00 00    	je     ee5b <hyperinterval::ieee::Format::power+0x25b>
    ecd4:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
    ecd9:	4c 89 c2             	mov    %r8,%rdx
    ecdc:	4c 21 f2             	and    %r14,%rdx
    ecdf:	44 89 d1             	mov    %r10d,%ecx
    ece2:	48 d3 ea             	shr    %cl,%rdx
    ece5:	4c 89 c0             	mov    %r8,%rax
    ece8:	4c 21 f8             	and    %r15,%rax
    eceb:	48 85 d2             	test   %rdx,%rdx
    ecee:	41 89 d3             	mov    %edx,%r11d
    ecf1:	b9 01 00 00 00       	mov    $0x1,%ecx
    ecf6:	44 0f 44 d9          	cmove  %ecx,%r11d
    ecfa:	49 0f 45 d1          	cmovne %r9,%rdx
    ecfe:	48 09 c2             	or     %rax,%rdx
    ed01:	49 85 f0             	test   %rsi,%r8
    ed04:	0f 95 44 24 10       	setne  0x10(%rsp)
    ed09:	4c 89 e8             	mov    %r13,%rax
    ed0c:	4c 21 f0             	and    %r14,%rax
    ed0f:	44 89 d1             	mov    %r10d,%ecx
    ed12:	48 d3 e8             	shr    %cl,%rax
    ed15:	4c 89 e9             	mov    %r13,%rcx
    ed18:	4c 21 f9             	and    %r15,%rcx
    ed1b:	48 85 c0             	test   %rax,%rax
    ed1e:	41 89 c0             	mov    %eax,%r8d
    ed21:	bb 01 00 00 00       	mov    $0x1,%ebx
    ed26:	44 0f 44 c3          	cmove  %ebx,%r8d
    ed2a:	49 0f 45 c1          	cmovne %r9,%rax
    ed2e:	48 09 c8             	or     %rcx,%rax
    ed31:	49 85 f5             	test   %rsi,%r13
    ed34:	0f 95 c1             	setne  %cl
    ed37:	32 4c 24 10          	xor    0x10(%rsp),%cl
    ed3b:	48 f7 e2             	mul    %rdx
    ed3e:	45 29 e3             	sub    %r12d,%r11d
    ed41:	45 01 c3             	add    %r8d,%r11d
    ed44:	88 4c 24 54          	mov    %cl,0x54(%rsp)
    ed48:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
    ed4d:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    ed52:	44 89 5c 24 50       	mov    %r11d,0x50(%rsp)
    ed57:	4c 89 f2             	mov    %r14,%rdx
    ed5a:	48 89 e9             	mov    %rbp,%rcx
    ed5d:	4d 89 cc             	mov    %r9,%r12
    ed60:	48 89 f5             	mov    %rsi,%rbp
    ed63:	4c 89 f3             	mov    %r14,%rbx
    ed66:	4d 89 d6             	mov    %r10,%r14
    ed69:	e8 b2 f0 ff ff       	call   de20 <hyperinterval::ieee::Format::rounded>
    ed6e:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
    ed73:	0f 85 28 02 00 00    	jne    efa1 <hyperinterval::ieee::Format::power+0x3a1>
    ed79:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
    ed7e:	48 89 fa             	mov    %rdi,%rdx
    ed81:	48 21 da             	and    %rbx,%rdx
    ed84:	44 89 f1             	mov    %r14d,%ecx
    ed87:	48 d3 ea             	shr    %cl,%rdx
    ed8a:	48 89 f8             	mov    %rdi,%rax
    ed8d:	4c 21 f8             	and    %r15,%rax
    ed90:	48 85 d2             	test   %rdx,%rdx
    ed93:	89 d6                	mov    %edx,%esi
    ed95:	41 ba 01 00 00 00    	mov    $0x1,%r10d
    ed9b:	41 0f 44 f2          	cmove  %r10d,%esi
    ed9f:	49 0f 45 d4          	cmovne %r12,%rdx
    eda3:	48 09 c2             	or     %rax,%rdx
    eda6:	48 85 ef             	test   %rbp,%rdi
    eda9:	40 0f 95 c7          	setne  %dil
    edad:	4c 8b 8c 24 90 00 00 	mov    0x90(%rsp),%r9
    edb4:	00 
    edb5:	4c 89 c8             	mov    %r9,%rax
    edb8:	48 21 d8             	and    %rbx,%rax
    edbb:	48 d3 e8             	shr    %cl,%rax
    edbe:	4c 89 c9             	mov    %r9,%rcx
    edc1:	4c 21 f9             	and    %r15,%rcx
    edc4:	48 85 c0             	test   %rax,%rax
    edc7:	41 89 c0             	mov    %eax,%r8d
    edca:	45 0f 44 c2          	cmove  %r10d,%r8d
    edce:	49 0f 45 c4          	cmovne %r12,%rax
    edd2:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
    edd7:	48 09 c8             	or     %rcx,%rax
    edda:	49 85 e9             	test   %rbp,%r9
    eddd:	0f 95 c1             	setne  %cl
    ede0:	40 30 f9             	xor    %dil,%cl
    ede3:	48 f7 e2             	mul    %rdx
    ede6:	44 8b 64 24 74       	mov    0x74(%rsp),%r12d
    edeb:	44 29 e6             	sub    %r12d,%esi
    edee:	44 01 c6             	add    %r8d,%esi
    edf1:	88 4c 24 54          	mov    %cl,0x54(%rsp)
    edf5:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
    edfa:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    edff:	89 74 24 50          	mov    %esi,0x50(%rsp)
    ee03:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    ee08:	48 89 ee             	mov    %rbp,%rsi
    ee0b:	48 89 da             	mov    %rbx,%rdx
    ee0e:	48 8d 4c 24 40       	lea    0x40(%rsp),%rcx
    ee13:	e8 08 f0 ff ff       	call   de20 <hyperinterval::ieee::Format::rounded>
    ee18:	80 7c 24 28 01       	cmpb   $0x1,0x28(%rsp)
    ee1d:	0f 84 7e 01 00 00    	je     efa1 <hyperinterval::ieee::Format::power+0x3a1>
    ee23:	48 89 ee             	mov    %rbp,%rsi
    ee26:	49 89 de             	mov    %rbx,%r14
    ee29:	4c 89 7c 24 10       	mov    %r15,0x10(%rsp)
    ee2e:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
    ee33:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
    ee38:	4c 8b 8c 24 88 00 00 	mov    0x88(%rsp),%r9
    ee3f:	00 
    ee40:	4c 8b 94 24 80 00 00 	mov    0x80(%rsp),%r10
    ee47:	00 
    ee48:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
    ee4d:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    ee52:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
    ee57:	8b 44 24 24          	mov    0x24(%rsp),%eax
    ee5b:	83 f8 01             	cmp    $0x1,%eax
    ee5e:	ba 02 00 00 00       	mov    $0x2,%edx
    ee63:	0f 84 02 01 00 00    	je     ef6b <hyperinterval::ieee::Format::power+0x36b>
    ee69:	4c 89 e8             	mov    %r13,%rax
    ee6c:	4c 21 f0             	and    %r14,%rax
    ee6f:	44 89 d1             	mov    %r10d,%ecx
    ee72:	48 d3 e8             	shr    %cl,%rax
    ee75:	4d 21 fd             	and    %r15,%r13
    ee78:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
    ee7b:	48 85 c0             	test   %rax,%rax
    ee7e:	49 0f 45 c1          	cmovne %r9,%rax
    ee82:	0f 44 ca             	cmove  %edx,%ecx
    ee85:	4c 09 e8             	or     %r13,%rax
    ee88:	48 f7 e0             	mul    %rax
    ee8b:	44 29 e1             	sub    %r12d,%ecx
    ee8e:	c6 44 24 54 00       	movb   $0x0,0x54(%rsp)
    ee93:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
    ee98:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    ee9d:	89 4c 24 50          	mov    %ecx,0x50(%rsp)
    eea1:	4c 89 f2             	mov    %r14,%rdx
    eea4:	48 89 e9             	mov    %rbp,%rcx
    eea7:	44 89 e5             	mov    %r12d,%ebp
    eeaa:	4d 89 cc             	mov    %r9,%r12
    eead:	4d 89 fd             	mov    %r15,%r13
    eeb0:	49 89 f7             	mov    %rsi,%r15
    eeb3:	4c 89 f3             	mov    %r14,%rbx
    eeb6:	4d 89 d6             	mov    %r10,%r14
    eeb9:	e8 62 ef ff ff       	call   de20 <hyperinterval::ieee::Format::rounded>
    eebe:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
    eec3:	0f 85 d8 00 00 00    	jne    efa1 <hyperinterval::ieee::Format::power+0x3a1>
    eec9:	48 8b 94 24 90 00 00 	mov    0x90(%rsp),%rdx
    eed0:	00 
    eed1:	48 89 d0             	mov    %rdx,%rax
    eed4:	48 21 d8             	and    %rbx,%rax
    eed7:	44 89 f1             	mov    %r14d,%ecx
    eeda:	48 d3 e8             	shr    %cl,%rax
    eedd:	4c 21 ea             	and    %r13,%rdx
    eee0:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
    eee3:	48 85 c0             	test   %rax,%rax
    eee6:	49 0f 45 c4          	cmovne %r12,%rax
    eeea:	be 02 00 00 00       	mov    $0x2,%esi
    eeef:	0f 44 ce             	cmove  %esi,%ecx
    eef2:	48 09 d0             	or     %rdx,%rax
    eef5:	48 f7 e0             	mul    %rax
    eef8:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
    eefd:	29 e9                	sub    %ebp,%ecx
    eeff:	c6 44 24 54 00       	movb   $0x0,0x54(%rsp)
    ef04:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
    ef09:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    ef0e:	89 4c 24 50          	mov    %ecx,0x50(%rsp)
    ef12:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    ef17:	4c 89 fe             	mov    %r15,%rsi
    ef1a:	48 89 da             	mov    %rbx,%rdx
    ef1d:	48 8d 4c 24 40       	lea    0x40(%rsp),%rcx
    ef22:	e8 f9 ee ff ff       	call   de20 <hyperinterval::ieee::Format::rounded>
    ef27:	80 7c 24 28 01       	cmpb   $0x1,0x28(%rsp)
    ef2c:	74 73                	je     efa1 <hyperinterval::ieee::Format::power+0x3a1>
    ef2e:	4c 89 fe             	mov    %r15,%rsi
    ef31:	49 89 de             	mov    %rbx,%r14
    ef34:	41 89 ec             	mov    %ebp,%r12d
    ef37:	8b 4c 24 24          	mov    0x24(%rsp),%ecx
    ef3b:	89 c8                	mov    %ecx,%eax
    ef3d:	d1 e8                	shr    $1,%eax
    ef3f:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
    ef44:	85 c9                	test   %ecx,%ecx
    ef46:	4c 8b 8c 24 88 00 00 	mov    0x88(%rsp),%r9
    ef4d:	00 
    ef4e:	4c 8b 94 24 80 00 00 	mov    0x80(%rsp),%r10
    ef55:	00 
    ef56:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
    ef5b:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    ef60:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
    ef65:	0f 85 55 fd ff ff    	jne    ecc0 <hyperinterval::ieee::Format::power+0xc0>
    ef6b:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
    ef70:	22 44 24 70          	and    0x70(%rsp),%al
    ef74:	74 4c                	je     efc2 <hyperinterval::ieee::Format::power+0x3c2>
    ef76:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
    ef7b:	48 89 c8             	mov    %rcx,%rax
    ef7e:	48 31 f0             	xor    %rsi,%rax
    ef81:	48 85 c9             	test   %rcx,%rcx
    ef84:	48 0f 44 c1          	cmove  %rcx,%rax
    ef88:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    ef8d:	48 31 ce             	xor    %rcx,%rsi
    ef90:	48 85 c9             	test   %rcx,%rcx
    ef93:	48 0f 44 f1          	cmove  %rcx,%rsi
    ef97:	48 89 c1             	mov    %rax,%rcx
    ef9a:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    ef9f:	eb 30                	jmp    efd1 <hyperinterval::ieee::Format::power+0x3d1>
    efa1:	0f b6 4c 24 29       	movzbl 0x29(%rsp),%ecx
    efa6:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    efab:	88 48 01             	mov    %cl,0x1(%rax)
    efae:	b1 01                	mov    $0x1,%cl
    efb0:	eb 29                	jmp    efdb <hyperinterval::ieee::Format::power+0x3db>
    efb2:	4c 89 5c 24 10       	mov    %r11,0x10(%rsp)
    efb7:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
    efbc:	22 44 24 70          	and    0x70(%rsp),%al
    efc0:	75 b4                	jne    ef76 <hyperinterval::ieee::Format::power+0x376>
    efc2:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    efc7:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
    efcc:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    efd1:	48 89 48 08          	mov    %rcx,0x8(%rax)
    efd5:	48 89 70 10          	mov    %rsi,0x10(%rax)
    efd9:	31 c9                	xor    %ecx,%ecx
    efdb:	88 08                	mov    %cl,(%rax)
    efdd:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
    efe4:	5b                   	pop    %rbx
    efe5:	41 5c                	pop    %r12
    efe7:	41 5d                	pop    %r13
    efe9:	41 5e                	pop    %r14
    efeb:	41 5f                	pop    %r15
    efed:	5d                   	pop    %rbp
    efee:	c3                   	ret
    efef:	90                   	nop

__udivti3:
   4c460:	49 89 d0             	mov    %rdx,%r8
   4c463:	48 85 c9             	test   %rcx,%rcx
   4c466:	74 7b                	je     4c4e3 <__udivti3+0x83>
   4c468:	55                   	push   %rbp
   4c469:	48 89 e5             	mov    %rsp,%rbp
   4c46c:	53                   	push   %rbx
   4c46d:	4c 0f bd c9          	bsr    %rcx,%r9
   4c471:	44 89 ca             	mov    %r9d,%edx
   4c474:	83 f2 3f             	xor    $0x3f,%edx
   4c477:	b0 40                	mov    $0x40,%al
   4c479:	28 d0                	sub    %dl,%al
   4c47b:	4c 89 c2             	mov    %r8,%rdx
   4c47e:	49 89 cb             	mov    %rcx,%r11
   4c481:	89 c1                	mov    %eax,%ecx
   4c483:	4c 0f ad da          	shrd   %cl,%r11,%rdx
   4c487:	4d 89 da             	mov    %r11,%r10
   4c48a:	49 d3 ea             	shr    %cl,%r10
   4c48d:	a8 40                	test   $0x40,%al
   4c48f:	4c 0f 44 d2          	cmove  %rdx,%r10
   4c493:	48 89 f0             	mov    %rsi,%rax
   4c496:	48 0f a4 f8 3f       	shld   $0x3f,%rdi,%rax
   4c49b:	48 89 f2             	mov    %rsi,%rdx
   4c49e:	48 d1 ea             	shr    $1,%rdx
   4c4a1:	49 f7 f2             	div    %r10
   4c4a4:	49 89 c2             	mov    %rax,%r10
   4c4a7:	44 89 c9             	mov    %r9d,%ecx
   4c4aa:	49 d3 ea             	shr    %cl,%r10
   4c4ad:	31 c9                	xor    %ecx,%ecx
   4c4af:	49 83 ea 01          	sub    $0x1,%r10
   4c4b3:	4c 0f 42 d1          	cmovb  %rcx,%r10
   4c4b7:	4c 89 db             	mov    %r11,%rbx
   4c4ba:	4c 89 c0             	mov    %r8,%rax
   4c4bd:	49 f7 e2             	mul    %r10
   4c4c0:	49 89 c1             	mov    %rax,%r9
   4c4c3:	4c 89 d0             	mov    %r10,%rax
   4c4c6:	49 0f af da          	imul   %r10,%rbx
   4c4ca:	48 01 da             	add    %rbx,%rdx
   4c4cd:	4c 29 cf             	sub    %r9,%rdi
   4c4d0:	48 19 d6             	sbb    %rdx,%rsi
   4c4d3:	4c 39 c7             	cmp    %r8,%rdi
   4c4d6:	4c 19 de             	sbb    %r11,%rsi
   4c4d9:	48 83 d8 ff          	sbb    $0xffffffffffffffff,%rax
   4c4dd:	5b                   	pop    %rbx
   4c4de:	5d                   	pop    %rbp
   4c4df:	48 89 ca             	mov    %rcx,%rdx
   4c4e2:	c3                   	ret
   4c4e3:	4c 39 c6             	cmp    %r8,%rsi
   4c4e6:	73 0f                	jae    4c4f7 <__udivti3+0x97>
   4c4e8:	48 89 f8             	mov    %rdi,%rax
   4c4eb:	48 89 f2             	mov    %rsi,%rdx
   4c4ee:	49 f7 f0             	div    %r8
   4c4f1:	31 c9                	xor    %ecx,%ecx
   4c4f3:	48 89 ca             	mov    %rcx,%rdx
   4c4f6:	c3                   	ret
   4c4f7:	48 89 f0             	mov    %rsi,%rax
   4c4fa:	4c 09 c0             	or     %r8,%rax
   4c4fd:	48 c1 e8 20          	shr    $0x20,%rax
   4c501:	74 15                	je     4c518 <__udivti3+0xb8>
   4c503:	48 89 f0             	mov    %rsi,%rax
   4c506:	31 d2                	xor    %edx,%edx
   4c508:	49 f7 f0             	div    %r8
   4c50b:	48 89 c1             	mov    %rax,%rcx
   4c50e:	48 89 f8             	mov    %rdi,%rax
   4c511:	49 f7 f0             	div    %r8
   4c514:	48 89 ca             	mov    %rcx,%rdx
   4c517:	c3                   	ret
   4c518:	89 f0                	mov    %esi,%eax
   4c51a:	31 d2                	xor    %edx,%edx
   4c51c:	41 f7 f0             	div    %r8d
   4c51f:	89 c1                	mov    %eax,%ecx
   4c521:	48 89 f8             	mov    %rdi,%rax
   4c524:	49 f7 f0             	div    %r8
   4c527:	48 89 ca             	mov    %rcx,%rdx
   4c52a:	c3                   	ret

Disassembly of section .fini:
