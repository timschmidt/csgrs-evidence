hyperinterval_strict_chain32:
   17100:	53                   	push   %rbx
   17101:	48 83 ec 60          	sub    $0x60,%rsp
   17105:	48 89 fb             	mov    %rdi,%rbx
   17108:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   1710d:	ff 15 65 3d 04 00    	call   *0x43d65(%rip)        # 5ae78 <_DYNAMIC+0x2b0>
   17113:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   17117:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   1711c:	83 f9 02             	cmp    $0x2,%ecx
   1711f:	0f 84 f4 00 00 00    	je     17219 <hyperinterval_strict_chain32+0x119>
   17125:	8b 54 24 11          	mov    0x11(%rsp),%edx
   17129:	8b 74 24 14          	mov    0x14(%rsp),%esi
   1712d:	89 74 24 5c          	mov    %esi,0x5c(%rsp)
   17131:	89 54 24 59          	mov    %edx,0x59(%rsp)
   17135:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
   17139:	88 44 24 58          	mov    %al,0x58(%rsp)
   1713d:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   17142:	48 8d 74 24 54       	lea    0x54(%rsp),%rsi
   17147:	f3 0f 10 05 c9 e9 fe 	movss  -0x11637(%rip),%xmm0        # 5b18 <__abi_tag+0x581c>
   1714e:	ff 
   1714f:	f3 0f 10 0d b9 e9 fe 	movss  -0x11647(%rip),%xmm1        # 5b10 <__abi_tag+0x5814>
   17156:	ff 
   17157:	ff 15 23 3d 04 00    	call   *0x43d23(%rip)        # 5ae80 <_DYNAMIC+0x2b8>
   1715d:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
   17161:	0f b6 44 24 1c       	movzbl 0x1c(%rsp),%eax
   17166:	83 f9 02             	cmp    $0x2,%ecx
   17169:	0f 84 aa 00 00 00    	je     17219 <hyperinterval_strict_chain32+0x119>
   1716f:	8b 54 24 1d          	mov    0x1d(%rsp),%edx
   17173:	8b 74 24 20          	mov    0x20(%rsp),%esi
   17177:	89 74 24 50          	mov    %esi,0x50(%rsp)
   1717b:	89 54 24 4d          	mov    %edx,0x4d(%rsp)
   1717f:	89 4c 24 48          	mov    %ecx,0x48(%rsp)
   17183:	88 44 24 4c          	mov    %al,0x4c(%rsp)
   17187:	48 8d 7c 24 3c       	lea    0x3c(%rsp),%rdi
   1718c:	48 8d 74 24 48       	lea    0x48(%rsp),%rsi
   17191:	ff 15 f1 3c 04 00    	call   *0x43cf1(%rip)        # 5ae88 <_DYNAMIC+0x2c0>
   17197:	8b 4c 24 3c          	mov    0x3c(%rsp),%ecx
   1719b:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   171a0:	83 f9 02             	cmp    $0x2,%ecx
   171a3:	74 74                	je     17219 <hyperinterval_strict_chain32+0x119>
   171a5:	8b 54 24 41          	mov    0x41(%rsp),%edx
   171a9:	8b 74 24 44          	mov    0x44(%rsp),%esi
   171ad:	89 74 24 38          	mov    %esi,0x38(%rsp)
   171b1:	89 54 24 35          	mov    %edx,0x35(%rsp)
   171b5:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   171b9:	88 44 24 34          	mov    %al,0x34(%rsp)
   171bd:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   171c2:	f3 0f 10 05 1a e9 fe 	movss  -0x116e6(%rip),%xmm0        # 5ae4 <__abi_tag+0x57e8>
   171c9:	ff 
   171ca:	ff 15 c0 3c 04 00    	call   *0x43cc0(%rip)        # 5ae90 <_DYNAMIC+0x2c8>
   171d0:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   171d4:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   171d9:	83 f9 02             	cmp    $0x2,%ecx
   171dc:	74 3b                	je     17219 <hyperinterval_strict_chain32+0x119>
   171de:	8b 54 24 11          	mov    0x11(%rsp),%edx
   171e2:	8b 74 24 14          	mov    0x14(%rsp),%esi
   171e6:	89 74 24 20          	mov    %esi,0x20(%rsp)
   171ea:	89 54 24 1d          	mov    %edx,0x1d(%rsp)
   171ee:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
   171f2:	88 44 24 1c          	mov    %al,0x1c(%rsp)
   171f6:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
   171fb:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   17200:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
   17205:	ff 15 8d 3c 04 00    	call   *0x43c8d(%rip)        # 5ae98 <_DYNAMIC+0x2d0>
   1720b:	8b 4c 24 24          	mov    0x24(%rsp),%ecx
   1720f:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   17214:	83 f9 02             	cmp    $0x2,%ecx
   17217:	75 12                	jne    1722b <hyperinterval_strict_chain32+0x12b>
   17219:	88 43 04             	mov    %al,0x4(%rbx)
   1721c:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17222:	48 89 d8             	mov    %rbx,%rax
   17225:	48 83 c4 60          	add    $0x60,%rsp
   17229:	5b                   	pop    %rbx
   1722a:	c3                   	ret
   1722b:	8b 54 24 29          	mov    0x29(%rsp),%edx
   1722f:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
   17233:	89 74 24 14          	mov    %esi,0x14(%rsp)
   17237:	89 54 24 11          	mov    %edx,0x11(%rsp)
   1723b:	89 4c 24 0c          	mov    %ecx,0xc(%rsp)
   1723f:	88 44 24 10          	mov    %al,0x10(%rsp)
   17243:	48 8d 74 24 0c       	lea    0xc(%rsp),%rsi
   17248:	48 89 df             	mov    %rbx,%rdi
   1724b:	ff 15 4f 3c 04 00    	call   *0x43c4f(%rip)        # 5aea0 <_DYNAMIC+0x2d8>
   17251:	48 89 d8             	mov    %rbx,%rax
   17254:	48 83 c4 60          	add    $0x60,%rsp
   17258:	5b                   	pop    %rbx
   17259:	c3                   	ret
   1725a:	cc                   	int3
   1725b:	cc                   	int3
   1725c:	cc                   	int3
   1725d:	cc                   	int3
   1725e:	cc                   	int3
   1725f:	cc                   	int3

hyperinterval_strict_chain64:
   17260:	53                   	push   %rbx
   17261:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
   17268:	48 89 fb             	mov    %rdi,%rbx
   1726b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17270:	ff 15 32 3c 04 00    	call   *0x43c32(%rip)        # 5aea8 <_DYNAMIC+0x2e0>
   17276:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1727b:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   17280:	48 83 f9 02          	cmp    $0x2,%rcx
   17284:	0f 84 32 01 00 00    	je     173bc <hyperinterval_strict_chain64+0x15c>
   1728a:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   1728f:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   17294:	48 89 b4 24 a8 00 00 	mov    %rsi,0xa8(%rsp)
   1729b:	00 
   1729c:	48 89 94 24 a1 00 00 	mov    %rdx,0xa1(%rsp)
   172a3:	00 
   172a4:	48 89 8c 24 98 00 00 	mov    %rcx,0x98(%rsp)
   172ab:	00 
   172ac:	88 84 24 a0 00 00 00 	mov    %al,0xa0(%rsp)
   172b3:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   172b8:	48 8d b4 24 98 00 00 	lea    0x98(%rsp),%rsi
   172bf:	00 
   172c0:	f2 0f 10 05 d8 e7 fe 	movsd  -0x11828(%rip),%xmm0        # 5aa0 <__abi_tag+0x57a4>
   172c7:	ff 
   172c8:	f2 0f 10 0d e0 e7 fe 	movsd  -0x11820(%rip),%xmm1        # 5ab0 <__abi_tag+0x57b4>
   172cf:	ff 
   172d0:	ff 15 da 3b 04 00    	call   *0x43bda(%rip)        # 5aeb0 <_DYNAMIC+0x2e8>
   172d6:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   172db:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   172e0:	48 83 f9 02          	cmp    $0x2,%rcx
   172e4:	0f 84 d2 00 00 00    	je     173bc <hyperinterval_strict_chain64+0x15c>
   172ea:	48 8b 54 24 29       	mov    0x29(%rsp),%rdx
   172ef:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   172f4:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
   172fb:	00 
   172fc:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
   17303:	00 
   17304:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
   1730b:	00 
   1730c:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
   17313:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
   17318:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   1731f:	00 
   17320:	ff 15 92 3b 04 00    	call   *0x43b92(%rip)        # 5aeb8 <_DYNAMIC+0x2f0>
   17326:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
   1732b:	0f b6 44 24 70       	movzbl 0x70(%rsp),%eax
   17330:	48 83 f9 02          	cmp    $0x2,%rcx
   17334:	0f 84 82 00 00 00    	je     173bc <hyperinterval_strict_chain64+0x15c>
   1733a:	48 8b 54 24 71       	mov    0x71(%rsp),%rdx
   1733f:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
   17344:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   17349:	48 89 54 24 59       	mov    %rdx,0x59(%rsp)
   1734e:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
   17353:	88 44 24 58          	mov    %al,0x58(%rsp)
   17357:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1735c:	f2 0f 10 05 2c e7 fe 	movsd  -0x118d4(%rip),%xmm0        # 5a90 <__abi_tag+0x5794>
   17363:	ff 
   17364:	ff 15 56 3b 04 00    	call   *0x43b56(%rip)        # 5aec0 <_DYNAMIC+0x2f8>
   1736a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1736f:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   17374:	48 83 f9 02          	cmp    $0x2,%rcx
   17378:	74 42                	je     173bc <hyperinterval_strict_chain64+0x15c>
   1737a:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   1737f:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   17384:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   17389:	48 89 54 24 29       	mov    %rdx,0x29(%rsp)
   1738e:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   17393:	88 44 24 28          	mov    %al,0x28(%rsp)
   17397:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1739c:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   173a1:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
   173a6:	ff 15 1c 3b 04 00    	call   *0x43b1c(%rip)        # 5aec8 <_DYNAMIC+0x300>
   173ac:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   173b1:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   173b6:	48 83 f9 02          	cmp    $0x2,%rcx
   173ba:	75 16                	jne    173d2 <hyperinterval_strict_chain64+0x172>
   173bc:	88 43 08             	mov    %al,0x8(%rbx)
   173bf:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   173c6:	48 89 d8             	mov    %rbx,%rax
   173c9:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   173d0:	5b                   	pop    %rbx
   173d1:	c3                   	ret
   173d2:	48 8b 54 24 41       	mov    0x41(%rsp),%rdx
   173d7:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
   173dc:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
   173e1:	48 89 54 24 11       	mov    %rdx,0x11(%rsp)
   173e6:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   173eb:	88 44 24 10          	mov    %al,0x10(%rsp)
   173ef:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
   173f4:	48 89 df             	mov    %rbx,%rdi
   173f7:	ff 15 d3 3a 04 00    	call   *0x43ad3(%rip)        # 5aed0 <_DYNAMIC+0x308>
   173fd:	48 89 d8             	mov    %rbx,%rax
   17400:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   17407:	5b                   	pop    %rbx
   17408:	c3                   	ret
   17409:	cc                   	int3
   1740a:	cc                   	int3
   1740b:	cc                   	int3
   1740c:	cc                   	int3
   1740d:	cc                   	int3
   1740e:	cc                   	int3
   1740f:	cc                   	int3

hyperinterval_strict_surface32:
   17410:	55                   	push   %rbp
   17411:	41 57                	push   %r15
   17413:	41 56                	push   %r14
   17415:	41 55                	push   %r13
   17417:	41 54                	push   %r12
   17419:	53                   	push   %rbx
   1741a:	48 83 ec 78          	sub    $0x78,%rsp
   1741e:	89 f5                	mov    %esi,%ebp
   17420:	48 89 fb             	mov    %rdi,%rbx
   17423:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17428:	66 0f 7e 44 24 38    	movd   %xmm0,0x38(%rsp)
   1742e:	66 0f 7e 4c 24 1c    	movd   %xmm1,0x1c(%rsp)
   17434:	ff 15 3e 3a 04 00    	call   *0x43a3e(%rip)        # 5ae78 <_DYNAMIC+0x2b0>
   1743a:	44 8b 74 24 08       	mov    0x8(%rsp),%r14d
   1743f:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   17444:	41 83 fe 02          	cmp    $0x2,%r14d
   17448:	75 05                	jne    1744f <hyperinterval_strict_surface32+0x3f>
   1744a:	88 43 04             	mov    %al,0x4(%rbx)
   1744d:	eb 76                	jmp    174c5 <hyperinterval_strict_surface32+0xb5>
   1744f:	8b 4c 24 0d          	mov    0xd(%rsp),%ecx
   17453:	8b 54 24 10          	mov    0x10(%rsp),%edx
   17457:	89 54 24 44          	mov    %edx,0x44(%rsp)
   1745b:	89 4c 24 41          	mov    %ecx,0x41(%rsp)
   1745f:	44 89 74 24 3c       	mov    %r14d,0x3c(%rsp)
   17464:	88 44 24 40          	mov    %al,0x40(%rsp)
   17468:	66 0f 6e 44 24 38    	movd   0x38(%rsp),%xmm0
   1746e:	ff 15 64 3a 04 00    	call   *0x43a64(%rip)        # 5aed8 <_DYNAMIC+0x310>
   17474:	a8 01                	test   $0x1,%al
   17476:	74 05                	je     1747d <hyperinterval_strict_surface32+0x6d>
   17478:	88 63 04             	mov    %ah,0x4(%rbx)
   1747b:	eb 48                	jmp    174c5 <hyperinterval_strict_surface32+0xb5>
   1747d:	66 0f 6e 44 24 1c    	movd   0x1c(%rsp),%xmm0
   17483:	66 0f 7e c1          	movd   %xmm0,%ecx
   17487:	89 ca                	mov    %ecx,%edx
   17489:	f7 d2                	not    %edx
   1748b:	f7 c2 00 00 80 7f    	test   $0x7f800000,%edx
   17491:	75 04                	jne    17497 <hyperinterval_strict_surface32+0x87>
   17493:	31 d2                	xor    %edx,%edx
   17495:	eb 2b                	jmp    174c2 <hyperinterval_strict_surface32+0xb2>
   17497:	89 ca                	mov    %ecx,%edx
   17499:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1749f:	48 0f 45 d1          	cmovne %rcx,%rdx
   174a3:	31 c9                	xor    %ecx,%ecx
   174a5:	48 81 fa ff ff ff 7f 	cmp    $0x7fffffff,%rdx
   174ac:	0f 96 c1             	setbe  %cl
   174af:	48 8d 4c 4a ff       	lea    -0x1(%rdx,%rcx,2),%rcx
   174b4:	89 ce                	mov    %ecx,%esi
   174b6:	f7 d6                	not    %esi
   174b8:	b2 03                	mov    $0x3,%dl
   174ba:	f7 c6 00 00 80 7f    	test   $0x7f800000,%esi
   174c0:	75 1b                	jne    174dd <hyperinterval_strict_surface32+0xcd>
   174c2:	88 53 04             	mov    %dl,0x4(%rbx)
   174c5:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   174cb:	48 89 d8             	mov    %rbx,%rax
   174ce:	48 83 c4 78          	add    $0x78,%rsp
   174d2:	5b                   	pop    %rbx
   174d3:	41 5c                	pop    %r12
   174d5:	41 5d                	pop    %r13
   174d7:	41 5e                	pop    %r14
   174d9:	41 5f                	pop    %r15
   174db:	5d                   	pop    %rbp
   174dc:	c3                   	ret
   174dd:	48 c1 e8 20          	shr    $0x20,%rax
   174e1:	66 0f 6e c0          	movd   %eax,%xmm0
   174e5:	66 0f ef c9          	pxor   %xmm1,%xmm1
   174e9:	f7 c1 ff ff ff 7f    	test   $0x7fffffff,%ecx
   174ef:	74 04                	je     174f5 <hyperinterval_strict_surface32+0xe5>
   174f1:	66 0f 6e c9          	movd   %ecx,%xmm1
   174f5:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   174fa:	ff 15 78 39 04 00    	call   *0x43978(%rip)        # 5ae78 <_DYNAMIC+0x2b0>
   17500:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17504:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   17509:	83 f9 02             	cmp    $0x2,%ecx
   1750c:	0f 84 38 ff ff ff    	je     1744a <hyperinterval_strict_surface32+0x3a>
   17512:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   17516:	8b 74 24 10          	mov    0x10(%rsp),%esi
   1751a:	89 74 24 5c          	mov    %esi,0x5c(%rsp)
   1751e:	89 54 24 59          	mov    %edx,0x59(%rsp)
   17522:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
   17526:	88 44 24 58          	mov    %al,0x58(%rsp)
   1752a:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1752f:	48 8d 74 24 3c       	lea    0x3c(%rsp),%rsi
   17534:	89 ea                	mov    %ebp,%edx
   17536:	ff 15 a4 39 04 00    	call   *0x439a4(%rip)        # 5aee0 <_DYNAMIC+0x318>
   1753c:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17540:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   17545:	83 f9 02             	cmp    $0x2,%ecx
   17548:	0f 84 fc fe ff ff    	je     1744a <hyperinterval_strict_surface32+0x3a>
   1754e:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   17552:	8b 74 24 10          	mov    0x10(%rsp),%esi
   17556:	89 74 24 34          	mov    %esi,0x34(%rsp)
   1755a:	89 54 24 31          	mov    %edx,0x31(%rsp)
   1755e:	89 4c 24 2c          	mov    %ecx,0x2c(%rsp)
   17562:	88 44 24 30          	mov    %al,0x30(%rsp)
   17566:	48 8d 7c 24 48       	lea    0x48(%rsp),%rdi
   1756b:	48 8d 74 24 2c       	lea    0x2c(%rsp),%rsi
   17570:	ff 15 72 39 04 00    	call   *0x43972(%rip)        # 5aee8 <_DYNAMIC+0x320>
   17576:	8b 4c 24 48          	mov    0x48(%rsp),%ecx
   1757a:	0f b6 44 24 4c       	movzbl 0x4c(%rsp),%eax
   1757f:	83 f9 02             	cmp    $0x2,%ecx
   17582:	0f 84 c2 fe ff ff    	je     1744a <hyperinterval_strict_surface32+0x3a>
   17588:	8b 54 24 4d          	mov    0x4d(%rsp),%edx
   1758c:	8b 74 24 50          	mov    0x50(%rsp),%esi
   17590:	89 74 24 28          	mov    %esi,0x28(%rsp)
   17594:	89 54 24 25          	mov    %edx,0x25(%rsp)
   17598:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   1759c:	88 44 24 24          	mov    %al,0x24(%rsp)
   175a0:	4c 8d 64 24 6c       	lea    0x6c(%rsp),%r12
   175a5:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
   175aa:	48 8d 54 24 54       	lea    0x54(%rsp),%rdx
   175af:	4c 89 e7             	mov    %r12,%rdi
   175b2:	ff 15 38 39 04 00    	call   *0x43938(%rip)        # 5aef0 <_DYNAMIC+0x328>
   175b8:	4c 8d 7c 24 60       	lea    0x60(%rsp),%r15
   175bd:	48 8d 54 24 3c       	lea    0x3c(%rsp),%rdx
   175c2:	4c 89 ff             	mov    %r15,%rdi
   175c5:	4c 89 e6             	mov    %r12,%rsi
   175c8:	ff 15 2a 39 04 00    	call   *0x4392a(%rip)        # 5aef8 <_DYNAMIC+0x330>
   175ce:	4c 89 ff             	mov    %r15,%rdi
   175d1:	ff 15 29 39 04 00    	call   *0x43929(%rip)        # 5af00 <_DYNAMIC+0x338>
   175d7:	8b 4c 24 60          	mov    0x60(%rsp),%ecx
   175db:	83 f9 01             	cmp    $0x1,%ecx
   175de:	75 1c                	jne    175fc <hyperinterval_strict_surface32+0x1ec>
   175e0:	8b 74 24 64          	mov    0x64(%rsp),%esi
   175e4:	8b 7c 24 68          	mov    0x68(%rsp),%edi
   175e8:	39 fe                	cmp    %edi,%esi
   175ea:	0f 94 c2             	sete   %dl
   175ed:	66 0f 6e ce          	movd   %esi,%xmm1
   175f1:	66 0f 6e c7          	movd   %edi,%xmm0
   175f5:	be 01 00 00 00       	mov    $0x1,%esi
   175fa:	eb 04                	jmp    17600 <hyperinterval_strict_surface32+0x1f0>
   175fc:	31 d2                	xor    %edx,%edx
   175fe:	31 f6                	xor    %esi,%esi
   17600:	80 f1 01             	xor    $0x1,%cl
   17603:	89 74 24 08          	mov    %esi,0x8(%rsp)
   17607:	66 0f 7e 4c 24 0c    	movd   %xmm1,0xc(%rsp)
   1760d:	88 4c 24 10          	mov    %cl,0x10(%rsp)
   17611:	88 54 24 11          	mov    %dl,0x11(%rsp)
   17615:	88 44 24 12          	mov    %al,0x12(%rsp)
   17619:	89 74 24 14          	mov    %esi,0x14(%rsp)
   1761d:	66 0f 7e 44 24 18    	movd   %xmm0,0x18(%rsp)
   17623:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   17628:	4c 8d 6c 24 60       	lea    0x60(%rsp),%r13
   1762d:	4c 8d 7c 24 54       	lea    0x54(%rsp),%r15
   17632:	4c 89 ef             	mov    %r13,%rdi
   17635:	4c 89 fe             	mov    %r15,%rsi
   17638:	ff 15 ca 38 04 00    	call   *0x438ca(%rip)        # 5af08 <_DYNAMIC+0x340>
   1763e:	88 44 24 1c          	mov    %al,0x1c(%rsp)
   17642:	4c 89 ef             	mov    %r13,%rdi
   17645:	4c 89 fe             	mov    %r15,%rsi
   17648:	ff 15 c2 38 04 00    	call   *0x438c2(%rip)        # 5af10 <_DYNAMIC+0x348>
   1764e:	89 c5                	mov    %eax,%ebp
   17650:	4c 8d 64 24 3c       	lea    0x3c(%rsp),%r12
   17655:	4c 89 ef             	mov    %r13,%rdi
   17658:	4c 89 e6             	mov    %r12,%rsi
   1765b:	ff 15 b7 38 04 00    	call   *0x438b7(%rip)        # 5af18 <_DYNAMIC+0x350>
   17661:	41 89 c7             	mov    %eax,%r15d
   17664:	4c 89 ef             	mov    %r13,%rdi
   17667:	4c 89 e6             	mov    %r12,%rsi
   1766a:	ff 15 b0 38 04 00    	call   *0x438b0(%rip)        # 5af20 <_DYNAMIC+0x358>
   17670:	41 89 c4             	mov    %eax,%r12d
   17673:	4c 89 ef             	mov    %r13,%rdi
   17676:	66 0f 6e 44 24 38    	movd   0x38(%rsp),%xmm0
   1767c:	ff 15 8e 37 04 00    	call   *0x4378e(%rip)        # 5ae10 <_DYNAMIC+0x248>
   17682:	a8 01                	test   $0x1,%al
   17684:	74 08                	je     1768e <hyperinterval_strict_surface32+0x27e>
   17686:	88 53 04             	mov    %dl,0x4(%rbx)
   17689:	e9 37 fe ff ff       	jmp    174c5 <hyperinterval_strict_surface32+0xb5>
   1768e:	0f b6 44 24 1c       	movzbl 0x1c(%rsp),%eax
   17693:	88 44 24 08          	mov    %al,0x8(%rsp)
   17697:	40 88 6c 24 09       	mov    %bpl,0x9(%rsp)
   1769c:	44 88 7c 24 0a       	mov    %r15b,0xa(%rsp)
   176a1:	44 88 64 24 0b       	mov    %r12b,0xb(%rsp)
   176a6:	88 54 24 0c          	mov    %dl,0xc(%rsp)
   176aa:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   176af:	41 83 fe 01          	cmp    $0x1,%r14d
   176b3:	75 2a                	jne    176df <hyperinterval_strict_surface32+0x2cf>
   176b5:	f3 0f 7e 44 24 40    	movq   0x40(%rsp),%xmm0
   176bb:	66 0f ef c9          	pxor   %xmm1,%xmm1
   176bf:	66 0f 6f 15 d9 e4 fe 	movdqa -0x11b27(%rip),%xmm2        # 5ba0 <__abi_tag+0x58a4>
   176c6:	ff 
   176c7:	66 0f ef d0          	pxor   %xmm0,%xmm2
   176cb:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   176cf:	66 0f df ca          	pandn  %xmm2,%xmm1
   176d3:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   176d8:	b8 01 00 00 00       	mov    $0x1,%eax
   176dd:	eb 02                	jmp    176e1 <hyperinterval_strict_surface32+0x2d1>
   176df:	31 c0                	xor    %eax,%eax
   176e1:	89 44 24 48          	mov    %eax,0x48(%rsp)
   176e5:	66 0f d6 44 24 4c    	movq   %xmm0,0x4c(%rsp)
   176eb:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   176f0:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
   176f5:	48 8d 54 24 48       	lea    0x48(%rsp),%rdx
   176fa:	ff 15 28 38 04 00    	call   *0x43828(%rip)        # 5af28 <_DYNAMIC+0x360>
   17700:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17704:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   17709:	83 f9 02             	cmp    $0x2,%ecx
   1770c:	0f 84 38 fd ff ff    	je     1744a <hyperinterval_strict_surface32+0x3a>
   17712:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   17716:	8b 74 24 10          	mov    0x10(%rsp),%esi
   1771a:	89 74 24 28          	mov    %esi,0x28(%rsp)
   1771e:	89 54 24 25          	mov    %edx,0x25(%rsp)
   17722:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   17726:	88 44 24 24          	mov    %al,0x24(%rsp)
   1772a:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1772f:	66 0f 6e 05 dd e3 fe 	movd   -0x11c23(%rip),%xmm0        # 5b14 <__abi_tag+0x5818>
   17736:	ff 
   17737:	ff 15 53 37 04 00    	call   *0x43753(%rip)        # 5ae90 <_DYNAMIC+0x2c8>
   1773d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17741:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   17746:	83 f9 02             	cmp    $0x2,%ecx
   17749:	0f 84 fb fc ff ff    	je     1744a <hyperinterval_strict_surface32+0x3a>
   1774f:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   17753:	8b 74 24 10          	mov    0x10(%rsp),%esi
   17757:	89 74 24 34          	mov    %esi,0x34(%rsp)
   1775b:	89 54 24 31          	mov    %edx,0x31(%rsp)
   1775f:	89 4c 24 2c          	mov    %ecx,0x2c(%rsp)
   17763:	88 44 24 30          	mov    %al,0x30(%rsp)
   17767:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
   1776c:	48 8d 54 24 2c       	lea    0x2c(%rsp),%rdx
   17771:	48 89 df             	mov    %rbx,%rdi
   17774:	ff 15 b6 37 04 00    	call   *0x437b6(%rip)        # 5af30 <_DYNAMIC+0x368>
   1777a:	e9 4c fd ff ff       	jmp    174cb <hyperinterval_strict_surface32+0xbb>
   1777f:	cc                   	int3

hyperinterval_strict_surface64:
   17780:	55                   	push   %rbp
   17781:	41 57                	push   %r15
   17783:	41 56                	push   %r14
   17785:	41 55                	push   %r13
   17787:	41 54                	push   %r12
   17789:	53                   	push   %rbx
   1778a:	48 81 ec e8 00 00 00 	sub    $0xe8,%rsp
   17791:	89 f5                	mov    %esi,%ebp
   17793:	48 89 fb             	mov    %rdi,%rbx
   17796:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1779b:	f2 0f 11 44 24 68    	movsd  %xmm0,0x68(%rsp)
   177a1:	f2 0f 11 4c 24 48    	movsd  %xmm1,0x48(%rsp)
   177a7:	ff 15 fb 36 04 00    	call   *0x436fb(%rip)        # 5aea8 <_DYNAMIC+0x2e0>
   177ad:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   177b2:	49 83 fc 02          	cmp    $0x2,%r12
   177b6:	75 07                	jne    177bf <hyperinterval_strict_surface64+0x3f>
   177b8:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   177bd:	eb 3f                	jmp    177fe <hyperinterval_strict_surface64+0x7e>
   177bf:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   177c4:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
   177c9:	4c 89 a4 24 88 00 00 	mov    %r12,0x88(%rsp)
   177d0:	00 
   177d1:	4c 89 b4 24 90 00 00 	mov    %r14,0x90(%rsp)
   177d8:	00 
   177d9:	4c 89 bc 24 98 00 00 	mov    %r15,0x98(%rsp)
   177e0:	00 
   177e1:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   177e6:	f2 0f 10 44 24 68    	movsd  0x68(%rsp),%xmm0
   177ec:	ff 15 46 37 04 00    	call   *0x43746(%rip)        # 5af38 <_DYNAMIC+0x370>
   177f2:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   177f7:	75 24                	jne    1781d <hyperinterval_strict_surface64+0x9d>
   177f9:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   177fe:	88 43 08             	mov    %al,0x8(%rbx)
   17801:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   17808:	48 89 d8             	mov    %rbx,%rax
   1780b:	48 81 c4 e8 00 00 00 	add    $0xe8,%rsp
   17812:	5b                   	pop    %rbx
   17813:	41 5c                	pop    %r12
   17815:	41 5d                	pop    %r13
   17817:	41 5e                	pop    %r14
   17819:	41 5f                	pop    %r15
   1781b:	5d                   	pop    %rbp
   1781c:	c3                   	ret
   1781d:	48 b8 00 00 00 00 00 	movabs $0x7ff0000000000000,%rax
   17824:	00 f0 7f 
   17827:	f3 0f 7e 44 24 48    	movq   0x48(%rsp),%xmm0
   1782d:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   17832:	48 89 ca             	mov    %rcx,%rdx
   17835:	48 21 c2             	and    %rax,%rdx
   17838:	48 39 c2             	cmp    %rax,%rdx
   1783b:	75 04                	jne    17841 <hyperinterval_strict_surface64+0xc1>
   1783d:	31 d2                	xor    %edx,%edx
   1783f:	eb 2d                	jmp    1786e <hyperinterval_strict_surface64+0xee>
   17841:	31 d2                	xor    %edx,%edx
   17843:	66 0f 57 c9          	xorpd  %xmm1,%xmm1
   17847:	66 0f 2e c1          	ucomisd %xmm1,%xmm0
   1784b:	48 0f 45 d1          	cmovne %rcx,%rdx
   1784f:	48 0f 4a d1          	cmovp  %rcx,%rdx
   17853:	48 89 d1             	mov    %rdx,%rcx
   17856:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1785a:	48 83 c9 01          	or     $0x1,%rcx
   1785e:	48 01 d1             	add    %rdx,%rcx
   17861:	48 89 ce             	mov    %rcx,%rsi
   17864:	48 21 c6             	and    %rax,%rsi
   17867:	b2 03                	mov    $0x3,%dl
   17869:	48 39 c6             	cmp    %rax,%rsi
   1786c:	75 05                	jne    17873 <hyperinterval_strict_surface64+0xf3>
   1786e:	88 53 08             	mov    %dl,0x8(%rbx)
   17871:	eb 8e                	jmp    17801 <hyperinterval_strict_surface64+0x81>
   17873:	f2 0f 10 44 24 38    	movsd  0x38(%rsp),%xmm0
   17879:	49 bd 00 00 00 00 00 	movabs $0x8000000000000000,%r13
   17880:	00 00 80 
   17883:	49 8d 45 ff          	lea    -0x1(%r13),%rax
   17887:	48 85 c1             	test   %rax,%rcx
   1788a:	74 05                	je     17891 <hyperinterval_strict_surface64+0x111>
   1788c:	66 48 0f 6e c9       	movq   %rcx,%xmm1
   17891:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17896:	ff 15 0c 36 04 00    	call   *0x4360c(%rip)        # 5aea8 <_DYNAMIC+0x2e0>
   1789c:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   178a1:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   178a6:	48 83 f9 02          	cmp    $0x2,%rcx
   178aa:	0f 84 4e ff ff ff    	je     177fe <hyperinterval_strict_surface64+0x7e>
   178b0:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   178b5:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   178ba:	48 89 b4 24 b0 00 00 	mov    %rsi,0xb0(%rsp)
   178c1:	00 
   178c2:	48 89 94 24 a9 00 00 	mov    %rdx,0xa9(%rsp)
   178c9:	00 
   178ca:	48 89 8c 24 a0 00 00 	mov    %rcx,0xa0(%rsp)
   178d1:	00 
   178d2:	88 84 24 a8 00 00 00 	mov    %al,0xa8(%rsp)
   178d9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   178de:	48 8d b4 24 88 00 00 	lea    0x88(%rsp),%rsi
   178e5:	00 
   178e6:	89 ea                	mov    %ebp,%edx
   178e8:	ff 15 52 36 04 00    	call   *0x43652(%rip)        # 5af40 <_DYNAMIC+0x378>
   178ee:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   178f3:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   178f8:	48 83 f9 02          	cmp    $0x2,%rcx
   178fc:	0f 84 fc fe ff ff    	je     177fe <hyperinterval_strict_surface64+0x7e>
   17902:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   17907:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   1790c:	48 89 74 24 40       	mov    %rsi,0x40(%rsp)
   17911:	48 89 54 24 39       	mov    %rdx,0x39(%rsp)
   17916:	48 89 4c 24 30       	mov    %rcx,0x30(%rsp)
   1791b:	88 44 24 38          	mov    %al,0x38(%rsp)
   1791f:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
   17924:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   17929:	ff 15 19 36 04 00    	call   *0x43619(%rip)        # 5af48 <_DYNAMIC+0x380>
   1792f:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
   17934:	0f b6 44 24 78       	movzbl 0x78(%rsp),%eax
   17939:	48 83 f9 02          	cmp    $0x2,%rcx
   1793d:	0f 84 bb fe ff ff    	je     177fe <hyperinterval_strict_surface64+0x7e>
   17943:	48 8b 54 24 79       	mov    0x79(%rsp),%rdx
   17948:	48 8b b4 24 80 00 00 	mov    0x80(%rsp),%rsi
   1794f:	00 
   17950:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   17955:	48 89 54 24 59       	mov    %rdx,0x59(%rsp)
   1795a:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
   1795f:	88 44 24 58          	mov    %al,0x58(%rsp)
   17963:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
   1796a:	00 
   1796b:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   17970:	48 8d 94 24 a0 00 00 	lea    0xa0(%rsp),%rdx
   17977:	00 
   17978:	ff 15 d2 35 04 00    	call   *0x435d2(%rip)        # 5af50 <_DYNAMIC+0x388>
   1797e:	48 8d ac 24 b8 00 00 	lea    0xb8(%rsp),%rbp
   17985:	00 
   17986:	48 8d 94 24 88 00 00 	lea    0x88(%rsp),%rdx
   1798d:	00 
   1798e:	48 89 ef             	mov    %rbp,%rdi
   17991:	48 8d b4 24 d0 00 00 	lea    0xd0(%rsp),%rsi
   17998:	00 
   17999:	ff 15 b9 35 04 00    	call   *0x435b9(%rip)        # 5af58 <_DYNAMIC+0x390>
   1799f:	48 89 ef             	mov    %rbp,%rdi
   179a2:	ff 15 b8 35 04 00    	call   *0x435b8(%rip)        # 5af60 <_DYNAMIC+0x398>
   179a8:	48 8b 8c 24 b8 00 00 	mov    0xb8(%rsp),%rcx
   179af:	00 
   179b0:	48 83 f9 01          	cmp    $0x1,%rcx
   179b4:	75 27                	jne    179dd <hyperinterval_strict_surface64+0x25d>
   179b6:	48 8b b4 24 c0 00 00 	mov    0xc0(%rsp),%rsi
   179bd:	00 
   179be:	48 8b bc 24 c8 00 00 	mov    0xc8(%rsp),%rdi
   179c5:	00 
   179c6:	48 39 fe             	cmp    %rdi,%rsi
   179c9:	0f 94 c2             	sete   %dl
   179cc:	66 48 0f 6e ce       	movq   %rsi,%xmm1
   179d1:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   179d6:	be 01 00 00 00       	mov    $0x1,%esi
   179db:	eb 04                	jmp    179e1 <hyperinterval_strict_surface64+0x261>
   179dd:	31 d2                	xor    %edx,%edx
   179df:	31 f6                	xor    %esi,%esi
   179e1:	80 f1 01             	xor    $0x1,%cl
   179e4:	48 89 74 24 08       	mov    %rsi,0x8(%rsp)
   179e9:	66 0f d6 4c 24 10    	movq   %xmm1,0x10(%rsp)
   179ef:	88 4c 24 18          	mov    %cl,0x18(%rsp)
   179f3:	88 54 24 19          	mov    %dl,0x19(%rsp)
   179f7:	88 44 24 1a          	mov    %al,0x1a(%rsp)
   179fb:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
   17a00:	66 0f d6 44 24 28    	movq   %xmm0,0x28(%rsp)
   17a06:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   17a0b:	48 8d ac 24 b8 00 00 	lea    0xb8(%rsp),%rbp
   17a12:	00 
   17a13:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
   17a1a:	00 
   17a1b:	48 89 ef             	mov    %rbp,%rdi
   17a1e:	ff 15 44 35 04 00    	call   *0x43544(%rip)        # 5af68 <_DYNAMIC+0x3a0>
   17a24:	88 44 24 48          	mov    %al,0x48(%rsp)
   17a28:	48 89 ef             	mov    %rbp,%rdi
   17a2b:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
   17a32:	00 
   17a33:	ff 15 37 35 04 00    	call   *0x43537(%rip)        # 5af70 <_DYNAMIC+0x3a8>
   17a39:	88 44 24 07          	mov    %al,0x7(%rsp)
   17a3d:	48 8d b4 24 88 00 00 	lea    0x88(%rsp),%rsi
   17a44:	00 
   17a45:	48 89 ef             	mov    %rbp,%rdi
   17a48:	ff 15 2a 35 04 00    	call   *0x4352a(%rip)        # 5af78 <_DYNAMIC+0x3b0>
   17a4e:	88 44 24 06          	mov    %al,0x6(%rsp)
   17a52:	48 89 ef             	mov    %rbp,%rdi
   17a55:	48 8d b4 24 88 00 00 	lea    0x88(%rsp),%rsi
   17a5c:	00 
   17a5d:	ff 15 1d 35 04 00    	call   *0x4351d(%rip)        # 5af80 <_DYNAMIC+0x3b8>
   17a63:	88 44 24 05          	mov    %al,0x5(%rsp)
   17a67:	48 89 ef             	mov    %rbp,%rdi
   17a6a:	f2 0f 10 44 24 68    	movsd  0x68(%rsp),%xmm0
   17a70:	ff 15 92 33 04 00    	call   *0x43392(%rip)        # 5ae08 <_DYNAMIC+0x240>
   17a76:	a8 01                	test   $0x1,%al
   17a78:	74 08                	je     17a82 <hyperinterval_strict_surface64+0x302>
   17a7a:	88 53 08             	mov    %dl,0x8(%rbx)
   17a7d:	e9 7f fd ff ff       	jmp    17801 <hyperinterval_strict_surface64+0x81>
   17a82:	0f b6 44 24 48       	movzbl 0x48(%rsp),%eax
   17a87:	88 44 24 08          	mov    %al,0x8(%rsp)
   17a8b:	0f b6 44 24 07       	movzbl 0x7(%rsp),%eax
   17a90:	88 44 24 09          	mov    %al,0x9(%rsp)
   17a94:	0f b6 44 24 06       	movzbl 0x6(%rsp),%eax
   17a99:	88 44 24 0a          	mov    %al,0xa(%rsp)
   17a9d:	0f b6 44 24 05       	movzbl 0x5(%rsp),%eax
   17aa2:	88 44 24 0b          	mov    %al,0xb(%rsp)
   17aa6:	88 54 24 0c          	mov    %dl,0xc(%rsp)
   17aaa:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   17aaf:	41 83 fc 01          	cmp    $0x1,%r12d
   17ab3:	75 1e                	jne    17ad3 <hyperinterval_strict_surface64+0x353>
   17ab5:	4c 89 f8             	mov    %r15,%rax
   17ab8:	4c 31 e8             	xor    %r13,%rax
   17abb:	4d 85 ff             	test   %r15,%r15
   17abe:	49 0f 44 c7          	cmove  %r15,%rax
   17ac2:	4d 31 f5             	xor    %r14,%r13
   17ac5:	4d 85 f6             	test   %r14,%r14
   17ac8:	4d 0f 44 ee          	cmove  %r14,%r13
   17acc:	b9 01 00 00 00       	mov    $0x1,%ecx
   17ad1:	eb 02                	jmp    17ad5 <hyperinterval_strict_surface64+0x355>
   17ad3:	31 c9                	xor    %ecx,%ecx
   17ad5:	48 89 4c 24 70       	mov    %rcx,0x70(%rsp)
   17ada:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
   17adf:	4c 89 ac 24 80 00 00 	mov    %r13,0x80(%rsp)
   17ae6:	00 
   17ae7:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17aec:	48 8d b4 24 b8 00 00 	lea    0xb8(%rsp),%rsi
   17af3:	00 
   17af4:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   17af9:	ff 15 89 34 04 00    	call   *0x43489(%rip)        # 5af88 <_DYNAMIC+0x3c0>
   17aff:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   17b04:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   17b09:	48 83 f9 02          	cmp    $0x2,%rcx
   17b0d:	0f 84 eb fc ff ff    	je     177fe <hyperinterval_strict_surface64+0x7e>
   17b13:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   17b18:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   17b1d:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   17b22:	48 89 54 24 59       	mov    %rdx,0x59(%rsp)
   17b27:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
   17b2c:	88 44 24 58          	mov    %al,0x58(%rsp)
   17b30:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17b35:	f2 0f 10 05 43 df fe 	movsd  -0x120bd(%rip),%xmm0        # 5a80 <__abi_tag+0x5784>
   17b3c:	ff 
   17b3d:	ff 15 7d 33 04 00    	call   *0x4337d(%rip)        # 5aec0 <_DYNAMIC+0x2f8>
   17b43:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   17b48:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   17b4d:	48 83 f9 02          	cmp    $0x2,%rcx
   17b51:	0f 84 a7 fc ff ff    	je     177fe <hyperinterval_strict_surface64+0x7e>
   17b57:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   17b5c:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   17b61:	48 89 74 24 40       	mov    %rsi,0x40(%rsp)
   17b66:	48 89 54 24 39       	mov    %rdx,0x39(%rsp)
   17b6b:	48 89 4c 24 30       	mov    %rcx,0x30(%rsp)
   17b70:	88 44 24 38          	mov    %al,0x38(%rsp)
   17b74:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   17b79:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
   17b7e:	48 89 df             	mov    %rbx,%rdi
   17b81:	ff 15 09 34 04 00    	call   *0x43409(%rip)        # 5af90 <_DYNAMIC+0x3c8>
   17b87:	e9 7c fc ff ff       	jmp    17808 <hyperinterval_strict_surface64+0x88>
   17b8c:	cc                   	int3
   17b8d:	cc                   	int3
   17b8e:	cc                   	int3
   17b8f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::reciprocal:
   17be0:	53                   	push   %rbx
   17be1:	48 83 ec 10          	sub    $0x10,%rsp
   17be5:	48 89 fb             	mov    %rdi,%rbx
   17be8:	80 3e 00             	cmpb   $0x0,(%rsi)
   17beb:	74 59                	je     17c46 <<hyperinterval::float::F32Enclosure>::reciprocal+0x66>
   17bed:	48 89 f2             	mov    %rsi,%rdx
   17bf0:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%rsp)
   17bf7:	00 
   17bf8:	c6 44 24 08 00       	movb   $0x0,0x8(%rsp)
   17bfd:	c6 44 24 0b 3f       	movb   $0x3f,0xb(%rsp)
   17c02:	66 c7 44 24 09 00 80 	movw   $0x8000,0x9(%rsp)
   17c09:	c7 44 24 0c 00 00 80 	movl   $0x3f800000,0xc(%rsp)
   17c10:	3f 
   17c11:	83 7e 04 00          	cmpl   $0x0,0x4(%rsi)
   17c15:	7f 14                	jg     17c2b <<hyperinterval::float::F32Enclosure>::reciprocal+0x4b>
   17c17:	8b 42 08             	mov    0x8(%rdx),%eax
   17c1a:	85 c0                	test   %eax,%eax
   17c1c:	0f 99 c1             	setns  %cl
   17c1f:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   17c24:	0f 94 c0             	sete   %al
   17c27:	08 c8                	or     %cl,%al
   17c29:	75 2a                	jne    17c55 <<hyperinterval::float::F32Enclosure>::reciprocal+0x75>
   17c2b:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
   17c30:	48 89 df             	mov    %rbx,%rdi
   17c33:	b9 01 00 00 00       	mov    $0x1,%ecx
   17c38:	e8 83 02 00 00       	call   17ec0 <<hyperinterval::float::F32Enclosure>::corner_image>
   17c3d:	48 89 d8             	mov    %rbx,%rax
   17c40:	48 83 c4 10          	add    $0x10,%rsp
   17c44:	5b                   	pop    %rbx
   17c45:	c3                   	ret
   17c46:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   17c4c:	48 89 d8             	mov    %rbx,%rax
   17c4f:	48 83 c4 10          	add    $0x10,%rsp
   17c53:	5b                   	pop    %rbx
   17c54:	c3                   	ret
   17c55:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
   17c59:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17c5f:	48 89 d8             	mov    %rbx,%rax
   17c62:	48 83 c4 10          	add    $0x10,%rsp
   17c66:	5b                   	pop    %rbx
   17c67:	c3                   	ret
   17c68:	cc                   	int3
   17c69:	cc                   	int3
   17c6a:	cc                   	int3
   17c6b:	cc                   	int3
   17c6c:	cc                   	int3
   17c6d:	cc                   	int3
   17c6e:	cc                   	int3
   17c6f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::checked_pow:
   17c70:	55                   	push   %rbp
   17c71:	41 57                	push   %r15
   17c73:	41 56                	push   %r14
   17c75:	41 55                	push   %r13
   17c77:	41 54                	push   %r12
   17c79:	53                   	push   %rbx
   17c7a:	48 83 ec 48          	sub    $0x48,%rsp
   17c7e:	48 89 fb             	mov    %rdi,%rbx
   17c81:	83 fa 02             	cmp    $0x2,%edx
   17c84:	75 0b                	jne    17c91 <<hyperinterval::float::F32Enclosure>::checked_pow+0x21>
   17c86:	48 89 df             	mov    %rbx,%rdi
   17c89:	ff 15 f9 31 04 00    	call   *0x431f9(%rip)        # 5ae88 <_DYNAMIC+0x2c0>
   17c8f:	eb 78                	jmp    17d09 <<hyperinterval::float::F32Enclosure>::checked_pow+0x99>
   17c91:	f6 06 01             	testb  $0x1,(%rsi)
   17c94:	74 6d                	je     17d03 <<hyperinterval::float::F32Enclosure>::checked_pow+0x93>
   17c96:	89 d5                	mov    %edx,%ebp
   17c98:	41 bc 00 00 00 80    	mov    $0x80000000,%r12d
   17c9e:	8b 4e 04             	mov    0x4(%rsi),%ecx
   17ca1:	48 89 74 24 40       	mov    %rsi,0x40(%rsp)
   17ca6:	44 8b 7e 08          	mov    0x8(%rsi),%r15d
   17caa:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17caf:	be 00 00 00 80       	mov    $0x80000000,%esi
   17cb4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17cb9:	41 89 e8             	mov    %ebp,%r8d
   17cbc:	e8 1f 1e 00 00       	call   19ae0 <<hyperinterval::ieee::Format>::power>
   17cc1:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   17cc6:	75 2b                	jne    17cf3 <<hyperinterval::float::F32Enclosure>::checked_pow+0x83>
   17cc8:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   17ccd:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
   17cd2:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17cd7:	be 00 00 00 80       	mov    $0x80000000,%esi
   17cdc:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17ce1:	4c 89 f9             	mov    %r15,%rcx
   17ce4:	41 89 e8             	mov    %ebp,%r8d
   17ce7:	e8 f4 1d 00 00       	call   19ae0 <<hyperinterval::ieee::Format>::power>
   17cec:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   17cf1:	75 28                	jne    17d1b <<hyperinterval::float::F32Enclosure>::checked_pow+0xab>
   17cf3:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   17cf8:	88 43 04             	mov    %al,0x4(%rbx)
   17cfb:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17d01:	eb 06                	jmp    17d09 <<hyperinterval::float::F32Enclosure>::checked_pow+0x99>
   17d03:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   17d09:	48 89 d8             	mov    %rbx,%rax
   17d0c:	48 83 c4 48          	add    $0x48,%rsp
   17d10:	5b                   	pop    %rbx
   17d11:	41 5c                	pop    %r12
   17d13:	41 5d                	pop    %r13
   17d15:	41 5e                	pop    %r14
   17d17:	41 5f                	pop    %r15
   17d19:	5d                   	pop    %rbp
   17d1a:	c3                   	ret
   17d1b:	44 89 e9             	mov    %r13d,%ecx
   17d1e:	f7 d1                	not    %ecx
   17d20:	31 c0                	xor    %eax,%eax
   17d22:	f7 c1 00 00 80 7f    	test   $0x7f800000,%ecx
   17d28:	74 62                	je     17d8c <<hyperinterval::float::F32Enclosure>::checked_pow+0x11c>
   17d2a:	41 f7 c5 ff ff ff 7f 	test   $0x7fffffff,%r13d
   17d31:	44 0f 44 e8          	cmove  %eax,%r13d
   17d35:	44 89 f1             	mov    %r14d,%ecx
   17d38:	f7 d1                	not    %ecx
   17d3a:	f7 c1 00 00 80 7f    	test   $0x7f800000,%ecx
   17d40:	74 4a                	je     17d8c <<hyperinterval::float::F32Enclosure>::checked_pow+0x11c>
   17d42:	31 c9                	xor    %ecx,%ecx
   17d44:	4c 89 f0             	mov    %r14,%rax
   17d47:	48 c1 e0 21          	shl    $0x21,%rax
   17d4b:	41 0f 45 ce          	cmovne %r14d,%ecx
   17d4f:	44 89 e8             	mov    %r13d,%eax
   17d52:	44 09 e0             	or     %r12d,%eax
   17d55:	44 89 ea             	mov    %r13d,%edx
   17d58:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   17d5e:	be 00 00 00 80       	mov    $0x80000000,%esi
   17d63:	29 d6                	sub    %edx,%esi
   17d65:	45 85 ed             	test   %r13d,%r13d
   17d68:	48 0f 49 f0          	cmovns %rax,%rsi
   17d6c:	89 c8                	mov    %ecx,%eax
   17d6e:	44 09 e0             	or     %r12d,%eax
   17d71:	89 ca                	mov    %ecx,%edx
   17d73:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   17d79:	bf 00 00 00 80       	mov    $0x80000000,%edi
   17d7e:	29 d7                	sub    %edx,%edi
   17d80:	85 c9                	test   %ecx,%ecx
   17d82:	48 0f 49 f8          	cmovns %rax,%rdi
   17d86:	b0 01                	mov    $0x1,%al
   17d88:	39 fe                	cmp    %edi,%esi
   17d8a:	76 0e                	jbe    17d9a <<hyperinterval::float::F32Enclosure>::checked_pow+0x12a>
   17d8c:	88 43 04             	mov    %al,0x4(%rbx)
   17d8f:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17d95:	e9 6f ff ff ff       	jmp    17d09 <<hyperinterval::float::F32Enclosure>::checked_pow+0x99>
   17d9a:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   17d9f:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   17da4:	c7 44 24 24 01 00 00 	movl   $0x1,0x24(%rsp)
   17dab:	00 
   17dac:	44 89 6c 24 28       	mov    %r13d,0x28(%rsp)
   17db1:	89 4c 24 2c          	mov    %ecx,0x2c(%rsp)
   17db5:	89 c1                	mov    %eax,%ecx
   17db7:	f7 d1                	not    %ecx
   17db9:	31 d2                	xor    %edx,%edx
   17dbb:	f7 c1 00 00 80 7f    	test   $0x7f800000,%ecx
   17dc1:	74 57                	je     17e1a <<hyperinterval::float::F32Enclosure>::checked_pow+0x1aa>
   17dc3:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   17dc8:	0f 44 c2             	cmove  %edx,%eax
   17dcb:	89 f1                	mov    %esi,%ecx
   17dcd:	f7 d1                	not    %ecx
   17dcf:	f7 c1 00 00 80 7f    	test   $0x7f800000,%ecx
   17dd5:	74 43                	je     17e1a <<hyperinterval::float::F32Enclosure>::checked_pow+0x1aa>
   17dd7:	31 c9                	xor    %ecx,%ecx
   17dd9:	48 89 f2             	mov    %rsi,%rdx
   17ddc:	48 c1 e2 21          	shl    $0x21,%rdx
   17de0:	0f 45 ce             	cmovne %esi,%ecx
   17de3:	89 c2                	mov    %eax,%edx
   17de5:	44 09 e2             	or     %r12d,%edx
   17de8:	89 c6                	mov    %eax,%esi
   17dea:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   17df0:	bf 00 00 00 80       	mov    $0x80000000,%edi
   17df5:	29 f7                	sub    %esi,%edi
   17df7:	85 c0                	test   %eax,%eax
   17df9:	48 0f 49 fa          	cmovns %rdx,%rdi
   17dfd:	89 ca                	mov    %ecx,%edx
   17dff:	44 09 e2             	or     %r12d,%edx
   17e02:	89 ce                	mov    %ecx,%esi
   17e04:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   17e0a:	41 29 f4             	sub    %esi,%r12d
   17e0d:	85 c9                	test   %ecx,%ecx
   17e0f:	4c 0f 49 e2          	cmovns %rdx,%r12
   17e13:	b2 01                	mov    $0x1,%dl
   17e15:	44 39 e7             	cmp    %r12d,%edi
   17e18:	76 0e                	jbe    17e28 <<hyperinterval::float::F32Enclosure>::checked_pow+0x1b8>
   17e1a:	88 53 04             	mov    %dl,0x4(%rbx)
   17e1d:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17e23:	e9 e1 fe ff ff       	jmp    17d09 <<hyperinterval::float::F32Enclosure>::checked_pow+0x99>
   17e28:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%rsp)
   17e2f:	00 
   17e30:	89 44 24 0c          	mov    %eax,0xc(%rsp)
   17e34:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   17e38:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   17e3d:	48 8d 74 24 24       	lea    0x24(%rsp),%rsi
   17e42:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
   17e47:	ff 15 ab 30 04 00    	call   *0x430ab(%rip)        # 5aef8 <_DYNAMIC+0x330>
   17e4d:	85 ed                	test   %ebp,%ebp
   17e4f:	0f 95 c0             	setne  %al
   17e52:	40 f6 c5 01          	test   $0x1,%bpl
   17e56:	0f 94 c1             	sete   %cl
   17e59:	84 c8                	test   %cl,%al
   17e5b:	74 47                	je     17ea4 <<hyperinterval::float::F32Enclosure>::checked_pow+0x234>
   17e5d:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
   17e62:	ff 15 98 30 04 00    	call   *0x43098(%rip)        # 5af00 <_DYNAMIC+0x338>
   17e68:	a8 02                	test   $0x2,%al
   17e6a:	74 38                	je     17ea4 <<hyperinterval::float::F32Enclosure>::checked_pow+0x234>
   17e6c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%rsp)
   17e73:	00 
   17e74:	48 c7 44 24 0c 00 00 	movq   $0x0,0xc(%rsp)
   17e7b:	00 00 
   17e7d:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
   17e82:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   17e87:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
   17e8c:	ff 15 66 30 04 00    	call   *0x43066(%rip)        # 5aef8 <_DYNAMIC+0x330>
   17e92:	8b 44 24 2c          	mov    0x2c(%rsp),%eax
   17e96:	89 44 24 38          	mov    %eax,0x38(%rsp)
   17e9a:	48 8b 44 24 24       	mov    0x24(%rsp),%rax
   17e9f:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   17ea4:	8b 44 24 38          	mov    0x38(%rsp),%eax
   17ea8:	89 43 08             	mov    %eax,0x8(%rbx)
   17eab:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   17eb0:	48 89 03             	mov    %rax,(%rbx)
   17eb3:	e9 51 fe ff ff       	jmp    17d09 <<hyperinterval::float::F32Enclosure>::checked_pow+0x99>
   17eb8:	cc                   	int3
   17eb9:	cc                   	int3
   17eba:	cc                   	int3
   17ebb:	cc                   	int3
   17ebc:	cc                   	int3
   17ebd:	cc                   	int3
   17ebe:	cc                   	int3
   17ebf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::corner_image:
   17ec0:	55                   	push   %rbp
   17ec1:	41 57                	push   %r15
   17ec3:	41 56                	push   %r14
   17ec5:	41 55                	push   %r13
   17ec7:	41 54                	push   %r12
   17ec9:	53                   	push   %rbx
   17eca:	48 83 ec 68          	sub    $0x68,%rsp
   17ece:	48 89 fb             	mov    %rdi,%rbx
   17ed1:	f6 06 01             	testb  $0x1,(%rsi)
   17ed4:	74 4f                	je     17f25 <<hyperinterval::float::F32Enclosure>::corner_image+0x65>
   17ed6:	f6 02 01             	testb  $0x1,(%rdx)
   17ed9:	74 4a                	je     17f25 <<hyperinterval::float::F32Enclosure>::corner_image+0x65>
   17edb:	44 8b 62 04          	mov    0x4(%rdx),%r12d
   17edf:	8b 42 08             	mov    0x8(%rdx),%eax
   17ee2:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   17ee7:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
   17eeb:	8b 46 08             	mov    0x8(%rsi),%eax
   17eee:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   17ef3:	89 cd                	mov    %ecx,%ebp
   17ef5:	84 c9                	test   %cl,%cl
   17ef7:	74 37                	je     17f30 <<hyperinterval::float::F32Enclosure>::corner_image+0x70>
   17ef9:	48 89 e7             	mov    %rsp,%rdi
   17efc:	be 00 00 00 80       	mov    $0x80000000,%esi
   17f01:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17f06:	4c 89 e9             	mov    %r13,%rcx
   17f09:	4d 89 e0             	mov    %r12,%r8
   17f0c:	e8 8f 17 00 00       	call   196a0 <<hyperinterval::ieee::Format>::div>
   17f11:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   17f15:	0f 84 bc 00 00 00    	je     17fd7 <<hyperinterval::float::F32Enclosure>::corner_image+0x117>
   17f1b:	0f b6 7c 24 01       	movzbl 0x1(%rsp),%edi
   17f20:	e9 51 04 00 00       	jmp    18376 <<hyperinterval::float::F32Enclosure>::corner_image+0x4b6>
   17f25:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   17f2b:	e9 50 04 00 00       	jmp    18380 <<hyperinterval::float::F32Enclosure>::corner_image+0x4c0>
   17f30:	44 89 e8             	mov    %r13d,%eax
   17f33:	c1 e8 17             	shr    $0x17,%eax
   17f36:	0f b6 c0             	movzbl %al,%eax
   17f39:	44 89 e9             	mov    %r13d,%ecx
   17f3c:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   17f42:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   17f49:	8d b0 6a ff ff ff    	lea    -0x96(%rax),%esi
   17f4f:	85 c0                	test   %eax,%eax
   17f51:	b8 6b ff ff ff       	mov    $0xffffff6b,%eax
   17f56:	0f 44 f0             	cmove  %eax,%esi
   17f59:	48 0f 44 d1          	cmove  %rcx,%rdx
   17f5d:	44 89 e1             	mov    %r12d,%ecx
   17f60:	c1 e9 17             	shr    $0x17,%ecx
   17f63:	0f b6 c9             	movzbl %cl,%ecx
   17f66:	44 89 ef             	mov    %r13d,%edi
   17f69:	44 31 e7             	xor    %r12d,%edi
   17f6c:	45 89 e0             	mov    %r12d,%r8d
   17f6f:	41 81 e0 ff ff 7f 00 	and    $0x7fffff,%r8d
   17f76:	4d 8d 88 00 00 80 00 	lea    0x800000(%r8),%r9
   17f7d:	44 8d 91 6a ff ff ff 	lea    -0x96(%rcx),%r10d
   17f84:	85 c9                	test   %ecx,%ecx
   17f86:	44 0f 44 d0          	cmove  %eax,%r10d
   17f8a:	4d 0f 44 c8          	cmove  %r8,%r9
   17f8e:	4c 0f af ca          	imul   %rdx,%r9
   17f92:	41 01 f2             	add    %esi,%r10d
   17f95:	c1 ef 1f             	shr    $0x1f,%edi
   17f98:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
   17f9d:	4c 89 0c 24          	mov    %r9,(%rsp)
   17fa1:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   17fa8:	00 00 
   17faa:	44 89 54 24 10       	mov    %r10d,0x10(%rsp)
   17faf:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   17fb4:	48 89 e1             	mov    %rsp,%rcx
   17fb7:	be 00 00 00 80       	mov    $0x80000000,%esi
   17fbc:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17fc1:	e8 2a 1f 00 00       	call   19ef0 <<hyperinterval::ieee::Format>::rounded>
   17fc6:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   17fcb:	74 16                	je     17fe3 <<hyperinterval::float::F32Enclosure>::corner_image+0x123>
   17fcd:	0f b6 7c 24 31       	movzbl 0x31(%rsp),%edi
   17fd2:	e9 9f 03 00 00       	jmp    18376 <<hyperinterval::float::F32Enclosure>::corner_image+0x4b6>
   17fd7:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   17fdc:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
   17fe1:	eb 0a                	jmp    17fed <<hyperinterval::float::F32Enclosure>::corner_image+0x12d>
   17fe3:	4c 8b 74 24 38       	mov    0x38(%rsp),%r14
   17fe8:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
   17fed:	44 89 f0             	mov    %r14d,%eax
   17ff0:	f7 d0                	not    %eax
   17ff2:	31 ff                	xor    %edi,%edi
   17ff4:	a9 00 00 80 7f       	test   $0x7f800000,%eax
   17ff9:	0f 84 77 03 00 00    	je     18376 <<hyperinterval::float::F32Enclosure>::corner_image+0x4b6>
   17fff:	44 89 c1             	mov    %r8d,%ecx
   18002:	81 e1 00 00 80 7f    	and    $0x7f800000,%ecx
   18008:	81 f9 00 00 80 7f    	cmp    $0x7f800000,%ecx
   1800e:	0f 84 62 03 00 00    	je     18376 <<hyperinterval::float::F32Enclosure>::corner_image+0x4b6>
   18014:	89 e8                	mov    %ebp,%eax
   18016:	31 c9                	xor    %ecx,%ecx
   18018:	41 f7 c6 ff ff ff 7f 	test   $0x7fffffff,%r14d
   1801f:	44 0f 44 f1          	cmove  %ecx,%r14d
   18023:	41 f7 c0 ff ff ff 7f 	test   $0x7fffffff,%r8d
   1802a:	44 0f 44 c1          	cmove  %ecx,%r8d
   1802e:	be 00 00 00 80       	mov    $0x80000000,%esi
   18033:	49 8d 0c 36          	lea    (%r14,%rsi,1),%rcx
   18037:	44 89 f2             	mov    %r14d,%edx
   1803a:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18040:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   18046:	49 29 d7             	sub    %rdx,%r15
   18049:	45 85 f6             	test   %r14d,%r14d
   1804c:	4c 0f 49 f9          	cmovns %rcx,%r15
   18050:	49 8d 0c 30          	lea    (%r8,%rsi,1),%rcx
   18054:	44 89 c2             	mov    %r8d,%edx
   18057:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1805d:	bd 00 00 00 80       	mov    $0x80000000,%ebp
   18062:	48 29 d5             	sub    %rdx,%rbp
   18065:	45 85 c0             	test   %r8d,%r8d
   18068:	48 0f 49 e9          	cmovns %rcx,%rbp
   1806c:	40 b7 01             	mov    $0x1,%dil
   1806f:	49 39 ef             	cmp    %rbp,%r15
   18072:	0f 87 fe 02 00 00    	ja     18376 <<hyperinterval::float::F32Enclosure>::corner_image+0x4b6>
   18078:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
   1807d:	84 c0                	test   %al,%al
   1807f:	0f 84 16 02 00 00    	je     1829b <<hyperinterval::float::F32Enclosure>::corner_image+0x3db>
   18085:	48 89 e7             	mov    %rsp,%rdi
   18088:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1808d:	4c 89 e9             	mov    %r13,%rcx
   18090:	4c 8b 44 24 50       	mov    0x50(%rsp),%r8
   18095:	e8 06 16 00 00       	call   196a0 <<hyperinterval::ieee::Format>::div>
   1809a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1809e:	0f 85 77 fe ff ff    	jne    17f1b <<hyperinterval::float::F32Enclosure>::corner_image+0x5b>
   180a4:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   180a9:	89 c2                	mov    %eax,%edx
   180ab:	f7 d2                	not    %edx
   180ad:	31 c9                	xor    %ecx,%ecx
   180af:	f7 c2 00 00 80 7f    	test   $0x7f800000,%edx
   180b5:	0f 84 b9 02 00 00    	je     18374 <<hyperinterval::float::F32Enclosure>::corner_image+0x4b4>
   180bb:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   180c0:	0f 44 c1             	cmove  %ecx,%eax
   180c3:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   180c8:	89 d1                	mov    %edx,%ecx
   180ca:	f7 d1                	not    %ecx
   180cc:	f7 c1 00 00 80 7f    	test   $0x7f800000,%ecx
   180d2:	0f 84 9c 02 00 00    	je     18374 <<hyperinterval::float::F32Enclosure>::corner_image+0x4b4>
   180d8:	31 c9                	xor    %ecx,%ecx
   180da:	48 89 d6             	mov    %rdx,%rsi
   180dd:	48 c1 e6 21          	shl    $0x21,%rsi
   180e1:	0f 45 ca             	cmovne %edx,%ecx
   180e4:	89 c6                	mov    %eax,%esi
   180e6:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   180ec:	4a 8d 3c 06          	lea    (%rsi,%r8,1),%rdi
   180f0:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   180f6:	ba 00 00 00 80       	mov    $0x80000000,%edx
   180fb:	48 29 f2             	sub    %rsi,%rdx
   180fe:	85 c0                	test   %eax,%eax
   18100:	48 0f 49 d7          	cmovns %rdi,%rdx
   18104:	4a 8d 3c 01          	lea    (%rcx,%r8,1),%rdi
   18108:	41 89 c8             	mov    %ecx,%r8d
   1810b:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18112:	be 00 00 00 80       	mov    $0x80000000,%esi
   18117:	4c 29 c6             	sub    %r8,%rsi
   1811a:	85 c9                	test   %ecx,%ecx
   1811c:	48 0f 49 f7          	cmovns %rdi,%rsi
   18120:	48 39 f2             	cmp    %rsi,%rdx
   18123:	0f 87 b3 02 00 00    	ja     183dc <<hyperinterval::float::F32Enclosure>::corner_image+0x51c>
   18129:	41 39 d7             	cmp    %edx,%r15d
   1812c:	44 0f 47 f0          	cmova  %eax,%r14d
   18130:	39 f5                	cmp    %esi,%ebp
   18132:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   18137:	0f 42 c1             	cmovb  %ecx,%eax
   1813a:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1813f:	48 89 e7             	mov    %rsp,%rdi
   18142:	be 00 00 00 80       	mov    $0x80000000,%esi
   18147:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1814c:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   18151:	4d 89 e0             	mov    %r12,%r8
   18154:	e8 47 15 00 00       	call   196a0 <<hyperinterval::ieee::Format>::div>
   18159:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1815d:	0f 85 b8 fd ff ff    	jne    17f1b <<hyperinterval::float::F32Enclosure>::corner_image+0x5b>
   18163:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   18168:	44 89 f9             	mov    %r15d,%ecx
   1816b:	f7 d1                	not    %ecx
   1816d:	31 c0                	xor    %eax,%eax
   1816f:	f7 c1 00 00 80 7f    	test   $0x7f800000,%ecx
   18175:	be 00 00 00 80       	mov    $0x80000000,%esi
   1817a:	0f 84 f4 01 00 00    	je     18374 <<hyperinterval::float::F32Enclosure>::corner_image+0x4b4>
   18180:	41 f7 c7 ff ff ff 7f 	test   $0x7fffffff,%r15d
   18187:	44 0f 44 f8          	cmove  %eax,%r15d
   1818b:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   18190:	89 c1                	mov    %eax,%ecx
   18192:	f7 d1                	not    %ecx
   18194:	f7 c1 00 00 80 7f    	test   $0x7f800000,%ecx
   1819a:	0f 84 d4 01 00 00    	je     18374 <<hyperinterval::float::F32Enclosure>::corner_image+0x4b4>
   181a0:	45 31 e4             	xor    %r12d,%r12d
   181a3:	48 89 c1             	mov    %rax,%rcx
   181a6:	48 c1 e1 21          	shl    $0x21,%rcx
   181aa:	44 0f 45 e0          	cmovne %eax,%r12d
   181ae:	44 89 f8             	mov    %r15d,%eax
   181b1:	48 8d 14 30          	lea    (%rax,%rsi,1),%rdx
   181b5:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   181ba:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   181bf:	48 29 c1             	sub    %rax,%rcx
   181c2:	45 85 ff             	test   %r15d,%r15d
   181c5:	48 0f 49 ca          	cmovns %rdx,%rcx
   181c9:	49 8d 14 34          	lea    (%r12,%rsi,1),%rdx
   181cd:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   181d3:	44 89 e6             	mov    %r12d,%esi
   181d6:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   181dc:	b8 00 00 00 80       	mov    $0x80000000,%eax
   181e1:	48 29 f0             	sub    %rsi,%rax
   181e4:	45 85 e4             	test   %r12d,%r12d
   181e7:	48 0f 49 c2          	cmovns %rdx,%rax
   181eb:	48 39 c1             	cmp    %rax,%rcx
   181ee:	0f 87 e8 01 00 00    	ja     183dc <<hyperinterval::float::F32Enclosure>::corner_image+0x51c>
   181f4:	44 89 f2             	mov    %r14d,%edx
   181f7:	44 09 c2             	or     %r8d,%edx
   181fa:	44 89 f6             	mov    %r14d,%esi
   181fd:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18203:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18208:	29 f7                	sub    %esi,%edi
   1820a:	45 85 f6             	test   %r14d,%r14d
   1820d:	48 0f 49 fa          	cmovns %rdx,%rdi
   18211:	39 cf                	cmp    %ecx,%edi
   18213:	45 0f 46 fe          	cmovbe %r14d,%r15d
   18217:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1821c:	89 f9                	mov    %edi,%ecx
   1821e:	44 09 c1             	or     %r8d,%ecx
   18221:	89 fa                	mov    %edi,%edx
   18223:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18229:	be 00 00 00 80       	mov    $0x80000000,%esi
   1822e:	29 d6                	sub    %edx,%esi
   18230:	85 ff                	test   %edi,%edi
   18232:	48 0f 49 f1          	cmovns %rcx,%rsi
   18236:	39 c6                	cmp    %eax,%esi
   18238:	44 0f 43 e7          	cmovae %edi,%r12d
   1823c:	48 89 e7             	mov    %rsp,%rdi
   1823f:	be 00 00 00 80       	mov    $0x80000000,%esi
   18244:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18249:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1824e:	4c 8b 44 24 50       	mov    0x50(%rsp),%r8
   18253:	e8 48 14 00 00       	call   196a0 <<hyperinterval::ieee::Format>::div>
   18258:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1825c:	0f 85 b9 fc ff ff    	jne    17f1b <<hyperinterval::float::F32Enclosure>::corner_image+0x5b>
   18262:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   18267:	89 c2                	mov    %eax,%edx
   18269:	f7 d2                	not    %edx
   1826b:	31 c9                	xor    %ecx,%ecx
   1826d:	f7 c2 00 00 80 7f    	test   $0x7f800000,%edx
   18273:	0f 84 fb 00 00 00    	je     18374 <<hyperinterval::float::F32Enclosure>::corner_image+0x4b4>
   18279:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   1827e:	0f 44 c1             	cmove  %ecx,%eax
   18281:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   18286:	89 d1                	mov    %edx,%ecx
   18288:	f7 d1                	not    %ecx
   1828a:	f7 c1 00 00 80 7f    	test   $0x7f800000,%ecx
   18290:	0f 84 de 00 00 00    	je     18374 <<hyperinterval::float::F32Enclosure>::corner_image+0x4b4>
   18296:	e9 57 03 00 00       	jmp    185f2 <<hyperinterval::float::F32Enclosure>::corner_image+0x732>
   1829b:	44 89 e8             	mov    %r13d,%eax
   1829e:	c1 e8 17             	shr    $0x17,%eax
   182a1:	0f b6 d0             	movzbl %al,%edx
   182a4:	44 89 ee             	mov    %r13d,%esi
   182a7:	81 e6 ff ff 7f 00    	and    $0x7fffff,%esi
   182ad:	48 8d 86 00 00 80 00 	lea    0x800000(%rsi),%rax
   182b4:	8d 8a 6a ff ff ff    	lea    -0x96(%rdx),%ecx
   182ba:	85 d2                	test   %edx,%edx
   182bc:	ba 6b ff ff ff       	mov    $0xffffff6b,%edx
   182c1:	0f 44 ca             	cmove  %edx,%ecx
   182c4:	48 0f 44 c6          	cmove  %rsi,%rax
   182c8:	4c 8b 44 24 50       	mov    0x50(%rsp),%r8
   182cd:	44 89 c6             	mov    %r8d,%esi
   182d0:	c1 ee 17             	shr    $0x17,%esi
   182d3:	40 0f b6 f6          	movzbl %sil,%esi
   182d7:	44 89 c7             	mov    %r8d,%edi
   182da:	81 e7 ff ff 7f 00    	and    $0x7fffff,%edi
   182e0:	4c 8d 97 00 00 80 00 	lea    0x800000(%rdi),%r10
   182e7:	44 8d 8e 6a ff ff ff 	lea    -0x96(%rsi),%r9d
   182ee:	85 f6                	test   %esi,%esi
   182f0:	44 0f 44 ca          	cmove  %edx,%r9d
   182f4:	4c 0f 44 d7          	cmove  %rdi,%r10
   182f8:	45 31 c5             	xor    %r8d,%r13d
   182fb:	4c 89 54 24 60       	mov    %r10,0x60(%rsp)
   18300:	49 0f af c2          	imul   %r10,%rax
   18304:	44 89 4c 24 5c       	mov    %r9d,0x5c(%rsp)
   18309:	44 01 c9             	add    %r9d,%ecx
   1830c:	41 c1 ed 1f          	shr    $0x1f,%r13d
   18310:	44 88 6c 24 14       	mov    %r13b,0x14(%rsp)
   18315:	48 89 04 24          	mov    %rax,(%rsp)
   18319:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   18320:	00 00 
   18322:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   18326:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1832b:	48 89 e1             	mov    %rsp,%rcx
   1832e:	be 00 00 00 80       	mov    $0x80000000,%esi
   18333:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18338:	e8 b3 1b 00 00       	call   19ef0 <<hyperinterval::ieee::Format>::rounded>
   1833d:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   18342:	0f 85 85 fc ff ff    	jne    17fcd <<hyperinterval::float::F32Enclosure>::corner_image+0x10d>
   18348:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   1834d:	89 c2                	mov    %eax,%edx
   1834f:	f7 d2                	not    %edx
   18351:	31 c9                	xor    %ecx,%ecx
   18353:	f7 c2 00 00 80 7f    	test   $0x7f800000,%edx
   18359:	74 19                	je     18374 <<hyperinterval::float::F32Enclosure>::corner_image+0x4b4>
   1835b:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   18360:	0f 44 c1             	cmove  %ecx,%eax
   18363:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
   18368:	89 d1                	mov    %edx,%ecx
   1836a:	f7 d1                	not    %ecx
   1836c:	f7 c1 00 00 80 7f    	test   $0x7f800000,%ecx
   18372:	75 1b                	jne    1838f <<hyperinterval::float::F32Enclosure>::corner_image+0x4cf>
   18374:	31 ff                	xor    %edi,%edi
   18376:	40 88 7b 04          	mov    %dil,0x4(%rbx)
   1837a:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18380:	48 83 c4 68          	add    $0x68,%rsp
   18384:	5b                   	pop    %rbx
   18385:	41 5c                	pop    %r12
   18387:	41 5d                	pop    %r13
   18389:	41 5e                	pop    %r14
   1838b:	41 5f                	pop    %r15
   1838d:	5d                   	pop    %rbp
   1838e:	c3                   	ret
   1838f:	31 c9                	xor    %ecx,%ecx
   18391:	48 89 d6             	mov    %rdx,%rsi
   18394:	48 c1 e6 21          	shl    $0x21,%rsi
   18398:	0f 45 ca             	cmovne %edx,%ecx
   1839b:	89 c6                	mov    %eax,%esi
   1839d:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   183a3:	4a 8d 3c 06          	lea    (%rsi,%r8,1),%rdi
   183a7:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   183ad:	ba 00 00 00 80       	mov    $0x80000000,%edx
   183b2:	48 29 f2             	sub    %rsi,%rdx
   183b5:	85 c0                	test   %eax,%eax
   183b7:	48 0f 49 d7          	cmovns %rdi,%rdx
   183bb:	4a 8d 3c 01          	lea    (%rcx,%r8,1),%rdi
   183bf:	41 89 c8             	mov    %ecx,%r8d
   183c2:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   183c9:	be 00 00 00 80       	mov    $0x80000000,%esi
   183ce:	4c 29 c6             	sub    %r8,%rsi
   183d1:	85 c9                	test   %ecx,%ecx
   183d3:	48 0f 49 f7          	cmovns %rdi,%rsi
   183d7:	48 39 f2             	cmp    %rsi,%rdx
   183da:	76 05                	jbe    183e1 <<hyperinterval::float::F32Enclosure>::corner_image+0x521>
   183dc:	40 b7 01             	mov    $0x1,%dil
   183df:	eb 95                	jmp    18376 <<hyperinterval::float::F32Enclosure>::corner_image+0x4b6>
   183e1:	41 39 d7             	cmp    %edx,%r15d
   183e4:	44 0f 47 f0          	cmova  %eax,%r14d
   183e8:	39 f5                	cmp    %esi,%ebp
   183ea:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   183ef:	0f 42 c1             	cmovb  %ecx,%eax
   183f2:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   183f7:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
   183fc:	44 89 c0             	mov    %r8d,%eax
   183ff:	c1 e8 17             	shr    $0x17,%eax
   18402:	0f b6 c0             	movzbl %al,%eax
   18405:	44 89 c1             	mov    %r8d,%ecx
   18408:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   1840e:	4c 8d a9 00 00 80 00 	lea    0x800000(%rcx),%r13
   18415:	8d a8 6a ff ff ff    	lea    -0x96(%rax),%ebp
   1841b:	85 c0                	test   %eax,%eax
   1841d:	b8 6b ff ff ff       	mov    $0xffffff6b,%eax
   18422:	0f 44 e8             	cmove  %eax,%ebp
   18425:	4c 0f 44 e9          	cmove  %rcx,%r13
   18429:	44 89 e1             	mov    %r12d,%ecx
   1842c:	c1 e9 17             	shr    $0x17,%ecx
   1842f:	0f b6 c9             	movzbl %cl,%ecx
   18432:	44 89 e2             	mov    %r12d,%edx
   18435:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
   1843b:	48 8d b2 00 00 80 00 	lea    0x800000(%rdx),%rsi
   18442:	8d b9 6a ff ff ff    	lea    -0x96(%rcx),%edi
   18448:	85 c9                	test   %ecx,%ecx
   1844a:	0f 44 f8             	cmove  %eax,%edi
   1844d:	48 0f 44 f2          	cmove  %rdx,%rsi
   18451:	45 31 c4             	xor    %r8d,%r12d
   18454:	49 0f af f5          	imul   %r13,%rsi
   18458:	01 ef                	add    %ebp,%edi
   1845a:	41 c1 ec 1f          	shr    $0x1f,%r12d
   1845e:	44 88 64 24 14       	mov    %r12b,0x14(%rsp)
   18463:	48 89 34 24          	mov    %rsi,(%rsp)
   18467:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   1846e:	00 00 
   18470:	89 7c 24 10          	mov    %edi,0x10(%rsp)
   18474:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   18479:	48 89 e1             	mov    %rsp,%rcx
   1847c:	be 00 00 00 80       	mov    $0x80000000,%esi
   18481:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18486:	e8 65 1a 00 00       	call   19ef0 <<hyperinterval::ieee::Format>::rounded>
   1848b:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   18490:	0f 85 37 fb ff ff    	jne    17fcd <<hyperinterval::float::F32Enclosure>::corner_image+0x10d>
   18496:	4c 8b 7c 24 38       	mov    0x38(%rsp),%r15
   1849b:	44 89 f9             	mov    %r15d,%ecx
   1849e:	f7 d1                	not    %ecx
   184a0:	31 c0                	xor    %eax,%eax
   184a2:	f7 c1 00 00 80 7f    	test   $0x7f800000,%ecx
   184a8:	be 00 00 00 80       	mov    $0x80000000,%esi
   184ad:	0f 84 c1 fe ff ff    	je     18374 <<hyperinterval::float::F32Enclosure>::corner_image+0x4b4>
   184b3:	41 f7 c7 ff ff ff 7f 	test   $0x7fffffff,%r15d
   184ba:	44 0f 44 f8          	cmove  %eax,%r15d
   184be:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   184c3:	89 c1                	mov    %eax,%ecx
   184c5:	f7 d1                	not    %ecx
   184c7:	f7 c1 00 00 80 7f    	test   $0x7f800000,%ecx
   184cd:	0f 84 a1 fe ff ff    	je     18374 <<hyperinterval::float::F32Enclosure>::corner_image+0x4b4>
   184d3:	45 31 e4             	xor    %r12d,%r12d
   184d6:	48 89 c1             	mov    %rax,%rcx
   184d9:	48 c1 e1 21          	shl    $0x21,%rcx
   184dd:	44 0f 45 e0          	cmovne %eax,%r12d
   184e1:	44 89 f8             	mov    %r15d,%eax
   184e4:	48 8d 14 30          	lea    (%rax,%rsi,1),%rdx
   184e8:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   184ed:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   184f2:	48 29 c1             	sub    %rax,%rcx
   184f5:	45 85 ff             	test   %r15d,%r15d
   184f8:	48 0f 49 ca          	cmovns %rdx,%rcx
   184fc:	49 8d 14 34          	lea    (%r12,%rsi,1),%rdx
   18500:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18505:	44 89 e6             	mov    %r12d,%esi
   18508:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1850e:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18513:	48 29 f0             	sub    %rsi,%rax
   18516:	45 85 e4             	test   %r12d,%r12d
   18519:	48 0f 49 c2          	cmovns %rdx,%rax
   1851d:	48 39 c1             	cmp    %rax,%rcx
   18520:	0f 87 b6 fe ff ff    	ja     183dc <<hyperinterval::float::F32Enclosure>::corner_image+0x51c>
   18526:	44 89 f2             	mov    %r14d,%edx
   18529:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1852f:	be 00 00 00 80       	mov    $0x80000000,%esi
   18534:	29 d6                	sub    %edx,%esi
   18536:	44 89 f2             	mov    %r14d,%edx
   18539:	09 fa                	or     %edi,%edx
   1853b:	45 85 f6             	test   %r14d,%r14d
   1853e:	48 0f 49 f2          	cmovns %rdx,%rsi
   18542:	39 ce                	cmp    %ecx,%esi
   18544:	45 0f 46 fe          	cmovbe %r14d,%r15d
   18548:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   1854d:	89 f1                	mov    %esi,%ecx
   1854f:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18555:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1855a:	29 ca                	sub    %ecx,%edx
   1855c:	89 f1                	mov    %esi,%ecx
   1855e:	09 f9                	or     %edi,%ecx
   18560:	85 f6                	test   %esi,%esi
   18562:	48 0f 49 d1          	cmovns %rcx,%rdx
   18566:	39 c2                	cmp    %eax,%edx
   18568:	44 0f 43 e6          	cmovae %esi,%r12d
   1856c:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   18571:	33 44 24 48          	xor    0x48(%rsp),%eax
   18575:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
   1857a:	49 0f af d5          	imul   %r13,%rdx
   1857e:	8b 4c 24 5c          	mov    0x5c(%rsp),%ecx
   18582:	01 e9                	add    %ebp,%ecx
   18584:	c1 e8 1f             	shr    $0x1f,%eax
   18587:	88 44 24 14          	mov    %al,0x14(%rsp)
   1858b:	48 89 14 24          	mov    %rdx,(%rsp)
   1858f:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   18596:	00 00 
   18598:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1859c:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   185a1:	48 89 e1             	mov    %rsp,%rcx
   185a4:	be 00 00 00 80       	mov    $0x80000000,%esi
   185a9:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   185ae:	e8 3d 19 00 00       	call   19ef0 <<hyperinterval::ieee::Format>::rounded>
   185b3:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   185b8:	0f 85 0f fa ff ff    	jne    17fcd <<hyperinterval::float::F32Enclosure>::corner_image+0x10d>
   185be:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   185c3:	89 c2                	mov    %eax,%edx
   185c5:	f7 d2                	not    %edx
   185c7:	31 c9                	xor    %ecx,%ecx
   185c9:	f7 c2 00 00 80 7f    	test   $0x7f800000,%edx
   185cf:	0f 84 9f fd ff ff    	je     18374 <<hyperinterval::float::F32Enclosure>::corner_image+0x4b4>
   185d5:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   185da:	0f 44 c1             	cmove  %ecx,%eax
   185dd:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
   185e2:	89 d1                	mov    %edx,%ecx
   185e4:	f7 d1                	not    %ecx
   185e6:	f7 c1 00 00 80 7f    	test   $0x7f800000,%ecx
   185ec:	0f 84 82 fd ff ff    	je     18374 <<hyperinterval::float::F32Enclosure>::corner_image+0x4b4>
   185f2:	31 c9                	xor    %ecx,%ecx
   185f4:	48 89 d6             	mov    %rdx,%rsi
   185f7:	48 c1 e6 21          	shl    $0x21,%rsi
   185fb:	0f 45 ca             	cmovne %edx,%ecx
   185fe:	89 c2                	mov    %eax,%edx
   18600:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18606:	4a 8d 3c 02          	lea    (%rdx,%r8,1),%rdi
   1860a:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18610:	be 00 00 00 80       	mov    $0x80000000,%esi
   18615:	48 29 d6             	sub    %rdx,%rsi
   18618:	85 c0                	test   %eax,%eax
   1861a:	48 0f 49 f7          	cmovns %rdi,%rsi
   1861e:	4a 8d 3c 01          	lea    (%rcx,%r8,1),%rdi
   18622:	41 89 c8             	mov    %ecx,%r8d
   18625:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1862c:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18631:	4c 29 c2             	sub    %r8,%rdx
   18634:	85 c9                	test   %ecx,%ecx
   18636:	48 0f 49 d7          	cmovns %rdi,%rdx
   1863a:	48 39 d6             	cmp    %rdx,%rsi
   1863d:	40 b7 01             	mov    $0x1,%dil
   18640:	0f 87 30 fd ff ff    	ja     18376 <<hyperinterval::float::F32Enclosure>::corner_image+0x4b6>
   18646:	44 89 ff             	mov    %r15d,%edi
   18649:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1864f:	44 09 d7             	or     %r10d,%edi
   18652:	45 89 f8             	mov    %r15d,%r8d
   18655:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1865c:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   18662:	45 29 c1             	sub    %r8d,%r9d
   18665:	45 85 ff             	test   %r15d,%r15d
   18668:	4c 0f 49 cf          	cmovns %rdi,%r9
   1866c:	41 39 f1             	cmp    %esi,%r9d
   1866f:	41 0f 46 c7          	cmovbe %r15d,%eax
   18673:	44 89 e6             	mov    %r12d,%esi
   18676:	44 09 d6             	or     %r10d,%esi
   18679:	44 89 e7             	mov    %r12d,%edi
   1867c:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18682:	41 29 fa             	sub    %edi,%r10d
   18685:	45 85 e4             	test   %r12d,%r12d
   18688:	4c 0f 49 d6          	cmovns %rsi,%r10
   1868c:	41 39 d2             	cmp    %edx,%r10d
   1868f:	41 0f 43 cc          	cmovae %r12d,%ecx
   18693:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   18699:	89 43 04             	mov    %eax,0x4(%rbx)
   1869c:	89 4b 08             	mov    %ecx,0x8(%rbx)
   1869f:	e9 dc fc ff ff       	jmp    18380 <<hyperinterval::float::F32Enclosure>::corner_image+0x4c0>
   186a4:	cc                   	int3
   186a5:	cc                   	int3
   186a6:	cc                   	int3
   186a7:	cc                   	int3
   186a8:	cc                   	int3
   186a9:	cc                   	int3
   186aa:	cc                   	int3
   186ab:	cc                   	int3
   186ac:	cc                   	int3
   186ad:	cc                   	int3
   186ae:	cc                   	int3
   186af:	cc                   	int3

<hyperinterval::float::F32Enclosure>::intersection:
   186b0:	48 89 f8             	mov    %rdi,%rax
   186b3:	45 31 c9             	xor    %r9d,%r9d
   186b6:	f6 06 01             	testb  $0x1,(%rsi)
   186b9:	0f 84 ed 00 00 00    	je     187ac <<hyperinterval::float::F32Enclosure>::intersection+0xfc>
   186bf:	f6 02 01             	testb  $0x1,(%rdx)
   186c2:	0f 84 d9 00 00 00    	je     187a1 <<hyperinterval::float::F32Enclosure>::intersection+0xf1>
   186c8:	53                   	push   %rbx
   186c9:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   186cd:	8b 4e 04             	mov    0x4(%rsi),%ecx
   186d0:	bf 00 00 00 80       	mov    $0x80000000,%edi
   186d5:	41 89 c9             	mov    %ecx,%r9d
   186d8:	41 09 f9             	or     %edi,%r9d
   186db:	41 89 ca             	mov    %ecx,%r10d
   186de:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   186e5:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   186eb:	45 29 d3             	sub    %r10d,%r11d
   186ee:	85 c9                	test   %ecx,%ecx
   186f0:	4d 0f 49 d9          	cmovns %r9,%r11
   186f4:	45 89 c1             	mov    %r8d,%r9d
   186f7:	41 09 f9             	or     %edi,%r9d
   186fa:	45 89 c2             	mov    %r8d,%r10d
   186fd:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18704:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   18709:	44 29 d3             	sub    %r10d,%ebx
   1870c:	45 85 c0             	test   %r8d,%r8d
   1870f:	49 0f 49 d9          	cmovns %r9,%rbx
   18713:	8b 52 08             	mov    0x8(%rdx),%edx
   18716:	41 39 db             	cmp    %ebx,%r11d
   18719:	41 0f 42 c8          	cmovb  %r8d,%ecx
   1871d:	44 8b 46 08          	mov    0x8(%rsi),%r8d
   18721:	44 89 c6             	mov    %r8d,%esi
   18724:	09 fe                	or     %edi,%esi
   18726:	45 89 c1             	mov    %r8d,%r9d
   18729:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18730:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18736:	45 29 ca             	sub    %r9d,%r10d
   18739:	45 85 c0             	test   %r8d,%r8d
   1873c:	4c 0f 49 d6          	cmovns %rsi,%r10
   18740:	89 d6                	mov    %edx,%esi
   18742:	09 fe                	or     %edi,%esi
   18744:	41 89 d1             	mov    %edx,%r9d
   18747:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1874e:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   18754:	45 29 cb             	sub    %r9d,%r11d
   18757:	85 d2                	test   %edx,%edx
   18759:	4c 0f 49 de          	cmovns %rsi,%r11
   1875d:	45 39 da             	cmp    %r11d,%r10d
   18760:	44 0f 47 c2          	cmova  %edx,%r8d
   18764:	89 ca                	mov    %ecx,%edx
   18766:	09 fa                	or     %edi,%edx
   18768:	89 ce                	mov    %ecx,%esi
   1876a:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18770:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18776:	41 29 f2             	sub    %esi,%r10d
   18779:	85 c9                	test   %ecx,%ecx
   1877b:	4c 0f 49 d2          	cmovns %rdx,%r10
   1877f:	44 89 c2             	mov    %r8d,%edx
   18782:	09 fa                	or     %edi,%edx
   18784:	44 89 c6             	mov    %r8d,%esi
   18787:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1878d:	29 f7                	sub    %esi,%edi
   1878f:	45 85 c0             	test   %r8d,%r8d
   18792:	48 0f 49 fa          	cmovns %rdx,%rdi
   18796:	45 31 c9             	xor    %r9d,%r9d
   18799:	41 39 fa             	cmp    %edi,%r10d
   1879c:	41 0f 96 c1          	setbe  %r9b
   187a0:	5b                   	pop    %rbx
   187a1:	44 89 08             	mov    %r9d,(%rax)
   187a4:	89 48 04             	mov    %ecx,0x4(%rax)
   187a7:	44 89 40 08          	mov    %r8d,0x8(%rax)
   187ab:	c3                   	ret
   187ac:	44 89 08             	mov    %r9d,(%rax)
   187af:	89 48 04             	mov    %ecx,0x4(%rax)
   187b2:	44 89 40 08          	mov    %r8d,0x8(%rax)
   187b6:	c3                   	ret
   187b7:	cc                   	int3
   187b8:	cc                   	int3
   187b9:	cc                   	int3
   187ba:	cc                   	int3
   187bb:	cc                   	int3
   187bc:	cc                   	int3
   187bd:	cc                   	int3
   187be:	cc                   	int3
   187bf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::contains_point:
   187c0:	66 0f 7e c6          	movd   %xmm0,%esi
   187c4:	89 f0                	mov    %esi,%eax
   187c6:	25 00 00 80 7f       	and    $0x7f800000,%eax
   187cb:	31 d2                	xor    %edx,%edx
   187cd:	48 3d 00 00 80 7f    	cmp    $0x7f800000,%rax
   187d3:	74 78                	je     1884d <<hyperinterval::float::F32Enclosure>::contains_point+0x8d>
   187d5:	f6 07 01             	testb  $0x1,(%rdi)
   187d8:	74 73                	je     1884d <<hyperinterval::float::F32Enclosure>::contains_point+0x8d>
   187da:	31 d2                	xor    %edx,%edx
   187dc:	f7 c6 ff ff ff 7f    	test   $0x7fffffff,%esi
   187e2:	0f 44 f2             	cmove  %edx,%esi
   187e5:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   187ea:	44 8b 47 04          	mov    0x4(%rdi),%r8d
   187ee:	45 89 c1             	mov    %r8d,%r9d
   187f1:	41 09 c9             	or     %ecx,%r9d
   187f4:	45 89 c2             	mov    %r8d,%r10d
   187f7:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   187fe:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   18804:	45 29 d3             	sub    %r10d,%r11d
   18807:	45 85 c0             	test   %r8d,%r8d
   1880a:	4d 0f 49 d9          	cmovns %r9,%r11
   1880e:	4c 8d 0c 0e          	lea    (%rsi,%rcx,1),%r9
   18812:	41 89 f2             	mov    %esi,%r10d
   18815:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1881c:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18822:	4d 29 d0             	sub    %r10,%r8
   18825:	85 f6                	test   %esi,%esi
   18827:	4d 0f 49 c1          	cmovns %r9,%r8
   1882b:	45 39 c3             	cmp    %r8d,%r11d
   1882e:	77 1d                	ja     1884d <<hyperinterval::float::F32Enclosure>::contains_point+0x8d>
   18830:	8b 57 08             	mov    0x8(%rdi),%edx
   18833:	89 d6                	mov    %edx,%esi
   18835:	09 ce                	or     %ecx,%esi
   18837:	89 d7                	mov    %edx,%edi
   18839:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1883f:	29 f9                	sub    %edi,%ecx
   18841:	85 d2                	test   %edx,%edx
   18843:	48 0f 49 ce          	cmovns %rsi,%rcx
   18847:	41 39 c8             	cmp    %ecx,%r8d
   1884a:	0f 96 c2             	setbe  %dl
   1884d:	3d 00 00 80 7f       	cmp    $0x7f800000,%eax
   18852:	0f 94 c0             	sete   %al
   18855:	c3                   	ret
   18856:	cc                   	int3
   18857:	cc                   	int3
   18858:	cc                   	int3
   18859:	cc                   	int3
   1885a:	cc                   	int3
   1885b:	cc                   	int3
   1885c:	cc                   	int3
   1885d:	cc                   	int3
   1885e:	cc                   	int3
   1885f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::interior_subset_of:
   18860:	b0 01                	mov    $0x1,%al
   18862:	f6 07 01             	testb  $0x1,(%rdi)
   18865:	0f 84 8e 00 00 00    	je     188f9 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x99>
   1886b:	f6 06 01             	testb  $0x1,(%rsi)
   1886e:	0f 84 83 00 00 00    	je     188f7 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x97>
   18874:	8b 4f 04             	mov    0x4(%rdi),%ecx
   18877:	8b 56 04             	mov    0x4(%rsi),%edx
   1887a:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1887f:	44 8d 04 02          	lea    (%rdx,%rax,1),%r8d
   18883:	41 89 d1             	mov    %edx,%r9d
   18886:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1888d:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18893:	45 29 ca             	sub    %r9d,%r10d
   18896:	85 d2                	test   %edx,%edx
   18898:	4d 0f 49 d0          	cmovns %r8,%r10
   1889c:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1889f:	41 89 c8             	mov    %ecx,%r8d
   188a2:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   188a9:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   188af:	45 29 c1             	sub    %r8d,%r9d
   188b2:	85 c9                	test   %ecx,%ecx
   188b4:	4c 0f 49 ca          	cmovns %rdx,%r9
   188b8:	45 39 ca             	cmp    %r9d,%r10d
   188bb:	73 3a                	jae    188f7 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x97>
   188bd:	8b 4f 08             	mov    0x8(%rdi),%ecx
   188c0:	8b 56 08             	mov    0x8(%rsi),%edx
   188c3:	8d 34 01             	lea    (%rcx,%rax,1),%esi
   188c6:	89 cf                	mov    %ecx,%edi
   188c8:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   188ce:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   188d4:	41 29 f8             	sub    %edi,%r8d
   188d7:	85 c9                	test   %ecx,%ecx
   188d9:	4c 0f 49 c6          	cmovns %rsi,%r8
   188dd:	8d 0c 02             	lea    (%rdx,%rax,1),%ecx
   188e0:	89 d6                	mov    %edx,%esi
   188e2:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   188e8:	29 f0                	sub    %esi,%eax
   188ea:	85 d2                	test   %edx,%edx
   188ec:	48 0f 49 c1          	cmovns %rcx,%rax
   188f0:	41 39 c0             	cmp    %eax,%r8d
   188f3:	0f 92 c0             	setb   %al
   188f6:	c3                   	ret
   188f7:	31 c0                	xor    %eax,%eax
   188f9:	c3                   	ret
   188fa:	cc                   	int3
   188fb:	cc                   	int3
   188fc:	cc                   	int3
   188fd:	cc                   	int3
   188fe:	cc                   	int3
   188ff:	cc                   	int3

<hyperinterval::float::F32Enclosure>::add:
   18900:	48 89 f8             	mov    %rdi,%rax
   18903:	f6 06 01             	testb  $0x1,(%rsi)
   18906:	0f 84 90 00 00 00    	je     1899c <<hyperinterval::float::F32Enclosure>::add+0x9c>
   1890c:	f6 02 01             	testb  $0x1,(%rdx)
   1890f:	0f 84 87 00 00 00    	je     1899c <<hyperinterval::float::F32Enclosure>::add+0x9c>
   18915:	41 57                	push   %r15
   18917:	41 56                	push   %r14
   18919:	41 55                	push   %r13
   1891b:	41 54                	push   %r12
   1891d:	53                   	push   %rbx
   1891e:	48 83 ec 20          	sub    $0x20,%rsp
   18922:	49 89 c5             	mov    %rax,%r13
   18925:	8b 5e 08             	mov    0x8(%rsi),%ebx
   18928:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   1892e:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   18932:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   18936:	8b 4e 04             	mov    0x4(%rsi),%ecx
   18939:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1893e:	be 00 00 00 80       	mov    $0x80000000,%esi
   18943:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18948:	e8 c3 0a 00 00       	call   19410 <<hyperinterval::ieee::Format>::add>
   1894d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18952:	74 26                	je     1897a <<hyperinterval::float::F32Enclosure>::add+0x7a>
   18954:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   18959:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1895e:	be 00 00 00 80       	mov    $0x80000000,%esi
   18963:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18968:	48 89 d9             	mov    %rbx,%rcx
   1896b:	4d 89 f0             	mov    %r14,%r8
   1896e:	e8 9d 0a 00 00       	call   19410 <<hyperinterval::ieee::Format>::add>
   18973:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18978:	75 29                	jne    189a3 <<hyperinterval::float::F32Enclosure>::add+0xa3>
   1897a:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   1897f:	4c 89 e8             	mov    %r13,%rax
   18982:	41 88 4d 04          	mov    %cl,0x4(%r13)
   18986:	41 c7 45 00 02 00 00 	movl   $0x2,0x0(%r13)
   1898d:	00 
   1898e:	48 83 c4 20          	add    $0x20,%rsp
   18992:	5b                   	pop    %rbx
   18993:	41 5c                	pop    %r12
   18995:	41 5d                	pop    %r13
   18997:	41 5e                	pop    %r14
   18999:	41 5f                	pop    %r15
   1899b:	c3                   	ret
   1899c:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   189a2:	c3                   	ret
   189a3:	44 89 e0             	mov    %r12d,%eax
   189a6:	f7 d0                	not    %eax
   189a8:	a9 00 00 80 7f       	test   $0x7f800000,%eax
   189ad:	4c 89 e8             	mov    %r13,%rax
   189b0:	74 1e                	je     189d0 <<hyperinterval::float::F32Enclosure>::add+0xd0>
   189b2:	31 c9                	xor    %ecx,%ecx
   189b4:	41 f7 c4 ff ff ff 7f 	test   $0x7fffffff,%r12d
   189bb:	44 0f 44 e1          	cmove  %ecx,%r12d
   189bf:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
   189c4:	89 d6                	mov    %edx,%esi
   189c6:	f7 d6                	not    %esi
   189c8:	f7 c6 00 00 80 7f    	test   $0x7f800000,%esi
   189ce:	75 0c                	jne    189dc <<hyperinterval::float::F32Enclosure>::add+0xdc>
   189d0:	c6 40 04 00          	movb   $0x0,0x4(%rax)
   189d4:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   189da:	eb b2                	jmp    1898e <<hyperinterval::float::F32Enclosure>::add+0x8e>
   189dc:	48 89 d6             	mov    %rdx,%rsi
   189df:	48 c1 e6 21          	shl    $0x21,%rsi
   189e3:	0f 45 ca             	cmovne %edx,%ecx
   189e6:	44 89 e2             	mov    %r12d,%edx
   189e9:	44 09 fa             	or     %r15d,%edx
   189ec:	44 89 e6             	mov    %r12d,%esi
   189ef:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   189f5:	bf 00 00 00 80       	mov    $0x80000000,%edi
   189fa:	29 f7                	sub    %esi,%edi
   189fc:	45 85 e4             	test   %r12d,%r12d
   189ff:	48 0f 49 fa          	cmovns %rdx,%rdi
   18a03:	89 ca                	mov    %ecx,%edx
   18a05:	44 09 fa             	or     %r15d,%edx
   18a08:	89 ce                	mov    %ecx,%esi
   18a0a:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18a10:	41 29 f7             	sub    %esi,%r15d
   18a13:	85 c9                	test   %ecx,%ecx
   18a15:	4c 0f 49 fa          	cmovns %rdx,%r15
   18a19:	44 39 ff             	cmp    %r15d,%edi
   18a1c:	76 0f                	jbe    18a2d <<hyperinterval::float::F32Enclosure>::add+0x12d>
   18a1e:	c6 40 04 01          	movb   $0x1,0x4(%rax)
   18a22:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   18a28:	e9 61 ff ff ff       	jmp    1898e <<hyperinterval::float::F32Enclosure>::add+0x8e>
   18a2d:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   18a33:	44 89 60 04          	mov    %r12d,0x4(%rax)
   18a37:	89 48 08             	mov    %ecx,0x8(%rax)
   18a3a:	e9 4f ff ff ff       	jmp    1898e <<hyperinterval::float::F32Enclosure>::add+0x8e>
   18a3f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::div:
   18a40:	53                   	push   %rbx
   18a41:	48 89 fb             	mov    %rdi,%rbx
   18a44:	83 3a 01             	cmpl   $0x1,(%rdx)
   18a47:	75 1a                	jne    18a63 <<hyperinterval::float::F32Enclosure>::div+0x23>
   18a49:	83 7a 04 00          	cmpl   $0x0,0x4(%rdx)
   18a4d:	7f 14                	jg     18a63 <<hyperinterval::float::F32Enclosure>::div+0x23>
   18a4f:	8b 42 08             	mov    0x8(%rdx),%eax
   18a52:	85 c0                	test   %eax,%eax
   18a54:	0f 99 c1             	setns  %cl
   18a57:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   18a5c:	0f 94 c0             	sete   %al
   18a5f:	08 c8                	or     %cl,%al
   18a61:	75 12                	jne    18a75 <<hyperinterval::float::F32Enclosure>::div+0x35>
   18a63:	48 89 df             	mov    %rbx,%rdi
   18a66:	b9 01 00 00 00       	mov    $0x1,%ecx
   18a6b:	e8 50 f4 ff ff       	call   17ec0 <<hyperinterval::float::F32Enclosure>::corner_image>
   18a70:	48 89 d8             	mov    %rbx,%rax
   18a73:	5b                   	pop    %rbx
   18a74:	c3                   	ret
   18a75:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
   18a79:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18a7f:	48 89 d8             	mov    %rbx,%rax
   18a82:	5b                   	pop    %rbx
   18a83:	c3                   	ret
   18a84:	cc                   	int3
   18a85:	cc                   	int3
   18a86:	cc                   	int3
   18a87:	cc                   	int3
   18a88:	cc                   	int3
   18a89:	cc                   	int3
   18a8a:	cc                   	int3
   18a8b:	cc                   	int3
   18a8c:	cc                   	int3
   18a8d:	cc                   	int3
   18a8e:	cc                   	int3
   18a8f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::new:
   18a90:	48 89 f8             	mov    %rdi,%rax
   18a93:	66 0f 7e c1          	movd   %xmm0,%ecx
   18a97:	89 ca                	mov    %ecx,%edx
   18a99:	f7 d2                	not    %edx
   18a9b:	f7 c2 00 00 80 7f    	test   $0x7f800000,%edx
   18aa1:	74 1b                	je     18abe <<hyperinterval::float::F32Enclosure>::new+0x2e>
   18aa3:	31 d2                	xor    %edx,%edx
   18aa5:	f7 c1 ff ff ff 7f    	test   $0x7fffffff,%ecx
   18aab:	0f 44 ca             	cmove  %edx,%ecx
   18aae:	66 0f 7e ce          	movd   %xmm1,%esi
   18ab2:	89 f7                	mov    %esi,%edi
   18ab4:	f7 d7                	not    %edi
   18ab6:	f7 c7 00 00 80 7f    	test   $0x7f800000,%edi
   18abc:	75 0b                	jne    18ac9 <<hyperinterval::float::F32Enclosure>::new+0x39>
   18abe:	c6 40 04 00          	movb   $0x0,0x4(%rax)
   18ac2:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   18ac8:	c3                   	ret
   18ac9:	f7 c6 ff ff ff 7f    	test   $0x7fffffff,%esi
   18acf:	0f 45 d6             	cmovne %esi,%edx
   18ad2:	be 00 00 00 80       	mov    $0x80000000,%esi
   18ad7:	89 cf                	mov    %ecx,%edi
   18ad9:	09 f7                	or     %esi,%edi
   18adb:	41 89 c8             	mov    %ecx,%r8d
   18ade:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18ae5:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   18aeb:	45 29 c1             	sub    %r8d,%r9d
   18aee:	85 c9                	test   %ecx,%ecx
   18af0:	4c 0f 49 cf          	cmovns %rdi,%r9
   18af4:	89 d7                	mov    %edx,%edi
   18af6:	09 f7                	or     %esi,%edi
   18af8:	41 89 d0             	mov    %edx,%r8d
   18afb:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18b02:	44 29 c6             	sub    %r8d,%esi
   18b05:	85 d2                	test   %edx,%edx
   18b07:	48 0f 49 f7          	cmovns %rdi,%rsi
   18b0b:	41 39 f1             	cmp    %esi,%r9d
   18b0e:	76 0b                	jbe    18b1b <<hyperinterval::float::F32Enclosure>::new+0x8b>
   18b10:	c6 40 04 01          	movb   $0x1,0x4(%rax)
   18b14:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   18b1a:	c3                   	ret
   18b1b:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   18b21:	89 48 04             	mov    %ecx,0x4(%rax)
   18b24:	89 50 08             	mov    %edx,0x8(%rax)
   18b27:	c3                   	ret
   18b28:	cc                   	int3
   18b29:	cc                   	int3
   18b2a:	cc                   	int3
   18b2b:	cc                   	int3
   18b2c:	cc                   	int3
   18b2d:	cc                   	int3
   18b2e:	cc                   	int3
   18b2f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::sub:
   18b30:	53                   	push   %rbx
   18b31:	48 83 ec 10          	sub    $0x10,%rsp
   18b35:	48 89 fb             	mov    %rdi,%rbx
   18b38:	f6 02 01             	testb  $0x1,(%rdx)
   18b3b:	74 29                	je     18b66 <<hyperinterval::float::F32Enclosure>::sub+0x36>
   18b3d:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   18b42:	66 0f ef c9          	pxor   %xmm1,%xmm1
   18b46:	66 0f 6f 15 52 d0 fe 	movdqa -0x12fae(%rip),%xmm2        # 5ba0 <__abi_tag+0x58a4>
   18b4d:	ff 
   18b4e:	66 0f ef d0          	pxor   %xmm0,%xmm2
   18b52:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   18b56:	66 0f df ca          	pandn  %xmm2,%xmm1
   18b5a:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   18b5f:	b8 01 00 00 00       	mov    $0x1,%eax
   18b64:	eb 02                	jmp    18b68 <<hyperinterval::float::F32Enclosure>::sub+0x38>
   18b66:	31 c0                	xor    %eax,%eax
   18b68:	89 44 24 04          	mov    %eax,0x4(%rsp)
   18b6c:	66 0f d6 44 24 08    	movq   %xmm0,0x8(%rsp)
   18b72:	48 8d 54 24 04       	lea    0x4(%rsp),%rdx
   18b77:	48 89 df             	mov    %rbx,%rdi
   18b7a:	ff 15 18 23 04 00    	call   *0x42318(%rip)        # 5ae98 <_DYNAMIC+0x2d0>
   18b80:	48 89 d8             	mov    %rbx,%rax
   18b83:	48 83 c4 10          	add    $0x10,%rsp
   18b87:	5b                   	pop    %rbx
   18b88:	c3                   	ret
   18b89:	cc                   	int3
   18b8a:	cc                   	int3
   18b8b:	cc                   	int3
   18b8c:	cc                   	int3
   18b8d:	cc                   	int3
   18b8e:	cc                   	int3
   18b8f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::hull:
   18b90:	48 89 f8             	mov    %rdi,%rax
   18b93:	44 8b 0e             	mov    (%rsi),%r9d
   18b96:	44 8b 02             	mov    (%rdx),%r8d
   18b99:	8b 7a 04             	mov    0x4(%rdx),%edi
   18b9c:	8b 4a 08             	mov    0x8(%rdx),%ecx
   18b9f:	41 f6 c1 01          	test   $0x1,%r9b
   18ba3:	0f 84 9b 00 00 00    	je     18c44 <<hyperinterval::float::F32Enclosure>::hull+0xb4>
   18ba9:	8b 56 04             	mov    0x4(%rsi),%edx
   18bac:	8b 76 08             	mov    0x8(%rsi),%esi
   18baf:	41 f6 c0 01          	test   $0x1,%r8b
   18bb3:	0f 84 95 00 00 00    	je     18c4e <<hyperinterval::float::F32Enclosure>::hull+0xbe>
   18bb9:	53                   	push   %rbx
   18bba:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18bc0:	46 8d 0c 02          	lea    (%rdx,%r8,1),%r9d
   18bc4:	41 89 d2             	mov    %edx,%r10d
   18bc7:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18bce:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   18bd4:	45 29 d3             	sub    %r10d,%r11d
   18bd7:	85 d2                	test   %edx,%edx
   18bd9:	4d 0f 49 d9          	cmovns %r9,%r11
   18bdd:	46 8d 0c 07          	lea    (%rdi,%r8,1),%r9d
   18be1:	41 89 fa             	mov    %edi,%r10d
   18be4:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18beb:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   18bf0:	44 29 d3             	sub    %r10d,%ebx
   18bf3:	85 ff                	test   %edi,%edi
   18bf5:	49 0f 49 d9          	cmovns %r9,%rbx
   18bf9:	41 39 db             	cmp    %ebx,%r11d
   18bfc:	0f 47 d7             	cmova  %edi,%edx
   18bff:	42 8d 3c 06          	lea    (%rsi,%r8,1),%edi
   18c03:	41 89 f1             	mov    %esi,%r9d
   18c06:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18c0d:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18c13:	45 29 ca             	sub    %r9d,%r10d
   18c16:	85 f6                	test   %esi,%esi
   18c18:	4c 0f 49 d7          	cmovns %rdi,%r10
   18c1c:	42 8d 3c 01          	lea    (%rcx,%r8,1),%edi
   18c20:	41 89 c9             	mov    %ecx,%r9d
   18c23:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18c2a:	45 29 c8             	sub    %r9d,%r8d
   18c2d:	85 c9                	test   %ecx,%ecx
   18c2f:	4c 0f 49 c7          	cmovns %rdi,%r8
   18c33:	45 39 c2             	cmp    %r8d,%r10d
   18c36:	0f 42 f1             	cmovb  %ecx,%esi
   18c39:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   18c3f:	89 f1                	mov    %esi,%ecx
   18c41:	89 d7                	mov    %edx,%edi
   18c43:	5b                   	pop    %rbx
   18c44:	44 89 00             	mov    %r8d,(%rax)
   18c47:	89 78 04             	mov    %edi,0x4(%rax)
   18c4a:	89 48 08             	mov    %ecx,0x8(%rax)
   18c4d:	c3                   	ret
   18c4e:	89 f1                	mov    %esi,%ecx
   18c50:	89 d7                	mov    %edx,%edi
   18c52:	45 89 c8             	mov    %r9d,%r8d
   18c55:	44 89 00             	mov    %r8d,(%rax)
   18c58:	89 78 04             	mov    %edi,0x4(%rax)
   18c5b:	89 48 08             	mov    %ecx,0x8(%rax)
   18c5e:	c3                   	ret
   18c5f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::point:
   18c60:	48 89 f8             	mov    %rdi,%rax
   18c63:	66 0f 7e c1          	movd   %xmm0,%ecx
   18c67:	89 ca                	mov    %ecx,%edx
   18c69:	f7 d2                	not    %edx
   18c6b:	f7 c2 00 00 80 7f    	test   $0x7f800000,%edx
   18c71:	75 0c                	jne    18c7f <<hyperinterval::float::F32Enclosure>::point+0x1f>
   18c73:	c6 40 04 00          	movb   $0x0,0x4(%rax)
   18c77:	b9 02 00 00 00       	mov    $0x2,%ecx
   18c7c:	89 08                	mov    %ecx,(%rax)
   18c7e:	c3                   	ret
   18c7f:	31 d2                	xor    %edx,%edx
   18c81:	f7 c1 ff ff ff 7f    	test   $0x7fffffff,%ecx
   18c87:	0f 45 d1             	cmovne %ecx,%edx
   18c8a:	89 50 04             	mov    %edx,0x4(%rax)
   18c8d:	89 50 08             	mov    %edx,0x8(%rax)
   18c90:	b9 01 00 00 00       	mov    $0x1,%ecx
   18c95:	89 08                	mov    %ecx,(%rax)
   18c97:	c3                   	ret
   18c98:	cc                   	int3
   18c99:	cc                   	int3
   18c9a:	cc                   	int3
   18c9b:	cc                   	int3
   18c9c:	cc                   	int3
   18c9d:	cc                   	int3
   18c9e:	cc                   	int3
   18c9f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::signs:
   18ca0:	83 3f 01             	cmpl   $0x1,(%rdi)
   18ca3:	75 65                	jne    18d0a <<hyperinterval::float::F32Enclosure>::signs+0x6a>
   18ca5:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   18caa:	8b 57 04             	mov    0x4(%rdi),%edx
   18cad:	8b 47 08             	mov    0x8(%rdi),%eax
   18cb0:	48 89 d6             	mov    %rdx,%rsi
   18cb3:	48 09 ce             	or     %rcx,%rsi
   18cb6:	41 89 d0             	mov    %edx,%r8d
   18cb9:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18cc0:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18cc5:	4c 29 c7             	sub    %r8,%rdi
   18cc8:	85 d2                	test   %edx,%edx
   18cca:	48 0f 49 fe          	cmovns %rsi,%rdi
   18cce:	31 f6                	xor    %esi,%esi
   18cd0:	f7 c7 00 00 00 80    	test   $0x80000000,%edi
   18cd6:	0f 94 c2             	sete   %dl
   18cd9:	48 39 cf             	cmp    %rcx,%rdi
   18cdc:	77 1d                	ja     18cfb <<hyperinterval::float::F32Enclosure>::signs+0x5b>
   18cde:	39 cf                	cmp    %ecx,%edi
   18ce0:	0f 92 c1             	setb   %cl
   18ce3:	80 c9 02             	or     $0x2,%cl
   18ce6:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   18ceb:	0f b6 c9             	movzbl %cl,%ecx
   18cee:	40 88 d6             	mov    %dl,%sil
   18cf1:	0f 44 f1             	cmove  %ecx,%esi
   18cf4:	85 c0                	test   %eax,%eax
   18cf6:	0f 49 f1             	cmovns %ecx,%esi
   18cf9:	89 f2                	mov    %esi,%edx
   18cfb:	8d 4a 04             	lea    0x4(%rdx),%ecx
   18cfe:	85 c0                	test   %eax,%eax
   18d00:	0f b6 d2             	movzbl %dl,%edx
   18d03:	0f b6 c1             	movzbl %cl,%eax
   18d06:	0f 4e c2             	cmovle %edx,%eax
   18d09:	c3                   	ret
   18d0a:	31 c0                	xor    %eax,%eax
   18d0c:	c3                   	ret
   18d0d:	cc                   	int3
   18d0e:	cc                   	int3
   18d0f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::affine:
   18d10:	53                   	push   %rbx
   18d11:	48 83 ec 30          	sub    $0x30,%rsp
   18d15:	48 89 fb             	mov    %rdi,%rbx
   18d18:	66 0f 7e c1          	movd   %xmm0,%ecx
   18d1c:	89 c8                	mov    %ecx,%eax
   18d1e:	f7 d0                	not    %eax
   18d20:	a9 00 00 80 7f       	test   $0x7f800000,%eax
   18d25:	74 2b                	je     18d52 <<hyperinterval::float::F32Enclosure>::affine+0x42>
   18d27:	31 c0                	xor    %eax,%eax
   18d29:	f7 c1 ff ff ff 7f    	test   $0x7fffffff,%ecx
   18d2f:	0f 44 c8             	cmove  %eax,%ecx
   18d32:	c7 44 24 18 01 00 00 	movl   $0x1,0x18(%rsp)
   18d39:	00 
   18d3a:	89 4c 24 1c          	mov    %ecx,0x1c(%rsp)
   18d3e:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   18d42:	66 0f 7e c9          	movd   %xmm1,%ecx
   18d46:	89 ca                	mov    %ecx,%edx
   18d48:	f7 d2                	not    %edx
   18d4a:	f7 c2 00 00 80 7f    	test   $0x7f800000,%edx
   18d50:	75 13                	jne    18d65 <<hyperinterval::float::F32Enclosure>::affine+0x55>
   18d52:	c6 43 04 00          	movb   $0x0,0x4(%rbx)
   18d56:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18d5c:	48 89 d8             	mov    %rbx,%rax
   18d5f:	48 83 c4 30          	add    $0x30,%rsp
   18d63:	5b                   	pop    %rbx
   18d64:	c3                   	ret
   18d65:	f7 c1 ff ff ff 7f    	test   $0x7fffffff,%ecx
   18d6b:	0f 44 c8             	cmove  %eax,%ecx
   18d6e:	c7 44 24 24 01 00 00 	movl   $0x1,0x24(%rsp)
   18d75:	00 
   18d76:	89 4c 24 28          	mov    %ecx,0x28(%rsp)
   18d7a:	89 4c 24 2c          	mov    %ecx,0x2c(%rsp)
   18d7e:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   18d83:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
   18d88:	31 c9                	xor    %ecx,%ecx
   18d8a:	e8 31 f1 ff ff       	call   17ec0 <<hyperinterval::float::F32Enclosure>::corner_image>
   18d8f:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   18d93:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   18d98:	83 f9 02             	cmp    $0x2,%ecx
   18d9b:	75 05                	jne    18da2 <<hyperinterval::float::F32Enclosure>::affine+0x92>
   18d9d:	88 43 04             	mov    %al,0x4(%rbx)
   18da0:	eb b4                	jmp    18d56 <<hyperinterval::float::F32Enclosure>::affine+0x46>
   18da2:	8b 54 24 11          	mov    0x11(%rsp),%edx
   18da6:	8b 74 24 14          	mov    0x14(%rsp),%esi
   18daa:	89 74 24 08          	mov    %esi,0x8(%rsp)
   18dae:	89 54 24 05          	mov    %edx,0x5(%rsp)
   18db2:	89 0c 24             	mov    %ecx,(%rsp)
   18db5:	88 44 24 04          	mov    %al,0x4(%rsp)
   18db9:	48 89 e6             	mov    %rsp,%rsi
   18dbc:	48 8d 54 24 24       	lea    0x24(%rsp),%rdx
   18dc1:	48 89 df             	mov    %rbx,%rdi
   18dc4:	ff 15 ce 20 04 00    	call   *0x420ce(%rip)        # 5ae98 <_DYNAMIC+0x2d0>
   18dca:	48 89 d8             	mov    %rbx,%rax
   18dcd:	48 83 c4 30          	add    $0x30,%rsp
   18dd1:	5b                   	pop    %rbx
   18dd2:	c3                   	ret
   18dd3:	cc                   	int3
   18dd4:	cc                   	int3
   18dd5:	cc                   	int3
   18dd6:	cc                   	int3
   18dd7:	cc                   	int3
   18dd8:	cc                   	int3
   18dd9:	cc                   	int3
   18dda:	cc                   	int3
   18ddb:	cc                   	int3
   18ddc:	cc                   	int3
   18ddd:	cc                   	int3
   18dde:	cc                   	int3
   18ddf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::square:
   18de0:	55                   	push   %rbp
   18de1:	41 57                	push   %r15
   18de3:	41 56                	push   %r14
   18de5:	41 55                	push   %r13
   18de7:	41 54                	push   %r12
   18de9:	53                   	push   %rbx
   18dea:	48 83 ec 58          	sub    $0x58,%rsp
   18dee:	48 89 fb             	mov    %rdi,%rbx
   18df1:	f6 06 01             	testb  $0x1,(%rsi)
   18df4:	0f 84 f2 00 00 00    	je     18eec <<hyperinterval::float::F32Enclosure>::square+0x10c>
   18dfa:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
   18dfe:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   18e02:	44 89 f8             	mov    %r15d,%eax
   18e05:	c1 e8 17             	shr    $0x17,%eax
   18e08:	0f b6 c0             	movzbl %al,%eax
   18e0b:	44 89 f9             	mov    %r15d,%ecx
   18e0e:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   18e14:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   18e1b:	85 c0                	test   %eax,%eax
   18e1d:	8d 84 00 d4 fe ff ff 	lea    -0x12c(%rax,%rax,1),%eax
   18e24:	48 0f 44 d1          	cmove  %rcx,%rdx
   18e28:	41 bc d6 fe ff ff    	mov    $0xfffffed6,%r12d
   18e2e:	41 0f 44 c4          	cmove  %r12d,%eax
   18e32:	48 0f af d2          	imul   %rdx,%rdx
   18e36:	c6 44 24 44 00       	movb   $0x0,0x44(%rsp)
   18e3b:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
   18e40:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
   18e47:	00 00 
   18e49:	89 44 24 40          	mov    %eax,0x40(%rsp)
   18e4d:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   18e52:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
   18e57:	be 00 00 00 80       	mov    $0x80000000,%esi
   18e5c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18e61:	e8 8a 10 00 00       	call   19ef0 <<hyperinterval::ieee::Format>::rounded>
   18e66:	80 7c 24 18 00       	cmpb   $0x0,0x18(%rsp)
   18e6b:	75 6f                	jne    18edc <<hyperinterval::float::F32Enclosure>::square+0xfc>
   18e6d:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
   18e72:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
   18e77:	44 89 f0             	mov    %r14d,%eax
   18e7a:	c1 e8 17             	shr    $0x17,%eax
   18e7d:	0f b6 c0             	movzbl %al,%eax
   18e80:	44 89 f1             	mov    %r14d,%ecx
   18e83:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   18e89:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   18e90:	85 c0                	test   %eax,%eax
   18e92:	48 0f 44 d1          	cmove  %rcx,%rdx
   18e96:	8d 84 00 d4 fe ff ff 	lea    -0x12c(%rax,%rax,1),%eax
   18e9d:	41 0f 44 c4          	cmove  %r12d,%eax
   18ea1:	48 0f af d2          	imul   %rdx,%rdx
   18ea5:	c6 44 24 44 00       	movb   $0x0,0x44(%rsp)
   18eaa:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
   18eaf:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
   18eb6:	00 00 
   18eb8:	89 44 24 40          	mov    %eax,0x40(%rsp)
   18ebc:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   18ec1:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
   18ec6:	be 00 00 00 80       	mov    $0x80000000,%esi
   18ecb:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18ed0:	e8 1b 10 00 00       	call   19ef0 <<hyperinterval::ieee::Format>::rounded>
   18ed5:	80 7c 24 18 01       	cmpb   $0x1,0x18(%rsp)
   18eda:	75 28                	jne    18f04 <<hyperinterval::float::F32Enclosure>::square+0x124>
   18edc:	0f b6 44 24 19       	movzbl 0x19(%rsp),%eax
   18ee1:	88 43 04             	mov    %al,0x4(%rbx)
   18ee4:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18eea:	eb 06                	jmp    18ef2 <<hyperinterval::float::F32Enclosure>::square+0x112>
   18eec:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   18ef2:	48 89 d8             	mov    %rbx,%rax
   18ef5:	48 83 c4 58          	add    $0x58,%rsp
   18ef9:	5b                   	pop    %rbx
   18efa:	41 5c                	pop    %r12
   18efc:	41 5d                	pop    %r13
   18efe:	41 5e                	pop    %r14
   18f00:	41 5f                	pop    %r15
   18f02:	5d                   	pop    %rbp
   18f03:	c3                   	ret
   18f04:	44 89 e8             	mov    %r13d,%eax
   18f07:	f7 d0                	not    %eax
   18f09:	31 c9                	xor    %ecx,%ecx
   18f0b:	a9 00 00 80 7f       	test   $0x7f800000,%eax
   18f10:	0f 84 a0 00 00 00    	je     18fb6 <<hyperinterval::float::F32Enclosure>::square+0x1d6>
   18f16:	41 f7 c5 ff ff ff 7f 	test   $0x7fffffff,%r13d
   18f1d:	44 0f 44 e9          	cmove  %ecx,%r13d
   18f21:	89 e8                	mov    %ebp,%eax
   18f23:	f7 d0                	not    %eax
   18f25:	a9 00 00 80 7f       	test   $0x7f800000,%eax
   18f2a:	0f 84 86 00 00 00    	je     18fb6 <<hyperinterval::float::F32Enclosure>::square+0x1d6>
   18f30:	31 c0                	xor    %eax,%eax
   18f32:	48 89 e9             	mov    %rbp,%rcx
   18f35:	48 c1 e1 21          	shl    $0x21,%rcx
   18f39:	0f 45 c5             	cmovne %ebp,%eax
   18f3c:	44 89 e9             	mov    %r13d,%ecx
   18f3f:	41 bc 00 00 00 80    	mov    $0x80000000,%r12d
   18f45:	4a 8d 34 21          	lea    (%rcx,%r12,1),%rsi
   18f49:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18f4f:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18f54:	48 29 ca             	sub    %rcx,%rdx
   18f57:	45 85 ed             	test   %r13d,%r13d
   18f5a:	48 0f 49 d6          	cmovns %rsi,%rdx
   18f5e:	4a 8d 0c 20          	lea    (%rax,%r12,1),%rcx
   18f62:	89 c7                	mov    %eax,%edi
   18f64:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18f6a:	be 00 00 00 80       	mov    $0x80000000,%esi
   18f6f:	48 29 fe             	sub    %rdi,%rsi
   18f72:	85 c0                	test   %eax,%eax
   18f74:	48 0f 49 f1          	cmovns %rcx,%rsi
   18f78:	b1 01                	mov    $0x1,%cl
   18f7a:	48 39 f2             	cmp    %rsi,%rdx
   18f7d:	77 37                	ja     18fb6 <<hyperinterval::float::F32Enclosure>::square+0x1d6>
   18f7f:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
   18f84:	41 89 f9             	mov    %edi,%r9d
   18f87:	41 f7 d1             	not    %r9d
   18f8a:	45 31 c0             	xor    %r8d,%r8d
   18f8d:	41 f7 c1 00 00 80 7f 	test   $0x7f800000,%r9d
   18f94:	74 1e                	je     18fb4 <<hyperinterval::float::F32Enclosure>::square+0x1d4>
   18f96:	f7 c7 ff ff ff 7f    	test   $0x7fffffff,%edi
   18f9c:	41 0f 44 f8          	cmove  %r8d,%edi
   18fa0:	4c 8b 4c 24 28       	mov    0x28(%rsp),%r9
   18fa5:	45 89 c8             	mov    %r9d,%r8d
   18fa8:	41 f7 d0             	not    %r8d
   18fab:	41 f7 c0 00 00 80 7f 	test   $0x7f800000,%r8d
   18fb2:	75 10                	jne    18fc4 <<hyperinterval::float::F32Enclosure>::square+0x1e4>
   18fb4:	31 c9                	xor    %ecx,%ecx
   18fb6:	88 4b 04             	mov    %cl,0x4(%rbx)
   18fb9:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18fbf:	e9 2e ff ff ff       	jmp    18ef2 <<hyperinterval::float::F32Enclosure>::square+0x112>
   18fc4:	45 31 c0             	xor    %r8d,%r8d
   18fc7:	4d 89 ca             	mov    %r9,%r10
   18fca:	49 c1 e2 21          	shl    $0x21,%r10
   18fce:	45 0f 45 c1          	cmovne %r9d,%r8d
   18fd2:	41 89 fa             	mov    %edi,%r10d
   18fd5:	4f 8d 1c 22          	lea    (%r10,%r12,1),%r11
   18fd9:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18fe0:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   18fe6:	4d 29 d1             	sub    %r10,%r9
   18fe9:	85 ff                	test   %edi,%edi
   18feb:	4d 0f 49 cb          	cmovns %r11,%r9
   18fef:	4f 8d 14 20          	lea    (%r8,%r12,1),%r10
   18ff3:	45 89 c3             	mov    %r8d,%r11d
   18ff6:	41 81 e3 ff ff ff 7f 	and    $0x7fffffff,%r11d
   18ffd:	4d 29 dc             	sub    %r11,%r12
   19000:	45 85 c0             	test   %r8d,%r8d
   19003:	4d 0f 49 e2          	cmovns %r10,%r12
   19007:	4d 39 e1             	cmp    %r12,%r9
   1900a:	77 aa                	ja     18fb6 <<hyperinterval::float::F32Enclosure>::square+0x1d6>
   1900c:	44 39 ca             	cmp    %r9d,%edx
   1900f:	44 0f 47 ef          	cmova  %edi,%r13d
   19013:	44 39 e6             	cmp    %r12d,%esi
   19016:	41 0f 42 c0          	cmovb  %r8d,%eax
   1901a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%rsp)
   19021:	00 
   19022:	44 89 6c 24 0c       	mov    %r13d,0xc(%rsp)
   19027:	89 44 24 10          	mov    %eax,0x10(%rsp)
   1902b:	45 85 ff             	test   %r15d,%r15d
   1902e:	7f 4c                	jg     1907c <<hyperinterval::float::F32Enclosure>::square+0x29c>
   19030:	45 85 f6             	test   %r14d,%r14d
   19033:	0f 99 c0             	setns  %al
   19036:	41 f7 c6 ff ff ff 7f 	test   $0x7fffffff,%r14d
   1903d:	0f 94 c1             	sete   %cl
   19040:	08 c1                	or     %al,%cl
   19042:	74 38                	je     1907c <<hyperinterval::float::F32Enclosure>::square+0x29c>
   19044:	c7 44 24 30 01 00 00 	movl   $0x1,0x30(%rsp)
   1904b:	00 
   1904c:	48 c7 44 24 34 00 00 	movq   $0x0,0x34(%rsp)
   19053:	00 00 
   19055:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   1905a:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
   1905f:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
   19064:	ff 15 8e 1e 04 00    	call   *0x41e8e(%rip)        # 5aef8 <_DYNAMIC+0x330>
   1906a:	8b 44 24 20          	mov    0x20(%rsp),%eax
   1906e:	89 44 24 10          	mov    %eax,0x10(%rsp)
   19072:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   19077:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
   1907c:	8b 44 24 10          	mov    0x10(%rsp),%eax
   19080:	89 43 08             	mov    %eax,0x8(%rbx)
   19083:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19088:	48 89 03             	mov    %rax,(%rbx)
   1908b:	e9 62 fe ff ff       	jmp    18ef2 <<hyperinterval::float::F32Enclosure>::square+0x112>

<hyperinterval::float::F32Enclosure>::disjoint:
   19090:	83 3f 00             	cmpl   $0x0,(%rdi)
   19093:	b0 01                	mov    $0x1,%al
   19095:	0f 84 a3 00 00 00    	je     1913e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   1909b:	8b 0e                	mov    (%rsi),%ecx
   1909d:	85 c9                	test   %ecx,%ecx
   1909f:	0f 84 99 00 00 00    	je     1913e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   190a5:	f6 c1 01             	test   $0x1,%cl
   190a8:	74 4c                	je     190f6 <<hyperinterval::float::F32Enclosure>::disjoint+0x66>
   190aa:	53                   	push   %rbx
   190ab:	8b 56 04             	mov    0x4(%rsi),%edx
   190ae:	44 8b 47 08          	mov    0x8(%rdi),%r8d
   190b2:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   190b8:	45 89 c2             	mov    %r8d,%r10d
   190bb:	45 09 ca             	or     %r9d,%r10d
   190be:	45 89 c3             	mov    %r8d,%r11d
   190c1:	41 81 e3 ff ff ff 7f 	and    $0x7fffffff,%r11d
   190c8:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   190cd:	44 29 db             	sub    %r11d,%ebx
   190d0:	45 85 c0             	test   %r8d,%r8d
   190d3:	49 0f 49 da          	cmovns %r10,%rbx
   190d7:	41 89 d0             	mov    %edx,%r8d
   190da:	45 09 c8             	or     %r9d,%r8d
   190dd:	41 89 d2             	mov    %edx,%r10d
   190e0:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   190e7:	45 29 d1             	sub    %r10d,%r9d
   190ea:	85 d2                	test   %edx,%edx
   190ec:	4d 0f 49 c8          	cmovns %r8,%r9
   190f0:	44 39 cb             	cmp    %r9d,%ebx
   190f3:	5b                   	pop    %rbx
   190f4:	72 48                	jb     1913e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   190f6:	f6 c1 01             	test   $0x1,%cl
   190f9:	75 03                	jne    190fe <<hyperinterval::float::F32Enclosure>::disjoint+0x6e>
   190fb:	31 c0                	xor    %eax,%eax
   190fd:	c3                   	ret
   190fe:	8b 47 04             	mov    0x4(%rdi),%eax
   19101:	8b 4e 08             	mov    0x8(%rsi),%ecx
   19104:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19109:	89 ce                	mov    %ecx,%esi
   1910b:	09 d6                	or     %edx,%esi
   1910d:	89 cf                	mov    %ecx,%edi
   1910f:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   19115:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1911b:	41 29 f8             	sub    %edi,%r8d
   1911e:	85 c9                	test   %ecx,%ecx
   19120:	4c 0f 49 c6          	cmovns %rsi,%r8
   19124:	89 c1                	mov    %eax,%ecx
   19126:	09 d1                	or     %edx,%ecx
   19128:	89 c6                	mov    %eax,%esi
   1912a:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   19130:	29 f2                	sub    %esi,%edx
   19132:	85 c0                	test   %eax,%eax
   19134:	48 0f 49 d1          	cmovns %rcx,%rdx
   19138:	41 39 d0             	cmp    %edx,%r8d
   1913b:	0f 92 c0             	setb   %al
   1913e:	c3                   	ret
   1913f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::expanded:
   19140:	48 89 f8             	mov    %rdi,%rax
   19143:	f6 06 01             	testb  $0x1,(%rsi)
   19146:	74 68                	je     191b0 <<hyperinterval::float::F32Enclosure>::expanded+0x70>
   19148:	8b 4e 04             	mov    0x4(%rsi),%ecx
   1914b:	8d 91 00 00 00 80    	lea    -0x80000000(%rcx),%edx
   19151:	85 c9                	test   %ecx,%ecx
   19153:	0f 44 d1             	cmove  %ecx,%edx
   19156:	31 c9                	xor    %ecx,%ecx
   19158:	85 d2                	test   %edx,%edx
   1915a:	0f 99 c1             	setns  %cl
   1915d:	48 8d 0c 4a          	lea    (%rdx,%rcx,2),%rcx
   19161:	48 ff c9             	dec    %rcx
   19164:	89 ca                	mov    %ecx,%edx
   19166:	f7 d2                	not    %edx
   19168:	f7 c2 00 00 80 7f    	test   $0x7f800000,%edx
   1916e:	74 35                	je     191a5 <<hyperinterval::float::F32Enclosure>::expanded+0x65>
   19170:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19175:	89 cf                	mov    %ecx,%edi
   19177:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1917d:	48 31 d1             	xor    %rdx,%rcx
   19180:	48 85 ff             	test   %rdi,%rdi
   19183:	48 0f 44 cf          	cmove  %rdi,%rcx
   19187:	8b 76 08             	mov    0x8(%rsi),%esi
   1918a:	31 ff                	xor    %edi,%edi
   1918c:	85 f6                	test   %esi,%esi
   1918e:	40 0f 99 c7          	setns  %dil
   19192:	48 8d 34 7e          	lea    (%rsi,%rdi,2),%rsi
   19196:	48 ff ce             	dec    %rsi
   19199:	89 f7                	mov    %esi,%edi
   1919b:	f7 d7                	not    %edi
   1919d:	f7 c7 00 00 80 7f    	test   $0x7f800000,%edi
   191a3:	75 12                	jne    191b7 <<hyperinterval::float::F32Enclosure>::expanded+0x77>
   191a5:	c6 40 04 03          	movb   $0x3,0x4(%rax)
   191a9:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   191af:	c3                   	ret
   191b0:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   191b6:	c3                   	ret
   191b7:	89 f7                	mov    %esi,%edi
   191b9:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   191bf:	48 0f 45 fe          	cmovne %rsi,%rdi
   191c3:	89 ce                	mov    %ecx,%esi
   191c5:	f7 d6                	not    %esi
   191c7:	f7 c6 00 00 80 7f    	test   $0x7f800000,%esi
   191cd:	74 1a                	je     191e9 <<hyperinterval::float::F32Enclosure>::expanded+0xa9>
   191cf:	31 f6                	xor    %esi,%esi
   191d1:	f7 c1 ff ff ff 7f    	test   $0x7fffffff,%ecx
   191d7:	0f 44 ce             	cmove  %esi,%ecx
   191da:	41 89 f8             	mov    %edi,%r8d
   191dd:	41 f7 d0             	not    %r8d
   191e0:	41 f7 c0 00 00 80 7f 	test   $0x7f800000,%r8d
   191e7:	75 0b                	jne    191f4 <<hyperinterval::float::F32Enclosure>::expanded+0xb4>
   191e9:	c6 40 04 00          	movb   $0x0,0x4(%rax)
   191ed:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   191f3:	c3                   	ret
   191f4:	49 89 f8             	mov    %rdi,%r8
   191f7:	49 c1 e0 21          	shl    $0x21,%r8
   191fb:	0f 45 f7             	cmovne %edi,%esi
   191fe:	89 cf                	mov    %ecx,%edi
   19200:	09 d7                	or     %edx,%edi
   19202:	41 89 c8             	mov    %ecx,%r8d
   19205:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1920c:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   19212:	45 29 c1             	sub    %r8d,%r9d
   19215:	85 c9                	test   %ecx,%ecx
   19217:	4c 0f 49 cf          	cmovns %rdi,%r9
   1921b:	89 f7                	mov    %esi,%edi
   1921d:	09 d7                	or     %edx,%edi
   1921f:	41 89 f0             	mov    %esi,%r8d
   19222:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   19229:	44 29 c2             	sub    %r8d,%edx
   1922c:	85 f6                	test   %esi,%esi
   1922e:	48 0f 49 d7          	cmovns %rdi,%rdx
   19232:	41 39 d1             	cmp    %edx,%r9d
   19235:	76 0b                	jbe    19242 <<hyperinterval::float::F32Enclosure>::expanded+0x102>
   19237:	c6 40 04 01          	movb   $0x1,0x4(%rax)
   1923b:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   19241:	c3                   	ret
   19242:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   19248:	89 48 04             	mov    %ecx,0x4(%rax)
   1924b:	89 70 08             	mov    %esi,0x8(%rax)
   1924e:	c3                   	ret
   1924f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::overlaps:
   19250:	31 c0                	xor    %eax,%eax
   19252:	83 3f 00             	cmpl   $0x0,(%rdi)
   19255:	0f 84 a1 00 00 00    	je     192fc <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1925b:	8b 0e                	mov    (%rsi),%ecx
   1925d:	85 c9                	test   %ecx,%ecx
   1925f:	0f 84 97 00 00 00    	je     192fc <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   19265:	f6 c1 01             	test   $0x1,%cl
   19268:	74 4b                	je     192b5 <<hyperinterval::float::F32Enclosure>::overlaps+0x65>
   1926a:	8b 46 04             	mov    0x4(%rsi),%eax
   1926d:	8b 57 08             	mov    0x8(%rdi),%edx
   19270:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   19276:	41 89 d1             	mov    %edx,%r9d
   19279:	45 09 c1             	or     %r8d,%r9d
   1927c:	41 89 d2             	mov    %edx,%r10d
   1927f:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   19286:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1928c:	45 29 d3             	sub    %r10d,%r11d
   1928f:	85 d2                	test   %edx,%edx
   19291:	4d 0f 49 d9          	cmovns %r9,%r11
   19295:	89 c2                	mov    %eax,%edx
   19297:	44 09 c2             	or     %r8d,%edx
   1929a:	41 89 c1             	mov    %eax,%r9d
   1929d:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   192a4:	45 29 c8             	sub    %r9d,%r8d
   192a7:	85 c0                	test   %eax,%eax
   192a9:	4c 0f 49 c2          	cmovns %rdx,%r8
   192ad:	45 39 c3             	cmp    %r8d,%r11d
   192b0:	73 03                	jae    192b5 <<hyperinterval::float::F32Enclosure>::overlaps+0x65>
   192b2:	31 c0                	xor    %eax,%eax
   192b4:	c3                   	ret
   192b5:	b0 01                	mov    $0x1,%al
   192b7:	f6 c1 01             	test   $0x1,%cl
   192ba:	74 40                	je     192fc <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   192bc:	8b 47 04             	mov    0x4(%rdi),%eax
   192bf:	8b 4e 08             	mov    0x8(%rsi),%ecx
   192c2:	ba 00 00 00 80       	mov    $0x80000000,%edx
   192c7:	89 ce                	mov    %ecx,%esi
   192c9:	09 d6                	or     %edx,%esi
   192cb:	89 cf                	mov    %ecx,%edi
   192cd:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   192d3:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   192d9:	41 29 f8             	sub    %edi,%r8d
   192dc:	85 c9                	test   %ecx,%ecx
   192de:	4c 0f 49 c6          	cmovns %rsi,%r8
   192e2:	89 c1                	mov    %eax,%ecx
   192e4:	09 d1                	or     %edx,%ecx
   192e6:	89 c6                	mov    %eax,%esi
   192e8:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   192ee:	29 f2                	sub    %esi,%edx
   192f0:	85 c0                	test   %eax,%eax
   192f2:	48 0f 49 d1          	cmovns %rcx,%rdx
   192f6:	41 39 d0             	cmp    %edx,%r8d
   192f9:	0f 93 c0             	setae  %al
   192fc:	c3                   	ret
   192fd:	cc                   	int3
   192fe:	cc                   	int3
   192ff:	cc                   	int3

<hyperinterval::float::F32Enclosure>::next_down:
   19300:	66 0f 7e c1          	movd   %xmm0,%ecx
   19304:	89 ca                	mov    %ecx,%edx
   19306:	f7 d2                	not    %edx
   19308:	b8 01 00 00 00       	mov    $0x1,%eax
   1930d:	f7 c2 00 00 80 7f    	test   $0x7f800000,%edx
   19313:	74 5a                	je     1936f <<hyperinterval::float::F32Enclosure>::next_down+0x6f>
   19315:	89 c8                	mov    %ecx,%eax
   19317:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   1931c:	48 0f 45 c1          	cmovne %rcx,%rax
   19320:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   19325:	48 31 c1             	xor    %rax,%rcx
   19328:	48 85 c0             	test   %rax,%rax
   1932b:	48 0f 44 c8          	cmove  %rax,%rcx
   1932f:	31 c0                	xor    %eax,%eax
   19331:	48 81 f9 ff ff ff 7f 	cmp    $0x7fffffff,%rcx
   19338:	0f 96 c0             	setbe  %al
   1933b:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
   1933f:	48 ff c9             	dec    %rcx
   19342:	89 ca                	mov    %ecx,%edx
   19344:	f7 d2                	not    %edx
   19346:	b8 01 03 00 00       	mov    $0x301,%eax
   1934b:	f7 c2 00 00 80 7f    	test   $0x7f800000,%edx
   19351:	74 1c                	je     1936f <<hyperinterval::float::F32Enclosure>::next_down+0x6f>
   19353:	89 c8                	mov    %ecx,%eax
   19355:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   1935a:	48 81 f1 00 00 00 80 	xor    $0xffffffff80000000,%rcx
   19361:	48 c1 e1 20          	shl    $0x20,%rcx
   19365:	48 85 c0             	test   %rax,%rax
   19368:	48 0f 44 c8          	cmove  %rax,%rcx
   1936c:	48 89 c8             	mov    %rcx,%rax
   1936f:	c3                   	ret

<hyperinterval::float::F32Enclosure>::subset_of:
   19370:	b0 01                	mov    $0x1,%al
   19372:	f6 07 01             	testb  $0x1,(%rdi)
   19375:	74 50                	je     193c7 <<hyperinterval::float::F32Enclosure>::subset_of+0x57>
   19377:	f6 06 01             	testb  $0x1,(%rsi)
   1937a:	74 49                	je     193c5 <<hyperinterval::float::F32Enclosure>::subset_of+0x55>
   1937c:	8b 4f 04             	mov    0x4(%rdi),%ecx
   1937f:	8b 56 04             	mov    0x4(%rsi),%edx
   19382:	b8 00 00 00 80       	mov    $0x80000000,%eax
   19387:	44 8d 04 02          	lea    (%rdx,%rax,1),%r8d
   1938b:	41 89 d1             	mov    %edx,%r9d
   1938e:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   19395:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1939b:	45 29 ca             	sub    %r9d,%r10d
   1939e:	85 d2                	test   %edx,%edx
   193a0:	4d 0f 49 d0          	cmovns %r8,%r10
   193a4:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   193a7:	41 89 c8             	mov    %ecx,%r8d
   193aa:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   193b1:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   193b7:	45 29 c1             	sub    %r8d,%r9d
   193ba:	85 c9                	test   %ecx,%ecx
   193bc:	4c 0f 49 ca          	cmovns %rdx,%r9
   193c0:	45 39 ca             	cmp    %r9d,%r10d
   193c3:	76 03                	jbe    193c8 <<hyperinterval::float::F32Enclosure>::subset_of+0x58>
   193c5:	31 c0                	xor    %eax,%eax
   193c7:	c3                   	ret
   193c8:	8b 4f 08             	mov    0x8(%rdi),%ecx
   193cb:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   193ce:	89 cf                	mov    %ecx,%edi
   193d0:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   193d6:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   193dc:	41 29 f8             	sub    %edi,%r8d
   193df:	85 c9                	test   %ecx,%ecx
   193e1:	4c 0f 49 c2          	cmovns %rdx,%r8
   193e5:	8b 4e 08             	mov    0x8(%rsi),%ecx
   193e8:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   193eb:	89 ce                	mov    %ecx,%esi
   193ed:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   193f3:	29 f0                	sub    %esi,%eax
   193f5:	85 c9                	test   %ecx,%ecx
   193f7:	48 0f 49 c2          	cmovns %rdx,%rax
   193fb:	41 39 c0             	cmp    %eax,%r8d
   193fe:	0f 96 c0             	setbe  %al
   19401:	c3                   	ret
   19402:	cc                   	int3
   19403:	cc                   	int3
   19404:	cc                   	int3
   19405:	cc                   	int3
   19406:	cc                   	int3
   19407:	cc                   	int3
   19408:	cc                   	int3
   19409:	cc                   	int3
   1940a:	cc                   	int3
   1940b:	cc                   	int3
   1940c:	cc                   	int3
   1940d:	cc                   	int3
   1940e:	cc                   	int3
   1940f:	cc                   	int3

<hyperinterval::ieee::Format>::add:
   19410:	48 85 c9             	test   %rcx,%rcx
   19413:	74 55                	je     1946a <<hyperinterval::ieee::Format>::add+0x5a>
   19415:	48 89 c8             	mov    %rcx,%rax
   19418:	4d 85 c0             	test   %r8,%r8
   1941b:	74 59                	je     19476 <<hyperinterval::ieee::Format>::add+0x66>
   1941d:	55                   	push   %rbp
   1941e:	41 57                	push   %r15
   19420:	41 56                	push   %r14
   19422:	41 55                	push   %r13
   19424:	41 54                	push   %r12
   19426:	53                   	push   %rbx
   19427:	48 83 ec 48          	sub    $0x48,%rsp
   1942b:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
   19430:	49 89 c7             	mov    %rax,%r15
   19433:	49 21 d7             	and    %rdx,%r15
   19436:	44 89 c9             	mov    %r9d,%ecx
   19439:	49 d3 ef             	shr    %cl,%r15
   1943c:	41 bd 01 00 00 00    	mov    $0x1,%r13d
   19442:	49 d3 e5             	shl    %cl,%r13
   19445:	49 8d 5d ff          	lea    -0x1(%r13),%rbx
   19449:	49 89 de             	mov    %rbx,%r14
   1944c:	49 21 c6             	and    %rax,%r14
   1944f:	4d 85 ff             	test   %r15,%r15
   19452:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
   19457:	49 89 d2             	mov    %rdx,%r10
   1945a:	74 26                	je     19482 <<hyperinterval::ieee::Format>::add+0x72>
   1945c:	49 d3 ea             	shr    %cl,%r10
   1945f:	4d 09 ee             	or     %r13,%r14
   19462:	49 d1 ea             	shr    $1,%r10
   19465:	45 01 ca             	add    %r9d,%r10d
   19468:	eb 27                	jmp    19491 <<hyperinterval::ieee::Format>::add+0x81>
   1946a:	4c 89 47 08          	mov    %r8,0x8(%rdi)
   1946e:	4c 89 47 10          	mov    %r8,0x10(%rdi)
   19472:	c6 07 00             	movb   $0x0,(%rdi)
   19475:	c3                   	ret
   19476:	48 89 47 08          	mov    %rax,0x8(%rdi)
   1947a:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1947e:	c6 07 00             	movb   $0x0,(%rdi)
   19481:	c3                   	ret
   19482:	49 d3 ea             	shr    %cl,%r10
   19485:	49 d1 ea             	shr    $1,%r10
   19488:	45 01 ca             	add    %r9d,%r10d
   1948b:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   19491:	45 29 d7             	sub    %r10d,%r15d
   19494:	48 85 f0             	test   %rsi,%rax
   19497:	0f 95 44 24 0f       	setne  0xf(%rsp)
   1949c:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   194a1:	49 0f bd ce          	bsr    %r14,%rcx
   194a5:	83 f1 3f             	xor    $0x3f,%ecx
   194a8:	46 8d 1c 09          	lea    (%rcx,%r9,1),%r11d
   194ac:	41 83 c3 c1          	add    $0xffffffc1,%r11d
   194b0:	45 31 e4             	xor    %r12d,%r12d
   194b3:	44 89 d9             	mov    %r11d,%ecx
   194b6:	4d 0f a5 f4          	shld   %cl,%r14,%r12
   194ba:	49 d3 e6             	shl    %cl,%r14
   194bd:	31 c9                	xor    %ecx,%ecx
   194bf:	41 f6 c3 40          	test   $0x40,%r11b
   194c3:	4d 0f 45 e6          	cmovne %r14,%r12
   194c7:	4c 0f 45 f1          	cmovne %rcx,%r14
   194cb:	4d 89 c2             	mov    %r8,%r10
   194ce:	49 21 d2             	and    %rdx,%r10
   194d1:	44 89 c9             	mov    %r9d,%ecx
   194d4:	49 d3 ea             	shr    %cl,%r10
   194d7:	41 8d 79 81          	lea    -0x7f(%r9),%edi
   194db:	45 29 df             	sub    %r11d,%r15d
   194de:	4c 21 c3             	and    %r8,%rbx
   194e1:	49 89 d3             	mov    %rdx,%r11
   194e4:	49 d3 eb             	shr    %cl,%r11
   194e7:	4d 85 d2             	test   %r10,%r10
   194ea:	74 0b                	je     194f7 <<hyperinterval::ieee::Format>::add+0xe7>
   194ec:	4c 09 eb             	or     %r13,%rbx
   194ef:	49 d1 eb             	shr    $1,%r11
   194f2:	45 01 cb             	add    %r9d,%r11d
   194f5:	eb 0c                	jmp    19503 <<hyperinterval::ieee::Format>::add+0xf3>
   194f7:	49 d1 eb             	shr    $1,%r11
   194fa:	45 01 cb             	add    %r9d,%r11d
   194fd:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   19503:	45 29 da             	sub    %r11d,%r10d
   19506:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
   1950b:	49 85 f0             	test   %rsi,%r8
   1950e:	40 0f 95 c5          	setne  %bpl
   19512:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   19517:	48 0f bd cb          	bsr    %rbx,%rcx
   1951b:	83 f1 3f             	xor    $0x3f,%ecx
   1951e:	01 f9                	add    %edi,%ecx
   19520:	83 c1 40             	add    $0x40,%ecx
   19523:	45 31 db             	xor    %r11d,%r11d
   19526:	49 0f a5 db          	shld   %cl,%rbx,%r11
   1952a:	48 d3 e3             	shl    %cl,%rbx
   1952d:	45 31 c9             	xor    %r9d,%r9d
   19530:	f6 c1 40             	test   $0x40,%cl
   19533:	4c 0f 45 db          	cmovne %rbx,%r11
   19537:	49 0f 45 d9          	cmovne %r9,%rbx
   1953b:	41 29 ca             	sub    %ecx,%r10d
   1953e:	45 39 d7             	cmp    %r10d,%r15d
   19541:	7d 17                	jge    1955a <<hyperinterval::ieee::Format>::add+0x14a>
   19543:	44 0f b6 6c 24 0f    	movzbl 0xf(%rsp),%r13d
   19549:	4d 89 f1             	mov    %r14,%r9
   1954c:	4c 89 e6             	mov    %r12,%rsi
   1954f:	4c 89 c1             	mov    %r8,%rcx
   19552:	41 89 ec             	mov    %ebp,%r12d
   19555:	48 89 f5             	mov    %rsi,%rbp
   19558:	eb 21                	jmp    1957b <<hyperinterval::ieee::Format>::add+0x16b>
   1955a:	44 89 d1             	mov    %r10d,%ecx
   1955d:	41 89 ed             	mov    %ebp,%r13d
   19560:	49 89 d9             	mov    %rbx,%r9
   19563:	4c 89 dd             	mov    %r11,%rbp
   19566:	4d 89 e3             	mov    %r12,%r11
   19569:	4c 89 f3             	mov    %r14,%rbx
   1956c:	44 0f b6 64 24 0f    	movzbl 0xf(%rsp),%r12d
   19572:	45 89 fa             	mov    %r15d,%r10d
   19575:	41 89 cf             	mov    %ecx,%r15d
   19578:	48 89 c1             	mov    %rax,%rcx
   1957b:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
   19580:	45 29 fa             	sub    %r15d,%r10d
   19583:	41 83 fa 4a          	cmp    $0x4a,%r10d
   19587:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   1958c:	7e 53                	jle    195e1 <<hyperinterval::ieee::Format>::add+0x1d1>
   1958e:	48 89 c8             	mov    %rcx,%rax
   19591:	45 84 ed             	test   %r13b,%r13b
   19594:	0f 84 8e 00 00 00    	je     19628 <<hyperinterval::ieee::Format>::add+0x218>
   1959a:	48 31 f0             	xor    %rsi,%rax
   1959d:	49 89 c0             	mov    %rax,%r8
   195a0:	49 21 f0             	and    %rsi,%r8
   195a3:	45 31 c9             	xor    %r9d,%r9d
   195a6:	49 f7 d8             	neg    %r8
   195a9:	41 0f 93 c1          	setae  %r9b
   195ad:	4a 8d 04 48          	lea    (%rax,%r9,2),%rax
   195b1:	48 ff c8             	dec    %rax
   195b4:	49 89 c0             	mov    %rax,%r8
   195b7:	49 f7 d0             	not    %r8
   195ba:	49 85 d0             	test   %rdx,%r8
   195bd:	0f 84 84 00 00 00    	je     19647 <<hyperinterval::ieee::Format>::add+0x237>
   195c3:	48 8d 56 ff          	lea    -0x1(%rsi),%rdx
   195c7:	48 21 c2             	and    %rax,%rdx
   195ca:	48 31 f0             	xor    %rsi,%rax
   195cd:	48 85 d2             	test   %rdx,%rdx
   195d0:	48 0f 44 c2          	cmove  %rdx,%rax
   195d4:	48 89 47 08          	mov    %rax,0x8(%rdi)
   195d8:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
   195dc:	e9 ad 00 00 00       	jmp    1968e <<hyperinterval::ieee::Format>::add+0x27e>
   195e1:	49 85 f0             	test   %rsi,%r8
   195e4:	41 0f 95 c0          	setne  %r8b
   195e8:	48 85 f0             	test   %rsi,%rax
   195eb:	41 0f 95 c6          	setne  %r14b
   195ef:	44 89 d1             	mov    %r10d,%ecx
   195f2:	49 0f a5 db          	shld   %cl,%rbx,%r11
   195f6:	48 d3 e3             	shl    %cl,%rbx
   195f9:	31 c0                	xor    %eax,%eax
   195fb:	41 f6 c2 40          	test   $0x40,%r10b
   195ff:	4c 0f 45 db          	cmovne %rbx,%r11
   19603:	48 0f 44 c3          	cmove  %rbx,%rax
   19607:	45 30 c6             	xor    %r8b,%r14b
   1960a:	74 42                	je     1964e <<hyperinterval::ieee::Format>::add+0x23e>
   1960c:	4c 39 c8             	cmp    %r9,%rax
   1960f:	4c 89 d9             	mov    %r11,%rcx
   19612:	48 19 e9             	sbb    %rbp,%rcx
   19615:	73 3f                	jae    19656 <<hyperinterval::ieee::Format>::add+0x246>
   19617:	49 29 c1             	sub    %rax,%r9
   1961a:	4c 19 dd             	sbb    %r11,%rbp
   1961d:	45 89 ec             	mov    %r13d,%r12d
   19620:	4c 89 c8             	mov    %r9,%rax
   19623:	49 89 eb             	mov    %rbp,%r11
   19626:	eb 34                	jmp    1965c <<hyperinterval::ieee::Format>::add+0x24c>
   19628:	48 21 f0             	and    %rsi,%rax
   1962b:	45 31 c0             	xor    %r8d,%r8d
   1962e:	48 f7 d8             	neg    %rax
   19631:	41 0f 93 c0          	setae  %r8b
   19635:	4a 8d 04 41          	lea    (%rcx,%r8,2),%rax
   19639:	48 ff c8             	dec    %rax
   1963c:	49 89 c0             	mov    %rax,%r8
   1963f:	49 f7 d0             	not    %r8
   19642:	49 85 d0             	test   %rdx,%r8
   19645:	75 35                	jne    1967c <<hyperinterval::ieee::Format>::add+0x26c>
   19647:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   1964c:	eb 43                	jmp    19691 <<hyperinterval::ieee::Format>::add+0x281>
   1964e:	4c 01 c8             	add    %r9,%rax
   19651:	49 11 eb             	adc    %rbp,%r11
   19654:	eb 06                	jmp    1965c <<hyperinterval::ieee::Format>::add+0x24c>
   19656:	4c 29 c8             	sub    %r9,%rax
   19659:	49 19 eb             	sbb    %rbp,%r11
   1965c:	44 88 64 24 34       	mov    %r12b,0x34(%rsp)
   19661:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   19666:	4c 89 5c 24 28       	mov    %r11,0x28(%rsp)
   1966b:	44 89 7c 24 30       	mov    %r15d,0x30(%rsp)
   19670:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
   19675:	e8 76 08 00 00       	call   19ef0 <<hyperinterval::ieee::Format>::rounded>
   1967a:	eb 15                	jmp    19691 <<hyperinterval::ieee::Format>::add+0x281>
   1967c:	48 ff ce             	dec    %rsi
   1967f:	48 21 c6             	and    %rax,%rsi
   19682:	48 0f 45 f0          	cmovne %rax,%rsi
   19686:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1968a:	48 89 77 10          	mov    %rsi,0x10(%rdi)
   1968e:	c6 07 00             	movb   $0x0,(%rdi)
   19691:	48 83 c4 48          	add    $0x48,%rsp
   19695:	5b                   	pop    %rbx
   19696:	41 5c                	pop    %r12
   19698:	41 5d                	pop    %r13
   1969a:	41 5e                	pop    %r14
   1969c:	41 5f                	pop    %r15
   1969e:	5d                   	pop    %rbp
   1969f:	c3                   	ret

<hyperinterval::ieee::Format>::div:
   196a0:	55                   	push   %rbp
   196a1:	41 57                	push   %r15
   196a3:	41 56                	push   %r14
   196a5:	41 55                	push   %r13
   196a7:	41 54                	push   %r12
   196a9:	53                   	push   %rbx
   196aa:	48 83 ec 38          	sub    $0x38,%rsp
   196ae:	4d 85 c0             	test   %r8,%r8
   196b1:	74 47                	je     196fa <<hyperinterval::ieee::Format>::div+0x5a>
   196b3:	48 85 c9             	test   %rcx,%rcx
   196b6:	74 4c                	je     19704 <<hyperinterval::ieee::Format>::div+0x64>
   196b8:	f3 4c 0f bc f2       	tzcnt  %rdx,%r14
   196bd:	49 89 c9             	mov    %rcx,%r9
   196c0:	49 21 d1             	and    %rdx,%r9
   196c3:	48 89 c8             	mov    %rcx,%rax
   196c6:	44 89 f1             	mov    %r14d,%ecx
   196c9:	49 d3 e9             	shr    %cl,%r9
   196cc:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   196d2:	49 d3 e2             	shl    %cl,%r10
   196d5:	49 8d 6a ff          	lea    -0x1(%r10),%rbp
   196d9:	49 89 ec             	mov    %rbp,%r12
   196dc:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   196e1:	49 21 c4             	and    %rax,%r12
   196e4:	48 89 d0             	mov    %rdx,%rax
   196e7:	48 d3 e8             	shr    %cl,%rax
   196ea:	4d 85 c9             	test   %r9,%r9
   196ed:	74 24                	je     19713 <<hyperinterval::ieee::Format>::div+0x73>
   196ef:	4d 09 d4             	or     %r10,%r12
   196f2:	48 d1 e8             	shr    $1,%rax
   196f5:	44 01 f0             	add    %r14d,%eax
   196f8:	eb 25                	jmp    1971f <<hyperinterval::ieee::Format>::div+0x7f>
   196fa:	66 c7 07 01 04       	movw   $0x401,(%rdi)
   196ff:	e9 ae 03 00 00       	jmp    19ab2 <<hyperinterval::ieee::Format>::div+0x412>
   19704:	c6 07 00             	movb   $0x0,(%rdi)
   19707:	0f 57 c0             	xorps  %xmm0,%xmm0
   1970a:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1970e:	e9 9f 03 00 00       	jmp    19ab2 <<hyperinterval::ieee::Format>::div+0x412>
   19713:	48 d1 e8             	shr    $1,%rax
   19716:	44 01 f0             	add    %r14d,%eax
   19719:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1971f:	41 29 c1             	sub    %eax,%r9d
   19722:	4d 89 c3             	mov    %r8,%r11
   19725:	49 21 d3             	and    %rdx,%r11
   19728:	44 89 f1             	mov    %r14d,%ecx
   1972b:	49 d3 eb             	shr    %cl,%r11
   1972e:	4c 21 c5             	and    %r8,%rbp
   19731:	48 89 d0             	mov    %rdx,%rax
   19734:	48 d3 e8             	shr    %cl,%rax
   19737:	4d 85 db             	test   %r11,%r11
   1973a:	74 0e                	je     1974a <<hyperinterval::ieee::Format>::div+0xaa>
   1973c:	4c 09 d5             	or     %r10,%rbp
   1973f:	48 d1 e8             	shr    $1,%rax
   19742:	44 01 f0             	add    %r14d,%eax
   19745:	44 29 d8             	sub    %r11d,%eax
   19748:	eb 08                	jmp    19752 <<hyperinterval::ieee::Format>::div+0xb2>
   1974a:	48 d1 e8             	shr    $1,%rax
   1974d:	44 01 f0             	add    %r14d,%eax
   19750:	ff c8                	dec    %eax
   19752:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   19757:	41 ba 7f 00 00 00    	mov    $0x7f,%r10d
   1975d:	4c 0f bd d5          	bsr    %rbp,%r10
   19761:	41 83 f2 3f          	xor    $0x3f,%r10d
   19765:	41 83 c2 40          	add    $0x40,%r10d
   19769:	49 0f bd cc          	bsr    %r12,%rcx
   1976d:	83 f1 3f             	xor    $0x3f,%ecx
   19770:	45 89 d7             	mov    %r10d,%r15d
   19773:	41 29 cf             	sub    %ecx,%r15d
   19776:	41 83 c7 c0          	add    $0xffffffc0,%r15d
   1977a:	78 26                	js     197a2 <<hyperinterval::ieee::Format>::div+0x102>
   1977c:	45 31 db             	xor    %r11d,%r11d
   1977f:	44 89 f9             	mov    %r15d,%ecx
   19782:	49 0f a5 eb          	shld   %cl,%rbp,%r11
   19786:	31 db                	xor    %ebx,%ebx
   19788:	49 89 ed             	mov    %rbp,%r13
   1978b:	49 d3 e5             	shl    %cl,%r13
   1978e:	41 f6 c7 40          	test   $0x40,%r15b
   19792:	4d 0f 45 dd          	cmovne %r13,%r11
   19796:	4c 0f 45 eb          	cmovne %rbx,%r13
   1979a:	4d 39 ec             	cmp    %r13,%r12
   1979d:	4c 19 db             	sbb    %r11,%rbx
   197a0:	eb 26                	jmp    197c8 <<hyperinterval::ieee::Format>::div+0x128>
   197a2:	44 89 f9             	mov    %r15d,%ecx
   197a5:	f6 d9                	neg    %cl
   197a7:	45 31 db             	xor    %r11d,%r11d
   197aa:	4d 0f a5 e3          	shld   %cl,%r12,%r11
   197ae:	31 db                	xor    %ebx,%ebx
   197b0:	4d 89 e5             	mov    %r12,%r13
   197b3:	49 d3 e5             	shl    %cl,%r13
   197b6:	f6 c1 40             	test   $0x40,%cl
   197b9:	4d 0f 45 dd          	cmovne %r13,%r11
   197bd:	4c 0f 45 eb          	cmovne %rbx,%r13
   197c1:	49 39 ed             	cmp    %rbp,%r13
   197c4:	49 83 db 00          	sbb    $0x0,%r11
   197c8:	41 0f 92 c3          	setb   %r11b
   197cc:	44 89 f1             	mov    %r14d,%ecx
   197cf:	48 d3 ea             	shr    %cl,%rdx
   197d2:	44 01 c8             	add    %r9d,%eax
   197d5:	41 01 c7             	add    %eax,%r15d
   197d8:	41 0f b6 cb          	movzbl %r11b,%ecx
   197dc:	41 29 cf             	sub    %ecx,%r15d
   197df:	48 d1 ea             	shr    $1,%rdx
   197e2:	41 39 d7             	cmp    %edx,%r15d
   197e5:	0f 8f 0e 02 00 00    	jg     199f9 <<hyperinterval::ieee::Format>::div+0x359>
   197eb:	45 8d 0c 16          	lea    (%r14,%rdx,1),%r9d
   197ef:	b9 01 00 00 00       	mov    $0x1,%ecx
   197f4:	4c 89 4c 24 08       	mov    %r9,0x8(%rsp)
   197f9:	44 29 c9             	sub    %r9d,%ecx
   197fc:	45 29 f7             	sub    %r14d,%r15d
   197ff:	41 39 cf             	cmp    %ecx,%r15d
   19802:	44 0f 4e f9          	cmovle %ecx,%r15d
   19806:	44 29 f8             	sub    %r15d,%eax
   19809:	78 61                	js     1986c <<hyperinterval::ieee::Format>::div+0x1cc>
   1980b:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   19810:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
   19815:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
   1981a:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
   1981f:	48 85 ed             	test   %rbp,%rbp
   19822:	0f 84 99 02 00 00    	je     19ac1 <<hyperinterval::ieee::Format>::div+0x421>
   19828:	45 31 ed             	xor    %r13d,%r13d
   1982b:	89 c1                	mov    %eax,%ecx
   1982d:	4d 0f a5 e5          	shld   %cl,%r12,%r13
   19831:	31 d2                	xor    %edx,%edx
   19833:	49 d3 e4             	shl    %cl,%r12
   19836:	a8 40                	test   $0x40,%al
   19838:	4d 0f 45 ec          	cmovne %r12,%r13
   1983c:	4c 0f 45 e2          	cmovne %rdx,%r12
   19840:	4c 89 e7             	mov    %r12,%rdi
   19843:	4c 89 ee             	mov    %r13,%rsi
   19846:	48 89 ea             	mov    %rbp,%rdx
   19849:	31 c9                	xor    %ecx,%ecx
   1984b:	ff 15 77 17 04 00    	call   *0x41777(%rip)        # 5afc8 <_DYNAMIC+0x400>
   19851:	49 89 c2             	mov    %rax,%r10
   19854:	49 89 d1             	mov    %rdx,%r9
   19857:	48 89 d1             	mov    %rdx,%rcx
   1985a:	48 0f af cd          	imul   %rbp,%rcx
   1985e:	48 f7 e5             	mul    %rbp
   19861:	48 01 ca             	add    %rcx,%rdx
   19864:	49 29 c4             	sub    %rax,%r12
   19867:	49 19 d5             	sbb    %rdx,%r13
   1986a:	eb 79                	jmp    198e5 <<hyperinterval::ieee::Format>::div+0x245>
   1986c:	f7 d8                	neg    %eax
   1986e:	44 39 d0             	cmp    %r10d,%eax
   19871:	7e 07                	jle    1987a <<hyperinterval::ieee::Format>::div+0x1da>
   19873:	b3 01                	mov    $0x1,%bl
   19875:	e9 df 00 00 00       	jmp    19959 <<hyperinterval::ieee::Format>::div+0x2b9>
   1987a:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1987f:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
   19884:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
   19889:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
   1988e:	31 db                	xor    %ebx,%ebx
   19890:	89 c1                	mov    %eax,%ecx
   19892:	48 0f a5 eb          	shld   %cl,%rbp,%rbx
   19896:	48 d3 e5             	shl    %cl,%rbp
   19899:	31 c9                	xor    %ecx,%ecx
   1989b:	a8 40                	test   $0x40,%al
   1989d:	48 0f 45 dd          	cmovne %rbp,%rbx
   198a1:	48 0f 45 e9          	cmovne %rcx,%rbp
   198a5:	48 89 e8             	mov    %rbp,%rax
   198a8:	48 09 d8             	or     %rbx,%rax
   198ab:	0f 84 1d 02 00 00    	je     19ace <<hyperinterval::ieee::Format>::div+0x42e>
   198b1:	45 31 ed             	xor    %r13d,%r13d
   198b4:	4c 89 e7             	mov    %r12,%rdi
   198b7:	31 f6                	xor    %esi,%esi
   198b9:	48 89 ea             	mov    %rbp,%rdx
   198bc:	48 89 d9             	mov    %rbx,%rcx
   198bf:	ff 15 03 17 04 00    	call   *0x41703(%rip)        # 5afc8 <_DYNAMIC+0x400>
   198c5:	49 89 c2             	mov    %rax,%r10
   198c8:	49 89 d1             	mov    %rdx,%r9
   198cb:	48 0f af d8          	imul   %rax,%rbx
   198cf:	48 f7 e5             	mul    %rbp
   198d2:	48 01 da             	add    %rbx,%rdx
   198d5:	4c 89 c9             	mov    %r9,%rcx
   198d8:	48 0f af cd          	imul   %rbp,%rcx
   198dc:	48 01 d1             	add    %rdx,%rcx
   198df:	49 29 c4             	sub    %rax,%r12
   198e2:	49 19 cd             	sbb    %rcx,%r13
   198e5:	4d 09 ec             	or     %r13,%r12
   198e8:	0f 95 c3             	setne  %bl
   198eb:	4c 89 d0             	mov    %r10,%rax
   198ee:	4c 09 c8             	or     %r9,%rax
   198f1:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
   198f6:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   198fb:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
   19900:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   19905:	74 52                	je     19959 <<hyperinterval::ieee::Format>::div+0x2b9>
   19907:	49 0f bd c1          	bsr    %r9,%rax
   1990b:	83 f0 3f             	xor    $0x3f,%eax
   1990e:	4d 0f bd da          	bsr    %r10,%r11
   19912:	41 83 f3 3f          	xor    $0x3f,%r11d
   19916:	41 83 cb 40          	or     $0x40,%r11d
   1991a:	4d 85 c9             	test   %r9,%r9
   1991d:	44 0f 45 d8          	cmovne %eax,%r11d
   19921:	41 83 f3 7f          	xor    $0x7f,%r11d
   19925:	43 8d 2c 3b          	lea    (%r11,%r15,1),%ebp
   19929:	39 d5                	cmp    %edx,%ebp
   1992b:	0f 8f c8 00 00 00    	jg     199f9 <<hyperinterval::ieee::Format>::div+0x359>
   19931:	b8 01 00 00 00       	mov    $0x1,%eax
   19936:	29 d0                	sub    %edx,%eax
   19938:	39 c5                	cmp    %eax,%ebp
   1993a:	7d 28                	jge    19964 <<hyperinterval::ieee::Format>::div+0x2c4>
   1993c:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19941:	42 8d 0c 38          	lea    (%rax,%r15,1),%ecx
   19945:	fe c9                	dec    %cl
   19947:	4c 89 d0             	mov    %r10,%rax
   1994a:	48 d3 e0             	shl    %cl,%rax
   1994d:	45 31 db             	xor    %r11d,%r11d
   19950:	f6 c1 40             	test   $0x40,%cl
   19953:	4c 0f 44 d8          	cmove  %rax,%r11
   19957:	eb 68                	jmp    199c1 <<hyperinterval::ieee::Format>::div+0x321>
   19959:	45 31 d2             	xor    %r10d,%r10d
   1995c:	45 31 c9             	xor    %r9d,%r9d
   1995f:	45 31 db             	xor    %r11d,%r11d
   19962:	eb 5d                	jmp    199c1 <<hyperinterval::ieee::Format>::div+0x321>
   19964:	44 89 f1             	mov    %r14d,%ecx
   19967:	44 29 d9             	sub    %r11d,%ecx
   1996a:	4d 89 d4             	mov    %r10,%r12
   1996d:	49 d3 e4             	shl    %cl,%r12
   19970:	89 c8                	mov    %ecx,%eax
   19972:	f7 d8                	neg    %eax
   19974:	45 31 ed             	xor    %r13d,%r13d
   19977:	f6 c1 40             	test   $0x40,%cl
   1997a:	4d 0f 44 ec          	cmove  %r12,%r13
   1997e:	4d 89 d4             	mov    %r10,%r12
   19981:	89 c1                	mov    %eax,%ecx
   19983:	4d 0f ad cc          	shrd   %cl,%r9,%r12
   19987:	88 5c 24 07          	mov    %bl,0x7(%rsp)
   1998b:	4c 89 cb             	mov    %r9,%rbx
   1998e:	48 d3 eb             	shr    %cl,%rbx
   19991:	a8 40                	test   $0x40,%al
   19993:	49 0f 44 dc          	cmove  %r12,%rbx
   19997:	45 39 de             	cmp    %r11d,%r14d
   1999a:	49 0f 43 dd          	cmovae %r13,%rbx
   1999e:	01 d5                	add    %edx,%ebp
   199a0:	48 63 c5             	movslq %ebp,%rax
   199a3:	44 89 f1             	mov    %r14d,%ecx
   199a6:	48 d3 e0             	shl    %cl,%rax
   199a9:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   199b0:	49 d3 e3             	shl    %cl,%r11
   199b3:	49 f7 d3             	not    %r11
   199b6:	49 21 db             	and    %rbx,%r11
   199b9:	0f b6 5c 24 07       	movzbl 0x7(%rsp),%ebx
   199be:	49 09 c3             	or     %rax,%r11
   199c1:	0f b6 db             	movzbl %bl,%ebx
   199c4:	4c 01 d3             	add    %r10,%rbx
   199c7:	49 83 d1 00          	adc    $0x0,%r9
   199cb:	48 89 d8             	mov    %rbx,%rax
   199ce:	4c 09 c8             	or     %r9,%rax
   199d1:	74 30                	je     19a03 <<hyperinterval::ieee::Format>::div+0x363>
   199d3:	49 0f bd c1          	bsr    %r9,%rax
   199d7:	83 f0 3f             	xor    $0x3f,%eax
   199da:	4c 0f bd d3          	bsr    %rbx,%r10
   199de:	41 83 f2 3f          	xor    $0x3f,%r10d
   199e2:	41 83 ca 40          	or     $0x40,%r10d
   199e6:	4d 85 c9             	test   %r9,%r9
   199e9:	44 0f 45 d0          	cmovne %eax,%r10d
   199ed:	41 83 f2 7f          	xor    $0x7f,%r10d
   199f1:	43 8d 2c 3a          	lea    (%r10,%r15,1),%ebp
   199f5:	39 d5                	cmp    %edx,%ebp
   199f7:	7e 0e                	jle    19a07 <<hyperinterval::ieee::Format>::div+0x367>
   199f9:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   199fe:	e9 af 00 00 00       	jmp    19ab2 <<hyperinterval::ieee::Format>::div+0x412>
   19a03:	31 c0                	xor    %eax,%eax
   19a05:	eb 71                	jmp    19a78 <<hyperinterval::ieee::Format>::div+0x3d8>
   19a07:	b8 01 00 00 00       	mov    $0x1,%eax
   19a0c:	29 d0                	sub    %edx,%eax
   19a0e:	39 c5                	cmp    %eax,%ebp
   19a10:	7d 18                	jge    19a2a <<hyperinterval::ieee::Format>::div+0x38a>
   19a12:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19a17:	44 01 f9             	add    %r15d,%ecx
   19a1a:	fe c9                	dec    %cl
   19a1c:	48 d3 e3             	shl    %cl,%rbx
   19a1f:	31 c0                	xor    %eax,%eax
   19a21:	f6 c1 40             	test   $0x40,%cl
   19a24:	48 0f 44 c3          	cmove  %rbx,%rax
   19a28:	eb 4e                	jmp    19a78 <<hyperinterval::ieee::Format>::div+0x3d8>
   19a2a:	44 89 f1             	mov    %r14d,%ecx
   19a2d:	44 29 d1             	sub    %r10d,%ecx
   19a30:	89 c8                	mov    %ecx,%eax
   19a32:	f7 d8                	neg    %eax
   19a34:	49 89 df             	mov    %rbx,%r15
   19a37:	49 d3 e7             	shl    %cl,%r15
   19a3a:	45 31 e4             	xor    %r12d,%r12d
   19a3d:	f6 c1 40             	test   $0x40,%cl
   19a40:	4d 0f 44 e7          	cmove  %r15,%r12
   19a44:	89 c1                	mov    %eax,%ecx
   19a46:	4c 0f ad cb          	shrd   %cl,%r9,%rbx
   19a4a:	49 d3 e9             	shr    %cl,%r9
   19a4d:	a8 40                	test   $0x40,%al
   19a4f:	4c 0f 44 cb          	cmove  %rbx,%r9
   19a53:	45 39 d6             	cmp    %r10d,%r14d
   19a56:	4d 0f 43 cc          	cmovae %r12,%r9
   19a5a:	01 d5                	add    %edx,%ebp
   19a5c:	48 63 d5             	movslq %ebp,%rdx
   19a5f:	44 89 f1             	mov    %r14d,%ecx
   19a62:	48 d3 e2             	shl    %cl,%rdx
   19a65:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   19a6c:	48 d3 e0             	shl    %cl,%rax
   19a6f:	48 f7 d0             	not    %rax
   19a72:	4c 21 c8             	and    %r9,%rax
   19a75:	48 09 d0             	or     %rdx,%rax
   19a78:	48 85 74 24 30       	test   %rsi,0x30(%rsp)
   19a7d:	0f 95 c1             	setne  %cl
   19a80:	49 85 f0             	test   %rsi,%r8
   19a83:	0f 94 c2             	sete   %dl
   19a86:	30 ca                	xor    %cl,%dl
   19a88:	75 1d                	jne    19aa7 <<hyperinterval::ieee::Format>::div+0x407>
   19a8a:	48 89 c1             	mov    %rax,%rcx
   19a8d:	48 31 f1             	xor    %rsi,%rcx
   19a90:	48 85 c0             	test   %rax,%rax
   19a93:	48 0f 44 c8          	cmove  %rax,%rcx
   19a97:	4c 31 de             	xor    %r11,%rsi
   19a9a:	4d 85 db             	test   %r11,%r11
   19a9d:	49 0f 44 f3          	cmove  %r11,%rsi
   19aa1:	48 89 f0             	mov    %rsi,%rax
   19aa4:	49 89 cb             	mov    %rcx,%r11
   19aa7:	4c 89 5f 08          	mov    %r11,0x8(%rdi)
   19aab:	48 89 47 10          	mov    %rax,0x10(%rdi)
   19aaf:	c6 07 00             	movb   $0x0,(%rdi)
   19ab2:	48 83 c4 38          	add    $0x38,%rsp
   19ab6:	5b                   	pop    %rbx
   19ab7:	41 5c                	pop    %r12
   19ab9:	41 5d                	pop    %r13
   19abb:	41 5e                	pop    %r14
   19abd:	41 5f                	pop    %r15
   19abf:	5d                   	pop    %rbp
   19ac0:	c3                   	ret
   19ac1:	48 8d 3d f8 f2 03 00 	lea    0x3f2f8(%rip),%rdi        # 58dc0 <__frame_dummy_init_array_entry+0x1c0>
   19ac8:	ff 15 02 15 04 00    	call   *0x41502(%rip)        # 5afd0 <_DYNAMIC+0x408>
   19ace:	48 8d 3d d3 f2 03 00 	lea    0x3f2d3(%rip),%rdi        # 58da8 <__frame_dummy_init_array_entry+0x1a8>
   19ad5:	ff 15 f5 14 04 00    	call   *0x414f5(%rip)        # 5afd0 <_DYNAMIC+0x408>
   19adb:	cc                   	int3
   19adc:	cc                   	int3
   19add:	cc                   	int3
   19ade:	cc                   	int3
   19adf:	cc                   	int3

<hyperinterval::ieee::Format>::power:
   19ae0:	55                   	push   %rbp
   19ae1:	41 57                	push   %r15
   19ae3:	41 56                	push   %r14
   19ae5:	41 55                	push   %r13
   19ae7:	41 54                	push   %r12
   19ae9:	53                   	push   %rbx
   19aea:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   19af1:	49 89 ca             	mov    %rcx,%r10
   19af4:	49 89 d6             	mov    %rdx,%r14
   19af7:	48 85 f1             	test   %rsi,%rcx
   19afa:	0f 95 c0             	setne  %al
   19afd:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
   19b02:	49 89 d3             	mov    %rdx,%r11
   19b05:	44 89 c9             	mov    %r9d,%ecx
   19b08:	49 d3 eb             	shr    %cl,%r11
   19b0b:	49 d1 eb             	shr    $1,%r11
   19b0e:	49 63 d3             	movslq %r11d,%rdx
   19b11:	48 d3 e2             	shl    %cl,%rdx
   19b14:	45 85 c0             	test   %r8d,%r8d
   19b17:	0f 84 6b 03 00 00    	je     19e88 <<hyperinterval::ieee::Format>::power+0x3a8>
   19b1d:	88 44 24 07          	mov    %al,0x7(%rsp)
   19b21:	48 89 7c 24 50       	mov    %rdi,0x50(%rsp)
   19b26:	48 8d 46 ff          	lea    -0x1(%rsi),%rax
   19b2a:	49 21 c2             	and    %rax,%r10
   19b2d:	bb 01 00 00 00       	mov    $0x1,%ebx
   19b32:	44 89 c9             	mov    %r9d,%ecx
   19b35:	48 d3 e3             	shl    %cl,%rbx
   19b38:	48 8d 43 ff          	lea    -0x1(%rbx),%rax
   19b3c:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   19b41:	45 01 cb             	add    %r9d,%r11d
   19b44:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   19b4a:	45 29 df             	sub    %r11d,%r15d
   19b4d:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   19b52:	4c 8d 64 24 30       	lea    0x30(%rsp),%r12
   19b57:	44 89 44 24 74       	mov    %r8d,0x74(%rsp)
   19b5c:	44 89 c5             	mov    %r8d,%ebp
   19b5f:	4c 89 54 24 68       	mov    %r10,0x68(%rsp)
   19b64:	4d 89 d5             	mov    %r10,%r13
   19b67:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   19b6c:	48 89 54 24 60       	mov    %rdx,0x60(%rsp)
   19b71:	4c 89 8c 24 80 00 00 	mov    %r9,0x80(%rsp)
   19b78:	00 
   19b79:	48 89 5c 24 78       	mov    %rbx,0x78(%rsp)
   19b7e:	44 89 7c 24 0c       	mov    %r15d,0xc(%rsp)
   19b83:	48 89 b4 24 88 00 00 	mov    %rsi,0x88(%rsp)
   19b8a:	00 
   19b8b:	40 f6 c5 01          	test   $0x1,%bpl
   19b8f:	75 2f                	jne    19bc0 <<hyperinterval::ieee::Format>::power+0xe0>
   19b91:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   19b98:	0f 1f 84 00 00 00 00 
   19b9f:	00 
   19ba0:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   19ba5:	d1 ed                	shr    $1,%ebp
   19ba7:	0f 85 bc 01 00 00    	jne    19d69 <<hyperinterval::ieee::Format>::power+0x289>
   19bad:	e9 19 03 00 00       	jmp    19ecb <<hyperinterval::ieee::Format>::power+0x3eb>
   19bb2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   19bb9:	1f 84 00 00 00 00 00 
   19bc0:	89 6c 24 08          	mov    %ebp,0x8(%rsp)
   19bc4:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   19bc9:	4c 89 c0             	mov    %r8,%rax
   19bcc:	4c 21 f0             	and    %r14,%rax
   19bcf:	44 89 c9             	mov    %r9d,%ecx
   19bd2:	48 d3 e8             	shr    %cl,%rax
   19bd5:	4c 89 c1             	mov    %r8,%rcx
   19bd8:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   19bdd:	48 21 e9             	and    %rbp,%rcx
   19be0:	41 89 c2             	mov    %eax,%r10d
   19be3:	45 29 da             	sub    %r11d,%r10d
   19be6:	48 85 c0             	test   %rax,%rax
   19be9:	45 0f 44 d7          	cmove  %r15d,%r10d
   19bed:	48 0f 45 c3          	cmovne %rbx,%rax
   19bf1:	48 09 c8             	or     %rcx,%rax
   19bf4:	4c 89 ea             	mov    %r13,%rdx
   19bf7:	4c 21 f2             	and    %r14,%rdx
   19bfa:	44 89 c9             	mov    %r9d,%ecx
   19bfd:	48 d3 ea             	shr    %cl,%rdx
   19c00:	4c 89 e9             	mov    %r13,%rcx
   19c03:	48 21 e9             	and    %rbp,%rcx
   19c06:	89 d5                	mov    %edx,%ebp
   19c08:	44 29 dd             	sub    %r11d,%ebp
   19c0b:	48 85 d2             	test   %rdx,%rdx
   19c0e:	41 0f 44 ef          	cmove  %r15d,%ebp
   19c12:	48 0f 45 d3          	cmovne %rbx,%rdx
   19c16:	48 09 ca             	or     %rcx,%rdx
   19c19:	49 85 f0             	test   %rsi,%r8
   19c1c:	0f 95 c1             	setne  %cl
   19c1f:	4c 89 ac 24 90 00 00 	mov    %r13,0x90(%rsp)
   19c26:	00 
   19c27:	49 85 f5             	test   %rsi,%r13
   19c2a:	41 0f 95 c0          	setne  %r8b
   19c2e:	48 f7 e2             	mul    %rdx
   19c31:	41 30 c8             	xor    %cl,%r8b
   19c34:	44 01 d5             	add    %r10d,%ebp
   19c37:	44 88 44 24 44       	mov    %r8b,0x44(%rsp)
   19c3c:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   19c41:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   19c46:	89 6c 24 40          	mov    %ebp,0x40(%rsp)
   19c4a:	4c 89 f2             	mov    %r14,%rdx
   19c4d:	4c 89 e1             	mov    %r12,%rcx
   19c50:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   19c55:	4d 89 dd             	mov    %r11,%r13
   19c58:	4d 89 cc             	mov    %r9,%r12
   19c5b:	e8 90 02 00 00       	call   19ef0 <<hyperinterval::ieee::Format>::rounded>
   19c60:	80 7c 24 18 00       	cmpb   $0x0,0x18(%rsp)
   19c65:	0f 85 0c 02 00 00    	jne    19e77 <<hyperinterval::ieee::Format>::power+0x397>
   19c6b:	4c 8b 4c 24 58       	mov    0x58(%rsp),%r9
   19c70:	4c 89 c8             	mov    %r9,%rax
   19c73:	4c 21 f0             	and    %r14,%rax
   19c76:	4d 89 f0             	mov    %r14,%r8
   19c79:	44 89 e1             	mov    %r12d,%ecx
   19c7c:	48 d3 e8             	shr    %cl,%rax
   19c7f:	4c 89 ca             	mov    %r9,%rdx
   19c82:	48 21 ea             	and    %rbp,%rdx
   19c85:	89 c6                	mov    %eax,%esi
   19c87:	4d 89 ee             	mov    %r13,%r14
   19c8a:	44 29 f6             	sub    %r14d,%esi
   19c8d:	48 85 c0             	test   %rax,%rax
   19c90:	41 0f 44 f7          	cmove  %r15d,%esi
   19c94:	48 0f 45 c3          	cmovne %rbx,%rax
   19c98:	4c 8b 54 24 68       	mov    0x68(%rsp),%r10
   19c9d:	4c 89 d7             	mov    %r10,%rdi
   19ca0:	4c 21 c7             	and    %r8,%rdi
   19ca3:	4d 89 c5             	mov    %r8,%r13
   19ca6:	48 d3 ef             	shr    %cl,%rdi
   19ca9:	48 09 d0             	or     %rdx,%rax
   19cac:	4c 89 d1             	mov    %r10,%rcx
   19caf:	48 21 e9             	and    %rbp,%rcx
   19cb2:	41 89 f8             	mov    %edi,%r8d
   19cb5:	45 29 f0             	sub    %r14d,%r8d
   19cb8:	48 85 ff             	test   %rdi,%rdi
   19cbb:	45 0f 44 c7          	cmove  %r15d,%r8d
   19cbf:	48 0f 45 fb          	cmovne %rbx,%rdi
   19cc3:	48 09 cf             	or     %rcx,%rdi
   19cc6:	4c 8b bc 24 88 00 00 	mov    0x88(%rsp),%r15
   19ccd:	00 
   19cce:	4d 85 f9             	test   %r15,%r9
   19cd1:	0f 95 c1             	setne  %cl
   19cd4:	4d 85 fa             	test   %r15,%r10
   19cd7:	41 0f 95 c1          	setne  %r9b
   19cdb:	41 30 c9             	xor    %cl,%r9b
   19cde:	48 f7 e7             	mul    %rdi
   19ce1:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
   19ce6:	41 01 f0             	add    %esi,%r8d
   19ce9:	44 88 4c 24 44       	mov    %r9b,0x44(%rsp)
   19cee:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   19cf3:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   19cf8:	44 89 44 24 40       	mov    %r8d,0x40(%rsp)
   19cfd:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   19d02:	48 89 fd             	mov    %rdi,%rbp
   19d05:	4c 89 fe             	mov    %r15,%rsi
   19d08:	4c 89 ea             	mov    %r13,%rdx
   19d0b:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
   19d10:	49 89 cc             	mov    %rcx,%r12
   19d13:	e8 d8 01 00 00       	call   19ef0 <<hyperinterval::ieee::Format>::rounded>
   19d18:	80 7c 24 18 01       	cmpb   $0x1,0x18(%rsp)
   19d1d:	0f 84 54 01 00 00    	je     19e77 <<hyperinterval::ieee::Format>::power+0x397>
   19d23:	4c 89 fe             	mov    %r15,%rsi
   19d26:	4d 89 f3             	mov    %r14,%r11
   19d29:	4d 89 ee             	mov    %r13,%r14
   19d2c:	48 89 5c 24 60       	mov    %rbx,0x60(%rsp)
   19d31:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   19d36:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   19d3b:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   19d42:	00 
   19d43:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
   19d48:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   19d4d:	44 8b 7c 24 0c       	mov    0xc(%rsp),%r15d
   19d52:	48 89 ef             	mov    %rbp,%rdi
   19d55:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   19d59:	4c 8b ac 24 90 00 00 	mov    0x90(%rsp),%r13
   19d60:	00 
   19d61:	d1 ed                	shr    $1,%ebp
   19d63:	0f 84 62 01 00 00    	je     19ecb <<hyperinterval::ieee::Format>::power+0x3eb>
   19d69:	89 6c 24 08          	mov    %ebp,0x8(%rsp)
   19d6d:	4c 89 e8             	mov    %r13,%rax
   19d70:	4c 21 f0             	and    %r14,%rax
   19d73:	44 89 c9             	mov    %r9d,%ecx
   19d76:	48 d3 e8             	shr    %cl,%rax
   19d79:	49 21 d5             	and    %rdx,%r13
   19d7c:	89 c1                	mov    %eax,%ecx
   19d7e:	44 29 d9             	sub    %r11d,%ecx
   19d81:	48 85 c0             	test   %rax,%rax
   19d84:	48 0f 45 c3          	cmovne %rbx,%rax
   19d88:	41 0f 44 cf          	cmove  %r15d,%ecx
   19d8c:	4c 09 e8             	or     %r13,%rax
   19d8f:	48 89 d5             	mov    %rdx,%rbp
   19d92:	48 f7 e0             	mul    %rax
   19d95:	01 c9                	add    %ecx,%ecx
   19d97:	c6 44 24 44 00       	movb   $0x0,0x44(%rsp)
   19d9c:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   19da1:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   19da6:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
   19daa:	4c 89 f2             	mov    %r14,%rdx
   19dad:	4c 89 e1             	mov    %r12,%rcx
   19db0:	49 89 dd             	mov    %rbx,%r13
   19db3:	4c 89 db             	mov    %r11,%rbx
   19db6:	4d 89 f4             	mov    %r14,%r12
   19db9:	4d 89 ce             	mov    %r9,%r14
   19dbc:	e8 2f 01 00 00       	call   19ef0 <<hyperinterval::ieee::Format>::rounded>
   19dc1:	80 7c 24 18 00       	cmpb   $0x0,0x18(%rsp)
   19dc6:	0f 85 ab 00 00 00    	jne    19e77 <<hyperinterval::ieee::Format>::power+0x397>
   19dcc:	48 8b 54 24 68       	mov    0x68(%rsp),%rdx
   19dd1:	48 89 d0             	mov    %rdx,%rax
   19dd4:	4c 21 e0             	and    %r12,%rax
   19dd7:	44 89 f1             	mov    %r14d,%ecx
   19dda:	48 d3 e8             	shr    %cl,%rax
   19ddd:	48 21 ea             	and    %rbp,%rdx
   19de0:	89 c1                	mov    %eax,%ecx
   19de2:	29 d9                	sub    %ebx,%ecx
   19de4:	48 85 c0             	test   %rax,%rax
   19de7:	49 0f 45 c5          	cmovne %r13,%rax
   19deb:	41 0f 44 cf          	cmove  %r15d,%ecx
   19def:	48 09 d0             	or     %rdx,%rax
   19df2:	48 f7 e0             	mul    %rax
   19df5:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
   19dfa:	01 c9                	add    %ecx,%ecx
   19dfc:	c6 44 24 44 00       	movb   $0x0,0x44(%rsp)
   19e01:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   19e06:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   19e0b:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
   19e0f:	48 8d 6c 24 18       	lea    0x18(%rsp),%rbp
   19e14:	48 89 ef             	mov    %rbp,%rdi
   19e17:	4c 8b b4 24 88 00 00 	mov    0x88(%rsp),%r14
   19e1e:	00 
   19e1f:	4c 89 f6             	mov    %r14,%rsi
   19e22:	4c 89 e2             	mov    %r12,%rdx
   19e25:	4c 8d 7c 24 30       	lea    0x30(%rsp),%r15
   19e2a:	4c 89 f9             	mov    %r15,%rcx
   19e2d:	e8 be 00 00 00       	call   19ef0 <<hyperinterval::ieee::Format>::rounded>
   19e32:	80 7c 24 18 01       	cmpb   $0x1,0x18(%rsp)
   19e37:	74 3e                	je     19e77 <<hyperinterval::ieee::Format>::power+0x397>
   19e39:	4c 89 f6             	mov    %r14,%rsi
   19e3c:	49 89 db             	mov    %rbx,%r11
   19e3f:	4d 89 e6             	mov    %r12,%r14
   19e42:	48 89 ef             	mov    %rbp,%rdi
   19e45:	4d 89 fc             	mov    %r15,%r12
   19e48:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   19e4d:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
   19e52:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   19e59:	00 
   19e5a:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
   19e5f:	44 8b 7c 24 0c       	mov    0xc(%rsp),%r15d
   19e64:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   19e68:	40 f6 c5 01          	test   $0x1,%bpl
   19e6c:	0f 85 4e fd ff ff    	jne    19bc0 <<hyperinterval::ieee::Format>::power+0xe0>
   19e72:	e9 29 fd ff ff       	jmp    19ba0 <<hyperinterval::ieee::Format>::power+0xc0>
   19e77:	0f b6 44 24 19       	movzbl 0x19(%rsp),%eax
   19e7c:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   19e81:	88 47 01             	mov    %al,0x1(%rdi)
   19e84:	b0 01                	mov    $0x1,%al
   19e86:	eb 2f                	jmp    19eb7 <<hyperinterval::ieee::Format>::power+0x3d7>
   19e88:	48 89 d1             	mov    %rdx,%rcx
   19e8b:	44 20 c0             	and    %r8b,%al
   19e8e:	74 1d                	je     19ead <<hyperinterval::ieee::Format>::power+0x3cd>
   19e90:	48 89 d0             	mov    %rdx,%rax
   19e93:	48 31 f0             	xor    %rsi,%rax
   19e96:	48 85 d2             	test   %rdx,%rdx
   19e99:	48 0f 44 c2          	cmove  %rdx,%rax
   19e9d:	48 31 ce             	xor    %rcx,%rsi
   19ea0:	48 85 c9             	test   %rcx,%rcx
   19ea3:	48 0f 44 f1          	cmove  %rcx,%rsi
   19ea7:	48 89 c1             	mov    %rax,%rcx
   19eaa:	48 89 f2             	mov    %rsi,%rdx
   19ead:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   19eb1:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   19eb5:	31 c0                	xor    %eax,%eax
   19eb7:	88 07                	mov    %al,(%rdi)
   19eb9:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   19ec0:	5b                   	pop    %rbx
   19ec1:	41 5c                	pop    %r12
   19ec3:	41 5d                	pop    %r13
   19ec5:	41 5e                	pop    %r14
   19ec7:	41 5f                	pop    %r15
   19ec9:	5d                   	pop    %rbp
   19eca:	c3                   	ret
   19ecb:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   19ed0:	44 8b 44 24 74       	mov    0x74(%rsp),%r8d
   19ed5:	0f b6 44 24 07       	movzbl 0x7(%rsp),%eax
   19eda:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
   19edf:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   19ee4:	44 20 c0             	and    %r8b,%al
   19ee7:	75 a7                	jne    19e90 <<hyperinterval::ieee::Format>::power+0x3b0>
   19ee9:	eb c2                	jmp    19ead <<hyperinterval::ieee::Format>::power+0x3cd>
   19eeb:	cc                   	int3
   19eec:	cc                   	int3
   19eed:	cc                   	int3
   19eee:	cc                   	int3
   19eef:	cc                   	int3

<hyperinterval::ieee::Format>::rounded:
   19ef0:	48 89 c8             	mov    %rcx,%rax
   19ef3:	4c 8b 11             	mov    (%rcx),%r10
   19ef6:	4c 8b 59 08          	mov    0x8(%rcx),%r11
   19efa:	4c 89 d1             	mov    %r10,%rcx
   19efd:	4c 09 d9             	or     %r11,%rcx
   19f00:	0f 84 dd 00 00 00    	je     19fe3 <<hyperinterval::ieee::Format>::rounded+0xf3>
   19f06:	55                   	push   %rbp
   19f07:	41 57                	push   %r15
   19f09:	41 56                	push   %r14
   19f0b:	41 55                	push   %r13
   19f0d:	41 54                	push   %r12
   19f0f:	53                   	push   %rbx
   19f10:	8b 68 10             	mov    0x10(%rax),%ebp
   19f13:	49 0f bd cb          	bsr    %r11,%rcx
   19f17:	83 f1 3f             	xor    $0x3f,%ecx
   19f1a:	49 0f bd da          	bsr    %r10,%rbx
   19f1e:	83 f3 3f             	xor    $0x3f,%ebx
   19f21:	83 cb 40             	or     $0x40,%ebx
   19f24:	4d 85 db             	test   %r11,%r11
   19f27:	0f 45 d9             	cmovne %ecx,%ebx
   19f2a:	f3 4c 0f bc c2       	tzcnt  %rdx,%r8
   19f2f:	44 89 c1             	mov    %r8d,%ecx
   19f32:	48 d3 ea             	shr    %cl,%rdx
   19f35:	83 f3 7f             	xor    $0x7f,%ebx
   19f38:	01 eb                	add    %ebp,%ebx
   19f3a:	48 d1 ea             	shr    $1,%rdx
   19f3d:	39 d3                	cmp    %edx,%ebx
   19f3f:	0f 8f 88 01 00 00    	jg     1a0cd <<hyperinterval::ieee::Format>::rounded+0x1dd>
   19f45:	45 8d 0c 10          	lea    (%r8,%rdx,1),%r9d
   19f49:	b9 01 00 00 00       	mov    $0x1,%ecx
   19f4e:	44 29 c9             	sub    %r9d,%ecx
   19f51:	44 29 c3             	sub    %r8d,%ebx
   19f54:	39 cb                	cmp    %ecx,%ebx
   19f56:	0f 4e d9             	cmovle %ecx,%ebx
   19f59:	89 d9                	mov    %ebx,%ecx
   19f5b:	29 e9                	sub    %ebp,%ecx
   19f5d:	83 f9 7f             	cmp    $0x7f,%ecx
   19f60:	0f 8e 88 00 00 00    	jle    19fee <<hyperinterval::ieee::Format>::rounded+0xfe>
   19f66:	41 b7 01             	mov    $0x1,%r15b
   19f69:	45 31 f6             	xor    %r14d,%r14d
   19f6c:	45 31 db             	xor    %r11d,%r11d
   19f6f:	45 31 d2             	xor    %r10d,%r10d
   19f72:	45 0f b6 ff          	movzbl %r15b,%r15d
   19f76:	4d 01 f7             	add    %r14,%r15
   19f79:	49 83 d3 00          	adc    $0x0,%r11
   19f7d:	4c 89 f9             	mov    %r15,%rcx
   19f80:	4c 09 d9             	or     %r11,%rcx
   19f83:	0f 84 c3 00 00 00    	je     1a04c <<hyperinterval::ieee::Format>::rounded+0x15c>
   19f89:	49 0f bd cb          	bsr    %r11,%rcx
   19f8d:	83 f1 3f             	xor    $0x3f,%ecx
   19f90:	4d 0f bd f7          	bsr    %r15,%r14
   19f94:	41 83 f6 3f          	xor    $0x3f,%r14d
   19f98:	41 83 ce 40          	or     $0x40,%r14d
   19f9c:	4d 85 db             	test   %r11,%r11
   19f9f:	44 0f 45 f1          	cmovne %ecx,%r14d
   19fa3:	41 83 f6 7f          	xor    $0x7f,%r14d
   19fa7:	41 8d 2c 1e          	lea    (%r14,%rbx,1),%ebp
   19fab:	39 d5                	cmp    %edx,%ebp
   19fad:	0f 8f 1a 01 00 00    	jg     1a0cd <<hyperinterval::ieee::Format>::rounded+0x1dd>
   19fb3:	b9 01 00 00 00       	mov    $0x1,%ecx
   19fb8:	29 d1                	sub    %edx,%ecx
   19fba:	39 cd                	cmp    %ecx,%ebp
   19fbc:	0f 8d 41 01 00 00    	jge    1a103 <<hyperinterval::ieee::Format>::rounded+0x213>
   19fc2:	41 01 d9             	add    %ebx,%r9d
   19fc5:	41 fe c9             	dec    %r9b
   19fc8:	44 89 c9             	mov    %r9d,%ecx
   19fcb:	49 d3 e7             	shl    %cl,%r15
   19fce:	31 d2                	xor    %edx,%edx
   19fd0:	41 f6 c1 40          	test   $0x40,%r9b
   19fd4:	49 0f 44 d7          	cmove  %r15,%rdx
   19fd8:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   19fdc:	74 76                	je     1a054 <<hyperinterval::ieee::Format>::rounded+0x164>
   19fde:	e9 8e 00 00 00       	jmp    1a071 <<hyperinterval::ieee::Format>::rounded+0x181>
   19fe3:	c6 07 00             	movb   $0x0,(%rdi)
   19fe6:	0f 57 c0             	xorps  %xmm0,%xmm0
   19fe9:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   19fed:	c3                   	ret
   19fee:	85 c9                	test   %ecx,%ecx
   19ff0:	0f 8e 88 00 00 00    	jle    1a07e <<hyperinterval::ieee::Format>::rounded+0x18e>
   19ff6:	4d 89 d6             	mov    %r10,%r14
   19ff9:	4d 0f ad de          	shrd   %cl,%r11,%r14
   19ffd:	4d 89 dc             	mov    %r11,%r12
   1a000:	49 d3 ec             	shr    %cl,%r12
   1a003:	49 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%r15
   1a00a:	49 d3 e7             	shl    %cl,%r15
   1a00d:	49 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%r13
   1a014:	31 ed                	xor    %ebp,%ebp
   1a016:	f6 c1 40             	test   $0x40,%cl
   1a019:	4d 0f 45 f4          	cmovne %r12,%r14
   1a01d:	4c 0f 45 e5          	cmovne %rbp,%r12
   1a021:	4d 0f 45 ef          	cmovne %r15,%r13
   1a025:	4c 0f 45 fd          	cmovne %rbp,%r15
   1a029:	49 f7 d7             	not    %r15
   1a02c:	49 f7 d5             	not    %r13
   1a02f:	4d 21 dd             	and    %r11,%r13
   1a032:	4d 21 d7             	and    %r10,%r15
   1a035:	4d 09 ef             	or     %r13,%r15
   1a038:	41 0f 95 c7          	setne  %r15b
   1a03c:	4d 89 e3             	mov    %r12,%r11
   1a03f:	4c 89 f1             	mov    %r14,%rcx
   1a042:	4c 09 d9             	or     %r11,%rcx
   1a045:	75 60                	jne    1a0a7 <<hyperinterval::ieee::Format>::rounded+0x1b7>
   1a047:	e9 1d ff ff ff       	jmp    19f69 <<hyperinterval::ieee::Format>::rounded+0x79>
   1a04c:	31 d2                	xor    %edx,%edx
   1a04e:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1a052:	75 1d                	jne    1a071 <<hyperinterval::ieee::Format>::rounded+0x181>
   1a054:	48 89 d0             	mov    %rdx,%rax
   1a057:	48 31 f0             	xor    %rsi,%rax
   1a05a:	48 85 d2             	test   %rdx,%rdx
   1a05d:	48 0f 44 c2          	cmove  %rdx,%rax
   1a061:	4c 31 d6             	xor    %r10,%rsi
   1a064:	4d 85 d2             	test   %r10,%r10
   1a067:	49 0f 44 f2          	cmove  %r10,%rsi
   1a06b:	49 89 c2             	mov    %rax,%r10
   1a06e:	48 89 f2             	mov    %rsi,%rdx
   1a071:	4c 89 57 08          	mov    %r10,0x8(%rdi)
   1a075:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   1a079:	c6 07 00             	movb   $0x0,(%rdi)
   1a07c:	eb 54                	jmp    1a0d2 <<hyperinterval::ieee::Format>::rounded+0x1e2>
   1a07e:	f6 d9                	neg    %cl
   1a080:	4d 0f a5 d3          	shld   %cl,%r10,%r11
   1a084:	49 d3 e2             	shl    %cl,%r10
   1a087:	45 31 ff             	xor    %r15d,%r15d
   1a08a:	f6 c1 40             	test   $0x40,%cl
   1a08d:	4d 0f 45 da          	cmovne %r10,%r11
   1a091:	41 be 00 00 00 00    	mov    $0x0,%r14d
   1a097:	4d 0f 44 f2          	cmove  %r10,%r14
   1a09b:	4c 89 f1             	mov    %r14,%rcx
   1a09e:	4c 09 d9             	or     %r11,%rcx
   1a0a1:	0f 84 c2 fe ff ff    	je     19f69 <<hyperinterval::ieee::Format>::rounded+0x79>
   1a0a7:	49 0f bd cb          	bsr    %r11,%rcx
   1a0ab:	83 f1 3f             	xor    $0x3f,%ecx
   1a0ae:	4d 0f bd e6          	bsr    %r14,%r12
   1a0b2:	41 83 f4 3f          	xor    $0x3f,%r12d
   1a0b6:	41 83 cc 40          	or     $0x40,%r12d
   1a0ba:	4d 85 db             	test   %r11,%r11
   1a0bd:	44 0f 45 e1          	cmovne %ecx,%r12d
   1a0c1:	41 83 f4 7f          	xor    $0x7f,%r12d
   1a0c5:	41 8d 2c 1c          	lea    (%r12,%rbx,1),%ebp
   1a0c9:	39 d5                	cmp    %edx,%ebp
   1a0cb:	7e 10                	jle    1a0dd <<hyperinterval::ieee::Format>::rounded+0x1ed>
   1a0cd:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   1a0d2:	5b                   	pop    %rbx
   1a0d3:	41 5c                	pop    %r12
   1a0d5:	41 5d                	pop    %r13
   1a0d7:	41 5e                	pop    %r14
   1a0d9:	41 5f                	pop    %r15
   1a0db:	5d                   	pop    %rbp
   1a0dc:	c3                   	ret
   1a0dd:	b9 01 00 00 00       	mov    $0x1,%ecx
   1a0e2:	29 d1                	sub    %edx,%ecx
   1a0e4:	39 cd                	cmp    %ecx,%ebp
   1a0e6:	7d 7d                	jge    1a165 <<hyperinterval::ieee::Format>::rounded+0x275>
   1a0e8:	41 8d 0c 19          	lea    (%r9,%rbx,1),%ecx
   1a0ec:	fe c9                	dec    %cl
   1a0ee:	4d 89 f4             	mov    %r14,%r12
   1a0f1:	49 d3 e4             	shl    %cl,%r12
   1a0f4:	45 31 d2             	xor    %r10d,%r10d
   1a0f7:	f6 c1 40             	test   $0x40,%cl
   1a0fa:	4d 0f 44 d4          	cmove  %r12,%r10
   1a0fe:	e9 6f fe ff ff       	jmp    19f72 <<hyperinterval::ieee::Format>::rounded+0x82>
   1a103:	44 89 c1             	mov    %r8d,%ecx
   1a106:	44 29 f1             	sub    %r14d,%ecx
   1a109:	41 89 c9             	mov    %ecx,%r9d
   1a10c:	41 f7 d9             	neg    %r9d
   1a10f:	4c 89 fb             	mov    %r15,%rbx
   1a112:	48 d3 e3             	shl    %cl,%rbx
   1a115:	45 31 e4             	xor    %r12d,%r12d
   1a118:	f6 c1 40             	test   $0x40,%cl
   1a11b:	4c 0f 44 e3          	cmove  %rbx,%r12
   1a11f:	44 89 c9             	mov    %r9d,%ecx
   1a122:	4d 0f ad df          	shrd   %cl,%r11,%r15
   1a126:	49 d3 eb             	shr    %cl,%r11
   1a129:	41 f6 c1 40          	test   $0x40,%r9b
   1a12d:	4d 0f 44 df          	cmove  %r15,%r11
   1a131:	45 39 f0             	cmp    %r14d,%r8d
   1a134:	4d 0f 43 dc          	cmovae %r12,%r11
   1a138:	01 d5                	add    %edx,%ebp
   1a13a:	4c 63 cd             	movslq %ebp,%r9
   1a13d:	44 89 c1             	mov    %r8d,%ecx
   1a140:	49 d3 e1             	shl    %cl,%r9
   1a143:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
   1a14a:	48 d3 e2             	shl    %cl,%rdx
   1a14d:	48 f7 d2             	not    %rdx
   1a150:	4c 21 da             	and    %r11,%rdx
   1a153:	4c 09 ca             	or     %r9,%rdx
   1a156:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1a15a:	0f 85 11 ff ff ff    	jne    1a071 <<hyperinterval::ieee::Format>::rounded+0x181>
   1a160:	e9 ef fe ff ff       	jmp    1a054 <<hyperinterval::ieee::Format>::rounded+0x164>
   1a165:	44 89 c1             	mov    %r8d,%ecx
   1a168:	44 29 e1             	sub    %r12d,%ecx
   1a16b:	4d 89 f5             	mov    %r14,%r13
   1a16e:	49 d3 e5             	shl    %cl,%r13
   1a171:	41 89 ca             	mov    %ecx,%r10d
   1a174:	41 f7 da             	neg    %r10d
   1a177:	48 c7 44 24 f0 00 00 	movq   $0x0,-0x10(%rsp)
   1a17e:	00 00 
   1a180:	f6 c1 40             	test   $0x40,%cl
   1a183:	48 8b 4c 24 f0       	mov    -0x10(%rsp),%rcx
   1a188:	49 0f 44 cd          	cmove  %r13,%rcx
   1a18c:	48 89 4c 24 f0       	mov    %rcx,-0x10(%rsp)
   1a191:	4d 89 f5             	mov    %r14,%r13
   1a194:	44 89 d1             	mov    %r10d,%ecx
   1a197:	4d 0f ad dd          	shrd   %cl,%r11,%r13
   1a19b:	4c 89 6c 24 f8       	mov    %r13,-0x8(%rsp)
   1a1a0:	4d 89 dd             	mov    %r11,%r13
   1a1a3:	49 d3 ed             	shr    %cl,%r13
   1a1a6:	41 f6 c2 40          	test   $0x40,%r10b
   1a1aa:	4c 0f 44 6c 24 f8    	cmove  -0x8(%rsp),%r13
   1a1b0:	45 39 e0             	cmp    %r12d,%r8d
   1a1b3:	4c 0f 43 6c 24 f0    	cmovae -0x10(%rsp),%r13
   1a1b9:	01 d5                	add    %edx,%ebp
   1a1bb:	4c 63 e5             	movslq %ebp,%r12
   1a1be:	44 89 c1             	mov    %r8d,%ecx
   1a1c1:	49 d3 e4             	shl    %cl,%r12
   1a1c4:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
   1a1cb:	49 d3 e2             	shl    %cl,%r10
   1a1ce:	49 f7 d2             	not    %r10
   1a1d1:	4d 21 ea             	and    %r13,%r10
   1a1d4:	4d 09 e2             	or     %r12,%r10
   1a1d7:	e9 96 fd ff ff       	jmp    19f72 <<hyperinterval::ieee::Format>::rounded+0x82>
   1a1dc:	cc                   	int3
   1a1dd:	cc                   	int3
   1a1de:	cc                   	int3
   1a1df:	cc                   	int3

<hyperinterval::float::F64Enclosure>::reciprocal:
   1a1e0:	53                   	push   %rbx
   1a1e1:	48 83 ec 20          	sub    $0x20,%rsp
   1a1e5:	48 89 fb             	mov    %rdi,%rbx
   1a1e8:	80 3e 00             	cmpb   $0x0,(%rsi)
   1a1eb:	74 6d                	je     1a25a <<hyperinterval::float::F64Enclosure>::reciprocal+0x7a>
   1a1ed:	48 89 f2             	mov    %rsi,%rdx
   1a1f0:	48 c7 44 24 08 01 00 	movq   $0x1,0x8(%rsp)
   1a1f7:	00 00 
   1a1f9:	c6 44 24 10 00       	movb   $0x0,0x10(%rsp)
   1a1fe:	c6 44 24 17 3f       	movb   $0x3f,0x17(%rsp)
   1a203:	66 c7 44 24 15 00 f0 	movw   $0xf000,0x15(%rsp)
   1a20a:	c7 44 24 11 00 00 00 	movl   $0x0,0x11(%rsp)
   1a211:	00 
   1a212:	48 b8 00 00 00 00 00 	movabs $0x3ff0000000000000,%rax
   1a219:	00 f0 3f 
   1a21c:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1a221:	48 83 7e 08 00       	cmpq   $0x0,0x8(%rsi)
   1a226:	7f 17                	jg     1a23f <<hyperinterval::float::F64Enclosure>::reciprocal+0x5f>
   1a228:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1a22c:	48 85 c0             	test   %rax,%rax
   1a22f:	0f 99 c1             	setns  %cl
   1a232:	48 d1 e0             	shl    $1,%rax
   1a235:	48 85 c0             	test   %rax,%rax
   1a238:	0f 94 c0             	sete   %al
   1a23b:	08 c8                	or     %cl,%al
   1a23d:	75 2b                	jne    1a26a <<hyperinterval::float::F64Enclosure>::reciprocal+0x8a>
   1a23f:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
   1a244:	48 89 df             	mov    %rbx,%rdi
   1a247:	b9 01 00 00 00       	mov    $0x1,%ecx
   1a24c:	e8 7f 02 00 00       	call   1a4d0 <<hyperinterval::float::F64Enclosure>::corner_image>
   1a251:	48 89 d8             	mov    %rbx,%rax
   1a254:	48 83 c4 20          	add    $0x20,%rsp
   1a258:	5b                   	pop    %rbx
   1a259:	c3                   	ret
   1a25a:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1a261:	48 89 d8             	mov    %rbx,%rax
   1a264:	48 83 c4 20          	add    $0x20,%rsp
   1a268:	5b                   	pop    %rbx
   1a269:	c3                   	ret
   1a26a:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
   1a26e:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a275:	48 89 d8             	mov    %rbx,%rax
   1a278:	48 83 c4 20          	add    $0x20,%rsp
   1a27c:	5b                   	pop    %rbx
   1a27d:	c3                   	ret
   1a27e:	cc                   	int3
   1a27f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::checked_pow:
   1a280:	55                   	push   %rbp
   1a281:	41 57                	push   %r15
   1a283:	41 56                	push   %r14
   1a285:	41 55                	push   %r13
   1a287:	41 54                	push   %r12
   1a289:	53                   	push   %rbx
   1a28a:	48 83 ec 58          	sub    $0x58,%rsp
   1a28e:	48 89 fb             	mov    %rdi,%rbx
   1a291:	83 fa 02             	cmp    $0x2,%edx
   1a294:	75 0e                	jne    1a2a4 <<hyperinterval::float::F64Enclosure>::checked_pow+0x24>
   1a296:	48 89 df             	mov    %rbx,%rdi
   1a299:	ff 15 19 0c 04 00    	call   *0x40c19(%rip)        # 5aeb8 <_DYNAMIC+0x2f0>
   1a29f:	e9 80 00 00 00       	jmp    1a324 <<hyperinterval::float::F64Enclosure>::checked_pow+0xa4>
   1a2a4:	f6 06 01             	testb  $0x1,(%rsi)
   1a2a7:	74 74                	je     1a31d <<hyperinterval::float::F64Enclosure>::checked_pow+0x9d>
   1a2a9:	89 d5                	mov    %edx,%ebp
   1a2ab:	4c 8b 6e 10          	mov    0x10(%rsi),%r13
   1a2af:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
   1a2b6:	00 00 80 
   1a2b9:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1a2c0:	00 f0 7f 
   1a2c3:	48 89 74 24 50       	mov    %rsi,0x50(%rsp)
   1a2c8:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1a2cc:	48 89 e7             	mov    %rsp,%rdi
   1a2cf:	4c 89 fe             	mov    %r15,%rsi
   1a2d2:	4c 89 e2             	mov    %r12,%rdx
   1a2d5:	41 89 e8             	mov    %ebp,%r8d
   1a2d8:	e8 03 f8 ff ff       	call   19ae0 <<hyperinterval::ieee::Format>::power>
   1a2dd:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a2e1:	75 29                	jne    1a30c <<hyperinterval::float::F64Enclosure>::checked_pow+0x8c>
   1a2e3:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   1a2e8:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1a2ed:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1a2f2:	48 89 e7             	mov    %rsp,%rdi
   1a2f5:	4c 89 fe             	mov    %r15,%rsi
   1a2f8:	4c 89 e2             	mov    %r12,%rdx
   1a2fb:	4c 89 e9             	mov    %r13,%rcx
   1a2fe:	41 89 e8             	mov    %ebp,%r8d
   1a301:	e8 da f7 ff ff       	call   19ae0 <<hyperinterval::ieee::Format>::power>
   1a306:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a30a:	75 2a                	jne    1a336 <<hyperinterval::float::F64Enclosure>::checked_pow+0xb6>
   1a30c:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a311:	88 43 08             	mov    %al,0x8(%rbx)
   1a314:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a31b:	eb 07                	jmp    1a324 <<hyperinterval::float::F64Enclosure>::checked_pow+0xa4>
   1a31d:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1a324:	48 89 d8             	mov    %rbx,%rax
   1a327:	48 83 c4 58          	add    $0x58,%rsp
   1a32b:	5b                   	pop    %rbx
   1a32c:	41 5c                	pop    %r12
   1a32e:	41 5d                	pop    %r13
   1a330:	41 5e                	pop    %r14
   1a332:	41 5f                	pop    %r15
   1a334:	5d                   	pop    %rbp
   1a335:	c3                   	ret
   1a336:	4c 89 f0             	mov    %r14,%rax
   1a339:	4c 21 e0             	and    %r12,%rax
   1a33c:	4c 39 e0             	cmp    %r12,%rax
   1a33f:	74 1e                	je     1a35f <<hyperinterval::float::F64Enclosure>::checked_pow+0xdf>
   1a341:	49 8d 47 ff          	lea    -0x1(%r15),%rax
   1a345:	4c 89 f1             	mov    %r14,%rcx
   1a348:	48 21 c1             	and    %rax,%rcx
   1a34b:	49 0f 45 ce          	cmovne %r14,%rcx
   1a34f:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
   1a354:	48 89 f2             	mov    %rsi,%rdx
   1a357:	4c 21 e2             	and    %r12,%rdx
   1a35a:	4c 39 e2             	cmp    %r12,%rdx
   1a35d:	75 0f                	jne    1a36e <<hyperinterval::float::F64Enclosure>::checked_pow+0xee>
   1a35f:	31 f6                	xor    %esi,%esi
   1a361:	40 88 73 08          	mov    %sil,0x8(%rbx)
   1a365:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a36c:	eb b6                	jmp    1a324 <<hyperinterval::float::F64Enclosure>::checked_pow+0xa4>
   1a36e:	48 89 f2             	mov    %rsi,%rdx
   1a371:	48 21 c2             	and    %rax,%rdx
   1a374:	48 0f 45 d6          	cmovne %rsi,%rdx
   1a378:	4a 8d 34 39          	lea    (%rcx,%r15,1),%rsi
   1a37c:	48 89 cf             	mov    %rcx,%rdi
   1a37f:	48 21 c7             	and    %rax,%rdi
   1a382:	4d 89 f8             	mov    %r15,%r8
   1a385:	49 29 f8             	sub    %rdi,%r8
   1a388:	48 85 c9             	test   %rcx,%rcx
   1a38b:	4c 0f 49 c6          	cmovns %rsi,%r8
   1a38f:	4a 8d 34 3a          	lea    (%rdx,%r15,1),%rsi
   1a393:	48 89 d7             	mov    %rdx,%rdi
   1a396:	48 21 c7             	and    %rax,%rdi
   1a399:	4d 89 f9             	mov    %r15,%r9
   1a39c:	49 29 f9             	sub    %rdi,%r9
   1a39f:	48 85 d2             	test   %rdx,%rdx
   1a3a2:	4c 0f 49 ce          	cmovns %rsi,%r9
   1a3a6:	40 b6 01             	mov    $0x1,%sil
   1a3a9:	4d 39 c8             	cmp    %r9,%r8
   1a3ac:	77 b3                	ja     1a361 <<hyperinterval::float::F64Enclosure>::checked_pow+0xe1>
   1a3ae:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   1a3b3:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1a3b8:	48 c7 44 24 18 01 00 	movq   $0x1,0x18(%rsp)
   1a3bf:	00 00 
   1a3c1:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   1a3c6:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1a3cb:	48 89 f9             	mov    %rdi,%rcx
   1a3ce:	4c 21 e1             	and    %r12,%rcx
   1a3d1:	4c 39 e1             	cmp    %r12,%rcx
   1a3d4:	74 15                	je     1a3eb <<hyperinterval::float::F64Enclosure>::checked_pow+0x16b>
   1a3d6:	48 89 f9             	mov    %rdi,%rcx
   1a3d9:	48 21 c1             	and    %rax,%rcx
   1a3dc:	48 0f 45 cf          	cmovne %rdi,%rcx
   1a3e0:	48 89 f2             	mov    %rsi,%rdx
   1a3e3:	4c 21 e2             	and    %r12,%rdx
   1a3e6:	4c 39 e2             	cmp    %r12,%rdx
   1a3e9:	75 11                	jne    1a3fc <<hyperinterval::float::F64Enclosure>::checked_pow+0x17c>
   1a3eb:	31 c0                	xor    %eax,%eax
   1a3ed:	88 43 08             	mov    %al,0x8(%rbx)
   1a3f0:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a3f7:	e9 28 ff ff ff       	jmp    1a324 <<hyperinterval::float::F64Enclosure>::checked_pow+0xa4>
   1a3fc:	48 89 f2             	mov    %rsi,%rdx
   1a3ff:	48 21 c2             	and    %rax,%rdx
   1a402:	48 0f 45 d6          	cmovne %rsi,%rdx
   1a406:	4a 8d 34 39          	lea    (%rcx,%r15,1),%rsi
   1a40a:	48 89 cf             	mov    %rcx,%rdi
   1a40d:	48 21 c7             	and    %rax,%rdi
   1a410:	4d 89 f8             	mov    %r15,%r8
   1a413:	49 29 f8             	sub    %rdi,%r8
   1a416:	48 85 c9             	test   %rcx,%rcx
   1a419:	4c 0f 49 c6          	cmovns %rsi,%r8
   1a41d:	4a 8d 34 3a          	lea    (%rdx,%r15,1),%rsi
   1a421:	48 21 d0             	and    %rdx,%rax
   1a424:	49 29 c7             	sub    %rax,%r15
   1a427:	48 85 d2             	test   %rdx,%rdx
   1a42a:	4c 0f 49 fe          	cmovns %rsi,%r15
   1a42e:	b0 01                	mov    $0x1,%al
   1a430:	4d 39 f8             	cmp    %r15,%r8
   1a433:	77 b8                	ja     1a3ed <<hyperinterval::float::F64Enclosure>::checked_pow+0x16d>
   1a435:	48 c7 04 24 01 00 00 	movq   $0x1,(%rsp)
   1a43c:	00 
   1a43d:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   1a442:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
   1a447:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1a44c:	48 8d 74 24 18       	lea    0x18(%rsp),%rsi
   1a451:	48 89 e2             	mov    %rsp,%rdx
   1a454:	ff 15 fe 0a 04 00    	call   *0x40afe(%rip)        # 5af58 <_DYNAMIC+0x390>
   1a45a:	85 ed                	test   %ebp,%ebp
   1a45c:	0f 95 c0             	setne  %al
   1a45f:	40 f6 c5 01          	test   $0x1,%bpl
   1a463:	0f 94 c1             	sete   %cl
   1a466:	84 c8                	test   %cl,%al
   1a468:	74 46                	je     1a4b0 <<hyperinterval::float::F64Enclosure>::checked_pow+0x230>
   1a46a:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1a46f:	ff 15 eb 0a 04 00    	call   *0x40aeb(%rip)        # 5af60 <_DYNAMIC+0x398>
   1a475:	a8 02                	test   $0x2,%al
   1a477:	74 37                	je     1a4b0 <<hyperinterval::float::F64Enclosure>::checked_pow+0x230>
   1a479:	48 c7 04 24 01 00 00 	movq   $0x1,(%rsp)
   1a480:	00 
   1a481:	0f 57 c0             	xorps  %xmm0,%xmm0
   1a484:	0f 11 44 24 08       	movups %xmm0,0x8(%rsp)
   1a489:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   1a48e:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   1a493:	48 89 e2             	mov    %rsp,%rdx
   1a496:	ff 15 bc 0a 04 00    	call   *0x40abc(%rip)        # 5af58 <_DYNAMIC+0x390>
   1a49c:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   1a4a1:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1a4a6:	0f 10 44 24 18       	movups 0x18(%rsp),%xmm0
   1a4ab:	0f 29 44 24 30       	movaps %xmm0,0x30(%rsp)
   1a4b0:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1a4b5:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1a4b9:	0f 28 44 24 30       	movaps 0x30(%rsp),%xmm0
   1a4be:	0f 11 03             	movups %xmm0,(%rbx)
   1a4c1:	e9 5e fe ff ff       	jmp    1a324 <<hyperinterval::float::F64Enclosure>::checked_pow+0xa4>
   1a4c6:	cc                   	int3
   1a4c7:	cc                   	int3
   1a4c8:	cc                   	int3
   1a4c9:	cc                   	int3
   1a4ca:	cc                   	int3
   1a4cb:	cc                   	int3
   1a4cc:	cc                   	int3
   1a4cd:	cc                   	int3
   1a4ce:	cc                   	int3
   1a4cf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::corner_image:
   1a4d0:	55                   	push   %rbp
   1a4d1:	41 57                	push   %r15
   1a4d3:	41 56                	push   %r14
   1a4d5:	41 55                	push   %r13
   1a4d7:	41 54                	push   %r12
   1a4d9:	53                   	push   %rbx
   1a4da:	48 83 ec 78          	sub    $0x78,%rsp
   1a4de:	48 89 fb             	mov    %rdi,%rbx
   1a4e1:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1a4e5:	75 6c                	jne    1a553 <<hyperinterval::float::F64Enclosure>::corner_image+0x83>
   1a4e7:	f6 02 01             	testb  $0x1,(%rdx)
   1a4ea:	74 67                	je     1a553 <<hyperinterval::float::F64Enclosure>::corner_image+0x83>
   1a4ec:	41 89 cc             	mov    %ecx,%r12d
   1a4ef:	49 ba 00 00 00 00 00 	movabs $0x8000000000000000,%r10
   1a4f6:	00 00 80 
   1a4f9:	49 bb 00 00 00 00 00 	movabs $0x7ff0000000000000,%r11
   1a500:	00 f0 7f 
   1a503:	4c 8b 6e 08          	mov    0x8(%rsi),%r13
   1a507:	48 8b 46 10          	mov    0x10(%rsi),%rax
   1a50b:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1a510:	48 8b 6a 08          	mov    0x8(%rdx),%rbp
   1a514:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1a518:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1a51d:	45 84 e4             	test   %r12b,%r12b
   1a520:	74 3d                	je     1a55f <<hyperinterval::float::F64Enclosure>::corner_image+0x8f>
   1a522:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1a527:	4d 89 d6             	mov    %r10,%r14
   1a52a:	4c 89 d6             	mov    %r10,%rsi
   1a52d:	4c 89 da             	mov    %r11,%rdx
   1a530:	4c 89 e9             	mov    %r13,%rcx
   1a533:	49 89 e8             	mov    %rbp,%r8
   1a536:	4d 89 df             	mov    %r11,%r15
   1a539:	e8 62 f1 ff ff       	call   196a0 <<hyperinterval::ieee::Format>::div>
   1a53e:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1a543:	0f 84 c6 00 00 00    	je     1a60f <<hyperinterval::float::F64Enclosure>::corner_image+0x13f>
   1a549:	0f b6 7c 24 11       	movzbl 0x11(%rsp),%edi
   1a54e:	e9 d1 04 00 00       	jmp    1aa24 <<hyperinterval::float::F64Enclosure>::corner_image+0x554>
   1a553:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1a55a:	e9 d0 04 00 00       	jmp    1aa2f <<hyperinterval::float::F64Enclosure>::corner_image+0x55f>
   1a55f:	4c 89 e8             	mov    %r13,%rax
   1a562:	48 c1 e8 34          	shr    $0x34,%rax
   1a566:	25 ff 07 00 00       	and    $0x7ff,%eax
   1a56b:	48 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%rdx
   1a572:	ff 0f 00 
   1a575:	4c 89 ee             	mov    %r13,%rsi
   1a578:	48 21 d6             	and    %rdx,%rsi
   1a57b:	8d 88 cd fb ff ff    	lea    -0x433(%rax),%ecx
   1a581:	48 85 c0             	test   %rax,%rax
   1a584:	b8 ce fb ff ff       	mov    $0xfffffbce,%eax
   1a589:	0f 44 c8             	cmove  %eax,%ecx
   1a58c:	48 8d 7c 16 01       	lea    0x1(%rsi,%rdx,1),%rdi
   1a591:	48 0f 44 fe          	cmove  %rsi,%rdi
   1a595:	48 89 ee             	mov    %rbp,%rsi
   1a598:	48 c1 ee 34          	shr    $0x34,%rsi
   1a59c:	81 e6 ff 07 00 00    	and    $0x7ff,%esi
   1a5a2:	49 89 e8             	mov    %rbp,%r8
   1a5a5:	49 21 d0             	and    %rdx,%r8
   1a5a8:	44 8d 8e cd fb ff ff 	lea    -0x433(%rsi),%r9d
   1a5af:	48 85 f6             	test   %rsi,%rsi
   1a5b2:	44 0f 44 c8          	cmove  %eax,%r9d
   1a5b6:	49 8d 44 10 01       	lea    0x1(%r8,%rdx,1),%rax
   1a5bb:	49 0f 44 c0          	cmove  %r8,%rax
   1a5bf:	48 89 ee             	mov    %rbp,%rsi
   1a5c2:	4c 31 ee             	xor    %r13,%rsi
   1a5c5:	48 f7 e7             	mul    %rdi
   1a5c8:	41 01 c9             	add    %ecx,%r9d
   1a5cb:	48 c1 ee 3f          	shr    $0x3f,%rsi
   1a5cf:	40 88 74 24 24       	mov    %sil,0x24(%rsp)
   1a5d4:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1a5d9:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1a5de:	44 89 4c 24 20       	mov    %r9d,0x20(%rsp)
   1a5e3:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1a5e8:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1a5ed:	4d 89 d6             	mov    %r10,%r14
   1a5f0:	4c 89 d6             	mov    %r10,%rsi
   1a5f3:	4c 89 da             	mov    %r11,%rdx
   1a5f6:	4d 89 df             	mov    %r11,%r15
   1a5f9:	e8 f2 f8 ff ff       	call   19ef0 <<hyperinterval::ieee::Format>::rounded>
   1a5fe:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1a603:	74 19                	je     1a61e <<hyperinterval::float::F64Enclosure>::corner_image+0x14e>
   1a605:	0f b6 7c 24 41       	movzbl 0x41(%rsp),%edi
   1a60a:	e9 15 04 00 00       	jmp    1aa24 <<hyperinterval::float::F64Enclosure>::corner_image+0x554>
   1a60f:	4d 89 f9             	mov    %r15,%r9
   1a612:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1a617:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
   1a61c:	eb 0d                	jmp    1a62b <<hyperinterval::float::F64Enclosure>::corner_image+0x15b>
   1a61e:	4d 89 f9             	mov    %r15,%r9
   1a621:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1a626:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   1a62b:	48 89 ca             	mov    %rcx,%rdx
   1a62e:	4c 21 ca             	and    %r9,%rdx
   1a631:	31 ff                	xor    %edi,%edi
   1a633:	4c 39 ca             	cmp    %r9,%rdx
   1a636:	0f 84 e8 03 00 00    	je     1aa24 <<hyperinterval::float::F64Enclosure>::corner_image+0x554>
   1a63c:	48 89 c2             	mov    %rax,%rdx
   1a63f:	4c 21 ca             	and    %r9,%rdx
   1a642:	4c 39 ca             	cmp    %r9,%rdx
   1a645:	0f 84 d9 03 00 00    	je     1aa24 <<hyperinterval::float::F64Enclosure>::corner_image+0x554>
   1a64b:	4c 89 f6             	mov    %r14,%rsi
   1a64e:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   1a652:	49 89 ca             	mov    %rcx,%r10
   1a655:	49 21 d2             	and    %rdx,%r10
   1a658:	4c 0f 45 d1          	cmovne %rcx,%r10
   1a65c:	49 89 c0             	mov    %rax,%r8
   1a65f:	49 21 d0             	and    %rdx,%r8
   1a662:	4c 0f 45 c0          	cmovne %rax,%r8
   1a666:	4b 8d 04 32          	lea    (%r10,%r14,1),%rax
   1a66a:	4c 89 d1             	mov    %r10,%rcx
   1a66d:	48 21 d1             	and    %rdx,%rcx
   1a670:	49 29 ce             	sub    %rcx,%r14
   1a673:	4d 85 d2             	test   %r10,%r10
   1a676:	4c 0f 49 f0          	cmovns %rax,%r14
   1a67a:	49 8d 04 30          	lea    (%r8,%rsi,1),%rax
   1a67e:	4c 89 c1             	mov    %r8,%rcx
   1a681:	48 21 d1             	and    %rdx,%rcx
   1a684:	49 89 f7             	mov    %rsi,%r15
   1a687:	49 29 cf             	sub    %rcx,%r15
   1a68a:	4d 85 c0             	test   %r8,%r8
   1a68d:	4c 0f 49 f8          	cmovns %rax,%r15
   1a691:	40 b7 01             	mov    $0x1,%dil
   1a694:	4d 39 fe             	cmp    %r15,%r14
   1a697:	0f 87 87 03 00 00    	ja     1aa24 <<hyperinterval::float::F64Enclosure>::corner_image+0x554>
   1a69d:	4c 89 54 24 30       	mov    %r10,0x30(%rsp)
   1a6a2:	4c 89 44 24 38       	mov    %r8,0x38(%rsp)
   1a6a7:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1a6ac:	45 84 e4             	test   %r12b,%r12b
   1a6af:	0f 84 8c 02 00 00    	je     1a941 <<hyperinterval::float::F64Enclosure>::corner_image+0x471>
   1a6b5:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1a6ba:	49 89 f4             	mov    %rsi,%r12
   1a6bd:	4c 89 ca             	mov    %r9,%rdx
   1a6c0:	4c 89 e9             	mov    %r13,%rcx
   1a6c3:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   1a6c8:	4d 89 cd             	mov    %r9,%r13
   1a6cb:	e8 d0 ef ff ff       	call   196a0 <<hyperinterval::ieee::Format>::div>
   1a6d0:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1a6d5:	0f 85 6e fe ff ff    	jne    1a549 <<hyperinterval::float::F64Enclosure>::corner_image+0x79>
   1a6db:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1a6e0:	48 89 c8             	mov    %rcx,%rax
   1a6e3:	4c 21 e8             	and    %r13,%rax
   1a6e6:	4c 39 e8             	cmp    %r13,%rax
   1a6e9:	0f 84 33 03 00 00    	je     1aa22 <<hyperinterval::float::F64Enclosure>::corner_image+0x552>
   1a6ef:	4c 89 ea             	mov    %r13,%rdx
   1a6f2:	48 89 c8             	mov    %rcx,%rax
   1a6f5:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
   1a6fa:	4c 21 c8             	and    %r9,%rax
   1a6fd:	48 0f 45 c1          	cmovne %rcx,%rax
   1a701:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1a706:	48 89 f1             	mov    %rsi,%rcx
   1a709:	4c 21 e9             	and    %r13,%rcx
   1a70c:	4c 39 e9             	cmp    %r13,%rcx
   1a70f:	0f 84 0d 03 00 00    	je     1aa22 <<hyperinterval::float::F64Enclosure>::corner_image+0x552>
   1a715:	48 89 f1             	mov    %rsi,%rcx
   1a718:	4c 21 c9             	and    %r9,%rcx
   1a71b:	48 0f 45 ce          	cmovne %rsi,%rcx
   1a71f:	4e 8d 04 20          	lea    (%rax,%r12,1),%r8
   1a723:	48 89 c7             	mov    %rax,%rdi
   1a726:	4c 21 cf             	and    %r9,%rdi
   1a729:	4d 89 e2             	mov    %r12,%r10
   1a72c:	49 29 fa             	sub    %rdi,%r10
   1a72f:	48 85 c0             	test   %rax,%rax
   1a732:	4d 0f 49 d0          	cmovns %r8,%r10
   1a736:	4a 8d 3c 21          	lea    (%rcx,%r12,1),%rdi
   1a73a:	49 89 c8             	mov    %rcx,%r8
   1a73d:	4d 21 c8             	and    %r9,%r8
   1a740:	4d 89 e1             	mov    %r12,%r9
   1a743:	4d 29 c1             	sub    %r8,%r9
   1a746:	48 85 c9             	test   %rcx,%rcx
   1a749:	4c 0f 49 cf          	cmovns %rdi,%r9
   1a74d:	4d 39 ca             	cmp    %r9,%r10
   1a750:	0f 87 2f 03 00 00    	ja     1aa85 <<hyperinterval::float::F64Enclosure>::corner_image+0x5b5>
   1a756:	4c 89 e6             	mov    %r12,%rsi
   1a759:	4d 39 d6             	cmp    %r10,%r14
   1a75c:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
   1a761:	48 0f 47 f8          	cmova  %rax,%rdi
   1a765:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
   1a76a:	4d 39 cf             	cmp    %r9,%r15
   1a76d:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   1a772:	48 0f 42 c1          	cmovb  %rcx,%rax
   1a776:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1a77b:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1a780:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1a785:	49 89 e8             	mov    %rbp,%r8
   1a788:	49 89 d6             	mov    %rdx,%r14
   1a78b:	e8 10 ef ff ff       	call   196a0 <<hyperinterval::ieee::Format>::div>
   1a790:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1a795:	0f 85 ae fd ff ff    	jne    1a549 <<hyperinterval::float::F64Enclosure>::corner_image+0x79>
   1a79b:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1a7a0:	48 89 c1             	mov    %rax,%rcx
   1a7a3:	4c 21 f1             	and    %r14,%rcx
   1a7a6:	4c 39 f1             	cmp    %r14,%rcx
   1a7a9:	0f 84 73 02 00 00    	je     1aa22 <<hyperinterval::float::F64Enclosure>::corner_image+0x552>
   1a7af:	4c 89 f2             	mov    %r14,%rdx
   1a7b2:	49 89 c7             	mov    %rax,%r15
   1a7b5:	4c 8b 54 24 08       	mov    0x8(%rsp),%r10
   1a7ba:	4d 21 d7             	and    %r10,%r15
   1a7bd:	4c 0f 45 f8          	cmovne %rax,%r15
   1a7c1:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
   1a7c6:	48 89 c1             	mov    %rax,%rcx
   1a7c9:	4c 21 f1             	and    %r14,%rcx
   1a7cc:	4c 39 f1             	cmp    %r14,%rcx
   1a7cf:	0f 84 4d 02 00 00    	je     1aa22 <<hyperinterval::float::F64Enclosure>::corner_image+0x552>
   1a7d5:	49 89 c6             	mov    %rax,%r14
   1a7d8:	4d 21 d6             	and    %r10,%r14
   1a7db:	4c 0f 45 f0          	cmovne %rax,%r14
   1a7df:	4b 8d 04 27          	lea    (%r15,%r12,1),%rax
   1a7e3:	4c 89 ff             	mov    %r15,%rdi
   1a7e6:	4c 21 d7             	and    %r10,%rdi
   1a7e9:	4c 89 e1             	mov    %r12,%rcx
   1a7ec:	48 29 f9             	sub    %rdi,%rcx
   1a7ef:	4d 85 ff             	test   %r15,%r15
   1a7f2:	48 0f 49 c8          	cmovns %rax,%rcx
   1a7f6:	4f 8d 04 26          	lea    (%r14,%r12,1),%r8
   1a7fa:	4c 89 f7             	mov    %r14,%rdi
   1a7fd:	4c 21 d7             	and    %r10,%rdi
   1a800:	4c 89 e0             	mov    %r12,%rax
   1a803:	48 29 f8             	sub    %rdi,%rax
   1a806:	4d 85 f6             	test   %r14,%r14
   1a809:	49 0f 49 c0          	cmovns %r8,%rax
   1a80d:	48 39 c1             	cmp    %rax,%rcx
   1a810:	0f 87 6f 02 00 00    	ja     1aa85 <<hyperinterval::float::F64Enclosure>::corner_image+0x5b5>
   1a816:	4c 89 e6             	mov    %r12,%rsi
   1a819:	4c 8b 5c 24 30       	mov    0x30(%rsp),%r11
   1a81e:	4f 8d 0c 23          	lea    (%r11,%r12,1),%r9
   1a822:	4d 89 d8             	mov    %r11,%r8
   1a825:	4d 21 d0             	and    %r10,%r8
   1a828:	4c 89 e7             	mov    %r12,%rdi
   1a82b:	4c 29 c7             	sub    %r8,%rdi
   1a82e:	4d 85 db             	test   %r11,%r11
   1a831:	49 0f 49 f9          	cmovns %r9,%rdi
   1a835:	48 39 cf             	cmp    %rcx,%rdi
   1a838:	4d 0f 46 fb          	cmovbe %r11,%r15
   1a83c:	4c 8b 4c 24 38       	mov    0x38(%rsp),%r9
   1a841:	4b 8d 0c 21          	lea    (%r9,%r12,1),%rcx
   1a845:	4d 89 c8             	mov    %r9,%r8
   1a848:	4d 21 d0             	and    %r10,%r8
   1a84b:	4c 89 e7             	mov    %r12,%rdi
   1a84e:	4c 29 c7             	sub    %r8,%rdi
   1a851:	4d 85 c9             	test   %r9,%r9
   1a854:	48 0f 49 f9          	cmovns %rcx,%rdi
   1a858:	48 39 c7             	cmp    %rax,%rdi
   1a85b:	4d 0f 43 f1          	cmovae %r9,%r14
   1a85f:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1a864:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1a869:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   1a86e:	49 89 d5             	mov    %rdx,%r13
   1a871:	e8 2a ee ff ff       	call   196a0 <<hyperinterval::ieee::Format>::div>
   1a876:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1a87b:	0f 85 c8 fc ff ff    	jne    1a549 <<hyperinterval::float::F64Enclosure>::corner_image+0x79>
   1a881:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1a886:	48 89 c8             	mov    %rcx,%rax
   1a889:	4c 21 e8             	and    %r13,%rax
   1a88c:	4c 39 e8             	cmp    %r13,%rax
   1a88f:	0f 84 8d 01 00 00    	je     1aa22 <<hyperinterval::float::F64Enclosure>::corner_image+0x552>
   1a895:	48 89 c8             	mov    %rcx,%rax
   1a898:	48 23 44 24 08       	and    0x8(%rsp),%rax
   1a89d:	48 0f 45 c1          	cmovne %rcx,%rax
   1a8a1:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
   1a8a6:	48 89 d1             	mov    %rdx,%rcx
   1a8a9:	4c 21 e9             	and    %r13,%rcx
   1a8ac:	4c 39 e9             	cmp    %r13,%rcx
   1a8af:	0f 84 6d 01 00 00    	je     1aa22 <<hyperinterval::float::F64Enclosure>::corner_image+0x552>
   1a8b5:	48 89 d1             	mov    %rdx,%rcx
   1a8b8:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
   1a8bd:	4c 21 c9             	and    %r9,%rcx
   1a8c0:	48 0f 45 ca          	cmovne %rdx,%rcx
   1a8c4:	4a 8d 14 20          	lea    (%rax,%r12,1),%rdx
   1a8c8:	48 89 c7             	mov    %rax,%rdi
   1a8cb:	4c 21 cf             	and    %r9,%rdi
   1a8ce:	4c 89 e6             	mov    %r12,%rsi
   1a8d1:	48 29 fe             	sub    %rdi,%rsi
   1a8d4:	48 85 c0             	test   %rax,%rax
   1a8d7:	48 0f 49 f2          	cmovns %rdx,%rsi
   1a8db:	4a 8d 3c 21          	lea    (%rcx,%r12,1),%rdi
   1a8df:	49 89 c8             	mov    %rcx,%r8
   1a8e2:	4d 21 c8             	and    %r9,%r8
   1a8e5:	4c 89 e2             	mov    %r12,%rdx
   1a8e8:	4c 29 c2             	sub    %r8,%rdx
   1a8eb:	48 85 c9             	test   %rcx,%rcx
   1a8ee:	48 0f 49 d7          	cmovns %rdi,%rdx
   1a8f2:	48 39 d6             	cmp    %rdx,%rsi
   1a8f5:	40 b7 01             	mov    $0x1,%dil
   1a8f8:	0f 87 26 01 00 00    	ja     1aa24 <<hyperinterval::float::F64Enclosure>::corner_image+0x554>
   1a8fe:	4d 89 e2             	mov    %r12,%r10
   1a901:	4b 8d 3c 27          	lea    (%r15,%r12,1),%rdi
   1a905:	4d 89 f8             	mov    %r15,%r8
   1a908:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
   1a90d:	4d 21 d8             	and    %r11,%r8
   1a910:	4d 89 e1             	mov    %r12,%r9
   1a913:	4d 29 c1             	sub    %r8,%r9
   1a916:	4d 85 ff             	test   %r15,%r15
   1a919:	4c 0f 49 cf          	cmovns %rdi,%r9
   1a91d:	49 39 f1             	cmp    %rsi,%r9
   1a920:	49 0f 46 c7          	cmovbe %r15,%rax
   1a924:	4b 8d 34 26          	lea    (%r14,%r12,1),%rsi
   1a928:	4d 21 f3             	and    %r14,%r11
   1a92b:	4d 29 da             	sub    %r11,%r10
   1a92e:	4d 85 f6             	test   %r14,%r14
   1a931:	4c 0f 49 d6          	cmovns %rsi,%r10
   1a935:	49 39 d2             	cmp    %rdx,%r10
   1a938:	49 0f 43 ce          	cmovae %r14,%rcx
   1a93c:	e9 d8 03 00 00       	jmp    1ad19 <<hyperinterval::float::F64Enclosure>::corner_image+0x849>
   1a941:	49 bc ff ff ff ff ff 	movabs $0xfffffffffffff,%r12
   1a948:	ff 0f 00 
   1a94b:	4c 89 e8             	mov    %r13,%rax
   1a94e:	48 c1 e8 34          	shr    $0x34,%rax
   1a952:	25 ff 07 00 00       	and    $0x7ff,%eax
   1a957:	4c 89 ea             	mov    %r13,%rdx
   1a95a:	4c 21 e2             	and    %r12,%rdx
   1a95d:	8d 88 cd fb ff ff    	lea    -0x433(%rax),%ecx
   1a963:	48 85 c0             	test   %rax,%rax
   1a966:	4e 8d 44 22 01       	lea    0x1(%rdx,%r12,1),%r8
   1a96b:	b8 ce fb ff ff       	mov    $0xfffffbce,%eax
   1a970:	0f 44 c8             	cmove  %eax,%ecx
   1a973:	4c 0f 44 c2          	cmove  %rdx,%r8
   1a977:	4c 8b 54 24 60       	mov    0x60(%rsp),%r10
   1a97c:	4c 89 d2             	mov    %r10,%rdx
   1a97f:	48 c1 ea 34          	shr    $0x34,%rdx
   1a983:	81 e2 ff 07 00 00    	and    $0x7ff,%edx
   1a989:	4c 89 d7             	mov    %r10,%rdi
   1a98c:	4c 21 e7             	and    %r12,%rdi
   1a98f:	44 8d 9a cd fb ff ff 	lea    -0x433(%rdx),%r11d
   1a996:	48 85 d2             	test   %rdx,%rdx
   1a999:	4a 8d 54 27 01       	lea    0x1(%rdi,%r12,1),%rdx
   1a99e:	44 0f 44 d8          	cmove  %eax,%r11d
   1a9a2:	48 0f 44 d7          	cmove  %rdi,%rdx
   1a9a6:	4d 31 d5             	xor    %r10,%r13
   1a9a9:	48 89 54 24 70       	mov    %rdx,0x70(%rsp)
   1a9ae:	48 89 d0             	mov    %rdx,%rax
   1a9b1:	49 f7 e0             	mul    %r8
   1a9b4:	44 89 5c 24 6c       	mov    %r11d,0x6c(%rsp)
   1a9b9:	44 01 d9             	add    %r11d,%ecx
   1a9bc:	49 c1 ed 3f          	shr    $0x3f,%r13
   1a9c0:	44 88 6c 24 24       	mov    %r13b,0x24(%rsp)
   1a9c5:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1a9ca:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1a9cf:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   1a9d3:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1a9d8:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1a9dd:	4c 89 ca             	mov    %r9,%rdx
   1a9e0:	4d 89 cd             	mov    %r9,%r13
   1a9e3:	e8 08 f5 ff ff       	call   19ef0 <<hyperinterval::ieee::Format>::rounded>
   1a9e8:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1a9ed:	0f 85 12 fc ff ff    	jne    1a605 <<hyperinterval::float::F64Enclosure>::corner_image+0x135>
   1a9f3:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1a9f8:	48 89 c8             	mov    %rcx,%rax
   1a9fb:	4c 21 e8             	and    %r13,%rax
   1a9fe:	4c 39 e8             	cmp    %r13,%rax
   1aa01:	74 1f                	je     1aa22 <<hyperinterval::float::F64Enclosure>::corner_image+0x552>
   1aa03:	48 89 c8             	mov    %rcx,%rax
   1aa06:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
   1aa0b:	4c 21 c8             	and    %r9,%rax
   1aa0e:	48 0f 45 c1          	cmovne %rcx,%rax
   1aa12:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
   1aa17:	48 89 d1             	mov    %rdx,%rcx
   1aa1a:	4c 21 e9             	and    %r13,%rcx
   1aa1d:	4c 39 e9             	cmp    %r13,%rcx
   1aa20:	75 1c                	jne    1aa3e <<hyperinterval::float::F64Enclosure>::corner_image+0x56e>
   1aa22:	31 ff                	xor    %edi,%edi
   1aa24:	40 88 7b 08          	mov    %dil,0x8(%rbx)
   1aa28:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1aa2f:	48 83 c4 78          	add    $0x78,%rsp
   1aa33:	5b                   	pop    %rbx
   1aa34:	41 5c                	pop    %r12
   1aa36:	41 5d                	pop    %r13
   1aa38:	41 5e                	pop    %r14
   1aa3a:	41 5f                	pop    %r15
   1aa3c:	5d                   	pop    %rbp
   1aa3d:	c3                   	ret
   1aa3e:	48 89 d1             	mov    %rdx,%rcx
   1aa41:	4c 21 c9             	and    %r9,%rcx
   1aa44:	48 0f 45 ca          	cmovne %rdx,%rcx
   1aa48:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1aa4f:	00 00 80 
   1aa52:	4c 8d 04 30          	lea    (%rax,%rsi,1),%r8
   1aa56:	48 89 c7             	mov    %rax,%rdi
   1aa59:	4c 21 cf             	and    %r9,%rdi
   1aa5c:	48 89 f2             	mov    %rsi,%rdx
   1aa5f:	48 29 fa             	sub    %rdi,%rdx
   1aa62:	48 85 c0             	test   %rax,%rax
   1aa65:	49 0f 49 d0          	cmovns %r8,%rdx
   1aa69:	48 8d 3c 31          	lea    (%rcx,%rsi,1),%rdi
   1aa6d:	49 89 c8             	mov    %rcx,%r8
   1aa70:	4d 21 c8             	and    %r9,%r8
   1aa73:	49 89 f1             	mov    %rsi,%r9
   1aa76:	4d 29 c1             	sub    %r8,%r9
   1aa79:	48 85 c9             	test   %rcx,%rcx
   1aa7c:	4c 0f 49 cf          	cmovns %rdi,%r9
   1aa80:	4c 39 ca             	cmp    %r9,%rdx
   1aa83:	76 05                	jbe    1aa8a <<hyperinterval::float::F64Enclosure>::corner_image+0x5ba>
   1aa85:	40 b7 01             	mov    $0x1,%dil
   1aa88:	eb 9a                	jmp    1aa24 <<hyperinterval::float::F64Enclosure>::corner_image+0x554>
   1aa8a:	49 39 d6             	cmp    %rdx,%r14
   1aa8d:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
   1aa92:	48 0f 47 d0          	cmova  %rax,%rdx
   1aa96:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
   1aa9b:	4d 39 cf             	cmp    %r9,%r15
   1aa9e:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   1aaa3:	48 0f 42 c1          	cmovb  %rcx,%rax
   1aaa7:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1aaac:	4c 8b 44 24 58       	mov    0x58(%rsp),%r8
   1aab1:	4c 89 c0             	mov    %r8,%rax
   1aab4:	48 c1 e8 34          	shr    $0x34,%rax
   1aab8:	25 ff 07 00 00       	and    $0x7ff,%eax
   1aabd:	4c 89 c1             	mov    %r8,%rcx
   1aac0:	4c 21 e1             	and    %r12,%rcx
   1aac3:	44 8d b0 cd fb ff ff 	lea    -0x433(%rax),%r14d
   1aaca:	48 85 c0             	test   %rax,%rax
   1aacd:	4e 8d 7c 21 01       	lea    0x1(%rcx,%r12,1),%r15
   1aad2:	ba ce fb ff ff       	mov    $0xfffffbce,%edx
   1aad7:	44 0f 44 f2          	cmove  %edx,%r14d
   1aadb:	4c 0f 44 f9          	cmove  %rcx,%r15
   1aadf:	48 89 e8             	mov    %rbp,%rax
   1aae2:	48 c1 e8 34          	shr    $0x34,%rax
   1aae6:	25 ff 07 00 00       	and    $0x7ff,%eax
   1aaeb:	48 89 e9             	mov    %rbp,%rcx
   1aaee:	4c 21 e1             	and    %r12,%rcx
   1aaf1:	8d b8 cd fb ff ff    	lea    -0x433(%rax),%edi
   1aaf7:	48 85 c0             	test   %rax,%rax
   1aafa:	4a 8d 44 21 01       	lea    0x1(%rcx,%r12,1),%rax
   1aaff:	0f 44 fa             	cmove  %edx,%edi
   1ab02:	48 0f 44 c1          	cmove  %rcx,%rax
   1ab06:	4c 31 c5             	xor    %r8,%rbp
   1ab09:	49 f7 e7             	mul    %r15
   1ab0c:	44 01 f7             	add    %r14d,%edi
   1ab0f:	48 c1 ed 3f          	shr    $0x3f,%rbp
   1ab13:	40 88 6c 24 24       	mov    %bpl,0x24(%rsp)
   1ab18:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1ab1d:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1ab22:	89 7c 24 20          	mov    %edi,0x20(%rsp)
   1ab26:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1ab2b:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1ab30:	4c 89 ea             	mov    %r13,%rdx
   1ab33:	e8 b8 f3 ff ff       	call   19ef0 <<hyperinterval::ieee::Format>::rounded>
   1ab38:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1ab3d:	0f 85 c2 fa ff ff    	jne    1a605 <<hyperinterval::float::F64Enclosure>::corner_image+0x135>
   1ab43:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
   1ab48:	48 89 c1             	mov    %rax,%rcx
   1ab4b:	4c 21 e9             	and    %r13,%rcx
   1ab4e:	4c 39 e9             	cmp    %r13,%rcx
   1ab51:	0f 84 cb fe ff ff    	je     1aa22 <<hyperinterval::float::F64Enclosure>::corner_image+0x552>
   1ab57:	48 89 c5             	mov    %rax,%rbp
   1ab5a:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
   1ab5f:	4c 21 cd             	and    %r9,%rbp
   1ab62:	48 0f 45 e8          	cmovne %rax,%rbp
   1ab66:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   1ab6b:	48 89 c1             	mov    %rax,%rcx
   1ab6e:	4c 21 e9             	and    %r13,%rcx
   1ab71:	4c 39 e9             	cmp    %r13,%rcx
   1ab74:	0f 84 a8 fe ff ff    	je     1aa22 <<hyperinterval::float::F64Enclosure>::corner_image+0x552>
   1ab7a:	49 89 c4             	mov    %rax,%r12
   1ab7d:	4d 21 cc             	and    %r9,%r12
   1ab80:	4c 0f 45 e0          	cmovne %rax,%r12
   1ab84:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1ab8b:	00 00 80 
   1ab8e:	48 8d 04 2e          	lea    (%rsi,%rbp,1),%rax
   1ab92:	48 89 ea             	mov    %rbp,%rdx
   1ab95:	4c 21 ca             	and    %r9,%rdx
   1ab98:	48 89 f1             	mov    %rsi,%rcx
   1ab9b:	48 29 d1             	sub    %rdx,%rcx
   1ab9e:	48 85 ed             	test   %rbp,%rbp
   1aba1:	48 0f 49 c8          	cmovns %rax,%rcx
   1aba5:	49 8d 14 34          	lea    (%r12,%rsi,1),%rdx
   1aba9:	4c 89 e7             	mov    %r12,%rdi
   1abac:	4c 21 cf             	and    %r9,%rdi
   1abaf:	48 89 f0             	mov    %rsi,%rax
   1abb2:	48 29 f8             	sub    %rdi,%rax
   1abb5:	4d 85 e4             	test   %r12,%r12
   1abb8:	48 0f 49 c2          	cmovns %rdx,%rax
   1abbc:	48 39 c1             	cmp    %rax,%rcx
   1abbf:	0f 87 c0 fe ff ff    	ja     1aa85 <<hyperinterval::float::F64Enclosure>::corner_image+0x5b5>
   1abc5:	4c 8b 54 24 30       	mov    0x30(%rsp),%r10
   1abca:	4c 89 d2             	mov    %r10,%rdx
   1abcd:	4c 21 ca             	and    %r9,%rdx
   1abd0:	48 89 f7             	mov    %rsi,%rdi
   1abd3:	48 29 d7             	sub    %rdx,%rdi
   1abd6:	49 8d 14 32          	lea    (%r10,%rsi,1),%rdx
   1abda:	4d 85 d2             	test   %r10,%r10
   1abdd:	48 0f 49 fa          	cmovns %rdx,%rdi
   1abe1:	48 39 cf             	cmp    %rcx,%rdi
   1abe4:	49 0f 46 ea          	cmovbe %r10,%rbp
   1abe8:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
   1abed:	48 89 f9             	mov    %rdi,%rcx
   1abf0:	4c 21 c9             	and    %r9,%rcx
   1abf3:	48 89 f2             	mov    %rsi,%rdx
   1abf6:	48 29 ca             	sub    %rcx,%rdx
   1abf9:	48 8d 0c 37          	lea    (%rdi,%rsi,1),%rcx
   1abfd:	48 85 ff             	test   %rdi,%rdi
   1ac00:	48 0f 49 d1          	cmovns %rcx,%rdx
   1ac04:	48 39 c2             	cmp    %rax,%rdx
   1ac07:	4c 0f 43 e7          	cmovae %rdi,%r12
   1ac0b:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
   1ac10:	48 33 44 24 58       	xor    0x58(%rsp),%rax
   1ac15:	8b 4c 24 6c          	mov    0x6c(%rsp),%ecx
   1ac19:	44 01 f1             	add    %r14d,%ecx
   1ac1c:	48 c1 e8 3f          	shr    $0x3f,%rax
   1ac20:	88 44 24 24          	mov    %al,0x24(%rsp)
   1ac24:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
   1ac29:	49 f7 e7             	mul    %r15
   1ac2c:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1ac31:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1ac36:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   1ac3a:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1ac3f:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1ac44:	4c 89 ea             	mov    %r13,%rdx
   1ac47:	e8 a4 f2 ff ff       	call   19ef0 <<hyperinterval::ieee::Format>::rounded>
   1ac4c:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1ac51:	0f 85 ae f9 ff ff    	jne    1a605 <<hyperinterval::float::F64Enclosure>::corner_image+0x135>
   1ac57:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1ac5c:	48 89 c8             	mov    %rcx,%rax
   1ac5f:	4c 21 e8             	and    %r13,%rax
   1ac62:	4c 39 e8             	cmp    %r13,%rax
   1ac65:	0f 84 b7 fd ff ff    	je     1aa22 <<hyperinterval::float::F64Enclosure>::corner_image+0x552>
   1ac6b:	48 89 c8             	mov    %rcx,%rax
   1ac6e:	48 23 44 24 08       	and    0x8(%rsp),%rax
   1ac73:	48 0f 45 c1          	cmovne %rcx,%rax
   1ac77:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
   1ac7c:	48 89 d1             	mov    %rdx,%rcx
   1ac7f:	4c 21 e9             	and    %r13,%rcx
   1ac82:	4c 39 e9             	cmp    %r13,%rcx
   1ac85:	0f 84 97 fd ff ff    	je     1aa22 <<hyperinterval::float::F64Enclosure>::corner_image+0x552>
   1ac8b:	48 89 d1             	mov    %rdx,%rcx
   1ac8e:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
   1ac93:	4c 21 c9             	and    %r9,%rcx
   1ac96:	48 0f 45 ca          	cmovne %rdx,%rcx
   1ac9a:	49 ba 00 00 00 00 00 	movabs $0x8000000000000000,%r10
   1aca1:	00 00 80 
   1aca4:	4a 8d 14 10          	lea    (%rax,%r10,1),%rdx
   1aca8:	48 89 c7             	mov    %rax,%rdi
   1acab:	4c 21 cf             	and    %r9,%rdi
   1acae:	4c 89 d6             	mov    %r10,%rsi
   1acb1:	48 29 fe             	sub    %rdi,%rsi
   1acb4:	48 85 c0             	test   %rax,%rax
   1acb7:	48 0f 49 f2          	cmovns %rdx,%rsi
   1acbb:	4a 8d 3c 11          	lea    (%rcx,%r10,1),%rdi
   1acbf:	49 89 c8             	mov    %rcx,%r8
   1acc2:	4d 21 c8             	and    %r9,%r8
   1acc5:	4c 89 d2             	mov    %r10,%rdx
   1acc8:	4c 29 c2             	sub    %r8,%rdx
   1accb:	48 85 c9             	test   %rcx,%rcx
   1acce:	48 0f 49 d7          	cmovns %rdi,%rdx
   1acd2:	48 39 d6             	cmp    %rdx,%rsi
   1acd5:	40 b7 01             	mov    $0x1,%dil
   1acd8:	0f 87 46 fd ff ff    	ja     1aa24 <<hyperinterval::float::F64Enclosure>::corner_image+0x554>
   1acde:	49 8d 3c 2a          	lea    (%r10,%rbp,1),%rdi
   1ace2:	49 89 e8             	mov    %rbp,%r8
   1ace5:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
   1acea:	4d 21 d8             	and    %r11,%r8
   1aced:	4d 89 d1             	mov    %r10,%r9
   1acf0:	4d 29 c1             	sub    %r8,%r9
   1acf3:	48 85 ed             	test   %rbp,%rbp
   1acf6:	4c 0f 49 cf          	cmovns %rdi,%r9
   1acfa:	49 39 f1             	cmp    %rsi,%r9
   1acfd:	48 0f 46 c5          	cmovbe %rbp,%rax
   1ad01:	4b 8d 34 14          	lea    (%r12,%r10,1),%rsi
   1ad05:	4d 21 e3             	and    %r12,%r11
   1ad08:	4d 29 da             	sub    %r11,%r10
   1ad0b:	4d 85 e4             	test   %r12,%r12
   1ad0e:	4c 0f 49 d6          	cmovns %rsi,%r10
   1ad12:	49 39 d2             	cmp    %rdx,%r10
   1ad15:	49 0f 43 cc          	cmovae %r12,%rcx
   1ad19:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1ad20:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1ad24:	48 89 4b 10          	mov    %rcx,0x10(%rbx)
   1ad28:	e9 02 fd ff ff       	jmp    1aa2f <<hyperinterval::float::F64Enclosure>::corner_image+0x55f>
   1ad2d:	cc                   	int3
   1ad2e:	cc                   	int3
   1ad2f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::intersection:
   1ad30:	48 89 f8             	mov    %rdi,%rax
   1ad33:	45 31 c0             	xor    %r8d,%r8d
   1ad36:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1ad3a:	0f 85 d5 00 00 00    	jne    1ae15 <<hyperinterval::float::F64Enclosure>::intersection+0xe5>
   1ad40:	f6 02 01             	testb  $0x1,(%rdx)
   1ad43:	0f 84 c0 00 00 00    	je     1ae09 <<hyperinterval::float::F64Enclosure>::intersection+0xd9>
   1ad49:	41 56                	push   %r14
   1ad4b:	53                   	push   %rbx
   1ad4c:	4c 8b 52 08          	mov    0x8(%rdx),%r10
   1ad50:	4c 8b 4a 10          	mov    0x10(%rdx),%r9
   1ad54:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1ad58:	48 ba 00 00 00 00 00 	movabs $0x8000000000000000,%rdx
   1ad5f:	00 00 80 
   1ad62:	48 8d 3c 11          	lea    (%rcx,%rdx,1),%rdi
   1ad66:	4c 8d 42 ff          	lea    -0x1(%rdx),%r8
   1ad6a:	49 89 cb             	mov    %rcx,%r11
   1ad6d:	4d 21 c3             	and    %r8,%r11
   1ad70:	48 89 d3             	mov    %rdx,%rbx
   1ad73:	4c 29 db             	sub    %r11,%rbx
   1ad76:	48 85 c9             	test   %rcx,%rcx
   1ad79:	48 0f 49 df          	cmovns %rdi,%rbx
   1ad7d:	49 8d 3c 12          	lea    (%r10,%rdx,1),%rdi
   1ad81:	4d 89 d3             	mov    %r10,%r11
   1ad84:	4d 21 c3             	and    %r8,%r11
   1ad87:	49 89 d6             	mov    %rdx,%r14
   1ad8a:	4d 29 de             	sub    %r11,%r14
   1ad8d:	4d 85 d2             	test   %r10,%r10
   1ad90:	4c 0f 49 f7          	cmovns %rdi,%r14
   1ad94:	48 8b 7e 10          	mov    0x10(%rsi),%rdi
   1ad98:	4c 39 f3             	cmp    %r14,%rbx
   1ad9b:	49 0f 42 ca          	cmovb  %r10,%rcx
   1ad9f:	48 8d 34 17          	lea    (%rdi,%rdx,1),%rsi
   1ada3:	49 89 fa             	mov    %rdi,%r10
   1ada6:	4d 21 c2             	and    %r8,%r10
   1ada9:	49 89 d3             	mov    %rdx,%r11
   1adac:	4d 29 d3             	sub    %r10,%r11
   1adaf:	48 85 ff             	test   %rdi,%rdi
   1adb2:	4c 0f 49 de          	cmovns %rsi,%r11
   1adb6:	49 8d 34 11          	lea    (%r9,%rdx,1),%rsi
   1adba:	4d 89 ca             	mov    %r9,%r10
   1adbd:	4d 21 c2             	and    %r8,%r10
   1adc0:	48 89 d3             	mov    %rdx,%rbx
   1adc3:	4c 29 d3             	sub    %r10,%rbx
   1adc6:	4d 85 c9             	test   %r9,%r9
   1adc9:	48 0f 49 de          	cmovns %rsi,%rbx
   1adcd:	49 39 db             	cmp    %rbx,%r11
   1add0:	49 0f 47 f9          	cmova  %r9,%rdi
   1add4:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
   1add8:	49 89 c9             	mov    %rcx,%r9
   1addb:	4d 21 c1             	and    %r8,%r9
   1adde:	49 89 d2             	mov    %rdx,%r10
   1ade1:	4d 29 ca             	sub    %r9,%r10
   1ade4:	48 85 c9             	test   %rcx,%rcx
   1ade7:	4c 0f 49 d6          	cmovns %rsi,%r10
   1adeb:	48 8d 34 17          	lea    (%rdi,%rdx,1),%rsi
   1adef:	49 21 f8             	and    %rdi,%r8
   1adf2:	4c 29 c2             	sub    %r8,%rdx
   1adf5:	48 85 ff             	test   %rdi,%rdi
   1adf8:	48 0f 49 d6          	cmovns %rsi,%rdx
   1adfc:	45 31 c0             	xor    %r8d,%r8d
   1adff:	49 39 d2             	cmp    %rdx,%r10
   1ae02:	41 0f 96 c0          	setbe  %r8b
   1ae06:	5b                   	pop    %rbx
   1ae07:	41 5e                	pop    %r14
   1ae09:	4c 89 00             	mov    %r8,(%rax)
   1ae0c:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1ae10:	48 89 78 10          	mov    %rdi,0x10(%rax)
   1ae14:	c3                   	ret
   1ae15:	4c 89 00             	mov    %r8,(%rax)
   1ae18:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1ae1c:	48 89 78 10          	mov    %rdi,0x10(%rax)
   1ae20:	c3                   	ret
   1ae21:	cc                   	int3
   1ae22:	cc                   	int3
   1ae23:	cc                   	int3
   1ae24:	cc                   	int3
   1ae25:	cc                   	int3
   1ae26:	cc                   	int3
   1ae27:	cc                   	int3
   1ae28:	cc                   	int3
   1ae29:	cc                   	int3
   1ae2a:	cc                   	int3
   1ae2b:	cc                   	int3
   1ae2c:	cc                   	int3
   1ae2d:	cc                   	int3
   1ae2e:	cc                   	int3
   1ae2f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::contains_point:
   1ae30:	66 48 0f 7e c6       	movq   %xmm0,%rsi
   1ae35:	48 b8 00 00 00 00 00 	movabs $0x7ff0000000000000,%rax
   1ae3c:	00 f0 7f 
   1ae3f:	48 89 f1             	mov    %rsi,%rcx
   1ae42:	48 21 c1             	and    %rax,%rcx
   1ae45:	31 d2                	xor    %edx,%edx
   1ae47:	48 39 c1             	cmp    %rax,%rcx
   1ae4a:	0f 84 83 00 00 00    	je     1aed3 <<hyperinterval::float::F64Enclosure>::contains_point+0xa3>
   1ae50:	f6 07 01             	testb  $0x1,(%rdi)
   1ae53:	74 7e                	je     1aed3 <<hyperinterval::float::F64Enclosure>::contains_point+0xa3>
   1ae55:	41 56                	push   %r14
   1ae57:	53                   	push   %rbx
   1ae58:	31 d2                	xor    %edx,%edx
   1ae5a:	66 0f 57 c9          	xorpd  %xmm1,%xmm1
   1ae5e:	66 0f 2e c1          	ucomisd %xmm1,%xmm0
   1ae62:	41 ba 00 00 00 00    	mov    $0x0,%r10d
   1ae68:	4c 0f 45 d6          	cmovne %rsi,%r10
   1ae6c:	4c 0f 4a d6          	cmovp  %rsi,%r10
   1ae70:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1ae77:	00 00 80 
   1ae7a:	4c 8b 4f 08          	mov    0x8(%rdi),%r9
   1ae7e:	4d 8d 1c 31          	lea    (%r9,%rsi,1),%r11
   1ae82:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   1ae86:	4c 89 cb             	mov    %r9,%rbx
   1ae89:	4c 21 c3             	and    %r8,%rbx
   1ae8c:	49 89 f6             	mov    %rsi,%r14
   1ae8f:	49 29 de             	sub    %rbx,%r14
   1ae92:	4d 85 c9             	test   %r9,%r9
   1ae95:	4d 0f 49 f3          	cmovns %r11,%r14
   1ae99:	4d 8d 1c 32          	lea    (%r10,%rsi,1),%r11
   1ae9d:	4c 89 d3             	mov    %r10,%rbx
   1aea0:	4c 21 c3             	and    %r8,%rbx
   1aea3:	49 89 f1             	mov    %rsi,%r9
   1aea6:	49 29 d9             	sub    %rbx,%r9
   1aea9:	4d 85 d2             	test   %r10,%r10
   1aeac:	4d 0f 49 cb          	cmovns %r11,%r9
   1aeb0:	4d 39 ce             	cmp    %r9,%r14
   1aeb3:	5b                   	pop    %rbx
   1aeb4:	41 5e                	pop    %r14
   1aeb6:	77 1b                	ja     1aed3 <<hyperinterval::float::F64Enclosure>::contains_point+0xa3>
   1aeb8:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1aebc:	48 8d 3c 32          	lea    (%rdx,%rsi,1),%rdi
   1aec0:	49 21 d0             	and    %rdx,%r8
   1aec3:	4c 29 c6             	sub    %r8,%rsi
   1aec6:	48 85 d2             	test   %rdx,%rdx
   1aec9:	48 0f 49 f7          	cmovns %rdi,%rsi
   1aecd:	49 39 f1             	cmp    %rsi,%r9
   1aed0:	0f 96 c2             	setbe  %dl
   1aed3:	48 39 c1             	cmp    %rax,%rcx
   1aed6:	0f 94 c0             	sete   %al
   1aed9:	c3                   	ret
   1aeda:	cc                   	int3
   1aedb:	cc                   	int3
   1aedc:	cc                   	int3
   1aedd:	cc                   	int3
   1aede:	cc                   	int3
   1aedf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::interior_subset_of:
   1aee0:	b0 01                	mov    $0x1,%al
   1aee2:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1aee6:	0f 85 8b 00 00 00    	jne    1af77 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x97>
   1aeec:	f6 06 01             	testb  $0x1,(%rsi)
   1aeef:	0f 84 80 00 00 00    	je     1af75 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x95>
   1aef5:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1aef9:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1aefd:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1af04:	00 00 80 
   1af07:	4d 8d 0c 00          	lea    (%r8,%rax,1),%r9
   1af0b:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1af0f:	4d 89 c2             	mov    %r8,%r10
   1af12:	49 21 ca             	and    %rcx,%r10
   1af15:	49 89 c3             	mov    %rax,%r11
   1af18:	4d 29 d3             	sub    %r10,%r11
   1af1b:	4d 85 c0             	test   %r8,%r8
   1af1e:	4d 0f 49 d9          	cmovns %r9,%r11
   1af22:	4c 8d 04 02          	lea    (%rdx,%rax,1),%r8
   1af26:	49 89 d1             	mov    %rdx,%r9
   1af29:	49 21 c9             	and    %rcx,%r9
   1af2c:	49 89 c2             	mov    %rax,%r10
   1af2f:	4d 29 ca             	sub    %r9,%r10
   1af32:	48 85 d2             	test   %rdx,%rdx
   1af35:	4d 0f 49 d0          	cmovns %r8,%r10
   1af39:	4d 39 d3             	cmp    %r10,%r11
   1af3c:	73 37                	jae    1af75 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x95>
   1af3e:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1af42:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1af46:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1af4a:	49 89 d0             	mov    %rdx,%r8
   1af4d:	49 21 c8             	and    %rcx,%r8
   1af50:	49 89 c1             	mov    %rax,%r9
   1af53:	4d 29 c1             	sub    %r8,%r9
   1af56:	48 85 d2             	test   %rdx,%rdx
   1af59:	4c 0f 49 cf          	cmovns %rdi,%r9
   1af5d:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1af61:	48 21 f1             	and    %rsi,%rcx
   1af64:	48 29 c8             	sub    %rcx,%rax
   1af67:	48 85 f6             	test   %rsi,%rsi
   1af6a:	48 0f 49 c2          	cmovns %rdx,%rax
   1af6e:	49 39 c1             	cmp    %rax,%r9
   1af71:	0f 92 c0             	setb   %al
   1af74:	c3                   	ret
   1af75:	31 c0                	xor    %eax,%eax
   1af77:	c3                   	ret
   1af78:	cc                   	int3
   1af79:	cc                   	int3
   1af7a:	cc                   	int3
   1af7b:	cc                   	int3
   1af7c:	cc                   	int3
   1af7d:	cc                   	int3
   1af7e:	cc                   	int3
   1af7f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::add:
   1af80:	48 89 f8             	mov    %rdi,%rax
   1af83:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1af87:	0f 85 94 00 00 00    	jne    1b021 <<hyperinterval::float::F64Enclosure>::add+0xa1>
   1af8d:	f6 02 01             	testb  $0x1,(%rdx)
   1af90:	0f 84 8b 00 00 00    	je     1b021 <<hyperinterval::float::F64Enclosure>::add+0xa1>
   1af96:	55                   	push   %rbp
   1af97:	41 57                	push   %r15
   1af99:	41 56                	push   %r14
   1af9b:	41 55                	push   %r13
   1af9d:	41 54                	push   %r12
   1af9f:	53                   	push   %rbx
   1afa0:	48 83 ec 18          	sub    $0x18,%rsp
   1afa4:	49 89 c5             	mov    %rax,%r13
   1afa7:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1afab:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1afaf:	4c 8b 62 10          	mov    0x10(%rdx),%r12
   1afb3:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1afba:	00 00 80 
   1afbd:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1afc4:	00 f0 7f 
   1afc7:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   1afcb:	48 89 e7             	mov    %rsp,%rdi
   1afce:	48 89 de             	mov    %rbx,%rsi
   1afd1:	4c 89 f2             	mov    %r14,%rdx
   1afd4:	e8 37 e4 ff ff       	call   19410 <<hyperinterval::ieee::Format>::add>
   1afd9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1afdd:	74 1f                	je     1affe <<hyperinterval::float::F64Enclosure>::add+0x7e>
   1afdf:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1afe4:	48 89 e7             	mov    %rsp,%rdi
   1afe7:	48 89 de             	mov    %rbx,%rsi
   1afea:	4c 89 f2             	mov    %r14,%rdx
   1afed:	4c 89 f9             	mov    %r15,%rcx
   1aff0:	4d 89 e0             	mov    %r12,%r8
   1aff3:	e8 18 e4 ff ff       	call   19410 <<hyperinterval::ieee::Format>::add>
   1aff8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1affc:	75 2b                	jne    1b029 <<hyperinterval::float::F64Enclosure>::add+0xa9>
   1affe:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   1b003:	4c 89 e8             	mov    %r13,%rax
   1b006:	41 88 4d 08          	mov    %cl,0x8(%r13)
   1b00a:	49 c7 45 00 02 00 00 	movq   $0x2,0x0(%r13)
   1b011:	00 
   1b012:	48 83 c4 18          	add    $0x18,%rsp
   1b016:	5b                   	pop    %rbx
   1b017:	41 5c                	pop    %r12
   1b019:	41 5d                	pop    %r13
   1b01b:	41 5e                	pop    %r14
   1b01d:	41 5f                	pop    %r15
   1b01f:	5d                   	pop    %rbp
   1b020:	c3                   	ret
   1b021:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   1b028:	c3                   	ret
   1b029:	48 89 e8             	mov    %rbp,%rax
   1b02c:	4c 21 f0             	and    %r14,%rax
   1b02f:	4c 39 f0             	cmp    %r14,%rax
   1b032:	4c 89 e8             	mov    %r13,%rax
   1b035:	74 1e                	je     1b055 <<hyperinterval::float::F64Enclosure>::add+0xd5>
   1b037:	48 8d 53 ff          	lea    -0x1(%rbx),%rdx
   1b03b:	48 89 e9             	mov    %rbp,%rcx
   1b03e:	48 21 d1             	and    %rdx,%rcx
   1b041:	48 0f 45 cd          	cmovne %rbp,%rcx
   1b045:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
   1b04a:	48 89 fe             	mov    %rdi,%rsi
   1b04d:	4c 21 f6             	and    %r14,%rsi
   1b050:	4c 39 f6             	cmp    %r14,%rsi
   1b053:	75 0d                	jne    1b062 <<hyperinterval::float::F64Enclosure>::add+0xe2>
   1b055:	c6 40 08 00          	movb   $0x0,0x8(%rax)
   1b059:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1b060:	eb b0                	jmp    1b012 <<hyperinterval::float::F64Enclosure>::add+0x92>
   1b062:	48 89 fe             	mov    %rdi,%rsi
   1b065:	48 21 d6             	and    %rdx,%rsi
   1b068:	48 0f 45 f7          	cmovne %rdi,%rsi
   1b06c:	48 8d 3c 19          	lea    (%rcx,%rbx,1),%rdi
   1b070:	49 89 c8             	mov    %rcx,%r8
   1b073:	49 21 d0             	and    %rdx,%r8
   1b076:	49 89 d9             	mov    %rbx,%r9
   1b079:	4d 29 c1             	sub    %r8,%r9
   1b07c:	48 85 c9             	test   %rcx,%rcx
   1b07f:	4c 0f 49 cf          	cmovns %rdi,%r9
   1b083:	48 8d 3c 1e          	lea    (%rsi,%rbx,1),%rdi
   1b087:	48 21 f2             	and    %rsi,%rdx
   1b08a:	48 29 d3             	sub    %rdx,%rbx
   1b08d:	48 85 f6             	test   %rsi,%rsi
   1b090:	48 0f 49 df          	cmovns %rdi,%rbx
   1b094:	49 39 d9             	cmp    %rbx,%r9
   1b097:	76 10                	jbe    1b0a9 <<hyperinterval::float::F64Enclosure>::add+0x129>
   1b099:	c6 40 08 01          	movb   $0x1,0x8(%rax)
   1b09d:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1b0a4:	e9 69 ff ff ff       	jmp    1b012 <<hyperinterval::float::F64Enclosure>::add+0x92>
   1b0a9:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   1b0b0:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1b0b4:	48 89 70 10          	mov    %rsi,0x10(%rax)
   1b0b8:	e9 55 ff ff ff       	jmp    1b012 <<hyperinterval::float::F64Enclosure>::add+0x92>
   1b0bd:	cc                   	int3
   1b0be:	cc                   	int3
   1b0bf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::div:
   1b0c0:	53                   	push   %rbx
   1b0c1:	48 89 fb             	mov    %rdi,%rbx
   1b0c4:	83 3a 01             	cmpl   $0x1,(%rdx)
   1b0c7:	75 1e                	jne    1b0e7 <<hyperinterval::float::F64Enclosure>::div+0x27>
   1b0c9:	48 83 7a 08 00       	cmpq   $0x0,0x8(%rdx)
   1b0ce:	7f 17                	jg     1b0e7 <<hyperinterval::float::F64Enclosure>::div+0x27>
   1b0d0:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1b0d4:	48 85 c0             	test   %rax,%rax
   1b0d7:	0f 99 c1             	setns  %cl
   1b0da:	48 d1 e0             	shl    $1,%rax
   1b0dd:	48 85 c0             	test   %rax,%rax
   1b0e0:	0f 94 c0             	sete   %al
   1b0e3:	08 c8                	or     %cl,%al
   1b0e5:	75 12                	jne    1b0f9 <<hyperinterval::float::F64Enclosure>::div+0x39>
   1b0e7:	48 89 df             	mov    %rbx,%rdi
   1b0ea:	b9 01 00 00 00       	mov    $0x1,%ecx
   1b0ef:	e8 dc f3 ff ff       	call   1a4d0 <<hyperinterval::float::F64Enclosure>::corner_image>
   1b0f4:	48 89 d8             	mov    %rbx,%rax
   1b0f7:	5b                   	pop    %rbx
   1b0f8:	c3                   	ret
   1b0f9:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
   1b0fd:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b104:	48 89 d8             	mov    %rbx,%rax
   1b107:	5b                   	pop    %rbx
   1b108:	c3                   	ret
   1b109:	cc                   	int3
   1b10a:	cc                   	int3
   1b10b:	cc                   	int3
   1b10c:	cc                   	int3
   1b10d:	cc                   	int3
   1b10e:	cc                   	int3
   1b10f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::new:
   1b110:	48 89 f8             	mov    %rdi,%rax
   1b113:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1b11a:	00 f0 7f 
   1b11d:	66 48 0f 7e c6       	movq   %xmm0,%rsi
   1b122:	48 89 f1             	mov    %rsi,%rcx
   1b125:	48 21 d1             	and    %rdx,%rcx
   1b128:	48 39 d1             	cmp    %rdx,%rcx
   1b12b:	74 22                	je     1b14f <<hyperinterval::float::F64Enclosure>::new+0x3f>
   1b12d:	31 c9                	xor    %ecx,%ecx
   1b12f:	66 0f 57 d2          	xorpd  %xmm2,%xmm2
   1b133:	66 0f 2e c2          	ucomisd %xmm2,%xmm0
   1b137:	48 0f 45 ce          	cmovne %rsi,%rcx
   1b13b:	48 0f 4a ce          	cmovp  %rsi,%rcx
   1b13f:	66 48 0f 7e ce       	movq   %xmm1,%rsi
   1b144:	48 89 f7             	mov    %rsi,%rdi
   1b147:	48 21 d7             	and    %rdx,%rdi
   1b14a:	48 39 d7             	cmp    %rdx,%rdi
   1b14d:	75 0c                	jne    1b15b <<hyperinterval::float::F64Enclosure>::new+0x4b>
   1b14f:	c6 40 08 00          	movb   $0x0,0x8(%rax)
   1b153:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1b15a:	c3                   	ret
   1b15b:	31 d2                	xor    %edx,%edx
   1b15d:	66 0f 2e ca          	ucomisd %xmm2,%xmm1
   1b161:	48 0f 45 d6          	cmovne %rsi,%rdx
   1b165:	48 0f 4a d6          	cmovp  %rsi,%rdx
   1b169:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b170:	00 00 80 
   1b173:	48 8d 3c 31          	lea    (%rcx,%rsi,1),%rdi
   1b177:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   1b17b:	49 89 c9             	mov    %rcx,%r9
   1b17e:	4d 21 c1             	and    %r8,%r9
   1b181:	49 89 f2             	mov    %rsi,%r10
   1b184:	4d 29 ca             	sub    %r9,%r10
   1b187:	48 85 c9             	test   %rcx,%rcx
   1b18a:	4c 0f 49 d7          	cmovns %rdi,%r10
   1b18e:	48 8d 3c 32          	lea    (%rdx,%rsi,1),%rdi
   1b192:	49 21 d0             	and    %rdx,%r8
   1b195:	4c 29 c6             	sub    %r8,%rsi
   1b198:	48 85 d2             	test   %rdx,%rdx
   1b19b:	48 0f 49 f7          	cmovns %rdi,%rsi
   1b19f:	49 39 f2             	cmp    %rsi,%r10
   1b1a2:	76 0c                	jbe    1b1b0 <<hyperinterval::float::F64Enclosure>::new+0xa0>
   1b1a4:	c6 40 08 01          	movb   $0x1,0x8(%rax)
   1b1a8:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1b1af:	c3                   	ret
   1b1b0:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   1b1b7:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1b1bb:	48 89 50 10          	mov    %rdx,0x10(%rax)
   1b1bf:	c3                   	ret

<hyperinterval::float::F64Enclosure>::sub:
   1b1c0:	53                   	push   %rbx
   1b1c1:	48 83 ec 20          	sub    $0x20,%rsp
   1b1c5:	48 89 fb             	mov    %rdi,%rbx
   1b1c8:	48 83 3a 01          	cmpq   $0x1,(%rdx)
   1b1cc:	75 30                	jne    1b1fe <<hyperinterval::float::F64Enclosure>::sub+0x3e>
   1b1ce:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   1b1d2:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1b1d6:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1b1dd:	00 00 80 
   1b1e0:	48 89 d1             	mov    %rdx,%rcx
   1b1e3:	48 31 c1             	xor    %rax,%rcx
   1b1e6:	48 85 d2             	test   %rdx,%rdx
   1b1e9:	48 0f 44 ca          	cmove  %rdx,%rcx
   1b1ed:	48 31 f8             	xor    %rdi,%rax
   1b1f0:	48 85 ff             	test   %rdi,%rdi
   1b1f3:	48 0f 44 c7          	cmove  %rdi,%rax
   1b1f7:	ba 01 00 00 00       	mov    $0x1,%edx
   1b1fc:	eb 02                	jmp    1b200 <<hyperinterval::float::F64Enclosure>::sub+0x40>
   1b1fe:	31 d2                	xor    %edx,%edx
   1b200:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b205:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
   1b20a:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1b20f:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
   1b214:	48 89 df             	mov    %rbx,%rdi
   1b217:	ff 15 ab fc 03 00    	call   *0x3fcab(%rip)        # 5aec8 <_DYNAMIC+0x300>
   1b21d:	48 89 d8             	mov    %rbx,%rax
   1b220:	48 83 c4 20          	add    $0x20,%rsp
   1b224:	5b                   	pop    %rbx
   1b225:	c3                   	ret
   1b226:	cc                   	int3
   1b227:	cc                   	int3
   1b228:	cc                   	int3
   1b229:	cc                   	int3
   1b22a:	cc                   	int3
   1b22b:	cc                   	int3
   1b22c:	cc                   	int3
   1b22d:	cc                   	int3
   1b22e:	cc                   	int3
   1b22f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::hull:
   1b230:	48 89 f8             	mov    %rdi,%rax
   1b233:	4c 8b 02             	mov    (%rdx),%r8
   1b236:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   1b23a:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
   1b23e:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b242:	0f 85 9f 00 00 00    	jne    1b2e7 <<hyperinterval::float::F64Enclosure>::hull+0xb7>
   1b248:	4c 8b 56 08          	mov    0x8(%rsi),%r10
   1b24c:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1b250:	ba 01 00 00 00       	mov    $0x1,%edx
   1b255:	49 83 f8 01          	cmp    $0x1,%r8
   1b259:	0f 85 97 00 00 00    	jne    1b2f6 <<hyperinterval::float::F64Enclosure>::hull+0xc6>
   1b25f:	41 57                	push   %r15
   1b261:	41 56                	push   %r14
   1b263:	53                   	push   %rbx
   1b264:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1b26b:	00 00 80 
   1b26e:	4f 8d 1c 02          	lea    (%r10,%r8,1),%r11
   1b272:	4d 8d 48 ff          	lea    -0x1(%r8),%r9
   1b276:	4c 89 d3             	mov    %r10,%rbx
   1b279:	4c 21 cb             	and    %r9,%rbx
   1b27c:	4d 89 c6             	mov    %r8,%r14
   1b27f:	49 29 de             	sub    %rbx,%r14
   1b282:	4d 85 d2             	test   %r10,%r10
   1b285:	4d 0f 49 f3          	cmovns %r11,%r14
   1b289:	4e 8d 1c 07          	lea    (%rdi,%r8,1),%r11
   1b28d:	48 89 fb             	mov    %rdi,%rbx
   1b290:	4c 21 cb             	and    %r9,%rbx
   1b293:	4d 89 c7             	mov    %r8,%r15
   1b296:	49 29 df             	sub    %rbx,%r15
   1b299:	48 85 ff             	test   %rdi,%rdi
   1b29c:	4d 0f 49 fb          	cmovns %r11,%r15
   1b2a0:	4d 39 fe             	cmp    %r15,%r14
   1b2a3:	49 0f 46 fa          	cmovbe %r10,%rdi
   1b2a7:	4e 8d 14 06          	lea    (%rsi,%r8,1),%r10
   1b2ab:	49 89 f3             	mov    %rsi,%r11
   1b2ae:	4d 21 cb             	and    %r9,%r11
   1b2b1:	4c 89 c3             	mov    %r8,%rbx
   1b2b4:	4c 29 db             	sub    %r11,%rbx
   1b2b7:	48 85 f6             	test   %rsi,%rsi
   1b2ba:	49 0f 49 da          	cmovns %r10,%rbx
   1b2be:	4e 8d 14 01          	lea    (%rcx,%r8,1),%r10
   1b2c2:	49 21 c9             	and    %rcx,%r9
   1b2c5:	4d 29 c8             	sub    %r9,%r8
   1b2c8:	48 85 c9             	test   %rcx,%rcx
   1b2cb:	4d 0f 49 c2          	cmovns %r10,%r8
   1b2cf:	4c 39 c3             	cmp    %r8,%rbx
   1b2d2:	48 0f 43 ce          	cmovae %rsi,%rcx
   1b2d6:	5b                   	pop    %rbx
   1b2d7:	41 5e                	pop    %r14
   1b2d9:	41 5f                	pop    %r15
   1b2db:	48 89 10             	mov    %rdx,(%rax)
   1b2de:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1b2e2:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1b2e6:	c3                   	ret
   1b2e7:	4c 89 c2             	mov    %r8,%rdx
   1b2ea:	48 89 10             	mov    %rdx,(%rax)
   1b2ed:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1b2f1:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1b2f5:	c3                   	ret
   1b2f6:	48 89 f1             	mov    %rsi,%rcx
   1b2f9:	4c 89 d7             	mov    %r10,%rdi
   1b2fc:	48 89 10             	mov    %rdx,(%rax)
   1b2ff:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1b303:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1b307:	c3                   	ret
   1b308:	cc                   	int3
   1b309:	cc                   	int3
   1b30a:	cc                   	int3
   1b30b:	cc                   	int3
   1b30c:	cc                   	int3
   1b30d:	cc                   	int3
   1b30e:	cc                   	int3
   1b30f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::point:
   1b310:	48 89 f8             	mov    %rdi,%rax
   1b313:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1b318:	48 89 ca             	mov    %rcx,%rdx
   1b31b:	48 f7 d2             	not    %rdx
   1b31e:	48 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%rsi
   1b325:	00 f0 7f 
   1b328:	48 85 f2             	test   %rsi,%rdx
   1b32b:	75 0d                	jne    1b33a <<hyperinterval::float::F64Enclosure>::point+0x2a>
   1b32d:	c6 40 08 00          	movb   $0x0,0x8(%rax)
   1b331:	b9 02 00 00 00       	mov    $0x2,%ecx
   1b336:	48 89 08             	mov    %rcx,(%rax)
   1b339:	c3                   	ret
   1b33a:	31 d2                	xor    %edx,%edx
   1b33c:	66 0f 57 c9          	xorpd  %xmm1,%xmm1
   1b340:	66 0f 2e c1          	ucomisd %xmm1,%xmm0
   1b344:	48 0f 45 d1          	cmovne %rcx,%rdx
   1b348:	48 0f 4a d1          	cmovp  %rcx,%rdx
   1b34c:	48 89 50 08          	mov    %rdx,0x8(%rax)
   1b350:	48 89 50 10          	mov    %rdx,0x10(%rax)
   1b354:	b9 01 00 00 00       	mov    $0x1,%ecx
   1b359:	48 89 08             	mov    %rcx,(%rax)
   1b35c:	c3                   	ret
   1b35d:	cc                   	int3
   1b35e:	cc                   	int3
   1b35f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::signs:
   1b360:	83 3f 01             	cmpl   $0x1,(%rdi)
   1b363:	75 69                	jne    1b3ce <<hyperinterval::float::F64Enclosure>::signs+0x6e>
   1b365:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1b36c:	00 00 80 
   1b36f:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   1b373:	48 8b 47 10          	mov    0x10(%rdi),%rax
   1b377:	4a 8d 14 01          	lea    (%rcx,%r8,1),%rdx
   1b37b:	49 8d 70 ff          	lea    -0x1(%r8),%rsi
   1b37f:	49 89 c9             	mov    %rcx,%r9
   1b382:	49 21 f1             	and    %rsi,%r9
   1b385:	4c 89 c7             	mov    %r8,%rdi
   1b388:	4c 29 cf             	sub    %r9,%rdi
   1b38b:	48 85 c9             	test   %rcx,%rcx
   1b38e:	48 0f 49 fa          	cmovns %rdx,%rdi
   1b392:	31 d2                	xor    %edx,%edx
   1b394:	48 85 ff             	test   %rdi,%rdi
   1b397:	0f 99 c1             	setns  %cl
   1b39a:	4c 39 c7             	cmp    %r8,%rdi
   1b39d:	77 1f                	ja     1b3be <<hyperinterval::float::F64Enclosure>::signs+0x5e>
   1b39f:	48 85 ff             	test   %rdi,%rdi
   1b3a2:	40 0f 99 c7          	setns  %dil
   1b3a6:	40 80 cf 02          	or     $0x2,%dil
   1b3aa:	48 85 f0             	test   %rsi,%rax
   1b3ad:	88 ca                	mov    %cl,%dl
   1b3af:	40 0f b6 cf          	movzbl %dil,%ecx
   1b3b3:	0f 44 d1             	cmove  %ecx,%edx
   1b3b6:	48 85 c0             	test   %rax,%rax
   1b3b9:	0f 49 d1             	cmovns %ecx,%edx
   1b3bc:	89 d1                	mov    %edx,%ecx
   1b3be:	8d 51 04             	lea    0x4(%rcx),%edx
   1b3c1:	48 85 c0             	test   %rax,%rax
   1b3c4:	0f b6 c9             	movzbl %cl,%ecx
   1b3c7:	0f b6 c2             	movzbl %dl,%eax
   1b3ca:	0f 4e c1             	cmovle %ecx,%eax
   1b3cd:	c3                   	ret
   1b3ce:	31 c0                	xor    %eax,%eax
   1b3d0:	c3                   	ret
   1b3d1:	cc                   	int3
   1b3d2:	cc                   	int3
   1b3d3:	cc                   	int3
   1b3d4:	cc                   	int3
   1b3d5:	cc                   	int3
   1b3d6:	cc                   	int3
   1b3d7:	cc                   	int3
   1b3d8:	cc                   	int3
   1b3d9:	cc                   	int3
   1b3da:	cc                   	int3
   1b3db:	cc                   	int3
   1b3dc:	cc                   	int3
   1b3dd:	cc                   	int3
   1b3de:	cc                   	int3
   1b3df:	cc                   	int3

<hyperinterval::float::F64Enclosure>::affine:
   1b3e0:	53                   	push   %rbx
   1b3e1:	48 83 ec 60          	sub    $0x60,%rsp
   1b3e5:	48 89 fb             	mov    %rdi,%rbx
   1b3e8:	48 b8 00 00 00 00 00 	movabs $0x7ff0000000000000,%rax
   1b3ef:	00 f0 7f 
   1b3f2:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1b3f7:	48 89 ca             	mov    %rcx,%rdx
   1b3fa:	48 21 c2             	and    %rax,%rdx
   1b3fd:	48 39 c2             	cmp    %rax,%rdx
   1b400:	74 35                	je     1b437 <<hyperinterval::float::F64Enclosure>::affine+0x57>
   1b402:	31 d2                	xor    %edx,%edx
   1b404:	66 0f 57 d2          	xorpd  %xmm2,%xmm2
   1b408:	66 0f 2e c2          	ucomisd %xmm2,%xmm0
   1b40c:	48 0f 45 d1          	cmovne %rcx,%rdx
   1b410:	48 0f 4a d1          	cmovp  %rcx,%rdx
   1b414:	48 c7 44 24 30 01 00 	movq   $0x1,0x30(%rsp)
   1b41b:	00 00 
   1b41d:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1b422:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
   1b427:	66 48 0f 7e c9       	movq   %xmm1,%rcx
   1b42c:	48 89 ca             	mov    %rcx,%rdx
   1b42f:	48 21 c2             	and    %rax,%rdx
   1b432:	48 39 c2             	cmp    %rax,%rdx
   1b435:	75 14                	jne    1b44b <<hyperinterval::float::F64Enclosure>::affine+0x6b>
   1b437:	c6 43 08 00          	movb   $0x0,0x8(%rbx)
   1b43b:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b442:	48 89 d8             	mov    %rbx,%rax
   1b445:	48 83 c4 60          	add    $0x60,%rsp
   1b449:	5b                   	pop    %rbx
   1b44a:	c3                   	ret
   1b44b:	31 c0                	xor    %eax,%eax
   1b44d:	66 0f 2e ca          	ucomisd %xmm2,%xmm1
   1b451:	48 0f 45 c1          	cmovne %rcx,%rax
   1b455:	48 0f 4a c1          	cmovp  %rcx,%rax
   1b459:	48 c7 44 24 48 01 00 	movq   $0x1,0x48(%rsp)
   1b460:	00 00 
   1b462:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1b467:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1b46c:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   1b471:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
   1b476:	31 c9                	xor    %ecx,%ecx
   1b478:	e8 53 f0 ff ff       	call   1a4d0 <<hyperinterval::float::F64Enclosure>::corner_image>
   1b47d:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1b482:	0f b6 44 24 20       	movzbl 0x20(%rsp),%eax
   1b487:	48 83 f9 02          	cmp    $0x2,%rcx
   1b48b:	75 05                	jne    1b492 <<hyperinterval::float::F64Enclosure>::affine+0xb2>
   1b48d:	88 43 08             	mov    %al,0x8(%rbx)
   1b490:	eb a9                	jmp    1b43b <<hyperinterval::float::F64Enclosure>::affine+0x5b>
   1b492:	48 8b 54 24 21       	mov    0x21(%rsp),%rdx
   1b497:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   1b49c:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
   1b4a1:	48 89 54 24 09       	mov    %rdx,0x9(%rsp)
   1b4a6:	48 89 0c 24          	mov    %rcx,(%rsp)
   1b4aa:	88 44 24 08          	mov    %al,0x8(%rsp)
   1b4ae:	48 89 e6             	mov    %rsp,%rsi
   1b4b1:	48 8d 54 24 48       	lea    0x48(%rsp),%rdx
   1b4b6:	48 89 df             	mov    %rbx,%rdi
   1b4b9:	ff 15 09 fa 03 00    	call   *0x3fa09(%rip)        # 5aec8 <_DYNAMIC+0x300>
   1b4bf:	48 89 d8             	mov    %rbx,%rax
   1b4c2:	48 83 c4 60          	add    $0x60,%rsp
   1b4c6:	5b                   	pop    %rbx
   1b4c7:	c3                   	ret
   1b4c8:	cc                   	int3
   1b4c9:	cc                   	int3
   1b4ca:	cc                   	int3
   1b4cb:	cc                   	int3
   1b4cc:	cc                   	int3
   1b4cd:	cc                   	int3
   1b4ce:	cc                   	int3
   1b4cf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::square:
   1b4d0:	55                   	push   %rbp
   1b4d1:	41 57                	push   %r15
   1b4d3:	41 56                	push   %r14
   1b4d5:	41 55                	push   %r13
   1b4d7:	41 54                	push   %r12
   1b4d9:	53                   	push   %rbx
   1b4da:	48 83 ec 68          	sub    $0x68,%rsp
   1b4de:	48 89 fb             	mov    %rdi,%rbx
   1b4e1:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b4e5:	0f 85 13 01 00 00    	jne    1b5fe <<hyperinterval::float::F64Enclosure>::square+0x12e>
   1b4eb:	4c 8b 66 10          	mov    0x10(%rsi),%r12
   1b4ef:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b4f6:	00 00 80 
   1b4f9:	49 b8 00 00 00 00 00 	movabs $0x7ff0000000000000,%r8
   1b500:	00 f0 7f 
   1b503:	48 bd ff ff ff ff ff 	movabs $0xfffffffffffff,%rbp
   1b50a:	ff 0f 00 
   1b50d:	4c 8b 6e 08          	mov    0x8(%rsi),%r13
   1b511:	4c 89 e9             	mov    %r13,%rcx
   1b514:	48 c1 e9 34          	shr    $0x34,%rcx
   1b518:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1b51e:	4c 89 ea             	mov    %r13,%rdx
   1b521:	48 21 ea             	and    %rbp,%rdx
   1b524:	48 85 c9             	test   %rcx,%rcx
   1b527:	48 8d 44 2a 01       	lea    0x1(%rdx,%rbp,1),%rax
   1b52c:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1b533:	48 0f 44 c2          	cmove  %rdx,%rax
   1b537:	41 bf 9c f7 ff ff    	mov    $0xfffff79c,%r15d
   1b53d:	41 0f 44 cf          	cmove  %r15d,%ecx
   1b541:	48 f7 e0             	mul    %rax
   1b544:	c6 44 24 34 00       	movb   $0x0,0x34(%rsp)
   1b549:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1b54e:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1b553:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   1b557:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1b55c:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
   1b561:	4c 89 f6             	mov    %r14,%rsi
   1b564:	4c 89 c2             	mov    %r8,%rdx
   1b567:	e8 84 e9 ff ff       	call   19ef0 <<hyperinterval::ieee::Format>::rounded>
   1b56c:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   1b571:	75 7a                	jne    1b5ed <<hyperinterval::float::F64Enclosure>::square+0x11d>
   1b573:	4c 89 e2             	mov    %r12,%rdx
   1b576:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1b57b:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1b580:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1b585:	48 89 d1             	mov    %rdx,%rcx
   1b588:	48 c1 e9 34          	shr    $0x34,%rcx
   1b58c:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1b592:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   1b597:	48 21 ea             	and    %rbp,%rdx
   1b59a:	48 85 c9             	test   %rcx,%rcx
   1b59d:	48 8d 44 15 01       	lea    0x1(%rbp,%rdx,1),%rax
   1b5a2:	48 0f 44 c2          	cmove  %rdx,%rax
   1b5a6:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1b5ad:	41 0f 44 cf          	cmove  %r15d,%ecx
   1b5b1:	48 f7 e0             	mul    %rax
   1b5b4:	c6 44 24 34 00       	movb   $0x0,0x34(%rsp)
   1b5b9:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1b5be:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1b5c3:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   1b5c7:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1b5cc:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
   1b5d1:	4c 89 f6             	mov    %r14,%rsi
   1b5d4:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1b5db:	00 f0 7f 
   1b5de:	4c 89 fa             	mov    %r15,%rdx
   1b5e1:	e8 0a e9 ff ff       	call   19ef0 <<hyperinterval::ieee::Format>::rounded>
   1b5e6:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1b5eb:	75 2a                	jne    1b617 <<hyperinterval::float::F64Enclosure>::square+0x147>
   1b5ed:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1b5f2:	88 43 08             	mov    %al,0x8(%rbx)
   1b5f5:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b5fc:	eb 07                	jmp    1b605 <<hyperinterval::float::F64Enclosure>::square+0x135>
   1b5fe:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1b605:	48 89 d8             	mov    %rbx,%rax
   1b608:	48 83 c4 68          	add    $0x68,%rsp
   1b60c:	5b                   	pop    %rbx
   1b60d:	41 5c                	pop    %r12
   1b60f:	41 5d                	pop    %r13
   1b611:	41 5e                	pop    %r14
   1b613:	41 5f                	pop    %r15
   1b615:	5d                   	pop    %rbp
   1b616:	c3                   	ret
   1b617:	4c 89 e0             	mov    %r12,%rax
   1b61a:	4c 21 f8             	and    %r15,%rax
   1b61d:	4c 39 f8             	cmp    %r15,%rax
   1b620:	74 1e                	je     1b640 <<hyperinterval::float::F64Enclosure>::square+0x170>
   1b622:	49 8d 46 ff          	lea    -0x1(%r14),%rax
   1b626:	4c 89 e1             	mov    %r12,%rcx
   1b629:	48 21 c1             	and    %rax,%rcx
   1b62c:	49 0f 45 cc          	cmovne %r12,%rcx
   1b630:	48 8b 74 24 60       	mov    0x60(%rsp),%rsi
   1b635:	48 89 f2             	mov    %rsi,%rdx
   1b638:	4c 21 fa             	and    %r15,%rdx
   1b63b:	4c 39 fa             	cmp    %r15,%rdx
   1b63e:	75 0f                	jne    1b64f <<hyperinterval::float::F64Enclosure>::square+0x17f>
   1b640:	31 f6                	xor    %esi,%esi
   1b642:	40 88 73 08          	mov    %sil,0x8(%rbx)
   1b646:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b64d:	eb b6                	jmp    1b605 <<hyperinterval::float::F64Enclosure>::square+0x135>
   1b64f:	48 89 f2             	mov    %rsi,%rdx
   1b652:	48 21 c2             	and    %rax,%rdx
   1b655:	48 0f 45 d6          	cmovne %rsi,%rdx
   1b659:	4a 8d 34 31          	lea    (%rcx,%r14,1),%rsi
   1b65d:	49 89 c8             	mov    %rcx,%r8
   1b660:	49 21 c0             	and    %rax,%r8
   1b663:	4c 89 f7             	mov    %r14,%rdi
   1b666:	4c 29 c7             	sub    %r8,%rdi
   1b669:	48 85 c9             	test   %rcx,%rcx
   1b66c:	48 0f 49 fe          	cmovns %rsi,%rdi
   1b670:	4a 8d 34 32          	lea    (%rdx,%r14,1),%rsi
   1b674:	49 89 d1             	mov    %rdx,%r9
   1b677:	49 21 c1             	and    %rax,%r9
   1b67a:	4d 89 f0             	mov    %r14,%r8
   1b67d:	4d 29 c8             	sub    %r9,%r8
   1b680:	48 85 d2             	test   %rdx,%rdx
   1b683:	4c 0f 49 c6          	cmovns %rsi,%r8
   1b687:	40 b6 01             	mov    $0x1,%sil
   1b68a:	4c 39 c7             	cmp    %r8,%rdi
   1b68d:	77 b3                	ja     1b642 <<hyperinterval::float::F64Enclosure>::square+0x172>
   1b68f:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
   1b694:	4d 89 d1             	mov    %r10,%r9
   1b697:	4d 21 f9             	and    %r15,%r9
   1b69a:	4d 39 f9             	cmp    %r15,%r9
   1b69d:	74 a1                	je     1b640 <<hyperinterval::float::F64Enclosure>::square+0x170>
   1b69f:	4d 89 d1             	mov    %r10,%r9
   1b6a2:	49 21 c1             	and    %rax,%r9
   1b6a5:	4d 0f 45 ca          	cmovne %r10,%r9
   1b6a9:	4c 8b 5c 24 18       	mov    0x18(%rsp),%r11
   1b6ae:	4d 89 da             	mov    %r11,%r10
   1b6b1:	4d 21 fa             	and    %r15,%r10
   1b6b4:	4d 39 fa             	cmp    %r15,%r10
   1b6b7:	74 87                	je     1b640 <<hyperinterval::float::F64Enclosure>::square+0x170>
   1b6b9:	4d 89 da             	mov    %r11,%r10
   1b6bc:	49 21 c2             	and    %rax,%r10
   1b6bf:	4d 0f 45 d3          	cmovne %r11,%r10
   1b6c3:	4f 8d 3c 31          	lea    (%r9,%r14,1),%r15
   1b6c7:	4d 89 cc             	mov    %r9,%r12
   1b6ca:	49 21 c4             	and    %rax,%r12
   1b6cd:	4d 89 f3             	mov    %r14,%r11
   1b6d0:	4d 29 e3             	sub    %r12,%r11
   1b6d3:	4d 85 c9             	test   %r9,%r9
   1b6d6:	4d 0f 49 df          	cmovns %r15,%r11
   1b6da:	4f 8d 3c 32          	lea    (%r10,%r14,1),%r15
   1b6de:	4d 89 d4             	mov    %r10,%r12
   1b6e1:	49 21 c4             	and    %rax,%r12
   1b6e4:	4d 29 e6             	sub    %r12,%r14
   1b6e7:	4d 85 d2             	test   %r10,%r10
   1b6ea:	4d 0f 49 f7          	cmovns %r15,%r14
   1b6ee:	4d 39 f3             	cmp    %r14,%r11
   1b6f1:	0f 87 4b ff ff ff    	ja     1b642 <<hyperinterval::float::F64Enclosure>::square+0x172>
   1b6f7:	4c 39 df             	cmp    %r11,%rdi
   1b6fa:	49 0f 47 c9          	cmova  %r9,%rcx
   1b6fe:	4d 39 f0             	cmp    %r14,%r8
   1b701:	49 0f 42 d2          	cmovb  %r10,%rdx
   1b705:	48 c7 44 24 40 01 00 	movq   $0x1,0x40(%rsp)
   1b70c:	00 00 
   1b70e:	48 89 4c 24 48       	mov    %rcx,0x48(%rsp)
   1b713:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
   1b718:	4d 85 ed             	test   %r13,%r13
   1b71b:	7f 49                	jg     1b766 <<hyperinterval::float::F64Enclosure>::square+0x296>
   1b71d:	48 83 7c 24 58 00    	cmpq   $0x0,0x58(%rsp)
   1b723:	79 07                	jns    1b72c <<hyperinterval::float::F64Enclosure>::square+0x25c>
   1b725:	48 21 44 24 58       	and    %rax,0x58(%rsp)
   1b72a:	75 3a                	jne    1b766 <<hyperinterval::float::F64Enclosure>::square+0x296>
   1b72c:	48 c7 44 24 20 01 00 	movq   $0x1,0x20(%rsp)
   1b733:	00 00 
   1b735:	0f 57 c0             	xorps  %xmm0,%xmm0
   1b738:	0f 11 44 24 28       	movups %xmm0,0x28(%rsp)
   1b73d:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1b742:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
   1b747:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
   1b74c:	ff 15 06 f8 03 00    	call   *0x3f806(%rip)        # 5af58 <_DYNAMIC+0x390>
   1b752:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1b757:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1b75c:	0f 10 44 24 08       	movups 0x8(%rsp),%xmm0
   1b761:	0f 29 44 24 40       	movaps %xmm0,0x40(%rsp)
   1b766:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   1b76b:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1b76f:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1b774:	48 89 03             	mov    %rax,(%rbx)
   1b777:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
   1b77c:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1b780:	e9 80 fe ff ff       	jmp    1b605 <<hyperinterval::float::F64Enclosure>::square+0x135>
   1b785:	cc                   	int3
   1b786:	cc                   	int3
   1b787:	cc                   	int3
   1b788:	cc                   	int3
   1b789:	cc                   	int3
   1b78a:	cc                   	int3
   1b78b:	cc                   	int3
   1b78c:	cc                   	int3
   1b78d:	cc                   	int3
   1b78e:	cc                   	int3
   1b78f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::disjoint:
   1b790:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1b794:	b0 01                	mov    $0x1,%al
   1b796:	0f 84 8b 00 00 00    	je     1b827 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1b79c:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1b7a0:	0f 84 81 00 00 00    	je     1b827 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1b7a6:	53                   	push   %rbx
   1b7a7:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
   1b7ae:	00 00 80 
   1b7b1:	4c 8b 47 10          	mov    0x10(%rdi),%r8
   1b7b5:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
   1b7b9:	4d 8d 14 08          	lea    (%r8,%rcx,1),%r10
   1b7bd:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
   1b7c1:	4d 89 c3             	mov    %r8,%r11
   1b7c4:	49 21 d3             	and    %rdx,%r11
   1b7c7:	48 89 cb             	mov    %rcx,%rbx
   1b7ca:	4c 29 db             	sub    %r11,%rbx
   1b7cd:	4d 85 c0             	test   %r8,%r8
   1b7d0:	49 0f 49 da          	cmovns %r10,%rbx
   1b7d4:	4d 8d 04 09          	lea    (%r9,%rcx,1),%r8
   1b7d8:	4d 89 ca             	mov    %r9,%r10
   1b7db:	49 21 d2             	and    %rdx,%r10
   1b7de:	49 89 cb             	mov    %rcx,%r11
   1b7e1:	4d 29 d3             	sub    %r10,%r11
   1b7e4:	4d 85 c9             	test   %r9,%r9
   1b7e7:	4d 0f 49 d8          	cmovns %r8,%r11
   1b7eb:	4c 39 db             	cmp    %r11,%rbx
   1b7ee:	5b                   	pop    %rbx
   1b7ef:	72 36                	jb     1b827 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1b7f1:	48 8b 47 08          	mov    0x8(%rdi),%rax
   1b7f5:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1b7f9:	48 8d 3c 0e          	lea    (%rsi,%rcx,1),%rdi
   1b7fd:	49 89 f0             	mov    %rsi,%r8
   1b800:	49 21 d0             	and    %rdx,%r8
   1b803:	49 89 c9             	mov    %rcx,%r9
   1b806:	4d 29 c1             	sub    %r8,%r9
   1b809:	48 85 f6             	test   %rsi,%rsi
   1b80c:	4c 0f 49 cf          	cmovns %rdi,%r9
   1b810:	48 8d 34 08          	lea    (%rax,%rcx,1),%rsi
   1b814:	48 21 c2             	and    %rax,%rdx
   1b817:	48 29 d1             	sub    %rdx,%rcx
   1b81a:	48 85 c0             	test   %rax,%rax
   1b81d:	48 0f 49 ce          	cmovns %rsi,%rcx
   1b821:	49 39 c9             	cmp    %rcx,%r9
   1b824:	0f 92 c0             	setb   %al
   1b827:	c3                   	ret
   1b828:	cc                   	int3
   1b829:	cc                   	int3
   1b82a:	cc                   	int3
   1b82b:	cc                   	int3
   1b82c:	cc                   	int3
   1b82d:	cc                   	int3
   1b82e:	cc                   	int3
   1b82f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::expanded:
   1b830:	48 89 f8             	mov    %rdi,%rax
   1b833:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b837:	75 7b                	jne    1b8b4 <<hyperinterval::float::F64Enclosure>::expanded+0x84>
   1b839:	48 b9 ff ff ff ff ff 	movabs $0x7fffffffffffffff,%rcx
   1b840:	ff ff 7f 
   1b843:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
   1b847:	48 8d 51 01          	lea    0x1(%rcx),%rdx
   1b84b:	49 89 f9             	mov    %rdi,%r9
   1b84e:	49 31 d1             	xor    %rdx,%r9
   1b851:	48 85 ff             	test   %rdi,%rdi
   1b854:	4c 0f 44 cf          	cmove  %rdi,%r9
   1b858:	48 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdi
   1b85f:	00 f0 7f 
   1b862:	4d 89 c8             	mov    %r9,%r8
   1b865:	49 c1 f8 3f          	sar    $0x3f,%r8
   1b869:	49 83 c8 01          	or     $0x1,%r8
   1b86d:	4d 01 c8             	add    %r9,%r8
   1b870:	4d 89 c1             	mov    %r8,%r9
   1b873:	49 21 f9             	and    %rdi,%r9
   1b876:	49 39 f9             	cmp    %rdi,%r9
   1b879:	74 2d                	je     1b8a8 <<hyperinterval::float::F64Enclosure>::expanded+0x78>
   1b87b:	4d 89 c1             	mov    %r8,%r9
   1b87e:	49 21 c9             	and    %rcx,%r9
   1b881:	4c 31 c2             	xor    %r8,%rdx
   1b884:	4d 85 c9             	test   %r9,%r9
   1b887:	49 0f 44 d1          	cmove  %r9,%rdx
   1b88b:	4c 8b 46 10          	mov    0x10(%rsi),%r8
   1b88f:	4c 89 c6             	mov    %r8,%rsi
   1b892:	48 c1 fe 3f          	sar    $0x3f,%rsi
   1b896:	48 83 ce 01          	or     $0x1,%rsi
   1b89a:	4c 01 c6             	add    %r8,%rsi
   1b89d:	49 89 f0             	mov    %rsi,%r8
   1b8a0:	49 21 f8             	and    %rdi,%r8
   1b8a3:	49 39 f8             	cmp    %rdi,%r8
   1b8a6:	75 14                	jne    1b8bc <<hyperinterval::float::F64Enclosure>::expanded+0x8c>
   1b8a8:	c6 40 08 03          	movb   $0x3,0x8(%rax)
   1b8ac:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1b8b3:	c3                   	ret
   1b8b4:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   1b8bb:	c3                   	ret
   1b8bc:	49 89 f0             	mov    %rsi,%r8
   1b8bf:	49 21 c8             	and    %rcx,%r8
   1b8c2:	4c 0f 45 c6          	cmovne %rsi,%r8
   1b8c6:	48 89 d6             	mov    %rdx,%rsi
   1b8c9:	48 21 fe             	and    %rdi,%rsi
   1b8cc:	48 39 fe             	cmp    %rdi,%rsi
   1b8cf:	74 15                	je     1b8e6 <<hyperinterval::float::F64Enclosure>::expanded+0xb6>
   1b8d1:	48 89 d6             	mov    %rdx,%rsi
   1b8d4:	48 21 ce             	and    %rcx,%rsi
   1b8d7:	48 0f 45 f2          	cmovne %rdx,%rsi
   1b8db:	4c 89 c2             	mov    %r8,%rdx
   1b8de:	48 21 fa             	and    %rdi,%rdx
   1b8e1:	48 39 fa             	cmp    %rdi,%rdx
   1b8e4:	75 0c                	jne    1b8f2 <<hyperinterval::float::F64Enclosure>::expanded+0xc2>
   1b8e6:	c6 40 08 00          	movb   $0x0,0x8(%rax)
   1b8ea:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1b8f1:	c3                   	ret
   1b8f2:	4c 89 c2             	mov    %r8,%rdx
   1b8f5:	48 21 ca             	and    %rcx,%rdx
   1b8f8:	49 0f 45 d0          	cmovne %r8,%rdx
   1b8fc:	48 8d 3c 0e          	lea    (%rsi,%rcx,1),%rdi
   1b900:	48 ff c7             	inc    %rdi
   1b903:	49 89 f0             	mov    %rsi,%r8
   1b906:	49 21 c8             	and    %rcx,%r8
   1b909:	49 f7 d8             	neg    %r8
   1b90c:	49 01 c8             	add    %rcx,%r8
   1b90f:	49 ff c0             	inc    %r8
   1b912:	48 85 f6             	test   %rsi,%rsi
   1b915:	4c 0f 49 c7          	cmovns %rdi,%r8
   1b919:	48 8d 3c 0a          	lea    (%rdx,%rcx,1),%rdi
   1b91d:	48 ff c7             	inc    %rdi
   1b920:	49 89 d1             	mov    %rdx,%r9
   1b923:	49 21 c9             	and    %rcx,%r9
   1b926:	49 f7 d9             	neg    %r9
   1b929:	4c 01 c9             	add    %r9,%rcx
   1b92c:	48 ff c1             	inc    %rcx
   1b92f:	48 85 d2             	test   %rdx,%rdx
   1b932:	48 0f 49 cf          	cmovns %rdi,%rcx
   1b936:	49 39 c8             	cmp    %rcx,%r8
   1b939:	76 0c                	jbe    1b947 <<hyperinterval::float::F64Enclosure>::expanded+0x117>
   1b93b:	c6 40 08 01          	movb   $0x1,0x8(%rax)
   1b93f:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1b946:	c3                   	ret
   1b947:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   1b94e:	48 89 70 08          	mov    %rsi,0x8(%rax)
   1b952:	48 89 50 10          	mov    %rdx,0x10(%rax)
   1b956:	c3                   	ret
   1b957:	cc                   	int3
   1b958:	cc                   	int3
   1b959:	cc                   	int3
   1b95a:	cc                   	int3
   1b95b:	cc                   	int3
   1b95c:	cc                   	int3
   1b95d:	cc                   	int3
   1b95e:	cc                   	int3
   1b95f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::overlaps:
   1b960:	31 c0                	xor    %eax,%eax
   1b962:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1b966:	0f 84 8c 00 00 00    	je     1b9f8 <<hyperinterval::float::F64Enclosure>::overlaps+0x98>
   1b96c:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1b970:	0f 84 82 00 00 00    	je     1b9f8 <<hyperinterval::float::F64Enclosure>::overlaps+0x98>
   1b976:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1b97d:	00 00 80 
   1b980:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1b984:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1b988:	4c 8d 0c 02          	lea    (%rdx,%rax,1),%r9
   1b98c:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1b990:	49 89 d2             	mov    %rdx,%r10
   1b993:	49 21 ca             	and    %rcx,%r10
   1b996:	49 89 c3             	mov    %rax,%r11
   1b999:	4d 29 d3             	sub    %r10,%r11
   1b99c:	48 85 d2             	test   %rdx,%rdx
   1b99f:	4d 0f 49 d9          	cmovns %r9,%r11
   1b9a3:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
   1b9a7:	4d 89 c1             	mov    %r8,%r9
   1b9aa:	49 21 c9             	and    %rcx,%r9
   1b9ad:	49 89 c2             	mov    %rax,%r10
   1b9b0:	4d 29 ca             	sub    %r9,%r10
   1b9b3:	4d 85 c0             	test   %r8,%r8
   1b9b6:	4c 0f 49 d2          	cmovns %rdx,%r10
   1b9ba:	4d 39 d3             	cmp    %r10,%r11
   1b9bd:	73 03                	jae    1b9c2 <<hyperinterval::float::F64Enclosure>::overlaps+0x62>
   1b9bf:	31 c0                	xor    %eax,%eax
   1b9c1:	c3                   	ret
   1b9c2:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1b9c6:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1b9ca:	48 8d 3c 06          	lea    (%rsi,%rax,1),%rdi
   1b9ce:	49 89 f0             	mov    %rsi,%r8
   1b9d1:	49 21 c8             	and    %rcx,%r8
   1b9d4:	49 89 c1             	mov    %rax,%r9
   1b9d7:	4d 29 c1             	sub    %r8,%r9
   1b9da:	48 85 f6             	test   %rsi,%rsi
   1b9dd:	4c 0f 49 cf          	cmovns %rdi,%r9
   1b9e1:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
   1b9e5:	48 21 d1             	and    %rdx,%rcx
   1b9e8:	48 29 c8             	sub    %rcx,%rax
   1b9eb:	48 85 d2             	test   %rdx,%rdx
   1b9ee:	48 0f 49 c6          	cmovns %rsi,%rax
   1b9f2:	49 39 c1             	cmp    %rax,%r9
   1b9f5:	0f 93 c0             	setae  %al
   1b9f8:	c3                   	ret
   1b9f9:	cc                   	int3
   1b9fa:	cc                   	int3
   1b9fb:	cc                   	int3
   1b9fc:	cc                   	int3
   1b9fd:	cc                   	int3
   1b9fe:	cc                   	int3
   1b9ff:	cc                   	int3

<hyperinterval::float::F64Enclosure>::next_down:
   1ba00:	48 89 f8             	mov    %rdi,%rax
   1ba03:	48 b9 00 00 00 00 00 	movabs $0x7ff0000000000000,%rcx
   1ba0a:	00 f0 7f 
   1ba0d:	66 48 0f 7e c6       	movq   %xmm0,%rsi
   1ba12:	48 89 f2             	mov    %rsi,%rdx
   1ba15:	48 21 ca             	and    %rcx,%rdx
   1ba18:	48 39 ca             	cmp    %rcx,%rdx
   1ba1b:	75 09                	jne    1ba26 <<hyperinterval::float::F64Enclosure>::next_down+0x26>
   1ba1d:	c6 40 01 00          	movb   $0x0,0x1(%rax)
   1ba21:	b1 01                	mov    $0x1,%cl
   1ba23:	88 08                	mov    %cl,(%rax)
   1ba25:	c3                   	ret
   1ba26:	31 ff                	xor    %edi,%edi
   1ba28:	66 0f 57 c9          	xorpd  %xmm1,%xmm1
   1ba2c:	66 0f 2e c1          	ucomisd %xmm1,%xmm0
   1ba30:	48 0f 45 fe          	cmovne %rsi,%rdi
   1ba34:	48 ba 00 00 00 00 00 	movabs $0x8000000000000000,%rdx
   1ba3b:	00 00 80 
   1ba3e:	48 0f 4a fe          	cmovp  %rsi,%rdi
   1ba42:	49 89 f8             	mov    %rdi,%r8
   1ba45:	49 31 d0             	xor    %rdx,%r8
   1ba48:	48 85 ff             	test   %rdi,%rdi
   1ba4b:	4c 0f 44 c7          	cmove  %rdi,%r8
   1ba4f:	4c 89 c6             	mov    %r8,%rsi
   1ba52:	48 c1 fe 3f          	sar    $0x3f,%rsi
   1ba56:	48 83 ce 01          	or     $0x1,%rsi
   1ba5a:	4c 01 c6             	add    %r8,%rsi
   1ba5d:	48 89 f7             	mov    %rsi,%rdi
   1ba60:	48 21 cf             	and    %rcx,%rdi
   1ba63:	48 39 cf             	cmp    %rcx,%rdi
   1ba66:	75 09                	jne    1ba71 <<hyperinterval::float::F64Enclosure>::next_down+0x71>
   1ba68:	c6 40 01 03          	movb   $0x3,0x1(%rax)
   1ba6c:	b1 01                	mov    $0x1,%cl
   1ba6e:	88 08                	mov    %cl,(%rax)
   1ba70:	c3                   	ret
   1ba71:	48 8d 4a ff          	lea    -0x1(%rdx),%rcx
   1ba75:	48 85 ce             	test   %rcx,%rsi
   1ba78:	74 08                	je     1ba82 <<hyperinterval::float::F64Enclosure>::next_down+0x82>
   1ba7a:	48 31 d6             	xor    %rdx,%rsi
   1ba7d:	66 48 0f 6e ce       	movq   %rsi,%xmm1
   1ba82:	f2 0f 11 48 08       	movsd  %xmm1,0x8(%rax)
   1ba87:	31 c9                	xor    %ecx,%ecx
   1ba89:	88 08                	mov    %cl,(%rax)
   1ba8b:	c3                   	ret
   1ba8c:	cc                   	int3
   1ba8d:	cc                   	int3
   1ba8e:	cc                   	int3
   1ba8f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::subset_of:
   1ba90:	b0 01                	mov    $0x1,%al
   1ba92:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1ba96:	75 50                	jne    1bae8 <<hyperinterval::float::F64Enclosure>::subset_of+0x58>
   1ba98:	f6 06 01             	testb  $0x1,(%rsi)
   1ba9b:	74 49                	je     1bae6 <<hyperinterval::float::F64Enclosure>::subset_of+0x56>
   1ba9d:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1baa1:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1baa5:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1baac:	00 00 80 
   1baaf:	4d 8d 0c 00          	lea    (%r8,%rax,1),%r9
   1bab3:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1bab7:	4d 89 c2             	mov    %r8,%r10
   1baba:	49 21 ca             	and    %rcx,%r10
   1babd:	49 89 c3             	mov    %rax,%r11
   1bac0:	4d 29 d3             	sub    %r10,%r11
   1bac3:	4d 85 c0             	test   %r8,%r8
   1bac6:	4d 0f 49 d9          	cmovns %r9,%r11
   1baca:	4c 8d 04 02          	lea    (%rdx,%rax,1),%r8
   1bace:	49 89 d1             	mov    %rdx,%r9
   1bad1:	49 21 c9             	and    %rcx,%r9
   1bad4:	49 89 c2             	mov    %rax,%r10
   1bad7:	4d 29 ca             	sub    %r9,%r10
   1bada:	48 85 d2             	test   %rdx,%rdx
   1badd:	4d 0f 49 d0          	cmovns %r8,%r10
   1bae1:	4d 39 d3             	cmp    %r10,%r11
   1bae4:	76 03                	jbe    1bae9 <<hyperinterval::float::F64Enclosure>::subset_of+0x59>
   1bae6:	31 c0                	xor    %eax,%eax
   1bae8:	c3                   	ret
   1bae9:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1baed:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1baf1:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1baf5:	49 89 d0             	mov    %rdx,%r8
   1baf8:	49 21 c8             	and    %rcx,%r8
   1bafb:	49 89 c1             	mov    %rax,%r9
   1bafe:	4d 29 c1             	sub    %r8,%r9
   1bb01:	48 85 d2             	test   %rdx,%rdx
   1bb04:	4c 0f 49 cf          	cmovns %rdi,%r9
   1bb08:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1bb0c:	48 21 f1             	and    %rsi,%rcx
   1bb0f:	48 29 c8             	sub    %rcx,%rax
   1bb12:	48 85 f6             	test   %rsi,%rsi
   1bb15:	48 0f 49 c2          	cmovns %rdx,%rax
   1bb19:	49 39 c1             	cmp    %rax,%r9
   1bb1c:	0f 96 c0             	setbe  %al
   1bb1f:	c3                   	ret

__udivti3:
   57aa0:	49 89 d0             	mov    %rdx,%r8
   57aa3:	48 85 c9             	test   %rcx,%rcx
   57aa6:	74 76                	je     57b1e <__udivti3+0x7e>
   57aa8:	53                   	push   %rbx
   57aa9:	4c 0f bd c9          	bsr    %rcx,%r9
   57aad:	44 89 ca             	mov    %r9d,%edx
   57ab0:	83 f2 3f             	xor    $0x3f,%edx
   57ab3:	b0 40                	mov    $0x40,%al
   57ab5:	28 d0                	sub    %dl,%al
   57ab7:	4c 89 c2             	mov    %r8,%rdx
   57aba:	49 89 cb             	mov    %rcx,%r11
   57abd:	89 c1                	mov    %eax,%ecx
   57abf:	4c 0f ad da          	shrd   %cl,%r11,%rdx
   57ac3:	4d 89 da             	mov    %r11,%r10
   57ac6:	49 d3 ea             	shr    %cl,%r10
   57ac9:	a8 40                	test   $0x40,%al
   57acb:	4c 0f 44 d2          	cmove  %rdx,%r10
   57acf:	48 89 f8             	mov    %rdi,%rax
   57ad2:	48 0f ac f0 01       	shrd   $0x1,%rsi,%rax
   57ad7:	48 89 f2             	mov    %rsi,%rdx
   57ada:	48 d1 ea             	shr    $1,%rdx
   57add:	49 f7 f2             	div    %r10
   57ae0:	49 89 c2             	mov    %rax,%r10
   57ae3:	44 89 c9             	mov    %r9d,%ecx
   57ae6:	49 d3 ea             	shr    %cl,%r10
   57ae9:	31 c9                	xor    %ecx,%ecx
   57aeb:	49 83 ea 01          	sub    $0x1,%r10
   57aef:	4c 0f 42 d1          	cmovb  %rcx,%r10
   57af3:	4c 89 db             	mov    %r11,%rbx
   57af6:	4c 89 c0             	mov    %r8,%rax
   57af9:	49 f7 e2             	mul    %r10
   57afc:	49 89 c1             	mov    %rax,%r9
   57aff:	4c 89 d0             	mov    %r10,%rax
   57b02:	49 0f af da          	imul   %r10,%rbx
   57b06:	48 01 da             	add    %rbx,%rdx
   57b09:	4c 29 cf             	sub    %r9,%rdi
   57b0c:	48 19 d6             	sbb    %rdx,%rsi
   57b0f:	4c 39 c7             	cmp    %r8,%rdi
   57b12:	4c 19 de             	sbb    %r11,%rsi
   57b15:	48 83 d8 ff          	sbb    $0xffffffffffffffff,%rax
   57b19:	5b                   	pop    %rbx
   57b1a:	48 89 ca             	mov    %rcx,%rdx
   57b1d:	c3                   	ret
   57b1e:	4c 39 c6             	cmp    %r8,%rsi
   57b21:	73 0f                	jae    57b32 <__udivti3+0x92>
   57b23:	48 89 f8             	mov    %rdi,%rax
   57b26:	48 89 f2             	mov    %rsi,%rdx
   57b29:	49 f7 f0             	div    %r8
   57b2c:	31 c9                	xor    %ecx,%ecx
   57b2e:	48 89 ca             	mov    %rcx,%rdx
   57b31:	c3                   	ret
   57b32:	48 89 f0             	mov    %rsi,%rax
   57b35:	4c 09 c0             	or     %r8,%rax
   57b38:	48 c1 e8 20          	shr    $0x20,%rax
   57b3c:	74 15                	je     57b53 <__udivti3+0xb3>
   57b3e:	48 89 f0             	mov    %rsi,%rax
   57b41:	31 d2                	xor    %edx,%edx
   57b43:	49 f7 f0             	div    %r8
   57b46:	48 89 c1             	mov    %rax,%rcx
   57b49:	48 89 f8             	mov    %rdi,%rax
   57b4c:	49 f7 f0             	div    %r8
   57b4f:	48 89 ca             	mov    %rcx,%rdx
   57b52:	c3                   	ret
   57b53:	89 f0                	mov    %esi,%eax
   57b55:	31 d2                	xor    %edx,%edx
   57b57:	41 f7 f0             	div    %r8d
   57b5a:	89 c1                	mov    %eax,%ecx
   57b5c:	48 89 f8             	mov    %rdi,%rax
   57b5f:	49 f7 f0             	div    %r8
   57b62:	48 89 ca             	mov    %rcx,%rdx
   57b65:	c3                   	ret

Disassembly of section .init:
