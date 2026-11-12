hyperinterval::float::F64Enclosure::abs:
   17030:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   17034:	75 33                	jne    17069 <hyperinterval::float::F64Enclosure::abs+0x39>
   17036:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1703a:	48 ba ff ff ff ff ff 	movabs $0x7fffffffffffffff,%rdx
   17041:	ff ff 7f 
   17044:	48 85 c9             	test   %rcx,%rcx
   17047:	41 0f 99 c0          	setns  %r8b
   1704b:	48 89 c8             	mov    %rcx,%rax
   1704e:	48 21 d0             	and    %rdx,%rax
   17051:	41 0f 94 c1          	sete   %r9b
   17055:	45 08 c1             	or     %r8b,%r9b
   17058:	74 17                	je     17071 <hyperinterval::float::F64Enclosure::abs+0x41>
   1705a:	48 8b 46 10          	mov    0x10(%rsi),%rax
   1705e:	48 89 47 10          	mov    %rax,0x10(%rdi)
   17062:	0f 10 06             	movups (%rsi),%xmm0
   17065:	0f 11 07             	movups %xmm0,(%rdi)
   17068:	c3                   	ret
   17069:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
   17070:	c3                   	ret
   17071:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   17075:	48 85 f6             	test   %rsi,%rsi
   17078:	41 0f 98 c1          	sets   %r9b
   1707c:	49 89 f0             	mov    %rsi,%r8
   1707f:	49 21 d0             	and    %rdx,%r8
   17082:	41 0f 95 c2          	setne  %r10b
   17086:	45 84 d1             	test   %r10b,%r9b
   17089:	74 10                	je     1709b <hyperinterval::float::F64Enclosure::abs+0x6b>
   1708b:	48 c7 07 01 00 00 00 	movq   $0x1,(%rdi)
   17092:	4c 89 47 08          	mov    %r8,0x8(%rdi)
   17096:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1709a:	c3                   	ret
   1709b:	49 f7 d8             	neg    %r8
   1709e:	48 85 f6             	test   %rsi,%rsi
   170a1:	4c 8d 4c 16 01       	lea    0x1(%rsi,%rdx,1),%r9
   170a6:	4a 8d 54 02 01       	lea    0x1(%rdx,%r8,1),%rdx
   170ab:	49 0f 49 d1          	cmovns %r9,%rdx
   170af:	48 39 d1             	cmp    %rdx,%rcx
   170b2:	48 0f 46 c6          	cmovbe %rsi,%rax
   170b6:	48 c7 07 01 00 00 00 	movq   $0x1,(%rdi)
   170bd:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
   170c4:	00 
   170c5:	48 89 47 10          	mov    %rax,0x10(%rdi)
   170c9:	c3                   	ret
   170ca:	cc                   	int3
   170cb:	cc                   	int3
   170cc:	cc                   	int3
   170cd:	cc                   	int3
   170ce:	cc                   	int3
   170cf:	cc                   	int3

hyperinterval_strict_chain32:
   17130:	53                   	push   %rbx
   17131:	48 83 ec 60          	sub    $0x60,%rsp
   17135:	48 89 fb             	mov    %rdi,%rbx
   17138:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   1713d:	ff 15 7d 83 04 00    	call   *0x4837d(%rip)        # 5f4c0 <_DYNAMIC+0x2b0>
   17143:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   17147:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   1714c:	83 f9 02             	cmp    $0x2,%ecx
   1714f:	0f 84 f4 00 00 00    	je     17249 <hyperinterval_strict_chain32+0x119>
   17155:	8b 54 24 11          	mov    0x11(%rsp),%edx
   17159:	8b 74 24 14          	mov    0x14(%rsp),%esi
   1715d:	89 74 24 5c          	mov    %esi,0x5c(%rsp)
   17161:	89 54 24 59          	mov    %edx,0x59(%rsp)
   17165:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
   17169:	88 44 24 58          	mov    %al,0x58(%rsp)
   1716d:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   17172:	48 8d 74 24 54       	lea    0x54(%rsp),%rsi
   17177:	f3 0f 10 05 49 e7 fe 	movss  -0x118b7(%rip),%xmm0        # 58c8 <__abi_tag+0x55cc>
   1717e:	ff 
   1717f:	f3 0f 10 0d 39 e7 fe 	movss  -0x118c7(%rip),%xmm1        # 58c0 <__abi_tag+0x55c4>
   17186:	ff 
   17187:	ff 15 3b 83 04 00    	call   *0x4833b(%rip)        # 5f4c8 <_DYNAMIC+0x2b8>
   1718d:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
   17191:	0f b6 44 24 1c       	movzbl 0x1c(%rsp),%eax
   17196:	83 f9 02             	cmp    $0x2,%ecx
   17199:	0f 84 aa 00 00 00    	je     17249 <hyperinterval_strict_chain32+0x119>
   1719f:	8b 54 24 1d          	mov    0x1d(%rsp),%edx
   171a3:	8b 74 24 20          	mov    0x20(%rsp),%esi
   171a7:	89 74 24 50          	mov    %esi,0x50(%rsp)
   171ab:	89 54 24 4d          	mov    %edx,0x4d(%rsp)
   171af:	89 4c 24 48          	mov    %ecx,0x48(%rsp)
   171b3:	88 44 24 4c          	mov    %al,0x4c(%rsp)
   171b7:	48 8d 7c 24 3c       	lea    0x3c(%rsp),%rdi
   171bc:	48 8d 74 24 48       	lea    0x48(%rsp),%rsi
   171c1:	ff 15 09 83 04 00    	call   *0x48309(%rip)        # 5f4d0 <_DYNAMIC+0x2c0>
   171c7:	8b 4c 24 3c          	mov    0x3c(%rsp),%ecx
   171cb:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   171d0:	83 f9 02             	cmp    $0x2,%ecx
   171d3:	74 74                	je     17249 <hyperinterval_strict_chain32+0x119>
   171d5:	8b 54 24 41          	mov    0x41(%rsp),%edx
   171d9:	8b 74 24 44          	mov    0x44(%rsp),%esi
   171dd:	89 74 24 38          	mov    %esi,0x38(%rsp)
   171e1:	89 54 24 35          	mov    %edx,0x35(%rsp)
   171e5:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   171e9:	88 44 24 34          	mov    %al,0x34(%rsp)
   171ed:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   171f2:	f3 0f 10 05 9a e6 fe 	movss  -0x11966(%rip),%xmm0        # 5894 <__abi_tag+0x5598>
   171f9:	ff 
   171fa:	ff 15 d8 82 04 00    	call   *0x482d8(%rip)        # 5f4d8 <_DYNAMIC+0x2c8>
   17200:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   17204:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   17209:	83 f9 02             	cmp    $0x2,%ecx
   1720c:	74 3b                	je     17249 <hyperinterval_strict_chain32+0x119>
   1720e:	8b 54 24 11          	mov    0x11(%rsp),%edx
   17212:	8b 74 24 14          	mov    0x14(%rsp),%esi
   17216:	89 74 24 20          	mov    %esi,0x20(%rsp)
   1721a:	89 54 24 1d          	mov    %edx,0x1d(%rsp)
   1721e:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
   17222:	88 44 24 1c          	mov    %al,0x1c(%rsp)
   17226:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
   1722b:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   17230:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
   17235:	ff 15 a5 82 04 00    	call   *0x482a5(%rip)        # 5f4e0 <_DYNAMIC+0x2d0>
   1723b:	8b 4c 24 24          	mov    0x24(%rsp),%ecx
   1723f:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   17244:	83 f9 02             	cmp    $0x2,%ecx
   17247:	75 12                	jne    1725b <hyperinterval_strict_chain32+0x12b>
   17249:	88 43 04             	mov    %al,0x4(%rbx)
   1724c:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17252:	48 89 d8             	mov    %rbx,%rax
   17255:	48 83 c4 60          	add    $0x60,%rsp
   17259:	5b                   	pop    %rbx
   1725a:	c3                   	ret
   1725b:	8b 54 24 29          	mov    0x29(%rsp),%edx
   1725f:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
   17263:	89 74 24 14          	mov    %esi,0x14(%rsp)
   17267:	89 54 24 11          	mov    %edx,0x11(%rsp)
   1726b:	89 4c 24 0c          	mov    %ecx,0xc(%rsp)
   1726f:	88 44 24 10          	mov    %al,0x10(%rsp)
   17273:	48 8d 74 24 0c       	lea    0xc(%rsp),%rsi
   17278:	48 89 df             	mov    %rbx,%rdi
   1727b:	ff 15 67 82 04 00    	call   *0x48267(%rip)        # 5f4e8 <_DYNAMIC+0x2d8>
   17281:	48 89 d8             	mov    %rbx,%rax
   17284:	48 83 c4 60          	add    $0x60,%rsp
   17288:	5b                   	pop    %rbx
   17289:	c3                   	ret
   1728a:	cc                   	int3
   1728b:	cc                   	int3
   1728c:	cc                   	int3
   1728d:	cc                   	int3
   1728e:	cc                   	int3
   1728f:	cc                   	int3

hyperinterval_strict_chain64:
   17290:	53                   	push   %rbx
   17291:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
   17298:	48 89 fb             	mov    %rdi,%rbx
   1729b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   172a0:	ff 15 4a 82 04 00    	call   *0x4824a(%rip)        # 5f4f0 <_DYNAMIC+0x2e0>
   172a6:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   172ab:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   172b0:	48 83 f9 02          	cmp    $0x2,%rcx
   172b4:	0f 84 32 01 00 00    	je     173ec <hyperinterval_strict_chain64+0x15c>
   172ba:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   172bf:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   172c4:	48 89 b4 24 a8 00 00 	mov    %rsi,0xa8(%rsp)
   172cb:	00 
   172cc:	48 89 94 24 a1 00 00 	mov    %rdx,0xa1(%rsp)
   172d3:	00 
   172d4:	48 89 8c 24 98 00 00 	mov    %rcx,0x98(%rsp)
   172db:	00 
   172dc:	88 84 24 a0 00 00 00 	mov    %al,0xa0(%rsp)
   172e3:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   172e8:	48 8d b4 24 98 00 00 	lea    0x98(%rsp),%rsi
   172ef:	00 
   172f0:	f2 0f 10 05 58 e5 fe 	movsd  -0x11aa8(%rip),%xmm0        # 5850 <__abi_tag+0x5554>
   172f7:	ff 
   172f8:	f2 0f 10 0d 60 e5 fe 	movsd  -0x11aa0(%rip),%xmm1        # 5860 <__abi_tag+0x5564>
   172ff:	ff 
   17300:	ff 15 f2 81 04 00    	call   *0x481f2(%rip)        # 5f4f8 <_DYNAMIC+0x2e8>
   17306:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1730b:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   17310:	48 83 f9 02          	cmp    $0x2,%rcx
   17314:	0f 84 d2 00 00 00    	je     173ec <hyperinterval_strict_chain64+0x15c>
   1731a:	48 8b 54 24 29       	mov    0x29(%rsp),%rdx
   1731f:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   17324:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
   1732b:	00 
   1732c:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
   17333:	00 
   17334:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
   1733b:	00 
   1733c:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
   17343:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
   17348:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   1734f:	00 
   17350:	ff 15 aa 81 04 00    	call   *0x481aa(%rip)        # 5f500 <_DYNAMIC+0x2f0>
   17356:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
   1735b:	0f b6 44 24 70       	movzbl 0x70(%rsp),%eax
   17360:	48 83 f9 02          	cmp    $0x2,%rcx
   17364:	0f 84 82 00 00 00    	je     173ec <hyperinterval_strict_chain64+0x15c>
   1736a:	48 8b 54 24 71       	mov    0x71(%rsp),%rdx
   1736f:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
   17374:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   17379:	48 89 54 24 59       	mov    %rdx,0x59(%rsp)
   1737e:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
   17383:	88 44 24 58          	mov    %al,0x58(%rsp)
   17387:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1738c:	f2 0f 10 05 ac e4 fe 	movsd  -0x11b54(%rip),%xmm0        # 5840 <__abi_tag+0x5544>
   17393:	ff 
   17394:	ff 15 6e 81 04 00    	call   *0x4816e(%rip)        # 5f508 <_DYNAMIC+0x2f8>
   1739a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1739f:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   173a4:	48 83 f9 02          	cmp    $0x2,%rcx
   173a8:	74 42                	je     173ec <hyperinterval_strict_chain64+0x15c>
   173aa:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   173af:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   173b4:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   173b9:	48 89 54 24 29       	mov    %rdx,0x29(%rsp)
   173be:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   173c3:	88 44 24 28          	mov    %al,0x28(%rsp)
   173c7:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   173cc:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   173d1:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
   173d6:	ff 15 34 81 04 00    	call   *0x48134(%rip)        # 5f510 <_DYNAMIC+0x300>
   173dc:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   173e1:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   173e6:	48 83 f9 02          	cmp    $0x2,%rcx
   173ea:	75 16                	jne    17402 <hyperinterval_strict_chain64+0x172>
   173ec:	88 43 08             	mov    %al,0x8(%rbx)
   173ef:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   173f6:	48 89 d8             	mov    %rbx,%rax
   173f9:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   17400:	5b                   	pop    %rbx
   17401:	c3                   	ret
   17402:	48 8b 54 24 41       	mov    0x41(%rsp),%rdx
   17407:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
   1740c:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
   17411:	48 89 54 24 11       	mov    %rdx,0x11(%rsp)
   17416:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   1741b:	88 44 24 10          	mov    %al,0x10(%rsp)
   1741f:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
   17424:	48 89 df             	mov    %rbx,%rdi
   17427:	ff 15 eb 80 04 00    	call   *0x480eb(%rip)        # 5f518 <_DYNAMIC+0x308>
   1742d:	48 89 d8             	mov    %rbx,%rax
   17430:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   17437:	5b                   	pop    %rbx
   17438:	c3                   	ret
   17439:	cc                   	int3
   1743a:	cc                   	int3
   1743b:	cc                   	int3
   1743c:	cc                   	int3
   1743d:	cc                   	int3
   1743e:	cc                   	int3
   1743f:	cc                   	int3

hyperinterval_strict_sqrt32:
   17440:	53                   	push   %rbx
   17441:	48 83 ec 20          	sub    $0x20,%rsp
   17445:	48 89 fb             	mov    %rdi,%rbx
   17448:	48 8d 7c 24 14       	lea    0x14(%rsp),%rdi
   1744d:	ff 15 6d 80 04 00    	call   *0x4806d(%rip)        # 5f4c0 <_DYNAMIC+0x2b0>
   17453:	8b 4c 24 14          	mov    0x14(%rsp),%ecx
   17457:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   1745c:	83 f9 02             	cmp    $0x2,%ecx
   1745f:	75 12                	jne    17473 <hyperinterval_strict_sqrt32+0x33>
   17461:	88 43 04             	mov    %al,0x4(%rbx)
   17464:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1746a:	48 89 d8             	mov    %rbx,%rax
   1746d:	48 83 c4 20          	add    $0x20,%rsp
   17471:	5b                   	pop    %rbx
   17472:	c3                   	ret
   17473:	8b 54 24 19          	mov    0x19(%rsp),%edx
   17477:	8b 74 24 1c          	mov    0x1c(%rsp),%esi
   1747b:	89 74 24 10          	mov    %esi,0x10(%rsp)
   1747f:	89 54 24 0d          	mov    %edx,0xd(%rsp)
   17483:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
   17487:	88 44 24 0c          	mov    %al,0xc(%rsp)
   1748b:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
   17490:	48 89 df             	mov    %rbx,%rdi
   17493:	ff 15 87 80 04 00    	call   *0x48087(%rip)        # 5f520 <_DYNAMIC+0x310>
   17499:	48 89 d8             	mov    %rbx,%rax
   1749c:	48 83 c4 20          	add    $0x20,%rsp
   174a0:	5b                   	pop    %rbx
   174a1:	c3                   	ret
   174a2:	cc                   	int3
   174a3:	cc                   	int3
   174a4:	cc                   	int3
   174a5:	cc                   	int3
   174a6:	cc                   	int3
   174a7:	cc                   	int3
   174a8:	cc                   	int3
   174a9:	cc                   	int3
   174aa:	cc                   	int3
   174ab:	cc                   	int3
   174ac:	cc                   	int3
   174ad:	cc                   	int3
   174ae:	cc                   	int3
   174af:	cc                   	int3

hyperinterval_strict_sqrt64:
   174b0:	53                   	push   %rbx
   174b1:	48 83 ec 30          	sub    $0x30,%rsp
   174b5:	48 89 fb             	mov    %rdi,%rbx
   174b8:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   174bd:	ff 15 2d 80 04 00    	call   *0x4802d(%rip)        # 5f4f0 <_DYNAMIC+0x2e0>
   174c3:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   174c8:	0f b6 44 24 20       	movzbl 0x20(%rsp),%eax
   174cd:	48 83 f9 02          	cmp    $0x2,%rcx
   174d1:	75 13                	jne    174e6 <hyperinterval_strict_sqrt64+0x36>
   174d3:	88 43 08             	mov    %al,0x8(%rbx)
   174d6:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   174dd:	48 89 d8             	mov    %rbx,%rax
   174e0:	48 83 c4 30          	add    $0x30,%rsp
   174e4:	5b                   	pop    %rbx
   174e5:	c3                   	ret
   174e6:	48 8b 54 24 21       	mov    0x21(%rsp),%rdx
   174eb:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   174f0:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
   174f5:	48 89 54 24 09       	mov    %rdx,0x9(%rsp)
   174fa:	48 89 0c 24          	mov    %rcx,(%rsp)
   174fe:	88 44 24 08          	mov    %al,0x8(%rsp)
   17502:	48 89 e6             	mov    %rsp,%rsi
   17505:	48 89 df             	mov    %rbx,%rdi
   17508:	ff 15 1a 80 04 00    	call   *0x4801a(%rip)        # 5f528 <_DYNAMIC+0x318>
   1750e:	48 89 d8             	mov    %rbx,%rax
   17511:	48 83 c4 30          	add    $0x30,%rsp
   17515:	5b                   	pop    %rbx
   17516:	c3                   	ret
   17517:	cc                   	int3
   17518:	cc                   	int3
   17519:	cc                   	int3
   1751a:	cc                   	int3
   1751b:	cc                   	int3
   1751c:	cc                   	int3
   1751d:	cc                   	int3
   1751e:	cc                   	int3
   1751f:	cc                   	int3

hyperinterval_strict_surface32:
   17520:	55                   	push   %rbp
   17521:	41 57                	push   %r15
   17523:	41 56                	push   %r14
   17525:	41 55                	push   %r13
   17527:	41 54                	push   %r12
   17529:	53                   	push   %rbx
   1752a:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
   17531:	89 f5                	mov    %esi,%ebp
   17533:	48 89 fb             	mov    %rdi,%rbx
   17536:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1753b:	66 0f 7e 44 24 3c    	movd   %xmm0,0x3c(%rsp)
   17541:	66 0f 7e 4c 24 2c    	movd   %xmm1,0x2c(%rsp)
   17547:	ff 15 73 7f 04 00    	call   *0x47f73(%rip)        # 5f4c0 <_DYNAMIC+0x2b0>
   1754d:	44 8b 6c 24 08       	mov    0x8(%rsp),%r13d
   17552:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   17557:	41 83 fd 02          	cmp    $0x2,%r13d
   1755b:	75 0e                	jne    1756b <hyperinterval_strict_surface32+0x4b>
   1755d:	88 43 04             	mov    %al,0x4(%rbx)
   17560:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17566:	e9 8a 00 00 00       	jmp    175f5 <hyperinterval_strict_surface32+0xd5>
   1756b:	49 89 df             	mov    %rbx,%r15
   1756e:	8b 4c 24 0d          	mov    0xd(%rsp),%ecx
   17572:	8b 54 24 10          	mov    0x10(%rsp),%edx
   17576:	89 54 24 48          	mov    %edx,0x48(%rsp)
   1757a:	89 4c 24 45          	mov    %ecx,0x45(%rsp)
   1757e:	44 89 6c 24 40       	mov    %r13d,0x40(%rsp)
   17583:	88 44 24 44          	mov    %al,0x44(%rsp)
   17587:	66 0f 6e 44 24 3c    	movd   0x3c(%rsp),%xmm0
   1758d:	ff 15 9d 7f 04 00    	call   *0x47f9d(%rip)        # 5f530 <_DYNAMIC+0x320>
   17593:	48 89 c3             	mov    %rax,%rbx
   17596:	f6 c3 01             	test   $0x1,%bl
   17599:	74 0b                	je     175a6 <hyperinterval_strict_surface32+0x86>
   1759b:	4c 89 f8             	mov    %r15,%rax
   1759e:	88 78 04             	mov    %bh,0x4(%rax)
   175a1:	4c 89 fb             	mov    %r15,%rbx
   175a4:	eb 48                	jmp    175ee <hyperinterval_strict_surface32+0xce>
   175a6:	66 0f 6e 44 24 2c    	movd   0x2c(%rsp),%xmm0
   175ac:	ff 15 86 7f 04 00    	call   *0x47f86(%rip)        # 5f538 <_DYNAMIC+0x328>
   175b2:	a8 01                	test   $0x1,%al
   175b4:	74 08                	je     175be <hyperinterval_strict_surface32+0x9e>
   175b6:	4c 89 fb             	mov    %r15,%rbx
   175b9:	88 63 04             	mov    %ah,0x4(%rbx)
   175bc:	eb 30                	jmp    175ee <hyperinterval_strict_surface32+0xce>
   175be:	48 c1 eb 20          	shr    $0x20,%rbx
   175c2:	66 0f 6e c3          	movd   %ebx,%xmm0
   175c6:	48 c1 e8 20          	shr    $0x20,%rax
   175ca:	66 0f 6e c8          	movd   %eax,%xmm1
   175ce:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   175d3:	ff 15 e7 7e 04 00    	call   *0x47ee7(%rip)        # 5f4c0 <_DYNAMIC+0x2b0>
   175d9:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   175dd:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   175e2:	83 f9 02             	cmp    $0x2,%ecx
   175e5:	75 23                	jne    1760a <hyperinterval_strict_surface32+0xea>
   175e7:	4c 89 fb             	mov    %r15,%rbx
   175ea:	41 88 47 04          	mov    %al,0x4(%r15)
   175ee:	41 c7 07 02 00 00 00 	movl   $0x2,(%r15)
   175f5:	48 89 d8             	mov    %rbx,%rax
   175f8:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
   175ff:	5b                   	pop    %rbx
   17600:	41 5c                	pop    %r12
   17602:	41 5d                	pop    %r13
   17604:	41 5e                	pop    %r14
   17606:	41 5f                	pop    %r15
   17608:	5d                   	pop    %rbp
   17609:	c3                   	ret
   1760a:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   1760e:	8b 74 24 10          	mov    0x10(%rsp),%esi
   17612:	89 74 24 60          	mov    %esi,0x60(%rsp)
   17616:	89 54 24 5d          	mov    %edx,0x5d(%rsp)
   1761a:	89 4c 24 58          	mov    %ecx,0x58(%rsp)
   1761e:	88 44 24 5c          	mov    %al,0x5c(%rsp)
   17622:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17627:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
   1762c:	89 ea                	mov    %ebp,%edx
   1762e:	ff 15 0c 7f 04 00    	call   *0x47f0c(%rip)        # 5f540 <_DYNAMIC+0x330>
   17634:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17638:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   1763d:	83 f9 02             	cmp    $0x2,%ecx
   17640:	4c 89 fb             	mov    %r15,%rbx
   17643:	0f 84 14 ff ff ff    	je     1755d <hyperinterval_strict_surface32+0x3d>
   17649:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   1764d:	8b 74 24 10          	mov    0x10(%rsp),%esi
   17651:	89 74 24 78          	mov    %esi,0x78(%rsp)
   17655:	89 54 24 75          	mov    %edx,0x75(%rsp)
   17659:	89 4c 24 70          	mov    %ecx,0x70(%rsp)
   1765d:	88 44 24 74          	mov    %al,0x74(%rsp)
   17661:	48 8d 7c 24 4c       	lea    0x4c(%rsp),%rdi
   17666:	48 8d 74 24 70       	lea    0x70(%rsp),%rsi
   1766b:	ff 15 d7 7e 04 00    	call   *0x47ed7(%rip)        # 5f548 <_DYNAMIC+0x338>
   17671:	8b 4c 24 4c          	mov    0x4c(%rsp),%ecx
   17675:	0f b6 44 24 50       	movzbl 0x50(%rsp),%eax
   1767a:	83 f9 02             	cmp    $0x2,%ecx
   1767d:	0f 84 da fe ff ff    	je     1755d <hyperinterval_strict_surface32+0x3d>
   17683:	8b 54 24 51          	mov    0x51(%rsp),%edx
   17687:	8b 74 24 54          	mov    0x54(%rsp),%esi
   1768b:	89 74 24 38          	mov    %esi,0x38(%rsp)
   1768f:	89 54 24 35          	mov    %edx,0x35(%rsp)
   17693:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   17697:	88 44 24 34          	mov    %al,0x34(%rsp)
   1769b:	48 8d 9c 24 9c 00 00 	lea    0x9c(%rsp),%rbx
   176a2:	00 
   176a3:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   176a8:	4c 8d 64 24 58       	lea    0x58(%rsp),%r12
   176ad:	48 89 df             	mov    %rbx,%rdi
   176b0:	4c 89 e2             	mov    %r12,%rdx
   176b3:	ff 15 97 7e 04 00    	call   *0x47e97(%rip)        # 5f550 <_DYNAMIC+0x340>
   176b9:	4c 8d 74 24 64       	lea    0x64(%rsp),%r14
   176be:	48 8d 54 24 40       	lea    0x40(%rsp),%rdx
   176c3:	4c 89 f7             	mov    %r14,%rdi
   176c6:	48 89 de             	mov    %rbx,%rsi
   176c9:	ff 15 89 7e 04 00    	call   *0x47e89(%rip)        # 5f558 <_DYNAMIC+0x348>
   176cf:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   176d4:	4c 89 f6             	mov    %r14,%rsi
   176d7:	ff 15 83 7e 04 00    	call   *0x47e83(%rip)        # 5f560 <_DYNAMIC+0x350>
   176dd:	48 8d 7c 24 14       	lea    0x14(%rsp),%rdi
   176e2:	4c 89 f6             	mov    %r14,%rsi
   176e5:	4c 89 e2             	mov    %r12,%rdx
   176e8:	ff 15 7a 7e 04 00    	call   *0x47e7a(%rip)        # 5f568 <_DYNAMIC+0x358>
   176ee:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   176f3:	4c 89 f6             	mov    %r14,%rsi
   176f6:	4c 89 e2             	mov    %r12,%rdx
   176f9:	ff 15 71 7e 04 00    	call   *0x47e71(%rip)        # 5f570 <_DYNAMIC+0x360>
   176ff:	8b 44 24 28          	mov    0x28(%rsp),%eax
   17703:	89 84 24 90 00 00 00 	mov    %eax,0x90(%rsp)
   1770a:	0f 10 44 24 08       	movups 0x8(%rsp),%xmm0
   1770f:	0f 10 4c 24 18       	movups 0x18(%rsp),%xmm1
   17714:	0f 29 8c 24 80 00 00 	movaps %xmm1,0x80(%rsp)
   1771b:	00 
   1771c:	0f 29 44 24 70       	movaps %xmm0,0x70(%rsp)
   17721:	48 8d 44 24 70       	lea    0x70(%rsp),%rax
   17726:	4c 89 f7             	mov    %r14,%rdi
   17729:	ff 15 49 7e 04 00    	call   *0x47e49(%rip)        # 5f578 <_DYNAMIC+0x368>
   1772f:	8b 4c 24 64          	mov    0x64(%rsp),%ecx
   17733:	83 f9 01             	cmp    $0x1,%ecx
   17736:	75 1c                	jne    17754 <hyperinterval_strict_surface32+0x234>
   17738:	8b 74 24 68          	mov    0x68(%rsp),%esi
   1773c:	8b 7c 24 6c          	mov    0x6c(%rsp),%edi
   17740:	39 fe                	cmp    %edi,%esi
   17742:	0f 94 c2             	sete   %dl
   17745:	66 0f 6e ce          	movd   %esi,%xmm1
   17749:	66 0f 6e c7          	movd   %edi,%xmm0
   1774d:	be 01 00 00 00       	mov    $0x1,%esi
   17752:	eb 04                	jmp    17758 <hyperinterval_strict_surface32+0x238>
   17754:	31 d2                	xor    %edx,%edx
   17756:	31 f6                	xor    %esi,%esi
   17758:	80 f1 01             	xor    $0x1,%cl
   1775b:	89 74 24 08          	mov    %esi,0x8(%rsp)
   1775f:	66 0f 7e 4c 24 0c    	movd   %xmm1,0xc(%rsp)
   17765:	88 4c 24 10          	mov    %cl,0x10(%rsp)
   17769:	88 54 24 11          	mov    %dl,0x11(%rsp)
   1776d:	88 44 24 12          	mov    %al,0x12(%rsp)
   17771:	89 74 24 14          	mov    %esi,0x14(%rsp)
   17775:	66 0f 7e 44 24 18    	movd   %xmm0,0x18(%rsp)
   1777b:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   17780:	4c 8d 64 24 64       	lea    0x64(%rsp),%r12
   17785:	48 8d 5c 24 58       	lea    0x58(%rsp),%rbx
   1778a:	4c 89 e7             	mov    %r12,%rdi
   1778d:	48 89 de             	mov    %rbx,%rsi
   17790:	ff 15 ea 7d 04 00    	call   *0x47dea(%rip)        # 5f580 <_DYNAMIC+0x370>
   17796:	88 44 24 2c          	mov    %al,0x2c(%rsp)
   1779a:	4c 89 e7             	mov    %r12,%rdi
   1779d:	48 89 de             	mov    %rbx,%rsi
   177a0:	ff 15 e2 7d 04 00    	call   *0x47de2(%rip)        # 5f588 <_DYNAMIC+0x378>
   177a6:	41 89 c6             	mov    %eax,%r14d
   177a9:	48 8d 5c 24 40       	lea    0x40(%rsp),%rbx
   177ae:	4c 89 e7             	mov    %r12,%rdi
   177b1:	48 89 de             	mov    %rbx,%rsi
   177b4:	ff 15 d6 7d 04 00    	call   *0x47dd6(%rip)        # 5f590 <_DYNAMIC+0x380>
   177ba:	89 c5                	mov    %eax,%ebp
   177bc:	4c 89 e7             	mov    %r12,%rdi
   177bf:	48 89 de             	mov    %rbx,%rsi
   177c2:	ff 15 d0 7d 04 00    	call   *0x47dd0(%rip)        # 5f598 <_DYNAMIC+0x388>
   177c8:	89 c3                	mov    %eax,%ebx
   177ca:	4c 89 e7             	mov    %r12,%rdi
   177cd:	66 0f 6e 44 24 3c    	movd   0x3c(%rsp),%xmm0
   177d3:	ff 15 7f 7c 04 00    	call   *0x47c7f(%rip)        # 5f458 <_DYNAMIC+0x248>
   177d9:	a8 01                	test   $0x1,%al
   177db:	74 0c                	je     177e9 <hyperinterval_strict_surface32+0x2c9>
   177dd:	4c 89 fb             	mov    %r15,%rbx
   177e0:	41 88 57 04          	mov    %dl,0x4(%r15)
   177e4:	e9 05 fe ff ff       	jmp    175ee <hyperinterval_strict_surface32+0xce>
   177e9:	80 e2 01             	and    $0x1,%dl
   177ec:	0f b6 44 24 2c       	movzbl 0x2c(%rsp),%eax
   177f1:	88 44 24 08          	mov    %al,0x8(%rsp)
   177f5:	44 88 74 24 09       	mov    %r14b,0x9(%rsp)
   177fa:	40 88 6c 24 0a       	mov    %bpl,0xa(%rsp)
   177ff:	88 5c 24 0b          	mov    %bl,0xb(%rsp)
   17803:	88 54 24 0c          	mov    %dl,0xc(%rsp)
   17807:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   1780c:	41 83 fd 01          	cmp    $0x1,%r13d
   17810:	75 2a                	jne    1783c <hyperinterval_strict_surface32+0x31c>
   17812:	f3 0f 7e 44 24 44    	movq   0x44(%rsp),%xmm0
   17818:	66 0f ef c9          	pxor   %xmm1,%xmm1
   1781c:	66 0f 6f 15 4c e1 fe 	movdqa -0x11eb4(%rip),%xmm2        # 5970 <__abi_tag+0x5674>
   17823:	ff 
   17824:	66 0f ef d0          	pxor   %xmm0,%xmm2
   17828:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   1782c:	66 0f df ca          	pandn  %xmm2,%xmm1
   17830:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   17835:	b8 01 00 00 00       	mov    $0x1,%eax
   1783a:	eb 02                	jmp    1783e <hyperinterval_strict_surface32+0x31e>
   1783c:	31 c0                	xor    %eax,%eax
   1783e:	89 44 24 4c          	mov    %eax,0x4c(%rsp)
   17842:	66 0f d6 44 24 50    	movq   %xmm0,0x50(%rsp)
   17848:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1784d:	48 8d 74 24 64       	lea    0x64(%rsp),%rsi
   17852:	48 8d 54 24 4c       	lea    0x4c(%rsp),%rdx
   17857:	ff 15 43 7d 04 00    	call   *0x47d43(%rip)        # 5f5a0 <_DYNAMIC+0x390>
   1785d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17861:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   17866:	83 f9 02             	cmp    $0x2,%ecx
   17869:	4c 89 fb             	mov    %r15,%rbx
   1786c:	0f 84 eb fc ff ff    	je     1755d <hyperinterval_strict_surface32+0x3d>
   17872:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   17876:	8b 74 24 10          	mov    0x10(%rsp),%esi
   1787a:	89 74 24 38          	mov    %esi,0x38(%rsp)
   1787e:	89 54 24 35          	mov    %edx,0x35(%rsp)
   17882:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   17886:	88 44 24 34          	mov    %al,0x34(%rsp)
   1788a:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1788f:	66 0f 6e 05 2d e0 fe 	movd   -0x11fd3(%rip),%xmm0        # 58c4 <__abi_tag+0x55c8>
   17896:	ff 
   17897:	ff 15 3b 7c 04 00    	call   *0x47c3b(%rip)        # 5f4d8 <_DYNAMIC+0x2c8>
   1789d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   178a1:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   178a6:	83 f9 02             	cmp    $0x2,%ecx
   178a9:	0f 84 ae fc ff ff    	je     1755d <hyperinterval_strict_surface32+0x3d>
   178af:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   178b3:	8b 74 24 10          	mov    0x10(%rsp),%esi
   178b7:	89 74 24 78          	mov    %esi,0x78(%rsp)
   178bb:	89 54 24 75          	mov    %edx,0x75(%rsp)
   178bf:	89 4c 24 70          	mov    %ecx,0x70(%rsp)
   178c3:	88 44 24 74          	mov    %al,0x74(%rsp)
   178c7:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   178cc:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   178d1:	48 89 df             	mov    %rbx,%rdi
   178d4:	ff 15 ce 7c 04 00    	call   *0x47cce(%rip)        # 5f5a8 <_DYNAMIC+0x398>
   178da:	e9 16 fd ff ff       	jmp    175f5 <hyperinterval_strict_surface32+0xd5>
   178df:	cc                   	int3

hyperinterval_strict_surface64:
   178e0:	55                   	push   %rbp
   178e1:	41 57                	push   %r15
   178e3:	41 56                	push   %r14
   178e5:	41 55                	push   %r13
   178e7:	41 54                	push   %r12
   178e9:	53                   	push   %rbx
   178ea:	48 81 ec 58 01 00 00 	sub    $0x158,%rsp
   178f1:	89 f5                	mov    %esi,%ebp
   178f3:	48 89 fb             	mov    %rdi,%rbx
   178f6:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   178fb:	f2 0f 11 84 24 98 00 	movsd  %xmm0,0x98(%rsp)
   17902:	00 00 
   17904:	66 0f d6 4c 24 60    	movq   %xmm1,0x60(%rsp)
   1790a:	ff 15 e0 7b 04 00    	call   *0x47be0(%rip)        # 5f4f0 <_DYNAMIC+0x2e0>
   17910:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   17915:	44 0f b6 64 24 18    	movzbl 0x18(%rsp),%r12d
   1791b:	49 83 ff 02          	cmp    $0x2,%r15
   1791f:	75 09                	jne    1792a <hyperinterval_strict_surface64+0x4a>
   17921:	44 88 63 08          	mov    %r12b,0x8(%rbx)
   17925:	e9 9c 00 00 00       	jmp    179c6 <hyperinterval_strict_surface64+0xe6>
   1792a:	44 0f b6 74 24 1f    	movzbl 0x1f(%rsp),%r14d
   17930:	44 0f b7 6c 24 1d    	movzwl 0x1d(%rsp),%r13d
   17936:	8b 44 24 19          	mov    0x19(%rsp),%eax
   1793a:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1793f:	4c 89 7c 24 68       	mov    %r15,0x68(%rsp)
   17944:	44 88 64 24 70       	mov    %r12b,0x70(%rsp)
   17949:	44 88 74 24 77       	mov    %r14b,0x77(%rsp)
   1794e:	66 44 89 6c 24 75    	mov    %r13w,0x75(%rsp)
   17954:	48 89 84 24 20 01 00 	mov    %rax,0x120(%rsp)
   1795b:	00 
   1795c:	89 44 24 71          	mov    %eax,0x71(%rsp)
   17960:	48 89 8c 24 18 01 00 	mov    %rcx,0x118(%rsp)
   17967:	00 
   17968:	48 89 4c 24 78       	mov    %rcx,0x78(%rsp)
   1796d:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
   17974:	00 
   17975:	f2 0f 10 84 24 98 00 	movsd  0x98(%rsp),%xmm0
   1797c:	00 00 
   1797e:	ff 15 2c 7c 04 00    	call   *0x47c2c(%rip)        # 5f5b0 <_DYNAMIC+0x3a0>
   17984:	80 bc 24 d0 00 00 00 	cmpb   $0x1,0xd0(%rsp)
   1798b:	01 
   1798c:	74 2d                	je     179bb <hyperinterval_strict_surface64+0xdb>
   1798e:	f2 0f 10 84 24 d8 00 	movsd  0xd8(%rsp),%xmm0
   17995:	00 00 
   17997:	f2 0f 11 44 24 58    	movsd  %xmm0,0x58(%rsp)
   1799d:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
   179a4:	00 
   179a5:	f2 0f 10 44 24 60    	movsd  0x60(%rsp),%xmm0
   179ab:	ff 15 07 7c 04 00    	call   *0x47c07(%rip)        # 5f5b8 <_DYNAMIC+0x3a8>
   179b1:	80 bc 24 d0 00 00 00 	cmpb   $0x1,0xd0(%rsp)
   179b8:	01 
   179b9:	75 27                	jne    179e2 <hyperinterval_strict_surface64+0x102>
   179bb:	0f b6 84 24 d1 00 00 	movzbl 0xd1(%rsp),%eax
   179c2:	00 
   179c3:	88 43 08             	mov    %al,0x8(%rbx)
   179c6:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   179cd:	48 89 d8             	mov    %rbx,%rax
   179d0:	48 81 c4 58 01 00 00 	add    $0x158,%rsp
   179d7:	5b                   	pop    %rbx
   179d8:	41 5c                	pop    %r12
   179da:	41 5d                	pop    %r13
   179dc:	41 5e                	pop    %r14
   179de:	41 5f                	pop    %r15
   179e0:	5d                   	pop    %rbp
   179e1:	c3                   	ret
   179e2:	f3 0f 7e 8c 24 d8 00 	movq   0xd8(%rsp),%xmm1
   179e9:	00 00 
   179eb:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   179f0:	f2 0f 10 44 24 58    	movsd  0x58(%rsp),%xmm0
   179f6:	ff 15 f4 7a 04 00    	call   *0x47af4(%rip)        # 5f4f0 <_DYNAMIC+0x2e0>
   179fc:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17a01:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17a06:	48 83 f9 02          	cmp    $0x2,%rcx
   17a0a:	74 b7                	je     179c3 <hyperinterval_strict_surface64+0xe3>
   17a0c:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   17a11:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   17a16:	48 89 b4 24 b0 00 00 	mov    %rsi,0xb0(%rsp)
   17a1d:	00 
   17a1e:	48 89 94 24 a9 00 00 	mov    %rdx,0xa9(%rsp)
   17a25:	00 
   17a26:	48 89 8c 24 a0 00 00 	mov    %rcx,0xa0(%rsp)
   17a2d:	00 
   17a2e:	88 84 24 a8 00 00 00 	mov    %al,0xa8(%rsp)
   17a35:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17a3a:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
   17a3f:	89 ea                	mov    %ebp,%edx
   17a41:	ff 15 79 7b 04 00    	call   *0x47b79(%rip)        # 5f5c0 <_DYNAMIC+0x3b0>
   17a47:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17a4c:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17a51:	48 83 f9 02          	cmp    $0x2,%rcx
   17a55:	0f 84 68 ff ff ff    	je     179c3 <hyperinterval_strict_surface64+0xe3>
   17a5b:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   17a60:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   17a65:	48 89 b4 24 e0 00 00 	mov    %rsi,0xe0(%rsp)
   17a6c:	00 
   17a6d:	48 89 94 24 d9 00 00 	mov    %rdx,0xd9(%rsp)
   17a74:	00 
   17a75:	48 89 8c 24 d0 00 00 	mov    %rcx,0xd0(%rsp)
   17a7c:	00 
   17a7d:	88 84 24 d8 00 00 00 	mov    %al,0xd8(%rsp)
   17a84:	48 8d bc 24 b8 00 00 	lea    0xb8(%rsp),%rdi
   17a8b:	00 
   17a8c:	48 8d b4 24 d0 00 00 	lea    0xd0(%rsp),%rsi
   17a93:	00 
   17a94:	ff 15 2e 7b 04 00    	call   *0x47b2e(%rip)        # 5f5c8 <_DYNAMIC+0x3b8>
   17a9a:	48 8b 8c 24 b8 00 00 	mov    0xb8(%rsp),%rcx
   17aa1:	00 
   17aa2:	0f b6 84 24 c0 00 00 	movzbl 0xc0(%rsp),%eax
   17aa9:	00 
   17aaa:	48 83 f9 02          	cmp    $0x2,%rcx
   17aae:	0f 84 0f ff ff ff    	je     179c3 <hyperinterval_strict_surface64+0xe3>
   17ab4:	48 8b 94 24 c1 00 00 	mov    0xc1(%rsp),%rdx
   17abb:	00 
   17abc:	48 8b b4 24 c8 00 00 	mov    0xc8(%rsp),%rsi
   17ac3:	00 
   17ac4:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
   17acb:	00 
   17acc:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
   17ad3:	00 
   17ad4:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
   17adb:	00 
   17adc:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
   17ae3:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
   17aea:	00 
   17aeb:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   17af2:	00 
   17af3:	48 8d 94 24 a0 00 00 	lea    0xa0(%rsp),%rdx
   17afa:	00 
   17afb:	ff 15 cf 7a 04 00    	call   *0x47acf(%rip)        # 5f5d0 <_DYNAMIC+0x3c0>
   17b01:	48 8d ac 24 28 01 00 	lea    0x128(%rsp),%rbp
   17b08:	00 
   17b09:	48 8d 54 24 68       	lea    0x68(%rsp),%rdx
   17b0e:	48 89 ef             	mov    %rbp,%rdi
   17b11:	48 8d b4 24 40 01 00 	lea    0x140(%rsp),%rsi
   17b18:	00 
   17b19:	ff 15 b9 7a 04 00    	call   *0x47ab9(%rip)        # 5f5d8 <_DYNAMIC+0x3c8>
   17b1f:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17b24:	48 89 ee             	mov    %rbp,%rsi
   17b27:	e8 04 f5 ff ff       	call   17030 <hyperinterval::float::F64Enclosure::abs>
   17b2c:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   17b31:	48 89 ee             	mov    %rbp,%rsi
   17b34:	48 8d 94 24 a0 00 00 	lea    0xa0(%rsp),%rdx
   17b3b:	00 
   17b3c:	ff 15 9e 7a 04 00    	call   *0x47a9e(%rip)        # 5f5e0 <_DYNAMIC+0x3d0>
   17b42:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   17b47:	48 89 ee             	mov    %rbp,%rsi
   17b4a:	48 8d 94 24 a0 00 00 	lea    0xa0(%rsp),%rdx
   17b51:	00 
   17b52:	ff 15 90 7a 04 00    	call   *0x47a90(%rip)        # 5f5e8 <_DYNAMIC+0x3d8>
   17b58:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   17b5d:	48 89 84 24 10 01 00 	mov    %rax,0x110(%rsp)
   17b64:	00 
   17b65:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
   17b6a:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
   17b6f:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
   17b74:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
   17b79:	0f 29 9c 24 00 01 00 	movaps %xmm3,0x100(%rsp)
   17b80:	00 
   17b81:	0f 29 94 24 f0 00 00 	movaps %xmm2,0xf0(%rsp)
   17b88:	00 
   17b89:	0f 29 8c 24 e0 00 00 	movaps %xmm1,0xe0(%rsp)
   17b90:	00 
   17b91:	0f 29 84 24 d0 00 00 	movaps %xmm0,0xd0(%rsp)
   17b98:	00 
   17b99:	48 8d 84 24 d0 00 00 	lea    0xd0(%rsp),%rax
   17ba0:	00 
   17ba1:	48 89 ef             	mov    %rbp,%rdi
   17ba4:	ff 15 46 7a 04 00    	call   *0x47a46(%rip)        # 5f5f0 <_DYNAMIC+0x3e0>
   17baa:	48 8b 8c 24 28 01 00 	mov    0x128(%rsp),%rcx
   17bb1:	00 
   17bb2:	48 83 f9 01          	cmp    $0x1,%rcx
   17bb6:	75 27                	jne    17bdf <hyperinterval_strict_surface64+0x2ff>
   17bb8:	48 8b b4 24 30 01 00 	mov    0x130(%rsp),%rsi
   17bbf:	00 
   17bc0:	48 8b bc 24 38 01 00 	mov    0x138(%rsp),%rdi
   17bc7:	00 
   17bc8:	48 39 fe             	cmp    %rdi,%rsi
   17bcb:	0f 94 c2             	sete   %dl
   17bce:	66 48 0f 6e ce       	movq   %rsi,%xmm1
   17bd3:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   17bd8:	be 01 00 00 00       	mov    $0x1,%esi
   17bdd:	eb 04                	jmp    17be3 <hyperinterval_strict_surface64+0x303>
   17bdf:	31 d2                	xor    %edx,%edx
   17be1:	31 f6                	xor    %esi,%esi
   17be3:	80 f1 01             	xor    $0x1,%cl
   17be6:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
   17beb:	66 0f d6 4c 24 18    	movq   %xmm1,0x18(%rsp)
   17bf1:	88 4c 24 20          	mov    %cl,0x20(%rsp)
   17bf5:	88 54 24 21          	mov    %dl,0x21(%rsp)
   17bf9:	88 44 24 22          	mov    %al,0x22(%rsp)
   17bfd:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
   17c02:	66 0f d6 44 24 30    	movq   %xmm0,0x30(%rsp)
   17c08:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
   17c0d:	48 8d ac 24 28 01 00 	lea    0x128(%rsp),%rbp
   17c14:	00 
   17c15:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
   17c1c:	00 
   17c1d:	48 89 ef             	mov    %rbp,%rdi
   17c20:	ff 15 d2 79 04 00    	call   *0x479d2(%rip)        # 5f5f8 <_DYNAMIC+0x3e8>
   17c26:	88 44 24 60          	mov    %al,0x60(%rsp)
   17c2a:	48 89 ef             	mov    %rbp,%rdi
   17c2d:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
   17c34:	00 
   17c35:	ff 15 c5 79 04 00    	call   *0x479c5(%rip)        # 5f600 <_DYNAMIC+0x3f0>
   17c3b:	88 44 24 58          	mov    %al,0x58(%rsp)
   17c3f:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
   17c44:	48 89 ef             	mov    %rbp,%rdi
   17c47:	ff 15 bb 79 04 00    	call   *0x479bb(%rip)        # 5f608 <_DYNAMIC+0x3f8>
   17c4d:	88 44 24 0f          	mov    %al,0xf(%rsp)
   17c51:	48 89 ef             	mov    %rbp,%rdi
   17c54:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
   17c59:	ff 15 b1 79 04 00    	call   *0x479b1(%rip)        # 5f610 <_DYNAMIC+0x400>
   17c5f:	88 44 24 0e          	mov    %al,0xe(%rsp)
   17c63:	48 89 ef             	mov    %rbp,%rdi
   17c66:	f2 0f 10 84 24 98 00 	movsd  0x98(%rsp),%xmm0
   17c6d:	00 00 
   17c6f:	ff 15 db 77 04 00    	call   *0x477db(%rip)        # 5f450 <_DYNAMIC+0x240>
   17c75:	a8 01                	test   $0x1,%al
   17c77:	74 08                	je     17c81 <hyperinterval_strict_surface64+0x3a1>
   17c79:	88 53 08             	mov    %dl,0x8(%rbx)
   17c7c:	e9 45 fd ff ff       	jmp    179c6 <hyperinterval_strict_surface64+0xe6>
   17c81:	80 e2 01             	and    $0x1,%dl
   17c84:	0f b6 44 24 60       	movzbl 0x60(%rsp),%eax
   17c89:	88 44 24 10          	mov    %al,0x10(%rsp)
   17c8d:	0f b6 44 24 58       	movzbl 0x58(%rsp),%eax
   17c92:	88 44 24 11          	mov    %al,0x11(%rsp)
   17c96:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
   17c9b:	88 44 24 12          	mov    %al,0x12(%rsp)
   17c9f:	0f b6 44 24 0e       	movzbl 0xe(%rsp),%eax
   17ca4:	88 44 24 13          	mov    %al,0x13(%rsp)
   17ca8:	88 54 24 14          	mov    %dl,0x14(%rsp)
   17cac:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
   17cb1:	41 83 ff 01          	cmp    $0x1,%r15d
   17cb5:	75 51                	jne    17d08 <hyperinterval_strict_surface64+0x428>
   17cb7:	41 c1 e6 10          	shl    $0x10,%r14d
   17cbb:	45 09 f5             	or     %r14d,%r13d
   17cbe:	41 0f b6 c4          	movzbl %r12b,%eax
   17cc2:	49 c1 e5 20          	shl    $0x20,%r13
   17cc6:	48 8b 94 24 20 01 00 	mov    0x120(%rsp),%rdx
   17ccd:	00 
   17cce:	4c 09 ea             	or     %r13,%rdx
   17cd1:	48 c1 e2 08          	shl    $0x8,%rdx
   17cd5:	48 09 c2             	or     %rax,%rdx
   17cd8:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   17cdf:	00 00 80 
   17ce2:	48 8b b4 24 18 01 00 	mov    0x118(%rsp),%rsi
   17ce9:	00 
   17cea:	48 89 f1             	mov    %rsi,%rcx
   17ced:	48 31 c1             	xor    %rax,%rcx
   17cf0:	48 85 f6             	test   %rsi,%rsi
   17cf3:	48 0f 44 ce          	cmove  %rsi,%rcx
   17cf7:	48 31 d0             	xor    %rdx,%rax
   17cfa:	48 85 d2             	test   %rdx,%rdx
   17cfd:	48 0f 44 c2          	cmove  %rdx,%rax
   17d01:	ba 01 00 00 00       	mov    $0x1,%edx
   17d06:	eb 02                	jmp    17d0a <hyperinterval_strict_surface64+0x42a>
   17d08:	31 d2                	xor    %edx,%edx
   17d0a:	48 89 94 24 b8 00 00 	mov    %rdx,0xb8(%rsp)
   17d11:	00 
   17d12:	48 89 8c 24 c0 00 00 	mov    %rcx,0xc0(%rsp)
   17d19:	00 
   17d1a:	48 89 84 24 c8 00 00 	mov    %rax,0xc8(%rsp)
   17d21:	00 
   17d22:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17d27:	48 8d b4 24 28 01 00 	lea    0x128(%rsp),%rsi
   17d2e:	00 
   17d2f:	48 8d 94 24 b8 00 00 	lea    0xb8(%rsp),%rdx
   17d36:	00 
   17d37:	ff 15 db 78 04 00    	call   *0x478db(%rip)        # 5f618 <_DYNAMIC+0x408>
   17d3d:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17d42:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17d47:	48 83 f9 02          	cmp    $0x2,%rcx
   17d4b:	0f 84 72 fc ff ff    	je     179c3 <hyperinterval_strict_surface64+0xe3>
   17d51:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   17d56:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   17d5b:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
   17d62:	00 
   17d63:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
   17d6a:	00 
   17d6b:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
   17d72:	00 
   17d73:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
   17d7a:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17d7f:	f2 0f 10 05 a9 da fe 	movsd  -0x12557(%rip),%xmm0        # 5830 <__abi_tag+0x5534>
   17d86:	ff 
   17d87:	ff 15 7b 77 04 00    	call   *0x4777b(%rip)        # 5f508 <_DYNAMIC+0x2f8>
   17d8d:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17d92:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17d97:	48 83 f9 02          	cmp    $0x2,%rcx
   17d9b:	0f 84 22 fc ff ff    	je     179c3 <hyperinterval_strict_surface64+0xe3>
   17da1:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   17da6:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   17dab:	48 89 b4 24 e0 00 00 	mov    %rsi,0xe0(%rsp)
   17db2:	00 
   17db3:	48 89 94 24 d9 00 00 	mov    %rdx,0xd9(%rsp)
   17dba:	00 
   17dbb:	48 89 8c 24 d0 00 00 	mov    %rcx,0xd0(%rsp)
   17dc2:	00 
   17dc3:	88 84 24 d8 00 00 00 	mov    %al,0xd8(%rsp)
   17dca:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   17dd1:	00 
   17dd2:	48 8d 94 24 d0 00 00 	lea    0xd0(%rsp),%rdx
   17dd9:	00 
   17dda:	48 89 df             	mov    %rbx,%rdi
   17ddd:	ff 15 3d 78 04 00    	call   *0x4783d(%rip)        # 5f620 <_DYNAMIC+0x410>
   17de3:	e9 e5 fb ff ff       	jmp    179cd <hyperinterval_strict_surface64+0xed>
   17de8:	cc                   	int3
   17de9:	cc                   	int3
   17dea:	cc                   	int3
   17deb:	cc                   	int3
   17dec:	cc                   	int3
   17ded:	cc                   	int3
   17dee:	cc                   	int3
   17def:	cc                   	int3

hyperinterval::float::F32Enclosure::reciprocal:
   17e70:	41 57                	push   %r15
   17e72:	41 56                	push   %r14
   17e74:	41 54                	push   %r12
   17e76:	53                   	push   %rbx
   17e77:	48 83 ec 28          	sub    $0x28,%rsp
   17e7b:	48 89 fb             	mov    %rdi,%rbx
   17e7e:	83 3e 00             	cmpl   $0x0,(%rsi)
   17e81:	74 5e                	je     17ee1 <hyperinterval::float::F32Enclosure::reciprocal+0x71>
   17e83:	49 89 f6             	mov    %rsi,%r14
   17e86:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   17e8c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17e91:	be 00 00 00 80       	mov    $0x80000000,%esi
   17e96:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17e9b:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   17ea0:	e8 8b 4f 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   17ea5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   17eaa:	74 25                	je     17ed1 <hyperinterval::float::F32Enclosure::reciprocal+0x61>
   17eac:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   17eb1:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17eb6:	be 00 00 00 80       	mov    $0x80000000,%esi
   17ebb:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17ec0:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   17ec5:	e8 66 4f 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   17eca:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   17ecf:	75 25                	jne    17ef6 <hyperinterval::float::F32Enclosure::reciprocal+0x86>
   17ed1:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   17ed6:	88 4b 04             	mov    %cl,0x4(%rbx)
   17ed9:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17edf:	eb 06                	jmp    17ee7 <hyperinterval::float::F32Enclosure::reciprocal+0x77>
   17ee1:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   17ee7:	48 89 d8             	mov    %rbx,%rax
   17eea:	48 83 c4 28          	add    $0x28,%rsp
   17eee:	5b                   	pop    %rbx
   17eef:	41 5c                	pop    %r12
   17ef1:	41 5e                	pop    %r14
   17ef3:	41 5f                	pop    %r15
   17ef5:	c3                   	ret
   17ef6:	8b 44 24 10          	mov    0x10(%rsp),%eax
   17efa:	44 89 e1             	mov    %r12d,%ecx
   17efd:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   17f03:	89 c2                	mov    %eax,%edx
   17f05:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   17f0b:	be 00 00 00 80       	mov    $0x80000000,%esi
   17f10:	29 ce                	sub    %ecx,%esi
   17f12:	44 09 f9             	or     %r15d,%ecx
   17f15:	45 85 e4             	test   %r12d,%r12d
   17f18:	48 0f 49 f1          	cmovns %rcx,%rsi
   17f1c:	89 d1                	mov    %edx,%ecx
   17f1e:	44 09 f9             	or     %r15d,%ecx
   17f21:	41 29 d7             	sub    %edx,%r15d
   17f24:	85 c0                	test   %eax,%eax
   17f26:	4c 0f 49 f9          	cmovns %rcx,%r15
   17f2a:	b1 01                	mov    $0x1,%cl
   17f2c:	44 39 fe             	cmp    %r15d,%esi
   17f2f:	77 a5                	ja     17ed6 <hyperinterval::float::F32Enclosure::reciprocal+0x66>
   17f31:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%rsp)
   17f38:	00 
   17f39:	44 89 64 24 20       	mov    %r12d,0x20(%rsp)
   17f3e:	89 44 24 24          	mov    %eax,0x24(%rsp)
   17f42:	41 83 7e 04 00       	cmpl   $0x0,0x4(%r14)
   17f47:	7f 15                	jg     17f5e <hyperinterval::float::F32Enclosure::reciprocal+0xee>
   17f49:	41 8b 46 08          	mov    0x8(%r14),%eax
   17f4d:	85 c0                	test   %eax,%eax
   17f4f:	0f 99 c1             	setns  %cl
   17f52:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   17f57:	0f 94 c0             	sete   %al
   17f5a:	08 c8                	or     %cl,%al
   17f5c:	75 1a                	jne    17f78 <hyperinterval::float::F32Enclosure::reciprocal+0x108>
   17f5e:	48 8d 74 24 1c       	lea    0x1c(%rsp),%rsi
   17f63:	48 89 df             	mov    %rbx,%rdi
   17f66:	4c 89 f2             	mov    %r14,%rdx
   17f69:	b9 01 00 00 00       	mov    $0x1,%ecx
   17f6e:	e8 8d 02 00 00       	call   18200 <hyperinterval::float::F32Enclosure::corner_image>
   17f73:	e9 6f ff ff ff       	jmp    17ee7 <hyperinterval::float::F32Enclosure::reciprocal+0x77>
   17f78:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
   17f7c:	e9 58 ff ff ff       	jmp    17ed9 <hyperinterval::float::F32Enclosure::reciprocal+0x69>
   17f81:	cc                   	int3
   17f82:	cc                   	int3
   17f83:	cc                   	int3
   17f84:	cc                   	int3
   17f85:	cc                   	int3
   17f86:	cc                   	int3
   17f87:	cc                   	int3
   17f88:	cc                   	int3
   17f89:	cc                   	int3
   17f8a:	cc                   	int3
   17f8b:	cc                   	int3
   17f8c:	cc                   	int3
   17f8d:	cc                   	int3
   17f8e:	cc                   	int3
   17f8f:	cc                   	int3

hyperinterval::float::F32Enclosure::checked_pow:
   17f90:	55                   	push   %rbp
   17f91:	41 57                	push   %r15
   17f93:	41 56                	push   %r14
   17f95:	41 55                	push   %r13
   17f97:	41 54                	push   %r12
   17f99:	53                   	push   %rbx
   17f9a:	48 83 ec 38          	sub    $0x38,%rsp
   17f9e:	48 89 fb             	mov    %rdi,%rbx
   17fa1:	83 fa 02             	cmp    $0x2,%edx
   17fa4:	75 0e                	jne    17fb4 <hyperinterval::float::F32Enclosure::checked_pow+0x24>
   17fa6:	48 89 df             	mov    %rbx,%rdi
   17fa9:	ff 15 21 75 04 00    	call   *0x47521(%rip)        # 5f4d0 <_DYNAMIC+0x2c0>
   17faf:	e9 c8 00 00 00       	jmp    1807c <hyperinterval::float::F32Enclosure::checked_pow+0xec>
   17fb4:	f6 06 01             	testb  $0x1,(%rsi)
   17fb7:	0f 84 b9 00 00 00    	je     18076 <hyperinterval::float::F32Enclosure::checked_pow+0xe6>
   17fbd:	89 d5                	mov    %edx,%ebp
   17fbf:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
   17fc3:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   17fc7:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17fcc:	be 00 00 00 80       	mov    $0x80000000,%esi
   17fd1:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17fd6:	4c 89 f9             	mov    %r15,%rcx
   17fd9:	41 89 e8             	mov    %ebp,%r8d
   17fdc:	e8 5f 46 00 00       	call   1c640 <hyperinterval::ieee::Format::power>
   17fe1:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   17fe6:	75 7e                	jne    18066 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   17fe8:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   17fed:	44 8b 6c 24 18       	mov    0x18(%rsp),%r13d
   17ff2:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17ff7:	be 00 00 00 80       	mov    $0x80000000,%esi
   17ffc:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18001:	4c 89 f1             	mov    %r14,%rcx
   18004:	41 89 e8             	mov    %ebp,%r8d
   18007:	e8 34 46 00 00       	call   1c640 <hyperinterval::ieee::Format::power>
   1800c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18011:	74 53                	je     18066 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   18013:	8b 44 24 10          	mov    0x10(%rsp),%eax
   18017:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1801c:	8b 44 24 18          	mov    0x18(%rsp),%eax
   18020:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   18025:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1802a:	be 00 00 00 80       	mov    $0x80000000,%esi
   1802f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18034:	4c 89 e1             	mov    %r12,%rcx
   18037:	e8 f4 4d 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1803c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18041:	74 23                	je     18066 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   18043:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   18048:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1804d:	be 00 00 00 80       	mov    $0x80000000,%esi
   18052:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18057:	4c 89 e9             	mov    %r13,%rcx
   1805a:	e8 d1 4d 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1805f:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18064:	75 28                	jne    1808e <hyperinterval::float::F32Enclosure::checked_pow+0xfe>
   18066:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1806b:	88 43 04             	mov    %al,0x4(%rbx)
   1806e:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18074:	eb 06                	jmp    1807c <hyperinterval::float::F32Enclosure::checked_pow+0xec>
   18076:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   1807c:	48 89 d8             	mov    %rbx,%rax
   1807f:	48 83 c4 38          	add    $0x38,%rsp
   18083:	5b                   	pop    %rbx
   18084:	41 5c                	pop    %r12
   18086:	41 5d                	pop    %r13
   18088:	41 5e                	pop    %r14
   1808a:	41 5f                	pop    %r15
   1808c:	5d                   	pop    %rbp
   1808d:	c3                   	ret
   1808e:	8b 7c 24 10          	mov    0x10(%rsp),%edi
   18092:	44 89 e0             	mov    %r12d,%eax
   18095:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   1809a:	89 f9                	mov    %edi,%ecx
   1809c:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   180a2:	ba 00 00 00 80       	mov    $0x80000000,%edx
   180a7:	29 c2                	sub    %eax,%edx
   180a9:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   180af:	44 09 e8             	or     %r13d,%eax
   180b2:	45 85 e4             	test   %r12d,%r12d
   180b5:	48 0f 49 d0          	cmovns %rax,%rdx
   180b9:	be 00 00 00 80       	mov    $0x80000000,%esi
   180be:	29 ce                	sub    %ecx,%esi
   180c0:	89 c8                	mov    %ecx,%eax
   180c2:	44 09 e8             	or     %r13d,%eax
   180c5:	85 ff                	test   %edi,%edi
   180c7:	48 0f 49 f0          	cmovns %rax,%rsi
   180cb:	b0 01                	mov    $0x1,%al
   180cd:	39 f2                	cmp    %esi,%edx
   180cf:	77 9a                	ja     1806b <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
   180d1:	89 7c 24 2c          	mov    %edi,0x2c(%rsp)
   180d5:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   180da:	be 00 00 00 80       	mov    $0x80000000,%esi
   180df:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   180e4:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   180e9:	e8 42 4d 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   180ee:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   180f3:	0f 84 6d ff ff ff    	je     18066 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   180f9:	4c 89 64 24 20       	mov    %r12,0x20(%rsp)
   180fe:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   18103:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18108:	be 00 00 00 80       	mov    $0x80000000,%esi
   1810d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18112:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
   18117:	e8 14 4d 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1811c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18121:	0f 84 3f ff ff ff    	je     18066 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   18127:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   1812b:	44 89 e0             	mov    %r12d,%eax
   1812e:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18133:	89 ca                	mov    %ecx,%edx
   18135:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1813b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18140:	29 c6                	sub    %eax,%esi
   18142:	44 09 e8             	or     %r13d,%eax
   18145:	45 85 e4             	test   %r12d,%r12d
   18148:	48 0f 49 f0          	cmovns %rax,%rsi
   1814c:	89 d0                	mov    %edx,%eax
   1814e:	44 09 e8             	or     %r13d,%eax
   18151:	41 29 d5             	sub    %edx,%r13d
   18154:	85 c9                	test   %ecx,%ecx
   18156:	4c 0f 49 e8          	cmovns %rax,%r13
   1815a:	b0 01                	mov    $0x1,%al
   1815c:	44 39 ee             	cmp    %r13d,%esi
   1815f:	0f 87 06 ff ff ff    	ja     1806b <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
   18165:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
   1816a:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
   1816e:	44 89 e2             	mov    %r12d,%edx
   18171:	e8 9a 54 00 00       	call   1d610 <hyperinterval::bounds::Bounds<T>::hull>
   18176:	41 89 c5             	mov    %eax,%r13d
   18179:	41 89 d4             	mov    %edx,%r12d
   1817c:	85 ed                	test   %ebp,%ebp
   1817e:	0f 95 c0             	setne  %al
   18181:	40 f6 c5 01          	test   $0x1,%bpl
   18185:	0f 94 c1             	sete   %cl
   18188:	84 c8                	test   %cl,%al
   1818a:	74 11                	je     1819d <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
   1818c:	44 89 ff             	mov    %r15d,%edi
   1818f:	44 89 f6             	mov    %r14d,%esi
   18192:	31 d2                	xor    %edx,%edx
   18194:	e8 27 56 00 00       	call   1d7c0 <hyperinterval::bounds::Bounds<T>::signs>
   18199:	a8 02                	test   $0x2,%al
   1819b:	75 13                	jne    181b0 <hyperinterval::float::F32Enclosure::checked_pow+0x220>
   1819d:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   181a3:	44 89 6b 04          	mov    %r13d,0x4(%rbx)
   181a7:	44 89 63 08          	mov    %r12d,0x8(%rbx)
   181ab:	e9 cc fe ff ff       	jmp    1807c <hyperinterval::float::F32Enclosure::checked_pow+0xec>
   181b0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   181b5:	31 f6                	xor    %esi,%esi
   181b7:	31 d2                	xor    %edx,%edx
   181b9:	e8 52 17 00 00       	call   19910 <hyperinterval::float::F32Enclosure::from_bits>
   181be:	8b 44 24 08          	mov    0x8(%rsp),%eax
   181c2:	83 f8 02             	cmp    $0x2,%eax
   181c5:	75 0a                	jne    181d1 <hyperinterval::float::F32Enclosure::checked_pow+0x241>
   181c7:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   181cc:	e9 9a fe ff ff       	jmp    1806b <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
   181d1:	83 f8 01             	cmp    $0x1,%eax
   181d4:	75 c7                	jne    1819d <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
   181d6:	8b 54 24 0c          	mov    0xc(%rsp),%edx
   181da:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   181de:	44 89 ef             	mov    %r13d,%edi
   181e1:	44 89 e6             	mov    %r12d,%esi
   181e4:	e8 27 54 00 00       	call   1d610 <hyperinterval::bounds::Bounds<T>::hull>
   181e9:	41 89 c5             	mov    %eax,%r13d
   181ec:	41 89 d4             	mov    %edx,%r12d
   181ef:	eb ac                	jmp    1819d <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
   181f1:	cc                   	int3
   181f2:	cc                   	int3
   181f3:	cc                   	int3
   181f4:	cc                   	int3
   181f5:	cc                   	int3
   181f6:	cc                   	int3
   181f7:	cc                   	int3
   181f8:	cc                   	int3
   181f9:	cc                   	int3
   181fa:	cc                   	int3
   181fb:	cc                   	int3
   181fc:	cc                   	int3
   181fd:	cc                   	int3
   181fe:	cc                   	int3
   181ff:	cc                   	int3

hyperinterval::float::F32Enclosure::corner_image:
   18200:	55                   	push   %rbp
   18201:	41 57                	push   %r15
   18203:	41 56                	push   %r14
   18205:	41 55                	push   %r13
   18207:	41 54                	push   %r12
   18209:	53                   	push   %rbx
   1820a:	48 83 ec 58          	sub    $0x58,%rsp
   1820e:	48 89 fb             	mov    %rdi,%rbx
   18211:	f6 06 01             	testb  $0x1,(%rsi)
   18214:	74 49                	je     1825f <hyperinterval::float::F32Enclosure::corner_image+0x5f>
   18216:	f6 02 01             	testb  $0x1,(%rdx)
   18219:	74 44                	je     1825f <hyperinterval::float::F32Enclosure::corner_image+0x5f>
   1821b:	44 8b 62 04          	mov    0x4(%rdx),%r12d
   1821f:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   18223:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
   18227:	8b 46 08             	mov    0x8(%rsi),%eax
   1822a:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1822f:	84 c9                	test   %cl,%cl
   18231:	74 37                	je     1826a <hyperinterval::float::F32Enclosure::corner_image+0x6a>
   18233:	48 89 e7             	mov    %rsp,%rdi
   18236:	be 00 00 00 80       	mov    $0x80000000,%esi
   1823b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18240:	4c 89 e9             	mov    %r13,%rcx
   18243:	4d 89 e0             	mov    %r12,%r8
   18246:	e8 85 3c 00 00       	call   1bed0 <hyperinterval::ieee::Format::div>
   1824b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1824f:	0f 84 bf 00 00 00    	je     18314 <hyperinterval::float::F32Enclosure::corner_image+0x114>
   18255:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1825a:	e9 ad 00 00 00       	jmp    1830c <hyperinterval::float::F32Enclosure::corner_image+0x10c>
   1825f:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   18265:	e9 42 03 00 00       	jmp    185ac <hyperinterval::float::F32Enclosure::corner_image+0x3ac>
   1826a:	44 89 e8             	mov    %r13d,%eax
   1826d:	c1 e8 17             	shr    $0x17,%eax
   18270:	0f b6 d0             	movzbl %al,%edx
   18273:	44 89 ee             	mov    %r13d,%esi
   18276:	81 e6 ff ff 7f 00    	and    $0x7fffff,%esi
   1827c:	31 c9                	xor    %ecx,%ecx
   1827e:	85 d2                	test   %edx,%edx
   18280:	0f 95 c1             	setne  %cl
   18283:	b8 01 00 00 00       	mov    $0x1,%eax
   18288:	0f 45 c2             	cmovne %edx,%eax
   1828b:	c1 e1 17             	shl    $0x17,%ecx
   1828e:	48 09 f1             	or     %rsi,%rcx
   18291:	44 89 e2             	mov    %r12d,%edx
   18294:	c1 ea 17             	shr    $0x17,%edx
   18297:	0f b6 d2             	movzbl %dl,%edx
   1829a:	44 89 e6             	mov    %r12d,%esi
   1829d:	81 e6 ff ff 7f 00    	and    $0x7fffff,%esi
   182a3:	8d ba d4 fe ff ff    	lea    -0x12c(%rdx),%edi
   182a9:	45 31 c0             	xor    %r8d,%r8d
   182ac:	85 d2                	test   %edx,%edx
   182ae:	ba d5 fe ff ff       	mov    $0xfffffed5,%edx
   182b3:	0f 45 d7             	cmovne %edi,%edx
   182b6:	41 0f 95 c0          	setne  %r8b
   182ba:	41 c1 e0 17          	shl    $0x17,%r8d
   182be:	49 09 f0             	or     %rsi,%r8
   182c1:	4c 0f af c1          	imul   %rcx,%r8
   182c5:	44 89 e9             	mov    %r13d,%ecx
   182c8:	44 31 e1             	xor    %r12d,%ecx
   182cb:	01 c2                	add    %eax,%edx
   182cd:	c1 e9 1f             	shr    $0x1f,%ecx
   182d0:	88 4c 24 14          	mov    %cl,0x14(%rsp)
   182d4:	4c 89 04 24          	mov    %r8,(%rsp)
   182d8:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   182df:	00 00 
   182e1:	89 54 24 10          	mov    %edx,0x10(%rsp)
   182e5:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   182ea:	48 89 e1             	mov    %rsp,%rcx
   182ed:	be 00 00 00 80       	mov    $0x80000000,%esi
   182f2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   182f7:	e8 74 4b 00 00       	call   1ce70 <hyperinterval::ieee::Format::rounded>
   182fc:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   18301:	0f 84 54 02 00 00    	je     1855b <hyperinterval::float::F32Enclosure::corner_image+0x35b>
   18307:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   1830c:	88 43 04             	mov    %al,0x4(%rbx)
   1830f:	e9 92 02 00 00       	jmp    185a6 <hyperinterval::float::F32Enclosure::corner_image+0x3a6>
   18314:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18318:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   1831d:	48 89 e7             	mov    %rsp,%rdi
   18320:	be 00 00 00 80       	mov    $0x80000000,%esi
   18325:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1832a:	e8 01 4b 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1832f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18333:	0f 85 63 02 00 00    	jne    1859c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   18339:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1833e:	48 89 e7             	mov    %rsp,%rdi
   18341:	be 00 00 00 80       	mov    $0x80000000,%esi
   18346:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1834b:	4c 89 f9             	mov    %r15,%rcx
   1834e:	e8 dd 4a 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   18353:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18357:	0f 85 3f 02 00 00    	jne    1859c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   1835d:	8b 7c 24 08          	mov    0x8(%rsp),%edi
   18361:	89 e8                	mov    %ebp,%eax
   18363:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18368:	89 f9                	mov    %edi,%ecx
   1836a:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18370:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18375:	29 c2                	sub    %eax,%edx
   18377:	be 00 00 00 80       	mov    $0x80000000,%esi
   1837c:	09 f0                	or     %esi,%eax
   1837e:	85 ed                	test   %ebp,%ebp
   18380:	48 0f 49 d0          	cmovns %rax,%rdx
   18384:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18389:	29 c8                	sub    %ecx,%eax
   1838b:	09 f1                	or     %esi,%ecx
   1838d:	85 ff                	test   %edi,%edi
   1838f:	48 0f 49 c1          	cmovns %rcx,%rax
   18393:	41 b7 01             	mov    $0x1,%r15b
   18396:	39 c2                	cmp    %eax,%edx
   18398:	0f 87 04 02 00 00    	ja     185a2 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   1839e:	89 7c 24 50          	mov    %edi,0x50(%rsp)
   183a2:	48 89 6c 24 28       	mov    %rbp,0x28(%rsp)
   183a7:	48 89 e7             	mov    %rsp,%rdi
   183aa:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   183af:	4c 89 e9             	mov    %r13,%rcx
   183b2:	4d 89 f0             	mov    %r14,%r8
   183b5:	e8 16 3b 00 00       	call   1bed0 <hyperinterval::ieee::Format::div>
   183ba:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   183be:	0f 85 91 fe ff ff    	jne    18255 <hyperinterval::float::F32Enclosure::corner_image+0x55>
   183c4:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   183c8:	44 8b 6c 24 10       	mov    0x10(%rsp),%r13d
   183cd:	48 89 e7             	mov    %rsp,%rdi
   183d0:	be 00 00 00 80       	mov    $0x80000000,%esi
   183d5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   183da:	e8 51 4a 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   183df:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   183e3:	0f 85 b3 01 00 00    	jne    1859c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   183e9:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   183ee:	48 89 e7             	mov    %rsp,%rdi
   183f1:	be 00 00 00 80       	mov    $0x80000000,%esi
   183f6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   183fb:	4c 89 e9             	mov    %r13,%rcx
   183fe:	e8 2d 4a 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   18403:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18407:	0f 85 8f 01 00 00    	jne    1859c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   1840d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18411:	89 e8                	mov    %ebp,%eax
   18413:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18418:	89 ca                	mov    %ecx,%edx
   1841a:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18420:	be 00 00 00 80       	mov    $0x80000000,%esi
   18425:	29 c6                	sub    %eax,%esi
   18427:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1842c:	09 f8                	or     %edi,%eax
   1842e:	85 ed                	test   %ebp,%ebp
   18430:	48 0f 49 f0          	cmovns %rax,%rsi
   18434:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18439:	29 d0                	sub    %edx,%eax
   1843b:	09 fa                	or     %edi,%edx
   1843d:	85 c9                	test   %ecx,%ecx
   1843f:	48 0f 49 c2          	cmovns %rdx,%rax
   18443:	39 c6                	cmp    %eax,%esi
   18445:	0f 87 57 01 00 00    	ja     185a2 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   1844b:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   18450:	8b 74 24 50          	mov    0x50(%rsp),%esi
   18454:	89 ea                	mov    %ebp,%edx
   18456:	e8 b5 51 00 00       	call   1d610 <hyperinterval::bounds::Bounds<T>::hull>
   1845b:	89 c5                	mov    %eax,%ebp
   1845d:	41 89 d5             	mov    %edx,%r13d
   18460:	48 89 e7             	mov    %rsp,%rdi
   18463:	be 00 00 00 80       	mov    $0x80000000,%esi
   18468:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1846d:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   18472:	4d 89 e0             	mov    %r12,%r8
   18475:	e8 56 3a 00 00       	call   1bed0 <hyperinterval::ieee::Format::div>
   1847a:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1847e:	0f 85 d1 fd ff ff    	jne    18255 <hyperinterval::float::F32Enclosure::corner_image+0x55>
   18484:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18488:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   1848d:	48 89 e7             	mov    %rsp,%rdi
   18490:	be 00 00 00 80       	mov    $0x80000000,%esi
   18495:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1849a:	e8 91 49 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1849f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   184a3:	0f 85 f3 00 00 00    	jne    1859c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   184a9:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   184ae:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   184b3:	48 89 e7             	mov    %rsp,%rdi
   184b6:	be 00 00 00 80       	mov    $0x80000000,%esi
   184bb:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   184c0:	4c 89 e1             	mov    %r12,%rcx
   184c3:	e8 68 49 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   184c8:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   184cc:	0f 85 ca 00 00 00    	jne    1859c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   184d2:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   184d6:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   184db:	89 d0                	mov    %edx,%eax
   184dd:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   184e2:	41 89 c8             	mov    %ecx,%r8d
   184e5:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   184ec:	be 00 00 00 80       	mov    $0x80000000,%esi
   184f1:	29 c6                	sub    %eax,%esi
   184f3:	bf 00 00 00 80       	mov    $0x80000000,%edi
   184f8:	09 f8                	or     %edi,%eax
   184fa:	85 d2                	test   %edx,%edx
   184fc:	48 0f 49 f0          	cmovns %rax,%rsi
   18500:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18505:	44 29 c0             	sub    %r8d,%eax
   18508:	41 09 f8             	or     %edi,%r8d
   1850b:	85 c9                	test   %ecx,%ecx
   1850d:	49 0f 49 c0          	cmovns %r8,%rax
   18511:	39 c6                	cmp    %eax,%esi
   18513:	0f 87 89 00 00 00    	ja     185a2 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   18519:	89 ef                	mov    %ebp,%edi
   1851b:	44 89 ee             	mov    %r13d,%esi
   1851e:	e8 ed 50 00 00       	call   1d610 <hyperinterval::bounds::Bounds<T>::hull>
   18523:	41 89 c5             	mov    %eax,%r13d
   18526:	41 89 d4             	mov    %edx,%r12d
   18529:	48 89 e7             	mov    %rsp,%rdi
   1852c:	be 00 00 00 80       	mov    $0x80000000,%esi
   18531:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18536:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1853b:	4d 89 f0             	mov    %r14,%r8
   1853e:	e8 8d 39 00 00       	call   1bed0 <hyperinterval::ieee::Format::div>
   18543:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18547:	0f 85 08 fd ff ff    	jne    18255 <hyperinterval::float::F32Enclosure::corner_image+0x55>
   1854d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18551:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   18556:	e9 62 02 00 00       	jmp    187bd <hyperinterval::float::F32Enclosure::corner_image+0x5bd>
   1855b:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   1855f:	44 8b 7c 24 40       	mov    0x40(%rsp),%r15d
   18564:	48 89 e7             	mov    %rsp,%rdi
   18567:	be 00 00 00 80       	mov    $0x80000000,%esi
   1856c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18571:	e8 ba 48 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   18576:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1857a:	74 20                	je     1859c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   1857c:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   18581:	48 89 e7             	mov    %rsp,%rdi
   18584:	be 00 00 00 80       	mov    $0x80000000,%esi
   18589:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1858e:	4c 89 f9             	mov    %r15,%rcx
   18591:	e8 9a 48 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   18596:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1859a:	75 1f                	jne    185bb <hyperinterval::float::F32Enclosure::corner_image+0x3bb>
   1859c:	44 0f b6 7c 24 01    	movzbl 0x1(%rsp),%r15d
   185a2:	44 88 7b 04          	mov    %r15b,0x4(%rbx)
   185a6:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   185ac:	48 83 c4 58          	add    $0x58,%rsp
   185b0:	5b                   	pop    %rbx
   185b1:	41 5c                	pop    %r12
   185b3:	41 5d                	pop    %r13
   185b5:	41 5e                	pop    %r14
   185b7:	41 5f                	pop    %r15
   185b9:	5d                   	pop    %rbp
   185ba:	c3                   	ret
   185bb:	8b 7c 24 08          	mov    0x8(%rsp),%edi
   185bf:	89 e8                	mov    %ebp,%eax
   185c1:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   185c6:	89 f9                	mov    %edi,%ecx
   185c8:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   185ce:	ba 00 00 00 80       	mov    $0x80000000,%edx
   185d3:	29 c2                	sub    %eax,%edx
   185d5:	be 00 00 00 80       	mov    $0x80000000,%esi
   185da:	09 f0                	or     %esi,%eax
   185dc:	85 ed                	test   %ebp,%ebp
   185de:	48 0f 49 d0          	cmovns %rax,%rdx
   185e2:	b8 00 00 00 80       	mov    $0x80000000,%eax
   185e7:	29 c8                	sub    %ecx,%eax
   185e9:	09 f1                	or     %esi,%ecx
   185eb:	85 ff                	test   %edi,%edi
   185ed:	48 0f 49 c1          	cmovns %rcx,%rax
   185f1:	41 b7 01             	mov    $0x1,%r15b
   185f4:	39 c2                	cmp    %eax,%edx
   185f6:	77 aa                	ja     185a2 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   185f8:	89 7c 24 28          	mov    %edi,0x28(%rsp)
   185fc:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   18601:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18606:	4c 89 e9             	mov    %r13,%rcx
   18609:	4d 89 f0             	mov    %r14,%r8
   1860c:	e8 ff 3c 00 00       	call   1c310 <hyperinterval::ieee::Format::mul>
   18611:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   18616:	0f 85 eb fc ff ff    	jne    18307 <hyperinterval::float::F32Enclosure::corner_image+0x107>
   1861c:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   18620:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
   18625:	48 89 e7             	mov    %rsp,%rdi
   18628:	be 00 00 00 80       	mov    $0x80000000,%esi
   1862d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18632:	e8 f9 47 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   18637:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1863b:	0f 85 5b ff ff ff    	jne    1859c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   18641:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   18646:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1864b:	48 89 e7             	mov    %rsp,%rdi
   1864e:	be 00 00 00 80       	mov    $0x80000000,%esi
   18653:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18658:	4c 89 e9             	mov    %r13,%rcx
   1865b:	e8 d0 47 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   18660:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18664:	0f 85 32 ff ff ff    	jne    1859c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   1866a:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1866e:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
   18673:	89 d0                	mov    %edx,%eax
   18675:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   1867a:	41 89 c8             	mov    %ecx,%r8d
   1867d:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18684:	be 00 00 00 80       	mov    $0x80000000,%esi
   18689:	29 c6                	sub    %eax,%esi
   1868b:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18690:	09 f8                	or     %edi,%eax
   18692:	85 d2                	test   %edx,%edx
   18694:	48 0f 49 f0          	cmovns %rax,%rsi
   18698:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1869d:	44 29 c0             	sub    %r8d,%eax
   186a0:	41 09 f8             	or     %edi,%r8d
   186a3:	85 c9                	test   %ecx,%ecx
   186a5:	49 0f 49 c0          	cmovns %r8,%rax
   186a9:	39 c6                	cmp    %eax,%esi
   186ab:	0f 87 f1 fe ff ff    	ja     185a2 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   186b1:	89 ef                	mov    %ebp,%edi
   186b3:	8b 74 24 28          	mov    0x28(%rsp),%esi
   186b7:	e8 54 4f 00 00       	call   1d610 <hyperinterval::bounds::Bounds<T>::hull>
   186bc:	89 c5                	mov    %eax,%ebp
   186be:	41 89 d5             	mov    %edx,%r13d
   186c1:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   186c6:	be 00 00 00 80       	mov    $0x80000000,%esi
   186cb:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   186d0:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   186d5:	4d 89 e0             	mov    %r12,%r8
   186d8:	e8 33 3c 00 00       	call   1c310 <hyperinterval::ieee::Format::mul>
   186dd:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   186e2:	0f 85 1f fc ff ff    	jne    18307 <hyperinterval::float::F32Enclosure::corner_image+0x107>
   186e8:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   186ec:	44 8b 64 24 40       	mov    0x40(%rsp),%r12d
   186f1:	48 89 e7             	mov    %rsp,%rdi
   186f4:	be 00 00 00 80       	mov    $0x80000000,%esi
   186f9:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   186fe:	e8 2d 47 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   18703:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18707:	0f 85 8f fe ff ff    	jne    1859c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   1870d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   18712:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   18717:	48 89 e7             	mov    %rsp,%rdi
   1871a:	be 00 00 00 80       	mov    $0x80000000,%esi
   1871f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18724:	4c 89 e1             	mov    %r12,%rcx
   18727:	e8 04 47 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1872c:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18730:	0f 85 66 fe ff ff    	jne    1859c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   18736:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1873a:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   1873f:	89 d0                	mov    %edx,%eax
   18741:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18746:	41 89 c8             	mov    %ecx,%r8d
   18749:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18750:	be 00 00 00 80       	mov    $0x80000000,%esi
   18755:	29 c6                	sub    %eax,%esi
   18757:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1875c:	09 f8                	or     %edi,%eax
   1875e:	85 d2                	test   %edx,%edx
   18760:	48 0f 49 f0          	cmovns %rax,%rsi
   18764:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18769:	44 29 c0             	sub    %r8d,%eax
   1876c:	41 09 f8             	or     %edi,%r8d
   1876f:	85 c9                	test   %ecx,%ecx
   18771:	49 0f 49 c0          	cmovns %r8,%rax
   18775:	39 c6                	cmp    %eax,%esi
   18777:	0f 87 25 fe ff ff    	ja     185a2 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   1877d:	89 ef                	mov    %ebp,%edi
   1877f:	44 89 ee             	mov    %r13d,%esi
   18782:	e8 89 4e 00 00       	call   1d610 <hyperinterval::bounds::Bounds<T>::hull>
   18787:	41 89 c5             	mov    %eax,%r13d
   1878a:	41 89 d4             	mov    %edx,%r12d
   1878d:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   18792:	be 00 00 00 80       	mov    $0x80000000,%esi
   18797:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1879c:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   187a1:	4d 89 f0             	mov    %r14,%r8
   187a4:	e8 67 3b 00 00       	call   1c310 <hyperinterval::ieee::Format::mul>
   187a9:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   187ae:	0f 85 53 fb ff ff    	jne    18307 <hyperinterval::float::F32Enclosure::corner_image+0x107>
   187b4:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   187b8:	44 8b 74 24 40       	mov    0x40(%rsp),%r14d
   187bd:	48 89 e7             	mov    %rsp,%rdi
   187c0:	be 00 00 00 80       	mov    $0x80000000,%esi
   187c5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   187ca:	e8 61 46 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   187cf:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   187d3:	0f 85 c3 fd ff ff    	jne    1859c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   187d9:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   187de:	48 89 e7             	mov    %rsp,%rdi
   187e1:	be 00 00 00 80       	mov    $0x80000000,%esi
   187e6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   187eb:	4c 89 f1             	mov    %r14,%rcx
   187ee:	e8 3d 46 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   187f3:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   187f7:	0f 85 9f fd ff ff    	jne    1859c <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   187fd:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18801:	89 e8                	mov    %ebp,%eax
   18803:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18808:	89 ca                	mov    %ecx,%edx
   1880a:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18810:	be 00 00 00 80       	mov    $0x80000000,%esi
   18815:	29 c6                	sub    %eax,%esi
   18817:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1881c:	09 f8                	or     %edi,%eax
   1881e:	85 ed                	test   %ebp,%ebp
   18820:	48 0f 49 f0          	cmovns %rax,%rsi
   18824:	89 d0                	mov    %edx,%eax
   18826:	09 f8                	or     %edi,%eax
   18828:	29 d7                	sub    %edx,%edi
   1882a:	85 c9                	test   %ecx,%ecx
   1882c:	48 0f 49 f8          	cmovns %rax,%rdi
   18830:	39 fe                	cmp    %edi,%esi
   18832:	0f 87 6a fd ff ff    	ja     185a2 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   18838:	44 89 ef             	mov    %r13d,%edi
   1883b:	44 89 e6             	mov    %r12d,%esi
   1883e:	89 ea                	mov    %ebp,%edx
   18840:	e8 cb 4d 00 00       	call   1d610 <hyperinterval::bounds::Bounds<T>::hull>
   18845:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   1884b:	89 43 04             	mov    %eax,0x4(%rbx)
   1884e:	89 53 08             	mov    %edx,0x8(%rbx)
   18851:	e9 56 fd ff ff       	jmp    185ac <hyperinterval::float::F32Enclosure::corner_image+0x3ac>
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

hyperinterval::float::F32Enclosure::intersection:
   18860:	48 89 f8             	mov    %rdi,%rax
   18863:	45 31 c9             	xor    %r9d,%r9d
   18866:	f6 06 01             	testb  $0x1,(%rsi)
   18869:	0f 84 ed 00 00 00    	je     1895c <hyperinterval::float::F32Enclosure::intersection+0xfc>
   1886f:	f6 02 01             	testb  $0x1,(%rdx)
   18872:	0f 84 d9 00 00 00    	je     18951 <hyperinterval::float::F32Enclosure::intersection+0xf1>
   18878:	53                   	push   %rbx
   18879:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   1887d:	8b 4e 04             	mov    0x4(%rsi),%ecx
   18880:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18885:	41 89 c9             	mov    %ecx,%r9d
   18888:	41 09 f9             	or     %edi,%r9d
   1888b:	41 89 ca             	mov    %ecx,%r10d
   1888e:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18895:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1889b:	45 29 d3             	sub    %r10d,%r11d
   1889e:	85 c9                	test   %ecx,%ecx
   188a0:	4d 0f 49 d9          	cmovns %r9,%r11
   188a4:	45 89 c1             	mov    %r8d,%r9d
   188a7:	41 09 f9             	or     %edi,%r9d
   188aa:	45 89 c2             	mov    %r8d,%r10d
   188ad:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   188b4:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   188b9:	44 29 d3             	sub    %r10d,%ebx
   188bc:	45 85 c0             	test   %r8d,%r8d
   188bf:	49 0f 49 d9          	cmovns %r9,%rbx
   188c3:	8b 52 08             	mov    0x8(%rdx),%edx
   188c6:	41 39 db             	cmp    %ebx,%r11d
   188c9:	41 0f 42 c8          	cmovb  %r8d,%ecx
   188cd:	44 8b 46 08          	mov    0x8(%rsi),%r8d
   188d1:	44 89 c6             	mov    %r8d,%esi
   188d4:	09 fe                	or     %edi,%esi
   188d6:	45 89 c1             	mov    %r8d,%r9d
   188d9:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   188e0:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   188e6:	45 29 ca             	sub    %r9d,%r10d
   188e9:	45 85 c0             	test   %r8d,%r8d
   188ec:	4c 0f 49 d6          	cmovns %rsi,%r10
   188f0:	89 d6                	mov    %edx,%esi
   188f2:	09 fe                	or     %edi,%esi
   188f4:	41 89 d1             	mov    %edx,%r9d
   188f7:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   188fe:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   18904:	45 29 cb             	sub    %r9d,%r11d
   18907:	85 d2                	test   %edx,%edx
   18909:	4c 0f 49 de          	cmovns %rsi,%r11
   1890d:	45 39 da             	cmp    %r11d,%r10d
   18910:	44 0f 47 c2          	cmova  %edx,%r8d
   18914:	89 ca                	mov    %ecx,%edx
   18916:	09 fa                	or     %edi,%edx
   18918:	89 ce                	mov    %ecx,%esi
   1891a:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18920:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18926:	41 29 f2             	sub    %esi,%r10d
   18929:	85 c9                	test   %ecx,%ecx
   1892b:	4c 0f 49 d2          	cmovns %rdx,%r10
   1892f:	44 89 c2             	mov    %r8d,%edx
   18932:	09 fa                	or     %edi,%edx
   18934:	44 89 c6             	mov    %r8d,%esi
   18937:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1893d:	29 f7                	sub    %esi,%edi
   1893f:	45 85 c0             	test   %r8d,%r8d
   18942:	48 0f 49 fa          	cmovns %rdx,%rdi
   18946:	45 31 c9             	xor    %r9d,%r9d
   18949:	41 39 fa             	cmp    %edi,%r10d
   1894c:	41 0f 96 c1          	setbe  %r9b
   18950:	5b                   	pop    %rbx
   18951:	44 89 08             	mov    %r9d,(%rax)
   18954:	89 48 04             	mov    %ecx,0x4(%rax)
   18957:	44 89 40 08          	mov    %r8d,0x8(%rax)
   1895b:	c3                   	ret
   1895c:	44 89 08             	mov    %r9d,(%rax)
   1895f:	89 48 04             	mov    %ecx,0x4(%rax)
   18962:	44 89 40 08          	mov    %r8d,0x8(%rax)
   18966:	c3                   	ret
   18967:	cc                   	int3
   18968:	cc                   	int3
   18969:	cc                   	int3
   1896a:	cc                   	int3
   1896b:	cc                   	int3
   1896c:	cc                   	int3
   1896d:	cc                   	int3
   1896e:	cc                   	int3
   1896f:	cc                   	int3

hyperinterval::float::F32Enclosure::contains_point:
   18970:	41 56                	push   %r14
   18972:	53                   	push   %rbx
   18973:	48 83 ec 18          	sub    $0x18,%rsp
   18977:	48 89 fb             	mov    %rdi,%rbx
   1897a:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   18980:	66 0f 7e c1          	movd   %xmm0,%ecx
   18984:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18989:	be 00 00 00 80       	mov    $0x80000000,%esi
   1898e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18993:	e8 98 44 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   18998:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1899d:	3c 01                	cmp    $0x1,%al
   1899f:	75 0d                	jne    189ae <hyperinterval::float::F32Enclosure::contains_point+0x3e>
   189a1:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   189a6:	48 83 c4 18          	add    $0x18,%rsp
   189aa:	5b                   	pop    %rbx
   189ab:	41 5e                	pop    %r14
   189ad:	c3                   	ret
   189ae:	f6 03 01             	testb  $0x1,(%rbx)
   189b1:	74 44                	je     189f7 <hyperinterval::float::F32Enclosure::contains_point+0x87>
   189b3:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   189b8:	8b 73 04             	mov    0x4(%rbx),%esi
   189bb:	89 d1                	mov    %edx,%ecx
   189bd:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   189c3:	89 f7                	mov    %esi,%edi
   189c5:	44 09 f7             	or     %r14d,%edi
   189c8:	41 89 f0             	mov    %esi,%r8d
   189cb:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   189d2:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   189d8:	45 29 c1             	sub    %r8d,%r9d
   189db:	85 f6                	test   %esi,%esi
   189dd:	4c 0f 49 cf          	cmovns %rdi,%r9
   189e1:	be 00 00 00 80       	mov    $0x80000000,%esi
   189e6:	48 29 ce             	sub    %rcx,%rsi
   189e9:	4c 09 f1             	or     %r14,%rcx
   189ec:	85 d2                	test   %edx,%edx
   189ee:	48 0f 48 ce          	cmovs  %rsi,%rcx
   189f2:	41 39 c9             	cmp    %ecx,%r9d
   189f5:	76 0a                	jbe    18a01 <hyperinterval::float::F32Enclosure::contains_point+0x91>
   189f7:	31 d2                	xor    %edx,%edx
   189f9:	48 83 c4 18          	add    $0x18,%rsp
   189fd:	5b                   	pop    %rbx
   189fe:	41 5e                	pop    %r14
   18a00:	c3                   	ret
   18a01:	8b 53 08             	mov    0x8(%rbx),%edx
   18a04:	89 d6                	mov    %edx,%esi
   18a06:	44 09 f6             	or     %r14d,%esi
   18a09:	89 d7                	mov    %edx,%edi
   18a0b:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18a11:	41 29 fe             	sub    %edi,%r14d
   18a14:	85 d2                	test   %edx,%edx
   18a16:	4c 0f 49 f6          	cmovns %rsi,%r14
   18a1a:	44 39 f1             	cmp    %r14d,%ecx
   18a1d:	0f 96 c2             	setbe  %dl
   18a20:	48 83 c4 18          	add    $0x18,%rsp
   18a24:	5b                   	pop    %rbx
   18a25:	41 5e                	pop    %r14
   18a27:	c3                   	ret
   18a28:	cc                   	int3
   18a29:	cc                   	int3
   18a2a:	cc                   	int3
   18a2b:	cc                   	int3
   18a2c:	cc                   	int3
   18a2d:	cc                   	int3
   18a2e:	cc                   	int3
   18a2f:	cc                   	int3

hyperinterval::float::F32Enclosure::interior_subset_of:
   18a30:	b0 01                	mov    $0x1,%al
   18a32:	f6 07 01             	testb  $0x1,(%rdi)
   18a35:	0f 84 93 00 00 00    	je     18ace <hyperinterval::float::F32Enclosure::interior_subset_of+0x9e>
   18a3b:	f6 06 01             	testb  $0x1,(%rsi)
   18a3e:	0f 84 88 00 00 00    	je     18acc <hyperinterval::float::F32Enclosure::interior_subset_of+0x9c>
   18a44:	8b 4f 04             	mov    0x4(%rdi),%ecx
   18a47:	8b 56 04             	mov    0x4(%rsi),%edx
   18a4a:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18a4f:	41 89 d0             	mov    %edx,%r8d
   18a52:	41 09 c0             	or     %eax,%r8d
   18a55:	41 89 d1             	mov    %edx,%r9d
   18a58:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18a5f:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18a65:	45 29 ca             	sub    %r9d,%r10d
   18a68:	85 d2                	test   %edx,%edx
   18a6a:	4d 0f 49 d0          	cmovns %r8,%r10
   18a6e:	89 ca                	mov    %ecx,%edx
   18a70:	09 c2                	or     %eax,%edx
   18a72:	41 89 c8             	mov    %ecx,%r8d
   18a75:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18a7c:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   18a82:	45 29 c1             	sub    %r8d,%r9d
   18a85:	85 c9                	test   %ecx,%ecx
   18a87:	4c 0f 49 ca          	cmovns %rdx,%r9
   18a8b:	45 39 ca             	cmp    %r9d,%r10d
   18a8e:	73 3c                	jae    18acc <hyperinterval::float::F32Enclosure::interior_subset_of+0x9c>
   18a90:	8b 4f 08             	mov    0x8(%rdi),%ecx
   18a93:	8b 56 08             	mov    0x8(%rsi),%edx
   18a96:	89 ce                	mov    %ecx,%esi
   18a98:	09 c6                	or     %eax,%esi
   18a9a:	89 cf                	mov    %ecx,%edi
   18a9c:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18aa2:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18aa8:	41 29 f8             	sub    %edi,%r8d
   18aab:	85 c9                	test   %ecx,%ecx
   18aad:	4c 0f 49 c6          	cmovns %rsi,%r8
   18ab1:	89 d1                	mov    %edx,%ecx
   18ab3:	09 c1                	or     %eax,%ecx
   18ab5:	89 d6                	mov    %edx,%esi
   18ab7:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18abd:	29 f0                	sub    %esi,%eax
   18abf:	85 d2                	test   %edx,%edx
   18ac1:	48 0f 49 c1          	cmovns %rcx,%rax
   18ac5:	41 39 c0             	cmp    %eax,%r8d
   18ac8:	0f 92 c0             	setb   %al
   18acb:	c3                   	ret
   18acc:	31 c0                	xor    %eax,%eax
   18ace:	c3                   	ret
   18acf:	cc                   	int3

hyperinterval::float::F32Enclosure::abs:
   18ad0:	48 89 f8             	mov    %rdi,%rax
   18ad3:	f6 06 01             	testb  $0x1,(%rsi)
   18ad6:	74 24                	je     18afc <hyperinterval::float::F32Enclosure::abs+0x2c>
   18ad8:	8b 4e 04             	mov    0x4(%rsi),%ecx
   18adb:	85 c9                	test   %ecx,%ecx
   18add:	0f 99 c2             	setns  %dl
   18ae0:	f7 c1 ff ff ff 7f    	test   $0x7fffffff,%ecx
   18ae6:	40 0f 94 c7          	sete   %dil
   18aea:	40 08 d7             	or     %dl,%dil
   18aed:	74 14                	je     18b03 <hyperinterval::float::F32Enclosure::abs+0x33>
   18aef:	8b 4e 08             	mov    0x8(%rsi),%ecx
   18af2:	89 48 08             	mov    %ecx,0x8(%rax)
   18af5:	48 8b 0e             	mov    (%rsi),%rcx
   18af8:	48 89 08             	mov    %rcx,(%rax)
   18afb:	c3                   	ret
   18afc:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   18b02:	c3                   	ret
   18b03:	8b 56 08             	mov    0x8(%rsi),%edx
   18b06:	85 d2                	test   %edx,%edx
   18b08:	40 0f 98 c7          	sets   %dil
   18b0c:	48 89 d6             	mov    %rdx,%rsi
   18b0f:	48 81 e6 ff ff ff 7f 	and    $0x7fffffff,%rsi
   18b16:	41 0f 95 c0          	setne  %r8b
   18b1a:	44 84 c7             	test   %r8b,%dil
   18b1d:	74 19                	je     18b38 <hyperinterval::float::F32Enclosure::abs+0x68>
   18b1f:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18b25:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18b2b:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   18b31:	89 50 04             	mov    %edx,0x4(%rax)
   18b34:	89 48 08             	mov    %ecx,0x8(%rax)
   18b37:	c3                   	ret
   18b38:	89 cf                	mov    %ecx,%edi
   18b3a:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18b40:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18b46:	41 89 d1             	mov    %edx,%r9d
   18b49:	45 09 c1             	or     %r8d,%r9d
   18b4c:	41 29 f0             	sub    %esi,%r8d
   18b4f:	85 d2                	test   %edx,%edx
   18b51:	4d 0f 49 c1          	cmovns %r9,%r8
   18b55:	41 39 c8             	cmp    %ecx,%r8d
   18b58:	0f 43 fa             	cmovae %edx,%edi
   18b5b:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   18b62:	89 78 08             	mov    %edi,0x8(%rax)
   18b65:	c3                   	ret
   18b66:	cc                   	int3
   18b67:	cc                   	int3
   18b68:	cc                   	int3
   18b69:	cc                   	int3
   18b6a:	cc                   	int3
   18b6b:	cc                   	int3
   18b6c:	cc                   	int3
   18b6d:	cc                   	int3
   18b6e:	cc                   	int3
   18b6f:	cc                   	int3

hyperinterval::float::F32Enclosure::add:
   18b70:	48 89 f8             	mov    %rdi,%rax
   18b73:	f6 06 01             	testb  $0x1,(%rsi)
   18b76:	0f 84 d6 00 00 00    	je     18c52 <hyperinterval::float::F32Enclosure::add+0xe2>
   18b7c:	f6 02 01             	testb  $0x1,(%rdx)
   18b7f:	0f 84 cd 00 00 00    	je     18c52 <hyperinterval::float::F32Enclosure::add+0xe2>
   18b85:	41 57                	push   %r15
   18b87:	41 56                	push   %r14
   18b89:	41 55                	push   %r13
   18b8b:	41 54                	push   %r12
   18b8d:	53                   	push   %rbx
   18b8e:	48 83 ec 20          	sub    $0x20,%rsp
   18b92:	49 89 c4             	mov    %rax,%r12
   18b95:	8b 5e 08             	mov    0x8(%rsi),%ebx
   18b98:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   18b9e:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   18ba2:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   18ba6:	8b 4e 04             	mov    0x4(%rsi),%ecx
   18ba9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18bae:	be 00 00 00 80       	mov    $0x80000000,%esi
   18bb3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18bb8:	e8 63 30 00 00       	call   1bc20 <hyperinterval::ieee::Format::add>
   18bbd:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18bc2:	74 6b                	je     18c2f <hyperinterval::float::F32Enclosure::add+0xbf>
   18bc4:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   18bc9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18bce:	be 00 00 00 80       	mov    $0x80000000,%esi
   18bd3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18bd8:	48 89 d9             	mov    %rbx,%rcx
   18bdb:	4d 89 f0             	mov    %r14,%r8
   18bde:	e8 3d 30 00 00       	call   1bc20 <hyperinterval::ieee::Format::add>
   18be3:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18be8:	74 45                	je     18c2f <hyperinterval::float::F32Enclosure::add+0xbf>
   18bea:	8b 5c 24 18          	mov    0x18(%rsp),%ebx
   18bee:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18bf3:	be 00 00 00 80       	mov    $0x80000000,%esi
   18bf8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18bfd:	4c 89 f9             	mov    %r15,%rcx
   18c00:	e8 2b 42 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   18c05:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18c0a:	74 23                	je     18c2f <hyperinterval::float::F32Enclosure::add+0xbf>
   18c0c:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   18c11:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18c16:	be 00 00 00 80       	mov    $0x80000000,%esi
   18c1b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18c20:	48 89 d9             	mov    %rbx,%rcx
   18c23:	e8 08 42 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   18c28:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18c2d:	75 2a                	jne    18c59 <hyperinterval::float::F32Enclosure::add+0xe9>
   18c2f:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   18c34:	4c 89 e0             	mov    %r12,%rax
   18c37:	41 88 4c 24 04       	mov    %cl,0x4(%r12)
   18c3c:	41 c7 04 24 02 00 00 	movl   $0x2,(%r12)
   18c43:	00 
   18c44:	48 83 c4 20          	add    $0x20,%rsp
   18c48:	5b                   	pop    %rbx
   18c49:	41 5c                	pop    %r12
   18c4b:	41 5d                	pop    %r13
   18c4d:	41 5e                	pop    %r14
   18c4f:	41 5f                	pop    %r15
   18c51:	c3                   	ret
   18c52:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   18c58:	c3                   	ret
   18c59:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   18c5d:	44 89 f0             	mov    %r14d,%eax
   18c60:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18c65:	89 ca                	mov    %ecx,%edx
   18c67:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18c6d:	be 00 00 00 80       	mov    $0x80000000,%esi
   18c72:	29 c6                	sub    %eax,%esi
   18c74:	44 09 e8             	or     %r13d,%eax
   18c77:	45 85 f6             	test   %r14d,%r14d
   18c7a:	48 0f 49 f0          	cmovns %rax,%rsi
   18c7e:	89 d0                	mov    %edx,%eax
   18c80:	44 09 e8             	or     %r13d,%eax
   18c83:	41 29 d5             	sub    %edx,%r13d
   18c86:	85 c9                	test   %ecx,%ecx
   18c88:	4c 0f 49 e8          	cmovns %rax,%r13
   18c8c:	44 39 ee             	cmp    %r13d,%esi
   18c8f:	4c 89 e0             	mov    %r12,%rax
   18c92:	76 0c                	jbe    18ca0 <hyperinterval::float::F32Enclosure::add+0x130>
   18c94:	c6 40 04 01          	movb   $0x1,0x4(%rax)
   18c98:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   18c9e:	eb a4                	jmp    18c44 <hyperinterval::float::F32Enclosure::add+0xd4>
   18ca0:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   18ca6:	44 89 70 04          	mov    %r14d,0x4(%rax)
   18caa:	89 48 08             	mov    %ecx,0x8(%rax)
   18cad:	eb 95                	jmp    18c44 <hyperinterval::float::F32Enclosure::add+0xd4>
   18caf:	cc                   	int3

hyperinterval::float::F32Enclosure::div:
   18cb0:	53                   	push   %rbx
   18cb1:	48 89 fb             	mov    %rdi,%rbx
   18cb4:	83 3a 01             	cmpl   $0x1,(%rdx)
   18cb7:	75 1a                	jne    18cd3 <hyperinterval::float::F32Enclosure::div+0x23>
   18cb9:	83 7a 04 00          	cmpl   $0x0,0x4(%rdx)
   18cbd:	7f 14                	jg     18cd3 <hyperinterval::float::F32Enclosure::div+0x23>
   18cbf:	8b 42 08             	mov    0x8(%rdx),%eax
   18cc2:	85 c0                	test   %eax,%eax
   18cc4:	0f 99 c1             	setns  %cl
   18cc7:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   18ccc:	0f 94 c0             	sete   %al
   18ccf:	08 c8                	or     %cl,%al
   18cd1:	75 12                	jne    18ce5 <hyperinterval::float::F32Enclosure::div+0x35>
   18cd3:	48 89 df             	mov    %rbx,%rdi
   18cd6:	b9 01 00 00 00       	mov    $0x1,%ecx
   18cdb:	e8 20 f5 ff ff       	call   18200 <hyperinterval::float::F32Enclosure::corner_image>
   18ce0:	48 89 d8             	mov    %rbx,%rax
   18ce3:	5b                   	pop    %rbx
   18ce4:	c3                   	ret
   18ce5:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
   18ce9:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18cef:	48 89 d8             	mov    %rbx,%rax
   18cf2:	5b                   	pop    %rbx
   18cf3:	c3                   	ret
   18cf4:	cc                   	int3
   18cf5:	cc                   	int3
   18cf6:	cc                   	int3
   18cf7:	cc                   	int3
   18cf8:	cc                   	int3
   18cf9:	cc                   	int3
   18cfa:	cc                   	int3
   18cfb:	cc                   	int3
   18cfc:	cc                   	int3
   18cfd:	cc                   	int3
   18cfe:	cc                   	int3
   18cff:	cc                   	int3

hyperinterval::float::F32Enclosure::new:
   18d00:	41 57                	push   %r15
   18d02:	41 56                	push   %r14
   18d04:	53                   	push   %rbx
   18d05:	48 83 ec 20          	sub    $0x20,%rsp
   18d09:	f3 0f 11 4c 24 1c    	movss  %xmm1,0x1c(%rsp)
   18d0f:	48 89 fb             	mov    %rdi,%rbx
   18d12:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   18d18:	66 0f 7e c1          	movd   %xmm0,%ecx
   18d1c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18d21:	be 00 00 00 80       	mov    $0x80000000,%esi
   18d26:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18d2b:	e8 00 41 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   18d30:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18d35:	74 2a                	je     18d61 <hyperinterval::float::F32Enclosure::new+0x61>
   18d37:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   18d3c:	66 0f 6e 44 24 1c    	movd   0x1c(%rsp),%xmm0
   18d42:	66 0f 7e c1          	movd   %xmm0,%ecx
   18d46:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18d4b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18d50:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18d55:	e8 d6 40 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   18d5a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18d5f:	75 1b                	jne    18d7c <hyperinterval::float::F32Enclosure::new+0x7c>
   18d61:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   18d66:	88 43 04             	mov    %al,0x4(%rbx)
   18d69:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18d6f:	48 89 d8             	mov    %rbx,%rax
   18d72:	48 83 c4 20          	add    $0x20,%rsp
   18d76:	5b                   	pop    %rbx
   18d77:	41 5e                	pop    %r14
   18d79:	41 5f                	pop    %r15
   18d7b:	c3                   	ret
   18d7c:	8b 44 24 10          	mov    0x10(%rsp),%eax
   18d80:	44 89 f9             	mov    %r15d,%ecx
   18d83:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18d89:	89 c2                	mov    %eax,%edx
   18d8b:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18d91:	be 00 00 00 80       	mov    $0x80000000,%esi
   18d96:	29 ce                	sub    %ecx,%esi
   18d98:	44 09 f1             	or     %r14d,%ecx
   18d9b:	45 85 ff             	test   %r15d,%r15d
   18d9e:	48 0f 49 f1          	cmovns %rcx,%rsi
   18da2:	89 d1                	mov    %edx,%ecx
   18da4:	44 09 f1             	or     %r14d,%ecx
   18da7:	41 29 d6             	sub    %edx,%r14d
   18daa:	85 c0                	test   %eax,%eax
   18dac:	4c 0f 49 f1          	cmovns %rcx,%r14
   18db0:	44 39 f6             	cmp    %r14d,%esi
   18db3:	76 06                	jbe    18dbb <hyperinterval::float::F32Enclosure::new+0xbb>
   18db5:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   18db9:	eb ae                	jmp    18d69 <hyperinterval::float::F32Enclosure::new+0x69>
   18dbb:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   18dc1:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
   18dc5:	89 43 08             	mov    %eax,0x8(%rbx)
   18dc8:	eb a5                	jmp    18d6f <hyperinterval::float::F32Enclosure::new+0x6f>
   18dca:	cc                   	int3
   18dcb:	cc                   	int3
   18dcc:	cc                   	int3
   18dcd:	cc                   	int3
   18dce:	cc                   	int3
   18dcf:	cc                   	int3

hyperinterval::float::F32Enclosure::sub:
   18dd0:	53                   	push   %rbx
   18dd1:	48 83 ec 10          	sub    $0x10,%rsp
   18dd5:	48 89 fb             	mov    %rdi,%rbx
   18dd8:	f6 02 01             	testb  $0x1,(%rdx)
   18ddb:	74 29                	je     18e06 <hyperinterval::float::F32Enclosure::sub+0x36>
   18ddd:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   18de2:	66 0f ef c9          	pxor   %xmm1,%xmm1
   18de6:	66 0f 6f 15 82 cb fe 	movdqa -0x1347e(%rip),%xmm2        # 5970 <__abi_tag+0x5674>
   18ded:	ff 
   18dee:	66 0f ef d0          	pxor   %xmm0,%xmm2
   18df2:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   18df6:	66 0f df ca          	pandn  %xmm2,%xmm1
   18dfa:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   18dff:	b8 01 00 00 00       	mov    $0x1,%eax
   18e04:	eb 02                	jmp    18e08 <hyperinterval::float::F32Enclosure::sub+0x38>
   18e06:	31 c0                	xor    %eax,%eax
   18e08:	89 44 24 04          	mov    %eax,0x4(%rsp)
   18e0c:	66 0f d6 44 24 08    	movq   %xmm0,0x8(%rsp)
   18e12:	48 8d 54 24 04       	lea    0x4(%rsp),%rdx
   18e17:	48 89 df             	mov    %rbx,%rdi
   18e1a:	ff 15 c0 66 04 00    	call   *0x466c0(%rip)        # 5f4e0 <_DYNAMIC+0x2d0>
   18e20:	48 89 d8             	mov    %rbx,%rax
   18e23:	48 83 c4 10          	add    $0x10,%rsp
   18e27:	5b                   	pop    %rbx
   18e28:	c3                   	ret
   18e29:	cc                   	int3
   18e2a:	cc                   	int3
   18e2b:	cc                   	int3
   18e2c:	cc                   	int3
   18e2d:	cc                   	int3
   18e2e:	cc                   	int3
   18e2f:	cc                   	int3

hyperinterval::float::F32Enclosure::hull:
   18e30:	48 89 f8             	mov    %rdi,%rax
   18e33:	44 8b 0e             	mov    (%rsi),%r9d
   18e36:	44 8b 02             	mov    (%rdx),%r8d
   18e39:	8b 7a 04             	mov    0x4(%rdx),%edi
   18e3c:	8b 4a 08             	mov    0x8(%rdx),%ecx
   18e3f:	41 f6 c1 01          	test   $0x1,%r9b
   18e43:	0f 84 a1 00 00 00    	je     18eea <hyperinterval::float::F32Enclosure::hull+0xba>
   18e49:	8b 56 04             	mov    0x4(%rsi),%edx
   18e4c:	8b 76 08             	mov    0x8(%rsi),%esi
   18e4f:	41 f6 c0 01          	test   $0x1,%r8b
   18e53:	0f 84 9b 00 00 00    	je     18ef4 <hyperinterval::float::F32Enclosure::hull+0xc4>
   18e59:	53                   	push   %rbx
   18e5a:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18e60:	41 89 d1             	mov    %edx,%r9d
   18e63:	45 09 c1             	or     %r8d,%r9d
   18e66:	41 89 d2             	mov    %edx,%r10d
   18e69:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18e70:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   18e76:	45 29 d3             	sub    %r10d,%r11d
   18e79:	85 d2                	test   %edx,%edx
   18e7b:	4d 0f 49 d9          	cmovns %r9,%r11
   18e7f:	41 89 f9             	mov    %edi,%r9d
   18e82:	45 09 c1             	or     %r8d,%r9d
   18e85:	41 89 fa             	mov    %edi,%r10d
   18e88:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18e8f:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   18e94:	44 29 d3             	sub    %r10d,%ebx
   18e97:	85 ff                	test   %edi,%edi
   18e99:	49 0f 49 d9          	cmovns %r9,%rbx
   18e9d:	41 39 db             	cmp    %ebx,%r11d
   18ea0:	0f 47 d7             	cmova  %edi,%edx
   18ea3:	89 f7                	mov    %esi,%edi
   18ea5:	44 09 c7             	or     %r8d,%edi
   18ea8:	41 89 f1             	mov    %esi,%r9d
   18eab:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18eb2:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18eb8:	45 29 ca             	sub    %r9d,%r10d
   18ebb:	85 f6                	test   %esi,%esi
   18ebd:	4c 0f 49 d7          	cmovns %rdi,%r10
   18ec1:	89 cf                	mov    %ecx,%edi
   18ec3:	44 09 c7             	or     %r8d,%edi
   18ec6:	41 89 c9             	mov    %ecx,%r9d
   18ec9:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18ed0:	45 29 c8             	sub    %r9d,%r8d
   18ed3:	85 c9                	test   %ecx,%ecx
   18ed5:	4c 0f 49 c7          	cmovns %rdi,%r8
   18ed9:	45 39 c2             	cmp    %r8d,%r10d
   18edc:	0f 42 f1             	cmovb  %ecx,%esi
   18edf:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   18ee5:	89 f1                	mov    %esi,%ecx
   18ee7:	89 d7                	mov    %edx,%edi
   18ee9:	5b                   	pop    %rbx
   18eea:	44 89 00             	mov    %r8d,(%rax)
   18eed:	89 78 04             	mov    %edi,0x4(%rax)
   18ef0:	89 48 08             	mov    %ecx,0x8(%rax)
   18ef3:	c3                   	ret
   18ef4:	89 f1                	mov    %esi,%ecx
   18ef6:	89 d7                	mov    %edx,%edi
   18ef8:	45 89 c8             	mov    %r9d,%r8d
   18efb:	44 89 00             	mov    %r8d,(%rax)
   18efe:	89 78 04             	mov    %edi,0x4(%rax)
   18f01:	89 48 08             	mov    %ecx,0x8(%rax)
   18f04:	c3                   	ret
   18f05:	cc                   	int3
   18f06:	cc                   	int3
   18f07:	cc                   	int3
   18f08:	cc                   	int3
   18f09:	cc                   	int3
   18f0a:	cc                   	int3
   18f0b:	cc                   	int3
   18f0c:	cc                   	int3
   18f0d:	cc                   	int3
   18f0e:	cc                   	int3
   18f0f:	cc                   	int3

hyperinterval::float::F32Enclosure::sqrt:
   18f10:	48 89 f8             	mov    %rdi,%rax
   18f13:	f6 06 01             	testb  $0x1,(%rsi)
   18f16:	74 2c                	je     18f44 <hyperinterval::float::F32Enclosure::sqrt+0x34>
   18f18:	55                   	push   %rbp
   18f19:	41 57                	push   %r15
   18f1b:	41 56                	push   %r14
   18f1d:	41 55                	push   %r13
   18f1f:	41 54                	push   %r12
   18f21:	53                   	push   %rbx
   18f22:	48 83 ec 18          	sub    $0x18,%rsp
   18f26:	8b 5e 08             	mov    0x8(%rsi),%ebx
   18f29:	85 db                	test   %ebx,%ebx
   18f2b:	0f 98 c1             	sets   %cl
   18f2e:	f7 c3 ff ff ff 7f    	test   $0x7fffffff,%ebx
   18f34:	0f 95 c2             	setne  %dl
   18f37:	84 d1                	test   %dl,%cl
   18f39:	74 14                	je     18f4f <hyperinterval::float::F32Enclosure::sqrt+0x3f>
   18f3b:	c6 40 04 05          	movb   $0x5,0x4(%rax)
   18f3f:	e9 ce 00 00 00       	jmp    19012 <hyperinterval::float::F32Enclosure::sqrt+0x102>
   18f44:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   18f4a:	c6 40 0c 00          	movb   $0x0,0xc(%rax)
   18f4e:	c3                   	ret
   18f4f:	49 89 c7             	mov    %rax,%r15
   18f52:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
   18f56:	41 bc 00 00 00 80    	mov    $0x80000000,%r12d
   18f5c:	45 85 ed             	test   %r13d,%r13d
   18f5f:	0f 98 c0             	sets   %al
   18f62:	41 f7 c5 ff ff ff 7f 	test   $0x7fffffff,%r13d
   18f69:	40 0f 95 c5          	setne  %bpl
   18f6d:	31 c9                	xor    %ecx,%ecx
   18f6f:	40 20 c5             	and    %al,%bpl
   18f72:	49 0f 44 cd          	cmove  %r13,%rcx
   18f76:	48 89 e7             	mov    %rsp,%rdi
   18f79:	be 00 00 00 80       	mov    $0x80000000,%esi
   18f7e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18f83:	e8 58 34 00 00       	call   1c3e0 <hyperinterval::ieee::Format::sqrt>
   18f88:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18f8c:	74 15                	je     18fa3 <hyperinterval::float::F32Enclosure::sqrt+0x93>
   18f8e:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   18f93:	4c 89 f8             	mov    %r15,%rax
   18f96:	41 88 4f 04          	mov    %cl,0x4(%r15)
   18f9a:	41 c7 07 02 00 00 00 	movl   $0x2,(%r15)
   18fa1:	eb 75                	jmp    19018 <hyperinterval::float::F32Enclosure::sqrt+0x108>
   18fa3:	44 8b 74 24 08       	mov    0x8(%rsp),%r14d
   18fa8:	41 39 dd             	cmp    %ebx,%r13d
   18fab:	74 1b                	je     18fc8 <hyperinterval::float::F32Enclosure::sqrt+0xb8>
   18fad:	48 89 e7             	mov    %rsp,%rdi
   18fb0:	be 00 00 00 80       	mov    $0x80000000,%esi
   18fb5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18fba:	48 89 d9             	mov    %rbx,%rcx
   18fbd:	e8 1e 34 00 00       	call   1c3e0 <hyperinterval::ieee::Format::sqrt>
   18fc2:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18fc6:	74 c6                	je     18f8e <hyperinterval::float::F32Enclosure::sqrt+0x7e>
   18fc8:	8b 5c 24 10          	mov    0x10(%rsp),%ebx
   18fcc:	48 89 e7             	mov    %rsp,%rdi
   18fcf:	be 00 00 00 80       	mov    $0x80000000,%esi
   18fd4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18fd9:	4c 89 f1             	mov    %r14,%rcx
   18fdc:	e8 4f 3e 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   18fe1:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18fe5:	74 20                	je     19007 <hyperinterval::float::F32Enclosure::sqrt+0xf7>
   18fe7:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   18fec:	48 89 e7             	mov    %rsp,%rdi
   18fef:	be 00 00 00 80       	mov    $0x80000000,%esi
   18ff4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18ff9:	48 89 d9             	mov    %rbx,%rcx
   18ffc:	e8 2f 3e 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   19001:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19005:	75 20                	jne    19027 <hyperinterval::float::F32Enclosure::sqrt+0x117>
   19007:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   1900c:	4c 89 f8             	mov    %r15,%rax
   1900f:	88 50 04             	mov    %dl,0x4(%rax)
   19012:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   19018:	48 83 c4 18          	add    $0x18,%rsp
   1901c:	5b                   	pop    %rbx
   1901d:	41 5c                	pop    %r12
   1901f:	41 5d                	pop    %r13
   19021:	41 5e                	pop    %r14
   19023:	41 5f                	pop    %r15
   19025:	5d                   	pop    %rbp
   19026:	c3                   	ret
   19027:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1902b:	44 89 f0             	mov    %r14d,%eax
   1902e:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19033:	89 ca                	mov    %ecx,%edx
   19035:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1903b:	be 00 00 00 80       	mov    $0x80000000,%esi
   19040:	29 c6                	sub    %eax,%esi
   19042:	44 09 e0             	or     %r12d,%eax
   19045:	45 85 f6             	test   %r14d,%r14d
   19048:	48 0f 49 f0          	cmovns %rax,%rsi
   1904c:	89 d0                	mov    %edx,%eax
   1904e:	44 09 e0             	or     %r12d,%eax
   19051:	41 29 d4             	sub    %edx,%r12d
   19054:	85 c9                	test   %ecx,%ecx
   19056:	4c 0f 49 e0          	cmovns %rax,%r12
   1905a:	b2 01                	mov    $0x1,%dl
   1905c:	44 39 e6             	cmp    %r12d,%esi
   1905f:	4c 89 f8             	mov    %r15,%rax
   19062:	77 ab                	ja     1900f <hyperinterval::float::F32Enclosure::sqrt+0xff>
   19064:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   1906a:	44 89 70 04          	mov    %r14d,0x4(%rax)
   1906e:	89 48 08             	mov    %ecx,0x8(%rax)
   19071:	40 88 68 0c          	mov    %bpl,0xc(%rax)
   19075:	eb a1                	jmp    19018 <hyperinterval::float::F32Enclosure::sqrt+0x108>
   19077:	cc                   	int3
   19078:	cc                   	int3
   19079:	cc                   	int3
   1907a:	cc                   	int3
   1907b:	cc                   	int3
   1907c:	cc                   	int3
   1907d:	cc                   	int3
   1907e:	cc                   	int3
   1907f:	cc                   	int3

hyperinterval::float::F32Enclosure::point:
   19080:	53                   	push   %rbx
   19081:	48 83 ec 10          	sub    $0x10,%rsp
   19085:	48 89 fb             	mov    %rdi,%rbx
   19088:	66 0f 7e c1          	movd   %xmm0,%ecx
   1908c:	48 89 e7             	mov    %rsp,%rdi
   1908f:	be 00 00 00 80       	mov    $0x80000000,%esi
   19094:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19099:	e8 92 3d 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1909e:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   190a2:	75 0f                	jne    190b3 <hyperinterval::float::F32Enclosure::point+0x33>
   190a4:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   190a9:	88 43 04             	mov    %al,0x4(%rbx)
   190ac:	b8 02 00 00 00       	mov    $0x2,%eax
   190b1:	eb 0f                	jmp    190c2 <hyperinterval::float::F32Enclosure::point+0x42>
   190b3:	8b 44 24 08          	mov    0x8(%rsp),%eax
   190b7:	89 43 04             	mov    %eax,0x4(%rbx)
   190ba:	89 43 08             	mov    %eax,0x8(%rbx)
   190bd:	b8 01 00 00 00       	mov    $0x1,%eax
   190c2:	89 03                	mov    %eax,(%rbx)
   190c4:	48 89 d8             	mov    %rbx,%rax
   190c7:	48 83 c4 10          	add    $0x10,%rsp
   190cb:	5b                   	pop    %rbx
   190cc:	c3                   	ret
   190cd:	cc                   	int3
   190ce:	cc                   	int3
   190cf:	cc                   	int3

hyperinterval::float::F32Enclosure::signs:
   190d0:	83 3f 01             	cmpl   $0x1,(%rdi)
   190d3:	75 65                	jne    1913a <hyperinterval::float::F32Enclosure::signs+0x6a>
   190d5:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   190da:	8b 57 04             	mov    0x4(%rdi),%edx
   190dd:	8b 47 08             	mov    0x8(%rdi),%eax
   190e0:	48 89 d6             	mov    %rdx,%rsi
   190e3:	48 09 ce             	or     %rcx,%rsi
   190e6:	41 89 d0             	mov    %edx,%r8d
   190e9:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   190f0:	bf 00 00 00 80       	mov    $0x80000000,%edi
   190f5:	4c 29 c7             	sub    %r8,%rdi
   190f8:	85 d2                	test   %edx,%edx
   190fa:	48 0f 49 fe          	cmovns %rsi,%rdi
   190fe:	31 f6                	xor    %esi,%esi
   19100:	f7 c7 00 00 00 80    	test   $0x80000000,%edi
   19106:	0f 94 c2             	sete   %dl
   19109:	48 39 cf             	cmp    %rcx,%rdi
   1910c:	77 1d                	ja     1912b <hyperinterval::float::F32Enclosure::signs+0x5b>
   1910e:	39 cf                	cmp    %ecx,%edi
   19110:	0f 92 c1             	setb   %cl
   19113:	80 c9 02             	or     $0x2,%cl
   19116:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   1911b:	0f b6 c9             	movzbl %cl,%ecx
   1911e:	40 88 d6             	mov    %dl,%sil
   19121:	0f 44 f1             	cmove  %ecx,%esi
   19124:	85 c0                	test   %eax,%eax
   19126:	0f 49 f1             	cmovns %ecx,%esi
   19129:	89 f2                	mov    %esi,%edx
   1912b:	8d 4a 04             	lea    0x4(%rdx),%ecx
   1912e:	85 c0                	test   %eax,%eax
   19130:	0f b6 d2             	movzbl %dl,%edx
   19133:	0f b6 c1             	movzbl %cl,%eax
   19136:	0f 4e c2             	cmovle %edx,%eax
   19139:	c3                   	ret
   1913a:	31 c0                	xor    %eax,%eax
   1913c:	c3                   	ret
   1913d:	cc                   	int3
   1913e:	cc                   	int3
   1913f:	cc                   	int3

hyperinterval::float::F32Enclosure::affine:
   19140:	55                   	push   %rbp
   19141:	41 57                	push   %r15
   19143:	41 56                	push   %r14
   19145:	41 55                	push   %r13
   19147:	41 54                	push   %r12
   19149:	53                   	push   %rbx
   1914a:	48 83 ec 28          	sub    $0x28,%rsp
   1914e:	f3 0f 11 4c 24 20    	movss  %xmm1,0x20(%rsp)
   19154:	49 89 f7             	mov    %rsi,%r15
   19157:	48 89 fb             	mov    %rdi,%rbx
   1915a:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   19160:	66 0f 7e c1          	movd   %xmm0,%ecx
   19164:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19169:	be 00 00 00 80       	mov    $0x80000000,%esi
   1916e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19173:	e8 b8 3c 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   19178:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1917d:	74 2a                	je     191a9 <hyperinterval::float::F32Enclosure::affine+0x69>
   1917f:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   19184:	66 0f 6e 44 24 20    	movd   0x20(%rsp),%xmm0
   1918a:	66 0f 7e c1          	movd   %xmm0,%ecx
   1918e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19193:	be 00 00 00 80       	mov    $0x80000000,%esi
   19198:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1919d:	e8 8e 3c 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   191a2:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   191a7:	75 20                	jne    191c9 <hyperinterval::float::F32Enclosure::affine+0x89>
   191a9:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   191ae:	88 43 04             	mov    %al,0x4(%rbx)
   191b1:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   191b7:	48 89 d8             	mov    %rbx,%rax
   191ba:	48 83 c4 28          	add    $0x28,%rsp
   191be:	5b                   	pop    %rbx
   191bf:	41 5c                	pop    %r12
   191c1:	41 5d                	pop    %r13
   191c3:	41 5e                	pop    %r14
   191c5:	41 5f                	pop    %r15
   191c7:	5d                   	pop    %rbp
   191c8:	c3                   	ret
   191c9:	41 f6 07 01          	testb  $0x1,(%r15)
   191cd:	0f 84 19 01 00 00    	je     192ec <hyperinterval::float::F32Enclosure::affine+0x1ac>
   191d3:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   191d8:	41 8b 4f 04          	mov    0x4(%r15),%ecx
   191dc:	45 8b 7f 08          	mov    0x8(%r15),%r15d
   191e0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   191e5:	be 00 00 00 80       	mov    $0x80000000,%esi
   191ea:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   191ef:	4d 89 f0             	mov    %r14,%r8
   191f2:	4d 89 e1             	mov    %r12,%r9
   191f5:	e8 46 38 00 00       	call   1ca40 <hyperinterval::ieee::Format::affine>
   191fa:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   191ff:	74 a8                	je     191a9 <hyperinterval::float::F32Enclosure::affine+0x69>
   19201:	8b 6c 24 10          	mov    0x10(%rsp),%ebp
   19205:	8b 44 24 18          	mov    0x18(%rsp),%eax
   19209:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1920e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19213:	be 00 00 00 80       	mov    $0x80000000,%esi
   19218:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1921d:	4c 89 f9             	mov    %r15,%rcx
   19220:	4d 89 f0             	mov    %r14,%r8
   19223:	4d 89 e1             	mov    %r12,%r9
   19226:	e8 15 38 00 00       	call   1ca40 <hyperinterval::ieee::Format::affine>
   1922b:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19230:	0f 84 73 ff ff ff    	je     191a9 <hyperinterval::float::F32Enclosure::affine+0x69>
   19236:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1923b:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
   19240:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19245:	be 00 00 00 80       	mov    $0x80000000,%esi
   1924a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1924f:	48 89 e9             	mov    %rbp,%rcx
   19252:	e8 d9 3b 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   19257:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1925c:	0f 84 47 ff ff ff    	je     191a9 <hyperinterval::float::F32Enclosure::affine+0x69>
   19262:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   19267:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1926c:	be 00 00 00 80       	mov    $0x80000000,%esi
   19271:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19276:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1927b:	e8 b0 3b 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   19280:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19285:	0f 84 1e ff ff ff    	je     191a9 <hyperinterval::float::F32Enclosure::affine+0x69>
   1928b:	8b 6c 24 10          	mov    0x10(%rsp),%ebp
   1928f:	44 89 f0             	mov    %r14d,%eax
   19292:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19297:	89 e9                	mov    %ebp,%ecx
   19299:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1929f:	ba 00 00 00 80       	mov    $0x80000000,%edx
   192a4:	29 c2                	sub    %eax,%edx
   192a6:	44 09 e8             	or     %r13d,%eax
   192a9:	45 85 f6             	test   %r14d,%r14d
   192ac:	48 0f 49 d0          	cmovns %rax,%rdx
   192b0:	89 c8                	mov    %ecx,%eax
   192b2:	44 09 e8             	or     %r13d,%eax
   192b5:	41 29 cd             	sub    %ecx,%r13d
   192b8:	85 ed                	test   %ebp,%ebp
   192ba:	4c 0f 49 e8          	cmovns %rax,%r13
   192be:	b0 01                	mov    $0x1,%al
   192c0:	44 39 ea             	cmp    %r13d,%edx
   192c3:	0f 87 e5 fe ff ff    	ja     191ae <hyperinterval::float::F32Enclosure::affine+0x6e>
   192c9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   192ce:	4c 89 fe             	mov    %r15,%rsi
   192d1:	4c 89 e2             	mov    %r12,%rdx
   192d4:	e8 37 06 00 00       	call   19910 <hyperinterval::float::F32Enclosure::from_bits>
   192d9:	8b 44 24 08          	mov    0x8(%rsp),%eax
   192dd:	83 f8 02             	cmp    $0x2,%eax
   192e0:	75 15                	jne    192f7 <hyperinterval::float::F32Enclosure::affine+0x1b7>
   192e2:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   192e7:	e9 c2 fe ff ff       	jmp    191ae <hyperinterval::float::F32Enclosure::affine+0x6e>
   192ec:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   192f2:	e9 c0 fe ff ff       	jmp    191b7 <hyperinterval::float::F32Enclosure::affine+0x77>
   192f7:	83 f8 01             	cmp    $0x1,%eax
   192fa:	75 17                	jne    19313 <hyperinterval::float::F32Enclosure::affine+0x1d3>
   192fc:	8b 54 24 0c          	mov    0xc(%rsp),%edx
   19300:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   19304:	44 89 f7             	mov    %r14d,%edi
   19307:	89 ee                	mov    %ebp,%esi
   19309:	e8 02 43 00 00       	call   1d610 <hyperinterval::bounds::Bounds<T>::hull>
   1930e:	41 89 c6             	mov    %eax,%r14d
   19311:	89 d5                	mov    %edx,%ebp
   19313:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   19319:	44 89 73 04          	mov    %r14d,0x4(%rbx)
   1931d:	89 6b 08             	mov    %ebp,0x8(%rbx)
   19320:	e9 92 fe ff ff       	jmp    191b7 <hyperinterval::float::F32Enclosure::affine+0x77>
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

hyperinterval::float::F32Enclosure::square:
   19330:	55                   	push   %rbp
   19331:	41 57                	push   %r15
   19333:	41 56                	push   %r14
   19335:	41 55                	push   %r13
   19337:	41 54                	push   %r12
   19339:	53                   	push   %rbx
   1933a:	48 83 ec 48          	sub    $0x48,%rsp
   1933e:	48 89 fb             	mov    %rdi,%rbx
   19341:	f6 06 01             	testb  $0x1,(%rsi)
   19344:	0f 84 d8 00 00 00    	je     19422 <hyperinterval::float::F32Enclosure::square+0xf2>
   1934a:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
   1934e:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   19352:	44 89 f8             	mov    %r15d,%eax
   19355:	c1 e8 17             	shr    $0x17,%eax
   19358:	0f b6 c8             	movzbl %al,%ecx
   1935b:	44 89 fa             	mov    %r15d,%edx
   1935e:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
   19364:	31 c0                	xor    %eax,%eax
   19366:	85 c9                	test   %ecx,%ecx
   19368:	8d 8c 09 d4 fe ff ff 	lea    -0x12c(%rcx,%rcx,1),%ecx
   1936f:	41 bc d6 fe ff ff    	mov    $0xfffffed6,%r12d
   19375:	41 0f 44 cc          	cmove  %r12d,%ecx
   19379:	0f 95 c0             	setne  %al
   1937c:	c1 e0 17             	shl    $0x17,%eax
   1937f:	48 09 d0             	or     %rdx,%rax
   19382:	48 f7 e0             	mul    %rax
   19385:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1938a:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1938f:	48 89 04 24          	mov    %rax,(%rsp)
   19393:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   19397:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1939c:	48 89 e1             	mov    %rsp,%rcx
   1939f:	be 00 00 00 80       	mov    $0x80000000,%esi
   193a4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   193a9:	e8 c2 3a 00 00       	call   1ce70 <hyperinterval::ieee::Format::rounded>
   193ae:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   193b3:	75 66                	jne    1941b <hyperinterval::float::F32Enclosure::square+0xeb>
   193b5:	44 8b 6c 24 38       	mov    0x38(%rsp),%r13d
   193ba:	8b 6c 24 40          	mov    0x40(%rsp),%ebp
   193be:	44 89 f0             	mov    %r14d,%eax
   193c1:	c1 e8 17             	shr    $0x17,%eax
   193c4:	0f b6 c8             	movzbl %al,%ecx
   193c7:	44 89 f2             	mov    %r14d,%edx
   193ca:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
   193d0:	31 c0                	xor    %eax,%eax
   193d2:	85 c9                	test   %ecx,%ecx
   193d4:	8d 8c 09 d4 fe ff ff 	lea    -0x12c(%rcx,%rcx,1),%ecx
   193db:	41 0f 44 cc          	cmove  %r12d,%ecx
   193df:	0f 95 c0             	setne  %al
   193e2:	c1 e0 17             	shl    $0x17,%eax
   193e5:	48 09 d0             	or     %rdx,%rax
   193e8:	48 f7 e0             	mul    %rax
   193eb:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   193f0:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   193f5:	48 89 04 24          	mov    %rax,(%rsp)
   193f9:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   193fd:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   19402:	48 89 e1             	mov    %rsp,%rcx
   19405:	be 00 00 00 80       	mov    $0x80000000,%esi
   1940a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1940f:	e8 5c 3a 00 00       	call   1ce70 <hyperinterval::ieee::Format::rounded>
   19414:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   19419:	75 0f                	jne    1942a <hyperinterval::float::F32Enclosure::square+0xfa>
   1941b:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   19420:	eb 59                	jmp    1947b <hyperinterval::float::F32Enclosure::square+0x14b>
   19422:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   19428:	eb 5a                	jmp    19484 <hyperinterval::float::F32Enclosure::square+0x154>
   1942a:	8b 44 24 38          	mov    0x38(%rsp),%eax
   1942e:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   19433:	44 8b 64 24 40       	mov    0x40(%rsp),%r12d
   19438:	48 89 e7             	mov    %rsp,%rdi
   1943b:	be 00 00 00 80       	mov    $0x80000000,%esi
   19440:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19445:	4c 89 e9             	mov    %r13,%rcx
   19448:	e8 e3 39 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1944d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19451:	74 23                	je     19476 <hyperinterval::float::F32Enclosure::square+0x146>
   19453:	4d 89 e5             	mov    %r12,%r13
   19456:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1945b:	48 89 e7             	mov    %rsp,%rdi
   1945e:	be 00 00 00 80       	mov    $0x80000000,%esi
   19463:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19468:	48 89 e9             	mov    %rbp,%rcx
   1946b:	e8 c0 39 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   19470:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19474:	75 20                	jne    19496 <hyperinterval::float::F32Enclosure::square+0x166>
   19476:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1947b:	88 43 04             	mov    %al,0x4(%rbx)
   1947e:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19484:	48 89 d8             	mov    %rbx,%rax
   19487:	48 83 c4 48          	add    $0x48,%rsp
   1948b:	5b                   	pop    %rbx
   1948c:	41 5c                	pop    %r12
   1948e:	41 5d                	pop    %r13
   19490:	41 5e                	pop    %r14
   19492:	41 5f                	pop    %r15
   19494:	5d                   	pop    %rbp
   19495:	c3                   	ret
   19496:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   1949a:	44 89 e0             	mov    %r12d,%eax
   1949d:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   194a2:	89 e9                	mov    %ebp,%ecx
   194a4:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   194aa:	ba 00 00 00 80       	mov    $0x80000000,%edx
   194af:	29 c2                	sub    %eax,%edx
   194b1:	bf 00 00 00 80       	mov    $0x80000000,%edi
   194b6:	09 f8                	or     %edi,%eax
   194b8:	45 85 e4             	test   %r12d,%r12d
   194bb:	48 0f 49 d0          	cmovns %rax,%rdx
   194bf:	be 00 00 00 80       	mov    $0x80000000,%esi
   194c4:	29 ce                	sub    %ecx,%esi
   194c6:	89 c8                	mov    %ecx,%eax
   194c8:	09 f8                	or     %edi,%eax
   194ca:	85 ed                	test   %ebp,%ebp
   194cc:	48 0f 49 f0          	cmovns %rax,%rsi
   194d0:	b0 01                	mov    $0x1,%al
   194d2:	39 f2                	cmp    %esi,%edx
   194d4:	77 a5                	ja     1947b <hyperinterval::float::F32Enclosure::square+0x14b>
   194d6:	48 89 e7             	mov    %rsp,%rdi
   194d9:	be 00 00 00 80       	mov    $0x80000000,%esi
   194de:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   194e3:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   194e8:	e8 43 39 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   194ed:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   194f1:	74 83                	je     19476 <hyperinterval::float::F32Enclosure::square+0x146>
   194f3:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   194f8:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   194fd:	48 89 e7             	mov    %rsp,%rdi
   19500:	be 00 00 00 80       	mov    $0x80000000,%esi
   19505:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1950a:	4c 89 e9             	mov    %r13,%rcx
   1950d:	e8 1e 39 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   19512:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19516:	0f 84 5a ff ff ff    	je     19476 <hyperinterval::float::F32Enclosure::square+0x146>
   1951c:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   19520:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   19525:	89 d0                	mov    %edx,%eax
   19527:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   1952c:	41 89 c8             	mov    %ecx,%r8d
   1952f:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   19536:	be 00 00 00 80       	mov    $0x80000000,%esi
   1953b:	29 c6                	sub    %eax,%esi
   1953d:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19542:	09 f8                	or     %edi,%eax
   19544:	85 d2                	test   %edx,%edx
   19546:	48 0f 49 f0          	cmovns %rax,%rsi
   1954a:	44 89 c0             	mov    %r8d,%eax
   1954d:	09 f8                	or     %edi,%eax
   1954f:	44 29 c7             	sub    %r8d,%edi
   19552:	85 c9                	test   %ecx,%ecx
   19554:	48 0f 49 f8          	cmovns %rax,%rdi
   19558:	b0 01                	mov    $0x1,%al
   1955a:	39 fe                	cmp    %edi,%esi
   1955c:	0f 87 19 ff ff ff    	ja     1947b <hyperinterval::float::F32Enclosure::square+0x14b>
   19562:	44 89 e7             	mov    %r12d,%edi
   19565:	89 ee                	mov    %ebp,%esi
   19567:	e8 a4 40 00 00       	call   1d610 <hyperinterval::bounds::Bounds<T>::hull>
   1956c:	41 89 c4             	mov    %eax,%r12d
   1956f:	89 d5                	mov    %edx,%ebp
   19571:	44 89 ff             	mov    %r15d,%edi
   19574:	44 89 f6             	mov    %r14d,%esi
   19577:	31 d2                	xor    %edx,%edx
   19579:	e8 42 42 00 00       	call   1d7c0 <hyperinterval::bounds::Bounds<T>::signs>
   1957e:	a8 02                	test   $0x2,%al
   19580:	75 12                	jne    19594 <hyperinterval::float::F32Enclosure::square+0x264>
   19582:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   19588:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   1958c:	89 6b 08             	mov    %ebp,0x8(%rbx)
   1958f:	e9 f0 fe ff ff       	jmp    19484 <hyperinterval::float::F32Enclosure::square+0x154>
   19594:	48 89 e7             	mov    %rsp,%rdi
   19597:	31 f6                	xor    %esi,%esi
   19599:	31 d2                	xor    %edx,%edx
   1959b:	e8 70 03 00 00       	call   19910 <hyperinterval::float::F32Enclosure::from_bits>
   195a0:	8b 04 24             	mov    (%rsp),%eax
   195a3:	83 f8 02             	cmp    $0x2,%eax
   195a6:	75 0a                	jne    195b2 <hyperinterval::float::F32Enclosure::square+0x282>
   195a8:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   195ad:	e9 c9 fe ff ff       	jmp    1947b <hyperinterval::float::F32Enclosure::square+0x14b>
   195b2:	83 f8 01             	cmp    $0x1,%eax
   195b5:	75 cb                	jne    19582 <hyperinterval::float::F32Enclosure::square+0x252>
   195b7:	8b 54 24 04          	mov    0x4(%rsp),%edx
   195bb:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   195bf:	44 89 e7             	mov    %r12d,%edi
   195c2:	89 ee                	mov    %ebp,%esi
   195c4:	e8 47 40 00 00       	call   1d610 <hyperinterval::bounds::Bounds<T>::hull>
   195c9:	41 89 c4             	mov    %eax,%r12d
   195cc:	89 d5                	mov    %edx,%ebp
   195ce:	eb b2                	jmp    19582 <hyperinterval::float::F32Enclosure::square+0x252>

hyperinterval::float::F32Enclosure::next_up:
   195d0:	48 83 ec 18          	sub    $0x18,%rsp
   195d4:	66 0f 7e c1          	movd   %xmm0,%ecx
   195d8:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   195dd:	be 00 00 00 80       	mov    $0x80000000,%esi
   195e2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   195e7:	e8 44 38 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   195ec:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   195f1:	75 10                	jne    19603 <hyperinterval::float::F32Enclosure::next_up+0x33>
   195f3:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   195f8:	c1 e0 08             	shl    $0x8,%eax
   195fb:	48 ff c0             	inc    %rax
   195fe:	48 83 c4 18          	add    $0x18,%rsp
   19602:	c3                   	ret
   19603:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   19608:	31 c9                	xor    %ecx,%ecx
   1960a:	85 c0                	test   %eax,%eax
   1960c:	0f 99 c1             	setns  %cl
   1960f:	48 8d 0c 48          	lea    (%rax,%rcx,2),%rcx
   19613:	48 ff c9             	dec    %rcx
   19616:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1961b:	be 00 00 00 80       	mov    $0x80000000,%esi
   19620:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19625:	e8 06 38 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1962a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1962f:	75 0a                	jne    1963b <hyperinterval::float::F32Enclosure::next_up+0x6b>
   19631:	b8 01 03 00 00       	mov    $0x301,%eax
   19636:	48 83 c4 18          	add    $0x18,%rsp
   1963a:	c3                   	ret
   1963b:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   19640:	48 c1 e0 20          	shl    $0x20,%rax
   19644:	48 83 c4 18          	add    $0x18,%rsp
   19648:	c3                   	ret
   19649:	cc                   	int3
   1964a:	cc                   	int3
   1964b:	cc                   	int3
   1964c:	cc                   	int3
   1964d:	cc                   	int3
   1964e:	cc                   	int3
   1964f:	cc                   	int3

hyperinterval::float::F32Enclosure::disjoint:
   19650:	83 3f 00             	cmpl   $0x0,(%rdi)
   19653:	b0 01                	mov    $0x1,%al
   19655:	0f 84 a3 00 00 00    	je     196fe <hyperinterval::float::F32Enclosure::disjoint+0xae>
   1965b:	8b 0e                	mov    (%rsi),%ecx
   1965d:	85 c9                	test   %ecx,%ecx
   1965f:	0f 84 99 00 00 00    	je     196fe <hyperinterval::float::F32Enclosure::disjoint+0xae>
   19665:	f6 c1 01             	test   $0x1,%cl
   19668:	74 4c                	je     196b6 <hyperinterval::float::F32Enclosure::disjoint+0x66>
   1966a:	53                   	push   %rbx
   1966b:	8b 56 04             	mov    0x4(%rsi),%edx
   1966e:	44 8b 47 08          	mov    0x8(%rdi),%r8d
   19672:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   19678:	45 89 c2             	mov    %r8d,%r10d
   1967b:	45 09 ca             	or     %r9d,%r10d
   1967e:	45 89 c3             	mov    %r8d,%r11d
   19681:	41 81 e3 ff ff ff 7f 	and    $0x7fffffff,%r11d
   19688:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   1968d:	44 29 db             	sub    %r11d,%ebx
   19690:	45 85 c0             	test   %r8d,%r8d
   19693:	49 0f 49 da          	cmovns %r10,%rbx
   19697:	41 89 d0             	mov    %edx,%r8d
   1969a:	45 09 c8             	or     %r9d,%r8d
   1969d:	41 89 d2             	mov    %edx,%r10d
   196a0:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   196a7:	45 29 d1             	sub    %r10d,%r9d
   196aa:	85 d2                	test   %edx,%edx
   196ac:	4d 0f 49 c8          	cmovns %r8,%r9
   196b0:	44 39 cb             	cmp    %r9d,%ebx
   196b3:	5b                   	pop    %rbx
   196b4:	72 48                	jb     196fe <hyperinterval::float::F32Enclosure::disjoint+0xae>
   196b6:	f6 c1 01             	test   $0x1,%cl
   196b9:	75 03                	jne    196be <hyperinterval::float::F32Enclosure::disjoint+0x6e>
   196bb:	31 c0                	xor    %eax,%eax
   196bd:	c3                   	ret
   196be:	8b 47 04             	mov    0x4(%rdi),%eax
   196c1:	8b 4e 08             	mov    0x8(%rsi),%ecx
   196c4:	ba 00 00 00 80       	mov    $0x80000000,%edx
   196c9:	89 ce                	mov    %ecx,%esi
   196cb:	09 d6                	or     %edx,%esi
   196cd:	89 cf                	mov    %ecx,%edi
   196cf:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   196d5:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   196db:	41 29 f8             	sub    %edi,%r8d
   196de:	85 c9                	test   %ecx,%ecx
   196e0:	4c 0f 49 c6          	cmovns %rsi,%r8
   196e4:	89 c1                	mov    %eax,%ecx
   196e6:	09 d1                	or     %edx,%ecx
   196e8:	89 c6                	mov    %eax,%esi
   196ea:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   196f0:	29 f2                	sub    %esi,%edx
   196f2:	85 c0                	test   %eax,%eax
   196f4:	48 0f 49 d1          	cmovns %rcx,%rdx
   196f8:	41 39 d0             	cmp    %edx,%r8d
   196fb:	0f 92 c0             	setb   %al
   196fe:	c3                   	ret
   196ff:	cc                   	int3

hyperinterval::float::F32Enclosure::expanded:
   19700:	41 57                	push   %r15
   19702:	41 56                	push   %r14
   19704:	41 54                	push   %r12
   19706:	53                   	push   %rbx
   19707:	48 83 ec 18          	sub    $0x18,%rsp
   1970b:	48 89 fb             	mov    %rdi,%rbx
   1970e:	f6 06 01             	testb  $0x1,(%rsi)
   19711:	74 7c                	je     1978f <hyperinterval::float::F32Enclosure::expanded+0x8f>
   19713:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   19719:	8b 46 04             	mov    0x4(%rsi),%eax
   1971c:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   19720:	8d 88 00 00 00 80    	lea    -0x80000000(%rax),%ecx
   19726:	85 c0                	test   %eax,%eax
   19728:	0f 44 c8             	cmove  %eax,%ecx
   1972b:	31 c0                	xor    %eax,%eax
   1972d:	85 c9                	test   %ecx,%ecx
   1972f:	0f 99 c0             	setns  %al
   19732:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
   19736:	48 ff c9             	dec    %rcx
   19739:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1973e:	be 00 00 00 80       	mov    $0x80000000,%esi
   19743:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19748:	e8 e3 36 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1974d:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19752:	75 2f                	jne    19783 <hyperinterval::float::F32Enclosure::expanded+0x83>
   19754:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   19759:	31 c0                	xor    %eax,%eax
   1975b:	45 85 f6             	test   %r14d,%r14d
   1975e:	0f 99 c0             	setns  %al
   19761:	49 8d 0c 46          	lea    (%r14,%rax,2),%rcx
   19765:	48 ff c9             	dec    %rcx
   19768:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1976d:	be 00 00 00 80       	mov    $0x80000000,%esi
   19772:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19777:	e8 b4 36 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1977c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19781:	75 21                	jne    197a4 <hyperinterval::float::F32Enclosure::expanded+0xa4>
   19783:	c6 43 04 03          	movb   $0x3,0x4(%rbx)
   19787:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1978d:	eb 06                	jmp    19795 <hyperinterval::float::F32Enclosure::expanded+0x95>
   1978f:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   19795:	48 89 d8             	mov    %rbx,%rax
   19798:	48 83 c4 18          	add    $0x18,%rsp
   1979c:	5b                   	pop    %rbx
   1979d:	41 5c                	pop    %r12
   1979f:	41 5e                	pop    %r14
   197a1:	41 5f                	pop    %r15
   197a3:	c3                   	ret
   197a4:	44 89 e1             	mov    %r12d,%ecx
   197a7:	4c 31 f9             	xor    %r15,%rcx
   197aa:	4d 85 e4             	test   %r12,%r12
   197ad:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   197b2:	49 0f 44 cc          	cmove  %r12,%rcx
   197b6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   197bb:	be 00 00 00 80       	mov    $0x80000000,%esi
   197c0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   197c5:	e8 66 36 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   197ca:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   197cf:	74 23                	je     197f4 <hyperinterval::float::F32Enclosure::expanded+0xf4>
   197d1:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   197d6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   197db:	be 00 00 00 80       	mov    $0x80000000,%esi
   197e0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   197e5:	4c 89 f1             	mov    %r14,%rcx
   197e8:	e8 43 36 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   197ed:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   197f2:	75 10                	jne    19804 <hyperinterval::float::F32Enclosure::expanded+0x104>
   197f4:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   197f9:	88 43 04             	mov    %al,0x4(%rbx)
   197fc:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19802:	eb 91                	jmp    19795 <hyperinterval::float::F32Enclosure::expanded+0x95>
   19804:	8b 44 24 10          	mov    0x10(%rsp),%eax
   19808:	44 89 e1             	mov    %r12d,%ecx
   1980b:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19811:	89 c2                	mov    %eax,%edx
   19813:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19819:	be 00 00 00 80       	mov    $0x80000000,%esi
   1981e:	29 ce                	sub    %ecx,%esi
   19820:	44 09 f9             	or     %r15d,%ecx
   19823:	45 85 e4             	test   %r12d,%r12d
   19826:	48 0f 49 f1          	cmovns %rcx,%rsi
   1982a:	89 d1                	mov    %edx,%ecx
   1982c:	44 09 f9             	or     %r15d,%ecx
   1982f:	41 29 d7             	sub    %edx,%r15d
   19832:	85 c0                	test   %eax,%eax
   19834:	4c 0f 49 f9          	cmovns %rcx,%r15
   19838:	44 39 fe             	cmp    %r15d,%esi
   1983b:	76 0f                	jbe    1984c <hyperinterval::float::F32Enclosure::expanded+0x14c>
   1983d:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   19841:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19847:	e9 49 ff ff ff       	jmp    19795 <hyperinterval::float::F32Enclosure::expanded+0x95>
   1984c:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   19852:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   19856:	89 43 08             	mov    %eax,0x8(%rbx)
   19859:	e9 37 ff ff ff       	jmp    19795 <hyperinterval::float::F32Enclosure::expanded+0x95>
   1985e:	cc                   	int3
   1985f:	cc                   	int3

hyperinterval::float::F32Enclosure::overlaps:
   19860:	31 c0                	xor    %eax,%eax
   19862:	83 3f 00             	cmpl   $0x0,(%rdi)
   19865:	0f 84 a1 00 00 00    	je     1990c <hyperinterval::float::F32Enclosure::overlaps+0xac>
   1986b:	8b 0e                	mov    (%rsi),%ecx
   1986d:	85 c9                	test   %ecx,%ecx
   1986f:	0f 84 97 00 00 00    	je     1990c <hyperinterval::float::F32Enclosure::overlaps+0xac>
   19875:	f6 c1 01             	test   $0x1,%cl
   19878:	74 4b                	je     198c5 <hyperinterval::float::F32Enclosure::overlaps+0x65>
   1987a:	8b 46 04             	mov    0x4(%rsi),%eax
   1987d:	8b 57 08             	mov    0x8(%rdi),%edx
   19880:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   19886:	41 89 d1             	mov    %edx,%r9d
   19889:	45 09 c1             	or     %r8d,%r9d
   1988c:	41 89 d2             	mov    %edx,%r10d
   1988f:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   19896:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1989c:	45 29 d3             	sub    %r10d,%r11d
   1989f:	85 d2                	test   %edx,%edx
   198a1:	4d 0f 49 d9          	cmovns %r9,%r11
   198a5:	89 c2                	mov    %eax,%edx
   198a7:	44 09 c2             	or     %r8d,%edx
   198aa:	41 89 c1             	mov    %eax,%r9d
   198ad:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   198b4:	45 29 c8             	sub    %r9d,%r8d
   198b7:	85 c0                	test   %eax,%eax
   198b9:	4c 0f 49 c2          	cmovns %rdx,%r8
   198bd:	45 39 c3             	cmp    %r8d,%r11d
   198c0:	73 03                	jae    198c5 <hyperinterval::float::F32Enclosure::overlaps+0x65>
   198c2:	31 c0                	xor    %eax,%eax
   198c4:	c3                   	ret
   198c5:	b0 01                	mov    $0x1,%al
   198c7:	f6 c1 01             	test   $0x1,%cl
   198ca:	74 40                	je     1990c <hyperinterval::float::F32Enclosure::overlaps+0xac>
   198cc:	8b 47 04             	mov    0x4(%rdi),%eax
   198cf:	8b 4e 08             	mov    0x8(%rsi),%ecx
   198d2:	ba 00 00 00 80       	mov    $0x80000000,%edx
   198d7:	89 ce                	mov    %ecx,%esi
   198d9:	09 d6                	or     %edx,%esi
   198db:	89 cf                	mov    %ecx,%edi
   198dd:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   198e3:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   198e9:	41 29 f8             	sub    %edi,%r8d
   198ec:	85 c9                	test   %ecx,%ecx
   198ee:	4c 0f 49 c6          	cmovns %rsi,%r8
   198f2:	89 c1                	mov    %eax,%ecx
   198f4:	09 d1                	or     %edx,%ecx
   198f6:	89 c6                	mov    %eax,%esi
   198f8:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   198fe:	29 f2                	sub    %esi,%edx
   19900:	85 c0                	test   %eax,%eax
   19902:	48 0f 49 d1          	cmovns %rcx,%rdx
   19906:	41 39 d0             	cmp    %edx,%r8d
   19909:	0f 93 c0             	setae  %al
   1990c:	c3                   	ret
   1990d:	cc                   	int3
   1990e:	cc                   	int3
   1990f:	cc                   	int3

hyperinterval::float::F32Enclosure::from_bits:
   19910:	41 57                	push   %r15
   19912:	41 56                	push   %r14
   19914:	41 54                	push   %r12
   19916:	53                   	push   %rbx
   19917:	48 83 ec 18          	sub    $0x18,%rsp
   1991b:	49 89 d6             	mov    %rdx,%r14
   1991e:	48 89 fb             	mov    %rdi,%rbx
   19921:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   19927:	89 f1                	mov    %esi,%ecx
   19929:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1992e:	be 00 00 00 80       	mov    $0x80000000,%esi
   19933:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19938:	e8 f3 34 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1993d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19942:	74 23                	je     19967 <hyperinterval::float::F32Enclosure::from_bits+0x57>
   19944:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   19949:	44 89 f1             	mov    %r14d,%ecx
   1994c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19951:	be 00 00 00 80       	mov    $0x80000000,%esi
   19956:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1995b:	e8 d0 34 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   19960:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19965:	75 1a                	jne    19981 <hyperinterval::float::F32Enclosure::from_bits+0x71>
   19967:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1996c:	88 43 04             	mov    %al,0x4(%rbx)
   1996f:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19975:	48 83 c4 18          	add    $0x18,%rsp
   19979:	5b                   	pop    %rbx
   1997a:	41 5c                	pop    %r12
   1997c:	41 5e                	pop    %r14
   1997e:	41 5f                	pop    %r15
   19980:	c3                   	ret
   19981:	8b 44 24 10          	mov    0x10(%rsp),%eax
   19985:	44 89 e1             	mov    %r12d,%ecx
   19988:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1998e:	89 c2                	mov    %eax,%edx
   19990:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19996:	be 00 00 00 80       	mov    $0x80000000,%esi
   1999b:	29 ce                	sub    %ecx,%esi
   1999d:	44 09 f9             	or     %r15d,%ecx
   199a0:	45 85 e4             	test   %r12d,%r12d
   199a3:	48 0f 49 f1          	cmovns %rcx,%rsi
   199a7:	89 d1                	mov    %edx,%ecx
   199a9:	44 09 f9             	or     %r15d,%ecx
   199ac:	41 29 d7             	sub    %edx,%r15d
   199af:	85 c0                	test   %eax,%eax
   199b1:	4c 0f 49 f9          	cmovns %rcx,%r15
   199b5:	44 39 fe             	cmp    %r15d,%esi
   199b8:	76 06                	jbe    199c0 <hyperinterval::float::F32Enclosure::from_bits+0xb0>
   199ba:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   199be:	eb af                	jmp    1996f <hyperinterval::float::F32Enclosure::from_bits+0x5f>
   199c0:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   199c6:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   199ca:	89 43 08             	mov    %eax,0x8(%rbx)
   199cd:	eb a6                	jmp    19975 <hyperinterval::float::F32Enclosure::from_bits+0x65>
   199cf:	cc                   	int3

hyperinterval::float::F32Enclosure::max_image:
   199d0:	48 89 f8             	mov    %rdi,%rax
   199d3:	31 c9                	xor    %ecx,%ecx
   199d5:	f6 06 01             	testb  $0x1,(%rsi)
   199d8:	0f 84 db 00 00 00    	je     19ab9 <hyperinterval::float::F32Enclosure::max_image+0xe9>
   199de:	f6 02 01             	testb  $0x1,(%rdx)
   199e1:	0f 84 ca 00 00 00    	je     19ab1 <hyperinterval::float::F32Enclosure::max_image+0xe1>
   199e7:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   199ec:	f3 0f 7e 4e 04       	movq   0x4(%rsi),%xmm1
   199f1:	66 0f ef d2          	pxor   %xmm2,%xmm2
   199f5:	66 0f 6f e1          	movdqa %xmm1,%xmm4
   199f9:	66 0f 62 e2          	punpckldq %xmm2,%xmm4
   199fd:	66 0f 6f e8          	movdqa %xmm0,%xmm5
   19a01:	66 0f 62 ea          	punpckldq %xmm2,%xmm5
   19a05:	66 0f 6f 1d f3 c0 fe 	movdqa -0x13f0d(%rip),%xmm3        # 5b00 <__abi_tag+0x5804>
   19a0c:	ff 
   19a0d:	66 0f 6f f4          	movdqa %xmm4,%xmm6
   19a11:	66 0f eb f3          	por    %xmm3,%xmm6
   19a15:	66 0f 6f 3d e3 be fe 	movdqa -0x1411d(%rip),%xmm7        # 5900 <__abi_tag+0x5604>
   19a1c:	ff 
   19a1d:	66 0f db e7          	pand   %xmm7,%xmm4
   19a21:	66 44 0f 6f c3       	movdqa %xmm3,%xmm8
   19a26:	66 44 0f fb c4       	psubq  %xmm4,%xmm8
   19a2b:	66 0f 70 e1 50       	pshufd $0x50,%xmm1,%xmm4
   19a30:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
   19a35:	66 44 0f 66 cc       	pcmpgtd %xmm4,%xmm9
   19a3a:	66 45 0f db c1       	pand   %xmm9,%xmm8
   19a3f:	66 44 0f df ce       	pandn  %xmm6,%xmm9
   19a44:	66 45 0f eb c8       	por    %xmm8,%xmm9
   19a49:	66 0f 6f e5          	movdqa %xmm5,%xmm4
   19a4d:	66 0f eb e3          	por    %xmm3,%xmm4
   19a51:	66 0f db ef          	pand   %xmm7,%xmm5
   19a55:	66 0f 6f f3          	movdqa %xmm3,%xmm6
   19a59:	66 0f fb f5          	psubq  %xmm5,%xmm6
   19a5d:	66 0f 70 e8 50       	pshufd $0x50,%xmm0,%xmm5
   19a62:	66 0f 66 d5          	pcmpgtd %xmm5,%xmm2
   19a66:	66 0f db f2          	pand   %xmm2,%xmm6
   19a6a:	66 0f df d4          	pandn  %xmm4,%xmm2
   19a6e:	66 0f eb d6          	por    %xmm6,%xmm2
   19a72:	66 44 0f ef cb       	pxor   %xmm3,%xmm9
   19a77:	66 0f ef d3          	pxor   %xmm3,%xmm2
   19a7b:	66 0f 6f da          	movdqa %xmm2,%xmm3
   19a7f:	66 41 0f 66 d9       	pcmpgtd %xmm9,%xmm3
   19a84:	66 0f 70 e3 e8       	pshufd $0xe8,%xmm3,%xmm4
   19a89:	66 41 0f 76 d1       	pcmpeqd %xmm9,%xmm2
   19a8e:	66 0f 70 ea fd       	pshufd $0xfd,%xmm2,%xmm5
   19a93:	66 0f db ec          	pand   %xmm4,%xmm5
   19a97:	66 0f 70 d3 fd       	pshufd $0xfd,%xmm3,%xmm2
   19a9c:	66 0f eb d5          	por    %xmm5,%xmm2
   19aa0:	66 0f db c2          	pand   %xmm2,%xmm0
   19aa4:	66 0f df d1          	pandn  %xmm1,%xmm2
   19aa8:	66 0f eb d0          	por    %xmm0,%xmm2
   19aac:	b9 01 00 00 00       	mov    $0x1,%ecx
   19ab1:	89 08                	mov    %ecx,(%rax)
   19ab3:	66 0f d6 50 04       	movq   %xmm2,0x4(%rax)
   19ab8:	c3                   	ret
   19ab9:	89 08                	mov    %ecx,(%rax)
   19abb:	0f 13 50 04          	movlps %xmm2,0x4(%rax)
   19abf:	c3                   	ret

hyperinterval::float::F32Enclosure::min_image:
   19ac0:	48 89 f8             	mov    %rdi,%rax
   19ac3:	31 c9                	xor    %ecx,%ecx
   19ac5:	f6 06 01             	testb  $0x1,(%rsi)
   19ac8:	0f 84 dc 00 00 00    	je     19baa <hyperinterval::float::F32Enclosure::min_image+0xea>
   19ace:	f6 02 01             	testb  $0x1,(%rdx)
   19ad1:	0f 84 cb 00 00 00    	je     19ba2 <hyperinterval::float::F32Enclosure::min_image+0xe2>
   19ad7:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   19adc:	f3 0f 7e 4e 04       	movq   0x4(%rsi),%xmm1
   19ae1:	66 0f ef d2          	pxor   %xmm2,%xmm2
   19ae5:	66 0f 6f e1          	movdqa %xmm1,%xmm4
   19ae9:	66 0f 62 e2          	punpckldq %xmm2,%xmm4
   19aed:	66 0f 6f e8          	movdqa %xmm0,%xmm5
   19af1:	66 0f 62 ea          	punpckldq %xmm2,%xmm5
   19af5:	66 0f 6f 1d 03 c0 fe 	movdqa -0x13ffd(%rip),%xmm3        # 5b00 <__abi_tag+0x5804>
   19afc:	ff 
   19afd:	66 0f 6f f4          	movdqa %xmm4,%xmm6
   19b01:	66 0f eb f3          	por    %xmm3,%xmm6
   19b05:	66 0f 6f 3d f3 bd fe 	movdqa -0x1420d(%rip),%xmm7        # 5900 <__abi_tag+0x5604>
   19b0c:	ff 
   19b0d:	66 0f db e7          	pand   %xmm7,%xmm4
   19b11:	66 44 0f 6f c3       	movdqa %xmm3,%xmm8
   19b16:	66 44 0f fb c4       	psubq  %xmm4,%xmm8
   19b1b:	66 0f 70 e1 50       	pshufd $0x50,%xmm1,%xmm4
   19b20:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
   19b25:	66 44 0f 66 cc       	pcmpgtd %xmm4,%xmm9
   19b2a:	66 45 0f db c1       	pand   %xmm9,%xmm8
   19b2f:	66 44 0f df ce       	pandn  %xmm6,%xmm9
   19b34:	66 45 0f eb c8       	por    %xmm8,%xmm9
   19b39:	66 0f 6f e5          	movdqa %xmm5,%xmm4
   19b3d:	66 0f eb e3          	por    %xmm3,%xmm4
   19b41:	66 0f db ef          	pand   %xmm7,%xmm5
   19b45:	66 0f 6f f3          	movdqa %xmm3,%xmm6
   19b49:	66 0f fb f5          	psubq  %xmm5,%xmm6
   19b4d:	66 0f 70 e8 50       	pshufd $0x50,%xmm0,%xmm5
   19b52:	66 0f 66 d5          	pcmpgtd %xmm5,%xmm2
   19b56:	66 0f db f2          	pand   %xmm2,%xmm6
   19b5a:	66 0f df d4          	pandn  %xmm4,%xmm2
   19b5e:	66 0f eb d6          	por    %xmm6,%xmm2
   19b62:	66 0f ef d3          	pxor   %xmm3,%xmm2
   19b66:	66 44 0f ef cb       	pxor   %xmm3,%xmm9
   19b6b:	66 41 0f 6f d9       	movdqa %xmm9,%xmm3
   19b70:	66 0f 66 da          	pcmpgtd %xmm2,%xmm3
   19b74:	66 0f 70 e3 e8       	pshufd $0xe8,%xmm3,%xmm4
   19b79:	66 44 0f 76 ca       	pcmpeqd %xmm2,%xmm9
   19b7e:	66 41 0f 70 e9 fd    	pshufd $0xfd,%xmm9,%xmm5
   19b84:	66 0f db ec          	pand   %xmm4,%xmm5
   19b88:	66 0f 70 d3 fd       	pshufd $0xfd,%xmm3,%xmm2
   19b8d:	66 0f eb d5          	por    %xmm5,%xmm2
   19b91:	66 0f db c2          	pand   %xmm2,%xmm0
   19b95:	66 0f df d1          	pandn  %xmm1,%xmm2
   19b99:	66 0f eb d0          	por    %xmm0,%xmm2
   19b9d:	b9 01 00 00 00       	mov    $0x1,%ecx
   19ba2:	89 08                	mov    %ecx,(%rax)
   19ba4:	66 0f d6 50 04       	movq   %xmm2,0x4(%rax)
   19ba9:	c3                   	ret
   19baa:	89 08                	mov    %ecx,(%rax)
   19bac:	0f 13 50 04          	movlps %xmm2,0x4(%rax)
   19bb0:	c3                   	ret
   19bb1:	cc                   	int3
   19bb2:	cc                   	int3
   19bb3:	cc                   	int3
   19bb4:	cc                   	int3
   19bb5:	cc                   	int3
   19bb6:	cc                   	int3
   19bb7:	cc                   	int3
   19bb8:	cc                   	int3
   19bb9:	cc                   	int3
   19bba:	cc                   	int3
   19bbb:	cc                   	int3
   19bbc:	cc                   	int3
   19bbd:	cc                   	int3
   19bbe:	cc                   	int3
   19bbf:	cc                   	int3

hyperinterval::float::F32Enclosure::next_down:
   19bc0:	53                   	push   %rbx
   19bc1:	48 83 ec 10          	sub    $0x10,%rsp
   19bc5:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   19bca:	66 0f 7e c1          	movd   %xmm0,%ecx
   19bce:	48 89 e7             	mov    %rsp,%rdi
   19bd1:	be 00 00 00 80       	mov    $0x80000000,%esi
   19bd6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19bdb:	e8 50 32 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   19be0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19be4:	75 11                	jne    19bf7 <hyperinterval::float::F32Enclosure::next_down+0x37>
   19be6:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   19beb:	c1 e0 08             	shl    $0x8,%eax
   19bee:	48 ff c0             	inc    %rax
   19bf1:	48 83 c4 10          	add    $0x10,%rsp
   19bf5:	5b                   	pop    %rbx
   19bf6:	c3                   	ret
   19bf7:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19bfc:	48 89 c1             	mov    %rax,%rcx
   19bff:	48 31 d9             	xor    %rbx,%rcx
   19c02:	48 85 c0             	test   %rax,%rax
   19c05:	48 0f 44 c8          	cmove  %rax,%rcx
   19c09:	31 c0                	xor    %eax,%eax
   19c0b:	85 c9                	test   %ecx,%ecx
   19c0d:	0f 99 c0             	setns  %al
   19c10:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
   19c14:	48 ff c9             	dec    %rcx
   19c17:	48 89 e7             	mov    %rsp,%rdi
   19c1a:	be 00 00 00 80       	mov    $0x80000000,%esi
   19c1f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19c24:	e8 07 32 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   19c29:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19c2d:	75 0b                	jne    19c3a <hyperinterval::float::F32Enclosure::next_down+0x7a>
   19c2f:	b8 01 03 00 00       	mov    $0x301,%eax
   19c34:	48 83 c4 10          	add    $0x10,%rsp
   19c38:	5b                   	pop    %rbx
   19c39:	c3                   	ret
   19c3a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19c3f:	48 89 c8             	mov    %rcx,%rax
   19c42:	48 35 00 00 00 80    	xor    $0xffffffff80000000,%rax
   19c48:	48 c1 e0 20          	shl    $0x20,%rax
   19c4c:	48 85 c9             	test   %rcx,%rcx
   19c4f:	48 0f 44 c1          	cmove  %rcx,%rax
   19c53:	48 83 c4 10          	add    $0x10,%rsp
   19c57:	5b                   	pop    %rbx
   19c58:	c3                   	ret
   19c59:	cc                   	int3
   19c5a:	cc                   	int3
   19c5b:	cc                   	int3
   19c5c:	cc                   	int3
   19c5d:	cc                   	int3
   19c5e:	cc                   	int3
   19c5f:	cc                   	int3

hyperinterval::float::F32Enclosure::subset_of:
   19c60:	b0 01                	mov    $0x1,%al
   19c62:	f6 07 01             	testb  $0x1,(%rdi)
   19c65:	74 53                	je     19cba <hyperinterval::float::F32Enclosure::subset_of+0x5a>
   19c67:	f6 06 01             	testb  $0x1,(%rsi)
   19c6a:	74 4c                	je     19cb8 <hyperinterval::float::F32Enclosure::subset_of+0x58>
   19c6c:	8b 4f 04             	mov    0x4(%rdi),%ecx
   19c6f:	8b 56 04             	mov    0x4(%rsi),%edx
   19c72:	b8 00 00 00 80       	mov    $0x80000000,%eax
   19c77:	41 89 d0             	mov    %edx,%r8d
   19c7a:	41 09 c0             	or     %eax,%r8d
   19c7d:	41 89 d1             	mov    %edx,%r9d
   19c80:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   19c87:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   19c8d:	45 29 ca             	sub    %r9d,%r10d
   19c90:	85 d2                	test   %edx,%edx
   19c92:	4d 0f 49 d0          	cmovns %r8,%r10
   19c96:	89 ca                	mov    %ecx,%edx
   19c98:	09 c2                	or     %eax,%edx
   19c9a:	41 89 c8             	mov    %ecx,%r8d
   19c9d:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   19ca4:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   19caa:	45 29 c1             	sub    %r8d,%r9d
   19cad:	85 c9                	test   %ecx,%ecx
   19caf:	4c 0f 49 ca          	cmovns %rdx,%r9
   19cb3:	45 39 ca             	cmp    %r9d,%r10d
   19cb6:	76 03                	jbe    19cbb <hyperinterval::float::F32Enclosure::subset_of+0x5b>
   19cb8:	31 c0                	xor    %eax,%eax
   19cba:	c3                   	ret
   19cbb:	8b 4f 08             	mov    0x8(%rdi),%ecx
   19cbe:	8b 56 08             	mov    0x8(%rsi),%edx
   19cc1:	89 ce                	mov    %ecx,%esi
   19cc3:	09 c6                	or     %eax,%esi
   19cc5:	89 cf                	mov    %ecx,%edi
   19cc7:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   19ccd:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   19cd3:	41 29 f8             	sub    %edi,%r8d
   19cd6:	85 c9                	test   %ecx,%ecx
   19cd8:	4c 0f 49 c6          	cmovns %rsi,%r8
   19cdc:	89 d1                	mov    %edx,%ecx
   19cde:	09 c1                	or     %eax,%ecx
   19ce0:	89 d6                	mov    %edx,%esi
   19ce2:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   19ce8:	29 f0                	sub    %esi,%eax
   19cea:	85 d2                	test   %edx,%edx
   19cec:	48 0f 49 c1          	cmovns %rcx,%rax
   19cf0:	41 39 c0             	cmp    %eax,%r8d
   19cf3:	0f 96 c0             	setbe  %al
   19cf6:	c3                   	ret
   19cf7:	cc                   	int3
   19cf8:	cc                   	int3
   19cf9:	cc                   	int3
   19cfa:	cc                   	int3
   19cfb:	cc                   	int3
   19cfc:	cc                   	int3
   19cfd:	cc                   	int3
   19cfe:	cc                   	int3
   19cff:	cc                   	int3

hyperinterval::float::F64Enclosure::reciprocal:
   19d00:	55                   	push   %rbp
   19d01:	41 57                	push   %r15
   19d03:	41 56                	push   %r14
   19d05:	41 55                	push   %r13
   19d07:	41 54                	push   %r12
   19d09:	53                   	push   %rbx
   19d0a:	48 83 ec 28          	sub    $0x28,%rsp
   19d0e:	48 89 fb             	mov    %rdi,%rbx
   19d11:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   19d15:	74 65                	je     19d7c <hyperinterval::float::F64Enclosure::reciprocal+0x7c>
   19d17:	49 89 f6             	mov    %rsi,%r14
   19d1a:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
   19d21:	00 00 80 
   19d24:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   19d2b:	00 f0 7f 
   19d2e:	49 bd 00 00 00 00 00 	movabs $0x3ff0000000000000,%r13
   19d35:	00 f0 3f 
   19d38:	48 89 e7             	mov    %rsp,%rdi
   19d3b:	4c 89 fe             	mov    %r15,%rsi
   19d3e:	4c 89 e2             	mov    %r12,%rdx
   19d41:	4c 89 e9             	mov    %r13,%rcx
   19d44:	e8 e7 30 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   19d49:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19d4d:	74 1c                	je     19d6b <hyperinterval::float::F64Enclosure::reciprocal+0x6b>
   19d4f:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   19d54:	48 89 e7             	mov    %rsp,%rdi
   19d57:	4c 89 fe             	mov    %r15,%rsi
   19d5a:	4c 89 e2             	mov    %r12,%rdx
   19d5d:	4c 89 e9             	mov    %r13,%rcx
   19d60:	e8 cb 30 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   19d65:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19d69:	75 2a                	jne    19d95 <hyperinterval::float::F64Enclosure::reciprocal+0x95>
   19d6b:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   19d70:	88 53 08             	mov    %dl,0x8(%rbx)
   19d73:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   19d7a:	eb 07                	jmp    19d83 <hyperinterval::float::F64Enclosure::reciprocal+0x83>
   19d7c:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   19d83:	48 89 d8             	mov    %rbx,%rax
   19d86:	48 83 c4 28          	add    $0x28,%rsp
   19d8a:	5b                   	pop    %rbx
   19d8b:	41 5c                	pop    %r12
   19d8d:	41 5d                	pop    %r13
   19d8f:	41 5e                	pop    %r14
   19d91:	41 5f                	pop    %r15
   19d93:	5d                   	pop    %rbp
   19d94:	c3                   	ret
   19d95:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19d9a:	48 89 ea             	mov    %rbp,%rdx
   19d9d:	4c 09 fa             	or     %r15,%rdx
   19da0:	49 8d 47 ff          	lea    -0x1(%r15),%rax
   19da4:	48 89 ee             	mov    %rbp,%rsi
   19da7:	48 21 c6             	and    %rax,%rsi
   19daa:	4c 89 ff             	mov    %r15,%rdi
   19dad:	48 29 f7             	sub    %rsi,%rdi
   19db0:	48 85 ed             	test   %rbp,%rbp
   19db3:	48 0f 49 fa          	cmovns %rdx,%rdi
   19db7:	48 89 ca             	mov    %rcx,%rdx
   19dba:	4c 09 fa             	or     %r15,%rdx
   19dbd:	48 89 ce             	mov    %rcx,%rsi
   19dc0:	48 21 c6             	and    %rax,%rsi
   19dc3:	49 29 f7             	sub    %rsi,%r15
   19dc6:	48 85 c9             	test   %rcx,%rcx
   19dc9:	4c 0f 49 fa          	cmovns %rdx,%r15
   19dcd:	b2 01                	mov    $0x1,%dl
   19dcf:	4c 39 ff             	cmp    %r15,%rdi
   19dd2:	77 9c                	ja     19d70 <hyperinterval::float::F64Enclosure::reciprocal+0x70>
   19dd4:	48 c7 44 24 10 01 00 	movq   $0x1,0x10(%rsp)
   19ddb:	00 00 
   19ddd:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
   19de2:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   19de7:	49 83 7e 08 00       	cmpq   $0x0,0x8(%r14)
   19dec:	7f 0e                	jg     19dfc <hyperinterval::float::F64Enclosure::reciprocal+0xfc>
   19dee:	49 8b 4e 10          	mov    0x10(%r14),%rcx
   19df2:	48 85 c9             	test   %rcx,%rcx
   19df5:	79 1f                	jns    19e16 <hyperinterval::float::F64Enclosure::reciprocal+0x116>
   19df7:	48 21 c1             	and    %rax,%rcx
   19dfa:	74 1a                	je     19e16 <hyperinterval::float::F64Enclosure::reciprocal+0x116>
   19dfc:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
   19e01:	48 89 df             	mov    %rbx,%rdi
   19e04:	4c 89 f2             	mov    %r14,%rdx
   19e07:	b9 01 00 00 00       	mov    $0x1,%ecx
   19e0c:	e8 9f 02 00 00       	call   1a0b0 <hyperinterval::float::F64Enclosure::corner_image>
   19e11:	e9 6d ff ff ff       	jmp    19d83 <hyperinterval::float::F64Enclosure::reciprocal+0x83>
   19e16:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
   19e1a:	e9 54 ff ff ff       	jmp    19d73 <hyperinterval::float::F64Enclosure::reciprocal+0x73>
   19e1f:	cc                   	int3

hyperinterval::float::F64Enclosure::checked_pow:
   19e20:	55                   	push   %rbp
   19e21:	41 57                	push   %r15
   19e23:	41 56                	push   %r14
   19e25:	41 55                	push   %r13
   19e27:	41 54                	push   %r12
   19e29:	53                   	push   %rbx
   19e2a:	48 83 ec 48          	sub    $0x48,%rsp
   19e2e:	48 89 fb             	mov    %rdi,%rbx
   19e31:	83 fa 02             	cmp    $0x2,%edx
   19e34:	75 0e                	jne    19e44 <hyperinterval::float::F64Enclosure::checked_pow+0x24>
   19e36:	48 89 df             	mov    %rbx,%rdi
   19e39:	ff 15 c1 56 04 00    	call   *0x456c1(%rip)        # 5f500 <_DYNAMIC+0x2f0>
   19e3f:	e9 e0 00 00 00       	jmp    19f24 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
   19e44:	f6 06 01             	testb  $0x1,(%rsi)
   19e47:	0f 84 d0 00 00 00    	je     19f1d <hyperinterval::float::F64Enclosure::checked_pow+0xfd>
   19e4d:	89 d5                	mov    %edx,%ebp
   19e4f:	4c 8b 76 10          	mov    0x10(%rsi),%r14
   19e53:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
   19e5a:	00 00 80 
   19e5d:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   19e64:	00 f0 7f 
   19e67:	4c 8b 7e 08          	mov    0x8(%rsi),%r15
   19e6b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19e70:	4c 89 e6             	mov    %r12,%rsi
   19e73:	4c 89 ea             	mov    %r13,%rdx
   19e76:	4c 89 f9             	mov    %r15,%rcx
   19e79:	41 89 e8             	mov    %ebp,%r8d
   19e7c:	e8 bf 27 00 00       	call   1c640 <hyperinterval::ieee::Format::power>
   19e81:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19e86:	0f 85 80 00 00 00    	jne    19f0c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   19e8c:	4c 89 f1             	mov    %r14,%rcx
   19e8f:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   19e94:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   19e99:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   19e9e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19ea3:	4c 89 e6             	mov    %r12,%rsi
   19ea6:	4c 89 ea             	mov    %r13,%rdx
   19ea9:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
   19eae:	41 89 e8             	mov    %ebp,%r8d
   19eb1:	e8 8a 27 00 00       	call   1c640 <hyperinterval::ieee::Format::power>
   19eb6:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19ebb:	74 4f                	je     19f0c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   19ebd:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   19ec2:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   19ec7:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   19ecc:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   19ed1:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19ed6:	4c 89 e6             	mov    %r12,%rsi
   19ed9:	4c 89 ea             	mov    %r13,%rdx
   19edc:	4c 89 f1             	mov    %r14,%rcx
   19edf:	e8 4c 2f 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   19ee4:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19ee9:	74 21                	je     19f0c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   19eeb:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   19ef0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19ef5:	4c 89 e6             	mov    %r12,%rsi
   19ef8:	4c 89 ea             	mov    %r13,%rdx
   19efb:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   19f00:	e8 2b 2f 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   19f05:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19f0a:	75 2a                	jne    19f36 <hyperinterval::float::F64Enclosure::checked_pow+0x116>
   19f0c:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   19f11:	88 43 08             	mov    %al,0x8(%rbx)
   19f14:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   19f1b:	eb 07                	jmp    19f24 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
   19f1d:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   19f24:	48 89 d8             	mov    %rbx,%rax
   19f27:	48 83 c4 48          	add    $0x48,%rsp
   19f2b:	5b                   	pop    %rbx
   19f2c:	41 5c                	pop    %r12
   19f2e:	41 5d                	pop    %r13
   19f30:	41 5e                	pop    %r14
   19f32:	41 5f                	pop    %r15
   19f34:	5d                   	pop    %rbp
   19f35:	c3                   	ret
   19f36:	4c 89 f0             	mov    %r14,%rax
   19f39:	4c 09 e0             	or     %r12,%rax
   19f3c:	4c 89 f6             	mov    %r14,%rsi
   19f3f:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
   19f44:	48 89 f1             	mov    %rsi,%rcx
   19f47:	4c 21 f1             	and    %r14,%rcx
   19f4a:	4c 89 e2             	mov    %r12,%rdx
   19f4d:	48 29 ca             	sub    %rcx,%rdx
   19f50:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
   19f55:	48 85 f6             	test   %rsi,%rsi
   19f58:	48 0f 49 d0          	cmovns %rax,%rdx
   19f5c:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
   19f61:	48 89 f8             	mov    %rdi,%rax
   19f64:	4c 09 e0             	or     %r12,%rax
   19f67:	48 89 f9             	mov    %rdi,%rcx
   19f6a:	4c 21 f1             	and    %r14,%rcx
   19f6d:	4c 89 e6             	mov    %r12,%rsi
   19f70:	48 29 ce             	sub    %rcx,%rsi
   19f73:	48 85 ff             	test   %rdi,%rdi
   19f76:	48 0f 49 f0          	cmovns %rax,%rsi
   19f7a:	b0 01                	mov    $0x1,%al
   19f7c:	48 39 f2             	cmp    %rsi,%rdx
   19f7f:	77 90                	ja     19f11 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
   19f81:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
   19f86:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19f8b:	4c 89 e6             	mov    %r12,%rsi
   19f8e:	4c 89 ea             	mov    %r13,%rdx
   19f91:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   19f96:	e8 95 2e 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   19f9b:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19fa0:	0f 84 66 ff ff ff    	je     19f0c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   19fa6:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   19fab:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   19fb0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19fb5:	4c 89 e6             	mov    %r12,%rsi
   19fb8:	4c 89 ea             	mov    %r13,%rdx
   19fbb:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   19fc0:	e8 6b 2e 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   19fc5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19fca:	0f 84 3c ff ff ff    	je     19f0c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   19fd0:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   19fd5:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
   19fda:	48 89 d0             	mov    %rdx,%rax
   19fdd:	4c 09 e0             	or     %r12,%rax
   19fe0:	48 89 d7             	mov    %rdx,%rdi
   19fe3:	4c 21 f7             	and    %r14,%rdi
   19fe6:	4c 89 e6             	mov    %r12,%rsi
   19fe9:	48 29 fe             	sub    %rdi,%rsi
   19fec:	48 85 d2             	test   %rdx,%rdx
   19fef:	48 0f 49 f0          	cmovns %rax,%rsi
   19ff3:	48 89 c8             	mov    %rcx,%rax
   19ff6:	4c 09 e0             	or     %r12,%rax
   19ff9:	49 21 ce             	and    %rcx,%r14
   19ffc:	4d 29 f4             	sub    %r14,%r12
   19fff:	48 85 c9             	test   %rcx,%rcx
   1a002:	4c 0f 49 e0          	cmovns %rax,%r12
   1a006:	b0 01                	mov    $0x1,%al
   1a008:	4c 39 e6             	cmp    %r12,%rsi
   1a00b:	0f 87 00 ff ff ff    	ja     19f11 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
   1a011:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1a016:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   1a01b:	e8 80 36 00 00       	call   1d6a0 <hyperinterval::bounds::Bounds<T>::hull>
   1a020:	49 89 c5             	mov    %rax,%r13
   1a023:	49 89 d4             	mov    %rdx,%r12
   1a026:	85 ed                	test   %ebp,%ebp
   1a028:	0f 95 c0             	setne  %al
   1a02b:	40 f6 c5 01          	test   $0x1,%bpl
   1a02f:	0f 94 c1             	sete   %cl
   1a032:	84 c8                	test   %cl,%al
   1a034:	74 13                	je     1a049 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
   1a036:	4c 89 ff             	mov    %r15,%rdi
   1a039:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
   1a03e:	31 d2                	xor    %edx,%edx
   1a040:	e8 eb 36 00 00       	call   1d730 <hyperinterval::bounds::Bounds<T>::signs>
   1a045:	a8 02                	test   $0x2,%al
   1a047:	75 14                	jne    1a05d <hyperinterval::float::F64Enclosure::checked_pow+0x23d>
   1a049:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1a050:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1a054:	4c 89 63 10          	mov    %r12,0x10(%rbx)
   1a058:	e9 c7 fe ff ff       	jmp    19f24 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
   1a05d:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a062:	31 f6                	xor    %esi,%esi
   1a064:	31 d2                	xor    %edx,%edx
   1a066:	e8 f5 17 00 00       	call   1b860 <hyperinterval::float::F64Enclosure::from_bits>
   1a06b:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a070:	48 83 f8 02          	cmp    $0x2,%rax
   1a074:	75 0a                	jne    1a080 <hyperinterval::float::F64Enclosure::checked_pow+0x260>
   1a076:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   1a07b:	e9 91 fe ff ff       	jmp    19f11 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
   1a080:	83 f8 01             	cmp    $0x1,%eax
   1a083:	75 c4                	jne    1a049 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
   1a085:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   1a08a:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1a08f:	4c 89 ef             	mov    %r13,%rdi
   1a092:	4c 89 e6             	mov    %r12,%rsi
   1a095:	e8 06 36 00 00       	call   1d6a0 <hyperinterval::bounds::Bounds<T>::hull>
   1a09a:	49 89 c5             	mov    %rax,%r13
   1a09d:	49 89 d4             	mov    %rdx,%r12
   1a0a0:	eb a7                	jmp    1a049 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
   1a0a2:	cc                   	int3
   1a0a3:	cc                   	int3
   1a0a4:	cc                   	int3
   1a0a5:	cc                   	int3
   1a0a6:	cc                   	int3
   1a0a7:	cc                   	int3
   1a0a8:	cc                   	int3
   1a0a9:	cc                   	int3
   1a0aa:	cc                   	int3
   1a0ab:	cc                   	int3
   1a0ac:	cc                   	int3
   1a0ad:	cc                   	int3
   1a0ae:	cc                   	int3
   1a0af:	cc                   	int3

hyperinterval::float::F64Enclosure::corner_image:
   1a0b0:	55                   	push   %rbp
   1a0b1:	41 57                	push   %r15
   1a0b3:	41 56                	push   %r14
   1a0b5:	41 55                	push   %r13
   1a0b7:	41 54                	push   %r12
   1a0b9:	53                   	push   %rbx
   1a0ba:	48 83 ec 68          	sub    $0x68,%rsp
   1a0be:	48 89 fb             	mov    %rdi,%rbx
   1a0c1:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1a0c5:	75 5f                	jne    1a126 <hyperinterval::float::F64Enclosure::corner_image+0x76>
   1a0c7:	f6 02 01             	testb  $0x1,(%rdx)
   1a0ca:	74 5a                	je     1a126 <hyperinterval::float::F64Enclosure::corner_image+0x76>
   1a0cc:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a0d3:	00 00 80 
   1a0d6:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a0dd:	00 f0 7f 
   1a0e0:	4c 8b 66 08          	mov    0x8(%rsi),%r12
   1a0e4:	48 8b 46 10          	mov    0x10(%rsi),%rax
   1a0e8:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1a0ed:	48 8b 6a 08          	mov    0x8(%rdx),%rbp
   1a0f1:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1a0f5:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a0fa:	84 c9                	test   %cl,%cl
   1a0fc:	74 34                	je     1a132 <hyperinterval::float::F64Enclosure::corner_image+0x82>
   1a0fe:	48 89 e7             	mov    %rsp,%rdi
   1a101:	4c 89 f6             	mov    %r14,%rsi
   1a104:	4c 89 fa             	mov    %r15,%rdx
   1a107:	4c 89 e1             	mov    %r12,%rcx
   1a10a:	49 89 e8             	mov    %rbp,%r8
   1a10d:	e8 be 1d 00 00       	call   1bed0 <hyperinterval::ieee::Format::div>
   1a112:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a116:	0f 84 c3 00 00 00    	je     1a1df <hyperinterval::float::F64Enclosure::corner_image+0x12f>
   1a11c:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a121:	e9 b1 00 00 00       	jmp    1a1d7 <hyperinterval::float::F64Enclosure::corner_image+0x127>
   1a126:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1a12d:	e9 84 03 00 00       	jmp    1a4b6 <hyperinterval::float::F64Enclosure::corner_image+0x406>
   1a132:	4c 89 e1             	mov    %r12,%rcx
   1a135:	48 c1 e9 34          	shr    $0x34,%rcx
   1a139:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1a13f:	48 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%rdx
   1a146:	ff 0f 00 
   1a149:	4c 89 e7             	mov    %r12,%rdi
   1a14c:	48 21 d7             	and    %rdx,%rdi
   1a14f:	48 8d 42 01          	lea    0x1(%rdx),%rax
   1a153:	44 8d 81 9a f7 ff ff 	lea    -0x866(%rcx),%r8d
   1a15a:	48 85 c9             	test   %rcx,%rcx
   1a15d:	48 0f 45 c8          	cmovne %rax,%rcx
   1a161:	be 9b f7 ff ff       	mov    $0xfffff79b,%esi
   1a166:	41 0f 45 f0          	cmovne %r8d,%esi
   1a16a:	48 09 f9             	or     %rdi,%rcx
   1a16d:	48 89 ef             	mov    %rbp,%rdi
   1a170:	48 c1 ef 34          	shr    $0x34,%rdi
   1a174:	81 e7 ff 07 00 00    	and    $0x7ff,%edi
   1a17a:	48 21 ea             	and    %rbp,%rdx
   1a17d:	48 85 ff             	test   %rdi,%rdi
   1a180:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1a186:	44 0f 45 c7          	cmovne %edi,%r8d
   1a18a:	48 0f 44 c7          	cmove  %rdi,%rax
   1a18e:	48 09 d0             	or     %rdx,%rax
   1a191:	48 89 ef             	mov    %rbp,%rdi
   1a194:	4c 31 e7             	xor    %r12,%rdi
   1a197:	48 f7 e1             	mul    %rcx
   1a19a:	41 01 f0             	add    %esi,%r8d
   1a19d:	48 c1 ef 3f          	shr    $0x3f,%rdi
   1a1a1:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
   1a1a6:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1a1ab:	48 89 04 24          	mov    %rax,(%rsp)
   1a1af:	44 89 44 24 10       	mov    %r8d,0x10(%rsp)
   1a1b4:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1a1b9:	48 89 e1             	mov    %rsp,%rcx
   1a1bc:	4c 89 f6             	mov    %r14,%rsi
   1a1bf:	4c 89 fa             	mov    %r15,%rdx
   1a1c2:	e8 a9 2c 00 00       	call   1ce70 <hyperinterval::ieee::Format::rounded>
   1a1c7:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1a1cc:	0f 84 99 02 00 00    	je     1a46b <hyperinterval::float::F64Enclosure::corner_image+0x3bb>
   1a1d2:	0f b6 44 24 41       	movzbl 0x41(%rsp),%eax
   1a1d7:	88 43 08             	mov    %al,0x8(%rbx)
   1a1da:	e9 d0 02 00 00       	jmp    1a4af <hyperinterval::float::F64Enclosure::corner_image+0x3ff>
   1a1df:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a1e4:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   1a1e9:	48 89 e7             	mov    %rsp,%rdi
   1a1ec:	4c 89 f6             	mov    %r14,%rsi
   1a1ef:	4c 89 fa             	mov    %r15,%rdx
   1a1f2:	e8 39 2c 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1a1f7:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a1fb:	0f 85 a4 02 00 00    	jne    1a4a5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a201:	4c 89 fa             	mov    %r15,%rdx
   1a204:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1a209:	48 89 e7             	mov    %rsp,%rdi
   1a20c:	4c 89 f6             	mov    %r14,%rsi
   1a20f:	4c 89 e9             	mov    %r13,%rcx
   1a212:	e8 19 2c 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1a217:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a21b:	0f 85 84 02 00 00    	jne    1a4a5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a221:	4c 89 f8             	mov    %r15,%rax
   1a224:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a22b:	00 00 80 
   1a22e:	4c 09 f0             	or     %r14,%rax
   1a231:	49 8d 76 ff          	lea    -0x1(%r14),%rsi
   1a235:	4c 89 f9             	mov    %r15,%rcx
   1a238:	48 21 f1             	and    %rsi,%rcx
   1a23b:	4c 89 f2             	mov    %r14,%rdx
   1a23e:	48 29 ca             	sub    %rcx,%rdx
   1a241:	4d 85 ff             	test   %r15,%r15
   1a244:	48 0f 49 d0          	cmovns %rax,%rdx
   1a248:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   1a24d:	48 89 f8             	mov    %rdi,%rax
   1a250:	4c 09 f0             	or     %r14,%rax
   1a253:	48 89 f9             	mov    %rdi,%rcx
   1a256:	48 21 f1             	and    %rsi,%rcx
   1a259:	4c 89 f6             	mov    %r14,%rsi
   1a25c:	48 29 ce             	sub    %rcx,%rsi
   1a25f:	48 85 ff             	test   %rdi,%rdi
   1a262:	48 0f 49 f0          	cmovns %rax,%rsi
   1a266:	41 b5 01             	mov    $0x1,%r13b
   1a269:	48 39 f2             	cmp    %rsi,%rdx
   1a26c:	0f 87 39 02 00 00    	ja     1a4ab <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   1a272:	48 89 7c 24 38       	mov    %rdi,0x38(%rsp)
   1a277:	4c 89 7c 24 28       	mov    %r15,0x28(%rsp)
   1a27c:	48 89 e7             	mov    %rsp,%rdi
   1a27f:	4c 89 f6             	mov    %r14,%rsi
   1a282:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a289:	00 f0 7f 
   1a28c:	4c 89 fa             	mov    %r15,%rdx
   1a28f:	4c 89 e1             	mov    %r12,%rcx
   1a292:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1a297:	e8 34 1c 00 00       	call   1bed0 <hyperinterval::ieee::Format::div>
   1a29c:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a2a0:	0f 85 76 fe ff ff    	jne    1a11c <hyperinterval::float::F64Enclosure::corner_image+0x6c>
   1a2a6:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a2ab:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1a2b0:	48 89 e7             	mov    %rsp,%rdi
   1a2b3:	4c 89 f6             	mov    %r14,%rsi
   1a2b6:	4c 89 fa             	mov    %r15,%rdx
   1a2b9:	e8 72 2b 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1a2be:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a2c2:	0f 85 dd 01 00 00    	jne    1a4a5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a2c8:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a2cd:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1a2d2:	48 89 e7             	mov    %rsp,%rdi
   1a2d5:	4c 89 f6             	mov    %r14,%rsi
   1a2d8:	4c 89 fa             	mov    %r15,%rdx
   1a2db:	4c 89 e1             	mov    %r12,%rcx
   1a2de:	e8 4d 2b 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1a2e3:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a2e7:	0f 85 b8 01 00 00    	jne    1a4a5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a2ed:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a2f2:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
   1a2f7:	48 89 d0             	mov    %rdx,%rax
   1a2fa:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a301:	00 00 80 
   1a304:	4c 09 f0             	or     %r14,%rax
   1a307:	49 89 d0             	mov    %rdx,%r8
   1a30a:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   1a30e:	49 21 f8             	and    %rdi,%r8
   1a311:	4c 89 f6             	mov    %r14,%rsi
   1a314:	4c 29 c6             	sub    %r8,%rsi
   1a317:	48 85 d2             	test   %rdx,%rdx
   1a31a:	48 0f 49 f0          	cmovns %rax,%rsi
   1a31e:	48 89 c8             	mov    %rcx,%rax
   1a321:	4c 09 f0             	or     %r14,%rax
   1a324:	49 89 c8             	mov    %rcx,%r8
   1a327:	49 21 f8             	and    %rdi,%r8
   1a32a:	4c 89 f7             	mov    %r14,%rdi
   1a32d:	4c 29 c7             	sub    %r8,%rdi
   1a330:	48 85 c9             	test   %rcx,%rcx
   1a333:	48 0f 49 f8          	cmovns %rax,%rdi
   1a337:	48 39 fe             	cmp    %rdi,%rsi
   1a33a:	0f 87 6b 01 00 00    	ja     1a4ab <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   1a340:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1a345:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
   1a34a:	e8 51 33 00 00       	call   1d6a0 <hyperinterval::bounds::Bounds<T>::hull>
   1a34f:	49 89 c4             	mov    %rax,%r12
   1a352:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1a357:	48 89 e7             	mov    %rsp,%rdi
   1a35a:	4c 89 f6             	mov    %r14,%rsi
   1a35d:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a364:	00 f0 7f 
   1a367:	4c 89 fa             	mov    %r15,%rdx
   1a36a:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1a36f:	49 89 e8             	mov    %rbp,%r8
   1a372:	e8 59 1b 00 00       	call   1bed0 <hyperinterval::ieee::Format::div>
   1a377:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a37b:	0f 85 9b fd ff ff    	jne    1a11c <hyperinterval::float::F64Enclosure::corner_image+0x6c>
   1a381:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a386:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1a38b:	48 89 e7             	mov    %rsp,%rdi
   1a38e:	4c 89 f6             	mov    %r14,%rsi
   1a391:	4c 89 fa             	mov    %r15,%rdx
   1a394:	e8 97 2a 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1a399:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a39d:	0f 85 02 01 00 00    	jne    1a4a5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a3a3:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a3a8:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1a3ad:	48 89 e7             	mov    %rsp,%rdi
   1a3b0:	4c 89 f6             	mov    %r14,%rsi
   1a3b3:	4c 89 fa             	mov    %r15,%rdx
   1a3b6:	48 89 e9             	mov    %rbp,%rcx
   1a3b9:	e8 72 2a 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1a3be:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a3c2:	0f 85 dd 00 00 00    	jne    1a4a5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a3c8:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a3cd:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
   1a3d2:	48 89 d0             	mov    %rdx,%rax
   1a3d5:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a3dc:	00 00 80 
   1a3df:	4c 09 f0             	or     %r14,%rax
   1a3e2:	49 89 d0             	mov    %rdx,%r8
   1a3e5:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   1a3e9:	49 21 f8             	and    %rdi,%r8
   1a3ec:	4c 89 f6             	mov    %r14,%rsi
   1a3ef:	4c 29 c6             	sub    %r8,%rsi
   1a3f2:	48 85 d2             	test   %rdx,%rdx
   1a3f5:	48 0f 49 f0          	cmovns %rax,%rsi
   1a3f9:	48 89 c8             	mov    %rcx,%rax
   1a3fc:	4c 09 f0             	or     %r14,%rax
   1a3ff:	49 89 c8             	mov    %rcx,%r8
   1a402:	49 21 f8             	and    %rdi,%r8
   1a405:	4c 89 f7             	mov    %r14,%rdi
   1a408:	4c 29 c7             	sub    %r8,%rdi
   1a40b:	48 85 c9             	test   %rcx,%rcx
   1a40e:	48 0f 49 f8          	cmovns %rax,%rdi
   1a412:	48 39 fe             	cmp    %rdi,%rsi
   1a415:	0f 87 90 00 00 00    	ja     1a4ab <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   1a41b:	4c 89 e7             	mov    %r12,%rdi
   1a41e:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   1a423:	e8 78 32 00 00       	call   1d6a0 <hyperinterval::bounds::Bounds<T>::hull>
   1a428:	49 89 c4             	mov    %rax,%r12
   1a42b:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1a430:	48 89 e7             	mov    %rsp,%rdi
   1a433:	4c 89 f6             	mov    %r14,%rsi
   1a436:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a43d:	00 f0 7f 
   1a440:	4c 89 fa             	mov    %r15,%rdx
   1a443:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1a448:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1a44d:	e8 7e 1a 00 00       	call   1bed0 <hyperinterval::ieee::Format::div>
   1a452:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a456:	0f 85 c0 fc ff ff    	jne    1a11c <hyperinterval::float::F64Enclosure::corner_image+0x6c>
   1a45c:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a461:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1a466:	e9 ae 02 00 00       	jmp    1a719 <hyperinterval::float::F64Enclosure::corner_image+0x669>
   1a46b:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1a470:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
   1a475:	48 89 e7             	mov    %rsp,%rdi
   1a478:	4c 89 f6             	mov    %r14,%rsi
   1a47b:	4c 89 fa             	mov    %r15,%rdx
   1a47e:	e8 ad 29 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1a483:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a487:	74 1c                	je     1a4a5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a489:	4c 89 f6             	mov    %r14,%rsi
   1a48c:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   1a491:	48 89 e7             	mov    %rsp,%rdi
   1a494:	4c 89 fa             	mov    %r15,%rdx
   1a497:	4c 89 e9             	mov    %r13,%rcx
   1a49a:	e8 91 29 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1a49f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a4a3:	75 20                	jne    1a4c5 <hyperinterval::float::F64Enclosure::corner_image+0x415>
   1a4a5:	44 0f b6 6c 24 01    	movzbl 0x1(%rsp),%r13d
   1a4ab:	44 88 6b 08          	mov    %r13b,0x8(%rbx)
   1a4af:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a4b6:	48 83 c4 68          	add    $0x68,%rsp
   1a4ba:	5b                   	pop    %rbx
   1a4bb:	41 5c                	pop    %r12
   1a4bd:	41 5d                	pop    %r13
   1a4bf:	41 5e                	pop    %r14
   1a4c1:	41 5f                	pop    %r15
   1a4c3:	5d                   	pop    %rbp
   1a4c4:	c3                   	ret
   1a4c5:	4c 89 f0             	mov    %r14,%rax
   1a4c8:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   1a4cf:	00 00 80 
   1a4d2:	48 09 f8             	or     %rdi,%rax
   1a4d5:	48 8d 77 ff          	lea    -0x1(%rdi),%rsi
   1a4d9:	4c 89 f1             	mov    %r14,%rcx
   1a4dc:	48 21 f1             	and    %rsi,%rcx
   1a4df:	48 89 fa             	mov    %rdi,%rdx
   1a4e2:	48 29 ca             	sub    %rcx,%rdx
   1a4e5:	4d 85 f6             	test   %r14,%r14
   1a4e8:	48 0f 49 d0          	cmovns %rax,%rdx
   1a4ec:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
   1a4f1:	4c 89 c0             	mov    %r8,%rax
   1a4f4:	48 09 f8             	or     %rdi,%rax
   1a4f7:	4c 89 c1             	mov    %r8,%rcx
   1a4fa:	48 21 f1             	and    %rsi,%rcx
   1a4fd:	48 89 fe             	mov    %rdi,%rsi
   1a500:	48 29 ce             	sub    %rcx,%rsi
   1a503:	4d 85 c0             	test   %r8,%r8
   1a506:	48 0f 49 f0          	cmovns %rax,%rsi
   1a50a:	41 b5 01             	mov    $0x1,%r13b
   1a50d:	48 39 f2             	cmp    %rsi,%rdx
   1a510:	77 99                	ja     1a4ab <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   1a512:	4c 89 44 24 38       	mov    %r8,0x38(%rsp)
   1a517:	4c 89 74 24 28       	mov    %r14,0x28(%rsp)
   1a51c:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1a521:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a528:	00 00 80 
   1a52b:	4c 89 f6             	mov    %r14,%rsi
   1a52e:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a535:	00 f0 7f 
   1a538:	4c 89 fa             	mov    %r15,%rdx
   1a53b:	4c 89 e1             	mov    %r12,%rcx
   1a53e:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1a543:	e8 c8 1d 00 00       	call   1c310 <hyperinterval::ieee::Format::mul>
   1a548:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1a54d:	0f 85 7f fc ff ff    	jne    1a1d2 <hyperinterval::float::F64Enclosure::corner_image+0x122>
   1a553:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1a558:	4c 8b 64 24 50       	mov    0x50(%rsp),%r12
   1a55d:	48 89 e7             	mov    %rsp,%rdi
   1a560:	4c 89 f6             	mov    %r14,%rsi
   1a563:	4c 89 fa             	mov    %r15,%rdx
   1a566:	e8 c5 28 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1a56b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a56f:	0f 85 30 ff ff ff    	jne    1a4a5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a575:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a57a:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1a57f:	48 89 e7             	mov    %rsp,%rdi
   1a582:	4c 89 f6             	mov    %r14,%rsi
   1a585:	4c 89 fa             	mov    %r15,%rdx
   1a588:	4c 89 e1             	mov    %r12,%rcx
   1a58b:	e8 a0 28 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1a590:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a594:	0f 85 0b ff ff ff    	jne    1a4a5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a59a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a59f:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
   1a5a4:	48 89 d0             	mov    %rdx,%rax
   1a5a7:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a5ae:	00 00 80 
   1a5b1:	4c 09 f0             	or     %r14,%rax
   1a5b4:	49 89 d0             	mov    %rdx,%r8
   1a5b7:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   1a5bb:	49 21 f8             	and    %rdi,%r8
   1a5be:	4c 89 f6             	mov    %r14,%rsi
   1a5c1:	4c 29 c6             	sub    %r8,%rsi
   1a5c4:	48 85 d2             	test   %rdx,%rdx
   1a5c7:	48 0f 49 f0          	cmovns %rax,%rsi
   1a5cb:	48 89 c8             	mov    %rcx,%rax
   1a5ce:	4c 09 f0             	or     %r14,%rax
   1a5d1:	49 89 c8             	mov    %rcx,%r8
   1a5d4:	49 21 f8             	and    %rdi,%r8
   1a5d7:	4c 89 f7             	mov    %r14,%rdi
   1a5da:	4c 29 c7             	sub    %r8,%rdi
   1a5dd:	48 85 c9             	test   %rcx,%rcx
   1a5e0:	48 0f 49 f8          	cmovns %rax,%rdi
   1a5e4:	48 39 fe             	cmp    %rdi,%rsi
   1a5e7:	0f 87 be fe ff ff    	ja     1a4ab <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   1a5ed:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1a5f2:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
   1a5f7:	e8 a4 30 00 00       	call   1d6a0 <hyperinterval::bounds::Bounds<T>::hull>
   1a5fc:	49 89 c4             	mov    %rax,%r12
   1a5ff:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1a604:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1a609:	4c 89 f6             	mov    %r14,%rsi
   1a60c:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a613:	00 f0 7f 
   1a616:	4c 89 fa             	mov    %r15,%rdx
   1a619:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1a61e:	49 89 e8             	mov    %rbp,%r8
   1a621:	e8 ea 1c 00 00       	call   1c310 <hyperinterval::ieee::Format::mul>
   1a626:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1a62b:	0f 85 a1 fb ff ff    	jne    1a1d2 <hyperinterval::float::F64Enclosure::corner_image+0x122>
   1a631:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1a636:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
   1a63b:	48 89 e7             	mov    %rsp,%rdi
   1a63e:	4c 89 f6             	mov    %r14,%rsi
   1a641:	4c 89 fa             	mov    %r15,%rdx
   1a644:	e8 e7 27 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1a649:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a64d:	0f 85 52 fe ff ff    	jne    1a4a5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a653:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a658:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1a65d:	48 89 e7             	mov    %rsp,%rdi
   1a660:	4c 89 f6             	mov    %r14,%rsi
   1a663:	4c 89 fa             	mov    %r15,%rdx
   1a666:	48 89 e9             	mov    %rbp,%rcx
   1a669:	e8 c2 27 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1a66e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a672:	0f 85 2d fe ff ff    	jne    1a4a5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a678:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a67d:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
   1a682:	48 89 d0             	mov    %rdx,%rax
   1a685:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a68c:	00 00 80 
   1a68f:	4c 09 f0             	or     %r14,%rax
   1a692:	49 89 d0             	mov    %rdx,%r8
   1a695:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   1a699:	49 21 f8             	and    %rdi,%r8
   1a69c:	4c 89 f6             	mov    %r14,%rsi
   1a69f:	4c 29 c6             	sub    %r8,%rsi
   1a6a2:	48 85 d2             	test   %rdx,%rdx
   1a6a5:	48 0f 49 f0          	cmovns %rax,%rsi
   1a6a9:	48 89 c8             	mov    %rcx,%rax
   1a6ac:	4c 09 f0             	or     %r14,%rax
   1a6af:	49 89 c8             	mov    %rcx,%r8
   1a6b2:	49 21 f8             	and    %rdi,%r8
   1a6b5:	4c 89 f7             	mov    %r14,%rdi
   1a6b8:	4c 29 c7             	sub    %r8,%rdi
   1a6bb:	48 85 c9             	test   %rcx,%rcx
   1a6be:	48 0f 49 f8          	cmovns %rax,%rdi
   1a6c2:	48 39 fe             	cmp    %rdi,%rsi
   1a6c5:	0f 87 e0 fd ff ff    	ja     1a4ab <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   1a6cb:	4c 89 e7             	mov    %r12,%rdi
   1a6ce:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   1a6d3:	e8 c8 2f 00 00       	call   1d6a0 <hyperinterval::bounds::Bounds<T>::hull>
   1a6d8:	49 89 c4             	mov    %rax,%r12
   1a6db:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1a6e0:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1a6e5:	4c 89 f6             	mov    %r14,%rsi
   1a6e8:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a6ef:	00 f0 7f 
   1a6f2:	4c 89 fa             	mov    %r15,%rdx
   1a6f5:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1a6fa:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1a6ff:	e8 0c 1c 00 00       	call   1c310 <hyperinterval::ieee::Format::mul>
   1a704:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1a709:	0f 85 c3 fa ff ff    	jne    1a1d2 <hyperinterval::float::F64Enclosure::corner_image+0x122>
   1a70f:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1a714:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
   1a719:	48 89 e7             	mov    %rsp,%rdi
   1a71c:	4c 89 f6             	mov    %r14,%rsi
   1a71f:	4c 89 fa             	mov    %r15,%rdx
   1a722:	e8 09 27 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1a727:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a72b:	0f 85 74 fd ff ff    	jne    1a4a5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a731:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a736:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a73b:	48 89 e7             	mov    %rsp,%rdi
   1a73e:	4c 89 f6             	mov    %r14,%rsi
   1a741:	4c 89 fa             	mov    %r15,%rdx
   1a744:	48 89 e9             	mov    %rbp,%rcx
   1a747:	e8 e4 26 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1a74c:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a750:	0f 85 4f fd ff ff    	jne    1a4a5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a756:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a75b:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
   1a760:	4c 89 c8             	mov    %r9,%rax
   1a763:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1a76a:	00 00 80 
   1a76d:	4c 09 c0             	or     %r8,%rax
   1a770:	4c 89 ca             	mov    %r9,%rdx
   1a773:	49 8d 78 ff          	lea    -0x1(%r8),%rdi
   1a777:	48 21 fa             	and    %rdi,%rdx
   1a77a:	4c 89 c6             	mov    %r8,%rsi
   1a77d:	48 29 d6             	sub    %rdx,%rsi
   1a780:	4d 85 c9             	test   %r9,%r9
   1a783:	48 0f 49 f0          	cmovns %rax,%rsi
   1a787:	48 89 c8             	mov    %rcx,%rax
   1a78a:	4c 09 c0             	or     %r8,%rax
   1a78d:	48 21 cf             	and    %rcx,%rdi
   1a790:	49 29 f8             	sub    %rdi,%r8
   1a793:	48 85 c9             	test   %rcx,%rcx
   1a796:	4c 0f 49 c0          	cmovns %rax,%r8
   1a79a:	4c 39 c6             	cmp    %r8,%rsi
   1a79d:	0f 87 08 fd ff ff    	ja     1a4ab <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   1a7a3:	4c 89 e7             	mov    %r12,%rdi
   1a7a6:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   1a7ab:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
   1a7b0:	e8 eb 2e 00 00       	call   1d6a0 <hyperinterval::bounds::Bounds<T>::hull>
   1a7b5:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1a7bc:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1a7c0:	48 89 53 10          	mov    %rdx,0x10(%rbx)
   1a7c4:	e9 ed fc ff ff       	jmp    1a4b6 <hyperinterval::float::F64Enclosure::corner_image+0x406>
   1a7c9:	cc                   	int3
   1a7ca:	cc                   	int3
   1a7cb:	cc                   	int3
   1a7cc:	cc                   	int3
   1a7cd:	cc                   	int3
   1a7ce:	cc                   	int3
   1a7cf:	cc                   	int3

hyperinterval::float::F64Enclosure::intersection:
   1a7d0:	48 89 f8             	mov    %rdi,%rax
   1a7d3:	45 31 c9             	xor    %r9d,%r9d
   1a7d6:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1a7da:	0f 85 e1 00 00 00    	jne    1a8c1 <hyperinterval::float::F64Enclosure::intersection+0xf1>
   1a7e0:	f6 02 01             	testb  $0x1,(%rdx)
   1a7e3:	0f 84 cc 00 00 00    	je     1a8b5 <hyperinterval::float::F64Enclosure::intersection+0xe5>
   1a7e9:	41 56                	push   %r14
   1a7eb:	53                   	push   %rbx
   1a7ec:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   1a7f0:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1a7f4:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   1a7fb:	00 00 80 
   1a7fe:	49 89 ca             	mov    %rcx,%r10
   1a801:	49 09 fa             	or     %rdi,%r10
   1a804:	4c 8d 4f ff          	lea    -0x1(%rdi),%r9
   1a808:	49 89 cb             	mov    %rcx,%r11
   1a80b:	4d 21 cb             	and    %r9,%r11
   1a80e:	48 89 fb             	mov    %rdi,%rbx
   1a811:	4c 29 db             	sub    %r11,%rbx
   1a814:	48 85 c9             	test   %rcx,%rcx
   1a817:	49 0f 49 da          	cmovns %r10,%rbx
   1a81b:	4d 89 c2             	mov    %r8,%r10
   1a81e:	49 09 fa             	or     %rdi,%r10
   1a821:	4d 89 c3             	mov    %r8,%r11
   1a824:	4d 21 cb             	and    %r9,%r11
   1a827:	49 89 fe             	mov    %rdi,%r14
   1a82a:	4d 29 de             	sub    %r11,%r14
   1a82d:	4d 85 c0             	test   %r8,%r8
   1a830:	4d 0f 49 f2          	cmovns %r10,%r14
   1a834:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1a838:	4c 39 f3             	cmp    %r14,%rbx
   1a83b:	49 0f 42 c8          	cmovb  %r8,%rcx
   1a83f:	4c 8b 46 10          	mov    0x10(%rsi),%r8
   1a843:	4c 89 c6             	mov    %r8,%rsi
   1a846:	48 09 fe             	or     %rdi,%rsi
   1a849:	4d 89 c2             	mov    %r8,%r10
   1a84c:	4d 21 ca             	and    %r9,%r10
   1a84f:	49 89 fb             	mov    %rdi,%r11
   1a852:	4d 29 d3             	sub    %r10,%r11
   1a855:	4d 85 c0             	test   %r8,%r8
   1a858:	4c 0f 49 de          	cmovns %rsi,%r11
   1a85c:	48 89 d6             	mov    %rdx,%rsi
   1a85f:	48 09 fe             	or     %rdi,%rsi
   1a862:	49 89 d2             	mov    %rdx,%r10
   1a865:	4d 21 ca             	and    %r9,%r10
   1a868:	48 89 fb             	mov    %rdi,%rbx
   1a86b:	4c 29 d3             	sub    %r10,%rbx
   1a86e:	48 85 d2             	test   %rdx,%rdx
   1a871:	48 0f 49 de          	cmovns %rsi,%rbx
   1a875:	49 39 db             	cmp    %rbx,%r11
   1a878:	4c 0f 47 c2          	cmova  %rdx,%r8
   1a87c:	48 89 ca             	mov    %rcx,%rdx
   1a87f:	48 09 fa             	or     %rdi,%rdx
   1a882:	48 89 ce             	mov    %rcx,%rsi
   1a885:	4c 21 ce             	and    %r9,%rsi
   1a888:	49 89 fa             	mov    %rdi,%r10
   1a88b:	49 29 f2             	sub    %rsi,%r10
   1a88e:	48 85 c9             	test   %rcx,%rcx
   1a891:	4c 0f 49 d2          	cmovns %rdx,%r10
   1a895:	4c 89 c2             	mov    %r8,%rdx
   1a898:	48 09 fa             	or     %rdi,%rdx
   1a89b:	4d 21 c1             	and    %r8,%r9
   1a89e:	4c 29 cf             	sub    %r9,%rdi
   1a8a1:	4d 85 c0             	test   %r8,%r8
   1a8a4:	48 0f 49 fa          	cmovns %rdx,%rdi
   1a8a8:	45 31 c9             	xor    %r9d,%r9d
   1a8ab:	49 39 fa             	cmp    %rdi,%r10
   1a8ae:	41 0f 96 c1          	setbe  %r9b
   1a8b2:	5b                   	pop    %rbx
   1a8b3:	41 5e                	pop    %r14
   1a8b5:	4c 89 08             	mov    %r9,(%rax)
   1a8b8:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1a8bc:	4c 89 40 10          	mov    %r8,0x10(%rax)
   1a8c0:	c3                   	ret
   1a8c1:	4c 89 08             	mov    %r9,(%rax)
   1a8c4:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1a8c8:	4c 89 40 10          	mov    %r8,0x10(%rax)
   1a8cc:	c3                   	ret
   1a8cd:	cc                   	int3
   1a8ce:	cc                   	int3
   1a8cf:	cc                   	int3

hyperinterval::float::F64Enclosure::contains_point:
   1a8d0:	41 56                	push   %r14
   1a8d2:	53                   	push   %rbx
   1a8d3:	48 83 ec 18          	sub    $0x18,%rsp
   1a8d7:	49 89 fe             	mov    %rdi,%r14
   1a8da:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1a8e1:	00 00 80 
   1a8e4:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1a8e9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a8ee:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1a8f5:	00 f0 7f 
   1a8f8:	48 89 de             	mov    %rbx,%rsi
   1a8fb:	e8 30 25 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1a900:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1a905:	3c 01                	cmp    $0x1,%al
   1a907:	75 0d                	jne    1a916 <hyperinterval::float::F64Enclosure::contains_point+0x46>
   1a909:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   1a90e:	48 83 c4 18          	add    $0x18,%rsp
   1a912:	5b                   	pop    %rbx
   1a913:	41 5e                	pop    %r14
   1a915:	c3                   	ret
   1a916:	49 83 3e 01          	cmpq   $0x1,(%r14)
   1a91a:	75 44                	jne    1a960 <hyperinterval::float::F64Enclosure::contains_point+0x90>
   1a91c:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1a921:	49 8b 56 08          	mov    0x8(%r14),%rdx
   1a925:	48 89 d7             	mov    %rdx,%rdi
   1a928:	48 09 df             	or     %rbx,%rdi
   1a92b:	48 8d 4b ff          	lea    -0x1(%rbx),%rcx
   1a92f:	49 89 d0             	mov    %rdx,%r8
   1a932:	49 21 c8             	and    %rcx,%r8
   1a935:	49 89 d9             	mov    %rbx,%r9
   1a938:	4d 29 c1             	sub    %r8,%r9
   1a93b:	48 85 d2             	test   %rdx,%rdx
   1a93e:	4c 0f 49 cf          	cmovns %rdi,%r9
   1a942:	48 89 f7             	mov    %rsi,%rdi
   1a945:	48 09 df             	or     %rbx,%rdi
   1a948:	49 89 f0             	mov    %rsi,%r8
   1a94b:	49 21 c8             	and    %rcx,%r8
   1a94e:	48 89 da             	mov    %rbx,%rdx
   1a951:	4c 29 c2             	sub    %r8,%rdx
   1a954:	48 85 f6             	test   %rsi,%rsi
   1a957:	48 0f 49 d7          	cmovns %rdi,%rdx
   1a95b:	49 39 d1             	cmp    %rdx,%r9
   1a95e:	76 0a                	jbe    1a96a <hyperinterval::float::F64Enclosure::contains_point+0x9a>
   1a960:	31 d2                	xor    %edx,%edx
   1a962:	48 83 c4 18          	add    $0x18,%rsp
   1a966:	5b                   	pop    %rbx
   1a967:	41 5e                	pop    %r14
   1a969:	c3                   	ret
   1a96a:	49 8b 76 10          	mov    0x10(%r14),%rsi
   1a96e:	48 89 f7             	mov    %rsi,%rdi
   1a971:	48 09 df             	or     %rbx,%rdi
   1a974:	48 21 f1             	and    %rsi,%rcx
   1a977:	48 29 cb             	sub    %rcx,%rbx
   1a97a:	48 85 f6             	test   %rsi,%rsi
   1a97d:	48 0f 49 df          	cmovns %rdi,%rbx
   1a981:	48 39 da             	cmp    %rbx,%rdx
   1a984:	0f 96 c2             	setbe  %dl
   1a987:	48 83 c4 18          	add    $0x18,%rsp
   1a98b:	5b                   	pop    %rbx
   1a98c:	41 5e                	pop    %r14
   1a98e:	c3                   	ret
   1a98f:	cc                   	int3

hyperinterval::float::F64Enclosure::interior_subset_of:
   1a990:	b0 01                	mov    $0x1,%al
   1a992:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1a996:	0f 85 93 00 00 00    	jne    1aa2f <hyperinterval::float::F64Enclosure::interior_subset_of+0x9f>
   1a99c:	f6 06 01             	testb  $0x1,(%rsi)
   1a99f:	0f 84 88 00 00 00    	je     1aa2d <hyperinterval::float::F64Enclosure::interior_subset_of+0x9d>
   1a9a5:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1a9a9:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1a9ad:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1a9b4:	00 00 80 
   1a9b7:	4d 89 c1             	mov    %r8,%r9
   1a9ba:	49 09 c1             	or     %rax,%r9
   1a9bd:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1a9c1:	4d 89 c2             	mov    %r8,%r10
   1a9c4:	49 21 ca             	and    %rcx,%r10
   1a9c7:	49 89 c3             	mov    %rax,%r11
   1a9ca:	4d 29 d3             	sub    %r10,%r11
   1a9cd:	4d 85 c0             	test   %r8,%r8
   1a9d0:	4d 0f 49 d9          	cmovns %r9,%r11
   1a9d4:	49 89 d0             	mov    %rdx,%r8
   1a9d7:	49 09 c0             	or     %rax,%r8
   1a9da:	49 89 d1             	mov    %rdx,%r9
   1a9dd:	49 21 c9             	and    %rcx,%r9
   1a9e0:	49 89 c2             	mov    %rax,%r10
   1a9e3:	4d 29 ca             	sub    %r9,%r10
   1a9e6:	48 85 d2             	test   %rdx,%rdx
   1a9e9:	4d 0f 49 d0          	cmovns %r8,%r10
   1a9ed:	4d 39 d3             	cmp    %r10,%r11
   1a9f0:	73 3b                	jae    1aa2d <hyperinterval::float::F64Enclosure::interior_subset_of+0x9d>
   1a9f2:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1a9f6:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1a9fa:	48 89 d7             	mov    %rdx,%rdi
   1a9fd:	48 09 c7             	or     %rax,%rdi
   1aa00:	49 89 d0             	mov    %rdx,%r8
   1aa03:	49 21 c8             	and    %rcx,%r8
   1aa06:	49 89 c1             	mov    %rax,%r9
   1aa09:	4d 29 c1             	sub    %r8,%r9
   1aa0c:	48 85 d2             	test   %rdx,%rdx
   1aa0f:	4c 0f 49 cf          	cmovns %rdi,%r9
   1aa13:	48 89 f2             	mov    %rsi,%rdx
   1aa16:	48 09 c2             	or     %rax,%rdx
   1aa19:	48 21 f1             	and    %rsi,%rcx
   1aa1c:	48 29 c8             	sub    %rcx,%rax
   1aa1f:	48 85 f6             	test   %rsi,%rsi
   1aa22:	48 0f 49 c2          	cmovns %rdx,%rax
   1aa26:	49 39 c1             	cmp    %rax,%r9
   1aa29:	0f 92 c0             	setb   %al
   1aa2c:	c3                   	ret
   1aa2d:	31 c0                	xor    %eax,%eax
   1aa2f:	c3                   	ret

hyperinterval::float::F64Enclosure::add:
   1aa30:	48 89 f8             	mov    %rdi,%rax
   1aa33:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1aa37:	0f 85 cb 00 00 00    	jne    1ab08 <hyperinterval::float::F64Enclosure::add+0xd8>
   1aa3d:	f6 02 01             	testb  $0x1,(%rdx)
   1aa40:	0f 84 c2 00 00 00    	je     1ab08 <hyperinterval::float::F64Enclosure::add+0xd8>
   1aa46:	55                   	push   %rbp
   1aa47:	41 57                	push   %r15
   1aa49:	41 56                	push   %r14
   1aa4b:	41 55                	push   %r13
   1aa4d:	41 54                	push   %r12
   1aa4f:	53                   	push   %rbx
   1aa50:	48 83 ec 18          	sub    $0x18,%rsp
   1aa54:	48 89 c5             	mov    %rax,%rbp
   1aa57:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1aa5b:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1aa5f:	4c 8b 62 10          	mov    0x10(%rdx),%r12
   1aa63:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1aa6a:	00 00 80 
   1aa6d:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1aa74:	00 f0 7f 
   1aa77:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   1aa7b:	48 89 e7             	mov    %rsp,%rdi
   1aa7e:	48 89 de             	mov    %rbx,%rsi
   1aa81:	4c 89 f2             	mov    %r14,%rdx
   1aa84:	e8 97 11 00 00       	call   1bc20 <hyperinterval::ieee::Format::add>
   1aa89:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1aa8d:	74 57                	je     1aae6 <hyperinterval::float::F64Enclosure::add+0xb6>
   1aa8f:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1aa94:	48 89 e7             	mov    %rsp,%rdi
   1aa97:	48 89 de             	mov    %rbx,%rsi
   1aa9a:	4c 89 f2             	mov    %r14,%rdx
   1aa9d:	4c 89 f9             	mov    %r15,%rcx
   1aaa0:	4d 89 e0             	mov    %r12,%r8
   1aaa3:	e8 78 11 00 00       	call   1bc20 <hyperinterval::ieee::Format::add>
   1aaa8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1aaac:	74 38                	je     1aae6 <hyperinterval::float::F64Enclosure::add+0xb6>
   1aaae:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1aab3:	48 89 e7             	mov    %rsp,%rdi
   1aab6:	48 89 de             	mov    %rbx,%rsi
   1aab9:	4c 89 f2             	mov    %r14,%rdx
   1aabc:	4c 89 e9             	mov    %r13,%rcx
   1aabf:	e8 6c 23 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1aac4:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1aac8:	74 1c                	je     1aae6 <hyperinterval::float::F64Enclosure::add+0xb6>
   1aaca:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1aacf:	48 89 e7             	mov    %rsp,%rdi
   1aad2:	48 89 de             	mov    %rbx,%rsi
   1aad5:	4c 89 f2             	mov    %r14,%rdx
   1aad8:	4c 89 f9             	mov    %r15,%rcx
   1aadb:	e8 50 23 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1aae0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1aae4:	75 2a                	jne    1ab10 <hyperinterval::float::F64Enclosure::add+0xe0>
   1aae6:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   1aaeb:	48 89 e8             	mov    %rbp,%rax
   1aaee:	88 4d 08             	mov    %cl,0x8(%rbp)
   1aaf1:	48 c7 45 00 02 00 00 	movq   $0x2,0x0(%rbp)
   1aaf8:	00 
   1aaf9:	48 83 c4 18          	add    $0x18,%rsp
   1aafd:	5b                   	pop    %rbx
   1aafe:	41 5c                	pop    %r12
   1ab00:	41 5d                	pop    %r13
   1ab02:	41 5e                	pop    %r14
   1ab04:	41 5f                	pop    %r15
   1ab06:	5d                   	pop    %rbp
   1ab07:	c3                   	ret
   1ab08:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   1ab0f:	c3                   	ret
   1ab10:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1ab15:	4c 89 e0             	mov    %r12,%rax
   1ab18:	48 09 d8             	or     %rbx,%rax
   1ab1b:	48 8d 53 ff          	lea    -0x1(%rbx),%rdx
   1ab1f:	4c 89 e6             	mov    %r12,%rsi
   1ab22:	48 21 d6             	and    %rdx,%rsi
   1ab25:	48 89 df             	mov    %rbx,%rdi
   1ab28:	48 29 f7             	sub    %rsi,%rdi
   1ab2b:	4d 85 e4             	test   %r12,%r12
   1ab2e:	48 0f 49 f8          	cmovns %rax,%rdi
   1ab32:	48 89 c8             	mov    %rcx,%rax
   1ab35:	48 09 d8             	or     %rbx,%rax
   1ab38:	48 21 ca             	and    %rcx,%rdx
   1ab3b:	48 29 d3             	sub    %rdx,%rbx
   1ab3e:	48 85 c9             	test   %rcx,%rcx
   1ab41:	48 0f 49 d8          	cmovns %rax,%rbx
   1ab45:	48 39 df             	cmp    %rbx,%rdi
   1ab48:	48 89 e8             	mov    %rbp,%rax
   1ab4b:	76 0d                	jbe    1ab5a <hyperinterval::float::F64Enclosure::add+0x12a>
   1ab4d:	c6 40 08 01          	movb   $0x1,0x8(%rax)
   1ab51:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1ab58:	eb 9f                	jmp    1aaf9 <hyperinterval::float::F64Enclosure::add+0xc9>
   1ab5a:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   1ab61:	4c 89 60 08          	mov    %r12,0x8(%rax)
   1ab65:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1ab69:	eb 8e                	jmp    1aaf9 <hyperinterval::float::F64Enclosure::add+0xc9>
   1ab6b:	cc                   	int3
   1ab6c:	cc                   	int3
   1ab6d:	cc                   	int3
   1ab6e:	cc                   	int3
   1ab6f:	cc                   	int3

hyperinterval::float::F64Enclosure::div:
   1ab70:	53                   	push   %rbx
   1ab71:	48 89 fb             	mov    %rdi,%rbx
   1ab74:	83 3a 01             	cmpl   $0x1,(%rdx)
   1ab77:	75 1e                	jne    1ab97 <hyperinterval::float::F64Enclosure::div+0x27>
   1ab79:	48 83 7a 08 00       	cmpq   $0x0,0x8(%rdx)
   1ab7e:	7f 17                	jg     1ab97 <hyperinterval::float::F64Enclosure::div+0x27>
   1ab80:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1ab84:	48 85 c0             	test   %rax,%rax
   1ab87:	0f 99 c1             	setns  %cl
   1ab8a:	48 d1 e0             	shl    $1,%rax
   1ab8d:	48 85 c0             	test   %rax,%rax
   1ab90:	0f 94 c0             	sete   %al
   1ab93:	08 c8                	or     %cl,%al
   1ab95:	75 12                	jne    1aba9 <hyperinterval::float::F64Enclosure::div+0x39>
   1ab97:	48 89 df             	mov    %rbx,%rdi
   1ab9a:	b9 01 00 00 00       	mov    $0x1,%ecx
   1ab9f:	e8 0c f5 ff ff       	call   1a0b0 <hyperinterval::float::F64Enclosure::corner_image>
   1aba4:	48 89 d8             	mov    %rbx,%rax
   1aba7:	5b                   	pop    %rbx
   1aba8:	c3                   	ret
   1aba9:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
   1abad:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1abb4:	48 89 d8             	mov    %rbx,%rax
   1abb7:	5b                   	pop    %rbx
   1abb8:	c3                   	ret
   1abb9:	cc                   	int3
   1abba:	cc                   	int3
   1abbb:	cc                   	int3
   1abbc:	cc                   	int3
   1abbd:	cc                   	int3
   1abbe:	cc                   	int3
   1abbf:	cc                   	int3

hyperinterval::float::F64Enclosure::new:
   1abc0:	41 57                	push   %r15
   1abc2:	41 56                	push   %r14
   1abc4:	41 54                	push   %r12
   1abc6:	53                   	push   %rbx
   1abc7:	48 83 ec 18          	sub    $0x18,%rsp
   1abcb:	f2 0f 11 4c 24 10    	movsd  %xmm1,0x10(%rsp)
   1abd1:	48 89 fb             	mov    %rdi,%rbx
   1abd4:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1abdb:	00 00 80 
   1abde:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1abe5:	00 f0 7f 
   1abe8:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1abed:	48 89 e7             	mov    %rsp,%rdi
   1abf0:	4c 89 f6             	mov    %r14,%rsi
   1abf3:	4c 89 fa             	mov    %r15,%rdx
   1abf6:	e8 35 22 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1abfb:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1abff:	74 24                	je     1ac25 <hyperinterval::float::F64Enclosure::new+0x65>
   1ac01:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1ac06:	f3 0f 7e 44 24 10    	movq   0x10(%rsp),%xmm0
   1ac0c:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1ac11:	48 89 e7             	mov    %rsp,%rdi
   1ac14:	4c 89 f6             	mov    %r14,%rsi
   1ac17:	4c 89 fa             	mov    %r15,%rdx
   1ac1a:	e8 11 22 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1ac1f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1ac23:	75 1e                	jne    1ac43 <hyperinterval::float::F64Enclosure::new+0x83>
   1ac25:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1ac2a:	88 43 08             	mov    %al,0x8(%rbx)
   1ac2d:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1ac34:	48 89 d8             	mov    %rbx,%rax
   1ac37:	48 83 c4 18          	add    $0x18,%rsp
   1ac3b:	5b                   	pop    %rbx
   1ac3c:	41 5c                	pop    %r12
   1ac3e:	41 5e                	pop    %r14
   1ac40:	41 5f                	pop    %r15
   1ac42:	c3                   	ret
   1ac43:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1ac48:	4c 89 e1             	mov    %r12,%rcx
   1ac4b:	4c 09 f1             	or     %r14,%rcx
   1ac4e:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   1ac52:	4c 89 e6             	mov    %r12,%rsi
   1ac55:	48 21 d6             	and    %rdx,%rsi
   1ac58:	4c 89 f7             	mov    %r14,%rdi
   1ac5b:	48 29 f7             	sub    %rsi,%rdi
   1ac5e:	4d 85 e4             	test   %r12,%r12
   1ac61:	48 0f 49 f9          	cmovns %rcx,%rdi
   1ac65:	48 89 c1             	mov    %rax,%rcx
   1ac68:	4c 09 f1             	or     %r14,%rcx
   1ac6b:	48 21 c2             	and    %rax,%rdx
   1ac6e:	49 29 d6             	sub    %rdx,%r14
   1ac71:	48 85 c0             	test   %rax,%rax
   1ac74:	4c 0f 49 f1          	cmovns %rcx,%r14
   1ac78:	4c 39 f7             	cmp    %r14,%rdi
   1ac7b:	76 06                	jbe    1ac83 <hyperinterval::float::F64Enclosure::new+0xc3>
   1ac7d:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1ac81:	eb aa                	jmp    1ac2d <hyperinterval::float::F64Enclosure::new+0x6d>
   1ac83:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1ac8a:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   1ac8e:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1ac92:	eb a0                	jmp    1ac34 <hyperinterval::float::F64Enclosure::new+0x74>
   1ac94:	cc                   	int3
   1ac95:	cc                   	int3
   1ac96:	cc                   	int3
   1ac97:	cc                   	int3
   1ac98:	cc                   	int3
   1ac99:	cc                   	int3
   1ac9a:	cc                   	int3
   1ac9b:	cc                   	int3
   1ac9c:	cc                   	int3
   1ac9d:	cc                   	int3
   1ac9e:	cc                   	int3
   1ac9f:	cc                   	int3

hyperinterval::float::F64Enclosure::sub:
   1aca0:	53                   	push   %rbx
   1aca1:	48 83 ec 20          	sub    $0x20,%rsp
   1aca5:	48 89 fb             	mov    %rdi,%rbx
   1aca8:	48 83 3a 01          	cmpq   $0x1,(%rdx)
   1acac:	75 30                	jne    1acde <hyperinterval::float::F64Enclosure::sub+0x3e>
   1acae:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   1acb2:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1acb6:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1acbd:	00 00 80 
   1acc0:	48 89 d1             	mov    %rdx,%rcx
   1acc3:	48 31 c1             	xor    %rax,%rcx
   1acc6:	48 85 d2             	test   %rdx,%rdx
   1acc9:	48 0f 44 ca          	cmove  %rdx,%rcx
   1accd:	48 31 f8             	xor    %rdi,%rax
   1acd0:	48 85 ff             	test   %rdi,%rdi
   1acd3:	48 0f 44 c7          	cmove  %rdi,%rax
   1acd7:	ba 01 00 00 00       	mov    $0x1,%edx
   1acdc:	eb 02                	jmp    1ace0 <hyperinterval::float::F64Enclosure::sub+0x40>
   1acde:	31 d2                	xor    %edx,%edx
   1ace0:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1ace5:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
   1acea:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1acef:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
   1acf4:	48 89 df             	mov    %rbx,%rdi
   1acf7:	ff 15 13 48 04 00    	call   *0x44813(%rip)        # 5f510 <_DYNAMIC+0x300>
   1acfd:	48 89 d8             	mov    %rbx,%rax
   1ad00:	48 83 c4 20          	add    $0x20,%rsp
   1ad04:	5b                   	pop    %rbx
   1ad05:	c3                   	ret
   1ad06:	cc                   	int3
   1ad07:	cc                   	int3
   1ad08:	cc                   	int3
   1ad09:	cc                   	int3
   1ad0a:	cc                   	int3
   1ad0b:	cc                   	int3
   1ad0c:	cc                   	int3
   1ad0d:	cc                   	int3
   1ad0e:	cc                   	int3
   1ad0f:	cc                   	int3

hyperinterval::float::F64Enclosure::hull:
   1ad10:	48 89 f8             	mov    %rdi,%rax
   1ad13:	4c 8b 02             	mov    (%rdx),%r8
   1ad16:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   1ad1a:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
   1ad1e:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1ad22:	0f 85 a7 00 00 00    	jne    1adcf <hyperinterval::float::F64Enclosure::hull+0xbf>
   1ad28:	4c 8b 56 08          	mov    0x8(%rsi),%r10
   1ad2c:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1ad30:	ba 01 00 00 00       	mov    $0x1,%edx
   1ad35:	49 83 f8 01          	cmp    $0x1,%r8
   1ad39:	0f 85 9f 00 00 00    	jne    1adde <hyperinterval::float::F64Enclosure::hull+0xce>
   1ad3f:	41 57                	push   %r15
   1ad41:	41 56                	push   %r14
   1ad43:	53                   	push   %rbx
   1ad44:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1ad4b:	00 00 80 
   1ad4e:	4d 89 d3             	mov    %r10,%r11
   1ad51:	4d 09 c3             	or     %r8,%r11
   1ad54:	4d 8d 48 ff          	lea    -0x1(%r8),%r9
   1ad58:	4c 89 d3             	mov    %r10,%rbx
   1ad5b:	4c 21 cb             	and    %r9,%rbx
   1ad5e:	4d 89 c6             	mov    %r8,%r14
   1ad61:	49 29 de             	sub    %rbx,%r14
   1ad64:	4d 85 d2             	test   %r10,%r10
   1ad67:	4d 0f 49 f3          	cmovns %r11,%r14
   1ad6b:	49 89 fb             	mov    %rdi,%r11
   1ad6e:	4d 09 c3             	or     %r8,%r11
   1ad71:	48 89 fb             	mov    %rdi,%rbx
   1ad74:	4c 21 cb             	and    %r9,%rbx
   1ad77:	4d 89 c7             	mov    %r8,%r15
   1ad7a:	49 29 df             	sub    %rbx,%r15
   1ad7d:	48 85 ff             	test   %rdi,%rdi
   1ad80:	4d 0f 49 fb          	cmovns %r11,%r15
   1ad84:	4d 39 fe             	cmp    %r15,%r14
   1ad87:	49 0f 46 fa          	cmovbe %r10,%rdi
   1ad8b:	49 89 f2             	mov    %rsi,%r10
   1ad8e:	4d 09 c2             	or     %r8,%r10
   1ad91:	49 89 f3             	mov    %rsi,%r11
   1ad94:	4d 21 cb             	and    %r9,%r11
   1ad97:	4c 89 c3             	mov    %r8,%rbx
   1ad9a:	4c 29 db             	sub    %r11,%rbx
   1ad9d:	48 85 f6             	test   %rsi,%rsi
   1ada0:	49 0f 49 da          	cmovns %r10,%rbx
   1ada4:	49 89 ca             	mov    %rcx,%r10
   1ada7:	4d 09 c2             	or     %r8,%r10
   1adaa:	49 21 c9             	and    %rcx,%r9
   1adad:	4d 29 c8             	sub    %r9,%r8
   1adb0:	48 85 c9             	test   %rcx,%rcx
   1adb3:	4d 0f 49 c2          	cmovns %r10,%r8
   1adb7:	4c 39 c3             	cmp    %r8,%rbx
   1adba:	48 0f 43 ce          	cmovae %rsi,%rcx
   1adbe:	5b                   	pop    %rbx
   1adbf:	41 5e                	pop    %r14
   1adc1:	41 5f                	pop    %r15
   1adc3:	48 89 10             	mov    %rdx,(%rax)
   1adc6:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1adca:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1adce:	c3                   	ret
   1adcf:	4c 89 c2             	mov    %r8,%rdx
   1add2:	48 89 10             	mov    %rdx,(%rax)
   1add5:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1add9:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1addd:	c3                   	ret
   1adde:	48 89 f1             	mov    %rsi,%rcx
   1ade1:	4c 89 d7             	mov    %r10,%rdi
   1ade4:	48 89 10             	mov    %rdx,(%rax)
   1ade7:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1adeb:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1adef:	c3                   	ret

hyperinterval::float::F64Enclosure::sqrt:
   1adf0:	48 89 f8             	mov    %rdi,%rax
   1adf3:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1adf7:	75 3a                	jne    1ae33 <hyperinterval::float::F64Enclosure::sqrt+0x43>
   1adf9:	55                   	push   %rbp
   1adfa:	41 57                	push   %r15
   1adfc:	41 56                	push   %r14
   1adfe:	41 55                	push   %r13
   1ae00:	41 54                	push   %r12
   1ae02:	53                   	push   %rbx
   1ae03:	48 83 ec 28          	sub    $0x28,%rsp
   1ae07:	4c 8b 76 08          	mov    0x8(%rsi),%r14
   1ae0b:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1ae0f:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1ae16:	00 00 80 
   1ae19:	48 8d 6b ff          	lea    -0x1(%rbx),%rbp
   1ae1d:	4d 85 ff             	test   %r15,%r15
   1ae20:	79 1d                	jns    1ae3f <hyperinterval::float::F64Enclosure::sqrt+0x4f>
   1ae22:	4c 89 f9             	mov    %r15,%rcx
   1ae25:	48 21 e9             	and    %rbp,%rcx
   1ae28:	74 15                	je     1ae3f <hyperinterval::float::F64Enclosure::sqrt+0x4f>
   1ae2a:	c6 40 08 05          	movb   $0x5,0x8(%rax)
   1ae2e:	e9 da 00 00 00       	jmp    1af0d <hyperinterval::float::F64Enclosure::sqrt+0x11d>
   1ae33:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   1ae3a:	c6 40 18 00          	movb   $0x0,0x18(%rax)
   1ae3e:	c3                   	ret
   1ae3f:	48 89 04 24          	mov    %rax,(%rsp)
   1ae43:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1ae4a:	00 f0 7f 
   1ae4d:	4d 85 f6             	test   %r14,%r14
   1ae50:	0f 98 c0             	sets   %al
   1ae53:	49 85 ee             	test   %rbp,%r14
   1ae56:	41 0f 95 c5          	setne  %r13b
   1ae5a:	31 c9                	xor    %ecx,%ecx
   1ae5c:	41 20 c5             	and    %al,%r13b
   1ae5f:	49 0f 44 ce          	cmove  %r14,%rcx
   1ae63:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1ae68:	48 89 de             	mov    %rbx,%rsi
   1ae6b:	49 89 d4             	mov    %rdx,%r12
   1ae6e:	e8 6d 15 00 00       	call   1c3e0 <hyperinterval::ieee::Format::sqrt>
   1ae73:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   1ae78:	74 11                	je     1ae8b <hyperinterval::float::F64Enclosure::sqrt+0x9b>
   1ae7a:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   1ae7f:	48 8b 04 24          	mov    (%rsp),%rax
   1ae83:	88 48 08             	mov    %cl,0x8(%rax)
   1ae86:	e9 82 00 00 00       	jmp    1af0d <hyperinterval::float::F64Enclosure::sqrt+0x11d>
   1ae8b:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1ae90:	4d 39 fe             	cmp    %r15,%r14
   1ae93:	75 0a                	jne    1ae9f <hyperinterval::float::F64Enclosure::sqrt+0xaf>
   1ae95:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
   1ae9a:	4d 89 e6             	mov    %r12,%r14
   1ae9d:	eb 2c                	jmp    1aecb <hyperinterval::float::F64Enclosure::sqrt+0xdb>
   1ae9f:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   1aea4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1aea9:	48 89 de             	mov    %rbx,%rsi
   1aeac:	4d 89 e6             	mov    %r12,%r14
   1aeaf:	4c 89 e2             	mov    %r12,%rdx
   1aeb2:	4c 89 f9             	mov    %r15,%rcx
   1aeb5:	e8 26 15 00 00       	call   1c3e0 <hyperinterval::ieee::Format::sqrt>
   1aeba:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1aebf:	74 b9                	je     1ae7a <hyperinterval::float::F64Enclosure::sqrt+0x8a>
   1aec1:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
   1aec6:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1aecb:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1aed0:	48 89 de             	mov    %rbx,%rsi
   1aed3:	4c 89 f2             	mov    %r14,%rdx
   1aed6:	e8 55 1f 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1aedb:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1aee0:	74 1f                	je     1af01 <hyperinterval::float::F64Enclosure::sqrt+0x111>
   1aee2:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1aee7:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1aeec:	48 89 de             	mov    %rbx,%rsi
   1aeef:	4c 89 f2             	mov    %r14,%rdx
   1aef2:	4c 89 f9             	mov    %r15,%rcx
   1aef5:	e8 36 1f 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1aefa:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1aeff:	75 22                	jne    1af23 <hyperinterval::float::F64Enclosure::sqrt+0x133>
   1af01:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   1af06:	48 8b 04 24          	mov    (%rsp),%rax
   1af0a:	88 50 08             	mov    %dl,0x8(%rax)
   1af0d:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1af14:	48 83 c4 28          	add    $0x28,%rsp
   1af18:	5b                   	pop    %rbx
   1af19:	41 5c                	pop    %r12
   1af1b:	41 5d                	pop    %r13
   1af1d:	41 5e                	pop    %r14
   1af1f:	41 5f                	pop    %r15
   1af21:	5d                   	pop    %rbp
   1af22:	c3                   	ret
   1af23:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1af28:	4c 89 e0             	mov    %r12,%rax
   1af2b:	48 09 d8             	or     %rbx,%rax
   1af2e:	4c 89 e2             	mov    %r12,%rdx
   1af31:	48 21 ea             	and    %rbp,%rdx
   1af34:	48 89 de             	mov    %rbx,%rsi
   1af37:	48 29 d6             	sub    %rdx,%rsi
   1af3a:	4d 85 e4             	test   %r12,%r12
   1af3d:	48 0f 49 f0          	cmovns %rax,%rsi
   1af41:	48 89 c8             	mov    %rcx,%rax
   1af44:	48 09 d8             	or     %rbx,%rax
   1af47:	48 21 cd             	and    %rcx,%rbp
   1af4a:	48 29 eb             	sub    %rbp,%rbx
   1af4d:	48 85 c9             	test   %rcx,%rcx
   1af50:	48 0f 49 d8          	cmovns %rax,%rbx
   1af54:	b2 01                	mov    $0x1,%dl
   1af56:	48 39 de             	cmp    %rbx,%rsi
   1af59:	48 8b 04 24          	mov    (%rsp),%rax
   1af5d:	77 ab                	ja     1af0a <hyperinterval::float::F64Enclosure::sqrt+0x11a>
   1af5f:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   1af66:	4c 89 60 08          	mov    %r12,0x8(%rax)
   1af6a:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1af6e:	44 88 68 18          	mov    %r13b,0x18(%rax)
   1af72:	eb a0                	jmp    1af14 <hyperinterval::float::F64Enclosure::sqrt+0x124>
   1af74:	cc                   	int3
   1af75:	cc                   	int3
   1af76:	cc                   	int3
   1af77:	cc                   	int3
   1af78:	cc                   	int3
   1af79:	cc                   	int3
   1af7a:	cc                   	int3
   1af7b:	cc                   	int3
   1af7c:	cc                   	int3
   1af7d:	cc                   	int3
   1af7e:	cc                   	int3
   1af7f:	cc                   	int3

hyperinterval::float::F64Enclosure::point:
   1af80:	53                   	push   %rbx
   1af81:	48 83 ec 10          	sub    $0x10,%rsp
   1af85:	48 89 fb             	mov    %rdi,%rbx
   1af88:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1af8d:	48 89 e7             	mov    %rsp,%rdi
   1af90:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1af97:	00 00 80 
   1af9a:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1afa1:	00 f0 7f 
   1afa4:	e8 87 1e 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1afa9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1afad:	75 0f                	jne    1afbe <hyperinterval::float::F64Enclosure::point+0x3e>
   1afaf:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1afb4:	88 43 08             	mov    %al,0x8(%rbx)
   1afb7:	b8 02 00 00 00       	mov    $0x2,%eax
   1afbc:	eb 12                	jmp    1afd0 <hyperinterval::float::F64Enclosure::point+0x50>
   1afbe:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1afc3:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1afc7:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1afcb:	b8 01 00 00 00       	mov    $0x1,%eax
   1afd0:	48 89 03             	mov    %rax,(%rbx)
   1afd3:	48 89 d8             	mov    %rbx,%rax
   1afd6:	48 83 c4 10          	add    $0x10,%rsp
   1afda:	5b                   	pop    %rbx
   1afdb:	c3                   	ret
   1afdc:	cc                   	int3
   1afdd:	cc                   	int3
   1afde:	cc                   	int3
   1afdf:	cc                   	int3

hyperinterval::float::F64Enclosure::signs:
   1afe0:	83 3f 01             	cmpl   $0x1,(%rdi)
   1afe3:	75 6b                	jne    1b050 <hyperinterval::float::F64Enclosure::signs+0x70>
   1afe5:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1afec:	00 00 80 
   1afef:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   1aff3:	48 8b 47 10          	mov    0x10(%rdi),%rax
   1aff7:	48 89 ca             	mov    %rcx,%rdx
   1affa:	4c 09 c2             	or     %r8,%rdx
   1affd:	49 8d 70 ff          	lea    -0x1(%r8),%rsi
   1b001:	49 89 c9             	mov    %rcx,%r9
   1b004:	49 21 f1             	and    %rsi,%r9
   1b007:	4c 89 c7             	mov    %r8,%rdi
   1b00a:	4c 29 cf             	sub    %r9,%rdi
   1b00d:	48 85 c9             	test   %rcx,%rcx
   1b010:	48 0f 49 fa          	cmovns %rdx,%rdi
   1b014:	31 d2                	xor    %edx,%edx
   1b016:	48 85 ff             	test   %rdi,%rdi
   1b019:	0f 99 c1             	setns  %cl
   1b01c:	4c 39 c7             	cmp    %r8,%rdi
   1b01f:	77 1f                	ja     1b040 <hyperinterval::float::F64Enclosure::signs+0x60>
   1b021:	48 85 ff             	test   %rdi,%rdi
   1b024:	40 0f 99 c7          	setns  %dil
   1b028:	40 80 cf 02          	or     $0x2,%dil
   1b02c:	48 85 f0             	test   %rsi,%rax
   1b02f:	88 ca                	mov    %cl,%dl
   1b031:	40 0f b6 cf          	movzbl %dil,%ecx
   1b035:	0f 44 d1             	cmove  %ecx,%edx
   1b038:	48 85 c0             	test   %rax,%rax
   1b03b:	0f 49 d1             	cmovns %ecx,%edx
   1b03e:	89 d1                	mov    %edx,%ecx
   1b040:	8d 51 04             	lea    0x4(%rcx),%edx
   1b043:	48 85 c0             	test   %rax,%rax
   1b046:	0f b6 c9             	movzbl %cl,%ecx
   1b049:	0f b6 c2             	movzbl %dl,%eax
   1b04c:	0f 4e c1             	cmovle %ecx,%eax
   1b04f:	c3                   	ret
   1b050:	31 c0                	xor    %eax,%eax
   1b052:	c3                   	ret
   1b053:	cc                   	int3
   1b054:	cc                   	int3
   1b055:	cc                   	int3
   1b056:	cc                   	int3
   1b057:	cc                   	int3
   1b058:	cc                   	int3
   1b059:	cc                   	int3
   1b05a:	cc                   	int3
   1b05b:	cc                   	int3
   1b05c:	cc                   	int3
   1b05d:	cc                   	int3
   1b05e:	cc                   	int3
   1b05f:	cc                   	int3

hyperinterval::float::F64Enclosure::affine:
   1b060:	55                   	push   %rbp
   1b061:	41 57                	push   %r15
   1b063:	41 56                	push   %r14
   1b065:	41 55                	push   %r13
   1b067:	41 54                	push   %r12
   1b069:	53                   	push   %rbx
   1b06a:	48 83 ec 28          	sub    $0x28,%rsp
   1b06e:	f2 0f 11 4c 24 18    	movsd  %xmm1,0x18(%rsp)
   1b074:	49 89 f5             	mov    %rsi,%r13
   1b077:	48 89 fb             	mov    %rdi,%rbx
   1b07a:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b081:	00 00 80 
   1b084:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1b08b:	00 f0 7f 
   1b08e:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1b093:	48 89 e7             	mov    %rsp,%rdi
   1b096:	4c 89 f6             	mov    %r14,%rsi
   1b099:	4c 89 fa             	mov    %r15,%rdx
   1b09c:	e8 8f 1d 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1b0a1:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b0a5:	74 24                	je     1b0cb <hyperinterval::float::F64Enclosure::affine+0x6b>
   1b0a7:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1b0ac:	f3 0f 7e 44 24 18    	movq   0x18(%rsp),%xmm0
   1b0b2:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1b0b7:	48 89 e7             	mov    %rsp,%rdi
   1b0ba:	4c 89 f6             	mov    %r14,%rsi
   1b0bd:	4c 89 fa             	mov    %r15,%rdx
   1b0c0:	e8 6b 1d 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1b0c5:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b0c9:	75 21                	jne    1b0ec <hyperinterval::float::F64Enclosure::affine+0x8c>
   1b0cb:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1b0d0:	88 43 08             	mov    %al,0x8(%rbx)
   1b0d3:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b0da:	48 89 d8             	mov    %rbx,%rax
   1b0dd:	48 83 c4 28          	add    $0x28,%rsp
   1b0e1:	5b                   	pop    %rbx
   1b0e2:	41 5c                	pop    %r12
   1b0e4:	41 5d                	pop    %r13
   1b0e6:	41 5e                	pop    %r14
   1b0e8:	41 5f                	pop    %r15
   1b0ea:	5d                   	pop    %rbp
   1b0eb:	c3                   	ret
   1b0ec:	41 f6 45 00 01       	testb  $0x1,0x0(%r13)
   1b0f1:	0f 84 0a 01 00 00    	je     1b201 <hyperinterval::float::F64Enclosure::affine+0x1a1>
   1b0f7:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1b0fc:	49 8b 45 10          	mov    0x10(%r13),%rax
   1b100:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1b105:	49 8b 4d 08          	mov    0x8(%r13),%rcx
   1b109:	48 89 e7             	mov    %rsp,%rdi
   1b10c:	4c 89 f6             	mov    %r14,%rsi
   1b10f:	4c 89 fa             	mov    %r15,%rdx
   1b112:	4d 89 e0             	mov    %r12,%r8
   1b115:	49 89 e9             	mov    %rbp,%r9
   1b118:	e8 23 19 00 00       	call   1ca40 <hyperinterval::ieee::Format::affine>
   1b11d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b121:	74 a8                	je     1b0cb <hyperinterval::float::F64Enclosure::affine+0x6b>
   1b123:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1b128:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1b12d:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1b132:	48 89 e7             	mov    %rsp,%rdi
   1b135:	4c 89 f6             	mov    %r14,%rsi
   1b138:	4c 89 fa             	mov    %r15,%rdx
   1b13b:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1b140:	4d 89 e0             	mov    %r12,%r8
   1b143:	49 89 e9             	mov    %rbp,%r9
   1b146:	e8 f5 18 00 00       	call   1ca40 <hyperinterval::ieee::Format::affine>
   1b14b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b14f:	0f 84 76 ff ff ff    	je     1b0cb <hyperinterval::float::F64Enclosure::affine+0x6b>
   1b155:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1b15a:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1b15f:	48 89 e7             	mov    %rsp,%rdi
   1b162:	4c 89 f6             	mov    %r14,%rsi
   1b165:	4c 89 fa             	mov    %r15,%rdx
   1b168:	4c 89 e9             	mov    %r13,%rcx
   1b16b:	e8 c0 1c 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1b170:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b174:	0f 84 51 ff ff ff    	je     1b0cb <hyperinterval::float::F64Enclosure::affine+0x6b>
   1b17a:	4d 89 e5             	mov    %r12,%r13
   1b17d:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1b182:	48 89 e7             	mov    %rsp,%rdi
   1b185:	4c 89 f6             	mov    %r14,%rsi
   1b188:	4c 89 fa             	mov    %r15,%rdx
   1b18b:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1b190:	e8 9b 1c 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1b195:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b199:	0f 84 2c ff ff ff    	je     1b0cb <hyperinterval::float::F64Enclosure::affine+0x6b>
   1b19f:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1b1a4:	4c 89 e0             	mov    %r12,%rax
   1b1a7:	4c 09 f0             	or     %r14,%rax
   1b1aa:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1b1ae:	4c 89 e2             	mov    %r12,%rdx
   1b1b1:	48 21 ca             	and    %rcx,%rdx
   1b1b4:	4c 89 f6             	mov    %r14,%rsi
   1b1b7:	48 29 d6             	sub    %rdx,%rsi
   1b1ba:	4d 85 e4             	test   %r12,%r12
   1b1bd:	48 0f 49 f0          	cmovns %rax,%rsi
   1b1c1:	4c 89 f8             	mov    %r15,%rax
   1b1c4:	4c 09 f0             	or     %r14,%rax
   1b1c7:	4c 21 f9             	and    %r15,%rcx
   1b1ca:	49 29 ce             	sub    %rcx,%r14
   1b1cd:	4d 85 ff             	test   %r15,%r15
   1b1d0:	4c 0f 49 f0          	cmovns %rax,%r14
   1b1d4:	b0 01                	mov    $0x1,%al
   1b1d6:	4c 39 f6             	cmp    %r14,%rsi
   1b1d9:	0f 87 f1 fe ff ff    	ja     1b0d0 <hyperinterval::float::F64Enclosure::affine+0x70>
   1b1df:	48 89 e7             	mov    %rsp,%rdi
   1b1e2:	4c 89 ee             	mov    %r13,%rsi
   1b1e5:	48 89 ea             	mov    %rbp,%rdx
   1b1e8:	e8 73 06 00 00       	call   1b860 <hyperinterval::float::F64Enclosure::from_bits>
   1b1ed:	48 8b 04 24          	mov    (%rsp),%rax
   1b1f1:	48 83 f8 02          	cmp    $0x2,%rax
   1b1f5:	75 16                	jne    1b20d <hyperinterval::float::F64Enclosure::affine+0x1ad>
   1b1f7:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1b1fc:	e9 cf fe ff ff       	jmp    1b0d0 <hyperinterval::float::F64Enclosure::affine+0x70>
   1b201:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1b208:	e9 cd fe ff ff       	jmp    1b0da <hyperinterval::float::F64Enclosure::affine+0x7a>
   1b20d:	83 f8 01             	cmp    $0x1,%eax
   1b210:	75 1b                	jne    1b22d <hyperinterval::float::F64Enclosure::affine+0x1cd>
   1b212:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1b217:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1b21c:	4c 89 e7             	mov    %r12,%rdi
   1b21f:	4c 89 fe             	mov    %r15,%rsi
   1b222:	e8 79 24 00 00       	call   1d6a0 <hyperinterval::bounds::Bounds<T>::hull>
   1b227:	49 89 c4             	mov    %rax,%r12
   1b22a:	49 89 d7             	mov    %rdx,%r15
   1b22d:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1b234:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   1b238:	4c 89 7b 10          	mov    %r15,0x10(%rbx)
   1b23c:	e9 99 fe ff ff       	jmp    1b0da <hyperinterval::float::F64Enclosure::affine+0x7a>
   1b241:	cc                   	int3
   1b242:	cc                   	int3
   1b243:	cc                   	int3
   1b244:	cc                   	int3
   1b245:	cc                   	int3
   1b246:	cc                   	int3
   1b247:	cc                   	int3
   1b248:	cc                   	int3
   1b249:	cc                   	int3
   1b24a:	cc                   	int3
   1b24b:	cc                   	int3
   1b24c:	cc                   	int3
   1b24d:	cc                   	int3
   1b24e:	cc                   	int3
   1b24f:	cc                   	int3

hyperinterval::float::F64Enclosure::square:
   1b250:	55                   	push   %rbp
   1b251:	41 57                	push   %r15
   1b253:	41 56                	push   %r14
   1b255:	41 55                	push   %r13
   1b257:	41 54                	push   %r12
   1b259:	53                   	push   %rbx
   1b25a:	48 83 ec 58          	sub    $0x58,%rsp
   1b25e:	48 89 fb             	mov    %rdi,%rbx
   1b261:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b265:	0f 85 0c 01 00 00    	jne    1b377 <hyperinterval::float::F64Enclosure::square+0x127>
   1b26b:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1b26f:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
   1b276:	00 00 80 
   1b279:	49 b8 00 00 00 00 00 	movabs $0x7ff0000000000000,%r8
   1b280:	00 f0 7f 
   1b283:	49 be ff ff ff ff ff 	movabs $0xfffffffffffff,%r14
   1b28a:	ff 0f 00 
   1b28d:	48 8b 56 08          	mov    0x8(%rsi),%rdx
   1b291:	48 89 d1             	mov    %rdx,%rcx
   1b294:	48 c1 e9 34          	shr    $0x34,%rcx
   1b298:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1b29e:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
   1b2a3:	4c 21 f2             	and    %r14,%rdx
   1b2a6:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   1b2aa:	48 85 c9             	test   %rcx,%rcx
   1b2ad:	48 89 e8             	mov    %rbp,%rax
   1b2b0:	48 0f 44 c1          	cmove  %rcx,%rax
   1b2b4:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1b2bb:	41 bd 9c f7 ff ff    	mov    $0xfffff79c,%r13d
   1b2c1:	41 0f 44 cd          	cmove  %r13d,%ecx
   1b2c5:	48 09 d0             	or     %rdx,%rax
   1b2c8:	48 f7 e0             	mul    %rax
   1b2cb:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1b2d0:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b2d5:	48 89 04 24          	mov    %rax,(%rsp)
   1b2d9:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1b2dd:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1b2e2:	48 89 e1             	mov    %rsp,%rcx
   1b2e5:	4c 89 e6             	mov    %r12,%rsi
   1b2e8:	4c 89 c2             	mov    %r8,%rdx
   1b2eb:	e8 80 1b 00 00       	call   1ce70 <hyperinterval::ieee::Format::rounded>
   1b2f0:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
   1b2f5:	75 79                	jne    1b370 <hyperinterval::float::F64Enclosure::square+0x120>
   1b2f7:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   1b2fc:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1b301:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   1b306:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1b30b:	4c 89 f8             	mov    %r15,%rax
   1b30e:	48 c1 e8 34          	shr    $0x34,%rax
   1b312:	25 ff 07 00 00       	and    $0x7ff,%eax
   1b317:	4c 89 7c 24 40       	mov    %r15,0x40(%rsp)
   1b31c:	4d 21 fe             	and    %r15,%r14
   1b31f:	48 85 c0             	test   %rax,%rax
   1b322:	48 0f 44 e8          	cmove  %rax,%rbp
   1b326:	8d 8c 00 9a f7 ff ff 	lea    -0x866(%rax,%rax,1),%ecx
   1b32d:	41 0f 44 cd          	cmove  %r13d,%ecx
   1b331:	4c 09 f5             	or     %r14,%rbp
   1b334:	48 89 e8             	mov    %rbp,%rax
   1b337:	48 f7 e5             	mul    %rbp
   1b33a:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1b33f:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b344:	48 89 04 24          	mov    %rax,(%rsp)
   1b348:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1b34c:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1b351:	48 89 e1             	mov    %rsp,%rcx
   1b354:	4c 89 e6             	mov    %r12,%rsi
   1b357:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1b35e:	00 f0 7f 
   1b361:	4c 89 fa             	mov    %r15,%rdx
   1b364:	e8 07 1b 00 00       	call   1ce70 <hyperinterval::ieee::Format::rounded>
   1b369:	80 7c 24 28 01       	cmpb   $0x1,0x28(%rsp)
   1b36e:	75 10                	jne    1b380 <hyperinterval::float::F64Enclosure::square+0x130>
   1b370:	0f b6 44 24 29       	movzbl 0x29(%rsp),%eax
   1b375:	eb 4f                	jmp    1b3c6 <hyperinterval::float::F64Enclosure::square+0x176>
   1b377:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1b37e:	eb 50                	jmp    1b3d0 <hyperinterval::float::F64Enclosure::square+0x180>
   1b380:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   1b385:	4c 8b 6c 24 38       	mov    0x38(%rsp),%r13
   1b38a:	48 89 e7             	mov    %rsp,%rdi
   1b38d:	4c 89 e6             	mov    %r12,%rsi
   1b390:	4c 89 fa             	mov    %r15,%rdx
   1b393:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1b398:	e8 93 1a 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1b39d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b3a1:	74 1e                	je     1b3c1 <hyperinterval::float::F64Enclosure::square+0x171>
   1b3a3:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1b3a8:	48 89 e7             	mov    %rsp,%rdi
   1b3ab:	4c 89 e6             	mov    %r12,%rsi
   1b3ae:	4c 89 fa             	mov    %r15,%rdx
   1b3b1:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1b3b6:	e8 75 1a 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1b3bb:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b3bf:	75 21                	jne    1b3e2 <hyperinterval::float::F64Enclosure::square+0x192>
   1b3c1:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1b3c6:	88 43 08             	mov    %al,0x8(%rbx)
   1b3c9:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b3d0:	48 89 d8             	mov    %rbx,%rax
   1b3d3:	48 83 c4 58          	add    $0x58,%rsp
   1b3d7:	5b                   	pop    %rbx
   1b3d8:	41 5c                	pop    %r12
   1b3da:	41 5d                	pop    %r13
   1b3dc:	41 5e                	pop    %r14
   1b3de:	41 5f                	pop    %r15
   1b3e0:	5d                   	pop    %rbp
   1b3e1:	c3                   	ret
   1b3e2:	4c 89 f1             	mov    %r14,%rcx
   1b3e5:	48 89 e8             	mov    %rbp,%rax
   1b3e8:	4c 09 e0             	or     %r12,%rax
   1b3eb:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
   1b3f0:	48 89 ee             	mov    %rbp,%rsi
   1b3f3:	4c 21 f6             	and    %r14,%rsi
   1b3f6:	4c 89 e2             	mov    %r12,%rdx
   1b3f9:	48 29 f2             	sub    %rsi,%rdx
   1b3fc:	48 85 ed             	test   %rbp,%rbp
   1b3ff:	48 0f 49 d0          	cmovns %rax,%rdx
   1b403:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   1b408:	48 89 f8             	mov    %rdi,%rax
   1b40b:	4c 09 e0             	or     %r12,%rax
   1b40e:	49 89 f8             	mov    %rdi,%r8
   1b411:	4d 21 f0             	and    %r14,%r8
   1b414:	4c 89 e6             	mov    %r12,%rsi
   1b417:	4c 29 c6             	sub    %r8,%rsi
   1b41a:	48 85 ff             	test   %rdi,%rdi
   1b41d:	48 0f 49 f0          	cmovns %rax,%rsi
   1b421:	b0 01                	mov    $0x1,%al
   1b423:	48 39 f2             	cmp    %rsi,%rdx
   1b426:	77 9e                	ja     1b3c6 <hyperinterval::float::F64Enclosure::square+0x176>
   1b428:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1b42d:	48 89 e7             	mov    %rsp,%rdi
   1b430:	4c 89 e6             	mov    %r12,%rsi
   1b433:	4c 89 fa             	mov    %r15,%rdx
   1b436:	e8 f5 19 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1b43b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b43f:	74 80                	je     1b3c1 <hyperinterval::float::F64Enclosure::square+0x171>
   1b441:	4c 89 e9             	mov    %r13,%rcx
   1b444:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1b449:	48 89 e7             	mov    %rsp,%rdi
   1b44c:	4c 89 e6             	mov    %r12,%rsi
   1b44f:	4c 89 fa             	mov    %r15,%rdx
   1b452:	e8 d9 19 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1b457:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b45b:	0f 84 60 ff ff ff    	je     1b3c1 <hyperinterval::float::F64Enclosure::square+0x171>
   1b461:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b466:	4c 89 e8             	mov    %r13,%rax
   1b469:	4c 09 e0             	or     %r12,%rax
   1b46c:	4c 89 ea             	mov    %r13,%rdx
   1b46f:	4c 21 f2             	and    %r14,%rdx
   1b472:	4c 89 e6             	mov    %r12,%rsi
   1b475:	48 29 d6             	sub    %rdx,%rsi
   1b478:	4d 85 ed             	test   %r13,%r13
   1b47b:	48 0f 49 f0          	cmovns %rax,%rsi
   1b47f:	48 89 c8             	mov    %rcx,%rax
   1b482:	4c 09 e0             	or     %r12,%rax
   1b485:	49 21 ce             	and    %rcx,%r14
   1b488:	4d 29 f4             	sub    %r14,%r12
   1b48b:	48 85 c9             	test   %rcx,%rcx
   1b48e:	4c 0f 49 e0          	cmovns %rax,%r12
   1b492:	b0 01                	mov    $0x1,%al
   1b494:	4c 39 e6             	cmp    %r12,%rsi
   1b497:	0f 87 29 ff ff ff    	ja     1b3c6 <hyperinterval::float::F64Enclosure::square+0x176>
   1b49d:	48 89 ef             	mov    %rbp,%rdi
   1b4a0:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1b4a5:	4c 89 ea             	mov    %r13,%rdx
   1b4a8:	e8 f3 21 00 00       	call   1d6a0 <hyperinterval::bounds::Bounds<T>::hull>
   1b4ad:	49 89 c5             	mov    %rax,%r13
   1b4b0:	49 89 d4             	mov    %rdx,%r12
   1b4b3:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1b4b8:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
   1b4bd:	31 d2                	xor    %edx,%edx
   1b4bf:	e8 6c 22 00 00       	call   1d730 <hyperinterval::bounds::Bounds<T>::signs>
   1b4c4:	a8 02                	test   $0x2,%al
   1b4c6:	75 14                	jne    1b4dc <hyperinterval::float::F64Enclosure::square+0x28c>
   1b4c8:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1b4cf:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1b4d3:	4c 89 63 10          	mov    %r12,0x10(%rbx)
   1b4d7:	e9 f4 fe ff ff       	jmp    1b3d0 <hyperinterval::float::F64Enclosure::square+0x180>
   1b4dc:	48 89 e7             	mov    %rsp,%rdi
   1b4df:	31 f6                	xor    %esi,%esi
   1b4e1:	31 d2                	xor    %edx,%edx
   1b4e3:	e8 78 03 00 00       	call   1b860 <hyperinterval::float::F64Enclosure::from_bits>
   1b4e8:	48 8b 04 24          	mov    (%rsp),%rax
   1b4ec:	48 83 f8 02          	cmp    $0x2,%rax
   1b4f0:	75 0a                	jne    1b4fc <hyperinterval::float::F64Enclosure::square+0x2ac>
   1b4f2:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1b4f7:	e9 ca fe ff ff       	jmp    1b3c6 <hyperinterval::float::F64Enclosure::square+0x176>
   1b4fc:	83 f8 01             	cmp    $0x1,%eax
   1b4ff:	75 c7                	jne    1b4c8 <hyperinterval::float::F64Enclosure::square+0x278>
   1b501:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1b506:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1b50b:	4c 89 ef             	mov    %r13,%rdi
   1b50e:	4c 89 e6             	mov    %r12,%rsi
   1b511:	e8 8a 21 00 00       	call   1d6a0 <hyperinterval::bounds::Bounds<T>::hull>
   1b516:	49 89 c5             	mov    %rax,%r13
   1b519:	49 89 d4             	mov    %rdx,%r12
   1b51c:	eb aa                	jmp    1b4c8 <hyperinterval::float::F64Enclosure::square+0x278>
   1b51e:	cc                   	int3
   1b51f:	cc                   	int3

hyperinterval::float::F64Enclosure::next_up:
   1b520:	41 57                	push   %r15
   1b522:	41 56                	push   %r14
   1b524:	53                   	push   %rbx
   1b525:	48 83 ec 10          	sub    $0x10,%rsp
   1b529:	48 89 fb             	mov    %rdi,%rbx
   1b52c:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b533:	00 00 80 
   1b536:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1b53d:	00 f0 7f 
   1b540:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1b545:	48 89 e7             	mov    %rsp,%rdi
   1b548:	4c 89 f6             	mov    %r14,%rsi
   1b54b:	4c 89 fa             	mov    %r15,%rdx
   1b54e:	e8 dd 18 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1b553:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b557:	75 0c                	jne    1b565 <hyperinterval::float::F64Enclosure::next_up+0x45>
   1b559:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1b55e:	88 43 01             	mov    %al,0x1(%rbx)
   1b561:	b0 01                	mov    $0x1,%al
   1b563:	eb 3c                	jmp    1b5a1 <hyperinterval::float::F64Enclosure::next_up+0x81>
   1b565:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b56a:	48 89 c1             	mov    %rax,%rcx
   1b56d:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1b571:	48 83 c9 01          	or     $0x1,%rcx
   1b575:	48 01 c1             	add    %rax,%rcx
   1b578:	48 89 e7             	mov    %rsp,%rdi
   1b57b:	4c 89 f6             	mov    %r14,%rsi
   1b57e:	4c 89 fa             	mov    %r15,%rdx
   1b581:	e8 aa 18 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1b586:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b58a:	75 08                	jne    1b594 <hyperinterval::float::F64Enclosure::next_up+0x74>
   1b58c:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
   1b590:	b0 01                	mov    $0x1,%al
   1b592:	eb 0d                	jmp    1b5a1 <hyperinterval::float::F64Enclosure::next_up+0x81>
   1b594:	f3 0f 7e 44 24 08    	movq   0x8(%rsp),%xmm0
   1b59a:	66 0f d6 43 08       	movq   %xmm0,0x8(%rbx)
   1b59f:	31 c0                	xor    %eax,%eax
   1b5a1:	88 03                	mov    %al,(%rbx)
   1b5a3:	48 89 d8             	mov    %rbx,%rax
   1b5a6:	48 83 c4 10          	add    $0x10,%rsp
   1b5aa:	5b                   	pop    %rbx
   1b5ab:	41 5e                	pop    %r14
   1b5ad:	41 5f                	pop    %r15
   1b5af:	c3                   	ret

hyperinterval::float::F64Enclosure::disjoint:
   1b5b0:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1b5b4:	b0 01                	mov    $0x1,%al
   1b5b6:	0f 84 93 00 00 00    	je     1b64f <hyperinterval::float::F64Enclosure::disjoint+0x9f>
   1b5bc:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1b5c0:	0f 84 89 00 00 00    	je     1b64f <hyperinterval::float::F64Enclosure::disjoint+0x9f>
   1b5c6:	53                   	push   %rbx
   1b5c7:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
   1b5ce:	00 00 80 
   1b5d1:	4c 8b 47 10          	mov    0x10(%rdi),%r8
   1b5d5:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
   1b5d9:	4d 89 c2             	mov    %r8,%r10
   1b5dc:	49 09 ca             	or     %rcx,%r10
   1b5df:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
   1b5e3:	4d 89 c3             	mov    %r8,%r11
   1b5e6:	49 21 d3             	and    %rdx,%r11
   1b5e9:	48 89 cb             	mov    %rcx,%rbx
   1b5ec:	4c 29 db             	sub    %r11,%rbx
   1b5ef:	4d 85 c0             	test   %r8,%r8
   1b5f2:	49 0f 49 da          	cmovns %r10,%rbx
   1b5f6:	4d 89 c8             	mov    %r9,%r8
   1b5f9:	49 09 c8             	or     %rcx,%r8
   1b5fc:	4d 89 ca             	mov    %r9,%r10
   1b5ff:	49 21 d2             	and    %rdx,%r10
   1b602:	49 89 cb             	mov    %rcx,%r11
   1b605:	4d 29 d3             	sub    %r10,%r11
   1b608:	4d 85 c9             	test   %r9,%r9
   1b60b:	4d 0f 49 d8          	cmovns %r8,%r11
   1b60f:	4c 39 db             	cmp    %r11,%rbx
   1b612:	5b                   	pop    %rbx
   1b613:	72 3a                	jb     1b64f <hyperinterval::float::F64Enclosure::disjoint+0x9f>
   1b615:	48 8b 47 08          	mov    0x8(%rdi),%rax
   1b619:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1b61d:	48 89 f7             	mov    %rsi,%rdi
   1b620:	48 09 cf             	or     %rcx,%rdi
   1b623:	49 89 f0             	mov    %rsi,%r8
   1b626:	49 21 d0             	and    %rdx,%r8
   1b629:	49 89 c9             	mov    %rcx,%r9
   1b62c:	4d 29 c1             	sub    %r8,%r9
   1b62f:	48 85 f6             	test   %rsi,%rsi
   1b632:	4c 0f 49 cf          	cmovns %rdi,%r9
   1b636:	48 89 c6             	mov    %rax,%rsi
   1b639:	48 09 ce             	or     %rcx,%rsi
   1b63c:	48 21 c2             	and    %rax,%rdx
   1b63f:	48 29 d1             	sub    %rdx,%rcx
   1b642:	48 85 c0             	test   %rax,%rax
   1b645:	48 0f 49 ce          	cmovns %rsi,%rcx
   1b649:	49 39 c9             	cmp    %rcx,%r9
   1b64c:	0f 92 c0             	setb   %al
   1b64f:	c3                   	ret

hyperinterval::float::F64Enclosure::expanded:
   1b650:	41 57                	push   %r15
   1b652:	41 56                	push   %r14
   1b654:	41 55                	push   %r13
   1b656:	41 54                	push   %r12
   1b658:	53                   	push   %rbx
   1b659:	48 83 ec 10          	sub    $0x10,%rsp
   1b65d:	48 89 fb             	mov    %rdi,%rbx
   1b660:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b664:	75 7f                	jne    1b6e5 <hyperinterval::float::F64Enclosure::expanded+0x95>
   1b666:	4c 8b 66 10          	mov    0x10(%rsi),%r12
   1b66a:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b671:	00 00 80 
   1b674:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1b67b:	00 f0 7f 
   1b67e:	48 8b 46 08          	mov    0x8(%rsi),%rax
   1b682:	48 89 c2             	mov    %rax,%rdx
   1b685:	4c 31 f2             	xor    %r14,%rdx
   1b688:	48 85 c0             	test   %rax,%rax
   1b68b:	48 0f 44 d0          	cmove  %rax,%rdx
   1b68f:	48 89 d1             	mov    %rdx,%rcx
   1b692:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1b696:	48 83 c9 01          	or     $0x1,%rcx
   1b69a:	48 01 d1             	add    %rdx,%rcx
   1b69d:	48 89 e7             	mov    %rsp,%rdi
   1b6a0:	4c 89 f6             	mov    %r14,%rsi
   1b6a3:	4c 89 fa             	mov    %r15,%rdx
   1b6a6:	e8 85 17 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1b6ab:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b6af:	75 27                	jne    1b6d8 <hyperinterval::float::F64Enclosure::expanded+0x88>
   1b6b1:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1b6b6:	4c 89 e1             	mov    %r12,%rcx
   1b6b9:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1b6bd:	48 83 c9 01          	or     $0x1,%rcx
   1b6c1:	4c 01 e1             	add    %r12,%rcx
   1b6c4:	48 89 e7             	mov    %rsp,%rdi
   1b6c7:	4c 89 f6             	mov    %r14,%rsi
   1b6ca:	4c 89 fa             	mov    %r15,%rdx
   1b6cd:	e8 5e 17 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1b6d2:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b6d6:	75 25                	jne    1b6fd <hyperinterval::float::F64Enclosure::expanded+0xad>
   1b6d8:	c6 43 08 03          	movb   $0x3,0x8(%rbx)
   1b6dc:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b6e3:	eb 07                	jmp    1b6ec <hyperinterval::float::F64Enclosure::expanded+0x9c>
   1b6e5:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1b6ec:	48 89 d8             	mov    %rbx,%rax
   1b6ef:	48 83 c4 10          	add    $0x10,%rsp
   1b6f3:	5b                   	pop    %rbx
   1b6f4:	41 5c                	pop    %r12
   1b6f6:	41 5d                	pop    %r13
   1b6f8:	41 5e                	pop    %r14
   1b6fa:	41 5f                	pop    %r15
   1b6fc:	c3                   	ret
   1b6fd:	4c 89 e9             	mov    %r13,%rcx
   1b700:	4c 31 f1             	xor    %r14,%rcx
   1b703:	4d 85 ed             	test   %r13,%r13
   1b706:	49 0f 44 cd          	cmove  %r13,%rcx
   1b70a:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1b70f:	48 89 e7             	mov    %rsp,%rdi
   1b712:	4c 89 f6             	mov    %r14,%rsi
   1b715:	4c 89 fa             	mov    %r15,%rdx
   1b718:	e8 13 17 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1b71d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b721:	74 1c                	je     1b73f <hyperinterval::float::F64Enclosure::expanded+0xef>
   1b723:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1b728:	48 89 e7             	mov    %rsp,%rdi
   1b72b:	4c 89 f6             	mov    %r14,%rsi
   1b72e:	4c 89 fa             	mov    %r15,%rdx
   1b731:	4c 89 e1             	mov    %r12,%rcx
   1b734:	e8 f7 16 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1b739:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b73d:	75 11                	jne    1b750 <hyperinterval::float::F64Enclosure::expanded+0x100>
   1b73f:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1b744:	88 43 08             	mov    %al,0x8(%rbx)
   1b747:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b74e:	eb 9c                	jmp    1b6ec <hyperinterval::float::F64Enclosure::expanded+0x9c>
   1b750:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b755:	4c 89 e9             	mov    %r13,%rcx
   1b758:	4c 09 f1             	or     %r14,%rcx
   1b75b:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   1b75f:	4c 89 ee             	mov    %r13,%rsi
   1b762:	48 21 d6             	and    %rdx,%rsi
   1b765:	4c 89 f7             	mov    %r14,%rdi
   1b768:	48 29 f7             	sub    %rsi,%rdi
   1b76b:	4d 85 ed             	test   %r13,%r13
   1b76e:	48 0f 49 f9          	cmovns %rcx,%rdi
   1b772:	48 89 c1             	mov    %rax,%rcx
   1b775:	4c 09 f1             	or     %r14,%rcx
   1b778:	48 21 c2             	and    %rax,%rdx
   1b77b:	49 29 d6             	sub    %rdx,%r14
   1b77e:	48 85 c0             	test   %rax,%rax
   1b781:	4c 0f 49 f1          	cmovns %rcx,%r14
   1b785:	4c 39 f7             	cmp    %r14,%rdi
   1b788:	76 10                	jbe    1b79a <hyperinterval::float::F64Enclosure::expanded+0x14a>
   1b78a:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1b78e:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b795:	e9 52 ff ff ff       	jmp    1b6ec <hyperinterval::float::F64Enclosure::expanded+0x9c>
   1b79a:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1b7a1:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1b7a5:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1b7a9:	e9 3e ff ff ff       	jmp    1b6ec <hyperinterval::float::F64Enclosure::expanded+0x9c>
   1b7ae:	cc                   	int3
   1b7af:	cc                   	int3

hyperinterval::float::F64Enclosure::overlaps:
   1b7b0:	31 c0                	xor    %eax,%eax
   1b7b2:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1b7b6:	0f 84 94 00 00 00    	je     1b850 <hyperinterval::float::F64Enclosure::overlaps+0xa0>
   1b7bc:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1b7c0:	0f 84 8a 00 00 00    	je     1b850 <hyperinterval::float::F64Enclosure::overlaps+0xa0>
   1b7c6:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1b7cd:	00 00 80 
   1b7d0:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1b7d4:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1b7d8:	49 89 d1             	mov    %rdx,%r9
   1b7db:	49 09 c1             	or     %rax,%r9
   1b7de:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1b7e2:	49 89 d2             	mov    %rdx,%r10
   1b7e5:	49 21 ca             	and    %rcx,%r10
   1b7e8:	49 89 c3             	mov    %rax,%r11
   1b7eb:	4d 29 d3             	sub    %r10,%r11
   1b7ee:	48 85 d2             	test   %rdx,%rdx
   1b7f1:	4d 0f 49 d9          	cmovns %r9,%r11
   1b7f5:	4c 89 c2             	mov    %r8,%rdx
   1b7f8:	48 09 c2             	or     %rax,%rdx
   1b7fb:	4d 89 c1             	mov    %r8,%r9
   1b7fe:	49 21 c9             	and    %rcx,%r9
   1b801:	49 89 c2             	mov    %rax,%r10
   1b804:	4d 29 ca             	sub    %r9,%r10
   1b807:	4d 85 c0             	test   %r8,%r8
   1b80a:	4c 0f 49 d2          	cmovns %rdx,%r10
   1b80e:	4d 39 d3             	cmp    %r10,%r11
   1b811:	73 03                	jae    1b816 <hyperinterval::float::F64Enclosure::overlaps+0x66>
   1b813:	31 c0                	xor    %eax,%eax
   1b815:	c3                   	ret
   1b816:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1b81a:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1b81e:	48 89 f7             	mov    %rsi,%rdi
   1b821:	48 09 c7             	or     %rax,%rdi
   1b824:	49 89 f0             	mov    %rsi,%r8
   1b827:	49 21 c8             	and    %rcx,%r8
   1b82a:	49 89 c1             	mov    %rax,%r9
   1b82d:	4d 29 c1             	sub    %r8,%r9
   1b830:	48 85 f6             	test   %rsi,%rsi
   1b833:	4c 0f 49 cf          	cmovns %rdi,%r9
   1b837:	48 89 d6             	mov    %rdx,%rsi
   1b83a:	48 09 c6             	or     %rax,%rsi
   1b83d:	48 21 d1             	and    %rdx,%rcx
   1b840:	48 29 c8             	sub    %rcx,%rax
   1b843:	48 85 d2             	test   %rdx,%rdx
   1b846:	48 0f 49 c6          	cmovns %rsi,%rax
   1b84a:	49 39 c1             	cmp    %rax,%r9
   1b84d:	0f 93 c0             	setae  %al
   1b850:	c3                   	ret
   1b851:	cc                   	int3
   1b852:	cc                   	int3
   1b853:	cc                   	int3
   1b854:	cc                   	int3
   1b855:	cc                   	int3
   1b856:	cc                   	int3
   1b857:	cc                   	int3
   1b858:	cc                   	int3
   1b859:	cc                   	int3
   1b85a:	cc                   	int3
   1b85b:	cc                   	int3
   1b85c:	cc                   	int3
   1b85d:	cc                   	int3
   1b85e:	cc                   	int3
   1b85f:	cc                   	int3

hyperinterval::float::F64Enclosure::from_bits:
   1b860:	41 57                	push   %r15
   1b862:	41 56                	push   %r14
   1b864:	41 55                	push   %r13
   1b866:	41 54                	push   %r12
   1b868:	53                   	push   %rbx
   1b869:	48 83 ec 10          	sub    $0x10,%rsp
   1b86d:	49 89 d7             	mov    %rdx,%r15
   1b870:	48 89 f1             	mov    %rsi,%rcx
   1b873:	48 89 fb             	mov    %rdi,%rbx
   1b876:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b87d:	00 00 80 
   1b880:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1b887:	00 f0 7f 
   1b88a:	48 89 e7             	mov    %rsp,%rdi
   1b88d:	4c 89 f6             	mov    %r14,%rsi
   1b890:	4c 89 e2             	mov    %r12,%rdx
   1b893:	e8 98 15 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1b898:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b89c:	74 1c                	je     1b8ba <hyperinterval::float::F64Enclosure::from_bits+0x5a>
   1b89e:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1b8a3:	48 89 e7             	mov    %rsp,%rdi
   1b8a6:	4c 89 f6             	mov    %r14,%rsi
   1b8a9:	4c 89 e2             	mov    %r12,%rdx
   1b8ac:	4c 89 f9             	mov    %r15,%rcx
   1b8af:	e8 7c 15 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1b8b4:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b8b8:	75 1d                	jne    1b8d7 <hyperinterval::float::F64Enclosure::from_bits+0x77>
   1b8ba:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1b8bf:	88 43 08             	mov    %al,0x8(%rbx)
   1b8c2:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b8c9:	48 83 c4 10          	add    $0x10,%rsp
   1b8cd:	5b                   	pop    %rbx
   1b8ce:	41 5c                	pop    %r12
   1b8d0:	41 5d                	pop    %r13
   1b8d2:	41 5e                	pop    %r14
   1b8d4:	41 5f                	pop    %r15
   1b8d6:	c3                   	ret
   1b8d7:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b8dc:	4c 89 e9             	mov    %r13,%rcx
   1b8df:	4c 09 f1             	or     %r14,%rcx
   1b8e2:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   1b8e6:	4c 89 ee             	mov    %r13,%rsi
   1b8e9:	48 21 d6             	and    %rdx,%rsi
   1b8ec:	4c 89 f7             	mov    %r14,%rdi
   1b8ef:	48 29 f7             	sub    %rsi,%rdi
   1b8f2:	4d 85 ed             	test   %r13,%r13
   1b8f5:	48 0f 49 f9          	cmovns %rcx,%rdi
   1b8f9:	48 89 c1             	mov    %rax,%rcx
   1b8fc:	4c 09 f1             	or     %r14,%rcx
   1b8ff:	48 21 c2             	and    %rax,%rdx
   1b902:	49 29 d6             	sub    %rdx,%r14
   1b905:	48 85 c0             	test   %rax,%rax
   1b908:	4c 0f 49 f1          	cmovns %rcx,%r14
   1b90c:	4c 39 f7             	cmp    %r14,%rdi
   1b90f:	76 06                	jbe    1b917 <hyperinterval::float::F64Enclosure::from_bits+0xb7>
   1b911:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1b915:	eb ab                	jmp    1b8c2 <hyperinterval::float::F64Enclosure::from_bits+0x62>
   1b917:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1b91e:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1b922:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1b926:	eb a1                	jmp    1b8c9 <hyperinterval::float::F64Enclosure::from_bits+0x69>
   1b928:	cc                   	int3
   1b929:	cc                   	int3
   1b92a:	cc                   	int3
   1b92b:	cc                   	int3
   1b92c:	cc                   	int3
   1b92d:	cc                   	int3
   1b92e:	cc                   	int3
   1b92f:	cc                   	int3

hyperinterval::float::F64Enclosure::max_image:
   1b930:	48 89 f8             	mov    %rdi,%rax
   1b933:	45 31 c0             	xor    %r8d,%r8d
   1b936:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b93a:	0f 85 ab 00 00 00    	jne    1b9eb <hyperinterval::float::F64Enclosure::max_image+0xbb>
   1b940:	f6 02 01             	testb  $0x1,(%rdx)
   1b943:	0f 84 96 00 00 00    	je     1b9df <hyperinterval::float::F64Enclosure::max_image+0xaf>
   1b949:	41 56                	push   %r14
   1b94b:	53                   	push   %rbx
   1b94c:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
   1b950:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
   1b954:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
   1b958:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b95f:	00 00 80 
   1b962:	49 89 fa             	mov    %rdi,%r10
   1b965:	49 09 f2             	or     %rsi,%r10
   1b968:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   1b96c:	49 89 fb             	mov    %rdi,%r11
   1b96f:	4d 21 c3             	and    %r8,%r11
   1b972:	48 89 f3             	mov    %rsi,%rbx
   1b975:	4c 29 db             	sub    %r11,%rbx
   1b978:	48 85 ff             	test   %rdi,%rdi
   1b97b:	49 0f 49 da          	cmovns %r10,%rbx
   1b97f:	4d 89 ca             	mov    %r9,%r10
   1b982:	49 09 f2             	or     %rsi,%r10
   1b985:	4d 89 cb             	mov    %r9,%r11
   1b988:	4d 21 c3             	and    %r8,%r11
   1b98b:	49 89 f6             	mov    %rsi,%r14
   1b98e:	4d 29 de             	sub    %r11,%r14
   1b991:	4d 85 c9             	test   %r9,%r9
   1b994:	4d 0f 49 f2          	cmovns %r10,%r14
   1b998:	4c 39 f3             	cmp    %r14,%rbx
   1b99b:	49 0f 42 f9          	cmovb  %r9,%rdi
   1b99f:	49 89 c9             	mov    %rcx,%r9
   1b9a2:	49 09 f1             	or     %rsi,%r9
   1b9a5:	49 89 ca             	mov    %rcx,%r10
   1b9a8:	4d 21 c2             	and    %r8,%r10
   1b9ab:	49 89 f3             	mov    %rsi,%r11
   1b9ae:	4d 29 d3             	sub    %r10,%r11
   1b9b1:	48 85 c9             	test   %rcx,%rcx
   1b9b4:	4d 0f 49 d9          	cmovns %r9,%r11
   1b9b8:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1b9bc:	49 89 d1             	mov    %rdx,%r9
   1b9bf:	49 09 f1             	or     %rsi,%r9
   1b9c2:	49 21 d0             	and    %rdx,%r8
   1b9c5:	4c 29 c6             	sub    %r8,%rsi
   1b9c8:	48 85 d2             	test   %rdx,%rdx
   1b9cb:	49 0f 49 f1          	cmovns %r9,%rsi
   1b9cf:	49 39 f3             	cmp    %rsi,%r11
   1b9d2:	48 0f 42 ca          	cmovb  %rdx,%rcx
   1b9d6:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1b9dc:	5b                   	pop    %rbx
   1b9dd:	41 5e                	pop    %r14
   1b9df:	4c 89 00             	mov    %r8,(%rax)
   1b9e2:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1b9e6:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1b9ea:	c3                   	ret
   1b9eb:	4c 89 00             	mov    %r8,(%rax)
   1b9ee:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1b9f2:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1b9f6:	c3                   	ret
   1b9f7:	cc                   	int3
   1b9f8:	cc                   	int3
   1b9f9:	cc                   	int3
   1b9fa:	cc                   	int3
   1b9fb:	cc                   	int3
   1b9fc:	cc                   	int3
   1b9fd:	cc                   	int3
   1b9fe:	cc                   	int3
   1b9ff:	cc                   	int3

hyperinterval::float::F64Enclosure::min_image:
   1ba00:	48 89 f8             	mov    %rdi,%rax
   1ba03:	45 31 c0             	xor    %r8d,%r8d
   1ba06:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1ba0a:	0f 85 ab 00 00 00    	jne    1babb <hyperinterval::float::F64Enclosure::min_image+0xbb>
   1ba10:	f6 02 01             	testb  $0x1,(%rdx)
   1ba13:	0f 84 96 00 00 00    	je     1baaf <hyperinterval::float::F64Enclosure::min_image+0xaf>
   1ba19:	41 56                	push   %r14
   1ba1b:	53                   	push   %rbx
   1ba1c:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
   1ba20:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1ba24:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
   1ba28:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
   1ba2c:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1ba33:	00 00 80 
   1ba36:	49 89 fa             	mov    %rdi,%r10
   1ba39:	49 09 f2             	or     %rsi,%r10
   1ba3c:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   1ba40:	49 89 fb             	mov    %rdi,%r11
   1ba43:	4d 21 c3             	and    %r8,%r11
   1ba46:	48 89 f3             	mov    %rsi,%rbx
   1ba49:	4c 29 db             	sub    %r11,%rbx
   1ba4c:	48 85 ff             	test   %rdi,%rdi
   1ba4f:	49 0f 49 da          	cmovns %r10,%rbx
   1ba53:	4d 89 ca             	mov    %r9,%r10
   1ba56:	49 09 f2             	or     %rsi,%r10
   1ba59:	4d 89 cb             	mov    %r9,%r11
   1ba5c:	4d 21 c3             	and    %r8,%r11
   1ba5f:	49 89 f6             	mov    %rsi,%r14
   1ba62:	4d 29 de             	sub    %r11,%r14
   1ba65:	4d 85 c9             	test   %r9,%r9
   1ba68:	4d 0f 49 f2          	cmovns %r10,%r14
   1ba6c:	4c 39 f3             	cmp    %r14,%rbx
   1ba6f:	49 0f 47 f9          	cmova  %r9,%rdi
   1ba73:	49 89 c9             	mov    %rcx,%r9
   1ba76:	49 09 f1             	or     %rsi,%r9
   1ba79:	49 89 ca             	mov    %rcx,%r10
   1ba7c:	4d 21 c2             	and    %r8,%r10
   1ba7f:	49 89 f3             	mov    %rsi,%r11
   1ba82:	4d 29 d3             	sub    %r10,%r11
   1ba85:	48 85 c9             	test   %rcx,%rcx
   1ba88:	4d 0f 49 d9          	cmovns %r9,%r11
   1ba8c:	49 89 d1             	mov    %rdx,%r9
   1ba8f:	49 09 f1             	or     %rsi,%r9
   1ba92:	49 21 d0             	and    %rdx,%r8
   1ba95:	4c 29 c6             	sub    %r8,%rsi
   1ba98:	48 85 d2             	test   %rdx,%rdx
   1ba9b:	49 0f 49 f1          	cmovns %r9,%rsi
   1ba9f:	49 39 f3             	cmp    %rsi,%r11
   1baa2:	48 0f 47 ca          	cmova  %rdx,%rcx
   1baa6:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1baac:	5b                   	pop    %rbx
   1baad:	41 5e                	pop    %r14
   1baaf:	4c 89 00             	mov    %r8,(%rax)
   1bab2:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1bab6:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1baba:	c3                   	ret
   1babb:	4c 89 00             	mov    %r8,(%rax)
   1babe:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1bac2:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1bac6:	c3                   	ret
   1bac7:	cc                   	int3
   1bac8:	cc                   	int3
   1bac9:	cc                   	int3
   1baca:	cc                   	int3
   1bacb:	cc                   	int3
   1bacc:	cc                   	int3
   1bacd:	cc                   	int3
   1bace:	cc                   	int3
   1bacf:	cc                   	int3

hyperinterval::float::F64Enclosure::next_down:
   1bad0:	41 57                	push   %r15
   1bad2:	41 56                	push   %r14
   1bad4:	53                   	push   %rbx
   1bad5:	48 83 ec 10          	sub    $0x10,%rsp
   1bad9:	48 89 fb             	mov    %rdi,%rbx
   1badc:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1bae3:	00 00 80 
   1bae6:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1baed:	00 f0 7f 
   1baf0:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1baf5:	48 89 e7             	mov    %rsp,%rdi
   1baf8:	4c 89 f6             	mov    %r14,%rsi
   1bafb:	4c 89 fa             	mov    %r15,%rdx
   1bafe:	e8 2d 13 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1bb03:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bb07:	75 0c                	jne    1bb15 <hyperinterval::float::F64Enclosure::next_down+0x45>
   1bb09:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1bb0e:	88 43 01             	mov    %al,0x1(%rbx)
   1bb11:	b0 01                	mov    $0x1,%al
   1bb13:	eb 51                	jmp    1bb66 <hyperinterval::float::F64Enclosure::next_down+0x96>
   1bb15:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1bb1a:	48 89 c2             	mov    %rax,%rdx
   1bb1d:	4c 31 f2             	xor    %r14,%rdx
   1bb20:	48 85 c0             	test   %rax,%rax
   1bb23:	48 0f 44 d0          	cmove  %rax,%rdx
   1bb27:	48 89 d1             	mov    %rdx,%rcx
   1bb2a:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1bb2e:	48 83 c9 01          	or     $0x1,%rcx
   1bb32:	48 01 d1             	add    %rdx,%rcx
   1bb35:	48 89 e7             	mov    %rsp,%rdi
   1bb38:	4c 89 f6             	mov    %r14,%rsi
   1bb3b:	4c 89 fa             	mov    %r15,%rdx
   1bb3e:	e8 ed 12 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1bb43:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bb47:	75 08                	jne    1bb51 <hyperinterval::float::F64Enclosure::next_down+0x81>
   1bb49:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
   1bb4d:	b0 01                	mov    $0x1,%al
   1bb4f:	eb 15                	jmp    1bb66 <hyperinterval::float::F64Enclosure::next_down+0x96>
   1bb51:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1bb56:	49 31 c6             	xor    %rax,%r14
   1bb59:	48 85 c0             	test   %rax,%rax
   1bb5c:	4c 0f 44 f0          	cmove  %rax,%r14
   1bb60:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1bb64:	31 c0                	xor    %eax,%eax
   1bb66:	88 03                	mov    %al,(%rbx)
   1bb68:	48 89 d8             	mov    %rbx,%rax
   1bb6b:	48 83 c4 10          	add    $0x10,%rsp
   1bb6f:	5b                   	pop    %rbx
   1bb70:	41 5e                	pop    %r14
   1bb72:	41 5f                	pop    %r15
   1bb74:	c3                   	ret
   1bb75:	cc                   	int3
   1bb76:	cc                   	int3
   1bb77:	cc                   	int3
   1bb78:	cc                   	int3
   1bb79:	cc                   	int3
   1bb7a:	cc                   	int3
   1bb7b:	cc                   	int3
   1bb7c:	cc                   	int3
   1bb7d:	cc                   	int3
   1bb7e:	cc                   	int3
   1bb7f:	cc                   	int3

hyperinterval::float::F64Enclosure::subset_of:
   1bb80:	b0 01                	mov    $0x1,%al
   1bb82:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1bb86:	75 54                	jne    1bbdc <hyperinterval::float::F64Enclosure::subset_of+0x5c>
   1bb88:	f6 06 01             	testb  $0x1,(%rsi)
   1bb8b:	74 4d                	je     1bbda <hyperinterval::float::F64Enclosure::subset_of+0x5a>
   1bb8d:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1bb91:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1bb95:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1bb9c:	00 00 80 
   1bb9f:	4d 89 c1             	mov    %r8,%r9
   1bba2:	49 09 c1             	or     %rax,%r9
   1bba5:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1bba9:	4d 89 c2             	mov    %r8,%r10
   1bbac:	49 21 ca             	and    %rcx,%r10
   1bbaf:	49 89 c3             	mov    %rax,%r11
   1bbb2:	4d 29 d3             	sub    %r10,%r11
   1bbb5:	4d 85 c0             	test   %r8,%r8
   1bbb8:	4d 0f 49 d9          	cmovns %r9,%r11
   1bbbc:	49 89 d0             	mov    %rdx,%r8
   1bbbf:	49 09 c0             	or     %rax,%r8
   1bbc2:	49 89 d1             	mov    %rdx,%r9
   1bbc5:	49 21 c9             	and    %rcx,%r9
   1bbc8:	49 89 c2             	mov    %rax,%r10
   1bbcb:	4d 29 ca             	sub    %r9,%r10
   1bbce:	48 85 d2             	test   %rdx,%rdx
   1bbd1:	4d 0f 49 d0          	cmovns %r8,%r10
   1bbd5:	4d 39 d3             	cmp    %r10,%r11
   1bbd8:	76 03                	jbe    1bbdd <hyperinterval::float::F64Enclosure::subset_of+0x5d>
   1bbda:	31 c0                	xor    %eax,%eax
   1bbdc:	c3                   	ret
   1bbdd:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1bbe1:	48 89 d7             	mov    %rdx,%rdi
   1bbe4:	48 09 c7             	or     %rax,%rdi
   1bbe7:	49 89 d0             	mov    %rdx,%r8
   1bbea:	49 21 c8             	and    %rcx,%r8
   1bbed:	49 89 c1             	mov    %rax,%r9
   1bbf0:	4d 29 c1             	sub    %r8,%r9
   1bbf3:	48 85 d2             	test   %rdx,%rdx
   1bbf6:	4c 0f 49 cf          	cmovns %rdi,%r9
   1bbfa:	48 8b 56 10          	mov    0x10(%rsi),%rdx
   1bbfe:	48 89 d6             	mov    %rdx,%rsi
   1bc01:	48 09 c6             	or     %rax,%rsi
   1bc04:	48 21 d1             	and    %rdx,%rcx
   1bc07:	48 29 c8             	sub    %rcx,%rax
   1bc0a:	48 85 d2             	test   %rdx,%rdx
   1bc0d:	48 0f 49 c6          	cmovns %rsi,%rax
   1bc11:	49 39 c1             	cmp    %rax,%r9
   1bc14:	0f 96 c0             	setbe  %al
   1bc17:	c3                   	ret
   1bc18:	cc                   	int3
   1bc19:	cc                   	int3
   1bc1a:	cc                   	int3
   1bc1b:	cc                   	int3
   1bc1c:	cc                   	int3
   1bc1d:	cc                   	int3
   1bc1e:	cc                   	int3
   1bc1f:	cc                   	int3

hyperinterval::ieee::Format::add:
   1bc20:	55                   	push   %rbp
   1bc21:	41 57                	push   %r15
   1bc23:	41 56                	push   %r14
   1bc25:	41 55                	push   %r13
   1bc27:	41 54                	push   %r12
   1bc29:	53                   	push   %rbx
   1bc2a:	48 83 ec 38          	sub    $0x38,%rsp
   1bc2e:	48 89 fb             	mov    %rdi,%rbx
   1bc31:	48 85 c9             	test   %rcx,%rcx
   1bc34:	0f 84 48 01 00 00    	je     1bd82 <hyperinterval::ieee::Format::add+0x162>
   1bc3a:	49 89 c9             	mov    %rcx,%r9
   1bc3d:	4d 85 c0             	test   %r8,%r8
   1bc40:	0f 84 46 01 00 00    	je     1bd8c <hyperinterval::ieee::Format::add+0x16c>
   1bc46:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
   1bc4b:	bf 40 00 00 00       	mov    $0x40,%edi
   1bc50:	f3 48 0f bc fa       	tzcnt  %rdx,%rdi
   1bc55:	4d 89 ca             	mov    %r9,%r10
   1bc58:	49 21 d2             	and    %rdx,%r10
   1bc5b:	89 f9                	mov    %edi,%ecx
   1bc5d:	49 d3 ea             	shr    %cl,%r10
   1bc60:	bb 01 00 00 00       	mov    $0x1,%ebx
   1bc65:	48 d3 e3             	shl    %cl,%rbx
   1bc68:	4c 8d 73 ff          	lea    -0x1(%rbx),%r14
   1bc6c:	4d 89 f7             	mov    %r14,%r15
   1bc6f:	4d 21 cf             	and    %r9,%r15
   1bc72:	4d 85 d2             	test   %r10,%r10
   1bc75:	b8 01 00 00 00       	mov    $0x1,%eax
   1bc7a:	45 89 d3             	mov    %r10d,%r11d
   1bc7d:	44 0f 44 d8          	cmove  %eax,%r11d
   1bc81:	4c 0f 45 d3          	cmovne %rbx,%r10
   1bc85:	49 89 d5             	mov    %rdx,%r13
   1bc88:	49 d3 ed             	shr    %cl,%r13
   1bc8b:	4d 09 fa             	or     %r15,%r10
   1bc8e:	49 d1 ed             	shr    $1,%r13
   1bc91:	41 01 fd             	add    %edi,%r13d
   1bc94:	45 31 e4             	xor    %r12d,%r12d
   1bc97:	49 85 f1             	test   %rsi,%r9
   1bc9a:	41 0f 95 c4          	setne  %r12b
   1bc9e:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1bca3:	49 0f bd ca          	bsr    %r10,%rcx
   1bca7:	83 f1 3f             	xor    $0x3f,%ecx
   1bcaa:	01 f9                	add    %edi,%ecx
   1bcac:	83 c1 c1             	add    $0xffffffc1,%ecx
   1bcaf:	31 ed                	xor    %ebp,%ebp
   1bcb1:	4c 0f a5 d5          	shld   %cl,%r10,%rbp
   1bcb5:	49 d3 e2             	shl    %cl,%r10
   1bcb8:	45 31 ff             	xor    %r15d,%r15d
   1bcbb:	f6 c1 40             	test   $0x40,%cl
   1bcbe:	49 0f 45 ea          	cmovne %r10,%rbp
   1bcc2:	4d 0f 45 d7          	cmovne %r15,%r10
   1bcc6:	44 01 e9             	add    %r13d,%ecx
   1bcc9:	41 29 cb             	sub    %ecx,%r11d
   1bccc:	49 c1 e4 20          	shl    $0x20,%r12
   1bcd0:	4d 09 dc             	or     %r11,%r12
   1bcd3:	4d 89 c7             	mov    %r8,%r15
   1bcd6:	49 21 d7             	and    %rdx,%r15
   1bcd9:	89 f9                	mov    %edi,%ecx
   1bcdb:	49 d3 ef             	shr    %cl,%r15
   1bcde:	4d 21 c6             	and    %r8,%r14
   1bce1:	4d 85 ff             	test   %r15,%r15
   1bce4:	41 0f 45 c7          	cmovne %r15d,%eax
   1bce8:	4c 0f 45 fb          	cmovne %rbx,%r15
   1bcec:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1bcf1:	4d 09 f7             	or     %r14,%r15
   1bcf4:	45 31 f6             	xor    %r14d,%r14d
   1bcf7:	48 89 f3             	mov    %rsi,%rbx
   1bcfa:	49 85 f0             	test   %rsi,%r8
   1bcfd:	41 0f 95 c6          	setne  %r14b
   1bd01:	49 0f bd cf          	bsr    %r15,%rcx
   1bd05:	83 f1 3f             	xor    $0x3f,%ecx
   1bd08:	01 f9                	add    %edi,%ecx
   1bd0a:	83 c1 c1             	add    $0xffffffc1,%ecx
   1bd0d:	31 ff                	xor    %edi,%edi
   1bd0f:	4c 0f a5 ff          	shld   %cl,%r15,%rdi
   1bd13:	49 d3 e7             	shl    %cl,%r15
   1bd16:	f6 c1 40             	test   $0x40,%cl
   1bd19:	49 0f 45 ff          	cmovne %r15,%rdi
   1bd1d:	be 00 00 00 00       	mov    $0x0,%esi
   1bd22:	4c 0f 45 fe          	cmovne %rsi,%r15
   1bd26:	41 01 cd             	add    %ecx,%r13d
   1bd29:	44 29 e8             	sub    %r13d,%eax
   1bd2c:	49 c1 e6 20          	shl    $0x20,%r14
   1bd30:	49 09 c6             	or     %rax,%r14
   1bd33:	41 39 c3             	cmp    %eax,%r11d
   1bd36:	7d 64                	jge    1bd9c <hyperinterval::ieee::Format::add+0x17c>
   1bd38:	4d 89 e5             	mov    %r12,%r13
   1bd3b:	4d 89 d1             	mov    %r10,%r9
   1bd3e:	45 89 da             	mov    %r11d,%r10d
   1bd41:	44 29 d0             	sub    %r10d,%eax
   1bd44:	83 f8 4a             	cmp    $0x4a,%eax
   1bd47:	48 89 de             	mov    %rbx,%rsi
   1bd4a:	7f 7c                	jg     1bdc8 <hyperinterval::ieee::Format::add+0x1a8>
   1bd4c:	89 c1                	mov    %eax,%ecx
   1bd4e:	4c 0f a5 ff          	shld   %cl,%r15,%rdi
   1bd52:	49 d3 e7             	shl    %cl,%r15
   1bd55:	31 c9                	xor    %ecx,%ecx
   1bd57:	a8 40                	test   $0x40,%al
   1bd59:	49 0f 45 ff          	cmovne %r15,%rdi
   1bd5d:	49 0f 44 cf          	cmove  %r15,%rcx
   1bd61:	49 c1 ee 20          	shr    $0x20,%r14
   1bd65:	49 c1 ed 20          	shr    $0x20,%r13
   1bd69:	4d 39 ee             	cmp    %r13,%r14
   1bd6c:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
   1bd71:	0f 85 a0 00 00 00    	jne    1be17 <hyperinterval::ieee::Format::add+0x1f7>
   1bd77:	49 01 c9             	add    %rcx,%r9
   1bd7a:	48 11 fd             	adc    %rdi,%rbp
   1bd7d:	e9 f4 00 00 00       	jmp    1be76 <hyperinterval::ieee::Format::add+0x256>
   1bd82:	4c 89 43 08          	mov    %r8,0x8(%rbx)
   1bd86:	4c 89 43 10          	mov    %r8,0x10(%rbx)
   1bd8a:	eb 08                	jmp    1bd94 <hyperinterval::ieee::Format::add+0x174>
   1bd8c:	4c 89 4b 08          	mov    %r9,0x8(%rbx)
   1bd90:	4c 89 4b 10          	mov    %r9,0x10(%rbx)
   1bd94:	c6 03 00             	movb   $0x0,(%rbx)
   1bd97:	e9 18 01 00 00       	jmp    1beb4 <hyperinterval::ieee::Format::add+0x294>
   1bd9c:	4d 89 f5             	mov    %r14,%r13
   1bd9f:	4c 89 f9             	mov    %r15,%rcx
   1bda2:	48 89 fe             	mov    %rdi,%rsi
   1bda5:	4d 89 e6             	mov    %r12,%r14
   1bda8:	4d 89 d7             	mov    %r10,%r15
   1bdab:	48 89 ef             	mov    %rbp,%rdi
   1bdae:	48 89 f5             	mov    %rsi,%rbp
   1bdb1:	41 89 c2             	mov    %eax,%r10d
   1bdb4:	44 89 d8             	mov    %r11d,%eax
   1bdb7:	4d 89 c8             	mov    %r9,%r8
   1bdba:	49 89 c9             	mov    %rcx,%r9
   1bdbd:	44 29 d0             	sub    %r10d,%eax
   1bdc0:	83 f8 4a             	cmp    $0x4a,%eax
   1bdc3:	48 89 de             	mov    %rbx,%rsi
   1bdc6:	7e 84                	jle    1bd4c <hyperinterval::ieee::Format::add+0x12c>
   1bdc8:	48 b8 00 00 00 00 01 	movabs $0x100000000,%rax
   1bdcf:	00 00 00 
   1bdd2:	49 85 c5             	test   %rax,%r13
   1bdd5:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
   1bdda:	75 51                	jne    1be2d <hyperinterval::ieee::Format::add+0x20d>
   1bddc:	4c 89 c0             	mov    %r8,%rax
   1bddf:	48 21 f0             	and    %rsi,%rax
   1bde2:	31 c9                	xor    %ecx,%ecx
   1bde4:	48 f7 d8             	neg    %rax
   1bde7:	0f 93 c1             	setae  %cl
   1bdea:	4d 89 c6             	mov    %r8,%r14
   1bded:	49 8d 0c 48          	lea    (%r8,%rcx,2),%rcx
   1bdf1:	48 ff c9             	dec    %rcx
   1bdf4:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1bdf9:	e8 32 10 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1bdfe:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1be03:	75 5b                	jne    1be60 <hyperinterval::ieee::Format::add+0x240>
   1be05:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1be0a:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1be0e:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1be12:	e9 99 00 00 00       	jmp    1beb0 <hyperinterval::ieee::Format::add+0x290>
   1be17:	4c 39 c9             	cmp    %r9,%rcx
   1be1a:	48 89 f8             	mov    %rdi,%rax
   1be1d:	48 19 e8             	sbb    %rbp,%rax
   1be20:	73 48                	jae    1be6a <hyperinterval::ieee::Format::add+0x24a>
   1be22:	49 29 c9             	sub    %rcx,%r9
   1be25:	48 19 fd             	sbb    %rdi,%rbp
   1be28:	4d 89 ee             	mov    %r13,%r14
   1be2b:	eb 49                	jmp    1be76 <hyperinterval::ieee::Format::add+0x256>
   1be2d:	4d 89 c6             	mov    %r8,%r14
   1be30:	4c 89 c0             	mov    %r8,%rax
   1be33:	48 31 f0             	xor    %rsi,%rax
   1be36:	48 89 c1             	mov    %rax,%rcx
   1be39:	48 21 f1             	and    %rsi,%rcx
   1be3c:	31 ff                	xor    %edi,%edi
   1be3e:	48 f7 d9             	neg    %rcx
   1be41:	40 0f 93 c7          	setae  %dil
   1be45:	48 8d 0c 78          	lea    (%rax,%rdi,2),%rcx
   1be49:	48 ff c9             	dec    %rcx
   1be4c:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1be51:	49 89 f7             	mov    %rsi,%r15
   1be54:	e8 d7 0f 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1be59:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1be5e:	74 39                	je     1be99 <hyperinterval::ieee::Format::add+0x279>
   1be60:	c6 43 01 03          	movb   $0x3,0x1(%rbx)
   1be64:	b0 01                	mov    $0x1,%al
   1be66:	88 03                	mov    %al,(%rbx)
   1be68:	eb 4a                	jmp    1beb4 <hyperinterval::ieee::Format::add+0x294>
   1be6a:	4c 29 c9             	sub    %r9,%rcx
   1be6d:	48 19 ef             	sbb    %rbp,%rdi
   1be70:	49 89 c9             	mov    %rcx,%r9
   1be73:	48 89 fd             	mov    %rdi,%rbp
   1be76:	44 88 74 24 24       	mov    %r14b,0x24(%rsp)
   1be7b:	4c 89 4c 24 10       	mov    %r9,0x10(%rsp)
   1be80:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
   1be85:	44 89 54 24 20       	mov    %r10d,0x20(%rsp)
   1be8a:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1be8f:	48 89 df             	mov    %rbx,%rdi
   1be92:	e8 d9 0f 00 00       	call   1ce70 <hyperinterval::ieee::Format::rounded>
   1be97:	eb 1b                	jmp    1beb4 <hyperinterval::ieee::Format::add+0x294>
   1be99:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1be9e:	49 31 c7             	xor    %rax,%r15
   1bea1:	48 85 c0             	test   %rax,%rax
   1bea4:	4c 0f 44 f8          	cmove  %rax,%r15
   1bea8:	4c 89 7b 08          	mov    %r15,0x8(%rbx)
   1beac:	4c 89 73 10          	mov    %r14,0x10(%rbx)
   1beb0:	31 c0                	xor    %eax,%eax
   1beb2:	88 03                	mov    %al,(%rbx)
   1beb4:	48 89 d8             	mov    %rbx,%rax
   1beb7:	48 83 c4 38          	add    $0x38,%rsp
   1bebb:	5b                   	pop    %rbx
   1bebc:	41 5c                	pop    %r12
   1bebe:	41 5d                	pop    %r13
   1bec0:	41 5e                	pop    %r14
   1bec2:	41 5f                	pop    %r15
   1bec4:	5d                   	pop    %rbp
   1bec5:	c3                   	ret
   1bec6:	cc                   	int3
   1bec7:	cc                   	int3
   1bec8:	cc                   	int3
   1bec9:	cc                   	int3
   1beca:	cc                   	int3
   1becb:	cc                   	int3
   1becc:	cc                   	int3
   1becd:	cc                   	int3
   1bece:	cc                   	int3
   1becf:	cc                   	int3

hyperinterval::ieee::Format::div:
   1bed0:	55                   	push   %rbp
   1bed1:	41 57                	push   %r15
   1bed3:	41 56                	push   %r14
   1bed5:	41 55                	push   %r13
   1bed7:	41 54                	push   %r12
   1bed9:	53                   	push   %rbx
   1beda:	48 83 ec 48          	sub    $0x48,%rsp
   1bede:	4d 85 c0             	test   %r8,%r8
   1bee1:	0f 84 cb 00 00 00    	je     1bfb2 <hyperinterval::ieee::Format::div+0xe2>
   1bee7:	48 85 c9             	test   %rcx,%rcx
   1beea:	0f 84 cc 00 00 00    	je     1bfbc <hyperinterval::ieee::Format::div+0xec>
   1bef0:	41 be 40 00 00 00    	mov    $0x40,%r14d
   1bef6:	f3 4c 0f bc f2       	tzcnt  %rdx,%r14
   1befb:	49 89 cd             	mov    %rcx,%r13
   1befe:	49 21 d5             	and    %rdx,%r13
   1bf01:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
   1bf06:	41 83 e6 3f          	and    $0x3f,%r14d
   1bf0a:	48 89 c8             	mov    %rcx,%rax
   1bf0d:	44 89 f1             	mov    %r14d,%ecx
   1bf10:	49 d3 ed             	shr    %cl,%r13
   1bf13:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1bf19:	49 d3 e2             	shl    %cl,%r10
   1bf1c:	4d 8d 5a ff          	lea    -0x1(%r10),%r11
   1bf20:	4c 89 db             	mov    %r11,%rbx
   1bf23:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1bf28:	48 21 c3             	and    %rax,%rbx
   1bf2b:	4d 85 ed             	test   %r13,%r13
   1bf2e:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1bf34:	44 89 e8             	mov    %r13d,%eax
   1bf37:	41 0f 44 c1          	cmove  %r9d,%eax
   1bf3b:	4d 0f 45 ea          	cmovne %r10,%r13
   1bf3f:	4c 89 c5             	mov    %r8,%rbp
   1bf42:	48 21 d5             	and    %rdx,%rbp
   1bf45:	48 d3 ea             	shr    %cl,%rdx
   1bf48:	48 d3 ed             	shr    %cl,%rbp
   1bf4b:	49 09 dd             	or     %rbx,%r13
   1bf4e:	48 d1 ea             	shr    $1,%rdx
   1bf51:	4d 21 c3             	and    %r8,%r11
   1bf54:	48 85 ed             	test   %rbp,%rbp
   1bf57:	44 0f 45 cd          	cmovne %ebp,%r9d
   1bf5b:	49 0f 45 ea          	cmovne %r10,%rbp
   1bf5f:	4c 09 dd             	or     %r11,%rbp
   1bf62:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1bf67:	41 ba 7f 00 00 00    	mov    $0x7f,%r10d
   1bf6d:	4c 0f bd d5          	bsr    %rbp,%r10
   1bf71:	41 83 f2 3f          	xor    $0x3f,%r10d
   1bf75:	41 83 c2 40          	add    $0x40,%r10d
   1bf79:	49 0f bd cd          	bsr    %r13,%rcx
   1bf7d:	83 f1 3f             	xor    $0x3f,%ecx
   1bf80:	45 89 d7             	mov    %r10d,%r15d
   1bf83:	41 29 cf             	sub    %ecx,%r15d
   1bf86:	41 83 c7 c0          	add    $0xffffffc0,%r15d
   1bf8a:	78 3f                	js     1bfcb <hyperinterval::ieee::Format::div+0xfb>
   1bf8c:	45 31 db             	xor    %r11d,%r11d
   1bf8f:	44 89 f9             	mov    %r15d,%ecx
   1bf92:	49 0f a5 eb          	shld   %cl,%rbp,%r11
   1bf96:	31 db                	xor    %ebx,%ebx
   1bf98:	49 89 ec             	mov    %rbp,%r12
   1bf9b:	49 d3 e4             	shl    %cl,%r12
   1bf9e:	41 f6 c7 40          	test   $0x40,%r15b
   1bfa2:	4d 0f 45 dc          	cmovne %r12,%r11
   1bfa6:	4c 0f 45 e3          	cmovne %rbx,%r12
   1bfaa:	4d 39 e5             	cmp    %r12,%r13
   1bfad:	4c 19 db             	sbb    %r11,%rbx
   1bfb0:	eb 3f                	jmp    1bff1 <hyperinterval::ieee::Format::div+0x121>
   1bfb2:	66 c7 07 01 04       	movw   $0x401,(%rdi)
   1bfb7:	e9 24 03 00 00       	jmp    1c2e0 <hyperinterval::ieee::Format::div+0x410>
   1bfbc:	c6 07 00             	movb   $0x0,(%rdi)
   1bfbf:	0f 57 c0             	xorps  %xmm0,%xmm0
   1bfc2:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1bfc6:	e9 15 03 00 00       	jmp    1c2e0 <hyperinterval::ieee::Format::div+0x410>
   1bfcb:	44 89 f9             	mov    %r15d,%ecx
   1bfce:	f6 d9                	neg    %cl
   1bfd0:	45 31 db             	xor    %r11d,%r11d
   1bfd3:	4d 0f a5 eb          	shld   %cl,%r13,%r11
   1bfd7:	31 db                	xor    %ebx,%ebx
   1bfd9:	4d 89 ec             	mov    %r13,%r12
   1bfdc:	49 d3 e4             	shl    %cl,%r12
   1bfdf:	f6 c1 40             	test   $0x40,%cl
   1bfe2:	4d 0f 45 dc          	cmovne %r12,%r11
   1bfe6:	4c 0f 45 e3          	cmovne %rbx,%r12
   1bfea:	49 39 ec             	cmp    %rbp,%r12
   1bfed:	49 83 db 00          	sbb    $0x0,%r11
   1bff1:	0f 92 c1             	setb   %cl
   1bff4:	44 29 c8             	sub    %r9d,%eax
   1bff7:	41 01 c7             	add    %eax,%r15d
   1bffa:	0f b6 c9             	movzbl %cl,%ecx
   1bffd:	41 29 cf             	sub    %ecx,%r15d
   1c000:	41 39 d7             	cmp    %edx,%r15d
   1c003:	0f 8f 19 02 00 00    	jg     1c222 <hyperinterval::ieee::Format::div+0x352>
   1c009:	4c 8b 4c 24 10       	mov    0x10(%rsp),%r9
   1c00e:	46 8d 1c 0a          	lea    (%rdx,%r9,1),%r11d
   1c012:	b9 01 00 00 00       	mov    $0x1,%ecx
   1c017:	4c 89 5c 24 18       	mov    %r11,0x18(%rsp)
   1c01c:	44 29 d9             	sub    %r11d,%ecx
   1c01f:	45 29 cf             	sub    %r9d,%r15d
   1c022:	41 39 cf             	cmp    %ecx,%r15d
   1c025:	44 0f 4e f9          	cmovle %ecx,%r15d
   1c029:	44 29 f8             	sub    %r15d,%eax
   1c02c:	78 61                	js     1c08f <hyperinterval::ieee::Format::div+0x1bf>
   1c02e:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1c033:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
   1c038:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1c03d:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1c042:	48 85 ed             	test   %rbp,%rbp
   1c045:	0f 84 a7 02 00 00    	je     1c2f2 <hyperinterval::ieee::Format::div+0x422>
   1c04b:	45 31 e4             	xor    %r12d,%r12d
   1c04e:	89 c1                	mov    %eax,%ecx
   1c050:	4d 0f a5 ec          	shld   %cl,%r13,%r12
   1c054:	31 d2                	xor    %edx,%edx
   1c056:	49 d3 e5             	shl    %cl,%r13
   1c059:	a8 40                	test   $0x40,%al
   1c05b:	4d 0f 45 e5          	cmovne %r13,%r12
   1c05f:	4c 0f 45 ea          	cmovne %rdx,%r13
   1c063:	4c 89 ef             	mov    %r13,%rdi
   1c066:	4c 89 e6             	mov    %r12,%rsi
   1c069:	48 89 ea             	mov    %rbp,%rdx
   1c06c:	31 c9                	xor    %ecx,%ecx
   1c06e:	ff 15 e4 35 04 00    	call   *0x435e4(%rip)        # 5f658 <_DYNAMIC+0x448>
   1c074:	49 89 c2             	mov    %rax,%r10
   1c077:	49 89 d1             	mov    %rdx,%r9
   1c07a:	48 89 d1             	mov    %rdx,%rcx
   1c07d:	48 0f af cd          	imul   %rbp,%rcx
   1c081:	48 f7 e5             	mul    %rbp
   1c084:	48 01 ca             	add    %rcx,%rdx
   1c087:	49 29 c5             	sub    %rax,%r13
   1c08a:	49 19 d4             	sbb    %rdx,%r12
   1c08d:	eb 79                	jmp    1c108 <hyperinterval::ieee::Format::div+0x238>
   1c08f:	f7 d8                	neg    %eax
   1c091:	44 39 d0             	cmp    %r10d,%eax
   1c094:	7e 07                	jle    1c09d <hyperinterval::ieee::Format::div+0x1cd>
   1c096:	b3 01                	mov    $0x1,%bl
   1c098:	e9 df 00 00 00       	jmp    1c17c <hyperinterval::ieee::Format::div+0x2ac>
   1c09d:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1c0a2:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
   1c0a7:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1c0ac:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1c0b1:	31 db                	xor    %ebx,%ebx
   1c0b3:	89 c1                	mov    %eax,%ecx
   1c0b5:	48 0f a5 eb          	shld   %cl,%rbp,%rbx
   1c0b9:	48 d3 e5             	shl    %cl,%rbp
   1c0bc:	31 c9                	xor    %ecx,%ecx
   1c0be:	a8 40                	test   $0x40,%al
   1c0c0:	48 0f 45 dd          	cmovne %rbp,%rbx
   1c0c4:	48 0f 45 e9          	cmovne %rcx,%rbp
   1c0c8:	48 89 e8             	mov    %rbp,%rax
   1c0cb:	48 09 d8             	or     %rbx,%rax
   1c0ce:	0f 84 2b 02 00 00    	je     1c2ff <hyperinterval::ieee::Format::div+0x42f>
   1c0d4:	45 31 e4             	xor    %r12d,%r12d
   1c0d7:	4c 89 ef             	mov    %r13,%rdi
   1c0da:	31 f6                	xor    %esi,%esi
   1c0dc:	48 89 ea             	mov    %rbp,%rdx
   1c0df:	48 89 d9             	mov    %rbx,%rcx
   1c0e2:	ff 15 70 35 04 00    	call   *0x43570(%rip)        # 5f658 <_DYNAMIC+0x448>
   1c0e8:	49 89 c2             	mov    %rax,%r10
   1c0eb:	49 89 d1             	mov    %rdx,%r9
   1c0ee:	48 0f af d8          	imul   %rax,%rbx
   1c0f2:	48 f7 e5             	mul    %rbp
   1c0f5:	48 01 da             	add    %rbx,%rdx
   1c0f8:	4c 89 c9             	mov    %r9,%rcx
   1c0fb:	48 0f af cd          	imul   %rbp,%rcx
   1c0ff:	48 01 d1             	add    %rdx,%rcx
   1c102:	49 29 c5             	sub    %rax,%r13
   1c105:	49 19 cc             	sbb    %rcx,%r12
   1c108:	4d 09 e5             	or     %r12,%r13
   1c10b:	0f 95 c3             	setne  %bl
   1c10e:	4c 89 d0             	mov    %r10,%rax
   1c111:	4c 09 c8             	or     %r9,%rax
   1c114:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
   1c119:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   1c11e:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
   1c123:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
   1c128:	74 52                	je     1c17c <hyperinterval::ieee::Format::div+0x2ac>
   1c12a:	49 0f bd c1          	bsr    %r9,%rax
   1c12e:	83 f0 3f             	xor    $0x3f,%eax
   1c131:	4d 0f bd da          	bsr    %r10,%r11
   1c135:	41 83 f3 3f          	xor    $0x3f,%r11d
   1c139:	41 83 cb 40          	or     $0x40,%r11d
   1c13d:	4d 85 c9             	test   %r9,%r9
   1c140:	44 0f 45 d8          	cmovne %eax,%r11d
   1c144:	41 83 f3 7f          	xor    $0x7f,%r11d
   1c148:	43 8d 2c 3b          	lea    (%r11,%r15,1),%ebp
   1c14c:	39 d5                	cmp    %edx,%ebp
   1c14e:	0f 8f ce 00 00 00    	jg     1c222 <hyperinterval::ieee::Format::div+0x352>
   1c154:	b8 01 00 00 00       	mov    $0x1,%eax
   1c159:	29 d0                	sub    %edx,%eax
   1c15b:	39 c5                	cmp    %eax,%ebp
   1c15d:	7d 28                	jge    1c187 <hyperinterval::ieee::Format::div+0x2b7>
   1c15f:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1c164:	42 8d 0c 38          	lea    (%rax,%r15,1),%ecx
   1c168:	fe c9                	dec    %cl
   1c16a:	4c 89 d0             	mov    %r10,%rax
   1c16d:	48 d3 e0             	shl    %cl,%rax
   1c170:	45 31 db             	xor    %r11d,%r11d
   1c173:	f6 c1 40             	test   $0x40,%cl
   1c176:	4c 0f 44 d8          	cmove  %rax,%r11
   1c17a:	eb 6e                	jmp    1c1ea <hyperinterval::ieee::Format::div+0x31a>
   1c17c:	45 31 d2             	xor    %r10d,%r10d
   1c17f:	45 31 c9             	xor    %r9d,%r9d
   1c182:	45 31 db             	xor    %r11d,%r11d
   1c185:	eb 63                	jmp    1c1ea <hyperinterval::ieee::Format::div+0x31a>
   1c187:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1c18c:	89 c1                	mov    %eax,%ecx
   1c18e:	44 29 d9             	sub    %r11d,%ecx
   1c191:	4d 89 d4             	mov    %r10,%r12
   1c194:	49 d3 e4             	shl    %cl,%r12
   1c197:	89 c8                	mov    %ecx,%eax
   1c199:	f7 d8                	neg    %eax
   1c19b:	45 31 ed             	xor    %r13d,%r13d
   1c19e:	f6 c1 40             	test   $0x40,%cl
   1c1a1:	4d 0f 44 ec          	cmove  %r12,%r13
   1c1a5:	4d 89 d4             	mov    %r10,%r12
   1c1a8:	89 c1                	mov    %eax,%ecx
   1c1aa:	4d 0f ad cc          	shrd   %cl,%r9,%r12
   1c1ae:	88 5c 24 0f          	mov    %bl,0xf(%rsp)
   1c1b2:	4c 89 cb             	mov    %r9,%rbx
   1c1b5:	48 d3 eb             	shr    %cl,%rbx
   1c1b8:	a8 40                	test   $0x40,%al
   1c1ba:	49 0f 44 dc          	cmove  %r12,%rbx
   1c1be:	44 39 5c 24 10       	cmp    %r11d,0x10(%rsp)
   1c1c3:	49 0f 43 dd          	cmovae %r13,%rbx
   1c1c7:	01 d5                	add    %edx,%ebp
   1c1c9:	48 63 c5             	movslq %ebp,%rax
   1c1cc:	44 89 f1             	mov    %r14d,%ecx
   1c1cf:	48 d3 e0             	shl    %cl,%rax
   1c1d2:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   1c1d9:	49 d3 e3             	shl    %cl,%r11
   1c1dc:	49 f7 d3             	not    %r11
   1c1df:	49 21 db             	and    %rbx,%r11
   1c1e2:	0f b6 5c 24 0f       	movzbl 0xf(%rsp),%ebx
   1c1e7:	49 09 c3             	or     %rax,%r11
   1c1ea:	0f b6 db             	movzbl %bl,%ebx
   1c1ed:	4c 01 d3             	add    %r10,%rbx
   1c1f0:	49 83 d1 00          	adc    $0x0,%r9
   1c1f4:	48 89 d8             	mov    %rbx,%rax
   1c1f7:	4c 09 c8             	or     %r9,%rax
   1c1fa:	74 30                	je     1c22c <hyperinterval::ieee::Format::div+0x35c>
   1c1fc:	49 0f bd c1          	bsr    %r9,%rax
   1c200:	83 f0 3f             	xor    $0x3f,%eax
   1c203:	4c 0f bd d3          	bsr    %rbx,%r10
   1c207:	41 83 f2 3f          	xor    $0x3f,%r10d
   1c20b:	41 83 ca 40          	or     $0x40,%r10d
   1c20f:	4d 85 c9             	test   %r9,%r9
   1c212:	44 0f 45 d0          	cmovne %eax,%r10d
   1c216:	41 83 f2 7f          	xor    $0x7f,%r10d
   1c21a:	43 8d 2c 3a          	lea    (%r10,%r15,1),%ebp
   1c21e:	39 d5                	cmp    %edx,%ebp
   1c220:	7e 0e                	jle    1c230 <hyperinterval::ieee::Format::div+0x360>
   1c222:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   1c227:	e9 b4 00 00 00       	jmp    1c2e0 <hyperinterval::ieee::Format::div+0x410>
   1c22c:	31 c0                	xor    %eax,%eax
   1c22e:	eb 76                	jmp    1c2a6 <hyperinterval::ieee::Format::div+0x3d6>
   1c230:	b8 01 00 00 00       	mov    $0x1,%eax
   1c235:	29 d0                	sub    %edx,%eax
   1c237:	39 c5                	cmp    %eax,%ebp
   1c239:	7d 18                	jge    1c253 <hyperinterval::ieee::Format::div+0x383>
   1c23b:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1c240:	44 01 f9             	add    %r15d,%ecx
   1c243:	fe c9                	dec    %cl
   1c245:	48 d3 e3             	shl    %cl,%rbx
   1c248:	31 c0                	xor    %eax,%eax
   1c24a:	f6 c1 40             	test   $0x40,%cl
   1c24d:	48 0f 44 c3          	cmove  %rbx,%rax
   1c251:	eb 53                	jmp    1c2a6 <hyperinterval::ieee::Format::div+0x3d6>
   1c253:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   1c258:	44 89 e9             	mov    %r13d,%ecx
   1c25b:	44 29 d1             	sub    %r10d,%ecx
   1c25e:	89 c8                	mov    %ecx,%eax
   1c260:	f7 d8                	neg    %eax
   1c262:	49 89 df             	mov    %rbx,%r15
   1c265:	49 d3 e7             	shl    %cl,%r15
   1c268:	45 31 e4             	xor    %r12d,%r12d
   1c26b:	f6 c1 40             	test   $0x40,%cl
   1c26e:	4d 0f 44 e7          	cmove  %r15,%r12
   1c272:	89 c1                	mov    %eax,%ecx
   1c274:	4c 0f ad cb          	shrd   %cl,%r9,%rbx
   1c278:	49 d3 e9             	shr    %cl,%r9
   1c27b:	a8 40                	test   $0x40,%al
   1c27d:	4c 0f 44 cb          	cmove  %rbx,%r9
   1c281:	45 39 d5             	cmp    %r10d,%r13d
   1c284:	4d 0f 43 cc          	cmovae %r12,%r9
   1c288:	01 d5                	add    %edx,%ebp
   1c28a:	48 63 d5             	movslq %ebp,%rdx
   1c28d:	44 89 f1             	mov    %r14d,%ecx
   1c290:	48 d3 e2             	shl    %cl,%rdx
   1c293:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   1c29a:	48 d3 e0             	shl    %cl,%rax
   1c29d:	48 f7 d0             	not    %rax
   1c2a0:	4c 21 c8             	and    %r9,%rax
   1c2a3:	48 09 d0             	or     %rdx,%rax
   1c2a6:	48 85 74 24 40       	test   %rsi,0x40(%rsp)
   1c2ab:	0f 95 c1             	setne  %cl
   1c2ae:	49 85 f0             	test   %rsi,%r8
   1c2b1:	0f 94 c2             	sete   %dl
   1c2b4:	30 ca                	xor    %cl,%dl
   1c2b6:	75 1d                	jne    1c2d5 <hyperinterval::ieee::Format::div+0x405>
   1c2b8:	48 89 c1             	mov    %rax,%rcx
   1c2bb:	48 31 f1             	xor    %rsi,%rcx
   1c2be:	48 85 c0             	test   %rax,%rax
   1c2c1:	48 0f 44 c8          	cmove  %rax,%rcx
   1c2c5:	4c 31 de             	xor    %r11,%rsi
   1c2c8:	4d 85 db             	test   %r11,%r11
   1c2cb:	49 0f 44 f3          	cmove  %r11,%rsi
   1c2cf:	48 89 f0             	mov    %rsi,%rax
   1c2d2:	49 89 cb             	mov    %rcx,%r11
   1c2d5:	4c 89 5f 08          	mov    %r11,0x8(%rdi)
   1c2d9:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1c2dd:	c6 07 00             	movb   $0x0,(%rdi)
   1c2e0:	48 89 f8             	mov    %rdi,%rax
   1c2e3:	48 83 c4 48          	add    $0x48,%rsp
   1c2e7:	5b                   	pop    %rbx
   1c2e8:	41 5c                	pop    %r12
   1c2ea:	41 5d                	pop    %r13
   1c2ec:	41 5e                	pop    %r14
   1c2ee:	41 5f                	pop    %r15
   1c2f0:	5d                   	pop    %rbp
   1c2f1:	c3                   	ret
   1c2f2:	48 8d 3d 97 10 04 00 	lea    0x41097(%rip),%rdi        # 5d390 <__frame_dummy_init_array_entry+0x1f0>
   1c2f9:	ff 15 61 33 04 00    	call   *0x43361(%rip)        # 5f660 <_DYNAMIC+0x450>
   1c2ff:	48 8d 3d 72 10 04 00 	lea    0x41072(%rip),%rdi        # 5d378 <__frame_dummy_init_array_entry+0x1d8>
   1c306:	ff 15 54 33 04 00    	call   *0x43354(%rip)        # 5f660 <_DYNAMIC+0x450>
   1c30c:	cc                   	int3
   1c30d:	cc                   	int3
   1c30e:	cc                   	int3
   1c30f:	cc                   	int3

hyperinterval::ieee::Format::mul:
   1c310:	55                   	push   %rbp
   1c311:	41 57                	push   %r15
   1c313:	41 56                	push   %r14
   1c315:	41 54                	push   %r12
   1c317:	53                   	push   %rbx
   1c318:	48 83 ec 20          	sub    $0x20,%rsp
   1c31c:	48 89 c8             	mov    %rcx,%rax
   1c31f:	49 89 d1             	mov    %rdx,%r9
   1c322:	b9 40 00 00 00       	mov    $0x40,%ecx
   1c327:	f3 48 0f bc ca       	tzcnt  %rdx,%rcx
   1c32c:	48 89 c2             	mov    %rax,%rdx
   1c32f:	4c 21 ca             	and    %r9,%rdx
   1c332:	48 d3 ea             	shr    %cl,%rdx
   1c335:	41 be 01 00 00 00    	mov    $0x1,%r14d
   1c33b:	49 d3 e6             	shl    %cl,%r14
   1c33e:	4d 8d 66 ff          	lea    -0x1(%r14),%r12
   1c342:	4c 89 e3             	mov    %r12,%rbx
   1c345:	48 21 c3             	and    %rax,%rbx
   1c348:	48 85 d2             	test   %rdx,%rdx
   1c34b:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1c351:	41 89 d3             	mov    %edx,%r11d
   1c354:	45 0f 44 da          	cmove  %r10d,%r11d
   1c358:	49 0f 45 d6          	cmovne %r14,%rdx
   1c35c:	48 09 da             	or     %rbx,%rdx
   1c35f:	4d 89 cf             	mov    %r9,%r15
   1c362:	49 d3 ef             	shr    %cl,%r15
   1c365:	48 85 f0             	test   %rsi,%rax
   1c368:	40 0f 95 c5          	setne  %bpl
   1c36c:	4c 89 c0             	mov    %r8,%rax
   1c36f:	4c 21 c8             	and    %r9,%rax
   1c372:	48 d3 e8             	shr    %cl,%rax
   1c375:	4d 21 c4             	and    %r8,%r12
   1c378:	48 85 c0             	test   %rax,%rax
   1c37b:	44 0f 45 d0          	cmovne %eax,%r10d
   1c37f:	48 89 fb             	mov    %rdi,%rbx
   1c382:	49 0f 45 c6          	cmovne %r14,%rax
   1c386:	4c 09 e0             	or     %r12,%rax
   1c389:	49 85 f0             	test   %rsi,%r8
   1c38c:	40 0f 95 c7          	setne  %dil
   1c390:	40 30 ef             	xor    %bpl,%dil
   1c393:	48 f7 e2             	mul    %rdx
   1c396:	45 01 da             	add    %r11d,%r10d
   1c399:	41 8d 0c 4f          	lea    (%r15,%rcx,2),%ecx
   1c39d:	83 e1 fe             	and    $0xfffffffe,%ecx
   1c3a0:	41 29 ca             	sub    %ecx,%r10d
   1c3a3:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
   1c3a8:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1c3ad:	48 89 04 24          	mov    %rax,(%rsp)
   1c3b1:	44 89 54 24 10       	mov    %r10d,0x10(%rsp)
   1c3b6:	48 89 e1             	mov    %rsp,%rcx
   1c3b9:	48 89 df             	mov    %rbx,%rdi
   1c3bc:	4c 89 ca             	mov    %r9,%rdx
   1c3bf:	e8 ac 0a 00 00       	call   1ce70 <hyperinterval::ieee::Format::rounded>
   1c3c4:	48 89 d8             	mov    %rbx,%rax
   1c3c7:	48 83 c4 20          	add    $0x20,%rsp
   1c3cb:	5b                   	pop    %rbx
   1c3cc:	41 5c                	pop    %r12
   1c3ce:	41 5e                	pop    %r14
   1c3d0:	41 5f                	pop    %r15
   1c3d2:	5d                   	pop    %rbp
   1c3d3:	c3                   	ret
   1c3d4:	cc                   	int3
   1c3d5:	cc                   	int3
   1c3d6:	cc                   	int3
   1c3d7:	cc                   	int3
   1c3d8:	cc                   	int3
   1c3d9:	cc                   	int3
   1c3da:	cc                   	int3
   1c3db:	cc                   	int3
   1c3dc:	cc                   	int3
   1c3dd:	cc                   	int3
   1c3de:	cc                   	int3
   1c3df:	cc                   	int3

hyperinterval::ieee::Format::sqrt:
   1c3e0:	55                   	push   %rbp
   1c3e1:	41 57                	push   %r15
   1c3e3:	41 56                	push   %r14
   1c3e5:	41 55                	push   %r13
   1c3e7:	41 54                	push   %r12
   1c3e9:	53                   	push   %rbx
   1c3ea:	48 83 ec 38          	sub    $0x38,%rsp
   1c3ee:	49 89 c8             	mov    %rcx,%r8
   1c3f1:	49 89 d6             	mov    %rdx,%r14
   1c3f4:	41 bc 40 00 00 00    	mov    $0x40,%r12d
   1c3fa:	f3 4c 0f bc e2       	tzcnt  %rdx,%r12
   1c3ff:	48 89 ca             	mov    %rcx,%rdx
   1c402:	4c 21 f2             	and    %r14,%rdx
   1c405:	45 89 e7             	mov    %r12d,%r15d
   1c408:	41 83 e7 3f          	and    $0x3f,%r15d
   1c40c:	44 89 f9             	mov    %r15d,%ecx
   1c40f:	48 d3 ea             	shr    %cl,%rdx
   1c412:	be 01 00 00 00       	mov    $0x1,%esi
   1c417:	48 d3 e6             	shl    %cl,%rsi
   1c41a:	48 89 f8             	mov    %rdi,%rax
   1c41d:	48 8d 7e ff          	lea    -0x1(%rsi),%rdi
   1c421:	4c 21 c7             	and    %r8,%rdi
   1c424:	48 85 d2             	test   %rdx,%rdx
   1c427:	48 0f 44 f2          	cmove  %rdx,%rsi
   1c42b:	49 d3 ee             	shr    %cl,%r14
   1c42e:	48 09 fe             	or     %rdi,%rsi
   1c431:	0f 84 a0 00 00 00    	je     1c4d7 <hyperinterval::ieee::Format::sqrt+0xf7>
   1c437:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
   1c43c:	49 d1 ee             	shr    $1,%r14
   1c43f:	48 85 d2             	test   %rdx,%rdx
   1c442:	b9 01 00 00 00       	mov    $0x1,%ecx
   1c447:	0f 45 ca             	cmovne %edx,%ecx
   1c44a:	44 29 f1             	sub    %r14d,%ecx
   1c44d:	44 29 e1             	sub    %r12d,%ecx
   1c450:	48 0f bd ee          	bsr    %rsi,%rbp
   1c454:	83 f5 3f             	xor    $0x3f,%ebp
   1c457:	83 cd 40             	or     $0x40,%ebp
   1c45a:	83 f5 7f             	xor    $0x7f,%ebp
   1c45d:	01 cd                	add    %ecx,%ebp
   1c45f:	d1 fd                	sar    $1,%ebp
   1c461:	41 89 ed             	mov    %ebp,%r13d
   1c464:	45 29 e5             	sub    %r12d,%r13d
   1c467:	44 29 e9             	sub    %r13d,%ecx
   1c46a:	44 29 e9             	sub    %r13d,%ecx
   1c46d:	31 d2                	xor    %edx,%edx
   1c46f:	48 0f a5 f2          	shld   %cl,%rsi,%rdx
   1c473:	31 db                	xor    %ebx,%ebx
   1c475:	48 d3 e6             	shl    %cl,%rsi
   1c478:	f6 c1 40             	test   $0x40,%cl
   1c47b:	48 0f 45 d6          	cmovne %rsi,%rdx
   1c47f:	48 0f 45 f3          	cmovne %rbx,%rsi
   1c483:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1c488:	e8 f3 0c 00 00       	call   1d180 <hyperinterval::sqrt::integer_sqrt_bounds>
   1c48d:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
   1c492:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
   1c497:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   1c49c:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1c4a1:	4c 89 c0             	mov    %r8,%rax
   1c4a4:	48 09 f8             	or     %rdi,%rax
   1c4a7:	74 59                	je     1c502 <hyperinterval::ieee::Format::sqrt+0x122>
   1c4a9:	48 0f bd c7          	bsr    %rdi,%rax
   1c4ad:	83 f0 3f             	xor    $0x3f,%eax
   1c4b0:	4d 0f bd c8          	bsr    %r8,%r9
   1c4b4:	41 83 f1 3f          	xor    $0x3f,%r9d
   1c4b8:	41 83 c9 40          	or     $0x40,%r9d
   1c4bc:	48 85 ff             	test   %rdi,%rdi
   1c4bf:	44 0f 45 c8          	cmovne %eax,%r9d
   1c4c3:	41 83 f1 7f          	xor    $0x7f,%r9d
   1c4c7:	47 8d 14 29          	lea    (%r9,%r13,1),%r10d
   1c4cb:	45 39 f2             	cmp    %r14d,%r10d
   1c4ce:	7e 13                	jle    1c4e3 <hyperinterval::ieee::Format::sqrt+0x103>
   1c4d0:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c4d5:	eb 5e                	jmp    1c535 <hyperinterval::ieee::Format::sqrt+0x155>
   1c4d7:	0f 57 c0             	xorps  %xmm0,%xmm0
   1c4da:	0f 11 40 08          	movups %xmm0,0x8(%rax)
   1c4de:	e9 43 01 00 00       	jmp    1c626 <hyperinterval::ieee::Format::sqrt+0x246>
   1c4e3:	b8 01 00 00 00       	mov    $0x1,%eax
   1c4e8:	44 29 f0             	sub    %r14d,%eax
   1c4eb:	41 39 c2             	cmp    %eax,%r10d
   1c4ee:	7d 78                	jge    1c568 <hyperinterval::ieee::Format::sqrt+0x188>
   1c4f0:	41 8d 0c 2e          	lea    (%r14,%rbp,1),%ecx
   1c4f4:	fe c9                	dec    %cl
   1c4f6:	49 d3 e0             	shl    %cl,%r8
   1c4f9:	31 db                	xor    %ebx,%ebx
   1c4fb:	f6 c1 40             	test   $0x40,%cl
   1c4fe:	49 0f 44 d8          	cmove  %r8,%rbx
   1c502:	48 89 f0             	mov    %rsi,%rax
   1c505:	48 09 d0             	or     %rdx,%rax
   1c508:	0f 84 b4 00 00 00    	je     1c5c2 <hyperinterval::ieee::Format::sqrt+0x1e2>
   1c50e:	48 0f bd c2          	bsr    %rdx,%rax
   1c512:	83 f0 3f             	xor    $0x3f,%eax
   1c515:	48 0f bd fe          	bsr    %rsi,%rdi
   1c519:	83 f7 3f             	xor    $0x3f,%edi
   1c51c:	83 cf 40             	or     $0x40,%edi
   1c51f:	48 85 d2             	test   %rdx,%rdx
   1c522:	0f 45 f8             	cmovne %eax,%edi
   1c525:	83 f7 7f             	xor    $0x7f,%edi
   1c528:	41 01 fd             	add    %edi,%r13d
   1c52b:	45 39 f5             	cmp    %r14d,%r13d
   1c52e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c533:	7e 0b                	jle    1c540 <hyperinterval::ieee::Format::sqrt+0x160>
   1c535:	c6 40 01 03          	movb   $0x3,0x1(%rax)
   1c539:	b1 01                	mov    $0x1,%cl
   1c53b:	e9 e8 00 00 00       	jmp    1c628 <hyperinterval::ieee::Format::sqrt+0x248>
   1c540:	b9 01 00 00 00       	mov    $0x1,%ecx
   1c545:	44 29 f1             	sub    %r14d,%ecx
   1c548:	41 39 cd             	cmp    %ecx,%r13d
   1c54b:	7d 7e                	jge    1c5cb <hyperinterval::ieee::Format::sqrt+0x1eb>
   1c54d:	41 01 ee             	add    %ebp,%r14d
   1c550:	41 fe ce             	dec    %r14b
   1c553:	44 89 f1             	mov    %r14d,%ecx
   1c556:	48 d3 e6             	shl    %cl,%rsi
   1c559:	31 ff                	xor    %edi,%edi
   1c55b:	41 f6 c6 40          	test   $0x40,%r14b
   1c55f:	48 0f 44 fe          	cmove  %rsi,%rdi
   1c563:	e9 b6 00 00 00       	jmp    1c61e <hyperinterval::ieee::Format::sqrt+0x23e>
   1c568:	44 89 e1             	mov    %r12d,%ecx
   1c56b:	44 29 c9             	sub    %r9d,%ecx
   1c56e:	89 c8                	mov    %ecx,%eax
   1c570:	f7 d8                	neg    %eax
   1c572:	4d 89 c3             	mov    %r8,%r11
   1c575:	49 d3 e3             	shl    %cl,%r11
   1c578:	31 db                	xor    %ebx,%ebx
   1c57a:	f6 c1 40             	test   $0x40,%cl
   1c57d:	49 0f 44 db          	cmove  %r11,%rbx
   1c581:	89 c1                	mov    %eax,%ecx
   1c583:	49 0f ad f8          	shrd   %cl,%rdi,%r8
   1c587:	48 d3 ef             	shr    %cl,%rdi
   1c58a:	a8 40                	test   $0x40,%al
   1c58c:	49 0f 44 f8          	cmove  %r8,%rdi
   1c590:	45 39 cc             	cmp    %r9d,%r12d
   1c593:	48 0f 43 fb          	cmovae %rbx,%rdi
   1c597:	45 01 f2             	add    %r14d,%r10d
   1c59a:	49 63 c2             	movslq %r10d,%rax
   1c59d:	44 89 f9             	mov    %r15d,%ecx
   1c5a0:	48 d3 e0             	shl    %cl,%rax
   1c5a3:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
   1c5aa:	48 d3 e3             	shl    %cl,%rbx
   1c5ad:	48 f7 d3             	not    %rbx
   1c5b0:	48 21 fb             	and    %rdi,%rbx
   1c5b3:	48 09 c3             	or     %rax,%rbx
   1c5b6:	48 89 f0             	mov    %rsi,%rax
   1c5b9:	48 09 d0             	or     %rdx,%rax
   1c5bc:	0f 85 4c ff ff ff    	jne    1c50e <hyperinterval::ieee::Format::sqrt+0x12e>
   1c5c2:	31 ff                	xor    %edi,%edi
   1c5c4:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c5c9:	eb 53                	jmp    1c61e <hyperinterval::ieee::Format::sqrt+0x23e>
   1c5cb:	44 89 e1             	mov    %r12d,%ecx
   1c5ce:	29 f9                	sub    %edi,%ecx
   1c5d0:	41 89 ca             	mov    %ecx,%r10d
   1c5d3:	41 f7 da             	neg    %r10d
   1c5d6:	49 89 f0             	mov    %rsi,%r8
   1c5d9:	49 d3 e0             	shl    %cl,%r8
   1c5dc:	45 31 c9             	xor    %r9d,%r9d
   1c5df:	f6 c1 40             	test   $0x40,%cl
   1c5e2:	4d 0f 44 c8          	cmove  %r8,%r9
   1c5e6:	44 89 d1             	mov    %r10d,%ecx
   1c5e9:	48 0f ad d6          	shrd   %cl,%rdx,%rsi
   1c5ed:	48 d3 ea             	shr    %cl,%rdx
   1c5f0:	41 f6 c2 40          	test   $0x40,%r10b
   1c5f4:	48 0f 44 d6          	cmove  %rsi,%rdx
   1c5f8:	41 39 fc             	cmp    %edi,%r12d
   1c5fb:	49 0f 43 d1          	cmovae %r9,%rdx
   1c5ff:	45 01 f5             	add    %r14d,%r13d
   1c602:	49 63 f5             	movslq %r13d,%rsi
   1c605:	44 89 f9             	mov    %r15d,%ecx
   1c608:	48 d3 e6             	shl    %cl,%rsi
   1c60b:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
   1c612:	48 d3 e7             	shl    %cl,%rdi
   1c615:	48 f7 d7             	not    %rdi
   1c618:	48 21 d7             	and    %rdx,%rdi
   1c61b:	48 09 f7             	or     %rsi,%rdi
   1c61e:	48 89 58 08          	mov    %rbx,0x8(%rax)
   1c622:	48 89 78 10          	mov    %rdi,0x10(%rax)
   1c626:	31 c9                	xor    %ecx,%ecx
   1c628:	88 08                	mov    %cl,(%rax)
   1c62a:	48 83 c4 38          	add    $0x38,%rsp
   1c62e:	5b                   	pop    %rbx
   1c62f:	41 5c                	pop    %r12
   1c631:	41 5d                	pop    %r13
   1c633:	41 5e                	pop    %r14
   1c635:	41 5f                	pop    %r15
   1c637:	5d                   	pop    %rbp
   1c638:	c3                   	ret
   1c639:	cc                   	int3
   1c63a:	cc                   	int3
   1c63b:	cc                   	int3
   1c63c:	cc                   	int3
   1c63d:	cc                   	int3
   1c63e:	cc                   	int3
   1c63f:	cc                   	int3

hyperinterval::ieee::Format::power:
   1c640:	55                   	push   %rbp
   1c641:	41 57                	push   %r15
   1c643:	41 56                	push   %r14
   1c645:	41 55                	push   %r13
   1c647:	41 54                	push   %r12
   1c649:	53                   	push   %rbx
   1c64a:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
   1c651:	49 89 cb             	mov    %rcx,%r11
   1c654:	49 89 d6             	mov    %rdx,%r14
   1c657:	48 85 f1             	test   %rsi,%rcx
   1c65a:	41 0f 95 c1          	setne  %r9b
   1c65e:	b8 40 00 00 00       	mov    $0x40,%eax
   1c663:	f3 48 0f bc c2       	tzcnt  %rdx,%rax
   1c668:	41 89 c2             	mov    %eax,%r10d
   1c66b:	41 83 e2 3f          	and    $0x3f,%r10d
   1c66f:	44 89 d1             	mov    %r10d,%ecx
   1c672:	48 d3 ea             	shr    %cl,%rdx
   1c675:	48 89 d1             	mov    %rdx,%rcx
   1c678:	48 d1 e9             	shr    $1,%rcx
   1c67b:	48 63 d9             	movslq %ecx,%rbx
   1c67e:	44 89 d1             	mov    %r10d,%ecx
   1c681:	48 d3 e3             	shl    %cl,%rbx
   1c684:	45 85 c0             	test   %r8d,%r8d
   1c687:	0f 84 46 03 00 00    	je     1c9d3 <hyperinterval::ieee::Format::power+0x393>
   1c68d:	44 88 4c 24 03       	mov    %r9b,0x3(%rsp)
   1c692:	48 89 7c 24 48       	mov    %rdi,0x48(%rsp)
   1c697:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1c69d:	44 89 d1             	mov    %r10d,%ecx
   1c6a0:	49 d3 e1             	shl    %cl,%r9
   1c6a3:	48 8d 4e ff          	lea    -0x1(%rsi),%rcx
   1c6a7:	49 21 cb             	and    %rcx,%r11
   1c6aa:	48 89 d9             	mov    %rbx,%rcx
   1c6ad:	4d 8d 79 ff          	lea    -0x1(%r9),%r15
   1c6b1:	8d 2c 42             	lea    (%rdx,%rax,2),%ebp
   1c6b4:	83 e5 fe             	and    $0xfffffffe,%ebp
   1c6b7:	ba 02 00 00 00       	mov    $0x2,%edx
   1c6bc:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1c6c1:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1c6c6:	44 89 44 24 68       	mov    %r8d,0x68(%rsp)
   1c6cb:	44 89 c3             	mov    %r8d,%ebx
   1c6ce:	4c 89 5c 24 58       	mov    %r11,0x58(%rsp)
   1c6d3:	4c 89 5c 24 60       	mov    %r11,0x60(%rsp)
   1c6d8:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
   1c6dd:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   1c6e2:	4c 89 8c 24 80 00 00 	mov    %r9,0x80(%rsp)
   1c6e9:	00 
   1c6ea:	4c 89 54 24 78       	mov    %r10,0x78(%rsp)
   1c6ef:	4c 89 7c 24 70       	mov    %r15,0x70(%rsp)
   1c6f4:	89 6c 24 6c          	mov    %ebp,0x6c(%rsp)
   1c6f8:	f6 c3 01             	test   $0x1,%bl
   1c6fb:	0f 84 a4 01 00 00    	je     1c8a5 <hyperinterval::ieee::Format::power+0x265>
   1c701:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   1c708:	0f 1f 84 00 00 00 00 
   1c70f:	00 
   1c710:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
   1c714:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1c719:	48 89 d0             	mov    %rdx,%rax
   1c71c:	4c 21 f0             	and    %r14,%rax
   1c71f:	44 89 d1             	mov    %r10d,%ecx
   1c722:	48 d3 e8             	shr    %cl,%rax
   1c725:	48 89 d1             	mov    %rdx,%rcx
   1c728:	4c 21 f9             	and    %r15,%rcx
   1c72b:	48 85 c0             	test   %rax,%rax
   1c72e:	41 89 c3             	mov    %eax,%r11d
   1c731:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1c737:	45 0f 44 d8          	cmove  %r8d,%r11d
   1c73b:	49 0f 45 c1          	cmovne %r9,%rax
   1c73f:	48 09 c8             	or     %rcx,%rax
   1c742:	48 85 f2             	test   %rsi,%rdx
   1c745:	0f 95 44 24 08       	setne  0x8(%rsp)
   1c74a:	4c 8b 6c 24 60       	mov    0x60(%rsp),%r13
   1c74f:	4c 89 eb             	mov    %r13,%rbx
   1c752:	4c 21 f3             	and    %r14,%rbx
   1c755:	44 89 d1             	mov    %r10d,%ecx
   1c758:	48 d3 eb             	shr    %cl,%rbx
   1c75b:	4c 89 e9             	mov    %r13,%rcx
   1c75e:	4c 21 f9             	and    %r15,%rcx
   1c761:	48 85 db             	test   %rbx,%rbx
   1c764:	41 89 d8             	mov    %ebx,%r8d
   1c767:	ba 01 00 00 00       	mov    $0x1,%edx
   1c76c:	44 0f 44 c2          	cmove  %edx,%r8d
   1c770:	49 0f 45 d9          	cmovne %r9,%rbx
   1c774:	48 09 cb             	or     %rcx,%rbx
   1c777:	49 85 f5             	test   %rsi,%r13
   1c77a:	0f 95 c1             	setne  %cl
   1c77d:	32 4c 24 08          	xor    0x8(%rsp),%cl
   1c781:	48 f7 e3             	mul    %rbx
   1c784:	41 29 e8             	sub    %ebp,%r8d
   1c787:	45 01 d8             	add    %r11d,%r8d
   1c78a:	88 4c 24 24          	mov    %cl,0x24(%rsp)
   1c78e:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1c793:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1c798:	44 89 44 24 20       	mov    %r8d,0x20(%rsp)
   1c79d:	4c 89 f2             	mov    %r14,%rdx
   1c7a0:	4c 89 e1             	mov    %r12,%rcx
   1c7a3:	49 89 fd             	mov    %rdi,%r13
   1c7a6:	4d 89 cc             	mov    %r9,%r12
   1c7a9:	48 89 f3             	mov    %rsi,%rbx
   1c7ac:	4c 89 f5             	mov    %r14,%rbp
   1c7af:	4d 89 d6             	mov    %r10,%r14
   1c7b2:	e8 b9 06 00 00       	call   1ce70 <hyperinterval::ieee::Format::rounded>
   1c7b7:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   1c7bc:	0f 85 00 02 00 00    	jne    1c9c2 <hyperinterval::ieee::Format::power+0x382>
   1c7c2:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
   1c7c7:	48 89 d0             	mov    %rdx,%rax
   1c7ca:	48 21 e8             	and    %rbp,%rax
   1c7cd:	44 89 f1             	mov    %r14d,%ecx
   1c7d0:	48 d3 e8             	shr    %cl,%rax
   1c7d3:	48 89 d1             	mov    %rdx,%rcx
   1c7d6:	4c 21 f9             	and    %r15,%rcx
   1c7d9:	48 85 c0             	test   %rax,%rax
   1c7dc:	89 c6                	mov    %eax,%esi
   1c7de:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1c7e4:	41 0f 44 f2          	cmove  %r10d,%esi
   1c7e8:	49 0f 45 c4          	cmovne %r12,%rax
   1c7ec:	48 09 c8             	or     %rcx,%rax
   1c7ef:	48 85 da             	test   %rbx,%rdx
   1c7f2:	0f 95 c2             	setne  %dl
   1c7f5:	4c 8b 4c 24 58       	mov    0x58(%rsp),%r9
   1c7fa:	4c 89 cf             	mov    %r9,%rdi
   1c7fd:	48 21 ef             	and    %rbp,%rdi
   1c800:	44 89 f1             	mov    %r14d,%ecx
   1c803:	48 d3 ef             	shr    %cl,%rdi
   1c806:	4c 89 c9             	mov    %r9,%rcx
   1c809:	4c 21 f9             	and    %r15,%rcx
   1c80c:	48 85 ff             	test   %rdi,%rdi
   1c80f:	41 89 f8             	mov    %edi,%r8d
   1c812:	45 0f 44 c2          	cmove  %r10d,%r8d
   1c816:	49 0f 45 fc          	cmovne %r12,%rdi
   1c81a:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
   1c81f:	4c 89 54 24 08       	mov    %r10,0x8(%rsp)
   1c824:	48 09 cf             	or     %rcx,%rdi
   1c827:	49 85 d9             	test   %rbx,%r9
   1c82a:	0f 95 c1             	setne  %cl
   1c82d:	30 d1                	xor    %dl,%cl
   1c82f:	48 f7 e7             	mul    %rdi
   1c832:	4d 89 ef             	mov    %r13,%r15
   1c835:	44 8b 6c 24 6c       	mov    0x6c(%rsp),%r13d
   1c83a:	45 29 e8             	sub    %r13d,%r8d
   1c83d:	41 01 f0             	add    %esi,%r8d
   1c840:	88 4c 24 24          	mov    %cl,0x24(%rsp)
   1c844:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1c849:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1c84e:	44 89 44 24 20       	mov    %r8d,0x20(%rsp)
   1c853:	4c 89 ff             	mov    %r15,%rdi
   1c856:	48 89 de             	mov    %rbx,%rsi
   1c859:	48 89 ea             	mov    %rbp,%rdx
   1c85c:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1c861:	4c 89 e1             	mov    %r12,%rcx
   1c864:	e8 07 06 00 00       	call   1ce70 <hyperinterval::ieee::Format::rounded>
   1c869:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   1c86e:	0f 84 4e 01 00 00    	je     1c9c2 <hyperinterval::ieee::Format::power+0x382>
   1c874:	48 89 de             	mov    %rbx,%rsi
   1c877:	49 89 ee             	mov    %rbp,%r14
   1c87a:	44 89 ed             	mov    %r13d,%ebp
   1c87d:	4c 89 ff             	mov    %r15,%rdi
   1c880:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1c885:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1c88a:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1c891:	00 
   1c892:	4c 8b 54 24 78       	mov    0x78(%rsp),%r10
   1c897:	4c 8b 7c 24 70       	mov    0x70(%rsp),%r15
   1c89c:	ba 02 00 00 00       	mov    $0x2,%edx
   1c8a1:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
   1c8a5:	d1 eb                	shr    $1,%ebx
   1c8a7:	0f 84 6c 01 00 00    	je     1ca19 <hyperinterval::ieee::Format::power+0x3d9>
   1c8ad:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
   1c8b1:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   1c8b6:	4c 89 c0             	mov    %r8,%rax
   1c8b9:	4c 21 f0             	and    %r14,%rax
   1c8bc:	44 89 d1             	mov    %r10d,%ecx
   1c8bf:	48 d3 e8             	shr    %cl,%rax
   1c8c2:	4d 21 f8             	and    %r15,%r8
   1c8c5:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
   1c8c8:	48 85 c0             	test   %rax,%rax
   1c8cb:	49 0f 45 c1          	cmovne %r9,%rax
   1c8cf:	0f 44 ca             	cmove  %edx,%ecx
   1c8d2:	4c 09 c0             	or     %r8,%rax
   1c8d5:	48 f7 e0             	mul    %rax
   1c8d8:	29 e9                	sub    %ebp,%ecx
   1c8da:	c6 44 24 24 00       	movb   $0x0,0x24(%rsp)
   1c8df:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1c8e4:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1c8e9:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   1c8ed:	4c 89 f2             	mov    %r14,%rdx
   1c8f0:	4c 89 e1             	mov    %r12,%rcx
   1c8f3:	41 89 ed             	mov    %ebp,%r13d
   1c8f6:	4d 89 cc             	mov    %r9,%r12
   1c8f9:	4c 89 fb             	mov    %r15,%rbx
   1c8fc:	49 89 f7             	mov    %rsi,%r15
   1c8ff:	4c 89 f5             	mov    %r14,%rbp
   1c902:	4d 89 d6             	mov    %r10,%r14
   1c905:	e8 66 05 00 00       	call   1ce70 <hyperinterval::ieee::Format::rounded>
   1c90a:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   1c90f:	0f 85 ad 00 00 00    	jne    1c9c2 <hyperinterval::ieee::Format::power+0x382>
   1c915:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
   1c91a:	48 89 d0             	mov    %rdx,%rax
   1c91d:	48 21 e8             	and    %rbp,%rax
   1c920:	44 89 f1             	mov    %r14d,%ecx
   1c923:	48 d3 e8             	shr    %cl,%rax
   1c926:	48 21 da             	and    %rbx,%rdx
   1c929:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
   1c92c:	48 85 c0             	test   %rax,%rax
   1c92f:	49 0f 45 c4          	cmovne %r12,%rax
   1c933:	be 02 00 00 00       	mov    $0x2,%esi
   1c938:	0f 44 ce             	cmove  %esi,%ecx
   1c93b:	48 09 d0             	or     %rdx,%rax
   1c93e:	48 f7 e0             	mul    %rax
   1c941:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
   1c946:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   1c94b:	44 29 e9             	sub    %r13d,%ecx
   1c94e:	c6 44 24 24 00       	movb   $0x0,0x24(%rsp)
   1c953:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1c958:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1c95d:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   1c961:	48 8d 5c 24 30       	lea    0x30(%rsp),%rbx
   1c966:	48 89 df             	mov    %rbx,%rdi
   1c969:	4c 89 fe             	mov    %r15,%rsi
   1c96c:	48 89 ea             	mov    %rbp,%rdx
   1c96f:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1c974:	4c 89 e1             	mov    %r12,%rcx
   1c977:	e8 f4 04 00 00       	call   1ce70 <hyperinterval::ieee::Format::rounded>
   1c97c:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   1c981:	ba 02 00 00 00       	mov    $0x2,%edx
   1c986:	74 3a                	je     1c9c2 <hyperinterval::ieee::Format::power+0x382>
   1c988:	4c 89 fe             	mov    %r15,%rsi
   1c98b:	49 89 ee             	mov    %rbp,%r14
   1c98e:	44 89 ed             	mov    %r13d,%ebp
   1c991:	48 89 df             	mov    %rbx,%rdi
   1c994:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1c999:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1c99e:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1c9a5:	00 
   1c9a6:	4c 8b 54 24 78       	mov    0x78(%rsp),%r10
   1c9ab:	4c 8b 7c 24 70       	mov    0x70(%rsp),%r15
   1c9b0:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
   1c9b4:	f6 c3 01             	test   $0x1,%bl
   1c9b7:	0f 85 53 fd ff ff    	jne    1c710 <hyperinterval::ieee::Format::power+0xd0>
   1c9bd:	e9 e3 fe ff ff       	jmp    1c8a5 <hyperinterval::ieee::Format::power+0x265>
   1c9c2:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   1c9c7:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
   1c9cc:	88 47 01             	mov    %al,0x1(%rdi)
   1c9cf:	b0 01                	mov    $0x1,%al
   1c9d1:	eb 2f                	jmp    1ca02 <hyperinterval::ieee::Format::power+0x3c2>
   1c9d3:	48 89 d9             	mov    %rbx,%rcx
   1c9d6:	45 20 c1             	and    %r8b,%r9b
   1c9d9:	74 1d                	je     1c9f8 <hyperinterval::ieee::Format::power+0x3b8>
   1c9db:	48 89 d8             	mov    %rbx,%rax
   1c9de:	48 31 f0             	xor    %rsi,%rax
   1c9e1:	48 85 db             	test   %rbx,%rbx
   1c9e4:	48 0f 44 c3          	cmove  %rbx,%rax
   1c9e8:	48 31 ce             	xor    %rcx,%rsi
   1c9eb:	48 85 c9             	test   %rcx,%rcx
   1c9ee:	48 0f 44 f1          	cmove  %rcx,%rsi
   1c9f2:	48 89 c1             	mov    %rax,%rcx
   1c9f5:	48 89 f3             	mov    %rsi,%rbx
   1c9f8:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1c9fc:	48 89 5f 10          	mov    %rbx,0x10(%rdi)
   1ca00:	31 c0                	xor    %eax,%eax
   1ca02:	88 07                	mov    %al,(%rdi)
   1ca04:	48 89 f8             	mov    %rdi,%rax
   1ca07:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
   1ca0e:	5b                   	pop    %rbx
   1ca0f:	41 5c                	pop    %r12
   1ca11:	41 5d                	pop    %r13
   1ca13:	41 5e                	pop    %r14
   1ca15:	41 5f                	pop    %r15
   1ca17:	5d                   	pop    %rbp
   1ca18:	c3                   	ret
   1ca19:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
   1ca1e:	44 8b 44 24 68       	mov    0x68(%rsp),%r8d
   1ca23:	44 0f b6 4c 24 03    	movzbl 0x3(%rsp),%r9d
   1ca29:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
   1ca2e:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1ca33:	45 20 c1             	and    %r8b,%r9b
   1ca36:	75 a3                	jne    1c9db <hyperinterval::ieee::Format::power+0x39b>
   1ca38:	eb be                	jmp    1c9f8 <hyperinterval::ieee::Format::power+0x3b8>
   1ca3a:	cc                   	int3
   1ca3b:	cc                   	int3
   1ca3c:	cc                   	int3
   1ca3d:	cc                   	int3
   1ca3e:	cc                   	int3
   1ca3f:	cc                   	int3

hyperinterval::ieee::Format::affine:
   1ca40:	55                   	push   %rbp
   1ca41:	41 57                	push   %r15
   1ca43:	41 56                	push   %r14
   1ca45:	41 55                	push   %r13
   1ca47:	41 54                	push   %r12
   1ca49:	53                   	push   %rbx
   1ca4a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   1ca51:	48 89 c8             	mov    %rcx,%rax
   1ca54:	49 89 d6             	mov    %rdx,%r14
   1ca57:	b9 40 00 00 00       	mov    $0x40,%ecx
   1ca5c:	f3 48 0f bc ca       	tzcnt  %rdx,%rcx
   1ca61:	48 89 c2             	mov    %rax,%rdx
   1ca64:	4c 21 f2             	and    %r14,%rdx
   1ca67:	48 d3 ea             	shr    %cl,%rdx
   1ca6a:	41 bb 01 00 00 00    	mov    $0x1,%r11d
   1ca70:	49 d3 e3             	shl    %cl,%r11
   1ca73:	4d 8d 7b ff          	lea    -0x1(%r11),%r15
   1ca77:	4c 89 fb             	mov    %r15,%rbx
   1ca7a:	48 21 c3             	and    %rax,%rbx
   1ca7d:	48 85 d2             	test   %rdx,%rdx
   1ca80:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1ca86:	89 d5                	mov    %edx,%ebp
   1ca88:	41 0f 44 ea          	cmove  %r10d,%ebp
   1ca8c:	48 89 3c 24          	mov    %rdi,(%rsp)
   1ca90:	49 0f 45 d3          	cmovne %r11,%rdx
   1ca94:	4d 89 f5             	mov    %r14,%r13
   1ca97:	49 d3 ed             	shr    %cl,%r13
   1ca9a:	48 09 da             	or     %rbx,%rdx
   1ca9d:	49 d1 ed             	shr    $1,%r13
   1caa0:	41 01 cd             	add    %ecx,%r13d
   1caa3:	44 29 ed             	sub    %r13d,%ebp
   1caa6:	48 85 f0             	test   %rsi,%rax
   1caa9:	0f 95 c3             	setne  %bl
   1caac:	4c 89 c0             	mov    %r8,%rax
   1caaf:	4c 21 f0             	and    %r14,%rax
   1cab2:	48 d3 e8             	shr    %cl,%rax
   1cab5:	4d 89 fc             	mov    %r15,%r12
   1cab8:	4d 21 c4             	and    %r8,%r12
   1cabb:	48 85 c0             	test   %rax,%rax
   1cabe:	89 c7                	mov    %eax,%edi
   1cac0:	41 0f 44 fa          	cmove  %r10d,%edi
   1cac4:	49 0f 45 c3          	cmovne %r11,%rax
   1cac8:	4c 09 e0             	or     %r12,%rax
   1cacb:	44 29 ef             	sub    %r13d,%edi
   1cace:	49 85 f0             	test   %rsi,%r8
   1cad1:	41 0f 95 c0          	setne  %r8b
   1cad5:	01 ef                	add    %ebp,%edi
   1cad7:	4c 89 f5             	mov    %r14,%rbp
   1cada:	4d 89 cc             	mov    %r9,%r12
   1cadd:	4d 21 f4             	and    %r14,%r12
   1cae0:	49 d3 ec             	shr    %cl,%r12
   1cae3:	41 30 d8             	xor    %bl,%r8b
   1cae6:	48 f7 e2             	mul    %rdx
   1cae9:	4d 21 cf             	and    %r9,%r15
   1caec:	4d 85 e4             	test   %r12,%r12
   1caef:	45 0f 45 d4          	cmovne %r12d,%r10d
   1caf3:	4d 0f 45 e3          	cmovne %r11,%r12
   1caf7:	4d 09 fc             	or     %r15,%r12
   1cafa:	45 29 ea             	sub    %r13d,%r10d
   1cafd:	49 85 f1             	test   %rsi,%r9
   1cb00:	0f 95 84 24 84 00 00 	setne  0x84(%rsp)
   1cb07:	00 
   1cb08:	0f 95 c3             	setne  %bl
   1cb0b:	48 89 c1             	mov    %rax,%rcx
   1cb0e:	48 09 d1             	or     %rdx,%rcx
   1cb11:	44 88 44 24 64       	mov    %r8b,0x64(%rsp)
   1cb16:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   1cb1b:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1cb20:	89 7c 24 60          	mov    %edi,0x60(%rsp)
   1cb24:	4c 89 64 24 70       	mov    %r12,0x70(%rsp)
   1cb29:	48 c7 44 24 78 00 00 	movq   $0x0,0x78(%rsp)
   1cb30:	00 00 
   1cb32:	44 89 94 24 80 00 00 	mov    %r10d,0x80(%rsp)
   1cb39:	00 
   1cb3a:	74 79                	je     1cbb5 <hyperinterval::ieee::Format::affine+0x175>
   1cb3c:	4d 85 e4             	test   %r12,%r12
   1cb3f:	74 7b                	je     1cbbc <hyperinterval::ieee::Format::affine+0x17c>
   1cb41:	48 89 6c 24 30       	mov    %rbp,0x30(%rsp)
   1cb46:	48 0f bd ca          	bsr    %rdx,%rcx
   1cb4a:	83 f1 3f             	xor    $0x3f,%ecx
   1cb4d:	4c 0f bd d8          	bsr    %rax,%r11
   1cb51:	41 83 f3 3f          	xor    $0x3f,%r11d
   1cb55:	41 83 cb 40          	or     $0x40,%r11d
   1cb59:	48 85 d2             	test   %rdx,%rdx
   1cb5c:	44 0f 45 d9          	cmovne %ecx,%r11d
   1cb60:	41 83 f3 7f          	xor    $0x7f,%r11d
   1cb64:	41 01 fb             	add    %edi,%r11d
   1cb67:	4d 0f bd fc          	bsr    %r12,%r15
   1cb6b:	41 83 f7 3f          	xor    $0x3f,%r15d
   1cb6f:	41 83 cf 40          	or     $0x40,%r15d
   1cb73:	41 83 f7 7f          	xor    $0x7f,%r15d
   1cb77:	45 01 d7             	add    %r10d,%r15d
   1cb7a:	45 39 df             	cmp    %r11d,%r15d
   1cb7d:	45 0f 4e fb          	cmovle %r11d,%r15d
   1cb81:	41 83 c7 82          	add    $0xffffff82,%r15d
   1cb85:	44 29 ff             	sub    %r15d,%edi
   1cb88:	78 4b                	js     1cbd5 <hyperinterval::ieee::Format::affine+0x195>
   1cb8a:	89 f9                	mov    %edi,%ecx
   1cb8c:	48 0f a5 c2          	shld   %cl,%rax,%rdx
   1cb90:	48 d3 e0             	shl    %cl,%rax
   1cb93:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   1cb9a:	00 00 
   1cb9c:	40 f6 c7 40          	test   $0x40,%dil
   1cba0:	48 0f 45 d0          	cmovne %rax,%rdx
   1cba4:	bd 00 00 00 00       	mov    $0x0,%ebp
   1cba9:	48 0f 44 e8          	cmove  %rax,%rbp
   1cbad:	49 89 d3             	mov    %rdx,%r11
   1cbb0:	e9 9b 00 00 00       	jmp    1cc50 <hyperinterval::ieee::Format::affine+0x210>
   1cbb5:	48 8d 4c 24 70       	lea    0x70(%rsp),%rcx
   1cbba:	eb 05                	jmp    1cbc1 <hyperinterval::ieee::Format::affine+0x181>
   1cbbc:	48 8d 4c 24 50       	lea    0x50(%rsp),%rcx
   1cbc1:	4c 8b 34 24          	mov    (%rsp),%r14
   1cbc5:	4c 89 f7             	mov    %r14,%rdi
   1cbc8:	48 89 ea             	mov    %rbp,%rdx
   1cbcb:	e8 a0 02 00 00       	call   1ce70 <hyperinterval::ieee::Format::rounded>
   1cbd0:	e9 43 02 00 00       	jmp    1ce18 <hyperinterval::ieee::Format::affine+0x3d8>
   1cbd5:	f7 df                	neg    %edi
   1cbd7:	bd 00 00 00 00       	mov    $0x0,%ebp
   1cbdc:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   1cbe2:	83 ff 7f             	cmp    $0x7f,%edi
   1cbe5:	7f 5b                	jg     1cc42 <hyperinterval::ieee::Format::affine+0x202>
   1cbe7:	48 89 c5             	mov    %rax,%rbp
   1cbea:	89 f9                	mov    %edi,%ecx
   1cbec:	48 0f ad d5          	shrd   %cl,%rdx,%rbp
   1cbf0:	49 89 d3             	mov    %rdx,%r11
   1cbf3:	49 d3 eb             	shr    %cl,%r11
   1cbf6:	41 89 dd             	mov    %ebx,%r13d
   1cbf9:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
   1cc00:	48 d3 e3             	shl    %cl,%rbx
   1cc03:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
   1cc0a:	40 f6 c7 40          	test   $0x40,%dil
   1cc0e:	49 0f 45 eb          	cmovne %r11,%rbp
   1cc12:	41 be 00 00 00 00    	mov    $0x0,%r14d
   1cc18:	4d 0f 45 de          	cmovne %r14,%r11
   1cc1c:	48 0f 45 cb          	cmovne %rbx,%rcx
   1cc20:	bf 00 00 00 00       	mov    $0x0,%edi
   1cc25:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
   1cc2a:	49 0f 45 de          	cmovne %r14,%rbx
   1cc2e:	48 f7 d3             	not    %rbx
   1cc31:	48 f7 d1             	not    %rcx
   1cc34:	48 21 d1             	and    %rdx,%rcx
   1cc37:	48 21 c3             	and    %rax,%rbx
   1cc3a:	48 09 cb             	or     %rcx,%rbx
   1cc3d:	44 89 eb             	mov    %r13d,%ebx
   1cc40:	74 0e                	je     1cc50 <hyperinterval::ieee::Format::affine+0x210>
   1cc42:	41 0f b6 c0          	movzbl %r8b,%eax
   1cc46:	f7 d8                	neg    %eax
   1cc48:	83 c8 01             	or     $0x1,%eax
   1cc4b:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
   1cc50:	45 29 fa             	sub    %r15d,%r10d
   1cc53:	78 20                	js     1cc75 <hyperinterval::ieee::Format::affine+0x235>
   1cc55:	31 d2                	xor    %edx,%edx
   1cc57:	44 89 d1             	mov    %r10d,%ecx
   1cc5a:	4c 0f a5 e2          	shld   %cl,%r12,%rdx
   1cc5e:	49 d3 e4             	shl    %cl,%r12
   1cc61:	45 31 ed             	xor    %r13d,%r13d
   1cc64:	41 f6 c2 40          	test   $0x40,%r10b
   1cc68:	49 0f 45 d4          	cmovne %r12,%rdx
   1cc6c:	4d 0f 45 e5          	cmovne %r13,%r12
   1cc70:	4c 89 e0             	mov    %r12,%rax
   1cc73:	eb 58                	jmp    1cccd <hyperinterval::ieee::Format::affine+0x28d>
   1cc75:	41 f7 da             	neg    %r10d
   1cc78:	45 31 ed             	xor    %r13d,%r13d
   1cc7b:	b8 00 00 00 00       	mov    $0x0,%eax
   1cc80:	41 83 fa 7f          	cmp    $0x7f,%r10d
   1cc84:	7f 2d                	jg     1ccb3 <hyperinterval::ieee::Format::affine+0x273>
   1cc86:	4c 89 e0             	mov    %r12,%rax
   1cc89:	44 89 d1             	mov    %r10d,%ecx
   1cc8c:	4c 0f ad e8          	shrd   %cl,%r13,%rax
   1cc90:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
   1cc97:	48 d3 e7             	shl    %cl,%rdi
   1cc9a:	41 f6 c2 40          	test   $0x40,%r10b
   1cc9e:	49 0f 45 c5          	cmovne %r13,%rax
   1cca2:	49 0f 45 fd          	cmovne %r13,%rdi
   1cca6:	48 f7 d7             	not    %rdi
   1cca9:	ba 00 00 00 00       	mov    $0x0,%edx
   1ccae:	4c 85 e7             	test   %r12,%rdi
   1ccb1:	74 1a                	je     1cccd <hyperinterval::ieee::Format::affine+0x28d>
   1ccb3:	4c 89 ea             	mov    %r13,%rdx
   1ccb6:	4c 89 c9             	mov    %r9,%rcx
   1ccb9:	48 21 f1             	and    %rsi,%rcx
   1ccbc:	31 ff                	xor    %edi,%edi
   1ccbe:	48 f7 d9             	neg    %rcx
   1ccc1:	40 0f 93 c7          	setae  %dil
   1ccc5:	44 8d 2c 7d ff ff ff 	lea    -0x1(,%rdi,2),%r13d
   1cccc:	ff 
   1cccd:	49 85 f1             	test   %rsi,%r9
   1ccd0:	0f 95 c1             	setne  %cl
   1ccd3:	41 38 c8             	cmp    %cl,%r8b
   1ccd6:	74 16                	je     1ccee <hyperinterval::ieee::Format::affine+0x2ae>
   1ccd8:	48 39 c5             	cmp    %rax,%rbp
   1ccdb:	4c 89 d9             	mov    %r11,%rcx
   1ccde:	48 19 d1             	sbb    %rdx,%rcx
   1cce1:	73 13                	jae    1ccf6 <hyperinterval::ieee::Format::affine+0x2b6>
   1cce3:	48 29 e8             	sub    %rbp,%rax
   1cce6:	4c 19 da             	sbb    %r11,%rdx
   1cce9:	41 89 d8             	mov    %ebx,%r8d
   1ccec:	eb 14                	jmp    1cd02 <hyperinterval::ieee::Format::affine+0x2c2>
   1ccee:	48 01 e8             	add    %rbp,%rax
   1ccf1:	4c 11 da             	adc    %r11,%rdx
   1ccf4:	eb 0c                	jmp    1cd02 <hyperinterval::ieee::Format::affine+0x2c2>
   1ccf6:	48 29 c5             	sub    %rax,%rbp
   1ccf9:	49 19 d3             	sbb    %rdx,%r11
   1ccfc:	48 89 e8             	mov    %rbp,%rax
   1ccff:	4c 89 da             	mov    %r11,%rdx
   1cd02:	44 88 44 24 24       	mov    %r8b,0x24(%rsp)
   1cd07:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1cd0c:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1cd11:	44 89 7c 24 20       	mov    %r15d,0x20(%rsp)
   1cd16:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1cd1b:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1cd20:	49 89 f4             	mov    %rsi,%r12
   1cd23:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
   1cd28:	48 89 da             	mov    %rbx,%rdx
   1cd2b:	e8 40 01 00 00       	call   1ce70 <hyperinterval::ieee::Format::rounded>
   1cd30:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   1cd35:	75 16                	jne    1cd4d <hyperinterval::ieee::Format::affine+0x30d>
   1cd37:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
   1cd3c:	4c 8b 34 24          	mov    (%rsp),%r14
   1cd40:	41 88 46 01          	mov    %al,0x1(%r14)
   1cd44:	41 c6 06 01          	movb   $0x1,(%r14)
   1cd48:	e9 cb 00 00 00       	jmp    1ce18 <hyperinterval::ieee::Format::affine+0x3d8>
   1cd4d:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
   1cd52:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
   1cd57:	49 39 c7             	cmp    %rax,%r15
   1cd5a:	0f 85 a8 00 00 00    	jne    1ce08 <hyperinterval::ieee::Format::affine+0x3c8>
   1cd60:	44 03 6c 24 08       	add    0x8(%rsp),%r13d
   1cd65:	41 83 fd 01          	cmp    $0x1,%r13d
   1cd69:	74 60                	je     1cdcb <hyperinterval::ieee::Format::affine+0x38b>
   1cd6b:	41 83 fd ff          	cmp    $0xffffffff,%r13d
   1cd6f:	0f 85 93 00 00 00    	jne    1ce08 <hyperinterval::ieee::Format::affine+0x3c8>
   1cd75:	4c 89 f8             	mov    %r15,%rax
   1cd78:	4c 89 e6             	mov    %r12,%rsi
   1cd7b:	4c 31 e0             	xor    %r12,%rax
   1cd7e:	4d 85 ff             	test   %r15,%r15
   1cd81:	49 0f 44 c7          	cmove  %r15,%rax
   1cd85:	48 89 c1             	mov    %rax,%rcx
   1cd88:	4c 21 e1             	and    %r12,%rcx
   1cd8b:	31 d2                	xor    %edx,%edx
   1cd8d:	48 f7 d9             	neg    %rcx
   1cd90:	0f 93 c2             	setae  %dl
   1cd93:	48 8d 0c 50          	lea    (%rax,%rdx,2),%rcx
   1cd97:	48 ff c9             	dec    %rcx
   1cd9a:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1cd9f:	48 89 da             	mov    %rbx,%rdx
   1cda2:	e8 89 00 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1cda7:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1cdac:	75 49                	jne    1cdf7 <hyperinterval::ieee::Format::affine+0x3b7>
   1cdae:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1cdb3:	49 31 c4             	xor    %rax,%r12
   1cdb6:	48 85 c0             	test   %rax,%rax
   1cdb9:	4c 0f 44 e0          	cmove  %rax,%r12
   1cdbd:	4c 8b 34 24          	mov    (%rsp),%r14
   1cdc1:	4d 89 66 08          	mov    %r12,0x8(%r14)
   1cdc5:	4d 89 7e 10          	mov    %r15,0x10(%r14)
   1cdc9:	eb 49                	jmp    1ce14 <hyperinterval::ieee::Format::affine+0x3d4>
   1cdcb:	4c 89 e6             	mov    %r12,%rsi
   1cdce:	4c 89 f8             	mov    %r15,%rax
   1cdd1:	4c 21 e0             	and    %r12,%rax
   1cdd4:	31 c9                	xor    %ecx,%ecx
   1cdd6:	48 f7 d8             	neg    %rax
   1cdd9:	0f 93 c1             	setae  %cl
   1cddc:	49 8d 0c 4f          	lea    (%r15,%rcx,2),%rcx
   1cde0:	48 ff c9             	dec    %rcx
   1cde3:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1cde8:	48 89 da             	mov    %rbx,%rdx
   1cdeb:	e8 40 00 00 00       	call   1ce30 <hyperinterval::ieee::Format::finite>
   1cdf0:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1cdf5:	74 0c                	je     1ce03 <hyperinterval::ieee::Format::affine+0x3c3>
   1cdf7:	4c 8b 34 24          	mov    (%rsp),%r14
   1cdfb:	66 41 c7 06 01 03    	movw   $0x301,(%r14)
   1ce01:	eb 15                	jmp    1ce18 <hyperinterval::ieee::Format::affine+0x3d8>
   1ce03:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1ce08:	4c 8b 34 24          	mov    (%rsp),%r14
   1ce0c:	4d 89 7e 08          	mov    %r15,0x8(%r14)
   1ce10:	49 89 46 10          	mov    %rax,0x10(%r14)
   1ce14:	41 c6 06 00          	movb   $0x0,(%r14)
   1ce18:	4c 89 f0             	mov    %r14,%rax
   1ce1b:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1ce22:	5b                   	pop    %rbx
   1ce23:	41 5c                	pop    %r12
   1ce25:	41 5d                	pop    %r13
   1ce27:	41 5e                	pop    %r14
   1ce29:	41 5f                	pop    %r15
   1ce2b:	5d                   	pop    %rbp
   1ce2c:	c3                   	ret
   1ce2d:	cc                   	int3
   1ce2e:	cc                   	int3
   1ce2f:	cc                   	int3

hyperinterval::ieee::Format::finite:
   1ce30:	48 89 f8             	mov    %rdi,%rax
   1ce33:	48 89 cf             	mov    %rcx,%rdi
   1ce36:	48 f7 d7             	not    %rdi
   1ce39:	48 85 fa             	test   %rdi,%rdx
   1ce3c:	75 09                	jne    1ce47 <hyperinterval::ieee::Format::finite+0x17>
   1ce3e:	c6 40 01 00          	movb   $0x0,0x1(%rax)
   1ce42:	b1 01                	mov    $0x1,%cl
   1ce44:	88 08                	mov    %cl,(%rax)
   1ce46:	c3                   	ret
   1ce47:	48 ff ce             	dec    %rsi
   1ce4a:	48 85 f1             	test   %rsi,%rcx
   1ce4d:	74 09                	je     1ce58 <hyperinterval::ieee::Format::finite+0x28>
   1ce4f:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1ce53:	31 c9                	xor    %ecx,%ecx
   1ce55:	88 08                	mov    %cl,(%rax)
   1ce57:	c3                   	ret
   1ce58:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
   1ce5f:	00 
   1ce60:	31 c9                	xor    %ecx,%ecx
   1ce62:	88 08                	mov    %cl,(%rax)
   1ce64:	c3                   	ret
   1ce65:	cc                   	int3
   1ce66:	cc                   	int3
   1ce67:	cc                   	int3
   1ce68:	cc                   	int3
   1ce69:	cc                   	int3
   1ce6a:	cc                   	int3
   1ce6b:	cc                   	int3
   1ce6c:	cc                   	int3
   1ce6d:	cc                   	int3
   1ce6e:	cc                   	int3
   1ce6f:	cc                   	int3

hyperinterval::ieee::Format::rounded:
   1ce70:	48 89 c8             	mov    %rcx,%rax
   1ce73:	4c 8b 11             	mov    (%rcx),%r10
   1ce76:	4c 8b 59 08          	mov    0x8(%rcx),%r11
   1ce7a:	4c 89 d1             	mov    %r10,%rcx
   1ce7d:	4c 09 d9             	or     %r11,%rcx
   1ce80:	74 79                	je     1cefb <hyperinterval::ieee::Format::rounded+0x8b>
   1ce82:	55                   	push   %rbp
   1ce83:	41 57                	push   %r15
   1ce85:	41 56                	push   %r14
   1ce87:	41 55                	push   %r13
   1ce89:	41 54                	push   %r12
   1ce8b:	53                   	push   %rbx
   1ce8c:	8b 68 10             	mov    0x10(%rax),%ebp
   1ce8f:	49 0f bd cb          	bsr    %r11,%rcx
   1ce93:	83 f1 3f             	xor    $0x3f,%ecx
   1ce96:	4d 0f bd f2          	bsr    %r10,%r14
   1ce9a:	41 83 f6 3f          	xor    $0x3f,%r14d
   1ce9e:	41 83 ce 40          	or     $0x40,%r14d
   1cea2:	4d 85 db             	test   %r11,%r11
   1cea5:	44 0f 45 f1          	cmovne %ecx,%r14d
   1cea9:	bb 40 00 00 00       	mov    $0x40,%ebx
   1ceae:	f3 48 0f bc da       	tzcnt  %rdx,%rbx
   1ceb3:	41 89 d8             	mov    %ebx,%r8d
   1ceb6:	41 83 e0 3f          	and    $0x3f,%r8d
   1ceba:	44 89 c1             	mov    %r8d,%ecx
   1cebd:	48 d3 ea             	shr    %cl,%rdx
   1cec0:	41 83 f6 7f          	xor    $0x7f,%r14d
   1cec4:	41 01 ee             	add    %ebp,%r14d
   1cec7:	48 d1 ea             	shr    $1,%rdx
   1ceca:	41 39 d6             	cmp    %edx,%r14d
   1cecd:	0f 8f 54 01 00 00    	jg     1d027 <hyperinterval::ieee::Format::rounded+0x1b7>
   1ced3:	44 8d 2c 13          	lea    (%rbx,%rdx,1),%r13d
   1ced7:	b9 01 00 00 00       	mov    $0x1,%ecx
   1cedc:	44 29 e9             	sub    %r13d,%ecx
   1cedf:	41 29 de             	sub    %ebx,%r14d
   1cee2:	41 39 ce             	cmp    %ecx,%r14d
   1cee5:	44 0f 4e f1          	cmovle %ecx,%r14d
   1cee9:	44 89 f1             	mov    %r14d,%ecx
   1ceec:	29 e9                	sub    %ebp,%ecx
   1ceee:	83 f9 7f             	cmp    $0x7f,%ecx
   1cef1:	7e 13                	jle    1cf06 <hyperinterval::ieee::Format::rounded+0x96>
   1cef3:	41 b4 01             	mov    $0x1,%r12b
   1cef6:	e9 ea 00 00 00       	jmp    1cfe5 <hyperinterval::ieee::Format::rounded+0x175>
   1cefb:	c6 07 00             	movb   $0x0,(%rdi)
   1cefe:	0f 57 c0             	xorps  %xmm0,%xmm0
   1cf01:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1cf05:	c3                   	ret
   1cf06:	85 c9                	test   %ecx,%ecx
   1cf08:	4c 89 6c 24 f0       	mov    %r13,-0x10(%rsp)
   1cf0d:	0f 8e ad 00 00 00    	jle    1cfc0 <hyperinterval::ieee::Format::rounded+0x150>
   1cf13:	4d 89 d7             	mov    %r10,%r15
   1cf16:	4d 0f ad df          	shrd   %cl,%r11,%r15
   1cf1a:	4d 89 dd             	mov    %r11,%r13
   1cf1d:	49 d3 ed             	shr    %cl,%r13
   1cf20:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
   1cf27:	49 d3 e4             	shl    %cl,%r12
   1cf2a:	48 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%rbp
   1cf31:	45 31 c9             	xor    %r9d,%r9d
   1cf34:	f6 c1 40             	test   $0x40,%cl
   1cf37:	4d 0f 45 fd          	cmovne %r13,%r15
   1cf3b:	4d 0f 45 e9          	cmovne %r9,%r13
   1cf3f:	49 0f 45 ec          	cmovne %r12,%rbp
   1cf43:	4d 0f 45 e1          	cmovne %r9,%r12
   1cf47:	49 f7 d4             	not    %r12
   1cf4a:	48 f7 d5             	not    %rbp
   1cf4d:	4c 21 dd             	and    %r11,%rbp
   1cf50:	4d 21 d4             	and    %r10,%r12
   1cf53:	49 09 ec             	or     %rbp,%r12
   1cf56:	41 0f 95 c4          	setne  %r12b
   1cf5a:	4d 89 eb             	mov    %r13,%r11
   1cf5d:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1cf62:	4c 89 f9             	mov    %r15,%rcx
   1cf65:	4c 09 d9             	or     %r11,%rcx
   1cf68:	74 7b                	je     1cfe5 <hyperinterval::ieee::Format::rounded+0x175>
   1cf6a:	49 0f bd cb          	bsr    %r11,%rcx
   1cf6e:	83 f1 3f             	xor    $0x3f,%ecx
   1cf71:	4d 0f bd ef          	bsr    %r15,%r13
   1cf75:	41 83 f5 3f          	xor    $0x3f,%r13d
   1cf79:	41 83 cd 40          	or     $0x40,%r13d
   1cf7d:	4d 85 db             	test   %r11,%r11
   1cf80:	44 0f 45 e9          	cmovne %ecx,%r13d
   1cf84:	41 83 f5 7f          	xor    $0x7f,%r13d
   1cf88:	43 8d 2c 2e          	lea    (%r14,%r13,1),%ebp
   1cf8c:	39 d5                	cmp    %edx,%ebp
   1cf8e:	0f 8f 93 00 00 00    	jg     1d027 <hyperinterval::ieee::Format::rounded+0x1b7>
   1cf94:	b9 01 00 00 00       	mov    $0x1,%ecx
   1cf99:	29 d1                	sub    %edx,%ecx
   1cf9b:	39 cd                	cmp    %ecx,%ebp
   1cf9d:	0f 8d 53 01 00 00    	jge    1d0f6 <hyperinterval::ieee::Format::rounded+0x286>
   1cfa3:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1cfa8:	43 8d 0c 2e          	lea    (%r14,%r13,1),%ecx
   1cfac:	fe c9                	dec    %cl
   1cfae:	4d 89 f9             	mov    %r15,%r9
   1cfb1:	49 d3 e1             	shl    %cl,%r9
   1cfb4:	45 31 d2             	xor    %r10d,%r10d
   1cfb7:	f6 c1 40             	test   $0x40,%cl
   1cfba:	4d 0f 44 d1          	cmove  %r9,%r10
   1cfbe:	eb 2e                	jmp    1cfee <hyperinterval::ieee::Format::rounded+0x17e>
   1cfc0:	f6 d9                	neg    %cl
   1cfc2:	4d 0f a5 d3          	shld   %cl,%r10,%r11
   1cfc6:	49 d3 e2             	shl    %cl,%r10
   1cfc9:	45 31 e4             	xor    %r12d,%r12d
   1cfcc:	f6 c1 40             	test   $0x40,%cl
   1cfcf:	4d 0f 45 da          	cmovne %r10,%r11
   1cfd3:	41 bf 00 00 00 00    	mov    $0x0,%r15d
   1cfd9:	4d 0f 44 fa          	cmove  %r10,%r15
   1cfdd:	4c 89 f9             	mov    %r15,%rcx
   1cfe0:	4c 09 d9             	or     %r11,%rcx
   1cfe3:	75 85                	jne    1cf6a <hyperinterval::ieee::Format::rounded+0xfa>
   1cfe5:	45 31 ff             	xor    %r15d,%r15d
   1cfe8:	45 31 db             	xor    %r11d,%r11d
   1cfeb:	45 31 d2             	xor    %r10d,%r10d
   1cfee:	45 0f b6 e4          	movzbl %r12b,%r12d
   1cff2:	4d 01 fc             	add    %r15,%r12
   1cff5:	49 83 d3 00          	adc    $0x0,%r11
   1cff9:	4c 89 e1             	mov    %r12,%rcx
   1cffc:	4c 09 d9             	or     %r11,%rcx
   1cfff:	74 30                	je     1d031 <hyperinterval::ieee::Format::rounded+0x1c1>
   1d001:	49 0f bd cb          	bsr    %r11,%rcx
   1d005:	83 f1 3f             	xor    $0x3f,%ecx
   1d008:	4d 0f bd fc          	bsr    %r12,%r15
   1d00c:	41 83 f7 3f          	xor    $0x3f,%r15d
   1d010:	41 83 cf 40          	or     $0x40,%r15d
   1d014:	4d 85 db             	test   %r11,%r11
   1d017:	44 0f 45 f9          	cmovne %ecx,%r15d
   1d01b:	41 83 f7 7f          	xor    $0x7f,%r15d
   1d01f:	43 8d 2c 37          	lea    (%r15,%r14,1),%ebp
   1d023:	39 d5                	cmp    %edx,%ebp
   1d025:	7e 1b                	jle    1d042 <hyperinterval::ieee::Format::rounded+0x1d2>
   1d027:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   1d02c:	e9 ba 00 00 00       	jmp    1d0eb <hyperinterval::ieee::Format::rounded+0x27b>
   1d031:	31 d2                	xor    %edx,%edx
   1d033:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1d037:	0f 84 86 00 00 00    	je     1d0c3 <hyperinterval::ieee::Format::rounded+0x253>
   1d03d:	e9 9e 00 00 00       	jmp    1d0e0 <hyperinterval::ieee::Format::rounded+0x270>
   1d042:	b9 01 00 00 00       	mov    $0x1,%ecx
   1d047:	29 d1                	sub    %edx,%ecx
   1d049:	39 cd                	cmp    %ecx,%ebp
   1d04b:	7d 1e                	jge    1d06b <hyperinterval::ieee::Format::rounded+0x1fb>
   1d04d:	45 01 f5             	add    %r14d,%r13d
   1d050:	41 fe cd             	dec    %r13b
   1d053:	44 89 e9             	mov    %r13d,%ecx
   1d056:	49 d3 e4             	shl    %cl,%r12
   1d059:	31 d2                	xor    %edx,%edx
   1d05b:	41 f6 c5 40          	test   $0x40,%r13b
   1d05f:	49 0f 44 d4          	cmove  %r12,%rdx
   1d063:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1d067:	74 5a                	je     1d0c3 <hyperinterval::ieee::Format::rounded+0x253>
   1d069:	eb 75                	jmp    1d0e0 <hyperinterval::ieee::Format::rounded+0x270>
   1d06b:	89 d9                	mov    %ebx,%ecx
   1d06d:	44 29 f9             	sub    %r15d,%ecx
   1d070:	41 89 c9             	mov    %ecx,%r9d
   1d073:	41 f7 d9             	neg    %r9d
   1d076:	4d 89 e6             	mov    %r12,%r14
   1d079:	49 d3 e6             	shl    %cl,%r14
   1d07c:	45 31 ed             	xor    %r13d,%r13d
   1d07f:	f6 c1 40             	test   $0x40,%cl
   1d082:	4d 0f 44 ee          	cmove  %r14,%r13
   1d086:	44 89 c9             	mov    %r9d,%ecx
   1d089:	4d 0f ad dc          	shrd   %cl,%r11,%r12
   1d08d:	49 d3 eb             	shr    %cl,%r11
   1d090:	41 f6 c1 40          	test   $0x40,%r9b
   1d094:	4d 0f 44 dc          	cmove  %r12,%r11
   1d098:	44 39 fb             	cmp    %r15d,%ebx
   1d09b:	4d 0f 43 dd          	cmovae %r13,%r11
   1d09f:	01 d5                	add    %edx,%ebp
   1d0a1:	4c 63 cd             	movslq %ebp,%r9
   1d0a4:	44 89 c1             	mov    %r8d,%ecx
   1d0a7:	49 d3 e1             	shl    %cl,%r9
   1d0aa:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
   1d0b1:	48 d3 e2             	shl    %cl,%rdx
   1d0b4:	48 f7 d2             	not    %rdx
   1d0b7:	4c 21 da             	and    %r11,%rdx
   1d0ba:	4c 09 ca             	or     %r9,%rdx
   1d0bd:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1d0c1:	75 1d                	jne    1d0e0 <hyperinterval::ieee::Format::rounded+0x270>
   1d0c3:	48 89 d0             	mov    %rdx,%rax
   1d0c6:	48 31 f0             	xor    %rsi,%rax
   1d0c9:	48 85 d2             	test   %rdx,%rdx
   1d0cc:	48 0f 44 c2          	cmove  %rdx,%rax
   1d0d0:	4c 31 d6             	xor    %r10,%rsi
   1d0d3:	4d 85 d2             	test   %r10,%r10
   1d0d6:	49 0f 44 f2          	cmove  %r10,%rsi
   1d0da:	49 89 c2             	mov    %rax,%r10
   1d0dd:	48 89 f2             	mov    %rsi,%rdx
   1d0e0:	4c 89 57 08          	mov    %r10,0x8(%rdi)
   1d0e4:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   1d0e8:	c6 07 00             	movb   $0x0,(%rdi)
   1d0eb:	5b                   	pop    %rbx
   1d0ec:	41 5c                	pop    %r12
   1d0ee:	41 5d                	pop    %r13
   1d0f0:	41 5e                	pop    %r14
   1d0f2:	41 5f                	pop    %r15
   1d0f4:	5d                   	pop    %rbp
   1d0f5:	c3                   	ret
   1d0f6:	89 d9                	mov    %ebx,%ecx
   1d0f8:	44 29 e9             	sub    %r13d,%ecx
   1d0fb:	4d 89 f9             	mov    %r15,%r9
   1d0fe:	49 d3 e1             	shl    %cl,%r9
   1d101:	41 89 ca             	mov    %ecx,%r10d
   1d104:	41 f7 da             	neg    %r10d
   1d107:	48 c7 44 24 e8 00 00 	movq   $0x0,-0x18(%rsp)
   1d10e:	00 00 
   1d110:	f6 c1 40             	test   $0x40,%cl
   1d113:	48 8b 4c 24 e8       	mov    -0x18(%rsp),%rcx
   1d118:	49 0f 44 c9          	cmove  %r9,%rcx
   1d11c:	48 89 4c 24 e8       	mov    %rcx,-0x18(%rsp)
   1d121:	4d 89 f9             	mov    %r15,%r9
   1d124:	44 89 d1             	mov    %r10d,%ecx
   1d127:	4d 0f ad d9          	shrd   %cl,%r11,%r9
   1d12b:	4c 89 4c 24 f8       	mov    %r9,-0x8(%rsp)
   1d130:	4d 89 d9             	mov    %r11,%r9
   1d133:	49 d3 e9             	shr    %cl,%r9
   1d136:	41 f6 c2 40          	test   $0x40,%r10b
   1d13a:	4c 0f 44 4c 24 f8    	cmove  -0x8(%rsp),%r9
   1d140:	44 39 eb             	cmp    %r13d,%ebx
   1d143:	4c 0f 43 4c 24 e8    	cmovae -0x18(%rsp),%r9
   1d149:	01 d5                	add    %edx,%ebp
   1d14b:	4c 63 ed             	movslq %ebp,%r13
   1d14e:	44 89 c1             	mov    %r8d,%ecx
   1d151:	49 d3 e5             	shl    %cl,%r13
   1d154:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
   1d15b:	49 d3 e2             	shl    %cl,%r10
   1d15e:	49 f7 d2             	not    %r10
   1d161:	4d 21 ca             	and    %r9,%r10
   1d164:	4d 09 ea             	or     %r13,%r10
   1d167:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1d16c:	e9 7d fe ff ff       	jmp    1cfee <hyperinterval::ieee::Format::rounded+0x17e>
   1d171:	cc                   	int3
   1d172:	cc                   	int3
   1d173:	cc                   	int3
   1d174:	cc                   	int3
   1d175:	cc                   	int3
   1d176:	cc                   	int3
   1d177:	cc                   	int3
   1d178:	cc                   	int3
   1d179:	cc                   	int3
   1d17a:	cc                   	int3
   1d17b:	cc                   	int3
   1d17c:	cc                   	int3
   1d17d:	cc                   	int3
   1d17e:	cc                   	int3
   1d17f:	cc                   	int3

hyperinterval::sqrt::integer_sqrt_bounds:
   1d180:	55                   	push   %rbp
   1d181:	41 57                	push   %r15
   1d183:	41 56                	push   %r14
   1d185:	41 55                	push   %r13
   1d187:	41 54                	push   %r12
   1d189:	53                   	push   %rbx
   1d18a:	50                   	push   %rax
   1d18b:	49 89 d2             	mov    %rdx,%r10
   1d18e:	48 89 f3             	mov    %rsi,%rbx
   1d191:	49 89 fe             	mov    %rdi,%r14
   1d194:	48 85 d2             	test   %rdx,%rdx
   1d197:	75 37                	jne    1d1d0 <hyperinterval::sqrt::integer_sqrt_bounds+0x50>
   1d199:	48 89 d8             	mov    %rbx,%rax
   1d19c:	48 c1 e8 20          	shr    $0x20,%rax
   1d1a0:	0f 85 3e 01 00 00    	jne    1d2e4 <hyperinterval::sqrt::integer_sqrt_bounds+0x164>
   1d1a6:	48 81 fb 00 00 01 00 	cmp    $0x10000,%rbx
   1d1ad:	0f 83 d1 02 00 00    	jae    1d484 <hyperinterval::sqrt::integer_sqrt_bounds+0x304>
   1d1b3:	48 81 fb 00 01 00 00 	cmp    $0x100,%rbx
   1d1ba:	0f 83 93 03 00 00    	jae    1d553 <hyperinterval::sqrt::integer_sqrt_bounds+0x3d3>
   1d1c0:	48 8d 05 d5 a1 fe ff 	lea    -0x15e2b(%rip),%rax        # 739c <__abi_tag+0x70a0>
   1d1c7:	0f b6 04 58          	movzbl (%rax,%rbx,2),%eax
   1d1cb:	e9 e8 03 00 00       	jmp    1d5b8 <hyperinterval::sqrt::integer_sqrt_bounds+0x438>
   1d1d0:	49 0f bd c2          	bsr    %r10,%rax
   1d1d4:	48 83 f0 3f          	xor    $0x3f,%rax
   1d1d8:	4c 0f bd eb          	bsr    %rbx,%r13
   1d1dc:	49 83 f5 3f          	xor    $0x3f,%r13
   1d1e0:	49 83 cd 40          	or     $0x40,%r13
   1d1e4:	4d 85 d2             	test   %r10,%r10
   1d1e7:	4c 0f 45 e8          	cmovne %rax,%r13
   1d1eb:	44 89 e9             	mov    %r13d,%ecx
   1d1ee:	80 e1 3e             	and    $0x3e,%cl
   1d1f1:	4c 89 14 24          	mov    %r10,(%rsp)
   1d1f5:	4c 89 d5             	mov    %r10,%rbp
   1d1f8:	48 0f a5 dd          	shld   %cl,%rbx,%rbp
   1d1fc:	48 89 d8             	mov    %rbx,%rax
   1d1ff:	48 d3 e0             	shl    %cl,%rax
   1d202:	31 c9                	xor    %ecx,%ecx
   1d204:	41 f6 c5 40          	test   $0x40,%r13b
   1d208:	48 0f 45 e8          	cmovne %rax,%rbp
   1d20c:	41 bf 00 00 00 00    	mov    $0x0,%r15d
   1d212:	4c 0f 44 f8          	cmove  %rax,%r15
   1d216:	48 89 e8             	mov    %rbp,%rax
   1d219:	48 c1 e8 38          	shr    $0x38,%rax
   1d21d:	48 8d 15 78 a1 fe ff 	lea    -0x15e88(%rip),%rdx        # 739c <__abi_tag+0x70a0>
   1d224:	0f b6 34 42          	movzbl (%rdx,%rax,2),%esi
   1d228:	0f b6 54 42 01       	movzbl 0x1(%rdx,%rax,2),%edx
   1d22d:	89 f7                	mov    %esi,%edi
   1d22f:	01 f7                	add    %esi,%edi
   1d231:	c1 e2 04             	shl    $0x4,%edx
   1d234:	48 89 e8             	mov    %rbp,%rax
   1d237:	48 c1 e8 34          	shr    $0x34,%rax
   1d23b:	83 e0 0f             	and    $0xf,%eax
   1d23e:	09 d0                	or     %edx,%eax
   1d240:	31 d2                	xor    %edx,%edx
   1d242:	66 f7 f7             	div    %di
   1d245:	48 89 ef             	mov    %rbp,%rdi
   1d248:	48 c1 ef 30          	shr    $0x30,%rdi
   1d24c:	40 c0 e6 04          	shl    $0x4,%sil
   1d250:	40 0f b6 f6          	movzbl %sil,%esi
   1d254:	01 c6                	add    %eax,%esi
   1d256:	c1 e2 04             	shl    $0x4,%edx
   1d259:	83 e7 0f             	and    $0xf,%edi
   1d25c:	09 d7                	or     %edx,%edi
   1d25e:	0f af c0             	imul   %eax,%eax
   1d261:	66 29 c7             	sub    %ax,%di
   1d264:	8d 44 36 ff          	lea    -0x1(%rsi,%rsi,1),%eax
   1d268:	0f 43 c1             	cmovae %ecx,%eax
   1d26b:	66 83 de 00          	sbb    $0x0,%si
   1d26f:	01 f8                	add    %edi,%eax
   1d271:	0f b7 fe             	movzwl %si,%edi
   1d274:	01 ff                	add    %edi,%edi
   1d276:	0f b7 d0             	movzwl %ax,%edx
   1d279:	c1 e2 08             	shl    $0x8,%edx
   1d27c:	48 89 e8             	mov    %rbp,%rax
   1d27f:	48 c1 e8 28          	shr    $0x28,%rax
   1d283:	0f b6 c0             	movzbl %al,%eax
   1d286:	09 d0                	or     %edx,%eax
   1d288:	31 d2                	xor    %edx,%edx
   1d28a:	f7 f7                	div    %edi
   1d28c:	48 89 ef             	mov    %rbp,%rdi
   1d28f:	48 c1 ef 20          	shr    $0x20,%rdi
   1d293:	c1 e6 08             	shl    $0x8,%esi
   1d296:	44 0f b7 e6          	movzwl %si,%r12d
   1d29a:	41 01 c4             	add    %eax,%r12d
   1d29d:	c1 e2 08             	shl    $0x8,%edx
   1d2a0:	40 0f b6 f7          	movzbl %dil,%esi
   1d2a4:	09 d6                	or     %edx,%esi
   1d2a6:	0f af c0             	imul   %eax,%eax
   1d2a9:	29 c6                	sub    %eax,%esi
   1d2ab:	43 8d 44 24 ff       	lea    -0x1(%r12,%r12,1),%eax
   1d2b0:	0f 43 c1             	cmovae %ecx,%eax
   1d2b3:	8d 14 06             	lea    (%rsi,%rax,1),%edx
   1d2b6:	41 83 dc 00          	sbb    $0x0,%r12d
   1d2ba:	4b 8d 0c 24          	lea    (%r12,%r12,1),%rcx
   1d2be:	48 c1 e2 10          	shl    $0x10,%rdx
   1d2c2:	89 e8                	mov    %ebp,%eax
   1d2c4:	c1 e8 10             	shr    $0x10,%eax
   1d2c7:	48 09 d0             	or     %rdx,%rax
   1d2ca:	48 09 ca             	or     %rcx,%rdx
   1d2cd:	48 c1 ea 20          	shr    $0x20,%rdx
   1d2d1:	66 85 d2             	test   %dx,%dx
   1d2d4:	0f 84 ff 00 00 00    	je     1d3d9 <hyperinterval::sqrt::integer_sqrt_bounds+0x259>
   1d2da:	31 d2                	xor    %edx,%edx
   1d2dc:	48 f7 f1             	div    %rcx
   1d2df:	e9 f9 00 00 00       	jmp    1d3dd <hyperinterval::sqrt::integer_sqrt_bounds+0x25d>
   1d2e4:	48 0f bd f3          	bsr    %rbx,%rsi
   1d2e8:	48 83 f6 3f          	xor    $0x3f,%rsi
   1d2ec:	89 f1                	mov    %esi,%ecx
   1d2ee:	80 e1 3e             	and    $0x3e,%cl
   1d2f1:	48 89 df             	mov    %rbx,%rdi
   1d2f4:	48 d3 e7             	shl    %cl,%rdi
   1d2f7:	48 89 f8             	mov    %rdi,%rax
   1d2fa:	48 c1 e8 38          	shr    $0x38,%rax
   1d2fe:	48 8d 0d 97 a0 fe ff 	lea    -0x15f69(%rip),%rcx        # 739c <__abi_tag+0x70a0>
   1d305:	44 0f b6 04 41       	movzbl (%rcx,%rax,2),%r8d
   1d30a:	0f b6 4c 41 01       	movzbl 0x1(%rcx,%rax,2),%ecx
   1d30f:	45 89 c1             	mov    %r8d,%r9d
   1d312:	45 01 c1             	add    %r8d,%r9d
   1d315:	c1 e1 04             	shl    $0x4,%ecx
   1d318:	48 89 f8             	mov    %rdi,%rax
   1d31b:	48 c1 e8 34          	shr    $0x34,%rax
   1d31f:	83 e0 0f             	and    $0xf,%eax
   1d322:	09 c8                	or     %ecx,%eax
   1d324:	31 d2                	xor    %edx,%edx
   1d326:	66 41 f7 f1          	div    %r9w
   1d32a:	49 89 f9             	mov    %rdi,%r9
   1d32d:	49 c1 e9 30          	shr    $0x30,%r9
   1d331:	31 c9                	xor    %ecx,%ecx
   1d333:	41 c0 e0 04          	shl    $0x4,%r8b
   1d337:	45 0f b6 c0          	movzbl %r8b,%r8d
   1d33b:	41 01 c0             	add    %eax,%r8d
   1d33e:	c1 e2 04             	shl    $0x4,%edx
   1d341:	41 83 e1 0f          	and    $0xf,%r9d
   1d345:	41 09 d1             	or     %edx,%r9d
   1d348:	0f af c0             	imul   %eax,%eax
   1d34b:	66 41 29 c1          	sub    %ax,%r9w
   1d34f:	43 8d 44 00 ff       	lea    -0x1(%r8,%r8,1),%eax
   1d354:	0f 43 c1             	cmovae %ecx,%eax
   1d357:	66 41 83 d8 00       	sbb    $0x0,%r8w
   1d35c:	44 01 c8             	add    %r9d,%eax
   1d35f:	45 0f b7 c8          	movzwl %r8w,%r9d
   1d363:	45 01 c9             	add    %r9d,%r9d
   1d366:	0f b7 d0             	movzwl %ax,%edx
   1d369:	c1 e2 08             	shl    $0x8,%edx
   1d36c:	48 89 f8             	mov    %rdi,%rax
   1d36f:	48 c1 e8 28          	shr    $0x28,%rax
   1d373:	0f b6 c0             	movzbl %al,%eax
   1d376:	09 d0                	or     %edx,%eax
   1d378:	31 d2                	xor    %edx,%edx
   1d37a:	41 f7 f1             	div    %r9d
   1d37d:	49 89 f9             	mov    %rdi,%r9
   1d380:	49 c1 e9 20          	shr    $0x20,%r9
   1d384:	41 c1 e0 08          	shl    $0x8,%r8d
   1d388:	45 0f b7 e0          	movzwl %r8w,%r12d
   1d38c:	41 01 c4             	add    %eax,%r12d
   1d38f:	c1 e2 08             	shl    $0x8,%edx
   1d392:	45 0f b6 c1          	movzbl %r9b,%r8d
   1d396:	41 09 d0             	or     %edx,%r8d
   1d399:	0f af c0             	imul   %eax,%eax
   1d39c:	41 29 c0             	sub    %eax,%r8d
   1d39f:	43 8d 44 24 ff       	lea    -0x1(%r12,%r12,1),%eax
   1d3a4:	0f 43 c1             	cmovae %ecx,%eax
   1d3a7:	41 8d 14 00          	lea    (%r8,%rax,1),%edx
   1d3ab:	41 83 dc 00          	sbb    $0x0,%r12d
   1d3af:	4b 8d 0c 24          	lea    (%r12,%r12,1),%rcx
   1d3b3:	48 c1 e2 10          	shl    $0x10,%rdx
   1d3b7:	89 f8                	mov    %edi,%eax
   1d3b9:	c1 e8 10             	shr    $0x10,%eax
   1d3bc:	48 09 d0             	or     %rdx,%rax
   1d3bf:	48 09 ca             	or     %rcx,%rdx
   1d3c2:	48 c1 ea 20          	shr    $0x20,%rdx
   1d3c6:	66 85 d2             	test   %dx,%dx
   1d3c9:	0f 84 59 01 00 00    	je     1d528 <hyperinterval::sqrt::integer_sqrt_bounds+0x3a8>
   1d3cf:	31 d2                	xor    %edx,%edx
   1d3d1:	48 f7 f1             	div    %rcx
   1d3d4:	e9 53 01 00 00       	jmp    1d52c <hyperinterval::sqrt::integer_sqrt_bounds+0x3ac>
   1d3d9:	31 d2                	xor    %edx,%edx
   1d3db:	f7 f1                	div    %ecx
   1d3dd:	41 c1 e4 10          	shl    $0x10,%r12d
   1d3e1:	49 01 c4             	add    %rax,%r12
   1d3e4:	48 c1 e2 10          	shl    $0x10,%rdx
   1d3e8:	0f b7 cd             	movzwl %bp,%ecx
   1d3eb:	48 09 d1             	or     %rdx,%rcx
   1d3ee:	48 0f af c0          	imul   %rax,%rax
   1d3f2:	31 d2                	xor    %edx,%edx
   1d3f4:	48 29 c1             	sub    %rax,%rcx
   1d3f7:	4b 8d 44 24 ff       	lea    -0x1(%r12,%r12,1),%rax
   1d3fc:	48 0f 42 d0          	cmovb  %rax,%rdx
   1d400:	49 83 dc 00          	sbb    $0x0,%r12
   1d404:	48 8d 3c 11          	lea    (%rcx,%rdx,1),%rdi
   1d408:	4b 8d 14 24          	lea    (%r12,%r12,1),%rdx
   1d40c:	4c 89 e1             	mov    %r12,%rcx
   1d40f:	48 c1 e9 3f          	shr    $0x3f,%rcx
   1d413:	48 89 fe             	mov    %rdi,%rsi
   1d416:	48 c1 ee 20          	shr    $0x20,%rsi
   1d41a:	4c 0f a4 ff 20       	shld   $0x20,%r15,%rdi
   1d41f:	ff 15 33 22 04 00    	call   *0x42233(%rip)        # 5f658 <_DYNAMIC+0x448>
   1d425:	48 89 d6             	mov    %rdx,%rsi
   1d428:	49 c1 e4 20          	shl    $0x20,%r12
   1d42c:	49 01 c4             	add    %rax,%r12
   1d42f:	48 83 d6 00          	adc    $0x0,%rsi
   1d433:	48 89 f0             	mov    %rsi,%rax
   1d436:	49 f7 e4             	mul    %r12
   1d439:	0f 90 c1             	seto   %cl
   1d43c:	48 85 f6             	test   %rsi,%rsi
   1d43f:	40 0f 95 c7          	setne  %dil
   1d443:	40 08 cf             	or     %cl,%dil
   1d446:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   1d44a:	4c 89 e0             	mov    %r12,%rax
   1d44d:	49 f7 e4             	mul    %r12
   1d450:	48 01 ca             	add    %rcx,%rdx
   1d453:	0f 92 c1             	setb   %cl
   1d456:	40 08 f9             	or     %dil,%cl
   1d459:	49 39 c7             	cmp    %rax,%r15
   1d45c:	48 19 d5             	sbb    %rdx,%rbp
   1d45f:	0f 92 c0             	setb   %al
   1d462:	08 c8                	or     %cl,%al
   1d464:	0f b6 c0             	movzbl %al,%eax
   1d467:	49 29 c4             	sub    %rax,%r12
   1d46a:	48 83 de 00          	sbb    $0x0,%rsi
   1d46e:	41 d1 ed             	shr    $1,%r13d
   1d471:	44 89 e9             	mov    %r13d,%ecx
   1d474:	49 0f ad f4          	shrd   %cl,%rsi,%r12
   1d478:	48 d3 ee             	shr    %cl,%rsi
   1d47b:	4c 8b 14 24          	mov    (%rsp),%r10
   1d47f:	e9 3c 01 00 00       	jmp    1d5c0 <hyperinterval::sqrt::integer_sqrt_bounds+0x440>
   1d484:	0f bd f3             	bsr    %ebx,%esi
   1d487:	83 f6 1f             	xor    $0x1f,%esi
   1d48a:	89 f1                	mov    %esi,%ecx
   1d48c:	80 e1 1e             	and    $0x1e,%cl
   1d48f:	49 89 d9             	mov    %rbx,%r9
   1d492:	d3 e3                	shl    %cl,%ebx
   1d494:	89 d8                	mov    %ebx,%eax
   1d496:	c1 e8 18             	shr    $0x18,%eax
   1d499:	48 8d 15 fc 9e fe ff 	lea    -0x16104(%rip),%rdx        # 739c <__abi_tag+0x70a0>
   1d4a0:	0f b6 0c 42          	movzbl (%rdx,%rax,2),%ecx
   1d4a4:	0f b6 54 42 01       	movzbl 0x1(%rdx,%rax,2),%edx
   1d4a9:	89 cf                	mov    %ecx,%edi
   1d4ab:	01 cf                	add    %ecx,%edi
   1d4ad:	c1 e2 04             	shl    $0x4,%edx
   1d4b0:	89 d8                	mov    %ebx,%eax
   1d4b2:	c1 e8 14             	shr    $0x14,%eax
   1d4b5:	83 e0 0f             	and    $0xf,%eax
   1d4b8:	09 d0                	or     %edx,%eax
   1d4ba:	31 d2                	xor    %edx,%edx
   1d4bc:	66 f7 f7             	div    %di
   1d4bf:	89 df                	mov    %ebx,%edi
   1d4c1:	c1 ef 10             	shr    $0x10,%edi
   1d4c4:	45 31 c0             	xor    %r8d,%r8d
   1d4c7:	c0 e1 04             	shl    $0x4,%cl
   1d4ca:	0f b6 c9             	movzbl %cl,%ecx
   1d4cd:	01 c1                	add    %eax,%ecx
   1d4cf:	c1 e2 04             	shl    $0x4,%edx
   1d4d2:	83 e7 0f             	and    $0xf,%edi
   1d4d5:	09 d7                	or     %edx,%edi
   1d4d7:	0f af c0             	imul   %eax,%eax
   1d4da:	66 29 c7             	sub    %ax,%di
   1d4dd:	8d 44 09 ff          	lea    -0x1(%rcx,%rcx,1),%eax
   1d4e1:	41 0f 43 c0          	cmovae %r8d,%eax
   1d4e5:	66 83 d9 00          	sbb    $0x0,%cx
   1d4e9:	01 f8                	add    %edi,%eax
   1d4eb:	0f b7 f9             	movzwl %cx,%edi
   1d4ee:	01 ff                	add    %edi,%edi
   1d4f0:	0f b7 d0             	movzwl %ax,%edx
   1d4f3:	c1 e2 08             	shl    $0x8,%edx
   1d4f6:	0f b6 c7             	movzbl %bh,%eax
   1d4f9:	09 d0                	or     %edx,%eax
   1d4fb:	31 d2                	xor    %edx,%edx
   1d4fd:	f7 f7                	div    %edi
   1d4ff:	c1 e1 08             	shl    $0x8,%ecx
   1d502:	0f b7 f9             	movzwl %cx,%edi
   1d505:	01 c7                	add    %eax,%edi
   1d507:	89 f8                	mov    %edi,%eax
   1d509:	f7 e7                	mul    %edi
   1d50b:	0f 90 c1             	seto   %cl
   1d50e:	39 d8                	cmp    %ebx,%eax
   1d510:	4c 89 cb             	mov    %r9,%rbx
   1d513:	0f 97 c0             	seta   %al
   1d516:	08 c8                	or     %cl,%al
   1d518:	0f b6 c0             	movzbl %al,%eax
   1d51b:	29 c7                	sub    %eax,%edi
   1d51d:	d1 ee                	shr    $1,%esi
   1d51f:	89 f1                	mov    %esi,%ecx
   1d521:	d3 ef                	shr    %cl,%edi
   1d523:	e9 93 00 00 00       	jmp    1d5bb <hyperinterval::sqrt::integer_sqrt_bounds+0x43b>
   1d528:	31 d2                	xor    %edx,%edx
   1d52a:	f7 f1                	div    %ecx
   1d52c:	41 c1 e4 10          	shl    $0x10,%r12d
   1d530:	49 01 c4             	add    %rax,%r12
   1d533:	4c 89 e0             	mov    %r12,%rax
   1d536:	49 f7 e4             	mul    %r12
   1d539:	0f 90 c1             	seto   %cl
   1d53c:	48 39 f8             	cmp    %rdi,%rax
   1d53f:	0f 97 c0             	seta   %al
   1d542:	08 c8                	or     %cl,%al
   1d544:	0f b6 c0             	movzbl %al,%eax
   1d547:	49 29 c4             	sub    %rax,%r12
   1d54a:	d1 ee                	shr    $1,%esi
   1d54c:	89 f1                	mov    %esi,%ecx
   1d54e:	49 d3 ec             	shr    %cl,%r12
   1d551:	eb 6b                	jmp    1d5be <hyperinterval::sqrt::integer_sqrt_bounds+0x43e>
   1d553:	66 0f bd f3          	bsr    %bx,%si
   1d557:	83 f6 0f             	xor    $0xf,%esi
   1d55a:	89 f1                	mov    %esi,%ecx
   1d55c:	80 e1 0e             	and    $0xe,%cl
   1d55f:	89 d8                	mov    %ebx,%eax
   1d561:	d3 e0                	shl    %cl,%eax
   1d563:	89 c7                	mov    %eax,%edi
   1d565:	0f b6 cc             	movzbl %ah,%ecx
   1d568:	48 8d 15 2d 9e fe ff 	lea    -0x161d3(%rip),%rdx        # 739c <__abi_tag+0x70a0>
   1d56f:	44 0f b6 04 4a       	movzbl (%rdx,%rcx,2),%r8d
   1d574:	0f b6 4c 4a 01       	movzbl 0x1(%rdx,%rcx,2),%ecx
   1d579:	45 89 c1             	mov    %r8d,%r9d
   1d57c:	45 01 c1             	add    %r8d,%r9d
   1d57f:	c1 e1 04             	shl    $0x4,%ecx
   1d582:	c1 e8 04             	shr    $0x4,%eax
   1d585:	83 e0 0f             	and    $0xf,%eax
   1d588:	09 c8                	or     %ecx,%eax
   1d58a:	31 d2                	xor    %edx,%edx
   1d58c:	66 41 f7 f1          	div    %r9w
   1d590:	41 c0 e0 04          	shl    $0x4,%r8b
   1d594:	41 0f b6 c8          	movzbl %r8b,%ecx
   1d598:	01 c1                	add    %eax,%ecx
   1d59a:	89 c8                	mov    %ecx,%eax
   1d59c:	66 f7 e1             	mul    %cx
   1d59f:	0f 90 c2             	seto   %dl
   1d5a2:	66 39 f8             	cmp    %di,%ax
   1d5a5:	0f 97 c0             	seta   %al
   1d5a8:	08 d0                	or     %dl,%al
   1d5aa:	0f b6 c0             	movzbl %al,%eax
   1d5ad:	29 c1                	sub    %eax,%ecx
   1d5af:	0f b7 c1             	movzwl %cx,%eax
   1d5b2:	d1 ee                	shr    $1,%esi
   1d5b4:	89 f1                	mov    %esi,%ecx
   1d5b6:	d3 e8                	shr    %cl,%eax
   1d5b8:	0f b7 f8             	movzwl %ax,%edi
   1d5bb:	41 89 fc             	mov    %edi,%r12d
   1d5be:	31 f6                	xor    %esi,%esi
   1d5c0:	4c 89 e1             	mov    %r12,%rcx
   1d5c3:	48 0f af ce          	imul   %rsi,%rcx
   1d5c7:	4c 89 e0             	mov    %r12,%rax
   1d5ca:	49 f7 e4             	mul    %r12
   1d5cd:	48 01 ca             	add    %rcx,%rdx
   1d5d0:	48 01 ca             	add    %rcx,%rdx
   1d5d3:	4c 31 d2             	xor    %r10,%rdx
   1d5d6:	48 31 d8             	xor    %rbx,%rax
   1d5d9:	31 c9                	xor    %ecx,%ecx
   1d5db:	48 09 d0             	or     %rdx,%rax
   1d5de:	0f 95 c1             	setne  %cl
   1d5e1:	4c 01 e1             	add    %r12,%rcx
   1d5e4:	49 89 76 08          	mov    %rsi,0x8(%r14)
   1d5e8:	48 83 d6 00          	adc    $0x0,%rsi
   1d5ec:	4d 89 26             	mov    %r12,(%r14)
   1d5ef:	49 89 4e 10          	mov    %rcx,0x10(%r14)
   1d5f3:	49 89 76 18          	mov    %rsi,0x18(%r14)
   1d5f7:	4c 89 f0             	mov    %r14,%rax
   1d5fa:	48 83 c4 08          	add    $0x8,%rsp
   1d5fe:	5b                   	pop    %rbx
   1d5ff:	41 5c                	pop    %r12
   1d601:	41 5d                	pop    %r13
   1d603:	41 5e                	pop    %r14
   1d605:	41 5f                	pop    %r15
   1d607:	5d                   	pop    %rbp
   1d608:	c3                   	ret
   1d609:	cc                   	int3
   1d60a:	cc                   	int3
   1d60b:	cc                   	int3
   1d60c:	cc                   	int3
   1d60d:	cc                   	int3
   1d60e:	cc                   	int3
   1d60f:	cc                   	int3

hyperinterval::bounds::Bounds<T>::hull:
   1d6a0:	53                   	push   %rbx
   1d6a1:	49 89 d0             	mov    %rdx,%r8
   1d6a4:	48 89 f2             	mov    %rsi,%rdx
   1d6a7:	48 89 f8             	mov    %rdi,%rax
   1d6aa:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1d6b1:	00 00 80 
   1d6b4:	49 89 f9             	mov    %rdi,%r9
   1d6b7:	49 09 f1             	or     %rsi,%r9
   1d6ba:	48 8d 7e ff          	lea    -0x1(%rsi),%rdi
   1d6be:	49 89 c2             	mov    %rax,%r10
   1d6c1:	49 21 fa             	and    %rdi,%r10
   1d6c4:	49 89 f3             	mov    %rsi,%r11
   1d6c7:	4d 29 d3             	sub    %r10,%r11
   1d6ca:	48 85 c0             	test   %rax,%rax
   1d6cd:	4d 0f 49 d9          	cmovns %r9,%r11
   1d6d1:	4d 89 c1             	mov    %r8,%r9
   1d6d4:	49 09 f1             	or     %rsi,%r9
   1d6d7:	4d 89 c2             	mov    %r8,%r10
   1d6da:	49 21 fa             	and    %rdi,%r10
   1d6dd:	48 89 f3             	mov    %rsi,%rbx
   1d6e0:	4c 29 d3             	sub    %r10,%rbx
   1d6e3:	4d 85 c0             	test   %r8,%r8
   1d6e6:	49 0f 49 d9          	cmovns %r9,%rbx
   1d6ea:	49 39 db             	cmp    %rbx,%r11
   1d6ed:	49 0f 47 c0          	cmova  %r8,%rax
   1d6f1:	49 89 d0             	mov    %rdx,%r8
   1d6f4:	49 09 f0             	or     %rsi,%r8
   1d6f7:	49 89 d1             	mov    %rdx,%r9
   1d6fa:	49 21 f9             	and    %rdi,%r9
   1d6fd:	49 89 f2             	mov    %rsi,%r10
   1d700:	4d 29 ca             	sub    %r9,%r10
   1d703:	48 85 d2             	test   %rdx,%rdx
   1d706:	4d 0f 49 d0          	cmovns %r8,%r10
   1d70a:	49 89 c8             	mov    %rcx,%r8
   1d70d:	49 09 f0             	or     %rsi,%r8
   1d710:	48 21 cf             	and    %rcx,%rdi
   1d713:	48 29 fe             	sub    %rdi,%rsi
   1d716:	48 85 c9             	test   %rcx,%rcx
   1d719:	49 0f 49 f0          	cmovns %r8,%rsi
   1d71d:	49 39 f2             	cmp    %rsi,%r10
   1d720:	48 0f 42 d1          	cmovb  %rcx,%rdx
   1d724:	5b                   	pop    %rbx
   1d725:	c3                   	ret
   1d726:	cc                   	int3
   1d727:	cc                   	int3
   1d728:	cc                   	int3
   1d729:	cc                   	int3
   1d72a:	cc                   	int3
   1d72b:	cc                   	int3
   1d72c:	cc                   	int3
   1d72d:	cc                   	int3
   1d72e:	cc                   	int3
   1d72f:	cc                   	int3

hyperinterval::bounds::Bounds<T>::signs:
   1d7c0:	89 f9                	mov    %edi,%ecx
   1d7c2:	41 89 d0             	mov    %edx,%r8d
   1d7c5:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1d7ca:	49 89 c9             	mov    %rcx,%r9
   1d7cd:	49 09 c1             	or     %rax,%r9
   1d7d0:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1d7d6:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1d7dc:	49 29 ca             	sub    %rcx,%r10
   1d7df:	85 ff                	test   %edi,%edi
   1d7e1:	4d 0f 49 d1          	cmovns %r9,%r10
   1d7e5:	4c 89 c7             	mov    %r8,%rdi
   1d7e8:	48 09 c7             	or     %rax,%rdi
   1d7eb:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1d7f2:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   1d7f7:	4c 29 c1             	sub    %r8,%rcx
   1d7fa:	85 d2                	test   %edx,%edx
   1d7fc:	48 0f 49 cf          	cmovns %rdi,%rcx
   1d800:	89 f7                	mov    %esi,%edi
   1d802:	48 89 fa             	mov    %rdi,%rdx
   1d805:	48 09 c2             	or     %rax,%rdx
   1d808:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1d80e:	48 29 f8             	sub    %rdi,%rax
   1d811:	45 31 c0             	xor    %r8d,%r8d
   1d814:	49 39 ca             	cmp    %rcx,%r10
   1d817:	40 0f 92 c7          	setb   %dil
   1d81b:	77 1e                	ja     1d83b <hyperinterval::bounds::Bounds<T>::signs+0x7b>
   1d81d:	85 f6                	test   %esi,%esi
   1d81f:	49 89 d1             	mov    %rdx,%r9
   1d822:	4c 0f 48 c8          	cmovs  %rax,%r9
   1d826:	44 8d 57 02          	lea    0x2(%rdi),%r10d
   1d82a:	4c 39 c9             	cmp    %r9,%rcx
   1d82d:	45 0f b6 ca          	movzbl %r10b,%r9d
   1d831:	41 88 f8             	mov    %dil,%r8b
   1d834:	45 0f 46 c1          	cmovbe %r9d,%r8d
   1d838:	44 89 c7             	mov    %r8d,%edi
   1d83b:	85 f6                	test   %esi,%esi
   1d83d:	48 0f 48 d0          	cmovs  %rax,%rdx
   1d841:	8d 47 04             	lea    0x4(%rdi),%eax
   1d844:	39 ca                	cmp    %ecx,%edx
   1d846:	40 0f b6 cf          	movzbl %dil,%ecx
   1d84a:	0f b6 c0             	movzbl %al,%eax
   1d84d:	0f 46 c1             	cmovbe %ecx,%eax
   1d850:	c3                   	ret
   1d851:	cc                   	int3
   1d852:	cc                   	int3
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

__udivti3:
   5c050:	49 89 d0             	mov    %rdx,%r8
   5c053:	48 85 c9             	test   %rcx,%rcx
   5c056:	74 71                	je     5c0c9 <__udivti3+0x79>
   5c058:	4c 0f bd c9          	bsr    %rcx,%r9
   5c05c:	44 89 ca             	mov    %r9d,%edx
   5c05f:	83 f2 3f             	xor    $0x3f,%edx
   5c062:	b0 40                	mov    $0x40,%al
   5c064:	28 d0                	sub    %dl,%al
   5c066:	4c 89 c2             	mov    %r8,%rdx
   5c069:	49 89 cb             	mov    %rcx,%r11
   5c06c:	89 c1                	mov    %eax,%ecx
   5c06e:	4c 0f ad da          	shrd   %cl,%r11,%rdx
   5c072:	4d 89 da             	mov    %r11,%r10
   5c075:	49 d3 ea             	shr    %cl,%r10
   5c078:	a8 40                	test   $0x40,%al
   5c07a:	4c 0f 44 d2          	cmove  %rdx,%r10
   5c07e:	48 89 f0             	mov    %rsi,%rax
   5c081:	48 0f a4 f8 3f       	shld   $0x3f,%rdi,%rax
   5c086:	48 89 f2             	mov    %rsi,%rdx
   5c089:	48 d1 ea             	shr    $1,%rdx
   5c08c:	49 f7 f2             	div    %r10
   5c08f:	49 89 c2             	mov    %rax,%r10
   5c092:	44 89 c9             	mov    %r9d,%ecx
   5c095:	49 d3 ea             	shr    %cl,%r10
   5c098:	49 83 fa 01          	cmp    $0x1,%r10
   5c09c:	49 83 d2 ff          	adc    $0xffffffffffffffff,%r10
   5c0a0:	4d 89 d9             	mov    %r11,%r9
   5c0a3:	4d 0f af ca          	imul   %r10,%r9
   5c0a7:	4c 89 c0             	mov    %r8,%rax
   5c0aa:	49 f7 e2             	mul    %r10
   5c0ad:	48 89 c1             	mov    %rax,%rcx
   5c0b0:	4c 89 d0             	mov    %r10,%rax
   5c0b3:	4c 01 ca             	add    %r9,%rdx
   5c0b6:	48 29 cf             	sub    %rcx,%rdi
   5c0b9:	48 19 d6             	sbb    %rdx,%rsi
   5c0bc:	4c 39 c7             	cmp    %r8,%rdi
   5c0bf:	4c 19 de             	sbb    %r11,%rsi
   5c0c2:	48 83 d8 ff          	sbb    $0xffffffffffffffff,%rax
   5c0c6:	31 d2                	xor    %edx,%edx
   5c0c8:	c3                   	ret
   5c0c9:	4c 39 c6             	cmp    %r8,%rsi
   5c0cc:	73 0c                	jae    5c0da <__udivti3+0x8a>
   5c0ce:	48 89 f8             	mov    %rdi,%rax
   5c0d1:	48 89 f2             	mov    %rsi,%rdx
   5c0d4:	49 f7 f0             	div    %r8
   5c0d7:	31 d2                	xor    %edx,%edx
   5c0d9:	c3                   	ret
   5c0da:	48 89 f0             	mov    %rsi,%rax
   5c0dd:	4c 09 c0             	or     %r8,%rax
   5c0e0:	48 c1 e8 20          	shr    $0x20,%rax
   5c0e4:	74 15                	je     5c0fb <__udivti3+0xab>
   5c0e6:	48 89 f0             	mov    %rsi,%rax
   5c0e9:	31 d2                	xor    %edx,%edx
   5c0eb:	49 f7 f0             	div    %r8
   5c0ee:	48 89 c1             	mov    %rax,%rcx
   5c0f1:	48 89 f8             	mov    %rdi,%rax
   5c0f4:	49 f7 f0             	div    %r8
   5c0f7:	48 89 ca             	mov    %rcx,%rdx
   5c0fa:	c3                   	ret
   5c0fb:	89 f0                	mov    %esi,%eax
   5c0fd:	31 d2                	xor    %edx,%edx
   5c0ff:	41 f7 f0             	div    %r8d
   5c102:	89 c1                	mov    %eax,%ecx
   5c104:	48 89 f8             	mov    %rdi,%rax
   5c107:	49 f7 f0             	div    %r8
   5c10a:	48 89 ca             	mov    %rcx,%rdx
   5c10d:	c3                   	ret

Disassembly of section .init:
