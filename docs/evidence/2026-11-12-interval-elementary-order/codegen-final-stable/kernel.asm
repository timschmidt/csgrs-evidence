<hyperinterval::float::F64Enclosure>::abs:
   175a0:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   175a4:	75 33                	jne    175d9 <<hyperinterval::float::F64Enclosure>::abs+0x39>
   175a6:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   175aa:	48 ba ff ff ff ff ff 	movabs $0x7fffffffffffffff,%rdx
   175b1:	ff ff 7f 
   175b4:	48 85 c9             	test   %rcx,%rcx
   175b7:	41 0f 99 c0          	setns  %r8b
   175bb:	48 89 c8             	mov    %rcx,%rax
   175be:	48 21 d0             	and    %rdx,%rax
   175c1:	41 0f 94 c1          	sete   %r9b
   175c5:	45 08 c1             	or     %r8b,%r9b
   175c8:	74 17                	je     175e1 <<hyperinterval::float::F64Enclosure>::abs+0x41>
   175ca:	48 8b 46 10          	mov    0x10(%rsi),%rax
   175ce:	48 89 47 10          	mov    %rax,0x10(%rdi)
   175d2:	0f 10 06             	movups (%rsi),%xmm0
   175d5:	0f 11 07             	movups %xmm0,(%rdi)
   175d8:	c3                   	ret
   175d9:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
   175e0:	c3                   	ret
   175e1:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   175e5:	48 85 f6             	test   %rsi,%rsi
   175e8:	41 0f 98 c1          	sets   %r9b
   175ec:	49 89 f0             	mov    %rsi,%r8
   175ef:	49 21 d0             	and    %rdx,%r8
   175f2:	41 0f 95 c2          	setne  %r10b
   175f6:	45 84 d1             	test   %r10b,%r9b
   175f9:	74 10                	je     1760b <<hyperinterval::float::F64Enclosure>::abs+0x6b>
   175fb:	48 c7 07 01 00 00 00 	movq   $0x1,(%rdi)
   17602:	4c 89 47 08          	mov    %r8,0x8(%rdi)
   17606:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1760a:	c3                   	ret
   1760b:	49 f7 d8             	neg    %r8
   1760e:	48 85 f6             	test   %rsi,%rsi
   17611:	4c 8d 4c 16 01       	lea    0x1(%rsi,%rdx,1),%r9
   17616:	4a 8d 54 02 01       	lea    0x1(%rdx,%r8,1),%rdx
   1761b:	49 0f 49 d1          	cmovns %r9,%rdx
   1761f:	48 39 d1             	cmp    %rdx,%rcx
   17622:	48 0f 46 c6          	cmovbe %rsi,%rax
   17626:	48 c7 07 01 00 00 00 	movq   $0x1,(%rdi)
   1762d:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
   17634:	00 
   17635:	48 89 47 10          	mov    %rax,0x10(%rdi)
   17639:	c3                   	ret
   1763a:	cc                   	int3
   1763b:	cc                   	int3
   1763c:	cc                   	int3
   1763d:	cc                   	int3
   1763e:	cc                   	int3
   1763f:	cc                   	int3

hyperinterval_strict_chain32:
   17670:	53                   	push   %rbx
   17671:	48 83 ec 60          	sub    $0x60,%rsp
   17675:	48 89 fb             	mov    %rdi,%rbx
   17678:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   1767d:	ff 15 65 4f 04 00    	call   *0x44f65(%rip)        # 5c5e8 <_DYNAMIC+0x2b0>
   17683:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   17687:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   1768c:	83 f9 02             	cmp    $0x2,%ecx
   1768f:	0f 84 f4 00 00 00    	je     17789 <hyperinterval_strict_chain32+0x119>
   17695:	8b 54 24 11          	mov    0x11(%rsp),%edx
   17699:	8b 74 24 14          	mov    0x14(%rsp),%esi
   1769d:	89 74 24 5c          	mov    %esi,0x5c(%rsp)
   176a1:	89 54 24 59          	mov    %edx,0x59(%rsp)
   176a5:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
   176a9:	88 44 24 58          	mov    %al,0x58(%rsp)
   176ad:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   176b2:	48 8d 74 24 54       	lea    0x54(%rsp),%rsi
   176b7:	f3 0f 10 05 09 e5 fe 	movss  -0x11af7(%rip),%xmm0        # 5bc8 <__abi_tag+0x58cc>
   176be:	ff 
   176bf:	f3 0f 10 0d f9 e4 fe 	movss  -0x11b07(%rip),%xmm1        # 5bc0 <__abi_tag+0x58c4>
   176c6:	ff 
   176c7:	ff 15 23 4f 04 00    	call   *0x44f23(%rip)        # 5c5f0 <_DYNAMIC+0x2b8>
   176cd:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
   176d1:	0f b6 44 24 1c       	movzbl 0x1c(%rsp),%eax
   176d6:	83 f9 02             	cmp    $0x2,%ecx
   176d9:	0f 84 aa 00 00 00    	je     17789 <hyperinterval_strict_chain32+0x119>
   176df:	8b 54 24 1d          	mov    0x1d(%rsp),%edx
   176e3:	8b 74 24 20          	mov    0x20(%rsp),%esi
   176e7:	89 74 24 50          	mov    %esi,0x50(%rsp)
   176eb:	89 54 24 4d          	mov    %edx,0x4d(%rsp)
   176ef:	89 4c 24 48          	mov    %ecx,0x48(%rsp)
   176f3:	88 44 24 4c          	mov    %al,0x4c(%rsp)
   176f7:	48 8d 7c 24 3c       	lea    0x3c(%rsp),%rdi
   176fc:	48 8d 74 24 48       	lea    0x48(%rsp),%rsi
   17701:	ff 15 f1 4e 04 00    	call   *0x44ef1(%rip)        # 5c5f8 <_DYNAMIC+0x2c0>
   17707:	8b 4c 24 3c          	mov    0x3c(%rsp),%ecx
   1770b:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   17710:	83 f9 02             	cmp    $0x2,%ecx
   17713:	74 74                	je     17789 <hyperinterval_strict_chain32+0x119>
   17715:	8b 54 24 41          	mov    0x41(%rsp),%edx
   17719:	8b 74 24 44          	mov    0x44(%rsp),%esi
   1771d:	89 74 24 38          	mov    %esi,0x38(%rsp)
   17721:	89 54 24 35          	mov    %edx,0x35(%rsp)
   17725:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   17729:	88 44 24 34          	mov    %al,0x34(%rsp)
   1772d:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   17732:	f3 0f 10 05 5a e4 fe 	movss  -0x11ba6(%rip),%xmm0        # 5b94 <__abi_tag+0x5898>
   17739:	ff 
   1773a:	ff 15 c0 4e 04 00    	call   *0x44ec0(%rip)        # 5c600 <_DYNAMIC+0x2c8>
   17740:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   17744:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   17749:	83 f9 02             	cmp    $0x2,%ecx
   1774c:	74 3b                	je     17789 <hyperinterval_strict_chain32+0x119>
   1774e:	8b 54 24 11          	mov    0x11(%rsp),%edx
   17752:	8b 74 24 14          	mov    0x14(%rsp),%esi
   17756:	89 74 24 20          	mov    %esi,0x20(%rsp)
   1775a:	89 54 24 1d          	mov    %edx,0x1d(%rsp)
   1775e:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
   17762:	88 44 24 1c          	mov    %al,0x1c(%rsp)
   17766:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
   1776b:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   17770:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
   17775:	ff 15 8d 4e 04 00    	call   *0x44e8d(%rip)        # 5c608 <_DYNAMIC+0x2d0>
   1777b:	8b 4c 24 24          	mov    0x24(%rsp),%ecx
   1777f:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   17784:	83 f9 02             	cmp    $0x2,%ecx
   17787:	75 12                	jne    1779b <hyperinterval_strict_chain32+0x12b>
   17789:	88 43 04             	mov    %al,0x4(%rbx)
   1778c:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17792:	48 89 d8             	mov    %rbx,%rax
   17795:	48 83 c4 60          	add    $0x60,%rsp
   17799:	5b                   	pop    %rbx
   1779a:	c3                   	ret
   1779b:	8b 54 24 29          	mov    0x29(%rsp),%edx
   1779f:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
   177a3:	89 74 24 14          	mov    %esi,0x14(%rsp)
   177a7:	89 54 24 11          	mov    %edx,0x11(%rsp)
   177ab:	89 4c 24 0c          	mov    %ecx,0xc(%rsp)
   177af:	88 44 24 10          	mov    %al,0x10(%rsp)
   177b3:	48 8d 74 24 0c       	lea    0xc(%rsp),%rsi
   177b8:	48 89 df             	mov    %rbx,%rdi
   177bb:	ff 15 4f 4e 04 00    	call   *0x44e4f(%rip)        # 5c610 <_DYNAMIC+0x2d8>
   177c1:	48 89 d8             	mov    %rbx,%rax
   177c4:	48 83 c4 60          	add    $0x60,%rsp
   177c8:	5b                   	pop    %rbx
   177c9:	c3                   	ret
   177ca:	cc                   	int3
   177cb:	cc                   	int3
   177cc:	cc                   	int3
   177cd:	cc                   	int3
   177ce:	cc                   	int3
   177cf:	cc                   	int3

hyperinterval_strict_chain64:
   177d0:	53                   	push   %rbx
   177d1:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
   177d8:	48 89 fb             	mov    %rdi,%rbx
   177db:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   177e0:	ff 15 32 4e 04 00    	call   *0x44e32(%rip)        # 5c618 <_DYNAMIC+0x2e0>
   177e6:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   177eb:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   177f0:	48 83 f9 02          	cmp    $0x2,%rcx
   177f4:	0f 84 32 01 00 00    	je     1792c <hyperinterval_strict_chain64+0x15c>
   177fa:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   177ff:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   17804:	48 89 b4 24 a8 00 00 	mov    %rsi,0xa8(%rsp)
   1780b:	00 
   1780c:	48 89 94 24 a1 00 00 	mov    %rdx,0xa1(%rsp)
   17813:	00 
   17814:	48 89 8c 24 98 00 00 	mov    %rcx,0x98(%rsp)
   1781b:	00 
   1781c:	88 84 24 a0 00 00 00 	mov    %al,0xa0(%rsp)
   17823:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   17828:	48 8d b4 24 98 00 00 	lea    0x98(%rsp),%rsi
   1782f:	00 
   17830:	f2 0f 10 05 18 e3 fe 	movsd  -0x11ce8(%rip),%xmm0        # 5b50 <__abi_tag+0x5854>
   17837:	ff 
   17838:	f2 0f 10 0d 20 e3 fe 	movsd  -0x11ce0(%rip),%xmm1        # 5b60 <__abi_tag+0x5864>
   1783f:	ff 
   17840:	ff 15 da 4d 04 00    	call   *0x44dda(%rip)        # 5c620 <_DYNAMIC+0x2e8>
   17846:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1784b:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   17850:	48 83 f9 02          	cmp    $0x2,%rcx
   17854:	0f 84 d2 00 00 00    	je     1792c <hyperinterval_strict_chain64+0x15c>
   1785a:	48 8b 54 24 29       	mov    0x29(%rsp),%rdx
   1785f:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   17864:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
   1786b:	00 
   1786c:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
   17873:	00 
   17874:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
   1787b:	00 
   1787c:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
   17883:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
   17888:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   1788f:	00 
   17890:	ff 15 92 4d 04 00    	call   *0x44d92(%rip)        # 5c628 <_DYNAMIC+0x2f0>
   17896:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
   1789b:	0f b6 44 24 70       	movzbl 0x70(%rsp),%eax
   178a0:	48 83 f9 02          	cmp    $0x2,%rcx
   178a4:	0f 84 82 00 00 00    	je     1792c <hyperinterval_strict_chain64+0x15c>
   178aa:	48 8b 54 24 71       	mov    0x71(%rsp),%rdx
   178af:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
   178b4:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   178b9:	48 89 54 24 59       	mov    %rdx,0x59(%rsp)
   178be:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
   178c3:	88 44 24 58          	mov    %al,0x58(%rsp)
   178c7:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   178cc:	f2 0f 10 05 6c e2 fe 	movsd  -0x11d94(%rip),%xmm0        # 5b40 <__abi_tag+0x5844>
   178d3:	ff 
   178d4:	ff 15 56 4d 04 00    	call   *0x44d56(%rip)        # 5c630 <_DYNAMIC+0x2f8>
   178da:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   178df:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   178e4:	48 83 f9 02          	cmp    $0x2,%rcx
   178e8:	74 42                	je     1792c <hyperinterval_strict_chain64+0x15c>
   178ea:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   178ef:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   178f4:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   178f9:	48 89 54 24 29       	mov    %rdx,0x29(%rsp)
   178fe:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   17903:	88 44 24 28          	mov    %al,0x28(%rsp)
   17907:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1790c:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   17911:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
   17916:	ff 15 1c 4d 04 00    	call   *0x44d1c(%rip)        # 5c638 <_DYNAMIC+0x300>
   1791c:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   17921:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   17926:	48 83 f9 02          	cmp    $0x2,%rcx
   1792a:	75 16                	jne    17942 <hyperinterval_strict_chain64+0x172>
   1792c:	88 43 08             	mov    %al,0x8(%rbx)
   1792f:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   17936:	48 89 d8             	mov    %rbx,%rax
   17939:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   17940:	5b                   	pop    %rbx
   17941:	c3                   	ret
   17942:	48 8b 54 24 41       	mov    0x41(%rsp),%rdx
   17947:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
   1794c:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
   17951:	48 89 54 24 11       	mov    %rdx,0x11(%rsp)
   17956:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   1795b:	88 44 24 10          	mov    %al,0x10(%rsp)
   1795f:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
   17964:	48 89 df             	mov    %rbx,%rdi
   17967:	ff 15 d3 4c 04 00    	call   *0x44cd3(%rip)        # 5c640 <_DYNAMIC+0x308>
   1796d:	48 89 d8             	mov    %rbx,%rax
   17970:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   17977:	5b                   	pop    %rbx
   17978:	c3                   	ret
   17979:	cc                   	int3
   1797a:	cc                   	int3
   1797b:	cc                   	int3
   1797c:	cc                   	int3
   1797d:	cc                   	int3
   1797e:	cc                   	int3
   1797f:	cc                   	int3

hyperinterval_strict_surface32:
   17980:	55                   	push   %rbp
   17981:	41 57                	push   %r15
   17983:	41 56                	push   %r14
   17985:	41 55                	push   %r13
   17987:	41 54                	push   %r12
   17989:	53                   	push   %rbx
   1798a:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
   17991:	89 f5                	mov    %esi,%ebp
   17993:	48 89 fb             	mov    %rdi,%rbx
   17996:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1799b:	66 0f 7e 44 24 3c    	movd   %xmm0,0x3c(%rsp)
   179a1:	66 0f 7e 4c 24 2c    	movd   %xmm1,0x2c(%rsp)
   179a7:	ff 15 3b 4c 04 00    	call   *0x44c3b(%rip)        # 5c5e8 <_DYNAMIC+0x2b0>
   179ad:	44 8b 6c 24 08       	mov    0x8(%rsp),%r13d
   179b2:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   179b7:	41 83 fd 02          	cmp    $0x2,%r13d
   179bb:	75 0e                	jne    179cb <hyperinterval_strict_surface32+0x4b>
   179bd:	88 43 04             	mov    %al,0x4(%rbx)
   179c0:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   179c6:	e9 8a 00 00 00       	jmp    17a55 <hyperinterval_strict_surface32+0xd5>
   179cb:	49 89 df             	mov    %rbx,%r15
   179ce:	8b 4c 24 0d          	mov    0xd(%rsp),%ecx
   179d2:	8b 54 24 10          	mov    0x10(%rsp),%edx
   179d6:	89 54 24 48          	mov    %edx,0x48(%rsp)
   179da:	89 4c 24 45          	mov    %ecx,0x45(%rsp)
   179de:	44 89 6c 24 40       	mov    %r13d,0x40(%rsp)
   179e3:	88 44 24 44          	mov    %al,0x44(%rsp)
   179e7:	66 0f 6e 44 24 3c    	movd   0x3c(%rsp),%xmm0
   179ed:	ff 15 55 4c 04 00    	call   *0x44c55(%rip)        # 5c648 <_DYNAMIC+0x310>
   179f3:	48 89 c3             	mov    %rax,%rbx
   179f6:	f6 c3 01             	test   $0x1,%bl
   179f9:	74 0b                	je     17a06 <hyperinterval_strict_surface32+0x86>
   179fb:	4c 89 f8             	mov    %r15,%rax
   179fe:	88 78 04             	mov    %bh,0x4(%rax)
   17a01:	4c 89 fb             	mov    %r15,%rbx
   17a04:	eb 48                	jmp    17a4e <hyperinterval_strict_surface32+0xce>
   17a06:	66 0f 6e 44 24 2c    	movd   0x2c(%rsp),%xmm0
   17a0c:	ff 15 3e 4c 04 00    	call   *0x44c3e(%rip)        # 5c650 <_DYNAMIC+0x318>
   17a12:	a8 01                	test   $0x1,%al
   17a14:	74 08                	je     17a1e <hyperinterval_strict_surface32+0x9e>
   17a16:	4c 89 fb             	mov    %r15,%rbx
   17a19:	88 63 04             	mov    %ah,0x4(%rbx)
   17a1c:	eb 30                	jmp    17a4e <hyperinterval_strict_surface32+0xce>
   17a1e:	48 c1 eb 20          	shr    $0x20,%rbx
   17a22:	66 0f 6e c3          	movd   %ebx,%xmm0
   17a26:	48 c1 e8 20          	shr    $0x20,%rax
   17a2a:	66 0f 6e c8          	movd   %eax,%xmm1
   17a2e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17a33:	ff 15 af 4b 04 00    	call   *0x44baf(%rip)        # 5c5e8 <_DYNAMIC+0x2b0>
   17a39:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17a3d:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   17a42:	83 f9 02             	cmp    $0x2,%ecx
   17a45:	75 23                	jne    17a6a <hyperinterval_strict_surface32+0xea>
   17a47:	4c 89 fb             	mov    %r15,%rbx
   17a4a:	41 88 47 04          	mov    %al,0x4(%r15)
   17a4e:	41 c7 07 02 00 00 00 	movl   $0x2,(%r15)
   17a55:	48 89 d8             	mov    %rbx,%rax
   17a58:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
   17a5f:	5b                   	pop    %rbx
   17a60:	41 5c                	pop    %r12
   17a62:	41 5d                	pop    %r13
   17a64:	41 5e                	pop    %r14
   17a66:	41 5f                	pop    %r15
   17a68:	5d                   	pop    %rbp
   17a69:	c3                   	ret
   17a6a:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   17a6e:	8b 74 24 10          	mov    0x10(%rsp),%esi
   17a72:	89 74 24 60          	mov    %esi,0x60(%rsp)
   17a76:	89 54 24 5d          	mov    %edx,0x5d(%rsp)
   17a7a:	89 4c 24 58          	mov    %ecx,0x58(%rsp)
   17a7e:	88 44 24 5c          	mov    %al,0x5c(%rsp)
   17a82:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17a87:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
   17a8c:	89 ea                	mov    %ebp,%edx
   17a8e:	ff 15 c4 4b 04 00    	call   *0x44bc4(%rip)        # 5c658 <_DYNAMIC+0x320>
   17a94:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17a98:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   17a9d:	83 f9 02             	cmp    $0x2,%ecx
   17aa0:	4c 89 fb             	mov    %r15,%rbx
   17aa3:	0f 84 14 ff ff ff    	je     179bd <hyperinterval_strict_surface32+0x3d>
   17aa9:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   17aad:	8b 74 24 10          	mov    0x10(%rsp),%esi
   17ab1:	89 74 24 78          	mov    %esi,0x78(%rsp)
   17ab5:	89 54 24 75          	mov    %edx,0x75(%rsp)
   17ab9:	89 4c 24 70          	mov    %ecx,0x70(%rsp)
   17abd:	88 44 24 74          	mov    %al,0x74(%rsp)
   17ac1:	48 8d 7c 24 4c       	lea    0x4c(%rsp),%rdi
   17ac6:	48 8d 74 24 70       	lea    0x70(%rsp),%rsi
   17acb:	ff 15 8f 4b 04 00    	call   *0x44b8f(%rip)        # 5c660 <_DYNAMIC+0x328>
   17ad1:	8b 4c 24 4c          	mov    0x4c(%rsp),%ecx
   17ad5:	0f b6 44 24 50       	movzbl 0x50(%rsp),%eax
   17ada:	83 f9 02             	cmp    $0x2,%ecx
   17add:	0f 84 da fe ff ff    	je     179bd <hyperinterval_strict_surface32+0x3d>
   17ae3:	8b 54 24 51          	mov    0x51(%rsp),%edx
   17ae7:	8b 74 24 54          	mov    0x54(%rsp),%esi
   17aeb:	89 74 24 38          	mov    %esi,0x38(%rsp)
   17aef:	89 54 24 35          	mov    %edx,0x35(%rsp)
   17af3:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   17af7:	88 44 24 34          	mov    %al,0x34(%rsp)
   17afb:	48 8d 9c 24 9c 00 00 	lea    0x9c(%rsp),%rbx
   17b02:	00 
   17b03:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   17b08:	4c 8d 64 24 58       	lea    0x58(%rsp),%r12
   17b0d:	48 89 df             	mov    %rbx,%rdi
   17b10:	4c 89 e2             	mov    %r12,%rdx
   17b13:	ff 15 4f 4b 04 00    	call   *0x44b4f(%rip)        # 5c668 <_DYNAMIC+0x330>
   17b19:	4c 8d 74 24 64       	lea    0x64(%rsp),%r14
   17b1e:	48 8d 54 24 40       	lea    0x40(%rsp),%rdx
   17b23:	4c 89 f7             	mov    %r14,%rdi
   17b26:	48 89 de             	mov    %rbx,%rsi
   17b29:	ff 15 41 4b 04 00    	call   *0x44b41(%rip)        # 5c670 <_DYNAMIC+0x338>
   17b2f:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17b34:	4c 89 f6             	mov    %r14,%rsi
   17b37:	ff 15 3b 4b 04 00    	call   *0x44b3b(%rip)        # 5c678 <_DYNAMIC+0x340>
   17b3d:	48 8d 7c 24 14       	lea    0x14(%rsp),%rdi
   17b42:	4c 89 f6             	mov    %r14,%rsi
   17b45:	4c 89 e2             	mov    %r12,%rdx
   17b48:	ff 15 32 4b 04 00    	call   *0x44b32(%rip)        # 5c680 <_DYNAMIC+0x348>
   17b4e:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   17b53:	4c 89 f6             	mov    %r14,%rsi
   17b56:	4c 89 e2             	mov    %r12,%rdx
   17b59:	ff 15 29 4b 04 00    	call   *0x44b29(%rip)        # 5c688 <_DYNAMIC+0x350>
   17b5f:	8b 44 24 28          	mov    0x28(%rsp),%eax
   17b63:	89 84 24 90 00 00 00 	mov    %eax,0x90(%rsp)
   17b6a:	0f 10 44 24 08       	movups 0x8(%rsp),%xmm0
   17b6f:	0f 10 4c 24 18       	movups 0x18(%rsp),%xmm1
   17b74:	0f 29 8c 24 80 00 00 	movaps %xmm1,0x80(%rsp)
   17b7b:	00 
   17b7c:	0f 29 44 24 70       	movaps %xmm0,0x70(%rsp)
   17b81:	48 8d 44 24 70       	lea    0x70(%rsp),%rax
   17b86:	4c 89 f7             	mov    %r14,%rdi
   17b89:	ff 15 01 4b 04 00    	call   *0x44b01(%rip)        # 5c690 <_DYNAMIC+0x358>
   17b8f:	8b 4c 24 64          	mov    0x64(%rsp),%ecx
   17b93:	83 f9 01             	cmp    $0x1,%ecx
   17b96:	75 1c                	jne    17bb4 <hyperinterval_strict_surface32+0x234>
   17b98:	8b 74 24 68          	mov    0x68(%rsp),%esi
   17b9c:	8b 7c 24 6c          	mov    0x6c(%rsp),%edi
   17ba0:	39 fe                	cmp    %edi,%esi
   17ba2:	0f 94 c2             	sete   %dl
   17ba5:	66 0f 6e ce          	movd   %esi,%xmm1
   17ba9:	66 0f 6e c7          	movd   %edi,%xmm0
   17bad:	be 01 00 00 00       	mov    $0x1,%esi
   17bb2:	eb 04                	jmp    17bb8 <hyperinterval_strict_surface32+0x238>
   17bb4:	31 d2                	xor    %edx,%edx
   17bb6:	31 f6                	xor    %esi,%esi
   17bb8:	80 f1 01             	xor    $0x1,%cl
   17bbb:	89 74 24 08          	mov    %esi,0x8(%rsp)
   17bbf:	66 0f 7e 4c 24 0c    	movd   %xmm1,0xc(%rsp)
   17bc5:	88 4c 24 10          	mov    %cl,0x10(%rsp)
   17bc9:	88 54 24 11          	mov    %dl,0x11(%rsp)
   17bcd:	88 44 24 12          	mov    %al,0x12(%rsp)
   17bd1:	89 74 24 14          	mov    %esi,0x14(%rsp)
   17bd5:	66 0f 7e 44 24 18    	movd   %xmm0,0x18(%rsp)
   17bdb:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   17be0:	4c 8d 64 24 64       	lea    0x64(%rsp),%r12
   17be5:	48 8d 5c 24 58       	lea    0x58(%rsp),%rbx
   17bea:	4c 89 e7             	mov    %r12,%rdi
   17bed:	48 89 de             	mov    %rbx,%rsi
   17bf0:	ff 15 a2 4a 04 00    	call   *0x44aa2(%rip)        # 5c698 <_DYNAMIC+0x360>
   17bf6:	88 44 24 2c          	mov    %al,0x2c(%rsp)
   17bfa:	4c 89 e7             	mov    %r12,%rdi
   17bfd:	48 89 de             	mov    %rbx,%rsi
   17c00:	ff 15 9a 4a 04 00    	call   *0x44a9a(%rip)        # 5c6a0 <_DYNAMIC+0x368>
   17c06:	41 89 c6             	mov    %eax,%r14d
   17c09:	48 8d 5c 24 40       	lea    0x40(%rsp),%rbx
   17c0e:	4c 89 e7             	mov    %r12,%rdi
   17c11:	48 89 de             	mov    %rbx,%rsi
   17c14:	ff 15 8e 4a 04 00    	call   *0x44a8e(%rip)        # 5c6a8 <_DYNAMIC+0x370>
   17c1a:	89 c5                	mov    %eax,%ebp
   17c1c:	4c 89 e7             	mov    %r12,%rdi
   17c1f:	48 89 de             	mov    %rbx,%rsi
   17c22:	ff 15 88 4a 04 00    	call   *0x44a88(%rip)        # 5c6b0 <_DYNAMIC+0x378>
   17c28:	89 c3                	mov    %eax,%ebx
   17c2a:	4c 89 e7             	mov    %r12,%rdi
   17c2d:	66 0f 6e 44 24 3c    	movd   0x3c(%rsp),%xmm0
   17c33:	ff 15 47 49 04 00    	call   *0x44947(%rip)        # 5c580 <_DYNAMIC+0x248>
   17c39:	a8 01                	test   $0x1,%al
   17c3b:	74 0c                	je     17c49 <hyperinterval_strict_surface32+0x2c9>
   17c3d:	4c 89 fb             	mov    %r15,%rbx
   17c40:	41 88 57 04          	mov    %dl,0x4(%r15)
   17c44:	e9 05 fe ff ff       	jmp    17a4e <hyperinterval_strict_surface32+0xce>
   17c49:	0f b6 44 24 2c       	movzbl 0x2c(%rsp),%eax
   17c4e:	88 44 24 08          	mov    %al,0x8(%rsp)
   17c52:	44 88 74 24 09       	mov    %r14b,0x9(%rsp)
   17c57:	40 88 6c 24 0a       	mov    %bpl,0xa(%rsp)
   17c5c:	88 5c 24 0b          	mov    %bl,0xb(%rsp)
   17c60:	88 54 24 0c          	mov    %dl,0xc(%rsp)
   17c64:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   17c69:	41 83 fd 01          	cmp    $0x1,%r13d
   17c6d:	75 2a                	jne    17c99 <hyperinterval_strict_surface32+0x319>
   17c6f:	f3 0f 7e 44 24 44    	movq   0x44(%rsp),%xmm0
   17c75:	66 0f ef c9          	pxor   %xmm1,%xmm1
   17c79:	66 0f 6f 15 df df fe 	movdqa -0x12021(%rip),%xmm2        # 5c60 <__abi_tag+0x5964>
   17c80:	ff 
   17c81:	66 0f ef d0          	pxor   %xmm0,%xmm2
   17c85:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   17c89:	66 0f df ca          	pandn  %xmm2,%xmm1
   17c8d:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   17c92:	b8 01 00 00 00       	mov    $0x1,%eax
   17c97:	eb 02                	jmp    17c9b <hyperinterval_strict_surface32+0x31b>
   17c99:	31 c0                	xor    %eax,%eax
   17c9b:	89 44 24 4c          	mov    %eax,0x4c(%rsp)
   17c9f:	66 0f d6 44 24 50    	movq   %xmm0,0x50(%rsp)
   17ca5:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17caa:	48 8d 74 24 64       	lea    0x64(%rsp),%rsi
   17caf:	48 8d 54 24 4c       	lea    0x4c(%rsp),%rdx
   17cb4:	ff 15 fe 49 04 00    	call   *0x449fe(%rip)        # 5c6b8 <_DYNAMIC+0x380>
   17cba:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17cbe:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   17cc3:	83 f9 02             	cmp    $0x2,%ecx
   17cc6:	4c 89 fb             	mov    %r15,%rbx
   17cc9:	0f 84 ee fc ff ff    	je     179bd <hyperinterval_strict_surface32+0x3d>
   17ccf:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   17cd3:	8b 74 24 10          	mov    0x10(%rsp),%esi
   17cd7:	89 74 24 38          	mov    %esi,0x38(%rsp)
   17cdb:	89 54 24 35          	mov    %edx,0x35(%rsp)
   17cdf:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   17ce3:	88 44 24 34          	mov    %al,0x34(%rsp)
   17ce7:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17cec:	66 0f 6e 05 d0 de fe 	movd   -0x12130(%rip),%xmm0        # 5bc4 <__abi_tag+0x58c8>
   17cf3:	ff 
   17cf4:	ff 15 06 49 04 00    	call   *0x44906(%rip)        # 5c600 <_DYNAMIC+0x2c8>
   17cfa:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17cfe:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   17d03:	83 f9 02             	cmp    $0x2,%ecx
   17d06:	0f 84 b1 fc ff ff    	je     179bd <hyperinterval_strict_surface32+0x3d>
   17d0c:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   17d10:	8b 74 24 10          	mov    0x10(%rsp),%esi
   17d14:	89 74 24 78          	mov    %esi,0x78(%rsp)
   17d18:	89 54 24 75          	mov    %edx,0x75(%rsp)
   17d1c:	89 4c 24 70          	mov    %ecx,0x70(%rsp)
   17d20:	88 44 24 74          	mov    %al,0x74(%rsp)
   17d24:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   17d29:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   17d2e:	48 89 df             	mov    %rbx,%rdi
   17d31:	ff 15 89 49 04 00    	call   *0x44989(%rip)        # 5c6c0 <_DYNAMIC+0x388>
   17d37:	e9 19 fd ff ff       	jmp    17a55 <hyperinterval_strict_surface32+0xd5>
   17d3c:	cc                   	int3
   17d3d:	cc                   	int3
   17d3e:	cc                   	int3
   17d3f:	cc                   	int3

hyperinterval_strict_surface64:
   17d40:	55                   	push   %rbp
   17d41:	41 57                	push   %r15
   17d43:	41 56                	push   %r14
   17d45:	41 55                	push   %r13
   17d47:	41 54                	push   %r12
   17d49:	53                   	push   %rbx
   17d4a:	48 81 ec 48 01 00 00 	sub    $0x148,%rsp
   17d51:	89 f5                	mov    %esi,%ebp
   17d53:	48 89 fb             	mov    %rdi,%rbx
   17d56:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17d5b:	f2 0f 11 84 24 80 00 	movsd  %xmm0,0x80(%rsp)
   17d62:	00 00 
   17d64:	66 0f d6 4c 24 60    	movq   %xmm1,0x60(%rsp)
   17d6a:	ff 15 a8 48 04 00    	call   *0x448a8(%rip)        # 5c618 <_DYNAMIC+0x2e0>
   17d70:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   17d75:	49 83 fc 02          	cmp    $0x2,%r12
   17d79:	75 07                	jne    17d82 <hyperinterval_strict_surface64+0x42>
   17d7b:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17d80:	eb 78                	jmp    17dfa <hyperinterval_strict_surface64+0xba>
   17d82:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
   17d87:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
   17d8c:	4c 89 a4 24 00 01 00 	mov    %r12,0x100(%rsp)
   17d93:	00 
   17d94:	4c 89 bc 24 08 01 00 	mov    %r15,0x108(%rsp)
   17d9b:	00 
   17d9c:	4c 89 b4 24 10 01 00 	mov    %r14,0x110(%rsp)
   17da3:	00 
   17da4:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
   17dab:	00 
   17dac:	f2 0f 10 84 24 80 00 	movsd  0x80(%rsp),%xmm0
   17db3:	00 00 
   17db5:	ff 15 0d 49 04 00    	call   *0x4490d(%rip)        # 5c6c8 <_DYNAMIC+0x390>
   17dbb:	80 bc 24 a0 00 00 00 	cmpb   $0x1,0xa0(%rsp)
   17dc2:	01 
   17dc3:	74 2d                	je     17df2 <hyperinterval_strict_surface64+0xb2>
   17dc5:	f2 0f 10 84 24 a8 00 	movsd  0xa8(%rsp),%xmm0
   17dcc:	00 00 
   17dce:	f2 0f 11 44 24 58    	movsd  %xmm0,0x58(%rsp)
   17dd4:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
   17ddb:	00 
   17ddc:	f2 0f 10 44 24 60    	movsd  0x60(%rsp),%xmm0
   17de2:	ff 15 e8 48 04 00    	call   *0x448e8(%rip)        # 5c6d0 <_DYNAMIC+0x398>
   17de8:	80 bc 24 a0 00 00 00 	cmpb   $0x1,0xa0(%rsp)
   17def:	01 
   17df0:	75 27                	jne    17e19 <hyperinterval_strict_surface64+0xd9>
   17df2:	0f b6 84 24 a1 00 00 	movzbl 0xa1(%rsp),%eax
   17df9:	00 
   17dfa:	88 43 08             	mov    %al,0x8(%rbx)
   17dfd:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   17e04:	48 89 d8             	mov    %rbx,%rax
   17e07:	48 81 c4 48 01 00 00 	add    $0x148,%rsp
   17e0e:	5b                   	pop    %rbx
   17e0f:	41 5c                	pop    %r12
   17e11:	41 5d                	pop    %r13
   17e13:	41 5e                	pop    %r14
   17e15:	41 5f                	pop    %r15
   17e17:	5d                   	pop    %rbp
   17e18:	c3                   	ret
   17e19:	f3 0f 7e 8c 24 a8 00 	movq   0xa8(%rsp),%xmm1
   17e20:	00 00 
   17e22:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17e27:	f2 0f 10 44 24 58    	movsd  0x58(%rsp),%xmm0
   17e2d:	ff 15 e5 47 04 00    	call   *0x447e5(%rip)        # 5c618 <_DYNAMIC+0x2e0>
   17e33:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17e38:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17e3d:	48 83 f9 02          	cmp    $0x2,%rcx
   17e41:	74 b7                	je     17dfa <hyperinterval_strict_surface64+0xba>
   17e43:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   17e48:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   17e4d:	48 89 b4 24 f8 00 00 	mov    %rsi,0xf8(%rsp)
   17e54:	00 
   17e55:	48 89 94 24 f1 00 00 	mov    %rdx,0xf1(%rsp)
   17e5c:	00 
   17e5d:	48 89 8c 24 e8 00 00 	mov    %rcx,0xe8(%rsp)
   17e64:	00 
   17e65:	88 84 24 f0 00 00 00 	mov    %al,0xf0(%rsp)
   17e6c:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17e71:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
   17e78:	00 
   17e79:	89 ea                	mov    %ebp,%edx
   17e7b:	ff 15 57 48 04 00    	call   *0x44857(%rip)        # 5c6d8 <_DYNAMIC+0x3a0>
   17e81:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17e86:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17e8b:	48 83 f9 02          	cmp    $0x2,%rcx
   17e8f:	0f 84 65 ff ff ff    	je     17dfa <hyperinterval_strict_surface64+0xba>
   17e95:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   17e9a:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   17e9f:	48 89 b4 24 b0 00 00 	mov    %rsi,0xb0(%rsp)
   17ea6:	00 
   17ea7:	48 89 94 24 a9 00 00 	mov    %rdx,0xa9(%rsp)
   17eae:	00 
   17eaf:	48 89 8c 24 a0 00 00 	mov    %rcx,0xa0(%rsp)
   17eb6:	00 
   17eb7:	88 84 24 a8 00 00 00 	mov    %al,0xa8(%rsp)
   17ebe:	48 8d bc 24 88 00 00 	lea    0x88(%rsp),%rdi
   17ec5:	00 
   17ec6:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
   17ecd:	00 
   17ece:	ff 15 0c 48 04 00    	call   *0x4480c(%rip)        # 5c6e0 <_DYNAMIC+0x3a8>
   17ed4:	48 8b 8c 24 88 00 00 	mov    0x88(%rsp),%rcx
   17edb:	00 
   17edc:	0f b6 84 24 90 00 00 	movzbl 0x90(%rsp),%eax
   17ee3:	00 
   17ee4:	48 83 f9 02          	cmp    $0x2,%rcx
   17ee8:	0f 84 0c ff ff ff    	je     17dfa <hyperinterval_strict_surface64+0xba>
   17eee:	48 8b 94 24 91 00 00 	mov    0x91(%rsp),%rdx
   17ef5:	00 
   17ef6:	48 8b b4 24 98 00 00 	mov    0x98(%rsp),%rsi
   17efd:	00 
   17efe:	48 89 74 24 78       	mov    %rsi,0x78(%rsp)
   17f03:	48 89 54 24 71       	mov    %rdx,0x71(%rsp)
   17f08:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
   17f0d:	88 44 24 70          	mov    %al,0x70(%rsp)
   17f11:	4c 8d ac 24 30 01 00 	lea    0x130(%rsp),%r13
   17f18:	00 
   17f19:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
   17f1e:	48 8d 94 24 e8 00 00 	lea    0xe8(%rsp),%rdx
   17f25:	00 
   17f26:	4c 89 ef             	mov    %r13,%rdi
   17f29:	ff 15 b9 47 04 00    	call   *0x447b9(%rip)        # 5c6e8 <_DYNAMIC+0x3b0>
   17f2f:	48 8d ac 24 18 01 00 	lea    0x118(%rsp),%rbp
   17f36:	00 
   17f37:	48 8d 94 24 00 01 00 	lea    0x100(%rsp),%rdx
   17f3e:	00 
   17f3f:	48 89 ef             	mov    %rbp,%rdi
   17f42:	4c 89 ee             	mov    %r13,%rsi
   17f45:	ff 15 a5 47 04 00    	call   *0x447a5(%rip)        # 5c6f0 <_DYNAMIC+0x3b8>
   17f4b:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17f50:	48 89 ee             	mov    %rbp,%rsi
   17f53:	e8 48 f6 ff ff       	call   175a0 <<hyperinterval::float::F64Enclosure>::abs>
   17f58:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   17f5d:	48 89 ee             	mov    %rbp,%rsi
   17f60:	48 8d 94 24 e8 00 00 	lea    0xe8(%rsp),%rdx
   17f67:	00 
   17f68:	ff 15 8a 47 04 00    	call   *0x4478a(%rip)        # 5c6f8 <_DYNAMIC+0x3c0>
   17f6e:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   17f73:	48 89 ee             	mov    %rbp,%rsi
   17f76:	48 8d 94 24 e8 00 00 	lea    0xe8(%rsp),%rdx
   17f7d:	00 
   17f7e:	ff 15 7c 47 04 00    	call   *0x4477c(%rip)        # 5c700 <_DYNAMIC+0x3c8>
   17f84:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   17f89:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
   17f90:	00 
   17f91:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
   17f96:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
   17f9b:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
   17fa0:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
   17fa5:	0f 29 9c 24 d0 00 00 	movaps %xmm3,0xd0(%rsp)
   17fac:	00 
   17fad:	0f 29 94 24 c0 00 00 	movaps %xmm2,0xc0(%rsp)
   17fb4:	00 
   17fb5:	0f 29 8c 24 b0 00 00 	movaps %xmm1,0xb0(%rsp)
   17fbc:	00 
   17fbd:	0f 29 84 24 a0 00 00 	movaps %xmm0,0xa0(%rsp)
   17fc4:	00 
   17fc5:	48 8d 84 24 a0 00 00 	lea    0xa0(%rsp),%rax
   17fcc:	00 
   17fcd:	48 89 ef             	mov    %rbp,%rdi
   17fd0:	ff 15 32 47 04 00    	call   *0x44732(%rip)        # 5c708 <_DYNAMIC+0x3d0>
   17fd6:	48 8b 8c 24 18 01 00 	mov    0x118(%rsp),%rcx
   17fdd:	00 
   17fde:	48 83 f9 01          	cmp    $0x1,%rcx
   17fe2:	75 27                	jne    1800b <hyperinterval_strict_surface64+0x2cb>
   17fe4:	48 8b b4 24 20 01 00 	mov    0x120(%rsp),%rsi
   17feb:	00 
   17fec:	48 8b bc 24 28 01 00 	mov    0x128(%rsp),%rdi
   17ff3:	00 
   17ff4:	48 39 fe             	cmp    %rdi,%rsi
   17ff7:	0f 94 c2             	sete   %dl
   17ffa:	66 48 0f 6e ce       	movq   %rsi,%xmm1
   17fff:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   18004:	be 01 00 00 00       	mov    $0x1,%esi
   18009:	eb 04                	jmp    1800f <hyperinterval_strict_surface64+0x2cf>
   1800b:	31 d2                	xor    %edx,%edx
   1800d:	31 f6                	xor    %esi,%esi
   1800f:	80 f1 01             	xor    $0x1,%cl
   18012:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
   18017:	66 0f d6 4c 24 18    	movq   %xmm1,0x18(%rsp)
   1801d:	88 4c 24 20          	mov    %cl,0x20(%rsp)
   18021:	88 54 24 21          	mov    %dl,0x21(%rsp)
   18025:	88 44 24 22          	mov    %al,0x22(%rsp)
   18029:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
   1802e:	66 0f d6 44 24 30    	movq   %xmm0,0x30(%rsp)
   18034:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
   18039:	4c 8d ac 24 18 01 00 	lea    0x118(%rsp),%r13
   18040:	00 
   18041:	48 8d ac 24 e8 00 00 	lea    0xe8(%rsp),%rbp
   18048:	00 
   18049:	4c 89 ef             	mov    %r13,%rdi
   1804c:	48 89 ee             	mov    %rbp,%rsi
   1804f:	ff 15 bb 46 04 00    	call   *0x446bb(%rip)        # 5c710 <_DYNAMIC+0x3d8>
   18055:	88 44 24 60          	mov    %al,0x60(%rsp)
   18059:	4c 89 ef             	mov    %r13,%rdi
   1805c:	48 89 ee             	mov    %rbp,%rsi
   1805f:	ff 15 b3 46 04 00    	call   *0x446b3(%rip)        # 5c718 <_DYNAMIC+0x3e0>
   18065:	88 44 24 58          	mov    %al,0x58(%rsp)
   18069:	48 8d ac 24 00 01 00 	lea    0x100(%rsp),%rbp
   18070:	00 
   18071:	4c 89 ef             	mov    %r13,%rdi
   18074:	48 89 ee             	mov    %rbp,%rsi
   18077:	ff 15 a3 46 04 00    	call   *0x446a3(%rip)        # 5c720 <_DYNAMIC+0x3e8>
   1807d:	88 44 24 0f          	mov    %al,0xf(%rsp)
   18081:	4c 89 ef             	mov    %r13,%rdi
   18084:	48 89 ee             	mov    %rbp,%rsi
   18087:	ff 15 9b 46 04 00    	call   *0x4469b(%rip)        # 5c728 <_DYNAMIC+0x3f0>
   1808d:	89 c5                	mov    %eax,%ebp
   1808f:	4c 89 ef             	mov    %r13,%rdi
   18092:	f2 0f 10 84 24 80 00 	movsd  0x80(%rsp),%xmm0
   18099:	00 00 
   1809b:	ff 15 d7 44 04 00    	call   *0x444d7(%rip)        # 5c578 <_DYNAMIC+0x240>
   180a1:	a8 01                	test   $0x1,%al
   180a3:	74 08                	je     180ad <hyperinterval_strict_surface64+0x36d>
   180a5:	88 53 08             	mov    %dl,0x8(%rbx)
   180a8:	e9 50 fd ff ff       	jmp    17dfd <hyperinterval_strict_surface64+0xbd>
   180ad:	0f b6 44 24 60       	movzbl 0x60(%rsp),%eax
   180b2:	88 44 24 10          	mov    %al,0x10(%rsp)
   180b6:	0f b6 44 24 58       	movzbl 0x58(%rsp),%eax
   180bb:	88 44 24 11          	mov    %al,0x11(%rsp)
   180bf:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
   180c4:	88 44 24 12          	mov    %al,0x12(%rsp)
   180c8:	40 88 6c 24 13       	mov    %bpl,0x13(%rsp)
   180cd:	88 54 24 14          	mov    %dl,0x14(%rsp)
   180d1:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
   180d6:	41 83 fc 01          	cmp    $0x1,%r12d
   180da:	75 28                	jne    18104 <hyperinterval_strict_surface64+0x3c4>
   180dc:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   180e3:	00 00 80 
   180e6:	4c 89 f1             	mov    %r14,%rcx
   180e9:	48 31 c1             	xor    %rax,%rcx
   180ec:	4d 85 f6             	test   %r14,%r14
   180ef:	49 0f 44 ce          	cmove  %r14,%rcx
   180f3:	4c 31 f8             	xor    %r15,%rax
   180f6:	4d 85 ff             	test   %r15,%r15
   180f9:	49 0f 44 c7          	cmove  %r15,%rax
   180fd:	ba 01 00 00 00       	mov    $0x1,%edx
   18102:	eb 02                	jmp    18106 <hyperinterval_strict_surface64+0x3c6>
   18104:	31 d2                	xor    %edx,%edx
   18106:	48 89 94 24 88 00 00 	mov    %rdx,0x88(%rsp)
   1810d:	00 
   1810e:	48 89 8c 24 90 00 00 	mov    %rcx,0x90(%rsp)
   18115:	00 
   18116:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
   1811d:	00 
   1811e:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   18123:	48 8d b4 24 18 01 00 	lea    0x118(%rsp),%rsi
   1812a:	00 
   1812b:	48 8d 94 24 88 00 00 	lea    0x88(%rsp),%rdx
   18132:	00 
   18133:	ff 15 f7 45 04 00    	call   *0x445f7(%rip)        # 5c730 <_DYNAMIC+0x3f8>
   18139:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1813e:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   18143:	48 83 f9 02          	cmp    $0x2,%rcx
   18147:	0f 84 ad fc ff ff    	je     17dfa <hyperinterval_strict_surface64+0xba>
   1814d:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   18152:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   18157:	48 89 74 24 78       	mov    %rsi,0x78(%rsp)
   1815c:	48 89 54 24 71       	mov    %rdx,0x71(%rsp)
   18161:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
   18166:	88 44 24 70          	mov    %al,0x70(%rsp)
   1816a:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1816f:	f2 0f 10 05 b9 d9 fe 	movsd  -0x12647(%rip),%xmm0        # 5b30 <__abi_tag+0x5834>
   18176:	ff 
   18177:	ff 15 b3 44 04 00    	call   *0x444b3(%rip)        # 5c630 <_DYNAMIC+0x2f8>
   1817d:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   18182:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   18187:	48 83 f9 02          	cmp    $0x2,%rcx
   1818b:	0f 84 69 fc ff ff    	je     17dfa <hyperinterval_strict_surface64+0xba>
   18191:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   18196:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1819b:	48 89 b4 24 b0 00 00 	mov    %rsi,0xb0(%rsp)
   181a2:	00 
   181a3:	48 89 94 24 a9 00 00 	mov    %rdx,0xa9(%rsp)
   181aa:	00 
   181ab:	48 89 8c 24 a0 00 00 	mov    %rcx,0xa0(%rsp)
   181b2:	00 
   181b3:	88 84 24 a8 00 00 00 	mov    %al,0xa8(%rsp)
   181ba:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
   181bf:	48 8d 94 24 a0 00 00 	lea    0xa0(%rsp),%rdx
   181c6:	00 
   181c7:	48 89 df             	mov    %rbx,%rdi
   181ca:	ff 15 68 45 04 00    	call   *0x44568(%rip)        # 5c738 <_DYNAMIC+0x400>
   181d0:	e9 2f fc ff ff       	jmp    17e04 <hyperinterval_strict_surface64+0xc4>
   181d5:	cc                   	int3
   181d6:	cc                   	int3
   181d7:	cc                   	int3
   181d8:	cc                   	int3
   181d9:	cc                   	int3
   181da:	cc                   	int3
   181db:	cc                   	int3
   181dc:	cc                   	int3
   181dd:	cc                   	int3
   181de:	cc                   	int3
   181df:	cc                   	int3

<hyperinterval::ieee::Format>::finite:
   18230:	48 89 c8             	mov    %rcx,%rax
   18233:	48 f7 d0             	not    %rax
   18236:	48 85 d0             	test   %rdx,%rax
   18239:	75 09                	jne    18244 <<hyperinterval::ieee::Format>::finite+0x14>
   1823b:	c6 47 01 00          	movb   $0x0,0x1(%rdi)
   1823f:	b0 01                	mov    $0x1,%al
   18241:	88 07                	mov    %al,(%rdi)
   18243:	c3                   	ret
   18244:	48 ff ce             	dec    %rsi
   18247:	48 85 f1             	test   %rsi,%rcx
   1824a:	74 09                	je     18255 <<hyperinterval::ieee::Format>::finite+0x25>
   1824c:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   18250:	31 c0                	xor    %eax,%eax
   18252:	88 07                	mov    %al,(%rdi)
   18254:	c3                   	ret
   18255:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
   1825c:	00 
   1825d:	31 c0                	xor    %eax,%eax
   1825f:	88 07                	mov    %al,(%rdi)
   18261:	c3                   	ret
   18262:	cc                   	int3
   18263:	cc                   	int3
   18264:	cc                   	int3
   18265:	cc                   	int3
   18266:	cc                   	int3
   18267:	cc                   	int3
   18268:	cc                   	int3
   18269:	cc                   	int3
   1826a:	cc                   	int3
   1826b:	cc                   	int3
   1826c:	cc                   	int3
   1826d:	cc                   	int3
   1826e:	cc                   	int3
   1826f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::reciprocal:
   18270:	41 57                	push   %r15
   18272:	41 56                	push   %r14
   18274:	41 54                	push   %r12
   18276:	53                   	push   %rbx
   18277:	48 83 ec 28          	sub    $0x28,%rsp
   1827b:	48 89 fb             	mov    %rdi,%rbx
   1827e:	83 3e 00             	cmpl   $0x0,(%rsi)
   18281:	74 5e                	je     182e1 <<hyperinterval::float::F32Enclosure>::reciprocal+0x71>
   18283:	49 89 f6             	mov    %rsi,%r14
   18286:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   1828c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18291:	be 00 00 00 80       	mov    $0x80000000,%esi
   18296:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1829b:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   182a0:	e8 8b ff ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   182a5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   182aa:	74 25                	je     182d1 <<hyperinterval::float::F32Enclosure>::reciprocal+0x61>
   182ac:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   182b1:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   182b6:	be 00 00 00 80       	mov    $0x80000000,%esi
   182bb:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   182c0:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   182c5:	e8 66 ff ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   182ca:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   182cf:	75 25                	jne    182f6 <<hyperinterval::float::F32Enclosure>::reciprocal+0x86>
   182d1:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   182d6:	88 4b 04             	mov    %cl,0x4(%rbx)
   182d9:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   182df:	eb 06                	jmp    182e7 <<hyperinterval::float::F32Enclosure>::reciprocal+0x77>
   182e1:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   182e7:	48 89 d8             	mov    %rbx,%rax
   182ea:	48 83 c4 28          	add    $0x28,%rsp
   182ee:	5b                   	pop    %rbx
   182ef:	41 5c                	pop    %r12
   182f1:	41 5e                	pop    %r14
   182f3:	41 5f                	pop    %r15
   182f5:	c3                   	ret
   182f6:	8b 44 24 10          	mov    0x10(%rsp),%eax
   182fa:	44 89 e1             	mov    %r12d,%ecx
   182fd:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18303:	89 c2                	mov    %eax,%edx
   18305:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1830b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18310:	29 ce                	sub    %ecx,%esi
   18312:	44 09 f9             	or     %r15d,%ecx
   18315:	45 85 e4             	test   %r12d,%r12d
   18318:	48 0f 49 f1          	cmovns %rcx,%rsi
   1831c:	89 d1                	mov    %edx,%ecx
   1831e:	44 09 f9             	or     %r15d,%ecx
   18321:	41 29 d7             	sub    %edx,%r15d
   18324:	85 c0                	test   %eax,%eax
   18326:	4c 0f 49 f9          	cmovns %rcx,%r15
   1832a:	b1 01                	mov    $0x1,%cl
   1832c:	44 39 fe             	cmp    %r15d,%esi
   1832f:	77 a5                	ja     182d6 <<hyperinterval::float::F32Enclosure>::reciprocal+0x66>
   18331:	44 89 e1             	mov    %r12d,%ecx
   18334:	c1 e9 08             	shr    $0x8,%ecx
   18337:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%rsp)
   1833e:	00 
   1833f:	44 88 64 24 20       	mov    %r12b,0x20(%rsp)
   18344:	41 c1 ec 18          	shr    $0x18,%r12d
   18348:	44 88 64 24 23       	mov    %r12b,0x23(%rsp)
   1834d:	66 89 4c 24 21       	mov    %cx,0x21(%rsp)
   18352:	89 44 24 24          	mov    %eax,0x24(%rsp)
   18356:	41 83 7e 04 00       	cmpl   $0x0,0x4(%r14)
   1835b:	7f 15                	jg     18372 <<hyperinterval::float::F32Enclosure>::reciprocal+0x102>
   1835d:	41 8b 46 08          	mov    0x8(%r14),%eax
   18361:	85 c0                	test   %eax,%eax
   18363:	0f 99 c1             	setns  %cl
   18366:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   1836b:	0f 94 c0             	sete   %al
   1836e:	08 c8                	or     %cl,%al
   18370:	75 1a                	jne    1838c <<hyperinterval::float::F32Enclosure>::reciprocal+0x11c>
   18372:	48 8d 74 24 1c       	lea    0x1c(%rsp),%rsi
   18377:	48 89 df             	mov    %rbx,%rdi
   1837a:	4c 89 f2             	mov    %r14,%rdx
   1837d:	b9 01 00 00 00       	mov    $0x1,%ecx
   18382:	e8 e9 02 00 00       	call   18670 <<hyperinterval::float::F32Enclosure>::corner_image>
   18387:	e9 5b ff ff ff       	jmp    182e7 <<hyperinterval::float::F32Enclosure>::reciprocal+0x77>
   1838c:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
   18390:	e9 44 ff ff ff       	jmp    182d9 <<hyperinterval::float::F32Enclosure>::reciprocal+0x69>
   18395:	cc                   	int3
   18396:	cc                   	int3
   18397:	cc                   	int3
   18398:	cc                   	int3
   18399:	cc                   	int3
   1839a:	cc                   	int3
   1839b:	cc                   	int3
   1839c:	cc                   	int3
   1839d:	cc                   	int3
   1839e:	cc                   	int3
   1839f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::checked_pow:
   183a0:	55                   	push   %rbp
   183a1:	41 57                	push   %r15
   183a3:	41 56                	push   %r14
   183a5:	41 55                	push   %r13
   183a7:	41 54                	push   %r12
   183a9:	53                   	push   %rbx
   183aa:	48 83 ec 58          	sub    $0x58,%rsp
   183ae:	48 89 fb             	mov    %rdi,%rbx
   183b1:	83 fa 02             	cmp    $0x2,%edx
   183b4:	75 0b                	jne    183c1 <<hyperinterval::float::F32Enclosure>::checked_pow+0x21>
   183b6:	48 89 df             	mov    %rbx,%rdi
   183b9:	ff 15 39 42 04 00    	call   *0x44239(%rip)        # 5c5f8 <_DYNAMIC+0x2c0>
   183bf:	eb 78                	jmp    18439 <<hyperinterval::float::F32Enclosure>::checked_pow+0x99>
   183c1:	f6 06 01             	testb  $0x1,(%rsi)
   183c4:	74 6d                	je     18433 <<hyperinterval::float::F32Enclosure>::checked_pow+0x93>
   183c6:	89 d5                	mov    %edx,%ebp
   183c8:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   183ce:	8b 4e 04             	mov    0x4(%rsi),%ecx
   183d1:	48 89 74 24 50       	mov    %rsi,0x50(%rsp)
   183d6:	44 8b 7e 08          	mov    0x8(%rsi),%r15d
   183da:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   183df:	be 00 00 00 80       	mov    $0x80000000,%esi
   183e4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   183e9:	41 89 e8             	mov    %ebp,%r8d
   183ec:	e8 ff 23 00 00       	call   1a7f0 <<hyperinterval::ieee::Format>::power>
   183f1:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   183f6:	75 2b                	jne    18423 <<hyperinterval::float::F32Enclosure>::checked_pow+0x83>
   183f8:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   183fd:	44 8b 6c 24 18       	mov    0x18(%rsp),%r13d
   18402:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18407:	be 00 00 00 80       	mov    $0x80000000,%esi
   1840c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18411:	4c 89 f9             	mov    %r15,%rcx
   18414:	41 89 e8             	mov    %ebp,%r8d
   18417:	e8 d4 23 00 00       	call   1a7f0 <<hyperinterval::ieee::Format>::power>
   1841c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18421:	75 28                	jne    1844b <<hyperinterval::float::F32Enclosure>::checked_pow+0xab>
   18423:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   18428:	88 43 04             	mov    %al,0x4(%rbx)
   1842b:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18431:	eb 06                	jmp    18439 <<hyperinterval::float::F32Enclosure>::checked_pow+0x99>
   18433:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   18439:	48 89 d8             	mov    %rbx,%rax
   1843c:	48 83 c4 58          	add    $0x58,%rsp
   18440:	5b                   	pop    %rbx
   18441:	41 5c                	pop    %r12
   18443:	41 5d                	pop    %r13
   18445:	41 5e                	pop    %r14
   18447:	41 5f                	pop    %r15
   18449:	5d                   	pop    %rbp
   1844a:	c3                   	ret
   1844b:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   18450:	8b 44 24 18          	mov    0x18(%rsp),%eax
   18454:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   18459:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1845e:	be 00 00 00 80       	mov    $0x80000000,%esi
   18463:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18468:	4c 89 e1             	mov    %r12,%rcx
   1846b:	e8 c0 fd ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   18470:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18475:	74 23                	je     1849a <<hyperinterval::float::F32Enclosure>::checked_pow+0xfa>
   18477:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1847c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18481:	be 00 00 00 80       	mov    $0x80000000,%esi
   18486:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1848b:	4c 89 e9             	mov    %r13,%rcx
   1848e:	e8 9d fd ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   18493:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18498:	75 10                	jne    184aa <<hyperinterval::float::F32Enclosure>::checked_pow+0x10a>
   1849a:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   1849f:	88 4b 04             	mov    %cl,0x4(%rbx)
   184a2:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   184a8:	eb 8f                	jmp    18439 <<hyperinterval::float::F32Enclosure>::checked_pow+0x99>
   184aa:	8b 44 24 10          	mov    0x10(%rsp),%eax
   184ae:	44 89 e1             	mov    %r12d,%ecx
   184b1:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   184b7:	89 c2                	mov    %eax,%edx
   184b9:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   184bf:	be 00 00 00 80       	mov    $0x80000000,%esi
   184c4:	29 ce                	sub    %ecx,%esi
   184c6:	44 09 f1             	or     %r14d,%ecx
   184c9:	45 85 e4             	test   %r12d,%r12d
   184cc:	48 0f 49 f1          	cmovns %rcx,%rsi
   184d0:	bf 00 00 00 80       	mov    $0x80000000,%edi
   184d5:	29 d7                	sub    %edx,%edi
   184d7:	89 d1                	mov    %edx,%ecx
   184d9:	44 09 f1             	or     %r14d,%ecx
   184dc:	85 c0                	test   %eax,%eax
   184de:	48 0f 49 f9          	cmovns %rcx,%rdi
   184e2:	b1 01                	mov    $0x1,%cl
   184e4:	39 fe                	cmp    %edi,%esi
   184e6:	77 b7                	ja     1849f <<hyperinterval::float::F32Enclosure>::checked_pow+0xff>
   184e8:	44 89 e1             	mov    %r12d,%ecx
   184eb:	c1 e9 08             	shr    $0x8,%ecx
   184ee:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%rsp)
   184f5:	00 
   184f6:	44 88 64 24 30       	mov    %r12b,0x30(%rsp)
   184fb:	41 c1 ec 18          	shr    $0x18,%r12d
   184ff:	44 88 64 24 33       	mov    %r12b,0x33(%rsp)
   18504:	66 89 4c 24 31       	mov    %cx,0x31(%rsp)
   18509:	89 44 24 34          	mov    %eax,0x34(%rsp)
   1850d:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18512:	be 00 00 00 80       	mov    $0x80000000,%esi
   18517:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1851c:	4c 89 f9             	mov    %r15,%rcx
   1851f:	e8 0c fd ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   18524:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18529:	0f 84 6b ff ff ff    	je     1849a <<hyperinterval::float::F32Enclosure>::checked_pow+0xfa>
   1852f:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   18534:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18539:	be 00 00 00 80       	mov    $0x80000000,%esi
   1853e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18543:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   18548:	e8 e3 fc ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1854d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18552:	0f 84 42 ff ff ff    	je     1849a <<hyperinterval::float::F32Enclosure>::checked_pow+0xfa>
   18558:	8b 44 24 10          	mov    0x10(%rsp),%eax
   1855c:	44 89 f9             	mov    %r15d,%ecx
   1855f:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18565:	89 c2                	mov    %eax,%edx
   18567:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1856d:	be 00 00 00 80       	mov    $0x80000000,%esi
   18572:	29 ce                	sub    %ecx,%esi
   18574:	44 09 f1             	or     %r14d,%ecx
   18577:	45 85 ff             	test   %r15d,%r15d
   1857a:	48 0f 49 f1          	cmovns %rcx,%rsi
   1857e:	89 d1                	mov    %edx,%ecx
   18580:	44 09 f1             	or     %r14d,%ecx
   18583:	41 29 d6             	sub    %edx,%r14d
   18586:	85 c0                	test   %eax,%eax
   18588:	4c 0f 49 f1          	cmovns %rcx,%r14
   1858c:	b1 01                	mov    $0x1,%cl
   1858e:	44 39 f6             	cmp    %r14d,%esi
   18591:	0f 87 08 ff ff ff    	ja     1849f <<hyperinterval::float::F32Enclosure>::checked_pow+0xff>
   18597:	44 89 f9             	mov    %r15d,%ecx
   1859a:	c1 e9 08             	shr    $0x8,%ecx
   1859d:	c7 44 24 20 01 00 00 	movl   $0x1,0x20(%rsp)
   185a4:	00 
   185a5:	44 88 7c 24 24       	mov    %r15b,0x24(%rsp)
   185aa:	41 c1 ef 18          	shr    $0x18,%r15d
   185ae:	44 88 7c 24 27       	mov    %r15b,0x27(%rsp)
   185b3:	66 89 4c 24 25       	mov    %cx,0x25(%rsp)
   185b8:	89 44 24 28          	mov    %eax,0x28(%rsp)
   185bc:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   185c1:	48 8d 74 24 2c       	lea    0x2c(%rsp),%rsi
   185c6:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
   185cb:	ff 15 9f 40 04 00    	call   *0x4409f(%rip)        # 5c670 <_DYNAMIC+0x338>
   185d1:	85 ed                	test   %ebp,%ebp
   185d3:	0f 95 c0             	setne  %al
   185d6:	40 f6 c5 01          	test   $0x1,%bpl
   185da:	0f 94 c1             	sete   %cl
   185dd:	84 c8                	test   %cl,%al
   185df:	74 6e                	je     1864f <<hyperinterval::float::F32Enclosure>::checked_pow+0x2af>
   185e1:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   185e6:	ff 15 a4 40 04 00    	call   *0x440a4(%rip)        # 5c690 <_DYNAMIC+0x358>
   185ec:	a8 02                	test   $0x2,%al
   185ee:	74 5f                	je     1864f <<hyperinterval::float::F32Enclosure>::checked_pow+0x2af>
   185f0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   185f5:	31 f6                	xor    %esi,%esi
   185f7:	31 d2                	xor    %edx,%edx
   185f9:	e8 32 17 00 00       	call   19d30 <<hyperinterval::float::F32Enclosure>::from_bits>
   185fe:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18602:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   18607:	83 f9 02             	cmp    $0x2,%ecx
   1860a:	0f 84 18 fe ff ff    	je     18428 <<hyperinterval::float::F32Enclosure>::checked_pow+0x88>
   18610:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   18614:	8b 74 24 10          	mov    0x10(%rsp),%esi
   18618:	89 74 24 28          	mov    %esi,0x28(%rsp)
   1861c:	89 54 24 25          	mov    %edx,0x25(%rsp)
   18620:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   18624:	88 44 24 24          	mov    %al,0x24(%rsp)
   18628:	48 8d 7c 24 2c       	lea    0x2c(%rsp),%rdi
   1862d:	48 8d 74 24 38       	lea    0x38(%rsp),%rsi
   18632:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
   18637:	ff 15 33 40 04 00    	call   *0x44033(%rip)        # 5c670 <_DYNAMIC+0x338>
   1863d:	8b 44 24 34          	mov    0x34(%rsp),%eax
   18641:	89 44 24 40          	mov    %eax,0x40(%rsp)
   18645:	48 8b 44 24 2c       	mov    0x2c(%rsp),%rax
   1864a:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1864f:	8b 44 24 40          	mov    0x40(%rsp),%eax
   18653:	89 43 08             	mov    %eax,0x8(%rbx)
   18656:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   1865b:	48 89 03             	mov    %rax,(%rbx)
   1865e:	e9 d6 fd ff ff       	jmp    18439 <<hyperinterval::float::F32Enclosure>::checked_pow+0x99>
   18663:	cc                   	int3
   18664:	cc                   	int3
   18665:	cc                   	int3
   18666:	cc                   	int3
   18667:	cc                   	int3
   18668:	cc                   	int3
   18669:	cc                   	int3
   1866a:	cc                   	int3
   1866b:	cc                   	int3
   1866c:	cc                   	int3
   1866d:	cc                   	int3
   1866e:	cc                   	int3
   1866f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::corner_image:
   18670:	55                   	push   %rbp
   18671:	41 57                	push   %r15
   18673:	41 56                	push   %r14
   18675:	41 55                	push   %r13
   18677:	41 54                	push   %r12
   18679:	53                   	push   %rbx
   1867a:	48 83 ec 58          	sub    $0x58,%rsp
   1867e:	48 89 fb             	mov    %rdi,%rbx
   18681:	f6 06 01             	testb  $0x1,(%rsi)
   18684:	74 53                	je     186d9 <<hyperinterval::float::F32Enclosure>::corner_image+0x69>
   18686:	f6 02 01             	testb  $0x1,(%rdx)
   18689:	74 4e                	je     186d9 <<hyperinterval::float::F32Enclosure>::corner_image+0x69>
   1868b:	44 8b 62 04          	mov    0x4(%rdx),%r12d
   1868f:	8b 42 08             	mov    0x8(%rdx),%eax
   18692:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   18697:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
   1869b:	8b 46 08             	mov    0x8(%rsi),%eax
   1869e:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   186a3:	41 89 cf             	mov    %ecx,%r15d
   186a6:	84 c9                	test   %cl,%cl
   186a8:	74 3a                	je     186e4 <<hyperinterval::float::F32Enclosure>::corner_image+0x74>
   186aa:	48 89 e7             	mov    %rsp,%rdi
   186ad:	be 00 00 00 80       	mov    $0x80000000,%esi
   186b2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   186b7:	4c 89 e9             	mov    %r13,%rcx
   186ba:	4d 89 e0             	mov    %r12,%r8
   186bd:	e8 ee 1c 00 00       	call   1a3b0 <<hyperinterval::ieee::Format>::div>
   186c2:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   186c6:	0f 85 fc 00 00 00    	jne    187c8 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   186cc:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   186d0:	8b 6c 24 10          	mov    0x10(%rsp),%ebp
   186d4:	e9 b7 00 00 00       	jmp    18790 <<hyperinterval::float::F32Enclosure>::corner_image+0x120>
   186d9:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   186df:	e9 f3 00 00 00       	jmp    187d7 <<hyperinterval::float::F32Enclosure>::corner_image+0x167>
   186e4:	44 89 e8             	mov    %r13d,%eax
   186e7:	c1 e8 17             	shr    $0x17,%eax
   186ea:	0f b6 c0             	movzbl %al,%eax
   186ed:	44 89 e9             	mov    %r13d,%ecx
   186f0:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   186f6:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   186fd:	8d b0 6a ff ff ff    	lea    -0x96(%rax),%esi
   18703:	85 c0                	test   %eax,%eax
   18705:	b8 6b ff ff ff       	mov    $0xffffff6b,%eax
   1870a:	0f 44 f0             	cmove  %eax,%esi
   1870d:	48 0f 44 d1          	cmove  %rcx,%rdx
   18711:	44 89 e1             	mov    %r12d,%ecx
   18714:	c1 e9 17             	shr    $0x17,%ecx
   18717:	0f b6 c9             	movzbl %cl,%ecx
   1871a:	44 89 ef             	mov    %r13d,%edi
   1871d:	44 31 e7             	xor    %r12d,%edi
   18720:	45 89 e0             	mov    %r12d,%r8d
   18723:	41 81 e0 ff ff 7f 00 	and    $0x7fffff,%r8d
   1872a:	4d 8d 88 00 00 80 00 	lea    0x800000(%r8),%r9
   18731:	44 8d 91 6a ff ff ff 	lea    -0x96(%rcx),%r10d
   18738:	85 c9                	test   %ecx,%ecx
   1873a:	44 0f 44 d0          	cmove  %eax,%r10d
   1873e:	4d 0f 44 c8          	cmove  %r8,%r9
   18742:	4c 0f af ca          	imul   %rdx,%r9
   18746:	41 01 f2             	add    %esi,%r10d
   18749:	c1 ef 1f             	shr    $0x1f,%edi
   1874c:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
   18751:	4c 89 0c 24          	mov    %r9,(%rsp)
   18755:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   1875c:	00 00 
   1875e:	44 89 54 24 10       	mov    %r10d,0x10(%rsp)
   18763:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   18768:	48 89 e1             	mov    %rsp,%rcx
   1876b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18770:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18775:	e8 96 28 00 00       	call   1b010 <<hyperinterval::ieee::Format>::rounded>
   1877a:	80 7c 24 20 00       	cmpb   $0x0,0x20(%rsp)
   1877f:	74 07                	je     18788 <<hyperinterval::float::F32Enclosure>::corner_image+0x118>
   18781:	0f b6 6c 24 21       	movzbl 0x21(%rsp),%ebp
   18786:	eb 45                	jmp    187cd <<hyperinterval::float::F32Enclosure>::corner_image+0x15d>
   18788:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
   1878c:	8b 6c 24 30          	mov    0x30(%rsp),%ebp
   18790:	48 89 e7             	mov    %rsp,%rdi
   18793:	be 00 00 00 80       	mov    $0x80000000,%esi
   18798:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1879d:	e8 8e fa ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   187a2:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   187a6:	75 20                	jne    187c8 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   187a8:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   187ad:	48 89 e7             	mov    %rsp,%rdi
   187b0:	be 00 00 00 80       	mov    $0x80000000,%esi
   187b5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   187ba:	48 89 e9             	mov    %rbp,%rcx
   187bd:	e8 6e fa ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   187c2:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   187c6:	74 1e                	je     187e6 <<hyperinterval::float::F32Enclosure>::corner_image+0x176>
   187c8:	0f b6 6c 24 01       	movzbl 0x1(%rsp),%ebp
   187cd:	40 88 6b 04          	mov    %bpl,0x4(%rbx)
   187d1:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   187d7:	48 83 c4 58          	add    $0x58,%rsp
   187db:	5b                   	pop    %rbx
   187dc:	41 5c                	pop    %r12
   187de:	41 5d                	pop    %r13
   187e0:	41 5e                	pop    %r14
   187e2:	41 5f                	pop    %r15
   187e4:	5d                   	pop    %rbp
   187e5:	c3                   	ret
   187e6:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   187eb:	44 89 f0             	mov    %r14d,%eax
   187ee:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   187f3:	89 f9                	mov    %edi,%ecx
   187f5:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   187fb:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18800:	29 c2                	sub    %eax,%edx
   18802:	be 00 00 00 80       	mov    $0x80000000,%esi
   18807:	09 f0                	or     %esi,%eax
   18809:	45 85 f6             	test   %r14d,%r14d
   1880c:	48 0f 49 d0          	cmovns %rax,%rdx
   18810:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18815:	29 c8                	sub    %ecx,%eax
   18817:	09 f1                	or     %esi,%ecx
   18819:	85 ff                	test   %edi,%edi
   1881b:	48 0f 49 c1          	cmovns %rcx,%rax
   1881f:	40 b5 01             	mov    $0x1,%bpl
   18822:	39 c2                	cmp    %eax,%edx
   18824:	77 a7                	ja     187cd <<hyperinterval::float::F32Enclosure>::corner_image+0x15d>
   18826:	48 89 7c 24 50       	mov    %rdi,0x50(%rsp)
   1882b:	45 84 ff             	test   %r15b,%r15b
   1882e:	74 2d                	je     1885d <<hyperinterval::float::F32Enclosure>::corner_image+0x1ed>
   18830:	48 89 e7             	mov    %rsp,%rdi
   18833:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18838:	4c 89 e9             	mov    %r13,%rcx
   1883b:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
   18840:	e8 6b 1b 00 00       	call   1a3b0 <<hyperinterval::ieee::Format>::div>
   18845:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18849:	0f 85 79 ff ff ff    	jne    187c8 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   1884f:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18853:	44 8b 6c 24 10       	mov    0x10(%rsp),%r13d
   18858:	e9 ac 00 00 00       	jmp    18909 <<hyperinterval::float::F32Enclosure>::corner_image+0x299>
   1885d:	44 89 e8             	mov    %r13d,%eax
   18860:	c1 e8 17             	shr    $0x17,%eax
   18863:	0f b6 c0             	movzbl %al,%eax
   18866:	44 89 e9             	mov    %r13d,%ecx
   18869:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   1886f:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   18876:	8d b0 6a ff ff ff    	lea    -0x96(%rax),%esi
   1887c:	85 c0                	test   %eax,%eax
   1887e:	b8 6b ff ff ff       	mov    $0xffffff6b,%eax
   18883:	0f 44 f0             	cmove  %eax,%esi
   18886:	48 0f 44 d1          	cmove  %rcx,%rdx
   1888a:	4c 8b 54 24 40       	mov    0x40(%rsp),%r10
   1888f:	44 89 d1             	mov    %r10d,%ecx
   18892:	c1 e9 17             	shr    $0x17,%ecx
   18895:	0f b6 c9             	movzbl %cl,%ecx
   18898:	44 89 d7             	mov    %r10d,%edi
   1889b:	81 e7 ff ff 7f 00    	and    $0x7fffff,%edi
   188a1:	4c 8d 87 00 00 80 00 	lea    0x800000(%rdi),%r8
   188a8:	44 8d 89 6a ff ff ff 	lea    -0x96(%rcx),%r9d
   188af:	85 c9                	test   %ecx,%ecx
   188b1:	44 0f 44 c8          	cmove  %eax,%r9d
   188b5:	4c 0f 44 c7          	cmove  %rdi,%r8
   188b9:	45 31 d5             	xor    %r10d,%r13d
   188bc:	4c 0f af c2          	imul   %rdx,%r8
   188c0:	41 01 f1             	add    %esi,%r9d
   188c3:	41 c1 ed 1f          	shr    $0x1f,%r13d
   188c7:	44 88 6c 24 14       	mov    %r13b,0x14(%rsp)
   188cc:	4c 89 04 24          	mov    %r8,(%rsp)
   188d0:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   188d7:	00 00 
   188d9:	44 89 4c 24 10       	mov    %r9d,0x10(%rsp)
   188de:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   188e3:	48 89 e1             	mov    %rsp,%rcx
   188e6:	be 00 00 00 80       	mov    $0x80000000,%esi
   188eb:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   188f0:	e8 1b 27 00 00       	call   1b010 <<hyperinterval::ieee::Format>::rounded>
   188f5:	80 7c 24 20 00       	cmpb   $0x0,0x20(%rsp)
   188fa:	0f 85 81 fe ff ff    	jne    18781 <<hyperinterval::float::F32Enclosure>::corner_image+0x111>
   18900:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
   18904:	44 8b 6c 24 30       	mov    0x30(%rsp),%r13d
   18909:	48 89 e7             	mov    %rsp,%rdi
   1890c:	be 00 00 00 80       	mov    $0x80000000,%esi
   18911:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18916:	e8 15 f9 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1891b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1891f:	0f 84 a3 fe ff ff    	je     187c8 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   18925:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1892a:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1892f:	48 89 e7             	mov    %rsp,%rdi
   18932:	be 00 00 00 80       	mov    $0x80000000,%esi
   18937:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1893c:	4c 89 e9             	mov    %r13,%rcx
   1893f:	e8 ec f8 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   18944:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18948:	0f 84 7a fe ff ff    	je     187c8 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   1894e:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   18953:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
   18958:	44 89 c1             	mov    %r8d,%ecx
   1895b:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18961:	44 89 e8             	mov    %r13d,%eax
   18964:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18969:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1896e:	48 29 ca             	sub    %rcx,%rdx
   18971:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18976:	48 09 f9             	or     %rdi,%rcx
   18979:	45 85 c0             	test   %r8d,%r8d
   1897c:	48 0f 48 ca          	cmovs  %rdx,%rcx
   18980:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18985:	48 29 c2             	sub    %rax,%rdx
   18988:	48 09 f8             	or     %rdi,%rax
   1898b:	45 85 ed             	test   %r13d,%r13d
   1898e:	48 0f 48 c2          	cmovs  %rdx,%rax
   18992:	48 39 c1             	cmp    %rax,%rcx
   18995:	0f 87 32 fe ff ff    	ja     187cd <<hyperinterval::float::F32Enclosure>::corner_image+0x15d>
   1899b:	44 89 f2             	mov    %r14d,%edx
   1899e:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   189a4:	be 00 00 00 80       	mov    $0x80000000,%esi
   189a9:	29 d6                	sub    %edx,%esi
   189ab:	09 fa                	or     %edi,%edx
   189ad:	45 85 f6             	test   %r14d,%r14d
   189b0:	48 0f 49 f2          	cmovns %rdx,%rsi
   189b4:	39 ce                	cmp    %ecx,%esi
   189b6:	45 0f 46 c6          	cmovbe %r14d,%r8d
   189ba:	4c 89 44 24 48       	mov    %r8,0x48(%rsp)
   189bf:	48 8b 74 24 50       	mov    0x50(%rsp),%rsi
   189c4:	89 f1                	mov    %esi,%ecx
   189c6:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   189cc:	ba 00 00 00 80       	mov    $0x80000000,%edx
   189d1:	29 ca                	sub    %ecx,%edx
   189d3:	09 f9                	or     %edi,%ecx
   189d5:	85 f6                	test   %esi,%esi
   189d7:	48 0f 49 d1          	cmovns %rcx,%rdx
   189db:	39 c2                	cmp    %eax,%edx
   189dd:	44 0f 43 ee          	cmovae %esi,%r13d
   189e1:	45 84 ff             	test   %r15b,%r15b
   189e4:	74 32                	je     18a18 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a8>
   189e6:	48 89 e7             	mov    %rsp,%rdi
   189e9:	be 00 00 00 80       	mov    $0x80000000,%esi
   189ee:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   189f3:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   189f8:	4d 89 e0             	mov    %r12,%r8
   189fb:	e8 b0 19 00 00       	call   1a3b0 <<hyperinterval::ieee::Format>::div>
   18a00:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18a04:	0f 85 be fd ff ff    	jne    187c8 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   18a0a:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18a0e:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   18a13:	e9 ac 00 00 00       	jmp    18ac4 <<hyperinterval::float::F32Enclosure>::corner_image+0x454>
   18a18:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
   18a1d:	44 89 d0             	mov    %r10d,%eax
   18a20:	c1 e8 17             	shr    $0x17,%eax
   18a23:	0f b6 c0             	movzbl %al,%eax
   18a26:	44 89 d1             	mov    %r10d,%ecx
   18a29:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   18a2f:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   18a36:	8d b0 6a ff ff ff    	lea    -0x96(%rax),%esi
   18a3c:	85 c0                	test   %eax,%eax
   18a3e:	b8 6b ff ff ff       	mov    $0xffffff6b,%eax
   18a43:	0f 44 f0             	cmove  %eax,%esi
   18a46:	48 0f 44 d1          	cmove  %rcx,%rdx
   18a4a:	44 89 e1             	mov    %r12d,%ecx
   18a4d:	c1 e9 17             	shr    $0x17,%ecx
   18a50:	0f b6 c9             	movzbl %cl,%ecx
   18a53:	44 89 e7             	mov    %r12d,%edi
   18a56:	81 e7 ff ff 7f 00    	and    $0x7fffff,%edi
   18a5c:	4c 8d 87 00 00 80 00 	lea    0x800000(%rdi),%r8
   18a63:	44 8d 89 6a ff ff ff 	lea    -0x96(%rcx),%r9d
   18a6a:	85 c9                	test   %ecx,%ecx
   18a6c:	44 0f 44 c8          	cmove  %eax,%r9d
   18a70:	4c 0f 44 c7          	cmove  %rdi,%r8
   18a74:	45 31 d4             	xor    %r10d,%r12d
   18a77:	4c 0f af c2          	imul   %rdx,%r8
   18a7b:	41 01 f1             	add    %esi,%r9d
   18a7e:	41 c1 ec 1f          	shr    $0x1f,%r12d
   18a82:	44 88 64 24 14       	mov    %r12b,0x14(%rsp)
   18a87:	4c 89 04 24          	mov    %r8,(%rsp)
   18a8b:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   18a92:	00 00 
   18a94:	44 89 4c 24 10       	mov    %r9d,0x10(%rsp)
   18a99:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   18a9e:	48 89 e1             	mov    %rsp,%rcx
   18aa1:	be 00 00 00 80       	mov    $0x80000000,%esi
   18aa6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18aab:	e8 60 25 00 00       	call   1b010 <<hyperinterval::ieee::Format>::rounded>
   18ab0:	80 7c 24 20 00       	cmpb   $0x0,0x20(%rsp)
   18ab5:	0f 85 c6 fc ff ff    	jne    18781 <<hyperinterval::float::F32Enclosure>::corner_image+0x111>
   18abb:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
   18abf:	44 8b 64 24 30       	mov    0x30(%rsp),%r12d
   18ac4:	48 89 e7             	mov    %rsp,%rdi
   18ac7:	be 00 00 00 80       	mov    $0x80000000,%esi
   18acc:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18ad1:	e8 5a f7 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   18ad6:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18ada:	0f 85 e8 fc ff ff    	jne    187c8 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   18ae0:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   18ae5:	48 89 e7             	mov    %rsp,%rdi
   18ae8:	be 00 00 00 80       	mov    $0x80000000,%esi
   18aed:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18af2:	4c 89 e1             	mov    %r12,%rcx
   18af5:	e8 36 f7 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   18afa:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18afe:	0f 85 c4 fc ff ff    	jne    187c8 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   18b04:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   18b09:	44 89 f1             	mov    %r14d,%ecx
   18b0c:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18b12:	44 89 e0             	mov    %r12d,%eax
   18b15:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18b1a:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18b1f:	48 29 ca             	sub    %rcx,%rdx
   18b22:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18b28:	4c 09 c1             	or     %r8,%rcx
   18b2b:	45 85 f6             	test   %r14d,%r14d
   18b2e:	48 0f 48 ca          	cmovs  %rdx,%rcx
   18b32:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18b37:	48 29 c2             	sub    %rax,%rdx
   18b3a:	4c 09 c0             	or     %r8,%rax
   18b3d:	45 85 e4             	test   %r12d,%r12d
   18b40:	48 0f 48 c2          	cmovs  %rdx,%rax
   18b44:	48 39 c1             	cmp    %rax,%rcx
   18b47:	0f 87 80 fc ff ff    	ja     187cd <<hyperinterval::float::F32Enclosure>::corner_image+0x15d>
   18b4d:	4c 8b 4c 24 48       	mov    0x48(%rsp),%r9
   18b52:	44 89 ca             	mov    %r9d,%edx
   18b55:	44 09 c2             	or     %r8d,%edx
   18b58:	44 89 ce             	mov    %r9d,%esi
   18b5b:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18b61:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18b66:	29 f7                	sub    %esi,%edi
   18b68:	45 85 c9             	test   %r9d,%r9d
   18b6b:	48 0f 49 fa          	cmovns %rdx,%rdi
   18b6f:	39 cf                	cmp    %ecx,%edi
   18b71:	45 0f 46 f1          	cmovbe %r9d,%r14d
   18b75:	4c 89 74 24 50       	mov    %r14,0x50(%rsp)
   18b7a:	44 89 e9             	mov    %r13d,%ecx
   18b7d:	44 09 c1             	or     %r8d,%ecx
   18b80:	44 89 ea             	mov    %r13d,%edx
   18b83:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18b89:	be 00 00 00 80       	mov    $0x80000000,%esi
   18b8e:	29 d6                	sub    %edx,%esi
   18b90:	45 85 ed             	test   %r13d,%r13d
   18b93:	48 0f 49 f1          	cmovns %rcx,%rsi
   18b97:	39 c6                	cmp    %eax,%esi
   18b99:	45 0f 43 e5          	cmovae %r13d,%r12d
   18b9d:	45 84 ff             	test   %r15b,%r15b
   18ba0:	74 34                	je     18bd6 <<hyperinterval::float::F32Enclosure>::corner_image+0x566>
   18ba2:	48 89 e7             	mov    %rsp,%rdi
   18ba5:	be 00 00 00 80       	mov    $0x80000000,%esi
   18baa:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18baf:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   18bb4:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
   18bb9:	e8 f2 17 00 00       	call   1a3b0 <<hyperinterval::ieee::Format>::div>
   18bbe:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18bc2:	0f 85 00 fc ff ff    	jne    187c8 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   18bc8:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18bcc:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   18bd1:	e9 b1 00 00 00       	jmp    18c87 <<hyperinterval::float::F32Enclosure>::corner_image+0x617>
   18bd6:	4c 8b 5c 24 38       	mov    0x38(%rsp),%r11
   18bdb:	44 89 d8             	mov    %r11d,%eax
   18bde:	c1 e8 17             	shr    $0x17,%eax
   18be1:	0f b6 c0             	movzbl %al,%eax
   18be4:	44 89 d9             	mov    %r11d,%ecx
   18be7:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   18bed:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   18bf4:	8d b0 6a ff ff ff    	lea    -0x96(%rax),%esi
   18bfa:	85 c0                	test   %eax,%eax
   18bfc:	b8 6b ff ff ff       	mov    $0xffffff6b,%eax
   18c01:	0f 44 f0             	cmove  %eax,%esi
   18c04:	48 0f 44 d1          	cmove  %rcx,%rdx
   18c08:	4c 8b 54 24 40       	mov    0x40(%rsp),%r10
   18c0d:	44 89 d1             	mov    %r10d,%ecx
   18c10:	c1 e9 17             	shr    $0x17,%ecx
   18c13:	0f b6 c9             	movzbl %cl,%ecx
   18c16:	44 89 d7             	mov    %r10d,%edi
   18c19:	81 e7 ff ff 7f 00    	and    $0x7fffff,%edi
   18c1f:	4c 8d 87 00 00 80 00 	lea    0x800000(%rdi),%r8
   18c26:	44 8d 89 6a ff ff ff 	lea    -0x96(%rcx),%r9d
   18c2d:	85 c9                	test   %ecx,%ecx
   18c2f:	44 0f 44 c8          	cmove  %eax,%r9d
   18c33:	4c 0f 44 c7          	cmove  %rdi,%r8
   18c37:	45 31 da             	xor    %r11d,%r10d
   18c3a:	4c 0f af c2          	imul   %rdx,%r8
   18c3e:	41 01 f1             	add    %esi,%r9d
   18c41:	41 c1 ea 1f          	shr    $0x1f,%r10d
   18c45:	44 88 54 24 14       	mov    %r10b,0x14(%rsp)
   18c4a:	4c 89 04 24          	mov    %r8,(%rsp)
   18c4e:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   18c55:	00 00 
   18c57:	44 89 4c 24 10       	mov    %r9d,0x10(%rsp)
   18c5c:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   18c61:	48 89 e1             	mov    %rsp,%rcx
   18c64:	be 00 00 00 80       	mov    $0x80000000,%esi
   18c69:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18c6e:	e8 9d 23 00 00       	call   1b010 <<hyperinterval::ieee::Format>::rounded>
   18c73:	80 7c 24 20 00       	cmpb   $0x0,0x20(%rsp)
   18c78:	0f 85 03 fb ff ff    	jne    18781 <<hyperinterval::float::F32Enclosure>::corner_image+0x111>
   18c7e:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
   18c82:	44 8b 74 24 30       	mov    0x30(%rsp),%r14d
   18c87:	48 89 e7             	mov    %rsp,%rdi
   18c8a:	be 00 00 00 80       	mov    $0x80000000,%esi
   18c8f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18c94:	e8 97 f5 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   18c99:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18c9d:	0f 85 25 fb ff ff    	jne    187c8 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   18ca3:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   18ca8:	48 89 e7             	mov    %rsp,%rdi
   18cab:	be 00 00 00 80       	mov    $0x80000000,%esi
   18cb0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18cb5:	4c 89 f1             	mov    %r14,%rcx
   18cb8:	e8 73 f5 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   18cbd:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18cc1:	0f 85 01 fb ff ff    	jne    187c8 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   18cc7:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   18ccc:	44 89 fa             	mov    %r15d,%edx
   18ccf:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18cd5:	89 c1                	mov    %eax,%ecx
   18cd7:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18cdd:	be 00 00 00 80       	mov    $0x80000000,%esi
   18ce2:	48 29 d6             	sub    %rdx,%rsi
   18ce5:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18cea:	48 09 fa             	or     %rdi,%rdx
   18ced:	45 85 ff             	test   %r15d,%r15d
   18cf0:	48 0f 48 d6          	cmovs  %rsi,%rdx
   18cf4:	be 00 00 00 80       	mov    $0x80000000,%esi
   18cf9:	48 29 ce             	sub    %rcx,%rsi
   18cfc:	48 09 f9             	or     %rdi,%rcx
   18cff:	85 c0                	test   %eax,%eax
   18d01:	48 0f 48 ce          	cmovs  %rsi,%rcx
   18d05:	48 39 ca             	cmp    %rcx,%rdx
   18d08:	0f 87 bf fa ff ff    	ja     187cd <<hyperinterval::float::F32Enclosure>::corner_image+0x15d>
   18d0e:	4c 8b 54 24 50       	mov    0x50(%rsp),%r10
   18d13:	44 89 d6             	mov    %r10d,%esi
   18d16:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   18d1c:	44 09 ce             	or     %r9d,%esi
   18d1f:	44 89 d7             	mov    %r10d,%edi
   18d22:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18d28:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18d2e:	41 29 f8             	sub    %edi,%r8d
   18d31:	45 85 d2             	test   %r10d,%r10d
   18d34:	4c 0f 49 c6          	cmovns %rsi,%r8
   18d38:	41 39 d0             	cmp    %edx,%r8d
   18d3b:	45 0f 46 fa          	cmovbe %r10d,%r15d
   18d3f:	44 89 e2             	mov    %r12d,%edx
   18d42:	44 09 ca             	or     %r9d,%edx
   18d45:	44 89 e6             	mov    %r12d,%esi
   18d48:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18d4e:	41 29 f1             	sub    %esi,%r9d
   18d51:	45 85 e4             	test   %r12d,%r12d
   18d54:	4c 0f 49 ca          	cmovns %rdx,%r9
   18d58:	41 39 c9             	cmp    %ecx,%r9d
   18d5b:	41 0f 43 c4          	cmovae %r12d,%eax
   18d5f:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   18d65:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
   18d69:	89 43 08             	mov    %eax,0x8(%rbx)
   18d6c:	e9 66 fa ff ff       	jmp    187d7 <<hyperinterval::float::F32Enclosure>::corner_image+0x167>
   18d71:	cc                   	int3
   18d72:	cc                   	int3
   18d73:	cc                   	int3
   18d74:	cc                   	int3
   18d75:	cc                   	int3
   18d76:	cc                   	int3
   18d77:	cc                   	int3
   18d78:	cc                   	int3
   18d79:	cc                   	int3
   18d7a:	cc                   	int3
   18d7b:	cc                   	int3
   18d7c:	cc                   	int3
   18d7d:	cc                   	int3
   18d7e:	cc                   	int3
   18d7f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::intersection:
   18d80:	48 89 f8             	mov    %rdi,%rax
   18d83:	45 31 c9             	xor    %r9d,%r9d
   18d86:	f6 06 01             	testb  $0x1,(%rsi)
   18d89:	0f 84 ed 00 00 00    	je     18e7c <<hyperinterval::float::F32Enclosure>::intersection+0xfc>
   18d8f:	f6 02 01             	testb  $0x1,(%rdx)
   18d92:	0f 84 d9 00 00 00    	je     18e71 <<hyperinterval::float::F32Enclosure>::intersection+0xf1>
   18d98:	53                   	push   %rbx
   18d99:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   18d9d:	8b 4e 04             	mov    0x4(%rsi),%ecx
   18da0:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18da5:	41 89 c9             	mov    %ecx,%r9d
   18da8:	41 09 f9             	or     %edi,%r9d
   18dab:	41 89 ca             	mov    %ecx,%r10d
   18dae:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18db5:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   18dbb:	45 29 d3             	sub    %r10d,%r11d
   18dbe:	85 c9                	test   %ecx,%ecx
   18dc0:	4d 0f 49 d9          	cmovns %r9,%r11
   18dc4:	45 89 c1             	mov    %r8d,%r9d
   18dc7:	41 09 f9             	or     %edi,%r9d
   18dca:	45 89 c2             	mov    %r8d,%r10d
   18dcd:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18dd4:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   18dd9:	44 29 d3             	sub    %r10d,%ebx
   18ddc:	45 85 c0             	test   %r8d,%r8d
   18ddf:	49 0f 49 d9          	cmovns %r9,%rbx
   18de3:	8b 52 08             	mov    0x8(%rdx),%edx
   18de6:	41 39 db             	cmp    %ebx,%r11d
   18de9:	41 0f 42 c8          	cmovb  %r8d,%ecx
   18ded:	44 8b 46 08          	mov    0x8(%rsi),%r8d
   18df1:	44 89 c6             	mov    %r8d,%esi
   18df4:	09 fe                	or     %edi,%esi
   18df6:	45 89 c1             	mov    %r8d,%r9d
   18df9:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18e00:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18e06:	45 29 ca             	sub    %r9d,%r10d
   18e09:	45 85 c0             	test   %r8d,%r8d
   18e0c:	4c 0f 49 d6          	cmovns %rsi,%r10
   18e10:	89 d6                	mov    %edx,%esi
   18e12:	09 fe                	or     %edi,%esi
   18e14:	41 89 d1             	mov    %edx,%r9d
   18e17:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18e1e:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   18e24:	45 29 cb             	sub    %r9d,%r11d
   18e27:	85 d2                	test   %edx,%edx
   18e29:	4c 0f 49 de          	cmovns %rsi,%r11
   18e2d:	45 39 da             	cmp    %r11d,%r10d
   18e30:	44 0f 47 c2          	cmova  %edx,%r8d
   18e34:	89 ca                	mov    %ecx,%edx
   18e36:	09 fa                	or     %edi,%edx
   18e38:	89 ce                	mov    %ecx,%esi
   18e3a:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18e40:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18e46:	41 29 f2             	sub    %esi,%r10d
   18e49:	85 c9                	test   %ecx,%ecx
   18e4b:	4c 0f 49 d2          	cmovns %rdx,%r10
   18e4f:	44 89 c2             	mov    %r8d,%edx
   18e52:	09 fa                	or     %edi,%edx
   18e54:	44 89 c6             	mov    %r8d,%esi
   18e57:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18e5d:	29 f7                	sub    %esi,%edi
   18e5f:	45 85 c0             	test   %r8d,%r8d
   18e62:	48 0f 49 fa          	cmovns %rdx,%rdi
   18e66:	45 31 c9             	xor    %r9d,%r9d
   18e69:	41 39 fa             	cmp    %edi,%r10d
   18e6c:	41 0f 96 c1          	setbe  %r9b
   18e70:	5b                   	pop    %rbx
   18e71:	44 89 08             	mov    %r9d,(%rax)
   18e74:	89 48 04             	mov    %ecx,0x4(%rax)
   18e77:	44 89 40 08          	mov    %r8d,0x8(%rax)
   18e7b:	c3                   	ret
   18e7c:	44 89 08             	mov    %r9d,(%rax)
   18e7f:	89 48 04             	mov    %ecx,0x4(%rax)
   18e82:	44 89 40 08          	mov    %r8d,0x8(%rax)
   18e86:	c3                   	ret
   18e87:	cc                   	int3
   18e88:	cc                   	int3
   18e89:	cc                   	int3
   18e8a:	cc                   	int3
   18e8b:	cc                   	int3
   18e8c:	cc                   	int3
   18e8d:	cc                   	int3
   18e8e:	cc                   	int3
   18e8f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::contains_point:
   18e90:	41 56                	push   %r14
   18e92:	53                   	push   %rbx
   18e93:	48 83 ec 18          	sub    $0x18,%rsp
   18e97:	48 89 fb             	mov    %rdi,%rbx
   18e9a:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   18ea0:	66 0f 7e c1          	movd   %xmm0,%ecx
   18ea4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18ea9:	be 00 00 00 80       	mov    $0x80000000,%esi
   18eae:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18eb3:	e8 78 f3 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   18eb8:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   18ebd:	3c 01                	cmp    $0x1,%al
   18ebf:	75 0d                	jne    18ece <<hyperinterval::float::F32Enclosure>::contains_point+0x3e>
   18ec1:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   18ec6:	48 83 c4 18          	add    $0x18,%rsp
   18eca:	5b                   	pop    %rbx
   18ecb:	41 5e                	pop    %r14
   18ecd:	c3                   	ret
   18ece:	f6 03 01             	testb  $0x1,(%rbx)
   18ed1:	74 44                	je     18f17 <<hyperinterval::float::F32Enclosure>::contains_point+0x87>
   18ed3:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   18ed8:	8b 73 04             	mov    0x4(%rbx),%esi
   18edb:	89 d1                	mov    %edx,%ecx
   18edd:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18ee3:	89 f7                	mov    %esi,%edi
   18ee5:	44 09 f7             	or     %r14d,%edi
   18ee8:	41 89 f0             	mov    %esi,%r8d
   18eeb:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18ef2:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   18ef8:	45 29 c1             	sub    %r8d,%r9d
   18efb:	85 f6                	test   %esi,%esi
   18efd:	4c 0f 49 cf          	cmovns %rdi,%r9
   18f01:	be 00 00 00 80       	mov    $0x80000000,%esi
   18f06:	48 29 ce             	sub    %rcx,%rsi
   18f09:	4c 09 f1             	or     %r14,%rcx
   18f0c:	85 d2                	test   %edx,%edx
   18f0e:	48 0f 48 ce          	cmovs  %rsi,%rcx
   18f12:	41 39 c9             	cmp    %ecx,%r9d
   18f15:	76 0a                	jbe    18f21 <<hyperinterval::float::F32Enclosure>::contains_point+0x91>
   18f17:	31 d2                	xor    %edx,%edx
   18f19:	48 83 c4 18          	add    $0x18,%rsp
   18f1d:	5b                   	pop    %rbx
   18f1e:	41 5e                	pop    %r14
   18f20:	c3                   	ret
   18f21:	8b 53 08             	mov    0x8(%rbx),%edx
   18f24:	89 d6                	mov    %edx,%esi
   18f26:	44 09 f6             	or     %r14d,%esi
   18f29:	89 d7                	mov    %edx,%edi
   18f2b:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18f31:	41 29 fe             	sub    %edi,%r14d
   18f34:	85 d2                	test   %edx,%edx
   18f36:	4c 0f 49 f6          	cmovns %rsi,%r14
   18f3a:	44 39 f1             	cmp    %r14d,%ecx
   18f3d:	0f 96 c2             	setbe  %dl
   18f40:	48 83 c4 18          	add    $0x18,%rsp
   18f44:	5b                   	pop    %rbx
   18f45:	41 5e                	pop    %r14
   18f47:	c3                   	ret
   18f48:	cc                   	int3
   18f49:	cc                   	int3
   18f4a:	cc                   	int3
   18f4b:	cc                   	int3
   18f4c:	cc                   	int3
   18f4d:	cc                   	int3
   18f4e:	cc                   	int3
   18f4f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::interior_subset_of:
   18f50:	b0 01                	mov    $0x1,%al
   18f52:	f6 07 01             	testb  $0x1,(%rdi)
   18f55:	0f 84 8e 00 00 00    	je     18fe9 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x99>
   18f5b:	f6 06 01             	testb  $0x1,(%rsi)
   18f5e:	0f 84 83 00 00 00    	je     18fe7 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x97>
   18f64:	8b 4f 04             	mov    0x4(%rdi),%ecx
   18f67:	8b 56 04             	mov    0x4(%rsi),%edx
   18f6a:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18f6f:	44 8d 04 02          	lea    (%rdx,%rax,1),%r8d
   18f73:	41 89 d1             	mov    %edx,%r9d
   18f76:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18f7d:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18f83:	45 29 ca             	sub    %r9d,%r10d
   18f86:	85 d2                	test   %edx,%edx
   18f88:	4d 0f 49 d0          	cmovns %r8,%r10
   18f8c:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   18f8f:	41 89 c8             	mov    %ecx,%r8d
   18f92:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18f99:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   18f9f:	45 29 c1             	sub    %r8d,%r9d
   18fa2:	85 c9                	test   %ecx,%ecx
   18fa4:	4c 0f 49 ca          	cmovns %rdx,%r9
   18fa8:	45 39 ca             	cmp    %r9d,%r10d
   18fab:	73 3a                	jae    18fe7 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x97>
   18fad:	8b 4f 08             	mov    0x8(%rdi),%ecx
   18fb0:	8b 56 08             	mov    0x8(%rsi),%edx
   18fb3:	8d 34 01             	lea    (%rcx,%rax,1),%esi
   18fb6:	89 cf                	mov    %ecx,%edi
   18fb8:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18fbe:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18fc4:	41 29 f8             	sub    %edi,%r8d
   18fc7:	85 c9                	test   %ecx,%ecx
   18fc9:	4c 0f 49 c6          	cmovns %rsi,%r8
   18fcd:	8d 0c 02             	lea    (%rdx,%rax,1),%ecx
   18fd0:	89 d6                	mov    %edx,%esi
   18fd2:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18fd8:	29 f0                	sub    %esi,%eax
   18fda:	85 d2                	test   %edx,%edx
   18fdc:	48 0f 49 c1          	cmovns %rcx,%rax
   18fe0:	41 39 c0             	cmp    %eax,%r8d
   18fe3:	0f 92 c0             	setb   %al
   18fe6:	c3                   	ret
   18fe7:	31 c0                	xor    %eax,%eax
   18fe9:	c3                   	ret
   18fea:	cc                   	int3
   18feb:	cc                   	int3
   18fec:	cc                   	int3
   18fed:	cc                   	int3
   18fee:	cc                   	int3
   18fef:	cc                   	int3

<hyperinterval::float::F32Enclosure>::abs:
   18ff0:	48 89 f8             	mov    %rdi,%rax
   18ff3:	f6 06 01             	testb  $0x1,(%rsi)
   18ff6:	74 24                	je     1901c <<hyperinterval::float::F32Enclosure>::abs+0x2c>
   18ff8:	8b 4e 04             	mov    0x4(%rsi),%ecx
   18ffb:	85 c9                	test   %ecx,%ecx
   18ffd:	0f 99 c2             	setns  %dl
   19000:	f7 c1 ff ff ff 7f    	test   $0x7fffffff,%ecx
   19006:	40 0f 94 c7          	sete   %dil
   1900a:	40 08 d7             	or     %dl,%dil
   1900d:	74 14                	je     19023 <<hyperinterval::float::F32Enclosure>::abs+0x33>
   1900f:	8b 4e 08             	mov    0x8(%rsi),%ecx
   19012:	89 48 08             	mov    %ecx,0x8(%rax)
   19015:	48 8b 0e             	mov    (%rsi),%rcx
   19018:	48 89 08             	mov    %rcx,(%rax)
   1901b:	c3                   	ret
   1901c:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   19022:	c3                   	ret
   19023:	8b 56 08             	mov    0x8(%rsi),%edx
   19026:	85 d2                	test   %edx,%edx
   19028:	40 0f 98 c7          	sets   %dil
   1902c:	48 89 d6             	mov    %rdx,%rsi
   1902f:	48 81 e6 ff ff ff 7f 	and    $0x7fffffff,%rsi
   19036:	41 0f 95 c0          	setne  %r8b
   1903a:	44 84 c7             	test   %r8b,%dil
   1903d:	74 19                	je     19058 <<hyperinterval::float::F32Enclosure>::abs+0x68>
   1903f:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19045:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1904b:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   19051:	89 50 04             	mov    %edx,0x4(%rax)
   19054:	89 48 08             	mov    %ecx,0x8(%rax)
   19057:	c3                   	ret
   19058:	89 cf                	mov    %ecx,%edi
   1905a:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   19060:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   19066:	46 8d 0c 02          	lea    (%rdx,%r8,1),%r9d
   1906a:	41 29 f0             	sub    %esi,%r8d
   1906d:	85 d2                	test   %edx,%edx
   1906f:	4d 0f 49 c1          	cmovns %r9,%r8
   19073:	41 39 c8             	cmp    %ecx,%r8d
   19076:	0f 43 fa             	cmovae %edx,%edi
   19079:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   19080:	89 78 08             	mov    %edi,0x8(%rax)
   19083:	c3                   	ret
   19084:	cc                   	int3
   19085:	cc                   	int3
   19086:	cc                   	int3
   19087:	cc                   	int3
   19088:	cc                   	int3
   19089:	cc                   	int3
   1908a:	cc                   	int3
   1908b:	cc                   	int3
   1908c:	cc                   	int3
   1908d:	cc                   	int3
   1908e:	cc                   	int3
   1908f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::add:
   19090:	48 89 f8             	mov    %rdi,%rax
   19093:	f6 06 01             	testb  $0x1,(%rsi)
   19096:	0f 84 d6 00 00 00    	je     19172 <<hyperinterval::float::F32Enclosure>::add+0xe2>
   1909c:	f6 02 01             	testb  $0x1,(%rdx)
   1909f:	0f 84 cd 00 00 00    	je     19172 <<hyperinterval::float::F32Enclosure>::add+0xe2>
   190a5:	41 57                	push   %r15
   190a7:	41 56                	push   %r14
   190a9:	41 55                	push   %r13
   190ab:	41 54                	push   %r12
   190ad:	53                   	push   %rbx
   190ae:	48 83 ec 20          	sub    $0x20,%rsp
   190b2:	49 89 c4             	mov    %rax,%r12
   190b5:	8b 5e 08             	mov    0x8(%rsi),%ebx
   190b8:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   190be:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   190c2:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   190c6:	8b 4e 04             	mov    0x4(%rsi),%ecx
   190c9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   190ce:	be 00 00 00 80       	mov    $0x80000000,%esi
   190d3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   190d8:	e8 43 10 00 00       	call   1a120 <<hyperinterval::ieee::Format>::add>
   190dd:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   190e2:	74 6b                	je     1914f <<hyperinterval::float::F32Enclosure>::add+0xbf>
   190e4:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   190e9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   190ee:	be 00 00 00 80       	mov    $0x80000000,%esi
   190f3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   190f8:	48 89 d9             	mov    %rbx,%rcx
   190fb:	4d 89 f0             	mov    %r14,%r8
   190fe:	e8 1d 10 00 00       	call   1a120 <<hyperinterval::ieee::Format>::add>
   19103:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19108:	74 45                	je     1914f <<hyperinterval::float::F32Enclosure>::add+0xbf>
   1910a:	8b 5c 24 18          	mov    0x18(%rsp),%ebx
   1910e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19113:	be 00 00 00 80       	mov    $0x80000000,%esi
   19118:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1911d:	4c 89 f9             	mov    %r15,%rcx
   19120:	e8 0b f1 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   19125:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1912a:	74 23                	je     1914f <<hyperinterval::float::F32Enclosure>::add+0xbf>
   1912c:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   19131:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19136:	be 00 00 00 80       	mov    $0x80000000,%esi
   1913b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19140:	48 89 d9             	mov    %rbx,%rcx
   19143:	e8 e8 f0 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   19148:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1914d:	75 2a                	jne    19179 <<hyperinterval::float::F32Enclosure>::add+0xe9>
   1914f:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   19154:	4c 89 e0             	mov    %r12,%rax
   19157:	41 88 4c 24 04       	mov    %cl,0x4(%r12)
   1915c:	41 c7 04 24 02 00 00 	movl   $0x2,(%r12)
   19163:	00 
   19164:	48 83 c4 20          	add    $0x20,%rsp
   19168:	5b                   	pop    %rbx
   19169:	41 5c                	pop    %r12
   1916b:	41 5d                	pop    %r13
   1916d:	41 5e                	pop    %r14
   1916f:	41 5f                	pop    %r15
   19171:	c3                   	ret
   19172:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   19178:	c3                   	ret
   19179:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   1917d:	44 89 f0             	mov    %r14d,%eax
   19180:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19185:	89 ca                	mov    %ecx,%edx
   19187:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1918d:	be 00 00 00 80       	mov    $0x80000000,%esi
   19192:	29 c6                	sub    %eax,%esi
   19194:	44 09 e8             	or     %r13d,%eax
   19197:	45 85 f6             	test   %r14d,%r14d
   1919a:	48 0f 49 f0          	cmovns %rax,%rsi
   1919e:	89 d0                	mov    %edx,%eax
   191a0:	44 09 e8             	or     %r13d,%eax
   191a3:	41 29 d5             	sub    %edx,%r13d
   191a6:	85 c9                	test   %ecx,%ecx
   191a8:	4c 0f 49 e8          	cmovns %rax,%r13
   191ac:	44 39 ee             	cmp    %r13d,%esi
   191af:	4c 89 e0             	mov    %r12,%rax
   191b2:	76 0c                	jbe    191c0 <<hyperinterval::float::F32Enclosure>::add+0x130>
   191b4:	c6 40 04 01          	movb   $0x1,0x4(%rax)
   191b8:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   191be:	eb a4                	jmp    19164 <<hyperinterval::float::F32Enclosure>::add+0xd4>
   191c0:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   191c6:	44 89 70 04          	mov    %r14d,0x4(%rax)
   191ca:	89 48 08             	mov    %ecx,0x8(%rax)
   191cd:	eb 95                	jmp    19164 <<hyperinterval::float::F32Enclosure>::add+0xd4>
   191cf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::div:
   191d0:	53                   	push   %rbx
   191d1:	48 89 fb             	mov    %rdi,%rbx
   191d4:	83 3a 01             	cmpl   $0x1,(%rdx)
   191d7:	75 1a                	jne    191f3 <<hyperinterval::float::F32Enclosure>::div+0x23>
   191d9:	83 7a 04 00          	cmpl   $0x0,0x4(%rdx)
   191dd:	7f 14                	jg     191f3 <<hyperinterval::float::F32Enclosure>::div+0x23>
   191df:	8b 42 08             	mov    0x8(%rdx),%eax
   191e2:	85 c0                	test   %eax,%eax
   191e4:	0f 99 c1             	setns  %cl
   191e7:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   191ec:	0f 94 c0             	sete   %al
   191ef:	08 c8                	or     %cl,%al
   191f1:	75 12                	jne    19205 <<hyperinterval::float::F32Enclosure>::div+0x35>
   191f3:	48 89 df             	mov    %rbx,%rdi
   191f6:	b9 01 00 00 00       	mov    $0x1,%ecx
   191fb:	e8 70 f4 ff ff       	call   18670 <<hyperinterval::float::F32Enclosure>::corner_image>
   19200:	48 89 d8             	mov    %rbx,%rax
   19203:	5b                   	pop    %rbx
   19204:	c3                   	ret
   19205:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
   19209:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1920f:	48 89 d8             	mov    %rbx,%rax
   19212:	5b                   	pop    %rbx
   19213:	c3                   	ret
   19214:	cc                   	int3
   19215:	cc                   	int3
   19216:	cc                   	int3
   19217:	cc                   	int3
   19218:	cc                   	int3
   19219:	cc                   	int3
   1921a:	cc                   	int3
   1921b:	cc                   	int3
   1921c:	cc                   	int3
   1921d:	cc                   	int3
   1921e:	cc                   	int3
   1921f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::new:
   19220:	41 57                	push   %r15
   19222:	41 56                	push   %r14
   19224:	53                   	push   %rbx
   19225:	48 83 ec 20          	sub    $0x20,%rsp
   19229:	f3 0f 11 4c 24 1c    	movss  %xmm1,0x1c(%rsp)
   1922f:	48 89 fb             	mov    %rdi,%rbx
   19232:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   19238:	66 0f 7e c1          	movd   %xmm0,%ecx
   1923c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19241:	be 00 00 00 80       	mov    $0x80000000,%esi
   19246:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1924b:	e8 e0 ef ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   19250:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19255:	74 2a                	je     19281 <<hyperinterval::float::F32Enclosure>::new+0x61>
   19257:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1925c:	66 0f 6e 44 24 1c    	movd   0x1c(%rsp),%xmm0
   19262:	66 0f 7e c1          	movd   %xmm0,%ecx
   19266:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1926b:	be 00 00 00 80       	mov    $0x80000000,%esi
   19270:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19275:	e8 b6 ef ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1927a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1927f:	75 1b                	jne    1929c <<hyperinterval::float::F32Enclosure>::new+0x7c>
   19281:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   19286:	88 43 04             	mov    %al,0x4(%rbx)
   19289:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1928f:	48 89 d8             	mov    %rbx,%rax
   19292:	48 83 c4 20          	add    $0x20,%rsp
   19296:	5b                   	pop    %rbx
   19297:	41 5e                	pop    %r14
   19299:	41 5f                	pop    %r15
   1929b:	c3                   	ret
   1929c:	8b 44 24 10          	mov    0x10(%rsp),%eax
   192a0:	44 89 f9             	mov    %r15d,%ecx
   192a3:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   192a9:	89 c2                	mov    %eax,%edx
   192ab:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   192b1:	be 00 00 00 80       	mov    $0x80000000,%esi
   192b6:	29 ce                	sub    %ecx,%esi
   192b8:	44 09 f1             	or     %r14d,%ecx
   192bb:	45 85 ff             	test   %r15d,%r15d
   192be:	48 0f 49 f1          	cmovns %rcx,%rsi
   192c2:	89 d1                	mov    %edx,%ecx
   192c4:	44 09 f1             	or     %r14d,%ecx
   192c7:	41 29 d6             	sub    %edx,%r14d
   192ca:	85 c0                	test   %eax,%eax
   192cc:	4c 0f 49 f1          	cmovns %rcx,%r14
   192d0:	44 39 f6             	cmp    %r14d,%esi
   192d3:	76 06                	jbe    192db <<hyperinterval::float::F32Enclosure>::new+0xbb>
   192d5:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   192d9:	eb ae                	jmp    19289 <<hyperinterval::float::F32Enclosure>::new+0x69>
   192db:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   192e1:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
   192e5:	89 43 08             	mov    %eax,0x8(%rbx)
   192e8:	eb a5                	jmp    1928f <<hyperinterval::float::F32Enclosure>::new+0x6f>
   192ea:	cc                   	int3
   192eb:	cc                   	int3
   192ec:	cc                   	int3
   192ed:	cc                   	int3
   192ee:	cc                   	int3
   192ef:	cc                   	int3

<hyperinterval::float::F32Enclosure>::sub:
   192f0:	53                   	push   %rbx
   192f1:	48 83 ec 10          	sub    $0x10,%rsp
   192f5:	48 89 fb             	mov    %rdi,%rbx
   192f8:	f6 02 01             	testb  $0x1,(%rdx)
   192fb:	74 29                	je     19326 <<hyperinterval::float::F32Enclosure>::sub+0x36>
   192fd:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   19302:	66 0f ef c9          	pxor   %xmm1,%xmm1
   19306:	66 0f 6f 15 52 c9 fe 	movdqa -0x136ae(%rip),%xmm2        # 5c60 <__abi_tag+0x5964>
   1930d:	ff 
   1930e:	66 0f ef d0          	pxor   %xmm0,%xmm2
   19312:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   19316:	66 0f df ca          	pandn  %xmm2,%xmm1
   1931a:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   1931f:	b8 01 00 00 00       	mov    $0x1,%eax
   19324:	eb 02                	jmp    19328 <<hyperinterval::float::F32Enclosure>::sub+0x38>
   19326:	31 c0                	xor    %eax,%eax
   19328:	89 44 24 04          	mov    %eax,0x4(%rsp)
   1932c:	66 0f d6 44 24 08    	movq   %xmm0,0x8(%rsp)
   19332:	48 8d 54 24 04       	lea    0x4(%rsp),%rdx
   19337:	48 89 df             	mov    %rbx,%rdi
   1933a:	ff 15 c8 32 04 00    	call   *0x432c8(%rip)        # 5c608 <_DYNAMIC+0x2d0>
   19340:	48 89 d8             	mov    %rbx,%rax
   19343:	48 83 c4 10          	add    $0x10,%rsp
   19347:	5b                   	pop    %rbx
   19348:	c3                   	ret
   19349:	cc                   	int3
   1934a:	cc                   	int3
   1934b:	cc                   	int3
   1934c:	cc                   	int3
   1934d:	cc                   	int3
   1934e:	cc                   	int3
   1934f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::hull:
   19350:	48 89 f8             	mov    %rdi,%rax
   19353:	44 8b 0e             	mov    (%rsi),%r9d
   19356:	44 8b 02             	mov    (%rdx),%r8d
   19359:	8b 7a 04             	mov    0x4(%rdx),%edi
   1935c:	8b 4a 08             	mov    0x8(%rdx),%ecx
   1935f:	41 f6 c1 01          	test   $0x1,%r9b
   19363:	0f 84 9b 00 00 00    	je     19404 <<hyperinterval::float::F32Enclosure>::hull+0xb4>
   19369:	8b 56 04             	mov    0x4(%rsi),%edx
   1936c:	8b 76 08             	mov    0x8(%rsi),%esi
   1936f:	41 f6 c0 01          	test   $0x1,%r8b
   19373:	0f 84 95 00 00 00    	je     1940e <<hyperinterval::float::F32Enclosure>::hull+0xbe>
   19379:	53                   	push   %rbx
   1937a:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   19380:	46 8d 0c 02          	lea    (%rdx,%r8,1),%r9d
   19384:	41 89 d2             	mov    %edx,%r10d
   19387:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1938e:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   19394:	45 29 d3             	sub    %r10d,%r11d
   19397:	85 d2                	test   %edx,%edx
   19399:	4d 0f 49 d9          	cmovns %r9,%r11
   1939d:	46 8d 0c 07          	lea    (%rdi,%r8,1),%r9d
   193a1:	41 89 fa             	mov    %edi,%r10d
   193a4:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   193ab:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   193b0:	44 29 d3             	sub    %r10d,%ebx
   193b3:	85 ff                	test   %edi,%edi
   193b5:	49 0f 49 d9          	cmovns %r9,%rbx
   193b9:	41 39 db             	cmp    %ebx,%r11d
   193bc:	0f 47 d7             	cmova  %edi,%edx
   193bf:	42 8d 3c 06          	lea    (%rsi,%r8,1),%edi
   193c3:	41 89 f1             	mov    %esi,%r9d
   193c6:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   193cd:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   193d3:	45 29 ca             	sub    %r9d,%r10d
   193d6:	85 f6                	test   %esi,%esi
   193d8:	4c 0f 49 d7          	cmovns %rdi,%r10
   193dc:	42 8d 3c 01          	lea    (%rcx,%r8,1),%edi
   193e0:	41 89 c9             	mov    %ecx,%r9d
   193e3:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   193ea:	45 29 c8             	sub    %r9d,%r8d
   193ed:	85 c9                	test   %ecx,%ecx
   193ef:	4c 0f 49 c7          	cmovns %rdi,%r8
   193f3:	45 39 c2             	cmp    %r8d,%r10d
   193f6:	0f 42 f1             	cmovb  %ecx,%esi
   193f9:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   193ff:	89 f1                	mov    %esi,%ecx
   19401:	89 d7                	mov    %edx,%edi
   19403:	5b                   	pop    %rbx
   19404:	44 89 00             	mov    %r8d,(%rax)
   19407:	89 78 04             	mov    %edi,0x4(%rax)
   1940a:	89 48 08             	mov    %ecx,0x8(%rax)
   1940d:	c3                   	ret
   1940e:	89 f1                	mov    %esi,%ecx
   19410:	89 d7                	mov    %edx,%edi
   19412:	45 89 c8             	mov    %r9d,%r8d
   19415:	44 89 00             	mov    %r8d,(%rax)
   19418:	89 78 04             	mov    %edi,0x4(%rax)
   1941b:	89 48 08             	mov    %ecx,0x8(%rax)
   1941e:	c3                   	ret
   1941f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::point:
   19420:	53                   	push   %rbx
   19421:	48 83 ec 10          	sub    $0x10,%rsp
   19425:	48 89 fb             	mov    %rdi,%rbx
   19428:	66 0f 7e c1          	movd   %xmm0,%ecx
   1942c:	48 89 e7             	mov    %rsp,%rdi
   1942f:	be 00 00 00 80       	mov    $0x80000000,%esi
   19434:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19439:	e8 f2 ed ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1943e:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19442:	75 0f                	jne    19453 <<hyperinterval::float::F32Enclosure>::point+0x33>
   19444:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   19449:	88 43 04             	mov    %al,0x4(%rbx)
   1944c:	b8 02 00 00 00       	mov    $0x2,%eax
   19451:	eb 0f                	jmp    19462 <<hyperinterval::float::F32Enclosure>::point+0x42>
   19453:	8b 44 24 08          	mov    0x8(%rsp),%eax
   19457:	89 43 04             	mov    %eax,0x4(%rbx)
   1945a:	89 43 08             	mov    %eax,0x8(%rbx)
   1945d:	b8 01 00 00 00       	mov    $0x1,%eax
   19462:	89 03                	mov    %eax,(%rbx)
   19464:	48 89 d8             	mov    %rbx,%rax
   19467:	48 83 c4 10          	add    $0x10,%rsp
   1946b:	5b                   	pop    %rbx
   1946c:	c3                   	ret
   1946d:	cc                   	int3
   1946e:	cc                   	int3
   1946f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::signs:
   19470:	83 3f 01             	cmpl   $0x1,(%rdi)
   19473:	75 65                	jne    194da <<hyperinterval::float::F32Enclosure>::signs+0x6a>
   19475:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   1947a:	8b 57 04             	mov    0x4(%rdi),%edx
   1947d:	8b 47 08             	mov    0x8(%rdi),%eax
   19480:	48 89 d6             	mov    %rdx,%rsi
   19483:	48 09 ce             	or     %rcx,%rsi
   19486:	41 89 d0             	mov    %edx,%r8d
   19489:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   19490:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19495:	4c 29 c7             	sub    %r8,%rdi
   19498:	85 d2                	test   %edx,%edx
   1949a:	48 0f 49 fe          	cmovns %rsi,%rdi
   1949e:	31 f6                	xor    %esi,%esi
   194a0:	f7 c7 00 00 00 80    	test   $0x80000000,%edi
   194a6:	0f 94 c2             	sete   %dl
   194a9:	48 39 cf             	cmp    %rcx,%rdi
   194ac:	77 1d                	ja     194cb <<hyperinterval::float::F32Enclosure>::signs+0x5b>
   194ae:	39 cf                	cmp    %ecx,%edi
   194b0:	0f 92 c1             	setb   %cl
   194b3:	80 c9 02             	or     $0x2,%cl
   194b6:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   194bb:	0f b6 c9             	movzbl %cl,%ecx
   194be:	40 88 d6             	mov    %dl,%sil
   194c1:	0f 44 f1             	cmove  %ecx,%esi
   194c4:	85 c0                	test   %eax,%eax
   194c6:	0f 49 f1             	cmovns %ecx,%esi
   194c9:	89 f2                	mov    %esi,%edx
   194cb:	8d 4a 04             	lea    0x4(%rdx),%ecx
   194ce:	85 c0                	test   %eax,%eax
   194d0:	0f b6 d2             	movzbl %dl,%edx
   194d3:	0f b6 c1             	movzbl %cl,%eax
   194d6:	0f 4e c2             	cmovle %edx,%eax
   194d9:	c3                   	ret
   194da:	31 c0                	xor    %eax,%eax
   194dc:	c3                   	ret
   194dd:	cc                   	int3
   194de:	cc                   	int3
   194df:	cc                   	int3

<hyperinterval::float::F32Enclosure>::affine:
   194e0:	55                   	push   %rbp
   194e1:	41 57                	push   %r15
   194e3:	41 56                	push   %r14
   194e5:	41 55                	push   %r13
   194e7:	41 54                	push   %r12
   194e9:	53                   	push   %rbx
   194ea:	48 83 ec 38          	sub    $0x38,%rsp
   194ee:	f3 0f 11 4c 24 18    	movss  %xmm1,0x18(%rsp)
   194f4:	49 89 f7             	mov    %rsi,%r15
   194f7:	48 89 fb             	mov    %rdi,%rbx
   194fa:	41 bc 00 00 00 80    	mov    $0x80000000,%r12d
   19500:	66 0f 7e c1          	movd   %xmm0,%ecx
   19504:	48 89 e7             	mov    %rsp,%rdi
   19507:	be 00 00 00 80       	mov    $0x80000000,%esi
   1950c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19511:	e8 1a ed ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   19516:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1951a:	74 27                	je     19543 <<hyperinterval::float::F32Enclosure>::affine+0x63>
   1951c:	44 8b 74 24 08       	mov    0x8(%rsp),%r14d
   19521:	66 0f 6e 44 24 18    	movd   0x18(%rsp),%xmm0
   19527:	66 0f 7e c1          	movd   %xmm0,%ecx
   1952b:	48 89 e7             	mov    %rsp,%rdi
   1952e:	be 00 00 00 80       	mov    $0x80000000,%esi
   19533:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19538:	e8 f3 ec ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1953d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19541:	75 20                	jne    19563 <<hyperinterval::float::F32Enclosure>::affine+0x83>
   19543:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   19548:	88 43 04             	mov    %al,0x4(%rbx)
   1954b:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19551:	48 89 d8             	mov    %rbx,%rax
   19554:	48 83 c4 38          	add    $0x38,%rsp
   19558:	5b                   	pop    %rbx
   19559:	41 5c                	pop    %r12
   1955b:	41 5d                	pop    %r13
   1955d:	41 5e                	pop    %r14
   1955f:	41 5f                	pop    %r15
   19561:	5d                   	pop    %rbp
   19562:	c3                   	ret
   19563:	41 f6 07 01          	testb  $0x1,(%r15)
   19567:	0f 84 b1 00 00 00    	je     1961e <<hyperinterval::float::F32Enclosure>::affine+0x13e>
   1956d:	44 8b 6c 24 08       	mov    0x8(%rsp),%r13d
   19572:	41 8b 4f 04          	mov    0x4(%r15),%ecx
   19576:	45 8b 7f 08          	mov    0x8(%r15),%r15d
   1957a:	48 89 e7             	mov    %rsp,%rdi
   1957d:	be 00 00 00 80       	mov    $0x80000000,%esi
   19582:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19587:	4d 89 f0             	mov    %r14,%r8
   1958a:	4d 89 e9             	mov    %r13,%r9
   1958d:	e8 6e 16 00 00       	call   1ac00 <<hyperinterval::ieee::Format>::affine>
   19592:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19596:	74 ab                	je     19543 <<hyperinterval::float::F32Enclosure>::affine+0x63>
   19598:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   1959c:	8b 44 24 10          	mov    0x10(%rsp),%eax
   195a0:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   195a5:	48 89 e7             	mov    %rsp,%rdi
   195a8:	be 00 00 00 80       	mov    $0x80000000,%esi
   195ad:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   195b2:	4c 89 f9             	mov    %r15,%rcx
   195b5:	4d 89 f0             	mov    %r14,%r8
   195b8:	4d 89 e9             	mov    %r13,%r9
   195bb:	e8 40 16 00 00       	call   1ac00 <<hyperinterval::ieee::Format>::affine>
   195c0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   195c4:	0f 84 79 ff ff ff    	je     19543 <<hyperinterval::float::F32Enclosure>::affine+0x63>
   195ca:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   195cf:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   195d4:	48 89 e7             	mov    %rsp,%rdi
   195d7:	be 00 00 00 80       	mov    $0x80000000,%esi
   195dc:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   195e1:	48 89 e9             	mov    %rbp,%rcx
   195e4:	e8 47 ec ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   195e9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   195ed:	74 22                	je     19611 <<hyperinterval::float::F32Enclosure>::affine+0x131>
   195ef:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   195f4:	48 89 e7             	mov    %rsp,%rdi
   195f7:	be 00 00 00 80       	mov    $0x80000000,%esi
   195fc:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19601:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   19606:	e8 25 ec ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1960b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1960f:	75 18                	jne    19629 <<hyperinterval::float::F32Enclosure>::affine+0x149>
   19611:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   19616:	88 4b 04             	mov    %cl,0x4(%rbx)
   19619:	e9 2d ff ff ff       	jmp    1954b <<hyperinterval::float::F32Enclosure>::affine+0x6b>
   1961e:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   19624:	e9 28 ff ff ff       	jmp    19551 <<hyperinterval::float::F32Enclosure>::affine+0x71>
   19629:	8b 44 24 08          	mov    0x8(%rsp),%eax
   1962d:	44 89 e9             	mov    %r13d,%ecx
   19630:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19636:	89 c2                	mov    %eax,%edx
   19638:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1963e:	be 00 00 00 80       	mov    $0x80000000,%esi
   19643:	29 ce                	sub    %ecx,%esi
   19645:	44 09 e1             	or     %r12d,%ecx
   19648:	45 85 ed             	test   %r13d,%r13d
   1964b:	48 0f 49 f1          	cmovns %rcx,%rsi
   1964f:	89 d1                	mov    %edx,%ecx
   19651:	44 09 e1             	or     %r12d,%ecx
   19654:	41 29 d4             	sub    %edx,%r12d
   19657:	85 c0                	test   %eax,%eax
   19659:	4c 0f 49 e1          	cmovns %rcx,%r12
   1965d:	b1 01                	mov    $0x1,%cl
   1965f:	44 39 e6             	cmp    %r12d,%esi
   19662:	77 b2                	ja     19616 <<hyperinterval::float::F32Enclosure>::affine+0x136>
   19664:	44 89 e9             	mov    %r13d,%ecx
   19667:	c1 e9 08             	shr    $0x8,%ecx
   1966a:	c7 44 24 20 01 00 00 	movl   $0x1,0x20(%rsp)
   19671:	00 
   19672:	44 88 6c 24 24       	mov    %r13b,0x24(%rsp)
   19677:	41 c1 ed 18          	shr    $0x18,%r13d
   1967b:	44 88 6c 24 27       	mov    %r13b,0x27(%rsp)
   19680:	66 89 4c 24 25       	mov    %cx,0x25(%rsp)
   19685:	89 44 24 28          	mov    %eax,0x28(%rsp)
   19689:	48 89 e7             	mov    %rsp,%rdi
   1968c:	4c 89 f6             	mov    %r14,%rsi
   1968f:	4c 89 fa             	mov    %r15,%rdx
   19692:	e8 99 06 00 00       	call   19d30 <<hyperinterval::float::F32Enclosure>::from_bits>
   19697:	8b 0c 24             	mov    (%rsp),%ecx
   1969a:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   1969f:	83 f9 02             	cmp    $0x2,%ecx
   196a2:	0f 84 a0 fe ff ff    	je     19548 <<hyperinterval::float::F32Enclosure>::affine+0x68>
   196a8:	8b 54 24 05          	mov    0x5(%rsp),%edx
   196ac:	8b 74 24 08          	mov    0x8(%rsp),%esi
   196b0:	89 74 24 34          	mov    %esi,0x34(%rsp)
   196b4:	89 54 24 31          	mov    %edx,0x31(%rsp)
   196b8:	89 4c 24 2c          	mov    %ecx,0x2c(%rsp)
   196bc:	88 44 24 30          	mov    %al,0x30(%rsp)
   196c0:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
   196c5:	48 8d 54 24 2c       	lea    0x2c(%rsp),%rdx
   196ca:	48 89 df             	mov    %rbx,%rdi
   196cd:	ff 15 9d 2f 04 00    	call   *0x42f9d(%rip)        # 5c670 <_DYNAMIC+0x338>
   196d3:	e9 79 fe ff ff       	jmp    19551 <<hyperinterval::float::F32Enclosure>::affine+0x71>
   196d8:	cc                   	int3
   196d9:	cc                   	int3
   196da:	cc                   	int3
   196db:	cc                   	int3
   196dc:	cc                   	int3
   196dd:	cc                   	int3
   196de:	cc                   	int3
   196df:	cc                   	int3

<hyperinterval::float::F32Enclosure>::square:
   196e0:	55                   	push   %rbp
   196e1:	41 57                	push   %r15
   196e3:	41 56                	push   %r14
   196e5:	41 55                	push   %r13
   196e7:	41 54                	push   %r12
   196e9:	53                   	push   %rbx
   196ea:	48 83 ec 78          	sub    $0x78,%rsp
   196ee:	48 89 fb             	mov    %rdi,%rbx
   196f1:	f6 06 01             	testb  $0x1,(%rsi)
   196f4:	0f 84 e9 00 00 00    	je     197e3 <<hyperinterval::float::F32Enclosure>::square+0x103>
   196fa:	44 8b 76 04          	mov    0x4(%rsi),%r14d
   196fe:	8b 6e 08             	mov    0x8(%rsi),%ebp
   19701:	44 89 f0             	mov    %r14d,%eax
   19704:	c1 e8 17             	shr    $0x17,%eax
   19707:	0f b6 c0             	movzbl %al,%eax
   1970a:	44 89 f1             	mov    %r14d,%ecx
   1970d:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   19713:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   1971a:	85 c0                	test   %eax,%eax
   1971c:	8d 84 00 d4 fe ff ff 	lea    -0x12c(%rax,%rax,1),%eax
   19723:	48 0f 44 d1          	cmove  %rcx,%rdx
   19727:	41 bf d6 fe ff ff    	mov    $0xfffffed6,%r15d
   1972d:	41 0f 44 c7          	cmove  %r15d,%eax
   19731:	48 0f af d2          	imul   %rdx,%rdx
   19735:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1973a:	48 89 14 24          	mov    %rdx,(%rsp)
   1973e:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   19745:	00 00 
   19747:	89 44 24 10          	mov    %eax,0x10(%rsp)
   1974b:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   19750:	48 89 e1             	mov    %rsp,%rcx
   19753:	be 00 00 00 80       	mov    $0x80000000,%esi
   19758:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1975d:	e8 ae 18 00 00       	call   1b010 <<hyperinterval::ieee::Format>::rounded>
   19762:	80 7c 24 38 00       	cmpb   $0x0,0x38(%rsp)
   19767:	75 6a                	jne    197d3 <<hyperinterval::float::F32Enclosure>::square+0xf3>
   19769:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
   1976e:	44 8b 64 24 48       	mov    0x48(%rsp),%r12d
   19773:	89 e8                	mov    %ebp,%eax
   19775:	c1 e8 17             	shr    $0x17,%eax
   19778:	0f b6 c0             	movzbl %al,%eax
   1977b:	89 e9                	mov    %ebp,%ecx
   1977d:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   19783:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   1978a:	85 c0                	test   %eax,%eax
   1978c:	48 0f 44 d1          	cmove  %rcx,%rdx
   19790:	8d 84 00 d4 fe ff ff 	lea    -0x12c(%rax,%rax,1),%eax
   19797:	41 0f 44 c7          	cmove  %r15d,%eax
   1979b:	48 0f af d2          	imul   %rdx,%rdx
   1979f:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   197a4:	48 89 14 24          	mov    %rdx,(%rsp)
   197a8:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   197af:	00 00 
   197b1:	89 44 24 10          	mov    %eax,0x10(%rsp)
   197b5:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   197ba:	48 89 e1             	mov    %rsp,%rcx
   197bd:	be 00 00 00 80       	mov    $0x80000000,%esi
   197c2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   197c7:	e8 44 18 00 00       	call   1b010 <<hyperinterval::ieee::Format>::rounded>
   197cc:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   197d1:	75 28                	jne    197fb <<hyperinterval::float::F32Enclosure>::square+0x11b>
   197d3:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
   197d8:	88 43 04             	mov    %al,0x4(%rbx)
   197db:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   197e1:	eb 06                	jmp    197e9 <<hyperinterval::float::F32Enclosure>::square+0x109>
   197e3:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   197e9:	48 89 d8             	mov    %rbx,%rax
   197ec:	48 83 c4 78          	add    $0x78,%rsp
   197f0:	5b                   	pop    %rbx
   197f1:	41 5c                	pop    %r12
   197f3:	41 5d                	pop    %r13
   197f5:	41 5e                	pop    %r14
   197f7:	41 5f                	pop    %r15
   197f9:	5d                   	pop    %rbp
   197fa:	c3                   	ret
   197fb:	8b 44 24 40          	mov    0x40(%rsp),%eax
   197ff:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   19804:	44 8b 7c 24 48       	mov    0x48(%rsp),%r15d
   19809:	48 89 e7             	mov    %rsp,%rdi
   1980c:	be 00 00 00 80       	mov    $0x80000000,%esi
   19811:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19816:	4c 89 e9             	mov    %r13,%rcx
   19819:	e8 12 ea ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1981e:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19822:	74 25                	je     19849 <<hyperinterval::float::F32Enclosure>::square+0x169>
   19824:	4c 89 7c 24 60       	mov    %r15,0x60(%rsp)
   19829:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1982e:	48 89 e7             	mov    %rsp,%rdi
   19831:	be 00 00 00 80       	mov    $0x80000000,%esi
   19836:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1983b:	4c 89 e1             	mov    %r12,%rcx
   1983e:	e8 ed e9 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   19843:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19847:	75 07                	jne    19850 <<hyperinterval::float::F32Enclosure>::square+0x170>
   19849:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1984e:	eb 88                	jmp    197d8 <<hyperinterval::float::F32Enclosure>::square+0xf8>
   19850:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   19855:	45 89 fd             	mov    %r15d,%r13d
   19858:	41 81 e5 ff ff ff 7f 	and    $0x7fffffff,%r13d
   1985f:	41 89 d4             	mov    %edx,%r12d
   19862:	41 81 e4 ff ff ff 7f 	and    $0x7fffffff,%r12d
   19869:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1986e:	4c 29 e8             	sub    %r13,%rax
   19871:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   19876:	49 09 cd             	or     %rcx,%r13
   19879:	45 85 ff             	test   %r15d,%r15d
   1987c:	4c 0f 48 e8          	cmovs  %rax,%r13
   19880:	b8 00 00 00 80       	mov    $0x80000000,%eax
   19885:	4c 29 e0             	sub    %r12,%rax
   19888:	49 09 cc             	or     %rcx,%r12
   1988b:	85 d2                	test   %edx,%edx
   1988d:	4c 0f 48 e0          	cmovs  %rax,%r12
   19891:	b0 01                	mov    $0x1,%al
   19893:	4d 39 e5             	cmp    %r12,%r13
   19896:	0f 87 3c ff ff ff    	ja     197d8 <<hyperinterval::float::F32Enclosure>::square+0xf8>
   1989c:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   198a1:	48 89 e7             	mov    %rsp,%rdi
   198a4:	be 00 00 00 80       	mov    $0x80000000,%esi
   198a9:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   198ae:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
   198b3:	e8 78 e9 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   198b8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   198bc:	74 27                	je     198e5 <<hyperinterval::float::F32Enclosure>::square+0x205>
   198be:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   198c3:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   198c8:	48 89 e7             	mov    %rsp,%rdi
   198cb:	be 00 00 00 80       	mov    $0x80000000,%esi
   198d0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   198d5:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   198da:	e8 51 e9 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   198df:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   198e3:	75 13                	jne    198f8 <<hyperinterval::float::F32Enclosure>::square+0x218>
   198e5:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   198ea:	88 53 04             	mov    %dl,0x4(%rbx)
   198ed:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   198f3:	e9 f1 fe ff ff       	jmp    197e9 <<hyperinterval::float::F32Enclosure>::square+0x109>
   198f8:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   198fd:	4c 8b 44 24 50       	mov    0x50(%rsp),%r8
   19902:	44 89 c1             	mov    %r8d,%ecx
   19905:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1990b:	89 c2                	mov    %eax,%edx
   1990d:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19913:	be 00 00 00 80       	mov    $0x80000000,%esi
   19918:	48 29 ce             	sub    %rcx,%rsi
   1991b:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19920:	48 09 f9             	or     %rdi,%rcx
   19923:	45 85 c0             	test   %r8d,%r8d
   19926:	48 0f 48 ce          	cmovs  %rsi,%rcx
   1992a:	48 8d 34 3a          	lea    (%rdx,%rdi,1),%rsi
   1992e:	48 29 d7             	sub    %rdx,%rdi
   19931:	85 c0                	test   %eax,%eax
   19933:	48 0f 49 fe          	cmovns %rsi,%rdi
   19937:	b2 01                	mov    $0x1,%dl
   19939:	48 39 f9             	cmp    %rdi,%rcx
   1993c:	77 ac                	ja     198ea <<hyperinterval::float::F32Enclosure>::square+0x20a>
   1993e:	41 39 cd             	cmp    %ecx,%r13d
   19941:	45 0f 47 f8          	cmova  %r8d,%r15d
   19945:	41 39 fc             	cmp    %edi,%r12d
   19948:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1994d:	0f 42 c8             	cmovb  %eax,%ecx
   19950:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%rsp)
   19957:	00 
   19958:	44 89 7c 24 2c       	mov    %r15d,0x2c(%rsp)
   1995d:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   19961:	45 85 f6             	test   %r14d,%r14d
   19964:	7f 6e                	jg     199d4 <<hyperinterval::float::F32Enclosure>::square+0x2f4>
   19966:	85 ed                	test   %ebp,%ebp
   19968:	0f 98 c0             	sets   %al
   1996b:	f7 c5 ff ff ff 7f    	test   $0x7fffffff,%ebp
   19971:	0f 95 c1             	setne  %cl
   19974:	84 c8                	test   %cl,%al
   19976:	75 5c                	jne    199d4 <<hyperinterval::float::F32Enclosure>::square+0x2f4>
   19978:	48 89 e7             	mov    %rsp,%rdi
   1997b:	31 f6                	xor    %esi,%esi
   1997d:	31 d2                	xor    %edx,%edx
   1997f:	e8 ac 03 00 00       	call   19d30 <<hyperinterval::float::F32Enclosure>::from_bits>
   19984:	8b 0c 24             	mov    (%rsp),%ecx
   19987:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   1998c:	83 f9 02             	cmp    $0x2,%ecx
   1998f:	0f 84 43 fe ff ff    	je     197d8 <<hyperinterval::float::F32Enclosure>::square+0xf8>
   19995:	8b 54 24 05          	mov    0x5(%rsp),%edx
   19999:	8b 74 24 08          	mov    0x8(%rsp),%esi
   1999d:	89 74 24 40          	mov    %esi,0x40(%rsp)
   199a1:	89 54 24 3d          	mov    %edx,0x3d(%rsp)
   199a5:	89 4c 24 38          	mov    %ecx,0x38(%rsp)
   199a9:	88 44 24 3c          	mov    %al,0x3c(%rsp)
   199ad:	48 8d 7c 24 6c       	lea    0x6c(%rsp),%rdi
   199b2:	48 8d 74 24 28       	lea    0x28(%rsp),%rsi
   199b7:	48 8d 54 24 38       	lea    0x38(%rsp),%rdx
   199bc:	ff 15 ae 2c 04 00    	call   *0x42cae(%rip)        # 5c670 <_DYNAMIC+0x338>
   199c2:	8b 44 24 74          	mov    0x74(%rsp),%eax
   199c6:	89 44 24 30          	mov    %eax,0x30(%rsp)
   199ca:	48 8b 44 24 6c       	mov    0x6c(%rsp),%rax
   199cf:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   199d4:	8b 44 24 30          	mov    0x30(%rsp),%eax
   199d8:	89 43 08             	mov    %eax,0x8(%rbx)
   199db:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   199e0:	48 89 03             	mov    %rax,(%rbx)
   199e3:	e9 01 fe ff ff       	jmp    197e9 <<hyperinterval::float::F32Enclosure>::square+0x109>
   199e8:	cc                   	int3
   199e9:	cc                   	int3
   199ea:	cc                   	int3
   199eb:	cc                   	int3
   199ec:	cc                   	int3
   199ed:	cc                   	int3
   199ee:	cc                   	int3
   199ef:	cc                   	int3

<hyperinterval::float::F32Enclosure>::next_up:
   199f0:	48 83 ec 18          	sub    $0x18,%rsp
   199f4:	66 0f 7e c1          	movd   %xmm0,%ecx
   199f8:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   199fd:	be 00 00 00 80       	mov    $0x80000000,%esi
   19a02:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19a07:	e8 24 e8 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   19a0c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19a11:	75 10                	jne    19a23 <<hyperinterval::float::F32Enclosure>::next_up+0x33>
   19a13:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   19a18:	c1 e0 08             	shl    $0x8,%eax
   19a1b:	48 ff c0             	inc    %rax
   19a1e:	48 83 c4 18          	add    $0x18,%rsp
   19a22:	c3                   	ret
   19a23:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   19a28:	31 c9                	xor    %ecx,%ecx
   19a2a:	85 c0                	test   %eax,%eax
   19a2c:	0f 99 c1             	setns  %cl
   19a2f:	48 8d 0c 48          	lea    (%rax,%rcx,2),%rcx
   19a33:	48 ff c9             	dec    %rcx
   19a36:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19a3b:	be 00 00 00 80       	mov    $0x80000000,%esi
   19a40:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19a45:	e8 e6 e7 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   19a4a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19a4f:	75 0a                	jne    19a5b <<hyperinterval::float::F32Enclosure>::next_up+0x6b>
   19a51:	b8 01 03 00 00       	mov    $0x301,%eax
   19a56:	48 83 c4 18          	add    $0x18,%rsp
   19a5a:	c3                   	ret
   19a5b:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   19a60:	48 c1 e0 20          	shl    $0x20,%rax
   19a64:	48 83 c4 18          	add    $0x18,%rsp
   19a68:	c3                   	ret
   19a69:	cc                   	int3
   19a6a:	cc                   	int3
   19a6b:	cc                   	int3
   19a6c:	cc                   	int3
   19a6d:	cc                   	int3
   19a6e:	cc                   	int3
   19a6f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::disjoint:
   19a70:	83 3f 00             	cmpl   $0x0,(%rdi)
   19a73:	b0 01                	mov    $0x1,%al
   19a75:	0f 84 a3 00 00 00    	je     19b1e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   19a7b:	8b 0e                	mov    (%rsi),%ecx
   19a7d:	85 c9                	test   %ecx,%ecx
   19a7f:	0f 84 99 00 00 00    	je     19b1e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   19a85:	f6 c1 01             	test   $0x1,%cl
   19a88:	74 4c                	je     19ad6 <<hyperinterval::float::F32Enclosure>::disjoint+0x66>
   19a8a:	53                   	push   %rbx
   19a8b:	8b 56 04             	mov    0x4(%rsi),%edx
   19a8e:	44 8b 47 08          	mov    0x8(%rdi),%r8d
   19a92:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   19a98:	45 89 c2             	mov    %r8d,%r10d
   19a9b:	45 09 ca             	or     %r9d,%r10d
   19a9e:	45 89 c3             	mov    %r8d,%r11d
   19aa1:	41 81 e3 ff ff ff 7f 	and    $0x7fffffff,%r11d
   19aa8:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   19aad:	44 29 db             	sub    %r11d,%ebx
   19ab0:	45 85 c0             	test   %r8d,%r8d
   19ab3:	49 0f 49 da          	cmovns %r10,%rbx
   19ab7:	41 89 d0             	mov    %edx,%r8d
   19aba:	45 09 c8             	or     %r9d,%r8d
   19abd:	41 89 d2             	mov    %edx,%r10d
   19ac0:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   19ac7:	45 29 d1             	sub    %r10d,%r9d
   19aca:	85 d2                	test   %edx,%edx
   19acc:	4d 0f 49 c8          	cmovns %r8,%r9
   19ad0:	44 39 cb             	cmp    %r9d,%ebx
   19ad3:	5b                   	pop    %rbx
   19ad4:	72 48                	jb     19b1e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   19ad6:	f6 c1 01             	test   $0x1,%cl
   19ad9:	75 03                	jne    19ade <<hyperinterval::float::F32Enclosure>::disjoint+0x6e>
   19adb:	31 c0                	xor    %eax,%eax
   19add:	c3                   	ret
   19ade:	8b 47 04             	mov    0x4(%rdi),%eax
   19ae1:	8b 4e 08             	mov    0x8(%rsi),%ecx
   19ae4:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19ae9:	89 ce                	mov    %ecx,%esi
   19aeb:	09 d6                	or     %edx,%esi
   19aed:	89 cf                	mov    %ecx,%edi
   19aef:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   19af5:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   19afb:	41 29 f8             	sub    %edi,%r8d
   19afe:	85 c9                	test   %ecx,%ecx
   19b00:	4c 0f 49 c6          	cmovns %rsi,%r8
   19b04:	89 c1                	mov    %eax,%ecx
   19b06:	09 d1                	or     %edx,%ecx
   19b08:	89 c6                	mov    %eax,%esi
   19b0a:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   19b10:	29 f2                	sub    %esi,%edx
   19b12:	85 c0                	test   %eax,%eax
   19b14:	48 0f 49 d1          	cmovns %rcx,%rdx
   19b18:	41 39 d0             	cmp    %edx,%r8d
   19b1b:	0f 92 c0             	setb   %al
   19b1e:	c3                   	ret
   19b1f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::expanded:
   19b20:	41 57                	push   %r15
   19b22:	41 56                	push   %r14
   19b24:	41 54                	push   %r12
   19b26:	53                   	push   %rbx
   19b27:	48 83 ec 18          	sub    $0x18,%rsp
   19b2b:	48 89 fb             	mov    %rdi,%rbx
   19b2e:	f6 06 01             	testb  $0x1,(%rsi)
   19b31:	74 7c                	je     19baf <<hyperinterval::float::F32Enclosure>::expanded+0x8f>
   19b33:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   19b39:	8b 46 04             	mov    0x4(%rsi),%eax
   19b3c:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   19b40:	8d 88 00 00 00 80    	lea    -0x80000000(%rax),%ecx
   19b46:	85 c0                	test   %eax,%eax
   19b48:	0f 44 c8             	cmove  %eax,%ecx
   19b4b:	31 c0                	xor    %eax,%eax
   19b4d:	85 c9                	test   %ecx,%ecx
   19b4f:	0f 99 c0             	setns  %al
   19b52:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
   19b56:	48 ff c9             	dec    %rcx
   19b59:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19b5e:	be 00 00 00 80       	mov    $0x80000000,%esi
   19b63:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19b68:	e8 c3 e6 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   19b6d:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19b72:	75 2f                	jne    19ba3 <<hyperinterval::float::F32Enclosure>::expanded+0x83>
   19b74:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   19b79:	31 c0                	xor    %eax,%eax
   19b7b:	45 85 f6             	test   %r14d,%r14d
   19b7e:	0f 99 c0             	setns  %al
   19b81:	49 8d 0c 46          	lea    (%r14,%rax,2),%rcx
   19b85:	48 ff c9             	dec    %rcx
   19b88:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19b8d:	be 00 00 00 80       	mov    $0x80000000,%esi
   19b92:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19b97:	e8 94 e6 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   19b9c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19ba1:	75 21                	jne    19bc4 <<hyperinterval::float::F32Enclosure>::expanded+0xa4>
   19ba3:	c6 43 04 03          	movb   $0x3,0x4(%rbx)
   19ba7:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19bad:	eb 06                	jmp    19bb5 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   19baf:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   19bb5:	48 89 d8             	mov    %rbx,%rax
   19bb8:	48 83 c4 18          	add    $0x18,%rsp
   19bbc:	5b                   	pop    %rbx
   19bbd:	41 5c                	pop    %r12
   19bbf:	41 5e                	pop    %r14
   19bc1:	41 5f                	pop    %r15
   19bc3:	c3                   	ret
   19bc4:	44 89 e1             	mov    %r12d,%ecx
   19bc7:	4c 31 f9             	xor    %r15,%rcx
   19bca:	4d 85 e4             	test   %r12,%r12
   19bcd:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   19bd2:	49 0f 44 cc          	cmove  %r12,%rcx
   19bd6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19bdb:	be 00 00 00 80       	mov    $0x80000000,%esi
   19be0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19be5:	e8 46 e6 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   19bea:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19bef:	74 23                	je     19c14 <<hyperinterval::float::F32Enclosure>::expanded+0xf4>
   19bf1:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   19bf6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19bfb:	be 00 00 00 80       	mov    $0x80000000,%esi
   19c00:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19c05:	4c 89 f1             	mov    %r14,%rcx
   19c08:	e8 23 e6 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   19c0d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19c12:	75 10                	jne    19c24 <<hyperinterval::float::F32Enclosure>::expanded+0x104>
   19c14:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   19c19:	88 43 04             	mov    %al,0x4(%rbx)
   19c1c:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19c22:	eb 91                	jmp    19bb5 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   19c24:	8b 44 24 10          	mov    0x10(%rsp),%eax
   19c28:	44 89 e1             	mov    %r12d,%ecx
   19c2b:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19c31:	89 c2                	mov    %eax,%edx
   19c33:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19c39:	be 00 00 00 80       	mov    $0x80000000,%esi
   19c3e:	29 ce                	sub    %ecx,%esi
   19c40:	44 09 f9             	or     %r15d,%ecx
   19c43:	45 85 e4             	test   %r12d,%r12d
   19c46:	48 0f 49 f1          	cmovns %rcx,%rsi
   19c4a:	89 d1                	mov    %edx,%ecx
   19c4c:	44 09 f9             	or     %r15d,%ecx
   19c4f:	41 29 d7             	sub    %edx,%r15d
   19c52:	85 c0                	test   %eax,%eax
   19c54:	4c 0f 49 f9          	cmovns %rcx,%r15
   19c58:	44 39 fe             	cmp    %r15d,%esi
   19c5b:	76 0f                	jbe    19c6c <<hyperinterval::float::F32Enclosure>::expanded+0x14c>
   19c5d:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   19c61:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19c67:	e9 49 ff ff ff       	jmp    19bb5 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   19c6c:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   19c72:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   19c76:	89 43 08             	mov    %eax,0x8(%rbx)
   19c79:	e9 37 ff ff ff       	jmp    19bb5 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   19c7e:	cc                   	int3
   19c7f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::overlaps:
   19c80:	31 c0                	xor    %eax,%eax
   19c82:	83 3f 00             	cmpl   $0x0,(%rdi)
   19c85:	0f 84 a1 00 00 00    	je     19d2c <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   19c8b:	8b 0e                	mov    (%rsi),%ecx
   19c8d:	85 c9                	test   %ecx,%ecx
   19c8f:	0f 84 97 00 00 00    	je     19d2c <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   19c95:	f6 c1 01             	test   $0x1,%cl
   19c98:	74 4b                	je     19ce5 <<hyperinterval::float::F32Enclosure>::overlaps+0x65>
   19c9a:	8b 46 04             	mov    0x4(%rsi),%eax
   19c9d:	8b 57 08             	mov    0x8(%rdi),%edx
   19ca0:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   19ca6:	41 89 d1             	mov    %edx,%r9d
   19ca9:	45 09 c1             	or     %r8d,%r9d
   19cac:	41 89 d2             	mov    %edx,%r10d
   19caf:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   19cb6:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   19cbc:	45 29 d3             	sub    %r10d,%r11d
   19cbf:	85 d2                	test   %edx,%edx
   19cc1:	4d 0f 49 d9          	cmovns %r9,%r11
   19cc5:	89 c2                	mov    %eax,%edx
   19cc7:	44 09 c2             	or     %r8d,%edx
   19cca:	41 89 c1             	mov    %eax,%r9d
   19ccd:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   19cd4:	45 29 c8             	sub    %r9d,%r8d
   19cd7:	85 c0                	test   %eax,%eax
   19cd9:	4c 0f 49 c2          	cmovns %rdx,%r8
   19cdd:	45 39 c3             	cmp    %r8d,%r11d
   19ce0:	73 03                	jae    19ce5 <<hyperinterval::float::F32Enclosure>::overlaps+0x65>
   19ce2:	31 c0                	xor    %eax,%eax
   19ce4:	c3                   	ret
   19ce5:	b0 01                	mov    $0x1,%al
   19ce7:	f6 c1 01             	test   $0x1,%cl
   19cea:	74 40                	je     19d2c <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   19cec:	8b 47 04             	mov    0x4(%rdi),%eax
   19cef:	8b 4e 08             	mov    0x8(%rsi),%ecx
   19cf2:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19cf7:	89 ce                	mov    %ecx,%esi
   19cf9:	09 d6                	or     %edx,%esi
   19cfb:	89 cf                	mov    %ecx,%edi
   19cfd:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   19d03:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   19d09:	41 29 f8             	sub    %edi,%r8d
   19d0c:	85 c9                	test   %ecx,%ecx
   19d0e:	4c 0f 49 c6          	cmovns %rsi,%r8
   19d12:	89 c1                	mov    %eax,%ecx
   19d14:	09 d1                	or     %edx,%ecx
   19d16:	89 c6                	mov    %eax,%esi
   19d18:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   19d1e:	29 f2                	sub    %esi,%edx
   19d20:	85 c0                	test   %eax,%eax
   19d22:	48 0f 49 d1          	cmovns %rcx,%rdx
   19d26:	41 39 d0             	cmp    %edx,%r8d
   19d29:	0f 93 c0             	setae  %al
   19d2c:	c3                   	ret
   19d2d:	cc                   	int3
   19d2e:	cc                   	int3
   19d2f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::from_bits:
   19d30:	41 57                	push   %r15
   19d32:	41 56                	push   %r14
   19d34:	41 54                	push   %r12
   19d36:	53                   	push   %rbx
   19d37:	48 83 ec 18          	sub    $0x18,%rsp
   19d3b:	49 89 d6             	mov    %rdx,%r14
   19d3e:	48 89 fb             	mov    %rdi,%rbx
   19d41:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   19d47:	89 f1                	mov    %esi,%ecx
   19d49:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19d4e:	be 00 00 00 80       	mov    $0x80000000,%esi
   19d53:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19d58:	e8 d3 e4 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   19d5d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19d62:	74 23                	je     19d87 <<hyperinterval::float::F32Enclosure>::from_bits+0x57>
   19d64:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   19d69:	44 89 f1             	mov    %r14d,%ecx
   19d6c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19d71:	be 00 00 00 80       	mov    $0x80000000,%esi
   19d76:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19d7b:	e8 b0 e4 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   19d80:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19d85:	75 1a                	jne    19da1 <<hyperinterval::float::F32Enclosure>::from_bits+0x71>
   19d87:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   19d8c:	88 43 04             	mov    %al,0x4(%rbx)
   19d8f:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19d95:	48 83 c4 18          	add    $0x18,%rsp
   19d99:	5b                   	pop    %rbx
   19d9a:	41 5c                	pop    %r12
   19d9c:	41 5e                	pop    %r14
   19d9e:	41 5f                	pop    %r15
   19da0:	c3                   	ret
   19da1:	8b 44 24 10          	mov    0x10(%rsp),%eax
   19da5:	44 89 e1             	mov    %r12d,%ecx
   19da8:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19dae:	89 c2                	mov    %eax,%edx
   19db0:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19db6:	be 00 00 00 80       	mov    $0x80000000,%esi
   19dbb:	29 ce                	sub    %ecx,%esi
   19dbd:	44 09 f9             	or     %r15d,%ecx
   19dc0:	45 85 e4             	test   %r12d,%r12d
   19dc3:	48 0f 49 f1          	cmovns %rcx,%rsi
   19dc7:	89 d1                	mov    %edx,%ecx
   19dc9:	44 09 f9             	or     %r15d,%ecx
   19dcc:	41 29 d7             	sub    %edx,%r15d
   19dcf:	85 c0                	test   %eax,%eax
   19dd1:	4c 0f 49 f9          	cmovns %rcx,%r15
   19dd5:	44 39 fe             	cmp    %r15d,%esi
   19dd8:	76 06                	jbe    19de0 <<hyperinterval::float::F32Enclosure>::from_bits+0xb0>
   19dda:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   19dde:	eb af                	jmp    19d8f <<hyperinterval::float::F32Enclosure>::from_bits+0x5f>
   19de0:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   19de6:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   19dea:	89 43 08             	mov    %eax,0x8(%rbx)
   19ded:	eb a6                	jmp    19d95 <<hyperinterval::float::F32Enclosure>::from_bits+0x65>
   19def:	cc                   	int3

<hyperinterval::float::F32Enclosure>::max_image:
   19df0:	48 89 f8             	mov    %rdi,%rax
   19df3:	31 c9                	xor    %ecx,%ecx
   19df5:	f6 06 01             	testb  $0x1,(%rsi)
   19df8:	0f 84 db 00 00 00    	je     19ed9 <<hyperinterval::float::F32Enclosure>::max_image+0xe9>
   19dfe:	f6 02 01             	testb  $0x1,(%rdx)
   19e01:	0f 84 ca 00 00 00    	je     19ed1 <<hyperinterval::float::F32Enclosure>::max_image+0xe1>
   19e07:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   19e0c:	f3 0f 7e 4e 04       	movq   0x4(%rsi),%xmm1
   19e11:	66 0f ef d2          	pxor   %xmm2,%xmm2
   19e15:	66 0f 6f e1          	movdqa %xmm1,%xmm4
   19e19:	66 0f 62 e2          	punpckldq %xmm2,%xmm4
   19e1d:	66 0f 6f e8          	movdqa %xmm0,%xmm5
   19e21:	66 0f 62 ea          	punpckldq %xmm2,%xmm5
   19e25:	66 0f 6f 1d 13 c0 fe 	movdqa -0x13fed(%rip),%xmm3        # 5e40 <__abi_tag+0x5b44>
   19e2c:	ff 
   19e2d:	66 0f 6f f4          	movdqa %xmm4,%xmm6
   19e31:	66 0f eb f3          	por    %xmm3,%xmm6
   19e35:	66 0f 6f 3d c3 bd fe 	movdqa -0x1423d(%rip),%xmm7        # 5c00 <__abi_tag+0x5904>
   19e3c:	ff 
   19e3d:	66 0f db e7          	pand   %xmm7,%xmm4
   19e41:	66 44 0f 6f c3       	movdqa %xmm3,%xmm8
   19e46:	66 44 0f fb c4       	psubq  %xmm4,%xmm8
   19e4b:	66 0f 70 e1 50       	pshufd $0x50,%xmm1,%xmm4
   19e50:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
   19e55:	66 44 0f 66 cc       	pcmpgtd %xmm4,%xmm9
   19e5a:	66 45 0f db c1       	pand   %xmm9,%xmm8
   19e5f:	66 44 0f df ce       	pandn  %xmm6,%xmm9
   19e64:	66 45 0f eb c8       	por    %xmm8,%xmm9
   19e69:	66 0f 6f e5          	movdqa %xmm5,%xmm4
   19e6d:	66 0f eb e3          	por    %xmm3,%xmm4
   19e71:	66 0f db ef          	pand   %xmm7,%xmm5
   19e75:	66 0f 6f f3          	movdqa %xmm3,%xmm6
   19e79:	66 0f fb f5          	psubq  %xmm5,%xmm6
   19e7d:	66 0f 70 e8 50       	pshufd $0x50,%xmm0,%xmm5
   19e82:	66 0f 66 d5          	pcmpgtd %xmm5,%xmm2
   19e86:	66 0f db f2          	pand   %xmm2,%xmm6
   19e8a:	66 0f df d4          	pandn  %xmm4,%xmm2
   19e8e:	66 0f eb d6          	por    %xmm6,%xmm2
   19e92:	66 44 0f ef cb       	pxor   %xmm3,%xmm9
   19e97:	66 0f ef d3          	pxor   %xmm3,%xmm2
   19e9b:	66 0f 6f da          	movdqa %xmm2,%xmm3
   19e9f:	66 41 0f 66 d9       	pcmpgtd %xmm9,%xmm3
   19ea4:	66 0f 70 e3 e8       	pshufd $0xe8,%xmm3,%xmm4
   19ea9:	66 41 0f 76 d1       	pcmpeqd %xmm9,%xmm2
   19eae:	66 0f 70 ea fd       	pshufd $0xfd,%xmm2,%xmm5
   19eb3:	66 0f db ec          	pand   %xmm4,%xmm5
   19eb7:	66 0f 70 d3 fd       	pshufd $0xfd,%xmm3,%xmm2
   19ebc:	66 0f eb d5          	por    %xmm5,%xmm2
   19ec0:	66 0f db c2          	pand   %xmm2,%xmm0
   19ec4:	66 0f df d1          	pandn  %xmm1,%xmm2
   19ec8:	66 0f eb d0          	por    %xmm0,%xmm2
   19ecc:	b9 01 00 00 00       	mov    $0x1,%ecx
   19ed1:	89 08                	mov    %ecx,(%rax)
   19ed3:	66 0f d6 50 04       	movq   %xmm2,0x4(%rax)
   19ed8:	c3                   	ret
   19ed9:	89 08                	mov    %ecx,(%rax)
   19edb:	0f 13 50 04          	movlps %xmm2,0x4(%rax)
   19edf:	c3                   	ret

<hyperinterval::float::F32Enclosure>::min_image:
   19ee0:	48 89 f8             	mov    %rdi,%rax
   19ee3:	31 c9                	xor    %ecx,%ecx
   19ee5:	f6 06 01             	testb  $0x1,(%rsi)
   19ee8:	0f 84 dc 00 00 00    	je     19fca <<hyperinterval::float::F32Enclosure>::min_image+0xea>
   19eee:	f6 02 01             	testb  $0x1,(%rdx)
   19ef1:	0f 84 cb 00 00 00    	je     19fc2 <<hyperinterval::float::F32Enclosure>::min_image+0xe2>
   19ef7:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   19efc:	f3 0f 7e 4e 04       	movq   0x4(%rsi),%xmm1
   19f01:	66 0f ef d2          	pxor   %xmm2,%xmm2
   19f05:	66 0f 6f e1          	movdqa %xmm1,%xmm4
   19f09:	66 0f 62 e2          	punpckldq %xmm2,%xmm4
   19f0d:	66 0f 6f e8          	movdqa %xmm0,%xmm5
   19f11:	66 0f 62 ea          	punpckldq %xmm2,%xmm5
   19f15:	66 0f 6f 1d 23 bf fe 	movdqa -0x140dd(%rip),%xmm3        # 5e40 <__abi_tag+0x5b44>
   19f1c:	ff 
   19f1d:	66 0f 6f f4          	movdqa %xmm4,%xmm6
   19f21:	66 0f eb f3          	por    %xmm3,%xmm6
   19f25:	66 0f 6f 3d d3 bc fe 	movdqa -0x1432d(%rip),%xmm7        # 5c00 <__abi_tag+0x5904>
   19f2c:	ff 
   19f2d:	66 0f db e7          	pand   %xmm7,%xmm4
   19f31:	66 44 0f 6f c3       	movdqa %xmm3,%xmm8
   19f36:	66 44 0f fb c4       	psubq  %xmm4,%xmm8
   19f3b:	66 0f 70 e1 50       	pshufd $0x50,%xmm1,%xmm4
   19f40:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
   19f45:	66 44 0f 66 cc       	pcmpgtd %xmm4,%xmm9
   19f4a:	66 45 0f db c1       	pand   %xmm9,%xmm8
   19f4f:	66 44 0f df ce       	pandn  %xmm6,%xmm9
   19f54:	66 45 0f eb c8       	por    %xmm8,%xmm9
   19f59:	66 0f 6f e5          	movdqa %xmm5,%xmm4
   19f5d:	66 0f eb e3          	por    %xmm3,%xmm4
   19f61:	66 0f db ef          	pand   %xmm7,%xmm5
   19f65:	66 0f 6f f3          	movdqa %xmm3,%xmm6
   19f69:	66 0f fb f5          	psubq  %xmm5,%xmm6
   19f6d:	66 0f 70 e8 50       	pshufd $0x50,%xmm0,%xmm5
   19f72:	66 0f 66 d5          	pcmpgtd %xmm5,%xmm2
   19f76:	66 0f db f2          	pand   %xmm2,%xmm6
   19f7a:	66 0f df d4          	pandn  %xmm4,%xmm2
   19f7e:	66 0f eb d6          	por    %xmm6,%xmm2
   19f82:	66 0f ef d3          	pxor   %xmm3,%xmm2
   19f86:	66 44 0f ef cb       	pxor   %xmm3,%xmm9
   19f8b:	66 41 0f 6f d9       	movdqa %xmm9,%xmm3
   19f90:	66 0f 66 da          	pcmpgtd %xmm2,%xmm3
   19f94:	66 0f 70 e3 e8       	pshufd $0xe8,%xmm3,%xmm4
   19f99:	66 44 0f 76 ca       	pcmpeqd %xmm2,%xmm9
   19f9e:	66 41 0f 70 e9 fd    	pshufd $0xfd,%xmm9,%xmm5
   19fa4:	66 0f db ec          	pand   %xmm4,%xmm5
   19fa8:	66 0f 70 d3 fd       	pshufd $0xfd,%xmm3,%xmm2
   19fad:	66 0f eb d5          	por    %xmm5,%xmm2
   19fb1:	66 0f db c2          	pand   %xmm2,%xmm0
   19fb5:	66 0f df d1          	pandn  %xmm1,%xmm2
   19fb9:	66 0f eb d0          	por    %xmm0,%xmm2
   19fbd:	b9 01 00 00 00       	mov    $0x1,%ecx
   19fc2:	89 08                	mov    %ecx,(%rax)
   19fc4:	66 0f d6 50 04       	movq   %xmm2,0x4(%rax)
   19fc9:	c3                   	ret
   19fca:	89 08                	mov    %ecx,(%rax)
   19fcc:	0f 13 50 04          	movlps %xmm2,0x4(%rax)
   19fd0:	c3                   	ret
   19fd1:	cc                   	int3
   19fd2:	cc                   	int3
   19fd3:	cc                   	int3
   19fd4:	cc                   	int3
   19fd5:	cc                   	int3
   19fd6:	cc                   	int3
   19fd7:	cc                   	int3
   19fd8:	cc                   	int3
   19fd9:	cc                   	int3
   19fda:	cc                   	int3
   19fdb:	cc                   	int3
   19fdc:	cc                   	int3
   19fdd:	cc                   	int3
   19fde:	cc                   	int3
   19fdf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::next_down:
   19fe0:	53                   	push   %rbx
   19fe1:	48 83 ec 10          	sub    $0x10,%rsp
   19fe5:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   19fea:	66 0f 7e c1          	movd   %xmm0,%ecx
   19fee:	48 89 e7             	mov    %rsp,%rdi
   19ff1:	be 00 00 00 80       	mov    $0x80000000,%esi
   19ff6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19ffb:	e8 30 e2 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1a000:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a004:	75 11                	jne    1a017 <<hyperinterval::float::F32Enclosure>::next_down+0x37>
   1a006:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a00b:	c1 e0 08             	shl    $0x8,%eax
   1a00e:	48 ff c0             	inc    %rax
   1a011:	48 83 c4 10          	add    $0x10,%rsp
   1a015:	5b                   	pop    %rbx
   1a016:	c3                   	ret
   1a017:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a01c:	48 89 c1             	mov    %rax,%rcx
   1a01f:	48 31 d9             	xor    %rbx,%rcx
   1a022:	48 85 c0             	test   %rax,%rax
   1a025:	48 0f 44 c8          	cmove  %rax,%rcx
   1a029:	31 c0                	xor    %eax,%eax
   1a02b:	85 c9                	test   %ecx,%ecx
   1a02d:	0f 99 c0             	setns  %al
   1a030:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
   1a034:	48 ff c9             	dec    %rcx
   1a037:	48 89 e7             	mov    %rsp,%rdi
   1a03a:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a03f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a044:	e8 e7 e1 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1a049:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a04d:	75 0b                	jne    1a05a <<hyperinterval::float::F32Enclosure>::next_down+0x7a>
   1a04f:	b8 01 03 00 00       	mov    $0x301,%eax
   1a054:	48 83 c4 10          	add    $0x10,%rsp
   1a058:	5b                   	pop    %rbx
   1a059:	c3                   	ret
   1a05a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a05f:	48 89 c8             	mov    %rcx,%rax
   1a062:	48 35 00 00 00 80    	xor    $0xffffffff80000000,%rax
   1a068:	48 c1 e0 20          	shl    $0x20,%rax
   1a06c:	48 85 c9             	test   %rcx,%rcx
   1a06f:	48 0f 44 c1          	cmove  %rcx,%rax
   1a073:	48 83 c4 10          	add    $0x10,%rsp
   1a077:	5b                   	pop    %rbx
   1a078:	c3                   	ret
   1a079:	cc                   	int3
   1a07a:	cc                   	int3
   1a07b:	cc                   	int3
   1a07c:	cc                   	int3
   1a07d:	cc                   	int3
   1a07e:	cc                   	int3
   1a07f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::subset_of:
   1a080:	b0 01                	mov    $0x1,%al
   1a082:	f6 07 01             	testb  $0x1,(%rdi)
   1a085:	74 50                	je     1a0d7 <<hyperinterval::float::F32Enclosure>::subset_of+0x57>
   1a087:	f6 06 01             	testb  $0x1,(%rsi)
   1a08a:	74 49                	je     1a0d5 <<hyperinterval::float::F32Enclosure>::subset_of+0x55>
   1a08c:	8b 4f 04             	mov    0x4(%rdi),%ecx
   1a08f:	8b 56 04             	mov    0x4(%rsi),%edx
   1a092:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1a097:	44 8d 04 02          	lea    (%rdx,%rax,1),%r8d
   1a09b:	41 89 d1             	mov    %edx,%r9d
   1a09e:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1a0a5:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1a0ab:	45 29 ca             	sub    %r9d,%r10d
   1a0ae:	85 d2                	test   %edx,%edx
   1a0b0:	4d 0f 49 d0          	cmovns %r8,%r10
   1a0b4:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1a0b7:	41 89 c8             	mov    %ecx,%r8d
   1a0ba:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1a0c1:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1a0c7:	45 29 c1             	sub    %r8d,%r9d
   1a0ca:	85 c9                	test   %ecx,%ecx
   1a0cc:	4c 0f 49 ca          	cmovns %rdx,%r9
   1a0d0:	45 39 ca             	cmp    %r9d,%r10d
   1a0d3:	76 03                	jbe    1a0d8 <<hyperinterval::float::F32Enclosure>::subset_of+0x58>
   1a0d5:	31 c0                	xor    %eax,%eax
   1a0d7:	c3                   	ret
   1a0d8:	8b 4f 08             	mov    0x8(%rdi),%ecx
   1a0db:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1a0de:	89 cf                	mov    %ecx,%edi
   1a0e0:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1a0e6:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1a0ec:	41 29 f8             	sub    %edi,%r8d
   1a0ef:	85 c9                	test   %ecx,%ecx
   1a0f1:	4c 0f 49 c2          	cmovns %rdx,%r8
   1a0f5:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1a0f8:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1a0fb:	89 ce                	mov    %ecx,%esi
   1a0fd:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1a103:	29 f0                	sub    %esi,%eax
   1a105:	85 c9                	test   %ecx,%ecx
   1a107:	48 0f 49 c2          	cmovns %rdx,%rax
   1a10b:	41 39 c0             	cmp    %eax,%r8d
   1a10e:	0f 96 c0             	setbe  %al
   1a111:	c3                   	ret
   1a112:	cc                   	int3
   1a113:	cc                   	int3
   1a114:	cc                   	int3
   1a115:	cc                   	int3
   1a116:	cc                   	int3
   1a117:	cc                   	int3
   1a118:	cc                   	int3
   1a119:	cc                   	int3
   1a11a:	cc                   	int3
   1a11b:	cc                   	int3
   1a11c:	cc                   	int3
   1a11d:	cc                   	int3
   1a11e:	cc                   	int3
   1a11f:	cc                   	int3

<hyperinterval::ieee::Format>::add:
   1a120:	48 85 c9             	test   %rcx,%rcx
   1a123:	74 50                	je     1a175 <<hyperinterval::ieee::Format>::add+0x55>
   1a125:	48 89 c8             	mov    %rcx,%rax
   1a128:	4d 85 c0             	test   %r8,%r8
   1a12b:	74 54                	je     1a181 <<hyperinterval::ieee::Format>::add+0x61>
   1a12d:	55                   	push   %rbp
   1a12e:	41 57                	push   %r15
   1a130:	41 56                	push   %r14
   1a132:	41 55                	push   %r13
   1a134:	41 54                	push   %r12
   1a136:	53                   	push   %rbx
   1a137:	48 83 ec 38          	sub    $0x38,%rsp
   1a13b:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
   1a140:	49 89 c7             	mov    %rax,%r15
   1a143:	49 21 d7             	and    %rdx,%r15
   1a146:	44 89 c9             	mov    %r9d,%ecx
   1a149:	49 d3 ef             	shr    %cl,%r15
   1a14c:	41 bd 01 00 00 00    	mov    $0x1,%r13d
   1a152:	49 d3 e5             	shl    %cl,%r13
   1a155:	49 8d 5d ff          	lea    -0x1(%r13),%rbx
   1a159:	49 89 de             	mov    %rbx,%r14
   1a15c:	49 21 c6             	and    %rax,%r14
   1a15f:	49 89 d2             	mov    %rdx,%r10
   1a162:	49 d3 ea             	shr    %cl,%r10
   1a165:	4d 85 ff             	test   %r15,%r15
   1a168:	74 23                	je     1a18d <<hyperinterval::ieee::Format>::add+0x6d>
   1a16a:	4d 09 ee             	or     %r13,%r14
   1a16d:	49 d1 ea             	shr    $1,%r10
   1a170:	45 01 ca             	add    %r9d,%r10d
   1a173:	eb 24                	jmp    1a199 <<hyperinterval::ieee::Format>::add+0x79>
   1a175:	4c 89 47 08          	mov    %r8,0x8(%rdi)
   1a179:	4c 89 47 10          	mov    %r8,0x10(%rdi)
   1a17d:	c6 07 00             	movb   $0x0,(%rdi)
   1a180:	c3                   	ret
   1a181:	48 89 47 08          	mov    %rax,0x8(%rdi)
   1a185:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1a189:	c6 07 00             	movb   $0x0,(%rdi)
   1a18c:	c3                   	ret
   1a18d:	49 d1 ea             	shr    $1,%r10
   1a190:	45 01 ca             	add    %r9d,%r10d
   1a193:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   1a199:	45 29 d7             	sub    %r10d,%r15d
   1a19c:	48 85 f0             	test   %rsi,%rax
   1a19f:	0f 95 44 24 0f       	setne  0xf(%rsp)
   1a1a4:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1a1a9:	49 0f bd ce          	bsr    %r14,%rcx
   1a1ad:	83 f1 3f             	xor    $0x3f,%ecx
   1a1b0:	46 8d 1c 09          	lea    (%rcx,%r9,1),%r11d
   1a1b4:	41 83 c3 c1          	add    $0xffffffc1,%r11d
   1a1b8:	45 31 e4             	xor    %r12d,%r12d
   1a1bb:	44 89 d9             	mov    %r11d,%ecx
   1a1be:	4d 0f a5 f4          	shld   %cl,%r14,%r12
   1a1c2:	49 d3 e6             	shl    %cl,%r14
   1a1c5:	31 c9                	xor    %ecx,%ecx
   1a1c7:	41 f6 c3 40          	test   $0x40,%r11b
   1a1cb:	4d 0f 45 e6          	cmovne %r14,%r12
   1a1cf:	4c 0f 45 f1          	cmovne %rcx,%r14
   1a1d3:	4d 89 c2             	mov    %r8,%r10
   1a1d6:	49 21 d2             	and    %rdx,%r10
   1a1d9:	44 89 c9             	mov    %r9d,%ecx
   1a1dc:	49 d3 ea             	shr    %cl,%r10
   1a1df:	41 8d 69 81          	lea    -0x7f(%r9),%ebp
   1a1e3:	45 29 df             	sub    %r11d,%r15d
   1a1e6:	4c 21 c3             	and    %r8,%rbx
   1a1e9:	49 89 d3             	mov    %rdx,%r11
   1a1ec:	49 d3 eb             	shr    %cl,%r11
   1a1ef:	4d 85 d2             	test   %r10,%r10
   1a1f2:	74 0b                	je     1a1ff <<hyperinterval::ieee::Format>::add+0xdf>
   1a1f4:	4c 09 eb             	or     %r13,%rbx
   1a1f7:	49 d1 eb             	shr    $1,%r11
   1a1fa:	45 01 cb             	add    %r9d,%r11d
   1a1fd:	eb 0c                	jmp    1a20b <<hyperinterval::ieee::Format>::add+0xeb>
   1a1ff:	49 d1 eb             	shr    $1,%r11
   1a202:	45 01 cb             	add    %r9d,%r11d
   1a205:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1a20b:	45 29 da             	sub    %r11d,%r10d
   1a20e:	49 85 f0             	test   %rsi,%r8
   1a211:	41 0f 95 c5          	setne  %r13b
   1a215:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1a21a:	48 0f bd cb          	bsr    %rbx,%rcx
   1a21e:	83 f1 3f             	xor    $0x3f,%ecx
   1a221:	01 e9                	add    %ebp,%ecx
   1a223:	83 c1 40             	add    $0x40,%ecx
   1a226:	45 31 db             	xor    %r11d,%r11d
   1a229:	49 0f a5 db          	shld   %cl,%rbx,%r11
   1a22d:	48 d3 e3             	shl    %cl,%rbx
   1a230:	45 31 c9             	xor    %r9d,%r9d
   1a233:	f6 c1 40             	test   $0x40,%cl
   1a236:	4c 0f 45 db          	cmovne %rbx,%r11
   1a23a:	49 0f 45 d9          	cmovne %r9,%rbx
   1a23e:	41 29 ca             	sub    %ecx,%r10d
   1a241:	45 39 d7             	cmp    %r10d,%r15d
   1a244:	7d 76                	jge    1a2bc <<hyperinterval::ieee::Format>::add+0x19c>
   1a246:	44 89 f9             	mov    %r15d,%ecx
   1a249:	44 0f b6 7c 24 0f    	movzbl 0xf(%rsp),%r15d
   1a24f:	4d 89 f1             	mov    %r14,%r9
   1a252:	4c 89 e5             	mov    %r12,%rbp
   1a255:	4d 89 c6             	mov    %r8,%r14
   1a258:	45 89 ec             	mov    %r13d,%r12d
   1a25b:	45 89 fd             	mov    %r15d,%r13d
   1a25e:	41 29 ca             	sub    %ecx,%r10d
   1a261:	41 83 fa 4a          	cmp    $0x4a,%r10d
   1a265:	7f 79                	jg     1a2e0 <<hyperinterval::ieee::Format>::add+0x1c0>
   1a267:	41 89 cf             	mov    %ecx,%r15d
   1a26a:	49 85 f0             	test   %rsi,%r8
   1a26d:	41 0f 95 c0          	setne  %r8b
   1a271:	48 85 f0             	test   %rsi,%rax
   1a274:	41 0f 95 c6          	setne  %r14b
   1a278:	44 89 d1             	mov    %r10d,%ecx
   1a27b:	49 0f a5 db          	shld   %cl,%rbx,%r11
   1a27f:	48 d3 e3             	shl    %cl,%rbx
   1a282:	31 c0                	xor    %eax,%eax
   1a284:	41 f6 c2 40          	test   $0x40,%r10b
   1a288:	4c 0f 45 db          	cmovne %rbx,%r11
   1a28c:	48 0f 44 c3          	cmove  %rbx,%rax
   1a290:	45 30 c6             	xor    %r8b,%r14b
   1a293:	0f 84 98 00 00 00    	je     1a331 <<hyperinterval::ieee::Format>::add+0x211>
   1a299:	4c 39 c8             	cmp    %r9,%rax
   1a29c:	4c 89 d9             	mov    %r11,%rcx
   1a29f:	48 19 e9             	sbb    %rbp,%rcx
   1a2a2:	0f 83 bb 00 00 00    	jae    1a363 <<hyperinterval::ieee::Format>::add+0x243>
   1a2a8:	49 29 c1             	sub    %rax,%r9
   1a2ab:	4c 19 dd             	sbb    %r11,%rbp
   1a2ae:	45 89 ec             	mov    %r13d,%r12d
   1a2b1:	4c 89 c8             	mov    %r9,%rax
   1a2b4:	49 89 eb             	mov    %rbp,%r11
   1a2b7:	e9 ad 00 00 00       	jmp    1a369 <<hyperinterval::ieee::Format>::add+0x249>
   1a2bc:	44 89 d1             	mov    %r10d,%ecx
   1a2bf:	49 89 d9             	mov    %rbx,%r9
   1a2c2:	4c 89 dd             	mov    %r11,%rbp
   1a2c5:	4d 89 e3             	mov    %r12,%r11
   1a2c8:	4c 89 f3             	mov    %r14,%rbx
   1a2cb:	44 0f b6 64 24 0f    	movzbl 0xf(%rsp),%r12d
   1a2d1:	45 89 fa             	mov    %r15d,%r10d
   1a2d4:	49 89 c6             	mov    %rax,%r14
   1a2d7:	41 29 ca             	sub    %ecx,%r10d
   1a2da:	41 83 fa 4a          	cmp    $0x4a,%r10d
   1a2de:	7e 87                	jle    1a267 <<hyperinterval::ieee::Format>::add+0x147>
   1a2e0:	48 89 fb             	mov    %rdi,%rbx
   1a2e3:	4c 89 f0             	mov    %r14,%rax
   1a2e6:	45 84 ed             	test   %r13b,%r13b
   1a2e9:	74 4e                	je     1a339 <<hyperinterval::ieee::Format>::add+0x219>
   1a2eb:	48 31 f0             	xor    %rsi,%rax
   1a2ee:	48 89 c1             	mov    %rax,%rcx
   1a2f1:	48 21 f1             	and    %rsi,%rcx
   1a2f4:	31 ff                	xor    %edi,%edi
   1a2f6:	48 f7 d9             	neg    %rcx
   1a2f9:	40 0f 93 c7          	setae  %dil
   1a2fd:	48 8d 0c 78          	lea    (%rax,%rdi,2),%rcx
   1a301:	48 ff c9             	dec    %rcx
   1a304:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1a309:	49 89 f7             	mov    %rsi,%r15
   1a30c:	e8 1f df ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1a311:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1a316:	75 44                	jne    1a35c <<hyperinterval::ieee::Format>::add+0x23c>
   1a318:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1a31d:	49 31 c7             	xor    %rax,%r15
   1a320:	48 85 c0             	test   %rax,%rax
   1a323:	4c 0f 44 f8          	cmove  %rax,%r15
   1a327:	4c 89 7b 08          	mov    %r15,0x8(%rbx)
   1a32b:	4c 89 73 10          	mov    %r14,0x10(%rbx)
   1a32f:	eb 65                	jmp    1a396 <<hyperinterval::ieee::Format>::add+0x276>
   1a331:	4c 01 c8             	add    %r9,%rax
   1a334:	49 11 eb             	adc    %rbp,%r11
   1a337:	eb 30                	jmp    1a369 <<hyperinterval::ieee::Format>::add+0x249>
   1a339:	48 21 f0             	and    %rsi,%rax
   1a33c:	31 c9                	xor    %ecx,%ecx
   1a33e:	48 f7 d8             	neg    %rax
   1a341:	0f 93 c1             	setae  %cl
   1a344:	49 8d 0c 4e          	lea    (%r14,%rcx,2),%rcx
   1a348:	48 ff c9             	dec    %rcx
   1a34b:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1a350:	e8 db de ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1a355:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1a35a:	74 2d                	je     1a389 <<hyperinterval::ieee::Format>::add+0x269>
   1a35c:	66 c7 03 01 03       	movw   $0x301,(%rbx)
   1a361:	eb 36                	jmp    1a399 <<hyperinterval::ieee::Format>::add+0x279>
   1a363:	4c 29 c8             	sub    %r9,%rax
   1a366:	49 19 eb             	sbb    %rbp,%r11
   1a369:	44 88 64 24 24       	mov    %r12b,0x24(%rsp)
   1a36e:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1a373:	4c 89 5c 24 18       	mov    %r11,0x18(%rsp)
   1a378:	44 89 7c 24 20       	mov    %r15d,0x20(%rsp)
   1a37d:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1a382:	e8 89 0c 00 00       	call   1b010 <<hyperinterval::ieee::Format>::rounded>
   1a387:	eb 10                	jmp    1a399 <<hyperinterval::ieee::Format>::add+0x279>
   1a389:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1a38e:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1a392:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1a396:	c6 03 00             	movb   $0x0,(%rbx)
   1a399:	48 83 c4 38          	add    $0x38,%rsp
   1a39d:	5b                   	pop    %rbx
   1a39e:	41 5c                	pop    %r12
   1a3a0:	41 5d                	pop    %r13
   1a3a2:	41 5e                	pop    %r14
   1a3a4:	41 5f                	pop    %r15
   1a3a6:	5d                   	pop    %rbp
   1a3a7:	c3                   	ret
   1a3a8:	cc                   	int3
   1a3a9:	cc                   	int3
   1a3aa:	cc                   	int3
   1a3ab:	cc                   	int3
   1a3ac:	cc                   	int3
   1a3ad:	cc                   	int3
   1a3ae:	cc                   	int3
   1a3af:	cc                   	int3

<hyperinterval::ieee::Format>::div:
   1a3b0:	55                   	push   %rbp
   1a3b1:	41 57                	push   %r15
   1a3b3:	41 56                	push   %r14
   1a3b5:	41 55                	push   %r13
   1a3b7:	41 54                	push   %r12
   1a3b9:	53                   	push   %rbx
   1a3ba:	48 83 ec 38          	sub    $0x38,%rsp
   1a3be:	4d 85 c0             	test   %r8,%r8
   1a3c1:	74 47                	je     1a40a <<hyperinterval::ieee::Format>::div+0x5a>
   1a3c3:	48 85 c9             	test   %rcx,%rcx
   1a3c6:	74 4c                	je     1a414 <<hyperinterval::ieee::Format>::div+0x64>
   1a3c8:	f3 4c 0f bc f2       	tzcnt  %rdx,%r14
   1a3cd:	49 89 c9             	mov    %rcx,%r9
   1a3d0:	49 21 d1             	and    %rdx,%r9
   1a3d3:	48 89 c8             	mov    %rcx,%rax
   1a3d6:	44 89 f1             	mov    %r14d,%ecx
   1a3d9:	49 d3 e9             	shr    %cl,%r9
   1a3dc:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1a3e2:	49 d3 e2             	shl    %cl,%r10
   1a3e5:	49 8d 6a ff          	lea    -0x1(%r10),%rbp
   1a3e9:	49 89 ec             	mov    %rbp,%r12
   1a3ec:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a3f1:	49 21 c4             	and    %rax,%r12
   1a3f4:	48 89 d0             	mov    %rdx,%rax
   1a3f7:	48 d3 e8             	shr    %cl,%rax
   1a3fa:	4d 85 c9             	test   %r9,%r9
   1a3fd:	74 24                	je     1a423 <<hyperinterval::ieee::Format>::div+0x73>
   1a3ff:	4d 09 d4             	or     %r10,%r12
   1a402:	48 d1 e8             	shr    $1,%rax
   1a405:	44 01 f0             	add    %r14d,%eax
   1a408:	eb 25                	jmp    1a42f <<hyperinterval::ieee::Format>::div+0x7f>
   1a40a:	66 c7 07 01 04       	movw   $0x401,(%rdi)
   1a40f:	e9 ae 03 00 00       	jmp    1a7c2 <<hyperinterval::ieee::Format>::div+0x412>
   1a414:	c6 07 00             	movb   $0x0,(%rdi)
   1a417:	0f 57 c0             	xorps  %xmm0,%xmm0
   1a41a:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1a41e:	e9 9f 03 00 00       	jmp    1a7c2 <<hyperinterval::ieee::Format>::div+0x412>
   1a423:	48 d1 e8             	shr    $1,%rax
   1a426:	44 01 f0             	add    %r14d,%eax
   1a429:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1a42f:	41 29 c1             	sub    %eax,%r9d
   1a432:	4d 89 c3             	mov    %r8,%r11
   1a435:	49 21 d3             	and    %rdx,%r11
   1a438:	44 89 f1             	mov    %r14d,%ecx
   1a43b:	49 d3 eb             	shr    %cl,%r11
   1a43e:	4c 21 c5             	and    %r8,%rbp
   1a441:	48 89 d0             	mov    %rdx,%rax
   1a444:	48 d3 e8             	shr    %cl,%rax
   1a447:	4d 85 db             	test   %r11,%r11
   1a44a:	74 0e                	je     1a45a <<hyperinterval::ieee::Format>::div+0xaa>
   1a44c:	4c 09 d5             	or     %r10,%rbp
   1a44f:	48 d1 e8             	shr    $1,%rax
   1a452:	44 01 f0             	add    %r14d,%eax
   1a455:	44 29 d8             	sub    %r11d,%eax
   1a458:	eb 08                	jmp    1a462 <<hyperinterval::ieee::Format>::div+0xb2>
   1a45a:	48 d1 e8             	shr    $1,%rax
   1a45d:	44 01 f0             	add    %r14d,%eax
   1a460:	ff c8                	dec    %eax
   1a462:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1a467:	41 ba 7f 00 00 00    	mov    $0x7f,%r10d
   1a46d:	4c 0f bd d5          	bsr    %rbp,%r10
   1a471:	41 83 f2 3f          	xor    $0x3f,%r10d
   1a475:	41 83 c2 40          	add    $0x40,%r10d
   1a479:	49 0f bd cc          	bsr    %r12,%rcx
   1a47d:	83 f1 3f             	xor    $0x3f,%ecx
   1a480:	45 89 d7             	mov    %r10d,%r15d
   1a483:	41 29 cf             	sub    %ecx,%r15d
   1a486:	41 83 c7 c0          	add    $0xffffffc0,%r15d
   1a48a:	78 26                	js     1a4b2 <<hyperinterval::ieee::Format>::div+0x102>
   1a48c:	45 31 db             	xor    %r11d,%r11d
   1a48f:	44 89 f9             	mov    %r15d,%ecx
   1a492:	49 0f a5 eb          	shld   %cl,%rbp,%r11
   1a496:	31 db                	xor    %ebx,%ebx
   1a498:	49 89 ed             	mov    %rbp,%r13
   1a49b:	49 d3 e5             	shl    %cl,%r13
   1a49e:	41 f6 c7 40          	test   $0x40,%r15b
   1a4a2:	4d 0f 45 dd          	cmovne %r13,%r11
   1a4a6:	4c 0f 45 eb          	cmovne %rbx,%r13
   1a4aa:	4d 39 ec             	cmp    %r13,%r12
   1a4ad:	4c 19 db             	sbb    %r11,%rbx
   1a4b0:	eb 26                	jmp    1a4d8 <<hyperinterval::ieee::Format>::div+0x128>
   1a4b2:	44 89 f9             	mov    %r15d,%ecx
   1a4b5:	f6 d9                	neg    %cl
   1a4b7:	45 31 db             	xor    %r11d,%r11d
   1a4ba:	4d 0f a5 e3          	shld   %cl,%r12,%r11
   1a4be:	31 db                	xor    %ebx,%ebx
   1a4c0:	4d 89 e5             	mov    %r12,%r13
   1a4c3:	49 d3 e5             	shl    %cl,%r13
   1a4c6:	f6 c1 40             	test   $0x40,%cl
   1a4c9:	4d 0f 45 dd          	cmovne %r13,%r11
   1a4cd:	4c 0f 45 eb          	cmovne %rbx,%r13
   1a4d1:	49 39 ed             	cmp    %rbp,%r13
   1a4d4:	49 83 db 00          	sbb    $0x0,%r11
   1a4d8:	41 0f 92 c3          	setb   %r11b
   1a4dc:	44 89 f1             	mov    %r14d,%ecx
   1a4df:	48 d3 ea             	shr    %cl,%rdx
   1a4e2:	44 01 c8             	add    %r9d,%eax
   1a4e5:	41 01 c7             	add    %eax,%r15d
   1a4e8:	41 0f b6 cb          	movzbl %r11b,%ecx
   1a4ec:	41 29 cf             	sub    %ecx,%r15d
   1a4ef:	48 d1 ea             	shr    $1,%rdx
   1a4f2:	41 39 d7             	cmp    %edx,%r15d
   1a4f5:	0f 8f 0e 02 00 00    	jg     1a709 <<hyperinterval::ieee::Format>::div+0x359>
   1a4fb:	45 8d 0c 16          	lea    (%r14,%rdx,1),%r9d
   1a4ff:	b9 01 00 00 00       	mov    $0x1,%ecx
   1a504:	4c 89 4c 24 08       	mov    %r9,0x8(%rsp)
   1a509:	44 29 c9             	sub    %r9d,%ecx
   1a50c:	45 29 f7             	sub    %r14d,%r15d
   1a50f:	41 39 cf             	cmp    %ecx,%r15d
   1a512:	44 0f 4e f9          	cmovle %ecx,%r15d
   1a516:	44 29 f8             	sub    %r15d,%eax
   1a519:	78 61                	js     1a57c <<hyperinterval::ieee::Format>::div+0x1cc>
   1a51b:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1a520:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
   1a525:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
   1a52a:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
   1a52f:	48 85 ed             	test   %rbp,%rbp
   1a532:	0f 84 99 02 00 00    	je     1a7d1 <<hyperinterval::ieee::Format>::div+0x421>
   1a538:	45 31 ed             	xor    %r13d,%r13d
   1a53b:	89 c1                	mov    %eax,%ecx
   1a53d:	4d 0f a5 e5          	shld   %cl,%r12,%r13
   1a541:	31 d2                	xor    %edx,%edx
   1a543:	49 d3 e4             	shl    %cl,%r12
   1a546:	a8 40                	test   $0x40,%al
   1a548:	4d 0f 45 ec          	cmovne %r12,%r13
   1a54c:	4c 0f 45 e2          	cmovne %rdx,%r12
   1a550:	4c 89 e7             	mov    %r12,%rdi
   1a553:	4c 89 ee             	mov    %r13,%rsi
   1a556:	48 89 ea             	mov    %rbp,%rdx
   1a559:	31 c9                	xor    %ecx,%ecx
   1a55b:	ff 15 0f 22 04 00    	call   *0x4220f(%rip)        # 5c770 <_DYNAMIC+0x438>
   1a561:	49 89 c2             	mov    %rax,%r10
   1a564:	49 89 d1             	mov    %rdx,%r9
   1a567:	48 89 d1             	mov    %rdx,%rcx
   1a56a:	48 0f af cd          	imul   %rbp,%rcx
   1a56e:	48 f7 e5             	mul    %rbp
   1a571:	48 01 ca             	add    %rcx,%rdx
   1a574:	49 29 c4             	sub    %rax,%r12
   1a577:	49 19 d5             	sbb    %rdx,%r13
   1a57a:	eb 79                	jmp    1a5f5 <<hyperinterval::ieee::Format>::div+0x245>
   1a57c:	f7 d8                	neg    %eax
   1a57e:	44 39 d0             	cmp    %r10d,%eax
   1a581:	7e 07                	jle    1a58a <<hyperinterval::ieee::Format>::div+0x1da>
   1a583:	b3 01                	mov    $0x1,%bl
   1a585:	e9 df 00 00 00       	jmp    1a669 <<hyperinterval::ieee::Format>::div+0x2b9>
   1a58a:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1a58f:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
   1a594:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
   1a599:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
   1a59e:	31 db                	xor    %ebx,%ebx
   1a5a0:	89 c1                	mov    %eax,%ecx
   1a5a2:	48 0f a5 eb          	shld   %cl,%rbp,%rbx
   1a5a6:	48 d3 e5             	shl    %cl,%rbp
   1a5a9:	31 c9                	xor    %ecx,%ecx
   1a5ab:	a8 40                	test   $0x40,%al
   1a5ad:	48 0f 45 dd          	cmovne %rbp,%rbx
   1a5b1:	48 0f 45 e9          	cmovne %rcx,%rbp
   1a5b5:	48 89 e8             	mov    %rbp,%rax
   1a5b8:	48 09 d8             	or     %rbx,%rax
   1a5bb:	0f 84 1d 02 00 00    	je     1a7de <<hyperinterval::ieee::Format>::div+0x42e>
   1a5c1:	45 31 ed             	xor    %r13d,%r13d
   1a5c4:	4c 89 e7             	mov    %r12,%rdi
   1a5c7:	31 f6                	xor    %esi,%esi
   1a5c9:	48 89 ea             	mov    %rbp,%rdx
   1a5cc:	48 89 d9             	mov    %rbx,%rcx
   1a5cf:	ff 15 9b 21 04 00    	call   *0x4219b(%rip)        # 5c770 <_DYNAMIC+0x438>
   1a5d5:	49 89 c2             	mov    %rax,%r10
   1a5d8:	49 89 d1             	mov    %rdx,%r9
   1a5db:	48 0f af d8          	imul   %rax,%rbx
   1a5df:	48 f7 e5             	mul    %rbp
   1a5e2:	48 01 da             	add    %rbx,%rdx
   1a5e5:	4c 89 c9             	mov    %r9,%rcx
   1a5e8:	48 0f af cd          	imul   %rbp,%rcx
   1a5ec:	48 01 d1             	add    %rdx,%rcx
   1a5ef:	49 29 c4             	sub    %rax,%r12
   1a5f2:	49 19 cd             	sbb    %rcx,%r13
   1a5f5:	4d 09 ec             	or     %r13,%r12
   1a5f8:	0f 95 c3             	setne  %bl
   1a5fb:	4c 89 d0             	mov    %r10,%rax
   1a5fe:	4c 09 c8             	or     %r9,%rax
   1a601:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
   1a606:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1a60b:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
   1a610:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   1a615:	74 52                	je     1a669 <<hyperinterval::ieee::Format>::div+0x2b9>
   1a617:	49 0f bd c1          	bsr    %r9,%rax
   1a61b:	83 f0 3f             	xor    $0x3f,%eax
   1a61e:	4d 0f bd da          	bsr    %r10,%r11
   1a622:	41 83 f3 3f          	xor    $0x3f,%r11d
   1a626:	41 83 cb 40          	or     $0x40,%r11d
   1a62a:	4d 85 c9             	test   %r9,%r9
   1a62d:	44 0f 45 d8          	cmovne %eax,%r11d
   1a631:	41 83 f3 7f          	xor    $0x7f,%r11d
   1a635:	43 8d 2c 3b          	lea    (%r11,%r15,1),%ebp
   1a639:	39 d5                	cmp    %edx,%ebp
   1a63b:	0f 8f c8 00 00 00    	jg     1a709 <<hyperinterval::ieee::Format>::div+0x359>
   1a641:	b8 01 00 00 00       	mov    $0x1,%eax
   1a646:	29 d0                	sub    %edx,%eax
   1a648:	39 c5                	cmp    %eax,%ebp
   1a64a:	7d 28                	jge    1a674 <<hyperinterval::ieee::Format>::div+0x2c4>
   1a64c:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a651:	42 8d 0c 38          	lea    (%rax,%r15,1),%ecx
   1a655:	fe c9                	dec    %cl
   1a657:	4c 89 d0             	mov    %r10,%rax
   1a65a:	48 d3 e0             	shl    %cl,%rax
   1a65d:	45 31 db             	xor    %r11d,%r11d
   1a660:	f6 c1 40             	test   $0x40,%cl
   1a663:	4c 0f 44 d8          	cmove  %rax,%r11
   1a667:	eb 68                	jmp    1a6d1 <<hyperinterval::ieee::Format>::div+0x321>
   1a669:	45 31 d2             	xor    %r10d,%r10d
   1a66c:	45 31 c9             	xor    %r9d,%r9d
   1a66f:	45 31 db             	xor    %r11d,%r11d
   1a672:	eb 5d                	jmp    1a6d1 <<hyperinterval::ieee::Format>::div+0x321>
   1a674:	44 89 f1             	mov    %r14d,%ecx
   1a677:	44 29 d9             	sub    %r11d,%ecx
   1a67a:	4d 89 d4             	mov    %r10,%r12
   1a67d:	49 d3 e4             	shl    %cl,%r12
   1a680:	89 c8                	mov    %ecx,%eax
   1a682:	f7 d8                	neg    %eax
   1a684:	45 31 ed             	xor    %r13d,%r13d
   1a687:	f6 c1 40             	test   $0x40,%cl
   1a68a:	4d 0f 44 ec          	cmove  %r12,%r13
   1a68e:	4d 89 d4             	mov    %r10,%r12
   1a691:	89 c1                	mov    %eax,%ecx
   1a693:	4d 0f ad cc          	shrd   %cl,%r9,%r12
   1a697:	88 5c 24 07          	mov    %bl,0x7(%rsp)
   1a69b:	4c 89 cb             	mov    %r9,%rbx
   1a69e:	48 d3 eb             	shr    %cl,%rbx
   1a6a1:	a8 40                	test   $0x40,%al
   1a6a3:	49 0f 44 dc          	cmove  %r12,%rbx
   1a6a7:	45 39 de             	cmp    %r11d,%r14d
   1a6aa:	49 0f 43 dd          	cmovae %r13,%rbx
   1a6ae:	01 d5                	add    %edx,%ebp
   1a6b0:	48 63 c5             	movslq %ebp,%rax
   1a6b3:	44 89 f1             	mov    %r14d,%ecx
   1a6b6:	48 d3 e0             	shl    %cl,%rax
   1a6b9:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   1a6c0:	49 d3 e3             	shl    %cl,%r11
   1a6c3:	49 f7 d3             	not    %r11
   1a6c6:	49 21 db             	and    %rbx,%r11
   1a6c9:	0f b6 5c 24 07       	movzbl 0x7(%rsp),%ebx
   1a6ce:	49 09 c3             	or     %rax,%r11
   1a6d1:	0f b6 db             	movzbl %bl,%ebx
   1a6d4:	4c 01 d3             	add    %r10,%rbx
   1a6d7:	49 83 d1 00          	adc    $0x0,%r9
   1a6db:	48 89 d8             	mov    %rbx,%rax
   1a6de:	4c 09 c8             	or     %r9,%rax
   1a6e1:	74 30                	je     1a713 <<hyperinterval::ieee::Format>::div+0x363>
   1a6e3:	49 0f bd c1          	bsr    %r9,%rax
   1a6e7:	83 f0 3f             	xor    $0x3f,%eax
   1a6ea:	4c 0f bd d3          	bsr    %rbx,%r10
   1a6ee:	41 83 f2 3f          	xor    $0x3f,%r10d
   1a6f2:	41 83 ca 40          	or     $0x40,%r10d
   1a6f6:	4d 85 c9             	test   %r9,%r9
   1a6f9:	44 0f 45 d0          	cmovne %eax,%r10d
   1a6fd:	41 83 f2 7f          	xor    $0x7f,%r10d
   1a701:	43 8d 2c 3a          	lea    (%r10,%r15,1),%ebp
   1a705:	39 d5                	cmp    %edx,%ebp
   1a707:	7e 0e                	jle    1a717 <<hyperinterval::ieee::Format>::div+0x367>
   1a709:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   1a70e:	e9 af 00 00 00       	jmp    1a7c2 <<hyperinterval::ieee::Format>::div+0x412>
   1a713:	31 c0                	xor    %eax,%eax
   1a715:	eb 71                	jmp    1a788 <<hyperinterval::ieee::Format>::div+0x3d8>
   1a717:	b8 01 00 00 00       	mov    $0x1,%eax
   1a71c:	29 d0                	sub    %edx,%eax
   1a71e:	39 c5                	cmp    %eax,%ebp
   1a720:	7d 18                	jge    1a73a <<hyperinterval::ieee::Format>::div+0x38a>
   1a722:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a727:	44 01 f9             	add    %r15d,%ecx
   1a72a:	fe c9                	dec    %cl
   1a72c:	48 d3 e3             	shl    %cl,%rbx
   1a72f:	31 c0                	xor    %eax,%eax
   1a731:	f6 c1 40             	test   $0x40,%cl
   1a734:	48 0f 44 c3          	cmove  %rbx,%rax
   1a738:	eb 4e                	jmp    1a788 <<hyperinterval::ieee::Format>::div+0x3d8>
   1a73a:	44 89 f1             	mov    %r14d,%ecx
   1a73d:	44 29 d1             	sub    %r10d,%ecx
   1a740:	89 c8                	mov    %ecx,%eax
   1a742:	f7 d8                	neg    %eax
   1a744:	49 89 df             	mov    %rbx,%r15
   1a747:	49 d3 e7             	shl    %cl,%r15
   1a74a:	45 31 e4             	xor    %r12d,%r12d
   1a74d:	f6 c1 40             	test   $0x40,%cl
   1a750:	4d 0f 44 e7          	cmove  %r15,%r12
   1a754:	89 c1                	mov    %eax,%ecx
   1a756:	4c 0f ad cb          	shrd   %cl,%r9,%rbx
   1a75a:	49 d3 e9             	shr    %cl,%r9
   1a75d:	a8 40                	test   $0x40,%al
   1a75f:	4c 0f 44 cb          	cmove  %rbx,%r9
   1a763:	45 39 d6             	cmp    %r10d,%r14d
   1a766:	4d 0f 43 cc          	cmovae %r12,%r9
   1a76a:	01 d5                	add    %edx,%ebp
   1a76c:	48 63 d5             	movslq %ebp,%rdx
   1a76f:	44 89 f1             	mov    %r14d,%ecx
   1a772:	48 d3 e2             	shl    %cl,%rdx
   1a775:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   1a77c:	48 d3 e0             	shl    %cl,%rax
   1a77f:	48 f7 d0             	not    %rax
   1a782:	4c 21 c8             	and    %r9,%rax
   1a785:	48 09 d0             	or     %rdx,%rax
   1a788:	48 85 74 24 30       	test   %rsi,0x30(%rsp)
   1a78d:	0f 95 c1             	setne  %cl
   1a790:	49 85 f0             	test   %rsi,%r8
   1a793:	0f 94 c2             	sete   %dl
   1a796:	30 ca                	xor    %cl,%dl
   1a798:	75 1d                	jne    1a7b7 <<hyperinterval::ieee::Format>::div+0x407>
   1a79a:	48 89 c1             	mov    %rax,%rcx
   1a79d:	48 31 f1             	xor    %rsi,%rcx
   1a7a0:	48 85 c0             	test   %rax,%rax
   1a7a3:	48 0f 44 c8          	cmove  %rax,%rcx
   1a7a7:	4c 31 de             	xor    %r11,%rsi
   1a7aa:	4d 85 db             	test   %r11,%r11
   1a7ad:	49 0f 44 f3          	cmove  %r11,%rsi
   1a7b1:	48 89 f0             	mov    %rsi,%rax
   1a7b4:	49 89 cb             	mov    %rcx,%r11
   1a7b7:	4c 89 5f 08          	mov    %r11,0x8(%rdi)
   1a7bb:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1a7bf:	c6 07 00             	movb   $0x0,(%rdi)
   1a7c2:	48 83 c4 38          	add    $0x38,%rsp
   1a7c6:	5b                   	pop    %rbx
   1a7c7:	41 5c                	pop    %r12
   1a7c9:	41 5d                	pop    %r13
   1a7cb:	41 5e                	pop    %r14
   1a7cd:	41 5f                	pop    %r15
   1a7cf:	5d                   	pop    %rbp
   1a7d0:	c3                   	ret
   1a7d1:	48 8d 3d 58 fd 03 00 	lea    0x3fd58(%rip),%rdi        # 5a530 <__frame_dummy_init_array_entry+0x1c0>
   1a7d8:	ff 15 9a 1f 04 00    	call   *0x41f9a(%rip)        # 5c778 <_DYNAMIC+0x440>
   1a7de:	48 8d 3d 33 fd 03 00 	lea    0x3fd33(%rip),%rdi        # 5a518 <__frame_dummy_init_array_entry+0x1a8>
   1a7e5:	ff 15 8d 1f 04 00    	call   *0x41f8d(%rip)        # 5c778 <_DYNAMIC+0x440>
   1a7eb:	cc                   	int3
   1a7ec:	cc                   	int3
   1a7ed:	cc                   	int3
   1a7ee:	cc                   	int3
   1a7ef:	cc                   	int3

<hyperinterval::ieee::Format>::power:
   1a7f0:	55                   	push   %rbp
   1a7f1:	41 57                	push   %r15
   1a7f3:	41 56                	push   %r14
   1a7f5:	41 55                	push   %r13
   1a7f7:	41 54                	push   %r12
   1a7f9:	53                   	push   %rbx
   1a7fa:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   1a801:	49 89 ca             	mov    %rcx,%r10
   1a804:	49 89 d6             	mov    %rdx,%r14
   1a807:	48 85 f1             	test   %rsi,%rcx
   1a80a:	0f 95 c0             	setne  %al
   1a80d:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
   1a812:	49 89 d3             	mov    %rdx,%r11
   1a815:	44 89 c9             	mov    %r9d,%ecx
   1a818:	49 d3 eb             	shr    %cl,%r11
   1a81b:	49 d1 eb             	shr    $1,%r11
   1a81e:	49 63 d3             	movslq %r11d,%rdx
   1a821:	48 d3 e2             	shl    %cl,%rdx
   1a824:	45 85 c0             	test   %r8d,%r8d
   1a827:	0f 84 6b 03 00 00    	je     1ab98 <<hyperinterval::ieee::Format>::power+0x3a8>
   1a82d:	88 44 24 07          	mov    %al,0x7(%rsp)
   1a831:	48 89 7c 24 50       	mov    %rdi,0x50(%rsp)
   1a836:	48 8d 46 ff          	lea    -0x1(%rsi),%rax
   1a83a:	49 21 c2             	and    %rax,%r10
   1a83d:	bb 01 00 00 00       	mov    $0x1,%ebx
   1a842:	44 89 c9             	mov    %r9d,%ecx
   1a845:	48 d3 e3             	shl    %cl,%rbx
   1a848:	48 8d 43 ff          	lea    -0x1(%rbx),%rax
   1a84c:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1a851:	45 01 cb             	add    %r9d,%r11d
   1a854:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   1a85a:	45 29 df             	sub    %r11d,%r15d
   1a85d:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   1a862:	4c 8d 64 24 30       	lea    0x30(%rsp),%r12
   1a867:	44 89 44 24 74       	mov    %r8d,0x74(%rsp)
   1a86c:	44 89 c5             	mov    %r8d,%ebp
   1a86f:	4c 89 54 24 68       	mov    %r10,0x68(%rsp)
   1a874:	4d 89 d5             	mov    %r10,%r13
   1a877:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   1a87c:	48 89 54 24 60       	mov    %rdx,0x60(%rsp)
   1a881:	4c 89 8c 24 80 00 00 	mov    %r9,0x80(%rsp)
   1a888:	00 
   1a889:	48 89 5c 24 78       	mov    %rbx,0x78(%rsp)
   1a88e:	44 89 7c 24 0c       	mov    %r15d,0xc(%rsp)
   1a893:	48 89 b4 24 88 00 00 	mov    %rsi,0x88(%rsp)
   1a89a:	00 
   1a89b:	40 f6 c5 01          	test   $0x1,%bpl
   1a89f:	75 2f                	jne    1a8d0 <<hyperinterval::ieee::Format>::power+0xe0>
   1a8a1:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   1a8a8:	0f 1f 84 00 00 00 00 
   1a8af:	00 
   1a8b0:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   1a8b5:	d1 ed                	shr    $1,%ebp
   1a8b7:	0f 85 bc 01 00 00    	jne    1aa79 <<hyperinterval::ieee::Format>::power+0x289>
   1a8bd:	e9 19 03 00 00       	jmp    1abdb <<hyperinterval::ieee::Format>::power+0x3eb>
   1a8c2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   1a8c9:	1f 84 00 00 00 00 00 
   1a8d0:	89 6c 24 08          	mov    %ebp,0x8(%rsp)
   1a8d4:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   1a8d9:	4c 89 c0             	mov    %r8,%rax
   1a8dc:	4c 21 f0             	and    %r14,%rax
   1a8df:	44 89 c9             	mov    %r9d,%ecx
   1a8e2:	48 d3 e8             	shr    %cl,%rax
   1a8e5:	4c 89 c1             	mov    %r8,%rcx
   1a8e8:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1a8ed:	48 21 e9             	and    %rbp,%rcx
   1a8f0:	41 89 c2             	mov    %eax,%r10d
   1a8f3:	45 29 da             	sub    %r11d,%r10d
   1a8f6:	48 85 c0             	test   %rax,%rax
   1a8f9:	45 0f 44 d7          	cmove  %r15d,%r10d
   1a8fd:	48 0f 45 c3          	cmovne %rbx,%rax
   1a901:	48 09 c8             	or     %rcx,%rax
   1a904:	4c 89 ea             	mov    %r13,%rdx
   1a907:	4c 21 f2             	and    %r14,%rdx
   1a90a:	44 89 c9             	mov    %r9d,%ecx
   1a90d:	48 d3 ea             	shr    %cl,%rdx
   1a910:	4c 89 e9             	mov    %r13,%rcx
   1a913:	48 21 e9             	and    %rbp,%rcx
   1a916:	89 d5                	mov    %edx,%ebp
   1a918:	44 29 dd             	sub    %r11d,%ebp
   1a91b:	48 85 d2             	test   %rdx,%rdx
   1a91e:	41 0f 44 ef          	cmove  %r15d,%ebp
   1a922:	48 0f 45 d3          	cmovne %rbx,%rdx
   1a926:	48 09 ca             	or     %rcx,%rdx
   1a929:	49 85 f0             	test   %rsi,%r8
   1a92c:	0f 95 c1             	setne  %cl
   1a92f:	4c 89 ac 24 90 00 00 	mov    %r13,0x90(%rsp)
   1a936:	00 
   1a937:	49 85 f5             	test   %rsi,%r13
   1a93a:	41 0f 95 c0          	setne  %r8b
   1a93e:	48 f7 e2             	mul    %rdx
   1a941:	41 30 c8             	xor    %cl,%r8b
   1a944:	44 01 d5             	add    %r10d,%ebp
   1a947:	44 88 44 24 44       	mov    %r8b,0x44(%rsp)
   1a94c:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1a951:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a956:	89 6c 24 40          	mov    %ebp,0x40(%rsp)
   1a95a:	4c 89 f2             	mov    %r14,%rdx
   1a95d:	4c 89 e1             	mov    %r12,%rcx
   1a960:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1a965:	4d 89 dd             	mov    %r11,%r13
   1a968:	4d 89 cc             	mov    %r9,%r12
   1a96b:	e8 a0 06 00 00       	call   1b010 <<hyperinterval::ieee::Format>::rounded>
   1a970:	80 7c 24 18 00       	cmpb   $0x0,0x18(%rsp)
   1a975:	0f 85 0c 02 00 00    	jne    1ab87 <<hyperinterval::ieee::Format>::power+0x397>
   1a97b:	4c 8b 4c 24 58       	mov    0x58(%rsp),%r9
   1a980:	4c 89 c8             	mov    %r9,%rax
   1a983:	4c 21 f0             	and    %r14,%rax
   1a986:	4d 89 f0             	mov    %r14,%r8
   1a989:	44 89 e1             	mov    %r12d,%ecx
   1a98c:	48 d3 e8             	shr    %cl,%rax
   1a98f:	4c 89 ca             	mov    %r9,%rdx
   1a992:	48 21 ea             	and    %rbp,%rdx
   1a995:	89 c6                	mov    %eax,%esi
   1a997:	4d 89 ee             	mov    %r13,%r14
   1a99a:	44 29 f6             	sub    %r14d,%esi
   1a99d:	48 85 c0             	test   %rax,%rax
   1a9a0:	41 0f 44 f7          	cmove  %r15d,%esi
   1a9a4:	48 0f 45 c3          	cmovne %rbx,%rax
   1a9a8:	4c 8b 54 24 68       	mov    0x68(%rsp),%r10
   1a9ad:	4c 89 d7             	mov    %r10,%rdi
   1a9b0:	4c 21 c7             	and    %r8,%rdi
   1a9b3:	4d 89 c5             	mov    %r8,%r13
   1a9b6:	48 d3 ef             	shr    %cl,%rdi
   1a9b9:	48 09 d0             	or     %rdx,%rax
   1a9bc:	4c 89 d1             	mov    %r10,%rcx
   1a9bf:	48 21 e9             	and    %rbp,%rcx
   1a9c2:	41 89 f8             	mov    %edi,%r8d
   1a9c5:	45 29 f0             	sub    %r14d,%r8d
   1a9c8:	48 85 ff             	test   %rdi,%rdi
   1a9cb:	45 0f 44 c7          	cmove  %r15d,%r8d
   1a9cf:	48 0f 45 fb          	cmovne %rbx,%rdi
   1a9d3:	48 09 cf             	or     %rcx,%rdi
   1a9d6:	4c 8b bc 24 88 00 00 	mov    0x88(%rsp),%r15
   1a9dd:	00 
   1a9de:	4d 85 f9             	test   %r15,%r9
   1a9e1:	0f 95 c1             	setne  %cl
   1a9e4:	4d 85 fa             	test   %r15,%r10
   1a9e7:	41 0f 95 c1          	setne  %r9b
   1a9eb:	41 30 c9             	xor    %cl,%r9b
   1a9ee:	48 f7 e7             	mul    %rdi
   1a9f1:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
   1a9f6:	41 01 f0             	add    %esi,%r8d
   1a9f9:	44 88 4c 24 44       	mov    %r9b,0x44(%rsp)
   1a9fe:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1aa03:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1aa08:	44 89 44 24 40       	mov    %r8d,0x40(%rsp)
   1aa0d:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   1aa12:	48 89 fd             	mov    %rdi,%rbp
   1aa15:	4c 89 fe             	mov    %r15,%rsi
   1aa18:	4c 89 ea             	mov    %r13,%rdx
   1aa1b:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
   1aa20:	49 89 cc             	mov    %rcx,%r12
   1aa23:	e8 e8 05 00 00       	call   1b010 <<hyperinterval::ieee::Format>::rounded>
   1aa28:	80 7c 24 18 01       	cmpb   $0x1,0x18(%rsp)
   1aa2d:	0f 84 54 01 00 00    	je     1ab87 <<hyperinterval::ieee::Format>::power+0x397>
   1aa33:	4c 89 fe             	mov    %r15,%rsi
   1aa36:	4d 89 f3             	mov    %r14,%r11
   1aa39:	4d 89 ee             	mov    %r13,%r14
   1aa3c:	48 89 5c 24 60       	mov    %rbx,0x60(%rsp)
   1aa41:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   1aa46:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1aa4b:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1aa52:	00 
   1aa53:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
   1aa58:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   1aa5d:	44 8b 7c 24 0c       	mov    0xc(%rsp),%r15d
   1aa62:	48 89 ef             	mov    %rbp,%rdi
   1aa65:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   1aa69:	4c 8b ac 24 90 00 00 	mov    0x90(%rsp),%r13
   1aa70:	00 
   1aa71:	d1 ed                	shr    $1,%ebp
   1aa73:	0f 84 62 01 00 00    	je     1abdb <<hyperinterval::ieee::Format>::power+0x3eb>
   1aa79:	89 6c 24 08          	mov    %ebp,0x8(%rsp)
   1aa7d:	4c 89 e8             	mov    %r13,%rax
   1aa80:	4c 21 f0             	and    %r14,%rax
   1aa83:	44 89 c9             	mov    %r9d,%ecx
   1aa86:	48 d3 e8             	shr    %cl,%rax
   1aa89:	49 21 d5             	and    %rdx,%r13
   1aa8c:	89 c1                	mov    %eax,%ecx
   1aa8e:	44 29 d9             	sub    %r11d,%ecx
   1aa91:	48 85 c0             	test   %rax,%rax
   1aa94:	48 0f 45 c3          	cmovne %rbx,%rax
   1aa98:	41 0f 44 cf          	cmove  %r15d,%ecx
   1aa9c:	4c 09 e8             	or     %r13,%rax
   1aa9f:	48 89 d5             	mov    %rdx,%rbp
   1aaa2:	48 f7 e0             	mul    %rax
   1aaa5:	01 c9                	add    %ecx,%ecx
   1aaa7:	c6 44 24 44 00       	movb   $0x0,0x44(%rsp)
   1aaac:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1aab1:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1aab6:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
   1aaba:	4c 89 f2             	mov    %r14,%rdx
   1aabd:	4c 89 e1             	mov    %r12,%rcx
   1aac0:	49 89 dd             	mov    %rbx,%r13
   1aac3:	4c 89 db             	mov    %r11,%rbx
   1aac6:	4d 89 f4             	mov    %r14,%r12
   1aac9:	4d 89 ce             	mov    %r9,%r14
   1aacc:	e8 3f 05 00 00       	call   1b010 <<hyperinterval::ieee::Format>::rounded>
   1aad1:	80 7c 24 18 00       	cmpb   $0x0,0x18(%rsp)
   1aad6:	0f 85 ab 00 00 00    	jne    1ab87 <<hyperinterval::ieee::Format>::power+0x397>
   1aadc:	48 8b 54 24 68       	mov    0x68(%rsp),%rdx
   1aae1:	48 89 d0             	mov    %rdx,%rax
   1aae4:	4c 21 e0             	and    %r12,%rax
   1aae7:	44 89 f1             	mov    %r14d,%ecx
   1aaea:	48 d3 e8             	shr    %cl,%rax
   1aaed:	48 21 ea             	and    %rbp,%rdx
   1aaf0:	89 c1                	mov    %eax,%ecx
   1aaf2:	29 d9                	sub    %ebx,%ecx
   1aaf4:	48 85 c0             	test   %rax,%rax
   1aaf7:	49 0f 45 c5          	cmovne %r13,%rax
   1aafb:	41 0f 44 cf          	cmove  %r15d,%ecx
   1aaff:	48 09 d0             	or     %rdx,%rax
   1ab02:	48 f7 e0             	mul    %rax
   1ab05:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
   1ab0a:	01 c9                	add    %ecx,%ecx
   1ab0c:	c6 44 24 44 00       	movb   $0x0,0x44(%rsp)
   1ab11:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1ab16:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1ab1b:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
   1ab1f:	48 8d 6c 24 18       	lea    0x18(%rsp),%rbp
   1ab24:	48 89 ef             	mov    %rbp,%rdi
   1ab27:	4c 8b b4 24 88 00 00 	mov    0x88(%rsp),%r14
   1ab2e:	00 
   1ab2f:	4c 89 f6             	mov    %r14,%rsi
   1ab32:	4c 89 e2             	mov    %r12,%rdx
   1ab35:	4c 8d 7c 24 30       	lea    0x30(%rsp),%r15
   1ab3a:	4c 89 f9             	mov    %r15,%rcx
   1ab3d:	e8 ce 04 00 00       	call   1b010 <<hyperinterval::ieee::Format>::rounded>
   1ab42:	80 7c 24 18 01       	cmpb   $0x1,0x18(%rsp)
   1ab47:	74 3e                	je     1ab87 <<hyperinterval::ieee::Format>::power+0x397>
   1ab49:	4c 89 f6             	mov    %r14,%rsi
   1ab4c:	49 89 db             	mov    %rbx,%r11
   1ab4f:	4d 89 e6             	mov    %r12,%r14
   1ab52:	48 89 ef             	mov    %rbp,%rdi
   1ab55:	4d 89 fc             	mov    %r15,%r12
   1ab58:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   1ab5d:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
   1ab62:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1ab69:	00 
   1ab6a:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
   1ab6f:	44 8b 7c 24 0c       	mov    0xc(%rsp),%r15d
   1ab74:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   1ab78:	40 f6 c5 01          	test   $0x1,%bpl
   1ab7c:	0f 85 4e fd ff ff    	jne    1a8d0 <<hyperinterval::ieee::Format>::power+0xe0>
   1ab82:	e9 29 fd ff ff       	jmp    1a8b0 <<hyperinterval::ieee::Format>::power+0xc0>
   1ab87:	0f b6 44 24 19       	movzbl 0x19(%rsp),%eax
   1ab8c:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1ab91:	88 47 01             	mov    %al,0x1(%rdi)
   1ab94:	b0 01                	mov    $0x1,%al
   1ab96:	eb 2f                	jmp    1abc7 <<hyperinterval::ieee::Format>::power+0x3d7>
   1ab98:	48 89 d1             	mov    %rdx,%rcx
   1ab9b:	44 20 c0             	and    %r8b,%al
   1ab9e:	74 1d                	je     1abbd <<hyperinterval::ieee::Format>::power+0x3cd>
   1aba0:	48 89 d0             	mov    %rdx,%rax
   1aba3:	48 31 f0             	xor    %rsi,%rax
   1aba6:	48 85 d2             	test   %rdx,%rdx
   1aba9:	48 0f 44 c2          	cmove  %rdx,%rax
   1abad:	48 31 ce             	xor    %rcx,%rsi
   1abb0:	48 85 c9             	test   %rcx,%rcx
   1abb3:	48 0f 44 f1          	cmove  %rcx,%rsi
   1abb7:	48 89 c1             	mov    %rax,%rcx
   1abba:	48 89 f2             	mov    %rsi,%rdx
   1abbd:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1abc1:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   1abc5:	31 c0                	xor    %eax,%eax
   1abc7:	88 07                	mov    %al,(%rdi)
   1abc9:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1abd0:	5b                   	pop    %rbx
   1abd1:	41 5c                	pop    %r12
   1abd3:	41 5d                	pop    %r13
   1abd5:	41 5e                	pop    %r14
   1abd7:	41 5f                	pop    %r15
   1abd9:	5d                   	pop    %rbp
   1abda:	c3                   	ret
   1abdb:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1abe0:	44 8b 44 24 74       	mov    0x74(%rsp),%r8d
   1abe5:	0f b6 44 24 07       	movzbl 0x7(%rsp),%eax
   1abea:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
   1abef:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   1abf4:	44 20 c0             	and    %r8b,%al
   1abf7:	75 a7                	jne    1aba0 <<hyperinterval::ieee::Format>::power+0x3b0>
   1abf9:	eb c2                	jmp    1abbd <<hyperinterval::ieee::Format>::power+0x3cd>
   1abfb:	cc                   	int3
   1abfc:	cc                   	int3
   1abfd:	cc                   	int3
   1abfe:	cc                   	int3
   1abff:	cc                   	int3

<hyperinterval::ieee::Format>::affine:
   1ac00:	55                   	push   %rbp
   1ac01:	41 57                	push   %r15
   1ac03:	41 56                	push   %r14
   1ac05:	41 55                	push   %r13
   1ac07:	41 54                	push   %r12
   1ac09:	53                   	push   %rbx
   1ac0a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   1ac11:	49 89 ca             	mov    %rcx,%r10
   1ac14:	48 89 d3             	mov    %rdx,%rbx
   1ac17:	f3 48 0f bc ca       	tzcnt  %rdx,%rcx
   1ac1c:	4d 89 d4             	mov    %r10,%r12
   1ac1f:	49 21 d4             	and    %rdx,%r12
   1ac22:	49 d3 ec             	shr    %cl,%r12
   1ac25:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   1ac2b:	49 d3 e7             	shl    %cl,%r15
   1ac2e:	4d 8d 77 ff          	lea    -0x1(%r15),%r14
   1ac32:	4c 89 f2             	mov    %r14,%rdx
   1ac35:	4c 21 d2             	and    %r10,%rdx
   1ac38:	48 89 d8             	mov    %rbx,%rax
   1ac3b:	48 d3 e8             	shr    %cl,%rax
   1ac3e:	4d 85 e4             	test   %r12,%r12
   1ac41:	74 0a                	je     1ac4d <<hyperinterval::ieee::Format>::affine+0x4d>
   1ac43:	4c 09 fa             	or     %r15,%rdx
   1ac46:	48 d1 e8             	shr    $1,%rax
   1ac49:	01 c8                	add    %ecx,%eax
   1ac4b:	eb 0b                	jmp    1ac58 <<hyperinterval::ieee::Format>::affine+0x58>
   1ac4d:	48 d1 e8             	shr    $1,%rax
   1ac50:	01 c8                	add    %ecx,%eax
   1ac52:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1ac58:	41 29 c4             	sub    %eax,%r12d
   1ac5b:	4d 89 c3             	mov    %r8,%r11
   1ac5e:	49 21 db             	and    %rbx,%r11
   1ac61:	49 d3 eb             	shr    %cl,%r11
   1ac64:	4c 89 f0             	mov    %r14,%rax
   1ac67:	4c 21 c0             	and    %r8,%rax
   1ac6a:	49 89 dd             	mov    %rbx,%r13
   1ac6d:	49 d3 ed             	shr    %cl,%r13
   1ac70:	4d 85 db             	test   %r11,%r11
   1ac73:	74 0b                	je     1ac80 <<hyperinterval::ieee::Format>::affine+0x80>
   1ac75:	4c 09 f8             	or     %r15,%rax
   1ac78:	49 d1 ed             	shr    $1,%r13
   1ac7b:	41 01 cd             	add    %ecx,%r13d
   1ac7e:	eb 0c                	jmp    1ac8c <<hyperinterval::ieee::Format>::affine+0x8c>
   1ac80:	49 d1 ed             	shr    $1,%r13
   1ac83:	41 01 cd             	add    %ecx,%r13d
   1ac86:	41 bb 01 00 00 00    	mov    $0x1,%r11d
   1ac8c:	45 29 eb             	sub    %r13d,%r11d
   1ac8f:	49 85 f2             	test   %rsi,%r10
   1ac92:	41 0f 95 c2          	setne  %r10b
   1ac96:	49 85 f0             	test   %rsi,%r8
   1ac99:	41 0f 95 c0          	setne  %r8b
   1ac9d:	48 f7 e2             	mul    %rdx
   1aca0:	45 30 d0             	xor    %r10b,%r8b
   1aca3:	45 01 e3             	add    %r12d,%r11d
   1aca6:	44 88 44 24 64       	mov    %r8b,0x64(%rsp)
   1acab:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   1acb0:	4d 89 ca             	mov    %r9,%r10
   1acb3:	49 21 da             	and    %rbx,%r10
   1acb6:	49 d3 ea             	shr    %cl,%r10
   1acb9:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1acbe:	44 89 5c 24 60       	mov    %r11d,0x60(%rsp)
   1acc3:	4d 21 ce             	and    %r9,%r14
   1acc6:	4d 85 d2             	test   %r10,%r10
   1acc9:	74 14                	je     1acdf <<hyperinterval::ieee::Format>::affine+0xdf>
   1accb:	49 89 dc             	mov    %rbx,%r12
   1acce:	49 d3 ec             	shr    %cl,%r12
   1acd1:	4d 09 fe             	or     %r15,%r14
   1acd4:	49 d1 ec             	shr    $1,%r12
   1acd7:	41 01 cc             	add    %ecx,%r12d
   1acda:	45 29 e2             	sub    %r12d,%r10d
   1acdd:	eb 15                	jmp    1acf4 <<hyperinterval::ieee::Format>::affine+0xf4>
   1acdf:	49 89 df             	mov    %rbx,%r15
   1ace2:	49 d3 ef             	shr    %cl,%r15
   1ace5:	49 d1 ef             	shr    $1,%r15
   1ace8:	41 01 cf             	add    %ecx,%r15d
   1aceb:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1acf1:	45 29 fa             	sub    %r15d,%r10d
   1acf4:	49 85 f1             	test   %rsi,%r9
   1acf7:	40 0f 95 c5          	setne  %bpl
   1acfb:	0f 95 84 24 84 00 00 	setne  0x84(%rsp)
   1ad02:	00 
   1ad03:	4c 89 74 24 70       	mov    %r14,0x70(%rsp)
   1ad08:	48 c7 44 24 78 00 00 	movq   $0x0,0x78(%rsp)
   1ad0f:	00 00 
   1ad11:	44 89 94 24 80 00 00 	mov    %r10d,0x80(%rsp)
   1ad18:	00 
   1ad19:	48 89 c1             	mov    %rax,%rcx
   1ad1c:	48 09 d1             	or     %rdx,%rcx
   1ad1f:	74 7b                	je     1ad9c <<hyperinterval::ieee::Format>::affine+0x19c>
   1ad21:	4d 85 f6             	test   %r14,%r14
   1ad24:	74 7d                	je     1ada3 <<hyperinterval::ieee::Format>::affine+0x1a3>
   1ad26:	40 88 6c 24 07       	mov    %bpl,0x7(%rsp)
   1ad2b:	48 0f bd ca          	bsr    %rdx,%rcx
   1ad2f:	83 f1 3f             	xor    $0x3f,%ecx
   1ad32:	4c 0f bd e0          	bsr    %rax,%r12
   1ad36:	41 83 f4 3f          	xor    $0x3f,%r12d
   1ad3a:	41 83 cc 40          	or     $0x40,%r12d
   1ad3e:	48 85 d2             	test   %rdx,%rdx
   1ad41:	44 0f 45 e1          	cmovne %ecx,%r12d
   1ad45:	41 83 f4 7f          	xor    $0x7f,%r12d
   1ad49:	45 01 dc             	add    %r11d,%r12d
   1ad4c:	4d 0f bd fe          	bsr    %r14,%r15
   1ad50:	41 83 f7 3f          	xor    $0x3f,%r15d
   1ad54:	41 83 cf 40          	or     $0x40,%r15d
   1ad58:	41 83 f7 7f          	xor    $0x7f,%r15d
   1ad5c:	45 01 d7             	add    %r10d,%r15d
   1ad5f:	45 39 e7             	cmp    %r12d,%r15d
   1ad62:	45 0f 4e fc          	cmovle %r12d,%r15d
   1ad66:	41 83 c7 82          	add    $0xffffff82,%r15d
   1ad6a:	45 29 fb             	sub    %r15d,%r11d
   1ad6d:	78 46                	js     1adb5 <<hyperinterval::ieee::Format>::affine+0x1b5>
   1ad6f:	44 89 d9             	mov    %r11d,%ecx
   1ad72:	48 0f a5 c2          	shld   %cl,%rax,%rdx
   1ad76:	48 d3 e0             	shl    %cl,%rax
   1ad79:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   1ad80:	00 00 
   1ad82:	41 f6 c3 40          	test   $0x40,%r11b
   1ad86:	48 0f 45 d0          	cmovne %rax,%rdx
   1ad8a:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   1ad90:	4c 0f 44 e8          	cmove  %rax,%r13
   1ad94:	48 89 d5             	mov    %rdx,%rbp
   1ad97:	e9 98 00 00 00       	jmp    1ae34 <<hyperinterval::ieee::Format>::affine+0x234>
   1ad9c:	48 8d 4c 24 70       	lea    0x70(%rsp),%rcx
   1ada1:	eb 05                	jmp    1ada8 <<hyperinterval::ieee::Format>::affine+0x1a8>
   1ada3:	48 8d 4c 24 50       	lea    0x50(%rsp),%rcx
   1ada8:	48 89 da             	mov    %rbx,%rdx
   1adab:	e8 60 02 00 00       	call   1b010 <<hyperinterval::ieee::Format>::rounded>
   1adb0:	e9 fa 01 00 00       	jmp    1afaf <<hyperinterval::ieee::Format>::affine+0x3af>
   1adb5:	41 f7 db             	neg    %r11d
   1adb8:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   1adbe:	bd 00 00 00 00       	mov    $0x0,%ebp
   1adc3:	41 83 fb 7f          	cmp    $0x7f,%r11d
   1adc7:	7f 5d                	jg     1ae26 <<hyperinterval::ieee::Format>::affine+0x226>
   1adc9:	49 89 c5             	mov    %rax,%r13
   1adcc:	44 89 d9             	mov    %r11d,%ecx
   1adcf:	49 0f ad d5          	shrd   %cl,%rdx,%r13
   1add3:	48 89 d5             	mov    %rdx,%rbp
   1add6:	48 d3 ed             	shr    %cl,%rbp
   1add9:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
   1ade0:	49 d3 e4             	shl    %cl,%r12
   1ade3:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
   1adea:	41 f6 c3 40          	test   $0x40,%r11b
   1adee:	4c 0f 45 ed          	cmovne %rbp,%r13
   1adf2:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   1adf8:	49 0f 45 eb          	cmovne %r11,%rbp
   1adfc:	49 0f 45 cc          	cmovne %r12,%rcx
   1ae00:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   1ae06:	4c 89 5c 24 08       	mov    %r11,0x8(%rsp)
   1ae0b:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   1ae11:	4d 0f 45 e3          	cmovne %r11,%r12
   1ae15:	49 f7 d4             	not    %r12
   1ae18:	48 f7 d1             	not    %rcx
   1ae1b:	48 21 d1             	and    %rdx,%rcx
   1ae1e:	49 21 c4             	and    %rax,%r12
   1ae21:	49 09 cc             	or     %rcx,%r12
   1ae24:	74 0e                	je     1ae34 <<hyperinterval::ieee::Format>::affine+0x234>
   1ae26:	41 0f b6 c0          	movzbl %r8b,%eax
   1ae2a:	f7 d8                	neg    %eax
   1ae2c:	83 c8 01             	or     $0x1,%eax
   1ae2f:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
   1ae34:	45 29 fa             	sub    %r15d,%r10d
   1ae37:	78 20                	js     1ae59 <<hyperinterval::ieee::Format>::affine+0x259>
   1ae39:	31 d2                	xor    %edx,%edx
   1ae3b:	44 89 d1             	mov    %r10d,%ecx
   1ae3e:	4c 0f a5 f2          	shld   %cl,%r14,%rdx
   1ae42:	49 d3 e6             	shl    %cl,%r14
   1ae45:	45 31 e4             	xor    %r12d,%r12d
   1ae48:	41 f6 c2 40          	test   $0x40,%r10b
   1ae4c:	49 0f 45 d6          	cmovne %r14,%rdx
   1ae50:	4d 0f 45 f4          	cmovne %r12,%r14
   1ae54:	4c 89 f0             	mov    %r14,%rax
   1ae57:	eb 59                	jmp    1aeb2 <<hyperinterval::ieee::Format>::affine+0x2b2>
   1ae59:	41 f7 da             	neg    %r10d
   1ae5c:	45 31 e4             	xor    %r12d,%r12d
   1ae5f:	b8 00 00 00 00       	mov    $0x0,%eax
   1ae64:	41 83 fa 7f          	cmp    $0x7f,%r10d
   1ae68:	7f 2d                	jg     1ae97 <<hyperinterval::ieee::Format>::affine+0x297>
   1ae6a:	4c 89 f0             	mov    %r14,%rax
   1ae6d:	44 89 d1             	mov    %r10d,%ecx
   1ae70:	4c 0f ad e0          	shrd   %cl,%r12,%rax
   1ae74:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   1ae7b:	49 d3 e3             	shl    %cl,%r11
   1ae7e:	41 f6 c2 40          	test   $0x40,%r10b
   1ae82:	49 0f 45 c4          	cmovne %r12,%rax
   1ae86:	4d 0f 45 dc          	cmovne %r12,%r11
   1ae8a:	49 f7 d3             	not    %r11
   1ae8d:	ba 00 00 00 00       	mov    $0x0,%edx
   1ae92:	4d 85 f3             	test   %r14,%r11
   1ae95:	74 1b                	je     1aeb2 <<hyperinterval::ieee::Format>::affine+0x2b2>
   1ae97:	4c 89 e2             	mov    %r12,%rdx
   1ae9a:	4c 89 c9             	mov    %r9,%rcx
   1ae9d:	48 21 f1             	and    %rsi,%rcx
   1aea0:	45 31 d2             	xor    %r10d,%r10d
   1aea3:	48 f7 d9             	neg    %rcx
   1aea6:	41 0f 93 c2          	setae  %r10b
   1aeaa:	46 8d 24 55 ff ff ff 	lea    -0x1(,%r10,2),%r12d
   1aeb1:	ff 
   1aeb2:	49 85 f1             	test   %rsi,%r9
   1aeb5:	0f 95 c1             	setne  %cl
   1aeb8:	41 38 c8             	cmp    %cl,%r8b
   1aebb:	49 89 fe             	mov    %rdi,%r14
   1aebe:	74 19                	je     1aed9 <<hyperinterval::ieee::Format>::affine+0x2d9>
   1aec0:	49 39 c5             	cmp    %rax,%r13
   1aec3:	48 89 e9             	mov    %rbp,%rcx
   1aec6:	48 19 d1             	sbb    %rdx,%rcx
   1aec9:	73 16                	jae    1aee1 <<hyperinterval::ieee::Format>::affine+0x2e1>
   1aecb:	4c 29 e8             	sub    %r13,%rax
   1aece:	48 19 ea             	sbb    %rbp,%rdx
   1aed1:	44 0f b6 44 24 07    	movzbl 0x7(%rsp),%r8d
   1aed7:	eb 14                	jmp    1aeed <<hyperinterval::ieee::Format>::affine+0x2ed>
   1aed9:	4c 01 e8             	add    %r13,%rax
   1aedc:	48 11 ea             	adc    %rbp,%rdx
   1aedf:	eb 0c                	jmp    1aeed <<hyperinterval::ieee::Format>::affine+0x2ed>
   1aee1:	49 29 c5             	sub    %rax,%r13
   1aee4:	48 19 d5             	sbb    %rdx,%rbp
   1aee7:	4c 89 e8             	mov    %r13,%rax
   1aeea:	48 89 ea             	mov    %rbp,%rdx
   1aeed:	44 88 44 24 24       	mov    %r8b,0x24(%rsp)
   1aef2:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1aef7:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1aefc:	44 89 7c 24 20       	mov    %r15d,0x20(%rsp)
   1af01:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1af06:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1af0b:	49 89 f5             	mov    %rsi,%r13
   1af0e:	48 89 da             	mov    %rbx,%rdx
   1af11:	e8 fa 00 00 00       	call   1b010 <<hyperinterval::ieee::Format>::rounded>
   1af16:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   1af1b:	75 12                	jne    1af2f <<hyperinterval::ieee::Format>::affine+0x32f>
   1af1d:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
   1af22:	41 88 46 01          	mov    %al,0x1(%r14)
   1af26:	41 c6 06 01          	movb   $0x1,(%r14)
   1af2a:	e9 80 00 00 00       	jmp    1afaf <<hyperinterval::ieee::Format>::affine+0x3af>
   1af2f:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
   1af34:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
   1af39:	49 39 c7             	cmp    %rax,%r15
   1af3c:	4c 89 f1             	mov    %r14,%rcx
   1af3f:	75 63                	jne    1afa4 <<hyperinterval::ieee::Format>::affine+0x3a4>
   1af41:	44 03 64 24 08       	add    0x8(%rsp),%r12d
   1af46:	41 83 fc 01          	cmp    $0x1,%r12d
   1af4a:	74 75                	je     1afc1 <<hyperinterval::ieee::Format>::affine+0x3c1>
   1af4c:	41 83 fc ff          	cmp    $0xffffffff,%r12d
   1af50:	75 52                	jne    1afa4 <<hyperinterval::ieee::Format>::affine+0x3a4>
   1af52:	4c 89 f8             	mov    %r15,%rax
   1af55:	4c 89 ee             	mov    %r13,%rsi
   1af58:	4c 31 e8             	xor    %r13,%rax
   1af5b:	4d 85 ff             	test   %r15,%r15
   1af5e:	49 0f 44 c7          	cmove  %r15,%rax
   1af62:	48 89 c1             	mov    %rax,%rcx
   1af65:	4c 21 e9             	and    %r13,%rcx
   1af68:	31 d2                	xor    %edx,%edx
   1af6a:	48 f7 d9             	neg    %rcx
   1af6d:	0f 93 c2             	setae  %dl
   1af70:	48 8d 0c 50          	lea    (%rax,%rdx,2),%rcx
   1af74:	48 ff c9             	dec    %rcx
   1af77:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1af7c:	48 89 da             	mov    %rbx,%rdx
   1af7f:	e8 ac d2 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1af84:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1af89:	75 62                	jne    1afed <<hyperinterval::ieee::Format>::affine+0x3ed>
   1af8b:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1af90:	49 31 c5             	xor    %rax,%r13
   1af93:	48 85 c0             	test   %rax,%rax
   1af96:	4c 0f 44 e8          	cmove  %rax,%r13
   1af9a:	4d 89 6e 08          	mov    %r13,0x8(%r14)
   1af9e:	4d 89 7e 10          	mov    %r15,0x10(%r14)
   1afa2:	eb 5e                	jmp    1b002 <<hyperinterval::ieee::Format>::affine+0x402>
   1afa4:	4c 89 79 08          	mov    %r15,0x8(%rcx)
   1afa8:	48 89 41 10          	mov    %rax,0x10(%rcx)
   1afac:	c6 01 00             	movb   $0x0,(%rcx)
   1afaf:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1afb6:	5b                   	pop    %rbx
   1afb7:	41 5c                	pop    %r12
   1afb9:	41 5d                	pop    %r13
   1afbb:	41 5e                	pop    %r14
   1afbd:	41 5f                	pop    %r15
   1afbf:	5d                   	pop    %rbp
   1afc0:	c3                   	ret
   1afc1:	4c 89 ee             	mov    %r13,%rsi
   1afc4:	4c 89 f8             	mov    %r15,%rax
   1afc7:	4c 21 e8             	and    %r13,%rax
   1afca:	31 c9                	xor    %ecx,%ecx
   1afcc:	48 f7 d8             	neg    %rax
   1afcf:	0f 93 c1             	setae  %cl
   1afd2:	49 8d 0c 4f          	lea    (%r15,%rcx,2),%rcx
   1afd6:	48 ff c9             	dec    %rcx
   1afd9:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1afde:	48 89 da             	mov    %rbx,%rdx
   1afe1:	e8 4a d2 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1afe6:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1afeb:	74 08                	je     1aff5 <<hyperinterval::ieee::Format>::affine+0x3f5>
   1afed:	66 41 c7 06 01 03    	movw   $0x301,(%r14)
   1aff3:	eb ba                	jmp    1afaf <<hyperinterval::ieee::Format>::affine+0x3af>
   1aff5:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1affa:	4d 89 7e 08          	mov    %r15,0x8(%r14)
   1affe:	49 89 46 10          	mov    %rax,0x10(%r14)
   1b002:	41 c6 06 00          	movb   $0x0,(%r14)
   1b006:	eb a7                	jmp    1afaf <<hyperinterval::ieee::Format>::affine+0x3af>
   1b008:	cc                   	int3
   1b009:	cc                   	int3
   1b00a:	cc                   	int3
   1b00b:	cc                   	int3
   1b00c:	cc                   	int3
   1b00d:	cc                   	int3
   1b00e:	cc                   	int3
   1b00f:	cc                   	int3

<hyperinterval::ieee::Format>::rounded:
   1b010:	48 89 c8             	mov    %rcx,%rax
   1b013:	4c 8b 11             	mov    (%rcx),%r10
   1b016:	4c 8b 59 08          	mov    0x8(%rcx),%r11
   1b01a:	4c 89 d1             	mov    %r10,%rcx
   1b01d:	4c 09 d9             	or     %r11,%rcx
   1b020:	0f 84 dd 00 00 00    	je     1b103 <<hyperinterval::ieee::Format>::rounded+0xf3>
   1b026:	55                   	push   %rbp
   1b027:	41 57                	push   %r15
   1b029:	41 56                	push   %r14
   1b02b:	41 55                	push   %r13
   1b02d:	41 54                	push   %r12
   1b02f:	53                   	push   %rbx
   1b030:	8b 68 10             	mov    0x10(%rax),%ebp
   1b033:	49 0f bd cb          	bsr    %r11,%rcx
   1b037:	83 f1 3f             	xor    $0x3f,%ecx
   1b03a:	49 0f bd da          	bsr    %r10,%rbx
   1b03e:	83 f3 3f             	xor    $0x3f,%ebx
   1b041:	83 cb 40             	or     $0x40,%ebx
   1b044:	4d 85 db             	test   %r11,%r11
   1b047:	0f 45 d9             	cmovne %ecx,%ebx
   1b04a:	f3 4c 0f bc c2       	tzcnt  %rdx,%r8
   1b04f:	44 89 c1             	mov    %r8d,%ecx
   1b052:	48 d3 ea             	shr    %cl,%rdx
   1b055:	83 f3 7f             	xor    $0x7f,%ebx
   1b058:	01 eb                	add    %ebp,%ebx
   1b05a:	48 d1 ea             	shr    $1,%rdx
   1b05d:	39 d3                	cmp    %edx,%ebx
   1b05f:	0f 8f 88 01 00 00    	jg     1b1ed <<hyperinterval::ieee::Format>::rounded+0x1dd>
   1b065:	45 8d 0c 10          	lea    (%r8,%rdx,1),%r9d
   1b069:	b9 01 00 00 00       	mov    $0x1,%ecx
   1b06e:	44 29 c9             	sub    %r9d,%ecx
   1b071:	44 29 c3             	sub    %r8d,%ebx
   1b074:	39 cb                	cmp    %ecx,%ebx
   1b076:	0f 4e d9             	cmovle %ecx,%ebx
   1b079:	89 d9                	mov    %ebx,%ecx
   1b07b:	29 e9                	sub    %ebp,%ecx
   1b07d:	83 f9 7f             	cmp    $0x7f,%ecx
   1b080:	0f 8e 88 00 00 00    	jle    1b10e <<hyperinterval::ieee::Format>::rounded+0xfe>
   1b086:	41 b7 01             	mov    $0x1,%r15b
   1b089:	45 31 f6             	xor    %r14d,%r14d
   1b08c:	45 31 db             	xor    %r11d,%r11d
   1b08f:	45 31 d2             	xor    %r10d,%r10d
   1b092:	45 0f b6 ff          	movzbl %r15b,%r15d
   1b096:	4d 01 f7             	add    %r14,%r15
   1b099:	49 83 d3 00          	adc    $0x0,%r11
   1b09d:	4c 89 f9             	mov    %r15,%rcx
   1b0a0:	4c 09 d9             	or     %r11,%rcx
   1b0a3:	0f 84 c3 00 00 00    	je     1b16c <<hyperinterval::ieee::Format>::rounded+0x15c>
   1b0a9:	49 0f bd cb          	bsr    %r11,%rcx
   1b0ad:	83 f1 3f             	xor    $0x3f,%ecx
   1b0b0:	4d 0f bd f7          	bsr    %r15,%r14
   1b0b4:	41 83 f6 3f          	xor    $0x3f,%r14d
   1b0b8:	41 83 ce 40          	or     $0x40,%r14d
   1b0bc:	4d 85 db             	test   %r11,%r11
   1b0bf:	44 0f 45 f1          	cmovne %ecx,%r14d
   1b0c3:	41 83 f6 7f          	xor    $0x7f,%r14d
   1b0c7:	41 8d 2c 1e          	lea    (%r14,%rbx,1),%ebp
   1b0cb:	39 d5                	cmp    %edx,%ebp
   1b0cd:	0f 8f 1a 01 00 00    	jg     1b1ed <<hyperinterval::ieee::Format>::rounded+0x1dd>
   1b0d3:	b9 01 00 00 00       	mov    $0x1,%ecx
   1b0d8:	29 d1                	sub    %edx,%ecx
   1b0da:	39 cd                	cmp    %ecx,%ebp
   1b0dc:	0f 8d 41 01 00 00    	jge    1b223 <<hyperinterval::ieee::Format>::rounded+0x213>
   1b0e2:	41 01 d9             	add    %ebx,%r9d
   1b0e5:	41 fe c9             	dec    %r9b
   1b0e8:	44 89 c9             	mov    %r9d,%ecx
   1b0eb:	49 d3 e7             	shl    %cl,%r15
   1b0ee:	31 d2                	xor    %edx,%edx
   1b0f0:	41 f6 c1 40          	test   $0x40,%r9b
   1b0f4:	49 0f 44 d7          	cmove  %r15,%rdx
   1b0f8:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1b0fc:	74 76                	je     1b174 <<hyperinterval::ieee::Format>::rounded+0x164>
   1b0fe:	e9 8e 00 00 00       	jmp    1b191 <<hyperinterval::ieee::Format>::rounded+0x181>
   1b103:	c6 07 00             	movb   $0x0,(%rdi)
   1b106:	0f 57 c0             	xorps  %xmm0,%xmm0
   1b109:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1b10d:	c3                   	ret
   1b10e:	85 c9                	test   %ecx,%ecx
   1b110:	0f 8e 88 00 00 00    	jle    1b19e <<hyperinterval::ieee::Format>::rounded+0x18e>
   1b116:	4d 89 d6             	mov    %r10,%r14
   1b119:	4d 0f ad de          	shrd   %cl,%r11,%r14
   1b11d:	4d 89 dc             	mov    %r11,%r12
   1b120:	49 d3 ec             	shr    %cl,%r12
   1b123:	49 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%r15
   1b12a:	49 d3 e7             	shl    %cl,%r15
   1b12d:	49 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%r13
   1b134:	31 ed                	xor    %ebp,%ebp
   1b136:	f6 c1 40             	test   $0x40,%cl
   1b139:	4d 0f 45 f4          	cmovne %r12,%r14
   1b13d:	4c 0f 45 e5          	cmovne %rbp,%r12
   1b141:	4d 0f 45 ef          	cmovne %r15,%r13
   1b145:	4c 0f 45 fd          	cmovne %rbp,%r15
   1b149:	49 f7 d7             	not    %r15
   1b14c:	49 f7 d5             	not    %r13
   1b14f:	4d 21 dd             	and    %r11,%r13
   1b152:	4d 21 d7             	and    %r10,%r15
   1b155:	4d 09 ef             	or     %r13,%r15
   1b158:	41 0f 95 c7          	setne  %r15b
   1b15c:	4d 89 e3             	mov    %r12,%r11
   1b15f:	4c 89 f1             	mov    %r14,%rcx
   1b162:	4c 09 d9             	or     %r11,%rcx
   1b165:	75 60                	jne    1b1c7 <<hyperinterval::ieee::Format>::rounded+0x1b7>
   1b167:	e9 1d ff ff ff       	jmp    1b089 <<hyperinterval::ieee::Format>::rounded+0x79>
   1b16c:	31 d2                	xor    %edx,%edx
   1b16e:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1b172:	75 1d                	jne    1b191 <<hyperinterval::ieee::Format>::rounded+0x181>
   1b174:	48 89 d0             	mov    %rdx,%rax
   1b177:	48 31 f0             	xor    %rsi,%rax
   1b17a:	48 85 d2             	test   %rdx,%rdx
   1b17d:	48 0f 44 c2          	cmove  %rdx,%rax
   1b181:	4c 31 d6             	xor    %r10,%rsi
   1b184:	4d 85 d2             	test   %r10,%r10
   1b187:	49 0f 44 f2          	cmove  %r10,%rsi
   1b18b:	49 89 c2             	mov    %rax,%r10
   1b18e:	48 89 f2             	mov    %rsi,%rdx
   1b191:	4c 89 57 08          	mov    %r10,0x8(%rdi)
   1b195:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   1b199:	c6 07 00             	movb   $0x0,(%rdi)
   1b19c:	eb 54                	jmp    1b1f2 <<hyperinterval::ieee::Format>::rounded+0x1e2>
   1b19e:	f6 d9                	neg    %cl
   1b1a0:	4d 0f a5 d3          	shld   %cl,%r10,%r11
   1b1a4:	49 d3 e2             	shl    %cl,%r10
   1b1a7:	45 31 ff             	xor    %r15d,%r15d
   1b1aa:	f6 c1 40             	test   $0x40,%cl
   1b1ad:	4d 0f 45 da          	cmovne %r10,%r11
   1b1b1:	41 be 00 00 00 00    	mov    $0x0,%r14d
   1b1b7:	4d 0f 44 f2          	cmove  %r10,%r14
   1b1bb:	4c 89 f1             	mov    %r14,%rcx
   1b1be:	4c 09 d9             	or     %r11,%rcx
   1b1c1:	0f 84 c2 fe ff ff    	je     1b089 <<hyperinterval::ieee::Format>::rounded+0x79>
   1b1c7:	49 0f bd cb          	bsr    %r11,%rcx
   1b1cb:	83 f1 3f             	xor    $0x3f,%ecx
   1b1ce:	4d 0f bd e6          	bsr    %r14,%r12
   1b1d2:	41 83 f4 3f          	xor    $0x3f,%r12d
   1b1d6:	41 83 cc 40          	or     $0x40,%r12d
   1b1da:	4d 85 db             	test   %r11,%r11
   1b1dd:	44 0f 45 e1          	cmovne %ecx,%r12d
   1b1e1:	41 83 f4 7f          	xor    $0x7f,%r12d
   1b1e5:	41 8d 2c 1c          	lea    (%r12,%rbx,1),%ebp
   1b1e9:	39 d5                	cmp    %edx,%ebp
   1b1eb:	7e 10                	jle    1b1fd <<hyperinterval::ieee::Format>::rounded+0x1ed>
   1b1ed:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   1b1f2:	5b                   	pop    %rbx
   1b1f3:	41 5c                	pop    %r12
   1b1f5:	41 5d                	pop    %r13
   1b1f7:	41 5e                	pop    %r14
   1b1f9:	41 5f                	pop    %r15
   1b1fb:	5d                   	pop    %rbp
   1b1fc:	c3                   	ret
   1b1fd:	b9 01 00 00 00       	mov    $0x1,%ecx
   1b202:	29 d1                	sub    %edx,%ecx
   1b204:	39 cd                	cmp    %ecx,%ebp
   1b206:	7d 7d                	jge    1b285 <<hyperinterval::ieee::Format>::rounded+0x275>
   1b208:	41 8d 0c 19          	lea    (%r9,%rbx,1),%ecx
   1b20c:	fe c9                	dec    %cl
   1b20e:	4d 89 f4             	mov    %r14,%r12
   1b211:	49 d3 e4             	shl    %cl,%r12
   1b214:	45 31 d2             	xor    %r10d,%r10d
   1b217:	f6 c1 40             	test   $0x40,%cl
   1b21a:	4d 0f 44 d4          	cmove  %r12,%r10
   1b21e:	e9 6f fe ff ff       	jmp    1b092 <<hyperinterval::ieee::Format>::rounded+0x82>
   1b223:	44 89 c1             	mov    %r8d,%ecx
   1b226:	44 29 f1             	sub    %r14d,%ecx
   1b229:	41 89 c9             	mov    %ecx,%r9d
   1b22c:	41 f7 d9             	neg    %r9d
   1b22f:	4c 89 fb             	mov    %r15,%rbx
   1b232:	48 d3 e3             	shl    %cl,%rbx
   1b235:	45 31 e4             	xor    %r12d,%r12d
   1b238:	f6 c1 40             	test   $0x40,%cl
   1b23b:	4c 0f 44 e3          	cmove  %rbx,%r12
   1b23f:	44 89 c9             	mov    %r9d,%ecx
   1b242:	4d 0f ad df          	shrd   %cl,%r11,%r15
   1b246:	49 d3 eb             	shr    %cl,%r11
   1b249:	41 f6 c1 40          	test   $0x40,%r9b
   1b24d:	4d 0f 44 df          	cmove  %r15,%r11
   1b251:	45 39 f0             	cmp    %r14d,%r8d
   1b254:	4d 0f 43 dc          	cmovae %r12,%r11
   1b258:	01 d5                	add    %edx,%ebp
   1b25a:	4c 63 cd             	movslq %ebp,%r9
   1b25d:	44 89 c1             	mov    %r8d,%ecx
   1b260:	49 d3 e1             	shl    %cl,%r9
   1b263:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
   1b26a:	48 d3 e2             	shl    %cl,%rdx
   1b26d:	48 f7 d2             	not    %rdx
   1b270:	4c 21 da             	and    %r11,%rdx
   1b273:	4c 09 ca             	or     %r9,%rdx
   1b276:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1b27a:	0f 85 11 ff ff ff    	jne    1b191 <<hyperinterval::ieee::Format>::rounded+0x181>
   1b280:	e9 ef fe ff ff       	jmp    1b174 <<hyperinterval::ieee::Format>::rounded+0x164>
   1b285:	44 89 c1             	mov    %r8d,%ecx
   1b288:	44 29 e1             	sub    %r12d,%ecx
   1b28b:	4d 89 f5             	mov    %r14,%r13
   1b28e:	49 d3 e5             	shl    %cl,%r13
   1b291:	41 89 ca             	mov    %ecx,%r10d
   1b294:	41 f7 da             	neg    %r10d
   1b297:	48 c7 44 24 f0 00 00 	movq   $0x0,-0x10(%rsp)
   1b29e:	00 00 
   1b2a0:	f6 c1 40             	test   $0x40,%cl
   1b2a3:	48 8b 4c 24 f0       	mov    -0x10(%rsp),%rcx
   1b2a8:	49 0f 44 cd          	cmove  %r13,%rcx
   1b2ac:	48 89 4c 24 f0       	mov    %rcx,-0x10(%rsp)
   1b2b1:	4d 89 f5             	mov    %r14,%r13
   1b2b4:	44 89 d1             	mov    %r10d,%ecx
   1b2b7:	4d 0f ad dd          	shrd   %cl,%r11,%r13
   1b2bb:	4c 89 6c 24 f8       	mov    %r13,-0x8(%rsp)
   1b2c0:	4d 89 dd             	mov    %r11,%r13
   1b2c3:	49 d3 ed             	shr    %cl,%r13
   1b2c6:	41 f6 c2 40          	test   $0x40,%r10b
   1b2ca:	4c 0f 44 6c 24 f8    	cmove  -0x8(%rsp),%r13
   1b2d0:	45 39 e0             	cmp    %r12d,%r8d
   1b2d3:	4c 0f 43 6c 24 f0    	cmovae -0x10(%rsp),%r13
   1b2d9:	01 d5                	add    %edx,%ebp
   1b2db:	4c 63 e5             	movslq %ebp,%r12
   1b2de:	44 89 c1             	mov    %r8d,%ecx
   1b2e1:	49 d3 e4             	shl    %cl,%r12
   1b2e4:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
   1b2eb:	49 d3 e2             	shl    %cl,%r10
   1b2ee:	49 f7 d2             	not    %r10
   1b2f1:	4d 21 ea             	and    %r13,%r10
   1b2f4:	4d 09 e2             	or     %r12,%r10
   1b2f7:	e9 96 fd ff ff       	jmp    1b092 <<hyperinterval::ieee::Format>::rounded+0x82>
   1b2fc:	cc                   	int3
   1b2fd:	cc                   	int3
   1b2fe:	cc                   	int3
   1b2ff:	cc                   	int3

<hyperinterval::float::F64Enclosure>::reciprocal:
   1b300:	55                   	push   %rbp
   1b301:	41 57                	push   %r15
   1b303:	41 56                	push   %r14
   1b305:	41 55                	push   %r13
   1b307:	41 54                	push   %r12
   1b309:	53                   	push   %rbx
   1b30a:	48 83 ec 28          	sub    $0x28,%rsp
   1b30e:	48 89 fb             	mov    %rdi,%rbx
   1b311:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1b315:	74 65                	je     1b37c <<hyperinterval::float::F64Enclosure>::reciprocal+0x7c>
   1b317:	49 89 f6             	mov    %rsi,%r14
   1b31a:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
   1b321:	00 00 80 
   1b324:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1b32b:	00 f0 7f 
   1b32e:	49 bd 00 00 00 00 00 	movabs $0x3ff0000000000000,%r13
   1b335:	00 f0 3f 
   1b338:	48 89 e7             	mov    %rsp,%rdi
   1b33b:	4c 89 fe             	mov    %r15,%rsi
   1b33e:	4c 89 e2             	mov    %r12,%rdx
   1b341:	4c 89 e9             	mov    %r13,%rcx
   1b344:	e8 e7 ce ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1b349:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b34d:	74 1c                	je     1b36b <<hyperinterval::float::F64Enclosure>::reciprocal+0x6b>
   1b34f:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1b354:	48 89 e7             	mov    %rsp,%rdi
   1b357:	4c 89 fe             	mov    %r15,%rsi
   1b35a:	4c 89 e2             	mov    %r12,%rdx
   1b35d:	4c 89 e9             	mov    %r13,%rcx
   1b360:	e8 cb ce ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1b365:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b369:	75 2a                	jne    1b395 <<hyperinterval::float::F64Enclosure>::reciprocal+0x95>
   1b36b:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   1b370:	88 53 08             	mov    %dl,0x8(%rbx)
   1b373:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b37a:	eb 07                	jmp    1b383 <<hyperinterval::float::F64Enclosure>::reciprocal+0x83>
   1b37c:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1b383:	48 89 d8             	mov    %rbx,%rax
   1b386:	48 83 c4 28          	add    $0x28,%rsp
   1b38a:	5b                   	pop    %rbx
   1b38b:	41 5c                	pop    %r12
   1b38d:	41 5d                	pop    %r13
   1b38f:	41 5e                	pop    %r14
   1b391:	41 5f                	pop    %r15
   1b393:	5d                   	pop    %rbp
   1b394:	c3                   	ret
   1b395:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b39a:	49 8d 14 2f          	lea    (%r15,%rbp,1),%rdx
   1b39e:	49 8d 47 ff          	lea    -0x1(%r15),%rax
   1b3a2:	48 89 ee             	mov    %rbp,%rsi
   1b3a5:	48 21 c6             	and    %rax,%rsi
   1b3a8:	4c 89 ff             	mov    %r15,%rdi
   1b3ab:	48 29 f7             	sub    %rsi,%rdi
   1b3ae:	48 85 ed             	test   %rbp,%rbp
   1b3b1:	48 0f 49 fa          	cmovns %rdx,%rdi
   1b3b5:	4a 8d 14 39          	lea    (%rcx,%r15,1),%rdx
   1b3b9:	48 89 ce             	mov    %rcx,%rsi
   1b3bc:	48 21 c6             	and    %rax,%rsi
   1b3bf:	49 29 f7             	sub    %rsi,%r15
   1b3c2:	48 85 c9             	test   %rcx,%rcx
   1b3c5:	4c 0f 49 fa          	cmovns %rdx,%r15
   1b3c9:	b2 01                	mov    $0x1,%dl
   1b3cb:	4c 39 ff             	cmp    %r15,%rdi
   1b3ce:	77 a0                	ja     1b370 <<hyperinterval::float::F64Enclosure>::reciprocal+0x70>
   1b3d0:	48 c7 44 24 10 01 00 	movq   $0x1,0x10(%rsp)
   1b3d7:	00 00 
   1b3d9:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
   1b3de:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   1b3e3:	49 83 7e 08 00       	cmpq   $0x0,0x8(%r14)
   1b3e8:	7f 0e                	jg     1b3f8 <<hyperinterval::float::F64Enclosure>::reciprocal+0xf8>
   1b3ea:	49 8b 4e 10          	mov    0x10(%r14),%rcx
   1b3ee:	48 85 c9             	test   %rcx,%rcx
   1b3f1:	79 1f                	jns    1b412 <<hyperinterval::float::F64Enclosure>::reciprocal+0x112>
   1b3f3:	48 21 c1             	and    %rax,%rcx
   1b3f6:	74 1a                	je     1b412 <<hyperinterval::float::F64Enclosure>::reciprocal+0x112>
   1b3f8:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
   1b3fd:	48 89 df             	mov    %rbx,%rdi
   1b400:	4c 89 f2             	mov    %r14,%rdx
   1b403:	b9 01 00 00 00       	mov    $0x1,%ecx
   1b408:	e8 b3 02 00 00       	call   1b6c0 <<hyperinterval::float::F64Enclosure>::corner_image>
   1b40d:	e9 71 ff ff ff       	jmp    1b383 <<hyperinterval::float::F64Enclosure>::reciprocal+0x83>
   1b412:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
   1b416:	e9 58 ff ff ff       	jmp    1b373 <<hyperinterval::float::F64Enclosure>::reciprocal+0x73>
   1b41b:	cc                   	int3
   1b41c:	cc                   	int3
   1b41d:	cc                   	int3
   1b41e:	cc                   	int3
   1b41f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::checked_pow:
   1b420:	55                   	push   %rbp
   1b421:	41 57                	push   %r15
   1b423:	41 56                	push   %r14
   1b425:	41 55                	push   %r13
   1b427:	41 54                	push   %r12
   1b429:	53                   	push   %rbx
   1b42a:	48 83 ec 78          	sub    $0x78,%rsp
   1b42e:	48 89 fb             	mov    %rdi,%rbx
   1b431:	83 fa 02             	cmp    $0x2,%edx
   1b434:	75 0e                	jne    1b444 <<hyperinterval::float::F64Enclosure>::checked_pow+0x24>
   1b436:	48 89 df             	mov    %rbx,%rdi
   1b439:	ff 15 e9 11 04 00    	call   *0x411e9(%rip)        # 5c628 <_DYNAMIC+0x2f0>
   1b43f:	e9 80 00 00 00       	jmp    1b4c4 <<hyperinterval::float::F64Enclosure>::checked_pow+0xa4>
   1b444:	f6 06 01             	testb  $0x1,(%rsi)
   1b447:	74 74                	je     1b4bd <<hyperinterval::float::F64Enclosure>::checked_pow+0x9d>
   1b449:	89 d5                	mov    %edx,%ebp
   1b44b:	4c 8b 76 10          	mov    0x10(%rsi),%r14
   1b44f:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
   1b456:	00 00 80 
   1b459:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1b460:	00 f0 7f 
   1b463:	48 89 74 24 70       	mov    %rsi,0x70(%rsp)
   1b468:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1b46c:	48 89 e7             	mov    %rsp,%rdi
   1b46f:	4c 89 fe             	mov    %r15,%rsi
   1b472:	4c 89 e2             	mov    %r12,%rdx
   1b475:	41 89 e8             	mov    %ebp,%r8d
   1b478:	e8 73 f3 ff ff       	call   1a7f0 <<hyperinterval::ieee::Format>::power>
   1b47d:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b481:	75 29                	jne    1b4ac <<hyperinterval::float::F64Enclosure>::checked_pow+0x8c>
   1b483:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1b488:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1b48d:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1b492:	48 89 e7             	mov    %rsp,%rdi
   1b495:	4c 89 fe             	mov    %r15,%rsi
   1b498:	4c 89 e2             	mov    %r12,%rdx
   1b49b:	4c 89 f1             	mov    %r14,%rcx
   1b49e:	41 89 e8             	mov    %ebp,%r8d
   1b4a1:	e8 4a f3 ff ff       	call   1a7f0 <<hyperinterval::ieee::Format>::power>
   1b4a6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b4aa:	75 2a                	jne    1b4d6 <<hyperinterval::float::F64Enclosure>::checked_pow+0xb6>
   1b4ac:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1b4b1:	88 43 08             	mov    %al,0x8(%rbx)
   1b4b4:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b4bb:	eb 07                	jmp    1b4c4 <<hyperinterval::float::F64Enclosure>::checked_pow+0xa4>
   1b4bd:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1b4c4:	48 89 d8             	mov    %rbx,%rax
   1b4c7:	48 83 c4 78          	add    $0x78,%rsp
   1b4cb:	5b                   	pop    %rbx
   1b4cc:	41 5c                	pop    %r12
   1b4ce:	41 5d                	pop    %r13
   1b4d0:	41 5e                	pop    %r14
   1b4d2:	41 5f                	pop    %r15
   1b4d4:	5d                   	pop    %rbp
   1b4d5:	c3                   	ret
   1b4d6:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b4db:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
   1b4e0:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   1b4e5:	48 89 e7             	mov    %rsp,%rdi
   1b4e8:	4c 89 fe             	mov    %r15,%rsi
   1b4eb:	4c 89 e2             	mov    %r12,%rdx
   1b4ee:	4c 89 e9             	mov    %r13,%rcx
   1b4f1:	e8 3a cd ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1b4f6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b4fa:	74 1e                	je     1b51a <<hyperinterval::float::F64Enclosure>::checked_pow+0xfa>
   1b4fc:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1b501:	48 89 e7             	mov    %rsp,%rdi
   1b504:	4c 89 fe             	mov    %r15,%rsi
   1b507:	4c 89 e2             	mov    %r12,%rdx
   1b50a:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1b50f:	e8 1c cd ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1b514:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b518:	75 11                	jne    1b52b <<hyperinterval::float::F64Enclosure>::checked_pow+0x10b>
   1b51a:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   1b51f:	88 4b 08             	mov    %cl,0x8(%rbx)
   1b522:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b529:	eb 99                	jmp    1b4c4 <<hyperinterval::float::F64Enclosure>::checked_pow+0xa4>
   1b52b:	4c 89 74 24 18       	mov    %r14,0x18(%rsp)
   1b530:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b535:	4b 8d 0c 2f          	lea    (%r15,%r13,1),%rcx
   1b539:	4d 8d 77 ff          	lea    -0x1(%r15),%r14
   1b53d:	4c 89 ea             	mov    %r13,%rdx
   1b540:	4c 21 f2             	and    %r14,%rdx
   1b543:	4c 89 fe             	mov    %r15,%rsi
   1b546:	48 29 d6             	sub    %rdx,%rsi
   1b549:	4d 85 ed             	test   %r13,%r13
   1b54c:	48 0f 49 f1          	cmovns %rcx,%rsi
   1b550:	4a 8d 0c 38          	lea    (%rax,%r15,1),%rcx
   1b554:	48 89 c2             	mov    %rax,%rdx
   1b557:	4c 21 f2             	and    %r14,%rdx
   1b55a:	4c 89 ff             	mov    %r15,%rdi
   1b55d:	48 29 d7             	sub    %rdx,%rdi
   1b560:	48 85 c0             	test   %rax,%rax
   1b563:	48 0f 49 f9          	cmovns %rcx,%rdi
   1b567:	b1 01                	mov    $0x1,%cl
   1b569:	48 39 fe             	cmp    %rdi,%rsi
   1b56c:	77 b1                	ja     1b51f <<hyperinterval::float::F64Enclosure>::checked_pow+0xff>
   1b56e:	48 c7 44 24 38 01 00 	movq   $0x1,0x38(%rsp)
   1b575:	00 00 
   1b577:	4c 89 6c 24 40       	mov    %r13,0x40(%rsp)
   1b57c:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1b581:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   1b586:	4c 89 fe             	mov    %r15,%rsi
   1b589:	4c 89 e2             	mov    %r12,%rdx
   1b58c:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
   1b591:	e8 9a cc ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1b596:	80 7c 24 20 01       	cmpb   $0x1,0x20(%rsp)
   1b59b:	74 21                	je     1b5be <<hyperinterval::float::F64Enclosure>::checked_pow+0x19e>
   1b59d:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
   1b5a2:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   1b5a7:	4c 89 fe             	mov    %r15,%rsi
   1b5aa:	4c 89 e2             	mov    %r12,%rdx
   1b5ad:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1b5b2:	e8 79 cc ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1b5b7:	80 7c 24 20 01       	cmpb   $0x1,0x20(%rsp)
   1b5bc:	75 0a                	jne    1b5c8 <<hyperinterval::float::F64Enclosure>::checked_pow+0x1a8>
   1b5be:	0f b6 4c 24 21       	movzbl 0x21(%rsp),%ecx
   1b5c3:	e9 57 ff ff ff       	jmp    1b51f <<hyperinterval::float::F64Enclosure>::checked_pow+0xff>
   1b5c8:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   1b5cd:	4b 8d 0c 2f          	lea    (%r15,%r13,1),%rcx
   1b5d1:	4c 89 ea             	mov    %r13,%rdx
   1b5d4:	4c 21 f2             	and    %r14,%rdx
   1b5d7:	4c 89 fe             	mov    %r15,%rsi
   1b5da:	48 29 d6             	sub    %rdx,%rsi
   1b5dd:	4d 85 ed             	test   %r13,%r13
   1b5e0:	48 0f 49 f1          	cmovns %rcx,%rsi
   1b5e4:	4a 8d 0c 38          	lea    (%rax,%r15,1),%rcx
   1b5e8:	49 21 c6             	and    %rax,%r14
   1b5eb:	4d 29 f7             	sub    %r14,%r15
   1b5ee:	48 85 c0             	test   %rax,%rax
   1b5f1:	4c 0f 49 f9          	cmovns %rcx,%r15
   1b5f5:	b1 01                	mov    $0x1,%cl
   1b5f7:	4c 39 fe             	cmp    %r15,%rsi
   1b5fa:	0f 87 1f ff ff ff    	ja     1b51f <<hyperinterval::float::F64Enclosure>::checked_pow+0xff>
   1b600:	48 c7 04 24 01 00 00 	movq   $0x1,(%rsp)
   1b607:	00 
   1b608:	4c 89 6c 24 08       	mov    %r13,0x8(%rsp)
   1b60d:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1b612:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
   1b617:	48 8d 74 24 38       	lea    0x38(%rsp),%rsi
   1b61c:	48 89 e2             	mov    %rsp,%rdx
   1b61f:	ff 15 cb 10 04 00    	call   *0x410cb(%rip)        # 5c6f0 <_DYNAMIC+0x3b8>
   1b625:	85 ed                	test   %ebp,%ebp
   1b627:	0f 95 c0             	setne  %al
   1b62a:	40 f6 c5 01          	test   $0x1,%bpl
   1b62e:	0f 94 c1             	sete   %cl
   1b631:	84 c8                	test   %cl,%al
   1b633:	74 74                	je     1b6a9 <<hyperinterval::float::F64Enclosure>::checked_pow+0x289>
   1b635:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
   1b63a:	ff 15 c8 10 04 00    	call   *0x410c8(%rip)        # 5c708 <_DYNAMIC+0x3d0>
   1b640:	a8 02                	test   $0x2,%al
   1b642:	74 65                	je     1b6a9 <<hyperinterval::float::F64Enclosure>::checked_pow+0x289>
   1b644:	48 89 e7             	mov    %rsp,%rdi
   1b647:	31 f6                	xor    %esi,%esi
   1b649:	31 d2                	xor    %edx,%edx
   1b64b:	e8 b0 18 00 00       	call   1cf00 <<hyperinterval::float::F64Enclosure>::from_bits>
   1b650:	48 8b 0c 24          	mov    (%rsp),%rcx
   1b654:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1b659:	48 83 f9 02          	cmp    $0x2,%rcx
   1b65d:	0f 84 4e fe ff ff    	je     1b4b1 <<hyperinterval::float::F64Enclosure>::checked_pow+0x91>
   1b663:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   1b668:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1b66d:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
   1b672:	48 89 54 24 41       	mov    %rdx,0x41(%rsp)
   1b677:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
   1b67c:	88 44 24 40          	mov    %al,0x40(%rsp)
   1b680:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   1b685:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   1b68a:	48 8d 54 24 38       	lea    0x38(%rsp),%rdx
   1b68f:	ff 15 5b 10 04 00    	call   *0x4105b(%rip)        # 5c6f0 <_DYNAMIC+0x3b8>
   1b695:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   1b69a:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1b69f:	0f 10 44 24 20       	movups 0x20(%rsp),%xmm0
   1b6a4:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
   1b6a9:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
   1b6ae:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1b6b2:	0f 28 44 24 50       	movaps 0x50(%rsp),%xmm0
   1b6b7:	0f 11 03             	movups %xmm0,(%rbx)
   1b6ba:	e9 05 fe ff ff       	jmp    1b4c4 <<hyperinterval::float::F64Enclosure>::checked_pow+0xa4>
   1b6bf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::corner_image:
   1b6c0:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b6c4:	75 7e                	jne    1b744 <<hyperinterval::float::F64Enclosure>::corner_image+0x84>
   1b6c6:	f6 02 01             	testb  $0x1,(%rdx)
   1b6c9:	74 79                	je     1b744 <<hyperinterval::float::F64Enclosure>::corner_image+0x84>
   1b6cb:	55                   	push   %rbp
   1b6cc:	41 57                	push   %r15
   1b6ce:	41 56                	push   %r14
   1b6d0:	41 55                	push   %r13
   1b6d2:	41 54                	push   %r12
   1b6d4:	53                   	push   %rbx
   1b6d5:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
   1b6dc:	41 89 cc             	mov    %ecx,%r12d
   1b6df:	48 89 7c 24 78       	mov    %rdi,0x78(%rsp)
   1b6e4:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
   1b6eb:	00 00 80 
   1b6ee:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1b6f5:	00 f0 7f 
   1b6f8:	4c 8b 6e 08          	mov    0x8(%rsi),%r13
   1b6fc:	48 8b 46 10          	mov    0x10(%rsi),%rax
   1b700:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1b705:	48 8b 6a 08          	mov    0x8(%rdx),%rbp
   1b709:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1b70d:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1b712:	45 84 e4             	test   %r12b,%r12b
   1b715:	74 35                	je     1b74c <<hyperinterval::float::F64Enclosure>::corner_image+0x8c>
   1b717:	48 89 e7             	mov    %rsp,%rdi
   1b71a:	4c 89 fe             	mov    %r15,%rsi
   1b71d:	4c 89 f2             	mov    %r14,%rdx
   1b720:	4c 89 e9             	mov    %r13,%rcx
   1b723:	49 89 e8             	mov    %rbp,%r8
   1b726:	e8 85 ec ff ff       	call   1a3b0 <<hyperinterval::ieee::Format>::div>
   1b72b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b72f:	0f 85 fa 00 00 00    	jne    1b82f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b735:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b73a:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
   1b73f:	e9 b6 00 00 00       	jmp    1b7fa <<hyperinterval::float::F64Enclosure>::corner_image+0x13a>
   1b744:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
   1b74b:	c3                   	ret
   1b74c:	4c 89 e8             	mov    %r13,%rax
   1b74f:	48 c1 e8 34          	shr    $0x34,%rax
   1b753:	25 ff 07 00 00       	and    $0x7ff,%eax
   1b758:	48 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%rdx
   1b75f:	ff 0f 00 
   1b762:	4c 89 ee             	mov    %r13,%rsi
   1b765:	48 21 d6             	and    %rdx,%rsi
   1b768:	8d 88 cd fb ff ff    	lea    -0x433(%rax),%ecx
   1b76e:	48 85 c0             	test   %rax,%rax
   1b771:	b8 ce fb ff ff       	mov    $0xfffffbce,%eax
   1b776:	0f 44 c8             	cmove  %eax,%ecx
   1b779:	48 8d 7c 16 01       	lea    0x1(%rsi,%rdx,1),%rdi
   1b77e:	48 0f 44 fe          	cmove  %rsi,%rdi
   1b782:	48 89 ee             	mov    %rbp,%rsi
   1b785:	48 c1 ee 34          	shr    $0x34,%rsi
   1b789:	81 e6 ff 07 00 00    	and    $0x7ff,%esi
   1b78f:	49 89 e8             	mov    %rbp,%r8
   1b792:	49 21 d0             	and    %rdx,%r8
   1b795:	44 8d 8e cd fb ff ff 	lea    -0x433(%rsi),%r9d
   1b79c:	48 85 f6             	test   %rsi,%rsi
   1b79f:	44 0f 44 c8          	cmove  %eax,%r9d
   1b7a3:	49 8d 44 10 01       	lea    0x1(%r8,%rdx,1),%rax
   1b7a8:	49 0f 44 c0          	cmove  %r8,%rax
   1b7ac:	48 89 ee             	mov    %rbp,%rsi
   1b7af:	4c 31 ee             	xor    %r13,%rsi
   1b7b2:	48 f7 e7             	mul    %rdi
   1b7b5:	41 01 c9             	add    %ecx,%r9d
   1b7b8:	48 c1 ee 3f          	shr    $0x3f,%rsi
   1b7bc:	40 88 74 24 14       	mov    %sil,0x14(%rsp)
   1b7c1:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b7c6:	48 89 04 24          	mov    %rax,(%rsp)
   1b7ca:	44 89 4c 24 10       	mov    %r9d,0x10(%rsp)
   1b7cf:	48 8d 7c 24 48       	lea    0x48(%rsp),%rdi
   1b7d4:	48 89 e1             	mov    %rsp,%rcx
   1b7d7:	4c 89 fe             	mov    %r15,%rsi
   1b7da:	4c 89 f2             	mov    %r14,%rdx
   1b7dd:	e8 2e f8 ff ff       	call   1b010 <<hyperinterval::ieee::Format>::rounded>
   1b7e2:	80 7c 24 48 00       	cmpb   $0x0,0x48(%rsp)
   1b7e7:	74 07                	je     1b7f0 <<hyperinterval::float::F64Enclosure>::corner_image+0x130>
   1b7e9:	0f b6 7c 24 49       	movzbl 0x49(%rsp),%edi
   1b7ee:	eb 44                	jmp    1b834 <<hyperinterval::float::F64Enclosure>::corner_image+0x174>
   1b7f0:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
   1b7f5:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
   1b7fa:	48 89 e7             	mov    %rsp,%rdi
   1b7fd:	4c 89 fe             	mov    %r15,%rsi
   1b800:	4c 89 f2             	mov    %r14,%rdx
   1b803:	e8 28 ca ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1b808:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b80c:	75 21                	jne    1b82f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b80e:	48 89 6c 24 70       	mov    %rbp,0x70(%rsp)
   1b813:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1b818:	48 89 e7             	mov    %rsp,%rdi
   1b81b:	4c 89 fe             	mov    %r15,%rsi
   1b81e:	4c 89 f2             	mov    %r14,%rdx
   1b821:	48 89 d9             	mov    %rbx,%rcx
   1b824:	e8 07 ca ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1b829:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b82d:	74 27                	je     1b856 <<hyperinterval::float::F64Enclosure>::corner_image+0x196>
   1b82f:	0f b6 7c 24 01       	movzbl 0x1(%rsp),%edi
   1b834:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
   1b839:	40 88 78 08          	mov    %dil,0x8(%rax)
   1b83d:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1b844:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
   1b84b:	5b                   	pop    %rbx
   1b84c:	41 5c                	pop    %r12
   1b84e:	41 5d                	pop    %r13
   1b850:	41 5e                	pop    %r14
   1b852:	41 5f                	pop    %r15
   1b854:	5d                   	pop    %rbp
   1b855:	c3                   	ret
   1b856:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
   1b85b:	49 8d 04 2f          	lea    (%r15,%rbp,1),%rax
   1b85f:	49 8d 57 ff          	lea    -0x1(%r15),%rdx
   1b863:	48 89 e9             	mov    %rbp,%rcx
   1b866:	48 21 d1             	and    %rdx,%rcx
   1b869:	4d 89 f9             	mov    %r15,%r9
   1b86c:	49 29 c9             	sub    %rcx,%r9
   1b86f:	48 85 ed             	test   %rbp,%rbp
   1b872:	4c 0f 49 c8          	cmovns %rax,%r9
   1b876:	4b 8d 04 38          	lea    (%r8,%r15,1),%rax
   1b87a:	4c 89 c1             	mov    %r8,%rcx
   1b87d:	48 21 d1             	and    %rdx,%rcx
   1b880:	4c 89 fb             	mov    %r15,%rbx
   1b883:	48 29 cb             	sub    %rcx,%rbx
   1b886:	4d 85 c0             	test   %r8,%r8
   1b889:	48 0f 49 d8          	cmovns %rax,%rbx
   1b88d:	40 b7 01             	mov    $0x1,%dil
   1b890:	49 39 d9             	cmp    %rbx,%r9
   1b893:	77 9f                	ja     1b834 <<hyperinterval::float::F64Enclosure>::corner_image+0x174>
   1b895:	4d 89 fe             	mov    %r15,%r14
   1b898:	4d 89 cf             	mov    %r9,%r15
   1b89b:	48 89 6c 24 38       	mov    %rbp,0x38(%rsp)
   1b8a0:	4c 89 44 24 40       	mov    %r8,0x40(%rsp)
   1b8a5:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
   1b8aa:	45 84 e4             	test   %r12b,%r12b
   1b8ad:	0f 84 ca 02 00 00    	je     1bb7d <<hyperinterval::float::F64Enclosure>::corner_image+0x4bd>
   1b8b3:	48 89 e7             	mov    %rsp,%rdi
   1b8b6:	4c 89 f6             	mov    %r14,%rsi
   1b8b9:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1b8c0:	00 f0 7f 
   1b8c3:	4c 89 e2             	mov    %r12,%rdx
   1b8c6:	4c 89 e9             	mov    %r13,%rcx
   1b8c9:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
   1b8ce:	e8 dd ea ff ff       	call   1a3b0 <<hyperinterval::ieee::Format>::div>
   1b8d3:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b8d7:	0f 85 52 ff ff ff    	jne    1b82f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b8dd:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b8e2:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   1b8e7:	48 89 e7             	mov    %rsp,%rdi
   1b8ea:	4c 89 f6             	mov    %r14,%rsi
   1b8ed:	4c 89 e2             	mov    %r12,%rdx
   1b8f0:	e8 3b c9 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1b8f5:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b8f9:	0f 85 30 ff ff ff    	jne    1b82f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b8ff:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1b904:	48 89 e7             	mov    %rsp,%rdi
   1b907:	4c 89 f6             	mov    %r14,%rsi
   1b90a:	4c 89 e2             	mov    %r12,%rdx
   1b90d:	4c 89 e9             	mov    %r13,%rcx
   1b910:	e8 1b c9 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1b915:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b919:	0f 85 10 ff ff ff    	jne    1b82f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b91f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b924:	49 8d 14 2e          	lea    (%r14,%rbp,1),%rdx
   1b928:	48 89 ee             	mov    %rbp,%rsi
   1b92b:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1b930:	4c 21 c6             	and    %r8,%rsi
   1b933:	4c 89 f1             	mov    %r14,%rcx
   1b936:	48 29 f1             	sub    %rsi,%rcx
   1b939:	48 85 ed             	test   %rbp,%rbp
   1b93c:	48 0f 49 ca          	cmovns %rdx,%rcx
   1b940:	4a 8d 34 30          	lea    (%rax,%r14,1),%rsi
   1b944:	48 89 c7             	mov    %rax,%rdi
   1b947:	4c 21 c7             	and    %r8,%rdi
   1b94a:	4c 89 f2             	mov    %r14,%rdx
   1b94d:	48 29 fa             	sub    %rdi,%rdx
   1b950:	48 85 c0             	test   %rax,%rax
   1b953:	48 0f 49 d6          	cmovns %rsi,%rdx
   1b957:	48 39 d1             	cmp    %rdx,%rcx
   1b95a:	0f 87 54 03 00 00    	ja     1bcb4 <<hyperinterval::float::F64Enclosure>::corner_image+0x5f4>
   1b960:	49 39 cf             	cmp    %rcx,%r15
   1b963:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   1b968:	48 0f 47 cd          	cmova  %rbp,%rcx
   1b96c:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
   1b971:	48 39 d3             	cmp    %rdx,%rbx
   1b974:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1b979:	48 0f 42 c8          	cmovb  %rax,%rcx
   1b97d:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
   1b982:	48 89 e7             	mov    %rsp,%rdi
   1b985:	4c 89 f6             	mov    %r14,%rsi
   1b988:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   1b98f:	00 f0 7f 
   1b992:	4c 89 ea             	mov    %r13,%rdx
   1b995:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   1b99a:	4c 8b 44 24 70       	mov    0x70(%rsp),%r8
   1b99f:	e8 0c ea ff ff       	call   1a3b0 <<hyperinterval::ieee::Format>::div>
   1b9a4:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b9a8:	0f 85 81 fe ff ff    	jne    1b82f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b9ae:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b9b3:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1b9b8:	48 89 e7             	mov    %rsp,%rdi
   1b9bb:	4c 89 f6             	mov    %r14,%rsi
   1b9be:	4c 89 ea             	mov    %r13,%rdx
   1b9c1:	e8 6a c8 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1b9c6:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b9ca:	0f 85 5f fe ff ff    	jne    1b82f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b9d0:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
   1b9d5:	48 89 e7             	mov    %rsp,%rdi
   1b9d8:	4c 89 f6             	mov    %r14,%rsi
   1b9db:	4c 89 ea             	mov    %r13,%rdx
   1b9de:	4c 89 e1             	mov    %r12,%rcx
   1b9e1:	e8 4a c8 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1b9e6:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b9ea:	0f 85 3f fe ff ff    	jne    1b82f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b9f0:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1b9f5:	4a 8d 04 33          	lea    (%rbx,%r14,1),%rax
   1b9f9:	48 89 da             	mov    %rbx,%rdx
   1b9fc:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1ba01:	4c 21 c2             	and    %r8,%rdx
   1ba04:	4c 89 f1             	mov    %r14,%rcx
   1ba07:	48 29 d1             	sub    %rdx,%rcx
   1ba0a:	48 85 db             	test   %rbx,%rbx
   1ba0d:	48 0f 49 c8          	cmovns %rax,%rcx
   1ba11:	4b 8d 14 2e          	lea    (%r14,%r13,1),%rdx
   1ba15:	4c 89 ee             	mov    %r13,%rsi
   1ba18:	4c 21 c6             	and    %r8,%rsi
   1ba1b:	4c 89 f0             	mov    %r14,%rax
   1ba1e:	48 29 f0             	sub    %rsi,%rax
   1ba21:	4d 85 ed             	test   %r13,%r13
   1ba24:	48 0f 49 c2          	cmovns %rdx,%rax
   1ba28:	48 39 c1             	cmp    %rax,%rcx
   1ba2b:	0f 87 83 02 00 00    	ja     1bcb4 <<hyperinterval::float::F64Enclosure>::corner_image+0x5f4>
   1ba31:	4c 8b 4c 24 38       	mov    0x38(%rsp),%r9
   1ba36:	4b 8d 14 31          	lea    (%r9,%r14,1),%rdx
   1ba3a:	4c 89 ce             	mov    %r9,%rsi
   1ba3d:	4c 21 c6             	and    %r8,%rsi
   1ba40:	4c 89 f7             	mov    %r14,%rdi
   1ba43:	48 29 f7             	sub    %rsi,%rdi
   1ba46:	4d 85 c9             	test   %r9,%r9
   1ba49:	48 0f 49 fa          	cmovns %rdx,%rdi
   1ba4d:	48 39 cf             	cmp    %rcx,%rdi
   1ba50:	49 0f 46 d9          	cmovbe %r9,%rbx
   1ba54:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
   1ba59:	4a 8d 0c 37          	lea    (%rdi,%r14,1),%rcx
   1ba5d:	48 89 fa             	mov    %rdi,%rdx
   1ba60:	4c 21 c2             	and    %r8,%rdx
   1ba63:	4c 89 f6             	mov    %r14,%rsi
   1ba66:	48 29 d6             	sub    %rdx,%rsi
   1ba69:	48 85 ff             	test   %rdi,%rdi
   1ba6c:	48 0f 49 f1          	cmovns %rcx,%rsi
   1ba70:	48 39 c6             	cmp    %rax,%rsi
   1ba73:	4c 0f 43 ef          	cmovae %rdi,%r13
   1ba77:	48 89 e7             	mov    %rsp,%rdi
   1ba7a:	4c 89 f6             	mov    %r14,%rsi
   1ba7d:	48 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%rbp
   1ba84:	00 f0 7f 
   1ba87:	48 89 ea             	mov    %rbp,%rdx
   1ba8a:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   1ba8f:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
   1ba94:	e8 17 e9 ff ff       	call   1a3b0 <<hyperinterval::ieee::Format>::div>
   1ba99:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ba9d:	0f 85 8c fd ff ff    	jne    1b82f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1baa3:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1baa8:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1baad:	48 89 e7             	mov    %rsp,%rdi
   1bab0:	4c 89 f6             	mov    %r14,%rsi
   1bab3:	48 89 ea             	mov    %rbp,%rdx
   1bab6:	e8 75 c7 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1babb:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1babf:	0f 85 6a fd ff ff    	jne    1b82f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1bac5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1baca:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1bacf:	48 89 e7             	mov    %rsp,%rdi
   1bad2:	4c 89 f6             	mov    %r14,%rsi
   1bad5:	48 89 ea             	mov    %rbp,%rdx
   1bad8:	4c 89 e1             	mov    %r12,%rcx
   1badb:	e8 50 c7 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1bae0:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1bae4:	0f 85 45 fd ff ff    	jne    1b82f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1baea:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1baef:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1baf4:	4a 8d 0c 37          	lea    (%rdi,%r14,1),%rcx
   1baf8:	48 89 fe             	mov    %rdi,%rsi
   1bafb:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1bb00:	4c 21 c6             	and    %r8,%rsi
   1bb03:	4c 89 f2             	mov    %r14,%rdx
   1bb06:	48 29 f2             	sub    %rsi,%rdx
   1bb09:	48 85 ff             	test   %rdi,%rdi
   1bb0c:	48 0f 49 d1          	cmovns %rcx,%rdx
   1bb10:	4a 8d 34 30          	lea    (%rax,%r14,1),%rsi
   1bb14:	48 89 c7             	mov    %rax,%rdi
   1bb17:	4c 21 c7             	and    %r8,%rdi
   1bb1a:	4d 89 f1             	mov    %r14,%r9
   1bb1d:	49 29 fe             	sub    %rdi,%r14
   1bb20:	48 85 c0             	test   %rax,%rax
   1bb23:	4c 0f 49 f6          	cmovns %rsi,%r14
   1bb27:	4c 39 f2             	cmp    %r14,%rdx
   1bb2a:	40 b7 01             	mov    $0x1,%dil
   1bb2d:	0f 87 01 fd ff ff    	ja     1b834 <<hyperinterval::float::F64Enclosure>::corner_image+0x174>
   1bb33:	4a 8d 34 0b          	lea    (%rbx,%r9,1),%rsi
   1bb37:	48 89 df             	mov    %rbx,%rdi
   1bb3a:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
   1bb3f:	4c 21 ff             	and    %r15,%rdi
   1bb42:	4d 89 c8             	mov    %r9,%r8
   1bb45:	49 29 f8             	sub    %rdi,%r8
   1bb48:	48 85 db             	test   %rbx,%rbx
   1bb4b:	4c 0f 49 c6          	cmovns %rsi,%r8
   1bb4f:	49 39 d0             	cmp    %rdx,%r8
   1bb52:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   1bb57:	48 0f 46 d3          	cmovbe %rbx,%rdx
   1bb5b:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1bb60:	4b 8d 14 29          	lea    (%r9,%r13,1),%rdx
   1bb64:	4d 21 ef             	and    %r13,%r15
   1bb67:	4d 29 f9             	sub    %r15,%r9
   1bb6a:	4d 85 ed             	test   %r13,%r13
   1bb6d:	4c 0f 49 ca          	cmovns %rdx,%r9
   1bb71:	4d 39 f1             	cmp    %r14,%r9
   1bb74:	49 0f 43 c5          	cmovae %r13,%rax
   1bb78:	e9 07 04 00 00       	jmp    1bf84 <<hyperinterval::float::F64Enclosure>::corner_image+0x8c4>
   1bb7d:	49 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%r10
   1bb84:	ff 0f 00 
   1bb87:	4c 89 e8             	mov    %r13,%rax
   1bb8a:	48 c1 e8 34          	shr    $0x34,%rax
   1bb8e:	25 ff 07 00 00       	and    $0x7ff,%eax
   1bb93:	4c 89 ea             	mov    %r13,%rdx
   1bb96:	4c 21 d2             	and    %r10,%rdx
   1bb99:	8d 88 cd fb ff ff    	lea    -0x433(%rax),%ecx
   1bb9f:	48 85 c0             	test   %rax,%rax
   1bba2:	4e 8d 44 12 01       	lea    0x1(%rdx,%r10,1),%r8
   1bba7:	b8 ce fb ff ff       	mov    $0xfffffbce,%eax
   1bbac:	0f 44 c8             	cmove  %eax,%ecx
   1bbaf:	4c 0f 44 c2          	cmove  %rdx,%r8
   1bbb3:	4c 8b 4c 24 28       	mov    0x28(%rsp),%r9
   1bbb8:	4c 89 ca             	mov    %r9,%rdx
   1bbbb:	48 c1 ea 34          	shr    $0x34,%rdx
   1bbbf:	81 e2 ff 07 00 00    	and    $0x7ff,%edx
   1bbc5:	4c 89 cf             	mov    %r9,%rdi
   1bbc8:	4c 21 d7             	and    %r10,%rdi
   1bbcb:	8d aa cd fb ff ff    	lea    -0x433(%rdx),%ebp
   1bbd1:	48 85 d2             	test   %rdx,%rdx
   1bbd4:	4e 8d 64 17 01       	lea    0x1(%rdi,%r10,1),%r12
   1bbd9:	0f 44 e8             	cmove  %eax,%ebp
   1bbdc:	4c 0f 44 e7          	cmove  %rdi,%r12
   1bbe0:	4d 31 cd             	xor    %r9,%r13
   1bbe3:	4c 89 e0             	mov    %r12,%rax
   1bbe6:	49 f7 e0             	mul    %r8
   1bbe9:	01 e9                	add    %ebp,%ecx
   1bbeb:	49 c1 ed 3f          	shr    $0x3f,%r13
   1bbef:	44 88 6c 24 14       	mov    %r13b,0x14(%rsp)
   1bbf4:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1bbf9:	48 89 04 24          	mov    %rax,(%rsp)
   1bbfd:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1bc01:	48 8d 7c 24 48       	lea    0x48(%rsp),%rdi
   1bc06:	48 89 e1             	mov    %rsp,%rcx
   1bc09:	4c 89 f6             	mov    %r14,%rsi
   1bc0c:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   1bc13:	00 f0 7f 
   1bc16:	4c 89 ea             	mov    %r13,%rdx
   1bc19:	e8 f2 f3 ff ff       	call   1b010 <<hyperinterval::ieee::Format>::rounded>
   1bc1e:	80 7c 24 48 00       	cmpb   $0x0,0x48(%rsp)
   1bc23:	0f 85 c0 fb ff ff    	jne    1b7e9 <<hyperinterval::float::F64Enclosure>::corner_image+0x129>
   1bc29:	4c 89 a4 24 80 00 00 	mov    %r12,0x80(%rsp)
   1bc30:	00 
   1bc31:	89 6c 24 6c          	mov    %ebp,0x6c(%rsp)
   1bc35:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
   1bc3a:	4c 8b 64 24 58       	mov    0x58(%rsp),%r12
   1bc3f:	48 89 e7             	mov    %rsp,%rdi
   1bc42:	4c 89 f6             	mov    %r14,%rsi
   1bc45:	4c 89 ea             	mov    %r13,%rdx
   1bc48:	e8 e3 c5 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1bc4d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bc51:	0f 84 d8 fb ff ff    	je     1b82f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1bc57:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1bc5c:	48 89 e7             	mov    %rsp,%rdi
   1bc5f:	4c 89 f6             	mov    %r14,%rsi
   1bc62:	4c 89 ea             	mov    %r13,%rdx
   1bc65:	4c 89 e1             	mov    %r12,%rcx
   1bc68:	e8 c3 c5 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1bc6d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bc71:	0f 84 b8 fb ff ff    	je     1b82f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1bc77:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1bc7c:	49 8d 14 2e          	lea    (%r14,%rbp,1),%rdx
   1bc80:	48 89 ee             	mov    %rbp,%rsi
   1bc83:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1bc88:	4c 21 c6             	and    %r8,%rsi
   1bc8b:	4c 89 f1             	mov    %r14,%rcx
   1bc8e:	48 29 f1             	sub    %rsi,%rcx
   1bc91:	48 85 ed             	test   %rbp,%rbp
   1bc94:	48 0f 49 ca          	cmovns %rdx,%rcx
   1bc98:	4a 8d 34 30          	lea    (%rax,%r14,1),%rsi
   1bc9c:	48 89 c7             	mov    %rax,%rdi
   1bc9f:	4c 21 c7             	and    %r8,%rdi
   1bca2:	4c 89 f2             	mov    %r14,%rdx
   1bca5:	48 29 fa             	sub    %rdi,%rdx
   1bca8:	48 85 c0             	test   %rax,%rax
   1bcab:	48 0f 49 d6          	cmovns %rsi,%rdx
   1bcaf:	48 39 d1             	cmp    %rdx,%rcx
   1bcb2:	76 08                	jbe    1bcbc <<hyperinterval::float::F64Enclosure>::corner_image+0x5fc>
   1bcb4:	40 b7 01             	mov    $0x1,%dil
   1bcb7:	e9 78 fb ff ff       	jmp    1b834 <<hyperinterval::float::F64Enclosure>::corner_image+0x174>
   1bcbc:	49 39 cf             	cmp    %rcx,%r15
   1bcbf:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   1bcc4:	48 0f 47 cd          	cmova  %rbp,%rcx
   1bcc8:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
   1bccd:	48 39 d3             	cmp    %rdx,%rbx
   1bcd0:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1bcd5:	48 0f 42 c8          	cmovb  %rax,%rcx
   1bcd9:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
   1bcde:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   1bce3:	4c 89 c0             	mov    %r8,%rax
   1bce6:	48 c1 e8 34          	shr    $0x34,%rax
   1bcea:	25 ff 07 00 00       	and    $0x7ff,%eax
   1bcef:	4c 89 c1             	mov    %r8,%rcx
   1bcf2:	49 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%r10
   1bcf9:	ff 0f 00 
   1bcfc:	4c 21 d1             	and    %r10,%rcx
   1bcff:	8d 98 cd fb ff ff    	lea    -0x433(%rax),%ebx
   1bd05:	48 85 c0             	test   %rax,%rax
   1bd08:	4e 8d 6c 11 01       	lea    0x1(%rcx,%r10,1),%r13
   1bd0d:	ba ce fb ff ff       	mov    $0xfffffbce,%edx
   1bd12:	0f 44 da             	cmove  %edx,%ebx
   1bd15:	4c 0f 44 e9          	cmove  %rcx,%r13
   1bd19:	4c 8b 4c 24 70       	mov    0x70(%rsp),%r9
   1bd1e:	4c 89 c8             	mov    %r9,%rax
   1bd21:	48 c1 e8 34          	shr    $0x34,%rax
   1bd25:	25 ff 07 00 00       	and    $0x7ff,%eax
   1bd2a:	4c 89 c9             	mov    %r9,%rcx
   1bd2d:	4c 21 d1             	and    %r10,%rcx
   1bd30:	8d b8 cd fb ff ff    	lea    -0x433(%rax),%edi
   1bd36:	48 85 c0             	test   %rax,%rax
   1bd39:	4a 8d 44 11 01       	lea    0x1(%rcx,%r10,1),%rax
   1bd3e:	0f 44 fa             	cmove  %edx,%edi
   1bd41:	48 0f 44 c1          	cmove  %rcx,%rax
   1bd45:	4d 31 c1             	xor    %r8,%r9
   1bd48:	49 f7 e5             	mul    %r13
   1bd4b:	01 df                	add    %ebx,%edi
   1bd4d:	49 c1 e9 3f          	shr    $0x3f,%r9
   1bd51:	44 88 4c 24 14       	mov    %r9b,0x14(%rsp)
   1bd56:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1bd5b:	48 89 04 24          	mov    %rax,(%rsp)
   1bd5f:	89 7c 24 10          	mov    %edi,0x10(%rsp)
   1bd63:	48 8d 7c 24 48       	lea    0x48(%rsp),%rdi
   1bd68:	48 89 e1             	mov    %rsp,%rcx
   1bd6b:	4c 89 f6             	mov    %r14,%rsi
   1bd6e:	48 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%rbp
   1bd75:	00 f0 7f 
   1bd78:	48 89 ea             	mov    %rbp,%rdx
   1bd7b:	e8 90 f2 ff ff       	call   1b010 <<hyperinterval::ieee::Format>::rounded>
   1bd80:	80 7c 24 48 00       	cmpb   $0x0,0x48(%rsp)
   1bd85:	0f 85 5e fa ff ff    	jne    1b7e9 <<hyperinterval::float::F64Enclosure>::corner_image+0x129>
   1bd8b:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
   1bd90:	4c 8b 64 24 58       	mov    0x58(%rsp),%r12
   1bd95:	48 89 e7             	mov    %rsp,%rdi
   1bd98:	4c 89 f6             	mov    %r14,%rsi
   1bd9b:	48 89 ea             	mov    %rbp,%rdx
   1bd9e:	e8 8d c4 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1bda3:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1bda7:	0f 85 82 fa ff ff    	jne    1b82f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1bdad:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1bdb2:	48 89 e7             	mov    %rsp,%rdi
   1bdb5:	4c 89 f6             	mov    %r14,%rsi
   1bdb8:	48 89 ea             	mov    %rbp,%rdx
   1bdbb:	4c 89 e1             	mov    %r12,%rcx
   1bdbe:	e8 6d c4 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1bdc3:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1bdc7:	0f 85 62 fa ff ff    	jne    1b82f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1bdcd:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1bdd2:	4b 8d 04 37          	lea    (%r15,%r14,1),%rax
   1bdd6:	4c 89 fa             	mov    %r15,%rdx
   1bdd9:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1bdde:	4c 21 c2             	and    %r8,%rdx
   1bde1:	4c 89 f1             	mov    %r14,%rcx
   1bde4:	48 29 d1             	sub    %rdx,%rcx
   1bde7:	4d 85 ff             	test   %r15,%r15
   1bdea:	48 0f 49 c8          	cmovns %rax,%rcx
   1bdee:	4b 8d 14 34          	lea    (%r12,%r14,1),%rdx
   1bdf2:	4c 89 e6             	mov    %r12,%rsi
   1bdf5:	4c 21 c6             	and    %r8,%rsi
   1bdf8:	4c 89 f0             	mov    %r14,%rax
   1bdfb:	48 29 f0             	sub    %rsi,%rax
   1bdfe:	4d 85 e4             	test   %r12,%r12
   1be01:	48 0f 49 c2          	cmovns %rdx,%rax
   1be05:	48 39 c1             	cmp    %rax,%rcx
   1be08:	0f 87 a6 fe ff ff    	ja     1bcb4 <<hyperinterval::float::F64Enclosure>::corner_image+0x5f4>
   1be0e:	4c 8b 4c 24 38       	mov    0x38(%rsp),%r9
   1be13:	4c 89 ca             	mov    %r9,%rdx
   1be16:	4c 21 c2             	and    %r8,%rdx
   1be19:	4c 89 f7             	mov    %r14,%rdi
   1be1c:	48 29 d7             	sub    %rdx,%rdi
   1be1f:	4b 8d 14 31          	lea    (%r9,%r14,1),%rdx
   1be23:	4d 85 c9             	test   %r9,%r9
   1be26:	48 0f 49 fa          	cmovns %rdx,%rdi
   1be2a:	48 39 cf             	cmp    %rcx,%rdi
   1be2d:	4d 0f 46 f9          	cmovbe %r9,%r15
   1be31:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
   1be36:	48 89 f9             	mov    %rdi,%rcx
   1be39:	4c 21 c1             	and    %r8,%rcx
   1be3c:	4c 89 f2             	mov    %r14,%rdx
   1be3f:	48 29 ca             	sub    %rcx,%rdx
   1be42:	4a 8d 0c 37          	lea    (%rdi,%r14,1),%rcx
   1be46:	48 85 ff             	test   %rdi,%rdi
   1be49:	48 0f 49 d1          	cmovns %rcx,%rdx
   1be4d:	48 39 c2             	cmp    %rax,%rdx
   1be50:	4c 0f 43 e7          	cmovae %rdi,%r12
   1be54:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   1be59:	48 33 44 24 60       	xor    0x60(%rsp),%rax
   1be5e:	8b 4c 24 6c          	mov    0x6c(%rsp),%ecx
   1be62:	01 d9                	add    %ebx,%ecx
   1be64:	48 c1 e8 3f          	shr    $0x3f,%rax
   1be68:	88 44 24 14          	mov    %al,0x14(%rsp)
   1be6c:	48 8b 84 24 80 00 00 	mov    0x80(%rsp),%rax
   1be73:	00 
   1be74:	49 f7 e5             	mul    %r13
   1be77:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1be7c:	48 89 04 24          	mov    %rax,(%rsp)
   1be80:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1be84:	48 8d 7c 24 48       	lea    0x48(%rsp),%rdi
   1be89:	48 89 e1             	mov    %rsp,%rcx
   1be8c:	4c 89 f6             	mov    %r14,%rsi
   1be8f:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   1be96:	00 f0 7f 
   1be99:	4c 89 ea             	mov    %r13,%rdx
   1be9c:	e8 6f f1 ff ff       	call   1b010 <<hyperinterval::ieee::Format>::rounded>
   1bea1:	80 7c 24 48 00       	cmpb   $0x0,0x48(%rsp)
   1bea6:	0f 85 3d f9 ff ff    	jne    1b7e9 <<hyperinterval::float::F64Enclosure>::corner_image+0x129>
   1beac:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
   1beb1:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
   1beb6:	48 89 e7             	mov    %rsp,%rdi
   1beb9:	4c 89 f6             	mov    %r14,%rsi
   1bebc:	4c 89 ea             	mov    %r13,%rdx
   1bebf:	e8 6c c3 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1bec4:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1bec8:	0f 85 61 f9 ff ff    	jne    1b82f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1bece:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1bed3:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1bed8:	48 89 e7             	mov    %rsp,%rdi
   1bedb:	4c 89 f6             	mov    %r14,%rsi
   1bede:	4c 89 ea             	mov    %r13,%rdx
   1bee1:	48 89 d9             	mov    %rbx,%rcx
   1bee4:	e8 47 c3 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1bee9:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1beed:	0f 85 3c f9 ff ff    	jne    1b82f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1bef3:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1bef8:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1befd:	4a 8d 0c 37          	lea    (%rdi,%r14,1),%rcx
   1bf01:	48 89 fe             	mov    %rdi,%rsi
   1bf04:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1bf09:	4c 21 c6             	and    %r8,%rsi
   1bf0c:	4c 89 f2             	mov    %r14,%rdx
   1bf0f:	48 29 f2             	sub    %rsi,%rdx
   1bf12:	48 85 ff             	test   %rdi,%rdi
   1bf15:	48 0f 49 d1          	cmovns %rcx,%rdx
   1bf19:	4a 8d 34 30          	lea    (%rax,%r14,1),%rsi
   1bf1d:	48 89 c7             	mov    %rax,%rdi
   1bf20:	4c 21 c7             	and    %r8,%rdi
   1bf23:	4d 89 f1             	mov    %r14,%r9
   1bf26:	49 29 fe             	sub    %rdi,%r14
   1bf29:	48 85 c0             	test   %rax,%rax
   1bf2c:	4c 0f 49 f6          	cmovns %rsi,%r14
   1bf30:	4c 39 f2             	cmp    %r14,%rdx
   1bf33:	40 b7 01             	mov    $0x1,%dil
   1bf36:	0f 87 f8 f8 ff ff    	ja     1b834 <<hyperinterval::float::F64Enclosure>::corner_image+0x174>
   1bf3c:	4d 89 fa             	mov    %r15,%r10
   1bf3f:	4b 8d 34 0f          	lea    (%r15,%r9,1),%rsi
   1bf43:	4c 89 ff             	mov    %r15,%rdi
   1bf46:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
   1bf4b:	4c 21 ff             	and    %r15,%rdi
   1bf4e:	4d 89 c8             	mov    %r9,%r8
   1bf51:	49 29 f8             	sub    %rdi,%r8
   1bf54:	4d 85 d2             	test   %r10,%r10
   1bf57:	4c 0f 49 c6          	cmovns %rsi,%r8
   1bf5b:	49 39 d0             	cmp    %rdx,%r8
   1bf5e:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   1bf63:	49 0f 46 d2          	cmovbe %r10,%rdx
   1bf67:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1bf6c:	4b 8d 14 0c          	lea    (%r12,%r9,1),%rdx
   1bf70:	4d 21 e7             	and    %r12,%r15
   1bf73:	4d 29 f9             	sub    %r15,%r9
   1bf76:	4d 85 e4             	test   %r12,%r12
   1bf79:	4c 0f 49 ca          	cmovns %rdx,%r9
   1bf7d:	4d 39 f1             	cmp    %r14,%r9
   1bf80:	49 0f 43 c4          	cmovae %r12,%rax
   1bf84:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
   1bf89:	48 c7 01 01 00 00 00 	movq   $0x1,(%rcx)
   1bf90:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   1bf95:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   1bf99:	48 89 41 10          	mov    %rax,0x10(%rcx)
   1bf9d:	e9 a2 f8 ff ff       	jmp    1b844 <<hyperinterval::float::F64Enclosure>::corner_image+0x184>
   1bfa2:	cc                   	int3
   1bfa3:	cc                   	int3
   1bfa4:	cc                   	int3
   1bfa5:	cc                   	int3
   1bfa6:	cc                   	int3
   1bfa7:	cc                   	int3
   1bfa8:	cc                   	int3
   1bfa9:	cc                   	int3
   1bfaa:	cc                   	int3
   1bfab:	cc                   	int3
   1bfac:	cc                   	int3
   1bfad:	cc                   	int3
   1bfae:	cc                   	int3
   1bfaf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::intersection:
   1bfb0:	48 89 f8             	mov    %rdi,%rax
   1bfb3:	45 31 c0             	xor    %r8d,%r8d
   1bfb6:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1bfba:	0f 85 d5 00 00 00    	jne    1c095 <<hyperinterval::float::F64Enclosure>::intersection+0xe5>
   1bfc0:	f6 02 01             	testb  $0x1,(%rdx)
   1bfc3:	0f 84 c0 00 00 00    	je     1c089 <<hyperinterval::float::F64Enclosure>::intersection+0xd9>
   1bfc9:	41 56                	push   %r14
   1bfcb:	53                   	push   %rbx
   1bfcc:	4c 8b 52 08          	mov    0x8(%rdx),%r10
   1bfd0:	4c 8b 4a 10          	mov    0x10(%rdx),%r9
   1bfd4:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1bfd8:	48 ba 00 00 00 00 00 	movabs $0x8000000000000000,%rdx
   1bfdf:	00 00 80 
   1bfe2:	48 8d 3c 11          	lea    (%rcx,%rdx,1),%rdi
   1bfe6:	4c 8d 42 ff          	lea    -0x1(%rdx),%r8
   1bfea:	49 89 cb             	mov    %rcx,%r11
   1bfed:	4d 21 c3             	and    %r8,%r11
   1bff0:	48 89 d3             	mov    %rdx,%rbx
   1bff3:	4c 29 db             	sub    %r11,%rbx
   1bff6:	48 85 c9             	test   %rcx,%rcx
   1bff9:	48 0f 49 df          	cmovns %rdi,%rbx
   1bffd:	49 8d 3c 12          	lea    (%r10,%rdx,1),%rdi
   1c001:	4d 89 d3             	mov    %r10,%r11
   1c004:	4d 21 c3             	and    %r8,%r11
   1c007:	49 89 d6             	mov    %rdx,%r14
   1c00a:	4d 29 de             	sub    %r11,%r14
   1c00d:	4d 85 d2             	test   %r10,%r10
   1c010:	4c 0f 49 f7          	cmovns %rdi,%r14
   1c014:	48 8b 7e 10          	mov    0x10(%rsi),%rdi
   1c018:	4c 39 f3             	cmp    %r14,%rbx
   1c01b:	49 0f 42 ca          	cmovb  %r10,%rcx
   1c01f:	48 8d 34 17          	lea    (%rdi,%rdx,1),%rsi
   1c023:	49 89 fa             	mov    %rdi,%r10
   1c026:	4d 21 c2             	and    %r8,%r10
   1c029:	49 89 d3             	mov    %rdx,%r11
   1c02c:	4d 29 d3             	sub    %r10,%r11
   1c02f:	48 85 ff             	test   %rdi,%rdi
   1c032:	4c 0f 49 de          	cmovns %rsi,%r11
   1c036:	49 8d 34 11          	lea    (%r9,%rdx,1),%rsi
   1c03a:	4d 89 ca             	mov    %r9,%r10
   1c03d:	4d 21 c2             	and    %r8,%r10
   1c040:	48 89 d3             	mov    %rdx,%rbx
   1c043:	4c 29 d3             	sub    %r10,%rbx
   1c046:	4d 85 c9             	test   %r9,%r9
   1c049:	48 0f 49 de          	cmovns %rsi,%rbx
   1c04d:	49 39 db             	cmp    %rbx,%r11
   1c050:	49 0f 47 f9          	cmova  %r9,%rdi
   1c054:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
   1c058:	49 89 c9             	mov    %rcx,%r9
   1c05b:	4d 21 c1             	and    %r8,%r9
   1c05e:	49 89 d2             	mov    %rdx,%r10
   1c061:	4d 29 ca             	sub    %r9,%r10
   1c064:	48 85 c9             	test   %rcx,%rcx
   1c067:	4c 0f 49 d6          	cmovns %rsi,%r10
   1c06b:	48 8d 34 17          	lea    (%rdi,%rdx,1),%rsi
   1c06f:	49 21 f8             	and    %rdi,%r8
   1c072:	4c 29 c2             	sub    %r8,%rdx
   1c075:	48 85 ff             	test   %rdi,%rdi
   1c078:	48 0f 49 d6          	cmovns %rsi,%rdx
   1c07c:	45 31 c0             	xor    %r8d,%r8d
   1c07f:	49 39 d2             	cmp    %rdx,%r10
   1c082:	41 0f 96 c0          	setbe  %r8b
   1c086:	5b                   	pop    %rbx
   1c087:	41 5e                	pop    %r14
   1c089:	4c 89 00             	mov    %r8,(%rax)
   1c08c:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1c090:	48 89 78 10          	mov    %rdi,0x10(%rax)
   1c094:	c3                   	ret
   1c095:	4c 89 00             	mov    %r8,(%rax)
   1c098:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1c09c:	48 89 78 10          	mov    %rdi,0x10(%rax)
   1c0a0:	c3                   	ret
   1c0a1:	cc                   	int3
   1c0a2:	cc                   	int3
   1c0a3:	cc                   	int3
   1c0a4:	cc                   	int3
   1c0a5:	cc                   	int3
   1c0a6:	cc                   	int3
   1c0a7:	cc                   	int3
   1c0a8:	cc                   	int3
   1c0a9:	cc                   	int3
   1c0aa:	cc                   	int3
   1c0ab:	cc                   	int3
   1c0ac:	cc                   	int3
   1c0ad:	cc                   	int3
   1c0ae:	cc                   	int3
   1c0af:	cc                   	int3

<hyperinterval::float::F64Enclosure>::contains_point:
   1c0b0:	41 56                	push   %r14
   1c0b2:	53                   	push   %rbx
   1c0b3:	48 83 ec 18          	sub    $0x18,%rsp
   1c0b7:	49 89 fe             	mov    %rdi,%r14
   1c0ba:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1c0c1:	00 00 80 
   1c0c4:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1c0c9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1c0ce:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1c0d5:	00 f0 7f 
   1c0d8:	48 89 de             	mov    %rbx,%rsi
   1c0db:	e8 50 c1 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1c0e0:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1c0e5:	3c 01                	cmp    $0x1,%al
   1c0e7:	75 0d                	jne    1c0f6 <<hyperinterval::float::F64Enclosure>::contains_point+0x46>
   1c0e9:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   1c0ee:	48 83 c4 18          	add    $0x18,%rsp
   1c0f2:	5b                   	pop    %rbx
   1c0f3:	41 5e                	pop    %r14
   1c0f5:	c3                   	ret
   1c0f6:	49 83 3e 01          	cmpq   $0x1,(%r14)
   1c0fa:	75 40                	jne    1c13c <<hyperinterval::float::F64Enclosure>::contains_point+0x8c>
   1c0fc:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1c101:	49 8b 56 08          	mov    0x8(%r14),%rdx
   1c105:	48 8d 3c 1a          	lea    (%rdx,%rbx,1),%rdi
   1c109:	48 8d 4b ff          	lea    -0x1(%rbx),%rcx
   1c10d:	49 89 d0             	mov    %rdx,%r8
   1c110:	49 21 c8             	and    %rcx,%r8
   1c113:	49 89 d9             	mov    %rbx,%r9
   1c116:	4d 29 c1             	sub    %r8,%r9
   1c119:	48 85 d2             	test   %rdx,%rdx
   1c11c:	4c 0f 49 cf          	cmovns %rdi,%r9
   1c120:	48 8d 3c 1e          	lea    (%rsi,%rbx,1),%rdi
   1c124:	49 89 f0             	mov    %rsi,%r8
   1c127:	49 21 c8             	and    %rcx,%r8
   1c12a:	48 89 da             	mov    %rbx,%rdx
   1c12d:	4c 29 c2             	sub    %r8,%rdx
   1c130:	48 85 f6             	test   %rsi,%rsi
   1c133:	48 0f 49 d7          	cmovns %rdi,%rdx
   1c137:	49 39 d1             	cmp    %rdx,%r9
   1c13a:	76 0a                	jbe    1c146 <<hyperinterval::float::F64Enclosure>::contains_point+0x96>
   1c13c:	31 d2                	xor    %edx,%edx
   1c13e:	48 83 c4 18          	add    $0x18,%rsp
   1c142:	5b                   	pop    %rbx
   1c143:	41 5e                	pop    %r14
   1c145:	c3                   	ret
   1c146:	49 8b 76 10          	mov    0x10(%r14),%rsi
   1c14a:	48 8d 3c 1e          	lea    (%rsi,%rbx,1),%rdi
   1c14e:	48 21 f1             	and    %rsi,%rcx
   1c151:	48 29 cb             	sub    %rcx,%rbx
   1c154:	48 85 f6             	test   %rsi,%rsi
   1c157:	48 0f 49 df          	cmovns %rdi,%rbx
   1c15b:	48 39 da             	cmp    %rbx,%rdx
   1c15e:	0f 96 c2             	setbe  %dl
   1c161:	48 83 c4 18          	add    $0x18,%rsp
   1c165:	5b                   	pop    %rbx
   1c166:	41 5e                	pop    %r14
   1c168:	c3                   	ret
   1c169:	cc                   	int3
   1c16a:	cc                   	int3
   1c16b:	cc                   	int3
   1c16c:	cc                   	int3
   1c16d:	cc                   	int3
   1c16e:	cc                   	int3
   1c16f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::interior_subset_of:
   1c170:	b0 01                	mov    $0x1,%al
   1c172:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1c176:	0f 85 8b 00 00 00    	jne    1c207 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x97>
   1c17c:	f6 06 01             	testb  $0x1,(%rsi)
   1c17f:	0f 84 80 00 00 00    	je     1c205 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x95>
   1c185:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1c189:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1c18d:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1c194:	00 00 80 
   1c197:	4d 8d 0c 00          	lea    (%r8,%rax,1),%r9
   1c19b:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1c19f:	4d 89 c2             	mov    %r8,%r10
   1c1a2:	49 21 ca             	and    %rcx,%r10
   1c1a5:	49 89 c3             	mov    %rax,%r11
   1c1a8:	4d 29 d3             	sub    %r10,%r11
   1c1ab:	4d 85 c0             	test   %r8,%r8
   1c1ae:	4d 0f 49 d9          	cmovns %r9,%r11
   1c1b2:	4c 8d 04 02          	lea    (%rdx,%rax,1),%r8
   1c1b6:	49 89 d1             	mov    %rdx,%r9
   1c1b9:	49 21 c9             	and    %rcx,%r9
   1c1bc:	49 89 c2             	mov    %rax,%r10
   1c1bf:	4d 29 ca             	sub    %r9,%r10
   1c1c2:	48 85 d2             	test   %rdx,%rdx
   1c1c5:	4d 0f 49 d0          	cmovns %r8,%r10
   1c1c9:	4d 39 d3             	cmp    %r10,%r11
   1c1cc:	73 37                	jae    1c205 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x95>
   1c1ce:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1c1d2:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1c1d6:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1c1da:	49 89 d0             	mov    %rdx,%r8
   1c1dd:	49 21 c8             	and    %rcx,%r8
   1c1e0:	49 89 c1             	mov    %rax,%r9
   1c1e3:	4d 29 c1             	sub    %r8,%r9
   1c1e6:	48 85 d2             	test   %rdx,%rdx
   1c1e9:	4c 0f 49 cf          	cmovns %rdi,%r9
   1c1ed:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1c1f1:	48 21 f1             	and    %rsi,%rcx
   1c1f4:	48 29 c8             	sub    %rcx,%rax
   1c1f7:	48 85 f6             	test   %rsi,%rsi
   1c1fa:	48 0f 49 c2          	cmovns %rdx,%rax
   1c1fe:	49 39 c1             	cmp    %rax,%r9
   1c201:	0f 92 c0             	setb   %al
   1c204:	c3                   	ret
   1c205:	31 c0                	xor    %eax,%eax
   1c207:	c3                   	ret
   1c208:	cc                   	int3
   1c209:	cc                   	int3
   1c20a:	cc                   	int3
   1c20b:	cc                   	int3
   1c20c:	cc                   	int3
   1c20d:	cc                   	int3
   1c20e:	cc                   	int3
   1c20f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::add:
   1c210:	48 89 f8             	mov    %rdi,%rax
   1c213:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1c217:	0f 85 cb 00 00 00    	jne    1c2e8 <<hyperinterval::float::F64Enclosure>::add+0xd8>
   1c21d:	f6 02 01             	testb  $0x1,(%rdx)
   1c220:	0f 84 c2 00 00 00    	je     1c2e8 <<hyperinterval::float::F64Enclosure>::add+0xd8>
   1c226:	55                   	push   %rbp
   1c227:	41 57                	push   %r15
   1c229:	41 56                	push   %r14
   1c22b:	41 55                	push   %r13
   1c22d:	41 54                	push   %r12
   1c22f:	53                   	push   %rbx
   1c230:	48 83 ec 18          	sub    $0x18,%rsp
   1c234:	48 89 c5             	mov    %rax,%rbp
   1c237:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1c23b:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1c23f:	4c 8b 62 10          	mov    0x10(%rdx),%r12
   1c243:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1c24a:	00 00 80 
   1c24d:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1c254:	00 f0 7f 
   1c257:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   1c25b:	48 89 e7             	mov    %rsp,%rdi
   1c25e:	48 89 de             	mov    %rbx,%rsi
   1c261:	4c 89 f2             	mov    %r14,%rdx
   1c264:	e8 b7 de ff ff       	call   1a120 <<hyperinterval::ieee::Format>::add>
   1c269:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c26d:	74 57                	je     1c2c6 <<hyperinterval::float::F64Enclosure>::add+0xb6>
   1c26f:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1c274:	48 89 e7             	mov    %rsp,%rdi
   1c277:	48 89 de             	mov    %rbx,%rsi
   1c27a:	4c 89 f2             	mov    %r14,%rdx
   1c27d:	4c 89 f9             	mov    %r15,%rcx
   1c280:	4d 89 e0             	mov    %r12,%r8
   1c283:	e8 98 de ff ff       	call   1a120 <<hyperinterval::ieee::Format>::add>
   1c288:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c28c:	74 38                	je     1c2c6 <<hyperinterval::float::F64Enclosure>::add+0xb6>
   1c28e:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1c293:	48 89 e7             	mov    %rsp,%rdi
   1c296:	48 89 de             	mov    %rbx,%rsi
   1c299:	4c 89 f2             	mov    %r14,%rdx
   1c29c:	4c 89 e9             	mov    %r13,%rcx
   1c29f:	e8 8c bf ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1c2a4:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c2a8:	74 1c                	je     1c2c6 <<hyperinterval::float::F64Enclosure>::add+0xb6>
   1c2aa:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1c2af:	48 89 e7             	mov    %rsp,%rdi
   1c2b2:	48 89 de             	mov    %rbx,%rsi
   1c2b5:	4c 89 f2             	mov    %r14,%rdx
   1c2b8:	4c 89 f9             	mov    %r15,%rcx
   1c2bb:	e8 70 bf ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1c2c0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c2c4:	75 2a                	jne    1c2f0 <<hyperinterval::float::F64Enclosure>::add+0xe0>
   1c2c6:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   1c2cb:	48 89 e8             	mov    %rbp,%rax
   1c2ce:	88 4d 08             	mov    %cl,0x8(%rbp)
   1c2d1:	48 c7 45 00 02 00 00 	movq   $0x2,0x0(%rbp)
   1c2d8:	00 
   1c2d9:	48 83 c4 18          	add    $0x18,%rsp
   1c2dd:	5b                   	pop    %rbx
   1c2de:	41 5c                	pop    %r12
   1c2e0:	41 5d                	pop    %r13
   1c2e2:	41 5e                	pop    %r14
   1c2e4:	41 5f                	pop    %r15
   1c2e6:	5d                   	pop    %rbp
   1c2e7:	c3                   	ret
   1c2e8:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   1c2ef:	c3                   	ret
   1c2f0:	49 8d 04 1c          	lea    (%r12,%rbx,1),%rax
   1c2f4:	48 8d 53 ff          	lea    -0x1(%rbx),%rdx
   1c2f8:	4c 89 e1             	mov    %r12,%rcx
   1c2fb:	48 21 d1             	and    %rdx,%rcx
   1c2fe:	48 89 de             	mov    %rbx,%rsi
   1c301:	48 29 ce             	sub    %rcx,%rsi
   1c304:	4d 85 e4             	test   %r12,%r12
   1c307:	48 0f 49 f0          	cmovns %rax,%rsi
   1c30b:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1c310:	48 8d 04 19          	lea    (%rcx,%rbx,1),%rax
   1c314:	48 21 ca             	and    %rcx,%rdx
   1c317:	48 29 d3             	sub    %rdx,%rbx
   1c31a:	48 85 c9             	test   %rcx,%rcx
   1c31d:	48 0f 49 d8          	cmovns %rax,%rbx
   1c321:	48 39 de             	cmp    %rbx,%rsi
   1c324:	48 89 e8             	mov    %rbp,%rax
   1c327:	76 0d                	jbe    1c336 <<hyperinterval::float::F64Enclosure>::add+0x126>
   1c329:	c6 40 08 01          	movb   $0x1,0x8(%rax)
   1c32d:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1c334:	eb a3                	jmp    1c2d9 <<hyperinterval::float::F64Enclosure>::add+0xc9>
   1c336:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   1c33d:	4c 89 60 08          	mov    %r12,0x8(%rax)
   1c341:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1c345:	eb 92                	jmp    1c2d9 <<hyperinterval::float::F64Enclosure>::add+0xc9>
   1c347:	cc                   	int3
   1c348:	cc                   	int3
   1c349:	cc                   	int3
   1c34a:	cc                   	int3
   1c34b:	cc                   	int3
   1c34c:	cc                   	int3
   1c34d:	cc                   	int3
   1c34e:	cc                   	int3
   1c34f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::div:
   1c350:	53                   	push   %rbx
   1c351:	48 89 fb             	mov    %rdi,%rbx
   1c354:	83 3a 01             	cmpl   $0x1,(%rdx)
   1c357:	75 1e                	jne    1c377 <<hyperinterval::float::F64Enclosure>::div+0x27>
   1c359:	48 83 7a 08 00       	cmpq   $0x0,0x8(%rdx)
   1c35e:	7f 17                	jg     1c377 <<hyperinterval::float::F64Enclosure>::div+0x27>
   1c360:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1c364:	48 85 c0             	test   %rax,%rax
   1c367:	0f 99 c1             	setns  %cl
   1c36a:	48 d1 e0             	shl    $1,%rax
   1c36d:	48 85 c0             	test   %rax,%rax
   1c370:	0f 94 c0             	sete   %al
   1c373:	08 c8                	or     %cl,%al
   1c375:	75 12                	jne    1c389 <<hyperinterval::float::F64Enclosure>::div+0x39>
   1c377:	48 89 df             	mov    %rbx,%rdi
   1c37a:	b9 01 00 00 00       	mov    $0x1,%ecx
   1c37f:	e8 3c f3 ff ff       	call   1b6c0 <<hyperinterval::float::F64Enclosure>::corner_image>
   1c384:	48 89 d8             	mov    %rbx,%rax
   1c387:	5b                   	pop    %rbx
   1c388:	c3                   	ret
   1c389:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
   1c38d:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c394:	48 89 d8             	mov    %rbx,%rax
   1c397:	5b                   	pop    %rbx
   1c398:	c3                   	ret
   1c399:	cc                   	int3
   1c39a:	cc                   	int3
   1c39b:	cc                   	int3
   1c39c:	cc                   	int3
   1c39d:	cc                   	int3
   1c39e:	cc                   	int3
   1c39f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::new:
   1c3a0:	41 57                	push   %r15
   1c3a2:	41 56                	push   %r14
   1c3a4:	41 54                	push   %r12
   1c3a6:	53                   	push   %rbx
   1c3a7:	48 83 ec 18          	sub    $0x18,%rsp
   1c3ab:	f2 0f 11 4c 24 10    	movsd  %xmm1,0x10(%rsp)
   1c3b1:	48 89 fb             	mov    %rdi,%rbx
   1c3b4:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1c3bb:	00 00 80 
   1c3be:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1c3c5:	00 f0 7f 
   1c3c8:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1c3cd:	48 89 e7             	mov    %rsp,%rdi
   1c3d0:	4c 89 f6             	mov    %r14,%rsi
   1c3d3:	4c 89 fa             	mov    %r15,%rdx
   1c3d6:	e8 55 be ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1c3db:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c3df:	74 24                	je     1c405 <<hyperinterval::float::F64Enclosure>::new+0x65>
   1c3e1:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1c3e6:	f3 0f 7e 44 24 10    	movq   0x10(%rsp),%xmm0
   1c3ec:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1c3f1:	48 89 e7             	mov    %rsp,%rdi
   1c3f4:	4c 89 f6             	mov    %r14,%rsi
   1c3f7:	4c 89 fa             	mov    %r15,%rdx
   1c3fa:	e8 31 be ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1c3ff:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c403:	75 1e                	jne    1c423 <<hyperinterval::float::F64Enclosure>::new+0x83>
   1c405:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1c40a:	88 43 08             	mov    %al,0x8(%rbx)
   1c40d:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c414:	48 89 d8             	mov    %rbx,%rax
   1c417:	48 83 c4 18          	add    $0x18,%rsp
   1c41b:	5b                   	pop    %rbx
   1c41c:	41 5c                	pop    %r12
   1c41e:	41 5e                	pop    %r14
   1c420:	41 5f                	pop    %r15
   1c422:	c3                   	ret
   1c423:	4b 8d 04 34          	lea    (%r12,%r14,1),%rax
   1c427:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1c42b:	4c 89 e2             	mov    %r12,%rdx
   1c42e:	48 21 ca             	and    %rcx,%rdx
   1c431:	4c 89 f6             	mov    %r14,%rsi
   1c434:	48 29 d6             	sub    %rdx,%rsi
   1c437:	4d 85 e4             	test   %r12,%r12
   1c43a:	48 0f 49 f0          	cmovns %rax,%rsi
   1c43e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c443:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1c447:	48 21 c1             	and    %rax,%rcx
   1c44a:	49 29 ce             	sub    %rcx,%r14
   1c44d:	48 85 c0             	test   %rax,%rax
   1c450:	4c 0f 49 f2          	cmovns %rdx,%r14
   1c454:	4c 39 f6             	cmp    %r14,%rsi
   1c457:	76 06                	jbe    1c45f <<hyperinterval::float::F64Enclosure>::new+0xbf>
   1c459:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1c45d:	eb ae                	jmp    1c40d <<hyperinterval::float::F64Enclosure>::new+0x6d>
   1c45f:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1c466:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   1c46a:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1c46e:	eb a4                	jmp    1c414 <<hyperinterval::float::F64Enclosure>::new+0x74>

<hyperinterval::float::F64Enclosure>::sub:
   1c470:	53                   	push   %rbx
   1c471:	48 83 ec 20          	sub    $0x20,%rsp
   1c475:	48 89 fb             	mov    %rdi,%rbx
   1c478:	48 83 3a 01          	cmpq   $0x1,(%rdx)
   1c47c:	75 30                	jne    1c4ae <<hyperinterval::float::F64Enclosure>::sub+0x3e>
   1c47e:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   1c482:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1c486:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1c48d:	00 00 80 
   1c490:	48 89 d1             	mov    %rdx,%rcx
   1c493:	48 31 c1             	xor    %rax,%rcx
   1c496:	48 85 d2             	test   %rdx,%rdx
   1c499:	48 0f 44 ca          	cmove  %rdx,%rcx
   1c49d:	48 31 f8             	xor    %rdi,%rax
   1c4a0:	48 85 ff             	test   %rdi,%rdi
   1c4a3:	48 0f 44 c7          	cmove  %rdi,%rax
   1c4a7:	ba 01 00 00 00       	mov    $0x1,%edx
   1c4ac:	eb 02                	jmp    1c4b0 <<hyperinterval::float::F64Enclosure>::sub+0x40>
   1c4ae:	31 d2                	xor    %edx,%edx
   1c4b0:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1c4b5:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
   1c4ba:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1c4bf:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
   1c4c4:	48 89 df             	mov    %rbx,%rdi
   1c4c7:	ff 15 6b 01 04 00    	call   *0x4016b(%rip)        # 5c638 <_DYNAMIC+0x300>
   1c4cd:	48 89 d8             	mov    %rbx,%rax
   1c4d0:	48 83 c4 20          	add    $0x20,%rsp
   1c4d4:	5b                   	pop    %rbx
   1c4d5:	c3                   	ret
   1c4d6:	cc                   	int3
   1c4d7:	cc                   	int3
   1c4d8:	cc                   	int3
   1c4d9:	cc                   	int3
   1c4da:	cc                   	int3
   1c4db:	cc                   	int3
   1c4dc:	cc                   	int3
   1c4dd:	cc                   	int3
   1c4de:	cc                   	int3
   1c4df:	cc                   	int3

<hyperinterval::float::F64Enclosure>::hull:
   1c4e0:	48 89 f8             	mov    %rdi,%rax
   1c4e3:	4c 8b 02             	mov    (%rdx),%r8
   1c4e6:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   1c4ea:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
   1c4ee:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1c4f2:	0f 85 9f 00 00 00    	jne    1c597 <<hyperinterval::float::F64Enclosure>::hull+0xb7>
   1c4f8:	4c 8b 56 08          	mov    0x8(%rsi),%r10
   1c4fc:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1c500:	ba 01 00 00 00       	mov    $0x1,%edx
   1c505:	49 83 f8 01          	cmp    $0x1,%r8
   1c509:	0f 85 97 00 00 00    	jne    1c5a6 <<hyperinterval::float::F64Enclosure>::hull+0xc6>
   1c50f:	41 57                	push   %r15
   1c511:	41 56                	push   %r14
   1c513:	53                   	push   %rbx
   1c514:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1c51b:	00 00 80 
   1c51e:	4f 8d 1c 02          	lea    (%r10,%r8,1),%r11
   1c522:	4d 8d 48 ff          	lea    -0x1(%r8),%r9
   1c526:	4c 89 d3             	mov    %r10,%rbx
   1c529:	4c 21 cb             	and    %r9,%rbx
   1c52c:	4d 89 c6             	mov    %r8,%r14
   1c52f:	49 29 de             	sub    %rbx,%r14
   1c532:	4d 85 d2             	test   %r10,%r10
   1c535:	4d 0f 49 f3          	cmovns %r11,%r14
   1c539:	4e 8d 1c 07          	lea    (%rdi,%r8,1),%r11
   1c53d:	48 89 fb             	mov    %rdi,%rbx
   1c540:	4c 21 cb             	and    %r9,%rbx
   1c543:	4d 89 c7             	mov    %r8,%r15
   1c546:	49 29 df             	sub    %rbx,%r15
   1c549:	48 85 ff             	test   %rdi,%rdi
   1c54c:	4d 0f 49 fb          	cmovns %r11,%r15
   1c550:	4d 39 fe             	cmp    %r15,%r14
   1c553:	49 0f 46 fa          	cmovbe %r10,%rdi
   1c557:	4e 8d 14 06          	lea    (%rsi,%r8,1),%r10
   1c55b:	49 89 f3             	mov    %rsi,%r11
   1c55e:	4d 21 cb             	and    %r9,%r11
   1c561:	4c 89 c3             	mov    %r8,%rbx
   1c564:	4c 29 db             	sub    %r11,%rbx
   1c567:	48 85 f6             	test   %rsi,%rsi
   1c56a:	49 0f 49 da          	cmovns %r10,%rbx
   1c56e:	4e 8d 14 01          	lea    (%rcx,%r8,1),%r10
   1c572:	49 21 c9             	and    %rcx,%r9
   1c575:	4d 29 c8             	sub    %r9,%r8
   1c578:	48 85 c9             	test   %rcx,%rcx
   1c57b:	4d 0f 49 c2          	cmovns %r10,%r8
   1c57f:	4c 39 c3             	cmp    %r8,%rbx
   1c582:	48 0f 43 ce          	cmovae %rsi,%rcx
   1c586:	5b                   	pop    %rbx
   1c587:	41 5e                	pop    %r14
   1c589:	41 5f                	pop    %r15
   1c58b:	48 89 10             	mov    %rdx,(%rax)
   1c58e:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1c592:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1c596:	c3                   	ret
   1c597:	4c 89 c2             	mov    %r8,%rdx
   1c59a:	48 89 10             	mov    %rdx,(%rax)
   1c59d:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1c5a1:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1c5a5:	c3                   	ret
   1c5a6:	48 89 f1             	mov    %rsi,%rcx
   1c5a9:	4c 89 d7             	mov    %r10,%rdi
   1c5ac:	48 89 10             	mov    %rdx,(%rax)
   1c5af:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1c5b3:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1c5b7:	c3                   	ret
   1c5b8:	cc                   	int3
   1c5b9:	cc                   	int3
   1c5ba:	cc                   	int3
   1c5bb:	cc                   	int3
   1c5bc:	cc                   	int3
   1c5bd:	cc                   	int3
   1c5be:	cc                   	int3
   1c5bf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::point:
   1c5c0:	53                   	push   %rbx
   1c5c1:	48 83 ec 10          	sub    $0x10,%rsp
   1c5c5:	48 89 fb             	mov    %rdi,%rbx
   1c5c8:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1c5cd:	48 89 e7             	mov    %rsp,%rdi
   1c5d0:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1c5d7:	00 00 80 
   1c5da:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1c5e1:	00 f0 7f 
   1c5e4:	e8 47 bc ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1c5e9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c5ed:	75 0f                	jne    1c5fe <<hyperinterval::float::F64Enclosure>::point+0x3e>
   1c5ef:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1c5f4:	88 43 08             	mov    %al,0x8(%rbx)
   1c5f7:	b8 02 00 00 00       	mov    $0x2,%eax
   1c5fc:	eb 12                	jmp    1c610 <<hyperinterval::float::F64Enclosure>::point+0x50>
   1c5fe:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c603:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1c607:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1c60b:	b8 01 00 00 00       	mov    $0x1,%eax
   1c610:	48 89 03             	mov    %rax,(%rbx)
   1c613:	48 89 d8             	mov    %rbx,%rax
   1c616:	48 83 c4 10          	add    $0x10,%rsp
   1c61a:	5b                   	pop    %rbx
   1c61b:	c3                   	ret
   1c61c:	cc                   	int3
   1c61d:	cc                   	int3
   1c61e:	cc                   	int3
   1c61f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::signs:
   1c620:	83 3f 01             	cmpl   $0x1,(%rdi)
   1c623:	75 69                	jne    1c68e <<hyperinterval::float::F64Enclosure>::signs+0x6e>
   1c625:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1c62c:	00 00 80 
   1c62f:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   1c633:	48 8b 47 10          	mov    0x10(%rdi),%rax
   1c637:	4a 8d 14 01          	lea    (%rcx,%r8,1),%rdx
   1c63b:	49 8d 70 ff          	lea    -0x1(%r8),%rsi
   1c63f:	49 89 c9             	mov    %rcx,%r9
   1c642:	49 21 f1             	and    %rsi,%r9
   1c645:	4c 89 c7             	mov    %r8,%rdi
   1c648:	4c 29 cf             	sub    %r9,%rdi
   1c64b:	48 85 c9             	test   %rcx,%rcx
   1c64e:	48 0f 49 fa          	cmovns %rdx,%rdi
   1c652:	31 d2                	xor    %edx,%edx
   1c654:	48 85 ff             	test   %rdi,%rdi
   1c657:	0f 99 c1             	setns  %cl
   1c65a:	4c 39 c7             	cmp    %r8,%rdi
   1c65d:	77 1f                	ja     1c67e <<hyperinterval::float::F64Enclosure>::signs+0x5e>
   1c65f:	48 85 ff             	test   %rdi,%rdi
   1c662:	40 0f 99 c7          	setns  %dil
   1c666:	40 80 cf 02          	or     $0x2,%dil
   1c66a:	48 85 f0             	test   %rsi,%rax
   1c66d:	88 ca                	mov    %cl,%dl
   1c66f:	40 0f b6 cf          	movzbl %dil,%ecx
   1c673:	0f 44 d1             	cmove  %ecx,%edx
   1c676:	48 85 c0             	test   %rax,%rax
   1c679:	0f 49 d1             	cmovns %ecx,%edx
   1c67c:	89 d1                	mov    %edx,%ecx
   1c67e:	8d 51 04             	lea    0x4(%rcx),%edx
   1c681:	48 85 c0             	test   %rax,%rax
   1c684:	0f b6 c9             	movzbl %cl,%ecx
   1c687:	0f b6 c2             	movzbl %dl,%eax
   1c68a:	0f 4e c1             	cmovle %ecx,%eax
   1c68d:	c3                   	ret
   1c68e:	31 c0                	xor    %eax,%eax
   1c690:	c3                   	ret
   1c691:	cc                   	int3
   1c692:	cc                   	int3
   1c693:	cc                   	int3
   1c694:	cc                   	int3
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

<hyperinterval::float::F64Enclosure>::affine:
   1c6a0:	55                   	push   %rbp
   1c6a1:	41 57                	push   %r15
   1c6a3:	41 56                	push   %r14
   1c6a5:	41 55                	push   %r13
   1c6a7:	41 54                	push   %r12
   1c6a9:	53                   	push   %rbx
   1c6aa:	48 83 ec 58          	sub    $0x58,%rsp
   1c6ae:	f2 0f 11 4c 24 18    	movsd  %xmm1,0x18(%rsp)
   1c6b4:	49 89 f5             	mov    %rsi,%r13
   1c6b7:	48 89 fb             	mov    %rdi,%rbx
   1c6ba:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1c6c1:	00 00 80 
   1c6c4:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1c6cb:	00 f0 7f 
   1c6ce:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1c6d3:	48 89 e7             	mov    %rsp,%rdi
   1c6d6:	4c 89 f6             	mov    %r14,%rsi
   1c6d9:	4c 89 fa             	mov    %r15,%rdx
   1c6dc:	e8 4f bb ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1c6e1:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c6e5:	74 24                	je     1c70b <<hyperinterval::float::F64Enclosure>::affine+0x6b>
   1c6e7:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1c6ec:	f3 0f 7e 44 24 18    	movq   0x18(%rsp),%xmm0
   1c6f2:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1c6f7:	48 89 e7             	mov    %rsp,%rdi
   1c6fa:	4c 89 f6             	mov    %r14,%rsi
   1c6fd:	4c 89 fa             	mov    %r15,%rdx
   1c700:	e8 2b bb ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1c705:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c709:	75 21                	jne    1c72c <<hyperinterval::float::F64Enclosure>::affine+0x8c>
   1c70b:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1c710:	88 43 08             	mov    %al,0x8(%rbx)
   1c713:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c71a:	48 89 d8             	mov    %rbx,%rax
   1c71d:	48 83 c4 58          	add    $0x58,%rsp
   1c721:	5b                   	pop    %rbx
   1c722:	41 5c                	pop    %r12
   1c724:	41 5d                	pop    %r13
   1c726:	41 5e                	pop    %r14
   1c728:	41 5f                	pop    %r15
   1c72a:	5d                   	pop    %rbp
   1c72b:	c3                   	ret
   1c72c:	41 f6 45 00 01       	testb  $0x1,0x0(%r13)
   1c731:	0f 84 aa 00 00 00    	je     1c7e1 <<hyperinterval::float::F64Enclosure>::affine+0x141>
   1c737:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1c73c:	49 8b 45 10          	mov    0x10(%r13),%rax
   1c740:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1c745:	49 8b 4d 08          	mov    0x8(%r13),%rcx
   1c749:	48 89 e7             	mov    %rsp,%rdi
   1c74c:	4c 89 f6             	mov    %r14,%rsi
   1c74f:	4c 89 fa             	mov    %r15,%rdx
   1c752:	4d 89 e0             	mov    %r12,%r8
   1c755:	49 89 e9             	mov    %rbp,%r9
   1c758:	e8 a3 e4 ff ff       	call   1ac00 <<hyperinterval::ieee::Format>::affine>
   1c75d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c761:	74 a8                	je     1c70b <<hyperinterval::float::F64Enclosure>::affine+0x6b>
   1c763:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1c768:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1c76d:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1c772:	48 89 e7             	mov    %rsp,%rdi
   1c775:	4c 89 f6             	mov    %r14,%rsi
   1c778:	4c 89 fa             	mov    %r15,%rdx
   1c77b:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1c780:	4d 89 e0             	mov    %r12,%r8
   1c783:	49 89 e9             	mov    %rbp,%r9
   1c786:	e8 75 e4 ff ff       	call   1ac00 <<hyperinterval::ieee::Format>::affine>
   1c78b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c78f:	0f 84 76 ff ff ff    	je     1c70b <<hyperinterval::float::F64Enclosure>::affine+0x6b>
   1c795:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1c79a:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1c79f:	48 89 e7             	mov    %rsp,%rdi
   1c7a2:	4c 89 f6             	mov    %r14,%rsi
   1c7a5:	4c 89 fa             	mov    %r15,%rdx
   1c7a8:	4c 89 e9             	mov    %r13,%rcx
   1c7ab:	e8 80 ba ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1c7b0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c7b4:	74 1e                	je     1c7d4 <<hyperinterval::float::F64Enclosure>::affine+0x134>
   1c7b6:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1c7bb:	48 89 e7             	mov    %rsp,%rdi
   1c7be:	4c 89 f6             	mov    %r14,%rsi
   1c7c1:	4c 89 fa             	mov    %r15,%rdx
   1c7c4:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1c7c9:	e8 62 ba ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1c7ce:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c7d2:	75 19                	jne    1c7ed <<hyperinterval::float::F64Enclosure>::affine+0x14d>
   1c7d4:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   1c7d9:	88 4b 08             	mov    %cl,0x8(%rbx)
   1c7dc:	e9 32 ff ff ff       	jmp    1c713 <<hyperinterval::float::F64Enclosure>::affine+0x73>
   1c7e1:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1c7e8:	e9 2d ff ff ff       	jmp    1c71a <<hyperinterval::float::F64Enclosure>::affine+0x7a>
   1c7ed:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c7f2:	4b 8d 0c 2e          	lea    (%r14,%r13,1),%rcx
   1c7f6:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   1c7fa:	4c 89 ee             	mov    %r13,%rsi
   1c7fd:	48 21 d6             	and    %rdx,%rsi
   1c800:	4c 89 f7             	mov    %r14,%rdi
   1c803:	48 29 f7             	sub    %rsi,%rdi
   1c806:	4d 85 ed             	test   %r13,%r13
   1c809:	48 0f 49 f9          	cmovns %rcx,%rdi
   1c80d:	4a 8d 0c 30          	lea    (%rax,%r14,1),%rcx
   1c811:	48 21 c2             	and    %rax,%rdx
   1c814:	49 29 d6             	sub    %rdx,%r14
   1c817:	48 85 c0             	test   %rax,%rax
   1c81a:	4c 0f 49 f1          	cmovns %rcx,%r14
   1c81e:	b1 01                	mov    $0x1,%cl
   1c820:	4c 39 f7             	cmp    %r14,%rdi
   1c823:	77 b4                	ja     1c7d9 <<hyperinterval::float::F64Enclosure>::affine+0x139>
   1c825:	48 c7 44 24 40 01 00 	movq   $0x1,0x40(%rsp)
   1c82c:	00 00 
   1c82e:	4c 89 6c 24 48       	mov    %r13,0x48(%rsp)
   1c833:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1c838:	48 89 e7             	mov    %rsp,%rdi
   1c83b:	4c 89 e6             	mov    %r12,%rsi
   1c83e:	48 89 ea             	mov    %rbp,%rdx
   1c841:	e8 ba 06 00 00       	call   1cf00 <<hyperinterval::float::F64Enclosure>::from_bits>
   1c846:	48 8b 0c 24          	mov    (%rsp),%rcx
   1c84a:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1c84f:	48 83 f9 02          	cmp    $0x2,%rcx
   1c853:	0f 84 b7 fe ff ff    	je     1c710 <<hyperinterval::float::F64Enclosure>::affine+0x70>
   1c859:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   1c85e:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1c863:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
   1c868:	48 89 54 24 31       	mov    %rdx,0x31(%rsp)
   1c86d:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
   1c872:	88 44 24 30          	mov    %al,0x30(%rsp)
   1c876:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
   1c87b:	48 8d 54 24 28       	lea    0x28(%rsp),%rdx
   1c880:	48 89 df             	mov    %rbx,%rdi
   1c883:	ff 15 67 fe 03 00    	call   *0x3fe67(%rip)        # 5c6f0 <_DYNAMIC+0x3b8>
   1c889:	e9 8c fe ff ff       	jmp    1c71a <<hyperinterval::float::F64Enclosure>::affine+0x7a>
   1c88e:	cc                   	int3
   1c88f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::square:
   1c890:	55                   	push   %rbp
   1c891:	41 57                	push   %r15
   1c893:	41 56                	push   %r14
   1c895:	41 55                	push   %r13
   1c897:	41 54                	push   %r12
   1c899:	53                   	push   %rbx
   1c89a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   1c8a1:	48 89 fb             	mov    %rdi,%rbx
   1c8a4:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1c8a8:	0f 85 0a 01 00 00    	jne    1c9b8 <<hyperinterval::float::F64Enclosure>::square+0x128>
   1c8ae:	4c 8b 66 10          	mov    0x10(%rsi),%r12
   1c8b2:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1c8b9:	00 00 80 
   1c8bc:	49 b8 00 00 00 00 00 	movabs $0x7ff0000000000000,%r8
   1c8c3:	00 f0 7f 
   1c8c6:	49 bf ff ff ff ff ff 	movabs $0xfffffffffffff,%r15
   1c8cd:	ff 0f 00 
   1c8d0:	4c 8b 6e 08          	mov    0x8(%rsi),%r13
   1c8d4:	4c 89 e9             	mov    %r13,%rcx
   1c8d7:	48 c1 e9 34          	shr    $0x34,%rcx
   1c8db:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1c8e1:	4c 89 ea             	mov    %r13,%rdx
   1c8e4:	4c 21 fa             	and    %r15,%rdx
   1c8e7:	48 85 c9             	test   %rcx,%rcx
   1c8ea:	4a 8d 44 3a 01       	lea    0x1(%rdx,%r15,1),%rax
   1c8ef:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1c8f6:	48 0f 44 c2          	cmove  %rdx,%rax
   1c8fa:	bd 9c f7 ff ff       	mov    $0xfffff79c,%ebp
   1c8ff:	0f 44 cd             	cmove  %ebp,%ecx
   1c902:	48 f7 e0             	mul    %rax
   1c905:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1c90a:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1c90f:	48 89 04 24          	mov    %rax,(%rsp)
   1c913:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1c917:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1c91c:	48 89 e1             	mov    %rsp,%rcx
   1c91f:	4c 89 f6             	mov    %r14,%rsi
   1c922:	4c 89 c2             	mov    %r8,%rdx
   1c925:	e8 e6 e6 ff ff       	call   1b010 <<hyperinterval::ieee::Format>::rounded>
   1c92a:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
   1c92f:	75 76                	jne    1c9a7 <<hyperinterval::float::F64Enclosure>::square+0x117>
   1c931:	4c 89 e2             	mov    %r12,%rdx
   1c934:	4c 8b 64 24 30       	mov    0x30(%rsp),%r12
   1c939:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   1c93e:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1c943:	48 89 d1             	mov    %rdx,%rcx
   1c946:	48 c1 e9 34          	shr    $0x34,%rcx
   1c94a:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1c950:	48 89 54 24 68       	mov    %rdx,0x68(%rsp)
   1c955:	4c 21 fa             	and    %r15,%rdx
   1c958:	48 85 c9             	test   %rcx,%rcx
   1c95b:	49 8d 44 17 01       	lea    0x1(%r15,%rdx,1),%rax
   1c960:	48 0f 44 c2          	cmove  %rdx,%rax
   1c964:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1c96b:	0f 44 cd             	cmove  %ebp,%ecx
   1c96e:	48 f7 e0             	mul    %rax
   1c971:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1c976:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1c97b:	48 89 04 24          	mov    %rax,(%rsp)
   1c97f:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1c983:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1c988:	48 89 e1             	mov    %rsp,%rcx
   1c98b:	4c 89 f6             	mov    %r14,%rsi
   1c98e:	48 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%rbp
   1c995:	00 f0 7f 
   1c998:	48 89 ea             	mov    %rbp,%rdx
   1c99b:	e8 70 e6 ff ff       	call   1b010 <<hyperinterval::ieee::Format>::rounded>
   1c9a0:	80 7c 24 28 01       	cmpb   $0x1,0x28(%rsp)
   1c9a5:	75 2d                	jne    1c9d4 <<hyperinterval::float::F64Enclosure>::square+0x144>
   1c9a7:	0f b6 44 24 29       	movzbl 0x29(%rsp),%eax
   1c9ac:	88 43 08             	mov    %al,0x8(%rbx)
   1c9af:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c9b6:	eb 07                	jmp    1c9bf <<hyperinterval::float::F64Enclosure>::square+0x12f>
   1c9b8:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1c9bf:	48 89 d8             	mov    %rbx,%rax
   1c9c2:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1c9c9:	5b                   	pop    %rbx
   1c9ca:	41 5c                	pop    %r12
   1c9cc:	41 5d                	pop    %r13
   1c9ce:	41 5e                	pop    %r14
   1c9d0:	41 5f                	pop    %r15
   1c9d2:	5d                   	pop    %rbp
   1c9d3:	c3                   	ret
   1c9d4:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   1c9d9:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1c9de:	4c 8b 7c 24 38       	mov    0x38(%rsp),%r15
   1c9e3:	48 89 e7             	mov    %rsp,%rdi
   1c9e6:	4c 89 f6             	mov    %r14,%rsi
   1c9e9:	48 89 ea             	mov    %rbp,%rdx
   1c9ec:	4c 89 e1             	mov    %r12,%rcx
   1c9ef:	e8 3c b8 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1c9f4:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c9f8:	74 23                	je     1ca1d <<hyperinterval::float::F64Enclosure>::square+0x18d>
   1c9fa:	4c 89 7c 24 78       	mov    %r15,0x78(%rsp)
   1c9ff:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1ca04:	48 89 e7             	mov    %rsp,%rdi
   1ca07:	4c 89 f6             	mov    %r14,%rsi
   1ca0a:	48 89 ea             	mov    %rbp,%rdx
   1ca0d:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1ca12:	e8 19 b8 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1ca17:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1ca1b:	75 07                	jne    1ca24 <<hyperinterval::float::F64Enclosure>::square+0x194>
   1ca1d:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1ca22:	eb 88                	jmp    1c9ac <<hyperinterval::float::F64Enclosure>::square+0x11c>
   1ca24:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
   1ca29:	4b 8d 04 37          	lea    (%r15,%r14,1),%rax
   1ca2d:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   1ca31:	4c 89 f9             	mov    %r15,%rcx
   1ca34:	48 21 d1             	and    %rdx,%rcx
   1ca37:	4c 89 f7             	mov    %r14,%rdi
   1ca3a:	48 29 cf             	sub    %rcx,%rdi
   1ca3d:	4d 85 ff             	test   %r15,%r15
   1ca40:	48 0f 49 f8          	cmovns %rax,%rdi
   1ca44:	4a 8d 04 36          	lea    (%rsi,%r14,1),%rax
   1ca48:	48 89 f1             	mov    %rsi,%rcx
   1ca4b:	48 21 d1             	and    %rdx,%rcx
   1ca4e:	4d 89 f4             	mov    %r14,%r12
   1ca51:	49 29 cc             	sub    %rcx,%r12
   1ca54:	48 85 f6             	test   %rsi,%rsi
   1ca57:	4c 0f 49 e0          	cmovns %rax,%r12
   1ca5b:	b0 01                	mov    $0x1,%al
   1ca5d:	4c 39 e7             	cmp    %r12,%rdi
   1ca60:	0f 87 46 ff ff ff    	ja     1c9ac <<hyperinterval::float::F64Enclosure>::square+0x11c>
   1ca66:	48 89 7c 24 70       	mov    %rdi,0x70(%rsp)
   1ca6b:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
   1ca70:	48 89 e7             	mov    %rsp,%rdi
   1ca73:	4c 89 f6             	mov    %r14,%rsi
   1ca76:	48 89 ea             	mov    %rbp,%rdx
   1ca79:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1ca7e:	e8 ad b7 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1ca83:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1ca87:	74 23                	je     1caac <<hyperinterval::float::F64Enclosure>::square+0x21c>
   1ca89:	4c 89 7c 24 40       	mov    %r15,0x40(%rsp)
   1ca8e:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1ca93:	48 89 e7             	mov    %rsp,%rdi
   1ca96:	4c 89 f6             	mov    %r14,%rsi
   1ca99:	48 89 ea             	mov    %rbp,%rdx
   1ca9c:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
   1caa1:	e8 8a b7 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1caa6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1caaa:	75 14                	jne    1cac0 <<hyperinterval::float::F64Enclosure>::square+0x230>
   1caac:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   1cab1:	88 53 08             	mov    %dl,0x8(%rbx)
   1cab4:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1cabb:	e9 ff fe ff ff       	jmp    1c9bf <<hyperinterval::float::F64Enclosure>::square+0x12f>
   1cac0:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1cac5:	4b 8d 14 37          	lea    (%r15,%r14,1),%rdx
   1cac9:	4c 89 fe             	mov    %r15,%rsi
   1cacc:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   1cad0:	48 21 fe             	and    %rdi,%rsi
   1cad3:	4c 89 f1             	mov    %r14,%rcx
   1cad6:	48 29 f1             	sub    %rsi,%rcx
   1cad9:	4d 85 ff             	test   %r15,%r15
   1cadc:	48 0f 49 ca          	cmovns %rdx,%rcx
   1cae0:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1cae4:	48 89 c6             	mov    %rax,%rsi
   1cae7:	48 21 fe             	and    %rdi,%rsi
   1caea:	49 29 f6             	sub    %rsi,%r14
   1caed:	48 85 c0             	test   %rax,%rax
   1caf0:	4c 0f 49 f2          	cmovns %rdx,%r14
   1caf4:	b2 01                	mov    $0x1,%dl
   1caf6:	4c 39 f1             	cmp    %r14,%rcx
   1caf9:	77 b6                	ja     1cab1 <<hyperinterval::float::F64Enclosure>::square+0x221>
   1cafb:	48 39 4c 24 70       	cmp    %rcx,0x70(%rsp)
   1cb00:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1cb05:	49 0f 47 cf          	cmova  %r15,%rcx
   1cb09:	4d 39 f4             	cmp    %r14,%r12
   1cb0c:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
   1cb11:	48 0f 42 d0          	cmovb  %rax,%rdx
   1cb15:	48 c7 44 24 50 01 00 	movq   $0x1,0x50(%rsp)
   1cb1c:	00 00 
   1cb1e:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
   1cb23:	48 89 54 24 60       	mov    %rdx,0x60(%rsp)
   1cb28:	4d 85 ed             	test   %r13,%r13
   1cb2b:	7f 7d                	jg     1cbaa <<hyperinterval::float::F64Enclosure>::square+0x31a>
   1cb2d:	48 83 7c 24 68 00    	cmpq   $0x0,0x68(%rsp)
   1cb33:	79 07                	jns    1cb3c <<hyperinterval::float::F64Enclosure>::square+0x2ac>
   1cb35:	48 21 7c 24 68       	and    %rdi,0x68(%rsp)
   1cb3a:	75 6e                	jne    1cbaa <<hyperinterval::float::F64Enclosure>::square+0x31a>
   1cb3c:	48 89 e7             	mov    %rsp,%rdi
   1cb3f:	31 f6                	xor    %esi,%esi
   1cb41:	31 d2                	xor    %edx,%edx
   1cb43:	e8 b8 03 00 00       	call   1cf00 <<hyperinterval::float::F64Enclosure>::from_bits>
   1cb48:	48 8b 0c 24          	mov    (%rsp),%rcx
   1cb4c:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1cb51:	48 83 f9 02          	cmp    $0x2,%rcx
   1cb55:	0f 84 51 fe ff ff    	je     1c9ac <<hyperinterval::float::F64Enclosure>::square+0x11c>
   1cb5b:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   1cb60:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1cb65:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
   1cb6a:	48 89 54 24 31       	mov    %rdx,0x31(%rsp)
   1cb6f:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
   1cb74:	88 44 24 30          	mov    %al,0x30(%rsp)
   1cb78:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   1cb7f:	00 
   1cb80:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   1cb85:	48 8d 54 24 28       	lea    0x28(%rsp),%rdx
   1cb8a:	ff 15 60 fb 03 00    	call   *0x3fb60(%rip)        # 5c6f0 <_DYNAMIC+0x3b8>
   1cb90:	48 8b 84 24 90 00 00 	mov    0x90(%rsp),%rax
   1cb97:	00 
   1cb98:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1cb9d:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
   1cba4:	00 
   1cba5:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
   1cbaa:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
   1cbaf:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1cbb3:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   1cbb8:	48 89 03             	mov    %rax,(%rbx)
   1cbbb:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
   1cbc0:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1cbc4:	e9 f6 fd ff ff       	jmp    1c9bf <<hyperinterval::float::F64Enclosure>::square+0x12f>
   1cbc9:	cc                   	int3
   1cbca:	cc                   	int3
   1cbcb:	cc                   	int3
   1cbcc:	cc                   	int3
   1cbcd:	cc                   	int3
   1cbce:	cc                   	int3
   1cbcf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::next_up:
   1cbd0:	41 57                	push   %r15
   1cbd2:	41 56                	push   %r14
   1cbd4:	53                   	push   %rbx
   1cbd5:	48 83 ec 10          	sub    $0x10,%rsp
   1cbd9:	48 89 fb             	mov    %rdi,%rbx
   1cbdc:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1cbe3:	00 00 80 
   1cbe6:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1cbed:	00 f0 7f 
   1cbf0:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1cbf5:	48 89 e7             	mov    %rsp,%rdi
   1cbf8:	4c 89 f6             	mov    %r14,%rsi
   1cbfb:	4c 89 fa             	mov    %r15,%rdx
   1cbfe:	e8 2d b6 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1cc03:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1cc07:	75 0c                	jne    1cc15 <<hyperinterval::float::F64Enclosure>::next_up+0x45>
   1cc09:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1cc0e:	88 43 01             	mov    %al,0x1(%rbx)
   1cc11:	b0 01                	mov    $0x1,%al
   1cc13:	eb 3c                	jmp    1cc51 <<hyperinterval::float::F64Enclosure>::next_up+0x81>
   1cc15:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1cc1a:	48 89 c1             	mov    %rax,%rcx
   1cc1d:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1cc21:	48 83 c9 01          	or     $0x1,%rcx
   1cc25:	48 01 c1             	add    %rax,%rcx
   1cc28:	48 89 e7             	mov    %rsp,%rdi
   1cc2b:	4c 89 f6             	mov    %r14,%rsi
   1cc2e:	4c 89 fa             	mov    %r15,%rdx
   1cc31:	e8 fa b5 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1cc36:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1cc3a:	75 08                	jne    1cc44 <<hyperinterval::float::F64Enclosure>::next_up+0x74>
   1cc3c:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
   1cc40:	b0 01                	mov    $0x1,%al
   1cc42:	eb 0d                	jmp    1cc51 <<hyperinterval::float::F64Enclosure>::next_up+0x81>
   1cc44:	f3 0f 7e 44 24 08    	movq   0x8(%rsp),%xmm0
   1cc4a:	66 0f d6 43 08       	movq   %xmm0,0x8(%rbx)
   1cc4f:	31 c0                	xor    %eax,%eax
   1cc51:	88 03                	mov    %al,(%rbx)
   1cc53:	48 89 d8             	mov    %rbx,%rax
   1cc56:	48 83 c4 10          	add    $0x10,%rsp
   1cc5a:	5b                   	pop    %rbx
   1cc5b:	41 5e                	pop    %r14
   1cc5d:	41 5f                	pop    %r15
   1cc5f:	c3                   	ret

<hyperinterval::float::F64Enclosure>::disjoint:
   1cc60:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1cc64:	b0 01                	mov    $0x1,%al
   1cc66:	0f 84 8b 00 00 00    	je     1ccf7 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1cc6c:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1cc70:	0f 84 81 00 00 00    	je     1ccf7 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1cc76:	53                   	push   %rbx
   1cc77:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
   1cc7e:	00 00 80 
   1cc81:	4c 8b 47 10          	mov    0x10(%rdi),%r8
   1cc85:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
   1cc89:	4d 8d 14 08          	lea    (%r8,%rcx,1),%r10
   1cc8d:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
   1cc91:	4d 89 c3             	mov    %r8,%r11
   1cc94:	49 21 d3             	and    %rdx,%r11
   1cc97:	48 89 cb             	mov    %rcx,%rbx
   1cc9a:	4c 29 db             	sub    %r11,%rbx
   1cc9d:	4d 85 c0             	test   %r8,%r8
   1cca0:	49 0f 49 da          	cmovns %r10,%rbx
   1cca4:	4d 8d 04 09          	lea    (%r9,%rcx,1),%r8
   1cca8:	4d 89 ca             	mov    %r9,%r10
   1ccab:	49 21 d2             	and    %rdx,%r10
   1ccae:	49 89 cb             	mov    %rcx,%r11
   1ccb1:	4d 29 d3             	sub    %r10,%r11
   1ccb4:	4d 85 c9             	test   %r9,%r9
   1ccb7:	4d 0f 49 d8          	cmovns %r8,%r11
   1ccbb:	4c 39 db             	cmp    %r11,%rbx
   1ccbe:	5b                   	pop    %rbx
   1ccbf:	72 36                	jb     1ccf7 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1ccc1:	48 8b 47 08          	mov    0x8(%rdi),%rax
   1ccc5:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1ccc9:	48 8d 3c 0e          	lea    (%rsi,%rcx,1),%rdi
   1cccd:	49 89 f0             	mov    %rsi,%r8
   1ccd0:	49 21 d0             	and    %rdx,%r8
   1ccd3:	49 89 c9             	mov    %rcx,%r9
   1ccd6:	4d 29 c1             	sub    %r8,%r9
   1ccd9:	48 85 f6             	test   %rsi,%rsi
   1ccdc:	4c 0f 49 cf          	cmovns %rdi,%r9
   1cce0:	48 8d 34 08          	lea    (%rax,%rcx,1),%rsi
   1cce4:	48 21 c2             	and    %rax,%rdx
   1cce7:	48 29 d1             	sub    %rdx,%rcx
   1ccea:	48 85 c0             	test   %rax,%rax
   1cced:	48 0f 49 ce          	cmovns %rsi,%rcx
   1ccf1:	49 39 c9             	cmp    %rcx,%r9
   1ccf4:	0f 92 c0             	setb   %al
   1ccf7:	c3                   	ret
   1ccf8:	cc                   	int3
   1ccf9:	cc                   	int3
   1ccfa:	cc                   	int3
   1ccfb:	cc                   	int3
   1ccfc:	cc                   	int3
   1ccfd:	cc                   	int3
   1ccfe:	cc                   	int3
   1ccff:	cc                   	int3

<hyperinterval::float::F64Enclosure>::expanded:
   1cd00:	41 57                	push   %r15
   1cd02:	41 56                	push   %r14
   1cd04:	41 55                	push   %r13
   1cd06:	41 54                	push   %r12
   1cd08:	53                   	push   %rbx
   1cd09:	48 83 ec 10          	sub    $0x10,%rsp
   1cd0d:	48 89 fb             	mov    %rdi,%rbx
   1cd10:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1cd14:	75 7f                	jne    1cd95 <<hyperinterval::float::F64Enclosure>::expanded+0x95>
   1cd16:	4c 8b 66 10          	mov    0x10(%rsi),%r12
   1cd1a:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1cd21:	00 00 80 
   1cd24:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1cd2b:	00 f0 7f 
   1cd2e:	48 8b 46 08          	mov    0x8(%rsi),%rax
   1cd32:	48 89 c2             	mov    %rax,%rdx
   1cd35:	4c 31 f2             	xor    %r14,%rdx
   1cd38:	48 85 c0             	test   %rax,%rax
   1cd3b:	48 0f 44 d0          	cmove  %rax,%rdx
   1cd3f:	48 89 d1             	mov    %rdx,%rcx
   1cd42:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1cd46:	48 83 c9 01          	or     $0x1,%rcx
   1cd4a:	48 01 d1             	add    %rdx,%rcx
   1cd4d:	48 89 e7             	mov    %rsp,%rdi
   1cd50:	4c 89 f6             	mov    %r14,%rsi
   1cd53:	4c 89 fa             	mov    %r15,%rdx
   1cd56:	e8 d5 b4 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1cd5b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1cd5f:	75 27                	jne    1cd88 <<hyperinterval::float::F64Enclosure>::expanded+0x88>
   1cd61:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1cd66:	4c 89 e1             	mov    %r12,%rcx
   1cd69:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1cd6d:	48 83 c9 01          	or     $0x1,%rcx
   1cd71:	4c 01 e1             	add    %r12,%rcx
   1cd74:	48 89 e7             	mov    %rsp,%rdi
   1cd77:	4c 89 f6             	mov    %r14,%rsi
   1cd7a:	4c 89 fa             	mov    %r15,%rdx
   1cd7d:	e8 ae b4 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1cd82:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1cd86:	75 25                	jne    1cdad <<hyperinterval::float::F64Enclosure>::expanded+0xad>
   1cd88:	c6 43 08 03          	movb   $0x3,0x8(%rbx)
   1cd8c:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1cd93:	eb 07                	jmp    1cd9c <<hyperinterval::float::F64Enclosure>::expanded+0x9c>
   1cd95:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1cd9c:	48 89 d8             	mov    %rbx,%rax
   1cd9f:	48 83 c4 10          	add    $0x10,%rsp
   1cda3:	5b                   	pop    %rbx
   1cda4:	41 5c                	pop    %r12
   1cda6:	41 5d                	pop    %r13
   1cda8:	41 5e                	pop    %r14
   1cdaa:	41 5f                	pop    %r15
   1cdac:	c3                   	ret
   1cdad:	4c 89 e9             	mov    %r13,%rcx
   1cdb0:	4c 31 f1             	xor    %r14,%rcx
   1cdb3:	4d 85 ed             	test   %r13,%r13
   1cdb6:	49 0f 44 cd          	cmove  %r13,%rcx
   1cdba:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1cdbf:	48 89 e7             	mov    %rsp,%rdi
   1cdc2:	4c 89 f6             	mov    %r14,%rsi
   1cdc5:	4c 89 fa             	mov    %r15,%rdx
   1cdc8:	e8 63 b4 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1cdcd:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1cdd1:	74 1c                	je     1cdef <<hyperinterval::float::F64Enclosure>::expanded+0xef>
   1cdd3:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1cdd8:	48 89 e7             	mov    %rsp,%rdi
   1cddb:	4c 89 f6             	mov    %r14,%rsi
   1cdde:	4c 89 fa             	mov    %r15,%rdx
   1cde1:	4c 89 e1             	mov    %r12,%rcx
   1cde4:	e8 47 b4 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1cde9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1cded:	75 11                	jne    1ce00 <<hyperinterval::float::F64Enclosure>::expanded+0x100>
   1cdef:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1cdf4:	88 43 08             	mov    %al,0x8(%rbx)
   1cdf7:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1cdfe:	eb 9c                	jmp    1cd9c <<hyperinterval::float::F64Enclosure>::expanded+0x9c>
   1ce00:	4b 8d 04 2e          	lea    (%r14,%r13,1),%rax
   1ce04:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1ce08:	4c 89 ea             	mov    %r13,%rdx
   1ce0b:	48 21 ca             	and    %rcx,%rdx
   1ce0e:	4c 89 f6             	mov    %r14,%rsi
   1ce11:	48 29 d6             	sub    %rdx,%rsi
   1ce14:	4d 85 ed             	test   %r13,%r13
   1ce17:	48 0f 49 f0          	cmovns %rax,%rsi
   1ce1b:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1ce20:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1ce24:	48 21 c1             	and    %rax,%rcx
   1ce27:	49 29 ce             	sub    %rcx,%r14
   1ce2a:	48 85 c0             	test   %rax,%rax
   1ce2d:	4c 0f 49 f2          	cmovns %rdx,%r14
   1ce31:	4c 39 f6             	cmp    %r14,%rsi
   1ce34:	76 10                	jbe    1ce46 <<hyperinterval::float::F64Enclosure>::expanded+0x146>
   1ce36:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1ce3a:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1ce41:	e9 56 ff ff ff       	jmp    1cd9c <<hyperinterval::float::F64Enclosure>::expanded+0x9c>
   1ce46:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1ce4d:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1ce51:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1ce55:	e9 42 ff ff ff       	jmp    1cd9c <<hyperinterval::float::F64Enclosure>::expanded+0x9c>
   1ce5a:	cc                   	int3
   1ce5b:	cc                   	int3
   1ce5c:	cc                   	int3
   1ce5d:	cc                   	int3
   1ce5e:	cc                   	int3
   1ce5f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::overlaps:
   1ce60:	31 c0                	xor    %eax,%eax
   1ce62:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1ce66:	0f 84 8c 00 00 00    	je     1cef8 <<hyperinterval::float::F64Enclosure>::overlaps+0x98>
   1ce6c:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1ce70:	0f 84 82 00 00 00    	je     1cef8 <<hyperinterval::float::F64Enclosure>::overlaps+0x98>
   1ce76:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1ce7d:	00 00 80 
   1ce80:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1ce84:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1ce88:	4c 8d 0c 02          	lea    (%rdx,%rax,1),%r9
   1ce8c:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1ce90:	49 89 d2             	mov    %rdx,%r10
   1ce93:	49 21 ca             	and    %rcx,%r10
   1ce96:	49 89 c3             	mov    %rax,%r11
   1ce99:	4d 29 d3             	sub    %r10,%r11
   1ce9c:	48 85 d2             	test   %rdx,%rdx
   1ce9f:	4d 0f 49 d9          	cmovns %r9,%r11
   1cea3:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
   1cea7:	4d 89 c1             	mov    %r8,%r9
   1ceaa:	49 21 c9             	and    %rcx,%r9
   1cead:	49 89 c2             	mov    %rax,%r10
   1ceb0:	4d 29 ca             	sub    %r9,%r10
   1ceb3:	4d 85 c0             	test   %r8,%r8
   1ceb6:	4c 0f 49 d2          	cmovns %rdx,%r10
   1ceba:	4d 39 d3             	cmp    %r10,%r11
   1cebd:	73 03                	jae    1cec2 <<hyperinterval::float::F64Enclosure>::overlaps+0x62>
   1cebf:	31 c0                	xor    %eax,%eax
   1cec1:	c3                   	ret
   1cec2:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1cec6:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1ceca:	48 8d 3c 06          	lea    (%rsi,%rax,1),%rdi
   1cece:	49 89 f0             	mov    %rsi,%r8
   1ced1:	49 21 c8             	and    %rcx,%r8
   1ced4:	49 89 c1             	mov    %rax,%r9
   1ced7:	4d 29 c1             	sub    %r8,%r9
   1ceda:	48 85 f6             	test   %rsi,%rsi
   1cedd:	4c 0f 49 cf          	cmovns %rdi,%r9
   1cee1:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
   1cee5:	48 21 d1             	and    %rdx,%rcx
   1cee8:	48 29 c8             	sub    %rcx,%rax
   1ceeb:	48 85 d2             	test   %rdx,%rdx
   1ceee:	48 0f 49 c6          	cmovns %rsi,%rax
   1cef2:	49 39 c1             	cmp    %rax,%r9
   1cef5:	0f 93 c0             	setae  %al
   1cef8:	c3                   	ret
   1cef9:	cc                   	int3
   1cefa:	cc                   	int3
   1cefb:	cc                   	int3
   1cefc:	cc                   	int3
   1cefd:	cc                   	int3
   1cefe:	cc                   	int3
   1ceff:	cc                   	int3

<hyperinterval::float::F64Enclosure>::from_bits:
   1cf00:	41 57                	push   %r15
   1cf02:	41 56                	push   %r14
   1cf04:	41 55                	push   %r13
   1cf06:	41 54                	push   %r12
   1cf08:	53                   	push   %rbx
   1cf09:	48 83 ec 10          	sub    $0x10,%rsp
   1cf0d:	49 89 d7             	mov    %rdx,%r15
   1cf10:	48 89 f1             	mov    %rsi,%rcx
   1cf13:	48 89 fb             	mov    %rdi,%rbx
   1cf16:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1cf1d:	00 00 80 
   1cf20:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1cf27:	00 f0 7f 
   1cf2a:	48 89 e7             	mov    %rsp,%rdi
   1cf2d:	4c 89 f6             	mov    %r14,%rsi
   1cf30:	4c 89 e2             	mov    %r12,%rdx
   1cf33:	e8 f8 b2 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1cf38:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1cf3c:	74 1c                	je     1cf5a <<hyperinterval::float::F64Enclosure>::from_bits+0x5a>
   1cf3e:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1cf43:	48 89 e7             	mov    %rsp,%rdi
   1cf46:	4c 89 f6             	mov    %r14,%rsi
   1cf49:	4c 89 e2             	mov    %r12,%rdx
   1cf4c:	4c 89 f9             	mov    %r15,%rcx
   1cf4f:	e8 dc b2 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1cf54:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1cf58:	75 1d                	jne    1cf77 <<hyperinterval::float::F64Enclosure>::from_bits+0x77>
   1cf5a:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1cf5f:	88 43 08             	mov    %al,0x8(%rbx)
   1cf62:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1cf69:	48 83 c4 10          	add    $0x10,%rsp
   1cf6d:	5b                   	pop    %rbx
   1cf6e:	41 5c                	pop    %r12
   1cf70:	41 5d                	pop    %r13
   1cf72:	41 5e                	pop    %r14
   1cf74:	41 5f                	pop    %r15
   1cf76:	c3                   	ret
   1cf77:	4b 8d 04 2e          	lea    (%r14,%r13,1),%rax
   1cf7b:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1cf7f:	4c 89 ea             	mov    %r13,%rdx
   1cf82:	48 21 ca             	and    %rcx,%rdx
   1cf85:	4c 89 f6             	mov    %r14,%rsi
   1cf88:	48 29 d6             	sub    %rdx,%rsi
   1cf8b:	4d 85 ed             	test   %r13,%r13
   1cf8e:	48 0f 49 f0          	cmovns %rax,%rsi
   1cf92:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1cf97:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1cf9b:	48 21 c1             	and    %rax,%rcx
   1cf9e:	49 29 ce             	sub    %rcx,%r14
   1cfa1:	48 85 c0             	test   %rax,%rax
   1cfa4:	4c 0f 49 f2          	cmovns %rdx,%r14
   1cfa8:	4c 39 f6             	cmp    %r14,%rsi
   1cfab:	76 06                	jbe    1cfb3 <<hyperinterval::float::F64Enclosure>::from_bits+0xb3>
   1cfad:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1cfb1:	eb af                	jmp    1cf62 <<hyperinterval::float::F64Enclosure>::from_bits+0x62>
   1cfb3:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1cfba:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1cfbe:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1cfc2:	eb a5                	jmp    1cf69 <<hyperinterval::float::F64Enclosure>::from_bits+0x69>
   1cfc4:	cc                   	int3
   1cfc5:	cc                   	int3
   1cfc6:	cc                   	int3
   1cfc7:	cc                   	int3
   1cfc8:	cc                   	int3
   1cfc9:	cc                   	int3
   1cfca:	cc                   	int3
   1cfcb:	cc                   	int3
   1cfcc:	cc                   	int3
   1cfcd:	cc                   	int3
   1cfce:	cc                   	int3
   1cfcf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::max_image:
   1cfd0:	48 89 f8             	mov    %rdi,%rax
   1cfd3:	45 31 c0             	xor    %r8d,%r8d
   1cfd6:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1cfda:	0f 85 a3 00 00 00    	jne    1d083 <<hyperinterval::float::F64Enclosure>::max_image+0xb3>
   1cfe0:	f6 02 01             	testb  $0x1,(%rdx)
   1cfe3:	0f 84 8e 00 00 00    	je     1d077 <<hyperinterval::float::F64Enclosure>::max_image+0xa7>
   1cfe9:	41 56                	push   %r14
   1cfeb:	53                   	push   %rbx
   1cfec:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
   1cff0:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1cff4:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
   1cff8:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
   1cffc:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1d003:	00 00 80 
   1d006:	4c 8d 14 37          	lea    (%rdi,%rsi,1),%r10
   1d00a:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   1d00e:	49 89 fb             	mov    %rdi,%r11
   1d011:	4d 21 c3             	and    %r8,%r11
   1d014:	48 89 f3             	mov    %rsi,%rbx
   1d017:	4c 29 db             	sub    %r11,%rbx
   1d01a:	48 85 ff             	test   %rdi,%rdi
   1d01d:	49 0f 49 da          	cmovns %r10,%rbx
   1d021:	4d 8d 14 31          	lea    (%r9,%rsi,1),%r10
   1d025:	4d 89 cb             	mov    %r9,%r11
   1d028:	4d 21 c3             	and    %r8,%r11
   1d02b:	49 89 f6             	mov    %rsi,%r14
   1d02e:	4d 29 de             	sub    %r11,%r14
   1d031:	4d 85 c9             	test   %r9,%r9
   1d034:	4d 0f 49 f2          	cmovns %r10,%r14
   1d038:	4c 39 f3             	cmp    %r14,%rbx
   1d03b:	49 0f 42 f9          	cmovb  %r9,%rdi
   1d03f:	4c 8d 0c 31          	lea    (%rcx,%rsi,1),%r9
   1d043:	49 89 ca             	mov    %rcx,%r10
   1d046:	4d 21 c2             	and    %r8,%r10
   1d049:	49 89 f3             	mov    %rsi,%r11
   1d04c:	4d 29 d3             	sub    %r10,%r11
   1d04f:	48 85 c9             	test   %rcx,%rcx
   1d052:	4d 0f 49 d9          	cmovns %r9,%r11
   1d056:	4c 8d 0c 32          	lea    (%rdx,%rsi,1),%r9
   1d05a:	49 21 d0             	and    %rdx,%r8
   1d05d:	4c 29 c6             	sub    %r8,%rsi
   1d060:	48 85 d2             	test   %rdx,%rdx
   1d063:	49 0f 49 f1          	cmovns %r9,%rsi
   1d067:	49 39 f3             	cmp    %rsi,%r11
   1d06a:	48 0f 42 ca          	cmovb  %rdx,%rcx
   1d06e:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1d074:	5b                   	pop    %rbx
   1d075:	41 5e                	pop    %r14
   1d077:	4c 89 00             	mov    %r8,(%rax)
   1d07a:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1d07e:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1d082:	c3                   	ret
   1d083:	4c 89 00             	mov    %r8,(%rax)
   1d086:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1d08a:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1d08e:	c3                   	ret
   1d08f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::min_image:
   1d090:	48 89 f8             	mov    %rdi,%rax
   1d093:	45 31 c0             	xor    %r8d,%r8d
   1d096:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1d09a:	0f 85 a3 00 00 00    	jne    1d143 <<hyperinterval::float::F64Enclosure>::min_image+0xb3>
   1d0a0:	f6 02 01             	testb  $0x1,(%rdx)
   1d0a3:	0f 84 8e 00 00 00    	je     1d137 <<hyperinterval::float::F64Enclosure>::min_image+0xa7>
   1d0a9:	41 56                	push   %r14
   1d0ab:	53                   	push   %rbx
   1d0ac:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
   1d0b0:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
   1d0b4:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
   1d0b8:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1d0bf:	00 00 80 
   1d0c2:	4c 8d 14 37          	lea    (%rdi,%rsi,1),%r10
   1d0c6:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   1d0ca:	49 89 fb             	mov    %rdi,%r11
   1d0cd:	4d 21 c3             	and    %r8,%r11
   1d0d0:	48 89 f3             	mov    %rsi,%rbx
   1d0d3:	4c 29 db             	sub    %r11,%rbx
   1d0d6:	48 85 ff             	test   %rdi,%rdi
   1d0d9:	49 0f 49 da          	cmovns %r10,%rbx
   1d0dd:	4d 8d 14 31          	lea    (%r9,%rsi,1),%r10
   1d0e1:	4d 89 cb             	mov    %r9,%r11
   1d0e4:	4d 21 c3             	and    %r8,%r11
   1d0e7:	49 89 f6             	mov    %rsi,%r14
   1d0ea:	4d 29 de             	sub    %r11,%r14
   1d0ed:	4d 85 c9             	test   %r9,%r9
   1d0f0:	4d 0f 49 f2          	cmovns %r10,%r14
   1d0f4:	4c 39 f3             	cmp    %r14,%rbx
   1d0f7:	49 0f 47 f9          	cmova  %r9,%rdi
   1d0fb:	4c 8d 0c 31          	lea    (%rcx,%rsi,1),%r9
   1d0ff:	49 89 ca             	mov    %rcx,%r10
   1d102:	4d 21 c2             	and    %r8,%r10
   1d105:	49 89 f3             	mov    %rsi,%r11
   1d108:	4d 29 d3             	sub    %r10,%r11
   1d10b:	48 85 c9             	test   %rcx,%rcx
   1d10e:	4d 0f 49 d9          	cmovns %r9,%r11
   1d112:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1d116:	4c 8d 0c 32          	lea    (%rdx,%rsi,1),%r9
   1d11a:	49 21 d0             	and    %rdx,%r8
   1d11d:	4c 29 c6             	sub    %r8,%rsi
   1d120:	48 85 d2             	test   %rdx,%rdx
   1d123:	49 0f 49 f1          	cmovns %r9,%rsi
   1d127:	49 39 f3             	cmp    %rsi,%r11
   1d12a:	48 0f 47 ca          	cmova  %rdx,%rcx
   1d12e:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1d134:	5b                   	pop    %rbx
   1d135:	41 5e                	pop    %r14
   1d137:	4c 89 00             	mov    %r8,(%rax)
   1d13a:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1d13e:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1d142:	c3                   	ret
   1d143:	4c 89 00             	mov    %r8,(%rax)
   1d146:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1d14a:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1d14e:	c3                   	ret
   1d14f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::next_down:
   1d150:	41 57                	push   %r15
   1d152:	41 56                	push   %r14
   1d154:	53                   	push   %rbx
   1d155:	48 83 ec 10          	sub    $0x10,%rsp
   1d159:	48 89 fb             	mov    %rdi,%rbx
   1d15c:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1d163:	00 00 80 
   1d166:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1d16d:	00 f0 7f 
   1d170:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1d175:	48 89 e7             	mov    %rsp,%rdi
   1d178:	4c 89 f6             	mov    %r14,%rsi
   1d17b:	4c 89 fa             	mov    %r15,%rdx
   1d17e:	e8 ad b0 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1d183:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1d187:	75 0c                	jne    1d195 <<hyperinterval::float::F64Enclosure>::next_down+0x45>
   1d189:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1d18e:	88 43 01             	mov    %al,0x1(%rbx)
   1d191:	b0 01                	mov    $0x1,%al
   1d193:	eb 51                	jmp    1d1e6 <<hyperinterval::float::F64Enclosure>::next_down+0x96>
   1d195:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1d19a:	48 89 c2             	mov    %rax,%rdx
   1d19d:	4c 31 f2             	xor    %r14,%rdx
   1d1a0:	48 85 c0             	test   %rax,%rax
   1d1a3:	48 0f 44 d0          	cmove  %rax,%rdx
   1d1a7:	48 89 d1             	mov    %rdx,%rcx
   1d1aa:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1d1ae:	48 83 c9 01          	or     $0x1,%rcx
   1d1b2:	48 01 d1             	add    %rdx,%rcx
   1d1b5:	48 89 e7             	mov    %rsp,%rdi
   1d1b8:	4c 89 f6             	mov    %r14,%rsi
   1d1bb:	4c 89 fa             	mov    %r15,%rdx
   1d1be:	e8 6d b0 ff ff       	call   18230 <<hyperinterval::ieee::Format>::finite>
   1d1c3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1d1c7:	75 08                	jne    1d1d1 <<hyperinterval::float::F64Enclosure>::next_down+0x81>
   1d1c9:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
   1d1cd:	b0 01                	mov    $0x1,%al
   1d1cf:	eb 15                	jmp    1d1e6 <<hyperinterval::float::F64Enclosure>::next_down+0x96>
   1d1d1:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1d1d6:	49 31 c6             	xor    %rax,%r14
   1d1d9:	48 85 c0             	test   %rax,%rax
   1d1dc:	4c 0f 44 f0          	cmove  %rax,%r14
   1d1e0:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1d1e4:	31 c0                	xor    %eax,%eax
   1d1e6:	88 03                	mov    %al,(%rbx)
   1d1e8:	48 89 d8             	mov    %rbx,%rax
   1d1eb:	48 83 c4 10          	add    $0x10,%rsp
   1d1ef:	5b                   	pop    %rbx
   1d1f0:	41 5e                	pop    %r14
   1d1f2:	41 5f                	pop    %r15
   1d1f4:	c3                   	ret
   1d1f5:	cc                   	int3
   1d1f6:	cc                   	int3
   1d1f7:	cc                   	int3
   1d1f8:	cc                   	int3
   1d1f9:	cc                   	int3
   1d1fa:	cc                   	int3
   1d1fb:	cc                   	int3
   1d1fc:	cc                   	int3
   1d1fd:	cc                   	int3
   1d1fe:	cc                   	int3
   1d1ff:	cc                   	int3

<hyperinterval::float::F64Enclosure>::subset_of:
   1d200:	b0 01                	mov    $0x1,%al
   1d202:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1d206:	75 50                	jne    1d258 <<hyperinterval::float::F64Enclosure>::subset_of+0x58>
   1d208:	f6 06 01             	testb  $0x1,(%rsi)
   1d20b:	74 49                	je     1d256 <<hyperinterval::float::F64Enclosure>::subset_of+0x56>
   1d20d:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1d211:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1d215:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1d21c:	00 00 80 
   1d21f:	4d 8d 0c 00          	lea    (%r8,%rax,1),%r9
   1d223:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1d227:	4d 89 c2             	mov    %r8,%r10
   1d22a:	49 21 ca             	and    %rcx,%r10
   1d22d:	49 89 c3             	mov    %rax,%r11
   1d230:	4d 29 d3             	sub    %r10,%r11
   1d233:	4d 85 c0             	test   %r8,%r8
   1d236:	4d 0f 49 d9          	cmovns %r9,%r11
   1d23a:	4c 8d 04 02          	lea    (%rdx,%rax,1),%r8
   1d23e:	49 89 d1             	mov    %rdx,%r9
   1d241:	49 21 c9             	and    %rcx,%r9
   1d244:	49 89 c2             	mov    %rax,%r10
   1d247:	4d 29 ca             	sub    %r9,%r10
   1d24a:	48 85 d2             	test   %rdx,%rdx
   1d24d:	4d 0f 49 d0          	cmovns %r8,%r10
   1d251:	4d 39 d3             	cmp    %r10,%r11
   1d254:	76 03                	jbe    1d259 <<hyperinterval::float::F64Enclosure>::subset_of+0x59>
   1d256:	31 c0                	xor    %eax,%eax
   1d258:	c3                   	ret
   1d259:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1d25d:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1d261:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1d265:	49 89 d0             	mov    %rdx,%r8
   1d268:	49 21 c8             	and    %rcx,%r8
   1d26b:	49 89 c1             	mov    %rax,%r9
   1d26e:	4d 29 c1             	sub    %r8,%r9
   1d271:	48 85 d2             	test   %rdx,%rdx
   1d274:	4c 0f 49 cf          	cmovns %rdi,%r9
   1d278:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1d27c:	48 21 f1             	and    %rsi,%rcx
   1d27f:	48 29 c8             	sub    %rcx,%rax
   1d282:	48 85 f6             	test   %rsi,%rsi
   1d285:	48 0f 49 c2          	cmovns %rdx,%rax
   1d289:	49 39 c1             	cmp    %rax,%r9
   1d28c:	0f 96 c0             	setbe  %al
   1d28f:	c3                   	ret

__udivti3:
   59210:	49 89 d0             	mov    %rdx,%r8
   59213:	48 85 c9             	test   %rcx,%rcx
   59216:	74 76                	je     5928e <__udivti3+0x7e>
   59218:	53                   	push   %rbx
   59219:	4c 0f bd c9          	bsr    %rcx,%r9
   5921d:	44 89 ca             	mov    %r9d,%edx
   59220:	83 f2 3f             	xor    $0x3f,%edx
   59223:	b0 40                	mov    $0x40,%al
   59225:	28 d0                	sub    %dl,%al
   59227:	4c 89 c2             	mov    %r8,%rdx
   5922a:	49 89 cb             	mov    %rcx,%r11
   5922d:	89 c1                	mov    %eax,%ecx
   5922f:	4c 0f ad da          	shrd   %cl,%r11,%rdx
   59233:	4d 89 da             	mov    %r11,%r10
   59236:	49 d3 ea             	shr    %cl,%r10
   59239:	a8 40                	test   $0x40,%al
   5923b:	4c 0f 44 d2          	cmove  %rdx,%r10
   5923f:	48 89 f8             	mov    %rdi,%rax
   59242:	48 0f ac f0 01       	shrd   $0x1,%rsi,%rax
   59247:	48 89 f2             	mov    %rsi,%rdx
   5924a:	48 d1 ea             	shr    $1,%rdx
   5924d:	49 f7 f2             	div    %r10
   59250:	49 89 c2             	mov    %rax,%r10
   59253:	44 89 c9             	mov    %r9d,%ecx
   59256:	49 d3 ea             	shr    %cl,%r10
   59259:	31 c9                	xor    %ecx,%ecx
   5925b:	49 83 ea 01          	sub    $0x1,%r10
   5925f:	4c 0f 42 d1          	cmovb  %rcx,%r10
   59263:	4c 89 db             	mov    %r11,%rbx
   59266:	4c 89 c0             	mov    %r8,%rax
   59269:	49 f7 e2             	mul    %r10
   5926c:	49 89 c1             	mov    %rax,%r9
   5926f:	4c 89 d0             	mov    %r10,%rax
   59272:	49 0f af da          	imul   %r10,%rbx
   59276:	48 01 da             	add    %rbx,%rdx
   59279:	4c 29 cf             	sub    %r9,%rdi
   5927c:	48 19 d6             	sbb    %rdx,%rsi
   5927f:	4c 39 c7             	cmp    %r8,%rdi
   59282:	4c 19 de             	sbb    %r11,%rsi
   59285:	48 83 d8 ff          	sbb    $0xffffffffffffffff,%rax
   59289:	5b                   	pop    %rbx
   5928a:	48 89 ca             	mov    %rcx,%rdx
   5928d:	c3                   	ret
   5928e:	4c 39 c6             	cmp    %r8,%rsi
   59291:	73 0f                	jae    592a2 <__udivti3+0x92>
   59293:	48 89 f8             	mov    %rdi,%rax
   59296:	48 89 f2             	mov    %rsi,%rdx
   59299:	49 f7 f0             	div    %r8
   5929c:	31 c9                	xor    %ecx,%ecx
   5929e:	48 89 ca             	mov    %rcx,%rdx
   592a1:	c3                   	ret
   592a2:	48 89 f0             	mov    %rsi,%rax
   592a5:	4c 09 c0             	or     %r8,%rax
   592a8:	48 c1 e8 20          	shr    $0x20,%rax
   592ac:	74 15                	je     592c3 <__udivti3+0xb3>
   592ae:	48 89 f0             	mov    %rsi,%rax
   592b1:	31 d2                	xor    %edx,%edx
   592b3:	49 f7 f0             	div    %r8
   592b6:	48 89 c1             	mov    %rax,%rcx
   592b9:	48 89 f8             	mov    %rdi,%rax
   592bc:	49 f7 f0             	div    %r8
   592bf:	48 89 ca             	mov    %rcx,%rdx
   592c2:	c3                   	ret
   592c3:	89 f0                	mov    %esi,%eax
   592c5:	31 d2                	xor    %edx,%edx
   592c7:	41 f7 f0             	div    %r8d
   592ca:	89 c1                	mov    %eax,%ecx
   592cc:	48 89 f8             	mov    %rdi,%rax
   592cf:	49 f7 f0             	div    %r8
   592d2:	48 89 ca             	mov    %rcx,%rdx
   592d5:	c3                   	ret

Disassembly of section .init:
