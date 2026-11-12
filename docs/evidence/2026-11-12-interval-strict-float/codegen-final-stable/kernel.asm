hyperinterval_strict_chain32:
   17460:	53                   	push   %rbx
   17461:	48 83 ec 60          	sub    $0x60,%rsp
   17465:	48 89 fb             	mov    %rdi,%rbx
   17468:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   1746d:	ff 15 15 4a 04 00    	call   *0x44a15(%rip)        # 5be88 <_DYNAMIC+0x2b0>
   17473:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   17477:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   1747c:	83 f9 02             	cmp    $0x2,%ecx
   1747f:	0f 84 f4 00 00 00    	je     17579 <hyperinterval_strict_chain32+0x119>
   17485:	8b 54 24 11          	mov    0x11(%rsp),%edx
   17489:	8b 74 24 14          	mov    0x14(%rsp),%esi
   1748d:	89 74 24 5c          	mov    %esi,0x5c(%rsp)
   17491:	89 54 24 59          	mov    %edx,0x59(%rsp)
   17495:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
   17499:	88 44 24 58          	mov    %al,0x58(%rsp)
   1749d:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   174a2:	48 8d 74 24 54       	lea    0x54(%rsp),%rsi
   174a7:	f3 0f 10 05 99 e6 fe 	movss  -0x11967(%rip),%xmm0        # 5b48 <__abi_tag+0x584c>
   174ae:	ff 
   174af:	f3 0f 10 0d 89 e6 fe 	movss  -0x11977(%rip),%xmm1        # 5b40 <__abi_tag+0x5844>
   174b6:	ff 
   174b7:	ff 15 d3 49 04 00    	call   *0x449d3(%rip)        # 5be90 <_DYNAMIC+0x2b8>
   174bd:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
   174c1:	0f b6 44 24 1c       	movzbl 0x1c(%rsp),%eax
   174c6:	83 f9 02             	cmp    $0x2,%ecx
   174c9:	0f 84 aa 00 00 00    	je     17579 <hyperinterval_strict_chain32+0x119>
   174cf:	8b 54 24 1d          	mov    0x1d(%rsp),%edx
   174d3:	8b 74 24 20          	mov    0x20(%rsp),%esi
   174d7:	89 74 24 50          	mov    %esi,0x50(%rsp)
   174db:	89 54 24 4d          	mov    %edx,0x4d(%rsp)
   174df:	89 4c 24 48          	mov    %ecx,0x48(%rsp)
   174e3:	88 44 24 4c          	mov    %al,0x4c(%rsp)
   174e7:	48 8d 7c 24 3c       	lea    0x3c(%rsp),%rdi
   174ec:	48 8d 74 24 48       	lea    0x48(%rsp),%rsi
   174f1:	ff 15 a1 49 04 00    	call   *0x449a1(%rip)        # 5be98 <_DYNAMIC+0x2c0>
   174f7:	8b 4c 24 3c          	mov    0x3c(%rsp),%ecx
   174fb:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   17500:	83 f9 02             	cmp    $0x2,%ecx
   17503:	74 74                	je     17579 <hyperinterval_strict_chain32+0x119>
   17505:	8b 54 24 41          	mov    0x41(%rsp),%edx
   17509:	8b 74 24 44          	mov    0x44(%rsp),%esi
   1750d:	89 74 24 38          	mov    %esi,0x38(%rsp)
   17511:	89 54 24 35          	mov    %edx,0x35(%rsp)
   17515:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   17519:	88 44 24 34          	mov    %al,0x34(%rsp)
   1751d:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   17522:	f3 0f 10 05 ea e5 fe 	movss  -0x11a16(%rip),%xmm0        # 5b14 <__abi_tag+0x5818>
   17529:	ff 
   1752a:	ff 15 70 49 04 00    	call   *0x44970(%rip)        # 5bea0 <_DYNAMIC+0x2c8>
   17530:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   17534:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   17539:	83 f9 02             	cmp    $0x2,%ecx
   1753c:	74 3b                	je     17579 <hyperinterval_strict_chain32+0x119>
   1753e:	8b 54 24 11          	mov    0x11(%rsp),%edx
   17542:	8b 74 24 14          	mov    0x14(%rsp),%esi
   17546:	89 74 24 20          	mov    %esi,0x20(%rsp)
   1754a:	89 54 24 1d          	mov    %edx,0x1d(%rsp)
   1754e:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
   17552:	88 44 24 1c          	mov    %al,0x1c(%rsp)
   17556:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
   1755b:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   17560:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
   17565:	ff 15 3d 49 04 00    	call   *0x4493d(%rip)        # 5bea8 <_DYNAMIC+0x2d0>
   1756b:	8b 4c 24 24          	mov    0x24(%rsp),%ecx
   1756f:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   17574:	83 f9 02             	cmp    $0x2,%ecx
   17577:	75 12                	jne    1758b <hyperinterval_strict_chain32+0x12b>
   17579:	88 43 04             	mov    %al,0x4(%rbx)
   1757c:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17582:	48 89 d8             	mov    %rbx,%rax
   17585:	48 83 c4 60          	add    $0x60,%rsp
   17589:	5b                   	pop    %rbx
   1758a:	c3                   	ret
   1758b:	8b 54 24 29          	mov    0x29(%rsp),%edx
   1758f:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
   17593:	89 74 24 14          	mov    %esi,0x14(%rsp)
   17597:	89 54 24 11          	mov    %edx,0x11(%rsp)
   1759b:	89 4c 24 0c          	mov    %ecx,0xc(%rsp)
   1759f:	88 44 24 10          	mov    %al,0x10(%rsp)
   175a3:	48 8d 74 24 0c       	lea    0xc(%rsp),%rsi
   175a8:	48 89 df             	mov    %rbx,%rdi
   175ab:	ff 15 ff 48 04 00    	call   *0x448ff(%rip)        # 5beb0 <_DYNAMIC+0x2d8>
   175b1:	48 89 d8             	mov    %rbx,%rax
   175b4:	48 83 c4 60          	add    $0x60,%rsp
   175b8:	5b                   	pop    %rbx
   175b9:	c3                   	ret
   175ba:	cc                   	int3
   175bb:	cc                   	int3
   175bc:	cc                   	int3
   175bd:	cc                   	int3
   175be:	cc                   	int3
   175bf:	cc                   	int3

hyperinterval_strict_chain64:
   175c0:	53                   	push   %rbx
   175c1:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
   175c8:	48 89 fb             	mov    %rdi,%rbx
   175cb:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   175d0:	ff 15 e2 48 04 00    	call   *0x448e2(%rip)        # 5beb8 <_DYNAMIC+0x2e0>
   175d6:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   175db:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   175e0:	48 83 f9 02          	cmp    $0x2,%rcx
   175e4:	0f 84 32 01 00 00    	je     1771c <hyperinterval_strict_chain64+0x15c>
   175ea:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   175ef:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   175f4:	48 89 b4 24 a8 00 00 	mov    %rsi,0xa8(%rsp)
   175fb:	00 
   175fc:	48 89 94 24 a1 00 00 	mov    %rdx,0xa1(%rsp)
   17603:	00 
   17604:	48 89 8c 24 98 00 00 	mov    %rcx,0x98(%rsp)
   1760b:	00 
   1760c:	88 84 24 a0 00 00 00 	mov    %al,0xa0(%rsp)
   17613:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   17618:	48 8d b4 24 98 00 00 	lea    0x98(%rsp),%rsi
   1761f:	00 
   17620:	f2 0f 10 05 a8 e4 fe 	movsd  -0x11b58(%rip),%xmm0        # 5ad0 <__abi_tag+0x57d4>
   17627:	ff 
   17628:	f2 0f 10 0d b0 e4 fe 	movsd  -0x11b50(%rip),%xmm1        # 5ae0 <__abi_tag+0x57e4>
   1762f:	ff 
   17630:	ff 15 8a 48 04 00    	call   *0x4488a(%rip)        # 5bec0 <_DYNAMIC+0x2e8>
   17636:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1763b:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   17640:	48 83 f9 02          	cmp    $0x2,%rcx
   17644:	0f 84 d2 00 00 00    	je     1771c <hyperinterval_strict_chain64+0x15c>
   1764a:	48 8b 54 24 29       	mov    0x29(%rsp),%rdx
   1764f:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   17654:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
   1765b:	00 
   1765c:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
   17663:	00 
   17664:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
   1766b:	00 
   1766c:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
   17673:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
   17678:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   1767f:	00 
   17680:	ff 15 42 48 04 00    	call   *0x44842(%rip)        # 5bec8 <_DYNAMIC+0x2f0>
   17686:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
   1768b:	0f b6 44 24 70       	movzbl 0x70(%rsp),%eax
   17690:	48 83 f9 02          	cmp    $0x2,%rcx
   17694:	0f 84 82 00 00 00    	je     1771c <hyperinterval_strict_chain64+0x15c>
   1769a:	48 8b 54 24 71       	mov    0x71(%rsp),%rdx
   1769f:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
   176a4:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   176a9:	48 89 54 24 59       	mov    %rdx,0x59(%rsp)
   176ae:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
   176b3:	88 44 24 58          	mov    %al,0x58(%rsp)
   176b7:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   176bc:	f2 0f 10 05 fc e3 fe 	movsd  -0x11c04(%rip),%xmm0        # 5ac0 <__abi_tag+0x57c4>
   176c3:	ff 
   176c4:	ff 15 06 48 04 00    	call   *0x44806(%rip)        # 5bed0 <_DYNAMIC+0x2f8>
   176ca:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   176cf:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   176d4:	48 83 f9 02          	cmp    $0x2,%rcx
   176d8:	74 42                	je     1771c <hyperinterval_strict_chain64+0x15c>
   176da:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   176df:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   176e4:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   176e9:	48 89 54 24 29       	mov    %rdx,0x29(%rsp)
   176ee:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   176f3:	88 44 24 28          	mov    %al,0x28(%rsp)
   176f7:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   176fc:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   17701:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
   17706:	ff 15 cc 47 04 00    	call   *0x447cc(%rip)        # 5bed8 <_DYNAMIC+0x300>
   1770c:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   17711:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   17716:	48 83 f9 02          	cmp    $0x2,%rcx
   1771a:	75 16                	jne    17732 <hyperinterval_strict_chain64+0x172>
   1771c:	88 43 08             	mov    %al,0x8(%rbx)
   1771f:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   17726:	48 89 d8             	mov    %rbx,%rax
   17729:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   17730:	5b                   	pop    %rbx
   17731:	c3                   	ret
   17732:	48 8b 54 24 41       	mov    0x41(%rsp),%rdx
   17737:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
   1773c:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
   17741:	48 89 54 24 11       	mov    %rdx,0x11(%rsp)
   17746:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   1774b:	88 44 24 10          	mov    %al,0x10(%rsp)
   1774f:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
   17754:	48 89 df             	mov    %rbx,%rdi
   17757:	ff 15 83 47 04 00    	call   *0x44783(%rip)        # 5bee0 <_DYNAMIC+0x308>
   1775d:	48 89 d8             	mov    %rbx,%rax
   17760:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   17767:	5b                   	pop    %rbx
   17768:	c3                   	ret
   17769:	cc                   	int3
   1776a:	cc                   	int3
   1776b:	cc                   	int3
   1776c:	cc                   	int3
   1776d:	cc                   	int3
   1776e:	cc                   	int3
   1776f:	cc                   	int3

hyperinterval_strict_surface32:
   17770:	55                   	push   %rbp
   17771:	41 57                	push   %r15
   17773:	41 56                	push   %r14
   17775:	41 55                	push   %r13
   17777:	41 54                	push   %r12
   17779:	53                   	push   %rbx
   1777a:	48 83 ec 78          	sub    $0x78,%rsp
   1777e:	41 89 f6             	mov    %esi,%r14d
   17781:	48 89 fd             	mov    %rdi,%rbp
   17784:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17789:	66 0f 7e 44 24 38    	movd   %xmm0,0x38(%rsp)
   1778f:	66 0f 7e 4c 24 1c    	movd   %xmm1,0x1c(%rsp)
   17795:	ff 15 ed 46 04 00    	call   *0x446ed(%rip)        # 5be88 <_DYNAMIC+0x2b0>
   1779b:	44 8b 7c 24 08       	mov    0x8(%rsp),%r15d
   177a0:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   177a5:	41 83 ff 02          	cmp    $0x2,%r15d
   177a9:	75 05                	jne    177b0 <hyperinterval_strict_surface32+0x40>
   177ab:	88 45 04             	mov    %al,0x4(%rbp)
   177ae:	eb 45                	jmp    177f5 <hyperinterval_strict_surface32+0x85>
   177b0:	8b 4c 24 0d          	mov    0xd(%rsp),%ecx
   177b4:	8b 54 24 10          	mov    0x10(%rsp),%edx
   177b8:	89 54 24 44          	mov    %edx,0x44(%rsp)
   177bc:	89 4c 24 41          	mov    %ecx,0x41(%rsp)
   177c0:	44 89 7c 24 3c       	mov    %r15d,0x3c(%rsp)
   177c5:	88 44 24 40          	mov    %al,0x40(%rsp)
   177c9:	66 0f 6e 44 24 38    	movd   0x38(%rsp),%xmm0
   177cf:	ff 15 13 47 04 00    	call   *0x44713(%rip)        # 5bee8 <_DYNAMIC+0x310>
   177d5:	48 89 c3             	mov    %rax,%rbx
   177d8:	f6 c3 01             	test   $0x1,%bl
   177db:	74 05                	je     177e2 <hyperinterval_strict_surface32+0x72>
   177dd:	88 7d 04             	mov    %bh,0x4(%rbp)
   177e0:	eb 13                	jmp    177f5 <hyperinterval_strict_surface32+0x85>
   177e2:	66 0f 6e 44 24 1c    	movd   0x1c(%rsp),%xmm0
   177e8:	ff 15 02 47 04 00    	call   *0x44702(%rip)        # 5bef0 <_DYNAMIC+0x318>
   177ee:	a8 01                	test   $0x1,%al
   177f0:	74 1c                	je     1780e <hyperinterval_strict_surface32+0x9e>
   177f2:	88 65 04             	mov    %ah,0x4(%rbp)
   177f5:	c7 45 00 02 00 00 00 	movl   $0x2,0x0(%rbp)
   177fc:	48 89 e8             	mov    %rbp,%rax
   177ff:	48 83 c4 78          	add    $0x78,%rsp
   17803:	5b                   	pop    %rbx
   17804:	41 5c                	pop    %r12
   17806:	41 5d                	pop    %r13
   17808:	41 5e                	pop    %r14
   1780a:	41 5f                	pop    %r15
   1780c:	5d                   	pop    %rbp
   1780d:	c3                   	ret
   1780e:	48 c1 eb 20          	shr    $0x20,%rbx
   17812:	66 0f 6e c3          	movd   %ebx,%xmm0
   17816:	48 c1 e8 20          	shr    $0x20,%rax
   1781a:	66 0f 6e c8          	movd   %eax,%xmm1
   1781e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17823:	ff 15 5f 46 04 00    	call   *0x4465f(%rip)        # 5be88 <_DYNAMIC+0x2b0>
   17829:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1782d:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   17832:	83 f9 02             	cmp    $0x2,%ecx
   17835:	0f 84 70 ff ff ff    	je     177ab <hyperinterval_strict_surface32+0x3b>
   1783b:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   1783f:	8b 74 24 10          	mov    0x10(%rsp),%esi
   17843:	89 74 24 5c          	mov    %esi,0x5c(%rsp)
   17847:	89 54 24 59          	mov    %edx,0x59(%rsp)
   1784b:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
   1784f:	88 44 24 58          	mov    %al,0x58(%rsp)
   17853:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17858:	48 8d 74 24 3c       	lea    0x3c(%rsp),%rsi
   1785d:	44 89 f2             	mov    %r14d,%edx
   17860:	ff 15 92 46 04 00    	call   *0x44692(%rip)        # 5bef8 <_DYNAMIC+0x320>
   17866:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1786a:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   1786f:	83 f9 02             	cmp    $0x2,%ecx
   17872:	0f 84 33 ff ff ff    	je     177ab <hyperinterval_strict_surface32+0x3b>
   17878:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   1787c:	8b 74 24 10          	mov    0x10(%rsp),%esi
   17880:	89 74 24 34          	mov    %esi,0x34(%rsp)
   17884:	89 54 24 31          	mov    %edx,0x31(%rsp)
   17888:	89 4c 24 2c          	mov    %ecx,0x2c(%rsp)
   1788c:	88 44 24 30          	mov    %al,0x30(%rsp)
   17890:	48 8d 7c 24 48       	lea    0x48(%rsp),%rdi
   17895:	48 8d 74 24 2c       	lea    0x2c(%rsp),%rsi
   1789a:	ff 15 60 46 04 00    	call   *0x44660(%rip)        # 5bf00 <_DYNAMIC+0x328>
   178a0:	8b 4c 24 48          	mov    0x48(%rsp),%ecx
   178a4:	0f b6 44 24 4c       	movzbl 0x4c(%rsp),%eax
   178a9:	83 f9 02             	cmp    $0x2,%ecx
   178ac:	0f 84 f9 fe ff ff    	je     177ab <hyperinterval_strict_surface32+0x3b>
   178b2:	8b 54 24 4d          	mov    0x4d(%rsp),%edx
   178b6:	8b 74 24 50          	mov    0x50(%rsp),%esi
   178ba:	89 74 24 28          	mov    %esi,0x28(%rsp)
   178be:	89 54 24 25          	mov    %edx,0x25(%rsp)
   178c2:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   178c6:	88 44 24 24          	mov    %al,0x24(%rsp)
   178ca:	48 8d 5c 24 6c       	lea    0x6c(%rsp),%rbx
   178cf:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
   178d4:	48 8d 54 24 54       	lea    0x54(%rsp),%rdx
   178d9:	48 89 df             	mov    %rbx,%rdi
   178dc:	ff 15 26 46 04 00    	call   *0x44626(%rip)        # 5bf08 <_DYNAMIC+0x330>
   178e2:	4c 8d 74 24 60       	lea    0x60(%rsp),%r14
   178e7:	48 8d 54 24 3c       	lea    0x3c(%rsp),%rdx
   178ec:	4c 89 f7             	mov    %r14,%rdi
   178ef:	48 89 de             	mov    %rbx,%rsi
   178f2:	ff 15 18 46 04 00    	call   *0x44618(%rip)        # 5bf10 <_DYNAMIC+0x338>
   178f8:	4c 89 f7             	mov    %r14,%rdi
   178fb:	ff 15 17 46 04 00    	call   *0x44617(%rip)        # 5bf18 <_DYNAMIC+0x340>
   17901:	8b 4c 24 60          	mov    0x60(%rsp),%ecx
   17905:	83 f9 01             	cmp    $0x1,%ecx
   17908:	75 1c                	jne    17926 <hyperinterval_strict_surface32+0x1b6>
   1790a:	8b 74 24 64          	mov    0x64(%rsp),%esi
   1790e:	8b 7c 24 68          	mov    0x68(%rsp),%edi
   17912:	39 fe                	cmp    %edi,%esi
   17914:	0f 94 c2             	sete   %dl
   17917:	66 0f 6e ce          	movd   %esi,%xmm1
   1791b:	66 0f 6e c7          	movd   %edi,%xmm0
   1791f:	be 01 00 00 00       	mov    $0x1,%esi
   17924:	eb 04                	jmp    1792a <hyperinterval_strict_surface32+0x1ba>
   17926:	31 d2                	xor    %edx,%edx
   17928:	31 f6                	xor    %esi,%esi
   1792a:	80 f1 01             	xor    $0x1,%cl
   1792d:	89 74 24 08          	mov    %esi,0x8(%rsp)
   17931:	66 0f 7e 4c 24 0c    	movd   %xmm1,0xc(%rsp)
   17937:	88 4c 24 10          	mov    %cl,0x10(%rsp)
   1793b:	88 54 24 11          	mov    %dl,0x11(%rsp)
   1793f:	88 44 24 12          	mov    %al,0x12(%rsp)
   17943:	89 74 24 14          	mov    %esi,0x14(%rsp)
   17947:	66 0f 7e 44 24 18    	movd   %xmm0,0x18(%rsp)
   1794d:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   17952:	4c 8d 6c 24 60       	lea    0x60(%rsp),%r13
   17957:	4c 8d 74 24 54       	lea    0x54(%rsp),%r14
   1795c:	4c 89 ef             	mov    %r13,%rdi
   1795f:	4c 89 f6             	mov    %r14,%rsi
   17962:	ff 15 b8 45 04 00    	call   *0x445b8(%rip)        # 5bf20 <_DYNAMIC+0x348>
   17968:	88 44 24 1c          	mov    %al,0x1c(%rsp)
   1796c:	4c 89 ef             	mov    %r13,%rdi
   1796f:	4c 89 f6             	mov    %r14,%rsi
   17972:	ff 15 b0 45 04 00    	call   *0x445b0(%rip)        # 5bf28 <_DYNAMIC+0x350>
   17978:	41 89 c6             	mov    %eax,%r14d
   1797b:	4c 8d 64 24 3c       	lea    0x3c(%rsp),%r12
   17980:	4c 89 ef             	mov    %r13,%rdi
   17983:	4c 89 e6             	mov    %r12,%rsi
   17986:	ff 15 a4 45 04 00    	call   *0x445a4(%rip)        # 5bf30 <_DYNAMIC+0x358>
   1798c:	89 c3                	mov    %eax,%ebx
   1798e:	4c 89 ef             	mov    %r13,%rdi
   17991:	4c 89 e6             	mov    %r12,%rsi
   17994:	ff 15 9e 45 04 00    	call   *0x4459e(%rip)        # 5bf38 <_DYNAMIC+0x360>
   1799a:	41 89 c4             	mov    %eax,%r12d
   1799d:	4c 89 ef             	mov    %r13,%rdi
   179a0:	66 0f 6e 44 24 38    	movd   0x38(%rsp),%xmm0
   179a6:	ff 15 74 44 04 00    	call   *0x44474(%rip)        # 5be20 <_DYNAMIC+0x248>
   179ac:	a8 01                	test   $0x1,%al
   179ae:	74 08                	je     179b8 <hyperinterval_strict_surface32+0x248>
   179b0:	88 55 04             	mov    %dl,0x4(%rbp)
   179b3:	e9 3d fe ff ff       	jmp    177f5 <hyperinterval_strict_surface32+0x85>
   179b8:	0f b6 44 24 1c       	movzbl 0x1c(%rsp),%eax
   179bd:	88 44 24 08          	mov    %al,0x8(%rsp)
   179c1:	44 88 74 24 09       	mov    %r14b,0x9(%rsp)
   179c6:	88 5c 24 0a          	mov    %bl,0xa(%rsp)
   179ca:	44 88 64 24 0b       	mov    %r12b,0xb(%rsp)
   179cf:	88 54 24 0c          	mov    %dl,0xc(%rsp)
   179d3:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   179d8:	41 83 ff 01          	cmp    $0x1,%r15d
   179dc:	75 2a                	jne    17a08 <hyperinterval_strict_surface32+0x298>
   179de:	f3 0f 7e 44 24 40    	movq   0x40(%rsp),%xmm0
   179e4:	66 0f ef c9          	pxor   %xmm1,%xmm1
   179e8:	66 0f 6f 15 e0 e1 fe 	movdqa -0x11e20(%rip),%xmm2        # 5bd0 <__abi_tag+0x58d4>
   179ef:	ff 
   179f0:	66 0f ef d0          	pxor   %xmm0,%xmm2
   179f4:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   179f8:	66 0f df ca          	pandn  %xmm2,%xmm1
   179fc:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   17a01:	b8 01 00 00 00       	mov    $0x1,%eax
   17a06:	eb 02                	jmp    17a0a <hyperinterval_strict_surface32+0x29a>
   17a08:	31 c0                	xor    %eax,%eax
   17a0a:	89 44 24 48          	mov    %eax,0x48(%rsp)
   17a0e:	66 0f d6 44 24 4c    	movq   %xmm0,0x4c(%rsp)
   17a14:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17a19:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
   17a1e:	48 8d 54 24 48       	lea    0x48(%rsp),%rdx
   17a23:	ff 15 17 45 04 00    	call   *0x44517(%rip)        # 5bf40 <_DYNAMIC+0x368>
   17a29:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17a2d:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   17a32:	83 f9 02             	cmp    $0x2,%ecx
   17a35:	0f 84 70 fd ff ff    	je     177ab <hyperinterval_strict_surface32+0x3b>
   17a3b:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   17a3f:	8b 74 24 10          	mov    0x10(%rsp),%esi
   17a43:	89 74 24 28          	mov    %esi,0x28(%rsp)
   17a47:	89 54 24 25          	mov    %edx,0x25(%rsp)
   17a4b:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   17a4f:	88 44 24 24          	mov    %al,0x24(%rsp)
   17a53:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17a58:	66 0f 6e 05 e4 e0 fe 	movd   -0x11f1c(%rip),%xmm0        # 5b44 <__abi_tag+0x5848>
   17a5f:	ff 
   17a60:	ff 15 3a 44 04 00    	call   *0x4443a(%rip)        # 5bea0 <_DYNAMIC+0x2c8>
   17a66:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17a6a:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   17a6f:	83 f9 02             	cmp    $0x2,%ecx
   17a72:	0f 84 33 fd ff ff    	je     177ab <hyperinterval_strict_surface32+0x3b>
   17a78:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   17a7c:	8b 74 24 10          	mov    0x10(%rsp),%esi
   17a80:	89 74 24 34          	mov    %esi,0x34(%rsp)
   17a84:	89 54 24 31          	mov    %edx,0x31(%rsp)
   17a88:	89 4c 24 2c          	mov    %ecx,0x2c(%rsp)
   17a8c:	88 44 24 30          	mov    %al,0x30(%rsp)
   17a90:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
   17a95:	48 8d 54 24 2c       	lea    0x2c(%rsp),%rdx
   17a9a:	48 89 ef             	mov    %rbp,%rdi
   17a9d:	ff 15 a5 44 04 00    	call   *0x444a5(%rip)        # 5bf48 <_DYNAMIC+0x370>
   17aa3:	e9 54 fd ff ff       	jmp    177fc <hyperinterval_strict_surface32+0x8c>
   17aa8:	cc                   	int3
   17aa9:	cc                   	int3
   17aaa:	cc                   	int3
   17aab:	cc                   	int3
   17aac:	cc                   	int3
   17aad:	cc                   	int3
   17aae:	cc                   	int3
   17aaf:	cc                   	int3

hyperinterval_strict_surface64:
   17ab0:	55                   	push   %rbp
   17ab1:	41 57                	push   %r15
   17ab3:	41 56                	push   %r14
   17ab5:	41 55                	push   %r13
   17ab7:	41 54                	push   %r12
   17ab9:	53                   	push   %rbx
   17aba:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
   17ac1:	89 f5                	mov    %esi,%ebp
   17ac3:	48 89 fb             	mov    %rdi,%rbx
   17ac6:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17acb:	f2 0f 11 44 24 78    	movsd  %xmm0,0x78(%rsp)
   17ad1:	66 0f d6 4c 24 58    	movq   %xmm1,0x58(%rsp)
   17ad7:	ff 15 db 43 04 00    	call   *0x443db(%rip)        # 5beb8 <_DYNAMIC+0x2e0>
   17add:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   17ae2:	49 83 fc 02          	cmp    $0x2,%r12
   17ae6:	75 07                	jne    17aef <hyperinterval_strict_surface64+0x3f>
   17ae8:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17aed:	eb 63                	jmp    17b52 <hyperinterval_strict_surface64+0xa2>
   17aef:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
   17af4:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
   17af9:	4c 89 a4 24 98 00 00 	mov    %r12,0x98(%rsp)
   17b00:	00 
   17b01:	4c 89 b4 24 a0 00 00 	mov    %r14,0xa0(%rsp)
   17b08:	00 
   17b09:	4c 89 bc 24 a8 00 00 	mov    %r15,0xa8(%rsp)
   17b10:	00 
   17b11:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   17b16:	f2 0f 10 44 24 78    	movsd  0x78(%rsp),%xmm0
   17b1c:	ff 15 2e 44 04 00    	call   *0x4442e(%rip)        # 5bf50 <_DYNAMIC+0x378>
   17b22:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   17b27:	74 24                	je     17b4d <hyperinterval_strict_surface64+0x9d>
   17b29:	f2 0f 10 44 24 40    	movsd  0x40(%rsp),%xmm0
   17b2f:	f2 0f 11 44 24 50    	movsd  %xmm0,0x50(%rsp)
   17b35:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   17b3a:	f2 0f 10 44 24 58    	movsd  0x58(%rsp),%xmm0
   17b40:	ff 15 12 44 04 00    	call   *0x44412(%rip)        # 5bf58 <_DYNAMIC+0x380>
   17b46:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   17b4b:	75 24                	jne    17b71 <hyperinterval_strict_surface64+0xc1>
   17b4d:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
   17b52:	88 43 08             	mov    %al,0x8(%rbx)
   17b55:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   17b5c:	48 89 d8             	mov    %rbx,%rax
   17b5f:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
   17b66:	5b                   	pop    %rbx
   17b67:	41 5c                	pop    %r12
   17b69:	41 5d                	pop    %r13
   17b6b:	41 5e                	pop    %r14
   17b6d:	41 5f                	pop    %r15
   17b6f:	5d                   	pop    %rbp
   17b70:	c3                   	ret
   17b71:	f3 0f 7e 4c 24 40    	movq   0x40(%rsp),%xmm1
   17b77:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17b7c:	f2 0f 10 44 24 50    	movsd  0x50(%rsp),%xmm0
   17b82:	ff 15 30 43 04 00    	call   *0x44330(%rip)        # 5beb8 <_DYNAMIC+0x2e0>
   17b88:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17b8d:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17b92:	48 83 f9 02          	cmp    $0x2,%rcx
   17b96:	74 ba                	je     17b52 <hyperinterval_strict_surface64+0xa2>
   17b98:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   17b9d:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   17ba2:	48 89 b4 24 c0 00 00 	mov    %rsi,0xc0(%rsp)
   17ba9:	00 
   17baa:	48 89 94 24 b9 00 00 	mov    %rdx,0xb9(%rsp)
   17bb1:	00 
   17bb2:	48 89 8c 24 b0 00 00 	mov    %rcx,0xb0(%rsp)
   17bb9:	00 
   17bba:	88 84 24 b8 00 00 00 	mov    %al,0xb8(%rsp)
   17bc1:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17bc6:	48 8d b4 24 98 00 00 	lea    0x98(%rsp),%rsi
   17bcd:	00 
   17bce:	89 ea                	mov    %ebp,%edx
   17bd0:	ff 15 8a 43 04 00    	call   *0x4438a(%rip)        # 5bf60 <_DYNAMIC+0x388>
   17bd6:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17bdb:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17be0:	48 83 f9 02          	cmp    $0x2,%rcx
   17be4:	0f 84 68 ff ff ff    	je     17b52 <hyperinterval_strict_surface64+0xa2>
   17bea:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   17bef:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   17bf4:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
   17bf9:	48 89 54 24 41       	mov    %rdx,0x41(%rsp)
   17bfe:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
   17c03:	88 44 24 40          	mov    %al,0x40(%rsp)
   17c07:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   17c0e:	00 
   17c0f:	48 8d 74 24 38       	lea    0x38(%rsp),%rsi
   17c14:	ff 15 4e 43 04 00    	call   *0x4434e(%rip)        # 5bf68 <_DYNAMIC+0x390>
   17c1a:	48 8b 8c 24 80 00 00 	mov    0x80(%rsp),%rcx
   17c21:	00 
   17c22:	0f b6 84 24 88 00 00 	movzbl 0x88(%rsp),%eax
   17c29:	00 
   17c2a:	48 83 f9 02          	cmp    $0x2,%rcx
   17c2e:	0f 84 1e ff ff ff    	je     17b52 <hyperinterval_strict_surface64+0xa2>
   17c34:	48 8b 94 24 89 00 00 	mov    0x89(%rsp),%rdx
   17c3b:	00 
   17c3c:	48 8b b4 24 90 00 00 	mov    0x90(%rsp),%rsi
   17c43:	00 
   17c44:	48 89 74 24 70       	mov    %rsi,0x70(%rsp)
   17c49:	48 89 54 24 69       	mov    %rdx,0x69(%rsp)
   17c4e:	48 89 4c 24 60       	mov    %rcx,0x60(%rsp)
   17c53:	88 44 24 68          	mov    %al,0x68(%rsp)
   17c57:	48 8d ac 24 e0 00 00 	lea    0xe0(%rsp),%rbp
   17c5e:	00 
   17c5f:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
   17c64:	48 8d 94 24 b0 00 00 	lea    0xb0(%rsp),%rdx
   17c6b:	00 
   17c6c:	48 89 ef             	mov    %rbp,%rdi
   17c6f:	ff 15 fb 42 04 00    	call   *0x442fb(%rip)        # 5bf70 <_DYNAMIC+0x398>
   17c75:	4c 8d ac 24 c8 00 00 	lea    0xc8(%rsp),%r13
   17c7c:	00 
   17c7d:	48 8d 94 24 98 00 00 	lea    0x98(%rsp),%rdx
   17c84:	00 
   17c85:	4c 89 ef             	mov    %r13,%rdi
   17c88:	48 89 ee             	mov    %rbp,%rsi
   17c8b:	ff 15 e7 42 04 00    	call   *0x442e7(%rip)        # 5bf78 <_DYNAMIC+0x3a0>
   17c91:	4c 89 ef             	mov    %r13,%rdi
   17c94:	ff 15 e6 42 04 00    	call   *0x442e6(%rip)        # 5bf80 <_DYNAMIC+0x3a8>
   17c9a:	48 8b 8c 24 c8 00 00 	mov    0xc8(%rsp),%rcx
   17ca1:	00 
   17ca2:	48 83 f9 01          	cmp    $0x1,%rcx
   17ca6:	75 27                	jne    17ccf <hyperinterval_strict_surface64+0x21f>
   17ca8:	48 8b b4 24 d0 00 00 	mov    0xd0(%rsp),%rsi
   17caf:	00 
   17cb0:	48 8b bc 24 d8 00 00 	mov    0xd8(%rsp),%rdi
   17cb7:	00 
   17cb8:	48 39 fe             	cmp    %rdi,%rsi
   17cbb:	0f 94 c2             	sete   %dl
   17cbe:	66 48 0f 6e ce       	movq   %rsi,%xmm1
   17cc3:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   17cc8:	be 01 00 00 00       	mov    $0x1,%esi
   17ccd:	eb 04                	jmp    17cd3 <hyperinterval_strict_surface64+0x223>
   17ccf:	31 d2                	xor    %edx,%edx
   17cd1:	31 f6                	xor    %esi,%esi
   17cd3:	80 f1 01             	xor    $0x1,%cl
   17cd6:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
   17cdb:	66 0f d6 4c 24 18    	movq   %xmm1,0x18(%rsp)
   17ce1:	88 4c 24 20          	mov    %cl,0x20(%rsp)
   17ce5:	88 54 24 21          	mov    %dl,0x21(%rsp)
   17ce9:	88 44 24 22          	mov    %al,0x22(%rsp)
   17ced:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
   17cf2:	66 0f d6 44 24 30    	movq   %xmm0,0x30(%rsp)
   17cf8:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
   17cfd:	4c 8d ac 24 c8 00 00 	lea    0xc8(%rsp),%r13
   17d04:	00 
   17d05:	48 8d ac 24 b0 00 00 	lea    0xb0(%rsp),%rbp
   17d0c:	00 
   17d0d:	4c 89 ef             	mov    %r13,%rdi
   17d10:	48 89 ee             	mov    %rbp,%rsi
   17d13:	ff 15 6f 42 04 00    	call   *0x4426f(%rip)        # 5bf88 <_DYNAMIC+0x3b0>
   17d19:	88 44 24 58          	mov    %al,0x58(%rsp)
   17d1d:	4c 89 ef             	mov    %r13,%rdi
   17d20:	48 89 ee             	mov    %rbp,%rsi
   17d23:	ff 15 67 42 04 00    	call   *0x44267(%rip)        # 5bf90 <_DYNAMIC+0x3b8>
   17d29:	88 44 24 50          	mov    %al,0x50(%rsp)
   17d2d:	48 8d ac 24 98 00 00 	lea    0x98(%rsp),%rbp
   17d34:	00 
   17d35:	4c 89 ef             	mov    %r13,%rdi
   17d38:	48 89 ee             	mov    %rbp,%rsi
   17d3b:	ff 15 57 42 04 00    	call   *0x44257(%rip)        # 5bf98 <_DYNAMIC+0x3c0>
   17d41:	88 44 24 0f          	mov    %al,0xf(%rsp)
   17d45:	4c 89 ef             	mov    %r13,%rdi
   17d48:	48 89 ee             	mov    %rbp,%rsi
   17d4b:	ff 15 4f 42 04 00    	call   *0x4424f(%rip)        # 5bfa0 <_DYNAMIC+0x3c8>
   17d51:	89 c5                	mov    %eax,%ebp
   17d53:	4c 89 ef             	mov    %r13,%rdi
   17d56:	f2 0f 10 44 24 78    	movsd  0x78(%rsp),%xmm0
   17d5c:	ff 15 b6 40 04 00    	call   *0x440b6(%rip)        # 5be18 <_DYNAMIC+0x240>
   17d62:	a8 01                	test   $0x1,%al
   17d64:	74 08                	je     17d6e <hyperinterval_strict_surface64+0x2be>
   17d66:	88 53 08             	mov    %dl,0x8(%rbx)
   17d69:	e9 e7 fd ff ff       	jmp    17b55 <hyperinterval_strict_surface64+0xa5>
   17d6e:	0f b6 44 24 58       	movzbl 0x58(%rsp),%eax
   17d73:	88 44 24 10          	mov    %al,0x10(%rsp)
   17d77:	0f b6 44 24 50       	movzbl 0x50(%rsp),%eax
   17d7c:	88 44 24 11          	mov    %al,0x11(%rsp)
   17d80:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
   17d85:	88 44 24 12          	mov    %al,0x12(%rsp)
   17d89:	40 88 6c 24 13       	mov    %bpl,0x13(%rsp)
   17d8e:	88 54 24 14          	mov    %dl,0x14(%rsp)
   17d92:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
   17d97:	41 83 fc 01          	cmp    $0x1,%r12d
   17d9b:	75 28                	jne    17dc5 <hyperinterval_strict_surface64+0x315>
   17d9d:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   17da4:	00 00 80 
   17da7:	4c 89 f9             	mov    %r15,%rcx
   17daa:	48 31 c1             	xor    %rax,%rcx
   17dad:	4d 85 ff             	test   %r15,%r15
   17db0:	49 0f 44 cf          	cmove  %r15,%rcx
   17db4:	4c 31 f0             	xor    %r14,%rax
   17db7:	4d 85 f6             	test   %r14,%r14
   17dba:	49 0f 44 c6          	cmove  %r14,%rax
   17dbe:	ba 01 00 00 00       	mov    $0x1,%edx
   17dc3:	eb 02                	jmp    17dc7 <hyperinterval_strict_surface64+0x317>
   17dc5:	31 d2                	xor    %edx,%edx
   17dc7:	48 89 94 24 80 00 00 	mov    %rdx,0x80(%rsp)
   17dce:	00 
   17dcf:	48 89 8c 24 88 00 00 	mov    %rcx,0x88(%rsp)
   17dd6:	00 
   17dd7:	48 89 84 24 90 00 00 	mov    %rax,0x90(%rsp)
   17dde:	00 
   17ddf:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17de4:	48 8d b4 24 c8 00 00 	lea    0xc8(%rsp),%rsi
   17deb:	00 
   17dec:	48 8d 94 24 80 00 00 	lea    0x80(%rsp),%rdx
   17df3:	00 
   17df4:	ff 15 ae 41 04 00    	call   *0x441ae(%rip)        # 5bfa8 <_DYNAMIC+0x3d0>
   17dfa:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17dff:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17e04:	48 83 f9 02          	cmp    $0x2,%rcx
   17e08:	0f 84 44 fd ff ff    	je     17b52 <hyperinterval_strict_surface64+0xa2>
   17e0e:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   17e13:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   17e18:	48 89 74 24 70       	mov    %rsi,0x70(%rsp)
   17e1d:	48 89 54 24 69       	mov    %rdx,0x69(%rsp)
   17e22:	48 89 4c 24 60       	mov    %rcx,0x60(%rsp)
   17e27:	88 44 24 68          	mov    %al,0x68(%rsp)
   17e2b:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17e30:	f2 0f 10 05 78 dc fe 	movsd  -0x12388(%rip),%xmm0        # 5ab0 <__abi_tag+0x57b4>
   17e37:	ff 
   17e38:	ff 15 92 40 04 00    	call   *0x44092(%rip)        # 5bed0 <_DYNAMIC+0x2f8>
   17e3e:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17e43:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17e48:	48 83 f9 02          	cmp    $0x2,%rcx
   17e4c:	0f 84 00 fd ff ff    	je     17b52 <hyperinterval_strict_surface64+0xa2>
   17e52:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   17e57:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   17e5c:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
   17e61:	48 89 54 24 41       	mov    %rdx,0x41(%rsp)
   17e66:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
   17e6b:	88 44 24 40          	mov    %al,0x40(%rsp)
   17e6f:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
   17e74:	48 8d 54 24 38       	lea    0x38(%rsp),%rdx
   17e79:	48 89 df             	mov    %rbx,%rdi
   17e7c:	ff 15 2e 41 04 00    	call   *0x4412e(%rip)        # 5bfb0 <_DYNAMIC+0x3d8>
   17e82:	e9 d5 fc ff ff       	jmp    17b5c <hyperinterval_strict_surface64+0xac>
   17e87:	cc                   	int3
   17e88:	cc                   	int3
   17e89:	cc                   	int3
   17e8a:	cc                   	int3
   17e8b:	cc                   	int3
   17e8c:	cc                   	int3
   17e8d:	cc                   	int3
   17e8e:	cc                   	int3
   17e8f:	cc                   	int3

<hyperinterval::ieee::Format>::finite:
   17ee0:	48 89 c8             	mov    %rcx,%rax
   17ee3:	48 f7 d0             	not    %rax
   17ee6:	48 85 d0             	test   %rdx,%rax
   17ee9:	75 09                	jne    17ef4 <<hyperinterval::ieee::Format>::finite+0x14>
   17eeb:	c6 47 01 00          	movb   $0x0,0x1(%rdi)
   17eef:	b0 01                	mov    $0x1,%al
   17ef1:	88 07                	mov    %al,(%rdi)
   17ef3:	c3                   	ret
   17ef4:	48 ff ce             	dec    %rsi
   17ef7:	48 85 f1             	test   %rsi,%rcx
   17efa:	74 09                	je     17f05 <<hyperinterval::ieee::Format>::finite+0x25>
   17efc:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   17f00:	31 c0                	xor    %eax,%eax
   17f02:	88 07                	mov    %al,(%rdi)
   17f04:	c3                   	ret
   17f05:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
   17f0c:	00 
   17f0d:	31 c0                	xor    %eax,%eax
   17f0f:	88 07                	mov    %al,(%rdi)
   17f11:	c3                   	ret
   17f12:	cc                   	int3
   17f13:	cc                   	int3
   17f14:	cc                   	int3
   17f15:	cc                   	int3
   17f16:	cc                   	int3
   17f17:	cc                   	int3
   17f18:	cc                   	int3
   17f19:	cc                   	int3
   17f1a:	cc                   	int3
   17f1b:	cc                   	int3
   17f1c:	cc                   	int3
   17f1d:	cc                   	int3
   17f1e:	cc                   	int3
   17f1f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::reciprocal:
   17f20:	41 57                	push   %r15
   17f22:	41 56                	push   %r14
   17f24:	41 54                	push   %r12
   17f26:	53                   	push   %rbx
   17f27:	48 83 ec 28          	sub    $0x28,%rsp
   17f2b:	48 89 fb             	mov    %rdi,%rbx
   17f2e:	83 3e 00             	cmpl   $0x0,(%rsi)
   17f31:	74 5e                	je     17f91 <<hyperinterval::float::F32Enclosure>::reciprocal+0x71>
   17f33:	49 89 f6             	mov    %rsi,%r14
   17f36:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   17f3c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17f41:	be 00 00 00 80       	mov    $0x80000000,%esi
   17f46:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17f4b:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   17f50:	e8 8b ff ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   17f55:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   17f5a:	74 25                	je     17f81 <<hyperinterval::float::F32Enclosure>::reciprocal+0x61>
   17f5c:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   17f61:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17f66:	be 00 00 00 80       	mov    $0x80000000,%esi
   17f6b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17f70:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   17f75:	e8 66 ff ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   17f7a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   17f7f:	75 25                	jne    17fa6 <<hyperinterval::float::F32Enclosure>::reciprocal+0x86>
   17f81:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   17f86:	88 4b 04             	mov    %cl,0x4(%rbx)
   17f89:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17f8f:	eb 06                	jmp    17f97 <<hyperinterval::float::F32Enclosure>::reciprocal+0x77>
   17f91:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   17f97:	48 89 d8             	mov    %rbx,%rax
   17f9a:	48 83 c4 28          	add    $0x28,%rsp
   17f9e:	5b                   	pop    %rbx
   17f9f:	41 5c                	pop    %r12
   17fa1:	41 5e                	pop    %r14
   17fa3:	41 5f                	pop    %r15
   17fa5:	c3                   	ret
   17fa6:	8b 44 24 10          	mov    0x10(%rsp),%eax
   17faa:	44 89 e1             	mov    %r12d,%ecx
   17fad:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   17fb3:	89 c2                	mov    %eax,%edx
   17fb5:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   17fbb:	be 00 00 00 80       	mov    $0x80000000,%esi
   17fc0:	29 ce                	sub    %ecx,%esi
   17fc2:	44 09 f9             	or     %r15d,%ecx
   17fc5:	45 85 e4             	test   %r12d,%r12d
   17fc8:	48 0f 49 f1          	cmovns %rcx,%rsi
   17fcc:	89 d1                	mov    %edx,%ecx
   17fce:	44 09 f9             	or     %r15d,%ecx
   17fd1:	41 29 d7             	sub    %edx,%r15d
   17fd4:	85 c0                	test   %eax,%eax
   17fd6:	4c 0f 49 f9          	cmovns %rcx,%r15
   17fda:	b1 01                	mov    $0x1,%cl
   17fdc:	44 39 fe             	cmp    %r15d,%esi
   17fdf:	77 a5                	ja     17f86 <<hyperinterval::float::F32Enclosure>::reciprocal+0x66>
   17fe1:	44 89 e1             	mov    %r12d,%ecx
   17fe4:	c1 e9 08             	shr    $0x8,%ecx
   17fe7:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%rsp)
   17fee:	00 
   17fef:	44 88 64 24 20       	mov    %r12b,0x20(%rsp)
   17ff4:	41 c1 ec 18          	shr    $0x18,%r12d
   17ff8:	44 88 64 24 23       	mov    %r12b,0x23(%rsp)
   17ffd:	66 89 4c 24 21       	mov    %cx,0x21(%rsp)
   18002:	89 44 24 24          	mov    %eax,0x24(%rsp)
   18006:	41 83 7e 04 00       	cmpl   $0x0,0x4(%r14)
   1800b:	7f 15                	jg     18022 <<hyperinterval::float::F32Enclosure>::reciprocal+0x102>
   1800d:	41 8b 46 08          	mov    0x8(%r14),%eax
   18011:	85 c0                	test   %eax,%eax
   18013:	0f 99 c1             	setns  %cl
   18016:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   1801b:	0f 94 c0             	sete   %al
   1801e:	08 c8                	or     %cl,%al
   18020:	75 1a                	jne    1803c <<hyperinterval::float::F32Enclosure>::reciprocal+0x11c>
   18022:	48 8d 74 24 1c       	lea    0x1c(%rsp),%rsi
   18027:	48 89 df             	mov    %rbx,%rdi
   1802a:	4c 89 f2             	mov    %r14,%rdx
   1802d:	b9 01 00 00 00       	mov    $0x1,%ecx
   18032:	e8 e9 02 00 00       	call   18320 <<hyperinterval::float::F32Enclosure>::corner_image>
   18037:	e9 5b ff ff ff       	jmp    17f97 <<hyperinterval::float::F32Enclosure>::reciprocal+0x77>
   1803c:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
   18040:	e9 44 ff ff ff       	jmp    17f89 <<hyperinterval::float::F32Enclosure>::reciprocal+0x69>
   18045:	cc                   	int3
   18046:	cc                   	int3
   18047:	cc                   	int3
   18048:	cc                   	int3
   18049:	cc                   	int3
   1804a:	cc                   	int3
   1804b:	cc                   	int3
   1804c:	cc                   	int3
   1804d:	cc                   	int3
   1804e:	cc                   	int3
   1804f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::checked_pow:
   18050:	55                   	push   %rbp
   18051:	41 57                	push   %r15
   18053:	41 56                	push   %r14
   18055:	41 55                	push   %r13
   18057:	41 54                	push   %r12
   18059:	53                   	push   %rbx
   1805a:	48 83 ec 58          	sub    $0x58,%rsp
   1805e:	48 89 fb             	mov    %rdi,%rbx
   18061:	83 fa 02             	cmp    $0x2,%edx
   18064:	75 0b                	jne    18071 <<hyperinterval::float::F32Enclosure>::checked_pow+0x21>
   18066:	48 89 df             	mov    %rbx,%rdi
   18069:	ff 15 29 3e 04 00    	call   *0x43e29(%rip)        # 5be98 <_DYNAMIC+0x2c0>
   1806f:	eb 78                	jmp    180e9 <<hyperinterval::float::F32Enclosure>::checked_pow+0x99>
   18071:	f6 06 01             	testb  $0x1,(%rsi)
   18074:	74 6d                	je     180e3 <<hyperinterval::float::F32Enclosure>::checked_pow+0x93>
   18076:	89 d5                	mov    %edx,%ebp
   18078:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   1807e:	8b 4e 04             	mov    0x4(%rsi),%ecx
   18081:	48 89 74 24 50       	mov    %rsi,0x50(%rsp)
   18086:	44 8b 7e 08          	mov    0x8(%rsi),%r15d
   1808a:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1808f:	be 00 00 00 80       	mov    $0x80000000,%esi
   18094:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18099:	41 89 e8             	mov    %ebp,%r8d
   1809c:	e8 6f 21 00 00       	call   1a210 <<hyperinterval::ieee::Format>::power>
   180a1:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   180a6:	75 2b                	jne    180d3 <<hyperinterval::float::F32Enclosure>::checked_pow+0x83>
   180a8:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   180ad:	44 8b 6c 24 18       	mov    0x18(%rsp),%r13d
   180b2:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   180b7:	be 00 00 00 80       	mov    $0x80000000,%esi
   180bc:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   180c1:	4c 89 f9             	mov    %r15,%rcx
   180c4:	41 89 e8             	mov    %ebp,%r8d
   180c7:	e8 44 21 00 00       	call   1a210 <<hyperinterval::ieee::Format>::power>
   180cc:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   180d1:	75 28                	jne    180fb <<hyperinterval::float::F32Enclosure>::checked_pow+0xab>
   180d3:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   180d8:	88 43 04             	mov    %al,0x4(%rbx)
   180db:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   180e1:	eb 06                	jmp    180e9 <<hyperinterval::float::F32Enclosure>::checked_pow+0x99>
   180e3:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   180e9:	48 89 d8             	mov    %rbx,%rax
   180ec:	48 83 c4 58          	add    $0x58,%rsp
   180f0:	5b                   	pop    %rbx
   180f1:	41 5c                	pop    %r12
   180f3:	41 5d                	pop    %r13
   180f5:	41 5e                	pop    %r14
   180f7:	41 5f                	pop    %r15
   180f9:	5d                   	pop    %rbp
   180fa:	c3                   	ret
   180fb:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   18100:	8b 44 24 18          	mov    0x18(%rsp),%eax
   18104:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   18109:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1810e:	be 00 00 00 80       	mov    $0x80000000,%esi
   18113:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18118:	4c 89 e1             	mov    %r12,%rcx
   1811b:	e8 c0 fd ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   18120:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18125:	74 23                	je     1814a <<hyperinterval::float::F32Enclosure>::checked_pow+0xfa>
   18127:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1812c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18131:	be 00 00 00 80       	mov    $0x80000000,%esi
   18136:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1813b:	4c 89 e9             	mov    %r13,%rcx
   1813e:	e8 9d fd ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   18143:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18148:	75 10                	jne    1815a <<hyperinterval::float::F32Enclosure>::checked_pow+0x10a>
   1814a:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   1814f:	88 4b 04             	mov    %cl,0x4(%rbx)
   18152:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18158:	eb 8f                	jmp    180e9 <<hyperinterval::float::F32Enclosure>::checked_pow+0x99>
   1815a:	8b 44 24 10          	mov    0x10(%rsp),%eax
   1815e:	44 89 e1             	mov    %r12d,%ecx
   18161:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18167:	89 c2                	mov    %eax,%edx
   18169:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1816f:	be 00 00 00 80       	mov    $0x80000000,%esi
   18174:	29 ce                	sub    %ecx,%esi
   18176:	44 09 f1             	or     %r14d,%ecx
   18179:	45 85 e4             	test   %r12d,%r12d
   1817c:	48 0f 49 f1          	cmovns %rcx,%rsi
   18180:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18185:	29 d7                	sub    %edx,%edi
   18187:	89 d1                	mov    %edx,%ecx
   18189:	44 09 f1             	or     %r14d,%ecx
   1818c:	85 c0                	test   %eax,%eax
   1818e:	48 0f 49 f9          	cmovns %rcx,%rdi
   18192:	b1 01                	mov    $0x1,%cl
   18194:	39 fe                	cmp    %edi,%esi
   18196:	77 b7                	ja     1814f <<hyperinterval::float::F32Enclosure>::checked_pow+0xff>
   18198:	44 89 e1             	mov    %r12d,%ecx
   1819b:	c1 e9 08             	shr    $0x8,%ecx
   1819e:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%rsp)
   181a5:	00 
   181a6:	44 88 64 24 30       	mov    %r12b,0x30(%rsp)
   181ab:	41 c1 ec 18          	shr    $0x18,%r12d
   181af:	44 88 64 24 33       	mov    %r12b,0x33(%rsp)
   181b4:	66 89 4c 24 31       	mov    %cx,0x31(%rsp)
   181b9:	89 44 24 34          	mov    %eax,0x34(%rsp)
   181bd:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   181c2:	be 00 00 00 80       	mov    $0x80000000,%esi
   181c7:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   181cc:	4c 89 f9             	mov    %r15,%rcx
   181cf:	e8 0c fd ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   181d4:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   181d9:	0f 84 6b ff ff ff    	je     1814a <<hyperinterval::float::F32Enclosure>::checked_pow+0xfa>
   181df:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   181e4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   181e9:	be 00 00 00 80       	mov    $0x80000000,%esi
   181ee:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   181f3:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   181f8:	e8 e3 fc ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   181fd:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18202:	0f 84 42 ff ff ff    	je     1814a <<hyperinterval::float::F32Enclosure>::checked_pow+0xfa>
   18208:	8b 44 24 10          	mov    0x10(%rsp),%eax
   1820c:	44 89 f9             	mov    %r15d,%ecx
   1820f:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18215:	89 c2                	mov    %eax,%edx
   18217:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1821d:	be 00 00 00 80       	mov    $0x80000000,%esi
   18222:	29 ce                	sub    %ecx,%esi
   18224:	44 09 f1             	or     %r14d,%ecx
   18227:	45 85 ff             	test   %r15d,%r15d
   1822a:	48 0f 49 f1          	cmovns %rcx,%rsi
   1822e:	89 d1                	mov    %edx,%ecx
   18230:	44 09 f1             	or     %r14d,%ecx
   18233:	41 29 d6             	sub    %edx,%r14d
   18236:	85 c0                	test   %eax,%eax
   18238:	4c 0f 49 f1          	cmovns %rcx,%r14
   1823c:	b1 01                	mov    $0x1,%cl
   1823e:	44 39 f6             	cmp    %r14d,%esi
   18241:	0f 87 08 ff ff ff    	ja     1814f <<hyperinterval::float::F32Enclosure>::checked_pow+0xff>
   18247:	44 89 f9             	mov    %r15d,%ecx
   1824a:	c1 e9 08             	shr    $0x8,%ecx
   1824d:	c7 44 24 20 01 00 00 	movl   $0x1,0x20(%rsp)
   18254:	00 
   18255:	44 88 7c 24 24       	mov    %r15b,0x24(%rsp)
   1825a:	41 c1 ef 18          	shr    $0x18,%r15d
   1825e:	44 88 7c 24 27       	mov    %r15b,0x27(%rsp)
   18263:	66 89 4c 24 25       	mov    %cx,0x25(%rsp)
   18268:	89 44 24 28          	mov    %eax,0x28(%rsp)
   1826c:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   18271:	48 8d 74 24 2c       	lea    0x2c(%rsp),%rsi
   18276:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
   1827b:	ff 15 8f 3c 04 00    	call   *0x43c8f(%rip)        # 5bf10 <_DYNAMIC+0x338>
   18281:	85 ed                	test   %ebp,%ebp
   18283:	0f 95 c0             	setne  %al
   18286:	40 f6 c5 01          	test   $0x1,%bpl
   1828a:	0f 94 c1             	sete   %cl
   1828d:	84 c8                	test   %cl,%al
   1828f:	74 6e                	je     182ff <<hyperinterval::float::F32Enclosure>::checked_pow+0x2af>
   18291:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   18296:	ff 15 7c 3c 04 00    	call   *0x43c7c(%rip)        # 5bf18 <_DYNAMIC+0x340>
   1829c:	a8 02                	test   $0x2,%al
   1829e:	74 5f                	je     182ff <<hyperinterval::float::F32Enclosure>::checked_pow+0x2af>
   182a0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   182a5:	31 f6                	xor    %esi,%esi
   182a7:	31 d2                	xor    %edx,%edx
   182a9:	e8 92 16 00 00       	call   19940 <<hyperinterval::float::F32Enclosure>::from_bits>
   182ae:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   182b2:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   182b7:	83 f9 02             	cmp    $0x2,%ecx
   182ba:	0f 84 18 fe ff ff    	je     180d8 <<hyperinterval::float::F32Enclosure>::checked_pow+0x88>
   182c0:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   182c4:	8b 74 24 10          	mov    0x10(%rsp),%esi
   182c8:	89 74 24 28          	mov    %esi,0x28(%rsp)
   182cc:	89 54 24 25          	mov    %edx,0x25(%rsp)
   182d0:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   182d4:	88 44 24 24          	mov    %al,0x24(%rsp)
   182d8:	48 8d 7c 24 2c       	lea    0x2c(%rsp),%rdi
   182dd:	48 8d 74 24 38       	lea    0x38(%rsp),%rsi
   182e2:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
   182e7:	ff 15 23 3c 04 00    	call   *0x43c23(%rip)        # 5bf10 <_DYNAMIC+0x338>
   182ed:	8b 44 24 34          	mov    0x34(%rsp),%eax
   182f1:	89 44 24 40          	mov    %eax,0x40(%rsp)
   182f5:	48 8b 44 24 2c       	mov    0x2c(%rsp),%rax
   182fa:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   182ff:	8b 44 24 40          	mov    0x40(%rsp),%eax
   18303:	89 43 08             	mov    %eax,0x8(%rbx)
   18306:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   1830b:	48 89 03             	mov    %rax,(%rbx)
   1830e:	e9 d6 fd ff ff       	jmp    180e9 <<hyperinterval::float::F32Enclosure>::checked_pow+0x99>
   18313:	cc                   	int3
   18314:	cc                   	int3
   18315:	cc                   	int3
   18316:	cc                   	int3
   18317:	cc                   	int3
   18318:	cc                   	int3
   18319:	cc                   	int3
   1831a:	cc                   	int3
   1831b:	cc                   	int3
   1831c:	cc                   	int3
   1831d:	cc                   	int3
   1831e:	cc                   	int3
   1831f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::corner_image:
   18320:	55                   	push   %rbp
   18321:	41 57                	push   %r15
   18323:	41 56                	push   %r14
   18325:	41 55                	push   %r13
   18327:	41 54                	push   %r12
   18329:	53                   	push   %rbx
   1832a:	48 83 ec 58          	sub    $0x58,%rsp
   1832e:	48 89 fb             	mov    %rdi,%rbx
   18331:	f6 06 01             	testb  $0x1,(%rsi)
   18334:	74 53                	je     18389 <<hyperinterval::float::F32Enclosure>::corner_image+0x69>
   18336:	f6 02 01             	testb  $0x1,(%rdx)
   18339:	74 4e                	je     18389 <<hyperinterval::float::F32Enclosure>::corner_image+0x69>
   1833b:	44 8b 62 04          	mov    0x4(%rdx),%r12d
   1833f:	8b 42 08             	mov    0x8(%rdx),%eax
   18342:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   18347:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
   1834b:	8b 46 08             	mov    0x8(%rsi),%eax
   1834e:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   18353:	41 89 cf             	mov    %ecx,%r15d
   18356:	84 c9                	test   %cl,%cl
   18358:	74 3a                	je     18394 <<hyperinterval::float::F32Enclosure>::corner_image+0x74>
   1835a:	48 89 e7             	mov    %rsp,%rdi
   1835d:	be 00 00 00 80       	mov    $0x80000000,%esi
   18362:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18367:	4c 89 e9             	mov    %r13,%rcx
   1836a:	4d 89 e0             	mov    %r12,%r8
   1836d:	e8 5e 1a 00 00       	call   19dd0 <<hyperinterval::ieee::Format>::div>
   18372:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18376:	0f 85 fc 00 00 00    	jne    18478 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   1837c:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18380:	8b 6c 24 10          	mov    0x10(%rsp),%ebp
   18384:	e9 b7 00 00 00       	jmp    18440 <<hyperinterval::float::F32Enclosure>::corner_image+0x120>
   18389:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   1838f:	e9 f3 00 00 00       	jmp    18487 <<hyperinterval::float::F32Enclosure>::corner_image+0x167>
   18394:	44 89 e8             	mov    %r13d,%eax
   18397:	c1 e8 17             	shr    $0x17,%eax
   1839a:	0f b6 c0             	movzbl %al,%eax
   1839d:	44 89 e9             	mov    %r13d,%ecx
   183a0:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   183a6:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   183ad:	8d b0 6a ff ff ff    	lea    -0x96(%rax),%esi
   183b3:	85 c0                	test   %eax,%eax
   183b5:	b8 6b ff ff ff       	mov    $0xffffff6b,%eax
   183ba:	0f 44 f0             	cmove  %eax,%esi
   183bd:	48 0f 44 d1          	cmove  %rcx,%rdx
   183c1:	44 89 e1             	mov    %r12d,%ecx
   183c4:	c1 e9 17             	shr    $0x17,%ecx
   183c7:	0f b6 c9             	movzbl %cl,%ecx
   183ca:	44 89 ef             	mov    %r13d,%edi
   183cd:	44 31 e7             	xor    %r12d,%edi
   183d0:	45 89 e0             	mov    %r12d,%r8d
   183d3:	41 81 e0 ff ff 7f 00 	and    $0x7fffff,%r8d
   183da:	4d 8d 88 00 00 80 00 	lea    0x800000(%r8),%r9
   183e1:	44 8d 91 6a ff ff ff 	lea    -0x96(%rcx),%r10d
   183e8:	85 c9                	test   %ecx,%ecx
   183ea:	44 0f 44 d0          	cmove  %eax,%r10d
   183ee:	4d 0f 44 c8          	cmove  %r8,%r9
   183f2:	4c 0f af ca          	imul   %rdx,%r9
   183f6:	41 01 f2             	add    %esi,%r10d
   183f9:	c1 ef 1f             	shr    $0x1f,%edi
   183fc:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
   18401:	4c 89 0c 24          	mov    %r9,(%rsp)
   18405:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   1840c:	00 00 
   1840e:	44 89 54 24 10       	mov    %r10d,0x10(%rsp)
   18413:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   18418:	48 89 e1             	mov    %rsp,%rcx
   1841b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18420:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18425:	e8 06 26 00 00       	call   1aa30 <<hyperinterval::ieee::Format>::rounded>
   1842a:	80 7c 24 20 00       	cmpb   $0x0,0x20(%rsp)
   1842f:	74 07                	je     18438 <<hyperinterval::float::F32Enclosure>::corner_image+0x118>
   18431:	0f b6 6c 24 21       	movzbl 0x21(%rsp),%ebp
   18436:	eb 45                	jmp    1847d <<hyperinterval::float::F32Enclosure>::corner_image+0x15d>
   18438:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
   1843c:	8b 6c 24 30          	mov    0x30(%rsp),%ebp
   18440:	48 89 e7             	mov    %rsp,%rdi
   18443:	be 00 00 00 80       	mov    $0x80000000,%esi
   18448:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1844d:	e8 8e fa ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   18452:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18456:	75 20                	jne    18478 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   18458:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   1845d:	48 89 e7             	mov    %rsp,%rdi
   18460:	be 00 00 00 80       	mov    $0x80000000,%esi
   18465:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1846a:	48 89 e9             	mov    %rbp,%rcx
   1846d:	e8 6e fa ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   18472:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18476:	74 1e                	je     18496 <<hyperinterval::float::F32Enclosure>::corner_image+0x176>
   18478:	0f b6 6c 24 01       	movzbl 0x1(%rsp),%ebp
   1847d:	40 88 6b 04          	mov    %bpl,0x4(%rbx)
   18481:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18487:	48 83 c4 58          	add    $0x58,%rsp
   1848b:	5b                   	pop    %rbx
   1848c:	41 5c                	pop    %r12
   1848e:	41 5d                	pop    %r13
   18490:	41 5e                	pop    %r14
   18492:	41 5f                	pop    %r15
   18494:	5d                   	pop    %rbp
   18495:	c3                   	ret
   18496:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   1849b:	44 89 f0             	mov    %r14d,%eax
   1849e:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   184a3:	89 f9                	mov    %edi,%ecx
   184a5:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   184ab:	ba 00 00 00 80       	mov    $0x80000000,%edx
   184b0:	29 c2                	sub    %eax,%edx
   184b2:	be 00 00 00 80       	mov    $0x80000000,%esi
   184b7:	09 f0                	or     %esi,%eax
   184b9:	45 85 f6             	test   %r14d,%r14d
   184bc:	48 0f 49 d0          	cmovns %rax,%rdx
   184c0:	b8 00 00 00 80       	mov    $0x80000000,%eax
   184c5:	29 c8                	sub    %ecx,%eax
   184c7:	09 f1                	or     %esi,%ecx
   184c9:	85 ff                	test   %edi,%edi
   184cb:	48 0f 49 c1          	cmovns %rcx,%rax
   184cf:	40 b5 01             	mov    $0x1,%bpl
   184d2:	39 c2                	cmp    %eax,%edx
   184d4:	77 a7                	ja     1847d <<hyperinterval::float::F32Enclosure>::corner_image+0x15d>
   184d6:	48 89 7c 24 50       	mov    %rdi,0x50(%rsp)
   184db:	45 84 ff             	test   %r15b,%r15b
   184de:	74 2d                	je     1850d <<hyperinterval::float::F32Enclosure>::corner_image+0x1ed>
   184e0:	48 89 e7             	mov    %rsp,%rdi
   184e3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   184e8:	4c 89 e9             	mov    %r13,%rcx
   184eb:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
   184f0:	e8 db 18 00 00       	call   19dd0 <<hyperinterval::ieee::Format>::div>
   184f5:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   184f9:	0f 85 79 ff ff ff    	jne    18478 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   184ff:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18503:	44 8b 6c 24 10       	mov    0x10(%rsp),%r13d
   18508:	e9 ac 00 00 00       	jmp    185b9 <<hyperinterval::float::F32Enclosure>::corner_image+0x299>
   1850d:	44 89 e8             	mov    %r13d,%eax
   18510:	c1 e8 17             	shr    $0x17,%eax
   18513:	0f b6 c0             	movzbl %al,%eax
   18516:	44 89 e9             	mov    %r13d,%ecx
   18519:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   1851f:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   18526:	8d b0 6a ff ff ff    	lea    -0x96(%rax),%esi
   1852c:	85 c0                	test   %eax,%eax
   1852e:	b8 6b ff ff ff       	mov    $0xffffff6b,%eax
   18533:	0f 44 f0             	cmove  %eax,%esi
   18536:	48 0f 44 d1          	cmove  %rcx,%rdx
   1853a:	4c 8b 54 24 40       	mov    0x40(%rsp),%r10
   1853f:	44 89 d1             	mov    %r10d,%ecx
   18542:	c1 e9 17             	shr    $0x17,%ecx
   18545:	0f b6 c9             	movzbl %cl,%ecx
   18548:	44 89 d7             	mov    %r10d,%edi
   1854b:	81 e7 ff ff 7f 00    	and    $0x7fffff,%edi
   18551:	4c 8d 87 00 00 80 00 	lea    0x800000(%rdi),%r8
   18558:	44 8d 89 6a ff ff ff 	lea    -0x96(%rcx),%r9d
   1855f:	85 c9                	test   %ecx,%ecx
   18561:	44 0f 44 c8          	cmove  %eax,%r9d
   18565:	4c 0f 44 c7          	cmove  %rdi,%r8
   18569:	45 31 d5             	xor    %r10d,%r13d
   1856c:	4c 0f af c2          	imul   %rdx,%r8
   18570:	41 01 f1             	add    %esi,%r9d
   18573:	41 c1 ed 1f          	shr    $0x1f,%r13d
   18577:	44 88 6c 24 14       	mov    %r13b,0x14(%rsp)
   1857c:	4c 89 04 24          	mov    %r8,(%rsp)
   18580:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   18587:	00 00 
   18589:	44 89 4c 24 10       	mov    %r9d,0x10(%rsp)
   1858e:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   18593:	48 89 e1             	mov    %rsp,%rcx
   18596:	be 00 00 00 80       	mov    $0x80000000,%esi
   1859b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   185a0:	e8 8b 24 00 00       	call   1aa30 <<hyperinterval::ieee::Format>::rounded>
   185a5:	80 7c 24 20 00       	cmpb   $0x0,0x20(%rsp)
   185aa:	0f 85 81 fe ff ff    	jne    18431 <<hyperinterval::float::F32Enclosure>::corner_image+0x111>
   185b0:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
   185b4:	44 8b 6c 24 30       	mov    0x30(%rsp),%r13d
   185b9:	48 89 e7             	mov    %rsp,%rdi
   185bc:	be 00 00 00 80       	mov    $0x80000000,%esi
   185c1:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   185c6:	e8 15 f9 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   185cb:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   185cf:	0f 84 a3 fe ff ff    	je     18478 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   185d5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   185da:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   185df:	48 89 e7             	mov    %rsp,%rdi
   185e2:	be 00 00 00 80       	mov    $0x80000000,%esi
   185e7:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   185ec:	4c 89 e9             	mov    %r13,%rcx
   185ef:	e8 ec f8 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   185f4:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   185f8:	0f 84 7a fe ff ff    	je     18478 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   185fe:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   18603:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
   18608:	44 89 c1             	mov    %r8d,%ecx
   1860b:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18611:	44 89 e8             	mov    %r13d,%eax
   18614:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18619:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1861e:	48 29 ca             	sub    %rcx,%rdx
   18621:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18626:	48 09 f9             	or     %rdi,%rcx
   18629:	45 85 c0             	test   %r8d,%r8d
   1862c:	48 0f 48 ca          	cmovs  %rdx,%rcx
   18630:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18635:	48 29 c2             	sub    %rax,%rdx
   18638:	48 09 f8             	or     %rdi,%rax
   1863b:	45 85 ed             	test   %r13d,%r13d
   1863e:	48 0f 48 c2          	cmovs  %rdx,%rax
   18642:	48 39 c1             	cmp    %rax,%rcx
   18645:	0f 87 32 fe ff ff    	ja     1847d <<hyperinterval::float::F32Enclosure>::corner_image+0x15d>
   1864b:	44 89 f2             	mov    %r14d,%edx
   1864e:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18654:	be 00 00 00 80       	mov    $0x80000000,%esi
   18659:	29 d6                	sub    %edx,%esi
   1865b:	09 fa                	or     %edi,%edx
   1865d:	45 85 f6             	test   %r14d,%r14d
   18660:	48 0f 49 f2          	cmovns %rdx,%rsi
   18664:	39 ce                	cmp    %ecx,%esi
   18666:	45 0f 46 c6          	cmovbe %r14d,%r8d
   1866a:	4c 89 44 24 48       	mov    %r8,0x48(%rsp)
   1866f:	48 8b 74 24 50       	mov    0x50(%rsp),%rsi
   18674:	89 f1                	mov    %esi,%ecx
   18676:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1867c:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18681:	29 ca                	sub    %ecx,%edx
   18683:	09 f9                	or     %edi,%ecx
   18685:	85 f6                	test   %esi,%esi
   18687:	48 0f 49 d1          	cmovns %rcx,%rdx
   1868b:	39 c2                	cmp    %eax,%edx
   1868d:	44 0f 43 ee          	cmovae %esi,%r13d
   18691:	45 84 ff             	test   %r15b,%r15b
   18694:	74 32                	je     186c8 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a8>
   18696:	48 89 e7             	mov    %rsp,%rdi
   18699:	be 00 00 00 80       	mov    $0x80000000,%esi
   1869e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   186a3:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   186a8:	4d 89 e0             	mov    %r12,%r8
   186ab:	e8 20 17 00 00       	call   19dd0 <<hyperinterval::ieee::Format>::div>
   186b0:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   186b4:	0f 85 be fd ff ff    	jne    18478 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   186ba:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   186be:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   186c3:	e9 ac 00 00 00       	jmp    18774 <<hyperinterval::float::F32Enclosure>::corner_image+0x454>
   186c8:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
   186cd:	44 89 d0             	mov    %r10d,%eax
   186d0:	c1 e8 17             	shr    $0x17,%eax
   186d3:	0f b6 c0             	movzbl %al,%eax
   186d6:	44 89 d1             	mov    %r10d,%ecx
   186d9:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   186df:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   186e6:	8d b0 6a ff ff ff    	lea    -0x96(%rax),%esi
   186ec:	85 c0                	test   %eax,%eax
   186ee:	b8 6b ff ff ff       	mov    $0xffffff6b,%eax
   186f3:	0f 44 f0             	cmove  %eax,%esi
   186f6:	48 0f 44 d1          	cmove  %rcx,%rdx
   186fa:	44 89 e1             	mov    %r12d,%ecx
   186fd:	c1 e9 17             	shr    $0x17,%ecx
   18700:	0f b6 c9             	movzbl %cl,%ecx
   18703:	44 89 e7             	mov    %r12d,%edi
   18706:	81 e7 ff ff 7f 00    	and    $0x7fffff,%edi
   1870c:	4c 8d 87 00 00 80 00 	lea    0x800000(%rdi),%r8
   18713:	44 8d 89 6a ff ff ff 	lea    -0x96(%rcx),%r9d
   1871a:	85 c9                	test   %ecx,%ecx
   1871c:	44 0f 44 c8          	cmove  %eax,%r9d
   18720:	4c 0f 44 c7          	cmove  %rdi,%r8
   18724:	45 31 d4             	xor    %r10d,%r12d
   18727:	4c 0f af c2          	imul   %rdx,%r8
   1872b:	41 01 f1             	add    %esi,%r9d
   1872e:	41 c1 ec 1f          	shr    $0x1f,%r12d
   18732:	44 88 64 24 14       	mov    %r12b,0x14(%rsp)
   18737:	4c 89 04 24          	mov    %r8,(%rsp)
   1873b:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   18742:	00 00 
   18744:	44 89 4c 24 10       	mov    %r9d,0x10(%rsp)
   18749:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   1874e:	48 89 e1             	mov    %rsp,%rcx
   18751:	be 00 00 00 80       	mov    $0x80000000,%esi
   18756:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1875b:	e8 d0 22 00 00       	call   1aa30 <<hyperinterval::ieee::Format>::rounded>
   18760:	80 7c 24 20 00       	cmpb   $0x0,0x20(%rsp)
   18765:	0f 85 c6 fc ff ff    	jne    18431 <<hyperinterval::float::F32Enclosure>::corner_image+0x111>
   1876b:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
   1876f:	44 8b 64 24 30       	mov    0x30(%rsp),%r12d
   18774:	48 89 e7             	mov    %rsp,%rdi
   18777:	be 00 00 00 80       	mov    $0x80000000,%esi
   1877c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18781:	e8 5a f7 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   18786:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1878a:	0f 85 e8 fc ff ff    	jne    18478 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   18790:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   18795:	48 89 e7             	mov    %rsp,%rdi
   18798:	be 00 00 00 80       	mov    $0x80000000,%esi
   1879d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   187a2:	4c 89 e1             	mov    %r12,%rcx
   187a5:	e8 36 f7 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   187aa:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   187ae:	0f 85 c4 fc ff ff    	jne    18478 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   187b4:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   187b9:	44 89 f1             	mov    %r14d,%ecx
   187bc:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   187c2:	44 89 e0             	mov    %r12d,%eax
   187c5:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   187ca:	ba 00 00 00 80       	mov    $0x80000000,%edx
   187cf:	48 29 ca             	sub    %rcx,%rdx
   187d2:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   187d8:	4c 09 c1             	or     %r8,%rcx
   187db:	45 85 f6             	test   %r14d,%r14d
   187de:	48 0f 48 ca          	cmovs  %rdx,%rcx
   187e2:	ba 00 00 00 80       	mov    $0x80000000,%edx
   187e7:	48 29 c2             	sub    %rax,%rdx
   187ea:	4c 09 c0             	or     %r8,%rax
   187ed:	45 85 e4             	test   %r12d,%r12d
   187f0:	48 0f 48 c2          	cmovs  %rdx,%rax
   187f4:	48 39 c1             	cmp    %rax,%rcx
   187f7:	0f 87 80 fc ff ff    	ja     1847d <<hyperinterval::float::F32Enclosure>::corner_image+0x15d>
   187fd:	4c 8b 4c 24 48       	mov    0x48(%rsp),%r9
   18802:	44 89 ca             	mov    %r9d,%edx
   18805:	44 09 c2             	or     %r8d,%edx
   18808:	44 89 ce             	mov    %r9d,%esi
   1880b:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18811:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18816:	29 f7                	sub    %esi,%edi
   18818:	45 85 c9             	test   %r9d,%r9d
   1881b:	48 0f 49 fa          	cmovns %rdx,%rdi
   1881f:	39 cf                	cmp    %ecx,%edi
   18821:	45 0f 46 f1          	cmovbe %r9d,%r14d
   18825:	4c 89 74 24 50       	mov    %r14,0x50(%rsp)
   1882a:	44 89 e9             	mov    %r13d,%ecx
   1882d:	44 09 c1             	or     %r8d,%ecx
   18830:	44 89 ea             	mov    %r13d,%edx
   18833:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18839:	be 00 00 00 80       	mov    $0x80000000,%esi
   1883e:	29 d6                	sub    %edx,%esi
   18840:	45 85 ed             	test   %r13d,%r13d
   18843:	48 0f 49 f1          	cmovns %rcx,%rsi
   18847:	39 c6                	cmp    %eax,%esi
   18849:	45 0f 43 e5          	cmovae %r13d,%r12d
   1884d:	45 84 ff             	test   %r15b,%r15b
   18850:	74 34                	je     18886 <<hyperinterval::float::F32Enclosure>::corner_image+0x566>
   18852:	48 89 e7             	mov    %rsp,%rdi
   18855:	be 00 00 00 80       	mov    $0x80000000,%esi
   1885a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1885f:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   18864:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
   18869:	e8 62 15 00 00       	call   19dd0 <<hyperinterval::ieee::Format>::div>
   1886e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18872:	0f 85 00 fc ff ff    	jne    18478 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   18878:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1887c:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   18881:	e9 b1 00 00 00       	jmp    18937 <<hyperinterval::float::F32Enclosure>::corner_image+0x617>
   18886:	4c 8b 5c 24 38       	mov    0x38(%rsp),%r11
   1888b:	44 89 d8             	mov    %r11d,%eax
   1888e:	c1 e8 17             	shr    $0x17,%eax
   18891:	0f b6 c0             	movzbl %al,%eax
   18894:	44 89 d9             	mov    %r11d,%ecx
   18897:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   1889d:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   188a4:	8d b0 6a ff ff ff    	lea    -0x96(%rax),%esi
   188aa:	85 c0                	test   %eax,%eax
   188ac:	b8 6b ff ff ff       	mov    $0xffffff6b,%eax
   188b1:	0f 44 f0             	cmove  %eax,%esi
   188b4:	48 0f 44 d1          	cmove  %rcx,%rdx
   188b8:	4c 8b 54 24 40       	mov    0x40(%rsp),%r10
   188bd:	44 89 d1             	mov    %r10d,%ecx
   188c0:	c1 e9 17             	shr    $0x17,%ecx
   188c3:	0f b6 c9             	movzbl %cl,%ecx
   188c6:	44 89 d7             	mov    %r10d,%edi
   188c9:	81 e7 ff ff 7f 00    	and    $0x7fffff,%edi
   188cf:	4c 8d 87 00 00 80 00 	lea    0x800000(%rdi),%r8
   188d6:	44 8d 89 6a ff ff ff 	lea    -0x96(%rcx),%r9d
   188dd:	85 c9                	test   %ecx,%ecx
   188df:	44 0f 44 c8          	cmove  %eax,%r9d
   188e3:	4c 0f 44 c7          	cmove  %rdi,%r8
   188e7:	45 31 da             	xor    %r11d,%r10d
   188ea:	4c 0f af c2          	imul   %rdx,%r8
   188ee:	41 01 f1             	add    %esi,%r9d
   188f1:	41 c1 ea 1f          	shr    $0x1f,%r10d
   188f5:	44 88 54 24 14       	mov    %r10b,0x14(%rsp)
   188fa:	4c 89 04 24          	mov    %r8,(%rsp)
   188fe:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   18905:	00 00 
   18907:	44 89 4c 24 10       	mov    %r9d,0x10(%rsp)
   1890c:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   18911:	48 89 e1             	mov    %rsp,%rcx
   18914:	be 00 00 00 80       	mov    $0x80000000,%esi
   18919:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1891e:	e8 0d 21 00 00       	call   1aa30 <<hyperinterval::ieee::Format>::rounded>
   18923:	80 7c 24 20 00       	cmpb   $0x0,0x20(%rsp)
   18928:	0f 85 03 fb ff ff    	jne    18431 <<hyperinterval::float::F32Enclosure>::corner_image+0x111>
   1892e:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
   18932:	44 8b 74 24 30       	mov    0x30(%rsp),%r14d
   18937:	48 89 e7             	mov    %rsp,%rdi
   1893a:	be 00 00 00 80       	mov    $0x80000000,%esi
   1893f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18944:	e8 97 f5 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   18949:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1894d:	0f 85 25 fb ff ff    	jne    18478 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   18953:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   18958:	48 89 e7             	mov    %rsp,%rdi
   1895b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18960:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18965:	4c 89 f1             	mov    %r14,%rcx
   18968:	e8 73 f5 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1896d:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18971:	0f 85 01 fb ff ff    	jne    18478 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   18977:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1897c:	44 89 fa             	mov    %r15d,%edx
   1897f:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18985:	89 c1                	mov    %eax,%ecx
   18987:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1898d:	be 00 00 00 80       	mov    $0x80000000,%esi
   18992:	48 29 d6             	sub    %rdx,%rsi
   18995:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1899a:	48 09 fa             	or     %rdi,%rdx
   1899d:	45 85 ff             	test   %r15d,%r15d
   189a0:	48 0f 48 d6          	cmovs  %rsi,%rdx
   189a4:	be 00 00 00 80       	mov    $0x80000000,%esi
   189a9:	48 29 ce             	sub    %rcx,%rsi
   189ac:	48 09 f9             	or     %rdi,%rcx
   189af:	85 c0                	test   %eax,%eax
   189b1:	48 0f 48 ce          	cmovs  %rsi,%rcx
   189b5:	48 39 ca             	cmp    %rcx,%rdx
   189b8:	0f 87 bf fa ff ff    	ja     1847d <<hyperinterval::float::F32Enclosure>::corner_image+0x15d>
   189be:	4c 8b 54 24 50       	mov    0x50(%rsp),%r10
   189c3:	44 89 d6             	mov    %r10d,%esi
   189c6:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   189cc:	44 09 ce             	or     %r9d,%esi
   189cf:	44 89 d7             	mov    %r10d,%edi
   189d2:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   189d8:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   189de:	41 29 f8             	sub    %edi,%r8d
   189e1:	45 85 d2             	test   %r10d,%r10d
   189e4:	4c 0f 49 c6          	cmovns %rsi,%r8
   189e8:	41 39 d0             	cmp    %edx,%r8d
   189eb:	45 0f 46 fa          	cmovbe %r10d,%r15d
   189ef:	44 89 e2             	mov    %r12d,%edx
   189f2:	44 09 ca             	or     %r9d,%edx
   189f5:	44 89 e6             	mov    %r12d,%esi
   189f8:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   189fe:	41 29 f1             	sub    %esi,%r9d
   18a01:	45 85 e4             	test   %r12d,%r12d
   18a04:	4c 0f 49 ca          	cmovns %rdx,%r9
   18a08:	41 39 c9             	cmp    %ecx,%r9d
   18a0b:	41 0f 43 c4          	cmovae %r12d,%eax
   18a0f:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   18a15:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
   18a19:	89 43 08             	mov    %eax,0x8(%rbx)
   18a1c:	e9 66 fa ff ff       	jmp    18487 <<hyperinterval::float::F32Enclosure>::corner_image+0x167>
   18a21:	cc                   	int3
   18a22:	cc                   	int3
   18a23:	cc                   	int3
   18a24:	cc                   	int3
   18a25:	cc                   	int3
   18a26:	cc                   	int3
   18a27:	cc                   	int3
   18a28:	cc                   	int3
   18a29:	cc                   	int3
   18a2a:	cc                   	int3
   18a2b:	cc                   	int3
   18a2c:	cc                   	int3
   18a2d:	cc                   	int3
   18a2e:	cc                   	int3
   18a2f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::intersection:
   18a30:	48 89 f8             	mov    %rdi,%rax
   18a33:	45 31 c9             	xor    %r9d,%r9d
   18a36:	f6 06 01             	testb  $0x1,(%rsi)
   18a39:	0f 84 ed 00 00 00    	je     18b2c <<hyperinterval::float::F32Enclosure>::intersection+0xfc>
   18a3f:	f6 02 01             	testb  $0x1,(%rdx)
   18a42:	0f 84 d9 00 00 00    	je     18b21 <<hyperinterval::float::F32Enclosure>::intersection+0xf1>
   18a48:	53                   	push   %rbx
   18a49:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   18a4d:	8b 4e 04             	mov    0x4(%rsi),%ecx
   18a50:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18a55:	41 89 c9             	mov    %ecx,%r9d
   18a58:	41 09 f9             	or     %edi,%r9d
   18a5b:	41 89 ca             	mov    %ecx,%r10d
   18a5e:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18a65:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   18a6b:	45 29 d3             	sub    %r10d,%r11d
   18a6e:	85 c9                	test   %ecx,%ecx
   18a70:	4d 0f 49 d9          	cmovns %r9,%r11
   18a74:	45 89 c1             	mov    %r8d,%r9d
   18a77:	41 09 f9             	or     %edi,%r9d
   18a7a:	45 89 c2             	mov    %r8d,%r10d
   18a7d:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18a84:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   18a89:	44 29 d3             	sub    %r10d,%ebx
   18a8c:	45 85 c0             	test   %r8d,%r8d
   18a8f:	49 0f 49 d9          	cmovns %r9,%rbx
   18a93:	8b 52 08             	mov    0x8(%rdx),%edx
   18a96:	41 39 db             	cmp    %ebx,%r11d
   18a99:	41 0f 42 c8          	cmovb  %r8d,%ecx
   18a9d:	44 8b 46 08          	mov    0x8(%rsi),%r8d
   18aa1:	44 89 c6             	mov    %r8d,%esi
   18aa4:	09 fe                	or     %edi,%esi
   18aa6:	45 89 c1             	mov    %r8d,%r9d
   18aa9:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18ab0:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18ab6:	45 29 ca             	sub    %r9d,%r10d
   18ab9:	45 85 c0             	test   %r8d,%r8d
   18abc:	4c 0f 49 d6          	cmovns %rsi,%r10
   18ac0:	89 d6                	mov    %edx,%esi
   18ac2:	09 fe                	or     %edi,%esi
   18ac4:	41 89 d1             	mov    %edx,%r9d
   18ac7:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18ace:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   18ad4:	45 29 cb             	sub    %r9d,%r11d
   18ad7:	85 d2                	test   %edx,%edx
   18ad9:	4c 0f 49 de          	cmovns %rsi,%r11
   18add:	45 39 da             	cmp    %r11d,%r10d
   18ae0:	44 0f 47 c2          	cmova  %edx,%r8d
   18ae4:	89 ca                	mov    %ecx,%edx
   18ae6:	09 fa                	or     %edi,%edx
   18ae8:	89 ce                	mov    %ecx,%esi
   18aea:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18af0:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18af6:	41 29 f2             	sub    %esi,%r10d
   18af9:	85 c9                	test   %ecx,%ecx
   18afb:	4c 0f 49 d2          	cmovns %rdx,%r10
   18aff:	44 89 c2             	mov    %r8d,%edx
   18b02:	09 fa                	or     %edi,%edx
   18b04:	44 89 c6             	mov    %r8d,%esi
   18b07:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18b0d:	29 f7                	sub    %esi,%edi
   18b0f:	45 85 c0             	test   %r8d,%r8d
   18b12:	48 0f 49 fa          	cmovns %rdx,%rdi
   18b16:	45 31 c9             	xor    %r9d,%r9d
   18b19:	41 39 fa             	cmp    %edi,%r10d
   18b1c:	41 0f 96 c1          	setbe  %r9b
   18b20:	5b                   	pop    %rbx
   18b21:	44 89 08             	mov    %r9d,(%rax)
   18b24:	89 48 04             	mov    %ecx,0x4(%rax)
   18b27:	44 89 40 08          	mov    %r8d,0x8(%rax)
   18b2b:	c3                   	ret
   18b2c:	44 89 08             	mov    %r9d,(%rax)
   18b2f:	89 48 04             	mov    %ecx,0x4(%rax)
   18b32:	44 89 40 08          	mov    %r8d,0x8(%rax)
   18b36:	c3                   	ret
   18b37:	cc                   	int3
   18b38:	cc                   	int3
   18b39:	cc                   	int3
   18b3a:	cc                   	int3
   18b3b:	cc                   	int3
   18b3c:	cc                   	int3
   18b3d:	cc                   	int3
   18b3e:	cc                   	int3
   18b3f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::contains_point:
   18b40:	41 56                	push   %r14
   18b42:	53                   	push   %rbx
   18b43:	48 83 ec 18          	sub    $0x18,%rsp
   18b47:	48 89 fb             	mov    %rdi,%rbx
   18b4a:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   18b50:	66 0f 7e c1          	movd   %xmm0,%ecx
   18b54:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18b59:	be 00 00 00 80       	mov    $0x80000000,%esi
   18b5e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18b63:	e8 78 f3 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   18b68:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   18b6d:	3c 01                	cmp    $0x1,%al
   18b6f:	75 0d                	jne    18b7e <<hyperinterval::float::F32Enclosure>::contains_point+0x3e>
   18b71:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   18b76:	48 83 c4 18          	add    $0x18,%rsp
   18b7a:	5b                   	pop    %rbx
   18b7b:	41 5e                	pop    %r14
   18b7d:	c3                   	ret
   18b7e:	f6 03 01             	testb  $0x1,(%rbx)
   18b81:	74 44                	je     18bc7 <<hyperinterval::float::F32Enclosure>::contains_point+0x87>
   18b83:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   18b88:	8b 73 04             	mov    0x4(%rbx),%esi
   18b8b:	89 d1                	mov    %edx,%ecx
   18b8d:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18b93:	89 f7                	mov    %esi,%edi
   18b95:	44 09 f7             	or     %r14d,%edi
   18b98:	41 89 f0             	mov    %esi,%r8d
   18b9b:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18ba2:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   18ba8:	45 29 c1             	sub    %r8d,%r9d
   18bab:	85 f6                	test   %esi,%esi
   18bad:	4c 0f 49 cf          	cmovns %rdi,%r9
   18bb1:	be 00 00 00 80       	mov    $0x80000000,%esi
   18bb6:	48 29 ce             	sub    %rcx,%rsi
   18bb9:	4c 09 f1             	or     %r14,%rcx
   18bbc:	85 d2                	test   %edx,%edx
   18bbe:	48 0f 48 ce          	cmovs  %rsi,%rcx
   18bc2:	41 39 c9             	cmp    %ecx,%r9d
   18bc5:	76 0a                	jbe    18bd1 <<hyperinterval::float::F32Enclosure>::contains_point+0x91>
   18bc7:	31 d2                	xor    %edx,%edx
   18bc9:	48 83 c4 18          	add    $0x18,%rsp
   18bcd:	5b                   	pop    %rbx
   18bce:	41 5e                	pop    %r14
   18bd0:	c3                   	ret
   18bd1:	8b 53 08             	mov    0x8(%rbx),%edx
   18bd4:	89 d6                	mov    %edx,%esi
   18bd6:	44 09 f6             	or     %r14d,%esi
   18bd9:	89 d7                	mov    %edx,%edi
   18bdb:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18be1:	41 29 fe             	sub    %edi,%r14d
   18be4:	85 d2                	test   %edx,%edx
   18be6:	4c 0f 49 f6          	cmovns %rsi,%r14
   18bea:	44 39 f1             	cmp    %r14d,%ecx
   18bed:	0f 96 c2             	setbe  %dl
   18bf0:	48 83 c4 18          	add    $0x18,%rsp
   18bf4:	5b                   	pop    %rbx
   18bf5:	41 5e                	pop    %r14
   18bf7:	c3                   	ret
   18bf8:	cc                   	int3
   18bf9:	cc                   	int3
   18bfa:	cc                   	int3
   18bfb:	cc                   	int3
   18bfc:	cc                   	int3
   18bfd:	cc                   	int3
   18bfe:	cc                   	int3
   18bff:	cc                   	int3

<hyperinterval::float::F32Enclosure>::interior_subset_of:
   18c00:	b0 01                	mov    $0x1,%al
   18c02:	f6 07 01             	testb  $0x1,(%rdi)
   18c05:	0f 84 8e 00 00 00    	je     18c99 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x99>
   18c0b:	f6 06 01             	testb  $0x1,(%rsi)
   18c0e:	0f 84 83 00 00 00    	je     18c97 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x97>
   18c14:	8b 4f 04             	mov    0x4(%rdi),%ecx
   18c17:	8b 56 04             	mov    0x4(%rsi),%edx
   18c1a:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18c1f:	44 8d 04 02          	lea    (%rdx,%rax,1),%r8d
   18c23:	41 89 d1             	mov    %edx,%r9d
   18c26:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18c2d:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18c33:	45 29 ca             	sub    %r9d,%r10d
   18c36:	85 d2                	test   %edx,%edx
   18c38:	4d 0f 49 d0          	cmovns %r8,%r10
   18c3c:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   18c3f:	41 89 c8             	mov    %ecx,%r8d
   18c42:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18c49:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   18c4f:	45 29 c1             	sub    %r8d,%r9d
   18c52:	85 c9                	test   %ecx,%ecx
   18c54:	4c 0f 49 ca          	cmovns %rdx,%r9
   18c58:	45 39 ca             	cmp    %r9d,%r10d
   18c5b:	73 3a                	jae    18c97 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x97>
   18c5d:	8b 4f 08             	mov    0x8(%rdi),%ecx
   18c60:	8b 56 08             	mov    0x8(%rsi),%edx
   18c63:	8d 34 01             	lea    (%rcx,%rax,1),%esi
   18c66:	89 cf                	mov    %ecx,%edi
   18c68:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18c6e:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18c74:	41 29 f8             	sub    %edi,%r8d
   18c77:	85 c9                	test   %ecx,%ecx
   18c79:	4c 0f 49 c6          	cmovns %rsi,%r8
   18c7d:	8d 0c 02             	lea    (%rdx,%rax,1),%ecx
   18c80:	89 d6                	mov    %edx,%esi
   18c82:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18c88:	29 f0                	sub    %esi,%eax
   18c8a:	85 d2                	test   %edx,%edx
   18c8c:	48 0f 49 c1          	cmovns %rcx,%rax
   18c90:	41 39 c0             	cmp    %eax,%r8d
   18c93:	0f 92 c0             	setb   %al
   18c96:	c3                   	ret
   18c97:	31 c0                	xor    %eax,%eax
   18c99:	c3                   	ret
   18c9a:	cc                   	int3
   18c9b:	cc                   	int3
   18c9c:	cc                   	int3
   18c9d:	cc                   	int3
   18c9e:	cc                   	int3
   18c9f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::add:
   18ca0:	48 89 f8             	mov    %rdi,%rax
   18ca3:	f6 06 01             	testb  $0x1,(%rsi)
   18ca6:	0f 84 d6 00 00 00    	je     18d82 <<hyperinterval::float::F32Enclosure>::add+0xe2>
   18cac:	f6 02 01             	testb  $0x1,(%rdx)
   18caf:	0f 84 cd 00 00 00    	je     18d82 <<hyperinterval::float::F32Enclosure>::add+0xe2>
   18cb5:	41 57                	push   %r15
   18cb7:	41 56                	push   %r14
   18cb9:	41 55                	push   %r13
   18cbb:	41 54                	push   %r12
   18cbd:	53                   	push   %rbx
   18cbe:	48 83 ec 20          	sub    $0x20,%rsp
   18cc2:	49 89 c4             	mov    %rax,%r12
   18cc5:	8b 5e 08             	mov    0x8(%rsi),%ebx
   18cc8:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   18cce:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   18cd2:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   18cd6:	8b 4e 04             	mov    0x4(%rsi),%ecx
   18cd9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18cde:	be 00 00 00 80       	mov    $0x80000000,%esi
   18ce3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18ce8:	e8 53 0e 00 00       	call   19b40 <<hyperinterval::ieee::Format>::add>
   18ced:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18cf2:	74 6b                	je     18d5f <<hyperinterval::float::F32Enclosure>::add+0xbf>
   18cf4:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   18cf9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18cfe:	be 00 00 00 80       	mov    $0x80000000,%esi
   18d03:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18d08:	48 89 d9             	mov    %rbx,%rcx
   18d0b:	4d 89 f0             	mov    %r14,%r8
   18d0e:	e8 2d 0e 00 00       	call   19b40 <<hyperinterval::ieee::Format>::add>
   18d13:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18d18:	74 45                	je     18d5f <<hyperinterval::float::F32Enclosure>::add+0xbf>
   18d1a:	8b 5c 24 18          	mov    0x18(%rsp),%ebx
   18d1e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18d23:	be 00 00 00 80       	mov    $0x80000000,%esi
   18d28:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18d2d:	4c 89 f9             	mov    %r15,%rcx
   18d30:	e8 ab f1 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   18d35:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18d3a:	74 23                	je     18d5f <<hyperinterval::float::F32Enclosure>::add+0xbf>
   18d3c:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   18d41:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18d46:	be 00 00 00 80       	mov    $0x80000000,%esi
   18d4b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18d50:	48 89 d9             	mov    %rbx,%rcx
   18d53:	e8 88 f1 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   18d58:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18d5d:	75 2a                	jne    18d89 <<hyperinterval::float::F32Enclosure>::add+0xe9>
   18d5f:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   18d64:	4c 89 e0             	mov    %r12,%rax
   18d67:	41 88 4c 24 04       	mov    %cl,0x4(%r12)
   18d6c:	41 c7 04 24 02 00 00 	movl   $0x2,(%r12)
   18d73:	00 
   18d74:	48 83 c4 20          	add    $0x20,%rsp
   18d78:	5b                   	pop    %rbx
   18d79:	41 5c                	pop    %r12
   18d7b:	41 5d                	pop    %r13
   18d7d:	41 5e                	pop    %r14
   18d7f:	41 5f                	pop    %r15
   18d81:	c3                   	ret
   18d82:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   18d88:	c3                   	ret
   18d89:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   18d8d:	44 89 f0             	mov    %r14d,%eax
   18d90:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18d95:	89 ca                	mov    %ecx,%edx
   18d97:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18d9d:	be 00 00 00 80       	mov    $0x80000000,%esi
   18da2:	29 c6                	sub    %eax,%esi
   18da4:	44 09 e8             	or     %r13d,%eax
   18da7:	45 85 f6             	test   %r14d,%r14d
   18daa:	48 0f 49 f0          	cmovns %rax,%rsi
   18dae:	89 d0                	mov    %edx,%eax
   18db0:	44 09 e8             	or     %r13d,%eax
   18db3:	41 29 d5             	sub    %edx,%r13d
   18db6:	85 c9                	test   %ecx,%ecx
   18db8:	4c 0f 49 e8          	cmovns %rax,%r13
   18dbc:	44 39 ee             	cmp    %r13d,%esi
   18dbf:	4c 89 e0             	mov    %r12,%rax
   18dc2:	76 0c                	jbe    18dd0 <<hyperinterval::float::F32Enclosure>::add+0x130>
   18dc4:	c6 40 04 01          	movb   $0x1,0x4(%rax)
   18dc8:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   18dce:	eb a4                	jmp    18d74 <<hyperinterval::float::F32Enclosure>::add+0xd4>
   18dd0:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   18dd6:	44 89 70 04          	mov    %r14d,0x4(%rax)
   18dda:	89 48 08             	mov    %ecx,0x8(%rax)
   18ddd:	eb 95                	jmp    18d74 <<hyperinterval::float::F32Enclosure>::add+0xd4>
   18ddf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::div:
   18de0:	53                   	push   %rbx
   18de1:	48 89 fb             	mov    %rdi,%rbx
   18de4:	83 3a 01             	cmpl   $0x1,(%rdx)
   18de7:	75 1a                	jne    18e03 <<hyperinterval::float::F32Enclosure>::div+0x23>
   18de9:	83 7a 04 00          	cmpl   $0x0,0x4(%rdx)
   18ded:	7f 14                	jg     18e03 <<hyperinterval::float::F32Enclosure>::div+0x23>
   18def:	8b 42 08             	mov    0x8(%rdx),%eax
   18df2:	85 c0                	test   %eax,%eax
   18df4:	0f 99 c1             	setns  %cl
   18df7:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   18dfc:	0f 94 c0             	sete   %al
   18dff:	08 c8                	or     %cl,%al
   18e01:	75 12                	jne    18e15 <<hyperinterval::float::F32Enclosure>::div+0x35>
   18e03:	48 89 df             	mov    %rbx,%rdi
   18e06:	b9 01 00 00 00       	mov    $0x1,%ecx
   18e0b:	e8 10 f5 ff ff       	call   18320 <<hyperinterval::float::F32Enclosure>::corner_image>
   18e10:	48 89 d8             	mov    %rbx,%rax
   18e13:	5b                   	pop    %rbx
   18e14:	c3                   	ret
   18e15:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
   18e19:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18e1f:	48 89 d8             	mov    %rbx,%rax
   18e22:	5b                   	pop    %rbx
   18e23:	c3                   	ret
   18e24:	cc                   	int3
   18e25:	cc                   	int3
   18e26:	cc                   	int3
   18e27:	cc                   	int3
   18e28:	cc                   	int3
   18e29:	cc                   	int3
   18e2a:	cc                   	int3
   18e2b:	cc                   	int3
   18e2c:	cc                   	int3
   18e2d:	cc                   	int3
   18e2e:	cc                   	int3
   18e2f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::new:
   18e30:	41 57                	push   %r15
   18e32:	41 56                	push   %r14
   18e34:	53                   	push   %rbx
   18e35:	48 83 ec 20          	sub    $0x20,%rsp
   18e39:	f3 0f 11 4c 24 1c    	movss  %xmm1,0x1c(%rsp)
   18e3f:	48 89 fb             	mov    %rdi,%rbx
   18e42:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   18e48:	66 0f 7e c1          	movd   %xmm0,%ecx
   18e4c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18e51:	be 00 00 00 80       	mov    $0x80000000,%esi
   18e56:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18e5b:	e8 80 f0 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   18e60:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18e65:	74 2a                	je     18e91 <<hyperinterval::float::F32Enclosure>::new+0x61>
   18e67:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   18e6c:	66 0f 6e 44 24 1c    	movd   0x1c(%rsp),%xmm0
   18e72:	66 0f 7e c1          	movd   %xmm0,%ecx
   18e76:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18e7b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18e80:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18e85:	e8 56 f0 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   18e8a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18e8f:	75 1b                	jne    18eac <<hyperinterval::float::F32Enclosure>::new+0x7c>
   18e91:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   18e96:	88 43 04             	mov    %al,0x4(%rbx)
   18e99:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18e9f:	48 89 d8             	mov    %rbx,%rax
   18ea2:	48 83 c4 20          	add    $0x20,%rsp
   18ea6:	5b                   	pop    %rbx
   18ea7:	41 5e                	pop    %r14
   18ea9:	41 5f                	pop    %r15
   18eab:	c3                   	ret
   18eac:	8b 44 24 10          	mov    0x10(%rsp),%eax
   18eb0:	44 89 f9             	mov    %r15d,%ecx
   18eb3:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18eb9:	89 c2                	mov    %eax,%edx
   18ebb:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18ec1:	be 00 00 00 80       	mov    $0x80000000,%esi
   18ec6:	29 ce                	sub    %ecx,%esi
   18ec8:	44 09 f1             	or     %r14d,%ecx
   18ecb:	45 85 ff             	test   %r15d,%r15d
   18ece:	48 0f 49 f1          	cmovns %rcx,%rsi
   18ed2:	89 d1                	mov    %edx,%ecx
   18ed4:	44 09 f1             	or     %r14d,%ecx
   18ed7:	41 29 d6             	sub    %edx,%r14d
   18eda:	85 c0                	test   %eax,%eax
   18edc:	4c 0f 49 f1          	cmovns %rcx,%r14
   18ee0:	44 39 f6             	cmp    %r14d,%esi
   18ee3:	76 06                	jbe    18eeb <<hyperinterval::float::F32Enclosure>::new+0xbb>
   18ee5:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   18ee9:	eb ae                	jmp    18e99 <<hyperinterval::float::F32Enclosure>::new+0x69>
   18eeb:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   18ef1:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
   18ef5:	89 43 08             	mov    %eax,0x8(%rbx)
   18ef8:	eb a5                	jmp    18e9f <<hyperinterval::float::F32Enclosure>::new+0x6f>
   18efa:	cc                   	int3
   18efb:	cc                   	int3
   18efc:	cc                   	int3
   18efd:	cc                   	int3
   18efe:	cc                   	int3
   18eff:	cc                   	int3

<hyperinterval::float::F32Enclosure>::sub:
   18f00:	53                   	push   %rbx
   18f01:	48 83 ec 10          	sub    $0x10,%rsp
   18f05:	48 89 fb             	mov    %rdi,%rbx
   18f08:	f6 02 01             	testb  $0x1,(%rdx)
   18f0b:	74 29                	je     18f36 <<hyperinterval::float::F32Enclosure>::sub+0x36>
   18f0d:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   18f12:	66 0f ef c9          	pxor   %xmm1,%xmm1
   18f16:	66 0f 6f 15 b2 cc fe 	movdqa -0x1334e(%rip),%xmm2        # 5bd0 <__abi_tag+0x58d4>
   18f1d:	ff 
   18f1e:	66 0f ef d0          	pxor   %xmm0,%xmm2
   18f22:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   18f26:	66 0f df ca          	pandn  %xmm2,%xmm1
   18f2a:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   18f2f:	b8 01 00 00 00       	mov    $0x1,%eax
   18f34:	eb 02                	jmp    18f38 <<hyperinterval::float::F32Enclosure>::sub+0x38>
   18f36:	31 c0                	xor    %eax,%eax
   18f38:	89 44 24 04          	mov    %eax,0x4(%rsp)
   18f3c:	66 0f d6 44 24 08    	movq   %xmm0,0x8(%rsp)
   18f42:	48 8d 54 24 04       	lea    0x4(%rsp),%rdx
   18f47:	48 89 df             	mov    %rbx,%rdi
   18f4a:	ff 15 58 2f 04 00    	call   *0x42f58(%rip)        # 5bea8 <_DYNAMIC+0x2d0>
   18f50:	48 89 d8             	mov    %rbx,%rax
   18f53:	48 83 c4 10          	add    $0x10,%rsp
   18f57:	5b                   	pop    %rbx
   18f58:	c3                   	ret
   18f59:	cc                   	int3
   18f5a:	cc                   	int3
   18f5b:	cc                   	int3
   18f5c:	cc                   	int3
   18f5d:	cc                   	int3
   18f5e:	cc                   	int3
   18f5f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::hull:
   18f60:	48 89 f8             	mov    %rdi,%rax
   18f63:	44 8b 0e             	mov    (%rsi),%r9d
   18f66:	44 8b 02             	mov    (%rdx),%r8d
   18f69:	8b 7a 04             	mov    0x4(%rdx),%edi
   18f6c:	8b 4a 08             	mov    0x8(%rdx),%ecx
   18f6f:	41 f6 c1 01          	test   $0x1,%r9b
   18f73:	0f 84 9b 00 00 00    	je     19014 <<hyperinterval::float::F32Enclosure>::hull+0xb4>
   18f79:	8b 56 04             	mov    0x4(%rsi),%edx
   18f7c:	8b 76 08             	mov    0x8(%rsi),%esi
   18f7f:	41 f6 c0 01          	test   $0x1,%r8b
   18f83:	0f 84 95 00 00 00    	je     1901e <<hyperinterval::float::F32Enclosure>::hull+0xbe>
   18f89:	53                   	push   %rbx
   18f8a:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18f90:	46 8d 0c 02          	lea    (%rdx,%r8,1),%r9d
   18f94:	41 89 d2             	mov    %edx,%r10d
   18f97:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18f9e:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   18fa4:	45 29 d3             	sub    %r10d,%r11d
   18fa7:	85 d2                	test   %edx,%edx
   18fa9:	4d 0f 49 d9          	cmovns %r9,%r11
   18fad:	46 8d 0c 07          	lea    (%rdi,%r8,1),%r9d
   18fb1:	41 89 fa             	mov    %edi,%r10d
   18fb4:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18fbb:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   18fc0:	44 29 d3             	sub    %r10d,%ebx
   18fc3:	85 ff                	test   %edi,%edi
   18fc5:	49 0f 49 d9          	cmovns %r9,%rbx
   18fc9:	41 39 db             	cmp    %ebx,%r11d
   18fcc:	0f 47 d7             	cmova  %edi,%edx
   18fcf:	42 8d 3c 06          	lea    (%rsi,%r8,1),%edi
   18fd3:	41 89 f1             	mov    %esi,%r9d
   18fd6:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18fdd:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18fe3:	45 29 ca             	sub    %r9d,%r10d
   18fe6:	85 f6                	test   %esi,%esi
   18fe8:	4c 0f 49 d7          	cmovns %rdi,%r10
   18fec:	42 8d 3c 01          	lea    (%rcx,%r8,1),%edi
   18ff0:	41 89 c9             	mov    %ecx,%r9d
   18ff3:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18ffa:	45 29 c8             	sub    %r9d,%r8d
   18ffd:	85 c9                	test   %ecx,%ecx
   18fff:	4c 0f 49 c7          	cmovns %rdi,%r8
   19003:	45 39 c2             	cmp    %r8d,%r10d
   19006:	0f 42 f1             	cmovb  %ecx,%esi
   19009:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1900f:	89 f1                	mov    %esi,%ecx
   19011:	89 d7                	mov    %edx,%edi
   19013:	5b                   	pop    %rbx
   19014:	44 89 00             	mov    %r8d,(%rax)
   19017:	89 78 04             	mov    %edi,0x4(%rax)
   1901a:	89 48 08             	mov    %ecx,0x8(%rax)
   1901d:	c3                   	ret
   1901e:	89 f1                	mov    %esi,%ecx
   19020:	89 d7                	mov    %edx,%edi
   19022:	45 89 c8             	mov    %r9d,%r8d
   19025:	44 89 00             	mov    %r8d,(%rax)
   19028:	89 78 04             	mov    %edi,0x4(%rax)
   1902b:	89 48 08             	mov    %ecx,0x8(%rax)
   1902e:	c3                   	ret
   1902f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::point:
   19030:	53                   	push   %rbx
   19031:	48 83 ec 10          	sub    $0x10,%rsp
   19035:	48 89 fb             	mov    %rdi,%rbx
   19038:	66 0f 7e c1          	movd   %xmm0,%ecx
   1903c:	48 89 e7             	mov    %rsp,%rdi
   1903f:	be 00 00 00 80       	mov    $0x80000000,%esi
   19044:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19049:	e8 92 ee ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1904e:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19052:	75 0f                	jne    19063 <<hyperinterval::float::F32Enclosure>::point+0x33>
   19054:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   19059:	88 43 04             	mov    %al,0x4(%rbx)
   1905c:	b8 02 00 00 00       	mov    $0x2,%eax
   19061:	eb 0f                	jmp    19072 <<hyperinterval::float::F32Enclosure>::point+0x42>
   19063:	8b 44 24 08          	mov    0x8(%rsp),%eax
   19067:	89 43 04             	mov    %eax,0x4(%rbx)
   1906a:	89 43 08             	mov    %eax,0x8(%rbx)
   1906d:	b8 01 00 00 00       	mov    $0x1,%eax
   19072:	89 03                	mov    %eax,(%rbx)
   19074:	48 89 d8             	mov    %rbx,%rax
   19077:	48 83 c4 10          	add    $0x10,%rsp
   1907b:	5b                   	pop    %rbx
   1907c:	c3                   	ret
   1907d:	cc                   	int3
   1907e:	cc                   	int3
   1907f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::signs:
   19080:	83 3f 01             	cmpl   $0x1,(%rdi)
   19083:	75 65                	jne    190ea <<hyperinterval::float::F32Enclosure>::signs+0x6a>
   19085:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   1908a:	8b 57 04             	mov    0x4(%rdi),%edx
   1908d:	8b 47 08             	mov    0x8(%rdi),%eax
   19090:	48 89 d6             	mov    %rdx,%rsi
   19093:	48 09 ce             	or     %rcx,%rsi
   19096:	41 89 d0             	mov    %edx,%r8d
   19099:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   190a0:	bf 00 00 00 80       	mov    $0x80000000,%edi
   190a5:	4c 29 c7             	sub    %r8,%rdi
   190a8:	85 d2                	test   %edx,%edx
   190aa:	48 0f 49 fe          	cmovns %rsi,%rdi
   190ae:	31 f6                	xor    %esi,%esi
   190b0:	f7 c7 00 00 00 80    	test   $0x80000000,%edi
   190b6:	0f 94 c2             	sete   %dl
   190b9:	48 39 cf             	cmp    %rcx,%rdi
   190bc:	77 1d                	ja     190db <<hyperinterval::float::F32Enclosure>::signs+0x5b>
   190be:	39 cf                	cmp    %ecx,%edi
   190c0:	0f 92 c1             	setb   %cl
   190c3:	80 c9 02             	or     $0x2,%cl
   190c6:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   190cb:	0f b6 c9             	movzbl %cl,%ecx
   190ce:	40 88 d6             	mov    %dl,%sil
   190d1:	0f 44 f1             	cmove  %ecx,%esi
   190d4:	85 c0                	test   %eax,%eax
   190d6:	0f 49 f1             	cmovns %ecx,%esi
   190d9:	89 f2                	mov    %esi,%edx
   190db:	8d 4a 04             	lea    0x4(%rdx),%ecx
   190de:	85 c0                	test   %eax,%eax
   190e0:	0f b6 d2             	movzbl %dl,%edx
   190e3:	0f b6 c1             	movzbl %cl,%eax
   190e6:	0f 4e c2             	cmovle %edx,%eax
   190e9:	c3                   	ret
   190ea:	31 c0                	xor    %eax,%eax
   190ec:	c3                   	ret
   190ed:	cc                   	int3
   190ee:	cc                   	int3
   190ef:	cc                   	int3

<hyperinterval::float::F32Enclosure>::affine:
   190f0:	55                   	push   %rbp
   190f1:	41 57                	push   %r15
   190f3:	41 56                	push   %r14
   190f5:	41 55                	push   %r13
   190f7:	41 54                	push   %r12
   190f9:	53                   	push   %rbx
   190fa:	48 83 ec 38          	sub    $0x38,%rsp
   190fe:	f3 0f 11 4c 24 18    	movss  %xmm1,0x18(%rsp)
   19104:	49 89 f7             	mov    %rsi,%r15
   19107:	48 89 fb             	mov    %rdi,%rbx
   1910a:	41 bc 00 00 00 80    	mov    $0x80000000,%r12d
   19110:	66 0f 7e c1          	movd   %xmm0,%ecx
   19114:	48 89 e7             	mov    %rsp,%rdi
   19117:	be 00 00 00 80       	mov    $0x80000000,%esi
   1911c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19121:	e8 ba ed ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   19126:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1912a:	74 27                	je     19153 <<hyperinterval::float::F32Enclosure>::affine+0x63>
   1912c:	44 8b 74 24 08       	mov    0x8(%rsp),%r14d
   19131:	66 0f 6e 44 24 18    	movd   0x18(%rsp),%xmm0
   19137:	66 0f 7e c1          	movd   %xmm0,%ecx
   1913b:	48 89 e7             	mov    %rsp,%rdi
   1913e:	be 00 00 00 80       	mov    $0x80000000,%esi
   19143:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19148:	e8 93 ed ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1914d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19151:	75 20                	jne    19173 <<hyperinterval::float::F32Enclosure>::affine+0x83>
   19153:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   19158:	88 43 04             	mov    %al,0x4(%rbx)
   1915b:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19161:	48 89 d8             	mov    %rbx,%rax
   19164:	48 83 c4 38          	add    $0x38,%rsp
   19168:	5b                   	pop    %rbx
   19169:	41 5c                	pop    %r12
   1916b:	41 5d                	pop    %r13
   1916d:	41 5e                	pop    %r14
   1916f:	41 5f                	pop    %r15
   19171:	5d                   	pop    %rbp
   19172:	c3                   	ret
   19173:	41 f6 07 01          	testb  $0x1,(%r15)
   19177:	0f 84 b1 00 00 00    	je     1922e <<hyperinterval::float::F32Enclosure>::affine+0x13e>
   1917d:	44 8b 6c 24 08       	mov    0x8(%rsp),%r13d
   19182:	41 8b 4f 04          	mov    0x4(%r15),%ecx
   19186:	45 8b 7f 08          	mov    0x8(%r15),%r15d
   1918a:	48 89 e7             	mov    %rsp,%rdi
   1918d:	be 00 00 00 80       	mov    $0x80000000,%esi
   19192:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19197:	4d 89 f0             	mov    %r14,%r8
   1919a:	4d 89 e9             	mov    %r13,%r9
   1919d:	e8 7e 14 00 00       	call   1a620 <<hyperinterval::ieee::Format>::affine>
   191a2:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   191a6:	74 ab                	je     19153 <<hyperinterval::float::F32Enclosure>::affine+0x63>
   191a8:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   191ac:	8b 44 24 10          	mov    0x10(%rsp),%eax
   191b0:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   191b5:	48 89 e7             	mov    %rsp,%rdi
   191b8:	be 00 00 00 80       	mov    $0x80000000,%esi
   191bd:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   191c2:	4c 89 f9             	mov    %r15,%rcx
   191c5:	4d 89 f0             	mov    %r14,%r8
   191c8:	4d 89 e9             	mov    %r13,%r9
   191cb:	e8 50 14 00 00       	call   1a620 <<hyperinterval::ieee::Format>::affine>
   191d0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   191d4:	0f 84 79 ff ff ff    	je     19153 <<hyperinterval::float::F32Enclosure>::affine+0x63>
   191da:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   191df:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   191e4:	48 89 e7             	mov    %rsp,%rdi
   191e7:	be 00 00 00 80       	mov    $0x80000000,%esi
   191ec:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   191f1:	48 89 e9             	mov    %rbp,%rcx
   191f4:	e8 e7 ec ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   191f9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   191fd:	74 22                	je     19221 <<hyperinterval::float::F32Enclosure>::affine+0x131>
   191ff:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   19204:	48 89 e7             	mov    %rsp,%rdi
   19207:	be 00 00 00 80       	mov    $0x80000000,%esi
   1920c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19211:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   19216:	e8 c5 ec ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1921b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1921f:	75 18                	jne    19239 <<hyperinterval::float::F32Enclosure>::affine+0x149>
   19221:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   19226:	88 4b 04             	mov    %cl,0x4(%rbx)
   19229:	e9 2d ff ff ff       	jmp    1915b <<hyperinterval::float::F32Enclosure>::affine+0x6b>
   1922e:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   19234:	e9 28 ff ff ff       	jmp    19161 <<hyperinterval::float::F32Enclosure>::affine+0x71>
   19239:	8b 44 24 08          	mov    0x8(%rsp),%eax
   1923d:	44 89 e9             	mov    %r13d,%ecx
   19240:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19246:	89 c2                	mov    %eax,%edx
   19248:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1924e:	be 00 00 00 80       	mov    $0x80000000,%esi
   19253:	29 ce                	sub    %ecx,%esi
   19255:	44 09 e1             	or     %r12d,%ecx
   19258:	45 85 ed             	test   %r13d,%r13d
   1925b:	48 0f 49 f1          	cmovns %rcx,%rsi
   1925f:	89 d1                	mov    %edx,%ecx
   19261:	44 09 e1             	or     %r12d,%ecx
   19264:	41 29 d4             	sub    %edx,%r12d
   19267:	85 c0                	test   %eax,%eax
   19269:	4c 0f 49 e1          	cmovns %rcx,%r12
   1926d:	b1 01                	mov    $0x1,%cl
   1926f:	44 39 e6             	cmp    %r12d,%esi
   19272:	77 b2                	ja     19226 <<hyperinterval::float::F32Enclosure>::affine+0x136>
   19274:	44 89 e9             	mov    %r13d,%ecx
   19277:	c1 e9 08             	shr    $0x8,%ecx
   1927a:	c7 44 24 20 01 00 00 	movl   $0x1,0x20(%rsp)
   19281:	00 
   19282:	44 88 6c 24 24       	mov    %r13b,0x24(%rsp)
   19287:	41 c1 ed 18          	shr    $0x18,%r13d
   1928b:	44 88 6c 24 27       	mov    %r13b,0x27(%rsp)
   19290:	66 89 4c 24 25       	mov    %cx,0x25(%rsp)
   19295:	89 44 24 28          	mov    %eax,0x28(%rsp)
   19299:	48 89 e7             	mov    %rsp,%rdi
   1929c:	4c 89 f6             	mov    %r14,%rsi
   1929f:	4c 89 fa             	mov    %r15,%rdx
   192a2:	e8 99 06 00 00       	call   19940 <<hyperinterval::float::F32Enclosure>::from_bits>
   192a7:	8b 0c 24             	mov    (%rsp),%ecx
   192aa:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   192af:	83 f9 02             	cmp    $0x2,%ecx
   192b2:	0f 84 a0 fe ff ff    	je     19158 <<hyperinterval::float::F32Enclosure>::affine+0x68>
   192b8:	8b 54 24 05          	mov    0x5(%rsp),%edx
   192bc:	8b 74 24 08          	mov    0x8(%rsp),%esi
   192c0:	89 74 24 34          	mov    %esi,0x34(%rsp)
   192c4:	89 54 24 31          	mov    %edx,0x31(%rsp)
   192c8:	89 4c 24 2c          	mov    %ecx,0x2c(%rsp)
   192cc:	88 44 24 30          	mov    %al,0x30(%rsp)
   192d0:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
   192d5:	48 8d 54 24 2c       	lea    0x2c(%rsp),%rdx
   192da:	48 89 df             	mov    %rbx,%rdi
   192dd:	ff 15 2d 2c 04 00    	call   *0x42c2d(%rip)        # 5bf10 <_DYNAMIC+0x338>
   192e3:	e9 79 fe ff ff       	jmp    19161 <<hyperinterval::float::F32Enclosure>::affine+0x71>
   192e8:	cc                   	int3
   192e9:	cc                   	int3
   192ea:	cc                   	int3
   192eb:	cc                   	int3
   192ec:	cc                   	int3
   192ed:	cc                   	int3
   192ee:	cc                   	int3
   192ef:	cc                   	int3

<hyperinterval::float::F32Enclosure>::square:
   192f0:	55                   	push   %rbp
   192f1:	41 57                	push   %r15
   192f3:	41 56                	push   %r14
   192f5:	41 55                	push   %r13
   192f7:	41 54                	push   %r12
   192f9:	53                   	push   %rbx
   192fa:	48 83 ec 78          	sub    $0x78,%rsp
   192fe:	48 89 fb             	mov    %rdi,%rbx
   19301:	f6 06 01             	testb  $0x1,(%rsi)
   19304:	0f 84 e9 00 00 00    	je     193f3 <<hyperinterval::float::F32Enclosure>::square+0x103>
   1930a:	44 8b 76 04          	mov    0x4(%rsi),%r14d
   1930e:	8b 6e 08             	mov    0x8(%rsi),%ebp
   19311:	44 89 f0             	mov    %r14d,%eax
   19314:	c1 e8 17             	shr    $0x17,%eax
   19317:	0f b6 c0             	movzbl %al,%eax
   1931a:	44 89 f1             	mov    %r14d,%ecx
   1931d:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   19323:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   1932a:	85 c0                	test   %eax,%eax
   1932c:	8d 84 00 d4 fe ff ff 	lea    -0x12c(%rax,%rax,1),%eax
   19333:	48 0f 44 d1          	cmove  %rcx,%rdx
   19337:	41 bf d6 fe ff ff    	mov    $0xfffffed6,%r15d
   1933d:	41 0f 44 c7          	cmove  %r15d,%eax
   19341:	48 0f af d2          	imul   %rdx,%rdx
   19345:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1934a:	48 89 14 24          	mov    %rdx,(%rsp)
   1934e:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   19355:	00 00 
   19357:	89 44 24 10          	mov    %eax,0x10(%rsp)
   1935b:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   19360:	48 89 e1             	mov    %rsp,%rcx
   19363:	be 00 00 00 80       	mov    $0x80000000,%esi
   19368:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1936d:	e8 be 16 00 00       	call   1aa30 <<hyperinterval::ieee::Format>::rounded>
   19372:	80 7c 24 38 00       	cmpb   $0x0,0x38(%rsp)
   19377:	75 6a                	jne    193e3 <<hyperinterval::float::F32Enclosure>::square+0xf3>
   19379:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
   1937e:	44 8b 64 24 48       	mov    0x48(%rsp),%r12d
   19383:	89 e8                	mov    %ebp,%eax
   19385:	c1 e8 17             	shr    $0x17,%eax
   19388:	0f b6 c0             	movzbl %al,%eax
   1938b:	89 e9                	mov    %ebp,%ecx
   1938d:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   19393:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   1939a:	85 c0                	test   %eax,%eax
   1939c:	48 0f 44 d1          	cmove  %rcx,%rdx
   193a0:	8d 84 00 d4 fe ff ff 	lea    -0x12c(%rax,%rax,1),%eax
   193a7:	41 0f 44 c7          	cmove  %r15d,%eax
   193ab:	48 0f af d2          	imul   %rdx,%rdx
   193af:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   193b4:	48 89 14 24          	mov    %rdx,(%rsp)
   193b8:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   193bf:	00 00 
   193c1:	89 44 24 10          	mov    %eax,0x10(%rsp)
   193c5:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   193ca:	48 89 e1             	mov    %rsp,%rcx
   193cd:	be 00 00 00 80       	mov    $0x80000000,%esi
   193d2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   193d7:	e8 54 16 00 00       	call   1aa30 <<hyperinterval::ieee::Format>::rounded>
   193dc:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   193e1:	75 28                	jne    1940b <<hyperinterval::float::F32Enclosure>::square+0x11b>
   193e3:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
   193e8:	88 43 04             	mov    %al,0x4(%rbx)
   193eb:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   193f1:	eb 06                	jmp    193f9 <<hyperinterval::float::F32Enclosure>::square+0x109>
   193f3:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   193f9:	48 89 d8             	mov    %rbx,%rax
   193fc:	48 83 c4 78          	add    $0x78,%rsp
   19400:	5b                   	pop    %rbx
   19401:	41 5c                	pop    %r12
   19403:	41 5d                	pop    %r13
   19405:	41 5e                	pop    %r14
   19407:	41 5f                	pop    %r15
   19409:	5d                   	pop    %rbp
   1940a:	c3                   	ret
   1940b:	8b 44 24 40          	mov    0x40(%rsp),%eax
   1940f:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   19414:	44 8b 7c 24 48       	mov    0x48(%rsp),%r15d
   19419:	48 89 e7             	mov    %rsp,%rdi
   1941c:	be 00 00 00 80       	mov    $0x80000000,%esi
   19421:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19426:	4c 89 e9             	mov    %r13,%rcx
   19429:	e8 b2 ea ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1942e:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19432:	74 25                	je     19459 <<hyperinterval::float::F32Enclosure>::square+0x169>
   19434:	4c 89 7c 24 60       	mov    %r15,0x60(%rsp)
   19439:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1943e:	48 89 e7             	mov    %rsp,%rdi
   19441:	be 00 00 00 80       	mov    $0x80000000,%esi
   19446:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1944b:	4c 89 e1             	mov    %r12,%rcx
   1944e:	e8 8d ea ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   19453:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19457:	75 07                	jne    19460 <<hyperinterval::float::F32Enclosure>::square+0x170>
   19459:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1945e:	eb 88                	jmp    193e8 <<hyperinterval::float::F32Enclosure>::square+0xf8>
   19460:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   19465:	45 89 fd             	mov    %r15d,%r13d
   19468:	41 81 e5 ff ff ff 7f 	and    $0x7fffffff,%r13d
   1946f:	41 89 d4             	mov    %edx,%r12d
   19472:	41 81 e4 ff ff ff 7f 	and    $0x7fffffff,%r12d
   19479:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1947e:	4c 29 e8             	sub    %r13,%rax
   19481:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   19486:	49 09 cd             	or     %rcx,%r13
   19489:	45 85 ff             	test   %r15d,%r15d
   1948c:	4c 0f 48 e8          	cmovs  %rax,%r13
   19490:	b8 00 00 00 80       	mov    $0x80000000,%eax
   19495:	4c 29 e0             	sub    %r12,%rax
   19498:	49 09 cc             	or     %rcx,%r12
   1949b:	85 d2                	test   %edx,%edx
   1949d:	4c 0f 48 e0          	cmovs  %rax,%r12
   194a1:	b0 01                	mov    $0x1,%al
   194a3:	4d 39 e5             	cmp    %r12,%r13
   194a6:	0f 87 3c ff ff ff    	ja     193e8 <<hyperinterval::float::F32Enclosure>::square+0xf8>
   194ac:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   194b1:	48 89 e7             	mov    %rsp,%rdi
   194b4:	be 00 00 00 80       	mov    $0x80000000,%esi
   194b9:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   194be:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
   194c3:	e8 18 ea ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   194c8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   194cc:	74 27                	je     194f5 <<hyperinterval::float::F32Enclosure>::square+0x205>
   194ce:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   194d3:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   194d8:	48 89 e7             	mov    %rsp,%rdi
   194db:	be 00 00 00 80       	mov    $0x80000000,%esi
   194e0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   194e5:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   194ea:	e8 f1 e9 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   194ef:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   194f3:	75 13                	jne    19508 <<hyperinterval::float::F32Enclosure>::square+0x218>
   194f5:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   194fa:	88 53 04             	mov    %dl,0x4(%rbx)
   194fd:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19503:	e9 f1 fe ff ff       	jmp    193f9 <<hyperinterval::float::F32Enclosure>::square+0x109>
   19508:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1950d:	4c 8b 44 24 50       	mov    0x50(%rsp),%r8
   19512:	44 89 c1             	mov    %r8d,%ecx
   19515:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1951b:	89 c2                	mov    %eax,%edx
   1951d:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19523:	be 00 00 00 80       	mov    $0x80000000,%esi
   19528:	48 29 ce             	sub    %rcx,%rsi
   1952b:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19530:	48 09 f9             	or     %rdi,%rcx
   19533:	45 85 c0             	test   %r8d,%r8d
   19536:	48 0f 48 ce          	cmovs  %rsi,%rcx
   1953a:	48 8d 34 3a          	lea    (%rdx,%rdi,1),%rsi
   1953e:	48 29 d7             	sub    %rdx,%rdi
   19541:	85 c0                	test   %eax,%eax
   19543:	48 0f 49 fe          	cmovns %rsi,%rdi
   19547:	b2 01                	mov    $0x1,%dl
   19549:	48 39 f9             	cmp    %rdi,%rcx
   1954c:	77 ac                	ja     194fa <<hyperinterval::float::F32Enclosure>::square+0x20a>
   1954e:	41 39 cd             	cmp    %ecx,%r13d
   19551:	45 0f 47 f8          	cmova  %r8d,%r15d
   19555:	41 39 fc             	cmp    %edi,%r12d
   19558:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1955d:	0f 42 c8             	cmovb  %eax,%ecx
   19560:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%rsp)
   19567:	00 
   19568:	44 89 7c 24 2c       	mov    %r15d,0x2c(%rsp)
   1956d:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   19571:	45 85 f6             	test   %r14d,%r14d
   19574:	7f 6e                	jg     195e4 <<hyperinterval::float::F32Enclosure>::square+0x2f4>
   19576:	85 ed                	test   %ebp,%ebp
   19578:	0f 98 c0             	sets   %al
   1957b:	f7 c5 ff ff ff 7f    	test   $0x7fffffff,%ebp
   19581:	0f 95 c1             	setne  %cl
   19584:	84 c8                	test   %cl,%al
   19586:	75 5c                	jne    195e4 <<hyperinterval::float::F32Enclosure>::square+0x2f4>
   19588:	48 89 e7             	mov    %rsp,%rdi
   1958b:	31 f6                	xor    %esi,%esi
   1958d:	31 d2                	xor    %edx,%edx
   1958f:	e8 ac 03 00 00       	call   19940 <<hyperinterval::float::F32Enclosure>::from_bits>
   19594:	8b 0c 24             	mov    (%rsp),%ecx
   19597:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   1959c:	83 f9 02             	cmp    $0x2,%ecx
   1959f:	0f 84 43 fe ff ff    	je     193e8 <<hyperinterval::float::F32Enclosure>::square+0xf8>
   195a5:	8b 54 24 05          	mov    0x5(%rsp),%edx
   195a9:	8b 74 24 08          	mov    0x8(%rsp),%esi
   195ad:	89 74 24 40          	mov    %esi,0x40(%rsp)
   195b1:	89 54 24 3d          	mov    %edx,0x3d(%rsp)
   195b5:	89 4c 24 38          	mov    %ecx,0x38(%rsp)
   195b9:	88 44 24 3c          	mov    %al,0x3c(%rsp)
   195bd:	48 8d 7c 24 6c       	lea    0x6c(%rsp),%rdi
   195c2:	48 8d 74 24 28       	lea    0x28(%rsp),%rsi
   195c7:	48 8d 54 24 38       	lea    0x38(%rsp),%rdx
   195cc:	ff 15 3e 29 04 00    	call   *0x4293e(%rip)        # 5bf10 <_DYNAMIC+0x338>
   195d2:	8b 44 24 74          	mov    0x74(%rsp),%eax
   195d6:	89 44 24 30          	mov    %eax,0x30(%rsp)
   195da:	48 8b 44 24 6c       	mov    0x6c(%rsp),%rax
   195df:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   195e4:	8b 44 24 30          	mov    0x30(%rsp),%eax
   195e8:	89 43 08             	mov    %eax,0x8(%rbx)
   195eb:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   195f0:	48 89 03             	mov    %rax,(%rbx)
   195f3:	e9 01 fe ff ff       	jmp    193f9 <<hyperinterval::float::F32Enclosure>::square+0x109>
   195f8:	cc                   	int3
   195f9:	cc                   	int3
   195fa:	cc                   	int3
   195fb:	cc                   	int3
   195fc:	cc                   	int3
   195fd:	cc                   	int3
   195fe:	cc                   	int3
   195ff:	cc                   	int3

<hyperinterval::float::F32Enclosure>::next_up:
   19600:	48 83 ec 18          	sub    $0x18,%rsp
   19604:	66 0f 7e c1          	movd   %xmm0,%ecx
   19608:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1960d:	be 00 00 00 80       	mov    $0x80000000,%esi
   19612:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19617:	e8 c4 e8 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1961c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19621:	75 10                	jne    19633 <<hyperinterval::float::F32Enclosure>::next_up+0x33>
   19623:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   19628:	c1 e0 08             	shl    $0x8,%eax
   1962b:	48 ff c0             	inc    %rax
   1962e:	48 83 c4 18          	add    $0x18,%rsp
   19632:	c3                   	ret
   19633:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   19638:	31 c9                	xor    %ecx,%ecx
   1963a:	85 c0                	test   %eax,%eax
   1963c:	0f 99 c1             	setns  %cl
   1963f:	48 8d 0c 48          	lea    (%rax,%rcx,2),%rcx
   19643:	48 ff c9             	dec    %rcx
   19646:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1964b:	be 00 00 00 80       	mov    $0x80000000,%esi
   19650:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19655:	e8 86 e8 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1965a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1965f:	75 0a                	jne    1966b <<hyperinterval::float::F32Enclosure>::next_up+0x6b>
   19661:	b8 01 03 00 00       	mov    $0x301,%eax
   19666:	48 83 c4 18          	add    $0x18,%rsp
   1966a:	c3                   	ret
   1966b:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   19670:	48 c1 e0 20          	shl    $0x20,%rax
   19674:	48 83 c4 18          	add    $0x18,%rsp
   19678:	c3                   	ret
   19679:	cc                   	int3
   1967a:	cc                   	int3
   1967b:	cc                   	int3
   1967c:	cc                   	int3
   1967d:	cc                   	int3
   1967e:	cc                   	int3
   1967f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::disjoint:
   19680:	83 3f 00             	cmpl   $0x0,(%rdi)
   19683:	b0 01                	mov    $0x1,%al
   19685:	0f 84 a3 00 00 00    	je     1972e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   1968b:	8b 0e                	mov    (%rsi),%ecx
   1968d:	85 c9                	test   %ecx,%ecx
   1968f:	0f 84 99 00 00 00    	je     1972e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   19695:	f6 c1 01             	test   $0x1,%cl
   19698:	74 4c                	je     196e6 <<hyperinterval::float::F32Enclosure>::disjoint+0x66>
   1969a:	53                   	push   %rbx
   1969b:	8b 56 04             	mov    0x4(%rsi),%edx
   1969e:	44 8b 47 08          	mov    0x8(%rdi),%r8d
   196a2:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   196a8:	45 89 c2             	mov    %r8d,%r10d
   196ab:	45 09 ca             	or     %r9d,%r10d
   196ae:	45 89 c3             	mov    %r8d,%r11d
   196b1:	41 81 e3 ff ff ff 7f 	and    $0x7fffffff,%r11d
   196b8:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   196bd:	44 29 db             	sub    %r11d,%ebx
   196c0:	45 85 c0             	test   %r8d,%r8d
   196c3:	49 0f 49 da          	cmovns %r10,%rbx
   196c7:	41 89 d0             	mov    %edx,%r8d
   196ca:	45 09 c8             	or     %r9d,%r8d
   196cd:	41 89 d2             	mov    %edx,%r10d
   196d0:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   196d7:	45 29 d1             	sub    %r10d,%r9d
   196da:	85 d2                	test   %edx,%edx
   196dc:	4d 0f 49 c8          	cmovns %r8,%r9
   196e0:	44 39 cb             	cmp    %r9d,%ebx
   196e3:	5b                   	pop    %rbx
   196e4:	72 48                	jb     1972e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   196e6:	f6 c1 01             	test   $0x1,%cl
   196e9:	75 03                	jne    196ee <<hyperinterval::float::F32Enclosure>::disjoint+0x6e>
   196eb:	31 c0                	xor    %eax,%eax
   196ed:	c3                   	ret
   196ee:	8b 47 04             	mov    0x4(%rdi),%eax
   196f1:	8b 4e 08             	mov    0x8(%rsi),%ecx
   196f4:	ba 00 00 00 80       	mov    $0x80000000,%edx
   196f9:	89 ce                	mov    %ecx,%esi
   196fb:	09 d6                	or     %edx,%esi
   196fd:	89 cf                	mov    %ecx,%edi
   196ff:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   19705:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1970b:	41 29 f8             	sub    %edi,%r8d
   1970e:	85 c9                	test   %ecx,%ecx
   19710:	4c 0f 49 c6          	cmovns %rsi,%r8
   19714:	89 c1                	mov    %eax,%ecx
   19716:	09 d1                	or     %edx,%ecx
   19718:	89 c6                	mov    %eax,%esi
   1971a:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   19720:	29 f2                	sub    %esi,%edx
   19722:	85 c0                	test   %eax,%eax
   19724:	48 0f 49 d1          	cmovns %rcx,%rdx
   19728:	41 39 d0             	cmp    %edx,%r8d
   1972b:	0f 92 c0             	setb   %al
   1972e:	c3                   	ret
   1972f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::expanded:
   19730:	41 57                	push   %r15
   19732:	41 56                	push   %r14
   19734:	41 54                	push   %r12
   19736:	53                   	push   %rbx
   19737:	48 83 ec 18          	sub    $0x18,%rsp
   1973b:	48 89 fb             	mov    %rdi,%rbx
   1973e:	f6 06 01             	testb  $0x1,(%rsi)
   19741:	74 7c                	je     197bf <<hyperinterval::float::F32Enclosure>::expanded+0x8f>
   19743:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   19749:	8b 46 04             	mov    0x4(%rsi),%eax
   1974c:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   19750:	8d 88 00 00 00 80    	lea    -0x80000000(%rax),%ecx
   19756:	85 c0                	test   %eax,%eax
   19758:	0f 44 c8             	cmove  %eax,%ecx
   1975b:	31 c0                	xor    %eax,%eax
   1975d:	85 c9                	test   %ecx,%ecx
   1975f:	0f 99 c0             	setns  %al
   19762:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
   19766:	48 ff c9             	dec    %rcx
   19769:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1976e:	be 00 00 00 80       	mov    $0x80000000,%esi
   19773:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19778:	e8 63 e7 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1977d:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19782:	75 2f                	jne    197b3 <<hyperinterval::float::F32Enclosure>::expanded+0x83>
   19784:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   19789:	31 c0                	xor    %eax,%eax
   1978b:	45 85 f6             	test   %r14d,%r14d
   1978e:	0f 99 c0             	setns  %al
   19791:	49 8d 0c 46          	lea    (%r14,%rax,2),%rcx
   19795:	48 ff c9             	dec    %rcx
   19798:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1979d:	be 00 00 00 80       	mov    $0x80000000,%esi
   197a2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   197a7:	e8 34 e7 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   197ac:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   197b1:	75 21                	jne    197d4 <<hyperinterval::float::F32Enclosure>::expanded+0xa4>
   197b3:	c6 43 04 03          	movb   $0x3,0x4(%rbx)
   197b7:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   197bd:	eb 06                	jmp    197c5 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   197bf:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   197c5:	48 89 d8             	mov    %rbx,%rax
   197c8:	48 83 c4 18          	add    $0x18,%rsp
   197cc:	5b                   	pop    %rbx
   197cd:	41 5c                	pop    %r12
   197cf:	41 5e                	pop    %r14
   197d1:	41 5f                	pop    %r15
   197d3:	c3                   	ret
   197d4:	44 89 e1             	mov    %r12d,%ecx
   197d7:	4c 31 f9             	xor    %r15,%rcx
   197da:	4d 85 e4             	test   %r12,%r12
   197dd:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   197e2:	49 0f 44 cc          	cmove  %r12,%rcx
   197e6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   197eb:	be 00 00 00 80       	mov    $0x80000000,%esi
   197f0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   197f5:	e8 e6 e6 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   197fa:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   197ff:	74 23                	je     19824 <<hyperinterval::float::F32Enclosure>::expanded+0xf4>
   19801:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   19806:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1980b:	be 00 00 00 80       	mov    $0x80000000,%esi
   19810:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19815:	4c 89 f1             	mov    %r14,%rcx
   19818:	e8 c3 e6 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1981d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19822:	75 10                	jne    19834 <<hyperinterval::float::F32Enclosure>::expanded+0x104>
   19824:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   19829:	88 43 04             	mov    %al,0x4(%rbx)
   1982c:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19832:	eb 91                	jmp    197c5 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   19834:	8b 44 24 10          	mov    0x10(%rsp),%eax
   19838:	44 89 e1             	mov    %r12d,%ecx
   1983b:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19841:	89 c2                	mov    %eax,%edx
   19843:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19849:	be 00 00 00 80       	mov    $0x80000000,%esi
   1984e:	29 ce                	sub    %ecx,%esi
   19850:	44 09 f9             	or     %r15d,%ecx
   19853:	45 85 e4             	test   %r12d,%r12d
   19856:	48 0f 49 f1          	cmovns %rcx,%rsi
   1985a:	89 d1                	mov    %edx,%ecx
   1985c:	44 09 f9             	or     %r15d,%ecx
   1985f:	41 29 d7             	sub    %edx,%r15d
   19862:	85 c0                	test   %eax,%eax
   19864:	4c 0f 49 f9          	cmovns %rcx,%r15
   19868:	44 39 fe             	cmp    %r15d,%esi
   1986b:	76 0f                	jbe    1987c <<hyperinterval::float::F32Enclosure>::expanded+0x14c>
   1986d:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   19871:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19877:	e9 49 ff ff ff       	jmp    197c5 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   1987c:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   19882:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   19886:	89 43 08             	mov    %eax,0x8(%rbx)
   19889:	e9 37 ff ff ff       	jmp    197c5 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   1988e:	cc                   	int3
   1988f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::overlaps:
   19890:	31 c0                	xor    %eax,%eax
   19892:	83 3f 00             	cmpl   $0x0,(%rdi)
   19895:	0f 84 a1 00 00 00    	je     1993c <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1989b:	8b 0e                	mov    (%rsi),%ecx
   1989d:	85 c9                	test   %ecx,%ecx
   1989f:	0f 84 97 00 00 00    	je     1993c <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   198a5:	f6 c1 01             	test   $0x1,%cl
   198a8:	74 4b                	je     198f5 <<hyperinterval::float::F32Enclosure>::overlaps+0x65>
   198aa:	8b 46 04             	mov    0x4(%rsi),%eax
   198ad:	8b 57 08             	mov    0x8(%rdi),%edx
   198b0:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   198b6:	41 89 d1             	mov    %edx,%r9d
   198b9:	45 09 c1             	or     %r8d,%r9d
   198bc:	41 89 d2             	mov    %edx,%r10d
   198bf:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   198c6:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   198cc:	45 29 d3             	sub    %r10d,%r11d
   198cf:	85 d2                	test   %edx,%edx
   198d1:	4d 0f 49 d9          	cmovns %r9,%r11
   198d5:	89 c2                	mov    %eax,%edx
   198d7:	44 09 c2             	or     %r8d,%edx
   198da:	41 89 c1             	mov    %eax,%r9d
   198dd:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   198e4:	45 29 c8             	sub    %r9d,%r8d
   198e7:	85 c0                	test   %eax,%eax
   198e9:	4c 0f 49 c2          	cmovns %rdx,%r8
   198ed:	45 39 c3             	cmp    %r8d,%r11d
   198f0:	73 03                	jae    198f5 <<hyperinterval::float::F32Enclosure>::overlaps+0x65>
   198f2:	31 c0                	xor    %eax,%eax
   198f4:	c3                   	ret
   198f5:	b0 01                	mov    $0x1,%al
   198f7:	f6 c1 01             	test   $0x1,%cl
   198fa:	74 40                	je     1993c <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   198fc:	8b 47 04             	mov    0x4(%rdi),%eax
   198ff:	8b 4e 08             	mov    0x8(%rsi),%ecx
   19902:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19907:	89 ce                	mov    %ecx,%esi
   19909:	09 d6                	or     %edx,%esi
   1990b:	89 cf                	mov    %ecx,%edi
   1990d:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   19913:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   19919:	41 29 f8             	sub    %edi,%r8d
   1991c:	85 c9                	test   %ecx,%ecx
   1991e:	4c 0f 49 c6          	cmovns %rsi,%r8
   19922:	89 c1                	mov    %eax,%ecx
   19924:	09 d1                	or     %edx,%ecx
   19926:	89 c6                	mov    %eax,%esi
   19928:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1992e:	29 f2                	sub    %esi,%edx
   19930:	85 c0                	test   %eax,%eax
   19932:	48 0f 49 d1          	cmovns %rcx,%rdx
   19936:	41 39 d0             	cmp    %edx,%r8d
   19939:	0f 93 c0             	setae  %al
   1993c:	c3                   	ret
   1993d:	cc                   	int3
   1993e:	cc                   	int3
   1993f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::from_bits:
   19940:	41 57                	push   %r15
   19942:	41 56                	push   %r14
   19944:	41 54                	push   %r12
   19946:	53                   	push   %rbx
   19947:	48 83 ec 18          	sub    $0x18,%rsp
   1994b:	49 89 d6             	mov    %rdx,%r14
   1994e:	48 89 fb             	mov    %rdi,%rbx
   19951:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   19957:	89 f1                	mov    %esi,%ecx
   19959:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1995e:	be 00 00 00 80       	mov    $0x80000000,%esi
   19963:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19968:	e8 73 e5 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1996d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19972:	74 23                	je     19997 <<hyperinterval::float::F32Enclosure>::from_bits+0x57>
   19974:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   19979:	44 89 f1             	mov    %r14d,%ecx
   1997c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19981:	be 00 00 00 80       	mov    $0x80000000,%esi
   19986:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1998b:	e8 50 e5 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   19990:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19995:	75 1a                	jne    199b1 <<hyperinterval::float::F32Enclosure>::from_bits+0x71>
   19997:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1999c:	88 43 04             	mov    %al,0x4(%rbx)
   1999f:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   199a5:	48 83 c4 18          	add    $0x18,%rsp
   199a9:	5b                   	pop    %rbx
   199aa:	41 5c                	pop    %r12
   199ac:	41 5e                	pop    %r14
   199ae:	41 5f                	pop    %r15
   199b0:	c3                   	ret
   199b1:	8b 44 24 10          	mov    0x10(%rsp),%eax
   199b5:	44 89 e1             	mov    %r12d,%ecx
   199b8:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   199be:	89 c2                	mov    %eax,%edx
   199c0:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   199c6:	be 00 00 00 80       	mov    $0x80000000,%esi
   199cb:	29 ce                	sub    %ecx,%esi
   199cd:	44 09 f9             	or     %r15d,%ecx
   199d0:	45 85 e4             	test   %r12d,%r12d
   199d3:	48 0f 49 f1          	cmovns %rcx,%rsi
   199d7:	89 d1                	mov    %edx,%ecx
   199d9:	44 09 f9             	or     %r15d,%ecx
   199dc:	41 29 d7             	sub    %edx,%r15d
   199df:	85 c0                	test   %eax,%eax
   199e1:	4c 0f 49 f9          	cmovns %rcx,%r15
   199e5:	44 39 fe             	cmp    %r15d,%esi
   199e8:	76 06                	jbe    199f0 <<hyperinterval::float::F32Enclosure>::from_bits+0xb0>
   199ea:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   199ee:	eb af                	jmp    1999f <<hyperinterval::float::F32Enclosure>::from_bits+0x5f>
   199f0:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   199f6:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   199fa:	89 43 08             	mov    %eax,0x8(%rbx)
   199fd:	eb a6                	jmp    199a5 <<hyperinterval::float::F32Enclosure>::from_bits+0x65>
   199ff:	cc                   	int3

<hyperinterval::float::F32Enclosure>::next_down:
   19a00:	53                   	push   %rbx
   19a01:	48 83 ec 10          	sub    $0x10,%rsp
   19a05:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   19a0a:	66 0f 7e c1          	movd   %xmm0,%ecx
   19a0e:	48 89 e7             	mov    %rsp,%rdi
   19a11:	be 00 00 00 80       	mov    $0x80000000,%esi
   19a16:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19a1b:	e8 c0 e4 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   19a20:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19a24:	75 11                	jne    19a37 <<hyperinterval::float::F32Enclosure>::next_down+0x37>
   19a26:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   19a2b:	c1 e0 08             	shl    $0x8,%eax
   19a2e:	48 ff c0             	inc    %rax
   19a31:	48 83 c4 10          	add    $0x10,%rsp
   19a35:	5b                   	pop    %rbx
   19a36:	c3                   	ret
   19a37:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19a3c:	48 89 c1             	mov    %rax,%rcx
   19a3f:	48 31 d9             	xor    %rbx,%rcx
   19a42:	48 85 c0             	test   %rax,%rax
   19a45:	48 0f 44 c8          	cmove  %rax,%rcx
   19a49:	31 c0                	xor    %eax,%eax
   19a4b:	85 c9                	test   %ecx,%ecx
   19a4d:	0f 99 c0             	setns  %al
   19a50:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
   19a54:	48 ff c9             	dec    %rcx
   19a57:	48 89 e7             	mov    %rsp,%rdi
   19a5a:	be 00 00 00 80       	mov    $0x80000000,%esi
   19a5f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19a64:	e8 77 e4 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   19a69:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19a6d:	75 0b                	jne    19a7a <<hyperinterval::float::F32Enclosure>::next_down+0x7a>
   19a6f:	b8 01 03 00 00       	mov    $0x301,%eax
   19a74:	48 83 c4 10          	add    $0x10,%rsp
   19a78:	5b                   	pop    %rbx
   19a79:	c3                   	ret
   19a7a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19a7f:	48 89 c8             	mov    %rcx,%rax
   19a82:	48 35 00 00 00 80    	xor    $0xffffffff80000000,%rax
   19a88:	48 c1 e0 20          	shl    $0x20,%rax
   19a8c:	48 85 c9             	test   %rcx,%rcx
   19a8f:	48 0f 44 c1          	cmove  %rcx,%rax
   19a93:	48 83 c4 10          	add    $0x10,%rsp
   19a97:	5b                   	pop    %rbx
   19a98:	c3                   	ret
   19a99:	cc                   	int3
   19a9a:	cc                   	int3
   19a9b:	cc                   	int3
   19a9c:	cc                   	int3
   19a9d:	cc                   	int3
   19a9e:	cc                   	int3
   19a9f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::subset_of:
   19aa0:	b0 01                	mov    $0x1,%al
   19aa2:	f6 07 01             	testb  $0x1,(%rdi)
   19aa5:	74 50                	je     19af7 <<hyperinterval::float::F32Enclosure>::subset_of+0x57>
   19aa7:	f6 06 01             	testb  $0x1,(%rsi)
   19aaa:	74 49                	je     19af5 <<hyperinterval::float::F32Enclosure>::subset_of+0x55>
   19aac:	8b 4f 04             	mov    0x4(%rdi),%ecx
   19aaf:	8b 56 04             	mov    0x4(%rsi),%edx
   19ab2:	b8 00 00 00 80       	mov    $0x80000000,%eax
   19ab7:	44 8d 04 02          	lea    (%rdx,%rax,1),%r8d
   19abb:	41 89 d1             	mov    %edx,%r9d
   19abe:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   19ac5:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   19acb:	45 29 ca             	sub    %r9d,%r10d
   19ace:	85 d2                	test   %edx,%edx
   19ad0:	4d 0f 49 d0          	cmovns %r8,%r10
   19ad4:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   19ad7:	41 89 c8             	mov    %ecx,%r8d
   19ada:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   19ae1:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   19ae7:	45 29 c1             	sub    %r8d,%r9d
   19aea:	85 c9                	test   %ecx,%ecx
   19aec:	4c 0f 49 ca          	cmovns %rdx,%r9
   19af0:	45 39 ca             	cmp    %r9d,%r10d
   19af3:	76 03                	jbe    19af8 <<hyperinterval::float::F32Enclosure>::subset_of+0x58>
   19af5:	31 c0                	xor    %eax,%eax
   19af7:	c3                   	ret
   19af8:	8b 4f 08             	mov    0x8(%rdi),%ecx
   19afb:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   19afe:	89 cf                	mov    %ecx,%edi
   19b00:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   19b06:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   19b0c:	41 29 f8             	sub    %edi,%r8d
   19b0f:	85 c9                	test   %ecx,%ecx
   19b11:	4c 0f 49 c2          	cmovns %rdx,%r8
   19b15:	8b 4e 08             	mov    0x8(%rsi),%ecx
   19b18:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   19b1b:	89 ce                	mov    %ecx,%esi
   19b1d:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   19b23:	29 f0                	sub    %esi,%eax
   19b25:	85 c9                	test   %ecx,%ecx
   19b27:	48 0f 49 c2          	cmovns %rdx,%rax
   19b2b:	41 39 c0             	cmp    %eax,%r8d
   19b2e:	0f 96 c0             	setbe  %al
   19b31:	c3                   	ret
   19b32:	cc                   	int3
   19b33:	cc                   	int3
   19b34:	cc                   	int3
   19b35:	cc                   	int3
   19b36:	cc                   	int3
   19b37:	cc                   	int3
   19b38:	cc                   	int3
   19b39:	cc                   	int3
   19b3a:	cc                   	int3
   19b3b:	cc                   	int3
   19b3c:	cc                   	int3
   19b3d:	cc                   	int3
   19b3e:	cc                   	int3
   19b3f:	cc                   	int3

<hyperinterval::ieee::Format>::add:
   19b40:	48 85 c9             	test   %rcx,%rcx
   19b43:	74 50                	je     19b95 <<hyperinterval::ieee::Format>::add+0x55>
   19b45:	48 89 c8             	mov    %rcx,%rax
   19b48:	4d 85 c0             	test   %r8,%r8
   19b4b:	74 54                	je     19ba1 <<hyperinterval::ieee::Format>::add+0x61>
   19b4d:	55                   	push   %rbp
   19b4e:	41 57                	push   %r15
   19b50:	41 56                	push   %r14
   19b52:	41 55                	push   %r13
   19b54:	41 54                	push   %r12
   19b56:	53                   	push   %rbx
   19b57:	48 83 ec 38          	sub    $0x38,%rsp
   19b5b:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
   19b60:	49 89 c7             	mov    %rax,%r15
   19b63:	49 21 d7             	and    %rdx,%r15
   19b66:	44 89 c9             	mov    %r9d,%ecx
   19b69:	49 d3 ef             	shr    %cl,%r15
   19b6c:	41 bd 01 00 00 00    	mov    $0x1,%r13d
   19b72:	49 d3 e5             	shl    %cl,%r13
   19b75:	49 8d 5d ff          	lea    -0x1(%r13),%rbx
   19b79:	49 89 de             	mov    %rbx,%r14
   19b7c:	49 21 c6             	and    %rax,%r14
   19b7f:	49 89 d2             	mov    %rdx,%r10
   19b82:	49 d3 ea             	shr    %cl,%r10
   19b85:	4d 85 ff             	test   %r15,%r15
   19b88:	74 23                	je     19bad <<hyperinterval::ieee::Format>::add+0x6d>
   19b8a:	4d 09 ee             	or     %r13,%r14
   19b8d:	49 d1 ea             	shr    $1,%r10
   19b90:	45 01 ca             	add    %r9d,%r10d
   19b93:	eb 24                	jmp    19bb9 <<hyperinterval::ieee::Format>::add+0x79>
   19b95:	4c 89 47 08          	mov    %r8,0x8(%rdi)
   19b99:	4c 89 47 10          	mov    %r8,0x10(%rdi)
   19b9d:	c6 07 00             	movb   $0x0,(%rdi)
   19ba0:	c3                   	ret
   19ba1:	48 89 47 08          	mov    %rax,0x8(%rdi)
   19ba5:	48 89 47 10          	mov    %rax,0x10(%rdi)
   19ba9:	c6 07 00             	movb   $0x0,(%rdi)
   19bac:	c3                   	ret
   19bad:	49 d1 ea             	shr    $1,%r10
   19bb0:	45 01 ca             	add    %r9d,%r10d
   19bb3:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   19bb9:	45 29 d7             	sub    %r10d,%r15d
   19bbc:	48 85 f0             	test   %rsi,%rax
   19bbf:	0f 95 44 24 0f       	setne  0xf(%rsp)
   19bc4:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   19bc9:	49 0f bd ce          	bsr    %r14,%rcx
   19bcd:	83 f1 3f             	xor    $0x3f,%ecx
   19bd0:	46 8d 1c 09          	lea    (%rcx,%r9,1),%r11d
   19bd4:	41 83 c3 c1          	add    $0xffffffc1,%r11d
   19bd8:	45 31 e4             	xor    %r12d,%r12d
   19bdb:	44 89 d9             	mov    %r11d,%ecx
   19bde:	4d 0f a5 f4          	shld   %cl,%r14,%r12
   19be2:	49 d3 e6             	shl    %cl,%r14
   19be5:	31 c9                	xor    %ecx,%ecx
   19be7:	41 f6 c3 40          	test   $0x40,%r11b
   19beb:	4d 0f 45 e6          	cmovne %r14,%r12
   19bef:	4c 0f 45 f1          	cmovne %rcx,%r14
   19bf3:	4d 89 c2             	mov    %r8,%r10
   19bf6:	49 21 d2             	and    %rdx,%r10
   19bf9:	44 89 c9             	mov    %r9d,%ecx
   19bfc:	49 d3 ea             	shr    %cl,%r10
   19bff:	41 8d 69 81          	lea    -0x7f(%r9),%ebp
   19c03:	45 29 df             	sub    %r11d,%r15d
   19c06:	4c 21 c3             	and    %r8,%rbx
   19c09:	49 89 d3             	mov    %rdx,%r11
   19c0c:	49 d3 eb             	shr    %cl,%r11
   19c0f:	4d 85 d2             	test   %r10,%r10
   19c12:	74 0b                	je     19c1f <<hyperinterval::ieee::Format>::add+0xdf>
   19c14:	4c 09 eb             	or     %r13,%rbx
   19c17:	49 d1 eb             	shr    $1,%r11
   19c1a:	45 01 cb             	add    %r9d,%r11d
   19c1d:	eb 0c                	jmp    19c2b <<hyperinterval::ieee::Format>::add+0xeb>
   19c1f:	49 d1 eb             	shr    $1,%r11
   19c22:	45 01 cb             	add    %r9d,%r11d
   19c25:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   19c2b:	45 29 da             	sub    %r11d,%r10d
   19c2e:	49 85 f0             	test   %rsi,%r8
   19c31:	41 0f 95 c5          	setne  %r13b
   19c35:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   19c3a:	48 0f bd cb          	bsr    %rbx,%rcx
   19c3e:	83 f1 3f             	xor    $0x3f,%ecx
   19c41:	01 e9                	add    %ebp,%ecx
   19c43:	83 c1 40             	add    $0x40,%ecx
   19c46:	45 31 db             	xor    %r11d,%r11d
   19c49:	49 0f a5 db          	shld   %cl,%rbx,%r11
   19c4d:	48 d3 e3             	shl    %cl,%rbx
   19c50:	45 31 c9             	xor    %r9d,%r9d
   19c53:	f6 c1 40             	test   $0x40,%cl
   19c56:	4c 0f 45 db          	cmovne %rbx,%r11
   19c5a:	49 0f 45 d9          	cmovne %r9,%rbx
   19c5e:	41 29 ca             	sub    %ecx,%r10d
   19c61:	45 39 d7             	cmp    %r10d,%r15d
   19c64:	7d 76                	jge    19cdc <<hyperinterval::ieee::Format>::add+0x19c>
   19c66:	44 89 f9             	mov    %r15d,%ecx
   19c69:	44 0f b6 7c 24 0f    	movzbl 0xf(%rsp),%r15d
   19c6f:	4d 89 f1             	mov    %r14,%r9
   19c72:	4c 89 e5             	mov    %r12,%rbp
   19c75:	4d 89 c6             	mov    %r8,%r14
   19c78:	45 89 ec             	mov    %r13d,%r12d
   19c7b:	45 89 fd             	mov    %r15d,%r13d
   19c7e:	41 29 ca             	sub    %ecx,%r10d
   19c81:	41 83 fa 4a          	cmp    $0x4a,%r10d
   19c85:	7f 79                	jg     19d00 <<hyperinterval::ieee::Format>::add+0x1c0>
   19c87:	41 89 cf             	mov    %ecx,%r15d
   19c8a:	49 85 f0             	test   %rsi,%r8
   19c8d:	41 0f 95 c0          	setne  %r8b
   19c91:	48 85 f0             	test   %rsi,%rax
   19c94:	41 0f 95 c6          	setne  %r14b
   19c98:	44 89 d1             	mov    %r10d,%ecx
   19c9b:	49 0f a5 db          	shld   %cl,%rbx,%r11
   19c9f:	48 d3 e3             	shl    %cl,%rbx
   19ca2:	31 c0                	xor    %eax,%eax
   19ca4:	41 f6 c2 40          	test   $0x40,%r10b
   19ca8:	4c 0f 45 db          	cmovne %rbx,%r11
   19cac:	48 0f 44 c3          	cmove  %rbx,%rax
   19cb0:	45 30 c6             	xor    %r8b,%r14b
   19cb3:	0f 84 98 00 00 00    	je     19d51 <<hyperinterval::ieee::Format>::add+0x211>
   19cb9:	4c 39 c8             	cmp    %r9,%rax
   19cbc:	4c 89 d9             	mov    %r11,%rcx
   19cbf:	48 19 e9             	sbb    %rbp,%rcx
   19cc2:	0f 83 bb 00 00 00    	jae    19d83 <<hyperinterval::ieee::Format>::add+0x243>
   19cc8:	49 29 c1             	sub    %rax,%r9
   19ccb:	4c 19 dd             	sbb    %r11,%rbp
   19cce:	45 89 ec             	mov    %r13d,%r12d
   19cd1:	4c 89 c8             	mov    %r9,%rax
   19cd4:	49 89 eb             	mov    %rbp,%r11
   19cd7:	e9 ad 00 00 00       	jmp    19d89 <<hyperinterval::ieee::Format>::add+0x249>
   19cdc:	44 89 d1             	mov    %r10d,%ecx
   19cdf:	49 89 d9             	mov    %rbx,%r9
   19ce2:	4c 89 dd             	mov    %r11,%rbp
   19ce5:	4d 89 e3             	mov    %r12,%r11
   19ce8:	4c 89 f3             	mov    %r14,%rbx
   19ceb:	44 0f b6 64 24 0f    	movzbl 0xf(%rsp),%r12d
   19cf1:	45 89 fa             	mov    %r15d,%r10d
   19cf4:	49 89 c6             	mov    %rax,%r14
   19cf7:	41 29 ca             	sub    %ecx,%r10d
   19cfa:	41 83 fa 4a          	cmp    $0x4a,%r10d
   19cfe:	7e 87                	jle    19c87 <<hyperinterval::ieee::Format>::add+0x147>
   19d00:	48 89 fb             	mov    %rdi,%rbx
   19d03:	4c 89 f0             	mov    %r14,%rax
   19d06:	45 84 ed             	test   %r13b,%r13b
   19d09:	74 4e                	je     19d59 <<hyperinterval::ieee::Format>::add+0x219>
   19d0b:	48 31 f0             	xor    %rsi,%rax
   19d0e:	48 89 c1             	mov    %rax,%rcx
   19d11:	48 21 f1             	and    %rsi,%rcx
   19d14:	31 ff                	xor    %edi,%edi
   19d16:	48 f7 d9             	neg    %rcx
   19d19:	40 0f 93 c7          	setae  %dil
   19d1d:	48 8d 0c 78          	lea    (%rax,%rdi,2),%rcx
   19d21:	48 ff c9             	dec    %rcx
   19d24:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   19d29:	49 89 f7             	mov    %rsi,%r15
   19d2c:	e8 af e1 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   19d31:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   19d36:	75 44                	jne    19d7c <<hyperinterval::ieee::Format>::add+0x23c>
   19d38:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   19d3d:	49 31 c7             	xor    %rax,%r15
   19d40:	48 85 c0             	test   %rax,%rax
   19d43:	4c 0f 44 f8          	cmove  %rax,%r15
   19d47:	4c 89 7b 08          	mov    %r15,0x8(%rbx)
   19d4b:	4c 89 73 10          	mov    %r14,0x10(%rbx)
   19d4f:	eb 65                	jmp    19db6 <<hyperinterval::ieee::Format>::add+0x276>
   19d51:	4c 01 c8             	add    %r9,%rax
   19d54:	49 11 eb             	adc    %rbp,%r11
   19d57:	eb 30                	jmp    19d89 <<hyperinterval::ieee::Format>::add+0x249>
   19d59:	48 21 f0             	and    %rsi,%rax
   19d5c:	31 c9                	xor    %ecx,%ecx
   19d5e:	48 f7 d8             	neg    %rax
   19d61:	0f 93 c1             	setae  %cl
   19d64:	49 8d 0c 4e          	lea    (%r14,%rcx,2),%rcx
   19d68:	48 ff c9             	dec    %rcx
   19d6b:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   19d70:	e8 6b e1 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   19d75:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   19d7a:	74 2d                	je     19da9 <<hyperinterval::ieee::Format>::add+0x269>
   19d7c:	66 c7 03 01 03       	movw   $0x301,(%rbx)
   19d81:	eb 36                	jmp    19db9 <<hyperinterval::ieee::Format>::add+0x279>
   19d83:	4c 29 c8             	sub    %r9,%rax
   19d86:	49 19 eb             	sbb    %rbp,%r11
   19d89:	44 88 64 24 24       	mov    %r12b,0x24(%rsp)
   19d8e:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   19d93:	4c 89 5c 24 18       	mov    %r11,0x18(%rsp)
   19d98:	44 89 7c 24 20       	mov    %r15d,0x20(%rsp)
   19d9d:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   19da2:	e8 89 0c 00 00       	call   1aa30 <<hyperinterval::ieee::Format>::rounded>
   19da7:	eb 10                	jmp    19db9 <<hyperinterval::ieee::Format>::add+0x279>
   19da9:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   19dae:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   19db2:	48 89 43 10          	mov    %rax,0x10(%rbx)
   19db6:	c6 03 00             	movb   $0x0,(%rbx)
   19db9:	48 83 c4 38          	add    $0x38,%rsp
   19dbd:	5b                   	pop    %rbx
   19dbe:	41 5c                	pop    %r12
   19dc0:	41 5d                	pop    %r13
   19dc2:	41 5e                	pop    %r14
   19dc4:	41 5f                	pop    %r15
   19dc6:	5d                   	pop    %rbp
   19dc7:	c3                   	ret
   19dc8:	cc                   	int3
   19dc9:	cc                   	int3
   19dca:	cc                   	int3
   19dcb:	cc                   	int3
   19dcc:	cc                   	int3
   19dcd:	cc                   	int3
   19dce:	cc                   	int3
   19dcf:	cc                   	int3

<hyperinterval::ieee::Format>::div:
   19dd0:	55                   	push   %rbp
   19dd1:	41 57                	push   %r15
   19dd3:	41 56                	push   %r14
   19dd5:	41 55                	push   %r13
   19dd7:	41 54                	push   %r12
   19dd9:	53                   	push   %rbx
   19dda:	48 83 ec 38          	sub    $0x38,%rsp
   19dde:	4d 85 c0             	test   %r8,%r8
   19de1:	74 47                	je     19e2a <<hyperinterval::ieee::Format>::div+0x5a>
   19de3:	48 85 c9             	test   %rcx,%rcx
   19de6:	74 4c                	je     19e34 <<hyperinterval::ieee::Format>::div+0x64>
   19de8:	f3 4c 0f bc f2       	tzcnt  %rdx,%r14
   19ded:	49 89 c9             	mov    %rcx,%r9
   19df0:	49 21 d1             	and    %rdx,%r9
   19df3:	48 89 c8             	mov    %rcx,%rax
   19df6:	44 89 f1             	mov    %r14d,%ecx
   19df9:	49 d3 e9             	shr    %cl,%r9
   19dfc:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   19e02:	49 d3 e2             	shl    %cl,%r10
   19e05:	49 8d 6a ff          	lea    -0x1(%r10),%rbp
   19e09:	49 89 ec             	mov    %rbp,%r12
   19e0c:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   19e11:	49 21 c4             	and    %rax,%r12
   19e14:	48 89 d0             	mov    %rdx,%rax
   19e17:	48 d3 e8             	shr    %cl,%rax
   19e1a:	4d 85 c9             	test   %r9,%r9
   19e1d:	74 24                	je     19e43 <<hyperinterval::ieee::Format>::div+0x73>
   19e1f:	4d 09 d4             	or     %r10,%r12
   19e22:	48 d1 e8             	shr    $1,%rax
   19e25:	44 01 f0             	add    %r14d,%eax
   19e28:	eb 25                	jmp    19e4f <<hyperinterval::ieee::Format>::div+0x7f>
   19e2a:	66 c7 07 01 04       	movw   $0x401,(%rdi)
   19e2f:	e9 ae 03 00 00       	jmp    1a1e2 <<hyperinterval::ieee::Format>::div+0x412>
   19e34:	c6 07 00             	movb   $0x0,(%rdi)
   19e37:	0f 57 c0             	xorps  %xmm0,%xmm0
   19e3a:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   19e3e:	e9 9f 03 00 00       	jmp    1a1e2 <<hyperinterval::ieee::Format>::div+0x412>
   19e43:	48 d1 e8             	shr    $1,%rax
   19e46:	44 01 f0             	add    %r14d,%eax
   19e49:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   19e4f:	41 29 c1             	sub    %eax,%r9d
   19e52:	4d 89 c3             	mov    %r8,%r11
   19e55:	49 21 d3             	and    %rdx,%r11
   19e58:	44 89 f1             	mov    %r14d,%ecx
   19e5b:	49 d3 eb             	shr    %cl,%r11
   19e5e:	4c 21 c5             	and    %r8,%rbp
   19e61:	48 89 d0             	mov    %rdx,%rax
   19e64:	48 d3 e8             	shr    %cl,%rax
   19e67:	4d 85 db             	test   %r11,%r11
   19e6a:	74 0e                	je     19e7a <<hyperinterval::ieee::Format>::div+0xaa>
   19e6c:	4c 09 d5             	or     %r10,%rbp
   19e6f:	48 d1 e8             	shr    $1,%rax
   19e72:	44 01 f0             	add    %r14d,%eax
   19e75:	44 29 d8             	sub    %r11d,%eax
   19e78:	eb 08                	jmp    19e82 <<hyperinterval::ieee::Format>::div+0xb2>
   19e7a:	48 d1 e8             	shr    $1,%rax
   19e7d:	44 01 f0             	add    %r14d,%eax
   19e80:	ff c8                	dec    %eax
   19e82:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   19e87:	41 ba 7f 00 00 00    	mov    $0x7f,%r10d
   19e8d:	4c 0f bd d5          	bsr    %rbp,%r10
   19e91:	41 83 f2 3f          	xor    $0x3f,%r10d
   19e95:	41 83 c2 40          	add    $0x40,%r10d
   19e99:	49 0f bd cc          	bsr    %r12,%rcx
   19e9d:	83 f1 3f             	xor    $0x3f,%ecx
   19ea0:	45 89 d7             	mov    %r10d,%r15d
   19ea3:	41 29 cf             	sub    %ecx,%r15d
   19ea6:	41 83 c7 c0          	add    $0xffffffc0,%r15d
   19eaa:	78 26                	js     19ed2 <<hyperinterval::ieee::Format>::div+0x102>
   19eac:	45 31 db             	xor    %r11d,%r11d
   19eaf:	44 89 f9             	mov    %r15d,%ecx
   19eb2:	49 0f a5 eb          	shld   %cl,%rbp,%r11
   19eb6:	31 db                	xor    %ebx,%ebx
   19eb8:	49 89 ed             	mov    %rbp,%r13
   19ebb:	49 d3 e5             	shl    %cl,%r13
   19ebe:	41 f6 c7 40          	test   $0x40,%r15b
   19ec2:	4d 0f 45 dd          	cmovne %r13,%r11
   19ec6:	4c 0f 45 eb          	cmovne %rbx,%r13
   19eca:	4d 39 ec             	cmp    %r13,%r12
   19ecd:	4c 19 db             	sbb    %r11,%rbx
   19ed0:	eb 26                	jmp    19ef8 <<hyperinterval::ieee::Format>::div+0x128>
   19ed2:	44 89 f9             	mov    %r15d,%ecx
   19ed5:	f6 d9                	neg    %cl
   19ed7:	45 31 db             	xor    %r11d,%r11d
   19eda:	4d 0f a5 e3          	shld   %cl,%r12,%r11
   19ede:	31 db                	xor    %ebx,%ebx
   19ee0:	4d 89 e5             	mov    %r12,%r13
   19ee3:	49 d3 e5             	shl    %cl,%r13
   19ee6:	f6 c1 40             	test   $0x40,%cl
   19ee9:	4d 0f 45 dd          	cmovne %r13,%r11
   19eed:	4c 0f 45 eb          	cmovne %rbx,%r13
   19ef1:	49 39 ed             	cmp    %rbp,%r13
   19ef4:	49 83 db 00          	sbb    $0x0,%r11
   19ef8:	41 0f 92 c3          	setb   %r11b
   19efc:	44 89 f1             	mov    %r14d,%ecx
   19eff:	48 d3 ea             	shr    %cl,%rdx
   19f02:	44 01 c8             	add    %r9d,%eax
   19f05:	41 01 c7             	add    %eax,%r15d
   19f08:	41 0f b6 cb          	movzbl %r11b,%ecx
   19f0c:	41 29 cf             	sub    %ecx,%r15d
   19f0f:	48 d1 ea             	shr    $1,%rdx
   19f12:	41 39 d7             	cmp    %edx,%r15d
   19f15:	0f 8f 0e 02 00 00    	jg     1a129 <<hyperinterval::ieee::Format>::div+0x359>
   19f1b:	45 8d 0c 16          	lea    (%r14,%rdx,1),%r9d
   19f1f:	b9 01 00 00 00       	mov    $0x1,%ecx
   19f24:	4c 89 4c 24 08       	mov    %r9,0x8(%rsp)
   19f29:	44 29 c9             	sub    %r9d,%ecx
   19f2c:	45 29 f7             	sub    %r14d,%r15d
   19f2f:	41 39 cf             	cmp    %ecx,%r15d
   19f32:	44 0f 4e f9          	cmovle %ecx,%r15d
   19f36:	44 29 f8             	sub    %r15d,%eax
   19f39:	78 61                	js     19f9c <<hyperinterval::ieee::Format>::div+0x1cc>
   19f3b:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   19f40:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
   19f45:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
   19f4a:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
   19f4f:	48 85 ed             	test   %rbp,%rbp
   19f52:	0f 84 99 02 00 00    	je     1a1f1 <<hyperinterval::ieee::Format>::div+0x421>
   19f58:	45 31 ed             	xor    %r13d,%r13d
   19f5b:	89 c1                	mov    %eax,%ecx
   19f5d:	4d 0f a5 e5          	shld   %cl,%r12,%r13
   19f61:	31 d2                	xor    %edx,%edx
   19f63:	49 d3 e4             	shl    %cl,%r12
   19f66:	a8 40                	test   $0x40,%al
   19f68:	4d 0f 45 ec          	cmovne %r12,%r13
   19f6c:	4c 0f 45 e2          	cmovne %rdx,%r12
   19f70:	4c 89 e7             	mov    %r12,%rdi
   19f73:	4c 89 ee             	mov    %r13,%rsi
   19f76:	48 89 ea             	mov    %rbp,%rdx
   19f79:	31 c9                	xor    %ecx,%ecx
   19f7b:	ff 15 67 20 04 00    	call   *0x42067(%rip)        # 5bfe8 <_DYNAMIC+0x410>
   19f81:	49 89 c2             	mov    %rax,%r10
   19f84:	49 89 d1             	mov    %rdx,%r9
   19f87:	48 89 d1             	mov    %rdx,%rcx
   19f8a:	48 0f af cd          	imul   %rbp,%rcx
   19f8e:	48 f7 e5             	mul    %rbp
   19f91:	48 01 ca             	add    %rcx,%rdx
   19f94:	49 29 c4             	sub    %rax,%r12
   19f97:	49 19 d5             	sbb    %rdx,%r13
   19f9a:	eb 79                	jmp    1a015 <<hyperinterval::ieee::Format>::div+0x245>
   19f9c:	f7 d8                	neg    %eax
   19f9e:	44 39 d0             	cmp    %r10d,%eax
   19fa1:	7e 07                	jle    19faa <<hyperinterval::ieee::Format>::div+0x1da>
   19fa3:	b3 01                	mov    $0x1,%bl
   19fa5:	e9 df 00 00 00       	jmp    1a089 <<hyperinterval::ieee::Format>::div+0x2b9>
   19faa:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   19faf:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
   19fb4:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
   19fb9:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
   19fbe:	31 db                	xor    %ebx,%ebx
   19fc0:	89 c1                	mov    %eax,%ecx
   19fc2:	48 0f a5 eb          	shld   %cl,%rbp,%rbx
   19fc6:	48 d3 e5             	shl    %cl,%rbp
   19fc9:	31 c9                	xor    %ecx,%ecx
   19fcb:	a8 40                	test   $0x40,%al
   19fcd:	48 0f 45 dd          	cmovne %rbp,%rbx
   19fd1:	48 0f 45 e9          	cmovne %rcx,%rbp
   19fd5:	48 89 e8             	mov    %rbp,%rax
   19fd8:	48 09 d8             	or     %rbx,%rax
   19fdb:	0f 84 1d 02 00 00    	je     1a1fe <<hyperinterval::ieee::Format>::div+0x42e>
   19fe1:	45 31 ed             	xor    %r13d,%r13d
   19fe4:	4c 89 e7             	mov    %r12,%rdi
   19fe7:	31 f6                	xor    %esi,%esi
   19fe9:	48 89 ea             	mov    %rbp,%rdx
   19fec:	48 89 d9             	mov    %rbx,%rcx
   19fef:	ff 15 f3 1f 04 00    	call   *0x41ff3(%rip)        # 5bfe8 <_DYNAMIC+0x410>
   19ff5:	49 89 c2             	mov    %rax,%r10
   19ff8:	49 89 d1             	mov    %rdx,%r9
   19ffb:	48 0f af d8          	imul   %rax,%rbx
   19fff:	48 f7 e5             	mul    %rbp
   1a002:	48 01 da             	add    %rbx,%rdx
   1a005:	4c 89 c9             	mov    %r9,%rcx
   1a008:	48 0f af cd          	imul   %rbp,%rcx
   1a00c:	48 01 d1             	add    %rdx,%rcx
   1a00f:	49 29 c4             	sub    %rax,%r12
   1a012:	49 19 cd             	sbb    %rcx,%r13
   1a015:	4d 09 ec             	or     %r13,%r12
   1a018:	0f 95 c3             	setne  %bl
   1a01b:	4c 89 d0             	mov    %r10,%rax
   1a01e:	4c 09 c8             	or     %r9,%rax
   1a021:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
   1a026:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1a02b:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
   1a030:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   1a035:	74 52                	je     1a089 <<hyperinterval::ieee::Format>::div+0x2b9>
   1a037:	49 0f bd c1          	bsr    %r9,%rax
   1a03b:	83 f0 3f             	xor    $0x3f,%eax
   1a03e:	4d 0f bd da          	bsr    %r10,%r11
   1a042:	41 83 f3 3f          	xor    $0x3f,%r11d
   1a046:	41 83 cb 40          	or     $0x40,%r11d
   1a04a:	4d 85 c9             	test   %r9,%r9
   1a04d:	44 0f 45 d8          	cmovne %eax,%r11d
   1a051:	41 83 f3 7f          	xor    $0x7f,%r11d
   1a055:	43 8d 2c 3b          	lea    (%r11,%r15,1),%ebp
   1a059:	39 d5                	cmp    %edx,%ebp
   1a05b:	0f 8f c8 00 00 00    	jg     1a129 <<hyperinterval::ieee::Format>::div+0x359>
   1a061:	b8 01 00 00 00       	mov    $0x1,%eax
   1a066:	29 d0                	sub    %edx,%eax
   1a068:	39 c5                	cmp    %eax,%ebp
   1a06a:	7d 28                	jge    1a094 <<hyperinterval::ieee::Format>::div+0x2c4>
   1a06c:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a071:	42 8d 0c 38          	lea    (%rax,%r15,1),%ecx
   1a075:	fe c9                	dec    %cl
   1a077:	4c 89 d0             	mov    %r10,%rax
   1a07a:	48 d3 e0             	shl    %cl,%rax
   1a07d:	45 31 db             	xor    %r11d,%r11d
   1a080:	f6 c1 40             	test   $0x40,%cl
   1a083:	4c 0f 44 d8          	cmove  %rax,%r11
   1a087:	eb 68                	jmp    1a0f1 <<hyperinterval::ieee::Format>::div+0x321>
   1a089:	45 31 d2             	xor    %r10d,%r10d
   1a08c:	45 31 c9             	xor    %r9d,%r9d
   1a08f:	45 31 db             	xor    %r11d,%r11d
   1a092:	eb 5d                	jmp    1a0f1 <<hyperinterval::ieee::Format>::div+0x321>
   1a094:	44 89 f1             	mov    %r14d,%ecx
   1a097:	44 29 d9             	sub    %r11d,%ecx
   1a09a:	4d 89 d4             	mov    %r10,%r12
   1a09d:	49 d3 e4             	shl    %cl,%r12
   1a0a0:	89 c8                	mov    %ecx,%eax
   1a0a2:	f7 d8                	neg    %eax
   1a0a4:	45 31 ed             	xor    %r13d,%r13d
   1a0a7:	f6 c1 40             	test   $0x40,%cl
   1a0aa:	4d 0f 44 ec          	cmove  %r12,%r13
   1a0ae:	4d 89 d4             	mov    %r10,%r12
   1a0b1:	89 c1                	mov    %eax,%ecx
   1a0b3:	4d 0f ad cc          	shrd   %cl,%r9,%r12
   1a0b7:	88 5c 24 07          	mov    %bl,0x7(%rsp)
   1a0bb:	4c 89 cb             	mov    %r9,%rbx
   1a0be:	48 d3 eb             	shr    %cl,%rbx
   1a0c1:	a8 40                	test   $0x40,%al
   1a0c3:	49 0f 44 dc          	cmove  %r12,%rbx
   1a0c7:	45 39 de             	cmp    %r11d,%r14d
   1a0ca:	49 0f 43 dd          	cmovae %r13,%rbx
   1a0ce:	01 d5                	add    %edx,%ebp
   1a0d0:	48 63 c5             	movslq %ebp,%rax
   1a0d3:	44 89 f1             	mov    %r14d,%ecx
   1a0d6:	48 d3 e0             	shl    %cl,%rax
   1a0d9:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   1a0e0:	49 d3 e3             	shl    %cl,%r11
   1a0e3:	49 f7 d3             	not    %r11
   1a0e6:	49 21 db             	and    %rbx,%r11
   1a0e9:	0f b6 5c 24 07       	movzbl 0x7(%rsp),%ebx
   1a0ee:	49 09 c3             	or     %rax,%r11
   1a0f1:	0f b6 db             	movzbl %bl,%ebx
   1a0f4:	4c 01 d3             	add    %r10,%rbx
   1a0f7:	49 83 d1 00          	adc    $0x0,%r9
   1a0fb:	48 89 d8             	mov    %rbx,%rax
   1a0fe:	4c 09 c8             	or     %r9,%rax
   1a101:	74 30                	je     1a133 <<hyperinterval::ieee::Format>::div+0x363>
   1a103:	49 0f bd c1          	bsr    %r9,%rax
   1a107:	83 f0 3f             	xor    $0x3f,%eax
   1a10a:	4c 0f bd d3          	bsr    %rbx,%r10
   1a10e:	41 83 f2 3f          	xor    $0x3f,%r10d
   1a112:	41 83 ca 40          	or     $0x40,%r10d
   1a116:	4d 85 c9             	test   %r9,%r9
   1a119:	44 0f 45 d0          	cmovne %eax,%r10d
   1a11d:	41 83 f2 7f          	xor    $0x7f,%r10d
   1a121:	43 8d 2c 3a          	lea    (%r10,%r15,1),%ebp
   1a125:	39 d5                	cmp    %edx,%ebp
   1a127:	7e 0e                	jle    1a137 <<hyperinterval::ieee::Format>::div+0x367>
   1a129:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   1a12e:	e9 af 00 00 00       	jmp    1a1e2 <<hyperinterval::ieee::Format>::div+0x412>
   1a133:	31 c0                	xor    %eax,%eax
   1a135:	eb 71                	jmp    1a1a8 <<hyperinterval::ieee::Format>::div+0x3d8>
   1a137:	b8 01 00 00 00       	mov    $0x1,%eax
   1a13c:	29 d0                	sub    %edx,%eax
   1a13e:	39 c5                	cmp    %eax,%ebp
   1a140:	7d 18                	jge    1a15a <<hyperinterval::ieee::Format>::div+0x38a>
   1a142:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a147:	44 01 f9             	add    %r15d,%ecx
   1a14a:	fe c9                	dec    %cl
   1a14c:	48 d3 e3             	shl    %cl,%rbx
   1a14f:	31 c0                	xor    %eax,%eax
   1a151:	f6 c1 40             	test   $0x40,%cl
   1a154:	48 0f 44 c3          	cmove  %rbx,%rax
   1a158:	eb 4e                	jmp    1a1a8 <<hyperinterval::ieee::Format>::div+0x3d8>
   1a15a:	44 89 f1             	mov    %r14d,%ecx
   1a15d:	44 29 d1             	sub    %r10d,%ecx
   1a160:	89 c8                	mov    %ecx,%eax
   1a162:	f7 d8                	neg    %eax
   1a164:	49 89 df             	mov    %rbx,%r15
   1a167:	49 d3 e7             	shl    %cl,%r15
   1a16a:	45 31 e4             	xor    %r12d,%r12d
   1a16d:	f6 c1 40             	test   $0x40,%cl
   1a170:	4d 0f 44 e7          	cmove  %r15,%r12
   1a174:	89 c1                	mov    %eax,%ecx
   1a176:	4c 0f ad cb          	shrd   %cl,%r9,%rbx
   1a17a:	49 d3 e9             	shr    %cl,%r9
   1a17d:	a8 40                	test   $0x40,%al
   1a17f:	4c 0f 44 cb          	cmove  %rbx,%r9
   1a183:	45 39 d6             	cmp    %r10d,%r14d
   1a186:	4d 0f 43 cc          	cmovae %r12,%r9
   1a18a:	01 d5                	add    %edx,%ebp
   1a18c:	48 63 d5             	movslq %ebp,%rdx
   1a18f:	44 89 f1             	mov    %r14d,%ecx
   1a192:	48 d3 e2             	shl    %cl,%rdx
   1a195:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   1a19c:	48 d3 e0             	shl    %cl,%rax
   1a19f:	48 f7 d0             	not    %rax
   1a1a2:	4c 21 c8             	and    %r9,%rax
   1a1a5:	48 09 d0             	or     %rdx,%rax
   1a1a8:	48 85 74 24 30       	test   %rsi,0x30(%rsp)
   1a1ad:	0f 95 c1             	setne  %cl
   1a1b0:	49 85 f0             	test   %rsi,%r8
   1a1b3:	0f 94 c2             	sete   %dl
   1a1b6:	30 ca                	xor    %cl,%dl
   1a1b8:	75 1d                	jne    1a1d7 <<hyperinterval::ieee::Format>::div+0x407>
   1a1ba:	48 89 c1             	mov    %rax,%rcx
   1a1bd:	48 31 f1             	xor    %rsi,%rcx
   1a1c0:	48 85 c0             	test   %rax,%rax
   1a1c3:	48 0f 44 c8          	cmove  %rax,%rcx
   1a1c7:	4c 31 de             	xor    %r11,%rsi
   1a1ca:	4d 85 db             	test   %r11,%r11
   1a1cd:	49 0f 44 f3          	cmove  %r11,%rsi
   1a1d1:	48 89 f0             	mov    %rsi,%rax
   1a1d4:	49 89 cb             	mov    %rcx,%r11
   1a1d7:	4c 89 5f 08          	mov    %r11,0x8(%rdi)
   1a1db:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1a1df:	c6 07 00             	movb   $0x0,(%rdi)
   1a1e2:	48 83 c4 38          	add    $0x38,%rsp
   1a1e6:	5b                   	pop    %rbx
   1a1e7:	41 5c                	pop    %r12
   1a1e9:	41 5d                	pop    %r13
   1a1eb:	41 5e                	pop    %r14
   1a1ed:	41 5f                	pop    %r15
   1a1ef:	5d                   	pop    %rbp
   1a1f0:	c3                   	ret
   1a1f1:	48 8d 3d d8 fb 03 00 	lea    0x3fbd8(%rip),%rdi        # 59dd0 <__frame_dummy_init_array_entry+0x1c0>
   1a1f8:	ff 15 f2 1d 04 00    	call   *0x41df2(%rip)        # 5bff0 <_DYNAMIC+0x418>
   1a1fe:	48 8d 3d b3 fb 03 00 	lea    0x3fbb3(%rip),%rdi        # 59db8 <__frame_dummy_init_array_entry+0x1a8>
   1a205:	ff 15 e5 1d 04 00    	call   *0x41de5(%rip)        # 5bff0 <_DYNAMIC+0x418>
   1a20b:	cc                   	int3
   1a20c:	cc                   	int3
   1a20d:	cc                   	int3
   1a20e:	cc                   	int3
   1a20f:	cc                   	int3

<hyperinterval::ieee::Format>::power:
   1a210:	55                   	push   %rbp
   1a211:	41 57                	push   %r15
   1a213:	41 56                	push   %r14
   1a215:	41 55                	push   %r13
   1a217:	41 54                	push   %r12
   1a219:	53                   	push   %rbx
   1a21a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   1a221:	49 89 ca             	mov    %rcx,%r10
   1a224:	49 89 d6             	mov    %rdx,%r14
   1a227:	48 85 f1             	test   %rsi,%rcx
   1a22a:	0f 95 c0             	setne  %al
   1a22d:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
   1a232:	49 89 d3             	mov    %rdx,%r11
   1a235:	44 89 c9             	mov    %r9d,%ecx
   1a238:	49 d3 eb             	shr    %cl,%r11
   1a23b:	49 d1 eb             	shr    $1,%r11
   1a23e:	49 63 d3             	movslq %r11d,%rdx
   1a241:	48 d3 e2             	shl    %cl,%rdx
   1a244:	45 85 c0             	test   %r8d,%r8d
   1a247:	0f 84 6b 03 00 00    	je     1a5b8 <<hyperinterval::ieee::Format>::power+0x3a8>
   1a24d:	88 44 24 07          	mov    %al,0x7(%rsp)
   1a251:	48 89 7c 24 50       	mov    %rdi,0x50(%rsp)
   1a256:	48 8d 46 ff          	lea    -0x1(%rsi),%rax
   1a25a:	49 21 c2             	and    %rax,%r10
   1a25d:	bb 01 00 00 00       	mov    $0x1,%ebx
   1a262:	44 89 c9             	mov    %r9d,%ecx
   1a265:	48 d3 e3             	shl    %cl,%rbx
   1a268:	48 8d 43 ff          	lea    -0x1(%rbx),%rax
   1a26c:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1a271:	45 01 cb             	add    %r9d,%r11d
   1a274:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   1a27a:	45 29 df             	sub    %r11d,%r15d
   1a27d:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   1a282:	4c 8d 64 24 30       	lea    0x30(%rsp),%r12
   1a287:	44 89 44 24 74       	mov    %r8d,0x74(%rsp)
   1a28c:	44 89 c5             	mov    %r8d,%ebp
   1a28f:	4c 89 54 24 68       	mov    %r10,0x68(%rsp)
   1a294:	4d 89 d5             	mov    %r10,%r13
   1a297:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   1a29c:	48 89 54 24 60       	mov    %rdx,0x60(%rsp)
   1a2a1:	4c 89 8c 24 80 00 00 	mov    %r9,0x80(%rsp)
   1a2a8:	00 
   1a2a9:	48 89 5c 24 78       	mov    %rbx,0x78(%rsp)
   1a2ae:	44 89 7c 24 0c       	mov    %r15d,0xc(%rsp)
   1a2b3:	48 89 b4 24 88 00 00 	mov    %rsi,0x88(%rsp)
   1a2ba:	00 
   1a2bb:	40 f6 c5 01          	test   $0x1,%bpl
   1a2bf:	75 2f                	jne    1a2f0 <<hyperinterval::ieee::Format>::power+0xe0>
   1a2c1:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   1a2c8:	0f 1f 84 00 00 00 00 
   1a2cf:	00 
   1a2d0:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   1a2d5:	d1 ed                	shr    $1,%ebp
   1a2d7:	0f 85 bc 01 00 00    	jne    1a499 <<hyperinterval::ieee::Format>::power+0x289>
   1a2dd:	e9 19 03 00 00       	jmp    1a5fb <<hyperinterval::ieee::Format>::power+0x3eb>
   1a2e2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   1a2e9:	1f 84 00 00 00 00 00 
   1a2f0:	89 6c 24 08          	mov    %ebp,0x8(%rsp)
   1a2f4:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   1a2f9:	4c 89 c0             	mov    %r8,%rax
   1a2fc:	4c 21 f0             	and    %r14,%rax
   1a2ff:	44 89 c9             	mov    %r9d,%ecx
   1a302:	48 d3 e8             	shr    %cl,%rax
   1a305:	4c 89 c1             	mov    %r8,%rcx
   1a308:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1a30d:	48 21 e9             	and    %rbp,%rcx
   1a310:	41 89 c2             	mov    %eax,%r10d
   1a313:	45 29 da             	sub    %r11d,%r10d
   1a316:	48 85 c0             	test   %rax,%rax
   1a319:	45 0f 44 d7          	cmove  %r15d,%r10d
   1a31d:	48 0f 45 c3          	cmovne %rbx,%rax
   1a321:	48 09 c8             	or     %rcx,%rax
   1a324:	4c 89 ea             	mov    %r13,%rdx
   1a327:	4c 21 f2             	and    %r14,%rdx
   1a32a:	44 89 c9             	mov    %r9d,%ecx
   1a32d:	48 d3 ea             	shr    %cl,%rdx
   1a330:	4c 89 e9             	mov    %r13,%rcx
   1a333:	48 21 e9             	and    %rbp,%rcx
   1a336:	89 d5                	mov    %edx,%ebp
   1a338:	44 29 dd             	sub    %r11d,%ebp
   1a33b:	48 85 d2             	test   %rdx,%rdx
   1a33e:	41 0f 44 ef          	cmove  %r15d,%ebp
   1a342:	48 0f 45 d3          	cmovne %rbx,%rdx
   1a346:	48 09 ca             	or     %rcx,%rdx
   1a349:	49 85 f0             	test   %rsi,%r8
   1a34c:	0f 95 c1             	setne  %cl
   1a34f:	4c 89 ac 24 90 00 00 	mov    %r13,0x90(%rsp)
   1a356:	00 
   1a357:	49 85 f5             	test   %rsi,%r13
   1a35a:	41 0f 95 c0          	setne  %r8b
   1a35e:	48 f7 e2             	mul    %rdx
   1a361:	41 30 c8             	xor    %cl,%r8b
   1a364:	44 01 d5             	add    %r10d,%ebp
   1a367:	44 88 44 24 44       	mov    %r8b,0x44(%rsp)
   1a36c:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1a371:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a376:	89 6c 24 40          	mov    %ebp,0x40(%rsp)
   1a37a:	4c 89 f2             	mov    %r14,%rdx
   1a37d:	4c 89 e1             	mov    %r12,%rcx
   1a380:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1a385:	4d 89 dd             	mov    %r11,%r13
   1a388:	4d 89 cc             	mov    %r9,%r12
   1a38b:	e8 a0 06 00 00       	call   1aa30 <<hyperinterval::ieee::Format>::rounded>
   1a390:	80 7c 24 18 00       	cmpb   $0x0,0x18(%rsp)
   1a395:	0f 85 0c 02 00 00    	jne    1a5a7 <<hyperinterval::ieee::Format>::power+0x397>
   1a39b:	4c 8b 4c 24 58       	mov    0x58(%rsp),%r9
   1a3a0:	4c 89 c8             	mov    %r9,%rax
   1a3a3:	4c 21 f0             	and    %r14,%rax
   1a3a6:	4d 89 f0             	mov    %r14,%r8
   1a3a9:	44 89 e1             	mov    %r12d,%ecx
   1a3ac:	48 d3 e8             	shr    %cl,%rax
   1a3af:	4c 89 ca             	mov    %r9,%rdx
   1a3b2:	48 21 ea             	and    %rbp,%rdx
   1a3b5:	89 c6                	mov    %eax,%esi
   1a3b7:	4d 89 ee             	mov    %r13,%r14
   1a3ba:	44 29 f6             	sub    %r14d,%esi
   1a3bd:	48 85 c0             	test   %rax,%rax
   1a3c0:	41 0f 44 f7          	cmove  %r15d,%esi
   1a3c4:	48 0f 45 c3          	cmovne %rbx,%rax
   1a3c8:	4c 8b 54 24 68       	mov    0x68(%rsp),%r10
   1a3cd:	4c 89 d7             	mov    %r10,%rdi
   1a3d0:	4c 21 c7             	and    %r8,%rdi
   1a3d3:	4d 89 c5             	mov    %r8,%r13
   1a3d6:	48 d3 ef             	shr    %cl,%rdi
   1a3d9:	48 09 d0             	or     %rdx,%rax
   1a3dc:	4c 89 d1             	mov    %r10,%rcx
   1a3df:	48 21 e9             	and    %rbp,%rcx
   1a3e2:	41 89 f8             	mov    %edi,%r8d
   1a3e5:	45 29 f0             	sub    %r14d,%r8d
   1a3e8:	48 85 ff             	test   %rdi,%rdi
   1a3eb:	45 0f 44 c7          	cmove  %r15d,%r8d
   1a3ef:	48 0f 45 fb          	cmovne %rbx,%rdi
   1a3f3:	48 09 cf             	or     %rcx,%rdi
   1a3f6:	4c 8b bc 24 88 00 00 	mov    0x88(%rsp),%r15
   1a3fd:	00 
   1a3fe:	4d 85 f9             	test   %r15,%r9
   1a401:	0f 95 c1             	setne  %cl
   1a404:	4d 85 fa             	test   %r15,%r10
   1a407:	41 0f 95 c1          	setne  %r9b
   1a40b:	41 30 c9             	xor    %cl,%r9b
   1a40e:	48 f7 e7             	mul    %rdi
   1a411:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
   1a416:	41 01 f0             	add    %esi,%r8d
   1a419:	44 88 4c 24 44       	mov    %r9b,0x44(%rsp)
   1a41e:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1a423:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a428:	44 89 44 24 40       	mov    %r8d,0x40(%rsp)
   1a42d:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   1a432:	48 89 fd             	mov    %rdi,%rbp
   1a435:	4c 89 fe             	mov    %r15,%rsi
   1a438:	4c 89 ea             	mov    %r13,%rdx
   1a43b:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
   1a440:	49 89 cc             	mov    %rcx,%r12
   1a443:	e8 e8 05 00 00       	call   1aa30 <<hyperinterval::ieee::Format>::rounded>
   1a448:	80 7c 24 18 01       	cmpb   $0x1,0x18(%rsp)
   1a44d:	0f 84 54 01 00 00    	je     1a5a7 <<hyperinterval::ieee::Format>::power+0x397>
   1a453:	4c 89 fe             	mov    %r15,%rsi
   1a456:	4d 89 f3             	mov    %r14,%r11
   1a459:	4d 89 ee             	mov    %r13,%r14
   1a45c:	48 89 5c 24 60       	mov    %rbx,0x60(%rsp)
   1a461:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   1a466:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1a46b:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1a472:	00 
   1a473:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
   1a478:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   1a47d:	44 8b 7c 24 0c       	mov    0xc(%rsp),%r15d
   1a482:	48 89 ef             	mov    %rbp,%rdi
   1a485:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   1a489:	4c 8b ac 24 90 00 00 	mov    0x90(%rsp),%r13
   1a490:	00 
   1a491:	d1 ed                	shr    $1,%ebp
   1a493:	0f 84 62 01 00 00    	je     1a5fb <<hyperinterval::ieee::Format>::power+0x3eb>
   1a499:	89 6c 24 08          	mov    %ebp,0x8(%rsp)
   1a49d:	4c 89 e8             	mov    %r13,%rax
   1a4a0:	4c 21 f0             	and    %r14,%rax
   1a4a3:	44 89 c9             	mov    %r9d,%ecx
   1a4a6:	48 d3 e8             	shr    %cl,%rax
   1a4a9:	49 21 d5             	and    %rdx,%r13
   1a4ac:	89 c1                	mov    %eax,%ecx
   1a4ae:	44 29 d9             	sub    %r11d,%ecx
   1a4b1:	48 85 c0             	test   %rax,%rax
   1a4b4:	48 0f 45 c3          	cmovne %rbx,%rax
   1a4b8:	41 0f 44 cf          	cmove  %r15d,%ecx
   1a4bc:	4c 09 e8             	or     %r13,%rax
   1a4bf:	48 89 d5             	mov    %rdx,%rbp
   1a4c2:	48 f7 e0             	mul    %rax
   1a4c5:	01 c9                	add    %ecx,%ecx
   1a4c7:	c6 44 24 44 00       	movb   $0x0,0x44(%rsp)
   1a4cc:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1a4d1:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a4d6:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
   1a4da:	4c 89 f2             	mov    %r14,%rdx
   1a4dd:	4c 89 e1             	mov    %r12,%rcx
   1a4e0:	49 89 dd             	mov    %rbx,%r13
   1a4e3:	4c 89 db             	mov    %r11,%rbx
   1a4e6:	4d 89 f4             	mov    %r14,%r12
   1a4e9:	4d 89 ce             	mov    %r9,%r14
   1a4ec:	e8 3f 05 00 00       	call   1aa30 <<hyperinterval::ieee::Format>::rounded>
   1a4f1:	80 7c 24 18 00       	cmpb   $0x0,0x18(%rsp)
   1a4f6:	0f 85 ab 00 00 00    	jne    1a5a7 <<hyperinterval::ieee::Format>::power+0x397>
   1a4fc:	48 8b 54 24 68       	mov    0x68(%rsp),%rdx
   1a501:	48 89 d0             	mov    %rdx,%rax
   1a504:	4c 21 e0             	and    %r12,%rax
   1a507:	44 89 f1             	mov    %r14d,%ecx
   1a50a:	48 d3 e8             	shr    %cl,%rax
   1a50d:	48 21 ea             	and    %rbp,%rdx
   1a510:	89 c1                	mov    %eax,%ecx
   1a512:	29 d9                	sub    %ebx,%ecx
   1a514:	48 85 c0             	test   %rax,%rax
   1a517:	49 0f 45 c5          	cmovne %r13,%rax
   1a51b:	41 0f 44 cf          	cmove  %r15d,%ecx
   1a51f:	48 09 d0             	or     %rdx,%rax
   1a522:	48 f7 e0             	mul    %rax
   1a525:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
   1a52a:	01 c9                	add    %ecx,%ecx
   1a52c:	c6 44 24 44 00       	movb   $0x0,0x44(%rsp)
   1a531:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1a536:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a53b:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
   1a53f:	48 8d 6c 24 18       	lea    0x18(%rsp),%rbp
   1a544:	48 89 ef             	mov    %rbp,%rdi
   1a547:	4c 8b b4 24 88 00 00 	mov    0x88(%rsp),%r14
   1a54e:	00 
   1a54f:	4c 89 f6             	mov    %r14,%rsi
   1a552:	4c 89 e2             	mov    %r12,%rdx
   1a555:	4c 8d 7c 24 30       	lea    0x30(%rsp),%r15
   1a55a:	4c 89 f9             	mov    %r15,%rcx
   1a55d:	e8 ce 04 00 00       	call   1aa30 <<hyperinterval::ieee::Format>::rounded>
   1a562:	80 7c 24 18 01       	cmpb   $0x1,0x18(%rsp)
   1a567:	74 3e                	je     1a5a7 <<hyperinterval::ieee::Format>::power+0x397>
   1a569:	4c 89 f6             	mov    %r14,%rsi
   1a56c:	49 89 db             	mov    %rbx,%r11
   1a56f:	4d 89 e6             	mov    %r12,%r14
   1a572:	48 89 ef             	mov    %rbp,%rdi
   1a575:	4d 89 fc             	mov    %r15,%r12
   1a578:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   1a57d:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
   1a582:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1a589:	00 
   1a58a:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
   1a58f:	44 8b 7c 24 0c       	mov    0xc(%rsp),%r15d
   1a594:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   1a598:	40 f6 c5 01          	test   $0x1,%bpl
   1a59c:	0f 85 4e fd ff ff    	jne    1a2f0 <<hyperinterval::ieee::Format>::power+0xe0>
   1a5a2:	e9 29 fd ff ff       	jmp    1a2d0 <<hyperinterval::ieee::Format>::power+0xc0>
   1a5a7:	0f b6 44 24 19       	movzbl 0x19(%rsp),%eax
   1a5ac:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1a5b1:	88 47 01             	mov    %al,0x1(%rdi)
   1a5b4:	b0 01                	mov    $0x1,%al
   1a5b6:	eb 2f                	jmp    1a5e7 <<hyperinterval::ieee::Format>::power+0x3d7>
   1a5b8:	48 89 d1             	mov    %rdx,%rcx
   1a5bb:	44 20 c0             	and    %r8b,%al
   1a5be:	74 1d                	je     1a5dd <<hyperinterval::ieee::Format>::power+0x3cd>
   1a5c0:	48 89 d0             	mov    %rdx,%rax
   1a5c3:	48 31 f0             	xor    %rsi,%rax
   1a5c6:	48 85 d2             	test   %rdx,%rdx
   1a5c9:	48 0f 44 c2          	cmove  %rdx,%rax
   1a5cd:	48 31 ce             	xor    %rcx,%rsi
   1a5d0:	48 85 c9             	test   %rcx,%rcx
   1a5d3:	48 0f 44 f1          	cmove  %rcx,%rsi
   1a5d7:	48 89 c1             	mov    %rax,%rcx
   1a5da:	48 89 f2             	mov    %rsi,%rdx
   1a5dd:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1a5e1:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   1a5e5:	31 c0                	xor    %eax,%eax
   1a5e7:	88 07                	mov    %al,(%rdi)
   1a5e9:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1a5f0:	5b                   	pop    %rbx
   1a5f1:	41 5c                	pop    %r12
   1a5f3:	41 5d                	pop    %r13
   1a5f5:	41 5e                	pop    %r14
   1a5f7:	41 5f                	pop    %r15
   1a5f9:	5d                   	pop    %rbp
   1a5fa:	c3                   	ret
   1a5fb:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1a600:	44 8b 44 24 74       	mov    0x74(%rsp),%r8d
   1a605:	0f b6 44 24 07       	movzbl 0x7(%rsp),%eax
   1a60a:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
   1a60f:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   1a614:	44 20 c0             	and    %r8b,%al
   1a617:	75 a7                	jne    1a5c0 <<hyperinterval::ieee::Format>::power+0x3b0>
   1a619:	eb c2                	jmp    1a5dd <<hyperinterval::ieee::Format>::power+0x3cd>
   1a61b:	cc                   	int3
   1a61c:	cc                   	int3
   1a61d:	cc                   	int3
   1a61e:	cc                   	int3
   1a61f:	cc                   	int3

<hyperinterval::ieee::Format>::affine:
   1a620:	55                   	push   %rbp
   1a621:	41 57                	push   %r15
   1a623:	41 56                	push   %r14
   1a625:	41 55                	push   %r13
   1a627:	41 54                	push   %r12
   1a629:	53                   	push   %rbx
   1a62a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   1a631:	49 89 ca             	mov    %rcx,%r10
   1a634:	48 89 d3             	mov    %rdx,%rbx
   1a637:	f3 48 0f bc ca       	tzcnt  %rdx,%rcx
   1a63c:	4d 89 d4             	mov    %r10,%r12
   1a63f:	49 21 d4             	and    %rdx,%r12
   1a642:	49 d3 ec             	shr    %cl,%r12
   1a645:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   1a64b:	49 d3 e7             	shl    %cl,%r15
   1a64e:	4d 8d 77 ff          	lea    -0x1(%r15),%r14
   1a652:	4c 89 f2             	mov    %r14,%rdx
   1a655:	4c 21 d2             	and    %r10,%rdx
   1a658:	48 89 d8             	mov    %rbx,%rax
   1a65b:	48 d3 e8             	shr    %cl,%rax
   1a65e:	4d 85 e4             	test   %r12,%r12
   1a661:	74 0a                	je     1a66d <<hyperinterval::ieee::Format>::affine+0x4d>
   1a663:	4c 09 fa             	or     %r15,%rdx
   1a666:	48 d1 e8             	shr    $1,%rax
   1a669:	01 c8                	add    %ecx,%eax
   1a66b:	eb 0b                	jmp    1a678 <<hyperinterval::ieee::Format>::affine+0x58>
   1a66d:	48 d1 e8             	shr    $1,%rax
   1a670:	01 c8                	add    %ecx,%eax
   1a672:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1a678:	41 29 c4             	sub    %eax,%r12d
   1a67b:	4d 89 c3             	mov    %r8,%r11
   1a67e:	49 21 db             	and    %rbx,%r11
   1a681:	49 d3 eb             	shr    %cl,%r11
   1a684:	4c 89 f0             	mov    %r14,%rax
   1a687:	4c 21 c0             	and    %r8,%rax
   1a68a:	49 89 dd             	mov    %rbx,%r13
   1a68d:	49 d3 ed             	shr    %cl,%r13
   1a690:	4d 85 db             	test   %r11,%r11
   1a693:	74 0b                	je     1a6a0 <<hyperinterval::ieee::Format>::affine+0x80>
   1a695:	4c 09 f8             	or     %r15,%rax
   1a698:	49 d1 ed             	shr    $1,%r13
   1a69b:	41 01 cd             	add    %ecx,%r13d
   1a69e:	eb 0c                	jmp    1a6ac <<hyperinterval::ieee::Format>::affine+0x8c>
   1a6a0:	49 d1 ed             	shr    $1,%r13
   1a6a3:	41 01 cd             	add    %ecx,%r13d
   1a6a6:	41 bb 01 00 00 00    	mov    $0x1,%r11d
   1a6ac:	45 29 eb             	sub    %r13d,%r11d
   1a6af:	49 85 f2             	test   %rsi,%r10
   1a6b2:	41 0f 95 c2          	setne  %r10b
   1a6b6:	49 85 f0             	test   %rsi,%r8
   1a6b9:	41 0f 95 c0          	setne  %r8b
   1a6bd:	48 f7 e2             	mul    %rdx
   1a6c0:	45 30 d0             	xor    %r10b,%r8b
   1a6c3:	45 01 e3             	add    %r12d,%r11d
   1a6c6:	44 88 44 24 64       	mov    %r8b,0x64(%rsp)
   1a6cb:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   1a6d0:	4d 89 ca             	mov    %r9,%r10
   1a6d3:	49 21 da             	and    %rbx,%r10
   1a6d6:	49 d3 ea             	shr    %cl,%r10
   1a6d9:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1a6de:	44 89 5c 24 60       	mov    %r11d,0x60(%rsp)
   1a6e3:	4d 21 ce             	and    %r9,%r14
   1a6e6:	4d 85 d2             	test   %r10,%r10
   1a6e9:	74 14                	je     1a6ff <<hyperinterval::ieee::Format>::affine+0xdf>
   1a6eb:	49 89 dc             	mov    %rbx,%r12
   1a6ee:	49 d3 ec             	shr    %cl,%r12
   1a6f1:	4d 09 fe             	or     %r15,%r14
   1a6f4:	49 d1 ec             	shr    $1,%r12
   1a6f7:	41 01 cc             	add    %ecx,%r12d
   1a6fa:	45 29 e2             	sub    %r12d,%r10d
   1a6fd:	eb 15                	jmp    1a714 <<hyperinterval::ieee::Format>::affine+0xf4>
   1a6ff:	49 89 df             	mov    %rbx,%r15
   1a702:	49 d3 ef             	shr    %cl,%r15
   1a705:	49 d1 ef             	shr    $1,%r15
   1a708:	41 01 cf             	add    %ecx,%r15d
   1a70b:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1a711:	45 29 fa             	sub    %r15d,%r10d
   1a714:	49 85 f1             	test   %rsi,%r9
   1a717:	40 0f 95 c5          	setne  %bpl
   1a71b:	0f 95 84 24 84 00 00 	setne  0x84(%rsp)
   1a722:	00 
   1a723:	4c 89 74 24 70       	mov    %r14,0x70(%rsp)
   1a728:	48 c7 44 24 78 00 00 	movq   $0x0,0x78(%rsp)
   1a72f:	00 00 
   1a731:	44 89 94 24 80 00 00 	mov    %r10d,0x80(%rsp)
   1a738:	00 
   1a739:	48 89 c1             	mov    %rax,%rcx
   1a73c:	48 09 d1             	or     %rdx,%rcx
   1a73f:	74 7b                	je     1a7bc <<hyperinterval::ieee::Format>::affine+0x19c>
   1a741:	4d 85 f6             	test   %r14,%r14
   1a744:	74 7d                	je     1a7c3 <<hyperinterval::ieee::Format>::affine+0x1a3>
   1a746:	40 88 6c 24 07       	mov    %bpl,0x7(%rsp)
   1a74b:	48 0f bd ca          	bsr    %rdx,%rcx
   1a74f:	83 f1 3f             	xor    $0x3f,%ecx
   1a752:	4c 0f bd e0          	bsr    %rax,%r12
   1a756:	41 83 f4 3f          	xor    $0x3f,%r12d
   1a75a:	41 83 cc 40          	or     $0x40,%r12d
   1a75e:	48 85 d2             	test   %rdx,%rdx
   1a761:	44 0f 45 e1          	cmovne %ecx,%r12d
   1a765:	41 83 f4 7f          	xor    $0x7f,%r12d
   1a769:	45 01 dc             	add    %r11d,%r12d
   1a76c:	4d 0f bd fe          	bsr    %r14,%r15
   1a770:	41 83 f7 3f          	xor    $0x3f,%r15d
   1a774:	41 83 cf 40          	or     $0x40,%r15d
   1a778:	41 83 f7 7f          	xor    $0x7f,%r15d
   1a77c:	45 01 d7             	add    %r10d,%r15d
   1a77f:	45 39 e7             	cmp    %r12d,%r15d
   1a782:	45 0f 4e fc          	cmovle %r12d,%r15d
   1a786:	41 83 c7 82          	add    $0xffffff82,%r15d
   1a78a:	45 29 fb             	sub    %r15d,%r11d
   1a78d:	78 46                	js     1a7d5 <<hyperinterval::ieee::Format>::affine+0x1b5>
   1a78f:	44 89 d9             	mov    %r11d,%ecx
   1a792:	48 0f a5 c2          	shld   %cl,%rax,%rdx
   1a796:	48 d3 e0             	shl    %cl,%rax
   1a799:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   1a7a0:	00 00 
   1a7a2:	41 f6 c3 40          	test   $0x40,%r11b
   1a7a6:	48 0f 45 d0          	cmovne %rax,%rdx
   1a7aa:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   1a7b0:	4c 0f 44 e8          	cmove  %rax,%r13
   1a7b4:	48 89 d5             	mov    %rdx,%rbp
   1a7b7:	e9 98 00 00 00       	jmp    1a854 <<hyperinterval::ieee::Format>::affine+0x234>
   1a7bc:	48 8d 4c 24 70       	lea    0x70(%rsp),%rcx
   1a7c1:	eb 05                	jmp    1a7c8 <<hyperinterval::ieee::Format>::affine+0x1a8>
   1a7c3:	48 8d 4c 24 50       	lea    0x50(%rsp),%rcx
   1a7c8:	48 89 da             	mov    %rbx,%rdx
   1a7cb:	e8 60 02 00 00       	call   1aa30 <<hyperinterval::ieee::Format>::rounded>
   1a7d0:	e9 fa 01 00 00       	jmp    1a9cf <<hyperinterval::ieee::Format>::affine+0x3af>
   1a7d5:	41 f7 db             	neg    %r11d
   1a7d8:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   1a7de:	bd 00 00 00 00       	mov    $0x0,%ebp
   1a7e3:	41 83 fb 7f          	cmp    $0x7f,%r11d
   1a7e7:	7f 5d                	jg     1a846 <<hyperinterval::ieee::Format>::affine+0x226>
   1a7e9:	49 89 c5             	mov    %rax,%r13
   1a7ec:	44 89 d9             	mov    %r11d,%ecx
   1a7ef:	49 0f ad d5          	shrd   %cl,%rdx,%r13
   1a7f3:	48 89 d5             	mov    %rdx,%rbp
   1a7f6:	48 d3 ed             	shr    %cl,%rbp
   1a7f9:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
   1a800:	49 d3 e4             	shl    %cl,%r12
   1a803:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
   1a80a:	41 f6 c3 40          	test   $0x40,%r11b
   1a80e:	4c 0f 45 ed          	cmovne %rbp,%r13
   1a812:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   1a818:	49 0f 45 eb          	cmovne %r11,%rbp
   1a81c:	49 0f 45 cc          	cmovne %r12,%rcx
   1a820:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   1a826:	4c 89 5c 24 08       	mov    %r11,0x8(%rsp)
   1a82b:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   1a831:	4d 0f 45 e3          	cmovne %r11,%r12
   1a835:	49 f7 d4             	not    %r12
   1a838:	48 f7 d1             	not    %rcx
   1a83b:	48 21 d1             	and    %rdx,%rcx
   1a83e:	49 21 c4             	and    %rax,%r12
   1a841:	49 09 cc             	or     %rcx,%r12
   1a844:	74 0e                	je     1a854 <<hyperinterval::ieee::Format>::affine+0x234>
   1a846:	41 0f b6 c0          	movzbl %r8b,%eax
   1a84a:	f7 d8                	neg    %eax
   1a84c:	83 c8 01             	or     $0x1,%eax
   1a84f:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
   1a854:	45 29 fa             	sub    %r15d,%r10d
   1a857:	78 20                	js     1a879 <<hyperinterval::ieee::Format>::affine+0x259>
   1a859:	31 d2                	xor    %edx,%edx
   1a85b:	44 89 d1             	mov    %r10d,%ecx
   1a85e:	4c 0f a5 f2          	shld   %cl,%r14,%rdx
   1a862:	49 d3 e6             	shl    %cl,%r14
   1a865:	45 31 e4             	xor    %r12d,%r12d
   1a868:	41 f6 c2 40          	test   $0x40,%r10b
   1a86c:	49 0f 45 d6          	cmovne %r14,%rdx
   1a870:	4d 0f 45 f4          	cmovne %r12,%r14
   1a874:	4c 89 f0             	mov    %r14,%rax
   1a877:	eb 59                	jmp    1a8d2 <<hyperinterval::ieee::Format>::affine+0x2b2>
   1a879:	41 f7 da             	neg    %r10d
   1a87c:	45 31 e4             	xor    %r12d,%r12d
   1a87f:	b8 00 00 00 00       	mov    $0x0,%eax
   1a884:	41 83 fa 7f          	cmp    $0x7f,%r10d
   1a888:	7f 2d                	jg     1a8b7 <<hyperinterval::ieee::Format>::affine+0x297>
   1a88a:	4c 89 f0             	mov    %r14,%rax
   1a88d:	44 89 d1             	mov    %r10d,%ecx
   1a890:	4c 0f ad e0          	shrd   %cl,%r12,%rax
   1a894:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   1a89b:	49 d3 e3             	shl    %cl,%r11
   1a89e:	41 f6 c2 40          	test   $0x40,%r10b
   1a8a2:	49 0f 45 c4          	cmovne %r12,%rax
   1a8a6:	4d 0f 45 dc          	cmovne %r12,%r11
   1a8aa:	49 f7 d3             	not    %r11
   1a8ad:	ba 00 00 00 00       	mov    $0x0,%edx
   1a8b2:	4d 85 f3             	test   %r14,%r11
   1a8b5:	74 1b                	je     1a8d2 <<hyperinterval::ieee::Format>::affine+0x2b2>
   1a8b7:	4c 89 e2             	mov    %r12,%rdx
   1a8ba:	4c 89 c9             	mov    %r9,%rcx
   1a8bd:	48 21 f1             	and    %rsi,%rcx
   1a8c0:	45 31 d2             	xor    %r10d,%r10d
   1a8c3:	48 f7 d9             	neg    %rcx
   1a8c6:	41 0f 93 c2          	setae  %r10b
   1a8ca:	46 8d 24 55 ff ff ff 	lea    -0x1(,%r10,2),%r12d
   1a8d1:	ff 
   1a8d2:	49 85 f1             	test   %rsi,%r9
   1a8d5:	0f 95 c1             	setne  %cl
   1a8d8:	41 38 c8             	cmp    %cl,%r8b
   1a8db:	49 89 fe             	mov    %rdi,%r14
   1a8de:	74 19                	je     1a8f9 <<hyperinterval::ieee::Format>::affine+0x2d9>
   1a8e0:	49 39 c5             	cmp    %rax,%r13
   1a8e3:	48 89 e9             	mov    %rbp,%rcx
   1a8e6:	48 19 d1             	sbb    %rdx,%rcx
   1a8e9:	73 16                	jae    1a901 <<hyperinterval::ieee::Format>::affine+0x2e1>
   1a8eb:	4c 29 e8             	sub    %r13,%rax
   1a8ee:	48 19 ea             	sbb    %rbp,%rdx
   1a8f1:	44 0f b6 44 24 07    	movzbl 0x7(%rsp),%r8d
   1a8f7:	eb 14                	jmp    1a90d <<hyperinterval::ieee::Format>::affine+0x2ed>
   1a8f9:	4c 01 e8             	add    %r13,%rax
   1a8fc:	48 11 ea             	adc    %rbp,%rdx
   1a8ff:	eb 0c                	jmp    1a90d <<hyperinterval::ieee::Format>::affine+0x2ed>
   1a901:	49 29 c5             	sub    %rax,%r13
   1a904:	48 19 d5             	sbb    %rdx,%rbp
   1a907:	4c 89 e8             	mov    %r13,%rax
   1a90a:	48 89 ea             	mov    %rbp,%rdx
   1a90d:	44 88 44 24 24       	mov    %r8b,0x24(%rsp)
   1a912:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1a917:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1a91c:	44 89 7c 24 20       	mov    %r15d,0x20(%rsp)
   1a921:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1a926:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1a92b:	49 89 f5             	mov    %rsi,%r13
   1a92e:	48 89 da             	mov    %rbx,%rdx
   1a931:	e8 fa 00 00 00       	call   1aa30 <<hyperinterval::ieee::Format>::rounded>
   1a936:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   1a93b:	75 12                	jne    1a94f <<hyperinterval::ieee::Format>::affine+0x32f>
   1a93d:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
   1a942:	41 88 46 01          	mov    %al,0x1(%r14)
   1a946:	41 c6 06 01          	movb   $0x1,(%r14)
   1a94a:	e9 80 00 00 00       	jmp    1a9cf <<hyperinterval::ieee::Format>::affine+0x3af>
   1a94f:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
   1a954:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
   1a959:	49 39 c7             	cmp    %rax,%r15
   1a95c:	4c 89 f1             	mov    %r14,%rcx
   1a95f:	75 63                	jne    1a9c4 <<hyperinterval::ieee::Format>::affine+0x3a4>
   1a961:	44 03 64 24 08       	add    0x8(%rsp),%r12d
   1a966:	41 83 fc 01          	cmp    $0x1,%r12d
   1a96a:	74 75                	je     1a9e1 <<hyperinterval::ieee::Format>::affine+0x3c1>
   1a96c:	41 83 fc ff          	cmp    $0xffffffff,%r12d
   1a970:	75 52                	jne    1a9c4 <<hyperinterval::ieee::Format>::affine+0x3a4>
   1a972:	4c 89 f8             	mov    %r15,%rax
   1a975:	4c 89 ee             	mov    %r13,%rsi
   1a978:	4c 31 e8             	xor    %r13,%rax
   1a97b:	4d 85 ff             	test   %r15,%r15
   1a97e:	49 0f 44 c7          	cmove  %r15,%rax
   1a982:	48 89 c1             	mov    %rax,%rcx
   1a985:	4c 21 e9             	and    %r13,%rcx
   1a988:	31 d2                	xor    %edx,%edx
   1a98a:	48 f7 d9             	neg    %rcx
   1a98d:	0f 93 c2             	setae  %dl
   1a990:	48 8d 0c 50          	lea    (%rax,%rdx,2),%rcx
   1a994:	48 ff c9             	dec    %rcx
   1a997:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1a99c:	48 89 da             	mov    %rbx,%rdx
   1a99f:	e8 3c d5 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1a9a4:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1a9a9:	75 62                	jne    1aa0d <<hyperinterval::ieee::Format>::affine+0x3ed>
   1a9ab:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1a9b0:	49 31 c5             	xor    %rax,%r13
   1a9b3:	48 85 c0             	test   %rax,%rax
   1a9b6:	4c 0f 44 e8          	cmove  %rax,%r13
   1a9ba:	4d 89 6e 08          	mov    %r13,0x8(%r14)
   1a9be:	4d 89 7e 10          	mov    %r15,0x10(%r14)
   1a9c2:	eb 5e                	jmp    1aa22 <<hyperinterval::ieee::Format>::affine+0x402>
   1a9c4:	4c 89 79 08          	mov    %r15,0x8(%rcx)
   1a9c8:	48 89 41 10          	mov    %rax,0x10(%rcx)
   1a9cc:	c6 01 00             	movb   $0x0,(%rcx)
   1a9cf:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1a9d6:	5b                   	pop    %rbx
   1a9d7:	41 5c                	pop    %r12
   1a9d9:	41 5d                	pop    %r13
   1a9db:	41 5e                	pop    %r14
   1a9dd:	41 5f                	pop    %r15
   1a9df:	5d                   	pop    %rbp
   1a9e0:	c3                   	ret
   1a9e1:	4c 89 ee             	mov    %r13,%rsi
   1a9e4:	4c 89 f8             	mov    %r15,%rax
   1a9e7:	4c 21 e8             	and    %r13,%rax
   1a9ea:	31 c9                	xor    %ecx,%ecx
   1a9ec:	48 f7 d8             	neg    %rax
   1a9ef:	0f 93 c1             	setae  %cl
   1a9f2:	49 8d 0c 4f          	lea    (%r15,%rcx,2),%rcx
   1a9f6:	48 ff c9             	dec    %rcx
   1a9f9:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1a9fe:	48 89 da             	mov    %rbx,%rdx
   1aa01:	e8 da d4 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1aa06:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1aa0b:	74 08                	je     1aa15 <<hyperinterval::ieee::Format>::affine+0x3f5>
   1aa0d:	66 41 c7 06 01 03    	movw   $0x301,(%r14)
   1aa13:	eb ba                	jmp    1a9cf <<hyperinterval::ieee::Format>::affine+0x3af>
   1aa15:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1aa1a:	4d 89 7e 08          	mov    %r15,0x8(%r14)
   1aa1e:	49 89 46 10          	mov    %rax,0x10(%r14)
   1aa22:	41 c6 06 00          	movb   $0x0,(%r14)
   1aa26:	eb a7                	jmp    1a9cf <<hyperinterval::ieee::Format>::affine+0x3af>
   1aa28:	cc                   	int3
   1aa29:	cc                   	int3
   1aa2a:	cc                   	int3
   1aa2b:	cc                   	int3
   1aa2c:	cc                   	int3
   1aa2d:	cc                   	int3
   1aa2e:	cc                   	int3
   1aa2f:	cc                   	int3

<hyperinterval::ieee::Format>::rounded:
   1aa30:	48 89 c8             	mov    %rcx,%rax
   1aa33:	4c 8b 11             	mov    (%rcx),%r10
   1aa36:	4c 8b 59 08          	mov    0x8(%rcx),%r11
   1aa3a:	4c 89 d1             	mov    %r10,%rcx
   1aa3d:	4c 09 d9             	or     %r11,%rcx
   1aa40:	0f 84 dd 00 00 00    	je     1ab23 <<hyperinterval::ieee::Format>::rounded+0xf3>
   1aa46:	55                   	push   %rbp
   1aa47:	41 57                	push   %r15
   1aa49:	41 56                	push   %r14
   1aa4b:	41 55                	push   %r13
   1aa4d:	41 54                	push   %r12
   1aa4f:	53                   	push   %rbx
   1aa50:	8b 68 10             	mov    0x10(%rax),%ebp
   1aa53:	49 0f bd cb          	bsr    %r11,%rcx
   1aa57:	83 f1 3f             	xor    $0x3f,%ecx
   1aa5a:	49 0f bd da          	bsr    %r10,%rbx
   1aa5e:	83 f3 3f             	xor    $0x3f,%ebx
   1aa61:	83 cb 40             	or     $0x40,%ebx
   1aa64:	4d 85 db             	test   %r11,%r11
   1aa67:	0f 45 d9             	cmovne %ecx,%ebx
   1aa6a:	f3 4c 0f bc c2       	tzcnt  %rdx,%r8
   1aa6f:	44 89 c1             	mov    %r8d,%ecx
   1aa72:	48 d3 ea             	shr    %cl,%rdx
   1aa75:	83 f3 7f             	xor    $0x7f,%ebx
   1aa78:	01 eb                	add    %ebp,%ebx
   1aa7a:	48 d1 ea             	shr    $1,%rdx
   1aa7d:	39 d3                	cmp    %edx,%ebx
   1aa7f:	0f 8f 88 01 00 00    	jg     1ac0d <<hyperinterval::ieee::Format>::rounded+0x1dd>
   1aa85:	45 8d 0c 10          	lea    (%r8,%rdx,1),%r9d
   1aa89:	b9 01 00 00 00       	mov    $0x1,%ecx
   1aa8e:	44 29 c9             	sub    %r9d,%ecx
   1aa91:	44 29 c3             	sub    %r8d,%ebx
   1aa94:	39 cb                	cmp    %ecx,%ebx
   1aa96:	0f 4e d9             	cmovle %ecx,%ebx
   1aa99:	89 d9                	mov    %ebx,%ecx
   1aa9b:	29 e9                	sub    %ebp,%ecx
   1aa9d:	83 f9 7f             	cmp    $0x7f,%ecx
   1aaa0:	0f 8e 88 00 00 00    	jle    1ab2e <<hyperinterval::ieee::Format>::rounded+0xfe>
   1aaa6:	41 b7 01             	mov    $0x1,%r15b
   1aaa9:	45 31 f6             	xor    %r14d,%r14d
   1aaac:	45 31 db             	xor    %r11d,%r11d
   1aaaf:	45 31 d2             	xor    %r10d,%r10d
   1aab2:	45 0f b6 ff          	movzbl %r15b,%r15d
   1aab6:	4d 01 f7             	add    %r14,%r15
   1aab9:	49 83 d3 00          	adc    $0x0,%r11
   1aabd:	4c 89 f9             	mov    %r15,%rcx
   1aac0:	4c 09 d9             	or     %r11,%rcx
   1aac3:	0f 84 c3 00 00 00    	je     1ab8c <<hyperinterval::ieee::Format>::rounded+0x15c>
   1aac9:	49 0f bd cb          	bsr    %r11,%rcx
   1aacd:	83 f1 3f             	xor    $0x3f,%ecx
   1aad0:	4d 0f bd f7          	bsr    %r15,%r14
   1aad4:	41 83 f6 3f          	xor    $0x3f,%r14d
   1aad8:	41 83 ce 40          	or     $0x40,%r14d
   1aadc:	4d 85 db             	test   %r11,%r11
   1aadf:	44 0f 45 f1          	cmovne %ecx,%r14d
   1aae3:	41 83 f6 7f          	xor    $0x7f,%r14d
   1aae7:	41 8d 2c 1e          	lea    (%r14,%rbx,1),%ebp
   1aaeb:	39 d5                	cmp    %edx,%ebp
   1aaed:	0f 8f 1a 01 00 00    	jg     1ac0d <<hyperinterval::ieee::Format>::rounded+0x1dd>
   1aaf3:	b9 01 00 00 00       	mov    $0x1,%ecx
   1aaf8:	29 d1                	sub    %edx,%ecx
   1aafa:	39 cd                	cmp    %ecx,%ebp
   1aafc:	0f 8d 41 01 00 00    	jge    1ac43 <<hyperinterval::ieee::Format>::rounded+0x213>
   1ab02:	41 01 d9             	add    %ebx,%r9d
   1ab05:	41 fe c9             	dec    %r9b
   1ab08:	44 89 c9             	mov    %r9d,%ecx
   1ab0b:	49 d3 e7             	shl    %cl,%r15
   1ab0e:	31 d2                	xor    %edx,%edx
   1ab10:	41 f6 c1 40          	test   $0x40,%r9b
   1ab14:	49 0f 44 d7          	cmove  %r15,%rdx
   1ab18:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1ab1c:	74 76                	je     1ab94 <<hyperinterval::ieee::Format>::rounded+0x164>
   1ab1e:	e9 8e 00 00 00       	jmp    1abb1 <<hyperinterval::ieee::Format>::rounded+0x181>
   1ab23:	c6 07 00             	movb   $0x0,(%rdi)
   1ab26:	0f 57 c0             	xorps  %xmm0,%xmm0
   1ab29:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1ab2d:	c3                   	ret
   1ab2e:	85 c9                	test   %ecx,%ecx
   1ab30:	0f 8e 88 00 00 00    	jle    1abbe <<hyperinterval::ieee::Format>::rounded+0x18e>
   1ab36:	4d 89 d6             	mov    %r10,%r14
   1ab39:	4d 0f ad de          	shrd   %cl,%r11,%r14
   1ab3d:	4d 89 dc             	mov    %r11,%r12
   1ab40:	49 d3 ec             	shr    %cl,%r12
   1ab43:	49 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%r15
   1ab4a:	49 d3 e7             	shl    %cl,%r15
   1ab4d:	49 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%r13
   1ab54:	31 ed                	xor    %ebp,%ebp
   1ab56:	f6 c1 40             	test   $0x40,%cl
   1ab59:	4d 0f 45 f4          	cmovne %r12,%r14
   1ab5d:	4c 0f 45 e5          	cmovne %rbp,%r12
   1ab61:	4d 0f 45 ef          	cmovne %r15,%r13
   1ab65:	4c 0f 45 fd          	cmovne %rbp,%r15
   1ab69:	49 f7 d7             	not    %r15
   1ab6c:	49 f7 d5             	not    %r13
   1ab6f:	4d 21 dd             	and    %r11,%r13
   1ab72:	4d 21 d7             	and    %r10,%r15
   1ab75:	4d 09 ef             	or     %r13,%r15
   1ab78:	41 0f 95 c7          	setne  %r15b
   1ab7c:	4d 89 e3             	mov    %r12,%r11
   1ab7f:	4c 89 f1             	mov    %r14,%rcx
   1ab82:	4c 09 d9             	or     %r11,%rcx
   1ab85:	75 60                	jne    1abe7 <<hyperinterval::ieee::Format>::rounded+0x1b7>
   1ab87:	e9 1d ff ff ff       	jmp    1aaa9 <<hyperinterval::ieee::Format>::rounded+0x79>
   1ab8c:	31 d2                	xor    %edx,%edx
   1ab8e:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1ab92:	75 1d                	jne    1abb1 <<hyperinterval::ieee::Format>::rounded+0x181>
   1ab94:	48 89 d0             	mov    %rdx,%rax
   1ab97:	48 31 f0             	xor    %rsi,%rax
   1ab9a:	48 85 d2             	test   %rdx,%rdx
   1ab9d:	48 0f 44 c2          	cmove  %rdx,%rax
   1aba1:	4c 31 d6             	xor    %r10,%rsi
   1aba4:	4d 85 d2             	test   %r10,%r10
   1aba7:	49 0f 44 f2          	cmove  %r10,%rsi
   1abab:	49 89 c2             	mov    %rax,%r10
   1abae:	48 89 f2             	mov    %rsi,%rdx
   1abb1:	4c 89 57 08          	mov    %r10,0x8(%rdi)
   1abb5:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   1abb9:	c6 07 00             	movb   $0x0,(%rdi)
   1abbc:	eb 54                	jmp    1ac12 <<hyperinterval::ieee::Format>::rounded+0x1e2>
   1abbe:	f6 d9                	neg    %cl
   1abc0:	4d 0f a5 d3          	shld   %cl,%r10,%r11
   1abc4:	49 d3 e2             	shl    %cl,%r10
   1abc7:	45 31 ff             	xor    %r15d,%r15d
   1abca:	f6 c1 40             	test   $0x40,%cl
   1abcd:	4d 0f 45 da          	cmovne %r10,%r11
   1abd1:	41 be 00 00 00 00    	mov    $0x0,%r14d
   1abd7:	4d 0f 44 f2          	cmove  %r10,%r14
   1abdb:	4c 89 f1             	mov    %r14,%rcx
   1abde:	4c 09 d9             	or     %r11,%rcx
   1abe1:	0f 84 c2 fe ff ff    	je     1aaa9 <<hyperinterval::ieee::Format>::rounded+0x79>
   1abe7:	49 0f bd cb          	bsr    %r11,%rcx
   1abeb:	83 f1 3f             	xor    $0x3f,%ecx
   1abee:	4d 0f bd e6          	bsr    %r14,%r12
   1abf2:	41 83 f4 3f          	xor    $0x3f,%r12d
   1abf6:	41 83 cc 40          	or     $0x40,%r12d
   1abfa:	4d 85 db             	test   %r11,%r11
   1abfd:	44 0f 45 e1          	cmovne %ecx,%r12d
   1ac01:	41 83 f4 7f          	xor    $0x7f,%r12d
   1ac05:	41 8d 2c 1c          	lea    (%r12,%rbx,1),%ebp
   1ac09:	39 d5                	cmp    %edx,%ebp
   1ac0b:	7e 10                	jle    1ac1d <<hyperinterval::ieee::Format>::rounded+0x1ed>
   1ac0d:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   1ac12:	5b                   	pop    %rbx
   1ac13:	41 5c                	pop    %r12
   1ac15:	41 5d                	pop    %r13
   1ac17:	41 5e                	pop    %r14
   1ac19:	41 5f                	pop    %r15
   1ac1b:	5d                   	pop    %rbp
   1ac1c:	c3                   	ret
   1ac1d:	b9 01 00 00 00       	mov    $0x1,%ecx
   1ac22:	29 d1                	sub    %edx,%ecx
   1ac24:	39 cd                	cmp    %ecx,%ebp
   1ac26:	7d 7d                	jge    1aca5 <<hyperinterval::ieee::Format>::rounded+0x275>
   1ac28:	41 8d 0c 19          	lea    (%r9,%rbx,1),%ecx
   1ac2c:	fe c9                	dec    %cl
   1ac2e:	4d 89 f4             	mov    %r14,%r12
   1ac31:	49 d3 e4             	shl    %cl,%r12
   1ac34:	45 31 d2             	xor    %r10d,%r10d
   1ac37:	f6 c1 40             	test   $0x40,%cl
   1ac3a:	4d 0f 44 d4          	cmove  %r12,%r10
   1ac3e:	e9 6f fe ff ff       	jmp    1aab2 <<hyperinterval::ieee::Format>::rounded+0x82>
   1ac43:	44 89 c1             	mov    %r8d,%ecx
   1ac46:	44 29 f1             	sub    %r14d,%ecx
   1ac49:	41 89 c9             	mov    %ecx,%r9d
   1ac4c:	41 f7 d9             	neg    %r9d
   1ac4f:	4c 89 fb             	mov    %r15,%rbx
   1ac52:	48 d3 e3             	shl    %cl,%rbx
   1ac55:	45 31 e4             	xor    %r12d,%r12d
   1ac58:	f6 c1 40             	test   $0x40,%cl
   1ac5b:	4c 0f 44 e3          	cmove  %rbx,%r12
   1ac5f:	44 89 c9             	mov    %r9d,%ecx
   1ac62:	4d 0f ad df          	shrd   %cl,%r11,%r15
   1ac66:	49 d3 eb             	shr    %cl,%r11
   1ac69:	41 f6 c1 40          	test   $0x40,%r9b
   1ac6d:	4d 0f 44 df          	cmove  %r15,%r11
   1ac71:	45 39 f0             	cmp    %r14d,%r8d
   1ac74:	4d 0f 43 dc          	cmovae %r12,%r11
   1ac78:	01 d5                	add    %edx,%ebp
   1ac7a:	4c 63 cd             	movslq %ebp,%r9
   1ac7d:	44 89 c1             	mov    %r8d,%ecx
   1ac80:	49 d3 e1             	shl    %cl,%r9
   1ac83:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
   1ac8a:	48 d3 e2             	shl    %cl,%rdx
   1ac8d:	48 f7 d2             	not    %rdx
   1ac90:	4c 21 da             	and    %r11,%rdx
   1ac93:	4c 09 ca             	or     %r9,%rdx
   1ac96:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1ac9a:	0f 85 11 ff ff ff    	jne    1abb1 <<hyperinterval::ieee::Format>::rounded+0x181>
   1aca0:	e9 ef fe ff ff       	jmp    1ab94 <<hyperinterval::ieee::Format>::rounded+0x164>
   1aca5:	44 89 c1             	mov    %r8d,%ecx
   1aca8:	44 29 e1             	sub    %r12d,%ecx
   1acab:	4d 89 f5             	mov    %r14,%r13
   1acae:	49 d3 e5             	shl    %cl,%r13
   1acb1:	41 89 ca             	mov    %ecx,%r10d
   1acb4:	41 f7 da             	neg    %r10d
   1acb7:	48 c7 44 24 f0 00 00 	movq   $0x0,-0x10(%rsp)
   1acbe:	00 00 
   1acc0:	f6 c1 40             	test   $0x40,%cl
   1acc3:	48 8b 4c 24 f0       	mov    -0x10(%rsp),%rcx
   1acc8:	49 0f 44 cd          	cmove  %r13,%rcx
   1accc:	48 89 4c 24 f0       	mov    %rcx,-0x10(%rsp)
   1acd1:	4d 89 f5             	mov    %r14,%r13
   1acd4:	44 89 d1             	mov    %r10d,%ecx
   1acd7:	4d 0f ad dd          	shrd   %cl,%r11,%r13
   1acdb:	4c 89 6c 24 f8       	mov    %r13,-0x8(%rsp)
   1ace0:	4d 89 dd             	mov    %r11,%r13
   1ace3:	49 d3 ed             	shr    %cl,%r13
   1ace6:	41 f6 c2 40          	test   $0x40,%r10b
   1acea:	4c 0f 44 6c 24 f8    	cmove  -0x8(%rsp),%r13
   1acf0:	45 39 e0             	cmp    %r12d,%r8d
   1acf3:	4c 0f 43 6c 24 f0    	cmovae -0x10(%rsp),%r13
   1acf9:	01 d5                	add    %edx,%ebp
   1acfb:	4c 63 e5             	movslq %ebp,%r12
   1acfe:	44 89 c1             	mov    %r8d,%ecx
   1ad01:	49 d3 e4             	shl    %cl,%r12
   1ad04:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
   1ad0b:	49 d3 e2             	shl    %cl,%r10
   1ad0e:	49 f7 d2             	not    %r10
   1ad11:	4d 21 ea             	and    %r13,%r10
   1ad14:	4d 09 e2             	or     %r12,%r10
   1ad17:	e9 96 fd ff ff       	jmp    1aab2 <<hyperinterval::ieee::Format>::rounded+0x82>
   1ad1c:	cc                   	int3
   1ad1d:	cc                   	int3
   1ad1e:	cc                   	int3
   1ad1f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::reciprocal:
   1ad20:	55                   	push   %rbp
   1ad21:	41 57                	push   %r15
   1ad23:	41 56                	push   %r14
   1ad25:	41 55                	push   %r13
   1ad27:	41 54                	push   %r12
   1ad29:	53                   	push   %rbx
   1ad2a:	48 83 ec 28          	sub    $0x28,%rsp
   1ad2e:	48 89 fb             	mov    %rdi,%rbx
   1ad31:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1ad35:	74 65                	je     1ad9c <<hyperinterval::float::F64Enclosure>::reciprocal+0x7c>
   1ad37:	49 89 f6             	mov    %rsi,%r14
   1ad3a:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
   1ad41:	00 00 80 
   1ad44:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1ad4b:	00 f0 7f 
   1ad4e:	49 bd 00 00 00 00 00 	movabs $0x3ff0000000000000,%r13
   1ad55:	00 f0 3f 
   1ad58:	48 89 e7             	mov    %rsp,%rdi
   1ad5b:	4c 89 fe             	mov    %r15,%rsi
   1ad5e:	4c 89 e2             	mov    %r12,%rdx
   1ad61:	4c 89 e9             	mov    %r13,%rcx
   1ad64:	e8 77 d1 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1ad69:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1ad6d:	74 1c                	je     1ad8b <<hyperinterval::float::F64Enclosure>::reciprocal+0x6b>
   1ad6f:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1ad74:	48 89 e7             	mov    %rsp,%rdi
   1ad77:	4c 89 fe             	mov    %r15,%rsi
   1ad7a:	4c 89 e2             	mov    %r12,%rdx
   1ad7d:	4c 89 e9             	mov    %r13,%rcx
   1ad80:	e8 5b d1 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1ad85:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1ad89:	75 2a                	jne    1adb5 <<hyperinterval::float::F64Enclosure>::reciprocal+0x95>
   1ad8b:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   1ad90:	88 53 08             	mov    %dl,0x8(%rbx)
   1ad93:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1ad9a:	eb 07                	jmp    1ada3 <<hyperinterval::float::F64Enclosure>::reciprocal+0x83>
   1ad9c:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1ada3:	48 89 d8             	mov    %rbx,%rax
   1ada6:	48 83 c4 28          	add    $0x28,%rsp
   1adaa:	5b                   	pop    %rbx
   1adab:	41 5c                	pop    %r12
   1adad:	41 5d                	pop    %r13
   1adaf:	41 5e                	pop    %r14
   1adb1:	41 5f                	pop    %r15
   1adb3:	5d                   	pop    %rbp
   1adb4:	c3                   	ret
   1adb5:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1adba:	49 8d 14 2f          	lea    (%r15,%rbp,1),%rdx
   1adbe:	49 8d 47 ff          	lea    -0x1(%r15),%rax
   1adc2:	48 89 ee             	mov    %rbp,%rsi
   1adc5:	48 21 c6             	and    %rax,%rsi
   1adc8:	4c 89 ff             	mov    %r15,%rdi
   1adcb:	48 29 f7             	sub    %rsi,%rdi
   1adce:	48 85 ed             	test   %rbp,%rbp
   1add1:	48 0f 49 fa          	cmovns %rdx,%rdi
   1add5:	4a 8d 14 39          	lea    (%rcx,%r15,1),%rdx
   1add9:	48 89 ce             	mov    %rcx,%rsi
   1addc:	48 21 c6             	and    %rax,%rsi
   1addf:	49 29 f7             	sub    %rsi,%r15
   1ade2:	48 85 c9             	test   %rcx,%rcx
   1ade5:	4c 0f 49 fa          	cmovns %rdx,%r15
   1ade9:	b2 01                	mov    $0x1,%dl
   1adeb:	4c 39 ff             	cmp    %r15,%rdi
   1adee:	77 a0                	ja     1ad90 <<hyperinterval::float::F64Enclosure>::reciprocal+0x70>
   1adf0:	48 c7 44 24 10 01 00 	movq   $0x1,0x10(%rsp)
   1adf7:	00 00 
   1adf9:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
   1adfe:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   1ae03:	49 83 7e 08 00       	cmpq   $0x0,0x8(%r14)
   1ae08:	7f 0e                	jg     1ae18 <<hyperinterval::float::F64Enclosure>::reciprocal+0xf8>
   1ae0a:	49 8b 4e 10          	mov    0x10(%r14),%rcx
   1ae0e:	48 85 c9             	test   %rcx,%rcx
   1ae11:	79 1f                	jns    1ae32 <<hyperinterval::float::F64Enclosure>::reciprocal+0x112>
   1ae13:	48 21 c1             	and    %rax,%rcx
   1ae16:	74 1a                	je     1ae32 <<hyperinterval::float::F64Enclosure>::reciprocal+0x112>
   1ae18:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
   1ae1d:	48 89 df             	mov    %rbx,%rdi
   1ae20:	4c 89 f2             	mov    %r14,%rdx
   1ae23:	b9 01 00 00 00       	mov    $0x1,%ecx
   1ae28:	e8 b3 02 00 00       	call   1b0e0 <<hyperinterval::float::F64Enclosure>::corner_image>
   1ae2d:	e9 71 ff ff ff       	jmp    1ada3 <<hyperinterval::float::F64Enclosure>::reciprocal+0x83>
   1ae32:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
   1ae36:	e9 58 ff ff ff       	jmp    1ad93 <<hyperinterval::float::F64Enclosure>::reciprocal+0x73>
   1ae3b:	cc                   	int3
   1ae3c:	cc                   	int3
   1ae3d:	cc                   	int3
   1ae3e:	cc                   	int3
   1ae3f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::checked_pow:
   1ae40:	55                   	push   %rbp
   1ae41:	41 57                	push   %r15
   1ae43:	41 56                	push   %r14
   1ae45:	41 55                	push   %r13
   1ae47:	41 54                	push   %r12
   1ae49:	53                   	push   %rbx
   1ae4a:	48 83 ec 78          	sub    $0x78,%rsp
   1ae4e:	48 89 fb             	mov    %rdi,%rbx
   1ae51:	83 fa 02             	cmp    $0x2,%edx
   1ae54:	75 0e                	jne    1ae64 <<hyperinterval::float::F64Enclosure>::checked_pow+0x24>
   1ae56:	48 89 df             	mov    %rbx,%rdi
   1ae59:	ff 15 69 10 04 00    	call   *0x41069(%rip)        # 5bec8 <_DYNAMIC+0x2f0>
   1ae5f:	e9 80 00 00 00       	jmp    1aee4 <<hyperinterval::float::F64Enclosure>::checked_pow+0xa4>
   1ae64:	f6 06 01             	testb  $0x1,(%rsi)
   1ae67:	74 74                	je     1aedd <<hyperinterval::float::F64Enclosure>::checked_pow+0x9d>
   1ae69:	89 d5                	mov    %edx,%ebp
   1ae6b:	4c 8b 76 10          	mov    0x10(%rsi),%r14
   1ae6f:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
   1ae76:	00 00 80 
   1ae79:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1ae80:	00 f0 7f 
   1ae83:	48 89 74 24 70       	mov    %rsi,0x70(%rsp)
   1ae88:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1ae8c:	48 89 e7             	mov    %rsp,%rdi
   1ae8f:	4c 89 fe             	mov    %r15,%rsi
   1ae92:	4c 89 e2             	mov    %r12,%rdx
   1ae95:	41 89 e8             	mov    %ebp,%r8d
   1ae98:	e8 73 f3 ff ff       	call   1a210 <<hyperinterval::ieee::Format>::power>
   1ae9d:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1aea1:	75 29                	jne    1aecc <<hyperinterval::float::F64Enclosure>::checked_pow+0x8c>
   1aea3:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1aea8:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1aead:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1aeb2:	48 89 e7             	mov    %rsp,%rdi
   1aeb5:	4c 89 fe             	mov    %r15,%rsi
   1aeb8:	4c 89 e2             	mov    %r12,%rdx
   1aebb:	4c 89 f1             	mov    %r14,%rcx
   1aebe:	41 89 e8             	mov    %ebp,%r8d
   1aec1:	e8 4a f3 ff ff       	call   1a210 <<hyperinterval::ieee::Format>::power>
   1aec6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1aeca:	75 2a                	jne    1aef6 <<hyperinterval::float::F64Enclosure>::checked_pow+0xb6>
   1aecc:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1aed1:	88 43 08             	mov    %al,0x8(%rbx)
   1aed4:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1aedb:	eb 07                	jmp    1aee4 <<hyperinterval::float::F64Enclosure>::checked_pow+0xa4>
   1aedd:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1aee4:	48 89 d8             	mov    %rbx,%rax
   1aee7:	48 83 c4 78          	add    $0x78,%rsp
   1aeeb:	5b                   	pop    %rbx
   1aeec:	41 5c                	pop    %r12
   1aeee:	41 5d                	pop    %r13
   1aef0:	41 5e                	pop    %r14
   1aef2:	41 5f                	pop    %r15
   1aef4:	5d                   	pop    %rbp
   1aef5:	c3                   	ret
   1aef6:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1aefb:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
   1af00:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   1af05:	48 89 e7             	mov    %rsp,%rdi
   1af08:	4c 89 fe             	mov    %r15,%rsi
   1af0b:	4c 89 e2             	mov    %r12,%rdx
   1af0e:	4c 89 e9             	mov    %r13,%rcx
   1af11:	e8 ca cf ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1af16:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1af1a:	74 1e                	je     1af3a <<hyperinterval::float::F64Enclosure>::checked_pow+0xfa>
   1af1c:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1af21:	48 89 e7             	mov    %rsp,%rdi
   1af24:	4c 89 fe             	mov    %r15,%rsi
   1af27:	4c 89 e2             	mov    %r12,%rdx
   1af2a:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1af2f:	e8 ac cf ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1af34:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1af38:	75 11                	jne    1af4b <<hyperinterval::float::F64Enclosure>::checked_pow+0x10b>
   1af3a:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   1af3f:	88 4b 08             	mov    %cl,0x8(%rbx)
   1af42:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1af49:	eb 99                	jmp    1aee4 <<hyperinterval::float::F64Enclosure>::checked_pow+0xa4>
   1af4b:	4c 89 74 24 18       	mov    %r14,0x18(%rsp)
   1af50:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1af55:	4b 8d 0c 2f          	lea    (%r15,%r13,1),%rcx
   1af59:	4d 8d 77 ff          	lea    -0x1(%r15),%r14
   1af5d:	4c 89 ea             	mov    %r13,%rdx
   1af60:	4c 21 f2             	and    %r14,%rdx
   1af63:	4c 89 fe             	mov    %r15,%rsi
   1af66:	48 29 d6             	sub    %rdx,%rsi
   1af69:	4d 85 ed             	test   %r13,%r13
   1af6c:	48 0f 49 f1          	cmovns %rcx,%rsi
   1af70:	4a 8d 0c 38          	lea    (%rax,%r15,1),%rcx
   1af74:	48 89 c2             	mov    %rax,%rdx
   1af77:	4c 21 f2             	and    %r14,%rdx
   1af7a:	4c 89 ff             	mov    %r15,%rdi
   1af7d:	48 29 d7             	sub    %rdx,%rdi
   1af80:	48 85 c0             	test   %rax,%rax
   1af83:	48 0f 49 f9          	cmovns %rcx,%rdi
   1af87:	b1 01                	mov    $0x1,%cl
   1af89:	48 39 fe             	cmp    %rdi,%rsi
   1af8c:	77 b1                	ja     1af3f <<hyperinterval::float::F64Enclosure>::checked_pow+0xff>
   1af8e:	48 c7 44 24 38 01 00 	movq   $0x1,0x38(%rsp)
   1af95:	00 00 
   1af97:	4c 89 6c 24 40       	mov    %r13,0x40(%rsp)
   1af9c:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1afa1:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   1afa6:	4c 89 fe             	mov    %r15,%rsi
   1afa9:	4c 89 e2             	mov    %r12,%rdx
   1afac:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
   1afb1:	e8 2a cf ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1afb6:	80 7c 24 20 01       	cmpb   $0x1,0x20(%rsp)
   1afbb:	74 21                	je     1afde <<hyperinterval::float::F64Enclosure>::checked_pow+0x19e>
   1afbd:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
   1afc2:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   1afc7:	4c 89 fe             	mov    %r15,%rsi
   1afca:	4c 89 e2             	mov    %r12,%rdx
   1afcd:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1afd2:	e8 09 cf ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1afd7:	80 7c 24 20 01       	cmpb   $0x1,0x20(%rsp)
   1afdc:	75 0a                	jne    1afe8 <<hyperinterval::float::F64Enclosure>::checked_pow+0x1a8>
   1afde:	0f b6 4c 24 21       	movzbl 0x21(%rsp),%ecx
   1afe3:	e9 57 ff ff ff       	jmp    1af3f <<hyperinterval::float::F64Enclosure>::checked_pow+0xff>
   1afe8:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   1afed:	4b 8d 0c 2f          	lea    (%r15,%r13,1),%rcx
   1aff1:	4c 89 ea             	mov    %r13,%rdx
   1aff4:	4c 21 f2             	and    %r14,%rdx
   1aff7:	4c 89 fe             	mov    %r15,%rsi
   1affa:	48 29 d6             	sub    %rdx,%rsi
   1affd:	4d 85 ed             	test   %r13,%r13
   1b000:	48 0f 49 f1          	cmovns %rcx,%rsi
   1b004:	4a 8d 0c 38          	lea    (%rax,%r15,1),%rcx
   1b008:	49 21 c6             	and    %rax,%r14
   1b00b:	4d 29 f7             	sub    %r14,%r15
   1b00e:	48 85 c0             	test   %rax,%rax
   1b011:	4c 0f 49 f9          	cmovns %rcx,%r15
   1b015:	b1 01                	mov    $0x1,%cl
   1b017:	4c 39 fe             	cmp    %r15,%rsi
   1b01a:	0f 87 1f ff ff ff    	ja     1af3f <<hyperinterval::float::F64Enclosure>::checked_pow+0xff>
   1b020:	48 c7 04 24 01 00 00 	movq   $0x1,(%rsp)
   1b027:	00 
   1b028:	4c 89 6c 24 08       	mov    %r13,0x8(%rsp)
   1b02d:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1b032:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
   1b037:	48 8d 74 24 38       	lea    0x38(%rsp),%rsi
   1b03c:	48 89 e2             	mov    %rsp,%rdx
   1b03f:	ff 15 33 0f 04 00    	call   *0x40f33(%rip)        # 5bf78 <_DYNAMIC+0x3a0>
   1b045:	85 ed                	test   %ebp,%ebp
   1b047:	0f 95 c0             	setne  %al
   1b04a:	40 f6 c5 01          	test   $0x1,%bpl
   1b04e:	0f 94 c1             	sete   %cl
   1b051:	84 c8                	test   %cl,%al
   1b053:	74 74                	je     1b0c9 <<hyperinterval::float::F64Enclosure>::checked_pow+0x289>
   1b055:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
   1b05a:	ff 15 20 0f 04 00    	call   *0x40f20(%rip)        # 5bf80 <_DYNAMIC+0x3a8>
   1b060:	a8 02                	test   $0x2,%al
   1b062:	74 65                	je     1b0c9 <<hyperinterval::float::F64Enclosure>::checked_pow+0x289>
   1b064:	48 89 e7             	mov    %rsp,%rdi
   1b067:	31 f6                	xor    %esi,%esi
   1b069:	31 d2                	xor    %edx,%edx
   1b06b:	e8 b0 18 00 00       	call   1c920 <<hyperinterval::float::F64Enclosure>::from_bits>
   1b070:	48 8b 0c 24          	mov    (%rsp),%rcx
   1b074:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1b079:	48 83 f9 02          	cmp    $0x2,%rcx
   1b07d:	0f 84 4e fe ff ff    	je     1aed1 <<hyperinterval::float::F64Enclosure>::checked_pow+0x91>
   1b083:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   1b088:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1b08d:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
   1b092:	48 89 54 24 41       	mov    %rdx,0x41(%rsp)
   1b097:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
   1b09c:	88 44 24 40          	mov    %al,0x40(%rsp)
   1b0a0:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   1b0a5:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   1b0aa:	48 8d 54 24 38       	lea    0x38(%rsp),%rdx
   1b0af:	ff 15 c3 0e 04 00    	call   *0x40ec3(%rip)        # 5bf78 <_DYNAMIC+0x3a0>
   1b0b5:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   1b0ba:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1b0bf:	0f 10 44 24 20       	movups 0x20(%rsp),%xmm0
   1b0c4:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
   1b0c9:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
   1b0ce:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1b0d2:	0f 28 44 24 50       	movaps 0x50(%rsp),%xmm0
   1b0d7:	0f 11 03             	movups %xmm0,(%rbx)
   1b0da:	e9 05 fe ff ff       	jmp    1aee4 <<hyperinterval::float::F64Enclosure>::checked_pow+0xa4>
   1b0df:	cc                   	int3

<hyperinterval::float::F64Enclosure>::corner_image:
   1b0e0:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b0e4:	75 7e                	jne    1b164 <<hyperinterval::float::F64Enclosure>::corner_image+0x84>
   1b0e6:	f6 02 01             	testb  $0x1,(%rdx)
   1b0e9:	74 79                	je     1b164 <<hyperinterval::float::F64Enclosure>::corner_image+0x84>
   1b0eb:	55                   	push   %rbp
   1b0ec:	41 57                	push   %r15
   1b0ee:	41 56                	push   %r14
   1b0f0:	41 55                	push   %r13
   1b0f2:	41 54                	push   %r12
   1b0f4:	53                   	push   %rbx
   1b0f5:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
   1b0fc:	41 89 cc             	mov    %ecx,%r12d
   1b0ff:	48 89 7c 24 78       	mov    %rdi,0x78(%rsp)
   1b104:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
   1b10b:	00 00 80 
   1b10e:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1b115:	00 f0 7f 
   1b118:	4c 8b 6e 08          	mov    0x8(%rsi),%r13
   1b11c:	48 8b 46 10          	mov    0x10(%rsi),%rax
   1b120:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1b125:	48 8b 6a 08          	mov    0x8(%rdx),%rbp
   1b129:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1b12d:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1b132:	45 84 e4             	test   %r12b,%r12b
   1b135:	74 35                	je     1b16c <<hyperinterval::float::F64Enclosure>::corner_image+0x8c>
   1b137:	48 89 e7             	mov    %rsp,%rdi
   1b13a:	4c 89 fe             	mov    %r15,%rsi
   1b13d:	4c 89 f2             	mov    %r14,%rdx
   1b140:	4c 89 e9             	mov    %r13,%rcx
   1b143:	49 89 e8             	mov    %rbp,%r8
   1b146:	e8 85 ec ff ff       	call   19dd0 <<hyperinterval::ieee::Format>::div>
   1b14b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b14f:	0f 85 fa 00 00 00    	jne    1b24f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b155:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b15a:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
   1b15f:	e9 b6 00 00 00       	jmp    1b21a <<hyperinterval::float::F64Enclosure>::corner_image+0x13a>
   1b164:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
   1b16b:	c3                   	ret
   1b16c:	4c 89 e8             	mov    %r13,%rax
   1b16f:	48 c1 e8 34          	shr    $0x34,%rax
   1b173:	25 ff 07 00 00       	and    $0x7ff,%eax
   1b178:	48 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%rdx
   1b17f:	ff 0f 00 
   1b182:	4c 89 ee             	mov    %r13,%rsi
   1b185:	48 21 d6             	and    %rdx,%rsi
   1b188:	8d 88 cd fb ff ff    	lea    -0x433(%rax),%ecx
   1b18e:	48 85 c0             	test   %rax,%rax
   1b191:	b8 ce fb ff ff       	mov    $0xfffffbce,%eax
   1b196:	0f 44 c8             	cmove  %eax,%ecx
   1b199:	48 8d 7c 16 01       	lea    0x1(%rsi,%rdx,1),%rdi
   1b19e:	48 0f 44 fe          	cmove  %rsi,%rdi
   1b1a2:	48 89 ee             	mov    %rbp,%rsi
   1b1a5:	48 c1 ee 34          	shr    $0x34,%rsi
   1b1a9:	81 e6 ff 07 00 00    	and    $0x7ff,%esi
   1b1af:	49 89 e8             	mov    %rbp,%r8
   1b1b2:	49 21 d0             	and    %rdx,%r8
   1b1b5:	44 8d 8e cd fb ff ff 	lea    -0x433(%rsi),%r9d
   1b1bc:	48 85 f6             	test   %rsi,%rsi
   1b1bf:	44 0f 44 c8          	cmove  %eax,%r9d
   1b1c3:	49 8d 44 10 01       	lea    0x1(%r8,%rdx,1),%rax
   1b1c8:	49 0f 44 c0          	cmove  %r8,%rax
   1b1cc:	48 89 ee             	mov    %rbp,%rsi
   1b1cf:	4c 31 ee             	xor    %r13,%rsi
   1b1d2:	48 f7 e7             	mul    %rdi
   1b1d5:	41 01 c9             	add    %ecx,%r9d
   1b1d8:	48 c1 ee 3f          	shr    $0x3f,%rsi
   1b1dc:	40 88 74 24 14       	mov    %sil,0x14(%rsp)
   1b1e1:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b1e6:	48 89 04 24          	mov    %rax,(%rsp)
   1b1ea:	44 89 4c 24 10       	mov    %r9d,0x10(%rsp)
   1b1ef:	48 8d 7c 24 48       	lea    0x48(%rsp),%rdi
   1b1f4:	48 89 e1             	mov    %rsp,%rcx
   1b1f7:	4c 89 fe             	mov    %r15,%rsi
   1b1fa:	4c 89 f2             	mov    %r14,%rdx
   1b1fd:	e8 2e f8 ff ff       	call   1aa30 <<hyperinterval::ieee::Format>::rounded>
   1b202:	80 7c 24 48 00       	cmpb   $0x0,0x48(%rsp)
   1b207:	74 07                	je     1b210 <<hyperinterval::float::F64Enclosure>::corner_image+0x130>
   1b209:	0f b6 7c 24 49       	movzbl 0x49(%rsp),%edi
   1b20e:	eb 44                	jmp    1b254 <<hyperinterval::float::F64Enclosure>::corner_image+0x174>
   1b210:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
   1b215:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
   1b21a:	48 89 e7             	mov    %rsp,%rdi
   1b21d:	4c 89 fe             	mov    %r15,%rsi
   1b220:	4c 89 f2             	mov    %r14,%rdx
   1b223:	e8 b8 cc ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1b228:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b22c:	75 21                	jne    1b24f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b22e:	48 89 6c 24 70       	mov    %rbp,0x70(%rsp)
   1b233:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1b238:	48 89 e7             	mov    %rsp,%rdi
   1b23b:	4c 89 fe             	mov    %r15,%rsi
   1b23e:	4c 89 f2             	mov    %r14,%rdx
   1b241:	48 89 d9             	mov    %rbx,%rcx
   1b244:	e8 97 cc ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1b249:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b24d:	74 27                	je     1b276 <<hyperinterval::float::F64Enclosure>::corner_image+0x196>
   1b24f:	0f b6 7c 24 01       	movzbl 0x1(%rsp),%edi
   1b254:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
   1b259:	40 88 78 08          	mov    %dil,0x8(%rax)
   1b25d:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1b264:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
   1b26b:	5b                   	pop    %rbx
   1b26c:	41 5c                	pop    %r12
   1b26e:	41 5d                	pop    %r13
   1b270:	41 5e                	pop    %r14
   1b272:	41 5f                	pop    %r15
   1b274:	5d                   	pop    %rbp
   1b275:	c3                   	ret
   1b276:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
   1b27b:	49 8d 04 2f          	lea    (%r15,%rbp,1),%rax
   1b27f:	49 8d 57 ff          	lea    -0x1(%r15),%rdx
   1b283:	48 89 e9             	mov    %rbp,%rcx
   1b286:	48 21 d1             	and    %rdx,%rcx
   1b289:	4d 89 f9             	mov    %r15,%r9
   1b28c:	49 29 c9             	sub    %rcx,%r9
   1b28f:	48 85 ed             	test   %rbp,%rbp
   1b292:	4c 0f 49 c8          	cmovns %rax,%r9
   1b296:	4b 8d 04 38          	lea    (%r8,%r15,1),%rax
   1b29a:	4c 89 c1             	mov    %r8,%rcx
   1b29d:	48 21 d1             	and    %rdx,%rcx
   1b2a0:	4c 89 fb             	mov    %r15,%rbx
   1b2a3:	48 29 cb             	sub    %rcx,%rbx
   1b2a6:	4d 85 c0             	test   %r8,%r8
   1b2a9:	48 0f 49 d8          	cmovns %rax,%rbx
   1b2ad:	40 b7 01             	mov    $0x1,%dil
   1b2b0:	49 39 d9             	cmp    %rbx,%r9
   1b2b3:	77 9f                	ja     1b254 <<hyperinterval::float::F64Enclosure>::corner_image+0x174>
   1b2b5:	4d 89 fe             	mov    %r15,%r14
   1b2b8:	4d 89 cf             	mov    %r9,%r15
   1b2bb:	48 89 6c 24 38       	mov    %rbp,0x38(%rsp)
   1b2c0:	4c 89 44 24 40       	mov    %r8,0x40(%rsp)
   1b2c5:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
   1b2ca:	45 84 e4             	test   %r12b,%r12b
   1b2cd:	0f 84 ca 02 00 00    	je     1b59d <<hyperinterval::float::F64Enclosure>::corner_image+0x4bd>
   1b2d3:	48 89 e7             	mov    %rsp,%rdi
   1b2d6:	4c 89 f6             	mov    %r14,%rsi
   1b2d9:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1b2e0:	00 f0 7f 
   1b2e3:	4c 89 e2             	mov    %r12,%rdx
   1b2e6:	4c 89 e9             	mov    %r13,%rcx
   1b2e9:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
   1b2ee:	e8 dd ea ff ff       	call   19dd0 <<hyperinterval::ieee::Format>::div>
   1b2f3:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b2f7:	0f 85 52 ff ff ff    	jne    1b24f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b2fd:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b302:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   1b307:	48 89 e7             	mov    %rsp,%rdi
   1b30a:	4c 89 f6             	mov    %r14,%rsi
   1b30d:	4c 89 e2             	mov    %r12,%rdx
   1b310:	e8 cb cb ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1b315:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b319:	0f 85 30 ff ff ff    	jne    1b24f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b31f:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1b324:	48 89 e7             	mov    %rsp,%rdi
   1b327:	4c 89 f6             	mov    %r14,%rsi
   1b32a:	4c 89 e2             	mov    %r12,%rdx
   1b32d:	4c 89 e9             	mov    %r13,%rcx
   1b330:	e8 ab cb ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1b335:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b339:	0f 85 10 ff ff ff    	jne    1b24f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b33f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b344:	49 8d 14 2e          	lea    (%r14,%rbp,1),%rdx
   1b348:	48 89 ee             	mov    %rbp,%rsi
   1b34b:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1b350:	4c 21 c6             	and    %r8,%rsi
   1b353:	4c 89 f1             	mov    %r14,%rcx
   1b356:	48 29 f1             	sub    %rsi,%rcx
   1b359:	48 85 ed             	test   %rbp,%rbp
   1b35c:	48 0f 49 ca          	cmovns %rdx,%rcx
   1b360:	4a 8d 34 30          	lea    (%rax,%r14,1),%rsi
   1b364:	48 89 c7             	mov    %rax,%rdi
   1b367:	4c 21 c7             	and    %r8,%rdi
   1b36a:	4c 89 f2             	mov    %r14,%rdx
   1b36d:	48 29 fa             	sub    %rdi,%rdx
   1b370:	48 85 c0             	test   %rax,%rax
   1b373:	48 0f 49 d6          	cmovns %rsi,%rdx
   1b377:	48 39 d1             	cmp    %rdx,%rcx
   1b37a:	0f 87 54 03 00 00    	ja     1b6d4 <<hyperinterval::float::F64Enclosure>::corner_image+0x5f4>
   1b380:	49 39 cf             	cmp    %rcx,%r15
   1b383:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   1b388:	48 0f 47 cd          	cmova  %rbp,%rcx
   1b38c:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
   1b391:	48 39 d3             	cmp    %rdx,%rbx
   1b394:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1b399:	48 0f 42 c8          	cmovb  %rax,%rcx
   1b39d:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
   1b3a2:	48 89 e7             	mov    %rsp,%rdi
   1b3a5:	4c 89 f6             	mov    %r14,%rsi
   1b3a8:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   1b3af:	00 f0 7f 
   1b3b2:	4c 89 ea             	mov    %r13,%rdx
   1b3b5:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   1b3ba:	4c 8b 44 24 70       	mov    0x70(%rsp),%r8
   1b3bf:	e8 0c ea ff ff       	call   19dd0 <<hyperinterval::ieee::Format>::div>
   1b3c4:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b3c8:	0f 85 81 fe ff ff    	jne    1b24f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b3ce:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b3d3:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1b3d8:	48 89 e7             	mov    %rsp,%rdi
   1b3db:	4c 89 f6             	mov    %r14,%rsi
   1b3de:	4c 89 ea             	mov    %r13,%rdx
   1b3e1:	e8 fa ca ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1b3e6:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b3ea:	0f 85 5f fe ff ff    	jne    1b24f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b3f0:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
   1b3f5:	48 89 e7             	mov    %rsp,%rdi
   1b3f8:	4c 89 f6             	mov    %r14,%rsi
   1b3fb:	4c 89 ea             	mov    %r13,%rdx
   1b3fe:	4c 89 e1             	mov    %r12,%rcx
   1b401:	e8 da ca ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1b406:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b40a:	0f 85 3f fe ff ff    	jne    1b24f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b410:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1b415:	4a 8d 04 33          	lea    (%rbx,%r14,1),%rax
   1b419:	48 89 da             	mov    %rbx,%rdx
   1b41c:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1b421:	4c 21 c2             	and    %r8,%rdx
   1b424:	4c 89 f1             	mov    %r14,%rcx
   1b427:	48 29 d1             	sub    %rdx,%rcx
   1b42a:	48 85 db             	test   %rbx,%rbx
   1b42d:	48 0f 49 c8          	cmovns %rax,%rcx
   1b431:	4b 8d 14 2e          	lea    (%r14,%r13,1),%rdx
   1b435:	4c 89 ee             	mov    %r13,%rsi
   1b438:	4c 21 c6             	and    %r8,%rsi
   1b43b:	4c 89 f0             	mov    %r14,%rax
   1b43e:	48 29 f0             	sub    %rsi,%rax
   1b441:	4d 85 ed             	test   %r13,%r13
   1b444:	48 0f 49 c2          	cmovns %rdx,%rax
   1b448:	48 39 c1             	cmp    %rax,%rcx
   1b44b:	0f 87 83 02 00 00    	ja     1b6d4 <<hyperinterval::float::F64Enclosure>::corner_image+0x5f4>
   1b451:	4c 8b 4c 24 38       	mov    0x38(%rsp),%r9
   1b456:	4b 8d 14 31          	lea    (%r9,%r14,1),%rdx
   1b45a:	4c 89 ce             	mov    %r9,%rsi
   1b45d:	4c 21 c6             	and    %r8,%rsi
   1b460:	4c 89 f7             	mov    %r14,%rdi
   1b463:	48 29 f7             	sub    %rsi,%rdi
   1b466:	4d 85 c9             	test   %r9,%r9
   1b469:	48 0f 49 fa          	cmovns %rdx,%rdi
   1b46d:	48 39 cf             	cmp    %rcx,%rdi
   1b470:	49 0f 46 d9          	cmovbe %r9,%rbx
   1b474:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
   1b479:	4a 8d 0c 37          	lea    (%rdi,%r14,1),%rcx
   1b47d:	48 89 fa             	mov    %rdi,%rdx
   1b480:	4c 21 c2             	and    %r8,%rdx
   1b483:	4c 89 f6             	mov    %r14,%rsi
   1b486:	48 29 d6             	sub    %rdx,%rsi
   1b489:	48 85 ff             	test   %rdi,%rdi
   1b48c:	48 0f 49 f1          	cmovns %rcx,%rsi
   1b490:	48 39 c6             	cmp    %rax,%rsi
   1b493:	4c 0f 43 ef          	cmovae %rdi,%r13
   1b497:	48 89 e7             	mov    %rsp,%rdi
   1b49a:	4c 89 f6             	mov    %r14,%rsi
   1b49d:	48 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%rbp
   1b4a4:	00 f0 7f 
   1b4a7:	48 89 ea             	mov    %rbp,%rdx
   1b4aa:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   1b4af:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
   1b4b4:	e8 17 e9 ff ff       	call   19dd0 <<hyperinterval::ieee::Format>::div>
   1b4b9:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b4bd:	0f 85 8c fd ff ff    	jne    1b24f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b4c3:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b4c8:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1b4cd:	48 89 e7             	mov    %rsp,%rdi
   1b4d0:	4c 89 f6             	mov    %r14,%rsi
   1b4d3:	48 89 ea             	mov    %rbp,%rdx
   1b4d6:	e8 05 ca ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1b4db:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b4df:	0f 85 6a fd ff ff    	jne    1b24f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b4e5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b4ea:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1b4ef:	48 89 e7             	mov    %rsp,%rdi
   1b4f2:	4c 89 f6             	mov    %r14,%rsi
   1b4f5:	48 89 ea             	mov    %rbp,%rdx
   1b4f8:	4c 89 e1             	mov    %r12,%rcx
   1b4fb:	e8 e0 c9 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1b500:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b504:	0f 85 45 fd ff ff    	jne    1b24f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b50a:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b50f:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1b514:	4a 8d 0c 37          	lea    (%rdi,%r14,1),%rcx
   1b518:	48 89 fe             	mov    %rdi,%rsi
   1b51b:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1b520:	4c 21 c6             	and    %r8,%rsi
   1b523:	4c 89 f2             	mov    %r14,%rdx
   1b526:	48 29 f2             	sub    %rsi,%rdx
   1b529:	48 85 ff             	test   %rdi,%rdi
   1b52c:	48 0f 49 d1          	cmovns %rcx,%rdx
   1b530:	4a 8d 34 30          	lea    (%rax,%r14,1),%rsi
   1b534:	48 89 c7             	mov    %rax,%rdi
   1b537:	4c 21 c7             	and    %r8,%rdi
   1b53a:	4d 89 f1             	mov    %r14,%r9
   1b53d:	49 29 fe             	sub    %rdi,%r14
   1b540:	48 85 c0             	test   %rax,%rax
   1b543:	4c 0f 49 f6          	cmovns %rsi,%r14
   1b547:	4c 39 f2             	cmp    %r14,%rdx
   1b54a:	40 b7 01             	mov    $0x1,%dil
   1b54d:	0f 87 01 fd ff ff    	ja     1b254 <<hyperinterval::float::F64Enclosure>::corner_image+0x174>
   1b553:	4a 8d 34 0b          	lea    (%rbx,%r9,1),%rsi
   1b557:	48 89 df             	mov    %rbx,%rdi
   1b55a:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
   1b55f:	4c 21 ff             	and    %r15,%rdi
   1b562:	4d 89 c8             	mov    %r9,%r8
   1b565:	49 29 f8             	sub    %rdi,%r8
   1b568:	48 85 db             	test   %rbx,%rbx
   1b56b:	4c 0f 49 c6          	cmovns %rsi,%r8
   1b56f:	49 39 d0             	cmp    %rdx,%r8
   1b572:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   1b577:	48 0f 46 d3          	cmovbe %rbx,%rdx
   1b57b:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1b580:	4b 8d 14 29          	lea    (%r9,%r13,1),%rdx
   1b584:	4d 21 ef             	and    %r13,%r15
   1b587:	4d 29 f9             	sub    %r15,%r9
   1b58a:	4d 85 ed             	test   %r13,%r13
   1b58d:	4c 0f 49 ca          	cmovns %rdx,%r9
   1b591:	4d 39 f1             	cmp    %r14,%r9
   1b594:	49 0f 43 c5          	cmovae %r13,%rax
   1b598:	e9 07 04 00 00       	jmp    1b9a4 <<hyperinterval::float::F64Enclosure>::corner_image+0x8c4>
   1b59d:	49 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%r10
   1b5a4:	ff 0f 00 
   1b5a7:	4c 89 e8             	mov    %r13,%rax
   1b5aa:	48 c1 e8 34          	shr    $0x34,%rax
   1b5ae:	25 ff 07 00 00       	and    $0x7ff,%eax
   1b5b3:	4c 89 ea             	mov    %r13,%rdx
   1b5b6:	4c 21 d2             	and    %r10,%rdx
   1b5b9:	8d 88 cd fb ff ff    	lea    -0x433(%rax),%ecx
   1b5bf:	48 85 c0             	test   %rax,%rax
   1b5c2:	4e 8d 44 12 01       	lea    0x1(%rdx,%r10,1),%r8
   1b5c7:	b8 ce fb ff ff       	mov    $0xfffffbce,%eax
   1b5cc:	0f 44 c8             	cmove  %eax,%ecx
   1b5cf:	4c 0f 44 c2          	cmove  %rdx,%r8
   1b5d3:	4c 8b 4c 24 28       	mov    0x28(%rsp),%r9
   1b5d8:	4c 89 ca             	mov    %r9,%rdx
   1b5db:	48 c1 ea 34          	shr    $0x34,%rdx
   1b5df:	81 e2 ff 07 00 00    	and    $0x7ff,%edx
   1b5e5:	4c 89 cf             	mov    %r9,%rdi
   1b5e8:	4c 21 d7             	and    %r10,%rdi
   1b5eb:	8d aa cd fb ff ff    	lea    -0x433(%rdx),%ebp
   1b5f1:	48 85 d2             	test   %rdx,%rdx
   1b5f4:	4e 8d 64 17 01       	lea    0x1(%rdi,%r10,1),%r12
   1b5f9:	0f 44 e8             	cmove  %eax,%ebp
   1b5fc:	4c 0f 44 e7          	cmove  %rdi,%r12
   1b600:	4d 31 cd             	xor    %r9,%r13
   1b603:	4c 89 e0             	mov    %r12,%rax
   1b606:	49 f7 e0             	mul    %r8
   1b609:	01 e9                	add    %ebp,%ecx
   1b60b:	49 c1 ed 3f          	shr    $0x3f,%r13
   1b60f:	44 88 6c 24 14       	mov    %r13b,0x14(%rsp)
   1b614:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b619:	48 89 04 24          	mov    %rax,(%rsp)
   1b61d:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1b621:	48 8d 7c 24 48       	lea    0x48(%rsp),%rdi
   1b626:	48 89 e1             	mov    %rsp,%rcx
   1b629:	4c 89 f6             	mov    %r14,%rsi
   1b62c:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   1b633:	00 f0 7f 
   1b636:	4c 89 ea             	mov    %r13,%rdx
   1b639:	e8 f2 f3 ff ff       	call   1aa30 <<hyperinterval::ieee::Format>::rounded>
   1b63e:	80 7c 24 48 00       	cmpb   $0x0,0x48(%rsp)
   1b643:	0f 85 c0 fb ff ff    	jne    1b209 <<hyperinterval::float::F64Enclosure>::corner_image+0x129>
   1b649:	4c 89 a4 24 80 00 00 	mov    %r12,0x80(%rsp)
   1b650:	00 
   1b651:	89 6c 24 6c          	mov    %ebp,0x6c(%rsp)
   1b655:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
   1b65a:	4c 8b 64 24 58       	mov    0x58(%rsp),%r12
   1b65f:	48 89 e7             	mov    %rsp,%rdi
   1b662:	4c 89 f6             	mov    %r14,%rsi
   1b665:	4c 89 ea             	mov    %r13,%rdx
   1b668:	e8 73 c8 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1b66d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b671:	0f 84 d8 fb ff ff    	je     1b24f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b677:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1b67c:	48 89 e7             	mov    %rsp,%rdi
   1b67f:	4c 89 f6             	mov    %r14,%rsi
   1b682:	4c 89 ea             	mov    %r13,%rdx
   1b685:	4c 89 e1             	mov    %r12,%rcx
   1b688:	e8 53 c8 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1b68d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b691:	0f 84 b8 fb ff ff    	je     1b24f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b697:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b69c:	49 8d 14 2e          	lea    (%r14,%rbp,1),%rdx
   1b6a0:	48 89 ee             	mov    %rbp,%rsi
   1b6a3:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1b6a8:	4c 21 c6             	and    %r8,%rsi
   1b6ab:	4c 89 f1             	mov    %r14,%rcx
   1b6ae:	48 29 f1             	sub    %rsi,%rcx
   1b6b1:	48 85 ed             	test   %rbp,%rbp
   1b6b4:	48 0f 49 ca          	cmovns %rdx,%rcx
   1b6b8:	4a 8d 34 30          	lea    (%rax,%r14,1),%rsi
   1b6bc:	48 89 c7             	mov    %rax,%rdi
   1b6bf:	4c 21 c7             	and    %r8,%rdi
   1b6c2:	4c 89 f2             	mov    %r14,%rdx
   1b6c5:	48 29 fa             	sub    %rdi,%rdx
   1b6c8:	48 85 c0             	test   %rax,%rax
   1b6cb:	48 0f 49 d6          	cmovns %rsi,%rdx
   1b6cf:	48 39 d1             	cmp    %rdx,%rcx
   1b6d2:	76 08                	jbe    1b6dc <<hyperinterval::float::F64Enclosure>::corner_image+0x5fc>
   1b6d4:	40 b7 01             	mov    $0x1,%dil
   1b6d7:	e9 78 fb ff ff       	jmp    1b254 <<hyperinterval::float::F64Enclosure>::corner_image+0x174>
   1b6dc:	49 39 cf             	cmp    %rcx,%r15
   1b6df:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   1b6e4:	48 0f 47 cd          	cmova  %rbp,%rcx
   1b6e8:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
   1b6ed:	48 39 d3             	cmp    %rdx,%rbx
   1b6f0:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1b6f5:	48 0f 42 c8          	cmovb  %rax,%rcx
   1b6f9:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
   1b6fe:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   1b703:	4c 89 c0             	mov    %r8,%rax
   1b706:	48 c1 e8 34          	shr    $0x34,%rax
   1b70a:	25 ff 07 00 00       	and    $0x7ff,%eax
   1b70f:	4c 89 c1             	mov    %r8,%rcx
   1b712:	49 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%r10
   1b719:	ff 0f 00 
   1b71c:	4c 21 d1             	and    %r10,%rcx
   1b71f:	8d 98 cd fb ff ff    	lea    -0x433(%rax),%ebx
   1b725:	48 85 c0             	test   %rax,%rax
   1b728:	4e 8d 6c 11 01       	lea    0x1(%rcx,%r10,1),%r13
   1b72d:	ba ce fb ff ff       	mov    $0xfffffbce,%edx
   1b732:	0f 44 da             	cmove  %edx,%ebx
   1b735:	4c 0f 44 e9          	cmove  %rcx,%r13
   1b739:	4c 8b 4c 24 70       	mov    0x70(%rsp),%r9
   1b73e:	4c 89 c8             	mov    %r9,%rax
   1b741:	48 c1 e8 34          	shr    $0x34,%rax
   1b745:	25 ff 07 00 00       	and    $0x7ff,%eax
   1b74a:	4c 89 c9             	mov    %r9,%rcx
   1b74d:	4c 21 d1             	and    %r10,%rcx
   1b750:	8d b8 cd fb ff ff    	lea    -0x433(%rax),%edi
   1b756:	48 85 c0             	test   %rax,%rax
   1b759:	4a 8d 44 11 01       	lea    0x1(%rcx,%r10,1),%rax
   1b75e:	0f 44 fa             	cmove  %edx,%edi
   1b761:	48 0f 44 c1          	cmove  %rcx,%rax
   1b765:	4d 31 c1             	xor    %r8,%r9
   1b768:	49 f7 e5             	mul    %r13
   1b76b:	01 df                	add    %ebx,%edi
   1b76d:	49 c1 e9 3f          	shr    $0x3f,%r9
   1b771:	44 88 4c 24 14       	mov    %r9b,0x14(%rsp)
   1b776:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b77b:	48 89 04 24          	mov    %rax,(%rsp)
   1b77f:	89 7c 24 10          	mov    %edi,0x10(%rsp)
   1b783:	48 8d 7c 24 48       	lea    0x48(%rsp),%rdi
   1b788:	48 89 e1             	mov    %rsp,%rcx
   1b78b:	4c 89 f6             	mov    %r14,%rsi
   1b78e:	48 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%rbp
   1b795:	00 f0 7f 
   1b798:	48 89 ea             	mov    %rbp,%rdx
   1b79b:	e8 90 f2 ff ff       	call   1aa30 <<hyperinterval::ieee::Format>::rounded>
   1b7a0:	80 7c 24 48 00       	cmpb   $0x0,0x48(%rsp)
   1b7a5:	0f 85 5e fa ff ff    	jne    1b209 <<hyperinterval::float::F64Enclosure>::corner_image+0x129>
   1b7ab:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
   1b7b0:	4c 8b 64 24 58       	mov    0x58(%rsp),%r12
   1b7b5:	48 89 e7             	mov    %rsp,%rdi
   1b7b8:	4c 89 f6             	mov    %r14,%rsi
   1b7bb:	48 89 ea             	mov    %rbp,%rdx
   1b7be:	e8 1d c7 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1b7c3:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b7c7:	0f 85 82 fa ff ff    	jne    1b24f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b7cd:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1b7d2:	48 89 e7             	mov    %rsp,%rdi
   1b7d5:	4c 89 f6             	mov    %r14,%rsi
   1b7d8:	48 89 ea             	mov    %rbp,%rdx
   1b7db:	4c 89 e1             	mov    %r12,%rcx
   1b7de:	e8 fd c6 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1b7e3:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b7e7:	0f 85 62 fa ff ff    	jne    1b24f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b7ed:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1b7f2:	4b 8d 04 37          	lea    (%r15,%r14,1),%rax
   1b7f6:	4c 89 fa             	mov    %r15,%rdx
   1b7f9:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1b7fe:	4c 21 c2             	and    %r8,%rdx
   1b801:	4c 89 f1             	mov    %r14,%rcx
   1b804:	48 29 d1             	sub    %rdx,%rcx
   1b807:	4d 85 ff             	test   %r15,%r15
   1b80a:	48 0f 49 c8          	cmovns %rax,%rcx
   1b80e:	4b 8d 14 34          	lea    (%r12,%r14,1),%rdx
   1b812:	4c 89 e6             	mov    %r12,%rsi
   1b815:	4c 21 c6             	and    %r8,%rsi
   1b818:	4c 89 f0             	mov    %r14,%rax
   1b81b:	48 29 f0             	sub    %rsi,%rax
   1b81e:	4d 85 e4             	test   %r12,%r12
   1b821:	48 0f 49 c2          	cmovns %rdx,%rax
   1b825:	48 39 c1             	cmp    %rax,%rcx
   1b828:	0f 87 a6 fe ff ff    	ja     1b6d4 <<hyperinterval::float::F64Enclosure>::corner_image+0x5f4>
   1b82e:	4c 8b 4c 24 38       	mov    0x38(%rsp),%r9
   1b833:	4c 89 ca             	mov    %r9,%rdx
   1b836:	4c 21 c2             	and    %r8,%rdx
   1b839:	4c 89 f7             	mov    %r14,%rdi
   1b83c:	48 29 d7             	sub    %rdx,%rdi
   1b83f:	4b 8d 14 31          	lea    (%r9,%r14,1),%rdx
   1b843:	4d 85 c9             	test   %r9,%r9
   1b846:	48 0f 49 fa          	cmovns %rdx,%rdi
   1b84a:	48 39 cf             	cmp    %rcx,%rdi
   1b84d:	4d 0f 46 f9          	cmovbe %r9,%r15
   1b851:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
   1b856:	48 89 f9             	mov    %rdi,%rcx
   1b859:	4c 21 c1             	and    %r8,%rcx
   1b85c:	4c 89 f2             	mov    %r14,%rdx
   1b85f:	48 29 ca             	sub    %rcx,%rdx
   1b862:	4a 8d 0c 37          	lea    (%rdi,%r14,1),%rcx
   1b866:	48 85 ff             	test   %rdi,%rdi
   1b869:	48 0f 49 d1          	cmovns %rcx,%rdx
   1b86d:	48 39 c2             	cmp    %rax,%rdx
   1b870:	4c 0f 43 e7          	cmovae %rdi,%r12
   1b874:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   1b879:	48 33 44 24 60       	xor    0x60(%rsp),%rax
   1b87e:	8b 4c 24 6c          	mov    0x6c(%rsp),%ecx
   1b882:	01 d9                	add    %ebx,%ecx
   1b884:	48 c1 e8 3f          	shr    $0x3f,%rax
   1b888:	88 44 24 14          	mov    %al,0x14(%rsp)
   1b88c:	48 8b 84 24 80 00 00 	mov    0x80(%rsp),%rax
   1b893:	00 
   1b894:	49 f7 e5             	mul    %r13
   1b897:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b89c:	48 89 04 24          	mov    %rax,(%rsp)
   1b8a0:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1b8a4:	48 8d 7c 24 48       	lea    0x48(%rsp),%rdi
   1b8a9:	48 89 e1             	mov    %rsp,%rcx
   1b8ac:	4c 89 f6             	mov    %r14,%rsi
   1b8af:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   1b8b6:	00 f0 7f 
   1b8b9:	4c 89 ea             	mov    %r13,%rdx
   1b8bc:	e8 6f f1 ff ff       	call   1aa30 <<hyperinterval::ieee::Format>::rounded>
   1b8c1:	80 7c 24 48 00       	cmpb   $0x0,0x48(%rsp)
   1b8c6:	0f 85 3d f9 ff ff    	jne    1b209 <<hyperinterval::float::F64Enclosure>::corner_image+0x129>
   1b8cc:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
   1b8d1:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
   1b8d6:	48 89 e7             	mov    %rsp,%rdi
   1b8d9:	4c 89 f6             	mov    %r14,%rsi
   1b8dc:	4c 89 ea             	mov    %r13,%rdx
   1b8df:	e8 fc c5 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1b8e4:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b8e8:	0f 85 61 f9 ff ff    	jne    1b24f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b8ee:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b8f3:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1b8f8:	48 89 e7             	mov    %rsp,%rdi
   1b8fb:	4c 89 f6             	mov    %r14,%rsi
   1b8fe:	4c 89 ea             	mov    %r13,%rdx
   1b901:	48 89 d9             	mov    %rbx,%rcx
   1b904:	e8 d7 c5 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1b909:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b90d:	0f 85 3c f9 ff ff    	jne    1b24f <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b913:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b918:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1b91d:	4a 8d 0c 37          	lea    (%rdi,%r14,1),%rcx
   1b921:	48 89 fe             	mov    %rdi,%rsi
   1b924:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1b929:	4c 21 c6             	and    %r8,%rsi
   1b92c:	4c 89 f2             	mov    %r14,%rdx
   1b92f:	48 29 f2             	sub    %rsi,%rdx
   1b932:	48 85 ff             	test   %rdi,%rdi
   1b935:	48 0f 49 d1          	cmovns %rcx,%rdx
   1b939:	4a 8d 34 30          	lea    (%rax,%r14,1),%rsi
   1b93d:	48 89 c7             	mov    %rax,%rdi
   1b940:	4c 21 c7             	and    %r8,%rdi
   1b943:	4d 89 f1             	mov    %r14,%r9
   1b946:	49 29 fe             	sub    %rdi,%r14
   1b949:	48 85 c0             	test   %rax,%rax
   1b94c:	4c 0f 49 f6          	cmovns %rsi,%r14
   1b950:	4c 39 f2             	cmp    %r14,%rdx
   1b953:	40 b7 01             	mov    $0x1,%dil
   1b956:	0f 87 f8 f8 ff ff    	ja     1b254 <<hyperinterval::float::F64Enclosure>::corner_image+0x174>
   1b95c:	4d 89 fa             	mov    %r15,%r10
   1b95f:	4b 8d 34 0f          	lea    (%r15,%r9,1),%rsi
   1b963:	4c 89 ff             	mov    %r15,%rdi
   1b966:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
   1b96b:	4c 21 ff             	and    %r15,%rdi
   1b96e:	4d 89 c8             	mov    %r9,%r8
   1b971:	49 29 f8             	sub    %rdi,%r8
   1b974:	4d 85 d2             	test   %r10,%r10
   1b977:	4c 0f 49 c6          	cmovns %rsi,%r8
   1b97b:	49 39 d0             	cmp    %rdx,%r8
   1b97e:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   1b983:	49 0f 46 d2          	cmovbe %r10,%rdx
   1b987:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1b98c:	4b 8d 14 0c          	lea    (%r12,%r9,1),%rdx
   1b990:	4d 21 e7             	and    %r12,%r15
   1b993:	4d 29 f9             	sub    %r15,%r9
   1b996:	4d 85 e4             	test   %r12,%r12
   1b999:	4c 0f 49 ca          	cmovns %rdx,%r9
   1b99d:	4d 39 f1             	cmp    %r14,%r9
   1b9a0:	49 0f 43 c4          	cmovae %r12,%rax
   1b9a4:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
   1b9a9:	48 c7 01 01 00 00 00 	movq   $0x1,(%rcx)
   1b9b0:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   1b9b5:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   1b9b9:	48 89 41 10          	mov    %rax,0x10(%rcx)
   1b9bd:	e9 a2 f8 ff ff       	jmp    1b264 <<hyperinterval::float::F64Enclosure>::corner_image+0x184>
   1b9c2:	cc                   	int3
   1b9c3:	cc                   	int3
   1b9c4:	cc                   	int3
   1b9c5:	cc                   	int3
   1b9c6:	cc                   	int3
   1b9c7:	cc                   	int3
   1b9c8:	cc                   	int3
   1b9c9:	cc                   	int3
   1b9ca:	cc                   	int3
   1b9cb:	cc                   	int3
   1b9cc:	cc                   	int3
   1b9cd:	cc                   	int3
   1b9ce:	cc                   	int3
   1b9cf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::intersection:
   1b9d0:	48 89 f8             	mov    %rdi,%rax
   1b9d3:	45 31 c0             	xor    %r8d,%r8d
   1b9d6:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b9da:	0f 85 d5 00 00 00    	jne    1bab5 <<hyperinterval::float::F64Enclosure>::intersection+0xe5>
   1b9e0:	f6 02 01             	testb  $0x1,(%rdx)
   1b9e3:	0f 84 c0 00 00 00    	je     1baa9 <<hyperinterval::float::F64Enclosure>::intersection+0xd9>
   1b9e9:	41 56                	push   %r14
   1b9eb:	53                   	push   %rbx
   1b9ec:	4c 8b 52 08          	mov    0x8(%rdx),%r10
   1b9f0:	4c 8b 4a 10          	mov    0x10(%rdx),%r9
   1b9f4:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1b9f8:	48 ba 00 00 00 00 00 	movabs $0x8000000000000000,%rdx
   1b9ff:	00 00 80 
   1ba02:	48 8d 3c 11          	lea    (%rcx,%rdx,1),%rdi
   1ba06:	4c 8d 42 ff          	lea    -0x1(%rdx),%r8
   1ba0a:	49 89 cb             	mov    %rcx,%r11
   1ba0d:	4d 21 c3             	and    %r8,%r11
   1ba10:	48 89 d3             	mov    %rdx,%rbx
   1ba13:	4c 29 db             	sub    %r11,%rbx
   1ba16:	48 85 c9             	test   %rcx,%rcx
   1ba19:	48 0f 49 df          	cmovns %rdi,%rbx
   1ba1d:	49 8d 3c 12          	lea    (%r10,%rdx,1),%rdi
   1ba21:	4d 89 d3             	mov    %r10,%r11
   1ba24:	4d 21 c3             	and    %r8,%r11
   1ba27:	49 89 d6             	mov    %rdx,%r14
   1ba2a:	4d 29 de             	sub    %r11,%r14
   1ba2d:	4d 85 d2             	test   %r10,%r10
   1ba30:	4c 0f 49 f7          	cmovns %rdi,%r14
   1ba34:	48 8b 7e 10          	mov    0x10(%rsi),%rdi
   1ba38:	4c 39 f3             	cmp    %r14,%rbx
   1ba3b:	49 0f 42 ca          	cmovb  %r10,%rcx
   1ba3f:	48 8d 34 17          	lea    (%rdi,%rdx,1),%rsi
   1ba43:	49 89 fa             	mov    %rdi,%r10
   1ba46:	4d 21 c2             	and    %r8,%r10
   1ba49:	49 89 d3             	mov    %rdx,%r11
   1ba4c:	4d 29 d3             	sub    %r10,%r11
   1ba4f:	48 85 ff             	test   %rdi,%rdi
   1ba52:	4c 0f 49 de          	cmovns %rsi,%r11
   1ba56:	49 8d 34 11          	lea    (%r9,%rdx,1),%rsi
   1ba5a:	4d 89 ca             	mov    %r9,%r10
   1ba5d:	4d 21 c2             	and    %r8,%r10
   1ba60:	48 89 d3             	mov    %rdx,%rbx
   1ba63:	4c 29 d3             	sub    %r10,%rbx
   1ba66:	4d 85 c9             	test   %r9,%r9
   1ba69:	48 0f 49 de          	cmovns %rsi,%rbx
   1ba6d:	49 39 db             	cmp    %rbx,%r11
   1ba70:	49 0f 47 f9          	cmova  %r9,%rdi
   1ba74:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
   1ba78:	49 89 c9             	mov    %rcx,%r9
   1ba7b:	4d 21 c1             	and    %r8,%r9
   1ba7e:	49 89 d2             	mov    %rdx,%r10
   1ba81:	4d 29 ca             	sub    %r9,%r10
   1ba84:	48 85 c9             	test   %rcx,%rcx
   1ba87:	4c 0f 49 d6          	cmovns %rsi,%r10
   1ba8b:	48 8d 34 17          	lea    (%rdi,%rdx,1),%rsi
   1ba8f:	49 21 f8             	and    %rdi,%r8
   1ba92:	4c 29 c2             	sub    %r8,%rdx
   1ba95:	48 85 ff             	test   %rdi,%rdi
   1ba98:	48 0f 49 d6          	cmovns %rsi,%rdx
   1ba9c:	45 31 c0             	xor    %r8d,%r8d
   1ba9f:	49 39 d2             	cmp    %rdx,%r10
   1baa2:	41 0f 96 c0          	setbe  %r8b
   1baa6:	5b                   	pop    %rbx
   1baa7:	41 5e                	pop    %r14
   1baa9:	4c 89 00             	mov    %r8,(%rax)
   1baac:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1bab0:	48 89 78 10          	mov    %rdi,0x10(%rax)
   1bab4:	c3                   	ret
   1bab5:	4c 89 00             	mov    %r8,(%rax)
   1bab8:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1babc:	48 89 78 10          	mov    %rdi,0x10(%rax)
   1bac0:	c3                   	ret
   1bac1:	cc                   	int3
   1bac2:	cc                   	int3
   1bac3:	cc                   	int3
   1bac4:	cc                   	int3
   1bac5:	cc                   	int3
   1bac6:	cc                   	int3
   1bac7:	cc                   	int3
   1bac8:	cc                   	int3
   1bac9:	cc                   	int3
   1baca:	cc                   	int3
   1bacb:	cc                   	int3
   1bacc:	cc                   	int3
   1bacd:	cc                   	int3
   1bace:	cc                   	int3
   1bacf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::contains_point:
   1bad0:	41 56                	push   %r14
   1bad2:	53                   	push   %rbx
   1bad3:	48 83 ec 18          	sub    $0x18,%rsp
   1bad7:	49 89 fe             	mov    %rdi,%r14
   1bada:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1bae1:	00 00 80 
   1bae4:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1bae9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1baee:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1baf5:	00 f0 7f 
   1baf8:	48 89 de             	mov    %rbx,%rsi
   1bafb:	e8 e0 c3 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1bb00:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1bb05:	3c 01                	cmp    $0x1,%al
   1bb07:	75 0d                	jne    1bb16 <<hyperinterval::float::F64Enclosure>::contains_point+0x46>
   1bb09:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   1bb0e:	48 83 c4 18          	add    $0x18,%rsp
   1bb12:	5b                   	pop    %rbx
   1bb13:	41 5e                	pop    %r14
   1bb15:	c3                   	ret
   1bb16:	49 83 3e 01          	cmpq   $0x1,(%r14)
   1bb1a:	75 40                	jne    1bb5c <<hyperinterval::float::F64Enclosure>::contains_point+0x8c>
   1bb1c:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1bb21:	49 8b 56 08          	mov    0x8(%r14),%rdx
   1bb25:	48 8d 3c 1a          	lea    (%rdx,%rbx,1),%rdi
   1bb29:	48 8d 4b ff          	lea    -0x1(%rbx),%rcx
   1bb2d:	49 89 d0             	mov    %rdx,%r8
   1bb30:	49 21 c8             	and    %rcx,%r8
   1bb33:	49 89 d9             	mov    %rbx,%r9
   1bb36:	4d 29 c1             	sub    %r8,%r9
   1bb39:	48 85 d2             	test   %rdx,%rdx
   1bb3c:	4c 0f 49 cf          	cmovns %rdi,%r9
   1bb40:	48 8d 3c 1e          	lea    (%rsi,%rbx,1),%rdi
   1bb44:	49 89 f0             	mov    %rsi,%r8
   1bb47:	49 21 c8             	and    %rcx,%r8
   1bb4a:	48 89 da             	mov    %rbx,%rdx
   1bb4d:	4c 29 c2             	sub    %r8,%rdx
   1bb50:	48 85 f6             	test   %rsi,%rsi
   1bb53:	48 0f 49 d7          	cmovns %rdi,%rdx
   1bb57:	49 39 d1             	cmp    %rdx,%r9
   1bb5a:	76 0a                	jbe    1bb66 <<hyperinterval::float::F64Enclosure>::contains_point+0x96>
   1bb5c:	31 d2                	xor    %edx,%edx
   1bb5e:	48 83 c4 18          	add    $0x18,%rsp
   1bb62:	5b                   	pop    %rbx
   1bb63:	41 5e                	pop    %r14
   1bb65:	c3                   	ret
   1bb66:	49 8b 76 10          	mov    0x10(%r14),%rsi
   1bb6a:	48 8d 3c 1e          	lea    (%rsi,%rbx,1),%rdi
   1bb6e:	48 21 f1             	and    %rsi,%rcx
   1bb71:	48 29 cb             	sub    %rcx,%rbx
   1bb74:	48 85 f6             	test   %rsi,%rsi
   1bb77:	48 0f 49 df          	cmovns %rdi,%rbx
   1bb7b:	48 39 da             	cmp    %rbx,%rdx
   1bb7e:	0f 96 c2             	setbe  %dl
   1bb81:	48 83 c4 18          	add    $0x18,%rsp
   1bb85:	5b                   	pop    %rbx
   1bb86:	41 5e                	pop    %r14
   1bb88:	c3                   	ret
   1bb89:	cc                   	int3
   1bb8a:	cc                   	int3
   1bb8b:	cc                   	int3
   1bb8c:	cc                   	int3
   1bb8d:	cc                   	int3
   1bb8e:	cc                   	int3
   1bb8f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::interior_subset_of:
   1bb90:	b0 01                	mov    $0x1,%al
   1bb92:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1bb96:	0f 85 8b 00 00 00    	jne    1bc27 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x97>
   1bb9c:	f6 06 01             	testb  $0x1,(%rsi)
   1bb9f:	0f 84 80 00 00 00    	je     1bc25 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x95>
   1bba5:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1bba9:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1bbad:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1bbb4:	00 00 80 
   1bbb7:	4d 8d 0c 00          	lea    (%r8,%rax,1),%r9
   1bbbb:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1bbbf:	4d 89 c2             	mov    %r8,%r10
   1bbc2:	49 21 ca             	and    %rcx,%r10
   1bbc5:	49 89 c3             	mov    %rax,%r11
   1bbc8:	4d 29 d3             	sub    %r10,%r11
   1bbcb:	4d 85 c0             	test   %r8,%r8
   1bbce:	4d 0f 49 d9          	cmovns %r9,%r11
   1bbd2:	4c 8d 04 02          	lea    (%rdx,%rax,1),%r8
   1bbd6:	49 89 d1             	mov    %rdx,%r9
   1bbd9:	49 21 c9             	and    %rcx,%r9
   1bbdc:	49 89 c2             	mov    %rax,%r10
   1bbdf:	4d 29 ca             	sub    %r9,%r10
   1bbe2:	48 85 d2             	test   %rdx,%rdx
   1bbe5:	4d 0f 49 d0          	cmovns %r8,%r10
   1bbe9:	4d 39 d3             	cmp    %r10,%r11
   1bbec:	73 37                	jae    1bc25 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x95>
   1bbee:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1bbf2:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1bbf6:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1bbfa:	49 89 d0             	mov    %rdx,%r8
   1bbfd:	49 21 c8             	and    %rcx,%r8
   1bc00:	49 89 c1             	mov    %rax,%r9
   1bc03:	4d 29 c1             	sub    %r8,%r9
   1bc06:	48 85 d2             	test   %rdx,%rdx
   1bc09:	4c 0f 49 cf          	cmovns %rdi,%r9
   1bc0d:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1bc11:	48 21 f1             	and    %rsi,%rcx
   1bc14:	48 29 c8             	sub    %rcx,%rax
   1bc17:	48 85 f6             	test   %rsi,%rsi
   1bc1a:	48 0f 49 c2          	cmovns %rdx,%rax
   1bc1e:	49 39 c1             	cmp    %rax,%r9
   1bc21:	0f 92 c0             	setb   %al
   1bc24:	c3                   	ret
   1bc25:	31 c0                	xor    %eax,%eax
   1bc27:	c3                   	ret
   1bc28:	cc                   	int3
   1bc29:	cc                   	int3
   1bc2a:	cc                   	int3
   1bc2b:	cc                   	int3
   1bc2c:	cc                   	int3
   1bc2d:	cc                   	int3
   1bc2e:	cc                   	int3
   1bc2f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::add:
   1bc30:	48 89 f8             	mov    %rdi,%rax
   1bc33:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1bc37:	0f 85 cb 00 00 00    	jne    1bd08 <<hyperinterval::float::F64Enclosure>::add+0xd8>
   1bc3d:	f6 02 01             	testb  $0x1,(%rdx)
   1bc40:	0f 84 c2 00 00 00    	je     1bd08 <<hyperinterval::float::F64Enclosure>::add+0xd8>
   1bc46:	55                   	push   %rbp
   1bc47:	41 57                	push   %r15
   1bc49:	41 56                	push   %r14
   1bc4b:	41 55                	push   %r13
   1bc4d:	41 54                	push   %r12
   1bc4f:	53                   	push   %rbx
   1bc50:	48 83 ec 18          	sub    $0x18,%rsp
   1bc54:	48 89 c5             	mov    %rax,%rbp
   1bc57:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1bc5b:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1bc5f:	4c 8b 62 10          	mov    0x10(%rdx),%r12
   1bc63:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1bc6a:	00 00 80 
   1bc6d:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1bc74:	00 f0 7f 
   1bc77:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   1bc7b:	48 89 e7             	mov    %rsp,%rdi
   1bc7e:	48 89 de             	mov    %rbx,%rsi
   1bc81:	4c 89 f2             	mov    %r14,%rdx
   1bc84:	e8 b7 de ff ff       	call   19b40 <<hyperinterval::ieee::Format>::add>
   1bc89:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bc8d:	74 57                	je     1bce6 <<hyperinterval::float::F64Enclosure>::add+0xb6>
   1bc8f:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1bc94:	48 89 e7             	mov    %rsp,%rdi
   1bc97:	48 89 de             	mov    %rbx,%rsi
   1bc9a:	4c 89 f2             	mov    %r14,%rdx
   1bc9d:	4c 89 f9             	mov    %r15,%rcx
   1bca0:	4d 89 e0             	mov    %r12,%r8
   1bca3:	e8 98 de ff ff       	call   19b40 <<hyperinterval::ieee::Format>::add>
   1bca8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bcac:	74 38                	je     1bce6 <<hyperinterval::float::F64Enclosure>::add+0xb6>
   1bcae:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1bcb3:	48 89 e7             	mov    %rsp,%rdi
   1bcb6:	48 89 de             	mov    %rbx,%rsi
   1bcb9:	4c 89 f2             	mov    %r14,%rdx
   1bcbc:	4c 89 e9             	mov    %r13,%rcx
   1bcbf:	e8 1c c2 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1bcc4:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bcc8:	74 1c                	je     1bce6 <<hyperinterval::float::F64Enclosure>::add+0xb6>
   1bcca:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1bccf:	48 89 e7             	mov    %rsp,%rdi
   1bcd2:	48 89 de             	mov    %rbx,%rsi
   1bcd5:	4c 89 f2             	mov    %r14,%rdx
   1bcd8:	4c 89 f9             	mov    %r15,%rcx
   1bcdb:	e8 00 c2 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1bce0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bce4:	75 2a                	jne    1bd10 <<hyperinterval::float::F64Enclosure>::add+0xe0>
   1bce6:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   1bceb:	48 89 e8             	mov    %rbp,%rax
   1bcee:	88 4d 08             	mov    %cl,0x8(%rbp)
   1bcf1:	48 c7 45 00 02 00 00 	movq   $0x2,0x0(%rbp)
   1bcf8:	00 
   1bcf9:	48 83 c4 18          	add    $0x18,%rsp
   1bcfd:	5b                   	pop    %rbx
   1bcfe:	41 5c                	pop    %r12
   1bd00:	41 5d                	pop    %r13
   1bd02:	41 5e                	pop    %r14
   1bd04:	41 5f                	pop    %r15
   1bd06:	5d                   	pop    %rbp
   1bd07:	c3                   	ret
   1bd08:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   1bd0f:	c3                   	ret
   1bd10:	49 8d 04 1c          	lea    (%r12,%rbx,1),%rax
   1bd14:	48 8d 53 ff          	lea    -0x1(%rbx),%rdx
   1bd18:	4c 89 e1             	mov    %r12,%rcx
   1bd1b:	48 21 d1             	and    %rdx,%rcx
   1bd1e:	48 89 de             	mov    %rbx,%rsi
   1bd21:	48 29 ce             	sub    %rcx,%rsi
   1bd24:	4d 85 e4             	test   %r12,%r12
   1bd27:	48 0f 49 f0          	cmovns %rax,%rsi
   1bd2b:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1bd30:	48 8d 04 19          	lea    (%rcx,%rbx,1),%rax
   1bd34:	48 21 ca             	and    %rcx,%rdx
   1bd37:	48 29 d3             	sub    %rdx,%rbx
   1bd3a:	48 85 c9             	test   %rcx,%rcx
   1bd3d:	48 0f 49 d8          	cmovns %rax,%rbx
   1bd41:	48 39 de             	cmp    %rbx,%rsi
   1bd44:	48 89 e8             	mov    %rbp,%rax
   1bd47:	76 0d                	jbe    1bd56 <<hyperinterval::float::F64Enclosure>::add+0x126>
   1bd49:	c6 40 08 01          	movb   $0x1,0x8(%rax)
   1bd4d:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1bd54:	eb a3                	jmp    1bcf9 <<hyperinterval::float::F64Enclosure>::add+0xc9>
   1bd56:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   1bd5d:	4c 89 60 08          	mov    %r12,0x8(%rax)
   1bd61:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1bd65:	eb 92                	jmp    1bcf9 <<hyperinterval::float::F64Enclosure>::add+0xc9>
   1bd67:	cc                   	int3
   1bd68:	cc                   	int3
   1bd69:	cc                   	int3
   1bd6a:	cc                   	int3
   1bd6b:	cc                   	int3
   1bd6c:	cc                   	int3
   1bd6d:	cc                   	int3
   1bd6e:	cc                   	int3
   1bd6f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::div:
   1bd70:	53                   	push   %rbx
   1bd71:	48 89 fb             	mov    %rdi,%rbx
   1bd74:	83 3a 01             	cmpl   $0x1,(%rdx)
   1bd77:	75 1e                	jne    1bd97 <<hyperinterval::float::F64Enclosure>::div+0x27>
   1bd79:	48 83 7a 08 00       	cmpq   $0x0,0x8(%rdx)
   1bd7e:	7f 17                	jg     1bd97 <<hyperinterval::float::F64Enclosure>::div+0x27>
   1bd80:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1bd84:	48 85 c0             	test   %rax,%rax
   1bd87:	0f 99 c1             	setns  %cl
   1bd8a:	48 d1 e0             	shl    $1,%rax
   1bd8d:	48 85 c0             	test   %rax,%rax
   1bd90:	0f 94 c0             	sete   %al
   1bd93:	08 c8                	or     %cl,%al
   1bd95:	75 12                	jne    1bda9 <<hyperinterval::float::F64Enclosure>::div+0x39>
   1bd97:	48 89 df             	mov    %rbx,%rdi
   1bd9a:	b9 01 00 00 00       	mov    $0x1,%ecx
   1bd9f:	e8 3c f3 ff ff       	call   1b0e0 <<hyperinterval::float::F64Enclosure>::corner_image>
   1bda4:	48 89 d8             	mov    %rbx,%rax
   1bda7:	5b                   	pop    %rbx
   1bda8:	c3                   	ret
   1bda9:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
   1bdad:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1bdb4:	48 89 d8             	mov    %rbx,%rax
   1bdb7:	5b                   	pop    %rbx
   1bdb8:	c3                   	ret
   1bdb9:	cc                   	int3
   1bdba:	cc                   	int3
   1bdbb:	cc                   	int3
   1bdbc:	cc                   	int3
   1bdbd:	cc                   	int3
   1bdbe:	cc                   	int3
   1bdbf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::new:
   1bdc0:	41 57                	push   %r15
   1bdc2:	41 56                	push   %r14
   1bdc4:	41 54                	push   %r12
   1bdc6:	53                   	push   %rbx
   1bdc7:	48 83 ec 18          	sub    $0x18,%rsp
   1bdcb:	f2 0f 11 4c 24 10    	movsd  %xmm1,0x10(%rsp)
   1bdd1:	48 89 fb             	mov    %rdi,%rbx
   1bdd4:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1bddb:	00 00 80 
   1bdde:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1bde5:	00 f0 7f 
   1bde8:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1bded:	48 89 e7             	mov    %rsp,%rdi
   1bdf0:	4c 89 f6             	mov    %r14,%rsi
   1bdf3:	4c 89 fa             	mov    %r15,%rdx
   1bdf6:	e8 e5 c0 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1bdfb:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bdff:	74 24                	je     1be25 <<hyperinterval::float::F64Enclosure>::new+0x65>
   1be01:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1be06:	f3 0f 7e 44 24 10    	movq   0x10(%rsp),%xmm0
   1be0c:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1be11:	48 89 e7             	mov    %rsp,%rdi
   1be14:	4c 89 f6             	mov    %r14,%rsi
   1be17:	4c 89 fa             	mov    %r15,%rdx
   1be1a:	e8 c1 c0 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1be1f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1be23:	75 1e                	jne    1be43 <<hyperinterval::float::F64Enclosure>::new+0x83>
   1be25:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1be2a:	88 43 08             	mov    %al,0x8(%rbx)
   1be2d:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1be34:	48 89 d8             	mov    %rbx,%rax
   1be37:	48 83 c4 18          	add    $0x18,%rsp
   1be3b:	5b                   	pop    %rbx
   1be3c:	41 5c                	pop    %r12
   1be3e:	41 5e                	pop    %r14
   1be40:	41 5f                	pop    %r15
   1be42:	c3                   	ret
   1be43:	4b 8d 04 34          	lea    (%r12,%r14,1),%rax
   1be47:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1be4b:	4c 89 e2             	mov    %r12,%rdx
   1be4e:	48 21 ca             	and    %rcx,%rdx
   1be51:	4c 89 f6             	mov    %r14,%rsi
   1be54:	48 29 d6             	sub    %rdx,%rsi
   1be57:	4d 85 e4             	test   %r12,%r12
   1be5a:	48 0f 49 f0          	cmovns %rax,%rsi
   1be5e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1be63:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1be67:	48 21 c1             	and    %rax,%rcx
   1be6a:	49 29 ce             	sub    %rcx,%r14
   1be6d:	48 85 c0             	test   %rax,%rax
   1be70:	4c 0f 49 f2          	cmovns %rdx,%r14
   1be74:	4c 39 f6             	cmp    %r14,%rsi
   1be77:	76 06                	jbe    1be7f <<hyperinterval::float::F64Enclosure>::new+0xbf>
   1be79:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1be7d:	eb ae                	jmp    1be2d <<hyperinterval::float::F64Enclosure>::new+0x6d>
   1be7f:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1be86:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   1be8a:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1be8e:	eb a4                	jmp    1be34 <<hyperinterval::float::F64Enclosure>::new+0x74>

<hyperinterval::float::F64Enclosure>::sub:
   1be90:	53                   	push   %rbx
   1be91:	48 83 ec 20          	sub    $0x20,%rsp
   1be95:	48 89 fb             	mov    %rdi,%rbx
   1be98:	48 83 3a 01          	cmpq   $0x1,(%rdx)
   1be9c:	75 30                	jne    1bece <<hyperinterval::float::F64Enclosure>::sub+0x3e>
   1be9e:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   1bea2:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1bea6:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1bead:	00 00 80 
   1beb0:	48 89 d1             	mov    %rdx,%rcx
   1beb3:	48 31 c1             	xor    %rax,%rcx
   1beb6:	48 85 d2             	test   %rdx,%rdx
   1beb9:	48 0f 44 ca          	cmove  %rdx,%rcx
   1bebd:	48 31 f8             	xor    %rdi,%rax
   1bec0:	48 85 ff             	test   %rdi,%rdi
   1bec3:	48 0f 44 c7          	cmove  %rdi,%rax
   1bec7:	ba 01 00 00 00       	mov    $0x1,%edx
   1becc:	eb 02                	jmp    1bed0 <<hyperinterval::float::F64Enclosure>::sub+0x40>
   1bece:	31 d2                	xor    %edx,%edx
   1bed0:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1bed5:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
   1beda:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1bedf:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
   1bee4:	48 89 df             	mov    %rbx,%rdi
   1bee7:	ff 15 eb ff 03 00    	call   *0x3ffeb(%rip)        # 5bed8 <_DYNAMIC+0x300>
   1beed:	48 89 d8             	mov    %rbx,%rax
   1bef0:	48 83 c4 20          	add    $0x20,%rsp
   1bef4:	5b                   	pop    %rbx
   1bef5:	c3                   	ret
   1bef6:	cc                   	int3
   1bef7:	cc                   	int3
   1bef8:	cc                   	int3
   1bef9:	cc                   	int3
   1befa:	cc                   	int3
   1befb:	cc                   	int3
   1befc:	cc                   	int3
   1befd:	cc                   	int3
   1befe:	cc                   	int3
   1beff:	cc                   	int3

<hyperinterval::float::F64Enclosure>::hull:
   1bf00:	48 89 f8             	mov    %rdi,%rax
   1bf03:	4c 8b 02             	mov    (%rdx),%r8
   1bf06:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   1bf0a:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
   1bf0e:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1bf12:	0f 85 9f 00 00 00    	jne    1bfb7 <<hyperinterval::float::F64Enclosure>::hull+0xb7>
   1bf18:	4c 8b 56 08          	mov    0x8(%rsi),%r10
   1bf1c:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1bf20:	ba 01 00 00 00       	mov    $0x1,%edx
   1bf25:	49 83 f8 01          	cmp    $0x1,%r8
   1bf29:	0f 85 97 00 00 00    	jne    1bfc6 <<hyperinterval::float::F64Enclosure>::hull+0xc6>
   1bf2f:	41 57                	push   %r15
   1bf31:	41 56                	push   %r14
   1bf33:	53                   	push   %rbx
   1bf34:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1bf3b:	00 00 80 
   1bf3e:	4f 8d 1c 02          	lea    (%r10,%r8,1),%r11
   1bf42:	4d 8d 48 ff          	lea    -0x1(%r8),%r9
   1bf46:	4c 89 d3             	mov    %r10,%rbx
   1bf49:	4c 21 cb             	and    %r9,%rbx
   1bf4c:	4d 89 c6             	mov    %r8,%r14
   1bf4f:	49 29 de             	sub    %rbx,%r14
   1bf52:	4d 85 d2             	test   %r10,%r10
   1bf55:	4d 0f 49 f3          	cmovns %r11,%r14
   1bf59:	4e 8d 1c 07          	lea    (%rdi,%r8,1),%r11
   1bf5d:	48 89 fb             	mov    %rdi,%rbx
   1bf60:	4c 21 cb             	and    %r9,%rbx
   1bf63:	4d 89 c7             	mov    %r8,%r15
   1bf66:	49 29 df             	sub    %rbx,%r15
   1bf69:	48 85 ff             	test   %rdi,%rdi
   1bf6c:	4d 0f 49 fb          	cmovns %r11,%r15
   1bf70:	4d 39 fe             	cmp    %r15,%r14
   1bf73:	49 0f 46 fa          	cmovbe %r10,%rdi
   1bf77:	4e 8d 14 06          	lea    (%rsi,%r8,1),%r10
   1bf7b:	49 89 f3             	mov    %rsi,%r11
   1bf7e:	4d 21 cb             	and    %r9,%r11
   1bf81:	4c 89 c3             	mov    %r8,%rbx
   1bf84:	4c 29 db             	sub    %r11,%rbx
   1bf87:	48 85 f6             	test   %rsi,%rsi
   1bf8a:	49 0f 49 da          	cmovns %r10,%rbx
   1bf8e:	4e 8d 14 01          	lea    (%rcx,%r8,1),%r10
   1bf92:	49 21 c9             	and    %rcx,%r9
   1bf95:	4d 29 c8             	sub    %r9,%r8
   1bf98:	48 85 c9             	test   %rcx,%rcx
   1bf9b:	4d 0f 49 c2          	cmovns %r10,%r8
   1bf9f:	4c 39 c3             	cmp    %r8,%rbx
   1bfa2:	48 0f 43 ce          	cmovae %rsi,%rcx
   1bfa6:	5b                   	pop    %rbx
   1bfa7:	41 5e                	pop    %r14
   1bfa9:	41 5f                	pop    %r15
   1bfab:	48 89 10             	mov    %rdx,(%rax)
   1bfae:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1bfb2:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1bfb6:	c3                   	ret
   1bfb7:	4c 89 c2             	mov    %r8,%rdx
   1bfba:	48 89 10             	mov    %rdx,(%rax)
   1bfbd:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1bfc1:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1bfc5:	c3                   	ret
   1bfc6:	48 89 f1             	mov    %rsi,%rcx
   1bfc9:	4c 89 d7             	mov    %r10,%rdi
   1bfcc:	48 89 10             	mov    %rdx,(%rax)
   1bfcf:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1bfd3:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1bfd7:	c3                   	ret
   1bfd8:	cc                   	int3
   1bfd9:	cc                   	int3
   1bfda:	cc                   	int3
   1bfdb:	cc                   	int3
   1bfdc:	cc                   	int3
   1bfdd:	cc                   	int3
   1bfde:	cc                   	int3
   1bfdf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::point:
   1bfe0:	53                   	push   %rbx
   1bfe1:	48 83 ec 10          	sub    $0x10,%rsp
   1bfe5:	48 89 fb             	mov    %rdi,%rbx
   1bfe8:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1bfed:	48 89 e7             	mov    %rsp,%rdi
   1bff0:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1bff7:	00 00 80 
   1bffa:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1c001:	00 f0 7f 
   1c004:	e8 d7 be ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1c009:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c00d:	75 0f                	jne    1c01e <<hyperinterval::float::F64Enclosure>::point+0x3e>
   1c00f:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1c014:	88 43 08             	mov    %al,0x8(%rbx)
   1c017:	b8 02 00 00 00       	mov    $0x2,%eax
   1c01c:	eb 12                	jmp    1c030 <<hyperinterval::float::F64Enclosure>::point+0x50>
   1c01e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c023:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1c027:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1c02b:	b8 01 00 00 00       	mov    $0x1,%eax
   1c030:	48 89 03             	mov    %rax,(%rbx)
   1c033:	48 89 d8             	mov    %rbx,%rax
   1c036:	48 83 c4 10          	add    $0x10,%rsp
   1c03a:	5b                   	pop    %rbx
   1c03b:	c3                   	ret
   1c03c:	cc                   	int3
   1c03d:	cc                   	int3
   1c03e:	cc                   	int3
   1c03f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::signs:
   1c040:	83 3f 01             	cmpl   $0x1,(%rdi)
   1c043:	75 69                	jne    1c0ae <<hyperinterval::float::F64Enclosure>::signs+0x6e>
   1c045:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1c04c:	00 00 80 
   1c04f:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   1c053:	48 8b 47 10          	mov    0x10(%rdi),%rax
   1c057:	4a 8d 14 01          	lea    (%rcx,%r8,1),%rdx
   1c05b:	49 8d 70 ff          	lea    -0x1(%r8),%rsi
   1c05f:	49 89 c9             	mov    %rcx,%r9
   1c062:	49 21 f1             	and    %rsi,%r9
   1c065:	4c 89 c7             	mov    %r8,%rdi
   1c068:	4c 29 cf             	sub    %r9,%rdi
   1c06b:	48 85 c9             	test   %rcx,%rcx
   1c06e:	48 0f 49 fa          	cmovns %rdx,%rdi
   1c072:	31 d2                	xor    %edx,%edx
   1c074:	48 85 ff             	test   %rdi,%rdi
   1c077:	0f 99 c1             	setns  %cl
   1c07a:	4c 39 c7             	cmp    %r8,%rdi
   1c07d:	77 1f                	ja     1c09e <<hyperinterval::float::F64Enclosure>::signs+0x5e>
   1c07f:	48 85 ff             	test   %rdi,%rdi
   1c082:	40 0f 99 c7          	setns  %dil
   1c086:	40 80 cf 02          	or     $0x2,%dil
   1c08a:	48 85 f0             	test   %rsi,%rax
   1c08d:	88 ca                	mov    %cl,%dl
   1c08f:	40 0f b6 cf          	movzbl %dil,%ecx
   1c093:	0f 44 d1             	cmove  %ecx,%edx
   1c096:	48 85 c0             	test   %rax,%rax
   1c099:	0f 49 d1             	cmovns %ecx,%edx
   1c09c:	89 d1                	mov    %edx,%ecx
   1c09e:	8d 51 04             	lea    0x4(%rcx),%edx
   1c0a1:	48 85 c0             	test   %rax,%rax
   1c0a4:	0f b6 c9             	movzbl %cl,%ecx
   1c0a7:	0f b6 c2             	movzbl %dl,%eax
   1c0aa:	0f 4e c1             	cmovle %ecx,%eax
   1c0ad:	c3                   	ret
   1c0ae:	31 c0                	xor    %eax,%eax
   1c0b0:	c3                   	ret
   1c0b1:	cc                   	int3
   1c0b2:	cc                   	int3
   1c0b3:	cc                   	int3
   1c0b4:	cc                   	int3
   1c0b5:	cc                   	int3
   1c0b6:	cc                   	int3
   1c0b7:	cc                   	int3
   1c0b8:	cc                   	int3
   1c0b9:	cc                   	int3
   1c0ba:	cc                   	int3
   1c0bb:	cc                   	int3
   1c0bc:	cc                   	int3
   1c0bd:	cc                   	int3
   1c0be:	cc                   	int3
   1c0bf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::affine:
   1c0c0:	55                   	push   %rbp
   1c0c1:	41 57                	push   %r15
   1c0c3:	41 56                	push   %r14
   1c0c5:	41 55                	push   %r13
   1c0c7:	41 54                	push   %r12
   1c0c9:	53                   	push   %rbx
   1c0ca:	48 83 ec 58          	sub    $0x58,%rsp
   1c0ce:	f2 0f 11 4c 24 18    	movsd  %xmm1,0x18(%rsp)
   1c0d4:	49 89 f5             	mov    %rsi,%r13
   1c0d7:	48 89 fb             	mov    %rdi,%rbx
   1c0da:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1c0e1:	00 00 80 
   1c0e4:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1c0eb:	00 f0 7f 
   1c0ee:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1c0f3:	48 89 e7             	mov    %rsp,%rdi
   1c0f6:	4c 89 f6             	mov    %r14,%rsi
   1c0f9:	4c 89 fa             	mov    %r15,%rdx
   1c0fc:	e8 df bd ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1c101:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c105:	74 24                	je     1c12b <<hyperinterval::float::F64Enclosure>::affine+0x6b>
   1c107:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1c10c:	f3 0f 7e 44 24 18    	movq   0x18(%rsp),%xmm0
   1c112:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1c117:	48 89 e7             	mov    %rsp,%rdi
   1c11a:	4c 89 f6             	mov    %r14,%rsi
   1c11d:	4c 89 fa             	mov    %r15,%rdx
   1c120:	e8 bb bd ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1c125:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c129:	75 21                	jne    1c14c <<hyperinterval::float::F64Enclosure>::affine+0x8c>
   1c12b:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1c130:	88 43 08             	mov    %al,0x8(%rbx)
   1c133:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c13a:	48 89 d8             	mov    %rbx,%rax
   1c13d:	48 83 c4 58          	add    $0x58,%rsp
   1c141:	5b                   	pop    %rbx
   1c142:	41 5c                	pop    %r12
   1c144:	41 5d                	pop    %r13
   1c146:	41 5e                	pop    %r14
   1c148:	41 5f                	pop    %r15
   1c14a:	5d                   	pop    %rbp
   1c14b:	c3                   	ret
   1c14c:	41 f6 45 00 01       	testb  $0x1,0x0(%r13)
   1c151:	0f 84 aa 00 00 00    	je     1c201 <<hyperinterval::float::F64Enclosure>::affine+0x141>
   1c157:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1c15c:	49 8b 45 10          	mov    0x10(%r13),%rax
   1c160:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1c165:	49 8b 4d 08          	mov    0x8(%r13),%rcx
   1c169:	48 89 e7             	mov    %rsp,%rdi
   1c16c:	4c 89 f6             	mov    %r14,%rsi
   1c16f:	4c 89 fa             	mov    %r15,%rdx
   1c172:	4d 89 e0             	mov    %r12,%r8
   1c175:	49 89 e9             	mov    %rbp,%r9
   1c178:	e8 a3 e4 ff ff       	call   1a620 <<hyperinterval::ieee::Format>::affine>
   1c17d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c181:	74 a8                	je     1c12b <<hyperinterval::float::F64Enclosure>::affine+0x6b>
   1c183:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1c188:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1c18d:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1c192:	48 89 e7             	mov    %rsp,%rdi
   1c195:	4c 89 f6             	mov    %r14,%rsi
   1c198:	4c 89 fa             	mov    %r15,%rdx
   1c19b:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1c1a0:	4d 89 e0             	mov    %r12,%r8
   1c1a3:	49 89 e9             	mov    %rbp,%r9
   1c1a6:	e8 75 e4 ff ff       	call   1a620 <<hyperinterval::ieee::Format>::affine>
   1c1ab:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c1af:	0f 84 76 ff ff ff    	je     1c12b <<hyperinterval::float::F64Enclosure>::affine+0x6b>
   1c1b5:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1c1ba:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1c1bf:	48 89 e7             	mov    %rsp,%rdi
   1c1c2:	4c 89 f6             	mov    %r14,%rsi
   1c1c5:	4c 89 fa             	mov    %r15,%rdx
   1c1c8:	4c 89 e9             	mov    %r13,%rcx
   1c1cb:	e8 10 bd ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1c1d0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c1d4:	74 1e                	je     1c1f4 <<hyperinterval::float::F64Enclosure>::affine+0x134>
   1c1d6:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1c1db:	48 89 e7             	mov    %rsp,%rdi
   1c1de:	4c 89 f6             	mov    %r14,%rsi
   1c1e1:	4c 89 fa             	mov    %r15,%rdx
   1c1e4:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1c1e9:	e8 f2 bc ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1c1ee:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c1f2:	75 19                	jne    1c20d <<hyperinterval::float::F64Enclosure>::affine+0x14d>
   1c1f4:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   1c1f9:	88 4b 08             	mov    %cl,0x8(%rbx)
   1c1fc:	e9 32 ff ff ff       	jmp    1c133 <<hyperinterval::float::F64Enclosure>::affine+0x73>
   1c201:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1c208:	e9 2d ff ff ff       	jmp    1c13a <<hyperinterval::float::F64Enclosure>::affine+0x7a>
   1c20d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c212:	4b 8d 0c 2e          	lea    (%r14,%r13,1),%rcx
   1c216:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   1c21a:	4c 89 ee             	mov    %r13,%rsi
   1c21d:	48 21 d6             	and    %rdx,%rsi
   1c220:	4c 89 f7             	mov    %r14,%rdi
   1c223:	48 29 f7             	sub    %rsi,%rdi
   1c226:	4d 85 ed             	test   %r13,%r13
   1c229:	48 0f 49 f9          	cmovns %rcx,%rdi
   1c22d:	4a 8d 0c 30          	lea    (%rax,%r14,1),%rcx
   1c231:	48 21 c2             	and    %rax,%rdx
   1c234:	49 29 d6             	sub    %rdx,%r14
   1c237:	48 85 c0             	test   %rax,%rax
   1c23a:	4c 0f 49 f1          	cmovns %rcx,%r14
   1c23e:	b1 01                	mov    $0x1,%cl
   1c240:	4c 39 f7             	cmp    %r14,%rdi
   1c243:	77 b4                	ja     1c1f9 <<hyperinterval::float::F64Enclosure>::affine+0x139>
   1c245:	48 c7 44 24 40 01 00 	movq   $0x1,0x40(%rsp)
   1c24c:	00 00 
   1c24e:	4c 89 6c 24 48       	mov    %r13,0x48(%rsp)
   1c253:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1c258:	48 89 e7             	mov    %rsp,%rdi
   1c25b:	4c 89 e6             	mov    %r12,%rsi
   1c25e:	48 89 ea             	mov    %rbp,%rdx
   1c261:	e8 ba 06 00 00       	call   1c920 <<hyperinterval::float::F64Enclosure>::from_bits>
   1c266:	48 8b 0c 24          	mov    (%rsp),%rcx
   1c26a:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1c26f:	48 83 f9 02          	cmp    $0x2,%rcx
   1c273:	0f 84 b7 fe ff ff    	je     1c130 <<hyperinterval::float::F64Enclosure>::affine+0x70>
   1c279:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   1c27e:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1c283:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
   1c288:	48 89 54 24 31       	mov    %rdx,0x31(%rsp)
   1c28d:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
   1c292:	88 44 24 30          	mov    %al,0x30(%rsp)
   1c296:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
   1c29b:	48 8d 54 24 28       	lea    0x28(%rsp),%rdx
   1c2a0:	48 89 df             	mov    %rbx,%rdi
   1c2a3:	ff 15 cf fc 03 00    	call   *0x3fccf(%rip)        # 5bf78 <_DYNAMIC+0x3a0>
   1c2a9:	e9 8c fe ff ff       	jmp    1c13a <<hyperinterval::float::F64Enclosure>::affine+0x7a>
   1c2ae:	cc                   	int3
   1c2af:	cc                   	int3

<hyperinterval::float::F64Enclosure>::square:
   1c2b0:	55                   	push   %rbp
   1c2b1:	41 57                	push   %r15
   1c2b3:	41 56                	push   %r14
   1c2b5:	41 55                	push   %r13
   1c2b7:	41 54                	push   %r12
   1c2b9:	53                   	push   %rbx
   1c2ba:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   1c2c1:	48 89 fb             	mov    %rdi,%rbx
   1c2c4:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1c2c8:	0f 85 0a 01 00 00    	jne    1c3d8 <<hyperinterval::float::F64Enclosure>::square+0x128>
   1c2ce:	4c 8b 66 10          	mov    0x10(%rsi),%r12
   1c2d2:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1c2d9:	00 00 80 
   1c2dc:	49 b8 00 00 00 00 00 	movabs $0x7ff0000000000000,%r8
   1c2e3:	00 f0 7f 
   1c2e6:	49 bf ff ff ff ff ff 	movabs $0xfffffffffffff,%r15
   1c2ed:	ff 0f 00 
   1c2f0:	4c 8b 6e 08          	mov    0x8(%rsi),%r13
   1c2f4:	4c 89 e9             	mov    %r13,%rcx
   1c2f7:	48 c1 e9 34          	shr    $0x34,%rcx
   1c2fb:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1c301:	4c 89 ea             	mov    %r13,%rdx
   1c304:	4c 21 fa             	and    %r15,%rdx
   1c307:	48 85 c9             	test   %rcx,%rcx
   1c30a:	4a 8d 44 3a 01       	lea    0x1(%rdx,%r15,1),%rax
   1c30f:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1c316:	48 0f 44 c2          	cmove  %rdx,%rax
   1c31a:	bd 9c f7 ff ff       	mov    $0xfffff79c,%ebp
   1c31f:	0f 44 cd             	cmove  %ebp,%ecx
   1c322:	48 f7 e0             	mul    %rax
   1c325:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1c32a:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1c32f:	48 89 04 24          	mov    %rax,(%rsp)
   1c333:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1c337:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1c33c:	48 89 e1             	mov    %rsp,%rcx
   1c33f:	4c 89 f6             	mov    %r14,%rsi
   1c342:	4c 89 c2             	mov    %r8,%rdx
   1c345:	e8 e6 e6 ff ff       	call   1aa30 <<hyperinterval::ieee::Format>::rounded>
   1c34a:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
   1c34f:	75 76                	jne    1c3c7 <<hyperinterval::float::F64Enclosure>::square+0x117>
   1c351:	4c 89 e2             	mov    %r12,%rdx
   1c354:	4c 8b 64 24 30       	mov    0x30(%rsp),%r12
   1c359:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   1c35e:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1c363:	48 89 d1             	mov    %rdx,%rcx
   1c366:	48 c1 e9 34          	shr    $0x34,%rcx
   1c36a:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1c370:	48 89 54 24 68       	mov    %rdx,0x68(%rsp)
   1c375:	4c 21 fa             	and    %r15,%rdx
   1c378:	48 85 c9             	test   %rcx,%rcx
   1c37b:	49 8d 44 17 01       	lea    0x1(%r15,%rdx,1),%rax
   1c380:	48 0f 44 c2          	cmove  %rdx,%rax
   1c384:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1c38b:	0f 44 cd             	cmove  %ebp,%ecx
   1c38e:	48 f7 e0             	mul    %rax
   1c391:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1c396:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1c39b:	48 89 04 24          	mov    %rax,(%rsp)
   1c39f:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1c3a3:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1c3a8:	48 89 e1             	mov    %rsp,%rcx
   1c3ab:	4c 89 f6             	mov    %r14,%rsi
   1c3ae:	48 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%rbp
   1c3b5:	00 f0 7f 
   1c3b8:	48 89 ea             	mov    %rbp,%rdx
   1c3bb:	e8 70 e6 ff ff       	call   1aa30 <<hyperinterval::ieee::Format>::rounded>
   1c3c0:	80 7c 24 28 01       	cmpb   $0x1,0x28(%rsp)
   1c3c5:	75 2d                	jne    1c3f4 <<hyperinterval::float::F64Enclosure>::square+0x144>
   1c3c7:	0f b6 44 24 29       	movzbl 0x29(%rsp),%eax
   1c3cc:	88 43 08             	mov    %al,0x8(%rbx)
   1c3cf:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c3d6:	eb 07                	jmp    1c3df <<hyperinterval::float::F64Enclosure>::square+0x12f>
   1c3d8:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1c3df:	48 89 d8             	mov    %rbx,%rax
   1c3e2:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1c3e9:	5b                   	pop    %rbx
   1c3ea:	41 5c                	pop    %r12
   1c3ec:	41 5d                	pop    %r13
   1c3ee:	41 5e                	pop    %r14
   1c3f0:	41 5f                	pop    %r15
   1c3f2:	5d                   	pop    %rbp
   1c3f3:	c3                   	ret
   1c3f4:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   1c3f9:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1c3fe:	4c 8b 7c 24 38       	mov    0x38(%rsp),%r15
   1c403:	48 89 e7             	mov    %rsp,%rdi
   1c406:	4c 89 f6             	mov    %r14,%rsi
   1c409:	48 89 ea             	mov    %rbp,%rdx
   1c40c:	4c 89 e1             	mov    %r12,%rcx
   1c40f:	e8 cc ba ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1c414:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c418:	74 23                	je     1c43d <<hyperinterval::float::F64Enclosure>::square+0x18d>
   1c41a:	4c 89 7c 24 78       	mov    %r15,0x78(%rsp)
   1c41f:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1c424:	48 89 e7             	mov    %rsp,%rdi
   1c427:	4c 89 f6             	mov    %r14,%rsi
   1c42a:	48 89 ea             	mov    %rbp,%rdx
   1c42d:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1c432:	e8 a9 ba ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1c437:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c43b:	75 07                	jne    1c444 <<hyperinterval::float::F64Enclosure>::square+0x194>
   1c43d:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1c442:	eb 88                	jmp    1c3cc <<hyperinterval::float::F64Enclosure>::square+0x11c>
   1c444:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
   1c449:	4b 8d 04 37          	lea    (%r15,%r14,1),%rax
   1c44d:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   1c451:	4c 89 f9             	mov    %r15,%rcx
   1c454:	48 21 d1             	and    %rdx,%rcx
   1c457:	4c 89 f7             	mov    %r14,%rdi
   1c45a:	48 29 cf             	sub    %rcx,%rdi
   1c45d:	4d 85 ff             	test   %r15,%r15
   1c460:	48 0f 49 f8          	cmovns %rax,%rdi
   1c464:	4a 8d 04 36          	lea    (%rsi,%r14,1),%rax
   1c468:	48 89 f1             	mov    %rsi,%rcx
   1c46b:	48 21 d1             	and    %rdx,%rcx
   1c46e:	4d 89 f4             	mov    %r14,%r12
   1c471:	49 29 cc             	sub    %rcx,%r12
   1c474:	48 85 f6             	test   %rsi,%rsi
   1c477:	4c 0f 49 e0          	cmovns %rax,%r12
   1c47b:	b0 01                	mov    $0x1,%al
   1c47d:	4c 39 e7             	cmp    %r12,%rdi
   1c480:	0f 87 46 ff ff ff    	ja     1c3cc <<hyperinterval::float::F64Enclosure>::square+0x11c>
   1c486:	48 89 7c 24 70       	mov    %rdi,0x70(%rsp)
   1c48b:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
   1c490:	48 89 e7             	mov    %rsp,%rdi
   1c493:	4c 89 f6             	mov    %r14,%rsi
   1c496:	48 89 ea             	mov    %rbp,%rdx
   1c499:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1c49e:	e8 3d ba ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1c4a3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c4a7:	74 23                	je     1c4cc <<hyperinterval::float::F64Enclosure>::square+0x21c>
   1c4a9:	4c 89 7c 24 40       	mov    %r15,0x40(%rsp)
   1c4ae:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1c4b3:	48 89 e7             	mov    %rsp,%rdi
   1c4b6:	4c 89 f6             	mov    %r14,%rsi
   1c4b9:	48 89 ea             	mov    %rbp,%rdx
   1c4bc:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
   1c4c1:	e8 1a ba ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1c4c6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c4ca:	75 14                	jne    1c4e0 <<hyperinterval::float::F64Enclosure>::square+0x230>
   1c4cc:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   1c4d1:	88 53 08             	mov    %dl,0x8(%rbx)
   1c4d4:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c4db:	e9 ff fe ff ff       	jmp    1c3df <<hyperinterval::float::F64Enclosure>::square+0x12f>
   1c4e0:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c4e5:	4b 8d 14 37          	lea    (%r15,%r14,1),%rdx
   1c4e9:	4c 89 fe             	mov    %r15,%rsi
   1c4ec:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   1c4f0:	48 21 fe             	and    %rdi,%rsi
   1c4f3:	4c 89 f1             	mov    %r14,%rcx
   1c4f6:	48 29 f1             	sub    %rsi,%rcx
   1c4f9:	4d 85 ff             	test   %r15,%r15
   1c4fc:	48 0f 49 ca          	cmovns %rdx,%rcx
   1c500:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1c504:	48 89 c6             	mov    %rax,%rsi
   1c507:	48 21 fe             	and    %rdi,%rsi
   1c50a:	49 29 f6             	sub    %rsi,%r14
   1c50d:	48 85 c0             	test   %rax,%rax
   1c510:	4c 0f 49 f2          	cmovns %rdx,%r14
   1c514:	b2 01                	mov    $0x1,%dl
   1c516:	4c 39 f1             	cmp    %r14,%rcx
   1c519:	77 b6                	ja     1c4d1 <<hyperinterval::float::F64Enclosure>::square+0x221>
   1c51b:	48 39 4c 24 70       	cmp    %rcx,0x70(%rsp)
   1c520:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1c525:	49 0f 47 cf          	cmova  %r15,%rcx
   1c529:	4d 39 f4             	cmp    %r14,%r12
   1c52c:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
   1c531:	48 0f 42 d0          	cmovb  %rax,%rdx
   1c535:	48 c7 44 24 50 01 00 	movq   $0x1,0x50(%rsp)
   1c53c:	00 00 
   1c53e:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
   1c543:	48 89 54 24 60       	mov    %rdx,0x60(%rsp)
   1c548:	4d 85 ed             	test   %r13,%r13
   1c54b:	7f 7d                	jg     1c5ca <<hyperinterval::float::F64Enclosure>::square+0x31a>
   1c54d:	48 83 7c 24 68 00    	cmpq   $0x0,0x68(%rsp)
   1c553:	79 07                	jns    1c55c <<hyperinterval::float::F64Enclosure>::square+0x2ac>
   1c555:	48 21 7c 24 68       	and    %rdi,0x68(%rsp)
   1c55a:	75 6e                	jne    1c5ca <<hyperinterval::float::F64Enclosure>::square+0x31a>
   1c55c:	48 89 e7             	mov    %rsp,%rdi
   1c55f:	31 f6                	xor    %esi,%esi
   1c561:	31 d2                	xor    %edx,%edx
   1c563:	e8 b8 03 00 00       	call   1c920 <<hyperinterval::float::F64Enclosure>::from_bits>
   1c568:	48 8b 0c 24          	mov    (%rsp),%rcx
   1c56c:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1c571:	48 83 f9 02          	cmp    $0x2,%rcx
   1c575:	0f 84 51 fe ff ff    	je     1c3cc <<hyperinterval::float::F64Enclosure>::square+0x11c>
   1c57b:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   1c580:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1c585:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
   1c58a:	48 89 54 24 31       	mov    %rdx,0x31(%rsp)
   1c58f:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
   1c594:	88 44 24 30          	mov    %al,0x30(%rsp)
   1c598:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   1c59f:	00 
   1c5a0:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   1c5a5:	48 8d 54 24 28       	lea    0x28(%rsp),%rdx
   1c5aa:	ff 15 c8 f9 03 00    	call   *0x3f9c8(%rip)        # 5bf78 <_DYNAMIC+0x3a0>
   1c5b0:	48 8b 84 24 90 00 00 	mov    0x90(%rsp),%rax
   1c5b7:	00 
   1c5b8:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1c5bd:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
   1c5c4:	00 
   1c5c5:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
   1c5ca:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
   1c5cf:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1c5d3:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   1c5d8:	48 89 03             	mov    %rax,(%rbx)
   1c5db:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
   1c5e0:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1c5e4:	e9 f6 fd ff ff       	jmp    1c3df <<hyperinterval::float::F64Enclosure>::square+0x12f>
   1c5e9:	cc                   	int3
   1c5ea:	cc                   	int3
   1c5eb:	cc                   	int3
   1c5ec:	cc                   	int3
   1c5ed:	cc                   	int3
   1c5ee:	cc                   	int3
   1c5ef:	cc                   	int3

<hyperinterval::float::F64Enclosure>::next_up:
   1c5f0:	41 57                	push   %r15
   1c5f2:	41 56                	push   %r14
   1c5f4:	53                   	push   %rbx
   1c5f5:	48 83 ec 10          	sub    $0x10,%rsp
   1c5f9:	48 89 fb             	mov    %rdi,%rbx
   1c5fc:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1c603:	00 00 80 
   1c606:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1c60d:	00 f0 7f 
   1c610:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1c615:	48 89 e7             	mov    %rsp,%rdi
   1c618:	4c 89 f6             	mov    %r14,%rsi
   1c61b:	4c 89 fa             	mov    %r15,%rdx
   1c61e:	e8 bd b8 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1c623:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c627:	75 0c                	jne    1c635 <<hyperinterval::float::F64Enclosure>::next_up+0x45>
   1c629:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1c62e:	88 43 01             	mov    %al,0x1(%rbx)
   1c631:	b0 01                	mov    $0x1,%al
   1c633:	eb 3c                	jmp    1c671 <<hyperinterval::float::F64Enclosure>::next_up+0x81>
   1c635:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c63a:	48 89 c1             	mov    %rax,%rcx
   1c63d:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1c641:	48 83 c9 01          	or     $0x1,%rcx
   1c645:	48 01 c1             	add    %rax,%rcx
   1c648:	48 89 e7             	mov    %rsp,%rdi
   1c64b:	4c 89 f6             	mov    %r14,%rsi
   1c64e:	4c 89 fa             	mov    %r15,%rdx
   1c651:	e8 8a b8 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1c656:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c65a:	75 08                	jne    1c664 <<hyperinterval::float::F64Enclosure>::next_up+0x74>
   1c65c:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
   1c660:	b0 01                	mov    $0x1,%al
   1c662:	eb 0d                	jmp    1c671 <<hyperinterval::float::F64Enclosure>::next_up+0x81>
   1c664:	f3 0f 7e 44 24 08    	movq   0x8(%rsp),%xmm0
   1c66a:	66 0f d6 43 08       	movq   %xmm0,0x8(%rbx)
   1c66f:	31 c0                	xor    %eax,%eax
   1c671:	88 03                	mov    %al,(%rbx)
   1c673:	48 89 d8             	mov    %rbx,%rax
   1c676:	48 83 c4 10          	add    $0x10,%rsp
   1c67a:	5b                   	pop    %rbx
   1c67b:	41 5e                	pop    %r14
   1c67d:	41 5f                	pop    %r15
   1c67f:	c3                   	ret

<hyperinterval::float::F64Enclosure>::disjoint:
   1c680:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1c684:	b0 01                	mov    $0x1,%al
   1c686:	0f 84 8b 00 00 00    	je     1c717 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1c68c:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1c690:	0f 84 81 00 00 00    	je     1c717 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1c696:	53                   	push   %rbx
   1c697:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
   1c69e:	00 00 80 
   1c6a1:	4c 8b 47 10          	mov    0x10(%rdi),%r8
   1c6a5:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
   1c6a9:	4d 8d 14 08          	lea    (%r8,%rcx,1),%r10
   1c6ad:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
   1c6b1:	4d 89 c3             	mov    %r8,%r11
   1c6b4:	49 21 d3             	and    %rdx,%r11
   1c6b7:	48 89 cb             	mov    %rcx,%rbx
   1c6ba:	4c 29 db             	sub    %r11,%rbx
   1c6bd:	4d 85 c0             	test   %r8,%r8
   1c6c0:	49 0f 49 da          	cmovns %r10,%rbx
   1c6c4:	4d 8d 04 09          	lea    (%r9,%rcx,1),%r8
   1c6c8:	4d 89 ca             	mov    %r9,%r10
   1c6cb:	49 21 d2             	and    %rdx,%r10
   1c6ce:	49 89 cb             	mov    %rcx,%r11
   1c6d1:	4d 29 d3             	sub    %r10,%r11
   1c6d4:	4d 85 c9             	test   %r9,%r9
   1c6d7:	4d 0f 49 d8          	cmovns %r8,%r11
   1c6db:	4c 39 db             	cmp    %r11,%rbx
   1c6de:	5b                   	pop    %rbx
   1c6df:	72 36                	jb     1c717 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1c6e1:	48 8b 47 08          	mov    0x8(%rdi),%rax
   1c6e5:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1c6e9:	48 8d 3c 0e          	lea    (%rsi,%rcx,1),%rdi
   1c6ed:	49 89 f0             	mov    %rsi,%r8
   1c6f0:	49 21 d0             	and    %rdx,%r8
   1c6f3:	49 89 c9             	mov    %rcx,%r9
   1c6f6:	4d 29 c1             	sub    %r8,%r9
   1c6f9:	48 85 f6             	test   %rsi,%rsi
   1c6fc:	4c 0f 49 cf          	cmovns %rdi,%r9
   1c700:	48 8d 34 08          	lea    (%rax,%rcx,1),%rsi
   1c704:	48 21 c2             	and    %rax,%rdx
   1c707:	48 29 d1             	sub    %rdx,%rcx
   1c70a:	48 85 c0             	test   %rax,%rax
   1c70d:	48 0f 49 ce          	cmovns %rsi,%rcx
   1c711:	49 39 c9             	cmp    %rcx,%r9
   1c714:	0f 92 c0             	setb   %al
   1c717:	c3                   	ret
   1c718:	cc                   	int3
   1c719:	cc                   	int3
   1c71a:	cc                   	int3
   1c71b:	cc                   	int3
   1c71c:	cc                   	int3
   1c71d:	cc                   	int3
   1c71e:	cc                   	int3
   1c71f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::expanded:
   1c720:	41 57                	push   %r15
   1c722:	41 56                	push   %r14
   1c724:	41 55                	push   %r13
   1c726:	41 54                	push   %r12
   1c728:	53                   	push   %rbx
   1c729:	48 83 ec 10          	sub    $0x10,%rsp
   1c72d:	48 89 fb             	mov    %rdi,%rbx
   1c730:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1c734:	75 7f                	jne    1c7b5 <<hyperinterval::float::F64Enclosure>::expanded+0x95>
   1c736:	4c 8b 66 10          	mov    0x10(%rsi),%r12
   1c73a:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1c741:	00 00 80 
   1c744:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1c74b:	00 f0 7f 
   1c74e:	48 8b 46 08          	mov    0x8(%rsi),%rax
   1c752:	48 89 c2             	mov    %rax,%rdx
   1c755:	4c 31 f2             	xor    %r14,%rdx
   1c758:	48 85 c0             	test   %rax,%rax
   1c75b:	48 0f 44 d0          	cmove  %rax,%rdx
   1c75f:	48 89 d1             	mov    %rdx,%rcx
   1c762:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1c766:	48 83 c9 01          	or     $0x1,%rcx
   1c76a:	48 01 d1             	add    %rdx,%rcx
   1c76d:	48 89 e7             	mov    %rsp,%rdi
   1c770:	4c 89 f6             	mov    %r14,%rsi
   1c773:	4c 89 fa             	mov    %r15,%rdx
   1c776:	e8 65 b7 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1c77b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1c77f:	75 27                	jne    1c7a8 <<hyperinterval::float::F64Enclosure>::expanded+0x88>
   1c781:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1c786:	4c 89 e1             	mov    %r12,%rcx
   1c789:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1c78d:	48 83 c9 01          	or     $0x1,%rcx
   1c791:	4c 01 e1             	add    %r12,%rcx
   1c794:	48 89 e7             	mov    %rsp,%rdi
   1c797:	4c 89 f6             	mov    %r14,%rsi
   1c79a:	4c 89 fa             	mov    %r15,%rdx
   1c79d:	e8 3e b7 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1c7a2:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c7a6:	75 25                	jne    1c7cd <<hyperinterval::float::F64Enclosure>::expanded+0xad>
   1c7a8:	c6 43 08 03          	movb   $0x3,0x8(%rbx)
   1c7ac:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c7b3:	eb 07                	jmp    1c7bc <<hyperinterval::float::F64Enclosure>::expanded+0x9c>
   1c7b5:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1c7bc:	48 89 d8             	mov    %rbx,%rax
   1c7bf:	48 83 c4 10          	add    $0x10,%rsp
   1c7c3:	5b                   	pop    %rbx
   1c7c4:	41 5c                	pop    %r12
   1c7c6:	41 5d                	pop    %r13
   1c7c8:	41 5e                	pop    %r14
   1c7ca:	41 5f                	pop    %r15
   1c7cc:	c3                   	ret
   1c7cd:	4c 89 e9             	mov    %r13,%rcx
   1c7d0:	4c 31 f1             	xor    %r14,%rcx
   1c7d3:	4d 85 ed             	test   %r13,%r13
   1c7d6:	49 0f 44 cd          	cmove  %r13,%rcx
   1c7da:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1c7df:	48 89 e7             	mov    %rsp,%rdi
   1c7e2:	4c 89 f6             	mov    %r14,%rsi
   1c7e5:	4c 89 fa             	mov    %r15,%rdx
   1c7e8:	e8 f3 b6 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1c7ed:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c7f1:	74 1c                	je     1c80f <<hyperinterval::float::F64Enclosure>::expanded+0xef>
   1c7f3:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1c7f8:	48 89 e7             	mov    %rsp,%rdi
   1c7fb:	4c 89 f6             	mov    %r14,%rsi
   1c7fe:	4c 89 fa             	mov    %r15,%rdx
   1c801:	4c 89 e1             	mov    %r12,%rcx
   1c804:	e8 d7 b6 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1c809:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c80d:	75 11                	jne    1c820 <<hyperinterval::float::F64Enclosure>::expanded+0x100>
   1c80f:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1c814:	88 43 08             	mov    %al,0x8(%rbx)
   1c817:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c81e:	eb 9c                	jmp    1c7bc <<hyperinterval::float::F64Enclosure>::expanded+0x9c>
   1c820:	4b 8d 04 2e          	lea    (%r14,%r13,1),%rax
   1c824:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1c828:	4c 89 ea             	mov    %r13,%rdx
   1c82b:	48 21 ca             	and    %rcx,%rdx
   1c82e:	4c 89 f6             	mov    %r14,%rsi
   1c831:	48 29 d6             	sub    %rdx,%rsi
   1c834:	4d 85 ed             	test   %r13,%r13
   1c837:	48 0f 49 f0          	cmovns %rax,%rsi
   1c83b:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c840:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1c844:	48 21 c1             	and    %rax,%rcx
   1c847:	49 29 ce             	sub    %rcx,%r14
   1c84a:	48 85 c0             	test   %rax,%rax
   1c84d:	4c 0f 49 f2          	cmovns %rdx,%r14
   1c851:	4c 39 f6             	cmp    %r14,%rsi
   1c854:	76 10                	jbe    1c866 <<hyperinterval::float::F64Enclosure>::expanded+0x146>
   1c856:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1c85a:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c861:	e9 56 ff ff ff       	jmp    1c7bc <<hyperinterval::float::F64Enclosure>::expanded+0x9c>
   1c866:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1c86d:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1c871:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1c875:	e9 42 ff ff ff       	jmp    1c7bc <<hyperinterval::float::F64Enclosure>::expanded+0x9c>
   1c87a:	cc                   	int3
   1c87b:	cc                   	int3
   1c87c:	cc                   	int3
   1c87d:	cc                   	int3
   1c87e:	cc                   	int3
   1c87f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::overlaps:
   1c880:	31 c0                	xor    %eax,%eax
   1c882:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1c886:	0f 84 8c 00 00 00    	je     1c918 <<hyperinterval::float::F64Enclosure>::overlaps+0x98>
   1c88c:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1c890:	0f 84 82 00 00 00    	je     1c918 <<hyperinterval::float::F64Enclosure>::overlaps+0x98>
   1c896:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1c89d:	00 00 80 
   1c8a0:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1c8a4:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1c8a8:	4c 8d 0c 02          	lea    (%rdx,%rax,1),%r9
   1c8ac:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1c8b0:	49 89 d2             	mov    %rdx,%r10
   1c8b3:	49 21 ca             	and    %rcx,%r10
   1c8b6:	49 89 c3             	mov    %rax,%r11
   1c8b9:	4d 29 d3             	sub    %r10,%r11
   1c8bc:	48 85 d2             	test   %rdx,%rdx
   1c8bf:	4d 0f 49 d9          	cmovns %r9,%r11
   1c8c3:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
   1c8c7:	4d 89 c1             	mov    %r8,%r9
   1c8ca:	49 21 c9             	and    %rcx,%r9
   1c8cd:	49 89 c2             	mov    %rax,%r10
   1c8d0:	4d 29 ca             	sub    %r9,%r10
   1c8d3:	4d 85 c0             	test   %r8,%r8
   1c8d6:	4c 0f 49 d2          	cmovns %rdx,%r10
   1c8da:	4d 39 d3             	cmp    %r10,%r11
   1c8dd:	73 03                	jae    1c8e2 <<hyperinterval::float::F64Enclosure>::overlaps+0x62>
   1c8df:	31 c0                	xor    %eax,%eax
   1c8e1:	c3                   	ret
   1c8e2:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1c8e6:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1c8ea:	48 8d 3c 06          	lea    (%rsi,%rax,1),%rdi
   1c8ee:	49 89 f0             	mov    %rsi,%r8
   1c8f1:	49 21 c8             	and    %rcx,%r8
   1c8f4:	49 89 c1             	mov    %rax,%r9
   1c8f7:	4d 29 c1             	sub    %r8,%r9
   1c8fa:	48 85 f6             	test   %rsi,%rsi
   1c8fd:	4c 0f 49 cf          	cmovns %rdi,%r9
   1c901:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
   1c905:	48 21 d1             	and    %rdx,%rcx
   1c908:	48 29 c8             	sub    %rcx,%rax
   1c90b:	48 85 d2             	test   %rdx,%rdx
   1c90e:	48 0f 49 c6          	cmovns %rsi,%rax
   1c912:	49 39 c1             	cmp    %rax,%r9
   1c915:	0f 93 c0             	setae  %al
   1c918:	c3                   	ret
   1c919:	cc                   	int3
   1c91a:	cc                   	int3
   1c91b:	cc                   	int3
   1c91c:	cc                   	int3
   1c91d:	cc                   	int3
   1c91e:	cc                   	int3
   1c91f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::from_bits:
   1c920:	41 57                	push   %r15
   1c922:	41 56                	push   %r14
   1c924:	41 55                	push   %r13
   1c926:	41 54                	push   %r12
   1c928:	53                   	push   %rbx
   1c929:	48 83 ec 10          	sub    $0x10,%rsp
   1c92d:	49 89 d7             	mov    %rdx,%r15
   1c930:	48 89 f1             	mov    %rsi,%rcx
   1c933:	48 89 fb             	mov    %rdi,%rbx
   1c936:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1c93d:	00 00 80 
   1c940:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1c947:	00 f0 7f 
   1c94a:	48 89 e7             	mov    %rsp,%rdi
   1c94d:	4c 89 f6             	mov    %r14,%rsi
   1c950:	4c 89 e2             	mov    %r12,%rdx
   1c953:	e8 88 b5 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1c958:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c95c:	74 1c                	je     1c97a <<hyperinterval::float::F64Enclosure>::from_bits+0x5a>
   1c95e:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1c963:	48 89 e7             	mov    %rsp,%rdi
   1c966:	4c 89 f6             	mov    %r14,%rsi
   1c969:	4c 89 e2             	mov    %r12,%rdx
   1c96c:	4c 89 f9             	mov    %r15,%rcx
   1c96f:	e8 6c b5 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1c974:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c978:	75 1d                	jne    1c997 <<hyperinterval::float::F64Enclosure>::from_bits+0x77>
   1c97a:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1c97f:	88 43 08             	mov    %al,0x8(%rbx)
   1c982:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c989:	48 83 c4 10          	add    $0x10,%rsp
   1c98d:	5b                   	pop    %rbx
   1c98e:	41 5c                	pop    %r12
   1c990:	41 5d                	pop    %r13
   1c992:	41 5e                	pop    %r14
   1c994:	41 5f                	pop    %r15
   1c996:	c3                   	ret
   1c997:	4b 8d 04 2e          	lea    (%r14,%r13,1),%rax
   1c99b:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1c99f:	4c 89 ea             	mov    %r13,%rdx
   1c9a2:	48 21 ca             	and    %rcx,%rdx
   1c9a5:	4c 89 f6             	mov    %r14,%rsi
   1c9a8:	48 29 d6             	sub    %rdx,%rsi
   1c9ab:	4d 85 ed             	test   %r13,%r13
   1c9ae:	48 0f 49 f0          	cmovns %rax,%rsi
   1c9b2:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c9b7:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1c9bb:	48 21 c1             	and    %rax,%rcx
   1c9be:	49 29 ce             	sub    %rcx,%r14
   1c9c1:	48 85 c0             	test   %rax,%rax
   1c9c4:	4c 0f 49 f2          	cmovns %rdx,%r14
   1c9c8:	4c 39 f6             	cmp    %r14,%rsi
   1c9cb:	76 06                	jbe    1c9d3 <<hyperinterval::float::F64Enclosure>::from_bits+0xb3>
   1c9cd:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1c9d1:	eb af                	jmp    1c982 <<hyperinterval::float::F64Enclosure>::from_bits+0x62>
   1c9d3:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1c9da:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1c9de:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1c9e2:	eb a5                	jmp    1c989 <<hyperinterval::float::F64Enclosure>::from_bits+0x69>
   1c9e4:	cc                   	int3
   1c9e5:	cc                   	int3
   1c9e6:	cc                   	int3
   1c9e7:	cc                   	int3
   1c9e8:	cc                   	int3
   1c9e9:	cc                   	int3
   1c9ea:	cc                   	int3
   1c9eb:	cc                   	int3
   1c9ec:	cc                   	int3
   1c9ed:	cc                   	int3
   1c9ee:	cc                   	int3
   1c9ef:	cc                   	int3

<hyperinterval::float::F64Enclosure>::next_down:
   1c9f0:	41 57                	push   %r15
   1c9f2:	41 56                	push   %r14
   1c9f4:	53                   	push   %rbx
   1c9f5:	48 83 ec 10          	sub    $0x10,%rsp
   1c9f9:	48 89 fb             	mov    %rdi,%rbx
   1c9fc:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1ca03:	00 00 80 
   1ca06:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1ca0d:	00 f0 7f 
   1ca10:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1ca15:	48 89 e7             	mov    %rsp,%rdi
   1ca18:	4c 89 f6             	mov    %r14,%rsi
   1ca1b:	4c 89 fa             	mov    %r15,%rdx
   1ca1e:	e8 bd b4 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1ca23:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1ca27:	75 0c                	jne    1ca35 <<hyperinterval::float::F64Enclosure>::next_down+0x45>
   1ca29:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1ca2e:	88 43 01             	mov    %al,0x1(%rbx)
   1ca31:	b0 01                	mov    $0x1,%al
   1ca33:	eb 51                	jmp    1ca86 <<hyperinterval::float::F64Enclosure>::next_down+0x96>
   1ca35:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1ca3a:	48 89 c2             	mov    %rax,%rdx
   1ca3d:	4c 31 f2             	xor    %r14,%rdx
   1ca40:	48 85 c0             	test   %rax,%rax
   1ca43:	48 0f 44 d0          	cmove  %rax,%rdx
   1ca47:	48 89 d1             	mov    %rdx,%rcx
   1ca4a:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1ca4e:	48 83 c9 01          	or     $0x1,%rcx
   1ca52:	48 01 d1             	add    %rdx,%rcx
   1ca55:	48 89 e7             	mov    %rsp,%rdi
   1ca58:	4c 89 f6             	mov    %r14,%rsi
   1ca5b:	4c 89 fa             	mov    %r15,%rdx
   1ca5e:	e8 7d b4 ff ff       	call   17ee0 <<hyperinterval::ieee::Format>::finite>
   1ca63:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1ca67:	75 08                	jne    1ca71 <<hyperinterval::float::F64Enclosure>::next_down+0x81>
   1ca69:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
   1ca6d:	b0 01                	mov    $0x1,%al
   1ca6f:	eb 15                	jmp    1ca86 <<hyperinterval::float::F64Enclosure>::next_down+0x96>
   1ca71:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1ca76:	49 31 c6             	xor    %rax,%r14
   1ca79:	48 85 c0             	test   %rax,%rax
   1ca7c:	4c 0f 44 f0          	cmove  %rax,%r14
   1ca80:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1ca84:	31 c0                	xor    %eax,%eax
   1ca86:	88 03                	mov    %al,(%rbx)
   1ca88:	48 89 d8             	mov    %rbx,%rax
   1ca8b:	48 83 c4 10          	add    $0x10,%rsp
   1ca8f:	5b                   	pop    %rbx
   1ca90:	41 5e                	pop    %r14
   1ca92:	41 5f                	pop    %r15
   1ca94:	c3                   	ret
   1ca95:	cc                   	int3
   1ca96:	cc                   	int3
   1ca97:	cc                   	int3
   1ca98:	cc                   	int3
   1ca99:	cc                   	int3
   1ca9a:	cc                   	int3
   1ca9b:	cc                   	int3
   1ca9c:	cc                   	int3
   1ca9d:	cc                   	int3
   1ca9e:	cc                   	int3
   1ca9f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::subset_of:
   1caa0:	b0 01                	mov    $0x1,%al
   1caa2:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1caa6:	75 50                	jne    1caf8 <<hyperinterval::float::F64Enclosure>::subset_of+0x58>
   1caa8:	f6 06 01             	testb  $0x1,(%rsi)
   1caab:	74 49                	je     1caf6 <<hyperinterval::float::F64Enclosure>::subset_of+0x56>
   1caad:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1cab1:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1cab5:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1cabc:	00 00 80 
   1cabf:	4d 8d 0c 00          	lea    (%r8,%rax,1),%r9
   1cac3:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1cac7:	4d 89 c2             	mov    %r8,%r10
   1caca:	49 21 ca             	and    %rcx,%r10
   1cacd:	49 89 c3             	mov    %rax,%r11
   1cad0:	4d 29 d3             	sub    %r10,%r11
   1cad3:	4d 85 c0             	test   %r8,%r8
   1cad6:	4d 0f 49 d9          	cmovns %r9,%r11
   1cada:	4c 8d 04 02          	lea    (%rdx,%rax,1),%r8
   1cade:	49 89 d1             	mov    %rdx,%r9
   1cae1:	49 21 c9             	and    %rcx,%r9
   1cae4:	49 89 c2             	mov    %rax,%r10
   1cae7:	4d 29 ca             	sub    %r9,%r10
   1caea:	48 85 d2             	test   %rdx,%rdx
   1caed:	4d 0f 49 d0          	cmovns %r8,%r10
   1caf1:	4d 39 d3             	cmp    %r10,%r11
   1caf4:	76 03                	jbe    1caf9 <<hyperinterval::float::F64Enclosure>::subset_of+0x59>
   1caf6:	31 c0                	xor    %eax,%eax
   1caf8:	c3                   	ret
   1caf9:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1cafd:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1cb01:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1cb05:	49 89 d0             	mov    %rdx,%r8
   1cb08:	49 21 c8             	and    %rcx,%r8
   1cb0b:	49 89 c1             	mov    %rax,%r9
   1cb0e:	4d 29 c1             	sub    %r8,%r9
   1cb11:	48 85 d2             	test   %rdx,%rdx
   1cb14:	4c 0f 49 cf          	cmovns %rdi,%r9
   1cb18:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1cb1c:	48 21 f1             	and    %rsi,%rcx
   1cb1f:	48 29 c8             	sub    %rcx,%rax
   1cb22:	48 85 f6             	test   %rsi,%rsi
   1cb25:	48 0f 49 c2          	cmovns %rdx,%rax
   1cb29:	49 39 c1             	cmp    %rax,%r9
   1cb2c:	0f 96 c0             	setbe  %al
   1cb2f:	c3                   	ret

__udivti3:
   58ab0:	49 89 d0             	mov    %rdx,%r8
   58ab3:	48 85 c9             	test   %rcx,%rcx
   58ab6:	74 76                	je     58b2e <__udivti3+0x7e>
   58ab8:	53                   	push   %rbx
   58ab9:	4c 0f bd c9          	bsr    %rcx,%r9
   58abd:	44 89 ca             	mov    %r9d,%edx
   58ac0:	83 f2 3f             	xor    $0x3f,%edx
   58ac3:	b0 40                	mov    $0x40,%al
   58ac5:	28 d0                	sub    %dl,%al
   58ac7:	4c 89 c2             	mov    %r8,%rdx
   58aca:	49 89 cb             	mov    %rcx,%r11
   58acd:	89 c1                	mov    %eax,%ecx
   58acf:	4c 0f ad da          	shrd   %cl,%r11,%rdx
   58ad3:	4d 89 da             	mov    %r11,%r10
   58ad6:	49 d3 ea             	shr    %cl,%r10
   58ad9:	a8 40                	test   $0x40,%al
   58adb:	4c 0f 44 d2          	cmove  %rdx,%r10
   58adf:	48 89 f8             	mov    %rdi,%rax
   58ae2:	48 0f ac f0 01       	shrd   $0x1,%rsi,%rax
   58ae7:	48 89 f2             	mov    %rsi,%rdx
   58aea:	48 d1 ea             	shr    $1,%rdx
   58aed:	49 f7 f2             	div    %r10
   58af0:	49 89 c2             	mov    %rax,%r10
   58af3:	44 89 c9             	mov    %r9d,%ecx
   58af6:	49 d3 ea             	shr    %cl,%r10
   58af9:	31 c9                	xor    %ecx,%ecx
   58afb:	49 83 ea 01          	sub    $0x1,%r10
   58aff:	4c 0f 42 d1          	cmovb  %rcx,%r10
   58b03:	4c 89 db             	mov    %r11,%rbx
   58b06:	4c 89 c0             	mov    %r8,%rax
   58b09:	49 f7 e2             	mul    %r10
   58b0c:	49 89 c1             	mov    %rax,%r9
   58b0f:	4c 89 d0             	mov    %r10,%rax
   58b12:	49 0f af da          	imul   %r10,%rbx
   58b16:	48 01 da             	add    %rbx,%rdx
   58b19:	4c 29 cf             	sub    %r9,%rdi
   58b1c:	48 19 d6             	sbb    %rdx,%rsi
   58b1f:	4c 39 c7             	cmp    %r8,%rdi
   58b22:	4c 19 de             	sbb    %r11,%rsi
   58b25:	48 83 d8 ff          	sbb    $0xffffffffffffffff,%rax
   58b29:	5b                   	pop    %rbx
   58b2a:	48 89 ca             	mov    %rcx,%rdx
   58b2d:	c3                   	ret
   58b2e:	4c 39 c6             	cmp    %r8,%rsi
   58b31:	73 0f                	jae    58b42 <__udivti3+0x92>
   58b33:	48 89 f8             	mov    %rdi,%rax
   58b36:	48 89 f2             	mov    %rsi,%rdx
   58b39:	49 f7 f0             	div    %r8
   58b3c:	31 c9                	xor    %ecx,%ecx
   58b3e:	48 89 ca             	mov    %rcx,%rdx
   58b41:	c3                   	ret
   58b42:	48 89 f0             	mov    %rsi,%rax
   58b45:	4c 09 c0             	or     %r8,%rax
   58b48:	48 c1 e8 20          	shr    $0x20,%rax
   58b4c:	74 15                	je     58b63 <__udivti3+0xb3>
   58b4e:	48 89 f0             	mov    %rsi,%rax
   58b51:	31 d2                	xor    %edx,%edx
   58b53:	49 f7 f0             	div    %r8
   58b56:	48 89 c1             	mov    %rax,%rcx
   58b59:	48 89 f8             	mov    %rdi,%rax
   58b5c:	49 f7 f0             	div    %r8
   58b5f:	48 89 ca             	mov    %rcx,%rdx
   58b62:	c3                   	ret
   58b63:	89 f0                	mov    %esi,%eax
   58b65:	31 d2                	xor    %edx,%edx
   58b67:	41 f7 f0             	div    %r8d
   58b6a:	89 c1                	mov    %eax,%ecx
   58b6c:	48 89 f8             	mov    %rdi,%rax
   58b6f:	49 f7 f0             	div    %r8
   58b72:	48 89 ca             	mov    %rcx,%rdx
   58b75:	c3                   	ret

Disassembly of section .init:
