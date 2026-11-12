hyperinterval_strict_chain32:
   173d0:	53                   	push   %rbx
   173d1:	48 83 ec 60          	sub    $0x60,%rsp
   173d5:	48 89 fb             	mov    %rdi,%rbx
   173d8:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   173dd:	ff 15 25 44 04 00    	call   *0x44425(%rip)        # 5b808 <_DYNAMIC+0x2b0>
   173e3:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   173e7:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   173ec:	83 f9 02             	cmp    $0x2,%ecx
   173ef:	0f 84 f4 00 00 00    	je     174e9 <hyperinterval_strict_chain32+0x119>
   173f5:	8b 54 24 11          	mov    0x11(%rsp),%edx
   173f9:	8b 74 24 14          	mov    0x14(%rsp),%esi
   173fd:	89 74 24 5c          	mov    %esi,0x5c(%rsp)
   17401:	89 54 24 59          	mov    %edx,0x59(%rsp)
   17405:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
   17409:	88 44 24 58          	mov    %al,0x58(%rsp)
   1740d:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   17412:	48 8d 74 24 54       	lea    0x54(%rsp),%rsi
   17417:	f3 0f 10 05 29 e7 fe 	movss  -0x118d7(%rip),%xmm0        # 5b48 <__abi_tag+0x584c>
   1741e:	ff 
   1741f:	f3 0f 10 0d 19 e7 fe 	movss  -0x118e7(%rip),%xmm1        # 5b40 <__abi_tag+0x5844>
   17426:	ff 
   17427:	ff 15 e3 43 04 00    	call   *0x443e3(%rip)        # 5b810 <_DYNAMIC+0x2b8>
   1742d:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
   17431:	0f b6 44 24 1c       	movzbl 0x1c(%rsp),%eax
   17436:	83 f9 02             	cmp    $0x2,%ecx
   17439:	0f 84 aa 00 00 00    	je     174e9 <hyperinterval_strict_chain32+0x119>
   1743f:	8b 54 24 1d          	mov    0x1d(%rsp),%edx
   17443:	8b 74 24 20          	mov    0x20(%rsp),%esi
   17447:	89 74 24 50          	mov    %esi,0x50(%rsp)
   1744b:	89 54 24 4d          	mov    %edx,0x4d(%rsp)
   1744f:	89 4c 24 48          	mov    %ecx,0x48(%rsp)
   17453:	88 44 24 4c          	mov    %al,0x4c(%rsp)
   17457:	48 8d 7c 24 3c       	lea    0x3c(%rsp),%rdi
   1745c:	48 8d 74 24 48       	lea    0x48(%rsp),%rsi
   17461:	ff 15 b1 43 04 00    	call   *0x443b1(%rip)        # 5b818 <_DYNAMIC+0x2c0>
   17467:	8b 4c 24 3c          	mov    0x3c(%rsp),%ecx
   1746b:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   17470:	83 f9 02             	cmp    $0x2,%ecx
   17473:	74 74                	je     174e9 <hyperinterval_strict_chain32+0x119>
   17475:	8b 54 24 41          	mov    0x41(%rsp),%edx
   17479:	8b 74 24 44          	mov    0x44(%rsp),%esi
   1747d:	89 74 24 38          	mov    %esi,0x38(%rsp)
   17481:	89 54 24 35          	mov    %edx,0x35(%rsp)
   17485:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   17489:	88 44 24 34          	mov    %al,0x34(%rsp)
   1748d:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   17492:	f3 0f 10 05 7a e6 fe 	movss  -0x11986(%rip),%xmm0        # 5b14 <__abi_tag+0x5818>
   17499:	ff 
   1749a:	ff 15 80 43 04 00    	call   *0x44380(%rip)        # 5b820 <_DYNAMIC+0x2c8>
   174a0:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   174a4:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   174a9:	83 f9 02             	cmp    $0x2,%ecx
   174ac:	74 3b                	je     174e9 <hyperinterval_strict_chain32+0x119>
   174ae:	8b 54 24 11          	mov    0x11(%rsp),%edx
   174b2:	8b 74 24 14          	mov    0x14(%rsp),%esi
   174b6:	89 74 24 20          	mov    %esi,0x20(%rsp)
   174ba:	89 54 24 1d          	mov    %edx,0x1d(%rsp)
   174be:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
   174c2:	88 44 24 1c          	mov    %al,0x1c(%rsp)
   174c6:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
   174cb:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   174d0:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
   174d5:	ff 15 4d 43 04 00    	call   *0x4434d(%rip)        # 5b828 <_DYNAMIC+0x2d0>
   174db:	8b 4c 24 24          	mov    0x24(%rsp),%ecx
   174df:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   174e4:	83 f9 02             	cmp    $0x2,%ecx
   174e7:	75 12                	jne    174fb <hyperinterval_strict_chain32+0x12b>
   174e9:	88 43 04             	mov    %al,0x4(%rbx)
   174ec:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   174f2:	48 89 d8             	mov    %rbx,%rax
   174f5:	48 83 c4 60          	add    $0x60,%rsp
   174f9:	5b                   	pop    %rbx
   174fa:	c3                   	ret
   174fb:	8b 54 24 29          	mov    0x29(%rsp),%edx
   174ff:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
   17503:	89 74 24 14          	mov    %esi,0x14(%rsp)
   17507:	89 54 24 11          	mov    %edx,0x11(%rsp)
   1750b:	89 4c 24 0c          	mov    %ecx,0xc(%rsp)
   1750f:	88 44 24 10          	mov    %al,0x10(%rsp)
   17513:	48 8d 74 24 0c       	lea    0xc(%rsp),%rsi
   17518:	48 89 df             	mov    %rbx,%rdi
   1751b:	ff 15 0f 43 04 00    	call   *0x4430f(%rip)        # 5b830 <_DYNAMIC+0x2d8>
   17521:	48 89 d8             	mov    %rbx,%rax
   17524:	48 83 c4 60          	add    $0x60,%rsp
   17528:	5b                   	pop    %rbx
   17529:	c3                   	ret
   1752a:	cc                   	int3
   1752b:	cc                   	int3
   1752c:	cc                   	int3
   1752d:	cc                   	int3
   1752e:	cc                   	int3
   1752f:	cc                   	int3

hyperinterval_strict_chain64:
   17530:	53                   	push   %rbx
   17531:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
   17538:	48 89 fb             	mov    %rdi,%rbx
   1753b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17540:	ff 15 f2 42 04 00    	call   *0x442f2(%rip)        # 5b838 <_DYNAMIC+0x2e0>
   17546:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1754b:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   17550:	48 83 f9 02          	cmp    $0x2,%rcx
   17554:	0f 84 32 01 00 00    	je     1768c <hyperinterval_strict_chain64+0x15c>
   1755a:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   1755f:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   17564:	48 89 b4 24 a8 00 00 	mov    %rsi,0xa8(%rsp)
   1756b:	00 
   1756c:	48 89 94 24 a1 00 00 	mov    %rdx,0xa1(%rsp)
   17573:	00 
   17574:	48 89 8c 24 98 00 00 	mov    %rcx,0x98(%rsp)
   1757b:	00 
   1757c:	88 84 24 a0 00 00 00 	mov    %al,0xa0(%rsp)
   17583:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   17588:	48 8d b4 24 98 00 00 	lea    0x98(%rsp),%rsi
   1758f:	00 
   17590:	f2 0f 10 05 38 e5 fe 	movsd  -0x11ac8(%rip),%xmm0        # 5ad0 <__abi_tag+0x57d4>
   17597:	ff 
   17598:	f2 0f 10 0d 40 e5 fe 	movsd  -0x11ac0(%rip),%xmm1        # 5ae0 <__abi_tag+0x57e4>
   1759f:	ff 
   175a0:	ff 15 9a 42 04 00    	call   *0x4429a(%rip)        # 5b840 <_DYNAMIC+0x2e8>
   175a6:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   175ab:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   175b0:	48 83 f9 02          	cmp    $0x2,%rcx
   175b4:	0f 84 d2 00 00 00    	je     1768c <hyperinterval_strict_chain64+0x15c>
   175ba:	48 8b 54 24 29       	mov    0x29(%rsp),%rdx
   175bf:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   175c4:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
   175cb:	00 
   175cc:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
   175d3:	00 
   175d4:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
   175db:	00 
   175dc:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
   175e3:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
   175e8:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   175ef:	00 
   175f0:	ff 15 52 42 04 00    	call   *0x44252(%rip)        # 5b848 <_DYNAMIC+0x2f0>
   175f6:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
   175fb:	0f b6 44 24 70       	movzbl 0x70(%rsp),%eax
   17600:	48 83 f9 02          	cmp    $0x2,%rcx
   17604:	0f 84 82 00 00 00    	je     1768c <hyperinterval_strict_chain64+0x15c>
   1760a:	48 8b 54 24 71       	mov    0x71(%rsp),%rdx
   1760f:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
   17614:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   17619:	48 89 54 24 59       	mov    %rdx,0x59(%rsp)
   1761e:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
   17623:	88 44 24 58          	mov    %al,0x58(%rsp)
   17627:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1762c:	f2 0f 10 05 8c e4 fe 	movsd  -0x11b74(%rip),%xmm0        # 5ac0 <__abi_tag+0x57c4>
   17633:	ff 
   17634:	ff 15 16 42 04 00    	call   *0x44216(%rip)        # 5b850 <_DYNAMIC+0x2f8>
   1763a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1763f:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   17644:	48 83 f9 02          	cmp    $0x2,%rcx
   17648:	74 42                	je     1768c <hyperinterval_strict_chain64+0x15c>
   1764a:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   1764f:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   17654:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   17659:	48 89 54 24 29       	mov    %rdx,0x29(%rsp)
   1765e:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   17663:	88 44 24 28          	mov    %al,0x28(%rsp)
   17667:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1766c:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   17671:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
   17676:	ff 15 dc 41 04 00    	call   *0x441dc(%rip)        # 5b858 <_DYNAMIC+0x300>
   1767c:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   17681:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   17686:	48 83 f9 02          	cmp    $0x2,%rcx
   1768a:	75 16                	jne    176a2 <hyperinterval_strict_chain64+0x172>
   1768c:	88 43 08             	mov    %al,0x8(%rbx)
   1768f:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   17696:	48 89 d8             	mov    %rbx,%rax
   17699:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   176a0:	5b                   	pop    %rbx
   176a1:	c3                   	ret
   176a2:	48 8b 54 24 41       	mov    0x41(%rsp),%rdx
   176a7:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
   176ac:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
   176b1:	48 89 54 24 11       	mov    %rdx,0x11(%rsp)
   176b6:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   176bb:	88 44 24 10          	mov    %al,0x10(%rsp)
   176bf:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
   176c4:	48 89 df             	mov    %rbx,%rdi
   176c7:	ff 15 93 41 04 00    	call   *0x44193(%rip)        # 5b860 <_DYNAMIC+0x308>
   176cd:	48 89 d8             	mov    %rbx,%rax
   176d0:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   176d7:	5b                   	pop    %rbx
   176d8:	c3                   	ret
   176d9:	cc                   	int3
   176da:	cc                   	int3
   176db:	cc                   	int3
   176dc:	cc                   	int3
   176dd:	cc                   	int3
   176de:	cc                   	int3
   176df:	cc                   	int3

hyperinterval_strict_surface32:
   176e0:	55                   	push   %rbp
   176e1:	41 57                	push   %r15
   176e3:	41 56                	push   %r14
   176e5:	41 55                	push   %r13
   176e7:	41 54                	push   %r12
   176e9:	53                   	push   %rbx
   176ea:	48 83 ec 78          	sub    $0x78,%rsp
   176ee:	41 89 f6             	mov    %esi,%r14d
   176f1:	48 89 fd             	mov    %rdi,%rbp
   176f4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   176f9:	66 0f 7e 44 24 38    	movd   %xmm0,0x38(%rsp)
   176ff:	66 0f 7e 4c 24 1c    	movd   %xmm1,0x1c(%rsp)
   17705:	ff 15 fd 40 04 00    	call   *0x440fd(%rip)        # 5b808 <_DYNAMIC+0x2b0>
   1770b:	44 8b 7c 24 08       	mov    0x8(%rsp),%r15d
   17710:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   17715:	41 83 ff 02          	cmp    $0x2,%r15d
   17719:	75 05                	jne    17720 <hyperinterval_strict_surface32+0x40>
   1771b:	88 45 04             	mov    %al,0x4(%rbp)
   1771e:	eb 45                	jmp    17765 <hyperinterval_strict_surface32+0x85>
   17720:	8b 4c 24 0d          	mov    0xd(%rsp),%ecx
   17724:	8b 54 24 10          	mov    0x10(%rsp),%edx
   17728:	89 54 24 44          	mov    %edx,0x44(%rsp)
   1772c:	89 4c 24 41          	mov    %ecx,0x41(%rsp)
   17730:	44 89 7c 24 3c       	mov    %r15d,0x3c(%rsp)
   17735:	88 44 24 40          	mov    %al,0x40(%rsp)
   17739:	66 0f 6e 44 24 38    	movd   0x38(%rsp),%xmm0
   1773f:	ff 15 23 41 04 00    	call   *0x44123(%rip)        # 5b868 <_DYNAMIC+0x310>
   17745:	48 89 c3             	mov    %rax,%rbx
   17748:	f6 c3 01             	test   $0x1,%bl
   1774b:	74 05                	je     17752 <hyperinterval_strict_surface32+0x72>
   1774d:	88 7d 04             	mov    %bh,0x4(%rbp)
   17750:	eb 13                	jmp    17765 <hyperinterval_strict_surface32+0x85>
   17752:	66 0f 6e 44 24 1c    	movd   0x1c(%rsp),%xmm0
   17758:	ff 15 12 41 04 00    	call   *0x44112(%rip)        # 5b870 <_DYNAMIC+0x318>
   1775e:	a8 01                	test   $0x1,%al
   17760:	74 1c                	je     1777e <hyperinterval_strict_surface32+0x9e>
   17762:	88 65 04             	mov    %ah,0x4(%rbp)
   17765:	c7 45 00 02 00 00 00 	movl   $0x2,0x0(%rbp)
   1776c:	48 89 e8             	mov    %rbp,%rax
   1776f:	48 83 c4 78          	add    $0x78,%rsp
   17773:	5b                   	pop    %rbx
   17774:	41 5c                	pop    %r12
   17776:	41 5d                	pop    %r13
   17778:	41 5e                	pop    %r14
   1777a:	41 5f                	pop    %r15
   1777c:	5d                   	pop    %rbp
   1777d:	c3                   	ret
   1777e:	48 c1 eb 20          	shr    $0x20,%rbx
   17782:	66 0f 6e c3          	movd   %ebx,%xmm0
   17786:	48 c1 e8 20          	shr    $0x20,%rax
   1778a:	66 0f 6e c8          	movd   %eax,%xmm1
   1778e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17793:	ff 15 6f 40 04 00    	call   *0x4406f(%rip)        # 5b808 <_DYNAMIC+0x2b0>
   17799:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1779d:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   177a2:	83 f9 02             	cmp    $0x2,%ecx
   177a5:	0f 84 70 ff ff ff    	je     1771b <hyperinterval_strict_surface32+0x3b>
   177ab:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   177af:	8b 74 24 10          	mov    0x10(%rsp),%esi
   177b3:	89 74 24 5c          	mov    %esi,0x5c(%rsp)
   177b7:	89 54 24 59          	mov    %edx,0x59(%rsp)
   177bb:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
   177bf:	88 44 24 58          	mov    %al,0x58(%rsp)
   177c3:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   177c8:	48 8d 74 24 3c       	lea    0x3c(%rsp),%rsi
   177cd:	44 89 f2             	mov    %r14d,%edx
   177d0:	ff 15 a2 40 04 00    	call   *0x440a2(%rip)        # 5b878 <_DYNAMIC+0x320>
   177d6:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   177da:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   177df:	83 f9 02             	cmp    $0x2,%ecx
   177e2:	0f 84 33 ff ff ff    	je     1771b <hyperinterval_strict_surface32+0x3b>
   177e8:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   177ec:	8b 74 24 10          	mov    0x10(%rsp),%esi
   177f0:	89 74 24 34          	mov    %esi,0x34(%rsp)
   177f4:	89 54 24 31          	mov    %edx,0x31(%rsp)
   177f8:	89 4c 24 2c          	mov    %ecx,0x2c(%rsp)
   177fc:	88 44 24 30          	mov    %al,0x30(%rsp)
   17800:	48 8d 7c 24 48       	lea    0x48(%rsp),%rdi
   17805:	48 8d 74 24 2c       	lea    0x2c(%rsp),%rsi
   1780a:	ff 15 70 40 04 00    	call   *0x44070(%rip)        # 5b880 <_DYNAMIC+0x328>
   17810:	8b 4c 24 48          	mov    0x48(%rsp),%ecx
   17814:	0f b6 44 24 4c       	movzbl 0x4c(%rsp),%eax
   17819:	83 f9 02             	cmp    $0x2,%ecx
   1781c:	0f 84 f9 fe ff ff    	je     1771b <hyperinterval_strict_surface32+0x3b>
   17822:	8b 54 24 4d          	mov    0x4d(%rsp),%edx
   17826:	8b 74 24 50          	mov    0x50(%rsp),%esi
   1782a:	89 74 24 28          	mov    %esi,0x28(%rsp)
   1782e:	89 54 24 25          	mov    %edx,0x25(%rsp)
   17832:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   17836:	88 44 24 24          	mov    %al,0x24(%rsp)
   1783a:	48 8d 5c 24 6c       	lea    0x6c(%rsp),%rbx
   1783f:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
   17844:	48 8d 54 24 54       	lea    0x54(%rsp),%rdx
   17849:	48 89 df             	mov    %rbx,%rdi
   1784c:	ff 15 36 40 04 00    	call   *0x44036(%rip)        # 5b888 <_DYNAMIC+0x330>
   17852:	4c 8d 74 24 60       	lea    0x60(%rsp),%r14
   17857:	48 8d 54 24 3c       	lea    0x3c(%rsp),%rdx
   1785c:	4c 89 f7             	mov    %r14,%rdi
   1785f:	48 89 de             	mov    %rbx,%rsi
   17862:	ff 15 28 40 04 00    	call   *0x44028(%rip)        # 5b890 <_DYNAMIC+0x338>
   17868:	4c 89 f7             	mov    %r14,%rdi
   1786b:	ff 15 27 40 04 00    	call   *0x44027(%rip)        # 5b898 <_DYNAMIC+0x340>
   17871:	8b 4c 24 60          	mov    0x60(%rsp),%ecx
   17875:	83 f9 01             	cmp    $0x1,%ecx
   17878:	75 1c                	jne    17896 <hyperinterval_strict_surface32+0x1b6>
   1787a:	8b 74 24 64          	mov    0x64(%rsp),%esi
   1787e:	8b 7c 24 68          	mov    0x68(%rsp),%edi
   17882:	39 fe                	cmp    %edi,%esi
   17884:	0f 94 c2             	sete   %dl
   17887:	66 0f 6e ce          	movd   %esi,%xmm1
   1788b:	66 0f 6e c7          	movd   %edi,%xmm0
   1788f:	be 01 00 00 00       	mov    $0x1,%esi
   17894:	eb 04                	jmp    1789a <hyperinterval_strict_surface32+0x1ba>
   17896:	31 d2                	xor    %edx,%edx
   17898:	31 f6                	xor    %esi,%esi
   1789a:	80 f1 01             	xor    $0x1,%cl
   1789d:	89 74 24 08          	mov    %esi,0x8(%rsp)
   178a1:	66 0f 7e 4c 24 0c    	movd   %xmm1,0xc(%rsp)
   178a7:	88 4c 24 10          	mov    %cl,0x10(%rsp)
   178ab:	88 54 24 11          	mov    %dl,0x11(%rsp)
   178af:	88 44 24 12          	mov    %al,0x12(%rsp)
   178b3:	89 74 24 14          	mov    %esi,0x14(%rsp)
   178b7:	66 0f 7e 44 24 18    	movd   %xmm0,0x18(%rsp)
   178bd:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   178c2:	4c 8d 6c 24 60       	lea    0x60(%rsp),%r13
   178c7:	4c 8d 74 24 54       	lea    0x54(%rsp),%r14
   178cc:	4c 89 ef             	mov    %r13,%rdi
   178cf:	4c 89 f6             	mov    %r14,%rsi
   178d2:	ff 15 c8 3f 04 00    	call   *0x43fc8(%rip)        # 5b8a0 <_DYNAMIC+0x348>
   178d8:	88 44 24 1c          	mov    %al,0x1c(%rsp)
   178dc:	4c 89 ef             	mov    %r13,%rdi
   178df:	4c 89 f6             	mov    %r14,%rsi
   178e2:	ff 15 c0 3f 04 00    	call   *0x43fc0(%rip)        # 5b8a8 <_DYNAMIC+0x350>
   178e8:	41 89 c6             	mov    %eax,%r14d
   178eb:	4c 8d 64 24 3c       	lea    0x3c(%rsp),%r12
   178f0:	4c 89 ef             	mov    %r13,%rdi
   178f3:	4c 89 e6             	mov    %r12,%rsi
   178f6:	ff 15 b4 3f 04 00    	call   *0x43fb4(%rip)        # 5b8b0 <_DYNAMIC+0x358>
   178fc:	89 c3                	mov    %eax,%ebx
   178fe:	4c 89 ef             	mov    %r13,%rdi
   17901:	4c 89 e6             	mov    %r12,%rsi
   17904:	ff 15 ae 3f 04 00    	call   *0x43fae(%rip)        # 5b8b8 <_DYNAMIC+0x360>
   1790a:	41 89 c4             	mov    %eax,%r12d
   1790d:	4c 89 ef             	mov    %r13,%rdi
   17910:	66 0f 6e 44 24 38    	movd   0x38(%rsp),%xmm0
   17916:	ff 15 84 3e 04 00    	call   *0x43e84(%rip)        # 5b7a0 <_DYNAMIC+0x248>
   1791c:	a8 01                	test   $0x1,%al
   1791e:	74 08                	je     17928 <hyperinterval_strict_surface32+0x248>
   17920:	88 55 04             	mov    %dl,0x4(%rbp)
   17923:	e9 3d fe ff ff       	jmp    17765 <hyperinterval_strict_surface32+0x85>
   17928:	0f b6 44 24 1c       	movzbl 0x1c(%rsp),%eax
   1792d:	88 44 24 08          	mov    %al,0x8(%rsp)
   17931:	44 88 74 24 09       	mov    %r14b,0x9(%rsp)
   17936:	88 5c 24 0a          	mov    %bl,0xa(%rsp)
   1793a:	44 88 64 24 0b       	mov    %r12b,0xb(%rsp)
   1793f:	88 54 24 0c          	mov    %dl,0xc(%rsp)
   17943:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   17948:	41 83 ff 01          	cmp    $0x1,%r15d
   1794c:	75 2a                	jne    17978 <hyperinterval_strict_surface32+0x298>
   1794e:	f3 0f 7e 44 24 40    	movq   0x40(%rsp),%xmm0
   17954:	66 0f ef c9          	pxor   %xmm1,%xmm1
   17958:	66 0f 6f 15 70 e2 fe 	movdqa -0x11d90(%rip),%xmm2        # 5bd0 <__abi_tag+0x58d4>
   1795f:	ff 
   17960:	66 0f ef d0          	pxor   %xmm0,%xmm2
   17964:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   17968:	66 0f df ca          	pandn  %xmm2,%xmm1
   1796c:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   17971:	b8 01 00 00 00       	mov    $0x1,%eax
   17976:	eb 02                	jmp    1797a <hyperinterval_strict_surface32+0x29a>
   17978:	31 c0                	xor    %eax,%eax
   1797a:	89 44 24 48          	mov    %eax,0x48(%rsp)
   1797e:	66 0f d6 44 24 4c    	movq   %xmm0,0x4c(%rsp)
   17984:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17989:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
   1798e:	48 8d 54 24 48       	lea    0x48(%rsp),%rdx
   17993:	ff 15 27 3f 04 00    	call   *0x43f27(%rip)        # 5b8c0 <_DYNAMIC+0x368>
   17999:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1799d:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   179a2:	83 f9 02             	cmp    $0x2,%ecx
   179a5:	0f 84 70 fd ff ff    	je     1771b <hyperinterval_strict_surface32+0x3b>
   179ab:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   179af:	8b 74 24 10          	mov    0x10(%rsp),%esi
   179b3:	89 74 24 28          	mov    %esi,0x28(%rsp)
   179b7:	89 54 24 25          	mov    %edx,0x25(%rsp)
   179bb:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   179bf:	88 44 24 24          	mov    %al,0x24(%rsp)
   179c3:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   179c8:	66 0f 6e 05 74 e1 fe 	movd   -0x11e8c(%rip),%xmm0        # 5b44 <__abi_tag+0x5848>
   179cf:	ff 
   179d0:	ff 15 4a 3e 04 00    	call   *0x43e4a(%rip)        # 5b820 <_DYNAMIC+0x2c8>
   179d6:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   179da:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   179df:	83 f9 02             	cmp    $0x2,%ecx
   179e2:	0f 84 33 fd ff ff    	je     1771b <hyperinterval_strict_surface32+0x3b>
   179e8:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   179ec:	8b 74 24 10          	mov    0x10(%rsp),%esi
   179f0:	89 74 24 34          	mov    %esi,0x34(%rsp)
   179f4:	89 54 24 31          	mov    %edx,0x31(%rsp)
   179f8:	89 4c 24 2c          	mov    %ecx,0x2c(%rsp)
   179fc:	88 44 24 30          	mov    %al,0x30(%rsp)
   17a00:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
   17a05:	48 8d 54 24 2c       	lea    0x2c(%rsp),%rdx
   17a0a:	48 89 ef             	mov    %rbp,%rdi
   17a0d:	ff 15 b5 3e 04 00    	call   *0x43eb5(%rip)        # 5b8c8 <_DYNAMIC+0x370>
   17a13:	e9 54 fd ff ff       	jmp    1776c <hyperinterval_strict_surface32+0x8c>
   17a18:	cc                   	int3
   17a19:	cc                   	int3
   17a1a:	cc                   	int3
   17a1b:	cc                   	int3
   17a1c:	cc                   	int3
   17a1d:	cc                   	int3
   17a1e:	cc                   	int3
   17a1f:	cc                   	int3

hyperinterval_strict_surface64:
   17a20:	55                   	push   %rbp
   17a21:	41 57                	push   %r15
   17a23:	41 56                	push   %r14
   17a25:	41 55                	push   %r13
   17a27:	41 54                	push   %r12
   17a29:	53                   	push   %rbx
   17a2a:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
   17a31:	89 f5                	mov    %esi,%ebp
   17a33:	48 89 fb             	mov    %rdi,%rbx
   17a36:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17a3b:	f2 0f 11 44 24 78    	movsd  %xmm0,0x78(%rsp)
   17a41:	66 0f d6 4c 24 58    	movq   %xmm1,0x58(%rsp)
   17a47:	ff 15 eb 3d 04 00    	call   *0x43deb(%rip)        # 5b838 <_DYNAMIC+0x2e0>
   17a4d:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   17a52:	49 83 fc 02          	cmp    $0x2,%r12
   17a56:	75 07                	jne    17a5f <hyperinterval_strict_surface64+0x3f>
   17a58:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17a5d:	eb 63                	jmp    17ac2 <hyperinterval_strict_surface64+0xa2>
   17a5f:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
   17a64:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
   17a69:	4c 89 a4 24 98 00 00 	mov    %r12,0x98(%rsp)
   17a70:	00 
   17a71:	4c 89 b4 24 a0 00 00 	mov    %r14,0xa0(%rsp)
   17a78:	00 
   17a79:	4c 89 bc 24 a8 00 00 	mov    %r15,0xa8(%rsp)
   17a80:	00 
   17a81:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   17a86:	f2 0f 10 44 24 78    	movsd  0x78(%rsp),%xmm0
   17a8c:	ff 15 3e 3e 04 00    	call   *0x43e3e(%rip)        # 5b8d0 <_DYNAMIC+0x378>
   17a92:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   17a97:	74 24                	je     17abd <hyperinterval_strict_surface64+0x9d>
   17a99:	f2 0f 10 44 24 40    	movsd  0x40(%rsp),%xmm0
   17a9f:	f2 0f 11 44 24 50    	movsd  %xmm0,0x50(%rsp)
   17aa5:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   17aaa:	f2 0f 10 44 24 58    	movsd  0x58(%rsp),%xmm0
   17ab0:	ff 15 22 3e 04 00    	call   *0x43e22(%rip)        # 5b8d8 <_DYNAMIC+0x380>
   17ab6:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   17abb:	75 24                	jne    17ae1 <hyperinterval_strict_surface64+0xc1>
   17abd:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
   17ac2:	88 43 08             	mov    %al,0x8(%rbx)
   17ac5:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   17acc:	48 89 d8             	mov    %rbx,%rax
   17acf:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
   17ad6:	5b                   	pop    %rbx
   17ad7:	41 5c                	pop    %r12
   17ad9:	41 5d                	pop    %r13
   17adb:	41 5e                	pop    %r14
   17add:	41 5f                	pop    %r15
   17adf:	5d                   	pop    %rbp
   17ae0:	c3                   	ret
   17ae1:	f3 0f 7e 4c 24 40    	movq   0x40(%rsp),%xmm1
   17ae7:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17aec:	f2 0f 10 44 24 50    	movsd  0x50(%rsp),%xmm0
   17af2:	ff 15 40 3d 04 00    	call   *0x43d40(%rip)        # 5b838 <_DYNAMIC+0x2e0>
   17af8:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17afd:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17b02:	48 83 f9 02          	cmp    $0x2,%rcx
   17b06:	74 ba                	je     17ac2 <hyperinterval_strict_surface64+0xa2>
   17b08:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   17b0d:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   17b12:	48 89 b4 24 c0 00 00 	mov    %rsi,0xc0(%rsp)
   17b19:	00 
   17b1a:	48 89 94 24 b9 00 00 	mov    %rdx,0xb9(%rsp)
   17b21:	00 
   17b22:	48 89 8c 24 b0 00 00 	mov    %rcx,0xb0(%rsp)
   17b29:	00 
   17b2a:	88 84 24 b8 00 00 00 	mov    %al,0xb8(%rsp)
   17b31:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17b36:	48 8d b4 24 98 00 00 	lea    0x98(%rsp),%rsi
   17b3d:	00 
   17b3e:	89 ea                	mov    %ebp,%edx
   17b40:	ff 15 9a 3d 04 00    	call   *0x43d9a(%rip)        # 5b8e0 <_DYNAMIC+0x388>
   17b46:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17b4b:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17b50:	48 83 f9 02          	cmp    $0x2,%rcx
   17b54:	0f 84 68 ff ff ff    	je     17ac2 <hyperinterval_strict_surface64+0xa2>
   17b5a:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   17b5f:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   17b64:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
   17b69:	48 89 54 24 41       	mov    %rdx,0x41(%rsp)
   17b6e:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
   17b73:	88 44 24 40          	mov    %al,0x40(%rsp)
   17b77:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   17b7e:	00 
   17b7f:	48 8d 74 24 38       	lea    0x38(%rsp),%rsi
   17b84:	ff 15 5e 3d 04 00    	call   *0x43d5e(%rip)        # 5b8e8 <_DYNAMIC+0x390>
   17b8a:	48 8b 8c 24 80 00 00 	mov    0x80(%rsp),%rcx
   17b91:	00 
   17b92:	0f b6 84 24 88 00 00 	movzbl 0x88(%rsp),%eax
   17b99:	00 
   17b9a:	48 83 f9 02          	cmp    $0x2,%rcx
   17b9e:	0f 84 1e ff ff ff    	je     17ac2 <hyperinterval_strict_surface64+0xa2>
   17ba4:	48 8b 94 24 89 00 00 	mov    0x89(%rsp),%rdx
   17bab:	00 
   17bac:	48 8b b4 24 90 00 00 	mov    0x90(%rsp),%rsi
   17bb3:	00 
   17bb4:	48 89 74 24 70       	mov    %rsi,0x70(%rsp)
   17bb9:	48 89 54 24 69       	mov    %rdx,0x69(%rsp)
   17bbe:	48 89 4c 24 60       	mov    %rcx,0x60(%rsp)
   17bc3:	88 44 24 68          	mov    %al,0x68(%rsp)
   17bc7:	48 8d ac 24 e0 00 00 	lea    0xe0(%rsp),%rbp
   17bce:	00 
   17bcf:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
   17bd4:	48 8d 94 24 b0 00 00 	lea    0xb0(%rsp),%rdx
   17bdb:	00 
   17bdc:	48 89 ef             	mov    %rbp,%rdi
   17bdf:	ff 15 0b 3d 04 00    	call   *0x43d0b(%rip)        # 5b8f0 <_DYNAMIC+0x398>
   17be5:	4c 8d ac 24 c8 00 00 	lea    0xc8(%rsp),%r13
   17bec:	00 
   17bed:	48 8d 94 24 98 00 00 	lea    0x98(%rsp),%rdx
   17bf4:	00 
   17bf5:	4c 89 ef             	mov    %r13,%rdi
   17bf8:	48 89 ee             	mov    %rbp,%rsi
   17bfb:	ff 15 f7 3c 04 00    	call   *0x43cf7(%rip)        # 5b8f8 <_DYNAMIC+0x3a0>
   17c01:	4c 89 ef             	mov    %r13,%rdi
   17c04:	ff 15 f6 3c 04 00    	call   *0x43cf6(%rip)        # 5b900 <_DYNAMIC+0x3a8>
   17c0a:	48 8b 8c 24 c8 00 00 	mov    0xc8(%rsp),%rcx
   17c11:	00 
   17c12:	48 83 f9 01          	cmp    $0x1,%rcx
   17c16:	75 27                	jne    17c3f <hyperinterval_strict_surface64+0x21f>
   17c18:	48 8b b4 24 d0 00 00 	mov    0xd0(%rsp),%rsi
   17c1f:	00 
   17c20:	48 8b bc 24 d8 00 00 	mov    0xd8(%rsp),%rdi
   17c27:	00 
   17c28:	48 39 fe             	cmp    %rdi,%rsi
   17c2b:	0f 94 c2             	sete   %dl
   17c2e:	66 48 0f 6e ce       	movq   %rsi,%xmm1
   17c33:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   17c38:	be 01 00 00 00       	mov    $0x1,%esi
   17c3d:	eb 04                	jmp    17c43 <hyperinterval_strict_surface64+0x223>
   17c3f:	31 d2                	xor    %edx,%edx
   17c41:	31 f6                	xor    %esi,%esi
   17c43:	80 f1 01             	xor    $0x1,%cl
   17c46:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
   17c4b:	66 0f d6 4c 24 18    	movq   %xmm1,0x18(%rsp)
   17c51:	88 4c 24 20          	mov    %cl,0x20(%rsp)
   17c55:	88 54 24 21          	mov    %dl,0x21(%rsp)
   17c59:	88 44 24 22          	mov    %al,0x22(%rsp)
   17c5d:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
   17c62:	66 0f d6 44 24 30    	movq   %xmm0,0x30(%rsp)
   17c68:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
   17c6d:	4c 8d ac 24 c8 00 00 	lea    0xc8(%rsp),%r13
   17c74:	00 
   17c75:	48 8d ac 24 b0 00 00 	lea    0xb0(%rsp),%rbp
   17c7c:	00 
   17c7d:	4c 89 ef             	mov    %r13,%rdi
   17c80:	48 89 ee             	mov    %rbp,%rsi
   17c83:	ff 15 7f 3c 04 00    	call   *0x43c7f(%rip)        # 5b908 <_DYNAMIC+0x3b0>
   17c89:	88 44 24 58          	mov    %al,0x58(%rsp)
   17c8d:	4c 89 ef             	mov    %r13,%rdi
   17c90:	48 89 ee             	mov    %rbp,%rsi
   17c93:	ff 15 77 3c 04 00    	call   *0x43c77(%rip)        # 5b910 <_DYNAMIC+0x3b8>
   17c99:	88 44 24 50          	mov    %al,0x50(%rsp)
   17c9d:	48 8d ac 24 98 00 00 	lea    0x98(%rsp),%rbp
   17ca4:	00 
   17ca5:	4c 89 ef             	mov    %r13,%rdi
   17ca8:	48 89 ee             	mov    %rbp,%rsi
   17cab:	ff 15 67 3c 04 00    	call   *0x43c67(%rip)        # 5b918 <_DYNAMIC+0x3c0>
   17cb1:	88 44 24 0f          	mov    %al,0xf(%rsp)
   17cb5:	4c 89 ef             	mov    %r13,%rdi
   17cb8:	48 89 ee             	mov    %rbp,%rsi
   17cbb:	ff 15 5f 3c 04 00    	call   *0x43c5f(%rip)        # 5b920 <_DYNAMIC+0x3c8>
   17cc1:	89 c5                	mov    %eax,%ebp
   17cc3:	4c 89 ef             	mov    %r13,%rdi
   17cc6:	f2 0f 10 44 24 78    	movsd  0x78(%rsp),%xmm0
   17ccc:	ff 15 c6 3a 04 00    	call   *0x43ac6(%rip)        # 5b798 <_DYNAMIC+0x240>
   17cd2:	a8 01                	test   $0x1,%al
   17cd4:	74 08                	je     17cde <hyperinterval_strict_surface64+0x2be>
   17cd6:	88 53 08             	mov    %dl,0x8(%rbx)
   17cd9:	e9 e7 fd ff ff       	jmp    17ac5 <hyperinterval_strict_surface64+0xa5>
   17cde:	0f b6 44 24 58       	movzbl 0x58(%rsp),%eax
   17ce3:	88 44 24 10          	mov    %al,0x10(%rsp)
   17ce7:	0f b6 44 24 50       	movzbl 0x50(%rsp),%eax
   17cec:	88 44 24 11          	mov    %al,0x11(%rsp)
   17cf0:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
   17cf5:	88 44 24 12          	mov    %al,0x12(%rsp)
   17cf9:	40 88 6c 24 13       	mov    %bpl,0x13(%rsp)
   17cfe:	88 54 24 14          	mov    %dl,0x14(%rsp)
   17d02:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
   17d07:	41 83 fc 01          	cmp    $0x1,%r12d
   17d0b:	75 28                	jne    17d35 <hyperinterval_strict_surface64+0x315>
   17d0d:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   17d14:	00 00 80 
   17d17:	4c 89 f9             	mov    %r15,%rcx
   17d1a:	48 31 c1             	xor    %rax,%rcx
   17d1d:	4d 85 ff             	test   %r15,%r15
   17d20:	49 0f 44 cf          	cmove  %r15,%rcx
   17d24:	4c 31 f0             	xor    %r14,%rax
   17d27:	4d 85 f6             	test   %r14,%r14
   17d2a:	49 0f 44 c6          	cmove  %r14,%rax
   17d2e:	ba 01 00 00 00       	mov    $0x1,%edx
   17d33:	eb 02                	jmp    17d37 <hyperinterval_strict_surface64+0x317>
   17d35:	31 d2                	xor    %edx,%edx
   17d37:	48 89 94 24 80 00 00 	mov    %rdx,0x80(%rsp)
   17d3e:	00 
   17d3f:	48 89 8c 24 88 00 00 	mov    %rcx,0x88(%rsp)
   17d46:	00 
   17d47:	48 89 84 24 90 00 00 	mov    %rax,0x90(%rsp)
   17d4e:	00 
   17d4f:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17d54:	48 8d b4 24 c8 00 00 	lea    0xc8(%rsp),%rsi
   17d5b:	00 
   17d5c:	48 8d 94 24 80 00 00 	lea    0x80(%rsp),%rdx
   17d63:	00 
   17d64:	ff 15 be 3b 04 00    	call   *0x43bbe(%rip)        # 5b928 <_DYNAMIC+0x3d0>
   17d6a:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17d6f:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17d74:	48 83 f9 02          	cmp    $0x2,%rcx
   17d78:	0f 84 44 fd ff ff    	je     17ac2 <hyperinterval_strict_surface64+0xa2>
   17d7e:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   17d83:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   17d88:	48 89 74 24 70       	mov    %rsi,0x70(%rsp)
   17d8d:	48 89 54 24 69       	mov    %rdx,0x69(%rsp)
   17d92:	48 89 4c 24 60       	mov    %rcx,0x60(%rsp)
   17d97:	88 44 24 68          	mov    %al,0x68(%rsp)
   17d9b:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17da0:	f2 0f 10 05 08 dd fe 	movsd  -0x122f8(%rip),%xmm0        # 5ab0 <__abi_tag+0x57b4>
   17da7:	ff 
   17da8:	ff 15 a2 3a 04 00    	call   *0x43aa2(%rip)        # 5b850 <_DYNAMIC+0x2f8>
   17dae:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17db3:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17db8:	48 83 f9 02          	cmp    $0x2,%rcx
   17dbc:	0f 84 00 fd ff ff    	je     17ac2 <hyperinterval_strict_surface64+0xa2>
   17dc2:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   17dc7:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   17dcc:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
   17dd1:	48 89 54 24 41       	mov    %rdx,0x41(%rsp)
   17dd6:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
   17ddb:	88 44 24 40          	mov    %al,0x40(%rsp)
   17ddf:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
   17de4:	48 8d 54 24 38       	lea    0x38(%rsp),%rdx
   17de9:	48 89 df             	mov    %rbx,%rdi
   17dec:	ff 15 3e 3b 04 00    	call   *0x43b3e(%rip)        # 5b930 <_DYNAMIC+0x3d8>
   17df2:	e9 d5 fc ff ff       	jmp    17acc <hyperinterval_strict_surface64+0xac>
   17df7:	cc                   	int3
   17df8:	cc                   	int3
   17df9:	cc                   	int3
   17dfa:	cc                   	int3
   17dfb:	cc                   	int3
   17dfc:	cc                   	int3
   17dfd:	cc                   	int3
   17dfe:	cc                   	int3
   17dff:	cc                   	int3

<hyperinterval::ieee::Format>::finite:
   17e50:	48 89 c8             	mov    %rcx,%rax
   17e53:	48 f7 d0             	not    %rax
   17e56:	48 85 d0             	test   %rdx,%rax
   17e59:	75 09                	jne    17e64 <<hyperinterval::ieee::Format>::finite+0x14>
   17e5b:	c6 47 01 00          	movb   $0x0,0x1(%rdi)
   17e5f:	b0 01                	mov    $0x1,%al
   17e61:	88 07                	mov    %al,(%rdi)
   17e63:	c3                   	ret
   17e64:	48 ff ce             	dec    %rsi
   17e67:	48 85 f1             	test   %rsi,%rcx
   17e6a:	74 09                	je     17e75 <<hyperinterval::ieee::Format>::finite+0x25>
   17e6c:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   17e70:	31 c0                	xor    %eax,%eax
   17e72:	88 07                	mov    %al,(%rdi)
   17e74:	c3                   	ret
   17e75:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
   17e7c:	00 
   17e7d:	31 c0                	xor    %eax,%eax
   17e7f:	88 07                	mov    %al,(%rdi)
   17e81:	c3                   	ret
   17e82:	cc                   	int3
   17e83:	cc                   	int3
   17e84:	cc                   	int3
   17e85:	cc                   	int3
   17e86:	cc                   	int3
   17e87:	cc                   	int3
   17e88:	cc                   	int3
   17e89:	cc                   	int3
   17e8a:	cc                   	int3
   17e8b:	cc                   	int3
   17e8c:	cc                   	int3
   17e8d:	cc                   	int3
   17e8e:	cc                   	int3
   17e8f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::reciprocal:
   17e90:	41 57                	push   %r15
   17e92:	41 56                	push   %r14
   17e94:	41 54                	push   %r12
   17e96:	53                   	push   %rbx
   17e97:	48 83 ec 28          	sub    $0x28,%rsp
   17e9b:	48 89 fb             	mov    %rdi,%rbx
   17e9e:	83 3e 00             	cmpl   $0x0,(%rsi)
   17ea1:	74 5e                	je     17f01 <<hyperinterval::float::F32Enclosure>::reciprocal+0x71>
   17ea3:	49 89 f6             	mov    %rsi,%r14
   17ea6:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   17eac:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17eb1:	be 00 00 00 80       	mov    $0x80000000,%esi
   17eb6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17ebb:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   17ec0:	e8 8b ff ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   17ec5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   17eca:	74 25                	je     17ef1 <<hyperinterval::float::F32Enclosure>::reciprocal+0x61>
   17ecc:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   17ed1:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17ed6:	be 00 00 00 80       	mov    $0x80000000,%esi
   17edb:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17ee0:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   17ee5:	e8 66 ff ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   17eea:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   17eef:	75 25                	jne    17f16 <<hyperinterval::float::F32Enclosure>::reciprocal+0x86>
   17ef1:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   17ef6:	88 4b 04             	mov    %cl,0x4(%rbx)
   17ef9:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17eff:	eb 06                	jmp    17f07 <<hyperinterval::float::F32Enclosure>::reciprocal+0x77>
   17f01:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   17f07:	48 89 d8             	mov    %rbx,%rax
   17f0a:	48 83 c4 28          	add    $0x28,%rsp
   17f0e:	5b                   	pop    %rbx
   17f0f:	41 5c                	pop    %r12
   17f11:	41 5e                	pop    %r14
   17f13:	41 5f                	pop    %r15
   17f15:	c3                   	ret
   17f16:	8b 44 24 10          	mov    0x10(%rsp),%eax
   17f1a:	44 89 e1             	mov    %r12d,%ecx
   17f1d:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   17f23:	89 c2                	mov    %eax,%edx
   17f25:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   17f2b:	be 00 00 00 80       	mov    $0x80000000,%esi
   17f30:	29 ce                	sub    %ecx,%esi
   17f32:	44 09 f9             	or     %r15d,%ecx
   17f35:	45 85 e4             	test   %r12d,%r12d
   17f38:	48 0f 49 f1          	cmovns %rcx,%rsi
   17f3c:	89 d1                	mov    %edx,%ecx
   17f3e:	44 09 f9             	or     %r15d,%ecx
   17f41:	41 29 d7             	sub    %edx,%r15d
   17f44:	85 c0                	test   %eax,%eax
   17f46:	4c 0f 49 f9          	cmovns %rcx,%r15
   17f4a:	b1 01                	mov    $0x1,%cl
   17f4c:	44 39 fe             	cmp    %r15d,%esi
   17f4f:	77 a5                	ja     17ef6 <<hyperinterval::float::F32Enclosure>::reciprocal+0x66>
   17f51:	44 89 e1             	mov    %r12d,%ecx
   17f54:	c1 e9 08             	shr    $0x8,%ecx
   17f57:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%rsp)
   17f5e:	00 
   17f5f:	44 88 64 24 20       	mov    %r12b,0x20(%rsp)
   17f64:	41 c1 ec 18          	shr    $0x18,%r12d
   17f68:	44 88 64 24 23       	mov    %r12b,0x23(%rsp)
   17f6d:	66 89 4c 24 21       	mov    %cx,0x21(%rsp)
   17f72:	89 44 24 24          	mov    %eax,0x24(%rsp)
   17f76:	41 83 7e 04 00       	cmpl   $0x0,0x4(%r14)
   17f7b:	7f 15                	jg     17f92 <<hyperinterval::float::F32Enclosure>::reciprocal+0x102>
   17f7d:	41 8b 46 08          	mov    0x8(%r14),%eax
   17f81:	85 c0                	test   %eax,%eax
   17f83:	0f 99 c1             	setns  %cl
   17f86:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   17f8b:	0f 94 c0             	sete   %al
   17f8e:	08 c8                	or     %cl,%al
   17f90:	75 1a                	jne    17fac <<hyperinterval::float::F32Enclosure>::reciprocal+0x11c>
   17f92:	48 8d 74 24 1c       	lea    0x1c(%rsp),%rsi
   17f97:	48 89 df             	mov    %rbx,%rdi
   17f9a:	4c 89 f2             	mov    %r14,%rdx
   17f9d:	b9 01 00 00 00       	mov    $0x1,%ecx
   17fa2:	e8 d9 02 00 00       	call   18280 <<hyperinterval::float::F32Enclosure>::corner_image>
   17fa7:	e9 5b ff ff ff       	jmp    17f07 <<hyperinterval::float::F32Enclosure>::reciprocal+0x77>
   17fac:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
   17fb0:	e9 44 ff ff ff       	jmp    17ef9 <<hyperinterval::float::F32Enclosure>::reciprocal+0x69>
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

<hyperinterval::float::F32Enclosure>::checked_pow:
   17fc0:	55                   	push   %rbp
   17fc1:	41 57                	push   %r15
   17fc3:	41 56                	push   %r14
   17fc5:	41 55                	push   %r13
   17fc7:	41 54                	push   %r12
   17fc9:	53                   	push   %rbx
   17fca:	48 83 ec 58          	sub    $0x58,%rsp
   17fce:	48 89 fb             	mov    %rdi,%rbx
   17fd1:	83 fa 02             	cmp    $0x2,%edx
   17fd4:	75 0b                	jne    17fe1 <<hyperinterval::float::F32Enclosure>::checked_pow+0x21>
   17fd6:	48 89 df             	mov    %rbx,%rdi
   17fd9:	ff 15 39 38 04 00    	call   *0x43839(%rip)        # 5b818 <_DYNAMIC+0x2c0>
   17fdf:	eb 78                	jmp    18059 <<hyperinterval::float::F32Enclosure>::checked_pow+0x99>
   17fe1:	f6 06 01             	testb  $0x1,(%rsi)
   17fe4:	74 6d                	je     18053 <<hyperinterval::float::F32Enclosure>::checked_pow+0x93>
   17fe6:	89 d5                	mov    %edx,%ebp
   17fe8:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   17fee:	8b 4e 04             	mov    0x4(%rsi),%ecx
   17ff1:	48 89 74 24 50       	mov    %rsi,0x50(%rsp)
   17ff6:	44 8b 7e 08          	mov    0x8(%rsi),%r15d
   17ffa:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17fff:	be 00 00 00 80       	mov    $0x80000000,%esi
   18004:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18009:	41 89 e8             	mov    %ebp,%r8d
   1800c:	e8 6f 20 00 00       	call   1a080 <<hyperinterval::ieee::Format>::power>
   18011:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   18016:	75 2b                	jne    18043 <<hyperinterval::float::F32Enclosure>::checked_pow+0x83>
   18018:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   1801d:	44 8b 6c 24 18       	mov    0x18(%rsp),%r13d
   18022:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18027:	be 00 00 00 80       	mov    $0x80000000,%esi
   1802c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18031:	4c 89 f9             	mov    %r15,%rcx
   18034:	41 89 e8             	mov    %ebp,%r8d
   18037:	e8 44 20 00 00       	call   1a080 <<hyperinterval::ieee::Format>::power>
   1803c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18041:	75 28                	jne    1806b <<hyperinterval::float::F32Enclosure>::checked_pow+0xab>
   18043:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   18048:	88 43 04             	mov    %al,0x4(%rbx)
   1804b:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18051:	eb 06                	jmp    18059 <<hyperinterval::float::F32Enclosure>::checked_pow+0x99>
   18053:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   18059:	48 89 d8             	mov    %rbx,%rax
   1805c:	48 83 c4 58          	add    $0x58,%rsp
   18060:	5b                   	pop    %rbx
   18061:	41 5c                	pop    %r12
   18063:	41 5d                	pop    %r13
   18065:	41 5e                	pop    %r14
   18067:	41 5f                	pop    %r15
   18069:	5d                   	pop    %rbp
   1806a:	c3                   	ret
   1806b:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   18070:	8b 44 24 18          	mov    0x18(%rsp),%eax
   18074:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   18079:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1807e:	be 00 00 00 80       	mov    $0x80000000,%esi
   18083:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18088:	4c 89 e1             	mov    %r12,%rcx
   1808b:	e8 c0 fd ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   18090:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18095:	74 23                	je     180ba <<hyperinterval::float::F32Enclosure>::checked_pow+0xfa>
   18097:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1809c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   180a1:	be 00 00 00 80       	mov    $0x80000000,%esi
   180a6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   180ab:	4c 89 e9             	mov    %r13,%rcx
   180ae:	e8 9d fd ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   180b3:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   180b8:	75 10                	jne    180ca <<hyperinterval::float::F32Enclosure>::checked_pow+0x10a>
   180ba:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   180bf:	88 4b 04             	mov    %cl,0x4(%rbx)
   180c2:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   180c8:	eb 8f                	jmp    18059 <<hyperinterval::float::F32Enclosure>::checked_pow+0x99>
   180ca:	8b 44 24 10          	mov    0x10(%rsp),%eax
   180ce:	44 89 e1             	mov    %r12d,%ecx
   180d1:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   180d7:	89 c2                	mov    %eax,%edx
   180d9:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   180df:	be 00 00 00 80       	mov    $0x80000000,%esi
   180e4:	29 ce                	sub    %ecx,%esi
   180e6:	44 09 f1             	or     %r14d,%ecx
   180e9:	45 85 e4             	test   %r12d,%r12d
   180ec:	48 0f 49 f1          	cmovns %rcx,%rsi
   180f0:	bf 00 00 00 80       	mov    $0x80000000,%edi
   180f5:	29 d7                	sub    %edx,%edi
   180f7:	89 d1                	mov    %edx,%ecx
   180f9:	44 09 f1             	or     %r14d,%ecx
   180fc:	85 c0                	test   %eax,%eax
   180fe:	48 0f 49 f9          	cmovns %rcx,%rdi
   18102:	b1 01                	mov    $0x1,%cl
   18104:	39 fe                	cmp    %edi,%esi
   18106:	77 b7                	ja     180bf <<hyperinterval::float::F32Enclosure>::checked_pow+0xff>
   18108:	44 89 e1             	mov    %r12d,%ecx
   1810b:	c1 e9 08             	shr    $0x8,%ecx
   1810e:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%rsp)
   18115:	00 
   18116:	44 88 64 24 30       	mov    %r12b,0x30(%rsp)
   1811b:	41 c1 ec 18          	shr    $0x18,%r12d
   1811f:	44 88 64 24 33       	mov    %r12b,0x33(%rsp)
   18124:	66 89 4c 24 31       	mov    %cx,0x31(%rsp)
   18129:	89 44 24 34          	mov    %eax,0x34(%rsp)
   1812d:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18132:	be 00 00 00 80       	mov    $0x80000000,%esi
   18137:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1813c:	4c 89 f9             	mov    %r15,%rcx
   1813f:	e8 0c fd ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   18144:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18149:	0f 84 6b ff ff ff    	je     180ba <<hyperinterval::float::F32Enclosure>::checked_pow+0xfa>
   1814f:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   18154:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18159:	be 00 00 00 80       	mov    $0x80000000,%esi
   1815e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18163:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   18168:	e8 e3 fc ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1816d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18172:	0f 84 42 ff ff ff    	je     180ba <<hyperinterval::float::F32Enclosure>::checked_pow+0xfa>
   18178:	8b 44 24 10          	mov    0x10(%rsp),%eax
   1817c:	44 89 f9             	mov    %r15d,%ecx
   1817f:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18185:	89 c2                	mov    %eax,%edx
   18187:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1818d:	be 00 00 00 80       	mov    $0x80000000,%esi
   18192:	29 ce                	sub    %ecx,%esi
   18194:	44 09 f1             	or     %r14d,%ecx
   18197:	45 85 ff             	test   %r15d,%r15d
   1819a:	48 0f 49 f1          	cmovns %rcx,%rsi
   1819e:	89 d1                	mov    %edx,%ecx
   181a0:	44 09 f1             	or     %r14d,%ecx
   181a3:	41 29 d6             	sub    %edx,%r14d
   181a6:	85 c0                	test   %eax,%eax
   181a8:	4c 0f 49 f1          	cmovns %rcx,%r14
   181ac:	b1 01                	mov    $0x1,%cl
   181ae:	44 39 f6             	cmp    %r14d,%esi
   181b1:	0f 87 08 ff ff ff    	ja     180bf <<hyperinterval::float::F32Enclosure>::checked_pow+0xff>
   181b7:	44 89 f9             	mov    %r15d,%ecx
   181ba:	c1 e9 08             	shr    $0x8,%ecx
   181bd:	c7 44 24 20 01 00 00 	movl   $0x1,0x20(%rsp)
   181c4:	00 
   181c5:	44 88 7c 24 24       	mov    %r15b,0x24(%rsp)
   181ca:	41 c1 ef 18          	shr    $0x18,%r15d
   181ce:	44 88 7c 24 27       	mov    %r15b,0x27(%rsp)
   181d3:	66 89 4c 24 25       	mov    %cx,0x25(%rsp)
   181d8:	89 44 24 28          	mov    %eax,0x28(%rsp)
   181dc:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   181e1:	48 8d 74 24 2c       	lea    0x2c(%rsp),%rsi
   181e6:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
   181eb:	ff 15 9f 36 04 00    	call   *0x4369f(%rip)        # 5b890 <_DYNAMIC+0x338>
   181f1:	85 ed                	test   %ebp,%ebp
   181f3:	0f 95 c0             	setne  %al
   181f6:	40 f6 c5 01          	test   $0x1,%bpl
   181fa:	0f 94 c1             	sete   %cl
   181fd:	84 c8                	test   %cl,%al
   181ff:	74 6a                	je     1826b <<hyperinterval::float::F32Enclosure>::checked_pow+0x2ab>
   18201:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   18206:	ff 15 8c 36 04 00    	call   *0x4368c(%rip)        # 5b898 <_DYNAMIC+0x340>
   1820c:	a8 02                	test   $0x2,%al
   1820e:	74 5b                	je     1826b <<hyperinterval::float::F32Enclosure>::checked_pow+0x2ab>
   18210:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18215:	e8 96 15 00 00       	call   197b0 <<hyperinterval::float::F32Enclosure>::from_bits>
   1821a:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1821e:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   18223:	83 f9 02             	cmp    $0x2,%ecx
   18226:	0f 84 1c fe ff ff    	je     18048 <<hyperinterval::float::F32Enclosure>::checked_pow+0x88>
   1822c:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   18230:	8b 74 24 10          	mov    0x10(%rsp),%esi
   18234:	89 74 24 28          	mov    %esi,0x28(%rsp)
   18238:	89 54 24 25          	mov    %edx,0x25(%rsp)
   1823c:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   18240:	88 44 24 24          	mov    %al,0x24(%rsp)
   18244:	48 8d 7c 24 2c       	lea    0x2c(%rsp),%rdi
   18249:	48 8d 74 24 38       	lea    0x38(%rsp),%rsi
   1824e:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
   18253:	ff 15 37 36 04 00    	call   *0x43637(%rip)        # 5b890 <_DYNAMIC+0x338>
   18259:	8b 44 24 34          	mov    0x34(%rsp),%eax
   1825d:	89 44 24 40          	mov    %eax,0x40(%rsp)
   18261:	48 8b 44 24 2c       	mov    0x2c(%rsp),%rax
   18266:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1826b:	8b 44 24 40          	mov    0x40(%rsp),%eax
   1826f:	89 43 08             	mov    %eax,0x8(%rbx)
   18272:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   18277:	48 89 03             	mov    %rax,(%rbx)
   1827a:	e9 da fd ff ff       	jmp    18059 <<hyperinterval::float::F32Enclosure>::checked_pow+0x99>
   1827f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::corner_image:
   18280:	55                   	push   %rbp
   18281:	41 57                	push   %r15
   18283:	41 56                	push   %r14
   18285:	41 55                	push   %r13
   18287:	41 54                	push   %r12
   18289:	53                   	push   %rbx
   1828a:	48 83 ec 58          	sub    $0x58,%rsp
   1828e:	48 89 fb             	mov    %rdi,%rbx
   18291:	f6 06 01             	testb  $0x1,(%rsi)
   18294:	74 53                	je     182e9 <<hyperinterval::float::F32Enclosure>::corner_image+0x69>
   18296:	f6 02 01             	testb  $0x1,(%rdx)
   18299:	74 4e                	je     182e9 <<hyperinterval::float::F32Enclosure>::corner_image+0x69>
   1829b:	44 8b 62 04          	mov    0x4(%rdx),%r12d
   1829f:	8b 42 08             	mov    0x8(%rdx),%eax
   182a2:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   182a7:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
   182ab:	8b 46 08             	mov    0x8(%rsi),%eax
   182ae:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   182b3:	41 89 cf             	mov    %ecx,%r15d
   182b6:	84 c9                	test   %cl,%cl
   182b8:	74 3a                	je     182f4 <<hyperinterval::float::F32Enclosure>::corner_image+0x74>
   182ba:	48 89 e7             	mov    %rsp,%rdi
   182bd:	be 00 00 00 80       	mov    $0x80000000,%esi
   182c2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   182c7:	4c 89 e9             	mov    %r13,%rcx
   182ca:	4d 89 e0             	mov    %r12,%r8
   182cd:	e8 6e 19 00 00       	call   19c40 <<hyperinterval::ieee::Format>::div>
   182d2:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   182d6:	0f 85 fc 00 00 00    	jne    183d8 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   182dc:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   182e0:	8b 6c 24 10          	mov    0x10(%rsp),%ebp
   182e4:	e9 b7 00 00 00       	jmp    183a0 <<hyperinterval::float::F32Enclosure>::corner_image+0x120>
   182e9:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   182ef:	e9 f3 00 00 00       	jmp    183e7 <<hyperinterval::float::F32Enclosure>::corner_image+0x167>
   182f4:	44 89 e8             	mov    %r13d,%eax
   182f7:	c1 e8 17             	shr    $0x17,%eax
   182fa:	0f b6 c0             	movzbl %al,%eax
   182fd:	44 89 e9             	mov    %r13d,%ecx
   18300:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   18306:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   1830d:	8d b0 6a ff ff ff    	lea    -0x96(%rax),%esi
   18313:	85 c0                	test   %eax,%eax
   18315:	b8 6b ff ff ff       	mov    $0xffffff6b,%eax
   1831a:	0f 44 f0             	cmove  %eax,%esi
   1831d:	48 0f 44 d1          	cmove  %rcx,%rdx
   18321:	44 89 e1             	mov    %r12d,%ecx
   18324:	c1 e9 17             	shr    $0x17,%ecx
   18327:	0f b6 c9             	movzbl %cl,%ecx
   1832a:	44 89 ef             	mov    %r13d,%edi
   1832d:	44 31 e7             	xor    %r12d,%edi
   18330:	45 89 e0             	mov    %r12d,%r8d
   18333:	41 81 e0 ff ff 7f 00 	and    $0x7fffff,%r8d
   1833a:	4d 8d 88 00 00 80 00 	lea    0x800000(%r8),%r9
   18341:	44 8d 91 6a ff ff ff 	lea    -0x96(%rcx),%r10d
   18348:	85 c9                	test   %ecx,%ecx
   1834a:	44 0f 44 d0          	cmove  %eax,%r10d
   1834e:	4d 0f 44 c8          	cmove  %r8,%r9
   18352:	4c 0f af ca          	imul   %rdx,%r9
   18356:	41 01 f2             	add    %esi,%r10d
   18359:	c1 ef 1f             	shr    $0x1f,%edi
   1835c:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
   18361:	4c 89 0c 24          	mov    %r9,(%rsp)
   18365:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   1836c:	00 00 
   1836e:	44 89 54 24 10       	mov    %r10d,0x10(%rsp)
   18373:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   18378:	48 89 e1             	mov    %rsp,%rcx
   1837b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18380:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18385:	e8 06 21 00 00       	call   1a490 <<hyperinterval::ieee::Format>::rounded>
   1838a:	80 7c 24 20 00       	cmpb   $0x0,0x20(%rsp)
   1838f:	74 07                	je     18398 <<hyperinterval::float::F32Enclosure>::corner_image+0x118>
   18391:	0f b6 6c 24 21       	movzbl 0x21(%rsp),%ebp
   18396:	eb 45                	jmp    183dd <<hyperinterval::float::F32Enclosure>::corner_image+0x15d>
   18398:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
   1839c:	8b 6c 24 30          	mov    0x30(%rsp),%ebp
   183a0:	48 89 e7             	mov    %rsp,%rdi
   183a3:	be 00 00 00 80       	mov    $0x80000000,%esi
   183a8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   183ad:	e8 9e fa ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   183b2:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   183b6:	75 20                	jne    183d8 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   183b8:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   183bd:	48 89 e7             	mov    %rsp,%rdi
   183c0:	be 00 00 00 80       	mov    $0x80000000,%esi
   183c5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   183ca:	48 89 e9             	mov    %rbp,%rcx
   183cd:	e8 7e fa ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   183d2:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   183d6:	74 1e                	je     183f6 <<hyperinterval::float::F32Enclosure>::corner_image+0x176>
   183d8:	0f b6 6c 24 01       	movzbl 0x1(%rsp),%ebp
   183dd:	40 88 6b 04          	mov    %bpl,0x4(%rbx)
   183e1:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   183e7:	48 83 c4 58          	add    $0x58,%rsp
   183eb:	5b                   	pop    %rbx
   183ec:	41 5c                	pop    %r12
   183ee:	41 5d                	pop    %r13
   183f0:	41 5e                	pop    %r14
   183f2:	41 5f                	pop    %r15
   183f4:	5d                   	pop    %rbp
   183f5:	c3                   	ret
   183f6:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   183fb:	44 89 f0             	mov    %r14d,%eax
   183fe:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18403:	89 f9                	mov    %edi,%ecx
   18405:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1840b:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18410:	29 c2                	sub    %eax,%edx
   18412:	be 00 00 00 80       	mov    $0x80000000,%esi
   18417:	09 f0                	or     %esi,%eax
   18419:	45 85 f6             	test   %r14d,%r14d
   1841c:	48 0f 49 d0          	cmovns %rax,%rdx
   18420:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18425:	29 c8                	sub    %ecx,%eax
   18427:	09 f1                	or     %esi,%ecx
   18429:	85 ff                	test   %edi,%edi
   1842b:	48 0f 49 c1          	cmovns %rcx,%rax
   1842f:	40 b5 01             	mov    $0x1,%bpl
   18432:	39 c2                	cmp    %eax,%edx
   18434:	77 a7                	ja     183dd <<hyperinterval::float::F32Enclosure>::corner_image+0x15d>
   18436:	48 89 7c 24 50       	mov    %rdi,0x50(%rsp)
   1843b:	45 84 ff             	test   %r15b,%r15b
   1843e:	74 2d                	je     1846d <<hyperinterval::float::F32Enclosure>::corner_image+0x1ed>
   18440:	48 89 e7             	mov    %rsp,%rdi
   18443:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18448:	4c 89 e9             	mov    %r13,%rcx
   1844b:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
   18450:	e8 eb 17 00 00       	call   19c40 <<hyperinterval::ieee::Format>::div>
   18455:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18459:	0f 85 79 ff ff ff    	jne    183d8 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   1845f:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18463:	44 8b 6c 24 10       	mov    0x10(%rsp),%r13d
   18468:	e9 ac 00 00 00       	jmp    18519 <<hyperinterval::float::F32Enclosure>::corner_image+0x299>
   1846d:	44 89 e8             	mov    %r13d,%eax
   18470:	c1 e8 17             	shr    $0x17,%eax
   18473:	0f b6 c0             	movzbl %al,%eax
   18476:	44 89 e9             	mov    %r13d,%ecx
   18479:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   1847f:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   18486:	8d b0 6a ff ff ff    	lea    -0x96(%rax),%esi
   1848c:	85 c0                	test   %eax,%eax
   1848e:	b8 6b ff ff ff       	mov    $0xffffff6b,%eax
   18493:	0f 44 f0             	cmove  %eax,%esi
   18496:	48 0f 44 d1          	cmove  %rcx,%rdx
   1849a:	4c 8b 54 24 40       	mov    0x40(%rsp),%r10
   1849f:	44 89 d1             	mov    %r10d,%ecx
   184a2:	c1 e9 17             	shr    $0x17,%ecx
   184a5:	0f b6 c9             	movzbl %cl,%ecx
   184a8:	44 89 d7             	mov    %r10d,%edi
   184ab:	81 e7 ff ff 7f 00    	and    $0x7fffff,%edi
   184b1:	4c 8d 87 00 00 80 00 	lea    0x800000(%rdi),%r8
   184b8:	44 8d 89 6a ff ff ff 	lea    -0x96(%rcx),%r9d
   184bf:	85 c9                	test   %ecx,%ecx
   184c1:	44 0f 44 c8          	cmove  %eax,%r9d
   184c5:	4c 0f 44 c7          	cmove  %rdi,%r8
   184c9:	45 31 d5             	xor    %r10d,%r13d
   184cc:	4c 0f af c2          	imul   %rdx,%r8
   184d0:	41 01 f1             	add    %esi,%r9d
   184d3:	41 c1 ed 1f          	shr    $0x1f,%r13d
   184d7:	44 88 6c 24 14       	mov    %r13b,0x14(%rsp)
   184dc:	4c 89 04 24          	mov    %r8,(%rsp)
   184e0:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   184e7:	00 00 
   184e9:	44 89 4c 24 10       	mov    %r9d,0x10(%rsp)
   184ee:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   184f3:	48 89 e1             	mov    %rsp,%rcx
   184f6:	be 00 00 00 80       	mov    $0x80000000,%esi
   184fb:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18500:	e8 8b 1f 00 00       	call   1a490 <<hyperinterval::ieee::Format>::rounded>
   18505:	80 7c 24 20 00       	cmpb   $0x0,0x20(%rsp)
   1850a:	0f 85 81 fe ff ff    	jne    18391 <<hyperinterval::float::F32Enclosure>::corner_image+0x111>
   18510:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
   18514:	44 8b 6c 24 30       	mov    0x30(%rsp),%r13d
   18519:	48 89 e7             	mov    %rsp,%rdi
   1851c:	be 00 00 00 80       	mov    $0x80000000,%esi
   18521:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18526:	e8 25 f9 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1852b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1852f:	0f 84 a3 fe ff ff    	je     183d8 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   18535:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1853a:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1853f:	48 89 e7             	mov    %rsp,%rdi
   18542:	be 00 00 00 80       	mov    $0x80000000,%esi
   18547:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1854c:	4c 89 e9             	mov    %r13,%rcx
   1854f:	e8 fc f8 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   18554:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18558:	0f 84 7a fe ff ff    	je     183d8 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   1855e:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   18563:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
   18568:	44 89 c1             	mov    %r8d,%ecx
   1856b:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18571:	44 89 e8             	mov    %r13d,%eax
   18574:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18579:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1857e:	48 29 ca             	sub    %rcx,%rdx
   18581:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18586:	48 09 f9             	or     %rdi,%rcx
   18589:	45 85 c0             	test   %r8d,%r8d
   1858c:	48 0f 48 ca          	cmovs  %rdx,%rcx
   18590:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18595:	48 29 c2             	sub    %rax,%rdx
   18598:	48 09 f8             	or     %rdi,%rax
   1859b:	45 85 ed             	test   %r13d,%r13d
   1859e:	48 0f 48 c2          	cmovs  %rdx,%rax
   185a2:	48 39 c1             	cmp    %rax,%rcx
   185a5:	0f 87 32 fe ff ff    	ja     183dd <<hyperinterval::float::F32Enclosure>::corner_image+0x15d>
   185ab:	44 89 f2             	mov    %r14d,%edx
   185ae:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   185b4:	be 00 00 00 80       	mov    $0x80000000,%esi
   185b9:	29 d6                	sub    %edx,%esi
   185bb:	09 fa                	or     %edi,%edx
   185bd:	45 85 f6             	test   %r14d,%r14d
   185c0:	48 0f 49 f2          	cmovns %rdx,%rsi
   185c4:	39 ce                	cmp    %ecx,%esi
   185c6:	45 0f 46 c6          	cmovbe %r14d,%r8d
   185ca:	4c 89 44 24 48       	mov    %r8,0x48(%rsp)
   185cf:	48 8b 74 24 50       	mov    0x50(%rsp),%rsi
   185d4:	89 f1                	mov    %esi,%ecx
   185d6:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   185dc:	ba 00 00 00 80       	mov    $0x80000000,%edx
   185e1:	29 ca                	sub    %ecx,%edx
   185e3:	09 f9                	or     %edi,%ecx
   185e5:	85 f6                	test   %esi,%esi
   185e7:	48 0f 49 d1          	cmovns %rcx,%rdx
   185eb:	39 c2                	cmp    %eax,%edx
   185ed:	44 0f 43 ee          	cmovae %esi,%r13d
   185f1:	45 84 ff             	test   %r15b,%r15b
   185f4:	74 32                	je     18628 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a8>
   185f6:	48 89 e7             	mov    %rsp,%rdi
   185f9:	be 00 00 00 80       	mov    $0x80000000,%esi
   185fe:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18603:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   18608:	4d 89 e0             	mov    %r12,%r8
   1860b:	e8 30 16 00 00       	call   19c40 <<hyperinterval::ieee::Format>::div>
   18610:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18614:	0f 85 be fd ff ff    	jne    183d8 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   1861a:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1861e:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   18623:	e9 ac 00 00 00       	jmp    186d4 <<hyperinterval::float::F32Enclosure>::corner_image+0x454>
   18628:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
   1862d:	44 89 d0             	mov    %r10d,%eax
   18630:	c1 e8 17             	shr    $0x17,%eax
   18633:	0f b6 c0             	movzbl %al,%eax
   18636:	44 89 d1             	mov    %r10d,%ecx
   18639:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   1863f:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   18646:	8d b0 6a ff ff ff    	lea    -0x96(%rax),%esi
   1864c:	85 c0                	test   %eax,%eax
   1864e:	b8 6b ff ff ff       	mov    $0xffffff6b,%eax
   18653:	0f 44 f0             	cmove  %eax,%esi
   18656:	48 0f 44 d1          	cmove  %rcx,%rdx
   1865a:	44 89 e1             	mov    %r12d,%ecx
   1865d:	c1 e9 17             	shr    $0x17,%ecx
   18660:	0f b6 c9             	movzbl %cl,%ecx
   18663:	44 89 e7             	mov    %r12d,%edi
   18666:	81 e7 ff ff 7f 00    	and    $0x7fffff,%edi
   1866c:	4c 8d 87 00 00 80 00 	lea    0x800000(%rdi),%r8
   18673:	44 8d 89 6a ff ff ff 	lea    -0x96(%rcx),%r9d
   1867a:	85 c9                	test   %ecx,%ecx
   1867c:	44 0f 44 c8          	cmove  %eax,%r9d
   18680:	4c 0f 44 c7          	cmove  %rdi,%r8
   18684:	45 31 d4             	xor    %r10d,%r12d
   18687:	4c 0f af c2          	imul   %rdx,%r8
   1868b:	41 01 f1             	add    %esi,%r9d
   1868e:	41 c1 ec 1f          	shr    $0x1f,%r12d
   18692:	44 88 64 24 14       	mov    %r12b,0x14(%rsp)
   18697:	4c 89 04 24          	mov    %r8,(%rsp)
   1869b:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   186a2:	00 00 
   186a4:	44 89 4c 24 10       	mov    %r9d,0x10(%rsp)
   186a9:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   186ae:	48 89 e1             	mov    %rsp,%rcx
   186b1:	be 00 00 00 80       	mov    $0x80000000,%esi
   186b6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   186bb:	e8 d0 1d 00 00       	call   1a490 <<hyperinterval::ieee::Format>::rounded>
   186c0:	80 7c 24 20 00       	cmpb   $0x0,0x20(%rsp)
   186c5:	0f 85 c6 fc ff ff    	jne    18391 <<hyperinterval::float::F32Enclosure>::corner_image+0x111>
   186cb:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
   186cf:	44 8b 64 24 30       	mov    0x30(%rsp),%r12d
   186d4:	48 89 e7             	mov    %rsp,%rdi
   186d7:	be 00 00 00 80       	mov    $0x80000000,%esi
   186dc:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   186e1:	e8 6a f7 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   186e6:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   186ea:	0f 85 e8 fc ff ff    	jne    183d8 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   186f0:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   186f5:	48 89 e7             	mov    %rsp,%rdi
   186f8:	be 00 00 00 80       	mov    $0x80000000,%esi
   186fd:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18702:	4c 89 e1             	mov    %r12,%rcx
   18705:	e8 46 f7 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1870a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1870e:	0f 85 c4 fc ff ff    	jne    183d8 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   18714:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   18719:	44 89 f1             	mov    %r14d,%ecx
   1871c:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18722:	44 89 e0             	mov    %r12d,%eax
   18725:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   1872a:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1872f:	48 29 ca             	sub    %rcx,%rdx
   18732:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18738:	4c 09 c1             	or     %r8,%rcx
   1873b:	45 85 f6             	test   %r14d,%r14d
   1873e:	48 0f 48 ca          	cmovs  %rdx,%rcx
   18742:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18747:	48 29 c2             	sub    %rax,%rdx
   1874a:	4c 09 c0             	or     %r8,%rax
   1874d:	45 85 e4             	test   %r12d,%r12d
   18750:	48 0f 48 c2          	cmovs  %rdx,%rax
   18754:	48 39 c1             	cmp    %rax,%rcx
   18757:	0f 87 80 fc ff ff    	ja     183dd <<hyperinterval::float::F32Enclosure>::corner_image+0x15d>
   1875d:	4c 8b 4c 24 48       	mov    0x48(%rsp),%r9
   18762:	44 89 ca             	mov    %r9d,%edx
   18765:	44 09 c2             	or     %r8d,%edx
   18768:	44 89 ce             	mov    %r9d,%esi
   1876b:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18771:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18776:	29 f7                	sub    %esi,%edi
   18778:	45 85 c9             	test   %r9d,%r9d
   1877b:	48 0f 49 fa          	cmovns %rdx,%rdi
   1877f:	39 cf                	cmp    %ecx,%edi
   18781:	45 0f 46 f1          	cmovbe %r9d,%r14d
   18785:	4c 89 74 24 50       	mov    %r14,0x50(%rsp)
   1878a:	44 89 e9             	mov    %r13d,%ecx
   1878d:	44 09 c1             	or     %r8d,%ecx
   18790:	44 89 ea             	mov    %r13d,%edx
   18793:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18799:	be 00 00 00 80       	mov    $0x80000000,%esi
   1879e:	29 d6                	sub    %edx,%esi
   187a0:	45 85 ed             	test   %r13d,%r13d
   187a3:	48 0f 49 f1          	cmovns %rcx,%rsi
   187a7:	39 c6                	cmp    %eax,%esi
   187a9:	45 0f 43 e5          	cmovae %r13d,%r12d
   187ad:	45 84 ff             	test   %r15b,%r15b
   187b0:	74 34                	je     187e6 <<hyperinterval::float::F32Enclosure>::corner_image+0x566>
   187b2:	48 89 e7             	mov    %rsp,%rdi
   187b5:	be 00 00 00 80       	mov    $0x80000000,%esi
   187ba:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   187bf:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   187c4:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
   187c9:	e8 72 14 00 00       	call   19c40 <<hyperinterval::ieee::Format>::div>
   187ce:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   187d2:	0f 85 00 fc ff ff    	jne    183d8 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   187d8:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   187dc:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   187e1:	e9 b1 00 00 00       	jmp    18897 <<hyperinterval::float::F32Enclosure>::corner_image+0x617>
   187e6:	4c 8b 5c 24 38       	mov    0x38(%rsp),%r11
   187eb:	44 89 d8             	mov    %r11d,%eax
   187ee:	c1 e8 17             	shr    $0x17,%eax
   187f1:	0f b6 c0             	movzbl %al,%eax
   187f4:	44 89 d9             	mov    %r11d,%ecx
   187f7:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   187fd:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   18804:	8d b0 6a ff ff ff    	lea    -0x96(%rax),%esi
   1880a:	85 c0                	test   %eax,%eax
   1880c:	b8 6b ff ff ff       	mov    $0xffffff6b,%eax
   18811:	0f 44 f0             	cmove  %eax,%esi
   18814:	48 0f 44 d1          	cmove  %rcx,%rdx
   18818:	4c 8b 54 24 40       	mov    0x40(%rsp),%r10
   1881d:	44 89 d1             	mov    %r10d,%ecx
   18820:	c1 e9 17             	shr    $0x17,%ecx
   18823:	0f b6 c9             	movzbl %cl,%ecx
   18826:	44 89 d7             	mov    %r10d,%edi
   18829:	81 e7 ff ff 7f 00    	and    $0x7fffff,%edi
   1882f:	4c 8d 87 00 00 80 00 	lea    0x800000(%rdi),%r8
   18836:	44 8d 89 6a ff ff ff 	lea    -0x96(%rcx),%r9d
   1883d:	85 c9                	test   %ecx,%ecx
   1883f:	44 0f 44 c8          	cmove  %eax,%r9d
   18843:	4c 0f 44 c7          	cmove  %rdi,%r8
   18847:	45 31 da             	xor    %r11d,%r10d
   1884a:	4c 0f af c2          	imul   %rdx,%r8
   1884e:	41 01 f1             	add    %esi,%r9d
   18851:	41 c1 ea 1f          	shr    $0x1f,%r10d
   18855:	44 88 54 24 14       	mov    %r10b,0x14(%rsp)
   1885a:	4c 89 04 24          	mov    %r8,(%rsp)
   1885e:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   18865:	00 00 
   18867:	44 89 4c 24 10       	mov    %r9d,0x10(%rsp)
   1886c:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   18871:	48 89 e1             	mov    %rsp,%rcx
   18874:	be 00 00 00 80       	mov    $0x80000000,%esi
   18879:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1887e:	e8 0d 1c 00 00       	call   1a490 <<hyperinterval::ieee::Format>::rounded>
   18883:	80 7c 24 20 00       	cmpb   $0x0,0x20(%rsp)
   18888:	0f 85 03 fb ff ff    	jne    18391 <<hyperinterval::float::F32Enclosure>::corner_image+0x111>
   1888e:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
   18892:	44 8b 74 24 30       	mov    0x30(%rsp),%r14d
   18897:	48 89 e7             	mov    %rsp,%rdi
   1889a:	be 00 00 00 80       	mov    $0x80000000,%esi
   1889f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   188a4:	e8 a7 f5 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   188a9:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   188ad:	0f 85 25 fb ff ff    	jne    183d8 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   188b3:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   188b8:	48 89 e7             	mov    %rsp,%rdi
   188bb:	be 00 00 00 80       	mov    $0x80000000,%esi
   188c0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   188c5:	4c 89 f1             	mov    %r14,%rcx
   188c8:	e8 83 f5 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   188cd:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   188d1:	0f 85 01 fb ff ff    	jne    183d8 <<hyperinterval::float::F32Enclosure>::corner_image+0x158>
   188d7:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   188dc:	44 89 fa             	mov    %r15d,%edx
   188df:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   188e5:	89 c1                	mov    %eax,%ecx
   188e7:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   188ed:	be 00 00 00 80       	mov    $0x80000000,%esi
   188f2:	48 29 d6             	sub    %rdx,%rsi
   188f5:	bf 00 00 00 80       	mov    $0x80000000,%edi
   188fa:	48 09 fa             	or     %rdi,%rdx
   188fd:	45 85 ff             	test   %r15d,%r15d
   18900:	48 0f 48 d6          	cmovs  %rsi,%rdx
   18904:	be 00 00 00 80       	mov    $0x80000000,%esi
   18909:	48 29 ce             	sub    %rcx,%rsi
   1890c:	48 09 f9             	or     %rdi,%rcx
   1890f:	85 c0                	test   %eax,%eax
   18911:	48 0f 48 ce          	cmovs  %rsi,%rcx
   18915:	48 39 ca             	cmp    %rcx,%rdx
   18918:	0f 87 bf fa ff ff    	ja     183dd <<hyperinterval::float::F32Enclosure>::corner_image+0x15d>
   1891e:	4c 8b 54 24 50       	mov    0x50(%rsp),%r10
   18923:	44 89 d6             	mov    %r10d,%esi
   18926:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1892c:	44 09 ce             	or     %r9d,%esi
   1892f:	44 89 d7             	mov    %r10d,%edi
   18932:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18938:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1893e:	41 29 f8             	sub    %edi,%r8d
   18941:	45 85 d2             	test   %r10d,%r10d
   18944:	4c 0f 49 c6          	cmovns %rsi,%r8
   18948:	41 39 d0             	cmp    %edx,%r8d
   1894b:	45 0f 46 fa          	cmovbe %r10d,%r15d
   1894f:	44 89 e2             	mov    %r12d,%edx
   18952:	44 09 ca             	or     %r9d,%edx
   18955:	44 89 e6             	mov    %r12d,%esi
   18958:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1895e:	41 29 f1             	sub    %esi,%r9d
   18961:	45 85 e4             	test   %r12d,%r12d
   18964:	4c 0f 49 ca          	cmovns %rdx,%r9
   18968:	41 39 c9             	cmp    %ecx,%r9d
   1896b:	41 0f 43 c4          	cmovae %r12d,%eax
   1896f:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   18975:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
   18979:	89 43 08             	mov    %eax,0x8(%rbx)
   1897c:	e9 66 fa ff ff       	jmp    183e7 <<hyperinterval::float::F32Enclosure>::corner_image+0x167>
   18981:	cc                   	int3
   18982:	cc                   	int3
   18983:	cc                   	int3
   18984:	cc                   	int3
   18985:	cc                   	int3
   18986:	cc                   	int3
   18987:	cc                   	int3
   18988:	cc                   	int3
   18989:	cc                   	int3
   1898a:	cc                   	int3
   1898b:	cc                   	int3
   1898c:	cc                   	int3
   1898d:	cc                   	int3
   1898e:	cc                   	int3
   1898f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::intersection:
   18990:	48 89 f8             	mov    %rdi,%rax
   18993:	45 31 c9             	xor    %r9d,%r9d
   18996:	f6 06 01             	testb  $0x1,(%rsi)
   18999:	0f 84 ed 00 00 00    	je     18a8c <<hyperinterval::float::F32Enclosure>::intersection+0xfc>
   1899f:	f6 02 01             	testb  $0x1,(%rdx)
   189a2:	0f 84 d9 00 00 00    	je     18a81 <<hyperinterval::float::F32Enclosure>::intersection+0xf1>
   189a8:	53                   	push   %rbx
   189a9:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   189ad:	8b 4e 04             	mov    0x4(%rsi),%ecx
   189b0:	bf 00 00 00 80       	mov    $0x80000000,%edi
   189b5:	41 89 c9             	mov    %ecx,%r9d
   189b8:	41 09 f9             	or     %edi,%r9d
   189bb:	41 89 ca             	mov    %ecx,%r10d
   189be:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   189c5:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   189cb:	45 29 d3             	sub    %r10d,%r11d
   189ce:	85 c9                	test   %ecx,%ecx
   189d0:	4d 0f 49 d9          	cmovns %r9,%r11
   189d4:	45 89 c1             	mov    %r8d,%r9d
   189d7:	41 09 f9             	or     %edi,%r9d
   189da:	45 89 c2             	mov    %r8d,%r10d
   189dd:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   189e4:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   189e9:	44 29 d3             	sub    %r10d,%ebx
   189ec:	45 85 c0             	test   %r8d,%r8d
   189ef:	49 0f 49 d9          	cmovns %r9,%rbx
   189f3:	8b 52 08             	mov    0x8(%rdx),%edx
   189f6:	41 39 db             	cmp    %ebx,%r11d
   189f9:	41 0f 42 c8          	cmovb  %r8d,%ecx
   189fd:	44 8b 46 08          	mov    0x8(%rsi),%r8d
   18a01:	44 89 c6             	mov    %r8d,%esi
   18a04:	09 fe                	or     %edi,%esi
   18a06:	45 89 c1             	mov    %r8d,%r9d
   18a09:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18a10:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18a16:	45 29 ca             	sub    %r9d,%r10d
   18a19:	45 85 c0             	test   %r8d,%r8d
   18a1c:	4c 0f 49 d6          	cmovns %rsi,%r10
   18a20:	89 d6                	mov    %edx,%esi
   18a22:	09 fe                	or     %edi,%esi
   18a24:	41 89 d1             	mov    %edx,%r9d
   18a27:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18a2e:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   18a34:	45 29 cb             	sub    %r9d,%r11d
   18a37:	85 d2                	test   %edx,%edx
   18a39:	4c 0f 49 de          	cmovns %rsi,%r11
   18a3d:	45 39 da             	cmp    %r11d,%r10d
   18a40:	44 0f 47 c2          	cmova  %edx,%r8d
   18a44:	89 ca                	mov    %ecx,%edx
   18a46:	09 fa                	or     %edi,%edx
   18a48:	89 ce                	mov    %ecx,%esi
   18a4a:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18a50:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18a56:	41 29 f2             	sub    %esi,%r10d
   18a59:	85 c9                	test   %ecx,%ecx
   18a5b:	4c 0f 49 d2          	cmovns %rdx,%r10
   18a5f:	44 89 c2             	mov    %r8d,%edx
   18a62:	09 fa                	or     %edi,%edx
   18a64:	44 89 c6             	mov    %r8d,%esi
   18a67:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18a6d:	29 f7                	sub    %esi,%edi
   18a6f:	45 85 c0             	test   %r8d,%r8d
   18a72:	48 0f 49 fa          	cmovns %rdx,%rdi
   18a76:	45 31 c9             	xor    %r9d,%r9d
   18a79:	41 39 fa             	cmp    %edi,%r10d
   18a7c:	41 0f 96 c1          	setbe  %r9b
   18a80:	5b                   	pop    %rbx
   18a81:	44 89 08             	mov    %r9d,(%rax)
   18a84:	89 48 04             	mov    %ecx,0x4(%rax)
   18a87:	44 89 40 08          	mov    %r8d,0x8(%rax)
   18a8b:	c3                   	ret
   18a8c:	44 89 08             	mov    %r9d,(%rax)
   18a8f:	89 48 04             	mov    %ecx,0x4(%rax)
   18a92:	44 89 40 08          	mov    %r8d,0x8(%rax)
   18a96:	c3                   	ret
   18a97:	cc                   	int3
   18a98:	cc                   	int3
   18a99:	cc                   	int3
   18a9a:	cc                   	int3
   18a9b:	cc                   	int3
   18a9c:	cc                   	int3
   18a9d:	cc                   	int3
   18a9e:	cc                   	int3
   18a9f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::contains_point:
   18aa0:	41 56                	push   %r14
   18aa2:	53                   	push   %rbx
   18aa3:	48 83 ec 18          	sub    $0x18,%rsp
   18aa7:	48 89 fb             	mov    %rdi,%rbx
   18aaa:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   18ab0:	66 0f 7e c1          	movd   %xmm0,%ecx
   18ab4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18ab9:	be 00 00 00 80       	mov    $0x80000000,%esi
   18abe:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18ac3:	e8 88 f3 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   18ac8:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   18acd:	3c 01                	cmp    $0x1,%al
   18acf:	75 0d                	jne    18ade <<hyperinterval::float::F32Enclosure>::contains_point+0x3e>
   18ad1:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   18ad6:	48 83 c4 18          	add    $0x18,%rsp
   18ada:	5b                   	pop    %rbx
   18adb:	41 5e                	pop    %r14
   18add:	c3                   	ret
   18ade:	f6 03 01             	testb  $0x1,(%rbx)
   18ae1:	74 44                	je     18b27 <<hyperinterval::float::F32Enclosure>::contains_point+0x87>
   18ae3:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   18ae8:	8b 73 04             	mov    0x4(%rbx),%esi
   18aeb:	89 d1                	mov    %edx,%ecx
   18aed:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18af3:	89 f7                	mov    %esi,%edi
   18af5:	44 09 f7             	or     %r14d,%edi
   18af8:	41 89 f0             	mov    %esi,%r8d
   18afb:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18b02:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   18b08:	45 29 c1             	sub    %r8d,%r9d
   18b0b:	85 f6                	test   %esi,%esi
   18b0d:	4c 0f 49 cf          	cmovns %rdi,%r9
   18b11:	be 00 00 00 80       	mov    $0x80000000,%esi
   18b16:	48 29 ce             	sub    %rcx,%rsi
   18b19:	4c 09 f1             	or     %r14,%rcx
   18b1c:	85 d2                	test   %edx,%edx
   18b1e:	48 0f 48 ce          	cmovs  %rsi,%rcx
   18b22:	41 39 c9             	cmp    %ecx,%r9d
   18b25:	76 0a                	jbe    18b31 <<hyperinterval::float::F32Enclosure>::contains_point+0x91>
   18b27:	31 d2                	xor    %edx,%edx
   18b29:	48 83 c4 18          	add    $0x18,%rsp
   18b2d:	5b                   	pop    %rbx
   18b2e:	41 5e                	pop    %r14
   18b30:	c3                   	ret
   18b31:	8b 53 08             	mov    0x8(%rbx),%edx
   18b34:	89 d6                	mov    %edx,%esi
   18b36:	44 09 f6             	or     %r14d,%esi
   18b39:	89 d7                	mov    %edx,%edi
   18b3b:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18b41:	41 29 fe             	sub    %edi,%r14d
   18b44:	85 d2                	test   %edx,%edx
   18b46:	4c 0f 49 f6          	cmovns %rsi,%r14
   18b4a:	44 39 f1             	cmp    %r14d,%ecx
   18b4d:	0f 96 c2             	setbe  %dl
   18b50:	48 83 c4 18          	add    $0x18,%rsp
   18b54:	5b                   	pop    %rbx
   18b55:	41 5e                	pop    %r14
   18b57:	c3                   	ret
   18b58:	cc                   	int3
   18b59:	cc                   	int3
   18b5a:	cc                   	int3
   18b5b:	cc                   	int3
   18b5c:	cc                   	int3
   18b5d:	cc                   	int3
   18b5e:	cc                   	int3
   18b5f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::interior_subset_of:
   18b60:	b0 01                	mov    $0x1,%al
   18b62:	f6 07 01             	testb  $0x1,(%rdi)
   18b65:	0f 84 8e 00 00 00    	je     18bf9 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x99>
   18b6b:	f6 06 01             	testb  $0x1,(%rsi)
   18b6e:	0f 84 83 00 00 00    	je     18bf7 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x97>
   18b74:	8b 4f 04             	mov    0x4(%rdi),%ecx
   18b77:	8b 56 04             	mov    0x4(%rsi),%edx
   18b7a:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18b7f:	44 8d 04 02          	lea    (%rdx,%rax,1),%r8d
   18b83:	41 89 d1             	mov    %edx,%r9d
   18b86:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18b8d:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18b93:	45 29 ca             	sub    %r9d,%r10d
   18b96:	85 d2                	test   %edx,%edx
   18b98:	4d 0f 49 d0          	cmovns %r8,%r10
   18b9c:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   18b9f:	41 89 c8             	mov    %ecx,%r8d
   18ba2:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18ba9:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   18baf:	45 29 c1             	sub    %r8d,%r9d
   18bb2:	85 c9                	test   %ecx,%ecx
   18bb4:	4c 0f 49 ca          	cmovns %rdx,%r9
   18bb8:	45 39 ca             	cmp    %r9d,%r10d
   18bbb:	73 3a                	jae    18bf7 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x97>
   18bbd:	8b 4f 08             	mov    0x8(%rdi),%ecx
   18bc0:	8b 56 08             	mov    0x8(%rsi),%edx
   18bc3:	8d 34 01             	lea    (%rcx,%rax,1),%esi
   18bc6:	89 cf                	mov    %ecx,%edi
   18bc8:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18bce:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18bd4:	41 29 f8             	sub    %edi,%r8d
   18bd7:	85 c9                	test   %ecx,%ecx
   18bd9:	4c 0f 49 c6          	cmovns %rsi,%r8
   18bdd:	8d 0c 02             	lea    (%rdx,%rax,1),%ecx
   18be0:	89 d6                	mov    %edx,%esi
   18be2:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18be8:	29 f0                	sub    %esi,%eax
   18bea:	85 d2                	test   %edx,%edx
   18bec:	48 0f 49 c1          	cmovns %rcx,%rax
   18bf0:	41 39 c0             	cmp    %eax,%r8d
   18bf3:	0f 92 c0             	setb   %al
   18bf6:	c3                   	ret
   18bf7:	31 c0                	xor    %eax,%eax
   18bf9:	c3                   	ret
   18bfa:	cc                   	int3
   18bfb:	cc                   	int3
   18bfc:	cc                   	int3
   18bfd:	cc                   	int3
   18bfe:	cc                   	int3
   18bff:	cc                   	int3

<hyperinterval::float::F32Enclosure>::add:
   18c00:	48 89 f8             	mov    %rdi,%rax
   18c03:	f6 06 01             	testb  $0x1,(%rsi)
   18c06:	0f 84 d6 00 00 00    	je     18ce2 <<hyperinterval::float::F32Enclosure>::add+0xe2>
   18c0c:	f6 02 01             	testb  $0x1,(%rdx)
   18c0f:	0f 84 cd 00 00 00    	je     18ce2 <<hyperinterval::float::F32Enclosure>::add+0xe2>
   18c15:	41 57                	push   %r15
   18c17:	41 56                	push   %r14
   18c19:	41 55                	push   %r13
   18c1b:	41 54                	push   %r12
   18c1d:	53                   	push   %rbx
   18c1e:	48 83 ec 20          	sub    $0x20,%rsp
   18c22:	49 89 c4             	mov    %rax,%r12
   18c25:	8b 5e 08             	mov    0x8(%rsi),%ebx
   18c28:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   18c2e:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   18c32:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   18c36:	8b 4e 04             	mov    0x4(%rsi),%ecx
   18c39:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18c3e:	be 00 00 00 80       	mov    $0x80000000,%esi
   18c43:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18c48:	e8 63 0d 00 00       	call   199b0 <<hyperinterval::ieee::Format>::add>
   18c4d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18c52:	74 6b                	je     18cbf <<hyperinterval::float::F32Enclosure>::add+0xbf>
   18c54:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   18c59:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18c5e:	be 00 00 00 80       	mov    $0x80000000,%esi
   18c63:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18c68:	48 89 d9             	mov    %rbx,%rcx
   18c6b:	4d 89 f0             	mov    %r14,%r8
   18c6e:	e8 3d 0d 00 00       	call   199b0 <<hyperinterval::ieee::Format>::add>
   18c73:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18c78:	74 45                	je     18cbf <<hyperinterval::float::F32Enclosure>::add+0xbf>
   18c7a:	8b 5c 24 18          	mov    0x18(%rsp),%ebx
   18c7e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18c83:	be 00 00 00 80       	mov    $0x80000000,%esi
   18c88:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18c8d:	4c 89 f9             	mov    %r15,%rcx
   18c90:	e8 bb f1 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   18c95:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18c9a:	74 23                	je     18cbf <<hyperinterval::float::F32Enclosure>::add+0xbf>
   18c9c:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   18ca1:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18ca6:	be 00 00 00 80       	mov    $0x80000000,%esi
   18cab:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18cb0:	48 89 d9             	mov    %rbx,%rcx
   18cb3:	e8 98 f1 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   18cb8:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18cbd:	75 2a                	jne    18ce9 <<hyperinterval::float::F32Enclosure>::add+0xe9>
   18cbf:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   18cc4:	4c 89 e0             	mov    %r12,%rax
   18cc7:	41 88 4c 24 04       	mov    %cl,0x4(%r12)
   18ccc:	41 c7 04 24 02 00 00 	movl   $0x2,(%r12)
   18cd3:	00 
   18cd4:	48 83 c4 20          	add    $0x20,%rsp
   18cd8:	5b                   	pop    %rbx
   18cd9:	41 5c                	pop    %r12
   18cdb:	41 5d                	pop    %r13
   18cdd:	41 5e                	pop    %r14
   18cdf:	41 5f                	pop    %r15
   18ce1:	c3                   	ret
   18ce2:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   18ce8:	c3                   	ret
   18ce9:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   18ced:	44 89 f0             	mov    %r14d,%eax
   18cf0:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18cf5:	89 ca                	mov    %ecx,%edx
   18cf7:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18cfd:	be 00 00 00 80       	mov    $0x80000000,%esi
   18d02:	29 c6                	sub    %eax,%esi
   18d04:	44 09 e8             	or     %r13d,%eax
   18d07:	45 85 f6             	test   %r14d,%r14d
   18d0a:	48 0f 49 f0          	cmovns %rax,%rsi
   18d0e:	89 d0                	mov    %edx,%eax
   18d10:	44 09 e8             	or     %r13d,%eax
   18d13:	41 29 d5             	sub    %edx,%r13d
   18d16:	85 c9                	test   %ecx,%ecx
   18d18:	4c 0f 49 e8          	cmovns %rax,%r13
   18d1c:	44 39 ee             	cmp    %r13d,%esi
   18d1f:	4c 89 e0             	mov    %r12,%rax
   18d22:	76 0c                	jbe    18d30 <<hyperinterval::float::F32Enclosure>::add+0x130>
   18d24:	c6 40 04 01          	movb   $0x1,0x4(%rax)
   18d28:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   18d2e:	eb a4                	jmp    18cd4 <<hyperinterval::float::F32Enclosure>::add+0xd4>
   18d30:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   18d36:	44 89 70 04          	mov    %r14d,0x4(%rax)
   18d3a:	89 48 08             	mov    %ecx,0x8(%rax)
   18d3d:	eb 95                	jmp    18cd4 <<hyperinterval::float::F32Enclosure>::add+0xd4>
   18d3f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::div:
   18d40:	53                   	push   %rbx
   18d41:	48 89 fb             	mov    %rdi,%rbx
   18d44:	83 3a 01             	cmpl   $0x1,(%rdx)
   18d47:	75 1a                	jne    18d63 <<hyperinterval::float::F32Enclosure>::div+0x23>
   18d49:	83 7a 04 00          	cmpl   $0x0,0x4(%rdx)
   18d4d:	7f 14                	jg     18d63 <<hyperinterval::float::F32Enclosure>::div+0x23>
   18d4f:	8b 42 08             	mov    0x8(%rdx),%eax
   18d52:	85 c0                	test   %eax,%eax
   18d54:	0f 99 c1             	setns  %cl
   18d57:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   18d5c:	0f 94 c0             	sete   %al
   18d5f:	08 c8                	or     %cl,%al
   18d61:	75 12                	jne    18d75 <<hyperinterval::float::F32Enclosure>::div+0x35>
   18d63:	48 89 df             	mov    %rbx,%rdi
   18d66:	b9 01 00 00 00       	mov    $0x1,%ecx
   18d6b:	e8 10 f5 ff ff       	call   18280 <<hyperinterval::float::F32Enclosure>::corner_image>
   18d70:	48 89 d8             	mov    %rbx,%rax
   18d73:	5b                   	pop    %rbx
   18d74:	c3                   	ret
   18d75:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
   18d79:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18d7f:	48 89 d8             	mov    %rbx,%rax
   18d82:	5b                   	pop    %rbx
   18d83:	c3                   	ret
   18d84:	cc                   	int3
   18d85:	cc                   	int3
   18d86:	cc                   	int3
   18d87:	cc                   	int3
   18d88:	cc                   	int3
   18d89:	cc                   	int3
   18d8a:	cc                   	int3
   18d8b:	cc                   	int3
   18d8c:	cc                   	int3
   18d8d:	cc                   	int3
   18d8e:	cc                   	int3
   18d8f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::new:
   18d90:	41 57                	push   %r15
   18d92:	41 56                	push   %r14
   18d94:	53                   	push   %rbx
   18d95:	48 83 ec 20          	sub    $0x20,%rsp
   18d99:	f3 0f 11 4c 24 1c    	movss  %xmm1,0x1c(%rsp)
   18d9f:	48 89 fb             	mov    %rdi,%rbx
   18da2:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   18da8:	66 0f 7e c1          	movd   %xmm0,%ecx
   18dac:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18db1:	be 00 00 00 80       	mov    $0x80000000,%esi
   18db6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18dbb:	e8 90 f0 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   18dc0:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18dc5:	74 2a                	je     18df1 <<hyperinterval::float::F32Enclosure>::new+0x61>
   18dc7:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   18dcc:	66 0f 6e 44 24 1c    	movd   0x1c(%rsp),%xmm0
   18dd2:	66 0f 7e c1          	movd   %xmm0,%ecx
   18dd6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18ddb:	be 00 00 00 80       	mov    $0x80000000,%esi
   18de0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18de5:	e8 66 f0 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   18dea:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18def:	75 1b                	jne    18e0c <<hyperinterval::float::F32Enclosure>::new+0x7c>
   18df1:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   18df6:	88 43 04             	mov    %al,0x4(%rbx)
   18df9:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18dff:	48 89 d8             	mov    %rbx,%rax
   18e02:	48 83 c4 20          	add    $0x20,%rsp
   18e06:	5b                   	pop    %rbx
   18e07:	41 5e                	pop    %r14
   18e09:	41 5f                	pop    %r15
   18e0b:	c3                   	ret
   18e0c:	8b 44 24 10          	mov    0x10(%rsp),%eax
   18e10:	44 89 f9             	mov    %r15d,%ecx
   18e13:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18e19:	89 c2                	mov    %eax,%edx
   18e1b:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18e21:	be 00 00 00 80       	mov    $0x80000000,%esi
   18e26:	29 ce                	sub    %ecx,%esi
   18e28:	44 09 f1             	or     %r14d,%ecx
   18e2b:	45 85 ff             	test   %r15d,%r15d
   18e2e:	48 0f 49 f1          	cmovns %rcx,%rsi
   18e32:	89 d1                	mov    %edx,%ecx
   18e34:	44 09 f1             	or     %r14d,%ecx
   18e37:	41 29 d6             	sub    %edx,%r14d
   18e3a:	85 c0                	test   %eax,%eax
   18e3c:	4c 0f 49 f1          	cmovns %rcx,%r14
   18e40:	44 39 f6             	cmp    %r14d,%esi
   18e43:	76 06                	jbe    18e4b <<hyperinterval::float::F32Enclosure>::new+0xbb>
   18e45:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   18e49:	eb ae                	jmp    18df9 <<hyperinterval::float::F32Enclosure>::new+0x69>
   18e4b:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   18e51:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
   18e55:	89 43 08             	mov    %eax,0x8(%rbx)
   18e58:	eb a5                	jmp    18dff <<hyperinterval::float::F32Enclosure>::new+0x6f>
   18e5a:	cc                   	int3
   18e5b:	cc                   	int3
   18e5c:	cc                   	int3
   18e5d:	cc                   	int3
   18e5e:	cc                   	int3
   18e5f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::sub:
   18e60:	53                   	push   %rbx
   18e61:	48 83 ec 10          	sub    $0x10,%rsp
   18e65:	48 89 fb             	mov    %rdi,%rbx
   18e68:	f6 02 01             	testb  $0x1,(%rdx)
   18e6b:	74 29                	je     18e96 <<hyperinterval::float::F32Enclosure>::sub+0x36>
   18e6d:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   18e72:	66 0f ef c9          	pxor   %xmm1,%xmm1
   18e76:	66 0f 6f 15 52 cd fe 	movdqa -0x132ae(%rip),%xmm2        # 5bd0 <__abi_tag+0x58d4>
   18e7d:	ff 
   18e7e:	66 0f ef d0          	pxor   %xmm0,%xmm2
   18e82:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   18e86:	66 0f df ca          	pandn  %xmm2,%xmm1
   18e8a:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   18e8f:	b8 01 00 00 00       	mov    $0x1,%eax
   18e94:	eb 02                	jmp    18e98 <<hyperinterval::float::F32Enclosure>::sub+0x38>
   18e96:	31 c0                	xor    %eax,%eax
   18e98:	89 44 24 04          	mov    %eax,0x4(%rsp)
   18e9c:	66 0f d6 44 24 08    	movq   %xmm0,0x8(%rsp)
   18ea2:	48 8d 54 24 04       	lea    0x4(%rsp),%rdx
   18ea7:	48 89 df             	mov    %rbx,%rdi
   18eaa:	ff 15 78 29 04 00    	call   *0x42978(%rip)        # 5b828 <_DYNAMIC+0x2d0>
   18eb0:	48 89 d8             	mov    %rbx,%rax
   18eb3:	48 83 c4 10          	add    $0x10,%rsp
   18eb7:	5b                   	pop    %rbx
   18eb8:	c3                   	ret
   18eb9:	cc                   	int3
   18eba:	cc                   	int3
   18ebb:	cc                   	int3
   18ebc:	cc                   	int3
   18ebd:	cc                   	int3
   18ebe:	cc                   	int3
   18ebf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::hull:
   18ec0:	48 89 f8             	mov    %rdi,%rax
   18ec3:	44 8b 0e             	mov    (%rsi),%r9d
   18ec6:	44 8b 02             	mov    (%rdx),%r8d
   18ec9:	8b 7a 04             	mov    0x4(%rdx),%edi
   18ecc:	8b 4a 08             	mov    0x8(%rdx),%ecx
   18ecf:	41 f6 c1 01          	test   $0x1,%r9b
   18ed3:	0f 84 9b 00 00 00    	je     18f74 <<hyperinterval::float::F32Enclosure>::hull+0xb4>
   18ed9:	8b 56 04             	mov    0x4(%rsi),%edx
   18edc:	8b 76 08             	mov    0x8(%rsi),%esi
   18edf:	41 f6 c0 01          	test   $0x1,%r8b
   18ee3:	0f 84 95 00 00 00    	je     18f7e <<hyperinterval::float::F32Enclosure>::hull+0xbe>
   18ee9:	53                   	push   %rbx
   18eea:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18ef0:	46 8d 0c 02          	lea    (%rdx,%r8,1),%r9d
   18ef4:	41 89 d2             	mov    %edx,%r10d
   18ef7:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18efe:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   18f04:	45 29 d3             	sub    %r10d,%r11d
   18f07:	85 d2                	test   %edx,%edx
   18f09:	4d 0f 49 d9          	cmovns %r9,%r11
   18f0d:	46 8d 0c 07          	lea    (%rdi,%r8,1),%r9d
   18f11:	41 89 fa             	mov    %edi,%r10d
   18f14:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18f1b:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   18f20:	44 29 d3             	sub    %r10d,%ebx
   18f23:	85 ff                	test   %edi,%edi
   18f25:	49 0f 49 d9          	cmovns %r9,%rbx
   18f29:	41 39 db             	cmp    %ebx,%r11d
   18f2c:	0f 47 d7             	cmova  %edi,%edx
   18f2f:	42 8d 3c 06          	lea    (%rsi,%r8,1),%edi
   18f33:	41 89 f1             	mov    %esi,%r9d
   18f36:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18f3d:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18f43:	45 29 ca             	sub    %r9d,%r10d
   18f46:	85 f6                	test   %esi,%esi
   18f48:	4c 0f 49 d7          	cmovns %rdi,%r10
   18f4c:	42 8d 3c 01          	lea    (%rcx,%r8,1),%edi
   18f50:	41 89 c9             	mov    %ecx,%r9d
   18f53:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18f5a:	45 29 c8             	sub    %r9d,%r8d
   18f5d:	85 c9                	test   %ecx,%ecx
   18f5f:	4c 0f 49 c7          	cmovns %rdi,%r8
   18f63:	45 39 c2             	cmp    %r8d,%r10d
   18f66:	0f 42 f1             	cmovb  %ecx,%esi
   18f69:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   18f6f:	89 f1                	mov    %esi,%ecx
   18f71:	89 d7                	mov    %edx,%edi
   18f73:	5b                   	pop    %rbx
   18f74:	44 89 00             	mov    %r8d,(%rax)
   18f77:	89 78 04             	mov    %edi,0x4(%rax)
   18f7a:	89 48 08             	mov    %ecx,0x8(%rax)
   18f7d:	c3                   	ret
   18f7e:	89 f1                	mov    %esi,%ecx
   18f80:	89 d7                	mov    %edx,%edi
   18f82:	45 89 c8             	mov    %r9d,%r8d
   18f85:	44 89 00             	mov    %r8d,(%rax)
   18f88:	89 78 04             	mov    %edi,0x4(%rax)
   18f8b:	89 48 08             	mov    %ecx,0x8(%rax)
   18f8e:	c3                   	ret
   18f8f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::point:
   18f90:	53                   	push   %rbx
   18f91:	48 83 ec 10          	sub    $0x10,%rsp
   18f95:	48 89 fb             	mov    %rdi,%rbx
   18f98:	66 0f 7e c1          	movd   %xmm0,%ecx
   18f9c:	48 89 e7             	mov    %rsp,%rdi
   18f9f:	be 00 00 00 80       	mov    $0x80000000,%esi
   18fa4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18fa9:	e8 a2 ee ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   18fae:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18fb2:	75 0f                	jne    18fc3 <<hyperinterval::float::F32Enclosure>::point+0x33>
   18fb4:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   18fb9:	88 43 04             	mov    %al,0x4(%rbx)
   18fbc:	b8 02 00 00 00       	mov    $0x2,%eax
   18fc1:	eb 0f                	jmp    18fd2 <<hyperinterval::float::F32Enclosure>::point+0x42>
   18fc3:	8b 44 24 08          	mov    0x8(%rsp),%eax
   18fc7:	89 43 04             	mov    %eax,0x4(%rbx)
   18fca:	89 43 08             	mov    %eax,0x8(%rbx)
   18fcd:	b8 01 00 00 00       	mov    $0x1,%eax
   18fd2:	89 03                	mov    %eax,(%rbx)
   18fd4:	48 89 d8             	mov    %rbx,%rax
   18fd7:	48 83 c4 10          	add    $0x10,%rsp
   18fdb:	5b                   	pop    %rbx
   18fdc:	c3                   	ret
   18fdd:	cc                   	int3
   18fde:	cc                   	int3
   18fdf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::signs:
   18fe0:	83 3f 01             	cmpl   $0x1,(%rdi)
   18fe3:	75 65                	jne    1904a <<hyperinterval::float::F32Enclosure>::signs+0x6a>
   18fe5:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   18fea:	8b 57 04             	mov    0x4(%rdi),%edx
   18fed:	8b 47 08             	mov    0x8(%rdi),%eax
   18ff0:	48 89 d6             	mov    %rdx,%rsi
   18ff3:	48 09 ce             	or     %rcx,%rsi
   18ff6:	41 89 d0             	mov    %edx,%r8d
   18ff9:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   19000:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19005:	4c 29 c7             	sub    %r8,%rdi
   19008:	85 d2                	test   %edx,%edx
   1900a:	48 0f 49 fe          	cmovns %rsi,%rdi
   1900e:	31 f6                	xor    %esi,%esi
   19010:	f7 c7 00 00 00 80    	test   $0x80000000,%edi
   19016:	0f 94 c2             	sete   %dl
   19019:	48 39 cf             	cmp    %rcx,%rdi
   1901c:	77 1d                	ja     1903b <<hyperinterval::float::F32Enclosure>::signs+0x5b>
   1901e:	39 cf                	cmp    %ecx,%edi
   19020:	0f 92 c1             	setb   %cl
   19023:	80 c9 02             	or     $0x2,%cl
   19026:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   1902b:	0f b6 c9             	movzbl %cl,%ecx
   1902e:	40 88 d6             	mov    %dl,%sil
   19031:	0f 44 f1             	cmove  %ecx,%esi
   19034:	85 c0                	test   %eax,%eax
   19036:	0f 49 f1             	cmovns %ecx,%esi
   19039:	89 f2                	mov    %esi,%edx
   1903b:	8d 4a 04             	lea    0x4(%rdx),%ecx
   1903e:	85 c0                	test   %eax,%eax
   19040:	0f b6 d2             	movzbl %dl,%edx
   19043:	0f b6 c1             	movzbl %cl,%eax
   19046:	0f 4e c2             	cmovle %edx,%eax
   19049:	c3                   	ret
   1904a:	31 c0                	xor    %eax,%eax
   1904c:	c3                   	ret
   1904d:	cc                   	int3
   1904e:	cc                   	int3
   1904f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::affine:
   19050:	41 56                	push   %r14
   19052:	53                   	push   %rbx
   19053:	48 83 ec 38          	sub    $0x38,%rsp
   19057:	f3 0f 11 4c 24 10    	movss  %xmm1,0x10(%rsp)
   1905d:	49 89 f6             	mov    %rsi,%r14
   19060:	48 89 fb             	mov    %rdi,%rbx
   19063:	66 0f 7e c1          	movd   %xmm0,%ecx
   19067:	48 89 e7             	mov    %rsp,%rdi
   1906a:	be 00 00 00 80       	mov    $0x80000000,%esi
   1906f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19074:	e8 d7 ed ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   19079:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1907d:	74 4a                	je     190c9 <<hyperinterval::float::F32Enclosure>::affine+0x79>
   1907f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19084:	89 c1                	mov    %eax,%ecx
   19086:	c1 e9 08             	shr    $0x8,%ecx
   19089:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%rsp)
   19090:	00 
   19091:	88 44 24 18          	mov    %al,0x18(%rsp)
   19095:	89 c2                	mov    %eax,%edx
   19097:	c1 ea 18             	shr    $0x18,%edx
   1909a:	88 54 24 1b          	mov    %dl,0x1b(%rsp)
   1909e:	66 89 4c 24 19       	mov    %cx,0x19(%rsp)
   190a3:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
   190a7:	66 0f 6e 44 24 10    	movd   0x10(%rsp),%xmm0
   190ad:	66 0f 7e c1          	movd   %xmm0,%ecx
   190b1:	48 89 e7             	mov    %rsp,%rdi
   190b4:	be 00 00 00 80       	mov    $0x80000000,%esi
   190b9:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   190be:	e8 8d ed ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   190c3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   190c7:	75 19                	jne    190e2 <<hyperinterval::float::F32Enclosure>::affine+0x92>
   190c9:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   190ce:	88 43 04             	mov    %al,0x4(%rbx)
   190d1:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   190d7:	48 89 d8             	mov    %rbx,%rax
   190da:	48 83 c4 38          	add    $0x38,%rsp
   190de:	5b                   	pop    %rbx
   190df:	41 5e                	pop    %r14
   190e1:	c3                   	ret
   190e2:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   190e7:	89 c1                	mov    %eax,%ecx
   190e9:	c1 e9 08             	shr    $0x8,%ecx
   190ec:	c7 44 24 20 01 00 00 	movl   $0x1,0x20(%rsp)
   190f3:	00 
   190f4:	88 44 24 24          	mov    %al,0x24(%rsp)
   190f8:	89 c2                	mov    %eax,%edx
   190fa:	c1 ea 18             	shr    $0x18,%edx
   190fd:	88 54 24 27          	mov    %dl,0x27(%rsp)
   19101:	66 89 4c 24 25       	mov    %cx,0x25(%rsp)
   19106:	89 44 24 28          	mov    %eax,0x28(%rsp)
   1910a:	48 89 e7             	mov    %rsp,%rdi
   1910d:	48 8d 54 24 14       	lea    0x14(%rsp),%rdx
   19112:	4c 89 f6             	mov    %r14,%rsi
   19115:	31 c9                	xor    %ecx,%ecx
   19117:	e8 64 f1 ff ff       	call   18280 <<hyperinterval::float::F32Enclosure>::corner_image>
   1911c:	8b 0c 24             	mov    (%rsp),%ecx
   1911f:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   19124:	83 f9 02             	cmp    $0x2,%ecx
   19127:	74 a5                	je     190ce <<hyperinterval::float::F32Enclosure>::affine+0x7e>
   19129:	8b 54 24 05          	mov    0x5(%rsp),%edx
   1912d:	8b 74 24 08          	mov    0x8(%rsp),%esi
   19131:	89 74 24 34          	mov    %esi,0x34(%rsp)
   19135:	89 54 24 31          	mov    %edx,0x31(%rsp)
   19139:	89 4c 24 2c          	mov    %ecx,0x2c(%rsp)
   1913d:	88 44 24 30          	mov    %al,0x30(%rsp)
   19141:	48 8d 74 24 2c       	lea    0x2c(%rsp),%rsi
   19146:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
   1914b:	48 89 df             	mov    %rbx,%rdi
   1914e:	ff 15 d4 26 04 00    	call   *0x426d4(%rip)        # 5b828 <_DYNAMIC+0x2d0>
   19154:	eb 81                	jmp    190d7 <<hyperinterval::float::F32Enclosure>::affine+0x87>
   19156:	cc                   	int3
   19157:	cc                   	int3
   19158:	cc                   	int3
   19159:	cc                   	int3
   1915a:	cc                   	int3
   1915b:	cc                   	int3
   1915c:	cc                   	int3
   1915d:	cc                   	int3
   1915e:	cc                   	int3
   1915f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::square:
   19160:	55                   	push   %rbp
   19161:	41 57                	push   %r15
   19163:	41 56                	push   %r14
   19165:	41 55                	push   %r13
   19167:	41 54                	push   %r12
   19169:	53                   	push   %rbx
   1916a:	48 83 ec 78          	sub    $0x78,%rsp
   1916e:	48 89 fb             	mov    %rdi,%rbx
   19171:	f6 06 01             	testb  $0x1,(%rsi)
   19174:	0f 84 e9 00 00 00    	je     19263 <<hyperinterval::float::F32Enclosure>::square+0x103>
   1917a:	44 8b 76 04          	mov    0x4(%rsi),%r14d
   1917e:	8b 6e 08             	mov    0x8(%rsi),%ebp
   19181:	44 89 f0             	mov    %r14d,%eax
   19184:	c1 e8 17             	shr    $0x17,%eax
   19187:	0f b6 c0             	movzbl %al,%eax
   1918a:	44 89 f1             	mov    %r14d,%ecx
   1918d:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   19193:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   1919a:	85 c0                	test   %eax,%eax
   1919c:	8d 84 00 d4 fe ff ff 	lea    -0x12c(%rax,%rax,1),%eax
   191a3:	48 0f 44 d1          	cmove  %rcx,%rdx
   191a7:	41 bf d6 fe ff ff    	mov    $0xfffffed6,%r15d
   191ad:	41 0f 44 c7          	cmove  %r15d,%eax
   191b1:	48 0f af d2          	imul   %rdx,%rdx
   191b5:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   191ba:	48 89 14 24          	mov    %rdx,(%rsp)
   191be:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   191c5:	00 00 
   191c7:	89 44 24 10          	mov    %eax,0x10(%rsp)
   191cb:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   191d0:	48 89 e1             	mov    %rsp,%rcx
   191d3:	be 00 00 00 80       	mov    $0x80000000,%esi
   191d8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   191dd:	e8 ae 12 00 00       	call   1a490 <<hyperinterval::ieee::Format>::rounded>
   191e2:	80 7c 24 38 00       	cmpb   $0x0,0x38(%rsp)
   191e7:	75 6a                	jne    19253 <<hyperinterval::float::F32Enclosure>::square+0xf3>
   191e9:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
   191ee:	44 8b 64 24 48       	mov    0x48(%rsp),%r12d
   191f3:	89 e8                	mov    %ebp,%eax
   191f5:	c1 e8 17             	shr    $0x17,%eax
   191f8:	0f b6 c0             	movzbl %al,%eax
   191fb:	89 e9                	mov    %ebp,%ecx
   191fd:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   19203:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   1920a:	85 c0                	test   %eax,%eax
   1920c:	48 0f 44 d1          	cmove  %rcx,%rdx
   19210:	8d 84 00 d4 fe ff ff 	lea    -0x12c(%rax,%rax,1),%eax
   19217:	41 0f 44 c7          	cmove  %r15d,%eax
   1921b:	48 0f af d2          	imul   %rdx,%rdx
   1921f:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   19224:	48 89 14 24          	mov    %rdx,(%rsp)
   19228:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   1922f:	00 00 
   19231:	89 44 24 10          	mov    %eax,0x10(%rsp)
   19235:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1923a:	48 89 e1             	mov    %rsp,%rcx
   1923d:	be 00 00 00 80       	mov    $0x80000000,%esi
   19242:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19247:	e8 44 12 00 00       	call   1a490 <<hyperinterval::ieee::Format>::rounded>
   1924c:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   19251:	75 28                	jne    1927b <<hyperinterval::float::F32Enclosure>::square+0x11b>
   19253:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
   19258:	88 43 04             	mov    %al,0x4(%rbx)
   1925b:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19261:	eb 06                	jmp    19269 <<hyperinterval::float::F32Enclosure>::square+0x109>
   19263:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   19269:	48 89 d8             	mov    %rbx,%rax
   1926c:	48 83 c4 78          	add    $0x78,%rsp
   19270:	5b                   	pop    %rbx
   19271:	41 5c                	pop    %r12
   19273:	41 5d                	pop    %r13
   19275:	41 5e                	pop    %r14
   19277:	41 5f                	pop    %r15
   19279:	5d                   	pop    %rbp
   1927a:	c3                   	ret
   1927b:	8b 44 24 40          	mov    0x40(%rsp),%eax
   1927f:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   19284:	44 8b 7c 24 48       	mov    0x48(%rsp),%r15d
   19289:	48 89 e7             	mov    %rsp,%rdi
   1928c:	be 00 00 00 80       	mov    $0x80000000,%esi
   19291:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19296:	4c 89 e9             	mov    %r13,%rcx
   19299:	e8 b2 eb ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1929e:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   192a2:	74 25                	je     192c9 <<hyperinterval::float::F32Enclosure>::square+0x169>
   192a4:	4c 89 7c 24 60       	mov    %r15,0x60(%rsp)
   192a9:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   192ae:	48 89 e7             	mov    %rsp,%rdi
   192b1:	be 00 00 00 80       	mov    $0x80000000,%esi
   192b6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   192bb:	4c 89 e1             	mov    %r12,%rcx
   192be:	e8 8d eb ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   192c3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   192c7:	75 07                	jne    192d0 <<hyperinterval::float::F32Enclosure>::square+0x170>
   192c9:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   192ce:	eb 88                	jmp    19258 <<hyperinterval::float::F32Enclosure>::square+0xf8>
   192d0:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   192d5:	45 89 fd             	mov    %r15d,%r13d
   192d8:	41 81 e5 ff ff ff 7f 	and    $0x7fffffff,%r13d
   192df:	41 89 d4             	mov    %edx,%r12d
   192e2:	41 81 e4 ff ff ff 7f 	and    $0x7fffffff,%r12d
   192e9:	b8 00 00 00 80       	mov    $0x80000000,%eax
   192ee:	4c 29 e8             	sub    %r13,%rax
   192f1:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   192f6:	49 09 cd             	or     %rcx,%r13
   192f9:	45 85 ff             	test   %r15d,%r15d
   192fc:	4c 0f 48 e8          	cmovs  %rax,%r13
   19300:	b8 00 00 00 80       	mov    $0x80000000,%eax
   19305:	4c 29 e0             	sub    %r12,%rax
   19308:	49 09 cc             	or     %rcx,%r12
   1930b:	85 d2                	test   %edx,%edx
   1930d:	4c 0f 48 e0          	cmovs  %rax,%r12
   19311:	b0 01                	mov    $0x1,%al
   19313:	4d 39 e5             	cmp    %r12,%r13
   19316:	0f 87 3c ff ff ff    	ja     19258 <<hyperinterval::float::F32Enclosure>::square+0xf8>
   1931c:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   19321:	48 89 e7             	mov    %rsp,%rdi
   19324:	be 00 00 00 80       	mov    $0x80000000,%esi
   19329:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1932e:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
   19333:	e8 18 eb ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   19338:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1933c:	74 27                	je     19365 <<hyperinterval::float::F32Enclosure>::square+0x205>
   1933e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19343:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   19348:	48 89 e7             	mov    %rsp,%rdi
   1934b:	be 00 00 00 80       	mov    $0x80000000,%esi
   19350:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19355:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   1935a:	e8 f1 ea ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1935f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19363:	75 13                	jne    19378 <<hyperinterval::float::F32Enclosure>::square+0x218>
   19365:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   1936a:	88 53 04             	mov    %dl,0x4(%rbx)
   1936d:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19373:	e9 f1 fe ff ff       	jmp    19269 <<hyperinterval::float::F32Enclosure>::square+0x109>
   19378:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1937d:	4c 8b 44 24 50       	mov    0x50(%rsp),%r8
   19382:	44 89 c1             	mov    %r8d,%ecx
   19385:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1938b:	89 c2                	mov    %eax,%edx
   1938d:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19393:	be 00 00 00 80       	mov    $0x80000000,%esi
   19398:	48 29 ce             	sub    %rcx,%rsi
   1939b:	bf 00 00 00 80       	mov    $0x80000000,%edi
   193a0:	48 09 f9             	or     %rdi,%rcx
   193a3:	45 85 c0             	test   %r8d,%r8d
   193a6:	48 0f 48 ce          	cmovs  %rsi,%rcx
   193aa:	48 8d 34 3a          	lea    (%rdx,%rdi,1),%rsi
   193ae:	48 29 d7             	sub    %rdx,%rdi
   193b1:	85 c0                	test   %eax,%eax
   193b3:	48 0f 49 fe          	cmovns %rsi,%rdi
   193b7:	b2 01                	mov    $0x1,%dl
   193b9:	48 39 f9             	cmp    %rdi,%rcx
   193bc:	77 ac                	ja     1936a <<hyperinterval::float::F32Enclosure>::square+0x20a>
   193be:	41 39 cd             	cmp    %ecx,%r13d
   193c1:	45 0f 47 f8          	cmova  %r8d,%r15d
   193c5:	41 39 fc             	cmp    %edi,%r12d
   193c8:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   193cd:	0f 42 c8             	cmovb  %eax,%ecx
   193d0:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%rsp)
   193d7:	00 
   193d8:	44 89 7c 24 2c       	mov    %r15d,0x2c(%rsp)
   193dd:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   193e1:	45 85 f6             	test   %r14d,%r14d
   193e4:	7f 6a                	jg     19450 <<hyperinterval::float::F32Enclosure>::square+0x2f0>
   193e6:	85 ed                	test   %ebp,%ebp
   193e8:	0f 98 c0             	sets   %al
   193eb:	f7 c5 ff ff ff 7f    	test   $0x7fffffff,%ebp
   193f1:	0f 95 c1             	setne  %cl
   193f4:	84 c8                	test   %cl,%al
   193f6:	75 58                	jne    19450 <<hyperinterval::float::F32Enclosure>::square+0x2f0>
   193f8:	48 89 e7             	mov    %rsp,%rdi
   193fb:	e8 b0 03 00 00       	call   197b0 <<hyperinterval::float::F32Enclosure>::from_bits>
   19400:	8b 0c 24             	mov    (%rsp),%ecx
   19403:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   19408:	83 f9 02             	cmp    $0x2,%ecx
   1940b:	0f 84 47 fe ff ff    	je     19258 <<hyperinterval::float::F32Enclosure>::square+0xf8>
   19411:	8b 54 24 05          	mov    0x5(%rsp),%edx
   19415:	8b 74 24 08          	mov    0x8(%rsp),%esi
   19419:	89 74 24 40          	mov    %esi,0x40(%rsp)
   1941d:	89 54 24 3d          	mov    %edx,0x3d(%rsp)
   19421:	89 4c 24 38          	mov    %ecx,0x38(%rsp)
   19425:	88 44 24 3c          	mov    %al,0x3c(%rsp)
   19429:	48 8d 7c 24 6c       	lea    0x6c(%rsp),%rdi
   1942e:	48 8d 74 24 28       	lea    0x28(%rsp),%rsi
   19433:	48 8d 54 24 38       	lea    0x38(%rsp),%rdx
   19438:	ff 15 52 24 04 00    	call   *0x42452(%rip)        # 5b890 <_DYNAMIC+0x338>
   1943e:	8b 44 24 74          	mov    0x74(%rsp),%eax
   19442:	89 44 24 30          	mov    %eax,0x30(%rsp)
   19446:	48 8b 44 24 6c       	mov    0x6c(%rsp),%rax
   1944b:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   19450:	8b 44 24 30          	mov    0x30(%rsp),%eax
   19454:	89 43 08             	mov    %eax,0x8(%rbx)
   19457:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   1945c:	48 89 03             	mov    %rax,(%rbx)
   1945f:	e9 05 fe ff ff       	jmp    19269 <<hyperinterval::float::F32Enclosure>::square+0x109>
   19464:	cc                   	int3
   19465:	cc                   	int3
   19466:	cc                   	int3
   19467:	cc                   	int3
   19468:	cc                   	int3
   19469:	cc                   	int3
   1946a:	cc                   	int3
   1946b:	cc                   	int3
   1946c:	cc                   	int3
   1946d:	cc                   	int3
   1946e:	cc                   	int3
   1946f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::next_up:
   19470:	48 83 ec 18          	sub    $0x18,%rsp
   19474:	66 0f 7e c1          	movd   %xmm0,%ecx
   19478:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1947d:	be 00 00 00 80       	mov    $0x80000000,%esi
   19482:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19487:	e8 c4 e9 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1948c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19491:	75 10                	jne    194a3 <<hyperinterval::float::F32Enclosure>::next_up+0x33>
   19493:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   19498:	c1 e0 08             	shl    $0x8,%eax
   1949b:	48 ff c0             	inc    %rax
   1949e:	48 83 c4 18          	add    $0x18,%rsp
   194a2:	c3                   	ret
   194a3:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   194a8:	31 c9                	xor    %ecx,%ecx
   194aa:	85 c0                	test   %eax,%eax
   194ac:	0f 99 c1             	setns  %cl
   194af:	48 8d 0c 48          	lea    (%rax,%rcx,2),%rcx
   194b3:	48 ff c9             	dec    %rcx
   194b6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   194bb:	be 00 00 00 80       	mov    $0x80000000,%esi
   194c0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   194c5:	e8 86 e9 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   194ca:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   194cf:	75 0a                	jne    194db <<hyperinterval::float::F32Enclosure>::next_up+0x6b>
   194d1:	b8 01 03 00 00       	mov    $0x301,%eax
   194d6:	48 83 c4 18          	add    $0x18,%rsp
   194da:	c3                   	ret
   194db:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   194e0:	48 c1 e0 20          	shl    $0x20,%rax
   194e4:	48 83 c4 18          	add    $0x18,%rsp
   194e8:	c3                   	ret
   194e9:	cc                   	int3
   194ea:	cc                   	int3
   194eb:	cc                   	int3
   194ec:	cc                   	int3
   194ed:	cc                   	int3
   194ee:	cc                   	int3
   194ef:	cc                   	int3

<hyperinterval::float::F32Enclosure>::disjoint:
   194f0:	83 3f 00             	cmpl   $0x0,(%rdi)
   194f3:	b0 01                	mov    $0x1,%al
   194f5:	0f 84 a3 00 00 00    	je     1959e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   194fb:	8b 0e                	mov    (%rsi),%ecx
   194fd:	85 c9                	test   %ecx,%ecx
   194ff:	0f 84 99 00 00 00    	je     1959e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   19505:	f6 c1 01             	test   $0x1,%cl
   19508:	74 4c                	je     19556 <<hyperinterval::float::F32Enclosure>::disjoint+0x66>
   1950a:	53                   	push   %rbx
   1950b:	8b 56 04             	mov    0x4(%rsi),%edx
   1950e:	44 8b 47 08          	mov    0x8(%rdi),%r8d
   19512:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   19518:	45 89 c2             	mov    %r8d,%r10d
   1951b:	45 09 ca             	or     %r9d,%r10d
   1951e:	45 89 c3             	mov    %r8d,%r11d
   19521:	41 81 e3 ff ff ff 7f 	and    $0x7fffffff,%r11d
   19528:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   1952d:	44 29 db             	sub    %r11d,%ebx
   19530:	45 85 c0             	test   %r8d,%r8d
   19533:	49 0f 49 da          	cmovns %r10,%rbx
   19537:	41 89 d0             	mov    %edx,%r8d
   1953a:	45 09 c8             	or     %r9d,%r8d
   1953d:	41 89 d2             	mov    %edx,%r10d
   19540:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   19547:	45 29 d1             	sub    %r10d,%r9d
   1954a:	85 d2                	test   %edx,%edx
   1954c:	4d 0f 49 c8          	cmovns %r8,%r9
   19550:	44 39 cb             	cmp    %r9d,%ebx
   19553:	5b                   	pop    %rbx
   19554:	72 48                	jb     1959e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   19556:	f6 c1 01             	test   $0x1,%cl
   19559:	75 03                	jne    1955e <<hyperinterval::float::F32Enclosure>::disjoint+0x6e>
   1955b:	31 c0                	xor    %eax,%eax
   1955d:	c3                   	ret
   1955e:	8b 47 04             	mov    0x4(%rdi),%eax
   19561:	8b 4e 08             	mov    0x8(%rsi),%ecx
   19564:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19569:	89 ce                	mov    %ecx,%esi
   1956b:	09 d6                	or     %edx,%esi
   1956d:	89 cf                	mov    %ecx,%edi
   1956f:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   19575:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1957b:	41 29 f8             	sub    %edi,%r8d
   1957e:	85 c9                	test   %ecx,%ecx
   19580:	4c 0f 49 c6          	cmovns %rsi,%r8
   19584:	89 c1                	mov    %eax,%ecx
   19586:	09 d1                	or     %edx,%ecx
   19588:	89 c6                	mov    %eax,%esi
   1958a:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   19590:	29 f2                	sub    %esi,%edx
   19592:	85 c0                	test   %eax,%eax
   19594:	48 0f 49 d1          	cmovns %rcx,%rdx
   19598:	41 39 d0             	cmp    %edx,%r8d
   1959b:	0f 92 c0             	setb   %al
   1959e:	c3                   	ret
   1959f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::expanded:
   195a0:	41 57                	push   %r15
   195a2:	41 56                	push   %r14
   195a4:	41 54                	push   %r12
   195a6:	53                   	push   %rbx
   195a7:	48 83 ec 18          	sub    $0x18,%rsp
   195ab:	48 89 fb             	mov    %rdi,%rbx
   195ae:	f6 06 01             	testb  $0x1,(%rsi)
   195b1:	74 7c                	je     1962f <<hyperinterval::float::F32Enclosure>::expanded+0x8f>
   195b3:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   195b9:	8b 46 04             	mov    0x4(%rsi),%eax
   195bc:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   195c0:	8d 88 00 00 00 80    	lea    -0x80000000(%rax),%ecx
   195c6:	85 c0                	test   %eax,%eax
   195c8:	0f 44 c8             	cmove  %eax,%ecx
   195cb:	31 c0                	xor    %eax,%eax
   195cd:	85 c9                	test   %ecx,%ecx
   195cf:	0f 99 c0             	setns  %al
   195d2:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
   195d6:	48 ff c9             	dec    %rcx
   195d9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   195de:	be 00 00 00 80       	mov    $0x80000000,%esi
   195e3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   195e8:	e8 63 e8 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   195ed:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   195f2:	75 2f                	jne    19623 <<hyperinterval::float::F32Enclosure>::expanded+0x83>
   195f4:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   195f9:	31 c0                	xor    %eax,%eax
   195fb:	45 85 f6             	test   %r14d,%r14d
   195fe:	0f 99 c0             	setns  %al
   19601:	49 8d 0c 46          	lea    (%r14,%rax,2),%rcx
   19605:	48 ff c9             	dec    %rcx
   19608:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1960d:	be 00 00 00 80       	mov    $0x80000000,%esi
   19612:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19617:	e8 34 e8 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1961c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19621:	75 21                	jne    19644 <<hyperinterval::float::F32Enclosure>::expanded+0xa4>
   19623:	c6 43 04 03          	movb   $0x3,0x4(%rbx)
   19627:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1962d:	eb 06                	jmp    19635 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   1962f:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   19635:	48 89 d8             	mov    %rbx,%rax
   19638:	48 83 c4 18          	add    $0x18,%rsp
   1963c:	5b                   	pop    %rbx
   1963d:	41 5c                	pop    %r12
   1963f:	41 5e                	pop    %r14
   19641:	41 5f                	pop    %r15
   19643:	c3                   	ret
   19644:	44 89 e1             	mov    %r12d,%ecx
   19647:	4c 31 f9             	xor    %r15,%rcx
   1964a:	4d 85 e4             	test   %r12,%r12
   1964d:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   19652:	49 0f 44 cc          	cmove  %r12,%rcx
   19656:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1965b:	be 00 00 00 80       	mov    $0x80000000,%esi
   19660:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19665:	e8 e6 e7 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1966a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1966f:	74 23                	je     19694 <<hyperinterval::float::F32Enclosure>::expanded+0xf4>
   19671:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   19676:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1967b:	be 00 00 00 80       	mov    $0x80000000,%esi
   19680:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19685:	4c 89 f1             	mov    %r14,%rcx
   19688:	e8 c3 e7 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1968d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19692:	75 10                	jne    196a4 <<hyperinterval::float::F32Enclosure>::expanded+0x104>
   19694:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   19699:	88 43 04             	mov    %al,0x4(%rbx)
   1969c:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   196a2:	eb 91                	jmp    19635 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   196a4:	8b 44 24 10          	mov    0x10(%rsp),%eax
   196a8:	44 89 e1             	mov    %r12d,%ecx
   196ab:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   196b1:	89 c2                	mov    %eax,%edx
   196b3:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   196b9:	be 00 00 00 80       	mov    $0x80000000,%esi
   196be:	29 ce                	sub    %ecx,%esi
   196c0:	44 09 f9             	or     %r15d,%ecx
   196c3:	45 85 e4             	test   %r12d,%r12d
   196c6:	48 0f 49 f1          	cmovns %rcx,%rsi
   196ca:	89 d1                	mov    %edx,%ecx
   196cc:	44 09 f9             	or     %r15d,%ecx
   196cf:	41 29 d7             	sub    %edx,%r15d
   196d2:	85 c0                	test   %eax,%eax
   196d4:	4c 0f 49 f9          	cmovns %rcx,%r15
   196d8:	44 39 fe             	cmp    %r15d,%esi
   196db:	76 0f                	jbe    196ec <<hyperinterval::float::F32Enclosure>::expanded+0x14c>
   196dd:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   196e1:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   196e7:	e9 49 ff ff ff       	jmp    19635 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   196ec:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   196f2:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   196f6:	89 43 08             	mov    %eax,0x8(%rbx)
   196f9:	e9 37 ff ff ff       	jmp    19635 <<hyperinterval::float::F32Enclosure>::expanded+0x95>
   196fe:	cc                   	int3
   196ff:	cc                   	int3

<hyperinterval::float::F32Enclosure>::overlaps:
   19700:	31 c0                	xor    %eax,%eax
   19702:	83 3f 00             	cmpl   $0x0,(%rdi)
   19705:	0f 84 a1 00 00 00    	je     197ac <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1970b:	8b 0e                	mov    (%rsi),%ecx
   1970d:	85 c9                	test   %ecx,%ecx
   1970f:	0f 84 97 00 00 00    	je     197ac <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   19715:	f6 c1 01             	test   $0x1,%cl
   19718:	74 4b                	je     19765 <<hyperinterval::float::F32Enclosure>::overlaps+0x65>
   1971a:	8b 46 04             	mov    0x4(%rsi),%eax
   1971d:	8b 57 08             	mov    0x8(%rdi),%edx
   19720:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   19726:	41 89 d1             	mov    %edx,%r9d
   19729:	45 09 c1             	or     %r8d,%r9d
   1972c:	41 89 d2             	mov    %edx,%r10d
   1972f:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   19736:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1973c:	45 29 d3             	sub    %r10d,%r11d
   1973f:	85 d2                	test   %edx,%edx
   19741:	4d 0f 49 d9          	cmovns %r9,%r11
   19745:	89 c2                	mov    %eax,%edx
   19747:	44 09 c2             	or     %r8d,%edx
   1974a:	41 89 c1             	mov    %eax,%r9d
   1974d:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   19754:	45 29 c8             	sub    %r9d,%r8d
   19757:	85 c0                	test   %eax,%eax
   19759:	4c 0f 49 c2          	cmovns %rdx,%r8
   1975d:	45 39 c3             	cmp    %r8d,%r11d
   19760:	73 03                	jae    19765 <<hyperinterval::float::F32Enclosure>::overlaps+0x65>
   19762:	31 c0                	xor    %eax,%eax
   19764:	c3                   	ret
   19765:	b0 01                	mov    $0x1,%al
   19767:	f6 c1 01             	test   $0x1,%cl
   1976a:	74 40                	je     197ac <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1976c:	8b 47 04             	mov    0x4(%rdi),%eax
   1976f:	8b 4e 08             	mov    0x8(%rsi),%ecx
   19772:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19777:	89 ce                	mov    %ecx,%esi
   19779:	09 d6                	or     %edx,%esi
   1977b:	89 cf                	mov    %ecx,%edi
   1977d:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   19783:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   19789:	41 29 f8             	sub    %edi,%r8d
   1978c:	85 c9                	test   %ecx,%ecx
   1978e:	4c 0f 49 c6          	cmovns %rsi,%r8
   19792:	89 c1                	mov    %eax,%ecx
   19794:	09 d1                	or     %edx,%ecx
   19796:	89 c6                	mov    %eax,%esi
   19798:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1979e:	29 f2                	sub    %esi,%edx
   197a0:	85 c0                	test   %eax,%eax
   197a2:	48 0f 49 d1          	cmovns %rcx,%rdx
   197a6:	41 39 d0             	cmp    %edx,%r8d
   197a9:	0f 93 c0             	setae  %al
   197ac:	c3                   	ret
   197ad:	cc                   	int3
   197ae:	cc                   	int3
   197af:	cc                   	int3

<hyperinterval::float::F32Enclosure>::from_bits:
   197b0:	41 57                	push   %r15
   197b2:	41 56                	push   %r14
   197b4:	53                   	push   %rbx
   197b5:	48 83 ec 10          	sub    $0x10,%rsp
   197b9:	48 89 fb             	mov    %rdi,%rbx
   197bc:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   197c2:	48 89 e7             	mov    %rsp,%rdi
   197c5:	be 00 00 00 80       	mov    $0x80000000,%esi
   197ca:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   197cf:	31 c9                	xor    %ecx,%ecx
   197d1:	e8 7a e6 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   197d6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   197da:	74 1f                	je     197fb <<hyperinterval::float::F32Enclosure>::from_bits+0x4b>
   197dc:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   197e1:	48 89 e7             	mov    %rsp,%rdi
   197e4:	be 00 00 00 80       	mov    $0x80000000,%esi
   197e9:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   197ee:	31 c9                	xor    %ecx,%ecx
   197f0:	e8 5b e6 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   197f5:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   197f9:	75 18                	jne    19813 <<hyperinterval::float::F32Enclosure>::from_bits+0x63>
   197fb:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   19800:	88 43 04             	mov    %al,0x4(%rbx)
   19803:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19809:	48 83 c4 10          	add    $0x10,%rsp
   1980d:	5b                   	pop    %rbx
   1980e:	41 5e                	pop    %r14
   19810:	41 5f                	pop    %r15
   19812:	c3                   	ret
   19813:	8b 44 24 08          	mov    0x8(%rsp),%eax
   19817:	44 89 f9             	mov    %r15d,%ecx
   1981a:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19820:	89 c2                	mov    %eax,%edx
   19822:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19828:	be 00 00 00 80       	mov    $0x80000000,%esi
   1982d:	29 ce                	sub    %ecx,%esi
   1982f:	44 09 f1             	or     %r14d,%ecx
   19832:	45 85 ff             	test   %r15d,%r15d
   19835:	48 0f 49 f1          	cmovns %rcx,%rsi
   19839:	89 d1                	mov    %edx,%ecx
   1983b:	44 09 f1             	or     %r14d,%ecx
   1983e:	41 29 d6             	sub    %edx,%r14d
   19841:	85 c0                	test   %eax,%eax
   19843:	4c 0f 49 f1          	cmovns %rcx,%r14
   19847:	44 39 f6             	cmp    %r14d,%esi
   1984a:	76 06                	jbe    19852 <<hyperinterval::float::F32Enclosure>::from_bits+0xa2>
   1984c:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   19850:	eb b1                	jmp    19803 <<hyperinterval::float::F32Enclosure>::from_bits+0x53>
   19852:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   19858:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
   1985c:	89 43 08             	mov    %eax,0x8(%rbx)
   1985f:	eb a8                	jmp    19809 <<hyperinterval::float::F32Enclosure>::from_bits+0x59>
   19861:	cc                   	int3
   19862:	cc                   	int3
   19863:	cc                   	int3
   19864:	cc                   	int3
   19865:	cc                   	int3
   19866:	cc                   	int3
   19867:	cc                   	int3
   19868:	cc                   	int3
   19869:	cc                   	int3
   1986a:	cc                   	int3
   1986b:	cc                   	int3
   1986c:	cc                   	int3
   1986d:	cc                   	int3
   1986e:	cc                   	int3
   1986f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::next_down:
   19870:	53                   	push   %rbx
   19871:	48 83 ec 10          	sub    $0x10,%rsp
   19875:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   1987a:	66 0f 7e c1          	movd   %xmm0,%ecx
   1987e:	48 89 e7             	mov    %rsp,%rdi
   19881:	be 00 00 00 80       	mov    $0x80000000,%esi
   19886:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1988b:	e8 c0 e5 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   19890:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19894:	75 11                	jne    198a7 <<hyperinterval::float::F32Enclosure>::next_down+0x37>
   19896:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1989b:	c1 e0 08             	shl    $0x8,%eax
   1989e:	48 ff c0             	inc    %rax
   198a1:	48 83 c4 10          	add    $0x10,%rsp
   198a5:	5b                   	pop    %rbx
   198a6:	c3                   	ret
   198a7:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   198ac:	48 89 c1             	mov    %rax,%rcx
   198af:	48 31 d9             	xor    %rbx,%rcx
   198b2:	48 85 c0             	test   %rax,%rax
   198b5:	48 0f 44 c8          	cmove  %rax,%rcx
   198b9:	31 c0                	xor    %eax,%eax
   198bb:	85 c9                	test   %ecx,%ecx
   198bd:	0f 99 c0             	setns  %al
   198c0:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
   198c4:	48 ff c9             	dec    %rcx
   198c7:	48 89 e7             	mov    %rsp,%rdi
   198ca:	be 00 00 00 80       	mov    $0x80000000,%esi
   198cf:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   198d4:	e8 77 e5 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   198d9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   198dd:	75 0b                	jne    198ea <<hyperinterval::float::F32Enclosure>::next_down+0x7a>
   198df:	b8 01 03 00 00       	mov    $0x301,%eax
   198e4:	48 83 c4 10          	add    $0x10,%rsp
   198e8:	5b                   	pop    %rbx
   198e9:	c3                   	ret
   198ea:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   198ef:	48 89 c8             	mov    %rcx,%rax
   198f2:	48 35 00 00 00 80    	xor    $0xffffffff80000000,%rax
   198f8:	48 c1 e0 20          	shl    $0x20,%rax
   198fc:	48 85 c9             	test   %rcx,%rcx
   198ff:	48 0f 44 c1          	cmove  %rcx,%rax
   19903:	48 83 c4 10          	add    $0x10,%rsp
   19907:	5b                   	pop    %rbx
   19908:	c3                   	ret
   19909:	cc                   	int3
   1990a:	cc                   	int3
   1990b:	cc                   	int3
   1990c:	cc                   	int3
   1990d:	cc                   	int3
   1990e:	cc                   	int3
   1990f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::subset_of:
   19910:	b0 01                	mov    $0x1,%al
   19912:	f6 07 01             	testb  $0x1,(%rdi)
   19915:	74 50                	je     19967 <<hyperinterval::float::F32Enclosure>::subset_of+0x57>
   19917:	f6 06 01             	testb  $0x1,(%rsi)
   1991a:	74 49                	je     19965 <<hyperinterval::float::F32Enclosure>::subset_of+0x55>
   1991c:	8b 4f 04             	mov    0x4(%rdi),%ecx
   1991f:	8b 56 04             	mov    0x4(%rsi),%edx
   19922:	b8 00 00 00 80       	mov    $0x80000000,%eax
   19927:	44 8d 04 02          	lea    (%rdx,%rax,1),%r8d
   1992b:	41 89 d1             	mov    %edx,%r9d
   1992e:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   19935:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1993b:	45 29 ca             	sub    %r9d,%r10d
   1993e:	85 d2                	test   %edx,%edx
   19940:	4d 0f 49 d0          	cmovns %r8,%r10
   19944:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   19947:	41 89 c8             	mov    %ecx,%r8d
   1994a:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   19951:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   19957:	45 29 c1             	sub    %r8d,%r9d
   1995a:	85 c9                	test   %ecx,%ecx
   1995c:	4c 0f 49 ca          	cmovns %rdx,%r9
   19960:	45 39 ca             	cmp    %r9d,%r10d
   19963:	76 03                	jbe    19968 <<hyperinterval::float::F32Enclosure>::subset_of+0x58>
   19965:	31 c0                	xor    %eax,%eax
   19967:	c3                   	ret
   19968:	8b 4f 08             	mov    0x8(%rdi),%ecx
   1996b:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1996e:	89 cf                	mov    %ecx,%edi
   19970:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   19976:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1997c:	41 29 f8             	sub    %edi,%r8d
   1997f:	85 c9                	test   %ecx,%ecx
   19981:	4c 0f 49 c2          	cmovns %rdx,%r8
   19985:	8b 4e 08             	mov    0x8(%rsi),%ecx
   19988:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1998b:	89 ce                	mov    %ecx,%esi
   1998d:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   19993:	29 f0                	sub    %esi,%eax
   19995:	85 c9                	test   %ecx,%ecx
   19997:	48 0f 49 c2          	cmovns %rdx,%rax
   1999b:	41 39 c0             	cmp    %eax,%r8d
   1999e:	0f 96 c0             	setbe  %al
   199a1:	c3                   	ret
   199a2:	cc                   	int3
   199a3:	cc                   	int3
   199a4:	cc                   	int3
   199a5:	cc                   	int3
   199a6:	cc                   	int3
   199a7:	cc                   	int3
   199a8:	cc                   	int3
   199a9:	cc                   	int3
   199aa:	cc                   	int3
   199ab:	cc                   	int3
   199ac:	cc                   	int3
   199ad:	cc                   	int3
   199ae:	cc                   	int3
   199af:	cc                   	int3

<hyperinterval::ieee::Format>::add:
   199b0:	48 85 c9             	test   %rcx,%rcx
   199b3:	74 50                	je     19a05 <<hyperinterval::ieee::Format>::add+0x55>
   199b5:	48 89 c8             	mov    %rcx,%rax
   199b8:	4d 85 c0             	test   %r8,%r8
   199bb:	74 54                	je     19a11 <<hyperinterval::ieee::Format>::add+0x61>
   199bd:	55                   	push   %rbp
   199be:	41 57                	push   %r15
   199c0:	41 56                	push   %r14
   199c2:	41 55                	push   %r13
   199c4:	41 54                	push   %r12
   199c6:	53                   	push   %rbx
   199c7:	48 83 ec 38          	sub    $0x38,%rsp
   199cb:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
   199d0:	49 89 c7             	mov    %rax,%r15
   199d3:	49 21 d7             	and    %rdx,%r15
   199d6:	44 89 c9             	mov    %r9d,%ecx
   199d9:	49 d3 ef             	shr    %cl,%r15
   199dc:	41 bd 01 00 00 00    	mov    $0x1,%r13d
   199e2:	49 d3 e5             	shl    %cl,%r13
   199e5:	49 8d 5d ff          	lea    -0x1(%r13),%rbx
   199e9:	49 89 de             	mov    %rbx,%r14
   199ec:	49 21 c6             	and    %rax,%r14
   199ef:	49 89 d2             	mov    %rdx,%r10
   199f2:	49 d3 ea             	shr    %cl,%r10
   199f5:	4d 85 ff             	test   %r15,%r15
   199f8:	74 23                	je     19a1d <<hyperinterval::ieee::Format>::add+0x6d>
   199fa:	4d 09 ee             	or     %r13,%r14
   199fd:	49 d1 ea             	shr    $1,%r10
   19a00:	45 01 ca             	add    %r9d,%r10d
   19a03:	eb 24                	jmp    19a29 <<hyperinterval::ieee::Format>::add+0x79>
   19a05:	4c 89 47 08          	mov    %r8,0x8(%rdi)
   19a09:	4c 89 47 10          	mov    %r8,0x10(%rdi)
   19a0d:	c6 07 00             	movb   $0x0,(%rdi)
   19a10:	c3                   	ret
   19a11:	48 89 47 08          	mov    %rax,0x8(%rdi)
   19a15:	48 89 47 10          	mov    %rax,0x10(%rdi)
   19a19:	c6 07 00             	movb   $0x0,(%rdi)
   19a1c:	c3                   	ret
   19a1d:	49 d1 ea             	shr    $1,%r10
   19a20:	45 01 ca             	add    %r9d,%r10d
   19a23:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   19a29:	45 29 d7             	sub    %r10d,%r15d
   19a2c:	48 85 f0             	test   %rsi,%rax
   19a2f:	0f 95 44 24 0f       	setne  0xf(%rsp)
   19a34:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   19a39:	49 0f bd ce          	bsr    %r14,%rcx
   19a3d:	83 f1 3f             	xor    $0x3f,%ecx
   19a40:	46 8d 1c 09          	lea    (%rcx,%r9,1),%r11d
   19a44:	41 83 c3 c1          	add    $0xffffffc1,%r11d
   19a48:	45 31 e4             	xor    %r12d,%r12d
   19a4b:	44 89 d9             	mov    %r11d,%ecx
   19a4e:	4d 0f a5 f4          	shld   %cl,%r14,%r12
   19a52:	49 d3 e6             	shl    %cl,%r14
   19a55:	31 c9                	xor    %ecx,%ecx
   19a57:	41 f6 c3 40          	test   $0x40,%r11b
   19a5b:	4d 0f 45 e6          	cmovne %r14,%r12
   19a5f:	4c 0f 45 f1          	cmovne %rcx,%r14
   19a63:	4d 89 c2             	mov    %r8,%r10
   19a66:	49 21 d2             	and    %rdx,%r10
   19a69:	44 89 c9             	mov    %r9d,%ecx
   19a6c:	49 d3 ea             	shr    %cl,%r10
   19a6f:	41 8d 69 81          	lea    -0x7f(%r9),%ebp
   19a73:	45 29 df             	sub    %r11d,%r15d
   19a76:	4c 21 c3             	and    %r8,%rbx
   19a79:	49 89 d3             	mov    %rdx,%r11
   19a7c:	49 d3 eb             	shr    %cl,%r11
   19a7f:	4d 85 d2             	test   %r10,%r10
   19a82:	74 0b                	je     19a8f <<hyperinterval::ieee::Format>::add+0xdf>
   19a84:	4c 09 eb             	or     %r13,%rbx
   19a87:	49 d1 eb             	shr    $1,%r11
   19a8a:	45 01 cb             	add    %r9d,%r11d
   19a8d:	eb 0c                	jmp    19a9b <<hyperinterval::ieee::Format>::add+0xeb>
   19a8f:	49 d1 eb             	shr    $1,%r11
   19a92:	45 01 cb             	add    %r9d,%r11d
   19a95:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   19a9b:	45 29 da             	sub    %r11d,%r10d
   19a9e:	49 85 f0             	test   %rsi,%r8
   19aa1:	41 0f 95 c5          	setne  %r13b
   19aa5:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   19aaa:	48 0f bd cb          	bsr    %rbx,%rcx
   19aae:	83 f1 3f             	xor    $0x3f,%ecx
   19ab1:	01 e9                	add    %ebp,%ecx
   19ab3:	83 c1 40             	add    $0x40,%ecx
   19ab6:	45 31 db             	xor    %r11d,%r11d
   19ab9:	49 0f a5 db          	shld   %cl,%rbx,%r11
   19abd:	48 d3 e3             	shl    %cl,%rbx
   19ac0:	45 31 c9             	xor    %r9d,%r9d
   19ac3:	f6 c1 40             	test   $0x40,%cl
   19ac6:	4c 0f 45 db          	cmovne %rbx,%r11
   19aca:	49 0f 45 d9          	cmovne %r9,%rbx
   19ace:	41 29 ca             	sub    %ecx,%r10d
   19ad1:	45 39 d7             	cmp    %r10d,%r15d
   19ad4:	7d 76                	jge    19b4c <<hyperinterval::ieee::Format>::add+0x19c>
   19ad6:	44 89 f9             	mov    %r15d,%ecx
   19ad9:	44 0f b6 7c 24 0f    	movzbl 0xf(%rsp),%r15d
   19adf:	4d 89 f1             	mov    %r14,%r9
   19ae2:	4c 89 e5             	mov    %r12,%rbp
   19ae5:	4d 89 c6             	mov    %r8,%r14
   19ae8:	45 89 ec             	mov    %r13d,%r12d
   19aeb:	45 89 fd             	mov    %r15d,%r13d
   19aee:	41 29 ca             	sub    %ecx,%r10d
   19af1:	41 83 fa 4a          	cmp    $0x4a,%r10d
   19af5:	7f 79                	jg     19b70 <<hyperinterval::ieee::Format>::add+0x1c0>
   19af7:	41 89 cf             	mov    %ecx,%r15d
   19afa:	49 85 f0             	test   %rsi,%r8
   19afd:	41 0f 95 c0          	setne  %r8b
   19b01:	48 85 f0             	test   %rsi,%rax
   19b04:	41 0f 95 c6          	setne  %r14b
   19b08:	44 89 d1             	mov    %r10d,%ecx
   19b0b:	49 0f a5 db          	shld   %cl,%rbx,%r11
   19b0f:	48 d3 e3             	shl    %cl,%rbx
   19b12:	31 c0                	xor    %eax,%eax
   19b14:	41 f6 c2 40          	test   $0x40,%r10b
   19b18:	4c 0f 45 db          	cmovne %rbx,%r11
   19b1c:	48 0f 44 c3          	cmove  %rbx,%rax
   19b20:	45 30 c6             	xor    %r8b,%r14b
   19b23:	0f 84 98 00 00 00    	je     19bc1 <<hyperinterval::ieee::Format>::add+0x211>
   19b29:	4c 39 c8             	cmp    %r9,%rax
   19b2c:	4c 89 d9             	mov    %r11,%rcx
   19b2f:	48 19 e9             	sbb    %rbp,%rcx
   19b32:	0f 83 bb 00 00 00    	jae    19bf3 <<hyperinterval::ieee::Format>::add+0x243>
   19b38:	49 29 c1             	sub    %rax,%r9
   19b3b:	4c 19 dd             	sbb    %r11,%rbp
   19b3e:	45 89 ec             	mov    %r13d,%r12d
   19b41:	4c 89 c8             	mov    %r9,%rax
   19b44:	49 89 eb             	mov    %rbp,%r11
   19b47:	e9 ad 00 00 00       	jmp    19bf9 <<hyperinterval::ieee::Format>::add+0x249>
   19b4c:	44 89 d1             	mov    %r10d,%ecx
   19b4f:	49 89 d9             	mov    %rbx,%r9
   19b52:	4c 89 dd             	mov    %r11,%rbp
   19b55:	4d 89 e3             	mov    %r12,%r11
   19b58:	4c 89 f3             	mov    %r14,%rbx
   19b5b:	44 0f b6 64 24 0f    	movzbl 0xf(%rsp),%r12d
   19b61:	45 89 fa             	mov    %r15d,%r10d
   19b64:	49 89 c6             	mov    %rax,%r14
   19b67:	41 29 ca             	sub    %ecx,%r10d
   19b6a:	41 83 fa 4a          	cmp    $0x4a,%r10d
   19b6e:	7e 87                	jle    19af7 <<hyperinterval::ieee::Format>::add+0x147>
   19b70:	48 89 fb             	mov    %rdi,%rbx
   19b73:	4c 89 f0             	mov    %r14,%rax
   19b76:	45 84 ed             	test   %r13b,%r13b
   19b79:	74 4e                	je     19bc9 <<hyperinterval::ieee::Format>::add+0x219>
   19b7b:	48 31 f0             	xor    %rsi,%rax
   19b7e:	48 89 c1             	mov    %rax,%rcx
   19b81:	48 21 f1             	and    %rsi,%rcx
   19b84:	31 ff                	xor    %edi,%edi
   19b86:	48 f7 d9             	neg    %rcx
   19b89:	40 0f 93 c7          	setae  %dil
   19b8d:	48 8d 0c 78          	lea    (%rax,%rdi,2),%rcx
   19b91:	48 ff c9             	dec    %rcx
   19b94:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   19b99:	49 89 f7             	mov    %rsi,%r15
   19b9c:	e8 af e2 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   19ba1:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   19ba6:	75 44                	jne    19bec <<hyperinterval::ieee::Format>::add+0x23c>
   19ba8:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   19bad:	49 31 c7             	xor    %rax,%r15
   19bb0:	48 85 c0             	test   %rax,%rax
   19bb3:	4c 0f 44 f8          	cmove  %rax,%r15
   19bb7:	4c 89 7b 08          	mov    %r15,0x8(%rbx)
   19bbb:	4c 89 73 10          	mov    %r14,0x10(%rbx)
   19bbf:	eb 65                	jmp    19c26 <<hyperinterval::ieee::Format>::add+0x276>
   19bc1:	4c 01 c8             	add    %r9,%rax
   19bc4:	49 11 eb             	adc    %rbp,%r11
   19bc7:	eb 30                	jmp    19bf9 <<hyperinterval::ieee::Format>::add+0x249>
   19bc9:	48 21 f0             	and    %rsi,%rax
   19bcc:	31 c9                	xor    %ecx,%ecx
   19bce:	48 f7 d8             	neg    %rax
   19bd1:	0f 93 c1             	setae  %cl
   19bd4:	49 8d 0c 4e          	lea    (%r14,%rcx,2),%rcx
   19bd8:	48 ff c9             	dec    %rcx
   19bdb:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   19be0:	e8 6b e2 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   19be5:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   19bea:	74 2d                	je     19c19 <<hyperinterval::ieee::Format>::add+0x269>
   19bec:	66 c7 03 01 03       	movw   $0x301,(%rbx)
   19bf1:	eb 36                	jmp    19c29 <<hyperinterval::ieee::Format>::add+0x279>
   19bf3:	4c 29 c8             	sub    %r9,%rax
   19bf6:	49 19 eb             	sbb    %rbp,%r11
   19bf9:	44 88 64 24 24       	mov    %r12b,0x24(%rsp)
   19bfe:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   19c03:	4c 89 5c 24 18       	mov    %r11,0x18(%rsp)
   19c08:	44 89 7c 24 20       	mov    %r15d,0x20(%rsp)
   19c0d:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   19c12:	e8 79 08 00 00       	call   1a490 <<hyperinterval::ieee::Format>::rounded>
   19c17:	eb 10                	jmp    19c29 <<hyperinterval::ieee::Format>::add+0x279>
   19c19:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   19c1e:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   19c22:	48 89 43 10          	mov    %rax,0x10(%rbx)
   19c26:	c6 03 00             	movb   $0x0,(%rbx)
   19c29:	48 83 c4 38          	add    $0x38,%rsp
   19c2d:	5b                   	pop    %rbx
   19c2e:	41 5c                	pop    %r12
   19c30:	41 5d                	pop    %r13
   19c32:	41 5e                	pop    %r14
   19c34:	41 5f                	pop    %r15
   19c36:	5d                   	pop    %rbp
   19c37:	c3                   	ret
   19c38:	cc                   	int3
   19c39:	cc                   	int3
   19c3a:	cc                   	int3
   19c3b:	cc                   	int3
   19c3c:	cc                   	int3
   19c3d:	cc                   	int3
   19c3e:	cc                   	int3
   19c3f:	cc                   	int3

<hyperinterval::ieee::Format>::div:
   19c40:	55                   	push   %rbp
   19c41:	41 57                	push   %r15
   19c43:	41 56                	push   %r14
   19c45:	41 55                	push   %r13
   19c47:	41 54                	push   %r12
   19c49:	53                   	push   %rbx
   19c4a:	48 83 ec 38          	sub    $0x38,%rsp
   19c4e:	4d 85 c0             	test   %r8,%r8
   19c51:	74 47                	je     19c9a <<hyperinterval::ieee::Format>::div+0x5a>
   19c53:	48 85 c9             	test   %rcx,%rcx
   19c56:	74 4c                	je     19ca4 <<hyperinterval::ieee::Format>::div+0x64>
   19c58:	f3 4c 0f bc f2       	tzcnt  %rdx,%r14
   19c5d:	49 89 c9             	mov    %rcx,%r9
   19c60:	49 21 d1             	and    %rdx,%r9
   19c63:	48 89 c8             	mov    %rcx,%rax
   19c66:	44 89 f1             	mov    %r14d,%ecx
   19c69:	49 d3 e9             	shr    %cl,%r9
   19c6c:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   19c72:	49 d3 e2             	shl    %cl,%r10
   19c75:	49 8d 6a ff          	lea    -0x1(%r10),%rbp
   19c79:	49 89 ec             	mov    %rbp,%r12
   19c7c:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   19c81:	49 21 c4             	and    %rax,%r12
   19c84:	48 89 d0             	mov    %rdx,%rax
   19c87:	48 d3 e8             	shr    %cl,%rax
   19c8a:	4d 85 c9             	test   %r9,%r9
   19c8d:	74 24                	je     19cb3 <<hyperinterval::ieee::Format>::div+0x73>
   19c8f:	4d 09 d4             	or     %r10,%r12
   19c92:	48 d1 e8             	shr    $1,%rax
   19c95:	44 01 f0             	add    %r14d,%eax
   19c98:	eb 25                	jmp    19cbf <<hyperinterval::ieee::Format>::div+0x7f>
   19c9a:	66 c7 07 01 04       	movw   $0x401,(%rdi)
   19c9f:	e9 ae 03 00 00       	jmp    1a052 <<hyperinterval::ieee::Format>::div+0x412>
   19ca4:	c6 07 00             	movb   $0x0,(%rdi)
   19ca7:	0f 57 c0             	xorps  %xmm0,%xmm0
   19caa:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   19cae:	e9 9f 03 00 00       	jmp    1a052 <<hyperinterval::ieee::Format>::div+0x412>
   19cb3:	48 d1 e8             	shr    $1,%rax
   19cb6:	44 01 f0             	add    %r14d,%eax
   19cb9:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   19cbf:	41 29 c1             	sub    %eax,%r9d
   19cc2:	4d 89 c3             	mov    %r8,%r11
   19cc5:	49 21 d3             	and    %rdx,%r11
   19cc8:	44 89 f1             	mov    %r14d,%ecx
   19ccb:	49 d3 eb             	shr    %cl,%r11
   19cce:	4c 21 c5             	and    %r8,%rbp
   19cd1:	48 89 d0             	mov    %rdx,%rax
   19cd4:	48 d3 e8             	shr    %cl,%rax
   19cd7:	4d 85 db             	test   %r11,%r11
   19cda:	74 0e                	je     19cea <<hyperinterval::ieee::Format>::div+0xaa>
   19cdc:	4c 09 d5             	or     %r10,%rbp
   19cdf:	48 d1 e8             	shr    $1,%rax
   19ce2:	44 01 f0             	add    %r14d,%eax
   19ce5:	44 29 d8             	sub    %r11d,%eax
   19ce8:	eb 08                	jmp    19cf2 <<hyperinterval::ieee::Format>::div+0xb2>
   19cea:	48 d1 e8             	shr    $1,%rax
   19ced:	44 01 f0             	add    %r14d,%eax
   19cf0:	ff c8                	dec    %eax
   19cf2:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   19cf7:	41 ba 7f 00 00 00    	mov    $0x7f,%r10d
   19cfd:	4c 0f bd d5          	bsr    %rbp,%r10
   19d01:	41 83 f2 3f          	xor    $0x3f,%r10d
   19d05:	41 83 c2 40          	add    $0x40,%r10d
   19d09:	49 0f bd cc          	bsr    %r12,%rcx
   19d0d:	83 f1 3f             	xor    $0x3f,%ecx
   19d10:	45 89 d7             	mov    %r10d,%r15d
   19d13:	41 29 cf             	sub    %ecx,%r15d
   19d16:	41 83 c7 c0          	add    $0xffffffc0,%r15d
   19d1a:	78 26                	js     19d42 <<hyperinterval::ieee::Format>::div+0x102>
   19d1c:	45 31 db             	xor    %r11d,%r11d
   19d1f:	44 89 f9             	mov    %r15d,%ecx
   19d22:	49 0f a5 eb          	shld   %cl,%rbp,%r11
   19d26:	31 db                	xor    %ebx,%ebx
   19d28:	49 89 ed             	mov    %rbp,%r13
   19d2b:	49 d3 e5             	shl    %cl,%r13
   19d2e:	41 f6 c7 40          	test   $0x40,%r15b
   19d32:	4d 0f 45 dd          	cmovne %r13,%r11
   19d36:	4c 0f 45 eb          	cmovne %rbx,%r13
   19d3a:	4d 39 ec             	cmp    %r13,%r12
   19d3d:	4c 19 db             	sbb    %r11,%rbx
   19d40:	eb 26                	jmp    19d68 <<hyperinterval::ieee::Format>::div+0x128>
   19d42:	44 89 f9             	mov    %r15d,%ecx
   19d45:	f6 d9                	neg    %cl
   19d47:	45 31 db             	xor    %r11d,%r11d
   19d4a:	4d 0f a5 e3          	shld   %cl,%r12,%r11
   19d4e:	31 db                	xor    %ebx,%ebx
   19d50:	4d 89 e5             	mov    %r12,%r13
   19d53:	49 d3 e5             	shl    %cl,%r13
   19d56:	f6 c1 40             	test   $0x40,%cl
   19d59:	4d 0f 45 dd          	cmovne %r13,%r11
   19d5d:	4c 0f 45 eb          	cmovne %rbx,%r13
   19d61:	49 39 ed             	cmp    %rbp,%r13
   19d64:	49 83 db 00          	sbb    $0x0,%r11
   19d68:	41 0f 92 c3          	setb   %r11b
   19d6c:	44 89 f1             	mov    %r14d,%ecx
   19d6f:	48 d3 ea             	shr    %cl,%rdx
   19d72:	44 01 c8             	add    %r9d,%eax
   19d75:	41 01 c7             	add    %eax,%r15d
   19d78:	41 0f b6 cb          	movzbl %r11b,%ecx
   19d7c:	41 29 cf             	sub    %ecx,%r15d
   19d7f:	48 d1 ea             	shr    $1,%rdx
   19d82:	41 39 d7             	cmp    %edx,%r15d
   19d85:	0f 8f 0e 02 00 00    	jg     19f99 <<hyperinterval::ieee::Format>::div+0x359>
   19d8b:	45 8d 0c 16          	lea    (%r14,%rdx,1),%r9d
   19d8f:	b9 01 00 00 00       	mov    $0x1,%ecx
   19d94:	4c 89 4c 24 08       	mov    %r9,0x8(%rsp)
   19d99:	44 29 c9             	sub    %r9d,%ecx
   19d9c:	45 29 f7             	sub    %r14d,%r15d
   19d9f:	41 39 cf             	cmp    %ecx,%r15d
   19da2:	44 0f 4e f9          	cmovle %ecx,%r15d
   19da6:	44 29 f8             	sub    %r15d,%eax
   19da9:	78 61                	js     19e0c <<hyperinterval::ieee::Format>::div+0x1cc>
   19dab:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   19db0:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
   19db5:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
   19dba:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
   19dbf:	48 85 ed             	test   %rbp,%rbp
   19dc2:	0f 84 99 02 00 00    	je     1a061 <<hyperinterval::ieee::Format>::div+0x421>
   19dc8:	45 31 ed             	xor    %r13d,%r13d
   19dcb:	89 c1                	mov    %eax,%ecx
   19dcd:	4d 0f a5 e5          	shld   %cl,%r12,%r13
   19dd1:	31 d2                	xor    %edx,%edx
   19dd3:	49 d3 e4             	shl    %cl,%r12
   19dd6:	a8 40                	test   $0x40,%al
   19dd8:	4d 0f 45 ec          	cmovne %r12,%r13
   19ddc:	4c 0f 45 e2          	cmovne %rdx,%r12
   19de0:	4c 89 e7             	mov    %r12,%rdi
   19de3:	4c 89 ee             	mov    %r13,%rsi
   19de6:	48 89 ea             	mov    %rbp,%rdx
   19de9:	31 c9                	xor    %ecx,%ecx
   19deb:	ff 15 77 1b 04 00    	call   *0x41b77(%rip)        # 5b968 <_DYNAMIC+0x410>
   19df1:	49 89 c2             	mov    %rax,%r10
   19df4:	49 89 d1             	mov    %rdx,%r9
   19df7:	48 89 d1             	mov    %rdx,%rcx
   19dfa:	48 0f af cd          	imul   %rbp,%rcx
   19dfe:	48 f7 e5             	mul    %rbp
   19e01:	48 01 ca             	add    %rcx,%rdx
   19e04:	49 29 c4             	sub    %rax,%r12
   19e07:	49 19 d5             	sbb    %rdx,%r13
   19e0a:	eb 79                	jmp    19e85 <<hyperinterval::ieee::Format>::div+0x245>
   19e0c:	f7 d8                	neg    %eax
   19e0e:	44 39 d0             	cmp    %r10d,%eax
   19e11:	7e 07                	jle    19e1a <<hyperinterval::ieee::Format>::div+0x1da>
   19e13:	b3 01                	mov    $0x1,%bl
   19e15:	e9 df 00 00 00       	jmp    19ef9 <<hyperinterval::ieee::Format>::div+0x2b9>
   19e1a:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   19e1f:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
   19e24:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
   19e29:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
   19e2e:	31 db                	xor    %ebx,%ebx
   19e30:	89 c1                	mov    %eax,%ecx
   19e32:	48 0f a5 eb          	shld   %cl,%rbp,%rbx
   19e36:	48 d3 e5             	shl    %cl,%rbp
   19e39:	31 c9                	xor    %ecx,%ecx
   19e3b:	a8 40                	test   $0x40,%al
   19e3d:	48 0f 45 dd          	cmovne %rbp,%rbx
   19e41:	48 0f 45 e9          	cmovne %rcx,%rbp
   19e45:	48 89 e8             	mov    %rbp,%rax
   19e48:	48 09 d8             	or     %rbx,%rax
   19e4b:	0f 84 1d 02 00 00    	je     1a06e <<hyperinterval::ieee::Format>::div+0x42e>
   19e51:	45 31 ed             	xor    %r13d,%r13d
   19e54:	4c 89 e7             	mov    %r12,%rdi
   19e57:	31 f6                	xor    %esi,%esi
   19e59:	48 89 ea             	mov    %rbp,%rdx
   19e5c:	48 89 d9             	mov    %rbx,%rcx
   19e5f:	ff 15 03 1b 04 00    	call   *0x41b03(%rip)        # 5b968 <_DYNAMIC+0x410>
   19e65:	49 89 c2             	mov    %rax,%r10
   19e68:	49 89 d1             	mov    %rdx,%r9
   19e6b:	48 0f af d8          	imul   %rax,%rbx
   19e6f:	48 f7 e5             	mul    %rbp
   19e72:	48 01 da             	add    %rbx,%rdx
   19e75:	4c 89 c9             	mov    %r9,%rcx
   19e78:	48 0f af cd          	imul   %rbp,%rcx
   19e7c:	48 01 d1             	add    %rdx,%rcx
   19e7f:	49 29 c4             	sub    %rax,%r12
   19e82:	49 19 cd             	sbb    %rcx,%r13
   19e85:	4d 09 ec             	or     %r13,%r12
   19e88:	0f 95 c3             	setne  %bl
   19e8b:	4c 89 d0             	mov    %r10,%rax
   19e8e:	4c 09 c8             	or     %r9,%rax
   19e91:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
   19e96:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   19e9b:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
   19ea0:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   19ea5:	74 52                	je     19ef9 <<hyperinterval::ieee::Format>::div+0x2b9>
   19ea7:	49 0f bd c1          	bsr    %r9,%rax
   19eab:	83 f0 3f             	xor    $0x3f,%eax
   19eae:	4d 0f bd da          	bsr    %r10,%r11
   19eb2:	41 83 f3 3f          	xor    $0x3f,%r11d
   19eb6:	41 83 cb 40          	or     $0x40,%r11d
   19eba:	4d 85 c9             	test   %r9,%r9
   19ebd:	44 0f 45 d8          	cmovne %eax,%r11d
   19ec1:	41 83 f3 7f          	xor    $0x7f,%r11d
   19ec5:	43 8d 2c 3b          	lea    (%r11,%r15,1),%ebp
   19ec9:	39 d5                	cmp    %edx,%ebp
   19ecb:	0f 8f c8 00 00 00    	jg     19f99 <<hyperinterval::ieee::Format>::div+0x359>
   19ed1:	b8 01 00 00 00       	mov    $0x1,%eax
   19ed6:	29 d0                	sub    %edx,%eax
   19ed8:	39 c5                	cmp    %eax,%ebp
   19eda:	7d 28                	jge    19f04 <<hyperinterval::ieee::Format>::div+0x2c4>
   19edc:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19ee1:	42 8d 0c 38          	lea    (%rax,%r15,1),%ecx
   19ee5:	fe c9                	dec    %cl
   19ee7:	4c 89 d0             	mov    %r10,%rax
   19eea:	48 d3 e0             	shl    %cl,%rax
   19eed:	45 31 db             	xor    %r11d,%r11d
   19ef0:	f6 c1 40             	test   $0x40,%cl
   19ef3:	4c 0f 44 d8          	cmove  %rax,%r11
   19ef7:	eb 68                	jmp    19f61 <<hyperinterval::ieee::Format>::div+0x321>
   19ef9:	45 31 d2             	xor    %r10d,%r10d
   19efc:	45 31 c9             	xor    %r9d,%r9d
   19eff:	45 31 db             	xor    %r11d,%r11d
   19f02:	eb 5d                	jmp    19f61 <<hyperinterval::ieee::Format>::div+0x321>
   19f04:	44 89 f1             	mov    %r14d,%ecx
   19f07:	44 29 d9             	sub    %r11d,%ecx
   19f0a:	4d 89 d4             	mov    %r10,%r12
   19f0d:	49 d3 e4             	shl    %cl,%r12
   19f10:	89 c8                	mov    %ecx,%eax
   19f12:	f7 d8                	neg    %eax
   19f14:	45 31 ed             	xor    %r13d,%r13d
   19f17:	f6 c1 40             	test   $0x40,%cl
   19f1a:	4d 0f 44 ec          	cmove  %r12,%r13
   19f1e:	4d 89 d4             	mov    %r10,%r12
   19f21:	89 c1                	mov    %eax,%ecx
   19f23:	4d 0f ad cc          	shrd   %cl,%r9,%r12
   19f27:	88 5c 24 07          	mov    %bl,0x7(%rsp)
   19f2b:	4c 89 cb             	mov    %r9,%rbx
   19f2e:	48 d3 eb             	shr    %cl,%rbx
   19f31:	a8 40                	test   $0x40,%al
   19f33:	49 0f 44 dc          	cmove  %r12,%rbx
   19f37:	45 39 de             	cmp    %r11d,%r14d
   19f3a:	49 0f 43 dd          	cmovae %r13,%rbx
   19f3e:	01 d5                	add    %edx,%ebp
   19f40:	48 63 c5             	movslq %ebp,%rax
   19f43:	44 89 f1             	mov    %r14d,%ecx
   19f46:	48 d3 e0             	shl    %cl,%rax
   19f49:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   19f50:	49 d3 e3             	shl    %cl,%r11
   19f53:	49 f7 d3             	not    %r11
   19f56:	49 21 db             	and    %rbx,%r11
   19f59:	0f b6 5c 24 07       	movzbl 0x7(%rsp),%ebx
   19f5e:	49 09 c3             	or     %rax,%r11
   19f61:	0f b6 db             	movzbl %bl,%ebx
   19f64:	4c 01 d3             	add    %r10,%rbx
   19f67:	49 83 d1 00          	adc    $0x0,%r9
   19f6b:	48 89 d8             	mov    %rbx,%rax
   19f6e:	4c 09 c8             	or     %r9,%rax
   19f71:	74 30                	je     19fa3 <<hyperinterval::ieee::Format>::div+0x363>
   19f73:	49 0f bd c1          	bsr    %r9,%rax
   19f77:	83 f0 3f             	xor    $0x3f,%eax
   19f7a:	4c 0f bd d3          	bsr    %rbx,%r10
   19f7e:	41 83 f2 3f          	xor    $0x3f,%r10d
   19f82:	41 83 ca 40          	or     $0x40,%r10d
   19f86:	4d 85 c9             	test   %r9,%r9
   19f89:	44 0f 45 d0          	cmovne %eax,%r10d
   19f8d:	41 83 f2 7f          	xor    $0x7f,%r10d
   19f91:	43 8d 2c 3a          	lea    (%r10,%r15,1),%ebp
   19f95:	39 d5                	cmp    %edx,%ebp
   19f97:	7e 0e                	jle    19fa7 <<hyperinterval::ieee::Format>::div+0x367>
   19f99:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   19f9e:	e9 af 00 00 00       	jmp    1a052 <<hyperinterval::ieee::Format>::div+0x412>
   19fa3:	31 c0                	xor    %eax,%eax
   19fa5:	eb 71                	jmp    1a018 <<hyperinterval::ieee::Format>::div+0x3d8>
   19fa7:	b8 01 00 00 00       	mov    $0x1,%eax
   19fac:	29 d0                	sub    %edx,%eax
   19fae:	39 c5                	cmp    %eax,%ebp
   19fb0:	7d 18                	jge    19fca <<hyperinterval::ieee::Format>::div+0x38a>
   19fb2:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19fb7:	44 01 f9             	add    %r15d,%ecx
   19fba:	fe c9                	dec    %cl
   19fbc:	48 d3 e3             	shl    %cl,%rbx
   19fbf:	31 c0                	xor    %eax,%eax
   19fc1:	f6 c1 40             	test   $0x40,%cl
   19fc4:	48 0f 44 c3          	cmove  %rbx,%rax
   19fc8:	eb 4e                	jmp    1a018 <<hyperinterval::ieee::Format>::div+0x3d8>
   19fca:	44 89 f1             	mov    %r14d,%ecx
   19fcd:	44 29 d1             	sub    %r10d,%ecx
   19fd0:	89 c8                	mov    %ecx,%eax
   19fd2:	f7 d8                	neg    %eax
   19fd4:	49 89 df             	mov    %rbx,%r15
   19fd7:	49 d3 e7             	shl    %cl,%r15
   19fda:	45 31 e4             	xor    %r12d,%r12d
   19fdd:	f6 c1 40             	test   $0x40,%cl
   19fe0:	4d 0f 44 e7          	cmove  %r15,%r12
   19fe4:	89 c1                	mov    %eax,%ecx
   19fe6:	4c 0f ad cb          	shrd   %cl,%r9,%rbx
   19fea:	49 d3 e9             	shr    %cl,%r9
   19fed:	a8 40                	test   $0x40,%al
   19fef:	4c 0f 44 cb          	cmove  %rbx,%r9
   19ff3:	45 39 d6             	cmp    %r10d,%r14d
   19ff6:	4d 0f 43 cc          	cmovae %r12,%r9
   19ffa:	01 d5                	add    %edx,%ebp
   19ffc:	48 63 d5             	movslq %ebp,%rdx
   19fff:	44 89 f1             	mov    %r14d,%ecx
   1a002:	48 d3 e2             	shl    %cl,%rdx
   1a005:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   1a00c:	48 d3 e0             	shl    %cl,%rax
   1a00f:	48 f7 d0             	not    %rax
   1a012:	4c 21 c8             	and    %r9,%rax
   1a015:	48 09 d0             	or     %rdx,%rax
   1a018:	48 85 74 24 30       	test   %rsi,0x30(%rsp)
   1a01d:	0f 95 c1             	setne  %cl
   1a020:	49 85 f0             	test   %rsi,%r8
   1a023:	0f 94 c2             	sete   %dl
   1a026:	30 ca                	xor    %cl,%dl
   1a028:	75 1d                	jne    1a047 <<hyperinterval::ieee::Format>::div+0x407>
   1a02a:	48 89 c1             	mov    %rax,%rcx
   1a02d:	48 31 f1             	xor    %rsi,%rcx
   1a030:	48 85 c0             	test   %rax,%rax
   1a033:	48 0f 44 c8          	cmove  %rax,%rcx
   1a037:	4c 31 de             	xor    %r11,%rsi
   1a03a:	4d 85 db             	test   %r11,%r11
   1a03d:	49 0f 44 f3          	cmove  %r11,%rsi
   1a041:	48 89 f0             	mov    %rsi,%rax
   1a044:	49 89 cb             	mov    %rcx,%r11
   1a047:	4c 89 5f 08          	mov    %r11,0x8(%rdi)
   1a04b:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1a04f:	c6 07 00             	movb   $0x0,(%rdi)
   1a052:	48 83 c4 38          	add    $0x38,%rsp
   1a056:	5b                   	pop    %rbx
   1a057:	41 5c                	pop    %r12
   1a059:	41 5d                	pop    %r13
   1a05b:	41 5e                	pop    %r14
   1a05d:	41 5f                	pop    %r15
   1a05f:	5d                   	pop    %rbp
   1a060:	c3                   	ret
   1a061:	48 8d 3d e8 f6 03 00 	lea    0x3f6e8(%rip),%rdi        # 59750 <__frame_dummy_init_array_entry+0x1c0>
   1a068:	ff 15 02 19 04 00    	call   *0x41902(%rip)        # 5b970 <_DYNAMIC+0x418>
   1a06e:	48 8d 3d c3 f6 03 00 	lea    0x3f6c3(%rip),%rdi        # 59738 <__frame_dummy_init_array_entry+0x1a8>
   1a075:	ff 15 f5 18 04 00    	call   *0x418f5(%rip)        # 5b970 <_DYNAMIC+0x418>
   1a07b:	cc                   	int3
   1a07c:	cc                   	int3
   1a07d:	cc                   	int3
   1a07e:	cc                   	int3
   1a07f:	cc                   	int3

<hyperinterval::ieee::Format>::power:
   1a080:	55                   	push   %rbp
   1a081:	41 57                	push   %r15
   1a083:	41 56                	push   %r14
   1a085:	41 55                	push   %r13
   1a087:	41 54                	push   %r12
   1a089:	53                   	push   %rbx
   1a08a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   1a091:	49 89 ca             	mov    %rcx,%r10
   1a094:	49 89 d6             	mov    %rdx,%r14
   1a097:	48 85 f1             	test   %rsi,%rcx
   1a09a:	0f 95 c0             	setne  %al
   1a09d:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
   1a0a2:	49 89 d3             	mov    %rdx,%r11
   1a0a5:	44 89 c9             	mov    %r9d,%ecx
   1a0a8:	49 d3 eb             	shr    %cl,%r11
   1a0ab:	49 d1 eb             	shr    $1,%r11
   1a0ae:	49 63 d3             	movslq %r11d,%rdx
   1a0b1:	48 d3 e2             	shl    %cl,%rdx
   1a0b4:	45 85 c0             	test   %r8d,%r8d
   1a0b7:	0f 84 6b 03 00 00    	je     1a428 <<hyperinterval::ieee::Format>::power+0x3a8>
   1a0bd:	88 44 24 07          	mov    %al,0x7(%rsp)
   1a0c1:	48 89 7c 24 50       	mov    %rdi,0x50(%rsp)
   1a0c6:	48 8d 46 ff          	lea    -0x1(%rsi),%rax
   1a0ca:	49 21 c2             	and    %rax,%r10
   1a0cd:	bb 01 00 00 00       	mov    $0x1,%ebx
   1a0d2:	44 89 c9             	mov    %r9d,%ecx
   1a0d5:	48 d3 e3             	shl    %cl,%rbx
   1a0d8:	48 8d 43 ff          	lea    -0x1(%rbx),%rax
   1a0dc:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1a0e1:	45 01 cb             	add    %r9d,%r11d
   1a0e4:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   1a0ea:	45 29 df             	sub    %r11d,%r15d
   1a0ed:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   1a0f2:	4c 8d 64 24 30       	lea    0x30(%rsp),%r12
   1a0f7:	44 89 44 24 74       	mov    %r8d,0x74(%rsp)
   1a0fc:	44 89 c5             	mov    %r8d,%ebp
   1a0ff:	4c 89 54 24 68       	mov    %r10,0x68(%rsp)
   1a104:	4d 89 d5             	mov    %r10,%r13
   1a107:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   1a10c:	48 89 54 24 60       	mov    %rdx,0x60(%rsp)
   1a111:	4c 89 8c 24 80 00 00 	mov    %r9,0x80(%rsp)
   1a118:	00 
   1a119:	48 89 5c 24 78       	mov    %rbx,0x78(%rsp)
   1a11e:	44 89 7c 24 0c       	mov    %r15d,0xc(%rsp)
   1a123:	48 89 b4 24 88 00 00 	mov    %rsi,0x88(%rsp)
   1a12a:	00 
   1a12b:	40 f6 c5 01          	test   $0x1,%bpl
   1a12f:	75 2f                	jne    1a160 <<hyperinterval::ieee::Format>::power+0xe0>
   1a131:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   1a138:	0f 1f 84 00 00 00 00 
   1a13f:	00 
   1a140:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   1a145:	d1 ed                	shr    $1,%ebp
   1a147:	0f 85 bc 01 00 00    	jne    1a309 <<hyperinterval::ieee::Format>::power+0x289>
   1a14d:	e9 19 03 00 00       	jmp    1a46b <<hyperinterval::ieee::Format>::power+0x3eb>
   1a152:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   1a159:	1f 84 00 00 00 00 00 
   1a160:	89 6c 24 08          	mov    %ebp,0x8(%rsp)
   1a164:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   1a169:	4c 89 c0             	mov    %r8,%rax
   1a16c:	4c 21 f0             	and    %r14,%rax
   1a16f:	44 89 c9             	mov    %r9d,%ecx
   1a172:	48 d3 e8             	shr    %cl,%rax
   1a175:	4c 89 c1             	mov    %r8,%rcx
   1a178:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1a17d:	48 21 e9             	and    %rbp,%rcx
   1a180:	41 89 c2             	mov    %eax,%r10d
   1a183:	45 29 da             	sub    %r11d,%r10d
   1a186:	48 85 c0             	test   %rax,%rax
   1a189:	45 0f 44 d7          	cmove  %r15d,%r10d
   1a18d:	48 0f 45 c3          	cmovne %rbx,%rax
   1a191:	48 09 c8             	or     %rcx,%rax
   1a194:	4c 89 ea             	mov    %r13,%rdx
   1a197:	4c 21 f2             	and    %r14,%rdx
   1a19a:	44 89 c9             	mov    %r9d,%ecx
   1a19d:	48 d3 ea             	shr    %cl,%rdx
   1a1a0:	4c 89 e9             	mov    %r13,%rcx
   1a1a3:	48 21 e9             	and    %rbp,%rcx
   1a1a6:	89 d5                	mov    %edx,%ebp
   1a1a8:	44 29 dd             	sub    %r11d,%ebp
   1a1ab:	48 85 d2             	test   %rdx,%rdx
   1a1ae:	41 0f 44 ef          	cmove  %r15d,%ebp
   1a1b2:	48 0f 45 d3          	cmovne %rbx,%rdx
   1a1b6:	48 09 ca             	or     %rcx,%rdx
   1a1b9:	49 85 f0             	test   %rsi,%r8
   1a1bc:	0f 95 c1             	setne  %cl
   1a1bf:	4c 89 ac 24 90 00 00 	mov    %r13,0x90(%rsp)
   1a1c6:	00 
   1a1c7:	49 85 f5             	test   %rsi,%r13
   1a1ca:	41 0f 95 c0          	setne  %r8b
   1a1ce:	48 f7 e2             	mul    %rdx
   1a1d1:	41 30 c8             	xor    %cl,%r8b
   1a1d4:	44 01 d5             	add    %r10d,%ebp
   1a1d7:	44 88 44 24 44       	mov    %r8b,0x44(%rsp)
   1a1dc:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1a1e1:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a1e6:	89 6c 24 40          	mov    %ebp,0x40(%rsp)
   1a1ea:	4c 89 f2             	mov    %r14,%rdx
   1a1ed:	4c 89 e1             	mov    %r12,%rcx
   1a1f0:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1a1f5:	4d 89 dd             	mov    %r11,%r13
   1a1f8:	4d 89 cc             	mov    %r9,%r12
   1a1fb:	e8 90 02 00 00       	call   1a490 <<hyperinterval::ieee::Format>::rounded>
   1a200:	80 7c 24 18 00       	cmpb   $0x0,0x18(%rsp)
   1a205:	0f 85 0c 02 00 00    	jne    1a417 <<hyperinterval::ieee::Format>::power+0x397>
   1a20b:	4c 8b 4c 24 58       	mov    0x58(%rsp),%r9
   1a210:	4c 89 c8             	mov    %r9,%rax
   1a213:	4c 21 f0             	and    %r14,%rax
   1a216:	4d 89 f0             	mov    %r14,%r8
   1a219:	44 89 e1             	mov    %r12d,%ecx
   1a21c:	48 d3 e8             	shr    %cl,%rax
   1a21f:	4c 89 ca             	mov    %r9,%rdx
   1a222:	48 21 ea             	and    %rbp,%rdx
   1a225:	89 c6                	mov    %eax,%esi
   1a227:	4d 89 ee             	mov    %r13,%r14
   1a22a:	44 29 f6             	sub    %r14d,%esi
   1a22d:	48 85 c0             	test   %rax,%rax
   1a230:	41 0f 44 f7          	cmove  %r15d,%esi
   1a234:	48 0f 45 c3          	cmovne %rbx,%rax
   1a238:	4c 8b 54 24 68       	mov    0x68(%rsp),%r10
   1a23d:	4c 89 d7             	mov    %r10,%rdi
   1a240:	4c 21 c7             	and    %r8,%rdi
   1a243:	4d 89 c5             	mov    %r8,%r13
   1a246:	48 d3 ef             	shr    %cl,%rdi
   1a249:	48 09 d0             	or     %rdx,%rax
   1a24c:	4c 89 d1             	mov    %r10,%rcx
   1a24f:	48 21 e9             	and    %rbp,%rcx
   1a252:	41 89 f8             	mov    %edi,%r8d
   1a255:	45 29 f0             	sub    %r14d,%r8d
   1a258:	48 85 ff             	test   %rdi,%rdi
   1a25b:	45 0f 44 c7          	cmove  %r15d,%r8d
   1a25f:	48 0f 45 fb          	cmovne %rbx,%rdi
   1a263:	48 09 cf             	or     %rcx,%rdi
   1a266:	4c 8b bc 24 88 00 00 	mov    0x88(%rsp),%r15
   1a26d:	00 
   1a26e:	4d 85 f9             	test   %r15,%r9
   1a271:	0f 95 c1             	setne  %cl
   1a274:	4d 85 fa             	test   %r15,%r10
   1a277:	41 0f 95 c1          	setne  %r9b
   1a27b:	41 30 c9             	xor    %cl,%r9b
   1a27e:	48 f7 e7             	mul    %rdi
   1a281:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
   1a286:	41 01 f0             	add    %esi,%r8d
   1a289:	44 88 4c 24 44       	mov    %r9b,0x44(%rsp)
   1a28e:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1a293:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a298:	44 89 44 24 40       	mov    %r8d,0x40(%rsp)
   1a29d:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   1a2a2:	48 89 fd             	mov    %rdi,%rbp
   1a2a5:	4c 89 fe             	mov    %r15,%rsi
   1a2a8:	4c 89 ea             	mov    %r13,%rdx
   1a2ab:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
   1a2b0:	49 89 cc             	mov    %rcx,%r12
   1a2b3:	e8 d8 01 00 00       	call   1a490 <<hyperinterval::ieee::Format>::rounded>
   1a2b8:	80 7c 24 18 01       	cmpb   $0x1,0x18(%rsp)
   1a2bd:	0f 84 54 01 00 00    	je     1a417 <<hyperinterval::ieee::Format>::power+0x397>
   1a2c3:	4c 89 fe             	mov    %r15,%rsi
   1a2c6:	4d 89 f3             	mov    %r14,%r11
   1a2c9:	4d 89 ee             	mov    %r13,%r14
   1a2cc:	48 89 5c 24 60       	mov    %rbx,0x60(%rsp)
   1a2d1:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   1a2d6:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1a2db:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1a2e2:	00 
   1a2e3:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
   1a2e8:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   1a2ed:	44 8b 7c 24 0c       	mov    0xc(%rsp),%r15d
   1a2f2:	48 89 ef             	mov    %rbp,%rdi
   1a2f5:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   1a2f9:	4c 8b ac 24 90 00 00 	mov    0x90(%rsp),%r13
   1a300:	00 
   1a301:	d1 ed                	shr    $1,%ebp
   1a303:	0f 84 62 01 00 00    	je     1a46b <<hyperinterval::ieee::Format>::power+0x3eb>
   1a309:	89 6c 24 08          	mov    %ebp,0x8(%rsp)
   1a30d:	4c 89 e8             	mov    %r13,%rax
   1a310:	4c 21 f0             	and    %r14,%rax
   1a313:	44 89 c9             	mov    %r9d,%ecx
   1a316:	48 d3 e8             	shr    %cl,%rax
   1a319:	49 21 d5             	and    %rdx,%r13
   1a31c:	89 c1                	mov    %eax,%ecx
   1a31e:	44 29 d9             	sub    %r11d,%ecx
   1a321:	48 85 c0             	test   %rax,%rax
   1a324:	48 0f 45 c3          	cmovne %rbx,%rax
   1a328:	41 0f 44 cf          	cmove  %r15d,%ecx
   1a32c:	4c 09 e8             	or     %r13,%rax
   1a32f:	48 89 d5             	mov    %rdx,%rbp
   1a332:	48 f7 e0             	mul    %rax
   1a335:	01 c9                	add    %ecx,%ecx
   1a337:	c6 44 24 44 00       	movb   $0x0,0x44(%rsp)
   1a33c:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1a341:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a346:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
   1a34a:	4c 89 f2             	mov    %r14,%rdx
   1a34d:	4c 89 e1             	mov    %r12,%rcx
   1a350:	49 89 dd             	mov    %rbx,%r13
   1a353:	4c 89 db             	mov    %r11,%rbx
   1a356:	4d 89 f4             	mov    %r14,%r12
   1a359:	4d 89 ce             	mov    %r9,%r14
   1a35c:	e8 2f 01 00 00       	call   1a490 <<hyperinterval::ieee::Format>::rounded>
   1a361:	80 7c 24 18 00       	cmpb   $0x0,0x18(%rsp)
   1a366:	0f 85 ab 00 00 00    	jne    1a417 <<hyperinterval::ieee::Format>::power+0x397>
   1a36c:	48 8b 54 24 68       	mov    0x68(%rsp),%rdx
   1a371:	48 89 d0             	mov    %rdx,%rax
   1a374:	4c 21 e0             	and    %r12,%rax
   1a377:	44 89 f1             	mov    %r14d,%ecx
   1a37a:	48 d3 e8             	shr    %cl,%rax
   1a37d:	48 21 ea             	and    %rbp,%rdx
   1a380:	89 c1                	mov    %eax,%ecx
   1a382:	29 d9                	sub    %ebx,%ecx
   1a384:	48 85 c0             	test   %rax,%rax
   1a387:	49 0f 45 c5          	cmovne %r13,%rax
   1a38b:	41 0f 44 cf          	cmove  %r15d,%ecx
   1a38f:	48 09 d0             	or     %rdx,%rax
   1a392:	48 f7 e0             	mul    %rax
   1a395:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
   1a39a:	01 c9                	add    %ecx,%ecx
   1a39c:	c6 44 24 44 00       	movb   $0x0,0x44(%rsp)
   1a3a1:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1a3a6:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a3ab:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
   1a3af:	48 8d 6c 24 18       	lea    0x18(%rsp),%rbp
   1a3b4:	48 89 ef             	mov    %rbp,%rdi
   1a3b7:	4c 8b b4 24 88 00 00 	mov    0x88(%rsp),%r14
   1a3be:	00 
   1a3bf:	4c 89 f6             	mov    %r14,%rsi
   1a3c2:	4c 89 e2             	mov    %r12,%rdx
   1a3c5:	4c 8d 7c 24 30       	lea    0x30(%rsp),%r15
   1a3ca:	4c 89 f9             	mov    %r15,%rcx
   1a3cd:	e8 be 00 00 00       	call   1a490 <<hyperinterval::ieee::Format>::rounded>
   1a3d2:	80 7c 24 18 01       	cmpb   $0x1,0x18(%rsp)
   1a3d7:	74 3e                	je     1a417 <<hyperinterval::ieee::Format>::power+0x397>
   1a3d9:	4c 89 f6             	mov    %r14,%rsi
   1a3dc:	49 89 db             	mov    %rbx,%r11
   1a3df:	4d 89 e6             	mov    %r12,%r14
   1a3e2:	48 89 ef             	mov    %rbp,%rdi
   1a3e5:	4d 89 fc             	mov    %r15,%r12
   1a3e8:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   1a3ed:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
   1a3f2:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1a3f9:	00 
   1a3fa:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
   1a3ff:	44 8b 7c 24 0c       	mov    0xc(%rsp),%r15d
   1a404:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   1a408:	40 f6 c5 01          	test   $0x1,%bpl
   1a40c:	0f 85 4e fd ff ff    	jne    1a160 <<hyperinterval::ieee::Format>::power+0xe0>
   1a412:	e9 29 fd ff ff       	jmp    1a140 <<hyperinterval::ieee::Format>::power+0xc0>
   1a417:	0f b6 44 24 19       	movzbl 0x19(%rsp),%eax
   1a41c:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1a421:	88 47 01             	mov    %al,0x1(%rdi)
   1a424:	b0 01                	mov    $0x1,%al
   1a426:	eb 2f                	jmp    1a457 <<hyperinterval::ieee::Format>::power+0x3d7>
   1a428:	48 89 d1             	mov    %rdx,%rcx
   1a42b:	44 20 c0             	and    %r8b,%al
   1a42e:	74 1d                	je     1a44d <<hyperinterval::ieee::Format>::power+0x3cd>
   1a430:	48 89 d0             	mov    %rdx,%rax
   1a433:	48 31 f0             	xor    %rsi,%rax
   1a436:	48 85 d2             	test   %rdx,%rdx
   1a439:	48 0f 44 c2          	cmove  %rdx,%rax
   1a43d:	48 31 ce             	xor    %rcx,%rsi
   1a440:	48 85 c9             	test   %rcx,%rcx
   1a443:	48 0f 44 f1          	cmove  %rcx,%rsi
   1a447:	48 89 c1             	mov    %rax,%rcx
   1a44a:	48 89 f2             	mov    %rsi,%rdx
   1a44d:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1a451:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   1a455:	31 c0                	xor    %eax,%eax
   1a457:	88 07                	mov    %al,(%rdi)
   1a459:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1a460:	5b                   	pop    %rbx
   1a461:	41 5c                	pop    %r12
   1a463:	41 5d                	pop    %r13
   1a465:	41 5e                	pop    %r14
   1a467:	41 5f                	pop    %r15
   1a469:	5d                   	pop    %rbp
   1a46a:	c3                   	ret
   1a46b:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1a470:	44 8b 44 24 74       	mov    0x74(%rsp),%r8d
   1a475:	0f b6 44 24 07       	movzbl 0x7(%rsp),%eax
   1a47a:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
   1a47f:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   1a484:	44 20 c0             	and    %r8b,%al
   1a487:	75 a7                	jne    1a430 <<hyperinterval::ieee::Format>::power+0x3b0>
   1a489:	eb c2                	jmp    1a44d <<hyperinterval::ieee::Format>::power+0x3cd>
   1a48b:	cc                   	int3
   1a48c:	cc                   	int3
   1a48d:	cc                   	int3
   1a48e:	cc                   	int3
   1a48f:	cc                   	int3

<hyperinterval::ieee::Format>::rounded:
   1a490:	48 89 c8             	mov    %rcx,%rax
   1a493:	4c 8b 11             	mov    (%rcx),%r10
   1a496:	4c 8b 59 08          	mov    0x8(%rcx),%r11
   1a49a:	4c 89 d1             	mov    %r10,%rcx
   1a49d:	4c 09 d9             	or     %r11,%rcx
   1a4a0:	0f 84 dd 00 00 00    	je     1a583 <<hyperinterval::ieee::Format>::rounded+0xf3>
   1a4a6:	55                   	push   %rbp
   1a4a7:	41 57                	push   %r15
   1a4a9:	41 56                	push   %r14
   1a4ab:	41 55                	push   %r13
   1a4ad:	41 54                	push   %r12
   1a4af:	53                   	push   %rbx
   1a4b0:	8b 68 10             	mov    0x10(%rax),%ebp
   1a4b3:	49 0f bd cb          	bsr    %r11,%rcx
   1a4b7:	83 f1 3f             	xor    $0x3f,%ecx
   1a4ba:	49 0f bd da          	bsr    %r10,%rbx
   1a4be:	83 f3 3f             	xor    $0x3f,%ebx
   1a4c1:	83 cb 40             	or     $0x40,%ebx
   1a4c4:	4d 85 db             	test   %r11,%r11
   1a4c7:	0f 45 d9             	cmovne %ecx,%ebx
   1a4ca:	f3 4c 0f bc c2       	tzcnt  %rdx,%r8
   1a4cf:	44 89 c1             	mov    %r8d,%ecx
   1a4d2:	48 d3 ea             	shr    %cl,%rdx
   1a4d5:	83 f3 7f             	xor    $0x7f,%ebx
   1a4d8:	01 eb                	add    %ebp,%ebx
   1a4da:	48 d1 ea             	shr    $1,%rdx
   1a4dd:	39 d3                	cmp    %edx,%ebx
   1a4df:	0f 8f 88 01 00 00    	jg     1a66d <<hyperinterval::ieee::Format>::rounded+0x1dd>
   1a4e5:	45 8d 0c 10          	lea    (%r8,%rdx,1),%r9d
   1a4e9:	b9 01 00 00 00       	mov    $0x1,%ecx
   1a4ee:	44 29 c9             	sub    %r9d,%ecx
   1a4f1:	44 29 c3             	sub    %r8d,%ebx
   1a4f4:	39 cb                	cmp    %ecx,%ebx
   1a4f6:	0f 4e d9             	cmovle %ecx,%ebx
   1a4f9:	89 d9                	mov    %ebx,%ecx
   1a4fb:	29 e9                	sub    %ebp,%ecx
   1a4fd:	83 f9 7f             	cmp    $0x7f,%ecx
   1a500:	0f 8e 88 00 00 00    	jle    1a58e <<hyperinterval::ieee::Format>::rounded+0xfe>
   1a506:	41 b7 01             	mov    $0x1,%r15b
   1a509:	45 31 f6             	xor    %r14d,%r14d
   1a50c:	45 31 db             	xor    %r11d,%r11d
   1a50f:	45 31 d2             	xor    %r10d,%r10d
   1a512:	45 0f b6 ff          	movzbl %r15b,%r15d
   1a516:	4d 01 f7             	add    %r14,%r15
   1a519:	49 83 d3 00          	adc    $0x0,%r11
   1a51d:	4c 89 f9             	mov    %r15,%rcx
   1a520:	4c 09 d9             	or     %r11,%rcx
   1a523:	0f 84 c3 00 00 00    	je     1a5ec <<hyperinterval::ieee::Format>::rounded+0x15c>
   1a529:	49 0f bd cb          	bsr    %r11,%rcx
   1a52d:	83 f1 3f             	xor    $0x3f,%ecx
   1a530:	4d 0f bd f7          	bsr    %r15,%r14
   1a534:	41 83 f6 3f          	xor    $0x3f,%r14d
   1a538:	41 83 ce 40          	or     $0x40,%r14d
   1a53c:	4d 85 db             	test   %r11,%r11
   1a53f:	44 0f 45 f1          	cmovne %ecx,%r14d
   1a543:	41 83 f6 7f          	xor    $0x7f,%r14d
   1a547:	41 8d 2c 1e          	lea    (%r14,%rbx,1),%ebp
   1a54b:	39 d5                	cmp    %edx,%ebp
   1a54d:	0f 8f 1a 01 00 00    	jg     1a66d <<hyperinterval::ieee::Format>::rounded+0x1dd>
   1a553:	b9 01 00 00 00       	mov    $0x1,%ecx
   1a558:	29 d1                	sub    %edx,%ecx
   1a55a:	39 cd                	cmp    %ecx,%ebp
   1a55c:	0f 8d 41 01 00 00    	jge    1a6a3 <<hyperinterval::ieee::Format>::rounded+0x213>
   1a562:	41 01 d9             	add    %ebx,%r9d
   1a565:	41 fe c9             	dec    %r9b
   1a568:	44 89 c9             	mov    %r9d,%ecx
   1a56b:	49 d3 e7             	shl    %cl,%r15
   1a56e:	31 d2                	xor    %edx,%edx
   1a570:	41 f6 c1 40          	test   $0x40,%r9b
   1a574:	49 0f 44 d7          	cmove  %r15,%rdx
   1a578:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1a57c:	74 76                	je     1a5f4 <<hyperinterval::ieee::Format>::rounded+0x164>
   1a57e:	e9 8e 00 00 00       	jmp    1a611 <<hyperinterval::ieee::Format>::rounded+0x181>
   1a583:	c6 07 00             	movb   $0x0,(%rdi)
   1a586:	0f 57 c0             	xorps  %xmm0,%xmm0
   1a589:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1a58d:	c3                   	ret
   1a58e:	85 c9                	test   %ecx,%ecx
   1a590:	0f 8e 88 00 00 00    	jle    1a61e <<hyperinterval::ieee::Format>::rounded+0x18e>
   1a596:	4d 89 d6             	mov    %r10,%r14
   1a599:	4d 0f ad de          	shrd   %cl,%r11,%r14
   1a59d:	4d 89 dc             	mov    %r11,%r12
   1a5a0:	49 d3 ec             	shr    %cl,%r12
   1a5a3:	49 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%r15
   1a5aa:	49 d3 e7             	shl    %cl,%r15
   1a5ad:	49 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%r13
   1a5b4:	31 ed                	xor    %ebp,%ebp
   1a5b6:	f6 c1 40             	test   $0x40,%cl
   1a5b9:	4d 0f 45 f4          	cmovne %r12,%r14
   1a5bd:	4c 0f 45 e5          	cmovne %rbp,%r12
   1a5c1:	4d 0f 45 ef          	cmovne %r15,%r13
   1a5c5:	4c 0f 45 fd          	cmovne %rbp,%r15
   1a5c9:	49 f7 d7             	not    %r15
   1a5cc:	49 f7 d5             	not    %r13
   1a5cf:	4d 21 dd             	and    %r11,%r13
   1a5d2:	4d 21 d7             	and    %r10,%r15
   1a5d5:	4d 09 ef             	or     %r13,%r15
   1a5d8:	41 0f 95 c7          	setne  %r15b
   1a5dc:	4d 89 e3             	mov    %r12,%r11
   1a5df:	4c 89 f1             	mov    %r14,%rcx
   1a5e2:	4c 09 d9             	or     %r11,%rcx
   1a5e5:	75 60                	jne    1a647 <<hyperinterval::ieee::Format>::rounded+0x1b7>
   1a5e7:	e9 1d ff ff ff       	jmp    1a509 <<hyperinterval::ieee::Format>::rounded+0x79>
   1a5ec:	31 d2                	xor    %edx,%edx
   1a5ee:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1a5f2:	75 1d                	jne    1a611 <<hyperinterval::ieee::Format>::rounded+0x181>
   1a5f4:	48 89 d0             	mov    %rdx,%rax
   1a5f7:	48 31 f0             	xor    %rsi,%rax
   1a5fa:	48 85 d2             	test   %rdx,%rdx
   1a5fd:	48 0f 44 c2          	cmove  %rdx,%rax
   1a601:	4c 31 d6             	xor    %r10,%rsi
   1a604:	4d 85 d2             	test   %r10,%r10
   1a607:	49 0f 44 f2          	cmove  %r10,%rsi
   1a60b:	49 89 c2             	mov    %rax,%r10
   1a60e:	48 89 f2             	mov    %rsi,%rdx
   1a611:	4c 89 57 08          	mov    %r10,0x8(%rdi)
   1a615:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   1a619:	c6 07 00             	movb   $0x0,(%rdi)
   1a61c:	eb 54                	jmp    1a672 <<hyperinterval::ieee::Format>::rounded+0x1e2>
   1a61e:	f6 d9                	neg    %cl
   1a620:	4d 0f a5 d3          	shld   %cl,%r10,%r11
   1a624:	49 d3 e2             	shl    %cl,%r10
   1a627:	45 31 ff             	xor    %r15d,%r15d
   1a62a:	f6 c1 40             	test   $0x40,%cl
   1a62d:	4d 0f 45 da          	cmovne %r10,%r11
   1a631:	41 be 00 00 00 00    	mov    $0x0,%r14d
   1a637:	4d 0f 44 f2          	cmove  %r10,%r14
   1a63b:	4c 89 f1             	mov    %r14,%rcx
   1a63e:	4c 09 d9             	or     %r11,%rcx
   1a641:	0f 84 c2 fe ff ff    	je     1a509 <<hyperinterval::ieee::Format>::rounded+0x79>
   1a647:	49 0f bd cb          	bsr    %r11,%rcx
   1a64b:	83 f1 3f             	xor    $0x3f,%ecx
   1a64e:	4d 0f bd e6          	bsr    %r14,%r12
   1a652:	41 83 f4 3f          	xor    $0x3f,%r12d
   1a656:	41 83 cc 40          	or     $0x40,%r12d
   1a65a:	4d 85 db             	test   %r11,%r11
   1a65d:	44 0f 45 e1          	cmovne %ecx,%r12d
   1a661:	41 83 f4 7f          	xor    $0x7f,%r12d
   1a665:	41 8d 2c 1c          	lea    (%r12,%rbx,1),%ebp
   1a669:	39 d5                	cmp    %edx,%ebp
   1a66b:	7e 10                	jle    1a67d <<hyperinterval::ieee::Format>::rounded+0x1ed>
   1a66d:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   1a672:	5b                   	pop    %rbx
   1a673:	41 5c                	pop    %r12
   1a675:	41 5d                	pop    %r13
   1a677:	41 5e                	pop    %r14
   1a679:	41 5f                	pop    %r15
   1a67b:	5d                   	pop    %rbp
   1a67c:	c3                   	ret
   1a67d:	b9 01 00 00 00       	mov    $0x1,%ecx
   1a682:	29 d1                	sub    %edx,%ecx
   1a684:	39 cd                	cmp    %ecx,%ebp
   1a686:	7d 7d                	jge    1a705 <<hyperinterval::ieee::Format>::rounded+0x275>
   1a688:	41 8d 0c 19          	lea    (%r9,%rbx,1),%ecx
   1a68c:	fe c9                	dec    %cl
   1a68e:	4d 89 f4             	mov    %r14,%r12
   1a691:	49 d3 e4             	shl    %cl,%r12
   1a694:	45 31 d2             	xor    %r10d,%r10d
   1a697:	f6 c1 40             	test   $0x40,%cl
   1a69a:	4d 0f 44 d4          	cmove  %r12,%r10
   1a69e:	e9 6f fe ff ff       	jmp    1a512 <<hyperinterval::ieee::Format>::rounded+0x82>
   1a6a3:	44 89 c1             	mov    %r8d,%ecx
   1a6a6:	44 29 f1             	sub    %r14d,%ecx
   1a6a9:	41 89 c9             	mov    %ecx,%r9d
   1a6ac:	41 f7 d9             	neg    %r9d
   1a6af:	4c 89 fb             	mov    %r15,%rbx
   1a6b2:	48 d3 e3             	shl    %cl,%rbx
   1a6b5:	45 31 e4             	xor    %r12d,%r12d
   1a6b8:	f6 c1 40             	test   $0x40,%cl
   1a6bb:	4c 0f 44 e3          	cmove  %rbx,%r12
   1a6bf:	44 89 c9             	mov    %r9d,%ecx
   1a6c2:	4d 0f ad df          	shrd   %cl,%r11,%r15
   1a6c6:	49 d3 eb             	shr    %cl,%r11
   1a6c9:	41 f6 c1 40          	test   $0x40,%r9b
   1a6cd:	4d 0f 44 df          	cmove  %r15,%r11
   1a6d1:	45 39 f0             	cmp    %r14d,%r8d
   1a6d4:	4d 0f 43 dc          	cmovae %r12,%r11
   1a6d8:	01 d5                	add    %edx,%ebp
   1a6da:	4c 63 cd             	movslq %ebp,%r9
   1a6dd:	44 89 c1             	mov    %r8d,%ecx
   1a6e0:	49 d3 e1             	shl    %cl,%r9
   1a6e3:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
   1a6ea:	48 d3 e2             	shl    %cl,%rdx
   1a6ed:	48 f7 d2             	not    %rdx
   1a6f0:	4c 21 da             	and    %r11,%rdx
   1a6f3:	4c 09 ca             	or     %r9,%rdx
   1a6f6:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1a6fa:	0f 85 11 ff ff ff    	jne    1a611 <<hyperinterval::ieee::Format>::rounded+0x181>
   1a700:	e9 ef fe ff ff       	jmp    1a5f4 <<hyperinterval::ieee::Format>::rounded+0x164>
   1a705:	44 89 c1             	mov    %r8d,%ecx
   1a708:	44 29 e1             	sub    %r12d,%ecx
   1a70b:	4d 89 f5             	mov    %r14,%r13
   1a70e:	49 d3 e5             	shl    %cl,%r13
   1a711:	41 89 ca             	mov    %ecx,%r10d
   1a714:	41 f7 da             	neg    %r10d
   1a717:	48 c7 44 24 f0 00 00 	movq   $0x0,-0x10(%rsp)
   1a71e:	00 00 
   1a720:	f6 c1 40             	test   $0x40,%cl
   1a723:	48 8b 4c 24 f0       	mov    -0x10(%rsp),%rcx
   1a728:	49 0f 44 cd          	cmove  %r13,%rcx
   1a72c:	48 89 4c 24 f0       	mov    %rcx,-0x10(%rsp)
   1a731:	4d 89 f5             	mov    %r14,%r13
   1a734:	44 89 d1             	mov    %r10d,%ecx
   1a737:	4d 0f ad dd          	shrd   %cl,%r11,%r13
   1a73b:	4c 89 6c 24 f8       	mov    %r13,-0x8(%rsp)
   1a740:	4d 89 dd             	mov    %r11,%r13
   1a743:	49 d3 ed             	shr    %cl,%r13
   1a746:	41 f6 c2 40          	test   $0x40,%r10b
   1a74a:	4c 0f 44 6c 24 f8    	cmove  -0x8(%rsp),%r13
   1a750:	45 39 e0             	cmp    %r12d,%r8d
   1a753:	4c 0f 43 6c 24 f0    	cmovae -0x10(%rsp),%r13
   1a759:	01 d5                	add    %edx,%ebp
   1a75b:	4c 63 e5             	movslq %ebp,%r12
   1a75e:	44 89 c1             	mov    %r8d,%ecx
   1a761:	49 d3 e4             	shl    %cl,%r12
   1a764:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
   1a76b:	49 d3 e2             	shl    %cl,%r10
   1a76e:	49 f7 d2             	not    %r10
   1a771:	4d 21 ea             	and    %r13,%r10
   1a774:	4d 09 e2             	or     %r12,%r10
   1a777:	e9 96 fd ff ff       	jmp    1a512 <<hyperinterval::ieee::Format>::rounded+0x82>
   1a77c:	cc                   	int3
   1a77d:	cc                   	int3
   1a77e:	cc                   	int3
   1a77f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::reciprocal:
   1a780:	55                   	push   %rbp
   1a781:	41 57                	push   %r15
   1a783:	41 56                	push   %r14
   1a785:	41 55                	push   %r13
   1a787:	41 54                	push   %r12
   1a789:	53                   	push   %rbx
   1a78a:	48 83 ec 28          	sub    $0x28,%rsp
   1a78e:	48 89 fb             	mov    %rdi,%rbx
   1a791:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1a795:	74 65                	je     1a7fc <<hyperinterval::float::F64Enclosure>::reciprocal+0x7c>
   1a797:	49 89 f6             	mov    %rsi,%r14
   1a79a:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
   1a7a1:	00 00 80 
   1a7a4:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1a7ab:	00 f0 7f 
   1a7ae:	49 bd 00 00 00 00 00 	movabs $0x3ff0000000000000,%r13
   1a7b5:	00 f0 3f 
   1a7b8:	48 89 e7             	mov    %rsp,%rdi
   1a7bb:	4c 89 fe             	mov    %r15,%rsi
   1a7be:	4c 89 e2             	mov    %r12,%rdx
   1a7c1:	4c 89 e9             	mov    %r13,%rcx
   1a7c4:	e8 87 d6 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1a7c9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a7cd:	74 1c                	je     1a7eb <<hyperinterval::float::F64Enclosure>::reciprocal+0x6b>
   1a7cf:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1a7d4:	48 89 e7             	mov    %rsp,%rdi
   1a7d7:	4c 89 fe             	mov    %r15,%rsi
   1a7da:	4c 89 e2             	mov    %r12,%rdx
   1a7dd:	4c 89 e9             	mov    %r13,%rcx
   1a7e0:	e8 6b d6 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1a7e5:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a7e9:	75 2a                	jne    1a815 <<hyperinterval::float::F64Enclosure>::reciprocal+0x95>
   1a7eb:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   1a7f0:	88 53 08             	mov    %dl,0x8(%rbx)
   1a7f3:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a7fa:	eb 07                	jmp    1a803 <<hyperinterval::float::F64Enclosure>::reciprocal+0x83>
   1a7fc:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1a803:	48 89 d8             	mov    %rbx,%rax
   1a806:	48 83 c4 28          	add    $0x28,%rsp
   1a80a:	5b                   	pop    %rbx
   1a80b:	41 5c                	pop    %r12
   1a80d:	41 5d                	pop    %r13
   1a80f:	41 5e                	pop    %r14
   1a811:	41 5f                	pop    %r15
   1a813:	5d                   	pop    %rbp
   1a814:	c3                   	ret
   1a815:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a81a:	49 8d 14 2f          	lea    (%r15,%rbp,1),%rdx
   1a81e:	49 8d 47 ff          	lea    -0x1(%r15),%rax
   1a822:	48 89 ee             	mov    %rbp,%rsi
   1a825:	48 21 c6             	and    %rax,%rsi
   1a828:	4c 89 ff             	mov    %r15,%rdi
   1a82b:	48 29 f7             	sub    %rsi,%rdi
   1a82e:	48 85 ed             	test   %rbp,%rbp
   1a831:	48 0f 49 fa          	cmovns %rdx,%rdi
   1a835:	4a 8d 14 39          	lea    (%rcx,%r15,1),%rdx
   1a839:	48 89 ce             	mov    %rcx,%rsi
   1a83c:	48 21 c6             	and    %rax,%rsi
   1a83f:	49 29 f7             	sub    %rsi,%r15
   1a842:	48 85 c9             	test   %rcx,%rcx
   1a845:	4c 0f 49 fa          	cmovns %rdx,%r15
   1a849:	b2 01                	mov    $0x1,%dl
   1a84b:	4c 39 ff             	cmp    %r15,%rdi
   1a84e:	77 a0                	ja     1a7f0 <<hyperinterval::float::F64Enclosure>::reciprocal+0x70>
   1a850:	48 c7 44 24 10 01 00 	movq   $0x1,0x10(%rsp)
   1a857:	00 00 
   1a859:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
   1a85e:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   1a863:	49 83 7e 08 00       	cmpq   $0x0,0x8(%r14)
   1a868:	7f 0e                	jg     1a878 <<hyperinterval::float::F64Enclosure>::reciprocal+0xf8>
   1a86a:	49 8b 4e 10          	mov    0x10(%r14),%rcx
   1a86e:	48 85 c9             	test   %rcx,%rcx
   1a871:	79 1f                	jns    1a892 <<hyperinterval::float::F64Enclosure>::reciprocal+0x112>
   1a873:	48 21 c1             	and    %rax,%rcx
   1a876:	74 1a                	je     1a892 <<hyperinterval::float::F64Enclosure>::reciprocal+0x112>
   1a878:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
   1a87d:	48 89 df             	mov    %rbx,%rdi
   1a880:	4c 89 f2             	mov    %r14,%rdx
   1a883:	b9 01 00 00 00       	mov    $0x1,%ecx
   1a888:	e8 b3 02 00 00       	call   1ab40 <<hyperinterval::float::F64Enclosure>::corner_image>
   1a88d:	e9 71 ff ff ff       	jmp    1a803 <<hyperinterval::float::F64Enclosure>::reciprocal+0x83>
   1a892:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
   1a896:	e9 58 ff ff ff       	jmp    1a7f3 <<hyperinterval::float::F64Enclosure>::reciprocal+0x73>
   1a89b:	cc                   	int3
   1a89c:	cc                   	int3
   1a89d:	cc                   	int3
   1a89e:	cc                   	int3
   1a89f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::checked_pow:
   1a8a0:	55                   	push   %rbp
   1a8a1:	41 57                	push   %r15
   1a8a3:	41 56                	push   %r14
   1a8a5:	41 55                	push   %r13
   1a8a7:	41 54                	push   %r12
   1a8a9:	53                   	push   %rbx
   1a8aa:	48 83 ec 78          	sub    $0x78,%rsp
   1a8ae:	48 89 fb             	mov    %rdi,%rbx
   1a8b1:	83 fa 02             	cmp    $0x2,%edx
   1a8b4:	75 0e                	jne    1a8c4 <<hyperinterval::float::F64Enclosure>::checked_pow+0x24>
   1a8b6:	48 89 df             	mov    %rbx,%rdi
   1a8b9:	ff 15 89 0f 04 00    	call   *0x40f89(%rip)        # 5b848 <_DYNAMIC+0x2f0>
   1a8bf:	e9 80 00 00 00       	jmp    1a944 <<hyperinterval::float::F64Enclosure>::checked_pow+0xa4>
   1a8c4:	f6 06 01             	testb  $0x1,(%rsi)
   1a8c7:	74 74                	je     1a93d <<hyperinterval::float::F64Enclosure>::checked_pow+0x9d>
   1a8c9:	89 d5                	mov    %edx,%ebp
   1a8cb:	4c 8b 76 10          	mov    0x10(%rsi),%r14
   1a8cf:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
   1a8d6:	00 00 80 
   1a8d9:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1a8e0:	00 f0 7f 
   1a8e3:	48 89 74 24 70       	mov    %rsi,0x70(%rsp)
   1a8e8:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1a8ec:	48 89 e7             	mov    %rsp,%rdi
   1a8ef:	4c 89 fe             	mov    %r15,%rsi
   1a8f2:	4c 89 e2             	mov    %r12,%rdx
   1a8f5:	41 89 e8             	mov    %ebp,%r8d
   1a8f8:	e8 83 f7 ff ff       	call   1a080 <<hyperinterval::ieee::Format>::power>
   1a8fd:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a901:	75 29                	jne    1a92c <<hyperinterval::float::F64Enclosure>::checked_pow+0x8c>
   1a903:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1a908:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1a90d:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1a912:	48 89 e7             	mov    %rsp,%rdi
   1a915:	4c 89 fe             	mov    %r15,%rsi
   1a918:	4c 89 e2             	mov    %r12,%rdx
   1a91b:	4c 89 f1             	mov    %r14,%rcx
   1a91e:	41 89 e8             	mov    %ebp,%r8d
   1a921:	e8 5a f7 ff ff       	call   1a080 <<hyperinterval::ieee::Format>::power>
   1a926:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a92a:	75 2a                	jne    1a956 <<hyperinterval::float::F64Enclosure>::checked_pow+0xb6>
   1a92c:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a931:	88 43 08             	mov    %al,0x8(%rbx)
   1a934:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a93b:	eb 07                	jmp    1a944 <<hyperinterval::float::F64Enclosure>::checked_pow+0xa4>
   1a93d:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1a944:	48 89 d8             	mov    %rbx,%rax
   1a947:	48 83 c4 78          	add    $0x78,%rsp
   1a94b:	5b                   	pop    %rbx
   1a94c:	41 5c                	pop    %r12
   1a94e:	41 5d                	pop    %r13
   1a950:	41 5e                	pop    %r14
   1a952:	41 5f                	pop    %r15
   1a954:	5d                   	pop    %rbp
   1a955:	c3                   	ret
   1a956:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a95b:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
   1a960:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   1a965:	48 89 e7             	mov    %rsp,%rdi
   1a968:	4c 89 fe             	mov    %r15,%rsi
   1a96b:	4c 89 e2             	mov    %r12,%rdx
   1a96e:	4c 89 e9             	mov    %r13,%rcx
   1a971:	e8 da d4 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1a976:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a97a:	74 1e                	je     1a99a <<hyperinterval::float::F64Enclosure>::checked_pow+0xfa>
   1a97c:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1a981:	48 89 e7             	mov    %rsp,%rdi
   1a984:	4c 89 fe             	mov    %r15,%rsi
   1a987:	4c 89 e2             	mov    %r12,%rdx
   1a98a:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1a98f:	e8 bc d4 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1a994:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a998:	75 11                	jne    1a9ab <<hyperinterval::float::F64Enclosure>::checked_pow+0x10b>
   1a99a:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   1a99f:	88 4b 08             	mov    %cl,0x8(%rbx)
   1a9a2:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a9a9:	eb 99                	jmp    1a944 <<hyperinterval::float::F64Enclosure>::checked_pow+0xa4>
   1a9ab:	4c 89 74 24 18       	mov    %r14,0x18(%rsp)
   1a9b0:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a9b5:	4b 8d 0c 2f          	lea    (%r15,%r13,1),%rcx
   1a9b9:	4d 8d 77 ff          	lea    -0x1(%r15),%r14
   1a9bd:	4c 89 ea             	mov    %r13,%rdx
   1a9c0:	4c 21 f2             	and    %r14,%rdx
   1a9c3:	4c 89 fe             	mov    %r15,%rsi
   1a9c6:	48 29 d6             	sub    %rdx,%rsi
   1a9c9:	4d 85 ed             	test   %r13,%r13
   1a9cc:	48 0f 49 f1          	cmovns %rcx,%rsi
   1a9d0:	4a 8d 0c 38          	lea    (%rax,%r15,1),%rcx
   1a9d4:	48 89 c2             	mov    %rax,%rdx
   1a9d7:	4c 21 f2             	and    %r14,%rdx
   1a9da:	4c 89 ff             	mov    %r15,%rdi
   1a9dd:	48 29 d7             	sub    %rdx,%rdi
   1a9e0:	48 85 c0             	test   %rax,%rax
   1a9e3:	48 0f 49 f9          	cmovns %rcx,%rdi
   1a9e7:	b1 01                	mov    $0x1,%cl
   1a9e9:	48 39 fe             	cmp    %rdi,%rsi
   1a9ec:	77 b1                	ja     1a99f <<hyperinterval::float::F64Enclosure>::checked_pow+0xff>
   1a9ee:	48 c7 44 24 38 01 00 	movq   $0x1,0x38(%rsp)
   1a9f5:	00 00 
   1a9f7:	4c 89 6c 24 40       	mov    %r13,0x40(%rsp)
   1a9fc:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1aa01:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   1aa06:	4c 89 fe             	mov    %r15,%rsi
   1aa09:	4c 89 e2             	mov    %r12,%rdx
   1aa0c:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
   1aa11:	e8 3a d4 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1aa16:	80 7c 24 20 01       	cmpb   $0x1,0x20(%rsp)
   1aa1b:	74 21                	je     1aa3e <<hyperinterval::float::F64Enclosure>::checked_pow+0x19e>
   1aa1d:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
   1aa22:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   1aa27:	4c 89 fe             	mov    %r15,%rsi
   1aa2a:	4c 89 e2             	mov    %r12,%rdx
   1aa2d:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1aa32:	e8 19 d4 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1aa37:	80 7c 24 20 01       	cmpb   $0x1,0x20(%rsp)
   1aa3c:	75 0a                	jne    1aa48 <<hyperinterval::float::F64Enclosure>::checked_pow+0x1a8>
   1aa3e:	0f b6 4c 24 21       	movzbl 0x21(%rsp),%ecx
   1aa43:	e9 57 ff ff ff       	jmp    1a99f <<hyperinterval::float::F64Enclosure>::checked_pow+0xff>
   1aa48:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   1aa4d:	4b 8d 0c 2f          	lea    (%r15,%r13,1),%rcx
   1aa51:	4c 89 ea             	mov    %r13,%rdx
   1aa54:	4c 21 f2             	and    %r14,%rdx
   1aa57:	4c 89 fe             	mov    %r15,%rsi
   1aa5a:	48 29 d6             	sub    %rdx,%rsi
   1aa5d:	4d 85 ed             	test   %r13,%r13
   1aa60:	48 0f 49 f1          	cmovns %rcx,%rsi
   1aa64:	4a 8d 0c 38          	lea    (%rax,%r15,1),%rcx
   1aa68:	49 21 c6             	and    %rax,%r14
   1aa6b:	4d 29 f7             	sub    %r14,%r15
   1aa6e:	48 85 c0             	test   %rax,%rax
   1aa71:	4c 0f 49 f9          	cmovns %rcx,%r15
   1aa75:	b1 01                	mov    $0x1,%cl
   1aa77:	4c 39 fe             	cmp    %r15,%rsi
   1aa7a:	0f 87 1f ff ff ff    	ja     1a99f <<hyperinterval::float::F64Enclosure>::checked_pow+0xff>
   1aa80:	48 c7 04 24 01 00 00 	movq   $0x1,(%rsp)
   1aa87:	00 
   1aa88:	4c 89 6c 24 08       	mov    %r13,0x8(%rsp)
   1aa8d:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1aa92:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
   1aa97:	48 8d 74 24 38       	lea    0x38(%rsp),%rsi
   1aa9c:	48 89 e2             	mov    %rsp,%rdx
   1aa9f:	ff 15 53 0e 04 00    	call   *0x40e53(%rip)        # 5b8f8 <_DYNAMIC+0x3a0>
   1aaa5:	85 ed                	test   %ebp,%ebp
   1aaa7:	0f 95 c0             	setne  %al
   1aaaa:	40 f6 c5 01          	test   $0x1,%bpl
   1aaae:	0f 94 c1             	sete   %cl
   1aab1:	84 c8                	test   %cl,%al
   1aab3:	74 70                	je     1ab25 <<hyperinterval::float::F64Enclosure>::checked_pow+0x285>
   1aab5:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
   1aaba:	ff 15 40 0e 04 00    	call   *0x40e40(%rip)        # 5b900 <_DYNAMIC+0x3a8>
   1aac0:	a8 02                	test   $0x2,%al
   1aac2:	74 61                	je     1ab25 <<hyperinterval::float::F64Enclosure>::checked_pow+0x285>
   1aac4:	48 89 e7             	mov    %rsp,%rdi
   1aac7:	e8 d4 17 00 00       	call   1c2a0 <<hyperinterval::float::F64Enclosure>::from_bits>
   1aacc:	48 8b 0c 24          	mov    (%rsp),%rcx
   1aad0:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1aad5:	48 83 f9 02          	cmp    $0x2,%rcx
   1aad9:	0f 84 52 fe ff ff    	je     1a931 <<hyperinterval::float::F64Enclosure>::checked_pow+0x91>
   1aadf:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   1aae4:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1aae9:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
   1aaee:	48 89 54 24 41       	mov    %rdx,0x41(%rsp)
   1aaf3:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
   1aaf8:	88 44 24 40          	mov    %al,0x40(%rsp)
   1aafc:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   1ab01:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   1ab06:	48 8d 54 24 38       	lea    0x38(%rsp),%rdx
   1ab0b:	ff 15 e7 0d 04 00    	call   *0x40de7(%rip)        # 5b8f8 <_DYNAMIC+0x3a0>
   1ab11:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   1ab16:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1ab1b:	0f 10 44 24 20       	movups 0x20(%rsp),%xmm0
   1ab20:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
   1ab25:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
   1ab2a:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1ab2e:	0f 28 44 24 50       	movaps 0x50(%rsp),%xmm0
   1ab33:	0f 11 03             	movups %xmm0,(%rbx)
   1ab36:	e9 09 fe ff ff       	jmp    1a944 <<hyperinterval::float::F64Enclosure>::checked_pow+0xa4>
   1ab3b:	cc                   	int3
   1ab3c:	cc                   	int3
   1ab3d:	cc                   	int3
   1ab3e:	cc                   	int3
   1ab3f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::corner_image:
   1ab40:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1ab44:	75 7e                	jne    1abc4 <<hyperinterval::float::F64Enclosure>::corner_image+0x84>
   1ab46:	f6 02 01             	testb  $0x1,(%rdx)
   1ab49:	74 79                	je     1abc4 <<hyperinterval::float::F64Enclosure>::corner_image+0x84>
   1ab4b:	55                   	push   %rbp
   1ab4c:	41 57                	push   %r15
   1ab4e:	41 56                	push   %r14
   1ab50:	41 55                	push   %r13
   1ab52:	41 54                	push   %r12
   1ab54:	53                   	push   %rbx
   1ab55:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
   1ab5c:	41 89 cc             	mov    %ecx,%r12d
   1ab5f:	48 89 7c 24 78       	mov    %rdi,0x78(%rsp)
   1ab64:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
   1ab6b:	00 00 80 
   1ab6e:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1ab75:	00 f0 7f 
   1ab78:	4c 8b 6e 08          	mov    0x8(%rsi),%r13
   1ab7c:	48 8b 46 10          	mov    0x10(%rsi),%rax
   1ab80:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1ab85:	48 8b 6a 08          	mov    0x8(%rdx),%rbp
   1ab89:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1ab8d:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1ab92:	45 84 e4             	test   %r12b,%r12b
   1ab95:	74 35                	je     1abcc <<hyperinterval::float::F64Enclosure>::corner_image+0x8c>
   1ab97:	48 89 e7             	mov    %rsp,%rdi
   1ab9a:	4c 89 fe             	mov    %r15,%rsi
   1ab9d:	4c 89 f2             	mov    %r14,%rdx
   1aba0:	4c 89 e9             	mov    %r13,%rcx
   1aba3:	49 89 e8             	mov    %rbp,%r8
   1aba6:	e8 95 f0 ff ff       	call   19c40 <<hyperinterval::ieee::Format>::div>
   1abab:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1abaf:	0f 85 fa 00 00 00    	jne    1acaf <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1abb5:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1abba:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
   1abbf:	e9 b6 00 00 00       	jmp    1ac7a <<hyperinterval::float::F64Enclosure>::corner_image+0x13a>
   1abc4:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
   1abcb:	c3                   	ret
   1abcc:	4c 89 e8             	mov    %r13,%rax
   1abcf:	48 c1 e8 34          	shr    $0x34,%rax
   1abd3:	25 ff 07 00 00       	and    $0x7ff,%eax
   1abd8:	48 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%rdx
   1abdf:	ff 0f 00 
   1abe2:	4c 89 ee             	mov    %r13,%rsi
   1abe5:	48 21 d6             	and    %rdx,%rsi
   1abe8:	8d 88 cd fb ff ff    	lea    -0x433(%rax),%ecx
   1abee:	48 85 c0             	test   %rax,%rax
   1abf1:	b8 ce fb ff ff       	mov    $0xfffffbce,%eax
   1abf6:	0f 44 c8             	cmove  %eax,%ecx
   1abf9:	48 8d 7c 16 01       	lea    0x1(%rsi,%rdx,1),%rdi
   1abfe:	48 0f 44 fe          	cmove  %rsi,%rdi
   1ac02:	48 89 ee             	mov    %rbp,%rsi
   1ac05:	48 c1 ee 34          	shr    $0x34,%rsi
   1ac09:	81 e6 ff 07 00 00    	and    $0x7ff,%esi
   1ac0f:	49 89 e8             	mov    %rbp,%r8
   1ac12:	49 21 d0             	and    %rdx,%r8
   1ac15:	44 8d 8e cd fb ff ff 	lea    -0x433(%rsi),%r9d
   1ac1c:	48 85 f6             	test   %rsi,%rsi
   1ac1f:	44 0f 44 c8          	cmove  %eax,%r9d
   1ac23:	49 8d 44 10 01       	lea    0x1(%r8,%rdx,1),%rax
   1ac28:	49 0f 44 c0          	cmove  %r8,%rax
   1ac2c:	48 89 ee             	mov    %rbp,%rsi
   1ac2f:	4c 31 ee             	xor    %r13,%rsi
   1ac32:	48 f7 e7             	mul    %rdi
   1ac35:	41 01 c9             	add    %ecx,%r9d
   1ac38:	48 c1 ee 3f          	shr    $0x3f,%rsi
   1ac3c:	40 88 74 24 14       	mov    %sil,0x14(%rsp)
   1ac41:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1ac46:	48 89 04 24          	mov    %rax,(%rsp)
   1ac4a:	44 89 4c 24 10       	mov    %r9d,0x10(%rsp)
   1ac4f:	48 8d 7c 24 48       	lea    0x48(%rsp),%rdi
   1ac54:	48 89 e1             	mov    %rsp,%rcx
   1ac57:	4c 89 fe             	mov    %r15,%rsi
   1ac5a:	4c 89 f2             	mov    %r14,%rdx
   1ac5d:	e8 2e f8 ff ff       	call   1a490 <<hyperinterval::ieee::Format>::rounded>
   1ac62:	80 7c 24 48 00       	cmpb   $0x0,0x48(%rsp)
   1ac67:	74 07                	je     1ac70 <<hyperinterval::float::F64Enclosure>::corner_image+0x130>
   1ac69:	0f b6 7c 24 49       	movzbl 0x49(%rsp),%edi
   1ac6e:	eb 44                	jmp    1acb4 <<hyperinterval::float::F64Enclosure>::corner_image+0x174>
   1ac70:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
   1ac75:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
   1ac7a:	48 89 e7             	mov    %rsp,%rdi
   1ac7d:	4c 89 fe             	mov    %r15,%rsi
   1ac80:	4c 89 f2             	mov    %r14,%rdx
   1ac83:	e8 c8 d1 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1ac88:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ac8c:	75 21                	jne    1acaf <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1ac8e:	48 89 6c 24 70       	mov    %rbp,0x70(%rsp)
   1ac93:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1ac98:	48 89 e7             	mov    %rsp,%rdi
   1ac9b:	4c 89 fe             	mov    %r15,%rsi
   1ac9e:	4c 89 f2             	mov    %r14,%rdx
   1aca1:	48 89 d9             	mov    %rbx,%rcx
   1aca4:	e8 a7 d1 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1aca9:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1acad:	74 27                	je     1acd6 <<hyperinterval::float::F64Enclosure>::corner_image+0x196>
   1acaf:	0f b6 7c 24 01       	movzbl 0x1(%rsp),%edi
   1acb4:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
   1acb9:	40 88 78 08          	mov    %dil,0x8(%rax)
   1acbd:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1acc4:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
   1accb:	5b                   	pop    %rbx
   1accc:	41 5c                	pop    %r12
   1acce:	41 5d                	pop    %r13
   1acd0:	41 5e                	pop    %r14
   1acd2:	41 5f                	pop    %r15
   1acd4:	5d                   	pop    %rbp
   1acd5:	c3                   	ret
   1acd6:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
   1acdb:	49 8d 04 2f          	lea    (%r15,%rbp,1),%rax
   1acdf:	49 8d 57 ff          	lea    -0x1(%r15),%rdx
   1ace3:	48 89 e9             	mov    %rbp,%rcx
   1ace6:	48 21 d1             	and    %rdx,%rcx
   1ace9:	4d 89 f9             	mov    %r15,%r9
   1acec:	49 29 c9             	sub    %rcx,%r9
   1acef:	48 85 ed             	test   %rbp,%rbp
   1acf2:	4c 0f 49 c8          	cmovns %rax,%r9
   1acf6:	4b 8d 04 38          	lea    (%r8,%r15,1),%rax
   1acfa:	4c 89 c1             	mov    %r8,%rcx
   1acfd:	48 21 d1             	and    %rdx,%rcx
   1ad00:	4c 89 fb             	mov    %r15,%rbx
   1ad03:	48 29 cb             	sub    %rcx,%rbx
   1ad06:	4d 85 c0             	test   %r8,%r8
   1ad09:	48 0f 49 d8          	cmovns %rax,%rbx
   1ad0d:	40 b7 01             	mov    $0x1,%dil
   1ad10:	49 39 d9             	cmp    %rbx,%r9
   1ad13:	77 9f                	ja     1acb4 <<hyperinterval::float::F64Enclosure>::corner_image+0x174>
   1ad15:	4d 89 fe             	mov    %r15,%r14
   1ad18:	4d 89 cf             	mov    %r9,%r15
   1ad1b:	48 89 6c 24 38       	mov    %rbp,0x38(%rsp)
   1ad20:	4c 89 44 24 40       	mov    %r8,0x40(%rsp)
   1ad25:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
   1ad2a:	45 84 e4             	test   %r12b,%r12b
   1ad2d:	0f 84 ca 02 00 00    	je     1affd <<hyperinterval::float::F64Enclosure>::corner_image+0x4bd>
   1ad33:	48 89 e7             	mov    %rsp,%rdi
   1ad36:	4c 89 f6             	mov    %r14,%rsi
   1ad39:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1ad40:	00 f0 7f 
   1ad43:	4c 89 e2             	mov    %r12,%rdx
   1ad46:	4c 89 e9             	mov    %r13,%rcx
   1ad49:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
   1ad4e:	e8 ed ee ff ff       	call   19c40 <<hyperinterval::ieee::Format>::div>
   1ad53:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ad57:	0f 85 52 ff ff ff    	jne    1acaf <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1ad5d:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1ad62:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   1ad67:	48 89 e7             	mov    %rsp,%rdi
   1ad6a:	4c 89 f6             	mov    %r14,%rsi
   1ad6d:	4c 89 e2             	mov    %r12,%rdx
   1ad70:	e8 db d0 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1ad75:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ad79:	0f 85 30 ff ff ff    	jne    1acaf <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1ad7f:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1ad84:	48 89 e7             	mov    %rsp,%rdi
   1ad87:	4c 89 f6             	mov    %r14,%rsi
   1ad8a:	4c 89 e2             	mov    %r12,%rdx
   1ad8d:	4c 89 e9             	mov    %r13,%rcx
   1ad90:	e8 bb d0 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1ad95:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ad99:	0f 85 10 ff ff ff    	jne    1acaf <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1ad9f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1ada4:	49 8d 14 2e          	lea    (%r14,%rbp,1),%rdx
   1ada8:	48 89 ee             	mov    %rbp,%rsi
   1adab:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1adb0:	4c 21 c6             	and    %r8,%rsi
   1adb3:	4c 89 f1             	mov    %r14,%rcx
   1adb6:	48 29 f1             	sub    %rsi,%rcx
   1adb9:	48 85 ed             	test   %rbp,%rbp
   1adbc:	48 0f 49 ca          	cmovns %rdx,%rcx
   1adc0:	4a 8d 34 30          	lea    (%rax,%r14,1),%rsi
   1adc4:	48 89 c7             	mov    %rax,%rdi
   1adc7:	4c 21 c7             	and    %r8,%rdi
   1adca:	4c 89 f2             	mov    %r14,%rdx
   1adcd:	48 29 fa             	sub    %rdi,%rdx
   1add0:	48 85 c0             	test   %rax,%rax
   1add3:	48 0f 49 d6          	cmovns %rsi,%rdx
   1add7:	48 39 d1             	cmp    %rdx,%rcx
   1adda:	0f 87 54 03 00 00    	ja     1b134 <<hyperinterval::float::F64Enclosure>::corner_image+0x5f4>
   1ade0:	49 39 cf             	cmp    %rcx,%r15
   1ade3:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   1ade8:	48 0f 47 cd          	cmova  %rbp,%rcx
   1adec:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
   1adf1:	48 39 d3             	cmp    %rdx,%rbx
   1adf4:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1adf9:	48 0f 42 c8          	cmovb  %rax,%rcx
   1adfd:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
   1ae02:	48 89 e7             	mov    %rsp,%rdi
   1ae05:	4c 89 f6             	mov    %r14,%rsi
   1ae08:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   1ae0f:	00 f0 7f 
   1ae12:	4c 89 ea             	mov    %r13,%rdx
   1ae15:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   1ae1a:	4c 8b 44 24 70       	mov    0x70(%rsp),%r8
   1ae1f:	e8 1c ee ff ff       	call   19c40 <<hyperinterval::ieee::Format>::div>
   1ae24:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ae28:	0f 85 81 fe ff ff    	jne    1acaf <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1ae2e:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1ae33:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1ae38:	48 89 e7             	mov    %rsp,%rdi
   1ae3b:	4c 89 f6             	mov    %r14,%rsi
   1ae3e:	4c 89 ea             	mov    %r13,%rdx
   1ae41:	e8 0a d0 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1ae46:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ae4a:	0f 85 5f fe ff ff    	jne    1acaf <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1ae50:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
   1ae55:	48 89 e7             	mov    %rsp,%rdi
   1ae58:	4c 89 f6             	mov    %r14,%rsi
   1ae5b:	4c 89 ea             	mov    %r13,%rdx
   1ae5e:	4c 89 e1             	mov    %r12,%rcx
   1ae61:	e8 ea cf ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1ae66:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ae6a:	0f 85 3f fe ff ff    	jne    1acaf <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1ae70:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1ae75:	4a 8d 04 33          	lea    (%rbx,%r14,1),%rax
   1ae79:	48 89 da             	mov    %rbx,%rdx
   1ae7c:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1ae81:	4c 21 c2             	and    %r8,%rdx
   1ae84:	4c 89 f1             	mov    %r14,%rcx
   1ae87:	48 29 d1             	sub    %rdx,%rcx
   1ae8a:	48 85 db             	test   %rbx,%rbx
   1ae8d:	48 0f 49 c8          	cmovns %rax,%rcx
   1ae91:	4b 8d 14 2e          	lea    (%r14,%r13,1),%rdx
   1ae95:	4c 89 ee             	mov    %r13,%rsi
   1ae98:	4c 21 c6             	and    %r8,%rsi
   1ae9b:	4c 89 f0             	mov    %r14,%rax
   1ae9e:	48 29 f0             	sub    %rsi,%rax
   1aea1:	4d 85 ed             	test   %r13,%r13
   1aea4:	48 0f 49 c2          	cmovns %rdx,%rax
   1aea8:	48 39 c1             	cmp    %rax,%rcx
   1aeab:	0f 87 83 02 00 00    	ja     1b134 <<hyperinterval::float::F64Enclosure>::corner_image+0x5f4>
   1aeb1:	4c 8b 4c 24 38       	mov    0x38(%rsp),%r9
   1aeb6:	4b 8d 14 31          	lea    (%r9,%r14,1),%rdx
   1aeba:	4c 89 ce             	mov    %r9,%rsi
   1aebd:	4c 21 c6             	and    %r8,%rsi
   1aec0:	4c 89 f7             	mov    %r14,%rdi
   1aec3:	48 29 f7             	sub    %rsi,%rdi
   1aec6:	4d 85 c9             	test   %r9,%r9
   1aec9:	48 0f 49 fa          	cmovns %rdx,%rdi
   1aecd:	48 39 cf             	cmp    %rcx,%rdi
   1aed0:	49 0f 46 d9          	cmovbe %r9,%rbx
   1aed4:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
   1aed9:	4a 8d 0c 37          	lea    (%rdi,%r14,1),%rcx
   1aedd:	48 89 fa             	mov    %rdi,%rdx
   1aee0:	4c 21 c2             	and    %r8,%rdx
   1aee3:	4c 89 f6             	mov    %r14,%rsi
   1aee6:	48 29 d6             	sub    %rdx,%rsi
   1aee9:	48 85 ff             	test   %rdi,%rdi
   1aeec:	48 0f 49 f1          	cmovns %rcx,%rsi
   1aef0:	48 39 c6             	cmp    %rax,%rsi
   1aef3:	4c 0f 43 ef          	cmovae %rdi,%r13
   1aef7:	48 89 e7             	mov    %rsp,%rdi
   1aefa:	4c 89 f6             	mov    %r14,%rsi
   1aefd:	48 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%rbp
   1af04:	00 f0 7f 
   1af07:	48 89 ea             	mov    %rbp,%rdx
   1af0a:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   1af0f:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
   1af14:	e8 27 ed ff ff       	call   19c40 <<hyperinterval::ieee::Format>::div>
   1af19:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1af1d:	0f 85 8c fd ff ff    	jne    1acaf <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1af23:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1af28:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1af2d:	48 89 e7             	mov    %rsp,%rdi
   1af30:	4c 89 f6             	mov    %r14,%rsi
   1af33:	48 89 ea             	mov    %rbp,%rdx
   1af36:	e8 15 cf ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1af3b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1af3f:	0f 85 6a fd ff ff    	jne    1acaf <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1af45:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1af4a:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1af4f:	48 89 e7             	mov    %rsp,%rdi
   1af52:	4c 89 f6             	mov    %r14,%rsi
   1af55:	48 89 ea             	mov    %rbp,%rdx
   1af58:	4c 89 e1             	mov    %r12,%rcx
   1af5b:	e8 f0 ce ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1af60:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1af64:	0f 85 45 fd ff ff    	jne    1acaf <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1af6a:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1af6f:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1af74:	4a 8d 0c 37          	lea    (%rdi,%r14,1),%rcx
   1af78:	48 89 fe             	mov    %rdi,%rsi
   1af7b:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1af80:	4c 21 c6             	and    %r8,%rsi
   1af83:	4c 89 f2             	mov    %r14,%rdx
   1af86:	48 29 f2             	sub    %rsi,%rdx
   1af89:	48 85 ff             	test   %rdi,%rdi
   1af8c:	48 0f 49 d1          	cmovns %rcx,%rdx
   1af90:	4a 8d 34 30          	lea    (%rax,%r14,1),%rsi
   1af94:	48 89 c7             	mov    %rax,%rdi
   1af97:	4c 21 c7             	and    %r8,%rdi
   1af9a:	4d 89 f1             	mov    %r14,%r9
   1af9d:	49 29 fe             	sub    %rdi,%r14
   1afa0:	48 85 c0             	test   %rax,%rax
   1afa3:	4c 0f 49 f6          	cmovns %rsi,%r14
   1afa7:	4c 39 f2             	cmp    %r14,%rdx
   1afaa:	40 b7 01             	mov    $0x1,%dil
   1afad:	0f 87 01 fd ff ff    	ja     1acb4 <<hyperinterval::float::F64Enclosure>::corner_image+0x174>
   1afb3:	4a 8d 34 0b          	lea    (%rbx,%r9,1),%rsi
   1afb7:	48 89 df             	mov    %rbx,%rdi
   1afba:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
   1afbf:	4c 21 ff             	and    %r15,%rdi
   1afc2:	4d 89 c8             	mov    %r9,%r8
   1afc5:	49 29 f8             	sub    %rdi,%r8
   1afc8:	48 85 db             	test   %rbx,%rbx
   1afcb:	4c 0f 49 c6          	cmovns %rsi,%r8
   1afcf:	49 39 d0             	cmp    %rdx,%r8
   1afd2:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   1afd7:	48 0f 46 d3          	cmovbe %rbx,%rdx
   1afdb:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1afe0:	4b 8d 14 29          	lea    (%r9,%r13,1),%rdx
   1afe4:	4d 21 ef             	and    %r13,%r15
   1afe7:	4d 29 f9             	sub    %r15,%r9
   1afea:	4d 85 ed             	test   %r13,%r13
   1afed:	4c 0f 49 ca          	cmovns %rdx,%r9
   1aff1:	4d 39 f1             	cmp    %r14,%r9
   1aff4:	49 0f 43 c5          	cmovae %r13,%rax
   1aff8:	e9 07 04 00 00       	jmp    1b404 <<hyperinterval::float::F64Enclosure>::corner_image+0x8c4>
   1affd:	49 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%r10
   1b004:	ff 0f 00 
   1b007:	4c 89 e8             	mov    %r13,%rax
   1b00a:	48 c1 e8 34          	shr    $0x34,%rax
   1b00e:	25 ff 07 00 00       	and    $0x7ff,%eax
   1b013:	4c 89 ea             	mov    %r13,%rdx
   1b016:	4c 21 d2             	and    %r10,%rdx
   1b019:	8d 88 cd fb ff ff    	lea    -0x433(%rax),%ecx
   1b01f:	48 85 c0             	test   %rax,%rax
   1b022:	4e 8d 44 12 01       	lea    0x1(%rdx,%r10,1),%r8
   1b027:	b8 ce fb ff ff       	mov    $0xfffffbce,%eax
   1b02c:	0f 44 c8             	cmove  %eax,%ecx
   1b02f:	4c 0f 44 c2          	cmove  %rdx,%r8
   1b033:	4c 8b 4c 24 28       	mov    0x28(%rsp),%r9
   1b038:	4c 89 ca             	mov    %r9,%rdx
   1b03b:	48 c1 ea 34          	shr    $0x34,%rdx
   1b03f:	81 e2 ff 07 00 00    	and    $0x7ff,%edx
   1b045:	4c 89 cf             	mov    %r9,%rdi
   1b048:	4c 21 d7             	and    %r10,%rdi
   1b04b:	8d aa cd fb ff ff    	lea    -0x433(%rdx),%ebp
   1b051:	48 85 d2             	test   %rdx,%rdx
   1b054:	4e 8d 64 17 01       	lea    0x1(%rdi,%r10,1),%r12
   1b059:	0f 44 e8             	cmove  %eax,%ebp
   1b05c:	4c 0f 44 e7          	cmove  %rdi,%r12
   1b060:	4d 31 cd             	xor    %r9,%r13
   1b063:	4c 89 e0             	mov    %r12,%rax
   1b066:	49 f7 e0             	mul    %r8
   1b069:	01 e9                	add    %ebp,%ecx
   1b06b:	49 c1 ed 3f          	shr    $0x3f,%r13
   1b06f:	44 88 6c 24 14       	mov    %r13b,0x14(%rsp)
   1b074:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b079:	48 89 04 24          	mov    %rax,(%rsp)
   1b07d:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1b081:	48 8d 7c 24 48       	lea    0x48(%rsp),%rdi
   1b086:	48 89 e1             	mov    %rsp,%rcx
   1b089:	4c 89 f6             	mov    %r14,%rsi
   1b08c:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   1b093:	00 f0 7f 
   1b096:	4c 89 ea             	mov    %r13,%rdx
   1b099:	e8 f2 f3 ff ff       	call   1a490 <<hyperinterval::ieee::Format>::rounded>
   1b09e:	80 7c 24 48 00       	cmpb   $0x0,0x48(%rsp)
   1b0a3:	0f 85 c0 fb ff ff    	jne    1ac69 <<hyperinterval::float::F64Enclosure>::corner_image+0x129>
   1b0a9:	4c 89 a4 24 80 00 00 	mov    %r12,0x80(%rsp)
   1b0b0:	00 
   1b0b1:	89 6c 24 6c          	mov    %ebp,0x6c(%rsp)
   1b0b5:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
   1b0ba:	4c 8b 64 24 58       	mov    0x58(%rsp),%r12
   1b0bf:	48 89 e7             	mov    %rsp,%rdi
   1b0c2:	4c 89 f6             	mov    %r14,%rsi
   1b0c5:	4c 89 ea             	mov    %r13,%rdx
   1b0c8:	e8 83 cd ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1b0cd:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b0d1:	0f 84 d8 fb ff ff    	je     1acaf <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b0d7:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1b0dc:	48 89 e7             	mov    %rsp,%rdi
   1b0df:	4c 89 f6             	mov    %r14,%rsi
   1b0e2:	4c 89 ea             	mov    %r13,%rdx
   1b0e5:	4c 89 e1             	mov    %r12,%rcx
   1b0e8:	e8 63 cd ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1b0ed:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b0f1:	0f 84 b8 fb ff ff    	je     1acaf <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b0f7:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b0fc:	49 8d 14 2e          	lea    (%r14,%rbp,1),%rdx
   1b100:	48 89 ee             	mov    %rbp,%rsi
   1b103:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1b108:	4c 21 c6             	and    %r8,%rsi
   1b10b:	4c 89 f1             	mov    %r14,%rcx
   1b10e:	48 29 f1             	sub    %rsi,%rcx
   1b111:	48 85 ed             	test   %rbp,%rbp
   1b114:	48 0f 49 ca          	cmovns %rdx,%rcx
   1b118:	4a 8d 34 30          	lea    (%rax,%r14,1),%rsi
   1b11c:	48 89 c7             	mov    %rax,%rdi
   1b11f:	4c 21 c7             	and    %r8,%rdi
   1b122:	4c 89 f2             	mov    %r14,%rdx
   1b125:	48 29 fa             	sub    %rdi,%rdx
   1b128:	48 85 c0             	test   %rax,%rax
   1b12b:	48 0f 49 d6          	cmovns %rsi,%rdx
   1b12f:	48 39 d1             	cmp    %rdx,%rcx
   1b132:	76 08                	jbe    1b13c <<hyperinterval::float::F64Enclosure>::corner_image+0x5fc>
   1b134:	40 b7 01             	mov    $0x1,%dil
   1b137:	e9 78 fb ff ff       	jmp    1acb4 <<hyperinterval::float::F64Enclosure>::corner_image+0x174>
   1b13c:	49 39 cf             	cmp    %rcx,%r15
   1b13f:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   1b144:	48 0f 47 cd          	cmova  %rbp,%rcx
   1b148:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
   1b14d:	48 39 d3             	cmp    %rdx,%rbx
   1b150:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1b155:	48 0f 42 c8          	cmovb  %rax,%rcx
   1b159:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
   1b15e:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   1b163:	4c 89 c0             	mov    %r8,%rax
   1b166:	48 c1 e8 34          	shr    $0x34,%rax
   1b16a:	25 ff 07 00 00       	and    $0x7ff,%eax
   1b16f:	4c 89 c1             	mov    %r8,%rcx
   1b172:	49 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%r10
   1b179:	ff 0f 00 
   1b17c:	4c 21 d1             	and    %r10,%rcx
   1b17f:	8d 98 cd fb ff ff    	lea    -0x433(%rax),%ebx
   1b185:	48 85 c0             	test   %rax,%rax
   1b188:	4e 8d 6c 11 01       	lea    0x1(%rcx,%r10,1),%r13
   1b18d:	ba ce fb ff ff       	mov    $0xfffffbce,%edx
   1b192:	0f 44 da             	cmove  %edx,%ebx
   1b195:	4c 0f 44 e9          	cmove  %rcx,%r13
   1b199:	4c 8b 4c 24 70       	mov    0x70(%rsp),%r9
   1b19e:	4c 89 c8             	mov    %r9,%rax
   1b1a1:	48 c1 e8 34          	shr    $0x34,%rax
   1b1a5:	25 ff 07 00 00       	and    $0x7ff,%eax
   1b1aa:	4c 89 c9             	mov    %r9,%rcx
   1b1ad:	4c 21 d1             	and    %r10,%rcx
   1b1b0:	8d b8 cd fb ff ff    	lea    -0x433(%rax),%edi
   1b1b6:	48 85 c0             	test   %rax,%rax
   1b1b9:	4a 8d 44 11 01       	lea    0x1(%rcx,%r10,1),%rax
   1b1be:	0f 44 fa             	cmove  %edx,%edi
   1b1c1:	48 0f 44 c1          	cmove  %rcx,%rax
   1b1c5:	4d 31 c1             	xor    %r8,%r9
   1b1c8:	49 f7 e5             	mul    %r13
   1b1cb:	01 df                	add    %ebx,%edi
   1b1cd:	49 c1 e9 3f          	shr    $0x3f,%r9
   1b1d1:	44 88 4c 24 14       	mov    %r9b,0x14(%rsp)
   1b1d6:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b1db:	48 89 04 24          	mov    %rax,(%rsp)
   1b1df:	89 7c 24 10          	mov    %edi,0x10(%rsp)
   1b1e3:	48 8d 7c 24 48       	lea    0x48(%rsp),%rdi
   1b1e8:	48 89 e1             	mov    %rsp,%rcx
   1b1eb:	4c 89 f6             	mov    %r14,%rsi
   1b1ee:	48 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%rbp
   1b1f5:	00 f0 7f 
   1b1f8:	48 89 ea             	mov    %rbp,%rdx
   1b1fb:	e8 90 f2 ff ff       	call   1a490 <<hyperinterval::ieee::Format>::rounded>
   1b200:	80 7c 24 48 00       	cmpb   $0x0,0x48(%rsp)
   1b205:	0f 85 5e fa ff ff    	jne    1ac69 <<hyperinterval::float::F64Enclosure>::corner_image+0x129>
   1b20b:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
   1b210:	4c 8b 64 24 58       	mov    0x58(%rsp),%r12
   1b215:	48 89 e7             	mov    %rsp,%rdi
   1b218:	4c 89 f6             	mov    %r14,%rsi
   1b21b:	48 89 ea             	mov    %rbp,%rdx
   1b21e:	e8 2d cc ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1b223:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b227:	0f 85 82 fa ff ff    	jne    1acaf <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b22d:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1b232:	48 89 e7             	mov    %rsp,%rdi
   1b235:	4c 89 f6             	mov    %r14,%rsi
   1b238:	48 89 ea             	mov    %rbp,%rdx
   1b23b:	4c 89 e1             	mov    %r12,%rcx
   1b23e:	e8 0d cc ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1b243:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b247:	0f 85 62 fa ff ff    	jne    1acaf <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b24d:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1b252:	4b 8d 04 37          	lea    (%r15,%r14,1),%rax
   1b256:	4c 89 fa             	mov    %r15,%rdx
   1b259:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1b25e:	4c 21 c2             	and    %r8,%rdx
   1b261:	4c 89 f1             	mov    %r14,%rcx
   1b264:	48 29 d1             	sub    %rdx,%rcx
   1b267:	4d 85 ff             	test   %r15,%r15
   1b26a:	48 0f 49 c8          	cmovns %rax,%rcx
   1b26e:	4b 8d 14 34          	lea    (%r12,%r14,1),%rdx
   1b272:	4c 89 e6             	mov    %r12,%rsi
   1b275:	4c 21 c6             	and    %r8,%rsi
   1b278:	4c 89 f0             	mov    %r14,%rax
   1b27b:	48 29 f0             	sub    %rsi,%rax
   1b27e:	4d 85 e4             	test   %r12,%r12
   1b281:	48 0f 49 c2          	cmovns %rdx,%rax
   1b285:	48 39 c1             	cmp    %rax,%rcx
   1b288:	0f 87 a6 fe ff ff    	ja     1b134 <<hyperinterval::float::F64Enclosure>::corner_image+0x5f4>
   1b28e:	4c 8b 4c 24 38       	mov    0x38(%rsp),%r9
   1b293:	4c 89 ca             	mov    %r9,%rdx
   1b296:	4c 21 c2             	and    %r8,%rdx
   1b299:	4c 89 f7             	mov    %r14,%rdi
   1b29c:	48 29 d7             	sub    %rdx,%rdi
   1b29f:	4b 8d 14 31          	lea    (%r9,%r14,1),%rdx
   1b2a3:	4d 85 c9             	test   %r9,%r9
   1b2a6:	48 0f 49 fa          	cmovns %rdx,%rdi
   1b2aa:	48 39 cf             	cmp    %rcx,%rdi
   1b2ad:	4d 0f 46 f9          	cmovbe %r9,%r15
   1b2b1:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
   1b2b6:	48 89 f9             	mov    %rdi,%rcx
   1b2b9:	4c 21 c1             	and    %r8,%rcx
   1b2bc:	4c 89 f2             	mov    %r14,%rdx
   1b2bf:	48 29 ca             	sub    %rcx,%rdx
   1b2c2:	4a 8d 0c 37          	lea    (%rdi,%r14,1),%rcx
   1b2c6:	48 85 ff             	test   %rdi,%rdi
   1b2c9:	48 0f 49 d1          	cmovns %rcx,%rdx
   1b2cd:	48 39 c2             	cmp    %rax,%rdx
   1b2d0:	4c 0f 43 e7          	cmovae %rdi,%r12
   1b2d4:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   1b2d9:	48 33 44 24 60       	xor    0x60(%rsp),%rax
   1b2de:	8b 4c 24 6c          	mov    0x6c(%rsp),%ecx
   1b2e2:	01 d9                	add    %ebx,%ecx
   1b2e4:	48 c1 e8 3f          	shr    $0x3f,%rax
   1b2e8:	88 44 24 14          	mov    %al,0x14(%rsp)
   1b2ec:	48 8b 84 24 80 00 00 	mov    0x80(%rsp),%rax
   1b2f3:	00 
   1b2f4:	49 f7 e5             	mul    %r13
   1b2f7:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b2fc:	48 89 04 24          	mov    %rax,(%rsp)
   1b300:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1b304:	48 8d 7c 24 48       	lea    0x48(%rsp),%rdi
   1b309:	48 89 e1             	mov    %rsp,%rcx
   1b30c:	4c 89 f6             	mov    %r14,%rsi
   1b30f:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   1b316:	00 f0 7f 
   1b319:	4c 89 ea             	mov    %r13,%rdx
   1b31c:	e8 6f f1 ff ff       	call   1a490 <<hyperinterval::ieee::Format>::rounded>
   1b321:	80 7c 24 48 00       	cmpb   $0x0,0x48(%rsp)
   1b326:	0f 85 3d f9 ff ff    	jne    1ac69 <<hyperinterval::float::F64Enclosure>::corner_image+0x129>
   1b32c:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
   1b331:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
   1b336:	48 89 e7             	mov    %rsp,%rdi
   1b339:	4c 89 f6             	mov    %r14,%rsi
   1b33c:	4c 89 ea             	mov    %r13,%rdx
   1b33f:	e8 0c cb ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1b344:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b348:	0f 85 61 f9 ff ff    	jne    1acaf <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b34e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b353:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1b358:	48 89 e7             	mov    %rsp,%rdi
   1b35b:	4c 89 f6             	mov    %r14,%rsi
   1b35e:	4c 89 ea             	mov    %r13,%rdx
   1b361:	48 89 d9             	mov    %rbx,%rcx
   1b364:	e8 e7 ca ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1b369:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b36d:	0f 85 3c f9 ff ff    	jne    1acaf <<hyperinterval::float::F64Enclosure>::corner_image+0x16f>
   1b373:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b378:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1b37d:	4a 8d 0c 37          	lea    (%rdi,%r14,1),%rcx
   1b381:	48 89 fe             	mov    %rdi,%rsi
   1b384:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1b389:	4c 21 c6             	and    %r8,%rsi
   1b38c:	4c 89 f2             	mov    %r14,%rdx
   1b38f:	48 29 f2             	sub    %rsi,%rdx
   1b392:	48 85 ff             	test   %rdi,%rdi
   1b395:	48 0f 49 d1          	cmovns %rcx,%rdx
   1b399:	4a 8d 34 30          	lea    (%rax,%r14,1),%rsi
   1b39d:	48 89 c7             	mov    %rax,%rdi
   1b3a0:	4c 21 c7             	and    %r8,%rdi
   1b3a3:	4d 89 f1             	mov    %r14,%r9
   1b3a6:	49 29 fe             	sub    %rdi,%r14
   1b3a9:	48 85 c0             	test   %rax,%rax
   1b3ac:	4c 0f 49 f6          	cmovns %rsi,%r14
   1b3b0:	4c 39 f2             	cmp    %r14,%rdx
   1b3b3:	40 b7 01             	mov    $0x1,%dil
   1b3b6:	0f 87 f8 f8 ff ff    	ja     1acb4 <<hyperinterval::float::F64Enclosure>::corner_image+0x174>
   1b3bc:	4d 89 fa             	mov    %r15,%r10
   1b3bf:	4b 8d 34 0f          	lea    (%r15,%r9,1),%rsi
   1b3c3:	4c 89 ff             	mov    %r15,%rdi
   1b3c6:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
   1b3cb:	4c 21 ff             	and    %r15,%rdi
   1b3ce:	4d 89 c8             	mov    %r9,%r8
   1b3d1:	49 29 f8             	sub    %rdi,%r8
   1b3d4:	4d 85 d2             	test   %r10,%r10
   1b3d7:	4c 0f 49 c6          	cmovns %rsi,%r8
   1b3db:	49 39 d0             	cmp    %rdx,%r8
   1b3de:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   1b3e3:	49 0f 46 d2          	cmovbe %r10,%rdx
   1b3e7:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1b3ec:	4b 8d 14 0c          	lea    (%r12,%r9,1),%rdx
   1b3f0:	4d 21 e7             	and    %r12,%r15
   1b3f3:	4d 29 f9             	sub    %r15,%r9
   1b3f6:	4d 85 e4             	test   %r12,%r12
   1b3f9:	4c 0f 49 ca          	cmovns %rdx,%r9
   1b3fd:	4d 39 f1             	cmp    %r14,%r9
   1b400:	49 0f 43 c4          	cmovae %r12,%rax
   1b404:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
   1b409:	48 c7 01 01 00 00 00 	movq   $0x1,(%rcx)
   1b410:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   1b415:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   1b419:	48 89 41 10          	mov    %rax,0x10(%rcx)
   1b41d:	e9 a2 f8 ff ff       	jmp    1acc4 <<hyperinterval::float::F64Enclosure>::corner_image+0x184>
   1b422:	cc                   	int3
   1b423:	cc                   	int3
   1b424:	cc                   	int3
   1b425:	cc                   	int3
   1b426:	cc                   	int3
   1b427:	cc                   	int3
   1b428:	cc                   	int3
   1b429:	cc                   	int3
   1b42a:	cc                   	int3
   1b42b:	cc                   	int3
   1b42c:	cc                   	int3
   1b42d:	cc                   	int3
   1b42e:	cc                   	int3
   1b42f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::intersection:
   1b430:	48 89 f8             	mov    %rdi,%rax
   1b433:	45 31 c0             	xor    %r8d,%r8d
   1b436:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b43a:	0f 85 d5 00 00 00    	jne    1b515 <<hyperinterval::float::F64Enclosure>::intersection+0xe5>
   1b440:	f6 02 01             	testb  $0x1,(%rdx)
   1b443:	0f 84 c0 00 00 00    	je     1b509 <<hyperinterval::float::F64Enclosure>::intersection+0xd9>
   1b449:	41 56                	push   %r14
   1b44b:	53                   	push   %rbx
   1b44c:	4c 8b 52 08          	mov    0x8(%rdx),%r10
   1b450:	4c 8b 4a 10          	mov    0x10(%rdx),%r9
   1b454:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1b458:	48 ba 00 00 00 00 00 	movabs $0x8000000000000000,%rdx
   1b45f:	00 00 80 
   1b462:	48 8d 3c 11          	lea    (%rcx,%rdx,1),%rdi
   1b466:	4c 8d 42 ff          	lea    -0x1(%rdx),%r8
   1b46a:	49 89 cb             	mov    %rcx,%r11
   1b46d:	4d 21 c3             	and    %r8,%r11
   1b470:	48 89 d3             	mov    %rdx,%rbx
   1b473:	4c 29 db             	sub    %r11,%rbx
   1b476:	48 85 c9             	test   %rcx,%rcx
   1b479:	48 0f 49 df          	cmovns %rdi,%rbx
   1b47d:	49 8d 3c 12          	lea    (%r10,%rdx,1),%rdi
   1b481:	4d 89 d3             	mov    %r10,%r11
   1b484:	4d 21 c3             	and    %r8,%r11
   1b487:	49 89 d6             	mov    %rdx,%r14
   1b48a:	4d 29 de             	sub    %r11,%r14
   1b48d:	4d 85 d2             	test   %r10,%r10
   1b490:	4c 0f 49 f7          	cmovns %rdi,%r14
   1b494:	48 8b 7e 10          	mov    0x10(%rsi),%rdi
   1b498:	4c 39 f3             	cmp    %r14,%rbx
   1b49b:	49 0f 42 ca          	cmovb  %r10,%rcx
   1b49f:	48 8d 34 17          	lea    (%rdi,%rdx,1),%rsi
   1b4a3:	49 89 fa             	mov    %rdi,%r10
   1b4a6:	4d 21 c2             	and    %r8,%r10
   1b4a9:	49 89 d3             	mov    %rdx,%r11
   1b4ac:	4d 29 d3             	sub    %r10,%r11
   1b4af:	48 85 ff             	test   %rdi,%rdi
   1b4b2:	4c 0f 49 de          	cmovns %rsi,%r11
   1b4b6:	49 8d 34 11          	lea    (%r9,%rdx,1),%rsi
   1b4ba:	4d 89 ca             	mov    %r9,%r10
   1b4bd:	4d 21 c2             	and    %r8,%r10
   1b4c0:	48 89 d3             	mov    %rdx,%rbx
   1b4c3:	4c 29 d3             	sub    %r10,%rbx
   1b4c6:	4d 85 c9             	test   %r9,%r9
   1b4c9:	48 0f 49 de          	cmovns %rsi,%rbx
   1b4cd:	49 39 db             	cmp    %rbx,%r11
   1b4d0:	49 0f 47 f9          	cmova  %r9,%rdi
   1b4d4:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
   1b4d8:	49 89 c9             	mov    %rcx,%r9
   1b4db:	4d 21 c1             	and    %r8,%r9
   1b4de:	49 89 d2             	mov    %rdx,%r10
   1b4e1:	4d 29 ca             	sub    %r9,%r10
   1b4e4:	48 85 c9             	test   %rcx,%rcx
   1b4e7:	4c 0f 49 d6          	cmovns %rsi,%r10
   1b4eb:	48 8d 34 17          	lea    (%rdi,%rdx,1),%rsi
   1b4ef:	49 21 f8             	and    %rdi,%r8
   1b4f2:	4c 29 c2             	sub    %r8,%rdx
   1b4f5:	48 85 ff             	test   %rdi,%rdi
   1b4f8:	48 0f 49 d6          	cmovns %rsi,%rdx
   1b4fc:	45 31 c0             	xor    %r8d,%r8d
   1b4ff:	49 39 d2             	cmp    %rdx,%r10
   1b502:	41 0f 96 c0          	setbe  %r8b
   1b506:	5b                   	pop    %rbx
   1b507:	41 5e                	pop    %r14
   1b509:	4c 89 00             	mov    %r8,(%rax)
   1b50c:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1b510:	48 89 78 10          	mov    %rdi,0x10(%rax)
   1b514:	c3                   	ret
   1b515:	4c 89 00             	mov    %r8,(%rax)
   1b518:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1b51c:	48 89 78 10          	mov    %rdi,0x10(%rax)
   1b520:	c3                   	ret
   1b521:	cc                   	int3
   1b522:	cc                   	int3
   1b523:	cc                   	int3
   1b524:	cc                   	int3
   1b525:	cc                   	int3
   1b526:	cc                   	int3
   1b527:	cc                   	int3
   1b528:	cc                   	int3
   1b529:	cc                   	int3
   1b52a:	cc                   	int3
   1b52b:	cc                   	int3
   1b52c:	cc                   	int3
   1b52d:	cc                   	int3
   1b52e:	cc                   	int3
   1b52f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::contains_point:
   1b530:	41 56                	push   %r14
   1b532:	53                   	push   %rbx
   1b533:	48 83 ec 18          	sub    $0x18,%rsp
   1b537:	49 89 fe             	mov    %rdi,%r14
   1b53a:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1b541:	00 00 80 
   1b544:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1b549:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1b54e:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1b555:	00 f0 7f 
   1b558:	48 89 de             	mov    %rbx,%rsi
   1b55b:	e8 f0 c8 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1b560:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1b565:	3c 01                	cmp    $0x1,%al
   1b567:	75 0d                	jne    1b576 <<hyperinterval::float::F64Enclosure>::contains_point+0x46>
   1b569:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   1b56e:	48 83 c4 18          	add    $0x18,%rsp
   1b572:	5b                   	pop    %rbx
   1b573:	41 5e                	pop    %r14
   1b575:	c3                   	ret
   1b576:	49 83 3e 01          	cmpq   $0x1,(%r14)
   1b57a:	75 40                	jne    1b5bc <<hyperinterval::float::F64Enclosure>::contains_point+0x8c>
   1b57c:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1b581:	49 8b 56 08          	mov    0x8(%r14),%rdx
   1b585:	48 8d 3c 1a          	lea    (%rdx,%rbx,1),%rdi
   1b589:	48 8d 4b ff          	lea    -0x1(%rbx),%rcx
   1b58d:	49 89 d0             	mov    %rdx,%r8
   1b590:	49 21 c8             	and    %rcx,%r8
   1b593:	49 89 d9             	mov    %rbx,%r9
   1b596:	4d 29 c1             	sub    %r8,%r9
   1b599:	48 85 d2             	test   %rdx,%rdx
   1b59c:	4c 0f 49 cf          	cmovns %rdi,%r9
   1b5a0:	48 8d 3c 1e          	lea    (%rsi,%rbx,1),%rdi
   1b5a4:	49 89 f0             	mov    %rsi,%r8
   1b5a7:	49 21 c8             	and    %rcx,%r8
   1b5aa:	48 89 da             	mov    %rbx,%rdx
   1b5ad:	4c 29 c2             	sub    %r8,%rdx
   1b5b0:	48 85 f6             	test   %rsi,%rsi
   1b5b3:	48 0f 49 d7          	cmovns %rdi,%rdx
   1b5b7:	49 39 d1             	cmp    %rdx,%r9
   1b5ba:	76 0a                	jbe    1b5c6 <<hyperinterval::float::F64Enclosure>::contains_point+0x96>
   1b5bc:	31 d2                	xor    %edx,%edx
   1b5be:	48 83 c4 18          	add    $0x18,%rsp
   1b5c2:	5b                   	pop    %rbx
   1b5c3:	41 5e                	pop    %r14
   1b5c5:	c3                   	ret
   1b5c6:	49 8b 76 10          	mov    0x10(%r14),%rsi
   1b5ca:	48 8d 3c 1e          	lea    (%rsi,%rbx,1),%rdi
   1b5ce:	48 21 f1             	and    %rsi,%rcx
   1b5d1:	48 29 cb             	sub    %rcx,%rbx
   1b5d4:	48 85 f6             	test   %rsi,%rsi
   1b5d7:	48 0f 49 df          	cmovns %rdi,%rbx
   1b5db:	48 39 da             	cmp    %rbx,%rdx
   1b5de:	0f 96 c2             	setbe  %dl
   1b5e1:	48 83 c4 18          	add    $0x18,%rsp
   1b5e5:	5b                   	pop    %rbx
   1b5e6:	41 5e                	pop    %r14
   1b5e8:	c3                   	ret
   1b5e9:	cc                   	int3
   1b5ea:	cc                   	int3
   1b5eb:	cc                   	int3
   1b5ec:	cc                   	int3
   1b5ed:	cc                   	int3
   1b5ee:	cc                   	int3
   1b5ef:	cc                   	int3

<hyperinterval::float::F64Enclosure>::interior_subset_of:
   1b5f0:	b0 01                	mov    $0x1,%al
   1b5f2:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1b5f6:	0f 85 8b 00 00 00    	jne    1b687 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x97>
   1b5fc:	f6 06 01             	testb  $0x1,(%rsi)
   1b5ff:	0f 84 80 00 00 00    	je     1b685 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x95>
   1b605:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1b609:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1b60d:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1b614:	00 00 80 
   1b617:	4d 8d 0c 00          	lea    (%r8,%rax,1),%r9
   1b61b:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1b61f:	4d 89 c2             	mov    %r8,%r10
   1b622:	49 21 ca             	and    %rcx,%r10
   1b625:	49 89 c3             	mov    %rax,%r11
   1b628:	4d 29 d3             	sub    %r10,%r11
   1b62b:	4d 85 c0             	test   %r8,%r8
   1b62e:	4d 0f 49 d9          	cmovns %r9,%r11
   1b632:	4c 8d 04 02          	lea    (%rdx,%rax,1),%r8
   1b636:	49 89 d1             	mov    %rdx,%r9
   1b639:	49 21 c9             	and    %rcx,%r9
   1b63c:	49 89 c2             	mov    %rax,%r10
   1b63f:	4d 29 ca             	sub    %r9,%r10
   1b642:	48 85 d2             	test   %rdx,%rdx
   1b645:	4d 0f 49 d0          	cmovns %r8,%r10
   1b649:	4d 39 d3             	cmp    %r10,%r11
   1b64c:	73 37                	jae    1b685 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x95>
   1b64e:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1b652:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1b656:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1b65a:	49 89 d0             	mov    %rdx,%r8
   1b65d:	49 21 c8             	and    %rcx,%r8
   1b660:	49 89 c1             	mov    %rax,%r9
   1b663:	4d 29 c1             	sub    %r8,%r9
   1b666:	48 85 d2             	test   %rdx,%rdx
   1b669:	4c 0f 49 cf          	cmovns %rdi,%r9
   1b66d:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1b671:	48 21 f1             	and    %rsi,%rcx
   1b674:	48 29 c8             	sub    %rcx,%rax
   1b677:	48 85 f6             	test   %rsi,%rsi
   1b67a:	48 0f 49 c2          	cmovns %rdx,%rax
   1b67e:	49 39 c1             	cmp    %rax,%r9
   1b681:	0f 92 c0             	setb   %al
   1b684:	c3                   	ret
   1b685:	31 c0                	xor    %eax,%eax
   1b687:	c3                   	ret
   1b688:	cc                   	int3
   1b689:	cc                   	int3
   1b68a:	cc                   	int3
   1b68b:	cc                   	int3
   1b68c:	cc                   	int3
   1b68d:	cc                   	int3
   1b68e:	cc                   	int3
   1b68f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::add:
   1b690:	48 89 f8             	mov    %rdi,%rax
   1b693:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b697:	0f 85 cb 00 00 00    	jne    1b768 <<hyperinterval::float::F64Enclosure>::add+0xd8>
   1b69d:	f6 02 01             	testb  $0x1,(%rdx)
   1b6a0:	0f 84 c2 00 00 00    	je     1b768 <<hyperinterval::float::F64Enclosure>::add+0xd8>
   1b6a6:	55                   	push   %rbp
   1b6a7:	41 57                	push   %r15
   1b6a9:	41 56                	push   %r14
   1b6ab:	41 55                	push   %r13
   1b6ad:	41 54                	push   %r12
   1b6af:	53                   	push   %rbx
   1b6b0:	48 83 ec 18          	sub    $0x18,%rsp
   1b6b4:	48 89 c5             	mov    %rax,%rbp
   1b6b7:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1b6bb:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1b6bf:	4c 8b 62 10          	mov    0x10(%rdx),%r12
   1b6c3:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1b6ca:	00 00 80 
   1b6cd:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1b6d4:	00 f0 7f 
   1b6d7:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   1b6db:	48 89 e7             	mov    %rsp,%rdi
   1b6de:	48 89 de             	mov    %rbx,%rsi
   1b6e1:	4c 89 f2             	mov    %r14,%rdx
   1b6e4:	e8 c7 e2 ff ff       	call   199b0 <<hyperinterval::ieee::Format>::add>
   1b6e9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b6ed:	74 57                	je     1b746 <<hyperinterval::float::F64Enclosure>::add+0xb6>
   1b6ef:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1b6f4:	48 89 e7             	mov    %rsp,%rdi
   1b6f7:	48 89 de             	mov    %rbx,%rsi
   1b6fa:	4c 89 f2             	mov    %r14,%rdx
   1b6fd:	4c 89 f9             	mov    %r15,%rcx
   1b700:	4d 89 e0             	mov    %r12,%r8
   1b703:	e8 a8 e2 ff ff       	call   199b0 <<hyperinterval::ieee::Format>::add>
   1b708:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b70c:	74 38                	je     1b746 <<hyperinterval::float::F64Enclosure>::add+0xb6>
   1b70e:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1b713:	48 89 e7             	mov    %rsp,%rdi
   1b716:	48 89 de             	mov    %rbx,%rsi
   1b719:	4c 89 f2             	mov    %r14,%rdx
   1b71c:	4c 89 e9             	mov    %r13,%rcx
   1b71f:	e8 2c c7 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1b724:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b728:	74 1c                	je     1b746 <<hyperinterval::float::F64Enclosure>::add+0xb6>
   1b72a:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1b72f:	48 89 e7             	mov    %rsp,%rdi
   1b732:	48 89 de             	mov    %rbx,%rsi
   1b735:	4c 89 f2             	mov    %r14,%rdx
   1b738:	4c 89 f9             	mov    %r15,%rcx
   1b73b:	e8 10 c7 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1b740:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b744:	75 2a                	jne    1b770 <<hyperinterval::float::F64Enclosure>::add+0xe0>
   1b746:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   1b74b:	48 89 e8             	mov    %rbp,%rax
   1b74e:	88 4d 08             	mov    %cl,0x8(%rbp)
   1b751:	48 c7 45 00 02 00 00 	movq   $0x2,0x0(%rbp)
   1b758:	00 
   1b759:	48 83 c4 18          	add    $0x18,%rsp
   1b75d:	5b                   	pop    %rbx
   1b75e:	41 5c                	pop    %r12
   1b760:	41 5d                	pop    %r13
   1b762:	41 5e                	pop    %r14
   1b764:	41 5f                	pop    %r15
   1b766:	5d                   	pop    %rbp
   1b767:	c3                   	ret
   1b768:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   1b76f:	c3                   	ret
   1b770:	49 8d 04 1c          	lea    (%r12,%rbx,1),%rax
   1b774:	48 8d 53 ff          	lea    -0x1(%rbx),%rdx
   1b778:	4c 89 e1             	mov    %r12,%rcx
   1b77b:	48 21 d1             	and    %rdx,%rcx
   1b77e:	48 89 de             	mov    %rbx,%rsi
   1b781:	48 29 ce             	sub    %rcx,%rsi
   1b784:	4d 85 e4             	test   %r12,%r12
   1b787:	48 0f 49 f0          	cmovns %rax,%rsi
   1b78b:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b790:	48 8d 04 19          	lea    (%rcx,%rbx,1),%rax
   1b794:	48 21 ca             	and    %rcx,%rdx
   1b797:	48 29 d3             	sub    %rdx,%rbx
   1b79a:	48 85 c9             	test   %rcx,%rcx
   1b79d:	48 0f 49 d8          	cmovns %rax,%rbx
   1b7a1:	48 39 de             	cmp    %rbx,%rsi
   1b7a4:	48 89 e8             	mov    %rbp,%rax
   1b7a7:	76 0d                	jbe    1b7b6 <<hyperinterval::float::F64Enclosure>::add+0x126>
   1b7a9:	c6 40 08 01          	movb   $0x1,0x8(%rax)
   1b7ad:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1b7b4:	eb a3                	jmp    1b759 <<hyperinterval::float::F64Enclosure>::add+0xc9>
   1b7b6:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   1b7bd:	4c 89 60 08          	mov    %r12,0x8(%rax)
   1b7c1:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1b7c5:	eb 92                	jmp    1b759 <<hyperinterval::float::F64Enclosure>::add+0xc9>
   1b7c7:	cc                   	int3
   1b7c8:	cc                   	int3
   1b7c9:	cc                   	int3
   1b7ca:	cc                   	int3
   1b7cb:	cc                   	int3
   1b7cc:	cc                   	int3
   1b7cd:	cc                   	int3
   1b7ce:	cc                   	int3
   1b7cf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::div:
   1b7d0:	53                   	push   %rbx
   1b7d1:	48 89 fb             	mov    %rdi,%rbx
   1b7d4:	83 3a 01             	cmpl   $0x1,(%rdx)
   1b7d7:	75 1e                	jne    1b7f7 <<hyperinterval::float::F64Enclosure>::div+0x27>
   1b7d9:	48 83 7a 08 00       	cmpq   $0x0,0x8(%rdx)
   1b7de:	7f 17                	jg     1b7f7 <<hyperinterval::float::F64Enclosure>::div+0x27>
   1b7e0:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1b7e4:	48 85 c0             	test   %rax,%rax
   1b7e7:	0f 99 c1             	setns  %cl
   1b7ea:	48 d1 e0             	shl    $1,%rax
   1b7ed:	48 85 c0             	test   %rax,%rax
   1b7f0:	0f 94 c0             	sete   %al
   1b7f3:	08 c8                	or     %cl,%al
   1b7f5:	75 12                	jne    1b809 <<hyperinterval::float::F64Enclosure>::div+0x39>
   1b7f7:	48 89 df             	mov    %rbx,%rdi
   1b7fa:	b9 01 00 00 00       	mov    $0x1,%ecx
   1b7ff:	e8 3c f3 ff ff       	call   1ab40 <<hyperinterval::float::F64Enclosure>::corner_image>
   1b804:	48 89 d8             	mov    %rbx,%rax
   1b807:	5b                   	pop    %rbx
   1b808:	c3                   	ret
   1b809:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
   1b80d:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b814:	48 89 d8             	mov    %rbx,%rax
   1b817:	5b                   	pop    %rbx
   1b818:	c3                   	ret
   1b819:	cc                   	int3
   1b81a:	cc                   	int3
   1b81b:	cc                   	int3
   1b81c:	cc                   	int3
   1b81d:	cc                   	int3
   1b81e:	cc                   	int3
   1b81f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::new:
   1b820:	41 57                	push   %r15
   1b822:	41 56                	push   %r14
   1b824:	41 54                	push   %r12
   1b826:	53                   	push   %rbx
   1b827:	48 83 ec 18          	sub    $0x18,%rsp
   1b82b:	f2 0f 11 4c 24 10    	movsd  %xmm1,0x10(%rsp)
   1b831:	48 89 fb             	mov    %rdi,%rbx
   1b834:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b83b:	00 00 80 
   1b83e:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1b845:	00 f0 7f 
   1b848:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1b84d:	48 89 e7             	mov    %rsp,%rdi
   1b850:	4c 89 f6             	mov    %r14,%rsi
   1b853:	4c 89 fa             	mov    %r15,%rdx
   1b856:	e8 f5 c5 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1b85b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b85f:	74 24                	je     1b885 <<hyperinterval::float::F64Enclosure>::new+0x65>
   1b861:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1b866:	f3 0f 7e 44 24 10    	movq   0x10(%rsp),%xmm0
   1b86c:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1b871:	48 89 e7             	mov    %rsp,%rdi
   1b874:	4c 89 f6             	mov    %r14,%rsi
   1b877:	4c 89 fa             	mov    %r15,%rdx
   1b87a:	e8 d1 c5 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1b87f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b883:	75 1e                	jne    1b8a3 <<hyperinterval::float::F64Enclosure>::new+0x83>
   1b885:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1b88a:	88 43 08             	mov    %al,0x8(%rbx)
   1b88d:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b894:	48 89 d8             	mov    %rbx,%rax
   1b897:	48 83 c4 18          	add    $0x18,%rsp
   1b89b:	5b                   	pop    %rbx
   1b89c:	41 5c                	pop    %r12
   1b89e:	41 5e                	pop    %r14
   1b8a0:	41 5f                	pop    %r15
   1b8a2:	c3                   	ret
   1b8a3:	4b 8d 04 34          	lea    (%r12,%r14,1),%rax
   1b8a7:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1b8ab:	4c 89 e2             	mov    %r12,%rdx
   1b8ae:	48 21 ca             	and    %rcx,%rdx
   1b8b1:	4c 89 f6             	mov    %r14,%rsi
   1b8b4:	48 29 d6             	sub    %rdx,%rsi
   1b8b7:	4d 85 e4             	test   %r12,%r12
   1b8ba:	48 0f 49 f0          	cmovns %rax,%rsi
   1b8be:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b8c3:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1b8c7:	48 21 c1             	and    %rax,%rcx
   1b8ca:	49 29 ce             	sub    %rcx,%r14
   1b8cd:	48 85 c0             	test   %rax,%rax
   1b8d0:	4c 0f 49 f2          	cmovns %rdx,%r14
   1b8d4:	4c 39 f6             	cmp    %r14,%rsi
   1b8d7:	76 06                	jbe    1b8df <<hyperinterval::float::F64Enclosure>::new+0xbf>
   1b8d9:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1b8dd:	eb ae                	jmp    1b88d <<hyperinterval::float::F64Enclosure>::new+0x6d>
   1b8df:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1b8e6:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   1b8ea:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1b8ee:	eb a4                	jmp    1b894 <<hyperinterval::float::F64Enclosure>::new+0x74>

<hyperinterval::float::F64Enclosure>::sub:
   1b8f0:	53                   	push   %rbx
   1b8f1:	48 83 ec 20          	sub    $0x20,%rsp
   1b8f5:	48 89 fb             	mov    %rdi,%rbx
   1b8f8:	48 83 3a 01          	cmpq   $0x1,(%rdx)
   1b8fc:	75 30                	jne    1b92e <<hyperinterval::float::F64Enclosure>::sub+0x3e>
   1b8fe:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   1b902:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1b906:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1b90d:	00 00 80 
   1b910:	48 89 d1             	mov    %rdx,%rcx
   1b913:	48 31 c1             	xor    %rax,%rcx
   1b916:	48 85 d2             	test   %rdx,%rdx
   1b919:	48 0f 44 ca          	cmove  %rdx,%rcx
   1b91d:	48 31 f8             	xor    %rdi,%rax
   1b920:	48 85 ff             	test   %rdi,%rdi
   1b923:	48 0f 44 c7          	cmove  %rdi,%rax
   1b927:	ba 01 00 00 00       	mov    $0x1,%edx
   1b92c:	eb 02                	jmp    1b930 <<hyperinterval::float::F64Enclosure>::sub+0x40>
   1b92e:	31 d2                	xor    %edx,%edx
   1b930:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b935:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
   1b93a:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1b93f:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
   1b944:	48 89 df             	mov    %rbx,%rdi
   1b947:	ff 15 0b ff 03 00    	call   *0x3ff0b(%rip)        # 5b858 <_DYNAMIC+0x300>
   1b94d:	48 89 d8             	mov    %rbx,%rax
   1b950:	48 83 c4 20          	add    $0x20,%rsp
   1b954:	5b                   	pop    %rbx
   1b955:	c3                   	ret
   1b956:	cc                   	int3
   1b957:	cc                   	int3
   1b958:	cc                   	int3
   1b959:	cc                   	int3
   1b95a:	cc                   	int3
   1b95b:	cc                   	int3
   1b95c:	cc                   	int3
   1b95d:	cc                   	int3
   1b95e:	cc                   	int3
   1b95f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::hull:
   1b960:	48 89 f8             	mov    %rdi,%rax
   1b963:	4c 8b 02             	mov    (%rdx),%r8
   1b966:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   1b96a:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
   1b96e:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b972:	0f 85 9f 00 00 00    	jne    1ba17 <<hyperinterval::float::F64Enclosure>::hull+0xb7>
   1b978:	4c 8b 56 08          	mov    0x8(%rsi),%r10
   1b97c:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1b980:	ba 01 00 00 00       	mov    $0x1,%edx
   1b985:	49 83 f8 01          	cmp    $0x1,%r8
   1b989:	0f 85 97 00 00 00    	jne    1ba26 <<hyperinterval::float::F64Enclosure>::hull+0xc6>
   1b98f:	41 57                	push   %r15
   1b991:	41 56                	push   %r14
   1b993:	53                   	push   %rbx
   1b994:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1b99b:	00 00 80 
   1b99e:	4f 8d 1c 02          	lea    (%r10,%r8,1),%r11
   1b9a2:	4d 8d 48 ff          	lea    -0x1(%r8),%r9
   1b9a6:	4c 89 d3             	mov    %r10,%rbx
   1b9a9:	4c 21 cb             	and    %r9,%rbx
   1b9ac:	4d 89 c6             	mov    %r8,%r14
   1b9af:	49 29 de             	sub    %rbx,%r14
   1b9b2:	4d 85 d2             	test   %r10,%r10
   1b9b5:	4d 0f 49 f3          	cmovns %r11,%r14
   1b9b9:	4e 8d 1c 07          	lea    (%rdi,%r8,1),%r11
   1b9bd:	48 89 fb             	mov    %rdi,%rbx
   1b9c0:	4c 21 cb             	and    %r9,%rbx
   1b9c3:	4d 89 c7             	mov    %r8,%r15
   1b9c6:	49 29 df             	sub    %rbx,%r15
   1b9c9:	48 85 ff             	test   %rdi,%rdi
   1b9cc:	4d 0f 49 fb          	cmovns %r11,%r15
   1b9d0:	4d 39 fe             	cmp    %r15,%r14
   1b9d3:	49 0f 46 fa          	cmovbe %r10,%rdi
   1b9d7:	4e 8d 14 06          	lea    (%rsi,%r8,1),%r10
   1b9db:	49 89 f3             	mov    %rsi,%r11
   1b9de:	4d 21 cb             	and    %r9,%r11
   1b9e1:	4c 89 c3             	mov    %r8,%rbx
   1b9e4:	4c 29 db             	sub    %r11,%rbx
   1b9e7:	48 85 f6             	test   %rsi,%rsi
   1b9ea:	49 0f 49 da          	cmovns %r10,%rbx
   1b9ee:	4e 8d 14 01          	lea    (%rcx,%r8,1),%r10
   1b9f2:	49 21 c9             	and    %rcx,%r9
   1b9f5:	4d 29 c8             	sub    %r9,%r8
   1b9f8:	48 85 c9             	test   %rcx,%rcx
   1b9fb:	4d 0f 49 c2          	cmovns %r10,%r8
   1b9ff:	4c 39 c3             	cmp    %r8,%rbx
   1ba02:	48 0f 43 ce          	cmovae %rsi,%rcx
   1ba06:	5b                   	pop    %rbx
   1ba07:	41 5e                	pop    %r14
   1ba09:	41 5f                	pop    %r15
   1ba0b:	48 89 10             	mov    %rdx,(%rax)
   1ba0e:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1ba12:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1ba16:	c3                   	ret
   1ba17:	4c 89 c2             	mov    %r8,%rdx
   1ba1a:	48 89 10             	mov    %rdx,(%rax)
   1ba1d:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1ba21:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1ba25:	c3                   	ret
   1ba26:	48 89 f1             	mov    %rsi,%rcx
   1ba29:	4c 89 d7             	mov    %r10,%rdi
   1ba2c:	48 89 10             	mov    %rdx,(%rax)
   1ba2f:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1ba33:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1ba37:	c3                   	ret
   1ba38:	cc                   	int3
   1ba39:	cc                   	int3
   1ba3a:	cc                   	int3
   1ba3b:	cc                   	int3
   1ba3c:	cc                   	int3
   1ba3d:	cc                   	int3
   1ba3e:	cc                   	int3
   1ba3f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::point:
   1ba40:	53                   	push   %rbx
   1ba41:	48 83 ec 10          	sub    $0x10,%rsp
   1ba45:	48 89 fb             	mov    %rdi,%rbx
   1ba48:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1ba4d:	48 89 e7             	mov    %rsp,%rdi
   1ba50:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1ba57:	00 00 80 
   1ba5a:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1ba61:	00 f0 7f 
   1ba64:	e8 e7 c3 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1ba69:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1ba6d:	75 0f                	jne    1ba7e <<hyperinterval::float::F64Enclosure>::point+0x3e>
   1ba6f:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1ba74:	88 43 08             	mov    %al,0x8(%rbx)
   1ba77:	b8 02 00 00 00       	mov    $0x2,%eax
   1ba7c:	eb 12                	jmp    1ba90 <<hyperinterval::float::F64Enclosure>::point+0x50>
   1ba7e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1ba83:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1ba87:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1ba8b:	b8 01 00 00 00       	mov    $0x1,%eax
   1ba90:	48 89 03             	mov    %rax,(%rbx)
   1ba93:	48 89 d8             	mov    %rbx,%rax
   1ba96:	48 83 c4 10          	add    $0x10,%rsp
   1ba9a:	5b                   	pop    %rbx
   1ba9b:	c3                   	ret
   1ba9c:	cc                   	int3
   1ba9d:	cc                   	int3
   1ba9e:	cc                   	int3
   1ba9f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::signs:
   1baa0:	83 3f 01             	cmpl   $0x1,(%rdi)
   1baa3:	75 69                	jne    1bb0e <<hyperinterval::float::F64Enclosure>::signs+0x6e>
   1baa5:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1baac:	00 00 80 
   1baaf:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   1bab3:	48 8b 47 10          	mov    0x10(%rdi),%rax
   1bab7:	4a 8d 14 01          	lea    (%rcx,%r8,1),%rdx
   1babb:	49 8d 70 ff          	lea    -0x1(%r8),%rsi
   1babf:	49 89 c9             	mov    %rcx,%r9
   1bac2:	49 21 f1             	and    %rsi,%r9
   1bac5:	4c 89 c7             	mov    %r8,%rdi
   1bac8:	4c 29 cf             	sub    %r9,%rdi
   1bacb:	48 85 c9             	test   %rcx,%rcx
   1bace:	48 0f 49 fa          	cmovns %rdx,%rdi
   1bad2:	31 d2                	xor    %edx,%edx
   1bad4:	48 85 ff             	test   %rdi,%rdi
   1bad7:	0f 99 c1             	setns  %cl
   1bada:	4c 39 c7             	cmp    %r8,%rdi
   1badd:	77 1f                	ja     1bafe <<hyperinterval::float::F64Enclosure>::signs+0x5e>
   1badf:	48 85 ff             	test   %rdi,%rdi
   1bae2:	40 0f 99 c7          	setns  %dil
   1bae6:	40 80 cf 02          	or     $0x2,%dil
   1baea:	48 85 f0             	test   %rsi,%rax
   1baed:	88 ca                	mov    %cl,%dl
   1baef:	40 0f b6 cf          	movzbl %dil,%ecx
   1baf3:	0f 44 d1             	cmove  %ecx,%edx
   1baf6:	48 85 c0             	test   %rax,%rax
   1baf9:	0f 49 d1             	cmovns %ecx,%edx
   1bafc:	89 d1                	mov    %edx,%ecx
   1bafe:	8d 51 04             	lea    0x4(%rcx),%edx
   1bb01:	48 85 c0             	test   %rax,%rax
   1bb04:	0f b6 c9             	movzbl %cl,%ecx
   1bb07:	0f b6 c2             	movzbl %dl,%eax
   1bb0a:	0f 4e c1             	cmovle %ecx,%eax
   1bb0d:	c3                   	ret
   1bb0e:	31 c0                	xor    %eax,%eax
   1bb10:	c3                   	ret
   1bb11:	cc                   	int3
   1bb12:	cc                   	int3
   1bb13:	cc                   	int3
   1bb14:	cc                   	int3
   1bb15:	cc                   	int3
   1bb16:	cc                   	int3
   1bb17:	cc                   	int3
   1bb18:	cc                   	int3
   1bb19:	cc                   	int3
   1bb1a:	cc                   	int3
   1bb1b:	cc                   	int3
   1bb1c:	cc                   	int3
   1bb1d:	cc                   	int3
   1bb1e:	cc                   	int3
   1bb1f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::affine:
   1bb20:	41 57                	push   %r15
   1bb22:	41 56                	push   %r14
   1bb24:	41 54                	push   %r12
   1bb26:	53                   	push   %rbx
   1bb27:	48 83 ec 68          	sub    $0x68,%rsp
   1bb2b:	f2 0f 11 4c 24 18    	movsd  %xmm1,0x18(%rsp)
   1bb31:	49 89 f6             	mov    %rsi,%r14
   1bb34:	48 89 fb             	mov    %rdi,%rbx
   1bb37:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
   1bb3e:	00 00 80 
   1bb41:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1bb48:	00 f0 7f 
   1bb4b:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1bb50:	48 89 e7             	mov    %rsp,%rdi
   1bb53:	4c 89 fe             	mov    %r15,%rsi
   1bb56:	4c 89 e2             	mov    %r12,%rdx
   1bb59:	e8 f2 c2 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1bb5e:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bb62:	74 37                	je     1bb9b <<hyperinterval::float::F64Enclosure>::affine+0x7b>
   1bb64:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1bb69:	48 c7 44 24 38 01 00 	movq   $0x1,0x38(%rsp)
   1bb70:	00 00 
   1bb72:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1bb77:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1bb7c:	f3 0f 7e 44 24 18    	movq   0x18(%rsp),%xmm0
   1bb82:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1bb87:	48 89 e7             	mov    %rsp,%rdi
   1bb8a:	4c 89 fe             	mov    %r15,%rsi
   1bb8d:	4c 89 e2             	mov    %r12,%rdx
   1bb90:	e8 bb c2 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1bb95:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bb99:	75 1e                	jne    1bbb9 <<hyperinterval::float::F64Enclosure>::affine+0x99>
   1bb9b:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1bba0:	88 43 08             	mov    %al,0x8(%rbx)
   1bba3:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1bbaa:	48 89 d8             	mov    %rbx,%rax
   1bbad:	48 83 c4 68          	add    $0x68,%rsp
   1bbb1:	5b                   	pop    %rbx
   1bbb2:	41 5c                	pop    %r12
   1bbb4:	41 5e                	pop    %r14
   1bbb6:	41 5f                	pop    %r15
   1bbb8:	c3                   	ret
   1bbb9:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1bbbe:	48 c7 44 24 50 01 00 	movq   $0x1,0x50(%rsp)
   1bbc5:	00 00 
   1bbc7:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1bbcc:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1bbd1:	48 89 e7             	mov    %rsp,%rdi
   1bbd4:	48 8d 54 24 38       	lea    0x38(%rsp),%rdx
   1bbd9:	4c 89 f6             	mov    %r14,%rsi
   1bbdc:	31 c9                	xor    %ecx,%ecx
   1bbde:	e8 5d ef ff ff       	call   1ab40 <<hyperinterval::float::F64Enclosure>::corner_image>
   1bbe3:	48 8b 0c 24          	mov    (%rsp),%rcx
   1bbe7:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1bbec:	48 83 f9 02          	cmp    $0x2,%rcx
   1bbf0:	74 ae                	je     1bba0 <<hyperinterval::float::F64Enclosure>::affine+0x80>
   1bbf2:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   1bbf7:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1bbfc:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1bc01:	48 89 54 24 29       	mov    %rdx,0x29(%rsp)
   1bc06:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   1bc0b:	88 44 24 28          	mov    %al,0x28(%rsp)
   1bc0f:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
   1bc14:	48 8d 54 24 50       	lea    0x50(%rsp),%rdx
   1bc19:	48 89 df             	mov    %rbx,%rdi
   1bc1c:	ff 15 36 fc 03 00    	call   *0x3fc36(%rip)        # 5b858 <_DYNAMIC+0x300>
   1bc22:	eb 86                	jmp    1bbaa <<hyperinterval::float::F64Enclosure>::affine+0x8a>
   1bc24:	cc                   	int3
   1bc25:	cc                   	int3
   1bc26:	cc                   	int3
   1bc27:	cc                   	int3
   1bc28:	cc                   	int3
   1bc29:	cc                   	int3
   1bc2a:	cc                   	int3
   1bc2b:	cc                   	int3
   1bc2c:	cc                   	int3
   1bc2d:	cc                   	int3
   1bc2e:	cc                   	int3
   1bc2f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::square:
   1bc30:	55                   	push   %rbp
   1bc31:	41 57                	push   %r15
   1bc33:	41 56                	push   %r14
   1bc35:	41 55                	push   %r13
   1bc37:	41 54                	push   %r12
   1bc39:	53                   	push   %rbx
   1bc3a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   1bc41:	48 89 fb             	mov    %rdi,%rbx
   1bc44:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1bc48:	0f 85 0a 01 00 00    	jne    1bd58 <<hyperinterval::float::F64Enclosure>::square+0x128>
   1bc4e:	4c 8b 66 10          	mov    0x10(%rsi),%r12
   1bc52:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1bc59:	00 00 80 
   1bc5c:	49 b8 00 00 00 00 00 	movabs $0x7ff0000000000000,%r8
   1bc63:	00 f0 7f 
   1bc66:	49 bf ff ff ff ff ff 	movabs $0xfffffffffffff,%r15
   1bc6d:	ff 0f 00 
   1bc70:	4c 8b 6e 08          	mov    0x8(%rsi),%r13
   1bc74:	4c 89 e9             	mov    %r13,%rcx
   1bc77:	48 c1 e9 34          	shr    $0x34,%rcx
   1bc7b:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1bc81:	4c 89 ea             	mov    %r13,%rdx
   1bc84:	4c 21 fa             	and    %r15,%rdx
   1bc87:	48 85 c9             	test   %rcx,%rcx
   1bc8a:	4a 8d 44 3a 01       	lea    0x1(%rdx,%r15,1),%rax
   1bc8f:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1bc96:	48 0f 44 c2          	cmove  %rdx,%rax
   1bc9a:	bd 9c f7 ff ff       	mov    $0xfffff79c,%ebp
   1bc9f:	0f 44 cd             	cmove  %ebp,%ecx
   1bca2:	48 f7 e0             	mul    %rax
   1bca5:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1bcaa:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1bcaf:	48 89 04 24          	mov    %rax,(%rsp)
   1bcb3:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1bcb7:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1bcbc:	48 89 e1             	mov    %rsp,%rcx
   1bcbf:	4c 89 f6             	mov    %r14,%rsi
   1bcc2:	4c 89 c2             	mov    %r8,%rdx
   1bcc5:	e8 c6 e7 ff ff       	call   1a490 <<hyperinterval::ieee::Format>::rounded>
   1bcca:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
   1bccf:	75 76                	jne    1bd47 <<hyperinterval::float::F64Enclosure>::square+0x117>
   1bcd1:	4c 89 e2             	mov    %r12,%rdx
   1bcd4:	4c 8b 64 24 30       	mov    0x30(%rsp),%r12
   1bcd9:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   1bcde:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1bce3:	48 89 d1             	mov    %rdx,%rcx
   1bce6:	48 c1 e9 34          	shr    $0x34,%rcx
   1bcea:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1bcf0:	48 89 54 24 68       	mov    %rdx,0x68(%rsp)
   1bcf5:	4c 21 fa             	and    %r15,%rdx
   1bcf8:	48 85 c9             	test   %rcx,%rcx
   1bcfb:	49 8d 44 17 01       	lea    0x1(%r15,%rdx,1),%rax
   1bd00:	48 0f 44 c2          	cmove  %rdx,%rax
   1bd04:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1bd0b:	0f 44 cd             	cmove  %ebp,%ecx
   1bd0e:	48 f7 e0             	mul    %rax
   1bd11:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1bd16:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1bd1b:	48 89 04 24          	mov    %rax,(%rsp)
   1bd1f:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1bd23:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1bd28:	48 89 e1             	mov    %rsp,%rcx
   1bd2b:	4c 89 f6             	mov    %r14,%rsi
   1bd2e:	48 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%rbp
   1bd35:	00 f0 7f 
   1bd38:	48 89 ea             	mov    %rbp,%rdx
   1bd3b:	e8 50 e7 ff ff       	call   1a490 <<hyperinterval::ieee::Format>::rounded>
   1bd40:	80 7c 24 28 01       	cmpb   $0x1,0x28(%rsp)
   1bd45:	75 2d                	jne    1bd74 <<hyperinterval::float::F64Enclosure>::square+0x144>
   1bd47:	0f b6 44 24 29       	movzbl 0x29(%rsp),%eax
   1bd4c:	88 43 08             	mov    %al,0x8(%rbx)
   1bd4f:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1bd56:	eb 07                	jmp    1bd5f <<hyperinterval::float::F64Enclosure>::square+0x12f>
   1bd58:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1bd5f:	48 89 d8             	mov    %rbx,%rax
   1bd62:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1bd69:	5b                   	pop    %rbx
   1bd6a:	41 5c                	pop    %r12
   1bd6c:	41 5d                	pop    %r13
   1bd6e:	41 5e                	pop    %r14
   1bd70:	41 5f                	pop    %r15
   1bd72:	5d                   	pop    %rbp
   1bd73:	c3                   	ret
   1bd74:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   1bd79:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1bd7e:	4c 8b 7c 24 38       	mov    0x38(%rsp),%r15
   1bd83:	48 89 e7             	mov    %rsp,%rdi
   1bd86:	4c 89 f6             	mov    %r14,%rsi
   1bd89:	48 89 ea             	mov    %rbp,%rdx
   1bd8c:	4c 89 e1             	mov    %r12,%rcx
   1bd8f:	e8 bc c0 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1bd94:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bd98:	74 23                	je     1bdbd <<hyperinterval::float::F64Enclosure>::square+0x18d>
   1bd9a:	4c 89 7c 24 78       	mov    %r15,0x78(%rsp)
   1bd9f:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1bda4:	48 89 e7             	mov    %rsp,%rdi
   1bda7:	4c 89 f6             	mov    %r14,%rsi
   1bdaa:	48 89 ea             	mov    %rbp,%rdx
   1bdad:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1bdb2:	e8 99 c0 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1bdb7:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bdbb:	75 07                	jne    1bdc4 <<hyperinterval::float::F64Enclosure>::square+0x194>
   1bdbd:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1bdc2:	eb 88                	jmp    1bd4c <<hyperinterval::float::F64Enclosure>::square+0x11c>
   1bdc4:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
   1bdc9:	4b 8d 04 37          	lea    (%r15,%r14,1),%rax
   1bdcd:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   1bdd1:	4c 89 f9             	mov    %r15,%rcx
   1bdd4:	48 21 d1             	and    %rdx,%rcx
   1bdd7:	4c 89 f7             	mov    %r14,%rdi
   1bdda:	48 29 cf             	sub    %rcx,%rdi
   1bddd:	4d 85 ff             	test   %r15,%r15
   1bde0:	48 0f 49 f8          	cmovns %rax,%rdi
   1bde4:	4a 8d 04 36          	lea    (%rsi,%r14,1),%rax
   1bde8:	48 89 f1             	mov    %rsi,%rcx
   1bdeb:	48 21 d1             	and    %rdx,%rcx
   1bdee:	4d 89 f4             	mov    %r14,%r12
   1bdf1:	49 29 cc             	sub    %rcx,%r12
   1bdf4:	48 85 f6             	test   %rsi,%rsi
   1bdf7:	4c 0f 49 e0          	cmovns %rax,%r12
   1bdfb:	b0 01                	mov    $0x1,%al
   1bdfd:	4c 39 e7             	cmp    %r12,%rdi
   1be00:	0f 87 46 ff ff ff    	ja     1bd4c <<hyperinterval::float::F64Enclosure>::square+0x11c>
   1be06:	48 89 7c 24 70       	mov    %rdi,0x70(%rsp)
   1be0b:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
   1be10:	48 89 e7             	mov    %rsp,%rdi
   1be13:	4c 89 f6             	mov    %r14,%rsi
   1be16:	48 89 ea             	mov    %rbp,%rdx
   1be19:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1be1e:	e8 2d c0 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1be23:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1be27:	74 23                	je     1be4c <<hyperinterval::float::F64Enclosure>::square+0x21c>
   1be29:	4c 89 7c 24 40       	mov    %r15,0x40(%rsp)
   1be2e:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1be33:	48 89 e7             	mov    %rsp,%rdi
   1be36:	4c 89 f6             	mov    %r14,%rsi
   1be39:	48 89 ea             	mov    %rbp,%rdx
   1be3c:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
   1be41:	e8 0a c0 ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1be46:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1be4a:	75 14                	jne    1be60 <<hyperinterval::float::F64Enclosure>::square+0x230>
   1be4c:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   1be51:	88 53 08             	mov    %dl,0x8(%rbx)
   1be54:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1be5b:	e9 ff fe ff ff       	jmp    1bd5f <<hyperinterval::float::F64Enclosure>::square+0x12f>
   1be60:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1be65:	4b 8d 14 37          	lea    (%r15,%r14,1),%rdx
   1be69:	4c 89 fe             	mov    %r15,%rsi
   1be6c:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   1be70:	48 21 fe             	and    %rdi,%rsi
   1be73:	4c 89 f1             	mov    %r14,%rcx
   1be76:	48 29 f1             	sub    %rsi,%rcx
   1be79:	4d 85 ff             	test   %r15,%r15
   1be7c:	48 0f 49 ca          	cmovns %rdx,%rcx
   1be80:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1be84:	48 89 c6             	mov    %rax,%rsi
   1be87:	48 21 fe             	and    %rdi,%rsi
   1be8a:	49 29 f6             	sub    %rsi,%r14
   1be8d:	48 85 c0             	test   %rax,%rax
   1be90:	4c 0f 49 f2          	cmovns %rdx,%r14
   1be94:	b2 01                	mov    $0x1,%dl
   1be96:	4c 39 f1             	cmp    %r14,%rcx
   1be99:	77 b6                	ja     1be51 <<hyperinterval::float::F64Enclosure>::square+0x221>
   1be9b:	48 39 4c 24 70       	cmp    %rcx,0x70(%rsp)
   1bea0:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1bea5:	49 0f 47 cf          	cmova  %r15,%rcx
   1bea9:	4d 39 f4             	cmp    %r14,%r12
   1beac:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
   1beb1:	48 0f 42 d0          	cmovb  %rax,%rdx
   1beb5:	48 c7 44 24 50 01 00 	movq   $0x1,0x50(%rsp)
   1bebc:	00 00 
   1bebe:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
   1bec3:	48 89 54 24 60       	mov    %rdx,0x60(%rsp)
   1bec8:	4d 85 ed             	test   %r13,%r13
   1becb:	7f 79                	jg     1bf46 <<hyperinterval::float::F64Enclosure>::square+0x316>
   1becd:	48 83 7c 24 68 00    	cmpq   $0x0,0x68(%rsp)
   1bed3:	79 07                	jns    1bedc <<hyperinterval::float::F64Enclosure>::square+0x2ac>
   1bed5:	48 21 7c 24 68       	and    %rdi,0x68(%rsp)
   1beda:	75 6a                	jne    1bf46 <<hyperinterval::float::F64Enclosure>::square+0x316>
   1bedc:	48 89 e7             	mov    %rsp,%rdi
   1bedf:	e8 bc 03 00 00       	call   1c2a0 <<hyperinterval::float::F64Enclosure>::from_bits>
   1bee4:	48 8b 0c 24          	mov    (%rsp),%rcx
   1bee8:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1beed:	48 83 f9 02          	cmp    $0x2,%rcx
   1bef1:	0f 84 55 fe ff ff    	je     1bd4c <<hyperinterval::float::F64Enclosure>::square+0x11c>
   1bef7:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   1befc:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1bf01:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
   1bf06:	48 89 54 24 31       	mov    %rdx,0x31(%rsp)
   1bf0b:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
   1bf10:	88 44 24 30          	mov    %al,0x30(%rsp)
   1bf14:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   1bf1b:	00 
   1bf1c:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   1bf21:	48 8d 54 24 28       	lea    0x28(%rsp),%rdx
   1bf26:	ff 15 cc f9 03 00    	call   *0x3f9cc(%rip)        # 5b8f8 <_DYNAMIC+0x3a0>
   1bf2c:	48 8b 84 24 90 00 00 	mov    0x90(%rsp),%rax
   1bf33:	00 
   1bf34:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1bf39:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
   1bf40:	00 
   1bf41:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
   1bf46:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
   1bf4b:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1bf4f:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   1bf54:	48 89 03             	mov    %rax,(%rbx)
   1bf57:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
   1bf5c:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1bf60:	e9 fa fd ff ff       	jmp    1bd5f <<hyperinterval::float::F64Enclosure>::square+0x12f>
   1bf65:	cc                   	int3
   1bf66:	cc                   	int3
   1bf67:	cc                   	int3
   1bf68:	cc                   	int3
   1bf69:	cc                   	int3
   1bf6a:	cc                   	int3
   1bf6b:	cc                   	int3
   1bf6c:	cc                   	int3
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
   1bf9e:	e8 ad be ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
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
   1bfd1:	e8 7a be ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
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
   1c0f6:	e8 55 bd ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
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
   1c11d:	e8 2e bd ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
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
   1c168:	e8 e3 bc ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1c16d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c171:	74 1c                	je     1c18f <<hyperinterval::float::F64Enclosure>::expanded+0xef>
   1c173:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1c178:	48 89 e7             	mov    %rsp,%rdi
   1c17b:	4c 89 f6             	mov    %r14,%rsi
   1c17e:	4c 89 fa             	mov    %r15,%rdx
   1c181:	4c 89 e1             	mov    %r12,%rcx
   1c184:	e8 c7 bc ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
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
   1c2a4:	41 54                	push   %r12
   1c2a6:	53                   	push   %rbx
   1c2a7:	48 83 ec 18          	sub    $0x18,%rsp
   1c2ab:	48 89 fb             	mov    %rdi,%rbx
   1c2ae:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1c2b5:	00 00 80 
   1c2b8:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1c2bf:	00 f0 7f 
   1c2c2:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1c2c7:	4c 89 f6             	mov    %r14,%rsi
   1c2ca:	4c 89 fa             	mov    %r15,%rdx
   1c2cd:	31 c9                	xor    %ecx,%ecx
   1c2cf:	e8 7c bb ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1c2d4:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1c2d9:	74 1e                	je     1c2f9 <<hyperinterval::float::F64Enclosure>::from_bits+0x59>
   1c2db:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1c2e0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1c2e5:	4c 89 f6             	mov    %r14,%rsi
   1c2e8:	4c 89 fa             	mov    %r15,%rdx
   1c2eb:	31 c9                	xor    %ecx,%ecx
   1c2ed:	e8 5e bb ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1c2f2:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1c2f7:	75 1b                	jne    1c314 <<hyperinterval::float::F64Enclosure>::from_bits+0x74>
   1c2f9:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1c2fe:	88 43 08             	mov    %al,0x8(%rbx)
   1c301:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c308:	48 83 c4 18          	add    $0x18,%rsp
   1c30c:	5b                   	pop    %rbx
   1c30d:	41 5c                	pop    %r12
   1c30f:	41 5e                	pop    %r14
   1c311:	41 5f                	pop    %r15
   1c313:	c3                   	ret
   1c314:	4b 8d 04 34          	lea    (%r12,%r14,1),%rax
   1c318:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1c31c:	4c 89 e2             	mov    %r12,%rdx
   1c31f:	48 21 ca             	and    %rcx,%rdx
   1c322:	4c 89 f6             	mov    %r14,%rsi
   1c325:	48 29 d6             	sub    %rdx,%rsi
   1c328:	4d 85 e4             	test   %r12,%r12
   1c32b:	48 0f 49 f0          	cmovns %rax,%rsi
   1c32f:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1c334:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1c338:	48 21 c1             	and    %rax,%rcx
   1c33b:	49 29 ce             	sub    %rcx,%r14
   1c33e:	48 85 c0             	test   %rax,%rax
   1c341:	4c 0f 49 f2          	cmovns %rdx,%r14
   1c345:	4c 39 f6             	cmp    %r14,%rsi
   1c348:	76 06                	jbe    1c350 <<hyperinterval::float::F64Enclosure>::from_bits+0xb0>
   1c34a:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1c34e:	eb b1                	jmp    1c301 <<hyperinterval::float::F64Enclosure>::from_bits+0x61>
   1c350:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1c357:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   1c35b:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1c35f:	eb a7                	jmp    1c308 <<hyperinterval::float::F64Enclosure>::from_bits+0x68>
   1c361:	cc                   	int3
   1c362:	cc                   	int3
   1c363:	cc                   	int3
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

<hyperinterval::float::F64Enclosure>::next_down:
   1c370:	41 57                	push   %r15
   1c372:	41 56                	push   %r14
   1c374:	53                   	push   %rbx
   1c375:	48 83 ec 10          	sub    $0x10,%rsp
   1c379:	48 89 fb             	mov    %rdi,%rbx
   1c37c:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1c383:	00 00 80 
   1c386:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1c38d:	00 f0 7f 
   1c390:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1c395:	48 89 e7             	mov    %rsp,%rdi
   1c398:	4c 89 f6             	mov    %r14,%rsi
   1c39b:	4c 89 fa             	mov    %r15,%rdx
   1c39e:	e8 ad ba ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1c3a3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c3a7:	75 0c                	jne    1c3b5 <<hyperinterval::float::F64Enclosure>::next_down+0x45>
   1c3a9:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1c3ae:	88 43 01             	mov    %al,0x1(%rbx)
   1c3b1:	b0 01                	mov    $0x1,%al
   1c3b3:	eb 51                	jmp    1c406 <<hyperinterval::float::F64Enclosure>::next_down+0x96>
   1c3b5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c3ba:	48 89 c2             	mov    %rax,%rdx
   1c3bd:	4c 31 f2             	xor    %r14,%rdx
   1c3c0:	48 85 c0             	test   %rax,%rax
   1c3c3:	48 0f 44 d0          	cmove  %rax,%rdx
   1c3c7:	48 89 d1             	mov    %rdx,%rcx
   1c3ca:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1c3ce:	48 83 c9 01          	or     $0x1,%rcx
   1c3d2:	48 01 d1             	add    %rdx,%rcx
   1c3d5:	48 89 e7             	mov    %rsp,%rdi
   1c3d8:	4c 89 f6             	mov    %r14,%rsi
   1c3db:	4c 89 fa             	mov    %r15,%rdx
   1c3de:	e8 6d ba ff ff       	call   17e50 <<hyperinterval::ieee::Format>::finite>
   1c3e3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c3e7:	75 08                	jne    1c3f1 <<hyperinterval::float::F64Enclosure>::next_down+0x81>
   1c3e9:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
   1c3ed:	b0 01                	mov    $0x1,%al
   1c3ef:	eb 15                	jmp    1c406 <<hyperinterval::float::F64Enclosure>::next_down+0x96>
   1c3f1:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c3f6:	49 31 c6             	xor    %rax,%r14
   1c3f9:	48 85 c0             	test   %rax,%rax
   1c3fc:	4c 0f 44 f0          	cmove  %rax,%r14
   1c400:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1c404:	31 c0                	xor    %eax,%eax
   1c406:	88 03                	mov    %al,(%rbx)
   1c408:	48 89 d8             	mov    %rbx,%rax
   1c40b:	48 83 c4 10          	add    $0x10,%rsp
   1c40f:	5b                   	pop    %rbx
   1c410:	41 5e                	pop    %r14
   1c412:	41 5f                	pop    %r15
   1c414:	c3                   	ret
   1c415:	cc                   	int3
   1c416:	cc                   	int3
   1c417:	cc                   	int3
   1c418:	cc                   	int3
   1c419:	cc                   	int3
   1c41a:	cc                   	int3
   1c41b:	cc                   	int3
   1c41c:	cc                   	int3
   1c41d:	cc                   	int3
   1c41e:	cc                   	int3
   1c41f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::subset_of:
   1c420:	b0 01                	mov    $0x1,%al
   1c422:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1c426:	75 50                	jne    1c478 <<hyperinterval::float::F64Enclosure>::subset_of+0x58>
   1c428:	f6 06 01             	testb  $0x1,(%rsi)
   1c42b:	74 49                	je     1c476 <<hyperinterval::float::F64Enclosure>::subset_of+0x56>
   1c42d:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1c431:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1c435:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1c43c:	00 00 80 
   1c43f:	4d 8d 0c 00          	lea    (%r8,%rax,1),%r9
   1c443:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1c447:	4d 89 c2             	mov    %r8,%r10
   1c44a:	49 21 ca             	and    %rcx,%r10
   1c44d:	49 89 c3             	mov    %rax,%r11
   1c450:	4d 29 d3             	sub    %r10,%r11
   1c453:	4d 85 c0             	test   %r8,%r8
   1c456:	4d 0f 49 d9          	cmovns %r9,%r11
   1c45a:	4c 8d 04 02          	lea    (%rdx,%rax,1),%r8
   1c45e:	49 89 d1             	mov    %rdx,%r9
   1c461:	49 21 c9             	and    %rcx,%r9
   1c464:	49 89 c2             	mov    %rax,%r10
   1c467:	4d 29 ca             	sub    %r9,%r10
   1c46a:	48 85 d2             	test   %rdx,%rdx
   1c46d:	4d 0f 49 d0          	cmovns %r8,%r10
   1c471:	4d 39 d3             	cmp    %r10,%r11
   1c474:	76 03                	jbe    1c479 <<hyperinterval::float::F64Enclosure>::subset_of+0x59>
   1c476:	31 c0                	xor    %eax,%eax
   1c478:	c3                   	ret
   1c479:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1c47d:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1c481:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1c485:	49 89 d0             	mov    %rdx,%r8
   1c488:	49 21 c8             	and    %rcx,%r8
   1c48b:	49 89 c1             	mov    %rax,%r9
   1c48e:	4d 29 c1             	sub    %r8,%r9
   1c491:	48 85 d2             	test   %rdx,%rdx
   1c494:	4c 0f 49 cf          	cmovns %rdi,%r9
   1c498:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1c49c:	48 21 f1             	and    %rsi,%rcx
   1c49f:	48 29 c8             	sub    %rcx,%rax
   1c4a2:	48 85 f6             	test   %rsi,%rsi
   1c4a5:	48 0f 49 c2          	cmovns %rdx,%rax
   1c4a9:	49 39 c1             	cmp    %rax,%r9
   1c4ac:	0f 96 c0             	setbe  %al
   1c4af:	c3                   	ret

__udivti3:
   58430:	49 89 d0             	mov    %rdx,%r8
   58433:	48 85 c9             	test   %rcx,%rcx
   58436:	74 76                	je     584ae <__udivti3+0x7e>
   58438:	53                   	push   %rbx
   58439:	4c 0f bd c9          	bsr    %rcx,%r9
   5843d:	44 89 ca             	mov    %r9d,%edx
   58440:	83 f2 3f             	xor    $0x3f,%edx
   58443:	b0 40                	mov    $0x40,%al
   58445:	28 d0                	sub    %dl,%al
   58447:	4c 89 c2             	mov    %r8,%rdx
   5844a:	49 89 cb             	mov    %rcx,%r11
   5844d:	89 c1                	mov    %eax,%ecx
   5844f:	4c 0f ad da          	shrd   %cl,%r11,%rdx
   58453:	4d 89 da             	mov    %r11,%r10
   58456:	49 d3 ea             	shr    %cl,%r10
   58459:	a8 40                	test   $0x40,%al
   5845b:	4c 0f 44 d2          	cmove  %rdx,%r10
   5845f:	48 89 f8             	mov    %rdi,%rax
   58462:	48 0f ac f0 01       	shrd   $0x1,%rsi,%rax
   58467:	48 89 f2             	mov    %rsi,%rdx
   5846a:	48 d1 ea             	shr    $1,%rdx
   5846d:	49 f7 f2             	div    %r10
   58470:	49 89 c2             	mov    %rax,%r10
   58473:	44 89 c9             	mov    %r9d,%ecx
   58476:	49 d3 ea             	shr    %cl,%r10
   58479:	31 c9                	xor    %ecx,%ecx
   5847b:	49 83 ea 01          	sub    $0x1,%r10
   5847f:	4c 0f 42 d1          	cmovb  %rcx,%r10
   58483:	4c 89 db             	mov    %r11,%rbx
   58486:	4c 89 c0             	mov    %r8,%rax
   58489:	49 f7 e2             	mul    %r10
   5848c:	49 89 c1             	mov    %rax,%r9
   5848f:	4c 89 d0             	mov    %r10,%rax
   58492:	49 0f af da          	imul   %r10,%rbx
   58496:	48 01 da             	add    %rbx,%rdx
   58499:	4c 29 cf             	sub    %r9,%rdi
   5849c:	48 19 d6             	sbb    %rdx,%rsi
   5849f:	4c 39 c7             	cmp    %r8,%rdi
   584a2:	4c 19 de             	sbb    %r11,%rsi
   584a5:	48 83 d8 ff          	sbb    $0xffffffffffffffff,%rax
   584a9:	5b                   	pop    %rbx
   584aa:	48 89 ca             	mov    %rcx,%rdx
   584ad:	c3                   	ret
   584ae:	4c 39 c6             	cmp    %r8,%rsi
   584b1:	73 0f                	jae    584c2 <__udivti3+0x92>
   584b3:	48 89 f8             	mov    %rdi,%rax
   584b6:	48 89 f2             	mov    %rsi,%rdx
   584b9:	49 f7 f0             	div    %r8
   584bc:	31 c9                	xor    %ecx,%ecx
   584be:	48 89 ca             	mov    %rcx,%rdx
   584c1:	c3                   	ret
   584c2:	48 89 f0             	mov    %rsi,%rax
   584c5:	4c 09 c0             	or     %r8,%rax
   584c8:	48 c1 e8 20          	shr    $0x20,%rax
   584cc:	74 15                	je     584e3 <__udivti3+0xb3>
   584ce:	48 89 f0             	mov    %rsi,%rax
   584d1:	31 d2                	xor    %edx,%edx
   584d3:	49 f7 f0             	div    %r8
   584d6:	48 89 c1             	mov    %rax,%rcx
   584d9:	48 89 f8             	mov    %rdi,%rax
   584dc:	49 f7 f0             	div    %r8
   584df:	48 89 ca             	mov    %rcx,%rdx
   584e2:	c3                   	ret
   584e3:	89 f0                	mov    %esi,%eax
   584e5:	31 d2                	xor    %edx,%edx
   584e7:	41 f7 f0             	div    %r8d
   584ea:	89 c1                	mov    %eax,%ecx
   584ec:	48 89 f8             	mov    %rdi,%rax
   584ef:	49 f7 f0             	div    %r8
   584f2:	48 89 ca             	mov    %rcx,%rdx
   584f5:	c3                   	ret

Disassembly of section .init:
